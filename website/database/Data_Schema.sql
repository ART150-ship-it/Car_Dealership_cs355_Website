CREATE DATABASE  IF NOT EXISTS `dealership` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dealership`;
-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (x86_64)
--
-- Host: localhost    Database: dealership
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
-- Table structure for table `Car`
--

DROP TABLE IF EXISTS `Car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Car` (
  `vin` char(17) NOT NULL,
  `body_type` varchar(10) DEFAULT NULL,
  `drive_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`vin`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `Vehicle` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car`
--

LOCK TABLES `Car` WRITE;
/*!40000 ALTER TABLE `Car` DISABLE KEYS */;
/*!40000 ALTER TABLE `Car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `ssn` char(9) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `credit_score` int DEFAULT NULL,
  `secondary_owner` varchar(30) DEFAULT NULL,
  `purchased_vehicle` char(17) DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  KEY `purchased_vehicle` (`purchased_vehicle`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`purchased_vehicle`) REFERENCES `Vehicle` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('332441111','Thaddeus Quill','5558219230','456 Redwood Ln, Eureka California',680,'Maribel Quill',NULL),('432552222','Elowen Faraday','5558219000','321 Cypress Dr, Monterey, California',720,NULL,NULL),('923773333','Percival Hawthorne','5559999999','202 Sunset Blvd, Beverly Hills, California',810,'Seraphina Hawthorne',NULL);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `id` int NOT NULL,
  `phone_number` varchar(25) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (100,'7075262722','Service'),(101,'7075425377','Sales'),(102,'7076837873','Finance');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `ssn` char(9) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `pay` int DEFAULT NULL,
  `tenure` int DEFAULT NULL,
  `manager_ssn` char(9) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  KEY `manager_ssn` (`manager_ssn`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`manager_ssn`) REFERENCES `Employee` (`ssn`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `Department` (`id`),
  CONSTRAINT `employee_chk_1` CHECK ((`pay` > 16))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('111223333','Alice Johnson','5551112233',45000,3,'999001111',101),('112233445','Charlotte Hill','5551122334',57500,6,'581043856',100),('123456789','John Smith','5551234567',50000,2,'999001111',101),('123549876','Mark Wilson','5551234987',59800,6,'555443333',102),('213476589','Evan Hawkins','5552134765',62100,7,'555443333',102),('222334444','Michael Green','5552223344',55000,7,'999001111',101),('223344556','Oliver Brooks','5552233445',58000,5,'581043856',100),('321098765','Sophia Daniels','5553210987',56350,4,'555443333',102),('333221111','Kevin Walker','5553332211',53000,6,'999001111',101),('334455667','Amelia Bennett','5553344556',61000,7,'581043856',100),('432875610','Mia Parker','5554328756',63250,5,'555443333',102),('444556666','Robert Brown','5554445566',52000,6,'999001111',101),('445566778','James Evans','5554455667',64000,9,'581043856',100),('456789123','Lucy Adams','5554567891',55200,4,'555443333',102),('555443333','Olivia Martin','5555443333',140000,10,NULL,102),('556677889','Isabella Garcia','5555566778',59000,6,'581043856',100),('581043856','John Doe','5551203222',100000,4,NULL,100),('654321987','Liam Bennett','5556543219',54050,3,'555443333',102),('666554444','Laura Scott','5556665544',49000,5,'999001111',101),('667788990','Luka Tim','5556677889',53000,4,'581043856',100),('777889999','Emily White','5557778899',48000,4,'999001111',101),('778899001','Mia Peterson','5557788990',56000,5,'581043856',100),('789123456','Nathan Cooper','5557891234',60950,5,'555443333',102),('839237593','Stella Carter','5553082255',64400,8,'555443333',102),('876543210','Jack Robinson','5558765432',57500,6,'555443333',102),('888776666','Sarah Black','5558887766',47000,2,'999001111',101),('889900112','Noah Reed','5558899001',60000,8,'581043856',100),('987654321','Jane Doe','5559876543',60000,8,'999001111',101),('990011223','Sophia Hughes','5559900112',62000,7,'581043856',100),('999001111','David Tayor','5559990011',120000,12,NULL,101);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Finance`
--

DROP TABLE IF EXISTS `Finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Finance` (
  `id` int DEFAULT NULL,
  `total_loans` int DEFAULT NULL,
  `total_leases` int DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `finance_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Finance`
--

LOCK TABLES `Finance` WRITE;
/*!40000 ALTER TABLE `Finance` DISABLE KEYS */;
INSERT INTO `Finance` VALUES (102,3,12);
/*!40000 ALTER TABLE `Finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Motorcycle`
--

DROP TABLE IF EXISTS `Motorcycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Motorcycle` (
  `vin` char(17) NOT NULL,
  `ccs` int DEFAULT NULL,
  `motorcycle_type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`vin`),
  CONSTRAINT `motorcycle_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `Vehicle` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Motorcycle`
--

