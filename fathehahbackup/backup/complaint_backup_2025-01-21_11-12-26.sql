-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: hostelcomplaint
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB-log

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
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `block_id` int(11) NOT NULL AUTO_INCREMENT,
  `block_name` varchar(10) NOT NULL,
  `block_gender` varchar(6) NOT NULL,
  `number_of_floors` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`block_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,'Lekiu','Female',9,1),(2,'Lekir','Female',9,2),(3,'Kasturi','Male',9,3),(4,'Jebat','Male',9,4),(5,'Tuah','Male',9,5);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floor` (
  `floor_id` int(11) NOT NULL AUTO_INCREMENT,
  `floor_no` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  PRIMARY KEY (`floor_id`) USING BTREE,
  KEY `Block_ID` (`block_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor`
--

LOCK TABLES `floor` WRITE;
/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
INSERT INTO `floor` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,1,2),(11,2,2),(12,3,2),(13,4,2),(14,5,2),(15,6,2),(16,7,2),(17,8,2),(18,9,2),(19,1,3),(20,2,3),(21,3,3),(22,4,3),(23,5,3),(24,6,3),(25,7,3),(26,8,3),(27,9,3),(28,1,4),(29,2,4),(30,3,4),(31,4,4),(32,5,4),(33,6,4),(34,7,4),(35,8,4),(36,9,4),(37,1,5),(38,2,5),(39,3,5),(40,4,5),(41,5,5),(42,6,5),(43,7,5),(44,8,5),(45,9,5);
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house` (
  `house_id` int(11) NOT NULL AUTO_INCREMENT,
  `house_no` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  PRIMARY KEY (`house_id`) USING BTREE,
  KEY `Floor_ID` (`floor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,1,2),(14,2,2),(15,3,2),(16,4,2),(17,5,2),(18,6,2),(19,7,2),(20,8,2),(21,9,2),(22,10,2),(23,11,2),(24,12,2),(25,1,3),(26,2,3),(27,3,3),(28,4,3),(29,5,3),(30,6,3),(31,7,3),(32,8,3),(33,9,3),(34,10,3),(35,11,3),(36,12,3),(37,1,4),(38,2,4),(39,3,4),(40,4,4),(41,5,4),(42,6,4),(43,7,4),(44,8,4),(45,9,4),(46,10,4),(47,11,4),(48,12,4),(49,1,5),(50,2,5),(51,3,5),(52,4,5),(53,5,5),(54,6,5),(55,7,5),(56,8,5),(57,9,5),(58,10,5),(59,11,5),(60,12,5),(61,1,6),(62,2,6),(63,3,6),(64,4,6),(65,5,6),(66,6,6),(67,7,6),(68,8,6),(69,9,6),(70,10,6),(71,11,6),(72,12,6),(73,1,7),(74,2,7),(75,3,7),(76,4,7),(77,5,7),(78,6,7),(79,7,7),(80,8,7),(81,9,7),(82,10,7),(83,11,7),(84,12,7),(85,1,8),(86,2,8),(87,3,8),(88,4,8),(89,5,8),(90,6,8),(91,7,8),(92,8,8),(93,9,8),(94,10,8),(95,11,8),(96,12,8),(97,1,9),(98,2,9),(99,3,9),(100,4,9),(101,5,9),(102,6,9),(103,7,9),(104,8,9),(105,9,9),(106,10,9),(107,11,9),(108,12,9),(109,1,10),(110,2,10),(111,3,10),(112,4,10),(113,5,10),(114,6,10),(115,7,10),(116,8,10),(117,9,10),(118,10,10),(119,11,10),(120,12,10),(121,1,11),(122,2,11),(123,3,11),(124,4,11),(125,5,11),(126,6,11),(127,7,11),(128,8,11),(129,9,11),(130,10,11),(131,11,11),(132,12,11),(133,1,12),(134,2,12),(135,3,12),(136,4,12),(137,5,12),(138,6,12),(139,7,12),(140,8,12),(141,9,12),(142,10,12),(143,11,12),(144,12,12),(145,1,13),(146,2,13),(147,3,13),(148,4,13),(149,5,13),(150,6,13),(151,7,13),(152,8,13),(153,9,13),(154,10,13),(155,11,13),(156,12,13),(157,1,14),(158,2,14),(159,3,14),(160,4,14),(161,5,14),(162,6,14),(163,7,14),(164,8,14),(165,9,14),(166,10,14),(167,11,14),(168,12,14),(169,1,15),(170,2,15),(171,3,15),(172,4,15),(173,5,15),(174,6,15),(175,7,15),(176,8,15),(177,9,15),(178,10,15),(179,11,15),(180,12,15),(181,1,16),(182,2,16),(183,3,16),(184,4,16),(185,5,16),(186,6,16),(187,7,16),(188,8,16),(189,9,16),(190,10,16),(191,11,16),(192,12,16),(193,1,17),(194,2,17),(195,3,17),(196,4,17),(197,5,17),(198,6,17),(199,7,17),(200,8,17),(201,9,17),(202,10,17),(203,11,17),(204,12,17),(205,1,18),(206,2,18),(207,3,18),(208,4,18),(209,5,18),(210,6,18),(211,7,18),(212,8,18),(213,9,18),(214,10,18),(215,11,18),(216,12,18);
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_password_resets_email` (`email`) USING BTREE,
  CONSTRAINT `fk_password_resets_email` FOREIGN KEY (`email`) REFERENCES `student` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`email`) REFERENCES `student` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES (17,'B032210139@student.utem.edu.my','72a4631d89957c9c78aa2cbe9da4c5a7',1737267597,'2025-01-19 05:49:57');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` varchar(15) NOT NULL,
  `hostel_block` varchar(10) NOT NULL,
  `capacity` int(11) NOT NULL,
  `current_occupants` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  PRIMARY KEY (`room_id`) USING BTREE,
  UNIQUE KEY `Room_No` (`room_no`) USING BTREE,
  KEY `House_ID` (`house_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'SQ-1-1-A','Lekiu',2,1,1),(2,'SQ-1-1-B','Lekiu',2,2,1),(3,'SQ-1-1-C','Lekiu',2,2,1),(4,'SQ-1-1-D','Lekiu',2,2,1),(5,'SQ-1-1-E','Lekiu',2,1,1),(6,'SQ-1-2-A','Lekiu',2,2,2),(7,'SQ-1-2-B','Lekiu',2,2,2),(8,'SQ-1-2-C','Lekiu',2,1,2),(9,'SQ-1-2-D','Lekiu',2,2,2),(10,'SQ-1-2-E','Lekiu',2,2,2),(11,'SQ-1-3-A','Lekiu',2,2,3),(12,'SQ-1-3-B','Lekiu',2,1,3),(13,'SQ-1-3-C','Lekiu',2,2,3),(14,'SQ-1-3-D','Lekiu',2,2,3),(15,'SQ-1-3-E','Lekiu',2,2,3);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `matric_no` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `course` varchar(100) NOT NULL,
  `faculty` varchar(100) NOT NULL,
  `year_of_study` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  UNIQUE KEY `Matric_No` (`matric_no`) USING BTREE,
  UNIQUE KEY `Email` (`email`) USING BTREE,
  UNIQUE KEY `Phone_No` (`phone_no`) USING BTREE,
  KEY `Room_ID` (`room_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'B032210139','Nur Fathehah Binti Mohd Aris','B032210139@student.utem.edu.my','$2y$12$4ih1p3dYQKOXQ4nijFlEKuPqUYHTOE0QnMXVLugCe4hW80SFJRRMO','0199590828','Female','Database Management','FTMK',2,1),(2,'B032210137','Afifah Syaza Huda Binti Ahmad','B032210137@gmail.com','password','0186670909','Female','Database Management','FTMK',3,3),(3,'B032210135','Amiera Badriesya Binti Kamal','B032210135@student.utem.edu.my','$2y$12$WbgfQKGPS1H97aMeWjXRAOEnl57209YEm0IDlXhBDXUL0ptqI5Owm','0178863773','Female','Database Management','FTMK',2,3),(4,'B032210267','Nurin Hannah Binti Zamberi','B032210267@gmail.com','$2y$12$3m4jlWP60vCs1WOUwxOFnOK3f4OLO8S4p3m/u.5HJ81IbDtRjV4g6','0162235567','Female','Database Management','FTMK',3,4),(5,'B032210166','Nur Aqila Nadzira Binti Shahlan','B032210166@gmail.com','password','0175685078','Female','Database Management','FTMK',3,4);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-21 19:12:26
