-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: student_attendance
-- ------------------------------------------------------
-- Server version	8.0.41

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'sessions','0001_initial','2025-04-02 03:07:39.524150'),(2,'contenttypes','0001_initial','2025-04-02 03:08:03.418793'),(3,'auth','0001_initial','2025-04-02 03:08:03.916444'),(4,'admin','0001_initial','2025-04-02 03:08:04.034282'),(5,'admin','0002_logentry_remove_auto_add','2025-04-02 03:08:04.039406'),(6,'admin','0003_logentry_add_action_flag_choices','2025-04-02 03:08:04.044379'),(7,'contenttypes','0002_remove_content_type_name','2025-04-02 03:08:04.133575'),(8,'auth','0002_alter_permission_name_max_length','2025-04-02 03:08:04.181792'),(9,'auth','0003_alter_user_email_max_length','2025-04-02 03:08:04.200331'),(10,'auth','0004_alter_user_username_opts','2025-04-02 03:08:04.206857'),(11,'auth','0005_alter_user_last_login_null','2025-04-02 03:08:04.247031'),(12,'auth','0006_require_contenttypes_0002','2025-04-02 03:08:04.249301'),(13,'auth','0007_alter_validators_add_error_messages','2025-04-02 03:08:04.254146'),(14,'auth','0008_alter_user_username_max_length','2025-04-02 03:08:04.303343'),(15,'auth','0009_alter_user_last_name_max_length','2025-04-02 03:08:04.349813'),(16,'auth','0010_alter_group_name_max_length','2025-04-02 03:08:04.365085'),(17,'auth','0011_update_proxy_permissions','2025-04-02 03:08:04.370916'),(18,'auth','0012_alter_user_first_name_max_length','2025-04-02 03:08:04.419150');
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
INSERT INTO `django_session` VALUES ('5lgbcntvxg4qaou4b5k3yul5bm21nho5','eyJ1c2VybmFtZSI6ImFkbWluIn0:1uCxhr:fSNYP8IGoVODDiegqebi4a3mxl5cZk14MLzusOzg-vg','2025-05-22 09:38:19.514788'),('jms3pv2gq0qesrnh1j9vo0dxukxhy1ut','eyJ1c2VybmFtZSI6ImFkbWluIn0:1tzqvb:ZGVXg2RMS9tu1Sws5joJA7Qd4yqXkbWITYxJPHE1k5U','2025-04-16 05:46:19.416358');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_attendance`
--

DROP TABLE IF EXISTS `event_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_attendance` (
  `student_id` int DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `event_name` varchar(45) DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  KEY `event_sid_idx` (`student_id`),
  KEY `event_name_idx` (`event_name`),
  CONSTRAINT `event_name` FOREIGN KEY (`event_name`) REFERENCES `events` (`event_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_attendance`
--

LOCK TABLES `event_attendance` WRITE;
/*!40000 ALTER TABLE `event_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `vday(s)` varchar(45) DEFAULT NULL,
  `vstart_time` time DEFAULT NULL,
  `vend_time` time DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `event_name_UNIQUE` (`event_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_id` int NOT NULL AUTO_INCREMENT,
  `flastname` varchar(255) DEFAULT NULL,
  `ffirstname` varchar(255) DEFAULT NULL,
  `fmidname` varchar(225) DEFAULT NULL,
  `fcontactno` varchar(45) DEFAULT NULL,
  `faddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`),
  UNIQUE KEY `faculty_id_UNIQUE` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Zamora','Zennia','G',NULL,NULL),(2,'Jocosol','Jerome','V',NULL,NULL),(3,'Villamor','Roel','R',NULL,NULL),(4,'Cabahug','Reo','G',NULL,NULL),(5,'Deña','Carla','B',NULL,NULL),(6,'Baclagan','Amelyn Anatalia','R',NULL,NULL),(7,'Suanco','Joshua','R',NULL,NULL),(8,'Genovata','Jeselyne','G',NULL,NULL),(9,'Flores','Dion Jeffrey','G',NULL,NULL),(10,'Galang','Christina','T',NULL,NULL),(11,'Espinili','Priscilla','F',NULL,NULL),(12,'Hilario','Lougene','N',NULL,NULL),(13,'Chua','Carmela','R',NULL,NULL),(14,'Sochaco','Chamberlain','T',NULL,NULL),(15,'Almeda','Allen James','M',NULL,NULL),(16,'Buenaventura','Edna','L',NULL,NULL),(17,'Villacruzada','Marianne','L',NULL,NULL),(18,'Gerodias','Francis','A',NULL,NULL),(19,'Moñiza','Drick','L',NULL,NULL),(20,'Alcopra','Anica Leska','N',NULL,NULL),(21,'Alvarez','Czar Emmanuel','V',NULL,NULL),(22,'Escapalao','Love Aiza','B',NULL,NULL),(23,'Ozaeta','Mark Anthony','A',NULL,NULL),(24,'Breis','Dolores','F',NULL,NULL),(25,'Magin','Rodel','D',NULL,NULL),(26,'Apa-ap','Rey Allan','A',NULL,NULL),(27,'Segubre','Angustia','S',NULL,NULL),(28,'Calantog','J. Mhor\'s','T',NULL,NULL);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_loading`
--

DROP TABLE IF EXISTS `faculty_loading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_loading` (
  `faculty_id` int DEFAULT NULL,
  `faculty_name` varchar(255) DEFAULT NULL,
  `subid` int DEFAULT NULL,
  `subjectcode` varchar(45) DEFAULT NULL,
  `subjectdesc` varchar(255) DEFAULT NULL,
  `programs` varchar(45) DEFAULT NULL,
  `yrlvl` varchar(45) DEFAULT NULL,
  `day(s)` varchar(45) DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `room` varchar(45) DEFAULT NULL,
  KEY `fac_id_idx` (`faculty_id`),
  KEY `sub_id_idx` (`subid`),
  CONSTRAINT `fac_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`),
  CONSTRAINT `sub_id` FOREIGN KEY (`subid`) REFERENCES `subjects1` (`idsubjects`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_loading`
--

