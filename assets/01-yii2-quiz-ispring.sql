-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: yii2_quiz_ispring
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.1

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
  KEY `Fk_assessment_office` (`office_id`),
  KEY `Fk_assessment_schedule` (`schedule_id`),
  KEY `Fk_assessment_schedule_detail` (`schedule_detail_id`),
  KEY `tx_assessment_tx_profile_FK` (`user_id`),
  KEY `Fk_assessment_period` (`period_id`),
  KEY `FK_tx_assessment_group` (`group_id`),
  KEY `Fk_assessment_subject` (`subject_id`),
  CONSTRAINT `Fk_assessment_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  CONSTRAINT `Fk_assessment_period` FOREIGN KEY (`period_id`) REFERENCES `tx_period` (`id`),
  CONSTRAINT `Fk_assessment_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `tx_schedule` (`id`),
  CONSTRAINT `Fk_assessment_schedule_detail` FOREIGN KEY (`schedule_detail_id`) REFERENCES `tx_schedule_detail` (`id`),
  CONSTRAINT `Fk_assessment_subject` FOREIGN KEY (`subject_id`) REFERENCES `tx_subject` (`id`),
  CONSTRAINT `FK_tx_assessment_group` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`),
  CONSTRAINT `tx_assessment_tx_profile_FK` FOREIGN KEY (`user_id`) REFERENCES `tx_profile` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `FK_tx_archive_office` (`office_id`),
  KEY `FK_tx_archive_category` (`asset_category_id`),
  CONSTRAINT `FK_tx_archive_category` FOREIGN KEY (`asset_category_id`) REFERENCES `tx_asset_category` (`id`),
  CONSTRAINT `FK_tx_archive_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_asset`
--

LOCK TABLES `tx_asset` WRITE;
/*!40000 ALTER TABLE `tx_asset` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_asset_category`
--

