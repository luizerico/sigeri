-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sigeri
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb8u1

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
-- Table structure for table `ComplianceType`
--

DROP TABLE IF EXISTS `ComplianceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ComplianceType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComplianceType`
--

LOCK TABLES `ComplianceType` WRITE;
/*!40000 ALTER TABLE `ComplianceType` DISABLE KEYS */;
INSERT INTO `ComplianceType` VALUES (1,'Governance'),(2,'Security');
/*!40000 ALTER TABLE `ComplianceType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2AF5A5CC54C8C93` (`type_id`),
  KEY `IDX_2AF5A5CF65B3645` (`analyst_id`),
  KEY `IDX_2AF5A5CF8BD700D` (`unit_id`),
  KEY `IDX_2AF5A5CF920BBA2` (`value_id`),
  CONSTRAINT `FK_2AF5A5CC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `assettype` (`id`),
  CONSTRAINT `FK_2AF5A5CF65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_2AF5A5CF8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  CONSTRAINT `FK_2AF5A5CF920BBA2` FOREIGN KEY (`value_id`) REFERENCES `assetrelevance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (1,1,1,2,'WWW_01','','serverasset',5),(2,1,1,1,'WWW_02','','serverasset',1),(3,2,2,1,'DNS_003','','serverasset',2),(4,1,1,1,'DNS_004','','serverasset',2),(5,1,1,1,'FILESERVER_05','','serverasset',2),(6,2,2,1,'SAMBA_06','','serverasset',2),(7,1,1,1,'SAMBA_07','','serverasset',5),(8,1,1,1,'APPSERVER_08','','serverasset',5),(9,2,2,1,'APPSERVER_09','','serverasset',5),(10,1,1,1,'APPSERVER_10','','serverasset',5),(11,1,1,1,'JBOSS_11','','serverasset',5),(12,2,2,1,'JBOSS_12','','serverasset',5),(13,1,1,1,'SQLSERVER_13','','serverasset',1),(14,1,1,1,'POSTGRES_14','','serverasset',1),(15,2,2,1,'ORACLE_15','','serverasset',3),(16,1,1,1,'WWW_33','','serverasset',4),(17,1,1,2,'CoreHP','','serverasset',2),(18,1,1,1,'Main','','processasset',1),(19,1,1,1,'sub 01','','processasset',1),(20,1,1,1,'sub 02','','processasset',1),(21,1,1,1,'SERVER 004','','serverasset',1),(22,1,1,1,'asdf','','serverasset',2),(23,1,1,1,'asdf','','serverasset',2),(24,1,1,1,'SERVER 005','','serverasset',1),(25,1,1,1,'server003','','serverasset',1),(26,1,1,1,'server003','','serverasset',1),(27,1,1,1,'SERVER 006','','serverasset',1);
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_asset`
--

DROP TABLE IF EXISTS `asset_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_asset` (
  `asset_source` int(11) NOT NULL,
  `asset_target` int(11) NOT NULL,
  PRIMARY KEY (`asset_source`,`asset_target`),
  KEY `IDX_97F4741BB7A7F06E` (`asset_source`),
  KEY `IDX_97F4741BAE42A0E1` (`asset_target`),
  CONSTRAINT `FK_97F4741BAE42A0E1` FOREIGN KEY (`asset_target`) REFERENCES `asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_97F4741BB7A7F06E` FOREIGN KEY (`asset_source`) REFERENCES `asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_asset`
--

LOCK TABLES `asset_asset` WRITE;
/*!40000 ALTER TABLE `asset_asset` DISABLE KEYS */;
INSERT INTO `asset_asset` VALUES (1,2),(1,3),(1,4),(1,5),(18,1),(18,3);
/*!40000 ALTER TABLE `asset_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_assetgroup`
--

DROP TABLE IF EXISTS `asset_assetgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_assetgroup` (
  `asset_id` int(11) NOT NULL,
  `assetgroup_id` int(11) NOT NULL,
  PRIMARY KEY (`asset_id`,`assetgroup_id`),
  KEY `IDX_1260124C5DA1941` (`asset_id`),
  KEY `IDX_1260124CE9F2796C` (`assetgroup_id`),
  CONSTRAINT `FK_1260124C5DA1941` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1260124CE9F2796C` FOREIGN KEY (`assetgroup_id`) REFERENCES `assetgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_assetgroup`
--

LOCK TABLES `asset_assetgroup` WRITE;
/*!40000 ALTER TABLE `asset_assetgroup` DISABLE KEYS */;
INSERT INTO `asset_assetgroup` VALUES (1,2),(3,1),(3,2);
/*!40000 ALTER TABLE `asset_assetgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_consequence`
--

DROP TABLE IF EXISTS `asset_consequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_consequence` (
  `asset_id` int(11) NOT NULL,
  `consequence_id` int(11) NOT NULL,
  PRIMARY KEY (`asset_id`,`consequence_id`),
  KEY `IDX_AA2015555DA1941` (`asset_id`),
  KEY `IDX_AA2015553A9BCB0A` (`consequence_id`),
  CONSTRAINT `FK_AA2015553A9BCB0A` FOREIGN KEY (`consequence_id`) REFERENCES `consequence` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AA2015555DA1941` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_consequence`
--

LOCK TABLES `asset_consequence` WRITE;
/*!40000 ALTER TABLE `asset_consequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_consequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_document`
--

DROP TABLE IF EXISTS `asset_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_document` (
  `asset_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`asset_id`,`document_id`),
  KEY `IDX_5A0290F65DA1941` (`asset_id`),
  KEY `IDX_5A0290F6C33F7837` (`document_id`),
  CONSTRAINT `FK_5A0290F65DA1941` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5A0290F6C33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_document`
--

LOCK TABLES `asset_document` WRITE;
/*!40000 ALTER TABLE `asset_document` DISABLE KEYS */;
INSERT INTO `asset_document` VALUES (1,5),(1,6);
/*!40000 ALTER TABLE `asset_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_plan`
--

DROP TABLE IF EXISTS `asset_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_plan` (
  `asset_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  PRIMARY KEY (`asset_id`,`plan_id`),
  KEY `IDX_393E9EB55DA1941` (`asset_id`),
  KEY `IDX_393E9EB5E899029B` (`plan_id`),
  CONSTRAINT `FK_393E9EB55DA1941` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_393E9EB5E899029B` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_plan`
--

LOCK TABLES `asset_plan` WRITE;
/*!40000 ALTER TABLE `asset_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_risk`
--

DROP TABLE IF EXISTS `asset_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_risk` (
  `asset_id` int(11) NOT NULL,
  `risk_id` int(11) NOT NULL,
  PRIMARY KEY (`asset_id`,`risk_id`),
  KEY `IDX_9D6210895DA1941` (`asset_id`),
  KEY `IDX_9D621089235B6D1` (`risk_id`),
  CONSTRAINT `FK_9D621089235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9D6210895DA1941` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_risk`
--

LOCK TABLES `asset_risk` WRITE;
/*!40000 ALTER TABLE `asset_risk` DISABLE KEYS */;
INSERT INTO `asset_risk` VALUES (1,1),(1,2),(1,3),(1,4),(1,7),(1,9),(2,4),(2,5),(2,9),(2,11),(2,14),(2,17),(3,11),(3,12),(4,17),(5,1),(5,11),(5,19),(6,1),(7,1),(8,1),(9,1),(9,4),(9,7),(9,19),(10,18),(11,17),(12,16),(13,14),(14,15),(15,10),(15,11),(15,12),(15,13);
/*!40000 ALTER TABLE `asset_risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_threat`
--

DROP TABLE IF EXISTS `asset_threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_threat` (
  `asset_id` int(11) NOT NULL,
  `threat_id` int(11) NOT NULL,
  PRIMARY KEY (`asset_id`,`threat_id`),
  KEY `IDX_C4BAD3FA5DA1941` (`asset_id`),
  KEY `IDX_C4BAD3FAB2891786` (`threat_id`),
  CONSTRAINT `FK_C4BAD3FA5DA1941` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C4BAD3FAB2891786` FOREIGN KEY (`threat_id`) REFERENCES `threat` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_threat`
--

LOCK TABLES `asset_threat` WRITE;
/*!40000 ALTER TABLE `asset_threat` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_threat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_vulnerability`
--

DROP TABLE IF EXISTS `asset_vulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_vulnerability` (
  `asset_id` int(11) NOT NULL,
  `vulnerability_id` int(11) NOT NULL,
  PRIMARY KEY (`asset_id`,`vulnerability_id`),
  KEY `IDX_AF3B99265DA1941` (`asset_id`),
  KEY `IDX_AF3B992672897D8B` (`vulnerability_id`),
  CONSTRAINT `FK_AF3B99265DA1941` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AF3B992672897D8B` FOREIGN KEY (`vulnerability_id`) REFERENCES `vulnerability` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_vulnerability`
--

LOCK TABLES `asset_vulnerability` WRITE;
/*!40000 ALTER TABLE `asset_vulnerability` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_vulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetgroup`
--

DROP TABLE IF EXISTS `assetgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetgroup`
--

LOCK TABLES `assetgroup` WRITE;
/*!40000 ALTER TABLE `assetgroup` DISABLE KEYS */;
INSERT INTO `assetgroup` VALUES (1,'Nginx Servers',''),(2,'Samba Servers','');
/*!40000 ALTER TABLE `assetgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetgroup_asset`
--

DROP TABLE IF EXISTS `assetgroup_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetgroup_asset` (
  `assetgroup_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`assetgroup_id`,`asset_id`),
  KEY `IDX_F7296219E9F2796C` (`assetgroup_id`),
  KEY `IDX_F72962195DA1941` (`asset_id`),
  CONSTRAINT `FK_F72962195DA1941` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F7296219E9F2796C` FOREIGN KEY (`assetgroup_id`) REFERENCES `assetgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetgroup_asset`
--

LOCK TABLES `assetgroup_asset` WRITE;
/*!40000 ALTER TABLE `assetgroup_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetgroup_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetgroup_document`
--

DROP TABLE IF EXISTS `assetgroup_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetgroup_document` (
  `assetgroup_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`assetgroup_id`,`document_id`),
  KEY `IDX_BD7C5F46E9F2796C` (`assetgroup_id`),
  KEY `IDX_BD7C5F46C33F7837` (`document_id`),
  CONSTRAINT `FK_BD7C5F46C33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BD7C5F46E9F2796C` FOREIGN KEY (`assetgroup_id`) REFERENCES `assetgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetgroup_document`
--

LOCK TABLES `assetgroup_document` WRITE;
/*!40000 ALTER TABLE `assetgroup_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetgroup_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetgroup_plan`
--

DROP TABLE IF EXISTS `assetgroup_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetgroup_plan` (
  `assetgroup_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  PRIMARY KEY (`assetgroup_id`,`plan_id`),
  KEY `IDX_54A6492AE9F2796C` (`assetgroup_id`),
  KEY `IDX_54A6492AE899029B` (`plan_id`),
  CONSTRAINT `FK_54A6492AE899029B` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_54A6492AE9F2796C` FOREIGN KEY (`assetgroup_id`) REFERENCES `assetgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetgroup_plan`
--

LOCK TABLES `assetgroup_plan` WRITE;
/*!40000 ALTER TABLE `assetgroup_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetgroup_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetgroup_risk`
--

DROP TABLE IF EXISTS `assetgroup_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetgroup_risk` (
  `assetgroup_id` int(11) NOT NULL,
  `risk_id` int(11) NOT NULL,
  PRIMARY KEY (`assetgroup_id`,`risk_id`),
  KEY `IDX_F0FAC716E9F2796C` (`assetgroup_id`),
  KEY `IDX_F0FAC716235B6D1` (`risk_id`),
  CONSTRAINT `FK_F0FAC716235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F0FAC716E9F2796C` FOREIGN KEY (`assetgroup_id`) REFERENCES `assetgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetgroup_risk`
--

LOCK TABLES `assetgroup_risk` WRITE;
/*!40000 ALTER TABLE `assetgroup_risk` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetgroup_risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetgroup_threat`
--

DROP TABLE IF EXISTS `assetgroup_threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetgroup_threat` (
  `assetgroup_id` int(11) NOT NULL,
  `threat_id` int(11) NOT NULL,
  PRIMARY KEY (`assetgroup_id`,`threat_id`),
  KEY `IDX_2AD46FC0E9F2796C` (`assetgroup_id`),
  KEY `IDX_2AD46FC0B2891786` (`threat_id`),
  CONSTRAINT `FK_2AD46FC0B2891786` FOREIGN KEY (`threat_id`) REFERENCES `threat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2AD46FC0E9F2796C` FOREIGN KEY (`assetgroup_id`) REFERENCES `assetgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetgroup_threat`
--

LOCK TABLES `assetgroup_threat` WRITE;
/*!40000 ALTER TABLE `assetgroup_threat` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetgroup_threat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetgroup_vulnerability`
--

DROP TABLE IF EXISTS `assetgroup_vulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetgroup_vulnerability` (
  `assetgroup_id` int(11) NOT NULL,
  `vulnerability_id` int(11) NOT NULL,
  PRIMARY KEY (`assetgroup_id`,`vulnerability_id`),
  KEY `IDX_DE824F13E9F2796C` (`assetgroup_id`),
  KEY `IDX_DE824F1372897D8B` (`vulnerability_id`),
  CONSTRAINT `FK_DE824F1372897D8B` FOREIGN KEY (`vulnerability_id`) REFERENCES `vulnerability` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DE824F13E9F2796C` FOREIGN KEY (`assetgroup_id`) REFERENCES `assetgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetgroup_vulnerability`
--

LOCK TABLES `assetgroup_vulnerability` WRITE;
/*!40000 ALTER TABLE `assetgroup_vulnerability` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetgroup_vulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetmanager`
--

DROP TABLE IF EXISTS `assetmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetmanager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetmanager`
--

LOCK TABLES `assetmanager` WRITE;
/*!40000 ALTER TABLE `assetmanager` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetrelevance`
--

DROP TABLE IF EXISTS `assetrelevance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetrelevance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetrelevance`
--

LOCK TABLES `assetrelevance` WRITE;
/*!40000 ALTER TABLE `assetrelevance` DISABLE KEYS */;
INSERT INTO `assetrelevance` VALUES (1,1,'No significant losses.'),(2,2,'Low probability of monetary and reputation loss.'),(3,3,'Possible monetary and reputation loss.'),(4,4,'High probability of monetary, reputation and legal loss.'),(5,5,'Great monetary losses with high reputation and legal impact.');
/*!40000 ALTER TABLE `assetrelevance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetscale`
--

DROP TABLE IF EXISTS `assetscale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetscale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetscale`
--

LOCK TABLES `assetscale` WRITE;
/*!40000 ALTER TABLE `assetscale` DISABLE KEYS */;
INSERT INTO `assetscale` VALUES (1,1,'Lowest');
/*!40000 ALTER TABLE `assetscale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettype`
--

DROP TABLE IF EXISTS `assettype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettype`
--

LOCK TABLES `assettype` WRITE;
/*!40000 ALTER TABLE `assettype` DISABLE KEYS */;
INSERT INTO `assettype` VALUES (1,'Generic Server',''),(2,'Web Server',''),(3,'DNS Server',''),(4,'Application Server',''),(5,'File Server','');
/*!40000 ALTER TABLE `assettype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetvalue`
--

DROP TABLE IF EXISTS `assetvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetvalue`
--

LOCK TABLES `assetvalue` WRITE;
/*!40000 ALTER TABLE `assetvalue` DISABLE KEYS */;
INSERT INTO `assetvalue` VALUES (1,1,'No significant losses.'),(2,2,'Low probability of monetary and reputation loss.'),(3,3,'Possible monetary and reputation loss.'),(4,4,'High probability of monetary, reputation and legal loss.'),(5,5,'Great monetary losses with high reputation and legal impact.');
/*!40000 ALTER TABLE `assetvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance`
--

DROP TABLE IF EXISTS `compliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compliance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance`
--

LOCK TABLES `compliance` WRITE;
/*!40000 ALTER TABLE `compliance` DISABLE KEYS */;
INSERT INTO `compliance` VALUES (1,'ITIL V3','<p>adfasdfa</p>'),(2,'COBIT','');
/*!40000 ALTER TABLE `compliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_document`
--

DROP TABLE IF EXISTS `compliance_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compliance_document` (
  `compliance_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`compliance_id`,`document_id`),
  KEY `IDX_64453AD1AA24AB19` (`compliance_id`),
  KEY `IDX_64453AD1C33F7837` (`document_id`),
  CONSTRAINT `FK_64453AD1AA24AB19` FOREIGN KEY (`compliance_id`) REFERENCES `compliance` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_64453AD1C33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_document`
--

LOCK TABLES `compliance_document` WRITE;
/*!40000 ALTER TABLE `compliance_document` DISABLE KEYS */;
INSERT INTO `compliance_document` VALUES (1,5),(1,6);
/*!40000 ALTER TABLE `compliance_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliancerule`
--

DROP TABLE IF EXISTS `compliancerule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compliancerule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4A651CEC54C8C93` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliancerule`
--

LOCK TABLES `compliancerule` WRITE;
/*!40000 ALTER TABLE `compliancerule` DISABLE KEYS */;
INSERT INTO `compliancerule` VALUES (1,'Implement Change Management','','',2),(2,'Implement Incident Managemet','','',1);
/*!40000 ALTER TABLE `compliancerule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consequence`
--

DROP TABLE IF EXISTS `consequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consequence`
--

LOCK TABLES `consequence` WRITE;
/*!40000 ALTER TABLE `consequence` DISABLE KEYS */;
INSERT INTO `consequence` VALUES (1,'Violation of legislation and/or regulation',''),(2,'Impairment of business performance',''),(3,'Loss of goodwill/negative effect on reputation',''),(4,'Breach associated with personal information',''),(5,'Endangerment of personal safety',''),(6,'Adverse effects on law enforcement',''),(7,'Breach of confidentiality',''),(8,'Breach of public order',''),(9,'Financial loss',''),(10,'Disruption to business activities',''),(11,'Endangerment of environmental safety','');
/*!40000 ALTER TABLE `consequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control`
--

DROP TABLE IF EXISTS `control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `content_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EDDB2C4B6BF700BD` (`status_id`),
  KEY `IDX_EDDB2C4BC54C8C93` (`type_id`),
  KEY `IDX_EDDB2C4BF65B3645` (`analyst_id`),
  CONSTRAINT `FK_EDDB2C4B6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `controlstatus` (`id`),
  CONSTRAINT `FK_EDDB2C4BC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `controltype` (`id`),
  CONSTRAINT `FK_EDDB2C4BF65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control`
--

LOCK TABLES `control` WRITE;
/*!40000 ALTER TABLE `control` DISABLE KEYS */;
INSERT INTO `control` VALUES (1,1,1,2,'Control 0001133','<p>A company based in Santa Cruz, California, says it obtained a temporary restraining order against a Chinese firm for copying its Onewheel electric hoverboard.</p>\r\n\r\n<p>Future Motion Inc. had U.S. marshals seize the company&#39;s assets and marketing materials from the floor of the CES gadget show in Las Vegas on Thursday.</p>\r\n\r\n<p>Future Motion accuses Changzhou First International Trade Co. of patent infringement and obtained the order late Wednesday. Marshals accompanied Future Motion lawyers in the seizure of Changzhou&#39;s &quot;Surfing Electric Scooter.&quot;</p>\r\n\r\n<p>Future Motion lead attorney Shawn Kolitch says the Chinese company&#39;s product was identical to the Onewheel, including a reversible light system that glows different colors depending on the direction of travel.</p>\r\n\r\n<p>A message seeking comment from Changzhou was not immediately returned.</p>\r\n\r\n<p><img alt=\"Onewheel\" src=\"http://i.cbc.ca/1.3395159.1452264202!/fileImage/httpImage/image.jpg_gen/derivatives/original_620/onewheel.jpg\" style=\"width:100%\" /></p>\r\n\r\n<p>U.S. based Future Motion alleges the Chinese company&#39;s product was identical to its one-wheeled hoverboard Onewheel, pictured here, and infringes on its patent. (Onewheel)</p>\r\n\r\n<p><a href=\"http://www.cp.org/\" target=\"_blank\">&copy; The Associated Press, 2016&nbsp;<br />\r\n<img alt=\"The Canadian Press\" src=\"http://www.cbc.ca/gfx/icon_cponline07.gif\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<table cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/facebook-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/twitter-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/reddit-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/plus-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/share-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/email-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"http://www.cbc.ca/news2/feedback/index_typo.html?\" onclick=\"location.href=this.href + document.title + (new Date()); return false;\">Report Typo</a></p>\r\n\r\n<p><a href=\"http://www.cbc.ca/contact/\">Send Feedback</a></p>','<p>A company based in Santa Cruz, California, says it obtained a temporary restraining order against a Chinese firm for copying its Onewheel electric hoverboard.</p>\r\n\r\n<p>Future Motion Inc. had U.S. marshals seize the company&#39;s assets and marketing materials from the floor of the CES gadget show in Las Vegas on Thursday.</p>\r\n\r\n<p>Future Motion accuses Changzhou First International Trade Co. of patent infringement and obtained the order late Wednesday. Marshals accompanied Future Motion lawyers in the seizure of Changzhou&#39;s &quot;Surfing Electric Scooter.&quot;</p>\r\n\r\n<p>Future Motion lead attorney Shawn Kolitch says the Chinese company&#39;s product was identical to the Onewheel, including a reversible light system that glows different colors depending on the direction of travel.</p>\r\n\r\n<p>A message seeking comment from Changzhou was not immediately returned.</p>\r\n\r\n<p><img alt=\"Onewheel\" src=\"http://i.cbc.ca/1.3395159.1452264202!/fileImage/httpImage/image.jpg_gen/derivatives/original_620/onewheel.jpg\" style=\"width:100%\" /></p>\r\n\r\n<p>U.S. based Future Motion alleges the Chinese company&#39;s product was identical to its one-wheeled hoverboard Onewheel, pictured here, and infringes on its patent. (Onewheel)</p>\r\n\r\n<p><a href=\"http://www.cp.org/\" target=\"_blank\">&copy; The Associated Press, 2016&nbsp;<br />\r\n<img alt=\"The Canadian Press\" src=\"http://www.cbc.ca/gfx/icon_cponline07.gif\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<table cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/facebook-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/twitter-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/reddit-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/plus-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/share-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/email-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"http://www.cbc.ca/news2/feedback/index_typo.html?\" onclick=\"location.href=this.href + document.title + (new Date()); return false;\">Report Typo</a></p>\r\n\r\n<p><a href=\"http://www.cbc.ca/contact/\">Send Feedback</a></p>',NULL,'2016-01-21 08:28:01','2016-01-21 08:28:01'),(2,1,1,1,'Control 002','<h2>Guides and such</h2>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/orm/5.0/quickstart/html/\">Getting Started Guide</a></p>\r\n\r\n<p>A quickstart-style guide with tutorials. See also the Obtaining Hibernate section discussing the Hibernate artifacts and how to obtain them.</p>\r\n\r\n<p><a href=\"http://github.com/hibernate/hibernate-orm/tree/5.0/migration-guide.adoc\">Migration Guide</a></p>\r\n\r\n<p>Migration guide covering migration from 4.3 to 5.0</p>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/orm/5.0/userGuide/en-US/html_single/\">User Guide</a></p>\r\n\r\n<p>Guide covering most user facing concepts and APIs of Hibernate</p>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/orm/5.0/mappingGuide/en-US/html_single/\">Domain Model Mapping Guide</a></p>\r\n\r\n<p>Guide covering mapping an application domain model</p>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/orm/5.0/integrationsGuide/en-US/html_single/\">Integrations Guide</a></p>\r\n\r\n<p>Guide covering topics of interest for developers looking to develop integrations with Hibernate.</p>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/orm/5.0/javadocs/\">Hibernate JavaDoc</a></p>\r\n\r\n<p>The Hibernate JavaDocs</p>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/jpa/2.1/api/\">JPA 2.1 JavaDoc</a></p>\r\n\r\n<p>The JPA (2.1) JavaDocs</p>\r\n\r\n<p><a href=\"http://hibernate.org/orm/faq/\">FAQ</a></p>\r\n\r\n<p>The FAQ</p>\r\n\r\n<p><a href=\"https://community.jboss.org/en/hibernate\">JBoss-hosted wiki</a></p>\r\n\r\n<p>Wiki (older content) hosted at JBoss.org</p>\r\n\r\n<p><a href=\"https://github.com/hibernate/hibernate-orm/wiki/_pages\">GitHub-hosted wiki</a></p>\r\n\r\n<p>Wiki hosted at GitHub</p>\r\n\r\n<h2>Presentations</h2>\r\n\r\n<p>Brett did a few interesting presentations available on Slideshare:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><a href=\"http://www.slideshare.net/brmeyer/orm-jpa-hibernate-overview\">Gentle introduction on ORMs and JPA</a></p>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"http://www.slideshare.net/brmeyer/hibernate-orm-performance-31550150\">Hibernate ORM: tips, tricks and performance techniques</a></p>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"http://www.slideshare.net/brmeyer/hibernate-orm-features\">Not Just ORM: Powerful Hibernate ORM Features and Capabilities</a></p>\r\n	</li>\r\n</ul>','<h1>Getting Started with JBoss Application Server 7</h1>\r\n\r\n<p>JBoss Application Server 7 is the latest release in a series of JBoss application server offerings. JBoss Application Server 7, is a fast, powerful, implementation of the Java Enterprise Edition 6 specification. The state-of-the-art architecture built on the Modular Service Container enables services on-demand when your application requires them. JBoss Application Server 7.0.0.Final release is a certified implementation of the Java Enterprise Edition 6 Web Profile specification. The table below lists the Java Enterprise Edition 6 technologies and what is provided in our JBoss Application Server 7.0.0.Final release distributions.<br />\r\n<img src=\"https://docs.jboss.org/author/download/attachments/4588133/JBossAS7-JavaEE.png?version=1&amp;modificationDate=1310399117000\" style=\"height:583px; width:918px\" /><br />\r\n*PRUNED (Refer to the Java Enterprise Edition 6 Platform Specification, EE.6.1.3 Pruned Java Technologies for an overview of this concept).<br />\r\nThis document provides a quick overview on how to download and get started using JBoss Application Server 7 for your application development. For in-depth content on administrative features, refer to the JBoss Application Server 7 Admin Guide.</p>\r\n\r\n<h2><a name=\"GettingStartedGuide-Download\"></a>Download</h2>\r\n\r\n<p>JBoss Application Server 7 distributions can be obtained from the usual place:<br />\r\n<a href=\"http://www.jboss.org/jbossas/downloads\">http://www.jboss.org/jbossas/downloads</a><br />\r\nStarting with JBoss Application Server 7.0.0.Final, there will be two distributions available for download available in zip or tar file formats.</p>\r\n\r\n<ul>\r\n	<li>Java EE 6 Full Profile Preview\r\n	<ul>\r\n		<li><strong>jboss-as-7.0.0.Final.zip</strong></li>\r\n		<li><strong>jboss-as-7.0.0.Final.tar.gz</strong></li>\r\n	</ul>\r\n	</li>\r\n	<li>Java EE 6 Certified Web Profile\r\n	<ul>\r\n		<li><strong>jboss-as-web-7.0.0.Final.zip</strong></li>\r\n		<li><strong>jboss-as-web-7.0.0.Final.tar.gz</strong></li>\r\n	</ul>\r\n	</li>\r\n</ul>',NULL,NULL,NULL),(3,1,1,1,'Control005','','',NULL,NULL,NULL),(5,1,2,1,'Control 5','','','2016-01-14 08:34:32','2016-01-14 08:34:49','2016-01-14 08:34:49');
/*!40000 ALTER TABLE `control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_document`
--

DROP TABLE IF EXISTS `control_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_document` (
  `control_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`control_id`,`document_id`),
  KEY `IDX_7A97A3632BEC70E` (`control_id`),
  KEY `IDX_7A97A36C33F7837` (`document_id`),
  CONSTRAINT `FK_7A97A3632BEC70E` FOREIGN KEY (`control_id`) REFERENCES `control` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7A97A36C33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_document`
--

LOCK TABLES `control_document` WRITE;
/*!40000 ALTER TABLE `control_document` DISABLE KEYS */;
INSERT INTO `control_document` VALUES (1,5),(1,6),(2,5),(2,6);
/*!40000 ALTER TABLE `control_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlreview`
--

DROP TABLE IF EXISTS `controlreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4882C40732BEC70E` (`control_id`),
  KEY `IDX_4882C407F65B3645` (`analyst_id`),
  KEY `IDX_4882C4076BF700BD` (`status_id`),
  CONSTRAINT `FK_4882C40732BEC70E` FOREIGN KEY (`control_id`) REFERENCES `control` (`id`),
  CONSTRAINT `FK_4882C4076BF700BD` FOREIGN KEY (`status_id`) REFERENCES `controlstatus` (`id`),
  CONSTRAINT `FK_4882C407F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlreview`
--

LOCK TABLES `controlreview` WRITE;
/*!40000 ALTER TABLE `controlreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlstatus`
--

DROP TABLE IF EXISTS `controlstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlstatus`
--

LOCK TABLES `controlstatus` WRITE;
/*!40000 ALTER TABLE `controlstatus` DISABLE KEYS */;
INSERT INTO `controlstatus` VALUES (1,'Status','Status');
/*!40000 ALTER TABLE `controlstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controltype`
--

DROP TABLE IF EXISTS `controltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controltype`
--

LOCK TABLES `controltype` WRITE;
/*!40000 ALTER TABLE `controltype` DISABLE KEYS */;
INSERT INTO `controltype` VALUES (1,'Type001','Types'),(2,'Firewall 001','Firewall para proteÃ§Ã£o de rede de dados');
/*!40000 ALTER TABLE `controltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlversion`
--

DROP TABLE IF EXISTS `controlversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlversion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `entity_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `content_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_534EE0A06BF700BD` (`status_id`),
  KEY `IDX_534EE0A0C54C8C93` (`type_id`),
  KEY `IDX_534EE0A0F65B3645` (`analyst_id`),
  CONSTRAINT `FK_534EE0A06BF700BD` FOREIGN KEY (`status_id`) REFERENCES `controlstatus` (`id`),
  CONSTRAINT `FK_534EE0A0C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `controltype` (`id`),
  CONSTRAINT `FK_534EE0A0F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlversion`
--

LOCK TABLES `controlversion` WRITE;
/*!40000 ALTER TABLE `controlversion` DISABLE KEYS */;
INSERT INTO `controlversion` VALUES (2,1,NULL,1,2,'Control 002','<h2>Guides and such</h2>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/orm/5.0/quickstart/html/\">Getting Started Guide</a></p>\r\n\r\n<p>A quickstart-style guide with tutorials. See also the Obtaining Hibernate section discussing the Hibernate artifacts and how to obtain them.</p>\r\n\r\n<p><a href=\"http://github.com/hibernate/hibernate-orm/tree/5.0/migration-guide.adoc\">Migration Guide</a></p>\r\n\r\n<p>Migration guide covering migration from 4.3 to 5.0</p>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/orm/5.0/userGuide/en-US/html_single/\">User Guide</a></p>\r\n\r\n<p>Guide covering most user facing concepts and APIs of Hibernate</p>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/orm/5.0/mappingGuide/en-US/html_single/\">Domain Model Mapping Guide</a></p>\r\n\r\n<p>Guide covering mapping an application domain model</p>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/orm/5.0/integrationsGuide/en-US/html_single/\">Integrations Guide</a></p>\r\n\r\n<p>Guide covering topics of interest for developers looking to develop integrations with Hibernate.</p>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/orm/5.0/javadocs/\">Hibernate JavaDoc</a></p>\r\n\r\n<p>The Hibernate JavaDocs</p>\r\n\r\n<p><a href=\"http://docs.jboss.org/hibernate/jpa/2.1/api/\">JPA 2.1 JavaDoc</a></p>\r\n\r\n<p>The JPA (2.1) JavaDocs</p>\r\n\r\n<p><a href=\"http://hibernate.org/orm/faq/\">FAQ</a></p>\r\n\r\n<p>The FAQ</p>\r\n\r\n<p><a href=\"https://community.jboss.org/en/hibernate\">JBoss-hosted wiki</a></p>\r\n\r\n<p>Wiki (older content) hosted at JBoss.org</p>\r\n\r\n<p><a href=\"https://github.com/hibernate/hibernate-orm/wiki/_pages\">GitHub-hosted wiki</a></p>\r\n\r\n<p>Wiki hosted at GitHub</p>\r\n\r\n<h2>Presentations</h2>\r\n\r\n<p>Brett did a few interesting presentations available on Slideshare:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><a href=\"http://www.slideshare.net/brmeyer/orm-jpa-hibernate-overview\">Gentle introduction on ORMs and JPA</a></p>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"http://www.slideshare.net/brmeyer/hibernate-orm-performance-31550150\">Hibernate ORM: tips, tricks and performance techniques</a></p>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"http://www.slideshare.net/brmeyer/hibernate-orm-features\">Not Just ORM: Powerful Hibernate ORM Features and Capabilities</a></p>\r\n	</li>\r\n</ul>','<h1>Getting Started with JBoss Application Server 7</h1>\r\n\r\n<p>JBoss Application Server 7 is the latest release in a series of JBoss application server offerings. JBoss Application Server 7, is a fast, powerful, implementation of the Java Enterprise Edition 6 specification. The state-of-the-art architecture built on the Modular Service Container enables services on-demand when your application requires them. JBoss Application Server 7.0.0.Final release is a certified implementation of the Java Enterprise Edition 6 Web Profile specification. The table below lists the Java Enterprise Edition 6 technologies and what is provided in our JBoss Application Server 7.0.0.Final release distributions.<br />\r\n<img src=\"https://docs.jboss.org/author/download/attachments/4588133/JBossAS7-JavaEE.png?version=1&amp;modificationDate=1310399117000\" style=\"height:583px; width:918px\" /><br />\r\n*PRUNED (Refer to the Java Enterprise Edition 6 Platform Specification, EE.6.1.3 Pruned Java Technologies for an overview of this concept).<br />\r\nThis document provides a quick overview on how to download and get started using JBoss Application Server 7 for your application development. For in-depth content on administrative features, refer to the JBoss Application Server 7 Admin Guide.</p>\r\n\r\n<h2><a name=\"GettingStartedGuide-Download\"></a>Download</h2>\r\n\r\n<p>JBoss Application Server 7 distributions can be obtained from the usual place:<br />\r\n<a href=\"http://www.jboss.org/jbossas/downloads\">http://www.jboss.org/jbossas/downloads</a><br />\r\nStarting with JBoss Application Server 7.0.0.Final, there will be two distributions available for download available in zip or tar file formats.</p>\r\n\r\n<ul>\r\n	<li>Java EE 6 Full Profile Preview\r\n	<ul>\r\n		<li><strong>jboss-as-7.0.0.Final.zip</strong></li>\r\n		<li><strong>jboss-as-7.0.0.Final.tar.gz</strong></li>\r\n	</ul>\r\n	</li>\r\n	<li>Java EE 6 Certified Web Profile\r\n	<ul>\r\n		<li><strong>jboss-as-web-7.0.0.Final.zip</strong></li>\r\n		<li><strong>jboss-as-web-7.0.0.Final.tar.gz</strong></li>\r\n	</ul>\r\n	</li>\r\n</ul>',NULL,NULL,NULL),(4,1,1,2,1,'Control 0001','<p>A company based in Santa Cruz, California, says it obtained a temporary restraining order against a Chinese firm for copying its Onewheel electric hoverboard.</p>\r\n\r\n<p>Future Motion Inc. had U.S. marshals seize the company&#39;s assets and marketing materials from the floor of the CES gadget show in Las Vegas on Thursday.</p>\r\n\r\n<p>Future Motion accuses Changzhou First International Trade Co. of patent infringement and obtained the order late Wednesday. Marshals accompanied Future Motion lawyers in the seizure of Changzhou&#39;s &quot;Surfing Electric Scooter.&quot;</p>\r\n\r\n<p>Future Motion lead attorney Shawn Kolitch says the Chinese company&#39;s product was identical to the Onewheel, including a reversible light system that glows different colors depending on the direction of travel.</p>\r\n\r\n<p>A message seeking comment from Changzhou was not immediately returned.</p>\r\n\r\n<p><img alt=\"Onewheel\" src=\"http://i.cbc.ca/1.3395159.1452264202!/fileImage/httpImage/image.jpg_gen/derivatives/original_620/onewheel.jpg\" style=\"width:100%\" /></p>\r\n\r\n<p>U.S. based Future Motion alleges the Chinese company&#39;s product was identical to its one-wheeled hoverboard Onewheel, pictured here, and infringes on its patent. (Onewheel)</p>\r\n\r\n<p><a href=\"http://www.cp.org/\" target=\"_blank\">&copy; The Associated Press, 2016&nbsp;<br />\r\n<img alt=\"The Canadian Press\" src=\"http://www.cbc.ca/gfx/icon_cponline07.gif\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<table cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/facebook-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/twitter-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/reddit-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/plus-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/share-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/email-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"http://www.cbc.ca/news2/feedback/index_typo.html?\" onclick=\"location.href=this.href + document.title + (new Date()); return false;\">Report Typo</a></p>\r\n\r\n<p><a href=\"http://www.cbc.ca/contact/\">Send Feedback</a></p>','<p>A company based in Santa Cruz, California, says it obtained a temporary restraining order against a Chinese firm for copying its Onewheel electric hoverboard.</p>\r\n\r\n<p>Future Motion Inc. had U.S. marshals seize the company&#39;s assets and marketing materials from the floor of the CES gadget show in Las Vegas on Thursday.</p>\r\n\r\n<p>Future Motion accuses Changzhou First International Trade Co. of patent infringement and obtained the order late Wednesday. Marshals accompanied Future Motion lawyers in the seizure of Changzhou&#39;s &quot;Surfing Electric Scooter.&quot;</p>\r\n\r\n<p>Future Motion lead attorney Shawn Kolitch says the Chinese company&#39;s product was identical to the Onewheel, including a reversible light system that glows different colors depending on the direction of travel.</p>\r\n\r\n<p>A message seeking comment from Changzhou was not immediately returned.</p>\r\n\r\n<p><img alt=\"Onewheel\" src=\"http://i.cbc.ca/1.3395159.1452264202!/fileImage/httpImage/image.jpg_gen/derivatives/original_620/onewheel.jpg\" style=\"width:100%\" /></p>\r\n\r\n<p>U.S. based Future Motion alleges the Chinese company&#39;s product was identical to its one-wheeled hoverboard Onewheel, pictured here, and infringes on its patent. (Onewheel)</p>\r\n\r\n<p><a href=\"http://www.cp.org/\" target=\"_blank\">&copy; The Associated Press, 2016&nbsp;<br />\r\n<img alt=\"The Canadian Press\" src=\"http://www.cbc.ca/gfx/icon_cponline07.gif\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<table cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/facebook-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/twitter-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/reddit-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/plus-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/share-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/email-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"http://www.cbc.ca/news2/feedback/index_typo.html?\" onclick=\"location.href=this.href + document.title + (new Date()); return false;\">Report Typo</a></p>\r\n\r\n<p><a href=\"http://www.cbc.ca/contact/\">Send Feedback</a></p>',NULL,'2016-01-14 10:53:49','2016-01-14 10:53:49'),(5,1,NULL,2,1,'Control 00011','<p>A company based in Santa Cruz, California, says it obtained a temporary restraining order against a Chinese firm for copying its Onewheel electric hoverboard.</p>\r\n\r\n<p>Future Motion Inc. had U.S. marshals seize the company&#39;s assets and marketing materials from the floor of the CES gadget show in Las Vegas on Thursday.</p>\r\n\r\n<p>Future Motion accuses Changzhou First International Trade Co. of patent infringement and obtained the order late Wednesday. Marshals accompanied Future Motion lawyers in the seizure of Changzhou&#39;s &quot;Surfing Electric Scooter.&quot;</p>\r\n\r\n<p>Future Motion lead attorney Shawn Kolitch says the Chinese company&#39;s product was identical to the Onewheel, including a reversible light system that glows different colors depending on the direction of travel.</p>\r\n\r\n<p>A message seeking comment from Changzhou was not immediately returned.</p>\r\n\r\n<p><img alt=\"Onewheel\" src=\"http://i.cbc.ca/1.3395159.1452264202!/fileImage/httpImage/image.jpg_gen/derivatives/original_620/onewheel.jpg\" style=\"width:100%\" /></p>\r\n\r\n<p>U.S. based Future Motion alleges the Chinese company&#39;s product was identical to its one-wheeled hoverboard Onewheel, pictured here, and infringes on its patent. (Onewheel)</p>\r\n\r\n<p><a href=\"http://www.cp.org/\" target=\"_blank\">&copy; The Associated Press, 2016&nbsp;<br />\r\n<img alt=\"The Canadian Press\" src=\"http://www.cbc.ca/gfx/icon_cponline07.gif\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<table cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/facebook-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/twitter-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/reddit-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/plus-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/share-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/email-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"http://www.cbc.ca/news2/feedback/index_typo.html?\" onclick=\"location.href=this.href + document.title + (new Date()); return false;\">Report Typo</a></p>\r\n\r\n<p><a href=\"http://www.cbc.ca/contact/\">Send Feedback</a></p>','<p>A company based in Santa Cruz, California, says it obtained a temporary restraining order against a Chinese firm for copying its Onewheel electric hoverboard.</p>\r\n\r\n<p>Future Motion Inc. had U.S. marshals seize the company&#39;s assets and marketing materials from the floor of the CES gadget show in Las Vegas on Thursday.</p>\r\n\r\n<p>Future Motion accuses Changzhou First International Trade Co. of patent infringement and obtained the order late Wednesday. Marshals accompanied Future Motion lawyers in the seizure of Changzhou&#39;s &quot;Surfing Electric Scooter.&quot;</p>\r\n\r\n<p>Future Motion lead attorney Shawn Kolitch says the Chinese company&#39;s product was identical to the Onewheel, including a reversible light system that glows different colors depending on the direction of travel.</p>\r\n\r\n<p>A message seeking comment from Changzhou was not immediately returned.</p>\r\n\r\n<p><img alt=\"Onewheel\" src=\"http://i.cbc.ca/1.3395159.1452264202!/fileImage/httpImage/image.jpg_gen/derivatives/original_620/onewheel.jpg\" style=\"width:100%\" /></p>\r\n\r\n<p>U.S. based Future Motion alleges the Chinese company&#39;s product was identical to its one-wheeled hoverboard Onewheel, pictured here, and infringes on its patent. (Onewheel)</p>\r\n\r\n<p><a href=\"http://www.cp.org/\" target=\"_blank\">&copy; The Associated Press, 2016&nbsp;<br />\r\n<img alt=\"The Canadian Press\" src=\"http://www.cbc.ca/gfx/icon_cponline07.gif\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<table cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/facebook-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/twitter-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/reddit-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/plus-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/share-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/email-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"http://www.cbc.ca/news2/feedback/index_typo.html?\" onclick=\"location.href=this.href + document.title + (new Date()); return false;\">Report Typo</a></p>\r\n\r\n<p><a href=\"http://www.cbc.ca/contact/\">Send Feedback</a></p>',NULL,NULL,NULL),(6,1,NULL,1,3,'Control005','','',NULL,NULL,NULL),(7,1,NULL,2,1,'Control 00011','<p>A company based in Santa Cruz, California, says it obtained a temporary restraining order against a Chinese firm for copying its Onewheel electric hoverboard.</p>\r\n\r\n<p>Future Motion Inc. had U.S. marshals seize the company&#39;s assets and marketing materials from the floor of the CES gadget show in Las Vegas on Thursday.</p>\r\n\r\n<p>Future Motion accuses Changzhou First International Trade Co. of patent infringement and obtained the order late Wednesday. Marshals accompanied Future Motion lawyers in the seizure of Changzhou&#39;s &quot;Surfing Electric Scooter.&quot;</p>\r\n\r\n<p>Future Motion lead attorney Shawn Kolitch says the Chinese company&#39;s product was identical to the Onewheel, including a reversible light system that glows different colors depending on the direction of travel.</p>\r\n\r\n<p>A message seeking comment from Changzhou was not immediately returned.</p>\r\n\r\n<p><img alt=\"Onewheel\" src=\"http://i.cbc.ca/1.3395159.1452264202!/fileImage/httpImage/image.jpg_gen/derivatives/original_620/onewheel.jpg\" style=\"width:100%\" /></p>\r\n\r\n<p>U.S. based Future Motion alleges the Chinese company&#39;s product was identical to its one-wheeled hoverboard Onewheel, pictured here, and infringes on its patent. (Onewheel)</p>\r\n\r\n<p><a href=\"http://www.cp.org/\" target=\"_blank\">&copy; The Associated Press, 2016&nbsp;<br />\r\n<img alt=\"The Canadian Press\" src=\"http://www.cbc.ca/gfx/icon_cponline07.gif\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<table cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/facebook-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/twitter-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/reddit-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/plus-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/share-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/email-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"http://www.cbc.ca/news2/feedback/index_typo.html?\" onclick=\"location.href=this.href + document.title + (new Date()); return false;\">Report Typo</a></p>\r\n\r\n<p><a href=\"http://www.cbc.ca/contact/\">Send Feedback</a></p>','<p>A company based in Santa Cruz, California, says it obtained a temporary restraining order against a Chinese firm for copying its Onewheel electric hoverboard.</p>\r\n\r\n<p>Future Motion Inc. had U.S. marshals seize the company&#39;s assets and marketing materials from the floor of the CES gadget show in Las Vegas on Thursday.</p>\r\n\r\n<p>Future Motion accuses Changzhou First International Trade Co. of patent infringement and obtained the order late Wednesday. Marshals accompanied Future Motion lawyers in the seizure of Changzhou&#39;s &quot;Surfing Electric Scooter.&quot;</p>\r\n\r\n<p>Future Motion lead attorney Shawn Kolitch says the Chinese company&#39;s product was identical to the Onewheel, including a reversible light system that glows different colors depending on the direction of travel.</p>\r\n\r\n<p>A message seeking comment from Changzhou was not immediately returned.</p>\r\n\r\n<p><img alt=\"Onewheel\" src=\"http://i.cbc.ca/1.3395159.1452264202!/fileImage/httpImage/image.jpg_gen/derivatives/original_620/onewheel.jpg\" style=\"width:100%\" /></p>\r\n\r\n<p>U.S. based Future Motion alleges the Chinese company&#39;s product was identical to its one-wheeled hoverboard Onewheel, pictured here, and infringes on its patent. (Onewheel)</p>\r\n\r\n<p><a href=\"http://www.cp.org/\" target=\"_blank\">&copy; The Associated Press, 2016&nbsp;<br />\r\n<img alt=\"The Canadian Press\" src=\"http://www.cbc.ca/gfx/icon_cponline07.gif\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<table cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/facebook-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/twitter-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/reddit-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/plus-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/share-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/email-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"http://www.cbc.ca/news2/feedback/index_typo.html?\" onclick=\"location.href=this.href + document.title + (new Date()); return false;\">Report Typo</a></p>\r\n\r\n<p><a href=\"http://www.cbc.ca/contact/\">Send Feedback</a></p>','2016-01-14 08:33:34','2016-01-14 08:33:34',NULL),(8,1,NULL,1,5,'Control 5','','','2016-01-14 08:34:32','2016-01-14 08:34:32',NULL),(10,1,NULL,2,1,'Control 0001133','<p>A company based in Santa Cruz, California, says it obtained a temporary restraining order against a Chinese firm for copying its Onewheel electric hoverboard.</p>\r\n\r\n<p>Future Motion Inc. had U.S. marshals seize the company&#39;s assets and marketing materials from the floor of the CES gadget show in Las Vegas on Thursday.</p>\r\n\r\n<p>Future Motion accuses Changzhou First International Trade Co. of patent infringement and obtained the order late Wednesday. Marshals accompanied Future Motion lawyers in the seizure of Changzhou&#39;s &quot;Surfing Electric Scooter.&quot;</p>\r\n\r\n<p>Future Motion lead attorney Shawn Kolitch says the Chinese company&#39;s product was identical to the Onewheel, including a reversible light system that glows different colors depending on the direction of travel.</p>\r\n\r\n<p>A message seeking comment from Changzhou was not immediately returned.</p>\r\n\r\n<p><img alt=\"Onewheel\" src=\"http://i.cbc.ca/1.3395159.1452264202!/fileImage/httpImage/image.jpg_gen/derivatives/original_620/onewheel.jpg\" style=\"width:100%\" /></p>\r\n\r\n<p>U.S. based Future Motion alleges the Chinese company&#39;s product was identical to its one-wheeled hoverboard Onewheel, pictured here, and infringes on its patent. (Onewheel)</p>\r\n\r\n<p><a href=\"http://www.cp.org/\" target=\"_blank\">&copy; The Associated Press, 2016&nbsp;<br />\r\n<img alt=\"The Canadian Press\" src=\"http://www.cbc.ca/gfx/icon_cponline07.gif\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<table cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/facebook-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/twitter-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/reddit-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/plus-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/share-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/email-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"http://www.cbc.ca/news2/feedback/index_typo.html?\" onclick=\"location.href=this.href + document.title + (new Date()); return false;\">Report Typo</a></p>\r\n\r\n<p><a href=\"http://www.cbc.ca/contact/\">Send Feedback</a></p>','<p>A company based in Santa Cruz, California, says it obtained a temporary restraining order against a Chinese firm for copying its Onewheel electric hoverboard.</p>\r\n\r\n<p>Future Motion Inc. had U.S. marshals seize the company&#39;s assets and marketing materials from the floor of the CES gadget show in Las Vegas on Thursday.</p>\r\n\r\n<p>Future Motion accuses Changzhou First International Trade Co. of patent infringement and obtained the order late Wednesday. Marshals accompanied Future Motion lawyers in the seizure of Changzhou&#39;s &quot;Surfing Electric Scooter.&quot;</p>\r\n\r\n<p>Future Motion lead attorney Shawn Kolitch says the Chinese company&#39;s product was identical to the Onewheel, including a reversible light system that glows different colors depending on the direction of travel.</p>\r\n\r\n<p>A message seeking comment from Changzhou was not immediately returned.</p>\r\n\r\n<p><img alt=\"Onewheel\" src=\"http://i.cbc.ca/1.3395159.1452264202!/fileImage/httpImage/image.jpg_gen/derivatives/original_620/onewheel.jpg\" style=\"width:100%\" /></p>\r\n\r\n<p>U.S. based Future Motion alleges the Chinese company&#39;s product was identical to its one-wheeled hoverboard Onewheel, pictured here, and infringes on its patent. (Onewheel)</p>\r\n\r\n<p><a href=\"http://www.cp.org/\" target=\"_blank\">&copy; The Associated Press, 2016&nbsp;<br />\r\n<img alt=\"The Canadian Press\" src=\"http://www.cbc.ca/gfx/icon_cponline07.gif\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<table cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/facebook-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/twitter-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/reddit-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/plus-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/share-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n				<td>\r\n				<table cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td>&nbsp;</td>\r\n							<td><img alt=\"\" src=\"http://www.cbc.ca/i/img/theme/default/email-up.png\" /></td>\r\n							<td>&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"http://www.cbc.ca/news2/feedback/index_typo.html?\" onclick=\"location.href=this.href + document.title + (new Date()); return false;\">Report Typo</a></p>\r\n\r\n<p><a href=\"http://www.cbc.ca/contact/\">Send Feedback</a></p>','2016-01-21 08:28:01','2016-01-21 08:28:01',NULL);
/*!40000 ALTER TABLE `controlversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlversion_document`
--

DROP TABLE IF EXISTS `controlversion_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlversion_document` (
  `controlversion_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`controlversion_id`,`document_id`),
  KEY `IDX_FF31CE670230778` (`controlversion_id`),
  KEY `IDX_FF31CE6C33F7837` (`document_id`),
  CONSTRAINT `FK_FF31CE670230778` FOREIGN KEY (`controlversion_id`) REFERENCES `controlversion` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FF31CE6C33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlversion_document`
--

LOCK TABLES `controlversion_document` WRITE;
/*!40000 ALTER TABLE `controlversion_document` DISABLE KEYS */;
INSERT INTO `controlversion_document` VALUES (2,5),(2,6),(4,5),(4,6),(5,5),(5,6),(7,5),(7,6),(10,5),(10,6);
/*!40000 ALTER TABLE `controlversion_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (2,'','teste23',''),(5,'sigedelogo.png','Logo Sigede','image/png'),(6,'PCI_DSS_Risk_Assmt_Guidelines_v1.pdf','PCI DSS Model','application/pdf');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `services` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'TI Group','IT Group');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impact`
--

DROP TABLE IF EXISTS `impact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impact`
--

LOCK TABLES `impact` WRITE;
/*!40000 ALTER TABLE `impact` DISABLE KEYS */;
INSERT INTO `impact` VALUES (1,1,'Very Low'),(2,2,'Low'),(3,3,'Medium'),(4,4,'High'),(5,5,'Very High');
/*!40000 ALTER TABLE `impact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itasset`
--

DROP TABLE IF EXISTS `itasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itasset` (
  `id` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `services` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itasset`
--

LOCK TABLES `itasset` WRITE;
/*!40000 ALTER TABLE `itasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `itasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likelihood`
--

DROP TABLE IF EXISTS `likelihood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likelihood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likelihood`
--

LOCK TABLES `likelihood` WRITE;
/*!40000 ALTER TABLE `likelihood` DISABLE KEYS */;
INSERT INTO `likelihood` VALUES (1,1,'Very Low'),(2,2,'Low'),(3,3,'Medium'),(4,4,'High'),(5,5,'Very High');
/*!40000 ALTER TABLE `likelihood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `services` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationasset`
--

DROP TABLE IF EXISTS `locationasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locationasset` (
  `id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `geolocation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_DF8E9F07BF396750` FOREIGN KEY (`id`) REFERENCES `asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationasset`
--

LOCK TABLES `locationasset` WRITE;
/*!40000 ALTER TABLE `locationasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `locationasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `method`
--

DROP TABLE IF EXISTS `method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) DEFAULT NULL,
  `value` double NOT NULL,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5E593A60235B6D1` (`risk_id`),
  CONSTRAINT `FK_5E593A60235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `method`
--

LOCK TABLES `method` WRITE;
/*!40000 ALTER TABLE `method` DISABLE KEYS */;
INSERT INTO `method` VALUES (2,1,6.8,'cvss'),(3,1,1.5625,'owasp');
/*!40000 ALTER TABLE `method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `methodcvss`
--

DROP TABLE IF EXISTS `methodcvss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `methodcvss` (
  `id` int(11) NOT NULL,
  `attackvector` int(11) NOT NULL,
  `attackcomplexity` int(11) NOT NULL,
  `privilegerequired` int(11) NOT NULL,
  `userinteraction` int(11) NOT NULL,
  `confidentiality` int(11) NOT NULL,
  `integrity` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `scope` int(11) NOT NULL,
  `exploitability` int(11) NOT NULL,
  `remediationlevel` int(11) NOT NULL,
  `reportconfidence` int(11) NOT NULL,
  `reqconfidentiality` int(11) NOT NULL,
  `reqintegrity` int(11) NOT NULL,
  `reqavailability` int(11) NOT NULL,
  `mattackvector` int(11) NOT NULL,
  `mattackcomplexity` int(11) NOT NULL,
  `mprivilegerequired` int(11) NOT NULL,
  `muserinteraction` int(11) NOT NULL,
  `mconfidentiality` int(11) NOT NULL,
  `mintegrity` int(11) NOT NULL,
  `mavailability` int(11) NOT NULL,
  `mscope` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_60C5940BBF396750` FOREIGN KEY (`id`) REFERENCES `method` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `methodcvss`
--

LOCK TABLES `methodcvss` WRITE;
/*!40000 ALTER TABLE `methodcvss` DISABLE KEYS */;
INSERT INTO `methodcvss` VALUES (2,55,77,85,85,22,22,22,752,97,96,100,100,100,100,62,77,85,85,56,56,56,642);
/*!40000 ALTER TABLE `methodcvss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `methodowasp`
--

DROP TABLE IF EXISTS `methodowasp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `methodowasp` (
  `id` int(11) NOT NULL,
  `skilllevel` int(11) NOT NULL,
  `motive` int(11) NOT NULL,
  `opportunity` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `easediscovery` int(11) NOT NULL,
  `easeexploit` int(11) NOT NULL,
  `awareness` int(11) NOT NULL,
  `intrusiondetection` int(11) NOT NULL,
  `lossconfidentiality` int(11) NOT NULL,
  `lossintegrity` int(11) NOT NULL,
  `lossavailability` int(11) NOT NULL,
  `lossaccountability` int(11) NOT NULL,
  `financialdamage` int(11) NOT NULL,
  `reputationdamage` int(11) NOT NULL,
  `noncompliance` int(11) NOT NULL,
  `privacyviolation` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_775B7FD7BF396750` FOREIGN KEY (`id`) REFERENCES `method` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `methodowasp`
--

LOCK TABLES `methodowasp` WRITE;
/*!40000 ALTER TABLE `methodowasp` DISABLE KEYS */;
INSERT INTO `methodowasp` VALUES (3,1,1,1,1,10,1,1,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `methodowasp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `next_process`
--

DROP TABLE IF EXISTS `next_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `next_process` (
  `next_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`next_id`,`id`),
  KEY `IDX_44933234AA23F6C8` (`next_id`),
  KEY `IDX_44933234BF396750` (`id`),
  CONSTRAINT `FK_44933234AA23F6C8` FOREIGN KEY (`next_id`) REFERENCES `processasset` (`id`),
  CONSTRAINT `FK_44933234BF396750` FOREIGN KEY (`id`) REFERENCES `processasset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `next_process`
--

LOCK TABLES `next_process` WRITE;
/*!40000 ALTER TABLE `next_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `next_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strategy_id` int(11) DEFAULT NULL,
  `effort_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `content_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DD5A5B7DD5CAD932` (`strategy_id`),
  KEY `IDX_DD5A5B7D9F2256F` (`effort_id`),
  KEY `IDX_DD5A5B7DF65B3645` (`analyst_id`),
  KEY `IDX_DD5A5B7D6BF700BD` (`status_id`),
  CONSTRAINT `FK_DD5A5B7D6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `planstatus` (`id`),
  CONSTRAINT `FK_DD5A5B7D9F2256F` FOREIGN KEY (`effort_id`) REFERENCES `planeffort` (`id`),
  CONSTRAINT `FK_DD5A5B7DD5CAD932` FOREIGN KEY (`strategy_id`) REFERENCES `planstrategy` (`id`),
  CONSTRAINT `FK_DD5A5B7DF65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,1,1,1,1,'Plan 002','','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_document`
--

DROP TABLE IF EXISTS `plan_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_document` (
  `plan_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`plan_id`,`document_id`),
  KEY `IDX_D60CBD0CE899029B` (`plan_id`),
  KEY `IDX_D60CBD0CC33F7837` (`document_id`),
  CONSTRAINT `FK_D60CBD0CC33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D60CBD0CE899029B` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_document`
--

LOCK TABLES `plan_document` WRITE;
/*!40000 ALTER TABLE `plan_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_planreview`
--

DROP TABLE IF EXISTS `plan_planreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_planreview` (
  `plan_id` int(11) NOT NULL,
  `planreview_id` int(11) NOT NULL,
  PRIMARY KEY (`plan_id`,`planreview_id`),
  KEY `IDX_CDB012B0E899029B` (`plan_id`),
  KEY `IDX_CDB012B01E8BE481` (`planreview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_planreview`
--

LOCK TABLES `plan_planreview` WRITE;
/*!40000 ALTER TABLE `plan_planreview` DISABLE KEYS */;
INSERT INTO `plan_planreview` VALUES (1,1),(1,2),(2,1);
/*!40000 ALTER TABLE `plan_planreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planeffort`
--

DROP TABLE IF EXISTS `planeffort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planeffort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planeffort`
--

LOCK TABLES `planeffort` WRITE;
/*!40000 ALTER TABLE `planeffort` DISABLE KEYS */;
INSERT INTO `planeffort` VALUES (1,'Lowest',5,'Lowest'),(2,'Highest',5,'Highest');
/*!40000 ALTER TABLE `planeffort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planreview`
--

DROP TABLE IF EXISTS `planreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A0DD28A6E899029B` (`plan_id`),
  KEY `IDX_A0DD28A6F65B3645` (`analyst_id`),
  KEY `IDX_A0DD28A66BF700BD` (`status_id`),
  CONSTRAINT `FK_A0DD28A66BF700BD` FOREIGN KEY (`status_id`) REFERENCES `planstatus` (`id`),
  CONSTRAINT `FK_A0DD28A6E899029B` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`),
  CONSTRAINT `FK_A0DD28A6F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planreview`
--

LOCK TABLES `planreview` WRITE;
/*!40000 ALTER TABLE `planreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `planreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planreview_plan`
--

DROP TABLE IF EXISTS `planreview_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planreview_plan` (
  `planreview_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  PRIMARY KEY (`planreview_id`,`plan_id`),
  KEY `IDX_31C8DC0B1E8BE481` (`planreview_id`),
  KEY `IDX_31C8DC0BE899029B` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planreview_plan`
--

LOCK TABLES `planreview_plan` WRITE;
/*!40000 ALTER TABLE `planreview_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `planreview_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planstatus`
--

DROP TABLE IF EXISTS `planstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planstatus`
--

LOCK TABLES `planstatus` WRITE;
/*!40000 ALTER TABLE `planstatus` DISABLE KEYS */;
INSERT INTO `planstatus` VALUES (1,'Cancelled','Cancelled');
/*!40000 ALTER TABLE `planstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planstrategy`
--

DROP TABLE IF EXISTS `planstrategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planstrategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planstrategy`
--

LOCK TABLES `planstrategy` WRITE;
/*!40000 ALTER TABLE `planstrategy` DISABLE KEYS */;
INSERT INTO `planstrategy` VALUES (1,'Mitigate','Mitigate');
/*!40000 ALTER TABLE `planstrategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planversion`
--

DROP TABLE IF EXISTS `planversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planversion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strategy_id` int(11) DEFAULT NULL,
  `effort_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `entity_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `content_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F2772C32D5CAD932` (`strategy_id`),
  KEY `IDX_F2772C329F2256F` (`effort_id`),
  KEY `IDX_F2772C32F65B3645` (`analyst_id`),
  KEY `IDX_F2772C326BF700BD` (`status_id`),
  CONSTRAINT `FK_F2772C326BF700BD` FOREIGN KEY (`status_id`) REFERENCES `planstatus` (`id`),
  CONSTRAINT `FK_F2772C329F2256F` FOREIGN KEY (`effort_id`) REFERENCES `planeffort` (`id`),
  CONSTRAINT `FK_F2772C32D5CAD932` FOREIGN KEY (`strategy_id`) REFERENCES `planstrategy` (`id`),
  CONSTRAINT `FK_F2772C32F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planversion`
--

LOCK TABLES `planversion` WRITE;
/*!40000 ALTER TABLE `planversion` DISABLE KEYS */;
INSERT INTO `planversion` VALUES (1,1,1,1,1,1,'Plan 00122','','',NULL,'2016-01-21 08:31:16','2016-01-21 08:31:16'),(3,1,1,1,1,1,'Plan 002','','',NULL,NULL,NULL),(4,1,1,1,1,1,'Plan 002','','',NULL,NULL,NULL),(5,1,2,1,1,1,'Plan 002','','',NULL,'2016-01-14 11:33:36',NULL),(6,1,1,1,1,1,'Plan 002','','','2016-01-13 08:51:19','2016-01-13 08:51:19',NULL),(7,1,1,1,1,2,'Plan 5','','','2016-01-14 08:40:49','2016-01-14 08:40:49',NULL),(8,1,2,1,1,2,'Plan 5','','','2016-01-14 08:41:00','2016-01-14 08:41:00',NULL),(9,1,2,1,1,2,'Plan 5','','','2016-01-14 08:46:17','2016-01-14 08:46:17',NULL),(10,1,2,1,1,2,'Plan 54','','','2016-01-14 08:46:24','2016-01-14 08:46:24',NULL);
/*!40000 ALTER TABLE `planversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planversion_document`
--

DROP TABLE IF EXISTS `planversion_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planversion_document` (
  `planversion_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`planversion_id`,`document_id`),
  KEY `IDX_292206ECB6FE7B0D` (`planversion_id`),
  KEY `IDX_292206ECC33F7837` (`document_id`),
  CONSTRAINT `FK_292206ECB6FE7B0D` FOREIGN KEY (`planversion_id`) REFERENCES `planversion` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_292206ECC33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planversion_document`
--

LOCK TABLES `planversion_document` WRITE;
/*!40000 ALTER TABLE `planversion_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `planversion_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `previous_process`
--

DROP TABLE IF EXISTS `previous_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `previous_process` (
  `previous_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`previous_id`,`id`),
  KEY `IDX_B78672452DE62210` (`previous_id`),
  KEY `IDX_B7867245BF396750` (`id`),
  CONSTRAINT `FK_B78672452DE62210` FOREIGN KEY (`previous_id`) REFERENCES `processasset` (`id`),
  CONSTRAINT `FK_B7867245BF396750` FOREIGN KEY (`id`) REFERENCES `processasset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `previous_process`
--

LOCK TABLES `previous_process` WRITE;
/*!40000 ALTER TABLE `previous_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `previous_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processasset`
--

DROP TABLE IF EXISTS `processasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processasset` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B063F872727ACA70` (`parent_id`),
  CONSTRAINT `FK_B063F872727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `processasset` (`id`),
  CONSTRAINT `FK_B063F872BF396750` FOREIGN KEY (`id`) REFERENCES `asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processasset`
--

LOCK TABLES `processasset` WRITE;
/*!40000 ALTER TABLE `processasset` DISABLE KEYS */;
INSERT INTO `processasset` VALUES (18,NULL),(19,NULL),(20,NULL);
/*!40000 ALTER TABLE `processasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk`
--

DROP TABLE IF EXISTS `risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `likelihood_id` int(11) DEFAULT NULL,
  `impact_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `content_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7906D5416BF700BD` (`status_id`),
  KEY `IDX_7906D541C54C8C93` (`type_id`),
  KEY `IDX_7906D541D128BC9B` (`impact_id`),
  KEY `IDX_7906D541F65B3645` (`analyst_id`),
  KEY `IDX_7906D54168D34731` (`likelihood_id`),
  CONSTRAINT `FK_7906D54168D34731` FOREIGN KEY (`likelihood_id`) REFERENCES `likelihood` (`id`),
  CONSTRAINT `FK_7906D5416BF700BD` FOREIGN KEY (`status_id`) REFERENCES `riskstatus` (`id`),
  CONSTRAINT `FK_7906D541C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `risktype` (`id`),
  CONSTRAINT `FK_7906D541D128BC9B` FOREIGN KEY (`impact_id`) REFERENCES `impact` (`id`),
  CONSTRAINT `FK_7906D541F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk`
--

LOCK TABLES `risk` WRITE;
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
INSERT INTO `risk` VALUES (1,1,2,3,3,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','0000-00-00 00:00:00','2016-05-04 15:22:23','2016-05-04 15:22:23'),(2,3,11,2,4,3,'Version control problems','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(3,3,11,2,2,3,'Inconsistent documentation','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(4,1,11,5,3,3,'Lack of reporting','','','0000-00-00 00:00:00','2015-12-02 11:39:59',NULL),(5,3,11,2,4,3,'Role confusion','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(6,3,11,1,2,3,'Lack of issue identification','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(7,3,5,3,1,3,'Lack of procedures to secure the systems','','','0000-00-00 00:00:00','2015-12-02 11:40:54',NULL),(8,5,5,5,4,3,'Obsolete controls','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(9,3,4,2,4,3,'Disasters','','','0000-00-00 00:00:00','2015-12-18 15:46:09','2015-12-18 15:46:09'),(10,3,11,2,4,3,'Hardware failure','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(11,5,11,4,3,3,'Software failure','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(12,1,11,3,3,3,'Integration with existing systems','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(13,1,11,1,4,3,'Contingency equipment availability','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(14,5,11,3,4,3,'Lack of skills/knowledge','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(15,5,11,4,3,3,'Not aware of policy/procedures','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(16,5,11,3,3,3,'Changes of personnel','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(17,5,11,3,4,3,'Inability to perform core business activities','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(18,5,11,3,2,3,'Inability to perform non-core business activities','','','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(19,3,16,2,3,3,'User expectations','','','0000-00-00 00:00:00','2015-12-02 11:41:28',NULL),(20,1,4,3,1,1,'Flooding Datacenter','','','0000-00-00 00:00:00','2015-12-02 11:41:14',NULL),(21,3,1,2,5,4,'Network Invasion','','','2015-12-02 11:38:24','2016-05-02 15:19:13','2016-05-02 15:19:13'),(22,1,2,1,3,3,'Unplanned/unapproved changes','','<p>&gt;&gt;&gt;&gt;&gt; TESTE &gt;&gt;&gt;&gt;&gt;&gt;</p>','2015-12-02 16:44:20','2015-12-02 16:44:20',NULL),(23,5,17,5,2,5,'Unplastic123','<p>TSTESSS</p>','<p>&gt;&gt;&gt;&gt;&gt; TESTE&nbsp;</p>\r\n\r\n<p>asdfasdf</p>\r\n\r\n<p>asdf</p>\r\n\r\n<p>as</p>\r\n\r\n<p>df</p>\r\n\r\n<p>asd</p>\r\n\r\n<p>fa</p>\r\n\r\n<p>sd</p>','2015-12-02 16:44:35','2016-01-19 16:10:58','2016-01-19 16:10:58'),(24,1,1,1,1,1,'TESTE REVESION','<p>UAIS</p>','','2015-12-02 18:57:23','2015-12-02 18:57:23',NULL),(25,1,1,1,1,1,'TESTE REVESION','<p>UAIS</p>','','2015-12-02 18:57:59','2015-12-02 18:57:59',NULL),(26,2,1,3,1,5,'TESTE REVISION','','','2015-12-02 19:45:43','2015-12-18 14:49:10','2015-12-18 14:49:10');
/*!40000 ALTER TABLE `risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_asset`
--

DROP TABLE IF EXISTS `risk_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_asset` (
  `risk_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`risk_id`,`asset_id`),
  KEY `IDX_73CD9323235B6D1` (`risk_id`),
  KEY `IDX_73CD93235DA1941` (`asset_id`),
  CONSTRAINT `FK_73CD9323235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_73CD93235DA1941` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_asset`
--

LOCK TABLES `risk_asset` WRITE;
/*!40000 ALTER TABLE `risk_asset` DISABLE KEYS */;
INSERT INTO `risk_asset` VALUES (1,6),(1,7),(1,8),(1,9),(2,6),(2,8),(2,12),(3,1),(4,14),(4,15),(4,16),(5,2),(7,1),(7,9),(9,1),(9,2),(10,15),(11,2),(11,3),(11,5),(11,15),(12,3),(12,15),(13,15),(14,2),(14,13),(15,14),(16,12),(17,2),(17,4),(17,11),(18,10),(19,5),(19,9),(20,1),(20,2),(20,3),(20,4),(22,6),(22,7),(22,8),(22,9),(23,3),(24,1),(25,1);
/*!40000 ALTER TABLE `risk_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_compliance`
--

DROP TABLE IF EXISTS `risk_compliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_compliance` (
  `risk_id` int(11) NOT NULL,
  `compliance_id` int(11) NOT NULL,
  PRIMARY KEY (`risk_id`,`compliance_id`),
  KEY `IDX_A9797CB8235B6D1` (`risk_id`),
  KEY `IDX_A9797CB8AA24AB19` (`compliance_id`),
  CONSTRAINT `FK_A9797CB8235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A9797CB8AA24AB19` FOREIGN KEY (`compliance_id`) REFERENCES `compliance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_compliance`
--

LOCK TABLES `risk_compliance` WRITE;
/*!40000 ALTER TABLE `risk_compliance` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_compliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_control`
--

DROP TABLE IF EXISTS `risk_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_control` (
  `risk_id` int(11) NOT NULL,
  `control_id` int(11) NOT NULL,
  PRIMARY KEY (`risk_id`,`control_id`),
  KEY `IDX_A7C44204235B6D1` (`risk_id`),
  KEY `IDX_A7C4420432BEC70E` (`control_id`),
  CONSTRAINT `FK_A7C44204235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A7C4420432BEC70E` FOREIGN KEY (`control_id`) REFERENCES `control` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_control`
--

LOCK TABLES `risk_control` WRITE;
/*!40000 ALTER TABLE `risk_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_document`
--

DROP TABLE IF EXISTS `risk_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_document` (
  `risk_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`risk_id`,`document_id`),
  KEY `IDX_3E40C919235B6D1` (`risk_id`),
  KEY `IDX_3E40C919C33F7837` (`document_id`),
  CONSTRAINT `FK_3E40C919235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3E40C919C33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_document`
--

LOCK TABLES `risk_document` WRITE;
/*!40000 ALTER TABLE `risk_document` DISABLE KEYS */;
INSERT INTO `risk_document` VALUES (1,5),(1,6);
/*!40000 ALTER TABLE `risk_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_threat`
--

DROP TABLE IF EXISTS `risk_threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_threat` (
  `risk_id` int(11) NOT NULL,
  `threat_id` int(11) NOT NULL,
  PRIMARY KEY (`risk_id`,`threat_id`),
  KEY `IDX_EC5C5283235B6D1` (`risk_id`),
  KEY `IDX_EC5C5283B2891786` (`threat_id`),
  CONSTRAINT `FK_EC5C5283235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EC5C5283B2891786` FOREIGN KEY (`threat_id`) REFERENCES `threat` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_threat`
--

LOCK TABLES `risk_threat` WRITE;
/*!40000 ALTER TABLE `risk_threat` DISABLE KEYS */;
INSERT INTO `risk_threat` VALUES (1,1),(1,3),(23,3),(24,1),(25,1);
/*!40000 ALTER TABLE `risk_threat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_vulnerability`
--

DROP TABLE IF EXISTS `risk_vulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_vulnerability` (
  `risk_id` int(11) NOT NULL,
  `vulnerability_id` int(11) NOT NULL,
  PRIMARY KEY (`risk_id`,`vulnerability_id`),
  KEY `IDX_C1357E0D235B6D1` (`risk_id`),
  KEY `IDX_C1357E0D72897D8B` (`vulnerability_id`),
  CONSTRAINT `FK_C1357E0D235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C1357E0D72897D8B` FOREIGN KEY (`vulnerability_id`) REFERENCES `vulnerability` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_vulnerability`
--

LOCK TABLES `risk_vulnerability` WRITE;
/*!40000 ALTER TABLE `risk_vulnerability` DISABLE KEYS */;
INSERT INTO `risk_vulnerability` VALUES (1,1),(1,2),(1,3),(23,5),(24,1),(25,1);
/*!40000 ALTER TABLE `risk_vulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskmethod`
--

DROP TABLE IF EXISTS `riskmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskmethod`
--

LOCK TABLES `riskmethod` WRITE;
/*!40000 ALTER TABLE `riskmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `riskmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskreview`
--

DROP TABLE IF EXISTS `riskreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8219A425235B6D1` (`risk_id`),
  KEY `IDX_8219A425F65B3645` (`analyst_id`),
  KEY `IDX_8219A4256BF700BD` (`status_id`),
  CONSTRAINT `FK_8219A425235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`),
  CONSTRAINT `FK_8219A4256BF700BD` FOREIGN KEY (`status_id`) REFERENCES `riskstatus` (`id`),
  CONSTRAINT `FK_8219A425F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskreview`
--

LOCK TABLES `riskreview` WRITE;
/*!40000 ALTER TABLE `riskreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `riskreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskstatus`
--

DROP TABLE IF EXISTS `riskstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskstatus`
--

LOCK TABLES `riskstatus` WRITE;
/*!40000 ALTER TABLE `riskstatus` DISABLE KEYS */;
INSERT INTO `riskstatus` VALUES (1,'Untreated',''),(2,'Planned',''),(3,'Treated',''),(4,'Obsolete',''),(5,'Irrelevant','');
/*!40000 ALTER TABLE `riskstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risktype`
--

DROP TABLE IF EXISTS `risktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risktype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risktype`
--

LOCK TABLES `risktype` WRITE;
/*!40000 ALTER TABLE `risktype` DISABLE KEYS */;
INSERT INTO `risktype` VALUES (1,'Accounting risk',''),(2,'Brand risk',''),(3,'Credit risk',''),(4,'Environmental risk',''),(5,'Innovational or technical obsolesce risk',''),(6,'Legal riskInflation and recession risk',''),(7,'Liability risk',''),(8,'Longevity',''),(9,'Market risk',''),(10,'Mortality and morbidity risk',''),(11,'Operational risk',''),(12,'Physical damage risk',''),(13,'Political risk',''),(14,'Product risk',''),(15,'Regulatory risk',''),(16,'Reputational risk',''),(17,'Strategic risk',''),(18,'TESTE REVISION 001','<p>asdf asfas</p>');
/*!40000 ALTER TABLE `risktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskversion`
--

DROP TABLE IF EXISTS `riskversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskversion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `likelihood_id` int(11) DEFAULT NULL,
  `impact_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `content_changed` datetime DEFAULT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_86E43A246BF700BD` (`status_id`),
  KEY `IDX_86E43A24C54C8C93` (`type_id`),
  KEY `IDX_86E43A2468D34731` (`likelihood_id`),
  KEY `IDX_86E43A24D128BC9B` (`impact_id`),
  KEY `IDX_86E43A24F65B3645` (`analyst_id`),
  CONSTRAINT `FK_86E43A2468D34731` FOREIGN KEY (`likelihood_id`) REFERENCES `likelihood` (`id`),
  CONSTRAINT `FK_86E43A246BF700BD` FOREIGN KEY (`status_id`) REFERENCES `riskstatus` (`id`),
  CONSTRAINT `FK_86E43A24C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `risktype` (`id`),
  CONSTRAINT `FK_86E43A24D128BC9B` FOREIGN KEY (`impact_id`) REFERENCES `impact` (`id`),
  CONSTRAINT `FK_86E43A24F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskversion`
--

LOCK TABLES `riskversion` WRITE;
/*!40000 ALTER TABLE `riskversion` DISABLE KEYS */;
INSERT INTO `riskversion` VALUES (1,1,2,1,3,3,'Unplanned/unapproved changes','','<p>&gt;&gt;&gt;&gt;&gt; TESTE &gt;&gt;&gt;&gt;&gt;&gt;</p>','2015-12-02 17:09:17','2015-12-02 17:09:17',NULL,0),(2,1,2,1,3,3,'Unpla','<p>qwreqwr wq</p>','<p>&gt;&gt;&gt;&gt;&gt; TESTE &gt;&gt;&gt;&gt;&gt;&gt;</p>','2015-12-02 17:10:36','2015-12-02 17:10:36',NULL,0),(3,1,2,1,3,3,'Unpla','<p>TSTESSS</p>','<p>&gt;&gt;&gt;&gt;&gt; TESTE &gt;&gt;&gt;&gt;&gt;&gt;</p>','2015-12-02 17:11:19','2015-12-02 17:11:19',NULL,0),(4,1,1,3,4,3,'Unpla','<p>TSTESSS</p>','<p>&gt;&gt;&gt;&gt;&gt; TESTE &gt;&gt;&gt;&gt;&gt;&gt;</p>','2015-12-02 17:11:31','2015-12-03 18:46:54','2015-12-03 18:46:54',0),(5,1,1,1,3,3,'Unplastic','<p>TSTESSS</p>','<p>&gt;&gt;&gt;&gt;&gt; TESTE &gt;&gt;&gt;&gt;&gt;&gt;</p>','2015-12-02 17:11:43','2015-12-02 17:11:43',NULL,0),(6,5,17,5,5,5,'Unplastic123','<p>TSTESSS</p>','<p>&gt;&gt;&gt;&gt;&gt; TESTE&nbsp;</p>\r\n\r\n<p>asdfasdf</p>\r\n\r\n<p>asdf</p>\r\n\r\n<p>as</p>\r\n\r\n<p>df</p>\r\n\r\n<p>asd</p>\r\n\r\n<p>fa</p>\r\n\r\n<p>sd</p>','2015-12-02 17:14:54','2015-12-02 17:14:54',NULL,0),(7,5,17,5,5,5,'Unp34','<p>TSTESSS</p>','<p>&gt;&gt;&gt;&gt;&gt; TESTE&nbsp;</p>\r\n\r\n<p>asdfasdf</p>\r\n\r\n<p>asdf</p>\r\n\r\n<p>as</p>\r\n\r\n<p>df</p>\r\n\r\n<p>asd</p>\r\n\r\n<p>fa</p>\r\n\r\n<p>sd</p>','2015-12-02 17:20:42','2016-01-21 08:34:11','2016-01-21 08:34:11',1),(8,5,17,5,5,5,'Unplastic123','<p>TSTESSS</p>','<p>&gt;&gt;&gt;&gt;&gt; TESTE&nbsp;</p>\r\n\r\n<p>asdfasdf</p>\r\n\r\n<p>asdf</p>\r\n\r\n<p>as</p>\r\n\r\n<p>df</p>\r\n\r\n<p>asd</p>\r\n\r\n<p>fa</p>\r\n\r\n<p>sd</p>','2015-12-02 17:21:41','2015-12-02 17:21:41',NULL,23),(9,3,4,1,5,3,'Disasters','','','2015-12-02 17:21:51','2015-12-02 17:21:51',NULL,9),(10,1,4,3,1,1,'Flooding Datacenter','','','2015-12-02 17:34:48','2015-12-02 17:34:48',NULL,20),(12,1,1,1,1,1,'TESTE REVESION','<p>UAIS</p>','','2015-12-02 18:57:59','2015-12-02 18:57:59',NULL,25),(13,1,1,1,1,1,'TESTE REVISION','','','2015-12-02 19:45:43','2015-12-02 19:45:43',NULL,26),(14,2,1,1,1,1,'TESTE REVISION','','','2015-12-02 19:46:05','2015-12-02 19:46:05',NULL,26),(15,2,1,3,3,5,'TESTE REVISION','','','2015-12-02 19:46:33','2015-12-03 17:42:19','2015-12-03 17:42:19',26),(16,5,17,5,5,5,'Unplastic123','<p>TSTESSS</p>','<p>&gt;&gt;&gt;&gt;&gt; TESTE&nbsp;</p>\r\n\r\n<p>asdfasdf</p>\r\n\r\n<p>asdf</p>\r\n\r\n<p>as</p>\r\n\r\n<p>df</p>\r\n\r\n<p>asd</p>\r\n\r\n<p>fa</p>\r\n\r\n<p>sd</p>','2015-12-03 09:41:14','2015-12-03 09:41:14',NULL,23),(17,2,1,2,2,5,'TESTE REVISION','','','2015-12-03 09:42:03','2015-12-03 17:53:38','2015-12-03 17:53:38',26),(18,2,1,5,3,5,'TESTE REVISION','','','2015-12-03 09:42:10','2015-12-03 17:46:14','2015-12-03 17:46:14',26),(19,1,2,1,3,3,'unapproved changes','','<p>&gt;&gt;&gt;&gt;&gt; TESTE &gt;&gt;&gt;&gt;&gt;&gt;</p>','2015-12-03 09:43:08','2016-01-21 08:38:39','2016-01-21 08:38:39',1),(20,2,1,2,3,5,'TESTE REVISION','','','2015-12-03 17:22:38','2015-12-03 17:45:39','2015-12-03 17:45:39',26),(21,1,2,2,3,3,'Unplanned/unapproved','','<p>&gt;&gt;&gt;&gt;&gt; TESTE &gt;&gt;&gt;&gt;&gt;&gt;</p>','2015-12-07 11:01:37','2016-01-21 08:40:43','2016-01-21 08:40:43',1),(22,2,1,3,1,5,'TESTE REVISION','','','2015-12-18 14:49:10','2015-12-18 14:49:10',NULL,26),(23,3,4,2,4,3,'Disasters','','','2015-12-18 15:46:09','2015-12-18 15:46:09',NULL,9),(24,1,2,2,3,3,'Unplanned/unapproved changes','','<p>&gt;&gt;&gt;&gt;&gt; TESTE &gt;&gt;&gt;&gt;&gt;&gt;</p>','2015-12-18 16:23:28','2015-12-18 16:23:28',NULL,1),(25,3,11,2,4,3,'Version control problems','','','2015-12-18 16:28:58','2015-12-18 16:28:58',NULL,2),(26,1,2,2,3,3,'Unplanned/unapproved changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<h3>Table: Example Risk Factor Chart</h3>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2015-12-18 16:30:21','2015-12-18 16:30:21',NULL,1),(27,1,2,2,3,3,'Unplanned/unapproved changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<h3>Table: Example Risk Factor Chart</h3>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2015-12-18 16:39:51','2015-12-18 16:39:51',NULL,1),(28,1,2,2,3,3,'Unplanned/unapproved changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<h3>Table: Example Risk Factor Chart</h3>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2015-12-18 16:40:20','2015-12-18 16:40:20',NULL,1),(29,1,2,2,3,3,'Unplanned/unapproved changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2015-12-18 16:41:28','2015-12-18 16:41:28',NULL,1),(30,1,2,2,3,3,'Unplanned/unapproved changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2015-12-18 16:42:59','2015-12-18 16:42:59',NULL,1),(31,1,2,5,3,3,'Unplanned/unapproved changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2015-12-21 09:11:16','2015-12-21 09:11:16',NULL,1),(32,3,5,3,1,3,'Lack of procedures to secure the systems','','','2015-12-21 12:17:51','2015-12-21 12:17:51',NULL,7),(33,2,1,3,1,5,'TESTE REVISION','','','2015-12-21 12:18:38','2015-12-21 12:18:38',NULL,26),(34,1,2,5,3,3,'Unplanned/unapproved changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2015-12-22 16:20:16','2015-12-22 16:20:16',NULL,1),(35,1,2,5,3,3,'Unplanned/unapproved changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2015-12-22 16:34:44','2015-12-22 16:34:44',NULL,1),(36,1,2,5,3,3,'Unplanned/unapproved changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-01-04 15:02:10','2016-01-04 15:02:10',NULL,1),(38,1,2,4,4,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-01-08 17:00:36','2016-01-08 17:00:36',NULL,1),(39,1,2,5,5,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-01-08 17:06:17','2016-01-08 17:06:17',NULL,1),(41,1,1,1,2,1,'TESTE REVISION111','','','2016-01-08 17:40:30','2016-01-08 17:40:30',NULL,27),(42,1,1,3,2,1,'TESTE REVISION111','','','2016-01-08 17:40:51','2016-01-08 17:40:51',NULL,27),(43,1,2,3,2,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-01-11 17:35:51','2016-01-11 17:35:51',NULL,1),(44,1,2,3,2,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-01-11 18:56:55','2016-01-11 18:56:55',NULL,1),(45,5,17,5,2,5,'Unplastic123','<p>TSTESSS</p>','<p>&gt;&gt;&gt;&gt;&gt; TESTE&nbsp;</p>\r\n\r\n<p>asdfasdf</p>\r\n\r\n<p>asdf</p>\r\n\r\n<p>as</p>\r\n\r\n<p>df</p>\r\n\r\n<p>asd</p>\r\n\r\n<p>fa</p>\r\n\r\n<p>sd</p>','2016-01-19 16:10:58','2016-01-19 16:10:58',NULL,23),(46,1,2,3,2,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-01-19 16:14:52','2016-01-19 16:14:52',NULL,1),(47,1,2,3,2,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-01-20 16:20:35','2016-01-20 16:20:35',NULL,1),(48,1,2,3,2,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-01-20 16:23:06','2016-01-20 16:23:06',NULL,1),(49,1,2,3,1,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-01-20 16:23:19','2016-01-20 16:23:19',NULL,1),(50,1,2,5,5,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-01-20 16:23:42','2016-01-20 16:23:42',NULL,1),(52,1,1,1,1,1,'Risk 009','','','2016-01-20 16:29:06','2016-01-20 16:29:06',NULL,28),(53,1,1,1,1,1,'Risk 008','','','2016-01-20 16:29:52','2016-01-20 16:29:52',NULL,29),(54,1,1,3,1,1,'Risk 008','','','2016-01-20 16:30:06','2016-01-20 16:30:06',NULL,29),(55,1,2,1,4,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-04-26 09:54:04','2016-04-26 09:54:04',NULL,1),(56,3,1,5,5,4,'Network Invasion','','','2016-05-02 15:18:39','2016-05-02 15:18:39',NULL,21),(57,3,1,2,5,4,'Network Invasion','','','2016-05-02 15:19:13','2016-05-02 15:19:13',NULL,21),(58,1,2,1,3,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-05-02 15:19:43','2016-05-02 15:19:43',NULL,1),(59,1,2,1,3,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-05-03 15:35:34','2016-05-03 15:35:34',NULL,1),(60,1,2,3,3,3,'Unplanned Changes','<h2>Risk Exposure</h2>\r\n\r\n<p>Risk exposure measures the overall threat of the risk, combining the likelihood of actual loss (probability) with the magnitude of the potential loss (impact) into a single numeric value. In the simplest form of quantitative risk analysis, risk exposure is calculated by multiplying risk probability by impact.</p>\r\n\r\n<p>Exposure = Probability x Impact</p>\r\n\r\n<p>Sometimes a high-probability risk has low impact and can be safely ignored; sometimes a high-impact risk has low probability and can be safely ignored. The risks that have high probability and high impact are the ones most worth managing, and they are the ones that produce the highest exposure values.</p>\r\n\r\n<p>When scores are used to quantify probability and impact, it is sometimes convenient to create a matrix that considers the possible combinations of scores and then assigns them to low-risk, medium-risk, and high-risk categories. For the use of a tripartite probability score where 1 is low and 3 is high, the possible results may be expressed in the form of a table where each cell is a possible value for risk exposure. In this arrangement, it is easy to classify risks as low, medium, or high depending on their position within the table. The following table is an example showing probability and impact.</p>\r\n\r\n<p><img alt=\"Cc535373.a5411c26-0047-49c6-8aaf-324a6372498d(en-us,TechNet.10).gif\" src=\"https://i-technet.sec.s-msft.com/dynimg/IC119649.gif\" /></p>\r\n\r\n<p>The advantage of this tabular format is that it is easy to understand through its use of colors (red for the high-risk zone in the upper-right corner, green for low risk in the lower-left corner, and yellow for medium risk along the diagonal). It also uses a well-defined terminology: &quot;High risk&quot; is easier to comprehend than &quot;high exposure.&quot;</p>\r\n\r\n<p>Risk analysis provides a prioritized risk list to guide IT operations in risk planning activities. Within the MOF Risk Management Discipline, this is called the master risks list (described previously in&nbsp;<a href=\"https://technet.microsoft.com/en-us/library/cc546824.aspx\">Risk Lists</a>). Detailed risk information including condition, context, root cause, and the metrics used for prioritization (probability, impact, exposure) are often recorded for each risk in the risk statement form.</p>','<h2>Best Practices</h2>\r\n\r\n<p>These best practices will be beneficial during the risk analysis and prioritization step of the risk management process.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Risk Factor Charts</h2>\r\n\r\n<p>A risk factor chart helps the group quickly determine the exposure it faces for all general categories of risk. One line of such a chart might look like the row in the following table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Table: Example Risk Factor Chart</h2>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Risk</th>\r\n			<th>Indicators of High Exposure</th>\r\n			<th>Indicators of Medium Exposure</th>\r\n			<th>Indicators of Low Exposure</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>When a hard disk fails, its data cannot be recovered from tape backup.</p>\r\n			</td>\r\n			<td>\r\n			<p>No one is formally accountable for performing backups. Only one operator has been trained on the new version of the software. The backup operator who has been trained cannot be reached except during his/her shift.</p>\r\n			</td>\r\n			<td>\r\n			<p>Managers ensure that backups are made every day, but making them is a low-status job assigned to operators with the least seniority. All backup operators attend a one-hour class, but that training covers only the backup software User&#39;s Guide and it has no hands-on exercises.</p>\r\n			</td>\r\n			<td>\r\n			<p>Each week&#39;s tapes are sampled and restored to verify integrity. Two backup operators are on shift at all times. Only backup operators who have vendor certification are allowed to make backups without supervision.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Settle Differences of Opinion</h2>\r\n\r\n<p>It is unlikely that all IT operations staff will agree on risk ranking because staff members with different experiences or viewpoints will rate probability and impact differently. To maintain objectivity in the discussion and to limit arguments, be sure to decide as a group how to resolve these differences before starting this step. Options include a majority-rule vote, picking the worst-case estimate, or siding with the person who has the longest experience dealing with the situation in which the risk event actually occurs.</p>','2016-05-04 15:22:23','2016-05-04 15:22:23',NULL,1);
/*!40000 ALTER TABLE `riskversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskversion_asset`
--

DROP TABLE IF EXISTS `riskversion_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskversion_asset` (
  `riskversion_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`riskversion_id`,`asset_id`),
  KEY `IDX_439EE09ADBCBD392` (`riskversion_id`),
  KEY `IDX_439EE09A5DA1941` (`asset_id`),
  CONSTRAINT `FK_439EE09A5DA1941` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_439EE09ADBCBD392` FOREIGN KEY (`riskversion_id`) REFERENCES `riskversion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskversion_asset`
--

LOCK TABLES `riskversion_asset` WRITE;
/*!40000 ALTER TABLE `riskversion_asset` DISABLE KEYS */;
INSERT INTO `riskversion_asset` VALUES (1,6),(1,7),(1,8),(1,9),(2,6),(2,7),(2,8),(2,9),(3,6),(3,7),(3,8),(3,9),(4,6),(4,7),(4,8),(4,9),(5,6),(5,7),(5,8),(5,9),(6,3),(6,4),(6,6),(6,7),(6,8),(6,9),(7,3),(7,4),(7,6),(7,7),(7,8),(7,9),(8,3),(8,4),(8,6),(8,7),(8,8),(8,9),(9,1),(9,2),(10,1),(10,2),(10,3),(10,4),(12,1),(16,3),(19,6),(19,7),(19,8),(19,9),(21,6),(21,7),(21,8),(21,9),(23,1),(23,2),(24,6),(24,7),(24,8),(24,9),(25,6),(25,8),(25,12),(26,6),(26,7),(26,8),(26,9),(27,6),(27,7),(27,8),(27,9),(28,6),(28,7),(28,8),(28,9),(29,6),(29,7),(29,8),(29,9),(30,6),(30,7),(30,8),(30,9),(31,6),(31,7),(31,8),(31,9),(32,1),(32,9),(34,6),(34,7),(34,8),(34,9),(35,6),(35,7),(35,8),(35,9),(36,6),(36,7),(36,8),(36,9),(38,6),(38,7),(38,8),(38,9),(39,6),(39,7),(39,8),(39,9),(43,6),(43,7),(43,8),(43,9),(44,6),(44,7),(44,8),(44,9),(45,3),(46,6),(46,7),(46,8),(46,9),(47,6),(47,7),(47,8),(47,9),(48,6),(48,7),(48,8),(48,9),(49,6),(49,7),(49,8),(49,9),(50,6),(50,7),(50,8),(50,9),(55,6),(55,7),(55,8),(55,9),(58,6),(58,7),(58,8),(58,9),(59,6),(59,7),(59,8),(59,9),(60,6),(60,7),(60,8),(60,9);
/*!40000 ALTER TABLE `riskversion_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskversion_compliance`
--

DROP TABLE IF EXISTS `riskversion_compliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskversion_compliance` (
  `riskversion_id` int(11) NOT NULL,
  `compliance_id` int(11) NOT NULL,
  PRIMARY KEY (`riskversion_id`,`compliance_id`),
  KEY `IDX_7C98BFB5DBCBD392` (`riskversion_id`),
  KEY `IDX_7C98BFB5AA24AB19` (`compliance_id`),
  CONSTRAINT `FK_7C98BFB5AA24AB19` FOREIGN KEY (`compliance_id`) REFERENCES `compliance` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7C98BFB5DBCBD392` FOREIGN KEY (`riskversion_id`) REFERENCES `riskversion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskversion_compliance`
--

LOCK TABLES `riskversion_compliance` WRITE;
/*!40000 ALTER TABLE `riskversion_compliance` DISABLE KEYS */;
/*!40000 ALTER TABLE `riskversion_compliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskversion_control`
--

DROP TABLE IF EXISTS `riskversion_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskversion_control` (
  `riskversion_id` int(11) NOT NULL,
  `control_id` int(11) NOT NULL,
  PRIMARY KEY (`riskversion_id`,`control_id`),
  KEY `IDX_5BCF4720DBCBD392` (`riskversion_id`),
  KEY `IDX_5BCF472032BEC70E` (`control_id`),
  CONSTRAINT `FK_5BCF472032BEC70E` FOREIGN KEY (`control_id`) REFERENCES `control` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5BCF4720DBCBD392` FOREIGN KEY (`riskversion_id`) REFERENCES `riskversion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskversion_control`
--

LOCK TABLES `riskversion_control` WRITE;
/*!40000 ALTER TABLE `riskversion_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `riskversion_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskversion_document`
--

DROP TABLE IF EXISTS `riskversion_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskversion_document` (
  `riskversion_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`riskversion_id`,`document_id`),
  KEY `IDX_2BF26CDDBCBD392` (`riskversion_id`),
  KEY `IDX_2BF26CDC33F7837` (`document_id`),
  CONSTRAINT `FK_2BF26CDC33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2BF26CDDBCBD392` FOREIGN KEY (`riskversion_id`) REFERENCES `riskversion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskversion_document`
--

LOCK TABLES `riskversion_document` WRITE;
/*!40000 ALTER TABLE `riskversion_document` DISABLE KEYS */;
INSERT INTO `riskversion_document` VALUES (38,5),(38,6),(39,5),(39,6),(43,5),(43,6),(44,5),(44,6),(46,5),(46,6),(47,5),(47,6),(48,5),(48,6),(49,5),(49,6),(50,5),(50,6),(55,5),(55,6),(58,5),(58,6),(59,5),(59,6),(60,5),(60,6);
/*!40000 ALTER TABLE `riskversion_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskversion_threat`
--

DROP TABLE IF EXISTS `riskversion_threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskversion_threat` (
  `riskversion_id` int(11) NOT NULL,
  `threat_id` int(11) NOT NULL,
  PRIMARY KEY (`riskversion_id`,`threat_id`),
  KEY `IDX_5ED10AD8DBCBD392` (`riskversion_id`),
  KEY `IDX_5ED10AD8B2891786` (`threat_id`),
  CONSTRAINT `FK_5ED10AD8B2891786` FOREIGN KEY (`threat_id`) REFERENCES `threat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5ED10AD8DBCBD392` FOREIGN KEY (`riskversion_id`) REFERENCES `riskversion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskversion_threat`
--

LOCK TABLES `riskversion_threat` WRITE;
/*!40000 ALTER TABLE `riskversion_threat` DISABLE KEYS */;
INSERT INTO `riskversion_threat` VALUES (6,3),(6,4),(6,5),(6,6),(7,3),(7,4),(7,5),(7,6),(8,3),(8,4),(8,5),(8,6),(12,1),(16,3),(26,1),(26,3),(27,1),(27,3),(28,1),(28,3),(29,1),(29,3),(30,1),(30,3),(31,1),(31,3),(34,1),(34,3),(35,1),(35,3),(36,1),(36,3),(38,1),(38,3),(39,1),(39,3),(43,1),(43,3),(44,1),(44,3),(45,3),(46,1),(46,3),(47,1),(47,3),(48,1),(48,3),(49,1),(49,3),(50,1),(50,3),(55,1),(55,3),(58,1),(58,3),(59,1),(59,3),(60,1),(60,3);
/*!40000 ALTER TABLE `riskversion_threat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskversion_vulnerability`
--

DROP TABLE IF EXISTS `riskversion_vulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskversion_vulnerability` (
  `riskversion_id` int(11) NOT NULL,
  `vulnerability_id` int(11) NOT NULL,
  PRIMARY KEY (`riskversion_id`,`vulnerability_id`),
  KEY `IDX_FE37BBE8DBCBD392` (`riskversion_id`),
  KEY `IDX_FE37BBE872897D8B` (`vulnerability_id`),
  CONSTRAINT `FK_FE37BBE872897D8B` FOREIGN KEY (`vulnerability_id`) REFERENCES `vulnerability` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FE37BBE8DBCBD392` FOREIGN KEY (`riskversion_id`) REFERENCES `riskversion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskversion_vulnerability`
--

LOCK TABLES `riskversion_vulnerability` WRITE;
/*!40000 ALTER TABLE `riskversion_vulnerability` DISABLE KEYS */;
INSERT INTO `riskversion_vulnerability` VALUES (6,5),(6,6),(6,7),(6,8),(6,9),(7,5),(7,6),(7,7),(7,8),(7,9),(8,5),(8,6),(8,7),(8,8),(8,9),(12,1),(16,5),(26,1),(26,2),(26,3),(27,1),(27,2),(27,3),(28,1),(28,2),(28,3),(29,1),(29,2),(29,3),(30,1),(30,2),(30,3),(31,1),(31,2),(31,3),(34,1),(34,2),(34,3),(35,1),(35,2),(35,3),(36,1),(36,2),(36,3),(38,1),(38,2),(38,3),(39,1),(39,2),(39,3),(43,1),(43,2),(43,3),(44,1),(44,2),(44,3),(45,5),(46,1),(46,2),(46,3),(47,1),(47,2),(47,3),(48,1),(48,2),(48,3),(49,1),(49,2),(49,3),(50,1),(50,2),(50,3),(55,1),(55,2),(55,3),(58,1),(58,2),(58,3),(59,1),(59,2),(59,3),(60,1),(60,2),(60,3);
/*!40000 ALTER TABLE `riskversion_vulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serverasset`
--

DROP TABLE IF EXISTS `serverasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serverasset` (
  `id` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_D40A5BA7BF396750` FOREIGN KEY (`id`) REFERENCES `asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serverasset`
--

LOCK TABLES `serverasset` WRITE;
/*!40000 ALTER TABLE `serverasset` DISABLE KEYS */;
INSERT INTO `serverasset` VALUES (1,'1.1.1.1'),(2,'1.1.1.2'),(3,'1.1.1.3'),(4,'1.1.1.4'),(5,'1.1.1.5'),(6,'1.1.1.6'),(7,'1.1.1.7'),(8,'1.1.1.8'),(9,'1.1.1.9'),(10,'1.1.1.10'),(11,'1.1.1.11'),(12,'1.1.1.12'),(13,'1.1.1.13'),(14,'1.1.1.14'),(15,'1.1.1.15'),(16,'1.1.1.33'),(17,'10.1.1.1'),(21,'1.1.1.1'),(22,'0.0.0.0'),(23,'0.0.0.0'),(24,'1.1.1.1'),(25,'1.1.1.2'),(26,'1.1.1.2'),(27,'1.1.1.1');
/*!40000 ALTER TABLE `serverasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serverasset_serviceasset`
--

DROP TABLE IF EXISTS `serverasset_serviceasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serverasset_serviceasset` (
  `serverasset_id` int(11) NOT NULL,
  `serviceasset_id` int(11) NOT NULL,
  PRIMARY KEY (`serverasset_id`,`serviceasset_id`),
  KEY `IDX_5C491D0D3ECE380` (`serverasset_id`),
  KEY `IDX_5C491D0DBE16AAA0` (`serviceasset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serverasset_serviceasset`
--

LOCK TABLES `serverasset_serviceasset` WRITE;
/*!40000 ALTER TABLE `serverasset_serviceasset` DISABLE KEYS */;
INSERT INTO `serverasset_serviceasset` VALUES (40,46);
/*!40000 ALTER TABLE `serverasset_serviceasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviceasset`
--

DROP TABLE IF EXISTS `serviceasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviceasset` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_91C99EABBF396750` FOREIGN KEY (`id`) REFERENCES `asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceasset`
--

LOCK TABLES `serviceasset` WRITE;
/*!40000 ALTER TABLE `serviceasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `serviceasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviceasset_processasset`
--

DROP TABLE IF EXISTS `serviceasset_processasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviceasset_processasset` (
  `serviceasset_id` int(11) NOT NULL,
  `processasset_id` int(11) NOT NULL,
  PRIMARY KEY (`serviceasset_id`,`processasset_id`),
  KEY `IDX_6F86EBBABE16AAA0` (`serviceasset_id`),
  KEY `IDX_6F86EBBA39EA22E9` (`processasset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceasset_processasset`
--

LOCK TABLES `serviceasset_processasset` WRITE;
/*!40000 ALTER TABLE `serviceasset_processasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `serviceasset_processasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threat`
--

DROP TABLE IF EXISTS `threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deliberate` tinyint(1) DEFAULT NULL,
  `accidental` tinyint(1) DEFAULT NULL,
  `environmental` tinyint(1) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_2C975CE75FB14BA7` (`level_id`),
  KEY `IDX_2C975CE7C54C8C93` (`type_id`),
  KEY `IDX_2C975CE7F65B3645` (`analyst_id`),
  CONSTRAINT `FK_2C975CE75FB14BA7` FOREIGN KEY (`level_id`) REFERENCES `threatlevel` (`id`),
  CONSTRAINT `FK_2C975CE7C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `threattype` (`id`),
  CONSTRAINT `FK_2C975CE7F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat`
--

LOCK TABLES `threat` WRITE;
/*!40000 ALTER TABLE `threat` DISABLE KEYS */;
INSERT INTO `threat` VALUES (1,3,1,1,'Fire',1,1,1,'<h2>Fire risk assessments</h2>\r\n\r\n<p>As the responsible person you must carry out and regularly review a fire risk assessment of the premises. This will identify what you need to do to prevent fire and keep people safe.</p>\r\n\r\n<p>You must keep a written record of your fire risk assessment if your business has 5 or more people.</p>\r\n\r\n<h2>Carrying out the assessment</h2>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Identify the fire hazards.</p>\r\n	</li>\r\n	<li>\r\n	<p>Identify people at risk.</p>\r\n	</li>\r\n	<li>\r\n	<p>Evaluate, remove or reduce the risks.</p>\r\n	</li>\r\n	<li>\r\n	<p>Record your findings, prepare an emergency plan and provide training.</p>\r\n	</li>\r\n	<li>\r\n	<p>Review and update the fire risk assessment regularly.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>The&nbsp;fire safety risk assessment chart&nbsp;gives more detailed information about these steps.</p>\r\n\r\n<p>You&rsquo;ll need to consider:</p>\r\n\r\n<ul>\r\n	<li>emergency routes and exits</li>\r\n	<li>fire detection and warning systems</li>\r\n	<li>fire fighting equipment</li>\r\n	<li>the removal or safe storage of dangerous substances</li>\r\n	<li>an emergency fire evacuation plan</li>\r\n	<li>the needs of vulnerable people, eg the elderly, young children or those with disabilities</li>\r\n	<li>providing information to employees and other people on the premises</li>\r\n	<li>staff fire safety training</li>\r\n</ul>\r\n\r\n<h2>Help with the assessment</h2>\r\n\r\n<p>You can do the fire risk assessment yourself with the help of standard&nbsp;fire safety advice documents.</p>\r\n\r\n<p>You&rsquo;ll need to appoint a &lsquo;competent person&rsquo; to help, eg a professional risk assessor, if you don&rsquo;t have the expertise or time to do the fire risk assessment yourself.</p>\r\n\r\n<p>Your local fire and rescue authority might be able to give you advice if you&rsquo;re not sure your risk assessment&rsquo;s been carried out properly. However, they can&rsquo;t carry out risk assessments for you.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Source:&nbsp;<a href=\"https://www.gov.uk/workplace-fire-safety-your-responsibilities/fire-risk-assessments\">https://www.gov.uk/workplace-fire-safety-your-responsibilities/fire-risk-assessments</a></p>\r\n\r\n<p>&nbsp;</p>','<h2>Fire safety and evacuation plans</h2>\r\n\r\n<p>Your plan must show how you have:</p>\r\n\r\n<ul>\r\n	<li>a clear passageway to all escape routes</li>\r\n	<li>clearly marked escape routes that are as short and direct as possible</li>\r\n	<li>enough exits and routes for all people to escape</li>\r\n	<li>emergency doors that open easily</li>\r\n	<li>emergency lighting where needed</li>\r\n	<li>training for all employees to know and use the escape routes</li>\r\n	<li>a safe meeting point for staff</li>\r\n</ul>\r\n\r\n<h2>People with mobility needs</h2>\r\n\r\n<p>You should also make special arrangements for&nbsp;people with mobility needs, eg make sure there are people to help wheelchair users get downstairs if there&rsquo;s a fire.</p>'),(2,3,1,1,'Water damage',1,1,1,NULL,NULL),(3,3,1,1,'Pollution',1,1,1,NULL,NULL),(4,3,1,1,'Major accident',1,1,1,NULL,NULL),(5,3,1,1,'Destruction of equipment or media',1,1,1,NULL,NULL),(6,3,1,1,'Dust, corrosion, freezing',1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `threat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threat_document`
--

DROP TABLE IF EXISTS `threat_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threat_document` (
  `threat_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`threat_id`,`document_id`),
  KEY `IDX_F0764842B2891786` (`threat_id`),
  KEY `IDX_F0764842C33F7837` (`document_id`),
  CONSTRAINT `FK_F0764842B2891786` FOREIGN KEY (`threat_id`) REFERENCES `threat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F0764842C33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat_document`
--

LOCK TABLES `threat_document` WRITE;
/*!40000 ALTER TABLE `threat_document` DISABLE KEYS */;
INSERT INTO `threat_document` VALUES (1,5),(1,6);
/*!40000 ALTER TABLE `threat_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threat_threatsource`
--

DROP TABLE IF EXISTS `threat_threatsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threat_threatsource` (
  `threat_id` int(11) NOT NULL,
  `threatsource_id` int(11) NOT NULL,
  PRIMARY KEY (`threat_id`,`threatsource_id`),
  KEY `IDX_AD659BA6B2891786` (`threat_id`),
  KEY `IDX_AD659BA693E39B35` (`threatsource_id`),
  CONSTRAINT `FK_AD659BA693E39B35` FOREIGN KEY (`threatsource_id`) REFERENCES `threatsource` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AD659BA6B2891786` FOREIGN KEY (`threat_id`) REFERENCES `threat` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat_threatsource`
--

LOCK TABLES `threat_threatsource` WRITE;
/*!40000 ALTER TABLE `threat_threatsource` DISABLE KEYS */;
INSERT INTO `threat_threatsource` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `threat_threatsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threatlevel`
--

DROP TABLE IF EXISTS `threatlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threatlevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threatlevel`
--

LOCK TABLES `threatlevel` WRITE;
/*!40000 ALTER TABLE `threatlevel` DISABLE KEYS */;
INSERT INTO `threatlevel` VALUES (1,1,'Very Low'),(2,2,'Low'),(3,3,'Medium'),(4,4,'High'),(5,5,'Very High');
/*!40000 ALTER TABLE `threatlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threatsource`
--

DROP TABLE IF EXISTS `threatsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threatsource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threatsource`
--

LOCK TABLES `threatsource` WRITE;
/*!40000 ALTER TABLE `threatsource` DISABLE KEYS */;
INSERT INTO `threatsource` VALUES (1,'Hacker, Craker',''),(2,'Computer Criminal',''),(3,'Terrorist',''),(4,'Industrial Spionage',''),(5,'Insiders','');
/*!40000 ALTER TABLE `threatsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threattype`
--

DROP TABLE IF EXISTS `threattype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threattype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threattype`
--

LOCK TABLES `threattype` WRITE;
/*!40000 ALTER TABLE `threattype` DISABLE KEYS */;
INSERT INTO `threattype` VALUES (1,'Physical damage',''),(2,'Natural events',''),(3,'Loss of essential services',''),(4,'Disturbance due to radiation',''),(5,'Compromise of information',''),(6,'Technical failures',''),(7,'Unauthorised actions',''),(8,'Compromise of functions','');
/*!40000 ALTER TABLE `threattype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'IT Office','IT Office'),(2,'Project Office','Project Office');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_8D93D649F8BD700D` (`unit_id`),
  KEY `IDX_8D93D649783E3463` (`manager_id`),
  CONSTRAINT `FK_8D93D649783E3463` FOREIGN KEY (`manager_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_8D93D649F8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,NULL,'admin','admin','admin@admin.com','admin','<p>Administrator</p>'),(2,1,NULL,'manager01','123456','manager01@admin.com','manager01','Manager'),(3,1,NULL,'analist01','123456','analist01@admin.com','analist01','IT analist'),(4,1,NULL,'analist02','123456','analist02@admin.com','analist02','Process analist'),(5,1,NULL,'luizerico','123456','admin@admin.com','Luiz Erico','creator');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_8F02BF9DA76ED395` (`user_id`),
  KEY `IDX_8F02BF9DFE54D947` (`group_id`),
  CONSTRAINT `FK_8F02BF9DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8F02BF9DFE54D947` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vulnerability`
--

DROP TABLE IF EXISTS `vulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vulnerability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_6C4E40475FB14BA7` (`level_id`),
  KEY `IDX_6C4E4047C54C8C93` (`type_id`),
  KEY `IDX_6C4E4047F65B3645` (`analyst_id`),
  CONSTRAINT `FK_6C4E40475FB14BA7` FOREIGN KEY (`level_id`) REFERENCES `vulnerabilitylevel` (`id`),
  CONSTRAINT `FK_6C4E4047C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `vulnerabilitytype` (`id`),
  CONSTRAINT `FK_6C4E4047F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vulnerability`
--

LOCK TABLES `vulnerability` WRITE;
/*!40000 ALTER TABLE `vulnerability` DISABLE KEYS */;
INSERT INTO `vulnerability` VALUES (1,3,1,1,'Insufficient maintenance','<p>ghdfg</p>',''),(2,3,1,1,'Lack of periodic replacement schemes',NULL,NULL),(3,3,1,1,'Susceptibility to humidity, dust, soiling',NULL,NULL),(4,3,1,1,'Sensitivity to eletromagnetic radiation',NULL,NULL),(5,3,1,1,'Lack of efficient configuration change control',NULL,NULL),(6,3,1,1,'Susceptibility to voltage variations',NULL,NULL),(7,3,1,1,'Susceptibility to temperature variations',NULL,NULL),(8,3,1,1,'Unprotected Storage',NULL,NULL),(9,3,1,1,'Lack of care at disposal',NULL,NULL),(10,3,1,1,'Uncontrolled copying',NULL,NULL);
/*!40000 ALTER TABLE `vulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vulnerability_document`
--

DROP TABLE IF EXISTS `vulnerability_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vulnerability_document` (
  `vulnerability_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`vulnerability_id`,`document_id`),
  KEY `IDX_EC5A23072897D8B` (`vulnerability_id`),
  KEY `IDX_EC5A230C33F7837` (`document_id`),
  CONSTRAINT `FK_EC5A23072897D8B` FOREIGN KEY (`vulnerability_id`) REFERENCES `vulnerability` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EC5A230C33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vulnerability_document`
--

LOCK TABLES `vulnerability_document` WRITE;
/*!40000 ALTER TABLE `vulnerability_document` DISABLE KEYS */;
INSERT INTO `vulnerability_document` VALUES (1,5),(1,6);
/*!40000 ALTER TABLE `vulnerability_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vulnerabilitylevel`
--

DROP TABLE IF EXISTS `vulnerabilitylevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vulnerabilitylevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vulnerabilitylevel`
--

LOCK TABLES `vulnerabilitylevel` WRITE;
/*!40000 ALTER TABLE `vulnerabilitylevel` DISABLE KEYS */;
INSERT INTO `vulnerabilitylevel` VALUES (1,1,'Very Low'),(2,2,'Low'),(3,3,'Medium'),(4,4,'High'),(5,5,'Very High');
/*!40000 ALTER TABLE `vulnerabilitylevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vulnerabilitytype`
--

DROP TABLE IF EXISTS `vulnerabilitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vulnerabilitytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vulnerabilitytype`
--

LOCK TABLES `vulnerabilitytype` WRITE;
/*!40000 ALTER TABLE `vulnerabilitytype` DISABLE KEYS */;
INSERT INTO `vulnerabilitytype` VALUES (1,'Hardware',NULL),(2,'Software',NULL),(3,'Network',NULL),(4,'Personnel',NULL),(5,'Site',NULL),(6,'Organization',NULL);
/*!40000 ALTER TABLE `vulnerabilitytype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-16 15:13:09
