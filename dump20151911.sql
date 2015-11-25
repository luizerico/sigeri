-- MySQL dump 10.13  Distrib 5.6.27, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sigeri
-- ------------------------------------------------------
-- Server version	5.6.27-0ubuntu0.15.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComplianceType`
--

LOCK TABLES `ComplianceType` WRITE;
/*!40000 ALTER TABLE `ComplianceType` DISABLE KEYS */;
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
  CONSTRAINT `FK_2AF5A5CF920BBA2` FOREIGN KEY (`value_id`) REFERENCES `assetvalue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (1,1,1,1,'DFBSA001','','serverasset',NULL),(2,1,1,1,'DFBSA002','','serverasset',NULL),(3,2,2,1,'DFBSA003','','serverasset',NULL);
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
INSERT INTO `asset_assetgroup` VALUES (1,1),(1,2),(2,2);
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
INSERT INTO `assetvalue` VALUES (1,1,'Lowest - No significant losses.'),(2,2,'Low - Low probability of monetary and reputation loss.'),(3,3,'Medium - Possible monetary and reputation loss.'),(4,4,'High - High probability of monetary, reputation and legal loss.'),(5,5,'Highest - Great monetary losses with high reputation and legal impact.');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance`
--

LOCK TABLES `compliance` WRITE;
/*!40000 ALTER TABLE `compliance` DISABLE KEYS */;
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
  `rule` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4A651CEC54C8C93` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliancerule`
--

LOCK TABLES `compliancerule` WRITE;
/*!40000 ALTER TABLE `compliancerule` DISABLE KEYS */;
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
  `date` date NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_EDDB2C4B6BF700BD` (`status_id`),
  KEY `IDX_EDDB2C4BC54C8C93` (`type_id`),
  KEY `IDX_EDDB2C4BF65B3645` (`analyst_id`),
  CONSTRAINT `FK_EDDB2C4B6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `controlstatus` (`id`),
  CONSTRAINT `FK_EDDB2C4BC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `controltype` (`id`),
  CONSTRAINT `FK_EDDB2C4BF65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control`
--

LOCK TABLES `control` WRITE;
/*!40000 ALTER TABLE `control` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlstatus`
--

LOCK TABLES `controlstatus` WRITE;
/*!40000 ALTER TABLE `controlstatus` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controltype`
--

LOCK TABLES `controltype` WRITE;
/*!40000 ALTER TABLE `controltype` DISABLE KEYS */;
/*!40000 ALTER TABLE `controltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D8698A76162CB942` (`folder_id`),
  CONSTRAINT `FK_D8698A76162CB942` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `method`
--

LOCK TABLES `method` WRITE;
/*!40000 ALTER TABLE `method` DISABLE KEYS */;
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
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DD5A5B7DD5CAD932` (`strategy_id`),
  KEY `IDX_DD5A5B7D9F2256F` (`effort_id`),
  KEY `IDX_DD5A5B7DF65B3645` (`analyst_id`),
  KEY `IDX_DD5A5B7D6BF700BD` (`status_id`),
  CONSTRAINT `FK_DD5A5B7D6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `planstatus` (`id`),
  CONSTRAINT `FK_DD5A5B7D9F2256F` FOREIGN KEY (`effort_id`) REFERENCES `planeffort` (`id`),
  CONSTRAINT `FK_DD5A5B7DD5CAD932` FOREIGN KEY (`strategy_id`) REFERENCES `planstrategy` (`id`),
  CONSTRAINT `FK_DD5A5B7DF65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planeffort`
--

LOCK TABLES `planeffort` WRITE;
/*!40000 ALTER TABLE `planeffort` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planstatus`
--

LOCK TABLES `planstatus` WRITE;
/*!40000 ALTER TABLE `planstatus` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planstrategy`
--

LOCK TABLES `planstrategy` WRITE;
/*!40000 ALTER TABLE `planstrategy` DISABLE KEYS */;
/*!40000 ALTER TABLE `planstrategy` ENABLE KEYS */;
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
  `date` date NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `detimpact` longtext COLLATE utf8_unicode_ci,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk`
--

LOCK TABLES `risk` WRITE;
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
INSERT INTO `risk` VALUES (1,5,11,1,5,3,'Flooding Datacenter','2015-10-12','','',NULL),(2,5,11,2,3,3,'Internet Link Down','2015-10-12','','',NULL);
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
INSERT INTO `risk_asset` VALUES (2,1),(2,2),(2,3);
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
INSERT INTO `risk_threat` VALUES (2,1);
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
INSERT INTO `risk_vulnerability` VALUES (2,1),(2,5);
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
INSERT INTO `riskstatus` VALUES (1,'Active',''),(2,'Obsolete',''),(3,'Mitigated',''),(4,'Avoided',''),(5,'Reduced','');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risktype`
--

LOCK TABLES `risktype` WRITE;
/*!40000 ALTER TABLE `risktype` DISABLE KEYS */;
INSERT INTO `risktype` VALUES (1,'Accounting risk',''),(2,'Brand risk',''),(3,'Credit risk',''),(4,'Environmental risk',''),(5,'Innovational or technical obsolesce risk',''),(6,'Legal riskInflation and recession risk',''),(7,'Liability risk',''),(8,'Longevity',''),(9,'Market risk',''),(10,'Mortality and morbidity risk',''),(11,'Operational risk',''),(12,'Physical damage risk',''),(13,'Political risk',''),(14,'Product risk',''),(15,'Regulatory risk',''),(16,'Reputational risk',''),(17,'Strategic risk','');
/*!40000 ALTER TABLE `risktype` ENABLE KEYS */;
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
INSERT INTO `serverasset` VALUES (1,'1.1.1.1'),(2,'1.1.1.2'),(3,'1.1.1.3');
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
INSERT INTO `vulnerability` VALUES (1,3,1,1,'Insufficient maintenance',NULL,NULL),(2,3,1,1,'Lack of periodic replacement schemes',NULL,NULL),(3,3,1,1,'Susceptibility to humidity, dust, soiling',NULL,NULL),(4,3,1,1,'Sensitivity to eletromagnetic radiation',NULL,NULL),(5,3,1,1,'Lack of efficient configuration change control',NULL,NULL),(6,3,1,1,'Susceptibility to voltage variations',NULL,NULL),(7,3,1,1,'Susceptibility to temperature variations',NULL,NULL),(8,3,1,1,'Unprotected Storage',NULL,NULL),(9,3,1,1,'Lack of care at disposal',NULL,NULL),(10,3,1,1,'Uncontrolled copying',NULL,NULL);
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

-- Dump completed on 2015-11-24 14:10:31
