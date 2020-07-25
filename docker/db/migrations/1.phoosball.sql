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

USE `phoosball`;

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