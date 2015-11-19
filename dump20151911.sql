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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComplianceType`
--

LOCK TABLES `ComplianceType` WRITE;
/*!40000 ALTER TABLE `ComplianceType` DISABLE KEYS */;
INSERT INTO `ComplianceType` VALUES (1,'IT Security'),(2,'IT Services Framework'),(3,'IT Contract Rules'),(4,'Quality');
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2AF5A5CC54C8C93` (`type_id`),
  KEY `IDX_2AF5A5CF65B3645` (`analyst_id`),
  KEY `IDX_2AF5A5CF8BD700D` (`unit_id`),
  CONSTRAINT `FK_2AF5A5CC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `assettype` (`id`),
  CONSTRAINT `FK_2AF5A5CF65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_2AF5A5CF8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (40,'Server 003','<p>dsgdsg sd</p>\r\n\r\n<p>&nbsp;</p>',1,1,1,'serverasset'),(44,'Process 001','',1,1,1,'processasset'),(46,'Service 0001','<p>asfasdf</p>',3,1,1,'serviceasset'),(47,'Location 001','',2,1,1,'locationasset'),(49,'acnas01.conab.gov.br','',1,1,1,'serverasset');
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
INSERT INTO `asset_asset` VALUES (40,40),(40,44),(40,46),(40,47);
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
INSERT INTO `asset_assetgroup` VALUES (40,2);
/*!40000 ALTER TABLE `asset_assetgroup` ENABLE KEYS */;
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
INSERT INTO `asset_document` VALUES (40,8),(40,9),(40,10),(40,11),(40,12);
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
INSERT INTO `asset_risk` VALUES (40,21),(40,22);
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
INSERT INTO `asset_vulnerability` VALUES (40,4),(40,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetgroup`
--

LOCK TABLES `assetgroup` WRITE;
/*!40000 ALTER TABLE `assetgroup` DISABLE KEYS */;
INSERT INTO `assetgroup` VALUES (1,'Network Servers',''),(2,'Offices',''),(3,'Stock and Supplies','');
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
INSERT INTO `assetgroup_document` VALUES (2,6),(2,7);
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
INSERT INTO `assetgroup_risk` VALUES (2,21);
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
INSERT INTO `assetgroup_threat` VALUES (2,2);
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
INSERT INTO `assetgroup_vulnerability` VALUES (2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetmanager`
--

LOCK TABLES `assetmanager` WRITE;
/*!40000 ALTER TABLE `assetmanager` DISABLE KEYS */;
INSERT INTO `assetmanager` VALUES (1,'Luiz Ã‰rico','luiz.almeida@conab.gov.br'),(2,'Leonardo Pires','leonardo.pires@conab.gov.br');
/*!40000 ALTER TABLE `assetmanager` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettype`
--

LOCK TABLES `assettype` WRITE;
/*!40000 ALTER TABLE `assettype` DISABLE KEYS */;
INSERT INTO `assettype` VALUES (1,'Organizational','Item related to a organizational service or process'),(2,'Technical','Asset related to a technical resource'),(3,'Internal Process','Asset related to a internal process or service');
/*!40000 ALTER TABLE `assettype` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance`
--

LOCK TABLES `compliance` WRITE;
/*!40000 ALTER TABLE `compliance` DISABLE KEYS */;
INSERT INTO `compliance` VALUES (1,'Cobit 5','<h2>The COBIT framework[<a href=\"https://en.wikipedia.org/w/index.php?title=COBIT&amp;action=edit&amp;section=2\">edit</a>]</h2>\r\n\r\n<p>The business orientation of COBIT consists of linking business goals to IT goals, providing metrics and maturity models to measure their achievement, and identifying the associated responsibilities of business and IT process owners.</p>\r\n\r\n<p>The process focus of COBIT 4.1 is illustrated by a process model that subdivides IT into four domains (Plan and Organize, Acquire and Implement, Deliver and Support, and Monitor and Evaluate) and 34 processes in line with the responsibility areas of plan, build, run and monitor. It is positioned at a high level and has been aligned and harmonized with other, more detailed, IT standards and good practices such as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Committee_of_Sponsoring_Organizations_of_the_Treadway_Commission\">COSO</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Information_Technology_Infrastructure_Library\">ITIL</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Business_Information_Services_Library\">BiSL</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/ISO_27000\">ISO 27000</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Capability_Maturity_Model_Integration\">CMMI</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/TOGAF\">TOGAF</a>&nbsp;and&nbsp;<a href=\"https://en.wikipedia.org/wiki/PMBOK\">PMBOK</a>. COBIT acts as an integrator of these different guidance materials, summarizing key objectives under one umbrella framework that link the good practice models with governance and business requirements.</p>\r\n\r\n<p>The COBIT 4.1 framework specification can be obtained as a complimentary PDF at the&nbsp;<a href=\"http://www.isaca.org/Knowledge-Center/cobit/Pages/Downloads.aspx\">ISACA download website</a>. (Free self-registration may be required.)</p>\r\n\r\n<p>COBIT 5 was released in April 2012.<a href=\"https://en.wikipedia.org/wiki/COBIT#cite_note-4\">[4]</a>&nbsp;COBIT 5 consolidates and integrates the COBIT 4.1, Val IT 2.0 and Risk IT frameworks, and draws from ISACA&#39;s&nbsp;<em>IT Assurance Framework</em>&nbsp;(ITAF) and the<em>Business Model for Information Security</em>&nbsp;(BMIS). It aligns with frameworks and standards such as&nbsp;<em>Information Technology Infrastructure Library</em>&nbsp;(ITIL),&nbsp;<em>International Organization for Standardization</em>&nbsp;(ISO),&nbsp;<em>Project Management Body of Knowledge</em>&nbsp;(PMBOK), PRINCE2 and&nbsp;<em>The Open Group Architecture Framework</em>&nbsp;(TOGAF).</p>'),(2,'ITIL V3','<p>IT Services Framework / Best Practices</p>'),(3,'ISO 27001','<p>NBR ISO/IEC to implement a ISMS.</p>'),(4,'ISO 27005','<p>adsf asfasf afas</p>'),(5,'tewrtwet','');
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
INSERT INTO `compliance_document` VALUES (1,9),(1,12),(1,48),(1,49),(4,6),(4,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliancerule`
--

LOCK TABLES `compliancerule` WRITE;
/*!40000 ALTER TABLE `compliancerule` DISABLE KEYS */;
INSERT INTO `compliancerule` VALUES (1,'Incident Management','<h2>Incident management processes</h2>\r\n\r\n<p>The activities within the incident management process include:</p>\r\n\r\n<ul>\r\n	<li>Incident detection and recording</li>\r\n	<li>Classification and initial support</li>\r\n	<li>Investigation and analysis</li>\r\n	<li>Resolution and recovery</li>\r\n	<li>Incident closure</li>\r\n	<li>Incident ownership, monitoring, tracking and communication</li>\r\n	<li>Establish incident framework management</li>\r\n	<li>Evaluation of incident framework management</li>\r\n</ul>','<h2>Examples[<a href=\"https://en.wikipedia.org/w/index.php?title=Incident_management_(ITSM)&amp;action=edit&amp;section=6\">edit</a>]</h2>\r\n\r\n<p>Incidents should be classified as they are recorded, Examples of incidents by classification are:</p>\r\n\r\n<ul>\r\n	<li>Application\r\n	<ul>\r\n		<li>service not available</li>\r\n		<li>data issue</li>\r\n		<li>application bug</li>\r\n		<li>disk-usage threshold exceeded</li>\r\n	</ul>\r\n	</li>\r\n	<li>Hardware\r\n	<ul>\r\n		<li>system-down (server issue)</li>\r\n		<li>network issue</li>\r\n		<li>automatic alert</li>\r\n		<li>printer not printing</li>\r\n		<li>system issues</li>\r\n	</ul>\r\n	</li>\r\n</ul>',2),(2,'Backup','','',1);
/*!40000 ALTER TABLE `compliancerule` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control`
--

LOCK TABLES `control` WRITE;
/*!40000 ALTER TABLE `control` DISABLE KEYS */;
INSERT INTO `control` VALUES (1,1,1,1,'Control 0001','2015-10-12','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlstatus`
--

LOCK TABLES `controlstatus` WRITE;
/*!40000 ALTER TABLE `controlstatus` DISABLE KEYS */;
INSERT INTO `controlstatus` VALUES (1,'Active','Activated'),(2,'Not applicable','Not Applicable'),(3,'In Development','In Development Control');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controltype`
--

LOCK TABLES `controltype` WRITE;
/*!40000 ALTER TABLE `controltype` DISABLE KEYS */;
INSERT INTO `controltype` VALUES (1,'Network','Network control access'),(2,'Phisical Access','Phisical control access to prevent invasions');
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `folder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D8698A76162CB942` (`folder_id`),
  CONSTRAINT `FK_D8698A76162CB942` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (6,'rtwert','wertwert','rtyrty',1),(7,'rtwert','wertwert','asfd',2),(8,'rtwert','wertwert','',NULL),(9,'rtwert','wertwert','',NULL),(10,'rtwert','wertwert','',NULL),(11,'rtwert','wertwert','',NULL),(12,'rtwert','wertwert','',NULL),(13,'rtwert','wertwert','',NULL),(14,'rtwert','wertwert','',NULL),(15,'Fasfas','asdfasdfda','',NULL),(16,'asdfasf','asdfadf','',NULL),(17,'asdfasf','asdfadf','',NULL),(18,'asdfasf','asdfadf','',NULL),(19,'asdfasf','asdfadf','',NULL),(20,'asdfasf','asdfadf','',NULL),(21,'asdfasf','asdfadf','',NULL),(22,'asdfasf','asdfadf','',NULL),(23,'asdfasf','asdfadf','',NULL),(24,'asdfasf','asdfadf','',NULL),(25,'asdfasf','asdfadf','',NULL),(26,'asdfasf','asdfadf','',NULL),(27,'asdfasf','asdfadf','',NULL),(28,'asdfasf','asdfadf','',NULL),(29,'asdfasf','asdfadf','',NULL),(30,'asdfasf','asdfadf','',NULL),(31,'asdfasf','asdfadf','',NULL),(32,'asdfasf','asdfadf','',NULL),(33,'asdfasf','asdfadf','',NULL),(34,'asdfasf','asdfadf','',NULL),(35,'asdfasf','asdfadf','',NULL),(36,'asdfasf','asdfadf','',NULL),(37,'asdfasf','asdfadf','',NULL),(38,'asdfasf','asdfadf','',NULL),(39,'asdfasf','asdfadf','',NULL),(40,'asdfasf','asdfadf','',NULL),(41,'asdfasf','asdfadf','',NULL),(42,'asdfasf','asdfadf','',NULL),(47,'documento(19).pdf','application/pdf','Documento 19addd',NULL),(48,'DivulgaÃ§Ã£o da Vaga Analista de SeguranÃ§a da InformaÃ§Ã£o.jpg','image/jpeg','Doc77777',NULL),(49,'NOVO_-_Modelo_CatÃ¡logo_de_ServiÃ§os.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','TESTE',NULL),(61,'Ementa_dos_treinamentos-Citsmart_Administrador_Citsmart_PT.pdf','application/pdf','sdafgsdgf',NULL);
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
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_D338D583BF396750` FOREIGN KEY (`id`) REFERENCES `asset` (`id`) ON DELETE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (1,'TESTE'),(2,'TESTE1'),(4,'qewr'),(5,'qewr'),(6,'Imagensss');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'GEASI','GestÃ£o da Infraestrutura'),(2,'SUTIN','Superintendencia de TI'),(4,'Analistas','Analyst Group');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impact`
--

LOCK TABLES `impact` WRITE;
/*!40000 ALTER TABLE `impact` DISABLE KEYS */;
INSERT INTO `impact` VALUES (1,3,'mÃ©dio'),(2,5,'alto'),(3,9,'Highest'),(4,1,'Lowest');
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
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_D77C34DEBF396750` FOREIGN KEY (`id`) REFERENCES `asset` (`id`) ON DELETE CASCADE
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
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `services` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_5E9E89CBBF396750` FOREIGN KEY (`id`) REFERENCES `asset` (`id`) ON DELETE CASCADE
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
INSERT INTO `locationasset` VALUES (47,'132456','13456');
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
  `value` double NOT NULL,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `risk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5E593A60235B6D1` (`risk_id`),
  CONSTRAINT `FK_5E593A60235B6D1` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `method`
--

LOCK TABLES `method` WRITE;
/*!40000 ALTER TABLE `method` DISABLE KEYS */;
INSERT INTO `method` VALUES (9,4.5625,'owasp',20),(10,2,'owasp',20),(11,3,'owasp',22),(13,5.1,'cvss',20),(14,5.5,'owasp',20),(15,1.5625,'owasp',20),(16,3.5,'owasp',22),(17,7.2,'cvss',22);
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
  `exploitability` int(11) NOT NULL,
  `remediationlevel` int(11) NOT NULL,
  `reportconfidence` int(11) NOT NULL,
  `reqconfidentiality` int(11) NOT NULL,
  `reqintegrity` int(11) NOT NULL,
  `reqavailability` int(11) NOT NULL,
  `scope` int(11) NOT NULL,
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
INSERT INTO `methodcvss` VALUES (13,62,44,27,62,56,0,0,100,96,100,100,100,100,752,62,44,62,62,0,0,0,752),(17,85,77,85,85,0,22,22,97,100,100,150,100,50,752,62,77,62,85,56,56,56,642);
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
INSERT INTO `methodowasp` VALUES (9,5,10,4,5,4,1,6,6,1,3,3,4,4,5,8,4),(10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,6,10,10,10,1,1,1,1,1,1,1,1,1,1,1,1),(14,1,2,3,4,5,6,7,8,10,9,8,7,6,5,4,3),(15,1,1,1,1,1,1,1,10,1,1,1,1,1,1,1,1),(16,3,1,2,3,10,10,9,10,1,1,1,1,1,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,1,1,4,1,'Plan 001','<p><strong>4.1. Vulnerability </strong></p>\r\n\r\n<p>Due to a flaw in the handler function for RPC commands, it is possible to manipulate data pointers within the Virtual Machine Executable (VMX) process. This vulnerability may allow a user in a Guest Virtual Machine to crash the VMX process resulting in a Denial of Service (DoS) on the host or potentially execute code on the host. Return to table of contents &nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4.2. Attack </strong></p>\r\n\r\n<p>A successful exploit requires <strong><em>an attacker to have</em></strong> access to a Guest Virtual Machine (VM). The Guest VM needs to be configured to have 4GB or more of memory. The attacker would then have to construct a specially crafted remote RPC call to exploit the VMX process.</p>','<p><strong>This fake PCI</strong> device can be easily given to, say, a KVM guest. On the other hand, nothing stops us from using it the host environment. To do that just load the &quot;ixgbevf&quot; kernel module and another &quot;ethX&quot; interface will pop up.</p>\r\n\r\n<p>You may wonder how that helps with kernel bypass. Since the &quot;ixgbevf&quot; device is not used by the kernel to do normal networking, we could dedicate it to the bypass. It seems possible to run DPDK on &quot;ixgbevf&quot; devices.</p>','2015-10-01'),(2,2,2,1,3,'Plan 002','This fake PCI device can be easily given to, say, a KVM guest. On the other hand, nothing stops us from using it the host environment. To do that just load the \"ixgbevf\" kernel module and another \"ethX\" interface will pop up.\r\nYou may wonder how that helps with kernel bypass. Since the \"ixgbevf\" device is not used by the kernel to do normal networking, we could dedicate it to the bypass. It seems possible to run DPDK on \"ixgbevf\" devices.','This fake PCI device can be easily given to, say, a KVM guest. On the other hand, nothing stops us from using it the host environment. To do that just load the \"ixgbevf\" kernel module and another \"ethX\" interface will pop up.\r\nYou may wonder how that helps with kernel bypass. Since the \"ixgbevf\" device is not used by the kernel to do normal networking, we could dedicate it to the bypass. It seems possible to run DPDK on \"ixgbevf\" devices.','2015-12-31'),(3,1,2,1,1,'Plan D002','<p>If we wanted to pull and render just the&nbsp;SimpleInput&nbsp;decorator, we can do so using the&nbsp;getDecorator()&nbsp;method:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>$decorator&nbsp;=&nbsp;$element-&gt;getDecorator(&#39;SimpleInput&#39;);</p>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"http://www.php.net/echo\">echo</a>&nbsp;$decorator-&gt;render(&#39;&#39;);</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>This is pretty easy, but it can be made even easier; let&#39;s do it in a single line:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><a href=\"http://www.php.net/echo\">echo</a>&nbsp;$element-&gt;getDecorator(&#39;SimpleInput&#39;)-&gt;render(&#39;&#39;);</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>Not too bad, but still a little complex. To make this easier, a shorthand notation was introduced into&nbsp;Zend_Form&nbsp;in 1.7: you can render any registered decorator by calling a method of the format&nbsp;renderDecoratorName(). This will effectively perform what you see above, but makes the&nbsp;<var>$content</var>&nbsp;argument optional and simplifies the usage:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><a href=\"http://www.php.net/echo\">echo</a>&nbsp;$element-&gt;renderSimpleInput();</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>This is a neat trick, but how and why would you use it?</p>','','2011-12-31');
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
INSERT INTO `plan_document` VALUES (1,49),(1,61),(2,24),(2,25);
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
  KEY `IDX_CDB012B01E8BE481` (`planreview_id`),
  CONSTRAINT `FK_CDB012B01E8BE481` FOREIGN KEY (`planreview_id`) REFERENCES `planreview` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CDB012B0E899029B` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`) ON DELETE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planeffort`
--

LOCK TABLES `planeffort` WRITE;
/*!40000 ALTER TABLE `planeffort` DISABLE KEYS */;
INSERT INTO `planeffort` VALUES (1,'Lowest',1,'Lowest'),(2,'Low',2,'Low effort'),(3,'Medium',3,'Medium effort');
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
  `analyst_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `date` date NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A0DD28A6F65B3645` (`analyst_id`),
  KEY `IDX_A0DD28A66BF700BD` (`status_id`),
  KEY `IDX_A0DD28A6E899029B` (`plan_id`),
  CONSTRAINT `FK_A0DD28A66BF700BD` FOREIGN KEY (`status_id`) REFERENCES `planstatus` (`id`),
  CONSTRAINT `FK_A0DD28A6E899029B` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`),
  CONSTRAINT `FK_A0DD28A6F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planreview`
--

LOCK TABLES `planreview` WRITE;
/*!40000 ALTER TABLE `planreview` DISABLE KEYS */;
INSERT INTO `planreview` VALUES (1,4,1,'Rv 001112','<h3>3.2. Attack</h3>\r\n\r\n<p>A typical attack scenario is that a victim has visited a web server and her web browser now contains a cookie that an attacker wishes to steal. For a successful attack, the attacker must be able to modify network traffic between the victim and this web server, and both victim and system must be willing to use SSL 3.0 for encryption.</p>','2015-10-01',1),(2,4,3,'Rv 002','','2015-10-23',1),(3,1,1,'Review ZZZ','asdfaa','2015-10-01',1),(4,1,1,'Review XXX','fghjkl','2015-10-01',2),(5,4,2,'sdfgsdf','sdfgsdfg sdf','2015-10-08',2),(6,1,1,'12341234','12341234124','2015-10-13',1),(7,1,1,'UOCHI','','2015-10-14',1),(8,1,1,'Rev ZZx','','2015-10-12',1);
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
  KEY `IDX_31C8DC0BE899029B` (`plan_id`),
  CONSTRAINT `FK_31C8DC0B1E8BE481` FOREIGN KEY (`planreview_id`) REFERENCES `planreview` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_31C8DC0BE899029B` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`) ON DELETE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planstatus`
--

LOCK TABLES `planstatus` WRITE;
/*!40000 ALTER TABLE `planstatus` DISABLE KEYS */;
INSERT INTO `planstatus` VALUES (1,'Active','Plan is active'),(2,'Inactive','Plan is inactive'),(3,'Development','Plan in development'),(4,'Scheduled','Scheduled');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planstrategy`
--

LOCK TABLES `planstrategy` WRITE;
/*!40000 ALTER TABLE `planstrategy` DISABLE KEYS */;
INSERT INTO `planstrategy` VALUES (1,'Mitigate','Mitigate the risk'),(2,'Transfer','Transfer risk'),(3,'Reduce','Reduce the impact'),(4,'Accept','Accept the risk');
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
-- Table structure for table `probability`
--

DROP TABLE IF EXISTS `probability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `probability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `probability`
--

LOCK TABLES `probability` WRITE;
/*!40000 ALTER TABLE `probability` DISABLE KEYS */;
INSERT INTO `probability` VALUES (1,1,'Lowest'),(2,5,'High'),(3,9,'Highest'),(5,3,'afasdfaf');
/*!40000 ALTER TABLE `probability` ENABLE KEYS */;
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
INSERT INTO `processasset` VALUES (44,NULL);
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `probability_id` int(11) DEFAULT NULL,
  `impact_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `type_id` int(11) DEFAULT NULL,
  `detimpact` longtext COLLATE utf8_unicode_ci,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7906D541D09E6F09` (`probability_id`),
  KEY `IDX_7906D541D128BC9B` (`impact_id`),
  KEY `IDX_7906D541C54C8C93` (`type_id`),
  KEY `IDX_7906D541F65B3645` (`analyst_id`),
  KEY `IDX_7906D5416BF700BD` (`status_id`),
  CONSTRAINT `FK_7906D5416BF700BD` FOREIGN KEY (`status_id`) REFERENCES `riskstatus` (`id`),
  CONSTRAINT `FK_7906D541C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `risktype` (`id`),
  CONSTRAINT `FK_7906D541D09E6F09` FOREIGN KEY (`probability_id`) REFERENCES `probability` (`id`),
  CONSTRAINT `FK_7906D541D128BC9B` FOREIGN KEY (`impact_id`) REFERENCES `impact` (`id`),
  CONSTRAINT `FK_7906D541F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk`
--

LOCK TABLES `risk` WRITE;
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
INSERT INTO `risk` VALUES (20,'Risk001','<h2>Setting up the tests directory<a href=\"http://framework.zend.com/manual/current/en/tutorials/unittesting.html#setting-up-the-tests-directory\">&para;</a></h2>\r\n\r\n<p>As Zend Framework 2 applications are built from modules that should be standalone blocks of an application, we don&rsquo;t test the application in it&rsquo;s entirety, but module by module.</p>\r\n\r\n<p>We will show how to set up the minimum requirements to test a module, the&nbsp;<tt>Album</tt>&nbsp;module we wrote in the user guide, and which then can be used as a base for testing any other module.</p>\r\n\r\n<p>Start by creating a directory called&nbsp;<tt>test</tt>&nbsp;in&nbsp;<tt>zf2-tutorial\\module\\Album</tt>&nbsp;with the following subdirectories:</p>\r\n\r\n<pre>\r\nzf2-tutorial/\r\n    /module\r\n        /Album\r\n            /test\r\n                /AlbumTest\r\n                    /Controller\r\n</pre>\r\n\r\n<p>The structure of the&nbsp;<tt>test</tt>&nbsp;directory matches exactly with that of the module&rsquo;s source files, and it will allow you to keep your tests well-organized and easy to find.</p>\r\n\r\n<h2>Bootstrapping your tests<a href=\"http://framework.zend.com/manual/current/en/tutorials/unittesting.html#bootstrapping-your-tests\">&para;</a></h2>\r\n\r\n<p>Next, create a file called&nbsp;<tt>phpunit.xml</tt>&nbsp;under&nbsp;<tt>zf2-tutorial/module/Album/test</tt>:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<pre>\r\n1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9</pre>\r\n			</td>\r\n			<td>\r\n			<pre>\r\n&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;\r\n\r\n&lt;phpunit bootstrap=&quot;Bootstrap.php&quot; colors=&quot;true&quot;&gt;\r\n    &lt;testsuites&gt;\r\n        &lt;testsuite name=&quot;zf2tutorial&quot;&gt;\r\n            &lt;directory&gt;./AlbumTest&lt;/directory&gt;\r\n        &lt;/testsuite&gt;\r\n    &lt;/testsuites&gt;\r\n&lt;/phpunit&gt;\r\n</pre>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>And a file called&nbsp;<tt>Bootstrap.php</tt>, also under&nbsp;<tt>zf2-tutorial/module/Album/test</tt>:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<pre>\r\n 1\r\n 2\r\n 3\r\n 4\r\n 5\r\n 6\r\n 7\r\n 8\r\n 9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\n16\r\n17\r\n18\r\n19\r\n20\r\n21\r\n22\r\n23\r\n24\r\n25\r\n26\r\n27\r\n28\r\n29\r\n30\r\n31\r\n32\r\n33\r\n34\r\n35\r\n36\r\n37\r\n38\r\n39\r\n40\r\n41\r\n42\r\n43\r\n44\r\n45\r\n46\r\n47\r\n48\r\n49\r\n50\r\n51\r\n52\r\n53\r\n54\r\n55\r\n56\r\n57\r\n58\r\n59\r\n60\r\n61\r\n62\r\n63\r\n64\r\n65\r\n66\r\n67\r\n68\r\n69\r\n70\r\n71\r\n72\r\n73\r\n74\r\n75\r\n76\r\n77\r\n78\r\n79\r\n80\r\n81\r\n82\r\n83\r\n84\r\n85\r\n86\r\n87\r\n88\r\n89\r\n90\r\n91\r\n92\r\n93\r\n94\r\n95\r\n96\r\n97\r\n98\r\n99</pre>\r\n			</td>\r\n			<td>\r\n			<pre>\r\n&lt;?php\r\n\r\nnamespace AlbumTest;\r\n\r\nuse Zend\\Loader\\AutoloaderFactory;\r\nuse Zend\\Mvc\\Service\\ServiceManagerConfig;\r\nuse Zend\\ServiceManager\\ServiceManager;\r\nuse RuntimeException;\r\n\r\nerror_reporting(E_ALL | E_STRICT);\r\nchdir(__DIR__);\r\n\r\n/**\r\n * Test bootstrap, for setting up autoloading\r\n */\r\nclass Bootstrap\r\n{\r\n    protected static $serviceManager;\r\n\r\n    public static function init()\r\n    {\r\n        $zf2ModulePaths = array(dirname(dirname(__DIR__)));\r\n        if (($path = static::findParentPath(&#39;vendor&#39;))) {\r\n            $zf2ModulePaths[] = $path;\r\n        }\r\n        if (($path = static::findParentPath(&#39;module&#39;)) !== $zf2ModulePaths[0]) {\r\n            $zf2ModulePaths[] = $path;\r\n        }\r\n\r\n        static::initAutoloader();\r\n\r\n        // use ModuleManager to load this module and it&#39;s dependencies\r\n        $config = array(\r\n            &#39;module_listener_options&#39; =&gt; array(\r\n                &#39;module_paths&#39; =&gt; $zf2ModulePaths,\r\n            ),\r\n            &#39;modules&#39; =&gt; array(\r\n                &#39;Album&#39;\r\n            )\r\n        );\r\n\r\n        $serviceManager = new ServiceManager(new ServiceManagerConfig());\r\n        $serviceManager-&gt;setService(&#39;ApplicationConfig&#39;, $config);\r\n        $serviceManager-&gt;get(&#39;ModuleManager&#39;)-&gt;loadModules();\r\n        static::$serviceManager = $serviceManager;\r\n    }\r\n\r\n    public static function chroot()\r\n    {\r\n        $rootPath = dirname(static::findParentPath(&#39;module&#39;));\r\n        chdir($rootPath);\r\n    }\r\n\r\n    public static function getServiceManager()\r\n    {\r\n        return static::$serviceManager;\r\n    }\r\n\r\n    protected static function initAutoloader()\r\n    {\r\n        $vendorPath = static::findParentPath(&#39;vendor&#39;);\r\n\r\n        if (file_exists($vendorPath.&#39;/autoload.php&#39;)) {\r\n            include $vendorPath.&#39;/autoload.php&#39;;\r\n        }\r\n\r\n        if (! class_exists(&#39;Zend\\Loader\\AutoloaderFactory&#39;)) {\r\n            throw new RuntimeException(\r\n                &#39;Unable to load ZF2. Run `php composer.phar install`&#39;\r\n            );\r\n        }\r\n\r\n        AutoloaderFactory::factory(array(\r\n            &#39;Zend\\Loader\\StandardAutoloader&#39; =&gt; array(\r\n                &#39;autoregister_zf&#39; =&gt; true,\r\n                &#39;namespaces&#39; =&gt; array(\r\n                    __NAMESPACE__ =&gt; __DIR__ . &#39;/&#39; . __NAMESPACE__,\r\n                ),\r\n            ),\r\n        ));\r\n    }\r\n\r\n    protected static function findParentPath($path)\r\n    {\r\n        $dir = __DIR__;\r\n        $previousDir = &#39;.&#39;;\r\n        while (!is_dir($dir . &#39;/&#39; . $path)) {\r\n            $dir = dirname($dir);\r\n            if ($previousDir === $dir) {\r\n                return false;\r\n            }\r\n            $previousDir = $dir;\r\n        }\r\n        return $dir . &#39;/&#39; . $path;\r\n    }\r\n}\r\n\r\nBootstrap::init();\r\nBootstrap::chroot();</pre>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>',1,2,1,'2015-12-31','<p>erty</p>',2,'<p>erty</p>',1),(21,'asdfasa','',1,1,1,'2015-10-03','',2,'',1),(22,'Risk AA99','',3,1,1,'2015-12-31','',2,'',1);
/*!40000 ALTER TABLE `risk` ENABLE KEYS */;
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
INSERT INTO `risk_document` VALUES (21,6);
/*!40000 ALTER TABLE `risk_document` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskmethod`
--

LOCK TABLES `riskmethod` WRITE;
/*!40000 ALTER TABLE `riskmethod` DISABLE KEYS */;
INSERT INTO `riskmethod` VALUES (1,'CVSS',''),(2,'OWASP',''),(3,'DREAD',''),(4,'CLASSIC','');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskreview`
--

LOCK TABLES `riskreview` WRITE;
/*!40000 ALTER TABLE `riskreview` DISABLE KEYS */;
INSERT INTO `riskreview` VALUES (4,20,1,1,'twert','<p>wert</p>','2015-10-28'),(5,20,1,1,'Rev 0001','','2015-10-10'),(6,20,1,1,'dsfgdsgsg','','2015-10-12');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskstatus`
--

LOCK TABLES `riskstatus` WRITE;
/*!40000 ALTER TABLE `riskstatus` DISABLE KEYS */;
INSERT INTO `riskstatus` VALUES (1,'Active','Active'),(2,'Obsolete','Obsolete'),(3,'Mitigated','Mitigated');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risktype`
--

LOCK TABLES `risktype` WRITE;
/*!40000 ALTER TABLE `risktype` DISABLE KEYS */;
INSERT INTO `risktype` VALUES (2,'Organizational','Organizational Risk'),(3,'Technical','Technical Risk'),(4,'People','Risk Associated to people');
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
INSERT INTO `serverasset` VALUES (40,'1.5.2.3'),(49,'1.1.1.1');
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
  KEY `IDX_5C491D0DBE16AAA0` (`serviceasset_id`),
  CONSTRAINT `FK_5C491D0D3ECE380` FOREIGN KEY (`serverasset_id`) REFERENCES `serverasset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5C491D0DBE16AAA0` FOREIGN KEY (`serviceasset_id`) REFERENCES `serviceasset` (`id`) ON DELETE CASCADE
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
INSERT INTO `serviceasset` VALUES (46);
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
  KEY `IDX_6F86EBBA39EA22E9` (`processasset_id`),
  CONSTRAINT `FK_6F86EBBA39EA22E9` FOREIGN KEY (`processasset_id`) REFERENCES `processasset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6F86EBBABE16AAA0` FOREIGN KEY (`serviceasset_id`) REFERENCES `serviceasset` (`id`) ON DELETE CASCADE
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
  `description` longtext COLLATE utf8_unicode_ci,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `accidental` tinyint(1) NOT NULL,
  `environmental` tinyint(1) NOT NULL,
  `deliberate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2C975CE75FB14BA7` (`level_id`),
  KEY `IDX_2C975CE7C54C8C93` (`type_id`),
  KEY `IDX_2C975CE7F65B3645` (`analyst_id`),
  CONSTRAINT `FK_2C975CE75FB14BA7` FOREIGN KEY (`level_id`) REFERENCES `threatlevel` (`id`),
  CONSTRAINT `FK_2C975CE7C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `threattype` (`id`),
  CONSTRAINT `FK_2C975CE7F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat`
--

LOCK TABLES `threat` WRITE;
/*!40000 ALTER TABLE `threat` DISABLE KEYS */;
INSERT INTO `threat` VALUES (2,1,2,1,'Hacker','<h1>Unit Testing</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>A solid unit test suite is essential for ongoing development in large projects, especially those with many people involved. Going back and manually testing every individual component of an application after every change is impractical. Your unit tests will help alleviate that by automatically testing your application&rsquo;s components and alerting you when something is not working the same way it was when you wrote your tests.</p>\r\n\r\n<p>The Zend Framework 2 API uses&nbsp;<a href=\"http://phpunit.de/\">PHPUnit</a>, and so does this tutorial application. A detailed explanation of unit testing is beyond the scope of this tutorial, so we will only provide sample tests for the components in the pages that follow. This tutorial assumes that you already have PHPUnit installed.</p>\r\n\r\n<h2>Setting up the tests directory<a href=\"http://framework.zend.com/manual/2.0/en/user-guide/unit-testing.html#setting-up-the-tests-directory\">&para;</a></h2>\r\n\r\n<p>Start by creating a directory called&nbsp;<tt>test</tt>&nbsp;in&nbsp;<tt>zf2-tutorial\\module\\Application</tt>&nbsp;with the following subdirectories:</p>\r\n\r\n<pre>\r\nzf2-tutorial/\r\n    /module\r\n        /Application\r\n            /test\r\n                /ApplicationTest\r\n                    /Controller\r\n</pre>\r\n\r\n<p>The structure of the&nbsp;<tt>test</tt>&nbsp;directory matches exactly with that of the module&rsquo;s source files, and it will allow you to keep your tests well-organized and easy to find.</p>\r\n\r\n<h2>Bootstrapping your tests<a href=\"http://framework.zend.com/manual/2.0/en/user-guide/unit-testing.html#bootstrapping-your-tests\">&para;</a></h2>\r\n\r\n<p>Next, create a file called&nbsp;<tt>phpunit.xml.dist</tt>&nbsp;under&nbsp;<tt>zf2-tutorial/module/Application/test</tt>:</p>','<p>asdfadsf afasfas fasdf</p>',1,0,0),(3,1,2,4,'Threat WWW','','',0,0,0);
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
INSERT INTO `threat_document` VALUES (2,7),(2,10),(2,11);
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
INSERT INTO `threat_threatsource` VALUES (2,5),(2,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threatlevel`
--

LOCK TABLES `threatlevel` WRITE;
/*!40000 ALTER TABLE `threatlevel` DISABLE KEYS */;
INSERT INTO `threatlevel` VALUES (1,1,'Lowest'),(2,8,'High'),(3,9,'Highest'),(4,5,'Medium');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threatsource`
--

LOCK TABLES `threatsource` WRITE;
/*!40000 ALTER TABLE `threatsource` DISABLE KEYS */;
INSERT INTO `threatsource` VALUES (4,'Hacker, Craker','<p><strong>Possible Consequences:</strong></p>\r\n\r\n<ul>\r\n	<li>Hacking</li>\r\n	<li>Social Engineering</li>\r\n	<li>System Intrusion, break-ins</li>\r\n	<li>Unauthorized system access</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>'),(5,'Computer Criminal',''),(6,'Terrorist',''),(7,'Industrial Spionage',''),(8,'Insiders','');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threattype`
--

LOCK TABLES `threattype` WRITE;
/*!40000 ALTER TABLE `threattype` DISABLE KEYS */;
INSERT INTO `threattype` VALUES (2,'Process','<h1>PHP:&nbsp;Truncating Text</h1>\r\n\r\n<p><a href=\"https://twitter.com/intent/tweet?text=Truncating+Text:&amp;url=http%3A%2F%2Fwww.the-art-of-web.com%2Fphp%2Ftruncate%2F&amp;via=theartofweb\" target=\"_blank\">14</a><a href=\"https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.the-art-of-web.com%2Fphp%2Ftruncate%2F\" target=\"_blank\">6</a><a href=\"https://plus.google.com/share?url=http%3A%2F%2Fwww.the-art-of-web.com%2Fphp%2Ftruncate%2F\" target=\"_blank\">3</a>13</p>\r\n\r\n<p>A common problem when creating&nbsp;<em>dynamic</em>&nbsp;web pages (where content is sourced from a database, content management system or external source such as an&nbsp;<a href=\"http://www.the-art-of-web.com/php/feed-reader/\">RSS feed</a>) is that the input text can be too long and cause the page layout to &#39;break&#39;.</p>\r\n\r\n<p>One solution is to truncate the text so that it fits on the page. This sounds simple, but often the results aren&#39;t as expected due to words and sentences being cut off at inappropriate points.</p>\r\n\r\n<h2>1. Limiting or Truncating strings using PHP</h2>\r\n\r\n<p>Here&#39;s a simple function that avoids the usual pitfalls and offers some flexibility in formatting:</p>\r\n\r\n<p><a href=\"https://twitter.com/intent/tweet?text=Truncating+Text:&amp;url=http%3A%2F%2Fwww.the-art-of-web.com%2Fphp%2Ftruncate%2F&amp;via=theartofweb\" target=\"_blank\"><code><em>// Original PHP code by Chirp Internet: www.chirp.com.au // Please acknowledge use of this code by including this header.</em> function myTruncate($string, $limit, $break=&quot;.&quot;, $pad=&quot;...&quot;) { <em>// return with no change if string is shorter than $limit</em> if(</code></a><code><a href=\"http://www.php.net/strlen\" target=\"_blank\">strlen</a>($string) &lt;= $limit) return $string; <em>// is $break present between $limit and the end of the string?</em> if(false !== ($breakpoint = <a href=\"http://www.php.net/strpos\" target=\"_blank\">strpos</a>($string, $break, $limit))) { if($breakpoint &lt; strlen($string) - 1) { $string = <a href=\"http://www.php.net/substr\" target=\"_blank\">substr</a>($string, 0, $breakpoint) . $pad; } } return $string; }</code></p>'),(3,'Unintentional','<p>sdg sdg</p>'),(4,'Technical','');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'SUTIN','Superintendencia de InformÃ¡tica'),(3,'GERIC','Gerencia de Risco');
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
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `detail` longtext COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8D93D649F8BD700D` (`unit_id`),
  KEY `IDX_8D93D649783E3463` (`manager_id`),
  CONSTRAINT `FK_8D93D649783E3463` FOREIGN KEY (`manager_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_8D93D649F8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'COO',3,'','asdfaaa@afsaf.com',NULL,'123456','Chief Operations'),(3,'Zezinho',1,'Gerente de Redes e SeguranÃ§a','zezinho@conab.gov.br',1,'',''),(4,'Luiz Ã‰rico',3,'sdgfasfasf','luiz.almeida@conab.gov.br',NULL,'',''),(5,'Leandro',3,'','lss@lss.com',1,'',''),(6,'admin',1,'','admin@admin.com',1,'123456','Admin');
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
INSERT INTO `user_group` VALUES (1,1),(3,1),(3,2),(4,1),(5,1),(5,2),(5,4),(6,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vulnerability`
--

LOCK TABLES `vulnerability` WRITE;
/*!40000 ALTER TABLE `vulnerability` DISABLE KEYS */;
INSERT INTO `vulnerability` VALUES (2,1,3,3,'Falha nas Portas','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:600px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td>We have recommendations for you\r\n						<p>We combed our catalog and found courses and Specializations that we think match your interests. Browse our recommendations below, and start learning something new today.</p>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td>Recommended Specializations</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><a href=\"https://eventing.coursera.org/redirect/bBUocJzz7uSvyesYDTco7LHEHA6_nUndl3CoHVrFjTJoxAofW1Bd83-99aKiBDCy2ka_QU5rGrvij5p453y2Mw.3wx6viaJnoZSWcxEplA--w.OGAc3reCjI5YdwR0yZ1EWaImdQk_0QjXBqDSLaaAnPsoCbeCFzkhOyFkQh6DVkXNXsOvcfu6WqagWRbukqUXEj8hkp_ap-5ShwNcqP8spegLAqi5WOYJ9snBlGS9ymOUTTpt0FHbUkp1h3eQ4rV9BfOO9YzTSqEhV1qp9AaGSsNUS4tH2L_1ntEpLeQGv4HRUforOT3W742hTwueQuE0Wp7wkFWz2PxKfLoDS-21Lbep1tPHpq_dzPU4xfMj_Lm66nMdtyfiimNNrBJuM-6LzP-j7mGiBDNu6wuFaqsTW2Xe0RBTwS1yi5cagn-2ancOPadUEemOA469TvfJ9EppWJfwx0SaQhJlJcGNZ34gXbbjiAzd8Uxd3I98y0b9ePC2IeoGhTM1pxzpKhrnIpl-lAupwW1A3wTPziMcbB_Fv8DmHqiYc27Dqum-iCYw3f7edEyUmchLrbbNfxs5xXJX_1mfNdni4wtWGbkE2G0GzMX_e6AMDX41LlEy9HbginkCIefuAKMNuutkHdFEHTz67IohrBmHLyQqGbJxobAAsos\" target=\"_blank\"><img alt=\"Placeholder image\" src=\"https://d2j5ihb19pt1hq.cloudfront.net/sdp_page/s12n_logos/Duke_JavaProgrammingIntrotoSoftware_CM195522.jpg?w=80&amp;h=80&amp;fit=crop&amp;bg=FFF\" style=\"height:90px; width:100px\" /></a></td>\r\n						<td><a href=\"https://eventing.coursera.org/redirect/PHCIXgtoxGtN1jGIF4HAIGUuwDQgW_hZ2jlR8-1jp-sTV5DDfIQXIkKPBdckCZpPjxFrIvfkMaGgybCQkl1ejA.x9CTk2edhW8l084ycCocAg.YNHTW-YrvsDi_7eiE4ZUv-bVOFqrx_LqacDM0Y1cJnMTaK50sG4Uy3EEHOJLcuan4U3bHWTx_5XNgFFLg2OJnxBRLPeXdHEW9SiEGfIvAfeKPiHJ5xaPdk1-pVhfiHRiP83cBtLil_OkxmDb4X_4dzZzSlHJvqbV-2omMC5dasXQTr04rQuQGhXjgzyazfa_trAmzVN4RYl2Js6istM4b5G4HL5pt696T4BCOVPjEZ4xwfnD_M6Ma2V6Kao9AaMUQM_keVTzkpRwzlo9D5cJ2UO_N4xtyah1b-aFLw6scecoKDgwC9DbEHo8Mm-1NGkjTBGvxVB-o9e8KmMCa9Dmsjw_IYTA9Rv-lkurtSNzb-NLZTCBGbMu073MmYcd_1dei8_QYDjEyktS9P6coCqKuYj7ccenOoGGc55_c1EVVgTc7l9vVCcocdPp905B404sXY34UX0Y5TI-9F0eOlOhCdufFoRfwSH1KB7UtkQ4n6g4ZuVe9idOxabmgRPEASR_yoRUjXfxEskOBVQIYB6OsHb8PadEz44nnWPnbuWjfQY\" target=\"_blank\">Java Programming: An Introduction to Software</a><br />\r\n						Duke University &bull; Available Now</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><a href=\"https://eventing.coursera.org/redirect/z5xqbKgI3aXNGF1B7xZyCzsUEX4QRycM3D86NppWDY4cgYcqO06NLR40EqaE-Fs5tf3CMaSUlGjkeVzzl402Jw.Ule9mGvPxqL11aA-e9qqOw.GFroN7zFGBHmgLx0RhoFQHLxKUufUxR73grN-vZSsbZQRrQYazouRu3Y0KJTBT1AQbnGY0mI-73jAooCnX4-ptMTof2mmTDEMrX2drEU47cNd6PBagykPGPtAMc3rL1pUWfLsa5AtywP8om25v4rLRoKWFA9Wf9P9eJ2CNfMAOytKrjJx8_KM_ZlBtWylH0a7xgcR1IafYfAIQfekFQt4js2p-B391zIdNupLxHlGN5Gzt1kKNDlL0vfPdRRgFHzNEXUcFErpheaffXOuNYk0WqmaHlJlgt6EpOJph940kzSdCoi-xWvGWuf41v1QnTYEGAeCHU0Mn5hN39-Qh1Xqbq4vSbNxNlMXWoju3CNblVE62r9LvNnWMxwRlIVSSZcIxaNmIm4bVK81MrMrUlaZkka-OPYUQe_aL8is36DQ2GEFtajQq0WKD9sY8ZG7qlUqX7iVSyAdEJNIne_4LOQityhnzVAXMphNmxTIwP0pmcAlopzFzTzPTVrbhT9xtblQjfjVhFMkgxT3S6y60oCng\" target=\"_blank\"><img alt=\"Placeholder image\" src=\"https://d2j5ihb19pt1hq.cloudfront.net/sdp_page/s12n_logos/python.jpg?w=80&amp;h=80&amp;fit=crop&amp;bg=FFF\" style=\"height:90px; width:100px\" /></a></td>\r\n						<td><a href=\"https://eventing.coursera.org/redirect/6Lu_NSE4uUhYstew7QK6Si5l1-O7AWvG_mGDD-DCujdMP17Q9Xl_MeOP6I3YXSPlFMFemzqf7Tc5zqmMprOG4g.gG2AGQGkOLOsIkwYkvYcJA.7YwXHjHUv2EmtxQDPUUb1PliLDdw0ytSHX3UAHljpEF8aI6Nh9PNCbsSipOkmoURJY3nON-b7d8dTn6rTDeoXxrfPvSuuzIhrvwRaMCk2yBXt-eHX_pU0Ql-Um58HwDaj7_SlE1YoWr41VaHw-HjEWqrh-rkuHNoyEcdnr0PNhy5mBzgf61JvtULG21Q_EqO2rnTIFBu4_awzQvQ-1r0RucDR0a6gAVpSfKCuN-CzPsruiUnAzHqpIh7a_hz9QvZwaSd2CQZIig6aB2zLQK1LSRn6XO5QTqBWP2LJXCR96Jvm1IblHqT_vJkBaVkjWZhiI1Em09cwhOY6YCKuETRtpPUXswY0-GU7GptH2hIbC-j6w1khGkeTilaNnY2quI2Jb8y9yBZsg3TSf1ScWmtFVEvT74SDRo1X0pPBQufc1FWyCKc5EyvkBt-xv7XOQAHzWHXcYVZCot7Dhp-TK_kNctMIcj9-Lcq_UknUicW205KBQ-kJfXb63LXveOc56eUlIb76uBaVfm5bVOtp_A1gQ\" target=\"_blank\">Python for Everybody</a><br />\r\n						University of Michigan &bull; Available Now</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>','<p>sdgfs dgs</p>'),(4,1,1,1,'Gatekeeper','',''),(5,5,1,1,'Non redundant electrical supplier','',''),(6,1,1,1,'Buffer Overflow','','');
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
INSERT INTO `vulnerability_document` VALUES (2,8),(2,11),(2,12),(4,8),(4,10);
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
INSERT INTO `vulnerabilitylevel` VALUES (1,3,'Medium'),(2,1,'Low'),(5,5,'High');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vulnerabilitytype`
--

LOCK TABLES `vulnerabilitytype` WRITE;
/*!40000 ALTER TABLE `vulnerabilitytype` DISABLE KEYS */;
INSERT INTO `vulnerabilitytype` VALUES (1,'Software','<h2>Setting up the tests directory<a href=\"http://framework.zend.com/manual/current/en/tutorials/unittesting.html#setting-up-the-tests-directory\">&para;</a></h2>\r\n\r\n<p>As Zend Framework 2 applications are built from modules that should be standalone blocks of an application, we don&rsquo;t test the application in it&rsquo;s entirety, but module by module.</p>\r\n\r\n<p>We will show how to set up the minimum requirements to test a module, the&nbsp;<tt>Album</tt>&nbsp;module we wrote in the user guide, and which then can be used as a base for testing any other module.</p>\r\n\r\n<p>Start by creating a directory called&nbsp;<tt>test</tt>&nbsp;in&nbsp;<tt>zf2-tutorial\\module\\Album</tt>&nbsp;with the following subdirectories:</p>\r\n\r\n<pre>\r\nzf2-tutorial/\r\n    /module\r\n        /Album\r\n            /test\r\n                /AlbumTest\r\n                    /Controller\r\n</pre>\r\n\r\n<p>The structure of the&nbsp;<tt>test</tt>&nbsp;directory matches exactly with that of the module&rsquo;s source files, and it will allow you to keep your tests well-organized and easy to find.</p>\r\n\r\n<h2>Bootstrapping your tests<a href=\"http://framework.zend.com/manual/current/en/tutorials/unittesting.html#bootstrapping-your-tests\">&para;</a></h2>\r\n\r\n<p>Next, create a file called&nbsp;<tt>phpunit.xml</tt>&nbsp;under&nbsp;<tt>zf2-tutorial/module/Album/test</tt>:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<pre>\r\n1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9</pre>\r\n			</td>\r\n			<td>\r\n			<pre>\r\n&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;\r\n\r\n&lt;phpunit bootstrap=&quot;Bootstrap.php&quot; colors=&quot;true&quot;&gt;\r\n    &lt;testsuites&gt;\r\n        &lt;testsuite name=&quot;zf2tutorial&quot;&gt;\r\n            &lt;directory&gt;./AlbumTest&lt;/directory&gt;\r\n        &lt;/testsuite&gt;\r\n    &lt;/testsuites&gt;\r\n&lt;/phpunit&gt;\r\n</pre>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>And a file called&nbsp;<tt>Bootstrap.php</tt>, also under&nbsp;<tt>zf2-tutorial/module/Album/test</tt>:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<pre>\r\n 1\r\n 2\r\n 3\r\n 4\r\n 5\r\n 6\r\n 7\r\n 8\r\n 9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\n16\r\n17\r\n18\r\n19\r\n20\r\n21\r\n22\r\n23\r\n24\r\n25\r\n26\r\n27\r\n28\r\n29\r\n30\r\n31\r\n32\r\n33\r\n34\r\n35\r\n36\r\n37\r\n38\r\n39\r\n40\r\n41\r\n42\r\n43\r\n44\r\n45\r\n46\r\n47\r\n48\r\n49\r\n50\r\n51\r\n52\r\n53\r\n54\r\n55\r\n56\r\n57\r\n58\r\n59\r\n60\r\n61\r\n62\r\n63\r\n64\r\n65\r\n66\r\n67\r\n68\r\n69\r\n70\r\n71\r\n72\r\n73\r\n74\r\n75\r\n76\r\n77\r\n78\r\n79\r\n80\r\n81\r\n82\r\n83\r\n84\r\n85\r\n86\r\n87\r\n88\r\n89\r\n90\r\n91\r\n92\r\n93\r\n94\r\n95\r\n96\r\n97\r\n98\r\n99</pre>\r\n			</td>\r\n			<td>\r\n			<pre>\r\n&lt;?php\r\n\r\nnamespace AlbumTest;\r\n\r\nuse Zend\\Loader\\AutoloaderFactory;\r\nuse Zend\\Mvc\\Service\\ServiceManagerConfig;\r\nuse Zend\\ServiceManager\\ServiceManager;\r\nuse RuntimeException;\r\n\r\nerror_reporting(E_ALL | E_STRICT);\r\nchdir(__DIR__);\r\n\r\n/**\r\n * Test bootstrap, for setting up autoloading\r\n */\r\nclass Bootstrap\r\n{\r\n    protected static $serviceManager;\r\n\r\n    public static function init()\r\n    {\r\n        $zf2ModulePaths = array(dirname(dirname(__DIR__)));\r\n        if (($path = static::findParentPath(&#39;vendor&#39;))) {\r\n            $zf2ModulePaths[] = $path;\r\n        }\r\n        if (($path = static::findParentPath(&#39;module&#39;)) !== $zf2ModulePaths[0]) {\r\n            $zf2ModulePaths[] = $path;\r\n        }\r\n\r\n        static::initAutoloader();\r\n\r\n        // use ModuleManager to load this module and it&#39;s dependencies\r\n        $config = array(\r\n            &#39;module_listener_options&#39; =&gt; array(\r\n                &#39;module_paths&#39; =&gt; $zf2ModulePaths,\r\n            ),\r\n            &#39;modules&#39; =&gt; array(\r\n                &#39;Album&#39;\r\n            )\r\n        );\r\n\r\n        $serviceManager = new ServiceManager(new ServiceManagerConfig());\r\n        $serviceManager-&gt;setService(&#39;ApplicationConfig&#39;, $config);\r\n        $serviceManager-&gt;get(&#39;ModuleManager&#39;)-&gt;loadModules();\r\n        static::$serviceManager = $serviceManager;\r\n    }\r\n\r\n    public static function chroot()\r\n    {\r\n        $rootPath = dirname(static::findParentPath(&#39;module&#39;));\r\n        chdir($rootPath);\r\n    }\r\n\r\n    public static function getServiceManager()\r\n    {\r\n        return static::$serviceManager;\r\n    }\r\n\r\n    protected static function initAutoloader()\r\n    {\r\n        $vendorPath = static::findParentPath(&#39;vendor&#39;);\r\n\r\n        if (file_exists($vendorPath.&#39;/autoload.php&#39;)) {\r\n            include $vendorPath.&#39;/autoload.php&#39;;\r\n        }\r\n\r\n        if (! class_exists(&#39;Zend\\Loader\\AutoloaderFactory&#39;)) {\r\n            throw new RuntimeException(\r\n                &#39;Unable to load ZF2. Run `php composer.phar install`&#39;\r\n            );\r\n        }\r\n\r\n        AutoloaderFactory::factory(array(\r\n            &#39;Zend\\Loader\\StandardAutoloader&#39; =&gt; array(\r\n                &#39;autoregister_zf&#39; =&gt; true,\r\n                &#39;namespaces&#39; =&gt; array(\r\n                    __NAMESPACE__ =&gt; __DIR__ . &#39;/&#39; . __NAMESPACE__,\r\n                ),\r\n            ),\r\n        ));\r\n    }\r\n\r\n    protected static function findParentPath($path)\r\n    {\r\n        $dir = __DIR__;\r\n        $previousDir = &#39;.&#39;;\r\n        while (!is_dir($dir . &#39;/&#39; . $path)) {\r\n            $dir = dirname($dir);\r\n            if ($previousDir === $dir) {\r\n                return false;\r\n            }\r\n            $previousDir = $dir;\r\n        }\r\n        return $dir . &#39;/&#39; . $path;\r\n    }\r\n}\r\n\r\nBootstrap::init();\r\nBootstrap::chroot();</pre>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>'),(3,'Phisycal','<p>aaaaaaa</p>');
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

-- Dump completed on 2015-11-19 10:04:38
