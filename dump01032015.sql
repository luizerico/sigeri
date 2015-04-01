-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: zend004
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.10.1

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
  `attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2AF5A5CC54C8C93` (`type_id`),
  KEY `IDX_2AF5A5CF65B3645` (`analyst_id`),
  KEY `IDX_2AF5A5CF8BD700D` (`unit_id`),
  CONSTRAINT `FK_2AF5A5CC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `assettype` (`id`),
  CONSTRAINT `FK_2AF5A5CF65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_2AF5A5CF8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (13,'sgfsdfgsdgfdsg00','fdgsdgfsdfgsdfgsdgs',1,1,3,'asdfasdfasf'),(14,'sdfgs','sdfgsdf',1,3,1,''),(15,'asadaa','asdad',2,1,1,''),(16,'asdfasdfas','asdfasdfas',2,NULL,NULL,''),(19,'dfjhdfjhdfj','dfjdfjgdd',2,NULL,NULL,''),(20,'Asfadsf','asdfasdfast',1,NULL,NULL,''),(21,'dsfgsdfgsg','sdfgsdgfsg',1,NULL,NULL,''),(22,'Essertwetr','wertwertwe',1,NULL,NULL,''),(23,'gfasfasdf','asdfasdfas',2,NULL,NULL,''),(24,'Asfasdfas','asdfasfsad',1,NULL,NULL,''),(25,'sdfgs','sdfgsdg',2,NULL,NULL,''),(28,'sgsdfgs','sdfgsdfg',1,NULL,NULL,''),(29,'jgvvigyv','tfctufcutfcu',2,NULL,NULL,''),(30,'sfty tyse','sdfg sdg s',2,NULL,NULL,''),(31,'sdfgs','sdfgsdfg',1,NULL,NULL,''),(32,'hjhjhj','hjhjh',2,NULL,NULL,'');
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
INSERT INTO `asset_asset` VALUES (13,14),(13,19),(13,20),(14,15),(15,19),(15,20);
/*!40000 ALTER TABLE `asset_asset` ENABLE KEYS */;
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
INSERT INTO `asset_risk` VALUES (13,11),(13,13),(14,13),(15,13),(30,7);
/*!40000 ALTER TABLE `asset_risk` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettype`
--

LOCK TABLES `assettype` WRITE;
/*!40000 ALTER TABLE `assettype` DISABLE KEYS */;
INSERT INTO `assettype` VALUES (1,'0000000','0000000'),(2,'111111','111111');
/*!40000 ALTER TABLE `assettype` ENABLE KEYS */;
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
INSERT INTO `document` VALUES (6,'rtwert','wertwert','rtyrty',NULL),(7,'rtwert','wertwert','',NULL),(8,'rtwert','wertwert','',NULL),(9,'rtwert','wertwert','',NULL),(10,'rtwert','wertwert','',NULL),(11,'rtwert','wertwert','',NULL),(12,'rtwert','wertwert','',NULL),(13,'rtwert','wertwert','',NULL),(14,'rtwert','wertwert','',NULL),(15,'Fasfas','asdfasdfda','',NULL),(16,'asdfasf','asdfadf','',NULL),(17,'asdfasf','asdfadf','',NULL),(18,'asdfasf','asdfadf','',NULL),(19,'asdfasf','asdfadf','',NULL),(20,'asdfasf','asdfadf','',NULL),(21,'asdfasf','asdfadf','',NULL),(22,'asdfasf','asdfadf','',NULL),(23,'asdfasf','asdfadf','',NULL),(24,'asdfasf','asdfadf','',NULL),(25,'asdfasf','asdfadf','',NULL),(26,'asdfasf','asdfadf','',NULL),(27,'asdfasf','asdfadf','',NULL),(28,'asdfasf','asdfadf','',NULL),(29,'asdfasf','asdfadf','',NULL),(30,'asdfasf','asdfadf','',NULL),(31,'asdfasf','asdfadf','',NULL),(32,'asdfasf','asdfadf','',NULL),(33,'asdfasf','asdfadf','',NULL),(34,'asdfasf','asdfadf','',NULL),(35,'asdfasf','asdfadf','',NULL),(36,'asdfasf','asdfadf','',NULL),(37,'asdfasf','asdfadf','',NULL),(38,'asdfasf','asdfadf','',NULL),(39,'asdfasf','asdfadf','',NULL),(40,'asdfasf','asdfadf','',NULL),(41,'asdfasf','asdfadf','',NULL),(42,'asdfasf','asdfadf','',NULL),(47,'documento(19).pdf','application/pdf','Documento 19addd',NULL),(48,'DivulgaÃ§Ã£o da Vaga Analista de SeguranÃ§a da InformaÃ§Ã£o.jpg','image/jpeg','Doc77777',NULL),(49,'NOVO_-_Modelo_CatÃ¡logo_de_ServiÃ§os.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','TESTE',NULL),(61,'Ementa_dos_treinamentos-Citsmart_Administrador_Citsmart_PT.pdf','application/pdf','sdafgsdgf',NULL);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'GEASI','GestÃ£o da Infraestrutura'),(2,'SUTIN','Superintendencia de TI'),(3,'sdfgsdfgsgsgfsgsdgsd','sdfg sdg');
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
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impact`
--

LOCK TABLES `impact` WRITE;
/*!40000 ALTER TABLE `impact` DISABLE KEYS */;
INSERT INTO `impact` VALUES (1,3,'mÃ©dio'),(2,5,'alto');
/*!40000 ALTER TABLE `impact` ENABLE KEYS */;
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
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `probability`
--

LOCK TABLES `probability` WRITE;
/*!40000 ALTER TABLE `probability` DISABLE KEYS */;
INSERT INTO `probability` VALUES (1,1,'baixa'),(2,5,'alta');
/*!40000 ALTER TABLE `probability` ENABLE KEYS */;
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
  `threat_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `annotations` longtext COLLATE utf8_unicode_ci,
  `type_id` int(11) DEFAULT NULL,
  `detimpact` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_7906D541D09E6F09` (`probability_id`),
  KEY `IDX_7906D541D128BC9B` (`impact_id`),
  KEY `IDX_7906D541C54C8C93` (`type_id`),
  KEY `IDX_7906D541B2891786` (`threat_id`),
  KEY `IDX_7906D541F65B3645` (`analyst_id`),
  CONSTRAINT `FK_7906D541B2891786` FOREIGN KEY (`threat_id`) REFERENCES `threat` (`id`),
  CONSTRAINT `FK_7906D541D09E6F09` FOREIGN KEY (`probability_id`) REFERENCES `probability` (`id`),
  CONSTRAINT `FK_7906D541D128BC9B` FOREIGN KEY (`impact_id`) REFERENCES `impact` (`id`),
  CONSTRAINT `FK_7906D541F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk`
--

LOCK TABLES `risk` WRITE;
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
INSERT INTO `risk` VALUES (7,'Risk 0000999','asfdas fas',1,1,2,1,'2015-03-03','df hdf hdfh d',2,'dfghdfhgdh'),(11,'Assfasdf','adsf asfa',2,1,2,3,'2015-03-28','asdf asfa sfa sf',2,NULL),(12,'Fgsdg sdgs','sd gsdg sdg',1,1,2,1,'2015-03-24','sd gsdg sgg',2,'sdg sdg sfdg'),(13,'Riwk 0002','qwerqwr',2,1,2,1,'2015-03-06','qwerqq',2,'qerqwer'),(14,'sdfasdf','asdfasdfa',1,1,2,1,'2015-03-18','asfdasdfas',2,'asdfasdf');
/*!40000 ALTER TABLE `risk` ENABLE KEYS */;
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
INSERT INTO `risktype` VALUES (2,'Type01','asfasf'),(3,'Type02','asdfasdff'),(4,' Type 0009','sdfgsdf gsdf gsf');
/*!40000 ALTER TABLE `risktype` ENABLE KEYS */;
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
  `source_id` int(11) DEFAULT NULL,
  `analyst_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `date` date NOT NULL,
  `annotations` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_2C975CE75FB14BA7` (`level_id`),
  KEY `IDX_2C975CE7C54C8C93` (`type_id`),
  KEY `IDX_2C975CE7953C1C61` (`source_id`),
  KEY `IDX_2C975CE7F65B3645` (`analyst_id`),
  CONSTRAINT `FK_2C975CE75FB14BA7` FOREIGN KEY (`level_id`) REFERENCES `threatlevel` (`id`),
  CONSTRAINT `FK_2C975CE7953C1C61` FOREIGN KEY (`source_id`) REFERENCES `threatsource` (`id`),
  CONSTRAINT `FK_2C975CE7C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `threattype` (`id`),
  CONSTRAINT `FK_2C975CE7F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat`
