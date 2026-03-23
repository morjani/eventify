-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: eventify
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `crm_attachements`
--

DROP TABLE IF EXISTS `crm_attachements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_attachements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_attachements`
--

LOCK TABLES `crm_attachements` WRITE;
/*!40000 ALTER TABLE `crm_attachements` DISABLE KEYS */;
INSERT INTO `crm_attachements` VALUES (5,NULL,3,'customers','Untitled-1.png','file','png','/uploads/customers/Untitled-1.png','0','2023-07-26 21:32:42','2023-07-26 21:32:42'),(6,NULL,1,'users','avatar-1.jpg','file','jpg','/uploads/users/avatar-1.jpg','0','2023-08-13 15:52:54','2023-08-13 15:52:54'),(7,NULL,2,'site_metas','WhatsApp Image 2024-03-04 à 23.23.02_0854aa1b.jpg','file','jpg','/uploads/site_metas/WhatsApp Image 2024-03-04 à 23.23.02_0854aa1b.jpg','0','2023-08-14 22:30:16','2023-08-14 22:30:16'),(8,NULL,1,'site_metas','logo.png','file','png','/uploads/site_metas/logo.png','0','2023-08-14 22:34:20','2023-08-14 22:34:20'),(9,NULL,3,'users','unnamed.png','file','png','/uploads/users/unnamed.png','0','2023-08-18 08:55:59','2023-08-18 08:55:59'),(10,NULL,4,'users','téléchargement.png','file','png','/uploads/users/téléchargement.png','0','2023-08-18 09:00:51','2023-08-18 09:00:51');
/*!40000 ALTER TABLE `crm_attachements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_bill_details`
--

DROP TABLE IF EXISTS `crm_bill_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_bill_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `with_tva` tinyint(1) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_bill_details`
--

LOCK TABLES `crm_bill_details` WRITE;
/*!40000 ALTER TABLE `crm_bill_details` DISABLE KEYS */;
INSERT INTO `crm_bill_details` VALUES (1,1,1,200.00,2,400.00,0,'CHIC AIRPORT TRANSFERS',1,1,'2023-07-30 21:27:55','2023-07-30 21:27:55'),(2,1,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,1,'2023-07-30 21:27:55','2023-07-30 21:27:55'),(3,2,3,200.00,2,400.00,0,'test',1,0,'2023-07-30 23:16:11','2023-07-30 23:16:11'),(4,3,1,200.00,2,400.00,1,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-01 07:55:20','2023-08-01 07:55:20'),(5,3,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2023-08-01 07:55:20','2023-08-01 07:55:20'),(6,3,1,200.00,2,400.00,1,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-01 08:14:51','2023-08-01 08:14:51'),(7,3,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2023-08-01 08:14:52','2023-08-01 08:14:52'),(8,3,1,200.00,4,800.00,1,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-01 10:00:43','2023-08-01 10:00:43'),(9,3,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2023-08-01 10:00:43','2023-08-01 10:00:43'),(10,1,1,200.00,2,400.00,0,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-01 10:01:50','2023-08-01 10:01:50'),(11,1,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,1,'2023-08-01 10:01:50','2023-08-01 10:01:50'),(12,1,3,200.00,1,200.00,0,'test',1,1,'2023-08-01 10:01:50','2023-08-01 10:01:50'),(13,1,1,200.00,2,400.00,0,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-01 10:17:43','2023-08-01 10:17:43'),(14,1,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,1,'2023-08-01 10:17:43','2023-08-01 10:17:43'),(15,1,3,200.00,1,200.00,0,'test',1,1,'2023-08-01 10:17:43','2023-08-01 10:17:43'),(16,1,1,200.00,2,400.00,0,'CHIC AIRPORT TRANSFERS',1,0,'2023-08-01 10:38:51','2023-08-01 10:38:51'),(17,1,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,0,'2023-08-01 10:38:51','2023-08-01 10:38:51'),(18,1,3,200.00,1,200.00,0,'test',1,0,'2023-08-01 10:38:51','2023-08-01 10:38:51'),(19,1,4,3000.00,1,3000.00,0,'test',1,0,'2023-08-01 10:38:51','2023-08-01 10:38:51'),(20,5,1,200.00,4,800.00,0,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-01 14:05:07','2023-08-01 14:05:07'),(21,5,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,1,'2023-08-01 14:05:07','2023-08-01 14:05:07'),(22,6,3,200.00,2,400.00,0,'test',1,1,'2023-08-01 14:06:52','2023-08-01 14:06:52'),(23,3,1,200.00,4,800.00,1,'CHIC AIRPORT TRANSFERS',1,0,'2023-08-01 19:23:46','2023-08-01 19:23:46'),(24,3,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,0,'2023-08-01 19:23:46','2023-08-01 19:23:46'),(25,6,3,200.00,2,400.00,0,'test',1,1,'2023-08-01 19:24:17','2023-08-01 19:24:17'),(26,5,1,200.00,4,800.00,0,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-01 19:27:38','2023-08-16 10:12:49'),(27,5,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,1,'2023-08-01 19:27:38','2023-08-16 10:12:49'),(28,6,3,200.00,2,400.00,0,'test',1,0,'2023-08-01 19:27:55','2023-08-01 19:27:55'),(29,5,1,200.00,4,800.00,0,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-16 10:12:49','2023-08-16 10:37:14'),(30,5,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,1,'2023-08-16 10:12:49','2023-08-16 10:37:14'),(31,5,1,200.00,4,800.00,0,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-16 10:37:15','2023-08-16 10:38:22'),(32,5,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,1,'2023-08-16 10:37:15','2023-08-16 10:38:22'),(33,5,1,200.00,4,800.00,0,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-16 10:38:22','2023-08-16 10:41:11'),(34,5,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,1,'2023-08-16 10:38:22','2023-08-16 10:41:11'),(35,5,1,200.00,4,800.00,0,'CHIC AIRPORT TRANSFERS',1,1,'2023-08-16 10:41:11','2023-08-19 12:24:01'),(36,5,2,300.00,3,900.00,0,'DESIGN & SHOPPING TOUR',1,1,'2023-08-16 10:41:11','2023-08-19 12:24:01'),(37,7,3,200.00,2,400.00,0,'test',1,0,'2023-08-16 10:43:16','2023-08-16 10:43:16'),(38,5,1,200.00,4,800.00,0,'CHIC AIRPORT',1,1,'2023-08-19 12:24:01','2023-09-03 13:44:28'),(39,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2023-08-19 12:24:01','2023-09-03 13:44:28'),(40,5,1,200.00,5,1000.00,0,'CHIC AIRPORT',1,1,'2023-09-03 13:44:28','2023-09-03 21:55:12'),(41,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2023-09-03 13:44:28','2023-09-03 21:55:12'),(42,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2023-09-03 21:55:12','2023-09-03 22:00:01'),(43,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2023-09-03 22:00:01','2023-09-04 08:33:31'),(44,5,3,200.00,2,400.00,0,'test test',1,1,'2023-09-03 22:00:01','2023-09-04 08:33:31'),(45,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2023-09-04 08:33:31','2023-09-04 08:50:32'),(46,5,3,200.00,2,400.00,0,'test test',1,1,'2023-09-04 08:33:31','2023-09-04 08:50:32'),(47,5,4,3000.00,4,12000.00,0,'test',1,1,'2023-09-04 08:33:31','2023-09-04 08:50:32'),(48,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2023-09-04 08:50:32','2023-09-08 20:33:49'),(49,5,3,200.00,2,400.00,1,'test test',1,1,'2023-09-04 08:50:32','2023-09-08 20:33:49'),(50,5,4,3000.00,4,12000.00,0,'test',1,1,'2023-09-04 08:50:32','2023-09-08 20:33:49'),(51,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2023-09-08 20:33:49','2024-02-09 19:53:49'),(52,5,3,200.00,2,400.00,1,'test test',1,1,'2023-09-08 20:33:49','2024-02-09 19:53:49'),(53,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-02-09 19:53:49','2024-02-09 19:55:20'),(54,5,3,200.00,2,400.00,1,'test test',1,1,'2024-02-09 19:53:49','2024-02-09 19:55:20'),(55,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-02-09 19:55:20','2024-02-09 19:59:05'),(56,5,3,200.00,2,400.00,1,'test test',1,1,'2024-02-09 19:55:21','2024-02-09 19:59:05'),(57,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-02-09 19:59:05','2024-02-09 20:02:45'),(58,5,3,200.00,2,400.00,1,'test test',1,1,'2024-02-09 19:59:05','2024-02-09 20:02:45'),(59,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-02-09 20:02:45','2024-02-09 20:02:54'),(60,5,3,200.00,2,400.00,1,'test test',1,1,'2024-02-09 20:02:45','2024-02-09 20:02:54'),(61,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-02-09 20:02:54','2024-02-09 20:10:10'),(62,5,3,200.00,2,400.00,1,'test test',1,1,'2024-02-09 20:02:54','2024-02-09 20:10:10'),(63,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-02-09 20:10:10','2024-02-10 10:07:01'),(64,5,3,200.00,2,400.00,1,'test test',1,1,'2024-02-09 20:10:10','2024-02-10 10:07:01'),(65,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-02-10 10:07:01','2024-02-10 10:10:31'),(66,5,3,200.00,2,400.00,1,'test test',1,1,'2024-02-10 10:07:01','2024-02-10 10:10:31'),(67,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-02-10 10:10:31','2024-02-12 20:35:59'),(68,5,3,200.00,2,400.00,1,'test test',1,1,'2024-02-10 10:10:31','2024-02-12 20:35:59'),(69,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-02-12 20:35:59','2024-05-14 09:36:32'),(70,5,3,200.00,2,400.00,1,'test test',1,1,'2024-02-12 20:35:59','2024-05-14 09:36:32'),(71,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-05-14 09:36:32','2024-05-14 10:17:07'),(72,5,3,200.00,2,400.00,1,'test test',1,1,'2024-05-14 09:36:32','2024-05-14 10:17:07'),(73,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-05-14 10:17:07','2024-05-14 12:07:12'),(74,5,3,200.00,2,400.00,1,'test test',1,1,'2024-05-14 10:17:07','2024-05-14 12:07:12'),(75,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-05-14 12:07:12','2024-05-14 12:07:35'),(76,5,3,200.00,2,400.00,1,'test test',1,1,'2024-05-14 12:07:12','2024-05-14 12:07:35'),(77,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,1,'2024-05-14 12:07:35','2024-05-14 12:09:26'),(78,5,3,200.00,2,400.00,1,'test test',1,1,'2024-05-14 12:07:35','2024-05-14 12:09:26'),(79,5,2,300.00,3,900.00,1,'DESIGN & SHOPPING TOUR',1,0,'2024-05-14 12:09:26','2024-05-14 12:09:26'),(80,5,3,200.00,2,400.00,1,'test test',1,0,'2024-05-14 12:09:26','2024-05-14 12:09:26');
/*!40000 ALTER TABLE `crm_bill_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_bills`
--

DROP TABLE IF EXISTS `crm_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_bills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int NOT NULL DEFAULT '0',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_ht` decimal(11,2) DEFAULT NULL,
  `discount` decimal(11,2) DEFAULT NULL,
  `total_ht_net` decimal(11,2) DEFAULT NULL,
  `total_ttc` decimal(11,2) DEFAULT NULL,
  `tva` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `classified_date` timestamp NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `additional_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `customer_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `proforma_id` int NOT NULL DEFAULT '0',
  `bill_id` int NOT NULL DEFAULT '0',
  `signature_id` int DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_bills`
--

LOCK TABLES `crm_bills` WRITE;
/*!40000 ALTER TABLE `crm_bills` DISABLE KEYS */;
INSERT INTO `crm_bills` VALUES (1,'0000004','#4',1,'carte',4500.00,NULL,NULL,5400.00,NULL,'2023-07-17 23:00:00',NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,'2023-07-30 21:27:55','2023-07-30 21:27:55'),(2,'0000002','#2',2,'virement',200.00,NULL,NULL,200.00,NULL,'2023-07-17 23:00:00',NULL,'2024-03-10 11:50:08',NULL,NULL,NULL,1,2,0,6,NULL,0,'2023-07-30 23:16:11','2024-03-10 11:50:08'),(3,'0000004','#4',1,'carte',1700.00,NULL,NULL,2040.00,NULL,'2023-07-19 23:00:00',NULL,NULL,'testtttt',NULL,NULL,1,1,0,5,NULL,0,'2023-08-01 07:55:20','2023-08-05 16:25:11'),(5,'0000004','#4',1,'carte',1300.00,20.00,1040.00,1248.00,NULL,'2023-07-31 23:00:00','2023-08-30 23:00:00',NULL,NULL,'The parseFloat() method parses a value as a string and returns the first number. Notes. If the first character cannot be converted',NULL,1,1,3,0,3,0,'2023-08-01 14:05:07','2024-05-14 12:09:26'),(6,'0000006','#6',1,'virement',400.00,NULL,NULL,480.00,NULL,'2023-07-31 23:00:00',NULL,NULL,NULL,NULL,NULL,1,2,2,0,NULL,0,'2023-08-01 14:06:52','2024-03-10 11:38:02'),(7,'0000007','#7',2,'virement',400.00,NULL,NULL,480.00,NULL,'2023-08-21 23:00:00','2023-08-29 23:00:00',NULL,NULL,NULL,NULL,1,8,0,0,NULL,0,'2023-08-16 10:43:16','2024-03-10 11:37:27'),(8,'0000007','#7',1,'virement',400.00,NULL,NULL,480.00,NULL,'2023-08-21 23:00:00','2023-08-29 23:00:00',NULL,NULL,NULL,NULL,1,8,0,0,NULL,0,'2023-08-16 10:43:16','2023-08-16 10:43:16'),(9,'0000007','#7',1,'virement',400.00,NULL,NULL,480.00,NULL,'2023-08-21 23:00:00','2023-08-29 23:00:00',NULL,NULL,NULL,NULL,1,8,0,0,NULL,0,'2023-08-16 10:43:16','2023-08-16 10:43:16'),(10,'0000007','#7',1,'virement',400.00,NULL,NULL,480.00,NULL,'2023-08-21 23:00:00','2023-08-29 23:00:00',NULL,NULL,NULL,NULL,1,8,0,0,NULL,0,'2023-08-16 10:43:16','2023-08-16 10:43:16'),(11,'0000007','#7',1,'virement',400.00,NULL,NULL,480.00,NULL,'2023-08-21 23:00:00','2023-08-29 23:00:00',NULL,NULL,NULL,NULL,1,8,0,0,NULL,0,'2023-08-16 10:43:16','2023-08-16 10:43:16'),(12,'0000007','#7',1,'virement',400.00,NULL,NULL,480.00,NULL,'2023-08-21 23:00:00','2023-08-29 23:00:00',NULL,NULL,NULL,NULL,1,8,0,0,NULL,0,'2023-08-16 10:43:16','2024-03-10 11:29:35');
/*!40000 ALTER TABLE `crm_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_categories`
--

DROP TABLE IF EXISTS `crm_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_categories`
--

LOCK TABLES `crm_categories` WRITE;
/*!40000 ALTER TABLE `crm_categories` DISABLE KEYS */;
INSERT INTO `crm_categories` VALUES (1,'GO HEALTHY','GO HEALTHY',0,'2023-07-24 12:12:05','2023-07-24 12:12:10',NULL),(2,'FOOD EXPERIENCE','FOOD EXPERIENCE',0,'2023-07-24 10:48:55','2023-07-24 10:48:55',NULL),(3,'CELEBRATIONS','CELEBRATIONS',0,'2023-07-24 10:49:36','2023-07-24 10:49:36',NULL),(6,'GO WITH KIDS','GO WITH KIDS',0,'2023-07-24 14:03:23','2023-07-24 14:03:23',1),(7,'GO HEALTHY2','GO HEALTHY2',1,'2023-07-24 14:03:36','2023-07-24 14:03:36',NULL),(8,'FEZ, GO CHIC','FEZ, GO CHIC',0,'2023-07-24 15:04:18','2023-07-24 15:04:18',1);
/*!40000 ALTER TABLE `crm_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_cities`
--

DROP TABLE IF EXISTS `crm_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `deleted` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_cities`
--

LOCK TABLES `crm_cities` WRITE;
/*!40000 ALTER TABLE `crm_cities` DISABLE KEYS */;
INSERT INTO `crm_cities` VALUES (1,'Aïn Harrouda',0),(2,'Ben Yakhlef',0),(3,'Bouskoura',0),(4,'Casablanca',0),(5,'Médiouna',0),(6,'Mohammadia',0),(7,'Tit Mellil',0),(8,'Ben Yakhlef',0),(9,'Bejaâd',0),(10,'Ben Ahmed',0),(11,'Benslimane',0),(12,'Berrechid',0),(13,'Boujniba',0),(14,'Boulanouare',0),(15,'Bouznika',0),(16,'Deroua',0),(17,'El Borouj',0),(18,'El Gara',0),(19,'Guisser',0),(20,'Hattane',0),(21,'Khouribga',0),(22,'Loulad',0),(23,'Oued Zem',0),(24,'Oulad Abbou',0),(25,'Oulad H\'Riz Sahel',0),(26,'Oulad M\'rah',0),(27,'Oulad Saïd',0),(28,'Oulad Sidi Ben Daoud',0),(29,'Ras El Aïn',0),(30,'Settat',0),(31,'Sidi Rahhal Chataï',0),(32,'Soualem',0),(33,'Azemmour',0),(34,'Bir Jdid',0),(35,'Bouguedra',0),(36,'Echemmaia',0),(37,'El Jadida',0),(38,'Hrara',0),(39,'Ighoud',0),(40,'Jamâat Shaim',0),(41,'Jorf Lasfar',0),(42,'Khemis Zemamra',0),(43,'Laaounate',0),(44,'Moulay Abdallah',0),(45,'Oualidia',0),(46,'Oulad Amrane',0),(47,'Oulad Frej',0),(48,'Oulad Ghadbane',0),(49,'Safi',0),(50,'Sebt El Maârif',0),(51,'Sebt Gzoula',0),(52,'Sidi Ahmed',0),(53,'Sidi Ali Ban Hamdouche',0),(54,'Sidi Bennour',0),(55,'Sidi Bouzid',0),(56,'Sidi Smaïl',0),(57,'Youssoufia',0),(58,'Fès',0),(59,'Aïn Cheggag',0),(60,'Bhalil',0),(61,'Boulemane',0),(62,'El Menzel',0),(63,'Guigou',0),(64,'Imouzzer Kandar',0),(65,'Imouzzer Marmoucha',0),(66,'Missour',0),(67,'Moulay Yaâcoub',0),(68,'Ouled Tayeb',0),(69,'Outat El Haj',0),(70,'Ribate El Kheir',0),(71,'Séfrou',0),(72,'Skhinate',0),(73,'Tafajight',0),(74,'Arbaoua',0),(75,'Aïn Dorij',0),(76,'Dar Gueddari',0),(77,'Had Kourt',0),(78,'Jorf El Melha',0),(79,'Kénitra',0),(80,'Khenichet',0),(81,'Lalla Mimouna',0),(82,'Mechra Bel Ksiri',0),(83,'Mehdia',0),(84,'Moulay Bousselham',0),(85,'Sidi Allal Tazi',0),(86,'Sidi Kacem',0),(87,'Sidi Slimane',0),(88,'Sidi Taibi',0),(89,'Sidi Yahya El Gharb',0),(90,'Souk El Arbaa',0),(91,'Akka',0),(92,'Assa',0),(93,'Bouizakarne',0),(94,'El Ouatia',0),(95,'Es-Semara',0),(96,'Fam El Hisn',0),(97,'Foum Zguid',0),(98,'Guelmim',0),(99,'Taghjijt',0),(100,'Tan-Tan',0),(101,'Tata',0),(102,'Zag',0),(103,'Marrakech',0),(104,'Ait Daoud',0),(115,'Amizmiz',0),(116,'Assahrij',0),(117,'Aït Ourir',0),(118,'Ben Guerir',0),(119,'Chichaoua',0),(120,'El Hanchane',0),(121,'El Kelaâ des Sraghna',0),(122,'Essaouira',0),(123,'Fraïta',0),(124,'Ghmate',0),(125,'Ighounane',0),(126,'Imintanoute',0),(127,'Kattara',0),(128,'Lalla Takerkoust',0),(129,'Loudaya',0),(130,'Lâattaouia',0),(131,'Moulay Brahim',0),(132,'Mzouda',0),(133,'Ounagha',0),(134,'Sid L\'Mokhtar',0),(135,'Sid Zouin',0),(136,'Sidi Abdallah Ghiat',0),(137,'Sidi Bou Othmane',0),(138,'Sidi Rahhal',0),(139,'Skhour Rehamna',0),(140,'Smimou',0),(141,'Tafetachte',0),(142,'Tahannaout',0),(143,'Talmest',0),(144,'Tamallalt',0),(145,'Tamanar',0),(146,'Tamansourt',0),(147,'Tameslouht',0),(148,'Tanalt',0),(149,'Zeubelemok',0),(150,'Meknès‎',0),(151,'Khénifra',0),(152,'Agourai',0),(153,'Ain Taoujdate',0),(154,'MyAliCherif',0),(155,'Rissani',0),(156,'Amalou Ighriben',0),(157,'Aoufous',0),(158,'Arfoud',0),(159,'Azrou',0),(160,'Aïn Jemaa',0),(161,'Aïn Karma',0),(162,'Aïn Leuh',0),(163,'Aït Boubidmane',0),(164,'Aït Ishaq',0),(165,'Boudnib',0),(166,'Boufakrane',0),(167,'Boumia',0),(168,'El Hajeb',0),(169,'Elkbab',0),(170,'Er-Rich',0),(171,'Errachidia',0),(172,'Gardmit',0),(173,'Goulmima',0),(174,'Gourrama',0),(175,'Had Bouhssoussen',0),(176,'Haj Kaddour',0),(177,'Ifrane',0),(178,'Itzer',0),(179,'Jorf',0),(180,'Kehf Nsour',0),(181,'Kerrouchen',0),(182,'M\'haya',0),(183,'M\'rirt',0),(184,'Midelt',0),(185,'Moulay Ali Cherif',0),(186,'Moulay Bouazza',0),(187,'Moulay Idriss Zerhoun',0),(188,'Moussaoua',0),(189,'N\'Zalat Bni Amar',0),(190,'Ouaoumana',0),(191,'Oued Ifrane',0),(192,'Sabaa Aiyoun',0),(193,'Sebt Jahjouh',0),(194,'Sidi Addi',0),(195,'Tichoute',0),(196,'Tighassaline',0),(197,'Tighza',0),(198,'Timahdite',0),(199,'Tinejdad',0),(200,'Tizguite',0),(201,'Toulal',0),(202,'Tounfite',0),(203,'Zaouia d\'Ifrane',0),(204,'Zaïda',0),(205,'Ahfir',0),(206,'Aklim',0),(207,'Al Aroui',0),(208,'Aïn Bni Mathar',0),(209,'Aïn Erreggada',0),(210,'Ben Taïeb',0),(211,'Berkane',0),(212,'Bni Ansar',0),(213,'Bni Chiker',0),(214,'Bni Drar',0),(215,'Bni Tadjite',0),(216,'Bouanane',0),(217,'Bouarfa',0),(218,'Bouhdila',0),(219,'Dar El Kebdani',0),(220,'Debdou',0),(221,'Douar Kannine',0),(222,'Driouch',0),(223,'El Aïoun Sidi Mellouk',0),(224,'Farkhana',0),(225,'Figuig',0),(226,'Ihddaden',0),(227,'Jaâdar',0),(228,'Jerada',0),(229,'Kariat Arekmane',0),(230,'Kassita',0),(231,'Kerouna',0),(232,'Laâtamna',0),(233,'Madagh',0),(234,'Midar',0),(235,'Nador',0),(236,'Naima',0),(237,'Oued Heimer',0),(238,'Oujda',0),(239,'Ras El Ma',0),(240,'Saïdia',0),(241,'Selouane',0),(242,'Sidi Boubker',0),(243,'Sidi Slimane Echcharaa',0),(244,'Talsint',0),(245,'Taourirt',0),(246,'Tendrara',0),(247,'Tiztoutine',0),(248,'Touima',0),(249,'Touissit',0),(250,'Zaïo',0),(251,'Zeghanghane',0),(252,'Rabat',0),(253,'Salé',0),(254,'Ain El Aouda',0),(255,'Harhoura',0),(256,'Khémisset',0),(257,'Oulmès',0),(258,'Rommani',0),(259,'Sidi Allal El Bahraoui',0),(260,'Sidi Bouknadel',0),(261,'Skhirate',0),(262,'Tamesna',0),(263,'Témara',0),(264,'Tiddas',0),(265,'Tiflet',0),(266,'Touarga',0),(267,'Agadir',0),(268,'Agdz',0),(269,'Agni Izimmer',0),(270,'Aït Melloul',0),(271,'Alnif',0),(272,'Anzi',0),(273,'Aoulouz',0),(274,'Aourir',0),(275,'Arazane',0),(276,'Aït Baha',0),(277,'Aït Iaâza',0),(278,'Aït Yalla',0),(279,'Ben Sergao',0),(280,'Biougra',0),(281,'Boumalne-Dadès',0),(282,'Dcheira El Jihadia',0),(283,'Drargua',0),(284,'El Guerdane',0),(285,'Harte Lyamine',0),(286,'Ida Ougnidif',0),(287,'Ifri',0),(288,'Igdamen',0),(289,'Ighil n\'Oumgoun',0),(290,'Imassine',0),(291,'Inezgane',0),(292,'Irherm',0),(293,'Kelaat-M\'Gouna',0),(294,'Lakhsas',0),(295,'Lakhsass',0),(296,'Lqliâa',0),(297,'M\'semrir',0),(298,'Massa (Maroc)',0),(299,'Megousse',0),(300,'Ouarzazate',0),(301,'Oulad Berhil',0),(302,'Oulad Teïma',0),(303,'Sarghine',0),(304,'Sidi Ifni',0),(305,'Skoura',0),(306,'Tabounte',0),(307,'Tafraout',0),(308,'Taghzout',0),(309,'Tagzen',0),(310,'Taliouine',0),(311,'Tamegroute',0),(312,'Tamraght',0),(313,'Tanoumrite Nkob Zagora',0),(314,'Taourirt ait zaghar',0),(315,'Taroudannt',0),(316,'Temsia',0),(317,'Tifnit',0),(318,'Tisgdal',0),(319,'Tiznit',0),(320,'Toundoute',0),(321,'Zagora',0),(322,'Afourar',0),(323,'Aghbala',0),(324,'Azilal',0),(325,'Aït Majden',0),(326,'Beni Ayat',0),(327,'Béni Mellal',0),(328,'Bin elouidane',0),(329,'Bradia',0),(330,'Bzou',0),(331,'Dar Oulad Zidouh',0),(332,'Demnate',0),(333,'Dra\'a',0),(334,'El Ksiba',0),(335,'Foum Jamaa',0),(336,'Fquih Ben Salah',0),(337,'Kasba Tadla',0),(338,'Ouaouizeght',0),(339,'Oulad Ayad',0),(340,'Oulad M\'Barek',0),(341,'Oulad Yaich',0),(342,'Sidi Jaber',0),(343,'Souk Sebt Oulad Nemma',0),(344,'Zaouïat Cheikh',0),(345,'Tanger‎',0),(346,'Tétouan‎',0),(347,'Akchour',0),(348,'Assilah',0),(349,'Bab Berred',0),(350,'Bab Taza',0),(351,'Brikcha',0),(352,'Chefchaouen',0),(353,'Dar Bni Karrich',0),(354,'Dar Chaoui',0),(355,'Fnideq',0),(356,'Gueznaia',0),(357,'Jebha',0),(358,'Karia',0),(359,'Khémis Sahel',0),(360,'Ksar El Kébir',0),(361,'Larache',0),(362,'M\'diq',0),(363,'Martil',0),(364,'Moqrisset',0),(365,'Oued Laou',0),(366,'Oued Rmel',0),(367,'Ouazzane',0),(368,'Point Cires',0),(369,'Sidi Lyamani',0),(370,'Sidi Mohamed ben Abdallah el-Raisuni',0),(371,'Zinat',0),(372,'Ajdir‎',0),(373,'Aknoul‎',0),(374,'Al Hoceïma‎',0),(375,'Aït Hichem‎',0),(376,'Bni Bouayach‎',0),(377,'Bni Hadifa‎',0),(378,'Ghafsai‎',0),(379,'Guercif‎',0),(380,'Imzouren‎',0),(381,'Inahnahen‎',0),(382,'Issaguen (Ketama)‎',0),(383,'Karia (El Jadida)‎',0),(384,'Karia Ba Mohamed‎',0),(385,'Oued Amlil‎',0),(386,'Oulad Zbair‎',0),(387,'Tahla‎',0),(388,'Tala Tazegwaght‎',0),(389,'Tamassint‎',0),(390,'Taounate‎',0),(391,'Targuist‎',0),(392,'Taza‎',0),(393,'Taïnaste‎',0),(394,'Thar Es-Souk‎',0),(395,'Tissa‎',0),(396,'Tizi Ouasli‎',0),(397,'Laayoune‎',0),(398,'El Marsa‎',0),(399,'Tarfaya‎',0),(400,'Boujdour‎',0),(401,'Awsard',0),(402,'Oued-Eddahab',0),(403,'Stehat',0),(404,'Aït Attab',0);
/*!40000 ALTER TABLE `crm_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_countries`
--

DROP TABLE IF EXISTS `crm_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_countries`
--

LOCK TABLES `crm_countries` WRITE;
/*!40000 ALTER TABLE `crm_countries` DISABLE KEYS */;
INSERT INTO `crm_countries` VALUES (1,'Maroc',0);
/*!40000 ALTER TABLE `crm_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_customers`
--

DROP TABLE IF EXISTS `crm_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ice` varbinary(255) DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `prospect` int DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_customers`
--

LOCK TABLES `crm_customers` WRITE;
/*!40000 ALTER TABLE `crm_customers` DISABLE KEYS */;
INSERT INTO `crm_customers` VALUES (1,1,'Client','client ahmed','0666666666',NULL,NULL,'client@client.com',1,1,'300000',_binary '2522','client',1,0,'2023-07-25 15:03:22','2024-05-14 12:09:26'),(2,1,'Client2','Client2','0666666666',NULL,NULL,'client@client.com',1,4,'300000',_binary '444444','fes',0,0,'2023-07-25 15:04:24','2023-08-05 16:14:00'),(3,1,'Client','Client3','0666666666',NULL,NULL,'client@client.com',1,4,'300000',_binary '252200','fes',0,0,'2023-07-25 22:14:52','2023-08-05 16:09:23'),(4,1,'tt','tt','0666666666',NULL,NULL,'tt@tt.com',1,58,'300000',_binary '2522','tt',0,0,'2023-08-15 19:37:17','2023-08-15 19:37:17'),(5,1,'ssskk','ss','0666666666',NULL,NULL,'tt@tt.com',1,58,'300000',_binary '44444444444','tt',0,0,'2023-08-15 19:39:08','2023-08-15 19:39:24'),(6,1,'client last','tt','0666666666',NULL,NULL,'tt@tt.com',1,3,'300000',_binary '7777777777777777777','tt',0,0,'2023-08-15 19:39:55','2023-08-15 19:39:55'),(7,1,'cc','tt','0666666666',NULL,NULL,'tt@tt.com',NULL,58,'300000',_binary '8888888888','tt',0,0,'2023-08-15 19:41:40','2023-08-15 19:41:40'),(8,1,'ddddddddd','tt','0666666666','070000000','080000000','tt@tt.com',1,58,'300000',_binary '44444444444444','tt',1,0,'2023-08-15 19:44:36','2023-08-18 10:02:54'),(9,1,'fffff','tt','0666666666',NULL,NULL,'tt@tt.com',1,58,'300000',_binary '4545','tt',NULL,0,'2023-08-15 21:10:10','2023-08-15 21:10:10'),(10,1,'fff','tt','0666666666',NULL,NULL,'tt@tt.com',1,58,'300000',_binary '789845','tt',1,0,'2023-08-15 21:12:39','2023-08-15 21:12:39'),(11,1,'khalid','khalid','0666666666',NULL,NULL,'tt@tt.com',1,3,'300000',_binary '42354','tt',1,0,'2023-08-15 21:14:02','2023-08-15 21:15:09'),(12,1,'fff','tt','0666666666',NULL,NULL,'tt@tt.com',1,72,'300000',_binary '123','tt',0,0,'2023-08-15 21:14:41','2023-08-15 21:14:56');
/*!40000 ALTER TABLE `crm_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_event_categories`
--

DROP TABLE IF EXISTS `crm_event_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_event_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_event_categories`
--

LOCK TABLES `crm_event_categories` WRITE;
/*!40000 ALTER TABLE `crm_event_categories` DISABLE KEYS */;
INSERT INTO `crm_event_categories` VALUES (1,'Evenement 1','bg-success',1,0,'2023-08-18 18:14:21','2023-08-18 17:37:06'),(2,'Evenement 2','bg-info',1,0,'2023-08-18 18:14:46','2023-08-18 18:14:50'),(3,'Evenement 3','bg-warning',1,0,'2023-08-18 18:14:46','2023-08-18 18:14:50'),(4,'Evenement 4','bg-danger',1,0,'2023-08-18 18:14:46','2023-08-18 18:14:50');
/*!40000 ALTER TABLE `crm_event_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_events`
--

DROP TABLE IF EXISTS `crm_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_events`
--

LOCK TABLES `crm_events` WRITE;
/*!40000 ALTER TABLE `crm_events` DISABLE KEYS */;
INSERT INTO `crm_events` VALUES (1,'event 3','','2023-08-12 23:00:00','2023-08-12 23:00:00','bg-warning',NULL,NULL,1,1,'2023-08-13 09:35:54','2023-08-13 09:49:20'),(2,'event 2','','2023-08-12 23:00:00','2023-08-12 23:00:00','bg-danger',NULL,NULL,1,0,'2023-08-13 09:36:45','2023-08-13 09:36:45'),(3,'event 5','','2023-08-16 23:00:00','2023-08-16 23:00:00','bg-info',NULL,NULL,1,0,'2023-08-13 09:49:43','2023-08-13 09:49:43'),(4,'ee','','2023-08-15 23:00:00','2023-08-15 23:00:00','bg-warning',NULL,NULL,1,0,'2023-08-13 09:58:24','2023-08-13 09:58:24'),(5,'eeeekkk','','2023-08-08 23:00:00','2023-08-08 23:00:00','bg-danger',NULL,NULL,1,0,'2023-08-13 09:58:43','2023-08-13 09:59:07'),(6,'event with date end','','2023-08-21 23:00:00','2023-08-21 23:00:00','bg-danger',NULL,NULL,1,1,'2023-08-15 09:06:30','2023-08-15 09:06:30'),(7,'event with date end','','2023-08-21 23:00:00','2023-08-23 23:00:00','bg-danger',NULL,NULL,1,1,'2023-08-15 09:07:39','2023-08-15 09:07:39'),(8,'event with date end','','2023-08-21 23:00:00','2023-08-23 23:00:00','bg-success',NULL,NULL,1,0,'2023-08-15 09:19:58','2023-08-15 09:19:58'),(9,'ttt','','2023-08-28 23:00:00','2023-08-30 23:00:00','bg-success',NULL,NULL,1,0,'2023-08-15 09:21:54','2023-08-15 09:21:54'),(10,'ttt','sssssss','2023-08-28 23:00:00','2023-08-30 23:00:00','bg-info',NULL,NULL,1,0,'2023-08-15 09:23:04','2023-08-15 09:23:04'),(11,'ttttttttt','','2023-08-21 23:00:00','2023-08-24 23:00:00','bg-info',NULL,NULL,1,0,'2023-08-15 09:23:53','2023-08-15 09:23:53'),(12,'event new','','2023-07-31 23:00:00','2023-08-02 23:00:00','bg-info',NULL,NULL,1,0,'2023-08-15 09:53:41','2023-08-15 09:53:41'),(13,'Activité','nnnnn','2023-08-30 23:00:00','2023-09-03 23:00:00','bg-info',NULL,NULL,1,0,'2023-08-16 10:12:49','2023-09-01 21:06:20'),(14,'event bill','testt','2023-08-30 23:00:00','2023-09-01 23:00:00','bg-info',NULL,NULL,1,0,'2023-08-16 10:37:14','2023-09-01 21:07:18'),(15,'event billllll','','2023-08-30 23:00:00','2023-08-31 23:00:00','bg-info','bill',5,1,0,'2023-08-16 10:38:22','2024-05-14 12:09:26'),(16,'event proforma','Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum','2023-08-17 23:00:00','2023-08-17 23:00:00','bg-info','bill',7,1,0,'2023-08-16 10:43:16','2023-08-16 10:43:16'),(17,'res','testt','2023-08-05 23:00:00','2023-08-13 23:00:00','bg-info',NULL,NULL,1,0,'2023-08-16 14:54:17','2023-08-16 16:26:32'),(18,'testt','test','2023-08-13 23:00:00','2023-08-14 23:00:00','bg-warning',NULL,NULL,1,0,'2023-08-16 15:56:52','2023-08-16 15:56:52'),(19,'lll','Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression','2023-09-05 23:00:00','2023-09-06 23:00:00','bg-warning',NULL,NULL,1,0,'2023-09-01 21:08:17','2023-09-01 21:08:17'),(20,'test','test','2023-09-12 23:00:00','2023-09-17 23:00:00','bg-info',NULL,NULL,1,0,'2023-09-11 14:26:55','2023-09-11 14:26:55'),(21,'testtest','test','2023-09-12 23:00:00','2023-09-18 23:00:00','bg-warning',NULL,NULL,1,0,'2023-09-11 14:28:18','2023-09-11 14:28:18'),(22,'enb','test','2023-09-19 23:00:00','2023-09-20 23:00:00','bg-success',NULL,NULL,1,0,'2023-09-11 14:28:45','2023-09-11 14:28:45');
/*!40000 ALTER TABLE `crm_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_failed_jobs`
--

DROP TABLE IF EXISTS `crm_failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crm_failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_failed_jobs`
--

LOCK TABLES `crm_failed_jobs` WRITE;
/*!40000 ALTER TABLE `crm_failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_migrations`
--

DROP TABLE IF EXISTS `crm_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_migrations`
--

LOCK TABLES `crm_migrations` WRITE;
/*!40000 ALTER TABLE `crm_migrations` DISABLE KEYS */;
INSERT INTO `crm_migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(7,'2023_07_23_080308_create_categories_table',1),(9,'2023_07_25_101929_add_column_user_id_to_categories_table',3),(10,'2023_07_25_102204_add_column_user_id_to_services_table',4),(11,'2023_07_25_100156_create_customers_table',5),(12,'2023_07_25_223127_create_attachements_table',6),(16,'2023_07_23_075911_create_services_table',9),(17,'2023_07_30_081004_create_bill_details_table',10),(18,'2023_07_27_100545_create_bills_table',11),(19,'2023_08_12_155916_create_events_table',12),(20,'2023_08_18_180306_create_event_categories_table',13),(21,'2024_02_06_202756_create_signatures_table',14);
/*!40000 ALTER TABLE `crm_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_password_reset_tokens`
--

DROP TABLE IF EXISTS `crm_password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_password_reset_tokens`
--

LOCK TABLES `crm_password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `crm_password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_personal_access_tokens`
--