LOCK TABLES `tx_asset_category` WRITE;
/*!40000 ALTER TABLE `tx_asset_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_asset_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_auth_assignment`
--

DROP TABLE IF EXISTS `tx_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `fk-auth_assignment-item_name` FOREIGN KEY (`item_name`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_auth_assignment`
--

LOCK TABLES `tx_auth_assignment` WRITE;
/*!40000 ALTER TABLE `tx_auth_assignment` DISABLE KEYS */;
INSERT INTO `tx_auth_assignment` VALUES ('admin','1',1755351092);
/*!40000 ALTER TABLE `tx_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_auth_item`
--

DROP TABLE IF EXISTS `tx_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `fk-auth_item-rule_name` (`rule_name`),
  CONSTRAINT `fk-auth_item-rule_name` FOREIGN KEY (`rule_name`) REFERENCES `tx_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_auth_item`
--

LOCK TABLES `tx_auth_item` WRITE;
/*!40000 ALTER TABLE `tx_auth_item` DISABLE KEYS */;
INSERT INTO `tx_auth_item` VALUES ('admin',1,'Admin',NULL,NULL,1755351092,1755351092),('create-assessment',2,'Create Assessment',NULL,NULL,1755351092,1755351092),('create-asset',2,'Create Asset',NULL,NULL,1755351092,1755351092),('create-assetcategory',2,'Create Asset Category',NULL,NULL,1755351092,1755351092),('create-employment',2,'Create Employment',NULL,NULL,1755351092,1755351092),('create-group',2,'Create Group',NULL,NULL,1755351092,1755351092),('create-ispring-master',2,'Create Ispring Master',NULL,NULL,1755351092,1755351092),('create-ispring-transaction',2,'Create Ispring Transaction',NULL,NULL,1755351092,1755351092),('create-master',2,'Create Master',NULL,NULL,1755351092,1755351092),('create-office',2,'Create Office',NULL,NULL,1755351092,1755351092),('create-officemedia',2,'Create Office Media',NULL,NULL,1755351092,1755351092),('create-page',2,'Create Page',NULL,NULL,1755351092,1755351092),('create-participant',2,'Create Participant',NULL,NULL,1755351092,1755351092),('create-period',2,'Create Period',NULL,NULL,1755351092,1755351092),('create-profile',2,'Create Profile',NULL,NULL,1755351092,1755351092),('create-room',2,'Create Room',NULL,NULL,1755351092,1755351092),('create-schedule',2,'Create Schedule',NULL,NULL,1755351092,1755351092),('create-scheduledetail',2,'Create Schedule Detail',NULL,NULL,1755351092,1755351092),('create-scheduletoken',2,'Create Schedule Token',NULL,NULL,1755351092,1755351092),('create-staff',2,'Create Staff',NULL,NULL,1755351092,1755351092),('create-subject',2,'Create Subject',NULL,NULL,1755351092,1755351092),('create-transaction',2,'Create Transaction',NULL,NULL,1755351092,1755351092),('create-user-owner',2,'Create User Owner',NULL,NULL,1755351092,1755351092),('create-user-regular',2,'Create User Regular',NULL,NULL,1755351092,1755351092),('delete-assessment',2,'Delete Assessment',NULL,NULL,1755351092,1755351092),('delete-asset',2,'Delete Asset',NULL,NULL,1755351092,1755351092),('delete-assetcategory',2,'Delete Asset Category',NULL,NULL,1755351092,1755351092),('delete-employment',2,'Delete Employment',NULL,NULL,1755351092,1755351092),('delete-group',2,'Delete Group',NULL,NULL,1755351092,1755351092),('delete-ispring-master',2,'Delete Ispring Master',NULL,NULL,1755351092,1755351092),('delete-ispring-transaction',2,'Delete Ispring Transaction',NULL,NULL,1755351092,1755351092),('delete-master',2,'Delete Master',NULL,NULL,1755351092,1755351092),('delete-office',2,'Delete Office',NULL,NULL,1755351092,1755351092),('delete-officemedia',2,'Delete Office Media',NULL,NULL,1755351092,1755351092),('delete-page',2,'Delete Page',NULL,NULL,1755351092,1755351092),('delete-participant',2,'Delete Participant',NULL,NULL,1755351092,1755351092),('delete-period',2,'Delete Period',NULL,NULL,1755351092,1755351092),('delete-profile',2,'Delete Profile',NULL,NULL,1755351092,1755351092),('delete-room',2,'Delete Room',NULL,NULL,1755351092,1755351092),('delete-schedule',2,'Delete Schedule',NULL,NULL,1755351092,1755351092),('delete-scheduledetail',2,'Delete Schedule Detail',NULL,NULL,1755351092,1755351092),('delete-scheduletoken',2,'Delete Schedule Token',NULL,NULL,1755351092,1755351092),('delete-staff',2,'Delete Staff',NULL,NULL,1755351092,1755351092),('delete-subject',2,'Delete Subject',NULL,NULL,1755351092,1755351092),('delete-transaction',2,'Delete Transaction',NULL,NULL,1755351092,1755351092),('guest',1,'Guest',NULL,NULL,1755351092,1755351092),('index-assessment',2,'Index Assessment',NULL,NULL,1755351092,1755351092),('index-asset',2,'Index Asset',NULL,NULL,1755351092,1755351092),('index-assetcategory',2,'Index Asset Category',NULL,NULL,1755351092,1755351092),('index-employment',2,'Index Employment',NULL,NULL,1755351092,1755351092),('index-group',2,'Index Group',NULL,NULL,1755351092,1755351092),('index-ispring-master',2,'Index Ispring Master',NULL,NULL,1755351092,1755351092),('index-ispring-transaction',2,'Index Ispring Transaction',NULL,NULL,1755351092,1755351092),('index-master',2,'Index Master',NULL,NULL,1755351092,1755351092),('index-office',2,'Index Office',NULL,NULL,1755351092,1755351092),('index-officemedia',2,'Index Office Media',NULL,NULL,1755351092,1755351092),('index-page',2,'Index Page',NULL,NULL,1755351092,1755351092),('index-participant',2,'Index Participant',NULL,NULL,1755351092,1755351092),('index-period',2,'Index Period',NULL,NULL,1755351092,1755351092),('index-profile',2,'Index Profile',NULL,NULL,1755351092,1755351092),('index-room',2,'Index Room',NULL,NULL,1755351092,1755351092),('index-schedule',2,'Index Schedule',NULL,NULL,1755351092,1755351092),('index-scheduledetail',2,'Index Schedule Detail',NULL,NULL,1755351092,1755351092),('index-scheduletoken',2,'Index Schedule Token',NULL,NULL,1755351092,1755351092),('index-staff',2,'Index Staff',NULL,NULL,1755351092,1755351092),('index-subject',2,'Index Subject',NULL,NULL,1755351092,1755351092),('index-transaction',2,'Index Transaction',NULL,NULL,1755351092,1755351092),('owner',1,'Company Owner',NULL,NULL,1755351092,1755351092),('participant',1,'Participant',NULL,NULL,1755351092,1755351092),('regular',1,'Regular',NULL,NULL,1755351092,1755351092),('report-assessment',2,'Report Assessment',NULL,NULL,1755351092,1755351092),('report-asset',2,'Report Asset',NULL,NULL,1755351092,1755351092),('report-assetcategory',2,'Report Asset Category',NULL,NULL,1755351092,1755351092),('report-group',2,'Report Group',NULL,NULL,1755351092,1755351092),('report-ispring-master',2,'Report Ispring Master',NULL,NULL,1755351092,1755351092),('report-ispring-transaction',2,'Report Ispring Transaction',NULL,NULL,1755351092,1755351092),('report-master',2,'Report Master',NULL,NULL,1755351092,1755351092),('report-participant',2,'Report Participant',NULL,NULL,1755351092,1755351092),('report-period',2,'Report Period',NULL,NULL,1755351092,1755351092),('report-room',2,'Report Room',NULL,NULL,1755351092,1755351092),('report-schedule',2,'Report Schedule',NULL,NULL,1755351092,1755351092),('report-scheduledetail',2,'Report Schedule Detail',NULL,NULL,1755351092,1755351092),('report-scheduletoken',2,'Report Schedule Token',NULL,NULL,1755351092,1755351092),('report-subject',2,'Report Subject',NULL,NULL,1755351092,1755351092),('report-transaction',2,'Report Transaction',NULL,NULL,1755351092,1755351092),('update-assessment',2,'Update Assessment',NULL,NULL,1755351092,1755351092),('update-asset',2,'Update Asset',NULL,NULL,1755351092,1755351092),('update-assetcategory',2,'Update Asset Category',NULL,NULL,1755351092,1755351092),('update-employment',2,'Update Employment',NULL,NULL,1755351092,1755351092),('update-group',2,'Update Group',NULL,NULL,1755351092,1755351092),('update-ispring-master',2,'Update Ispring Master',NULL,NULL,1755351092,1755351092),('update-ispring-transaction',2,'Update Ispring Transaction',NULL,NULL,1755351092,1755351092),('update-master',2,'Update Master',NULL,NULL,1755351092,1755351092),('update-office',2,'Update Office',NULL,NULL,1755351092,1755351092),('update-officemedia',2,'Update Office Media',NULL,NULL,1755351092,1755351092),('update-page',2,'Update Page',NULL,NULL,1755351092,1755351092),('update-participant',2,'Update Participant',NULL,NULL,1755351092,1755351092),('update-period',2,'Update Period',NULL,NULL,1755351092,1755351092),('update-profile',2,'Update Profile',NULL,NULL,1755351092,1755351092),('update-room',2,'Update Room',NULL,NULL,1755351092,1755351092),('update-schedule',2,'Update Schedule',NULL,NULL,1755351092,1755351092),('update-scheduledetail',2,'Update Schedule Detail',NULL,NULL,1755351092,1755351092),('update-scheduletoken',2,'Update Schedule Token',NULL,NULL,1755351092,1755351092),('update-staff',2,'Update Staff',NULL,NULL,1755351092,1755351092),('update-subject',2,'Update Subject',NULL,NULL,1755351092,1755351092),('update-transaction',2,'Update Transaction',NULL,NULL,1755351092,1755351092),('view-assessment',2,'View Assessment',NULL,NULL,1755351092,1755351092),('view-asset',2,'View Asset',NULL,NULL,1755351092,1755351092),('view-assetcategory',2,'View Asset Category',NULL,NULL,1755351092,1755351092),('view-employment',2,'View Employment',NULL,NULL,1755351092,1755351092),('view-group',2,'View Group',NULL,NULL,1755351092,1755351092),('view-ispring-master',2,'View Ispring Master',NULL,NULL,1755351092,1755351092),('view-ispring-transaction',2,'View Ispring Transaction',NULL,NULL,1755351092,1755351092),('view-master',2,'View Master',NULL,NULL,1755351092,1755351092),('view-office',2,'View Office',NULL,NULL,1755351092,1755351092),('view-officemedia',2,'View Office Media',NULL,NULL,1755351092,1755351092),('view-page',2,'View Page',NULL,NULL,1755351092,1755351092),('view-participant',2,'View Participant',NULL,NULL,1755351092,1755351092),('view-period',2,'View Period',NULL,NULL,1755351092,1755351092),('view-profile',2,'View Profile',NULL,NULL,1755351092,1755351092),('view-room',2,'View Room',NULL,NULL,1755351092,1755351092),('view-schedule',2,'View Schedule',NULL,NULL,1755351092,1755351092),('view-scheduledetail',2,'View Schedule Detail',NULL,NULL,1755351092,1755351092),('view-scheduletoken',2,'View Schedule Token',NULL,NULL,1755351092,1755351092),('view-staff',2,'View Staff',NULL,NULL,1755351092,1755351092),('view-subject',2,'View Subject',NULL,NULL,1755351092,1755351092),('view-transaction',2,'View Transaction',NULL,NULL,1755351092,1755351092);
/*!40000 ALTER TABLE `tx_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_auth_item_child`
--

DROP TABLE IF EXISTS `tx_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `fk-auth_item_child-child` (`child`),
  CONSTRAINT `fk-auth_item_child-child` FOREIGN KEY (`child`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-auth_item_child-parent` FOREIGN KEY (`parent`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_auth_item_child`
--

LOCK TABLES `tx_auth_item_child` WRITE;
/*!40000 ALTER TABLE `tx_auth_item_child` DISABLE KEYS */;
INSERT INTO `tx_auth_item_child` VALUES ('create-ispring-transaction','create-assessment'),('create-transaction','create-asset'),('create-master','create-assetcategory'),('create-master','create-employment'),('create-ispring-master','create-group'),('admin','create-ispring-master'),('owner','create-ispring-master'),('admin','create-ispring-transaction'),('owner','create-ispring-transaction'),('regular','create-ispring-transaction'),('admin','create-master'),('owner','create-master'),('create-master','create-office'),('create-master','create-officemedia'),('create-master','create-page'),('create-ispring-master','create-participant'),('create-ispring-master','create-period'),('create-master','create-profile'),('create-ispring-master','create-room'),('create-ispring-master','create-schedule'),('create-ispring-master','create-scheduledetail'),('create-ispring-master','create-scheduletoken'),('create-master','create-staff'),('create-ispring-master','create-subject'),('admin','create-transaction'),('owner','create-transaction'),('regular','create-transaction'),('index-transaction','create-user-regular'),('delete-ispring-transaction','delete-assessment'),('delete-transaction','delete-asset'),('delete-master','delete-assetcategory'),('delete-master','delete-employment'),('delete-ispring-master','delete-group'),('admin','delete-ispring-master'),('owner','delete-ispring-master'),('admin','delete-ispring-transaction'),('owner','delete-ispring-transaction'),('admin','delete-master'),('owner','delete-master'),('delete-master','delete-office'),('delete-master','delete-officemedia'),('delete-master','delete-page'),('delete-ispring-master','delete-participant'),('delete-ispring-master','delete-period'),('delete-master','delete-profile'),('delete-ispring-master','delete-room'),('delete-ispring-master','delete-schedule'),('delete-ispring-master','delete-scheduledetail'),('delete-ispring-master','delete-scheduletoken'),('delete-master','delete-staff'),('delete-ispring-master','delete-subject'),('admin','delete-transaction'),('owner','delete-transaction'),('regular','delete-transaction'),('index-ispring-transaction','index-assessment'),('guest','index-asset'),('index-transaction','index-asset'),('index-master','index-assetcategory'),('index-master','index-employment'),('index-ispring-master','index-group'),('admin','index-ispring-master'),('owner','index-ispring-master'),('regular','index-ispring-master'),('admin','index-ispring-transaction'),('owner','index-ispring-transaction'),('regular','index-ispring-transaction'),('admin','index-master'),('owner','index-master'),('regular','index-master'),('index-master','index-office'),('index-master','index-officemedia'),('index-master','index-page'),('index-ispring-master','index-participant'),('index-ispring-master','index-period'),('index-master','index-profile'),('index-ispring-master','index-room'),('index-ispring-master','index-schedule'),('index-ispring-master','index-scheduledetail'),('index-ispring-master','index-scheduletoken'),('index-master','index-staff'),('index-ispring-master','index-subject'),('admin','index-transaction'),('owner','index-transaction'),('regular','index-transaction'),('report-ispring-transaction','report-assessment'),('report-transaction','report-asset'),('report-master','report-assetcategory'),('report-ispring-master','report-group'),('admin','report-ispring-master'),('owner','report-ispring-master'),('regular','report-ispring-master'),('admin','report-ispring-transaction'),('owner','report-ispring-transaction'),('regular','report-ispring-transaction'),('admin','report-master'),('owner','report-master'),('report-ispring-master','report-participant'),('report-ispring-master','report-period'),('report-ispring-master','report-room'),('report-ispring-master','report-schedule'),('report-ispring-master','report-scheduledetail'),('report-ispring-master','report-scheduletoken'),('report-ispring-master','report-subject'),('admin','report-transaction'),('owner','report-transaction'),('regular','report-transaction'),('update-ispring-transaction','update-assessment'),('update-transaction','update-asset'),('update-master','update-assetcategory'),('update-master','update-employment'),('update-ispring-master','update-group'),('admin','update-ispring-master'),('owner','update-ispring-master'),('admin','update-ispring-transaction'),('owner','update-ispring-transaction'),('admin','update-master'),('owner','update-master'),('update-master','update-office'),('update-master','update-officemedia'),('update-master','update-page'),('update-ispring-master','update-participant'),('update-ispring-master','update-period'),('regular','update-profile'),('update-master','update-profile'),('update-ispring-master','update-room'),('update-ispring-master','update-schedule'),('update-ispring-master','update-scheduledetail'),('update-ispring-master','update-scheduletoken'),('update-master','update-staff'),('update-ispring-master','update-subject'),('admin','update-transaction'),('owner','update-transaction'),('regular','update-transaction'),('view-ispring-transaction','view-assessment'),('guest','view-asset'),('view-transaction','view-asset'),('view-master','view-assetcategory'),('view-master','view-employment'),('view-ispring-master','view-group'),('admin','view-ispring-master'),('owner','view-ispring-master'),('regular','view-ispring-master'),('admin','view-ispring-transaction'),('owner','view-ispring-transaction'),('regular','view-ispring-transaction'),('admin','view-master'),('owner','view-master'),('regular','view-master'),('view-master','view-office'),('view-master','view-officemedia'),('view-master','view-page'),('view-ispring-master','view-participant'),('view-ispring-master','view-period'),('regular','view-profile'),('view-master','view-profile'),('view-ispring-master','view-room'),('view-ispring-master','view-schedule'),('view-ispring-master','view-scheduledetail'),('view-ispring-master','view-scheduletoken'),('view-master','view-staff'),('view-ispring-master','view-subject'),('admin','view-transaction'),('owner','view-transaction'),('regular','view-transaction');
/*!40000 ALTER TABLE `tx_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_auth_rule`
--

DROP TABLE IF EXISTS `tx_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
INSERT INTO `tx_employment` VALUES (1,1,'Programmer','-',1,'2025-08-16 20:31:32','2025-08-16 20:31:32',1,1,NULL,NULL,NULL,0,NULL);
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
  `location` text,
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
  `description` text,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_migration`
--

LOCK TABLES `tx_migration` WRITE;
/*!40000 ALTER TABLE `tx_migration` DISABLE KEYS */;
INSERT INTO `tx_migration` VALUES ('m000000_000000_base',1755351088),('m250807_200101_create_all_tables',1755351092),('m250807_200102_insert_rbac_data',1755351092),('m250807_200103_insert_initial_data',1755351092);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_office`
--

LOCK TABLES `tx_office` WRITE;
/*!40000 ALTER TABLE `tx_office` DISABLE KEYS */;
INSERT INTO `tx_office` VALUES (1,'65a7fb0e28f7b','Daraspace','-',NULL,'ombakrinai@gmail.com','https://daraspace.com','-',NULL,NULL,'-','2025-08-16 20:31:32','2025-08-16 20:31:32',1,1,NULL,NULL,NULL,0,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_office_media`
--

