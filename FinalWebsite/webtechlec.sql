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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice` varchar(100) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id_idx` (`question_id`),
  CONSTRAINT `question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choices`
--

LOCK TABLES `choices` WRITE;
/*!40000 ALTER TABLE `choices` DISABLE KEYS */;
INSERT INTO `choices` VALUES (1,'Personal Home Page',1),(2,'Hypertext Preprocessor',1),(3,'Process Home Preprocessor',1),(4,'1993',2),(5,'1994',2),(6,'1995',2),(7,'//',3),(8,'/',3),(9,'/*',3),(10,'Dollar sign symbol',4),(11,'Euro sign symbol',4),(12,'Peso sign symbol',4),(13,'Arithmetic',5),(14,'Logical',5),(15,'Comparison ',5),(16,'Assignment',5),(17,'All of the above',5),(18,'At the beginning',6),(19,'Inside the &ltHead&gt tag',6),(20,'At the bottom of the HTML ',6),(21,'Inside a &lt?php ?&gt notation',6),(22,'&ltphp&gt &lt/php&gt',7),(23,'&lt!php&gt &lt!php&gt',7),(24,'&lt?php ?&gt',7),(25,'&lt?php&gt',7),(26,'It is okay without a semi-colon',8),(27,'With semi colon',8),(28,'Both A and B',8),(29,'True',9),(30,'False',9),(31,'True',10),(32,'False',10),(33,'Java Servlet is a server side technology that runs on a web application server',11),(34,'Servlets are used to create dynamic web pages in a web application',11),(35,'Both of the above',11),(36,'request.getParameterValues()',12),(37,'request.getParameter()',12),(38,'request.getParameterNames()',12),(39,'start() method',13),(40,'init() method',13),(41,'startserv() method',13),(42,'request.getCookies()',14),(43,'cookies.getCookies()',14),(44,'get.requestCookies()',14),(45,'end() method',15),(46,'stop()method',15),(47,'destroy()method',15),(48,'Servlet Life Span',16),(49,'Servlet Life Cycle',16),(50,'Servlet Cycle',16),(51,'request.getMethod()',17),(52,'retrieve.getMethod()',17),(53,'method.getName()',17),(54,'Media Filters',18),(55,'Encryption Filters',18),(56,'Image Conversion Filters',18),(57,'error-handler',19),(58,'error-page',19),(59,'error-exception',19),(60,'service() method',20),(61,'perform() method',20),(62,'doTask() method',NULL);
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
INSERT INTO `questions` VALUES (1,'What does PHP stand for?',1,'2'),(2,'When was PHP developed?',1,'2'),(3,'In PHP, how can you create a comment?',1,'1'),(4,'In creating a variable, the variable should start with ___ symbol',1,'1'),(5,'What are some kinds of operators in PHP that exists?',1,'5'),(6,'In creating a PHP inside of a HTML, where can you place the php script?',1,'4'),(7,'How do you start a php script or end it?',1,'3'),(8,'How can you end a php code in a line or a statement?',1,'2'),(9,'Is PHP an open source scripting language? ',1,'1'),(10,'It is allowed in php to contain a whitespace in the variable’s name',1,'2'),(11,'What are Servlets?',2,'3'),(12,'What is the method used to get the value of a form parameter?',2,'2'),(13,'This method is only called when the servlet is created',2,'2'),(14,'What is the method used to get cookies in servlet?',2,'1'),(15,'This method is only called when the life cycle of servlet ends',2,'3'),(16,'It is the entire process of servlet from its creation till the destruction',2,'2'),(17,'Which of the following method retrieves the name of HTTP method?',2,'3'),(18,'Which of the following is not a valid servlet filter?',2,'1'),(19,'It is an of element of web.xml that is used to specify the error handler in servlets',2,'2'),(20,'This method is called to perform the requested task',2,'1');
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

-- Dump completed on 2018-05-06 11:55:57
