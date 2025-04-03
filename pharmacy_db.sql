-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pharmacy
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Cid` int NOT NULL AUTO_INCREMENT,
  `CName` varchar(32) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(32) DEFAULT NULL,
  `Phone` mediumtext,
  `Insid` int DEFAULT NULL,
  PRIMARY KEY (`Cid`),
  KEY `Insid` (`Insid`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Insid`) REFERENCES `insurance` (`insid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Mohammed Ahmed',30,'Male','0591234567',1),(2,'Fatima Youssef',25,'Female','0599876543',2),(3,'Omar Khaled',45,'Male','0591112223',3),(4,'Hala Ibrahim',38,'Female','0593334445',4),(5,'Samira Saleh',50,'Female','0595556667',5),(6,'Mohammed Ahmed',30,'Male','0591234567',1),(7,'Fatima Youssef',25,'Female','0599876543',2),(8,'Omar Khaled',45,'Male','0591112223',3),(9,'Hala Ibrahim',38,'Female','0593334445',4),(10,'Samira Saleh',50,'Female','0595556667',5),(12,'ahlam',18,'Female','1234567899',8),(13,'amro',21,'Male','2851653135',2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `did` int NOT NULL AUTO_INCREMENT,
  `dname` varchar(32) DEFAULT NULL,
  `specialty` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Dr. Ali Hassan','General Physician'),(2,'Dr. Leila Mahmoud','Cardiologist'),(3,'Dr. Yasser Najeeb','Pediatrician'),(4,'Dr. Salma Tariq','Dermatologist'),(5,'Dr. Sami Hatem','Orthopedic Surgeon'),(6,'Dr. Ali Hassan','General Physician'),(7,'Dr. Leila Mahmoud','Cardiologist'),(8,'Dr. Yasser Najeeb','Pediatrician'),(9,'Dr. Salma Tariq','Dermatologist'),(10,'Dr. Sami Hatem','Orthopedic Surgeon');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `insid` int NOT NULL AUTO_INCREMENT,
  `instype` varchar(32) DEFAULT NULL,
  `company` varchar(32) DEFAULT NULL,
  `coverageSdate` date DEFAULT NULL,
  `coverageEdate` date DEFAULT NULL,
  PRIMARY KEY (`insid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'Health','Palestinian Insurance Company','2025-01-01','2025-12-31'),(2,'Comprehensive Medical','Takaful Palestinian Company','2025-01-01','2025-12-31'),(3,'Health','Al-Quds Insurance','2025-01-01','2025-12-31'),(4,'Comprehensive Medical','Ramallah Assurance','2025-01-01','2025-12-31'),(5,'Dental','Nablus Insurance Group','2025-01-01','2025-12-31'),(6,'Health','Palestinian Insurance Company','2025-01-01','2025-12-31'),(7,'Comprehensive Medical','Takaful Palestinian Company','2025-01-01','2025-12-31'),(8,'Health','Al-Quds Insurance','2025-01-01','2025-12-31'),(9,'Comprehensive Medical','Ramallah Assurance','2025-01-01','2025-12-31'),(10,'Dental','Nablus Insurance Group','2025-01-01','2025-12-31');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `vid` int NOT NULL AUTO_INCREMENT,
  `paymentMeth` varchar(32) DEFAULT NULL,
  `pharid` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `pharid` (`pharid`),
  KEY `cid` (`cid`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`pharid`) REFERENCES `pharmacist` (`phid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `customer` (`Cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (2,'cash',1,1),(3,'Paypal',2,2),(4,'visa',2,2),(5,'cash',1,2),(6,'cash',1,12),(7,'visa',1,13);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_med`
--

DROP TABLE IF EXISTS `invoice_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_med` (
  `invid` int NOT NULL,
  `mid` int NOT NULL,
  `cid` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `sdate` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`invid`,`mid`,`cid`),
  KEY `mid` (`mid`,`cid`),
  CONSTRAINT `invoice_med_ibfk_1` FOREIGN KEY (`invid`) REFERENCES `invoice` (`vid`) ON DELETE CASCADE,
  CONSTRAINT `invoice_med_ibfk_2` FOREIGN KEY (`mid`, `cid`) REFERENCES `medicine` (`mid`, `cid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_med`
--

LOCK TABLES `invoice_med` WRITE;
/*!40000 ALTER TABLE `invoice_med` DISABLE KEYS */;
INSERT INTO `invoice_med` VALUES (4,1,2,2,'2010'),(5,2,3,10,'2015'),(6,2,3,1,'2005'),(6,4,4,1,'2005');
/*!40000 ALTER TABLE `invoice_med` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `address` varchar(32) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (2,'Ramallah','Palestinian Pharmaceutical ','595874826'),(3,'Nablus','Nablus Pharmaceutical Industries','594874826'),(4,'Hebron','Hebron MedTech','594874626'),(5,'Gaza','Gaza Health Supplies','594874326'),(6,'Jenin','Jenin Pharma Group','594814326'),(8,'ramllah','bir','5668748973');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `mType` varchar(50) DEFAULT NULL,
  `dosage` varchar(32) DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `cid` int NOT NULL,
  PRIMARY KEY (`mid`,`cid`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'tablet','70mg','2025-02-01',100,198,2),(2,'capsule','400mg','2026-02-07',10.5,189,3),(3,'Syrup','250ml','2026-01-15',15,73,3),(4,'Injection','1ml','2025-10-10',25,29,4);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacist`
--

DROP TABLE IF EXISTS `pharmacist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacist` (
  `phid` int NOT NULL AUTO_INCREMENT,
  `phname` varchar(32) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `contact_info` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`phid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacist`
--

LOCK TABLES `pharmacist` WRITE;
/*!40000 ALTER TABLE `pharmacist` DISABLE KEYS */;
INSERT INTO `pharmacist` VALUES (1,'Khaled Issa',40,'Male','0597654321'),(2,'nada',35,'Female','0598716483'),(3,'ahmad',30,'Male','0598741349');
/*!40000 ALTER TABLE `pharmacist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `did` int NOT NULL,
  `cusid` int NOT NULL,
  `mid` int NOT NULL,
  `per_text` varchar(64) DEFAULT NULL,
  `per_date` date DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`did`,`cusid`,`mid`),
  KEY `cusid` (`cusid`),
  KEY `mid` (`mid`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`) ON DELETE CASCADE,
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`cusid`) REFERENCES `customer` (`Cid`) ON DELETE CASCADE,
  CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`mid`) REFERENCES `medicine` (`mid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,2,1,'Take one tablet daily after meals','2025-01-10',30),(2,2,2,'Take one teaspoon three times daily','2025-01-11',20),(3,3,3,'Use two capsules every 8 hours','2025-01-12',60),(4,4,4,'Inject once a week for a month','2025-01-14',4);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-04  2:16:27
