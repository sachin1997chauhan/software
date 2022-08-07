-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: nms
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `alarmcount`
--

DROP TABLE IF EXISTS `alarmcount`;
/*!50001 DROP VIEW IF EXISTS `alarmcount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `alarmcount` AS SELECT 
 1 AS `AlarmId`,
 1 AS `SerialNumber`,
 1 AS `BandName`,
 1 AS `SynthesizerFailDL`,
 1 AS `SynthesizerFailUL`,
 1 AS `PowerFailDL`,
 1 AS `PowerFailUL`,
 1 AS `AlarmTimeStamp`,
 1 AS `RegionName`,
 1 AS `RepName`,
 1 AS `ConnectionStatus`,
 1 AS `ElectricityStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alarmdata`
--

DROP TABLE IF EXISTS `alarmdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alarmdata` (
  `AlarmId` int(11) NOT NULL AUTO_INCREMENT,
  `SerialNumber` varchar(20) DEFAULT NULL,
  `BandName` varchar(45) DEFAULT NULL,
  `SynthesizerFailDL` varchar(45) DEFAULT NULL,
  `SynthesizerFailUL` varchar(45) DEFAULT NULL,
  `PowerFailDL` varchar(45) DEFAULT NULL,
  `PowerFailUL` varchar(45) DEFAULT NULL,
  `AlarmTimeStamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AlarmId`),
  KEY `snumber_idx` (`SerialNumber`),
  CONSTRAINT `snumber` FOREIGN KEY (`SerialNumber`) REFERENCES `repeaterdata` (`SerialNumber`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarmdata`
--

LOCK TABLES `alarmdata` WRITE;
/*!40000 ALTER TABLE `alarmdata` DISABLE KEYS */;
INSERT INTO `alarmdata` VALUES (3,'280621N00013','DCS1','1','1','1','1','2022-07-06 18:10:14.478');
/*!40000 ALTER TABLE `alarmdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banddata`
--

DROP TABLE IF EXISTS `banddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `banddata` (
  `BandDataId` int(11) NOT NULL AUTO_INCREMENT,
  `MuSerialNumber` varchar(45) DEFAULT NULL,
  `SerialNumber` varchar(20) DEFAULT NULL,
  `BandName` varchar(45) DEFAULT NULL,
  `TotalHumpCount` varchar(45) DEFAULT NULL,
  `GainDL` varchar(45) DEFAULT NULL,
  `GainUL` varchar(45) DEFAULT NULL,
  `PADL` varchar(45) DEFAULT NULL,
  `PAUL` varchar(45) DEFAULT NULL,
  `PowerOutDL` varchar(45) DEFAULT NULL,
  `PowerInDL` varchar(45) DEFAULT NULL,
  `PowerOutUL` varchar(45) DEFAULT NULL,
  `PowerInUL` varchar(45) DEFAULT NULL,
  `OffsetDL` varchar(45) DEFAULT NULL,
  `OffsetUL` varchar(45) DEFAULT NULL,
  `CompensationDL` varchar(45) DEFAULT NULL,
  `CompensationUL` varchar(45) DEFAULT NULL,
  `AttenuationDL` varchar(45) DEFAULT NULL,
  `AttenuationUL` varchar(45) DEFAULT NULL,
  `ALCStatus` varchar(45) DEFAULT NULL,
  `ALCLvlDL` varchar(45) DEFAULT NULL,
  `ALCLvlUL` varchar(45) DEFAULT NULL,
  `StartChannel` varchar(45) DEFAULT NULL,
  `StopChannel` varchar(45) DEFAULT NULL,
  `CfFreqDL` varchar(45) DEFAULT NULL,
  `CfFreqUL` varchar(45) DEFAULT NULL,
  `Bandwidth` varchar(45) DEFAULT NULL,
  `SawBandwidth` varchar(45) DEFAULT NULL,
  `ThresholdUL` varchar(45) DEFAULT NULL,
  `ThresholdDL` varchar(45) DEFAULT NULL,
  `FirmwareVersion` varchar(45) DEFAULT NULL,
  `LoEnable` varchar(45) DEFAULT NULL,
  `BandTimeStamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BandDataId`),
  KEY `serialnumber_idx` (`SerialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banddata`
--

LOCK TABLES `banddata` WRITE;
/*!40000 ALTER TABLE `banddata` DISABLE KEYS */;
INSERT INTO `banddata` VALUES (12,'null','280621N00013','DCS1','4','070','070','1','1','+13','-058','-27','-099','+0','+0','00','00','00','00','1','+20','+20','00512','00512','18200','17250','null','750','-50','-50','VER-V10.1.21     ','0','2022-07-06 18:10:14.478');
/*!40000 ALTER TABLE `banddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `country` (
  `COUNTRY_ID` int(11) NOT NULL,
  `COUNTRY_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`COUNTRY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'INDIA'),(2,'NEPAL');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcs1alarmtable`
--

DROP TABLE IF EXISTS `dcs1alarmtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dcs1alarmtable` (
  `dcs1repeaterId` int(11) NOT NULL,
  `dcs1repeaterSerialNo` varchar(45) DEFAULT NULL,
  `dcs1SynthesizerFailDl` varchar(45) DEFAULT NULL,
  `dcs1SynthesizerFailUl` varchar(45) DEFAULT NULL,
  `dcs1PwrUl` varchar(45) DEFAULT NULL,
  `dcs1PwrDl` varchar(45) DEFAULT NULL,
  `dcs1electricity` varchar(45) DEFAULT NULL,
  `dcs1severity` int(11) DEFAULT NULL,
  `dcs1AlarmText` int(11) DEFAULT NULL,
  `dcs1connected` int(11) DEFAULT NULL,
  `dcs1time` timestamp NULL DEFAULT NULL,
  `dcs1rowstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`dcs1repeaterId`),
  UNIQUE KEY `dcs1repeaterSerialNo_UNIQUE` (`dcs1repeaterSerialNo`),
  CONSTRAINT `dcs1repeaterId` FOREIGN KEY (`dcs1repeaterId`) REFERENCES `repeaterdata` (`RepId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcs1alarmtable`
--

LOCK TABLES `dcs1alarmtable` WRITE;
/*!40000 ALTER TABLE `dcs1alarmtable` DISABLE KEYS */;
INSERT INTO `dcs1alarmtable` VALUES (306707,'280621N00013','0','0','0','0','1',2,1,1,'2022-07-06 12:40:14',1);
/*!40000 ALTER TABLE `dcs1alarmtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcs2alarmtable`
--

DROP TABLE IF EXISTS `dcs2alarmtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dcs2alarmtable` (
  `dcs2repeaterId` int(11) NOT NULL,
  `dcs2repeaterSerialNo` varchar(45) DEFAULT NULL,
  `dcs2SynthesizerFailDl` varchar(45) DEFAULT NULL,
  `dcs2SynthesizerFailUl` varchar(45) DEFAULT NULL,
  `dcs2PwrUl` varchar(45) DEFAULT NULL,
  `dcs2PwrDl` varchar(45) DEFAULT NULL,
  `dcs2electricity` varchar(45) DEFAULT NULL,
  `dcs2severity` int(11) DEFAULT NULL,
  `dcs2AlarmText` int(11) DEFAULT NULL,
  `dcs2connected` int(11) DEFAULT NULL,
  `dcs2time` timestamp NULL DEFAULT NULL,
  `dcs2rowstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`dcs2repeaterId`),
  UNIQUE KEY `dcs2alarmTablecol_UNIQUE` (`dcs2repeaterSerialNo`),
  CONSTRAINT `dcs2repeaterId` FOREIGN KEY (`dcs2repeaterId`) REFERENCES `repeaterdata` (`RepId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcs2alarmtable`
--

LOCK TABLES `dcs2alarmtable` WRITE;
/*!40000 ALTER TABLE `dcs2alarmtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcs2alarmtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eightalarmtable`
--

DROP TABLE IF EXISTS `eightalarmtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `eightalarmtable` (
  `eightrepeaterId` int(11) NOT NULL,
  `eightrepeaterSerialNo` varchar(45) DEFAULT NULL,
  `eightSynthesizerFailDl` varchar(45) DEFAULT NULL,
  `eightSynthesizerFailUl` varchar(45) DEFAULT NULL,
  `eightPwrUl` varchar(45) DEFAULT NULL,
  `eightPwrDl` varchar(45) DEFAULT NULL,
  `eightelectricity` varchar(45) DEFAULT NULL,
  `eightseverity` int(11) DEFAULT NULL,
  `eightAlarmText` int(11) DEFAULT NULL,
  `eightconnected` int(11) DEFAULT NULL,
  `eighttime` timestamp NULL DEFAULT NULL,
  `eightrowstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`eightrepeaterId`),
  KEY `eightrepeaterSerialNo_idx` (`eightrepeaterSerialNo`),
  CONSTRAINT `eightrepeaterSerialNo` FOREIGN KEY (`eightrepeaterSerialNo`) REFERENCES `repeaterdata` (`SerialNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eightalarmtable`
--

LOCK TABLES `eightalarmtable` WRITE;
/*!40000 ALTER TABLE `eightalarmtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `eightalarmtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsmalarmtable`
--

DROP TABLE IF EXISTS `gsmalarmtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gsmalarmtable` (
  `gsmrepeaterId` int(11) NOT NULL,
  `gsmrepeaterSerialNo` varchar(45) DEFAULT NULL,
  `gsmSynthesizerFailDl` varchar(45) DEFAULT NULL,
  `gsmSynthesizerFailUl` varchar(45) DEFAULT NULL,
  `gsmPwrUl` varchar(45) DEFAULT NULL,
  `gsmPwrDl` varchar(45) DEFAULT NULL,
  `gsmelectricity` varchar(45) DEFAULT NULL,
  `gsmseverity` int(11) DEFAULT NULL,
  `gsmAlarmText` int(11) DEFAULT NULL,
  `gsmconnected` int(11) DEFAULT NULL,
  `gsmtime` timestamp NULL DEFAULT NULL,
  `gsmrowstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`gsmrepeaterId`),
  UNIQUE KEY `gsmalarmTablecol_UNIQUE` (`gsmrepeaterSerialNo`),
  CONSTRAINT `gsmrepeaterId` FOREIGN KEY (`gsmrepeaterId`) REFERENCES `repeaterdata` (`RepId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsmalarmtable`
--

LOCK TABLES `gsmalarmtable` WRITE;
/*!40000 ALTER TABLE `gsmalarmtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsmalarmtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humpdata`
--

DROP TABLE IF EXISTS `humpdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `humpdata` (
  `HumpDataId` int(11) NOT NULL AUTO_INCREMENT,
  `SerialNumber` varchar(20) DEFAULT NULL,
  `BandName` varchar(45) DEFAULT NULL,
  `HumpId` int(11) DEFAULT NULL,
  `StartChannel` varchar(45) DEFAULT NULL,
  `StopChannel` varchar(45) DEFAULT NULL,
  `CentralFreqDL` varchar(45) DEFAULT NULL,
  `CentralFreqUL` varchar(45) DEFAULT NULL,
  `BandWidth` varchar(45) DEFAULT NULL,
  `SawBandWidth` varchar(45) DEFAULT NULL,
  `InterFreqIF` varchar(45) DEFAULT NULL,
  `CompDL` varchar(45) DEFAULT NULL,
  `CompUL` varchar(45) DEFAULT NULL,
  `On_Off` varchar(45) DEFAULT NULL,
  `HumpTimeStamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`HumpDataId`),
  KEY `sn_idx` (`SerialNumber`),
  CONSTRAINT `sn` FOREIGN KEY (`SerialNumber`) REFERENCES `repeaterdata` (`SerialNumber`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humpdata`
--

LOCK TABLES `humpdata` WRITE;
/*!40000 ALTER TABLE `humpdata` DISABLE KEYS */;
INSERT INTO `humpdata` VALUES (45,'280621N00013','DCS1',1,'00512','00512','18052','17102','null','750','0000','00','00','0','2022-07-06 18:10:14.478'),(46,'280621N00013','DCS1',2,'00539','00563','18130','17180','null','750','0000','00','00','0','2022-07-06 18:10:14.478'),(47,'280621N00013','DCS1',3,'00539','00573','18140','17190','null','750','0000','00','00','1','2022-07-06 18:10:14.478'),(48,'280621N00013','DCS1',4,'00512','00512','18052','17102','null','750','0000','00','00','0','2022-07-06 18:10:14.478');
/*!40000 ALTER TABLE `humpdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu`
--

DROP TABLE IF EXISTS `mu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mu` (
  `MUid` int(11) NOT NULL AUTO_INCREMENT,
  `MUSerialNumber` varchar(20) DEFAULT NULL,
  `MUSiteNmae` varchar(20) DEFAULT NULL,
  `MUCircleName` varchar(20) DEFAULT NULL,
  `MUPartNumber` varchar(20) DEFAULT NULL,
  `MUPDAlarm` varchar(45) DEFAULT NULL,
  `MULDAlarm` varchar(45) DEFAULT NULL,
  `RU1ConnectionStatus` varchar(45) DEFAULT NULL,
  `RU2ConnectionStatus` varchar(45) DEFAULT NULL,
  `MUElectricityAlarm` varchar(45) DEFAULT NULL,
  `MUFirmwareVersion` varchar(45) DEFAULT NULL,
  `ConnectionStatus` varchar(45) DEFAULT NULL,
  `MUTimestamp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MUid`),
  UNIQUE KEY `MUSerialNumber_UNIQUE` (`MUSerialNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu`
--

LOCK TABLES `mu` WRITE;
/*!40000 ALTER TABLE `mu` DISABLE KEYS */;
/*!40000 ALTER TABLE `mu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `persistent_logins` (
  `username` varchar(50) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regioninfo`
--

DROP TABLE IF EXISTS `regioninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `regioninfo` (
  `RegionId` int(11) NOT NULL AUTO_INCREMENT,
  `RegionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RegionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regioninfo`
--

LOCK TABLES `regioninfo` WRITE;
/*!40000 ALTER TABLE `regioninfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `regioninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repeaterdata`
--

DROP TABLE IF EXISTS `repeaterdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `repeaterdata` (
  `RepId` int(11) NOT NULL AUTO_INCREMENT,
  `SerialNumber` varchar(20) DEFAULT NULL,
  `RU` varchar(45) DEFAULT NULL,
  `RegionName` varchar(20) DEFAULT NULL,
  `StreetName` varchar(100) DEFAULT 'NA',
  `City` varchar(45) DEFAULT 'NA',
  `State` varchar(45) DEFAULT 'NA',
  `Country` varchar(45) DEFAULT 'NA',
  `Latitude` varchar(45) DEFAULT 'NA',
  `Longitude` varchar(45) DEFAULT 'NA',
  `ContactName` varchar(100) DEFAULT 'NA',
  `ContactNumber` varchar(45) DEFAULT 'NA',
  `GsmConnected` varchar(45) DEFAULT NULL,
  `DcsConnected` varchar(45) DEFAULT NULL,
  `UmtsConnected` varchar(45) DEFAULT NULL,
  `RepPartNumber` varchar(20) DEFAULT NULL,
  `RepName` varchar(20) DEFAULT NULL,
  `IpAddress` varchar(16) DEFAULT NULL,
  `APN` varchar(16) DEFAULT NULL,
  `Port` varchar(4) DEFAULT NULL,
  `IMEI` varchar(45) DEFAULT NULL,
  `LacId` varchar(45) DEFAULT NULL,
  `CId` varchar(45) DEFAULT NULL,
  `RepeaterModelName` varchar(45) DEFAULT NULL,
  `ConnectionStatus` varchar(45) DEFAULT NULL,
  `ElectricityStatus` varchar(45) DEFAULT NULL,
  `reptype` varchar(45) DEFAULT NULL,
  `RepTimeStamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RepId`),
  UNIQUE KEY `SerialNumber_UNIQUE` (`SerialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=306715 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repeaterdata`
--

LOCK TABLES `repeaterdata` WRITE;
/*!40000 ALTER TABLE `repeaterdata` DISABLE KEYS */;
INSERT INTO `repeaterdata` VALUES (306707,'280621N00013','00','NOIDA12','null','null','null','null','null','null','null','null','1','1','1','FRD209B 3121','FHGGH','122.160.047.139','AIRTELGPRS','1001','860194030046726','00530','42276','2','false','0','2','2022-07-06 12:40:14');
/*!40000 ALTER TABLE `repeaterdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `repeaterdata_AFTER_DELETE` AFTER DELETE ON `repeaterdata` FOR EACH ROW BEGIN
DELETE FROM nms.alarmdata WHERE alarmdata.SerialNumber = old.SerialNumber;
 DELETE FROM nms.banddata WHERE banddata.SerialNumber = old.SerialNumber;
 DELETE FROM nms.humpdata WHERE humpdata.SerialNumber = old.SerialNumber;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rualarm`
--

DROP TABLE IF EXISTS `rualarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rualarm` (
  `AlarmId` int(11) NOT NULL AUTO_INCREMENT,
  `RuSerialNumber` varchar(45) DEFAULT NULL,
  `BandName` varchar(45) DEFAULT NULL,
  `ElectricityStatus` varchar(45) DEFAULT NULL,
  `VSWR` varchar(45) DEFAULT NULL,
  `OVRPWR` varchar(45) DEFAULT NULL,
  `PdPowerOptic1` varchar(45) DEFAULT NULL,
  `LdPowerOptic1` varchar(45) DEFAULT NULL,
  `PdPowerOptic2` varchar(45) DEFAULT NULL,
  `LdPowerOptic2` varchar(45) DEFAULT NULL,
  `TimeStamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AlarmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rualarm`
--

LOCK TABLES `rualarm` WRITE;
/*!40000 ALTER TABLE `rualarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `rualarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rudata`
--

DROP TABLE IF EXISTS `rudata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rudata` (
  `RUid` int(11) NOT NULL AUTO_INCREMENT,
  `RuSerialNumber` varchar(20) NOT NULL,
  `MuSerialNumber` varchar(20) DEFAULT NULL,
  `RuSystemName` varchar(45) DEFAULT NULL,
  `RuRegionName` varchar(45) DEFAULT NULL,
  `RuPartNumber` varchar(45) DEFAULT NULL,
  `RuApn` varchar(45) DEFAULT NULL,
  `RuIp` varchar(45) DEFAULT NULL,
  `RuPort` varchar(45) DEFAULT NULL,
  `RuConnectionStatus` varchar(45) DEFAULT NULL,
  `RuNumber` varchar(45) DEFAULT NULL,
  `Timestamp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RUid`),
  UNIQUE KEY `RuSerialNumber_UNIQUE` (`RuSerialNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rudata`
--

LOCK TABLES `rudata` WRITE;
/*!40000 ALTER TABLE `rudata` DISABLE KEYS */;
/*!40000 ALTER TABLE `rudata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smtp`
--

DROP TABLE IF EXISTS `smtp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smtp` (
  `UserName` varchar(100) NOT NULL,
  `Smtp` varchar(100) DEFAULT NULL,
  `Port` int(11) DEFAULT NULL,
  `Outbox` varchar(100) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smtp`
--

LOCK TABLES `smtp` WRITE;
/*!40000 ALTER TABLE `smtp` DISABLE KEYS */;
/*!40000 ALTER TABLE `smtp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `state` (
  `STATE_ID` int(11) NOT NULL,
  `STATE_NAME` varchar(255) NOT NULL,
  `COUNTRY_ID` int(11) NOT NULL,
  PRIMARY KEY (`STATE_ID`),
  KEY `FKit11p5l5munscwopy3tk7diur` (`COUNTRY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Andhra Pradesh',1),(2,'Assam',1),(3,'Bihar',1),(4,'Delhi',1),(5,'Gujarat',1),(6,'Haryana',1),(7,'Karnataka',1),(8,'Kerala',1),(9,'Kolkata',1),(10,'Province No. 1',2),(11,'Province No. 2',2),(12,'Province No. 3',2),(13,'Province No. 4',2),(14,'Province No. 5',2),(15,'Province No. 6',2),(16,'Province No. 7',2);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_alarm`
--

DROP TABLE IF EXISTS `t_alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_alarm` (
  `idt_alarm` int(13) NOT NULL AUTO_INCREMENT,
  `BandId` varchar(45) DEFAULT NULL,
  `serialNumber` varchar(45) NOT NULL,
  `AlarmName` varchar(100) NOT NULL,
  `AlarmState` int(10) DEFAULT NULL,
  `Timestamp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idt_alarm`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_alarm`
--

LOCK TABLES `t_alarm` WRITE;
/*!40000 ALTER TABLE `t_alarm` DISABLE KEYS */;
INSERT INTO `t_alarm` VALUES (34,'1','757647','Electricity Alarm',1,'2022-07-11 17:30:11.023'),(35,'1','757647','VCO_Alarm_Ul',1,'2022-07-11 17:30:11.023');
/*!40000 ALTER TABLE `t_alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_alarm_name`
--

DROP TABLE IF EXISTS `t_alarm_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_alarm_name` (
  `i_alarm_id` int(11) NOT NULL,
  `t_alarm_state` varchar(45) DEFAULT NULL,
  `t_alarm_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`i_alarm_id`),
  UNIQUE KEY `t_alarm_name_UNIQUE` (`t_alarm_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_alarm_name`
--

LOCK TABLES `t_alarm_name` WRITE;
/*!40000 ALTER TABLE `t_alarm_name` DISABLE KEYS */;
INSERT INTO `t_alarm_name` VALUES (1,'0','Electricity_Fail'),(2,'1','Electricity_UP'),(3,'1','RF_Power_High'),(4,'0','RF_Power_Low'),(5,'2','RF_Power_Clear');
/*!40000 ALTER TABLE `t_alarm_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_banddata`
--

DROP TABLE IF EXISTS `t_banddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_banddata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BandId` int(20) NOT NULL,
  `serialNumber` varchar(45) NOT NULL,
  `BandName` varchar(45) DEFAULT NULL,
  `LoEnable` varchar(45) DEFAULT NULL,
  `AlcOnOff` varchar(45) DEFAULT NULL,
  `PADownLink` varchar(45) DEFAULT NULL,
  `PAUpLink` varchar(45) DEFAULT NULL,
  `HumpCount` varchar(45) DEFAULT NULL,
  `AlcDownlinkLevel` varchar(45) DEFAULT NULL,
  `AlcUplinkLevel` varchar(45) DEFAULT NULL,
  `OffsetDownLink` varchar(45) DEFAULT NULL,
  `OffsetUpLink` varchar(45) DEFAULT NULL,
  `AttnDownLink` varchar(45) DEFAULT NULL,
  `AttnUpLink` varchar(45) DEFAULT NULL,
  `CompAttnDownLink` varchar(45) DEFAULT NULL,
  `CompAttnUpLink` varchar(45) DEFAULT NULL,
  `GainDownLink` varchar(45) DEFAULT NULL,
  `GainUpLink` varchar(45) DEFAULT NULL,
  `MaxGainDownLink` varchar(45) DEFAULT NULL,
  `MaxGainUpLink` varchar(45) DEFAULT NULL,
  `CentralFrequencyDownLink` varchar(45) DEFAULT NULL,
  `CentralFrequencyUpLink` varchar(45) DEFAULT NULL,
  `StartFrcequency` varchar(45) DEFAULT NULL,
  `StopFrequency` varchar(45) DEFAULT NULL,
  `AdLoDefFrequency` varchar(45) DEFAULT NULL,
  `CalibMaxDownLink` varchar(45) DEFAULT NULL,
  `CalibMaxUpLink` varchar(45) DEFAULT NULL,
  `ThresHoldDn` varchar(45) DEFAULT NULL,
  `ThresHoldUp` varchar(45) DEFAULT NULL,
  `TimeStamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_banddata`
--

LOCK TABLES `t_banddata` WRITE;
/*!40000 ALTER TABLE `t_banddata` DISABLE KEYS */;
INSERT INTO `t_banddata` VALUES (31,1,'1908166707','2','1','0','1','0','0','0','18','8','8','7','89','6','8','42','42','10','11','1785','1565','5678','745','7','67','45','0','0',NULL),(32,1,'1908166708','2','1','0','1','0','0','18','18','8','8','7','89','6','8','42','42','10','11','1785','1565','5678','745','7','67','45','0','0',NULL),(89,1,'858689','255','1','1','1','1','15','-1','-1','-1','-1','0','0','63','0','135','0','0','0','12704','16127','511','-1','767','-1','-1','-1','-667','2022-07-11 12:00:54.569'),(90,2,'858689','255','1','1','1','1','15','-1','-1','37','-3','255','0','255','0','0','0','0','0','0','0','17990','17990','18250','-1','-1','512','17300','2022-07-11 12:01:04.554'),(91,3,'858689','3','0','0','0','0','0','0','0','98','0','0','255','0','255','67','244','255','255','9493','0','9043','0','9493','0','0','60','0','2022-07-11 12:01:14.722'),(92,4,'858689','4','0','0','0','0','0','0','0','98','0','0','255','0','255','67','244','255','255','9493','0','9043','0','9493','0','0','60','0','2022-07-11 12:01:54.674'),(93,1,'757647','255','1','1','1','1','15','-1','-1','-1','-1','0','0','63','0','135','0','0','0','12704','16127','511','-1','767','-1','-1','-1','-667','2022-07-11 14:43:22.459'),(94,2,'757647','2','0','0','0','0','0','0','0','98','0','0','255','0','255','67','244','255','255','9493','0','9043','0','9493','0','0','60','0','2022-07-11 14:43:32.679'),(95,3,'757647','3','0','0','0','0','0','0','0','98','0','0','255','0','255','67','244','255','255','9493','0','9043','0','9493','0','0','60','0','2022-07-11 14:43:42.563'),(96,4,'757647','4','0','0','0','0','0','0','0','98','0','0','255','0','255','67','244','255','255','9493','0','9043','0','9493','0','0','60','0','2022-07-11 14:44:22.478');
/*!40000 ALTER TABLE `t_banddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_humpdata`
--

DROP TABLE IF EXISTS `t_humpdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_humpdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BandId` int(20) NOT NULL,
  `HumpId` int(11) NOT NULL,
  `SerialNumber` varchar(45) NOT NULL,
  `HumpOnOff` varchar(45) DEFAULT NULL,
  `CenterFreqDownlink` varchar(45) DEFAULT NULL,
  `CenterFreqUplink` varchar(45) DEFAULT NULL,
  `DownlinkComp` varchar(45) DEFAULT NULL,
  `UplinkComp` varchar(45) DEFAULT NULL,
  `DownlinkAttn` varchar(45) DEFAULT NULL,
  `UplinkAttn` varchar(45) DEFAULT NULL,
  `StartChannel` varchar(45) DEFAULT NULL,
  `StopChannel` varchar(45) DEFAULT NULL,
  `SawBandwidth` varchar(45) DEFAULT NULL,
  `TimeStamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bandId` (`BandId`) /*!80000 INVISIBLE */,
  KEY `bandId_idx` (`SerialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_humpdata`
--

LOCK TABLES `t_humpdata` WRITE;
/*!40000 ALTER TABLE `t_humpdata` DISABLE KEYS */;
INSERT INTO `t_humpdata` VALUES (134,4,1,'757647','1','0','0','0','0','0','0','0','0','0','2022-07-11 14:44:32.482'),(135,4,2,'757647','2','0','0','0','0','0','0','0','0','0','2022-07-11 14:44:32.753'),(136,4,3,'757647','3','0','0','0','0','0','0','0','0','0','2022-07-11 14:44:32.95'),(137,4,4,'757647','4','0','0','0','0','0','0','0','0','0','2022-07-11 14:44:33.152'),(138,4,5,'757647','5','0','0','0','0','0','0','0','0','0','2022-07-11 14:44:33.214'),(139,4,6,'757647','6','0','0','0','0','0','0','0','0','0','2022-07-11 14:44:33.309'),(140,4,7,'757647','7','0','0','0','0','0','0','0','0','0','2022-07-11 14:44:33.418'),(141,4,8,'757647','8','0','0','0','0','0','0','0','0','0','2022-07-11 14:44:33.502');
/*!40000 ALTER TABLE `t_humpdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_systemdetail`
--

DROP TABLE IF EXISTS `t_systemdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_systemdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialNumber` varchar(45) NOT NULL,
  `partNumber` varchar(45) DEFAULT NULL,
  `siteName` varchar(45) DEFAULT NULL,
  `siteAddress` varchar(45) DEFAULT NULL,
  `maxPower` varchar(45) DEFAULT NULL,
  `max_hump1` varchar(45) DEFAULT NULL,
  `max_hump2` varchar(45) DEFAULT NULL,
  `max_hump3` varchar(45) DEFAULT NULL,
  `max_hump4` varchar(45) DEFAULT NULL,
  `firmwareVersion` varchar(45) DEFAULT NULL,
  `lacId` varchar(45) DEFAULT NULL,
  `cellId` varchar(45) DEFAULT NULL,
  `serverIP` varchar(45) DEFAULT NULL,
  `portNo` varchar(45) DEFAULT NULL,
  `apn` varchar(45) DEFAULT NULL,
  `imeiNo` varchar(45) DEFAULT NULL,
  `smsNo` varchar(45) DEFAULT NULL,
  `modemMode` varchar(45) DEFAULT NULL,
  `modemTech` varchar(45) DEFAULT NULL,
  `ElectricityStatus` varchar(45) DEFAULT NULL,
  `ConnectionStatus` varchar(45) DEFAULT NULL,
  `TimeStamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serialNumber_UNIQUE` (`serialNumber`) /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_systemdetail`
--

LOCK TABLES `t_systemdetail` WRITE;
/*!40000 ALTER TABLE `t_systemdetail` DISABLE KEYS */;
INSERT INTO `t_systemdetail` VALUES (133,'1908166706','ram','veer','zsjebf','4','52','53','55','56','triband 1.2','111011','1101','2','3','3','7654787656566','676766363783','1','1','0','false','2022-07-06 23:44:34'),(139,'1908166710','frog','sec65','noida','5','2','2','3','3','triband1.0','0001','1101','127.0.0.1','1009','678009','11111156566','3333333363','1','2','0','false','2022-07-06 23:44:34'),(143,'1908166716','Noida','sec65','Bareilly','5','2','2','3','3','triband1.0','0001','1101','127.0.0.1','1009','678009','11111156566','3333333363','1','2','0','false','2022-07-06 23:44:34'),(144,'1908166717','Noida','sec65','Bareilly','5','2','2','3','3','triband1.0','0001','1101','127.0.0.1','1009','678009','11111156566','3333333363','1','2','0','false','2022-07-07 10:17:53.289'),(146,'858689','757647','GOA','DGDG','0','8','0','0','8','triband 1.2','','','','','','','','0','4','0','false','2022-07-11 12:00:34.627'),(147,'757647','858689','GOA','DGDG','0','8','0','0','8','triband 1.2','FSDFSDF','SDFSDF','233.323.32.32','2323','23233','3232323','sdfsdf','2','1','1','false','2022-07-11 17:46:56.162');
/*!40000 ALTER TABLE `t_systemdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `t_systemdetail_AFTER_DELETE` AFTER DELETE ON `t_systemdetail` FOR EACH ROW BEGIN
 DELETE FROM nms.t_alarm WHERE t_alarm.serialNumber = old.serialNumber;
 DELETE FROM nms.t_banddata WHERE t_banddata.serialNumber = old.serialNumber;
 DELETE FROM nms.t_humpdata WHERE t_humpdata.SerialNumber = old.SerialNumber;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `temp_tbl`
--

DROP TABLE IF EXISTS `temp_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `temp_tbl` (
  `idtemp_tbl` int(11) NOT NULL AUTO_INCREMENT,
  `SerialNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtemp_tbl`)
) ENGINE=InnoDB AUTO_INCREMENT=6687 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_tbl`
--

LOCK TABLES `temp_tbl` WRITE;
/*!40000 ALTER TABLE `temp_tbl` DISABLE KEYS */;
INSERT INTO `temp_tbl` VALUES (4096,'031016S05'),(4097,'109516N0552'),(4098,'120717N0294'),(4099,'190'),(4100,'190116N0306'),(4101,'190116N0310'),(4102,'190116N0315'),(4103,'190116N0321'),(4104,'190116N0324'),(4105,'190116N0326'),(4106,'190116N0329'),(4107,'190116N0338'),(4108,'190116N0342'),(4109,'190116N0346'),(4110,'190116N0349'),(4111,'190116N0356'),(4112,'190116N0357'),(4113,'190116N0359'),(4114,'190116N0366'),(4115,'190116N0377'),(4116,'190116N0381'),(4117,'190116N0382'),(4118,'190116N0386'),(4119,'190116N0387'),(4120,'190116N0390'),(4121,'190116N0394'),(4122,'190116N0397'),(4123,'1901176674'),(4124,'1901177095'),(4125,'1901177096'),(4126,'1901177097'),(4127,'1901177099'),(4128,'1901177100'),(4129,'1901177101'),(4130,'1901177110'),(4131,'1901177153'),(4132,'1901177156'),(4133,'1901177158'),(4134,'1901177159'),(4135,'1901177162'),(4136,'1901177163'),(4137,'1901177166'),(4138,'1901177169'),(4139,'1901177172'),(4140,'1901177173'),(4141,'1901177175'),(4142,'1901177178'),(4143,'1901177217'),(4144,'1901177221'),(4145,'1901177224'),(4146,'1901177226'),(4147,'1901177231'),(4148,'1901177232'),(4149,'1901177239'),(4150,'1901177262'),(4151,'1901177265'),(4152,'1901177268'),(4153,'1901177269'),(4154,'1901177271'),(4155,'1901177272'),(4156,'1901177273'),(4157,'1901177274'),(4158,'1901177276'),(4159,'1901177279'),(4160,'1901177281'),(4161,'1901177282'),(4162,'1901177537'),(4163,'1901177538'),(4164,'1901177540'),(4165,'1901177543'),(4166,'1901177547'),(4167,'1901177549'),(4168,'1901177550'),(4169,'1901177551'),(4170,'1901177553'),(4171,'1901177558'),(4172,'1901177563'),(4173,'1901177566'),(4174,'1901177568'),(4175,'1901177571'),(4176,'1901177576'),(4177,'1901177579'),(4178,'1901177580'),(4179,'1901177583'),(4180,'1901177585'),(4181,'1901177586'),(4182,'1901177591'),(4183,'1901177594'),(4184,'1901177595'),(4185,'1901177597'),(4186,'1901177600'),(4187,'1901177601'),(4188,'1901177602'),(4189,'1901177603'),(4190,'1901177604'),(4191,'190117N12488'),(4192,'190117N6210'),(4193,'190117N6212'),(4194,'190117N6220'),(4195,'190117N6308'),(4196,'190117N6615'),(4197,'190117N6618'),(4198,'190117N6626'),(4199,'190117N6629'),(4200,'190117N6630'),(4201,'190117N6638'),(4202,'190117N6640'),(4203,'190117N6644'),(4204,'190117N6659'),(4205,'190117N6668'),(4206,'190117N6677'),(4207,'190117N6679'),(4208,'190117N6721'),(4209,'190117N6733'),(4210,'190117N6737'),(4211,'190117N6761'),(4212,'190117N6781'),(4213,'190117N6782'),(4214,'190117N6783'),(4215,'190117N6784'),(4216,'190117N6786'),(4217,'190117N6788'),(4218,'190117N6789'),(4219,'190117N6792'),(4220,'190117N6793'),(4221,'190117N6795'),(4222,'190117N6796'),(4223,'190117N6797'),(4224,'190117N6799'),(4225,'190117N6801'),(4226,'190117N6803'),(4227,'190117N6804'),(4228,'190117N6811'),(4229,'190117N6814'),(4230,'190117N6822'),(4231,'190117N6824'),(4232,'190117N6825'),(4233,'190117N6827'),(4234,'190117N6831'),(4235,'190117N6834'),(4236,'190117N6838'),(4237,'190117N6841'),(4238,'190117N6842'),(4239,'190117N6844'),(4240,'190117N6846'),(4241,'190117N6847'),(4242,'190117N6848'),(4243,'190117N6852'),(4244,'190117N6853'),(4245,'1901189835'),(4246,'1901189836'),(4247,'1901189838'),(4248,'1901189840'),(4249,'1901189841'),(4250,'1901189842'),(4251,'1901189843'),(4252,'1901189844'),(4253,'1901189845'),(4254,'1901189847'),(4255,'1901189849'),(4256,'1901189850'),(4257,'1901189851'),(4258,'1901189857'),(4259,'1901189858'),(4260,'1901189859'),(4261,'1901189861'),(4262,'1901189863'),(4263,'1901189865'),(4264,'1901189867'),(4265,'1901189872'),(4266,'1901189874'),(4267,'1901189877'),(4268,'1901189883'),(4269,'1901189884'),(4270,'190118N23630'),(4271,'190118N23631'),(4272,'190118N23634'),(4273,'190118N23636'),(4274,'190118N23638'),(4275,'190118N23641'),(4276,'190118N23644'),(4277,'190118N23648'),(4278,'190118N23650'),(4279,'190118N23651'),(4280,'190118N23652'),(4281,'190118N23653'),(4282,'190118N23654'),(4283,'190118N23655'),(4284,'190118N23657'),(4285,'190118N23659'),(4286,'190118N23660'),(4287,'190118N23661'),(4288,'190118N23663'),(4289,'190118N23666'),(4290,'190118N23667'),(4291,'190118N23668'),(4292,'190118N23669'),(4293,'190118N23674'),(4294,'190118N23675'),(4295,'190118N23676'),(4296,'190118N23678'),(4297,'190118N23681'),(4298,'190118N23682'),(4299,'190118N23684'),(4300,'190118N23685'),(4301,'190118N23689'),(4302,'190118N23694'),(4303,'190118N23699'),(4304,'190118N23700'),(4305,'190118N23701'),(4306,'190118N23702'),(4307,'190118N23705'),(4308,'190118N23707'),(4309,'190118N23712'),(4310,'190118N23716'),(4311,'190118N23719'),(4312,'190118N29263'),(4313,'190118N30607'),(4314,'190118N30619'),(4315,'190118N30620'),(4316,'190118N30621'),(4317,'190118N32116'),(4318,'190119 N1878'),(4319,'190119N1831'),(4320,'190119N1832'),(4321,'190119N1848'),(4322,'190119N1857'),(4323,'190119N1865'),(4324,'190119N1872'),(4325,'190119N1874'),(4326,'190119N1875'),(4327,'190119N1876'),(4328,'190119N1881'),(4329,'190119N1891'),(4330,'190119N1892'),(4331,'190119N1894'),(4332,'190119N1898'),(4333,'190119N1903'),(4334,'190119N1906'),(4335,'190119N1907'),(4336,'190119N1909'),(4337,'190119N1911'),(4338,'190119N1912'),(4339,'190119N1915'),(4340,'190119N1925'),(4341,'190119N1926'),(4342,'190119N1927'),(4343,'19016N1687'),(4344,'19016N3179'),(4345,'1902165774'),(4346,'190216N1778'),(4347,'190217N3815'),(4348,'190217N6864'),(4349,'190217N6869'),(4350,'190217N6877'),(4351,'190217N6883'),(4352,'190217N6886'),(4353,'190217N6893'),(4354,'190217N6922'),(4355,'190217N6956'),(4356,'190217N7069'),(4357,'190217N7196'),(4358,'190217N7197'),(4359,'190217N7198'),(4360,'190217N7203'),(4361,'190217N7204'),(4362,'190217N7210'),(4363,'190217N7211'),(4364,'190217N7214'),(4365,'190217N7215'),(4366,'190217N7217'),(4367,'190217N7218'),(4368,'190217N7221'),(4369,'190217N7226'),(4370,'190217N7227'),(4371,'190217N7228'),(4372,'190217N7232'),(4373,'190217N7237'),(4374,'190217N7238'),(4375,'190217N7239'),(4376,'190217N7240'),(4377,'190217N7246'),(4378,'190217N7247'),(4379,'190217N7249'),(4380,'190217N7251'),(4381,'190217N7254'),(4382,'190217N7256'),(4383,'190217N7260'),(4384,'190217N7264'),(4385,'190217N7266'),(4386,'190217N7269'),(4387,'190217N7270'),(4388,'190217N7271'),(4389,'190217N7272'),(4390,'190217N7273'),(4391,'190217N7274'),(4392,'190217N7276'),(4393,'190217N7281'),(4394,'190217N7287'),(4395,'190217N7294'),(4396,'190217N7306'),(4397,'190217N7307'),(4398,'190217N7308'),(4399,'190217N7309'),(4400,'190217N7311'),(4401,'190217N7313'),(4402,'190217N7314'),(4403,'190217N7317'),(4404,'190217N7320'),(4405,'190217N7321'),(4406,'190217N7322'),(4407,'190217N7323'),(4408,'190217N7332'),(4409,'190217N7334'),(4410,'190217N7336'),(4411,'190217N7337'),(4412,'190217N7338'),(4413,'190217N7344'),(4414,'190217N7380'),(4415,'190217N7382'),(4416,'190217N7388'),(4417,'190217N7390'),(4418,'190217N7394'),(4419,'190217N7397'),(4420,'190217N7398'),(4421,'190217N7399'),(4422,'190217N7405'),(4423,'190217N7407'),(4424,'190217N7408'),(4425,'190217N7413'),(4426,'190217N7414'),(4427,'190217N7415'),(4428,'190217N7417'),(4429,'190217N7693'),(4430,'190217N7700'),(4431,'190217N7701'),(4432,'190217N7708'),(4433,'190217N7715'),(4434,'190217N7717'),(4435,'190217N7722'),(4436,'190217N7726'),(4437,'190217N7728'),(4438,'190217N7735'),(4439,'190217N7738'),(4440,'190217N7739'),(4441,'190217N7742'),(4442,'190217N7748'),(4443,'190217N7749'),(4444,'190217N7758'),(4445,'190217N7761'),(4446,'190217N7765'),(4447,'190217N7766'),(4448,'190217N7768'),(4449,'190217N7769'),(4450,'190217N7772'),(4451,'190217N7773'),(4452,'190217N7774'),(4453,'190217N7775'),(4454,'190217N7777'),(4455,'190217N7778'),(4456,'190217N7780'),(4457,'190217N7782'),(4458,'190217N7783'),(4459,'190217N7788'),(4460,'190217N7790'),(4461,'190217N7792'),(4462,'190217N7795'),(4463,'190217N7799'),(4464,'190217N7800'),(4465,'190217N7801'),(4466,'190217N7803'),(4467,'190217N7808'),(4468,'190217N7809'),(4469,'190217N7810'),(4470,'190217N7811'),(4471,'190217N7814'),(4472,'190217N7815'),(4473,'190217N7816'),(4474,'190217N7819'),(4475,'190217N7822'),(4476,'190217N7825'),(4477,'190217N7826'),(4478,'190217N7827'),(4479,'190217N7832'),(4480,'190217N7835'),(4481,'190217N7836'),(4482,'190217N7838'),(4483,'190217NSR05'),(4484,'190218N0063'),(4485,'190218N32153'),(4486,'190218N32154'),(4487,'190218N32155'),(4488,'190218N32159'),(4489,'190218N32160'),(4490,'190218N32162'),(4491,'190218N32164'),(4492,'190218N32235'),(4493,'190218N32239'),(4494,'190218N32241'),(4495,'190218N32242'),(4496,'190218N32255'),(4497,'190218N32267'),(4498,'190218N32272'),(4499,'190218N32295'),(4500,'190218N32298'),(4501,'190218N32305'),(4502,'190218N32307'),(4503,'190218N32310'),(4504,'190218N32311'),(4505,'190218N32312'),(4506,'190218N32315'),(4507,'190218N32316'),(4508,'190218N32318'),(4509,'190218N32319'),(4510,'190218N32320'),(4511,'190218N32325'),(4512,'190218N32326'),(4513,'190218N32329'),(4514,'190218N32332'),(4515,'190218N32333'),(4516,'190218N32334'),(4517,'190218N32335'),(4518,'190218N32338'),(4519,'190218N32341'),(4520,'190218N32402'),(4521,'190218N32407'),(4522,'190218N32408'),(4523,'190218N32409'),(4524,'190218N32411'),(4525,'190218N32413'),(4526,'190218N32416'),(4527,'190218N32418'),(4528,'190218N32420'),(4529,'190218N32421'),(4530,'190218N32425'),(4531,'190218N32428'),(4532,'190218N32431'),(4533,'190218N32432'),(4534,'190218N32434'),(4535,'190218N32437'),(4536,'190218N32439'),(4537,'190218N32440'),(4538,'190218N32442'),(4539,'190218N32443'),(4540,'190218N32445'),(4541,'190218N32446'),(4542,'190218N32447'),(4543,'190218N32448'),(4544,'190218N32449'),(4545,'190218N32450'),(4546,'190218N32451'),(4547,'190218N32453'),(4548,'190218N32454'),(4549,'190218N32588'),(4550,'190219N1938'),(4551,'190219N1940'),(4552,'190219N1943'),(4553,'190219N1944'),(4554,'190219N1951'),(4555,'190219N1956'),(4556,'190219N1963'),(4557,'190219N1968'),(4558,'190219N1973'),(4559,'190219N1983'),(4560,'190219N1989'),(4561,'190219N1994'),(4562,'190219N2013'),(4563,'190316N0020'),(4564,'1903178904'),(4565,'1903178910'),(4566,'1903178912'),(4567,'1903178919'),(4568,'1903178933'),(4569,'1903178935'),(4570,'1903178936'),(4571,'1903178941'),(4572,'1903178946'),(4573,'1903178947'),(4574,'1903178951'),(4575,'1903178964'),(4576,'1903178969'),(4577,'1903178973'),(4578,'1903178976'),(4579,'1903178980'),(4580,'1903178985'),(4581,'1903178986'),(4582,'1903178988'),(4583,'1903178989'),(4584,'1903178990'),(4585,'1903178995'),(4586,'1903178997'),(4587,'1903178999'),(4588,'1903179008'),(4589,'1903179015'),(4590,'1903179020'),(4591,'1903179024'),(4592,'1903179026'),(4593,'1903179027'),(4594,'1903179028'),(4595,'1903179032'),(4596,'1903179033'),(4597,'1903179034'),(4598,'1903179037'),(4599,'190317N7943'),(4600,'190317N7944'),(4601,'190317N7948'),(4602,'190317N7951'),(4603,'190317N7952'),(4604,'190317N7956'),(4605,'190317N7959'),(4606,'190317N7962'),(4607,'190317N7969'),(4608,'190317N7973'),(4609,'190317N7976'),(4610,'190317N7977'),(4611,'190317N7978'),(4612,'190317N8135'),(4613,'190317N8138'),(4614,'190317N8144'),(4615,'190317N8145'),(4616,'190317N8147'),(4617,'190317N8149'),(4618,'190317N8153'),(4619,'190317N8156'),(4620,'190317N8157'),(4621,'190317N8161'),(4622,'190317N8163'),(4623,'190317N8168'),(4624,'190317N8170'),(4625,'190317N8173'),(4626,'190317N8175'),(4627,'190317N8178'),(4628,'190317N8186'),(4629,'190317N8187'),(4630,'190317N8188'),(4631,'190317N8190'),(4632,'190317N8192'),(4633,'190317N8229'),(4634,'190317N8231'),(4635,'190317N8232'),(4636,'190317N8233'),(4637,'190317N8240'),(4638,'190317N8243'),(4639,'190317N8248'),(4640,'190317N8252'),(4641,'190317N8256'),(4642,'190317N8263'),(4643,'190317N8268'),(4644,'190317N8276'),(4645,'190317N8277'),(4646,'190317N8293'),(4647,'190317N8294'),(4648,'190317N8302'),(4649,'190317N8308'),(4650,'190317N8309'),(4651,'190317N8314'),(4652,'190317N8315'),(4653,'190317N8324'),(4654,'190317N8329'),(4655,'190317N8330'),(4656,'190317N8331'),(4657,'190317N8337'),(4658,'190317N8342'),(4659,'190317N8343'),(4660,'190317N8344'),(4661,'190317N8349'),(4662,'190317N8350'),(4663,'190317N8352'),(4664,'190317N8353'),(4665,'190317N8354'),(4666,'190317N8356'),(4667,'190317N8358'),(4668,'190317N8359'),(4669,'190317N8364'),(4670,'190317N8366'),(4671,'190317N8367'),(4672,'190317NS978'),(4673,'190317NSR01'),(4674,'190317S8358'),(4675,'190318N0042'),(4676,'190318N0043'),(4677,'190318N0045'),(4678,'190318N0046'),(4679,'190318N32455'),(4680,'190318N32457'),(4681,'190318N32458'),(4682,'190318N32459'),(4683,'190318N32461'),(4684,'190318N32462'),(4685,'190318N32467'),(4686,'190318N32474'),(4687,'190318N32475'),(4688,'190318N32476'),(4689,'190318N32478'),(4690,'190318N32489'),(4691,'190318N32491'),(4692,'190318N32492'),(4693,'190318N32494'),(4694,'190318N32497'),(4695,'190318N32500'),(4696,'190318N32505'),(4697,'190318N32506'),(4698,'190318N32509'),(4699,'190318N32535'),(4700,'190318N32538'),(4701,'190318N32541'),(4702,'190318N32542'),(4703,'190318N32543'),(4704,'190318N32548'),(4705,'190318N32549'),(4706,'190318N32550'),(4707,'190318N32551'),(4708,'190318N32552'),(4709,'190318N32555'),(4710,'190318N32558'),(4711,'190318N32561'),(4712,'190318N32568'),(4713,'190318N32569'),(4714,'190318N32570'),(4715,'190318N32573'),(4716,'190318N32576'),(4717,'190318N32581'),(4718,'190318N32583'),(4719,'190318N32585'),(4720,'190318N32586'),(4721,'190318N32590'),(4722,'190318N32594'),(4723,'190318N32595'),(4724,'190318N32596'),(4725,'190318N32597'),(4726,'190318N32608'),(4727,'190318N32616'),(4728,'190318N32619'),(4729,'190318N32620'),(4730,'190318N32621'),(4731,'190318N32626'),(4732,'190318N32629'),(4733,'190318N32631'),(4734,'190318N32639'),(4735,'190318N32640'),(4736,'190318N32641'),(4737,'190318N32646'),(4738,'190318N32647'),(4739,'190318S0044'),(4740,'190416N0004'),(4741,'190416N0007'),(4742,'190416N0038'),(4743,'190416N0049'),(4744,'190416N0051'),(4745,'190416N0054'),(4746,'190416N0059'),(4747,'190416N0063'),(4748,'190416N0067'),(4749,'190416N0071'),(4750,'190416N0077'),(4751,'190416N0079'),(4752,'190416N0086'),(4753,'190416N0089'),(4754,'190416N0094'),(4755,'190416N0097'),(4756,'190416N0100'),(4757,'190416N0214'),(4758,'190416N0222'),(4759,'190416N0226'),(4760,'190416N0230'),(4761,'190416N0234'),(4762,'190416N0236'),(4763,'190416N0245'),(4764,'190416N0248'),(4765,'190416N0250'),(4766,'190416N0260'),(4767,'190416N0273'),(4768,'190416N0276'),(4769,'190416N0299'),(4770,'190416N0368'),(4771,'190417MUSR02'),(4772,'190418N0001'),(4773,'190418N0002'),(4774,'190418N0005'),(4775,'190418N0046'),(4776,'190418N0047'),(4777,'190418N0051'),(4778,'190418N0054'),(4779,'190418N0057'),(4780,'190418N0058'),(4781,'190418N0059'),(4782,'190418N0065'),(4783,'190418N0069'),(4784,'190418N0072'),(4785,'190418N0076'),(4786,'190418N0078'),(4787,'190418N0079'),(4788,'190418N0094'),(4789,'190418SR0025'),(4790,'190418SR0027'),(4791,'19051   6N0  517'),(4792,'19051  6N1183'),(4793,'1905160870'),(4794,'190516N0391'),(4795,'190516N0392'),(4796,'190516N0393'),(4797,'190516N0395'),(4798,'190516N0511'),(4799,'190516N0512'),(4800,'190516N0513'),(4801,'190516N0518'),(4802,'190516N0524'),(4803,'190516N0530'),(4804,'190516N0531'),(4805,'190516N0532'),(4806,'190516N0533'),(4807,'190516N0534'),(4808,'190516N0535'),(4809,'190516N0536'),(4810,'190516N0539'),(4811,'190516N0540'),(4812,'190516N0543'),(4813,'190516N0544'),(4814,'190516N0548'),(4815,'190516N0550'),(4816,'190516N0553'),(4817,'190516N0558'),(4818,'190516N0565'),(4819,'190516N0571'),(4820,'190516N0575'),(4821,'190516N0580'),(4822,'190516N0581'),(4823,'190516N0582'),(4824,'190516N0585'),(4825,'190516N0586'),(4826,'190516N0589'),(4827,'190516N0590'),(4828,'190516N0593'),(4829,'190516N0594'),(4830,'190516N0595'),(4831,'190516N0598'),(4832,'190516N0604'),(4833,'190516N0612'),(4834,'190516N0614'),(4835,'190516N0616'),(4836,'190516N0621'),(4837,'190516N0623'),(4838,'190516N0626'),(4839,'190516N0627'),(4840,'190516N0628'),(4841,'190516N0631'),(4842,'190516N0635'),(4843,'190516N0647'),(4844,'190516N0659'),(4845,'190516N0660'),(4846,'190516N0661'),(4847,'190516N0673'),(4848,'190516N0674'),(4849,'190516N0675'),(4850,'190516N0679'),(4851,'190516N0683'),(4852,'190516N0686'),(4853,'190516N0690'),(4854,'190516N0691'),(4855,'190516N0695'),(4856,'190516N0699'),(4857,'190516N0700'),(4858,'190516N0706'),(4859,'190516N0711'),(4860,'190516N0715'),(4861,'190516N0717'),(4862,'190516N0729'),(4863,'190516N0734'),(4864,'190516N0744'),(4865,'190516N0745'),(4866,'190516N0752'),(4867,'190516N0755'),(4868,'190516N0758'),(4869,'190516N0763'),(4870,'190516N0767'),(4871,'190516N0769'),(4872,'190516N0773'),(4873,'190516N0784'),(4874,'190516N0788'),(4875,'190516N0791'),(4876,'190516N0811'),(4877,'190516N0813'),(4878,'190516N0815'),(4879,'190516N0816'),(4880,'190516N0817'),(4881,'190516N0824'),(4882,'190516N0825'),(4883,'190516N0829'),(4884,'190516N0837'),(4885,'190516N0840'),(4886,'190516N0845'),(4887,'190516N0849'),(4888,'190516N0852'),(4889,'190516N0853'),(4890,'190516N0857'),(4891,'190516N0862'),(4892,'190516N0864'),(4893,'190516N0872'),(4894,'190516N0879'),(4895,'190516N0882'),(4896,'190516N0889'),(4897,'190516N0890'),(4898,'190516N0891'),(4899,'190516N0896'),(4900,'190516N0899'),(4901,'190516N0907'),(4902,'190516N0922'),(4903,'190516N0924'),(4904,'190516N0925'),(4905,'190516N0932'),(4906,'190516N0936'),(4907,'190516N0938'),(4908,'190516N0941'),(4909,'190516N0949'),(4910,'190516N0951'),(4911,'190516N0952'),(4912,'190516N0953'),(4913,'190516N0955'),(4914,'190516N0956'),(4915,'190516N0970'),(4916,'190516N0972'),(4917,'190516N0973'),(4918,'190516N0976'),(4919,'190516N0979'),(4920,'190516N0983'),(4921,'190516N0987'),(4922,'190516N0988'),(4923,'190516N0998'),(4924,'190516N0999'),(4925,'190516N1124'),(4926,'190516N1132'),(4927,'190516N1136'),(4928,'190516N1140'),(4929,'190516N1154'),(4930,'190516N1163'),(4931,'190516N1173'),(4932,'190516N1174'),(4933,'190516N1178'),(4934,'190516N1179'),(4935,'190516N1180'),(4936,'190516N1187'),(4937,'190516N1188'),(4938,'190516N1191'),(4939,'190516N1193'),(4940,'190516N1197'),(4941,'190516N1201'),(4942,'190516N1210'),(4943,'190516N1223'),(4944,'190516N1230'),(4945,'190516N1236'),(4946,'190516N1241'),(4947,'190516N1242'),(4948,'190516N1246'),(4949,'190516N1247'),(4950,'190516N1248'),(4951,'190516N1249'),(4952,'190516N1252'),(4953,'190516N1254'),(4954,'190516N1258'),(4955,'190516N1260'),(4956,'190516N1275'),(4957,'190516N1277'),(4958,'190516N1278'),(4959,'190516N1282'),(4960,'190516N1302'),(4961,'190516N1879'),(4962,'190516N2154'),(4963,'190516N560'),(4964,'190516N8823'),(4965,'190516N941'),(4966,'190518N0319'),(4967,'190518N0320'),(4968,'190518N0321'),(4969,'190518N0324'),(4970,'190518N0326'),(4971,'190518N0327'),(4972,'190518N0330'),(4973,'190518N0332'),(4974,'190518N0335'),(4975,'190518N0336'),(4976,'190518N0338'),(4977,'190518N0341'),(4978,'190518N0343'),(4979,'190518N0344'),(4980,'190518N0347'),(4981,'190518N0348'),(4982,'190518N0352'),(4983,'190518N0353'),(4984,'190518N0355'),(4985,'190518N0357'),(4986,'190518N0365'),(4987,'190518N0366'),(4988,'190518N0370'),(4989,'190518N0375'),(4990,'190518N0491'),(4991,'190518N0493'),(4992,'190518N0496'),(4993,'190518N0497'),(4994,'190518N0498'),(4995,'190518N0499'),(4996,'190518N0500'),(4997,'190518N0504'),(4998,'190518N0505'),(4999,'190518N0509'),(5000,'190518N0513'),(5001,'190518N0519'),(5002,'190518N0520'),(5003,'190518N0523'),(5004,'190518N0526'),(5005,'190518N0527'),(5006,'190518N0529'),(5007,'190518N0532'),(5008,'190518N0536'),(5009,'190518N0537'),(5010,'190518N0541'),(5011,'190518N0546'),(5012,'190518N0559'),(5013,'190518N0560'),(5014,'190518N0570'),(5015,'190518N0572'),(5016,'190518N0586'),(5017,'190518N0592'),(5018,'190518N0600'),(5019,'190518N0640'),(5020,'190518N0646'),(5021,'190518SR0030'),(5022,'190518SR0031'),(5023,'190518SR0034'),(5024,'190518SR0035'),(5025,'190518SR0036'),(5026,'190518SR0037'),(5027,'190518SR0038'),(5028,'190518SR0039'),(5029,'190518SR0042'),(5030,'190518SR0043'),(5031,'190546N0788'),(5032,'1906164387'),(5033,'1906164388'),(5034,'1906164391'),(5035,'1906164392'),(5036,'1906164393'),(5037,'1906164397'),(5038,'1906164400'),(5039,'1906164403'),(5040,'1906164404'),(5041,'1906164406'),(5042,'1906164411'),(5043,'1906164417'),(5044,'1906164420'),(5045,'1906164424'),(5046,'1906164426'),(5047,'1906164433'),(5048,'1906164439'),(5049,'1906164444'),(5050,'1906164448'),(5051,'1906164450'),(5052,'1906164454'),(5053,'1906164455'),(5054,'1906164456'),(5055,'1906164458'),(5056,'1906164464'),(5057,'1906164471'),(5058,'1906164485'),(5059,'1906164486'),(5060,'1906164522'),(5061,'1906164523'),(5062,'1906164528'),(5063,'1906164545'),(5064,'1906164565'),(5065,'1906164566'),(5066,'1906164586'),(5067,'1906164593'),(5068,'1906164595'),(5069,'1906164596'),(5070,'1906164598'),(5071,'1906164602'),(5072,'1906164608'),(5073,'1906164609'),(5074,'1906164613'),(5075,'1906164614'),(5076,'1906164615'),(5077,'1906164616'),(5078,'1906164618'),(5079,'1906164642'),(5080,'1906164643'),(5081,'1906164644'),(5082,'1906164645'),(5083,'1906164646'),(5084,'1906164647'),(5085,'1906164653'),(5086,'1906164666'),(5087,'1906164667'),(5088,'1906164669'),(5089,'1906164670'),(5090,'1906164684'),(5091,'1906164689'),(5092,'190616N0675'),(5093,'190616N0788'),(5094,'190616N0992'),(5095,'190616N1269'),(5096,'190616N1496'),(5097,'190616N1500'),(5098,'190616N1501'),(5099,'190616N1502'),(5100,'190616N1503'),(5101,'190616N1504'),(5102,'190616N1506'),(5103,'190616N1508'),(5104,'190616N1513'),(5105,'190616N1514'),(5106,'190616N1516'),(5107,'190616N1517'),(5108,'190616N1521'),(5109,'190616N1534'),(5110,'190616N1641'),(5111,'190616N1643'),(5112,'190616N1651'),(5113,'190616N1652'),(5114,'190616N1656'),(5115,'190616N1664'),(5116,'190616N1667'),(5117,'190616N1672'),(5118,'190616N1674'),(5119,'190616N1676'),(5120,'190616N1677'),(5121,'190616N1680'),(5122,'190616N1681'),(5123,'190616N1690'),(5124,'190616N1692'),(5125,'190616N1702'),(5126,'190616N1703'),(5127,'190616N1710'),(5128,'190616N1718'),(5129,'190616N1719'),(5130,'190616N1721'),(5131,'190616N1724'),(5132,'190616N2071'),(5133,'190616N2072'),(5134,'190616N2075'),(5135,'190616N2092'),(5136,'190616N2101'),(5137,'190616N2117'),(5138,'190616N2119'),(5139,'190616N2122'),(5140,'190616N2138'),(5141,'190616N2144'),(5142,'190616N2154'),(5143,'190616N2157'),(5144,'190616N2158'),(5145,'190616N2159'),(5146,'190616N2308'),(5147,'190616N2316'),(5148,'190616N2331'),(5149,'190616N2338'),(5150,'190616N2384'),(5151,'190616N2385'),(5152,'190616N2388'),(5153,'190616N2391'),(5154,'190616N2392'),(5155,'190616N2393'),(5156,'190616N2394'),(5157,'190616N2395'),(5158,'190616N2399'),(5159,'190616N2402'),(5160,'190616N2403'),(5161,'190616N2407'),(5162,'190616N2425'),(5163,'190616N2431'),(5164,'190616N24337'),(5165,'190616N2439'),(5166,'190616N2440'),(5167,'190616N2441'),(5168,'190616N2446'),(5169,'190616N2448'),(5170,'190616N2449'),(5171,'190616N2455'),(5172,'190616N2551'),(5173,'190616N2557'),(5174,'190616N2560'),(5175,'190616N2563'),(5176,'190616N2564'),(5177,'190616N2575'),(5178,'190616N2576'),(5179,'190616N2588'),(5180,'190616N2591'),(5181,'190616N2595'),(5182,'190616N2604'),(5183,'190616N2609'),(5184,'190616N2610'),(5185,'190616N2612'),(5186,'190616N2615'),(5187,'190616N2621'),(5188,'190616N2804'),(5189,'190616N2884'),(5190,'190616N2887'),(5191,'190616N2890'),(5192,'190616N2891'),(5193,'190616N2892'),(5194,'190616N2902'),(5195,'190616N2905'),(5196,'190616N2910'),(5197,'190616N2913'),(5198,'190616N2914'),(5199,'190616N2917'),(5200,'190616N2918'),(5201,'190616N2919'),(5202,'190616N2922'),(5203,'190616N2923'),(5204,'190616N2929'),(5205,'190616N2939'),(5206,'190616N2940'),(5207,'190616N2963'),(5208,'190616N2964'),(5209,'190616N2966'),(5210,'190616N2968'),(5211,'190616N2977'),(5212,'190616N2988'),(5213,'190616N2989'),(5214,'190616N2990'),(5215,'190616N2999'),(5216,'190616N3004'),(5217,'190616N3009'),(5218,'190616N3010'),(5219,'190616N3018'),(5220,'190616N3019'),(5221,'190616N3020'),(5222,'190616N3021'),(5223,'190616N3023'),(5224,'190616N3025'),(5225,'190616N3026'),(5226,'190616N3029'),(5227,'190616N3032'),(5228,'190616N3033'),(5229,'190616N3045'),(5230,'190616N3115'),(5231,'190616N3123'),(5232,'190616N3124'),(5233,'190616N3130'),(5234,'190616N3141'),(5235,'190616N3143'),(5236,'190616N3148'),(5237,'190616N3150'),(5238,'190616N3152'),(5239,'190616N3158'),(5240,'190616N3168'),(5241,'190616N3169'),(5242,'190616N3180'),(5243,'190616N3199'),(5244,'190616N4918'),(5245,'190617N0157'),(5246,'190617N0158'),(5247,'190617N0159'),(5248,'190617N0161'),(5249,'190617N0164'),(5250,'190617N0165'),(5251,'190617N0166'),(5252,'190617N0167'),(5253,'190617N0171'),(5254,'190617N0173'),(5255,'190617N0176'),(5256,'190617N0186'),(5257,'190617N0193'),(5258,'190617N0195'),(5259,'190617N0196'),(5260,'190617N0197'),(5261,'190617N0199'),(5262,'190617N0203'),(5263,'190617N0208'),(5264,'190617N0215'),(5265,'190617N0216'),(5266,'190617N0218'),(5267,'190617N0224'),(5268,'190617N0226'),(5269,'190617N0231'),(5270,'190617N0232'),(5271,'190617N0233'),(5272,'190617N0239'),(5273,'190617N0241'),(5274,'190617N0242'),(5275,'190617N0245'),(5276,'190617N0258'),(5277,'190617N0260'),(5278,'190617N0268'),(5279,'190617N0270'),(5280,'190617N0272'),(5281,'190617N0273'),(5282,'190617N0275'),(5283,'190617N0276'),(5284,'190617N0278'),(5285,'190617N0286'),(5286,'190618N0835'),(5287,'190618N0875'),(5288,'190618N0883'),(5289,'190618N0884'),(5290,'190618N0885'),(5291,'190618N0886'),(5292,'190618N0891'),(5293,'190618N0895'),(5294,'190618N0902'),(5295,'190618N0908'),(5296,'190618N0909'),(5297,'190618N0914'),(5298,'190618N0917'),(5299,'190618N0918'),(5300,'190618N0924'),(5301,'190618N0926'),(5302,'190618N0930'),(5303,'190618N0931'),(5304,'190618N0933'),(5305,'190618N0934'),(5306,'190618N0935'),(5307,'190618N0938'),(5308,'190618N0939'),(5309,'190618N0944'),(5310,'190618N0945'),(5311,'190618N0947'),(5312,'190618N0949'),(5313,'190618N0951'),(5314,'190618N0954'),(5315,'190618N0955'),(5316,'190618N0958'),(5317,'190618N0960'),(5318,'190618N0961'),(5319,'190618N0963'),(5320,'190618N0964'),(5321,'190618N0968'),(5322,'190618N0969'),(5323,'190618N0972'),(5324,'190618N0973'),(5325,'190618N0976'),(5326,'190618N0979'),(5327,'190618N0980'),(5328,'190618N0983'),(5329,'190618N0989'),(5330,'190618N0992'),(5331,'190618N0993'),(5332,'190618N0997'),(5333,'190618N1000'),(5334,'190618N1001'),(5335,'190618N1002'),(5336,'190618N1007'),(5337,'190618N1013'),(5338,'190618N1014'),(5339,'190618N1017'),(5340,'190618N1018'),(5341,'190618N1021'),(5342,'190618N1026'),(5343,'190618N1029'),(5344,'190618N1036'),(5345,'190618N1037'),(5346,'190618N1038'),(5347,'190618N1039'),(5348,'190618N1040'),(5349,'190618N1041'),(5350,'190618N1046'),(5351,'190618N1047'),(5352,'190618N1048'),(5353,'190618N1049'),(5354,'190618N1050'),(5355,'190618N1051'),(5356,'190618N1052'),(5357,'190618N1053'),(5358,'190618N1054'),(5359,'190618N1055'),(5360,'190618N1056'),(5361,'190618N1057'),(5362,'190618N1058'),(5363,'190618N1059'),(5364,'190618N1060'),(5365,'190618N1062'),(5366,'190618N1063'),(5367,'190618N1065'),(5368,'190618N1066'),(5369,'190618N1069'),(5370,'190618N1070'),(5371,'190618N1072'),(5372,'190618N1073'),(5373,'190618N1074'),(5374,'190618N1079'),(5375,'190618N1082'),(5376,'190618N1083'),(5377,'19061N0898'),(5378,'19070164805'),(5379,'1907164801'),(5380,'1907164803'),(5381,'1907164805'),(5382,'1907164808'),(5383,'1907164817'),(5384,'1907164836'),(5385,'190716N3121'),(5386,'190716N3219'),(5387,'190716N3228'),(5388,'190716N3233'),(5389,'190716N3250'),(5390,'190716N3252'),(5391,'190716N3263'),(5392,'190716N3264'),(5393,'190716N3290'),(5394,'190716N3292'),(5395,'190716N3293'),(5396,'190716N3296'),(5397,'190716N3301'),(5398,'190716N3302'),(5399,'190716N3303'),(5400,'190716N3306'),(5401,'190716N3309'),(5402,'190716N3313'),(5403,'190716N3314'),(5404,'190716N3410'),(5405,'190716N3412'),(5406,'190716N3415'),(5407,'190716N3418'),(5408,'190716N3419'),(5409,'190716N3421'),(5410,'190717N0291'),(5411,'190717N0295'),(5412,'190717N0301'),(5413,'190717N0307'),(5414,'190717N0309'),(5415,'190717N0310'),(5416,'190717N0313'),(5417,'190717N0314'),(5418,'190717N0315'),(5419,'190717N0317'),(5420,'190717N0318'),(5421,'190717N0319'),(5422,'190717N0320'),(5423,'190717N0325'),(5424,'190717N0326'),(5425,'190717N0327'),(5426,'190717N0329'),(5427,'190717N0330'),(5428,'190717N0331'),(5429,'190717N0336'),(5430,'190717N0337'),(5431,'190717N0339'),(5432,'190717N0340'),(5433,'190717N0391'),(5434,'190717N0393'),(5435,'190717N0394'),(5436,'190717N0395'),(5437,'190717N0396'),(5438,'190717N0397'),(5439,'190717N0398'),(5440,'190717N0399'),(5441,'190717N0400'),(5442,'190717N0401 '),(5443,'190717N0402'),(5444,'190717N0403'),(5445,'190717N0404'),(5446,'190717N0405'),(5447,'190717N0406'),(5448,'190717N0407'),(5449,'190717N0408'),(5450,'190717N0409'),(5451,'190717N0410'),(5452,'190717N0411'),(5453,'190717N0414'),(5454,'190717N0415'),(5455,'190717N0416'),(5456,'190717N0419'),(5457,'190717N0420'),(5458,'190717N0422'),(5459,'190717N0423'),(5460,'190717N0424'),(5461,'190717N0426'),(5462,'190717N0428'),(5463,'190717N0430'),(5464,'190717N0441'),(5465,'190717N0442'),(5466,'190717N0443'),(5467,'190717N0455'),(5468,'190717NSR0005'),(5469,'190717NSR0007'),(5470,'190717SR0001'),(5471,'190717SR0002'),(5472,'190717SR0004'),(5473,'190717SR0005'),(5474,'190718N1219'),(5475,'190718N1224'),(5476,'190718N1226'),(5477,'190718N1227'),(5478,'190718N1229'),(5479,'190718N1230'),(5480,'190718N1234'),(5481,'190718N1236'),(5482,'190718N1238'),(5483,'190718N1240'),(5484,'190718N1243'),(5485,'190718N1270'),(5486,'190718N1272'),(5487,'190718N1275'),(5488,'190718N1282'),(5489,'190718N1288'),(5490,'190718N1290'),(5491,'190718N1293'),(5492,'190718N1299'),(5493,'190718N1300'),(5494,'190718N1306'),(5495,'190718N1307'),(5496,'190718N1315'),(5497,'190718N1318'),(5498,'190718N1323'),(5499,'190718N1324'),(5500,'190718N1334'),(5501,'190718N1335'),(5502,'190718N1337'),(5503,'190718N1339'),(5504,'190718N1347'),(5505,'190718N1351'),(5506,'190718N1358'),(5507,'190718N1359'),(5508,'190718N1361'),(5509,'190718N1364'),(5510,'190718N1365'),(5511,'190718N1366'),(5512,'190718N1368'),(5513,'190718N1371'),(5514,'190718N1374'),(5515,'190718N1376'),(5516,'190718N1379'),(5517,'190718N1380'),(5518,'190718N1384'),(5519,'190718N1387'),(5520,'190718N1390'),(5521,'190718N1392'),(5522,'190718N1395'),(5523,'190718N1400'),(5524,'190718N1404'),(5525,'190718N1405'),(5526,'190718N1407'),(5527,'190718N1409'),(5528,'190718N1415'),(5529,'190718N1418'),(5530,'190718N1419'),(5531,'190718N1432'),(5532,'190718N1435'),(5533,'190718N1445'),(5534,'190718N1452'),(5535,'190718N1454'),(5536,'190718N1459'),(5537,'190718N1465'),(5538,'190718N1468'),(5539,'190718N1469'),(5540,'190718N1470'),(5541,'190718N1471'),(5542,'190718N1472'),(5543,'190718N1473'),(5544,'190718N1474'),(5545,'190718N1475'),(5546,'190718N1481'),(5547,'190718N1484'),(5548,'190718N1487'),(5549,'190718N1488'),(5550,'190718N1495'),(5551,'190718N1497'),(5552,'190718N1500'),(5553,'190718N1505'),(5554,'190718N1517'),(5555,'190718N1580'),(5556,'190718N1619'),(5557,'190718N1645'),(5558,'190718N1646'),(5559,'190718N1647'),(5560,'190816 N0956'),(5561,'1908166684'),(5562,'1908166688'),(5563,'1908166690'),(5564,'1908166695'),(5565,'1908166696'),(5566,'1908166699'),(5567,'1908166700'),(5568,'1908166701'),(5569,'1908166705'),(5570,'1908166709'),(5571,'1908166715'),(5572,'1908166716'),(5573,'1908166719'),(5574,'1908166721'),(5575,'1908166725'),(5576,'1908166730'),(5577,'1908166731'),(5578,'190816N3893'),(5579,'190816N3895'),(5580,'190816N3897'),(5581,'190816N3903'),(5582,'190816N3904'),(5583,'190816N3919'),(5584,'190816N3925'),(5585,'190816N3929'),(5586,'190816N4001'),(5587,'190816N4009'),(5588,'190816N4010'),(5589,'190816N4011'),(5590,'190816N4014'),(5591,'190816N4015'),(5592,'190816N4018'),(5593,'190816N4020'),(5594,'190816N4022'),(5595,'190816N4023'),(5596,'190816N4025'),(5597,'190816N4027'),(5598,'190816N4029'),(5599,'190816N4031'),(5600,'190816N4036'),(5601,'190816N4037'),(5602,'190816N4050'),(5603,'190816N4073'),(5604,'190816N4075'),(5605,'190816N4077'),(5606,'190816N4078'),(5607,'190816N4079'),(5608,'190816N4080'),(5609,'190816N4081'),(5610,'190816N4082'),(5611,'190816N4083'),(5612,'190816N4084'),(5613,'190816N4085'),(5614,'190816N4086'),(5615,'190816N4088'),(5616,'190816N4089'),(5617,'190816N4091'),(5618,'190816N4092'),(5619,'190816N4095'),(5620,'190816N4116'),(5621,'190816N4125'),(5622,'190816N4133'),(5623,'190816N4134'),(5624,'190816N4141'),(5625,'190816N4142'),(5626,'190816N4144'),(5627,'190816N4151'),(5628,'190816N4152'),(5629,'190816N4153'),(5630,'190816N4156'),(5631,'190816N4161'),(5632,'190816N4338'),(5633,'190816N4855'),(5634,'190816N9311'),(5635,'1908179215'),(5636,'1908179216'),(5637,'1908179218'),(5638,'1908179219'),(5639,'1908179220'),(5640,'1908179221'),(5641,'1908179222'),(5642,'1908179223'),(5643,'1908179224'),(5644,'1908179227'),(5645,'1908179230'),(5646,'1908179232'),(5647,'1908179233'),(5648,'1908179234'),(5649,'1908179237'),(5650,'1908179238'),(5651,'1908179239'),(5652,'1908179240'),(5653,'1908179241'),(5654,'1908179242'),(5655,'1908179243'),(5656,'1908179247'),(5657,'1908179248'),(5658,'1908179251'),(5659,'1908179253'),(5660,'1908179254'),(5661,'1908179256'),(5662,'1908179258'),(5663,'1908179259'),(5664,'1908179260'),(5665,'1908179263'),(5666,'1908179264'),(5667,'1908179268'),(5668,'1908179269'),(5669,'1908179270'),(5670,'1908179272'),(5671,'1908179275'),(5672,'1908179277'),(5673,'1908179278'),(5674,'1908179279'),(5675,'1908179282'),(5676,'1908179283'),(5677,'1908179285'),(5678,'1908179288'),(5679,'1908179289'),(5680,'1908179290'),(5681,'1908179291'),(5682,'1908179293'),(5683,'1908179296'),(5684,'1908179297'),(5685,'1908179301'),(5686,'190817N0395'),(5687,'190817N0499'),(5688,'190817N0518'),(5689,'190817N0556'),(5690,'190817N0580'),(5691,'190817N0581'),(5692,'190817N0582'),(5693,'190817N0584'),(5694,'190817N0588'),(5695,'190817N0593'),(5696,'190817N0595'),(5697,'190817N0596'),(5698,'190817N0598'),(5699,'190817N0599'),(5700,'190817N0600'),(5701,'190817N0601'),(5702,'190817N0602'),(5703,'190817N0604'),(5704,'190817N0605'),(5705,'190817N0781'),(5706,'190817N0783'),(5707,'190817N0784'),(5708,'190817N0785'),(5709,'190817N0792'),(5710,'190817N0796'),(5711,'190817N0799'),(5712,'190817N0800'),(5713,'190817N0801'),(5714,'190817N0803'),(5715,'190817N0809'),(5716,'190817N0815'),(5717,'190817N0816'),(5718,'190817N0817'),(5719,'190817N0822'),(5720,'190817N0823'),(5721,'190817N0824'),(5722,'190817N0828'),(5723,'190817N08AMUNA CABLE'),(5724,'190817N0931'),(5725,'190817N0933'),(5726,'190817N0934'),(5727,'190817N0941'),(5728,'190817N0942'),(5729,'190817N0944'),(5730,'190817N0949'),(5731,'190817N0952'),(5732,'190817N0958'),(5733,'190817N0959'),(5734,'190817N0961'),(5735,'190817N0962'),(5736,'190817N0967'),(5737,'190817N0970'),(5738,'190817N0972'),(5739,'190817N0973'),(5740,'190817N0981'),(5741,'190817N0985'),(5742,'190817N0987'),(5743,'190817N0988'),(5744,'190817N0989'),(5745,'190818N1650'),(5746,'190818N1660'),(5747,'190818N1667'),(5748,'190818N1679'),(5749,'190818N1680'),(5750,'190818N1681'),(5751,'190818N1683'),(5752,'190818N1684'),(5753,'190818N1685'),(5754,'190818N1687'),(5755,'190818N1688'),(5756,'190818N1689'),(5757,'190818N1690'),(5758,'190818N1691'),(5759,'190818N1692'),(5760,'190818N1693'),(5761,'190818N1694'),(5762,'190818N1695'),(5763,'190818N1699'),(5764,'190818N1707'),(5765,'190818N1713'),(5766,'190818N1719'),(5767,'190818N1720'),(5768,'190818N1723'),(5769,'190818N1724'),(5770,'190818N1725'),(5771,'190818N1726'),(5772,'190818N1727'),(5773,'190818N1728'),(5774,'190818N1729'),(5775,'190818N1733'),(5776,'190818N1734'),(5777,'190818N1735'),(5778,'190818N1737'),(5779,'190818N1738'),(5780,'190818N1804'),(5781,'190818N1807'),(5782,'190818N1812'),(5783,'190818N1817'),(5784,'190818N1822'),(5785,'190818N1825'),(5786,'190818SR0205'),(5787,'19081AMUNA CABLE'),(5788,'19081N4077'),(5789,'190916N0671'),(5790,'190916N2440'),(5791,'190916N3159'),(5792,'190916N4170'),(5793,'190916N4173'),(5794,'190916N4174'),(5795,'190916N4178'),(5796,'190916N4181'),(5797,'190916N4186'),(5798,'190916N4193'),(5799,'190916N4202'),(5800,'190916N4205'),(5801,'190916N4209'),(5802,'190916N4214'),(5803,'190916N4227'),(5804,'190916N4229'),(5805,'190916N4236'),(5806,'190916N4237'),(5807,'190916N4240'),(5808,'190916N4245'),(5809,'190916N4248'),(5810,'190916N4249'),(5811,'190916N4250'),(5812,'190916N4251'),(5813,'190916N4253'),(5814,'190916N4257'),(5815,'190916N4258'),(5816,'190916N4260'),(5817,'190916N4268'),(5818,'190916N4269'),(5819,'190916N4270'),(5820,'190916N4272'),(5821,'190916N4273'),(5822,'190916N4274'),(5823,'190916N4275'),(5824,'190916N4276'),(5825,'190916N4278'),(5826,'190916N4281'),(5827,'190916N4283'),(5828,'190916N4286'),(5829,'190916N4288'),(5830,'190916N4289'),(5831,'190916N4290'),(5832,'190916N4292'),(5833,'190916N4295'),(5834,'190916N4297'),(5835,'190916N4302'),(5836,'190916N4303'),(5837,'190916N4313'),(5838,'190916N4317'),(5839,'190916N4318'),(5840,'190916N4319'),(5841,'190916N4320'),(5842,'190916N4321'),(5843,'190916N4327'),(5844,'190916N4328'),(5845,'190916N4331'),(5846,'190916N4334'),(5847,'190916N4336'),(5848,'190916N4337'),(5849,'190916N4339'),(5850,'190916N4340'),(5851,'190916N4341'),(5852,'190916N4345'),(5853,'190916N4358'),(5854,'190916N4382'),(5855,'190916N4385'),(5856,'190916N4390'),(5857,'190916N4439'),(5858,'190916N4440'),(5859,'190916N4451'),(5860,'190916N4456'),(5861,'190916N4457'),(5862,'190916N4461'),(5863,'190916N4462'),(5864,'190916N4472'),(5865,'190916N4473'),(5866,'190916N4474'),(5867,'190916N4477'),(5868,'190916N4478'),(5869,'190916N4479'),(5870,'190916N4484'),(5871,'190916N4490'),(5872,'190916N4491'),(5873,'190916N4492'),(5874,'190916N4494'),(5875,'1909172288'),(5876,'1909179302'),(5877,'1909179303'),(5878,'1909179304'),(5879,'1909179305'),(5880,'1909179306'),(5881,'1909179307'),(5882,'1909179308'),(5883,'1909179310'),(5884,'1909179311'),(5885,'1909179312'),(5886,'1909179313'),(5887,'1909179314'),(5888,'1909179324'),(5889,'1909179327'),(5890,'1909179328'),(5891,'1909179331'),(5892,'1909179333'),(5893,'1909179334'),(5894,'1909179337'),(5895,'190917N0012'),(5896,'190917N1602'),(5897,'190917N1624'),(5898,'190917N1635'),(5899,'190917N1847'),(5900,'190917N1848'),(5901,'190917N1849'),(5902,'190917N1850'),(5903,'190917N1852'),(5904,'190917N1855'),(5905,'190917N1856'),(5906,'190917N1857'),(5907,'190917N1859'),(5908,'190917N1861'),(5909,'190917N1862'),(5910,'190917N1866'),(5911,'190917N1867'),(5912,'190917N1869'),(5913,'190917N1870'),(5914,'190917N1871'),(5915,'190917N1872'),(5916,'190917N1875'),(5917,'190917N1876'),(5918,'190917N1879'),(5919,'190917N1882'),(5920,'190917N1883'),(5921,'190917N1884'),(5922,'190917N1885'),(5923,'190917N1886'),(5924,'190917N1887'),(5925,'190917N1890'),(5926,'190917N1892'),(5927,'190917N1893'),(5928,'190917N1895'),(5929,'190917N1896'),(5930,'190917N1897'),(5931,'190917N1898'),(5932,'190917N1899'),(5933,'190917N1900'),(5934,'190917N1901'),(5935,'190917N1902'),(5936,'190917N1903'),(5937,'190917N1904'),(5938,'190917N1905'),(5939,'190917N1906'),(5940,'190917N1907'),(5941,'190917N1908'),(5942,'190917N1909'),(5943,'190917N1910'),(5944,'190917N1911'),(5945,'190917N1912'),(5946,'190917N1913'),(5947,'190917N1914'),(5948,'190917N1915'),(5949,'190917N1916'),(5950,'190917N1917'),(5951,'190917N1918'),(5952,'190917N1919'),(5953,'190917N1920'),(5954,'190917N1921'),(5955,'190917N1922'),(5956,'190917N1923'),(5957,'190917N1924'),(5958,'190917N1925'),(5959,'190917N1926'),(5960,'190917N1935'),(5961,'190917N1945'),(5962,'190917N1951'),(5963,'190917N2212'),(5964,'190917N2223'),(5965,'190917N2226'),(5966,'190917N2227'),(5967,'190917N2228'),(5968,'190917N2232'),(5969,'190917N2233'),(5970,'190917N2234'),(5971,'190917N2235'),(5972,'190917N2236'),(5973,'190917N2238'),(5974,'190917N2240'),(5975,'190917N2241'),(5976,'190917N2243'),(5977,'190917N2246'),(5978,'190917N2248'),(5979,'190917N2252'),(5980,'190917N2253'),(5981,'190917N2255'),(5982,'190917N2256'),(5983,'190917N2258'),(5984,'190917N2262'),(5985,'190917N2263'),(5986,'190917N2264'),(5987,'190917N2267'),(5988,'190917N2270'),(5989,'190917N2271'),(5990,'190917N2275'),(5991,'190917N2277'),(5992,'190917N2278'),(5993,'190917N2279'),(5994,'190917N2282'),(5995,'190917N2283'),(5996,'190917N2284'),(5997,'190917N2296'),(5998,'190917N2309'),(5999,'190917N2312'),(6000,'190917N2313'),(6001,'190917N2314'),(6002,'190917N2316'),(6003,'190917N2318'),(6004,'190917N2320'),(6005,'190917N2327'),(6006,'190917N2330'),(6007,'190917N2335'),(6008,'190917N2337'),(6009,'190917N2341'),(6010,'190917N2343'),(6011,'190917N2345'),(6012,'190917N2346'),(6013,'190917N2348'),(6014,'190917N2349'),(6015,'190917N2350'),(6016,'190917N2351'),(6017,'190917N2353'),(6018,'190917N2354'),(6019,'190917N2356'),(6020,'190917N2358'),(6021,'190917N2360'),(6022,'190917N2361'),(6023,'190917N2362'),(6024,'190917N2363'),(6025,'190917N2365'),(6026,'190917N2366'),(6027,'190917N2367'),(6028,'190917N2373'),(6029,'190917N2374'),(6030,'190917N2375'),(6031,'190917N2378'),(6032,'190917N2379'),(6033,'190917N2384'),(6034,'190917N2385'),(6035,'190917N2393'),(6036,'190917N2394'),(6037,'190917N2395'),(6038,'190917N3298'),(6039,'190917N3651'),(6040,'190917N3652'),(6041,'190917N3653'),(6042,'190917N3656'),(6043,'190917N3657'),(6044,'190917N3658'),(6045,'190917N3659'),(6046,'190917N3660'),(6047,'190917N3662'),(6048,'190917N3663'),(6049,'190917N3666'),(6050,'190917N3668'),(6051,'190917N3669'),(6052,'190917N3671'),(6053,'190917N3675'),(6054,'190917N3676'),(6055,'190917N3677'),(6056,'190917N3679'),(6057,'190917N3680'),(6058,'190917N3681'),(6059,'190917N3682'),(6060,'190917N3683'),(6061,'190917N3685'),(6062,'190917N3687'),(6063,'190917N3689'),(6064,'190917N3690'),(6065,'190917N3691'),(6066,'190917N3694'),(6067,'190917N3695'),(6068,'190917N3698'),(6069,'190917N3901'),(6070,'190917N3902'),(6071,'190917N3908'),(6072,'190917N3914'),(6073,'190917N3916'),(6074,'190917N3917'),(6075,'190917N3918'),(6076,'190917N3920'),(6077,'190917N3921'),(6078,'190917N3923'),(6079,'190918N1828'),(6080,'190918N1829'),(6081,'190918N1832'),(6082,'190918N1833'),(6083,'190918N1834'),(6084,'190918N1836'),(6085,'190918N1837'),(6086,'190918N1838'),(6087,'190918N1840'),(6088,'190918N1841'),(6089,'190918N1842'),(6090,'190918SR0011'),(6091,'190918SR0054'),(6092,'191016N4549'),(6093,'191016N4554'),(6094,'191016N4561'),(6095,'191016N4564'),(6096,'191016N4568'),(6097,'191016N4571'),(6098,'191016N4574'),(6099,'191016N4579'),(6100,'191016N4580'),(6101,'191016N4588'),(6102,'191016N4590'),(6103,'191016N4591'),(6104,'191016N4592'),(6105,'191016N4599'),(6106,'191016N4600'),(6107,'191016N4605'),(6108,'191016N4606'),(6109,'191016N4611'),(6110,'191016N4614'),(6111,'191016N4619'),(6112,'191016N4624'),(6113,'191016N4643'),(6114,'191016N4664'),(6115,'191016N4677'),(6116,'191016N4702'),(6117,'191016N4715'),(6118,'191016N6732'),(6119,'191017N0006'),(6120,'191017N0008'),(6121,'191017N0009'),(6122,'191017N0010'),(6123,'191017N0014'),(6124,'191017N0015'),(6125,'191017N0017'),(6126,'191017N0019'),(6127,'191017N0020'),(6128,'191017N0021'),(6129,'191017N0023'),(6130,'191017N0024'),(6131,'191018SR0005'),(6132,'191018SR0045'),(6133,'191018SR0096'),(6134,'191018SR0097'),(6135,'191018SR0098'),(6136,'191018SR0101'),(6137,'191018SR0103'),(6138,'191018SR0104'),(6139,'191018SR0105'),(6140,'1910SR0440'),(6141,'1911166783'),(6142,'1911166784'),(6143,'1911166787'),(6144,'1911166789'),(6145,'1911166797'),(6146,'1911166804'),(6147,'1911166805'),(6148,'1911166812'),(6149,'1911166813'),(6150,'1911166816'),(6151,'1911166819'),(6152,'1911166820'),(6153,'1911166821'),(6154,'1911166825'),(6155,'1911166843'),(6156,'1911166845'),(6157,'1911166849'),(6158,'1911166850'),(6159,'1911166856'),(6160,'1911166858'),(6161,'1911166862'),(6162,'1911166863'),(6163,'1911166867'),(6164,'1911166869'),(6165,'1911166870'),(6166,'1911166872'),(6167,'1911166877'),(6168,'1911166878'),(6169,'1911166885'),(6170,'1911166886'),(6171,'1911166892'),(6172,'1911166893'),(6173,'1911166894'),(6174,'1911166896'),(6175,'1911166905'),(6176,'191116N4720'),(6177,'191116N4721'),(6178,'191116N4723'),(6179,'191116N4724'),(6180,'191116N4725'),(6181,'191116N4732'),(6182,'191116N4735'),(6183,'191116N4739'),(6184,'191116N4742'),(6185,'191116N4746'),(6186,'191116N4747'),(6187,'191116N4751'),(6188,'191116N4757'),(6189,'191116N4758'),(6190,'191116N4762'),(6191,'191116N4763'),(6192,'191116N4764'),(6193,'191116N4770'),(6194,'191116N4772'),(6195,'191116N4773'),(6196,'191116N4774'),(6197,'191116N4776'),(6198,'191116N4777'),(6199,'191116N4778'),(6200,'191116N4780'),(6201,'191116N4782'),(6202,'191116N4783'),(6203,'191116N4785'),(6204,'191116N4790'),(6205,'191116N4791'),(6206,'191116N4798'),(6207,'191116N4799'),(6208,'191116N4800'),(6209,'191116N4803'),(6210,'191116N4804'),(6211,'191116N4806'),(6212,'191116N4810'),(6213,'191116N4813'),(6214,'191116N4814'),(6215,'191116N4818'),(6216,'191116N4827'),(6217,'191116N4832'),(6218,'191116N4850'),(6219,'191116N4853'),(6220,'191116N4854'),(6221,'191116N4858'),(6222,'191116N4859'),(6223,'191116N4864'),(6224,'191116N4865'),(6225,'191116N4869'),(6226,'191116N4873'),(6227,'191116N4891'),(6228,'191116N4900'),(6229,'191116N4901'),(6230,'191116N4902'),(6231,'191116N4903'),(6232,'191116N4904'),(6233,'191116N4911'),(6234,'191116N4916'),(6235,'191116N4919'),(6236,'191116N4925'),(6237,'191116N4931'),(6238,'191116N4933'),(6239,'191116N4934'),(6240,'191116N4936'),(6241,'191116N5335'),(6242,'191116N5338'),(6243,'191116N5341'),(6244,'191116N5344'),(6245,'191116N5346'),(6246,'191116N5347'),(6247,'191116N5349'),(6248,'191116N5350'),(6249,'191116N5353'),(6250,'191116N5358'),(6251,'191116N5374'),(6252,'191116N5380'),(6253,'191116N5393'),(6254,'191116N5403'),(6255,'191116N5435'),(6256,'191116N5450'),(6257,'191116N5451'),(6258,'191117N12172'),(6259,'191117N12176'),(6260,'191117N12484'),(6261,'191117N12485'),(6262,'191117N12491'),(6263,'191117N12495'),(6264,'191117N12497'),(6265,'191117N12500'),(6266,'191117N12501'),(6267,'191117N15464'),(6268,'191117N15466'),(6269,'191117N15467'),(6270,'191117N15468'),(6271,'191117N15469'),(6272,'191117N15474'),(6273,'191117N15475'),(6274,'191117N15476'),(6275,'191117N15477'),(6276,'191117N15478'),(6277,'191117N15480'),(6278,'191117N15483'),(6279,'191117N15529'),(6280,'191117N15531'),(6281,'191118SR0109'),(6282,'191118SR0110'),(6283,'191119N4880'),(6284,'1911216N5737'),(6285,'191166846'),(6286,'19116N4784'),(6287,'191215N0010'),(6288,'191215N0012'),(6289,'191215N0013'),(6290,'191215N0015'),(6291,'191215N0019'),(6292,'191215N0023'),(6293,'191215N0024'),(6294,'191215N0028'),(6295,'191215N0034'),(6296,'191215N0035'),(6297,'191215N0036'),(6298,'191215N0048'),(6299,'191215N0050'),(6300,'191215N0052'),(6301,'191215N0062'),(6302,'191215N0072'),(6303,'191215N0074'),(6304,'191215N0077'),(6305,'191215N0084'),(6306,'191215N0091'),(6307,'191215N0093'),(6308,'191215N0094'),(6309,'191215N0099'),(6310,'191215N0105'),(6311,'191215N0106'),(6312,'191215N0107'),(6313,'191215N0108'),(6314,'191215N0109'),(6315,'191215N0110'),(6316,'191215N0113'),(6317,'191215N0115'),(6318,'191215N0116'),(6319,'191215N0118'),(6320,'191215N0120'),(6321,'191215N0126'),(6322,'191215N0130'),(6323,'191215N0131'),(6324,'191215N0132'),(6325,'191215N0136'),(6326,'191215N0137'),(6327,'191215N0140'),(6328,'191215N0145'),(6329,'191215N0151'),(6330,'191215N0154'),(6331,'191215N0158'),(6332,'191215N0161'),(6333,'191215N0163'),(6334,'191215N0164'),(6335,'191215N0175'),(6336,'191215N0176'),(6337,'191215N0177'),(6338,'191215N0179'),(6339,'191215N0181'),(6340,'191215N0184'),(6341,'191215N0190'),(6342,'191215N0192'),(6343,'191215N0197'),(6344,'191215N0200'),(6345,'191215N0212'),(6346,'191215N0214'),(6347,'191215N0216'),(6348,'191215N0220'),(6349,'191215N0221'),(6350,'191215N0224'),(6351,'191215N0225'),(6352,'191215N0227'),(6353,'191215N0234'),(6354,'191215N0237'),(6355,'191215N0240'),(6356,'191215N0259'),(6357,'191215N0260'),(6358,'191215N0263'),(6359,'191215N0270'),(6360,'191215N0276'),(6361,'191215N0282'),(6362,'191215N0283'),(6363,'191215N0288'),(6364,'191215N0289'),(6365,'191215N0291'),(6366,'191215N0292'),(6367,'191215N0296'),(6368,'191215N0297'),(6369,'191215N0310'),(6370,'191215N221'),(6371,'191215N4573'),(6372,'191215S0002'),(6373,'1912166070'),(6374,'1912167019'),(6375,'1912167020'),(6376,'1912167032'),(6377,'1912167035'),(6378,'1912167037'),(6379,'1912167038'),(6380,'1912167039'),(6381,'1912167041'),(6382,'1912167043'),(6383,'1912167044'),(6384,'1912167045'),(6385,'1912167046'),(6386,'1912167047'),(6387,'1912167048'),(6388,'1912167049'),(6389,'1912167052'),(6390,'1912167053'),(6391,'1912167055'),(6392,'1912167057'),(6393,'1912167058'),(6394,'1912167059'),(6395,'1912167061'),(6396,'1912167063'),(6397,'1912167065'),(6398,'1912167066'),(6399,'1912167067'),(6400,'1912167071'),(6401,'1912167073'),(6402,'1912167074'),(6403,'1912167075'),(6404,'1912167076'),(6405,'1912167078'),(6406,'1912167079'),(6407,'1912167081'),(6408,'1912167082'),(6409,'1912167084'),(6410,'1912167086'),(6411,'1912167087'),(6412,'1912167089'),(6413,'1912167119'),(6414,'1912167122'),(6415,'1912167123'),(6416,'1912167130'),(6417,'1912167133'),(6418,'1912167134'),(6419,'1912167135'),(6420,'1912167136'),(6421,'1912167137'),(6422,'1912167138'),(6423,'1912167139'),(6424,'1912167140'),(6425,'1912167141'),(6426,'1912167142'),(6427,'191216N      6053'),(6428,'191216N0001'),(6429,'191216N0004'),(6430,'191216N5582'),(6431,'191216N5587'),(6432,'191216N5589'),(6433,'191216N5591'),(6434,'191216N5592'),(6435,'191216N5593'),(6436,'191216N5594'),(6437,'191216N5597'),(6438,'191216N5600'),(6439,'191216N5601'),(6440,'191216N5602'),(6441,'191216N56030'),(6442,'191216N5607'),(6443,'191216N5611'),(6444,'191216N5616'),(6445,'191216N5617'),(6446,'191216N5621'),(6447,'191216N5622'),(6448,'191216N5625'),(6449,'191216N5626'),(6450,'191216N5631'),(6451,'191216N5633'),(6452,'191216N5643'),(6453,'191216N5648'),(6454,'191216N5649'),(6455,'191216N5651'),(6456,'191216N5655'),(6457,'191216N5657'),(6458,'191216N5658'),(6459,'191216N5661'),(6460,'191216N5666'),(6461,'191216N5668'),(6462,'191216N5669'),(6463,'191216N5670'),(6464,'191216N5671'),(6465,'191216N5672'),(6466,'191216N5675'),(6467,'191216N5676'),(6468,'191216N5678'),(6469,'191216N5680'),(6470,'191216N5681'),(6471,'191216N5682'),(6472,'191216N5683'),(6473,'191216N5685'),(6474,'191216N5686'),(6475,'191216N5687'),(6476,'191216N5688'),(6477,'191216N5689'),(6478,'191216N5690'),(6479,'191216N5691'),(6480,'191216N5692'),(6481,'191216N5693'),(6482,'191216N5694'),(6483,'191216N5695'),(6484,'191216N5699'),(6485,'191216N5701'),(6486,'191216N5703'),(6487,'191216N5705'),(6488,'191216N5706'),(6489,'191216N5708'),(6490,'191216N5709'),(6491,'191216N5710'),(6492,'191216N5711'),(6493,'191216N5712'),(6494,'191216N5713'),(6495,'191216N5714'),(6496,'191216N5718'),(6497,'191216N5719'),(6498,'191216N5720'),(6499,'191216N5723'),(6500,'191216N5724'),(6501,'191216N5725'),(6502,'191216N5726'),(6503,'191216N5727'),(6504,'191216N5728'),(6505,'191216N5729'),(6506,'191216N5731'),(6507,'191216N5734'),(6508,'191216N5736'),(6509,'191216N5738'),(6510,'191216N5746'),(6511,'191216N5748'),(6512,'191216N5750'),(6513,'191216N5751'),(6514,'191216N5752'),(6515,'191216N5756'),(6516,'191216N5758'),(6517,'191216N5759'),(6518,'191216N5760'),(6519,'191216N5762'),(6520,'191216N5763'),(6521,'191216N5768'),(6522,'191216N5772'),(6523,'191216N5774'),(6524,'191216N5776'),(6525,'191216N5781'),(6526,'191216N5783'),(6527,'191216N5785'),(6528,'191216N5788'),(6529,'191216N5791'),(6530,'191216N5793'),(6531,'191216N5797'),(6532,'191216N5799'),(6533,'191216N5800'),(6534,'191216N5809'),(6535,'191216N5810'),(6536,'191216N5812'),(6537,'191216N5816'),(6538,'191216N5818'),(6539,'191216N5823'),(6540,'191216N5827'),(6541,'191216N6065'),(6542,'191216N6073'),(6543,'191216N6074'),(6544,'191216N6076'),(6545,'191216N6079'),(6546,'191216N6106'),(6547,'191216N6135'),(6548,'191216N6140'),(6549,'191216N6146'),(6550,'191216N6154'),(6551,'191216N6156'),(6552,'191216N6175'),(6553,'191216N6179'),(6554,'191216N6190'),(6555,'191216N6199'),(6556,'1912179795'),(6557,'1912179797'),(6558,'1912179800'),(6559,'1912179802'),(6560,'1912179803'),(6561,'1912179804'),(6562,'1912179805'),(6563,'1912179806'),(6564,'1912179808'),(6565,'1912179810'),(6566,'1912179811'),(6567,'1912179815'),(6568,'1912179816'),(6569,'1912179821'),(6570,'1912179823'),(6571,'1912179826'),(6572,'1912179827'),(6573,'1912179829'),(6574,'1912179832'),(6575,'191217N17116'),(6576,'191217N17117'),(6577,'191217N17119'),(6578,'191217N17120'),(6579,'191217N17122'),(6580,'191217N17123'),(6581,'191217N17125'),(6582,'191217N17126'),(6583,'191217N17135'),(6584,'191217N17141'),(6585,'191217N17145'),(6586,'191217N17147'),(6587,'191217N17150'),(6588,'191217N17152'),(6589,'191217N17155'),(6590,'191217N17157'),(6591,'191217N17160'),(6592,'191217N17162'),(6593,'191217N17164'),(6594,'191217N17166'),(6595,'191217N17167'),(6596,'191217N17172'),(6597,'191217N17175'),(6598,'191217N17179'),(6599,'191217N17181'),(6600,'191217N17183'),(6601,'191217N17189'),(6602,'191217N17190'),(6603,'191217N17192'),(6604,'191217N17193'),(6605,'191217N17195'),(6606,'191217N17196'),(6607,'191217N17197'),(6608,'191217N17198'),(6609,'191217N17200'),(6610,'191217N17201'),(6611,'191217N17204'),(6612,'191217N17206'),(6613,'191217N17207'),(6614,'191217N17208'),(6615,'191217N17209'),(6616,'191217N17211'),(6617,'191217N17213'),(6618,'191217N1741'),(6619,'191217N22590'),(6620,'191217N22592'),(6621,'191217N22596'),(6622,'191217N22598'),(6623,'191217N22600'),(6624,'191217N22605'),(6625,'191217N22612'),(6626,'191217N22614'),(6627,'191217N22616'),(6628,'191217N22617'),(6629,'191217N22618'),(6630,'191217N22620'),(6631,'191217N22651'),(6632,'191217N22654'),(6633,'191217N22658'),(6634,'191217N22659'),(6635,'191217N22663'),(6636,'191217N22666'),(6637,'191217N22668'),(6638,'191217N22670'),(6639,'191217N22673'),(6640,'191217N22677'),(6641,'191217N22678'),(6642,'191217N22679'),(6643,'191217N22682'),(6644,'191217N22683'),(6645,'191217N22686'),(6646,'191217N22694'),(6647,'191217N22697'),(6648,'191217N22702'),(6649,'191217N22703'),(6650,'191217N22705'),(6651,'191217N22706'),(6652,'191217N22709'),(6653,'191217N22711'),(6654,'191217N22714'),(6655,'191217N22720'),(6656,'191217N22721'),(6657,'191217N22723'),(6658,'191217N22724'),(6659,'191217N23596'),(6660,'191217N23600'),(6661,'191217N7318'),(6662,'19125N0232'),(6663,'19126N5627'),(6664,'191917N1895'),(6665,'19518N0529'),(6666,'19616N2141'),(6667,'198016N3924'),(6668,'280116373'),(6669,'280717SR0004'),(6670,'280717SR0007'),(6671,'9 9179329'),(6672,'91116N4805'),(6673,'??1216N5771'),(6674,'????FRD2035'),(6675,'????FRD4088'),(6676,'D160509640'),(6677,'D18010705'),(6678,'D18030624'),(6679,'D18032306'),(6680,'D18070914'),(6681,'FRD2035'),(6682,'FRD2076'),(6683,'FRD209B'),(6684,'REP6123'),(6685,'SR1512N201701'),(6686,'ŸŸŸŸFRD4076');
/*!40000 ALTER TABLE `temp_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tribandsystemhumpcount`
--

DROP TABLE IF EXISTS `tribandsystemhumpcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tribandsystemhumpcount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HUMPNUMBER1` int(1) NOT NULL DEFAULT '0',
  `HUMPNUMBER2` int(1) NOT NULL DEFAULT '0',
  `HUMPNUMBER3` int(1) NOT NULL DEFAULT '0',
  `HUMPNUMBER4` int(1) NOT NULL DEFAULT '0',
  `REPID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `REPID` (`REPID`),
  CONSTRAINT `tribandsystemhumpcount_ibfk_1` FOREIGN KEY (`REPID`) REFERENCES `repeaterdata` (`RepId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tribandsystemhumpcount`
--

LOCK TABLES `tribandsystemhumpcount` WRITE;
/*!40000 ALTER TABLE `tribandsystemhumpcount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tribandsystemhumpcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umtsalarmtable`
--

DROP TABLE IF EXISTS `umtsalarmtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `umtsalarmtable` (
  `umtsrepeaterId` int(11) NOT NULL,
  `umtsrepeaterSerialNo` varchar(45) DEFAULT NULL,
  `umtsSynthesizerFailDl` varchar(45) DEFAULT NULL,
  `umtsSynthesizerFailUl` varchar(45) DEFAULT NULL,
  `umtsPwrUl` varchar(45) DEFAULT NULL,
  `umtsPwrDl` varchar(45) DEFAULT NULL,
  `umtselectricity` varchar(45) DEFAULT NULL,
  `umtsseverity` int(11) DEFAULT NULL,
  `umtsAlarmText` int(11) DEFAULT NULL,
  `umtsconnected` int(11) DEFAULT NULL,
  `umtstime` timestamp NULL DEFAULT NULL,
  `umtsrowstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`umtsrepeaterId`),
  UNIQUE KEY `umtsalarmTablecol_UNIQUE` (`umtsrepeaterSerialNo`),
  CONSTRAINT `umtsrepeaterId` FOREIGN KEY (`umtsrepeaterId`) REFERENCES `repeaterdata` (`RepId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umtsalarmtable`
--

LOCK TABLES `umtsalarmtable` WRITE;
/*!40000 ALTER TABLE `umtsalarmtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `umtsalarmtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetails`
--

DROP TABLE IF EXISTS `userdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userdetails` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` int(11) DEFAULT NULL,
  `UserName` varchar(45) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `EmailId` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `Comment` varchar(250) DEFAULT NULL,
  `LoginError` int(11) DEFAULT NULL,
  `AssignedRegion` varchar(50) DEFAULT NULL,
  `SMSNotification` tinyint(4) DEFAULT NULL,
  `EmailNotification` tinyint(4) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`UserName`),
  UNIQUE KEY `UserId_UNIQUE` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetails`
--

LOCK TABLES `userdetails` WRITE;
/*!40000 ALTER TABLE `userdetails` DISABLE KEYS */;
INSERT INTO `userdetails` VALUES (18,6,'CMLVL1','$2a$10$4EGVzjnfj/sdE5pQUMr1O.3TP5zNMMacf6RdPUb0AwGg1ts57qBQS',NULL,'','',0,NULL,0,0,49),(14,5,'Dhiraj_Marathe','$2a$10$mLAWTioOzYfHXm9ZM85CI.aQLh4GYtuTBV8TdFQZJGDUewHKk0Z7m',NULL,'','',0,'Mumbai',0,0,49),(17,6,'FMLVL1','$2a$10$w76T7j9iG6gWdnfVrQsF4eVjjQq/K..UyDLS90R0io4COkAha316i',NULL,'','',0,NULL,0,0,49),(10,5,'gujaratcircleadmin@vodafrog.com','$2a$10$sDeK76mV1I4YnqC8OPHFAeUFGx4yDi3k9QgU0npZlzwBzY.vimobO','shashanka@frogcellsat.com','','',0,'Gujarat',0,0,49),(9,5,'haryanacircleadmin@vodafrog.com','$2a$10$D2E8GoK9.cgfhl3vY0s02.mSKxdTjlth8GSSm8gNAlFM63BLl/OdS',NULL,'','',0,'Haryana',0,0,49),(12,5,'karnatakacircleadmin@vodafrog.com','$2a$10$ZPlkhDb8J/.I7TX3JVVNeugKEZi.e7CpsfqL3JBI9Pqj8U85Otzza',NULL,'','',0,'Karnataka',0,0,49),(6,5,'magcircleadmin@vodafrog.com','$2a$10$6dYRwuQ8AkpK7dwWm1qVSOQkTYVbr0AFDvgj20RYn/T2d63g5aVbe','','','This user is admin of MAG circle.',0,'Maharashtra',0,0,49),(13,6,'mumbai@vodafoneidea.com','$2a$10$aGmfoZuHCYXqyOkk159Lxehi8OjhJ3tH9Ole0q5w3kgs9UmFpHIoq','','9820018708','Mumbai Circle User',0,'Mumbai',0,0,49),(7,5,'mumbaicircleadmin@vodafrog.com','$2a$10$nCTGzU1fdsOzgkw1T3HRTup9oXFkFa.eYVnoDi0JUkqCW3nEqn7xW',NULL,'','',0,'Mumbai',0,0,49),(15,5,'Pranat','$2a$10$p0UMkIf0tGxtKrQdIJQuK.bO65pUHtAnGBpqgyGCiqIio16WMyw3i',NULL,'','',0,'Mumbai',0,0,49),(11,5,'punjabcircleadmin@vodafrog.com','$2a$10$3p6kX.ys4dLn9pk3NHsdoOxgm7JjyyTlsYD1CytKhyUiW.uUYkzUS',NULL,'','',0,'Punjab',0,0,49),(8,5,'rajasthancircleadmin@vodafrog.com','$2a$10$ERKur9uixprJTufsC8KRYOx9ZEGedia316G0H2aMt4n7DSHRR1zfy',NULL,'','',0,'Rajasthan',0,0,49),(16,6,'raj_frogcell','$2a$10$QgDWuWL/cbMT.Pzu5vMpAe.b5kyQ77Tks/zJWDCOSDX/AoqAbUARm','','9828096855','',0,'Rajasthan',0,0,49),(5,4,'snoc@vodafrog.com','$2a$10$fn16d1iIdWNJDY7cx2K6L.1v.eerBgbDfYZ4dwLvKsING1RNAm946','shashanka@frogcellsat.com','(750) 946-7616','all',0,'All',NULL,NULL,1),(19,4,'test@frogcellsat.com','$2a$10$OG9SECopxfhyq89ULsyZMupOqKkNvHP3yvgUYfDM2FXaaEe0/wo.C','veerpalsingh1993@gmail.com','','',0,'All',0,0,49);
/*!40000 ALTER TABLE `userdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userrole` (
  `RoleId` int(11) DEFAULT NULL,
  `RoleName` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  KEY `username_fk_idx` (`username`),
  CONSTRAINT `username_fk` FOREIGN KEY (`username`) REFERENCES `userdetails` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (4,'ROLE_ADMIN','snoc@vodafrog.com'),(5,'ROLE_ADMIN','magcircleadmin@vodafrog.com'),(5,'ROLE_ADMIN','mumbaicircleadmin@vodafrog.com'),(5,'ROLE_ADMIN','rajasthancircleadmin@vodafrog.com'),(5,'ROLE_ADMIN','haryanacircleadmin@vodafrog.com'),(5,'ROLE_ADMIN','gujaratcircleadmin@vodafrog.com'),(5,'ROLE_ADMIN','punjabcircleadmin@vodafrog.com'),(5,'ROLE_ADMIN','karnatakacircleadmin@vodafrog.com'),(6,'ROLE_USER','mumbai@vodafoneidea.com'),(5,'ROLE_ADMIN','Dhiraj_Marathe'),(5,'ROLE_ADMIN','Pranat'),(6,'ROLE_USER','raj_frogcell'),(6,'ROLE_USER','FMLVL1'),(6,'ROLE_USER','CMLVL1'),(5,'ROLE_ADMIN','test@frogcellsat.com');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nms'
--

--
-- Dumping routines for database 'nms'
--
/*!50003 DROP PROCEDURE IF EXISTS `checkData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkData`(in in_serialNumber varchar(20),OUT out_count int)
BEGIN
SELECT count(*) into out_count FROM t_humpdata where t_humpdata.SerialNumber=in_serialNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAlarmData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAlarmData`(IN serialNumber varchar(20), IN bandName varchar(20), OUT out_PowerFailDL varchar(5), OUT out_PowerFailUL varchar(5), OUT out_SynthesizerFailDL varchar(5), OUT out_SynthesizerFailUL varchar(5))
BEGIN
select alarmdata.PowerFailDL, alarmdata.PowerFailUL, alarmdata.SynthesizerFailDL, alarmdata.SynthesizerFailUL into out_PowerFailDL, out_PowerFailUL, out_SynthesizerFailDL, out_SynthesizerFailUL from nms.alarmdata where alarmdata.SerialNumber = serialNumber and alarmdata.BandName = bandName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboard_last_two_hours_alarms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboard_last_two_hours_alarms`()
BEGIN
select alarmdata.AlarmId, alarmdata.SerialNumber, alarmdata.BandName, alarmdata.SynthesizerFailDL, alarmdata.SynthesizerFailUL, alarmdata.PowerFailDL, alarmdata.PowerFailUL, alarmdata.AlarmTimeStamp, repeaterdata.RegionName, repeaterdata.RepName, repeaterdata.ConnectionStatus, repeaterdata.ElectricityStatus  from alarmdata inner join repeaterdata on alarmdata.SerialNumber = repeaterdata.SerialNumber   where alarmdata.AlarmTimeStamp>date_sub(NOW(), INTERVAL 2 HOUR) and (alarmdata.SynthesizerFailDL='1' or alarmdata.SynthesizerFailUL='1' or alarmdata.PowerFailDL='1' or alarmdata.PowerFailUL='1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboard_last_two_hours_by_region` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboard_last_two_hours_by_region`(IN regionName varchar(50))
BEGIN
select alarmdata.AlarmId, alarmdata.SerialNumber, alarmdata.BandName, alarmdata.SynthesizerFailDL, alarmdata.SynthesizerFailUL, alarmdata.PowerFailDL, alarmdata.PowerFailUL, alarmdata.AlarmTimeStamp, repeaterdata.RegionName, repeaterdata.RepName, repeaterdata.ConnectionStatus, repeaterdata.ElectricityStatus  from alarmdata inner join repeaterdata on alarmdata.SerialNumber = repeaterdata.SerialNumber   where alarmdata.AlarmTimeStamp>date_sub(NOW(), INTERVAL 2 HOUR) and repeaterdata.regionname=regionName and (alarmdata.SynthesizerFailDL='1' or alarmdata.SynthesizerFailUL='1' or alarmdata.PowerFailDL='1' or alarmdata.PowerFailUL='1');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInventory`()
BEGIN
#SELECT repeaterdata.RepId, repeaterdata.RepName, repeaterdata.StreetName,repeaterdata.State,repeaterdata.Country,repeaterdata.ContactName,repeaterdata.ContactNumber,repeaterdata.RegionName,repeaterdata.City,repeaterdata.SerialNumber,repeaterdata.RepPartNumber,repeaterdata.ConnectionStatus,banddata.BandName,banddata.TotalHumpCount,banddata.GainDL,banddata.GainUL,banddata.PowerOutDL,banddata.PowerOutUL,banddata.StartChannel,banddata.StopChannel,humpdata.HumpId,humpdata.StartChannel as HumpStartChannel,humpdata.StopChannel as HumpStopChannel FROM ((repeaterdata INNER JOIN banddata ON repeaterdata.SerialNumber = banddata.SerialNumber ) Inner join humpdata on repeaterdata.SerialNumber=humpdata.SerialNumber and banddata.BandName=humpdata.BandName) order by repeaterdata.SerialNumber asc ;
SELECT repeaterdata.RepId, repeaterdata.RepName, repeaterdata.StreetName,repeaterdata.State,repeaterdata.Country,repeaterdata.ContactName,repeaterdata.ContactNumber,repeaterdata.RegionName,repeaterdata.City,repeaterdata.SerialNumber,repeaterdata.RepPartNumber,repeaterdata.ConnectionStatus,banddata.BandName,banddata.TotalHumpCount,banddata.GainDL,banddata.GainUL,banddata.PowerOutDL,banddata.PowerOutUL,banddata.StartChannel,banddata.StopChannel,humpdata.HumpId,humpdata.StartChannel as HumpStartChannel,humpdata.StopChannel as HumpStopChannel FROM ((repeaterdata left JOIN banddata ON repeaterdata.SerialNumber = banddata.SerialNumber ) left join humpdata on repeaterdata.SerialNumber=humpdata.SerialNumber and banddata.BandName=humpdata.BandName) order by repeaterdata.SerialNumber asc ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRepeaterByRegion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRepeaterByRegion`(IN regionName varchar(50))
BEGIN
select repeaterdata.SerialNumber,banddata.FirmwareVersion,repeaterdata.RepName,repeaterdata.City,repeaterdata.regionname,repeaterdata.connectionstatus from nms.repeaterdata inner join nms.banddata on repeaterData.SerialNumber=banddata.SerialNumber where repeaterdata.regionname=regionName and repeaterdata.connectionStatus='true' and (banddata.BandName='GSM' or banddata.BandName='DCS1' or banddata.BandName='UMTS') group by serialNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRepeaterData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRepeaterData`(IN serialNumber varchar(20), OUT out_electricity_State varchar(5), OUT out_region_name varchar(20), OUT out_rep_name varchar(20), OUT out_connection_status varchar(5))
BEGIN
select repeaterdata.regionname, repeaterdata.repname, repeaterdata.connectionstatus, repeaterdata.electricitystatus into out_region_name, out_rep_name, out_connection_status, out_electricity_State from nms.repeaterdata where repeaterdata.serialnumber = serialNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRepId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRepId`(IN in_serialNumber varchar(20), OUT out_repid int)
BEGIN
SELECT repeaterdata.repid into out_repid FROM repeaterdata where repeaterdata.SerialNumber=in_serialNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRouBandData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRouBandData`(IN rouSerialNumber varchar(45))
BEGIN
SELECT * FROM rouband WHERE SerialNumber =rouSerialNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRouByMouSerialNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRouByMouSerialNumber`(IN MouSerialNumber varchar(50))
BEGIN
SELECT * FROM rou,systemdetails  WHERE rou.RouSerialNumber = systemdetails.SerialNumber AND  rou.MouSerialNumber = MouSerialNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateConnectionStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateConnectionStatus`(in in_connection_status varchar(5), in in_current_time varchar(50), in in_serialNumber varchar(20))
BEGIN
update repeaterdata set ConnectionStatus=in_connection_status, RepTimeStamp=in_current_time where SerialNumber=in_serialNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateHealth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateHealth`(IN in_serialNumber varchar(20), IN in_electricity varchar(5), IN in_current_time varchar(50),OUT out_update_ack boolean)
BEGIN
if exists (select * from repeaterdata where serialnumber = in_serialNumber)
	then
		begin
			update repeaterdata set ElectricityStatus=in_electricity,RepTimeStamp=in_current_time where serialnumber = in_serialNumber;
            set out_update_ack =1;
        end;
        
	else
        begin
        set out_update_ack =0;
        end;
end if;
select out_update_ack;        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateRepLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateRepLocation`(IN in_serialNumber varchar(20), IN in_street_name varchar(200),IN in_city varchar(45), IN in_state varchar(45),
IN in_country varchar(45), IN in_latitude varchar(45), IN in_longitude varchar(45), IN in_contact_name varchar(45), IN in_contact_number varchar(10))
BEGIN
update repeaterdata set StreetName=in_street_name, City=in_city, State=in_state, Country=in_country, 
Latitude=in_latitude, Longitude=in_longitude, ContactName=in_contact_name, ContactNumber=in_contact_number
where SerialNumber=in_serialNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateTriBandConnectionStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTriBandConnectionStatus`(in in_connection_status varchar(5), in in_current_time varchar(50), in in_serialNumber varchar(20))
BEGIN
update t_systemdetail set ConnectionStatus=in_connection_status, TimeStamp=in_current_time where serialNumber=in_serialNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `alarmcount`
--

/*!50001 DROP VIEW IF EXISTS `alarmcount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alarmcount` AS select 1 AS `AlarmId`,1 AS `SerialNumber`,1 AS `BandName`,1 AS `SynthesizerFailDL`,1 AS `SynthesizerFailUL`,1 AS `PowerFailDL`,1 AS `PowerFailUL`,1 AS `AlarmTimeStamp`,1 AS `RegionName`,1 AS `RepName`,1 AS `ConnectionStatus`,1 AS `ElectricityStatus` */;
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

-- Dump completed on 2022-07-12 12:03:44
