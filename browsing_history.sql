-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: decor_retro_db
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u2

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
-- Table structure for table `browsing_history`
--

DROP TABLE IF EXISTS `browsing_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browsing_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `date_viewed` varchar(50) DEFAULT NULL,
  `watch_time` varchar(50) DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browsing_history`
--

LOCK TABLES `browsing_history` WRITE;
/*!40000 ALTER TABLE `browsing_history` DISABLE KEYS */;
INSERT INTO `browsing_history` VALUES (11,'product',NULL,4451,35000,'ПТ','14','2022-01-21 15:51:50','2022-01-21 15:51:50'),(12,'category','Увлечения, Охота, Рыбалка',NULL,NULL,'ПТ','15','2022-01-21 16:02:26','2022-01-21 16:02:26'),(13,'product',NULL,6081,35000,'ПТ','15','2022-01-21 16:02:29','2022-01-21 16:02:29'),(14,'product',NULL,6081,35000,'ПТ','15','2022-01-21 16:04:25','2022-01-21 16:04:25'),(15,'product',NULL,6081,35000,'ПТ','15','2022-01-21 16:14:01','2022-01-21 16:14:01'),(16,'product',NULL,6081,35000,'ПТ','15','2022-01-21 16:20:24','2022-01-21 16:20:24'),(17,'product',NULL,6091,6500,'ПТ','16','2022-01-21 17:27:52','2022-01-21 17:27:52'),(18,'category','Кухонная  и домашняя утварь',NULL,NULL,'ПТ','16','2022-01-21 17:34:31','2022-01-21 17:34:31'),(19,'category','Кухонная утварь',NULL,NULL,'ПТ','16','2022-01-21 17:34:33','2022-01-21 17:34:33'),(20,'product',NULL,6065,15000,'ПТ','16','2022-01-21 17:34:35','2022-01-21 17:34:35'),(21,'product',NULL,6065,15000,'ПТ','16','2022-01-21 17:34:51','2022-01-21 17:34:51'),(22,'product',NULL,6065,15000,'ПТ','16','2022-01-21 17:35:05','2022-01-21 17:35:05'),(23,'product',NULL,6089,36000,'ПТ','16','2022-01-21 17:35:12','2022-01-21 17:35:12'),(24,'product',NULL,6089,36000,'ПТ','16','2022-01-21 17:35:18','2022-01-21 17:35:18'),(25,'category','Предметы интерьера',NULL,NULL,'ПН','10','2022-01-24 11:10:33','2022-01-24 11:10:33'),(26,'category','Другие предметы интерьера',NULL,NULL,'ПН','10','2022-01-24 11:10:39','2022-01-24 11:10:39'),(27,'category','Другие предметы интерьера',NULL,NULL,'ПН','10','2022-01-24 11:11:35','2022-01-24 11:11:35'),(28,'product',NULL,6039,7500,'ПН','10','2022-01-24 11:11:44','2022-01-24 11:11:44'),(29,'category','Другие предметы интерьера',NULL,NULL,'ПН','10','2022-01-24 11:13:21','2022-01-24 11:13:21'),(30,'category','Другие предметы интерьера',NULL,NULL,'ПН','10','2022-01-24 11:14:29','2022-01-24 11:14:29'),(31,'category','Другие предметы интерьера',NULL,NULL,'ПН','10','2022-01-24 11:15:07','2022-01-24 11:15:07'),(32,'category','Другие предметы интерьера',NULL,NULL,'ПН','10','2022-01-24 11:16:47','2022-01-24 11:16:47'),(33,'category','Другие предметы интерьера',NULL,NULL,'ПН','10','2022-01-24 11:17:11','2022-01-24 11:17:11'),(34,'category','Фарфор, фаянс, керамика',NULL,NULL,'ПН','15','2022-01-24 16:59:18','2022-01-24 16:59:18'),(35,'category','Декоративные панно, тарелки',NULL,NULL,'ПН','15','2022-01-24 16:59:20','2022-01-24 16:59:20'),(36,'category','Большие декоративные тарелки',NULL,NULL,'ПН','15','2022-01-24 16:59:22','2022-01-24 16:59:22'),(37,'category','Большие декоративные тарелки',NULL,NULL,'ПН','16','2022-01-24 17:00:09','2022-01-24 17:00:09'),(38,'category','Большие декоративные тарелки',NULL,NULL,'ПН','16','2022-01-24 17:00:30','2022-01-24 17:00:30'),(39,'category','Большие декоративные тарелки',NULL,NULL,'ПН','16','2022-01-24 17:00:45','2022-01-24 17:00:45'),(40,'category','Фарфор, фаянс, керамика',NULL,NULL,'ПН','16','2022-01-24 17:37:56','2022-01-24 17:37:56'),(41,'category','Декоративные панно, тарелки',NULL,NULL,'ПН','16','2022-01-24 17:37:58','2022-01-24 17:37:58'),(42,'category','Большие декоративные тарелки',NULL,NULL,'ПН','16','2022-01-24 17:38:00','2022-01-24 17:38:00'),(43,'category','Большие декоративные тарелки',NULL,NULL,'ПН','16','2022-01-24 17:40:31','2022-01-24 17:40:31'),(44,'category','Большие декоративные тарелки',NULL,NULL,'ПН','16','2022-01-24 17:40:49','2022-01-24 17:40:49'),(45,'product',NULL,6088,10000,'ПН','16','2022-01-24 17:40:52','2022-01-24 17:40:52'),(46,'category','Большие декоративные тарелки',NULL,NULL,'ПН','16','2022-01-24 17:40:53','2022-01-24 17:40:53'),(47,'category','Большие декоративные тарелки',NULL,NULL,'ПН','16','2022-01-24 17:41:00','2022-01-24 17:41:00'),(48,'category','Большие декоративные тарелки',NULL,NULL,'ПН','16','2022-01-24 17:47:51','2022-01-24 17:47:51'),(49,'product',NULL,6088,10000,'ПН','16','2022-01-24 17:48:08','2022-01-24 17:48:08');
/*!40000 ALTER TABLE `browsing_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-25  8:16:22
