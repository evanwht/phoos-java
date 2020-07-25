-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Jul 21, 2020 at 12:53 AM
-- Server version: 10.4.13-MariaDB-1:10.4.13+maria~bionic-log
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phoosball`
--

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_types`
--

INSERT INTO `event_types` (`id`, `name`) VALUES
(1, 'bread'),
(2, 'reverse bread'),
(3, 'toast'),
(4, 'reverse toast'),
(5, 'five man bread'),
(6, 'own goal'),
(7, 'full court bread'),
(8, 'five man goal'),
(9, 'double tap'),
(10, 'front line goal'),
(11, 'defense goal'),
(13, 'goalie goal');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `game_date` datetime NOT NULL DEFAULT current_timestamp(),
  `input_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `team_1_p1` int(11) NOT NULL,
  `team_1_p2` int(11) NOT NULL,
  `team_2_p1` int(11) NOT NULL,
  `team_2_p2` int(11) NOT NULL,
  `team_1_half` int(11) NOT NULL,
  `team_1_final` int(11) NOT NULL,
  `team_2_half` int(11) NOT NULL,
  `team_2_final` int(11) NOT NULL,
  `input_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `game_date`, `input_date`, `team_1_p1`, `team_1_p2`, `team_2_p1`, `team_2_p2`, `team_1_half`, `team_1_final`, `team_2_half`, `team_2_final`, `input_by`) VALUES
