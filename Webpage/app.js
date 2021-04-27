//import to use
const express = require('express')
const mysql = require('mysql')
const app = express()
const session = require('express-session')
const qureystring = require('querystring')
const md5 = require('md5')
const axios = require('axios')
const Base64 = require('js-base64').Base64
const dotenv = require('dotenv');

//set the constant variable
const SESSION_AUTH_USER = 'session-auth-user'
const LOG_LOGIN = 'login'
const LOG_LOGOUT = 'logout'

//setting
app.use(express.static('public'))
app.use(session({
    secret: 'my-session',
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false }
}))
app.use(express.json())
app.use(express.urlencoded({
    extended: true,
}))
//Setting for ejs
app.set('view engine', 'ejs')
app.set('views', './views')
dotenv.config();

//database
const db = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USERNAME,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
})
//Connect database
db.connect(err => {
    if (err) console.error(err)
    else console.log('db connect')
})

//Get user function
function getUser(req) {
    return req.session[SESSION_AUTH_USER] || null
}

//Set user function
function setUser(req, user) {
    req.session[SESSION_AUTH_USER] = user
}

//Clear user function
function clearUser(req) {
    setUser(req, null)
}

//Function to check if the user login or not
function isLogin(req) {
    return getUser(req) != null
}

//Function to check if the user is admin or not
function isAdmin(user) {
    return user.role == 1
}

//Function to add the loging log to database
function logging(userId, username, action) {
    db.query(`INSERT INTO logs(user_id, username, action, at) VALUES(?, ?, ?, now())`, [userId, username, action])
}

//Function when we know that the user is not login yet
function notauth(req, res) {
    if (!isLogin(req)) {
        let query = qureystring.stringify({
            fromUrl: req.originalUrl,
        })
        res.redirect('/')
        return true
    }
    return false
}

//Function when we know that the user is not an admin
function notAdmin(req, res) {
    if (notauth(req, res)) return true;
    if (!isAdmin(getUser(req))) {
        clearUser(req)
        res.redirect('/')
        return true
    }
}

//main login page
app.get('/', (req, res) => {
    res.render('login', {
        invalid: req.query['invalid'] || false,
        fromUrl: req.query['fromUrl'] || '/'
    })
})

//When click login
app.post('/', (req, res) => {
    let { username, password, keyup_time, keydown_time } = req.body

    const inputStart = JSON.parse(keydown_time)
    const inputEnd = JSON.parse(keyup_time)

    console.log(req.body)
    db.query(`SELECT * FROM users WHERE username = ? AND password = ?`,
        [username.toLowerCase(), md5(password)],
        (err, rows) => {
            if (err || rows.length != 1) {
                return res.redirect('/?invalid=1')
            }
            let user = rows[0]


            /// calculate cosin shit
            const getDelta = (arr) => {
                const sortedVal = arr.map(o => Object.values(o)[0]).sort()
                return sortedVal.map((val, index) => index === 0 ? 0 : val - sortedVal[index - 1])
            }
            const calculateCosine = (inputArr, serverArr) => {
                const inputDelta = getDelta(inputArr)
                const serverDelta = getDelta(serverArr)

                const powerSqrt = arr => Math.sqrt(arr.map(v => v * v).reduce((acc, val) => acc + val, 0))

                return ((inputDelta.map((val, i) => val * serverDelta[i]).reduce((acc, val) => acc + val, 0)) / (powerSqrt(inputDelta) * powerSqrt(serverDelta))) * 100
            }

            const similarityKeydown = calculateCosine(inputStart, JSON.parse(user.keydown_time))
            const similarityKeyup = calculateCosine(inputEnd, JSON.parse(user.keyup_time))

            console.log({ similarityKeydown, similarityKeyup })

            if (similarityKeydown >= 85 && similarityKeyup >= 85) {
                delete user.password
                setUser(req, user)
                if (user.role == 1) {
                    res.redirect('/admin')
                    // return res.redirect('/?invalid=1')
                }
                else {
                    res.redirect('/user')
                }
                logging(user.id, user.username, LOG_LOGIN)
            } else {
                return res.redirect('/?invalid=2')
            }
        })
})

//user page
app.get('/user', (req, res) => {
    if (notauth(req, res)) return;
    let user = getUser(req)
    res.render('user', {
        user,
    })

})



//admin page
app.get('/admin', (req, res) => {
    if (notauth(req, res)) return;
    if (notAdmin(req, res)) return;
    let q = req.query['q'] || null
    let user = getUser(req)

    let handler = function (err, rows) {
        res.render('manage', {
            Uinvalid: req.query['Uinvalid'] || false,
            user,
            userList: rows,
            q,
        })
    }
        db.query('SELECT * FROM users', handler)
    
})

//Login logs page
app.get('/log', (req, res) => {
    if (notauth(req, res)) return;
    if (notAdmin(req, res)) return;
    let user = getUser(req)

    let handler = function (err, rows) {
        res.render('loginlog', {
            user,
            userList: rows,
        })
    }
    db.query('SELECT * FROM logs ORDER BY id DESC', handler)

})


//When add the user in admin page
app.post('/create', (req, res) => {
    const { role, username, password, keyup_time, keydown_time } = req.body

    console.log(req.body)

    db.query(`SELECT * FROM users WHERE username = ?`, [username], function (err, rows) {
        if (rows.length !== 0) {
            return res.status(400).send({
                redirect: '/admin?Uinvalid=1'
            })
        } else{
            db.query(
                `INSERT INTO users(role, username, password, keyup_time, keydown_time)
                 VALUES(?,?,?,?,?)`,
                [role, username, md5(password), JSON.stringify(keyup_time), JSON.stringify(keydown_time)],
                function (err) {
                    if (err) {
                        console.error(err)
                    }
                    res.redirect('/admin')
                }
            )
        }
        
    })
    
})

//Each user detail page
app.get('/detail/:id', (req, res) => {
    let id = req.params['id']
    db.query(`SELECT * FROM users WHERE id = ?`, [id], function (err, rows) {
        if (rows.length == 1) {
            let row = rows[0]
            res.render('manage-detail', {
                id: row.id,
                role: row.role,
                username: row.username,

            })
        } else {
            res.status(404).send('Not Found')
        }

    })

})


//When delete the user
app.post('/delete', (req, res) => {
    let id = req.body['id']
    db.query(
        `DELETE FROM users WHERE id = ?`,
        [id],
        function (err) {
            res.redirect('/admin')
        }
    )

})

//When logout
app.get('/logout', (req, res) => {
    let userId = getUser(req).id
    let username = getUser(req).username
    clearUser(req)
    res.redirect('/')
    logging(userId, username, LOG_LOGOUT)
})


//run
app.listen(8080)