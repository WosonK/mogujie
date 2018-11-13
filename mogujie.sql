-- MySQL dump 10.13  Distrib 5.6.16, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mogujie
-- ------------------------------------------------------
-- Server version	5.6.16-1~exp1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add brand',7,'add_brand'),(20,'Can change brand',7,'change_brand'),(21,'Can delete brand',7,'delete_brand'),(22,'Can add goods',8,'add_goods'),(23,'Can change goods',8,'change_goods'),(24,'Can delete goods',8,'delete_goods'),(25,'Can add wheel',9,'add_wheel'),(26,'Can change wheel',9,'change_wheel'),(27,'Can delete wheel',9,'delete_wheel'),(28,'Can add users',10,'add_users'),(29,'Can change users',10,'change_users'),(30,'Can delete users',10,'delete_users'),(31,'Can add user',10,'add_user'),(32,'Can change user',10,'change_user'),(33,'Can delete user',10,'delete_user'),(34,'Can add cart',11,'add_cart'),(35,'Can change cart',11,'change_cart'),(36,'Can delete cart',11,'delete_cart'),(37,'Can add order',12,'add_order'),(38,'Can change order',12,'change_order'),(39,'Can delete order',12,'delete_order'),(40,'Can add order goods',13,'add_ordergoods'),(41,'Can change order goods',13,'change_ordergoods'),(42,'Can delete order goods',13,'delete_ordergoods');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$ua0mdj3HpCWy$fLxIaHG5GKJrsqxz5vc6ZM0cZQBDTNpuHZYwHsEsP08=','2018-11-02 12:28:48.954689',1,'admin','','','1@1.com',1,1,'2018-11-02 12:28:28.601140'),(2,'pbkdf2_sha256$36000$T7AUF7VXqSZX$qlJk/lpg0BE3B1Cmtp8lTVfH9Uvab0ImZXipvoE6Egs=','2018-11-12 02:17:59.897591',1,'woson','','','1@1.com',1,1,'2018-11-12 02:17:45.676281');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brandimg`
--

DROP TABLE IF EXISTS `brandimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brandimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `desciption` varchar(100) NOT NULL,
  `trackid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brandimg`
--

