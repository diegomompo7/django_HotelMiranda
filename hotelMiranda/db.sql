-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: HotelMiranda
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity` varchar(255) NOT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `amenities_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (110,'[\"urbanus\", \"tui\", \"fugit\", \"carcer\", \"curiositas\"]',5),(111,'[\"strenuus\", \"uredo\", \"votum\", \"bene\", \"antea\"]',6),(112,'[\"usque\", \"acerbitas\", \"deprimo\", \"aeternus\", \"laudantium\"]',7),(113,'[\"cetera\", \"accedo\", \"comedo\", \"architecto\", \"fugit\"]',8),(114,'[\"maiores\", \"creator\", \"vestrum\", \"vilis\", \"censura\"]',9),(115,'[\"adeo\", \"charisma\", \"careo\", \"peior\", \"doloribus\"]',10),(116,'[\"claudeo\", \"thesis\", \"sub\", \"ait\", \"comis\"]',11),(117,'[\"doloribus\", \"tergo\", \"hic\", \"textor\", \"sperno\"]',12),(118,'[\"tam\", \"spoliatio\", \"omnis\", \"suadeo\", \"vobis\"]',13),(119,'[\"illum\", \"addo\", \"ascisco\", \"alo\", \"denuncio\"]',14),(120,'[\"cohors\", \"venia\", \"ciminatio\", \"viduo\", \"suppellex\"]',15),(121,'[\"ambulo\", \"terminatio\", \"corrumpo\", \"civis\", \"corpus\"]',16),(122,'[\"aiunt\", \"utpote\", \"aranea\", \"adflicto\", \"repellat\"]',17),(123,'[\"velociter\", \"succurro\", \"tonsor\", \"defendo\", \"quam\"]',18),(124,'[\"acsi\", \"somniculosus\", \"maiores\", \"virga\", \"texo\"]',19),(125,'[\"Wifi\", \"TV\"]',52),(126,'[\"Wifi\", \"TV\"]',53),(127,'[\"Wifi\", \"TV\"]',54);
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add choice',7,'add_choice'),(26,'Can change choice',7,'change_choice'),(27,'Can delete choice',7,'delete_choice'),(28,'Can view choice',7,'view_choice'),(29,'Can add question',8,'add_question'),(30,'Can change question',8,'change_question'),(31,'Can delete question',8,'delete_question'),(32,'Can view question',8,'view_question'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add contact',10,'add_contact'),(38,'Can change contact',10,'change_contact'),(39,'Can delete contact',10,'delete_contact'),(40,'Can view contact',10,'view_contact'),(41,'Can add room',11,'add_room'),(42,'Can change room',11,'change_room'),(43,'Can delete room',11,'delete_room'),(44,'Can view room',11,'view_room'),(45,'Can add booking',12,'add_booking'),(46,'Can change booking',12,'change_booking'),(47,'Can delete booking',12,'delete_booking'),(48,'Can view booking',12,'view_booking'),(49,'Can add amenity',13,'add_amenity'),(50,'Can change amenity',13,'change_amenity'),(51,'Can delete amenity',13,'delete_amenity'),(52,'Can view amenity',13,'view_amenity'),(53,'Can add room',14,'add_room'),(54,'Can change room',14,'change_room'),(55,'Can delete room',14,'delete_room'),(56,'Can view room',14,'view_room'),(57,'Can add booking',15,'add_booking'),(58,'Can change booking',15,'change_booking'),(59,'Can delete booking',15,'delete_booking'),(60,'Can view booking',15,'view_booking'),(61,'Can add contact',16,'add_contact'),(62,'Can change contact',16,'change_contact'),(63,'Can delete contact',16,'delete_contact'),(64,'Can view contact',16,'view_contact'),(65,'Can add user',17,'add_user'),(66,'Can change user',17,'change_user'),(67,'Can delete user',17,'delete_user'),(68,'Can view user',17,'view_user'),(69,'Can add amenity',18,'add_amenity'),(70,'Can change amenity',18,'change_amenity'),(71,'Can delete amenity',18,'delete_amenity'),(72,'Can view amenity',18,'view_amenity'),(73,'Can add order',19,'add_order'),(74,'Can change order',19,'change_order'),(75,'Can delete order',19,'delete_order'),(76,'Can view order',19,'view_order');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$EC04QPxs9fCU9UsCcyaJpP$7PvmY+Ytw4Xo1/Y0iAXGJu3fse172GBvjabt9XSvbsA=','2024-02-13 13:32:05.988003',1,'diego','','','diego@diegomompo.com',1,1,'2024-02-05 10:47:57.887861'),(2,'pbkdf2_sha256$260000$315mzagj3JqUSeAwEaWEAg$my0sXZJ12mVnwUIQCYgzKExiaWqQAQqG5al4NeDHCK0=','2024-02-13 11:18:57.785860',0,'iago_miranda','Iago','Miranda','iago.miranda@gmail.com',0,1,'2024-02-13 10:45:20.457661'),(4,'pbkdf2_sha256$260000$DJF1bOY317Ugxc2ImvlaSl$DRQKrEHXrZOfLRjPuUfQwXXN6Xd++VdjrVIpa+7PW+o=','2024-02-13 15:53:41.567845',0,'angel_solanad','Angel','Solana','angel.solana@gmadl.com',0,1,'2024-02-13 11:59:16.986719');
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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `orderDate` date NOT NULL,
  `check_in` date NOT NULL,
  `hour_in` time NOT NULL,
  `check_out` date NOT NULL,
  `hour_out` time NOT NULL,
  `room_id` int NOT NULL,
  `specialRequest` longtext,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userImg` longtext NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `stars` int NOT NULL,
  `is_archived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/532.jpg','Tomás','Marroquín Garica','Tomas_MarroquinGarica@yahoo.com','950270182','2023-06-22','Delectus blanditiis tredecim versus tredecim.','Timor clamo amplitudo comes bellum stipes. Acervus deripio nesciunt creator alii harum est ciminatio earum tamquam.',3,0),(2,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1196.jpg','Carolina','Soto Reyna','Carolina.SotoReyna@yahoo.com','902343031','2023-09-12','Incidunt complectus suppono sollers tertius.','Careo speculum depono tot tres veritas curvo. Administratio caput canto cinis spargo tertius.',2,0),(3,'https://avatars.githubusercontent.com/u/8125461','Carla','Espino Cabán','Carla.EspinoCaban72@yahoo.com','945111022','2023-10-28','Talus ut defero tolero vaco.','Tubineus blandior repudiandae celebrer tribuo. Utique amplexus adinventitias.',1,0),(4,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/847.jpg','Alberto','Elizondo Vázquez','Alberto23@hotmail.com','903689783','2023-08-12','Laborum verus confido advenio somniculosus.','Libero bestia acidus vespillo alius veritatis abstergo tubineus ipsam. Suadeo desidero corona comptus compono denuo degusto.',5,0),(5,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/745.jpg','Diana','Salcedo Rolón','Diana_SalcedoRolon93@hotmail.com','917129656','2023-09-15','Coerceo statim defendo celebrer vix.','Pariatur verbum ventus vigor audeo. Adnuo charisma corroboro.',3,0),(6,'https://avatars.githubusercontent.com/u/94379072','Gabriel','Trujillo Valdés','Gabriel45@yahoo.com','946813070','2023-11-16','Volva apud strues voluptatibus sint.','Spiculum accendo carbo umbra trucido desidero. Arguo eos trepide.',5,0),(7,'https://avatars.githubusercontent.com/u/3269618','María de los Ángeles','Crespo Gaitán','MariadelosAngeles90@hotmail.com','941613224','2023-08-18','Tricesimus vereor apparatus strues nobis.','Suscipit damno cultura. Censura deputo thymum toties suscipio vitium aperio thorax curatio.',5,0),(8,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/99.jpg','María de los Ángeles','Arredondo Armijo','MariadelosAngeles.ArredondoArmijo@yahoo.com','903577150','2023-03-08','Ex victoria subvenio curo nihil.','Placeat sperno aurum commemoro cursim strues subvenio. Coniuratio suffoco consuasor arbitro depopulo.',4,0),(9,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/535.jpg','Joaquín','Anguiano Vallejo','Joaquin4@hotmail.com','981145432','2023-12-21','Vicissitudo utrimque eos aliqua bonus.','Tergeo solutio strues tenuis defluo tabesco ducimus. Amiculum tempore deduco est cur suspendo dignissimos adfectus.',4,0),(10,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/14.jpg','Salvador','Uribe Ozuna','Salvador10@gmail.com','986178856','2023-10-05','Creator vinculum umquam crustulum vestigium.','Minima apparatus vomer provident surculus curriculum tui tristis. Cruentus ut voluptatum conventus.',4,0),(11,'https://avatars.githubusercontent.com/u/5401610','David','Patiño Perales','David_PatinoPerales@gmail.com','917206128','2023-04-26','Cupiditas vinco thermae circumvenio depono.','Adsuesco sed amplitudo labore tepesco desolo a accommodo. Arx neque esse quidem arbor crepusculum arto.',2,0),(12,'https://avatars.githubusercontent.com/u/23651089','Estela','Collazo Cervántez','Estela9@gmail.com','941563346','2023-02-15','Color spectaculum vilicus repellendus studio.','Arbitro nobis arcus abstergo sequi. Laboriosam attero tremo ocer villa supellex templum bene.',5,0),(13,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/521.jpg','Marcela','Negrete Argüello','Marcela_NegreteArguello49@gmail.com','966924284','2023-01-03','Compello vulticulus consequatur contra canto.','Culpo uter vivo. Fugiat tendo corona beneficium ademptio campana vorax utroque auxilium aggero.',4,0),(14,'https://avatars.githubusercontent.com/u/40477847','Juan Carlos','Villegas Candelaria','JuanCarlos_VillegasCandelaria66@gmail.com','923076914','2023-02-02','Adulatio sol cohibeo talio deficio.','Timor consuasor bestia. Capio cauda blanditiis infit tamquam sublime excepturi.',5,0),(15,'https://avatars.githubusercontent.com/u/37886885','Rebeca','Correa Delafuente','Rebeca.CorreaDelafuente@yahoo.com','923927846','2023-07-03','Pel artificiose contabesco vindico celebrer.','Utrimque pecus utrimque truculenter laudantium uterque viriliter. Solutio dolorum veritas cibo complectus creptio autem tenetur at.',2,0),(16,'d','d','d','d','d','2024-02-01','s','s',1,0);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-02-05 17:07:12.417083','4','Booking object (4)',2,'[]',12,1),(2,'2024-02-05 17:07:34.820610','11','Booking object (11)',2,'[]',12,1),(3,'2024-02-08 09:22:36.197261','68','Room object (68)',2,'[{\"changed\": {\"fields\": [\"Offer\", \"Status\"]}}]',11,1),(4,'2024-02-08 09:23:37.615254','68','Room object (68)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',11,1),(5,'2024-02-08 15:32:05.229326','68','Room object (68)',2,'[]',11,1),(6,'2024-02-08 15:32:13.016222','68','Room object (68)',2,'[{\"changed\": {\"fields\": [\"Photos\"]}}]',11,1),(7,'2024-02-08 15:32:21.351599','68','Room object (68)',2,'[{\"changed\": {\"fields\": [\"Photos\"]}}]',11,1),(8,'2024-02-08 15:32:44.286483','67','Room object (67)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(9,'2024-02-08 15:32:58.098521','66','Room object (66)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(10,'2024-02-08 15:33:18.664638','65','Room object (65)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(11,'2024-02-08 15:33:30.490317','64','Room object (64)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(12,'2024-02-08 15:33:46.400377','63','Room object (63)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(13,'2024-02-08 15:33:58.554494','62','Room object (62)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(14,'2024-02-08 15:34:26.467432','61','Room object (61)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(15,'2024-02-08 15:34:46.545275','60','Room object (60)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(16,'2024-02-08 15:35:05.150025','59','Room object (59)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(17,'2024-02-08 15:35:32.708148','58','Room object (58)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(18,'2024-02-08 15:35:52.522043','57','Room object (57)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(19,'2024-02-08 15:36:06.837538','56','Room object (56)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(20,'2024-02-08 15:36:25.329736','55','Room object (55)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(21,'2024-02-08 15:36:43.435473','54','Room object (54)',2,'[{\"changed\": {\"fields\": [\"Photos\", \"Offer\"]}}]',11,1),(22,'2024-02-08 17:10:08.259876','66','Booking object (66)',2,'[{\"changed\": {\"fields\": [\"Room\", \"SpecialRequest\"]}}]',12,1),(23,'2024-02-09 15:15:49.204470','68','Room object (68)',2,'[]',14,1),(24,'2024-02-13 11:17:45.984563','2','iago_miranda',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(25,'2024-02-13 11:18:32.438074','2','iago_miranda',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(26,'2024-02-13 11:21:24.154126','2','iago_miranda',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'polls','amenity'),(12,'polls','booking'),(7,'polls','choice'),(10,'polls','contact'),(8,'polls','question'),(11,'polls','room'),(9,'polls','user'),(6,'sessions','session'),(18,'website','amenity'),(15,'website','booking'),(16,'website','contact'),(19,'website','order'),(14,'website','room'),(17,'website','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-02-05 10:46:55.270423'),(2,'auth','0001_initial','2024-02-05 10:46:55.717195'),(3,'admin','0001_initial','2024-02-05 10:46:55.831906'),(4,'admin','0002_logentry_remove_auto_add','2024-02-05 10:46:55.845353'),(5,'admin','0003_logentry_add_action_flag_choices','2024-02-05 10:46:55.852965'),(6,'contenttypes','0002_remove_content_type_name','2024-02-05 10:46:55.914369'),(7,'auth','0002_alter_permission_name_max_length','2024-02-05 10:46:55.954038'),(8,'auth','0003_alter_user_email_max_length','2024-02-05 10:46:55.971210'),(9,'auth','0004_alter_user_username_opts','2024-02-05 10:46:55.977999'),(10,'auth','0005_alter_user_last_login_null','2024-02-05 10:46:56.012231'),(11,'auth','0006_require_contenttypes_0002','2024-02-05 10:46:56.016736'),(12,'auth','0007_alter_validators_add_error_messages','2024-02-05 10:46:56.023424'),(13,'auth','0008_alter_user_username_max_length','2024-02-05 10:46:56.064867'),(14,'auth','0009_alter_user_last_name_max_length','2024-02-05 10:46:56.107058'),(15,'auth','0010_alter_group_name_max_length','2024-02-05 10:46:56.124049'),(16,'auth','0011_update_proxy_permissions','2024-02-05 10:46:56.131533'),(17,'auth','0012_alter_user_first_name_max_length','2024-02-05 10:46:56.172951'),(18,'sessions','0001_initial','2024-02-05 10:46:56.210378'),(19,'polls','0001_initial','2024-02-05 11:02:07.564545'),(20,'polls','0002_auto_20240205_1234','2024-02-05 12:35:17.442512'),(21,'polls','0003_auto_20240205_1304','2024-02-05 13:05:07.673557'),(22,'polls','0004_room','2024-02-05 14:23:53.104144'),(23,'polls','0005_booking','2024-02-05 15:39:12.791038'),(24,'polls','0006_auto_20240205_1603','2024-02-05 16:14:59.421306'),(25,'polls','0007_rename_room_booking_room_id','2024-02-05 16:14:59.444631'),(26,'polls','0008_rename_room_id_booking_room','2024-02-05 16:14:59.465271'),(27,'polls','0009_rename_room_booking_room_id','2024-02-05 16:14:59.488194'),(28,'polls','0010_rename_room_id_booking_room','2024-02-05 16:14:59.508735'),(29,'polls','0011_remove_booking_room','2024-02-05 16:14:59.531244'),(30,'polls','0012_booking_room','2024-02-05 16:14:59.577425'),(31,'polls','0013_alter_booking_options','2024-02-05 16:20:06.103143'),(32,'polls','0014_alter_booking_options','2024-02-05 16:24:44.218615'),(33,'polls','0015_alter_booking_specialrequest','2024-02-05 16:26:16.926468'),(34,'polls','0016_alter_booking_specialrequest','2024-02-05 16:29:01.244893'),(35,'polls','0017_alter_room_pricenight','2024-02-05 16:37:24.442595'),(36,'polls','0018_alter_booking_check_out','2024-02-06 09:37:06.034840'),(37,'polls','0019_auto_20240207_1338','2024-02-07 13:38:58.621175'),(38,'polls','0020_alter_amenity_amenity','2024-02-07 17:35:33.942234'),(39,'website','0001_initial','2024-02-09 10:10:59.236086'),(40,'website','0002_alter_booking_status','2024-02-09 10:20:51.278697'),(41,'website','0003_alter_amenity_amenity','2024-02-09 10:30:18.078813'),(42,'website','0004_room_amenities','2024-02-09 11:10:53.303101'),(43,'website','0002_auto_20240209_1116','2024-02-09 11:30:26.563946'),(44,'website','0002_auto_20240209_1141','2024-02-09 11:42:10.209973'),(45,'website','0003_alter_room_pricenight','2024-02-09 15:15:24.681320'),(46,'website','0002_auto_20240209_1521','2024-02-09 15:23:52.629318'),(47,'website','0003_auto_20240209_1527','2024-02-09 15:27:48.295208'),(48,'website','0004_alter_booking_email','2024-02-09 15:27:56.755021'),(49,'website','0005_remove_contact_stars','2024-02-12 10:11:24.059325'),(50,'website','0006_remove_contact_userimg','2024-02-12 10:14:57.037412'),(51,'website','0007_auto_20240212_1055','2024-02-12 10:56:28.218917'),(52,'website','0008_contact_fullname','2024-02-12 10:57:55.509439'),(53,'website','0009_alter_contact_fullname','2024-02-12 11:02:23.931029'),(54,'website','0010_auto_20240212_1102','2024-02-12 11:02:24.007649'),(55,'website','0011_alter_contact_options','2024-02-12 11:03:06.475064'),(56,'website','0012_auto_20240212_1108','2024-02-12 11:10:40.999272'),(57,'website','0002_auto_20240213_0833','2024-02-13 08:41:55.310337'),(58,'website','0003_auto_20240213_1312','2024-02-13 13:12:56.761327'),(63,'website','0001_initial ','2024-02-13 14:03:28.186645'),(64,'website','0002_auto_20240213_1343','2024-02-13 14:03:28.253833'),(65,'website','0003_auto_20240213_1344','2024-02-13 14:03:28.295558'),(66,'website','0004_auto_20240213_1356','2024-02-13 14:03:28.303924'),(67,'website','0005_auto_20240214_1045','2024-02-14 10:45:42.478655'),(68,'website','0006_auto_20240214_1045','2024-02-14 10:47:29.895476'),(69,'website','0005_auto_20240214_1045 copy','2024-02-14 10:47:29.902818'),(70,'website','0007_merge_20240214_1047','2024-02-14 10:47:29.905607');
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
INSERT INTO `django_session` VALUES ('b8fngrda2yoc1lfoj9ss63we289ieypi','.eJxVjDkOwjAUBe_iGll4TUJJnzNYfzMOIEeKkwpxd4iUAto3M--lEmxrSVuTJU2sLsqr0--GQA-pO-A71Nusaa7rMqHeFX3QpseZ5Xk93L-DAq1868AGbDaRfEbBPpypBxIbJbgBMXZkyQO6ziMOGNh5zhBzABtJomFQ7w8QBTlF:1rZv6L:rBqPCC7H2ot1RhNE46Z9tfgs5WFzE71sxz-yCKfAO_E','2024-02-27 15:53:41.571012'),('pmjswhlu8zn8es95088s2xsk2ekabnwh','.eJxVjDsOwjAQBe_iGlnx30tJzxmsXX9wANlSnFSIu0OkFNC-mXkvFnBba9hGXsKc2JkJdvrdCOMjtx2kO7Zb57G3dZmJ7wo_6ODXnvLzcrh_BxVH_dYyCkPKR00GykRSaiecdEqSz9HkZJz24DEnAE8CrIaiXJxssUI6LMDeH8kwNzQ:1rWwk9:m8Wh0YNHs9N9trrRaOgcH1ekJGggyouVy2KkH30k2jg','2024-02-19 11:02:29.759769');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_amenity`
--

DROP TABLE IF EXISTS `polls_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_amenity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity` json NOT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_amenity_room_id_d3be6260_fk_polls_room_id` (`room_id`),
  CONSTRAINT `polls_amenity_room_id_d3be6260_fk_polls_room_id` FOREIGN KEY (`room_id`) REFERENCES `polls_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_amenity`
--

LOCK TABLES `polls_amenity` WRITE;
/*!40000 ALTER TABLE `polls_amenity` DISABLE KEYS */;
INSERT INTO `polls_amenity` VALUES (338,'[\"Wi-Fi\", \"TV de pantalla plana\", \"Minibar\", \"Caja fuerte\", \"Aire acondicionado\"]',54),(339,'[\"Desayuno incluido\", \"Artículos de aseo gratuitos\", \"Secador de pelo\", \"Plancha y tabla de planchar\", \"Servicio de habitaciones\"]',55),(340,'[\"Piscina\", \"Gimnasio\", \"Estacionamiento gratuito\", \"Recepción 24 horas\", \"Servicio de lavandería\"]',56),(341,'[\"Spa\", \"Restaurante\", \"Bar o lounge\", \"Terraza\", \"Servicio de traslado al aeropuerto\"]',57),(342,'[\"Jacuzzi\", \"Vista al mar\", \"Balcón privado\", \"Terraza panorámica\", \"Área de estar con sofá\"]',58),(343,'[\"Cama extra grande\", \"Acceso al club ejecutivo\", \"Zona de comedor\", \"Baño privado\", \"Cafetera y tetera\"]',59),(344,'[\"Escritorio de trabajo\", \"Vista al jardín\", \"Zona de estar\", \"Terraza privada\", \"Piscina privada\"]',60),(345,'[\"Vista a la ciudad\", \"Baño de hidromasaje\", \"Acceso directo a la piscina\", \"Cocina completa\", \"Chimenea\"]',61),(346,'[\"Sala de estar separada\", \"Cocina americana\", \"Sauna\", \"Bañera de hidromasaje\", \"Hamaca\"]',62),(347,'[\"Ducha de lluvia\", \"Amplio balcón\", \"Zona de parrilla\"]',63),(348,'[\"Servicio de limpieza diario\", \"Cama queen size\", \"Bañera\", \"Estación de trabajo\", \"Servicio de despertador\"]',64),(349,'[\"Cocina equipada\", \"Microondas\", \"Nevera\", \"Lavavajillas\", \"Utensilios de cocina\"]',65),(350,'[\"Vista a la montaña\", \"Sala de cine privada\", \"Mesa de billar\", \"Terraza con barbacoa\", \"Consola de videojuegos\"]',66),(351,'[\"Sistema de sonido envolvente\", \"Sala de reuniones\", \"Servicio de conserjería\", \"Bicicletas gratuitas\", \"Caja fuerte con enchufe para laptop\"]',67),(352,'[\"Baño turco\", \"Habitación insonorizada\", \"Menú de almohadas\", \"Desayuno en la habitación\", \"Lavadora y secadora\"]',68);
/*!40000 ALTER TABLE `polls_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_booking`
--

DROP TABLE IF EXISTS `polls_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `orderDate` date NOT NULL,
  `check_in` date NOT NULL,
  `hour_in` time(6) NOT NULL,
  `check_out` date NOT NULL,
  `hour_out` time(6) NOT NULL,
  `room_id` int NOT NULL,
  `specialRequest` longtext,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_booking_room_id_0d32546d_fk_polls_room_id` (`room_id`),
  CONSTRAINT `polls_booking_room_id_0d32546d_fk_polls_room_id` FOREIGN KEY (`room_id`) REFERENCES `polls_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_booking`
--

LOCK TABLES `polls_booking` WRITE;
/*!40000 ALTER TABLE `polls_booking` DISABLE KEYS */;
INSERT INTO `polls_booking` VALUES (65,'Juan Pérez','2024-02-06','2024-03-06','15:00:00.000000','2024-03-09','11:00:00.000000',58,'Necesita cama adicional','Check In'),(66,'María López','2024-02-07','2024-03-10','14:30:00.000000','2024-03-15','10:30:00.000000',58,'null','Check In'),(67,'Roberto Sánchez','2024-02-08','2024-03-05','16:45:00.000000','2024-03-08','12:00:00.000000',65,NULL,'Check In'),(68,'Ana Martínez','2024-02-09','2024-03-12','13:00:00.000000','2024-03-17','09:00:00.000000',67,'Preferencia por una habitación tranquila','Check In'),(69,'Pedro García','2024-02-10','2024-03-08','17:30:00.000000','2024-03-11','10:30:00.000000',62,NULL,'Check In'),(70,'Laura Rodríguez','2024-02-11','2024-03-15','12:00:00.000000','2024-03-20','11:00:00.000000',54,'Pet friendly','Check In'),(71,'Carlos Gómez','2024-02-12','2024-03-17','14:00:00.000000','2024-03-22','09:30:00.000000',56,NULL,'Check In'),(72,'Sofía Fernández','2024-02-13','2024-03-09','15:45:00.000000','2024-03-14','12:30:00.000000',61,'Necesita habitación con vista a la montaña','Check In'),(73,'Daniel Ruiz','2024-02-14','2024-03-06','18:00:00.000000','2024-03-09','10:00:00.000000',63,NULL,'Check In'),(74,'Elena Serrano','2024-02-15','2024-03-11','11:30:00.000000','2024-03-16','10:30:00.000000',64,'Requiere cuna para bebé','Check In'),(75,'Javier Hernández','2024-02-16','2024-03-18','16:15:00.000000','2024-03-23','11:30:00.000000',66,NULL,'Check In'),(76,'Andrea Díaz','2024-02-17','2024-03-20','13:45:00.000000','2024-03-25','12:00:00.000000',68,'Pet friendly','Check In'),(77,'David Muñoz','2024-02-18','2024-03-05','19:00:00.000000','2024-03-08','09:00:00.000000',55,NULL,'Check In'),(78,'Paula Castro','2024-02-19','2024-03-14','10:00:00.000000','2024-03-19','11:00:00.000000',57,NULL,'Check In'),(79,'Mario Bravo','2024-02-20','2024-03-08','14:30:00.000000','2024-03-11','10:00:00.000000',59,'Necesita habitación con terraza','Check In');
/*!40000 ALTER TABLE `polls_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_contact`
--

DROP TABLE IF EXISTS `polls_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userImg` varchar(200) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `date` date NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `stars` int NOT NULL,
  `is_archived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_contact`
--

LOCK TABLES `polls_contact` WRITE;
/*!40000 ALTER TABLE `polls_contact` DISABLE KEYS */;
INSERT INTO `polls_contact` VALUES (1,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/774.jpg','Ana','González','ana@example.com','987654321','2023-01-05','Consulta sobre reserva','Mensaje de prueba',4,0),(2,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1020.jpg','Luis','Martínez','luis@example.com','987654322','2023-02-15','Solicitud de información','Mensaje de prueba',5,0),(3,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/596.jpg','María','Sánchez','maria@example.com','987654323','2023-03-20','Queja sobre servicio','Mensaje de prueba',3,0),(4,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/900.jpg','Carlos','Gómez','carlos@example.com','987654324','2023-04-10','Consulta sobre eventos','Mensaje de prueba',5,0),(5,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/269.jpg','Laura','Fernández','laura@example.com','987654325','2023-05-03','Solicitud de reserva','Mensaje de prueba',4,0),(6,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/354.jpg','Pedro','Rodríguez','pedro@example.com','987654326','2023-06-17','Queja sobre instalaciones','Mensaje de prueba',2,0),(7,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/311.jpg','Carmen','López','carmen@example.com','987654327','2023-07-22','Solicitud de información turística','Mensaje de prueba',5,0),(8,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/895.jpg','Juan','Díaz','juan@example.com','987654328','2023-08-30','Queja sobre restaurante','Mensaje de prueba',3,0),(9,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/27.jpg','Elena','Pérez','elena@example.com','987654329','2023-09-14','Consulta sobre servicios adicionales','Mensaje de prueba',4,0),(10,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/757.jpg','Manuel','García','manuel@example.com','987654330','2023-10-05','Solicitud de reserva','Mensaje de prueba',5,0),(11,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1003.jpg','Isabel','Martínez','isabel@example.com','987654331','2023-11-12','Queja sobre limpieza','Mensaje de prueba',2,0),(12,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/832.jpg','David','Sánchez','david@example.com','987654332','2023-12-25','Consulta sobre tarifas','Mensaje de prueba',4,0),(13,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/352.jpg','Laura','Gómez','laura2@example.com','987654333','2024-01-10','Solicitud de información','Mensaje de prueba',5,0),(14,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/432.jpg','Miguel','Martínez','miguel@example.com','987654334','2024-02-18','Queja sobre ruido','Mensaje de prueba',3,0),(15,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/977.jpg','Eva','Rodríguez','eva@example.com','987654335','2024-03-20','Solicitud de reserva','Mensaje de prueba',4,0);
/*!40000 ALTER TABLE `polls_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_room`
--

DROP TABLE IF EXISTS `polls_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photos` json NOT NULL,
  `roomType` varchar(20) NOT NULL,
  `roomNumber` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `offer` varchar(3) NOT NULL,
  `priceNight` decimal(10,2) NOT NULL,
  `discount` int unsigned NOT NULL,
  `cancellation` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `polls_room_chk_1` CHECK ((`discount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_room`
--

LOCK TABLES `polls_room` WRITE;
/*!40000 ALTER TABLE `polls_room` DISABLE KEYS */;
INSERT INTO `polls_room` VALUES (54,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Single Bed','101','Habitación individual con cama individual','YES',85.50,15,'Política de cancelación flexible','Available'),(55,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Bed','201','Habitación con cama matrimonial','YES',120.00,20,'Política de cancelación moderada','Available'),(56,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Superior','301','Habitación doble con vistas panorámicas','NO',150.75,0,'Política de cancelación estricta','Available'),(57,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Suite','401','Suite de lujo con jacuzzi privado','YES',200.00,30,'Política de cancelación flexible','Available'),(58,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Single Bed','102','Habitación individual con vistas al mar','YES',95.00,10,'Política de cancelación moderada','Available'),(59,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Bed','202','Habitación con cama matrimonial y balcón','NO',130.25,0,'Política de cancelación flexible','Available'),(60,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Superior','302','Habitación doble con terraza privada','YES',175.00,25,'Política de cancelación moderada','Available'),(61,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Suite','402','Suite de lujo con vistas a la montaña','YES',180.50,20,'Política de cancelación flexible','Available'),(62,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Single Bed','103','Habitación individual con escritorio de trabajo','NO',70.75,0,'Política de cancelación estricta','Available'),(63,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Dg\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Bed','203','Habitación con cama matrimonial y vista al jardín','YES',110.00,15,'Política de cancelación flexible','Available'),(64,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Superior','303','Habitación doble con zona de estar','YES',160.25,10,'Política de cancelación moderada','Available'),(65,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Suite','403','Suite de lujo con terraza privada y piscina','NO',195.00,0,'Política de cancelación flexible','Available'),(66,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Single Bed','104','Habitación individual con vista a la ciudad','YES',80.00,5,'Política de cancelación moderada','Available'),(67,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Bed','204','Habitación con cama matrimonial y bañera de hidromasaje','NO',140.75,0,'Política de cancelación flexible','Available'),(68,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Superior','304','Habitación doble con acceso directo a la piscina','YES',185.00,20,'Política de cancelación moderada','Available');
/*!40000 ALTER TABLE `polls_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_user`
--

DROP TABLE IF EXISTS `polls_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photo` varchar(200) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `job` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `startDate` date NOT NULL,
  `descriptionJob` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `polls_user_phone_974a1e02_uniq` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_user`
--

LOCK TABLES `polls_user` WRITE;
/*!40000 ALTER TABLE `polls_user` DISABLE KEYS */;
INSERT INTO `polls_user` VALUES (1,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/774.jpg','Jennifer Zayas Alva','Room Service','jennifer_zayas@yahoo.com','997265920','2023-01-05','Room Service','INACTIVE','Password1!'),(2,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1020.jpg','Matilde Espino Barrientos','Manager','matilde.espino78@gmail.com','904621125','2023-11-09','Manager','INACTIVE','Password2!'),(3,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/596.jpg','Roser Vallejo Perea','Room Service','roser.vallejo57@hotmail.com','939087794','2023-10-30','Room Service','INACTIVE','Password3!'),(4,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/900.jpg','Pablo Llamas Montenegro','Manager','pablo_llamas56@yahoo.com','949454169','2023-06-30','Manager','ACTIVE','Password4!'),(5,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/269.jpg','Maica Leiva Sarabia','Manager','maica47@hotmail.com','942817737','2023-12-20','Manager','ACTIVE','Password5!'),(6,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/354.jpg','Jennifer Alejandro Madrid','Room Service','jennifer.alejandro@hotmail.com','920154527','2023-01-24','Room Service','INACTIVE','Password6!'),(7,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/311.jpg','Sra. Ana Jurado Saavedra','Manager','sra.ana82@yahoo.com','921802439','2023-07-05','Manager','ACTIVE','Password7!'),(8,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/895.jpg','Roser Balderas Aguirre','Receptionist','roser58@yahoo.com','978540971','2023-04-22','Receptionist','INACTIVE','Password8!'),(9,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/27.jpg','Maica Olivas Galindo','Manager','maica55@gmail.com','935625157','2023-10-05','Manager','INACTIVE','Password9!'),(10,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/757.jpg','Jennifer Contreras Sanabria','Receptionist','jennifer78@hotmail.com','945708842','2023-04-05','Receptionist','ACTIVE','Password10!'),(11,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1003.jpg','Maica Vega Galván','Manager','maica93@yahoo.com','973868478','2023-07-19','Manager','INACTIVE','Password11!'),(12,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/832.jpg','Salvador Madera Canales','Manager','salvador.madera71@yahoo.com','974577481','2023-09-19','Manager','ACTIVE','Password12!'),(13,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/352.jpg','Pablo Almanza Valdivia','Room Service','pablo_almanza@hotmail.com','965019878','2023-05-15','Room Service','ACTIVE','Password13!'),(14,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/432.jpg','Jorge Navarrete Robles','Receptionist','jorge_navarrete@hotmail.com','927955680','2023-12-30','Receptionist','INACTIVE','Password14!'),(15,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/977.jpg','Lorena Medrano Delatorre','Receptionist','lorena.medrano0@gmail.com','974383743','2023-12-09','Receptionist','ACTIVE','Password15!');
/*!40000 ALTER TABLE `polls_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photos` json NOT NULL,
  `roomType` tinytext NOT NULL,
  `roomNumber` tinytext NOT NULL,
  `description` mediumtext NOT NULL,
  `offer` varchar(10) NOT NULL,
  `priceNight` float NOT NULL,
  `discount` int DEFAULT NULL,
  `cancellation` tinytext NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (5,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=8959555882975232\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=5743649769914368\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=8740501763129344\"]','Double Bed','delinquo-358','Utrum et contego. Tot aperiam nulla cattus.','NO',250,NULL,'Catena in adduco vero strenuus tergiversatio volubilis. Accendo minima suffoco approbo aestas eos patria pecco.','Available'),(6,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=5441948603121664\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=5944478156193792\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=1594460634873856\"]','Double Bed','earum-360','Tam ab minus. A vis spero volup.','YES',166,40,'Subiungo videlicet accedo. Sufficio deserunt aliquid arbitro denique antea taedium.','Available'),(7,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=8010559284838400\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=1347507919519744\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=8478472519286784\"]','Double Superior','agnosco-98','Abbas defessus dicta atrocitas damno cornu solum considero. Clementia defendo ceno voluptatibus.','NO',224,NULL,'Ipsam delectatio corrigo vir ab demum. Confugo acervus pecus.','Available'),(8,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=8578892354813952\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=3605480530247680\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=1850350663368704\"]','Double Bed','coniecto-61','Thema thymbra strenuus vomer cometes. Appositus peccatus harum nam ea consuasor depromo valde.','NO',90,NULL,'Tabernus cohaero curriculum comitatus aqua. Amissio vulgus aufero confero peccatus ultio ducimus rem deinde creta.','Available'),(9,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=3079600903028736\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=1921456755703808\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=6595211257970688\"]','Double Superior','repellendus-477','Comis asperiores curo. Suffragium aetas clibanus absconditus thesis fugiat studio supra cribro.','NO',236,NULL,'Infit aiunt demum calcar testimonium attonbitus cupio. Eveniet cernuus pauci vociferor ago quam cognomen vomito.','Available'),(10,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=4345704300412928\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=1812490174332928\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=6019125700722688\"]','Double Bed','depono-39','Celo tribuo thesis caelestis perferendis sortitus succedo aestivus speculum. Vomica totidem sufficio textor taedium color defero spiritus.','YES',119,46,'Valetudo venia desino antiquus teres patruus dolores capillus tamdiu currus. Alius combibo patria verumtamen tantum.','Available'),(11,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=5144159589498880\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=775979412750336\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=2828832386056192\"]','Double Superior','conicio-188','Crepusculum curvo sonitus vestigium numquam admoneo amita. Accusamus volutabrum tracto vaco derelinquo.','NO',240,NULL,'Candidus beneficium ut ventosus artificiose tero. Denique tener defero suasoria caritas curtus brevis deludo arguo eos.','Available'),(12,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=8577118820630528\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=3556777631154176\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=7109050135216128\"]','Double Bed','antea-359','Tabella acer aperiam non curso aequitas taceo coma vaco altus. Depraedor conforto absque vergo autus tubineus.','NO',228,0,'Delinquo acerbitas demens taceo aliquam calcar cultellus. Hic aufero aperiam.','Available'),(13,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=5193343503958016\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=163870486298624\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=2018161150918656\"]','Suite','accusantium-343','Claustrum impedit patruus cohibeo curis corona incidunt deprecator. Commodo verto attero truculenter vere.','NO',200,NULL,'Trepide tondeo tabella depereo. Aeneus patruus canonicus commodi ancilla cornu auxilium decretum.','Available'),(14,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=5306432580747264\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=4722523021246464\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=589790070177792\"]','Suite','aiunt-200','Vilis tergum arbustum eum atque in depraedor cursus temptatio. Comptus bos tricesimus sapiente depulso.','NO',76,NULL,'Tam abbas vilicus agnitio verecundia cohors amplitudo. Volva aro certus.','Available'),(15,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=5499144191868928\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=6528023218094080\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=2511793698111488\"]','Double Superior','cerno-217','Adipiscor facere coepi despecto damnatio coaegresco autus sortitus stultus. Usitas alveus illum adficio non campana.','NO',289,NULL,'Creptio quisquam cunctatio subnecto defaeco depono. Unus agnosco coerceo facilis angustus cavus odit depromo cometes sperno.','Available'),(16,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=980452273815552\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=6652727081828352\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=576292349018112\"]','Double Superior','voluntarius-409','Tondeo cenaculum valetudo cubitum templum amitto pectus derideo. Carpo denique velit versus dedecor depulso pecto accusantium.','YES',223,10,'Valde molestiae iure alias tenuis stipes excepturi deserunt decens adhaero. Benigne laboriosam caterva cumque necessitatibus aptus civis.','Available'),(17,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=6675675960311808\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=2627937180319744\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=1812858316783616\"]','Double Superior','absum-29','Dolorem officia tabesco solutio atrox cenaculum. Anser adfectus damno ventus vinco subnecto.','NO',297,NULL,'Dicta appono undique deprecator eum. Debitis decipio truculenter temperantia adulescens beatus.','Available'),(18,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=2746225327603712\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=3217489137762304\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=7038184544272384\"]','Double Bed','supellex-11','Adiuvo utrum thymum videlicet surgo temptatio urbs. Tumultus tabernus totidem carbo concedo depulso adinventitias canonicus damno barba.','YES',50,34,'Totidem aequitas patrocinor thalassinus ait angulus taceo utique excepturi. Strues illum traho vilicus ab tergeo.','Available'),(19,'[\"https://loremflickr.com/640/480/hotel,bedroom?lock=8260024564449280\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=3045993002041344\", \"https://loremflickr.com/640/480/hotel,bedroom?lock=6093368815779840\"]','Double Bed','administratio-460','Attonbitus ea carbo molestias cilicium. Cupiditas aequitas comprehendo atrox.','YES',89,38,'Corrupti amiculum tripudio coadunatio compono versus asper. Aperio modi succurro adiuvo volo volo compono antepono.','Available'),(52,'[\"3\", \"3\", \"3\"]','Suite','3','3','NO',100,0,'3','Available'),(53,'[\"d\", \"d\", \"d\"]','Suite','3','3','NO',3,0,'3','Available'),(54,'[\"D\", \"D\", \"D\"]','Suite','2','3','NO',3,0,'3','Available');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photo` longtext NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `job` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `startDate` date NOT NULL,
  `descriptionJob` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/774.jpg','Jennifer Zayas Alva','Room Service','jennifer_zayas@yahoo.com','997265920','2023-01-05','Room Service','INACTIVE','yiviliqakonozog'),(2,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1020.jpg','Matilde Espino Barrientos','Manager','matilde.espino78@gmail.com','904621125','2023-11-09','Manager','INACTIVE','feyajatevecijuk'),(3,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/596.jpg','Roser Vallejo Perea','Room Service','roser.vallejo57@hotmail.com','939087794','2023-10-30','Room Service','INACTIVE','socevohuqiqanaq'),(4,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/900.jpg','Pablo Llamas Montenegro','Manager','pablo_llamas56@yahoo.com','949454169','2023-06-30','Manager','ACTIVE','farobafojacezun'),(5,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/269.jpg','Maica Leiva Sarabia','Manager','maica47@hotmail.com','942817737','2023-12-20','Manager','ACTIVE','zazoqusubenijiv'),(6,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/354.jpg','Jennifer Alejandro Madrid','Room Service','jennifer.alejandro@hotmail.com','920154527','2023-01-24','Room Service','INACTIVE','hifazejoduhigir'),(7,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/311.jpg','Sra. Ana Jurado Saavedra','Manager','sra.ana82@yahoo.com','921802439','2023-07-05','Manager','ACTIVE','latebiximohaheg'),(8,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/895.jpg','Roser Balderas Aguirre','Recepcionist','roser58@yahoo.com','978540971','2023-04-22','Recepcionist','INACTIVE','kaxuvolepehosuf'),(9,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/27.jpg','Maica Olivas Galindo','Manager','maica55@gmail.com','935625157','2023-10-05','Manager','INACTIVE','zokiniwekipaguk'),(10,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/757.jpg','Jennifer Contreras Sanabria','Recepcionist','jennifer78@hotmail.com','945708842','2023-04-05','Recepcionist','ACTIVE','datapukijucakes'),(11,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1003.jpg','Maica Vega Galván','Manager','maica93@yahoo.com','973868478','2023-07-19','Manager','INACTIVE','rohezifusucikuk'),(12,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/832.jpg','Salvador Madera Canales','Manager','salvador.madera71@yahoo.com','974577481','2023-09-19','Manager','ACTIVE','pupusitasitoric'),(13,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/352.jpg','Pablo Almanza Valdivia','Room Service','pablo_almanza@hotmail.com','965019878','2023-05-15','Room Service','ACTIVE','pamizafapunoxiw'),(14,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/432.jpg','Jorge Navarrete Robles','Recepcionist','jorge_navarrete@hotmail.com','927955680','2023-12-30','Recepcionist','INACTIVE','rotumarowobazes'),(15,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/977.jpg','Lorena Medrano Delatorre','Recepcionist','lorena.medrano0@gmail.com','974383743','2023-12-09','Recepcionist','ACTIVE','raleyetewifadib'),(16,'D','D','Manager','d','d','2024-03-01','d','ACTIVE','S');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_amenity`
--

DROP TABLE IF EXISTS `website_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_amenity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_amenity`
--

LOCK TABLES `website_amenity` WRITE;
/*!40000 ALTER TABLE `website_amenity` DISABLE KEYS */;
INSERT INTO `website_amenity` VALUES (353,'Wi-Fi'),(354,'TV de pantalla plana'),(355,'Minibar'),(356,'Caja fuerte'),(357,'Aire acondicionado'),(358,'Desayuno incluido'),(359,'Artículos de aseo gratuitos'),(360,'Secador de pelo'),(361,'Plancha y tabla de planchar'),(362,'Servicio de habitaciones'),(363,'Piscina'),(364,'Gimnasio'),(365,'Estacionamiento gratuito'),(366,'Recepción 24 horas'),(367,'Servicio de lavandería'),(368,'Spa'),(369,'Restaurante'),(370,'Bar o lounge'),(371,'Terraza'),(372,'Servicio de traslado al aeropuerto'),(373,'Jacuzzi'),(374,'Vista al mar'),(375,'Balcón privado'),(376,'Terraza panorámica'),(377,'Área de estar con sofá'),(378,'Cama extra grande'),(379,'Acceso al club ejecutivo'),(380,'Zona de comedor'),(381,'Baño privado'),(382,'Cafetera y tetera'),(383,'Escritorio de trabajo'),(384,'Vista al jardín'),(385,'Zona de estar'),(386,'Terraza privada'),(387,'Piscina privada'),(388,'Vista a la ciudad'),(389,'Baño de hidromasaje'),(390,'Acceso directo a la piscina'),(391,'Cocina completa'),(392,'Chimenea'),(393,'Sala de estar separada'),(394,'Cocina americana'),(395,'Sauna'),(396,'Bañera de hidromasaje'),(397,'Hamaca'),(398,'Ducha de lluvia'),(399,'Amplio balcón'),(400,'Zona de parrilla'),(401,'Servicio de limpieza diario'),(402,'Cama queen size'),(403,'Bañera'),(404,'Estación de trabajo'),(405,'Servicio de despertador'),(406,'Cocina equipada'),(407,'Microondas'),(408,'Nevera'),(409,'Lavavajillas'),(410,'Utensilios de cocina'),(411,'Vista a la montaña'),(412,'Sala de cine privada'),(413,'Mesa de billar'),(414,'Terraza con barbacoa'),(415,'Consola de videojuegos'),(416,'Sistema de sonido envolvente'),(417,'Sala de reuniones'),(418,'Servicio de conserjería'),(419,'Bicicletas gratuitas'),(420,'Caja fuerte con enchufe para laptop'),(421,'Baño turco'),(422,'Habitación insonorizada'),(423,'Menú de almohadas'),(424,'Desayuno en la habitación'),(425,'Lavadora y secadora'),(426,'Wi-Fi'),(427,'TV de pantalla plana'),(428,'Minibar'),(429,'Caja fuerte'),(430,'Aire acondicionado'),(431,'Desayuno incluido'),(432,'Artículos de aseo gratuitos'),(433,'Secador de pelo'),(434,'Plancha y tabla de planchar'),(435,'Servicio de habitaciones'),(436,'Piscina'),(437,'Gimnasio'),(438,'Estacionamiento gratuito'),(439,'Recepción 24 horas'),(440,'Servicio de lavandería'),(441,'Spa'),(442,'Restaurante'),(443,'Bar o lounge'),(444,'Terraza'),(445,'Servicio de traslado al aeropuerto'),(446,'Jacuzzi'),(447,'Vista al mar'),(448,'Balcón privado'),(449,'Terraza panorámica'),(450,'Área de estar con sofá'),(451,'Cama extra grande'),(452,'Acceso al club ejecutivo'),(453,'Zona de comedor'),(454,'Baño privado'),(455,'Cafetera y tetera'),(456,'Escritorio de trabajo'),(457,'Vista al jardín'),(458,'Zona de estar'),(459,'Terraza privada'),(460,'Piscina privada'),(461,'Vista a la ciudad'),(462,'Baño de hidromasaje'),(463,'Acceso directo a la piscina'),(464,'Cocina completa'),(465,'Chimenea'),(466,'Sala de estar separada'),(467,'Cocina americana'),(468,'Sauna'),(469,'Bañera de hidromasaje'),(470,'Hamaca'),(471,'Ducha de lluvia'),(472,'Amplio balcón'),(473,'Zona de parrilla'),(474,'Servicio de limpieza diario'),(475,'Cama queen size'),(476,'Bañera'),(477,'Estación de trabajo'),(478,'Servicio de despertador'),(479,'Cocina equipada'),(480,'Microondas'),(481,'Nevera'),(482,'Lavavajillas'),(483,'Utensilios de cocina'),(484,'Vista a la montaña'),(485,'Sala de cine privada'),(486,'Mesa de billar'),(487,'Terraza con barbacoa'),(488,'Consola de videojuegos'),(489,'Sistema de sonido envolvente'),(490,'Sala de reuniones'),(491,'Servicio de conserjería'),(492,'Bicicletas gratuitas'),(493,'Caja fuerte con enchufe para laptop'),(494,'Baño turco'),(495,'Habitación insonorizada'),(496,'Menú de almohadas'),(497,'Desayuno en la habitación'),(498,'Lavadora y secadora');
/*!40000 ALTER TABLE `website_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_booking`
--

DROP TABLE IF EXISTS `website_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `orderDate` date NOT NULL,
  `check_in` date NOT NULL,
  `hour_in` time(6) NOT NULL,
  `check_out` date NOT NULL,
  `hour_out` time(6) NOT NULL,
  `room_id` int NOT NULL,
  `specialRequest` longtext,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_booking_room_id_2ed3043f_fk_website_room_id` (`room_id`),
  CONSTRAINT `website_booking_room_id_2ed3043f_fk_website_room_id` FOREIGN KEY (`room_id`) REFERENCES `website_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_booking`
--

LOCK TABLES `website_booking` WRITE;
/*!40000 ALTER TABLE `website_booking` DISABLE KEYS */;
INSERT INTO `website_booking` VALUES (65,'Juan Pérez','diego@diegomompo.com','633841603','2024-02-06','2024-03-06','15:00:00.000000','2024-03-09','11:00:00.000000',58,'Necesita cama adicional','Check In'),(66,'María López','diego@diegomompo.com','633841603','2024-02-07','2024-03-10','14:30:00.000000','2024-03-15','10:30:00.000000',58,'null','Check In'),(67,'Roberto Sánchez','diego@diegomompo.com','633841603','2024-02-08','2024-03-05','16:45:00.000000','2024-03-08','12:00:00.000000',65,NULL,'Check In'),(68,'Ana Martínez','diego@diegomompo.com','633841603','2024-02-09','2024-03-12','13:00:00.000000','2024-03-17','09:00:00.000000',67,'Preferencia por una habitación tranquila','Check In'),(69,'Pedro García','diego@diegomompo.com','633841603','2024-02-10','2024-03-08','17:30:00.000000','2024-03-11','10:30:00.000000',62,NULL,'Check In'),(70,'Laura Rodríguez','diego@diegomompo.com','633841603','2024-02-11','2024-03-15','12:00:00.000000','2024-03-20','11:00:00.000000',54,'Pet friendly','Check In'),(71,'Carlos Gómez','diego@diegomompo.com','633841603','2024-02-12','2024-03-17','14:00:00.000000','2024-03-22','09:30:00.000000',56,NULL,'Check In'),(72,'Sofía Fernández','diego@diegomompo.com','633841603','2024-02-13','2024-03-09','15:45:00.000000','2024-03-14','12:30:00.000000',61,'Necesita habitación con vista a la montaña','Check In'),(73,'Daniel Ruiz','diego@diegomompo.com','633841603','2024-02-14','2024-03-06','18:00:00.000000','2024-03-09','10:00:00.000000',63,NULL,'Check In'),(74,'Elena Serrano','diego@diegomompo.com','633841603','2024-02-15','2024-03-11','11:30:00.000000','2024-03-16','10:30:00.000000',64,'Requiere cuna para bebé','Check In'),(75,'Javier Hernández','diego@diegomompo.com','633841603','2024-02-16','2024-03-18','16:15:00.000000','2024-03-23','11:30:00.000000',66,NULL,'Check In'),(76,'Andrea Díaz','diego@diegomompo.com','633841603','2024-02-17','2024-03-20','13:45:00.000000','2024-03-25','12:00:00.000000',68,'Pet friendly','Check In'),(77,'David Muñoz','diego@diegomompo.com','633841603','2024-02-18','2024-03-05','19:00:00.000000','2024-03-08','09:00:00.000000',55,NULL,'Check In'),(78,'Paula Castro','diego@diegomompo.com','633841603','2024-02-19','2024-03-14','10:00:00.000000','2024-03-19','11:00:00.000000',57,NULL,'Check In'),(79,'Mario Bravo','diego@diegomompo.com','633841603','2024-02-20','2024-03-08','14:30:00.000000','2024-03-11','10:00:00.000000',59,'Necesita habitación con terraza','Check In');
/*!40000 ALTER TABLE `website_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_contact`
--

DROP TABLE IF EXISTS `website_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `date` date NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `is_archived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_contact`
--

LOCK TABLES `website_contact` WRITE;
/*!40000 ALTER TABLE `website_contact` DISABLE KEYS */;
INSERT INTO `website_contact` VALUES (1,'Ana González','ana@example.com','987654321','2023-01-05','Consulta sobre reserva','Mensaje de prueba',0),(2,'Luis Martínez','luis@example.com','987654322','2023-02-15','Solicitud de información','Mensaje de prueba',0),(3,'María Sánchez','maria@example.com','987654323','2023-03-20','Queja sobre servicio','Mensaje de prueba',0),(4,'Carlos Gómez','carlos@example.com','987654324','2023-04-10','Consulta sobre eventos','Mensaje de prueba',0),(5,'Laura Fernández','laura@example.com','987654325','2023-05-03','Solicitud de reserva','Mensaje de prueba',0),(6,'Pedro Rodríguez','pedro@example.com','987654326','2023-06-17','Queja sobre instalaciones','Mensaje de prueba',0),(7,'Carmen López','carmen@example.com','987654327','2023-07-22','Solicitud de información turística','Mensaje de prueba',0),(8,'Juan Díaz','juan@example.com','987654328','2023-08-30','Queja sobre restaurante','Mensaje de prueba',0),(9,'Elena Pérez','elena@example.com','987654329','2023-09-14','Consulta sobre servicios adicionales','Mensaje de prueba',0),(10,'Manuel García','manuel@example.com','987654330','2023-10-05','Solicitud de reserva','Mensaje de prueba',0),(11,'Isabel Martínez','isabel@example.com','987654331','2023-11-12','Queja sobre limpieza','Mensaje de prueba',0),(12,'David Sánchez','david@example.com','987654332','2023-12-25','Consulta sobre tarifas','Mensaje de prueba',0),(13,'Laura Gómez','laura2@example.com','987654333','2024-01-10','Solicitud de información','Mensaje de prueba',0),(14,'Miguel Martínez','miguel@example.com','987654334','2024-02-18','Queja sobre ruido','Mensaje de prueba',0),(15,'Eva Rodríguez','eva@example.com','987654335','2024-03-20','Solicitud de reserva','Mensaje de prueba',0),(16,'F','f@f.com','633841603','2024-02-12','dd','dd',0),(17,'F','f@f.com','633841603','2024-02-12','dd','dd',0),(18,'F','f@f.com','633841603','2024-02-12','dd','dd',0),(19,'F','f@f.com','633841603','2024-02-12','dd','dd',0),(20,'dd','d@d.com','633841603','2024-02-12','d','d',0),(21,'dd','d@d.com','633841603','2024-02-12','d','d',0);
/*!40000 ALTER TABLE `website_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_order`
--

DROP TABLE IF EXISTS `website_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `description` longtext NOT NULL,
  `timestamps` datetime(6) NOT NULL,
  `room_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_order_room_id_b504a347_fk_website_room_id` (`room_id`),
  KEY `website_order_user_id_13a763ad_fk_auth_user_id` (`user_id`),
  CONSTRAINT `website_order_room_id_b504a347_fk_website_room_id` FOREIGN KEY (`room_id`) REFERENCES `website_room` (`id`),
  CONSTRAINT `website_order_user_id_13a763ad_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_order`
--

LOCK TABLES `website_order` WRITE;
/*!40000 ALTER TABLE `website_order` DISABLE KEYS */;
INSERT INTO `website_order` VALUES (3,'Food','ffffff4','2024-02-14 11:05:02.500297',54,4),(4,'Food','2222','2024-02-14 11:18:51.856511',58,4),(5,'Food','2223','2024-02-14 11:19:02.138551',62,4),(6,'Food','2224','2024-02-14 11:19:08.526353',66,4),(7,'Food','sss','2024-02-14 12:55:36.964161',60,4),(8,'Food','dddd','2024-02-14 12:55:44.187847',61,4);
/*!40000 ALTER TABLE `website_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_room`
--

DROP TABLE IF EXISTS `website_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photos` json NOT NULL,
  `roomType` varchar(20) NOT NULL,
  `roomNumber` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `offer` varchar(3) NOT NULL,
  `priceNight` int NOT NULL,
  `discount` int unsigned NOT NULL,
  `cancellation` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `website_room_chk_1` CHECK ((`discount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_room`
--

LOCK TABLES `website_room` WRITE;
/*!40000 ALTER TABLE `website_room` DISABLE KEYS */;
INSERT INTO `website_room` VALUES (54,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Single Bed','101','Habitación individual con cama individual','YES',86,15,'Política de cancelación flexible','Available'),(55,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Bed','201','Habitación con cama matrimonial','YES',120,20,'Política de cancelación moderada','Available'),(56,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Superior','301','Habitación doble con vistas panorámicas','NO',151,0,'Política de cancelación estricta','Available'),(57,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Suite','401','Suite de lujo con jacuzzi privado','YES',200,30,'Política de cancelación flexible','Available'),(58,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Single Bed','102','Habitación individual con vistas al mar','YES',95,10,'Política de cancelación moderada','Available'),(59,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Bed','202','Habitación con cama matrimonial y balcón','NO',130,0,'Política de cancelación flexible','Available'),(60,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Superior','302','Habitación doble con terraza privada','YES',175,25,'Política de cancelación moderada','Available'),(61,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Suite','402','Suite de lujo con vistas a la montaña','YES',181,20,'Política de cancelación flexible','Available'),(62,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Single Bed','103','Habitación individual con escritorio de trabajo','NO',71,0,'Política de cancelación estricta','Available'),(63,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Dg\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Bed','203','Habitación con cama matrimonial y vista al jardín','YES',110,15,'Política de cancelación flexible','Available'),(64,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Superior','303','Habitación doble con zona de estar','YES',160,10,'Política de cancelación moderada','Available'),(65,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Suite','403','Suite de lujo con terraza privada y piscina','NO',195,0,'Política de cancelación flexible','Available'),(66,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Single Bed','104','Habitación individual con vista a la ciudad','YES',80,5,'Política de cancelación moderada','Available'),(67,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Bed','204','Habitación con cama matrimonial y bañera de hidromasaje','NO',141,0,'Política de cancelación flexible','Available'),(68,'[\"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\", \"https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"]','Double Superior','304','Habitación doble con acceso directo a la piscina','YES',185,20,'Política de cancelación moderada','Available');
/*!40000 ALTER TABLE `website_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_room_amenities`
--

DROP TABLE IF EXISTS `website_room_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_room_amenities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `amenity_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_room_amenities_room_id_amenity_id_6bbb1ad8_uniq` (`room_id`,`amenity_id`),
  KEY `website_room_amenities_amenity_id_b1419f34_fk_website_amenity_id` (`amenity_id`),
  CONSTRAINT `website_room_amenities_amenity_id_b1419f34_fk_website_amenity_id` FOREIGN KEY (`amenity_id`) REFERENCES `website_amenity` (`id`),
  CONSTRAINT `website_room_amenities_room_id_b5a62642_fk_website_room_id` FOREIGN KEY (`room_id`) REFERENCES `website_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_room_amenities`
--

LOCK TABLES `website_room_amenities` WRITE;
/*!40000 ALTER TABLE `website_room_amenities` DISABLE KEYS */;
INSERT INTO `website_room_amenities` VALUES (1,54,359),(2,54,370),(3,54,386),(4,54,449),(5,54,460),(6,55,357),(7,55,367),(8,55,370),(9,55,380),(10,55,459),(11,56,361),(12,56,373),(13,56,389),(14,56,459),(15,56,466),(16,57,362),(17,57,373),(18,57,381),(19,57,449),(20,57,464),(21,58,361),(22,58,372),(23,58,388),(24,58,402),(25,58,458),(26,59,356),(27,59,360),(28,59,383),(29,59,402),(30,59,460),(31,60,361),(32,60,372),(33,60,398),(34,60,457),(35,60,462),(36,61,362),(37,61,380),(38,61,384),(39,61,453),(40,61,473),(41,62,356),(42,62,361),(43,62,363),(44,62,392),(45,62,400),(46,63,359),(47,63,372),(48,63,380),(49,63,384),(50,63,491),(51,64,358),(52,64,372),(53,64,381),(54,64,454),(55,64,464),(56,65,357),(57,65,366),(58,65,369),(59,65,383),(60,65,460),(61,66,359),(62,66,362),(63,66,366),(64,66,383),(65,66,464),(66,67,357),(67,67,367),(68,67,370),(69,67,380),(70,67,451),(71,68,362),(72,68,373),(73,68,380),(74,68,454),(75,68,468);
/*!40000 ALTER TABLE `website_room_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_user`
--

DROP TABLE IF EXISTS `website_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photo` varchar(200) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `job` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `startDate` date NOT NULL,
  `descriptionJob` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_user`
--

LOCK TABLES `website_user` WRITE;
/*!40000 ALTER TABLE `website_user` DISABLE KEYS */;
INSERT INTO `website_user` VALUES (1,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/774.jpg','Jennifer Zayas Alva','Room Service','jennifer_zayas@yahoo.com','997265920','2023-01-05','Room Service','INACTIVE','Password1!'),(2,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1020.jpg','Matilde Espino Barrientos','Manager','matilde.espino78@gmail.com','904621125','2023-11-09','Manager','INACTIVE','Password2!'),(3,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/596.jpg','Roser Vallejo Perea','Room Service','roser.vallejo57@hotmail.com','939087794','2023-10-30','Room Service','INACTIVE','Password3!'),(4,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/900.jpg','Pablo Llamas Montenegro','Manager','pablo_llamas56@yahoo.com','949454169','2023-06-30','Manager','ACTIVE','Password4!'),(5,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/269.jpg','Maica Leiva Sarabia','Manager','maica47@hotmail.com','942817737','2023-12-20','Manager','ACTIVE','Password5!'),(6,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/354.jpg','Jennifer Alejandro Madrid','Room Service','jennifer.alejandro@hotmail.com','920154527','2023-01-24','Room Service','INACTIVE','Password6!'),(7,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/311.jpg','Sra. Ana Jurado Saavedra','Manager','sra.ana82@yahoo.com','921802439','2023-07-05','Manager','ACTIVE','Password7!'),(8,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/895.jpg','Roser Balderas Aguirre','Receptionist','roser58@yahoo.com','978540971','2023-04-22','Receptionist','INACTIVE','Password8!'),(9,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/27.jpg','Maica Olivas Galindo','Manager','maica55@gmail.com','935625157','2023-10-05','Manager','INACTIVE','Password9!'),(10,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/757.jpg','Jennifer Contreras Sanabria','Receptionist','jennifer78@hotmail.com','945708842','2023-04-05','Receptionist','ACTIVE','Password10!'),(11,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1003.jpg','Maica Vega Galván','Manager','maica93@yahoo.com','973868478','2023-07-19','Manager','INACTIVE','Password11!'),(12,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/832.jpg','Salvador Madera Canales','Manager','salvador.madera71@yahoo.com','974577481','2023-09-19','Manager','ACTIVE','Password12!'),(13,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/352.jpg','Pablo Almanza Valdivia','Room Service','pablo_almanza@hotmail.com','965019878','2023-05-15','Room Service','ACTIVE','Password13!'),(14,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/432.jpg','Jorge Navarrete Robles','Receptionist','jorge_navarrete@hotmail.com','927955680','2023-12-30','Receptionist','INACTIVE','Password14!'),(15,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/977.jpg','Lorena Medrano Delatorre','Receptionist','lorena.medrano0@gmail.com','974383743','2023-12-09','Receptionist','ACTIVE','Password15!');
/*!40000 ALTER TABLE `website_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-14 14:15:01
