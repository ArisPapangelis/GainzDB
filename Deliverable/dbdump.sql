-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: GainzDB
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB

DROP SCHEMA IF EXISTS `GainzDB`;
CREATE SCHEMA `GainzDB`;
USE `GainzDB`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `coach_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `sex` enum('Male','Female','Other') NOT NULL,
  `specialty` varchar(45) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'Jose','Mourinho','Male','Yoga','1963-01-26'),(2,'Pep','Gouardiola','Male','Weightlifting','1971-01-18'),(3,'Tara','VanDerveer','Female','Yoga','1953-06-26'),(4,'Catherine','Bazouki','Female','Pilates','1997-06-05'),(5,'Joanne','Bletsa','Female','Weightlifting','1997-01-21'),(6,'Vasilis','Papadam','Male','Basketball','1997-11-01'),(7,'Chris','Heria','Male','Crossfit','1990-10-10'),(8,'Osvaldo','Lugones','Male','Crossfit','1992-02-08'),(9,'Vasilis','Tsoumanis','Male','Swimming','1997-12-10'),(10,'Zelimir','Obradovic','Male','TRX','1960-05-06');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eat`
--

DROP TABLE IF EXISTS `eat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eat` (
  `trainee_id` int(11) NOT NULL,
  `food_name` varchar(45) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`trainee_id`,`food_name`,`date`),
  KEY `food_name_idx` (`food_name`),
  CONSTRAINT `food_name` FOREIGN KEY (`food_name`) REFERENCES `food` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trainee_id` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`trainee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eat`
--

LOCK TABLES `eat` WRITE;
/*!40000 ALTER TABLE `eat` DISABLE KEYS */;
INSERT INTO `eat` VALUES (1,'Almonds','2019-12-15'),(1,'Apple','2019-12-15'),(1,'Broccoli','2019-12-15'),(1,'Chicken Breast','2019-12-15'),(1,'Chicken Breast','2019-12-16'),(1,'Greek Yoghurt','2019-12-15'),(1,'Greek Yoghurt','2019-12-16'),(2,'Apple','2019-12-16'),(2,'Broccoli','2019-12-16'),(2,'Cottage Cheese','2019-12-15'),(2,'Eggs','2019-12-15'),(2,'Kidney Beans','2019-12-15'),(2,'Kidney Beans','2019-12-16'),(2,'Rice','2019-12-15'),(3,'Almonds','2019-12-16'),(3,'Cottage Cheese','2019-12-16'),(3,'Eggs','2019-12-16'),(3,'Lentils','2019-12-16'),(4,'Lentils','2019-12-15'),(4,'Rice','2019-12-16');
/*!40000 ALTER TABLE `eat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `exercise_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `muscle_group` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'Barbell Bench Press','Chest'),(2,'Cable Crossover','Chest'),(3,'Lat Pulldown','Back'),(4,'Cable Rows','Back'),(5,'Leg Press','Legs'),(6,'Barbell Squats','Legs'),(7,'Barbell Curl','Biceps'),(8,'Rope Pushdown','Triceps'),(9,'Crunches','Abs'),(10,'Leg Raises','Abs');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_instance`
--

