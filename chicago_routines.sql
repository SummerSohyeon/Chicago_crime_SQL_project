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
-- Temporary view structure for view `chicago_crimes_view`
--

DROP TABLE IF EXISTS `chicago_crimes_view`;
/*!50001 DROP VIEW IF EXISTS `chicago_crimes_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `chicago_crimes_view` AS SELECT 
 1 AS `crime_id`,
 1 AS `time_reported`,
 1 AS `crime_type`,
 1 AS `crime_description`,
 1 AS `location_description`,
 1 AS `street_name`,
 1 AS `community_name`,
 1 AS `population`,
 1 AS `area_size`,
 1 AS `density`,
 1 AS `arrest`,
 1 AS `domestic`,
 1 AS `temp_high`,
 1 AS `temp_low`,
 1 AS `precipitation`,
 1 AS `latitude`,
 1 AS `longitude`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `chicago_crimes_view`
--

/*!50001 DROP VIEW IF EXISTS `chicago_crimes_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chicago_crimes_view` AS select `cr`.`CRIME_ID` AS `crime_id`,`cr`.`CRIME_DATE` AS `time_reported`,`cr`.`CRIME_TYPE` AS `crime_type`,`cr`.`CRIME_DESCRIPTION` AS `crime_description`,`cr`.`LOCATION_DESCRIPTION` AS `location_description`,`cr`.`STREET_NAME` AS `street_name`,`co`.`COMMUNITY_NAME` AS `community_name`,`co`.`POPULATION` AS `population`,`co`.`AREA_SIZE` AS `area_size`,`co`.`DENSITY` AS `density`,`cr`.`ARREST` AS `arrest`,`cr`.`DOMESTIC` AS `domestic`,`w`.`TEMP_HIGH` AS `temp_high`,`w`.`TEMP_LOW` AS `temp_low`,`w`.`PRECIPITATION` AS `precipitation`,`cr`.`LATITUDE` AS `latitude`,`cr`.`LONGITUDE` AS `longitude` from ((`crimes` `cr` join `community` `co` on((`cr`.`COMMUNITY_ID` = `co`.`AREA_ID`))) join `weather` `w` on((`w`.`WEATHER_DATE` = cast(`cr`.`CRIME_DATE` as date)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'chicago'
--
/*!50003 DROP FUNCTION IF EXISTS `get_crime_count_by_year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_crime_count_by_year`(_year INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE count INT;
	SELECT COUNT(*) INTO count
	FROM CRIMES
	WHERE YEAR(crime_date) = _year;
RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crime_temp_stats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crime_temp_stats`(IN start_date DATE, IN end_date DATE)
BEGIN
    DECLARE current__date DATE;
    SET current__date = start_date;

    WHILE current__date <= end_date DO
        SELECT AVG(temp_high), COUNT(*) 
        FROM chicago_crimes_view
        WHERE date(time_reported) = current__date;
        SET current__date = DATE_ADD(current__date, INTERVAL 1 DAY);
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-20 19:13:25
