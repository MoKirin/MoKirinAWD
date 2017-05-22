-- MySQL dump 10.13  Distrib 5.7.18, for osx10.12 (x86_64)
--
-- Host: localhost    Database: awd
-- ------------------------------------------------------
-- Server version 5.7.18


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `token` varchar(32) NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `team_name` (`team_name`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


--
-- Table structure for table `docker`
--

DROP TABLE IF EXISTS `docker`;
CREATE TABLE `docker` (
  `container_id` varchar(32) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `team_id` int(11) NOT NULL,
  `team_name` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`container_id`),
  KEY `team_id` (`team_id`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `docker_team_id` FOREIGN KEY (`team_id`) REFERENCES `user` (`team_id`),
  CONSTRAINT `docker_team_name` FOREIGN KEY (`team_name`) REFERENCES `user` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `flag`
--

DROP TABLE IF EXISTS `flag`;
CREATE TABLE `flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team1` varchar(32) NOT NULL,
  `team2` varchar(32) NOT NULL,
  `team3` varchar(32) NOT NULL,
  `team4` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(20) NOT NULL,
  `base` int(11) NOT NULL,
  `gain` int(11) NOT NULL,
  `loss` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  KEY `team_id` (`team_id`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `score_team_id` FOREIGN KEY (`team_id`) REFERENCES `user` (`team_id`),
  CONSTRAINT `score_team_name` FOREIGN KEY (`team_name`) REFERENCES `user` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` varchar(32) NOT NULL,
  `port` varchar(20) NOT NULL,
  `service_name` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `container_id` (`container_id`),
  CONSTRAINT `service_container_id` FOREIGN KEY (`container_id`) REFERENCES `docker` (`container_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `team_id` int(11) NOT NULL,
  `team1` tinyint(4) NOT NULL,
  `team2` tinyint(4) NOT NULL,
  `team3` tinyint(4) NOT NULL,
  `team4` tinyint(4) NOT NULL,
  KEY `team_id` (`team_id`),
  CONSTRAINT `status_team_id` FOREIGN KEY (`team_id`) REFERENCES `user` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





--
-- Test Data
--


--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'Alpha','alpha','123','2c1743a391305fbf367df8e4f069f9f9'),(2,'Beta','beta','456','987bcab01b929eb2c07877b224215c92'),(3,'Gamma','gamma','789','05b048d7242cb7b8b57cfa3b1d65ecea'),(4,'Delta','delta','012','63bcabf86a9a991864777c631c5b7617');
UNLOCK TABLES;

--
-- Dumping data for table `docker`
--

LOCK TABLES `docker` WRITE;
INSERT INTO `docker` VALUES ('05b048d7242c','172.17.0.103',3,'Gamma','ghi'),('2c1743a39130','172.17.0.101',1,'Alpha','abc'),('63bcabf86a9a','172.17.0.104',4,'Delta','jkl'),('987bcab01b92','172.17.0.102',2,'Beta','def');
UNLOCK TABLES;

--
-- Dumping data for table `flag`
--

LOCK TABLES `flag` WRITE;
INSERT INTO `flag` VALUES (1,'ab0bfd73daaec7912dcdca1ba0ba3d05','9a48ddad2656385fce58af47a0ef56cf','6811597e100f778019a5363fe01a24c7','fb63a9f13fce3aceb81d59e4a8af52e1');
UNLOCK TABLES;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
INSERT INTO `manager` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3');
UNLOCK TABLES;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
INSERT INTO `score` VALUES (1,'Alpha',1000,0,150,850),(2,'Beta',1000,300,0,1300),(3,'Gamma',1000,200,50,1150),(4,'Delta',1000,100,100,1000);
UNLOCK TABLES;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
INSERT INTO `service` VALUES (1,'2c1743a39130','22','ssh','up'),(2,'2c1743a39130','80','web-apache','up'),(3,'2c1743a39130','8080','web-tomcat','up'),(4,'987bcab01b92','22','ssh','up'),(5,'987bcab01b92','80','web-apache','up'),(6,'987bcab01b92','8080','web-tomcat','up'),(7,'05b048d7242c','22','ssh','up'),(8,'05b048d7242c','80','web-apache','up'),(9,'05b048d7242c','8080','web-tomcat','up'),(10,'63bcabf86a9a','22','ssh','up'),(11,'63bcabf86a9a','80','web-apache','up'),(12,'63bcabf86a9a','8080','web-tomcat','up');
UNLOCK TABLES;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
INSERT INTO `status` VALUES (1,0,0,0,0),(2,1,1,1,1),(3,1,0,1,1),(4,1,0,0,0);
UNLOCK TABLES;

