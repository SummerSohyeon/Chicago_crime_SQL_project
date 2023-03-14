CREATE DATABASE  IF NOT EXISTS `chicago` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chicago`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chicago
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `AREA_ID` int NOT NULL,
  `COMMUNITY_NAME` varchar(250) DEFAULT NULL,
  `POPULATION` int DEFAULT NULL,
  `AREA_SIZE` double DEFAULT NULL,
  `DENSITY` double DEFAULT NULL,
  PRIMARY KEY (`AREA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'rogers park',55628,1.84,30232.61),(2,'west ridge',77122,3.53,21847.59),(3,'uptown',57182,2.32,24647.41),(4,'lincoln square',40494,2.56,15817.97),(5,'north center',35114,2.05,17128.78),(6,'lake view',103050,3.12,33028.85),(7,'lincoln park',70492,3.16,22307.59),(8,'near north side',105481,2.74,38496.72),(9,'edison park',11525,1.13,10199.12),(10,'norwood park',38303,4.37,8764.99),(11,'jefferson park',26216,2.33,11251.5),(12,'forest glen',19596,3.2,6123.75),(13,'north park',17559,2.52,6967.86),(14,'albany park',48396,1.92,25206.25),(15,'portage park',63020,3.95,15954.43),(16,'irving park',51940,3.21,16180.69),(17,'dunning',43147,3.72,11598.66),(18,'montclare',14401,0.99,14546.46),(19,'belmont cragin',78116,3.91,19978.52),(20,'hermosa',24062,1.17,20565.81),(21,'avondale',36257,1.98,18311.62),(22,'logan square',71665,3.59,19962.4),(23,'humboldt park',54165,3.6,15045.83),(24,'west town',87781,4.58,19166.16),(25,'austin',96557,7.15,13504.48),(26,'west garfield park',17433,1.28,13619.53),(27,'east garfield park',19992,1.93,10358.55),(28,'near west side',67881,5.69,11929.88),(29,'north lawndale',34794,3.21,10839.25),(30,'south lawndale',71399,4.59,15555.34),(31,'lower west side',33751,2.93,11519.11),(32,'loop',42298,1.65,25635.15),(33,'near south side',28795,1.78,16176.97),(34,'armour square',13890,1,13890),(35,'douglas',20291,1.65,12297.58),(36,'oakland',6799,0.58,11722.41),(37,'fuller park',2567,0.71,3615.49),(38,'grand boulevard',24589,1.74,14131.61),(39,'kenwood',19116,1.04,18380.77),(40,'washington park',12707,1.52,8359.87),(41,'hyde park',29456,1.61,18295.65),(42,'woodlawn',24425,2.07,11799.52),(43,'south shore',53971,2.93,18420.14),(44,'chatham',31710,2.95,10749.15),(45,'avalon park',9458,1.25,7566.4),(46,'south chicago',27300,3.34,8173.65),(47,'burnside',2527,0.61,4142.62),(48,'calumet heights',13088,1.75,7478.86),(49,'roseland',38816,4.82,8053.11),(50,'pullman',6820,2.12,3216.98),(51,'south deering',14105,10.9,1294.04),(52,'east side',21724,2.98,7289.93),(53,'west pullman',26104,3.56,7332.58),(54,'riverdale',7262,3.53,2057.22),(55,'hegewisch',10027,5.24,1913.55),(56,'garfield ridge',35439,4.23,8378.01),(57,'archer heights',14196,2.01,7062.69),(58,'brighton park',45053,2.72,16563.6),(59,'mckinley park',15923,1.41,11292.91),(60,'bridgeport',33702,2.09,16125.36),(61,'new city',43628,4.83,9032.71),(62,'west elsdon',18394,1.17,15721.37),(63,'gage park',39540,2.2,17972.73),(64,'clearing',24473,2.55,9597.25),(65,'west lawn',33662,2.95,11410.85),(66,'chicago lawn',55931,3.53,15844.48),(67,'west englewood',29647,3.15,9411.75),(68,'englewood',24369,3.07,7937.79),(69,'greater grand crossing',31471,3.55,8865.07),(70,'ashburn',41098,4.86,8456.38),(71,'auburn gresham',44878,3.77,11903.98),(72,'beverly',20027,3.18,6297.8),(73,'washington heights',25065,2.86,8763.99),(74,'mount greenwood',18628,2.71,6873.8),(75,'morgan park',21186,3.3,6420),(76,'o\'hare',13418,13.34,1005.85),(77,'edgewater',56296,1.74,32354.02);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-20 19:13:23
