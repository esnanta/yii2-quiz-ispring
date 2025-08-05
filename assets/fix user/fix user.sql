-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: yii2_quiz_ispring
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Table structure for table `tx_assessment`
--

DROP TABLE IF EXISTS `tx_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_assessment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `schedule_id` int DEFAULT NULL,
  `schedule_detail_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `period_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `question_type` int DEFAULT NULL,
  `exam_type` int DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `earned_points` decimal(18,2) DEFAULT NULL,
  `passing_score` decimal(18,2) DEFAULT NULL,
  `passing_score_percent` decimal(18,2) DEFAULT NULL,
  `gained_score` decimal(18,2) DEFAULT NULL,
  `evaluate_score` decimal(18,2) DEFAULT NULL COMMENT '(earn/gain)*100',
  `quiz_title` varchar(50) DEFAULT NULL,
  `quiz_type` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `time_limit` varchar(50) DEFAULT NULL,
  `used_time` varchar(50) DEFAULT NULL,
  `time_spent` varchar(50) DEFAULT NULL,
  `submission_status` int DEFAULT NULL,
  `token` varchar(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_assessment_detail_office` (`office_id`),
  KEY `Fk_assessment_detail_assessment` (`schedule_id`),
  KEY `Fk_assessment_detail_participant` (`user_id`),
  KEY `Fk_assessment_detail_schedule_detail` (`schedule_detail_id`),
  KEY `Fk_assessment_detail_subject` (`subject_id`),
  KEY `Fk_assessment_detail_period` (`period_id`),
  KEY `FK_tx_assessment_group` (`group_id`),
  CONSTRAINT `Fk_assessment_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  CONSTRAINT `Fk_assessment_period` FOREIGN KEY (`period_id`) REFERENCES `tx_period` (`id`),
  CONSTRAINT `Fk_assessment_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `tx_schedule` (`id`),
  CONSTRAINT `Fk_assessment_schedule_detail` FOREIGN KEY (`schedule_detail_id`) REFERENCES `tx_schedule_detail` (`id`),
  CONSTRAINT `Fk_assessment_subject` FOREIGN KEY (`subject_id`) REFERENCES `tx_subject` (`id`),
  CONSTRAINT `FK_tx_assessment_group` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`),
  CONSTRAINT `tx_assessment_tx_profile_FK` FOREIGN KEY (`user_id`) REFERENCES `tx_profile` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_assessment`
--

