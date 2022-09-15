-- MariaDB dump 10.19  Distrib 10.8.3-MariaDB, for osx10.17 (x86_64)
--
-- Host: localhost    Database: table_relationships
-- ------------------------------------------------------
-- Server version	10.8.3-MariaDB

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
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `content` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `blogger_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `blog_post_FK` (`blogger_id`),
  CONSTRAINT `blog_post_FK` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES
('honesty is always the best option to choose','honesty is the best policy','2021-05-06',1,1),
('tiger is an extinct animal','extinct species','2022-01-03',2,3),
('climate changing is affecting us ','climate change','2021-05-08',1,4),
('bigger cities have more traffic','increasing traffic','2022-01-06',2,5);
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_comment`
--

DROP TABLE IF EXISTS `blog_post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post_comment` (
  `content` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `blogger_id` int(10) unsigned NOT NULL,
  `blog_post_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `blog_post_comment_FK` (`blogger_id`),
  KEY `blog_post_comment_FK_1` (`blog_post_id`),
  CONSTRAINT `blog_post_comment_FK` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blog_post_comment_FK_1` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_comment`
--

LOCK TABLES `blog_post_comment` WRITE;
/*!40000 ALTER TABLE `blog_post_comment` DISABLE KEYS */;
INSERT INTO `blog_post_comment` VALUES
('you are sure about honesty','2021-05-07',4,1,1),
('yes!! tigers are!!','2022-01-03',1,3,2),
('yes honestly always is','2021-05-06',2,1,3),
('true!!!','2021-05-07',3,1,4),
('well!! we are creating pollution','2021-05-08',1,4,6),
('yes climate change is real','2021-05-09',2,4,7),
('carbon emissions are on the rise','2021-05-10',3,4,8),
('tigers are deceasing day by day','2022-01-05',4,3,9),
('we should stop hunting tigers','2022-01-07',2,3,10),
('traffic is a real problem','2022-01-06',3,5,11),
('traffic kills many people','2022-01-09',4,5,12),
('traffic makes us late everytime','2022-01-11',2,5,13),
('root cause delete me of accidents','2022-01-04',3,5,16);
/*!40000 ALTER TABLE `blog_post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogger`
--

DROP TABLE IF EXISTS `blogger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogger` (
  `username` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `email` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogger_unique_username` (`username`),
  UNIQUE KEY `blogger_unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogger`
--

LOCK TABLES `blogger` WRITE;
/*!40000 ALTER TABLE `blogger` DISABLE KEYS */;
INSERT INTO `blogger` VALUES
('username_one','123456','user_one','2018-01-03','user_one@email.com',1),
('username_two','123456','user_two','2020-01-01','user_two@email.com',2),
('username_three','pass','user_three','2021-04-06','user_three@email.com',3),
('username_four','123456','user_four','2021-04-07','user_four@email.com',4);
/*!40000 ALTER TABLE `blogger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'table_relationships'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-14 20:54:37
