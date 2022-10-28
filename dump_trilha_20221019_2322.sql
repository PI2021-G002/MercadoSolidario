-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: 172.31.16.40    Database: trilha
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `TrilhaDaEvolucao_agendamentos`
--

DROP TABLE IF EXISTS `TrilhaDaEvolucao_agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrilhaDaEvolucao_agendamentos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `id_tipo` bigint NOT NULL,
  `id_familia_id` bigint NOT NULL,
  `hora` time(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TrilhaDaEvolucao_age_id_familia_id_b4a103c7_fk_TrilhaDaE` (`id_familia_id`),
  CONSTRAINT `TrilhaDaEvolucao_age_id_familia_id_b4a103c7_fk_TrilhaDaE` FOREIGN KEY (`id_familia_id`) REFERENCES `TrilhaDaEvolucao_familia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrilhaDaEvolucao_agendamentos`
--

LOCK TABLES `TrilhaDaEvolucao_agendamentos` WRITE;
/*!40000 ALTER TABLE `TrilhaDaEvolucao_agendamentos` DISABLE KEYS */;
INSERT INTO `TrilhaDaEvolucao_agendamentos` VALUES (4,'2021-11-20','V',1,1,'18:11:00.000000'),(5,'2021-11-20','V',2,2,'15:00:00.000000'),(7,'2021-11-15','P',4,2,'19:00:00.000000'),(8,'2021-11-18','V',2,2,'18:15:00.000000'),(10,'2021-11-18','V',2,4,'17:30:00.000000'),(11,'2021-11-18','V',2,4,'19:30:00.000000'),(12,'2021-11-20','V',2,2,'15:00:00.000000'),(15,'2021-11-20','V',2,5,'15:00:00.000000'),(16,'2021-11-22','V',1,2,'13:00:00.000000'),(17,'2021-11-22','V',1,2,'13:00:00.000000'),(18,'2021-11-26','V',2,5,'17:00:00.000000'),(19,'2021-11-24','V',1,2,'13:00:00.000000');
/*!40000 ALTER TABLE `TrilhaDaEvolucao_agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrilhaDaEvolucao_areaacompanhamento`
--

DROP TABLE IF EXISTS `TrilhaDaEvolucao_areaacompanhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrilhaDaEvolucao_areaacompanhamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `concluido` tinyint(1) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date DEFAULT NULL,
  `observacao` varchar(255) NOT NULL,
  `completude` double DEFAULT NULL,
  `id_area_programa_id` bigint NOT NULL,
  `id_familia_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrilhaDaEvolucao_are_id_area_programa_id_399274aa_fk_TrilhaDaE` (`id_area_programa_id`),
  KEY `TrilhaDaEvolucao_are_id_familia_id_afceb05f_fk_TrilhaDaE` (`id_familia_id`),
  CONSTRAINT `TrilhaDaEvolucao_are_id_area_programa_id_399274aa_fk_TrilhaDaE` FOREIGN KEY (`id_area_programa_id`) REFERENCES `TrilhaDaEvolucao_areaprograma` (`id`),
  CONSTRAINT `TrilhaDaEvolucao_are_id_familia_id_afceb05f_fk_TrilhaDaE` FOREIGN KEY (`id_familia_id`) REFERENCES `TrilhaDaEvolucao_familia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrilhaDaEvolucao_areaacompanhamento`
--

LOCK TABLES `TrilhaDaEvolucao_areaacompanhamento` WRITE;
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areaacompanhamento` DISABLE KEYS */;
INSERT INTO `TrilhaDaEvolucao_areaacompanhamento` VALUES (1,0,'2021-11-09',NULL,'Avaliação',80,2,2),(2,0,'2021-11-09',NULL,'Coment´rio da Patrícia',50,4,2),(3,0,'2021-11-13',NULL,'Recuperação pós COVID 19',20,5,3);
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areaacompanhamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrilhaDaEvolucao_areaatuacaoparceiro`
--

DROP TABLE IF EXISTS `TrilhaDaEvolucao_areaatuacaoparceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrilhaDaEvolucao_areaatuacaoparceiro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(1000) NOT NULL,
  `id_area_par_id` bigint NOT NULL,
  `id_par_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrilhaDaEvolucao_are_id_area_par_id_40e982e8_fk_TrilhaDaE` (`id_area_par_id`),
  KEY `TrilhaDaEvolucao_are_id_par_id_05d56097_fk_TrilhaDaE` (`id_par_id`),
  CONSTRAINT `TrilhaDaEvolucao_are_id_area_par_id_40e982e8_fk_TrilhaDaE` FOREIGN KEY (`id_area_par_id`) REFERENCES `TrilhaDaEvolucao_areaparceiro` (`id`),
  CONSTRAINT `TrilhaDaEvolucao_are_id_par_id_05d56097_fk_TrilhaDaE` FOREIGN KEY (`id_par_id`) REFERENCES `TrilhaDaEvolucao_parceiro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrilhaDaEvolucao_areaatuacaoparceiro`