LOCK TABLES `brandimg` WRITE;
/*!40000 ALTER TABLE `brandimg` DISABLE KEYS */;
INSERT INTO `brandimg` VALUES (1,1,'brandimg/youxuan1.jpg','蘑菇优选','优质生活 值得更好',201),(2,2,'brandimg/youxuan2.jpg','品质精选','9月暖心好物推荐',202),(3,3,'brandimg/youxuan3.jpg','品质热卖','亲肤毛巾 超强吸水',203),(4,4,'brandimg/youxuan4.jpg','人气新款','进口卫生巾 柔软敏感',204),(5,5,'brandimg/youxuan5.jpg','皇室御用浴盐','None',205),(6,6,'brandimg/youxuan6.jpg','袜子精选','None',206),(7,7,'brandimg/youxuan7.jpg','日本内野制造','None',208),(8,8,'brandimg/youxuan8.jpg','进口日化','None',207);
/*!40000 ALTER TABLE `brandimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselected` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_goods_id_a0c55193_fk_goods_id` (`goods_id`),
  KEY `cart_user_id_1361a739_fk_user_id` (`user_id`),
  CONSTRAINT `cart_goods_id_a0c55193_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `cart_user_id_1361a739_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (6,1,1,1,6),(7,2,1,2,6),(8,3,1,3,6),(9,4,1,4,6),(10,5,1,5,6);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-11-02 12:29:13.587505','1','Wheel object',1,'[{\"added\": {}}]',9,1),(2,'2018-11-02 12:29:40.672683','2','Wheel object',1,'[{\"added\": {}}]',9,1),(3,'2018-11-02 12:29:56.704183','3','Wheel object',1,'[{\"added\": {}}]',9,1),(4,'2018-11-02 12:30:12.051188','4','Wheel object',1,'[{\"added\": {}}]',9,1),(5,'2018-11-02 12:30:26.991554','5','Wheel object',1,'[{\"added\": {}}]',9,1),(6,'2018-11-02 12:34:33.742355','1','Brand object',1,'[{\"added\": {}}]',7,1),(7,'2018-11-02 12:35:24.846285','2','Brand object',1,'[{\"added\": {}}]',7,1),(8,'2018-11-02 12:37:04.048694','3','Brand object',1,'[{\"added\": {}}]',7,1),(9,'2018-11-02 12:37:11.437380','3','Brand object',2,'[]',7,1),(10,'2018-11-02 12:37:59.110515','4','Brand object',1,'[{\"added\": {}}]',7,1),(11,'2018-11-02 12:38:06.173839','3','Brand object',2,'[{\"changed\": {\"fields\": [\"trackid\"]}}]',7,1),(12,'2018-11-02 12:38:15.238909','2','Brand object',2,'[]',7,1),(13,'2018-11-02 12:41:24.088293','5','皇室御用浴盐',1,'[{\"added\": {}}]',7,1),(14,'2018-11-02 12:41:55.883872','6','袜子精选',1,'[{\"added\": {}}]',7,1),(15,'2018-11-02 12:42:45.117363','7','进口日化',1,'[{\"added\": {}}]',7,1),(16,'2018-11-02 12:43:19.582737','6','袜子精选',2,'[{\"changed\": {\"fields\": [\"bid\", \"trackid\"]}}]',7,1),(17,'2018-11-02 12:43:49.320716','8','日本内野制造',1,'[{\"added\": {}}]',7,1),(18,'2018-11-02 12:44:18.841588','6','袜子精选',2,'[{\"changed\": {\"fields\": [\"bid\", \"trackid\"]}}]',7,1),(19,'2018-11-02 12:45:36.977343','6','袜子精选',2,'[{\"changed\": {\"fields\": [\"img\"]}}]',7,1),(20,'2018-11-02 12:47:05.756950','6','日本内野制造',2,'[{\"changed\": {\"fields\": [\"bid\", \"img\", \"title\", \"trackid\"]}}]',7,1),(21,'2018-11-02 12:47:30.552419','8','日本内野制造',2,'[{\"changed\": {\"fields\": [\"bid\", \"trackid\"]}}]',7,1),(22,'2018-11-02 12:48:00.291737','6','袜子精选',2,'[{\"changed\": {\"fields\": [\"bid\", \"img\", \"title\", \"trackid\"]}}]',7,1),(23,'2018-11-03 03:41:08.613865','1','Goods object',1,'[{\"added\": {}}]',8,1),(24,'2018-11-03 03:45:02.916022','2','By NanDan大地色眼影盒彩妆眼影盘眼影刷防水防晕染卧蝉笔',1,'[{\"added\": {}}]',8,1),(25,'2018-11-03 03:45:58.963697','3','韩版秋季新款职业百搭休闲黑色女单鞋浅口低帮鞋',1,'[{\"added\": {}}]',8,1),(26,'2018-11-03 03:46:54.179188','4','【买一送五】韩国爱丽小屋眉笔防水防汗不晕染不脱色一字眉带眉刷',1,'[{\"added\": {}}]',8,1),(27,'2018-11-03 03:48:58.326998','5','番茄派山羊奶滋润护手霜80g*2 清爽滋润保湿补水',1,'[{\"added\": {}}]',8,1),(28,'2018-11-03 03:50:08.131181','6','童装宝宝卫衣加绒加厚三件套男女童秋冬装0-1-3岁冬季套装',1,'[{\"added\": {}}]',8,1),(29,'2018-11-03 03:50:57.462736','7','雪纺防晒衫女长袖夏季中长款防晒衣雪纺开衫透明防晒服披肩薄外套',1,'[{\"added\": {}}]',8,1),(30,'2018-11-03 03:52:19.008324','8','【套装】新款时尚连帽卫衣显瘦金丝绒韩版休闲裤运动服两件套装',1,'[{\"added\": {}}]',8,1),(31,'2018-11-03 03:53:16.940129','9','秋季新款 复古文艺 棉麻宽松口袋长袖粉色衬衫女',1,'[{\"added\": {}}]',8,1),(32,'2018-11-03 03:54:10.960322','10','秋季短靴女2016新款春秋单靴粗跟马丁靴女英伦风裸靴女短筒',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'App','brand'),(11,'App','cart'),(8,'App','goods'),(12,'App','order'),(13,'App','ordergoods'),(10,'App','user'),(9,'App','wheel'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'App','0001_initial','2018-11-02 12:28:00.103636'),(2,'contenttypes','0001_initial','2018-11-02 12:28:00.626070'),(3,'auth','0001_initial','2018-11-02 12:28:03.107336'),(4,'admin','0001_initial','2018-11-02 12:28:03.928428'),(5,'admin','0002_logentry_remove_auto_add','2018-11-02 12:28:04.084500'),(6,'contenttypes','0002_remove_content_type_name','2018-11-02 12:28:04.722747'),(7,'auth','0002_alter_permission_name_max_length','2018-11-02 12:28:04.806706'),(8,'auth','0003_alter_user_email_max_length','2018-11-02 12:28:05.018629'),(9,'auth','0004_alter_user_username_opts','2018-11-02 12:28:05.052848'),(10,'auth','0005_alter_user_last_login_null','2018-11-02 12:28:05.411280'),(11,'auth','0006_require_contenttypes_0002','2018-11-02 12:28:05.430429'),(12,'auth','0007_alter_validators_add_error_messages','2018-11-02 12:28:05.463775'),(13,'auth','0008_alter_user_username_max_length','2018-11-02 12:28:05.827891'),(14,'sessions','0001_initial','2018-11-02 12:28:06.184793'),(15,'App','0002_auto_20181109_0142','2018-11-09 01:42:33.672844'),(16,'App','0003_auto_20181109_0144','2018-11-09 01:44:25.641429'),(17,'App','0004_remove_user_img','2018-11-09 02:41:26.909366'),(18,'App','0005_user_token','2018-11-09 11:35:36.327518'),(19,'App','0006_auto_20181109_1328','2018-11-09 13:28:11.794083'),(20,'App','0007_cart','2018-11-10 06:39:38.558211'),(21,'App','0008_order_ordergoods','2018-11-12 02:46:00.854103'),(22,'App','0009_auto_20181112_0310','2018-11-12 03:11:26.463435');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fcmcu0t768ptpl9ipnnqw4qmvl8c51sy','ODVjODAyZTg1NTBjMzIxOWE1N2U5NDBkMDFjNjZhOWE5NDE5ZTA0Yjp7InRva2VuIjoiZDE5NzI4YzctMTgyMS01ZmFiLTkxNGQtZDRhNzhkZjI2ZWE1In0=','2018-11-26 03:43:44.894096'),('skdk89r8650vagi319trqaaqpdyjuti6','OTE5ZWVkNDNjYzRhNmMzNDA5ZDkzMWIxMDY5MGJhMTY1NGU5YWFiNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNkMGU0ZmNkZTIzYjQ0YTgyODYzNzEwZjRmMzg2MGRmZmFlODllMWYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-11-16 12:28:48.971828');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `smallImg` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `oldprice` decimal(7,2) NOT NULL,
  `sales` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `bg` varchar(100) NOT NULL,
  `trackid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,1,'goodsimg/pic1.jpg','smallImg/pic1.jpg','2016韩版抓绒刺绣字母卡通图案学院风宽松加厚保暖卫衣新款女',49.70,59.70,31013,11,'bg/background01.jpg',701),(2,2,'goodsimg/pic2.jpg','smallImg/pic2.jpg','By NanDan大地色眼影盒彩妆眼影盘眼影刷防水防晕染卧蝉笔',16.80,29.70,19990,1321,'bg/background02.jpg',702),(3,3,'goodsimg/pic3.jpg','smallImg/pic3.jpg','韩版秋季新款职业百搭休闲黑色女单鞋浅口低帮鞋',29.90,39.70,29990,21,'bg/background03.jpg',703),(4,4,'goodsimg/pic4.jpg','smallImg/pic4.jpg','【买一送五】韩国爱丽小屋眉笔防水防汗不晕染不脱色一字眉带眉刷',19.90,29.70,27990,301,'bg/background04.jpg',704),(5,5,'goodsimg/pic5.jpg','smallImg/pic5.jpg','番茄派山羊奶滋润护手霜80g*2 清爽滋润保湿补水',9.90,19.70,97990,3021,'bg/background05.jpg',705),(6,6,'goodsimg/pic6.jpg','smallImg/pic6.jpg','童装宝宝卫衣加绒加厚三件套男女童秋冬装0-1-3岁冬季套装',49.90,59.70,7990,55,'bg/background06.jpg',706),(7,7,'goodsimg/pic7.jpg','smallImg/pic7.jpg','雪纺防晒衫女长袖夏季中长款防晒衣雪纺开衫透明防晒服披肩薄外套',49.90,69.70,17990,32,'bg/background07.jpg',707),(8,8,'goodsimg/pic8.jpg','smallImg/pic8.jpg','【套装】新款时尚连帽卫衣显瘦金丝绒韩版休闲裤运动服两件套装',77.00,89.00,109031,31,'bg/background08.jpg',708),(9,9,'goodsimg/pic9.jpg','smallImg/pic9.jpg','秋季新款 复古文艺 棉麻宽松口袋长袖粉色衬衫女',55.00,59.70,1090,189,'bg/background09.jpg',709),(10,10,'goodsimg/pic10.jpg','smallImg/pic10.jpg','秋季短靴女2016新款春秋单靴粗跟马丁靴女英伦风裸靴女短筒',69.30,79.70,1090,3021,'bg/background10.jpg',710);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_user_id_e323497c_fk_user_id` (`user_id`),
  CONSTRAINT `order_user_id_e323497c_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (3,'2018-11-12 02:49:33.869931',1,'154199097329509',7),(4,'2018-11-12 02:49:33.877399',1,'154199097336708',7),(5,'2018-11-12 02:59:32.675471',1,'154199157227016',7),(6,'2018-11-12 03:00:03.600368',1,'154199160360788',7),(7,'2018-11-12 03:00:03.646920',1,'154199160362389',7),(8,'2018-11-12 03:04:00.718368',1,'154199184060849',7),(9,'2018-11-12 03:04:00.842753',1,'154199184073792',7),(10,'2018-11-12 03:06:26.761003',1,'154199198639288',7),(11,'2018-11-12 03:06:26.850133',1,'154199198666627',7),(12,'2018-11-12 03:06:32.155589',1,'154199199224495',7),(13,'2018-11-12 03:06:32.294286',1,'154199199279846',7),(14,'2018-11-12 03:11:53.805128',1,'154199231353450',7),(15,'2018-11-12 03:11:53.957756',1,'154199231377931',7),(16,'2018-11-12 03:15:56.532404',1,'154199255659548',7),(18,'2018-11-12 03:30:13.322701',1,'154199341310728',7),(19,'2018-11-12 03:30:13.489411',1,'154199341393722',7),(20,'2018-11-12 03:30:59.951754',1,'154199345976377',7),(21,'2018-11-12 03:32:55.902897',1,'154199357579791',7),(22,'2018-11-12 03:33:17.420350',1,'154199359735950',7),(23,'2018-11-12 03:35:15.838130',1,'154199371586092',7),(24,'2018-11-12 03:36:11.692958',1,'154199377185076',7),(25,'2018-11-12 03:37:28.683100',1,'154199384843495',7),(26,'2018-11-12 03:39:04.772647',1,'154199394433113',7),(27,'2018-11-12 03:39:22.995450',1,'154199396257418',7),(28,'2018-11-12 03:39:23.290690',1,'154199396385137',7),(29,'2018-11-12 03:41:47.516793',1,'154199410786257',7),(30,'2018-11-12 03:44:01.697292',1,'154199424184885',10),(31,'2018-11-12 03:44:02.062690',1,'154199424220664',10),(32,'2018-11-12 03:44:58.256238',1,'154199429896986',10),(33,'2018-11-12 03:46:48.567030',1,'154199440883006',10),(34,'2018-11-12 03:47:41.268238',1,'154199446141174',10),(35,'2018-11-12 03:48:17.259624',1,'154199449771066',10),(36,'2018-11-12 03:53:07.417419',1,'154199478771513',10),(37,'2018-11-12 04:42:01.305446',1,'154199772187911',10),(38,'2018-11-12 06:10:28.850232',1,'154200302890818',10),(39,'2018-11-12 06:18:48.812735',1,'154200352874167',10);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordergoods`
--

DROP TABLE IF EXISTS `ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `App_ordergoods_goods_id_870997c9_fk_goods_id` (`goods_id`),
  KEY `App_ordergoods_order_id_1d9efb59_fk_order_id` (`order_id`),
  CONSTRAINT `App_ordergoods_goods_id_870997c9_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `App_ordergoods_order_id_1d9efb59_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordergoods`
--

LOCK TABLES `ordergoods` WRITE;
/*!40000 ALTER TABLE `ordergoods` DISABLE KEYS */;
INSERT INTO `ordergoods` VALUES (1,1,6,3),(2,1,6,4),(3,2,7,3),(4,2,7,4),(5,3,8,3),(6,3,8,4),(7,4,9,4),(8,4,9,3),(9,5,10,4),(10,5,10,3),(11,5,1,3),(12,5,1,4),(13,10,2,3),(14,10,2,4),(15,1,7,5),(16,1,7,8),(17,1,7,14),(18,5,3,16),(19,5,3,23),(20,1,4,29),(21,7,8,30),(22,6,4,33),(23,200,4,34),(24,4,6,35),(25,6,1,35),(26,1,2,36),(27,1,2,37),(28,2,4,38),(29,4,5,38),(30,4,3,39);
/*!40000 ALTER TABLE `ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `password` varchar(80) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `token` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tel` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'1a','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','1@1.com','13412341234','103dbf27-f1bb-580d-a4b3-6c0e919fd61f'),(5,'Bob123','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','1@12.com','13443211234','f32c424a-8787-5d72-a9db-f377b50902d0'),(6,'L2','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','222@2222.com','15858588585','97e5e318-2a57-5a87-b91f-07c8daf3cb6f'),(7,'4w','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','1@123.com','13435678910','afd5092c-fc84-5724-b897-7aaefe3e6db3'),(10,'65','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','222@22222222.com','13412341236','cbd59509-ed94-542b-97b4-0aca581231f6');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wheelimg`
--

DROP TABLE IF EXISTS `wheelimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wheelimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `trackid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wheelimg`
--

LOCK TABLES `wheelimg` WRITE;
/*!40000 ALTER TABLE `wheelimg` DISABLE KEYS */;
INSERT INTO `wheelimg` VALUES (1,'lbimg/lb1.jpg','轮播1',101),(2,'lbimg/lb2.jpg','轮播2',102),(3,'lbimg/lb3.jpg','轮播3',103),(4,'lbimg/lb4.jpg','轮播4',104),(5,'lbimg/lb5.jpg','轮播5',105);
/*!40000 ALTER TABLE `wheelimg` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-13 19:28:16
