-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: phoosball
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB-1:10.4.12+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `event_types`
--

DROP TABLE IF EXISTS `event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_events`
--

DROP TABLE IF EXISTS `game_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game` int(11) NOT NULL,
  `order_num` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `player_by` int(11) NOT NULL,
  `player_on` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_fk` (`game`),
  KEY `player_by_fk` (`player_by`),
  KEY `player_on_fk` (`player_on`),
  KEY `event_fk` (`type`),
  CONSTRAINT `event_fk` FOREIGN KEY (`type`) REFERENCES `event_types` (`id`),
  CONSTRAINT `game_fk` FOREIGN KEY (`game`) REFERENCES `games` (`id`),
  CONSTRAINT `player_by_fk` FOREIGN KEY (`player_by`) REFERENCES `players` (`id`),
  CONSTRAINT `player_on_fk` FOREIGN KEY (`player_on`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `input_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player_1_fk` (`team_1_p1`),
  KEY `player_2_fk` (`team_1_p2`),
  KEY `player_3_fk` (`team_2_p1`),
  KEY `player_4_fk` (`team_2_p2`),
  KEY `input_by_fk` (`input_by`),
  CONSTRAINT `input_by_fk` FOREIGN KEY (`input_by`) REFERENCES `players` (`id`),
  CONSTRAINT `player_1_fk` FOREIGN KEY (`team_1_p1`) REFERENCES `players` (`id`),
  CONSTRAINT `player_2_fk` FOREIGN KEY (`team_1_p2`) REFERENCES `players` (`id`),
  CONSTRAINT `player_3_fk` FOREIGN KEY (`team_2_p1`) REFERENCES `players` (`id`),
  CONSTRAINT `player_4_fk` FOREIGN KEY (`team_2_p2`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `last_games`
--

DROP TABLE IF EXISTS `last_games`;
/*!50001 DROP VIEW IF EXISTS `last_games`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `last_games` (
  `id` tinyint NOT NULL,
  `game_date` tinyint NOT NULL,
  `team_1_Defense` tinyint NOT NULL,
  `team_1_Offense` tinyint NOT NULL,
  `team_2_Defense` tinyint NOT NULL,
  `team_2_Offense` tinyint NOT NULL,
  `team_1_half` tinyint NOT NULL,
  `team_2_half` tinyint NOT NULL,
  `team_1_final` tinyint NOT NULL,
  `team_2_final` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `losses`
--

DROP TABLE IF EXISTS `losses`;
/*!50001 DROP VIEW IF EXISTS `losses`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `losses` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `losses` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `overall_standings`
--

DROP TABLE IF EXISTS `overall_standings`;
/*!50001 DROP VIEW IF EXISTS `overall_standings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `overall_standings` (
  `name` tinyint NOT NULL,
  `wins` tinyint NOT NULL,
  `losses` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favorite_shot` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_history`
--

DROP TABLE IF EXISTS `schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_history` (
  `version` int(11) NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `checksum` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='schema migrations performed';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `wins`
--

DROP TABLE IF EXISTS `wins`;
/*!50001 DROP VIEW IF EXISTS `wins`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `wins` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `wins` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `last_games`
--

/*!50001 DROP TABLE IF EXISTS `last_games`*/;
/*!50001 DROP VIEW IF EXISTS `last_games`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `last_games` AS select `g`.`id` AS `id`,`g`.`game_date` AS `game_date`,`p1`.`name` AS `team_1_Defense`,`p2`.`name` AS `team_1_Offense`,`p3`.`name` AS `team_2_Defense`,`p4`.`name` AS `team_2_Offense`,`g`.`team_1_half` AS `team_1_half`,`g`.`team_2_half` AS `team_2_half`,`g`.`team_1_final` AS `team_1_final`,`g`.`team_2_final` AS `team_2_final` from ((((`games` `g` left join `players` `p1` on(`p1`.`id` = `g`.`team_1_p1`)) left join `players` `p2` on(`p2`.`id` = `g`.`team_1_p2`)) left join `players` `p3` on(`p3`.`id` = `g`.`team_2_p1`)) left join `players` `p4` on(`p4`.`id` = `g`.`team_2_p2`)) where `g`.`game_date` > cast(current_timestamp() as date) + interval -14 day order by `g`.`game_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `losses`
--

/*!50001 DROP TABLE IF EXISTS `losses`*/;
/*!50001 DROP VIEW IF EXISTS `losses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `losses` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,count(0) AS `losses` from (`phoosball`.`players` `p` join (select `g`.`id` AS `id`,`g`.`team_2_p1` AS `l1`,`g`.`team_2_p2` AS `l2` from `phoosball`.`games` `g` where `g`.`game_date` > cast(current_timestamp() as date) + interval -14 day) `l` on(`p`.`id` = `l`.`l1` or `p`.`id` = `l`.`l2`)) where `p`.`name` is not null group by `p`.`id`,`p`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `overall_standings`
--

/*!50001 DROP TABLE IF EXISTS `overall_standings`*/;
/*!50001 DROP VIEW IF EXISTS `overall_standings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `overall_standings` AS (select `w`.`name` AS `name`,coalesce(`w`.`wins`,0) AS `wins`,coalesce(`l`.`losses`,0) AS `losses` from (`phoosball`.`wins` `w` left join `phoosball`.`losses` `l` on(`w`.`id` = `l`.`id`))) union (select `l`.`name` AS `name`,coalesce(`w`.`wins`,0) AS `wins`,coalesce(`l`.`losses`,0) AS `losses` from (`phoosball`.`losses` `l` left join `phoosball`.`wins` `w` on(`l`.`id` = `w`.`id`))) order by `wins` desc,`losses` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wins`
--

/*!50001 DROP TABLE IF EXISTS `wins`*/;
/*!50001 DROP VIEW IF EXISTS `wins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `wins` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,count(0) AS `wins` from (`phoosball`.`players` `p` join (select `g`.`id` AS `id`,`g`.`team_1_p1` AS `w1`,`g`.`team_1_p2` AS `w2` from `phoosball`.`games` `g` where `g`.`game_date` > cast(current_timestamp() as date) + interval -14 day) `w` on(`p`.`id` = `w`.`w1` or `p`.`id` = `w`.`w2`)) where `p`.`name` is not null group by `p`.`id`,`p`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-15 15:31:52
