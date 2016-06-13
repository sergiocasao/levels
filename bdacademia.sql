CREATE DATABASE  IF NOT EXISTS `bdacademia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bdacademia`;
-- MySQL dump 10.13  Distrib 5.5.24, for osx10.5 (i386)
--
-- Host: localhost    Database: bdacademia
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `dsegsolq`
--

DROP TABLE IF EXISTS `dsegsolq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsegsolq` (
  `id_mso` int(11) NOT NULL,
  `id_msq` int(11) NOT NULL,
  KEY `fk_dsegsolq_msolicitud1` (`id_mso`),
  KEY `fk_dsegsolq_mseguimientoq1` (`id_msq`),
  CONSTRAINT `fk_dsegsolq_mseguimientoq1` FOREIGN KEY (`id_msq`) REFERENCES `mseguimientoq` (`id_msq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dsegsolq_msolicitud1` FOREIGN KEY (`id_mso`) REFERENCES `msolicitud` (`id_mso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsegsolq`
--

LOCK TABLES `dsegsolq` WRITE;
/*!40000 ALTER TABLE `dsegsolq` DISABLE KEYS */;
INSERT INTO `dsegsolq` VALUES (1,1),(3,2),(5,3);
/*!40000 ALTER TABLE `dsegsolq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmensaje`
--

DROP TABLE IF EXISTS `mmensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmensaje` (
  `id_mme` int(11) NOT NULL AUTO_INCREMENT,
  `id_eme` int(11) NOT NULL,
  `des_mme` varchar(1024) DEFAULT NULL,
  `fec_mme` date DEFAULT NULL,
  `hor_mme` time DEFAULT NULL,
  PRIMARY KEY (`id_mme`),
  KEY `fk_table1_emensaje1_idx` (`id_eme`),
  CONSTRAINT `fk_table1_emensaje1` FOREIGN KEY (`id_eme`) REFERENCES `emensaje` (`id_eme`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmensaje`
--

LOCK TABLES `mmensaje` WRITE;
/*!40000 ALTER TABLE `mmensaje` DISABLE KEYS */;
INSERT INTO `mmensaje` VALUES (1,3,'Hola Salgado!\r\n','2013-04-19','10:08:18'),(2,3,'hola otravez','2013-04-19','10:09:07'),(3,5,'hi','2013-04-19','10:10:21'),(4,5,'hola','2013-04-19','11:09:21'),(5,1,'Encontre otro error ;D','2013-04-30','00:37:10'),(6,6,'hola mi amor \r\n<3','2013-04-30','00:48:03'),(7,3,'hola mi vida!\r\n','2013-04-30','00:50:09'),(8,3,'otro¿?\r\n','2013-04-30','00:50:42'),(9,3,'XD','2013-04-30','00:50:50'),(10,1,'Soy admin y estoy en la interfaz de usuairo general ;D','2013-04-30','00:52:16'),(11,1,'Hola Belem\r\n','2013-04-30','00:52:33'),(12,3,'ajjajajajaja no mms¿?\r\ncomo¿?','2013-04-30','00:52:49'),(13,3,'diste un link asi lo escribiste tu!!!!','2013-04-30','00:53:00'),(14,3,'camara me largo a fb we!! dime por alla!!! con el hermano de esta red social!! XD','2013-04-30','00:53:27');
/*!40000 ALTER TABLE `mmensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msesion`
--

DROP TABLE IF EXISTS `msesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msesion` (
  `id_mse` int(11) NOT NULL AUTO_INCREMENT,
  `id_mpr` int(11) NOT NULL,
  `con_mse` varchar(512) DEFAULT NULL,
  `cor_mse` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id_mse`),
  KEY `fk_MSesion_MProfesor1` (`id_mpr`),
  CONSTRAINT `fk_MSesion_MProfesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msesion`
--

LOCK TABLES `msesion` WRITE;
/*!40000 ALTER TABLE `msesion` DISABLE KEYS */;
INSERT INTO `msesion` VALUES (3,4,'1010111110110111100101011111110001111011001111111011000101100101.55965751','011110100101110001111101010111100100110101101101010001011110100111000011000100010000101111000100111000110010000001010110111101100000010001110011100010011111110001111010010111101001011010011000.50198563'),(4,5,'1000010001101101010011101100000111010010011101101011011010110010.61815137','000001110110001101111111000111110101000001001100000101001110010111001110100111011011111000100011100100010010001011011110000111101110001101110011110000111010010100000010111000011111101110000010.41364082'),(5,7,'1110010111000010000100011111100001011111010100110111101101110001.82170757','1101000100011111001000011110110010010011011011000001100011001001000010111001011001100001000100011000000010010100100111101000010100111101011000101101001101010110100111000111110011001000000101010101101111000000100110110101110110001100010110010010000110101111.36574351'),(6,8,'0001100011110100110000101100010010110100001110101110111111101101.02097593','0110101001010001000011011100000000111111100110000011111000010011001111001110111011001100001011011011000110001100010110000110111101111010100111110001110001011001000100100000111010001011101011010001101100011100001111010000100010000110100000101010101100010011.64511420'),(7,9,'1010110010111111010001110011111000101110011110101000101010000011.35343508','011000011011101111010001111011101100010011110000011010101111110000111011101010110101110100000100110100100110011001101000111001101001001010000011001111011010011011101101001110011111001000001110.93565216'),(8,10,'00010001000100100011001110100111100101101001011001101001101100110001100101111100100101001110110000000011001010001111010010101011.54104200','100101000000010110001111100110111110000001111000010001010111001111110111100011010100010001111101101100101101111101111001100111011010100100011100101111001101011001010000100000100110101001101100.15492900');
/*!40000 ALTER TABLE `msesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eamigo`
--

DROP TABLE IF EXISTS `eamigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eamigo` (
  `id_eam` int(11) NOT NULL AUTO_INCREMENT,
  `id_mpr` int(11) NOT NULL,
  PRIMARY KEY (`id_eam`),
  KEY `fk_Eamigo_MProfesor1` (`id_mpr`),
  CONSTRAINT `fk_Eamigo_MProfesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eamigo`
--

LOCK TABLES `eamigo` WRITE;
/*!40000 ALTER TABLE `eamigo` DISABLE KEYS */;
INSERT INTO `eamigo` VALUES (1,4),(2,5),(3,7),(4,8),(5,9),(6,10);
/*!40000 ALTER TABLE `eamigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msolicitud`
--

DROP TABLE IF EXISTS `msolicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msolicitud` (
  `id_mso` int(11) NOT NULL AUTO_INCREMENT,
  `des_mso` varchar(1024) NOT NULL,
  `fec_mso` date NOT NULL,
  `hor_mso` time NOT NULL,
  `tit_mso` varchar(45) NOT NULL,
  PRIMARY KEY (`id_mso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msolicitud`
--

LOCK TABLES `msolicitud` WRITE;
/*!40000 ALTER TABLE `msolicitud` DISABLE KEYS */;
INSERT INTO `msolicitud` VALUES (1,'Me manda a una pagina desconocida','2013-04-15','16:06:42','Error 404'),(2,'Me manda error 500','2013-04-17','01:46:35','Error 500'),(3,'Me manda error 1000','2013-04-17','02:05:32','Error 1000'),(4,'Me manda Error 1001','2013-04-17','02:31:13','Error1001'),(5,'Inicio marca un error 404','2013-04-23','11:33:16','Error en pantalla de inicio');
/*!40000 ALTER TABLE `msolicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cestadosol`
--

DROP TABLE IF EXISTS `cestadosol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cestadosol` (
  `id_ces` int(11) NOT NULL,
  `des_ces` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ces`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cestadosol`
--

LOCK TABLES `cestadosol` WRITE;
/*!40000 ALTER TABLE `cestadosol` DISABLE KEYS */;
INSERT INTO `cestadosol` VALUES (1,'Proceso'),(5,'Implementada'),(6,'Rechazada');
/*!40000 ALTER TABLE `cestadosol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emensaje`
--

DROP TABLE IF EXISTS `emensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emensaje` (
  `id_eme` int(11) NOT NULL AUTO_INCREMENT,
  `id_mpr` int(11) NOT NULL,
  PRIMARY KEY (`id_eme`),
  KEY `fk_EMensaje_MProfesor1` (`id_mpr`),
  CONSTRAINT `fk_EMensaje_MProfesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emensaje`
--

LOCK TABLES `emensaje` WRITE;
/*!40000 ALTER TABLE `emensaje` DISABLE KEYS */;
INSERT INTO `emensaje` VALUES (1,4),(2,5),(3,7),(4,8),(5,9),(6,10);
/*!40000 ALTER TABLE `emensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dgrupo`
--

DROP TABLE IF EXISTS `dgrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dgrupo` (
  `id_egr` int(11) NOT NULL,
  `id_mpr` int(11) NOT NULL,
  KEY `fk_DGrupo_EGrupo1` (`id_egr`),
  KEY `fk_DGrupo_MProfesor1` (`id_mpr`),
  CONSTRAINT `fk_DGrupo_EGrupo1` FOREIGN KEY (`id_egr`) REFERENCES `egrupo` (`id_egr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DGrupo_MProfesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dgrupo`
--

LOCK TABLES `dgrupo` WRITE;
/*!40000 ALTER TABLE `dgrupo` DISABLE KEYS */;
INSERT INTO `dgrupo` VALUES (1,4),(2,4),(7,4),(2,5),(3,5),(7,5),(2,7),(3,7),(4,7),(5,7),(1,8),(1,9),(2,9),(3,9),(7,9),(1,7),(1,10),(4,10);
/*!40000 ALTER TABLE `dgrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcomentario`
--

DROP TABLE IF EXISTS `mcomentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcomentario` (
  `id_mco` int(11) NOT NULL AUTO_INCREMENT,
  `id_mpr` int(11) NOT NULL,
  `fec_mco` date DEFAULT NULL,
  `hor_mco` time DEFAULT NULL,
  `des_mco` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_mco`),
  KEY `fk_mcomentario_mprofesor1` (`id_mpr`),
  CONSTRAINT `fk_mcomentario_mprofesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcomentario`
--

LOCK TABLES `mcomentario` WRITE;
/*!40000 ALTER TABLE `mcomentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcomentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egrupo`
--

DROP TABLE IF EXISTS `egrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egrupo` (
  `id_egr` int(11) NOT NULL AUTO_INCREMENT,
  `id_aca` int(11) NOT NULL,
  PRIMARY KEY (`id_egr`),
  KEY `fk_EGrupo_CAcademia1` (`id_aca`),
  CONSTRAINT `fk_EGrupo_CAcademia1` FOREIGN KEY (`id_aca`) REFERENCES `cacademia` (`id_aca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egrupo`
--

LOCK TABLES `egrupo` WRITE;
/*!40000 ALTER TABLE `egrupo` DISABLE KEYS */;
INSERT INTO `egrupo` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7);
/*!40000 ALTER TABLE `egrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damigo`
--

DROP TABLE IF EXISTS `damigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `damigo` (
  `id_eam` int(11) NOT NULL,
  `id_mpr` int(11) NOT NULL,
  KEY `fk_DAmigo_Eamigo1` (`id_eam`),
  KEY `fk_DAmigo_MProfesor1` (`id_mpr`),
  CONSTRAINT `fk_DAmigo_Eamigo1` FOREIGN KEY (`id_eam`) REFERENCES `eamigo` (`id_eam`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DAmigo_MProfesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damigo`
--

LOCK TABLES `damigo` WRITE;
/*!40000 ALTER TABLE `damigo` DISABLE KEYS */;
INSERT INTO `damigo` VALUES (2,7),(5,5),(3,9),(6,7);
/*!40000 ALTER TABLE `damigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dacademia`
--

DROP TABLE IF EXISTS `dacademia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dacademia` (
  `id_aca` int(11) NOT NULL,
  `id_mpr` int(11) NOT NULL,
  KEY `fk_DAcademia_CAcademia1` (`id_aca`),
  KEY `fk_DAcademia_MProfesor1` (`id_mpr`),
  CONSTRAINT `fk_DAcademia_CAcademia1` FOREIGN KEY (`id_aca`) REFERENCES `cacademia` (`id_aca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DAcademia_MProfesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dacademia`
--

LOCK TABLES `dacademia` WRITE;
/*!40000 ALTER TABLE `dacademia` DISABLE KEYS */;
INSERT INTO `dacademia` VALUES (1,4),(2,4),(7,4),(2,5),(3,5),(7,5),(2,7),(3,7),(4,7),(5,7),(1,8),(1,9),(2,9),(3,9),(1,10),(4,10);
/*!40000 ALTER TABLE `dacademia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcomentario`
--

DROP TABLE IF EXISTS `dcomentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcomentario` (
  `id_mco` int(11) NOT NULL,
  `id_mpu` int(11) NOT NULL,
  KEY `fk_table1_mcomentario1` (`id_mco`),
  KEY `fk_table1_mpublicacion1` (`id_mpu`),
  CONSTRAINT `fk_table1_mcomentario1` FOREIGN KEY (`id_mco`) REFERENCES `mcomentario` (`id_mco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_mpublicacion1` FOREIGN KEY (`id_mpu`) REFERENCES `mpublicacion` (`id_mpu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcomentario`
--

LOCK TABLES `dcomentario` WRITE;
/*!40000 ALTER TABLE `dcomentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcomentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsolicitud`
--

DROP TABLE IF EXISTS `dsolicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsolicitud` (
  `id_mso` int(11) NOT NULL,
  `id_mpr` int(11) NOT NULL,
  KEY `id_mso` (`id_mso`),
  KEY `id_mpr` (`id_mpr`),
  CONSTRAINT `id_mpr` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_mso` FOREIGN KEY (`id_mso`) REFERENCES `msolicitud` (`id_mso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsolicitud`
--

LOCK TABLES `dsolicitud` WRITE;
/*!40000 ALTER TABLE `dsolicitud` DISABLE KEYS */;
INSERT INTO `dsolicitud` VALUES (1,7),(2,7),(3,7),(4,7),(5,7);
/*!40000 ALTER TABLE `dsolicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mseguimientoq`
--

DROP TABLE IF EXISTS `mseguimientoq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mseguimientoq` (
  `id_msq` int(11) NOT NULL AUTO_INCREMENT,
  `des_msq` varchar(45) NOT NULL,
  PRIMARY KEY (`id_msq`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mseguimientoq`
--

LOCK TABLES `mseguimientoq` WRITE;
/*!40000 ALTER TABLE `mseguimientoq` DISABLE KEYS */;
INSERT INTO `mseguimientoq` VALUES (1,'SegQA Mario Error404'),(2,'SegQA Error1000 Mario'),(3,'Acepto dicha solicitud');
/*!40000 ALTER TABLE `mseguimientoq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mprofesor`
--

DROP TABLE IF EXISTS `mprofesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mprofesor` (
  `id_mpr` int(11) NOT NULL AUTO_INCREMENT,
  `nom_mpr` varchar(45) DEFAULT NULL,
  `ape_mpr` varchar(45) DEFAULT NULL,
  `nac_mpr` date DEFAULT NULL,
  `gen_mpr` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_mpr`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mprofesor`
--

LOCK TABLES `mprofesor` WRITE;
/*!40000 ALTER TABLE `mprofesor` DISABLE KEYS */;
INSERT INTO `mprofesor` VALUES (4,'Mario','Carrillo Maldonado','1994-05-15','Masculino'),(5,'Sergio','Fonseca Casao','1995-07-26','Masculino'),(7,'Alan','Huerta Cortes','1994-08-24','Masculino'),(8,'Belem','Garces Martinez','1993-08-28','Femenino'),(9,'Carlos','Salgado','1990-01-01','Masculino'),(10,'Belem','Garces Martinez','1993-08-28','Femenino');
/*!40000 ALTER TABLE `mprofesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destado`
--

DROP TABLE IF EXISTS `destado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destado` (
  `id_ces` int(11) NOT NULL,
  `id_mse` int(11) NOT NULL,
  KEY `fk_destado_cestado1` (`id_ces`),
  KEY `fk_destado_msesion1` (`id_mse`),
  CONSTRAINT `fk_destado_cestado1` FOREIGN KEY (`id_ces`) REFERENCES `cestado` (`id_ces`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_destado_msesion1` FOREIGN KEY (`id_mse`) REFERENCES `msesion` (`id_mse`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destado`
--

LOCK TABLES `destado` WRITE;
/*!40000 ALTER TABLE `destado` DISABLE KEYS */;
INSERT INTO `destado` VALUES (5,3),(4,4),(1,5),(3,6),(1,7),(1,8);
/*!40000 ALTER TABLE `destado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destadosol`
--

DROP TABLE IF EXISTS `destadosol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destadosol` (
  `id_mso` int(11) NOT NULL,
  `id_ces` int(11) NOT NULL,
  KEY `fk_destadosol_msolicitud1` (`id_mso`),
  KEY `fk_destadosol_cestadosol1` (`id_ces`),
  CONSTRAINT `fk_destadosol_cestadosol1` FOREIGN KEY (`id_ces`) REFERENCES `cestadosol` (`id_ces`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_destadosol_msolicitud1` FOREIGN KEY (`id_mso`) REFERENCES `msolicitud` (`id_mso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destadosol`
--

LOCK TABLES `destadosol` WRITE;
/*!40000 ALTER TABLE `destadosol` DISABLE KEYS */;
INSERT INTO `destadosol` VALUES (1,5),(2,6),(3,5),(4,1),(5,5);
/*!40000 ALTER TABLE `destadosol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dseguimientoq`
--

DROP TABLE IF EXISTS `dseguimientoq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dseguimientoq` (
  `id_mpr` int(11) NOT NULL,
  `id_msq` int(11) NOT NULL,
  KEY `fk_dseguimientoq_mprofesor1` (`id_mpr`),
  KEY `fk_dseguimientoq_mseguimientoq1` (`id_msq`),
  CONSTRAINT `fk_dseguimientoq_mprofesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dseguimientoq_mseguimientoq1` FOREIGN KEY (`id_msq`) REFERENCES `mseguimientoq` (`id_msq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dseguimientoq`
--

LOCK TABLES `dseguimientoq` WRITE;
/*!40000 ALTER TABLE `dseguimientoq` DISABLE KEYS */;
INSERT INTO `dseguimientoq` VALUES (4,1),(4,2),(4,3);
/*!40000 ALTER TABLE `dseguimientoq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsegsolc`
--

DROP TABLE IF EXISTS `dsegsolc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsegsolc` (
  `id_mso` int(11) NOT NULL,
  `id_msc` int(11) NOT NULL,
  KEY `fk_dsegsolc_msolicitud1` (`id_mso`),
  KEY `fk_dsegsolc_mseguimientoc1` (`id_msc`),
  CONSTRAINT `fk_dsegsolc_mseguimientoc1` FOREIGN KEY (`id_msc`) REFERENCES `mseguimientoc` (`id_msc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dsegsolc_msolicitud1` FOREIGN KEY (`id_mso`) REFERENCES `msolicitud` (`id_mso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsegsolc`
--

LOCK TABLES `dsegsolc` WRITE;
/*!40000 ALTER TABLE `dsegsolc` DISABLE KEYS */;
INSERT INTO `dsegsolc` VALUES (1,1),(3,2),(5,3);
/*!40000 ALTER TABLE `dsegsolc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dmensaje`
--

DROP TABLE IF EXISTS `dmensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmensaje` (
  `id_mme` int(11) NOT NULL,
  `id_mpr` int(11) NOT NULL,
  `lei_dme` varchar(45) DEFAULT NULL,
  KEY `fk_table2_mmensaje1_idx` (`id_mme`),
  KEY `fk_table2_mprofesor1_idx` (`id_mpr`),
  CONSTRAINT `fk_table2_mmensaje1` FOREIGN KEY (`id_mme`) REFERENCES `mmensaje` (`id_mme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table2_mprofesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmensaje`
--

LOCK TABLES `dmensaje` WRITE;
/*!40000 ALTER TABLE `dmensaje` DISABLE KEYS */;
INSERT INTO `dmensaje` VALUES (1,9,'SI'),(2,9,'SI'),(3,7,'SI'),(4,5,'NO'),(5,7,'SI'),(6,7,'SI'),(7,10,'NO'),(8,4,'SI'),(9,4,'SI'),(10,7,'SI'),(11,10,'NO'),(12,4,'NO'),(13,4,'NO'),(14,4,'NO');
/*!40000 ALTER TABLE `dmensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mseguimientoc`
--

DROP TABLE IF EXISTS `mseguimientoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mseguimientoc` (
  `id_msc` int(11) NOT NULL AUTO_INCREMENT,
  `des_msc` varchar(45) NOT NULL,
  PRIMARY KEY (`id_msc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mseguimientoc`
--

LOCK TABLES `mseguimientoc` WRITE;
/*!40000 ALTER TABLE `mseguimientoc` DISABLE KEYS */;
INSERT INTO `mseguimientoc` VALUES (1,'SegCCB Fonseca Error404'),(2,'SegCCB Error1000 Sergio'),(3,'Acepto esta solicitud');
/*!40000 ALTER TABLE `mseguimientoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mseguimientoa`
--

DROP TABLE IF EXISTS `mseguimientoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mseguimientoa` (
  `id_msa` int(11) NOT NULL AUTO_INCREMENT,
  `des_msa` varchar(45) NOT NULL,
  PRIMARY KEY (`id_msa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mseguimientoa`
--

LOCK TABLES `mseguimientoa` WRITE;
/*!40000 ALTER TABLE `mseguimientoa` DISABLE KEYS */;
INSERT INTO `mseguimientoa` VALUES (1,'SegAdmin Belem Error404'),(2,'SegAdmin Error1000 Belem'),(3,'Acepto esta solicitud');
/*!40000 ALTER TABLE `mseguimientoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpublicacion`
--

DROP TABLE IF EXISTS `dpublicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dpublicacion` (
  `id_mpu` int(11) NOT NULL,
  `id_egr` int(11) NOT NULL,
  KEY `fk_DPublicacion_MPublicacion1` (`id_mpu`),
  KEY `fk_DPublicacion_EGrupo1` (`id_egr`),
  CONSTRAINT `fk_DPublicacion_EGrupo1` FOREIGN KEY (`id_egr`) REFERENCES `egrupo` (`id_egr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DPublicacion_MPublicacion1` FOREIGN KEY (`id_mpu`) REFERENCES `mpublicacion` (`id_mpu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpublicacion`
--

LOCK TABLES `dpublicacion` WRITE;
/*!40000 ALTER TABLE `dpublicacion` DISABLE KEYS */;
INSERT INTO `dpublicacion` VALUES (1,2),(4,2),(5,1),(6,4);
/*!40000 ALTER TABLE `dpublicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsegsola`
--

DROP TABLE IF EXISTS `dsegsola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsegsola` (
  `id_mso` int(11) NOT NULL,
  `id_msa` int(11) NOT NULL,
  KEY `fk_dsegsola_msolicitud1` (`id_mso`),
  KEY `fk_dsegsola_mseguimientoa1` (`id_msa`),
  CONSTRAINT `fk_dsegsola_mseguimientoa1` FOREIGN KEY (`id_msa`) REFERENCES `mseguimientoa` (`id_msa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dsegsola_msolicitud1` FOREIGN KEY (`id_mso`) REFERENCES `msolicitud` (`id_mso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsegsola`
--

LOCK TABLES `dsegsola` WRITE;
/*!40000 ALTER TABLE `dsegsola` DISABLE KEYS */;
INSERT INTO `dsegsola` VALUES (1,1),(3,2),(5,3);
/*!40000 ALTER TABLE `dsegsola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cacademia`
--

DROP TABLE IF EXISTS `cacademia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cacademia` (
  `id_aca` int(11) NOT NULL AUTO_INCREMENT,
  `des_aca` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_aca`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cacademia`
--

LOCK TABLES `cacademia` WRITE;
/*!40000 ALTER TABLE `cacademia` DISABLE KEYS */;
INSERT INTO `cacademia` VALUES (1,'Entorno Socioeconómico de México'),(2,'Historia'),(3,'Filosofía'),(4,'Lengua y Comunicación'),(5,'Ingles'),(6,'Optativas'),(7,'Desarrollo Personal');
/*!40000 ALTER TABLE `cacademia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpublicacion`
--

DROP TABLE IF EXISTS `mpublicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpublicacion` (
  `id_mpu` int(11) NOT NULL AUTO_INCREMENT,
  `id_mpr` int(11) NOT NULL,
  `fec_mpu` date DEFAULT NULL,
  `hor_mpu` time DEFAULT NULL,
  `des_mpu` varchar(1024) DEFAULT NULL,
  `ane_mpu` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id_mpu`),
  KEY `fk_MPublicacion_MProfesor1` (`id_mpr`),
  CONSTRAINT `fk_MPublicacion_MProfesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpublicacion`
--

LOCK TABLES `mpublicacion` WRITE;
/*!40000 ALTER TABLE `mpublicacion` DISABLE KEYS */;
INSERT INTO `mpublicacion` VALUES (1,9,'2013-04-19','10:06:02','Hola historia!\r\n','Sin documento'),(4,7,'2013-04-26','23:23:51','Prueba archivo','/4/Captura de pantalla 2013-04-07 a la(s) 01.00.24.png'),(5,7,'2013-04-30','00:20:57','Hola archivo 1','/5/l&f.pptx'),(6,10,'2013-04-30','00:51:24','c:','/6/super_fancy.jpg');
/*!40000 ALTER TABLE `mpublicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dseguimientoc`
--

DROP TABLE IF EXISTS `dseguimientoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dseguimientoc` (
  `id_mpr` int(11) NOT NULL,
  `id_msc` int(11) NOT NULL,
  KEY `fk_dseguimientoc_mprofesor1` (`id_mpr`),
  KEY `fk_dseguimientoc_mseguimientoc1` (`id_msc`),
  CONSTRAINT `fk_dseguimientoc_mprofesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dseguimientoc_mseguimientoc1` FOREIGN KEY (`id_msc`) REFERENCES `mseguimientoc` (`id_msc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dseguimientoc`
--

LOCK TABLES `dseguimientoc` WRITE;
/*!40000 ALTER TABLE `dseguimientoc` DISABLE KEYS */;
INSERT INTO `dseguimientoc` VALUES (5,1),(5,2),(5,3);
/*!40000 ALTER TABLE `dseguimientoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cestado`
--

DROP TABLE IF EXISTS `cestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cestado` (
  `id_ces` int(11) NOT NULL AUTO_INCREMENT,
  `des_ces` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ces`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cestado`
--

LOCK TABLES `cestado` WRITE;
/*!40000 ALTER TABLE `cestado` DISABLE KEYS */;
INSERT INTO `cestado` VALUES (1,'Activado'),(2,'Desactivado'),(3,'Administrador'),(4,'CCB'),(5,'QA');
/*!40000 ALTER TABLE `cestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dseguimientoa`
--

DROP TABLE IF EXISTS `dseguimientoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dseguimientoa` (
  `id_mpr` int(11) NOT NULL,
  `id_msa` int(11) NOT NULL,
  KEY `fk_dseguimientoa_mprofesor1` (`id_mpr`),
  KEY `fk_dseguimientoa_mseguimientoa1` (`id_msa`),
  CONSTRAINT `fk_dseguimientoa_mprofesor1` FOREIGN KEY (`id_mpr`) REFERENCES `mprofesor` (`id_mpr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dseguimientoa_mseguimientoa1` FOREIGN KEY (`id_msa`) REFERENCES `mseguimientoa` (`id_msa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dseguimientoa`
--

LOCK TABLES `dseguimientoa` WRITE;
/*!40000 ALTER TABLE `dseguimientoa` DISABLE KEYS */;
INSERT INTO `dseguimientoa` VALUES (8,1),(8,2),(8,3);
/*!40000 ALTER TABLE `dseguimientoa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-30  1:06:49