LOCK TABLES `tx_office_media` WRITE;
/*!40000 ALTER TABLE `tx_office_media` DISABLE KEYS */;
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
-- Dumping data for table `tx_page`
--

LOCK TABLES `tx_page` WRITE;
/*!40000 ALTER TABLE `tx_page` DISABLE KEYS */;
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
  `description` text,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `timezone` varchar(40) DEFAULT NULL,
  `bio` text,
  `asset_name` varchar(200) DEFAULT NULL,
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
  CONSTRAINT `fk-profile-user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tx_profile_tx_group_FK` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tx_profile_tx_office_FK` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_profile`
--

LOCK TABLES `tx_profile` WRITE;
/*!40000 ALTER TABLE `tx_profile` DISABLE KEYS */;
INSERT INTO `tx_profile` VALUES (1,NULL,NULL,NULL,'Nanta Es',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-08-16 20:31:32','2025-08-16 20:31:32',NULL,NULL,NULL,NULL,NULL,NULL);
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
  `description` text,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `is_asset_available` int DEFAULT NULL COMMENT 'Available or not',
  `description` text,
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
  KEY `Fk_schedule_period` (`period_id`),
  KEY `Fk_schedule_group` (`group_id`),
  KEY `Fk_schedule_room` (`room_id`),
  KEY `Fk_schedule_staff` (`staff_id`),
  CONSTRAINT `Fk_schedule_group` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`),
  CONSTRAINT `Fk_schedule_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  CONSTRAINT `Fk_schedule_period` FOREIGN KEY (`period_id`) REFERENCES `tx_period` (`id`),
  CONSTRAINT `Fk_schedule_room` FOREIGN KEY (`room_id`) REFERENCES `tx_room` (`id`),
  CONSTRAINT `Fk_schedule_staff` FOREIGN KEY (`staff_id`) REFERENCES `tx_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `remark` text,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_schedule_detail`
--

LOCK TABLES `tx_schedule_detail` WRITE;
/*!40000 ALTER TABLE `tx_schedule_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_schedule_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_schedule_token`
--

DROP TABLE IF EXISTS `tx_schedule_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_schedule_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int DEFAULT NULL,
  `token` varchar(6) DEFAULT NULL,
  `token_interval` datetime DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `description` text,
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
  KEY `Fk_schedule_token_office` (`office_id`),
  CONSTRAINT `Fk_schedule_token_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_schedule_token`
--

LOCK TABLES `tx_schedule_token` WRITE;
/*!40000 ALTER TABLE `tx_schedule_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_schedule_token` ENABLE KEYS */;
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
INSERT INTO `tx_session` VALUES ('eenrvtql42aekm9b0a7bg36n96',1755352540,_binary '__flash|a:0:{}__returnUrl|s:51:\"http://localhost/yii2-quiz-ispring/admin/site/index\";');
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
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `data` text,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_social_account_user` (`user_id`),
  CONSTRAINT `fk_social_account_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `address` text,
  `asset_name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
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
  KEY `FK_tx_staff_office` (`office_id`),
  KEY `FK_tx_staff_employment` (`employment_id`),
  CONSTRAINT `FK_tx_staff_employment` FOREIGN KEY (`employment_id`) REFERENCES `tx_employment` (`id`),
  CONSTRAINT `FK_tx_staff_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_staff`
--

LOCK TABLES `tx_staff` WRITE;
/*!40000 ALTER TABLE `tx_staff` DISABLE KEYS */;
INSERT INTO `tx_staff` VALUES (1,1,1,1,'Nanta Es','Es','123','123',1,1,'-','662a80f98ab73.jpg','asdf','-','2025-08-16 20:31:32','2025-08-16 20:31:32',1,1,NULL,NULL,NULL,0,NULL);
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
  `description` text,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `confirmed_at` int DEFAULT NULL,
  `blocked_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `last_login_at` int DEFAULT NULL,
  `auth_tf_key` varchar(16) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `auth_tf_enabled` tinyint(1) DEFAULT '0',
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_user`
--

LOCK TABLES `tx_user` WRITE;
/*!40000 ALTER TABLE `tx_user` DISABLE KEYS */;
INSERT INTO `tx_user` VALUES (1,'admin','ombakrinai@gmail.com','$2y$12$1OrcfbmLlEy1lFwPTNVqZ.8mdXzEZboHOM1DWaT4/8GXe5jcwR5pG','e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm',NULL,NULL,0,NULL,NULL,1755351092,1755351092,NULL,NULL,1755351092,NULL,NULL,0,NULL,NULL,NULL);
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

-- Dump completed on 2025-08-16 20:32:15
