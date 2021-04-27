-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 27, 2021 at 05:40 PM
-- Server version: 8.0.23
-- PHP Version: 7.3.24-(to be removed in future macOS)

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webproject2`
--

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `username`, `action`, `at`) VALUES
(189, 16, 'newuser', 'login', '2021-04-28 00:15:32'),
(190, 16, 'newuser', 'login', '2021-04-28 00:15:59'),
(191, 16, 'newuser', 'login', '2021-04-28 00:16:27'),
(192, 16, 'newuser', 'logout', '2021-04-28 00:19:49'),
(193, 15, 'newadmin', 'login', '2021-04-28 00:20:31'),
(194, 15, 'newadmin', 'login', '2021-04-28 00:29:15'),
(195, 15, 'newadmin', 'login', '2021-04-28 00:30:22'),
(196, 15, 'newadmin', 'login', '2021-04-28 00:30:24'),
(197, 15, 'newadmin', 'login', '2021-04-28 00:30:48'),
(198, 15, 'newadmin', 'login', '2021-04-28 00:31:59'),
(199, 15, 'newadmin', 'login', '2021-04-28 00:32:37'),
(200, 15, 'newadmin', 'login', '2021-04-28 00:34:03'),
(201, 15, 'newadmin', 'login', '2021-04-28 00:35:30'),
(202, 15, 'newadmin', 'logout', '2021-04-28 00:36:04'),
(203, 17, 'newadmin2', 'login', '2021-04-28 00:36:14'),
(204, 15, 'newadmin', 'login', '2021-04-28 00:38:54'),
(205, 15, 'newadmin', 'logout', '2021-04-28 00:39:52'),
(206, 18, 'newuser2', 'login', '2021-04-28 00:40:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `role` tinyint(1) NOT NULL COMMENT '1:admin, 0:user',
  `username` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `keyup_time` text COLLATE utf8_unicode_ci NOT NULL,
  `keydown_time` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `username`, `password`, `keyup_time`, `keydown_time`) VALUES
(15, 1, 'newadmin', '80396443f055ea0c4fd9719ecefcc25a', '[{\"n\":1619540964676},{\"e\":1619540964869},{\"w\":1619540965057},{\"a\":1619540965459},{\"d\":1619540965689},{\"m\":1619540965909},{\"i\":1619540966085},{\"n\":1619540966277}]', '[{\"n\":1619540964751},{\"e\":1619540964936},{\"w\":1619540965117},{\"a\":1619540965568},{\"d\":1619540965778},{\"m\":1619540965981},{\"i\":1619540966152},{\"n\":1619540966335}]'),
(16, 0, 'newuser', '0354d89c28ec399c00d3cb2d094cf093', '[{\"n\":1619542636042},{\"e\":1619542636312},{\"w\":1619542636500},{\"u\":1619542637367},{\"s\":1619542637498},{\"e\":1619542637724},{\"r\":1619542637918}]', '[{\"n\":1619542636110},{\"e\":1619542636392},{\"w\":1619542636571},{\"u\":1619542637431},{\"s\":1619542637584},{\"e\":1619542637799},{\"r\":1619542637979}]'),
(17, 1, 'newadmin2', '87db0735c99867dcd86836025d335bb4', '[{\"n\":1619544955311},{\"e\":1619544955446},{\"w\":1619544955715},{\"a\":1619544956244},{\"d\":1619544956544},{\"m\":1619544956886},{\"i\":1619544957093},{\"n\":1619544957272},{\"2\":1619544957994}]', '[{\"n\":1619544955376},{\"e\":1619544955521},{\"w\":1619544955795},{\"a\":1619544956315},{\"d\":1619544956626},{\"m\":1619544956961},{\"i\":1619544957152},{\"n\":1619544957330},{\"2\":1619544958061}]'),
(18, 0, 'newuser2', '2e42fb99dfb563d785e3888fd2ceb14c', '[{\"n\":1619545178363},{\"e\":1619545178843},{\"w\":1619545179072},{\"u\":1619545179917},{\"s\":1619545180052},{\"e\":1619545180252},{\"r\":1619545180442},{\"2\":1619545180816}]', '[{\"n\":1619545178445},{\"e\":1619545178913},{\"w\":1619545179145},{\"u\":1619545179988},{\"s\":1619545180125},{\"e\":1619545180317},{\"r\":1619545180509},{\"2\":1619545180878}]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
