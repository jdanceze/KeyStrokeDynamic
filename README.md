** Please Install node js on your machine first.
1. Open ammps and import the webproject2.sql in database folder to the phpmyadmin.
2. In Webpage folder Set the username and password in .env file for assessing the database.
	-Now I set as the default which is user=root , password=mysql
	- Do not change the port (SET AS 8080)
3. Before running the js please type "npm i" in the terminal first (Because We did not zip the node_modules in the folder)
4. Type node app.js to run the webpage.
******* Please run on the http://localhost:8080/ (8080 port only)
5. As the first page (/) you require to login so use
	- Username: newuser , Password: newuser (for the normal user login)
	- Username: newadmin , Password: newadmin (for the admin login)
6. If you login as user, it will bring you to the /google.
   If you login as admin, it will bring you to the /admin