DROP TABLE IF EXISTS `crm_personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crm_personal_access_tokens_token_unique` (`token`),
  KEY `crm_personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_personal_access_tokens`
--

LOCK TABLES `crm_personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `crm_personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_services`
--

DROP TABLE IF EXISTS `crm_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_services`
--

LOCK TABLES `crm_services` WRITE;
/*!40000 ALTER TABLE `crm_services` DISABLE KEYS */;
INSERT INTO `crm_services` VALUES (1,8,'CHIC AIRPORT TRANSFERS',300.00,'CHIC AIRPORT TRANSFERS',NULL,0,'2023-07-23 08:28:00','2023-07-24 15:46:42'),(2,8,'DESIGN & SHOPPING TOUR',500.00,'DESIGN & SHOPPING TOUR',NULL,0,'2023-07-24 14:45:24','2023-07-24 14:45:24'),(3,3,'BIRTHDAY OR ANNIVERSARY CELEBRATIONS',200.00,'BIRTHDAY OR ANNIVERSARY CELEBRATIONS',NULL,0,'2023-07-24 14:46:24','2023-07-24 14:46:24'),(4,2,'STREET FOOD TOUR',3000.00,'STREET FOOD TOURttt','1',0,'2023-07-24 15:05:29','2023-07-24 15:05:29');
/*!40000 ALTER TABLE `crm_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_signatures`
--

DROP TABLE IF EXISTS `crm_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_signatures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_signatures`
--

LOCK TABLES `crm_signatures` WRITE;
/*!40000 ALTER TABLE `crm_signatures` DISABLE KEYS */;
INSERT INTO `crm_signatures` VALUES (1,'Signature 3',NULL,1,0,'2024-02-06 20:28:59','2024-02-09 16:12:59'),(2,'Signature 2',NULL,1,1,'2024-02-06 20:30:58','2024-02-06 20:30:58'),(3,'Signature 1','/uploads/signatures/cacher-removebg-preview.png',1,0,'2024-02-09 16:13:12','2024-02-10 10:06:36'),(4,'Signature 4',NULL,1,0,'2024-02-09 16:56:33','2024-02-09 16:56:33'),(5,'Evenement 1','C:\\laragon\\www\\crm_verychic\\public\\uploads/signatures/signature_65c66ccd1c81e.png',1,0,'2024-02-09 17:19:57','2024-02-09 17:19:57'),(6,'fff tt','/uploads/signatures/signature_65c757b702dab.png',1,0,'2024-02-09 17:25:56','2024-02-10 10:02:15'),(7,'Course 1','/uploads/signatures/signature_65c66f06dea32.jpg',1,0,'2024-02-09 17:29:26','2024-02-09 17:29:26'),(8,'test','/uploads/signatures/signature_65c7598d1b3e4.png',1,0,'2024-02-10 10:10:05','2024-02-10 10:10:05'),(9,'ss','/uploads/signatures/cacher-removebg.png',1,0,'2024-02-12 20:58:04','2024-02-12 20:58:16');
/*!40000 ALTER TABLE `crm_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_site_metas`
--

DROP TABLE IF EXISTS `crm_site_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_site_metas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `is_file` int DEFAULT '0',
  `deleted` int DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_site_metas`
--

LOCK TABLES `crm_site_metas` WRITE;
/*!40000 ALTER TABLE `crm_site_metas` DISABLE KEYS */;
INSERT INTO `crm_site_metas` VALUES (1,'logo_site','/assets/images/verychic_logo.png',1,0,1,NULL,NULL),(2,'logo_bill','/assets/images/example-logo-light.png',1,0,1,NULL,NULL),(4,'bill_information_complementaire','Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression impression.',0,0,1,NULL,'2024-03-10 12:51:25'),(5,'bill_information_verychic','<p class=\"text-start\">VERY CHIC EXPERIENCE SARL AU <br /> RC: 60331 - TP: 14201662IF: 37659181<br /> - CNSS: 1630120</p>',0,0,1,'2023-08-17 18:39:02','2024-03-10 12:51:25'),(6,'bank_name','CREDIT AGRICOLE DU MAROC',0,0,1,'2024-03-10 12:15:09','2024-03-10 12:51:25'),(7,'bank_account_number','225 270 0015926216651011104',0,0,1,'2024-03-10 12:15:09','2024-03-10 12:51:25');
/*!40000 ALTER TABLE `crm_site_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_users`
--

DROP TABLE IF EXISTS `crm_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crm_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_users`
--

LOCK TABLES `crm_users` WRITE;
/*!40000 ALTER TABLE `crm_users` DISABLE KEYS */;
INSERT INTO `crm_users` VALUES (1,'khalid','morjani','adminnn','mounirmorjani@gmail.com',NULL,'$2y$10$g8gLednWehTIGHlGRZZbO.BzVx026WyPjYAOsI/Jq38UUodpo5eby',NULL,NULL,NULL,NULL,'2023-07-22 16:29:40','2023-08-15 08:11:25'),(2,'ahmed','morjani','ahmed','ahmed@gmail.com',NULL,'$2y$10$guPKmaSJP1JiZmlr907W5OaD74C5/kw3OwvqtWh924.8jkue1yJxC',NULL,NULL,NULL,NULL,'2023-07-22 16:29:40','2023-08-13 14:48:01'),(3,'test',NULL,'admin','testtest@gmail.com',NULL,'$2y$10$DNVYuECNl/F0u6ebEP.hvOVGi52VCNewuSqILNalfEW0PpwaXKBnK',NULL,NULL,NULL,NULL,'2023-08-18 08:55:59','2023-08-18 08:55:59'),(4,'khalid','khalid','khalid','khalid@gmail.com',NULL,'$2y$10$0vwII75/tSoma5Yg4oEtq.8iv1daPX1wr74Sh3Z.lYfWzbpCtFWeO',NULL,NULL,NULL,NULL,'2023-08-18 09:00:51','2023-08-18 09:00:51');
/*!40000 ALTER TABLE `crm_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-05 12:10:35