LOCK TABLES `faculty_loading` WRITE;
/*!40000 ALTER TABLE `faculty_loading` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculty_loading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `programcode` varchar(255) NOT NULL,
  `programname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`programcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES ('ABCOMM','Bachelor of Arts in Communication'),('BSBA','Bachelor of Science in Business Administration Major in Marketing Management'),('BSCS','Bachelor of Science in Computer Science'),('BSFS','Bachelor of Science in Foreign Service'),('BSHM','Bachelor of Science in Hospitality Management'),('BSIT','Bachelor of Science in Information Technology'),('BSPSY','Bachelor of Science in Psychology'),('BSTM','Bachelor of Science in Tourism Management');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_demographic`
--

DROP TABLE IF EXISTS `student_demographic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_demographic` (
  `student_id` int NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `contactno` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_demographic`
--

LOCK TABLES `student_demographic` WRITE;
/*!40000 ALTER TABLE `student_demographic` DISABLE KEYS */;
INSERT INTO `student_demographic` VALUES (221003,NULL,NULL,NULL,NULL,NULL,NULL),(221004,NULL,NULL,NULL,NULL,NULL,NULL),(221005,NULL,NULL,NULL,NULL,NULL,NULL),(221006,NULL,NULL,NULL,NULL,NULL,NULL),(221009,NULL,NULL,NULL,NULL,NULL,NULL),(221011,NULL,NULL,NULL,NULL,NULL,NULL),(222004,NULL,NULL,NULL,NULL,NULL,NULL),(222005,NULL,NULL,NULL,NULL,NULL,NULL),(222007,NULL,NULL,NULL,NULL,NULL,NULL),(222008,NULL,NULL,NULL,NULL,NULL,NULL),(222009,NULL,NULL,NULL,NULL,NULL,NULL),(222010,NULL,NULL,NULL,NULL,NULL,NULL),(222011,NULL,NULL,NULL,NULL,NULL,NULL),(222012,NULL,NULL,NULL,NULL,NULL,NULL),(222013,NULL,NULL,NULL,NULL,NULL,NULL),(222014,NULL,NULL,NULL,NULL,NULL,NULL),(222015,NULL,NULL,NULL,NULL,NULL,NULL),(222016,NULL,NULL,NULL,NULL,NULL,NULL),(222017,NULL,NULL,NULL,NULL,NULL,NULL),(222018,NULL,NULL,NULL,NULL,NULL,NULL),(222021,NULL,NULL,NULL,NULL,NULL,NULL),(222022,NULL,NULL,NULL,NULL,NULL,NULL),(222023,NULL,NULL,NULL,NULL,NULL,NULL),(222024,NULL,NULL,NULL,NULL,NULL,NULL),(222025,NULL,NULL,NULL,NULL,NULL,NULL),(222026,NULL,NULL,NULL,NULL,NULL,NULL),(222028,NULL,NULL,NULL,NULL,NULL,NULL),(222031,NULL,NULL,NULL,NULL,NULL,NULL),(222032,NULL,NULL,NULL,NULL,NULL,NULL),(222033,NULL,NULL,NULL,NULL,NULL,NULL),(223002,NULL,NULL,NULL,NULL,NULL,NULL),(223007,NULL,NULL,NULL,NULL,NULL,NULL),(223008,NULL,NULL,NULL,NULL,NULL,NULL),(223009,NULL,NULL,NULL,NULL,NULL,NULL),(223010,NULL,NULL,NULL,NULL,NULL,NULL),(223012,NULL,NULL,NULL,NULL,NULL,NULL),(223015,NULL,NULL,NULL,NULL,NULL,NULL),(223016,NULL,NULL,NULL,NULL,NULL,NULL),(223017,NULL,NULL,NULL,NULL,NULL,NULL),(223018,NULL,NULL,NULL,NULL,NULL,NULL),(223019,NULL,NULL,NULL,NULL,NULL,NULL),(223022,NULL,NULL,NULL,NULL,NULL,NULL),(223023,NULL,NULL,NULL,NULL,NULL,NULL),(223026,NULL,NULL,NULL,NULL,NULL,NULL),(223028,NULL,NULL,NULL,NULL,NULL,NULL),(223030,NULL,NULL,NULL,NULL,NULL,NULL),(224001,NULL,NULL,NULL,NULL,NULL,NULL),(224002,NULL,NULL,NULL,NULL,NULL,NULL),(224003,NULL,NULL,NULL,NULL,NULL,NULL),(224004,NULL,NULL,NULL,NULL,NULL,NULL),(224005,NULL,NULL,NULL,NULL,NULL,NULL),(224006,NULL,NULL,NULL,NULL,NULL,NULL),(224007,NULL,NULL,NULL,NULL,NULL,NULL),(224008,NULL,NULL,NULL,NULL,NULL,NULL),(224009,NULL,NULL,NULL,NULL,NULL,NULL),(224010,NULL,NULL,NULL,NULL,NULL,NULL),(224011,NULL,NULL,NULL,NULL,NULL,NULL),(224012,NULL,NULL,NULL,NULL,NULL,NULL),(224013,NULL,NULL,NULL,NULL,NULL,NULL),(224014,NULL,NULL,NULL,NULL,NULL,NULL),(224015,NULL,NULL,NULL,NULL,NULL,NULL),(224016,NULL,NULL,NULL,NULL,NULL,NULL),(224017,NULL,NULL,NULL,NULL,NULL,NULL),(224018,NULL,NULL,NULL,NULL,NULL,NULL),(224019,NULL,NULL,NULL,NULL,NULL,NULL),(224020,NULL,NULL,NULL,NULL,NULL,NULL),(224021,NULL,NULL,NULL,NULL,NULL,NULL),(224022,NULL,NULL,NULL,NULL,NULL,NULL),(224023,NULL,NULL,NULL,NULL,NULL,NULL),(2011440,NULL,NULL,NULL,NULL,NULL,NULL),(2011443,NULL,NULL,NULL,NULL,NULL,NULL),(2013433,NULL,NULL,NULL,NULL,NULL,NULL),(2015236,NULL,NULL,NULL,NULL,NULL,NULL),(2018716,NULL,NULL,NULL,NULL,NULL,NULL),(2021249,NULL,NULL,NULL,NULL,NULL,NULL),(2022455,NULL,NULL,NULL,NULL,NULL,NULL),(2400167,NULL,NULL,NULL,NULL,NULL,NULL),(2700325,NULL,NULL,NULL,NULL,NULL,NULL),(2800148,NULL,NULL,NULL,NULL,NULL,NULL),(2800332,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student_demographic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_enrollment`
--

DROP TABLE IF EXISTS `student_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_enrollment` (
  `student_id` int NOT NULL,
  `studentname` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `year_level` varchar(45) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `regular/irregular` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT 'ENROLLED',
  `date_enrolled` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_enrollment`
--

LOCK TABLES `student_enrollment` WRITE;
/*!40000 ALTER TABLE `student_enrollment` DISABLE KEYS */;
INSERT INTO `student_enrollment` VALUES (11,'Neil Dojeta',NULL,'4th Year','BSCS',NULL,NULL,'ENROLLED',NULL,NULL),(221003,'Diho, Andrea Joyce Macabare','Female','4th','BS in Psy','Old','Regular','ENROLLED','2025-01-13',NULL),(221004,'Bagayas, Many Nathalie Manrique','Female','4th','BS in Psy','Old','Regular','ENROLLED','2025-01-09',NULL),(221005,'Gonzalo, Tirshatha Shobek Dacasin','Female','4th','BS in Psy','Old','Regular','ENROLLED','2025-01-10',NULL),(221006,'Guico, Jem Mariel Santos','Female','4th','BS in Psy','Old','Regular','ENROLLED','2025-01-08',NULL),(221009,'Par, Sarah Joy Tidula','Female','4th','BS in Psy','Old','Irregular','ENROLLED','2025-01-16',NULL),(221011,'Dojeta, Neil Andrews Isabelo','Male','4th','BS in CS','Old','Regular','ENROLLED','2025-01-09',NULL),(222004,'Matas, Al Christian Dela Rosa','Male','3rd','BS in Psy','Returnee','Irregular','ENROLLED','2025-01-15',NULL),(222005,'Bagayas, Clemrose Faith Manrique','Female','3rd','BS in HM','Old','Regular','ENROLLED','2025-01-13',NULL),(222007,'Avelino, Jan Gabrielle','Female','3rd','BS in Psy','Old','Regular','ENROLLED','2025-01-13',NULL),(222008,'Faraon, Rizelle Mari Manalo','Female','3rd','BS in FS','Old','Regular','ENROLLED','2025-01-10',NULL),(222009,'Alfaro, Ashley Mhae Caspar','Female','3rd','BS in FS','Old','Regular','ENROLLED','2025-01-09',NULL),(222010,'Guerra, John Hendrick Hebreo','Male','4th','BS in Psy','Old','Irregular','ENROLLED','2025-01-14',NULL),(222011,'Abala, Alessandra Sevilla','Female','3rd','BS in Psy','Old','Regular','ENROLLED','2025-01-08',NULL),(222012,'Malabo, Joshua Lerpido','Male','3rd','BS in IT','Old','Regular','ENROLLED','2025-01-10',NULL),(222013,'Reopirio, Tricia Mae Labaco','Female','3rd','BS in Psy','Old','Regular','ENROLLED','2025-01-14',NULL),(222014,'Dela Vega, Alyanna Nicole Calman','Female','3rd','BS in CS','Old','Regular','ENROLLED','2025-01-08',NULL),(222015,'Ranas, Crizzia Faith Canobida','Female','3rd','BS in Psy','Old','Regular','ENROLLED','2025-01-08',NULL),(222016,'Carencia, Crizelle Ann Cruz','Female','3rd','BS in Psy','Old','Regular','ENROLLED','2025-01-09',NULL),(222017,'Getalado, Sara Abygail Calve','Female','3rd','BS in IT','Old','Regular','ENROLLED','2025-01-10',NULL),(222018,'Del Rosario, Bea Jade','Female','3rd','BS in Psy','Old','Regular','ENROLLED','2025-01-09',NULL),(222021,'Polmo Jr., Albert Orbidalla','Male','3rd','BS in HM','Old','Irregular','ENROLLED','2025-01-10',NULL),(222022,'Blanco, Norwen Boy','Male','3rd','BS in IT','Old','Regular','ENROLLED','2025-01-13',NULL),(222023,'Alonte, Denize Anne Balingit','Female','3rd','BS in TM','Old','Regular','ENROLLED','2025-01-09',NULL),(222024,'Alonte, Razel Anne Balingit','Female','3rd','BS in FS','Old','Regular','ENROLLED','2025-01-10',NULL),(222025,'Alfuente, Kurt Alexandre Estanislao','Male','3rd','BS in Psy','New/Transferee','Irregular','ENROLLED','2025-01-13',NULL),(222026,'Rosales, Justine Christian','Male','3rd','BS in IT','Old','Irregular','ENROLLED','2025-01-14',NULL),(222028,'Rondilla, Aaron Christian Alante','Male','3rd','BS in TM','Old','Regular','ENROLLED','2025-01-09',NULL),(222031,'Zapata, Paulla Shane Layoso','Female','3rd','BS in Psy','Old','Regular','ENROLLED','2025-01-14',NULL),(222032,'Cabrales, Aedin Jerome Reyes','Male','3rd','BS in CS','Old','Regular','ENROLLED','2025-01-14',NULL),(222033,'Pacoma, Tristan Domondon','Male','3rd','BS in BA','Old','Regular','ENROLLED','2025-01-09',NULL),(223002,'Lobaton, Christopher Jr. David','Male','3rd','BS in HM','Old','Irregular','ENROLLED','2025-01-08',NULL),(223007,'Desa, Anne Gabrielle','Female','2nd','BS in HM','Old','Regular','ENROLLED','2025-01-09',NULL),(223008,'Gudani, Edeah Thane Palaruan','Female','2nd','BA in Comm','Old','Regular','ENROLLED','2025-01-08',NULL),(223009,'Endrada, Alliyah Lorraine Dela Rosa','Female','2nd','BS in BA','Old','Regular','ENROLLED','2025-01-08',NULL),(223010,'Ampil, Daniel Francis Victoria','Male','2nd','BS in BA','Old','Regular','ENROLLED','2025-01-09',NULL),(223012,'Solis, Nhia Leecole Calderon','Female','2nd','BS in CS','Old','Regular','ENROLLED','2025-01-08',NULL),(223015,'Sumalinab, Michaela Mist Pagsac','Female','2nd','BS in FS','Old','Regular','ENROLLED','2025-01-14',NULL),(223016,'Ilisan, Jasper Sion','Male','2nd','BS in IT','Old','Regular','ENROLLED','2025-01-10',NULL),(223017,'Dichoso, Gwyneth Shane Tangco','Female','2nd','BS in Psy','Old','Regular','ENROLLED','2025-01-13',NULL),(223018,'llar, Cassandra Gelaine Perez','Female','2nd','BS in BA','Old','Regular','ENROLLED','2025-01-15',NULL),(223019,'Dizon, Carl Joshua Aguila','Male','4th','BS in Psy','Old','Irregular','ENROLLED','2025-01-13',NULL),(223022,'Bancosta, Cathleen Ann Rodolfo','Female','2nd','BS in Psy','Old','Regular','ENROLLED','2025-01-09',NULL),(223023,'Sia, Jordan Alcade Bandian','Male','2nd','BS in CS','Old','Regular','ENROLLED','2025-01-09',NULL),(223026,'Clemente, Nash Jermaine Mercado','Female','2nd','BS in CS','Old','Regular','ENROLLED','2025-01-14',NULL),(223028,'Salonga, Sherr Andrei Pastoral','Male','2nd','BS in BA','Old','Regular','ENROLLED','2025-01-15',NULL),(223030,'Supremo, Dean Aries Rafael Arenas','Male','2nd','BA in Comm','Old','Irregular','ENROLLED','2025-01-13',NULL),(224001,'Argame, Kevin Quill R.','Male','1st','BS in m','New/Freshmen','Regular','ENROLLED','2025-01-08',NULL),(224002,'Recacho, Karla Benice Miranda','Female','1st','BS in Psy','New/Freshmen','Regular','ENROLLED','2025-01-08',NULL),(224003,'Bagason, Patrick Elizalde M.','Male','1st','BS in m','New/Freshmen','Regular','ENROLLED','2025-01-09',NULL),(224004,'Luna, Erika Ann Tagle','Female','1st','BA in Comm','New/Freshmen','Regular','ENROLLED','2025-01-10',NULL),(224005,'Tanjusay, Lissa Mariz Garcia','Female','1st','BS n HM','New/Freshmen','Regular','ENROLLED','2025-01-10',NULL),(224006,'Santos, Ralph Franco','Male','1st','BS in TM','New/Freshmen','Regular','ENROLLED','2025-01-08',NULL),(224007,'Bravo, Maria Isabella Buenaflor','Female','1st','BS in Psy','New/Freshmen','Regular','ENROLLED','2025-01-09',NULL),(224008,'Pabalan, Shania Dela Cruz','Female','1st','BS in IT','New/Freshmen','Regular','ENROLLED','2026-01-15',NULL),(224009,'Jenon, Maria Annetonette Barabicho','Female','1st','BS in HM','New/Freshmen','Regular','ENROLLED','2025-01-10',NULL),(224010,'Yabut, Beatrice Ange','Female','2nd','BS in BA','Newmransferee','Irregular','ENROLLED','2025-01-08',NULL),(224011,'Cabalsa, Joejuana Bunacod','Female','1st','BS in IT','New/Freshmen','Regular','ENROLLED','2025-01-08',NULL),(224012,'Laurenciano, Kate Christine Tica','Female','1st','BS in FS','New/Freshmen','Regular','ENROLLED','2025-01-15',NULL),(224013,'Regencia, Ashley Amante','Female','1st','BS in IT','New/Freshmen','Regular','ENROLLED','2025-01-08',NULL),(224014,'Aquino, Raphael James Miguel','Male','1st','BS in CS','New/Freshmen','Regular','ENROLLED','2025-01-09',NULL),(224015,'Espina, Diana Grace Blarito','Female','1st','BS in CS','New/Freshmen','Regular','ENROLLED','2025-01-09',NULL),(224016,'Villena, Francis Lacsinto','Male','1st','BS in FS','New/Freshmen','Regular','ENROLLED','2025-01-09',NULL),(224017,'Salinas, James Rafael Rioflorido','Male','1st','BS in HM','New/Freshmen','Regular','ENROLLED','2025-01-22',NULL),(224018,'Garcia, Alena Beatriz Manaoat','Female','1st','BS in FS','New/Freshmen','Regular','ENROLLED','2025-01-14',NULL),(224019,'Solis, Bianca Chanelle Calderon','Female','1st','BS in Psy','New/Freshmen','Regular','ENROLLED','2025-01-15',NULL),(224020,'Manahan, John Benedict Gomez','Male','1st','BS in Psy','New/Freshmen','Regular','ENROLLED','2025-01-15',NULL),(224021,'Salazar, Hanna Isabelle Dandan','Female','2nd','BS in Psy','New/Transferee','Irregular','ENROLLED','2025-01-14',NULL),(224022,'Espeleta, Judy Ann Maligo','Female','2nd','BS in TM','Newmransferee','Irregular','ENROLLED','2025-01-10',NULL),(224023,'Dino, Jamilla Mae Estorpe','Female','1st','BA in Comm','New/Freshmen','Regular','ENROLLED','2025-01-10',NULL),(2011440,'Dimaano, Elric Lewis Serviento','Male','4th','BS in CS','Old','Irregular','ENROLLED','2025-01-10',NULL),(2011443,'De Leon , Roy Mj Baquir','Male','1st','BS in HM','New/Transferee','Irregular','ENROLLED','2025-01-09',NULL),(2013433,'Andres, Paul Jordan Canigan','Male','1st','BS in CS','New/Freshmen','Regular','ENROLLED','2025-01-08',NULL),(2015236,'Calibo, Celeste Jellena Petil','Female','4th','BS tn Psy','Old','Irregular','ENROLLED','2025-01-09',NULL),(2018716,'Venturanza, Gurshwyn Krey Lucero','Male','1st','BS in BA','New/Freshmen','Regular','ENROLLED','2025-01-08',NULL),(2021249,'Salvador, Edcel Lorente','Male','1st','BS in Psy','New/Freshmen','Regular','ENROLLED','2025-01-22',NULL),(2022455,'Rodriguez, Maynard Matiey Unsay','Male','3rd','BS in CS','Old','Regular','ENROLLED','2025-01-09',NULL),(2400167,'Alcarde, Mark Joseph Mirador','Male','4th','BS in Psy','Old','Irregular','ENROLLED','2025-01-13',NULL),(2700325,'Fanio, Lance Andrei Baylon','Male','1st','BS in FS','New/Freshmen','Regular','ENROLLED','2025-01-13',NULL),(2800148,'Dijamco, Ellyn Jewel Anne Isidro','Female','3rd','BS in Psy','Old','Regular','ENROLLED','2025-01-08',NULL),(2800332,'Dinglasan, Angelo Agaran','Male','3rd','BS in IT','Old','Regular','ENROLLED','2025-01-08',NULL);
/*!40000 ALTER TABLE `student_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_loading`
--

DROP TABLE IF EXISTS `student_loading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_loading` (
  `student_id` int DEFAULT NULL,
  `subjects` varchar(255) DEFAULT NULL,
  KEY `studid_idx` (`student_id`),
  CONSTRAINT `studid` FOREIGN KEY (`student_id`) REFERENCES `student_demographic` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_loading`
--

LOCK TABLES `student_loading` WRITE;
/*!40000 ALTER TABLE `student_loading` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_loading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_assignment`
--

DROP TABLE IF EXISTS `subject_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_assignment` (
  `idsubject_assignment` int DEFAULT NULL,
  `programs` varchar(255) DEFAULT NULL,
  `yearlvl` varchar(255) DEFAULT NULL,
  KEY `programcode` (`programs`) /*!80000 INVISIBLE */,
  KEY `idsubassign_idx` (`idsubject_assignment`),
  KEY `yrlvl_idx` (`yearlvl`),
  CONSTRAINT `idsubassign` FOREIGN KEY (`idsubject_assignment`) REFERENCES `subjects1` (`idsubjects`),
  CONSTRAINT `programcode` FOREIGN KEY (`programs`) REFERENCES `programs` (`programcode`),
  CONSTRAINT `yrlvl` FOREIGN KEY (`yearlvl`) REFERENCES `yearlvl` (`yrlvl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_assignment`
--

LOCK TABLES `subject_assignment` WRITE;
/*!40000 ALTER TABLE `subject_assignment` DISABLE KEYS */;
INSERT INTO `subject_assignment` VALUES (1,'BSCS','4th Year'),(2,'BSIT','2nd Year'),(2,'BSCS','2nd Year'),(3,'BSIT','2nd Year'),(3,'BSHM','2nd Year'),(3,'BSFS','2nd Year'),(3,'BSPSY','2nd Year'),(3,'BSTM','2nd Year'),(3,'BSCS','2nd Year'),(3,'BSBA','2nd Year'),(3,'BSFS','3rd Year'),(3,'ABCOMM','2nd Year'),(3,'BSCS','4th Year'),(4,'BSCS','3rd Year'),(5,'BSHM','1st Year'),(6,'BSFS','1st Year'),(6,'BSFS','2nd Year'),(7,'ABCOMM','2nd Year'),(8,'BSBA','2nd Year'),(9,'BSHM','1st Year'),(9,'BSTM','1st Year'),(10,'BSHM','2nd Year'),(10,'BSTM','2nd Year'),(11,'BSCS','4th Year'),(12,'BSFS','3rd Year'),(13,'ABCOMM','2nd Year'),(14,'BSCS','4th Year'),(15,'ABCOMM','1st Year'),(16,'BSBA','1st Year'),(17,'BSIT','1st Year'),(17,'BSHM','1st Year'),(17,'BSPSY','1st Year'),(17,'BSTM','1st Year'),(17,'BSCS','1st Year'),(17,'ABCOMM','1st Year'),(17,'BSBA','1st Year'),(18,'BSPSY','4th Year'),(19,'BSHM','2nd Year'),(20,'BSCS','4th Year'),(21,'BSPSY','1st Year'),(21,'BSPSY','3rd Year'),(22,'ABCOMM','1st Year'),(23,'BSFS','2nd Year'),(24,'BSFS','3rd Year'),(25,'BSCS','1st Year'),(26,'BSHM','2nd Year'),(26,'BSTM','2nd Year'),(27,'BSBA','4th Year'),(28,'BSHM','3rd Year'),(28,'BSFS','3rd Year'),(28,'BSTM','3rd Year'),(28,'BSCS','4th Year'),(29,'BSPSY','2nd Year'),(30,'BSBA','3rd Year'),(31,'BSBA','2nd Year'),(32,'BSPSY','2nd Year'),(32,'BSPSY','4th Year'),(33,'BSFS','1st Year'),(34,'BSFS','2nd Year'),(35,'BSFS','3rd Year'),(36,'BSBA','2nd Year'),(37,'BSHM','3rd Year'),(38,'ABCOMM','1st Year'),(39,'ABCOMM','2nd Year'),(39,'BSBA','2nd Year'),(39,'BSCS','2nd Year'),(39,'BSFS','2nd Year'),(39,'BSHM','2nd Year'),(39,'BSIT','2nd Year'),(39,'BSPSY','2nd Year'),(39,'BSTM','2nd Year'),(40,'BSTM','2nd Year'),(41,'BSHM','3rd Year'),(42,'BSPSY','1st Year'),(43,'BSBA','1st Year'),(44,'BSCS','1st Year'),(44,'BSIT','1st Year'),(45,'BSCS','3rd Year'),(45,'BSIT','3rd Year'),(46,'BSCS','3rd Year'),(46,'BSPSY','3rd Year'),(47,'BSBA','4th Year'),(48,'BSCS','2nd Year'),(49,'BSCS','1st Year'),(49,'BSIT','1st Year'),(50,'ABCOMM','1st Year'),(50,'BSBA','1st Year'),(50,'BSCS','1st Year'),(50,'BSFS','1st Year'),(50,'BSHM','1st Year'),(50,'BSIT','1st Year'),(50,'BSPSY','1st Year'),(50,'BSTM','1st Year'),(51,'ABCOMM','2nd Year'),(52,'BSFS','3rd Year'),(53,'BSCS','3rd Year'),(54,'BSHM','1st Year'),(54,'BSTM','1st Year'),(55,'BSHM','3rd Year'),(55,'BSTM','3rd Year'),(56,'ABCOMM','1st Year'),(56,'BSBA','1st Year'),(56,'BSCS','1st Year'),(56,'BSFS','1st Year'),(56,'BSHM','1st Year'),(56,'BSIT','1st Year'),(56,'BSPSY','1st Year'),(56,'BSTM','1st Year'),(57,'BSCS','3rd Year'),(58,'BSIT','3rd Year'),(59,'BSCS','2nd Year'),(59,'BSIT','2nd Year'),(60,'BSIT','2nd Year'),(60,'BSCS','3rd Year'),(60,'BSIT','3rd Year'),(61,'BSCS','3rd Year'),(62,'ABCOMM','1st Year'),(62,'BSBA','1st Year'),(62,'BSCS','1st Year'),(62,'BSFS','1st Year'),(62,'BSHM','1st Year'),(62,'BSIT','1st Year'),(62,'BSPSY','1st Year'),(62,'BSTM','1st Year'),(63,'ABCOMM','2nd Year'),(63,'BSBA','2nd Year'),(63,'BSCS','2nd Year'),(63,'BSFS','2nd Year'),(63,'BSHM','2nd Year'),(63,'BSIT','2nd Year'),(63,'BSPSY','2nd Year'),(63,'BSTM','2nd Year'),(64,'BSBA','4th Year'),(64,'BSPSY','4th Year'),(65,'ABCOMM','1st Year'),(65,'BSBA','1st Year'),(65,'BSCS','1st Year'),(65,'BSFS','1st Year'),(65,'BSHM','1st Year'),(65,'BSIT','1st Year'),(65,'BSPSY','1st Year'),(65,'BSTM','1st Year'),(66,'BSIT','1st Year'),(66,'BSCS','2nd Year'),(67,'BSCS','2nd Year'),(68,'BSBA','2nd Year'),(69,'BSBA','1st Year'),(69,'BSFS','1st Year'),(69,'BSBA','2nd Year'),(69,'BSFS','2nd Year'),(70,'BSBA','2nd Year'),(70,'BSHM','2nd Year'),(70,'BSTM','2nd Year'),(96,'BSIT','3rd Year'),(71,'BSCS','2nd Year'),(72,'BSBA','1st Year'),(73,'BSPSY','2nd Year'),(73,'BSPSY','3rd Year'),(74,'BSPSY','1st Year'),(75,'BSFS','2nd Year'),(76,'BSHM','2nd Year'),(76,'BSTM','2nd Year'),(77,'BSPSY','3rd Year'),(78,'BSCS','4th Year'),(79,'BSBA','4th Year'),(80,'BSBA','4th Year'),(81,'BSHM','3rd Year'),(82,'BSIT','2nd Year'),(83,'BSBA','3rd Year'),(83,'BSIT','3rd Year'),(84,'ABCOMM','1st Year'),(84,'BSBA','1st Year'),(84,'BSCS','1st Year'),(84,'BSFS','1st Year'),(84,'BSHM','1st Year'),(84,'BSIT','1st Year'),(84,'BSPSY','1st Year'),(84,'BSTM','1st Year'),(85,'ABCOMM','2nd Year'),(85,'BSBA','2nd Year'),(85,'BSCS','2nd Year'),(85,'BSFS','2nd Year'),(85,'BSHM','2nd Year'),(85,'BSIT','2nd Year'),(85,'BSPSY','2nd Year'),(85,'BSTM','2nd Year'),(86,'ABCOMM','3rd Year'),(86,'BSBA','3rd Year'),(86,'BSCS','3rd Year'),(86,'BSFS','3rd Year'),(86,'BSHM','3rd Year'),(86,'BSIT','3rd Year'),(86,'BSPSY','3rd Year'),(86,'BSTM','3rd Year'),(87,'BSHM','3rd Year'),(88,'BSCS','3rd Year'),(89,'BSTM','3rd Year'),(90,'BSTM','3rd Year'),(91,'BSTM','3rd Year'),(92,'BSFS','3rd Year'),(93,'BSTM','1st Year'),(94,'ABCOMM','2nd Year'),(95,'BSIT','2nd Year');
/*!40000 ALTER TABLE `subject_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `idsubjects` int NOT NULL AUTO_INCREMENT,
  `subjectcode` varchar(255) DEFAULT NULL,
  `subjectdesc` varchar(255) DEFAULT NULL,
  `programs` varchar(45) DEFAULT NULL,
  `yearlvl` varchar(45) DEFAULT NULL,
  `lec` int DEFAULT NULL,
  `lab` int DEFAULT NULL,
  `units` int DEFAULT NULL,
  PRIMARY KEY (`idsubjects`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (182,'CONWRLD','The Contemporary World','BSIT','1',3,0,3),(183,'MATHMOD','Mathematics in the Modern World','BSIT','1',3,0,3),(184,'PHILHIS','Readings in Philippine History','BSIT','1',3,0,3),(185,'NASTRA2','National Service Training Program 2','BSIT','1',3,0,3),(186,'PATHFit2','Exercise-Based Fitness Activities','BSIT','1',2,0,2),(187,'THE0102','Creed','BSIT','1',3,0,3),(188,'INTRPRO','Intermediate Programming','BSIT','1',2,1,3),(189,'INFMNGT','Information Management','BSIT','1',2,1,3),(190,'PHYELEC','Physics for Computing Sciences with Electromagnetism','BSIT','1',3,0,3),(191,'ARTAPP','Art Appreciation','BSIT','2',3,0,3),(192,'GENDSOC','Gender & Society','BSIT','2',3,0,3),(193,'PATHFit4','Folk, Classical, & Contemporary Dance','BSIT','2',2,0,2),(194,'THE0104','Morals','BSIT','2',3,0,3),(195,'APPDEVT','Applications Development & Emerging Technologies','BSIT','2',2,1,3),(196,'WEBTECH','Web System Technologies','BSIT','2',2,1,3),(197,'OBJPROG','Object-Oriented Programming','BSIT','2',2,1,3),(198,'OPERSYS','Operating System','BSIT','2',2,1,3),(199,'SYSADES','Systems Analysis & Design','BSIT','2',3,0,3),(200,'INFORSEC2','Information Assurance Security 2','BSIT','3',2,1,3),(201,'NETWRK2','Networking 2','BSIT','3',2,1,3),(202,'OPERSYS','Operating System','BSIT','3',2,1,3),(203,'PROJDEV','Capstone Research Project Development','BSIT','3',3,0,3),(204,'THE0106','Life and Works of St. Augustine','BSIT','3',3,0,3),(205,'CONWRLD','The Contemporary World','BSHM','1',3,0,3),(206,'MATHMOD','Mathematics in the Modern World','BSHM','1',3,0,3),(207,'PHILHIS','Readings in Philippine History','BSHM','1',3,0,3),(208,'NASTRA2','National Service Training Program 2','BSHM','1',3,0,3),(209,'PATHFit2','Exercise-Based Fitness Activities','BSHM','1',2,0,2),(210,'THE0102','Creed','BSHM','1',3,0,3),(211,'BUSMARK','Business Marketing','BSHM','1',3,0,3),(212,'BFPREPN','Kitchen Essentials & Basic Food Preparation','BSHM','1',1,2,3),(213,'MPTH102A','Micro Perspective of Tourism & Hospitality','BSHM','1',3,0,3),(214,'ARTAPP','Art Appreciation','BSHM','2',3,0,3),(215,'GENDSOC','Gender & Society','BSHM','2',3,0,3),(216,'PATHFit4','Folk, Classical, & Contemporary Dance','BSHM','2',2,0,2),(217,'THEO104','Morals','BSHM','2',3,0,3),(218,'ENTMIND','The Entrepreneurial Mind','BSHM','2',3,0,3),(219,'PROFDEV','Personality Development and Professional Relations','BSHM','2',3,0,3),(220,'QLTYMGT','Quality Service Management in Tourism & Hospitality','BSHM','2',3,0,3),(221,'BUSTOOL','Applied Business Tools & Technologies in Tourism','BSHM','2',2,1,3),(222,'CRUISET','Cruise Tourism','BSHM','2',3,0,3),(223,'ETHITAX','Ethics With Taxation','BSHM','3',3,0,3),(224,'FUNDFOR','Fundamentais tn Lodging Operations (Front Office/Rooms Division)','BSHM','3',2,1,3),(225,'HMELEC2','Bar and beverage Management','BSHM','3',2,1,3),(226,'MULDIVE','Multicultural Diversity in Workplace for the Tourism Professionals','BSHM','3',3,0,3),(227,'SUPLMGT','Suppiy Chain/Management in Hospitality Industry','BSHM','3',3,0,3),(228,'THEOL06','Life and Works of St. Augustine','BSHM','3',3,0,3),(229,'THESIH2','Research in Hospitality 2','BSHM','3',3,0,3),(230,'MATHMOD','Mathematics in the Modern World','BSFS','1',3,0,3),(231,'PHILHIS','Readings in Philippine History (w/ Philippine Constitution & Agrarian Reform)','BSFS','1',3,0,3),(232,'BIOLOGY','College Biology','BSFS','1',4,1,5),(233,'NASTRA2','National Service Training Program 2','BSFS','1',3,0,3),(234,'PHYEDU2','Individual Dual Sports','BSFS','1',2,0,2),(235,'THEO102','Creed','BSFS','1',3,0,3),(236,'PROETIQ','Protocol and Etiquette','BSFS','1',3,0,3),(237,'FORLAN2','Intermediate Foreign Language','BSFS','1',3,0,3),(238,'DIPCONS','Diplomatic and Consular Practice','BSFS','1',3,0,3),(239,'POLIGOV','Introduction to Philippine Politics & Governance','BSFS','1',3,0,3),(240,'ARTAPP','Art Appreciation','BSFS','2',3,0,3),(241,'GENDSOC','Social Sciences & Philosophy (Gender & Society)','BSFS','2',3,0,3),(242,'PHYEDU4','Folk, Classical & Contemporary Dance','BSFS','2',2,0,2),(243,'PROETIQ','Protocol and Etiquette','BSFS','2',3,0,3),(244,'PUBILAW','Public International Law','BSFS','2',3,0,3),(245,'BIOLOGY','College Biology','BSFS','2',4,1,5),(246,'THE0104','Morals (Commandment)','BSFS','2',3,0,3),(247,'DIPCONS','Diplomatic & Consular Practice','BSFS','2',3,0,3),(248,'FORLAN4','Advanced Foreign Language','BSFS','2',3,0,3),(249,'ARTAPRE','Art Appreciation','BSFS','3',3,0,3),(250,'METHRES','Methods of Research','BSFS','3',3,0,3),(251,'TREATIS','Treaties and Treaty Making','BSFS','3',3,0,3),(252,'FORLAN6','Advanced Foreign Language 2','BSFS','3',3,0,3),(253,'DIPCORR','Diplomatic Correspondence','BSFS','3',3,0,3),(254,'ETHITAX','Ethics (With Taxation)','BSFS','3',3,0,3),(255,'COLLPHY','College Physics','BSFS','3',4,1,5),(256,'THE0106','Life and Works of St. Augustine','BSFS','3',3,0,3),(257,'CONWRLD','The Contemporary World','BSPSYCH','1',3,0,3),(258,'MATHMOD','Mathematics in the Modern World','BSPSYCH','1',3,0,3),(259,'PHILHIS','Readings in Philippine History','BSPSYCH','1',3,0,3),(260,'NASTRA2','National Service Training Program 2','BSPSYCH','1',3,0,3),(261,'PATHFit2','Exercise-Based Fitness Activities','BSPSYCH','1',2,0,2),(262,'THE0102','Creed','BSPSYCH','1',3,0,3),(263,'PSYSTAT','Psychological Statistics','BSPSYCH','1',5,0,5),(264,'DEPSYCH','Developmental Psychology','BSPSYCH','1',3,0,3),(265,'HUMANB2','Human Biology 2','BSPSYCH','1',3,1,4),(266,'ARTAPP','Art Appreciation','BSPSYCH','2',3,0,3),(267,'GENDSOC','Gender & Society','BSPSYCH','2',3,0,3),(268,'PATHFit4','Folk, Classical, & Contemporary Dance','BSPSYCH','2',2,0,2),(269,'THE0104','Morals','BSPSYCH','2',3,0,3),(270,'EXPSYCH','Experimental Psychology','BSPSYCH','2',3,2,5),(271,'FLPSYCH','Filipino Psychology','BSPSYCH','2',3,0,3),(272,'PSYASMT','Psychological Assessment','BSPSYCH','2',3,2,5),(273,'DEPSYCH','Developmental Psychology','BSPSYCH','3',3,0,3),(274,'INORPSY','Industrial/Organizational Psychology','BSPSYCH','3',3,0,3),(275,'PSYASMT','Psychological Assessment','BSPSYCH','3',3,2,5),(276,'RSRCHIOI','Research in Psychology 1','BSPSYCH','3',3,0,3),(277,'THE0106','Life and Works of St. Augustine','BSPSYCH','3',3,0,3),(278,'COPSYCH','Cognitive Psychology','BSPSYCH','4',3,0,3),(279,'FLPSYCH','Filipino Psychology','BSPSYCH','4',3,0,3),(280,'PERSDEV','Personality Development and Professional Relations','BSPSYCH','4',3,0,3),(281,'CONWRLD','The Contemporary World','BSTM','1',3,0,3),(282,'MATHMOD','Mathematics in the Modern World','BSTM','1',3,0,3),(283,'PHILHIS','Readings in Philippine History','BSTM','1',3,0,3),(284,'NASTRA2','National Service Training Program 2','BSTM','1',3,0,3),(285,'PATHFit2','Exercise-Based Fitness Activities','BSTM','1',2,0,2),(286,'THE0102','Creed','BSTM','1',3,0,3),(287,'BUSMARK','Business Marketing','BSTM','1',3,0,3),(288,'MPTH102','Micro Perspective of Tourism & Hospitality','BSTM','1',3,0,3),(289,'TSMPLAN','Tourism Policy Planning & Development','BSTM','1',3,0,3),(290,'ARTAPP','Art Appreciation','BSTM','2',3,0,3),(291,'GENDSOC','Gender & Society','BSTM','2',3,0,3),(292,'PATHFit4','Folk, Classical, & Contemporary Dance','BSTM','2',2,0,2),(293,'THE0104','Morals','BSTM','2',3,0,3),(294,'ENTMIND','The Entrepreneurial Mind','BSTM','2',3,0,3),(295,'PROFDEV','Personality Development and Professional Relations','BSTM','2',3,0,3),(296,'QLTYMGT','Quality Service Management in Tourism & Hospitality','BSTM','2',3,0,3),(297,'BUSTOOL','Applied Business Tools & Technologies in Tourism','BSTM','2',2,1,3),(298,'GLOBCUL','Global Culture & Tourism Geography','BSTM','2',3,0,3),(299,'ETHITAX','Ethics with Taxation','BSTM','3',3,0,3),(300,'MULDIVE','Multicultural Diversity in Workplace for the Tourism Professionals','BSTM','3',3,0,3),(301,'THEOL06','Life and Works of St. Augustine','BSTM','3',3,0,3),(302,'THESIT2','Research in Tourism 2','BSTM','3',3,0,3),(303,'TOURMGT','Tour and Travel Management','BSTM','3',3,0,3),(304,'TRANMGT','Transportation Management','BSTM','3',3,0,3),(305,'CONWRLD','The Contemporary World','BSCS','1',3,0,3),(306,'MATHMOD','Mathematics in the Modern World','BSCS','1',3,0,3),(307,'PHILHIS','Readings in Philippine History','BSCS','1',3,0,3),(308,'NASTRA2','National Service Training Program 2','BSCS','1',3,0,3),(309,'PATHFit2','Exercise-Based Fitness Activities','BSCS','1',2,0,2),(310,'THE0102','Creed','BSCS','1',3,0,3),(311,'INTRPRO','Intermediate Programming','BSCS','1',2,1,3),(312,'INFMNGT','Information Management','BSCS','1',2,1,3),(313,'DISTRU2','Discrete Structures 2','BSCS','1',3,0,3),(314,'ARTAPP','Art Appreciation','BSCS','2',3,0,3),(315,'GENDSOC','Gender & Society','BSCS','2',3,0,3),(316,'PATHFit4','Folk, Classical, & Contemporary Dance','BSCS','2',2,0,2),(317,'THE0104','Morals','BSCS','2',3,0,3),(318,'INTCALC','Integral Calculus','BSCS','2',3,0,3),(319,'PHYELEC','Physics for Computing Sciences (with Electromagnetism)','BSCS','2',3,0,3),(320,'APPDEVT','Applications Development & Emerging Technologies','BSCS','2',2,1,3),(321,'PROLANGI','Programming Languages','BSCS','2',3,0,3),(322,'OBJPROG','Object-Oriented Programming','BSCS','2',2,1,3),(323,'AUTOLNG','Automata Theory and Format Language','BSCS','3',3,0,3),(324,'MOAPDEV','Mobile Application Development','BSCS','3',2,1,3),(325,'NETCOMM','Networking and Communications','BSCS','3',2,1,3),(326,'OPERSYS','Operating System','BSCS','3',2,1,3),(327,'PANIPIL','Sosyedad at Literatura/Panitikang Panlipunan','BSCS','3',3,0,3),(328,'THE0106','Life and Works of St. Augustine','BSCS','3',3,0,3),(329,'THESIS2C','CS Thesis Writing 2','BSCS','3',3,0,3),(330,'ALGCOMP','Algorithms and Complexity','BSCS','4',2,1,3),(331,'ARTAPRECS','Art Appreciation','BSCS','4',3,0,3),(332,'CALCULS','Calculus','BSCS','4',3,0,3),(333,'COMPSCI','Computational Science','BSCS','4',3,0,3),(334,'DATWAMI','Data Warehousing and Data Mining','BSCS','4',2,1,3),(335,'ETHITAX','Ethics with Taxation','BSCS','4',3,0,3),(336,'SOCPROF','Social and Professional Issues','BSCS','4',3,0,3),(337,'CONWRLD','The Contemporary World','BACOMM','1',3,0,3),(338,'MATHMOD','Mathematics in the Modern World','BACOMM','1',3,0,3),(339,'PHILHIS','Readings in Philippine History','BACOMM','1',3,0,3),(340,'NASTRA2','National Service Training Program 2','BACOMM','1',3,0,3),(341,'PATHFit2','Exercise-Based Fitness Activities','BACOMM','1',2,0,2),(342,'THE0102','Creed','BACOMM','1',3,0,3),(343,'COMTHEO','Communication Theory','BACOMM','1',3,0,3),(344,'DIGIPHO','Digital Photography','BACOMM','1',3,0,3),(345,'FUNDFVP','Fundamentals of Film & Video Production','BACOMM','1',2,1,3),(346,'ARTAPRE','Art Appreciation','BACOMM','2',3,0,3),(347,'GENDSOC','Gender & Society','BACOMM','2',3,0,3),(348,'PATHFit4','Folk, Classical, & Contemporary Dance','BACOMM','2',2,0,2),(349,'THE0104','Morals','BACOMM','2',3,0,3),(350,'MEDCODE','Communication Media Laws & Ethics','BACOMM','2',3,0,3),(351,'COMPLAN','Communication Planning','BACOMM','2',3,0,3),(352,'BRODCAS','Broadcasting Principles & Practices','BACOMM','2',2,1,3),(353,'WEBCOM','Web Content Management','BACOMM','2',2,1,3),(354,'CONWRLD','The Contemporary World','BSBA-MM','1',3,0,3),(355,'MATHMOD','Mathematics in the Modern World','BSBA-MM','1',3,0,3),(356,'PHILHIS','Readings in Philippine History','BSBA-MM','1',3,0,3),(357,'NASTRA2','National Service Training Program 2','BSBA-MM','1',3,0,3),(358,'PATHFit2','Exercise-Based Fitness Activities','BSBA-MM','1',2,0,2),(359,'THE0102','Creed','BSBA-MM','1',3,0,3),(360,'HUREMAN','Human Resource Management','BSBA-MM','1',3,0,3),(361,'PROSALE','Professional Salesmanship','BSBA-MM','1',3,0,3),(362,'CONSUMR','Consumer Behavior','BSBA-MM','1',3,0,3),(363,'ARTAPP','Art Appreciation','BSBA-MM','2',3,0,3),(364,'GENDSOC','Gender & Society','BSBA-MM','2',3,0,3),(365,'PATHFit4','Folk, Classical, & Contemporary Dance','BSBA-MM','2',2,0,2),(366,'THE0104','Morals','BSBA-MM','2',3,0,3),(367,'PROBRAN','Product and Brand Management','BSBA-MM','2',3,0,3),(368,'BUSIRES','Business Research','BSBA-MM','2',3,0,3),(369,'FRANCHI','Franchising','BSBA-MM','2',3,0,3),(370,'FINAMAN','Financial Management','BSBA-MM','2',3,0,3),(371,'TAXINCO','Income Taxation','BSBA-MM','3',3,0,3),(372,'FIL102','Filipino sa Iba\'t -ibang Disiplina','BSBA-MM','3',3,0,3),(373,'ENTRMAN','Entrepreneurial Management','BSBA-MM','4',3,0,3),(374,'INTBUST','International Business and Trade','BSBA-MM','4',3,0,3),(375,'PERSDEV','Personality Development and Professional Relations','BSBA-MM','4',3,0,3),(376,'SPTMARK','Special Topics in Marketing Management','BSBA-MM','4',3,0,3),(377,'STRAMAN','Strategic Management','BSBA-MM','4',3,0,3);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects1`
--

DROP TABLE IF EXISTS `subjects1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects1` (
  `idsubjects` int NOT NULL AUTO_INCREMENT,
  `subjectcode` varchar(255) DEFAULT NULL,
  `subjectdesc` varchar(255) DEFAULT NULL,
  `lec` int DEFAULT NULL,
  `lab` int DEFAULT NULL,
  `units` int DEFAULT NULL,
  PRIMARY KEY (`idsubjects`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects1`
--

LOCK TABLES `subjects1` WRITE;
/*!40000 ALTER TABLE `subjects1` DISABLE KEYS */;
INSERT INTO `subjects1` VALUES (1,'ALGCOMP','Algorithms and Complexity',2,1,3),(2,'APPDEVT','Applications Development & Emerging Technologies',2,1,3),(3,'ARTAPP','Art Appreciation',3,0,3),(4,'AUTOLANG','Automata Theory and Formal Language ',3,0,3),(5,'BFPREPN','Kitchen Essentials & Basic Food Preparation',1,2,3),(6,'BIOLOGY','College Biology',4,1,5),(7,'BRODCAS','Broadcasting Principles & Practices',2,1,3),(8,'BUSIRES','Business Research',3,0,3),(9,'BUSMARK','Business Marketing',3,0,3),(10,'BUSTOOL','Applied Business Tools & Technologies in Tourism',2,1,3),(11,'CALCULS','Calculus',3,0,3),(12,'COLLPHY','College Physics',4,1,5),(13,'COMPLAN','Communication Planning',3,0,3),(14,'COMPSCI','Computational Science',3,0,3),(15,'COMTHEO','Communication Theory',3,0,3),(16,'CONSUMR','Consumer Behavior',3,0,3),(17,'CONWRLD','The Contemporary World',3,0,3),(18,'COPSYCH','Cognitive Psychology',3,0,3),(19,'CRUISET','Cruise Tourism',3,0,3),(20,'DATWAMI','Data Warehousing and Data Mining',2,1,3),(21,'DEPSYCH','Developmental Psychology',3,0,3),(22,'DIGIPHO','Digital Photography',3,0,3),(23,'DIPCONS','Diplomatic and Consular Practice',3,0,3),(24,'DIPCORR','Diplomatic Correspondence',3,0,3),(25,'DISTRU2','Discrete Structures 2',3,0,3),(26,'ENTMIND','The Entrepreneurial Mind',3,0,3),(27,'ENTRMAN','Entrepreneurial Management',3,0,3),(28,'ETHITAX','Ethics With Taxation',3,0,3),(29,'EXPSYCH','Experimental Psychology',3,2,5),(30,'FIL102','Filipino sa Iba\'t -ibang Disiplina',3,0,3),(31,'FINAMAN','Financial Management',3,0,3),(32,'FLPSYCH','Filipino Psychology',3,0,3),(33,'FORLAN2','Intermediate Foreign Language',3,0,3),(34,'FORLAN4','Advanced Foreign Language',3,0,3),(35,'FORLAN6','Advanced Foreign Language 2',3,0,3),(36,'FRANCHI','Franchising',3,0,3),(37,'FUNDFOR','Fundamentais tn Lodging Operations (Front Office/Rooms Division)',2,1,3),(38,'FUNDFVP','Fundamentals of Film & Video Production',2,1,3),(39,'GENDSOC','Gender & Society',3,0,3),(40,'GLOBCUL','Global Culture & Tourism Geography',3,0,3),(41,'HMELEC2','Bar and beverage Management',2,1,3),(42,'HUMANB2','Human Biology 2',3,1,4),(43,'HUREMAN','Human Resource Management',3,0,3),(44,'INFMNGT','Information Management',2,1,3),(45,'INFORSEC2','Information Assurance Security 2',2,1,3),(46,'INORPSY','Industrial/Organizational Psychology',3,0,3),(47,'INTBUST','International Business and Trade',3,0,3),(48,'INTCALC','Integral Calculus',3,0,3),(49,'INTRPRO','Intermediate Programming',2,1,3),(50,'MATHMOD','Mathematics in the Modern World',3,0,3),(51,'MEDCODE','Communication Media Laws & Ethics',3,0,3),(52,'METHRES','Methods of Research',3,0,3),(53,'MOAPDEV','Mobile Application Development',2,1,3),(54,'MPTH102','Micro Perspective of Tourism & Hospitality',3,0,3),(55,'MULDIVE','Multicultural Diversity in Workplace for the Tourism Professionals',3,0,3),(56,'NASTRA2','National Service Training Program 2',3,0,3),(57,'NETCOMM','Networking and Communications',2,1,3),(58,'NETWRK2','Networking 2',2,1,3),(59,'OBJPROG','Object-Oriented Programming',2,1,3),(60,'OPERSYS','Operating System',2,1,3),(61,'PANIPIL','Sosyedad at Literatura/Panitikang Panlipunan',3,0,3),(62,'PATHFit2','Exercise-Based Fitness Activities',2,0,2),(63,'PATHFit4','Folk, Classical, & Contemporary Dance',2,0,2),(64,'PERSDEV','Personality Development and Professional Relations',3,0,3),(65,'PHILHIS','Readings in Philippine History',3,0,3),(66,'PHYELEC','Physics for Computing Sciences with Electromagnetism',3,0,3),(67,'POLIGOV','Introduction to Philippine Politics & Governance',3,0,3),(68,'PROBRAN','Product and Brand Management',3,0,3),(69,'PROETIQ','Protocol and Etiquette',3,0,3),(70,'PROFDEV','Personality Development and Professional Relations',3,0,3),(71,'PROLANG','Programming Languages',3,0,3),(72,'PROSALE','Professional Salesmanship',3,0,3),(73,'PSYASMT','Psychological Assessment',3,2,5),(74,'PSYSTAT','Psychological Statistics',5,0,5),(75,'PUBILAW','Public International Law',3,0,3),(76,'QLTYMGT','Quality Service Management in Tourism & Hospitality',3,0,3),(77,'RSRCHIOI','Research in Psychology 1',3,0,3),(78,'SOCPROF','Social and Professional Issues',3,0,3),(79,'SPTMARK','Special Topics in Marketing Management',3,0,3),(80,'STRAMAN','Strategic Management',3,0,3),(81,'SUPLMGT','Suppiy Chain/Management in Hospitality Industry',3,0,3),(82,'SYSADES','Systems Analysis & Design',3,0,3),(83,'TAXINCO','Income Taxation',3,0,3),(84,'THE0102','Creed',3,0,3),(85,'THE0104','Morals',3,0,3),(86,'THE0106','Life and Works of St. Augustine',3,0,3),(87,'THESIH2','Research in Hospitality 2',3,0,3),(88,'THESIS2C','CS Thesis Writing 2',3,0,3),(89,'THESIT2','Research in Tourism 2',3,0,3),(90,'TOURMGT','Tour and Travel Management',3,0,3),(91,'TRANMGT','Transportation Management',3,0,3),(92,'TREATIS','Treaties and Treaty Making',3,0,3),(93,'TSMPLAN','Tourism Policy Planning & Development',3,0,3),(94,'WEBCOM','Web Content Management',2,1,3),(95,'WEBTECH','Web System Technologies',2,1,3),(96,'PROJDEV','Capstone Research Project Development',3,0,3);
/*!40000 ALTER TABLE `subjects1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `usertype` varchar(45) DEFAULT 'student',
  `approved` varchar(45) DEFAULT 'no',
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin','yes'),(8,'neildojeta@gmail.com','123','student','yes');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yearlvl`
--

DROP TABLE IF EXISTS `yearlvl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yearlvl` (
  `yrlvl` varchar(255) NOT NULL,
  PRIMARY KEY (`yrlvl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearlvl`
--

LOCK TABLES `yearlvl` WRITE;
/*!40000 ALTER TABLE `yearlvl` DISABLE KEYS */;
INSERT INTO `yearlvl` VALUES ('1st Year'),('2nd Year'),('3rd Year'),('4th Year');
/*!40000 ALTER TABLE `yearlvl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-08 17:42:29
