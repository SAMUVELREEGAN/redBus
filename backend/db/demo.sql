-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.43

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add bus owner',7,'add_busowner'),(26,'Can change bus owner',7,'change_busowner'),(27,'Can delete bus owner',7,'delete_busowner'),(28,'Can view bus owner',7,'view_busowner'),(29,'Can add bus model',8,'add_busmodel'),(30,'Can change bus model',8,'change_busmodel'),(31,'Can delete bus model',8,'delete_busmodel'),(32,'Can view bus model',8,'view_busmodel'),(33,'Can add seat model',9,'add_seatmodel'),(34,'Can change seat model',9,'change_seatmodel'),(35,'Can delete seat model',9,'delete_seatmodel'),(36,'Can view seat model',9,'view_seatmodel'),(37,'Can add bus seat',10,'add_busseat'),(38,'Can change bus seat',10,'change_busseat'),(39,'Can delete bus seat',10,'delete_busseat'),(40,'Can view bus seat',10,'view_busseat');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$xKTUi2ZZV0Snl3AcMcqI9X$UfkVO95xPMT0i3VNG5/FIsCH4s+GifG9C4TF6K3sy+Y=','2025-10-11 05:03:25.339068',1,'sam','','','',1,1,'2025-10-11 05:02:23.474081');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busmodel_busmodel`
--

DROP TABLE IF EXISTS `busmodel_busmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busmodel_busmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bus_name` varchar(100) NOT NULL,
  `start_location` varchar(100) DEFAULT NULL,
  `end_location` varchar(100) DEFAULT NULL,
  `start_time` varchar(100) DEFAULT NULL,
  `end_time` varchar(100) DEFAULT NULL,
  `bus_number` varchar(100) NOT NULL,
  `amenities` json NOT NULL,
  `bus_features` json NOT NULL,
  `owner_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `busModel_busmodel_owner_id_9a7bbe43_fk_busOwnerModel_busowner_id` (`owner_id`),
  CONSTRAINT `busModel_busmodel_owner_id_9a7bbe43_fk_busOwnerModel_busowner_id` FOREIGN KEY (`owner_id`) REFERENCES `busownermodel_busowner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busmodel_busmodel`
--

