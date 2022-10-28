-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: 172.31.16.40    Database: mercado
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
-- Table structure for table `Mercado_atendimento`
--

DROP TABLE IF EXISTS `Mercado_atendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_atendimento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `atendente` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `finalizado` tinyint(1) NOT NULL,
  `solidarios` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_atendimento`
--

LOCK TABLES `Mercado_atendimento` WRITE;
/*!40000 ALTER TABLE `Mercado_atendimento` DISABLE KEYS */;
INSERT INTO `Mercado_atendimento` VALUES (1,'mercado','mercadoSol','2022-06-24',0,500),(2,'mercado','mercadoSol','2022-06-25',0,50),(3,'mercado','mercadoSol','2022-06-27',0,65),(4,'mercado','mercadoSol','2022-06-30',0,50),(5,'mercado','mercadoSol','2022-07-02',0,50),(6,'mercado','mercadoSol','2022-07-02',0,60),(7,'mercado','mercadoSol','2022-07-02',0,40),(8,'mercado','mercadoSol','2022-07-02',0,40),(9,'mercado','mercadoSol','2022-07-04',0,40),(10,'mercado','mercadoSol','2022-09-17',0,50);
/*!40000 ALTER TABLE `Mercado_atendimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mercado_atendimentorascunho`
--

DROP TABLE IF EXISTS `Mercado_atendimentorascunho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_atendimentorascunho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `atendente` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `finalizado` tinyint(1) NOT NULL,
  `solidarios` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_atendimentorascunho`
--

LOCK TABLES `Mercado_atendimentorascunho` WRITE;
/*!40000 ALTER TABLE `Mercado_atendimentorascunho` DISABLE KEYS */;
INSERT INTO `Mercado_atendimentorascunho` VALUES (2,'mercado','mercadoSol','2022-06-23',0,30),(5,'mercado','mercadoSol','2022-06-24',0,50),(9,'mercado','mercadoSol','2022-06-25',0,50),(17,'mercado','mercadoSol','2022-06-27',0,10),(20,'mercado','mercadoSol','2022-07-02',0,40),(23,'mercado','mercadoSol','2022-07-02',0,50),(25,'mercado','mercadoSol','2022-07-02',0,50),(27,'mercado','mercadoSol','2022-07-02',0,50),(29,'mercado','mercadoSol','2022-07-02',0,25),(30,'mercado','mercadoSol','2022-07-02',0,40),(32,'mercado','mercadoSol','2022-07-02',0,50),(33,'mercado','mercadoSol','2022-07-02',0,50),(34,'mercado','mercadoSol','2022-07-02',0,40),(35,'mercado','mercadoSol','2022-07-03',0,40),(37,'mercado','mercadoSol','2022-07-11',0,60),(39,'mercado','mercadoSol','2022-09-17',0,80);
/*!40000 ALTER TABLE `Mercado_atendimentorascunho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mercado_atendimentotemplate`
--

DROP TABLE IF EXISTS `Mercado_atendimentotemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_atendimentotemplate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_atendimentotemplate`
--

LOCK TABLES `Mercado_atendimentotemplate` WRITE;
/*!40000 ALTER TABLE `Mercado_atendimentotemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mercado_atendimentotemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mercado_categoria`
--

DROP TABLE IF EXISTS `Mercado_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_categoria`
--

LOCK TABLES `Mercado_categoria` WRITE;
/*!40000 ALTER TABLE `Mercado_categoria` DISABLE KEYS */;
INSERT INTO `Mercado_categoria` VALUES (1,'Arroz'),(2,'Feijão'),(3,'Sardinha'),(4,'Macarrão'),(5,'Açúcar'),(6,'Óleo'),(7,'Abacaxi em calda'),(8,'Absorvente'),(11,'Achocolatado'),(12,'Água Sanitária'),(13,'Bala'),(14,'Bolacha Doce'),(15,'Bolacha Salgada'),(16,'Bolacha Lata'),(17,'Bombom'),(18,'Bombril'),(19,'Café'),(20,'Canjica'),(21,'Carne Seca'),(22,'Cotonete'),(23,'Creme Dental'),(24,'Desodorante'),(25,'Sardinha em lata'),(26,'Detergente'),(27,'Enlatado'),(28,'Ervilha / Lentilha'),(29,'Escova de Cabelo'),(30,'Escova de Dente'),(31,'Farinha de Aveia'),(32,'Fio Dental'),(33,'Fubá'),(34,'Geleia'),(35,'Leite'),(37,'Maisena'),(38,'Massa pronta para bolo'),(39,'Miojo'),(40,'Molho de Tomate'),(41,'Papel Higiênico'),(42,'Pêssego em Caldas'),(43,'Pipoca'),(44,'Polvilho Doce'),(45,'Sabão em Pedra'),(46,'Sabonete'),(47,'Sal'),(48,'Shampoo'),(49,'Suco'),(50,'Tempero'),(51,'Torrada'),(52,'Trigo para Kibe'),(53,'Uvas Passas / Nozes'),(54,'Vinagre'),(55,'Farinha de Mandioca'),(56,'Farinha de Milho'),(57,'Farinha de Tapioca'),(58,'Farinha de Trigo'),(59,'Atum'),(60,'Leite em Pó'),(61,'Sabão em Pó'),(62,'Farofa Pronta');
/*!40000 ALTER TABLE `Mercado_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mercado_codbarprodsol`
--

DROP TABLE IF EXISTS `Mercado_codbarprodsol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_codbarprodsol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo_barras` bigint NOT NULL,
  `id_produto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_barras` (`codigo_barras`),
  KEY `Mercado_codbarprodso_id_produto_id_fb1ca763_fk_Mercado_p` (`id_produto_id`),
  CONSTRAINT `Mercado_codbarprodso_id_produto_id_fb1ca763_fk_Mercado_p` FOREIGN KEY (`id_produto_id`) REFERENCES `Mercado_produtosolidario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_codbarprodsol`
--

LOCK TABLES `Mercado_codbarprodsol` WRITE;
/*!40000 ALTER TABLE `Mercado_codbarprodsol` DISABLE KEYS */;
INSERT INTO `Mercado_codbarprodsol` VALUES (2,7896548197738,1),(3,7896109801005,4),(4,7896032501010,4),(5,7891910000197,4),(6,7896508200034,4),(7,8480017335852,4),(8,7891107101621,5),(9,7896036090244,5),(10,789247780297,5),(11,7896018900035,5),(12,7898247780006,5),(13,8480017334824,5),(14,7897001010014,5),(15,789223709423,5),(16,7898497682761,5),(17,789110711193,5),(18,7891103204005,3),(19,9788560363339,5),(20,7898215151708,48),(21,7896035731384,25);
/*!40000 ALTER TABLE `Mercado_codbarprodsol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mercado_estoque`
--

DROP TABLE IF EXISTS `Mercado_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_estoque` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `validade` date NOT NULL,
  `id_fonte_id` bigint NOT NULL,
  `data` date DEFAULT NULL,
  `id_produto_id` bigint NOT NULL,
  `quem_cadastrou` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Mercado_estoque_id_fonte_id_d35fe7bb_fk_Mercado_fontedoacao_id` (`id_fonte_id`),
  KEY `Mercado_estoque_id_produto_id_a0c7851a_fk_Mercado_p` (`id_produto_id`),
  CONSTRAINT `Mercado_estoque_id_fonte_id_d35fe7bb_fk_Mercado_fontedoacao_id` FOREIGN KEY (`id_fonte_id`) REFERENCES `Mercado_fontedoacao` (`id`),
  CONSTRAINT `Mercado_estoque_id_produto_id_a0c7851a_fk_Mercado_p` FOREIGN KEY (`id_produto_id`) REFERENCES `Mercado_produtosolidario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_estoque`
--

LOCK TABLES `Mercado_estoque` WRITE;
/*!40000 ALTER TABLE `Mercado_estoque` DISABLE KEYS */;
INSERT INTO `Mercado_estoque` VALUES (1,100,'2023-07-13',3,'2022-06-18',1,'Vitor'),(2,200,'2023-01-01',2,'2022-06-18',1,'mercadoSol'),(3,100,'2022-12-09',2,'2022-06-18',4,'mercadoSol'),(4,100,'2023-03-10',2,'2022-06-26',4,'Vitor'),(5,120,'2023-06-01',2,'2022-06-27',5,'Vitor'),(6,50,'2022-09-15',4,'2022-07-02',48,'Marcio'),(7,50,'2022-09-13',2,'2022-07-02',48,'Vitor'),(8,100,'2022-10-30',2,'2022-07-02',25,'mercadoSol');
/*!40000 ALTER TABLE `Mercado_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mercado_fontedoacao`
--

DROP TABLE IF EXISTS `Mercado_fontedoacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_fontedoacao` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_fontedoacao`
--

LOCK TABLES `Mercado_fontedoacao` WRITE;
/*!40000 ALTER TABLE `Mercado_fontedoacao` DISABLE KEYS */;
INSERT INTO `Mercado_fontedoacao` VALUES (1,'Parceiro - Combrasil','Doação realizada por parceiro'),(2,'Voluntário','Doação exporádica'),(3,'Compra','Compra realizada pela Cidade Social'),(4,'Parceiro - Mvituzzo','parceiro que faz doação em espsécie');
/*!40000 ALTER TABLE `Mercado_fontedoacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mercado_itensatendimento`
--

DROP TABLE IF EXISTS `Mercado_itensatendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_itensatendimento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `validade` date NOT NULL,
  `id_atendimento_id` bigint NOT NULL,
  `id_codigo_id` bigint NOT NULL,
  `produto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `solidarios` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Mercado_itensatendim_id_atendimento_id_07201b27_fk_Mercado_a` (`id_atendimento_id`),
  KEY `Mercado_itensatendim_id_codigo_id_4b352a17_fk_Mercado_c` (`id_codigo_id`),
  CONSTRAINT `Mercado_itensatendim_id_atendimento_id_07201b27_fk_Mercado_a` FOREIGN KEY (`id_atendimento_id`) REFERENCES `Mercado_atendimento` (`id`),
  CONSTRAINT `Mercado_itensatendim_id_codigo_id_4b352a17_fk_Mercado_c` FOREIGN KEY (`id_codigo_id`) REFERENCES `Mercado_codbarprodsol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_itensatendimento`
--

LOCK TABLES `Mercado_itensatendimento` WRITE;
/*!40000 ALTER TABLE `Mercado_itensatendimento` DISABLE KEYS */;
INSERT INTO `Mercado_itensatendimento` VALUES (1,1,'2023-01-01',1,2,'Arroz 1kg',1),(2,3,'2023-04-30',2,18,'Macarrão 1pct 500g',1),(3,2,'2023-06-07',3,19,'Óleo 900ml',3),(4,4,'2024-03-11',3,4,'Açúcar 1kg',2),(5,2,'2023-01-01',4,2,'Arroz 1kg',1),(6,2,'2022-09-15',6,20,'Leite 1l',2),(7,2,'2022-09-13',7,20,'Leite 1l',2),(8,1,'2022-08-13',7,9,'Óleo 900ml',3),(9,1,'2022-09-30',8,20,'Leite 1l',2),(10,1,'2022-09-30',8,20,'Leite 1l',2),(11,1,'2022-10-30',8,21,'Café 500gr',4),(12,2,'2022-09-03',9,20,'Leite 1l',2),(13,1,'2023-01-01',10,8,'Óleo 900ml',3);
/*!40000 ALTER TABLE `Mercado_itensatendimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mercado_itensatendimentorascunho`
--

DROP TABLE IF EXISTS `Mercado_itensatendimentorascunho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_itensatendimentorascunho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `validade` date NOT NULL,
  `id_atendimento_id` bigint NOT NULL,
  `id_codigo_id` bigint NOT NULL,
  `produto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `solidarios` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Mercado_itensatendim_id_atendimento_id_e3f76e9f_fk_Mercado_a` (`id_atendimento_id`),
  KEY `Mercado_itensatendim_id_codigo_id_286fdc75_fk_Mercado_c` (`id_codigo_id`),
  CONSTRAINT `Mercado_itensatendim_id_atendimento_id_e3f76e9f_fk_Mercado_a` FOREIGN KEY (`id_atendimento_id`) REFERENCES `Mercado_atendimentorascunho` (`id`),
  CONSTRAINT `Mercado_itensatendim_id_codigo_id_286fdc75_fk_Mercado_c` FOREIGN KEY (`id_codigo_id`) REFERENCES `Mercado_codbarprodsol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_itensatendimentorascunho`
--

LOCK TABLES `Mercado_itensatendimentorascunho` WRITE;
/*!40000 ALTER TABLE `Mercado_itensatendimentorascunho` DISABLE KEYS */;
INSERT INTO `Mercado_itensatendimentorascunho` VALUES (12,3,'2022-09-13',25,20,'Leite 1l',2),(13,2,'2022-09-13',23,20,'Leite 1l',2),(18,1,'2022-09-27',23,9,'Óleo 900ml',3),(22,1,'2022-08-13',30,9,'Óleo 900ml',3),(23,2,'2022-09-30',30,20,'Leite 1l',2),(24,2,'2022-10-27',23,11,'Óleo 900ml',3);
/*!40000 ALTER TABLE `Mercado_itensatendimentorascunho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mercado_itensatendimentotemplate`
--

DROP TABLE IF EXISTS `Mercado_itensatendimentotemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_itensatendimentotemplate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `id_atendimento_id` bigint NOT NULL,
  `id_produto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Mercado_itensatendim_id_atendimento_id_65a634cd_fk_Mercado_a` (`id_atendimento_id`),
  KEY `Mercado_itensatendim_id_produto_id_92dade6a_fk_Mercado_p` (`id_produto_id`),
  CONSTRAINT `Mercado_itensatendim_id_atendimento_id_65a634cd_fk_Mercado_a` FOREIGN KEY (`id_atendimento_id`) REFERENCES `Mercado_atendimentotemplate` (`id`),
  CONSTRAINT `Mercado_itensatendim_id_produto_id_92dade6a_fk_Mercado_p` FOREIGN KEY (`id_produto_id`) REFERENCES `Mercado_produtosolidario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_itensatendimentotemplate`
--

LOCK TABLES `Mercado_itensatendimentotemplate` WRITE;
/*!40000 ALTER TABLE `Mercado_itensatendimentotemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mercado_itensatendimentotemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mercado_produtosolidario`
--

DROP TABLE IF EXISTS `Mercado_produtosolidario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mercado_produtosolidario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `unidade` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `preco_solidario` double NOT NULL,
  `estoque_minimo` int NOT NULL,
  `max_familia` int NOT NULL,
  `id_categoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Mercado_produtosolid_id_categoria_id_cd0eb91c_fk_Mercado_c` (`id_categoria_id`),
  CONSTRAINT `Mercado_produtosolid_id_categoria_id_cd0eb91c_fk_Mercado_c` FOREIGN KEY (`id_categoria_id`) REFERENCES `Mercado_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mercado_produtosolidario`
--

LOCK TABLES `Mercado_produtosolidario` WRITE;
/*!40000 ALTER TABLE `Mercado_produtosolidario` DISABLE KEYS */;
INSERT INTO `Mercado_produtosolidario` VALUES (1,1,'kg',1,1000,10,1),(2,1,'kg',2,1000,1,2),(3,1,'pct 500g',1,1000,2,4),(4,1,'kg',2,1000,3,5),(5,900,'ml',3,1000,1,6),(6,1,'Lata',3,1000,1,7),(11,1,'Pct Grande',3,1000,1,8),(12,1,'Pct Pequeno',2,1000,1,8),(13,250,'gr',2,1000,1,11),(14,400,'gr',4,1000,1,11),(15,125,'g',2,1000,1,3),(16,2,'l',1,1000,1,12),(17,5,'kg',5,1000,2,1),(18,1,'ptc',1,1000,1,13),(19,1,'ptc',1,1000,1,14),(20,1,'ptc',2,1000,1,16),(21,1,'ptc',1,1000,1,15),(22,1,'ptc',1,1000,1,17),(23,1,'ptc',1,1000,1,18),(24,250,'gr',2,1000,1,19),(25,500,'gr',4,1000,1,19),(26,500,'gr',1,1000,1,20),(27,500,'gr',4,1000,1,21),(28,1,'ptc',1,1000,1,22),(29,1,'ptc',1,1000,2,23),(30,1,'frasco',2,1000,1,24),(31,500,'ml',2,1000,1,26),(32,1,'lata',2,1000,1,27),(33,500,'gr',1,1000,1,28),(34,1,'un',2,1000,1,29),(35,1,'un',1,1000,1,30),(36,500,'gr',1,1000,1,31),(37,500,'gr',1,1000,1,55),(38,500,'gr',1,1000,2,56),(39,500,'gr',1,1000,1,57),(40,1,'kg',2,1000,2,58),(41,500,'gr',2,1000,1,62),(42,1,'kg',3,1000,3,2),(43,1,'ptc',2,1000,1,32),(44,500,'gr',1,1000,2,33),(45,1,'kg',2,1000,1,33),(46,1,'pote',2,1000,1,34),(47,1,'lata',2,1000,1,59),(48,1,'l',2,1000,2,35),(49,200,'gr',2,1000,1,60),(50,400,'gr',4,1000,1,60),(51,1,'ptc',1,1000,1,37),(52,400,'gr',2,1000,1,38),(53,1,'ptc',2,1000,4,41),(54,1,'lata',3,1000,1,42),(55,500,'gr',1,1000,2,43),(56,500,'gr',1,1000,1,44),(57,1,'un',1,1000,1,45),(58,1,'un',1,1000,2,46),(59,1,'kg',2,1000,1,47),(60,1,'un',3,1000,1,48),(61,500,'gr',2,1000,1,61),(62,1,'kg',4,1000,1,61),(63,1,'garrafa',3,1000,1,49),(64,1,'sachê',1,1000,1,50),(65,1,'ptc',2,1000,1,51),(66,500,'gr',1,1000,1,52),(67,1,'ptc',2,1000,1,53),(68,750,'ml',1,1000,1,54);
/*!40000 ALTER TABLE `Mercado_produtosolidario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add atendimento',7,'add_atendimento'),(26,'Can change atendimento',7,'change_atendimento'),(27,'Can delete atendimento',7,'delete_atendimento'),(28,'Can view atendimento',7,'view_atendimento'),(29,'Can add atendimento rascunho',8,'add_atendimentorascunho'),(30,'Can change atendimento rascunho',8,'change_atendimentorascunho'),(31,'Can delete atendimento rascunho',8,'delete_atendimentorascunho'),(32,'Can view atendimento rascunho',8,'view_atendimentorascunho'),(33,'Can add Modelo de Atendimento',9,'add_atendimentotemplate'),(34,'Can change Modelo de Atendimento',9,'change_atendimentotemplate'),(35,'Can delete Modelo de Atendimento',9,'delete_atendimentotemplate'),(36,'Can view Modelo de Atendimento',9,'view_atendimentotemplate'),(37,'Can add categoria',10,'add_categoria'),(38,'Can change categoria',10,'change_categoria'),(39,'Can delete categoria',10,'delete_categoria'),(40,'Can view categoria',10,'view_categoria'),(41,'Can add Código do Produto',11,'add_codbarprodsol'),(42,'Can change Código do Produto',11,'change_codbarprodsol'),(43,'Can delete Código do Produto',11,'delete_codbarprodsol'),(44,'Can view Código do Produto',11,'view_codbarprodsol'),(45,'Can add Fonte de Doação',12,'add_fontedoacao'),(46,'Can change Fonte de Doação',12,'change_fontedoacao'),(47,'Can delete Fonte de Doação',12,'delete_fontedoacao'),(48,'Can view Fonte de Doação',12,'view_fontedoacao'),(49,'Can add Produto Solidário',13,'add_produtosolidario'),(50,'Can change Produto Solidário',13,'change_produtosolidario'),(51,'Can delete Produto Solidário',13,'delete_produtosolidario'),(52,'Can view Produto Solidário',13,'view_produtosolidario'),(53,'Can add Itens',14,'add_itensatendimentotemplate'),(54,'Can change Itens',14,'change_itensatendimentotemplate'),(55,'Can delete Itens',14,'delete_itensatendimentotemplate'),(56,'Can view Itens',14,'view_itensatendimentotemplate'),(57,'Can add itens atendimento rascunho',15,'add_itensatendimentorascunho'),(58,'Can change itens atendimento rascunho',15,'change_itensatendimentorascunho'),(59,'Can delete itens atendimento rascunho',15,'delete_itensatendimentorascunho'),(60,'Can view itens atendimento rascunho',15,'view_itensatendimentorascunho'),(61,'Can add itens atendimento',16,'add_itensatendimento'),(62,'Can change itens atendimento',16,'change_itensatendimento'),(63,'Can delete itens atendimento',16,'delete_itensatendimento'),(64,'Can view itens atendimento',16,'view_itensatendimento'),(65,'Can add estoque',17,'add_estoque'),(66,'Can change estoque',17,'change_estoque'),(67,'Can delete estoque',17,'delete_estoque'),(68,'Can view estoque',17,'view_estoque');
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
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$iPeFTWWMy2GQdLHZZiTYkw$fWxJeGR7AURlDmEkFuvVCN7xwqiC2AkMfBXVaNf47w8=','2022-09-17 22:20:44.875315',1,'mercadoSol','','','',1,1,'2022-06-17 01:26:25.568354');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-06-17 01:27:20.113264','1','Arroz',1,'[{\"added\": {}}]',10,1),(2,'2022-06-17 01:27:24.991118','2','Feijão',1,'[{\"added\": {}}]',10,1),(3,'2022-06-17 01:27:28.464931','3','Sardinha',1,'[{\"added\": {}}]',10,1),(4,'2022-06-17 01:27:31.899197','4','Macarrão',1,'[{\"added\": {}}]',10,1),(5,'2022-06-17 01:28:13.178678','1','Parceiro - Combrasil',1,'[{\"added\": {}}]',12,1),(6,'2022-06-17 01:28:31.234280','2','Voluntário',1,'[{\"added\": {}}]',12,1),(7,'2022-06-17 01:28:38.048175','3','Compra',1,'[{\"added\": {}}]',12,1),(8,'2022-06-17 01:29:08.330365','1','Arroz 1kg',1,'[{\"added\": {}}]',13,1),(9,'2022-06-17 01:29:24.084076','2','Feijão 1kg',1,'[{\"added\": {}}]',13,1),(10,'2022-06-17 01:29:56.348641','3','Macarrão 1pct 500g',1,'[{\"added\": {}}]',13,1),(11,'2022-06-17 01:30:59.853930','1','CodBarProdSol object (1)',1,'[{\"added\": {}}]',11,1),(12,'2022-06-17 01:31:14.341173','1','CodBarProdSol object (1)',3,'',11,1),(13,'2022-06-18 04:13:17.638080','2','CodBarProdSol object (2)',1,'[{\"added\": {}}]',11,1),(14,'2022-06-18 13:04:53.931894','5','Açúcar',1,'[{\"added\": {}}]',10,1),(15,'2022-06-18 13:06:07.362545','4','Açúcar 1Kg',1,'[{\"added\": {}}]',13,1),(16,'2022-06-18 13:07:13.528818','4','Açúcar 1Kg',2,'[{\"changed\": {\"fields\": [\"Preco solidario\", \"Max familia\"]}}]',13,1),(17,'2022-06-18 13:09:22.976257','3','CodBarProdSol object (3)',1,'[{\"added\": {}}]',11,1),(18,'2022-06-18 13:13:55.502863','4','CodBarProdSol object (4)',1,'[{\"added\": {}}]',11,1),(19,'2022-06-18 13:15:15.682342','5','CodBarProdSol object (5)',1,'[{\"added\": {}}]',11,1),(20,'2022-06-18 13:17:36.072940','6','CodBarProdSol object (6)',1,'[{\"added\": {}}]',11,1),(21,'2022-06-18 13:19:01.710700','7','CodBarProdSol object (7)',1,'[{\"added\": {}}]',11,1),(22,'2022-06-18 13:20:25.188977','6','Óleo',1,'[{\"added\": {}}]',10,1),(23,'2022-06-18 13:21:59.337466','5','Óleo 900ml',1,'[{\"added\": {}}]',13,1),(24,'2022-06-18 13:25:01.468417','8','CodBarProdSol object (8)',1,'[{\"added\": {}}]',11,1),(25,'2022-06-18 13:25:32.490467','7','Abacaxi em calda',1,'[{\"added\": {}}]',10,1),(26,'2022-06-18 13:26:00.844429','9','CodBarProdSol object (9)',1,'[{\"added\": {}}]',11,1),(27,'2022-06-18 13:26:20.882420','6','Abacaxi em calda 1Lata',1,'[{\"added\": {}}]',13,1),(28,'2022-06-18 13:26:38.085344','8','Absorvente Grande',1,'[{\"added\": {}}]',10,1),(29,'2022-06-18 13:27:03.220183','10','CodBarProdSol object (10)',1,'[{\"added\": {}}]',11,1),(30,'2022-06-18 13:27:11.962938','7','Absorvente Grande 1Pacote',1,'[{\"added\": {}}]',13,1),(31,'2022-06-18 13:27:22.658714','9','Absorvente pequeno',1,'[{\"added\": {}}]',10,1),(32,'2022-06-18 13:27:43.228064','7','Absorvente Grande 1Pct',2,'[{\"changed\": {\"fields\": [\"Unidade\"]}}]',13,1),(33,'2022-06-18 13:27:59.537856','11','CodBarProdSol object (11)',1,'[{\"added\": {}}]',11,1),(34,'2022-06-18 13:28:12.127410','8','Absorvente pequeno 1Pct',1,'[{\"added\": {}}]',13,1),(35,'2022-06-18 13:28:23.118996','12','CodBarProdSol object (12)',1,'[{\"added\": {}}]',11,1),(36,'2022-06-18 13:28:31.003921','10','Achocolatado 259gr',1,'[{\"added\": {}}]',10,1),(37,'2022-06-18 13:28:42.965254','10','Achocolatado 250gr',2,'[{\"changed\": {\"fields\": [\"Categoria\"]}}]',10,1),(38,'2022-06-18 13:29:19.743773','11','Achocolatado 400gr',1,'[{\"added\": {}}]',10,1),(39,'2022-06-18 13:29:26.020870','9','Achocolatado 250gr 1Pct',1,'[{\"added\": {}}]',13,1),(40,'2022-06-18 13:29:32.767759','13','CodBarProdSol object (13)',1,'[{\"added\": {}}]',11,1),(41,'2022-06-18 13:29:54.034422','12','Água Sanitária',1,'[{\"added\": {}}]',10,1),(42,'2022-06-18 13:30:02.940321','10','Achocolatado 400gr 1Pct',1,'[{\"added\": {}}]',13,1),(43,'2022-06-18 13:30:21.715319','14','CodBarProdSol object (14)',1,'[{\"added\": {}}]',11,1),(44,'2022-06-18 13:30:32.966491','15','CodBarProdSol object (15)',1,'[{\"added\": {}}]',11,1),(45,'2022-06-18 13:30:56.800302','10','Achocolatado 400gr 1Pct',3,'',13,1),(46,'2022-06-18 13:31:11.147839','8','Absorvente pequeno 1Pct',3,'',13,1),(47,'2022-06-18 13:31:37.543419','9','Absorvente pequeno',3,'',10,1),(48,'2022-06-18 13:31:38.187809','16','CodBarProdSol object (16)',1,'[{\"added\": {}}]',11,1),(49,'2022-06-18 13:31:40.584640','9','Achocolatado 250gr 1Pct',3,'',13,1),(50,'2022-06-18 13:31:46.995929','8','Absorvente',2,'[{\"changed\": {\"fields\": [\"Categoria\"]}}]',10,1),(51,'2022-06-18 13:31:58.825132','10','Achocolatado 250gr',3,'',10,1),(52,'2022-06-18 13:32:01.750736','7','Absorvente 1Pct',3,'',13,1),(53,'2022-06-18 13:32:08.884320','11','Achocolatado',2,'[{\"changed\": {\"fields\": [\"Categoria\"]}}]',10,1),(54,'2022-06-18 13:32:21.353893','17','CodBarProdSol object (17)',1,'[{\"added\": {}}]',11,1),(55,'2022-06-18 13:32:29.499182','13','Bala',1,'[{\"added\": {}}]',10,1),(56,'2022-06-18 13:32:48.872891','14','Bolacha Doce',1,'[{\"added\": {}}]',10,1),(57,'2022-06-18 13:32:53.897487','11','Absorvente 1Pct Grande',1,'[{\"added\": {}}]',13,1),(58,'2022-06-18 13:33:16.920432','15','Bolacha Salgada',1,'[{\"added\": {}}]',10,1),(59,'2022-06-18 13:33:39.240796','16','Bolacha Lata',1,'[{\"added\": {}}]',10,1),(60,'2022-06-18 13:36:23.571355','12','Absorvente 1Pct Pequeno',1,'[{\"added\": {}}]',13,1),(61,'2022-06-18 13:36:29.721933','17','Bombom',1,'[{\"added\": {}}]',10,1),(62,'2022-06-18 13:36:54.688997','18','Bombril',1,'[{\"added\": {}}]',10,1),(63,'2022-06-18 13:37:11.313905','19','Café',1,'[{\"added\": {}}]',10,1),(64,'2022-06-18 13:37:45.558594','20','Canjica',1,'[{\"added\": {}}]',10,1),(65,'2022-06-18 13:38:11.888566','21','Carne Seca',1,'[{\"added\": {}}]',10,1),(66,'2022-06-18 13:38:38.860893','22','Cotonete',1,'[{\"added\": {}}]',10,1),(67,'2022-06-18 13:38:56.733573','23','Creme Dental',1,'[{\"added\": {}}]',10,1),(68,'2022-06-18 13:39:29.592870','24','Desodorante',1,'[{\"added\": {}}]',10,1),(69,'2022-06-18 13:39:31.781584','25','Sardinha em lata',1,'[{\"added\": {}}]',10,1),(70,'2022-06-18 13:39:46.114455','26','Detergente',1,'[{\"added\": {}}]',10,1),(71,'2022-06-18 13:39:54.235142','13','Achocolatado 250gr',1,'[{\"added\": {}}]',13,1),(72,'2022-06-18 13:40:30.789469','14','Achocolatado 400gr',1,'[{\"added\": {}}]',13,1),(73,'2022-06-18 13:42:24.280383','15','Sardinha 1251',1,'[{\"added\": {}}]',13,1),(74,'2022-06-23 02:17:00.378583','15','Sardinha 125g',2,'[{\"changed\": {\"fields\": [\"Unidade\"]}}]',13,1),(75,'2022-06-25 00:34:08.296670','27','Enlatado',1,'[{\"added\": {}}]',10,1),(76,'2022-06-25 00:35:04.563261','28','Ervilha / Lentilha',1,'[{\"added\": {}}]',10,1),(77,'2022-06-25 00:35:19.253662','29','Escova de Cabelo',1,'[{\"added\": {}}]',10,1),(78,'2022-06-25 00:35:45.166321','30','Escova de Dente',1,'[{\"added\": {}}]',10,1),(79,'2022-06-25 00:36:11.932794','31','Farinha',1,'[{\"added\": {}}]',10,1),(80,'2022-06-25 00:36:25.091780','32','Fio Dental',1,'[{\"added\": {}}]',10,1),(81,'2022-06-25 00:36:36.066747','33','Fubá',1,'[{\"added\": {}}]',10,1),(82,'2022-06-25 00:36:52.433627','34','Geleia',1,'[{\"added\": {}}]',10,1),(83,'2022-06-25 00:38:18.559324','35','Leite',1,'[{\"added\": {}}]',10,1),(84,'2022-06-25 00:38:39.579626','36','Macarrão',1,'[{\"added\": {}}]',10,1),(85,'2022-06-25 00:38:49.205158','37','Maisena',1,'[{\"added\": {}}]',10,1),(86,'2022-06-25 00:39:06.789017','38','Massa pronta para bolo',1,'[{\"added\": {}}]',10,1),(87,'2022-06-25 00:39:13.644576','39','Miojo',1,'[{\"added\": {}}]',10,1),(88,'2022-06-25 00:39:29.632015','40','Molho de Tomate',1,'[{\"added\": {}}]',10,1),(89,'2022-06-25 00:40:01.994962','41','Papel Higiênico',1,'[{\"added\": {}}]',10,1),(90,'2022-06-25 00:40:23.384027','42','Pêssego em Caldas',1,'[{\"added\": {}}]',10,1),(91,'2022-06-25 00:40:42.149810','43','Pipoca',1,'[{\"added\": {}}]',10,1),(92,'2022-06-25 00:41:04.313462','44','Polvilho Doce',1,'[{\"added\": {}}]',10,1),(93,'2022-06-25 00:41:25.542862','45','Sabão',1,'[{\"added\": {}}]',10,1),(94,'2022-06-25 00:41:34.960548','46','Sabonete',1,'[{\"added\": {}}]',10,1),(95,'2022-06-25 00:41:42.950446','47','Sal',1,'[{\"added\": {}}]',10,1),(96,'2022-06-25 00:41:56.484293','48','Shampoo',1,'[{\"added\": {}}]',10,1),(97,'2022-06-25 00:42:02.303272','49','Suco',1,'[{\"added\": {}}]',10,1),(98,'2022-06-25 00:42:14.866761','50','Tempero',1,'[{\"added\": {}}]',10,1),(99,'2022-06-25 00:42:28.930506','51','Torrada',1,'[{\"added\": {}}]',10,1),(100,'2022-06-25 00:42:41.623701','52','Trigo para Kibe',1,'[{\"added\": {}}]',10,1),(101,'2022-06-25 00:43:05.594321','53','Uvas Passas / Nozes',1,'[{\"added\": {}}]',10,1),(102,'2022-06-25 00:43:17.256807','54','Vinagre',1,'[{\"added\": {}}]',10,1),(103,'2022-06-25 00:48:10.753605','16','Água Sanitária 2l',1,'[{\"added\": {}}]',13,1),(104,'2022-06-25 00:49:15.464163','1','Arroz 1kg',2,'[{\"changed\": {\"fields\": [\"Max familia\"]}}]',13,1),(105,'2022-06-25 00:50:28.682221','36','Macarrão',3,'',10,1),(106,'2022-06-25 00:51:17.628447','17','Arroz 5kg',1,'[{\"added\": {}}]',13,1),(107,'2022-06-25 00:51:52.337578','18','Bala 1ptc',1,'[{\"added\": {}}]',13,1),(108,'2022-06-25 00:52:21.221357','19','Bolacha Doce 1ptc',1,'[{\"added\": {}}]',13,1),(109,'2022-06-25 00:52:51.832950','20','Bolacha Lata 1ptc',1,'[{\"added\": {}}]',13,1),(110,'2022-06-25 00:53:15.488767','21','Bolacha Salgada 1ptc',1,'[{\"added\": {}}]',13,1),(111,'2022-06-25 00:53:54.848870','22','Bombom 1ptc',1,'[{\"added\": {}}]',13,1),(112,'2022-06-25 00:54:18.586157','23','Bombril 1ptc',1,'[{\"added\": {}}]',13,1),(113,'2022-06-25 00:54:47.550111','24','Café 250gr',1,'[{\"added\": {}}]',13,1),(114,'2022-06-25 00:56:31.902806','4','Açúcar 1kg',2,'[{\"changed\": {\"fields\": [\"Unidade\"]}}]',13,1),(115,'2022-06-25 00:57:07.941922','25','Café 500gr',1,'[{\"added\": {}}]',13,1),(116,'2022-06-25 00:57:36.741296','26','Canjica 500gr',1,'[{\"added\": {}}]',13,1),(117,'2022-06-25 00:58:10.711261','27','Carne Seca 500gr',1,'[{\"added\": {}}]',13,1),(118,'2022-06-25 00:58:34.573107','28','Cotonete 1ptc',1,'[{\"added\": {}}]',13,1),(119,'2022-06-25 00:59:07.135716','29','Creme Dental 1ptc',1,'[{\"added\": {}}]',13,1),(120,'2022-06-25 00:59:45.736701','30','Desodorante 1frasco',1,'[{\"added\": {}}]',13,1),(121,'2022-06-25 01:01:54.560282','31','Detergente 500ml',1,'[{\"added\": {}}]',13,1),(122,'2022-06-25 01:02:22.625390','32','Enlatado 1lata',1,'[{\"added\": {}}]',13,1),(123,'2022-06-25 01:03:10.232847','33','Ervilha / Lentilha 500gr',1,'[{\"added\": {}}]',13,1),(124,'2022-06-25 01:03:45.976805','34','Escova de Cabelo 1un',1,'[{\"added\": {}}]',13,1),(125,'2022-06-25 01:04:10.850341','35','Escova de Dente 1un',1,'[{\"added\": {}}]',13,1),(126,'2022-06-25 01:04:32.366152','31','Farinha de Aveia',2,'[{\"changed\": {\"fields\": [\"Categoria\"]}}]',10,1),(127,'2022-06-25 01:04:46.648673','55','Farinha de Mandioca',1,'[{\"added\": {}}]',10,1),(128,'2022-06-25 01:05:00.439244','56','Farinha de Milho',1,'[{\"added\": {}}]',10,1),(129,'2022-06-25 01:05:17.096747','57','Farinha de Tapioca',1,'[{\"added\": {}}]',10,1),(130,'2022-06-25 01:05:30.972294','58','Farinha de Trigo',1,'[{\"added\": {}}]',10,1),(131,'2022-06-25 01:05:49.646489','59','Atum',1,'[{\"added\": {}}]',10,1),(132,'2022-06-25 01:06:10.739884','60','Leite em Pó',1,'[{\"added\": {}}]',10,1),(133,'2022-06-25 01:06:52.363785','61','Sabão em Pó',1,'[{\"added\": {}}]',10,1),(134,'2022-06-25 01:07:15.417165','45','Sabão em Pedra',2,'[{\"changed\": {\"fields\": [\"Categoria\"]}}]',10,1),(135,'2022-06-25 01:07:59.824485','36','Farinha de Aveia 500gr',1,'[{\"added\": {}}]',13,1),(136,'2022-06-25 01:08:32.897897','37','Farinha de Mandioca 500gr',1,'[{\"added\": {}}]',13,1),(137,'2022-06-25 01:08:54.513159','38','Farinha de Milho 500gr',1,'[{\"added\": {}}]',13,1),(138,'2022-06-25 01:09:31.369187','39','Farinha de Tapioca 500gr',1,'[{\"added\": {}}]',13,1),(139,'2022-06-25 01:09:49.553650','40','Farinha de Trigo 1kg',1,'[{\"added\": {}}]',13,1),(140,'2022-06-25 01:10:21.201982','62','Farofa Pronta',1,'[{\"added\": {}}]',10,1),(141,'2022-06-25 01:10:46.434671','41','Farofa Pronta 500gr',1,'[{\"added\": {}}]',13,1),(142,'2022-06-25 01:11:04.413639','42','Feijão 1kg',1,'[{\"added\": {}}]',13,1),(143,'2022-06-25 01:11:35.177500','43','Fio Dental 1ptc',1,'[{\"added\": {}}]',13,1),(144,'2022-06-25 01:12:04.468451','44','Fubá 500gr',1,'[{\"added\": {}}]',13,1),(145,'2022-06-25 01:12:29.247960','45','Fubá 1kg',1,'[{\"added\": {}}]',13,1),(146,'2022-06-25 01:12:57.211445','46','Geleia 1pote',1,'[{\"added\": {}}]',13,1),(147,'2022-06-25 01:13:12.396865','47','Atum 1lata',1,'[{\"added\": {}}]',13,1),(148,'2022-06-25 01:13:34.473156','48','Leite 1l',1,'[{\"added\": {}}]',13,1),(149,'2022-06-25 01:13:54.346303','49','Leite em Pó 200gr',1,'[{\"added\": {}}]',13,1),(150,'2022-06-25 01:14:12.776678','50','Leite em Pó 400gr',1,'[{\"added\": {}}]',13,1),(151,'2022-06-25 01:14:41.030446','51','Maisena 1ptc',1,'[{\"added\": {}}]',13,1),(152,'2022-06-25 01:15:16.872575','52','Massa pronta para bolo 400gr',1,'[{\"added\": {}}]',13,1),(153,'2022-06-25 01:15:40.785758','53','Papel Higiênico 1ptc',1,'[{\"added\": {}}]',13,1),(154,'2022-06-25 01:16:16.792160','54','Pêssego em Caldas 1lata',1,'[{\"added\": {}}]',13,1),(155,'2022-06-25 01:16:36.656906','55','Pipoca 500gr',1,'[{\"added\": {}}]',13,1),(156,'2022-06-25 01:16:53.535502','56','Polvilho Doce 500gr',1,'[{\"added\": {}}]',13,1),(157,'2022-06-25 01:17:10.808811','57','Sabão em Pedra 1un',1,'[{\"added\": {}}]',13,1),(158,'2022-06-25 01:17:47.503058','58','Sabonete 1un',1,'[{\"added\": {}}]',13,1),(159,'2022-06-25 01:18:15.663492','59','Sal 1kg',1,'[{\"added\": {}}]',13,1),(160,'2022-06-25 01:18:41.781307','60','Shampoo 1un',1,'[{\"added\": {}}]',13,1),(161,'2022-06-25 01:19:02.871597','61','Sabão em Pó 500gr',1,'[{\"added\": {}}]',13,1),(162,'2022-06-25 01:19:19.518790','62','Sabão em Pó 1kg',1,'[{\"added\": {}}]',13,1),(163,'2022-06-25 01:19:36.257588','63','Suco 1garrafa',1,'[{\"added\": {}}]',13,1),(164,'2022-06-25 01:20:16.406295','64','Tempero 1sachê',1,'[{\"added\": {}}]',13,1),(165,'2022-06-25 01:20:34.265172','65','Torrada 1ptc',1,'[{\"added\": {}}]',13,1),(166,'2022-06-25 01:20:53.360762','66','Trigo para Kibe 500gr',1,'[{\"added\": {}}]',13,1),(167,'2022-06-25 01:21:29.031397','67','Uvas Passas / Nozes 1ptc',1,'[{\"added\": {}}]',13,1),(168,'2022-06-25 01:25:47.660524','68','Vinagre 750ml',1,'[{\"added\": {}}]',13,1),(169,'2022-06-25 12:24:46.195551','18','CodBarProdSol object (18)',1,'[{\"added\": {}}]',11,1),(170,'2022-06-27 23:36:52.262817','19','CodBarProdSol object (19)',1,'[{\"added\": {}}]',11,1),(171,'2022-06-27 23:46:41.368132','4','Parceiro - Mvituzzo',1,'[{\"added\": {}}]',12,1),(172,'2022-07-02 14:03:47.788058','20','CodBarProdSol object (20)',1,'[{\"added\": {}}]',11,1),(173,'2022-07-02 14:41:14.857166','21','CodBarProdSol object (21)',1,'[{\"added\": {}}]',11,1);
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
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'Mercado','atendimento'),(8,'Mercado','atendimentorascunho'),(9,'Mercado','atendimentotemplate'),(10,'Mercado','categoria'),(11,'Mercado','codbarprodsol'),(17,'Mercado','estoque'),(12,'Mercado','fontedoacao'),(16,'Mercado','itensatendimento'),(15,'Mercado','itensatendimentorascunho'),(14,'Mercado','itensatendimentotemplate'),(13,'Mercado','produtosolidario'),(6,'sessions','session');
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
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Mercado','0001_initial','2022-06-16 23:52:20.362512'),(2,'Mercado','0002_remove_estoque_id_codigo_estoque_data_and_more','2022-06-16 23:52:20.660506'),(3,'MercadoSolidario','0001_initial','2022-06-16 23:52:20.668324'),(4,'contenttypes','0001_initial','2022-06-16 23:52:20.727982'),(5,'auth','0001_initial','2022-06-16 23:52:21.569995'),(6,'admin','0001_initial','2022-06-16 23:52:21.774884'),(7,'admin','0002_logentry_remove_auto_add','2022-06-16 23:52:21.789936'),(8,'admin','0003_logentry_add_action_flag_choices','2022-06-16 23:52:21.804296'),(9,'contenttypes','0002_remove_content_type_name','2022-06-16 23:52:21.948023'),(10,'auth','0002_alter_permission_name_max_length','2022-06-16 23:52:22.031698'),(11,'auth','0003_alter_user_email_max_length','2022-06-16 23:52:22.133368'),(12,'auth','0004_alter_user_username_opts','2022-06-16 23:52:22.148768'),(13,'auth','0005_alter_user_last_login_null','2022-06-16 23:52:22.217019'),(14,'auth','0006_require_contenttypes_0002','2022-06-16 23:52:22.225197'),(15,'auth','0007_alter_validators_add_error_messages','2022-06-16 23:52:22.237868'),(16,'auth','0008_alter_user_username_max_length','2022-06-16 23:52:22.327536'),(17,'auth','0009_alter_user_last_name_max_length','2022-06-16 23:52:22.421298'),(18,'auth','0010_alter_group_name_max_length','2022-06-16 23:52:22.506062'),(19,'auth','0011_update_proxy_permissions','2022-06-16 23:52:22.530125'),(20,'auth','0012_alter_user_first_name_max_length','2022-06-16 23:52:22.623511'),(21,'sessions','0001_initial','2022-06-16 23:52:22.689641'),(22,'Mercado','0003_remove_itensatendimentorascunho_id_produto_and_more','2022-06-23 01:10:55.766817'),(23,'Mercado','0004_itensatendimentorascunho_solidarios','2022-06-23 01:10:55.814662'),(24,'Mercado','0005_itensatendimento_produto','2022-06-23 01:10:55.861455'),(25,'Mercado','0006_itensatendimento_solidarios','2022-06-23 01:10:55.912943');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('01nvc9zlcqorikx4nu2h19opcl5ti2p8','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o2Xwu:J-f_5xQeqkwi75G-VBAkSInJDFRznJJo9_L4O14W2yw','2022-07-02 12:53:12.710176'),('0pdqr2jqzfn1o708qtm6abzyuqx8aazm','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o7dTD:kAgsnKcUYfS5fjCI6JRtO2YC2yA5wyI3sqiafnKxSSA','2022-07-16 13:47:35.741776'),('3ts2fzncgl4njrn8q9nwkp566fkreisg','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o2Xsf:Oil59bnXeoZVYdRJl3qTYd4CXROTJogQt0VeGlM53iw','2022-07-02 12:48:49.465666'),('7u6qv3oll2brfrofteg4p41m0jus9wj3','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o7dTD:kAgsnKcUYfS5fjCI6JRtO2YC2yA5wyI3sqiafnKxSSA','2022-07-16 13:47:35.925396'),('biszlmi39wp9lt667mchltyc70xfpdqb','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o2YLi:TcxdIYuBQynm1J7PzNxf2ZsLyBiXU3qrROMgq9WnXL8','2022-07-02 13:18:50.306313'),('blgqo30y5vbijdgal43q88pxgjah4s7z','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o4XUl:JYSHrOGxkQXYUtG5M7mQElWx2XRJzHcuXU0RF_rXOy8','2022-07-08 00:48:23.841183'),('cdhltekjpjthgbuc14zty6py4h2qjc27','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o7eYo:kvkpU06vuWCC5Fd-OSiJdEpCrCPrtsZlWAwwxQKfydI','2022-07-16 14:57:26.293935'),('di4sbrq42greqsob2a5arrtel8njspi3','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1oZflK:DP5QLqGozanl2bYxd2sN8ekgT2-FXnZvTNmtR8GDo6Y','2022-10-01 21:54:10.898256'),('drtzqo16nkrv62tv1g1rh8i8rnvlo4td','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1oZfnY:n1VLSLPAg9DbsIQ_gwZ7R0hmVg_zpDgEx2HL1U05QQo','2022-10-01 21:56:28.846562'),('dwysram4p2vmnb70xd00ve6o7zla3736','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o7dTG:fPup06ZaXo3cJIW3vJ5AL5FWYXRJClUGo1WL3FiABB4','2022-07-16 13:47:38.883871'),('i1ta3g91wa85l1l7d7wejdge5dmlsqpg','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o4BMR:hjuRdY2XN9GOiKoR5BWLFGwPyGYhuBEM-KL6l7X6D5A','2022-07-07 01:10:19.228869'),('i6434m6xlbiaa97ytswk2se1f9t7iw52','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o2YLT:a5Snw0m4ZOXuHHcXfY2JZgpYaTFY0RGVsvZ_hhlCZdo','2022-07-02 13:18:35.772363'),('iiqdiuwc1pa765woq1k90f0u891c8txz','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o7e65:QoqoRgYuwSyW-hXFo83HiucSi6zL-V6aPOFhrku43GA','2022-07-16 14:27:45.803766'),('kfx1qah6520xooalg2nme8wj98uqhxjs','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o2Nfg:3GW4rH7udtcVAybP-1V4IVjmD7uLiBmATZzBndmLWgM','2022-07-02 01:54:44.021066'),('onrmdz2mfiao2re5qspz4gkts90yn0hr','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o7dQI:mqBPKV1qsuyn6JrZ-VKKTXlMMCuGgAbOoNAW27wxOKw','2022-07-16 13:44:34.788231'),('qkc0va6yv5e9cxtanqyzh5u95mauwf0w','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o5kMy:wwSYRJLrCkO2arnrsBgc9p6fWB-2vQlZ08rH-lbJ87Y','2022-07-11 08:45:20.598093'),('rfs2vb1btoe0ddb2ccd1rk3bsn25s1em','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o54ZX:krcld0Or002--Dh3Z081eJQqDV00uNUdiT-HnXS9wj8','2022-07-09 12:07:31.864067'),('ux1bfhpll1lgc1qrfvb7i6o73notagsn','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o7dV5:OocspJ-yTe99_NqhiDBWJM54vcK34Gg1AscFBQTfef8','2022-07-16 13:49:31.061795'),('wqet5dop9jobb1qg6ueuk45uiiy2tn85','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o4tgX:mycijIc4BB3uj9KWIX2V6shbY5GaFN0_173xPJq8s3E','2022-07-09 00:30:01.214744'),('ye75kd084ax9ku0bp5qjol9eylrmr2t4','.eJxVjDsOwjAQBe_iGln2Ov6Ekj5nsDbeDQ4gW4qTCnF3EikFtG9m3ltE3NYct8ZLnElchRaX323E9ORyAHpguVeZalmXeZSHIk_a5FCJX7fT_TvI2PJeA1sySnk2hF1KFhkhWOCJcMKRAgA4rW2vHBire_aOJ8eIXWC_G158vvkCOIc:1o7dTP:AvMDcfAeYdmumGxbyImtWTzmKB9CBmoLM77PMLssTpA','2022-07-16 13:47:47.022023');
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

-- Dump completed on 2022-09-29 23:18:54