LOCK TABLES `Motorcycle` WRITE;
/*!40000 ALTER TABLE `Motorcycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Motorcycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales` (
  `id` int DEFAULT NULL,
  `total_sales` int DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (101,23);
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Service` (
  `id` int DEFAULT NULL,
  `worked_on_vehicle` char(17) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `worked_on_vehicle` (`worked_on_vehicle`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Department` (`id`),
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`worked_on_vehicle`) REFERENCES `Vehicle` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
INSERT INTO `Service` VALUES (100,NULL),(100,NULL),(100,NULL);
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Truck`
--

DROP TABLE IF EXISTS `Truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Truck` (
  `vin` char(17) NOT NULL,
  `bed_dimensions` varchar(30) DEFAULT NULL,
  `towing_capacity` int DEFAULT NULL,
  `crew_or_single_cab` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`vin`),
  CONSTRAINT `truck_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `Vehicle` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Truck`
--

LOCK TABLES `Truck` WRITE;
/*!40000 ALTER TABLE `Truck` DISABLE KEYS */;
/*!40000 ALTER TABLE `Truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Van_SUV`
--

DROP TABLE IF EXISTS `Van_SUV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Van_SUV` (
  `vin` char(17) NOT NULL,
  `has_third_row` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`vin`),
  CONSTRAINT `van_suv_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `Vehicle` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Van_SUV`
--

LOCK TABLES `Van_SUV` WRITE;
/*!40000 ALTER TABLE `Van_SUV` DISABLE KEYS */;
/*!40000 ALTER TABLE `Van_SUV` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vin` char(17) NOT NULL,
  `mileage` int DEFAULT NULL,
  `combined_mpg` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `make` varchar(30) DEFAULT NULL,
  `model` varchar(30) DEFAULT NULL,
  `trim` varchar(30) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `availability_status` varchar(30) DEFAULT NULL,
  `horsepower` int DEFAULT NULL,
  `known_damage` varchar(50) DEFAULT NULL,
  `sold_by` char(9) DEFAULT NULL,
  `commission_amount` float DEFAULT NULL,
  `date_of_sale` date DEFAULT NULL,
  `date_added_to_lot` date DEFAULT NULL,
  `cylinder_count` int DEFAULT NULL,
  `city_mpg` int DEFAULT NULL,
  `highway_mpg` int DEFAULT NULL,
  `automatic` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`vin`),
  KEY `sold_by` (`sold_by`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`sold_by`) REFERENCES `Employee` (`ssn`),
  CONSTRAINT `vehicle_chk_1` CHECK (((`commission_amount` is null) or (`commission_amount` <= (`price` / 10))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('1D3HV13TX9S811765',176304,15,2009,'Dodge','Ram 1500 Crew Cab','SLT Pickup 4D 5 1/2 FT',8499,'black','available',390,NULL,NULL,NULL,NULL,NULL,8,13,18,1),('1FTFW1R60EFB09696',117302,13,2014,'Ford','F150 SuperCrew Cab','SVT Raptor Pickup 4D 5 1/2 FT',25999,'red','available',411,NULL,NULL,NULL,NULL,NULL,8,11,16,1),('1GC4YLE76NF188285',154983,14,2022,'Chevrolet','Silverado','2500 HD Crew Cab',24999,'white','available',464,NULL,NULL,NULL,NULL,NULL,8,11,16,1),('1J4HR58246C135818',207278,15,2006,'Jeep','Grand Cherokee','Limited Sport Utility 4D',3499,'tan','available',335,NULL,NULL,NULL,NULL,NULL,8,13,18,1),('4S4BTGPD7N3110563',48000,26,2022,'Subaru','Outback','Touring',20999,'white','available',182,NULL,NULL,NULL,NULL,NULL,4,23,30,1),('4T1G11AK0MU463428',87219,32,2021,'Toyota','Camry','SE Sedan 4D',19999,'silver','available',203,NULL,NULL,NULL,NULL,NULL,4,28,39,1),('58ABK1GG8GU020662',92211,24,2016,'Lexus','ES','ES 350 Sedan 4D',15999,'black','available',268,NULL,NULL,NULL,NULL,NULL,6,21,31,1),('5FPYK1F53BB451280',99882,17,2011,'Honda','Ridgeline','RTL Pickup 4D 5 FT',14999,'gray','available',250,NULL,NULL,NULL,NULL,NULL,6,15,20,1),('5TDDY5G17CS056735',180401,14,2012,'Toyota','Sequoia','Platinum Sport Utility 4D',18999,'black','available',381,NULL,NULL,NULL,NULL,NULL,8,13,17,1),('JTEBT17R230020115',199095,15,2003,'Toyota','4Runner','Limited Sport Utility 4D',8999,'gray','available',235,NULL,NULL,NULL,NULL,NULL,8,14,17,1),('KL8CD6SA4LC445024',50186,33,2020,'Chevrolet','Spark','1LT Hatchback 4D',9499,'tan','available',98,NULL,NULL,NULL,NULL,NULL,4,30,38,1),('WP0CA2984YU621180',75043,19,2000,'Porsche','Boxster','Base',12499,'blue','available',217,NULL,NULL,NULL,NULL,NULL,6,16,23,1);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleImages`
--

DROP TABLE IF EXISTS `VehicleImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VehicleImages` (
  `ImageID` int NOT NULL AUTO_INCREMENT,
  `vin` char(17) NOT NULL,
  `ImageURL` varchar(255) NOT NULL,
  `SortOrder` int DEFAULT '1',
  PRIMARY KEY (`ImageID`),
  KEY `VehicleVIN` (`vin`),
  CONSTRAINT `vehicleimages_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `Vehicle` (`vin`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleImages`
--

LOCK TABLES `VehicleImages` WRITE;
/*!40000 ALTER TABLE `VehicleImages` DISABLE KEYS */;
INSERT INTO `VehicleImages` VALUES (31,'1GC4YLE76NF188285','/images/Vehicle/202510-30007804d4a94e6ca4b37130ad9a0049.jpg',1),(32,'1GC4YLE76NF188285','/images/Vehicle/202510-5021407f758a49ce8cbc99e4616e245c.jpg',2),(33,'1GC4YLE76NF188285','/images/Vehicle/202510-5d5393c2ca114454bb5c10b1480e02f2.jpg',3),(34,'1GC4YLE76NF188285','/images/Vehicle/202510-f218f3877f1e48f39fe884661eb3b5f2.jpg',4),(35,'1GC4YLE76NF188285','/images/Vehicle/202510-815dba2454c2422d8182754e43a75c88.jpg',5),(36,'1GC4YLE76NF188285','/images/Vehicle/202510-285526f6ea7f4f6fb0016c310d08d684.jpg',6),(37,'1GC4YLE76NF188285','/images/Vehicle/202510-1b7a7732d8b9405db5db3529f3508fa8.jpg',7),(38,'1GC4YLE76NF188285','/images/Vehicle/202510-3018f86a3267466c9d0299e3110c9460.jpg',8),(39,'1GC4YLE76NF188285','/images/Vehicle/202510-fe89570bb9e640338ee66097e74bc93e.jpg',9),(40,'1GC4YLE76NF188285','/images/Vehicle/202510-17316617ba514237a9ef848a78076823.jpg',10),(41,'1GC4YLE76NF188285','/images/Vehicle/202510-aeb0efd4a36a44ac9245e4e5b16d108b.jpg',11),(42,'1GC4YLE76NF188285','/images/Vehicle/202510-c946f7f218a14f06b340bafcca9bdda7.jpg',12),(43,'1GC4YLE76NF188285','/images/Vehicle/202510-9b8a94190f2746dfa9d82629b0e9bc87.jpg',13),(44,'1GC4YLE76NF188285','/images/Vehicle/202510-5c602744690d4201866ab9717bae1b75.jpg',14),(45,'1GC4YLE76NF188285','/images/Vehicle/202510-760778e07b304783bc2b15ee2620584c.jpg',15),(46,'1GC4YLE76NF188285','/images/Vehicle/202510-f4d40034b97148c8ba0dcaacf7f3d550.jpg',16),(47,'4S4BTGPD7N3110563','/images/Vehicle/202509-5f9e4bc8fb804904a1f40576bd378dcb.jpg',1),(48,'4S4BTGPD7N3110563','/images/Vehicle/202509-9a237a29fcc244f79c1c10019298112b.jpg',2),(49,'4S4BTGPD7N3110563','/images/Vehicle/202509-ac2b96845a8c4195a4d85e21edc39a35.jpg',3),(50,'4S4BTGPD7N3110563','/images/Vehicle/202509-a56f82345bdd456d95d4822368e20e98.jpg',4),(51,'4S4BTGPD7N3110563','/images/Vehicle/202509-ac9a43e06ab746a1a9d8f2b35ea0bbd1.jpg',5),(52,'4S4BTGPD7N3110563','/images/Vehicle/202509-b40b3000e14b4ecf8d98f244446ddd0f.jpg',6),(53,'4S4BTGPD7N3110563','/images/Vehicle/202509-9c684c713d0149b2acaf3c5706d9b166.jpg',7),(54,'4S4BTGPD7N3110563','/images/Vehicle/202509-1cce028f26e54cd4a4551a8c320b3833.jpg',8),(55,'4S4BTGPD7N3110563','/images/Vehicle/202509-398591ee1909467a8cad8d701229a8fc.jpg',9),(56,'4S4BTGPD7N3110563','/images/Vehicle/202509-a3e07f67605c4681bae95a2003b27394.jpg',10),(57,'4S4BTGPD7N3110563','/images/Vehicle/202509-de5ca706b2224d93967b1bd5b8de2a90.jpg',11),(58,'4S4BTGPD7N3110563','/images/Vehicle/202509-40392971735a450a977cd60876ed8f3d.jpg',12),(59,'WP0CA2984YU621180','/images/Vehicle/202605-68104da8943b495cac7aab6e1db45fe9.jpg',1),(60,'WP0CA2984YU621180','/images/Vehicle/202605-02423fb0ab9e4397af757a46b16b68c6.jpg',2),(61,'WP0CA2984YU621180','/images/Vehicle/202605-e86243fda5e540f1a4bb7c11440cfee8.jpg',3),(62,'WP0CA2984YU621180','/images/Vehicle/202605-73ee7f2be3f246399287bb2a43d342a1.jpg',4),(63,'WP0CA2984YU621180','/images/Vehicle/202605-e9898dd31aa14f17975cd5dd41953888.jpg',5),(64,'WP0CA2984YU621180','/images/Vehicle/202605-6d594ff0ffc7429c97e7fda2440b1480.jpg',6),(65,'WP0CA2984YU621180','/images/Vehicle/202605-2e6085944e304331b12e43e94db11838.jpg',7),(66,'WP0CA2984YU621180','/images/Vehicle/202605-ba22e5c6b4954283a3bb46b61ed811ff.jpg',8),(67,'WP0CA2984YU621180','/images/Vehicle/202605-bff8dcf5d05249e480d8ca245fa41708.jpg',9),(68,'WP0CA2984YU621180','/images/Vehicle/202605-f85f3d68ca1b46cbb90da10ffbca99d2.jpg',10),(69,'1J4HR58246C135818','/images/Vehicle/202604-853639c97fbd404ab150003d58185e51.jpg',1),(70,'1J4HR58246C135818','/images/Vehicle/202604-39348d482b664cc3894b34d4ea7a6472.jpg',2),(71,'1J4HR58246C135818','/images/Vehicle/202604-e15123ddd0314405b4594451cbd9c983.jpg',3),(72,'1J4HR58246C135818','/images/Vehicle/202604-0024d8a535ab4dc189f316a8e173413e.jpg',4),(73,'1J4HR58246C135818','/images/Vehicle/202604-c4f97a569b2d4b75afe1432a50357020.jpg',5),(74,'1J4HR58246C135818','/images/Vehicle/202604-77ae20c21a0b4a9b8e7fc7f1b375fa18.jpg',6),(75,'1J4HR58246C135818','/images/Vehicle/202604-5327b43ba47f45329756a93153a8785a.jpg',7),(76,'1J4HR58246C135818','/images/Vehicle/202604-4f601f92c86548bcb810cadae4d99ed6.jpg',8),(77,'1J4HR58246C135818','/images/Vehicle/202604-a704adfdc65d44d4828aeb2ce355e072.jpg',9),(78,'1J4HR58246C135818','/images/Vehicle/202604-a6917df7f2ef471d85e0e3beabc56c84.jpg',10),(79,'1J4HR58246C135818','/images/Vehicle/202604-9b7680d143ae4442b34ee4b7a10c243e.jpg',11),(80,'1J4HR58246C135818','/images/Vehicle/202604-8703ee7574b3437baedf8e72523395e0.jpg',12),(81,'1J4HR58246C135818','/images/Vehicle/202604-b0f1be5be70243b58d69079d4ed3de61.jpg',13),(82,'1J4HR58246C135818','/images/Vehicle/202604-acff678b918846bea7456726ad718ef7.jpg',14),(83,'1J4HR58246C135818','/images/Vehicle/202604-f3c2eae0c2144b599e7156d0c0cad296.jpg',15),(84,'1J4HR58246C135818','/images/Vehicle/202604-b1879c830d8a4563942bb03917eb8776.jpg',16),(85,'1J4HR58246C135818','/images/Vehicle/202604-724360697eda458cbfc15ab6ddbb66ea.jpg',17),(86,'1J4HR58246C135818','/images/Vehicle/202604-d061d21777534982a7f475c7b3234968.jpg',18),(87,'1J4HR58246C135818','/images/Vehicle/202604-57ad4375cebb46cdbc6e887855fc6c82.jpg',19),(88,'1J4HR58246C135818','/images/Vehicle/202604-a1db837947c8496090563841d46113bc.jpg',20),(89,'1J4HR58246C135818','/images/Vehicle/202604-0d0c56b57ddf4015ad913bd975a0a055.jpg',21),(90,'1J4HR58246C135818','/images/Vehicle/202604-4545bb71548548a484d6753c7dc44b70.jpg',22),(91,'1J4HR58246C135818','/images/Vehicle/202604-23ce3b3fcddc46ca8af24df76b9a4a75.jpg',23),(92,'1J4HR58246C135818','/images/Vehicle/202604-9601f0f884c144b383270ad02f02513f.jpg',24),(93,'1J4HR58246C135818','/images/Vehicle/202604-975bb16e611b4eea9c9750e7c7f3ccb6.jpg',25),(94,'1J4HR58246C135818','/images/Vehicle/202604-31ca97892a4344209318dcd3473e9c04.jpg',26),(95,'1J4HR58246C135818','/images/Vehicle/202604-2bd0948257114b07b927c4a7c7d4a185.jpg',27),(96,'1FTFW1R60EFB09696','/images/Vehicle/202606-266522111a4645a9bee0da0de0932226.jpg',1),(97,'1FTFW1R60EFB09696','/images/Vehicle/202606-b30d73e1d9f146d0ba2c0d5130ab0449.jpg',2),(98,'1FTFW1R60EFB09696','/images/Vehicle/202606-b56d8eab78b0455dbf907234cedaf27b.jpg',3),(99,'1FTFW1R60EFB09696','/images/Vehicle/202606-0442810e9b7948ee85e7336037587aec.jpg',4),(100,'1FTFW1R60EFB09696','/images/Vehicle/202606-26cc9cdd7c6c47c7a4f92ed87a6880fa.jpg',5),(101,'1FTFW1R60EFB09696','/images/Vehicle/202606-6e3c2a76b40c4bc1893f6d3556449765.jpg',6),(102,'1FTFW1R60EFB09696','/images/Vehicle/202606-993e5858514544f5acc35b071e687fa3.jpg',7),(103,'1FTFW1R60EFB09696','/images/Vehicle/202606-f4b6eb9da81946248aadc66e3d87586d.jpg',8),(104,'1FTFW1R60EFB09696','/images/Vehicle/202606-d50f1ad12e0047be9cab929a9d553e75.jpg',9),(105,'1FTFW1R60EFB09696','/images/Vehicle/202606-e6d876f6eb664a12adc4ce933536539e.jpg',10),(106,'1FTFW1R60EFB09696','/images/Vehicle/202606-c8e9f35146ff4bbaa8a8229f5c69902b.jpg',11),(107,'1FTFW1R60EFB09696','/images/Vehicle/202606-bf315f89243d45d19d4d6450ebc1b781.jpg',12),(108,'1FTFW1R60EFB09696','/images/Vehicle/202606-4165a6227eec4b1b824bf20a80a2a015.jpg',13),(109,'1FTFW1R60EFB09696','/images/Vehicle/202606-ec98177375cd424994e85c395a16b900.jpg',14),(110,'1FTFW1R60EFB09696','/images/Vehicle/202606-cd65c1e02d204c949e52de5486f8dec5.jpg',15),(111,'1FTFW1R60EFB09696','/images/Vehicle/202606-56fe7bd75a914de8a4bd054a6820a588.jpg',16),(112,'1FTFW1R60EFB09696','/images/Vehicle/202606-188e440ae80f408db5424d035828a62a.jpg',17),(113,'1FTFW1R60EFB09696','/images/Vehicle/202606-ed6beb056695453fa2eeaf5976ed2ddc.jpg',18),(114,'1FTFW1R60EFB09696','/images/Vehicle/202606-d0e1c7b0a0ea410d91f8b99efe5f5cd2.jpg',19),(115,'1FTFW1R60EFB09696','/images/Vehicle/202606-fd1e4e5d3aaa4599904c48966f0da086.jpg',20),(116,'1FTFW1R60EFB09696','/images/Vehicle/202606-80572850049748f2b7f49acd45f98b4d.jpg',21),(117,'1FTFW1R60EFB09696','/images/Vehicle/202606-831b32da66c54b39a569270404c25ce3.jpg',22),(118,'1FTFW1R60EFB09696','/images/Vehicle/202606-9e30eb189c764f82b68d2e1f54028ac2.jpg',23),(119,'1FTFW1R60EFB09696','/images/Vehicle/202606-50540002ce9943ada1159372d10cc7a5.jpg',24),(120,'1FTFW1R60EFB09696','/images/Vehicle/202606-592ed1772be9473bbb3020a2a61a86a9.jpg',25),(121,'4T1G11AK0MU463428','/images/Vehicle/202605-b66832cf8a3b4cbaa19068b700379a51.jpg',1),(122,'4T1G11AK0MU463428','/images/Vehicle/202605-f950440448234ad9a74729ed5f51275e.jpg',2),(123,'4T1G11AK0MU463428','/images/Vehicle/202605-39be8971cf8d462ba45dbfa8e54329dd.jpg',3),(124,'4T1G11AK0MU463428','/images/Vehicle/202605-f0eed1f1c98b4c48bed653b04c410594.jpg',4),(125,'4T1G11AK0MU463428','/images/Vehicle/202605-0ca46d39d57a4b29a06312b25dcb6cac.jpg',5),(126,'4T1G11AK0MU463428','/images/Vehicle/202605-6f13188f1e5341f9808d4e53e2d119df.jpg',6),(127,'4T1G11AK0MU463428','/images/Vehicle/202605-7ff6f18578fc42038a8e6c4273949dea.jpg',7),(128,'4T1G11AK0MU463428','/images/Vehicle/202605-83bd6ac2dcff4477a531c7ae270ef683.jpg',8),(129,'4T1G11AK0MU463428','/images/Vehicle/202605-8a56eca8f946447aaed7872fdf9e7731.jpg',9),(130,'4T1G11AK0MU463428','/images/Vehicle/202605-026541a731a74f728c76c907bab3227a.jpg',10),(131,'4T1G11AK0MU463428','/images/Vehicle/202605-2905ced1c3af4e62b3d196d5dd241c53.jpg',11),(132,'4T1G11AK0MU463428','/images/Vehicle/202605-50b6766a153741378094090fbc4d1c14.jpg',12),(133,'4T1G11AK0MU463428','/images/Vehicle/202605-b06017a2e3c647c2aef0b55f134d9a52.jpg',13),(134,'4T1G11AK0MU463428','/images/Vehicle/202605-dd2c9757537247b387edba6e1f2aad3e.jpg',14),(135,'4T1G11AK0MU463428','/images/Vehicle/202605-ebce21f49496445290dbc8700f2f5c9b.jpg',15),(136,'4T1G11AK0MU463428','/images/Vehicle/202605-61a89bc4482243539be9888dd404d6b1.jpg',16),(137,'4T1G11AK0MU463428','/images/Vehicle/202605-d0387481eb63438aab5cb7d95c774515.jpg',17),(138,'4T1G11AK0MU463428','/images/Vehicle/202605-d0410ee8388b4c4d95febf2141dede50.jpg',18),(139,'4T1G11AK0MU463428','/images/Vehicle/202605-9e599007106b446d83949fcc3e057064.jpg',19),(140,'4T1G11AK0MU463428','/images/Vehicle/202605-14a16162be2e4e669f25de2e049ca5a8.jpg',20),(141,'4T1G11AK0MU463428','/images/Vehicle/202605-174fdbcdf99942d88ab9826f47f184fc.jpg',21),(142,'4T1G11AK0MU463428','/images/Vehicle/202605-b627cb81cdac4ff19547c6b474efe9c8.jpg',22),(143,'4T1G11AK0MU463428','/images/Vehicle/202605-87313fd7f97b482f873df06040a67bb9.jpg',23),(144,'4T1G11AK0MU463428','/images/Vehicle/202605-f03621e0e99b4e619218bf8bd42db7a6.jpg',24),(145,'4T1G11AK0MU463428','/images/Vehicle/202605-9d7d41379acf4d4b834805c7a1eb30ce.jpg',25),(146,'4T1G11AK0MU463428','/images/Vehicle/202605-77a0db9a15424d3fbc6cd86fd382973c.jpg',26),(147,'4T1G11AK0MU463428','/images/Vehicle/202605-9ac7193f28d1445694a396fb55830d69.jpg',27),(148,'4T1G11AK0MU463428','/images/Vehicle/202605-610eaa7a5df842deab7bc5f292c68eae.jpg',28),(149,'4T1G11AK0MU463428','/images/Vehicle/202605-be162134938b4d639c9b8f9d99281b98.jpg',29),(150,'58ABK1GG8GU020662','/images/Vehicle/202605-a2fbfe9f7db64e72b670f309f330355b.jpg',1),(151,'58ABK1GG8GU020662','/images/Vehicle/202605-c012f680c3774bb0acc2cd994673b125.jpg',2),(152,'58ABK1GG8GU020662','/images/Vehicle/202605-3fcf8245cab347358cf2971cabb1ec26.jpg',3),(153,'58ABK1GG8GU020662','/images/Vehicle/202605-36ebdd13d8e94473bac98c3a149f4437.jpg',4),(154,'58ABK1GG8GU020662','/images/Vehicle/202605-c0956ab5b3b0477aad8bb01ec01ee1bc.jpg',5),(155,'58ABK1GG8GU020662','/images/Vehicle/202605-6f51885e15b84d8a8b7dea66f6346aae.jpg',6),(156,'58ABK1GG8GU020662','/images/Vehicle/202605-1f172d5a2bc9469bae9fdd810b6e2e19.jpg',7),(157,'58ABK1GG8GU020662','/images/Vehicle/202605-0c4653282b414eb4804742b6a261fa52.jpg',8),(158,'58ABK1GG8GU020662','/images/Vehicle/202605-68b58e853dc044a59a925059323a7732.jpg',9),(159,'58ABK1GG8GU020662','/images/Vehicle/202605-3f6e70bf6a0548deb6f9ca55e1b452fd.jpg',10),(160,'58ABK1GG8GU020662','/images/Vehicle/202605-9a2d36db789b453d87024f1b0de7bbae.jpg',11),(161,'58ABK1GG8GU020662','/images/Vehicle/202605-95aa8ecf93d74b268f08bbec7821b2f7.jpg',12),(162,'58ABK1GG8GU020662','/images/Vehicle/202605-6e25b46caf2346b183f63ce9dc9eb31a.jpg',13),(163,'58ABK1GG8GU020662','/images/Vehicle/202605-e32e492ec73f4791b93ccf13952bc20d.jpg',14),(164,'58ABK1GG8GU020662','/images/Vehicle/202605-63b3e9db518b43cfa5df5dd87455ba89.jpg',15),(165,'58ABK1GG8GU020662','/images/Vehicle/202605-bd8e83304f7d4da4816d423ec2cdf322.jpg',16),(166,'58ABK1GG8GU020662','/images/Vehicle/202605-8f1d071d87a440e29afa76cebdd9c766.jpg',17),(167,'58ABK1GG8GU020662','/images/Vehicle/202605-248a229660454776baf557e70390618c.jpg',18),(168,'58ABK1GG8GU020662','/images/Vehicle/202605-5235c5ec3f01423fb2d548ec040acc1b.jpg',19),(169,'58ABK1GG8GU020662','/images/Vehicle/202605-baefdcd1c6444896a96a7af605a4cf69.jpg',20),(170,'58ABK1GG8GU020662','/images/Vehicle/202605-676690e12c7e42359bf25237269d1638.jpg',21),(171,'58ABK1GG8GU020662','/images/Vehicle/202605-eceae5c592a64c429ae983444627f357.jpg',22),(172,'58ABK1GG8GU020662','/images/Vehicle/202605-e162e8f7f21949aa82aade83992a027a.jpg',23),(173,'58ABK1GG8GU020662','/images/Vehicle/202605-8ae49c183d5046c0979c3cae00b4da20.jpg',24),(174,'58ABK1GG8GU020662','/images/Vehicle/202605-abadfb7a34294bfca5e88d23a4c49f53.jpg',25),(175,'58ABK1GG8GU020662','/images/Vehicle/202605-42842acd9e3b4af189b796e397eeebdd.jpg',26),(176,'58ABK1GG8GU020662','/images/Vehicle/202605-a3b69e941c1a4004b1c008e861fbe2e1.jpg',27),(177,'58ABK1GG8GU020662','/images/Vehicle/202605-16fc223887b142c8a16f588e48e674a5.jpg',28),(178,'5FPYK1F53BB451280','/images/Vehicle/202603-051bac0ac52146d78cc8c3db3f1f10a3.jpg',1),(179,'5FPYK1F53BB451280','/images/Vehicle/202603-15d0c039b21a41338c634d1bc97ac737.jpg',2),(180,'5FPYK1F53BB451280','/images/Vehicle/202603-f15ff2dabaff406d923d40a514455748.jpg',3),(181,'5FPYK1F53BB451280','/images/Vehicle/202603-cade857f727c464e9938ec149bfcd559.jpg',4),(182,'5FPYK1F53BB451280','/images/Vehicle/202603-37a908105555471d87573f9ad5a3f732.jpg',5),(183,'5FPYK1F53BB451280','/images/Vehicle/202603-989de17655404d25b7c1c436f03952fa.jpg',6),(184,'5FPYK1F53BB451280','/images/Vehicle/202603-73baf5fef52a4f18859e8418ad69b301.jpg',7),(185,'5FPYK1F53BB451280','/images/Vehicle/202603-b1f0908440f74dc9b1304d1d0998af41.jpg',8),(186,'5FPYK1F53BB451280','/images/Vehicle/202603-4c7a80f138e14f2b8ee52d9c117dae57.jpg',9),(187,'5FPYK1F53BB451280','/images/Vehicle/202603-19af466826ca467ea85b416eda47cc7b.jpg',10),(188,'5FPYK1F53BB451280','/images/Vehicle/202603-de8987458f3a437b89cccc0d8246cb83.jpg',11),(189,'5FPYK1F53BB451280','/images/Vehicle/202603-8a2231089e62458cbefea86067858107.jpg',12),(190,'5FPYK1F53BB451280','/images/Vehicle/202603-408ad512b7d94c48b4ce6a4165d30840.jpg',13),(191,'5FPYK1F53BB451280','/images/Vehicle/202603-4d0f4738926f449b842cb3f0db0ded3a.jpg',14),(192,'5FPYK1F53BB451280','/images/Vehicle/202603-090d6c21638e47c590c08ea1c67dfbb7.jpg',15),(193,'5FPYK1F53BB451280','/images/Vehicle/202603-b1b5cb2904a847318e6fc68dcbcf829d.jpg',16),(194,'5FPYK1F53BB451280','/images/Vehicle/202603-0bdada9eea41499ebb2d4996e15995dc.jpg',17),(195,'5FPYK1F53BB451280','/images/Vehicle/202603-452d959bd8044888b3d3c216a86f20c3.jpg',18),(196,'5FPYK1F53BB451280','/images/Vehicle/202603-0551c1d6d2b14094b1da305df8bf0ad7.jpg',19),(197,'5FPYK1F53BB451280','/images/Vehicle/202603-87f546dba70840ccb8e3c094486ebe25.jpg',20),(198,'5FPYK1F53BB451280','/images/Vehicle/202603-7302761808f947e18cb929010218ca18.jpg',21),(199,'5FPYK1F53BB451280','/images/Vehicle/202603-ddd4d4970ded4858b1c27729da993604.jpg',22),(200,'5FPYK1F53BB451280','/images/Vehicle/202603-1d36f0fe661b4f1ab370d12e9eb975de.jpg',23),(201,'5FPYK1F53BB451280','/images/Vehicle/202603-94b82379bdaf4ec6bb97a52a16b11075.jpg',24),(202,'5FPYK1F53BB451280','/images/Vehicle/202603-3af19fd560724cd69be4df9200a0900e.jpg',25),(203,'5TDDY5G17CS056735','/images/Vehicle/202606-213cac9b6e8e46b1906f6d909d4bd25c.jpg',1),(204,'5TDDY5G17CS056735','/images/Vehicle/202606-dcbe54158af5411f84d044c8a3af8ba9.jpg',2),(205,'5TDDY5G17CS056735','/images/Vehicle/202606-6c09e03ef4bb494b98e2601385b7a011.jpg',3),(206,'5TDDY5G17CS056735','/images/Vehicle/202606-36c6fcf3236e44a68a5167c114dbe41e.jpg',4),(207,'5TDDY5G17CS056735','/images/Vehicle/202606-3f7d8b310744488a98fc6392f366e3ab.jpg',5),(208,'5TDDY5G17CS056735','/images/Vehicle/202606-eb7e5a8a6b3841f2be5e52d83b36a2b6.jpg',6),(209,'5TDDY5G17CS056735','/images/Vehicle/202606-ad477d496ce743d7b27be87f349c419d.jpg',7),(210,'5TDDY5G17CS056735','/images/Vehicle/202606-257af6173bc44e2baff91fcdb923224d.jpg',8),(211,'5TDDY5G17CS056735','/images/Vehicle/202606-784450354eb3426bbcb9a77c4476ad19.jpg',9),(212,'5TDDY5G17CS056735','/images/Vehicle/202606-4bde9ac979a34e3cba4b4d476a941bfd.jpg',10),(213,'5TDDY5G17CS056735','/images/Vehicle/202606-5b7301980dbc4110bf89ac3d3e68ae89.jpg',11),(214,'5TDDY5G17CS056735','/images/Vehicle/202606-ea3c5eff43e846408e0fcc4aeccd4090.jpg',12),(215,'5TDDY5G17CS056735','/images/Vehicle/202606-7bd310eb2d294f8598b4d1148a5a7d04.jpg',13),(216,'5TDDY5G17CS056735','/images/Vehicle/202606-01370e920a4f4990ac55ce5c1f0815db.jpg',14),(217,'5TDDY5G17CS056735','/images/Vehicle/202606-54a27fc2d73a46e5a6e2080303a0a2a7.jpg',15),(218,'5TDDY5G17CS056735','/images/Vehicle/202606-9156448fc829477fbbf801268f469038.jpg',16),(219,'5TDDY5G17CS056735','/images/Vehicle/202606-67dbdd394e6340fe99dfc27599df0887.jpg',17),(220,'5TDDY5G17CS056735','/images/Vehicle/202606-184476f2047b474094bd6236a313b20f.jpg',18),(221,'5TDDY5G17CS056735','/images/Vehicle/202606-a9a6ffec61b24306aa2b1df64cafb3da.jpg',19),(222,'5TDDY5G17CS056735','/images/Vehicle/202606-c6ae089db002484da75d79d1c122ad66.jpg',20),(223,'5TDDY5G17CS056735','/images/Vehicle/202606-0212230e63344909819b7d340e5676d8.jpg',21),(224,'5TDDY5G17CS056735','/images/Vehicle/202606-923797b4142d44728d6cd28b61c10b0a.jpg',22),(225,'5TDDY5G17CS056735','/images/Vehicle/202606-3d39e1c8008c4567ad8edebdf5657556.jpg',23),(226,'5TDDY5G17CS056735','/images/Vehicle/202606-c5d481da58084095b369c22dc8307abf.jpg',24),(227,'5TDDY5G17CS056735','/images/Vehicle/202606-0d872abc4b7944a092d80b2d2bfb7092.jpg',25),(228,'5TDDY5G17CS056735','/images/Vehicle/202606-a95738b189bc4e1fbb962dcc31fc1b31.jpg',26),(229,'5TDDY5G17CS056735','/images/Vehicle/202606-93760172c21b4eba85e719086bb11577.jpg',27),(230,'5TDDY5G17CS056735','/images/Vehicle/202606-92f582adf6ae401a84ff8001b6e2b29c.jpg',28),(231,'KL8CD6SA4LC445024','/images/Vehicle/202510-b76c24a18654492d92090bdb0c61f8c9.jpg',1),(232,'KL8CD6SA4LC445024','/images/Vehicle/202510-3f84e52ef18446e294191706311a6631.jpg',2),(233,'KL8CD6SA4LC445024','/images/Vehicle/202510-1fe89400572c44d0acf1e7b0371273e1.jpg',3),(234,'KL8CD6SA4LC445024','/images/Vehicle/202510-238a14ddb1b641c3b3f2e9d7bd4c857c.jpg',4),(235,'KL8CD6SA4LC445024','/images/Vehicle/202510-5ae7f519a27e436ab755264d1ebd8b0c.jpg',5),(236,'KL8CD6SA4LC445024','/images/Vehicle/202510-9dc5389ab9db4ea491788610f359d28e.jpg',6),(237,'KL8CD6SA4LC445024','/images/Vehicle/202510-7aa177871080416c969f092b63a238cc.jpg',7),(238,'KL8CD6SA4LC445024','/images/Vehicle/202510-2307c25ed3b34b7ca21b6086afbf89fb.jpg',8),(239,'KL8CD6SA4LC445024','/images/Vehicle/202510-14e19476a70d4b658de8b2a3ce7ea921.jpg',9),(240,'KL8CD6SA4LC445024','/images/Vehicle/202510-c73c6a2242f34bb68454239947cff202.jpg',10),(241,'KL8CD6SA4LC445024','/images/Vehicle/202510-0327995122674848a751e4e1ba80f7b0.jpg',11),(242,'KL8CD6SA4LC445024','/images/Vehicle/202510-e3400c26f7494bd78da3c47ee3f4f93c.jpg',12),(243,'KL8CD6SA4LC445024','/images/Vehicle/202510-68c29ec782b04d5387238c90d7fa1c0d.jpg',13),(244,'KL8CD6SA4LC445024','/images/Vehicle/202510-5ee04aa5d0e24e80ae3264bb73dff3ce.jpg',14),(245,'KL8CD6SA4LC445024','/images/Vehicle/202510-7ea5eca172ec471a93cdd42593748331.jpg',15),(246,'KL8CD6SA4LC445024','/images/Vehicle/202510-3a255f754dbd45d084aaf42e354e13d6.jpg',16),(247,'1D3HV13TX9S811765','/images/Vehicle/202606-23a397121e2f471c8fcce951ecb23b99.jpg',1),(248,'1D3HV13TX9S811765','/images/Vehicle/202606-40c4b784cce44ca4a33d38b4f38218c8.jpg',2),(249,'1D3HV13TX9S811765','/images/Vehicle/202606-e716e410988144f8bd9b5cdf46b07018.jpg',3),(250,'1D3HV13TX9S811765','/images/Vehicle/202606-3caa25ca104f4c2ab43f778862c8a64b.jpg',4),(251,'1D3HV13TX9S811765','/images/Vehicle/202606-74e07889b0b6451fa80e9a11e3156fd2.jpg',5),(252,'1D3HV13TX9S811765','/images/Vehicle/202606-1a5e5b3f6a6b44cabfce988a2a3ec795.jpg',6),(253,'1D3HV13TX9S811765','/images/Vehicle/202606-f35d21fee1f14c3faf4020cf123716db.jpg',7),(254,'1D3HV13TX9S811765','/images/Vehicle/202606-eecf0a228c934be9bab6fad51e9c2371.jpg',8),(255,'1D3HV13TX9S811765','/images/Vehicle/202606-b032cd0eace04f2a8cd389ec59dedcc8.jpg',9),(256,'1D3HV13TX9S811765','/images/Vehicle/202606-df4f0934a76044ce904bdd8fd1246710.jpg',10),(257,'1D3HV13TX9S811765','/images/Vehicle/202606-b689dcd02e4a43beae31d1de723c9a30.jpg',11),(258,'1D3HV13TX9S811765','/images/Vehicle/202606-cf213ac259634443aa8282c16512af4f.jpg',12),(259,'1D3HV13TX9S811765','/images/Vehicle/202606-312dd7b9c55a4f128d529cf9eba42b5e.jpg',13),(260,'1D3HV13TX9S811765','/images/Vehicle/202606-a2e177df50d948aeac9054eb80822cad.jpg',14),(261,'1D3HV13TX9S811765','/images/Vehicle/202606-be82bd5ec93d4d3b96e1966ad04375ff.jpg',15),(262,'1D3HV13TX9S811765','/images/Vehicle/202606-54ec8f16c8414bd9b1433c5b4f16ccd3.jpg',16),(263,'1D3HV13TX9S811765','/images/Vehicle/202606-341d17b635ea421ebde707ee833a7d3e.jpg',17),(264,'1D3HV13TX9S811765','/images/Vehicle/202606-946feb1105624917b54ef3112793aa61.jpg',18),(265,'1D3HV13TX9S811765','/images/Vehicle/202606-e114dd1681ef438d95d0a4edcf0d7ab9.jpg',19),(266,'1D3HV13TX9S811765','/images/Vehicle/202606-32bc1644fa9c43cdb1207f55733f3c0e.jpg',20),(267,'1D3HV13TX9S811765','/images/Vehicle/202606-15a889c5840a49ebab38a715b4651b74.jpg',21),(268,'1D3HV13TX9S811765','/images/Vehicle/202606-36c51ea8e3db47ed85b5219a9261447f.jpg',22),(269,'1D3HV13TX9S811765','/images/Vehicle/202606-2584f31b50e642df82e0ded2b95b6eb7.jpg',23),(270,'1D3HV13TX9S811765','/images/Vehicle/202606-947a93f95d734f1789d804a44fc75331.jpg',24),(271,'1D3HV13TX9S811765','/images/Vehicle/202606-67ba683660034a5aadd74a7755bb6a7f.jpg',25),(272,'1D3HV13TX9S811765','/images/Vehicle/202606-1d8c1e682c594c7db26f92eb61c42706.jpg',26),(273,'1D3HV13TX9S811765','/images/Vehicle/202606-86e7f688e09b44c8b9d2ee6e11477d7f.jpg',27),(274,'1D3HV13TX9S811765','/images/Vehicle/202606-a874574cc14e42d79ee040c10914ad50.jpg',28),(275,'1D3HV13TX9S811765','/images/Vehicle/202606-099780a79ad8433a8fe3088645aeb17c.jpg',29),(276,'1D3HV13TX9S811765','/images/Vehicle/202606-ee374703712f4dfc8b0562c35c8489e8.jpg',30),(277,'JTEBT17R230020115','/images/Vehicle/202606-9ace169d65a54f95b61a55196cd23330.jpg',1),(278,'JTEBT17R230020115','/images/Vehicle/202606-c328cd20def54c65a9914acb550ae1b9.jpg',2),(279,'JTEBT17R230020115','/images/Vehicle/202606-ec4e9985baf3461aaa51c3eab2008349.jpg',3),(280,'JTEBT17R230020115','/images/Vehicle/202606-3453a2289bc74d5b84dd32e59206e63f.jpg',4),(281,'JTEBT17R230020115','/images/Vehicle/202606-43477519700843aab4beaeaf2cad4418.jpg',5),(282,'JTEBT17R230020115','/images/Vehicle/202606-2e695734cdc2411893676f0201a9a592.jpg',6),(283,'JTEBT17R230020115','/images/Vehicle/202606-aa576f5589574883a5def0c51d22bf40.jpg',7),(284,'JTEBT17R230020115','/images/Vehicle/202606-25f6e88c29b049eabe8dae0a4799ce76.jpg',8),(285,'JTEBT17R230020115','/images/Vehicle/202606-0d1ef5ce8c6f49319b1c54fc48da800e.jpg',9),(286,'JTEBT17R230020115','/images/Vehicle/202606-57eb02681c7142c7a03dc412398c3e6b.jpg',10),(287,'JTEBT17R230020115','/images/Vehicle/202606-06442c905bc74fee8df79b77f89b3dfd.jpg',11),(288,'JTEBT17R230020115','/images/Vehicle/202606-a64b0742cd294ba6a22e68b793b70e14.jpg',12),(289,'JTEBT17R230020115','/images/Vehicle/202606-fca96324171547598a80702c2d80ed93.jpg',13),(290,'JTEBT17R230020115','/images/Vehicle/202606-caa80bc226f34ad08d8a4d4aa57340fc.jpg',14),(291,'JTEBT17R230020115','/images/Vehicle/202606-78598f1d04b64fcd8e2ab6fbdfdfc38e.jpg',15),(292,'JTEBT17R230020115','/images/Vehicle/202606-a002e9c8a42f449c862cbc0f70a6412c.jpg',16),(293,'JTEBT17R230020115','/images/Vehicle/202606-90bdbb10f299404590cfe7892e903fe7.jpg',17),(294,'JTEBT17R230020115','/images/Vehicle/202606-18a93ff23b514e29801c8c6f333f7cf4.jpg',18),(295,'JTEBT17R230020115','/images/Vehicle/202606-a5dc36c2bb5645e5b9dd79f7f826f2da.jpg',19),(296,'JTEBT17R230020115','/images/Vehicle/202606-b4de15d2fdff41efaedf973074ca3155.jpg',20),(297,'JTEBT17R230020115','/images/Vehicle/202606-81b10f54596449528821f79adcf09c9a.jpg',21),(298,'JTEBT17R230020115','/images/Vehicle/202606-ad94f72846bd4b3b9d35f4f0a71c78ec.jpg',22),(299,'JTEBT17R230020115','/images/Vehicle/202606-74682a25fcaa42308b7ceae9d1a4eeac.jpg',23),(300,'JTEBT17R230020115','/images/Vehicle/202606-6cb7ebc4dcc549cf8dc3c32b7395940b.jpg',24);
/*!40000 ALTER TABLE `VehicleImages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-20 20:02:23
