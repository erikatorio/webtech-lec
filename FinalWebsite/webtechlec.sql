CREATE DATABASE  IF NOT EXISTS `webtechlec` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `webtechlec`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: webtechlec
-- ------------------------------------------------------
-- Server version	5.6.35

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `points` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('erikatorio','erika',1,NULL,1),('jessietabilisma','jessie',0,NULL,1),('kenancea','kenan',0,NULL,1),('sonnyby','sonny',0,NULL,1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choices`
--

DROP TABLE IF EXISTS `choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choices` (
  `idchoices` int(11) NOT NULL AUTO_INCREMENT,
  `a` varchar(45) NOT NULL,
  `b` varchar(45) NOT NULL,
  `c` varchar(45) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`idchoices`),
  KEY `question_idx` (`question_id`),
  CONSTRAINT `question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choices`
--

LOCK TABLES `choices` WRITE;
/*!40000 ALTER TABLE `choices` DISABLE KEYS */;
INSERT INTO `choices` VALUES (1,'Personal Hypertext Preprocessor','Personal Home Page','Hypertext Preprocessor',1),(2,'1993','1994','1995',2),(3,'//','<-- -->','/*',3),(4,'Dollar sign symbol','Euro sign symbol','Peso sign symbol',4),(5,'require() method','include() method','Both A and B',5),(6,'SuperGlobal','_SUPERGLOBAL','super_global',6),(7,'\"Hello\" . \"World\"','\"Hello\" + \"World\"','None of the above',7),(8,'Without a semicolon','With semicolon','Both A and B',8),(9,'nowdoc','heredoc','Both A and B',9),(10,'echo','print','cout',10),(11,'Java Servlet is a server side technology that','Servlets are used to create dynamic web pages','Both of the above',11),(12,'request.getParameterValues()','request.getParameter()','request.getParameterNames()',12),(13,'start() method','init() method','startserv() method',13),(14,'request.getCookies()','cookies.getCookies()','get.requestCookies()',14),(15,'end() method','stop()method','destroy()method',15),(16,'Servlet Life Span','Servlet Life Cycle','Servlet Cycle',16),(17,'request.getMethod()','retrieve.getMethod()','method.getName()',17),(18,'Media Filters','Encryption Filters','Image Conversion Filters',18),(19,'error-handler','error-page','error-exception',19),(20,'service() method','perform() method','doTask() method',20);
/*!40000 ALTER TABLE `choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `correctanswer` varchar(45) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `quiz_id_idx` (`quiz_id`),
  CONSTRAINT `quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'What does PHP stand for?',1,'c'),(2,'When was PHP developed?',1,'b'),(3,'In PHP, how can you create a comment?',1,'c'),(4,'In creating a variable, the variable should start with ___ symbol',1,'a'),(5,'Which method in PHP produces a fatal error when invoked',1,'a'),(6,'What is the format of PHP superglobals?',1,'b'),(7,'How do you concatenate strings in PHP',1,'a'),(8,'How can you end a php code in a line or a statement?',1,'b'),(9,'It is a syntax handler used for multi-line strings.',1,'b'),(10,'Which PHP command prints out a string with a return value?',1,'b'),(11,'What are Servlets?',2,'c'),(12,'What is the method used to get the value of a form parameter?',2,'b'),(13,'This method is only called when the servlet is created',2,'b'),(14,'What is the method used to get cookies in servlet?',2,'a'),(15,'This method is only called when the life cycle of servlet ends',2,'c'),(16,'It is the entire process of servlet from its creation till the destruction',2,'b'),(17,'Which of the following method retrieves the name of HTTP method?',2,'c'),(18,'Which of the following is not a valid servlet filter?',2,'a'),(19,'It is an of element of web.xml that is used to specify the error handler in servlets',2,'b'),(20,'This method is called to perform the requested task',2,'a');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_name` varchar(45) NOT NULL,
  `total_points` int(11) NOT NULL,
  PRIMARY KEY (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'PHP',10),(2,'Java Servlets',10);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_taken`
--

DROP TABLE IF EXISTS `quiz_taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_taken` (
  `date_taken` date NOT NULL,
  `points_accumulated` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `quiz_taken` int(11) NOT NULL,
  KEY `quiz_taken_idx` (`quiz_taken`),
  KEY `username_idx` (`username`),
  CONSTRAINT `quiz_taken` FOREIGN KEY (`quiz_taken`) REFERENCES `quiz` (`quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_taken`
--

LOCK TABLES `quiz_taken` WRITE;
/*!40000 ALTER TABLE `quiz_taken` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_taken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'webtechlec'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-06 21:37:05
