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
  `subject_type` int(11) DEFAULT NULL,
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
  `is_completed` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('admin','1',1715375892);

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
('admin',1,'Admin',NULL,NULL,1715375892,1715375892),
('create-archive',2,'Create Archive',NULL,NULL,1715375892,1715375892),
('create-archivecategory',2,'Create Archive Category',NULL,NULL,1715375892,1715375892),
('create-assessment',2,'Create Assessment',NULL,NULL,1715375892,1715375892),
('create-employment',2,'Create Employment',NULL,NULL,1715375892,1715375892),
('create-group',2,'Create Group',NULL,NULL,1715375892,1715375892),
('create-ispring-master',2,'Create Ispring Master',NULL,NULL,1715375892,1715375892),
('create-ispring-transaction',2,'Create Ispring Transaction',NULL,NULL,1715375892,1715375892),
('create-master',2,'Create Master',NULL,NULL,1715375892,1715375892),
('create-office',2,'Create Office',NULL,NULL,1715375892,1715375892),
('create-participant',2,'Create Participant',NULL,NULL,1715375892,1715375892),
('create-period',2,'Create Period',NULL,NULL,1715375892,1715375892),
('create-profile',2,'Create Profile',NULL,NULL,1715375892,1715375892),
('create-room',2,'Create Room',NULL,NULL,1715375892,1715375892),
('create-schedule',2,'Create Schedule',NULL,NULL,1715375892,1715375892),
('create-scheduledetail',2,'Create Schedule Detail',NULL,NULL,1715375892,1715375892),
('create-staff',2,'Create Staff',NULL,NULL,1715375892,1715375892),
('create-subject',2,'Create Subject',NULL,NULL,1715375892,1715375892),
('create-theme',2,'Create Theme',NULL,NULL,1715375892,1715375892),
('create-transaction',2,'Create Transaction',NULL,NULL,1715375892,1715375892),
('delete-archive',2,'Delete Archive',NULL,NULL,1715375892,1715375892),
('delete-archivecategory',2,'Delete Archive Category',NULL,NULL,1715375892,1715375892),
('delete-assessment',2,'Delete Assessment',NULL,NULL,1715375892,1715375892),
('delete-employment',2,'Delete Employment',NULL,NULL,1715375892,1715375892),
('delete-group',2,'Delete Group',NULL,NULL,1715375892,1715375892),
('delete-ispring-master',2,'Delete Ispring Master',NULL,NULL,1715375892,1715375892),
('delete-ispring-transaction',2,'Delete Ispring Transaction',NULL,NULL,1715375892,1715375892),
('delete-master',2,'Delete Master',NULL,NULL,1715375892,1715375892),
('delete-office',2,'Delete Office',NULL,NULL,1715375892,1715375892),
('delete-participant',2,'Delete Participant',NULL,NULL,1715375892,1715375892),
('delete-period',2,'Delete Period',NULL,NULL,1715375892,1715375892),
('delete-profile',2,'Delete Profile',NULL,NULL,1715375892,1715375892),
('delete-room',2,'Delete Room',NULL,NULL,1715375892,1715375892),
('delete-schedule',2,'Delete Schedule',NULL,NULL,1715375892,1715375892),
('delete-scheduledetail',2,'Delete Schedule Detail',NULL,NULL,1715375892,1715375892),
('delete-staff',2,'Delete Staff',NULL,NULL,1715375892,1715375892),
('delete-subject',2,'Delete Subject',NULL,NULL,1715375892,1715375892),
('delete-theme',2,'Delete Theme',NULL,NULL,1715375892,1715375892),
('delete-transaction',2,'Delete Transaction',NULL,NULL,1715375892,1715375892),
('guest',1,'Guest',NULL,NULL,1715375892,1715375892),
('index-archive',2,'Index Archive',NULL,NULL,1715375892,1715375892),
('index-archivecategory',2,'Index Archive Category',NULL,NULL,1715375892,1715375892),
('index-assessment',2,'Index Assessment',NULL,NULL,1715375892,1715375892),
('index-employment',2,'Index Employment',NULL,NULL,1715375892,1715375892),
('index-group',2,'Index Group',NULL,NULL,1715375892,1715375892),
('index-ispring-master',2,'Index Ispring Master',NULL,NULL,1715375892,1715375892),
('index-ispring-transaction',2,'Index Ispring Transaction',NULL,NULL,1715375892,1715375892),
('index-master',2,'Index Master',NULL,NULL,1715375892,1715375892),
('index-office',2,'Index Office',NULL,NULL,1715375892,1715375892),
('index-participant',2,'Index Participant',NULL,NULL,1715375892,1715375892),
('index-period',2,'Index Period',NULL,NULL,1715375892,1715375892),
('index-profile',2,'Index Profile',NULL,NULL,1715375892,1715375892),
('index-room',2,'Index Room',NULL,NULL,1715375892,1715375892),
('index-schedule',2,'Index Schedule',NULL,NULL,1715375892,1715375892),
('index-scheduledetail',2,'Index Schedule Detail',NULL,NULL,1715375892,1715375892),
('index-staff',2,'Index Staff',NULL,NULL,1715375892,1715375892),
('index-subject',2,'Index Subject',NULL,NULL,1715375892,1715375892),
('index-theme',2,'Index Theme',NULL,NULL,1715375892,1715375892),
('index-transaction',2,'Index Transaction',NULL,NULL,1715375892,1715375892),
('owner',1,'Company Owner',NULL,NULL,1715375892,1715375892),
('participant',1,'Participant',NULL,NULL,1715375892,1715375892),
('reguler',1,'Reguler',NULL,NULL,1715375892,1715375892),
('report-archive',2,'Report Archive',NULL,NULL,1715375892,1715375892),
('report-archivecategory',2,'Report Archive Category',NULL,NULL,1715375892,1715375892),
('report-assessment',2,'Report Assessment',NULL,NULL,1715375892,1715375892),
('report-group',2,'Report Group',NULL,NULL,1715375892,1715375892),
('report-ispring-master',2,'Report Ispring Master',NULL,NULL,1715375892,1715375892),
('report-ispring-transaction',2,'Report Ispring Transaction',NULL,NULL,1715375892,1715375892),
('report-master',2,'Report Master',NULL,NULL,1715375892,1715375892),
('report-participant',2,'Report Participant',NULL,NULL,1715375892,1715375892),
('report-period',2,'Report Period',NULL,NULL,1715375892,1715375892),
('report-room',2,'Report Room',NULL,NULL,1715375892,1715375892),
('report-schedule',2,'Report Schedule',NULL,NULL,1715375892,1715375892),
('report-scheduledetail',2,'Report Schedule Detail',NULL,NULL,1715375892,1715375892),
('report-subject',2,'Report Subject',NULL,NULL,1715375892,1715375892),
('report-transaction',2,'Report Transaction',NULL,NULL,1715375892,1715375892),
('update-archive',2,'Update Archive',NULL,NULL,1715375892,1715375892),
('update-archivecategory',2,'Update Archive Category',NULL,NULL,1715375892,1715375892),
('update-assessment',2,'Update Assessment',NULL,NULL,1715375892,1715375892),
('update-employment',2,'Update Employment',NULL,NULL,1715375892,1715375892),
('update-group',2,'Update Group',NULL,NULL,1715375892,1715375892),
('update-ispring-master',2,'Update Ispring Master',NULL,NULL,1715375892,1715375892),
('update-ispring-transaction',2,'Update Ispring Transaction',NULL,NULL,1715375892,1715375892),
('update-master',2,'Update Master',NULL,NULL,1715375892,1715375892),
('update-office',2,'Update Office',NULL,NULL,1715375892,1715375892),
('update-participant',2,'Update Participant',NULL,NULL,1715375892,1715375892),
('update-period',2,'Update Period',NULL,NULL,1715375892,1715375892),
('update-profile',2,'Update Profile',NULL,NULL,1715375892,1715375892),
('update-room',2,'Update Room',NULL,NULL,1715375892,1715375892),
('update-schedule',2,'Update Schedule',NULL,NULL,1715375892,1715375892),
('update-scheduledetail',2,'Update Schedule Detail',NULL,NULL,1715375892,1715375892),
('update-staff',2,'Update Staff',NULL,NULL,1715375892,1715375892),
('update-subject',2,'Update Subject',NULL,NULL,1715375892,1715375892),
('update-theme',2,'Update Theme',NULL,NULL,1715375892,1715375892),
('update-transaction',2,'Update Transaction',NULL,NULL,1715375892,1715375892),
('view-archive',2,'View Archive',NULL,NULL,1715375892,1715375892),
('view-archivecategory',2,'View Archive Category',NULL,NULL,1715375892,1715375892),
('view-assessment',2,'View Assessment',NULL,NULL,1715375892,1715375892),
('view-employment',2,'View Employment',NULL,NULL,1715375892,1715375892),
('view-group',2,'View Group',NULL,NULL,1715375892,1715375892),
('view-ispring-master',2,'View Ispring Master',NULL,NULL,1715375892,1715375892),
('view-ispring-transaction',2,'View Ispring Transaction',NULL,NULL,1715375892,1715375892),
('view-master',2,'View Master',NULL,NULL,1715375892,1715375892),
('view-office',2,'View Office',NULL,NULL,1715375892,1715375892),
('view-participant',2,'View Participant',NULL,NULL,1715375892,1715375892),
('view-period',2,'View Period',NULL,NULL,1715375892,1715375892),
('view-profile',2,'View Profile',NULL,NULL,1715375892,1715375892),
('view-room',2,'View Room',NULL,NULL,1715375892,1715375892),
('view-schedule',2,'View Schedule',NULL,NULL,1715375892,1715375892),
('view-scheduledetail',2,'View Schedule Detail',NULL,NULL,1715375892,1715375892),
('view-staff',2,'View Staff',NULL,NULL,1715375892,1715375892),
('view-subject',2,'View Subject',NULL,NULL,1715375892,1715375892),
('view-theme',2,'View Theme',NULL,NULL,1715375892,1715375892),
('view-transaction',2,'View Transaction',NULL,NULL,1715375892,1715375892);

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
(1,1,'SCD',1,'2024-05-11 04:20:52','2024-05-11 04:20:52',1,1,NULL,NULL,NULL,0,'2e19ca3d0f1311ef8849c858c0b7f92f');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_group` */

insert  into `tx_group`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(12,1,'X1',1,'Kelas X1','2024-05-10 13:11:55','2024-05-10 13:11:55',1,1,NULL,NULL,NULL,0,'334d304b0e9411ef9f9dc858c0b7f92f'),
(13,1,'X3',2,'Kelas X3','2024-05-10 13:11:55','2024-05-10 13:11:55',1,1,NULL,NULL,NULL,0,'334de8f30e9411ef9f9dc858c0b7f92f'),
(14,1,'XI 2',3,'Kelas XI 2','2024-05-10 13:11:55','2024-05-10 13:11:55',1,1,NULL,NULL,NULL,0,'334e65b70e9411ef9f9dc858c0b7f92f'),
(15,1,'XI 3',4,'Kelas XI 3','2024-05-10 13:11:55','2024-05-10 13:11:55',1,1,NULL,NULL,NULL,0,'334ed8cd0e9411ef9f9dc858c0b7f92f'),
(16,1,'XII-1',5,'Kelas XII-1','2024-05-10 13:11:55','2024-05-10 13:11:55',1,1,NULL,NULL,NULL,0,'334f6de10e9411ef9f9dc858c0b7f92f');

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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_participant` */

