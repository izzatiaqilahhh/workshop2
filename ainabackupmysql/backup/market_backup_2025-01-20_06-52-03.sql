-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: hostelcomplaint
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `Complaint_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Complaint_Type` varchar(50) NOT NULL,
  `Complaint_Issue` varchar(50) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Image` blob DEFAULT NULL,
  `Date_Created` date NOT NULL,
  `Date_Resolved` date DEFAULT NULL,
  `Student_ID` int(11) NOT NULL,
  `Room_ID` int(11) NOT NULL,
  PRIMARY KEY (`Complaint_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (1,'Plumbing','Leaking tap in the bathroom','Water from sink keep coming out',NULL,'2024-12-01',NULL,3,3),(2,'Electrical','Power outage in the room','The power keeps tripping and we have no lights.',NULL,'2024-12-01',NULL,1,1),(3,'Security','Broken lock on main door','The door lock is broken, and it feels unsafe.',NULL,'2024-12-03',NULL,2,3),(4,'Plumbing','Clogged bathroom sink','The water drains very slowly from the sink.',NULL,'2024-12-04',NULL,3,3),(5,'Electrical','Flickering lights in the hallway','The hallway lights are not stable.',NULL,'2024-12-01',NULL,4,4),(6,'Plumbing','No hot water in the shower','The water heater seems to be broken.',NULL,'2024-12-05',NULL,5,4),(39,'Electrical','Flickering lights in the hallway 	','The hallway lights are not stable.',NULL,'2025-02-06',NULL,3,3),(40,'Plumbing','Clogged bathroom sink','The water drains very slowly from the sink',NULL,'2025-01-08',NULL,3,3);
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_assignment`
--

DROP TABLE IF EXISTS `complaint_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_assignment` (
  `Complaint_Id` int(11) NOT NULL,
  `Worker_Id` int(11) NOT NULL,
  `Date_Assigned` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Complaint_Id`,`Worker_Id`),
  KEY `Worker_Id` (`Worker_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_assignment`
--

LOCK TABLES `complaint_assignment` WRITE;
/*!40000 ALTER TABLE `complaint_assignment` DISABLE KEYS */;
INSERT INTO `complaint_assignment` VALUES (1,1,'2025-01-09 08:47:26',''),(2,2,'2025-01-09 07:02:50',''),(4,1,'2025-01-09 07:37:29',''),(5,2,'2025-01-09 07:35:47',''),(6,1,'2025-01-11 22:45:54',''),(39,2,'2025-01-12 21:46:34',''),(40,1,'2025-01-11 22:44:04','');
/*!40000 ALTER TABLE `complaint_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_status`
--

DROP TABLE IF EXISTS `complaint_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_status` (
  `Status_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Complaint_Status` enum('Assigned','Pending','In Progress','Resolved') NOT NULL DEFAULT 'Pending',
  `Description` text DEFAULT NULL,
  `Date_Update_Status` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Complaint_ID` int(11) NOT NULL,
  PRIMARY KEY (`Status_ID`),
  KEY `Complaint_ID` (`Complaint_ID`),
  CONSTRAINT `Complaint_Status_ibfk_1` FOREIGN KEY (`Complaint_ID`) REFERENCES `complaint` (`Complaint_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_status`
--

LOCK TABLES `complaint_status` WRITE;
/*!40000 ALTER TABLE `complaint_status` DISABLE KEYS */;
INSERT INTO `complaint_status` VALUES (6,'Assigned','Complaint has been assigned to a worker','2025-01-09 07:24:10',2),(7,'Assigned','Complaint has been assigned to a worker','2025-01-09 07:36:39',5),(8,'Assigned','Complaint has been assigned to a worker','2025-01-09 07:37:29',4),(9,'Assigned','Complaint has been assigned to a worker','2025-01-09 08:47:26',1),(10,'Assigned','Complaint has been assigned to a worker','2025-01-11 22:44:04',40),(11,'Assigned','Complaint has been assigned to a worker','2025-01-11 22:45:54',6),(12,'Assigned','Complaint has been assigned to a worker','2025-01-12 21:46:34',39);
/*!40000 ALTER TABLE `complaint_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_company`
--

DROP TABLE IF EXISTS `maintenance_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_company` (
  `Company_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Company_Name` varchar(100) NOT NULL,
  `Company_Office_No` varchar(20) NOT NULL,
  `Company_Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Company_Id`),
  UNIQUE KEY `Company_Email` (`Company_Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_company`
--

LOCK TABLES `maintenance_company` WRITE;
/*!40000 ALTER TABLE `maintenance_company` DISABLE KEYS */;
INSERT INTO `maintenance_company` VALUES (1,'ProFix Services','0123456789','info@profixservices.com'),(2,'HandySolutions Co.','9876543210','support@handysolutions.com'),(3,'Elite Maintainers','1231231234','contact@elitemaintainers.com');
/*!40000 ALTER TABLE `maintenance_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_worker`
--

DROP TABLE IF EXISTS `maintenance_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_worker` (
  `Worker_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Worker_No` varchar(5) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(12) NOT NULL,
  `Phone_No` varchar(10) NOT NULL,
  `Specialization` varchar(100) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  PRIMARY KEY (`Worker_Id`),
  UNIQUE KEY `Worker_No` (`Worker_No`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Company_Id` (`Company_Id`),
  CONSTRAINT `Maintenance_Worker_ibfk_1` FOREIGN KEY (`Company_Id`) REFERENCES `maintenance_company` (`Company_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_worker`
--

LOCK TABLES `maintenance_worker` WRITE;
/*!40000 ALTER TABLE `maintenance_worker` DISABLE KEYS */;
INSERT INTO `maintenance_worker` VALUES (1,'W001','Ali Ahmad','ali.ahmad@profixservices.com','$2y$10$zmixb','0112345678','Plumbing',1),(2,'W002','Sara Tan','sara.tan@handysolutions.com','$2y$10$RjADj','0123456789','Electrical',2),(3,'W003','John Lim','john.lim@elitemaintainers.com','$2y$10$tmitb','0139876543','HVAC Systems',3),(4,'W004','Nina Yusof','nina.yusof@profixservices.com','admin1234','0198765432','Carpentry',1),(5,'W005','Peter Wong','peter.wong@handysolutions.com','workpass','0167890123','General Maintenance',2),(6,'W006','Nur \'Aina','ainayusrill2706@gmail.com','$2y$10$mOv66','0137540390','Plumbing',1),(7,'W007','Muhammad Aiman','aiman@gmail.com','$2y$10$4REHi','0133397370','Electrical',2);
/*!40000 ALTER TABLE `maintenance_worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-20 14:52:03
