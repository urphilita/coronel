-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: asistencia
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `idCarrer` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `aula` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `bloque` varchar(20) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `piso` varchar(10) COLLATE utf8mb4_0900_as_ci NOT NULL,
  PRIMARY KEY (`idCarrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `idDocent` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `appaterno` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `apmaterno` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `horario` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `idPla` bigint DEFAULT NULL,
  `idCarr` bigint DEFAULT NULL,
  PRIMARY KEY (`idDocent`),
  KEY `idPla` (`idPla`),
  KEY `idCarr` (`idCarr`),
  CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`idPla`) REFERENCES `planilla` (`idplanilla`),
  CONSTRAINT `docente_ibfk_2` FOREIGN KEY (`idCarr`) REFERENCES `carrera` (`idCarrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `idEstud` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `appaterno` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `apmaterno` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `idPla` bigint DEFAULT NULL,
  PRIMARY KEY (`idEstud`),
  KEY `idPla` (`idPla`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`idPla`) REFERENCES `planilla` (`idplanilla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `idmateria` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `horario` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `carrera` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `iddoct` bigint DEFAULT NULL,
  PRIMARY KEY (`idmateria`),
  KEY `iddoct` (`iddoct`),
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`iddoct`) REFERENCES `docente` (`idDocent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planilla`
--

DROP TABLE IF EXISTS `planilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planilla` (
  `idplanilla` bigint NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `carrera` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `docente` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `horario` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `paralelo` varchar(10) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `cantidadEstd` int NOT NULL,
  `idsuper` bigint DEFAULT NULL,
  PRIMARY KEY (`idplanilla`),
  KEY `idsuper` (`idsuper`),
  CONSTRAINT `planilla_ibfk_1` FOREIGN KEY (`idsuper`) REFERENCES `supervisor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planilla`
--

LOCK TABLES `planilla` WRITE;
/*!40000 ALTER TABLE `planilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `planilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `appaterno` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `apmaterno` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `ci` int NOT NULL,
  `contrasenia` varchar(30) COLLATE utf8mb4_0900_as_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES (1,'pedro','lopez','perez',2345673,'hola'),(2,'pamela','rivera','diaz',4634563,'pam'),(3,'claudia','vargas','lujan',8765373,'cla'),(4,'Jimena','Vaca','Jurado',2342342,'123123');
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-20 23:20:29