--

LOCK TABLES `threat` WRITE;
/*!40000 ALTER TABLE `threat` DISABLE KEYS */;
INSERT INTO `threat` VALUES (2,1,2,2,1,'Hacker','Hacker  dsfgsd','2012-12-31','asdfadsf afasfas fasdf'),(3,1,2,1,1,'sdfgsdfgsdf','sdfgsdfgsd','2015-03-03','sdgsfg s');
/*!40000 ALTER TABLE `threat` ENABLE KEYS */;
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
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threatlevel`
--

LOCK TABLES `threatlevel` WRITE;
/*!40000 ALTER TABLE `threatlevel` DISABLE KEYS */;
INSERT INTO `threatlevel` VALUES (1,1,'Baixa'),(2,2,'MÃ©dia'),(4,5,'sdfgsdfgdss');
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
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threatsource`
--

LOCK TABLES `threatsource` WRITE;
/*!40000 ALTER TABLE `threatsource` DISABLE KEYS */;
INSERT INTO `threatsource` VALUES (1,'Internet','Rede de Dados Mundial - Internet'),(2,'Hacker','Pessoa com grandes conhecimentos de TI');
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
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threattype`
--

LOCK TABLES `threattype` WRITE;
/*!40000 ALTER TABLE `threattype` DISABLE KEYS */;
INSERT INTO `threattype` VALUES (2,'Haker001','asfgas'),(3,'sdfg s','sdg sdg');
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `detail` longtext COLLATE utf8_unicode_ci,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8D93D649F8BD700D` (`unit_id`),
  KEY `IDX_8D93D649783E3463` (`manager_id`),
  CONSTRAINT `FK_8D93D649783E3463` FOREIGN KEY (`manager_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_8D93D649F8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'CEOOO',3,'sdfgfdsg','asdfaaa@afsaf.com',NULL),(3,'Frederico Menezes',1,'Gerente de Redes e SeguranÃ§a','frederico.menezes@conab.gov.br',NULL),(4,'Luiz Ã‰rico',3,'sdgfasfasf','luiz.almeida@conab.gov.br',NULL);
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
INSERT INTO `user_group` VALUES (1,1),(3,1),(3,2),(4,1);
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
  `date` date NOT NULL,
  `annotations` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_6C4E40475FB14BA7` (`level_id`),
  KEY `IDX_6C4E4047C54C8C93` (`type_id`),
  KEY `IDX_6C4E4047F65B3645` (`analyst_id`),
  CONSTRAINT `FK_6C4E40475FB14BA7` FOREIGN KEY (`level_id`) REFERENCES `vulnerabilitylevel` (`id`),
  CONSTRAINT `FK_6C4E4047C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `vulnerabilitytype` (`id`),
  CONSTRAINT `FK_6C4E4047F65B3645` FOREIGN KEY (`analyst_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vulnerability`
--

LOCK TABLES `vulnerability` WRITE;
/*!40000 ALTER TABLE `vulnerability` DISABLE KEYS */;
INSERT INTO `vulnerability` VALUES (2,1,1,3,'Falha nas Portas','sdfgsdfgsdf','2015-03-04','sdgfs dgs');
/*!40000 ALTER TABLE `vulnerability` ENABLE KEYS */;
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
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vulnerabilitylevel`
--

LOCK TABLES `vulnerabilitylevel` WRITE;
/*!40000 ALTER TABLE `vulnerabilitylevel` DISABLE KEYS */;
INSERT INTO `vulnerabilitylevel` VALUES (1,3,'mÃ©dio'),(2,1,'Baixo'),(4,4,'44444');
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
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vulnerabilitytype`
--

LOCK TABLES `vulnerabilitytype` WRITE;
/*!40000 ALTER TABLE `vulnerabilitytype` DISABLE KEYS */;
INSERT INTO `vulnerabilitytype` VALUES (1,'Software','Falha de Software 001'),(3,'Software','aaaaaaa'),(4,'Assfadfaasfa ggg','adfadfa');
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

-- Dump completed on 2015-04-01 15:28:08