(8, '2020-01-21 08:32:14', '2020-01-21 14:32:14', 2, 1, 5, 3, 5, 12, 3, 10, NULL),
(12, '2020-01-22 12:22:28', '2020-01-22 18:22:28', 4, 9, 6, 1, 5, 10, 2, 5, NULL),
(14, '2020-01-22 15:17:48', '2020-01-22 21:17:48', 2, 1, 4, 7, 5, 10, 3, 8, NULL),
(15, '2020-01-22 15:26:43', '2020-01-22 21:26:43', 1, 2, 7, 4, 5, 10, 3, 7, NULL),
(17, '2020-01-21 12:15:07', '2020-01-21 18:15:07', 4, 1, 3, 2, 3, 10, 5, 8, NULL),
(18, '2020-01-21 12:29:05', '2020-01-21 18:29:05', 2, 3, 6, 1, 5, 15, 4, 14, NULL),
(19, '2020-01-22 12:10:50', '2020-01-22 18:10:50', 6, 1, 7, 2, 5, 10, 3, 8, NULL),
(20, '2020-01-22 13:55:13', '2020-01-22 19:55:13', 7, 9, 6, 2, 4, 10, 5, 5, NULL),
(26, '2020-01-23 11:53:10', '2020-01-23 17:53:10', 1, 2, 4, 7, 5, 10, 3, 6, NULL),
(27, '2020-01-23 12:24:57', '2020-01-23 18:24:57', 1, 2, 4, 8, 5, 11, 4, 9, NULL),
(28, '2020-01-23 15:56:47', '2020-01-23 21:56:47', 1, 7, 6, 2, 2, 10, 5, 8, NULL),
(29, '2020-01-23 16:18:33', '2020-01-23 22:18:33', 1, 2, 4, 8, 5, 10, 2, 7, NULL),
(30, '2020-01-24 12:20:46', '2020-01-24 18:20:46', 6, 2, 7, 4, 4, 12, 5, 10, NULL),
(31, '2020-01-24 12:36:48', '2020-01-24 18:36:48', 9, 2, 6, 4, 5, 10, 2, 3, NULL),
(32, '2020-01-24 12:47:38', '2020-01-24 18:47:38', 2, 9, 4, 6, 5, 10, 3, 6, NULL),
(33, '2020-01-27 12:20:31', '2020-01-27 18:20:31', 4, 2, 6, 1, 5, 10, 0, 4, NULL),
(34, '2020-01-27 12:47:31', '2020-01-27 18:47:31', 4, 9, 2, 1, 5, 10, 1, 4, NULL),
(35, '2020-01-27 16:00:43', '2020-01-27 22:00:43', 2, 7, 6, 3, 5, 10, 3, 6, NULL),
(36, '2020-01-28 10:50:17', '2020-01-28 16:50:17', 3, 1, 6, 2, 5, 10, 2, 2, NULL),
(37, '2020-01-28 11:00:08', '2020-01-28 17:00:08', 1, 3, 4, 2, 5, 10, 0, 5, NULL),
(38, '2020-01-28 12:23:16', '2020-01-28 18:23:16', 1, 2, 4, 6, 5, 10, 4, 6, NULL),
(39, '2020-01-28 12:41:20', '2020-01-28 18:41:20', 10, 2, 4, 1, 5, 12, 0, 10, NULL),
(40, '2020-01-28 16:07:53', '2020-01-28 22:07:53', 11, 10, 8, 14, 5, 10, 0, 1, NULL),
(41, '2020-01-28 16:19:13', '2020-01-28 22:19:13', 1, 8, 4, 2, 2, 10, 5, 8, NULL),
(42, '2020-01-28 16:30:22', '2020-01-28 22:30:22', 2, 4, 8, 1, 3, 10, 5, 8, NULL),
(43, '2020-01-29 12:07:22', '2020-01-29 18:07:22', 1, 3, 4, 2, 5, 10, 1, 5, NULL),
(45, '2020-01-29 12:36:22', '2020-01-29 18:36:22', 7, 1, 3, 15, 5, 10, 3, 6, NULL),
(46, '2020-01-29 12:36:30', '2020-01-29 18:36:30', 4, 2, 1, 3, 1, 12, 5, 10, NULL),
(47, '2020-01-29 16:07:15', '2020-01-29 22:07:15', 4, 2, 3, 1, 5, 10, 4, 7, NULL),
(48, '2020-01-29 16:22:52', '2020-01-29 22:22:52', 1, 3, 2, 4, 5, 10, 1, 7, NULL),
(51, '2020-01-30 12:33:52', '2020-01-30 18:33:52', 1, 4, 2, 8, 5, 11, 4, 9, NULL),
(52, '2020-01-30 12:40:25', '2020-01-30 18:40:25', 11, 1, 10, 14, 5, 10, 1, 2, NULL),
(53, '2020-01-30 13:21:30', '2020-01-30 19:21:30', 4, 8, 1, 2, 5, 10, 4, 8, NULL),
(54, '2020-01-30 16:02:22', '2020-01-30 22:02:22', 4, 8, 10, 11, 5, 11, 4, 9, NULL),
(55, '2020-01-30 16:09:51', '2020-01-30 22:09:51', 4, 18, 1, 2, 4, 10, 5, 8, NULL),
(56, '2020-01-30 16:24:18', '2020-01-30 22:24:18', 2, 1, 4, 18, 5, 10, 4, 7, NULL),
(57, '2020-01-31 11:26:14', '2020-01-31 17:26:14', 2, 1, 4, 3, 3, 11, 5, 9, NULL),
(58, '2020-01-31 12:44:06', '2020-01-31 18:44:06', 6, 8, 11, 4, 5, 10, 4, 7, NULL),
(59, '2020-01-31 13:01:59', '2020-01-31 19:01:59', 14, 4, 11, 8, 5, 10, 3, 8, NULL),
(60, '2020-01-31 16:02:23', '2020-01-31 22:02:23', 11, 1, 2, 4, 4, 10, 5, 6, NULL),
(61, '2020-01-31 16:13:06', '2020-01-31 22:13:06', 4, 2, 1, 11, 5, 10, 2, 6, NULL),
(62, '2020-02-03 12:10:59', '2020-02-03 18:10:59', 3, 1, 2, 7, 5, 10, 4, 6, NULL),
(63, '2020-02-03 12:33:33', '2020-02-03 18:33:33', 8, 1, 4, 2, 5, 10, 3, 8, NULL),
(64, '2020-02-03 12:56:32', '2020-02-03 18:56:32', 10, 4, 2, 1, 5, 10, 1, 4, NULL),
(65, '2020-02-03 16:02:55', '2020-02-03 22:02:55', 1, 8, 6, 4, 5, 13, 4, 11, NULL),
(66, '2020-02-03 16:08:18', '2020-02-03 22:08:18', 4, 11, 10, 8, 4, 10, 5, 8, NULL),
(67, '2020-02-04 12:17:48', '2020-02-04 18:17:48', 3, 2, 1, 7, 5, 10, 2, 3, NULL),
(68, '2020-02-04 13:24:23', '2020-02-04 19:24:23', 10, 11, 8, 14, 1, 10, 5, 8, NULL),
(69, '2020-02-04 15:59:02', '2020-02-04 21:59:02', 11, 10, 2, 4, 5, 10, 2, 4, NULL),
(70, '2020-02-04 15:59:43', '2020-02-04 21:59:43', 2, 4, 10, 11, 5, 10, 2, 4, NULL),
(71, '2020-02-04 16:14:06', '2020-02-04 22:14:06', 3, 1, 4, 2, 3, 12, 5, 10, NULL),
(72, '2020-02-05 12:30:06', '2020-02-05 18:30:06', 1, 3, 4, 2, 5, 10, 1, 6, NULL),
(73, '2020-02-05 12:37:29', '2020-02-05 18:37:29', 2, 5, 6, 7, 5, 10, 0, 1, NULL),
(74, '2020-02-05 12:50:21', '2020-02-05 18:50:21', 4, 1, 5, 2, 5, 10, 2, 4, NULL),
(75, '2020-02-05 13:07:37', '2020-02-05 19:07:37', 11, 14, 8, 10, 5, 13, 4, 11, NULL),
(76, '2020-02-05 16:03:23', '2020-02-05 22:03:23', 1, 4, 2, 5, 5, 10, 4, 7, NULL),
(77, '2020-02-05 16:21:13', '2020-02-05 22:21:13', 8, 9, 10, 11, 5, 12, 4, 10, NULL),
(78, '2020-02-05 16:27:56', '2020-02-05 22:27:56', 4, 1, 8, 5, 5, 10, 2, 6, NULL),
(79, '2020-02-06 13:21:38', '2020-02-06 19:21:38', 4, 5, 10, 1, 5, 10, 4, 7, NULL),
(80, '2020-02-06 15:15:16', '2020-02-06 21:15:16', 14, 10, 8, 11, 5, 10, 2, 8, NULL),
(81, '2020-02-07 12:06:37', '2020-02-07 18:06:37', 1, 5, 4, 2, 5, 10, 3, 6, NULL),
(82, '2020-02-07 12:17:43', '2020-02-07 18:17:43', 2, 4, 5, 1, 5, 10, 2, 6, NULL),
(83, '2020-02-07 12:39:46', '2020-02-07 18:39:46', 4, 5, 2, 1, 5, 10, 4, 8, NULL),
(84, '2020-02-10 12:18:43', '2020-02-10 18:18:43', 5, 1, 4, 6, 5, 10, 2, 6, NULL),
(85, '2020-02-10 12:27:01', '2020-02-10 18:27:01', 2, 3, 7, 5, 5, 10, 0, 3, NULL),
(86, '2020-02-10 12:58:55', '2020-02-10 18:58:55', 4, 5, 1, 2, 4, 10, 5, 8, NULL),
(87, '2020-02-10 12:59:46', '2020-02-10 18:59:46', 4, 15, 2, 5, 4, 13, 5, 11, NULL),
(88, '2020-02-10 16:23:32', '2020-02-10 22:23:32', 4, 3, 2, 1, 4, 11, 5, 9, NULL),
(89, '2020-02-11 12:35:02', '2020-02-11 18:35:02', 1, 5, 4, 2, 5, 10, 1, 6, NULL),
(90, '2020-02-11 12:35:53', '2020-02-11 18:35:53', 4, 2, 5, 1, 5, 10, 3, 7, NULL),
(91, '2020-02-11 13:03:28', '2020-02-11 19:03:28', 2, 4, 5, 8, 5, 10, 4, 7, NULL),
(92, '2020-02-11 16:23:29', '2020-02-11 22:23:29', 2, 1, 4, 5, 5, 15, 3, 13, NULL),
(93, '2020-02-12 12:18:14', '2020-02-12 18:18:14', 4, 3, 6, 5, 1, 10, 5, 6, NULL),
(94, '2020-02-12 12:27:37', '2020-02-12 18:27:37', 3, 4, 1, 2, 5, 10, 2, 4, NULL),
(95, '2020-02-12 12:53:53', '2020-02-12 18:53:53', 4, 8, 2, 1, 2, 11, 5, 9, NULL),
(96, '2020-02-12 16:33:48', '2020-02-12 22:33:48', 4, 2, 5, 1, 3, 10, 5, 7, NULL),
(97, '2020-02-12 16:34:26', '2020-02-12 22:34:26', 4, 1, 2, 3, 2, 10, 5, 7, NULL),
(98, '2020-02-13 12:31:26', '2020-02-13 18:31:26', 1, 5, 4, 2, 5, 10, 4, 8, NULL),
(99, '2020-02-13 12:41:30', '2020-02-13 18:41:30', 1, 2, 5, 3, 5, 10, 4, 7, NULL),
(100, '2020-02-13 16:00:38', '2020-02-13 22:00:38', 1, 2, 4, 3, 5, 11, 2, 9, NULL),
(101, '2020-02-13 16:18:58', '2020-02-13 22:18:58', 4, 5, 1, 2, 4, 11, 5, 9, NULL),
(102, '2020-02-14 12:17:49', '2020-02-14 18:17:49', 5, 3, 4, 1, 5, 10, 1, 6, NULL),
(103, '2020-02-14 12:18:22', '2020-02-14 18:18:22', 5, 1, 3, 2, 5, 10, 4, 7, NULL),
(104, '2020-02-14 12:48:00', '2020-02-14 18:48:00', 4, 5, 2, 1, 3, 11, 5, 9, NULL),
(105, '2020-02-14 12:48:25', '2020-02-14 18:48:25', 1, 2, 4, 5, 5, 10, 4, 8, NULL),
(106, '2020-02-14 15:31:09', '2020-02-14 21:31:09', 4, 5, 2, 3, 3, 10, 5, 7, NULL),
(107, '2020-02-14 15:31:47', '2020-02-14 21:31:47', 4, 5, 8, 2, 2, 10, 5, 7, NULL),
(108, '2020-02-17 12:40:14', '2020-02-17 18:40:14', 4, 2, 1, 5, 3, 11, 5, 9, NULL),
(109, '2020-02-18 12:07:58', '2020-02-18 18:07:58', 4, 5, 1, 2, 5, 10, 3, 4, NULL),
(110, '2020-02-18 12:41:55', '2020-02-18 18:41:55', 4, 5, 1, 2, 4, 10, 5, 7, NULL),
(111, '2020-02-18 16:15:35', '2020-02-18 22:15:35', 5, 1, 2, 4, 5, 10, 4, 8, NULL),
(112, '2020-02-19 12:31:11', '2020-02-19 18:31:11', 1, 2, 4, 5, 5, 10, 2, 6, NULL),
(113, '2020-02-19 12:40:03', '2020-02-19 18:40:03', 2, 1, 3, 5, 2, 10, 5, 5, NULL),
(114, '2020-02-19 13:00:46', '2020-02-19 19:00:46', 1, 5, 4, 2, 5, 14, 1, 12, NULL),
(115, '2020-02-19 16:13:05', '2020-02-19 22:13:05', 20, 1, 2, 3, 5, 10, 2, 8, NULL),
(116, '2020-02-19 16:22:20', '2020-02-19 22:22:20', 3, 2, 1, 20, 5, 10, 0, 5, NULL),
(117, '2020-02-20 13:00:02', '2020-02-20 19:00:02', 5, 2, 4, 15, 5, 10, 4, 7, NULL),
(118, '2020-02-21 12:03:29', '2020-02-21 18:03:29', 1, 5, 2, 3, 5, 10, 3, 8, NULL),
(119, '2020-02-21 12:13:28', '2020-02-21 18:13:28', 4, 2, 1, 5, 5, 10, 1, 4, NULL),
(120, '2020-02-21 15:21:54', '2020-02-21 21:21:54', 3, 2, 1, 8, 5, 10, 3, 8, NULL),
(121, '2020-02-21 15:44:46', '2020-02-21 21:44:46', 1, 3, 4, 5, 5, 10, 3, 7, NULL),
(122, '2020-02-24 12:42:11', '2020-02-24 18:42:11', 2, 1, 4, 6, 5, 10, 1, 4, NULL),
(123, '2020-02-24 13:37:20', '2020-02-24 19:37:20', 2, 4, 8, 1, 3, 11, 5, 9, NULL),
(124, '2020-02-24 13:59:42', '2020-02-24 19:59:42', 4, 2, 8, 11, 3, 10, 5, 8, NULL),
(125, '2020-02-24 16:11:14', '2020-02-24 22:11:14', 2, 1, 6, 4, 5, 10, 3, 5, NULL),
(126, '2020-02-24 16:11:41', '2020-02-24 22:11:41', 4, 1, 3, 2, 5, 10, 3, 3, NULL),
(127, '2020-02-24 16:34:42', '2020-02-24 22:34:42', 1, 4, 2, 3, 5, 13, 3, 11, NULL),
(128, '2020-02-25 12:28:21', '2020-02-25 18:28:21', 4, 6, 5, 2, 5, 10, 4, 8, NULL),
(129, '2020-02-25 12:55:04', '2020-02-25 18:55:04', 2, 1, 3, 6, 5, 11, 4, 9, NULL),
(130, '2020-02-25 13:06:33', '2020-02-25 19:06:33', 1, 2, 4, 5, 5, 10, 1, 7, NULL),
(131, '2020-02-26 13:22:55', '2020-02-26 19:22:55', 4, 2, 8, 5, 4, 10, 5, 7, NULL),
(132, '2020-02-26 16:33:21', '2020-02-26 22:33:21', 4, 5, 1, 2, 5, 10, 3, 5, NULL),
(133, '2020-02-26 16:33:52', '2020-02-26 22:33:52', 2, 1, 5, 4, 5, 10, 4, 8, NULL),
(134, '2020-02-26 16:34:47', '2020-02-26 22:34:47', 4, 5, 2, 1, 3, 10, 5, 7, NULL),
(135, '2020-02-26 16:35:17', '2020-02-26 22:35:17', 4, 5, 1, 2, 5, 10, 3, 5, NULL),
(136, '2020-02-27 12:30:59', '2020-02-27 18:30:59', 2, 5, 6, 3, 4, 10, 5, 7, NULL),
(137, '2020-02-28 12:19:40', '2020-02-28 18:19:40', 2, 5, 4, 6, 3, 10, 5, 6, NULL),
(138, '2020-02-28 12:33:06', '2020-02-28 18:33:06', 2, 5, 6, 4, 5, 10, 3, 6, NULL),
(139, '2020-02-28 12:46:21', '2020-02-28 18:46:21', 4, 2, 3, 6, 5, 10, 4, 6, NULL),
(140, '2020-02-28 13:01:34', '2020-02-28 19:01:34', 2, 6, 15, 3, 4, 10, 5, 6, NULL),
(141, '2020-02-28 15:54:29', '2020-02-28 21:54:29', 2, 5, 4, 3, 4, 13, 5, 11, NULL),
(142, '2020-02-28 15:56:18', '2020-02-28 21:56:18', 2, 5, 6, 3, 5, 10, 3, 4, NULL),
(143, '2020-03-02 12:34:09', '2020-03-02 18:34:09', 2, 6, 4, 5, 4, 10, 5, 8, NULL),
(144, '2020-03-02 12:34:44', '2020-03-02 18:34:44', 4, 2, 3, 5, 1, 10, 5, 7, NULL),
(145, '2020-03-04 12:22:06', '2020-03-04 18:22:06', 3, 2, 6, 5, 5, 10, 0, 7, NULL),
(146, '2020-03-04 12:44:49', '2020-03-04 18:44:49', 4, 5, 2, 3, 4, 10, 5, 8, NULL),
(147, '2020-03-04 13:53:18', '2020-03-04 19:53:18', 5, 4, 8, 2, 5, 10, 3, 6, NULL),
(148, '2020-03-04 16:23:36', '2020-03-04 22:23:36', 2, 3, 4, 7, 5, 10, 1, 6, NULL),
(149, '2020-03-05 12:56:40', '2020-03-05 18:56:40', 4, 3, 1, 2, 3, 11, 5, 9, NULL),
(150, '2020-03-05 12:57:20', '2020-03-05 18:57:20', 2, 1, 3, 5, 5, 10, 3, 6, NULL),
(151, '2020-03-05 16:24:03', '2020-03-05 22:24:03', 4, 2, 5, 1, 4, 12, 5, 10, NULL),
(152, '2020-03-06 12:52:38', '2020-03-06 18:52:38', 1, 6, 7, 2, 5, 10, 3, 8, NULL),
(153, '2020-03-06 12:53:09', '2020-03-06 18:53:09', 2, 4, 1, 6, 3, 11, 5, 9, NULL),
(154, '2020-03-06 12:55:52', '2020-03-06 18:55:52', 2, 11, 4, 8, 1, 10, 5, 8, NULL),
(155, '2020-03-06 13:11:08', '2020-03-06 19:11:08', 1, 2, 4, 8, 3, 10, 5, 6, NULL),
(156, '2020-03-06 15:33:21', '2020-03-06 21:33:21', 4, 5, 1, 2, 5, 10, 1, 8, NULL),
(157, '2020-03-06 16:06:32', '2020-03-06 22:06:32', 2, 5, 1, 4, 4, 10, 5, 8, NULL),
(158, '2020-03-06 16:08:18', '2020-03-06 22:08:18', 2, 7, 6, 4, 5, 10, 3, 8, NULL),
(159, '2020-03-09 12:51:35', '2020-03-09 17:51:35', 4, 2, 3, 1, 5, 10, 3, 7, NULL),
(160, '2020-03-09 16:32:19', '2020-03-09 21:32:19', 1, 4, 2, 5, 5, 10, 4, 7, NULL),
(161, '2020-03-09 16:32:57', '2020-03-09 21:32:57', 4, 5, 2, 3, 5, 10, 3, 6, NULL),
(162, '2020-03-10 16:19:21', '2020-03-10 21:19:21', 2, 5, 6, 1, 5, 10, 1, 7, NULL),
(163, '2020-03-11 12:35:46', '2020-03-11 17:35:46', 4, 1, 2, 5, 5, 10, 3, 5, NULL),
(164, '2020-03-11 13:01:06', '2020-03-11 18:01:06', 4, 2, 1, 3, 5, 12, 2, 10, NULL),
(165, '2020-03-11 13:33:55', '2020-03-11 18:33:55', 2, 1, 7, 3, 5, 10, 3, 7, NULL),
(166, '2020-03-11 15:53:08', '2020-03-11 20:53:08', 6, 1, 2, 5, 5, 10, 4, 8, NULL),
(167, '2020-03-11 16:07:23', '2020-03-11 21:07:23', 2, 1, 4, 8, 4, 10, 5, 5, NULL),
(168, '2020-03-11 16:19:17', '2020-03-11 21:19:17', 1, 2, 4, 8, 5, 10, 1, 4, NULL),
(169, '2020-03-12 15:52:02', '2020-03-12 20:52:02', 4, 5, 3, 2, 5, 10, 4, 7, NULL),
(170, '2020-03-12 15:52:40', '2020-03-12 20:52:40', 2, 4, 5, 6, 5, 10, 3, 7, NULL),
(171, '2020-06-08 22:37:29', '2020-06-09 03:37:29', 1, 1, 2, 4, 5, 10, 0, 0, NULL),
(172, '2020-07-02 21:20:33', '2020-07-03 02:20:33', 4, 1, 4, 4, 5, 10, 4, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_events`
--

CREATE TABLE `game_events` (
  `id` int(11) NOT NULL,
  `game` int(11) NOT NULL,
  `order_num` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `player_by` int(11) NOT NULL,
  `player_on` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `last_games`
-- (See below for the actual view)
--
CREATE TABLE `last_games` (
`id` int(11)
,`game_date` datetime
,`team_1_d` varchar(64)
,`team_1_d_id` int(11)
,`team_1_o` varchar(64)
,`team_1_o_id` int(11)
,`team_2_d` varchar(64)
,`team_2_d_id` int(11)
,`team_2_o` varchar(64)
,`team_2_o_id` int(11)
,`team_1_half` int(11)
,`team_2_half` int(11)
,`team_1_final` int(11)
,`team_2_final` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `losses`
-- (See below for the actual view)
--
CREATE TABLE `losses` (
`id` int(11)
,`name` varchar(64)
,`losses` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `overall_standings`
-- (See below for the actual view)
--
CREATE TABLE `overall_standings` (
`name` varchar(64)
,`wins` bigint(21)
,`losses` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favorite_shot` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `display_name`, `email`, `favorite_shot`) VALUES
(1, 'Evan White', 'king', 'evanwht1@gmail.com', 'pull'),
(2, 'Thomas Mckenna', 'number 2', '', 'push pass'),
(3, 'Zach Volz', 'zachonius', '', 'pull spin pass'),
(4, 'Manny Sahagun', 'still learning', '', 'bullshit'),
(5, 'Artur Jaglowski', 'friend', '', 'push-back'),
(6, 'Rich Kraft', 'straighter', '', 'angle'),
(7, 'Gregory Opaczewski', 'gregor', '', 'pull spin'),
(8, 'Jay Patel', 'jay baby', '', 'pull'),
(9, 'Tommy Oats', 'Toats', NULL, NULL),
(10, 'Peter Wysocki', 'Cürva', NULL, NULL),
(11, 'Michael Gallagher', 'TBD', NULL, NULL),
(14, 'Sean Meade', 'mead', NULL, NULL),
(15, 'Isabel Reyes', 'izzy', NULL, NULL),
(18, 'Shaun Lake', 'Shlake', 'slake@meh.gov', NULL),
(19, 'Patrick McDonald', 'YOLO', 'hfsgjgffg@fdfg.com', NULL),
(20, 'Ceon Kim', 'Sunny D', 'ckim@a.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schema_history`
--

CREATE TABLE `schema_history` (
  `version` int(11) NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `checksum` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='schema migrations performed';

--
-- Dumping data for table `schema_history`
--

INSERT INTO `schema_history` (`version`, `description`, `name`, `checksum`, `date`) VALUES
(1, 'initial', '1.phoosball_all.sql', 'fe9ccbd20b8fc2e1ec9bc8250262719d', '2020-02-15 15:22:22'),
(2, 'initial data', '2.initial_data.sql', 'f91001cdf55b882d36f233cb2b498cfe', '2020-02-19 08:04:55'),
(3, 'views', '3.views.sql', 'cebbc6becd4421951b4c6b3c184d7956', '2020-02-19 08:05:43'),
(4, 'edits', '4.edits.sql', '8b8953f3b1bd199655cd38c90033f66f', '2020-02-23 16:39:54');

-- --------------------------------------------------------

--
-- Stand-in structure for view `wins`
-- (See below for the actual view)
--
CREATE TABLE `wins` (
`id` int(11)
,`name` varchar(64)
,`wins` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `last_games`
--
DROP TABLE IF EXISTS `last_games`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phoos_server`@`%` SQL SECURITY DEFINER VIEW `last_games`  AS  select `g`.`id` AS `id`,`g`.`game_date` AS `game_date`,`p1`.`name` AS `team_1_d`,`p1`.`id` AS `team_1_d_id`,`p2`.`name` AS `team_1_o`,`p2`.`id` AS `team_1_o_id`,`p3`.`name` AS `team_2_d`,`p3`.`id` AS `team_2_d_id`,`p4`.`name` AS `team_2_o`,`p4`.`id` AS `team_2_o_id`,`g`.`team_1_half` AS `team_1_half`,`g`.`team_2_half` AS `team_2_half`,`g`.`team_1_final` AS `team_1_final`,`g`.`team_2_final` AS `team_2_final` from ((((`games` `g` left join `players` `p1` on(`p1`.`id` = `g`.`team_1_p1`)) left join `players` `p2` on(`p2`.`id` = `g`.`team_1_p2`)) left join `players` `p3` on(`p3`.`id` = `g`.`team_2_p1`)) left join `players` `p4` on(`p4`.`id` = `g`.`team_2_p2`)) order by `g`.`game_date` desc ;

-- --------------------------------------------------------

--
-- Structure for view `losses`
--
DROP TABLE IF EXISTS `losses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `losses`  AS  select `p`.`id` AS `id`,`p`.`name` AS `name`,count(0) AS `losses` from (`players` `p` join `games` `g` on(`p`.`id` = `g`.`team_2_p1` or `p`.`id` = `g`.`team_2_p2`)) where `g`.`game_date` > cast(current_timestamp() as date) + interval -14 day and `p`.`name` is not null group by `p`.`id`,`p`.`name` ;

-- --------------------------------------------------------

--
-- Structure for view `overall_standings`
--
DROP TABLE IF EXISTS `overall_standings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `overall_standings`  AS  (select `w`.`name` AS `name`,coalesce(`w`.`wins`,0) AS `wins`,coalesce(`l`.`losses`,0) AS `losses` from (`wins` `w` left join `losses` `l` on(`w`.`id` = `l`.`id`))) union (select `l`.`name` AS `name`,coalesce(`w`.`wins`,0) AS `wins`,coalesce(`l`.`losses`,0) AS `losses` from (`losses` `l` left join `wins` `w` on(`l`.`id` = `w`.`id`))) order by `wins` desc,`losses` ;

-- --------------------------------------------------------

--
-- Structure for view `wins`
--
DROP TABLE IF EXISTS `wins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wins`  AS  select `p`.`id` AS `id`,`p`.`name` AS `name`,count(0) AS `wins` from (`players` `p` join `games` `g` on(`p`.`id` = `g`.`team_1_p1` or `p`.`id` = `g`.`team_1_p2`)) where `g`.`game_date` > cast(current_timestamp() as date) + interval -14 day and `p`.`name` is not null group by `p`.`id`,`p`.`name` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_1_fk` (`team_1_p1`),
  ADD KEY `player_2_fk` (`team_1_p2`),
  ADD KEY `player_3_fk` (`team_2_p1`),
  ADD KEY `player_4_fk` (`team_2_p2`),
  ADD KEY `input_by_fk` (`input_by`);

--
-- Indexes for table `game_events`
--
ALTER TABLE `game_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_fk` (`game`),
  ADD KEY `player_by_fk` (`player_by`),
  ADD KEY `player_on_fk` (`player_on`),
  ADD KEY `event_fk` (`type`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schema_history`
--
ALTER TABLE `schema_history`
  ADD UNIQUE KEY `schema_history_UN` (`version`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `game_events`
--
ALTER TABLE `game_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `input_by_fk` FOREIGN KEY (`input_by`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `player_1_fk` FOREIGN KEY (`team_1_p1`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `player_2_fk` FOREIGN KEY (`team_1_p2`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `player_3_fk` FOREIGN KEY (`team_2_p1`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `player_4_fk` FOREIGN KEY (`team_2_p2`) REFERENCES `players` (`id`);

--
-- Constraints for table `game_events`
--
ALTER TABLE `game_events`
  ADD CONSTRAINT `event_fk` FOREIGN KEY (`type`) REFERENCES `event_types` (`id`),
  ADD CONSTRAINT `game_fk` FOREIGN KEY (`game`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `player_by_fk` FOREIGN KEY (`player_by`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `player_on_fk` FOREIGN KEY (`player_on`) REFERENCES `players` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
