-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banking_system
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `balance` decimal(15,2) DEFAULT '0.00',
  `account_date` date DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (5001,1001,101,'Savings',25000.00,'2026-01-10'),(5002,1002,102,'Current',40000.00,'2026-01-15'),(5003,1003,103,'Savings',18000.00,'2026-01-20'),(5004,1004,104,'Savings',32000.00,'2026-01-25'),(5005,1005,105,'Current',55000.00,'2026-02-01'),(5006,1006,106,'Savings',22000.00,'2026-02-05'),(5007,1007,107,'Savings',15000.00,'2026-02-10'),(5008,1008,108,'Current',48000.00,'2026-02-15'),(5009,1009,109,'Savings',27500.00,'2026-02-20'),(5010,1010,110,'Savings',19500.00,'2026-02-25'),(5011,1011,111,'Current',62000.00,'2026-03-01'),(5012,1012,112,'Savings',28500.00,'2026-03-05'),(5013,1013,113,'Savings',17500.00,'2026-03-10'),(5014,1014,114,'Current',70000.00,'2026-03-12'),(5015,1015,115,'Savings',24500.00,'2026-03-15'),(5016,1001,101,'Current',35000.00,'2026-03-18'),(5017,1002,102,'Savings',21000.00,'2026-03-20'),(5018,1003,103,'Current',45000.00,'2026-03-22'),(5019,1004,104,'Savings',19000.00,'2026-03-25'),(5020,1005,105,'Savings',33000.00,'2026-03-28');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `branch_name` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (101,NULL,'Chennai Main Branch','Chennai','Anna Nagar'),(102,NULL,'Coimbatore Branch','Coimbatore','Gandhipuram'),(103,NULL,'Madurai Branch','Madurai','KK Nagar'),(104,NULL,'Trichy Branch','Trichy','Thillai Nagar'),(105,NULL,'Salem Branch','Salem','Fairlands'),(106,NULL,'Tirunelveli Branch','Tirunelveli','Palayamkottai'),(107,NULL,'Erode Branch','Erode','Perundurai Road'),(108,NULL,'Vellore Branch','Vellore','Katpadi'),(109,NULL,'Thanjavur Branch','Thanjavur','Medical College Road'),(110,NULL,'Thoothukudi Branch','Thoothukudi','Millerpuram'),(111,NULL,'Dindigul Branch','Dindigul','RM Colony'),(112,NULL,'Karur Branch','Karur','Jawahar Bazaar'),(113,NULL,'Kanchipuram Branch','Kanchipuram','Gandhi Road'),(114,NULL,'Tiruppur Branch','Tiruppur','Avinashi Road'),(115,NULL,'Nagercoil Branch','Nagercoil','Vadasery');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `card_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `account_id` int NOT NULL,
  `card_type` varchar(30) DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (9001,1001,5001,'Debit Card','4532123456781001','2029-01-31','Active'),(9002,1002,5002,'Debit Card','4532123456781002','2029-02-28','Active'),(9003,1003,5003,'Credit Card','5234567890121003','2028-03-31','Active'),(9004,1004,5004,'Debit Card','4532123456781004','2029-04-30','Active'),(9005,1005,5005,'Credit Card','5234567890121005','2028-05-31','Active'),(9006,1006,5006,'Debit Card','4532123456781006','2029-06-30','Blocked'),(9007,1007,5007,'Debit Card','4532123456781007','2029-07-31','Active'),(9008,1008,5008,'Credit Card','5234567890121008','2028-08-31','Active'),(9009,1009,5009,'Debit Card','4532123456781009','2029-09-30','Active'),(9010,1010,5010,'Debit Card','4532123456781010','2029-10-31','Active'),(9011,1011,5011,'Credit Card','5234567890121011','2028-11-30','Active'),(9012,1012,5012,'Debit Card','4532123456781012','2029-12-31','Active'),(9013,1013,5013,'Debit Card','4532123456781013','2030-01-31','Active'),(9014,1014,5014,'Credit Card','5234567890121014','2029-02-28','Active'),(9015,1015,5015,'Debit Card','4532123456781015','2030-03-31','Blocked'),(9016,1001,5016,'Credit Card','5234567890121016','2029-04-30','Active'),(9017,1002,5017,'Debit Card','4532123456781017','2030-05-31','Active'),(9018,1003,5018,'Credit Card','5234567890121018','2029-06-30','Active'),(9019,1004,5019,'Debit Card','4532123456781019','2030-07-31','Active'),(9020,1005,5020,'Credit Card','5234567890121020','2029-08-31','Active');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1001,'Arun Kumar','Male','1998-04-12','9876543210','delhi'),(1002,'Priya S','Female','1999-07-21','9876543211','Coimbatore'),(1003,'Rahul M','Male','1995-02-15','9876543212','Madurai'),(1004,'Karthik R','Male','1997-08-10','9876543213','Trichy'),(1005,'Divya P','Female','2000-01-25','9876543214','Salem'),(1006,'Suresh B','Male','1994-11-18','9876543215','Tirunelveli'),(1007,'Anitha K','Female','1998-05-30','9876543216','Erode'),(1008,'Vignesh S','Male','1996-09-14','9876543217','Vellore'),(1009,'Meena R','Female','1999-03-08','9876543218','Thanjavur'),(1010,'Prakash N','Male','1993-12-20','9876543219','Thoothukudi'),(1011,'Sneha V','Female','2001-06-11','9876543220','Dindigul'),(1012,'Manoj K','Male','1995-10-05','9876543221','Karur'),(1013,'Pavithra S','Female','1997-04-22','9876543222','Kanchipuram'),(1014,'Dinesh R','Male','1992-07-16','9876543223','Tiruppur'),(1015,'Harini M','Female','2000-09-27','9876543224','Nagercoil'),(1016,'Gokul P','Male','1996-01-13','9876543225','Chennai'),(1017,'Keerthana R','Female','1998-11-06','9876543226','Coimbatore'),(1018,'Santhosh K','Male','1994-03-19','9876543227','Madurai'),(1019,'Aishwarya T','Female','1999-12-02','9876543228','Salem'),(1020,'Mohan S','Male','1995-06-25','9876543229','Trichy');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `loan_type` varchar(50) DEFAULT NULL,
  `loan_amount` decimal(15,2) DEFAULT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL,
  `loan_date` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL,
  `account_id` int NOT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `transaction_date` date NOT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (10001,5001,'Savings',5000.00,'2026-01-05','UPI'),(10002,5001,'Savings',2500.00,'2026-01-10','ATM'),(10003,5002,'Current',10000.00,'2026-01-12','NEFT'),(10004,5003,'Savings',3000.00,'2026-01-15','UPI'),(10005,5001,'Savings',1500.00,'2026-01-20','Debit Card'),(10006,5002,'Current',7500.00,'2026-01-22','IMPS'),(10007,5003,'Savings',2000.00,'2026-01-25','ATM'),(10008,5001,'Savings',4500.00,'2026-02-02','UPI'),(10009,5002,'Current',12000.00,'2026-02-05','NEFT'),(10010,5003,'Savings',3500.00,'2026-02-10','Debit Card'),(10011,5001,'Savings',8000.00,'2026-02-15','IMPS'),(10012,5002,'Current',5000.00,'2026-02-18','UPI'),(10013,5003,'Savings',2500.00,'2026-02-20','ATM'),(10014,5001,'Savings',6000.00,'2026-03-01','NEFT'),(10015,5002,'Current',9000.00,'2026-03-05','UPI'),(10016,5003,'Savings',4000.00,'2026-03-08','IMPS'),(10017,5001,'Savings',3000.00,'2026-03-12','ATM'),(10018,5002,'Current',15000.00,'2026-03-15','NEFT'),(10019,5003,'Savings',5500.00,'2026-03-18','Debit Card'),(10020,5001,'Savings',7000.00,'2026-03-20','UPI');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-20 13:02:39
