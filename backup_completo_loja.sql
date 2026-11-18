-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: loja
-- ------------------------------------------------------
-- Server version	8.0.46

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

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(80) NOT NULL,
  `CPF` char(11) NOT NULL,
  `Celular` char(11) DEFAULT NULL,
  `EndLogradouro` varchar(100) NOT NULL,
  `EndNumero` varchar(10) NOT NULL,
  `EndMunicipio` int NOT NULL,
  `EndCEP` char(8) NOT NULL,
  `Municipio_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Cliente_Municipio1_idx` (`Municipio_ID`),
  CONSTRAINT `fk_Cliente_Municipio1` FOREIGN KEY (`Municipio_ID`) REFERENCES `municipio` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Carlos Eduardo Silva','12345678901','11987654321','Av. Paulista','1000',3550308,'01310100',1),(2,'Mariana Souza Oliveira','23456789012','21998765432','Rua Barata Ribeiro','450',3304557,'22040002',2),(3,'João Pedro Santos','34567890123',NULL,'Av. Afonso Pena','1500',3106200,'30130005',3);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contareceber`
--

DROP TABLE IF EXISTS `contareceber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contareceber` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Cliente_ID` int NOT NULL,
  `FaturaVendaID` int NOT NULL,
  `DataConta` date NOT NULL,
  `DataVencimento` date NOT NULL,
  `Valor` decimal(18,2) NOT NULL,
  `Situação` enum('1','2','3') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_ContaReceber_Cliente_idx` (`Cliente_ID`),
  CONSTRAINT `fk_ContaReceber_Cliente` FOREIGN KEY (`Cliente_ID`) REFERENCES `cliente` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contareceber`
--

LOCK TABLES `contareceber` WRITE;
/*!40000 ALTER TABLE `contareceber` DISABLE KEYS */;
INSERT INTO `contareceber` VALUES (1,1,1001,'2026-11-01','2026-12-01',450.00,'1'),(2,2,1002,'2026-11-05','2026-12-05',1250.50,'1'),(3,3,1003,'2026-10-15','2026-11-15',320.00,'3');
/*!40000 ALTER TABLE `contareceber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `UF` char(2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'São Paulo','SP'),(2,'Rio de Janeiro','RJ'),(3,'Minas Gerais','MG');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Estado_ID` int NOT NULL,
  `Nome` varchar(80) NOT NULL,
  `CodIBGE` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Municipio_Estado1_idx` (`Estado_ID`),
  CONSTRAINT `fk_Municipio_Estado1` FOREIGN KEY (`Estado_ID`) REFERENCES `estado` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,1,'São Paulo',3550308),(2,2,'Rio de Janeiro',3304557),(3,3,'Belo Horizonte',3106200);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_contasnaopagas`
--

DROP TABLE IF EXISTS `vw_contasnaopagas`;
/*!50001 DROP VIEW IF EXISTS `vw_contasnaopagas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_contasnaopagas` AS SELECT 
 1 AS `ID_ContaReceber`,
 1 AS `Nome_Cliente`,
 1 AS `CPF_Cliente`,
 1 AS `Data_Vencimento`,
 1 AS `Valor_Conta`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_contasnaopagas`
--

/*!50001 DROP VIEW IF EXISTS `vw_contasnaopagas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_contasnaopagas` AS select `cr`.`ID` AS `ID_ContaReceber`,`c`.`Nome` AS `Nome_Cliente`,`c`.`CPF` AS `CPF_Cliente`,`cr`.`DataVencimento` AS `Data_Vencimento`,`cr`.`Valor` AS `Valor_Conta` from (`contareceber` `cr` join `cliente` `c` on((`cr`.`Cliente_ID` = `c`.`ID`))) where (`cr`.`Situação` = '1') */;
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

-- Dump completed on 2026-11-18 12:58:58
