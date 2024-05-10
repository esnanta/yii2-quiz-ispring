/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.21-MariaDB : Database - yii2_quiz_ispring
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yii2_quiz_ispring` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `yii2_quiz_ispring`;

/*Table structure for table `tx_archive` */

DROP TABLE IF EXISTS `tx_archive`;

CREATE TABLE `tx_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `is_visible` int(11) DEFAULT NULL,
  `archive_type` int(11) DEFAULT NULL,
  `archive_category_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `date_issued` date DEFAULT NULL,
  `asset_name` varchar(200) DEFAULT NULL,
  `asset_url` varchar(500) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `view_counter` int(11) DEFAULT NULL,
  `download_counter` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_archive_category` (`archive_category_id`),
  KEY `FK_tx_archive_office` (`office_id`),
  CONSTRAINT `FK_tx_archive_category` FOREIGN KEY (`archive_category_id`) REFERENCES `tx_archive_category` (`id`),
  CONSTRAINT `FK_tx_archive_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tx_archive` */

insert  into `tx_archive`(`id`,`office_id`,`is_visible`,`archive_type`,`archive_category_id`,`title`,`date_issued`,`asset_name`,`asset_url`,`size`,`mime_type`,`view_counter`,`download_counter`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(3,1,1,2,5,'Data siswa XII 1 - 24','2024-01-17','_663c88d4e212d.xlsx',NULL,NULL,NULL,0,1,'','2024-01-17 23:29:35','2024-05-09 15:27:00',1,1,NULL,NULL,NULL,14,'99d2cde2b55511ee9384c858c0b7f92f');

/*Table structure for table `tx_archive_category` */

DROP TABLE IF EXISTS `tx_archive_category`;

CREATE TABLE `tx_archive_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_archive_category_office` (`office_id`),
  CONSTRAINT `FK_tx_archive_category_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_archive_category` */

insert  into `tx_archive_category`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(5,1,'Test',1,'','2024-01-17 23:20:28','2024-01-17 23:20:28',1,1,NULL,NULL,NULL,0,'53bcf82eb55411ee9384c858c0b7f92f');

/*Table structure for table `tx_assessment` */

DROP TABLE IF EXISTS `tx_assessment`;

CREATE TABLE `tx_assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `schedule_detail_id` int(11) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` tinyint(4) DEFAULT NULL,
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
  `is_completed` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_assessment_detail_office` (`office_id`),
  KEY `Fk_assessment_detail_assessment` (`schedule_id`),
  KEY `Fk_assessment_detail_participant` (`participant_id`),
  KEY `Fk_assessment_detail_schedule_detail` (`schedule_detail_id`),
  KEY `Fk_assessment_detail_subject` (`subject_id`),
  KEY `Fk_assessment_detail_period` (`period_id`),
  CONSTRAINT `Fk_assessment_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  CONSTRAINT `Fk_assessment_participant` FOREIGN KEY (`participant_id`) REFERENCES `tx_participant` (`id`),
  CONSTRAINT `Fk_assessment_period` FOREIGN KEY (`period_id`) REFERENCES `tx_period` (`id`),
  CONSTRAINT `Fk_assessment_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `tx_schedule` (`id`),
  CONSTRAINT `Fk_assessment_schedule_detail` FOREIGN KEY (`schedule_detail_id`) REFERENCES `tx_schedule_detail` (`id`),
  CONSTRAINT `Fk_assessment_subject` FOREIGN KEY (`subject_id`) REFERENCES `tx_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_assessment` */

/*Table structure for table `tx_auth_assignment` */

DROP TABLE IF EXISTS `tx_auth_assignment`;

CREATE TABLE `tx_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `tx_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_auth_assignment` */

insert  into `tx_auth_assignment`(`item_name`,`user_id`,`created_at`) values 
('admin','1',1713865235);

/*Table structure for table `tx_auth_item` */

DROP TABLE IF EXISTS `tx_auth_item`;

CREATE TABLE `tx_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `tx_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `tx_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_auth_item` */

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values 
('admin',1,'Admin',NULL,NULL,1713865235,1713865235),
('create-archive',2,'Create Archive',NULL,NULL,1713865235,1713865235),
('create-archivecategory',2,'Create Archive Category',NULL,NULL,1713865235,1713865235),
('create-assessment',2,'Create Assessment',NULL,NULL,1713865235,1713865235),
('create-assessmentdetail',2,'Create Assessment Detail',NULL,NULL,1713865235,1713865235),
('create-employment',2,'Create Employment',NULL,NULL,1713865235,1713865235),
('create-group',2,'Create Group',NULL,NULL,1713865235,1713865235),
('create-ispring-master',2,'Create Ispring Master',NULL,NULL,1713865235,1713865235),
('create-ispring-transaction',2,'Create Ispring Transaction',NULL,NULL,1713865235,1713865235),
('create-master',2,'Create Master',NULL,NULL,1713865235,1713865235),
('create-office',2,'Create Office',NULL,NULL,1713865235,1713865235),
('create-participant',2,'Create Participant',NULL,NULL,1713865235,1713865235),
('create-period',2,'Create Period',NULL,NULL,1713865235,1713865235),
('create-profile',2,'Create Profile',NULL,NULL,1713865235,1713865235),
('create-room',2,'Create Room',NULL,NULL,1713865235,1713865235),
('create-schedule',2,'Create Schedule',NULL,NULL,1713865235,1713865235),
('create-scheduledetail',2,'Create Schedule Detail',NULL,NULL,1713865235,1713865235),
('create-staff',2,'Create Staff',NULL,NULL,1713865235,1713865235),
('create-subject',2,'Create Subject',NULL,NULL,1713865235,1713865235),
('create-theme',2,'Create Theme',NULL,NULL,1713865235,1713865235),
('create-transaction',2,'Create Transaction',NULL,NULL,1713865235,1713865235),
('delete-archive',2,'Delete Archive',NULL,NULL,1713865235,1713865235),
('delete-archivecategory',2,'Delete Archive Category',NULL,NULL,1713865235,1713865235),
('delete-assessment',2,'Delete Assessment',NULL,NULL,1713865235,1713865235),
('delete-assessmentdetail',2,'Delete Assessment Detail',NULL,NULL,1713865235,1713865235),
('delete-employment',2,'Delete Employment',NULL,NULL,1713865235,1713865235),
('delete-group',2,'Delete Group',NULL,NULL,1713865235,1713865235),
('delete-ispring-master',2,'Delete Ispring Master',NULL,NULL,1713865235,1713865235),
('delete-ispring-transaction',2,'Delete Ispring Transaction',NULL,NULL,1713865235,1713865235),
('delete-master',2,'Delete Master',NULL,NULL,1713865235,1713865235),
('delete-office',2,'Delete Office',NULL,NULL,1713865235,1713865235),
('delete-participant',2,'Delete Participant',NULL,NULL,1713865235,1713865235),
('delete-period',2,'Delete Period',NULL,NULL,1713865235,1713865235),
('delete-profile',2,'Delete Profile',NULL,NULL,1713865235,1713865235),
('delete-room',2,'Delete Room',NULL,NULL,1713865235,1713865235),
('delete-schedule',2,'Delete Schedule',NULL,NULL,1713865235,1713865235),
('delete-scheduledetail',2,'Delete Schedule Detail',NULL,NULL,1713865235,1713865235),
('delete-staff',2,'Delete Staff',NULL,NULL,1713865235,1713865235),
('delete-subject',2,'Delete Subject',NULL,NULL,1713865235,1713865235),
('delete-theme',2,'Delete Theme',NULL,NULL,1713865235,1713865235),
('delete-transaction',2,'Delete Transaction',NULL,NULL,1713865235,1713865235),
('guest',1,'Guest',NULL,NULL,1713865235,1713865235),
('index-archive',2,'Index Archive',NULL,NULL,1713865235,1713865235),
('index-archivecategory',2,'Index Archive Category',NULL,NULL,1713865235,1713865235),
('index-assessment',2,'Index Assessment',NULL,NULL,1713865235,1713865235),
('index-assessmentdetail',2,'Index Assessment Detail',NULL,NULL,1713865235,1713865235),
('index-employment',2,'Index Employment',NULL,NULL,1713865235,1713865235),
('index-group',2,'Index Group',NULL,NULL,1713865235,1713865235),
('index-ispring-master',2,'Index Ispring Master',NULL,NULL,1713865235,1713865235),
('index-ispring-transaction',2,'Index Ispring Transaction',NULL,NULL,1713865235,1713865235),
('index-master',2,'Index Master',NULL,NULL,1713865235,1713865235),
('index-office',2,'Index Office',NULL,NULL,1713865235,1713865235),
('index-participant',2,'Index Participant',NULL,NULL,1713865235,1713865235),
('index-period',2,'Index Period',NULL,NULL,1713865235,1713865235),
('index-profile',2,'Index Profile',NULL,NULL,1713865235,1713865235),
('index-room',2,'Index Room',NULL,NULL,1713865235,1713865235),
('index-schedule',2,'Index Schedule',NULL,NULL,1713865235,1713865235),
('index-scheduledetail',2,'Index Schedule Detail',NULL,NULL,1713865235,1713865235),
('index-staff',2,'Index Staff',NULL,NULL,1713865235,1713865235),
('index-subject',2,'Index Subject',NULL,NULL,1713865235,1713865235),
('index-theme',2,'Index Theme',NULL,NULL,1713865235,1713865235),
('index-transaction',2,'Index Transaction',NULL,NULL,1713865235,1713865235),
('owner',1,'Company Owner',NULL,NULL,1713865235,1713865235),
('participant',1,'Participant',NULL,NULL,1713865235,1713865235),
('reguler',1,'Reguler',NULL,NULL,1713865235,1713865235),
('report-archive',2,'Report Archive',NULL,NULL,1713865235,1713865235),
('report-archivecategory',2,'Report Archive Category',NULL,NULL,1713865235,1713865235),
('report-assessment',2,'Report Assessment',NULL,NULL,1713865235,1713865235),
('report-assessmentdetail',2,'Report Assessment Detail',NULL,NULL,1713865235,1713865235),
('report-group',2,'Report Group',NULL,NULL,1713865235,1713865235),
('report-ispring-master',2,'Report Ispring Master',NULL,NULL,1713865235,1713865235),
('report-ispring-transaction',2,'Report Ispring Transaction',NULL,NULL,1713865235,1713865235),
('report-master',2,'Report Master',NULL,NULL,1713865235,1713865235),
('report-participant',2,'Report Participant',NULL,NULL,1713865235,1713865235),
('report-period',2,'Report Period',NULL,NULL,1713865235,1713865235),
('report-room',2,'Report Room',NULL,NULL,1713865235,1713865235),
('report-schedule',2,'Report Schedule',NULL,NULL,1713865235,1713865235),
('report-scheduledetail',2,'Report Schedule Detail',NULL,NULL,1713865235,1713865235),
('report-subject',2,'Report Subject',NULL,NULL,1713865235,1713865235),
('report-transaction',2,'Report Transaction',NULL,NULL,1713865235,1713865235),
('update-archive',2,'Update Archive',NULL,NULL,1713865235,1713865235),
('update-archivecategory',2,'Update Archive Category',NULL,NULL,1713865235,1713865235),
('update-assessment',2,'Update Assessment',NULL,NULL,1713865235,1713865235),
('update-assessmentdetail',2,'Update Assessment  Detail',NULL,NULL,1713865235,1713865235),
('update-employment',2,'Update Employment',NULL,NULL,1713865235,1713865235),
('update-group',2,'Update Group',NULL,NULL,1713865235,1713865235),
('update-ispring-master',2,'Update Ispring Master',NULL,NULL,1713865235,1713865235),
('update-ispring-transaction',2,'Update Ispring Transaction',NULL,NULL,1713865235,1713865235),
('update-master',2,'Update Master',NULL,NULL,1713865235,1713865235),
('update-office',2,'Update Office',NULL,NULL,1713865235,1713865235),
('update-participant',2,'Update Participant',NULL,NULL,1713865235,1713865235),
('update-period',2,'Update Period',NULL,NULL,1713865235,1713865235),
('update-profile',2,'Update Profile',NULL,NULL,1713865235,1713865235),
('update-room',2,'Update Room',NULL,NULL,1713865235,1713865235),
('update-schedule',2,'Update Schedule',NULL,NULL,1713865235,1713865235),
('update-scheduledetail',2,'Update Schedule Detail',NULL,NULL,1713865235,1713865235),
('update-staff',2,'Update Staff',NULL,NULL,1713865235,1713865235),
('update-subject',2,'Update Subject',NULL,NULL,1713865235,1713865235),
('update-theme',2,'Update Theme',NULL,NULL,1713865235,1713865235),
('update-transaction',2,'Update Transaction',NULL,NULL,1713865235,1713865235),
('view-archive',2,'View Archive',NULL,NULL,1713865235,1713865235),
('view-archivecategory',2,'View Archive Category',NULL,NULL,1713865235,1713865235),
('view-assessment',2,'View Assessment',NULL,NULL,1713865235,1713865235),
('view-assessmentdetail',2,'View Assessment Detail',NULL,NULL,1713865235,1713865235),
('view-employment',2,'View Employment',NULL,NULL,1713865235,1713865235),
('view-group',2,'View Group',NULL,NULL,1713865235,1713865235),
('view-ispring-master',2,'View Ispring Master',NULL,NULL,1713865235,1713865235),
('view-ispring-transaction',2,'View Ispring Transaction',NULL,NULL,1713865235,1713865235),
('view-master',2,'View Master',NULL,NULL,1713865235,1713865235),
('view-office',2,'View Office',NULL,NULL,1713865235,1713865235),
('view-participant',2,'View Participant',NULL,NULL,1713865235,1713865235),
('view-period',2,'View Period',NULL,NULL,1713865235,1713865235),
('view-profile',2,'View Profile',NULL,NULL,1713865235,1713865235),
('view-room',2,'View Room',NULL,NULL,1713865235,1713865235),
('view-schedule',2,'View Schedule',NULL,NULL,1713865235,1713865235),
('view-scheduledetail',2,'View Schedule Detail',NULL,NULL,1713865235,1713865235),
('view-staff',2,'View Staff',NULL,NULL,1713865235,1713865235),
('view-subject',2,'View Subject',NULL,NULL,1713865235,1713865235),
('view-theme',2,'View Theme',NULL,NULL,1713865235,1713865235),
('view-transaction',2,'View Transaction',NULL,NULL,1713865235,1713865235);

/*Table structure for table `tx_auth_item_child` */

DROP TABLE IF EXISTS `tx_auth_item_child`;

CREATE TABLE `tx_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `tx_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tx_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_auth_item_child` */

insert  into `tx_auth_item_child`(`parent`,`child`) values 
('admin','create-ispring-master'),
('admin','create-ispring-transaction'),
('admin','create-master'),
('admin','create-transaction'),
('admin','delete-ispring-master'),
('admin','delete-ispring-transaction'),
('admin','delete-master'),
('admin','delete-transaction'),
('admin','index-ispring-master'),
('admin','index-ispring-transaction'),
('admin','index-master'),
('admin','index-transaction'),
('admin','report-ispring-master'),
('admin','report-ispring-transaction'),
('admin','report-master'),
('admin','report-transaction'),
('admin','update-ispring-master'),
('admin','update-ispring-transaction'),
('admin','update-master'),
('admin','update-transaction'),
('admin','view-ispring-master'),
('admin','view-ispring-transaction'),
('admin','view-master'),
('admin','view-transaction'),
('create-ispring-master','create-group'),
('create-ispring-master','create-participant'),
('create-ispring-master','create-period'),
('create-ispring-master','create-room'),
('create-ispring-master','create-schedule'),
('create-ispring-master','create-scheduledetail'),
('create-ispring-master','create-subject'),
('create-ispring-transaction','create-assessment'),
('create-ispring-transaction','create-assessmentdetail'),
('create-master','create-archivecategory'),
('create-master','create-employment'),
('create-master','create-office'),
('create-master','create-profile'),
('create-master','create-staff'),
('create-master','create-theme'),
('create-transaction','create-archive'),
('delete-ispring-master','delete-group'),
('delete-ispring-master','delete-participant'),
('delete-ispring-master','delete-period'),
('delete-ispring-master','delete-room'),
('delete-ispring-master','delete-schedule'),
('delete-ispring-master','delete-scheduledetail'),
('delete-ispring-master','delete-subject'),
('delete-ispring-transaction','delete-assessment'),
('delete-ispring-transaction','delete-assessmentdetail'),
('delete-master','delete-archivecategory'),
('delete-master','delete-employment'),
('delete-master','delete-office'),
('delete-master','delete-profile'),
('delete-master','delete-staff'),
('delete-master','delete-theme'),
('delete-transaction','delete-archive'),
('guest','index-archive'),
('guest','view-archive'),
('index-ispring-master','index-group'),
('index-ispring-master','index-participant'),
('index-ispring-master','index-period'),
('index-ispring-master','index-room'),
('index-ispring-master','index-schedule'),
('index-ispring-master','index-scheduledetail'),
('index-ispring-master','index-subject'),
('index-ispring-transaction','index-assessment'),
('index-ispring-transaction','index-assessmentdetail'),
('index-master','index-archivecategory'),
('index-master','index-employment'),
('index-master','index-office'),
('index-master','index-profile'),
('index-master','index-staff'),
('index-master','index-theme'),
('index-transaction','index-archive'),
('owner','create-ispring-master'),
('owner','create-ispring-transaction'),
('owner','create-master'),
('owner','create-transaction'),
('owner','delete-ispring-master'),
('owner','delete-ispring-transaction'),
('owner','delete-master'),
('owner','delete-transaction'),
('owner','index-ispring-master'),
('owner','index-ispring-transaction'),
('owner','index-master'),
('owner','index-transaction'),
('owner','report-ispring-master'),
('owner','report-ispring-transaction'),
('owner','report-master'),
('owner','report-transaction'),
('owner','update-ispring-master'),
('owner','update-ispring-transaction'),
('owner','update-master'),
('owner','update-transaction'),
('owner','view-ispring-master'),
('owner','view-ispring-transaction'),
('owner','view-master'),
('owner','view-transaction'),
('reguler','create-ispring-transaction'),
('reguler','create-transaction'),
('reguler','delete-transaction'),
('reguler','index-ispring-master'),
('reguler','index-ispring-transaction'),
('reguler','index-master'),
('reguler','index-transaction'),
('reguler','report-ispring-master'),
('reguler','report-ispring-transaction'),
('reguler','report-transaction'),
('reguler','update-profile'),
('reguler','update-transaction'),
('reguler','view-ispring-master'),
('reguler','view-ispring-transaction'),
('reguler','view-master'),
('reguler','view-profile'),
('reguler','view-transaction'),
('report-ispring-master','report-group'),
('report-ispring-master','report-participant'),
('report-ispring-master','report-period'),
('report-ispring-master','report-room'),
('report-ispring-master','report-schedule'),
('report-ispring-master','report-scheduledetail'),
('report-ispring-master','report-subject'),
('report-ispring-transaction','report-assessment'),
('report-ispring-transaction','report-assessmentdetail'),
('report-master','report-archivecategory'),
('report-transaction','report-archive'),
('update-ispring-master','update-group'),
('update-ispring-master','update-participant'),
('update-ispring-master','update-period'),
('update-ispring-master','update-room'),
('update-ispring-master','update-schedule'),
('update-ispring-master','update-scheduledetail'),
('update-ispring-master','update-subject'),
('update-ispring-transaction','update-assessment'),
('update-ispring-transaction','update-assessmentdetail'),
('update-master','update-archivecategory'),
('update-master','update-employment'),
('update-master','update-office'),
('update-master','update-profile'),
('update-master','update-staff'),
('update-master','update-theme'),
('update-transaction','update-archive'),
('view-ispring-master','view-group'),
('view-ispring-master','view-participant'),
('view-ispring-master','view-period'),
('view-ispring-master','view-room'),
('view-ispring-master','view-schedule'),
('view-ispring-master','view-scheduledetail'),
('view-ispring-master','view-subject'),
('view-ispring-transaction','view-assessment'),
('view-ispring-transaction','view-assessmentdetail'),
('view-master','view-archivecategory'),
('view-master','view-employment'),
('view-master','view-office'),
('view-master','view-profile'),
('view-master','view-staff'),
('view-master','view-theme'),
('view-transaction','view-archive');

/*Table structure for table `tx_auth_rule` */

DROP TABLE IF EXISTS `tx_auth_rule`;

CREATE TABLE `tx_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_auth_rule` */

/*Table structure for table `tx_counter` */

DROP TABLE IF EXISTS `tx_counter`;

CREATE TABLE `tx_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(15) NOT NULL,
  `counter` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_counter_office` (`office_id`),
  CONSTRAINT `Fk_counter_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tx_counter` */

insert  into `tx_counter`(`id`,`office_id`,`title`,`counter`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,'SCD',81,'2024-05-08 22:28:20','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,80,'99e6a1230d4f11efa055c858c0b7f92f');

/*Table structure for table `tx_dashblock` */

DROP TABLE IF EXISTS `tx_dashblock`;

CREATE TABLE `tx_dashblock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `actions` text DEFAULT NULL,
  `weight` int(11) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(4) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_dashblock` */

/*Table structure for table `tx_employment` */

DROP TABLE IF EXISTS `tx_employment`;

CREATE TABLE `tx_employment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sequence` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_tx_employment_office` (`office_id`),
  CONSTRAINT `Fk_tx_employment_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tx_employment` */

insert  into `tx_employment`(`id`,`office_id`,`title`,`description`,`sequence`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,'Manajer','-',1,'2023-08-22 22:30:26','2023-08-22 22:31:50',1,1,NULL,NULL,NULL,1,NULL);

/*Table structure for table `tx_event` */

DROP TABLE IF EXISTS `tx_event`;

CREATE TABLE `tx_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `location` tinytext DEFAULT NULL,
  `content` text DEFAULT NULL,
  `view_counter` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_event` */

/*Table structure for table `tx_group` */

DROP TABLE IF EXISTS `tx_group`;

CREATE TABLE `tx_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` tinyint(4) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_group_office` (`office_id`),
  CONSTRAINT `Fk_group_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_group` */

insert  into `tx_group`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(2,1,'X1',1,'Kelas X1','2024-05-09 19:56:34','2024-05-09 19:56:34',1,1,NULL,NULL,NULL,0,'90dc73950e0311ef8837c858c0b7f92f'),
(3,1,'X3',2,'Kelas X3','2024-05-09 19:56:34','2024-05-09 19:56:34',1,1,NULL,NULL,NULL,0,'90dd0a9c0e0311ef8837c858c0b7f92f'),
(4,1,'XI 2',3,'Kelas XI 2','2024-05-09 19:56:34','2024-05-09 19:56:34',1,1,NULL,NULL,NULL,0,'90dd8cfe0e0311ef8837c858c0b7f92f'),
(5,1,'XI 3',4,'Kelas XI 3','2024-05-09 19:56:34','2024-05-09 19:56:34',1,1,NULL,NULL,NULL,0,'90de14700e0311ef8837c858c0b7f92f'),
(6,1,'XII-1',5,'Kelas XII-1','2024-05-09 19:56:34','2024-05-09 19:56:34',1,1,NULL,NULL,NULL,0,'90de7a230e0311ef8837c858c0b7f92f');

/*Table structure for table `tx_migration` */

DROP TABLE IF EXISTS `tx_migration`;

CREATE TABLE `tx_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_migration` */

/*Table structure for table `tx_office` */

DROP TABLE IF EXISTS `tx_office`;

CREATE TABLE `tx_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `unique_id` varchar(15) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `fax_number` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `google_plus` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_tx_office_user` (`user_id`),
  CONSTRAINT `Fk_tx_office_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tx_office` */

insert  into `tx_office`(`id`,`user_id`,`unique_id`,`title`,`phone_number`,`fax_number`,`email`,`web`,`address`,`latitude`,`longitude`,`facebook`,`google_plus`,`instagram`,`twitter`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,'65a7fb0e28f7b','Es Nanta ID','-',NULL,'ombakrinai@gmail.com','esnanta.my.id','-',NULL,NULL,NULL,NULL,NULL,NULL,'-','2023-08-18 22:25:10','2024-01-17 23:06:53',1,1,NULL,NULL,NULL,3,NULL);

/*Table structure for table `tx_participant` */

DROP TABLE IF EXISTS `tx_participant`;

CREATE TABLE `tx_participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `identity_number` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `auth_key` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_participant_office` (`office_id`),
  KEY `Fk_participant_group` (`group_id`),
  CONSTRAINT `Fk_participant_group` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`),
  CONSTRAINT `Fk_participant_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_participant` */