LOCK TABLES `busmodel_busmodel` WRITE;
/*!40000 ALTER TABLE `busmodel_busmodel` DISABLE KEYS */;
INSERT INTO `busmodel_busmodel` VALUES (1,'SR Transport','Dindigul','Bangalore','10','6','Tn57 CY 9952','[\"Sleeper\"]','[\"AC\"]',1);
/*!40000 ALTER TABLE `busmodel_busmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busownermodel_busowner`
--

DROP TABLE IF EXISTS `busownermodel_busowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busownermodel_busowner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ownerUserName` varchar(100) NOT NULL,
  `ownerPassword` varchar(100) NOT NULL,
  `ownerEmail` varchar(254) NOT NULL,
  `ownerPhoneNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerEmail` (`ownerEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busownermodel_busowner`
--

LOCK TABLES `busownermodel_busowner` WRITE;
/*!40000 ALTER TABLE `busownermodel_busowner` DISABLE KEYS */;
INSERT INTO `busownermodel_busowner` VALUES (1,'sam','sam123','samuvelreegan373@gmail.com','9345532741');
/*!40000 ALTER TABLE `busownermodel_busowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busseats_busseat`
--

DROP TABLE IF EXISTS `busseats_busseat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busseats_busseat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `seat_number` varchar(10) NOT NULL,
  `deck` varchar(20) NOT NULL,
  `side` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `is_booked` tinyint(1) NOT NULL,
  `busId_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `busSeats_busseat_busId_id_56ba3ebe_fk_busModel_busmodel_id` (`busId_id`),
  CONSTRAINT `busSeats_busseat_busId_id_56ba3ebe_fk_busModel_busmodel_id` FOREIGN KEY (`busId_id`) REFERENCES `busmodel_busmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busseats_busseat`
--

LOCK TABLES `busseats_busseat` WRITE;
/*!40000 ALTER TABLE `busseats_busseat` DISABLE KEYS */;
INSERT INTO `busseats_busseat` VALUES (1,'L1','lower','left','seater',0,1),(2,'L2','lower','left','seater',0,1),(3,'L3','lower','left','seater',0,1),(4,'L4','lower','left','seater',0,1),(5,'L5','lower','left','seater',0,1),(6,'L6','lower','left','seater',0,1),(7,'L7','lower','left','seater',0,1),(8,'L8','lower','left','seater',0,1),(9,'L9','lower','left','seater',0,1),(10,'L10','lower','left','seater',0,1),(11,'L11','lower','right','seater',0,1),(12,'L12','lower','right','seater',0,1),(13,'L13','lower','right','seater',0,1),(14,'L14','lower','right','seater',0,1),(15,'L15','lower','right','seater',0,1),(16,'L16','lower','right','seater',0,1),(17,'L17','lower','right','seater',0,1),(18,'L18','lower','right','seater',0,1),(19,'L19','lower','right','seater',0,1),(20,'L20','lower','right','seater',0,1),(21,'L21','lower','right','seater',0,1),(22,'L22','lower','right','seater',0,1),(23,'L23','lower','right','seater',0,1),(24,'L24','lower','right','seater',0,1),(25,'L25','lower','right','seater',0,1),(26,'L26','lower','right','seater',0,1),(27,'L27','lower','right','seater',0,1),(28,'L28','lower','right','seater',0,1),(29,'L29','lower','right','seater',0,1),(30,'L30','lower','right','seater',0,1),(31,'U1','upper','left','sleeper_sit',0,1),(32,'U2','upper','left','sleeper_sit',0,1),(33,'U3','upper','left','sleeper_sit',0,1),(34,'U4','upper','left','sleeper_sit',0,1),(35,'U5','upper','left','sleeper_sit',0,1),(36,'U6','upper','left','sleeper_sit',0,1),(37,'U7','upper','right','sleeper_sit',0,1),(38,'U8','upper','right','sleeper_sit',0,1),(39,'U9','upper','right','sleeper_sit',0,1),(40,'U10','upper','right','sleeper_sit',0,1),(41,'U11','upper','right','sleeper_sit',0,1),(42,'U12','upper','right','sleeper_sit',0,1),(43,'U13','upper','right','sleeper_sit',0,1),(44,'U14','upper','right','sleeper_sit',0,1),(45,'U15','upper','right','sleeper_sit',0,1),(46,'U16','upper','right','sleeper_sit',0,1),(47,'U17','upper','right','sleeper_sit',0,1),(48,'U18','upper','right','sleeper_sit',0,1);
/*!40000 ALTER TABLE `busseats_busseat` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-10-11 05:08:58.108838','1','sam',1,'[{\"added\": {}}]',7,1),(2,'2025-10-11 05:11:01.752434','1','SR Transport - Tn57 CY 9952',1,'[{\"added\": {}}]',8,1),(3,'2025-10-11 05:46:33.634170','1','SR Transport',1,'[{\"added\": {}}]',9,1),(4,'2025-10-11 06:03:48.777546','1','SR Transport',1,'[{\"added\": {}}]',10,1),(5,'2025-10-11 06:04:02.411118','2','SR Transport',1,'[{\"added\": {}}]',10,1),(6,'2025-10-11 06:16:59.806465','11','L11 - lower_deck - right_seater - SR Transport',1,'[{\"added\": {}}]',10,1),(7,'2025-10-11 06:21:58.976021','36','U36 - lower_deck - left_seater - SR Transport',2,'[{\"changed\": {\"fields\": [\"Side\"]}}]',10,1),(8,'2025-10-11 06:22:05.180966','35','U35 - lower_deck - left_seater - SR Transport',2,'[{\"changed\": {\"fields\": [\"Side\"]}}]',10,1),(9,'2025-10-11 06:22:09.964226','34','U34 - lower_deck - left_seater - SR Transport',2,'[{\"changed\": {\"fields\": [\"Side\"]}}]',10,1),(10,'2025-10-11 06:22:17.260275','33','U33 - upper_deck - left_seater - SR Transport',2,'[{\"changed\": {\"fields\": [\"Deck\", \"Side\"]}}]',10,1),(11,'2025-10-11 06:22:24.861707','32','U32 - upper_deck - left_seater - SR Transport',2,'[{\"changed\": {\"fields\": [\"Deck\", \"Side\"]}}]',10,1),(12,'2025-10-11 06:22:35.815108','31','U31 - upper_deck - left_seater - SR Transport',2,'[{\"changed\": {\"fields\": [\"Deck\", \"Side\"]}}]',10,1),(13,'2025-10-11 06:22:39.877062','36','U36 - upper_deck - left_seater - SR Transport',2,'[{\"changed\": {\"fields\": [\"Deck\"]}}]',10,1),(14,'2025-10-11 06:22:43.518900','35','U35 - upper_deck - left_seater - SR Transport',2,'[{\"changed\": {\"fields\": [\"Deck\"]}}]',10,1),(15,'2025-10-11 06:22:48.816488','34','U34 - upper_deck - left_seater - SR Transport',2,'[{\"changed\": {\"fields\": [\"Deck\"]}}]',10,1),(16,'2025-10-11 06:24:48.997861','48','U36 - upper_deck - right_sleeper_sit - SR Transport',2,'[{\"changed\": {\"fields\": [\"Type\"]}}]',10,1),(17,'2025-10-11 06:26:08.938858','48','U18 - upper_deck - right_sleeper_sit - SR Transport',2,'[]',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'busModel','busmodel'),(7,'busOwnerModel','busowner'),(10,'busSeats','busseat'),(5,'contenttypes','contenttype'),(9,'seatModel','seatmodel'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-10-11 05:01:47.173611'),(2,'auth','0001_initial','2025-10-11 05:01:48.340043'),(3,'admin','0001_initial','2025-10-11 05:01:48.542755'),(4,'admin','0002_logentry_remove_auto_add','2025-10-11 05:01:48.551713'),(5,'admin','0003_logentry_add_action_flag_choices','2025-10-11 05:01:48.560838'),(6,'contenttypes','0002_remove_content_type_name','2025-10-11 05:01:48.759898'),(7,'auth','0002_alter_permission_name_max_length','2025-10-11 05:01:48.832895'),(8,'auth','0003_alter_user_email_max_length','2025-10-11 05:01:48.857538'),(9,'auth','0004_alter_user_username_opts','2025-10-11 05:01:48.865568'),(10,'auth','0005_alter_user_last_login_null','2025-10-11 05:01:48.934868'),(11,'auth','0006_require_contenttypes_0002','2025-10-11 05:01:48.938136'),(12,'auth','0007_alter_validators_add_error_messages','2025-10-11 05:01:48.945606'),(13,'auth','0008_alter_user_username_max_length','2025-10-11 05:01:49.030286'),(14,'auth','0009_alter_user_last_name_max_length','2025-10-11 05:01:49.116597'),(15,'auth','0010_alter_group_name_max_length','2025-10-11 05:01:49.134250'),(16,'auth','0011_update_proxy_permissions','2025-10-11 05:01:49.151234'),(17,'auth','0012_alter_user_first_name_max_length','2025-10-11 05:01:49.240192'),(18,'busOwnerModel','0001_initial','2025-10-11 05:01:49.281635'),(19,'busModel','0001_initial','2025-10-11 05:01:49.388595'),(20,'sessions','0001_initial','2025-10-11 05:01:49.454601'),(21,'seatModel','0001_initial','2025-10-11 05:44:50.088611'),(22,'busSeats','0001_initial','2025-10-11 06:01:43.413455');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0qslzn8txx5m7761gjr4v09z31979l7a','.eJxVjEEOwiAQRe_C2hDGMgVcuu8ZyMAwtmpKUtqV8e7apAvd_vfef6lI2zrGrZUlTqwuCtTpd0uUH2XeAd9pvlWd67wuU9K7og_a9FC5PK-H-3cwUhu_dRIWJgzWGwOhnD17kzpksODEBMCSpYDk3HemJ0QMGVGsIwfEQUS9P-6PODw:1v7RlN:y4RnoizhTSv2S4kOPLiD6XoX9WMOkPYBptxsFhxjirg','2025-10-25 05:03:25.343377');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seatmodel_seatmodel`
--

DROP TABLE IF EXISTS `seatmodel_seatmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seatmodel_seatmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lower_deck_left_sleeper_sit` tinyint(1) NOT NULL,
  `lower_deck_left_sleeper_sit_row` int NOT NULL,
  `lower_deck_left_sleeper_sit_count` int NOT NULL,
  `lower_deck_left_seater` tinyint(1) NOT NULL,
  `lower_deck_left_seater_row` int NOT NULL,
  `lower_deck_left_seater_count` int NOT NULL,
  `lower_deck_right_sleeper_sit` tinyint(1) NOT NULL,
  `lower_deck_right_sleeper_sit_row` int NOT NULL,
  `lower_deck_right_sleeper_sit_count` int NOT NULL,
  `lower_deck_right_seater` tinyint(1) NOT NULL,
  `lower_deck_right_seater_row` int NOT NULL,
  `lower_deck_right_seater_count` int NOT NULL,
  `upper_deck_left_sleeper_sit` tinyint(1) NOT NULL,
  `upper_deck_left_sleeper_sit_row` int NOT NULL,
  `upper_deck_left_sleeper_sit_count` int NOT NULL,
  `upper_deck_left_seater` tinyint(1) NOT NULL,
  `upper_deck_left_seater_row` int NOT NULL,
  `upper_deck_left_seater_count` int NOT NULL,
  `upper_deck_right_sleeper_sit` tinyint(1) NOT NULL,
  `upper_deck_right_sleeper_sit_row` int NOT NULL,
  `upper_deck_right_sleeper_sit_count` int NOT NULL,
  `upper_deck_right_seater` tinyint(1) NOT NULL,
  `upper_deck_right_seater_row` int NOT NULL,
  `upper_deck_right_seater_count` int NOT NULL,
  `end_center_seater` tinyint(1) NOT NULL,
  `busId_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seatModel_seatmodel_busId_id_1f774834_fk_busModel_busmodel_id` (`busId_id`),
  CONSTRAINT `seatModel_seatmodel_busId_id_1f774834_fk_busModel_busmodel_id` FOREIGN KEY (`busId_id`) REFERENCES `busmodel_busmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seatmodel_seatmodel`
--

LOCK TABLES `seatmodel_seatmodel` WRITE;
/*!40000 ALTER TABLE `seatmodel_seatmodel` DISABLE KEYS */;
INSERT INTO `seatmodel_seatmodel` VALUES (1,0,0,0,1,1,10,0,0,0,1,2,10,1,1,6,0,0,0,0,2,6,0,0,0,1,1);
/*!40000 ALTER TABLE `seatmodel_seatmodel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-11 12:03:39