DROP TABLE IF EXISTS `exercise_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_instance` (
  `date` date NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `reps` int(11) DEFAULT NULL,
  `sets` int(11) DEFAULT NULL,
  `kilograms` decimal(5,2) DEFAULT NULL,
  `tempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`date`,`exercise_id`),
  KEY `exercise_id_idx` (`exercise_id`),
  KEY `date_idx` (`date`),
  CONSTRAINT `exercise_id` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_instance`
--

LOCK TABLES `exercise_instance` WRITE;
/*!40000 ALTER TABLE `exercise_instance` DISABLE KEYS */;
INSERT INTO `exercise_instance` VALUES ('2019-12-15',1,8,3,60.00,4121),('2019-12-15',3,12,3,50.00,3120),('2019-12-15',7,12,3,20.00,3010),('2019-12-15',8,12,3,25.00,4010),('2019-12-17',2,8,3,30.00,4110),('2019-12-17',4,10,3,55.00,3120),('2019-12-17',7,12,3,25.00,3010),('2019-12-17',8,12,3,20.00,4010),('2019-12-20',5,10,3,110.00,4010),('2019-12-20',6,10,3,70.00,3110),('2019-12-20',9,20,3,10.00,4110),('2019-12-20',10,15,3,0.00,4110);
/*!40000 ALTER TABLE `exercise_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `calories` decimal(5,2) NOT NULL,
  `protein` decimal(5,2) NOT NULL,
  `carbs` decimal(5,2) NOT NULL,
  `fat` decimal(5,2) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES ('Almonds','Nuts',579.00,21.60,50.00,21.20),('Apple','Fruit',80.00,1.00,20.00,0.00),('Broccoli','Vegetable',30.00,12.00,8.00,1.00),('Chicken Breast','Poultry',200.00,60.00,0.00,5.00),('Cottage Cheese','Dairy',98.00,11.00,3.40,4.30),('Eggs','Poultry',150.00,13.00,1.00,11.00),('Greek Yoghurt','Dairy',150.00,18.00,5.00,6.00),('Kidney Beans','Legumes',320.00,24.00,60.00,1.00),('Lentils','Legumes',120.00,9.00,20.00,0.50),('Rice','Grains',330.00,10.00,70.00,3.00);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injury`
--

DROP TABLE IF EXISTS `injury`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `injury` (
  `name` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `heal_time` varchar(45) NOT NULL,
  `body_part` varchar(45) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injury`
--

LOCK TABLES `injury` WRITE;
/*!40000 ALTER TABLE `injury` DISABLE KEYS */;
INSERT INTO `injury` VALUES ('Abdominal Hernia','Concerning','3 months','Abdominals'),('ACL Tear','Severe','12 months','Knee'),('Ankle Sprain','Inconvenience','3 weeks','Ankle'),('Back Strain','Inconvenience','2 weeks','Lower Back'),('Bicep Tear','Severe','7 months','Arm'),('Herniated Disk','Severe','6 months','Lower Back'),('Meniscus Tear','Severe','8 months','Knee'),('Rotator Cuff Tear','Concerning','5 months','Shoulder'),('Tendonitis','Concerning','6 months','Shoulder'),('Tennis Elbow','Concerning','5 months','Arm');
/*!40000 ALTER TABLE `injury` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `overweight`
--

DROP TABLE IF EXISTS `overweight`;
/*!50001 DROP VIEW IF EXISTS `overweight`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `overweight` AS SELECT 
 1 AS `trainee_id`,
 1 AS `name`,
 1 AS `surname`,
 1 AS `sex`,
 1 AS `coach_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `physiotherapist`
--

DROP TABLE IF EXISTS `physiotherapist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physiotherapist` (
  `physio_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `sex` enum('Male','Female','Other') NOT NULL,
  `specialty` varchar(45) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`physio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physiotherapist`
--

LOCK TABLES `physiotherapist` WRITE;
/*!40000 ALTER TABLE `physiotherapist` DISABLE KEYS */;
INSERT INTO `physiotherapist` VALUES (1,'Kostas','Hronis','Male','Back','1997-04-02'),(2,'Thodoris ','Chondrodinis','Male','Shoulders','1997-05-11'),(3,'Yianna','Milonaki','Female','Legs','1997-03-08'),(4,'Christos','Karidopoulos','Male','Chest','1995-05-04'),(5,'Christos','Bouritas','Male','Back','1997-08-20'),(6,'Fountas','Vasilis','Male','Chest','1997-04-07'),(7,'Fakoudis','Dimitris','Male','Legs','1993-03-08'),(8,'Yiannis','Loufopoulos','Male','Back','1996-05-08'),(9,'Catherine','Papadopoulou','Female','Chest','1990-09-10'),(10,'Maria','Papanikolaou','Female','Legs','1984-09-07');
/*!40000 ALTER TABLE `physiotherapist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainee`
--

DROP TABLE IF EXISTS `trainee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainee` (
  `trainee_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `sex` enum('Male','Female','Other') NOT NULL,
  `calories_max` int(11) DEFAULT NULL,
  `goal` varchar(45) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `body_fat` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `coach_id` int(11) NOT NULL,
  `physio_id` int(11) NOT NULL,
  PRIMARY KEY (`trainee_id`),
  KEY `coach_id_idx` (`coach_id`),
  KEY `physio_id_idx` (`physio_id`),
  CONSTRAINT `coach_id` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`coach_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `physio_id` FOREIGN KEY (`physio_id`) REFERENCES `physiotherapist` (`physio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainee`
--

LOCK TABLES `trainee` WRITE;
/*!40000 ALTER TABLE `trainee` DISABLE KEYS */;
INSERT INTO `trainee` VALUES (1,'Stefanos','Papadam','Other',2400,'Muscle Gain','1990-04-02',75.00,12.50,1.75,5,7),(2,'Aris','Papangelis','Other',3000,'Fat Loss','1980-03-08',140.00,30.00,1.60,7,1),(3,'Michael','Minadakis','Female',2100,'Stretch improvement','1994-05-06',67.00,15.00,1.70,9,2),(4,'Marios','Gavaletakis','Female',2700,'Fat Loss','1993-03-02',120.00,31.00,1.69,3,6),(5,'Andreas','Rokopanos','Male',2100,'Strength','1992-07-04',100.00,18.00,1.84,2,9),(6,'Maria','Papageorgiou','Female',1900,'Fat Loss','1995-08-10',90.00,18.40,1.68,5,6),(7,'Kostas','Diamantis','Male',2700,'Strength','1994-06-11',112.00,21.00,1.87,1,2),(8,'Giorgos','Kalogiros','Male',2500,'Muscle Gain','1992-03-01',101.00,18.40,1.80,2,4),(9,'Vasiliki','Kontogiorgou','Female',2100,'Fat Loss','1973-04-05',100.00,19.60,1.76,4,2),(10,'Rita','Antoniadou','Male',2300,'Muscle Gain','1993-02-05',79.00,15.70,1.69,8,5);
/*!40000 ALTER TABLE `trainee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training` (
  `trainee_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`trainee_id`,`exercise_id`,`date`),
  KEY `date_idx` (`date`),
  KEY `exercise_id_idx` (`exercise_id`),
  CONSTRAINT `date` FOREIGN KEY (`date`) REFERENCES `exercise_instance` (`date`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `exercise_id_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trainee_id_1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`trainee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,1,'2019-12-15'),(1,3,'2019-12-15'),(1,7,'2019-12-15'),(1,8,'2019-12-15'),(4,2,'2019-12-17'),(4,4,'2019-12-17'),(4,7,'2019-12-17'),(4,8,'2019-12-17'),(8,5,'2019-12-20'),(8,6,'2019-12-20'),(8,9,'2019-12-20'),(8,10,'2019-12-20');
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment` (
  `injury_name` varchar(45) NOT NULL,
  `trainee_id` int(11) NOT NULL,
  `treatment_start` date DEFAULT NULL,
  `treatment_end` date DEFAULT NULL,
  PRIMARY KEY (`injury_name`,`trainee_id`),
  KEY `trainee_id_idx` (`trainee_id`),
  CONSTRAINT `injury_name` FOREIGN KEY (`injury_name`) REFERENCES `injury` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trainee_id_2` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`trainee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES ('Abdominal Hernia',7,'2020-01-01','2020-04-01'),('ACL Tear',2,'2020-01-01','2021-01-01'),('Ankle Sprain',4,'2020-01-01','2020-01-21'),('Back Strain',1,'2020-01-01','2020-07-01'),('Bicep Tear',5,'2020-01-01','2020-08-01'),('Herniated Disk',6,'2020-01-01','2020-07-01'),('Meniscus Tear',3,'2020-01-01','2020-09-01'),('Rotator Cuff Tear',4,'2020-01-01','2020-06-01'),('Tendonitis',1,'2020-01-01','2020-01-14'),('Tennis Elbow',7,'2020-01-01','2020-06-01');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vegan`
--

DROP TABLE IF EXISTS `vegan`;
/*!50001 DROP VIEW IF EXISTS `vegan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vegan` AS SELECT 
 1 AS `trainee_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `yogi`
--

DROP TABLE IF EXISTS `yogi`;
/*!50001 DROP VIEW IF EXISTS `yogi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `yogi` AS SELECT 
 1 AS `trainee_id`,
 1 AS `name`,
 1 AS `surname`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `overweight`
--

/*!50001 DROP VIEW IF EXISTS `overweight`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `overweight` AS select `trainee`.`trainee_id` AS `trainee_id`,`trainee`.`name` AS `name`,`trainee`.`surname` AS `surname`,`trainee`.`sex` AS `sex`,`trainee`.`coach_id` AS `coach_id` from `trainee` where (((`trainee`.`sex` = 'Male') and (`trainee`.`body_fat` > 20)) or ((`trainee`.`sex` = 'Female') and (`trainee`.`body_fat` > 30))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vegan`
--

/*!50001 DROP VIEW IF EXISTS `vegan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vegan` AS select distinct `eat`.`trainee_id` AS `trainee_id` from (`eat` join `food` on((`food`.`name` = `eat`.`food_name`))) where ((`food`.`type` not in ('Poultry','Meat','Seafood','Dairy')) and (not(`eat`.`trainee_id` in (select distinct `eat`.`trainee_id` from (`eat` join `food` on((`food`.`name` = `eat`.`food_name`))) where (`food`.`type` in ('Poultry','Meat','Seafood','Dairy')))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `yogi`
--

/*!50001 DROP VIEW IF EXISTS `yogi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `yogi` AS select `trainee`.`trainee_id` AS `trainee_id`,`trainee`.`name` AS `name`,`trainee`.`surname` AS `surname` from (`coach` join `trainee` on((`coach`.`coach_id` = `trainee`.`coach_id`))) where (`coach`.`specialty` = 'Yoga') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-22 19:16:54