insert  into `tx_participant`(`id`,`office_id`,`group_id`,`title`,`identity_number`,`username`,`password`,`email`,`status`,`last_login_at`,`auth_key`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(119,1,2,'Hailie Borer','mclaughlin.meredith@gmail.com','Umclaughlin.meredith@gmail.com','8b7af','zulauf.jeffery@gmail.com',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd6a0a540e0311ef8837c858c0b7f92f'),
(120,1,2,'Rae Gerlach','kirlin.stevie@yahoo.com','Ukirlin.stevie@yahoo.com','88eee','ehahn@yahoo.com',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd6ad79f0e0311ef8837c858c0b7f92f'),
(121,1,2,'Lenny Kerluke','xabernathy@blick.biz','Uxabernathy@blick.biz','3fe2b','mariah36@bednar.info',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd6b573d0e0311ef8837c858c0b7f92f'),
(122,1,4,'Ramon Brown','elmore.haley@yahoo.com','Uelmore.haley@yahoo.com','73ba4','maximillia.effertz@denesik.org',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd6d82da0e0311ef8837c858c0b7f92f'),
(123,1,4,'Tatum Stark','veda.lowe@yahoo.com','Uveda.lowe@yahoo.com','2d5b7','jordyn14@crist.com',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd6dfcd50e0311ef8837c858c0b7f92f'),
(124,1,4,'Darrin Crist','ewunsch@yost.com','Uewunsch@yost.com','ce9ae','xjones@gmail.com',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd6e5cac0e0311ef8837c858c0b7f92f'),
(125,1,5,'Norma Casper','rowland36@hotmail.com','Urowland36@hotmail.com','e0dc7','matt.howe@wintheiser.org',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd6ff2490e0311ef8837c858c0b7f92f'),
(126,1,5,'Mortimer Ankunding','mbernier@yahoo.com','Umbernier@yahoo.com','c76da','zbeier@gmail.com',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd70b3a50e0311ef8837c858c0b7f92f'),
(127,1,5,'Savannah Bosco','jacobi.nash@hyatt.info','Ujacobi.nash@hyatt.info','3d495','qfeest@hoeger.com',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd7112d80e0311ef8837c858c0b7f92f'),
(128,1,6,'Garrick Simonis','julianne18@gmail.com','Ujulianne18@gmail.com','28d03','ldouglas@gmail.com',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd719e8a0e0311ef8837c858c0b7f92f'),
(129,1,6,'Sebastian Schuster','anderson.rhoda@yahoo.com','Uanderson.rhoda@yahoo.com','6f3a2','kendall.satterfield@gmail.com',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd72ce7e0e0311ef8837c858c0b7f92f'),
(130,1,6,'Anahi Hintz','opredovic@yahoo.com','Uopredovic@yahoo.com','7c95f','kevin.stanton@hotmail.com',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd7335ad0e0311ef8837c858c0b7f92f'),
(131,1,6,'Immanuel Hickle','padberg.katherine@yahoo.com','Upadberg.katherine@yahoo.com','10bcf','toy01@hammes.org',2,NULL,NULL,'2024-05-09 19:59:37','2024-05-09 19:59:37',1,1,NULL,NULL,NULL,0,'fd73b0b60e0311ef8837c858c0b7f92f');

/*Table structure for table `tx_period` */

DROP TABLE IF EXISTS `tx_period`;

CREATE TABLE `tx_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` tinyint(4) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_period_office` (`office_id`),
  CONSTRAINT `Fk_period_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_period` */

insert  into `tx_period`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,NULL,'Semester 1',1,'','2024-02-14 09:39:06','2024-02-14 09:39:06',1,1,NULL,NULL,NULL,0,'39503330cae211ee8332c858c0b7f92f'),
(2,1,'Semester 1',1,'','2024-02-14 09:43:28','2024-02-14 09:43:28',1,1,NULL,NULL,NULL,0,'d52bfb6acae211ee8332c858c0b7f92f'),
(3,1,'Semester 2',2,'','2024-02-14 09:46:25','2024-02-14 09:46:25',1,1,NULL,NULL,NULL,0,'3ee7aa1bcae311ee8332c858c0b7f92f');

/*Table structure for table `tx_profile` */

DROP TABLE IF EXISTS `tx_profile`;

CREATE TABLE `tx_profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_profile` */

insert  into `tx_profile`(`user_id`,`name`,`public_email`,`gravatar_email`,`gravatar_id`,`location`,`website`,`timezone`,`bio`,`file_name`) values 
(1,'Nanta Es',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `tx_quote` */

DROP TABLE IF EXISTS `tx_quote`;

CREATE TABLE `tx_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_quote` */

/*Table structure for table `tx_room` */

DROP TABLE IF EXISTS `tx_room`;

CREATE TABLE `tx_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` tinyint(4) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_room_office` (`office_id`),
  CONSTRAINT `Fk_room_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_room` */

insert  into `tx_room`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(2,1,'Ruang 1',1,'-','2024-01-16 13:36:04','2024-01-16 13:36:04',1,1,NULL,NULL,NULL,0,'8607a981b43911ee80c4c858c0b7f92f');

/*Table structure for table `tx_schedule` */

DROP TABLE IF EXISTS `tx_schedule`;

CREATE TABLE `tx_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `token` varchar(6) DEFAULT NULL,
  `token_time` datetime DEFAULT NULL,
  `is_asset` tinyint(4) DEFAULT NULL COMMENT 'Available or not',
  `description` tinytext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_schedule` */

insert  into `tx_schedule`(`id`,`office_id`,`title`,`period_id`,`group_id`,`room_id`,`staff_id`,`date_start`,`date_end`,`token`,`token_time`,`is_asset`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(77,1,'00077-Nanta Es',2,2,2,1,'2024-05-09 21:22:22','2024-05-09 23:22:22','200541','2024-05-09 21:22:22',NULL,NULL,'2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,1,'8d020d350e0f11ef8837c858c0b7f92f'),
(78,1,'00078-Nanta Es',2,3,2,1,'2024-05-10 00:22:22','2024-05-10 02:22:22','904033','2024-05-10 00:22:22',NULL,NULL,'2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,1,'8d091dd40e0f11ef8837c858c0b7f92f'),
(79,1,'00079-Nanta Es',2,4,2,1,'2024-05-10 03:22:22','2024-05-10 05:22:22','345987','2024-05-10 03:22:22',NULL,NULL,'2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,1,'8d0e085c0e0f11ef8837c858c0b7f92f'),
(80,1,'00080-Nanta Es',2,5,2,1,'2024-05-10 06:22:22','2024-05-10 08:22:22','641619','2024-05-10 06:22:22',NULL,NULL,'2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,1,'8d1198ff0e0f11ef8837c858c0b7f92f'),
(81,1,'00081-Nanta Es',2,6,2,1,'2024-05-10 09:22:22','2024-05-10 11:22:22','393402','2024-05-10 09:22:22',NULL,NULL,'2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,1,'8d14d35e0e0f11ef8837c858c0b7f92f');

/*Table structure for table `tx_schedule_detail` */

DROP TABLE IF EXISTS `tx_schedule_detail`;

CREATE TABLE `tx_schedule_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` tinyint(4) DEFAULT NULL,
  `remark` tinytext DEFAULT NULL,
  `asset_name` varchar(100) DEFAULT NULL,
  `asset_url` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_schedule_detail_office` (`office_id`),
  KEY `Fk_schedule_detail_schedule` (`schedule_id`),
  KEY `Fk_schedule_detail_subject` (`subject_id`),
  CONSTRAINT `Fk_schedule_detail_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  CONSTRAINT `Fk_schedule_detail_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `tx_schedule` (`id`),
  CONSTRAINT `Fk_schedule_detail_subject` FOREIGN KEY (`subject_id`) REFERENCES `tx_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_schedule_detail` */

insert  into `tx_schedule_detail`(`id`,`office_id`,`schedule_id`,`subject_id`,`subject_type`,`remark`,`asset_name`,`asset_url`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(378,1,77,4,NULL,'Matematika',NULL,'/uploads/schedule/65a7fb0e28f7b/20240509-Matematika-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d0549560e0f11ef8837c858c0b7f92f'),
(379,1,77,5,NULL,'Kimia Numerasi',NULL,'/uploads/schedule/65a7fb0e28f7b/20240509-Kimia Numerasi-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d0606600e0f11ef8837c858c0b7f92f'),
(380,1,77,6,NULL,'Kimia Literasi',NULL,'/uploads/schedule/65a7fb0e28f7b/20240509-Kimia Literasi-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d06c8ef0e0f11ef8837c858c0b7f92f'),
(381,1,77,7,NULL,'Kimia Umum',NULL,'/uploads/schedule/65a7fb0e28f7b/20240509-Kimia Umum-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d07735f0e0f11ef8837c858c0b7f92f'),
(382,1,77,8,NULL,'Sejarah',NULL,'/uploads/schedule/65a7fb0e28f7b/20240509-Sejarah-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d07f93e0e0f11ef8837c858c0b7f92f'),
(383,1,78,4,NULL,'Matematika',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Matematika-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d09d5cc0e0f11ef8837c858c0b7f92f'),
(384,1,78,5,NULL,'Kimia Numerasi',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Numerasi-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d0a4e0c0e0f11ef8837c858c0b7f92f'),
(385,1,78,6,NULL,'Kimia Literasi',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Literasi-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d0ac5310e0f11ef8837c858c0b7f92f'),
(386,1,78,7,NULL,'Kimia Umum',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Umum-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d0b9ea80e0f11ef8837c858c0b7f92f'),
(387,1,78,8,NULL,'Sejarah',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Sejarah-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d0c7cc00e0f11ef8837c858c0b7f92f'),
(388,1,79,4,NULL,'Matematika',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Matematika-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d0ed0700e0f11ef8837c858c0b7f92f'),
(389,1,79,5,NULL,'Kimia Numerasi',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Numerasi-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d0f4e070e0f11ef8837c858c0b7f92f'),
(390,1,79,6,NULL,'Kimia Literasi',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Literasi-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d0fc3200e0f11ef8837c858c0b7f92f'),
(391,1,79,7,NULL,'Kimia Umum',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Umum-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d1041a30e0f11ef8837c858c0b7f92f'),
(392,1,79,8,NULL,'Sejarah',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Sejarah-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d10c4e80e0f11ef8837c858c0b7f92f'),
(393,1,80,4,NULL,'Matematika',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Matematika-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d12452c0e0f11ef8837c858c0b7f92f'),
(394,1,80,5,NULL,'Kimia Numerasi',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Numerasi-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d12b36b0e0f11ef8837c858c0b7f92f'),
(395,1,80,6,NULL,'Kimia Literasi',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Literasi-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d133b880e0f11ef8837c858c0b7f92f'),
(396,1,80,7,NULL,'Kimia Umum',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Umum-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d13aad60e0f11ef8837c858c0b7f92f'),
(397,1,80,8,NULL,'Sejarah',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Sejarah-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d1407f30e0f11ef8837c858c0b7f92f'),
(398,1,81,4,NULL,'Matematika',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Matematika-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d158ce40e0f11ef8837c858c0b7f92f'),
(399,1,81,5,NULL,'Kimia Numerasi',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Numerasi-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d16023d0e0f11ef8837c858c0b7f92f'),
(400,1,81,6,NULL,'Kimia Literasi',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Literasi-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d166a5f0e0f11ef8837c858c0b7f92f'),
(401,1,81,7,NULL,'Kimia Umum',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Kimia Umum-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d16f7cf0e0f11ef8837c858c0b7f92f'),
(402,1,81,8,NULL,'Sejarah',NULL,'/uploads/schedule/65a7fb0e28f7b/20240510-Sejarah-//index.html','2024-05-09 21:22:22','2024-05-09 21:22:22',1,1,NULL,NULL,NULL,0,'8d176d7f0e0f11ef8837c858c0b7f92f');

/*Table structure for table `tx_session` */

DROP TABLE IF EXISTS `tx_session`;

CREATE TABLE `tx_session` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_session` */

insert  into `tx_session`(`id`,`expire`,`data`) values 
('8uf0ag3c0prp44gtu0ckhfo6lr',1715310308,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('ff91gj3bstianlevuofja2bc05',1715309195,'__flash|a:0:{}'),
('qc9bopvcbcs24sig6lkmrf1ie6',1715266149,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";');

/*Table structure for table `tx_site_link` */

DROP TABLE IF EXISTS `tx_site_link`;

CREATE TABLE `tx_site_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_site_link` */

/*Table structure for table `tx_social_account` */

DROP TABLE IF EXISTS `tx_social_account`;

CREATE TABLE `tx_social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_social_account_provider_client_id` (`provider`,`client_id`),
  UNIQUE KEY `idx_social_account_code` (`code`),
  KEY `fk_social_account_user` (`user_id`),
  CONSTRAINT `fk_social_account_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_social_account` */

/*Table structure for table `tx_staff` */

DROP TABLE IF EXISTS `tx_staff`;

CREATE TABLE `tx_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  `employment_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `initial` varchar(10) DEFAULT NULL,
  `identity_number` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `gender_status` int(11) DEFAULT NULL,
  `active_status` int(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `asset_name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_staff_gender` (`gender_status`),
  KEY `FK_tx_staff_role` (`employment_id`),
  KEY `FK_tx_staff_office` (`office_id`),
  CONSTRAINT `FK_tx_staff_employment` FOREIGN KEY (`employment_id`) REFERENCES `tx_employment` (`id`),
  CONSTRAINT `FK_tx_staff_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tx_staff` */

insert  into `tx_staff`(`id`,`user_id`,`office_id`,`employment_id`,`title`,`initial`,`identity_number`,`phone_number`,`gender_status`,`active_status`,`address`,`asset_name`,`email`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,1,1,'Nanta Es','Ade','123','123',1,1,'-','662a80f98ab73.jpg','asdf','-','2023-08-23 22:29:45','2024-04-25 23:12:43',1,1,NULL,NULL,NULL,25,NULL);

/*Table structure for table `tx_subject` */

DROP TABLE IF EXISTS `tx_subject`;

CREATE TABLE `tx_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` tinyint(4) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_subject_office` (`office_id`),
  CONSTRAINT `Fk_subject_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_subject` */

insert  into `tx_subject`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(4,1,'Matematika',1,'Matematika','2024-05-09 18:37:36','2024-05-09 18:37:36',1,1,NULL,NULL,NULL,0,'884dd3cf0df811ef8837c858c0b7f92f'),
(5,1,'Kimia Numerasi',2,'Kimia Numerasi','2024-05-09 18:37:36','2024-05-09 18:37:36',1,1,NULL,NULL,NULL,0,'884e668a0df811ef8837c858c0b7f92f'),
(6,1,'Kimia Literasi',2,'Kimia Literasi','2024-05-09 18:37:36','2024-05-09 18:37:36',1,1,NULL,NULL,NULL,0,'884ed6c90df811ef8837c858c0b7f92f'),
(7,1,'Kimia Umum',3,'Kimia Umum','2024-05-09 18:37:36','2024-05-09 18:37:36',1,1,NULL,NULL,NULL,0,'884f61d30df811ef8837c858c0b7f92f'),
(8,1,'Sejarah',3,'Sejarah','2024-05-09 18:37:36','2024-05-09 18:37:36',1,1,NULL,NULL,NULL,0,'884fe7380df811ef8837c858c0b7f92f');

/*Table structure for table `tx_tag` */

DROP TABLE IF EXISTS `tx_tag`;

CREATE TABLE `tx_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(150) NOT NULL,
  `frequency` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_tag` */

/*Table structure for table `tx_theme` */

DROP TABLE IF EXISTS `tx_theme`;

CREATE TABLE `tx_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `theme_type` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `asset_name` varchar(200) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_content_theme` (`office_id`),
  CONSTRAINT `Fx_tx_theme_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tx_theme` */

insert  into `tx_theme`(`id`,`office_id`,`title`,`theme_type`,`content`,`asset_name`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,'Logo Frontend Header',1,NULL,NULL,'Logo Frontend Header','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'d9da4765-0d47-11ef-a055-c858c0b7f92f'),
(2,1,'Logo Frontend Footer',2,NULL,NULL,'Logo Frontend Footer','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'d9da554a-0d47-11ef-a055-c858c0b7f92f'),
(3,1,'Logo Backend Header',3,NULL,NULL,'Logo Backend Header','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'d9da55c7-0d47-11ef-a055-c858c0b7f92f'),
(4,1,'Logo Backend Footer',4,NULL,NULL,'Logo Backend Footer','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'d9da55ff-0d47-11ef-a055-c858c0b7f92f'),
(5,1,'Logo Report',5,NULL,NULL,'Logo Report','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'d9da5637-0d47-11ef-a055-c858c0b7f92f'),
(6,1,'Logo Invoice',6,NULL,NULL,'Logo Invoice','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'d9da5674-0d47-11ef-a055-c858c0b7f92f'),
(7,1,'Title',7,NULL,NULL,'Title','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'d9da56ad-0d47-11ef-a055-c858c0b7f92f'),
(8,1,'Content',8,NULL,NULL,'Content','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'d9da56e5-0d47-11ef-a055-c858c0b7f92f');

/*Table structure for table `tx_user` */

DROP TABLE IF EXISTS `tx_user`;

CREATE TABLE `tx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `confirmed_at` int(11) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `last_login_at` int(11) DEFAULT NULL,
  `auth_tf_key` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_tf_enabled` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_email` (`email`),
  UNIQUE KEY `idx_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_user` */

insert  into `tx_user`(`id`,`username`,`email`,`password_hash`,`auth_key`,`unconfirmed_email`,`registration_ip`,`flags`,`confirmed_at`,`blocked_at`,`updated_at`,`created_at`,`last_login_at`,`auth_tf_key`,`auth_tf_enabled`) values 
(1,'admin','ombakrinai@gmail.com','$2y$10$oD129/e5PjrTkIV1yiR3AuOc2/XAOXLWgKPfb8svo8BdBA4PUsw3G','e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm',NULL,NULL,0,NULL,NULL,1675777211,1675777211,1715307761,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
