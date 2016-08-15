-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: album_db
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `album_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `album_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `album_db`;

--
-- Table structure for table `album_artists`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_artists` (
  `artist_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`artist_id`,`album_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `albums`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `album_id` int(11) NOT NULL,
  `album` text,
  `type` enum('compilation','standard') DEFAULT NULL,
  `total_tracks` int(11) DEFAULT NULL,
  `year` text,
  PRIMARY KEY (`album_id`),
  KEY `album` (`album`(12)),
  KEY `year` (`year`(8))
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artist_genres`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist_genres` (
  `artist_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`artist_id`,`genre_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artists`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL,
  `artist` text,
  PRIMARY KEY (`artist_id`),
  KEY `artist` (`artist`(12))
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genres`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `genre` text,
  PRIMARY KEY (`genre_id`),
  KEY `genre` (`genre`(10))
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlist_songs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_songs` (
  `playlist_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  PRIMARY KEY (`playlist_id`,`song_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlists`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlists` (
  `playlist_id` int(11) NOT NULL,
  `playlist` text,
  `description` text,
  `user_id` int(11) NOT NULL,
  `is_shared` enum('yes','no') DEFAULT NULL,
  `created` date DEFAULT NULL,
  `viewed` int(11) DEFAULT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `playlist` (`playlist`(10))
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `song_genres`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_genres` (
  `song_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`song_id`,`genre_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `song_types`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_types` (
  `song_id` int(11) NOT NULL,
  `type` enum('live','cover','bootleg','single') NOT NULL,
  PRIMARY KEY (`song_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `songs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `song_id` int(11) NOT NULL,
  `title` text,
  `artist_id` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `track` int(11) DEFAULT NULL,
  `duration` text,
  `seconds` int(11) DEFAULT NULL,
  `lyrics` text,
  `comment` text,
  `bitrate` int(11) DEFAULT NULL,
  `samplerate` double DEFAULT NULL,
  `fileformat` text,
  `channels` text,
  `tagtypes` text,
  `filename` text,
  `filesize` double DEFAULT NULL,
  `filepath` text,
  `year` text,
  `uber_rating` int(11) DEFAULT NULL,
  `uber_playcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`song_id`),
  KEY `title` (`title`(10)),
  KEY `year` (`year`(8)),
  KEY `uber_playcount` (`uber_playcount`),
  KEY `uber_rating` (`uber_rating`),
  KEY `album_id` (`album_id`),
  KEY `artist_id` (`artist_id`),
  KEY `genre_id` (`genre_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_albums`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_albums` (
  `user_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_ratings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ratings` (
  `user_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `playcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`song_id`),
  KEY `rating` (`rating`),
  KEY `playcount` (`playcount`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first` text,
  `last` text,
  `email` text,
  `username` text,
  `password` text,
  `privs` text,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_access` date DEFAULT NULL,
  `songs_played` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`(8))
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-15  1:08:05