--

LOCK TABLES `TrilhaDaEvolucao_areaatuacaoparceiro` WRITE;
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areaatuacaoparceiro` DISABLE KEYS */;
INSERT INTO `TrilhaDaEvolucao_areaatuacaoparceiro` VALUES (1,'Doação mensal de 450Kg de grãos',2,1);
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areaatuacaoparceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrilhaDaEvolucao_areaatuacaovoluntario`
--

DROP TABLE IF EXISTS `TrilhaDaEvolucao_areaatuacaovoluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrilhaDaEvolucao_areaatuacaovoluntario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(1000) NOT NULL,
  `id_area_vol_id` bigint NOT NULL,
  `id_vol_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrilhaDaEvolucao_are_id_area_vol_id_3b9f3a9f_fk_TrilhaDaE` (`id_area_vol_id`),
  KEY `TrilhaDaEvolucao_are_id_vol_id_7227636d_fk_TrilhaDaE` (`id_vol_id`),
  CONSTRAINT `TrilhaDaEvolucao_are_id_area_vol_id_3b9f3a9f_fk_TrilhaDaE` FOREIGN KEY (`id_area_vol_id`) REFERENCES `TrilhaDaEvolucao_areavoluntario` (`id`),
  CONSTRAINT `TrilhaDaEvolucao_are_id_vol_id_7227636d_fk_TrilhaDaE` FOREIGN KEY (`id_vol_id`) REFERENCES `TrilhaDaEvolucao_voluntario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrilhaDaEvolucao_areaatuacaovoluntario`
--

LOCK TABLES `TrilhaDaEvolucao_areaatuacaovoluntario` WRITE;
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areaatuacaovoluntario` DISABLE KEYS */;
INSERT INTO `TrilhaDaEvolucao_areaatuacaovoluntario` VALUES (1,'Apoio Jurídico Geral',1,1);
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areaatuacaovoluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrilhaDaEvolucao_areaparceiro`
--

DROP TABLE IF EXISTS `TrilhaDaEvolucao_areaparceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrilhaDaEvolucao_areaparceiro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrilhaDaEvolucao_areaparceiro`
--

LOCK TABLES `TrilhaDaEvolucao_areaparceiro` WRITE;
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areaparceiro` DISABLE KEYS */;
INSERT INTO `TrilhaDaEvolucao_areaparceiro` VALUES (2,'Alimentação','alimentação');
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areaparceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrilhaDaEvolucao_areaprograma`
--

DROP TABLE IF EXISTS `TrilhaDaEvolucao_areaprograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrilhaDaEvolucao_areaprograma` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrilhaDaEvolucao_areaprograma`
--

LOCK TABLES `TrilhaDaEvolucao_areaprograma` WRITE;
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areaprograma` DISABLE KEYS */;
INSERT INTO `TrilhaDaEvolucao_areaprograma` VALUES (1,'Organização Pessoal','Organização Pessoal',1),(2,'Alimentação','Mercado Solidário',1),(3,'Trabalho e renda','Orientação para currículo ou empreendedorismp',1),(4,'Cidania','Cidania',1),(5,'Saúde','Acompanhamento e orientação para Saúde',1);
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areaprograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrilhaDaEvolucao_areavoluntario`
--

DROP TABLE IF EXISTS `TrilhaDaEvolucao_areavoluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrilhaDaEvolucao_areavoluntario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrilhaDaEvolucao_areavoluntario`
--