insert  into `tx_participant`(`id`,`office_id`,`group_id`,`title`,`identity_number`,`username`,`password`,`email`,`status`,`last_login_at`,`auth_key`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(147,1,12,'Aurelie Schinner','molly.jerde@carter.com','Umolly.jerde@carter.com','0915a','howard.lueilwitz@gmail.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'35557a8c0e9411ef9f9dc858c0b7f92f'),
(148,1,12,'Isabel Schiller','marcia30@hotmail.com','Umarcia30@hotmail.com','85de0','kenyatta.simonis@ernser.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'35564b5a0e9411ef9f9dc858c0b7f92f'),
(149,1,12,'Soledad Pfeffer','paucek.duncan@gerhold.info','Upaucek.duncan@gerhold.info','ea6c3','lmaggio@halvorson.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'35568c940e9411ef9f9dc858c0b7f92f'),
(150,1,12,'Lilla Murazik','oflatley@bauch.com','Uoflatley@bauch.com','3fe61','bruen.ben@lesch.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'35571ea50e9411ef9f9dc858c0b7f92f'),
(151,1,13,'Bonnie Schneider','pearl54@yahoo.com','Upearl54@yahoo.com','24451','nyasia.ward@effertz.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'35578fe40e9411ef9f9dc858c0b7f92f'),
(152,1,13,'Odessa Christiansen','john86@stracke.info','Ujohn86@stracke.info','d2df3','ylowe@gmail.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'3557ec330e9411ef9f9dc858c0b7f92f'),
(153,1,14,'Reilly Lebsack','paris.buckridge@willms.com','Uparis.buckridge@willms.com','82726','tbogisich@gmail.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'35593a020e9411ef9f9dc858c0b7f92f'),
(154,1,14,'Vidal Reilly','wyman.batz@yahoo.com','Uwyman.batz@yahoo.com','60cb3','garrett64@yahoo.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'355985df0e9411ef9f9dc858c0b7f92f'),
(155,1,14,'Fern Gorczany','gulgowski.ryleigh@bauch.com','Ugulgowski.ryleigh@bauch.com','c1e41','rgleason@franecki.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'3559c3850e9411ef9f9dc858c0b7f92f'),
(156,1,14,'Hulda Swaniawski','kavon55@gmail.com','Ukavon55@gmail.com','062c0','xauer@yahoo.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'3559ff930e9411ef9f9dc858c0b7f92f'),
(157,1,14,'Paul Hill','dcummings@schroeder.com','Udcummings@schroeder.com','e03dd','zita.hyatt@carter.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'355a3caf0e9411ef9f9dc858c0b7f92f'),
(158,1,15,'Luella Schuppe','greenholt.juston@rutherford.com','Ugreenholt.juston@rutherford.com','6d658','lonzo78@feeney.net',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'355b1e4a0e9411ef9f9dc858c0b7f92f'),
(159,1,15,'Tianna Reichel','regan.koss@reinger.org','Uregan.koss@reinger.org','99534','gspinka@satterfield.net',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'355c43380e9411ef9f9dc858c0b7f92f'),
(160,1,15,'Hillard Erdman','jocelyn88@christiansen.net','Ujocelyn88@christiansen.net','76452','noelia.wolf@gmail.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'355c96c00e9411ef9f9dc858c0b7f92f'),
(161,1,16,'Beth Kohler','lhilpert@kohler.org','Ulhilpert@kohler.org','d46ee','lebsack.leola@gulgowski.net',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'355dca1b0e9411ef9f9dc858c0b7f92f'),
(162,1,16,'Demetris Boehm','joana.larson@bogan.com','Ujoana.larson@bogan.com','2f3ea','golden.walter@gmail.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'355e101d0e9411ef9f9dc858c0b7f92f'),
(163,1,16,'Tess Goyette','orin83@skiles.biz','Uorin83@skiles.biz','2b5a5','alabadie@osinski.info',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'355e71710e9411ef9f9dc858c0b7f92f'),
(164,1,16,'Abigayle Emard','fidel.baumbach@kling.org','Ufidel.baumbach@kling.org','c4a76','madge.ebert@mills.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'355ed5f30e9411ef9f9dc858c0b7f92f'),
(165,1,16,'Kattie Brekke','connie.bergnaum@jaskolski.com','Uconnie.bergnaum@jaskolski.com','279bc','nora62@daniel.com',2,NULL,NULL,'2024-05-10 13:11:58','2024-05-10 13:11:58',1,1,NULL,NULL,NULL,0,'355f2c9c0e9411ef9f9dc858c0b7f92f');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_schedule` */

insert  into `tx_schedule`(`id`,`office_id`,`title`,`period_id`,`group_id`,`room_id`,`staff_id`,`date_start`,`date_end`,`token`,`token_time`,`is_asset`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,'00001-Bahasa Indonesia',2,12,2,1,'2024-05-11 04:20:32','2024-05-11 04:20:32','714041','2024-05-11 04:20:32',2,'','2024-05-11 04:20:52','2024-05-11 04:22:51',1,1,NULL,NULL,NULL,2,'2e16a6780f1311ef8849c858c0b7f92f');

/*Table structure for table `tx_schedule_detail` */

DROP TABLE IF EXISTS `tx_schedule_detail`;

CREATE TABLE `tx_schedule_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` int(11) DEFAULT NULL,
  `remark` tinytext DEFAULT NULL,
  `asset_name` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_schedule_detail` */

insert  into `tx_schedule_detail`(`id`,`office_id`,`schedule_id`,`subject_id`,`subject_type`,`remark`,`asset_name`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,1,15,2,'Kimia',NULL,'2024-05-11 04:20:52','2024-05-11 04:22:51',1,1,NULL,NULL,NULL,1,'2e1b034b0f1311ef8849c858c0b7f92f');

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
('0ktffmjrmvuvaogsk0f2sruv2k',1715321312,'__flash|a:0:{}'),
('3mr835rk6rhlo2uckv8fihp101',1715334065,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('8fk7h7hqnsnkuhjr7288r3r1dg',1715378032,'__flash|a:0:{}'),
('8uf0ag3c0prp44gtu0ckhfo6lr',1715310928,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('ff91gj3bstianlevuofja2bc05',1715309195,'__flash|a:0:{}'),
('ffbpvi0lo2nicemmpe45l2ns23',1715327727,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('gorjfjm9lj8pd4lighum2sk745',1715377922,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('nepaijo35jnp2hud1eue9ar6a2',1715331377,'__flash|a:0:{}'),
('qc9bopvcbcs24sig6lkmrf1ie6',1715266149,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('s7a005t823mfbejejnlq8f64uq',1715377427,'__flash|a:0:{}'),
('uekimflc97ahlsesbpiam3fj8h',1715378047,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_subject` */

insert  into `tx_subject`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(14,1,'Matematika',1,'Matematika','2024-05-10 13:11:56','2024-05-10 13:11:56',1,1,NULL,NULL,NULL,0,'346849760e9411ef9f9dc858c0b7f92f'),
(15,1,'Kimia',2,'Kimia','2024-05-10 13:11:56','2024-05-10 13:11:56',1,1,NULL,NULL,NULL,0,'346966d00e9411ef9f9dc858c0b7f92f'),
(16,1,'Fisika',3,'Fisika','2024-05-10 13:11:56','2024-05-10 13:11:56',1,1,NULL,NULL,NULL,0,'3469fdd50e9411ef9f9dc858c0b7f92f'),
(17,1,'Bahasa Indonesia',4,'Bahasa Indonesia','2024-05-10 13:11:56','2024-05-10 13:11:56',1,1,NULL,NULL,NULL,0,'346a81170e9411ef9f9dc858c0b7f92f'),
(18,1,'Sejarah',5,'Sejarah','2024-05-10 13:11:56','2024-05-10 13:11:56',1,1,NULL,NULL,NULL,0,'346aefe30e9411ef9f9dc858c0b7f92f');

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
(1,1,'Logo Frontend Header',1,NULL,NULL,'Logo Frontend Header','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'fffe01c9-0f12-11ef-8849-c858c0b7f92f'),
(2,1,'Logo Frontend Footer',2,NULL,NULL,'Logo Frontend Footer','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'fffe04c4-0f12-11ef-8849-c858c0b7f92f'),
(3,1,'Logo Backend Header',3,NULL,NULL,'Logo Backend Header','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'fffe0520-0f12-11ef-8849-c858c0b7f92f'),
(4,1,'Logo Backend Footer',4,NULL,NULL,'Logo Backend Footer','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'fffe056d-0f12-11ef-8849-c858c0b7f92f'),
(5,1,'Logo Report',5,NULL,NULL,'Logo Report','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'fffe05b4-0f12-11ef-8849-c858c0b7f92f'),
(6,1,'Logo Invoice',6,NULL,NULL,'Logo Invoice','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'fffe0609-0f12-11ef-8849-c858c0b7f92f'),
(7,1,'Title',7,NULL,NULL,'Title','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'fffe064f-0f12-11ef-8849-c858c0b7f92f'),
(8,1,'Content',8,NULL,NULL,'Content','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'fffe0695-0f12-11ef-8849-c858c0b7f92f');

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
(1,'admin','ombakrinai@gmail.com','$2y$10$oD129/e5PjrTkIV1yiR3AuOc2/XAOXLWgKPfb8svo8BdBA4PUsw3G','e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm',NULL,NULL,0,NULL,NULL,1675777211,1675777211,1715376606,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