LOCK TABLES `tx_assessment` WRITE;
/*!40000 ALTER TABLE `tx_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_asset`
--

DROP TABLE IF EXISTS `tx_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `is_visible` int DEFAULT NULL,
  `asset_type` int DEFAULT NULL,
  `asset_category_id` int DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `date_issued` date DEFAULT NULL,
  `asset_name` varchar(200) DEFAULT NULL,
  `asset_url` varchar(500) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `view_counter` int DEFAULT NULL,
  `download_counter` int DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_archive_category` (`asset_category_id`),
  KEY `FK_tx_archive_office` (`office_id`),
  CONSTRAINT `FK_tx_archive_category` FOREIGN KEY (`asset_category_id`) REFERENCES `tx_asset_category` (`id`),
  CONSTRAINT `FK_tx_archive_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_asset`
--

LOCK TABLES `tx_asset` WRITE;
/*!40000 ALTER TABLE `tx_asset` DISABLE KEYS */;
INSERT INTO `tx_asset` VALUES (21,1,1,6,5,'participant','2025-07-14','participant_687480e917691.xlsx','/yii2-quiz-ispring/admin/images/no-picture-available-icon-1.jpg',NULL,NULL,0,0,'','2025-07-14 10:46:15','2025-07-30 20:37:24',1,1,NULL,NULL,NULL,4,'17c58f65606511f086f2c858c0b7f92b');
/*!40000 ALTER TABLE `tx_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_asset_category`
--

DROP TABLE IF EXISTS `tx_asset_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_asset_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_archive_category_office` (`office_id`),
  CONSTRAINT `FK_tx_archive_category_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_asset_category`
--

LOCK TABLES `tx_asset_category` WRITE;
/*!40000 ALTER TABLE `tx_asset_category` DISABLE KEYS */;
INSERT INTO `tx_asset_category` VALUES (5,1,'Test',1,'','2024-01-17 23:20:28','2024-01-17 23:20:28',1,1,NULL,NULL,NULL,0,'53bcf82eb55411ee9384c858c0b7f92f'),(6,1,'test',2,'','2024-07-05 21:40:09','2024-07-05 21:40:09',1,1,NULL,NULL,NULL,0,'7ac97fc83adc11efbaefc858c0b7f92f');
/*!40000 ALTER TABLE `tx_asset_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_auth_assignment`
--

DROP TABLE IF EXISTS `tx_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_auth_assignment` (
  `item_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `tx_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_auth_assignment`
--

LOCK TABLES `tx_auth_assignment` WRITE;
/*!40000 ALTER TABLE `tx_auth_assignment` DISABLE KEYS */;
INSERT INTO `tx_auth_assignment` VALUES ('admin','1',1728109936);
/*!40000 ALTER TABLE `tx_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_auth_item`
--

DROP TABLE IF EXISTS `tx_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_auth_item` (
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` smallint NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `tx_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `tx_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_auth_item`
--

LOCK TABLES `tx_auth_item` WRITE;
/*!40000 ALTER TABLE `tx_auth_item` DISABLE KEYS */;
INSERT INTO `tx_auth_item` VALUES ('admin',1,'Admin',NULL,NULL,1728109936,1728109936),('create-assessment',2,'Create Assessment',NULL,NULL,1728109936,1728109936),('create-asset',2,'Create Asset',NULL,NULL,1728109936,1728109936),('create-assetcategory',2,'Create Asset Category',NULL,NULL,1728109936,1728109936),('create-employment',2,'Create Employment',NULL,NULL,1728109936,1728109936),('create-group',2,'Create Group',NULL,NULL,1728109936,1728109936),('create-ispring-master',2,'Create Ispring Master',NULL,NULL,1728109936,1728109936),('create-ispring-transaction',2,'Create Ispring Transaction',NULL,NULL,1728109936,1728109936),('create-master',2,'Create Master',NULL,NULL,1728109936,1728109936),('create-office',2,'Create Office',NULL,NULL,1728109936,1728109936),('create-officemedia',2,'Create Office Media',NULL,NULL,1728109936,1728109936),('create-page',2,'Create Page',NULL,NULL,1728109936,1728109936),('create-participant',2,'Create Participant',NULL,NULL,1728109936,1728109936),('create-period',2,'Create Period',NULL,NULL,1728109936,1728109936),('create-profile',2,'Create Profile',NULL,NULL,1728109936,1728109936),('create-room',2,'Create Room',NULL,NULL,1728109936,1728109936),('create-schedule',2,'Create Schedule',NULL,NULL,1728109936,1728109936),('create-scheduledetail',2,'Create Schedule Detail',NULL,NULL,1728109936,1728109936),('create-staff',2,'Create Staff',NULL,NULL,1728109936,1728109936),('create-subject',2,'Create Subject',NULL,NULL,1728109936,1728109936),('create-transaction',2,'Create Transaction',NULL,NULL,1728109936,1728109936),('create-user-owner',2,'Create User Owner',NULL,NULL,1728109936,1728109936),('create-user-regular',2,'Create User Regular',NULL,NULL,1728109936,1728109936),('delete-assessment',2,'Delete Assessment',NULL,NULL,1728109936,1728109936),('delete-asset',2,'Delete Asset',NULL,NULL,1728109936,1728109936),('delete-assetcategory',2,'Delete Asset Category',NULL,NULL,1728109936,1728109936),('delete-employment',2,'Delete Employment',NULL,NULL,1728109936,1728109936),('delete-group',2,'Delete Group',NULL,NULL,1728109936,1728109936),('delete-ispring-master',2,'Delete Ispring Master',NULL,NULL,1728109936,1728109936),('delete-ispring-transaction',2,'Delete Ispring Transaction',NULL,NULL,1728109936,1728109936),('delete-master',2,'Delete Master',NULL,NULL,1728109936,1728109936),('delete-office',2,'Delete Office',NULL,NULL,1728109936,1728109936),('delete-officemedia',2,'Delete Office Media',NULL,NULL,1728109936,1728109936),('delete-page',2,'Delete Page',NULL,NULL,1728109936,1728109936),('delete-participant',2,'Delete Participant',NULL,NULL,1728109936,1728109936),('delete-period',2,'Delete Period',NULL,NULL,1728109936,1728109936),('delete-profile',2,'Delete Profile',NULL,NULL,1728109936,1728109936),('delete-room',2,'Delete Room',NULL,NULL,1728109936,1728109936),('delete-schedule',2,'Delete Schedule',NULL,NULL,1728109936,1728109936),('delete-scheduledetail',2,'Delete Schedule Detail',NULL,NULL,1728109936,1728109936),('delete-staff',2,'Delete Staff',NULL,NULL,1728109936,1728109936),('delete-subject',2,'Delete Subject',NULL,NULL,1728109936,1728109936),('delete-transaction',2,'Delete Transaction',NULL,NULL,1728109936,1728109936),('guest',1,'Guest',NULL,NULL,1728109936,1728109936),('index-assessment',2,'Index Assessment',NULL,NULL,1728109936,1728109936),('index-asset',2,'Index Asset',NULL,NULL,1728109936,1728109936),('index-assetcategory',2,'Index Asset Category',NULL,NULL,1728109936,1728109936),('index-employment',2,'Index Employment',NULL,NULL,1728109936,1728109936),('index-group',2,'Index Group',NULL,NULL,1728109936,1728109936),('index-ispring-master',2,'Index Ispring Master',NULL,NULL,1728109936,1728109936),('index-ispring-transaction',2,'Index Ispring Transaction',NULL,NULL,1728109936,1728109936),('index-master',2,'Index Master',NULL,NULL,1728109936,1728109936),('index-office',2,'Index Office',NULL,NULL,1728109936,1728109936),('index-officemedia',2,'Index Office Media',NULL,NULL,1728109936,1728109936),('index-page',2,'Index Page',NULL,NULL,1728109936,1728109936),('index-participant',2,'Index Participant',NULL,NULL,1728109936,1728109936),('index-period',2,'Index Period',NULL,NULL,1728109936,1728109936),('index-profile',2,'Index Profile',NULL,NULL,1728109936,1728109936),('index-room',2,'Index Room',NULL,NULL,1728109936,1728109936),('index-schedule',2,'Index Schedule',NULL,NULL,1728109936,1728109936),('index-scheduledetail',2,'Index Schedule Detail',NULL,NULL,1728109936,1728109936),('index-staff',2,'Index Staff',NULL,NULL,1728109936,1728109936),('index-subject',2,'Index Subject',NULL,NULL,1728109936,1728109936),('index-transaction',2,'Index Transaction',NULL,NULL,1728109936,1728109936),('owner',1,'Company Owner',NULL,NULL,1728109936,1728109936),('participant',1,'Participant',NULL,NULL,1728109936,1728109936),('regular',1,'Regular',NULL,NULL,1728109936,1728109936),('report-assessment',2,'Report Assessment',NULL,NULL,1728109936,1728109936),('report-asset',2,'Report Asset',NULL,NULL,1728109936,1728109936),('report-assetcategory',2,'Report Asset Category',NULL,NULL,1728109936,1728109936),('report-group',2,'Report Group',NULL,NULL,1728109936,1728109936),('report-ispring-master',2,'Report Ispring Master',NULL,NULL,1728109936,1728109936),('report-ispring-transaction',2,'Report Ispring Transaction',NULL,NULL,1728109936,1728109936),('report-master',2,'Report Master',NULL,NULL,1728109936,1728109936),('report-participant',2,'Report Participant',NULL,NULL,1728109936,1728109936),('report-period',2,'Report Period',NULL,NULL,1728109936,1728109936),('report-room',2,'Report Room',NULL,NULL,1728109936,1728109936),('report-schedule',2,'Report Schedule',NULL,NULL,1728109936,1728109936),('report-scheduledetail',2,'Report Schedule Detail',NULL,NULL,1728109936,1728109936),('report-subject',2,'Report Subject',NULL,NULL,1728109936,1728109936),('report-transaction',2,'Report Transaction',NULL,NULL,1728109936,1728109936),('update-assessment',2,'Update Assessment',NULL,NULL,1728109936,1728109936),('update-asset',2,'Update Asset',NULL,NULL,1728109936,1728109936),('update-assetcategory',2,'Update Asset Category',NULL,NULL,1728109936,1728109936),('update-employment',2,'Update Employment',NULL,NULL,1728109936,1728109936),('update-group',2,'Update Group',NULL,NULL,1728109936,1728109936),('update-ispring-master',2,'Update Ispring Master',NULL,NULL,1728109936,1728109936),('update-ispring-transaction',2,'Update Ispring Transaction',NULL,NULL,1728109936,1728109936),('update-master',2,'Update Master',NULL,NULL,1728109936,1728109936),('update-office',2,'Update Office',NULL,NULL,1728109936,1728109936),('update-officemedia',2,'Update Office Media',NULL,NULL,1728109936,1728109936),('update-page',2,'Update Page',NULL,NULL,1728109936,1728109936),('update-participant',2,'Update Participant',NULL,NULL,1728109936,1728109936),('update-period',2,'Update Period',NULL,NULL,1728109936,1728109936),('update-profile',2,'Update Profile',NULL,NULL,1728109936,1728109936),('update-room',2,'Update Room',NULL,NULL,1728109936,1728109936),('update-schedule',2,'Update Schedule',NULL,NULL,1728109936,1728109936),('update-scheduledetail',2,'Update Schedule Detail',NULL,NULL,1728109936,1728109936),('update-staff',2,'Update Staff',NULL,NULL,1728109936,1728109936),('update-subject',2,'Update Subject',NULL,NULL,1728109936,1728109936),('update-transaction',2,'Update Transaction',NULL,NULL,1728109936,1728109936),('view-assessment',2,'View Assessment',NULL,NULL,1728109936,1728109936),('view-asset',2,'View Asset',NULL,NULL,1728109936,1728109936),('view-assetcategory',2,'View Asset Category',NULL,NULL,1728109936,1728109936),('view-employment',2,'View Employment',NULL,NULL,1728109936,1728109936),('view-group',2,'View Group',NULL,NULL,1728109936,1728109936),('view-ispring-master',2,'View Ispring Master',NULL,NULL,1728109936,1728109936),('view-ispring-transaction',2,'View Ispring Transaction',NULL,NULL,1728109936,1728109936),('view-master',2,'View Master',NULL,NULL,1728109936,1728109936),('view-office',2,'View Office',NULL,NULL,1728109936,1728109936),('view-officemedia',2,'View Office Media',NULL,NULL,1728109936,1728109936),('view-page',2,'View Page',NULL,NULL,1728109936,1728109936),('view-participant',2,'View Participant',NULL,NULL,1728109936,1728109936),('view-period',2,'View Period',NULL,NULL,1728109936,1728109936),('view-profile',2,'View Profile',NULL,NULL,1728109936,1728109936),('view-room',2,'View Room',NULL,NULL,1728109936,1728109936),('view-schedule',2,'View Schedule',NULL,NULL,1728109936,1728109936),('view-scheduledetail',2,'View Schedule Detail',NULL,NULL,1728109936,1728109936),('view-staff',2,'View Staff',NULL,NULL,1728109936,1728109936),('view-subject',2,'View Subject',NULL,NULL,1728109936,1728109936),('view-transaction',2,'View Transaction',NULL,NULL,1728109936,1728109936);
/*!40000 ALTER TABLE `tx_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_auth_item_child`
--

DROP TABLE IF EXISTS `tx_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_auth_item_child` (
  `parent` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `tx_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tx_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_auth_item_child`
--

LOCK TABLES `tx_auth_item_child` WRITE;
/*!40000 ALTER TABLE `tx_auth_item_child` DISABLE KEYS */;
INSERT INTO `tx_auth_item_child` VALUES ('create-ispring-transaction','create-assessment'),('create-transaction','create-asset'),('create-master','create-assetcategory'),('create-master','create-employment'),('create-ispring-master','create-group'),('admin','create-ispring-master'),('owner','create-ispring-master'),('admin','create-ispring-transaction'),('owner','create-ispring-transaction'),('regular','create-ispring-transaction'),('admin','create-master'),('owner','create-master'),('create-master','create-office'),('create-master','create-officemedia'),('create-master','create-page'),('create-ispring-master','create-participant'),('create-ispring-master','create-period'),('create-master','create-profile'),('create-ispring-master','create-room'),('create-ispring-master','create-schedule'),('create-ispring-master','create-scheduledetail'),('create-master','create-staff'),('create-ispring-master','create-subject'),('admin','create-transaction'),('owner','create-transaction'),('regular','create-transaction'),('index-transaction','create-user-regular'),('delete-ispring-transaction','delete-assessment'),('delete-transaction','delete-asset'),('delete-master','delete-assetcategory'),('delete-master','delete-employment'),('delete-ispring-master','delete-group'),('admin','delete-ispring-master'),('owner','delete-ispring-master'),('admin','delete-ispring-transaction'),('owner','delete-ispring-transaction'),('admin','delete-master'),('owner','delete-master'),('delete-master','delete-office'),('delete-master','delete-officemedia'),('delete-master','delete-page'),('delete-ispring-master','delete-participant'),('delete-ispring-master','delete-period'),('delete-master','delete-profile'),('delete-ispring-master','delete-room'),('delete-ispring-master','delete-schedule'),('delete-ispring-master','delete-scheduledetail'),('delete-master','delete-staff'),('delete-ispring-master','delete-subject'),('admin','delete-transaction'),('owner','delete-transaction'),('regular','delete-transaction'),('index-ispring-transaction','index-assessment'),('guest','index-asset'),('index-transaction','index-asset'),('index-master','index-assetcategory'),('index-master','index-employment'),('index-ispring-master','index-group'),('admin','index-ispring-master'),('owner','index-ispring-master'),('regular','index-ispring-master'),('admin','index-ispring-transaction'),('owner','index-ispring-transaction'),('regular','index-ispring-transaction'),('admin','index-master'),('owner','index-master'),('regular','index-master'),('index-master','index-office'),('index-master','index-officemedia'),('index-master','index-page'),('index-ispring-master','index-participant'),('index-ispring-master','index-period'),('index-master','index-profile'),('index-ispring-master','index-room'),('index-ispring-master','index-schedule'),('index-ispring-master','index-scheduledetail'),('index-master','index-staff'),('index-ispring-master','index-subject'),('admin','index-transaction'),('owner','index-transaction'),('regular','index-transaction'),('report-ispring-transaction','report-assessment'),('report-transaction','report-asset'),('report-master','report-assetcategory'),('report-ispring-master','report-group'),('admin','report-ispring-master'),('owner','report-ispring-master'),('regular','report-ispring-master'),('admin','report-ispring-transaction'),('owner','report-ispring-transaction'),('regular','report-ispring-transaction'),('admin','report-master'),('owner','report-master'),('report-ispring-master','report-participant'),('report-ispring-master','report-period'),('report-ispring-master','report-room'),('report-ispring-master','report-schedule'),('report-ispring-master','report-scheduledetail'),('report-ispring-master','report-subject'),('admin','report-transaction'),('owner','report-transaction'),('regular','report-transaction'),('update-ispring-transaction','update-assessment'),('update-transaction','update-asset'),('update-master','update-assetcategory'),('update-master','update-employment'),('update-ispring-master','update-group'),('admin','update-ispring-master'),('owner','update-ispring-master'),('admin','update-ispring-transaction'),('owner','update-ispring-transaction'),('admin','update-master'),('owner','update-master'),('update-master','update-office'),('update-master','update-officemedia'),('update-master','update-page'),('update-ispring-master','update-participant'),('update-ispring-master','update-period'),('regular','update-profile'),('update-master','update-profile'),('update-ispring-master','update-room'),('update-ispring-master','update-schedule'),('update-ispring-master','update-scheduledetail'),('update-master','update-staff'),('update-ispring-master','update-subject'),('admin','update-transaction'),('owner','update-transaction'),('regular','update-transaction'),('view-ispring-transaction','view-assessment'),('guest','view-asset'),('view-transaction','view-asset'),('view-master','view-assetcategory'),('view-master','view-employment'),('view-ispring-master','view-group'),('admin','view-ispring-master'),('owner','view-ispring-master'),('regular','view-ispring-master'),('admin','view-ispring-transaction'),('owner','view-ispring-transaction'),('regular','view-ispring-transaction'),('admin','view-master'),('owner','view-master'),('regular','view-master'),('view-master','view-office'),('view-master','view-officemedia'),('view-master','view-page'),('view-ispring-master','view-participant'),('view-ispring-master','view-period'),('regular','view-profile'),('view-master','view-profile'),('view-ispring-master','view-room'),('view-ispring-master','view-schedule'),('view-ispring-master','view-scheduledetail'),('view-master','view-staff'),('view-ispring-master','view-subject'),('admin','view-transaction'),('owner','view-transaction'),('regular','view-transaction');
/*!40000 ALTER TABLE `tx_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_auth_rule`
--

DROP TABLE IF EXISTS `tx_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_auth_rule` (
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_auth_rule`
--

LOCK TABLES `tx_auth_rule` WRITE;
/*!40000 ALTER TABLE `tx_auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_counter`
--

DROP TABLE IF EXISTS `tx_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_counter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `title` varchar(15) NOT NULL,
  `counter` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_counter_office` (`office_id`),
  CONSTRAINT `Fk_counter_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_counter`
--

LOCK TABLES `tx_counter` WRITE;
/*!40000 ALTER TABLE `tx_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_dashblock`
--

DROP TABLE IF EXISTS `tx_dashblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_dashblock` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `actions` text,
  `weight` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_dashblock`
--

LOCK TABLES `tx_dashblock` WRITE;
/*!40000 ALTER TABLE `tx_dashblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_dashblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_employment`
--

DROP TABLE IF EXISTS `tx_employment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_employment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `sequence` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_tx_employment_office` (`office_id`),
  CONSTRAINT `Fk_tx_employment_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_employment`
--

LOCK TABLES `tx_employment` WRITE;
/*!40000 ALTER TABLE `tx_employment` DISABLE KEYS */;
INSERT INTO `tx_employment` VALUES (1,1,'Programmer','-',1,'2023-08-22 22:30:26','2024-07-07 10:37:04',1,1,NULL,NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `tx_employment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_event`
--

DROP TABLE IF EXISTS `tx_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `location` tinytext,
  `content` text,
  `view_counter` int DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_event`
--

LOCK TABLES `tx_event` WRITE;
/*!40000 ALTER TABLE `tx_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_group`
--

DROP TABLE IF EXISTS `tx_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` tinyint DEFAULT NULL,
  `description` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_group_office` (`office_id`),
  CONSTRAINT `Fk_group_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_group`
--

LOCK TABLES `tx_group` WRITE;
/*!40000 ALTER TABLE `tx_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_migration`
--

DROP TABLE IF EXISTS `tx_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_migration`
--

LOCK TABLES `tx_migration` WRITE;
/*!40000 ALTER TABLE `tx_migration` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_office`
--

DROP TABLE IF EXISTS `tx_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_office` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(15) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `fax_number` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `description` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_office`
--

LOCK TABLES `tx_office` WRITE;
/*!40000 ALTER TABLE `tx_office` DISABLE KEYS */;
INSERT INTO `tx_office` VALUES (1,'65a7fb0e28f7b','Daraspace','-',NULL,'ombakrinai@gmail.com','https://daraspace.com','-',NULL,NULL,'-','2023-08-18 22:25:10','2024-07-07 10:34:30',1,1,NULL,NULL,NULL,4,NULL);
/*!40000 ALTER TABLE `tx_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_office_media`
--

DROP TABLE IF EXISTS `tx_office_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_office_media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `media_type` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_office_media_office` (`office_id`),
  CONSTRAINT `FK_tx_office_media_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_office_media`
--

LOCK TABLES `tx_office_media` WRITE;
/*!40000 ALTER TABLE `tx_office_media` DISABLE KEYS */;
INSERT INTO `tx_office_media` VALUES (1,1,11,'fa-brands fa-twitter','','2024-07-25 00:04:27','2024-07-25 00:04:27',1,1,NULL,NULL,NULL,0,'c92e8b7749de11ef9de9c858c0b7f92f');
/*!40000 ALTER TABLE `tx_office_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_page`
--

DROP TABLE IF EXISTS `tx_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_type` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `asset_name` varchar(200) DEFAULT NULL,
  `description` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_page`
--

LOCK TABLES `tx_page` WRITE;
/*!40000 ALTER TABLE `tx_page` DISABLE KEYS */;
INSERT INTO `tx_page` VALUES (1,2,'Logo 1','<p><img style=\"width: 103px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGcAAAAnCAYAAAASGVaVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3YTJkN2YzYS0xNGQxLTQyODQtYmYwZC00MGUxZTJkMjNjOGYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODcxNjQ4RjBEMDI5MTFFNjhFOUZCNTlCN0ZERTdEREIiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODcxNjQ4RUZEMDI5MTFFNjhFOUZCNTlCN0ZERTdEREIiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3YTJkN2YzYS0xNGQxLTQyODQtYmYwZC00MGUxZTJkMjNjOGYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6N2EyZDdmM2EtMTRkMS00Mjg0LWJmMGQtNDBlMWUyZDIzYzhm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\" data-filename=\"logo-1.png\"><br></p>',NULL,'Logo 1 - Bagian Atas Kiri','2018-01-08 21:47:15','2024-08-18 15:55:56',1,1,NULL,NULL,NULL,0,''),(2,2,'Logo 2','<p><img style=\"width: 200px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAAAnCAYAAABKSgfJAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDE0IDc5LjE1Njc5NywgMjAxNC8wOC8yMC0wOTo1MzowMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MERFMUI5RERGNTlGMTFFNDk4QTZDQjA2OEIzQTJBRUUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MERFMUI5REVGNTlGMTFFNDk4QTZDQjA2OEIzQTJBRUUiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowREUxQjlEQkY1OUYxMUU0OThBNkNCMDY4QjNBMkFFRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowREUxQjlEQ0Y1OUYxMUU0OThBNkNCMDY4QjNBMkFFRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoaoddcAAA6SSURBVHja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\" data-filename=\"logo-14.png\"><br></p>',NULL,'Logo 2 - Bagian Bawah Kiri','2018-01-08 21:47:15','2024-08-18 15:55:41',1,1,NULL,NULL,NULL,0,''),(3,2,'Logo Report 1','b3MYTwJeYCkb4IUmLrPkjcePntzALUBi.png',NULL,'Logo 1 - Bagian Atas Kiri','2018-01-08 21:47:15','2018-01-08 21:47:15',1,1,NULL,NULL,NULL,0,''),(4,2,'Logo Report 2','q8Z7e_TqQrBwU8URdcZ4I7t62u3-EHCm.png',NULL,'NA','2018-01-08 21:47:15','2018-01-08 21:47:15',1,1,NULL,NULL,NULL,0,''),(11,1,'SEO Description',NULL,NULL,'SEO Description','2018-01-08 21:47:15','2018-01-08 21:47:15',1,1,NULL,NULL,NULL,0,''),(12,1,'SEO Keyword',NULL,NULL,'SEO Keyword','2018-01-08 21:47:15','2018-01-08 21:47:15',1,1,NULL,NULL,NULL,0,''),(21,1,'About','VD6pJHgk7ikBhHW6gmW59mfrWLQhjpFx.png',NULL,'Donec id elit y DESCRIPTION.','2017-12-02 22:33:55','2017-12-02 22:39:25',1,1,NULL,NULL,NULL,0,'');
/*!40000 ALTER TABLE `tx_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_period`
--

DROP TABLE IF EXISTS `tx_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_period` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `description` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_period_office` (`office_id`),
  CONSTRAINT `Fk_period_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_period`
--

LOCK TABLES `tx_period` WRITE;
/*!40000 ALTER TABLE `tx_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_profile`
--

DROP TABLE IF EXISTS `tx_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_profile` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `user_type` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `public_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `asset_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `tx_profile_tx_office_FK` (`office_id`),
  KEY `tx_profile_tx_group_FK` (`group_id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tx_profile_tx_group_FK` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tx_profile_tx_office_FK` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_profile`
--

LOCK TABLES `tx_profile` WRITE;
/*!40000 ALTER TABLE `tx_profile` DISABLE KEYS */;
INSERT INTO `tx_profile` VALUES (1,NULL,NULL,NULL,'Nanta Es',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tx_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_quote`
--

DROP TABLE IF EXISTS `tx_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_quote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `source` varchar(100) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_quote`
--

LOCK TABLES `tx_quote` WRITE;
/*!40000 ALTER TABLE `tx_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_room`
--

DROP TABLE IF EXISTS `tx_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` tinyint DEFAULT NULL,
  `description` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_room_office` (`office_id`),
  CONSTRAINT `Fk_room_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_room`
--

LOCK TABLES `tx_room` WRITE;
/*!40000 ALTER TABLE `tx_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_schedule`
--

DROP TABLE IF EXISTS `tx_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `period_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `exam_type` int DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `token` varchar(6) DEFAULT NULL,
  `token_time` datetime DEFAULT NULL,
  `is_asset` int DEFAULT NULL COMMENT 'Available or not',
  `description` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_schedule_office` (`office_id`),
  KEY `Fk_schedule_room` (`room_id`),
  KEY `Fk_schedule_group` (`group_id`),
  KEY `Fk_schedule_period` (`period_id`),
  KEY `Fk_schedule_staff` (`staff_id`),
  CONSTRAINT `Fk_schedule_group` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`),
  CONSTRAINT `Fk_schedule_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  CONSTRAINT `Fk_schedule_period` FOREIGN KEY (`period_id`) REFERENCES `tx_period` (`id`),
  CONSTRAINT `Fk_schedule_room` FOREIGN KEY (`room_id`) REFERENCES `tx_room` (`id`),
  CONSTRAINT `Fk_schedule_staff` FOREIGN KEY (`staff_id`) REFERENCES `tx_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_schedule`
--

LOCK TABLES `tx_schedule` WRITE;
/*!40000 ALTER TABLE `tx_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_schedule_detail`
--

DROP TABLE IF EXISTS `tx_schedule_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_schedule_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `schedule_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `asset_id` int DEFAULT NULL,
  `question_type` int DEFAULT NULL,
  `remark` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_schedule_detail_office` (`office_id`),
  KEY `Fk_schedule_detail_schedule` (`schedule_id`),
  KEY `Fk_schedule_detail_subject` (`subject_id`),
  KEY `FK_tx_schedule_detail_asset` (`asset_id`),
  CONSTRAINT `Fk_schedule_detail_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  CONSTRAINT `Fk_schedule_detail_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `tx_schedule` (`id`),
  CONSTRAINT `Fk_schedule_detail_subject` FOREIGN KEY (`subject_id`) REFERENCES `tx_subject` (`id`),
  CONSTRAINT `FK_tx_schedule_detail_asset` FOREIGN KEY (`asset_id`) REFERENCES `tx_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_schedule_detail`
--

LOCK TABLES `tx_schedule_detail` WRITE;
/*!40000 ALTER TABLE `tx_schedule_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_schedule_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_session`
--

DROP TABLE IF EXISTS `tx_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_session` (
  `id` char(32) NOT NULL,
  `expire` int DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_session`
--

LOCK TABLES `tx_session` WRITE;
/*!40000 ALTER TABLE `tx_session` DISABLE KEYS */;
INSERT INTO `tx_session` VALUES ('1lci47mol1f2bqt3o7rfv0323f',1754022789,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('2gsb5udp95tdtq1qtovt9ai7pm',1753888039,_binary '__flash|a:0:{}'),('3136ijudheacpuukj0mcvt883o',1728315956,_binary '__flash|a:0:{}'),('354qh7j80a6cgbtq96nlk32701',1753760156,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('3ch0ddv71adictji7c2sphpq6r',1752469527,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('3lgs0qqh5v7m2956dlm9nt8ppq',1728221656,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('6l39nvl3u8lr7u1ul7t34t6v9m',1753867536,_binary '__flash|a:0:{}'),('8116t3hb5gh25ioru6jahtv64f',1753586442,_binary '__flash|a:0:{}'),('9eg9q10a6gmgvu9rv23ijnb1dd',1754036157,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('9fljm7tvf6a8pq0rh7fib6flo3',1753888077,_binary '__flash|a:0:{}'),('9j8enliueecbefc4abaiige7j6',1754013065,_binary '__flash|a:0:{}__id|i:16;__authKey|s:32:\"7PS_AYW8ARE_0pe2mIzujVnvlr1aKqnJ\";'),('aa7f2udkmgitss68at1p5k0htu',1753888067,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";actions-redirect|s:41:\"/yii2-quiz-ispring/admin/user/admin/index\";'),('b62hfasb6rkksdb1nmr22svdkb',1753759324,_binary '__flash|a:0:{}'),('bqmtcmlctadgf5v3ofjm304eeh',1754012425,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('c9h4hqcj0nqkhghjuptfu4k39j',1728218461,_binary '__flash|a:0:{}'),('co9ocnfojrnmr48fb52qeptd81',1753335584,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('cr07nttqglt5ths44i9o98k2e0',1728297019,_binary '__flash|a:0:{}'),('da57iksqj9ss6l60p7d79rpflk',1754040287,_binary '__flash|a:0:{}__returnUrl|s:51:\"http://localhost/yii2-quiz-ispring/admin/site/index\";__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('dhbm151livh7t1221u8hav24ma',1753869428,_binary '__flash|a:0:{}'),('dilprjg9ldehne8jd1c730jkmc',1728300555,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('e9uaa2a56jjl33s2e9d49k1j4b',1754022779,_binary '__flash|a:0:{}'),('g5h6qn0c2mbg23svin4os1k16k',1728317815,_binary '__flash|a:0:{}__id|i:2;__authKey|s:32:\"rTLWE9bn6GPyCsMjhNTKBkPIexpbruG5\";'),('h0s8fsismrf59unof5fpjc3gep',1753882694,_binary '__flash|a:0:{}'),('jj337ta0rfroljag498pafr0fu',1753872838,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('jsdt660d5mkga742143kjd1ma9',1753610306,_binary '__flash|a:0:{}'),('kkq45ds4loc0j48lj7ja6rftn9',1753501698,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('ls029pfvsq3u058rv6cn45045b',1754011815,_binary '__flash|a:0:{}'),('md8rijokc5run1672nsf50hpiv',1728317766,_binary '__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),('neg5tegrmlgokv3kjurd305s5l',1753600656,_binary '__flash|a:0:{}'),('sanu50tc1bpvfc1q9b0nor7npv',1753501262,_binary '__flash|a:0:{}'),('sk3u79ecv0jdmrubve2s7tbtui',1753593509,_binary '__flash|a:0:{}'),('sv3edprf7n4nlg54bou3drkhig',1753334782,_binary '__flash|a:0:{}'),('ubkjvplpd82unst8anrnds74o5',1754013580,_binary '__flash|a:0:{}__id|i:16;__authKey|s:32:\"7PS_AYW8ARE_0pe2mIzujVnvlr1aKqnJ\";'),('vtoiigselke6gru44tq9de3jem',1752462536,_binary '__flash|a:0:{}');
/*!40000 ALTER TABLE `tx_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_social_account`
--

DROP TABLE IF EXISTS `tx_social_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_social_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_social_account_provider_client_id` (`provider`,`client_id`),
  UNIQUE KEY `idx_social_account_code` (`code`),
  KEY `fk_social_account_user` (`user_id`),
  CONSTRAINT `fk_social_account_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_social_account`
--

LOCK TABLES `tx_social_account` WRITE;
/*!40000 ALTER TABLE `tx_social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_social_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_staff`
--

DROP TABLE IF EXISTS `tx_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `office_id` int DEFAULT NULL,
  `employment_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `initial` varchar(10) DEFAULT NULL,
  `identity_number` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `gender_status` int DEFAULT NULL,
  `active_status` int DEFAULT NULL,
  `address` tinytext,
  `asset_name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `description` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_staff_gender` (`gender_status`),
  KEY `FK_tx_staff_role` (`employment_id`),
  KEY `FK_tx_staff_office` (`office_id`),
  CONSTRAINT `FK_tx_staff_employment` FOREIGN KEY (`employment_id`) REFERENCES `tx_employment` (`id`),
  CONSTRAINT `FK_tx_staff_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_staff`
--

LOCK TABLES `tx_staff` WRITE;
/*!40000 ALTER TABLE `tx_staff` DISABLE KEYS */;
INSERT INTO `tx_staff` VALUES (1,1,1,1,'Nanta Es','Ade','123','123',1,1,'-','662a80f98ab73.jpg','asdf','-','2023-08-23 22:29:45','2024-04-25 23:12:43',1,1,NULL,NULL,NULL,25,NULL);
/*!40000 ALTER TABLE `tx_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_subject`
--

DROP TABLE IF EXISTS `tx_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` tinyint DEFAULT NULL,
  `description` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_subject_office` (`office_id`),
  CONSTRAINT `Fk_subject_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_subject`
--

LOCK TABLES `tx_subject` WRITE;
/*!40000 ALTER TABLE `tx_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_tag`
--

DROP TABLE IF EXISTS `tx_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(150) NOT NULL,
  `frequency` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_tag`
--

LOCK TABLES `tx_tag` WRITE;
/*!40000 ALTER TABLE `tx_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_user`
--

DROP TABLE IF EXISTS `tx_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `unconfirmed_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `registration_ip` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `confirmed_at` int DEFAULT NULL,
  `blocked_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `last_login_at` int DEFAULT NULL,
  `auth_tf_key` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `auth_tf_enabled` tinyint(1) DEFAULT '0',
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_email` (`email`),
  UNIQUE KEY `idx_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_user`
--

LOCK TABLES `tx_user` WRITE;
/*!40000 ALTER TABLE `tx_user` DISABLE KEYS */;
INSERT INTO `tx_user` VALUES (1,'admin','ombakrinai@gmail.com','$2y$12$1OrcfbmLlEy1lFwPTNVqZ.8mdXzEZboHOM1DWaT4/8GXe5jcwR5pG','e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm',NULL,NULL,0,NULL,NULL,1675777211,1727166428,NULL,NULL,1754034726,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tx_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-05 16:16:24
