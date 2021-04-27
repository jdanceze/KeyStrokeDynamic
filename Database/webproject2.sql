-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2020 at 08:45 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webproject2`
--
CREATE DATABASE IF NOT EXISTS `webproject2` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `webproject2`;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `username`, `action`, `at`) VALUES
(15, 1, 'j', 'login', '2020-05-07 22:09:09'),
(16, 2, 'm', 'login', '2020-05-07 22:10:22'),
(17, 2, 'm', 'logout', '2020-05-07 22:10:31'),
(18, 1, 'j', 'login', '2020-05-07 22:13:41'),
(19, 1, 'j', 'login', '2020-05-07 22:24:55'),
(20, 1, 'j', 'login', '2020-05-07 22:30:30'),
(21, 1, 'j', 'login', '2020-05-07 22:30:51'),
(22, 1, 'j', 'login', '2020-05-07 22:31:34'),
(23, 1, 'j', 'logout', '2020-05-07 22:39:24'),
(24, 2, 'm', 'login', '2020-05-07 22:39:28'),
(25, 2, 'm', 'logout', '2020-05-07 22:42:52'),
(26, 1, 'j', 'login', '2020-05-07 22:56:16'),
(27, 6, 'Eva', 'login', '2020-05-08 09:33:24'),
(28, 6, 'Eva', 'logout', '2020-05-08 09:35:24'),
(29, 2, 'm', 'login', '2020-05-08 09:35:29'),
(30, 2, 'm', 'login', '2020-05-08 16:05:27'),
(31, 2, 'm', 'logout', '2020-05-08 16:06:36'),
(32, 1, 'j', 'login', '2020-05-08 16:06:42'),
(33, 1, 'j', 'logout', '2020-05-08 16:08:29'),
(34, 2, 'm', 'login', '2020-05-08 16:08:33'),
(35, 2, 'm', 'login', '2020-05-08 16:36:41'),
(36, 2, 'm', 'logout', '2020-05-08 16:37:06'),
(37, 2, 'm', 'login', '2020-05-08 16:37:21'),
(38, 2, 'm', 'logout', '2020-05-08 16:42:27'),
(39, 1, 'j', 'login', '2020-05-08 16:42:34'),
(40, 1, 'j', 'login', '2020-05-09 12:45:21'),
(41, 1, 'j', 'login', '2020-05-09 12:52:37'),
(42, 1, 'j', 'logout', '2020-05-09 12:53:08'),
(43, 2, 'm', 'login', '2020-05-09 12:53:13'),
(44, 2, 'm', 'logout', '2020-05-09 12:54:52'),
(45, 1, 'j', 'login', '2020-05-09 12:55:08'),
(46, 1, 'j', 'login', '2020-05-09 12:57:00'),
(47, 1, 'j', 'logout', '2020-05-09 13:01:21'),
(48, 2, 'm', 'login', '2020-05-09 14:19:31'),
(49, 2, 'm', 'login', '2020-05-09 14:23:07'),
(50, 2, 'm', 'login', '2020-05-09 14:23:48'),
(51, 2, 'm', 'login', '2020-05-09 14:34:38'),
(52, 2, 'm', 'login', '2020-05-09 14:36:35'),
(53, 1, 'j', 'login', '2020-05-09 14:40:05'),
(54, 1, 'j', 'login', '2020-05-09 14:42:44'),
(55, 1, 'j', 'logout', '2020-05-09 14:43:23'),
(56, 9, 'test', 'login', '2020-05-09 14:43:30'),
(57, 1, 'j', 'login', '2020-05-09 14:43:43'),
(58, 1, 'j', 'logout', '2020-05-09 14:44:07'),
(59, 9, 'test1', 'login', '2020-05-09 14:44:15'),
(60, 9, 'test1', 'logout', '2020-05-09 14:44:33'),
(61, 9, 'test1', 'login', '2020-05-09 14:44:37'),
(62, 9, 'test1', 'logout', '2020-05-09 14:45:44'),
(63, 1, 'j', 'login', '2020-05-09 14:45:50'),
(64, 1, 'j', 'logout', '2020-05-09 14:46:59'),
(65, 10, 'test', 'login', '2020-05-09 14:47:14'),
(66, 10, 'test', 'logout', '2020-05-09 14:48:04'),
(67, 10, 'test', 'login', '2020-05-09 14:49:00'),
(68, 1, 'j', 'login', '2020-05-09 14:49:16'),
(69, 1, 'j', 'login', '2020-05-09 14:50:32'),
(70, 1, 'j', 'logout', '2020-05-09 14:50:35'),
(71, 1, 'j', 'login', '2020-05-09 14:52:39'),
(72, 10, 'test', 'login', '2020-05-09 14:52:57'),
(73, 10, 'test', 'logout', '2020-05-09 14:53:01'),
(74, 1, 'j', 'login', '2020-05-09 14:53:05'),
(75, 1, 'j', 'logout', '2020-05-09 14:53:30'),
(76, 2, 'm', 'login', '2020-05-09 15:04:14'),
(77, 2, 'm', 'logout', '2020-05-09 15:06:32'),
(78, 2, 'm', 'login', '2020-05-09 15:08:36'),
(79, 2, 'm', 'login', '2020-05-09 15:11:37'),
(80, 2, 'm', 'login', '2020-05-09 15:20:26'),
(81, 2, 'm', 'login', '2020-05-09 15:21:00'),
(82, 1, 'j', 'login', '2020-05-09 15:21:18'),
(83, 2, 'm', 'login', '2020-05-09 15:22:35'),
(84, 2, 'm', 'login', '2020-05-09 15:23:30'),
(85, 2, 'm', 'login', '2020-05-09 15:24:56'),
(86, 2, 'm', 'logout', '2020-05-09 15:25:21'),
(87, 2, 'm', 'login', '2020-05-09 15:26:42'),
(88, 1, 'j', 'login', '2020-05-09 15:36:31'),
(89, 1, 'j', 'logout', '2020-05-09 15:38:27'),
(90, 11, 'user', 'login', '2020-05-09 15:38:33'),
(91, 5, 'admin', 'login', '2020-05-09 15:39:20'),
(92, 5, 'admin', 'logout', '2020-05-09 15:40:27'),
(93, 5, 'admin', 'login', '2020-05-09 15:40:37'),
(94, 5, 'admin', 'logout', '2020-05-09 15:40:48'),
(95, 11, 'user', 'login', '2020-05-09 15:41:02'),
(96, 11, 'user', 'logout', '2020-05-09 15:41:20'),
(97, 5, 'admin', 'login', '2020-05-09 15:41:24'),
(98, 5, 'admin', 'logout', '2020-05-09 15:41:34'),
(99, 11, 'user', 'login', '2020-05-09 15:41:38'),
(100, 1, 'j', 'login', '2020-05-09 15:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` tinyint(1) NOT NULL COMMENT '1:admin, 0:user',
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(3) NOT NULL,
  `prefer` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `first_name`, `last_name`, `username`, `password`, `address`, `age`, `prefer`, `email`) VALUES
(1, 1, 'Pattarakrit', 'Rattanukul', 'j', 'e10adc3949ba59abbe56e057f20f883e', '2/8 Wanglang', 20, 'Action', 'j@gmail.com'),
(2, 0, 'Mona', 'Dolce', 'm', 'c33367701511b4f6020ec61ded352059', 'gogo', 18, 'love', 'm@gmail.com'),
(5, 1, 'Admin', 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2/9', 99, 'Love,Action', 'admin@mail.com'),
(6, 0, 'Eva', 'Shinji Ra', 'Eva', '96e79218965eb72c92a549dd5a330112', '22', 13, 'Robot', 'eva@gmai.com'),
(10, 0, 'test7', 'test7', 'test7', '202cb962ac59075b964b07152d234b70', '117', 11, '1117', 'test7'),
(11, 0, 'User', 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', '99/99', 99, 'Comedy', 'user@mail.com');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