LOCK TABLES `TrilhaDaEvolucao_areavoluntario` WRITE;
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areavoluntario` DISABLE KEYS */;
INSERT INTO `TrilhaDaEvolucao_areavoluntario` VALUES (1,'Jurídico','Orientar as Famílias em relação à quest. Jurídicas'),(2,'Marketing','marketing'),(3,'Mercado Solidário','Mercado');
/*!40000 ALTER TABLE `TrilhaDaEvolucao_areavoluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrilhaDaEvolucao_familia`
--

DROP TABLE IF EXISTS `TrilhaDaEvolucao_familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrilhaDaEvolucao_familia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `ano` int NOT NULL,
  `nro_membros` int NOT NULL,
  `acomp_concluido` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrilhaDaEvolucao_familia`
--

LOCK TABLES `TrilhaDaEvolucao_familia` WRITE;
/*!40000 ALTER TABLE `TrilhaDaEvolucao_familia` DISABLE KEYS */;
INSERT INTO `TrilhaDaEvolucao_familia` VALUES (1,'Maria da Silva','999999999',2021,6,0),(2,'Alessandra Aparecida','999999999',2021,4,0),(3,'José Geraldo','9999999999',2021,5,0),(4,'João Gilberto','99999999',2021,7,0),(5,'Alessandra','12 999999',2021,5,0),(6,'Jose Geraldo','12 999999',2021,5,0);
/*!40000 ALTER TABLE `TrilhaDaEvolucao_familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrilhaDaEvolucao_parceiro`
--

DROP TABLE IF EXISTS `TrilhaDaEvolucao_parceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrilhaDaEvolucao_parceiro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `disponibilidade` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrilhaDaEvolucao_parceiro`
--

LOCK TABLES `TrilhaDaEvolucao_parceiro` WRITE;
/*!40000 ALTER TABLE `TrilhaDaEvolucao_parceiro` DISABLE KEYS */;
INSERT INTO `TrilhaDaEvolucao_parceiro` VALUES (1,'ComBrasil','9999999','semanal');
/*!40000 ALTER TABLE `TrilhaDaEvolucao_parceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrilhaDaEvolucao_voluntario`
--

DROP TABLE IF EXISTS `TrilhaDaEvolucao_voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrilhaDaEvolucao_voluntario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `disponibilidade` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrilhaDaEvolucao_voluntario`
--

LOCK TABLES `TrilhaDaEvolucao_voluntario` WRITE;
/*!40000 ALTER TABLE `TrilhaDaEvolucao_voluntario` DISABLE KEYS */;
INSERT INTO `TrilhaDaEvolucao_voluntario` VALUES (1,'Dr Ronaldo','999999999','segundas pela manha'),(2,'VItor','999999999','2o sábado');
/*!40000 ALTER TABLE `TrilhaDaEvolucao_voluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add area programa',7,'add_areaprograma'),(26,'Can change area programa',7,'change_areaprograma'),(27,'Can delete area programa',7,'delete_areaprograma'),(28,'Can view area programa',7,'view_areaprograma'),(29,'Can add area voluntario parceiro',8,'add_areavoluntarioparceiro'),(30,'Can change area voluntario parceiro',8,'change_areavoluntarioparceiro'),(31,'Can delete area voluntario parceiro',8,'delete_areavoluntarioparceiro'),(32,'Can view area voluntario parceiro',8,'view_areavoluntarioparceiro'),(33,'Can add familia',9,'add_familia'),(34,'Can change familia',9,'change_familia'),(35,'Can delete familia',9,'delete_familia'),(36,'Can view familia',9,'view_familia'),(37,'Can add voluntario parceiro',10,'add_voluntarioparceiro'),(38,'Can change voluntario parceiro',10,'change_voluntarioparceiro'),(39,'Can delete voluntario parceiro',10,'delete_voluntarioparceiro'),(40,'Can view voluntario parceiro',10,'view_voluntarioparceiro'),(41,'Can add area atuacao voluntario parceiro',11,'add_areaatuacaovoluntarioparceiro'),(42,'Can change area atuacao voluntario parceiro',11,'change_areaatuacaovoluntarioparceiro'),(43,'Can delete area atuacao voluntario parceiro',11,'delete_areaatuacaovoluntarioparceiro'),(44,'Can view area atuacao voluntario parceiro',11,'view_areaatuacaovoluntarioparceiro'),(45,'Can add area acompanhamento',12,'add_areaacompanhamento'),(46,'Can change area acompanhamento',12,'change_areaacompanhamento'),(47,'Can delete area acompanhamento',12,'delete_areaacompanhamento'),(48,'Can view area acompanhamento',12,'view_areaacompanhamento'),(49,'Can add agendamentos',13,'add_agendamentos'),(50,'Can change agendamentos',13,'change_agendamentos'),(51,'Can delete agendamentos',13,'delete_agendamentos'),(52,'Can view agendamentos',13,'view_agendamentos'),(53,'Can add area atuacao parceiro',14,'add_areaatuacaoparceiro'),(54,'Can change area atuacao parceiro',14,'change_areaatuacaoparceiro'),(55,'Can delete area atuacao parceiro',14,'delete_areaatuacaoparceiro'),(56,'Can view area atuacao parceiro',14,'view_areaatuacaoparceiro'),(57,'Can add area atuacao voluntario',15,'add_areaatuacaovoluntario'),(58,'Can change area atuacao voluntario',15,'change_areaatuacaovoluntario'),(59,'Can delete area atuacao voluntario',15,'delete_areaatuacaovoluntario'),(60,'Can view area atuacao voluntario',15,'view_areaatuacaovoluntario'),(61,'Can add area parceiro',16,'add_areaparceiro'),(62,'Can change area parceiro',16,'change_areaparceiro'),(63,'Can delete area parceiro',16,'delete_areaparceiro'),(64,'Can view area parceiro',16,'view_areaparceiro'),(65,'Can add parceiro',17,'add_parceiro'),(66,'Can change parceiro',17,'change_parceiro'),(67,'Can delete parceiro',17,'delete_parceiro'),(68,'Can view parceiro',17,'view_parceiro'),(69,'Can add area voluntario',8,'add_areavoluntario'),(70,'Can change area voluntario',8,'change_areavoluntario'),(71,'Can delete area voluntario',8,'delete_areavoluntario'),(72,'Can view area voluntario',8,'view_areavoluntario'),(73,'Can add voluntario',10,'add_voluntario'),(74,'Can change voluntario',10,'change_voluntario'),(75,'Can delete voluntario',10,'delete_voluntario'),(76,'Can view voluntario',10,'view_voluntario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$3zRN61omSzdsyxNRrZ0ZWD$qfq4sdKQgmxZ8KTFwicLcWcNznPBxd8SJCFLXCZEJNA=','2022-03-14 16:37:36.189898',1,'trilheiros','','','trilheiros@testmail.com',1,1,'2021-11-02 01:54:33.290537');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-11-02 02:36:13.183886','1','Maria da Silva',1,'[{\"added\": {}}]',9,1),(2,'2021-11-02 02:37:41.859172','1','Jurídico',1,'[{\"added\": {}}]',8,1),(3,'2021-11-02 02:38:59.642274','1','Organização Pessoal',1,'[{\"added\": {}}]',7,1),(4,'2021-11-09 21:53:21.541044','2','Alessandra Aparecida',1,'[{\"added\": {}}]',9,1),(5,'2021-11-09 21:54:43.481768','2','Alimentação',1,'[{\"added\": {}}]',7,1),(6,'2021-11-09 21:55:24.159796','3','Trabalho e renda',1,'[{\"added\": {}}]',7,1),(7,'2021-11-09 21:56:28.341147','1','Dr Ronaldo',1,'[{\"added\": {}}]',10,1),(8,'2021-11-09 21:57:13.515067','2','Marketing',1,'[{\"added\": {}}]',8,1),(9,'2021-11-09 21:59:42.183568','1','AreaAtuacaoVoluntarioParceiro object (1)',1,'[{\"added\": {}}]',11,1),(10,'2021-11-09 22:01:45.814046','1','AreaAcompanhamento object (1)',1,'[{\"added\": {}}]',12,1),(11,'2021-11-09 22:05:44.075972','4','Cidania',1,'[{\"added\": {}}]',7,1),(12,'2021-11-09 22:06:53.139354','2','AreaAcompanhamento object (2)',1,'[{\"added\": {}}]',12,1),(13,'2021-11-09 22:16:49.423621','3','Mercado Solidário',1,'[{\"added\": {}}]',8,1),(14,'2021-11-09 22:17:27.408368','2','VItor',1,'[{\"added\": {}}]',10,1),(15,'2021-11-09 22:19:13.497447','2','AreaAtuacaoVoluntarioParceiro object (2)',1,'[{\"added\": {}}]',11,1),(16,'2021-11-13 00:49:37.834584','3','José Geraldo',1,'[{\"added\": {}}]',9,1),(17,'2021-11-13 00:51:12.448037','5','Saúde',1,'[{\"added\": {}}]',7,1),(18,'2021-11-13 00:52:50.357618','3','AreaAcompanhamento object (3)',1,'[{\"added\": {}}]',12,1),(19,'2021-11-14 20:02:47.124634','1','ComBrasil',1,'[{\"added\": {}}]',16,1),(20,'2021-11-14 20:03:05.062295','1','ComBrasil',3,'',16,1),(21,'2021-11-14 20:33:39.336913','4','João Gilberto',1,'[{\"added\": {}}]',9,1),(22,'2021-11-14 20:34:17.000973','1','ComBrasil',1,'[{\"added\": {}}]',17,1),(23,'2021-11-14 20:34:58.788818','2','Alimentação',1,'[{\"added\": {}}]',16,1),(24,'2021-11-14 20:36:28.377949','1','AreaAtuacaoVoluntario object (1)',1,'[{\"added\": {}}]',15,1),(25,'2021-11-14 20:37:00.706458','1','AreaAtuacaoParceiro object (1)',1,'[{\"added\": {}}]',14,1),(26,'2021-11-14 20:37:41.464419','3','AreaAcompanhamento object (3)',2,'[{\"changed\": {\"fields\": [\"Completude\"]}}]',12,1),(27,'2021-11-16 22:31:32.585485','5','Alessandra',1,'[{\"added\": {}}]',9,1),(28,'2021-11-16 23:08:18.909473','6','Jose Geraldo',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(13,'TrilhaDaEvolucao','agendamentos'),(12,'TrilhaDaEvolucao','areaacompanhamento'),(14,'TrilhaDaEvolucao','areaatuacaoparceiro'),(15,'TrilhaDaEvolucao','areaatuacaovoluntario'),(11,'TrilhaDaEvolucao','areaatuacaovoluntarioparceiro'),(16,'TrilhaDaEvolucao','areaparceiro'),(7,'TrilhaDaEvolucao','areaprograma'),(8,'TrilhaDaEvolucao','areavoluntario'),(9,'TrilhaDaEvolucao','familia'),(17,'TrilhaDaEvolucao','parceiro'),(10,'TrilhaDaEvolucao','voluntario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'TrilhaDaEvolucao','0001_initial','2021-11-02 01:51:13.205022'),(2,'contenttypes','0001_initial','2021-11-02 01:51:13.287758'),(3,'auth','0001_initial','2021-11-02 01:51:14.092671'),(4,'admin','0001_initial','2021-11-02 01:51:14.293766'),(5,'admin','0002_logentry_remove_auto_add','2021-11-02 01:51:14.310341'),(6,'admin','0003_logentry_add_action_flag_choices','2021-11-02 01:51:14.324493'),(7,'contenttypes','0002_remove_content_type_name','2021-11-02 01:51:14.482249'),(8,'auth','0002_alter_permission_name_max_length','2021-11-02 01:51:14.577582'),(9,'auth','0003_alter_user_email_max_length','2021-11-02 01:51:14.673006'),(10,'auth','0004_alter_user_username_opts','2021-11-02 01:51:14.687205'),(11,'auth','0005_alter_user_last_login_null','2021-11-02 01:51:14.756005'),(12,'auth','0006_require_contenttypes_0002','2021-11-02 01:51:14.761877'),(13,'auth','0007_alter_validators_add_error_messages','2021-11-02 01:51:14.777675'),(14,'auth','0008_alter_user_username_max_length','2021-11-02 01:51:14.864530'),(15,'auth','0009_alter_user_last_name_max_length','2021-11-02 01:51:14.950231'),(16,'auth','0010_alter_group_name_max_length','2021-11-02 01:51:15.047020'),(17,'auth','0011_update_proxy_permissions','2021-11-02 01:51:15.065938'),(18,'auth','0012_alter_user_first_name_max_length','2021-11-02 01:51:15.157037'),(19,'sessions','0001_initial','2021-11-02 01:51:15.215626'),(20,'TrilhaDaEvolucao','0002_auto_20211102_1748','2021-11-02 23:18:26.618644'),(21,'TrilhaDaEvolucao','0003_rename_time_agendamentos_hora','2021-11-07 15:30:18.266159'),(22,'TrilhaDaEvolucao','0004_auto_20211111_0148','2021-11-11 19:11:18.429307');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0zt4tsayjjhz1yxpe0x6fz7pt1v2obxw','.eJxVjMsOgjAQRf-la9MMtHXApXu-gcyjtagpCYWV8d-VhIVu7znnvsxI25rHrcZlnNRcTGNOvxuTPGLZgd6p3GYrc1mXie2u2INWO8wan9fD_TvIVPO3Zg9tcB2hsEsAJOgdIzcJeqHArfYIGtATR3JnTRGQVTBE13LfgZj3B-2GOHo:1mn7VC:j76s225SDuFIG-w5vA9peOqCP2GevO7pELFvH3rmzqg','2021-11-30 23:04:34.378275'),('8cbblol9d4i07uk12kjf1w5vxy9aw3st','.eJxVjMsOgjAQRf-la9MMtHXApXu-gcyjtagpCYWV8d-VhIVu7znnvsxI25rHrcZlnNRcTGNOvxuTPGLZgd6p3GYrc1mXie2u2INWO8wan9fD_TvIVPO3Zg9tcB2hsEsAJOgdIzcJeqHArfYIGtATR3JnTRGQVTBE13LfgZj3B-2GOHo:1mpK1H:tSII9kU-kCuX0dq8VajYLyWGGAFeTx1kb-GFir5l2iM','2021-12-07 00:50:47.639979'),('i4d9t8ssxfplq2t1rj4futmykzbbk5al','.eJxVjMsOgjAQRf-la9MMtHXApXu-gcyjtagpCYWV8d-VhIVu7znnvsxI25rHrcZlnNRcTGNOvxuTPGLZgd6p3GYrc1mXie2u2INWO8wan9fD_TvIVPO3Zg9tcB2hsEsAJOgdIzcJeqHArfYIGtATR3JnTRGQVTBE13LfgZj3B-2GOHo:1mhq4l:76a288x3eJHYMS9mlU5Eqj3JG0FfafOOf5RCYex9y_I','2021-11-16 09:27:27.312379'),('iyt0cnrheusg2bf65t3cgkqf6v4xls4q','.eJxVjMsOgjAQRf-la9MMtHXApXu-gcyjtagpCYWV8d-VhIVu7znnvsxI25rHrcZlnNRcTGNOvxuTPGLZgd6p3GYrc1mXie2u2INWO8wan9fD_TvIVPO3Zg9tcB2hsEsAJOgdIzcJeqHArfYIGtATR3JnTRGQVTBE13LfgZj3B-2GOHo:1mmLhV:AfpwrsWnDDPPEjLHOycCY78gTLy0D6XJYme1lJFiROg','2021-11-28 20:02:05.709093'),('rbnptaxkt0rv53tkw8q6rgizi41lblry','.eJxVjMsOgjAQRf-la9MMtHXApXu-gcyjtagpCYWV8d-VhIVu7znnvsxI25rHrcZlnNRcTGNOvxuTPGLZgd6p3GYrc1mXie2u2INWO8wan9fD_TvIVPO3Zg9tcB2hsEsAJOgdIzcJeqHArfYIGtATR3JnTRGQVTBE13LfgZj3B-2GOHo:1nTnhQ:qjdFK9MiMNOOWukRNqggB_7_-8iBZiK8aRxbapIjnzk','2022-03-28 16:37:36.201489'),('wjwj61kd5wiywep5mz4l1qbrsgo6y77y','.eJxVjMsOgjAQRf-la9MMtHXApXu-gcyjtagpCYWV8d-VhIVu7znnvsxI25rHrcZlnNRcTGNOvxuTPGLZgd6p3GYrc1mXie2u2INWO8wan9fD_TvIVPO3Zg9tcB2hsEsAJOgdIzcJeqHArfYIGtATR3JnTRGQVTBE13LfgZj3B-2GOHo:1mkZ1Q:LjYFZFXs7NzU4iGEn_D_HMrQ8QvtXiMAogQaOiz3I2M','2021-11-23 21:51:16.703866'),('x96qgfg9x4pjftcw5iqukzxa5of96l7b','.eJxVjMsOgjAQRf-la9MMtHXApXu-gcyjtagpCYWV8d-VhIVu7znnvsxI25rHrcZlnNRcTGNOvxuTPGLZgd6p3GYrc1mXie2u2INWO8wan9fD_TvIVPO3Zg9tcB2hsEsAJOgdIzcJeqHArfYIGtATR3JnTRGQVTBE13LfgZj3B-2GOHo:1mmJ87:oHmDIeS9KVh7fdxZJOOCwD2NL3m55ol9HpyNrMhM8po','2021-11-28 17:17:23.748187');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-20  2:22:41
