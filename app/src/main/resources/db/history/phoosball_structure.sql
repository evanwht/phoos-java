-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Jul 21, 2020 at 12:57 AM
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_events`
--
ALTER TABLE `game_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
