CREATE DATABASE  IF NOT EXISTS `webtechlec` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `webtechlec`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: webtechlec
-- ------------------------------------------------------
-- Server version	5.6.38

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
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('amyperalta','$2y$10$42ARsWKlLKh8XMdodTQ5recbblM62vVS1Nz2X.U6U8cjjIiuPaszy',0,'amyp@gmail.com','Amy Peralta'),('batgirl','$2y$10$H43yDr0yA9Nsuau5GVbF.Oy0tKTyahQmaZTxqxd4ISGtLQBiQajaS',0,'batgirl@email.com','Barbara Gordon'),('fastestmanalive','$2y$10$6oXfbGqZpUWxvb3t7Y4a5eeZFW1wJxque90BfMxFpUzYUPeBW8zSu',0,'theflash@gmail.com','Bartholomew Henry Allen'),('jessie','$2y$10$WDpQk1WhKk/QiQ48wsCawO1p4hgd9tGlAmE2pck0/WpILWWwCAMkS',0,'jessie@gmail.com','jessie tabilisma'),('jessietabilisma','$2y$10$58hi/nTSIzMq4Zm.l3qGheSlsOOdDSw2VLUiME1RE5ZJBKy7i3RxC',0,'jessie.tabilisma@yahoo.com','Jessie Tabilisma'),('Mangganda','$2y$10$6vD03.PMXB.QLH8W4NBpYuMmHxWYJyZI/2Mj946IyDhhIIT4qhDDu',0,'jodyadriennneee@gmail.com','Jody Dong-e');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choices`
--

DROP TABLE IF EXISTS `choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choices` (
  `idchoices` int(11) NOT NULL,
  `a` varchar(255) NOT NULL,
  `b` varchar(225) NOT NULL,
  `c` varchar(225) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idchoices`),
  KEY `questionid_idx` (`question_id`),
  CONSTRAINT `questionid` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choices`
--

LOCK TABLES `choices` WRITE;
/*!40000 ALTER TABLE `choices` DISABLE KEYS */;
INSERT INTO `choices` VALUES (1,'Java Servlet is a server side technology that runs on a web application server','Servlets are used to create dynamic web pages in a web application','Both of the above',1),(2,'Application Level','User/Session Level','Iteration Level',2),(3,'start() method','init() method','startserv() method',3),(4,'Variable','Data Type','Container',4),(5,'end() method','stop()method','destroy() method',5),(6,'Servlet Life Span','Servlet Life Cycle','Servlet Cycle',6),(7,'ASP','CORBA','JSP (Java Server Pages)',7),(8,'jspService() method','jspDoTask() method','jspService() method',8),(9,'doHid()','doHead()','doHeed()',9),(10,'service() method','perform() method','doTask() method',10),(11,'Expression Tag','Declaration Tag','Scriplet Tag',11),(12,'True','False','Either',12),(13,'Peter Berg','Berners Lee','Pavni Diwanji',13),(14,'include directive','page directive','taglib directive',14),(15,'Array','Elements','Variables',15),(16,'include directive','libtag directive','page directive',16),(17,'By implementing Servlet interface','By inheriting GenericServlet class','By inheriting HttpRequest class',17),(18,'getModified()','getLastModified()','getModifiedTime()',18),(19,'Hypertext Preprocessor','Personal Hypertext Preprocessor','Personal Home Processor',19),(20,'Explicit','Implicit','Both',20),(21,'concatenate() method','Plus sign (+)',' A dot (.)',21),(22,'Backslash','Dollar sign','var key word',22),(23,'array() method','[]','Both',23),(24,'=>','-->','==',24),(25,'func keyword','function keyword','Both',25),(26,'echo','print','Both',26),(27,'db','mysqli','dbase',27),(28,'pdo','mongodb','mariadb',28),(29,'SUPER_GLOBAL','$_SUPERGLOBAL','$SuperGlobal',29),(30,'$_GET','$_POST','$_RETRIEVE',30),(31,'node.js','node app.js','app.js node',31),(32,'Javascript','NodeJS','Java Servlet',32),(33,'fast','asynchronous','synchronous',33),(34,'Ryan Lee','Ryan Reynolds','Ryan Dahl',34),(35,'Joyers','Joyent','Joyetch',35),(36,'NPQ','NPN','NPM',36),(37,'JavaScript','Servlet','Java',37),(38,'https','http','httpr',38),(39,'Express JS','Express Java','Express Node',39),(40,'Express JS','JavaScript','Pug',40);
/*!40000 ALTER TABLE `choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `topic_idx` (`topic_id`),
  KEY `userposter_idx` (`username`),
  CONSTRAINT `topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userposter` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (14,'batgirl',3,'try: \r\n<br>\r\nvar http = require(\'http\'); \r\n<br>\r\nhttp.createServer(function (req, res) { \r\n<br>\r\n//code here \r\n<br>\r\n}).listen(8080);'),(15,'amyperalta',5,'you should use mysqli prepared statements. more info here: http://php.net/manual/en/pdo.prepared-statements.php'),(16,'amyperalta',3,'thanks!'),(17,'batgirl',5,'thank you!');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'What are Servlets?',2,'c'),(2,'In Java Servlet Variable Scope, what level is used to store the user specific data?',2,'b'),(3,'This method is only called when the servlet is created',2,'b'),(4,'It contains the data value and is assigned with a specific datatype',2,'a'),(5,'This method is only called when the life cycle of servlet ends',2,'c'),(6,'It is the entire process of servlet from its creation till the destruction',2,'b'),(7,'A server-side technology similar to Servlet',2,'c'),(8,'A Life Cycle method of JSP that is used for request handling',2,'a'),(9,'_______ method handles the HEAD request',2,'b'),(10,'This method is called to perform the requested task',2,'a'),(11,'It is used to execute java source code in JSP',2,'c'),(12,'In Java OR operator, the logical operator (\"||\") only checks the second condition if the first condi',2,'b'),(13,'Who created the Servlet1 specification?',2,'c'),(14,'In JSP directive elements, this is a directive that defines attributes that apply to an entire JSP p',2,'b'),(15,'It is a set of multiple elements with similar data type',2,'a'),(16,'here are three types of JSP directives except',2,'b'),(17,'There are three possible way to create a servlet except',2,'c'),(18,'_______ method returns the time when HttpServletRequest was last modified',2,'b'),(19,'What does PHP stand for?',1,'a'),(20,'Data type identification is ______ in PHP?',1,'b'),(21,'String concatenation is done through ____?',1,'c'),(22,'A PHP variable is preceeded by?',1,'b'),(23,'An array in php can be declared by?',1,'c'),(24,'Association in PHP is done through what character?',1,'a'),(25,'A user defined function can be created using what keyword?',1,'b'),(26,'A string can be outputted using what command in PHP?',1,'c'),(27,'What PHP package can be used for connecting to a database?',1,'b'),(28,'What PHP package is compatible with any kind of database',1,'a'),(29,'A superglobal PHP variable is declared in what way?',1,'b'),(30,'Which does not belong',1,'c'),(31,'What is the node command issued when a NodeJS file is executed',3,'b'),(32,'Server-side scripting tool that was built on Chrome’s JS Engine or the V8 engine.',3,'b'),(33,'NodeJS is __________ meaning code execution is smooth because it is, after all, built on Chrome’s V8',3,'a'),(34,'NodeJS was created by',3,'c'),(35,'The maintenance and development of NodeJS was then later sponsored by __________',3,'b'),(36,'NodeJS has a lot of packages that can be used for development. Such packages are installed through _',3,'c'),(37,'NodeJS variable declaration is the same as __________ which uses const, var, and let.',3,'a'),(38,'NodeJS has a module named __________ which allows data to be transferred through HTTP.',3,'b'),(39,'A Node.js web application framework that provides rich set of features for mobile and web applicatio',3,'a'),(40,'It is a package or API that can be used by Node JS which renders views and data can be passed to it.',3,'c');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'PHP',12),(2,'Java Servlets',18),(3,'NodeJS',10);
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
INSERT INTO `quiz_taken` VALUES ('0000-00-00',2,'jessie',2),('0000-00-00',0,'jessie',2),('0000-00-00',0,'jessie',2),('0000-00-00',0,'jessie',2),('0000-00-00',0,'jessie',2),('0000-00-00',0,'jessie',2),('2018-05-13',10,'fastestmanalive',1),('2018-05-13',1,'jessie',2),('2018-05-15',12,'jessietabilisma',1),('2018-05-15',11,'Mangganda',1),('2018-05-15',7,'Mangganda',1),('2018-05-15',0,'jessie',1),('2018-05-21',12,'batgirl',1);
/*!40000 ALTER TABLE `quiz_taken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `topic_title` varchar(255) NOT NULL,
  `topic_name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `topicposter_idx` (`username`),
  CONSTRAINT `topicposter` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (3,'amyperalta','Create Server','Node.js','How can i create a server in Node.js?'),(5,'batgirl','Injection','Web Security','What can i do to prevent this if im using PHP?');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
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

-- Dump completed on 2018-05-22  7:22:50
