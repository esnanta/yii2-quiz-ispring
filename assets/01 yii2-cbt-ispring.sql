/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - yii2_cbt_ispring
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yii2_cbt_ispring` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `yii2_cbt_ispring`;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `tx_archive` */

insert  into `tx_archive`(`id`,`office_id`,`is_visible`,`archive_type`,`archive_category_id`,`title`,`date_issued`,`asset_name`,`asset_url`,`size`,`mime_type`,`view_counter`,`download_counter`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(3,1,1,2,5,'Data siswa TP 2324','2024-01-17','_65a80ac0ce7e2.xlsx',NULL,NULL,NULL,0,1,'','2024-01-17 23:29:35','2024-01-18 00:17:09',1,1,NULL,NULL,NULL,4,'99d2cde2b55511ee9384c858c0b7f92f'),
(4,1,1,1,5,'yii2_cbt_ispring.sql','2024-01-18','yii2_cbt_ispring_65abf5ded4237.sql',NULL,NULL,NULL,0,0,'','2024-01-18 00:21:42','2024-01-20 23:33:18',1,1,NULL,NULL,NULL,2,'e1c0b09ab55c11ee9384c858c0b7f92f');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tx_archive_category` */

insert  into `tx_archive_category`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(5,1,'Test',1,'','2024-01-17 23:20:28','2024-01-17 23:20:28',1,1,NULL,NULL,NULL,0,'53bcf82eb55411ee9384c858c0b7f92f');

/*Table structure for table `tx_assessment` */

DROP TABLE IF EXISTS `tx_assessment`;

CREATE TABLE `tx_assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(15) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
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
  KEY `Fk_assessment_office` (`office_id`),
  KEY `Fk_assessment_room` (`room_id`),
  KEY `Fk_assessment_subject` (`subject_id`),
  CONSTRAINT `Fk_assessment_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  CONSTRAINT `Fk_assessment_room` FOREIGN KEY (`room_id`) REFERENCES `tx_room` (`id`),
  CONSTRAINT `Fk_assessment_subject` FOREIGN KEY (`subject_id`) REFERENCES `tx_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tx_assessment` */

/*Table structure for table `tx_assessment_detail` */

DROP TABLE IF EXISTS `tx_assessment_detail`;

CREATE TABLE `tx_assessment_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `earned_points` decimal(18,2) DEFAULT NULL,
  `passing_score` decimal(18,2) DEFAULT NULL,
  `passing_score_percent` decimal(18,2) DEFAULT NULL,
  `gained_score` decimal(18,2) DEFAULT NULL,
  `quiz_title` varchar(50) DEFAULT NULL,
  `quiz_type` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `used_time` int(11) DEFAULT NULL,
  `time_spent` int(11) DEFAULT NULL,
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
  KEY `Fk_assessment_detail_assessment` (`assessment_id`),
  KEY `Fk_assessment_detail_participant` (`participant_id`),
  CONSTRAINT `Fk_assessment_detail_assessment` FOREIGN KEY (`assessment_id`) REFERENCES `tx_assessment` (`id`),
  CONSTRAINT `Fk_assessment_detail_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  CONSTRAINT `Fk_assessment_detail_participant` FOREIGN KEY (`participant_id`) REFERENCES `tx_participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tx_assessment_detail` */

/*Table structure for table `tx_auth_assignment` */

DROP TABLE IF EXISTS `tx_auth_assignment`;

CREATE TABLE `tx_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `tx_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_auth_assignment` */

insert  into `tx_auth_assignment`(`item_name`,`user_id`,`created_at`) values 
('admin','1',1705331584);

/*Table structure for table `tx_auth_item` */

DROP TABLE IF EXISTS `tx_auth_item`;

CREATE TABLE `tx_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
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
('admin',1,'Admin',NULL,NULL,1705331584,1705331584),
('create-archive',2,'Create Archive',NULL,NULL,1705331584,1705331584),
('create-archivecategory',2,'Create Archive Category',NULL,NULL,1705331584,1705331584),
('create-assessment',2,'Create Assessment',NULL,NULL,1705331599,1705331599),
('create-author',2,'Create Author',NULL,NULL,1705331584,1705331584),
('create-blog',2,'Create Blog',NULL,NULL,1705331584,1705331584),
('create-category',2,'Create Category',NULL,NULL,1705331584,1705331584),
('create-employment',2,'Create Employment',NULL,NULL,1705331584,1705331584),
('create-event',2,'Create Event',NULL,NULL,1705331584,1705331584),
('create-group',2,'Create Group',NULL,NULL,1705592350,1705592350),
('create-ispring-master',2,'Create Ispring Master',NULL,NULL,1705331599,1705331599),
('create-ispring-transaction',2,'Create Ispring Transaction',NULL,NULL,1705331599,1705331599),
('create-master',2,'Create Master',NULL,NULL,1705331584,1705331584),
('create-office',2,'Create Office',NULL,NULL,1705331584,1705331584),
('create-participant',2,'Create Participant',NULL,NULL,1705331599,1705331599),
('create-profile',2,'Create Profile',NULL,NULL,1705331584,1705331584),
('create-quote',2,'Create Quote',NULL,NULL,1705331584,1705331584),
('create-room',2,'Create Room',NULL,NULL,1705331599,1705331599),
('create-schedule',2,'Create Schedule',NULL,NULL,1705673764,1705673764),
('create-schedule-detail',2,'Create Schedule Detail',NULL,NULL,1705817138,1705817138),
('create-scheduledetail',2,'Create Schedule Detail',NULL,NULL,1705818153,1705818153),
('create-staff',2,'Create Staff',NULL,NULL,1705331584,1705331584),
('create-subject',2,'Create Subject',NULL,NULL,1705331599,1705331599),
('create-theme',2,'Create Theme',NULL,NULL,1705331584,1705331584),
('create-transaction',2,'Create Transaction',NULL,NULL,1705331584,1705331584),
('delete-archive',2,'Delete Archive',NULL,NULL,1705331584,1705331584),
('delete-archivecategory',2,'Delete Archive Category',NULL,NULL,1705331584,1705331584),
('delete-assessment',2,'Delete Assessment',NULL,NULL,1705331599,1705331599),
('delete-author',2,'Delete Author',NULL,NULL,1705331584,1705331584),
('delete-blog',2,'Delete Blog',NULL,NULL,1705331584,1705331584),
('delete-category',2,'Delete Category',NULL,NULL,1705331584,1705331584),
('delete-employment',2,'Delete Employment',NULL,NULL,1705331584,1705331584),
('delete-event',2,'Delete Event',NULL,NULL,1705331584,1705331584),
('delete-group',2,'Delete Group',NULL,NULL,1705592350,1705592350),
('delete-ispring-master',2,'Delete Ispring Master',NULL,NULL,1705331599,1705331599),
('delete-ispring-transaction',2,'Delete Ispring Transaction',NULL,NULL,1705331599,1705331599),
('delete-master',2,'Delete Master',NULL,NULL,1705331584,1705331584),
('delete-office',2,'Delete Office',NULL,NULL,1705331584,1705331584),
('delete-participant',2,'Delete Participant',NULL,NULL,1705331599,1705331599),
('delete-profile',2,'Delete Profile',NULL,NULL,1705331584,1705331584),
('delete-quote',2,'Delete Quote',NULL,NULL,1705331584,1705331584),
('delete-room',2,'Delete Room',NULL,NULL,1705331599,1705331599),
('delete-schedule',2,'Delete Schedule',NULL,NULL,1705673764,1705673764),
('delete-schedule-detail',2,'Delete Schedule Detail',NULL,NULL,1705817138,1705817138),
('delete-scheduledetail',2,'Delete Schedule Detail',NULL,NULL,1705818153,1705818153),
('delete-staff',2,'Delete Staff',NULL,NULL,1705331584,1705331584),
('delete-subject',2,'Delete Subject',NULL,NULL,1705331599,1705331599),
('delete-theme',2,'Delete Theme',NULL,NULL,1705331584,1705331584),
('delete-transaction',2,'Delete Transaction',NULL,NULL,1705331584,1705331584),
('guest',1,'Guest',NULL,NULL,1705331584,1705331584),
('index-archive',2,'Index Archive',NULL,NULL,1705331584,1705331584),
('index-archivecategory',2,'Index Archive Category',NULL,NULL,1705331584,1705331584),
('index-assessment',2,'Index Assessment',NULL,NULL,1705331599,1705331599),
('index-author',2,'Index Author',NULL,NULL,1705331584,1705331584),
('index-blog',2,'Index Blog',NULL,NULL,1705331584,1705331584),
('index-category',2,'Index Category',NULL,NULL,1705331584,1705331584),
('index-employment',2,'Index Employment',NULL,NULL,1705331584,1705331584),
('index-event',2,'Index Event',NULL,NULL,1705331584,1705331584),
('index-group',2,'Index Group',NULL,NULL,1705592350,1705592350),
('index-ispring-master',2,'Index Ispring Master',NULL,NULL,1705331599,1705331599),
('index-ispring-transaction',2,'Index Ispring Transaction',NULL,NULL,1705331599,1705331599),
('index-master',2,'Index Master',NULL,NULL,1705331584,1705331584),
('index-office',2,'Index Office',NULL,NULL,1705331584,1705331584),
('index-participant',2,'Index Participant',NULL,NULL,1705331599,1705331599),
('index-profile',2,'Index Profile',NULL,NULL,1705331584,1705331584),
('index-quote',2,'Index Quote',NULL,NULL,1705331584,1705331584),
('index-room',2,'Index Room',NULL,NULL,1705331599,1705331599),
('index-schedule',2,'Index Schedule',NULL,NULL,1705673764,1705673764),
('index-schedule-detail',2,'Index Schedule Detail',NULL,NULL,1705817138,1705817138),
('index-scheduledetail',2,'Index Schedule Detail',NULL,NULL,1705818153,1705818153),
('index-staff',2,'Index Staff',NULL,NULL,1705331584,1705331584),
('index-subject',2,'Index Subject',NULL,NULL,1705331599,1705331599),
('index-theme',2,'Index Theme',NULL,NULL,1705331584,1705331584),
('index-transaction',2,'Index Transaction',NULL,NULL,1705331584,1705331584),
('owner',1,'Company Owner',NULL,NULL,1705331599,1705331599),
('reguler',1,'Reguler',NULL,NULL,1705331584,1705331584),
('report-archive',2,'Report Archive',NULL,NULL,1705331584,1705331584),
('report-archivecategory',2,'Report Archive Category',NULL,NULL,1705331584,1705331584),
('report-assessment',2,'Report Assessment',NULL,NULL,1705331599,1705331599),
('report-group',2,'Report Group',NULL,NULL,1705592350,1705592350),
('report-ispring-master',2,'Report Ispring Master',NULL,NULL,1705331599,1705331599),
('report-ispring-transaction',2,'Report Ispring Transaction',NULL,NULL,1705331599,1705331599),
('report-master',2,'Report Master',NULL,NULL,1705331584,1705331584),
('report-participant',2,'Report Participant',NULL,NULL,1705331599,1705331599),
('report-room',2,'Report Room',NULL,NULL,1705331599,1705331599),
('report-schedule',2,'Report Schedule',NULL,NULL,1705673764,1705673764),
('report-schedule-detail',2,'Report Schedule Detail',NULL,NULL,1705817138,1705817138),
('report-scheduledetail',2,'Report Schedule Detail',NULL,NULL,1705818153,1705818153),
('report-subject',2,'Report Subject',NULL,NULL,1705331599,1705331599),
('report-transaction',2,'Report Transaction',NULL,NULL,1705331584,1705331584),
('update-archive',2,'Update Archive',NULL,NULL,1705331584,1705331584),
('update-archivecategory',2,'Update Archive Category',NULL,NULL,1705331584,1705331584),
('update-assessment',2,'Update Assessment',NULL,NULL,1705331599,1705331599),
('update-author',2,'Update Author',NULL,NULL,1705331584,1705331584),
('update-blog',2,'Update Blog',NULL,NULL,1705331584,1705331584),
('update-category',2,'Update Category',NULL,NULL,1705331584,1705331584),
('update-employment',2,'Update Employment',NULL,NULL,1705331584,1705331584),
('update-event',2,'Update Event',NULL,NULL,1705331584,1705331584),
('update-group',2,'Update Group',NULL,NULL,1705592350,1705592350),
('update-ispring-master',2,'Update Ispring Master',NULL,NULL,1705331599,1705331599),
('update-ispring-transaction',2,'Update Ispring Transaction',NULL,NULL,1705331599,1705331599),
('update-master',2,'Update Master',NULL,NULL,1705331584,1705331584),
('update-office',2,'Update Office',NULL,NULL,1705331584,1705331584),
('update-participant',2,'Update Participant',NULL,NULL,1705331599,1705331599),
('update-profile',2,'Update Profile',NULL,NULL,1705331584,1705331584),
('update-quote',2,'Update Quote',NULL,NULL,1705331584,1705331584),
('update-room',2,'Update Room',NULL,NULL,1705331599,1705331599),
('update-schedule',2,'Update Schedule',NULL,NULL,1705673764,1705673764),
('update-schedule-detail',2,'Update Schedule Detail',NULL,NULL,1705817138,1705817138),
('update-scheduledetail',2,'Update Schedule Detail',NULL,NULL,1705818153,1705818153),
('update-staff',2,'Update Staff',NULL,NULL,1705331584,1705331584),
('update-subject',2,'Update Subject',NULL,NULL,1705331599,1705331599),
('update-theme',2,'Update Theme',NULL,NULL,1705331584,1705331584),
('update-transaction',2,'Update Transaction',NULL,NULL,1705331584,1705331584),
('view-archive',2,'View Archive',NULL,NULL,1705331584,1705331584),
('view-archivecategory',2,'View Archive Category',NULL,NULL,1705331584,1705331584),
('view-assessment',2,'View Assessment',NULL,NULL,1705331599,1705331599),
('view-author',2,'View Author',NULL,NULL,1705331584,1705331584),
('view-blog',2,'View Blog',NULL,NULL,1705331584,1705331584),
('view-category',2,'View Category',NULL,NULL,1705331584,1705331584),
('view-employment',2,'View Employment',NULL,NULL,1705331584,1705331584),
('view-event',2,'View Event',NULL,NULL,1705331584,1705331584),
('view-group',2,'View Group',NULL,NULL,1705592350,1705592350),
('view-ispring-master',2,'View Ispring Master',NULL,NULL,1705331599,1705331599),
('view-ispring-transaction',2,'View Ispring Transaction',NULL,NULL,1705331599,1705331599),
('view-master',2,'View Master',NULL,NULL,1705331584,1705331584),
('view-office',2,'View Office',NULL,NULL,1705331584,1705331584),
('view-participant',2,'View Participant',NULL,NULL,1705331599,1705331599),
('view-profile',2,'View Profile',NULL,NULL,1705331584,1705331584),
('view-quote',2,'View Quote',NULL,NULL,1705331584,1705331584),
('view-room',2,'View Room',NULL,NULL,1705331599,1705331599),
('view-schedule',2,'View Schedule',NULL,NULL,1705673764,1705673764),
('view-schedule-detail',2,'View Schedule Detail',NULL,NULL,1705817138,1705817138),
('view-scheduledetail',2,'View Schedule Detail',NULL,NULL,1705818153,1705818153),
('view-staff',2,'View Staff',NULL,NULL,1705331584,1705331584),
('view-subject',2,'View Subject',NULL,NULL,1705331599,1705331599),
('view-theme',2,'View Theme',NULL,NULL,1705331584,1705331584),
('view-transaction',2,'View Transaction',NULL,NULL,1705331584,1705331584);

/*Table structure for table `tx_auth_item_child` */

DROP TABLE IF EXISTS `tx_auth_item_child`;

CREATE TABLE `tx_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
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
('create-ispring-master','create-room'),
('create-ispring-master','create-schedule'),
('create-ispring-master','create-schedule-detail'),
('create-ispring-master','create-scheduledetail'),
('create-ispring-master','create-subject'),
('create-ispring-transaction','create-assessment'),
('create-master','create-archivecategory'),
('create-master','create-author'),
('create-master','create-category'),
('create-master','create-employment'),
('create-master','create-event'),
('create-master','create-office'),
('create-master','create-profile'),
('create-master','create-quote'),
('create-master','create-staff'),
('create-master','create-theme'),
('create-transaction','create-archive'),
('create-transaction','create-blog'),
('delete-ispring-master','delete-group'),
('delete-ispring-master','delete-participant'),
('delete-ispring-master','delete-room'),
('delete-ispring-master','delete-schedule'),
('delete-ispring-master','delete-schedule-detail'),
('delete-ispring-master','delete-scheduledetail'),
('delete-ispring-master','delete-subject'),
('delete-ispring-transaction','delete-assessment'),
('delete-master','delete-archivecategory'),
('delete-master','delete-author'),
('delete-master','delete-category'),
('delete-master','delete-employment'),
('delete-master','delete-event'),
('delete-master','delete-office'),
('delete-master','delete-profile'),
('delete-master','delete-quote'),
('delete-master','delete-staff'),
('delete-master','delete-theme'),
('delete-transaction','delete-archive'),
('delete-transaction','delete-blog'),
('guest','index-archive'),
('guest','view-archive'),
('index-ispring-master','index-group'),
('index-ispring-master','index-participant'),
('index-ispring-master','index-room'),
('index-ispring-master','index-schedule'),
('index-ispring-master','index-schedule-detail'),
('index-ispring-master','index-scheduledetail'),
('index-ispring-master','index-subject'),
('index-ispring-transaction','index-assessment'),
('index-master','index-archivecategory'),
('index-master','index-author'),
('index-master','index-category'),
('index-master','index-employment'),
('index-master','index-event'),
('index-master','index-office'),
('index-master','index-profile'),
('index-master','index-quote'),
('index-master','index-staff'),
('index-master','index-theme'),
('index-transaction','index-archive'),
('index-transaction','index-blog'),
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
('report-ispring-master','report-room'),
('report-ispring-master','report-schedule'),
('report-ispring-master','report-schedule-detail'),
('report-ispring-master','report-scheduledetail'),
('report-ispring-master','report-subject'),
('report-ispring-transaction','report-assessment'),
('report-master','report-archivecategory'),
('report-transaction','report-archive'),
('update-ispring-master','update-group'),
('update-ispring-master','update-participant'),
('update-ispring-master','update-room'),
('update-ispring-master','update-schedule'),
('update-ispring-master','update-schedule-detail'),
('update-ispring-master','update-scheduledetail'),
('update-ispring-master','update-subject'),
('update-ispring-transaction','update-assessment'),
('update-master','update-archivecategory'),
('update-master','update-author'),
('update-master','update-category'),
('update-master','update-employment'),
('update-master','update-event'),
('update-master','update-office'),
('update-master','update-profile'),
('update-master','update-quote'),
('update-master','update-staff'),
('update-master','update-theme'),
('update-transaction','update-archive'),
('update-transaction','update-blog'),
('view-ispring-master','view-group'),
('view-ispring-master','view-participant'),
('view-ispring-master','view-room'),
('view-ispring-master','view-schedule'),
('view-ispring-master','view-schedule-detail'),
('view-ispring-master','view-scheduledetail'),
('view-ispring-master','view-subject'),
('view-ispring-transaction','view-assessment'),
('view-master','view-archivecategory'),
('view-master','view-author'),
('view-master','view-category'),
('view-master','view-employment'),
('view-master','view-event'),
('view-master','view-office'),
('view-master','view-profile'),
('view-master','view-quote'),
('view-master','view-staff'),
('view-master','view-theme'),
('view-transaction','view-archive'),
('view-transaction','view-blog');

/*Table structure for table `tx_auth_rule` */

DROP TABLE IF EXISTS `tx_auth_rule`;

CREATE TABLE `tx_auth_rule` (
  `name` varchar(64) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `tx_counter` */

insert  into `tx_counter`(`id`,`office_id`,`title`,`counter`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,2,'PCX',5,'2024-01-02 15:23:56','2024-01-02 17:32:03',2,2,NULL,NULL,NULL,4,'466bd81aa94811ee97d144a84247fe3b'),
(2,2,'SDT',3,'2024-01-02 15:30:17','2024-01-02 17:33:13',2,2,NULL,NULL,NULL,2,'29b0c991a94911ee97d144a84247fe3b'),
(3,2,'FSX',26,'2024-01-02 15:31:56','2024-01-13 17:14:12',2,5,NULL,NULL,NULL,25,'6478a2a1a94911ee97d144a84247fe3b');

/*Table structure for table `tx_dashblock` */

DROP TABLE IF EXISTS `tx_dashblock`;

CREATE TABLE `tx_dashblock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `actions` text DEFAULT NULL,
  `weight` int(11) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(4) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `tx_employment` */

insert  into `tx_employment`(`id`,`office_id`,`title`,`description`,`sequence`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,'Manajer','-',1,'2023-08-22 22:30:26','2023-08-22 22:31:50',1,1,NULL,NULL,NULL,1,NULL),
(2,2,'Manager',NULL,1,'2023-11-03 21:34:23','2023-11-03 21:34:23',1,1,NULL,NULL,NULL,0,'109913837a5611eeaaf5441ea14ed578'),
(3,2,'Staff','-',2,'2024-01-02 15:15:58','2024-01-02 15:15:58',2,2,NULL,NULL,NULL,0,'29466d8aa94711ee97d144a84247fe3b');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tx_group` */

insert  into `tx_group`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,'XII - IPA 1',NULL,'','2024-01-19 21:18:59','2024-01-19 21:18:59',1,1,NULL,NULL,NULL,0,'b020dab7b6d511eeb65dc858c0b7f92f');

/*Table structure for table `tx_migration` */

DROP TABLE IF EXISTS `tx_migration`;

CREATE TABLE `tx_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `tx_office` */

insert  into `tx_office`(`id`,`user_id`,`unique_id`,`title`,`phone_number`,`fax_number`,`email`,`web`,`address`,`latitude`,`longitude`,`facebook`,`google_plus`,`instagram`,`twitter`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,'65a7fb0e28f7b','Es Nanta ID','-',NULL,'ombakrinai@gmail.com','esnanta.my.id','-',NULL,NULL,NULL,NULL,NULL,NULL,'-','2023-08-18 22:25:10','2024-01-17 23:06:53',1,1,NULL,NULL,NULL,3,NULL),
(2,2,NULL,'CV Rajahati','081360328522',NULL,'rajahati@rajahati.com','','',NULL,NULL,NULL,NULL,NULL,NULL,'','2023-11-03 21:34:23','2024-01-02 16:33:28',1,2,NULL,NULL,NULL,1,'1096ca237a5611eeaaf5441ea14ed578');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tx_participant` */

insert  into `tx_participant`(`id`,`office_id`,`group_id`,`title`,`identity_number`,`username`,`password`,`email`,`status`,`last_login_at`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,1,'Achmad Maula Fata','0078294733','U0078294733','1b832',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b55f1cbeb6d511eeb65dc858c0b7f92f'),
(2,1,1,'Adila Khalisah','0063509763','U0063509763','7d63e',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b55f7fd2b6d511eeb65dc858c0b7f92f'),
(3,1,1,'Amira Jufri','0053756117','U0053756117','a2bdd',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b55fd42cb6d511eeb65dc858c0b7f92f'),
(4,1,1,'Anbar Salsabilla','0065125737','U0065125737','deb90',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b560893bb6d511eeb65dc858c0b7f92f'),
(5,1,1,'Aninda Belta Shakira','0065757046','U0065757046','9dbc4',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b560d381b6d511eeb65dc858c0b7f92f'),
(6,1,1,'Annisa Salsabila','0064848339','U0064848339','41729',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5611447b6d511eeb65dc858c0b7f92f'),
(7,1,1,'Ardian Saputra','0055531022','U0055531022','03de2',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b56152ecb6d511eeb65dc858c0b7f92f'),
(8,1,1,'Cut Sahara Tantri','0050410064','U0050410064','e0619',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5619433b6d511eeb65dc858c0b7f92f'),
(9,1,1,'Ersya Elysia','0076787140','U0076787140','2e617',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b561d27fb6d511eeb65dc858c0b7f92f'),
(10,1,1,'Fachri Satria Tanjung','0066822084','U0066822084','19763',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b56210dcb6d511eeb65dc858c0b7f92f'),
(11,1,1,'Faiz Rusdy','0067053895','U0067053895','bc5c2',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5625401b6d511eeb65dc858c0b7f92f'),
(12,1,1,'Faturrahman','0064788352','U0064788352','0ae21',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b562b229b6d511eeb65dc858c0b7f92f'),
(13,1,1,'Gery Juan Devista','0056176047','U0056176047','6b7ed',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b56319a9b6d511eeb65dc858c0b7f92f'),
(14,1,1,'Ghaliza Anandistya Medina','0066765899','U0066765899','0f885',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5636204b6d511eeb65dc858c0b7f92f'),
(15,1,1,'Hadisty Ananda','0064226685','U0064226685','49301',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b563a184b6d511eeb65dc858c0b7f92f'),
(16,1,1,'Haifa Azizah','0064115981','U0064115981','3ad12',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b563df6fb6d511eeb65dc858c0b7f92f'),
(17,1,1,'Izzah Rizqina','0067675678','U0067675678','29452',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5641e57b6d511eeb65dc858c0b7f92f'),
(18,1,1,'Maqsal Mina','0062231412','U0062231412','3ac8f',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5645c33b6d511eeb65dc858c0b7f92f'),
(19,1,1,'Muhammad Rafiqul Abbrar','0068042913','U0068042913','2ff87',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5649a5fb6d511eeb65dc858c0b7f92f'),
(20,1,1,'Muhammad Rayyis Rasikh','0062475153','U0062475153','88771',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b56516f9b6d511eeb65dc858c0b7f92f'),
(21,1,1,'Nabila Alya Zahra','0061728059','U0061728059','5eb4d',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b56571eeb6d511eeb65dc858c0b7f92f'),
(22,1,1,'Nayla Putri Agustin','0063723566','U0063723566','ed8a0',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b565d61eb6d511eeb65dc858c0b7f92f'),
(23,1,1,'Naylatul Uhiya','0066038509','U0066038509','ded87',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5661d6cb6d511eeb65dc858c0b7f92f'),
(24,1,1,'Nouval Temas Mico','0051515150','U0051515150','429bf',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5665cdbb6d511eeb65dc858c0b7f92f'),
(25,1,1,'Raisya Nikmatul Maula','0069297662','U0069297662','1108f',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5669c9ab6d511eeb65dc858c0b7f92f'),
(26,1,1,'Reza Aulia','0063784793','U0063784793','0d4ce',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b566dacfb6d511eeb65dc858c0b7f92f'),
(27,1,1,'Ridho Adha','0068307640','U0068307640','35073',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5671d87b6d511eeb65dc858c0b7f92f'),
(28,1,1,'Riva Afaiza','0062599709','U0062599709','ee484',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5675bb3b6d511eeb65dc858c0b7f92f'),
(29,1,1,'Syauqi Amran','0067129512','U0067129512','c152a',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b5679bedb6d511eeb65dc858c0b7f92f'),
(30,1,1,'Syifaus Syauqina','0062471428','U0062471428','d2047',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b567fd4ab6d511eeb65dc858c0b7f92f'),
(31,1,1,'Zaqi Aulia','0067476158','U0067476158','7d852',NULL,NULL,NULL,'2024-01-19 21:19:08','2024-01-19 21:19:08',1,1,NULL,NULL,NULL,0,'b56842b0b6d511eeb65dc858c0b7f92f');

/*Table structure for table `tx_profile` */

DROP TABLE IF EXISTS `tx_profile`;

CREATE TABLE `tx_profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `timezone` varchar(40) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_profile` */

insert  into `tx_profile`(`user_id`,`name`,`public_email`,`gravatar_email`,`gravatar_id`,`location`,`website`,`timezone`,`bio`,`file_name`) values 
(1,'Nanta Es',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tx_room` */

insert  into `tx_room`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(2,1,'Ruang 1',1,'-','2024-01-16 13:36:04','2024-01-16 13:36:04',1,1,NULL,NULL,NULL,0,'8607a981b43911ee80c4c858c0b7f92f');

/*Table structure for table `tx_schedule` */

DROP TABLE IF EXISTS `tx_schedule`;

CREATE TABLE `tx_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
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
  CONSTRAINT `Fk_schedule_group` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`),
  CONSTRAINT `Fk_schedule_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  CONSTRAINT `Fk_schedule_room` FOREIGN KEY (`room_id`) REFERENCES `tx_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tx_schedule` */

insert  into `tx_schedule`(`id`,`office_id`,`title`,`group_id`,`room_id`,`date_start`,`date_end`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(50,1,'Matematika #1',1,2,'2024-01-22 16:19:34','2024-01-22 16:19:34','','2024-01-22 16:19:50','2024-01-22 16:19:50',1,1,NULL,NULL,NULL,0,'653385e9b90711ee8c67c858c0b7f92f');

/*Table structure for table `tx_schedule_detail` */

DROP TABLE IF EXISTS `tx_schedule_detail`;

CREATE TABLE `tx_schedule_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tx_schedule_detail` */

insert  into `tx_schedule_detail`(`id`,`office_id`,`schedule_id`,`subject_id`,`remark`,`asset_name`,`asset_url`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(60,1,50,1,'Bab 1',NULL,NULL,'2024-01-22 16:19:50','2024-01-22 20:13:52',1,1,NULL,NULL,NULL,2,'6534194bb90711ee8c67c858c0b7f92f');

/*Table structure for table `tx_session` */

DROP TABLE IF EXISTS `tx_session`;

CREATE TABLE `tx_session` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `tx_session` */

insert  into `tx_session`(`id`,`expire`,`data`) values 
('2g8b42vv2dnn4r5se8pk96p026',1705807293,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('5r0mqp593f0v33lutmvli0goob',1705807299,'__flash|a:0:{}'),
('72a29djrl0741ud01mel30dr8m',1705593795,'__flash|a:0:{}__returnUrl|s:52:\"http://localhost/application/yii2-cbt-ispring/admin/\";__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('75lnmi6e0u40hn1uhqp1850920',1705678221,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('brb7h206s9llot96i1d5cimf54',1705928375,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('c0ilrnqgoi5pdqfhlc0g2fd2r5',1705898724,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('gof0q8lkv1arbn96ha7g0c1bt5',1705770208,'__flash|a:0:{}'),
('hlblk3eu3qus6oqvvr7avivn3b',1705916690,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('loqi2jadtvn65upcu7aj7d3jdk',1705515606,'__flash|a:0:{}__returnUrl|s:52:\"http://localhost/application/yii2-cbt-ispring/admin/\";__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('m9rvb8rdlm4qphktkve41h7kuf',1705771273,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('oe2j5urdessr88qt966ndc7s96',1705845721,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('pe2a6nc289akoso0v8hr8oqats',1705932562,'__flash|a:0:{}'),
('si3c3kgs2j2h45lup3blb82381',1705810109,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";'),
('svhnrlb2tin8eq1n379a47ulqm',1705826134,'__flash|a:0:{}'),
('uoas0mcdmmsnb0nm43bj63tsvu',1705860730,'__flash|a:0:{}__id|i:1;__authKey|s:32:\"e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm\";');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tx_site_link` */

/*Table structure for table `tx_social_account` */

DROP TABLE IF EXISTS `tx_social_account`;

CREATE TABLE `tx_social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `tx_staff` */

insert  into `tx_staff`(`id`,`user_id`,`office_id`,`employment_id`,`title`,`initial`,`identity_number`,`phone_number`,`gender_status`,`active_status`,`address`,`asset_name`,`email`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,1,1,'Nanta Es','Ade','123','123',1,1,'-','654f25f00c353.jpg','asdf','-','2023-08-23 22:29:45','2023-11-11 13:57:56',1,1,NULL,NULL,NULL,6,NULL),
(2,2,2,2,'rajahati',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2023-11-03 21:34:23','2023-11-03 21:34:23',1,1,NULL,NULL,NULL,0,'109bc5fe7a5611eeaaf5441ea14ed578'),
(3,3,2,3,'Sadiqul Wahyudi','',NULL,'',NULL,1,'','','','','2024-01-02 15:18:52','2024-01-02 16:32:45',2,2,NULL,NULL,NULL,1,'913a1c0aa94711ee97d144a84247fe3b'),
(4,4,2,3,'Afna Lilia',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-01-02 16:31:29','2024-01-02 16:31:29',2,2,NULL,NULL,NULL,0,'b6529c42a95111ee97d144a84247fe3b'),
(5,5,2,3,'Nurahmah Yanti',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-01-02 16:32:14','2024-01-02 16:32:14',2,2,NULL,NULL,NULL,0,'d0cd01a6a95111ee97d144a84247fe3b');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tx_subject` */

insert  into `tx_subject`(`id`,`office_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,'Metematika',1,'','2024-01-19 21:18:43','2024-01-19 21:18:43',1,1,NULL,NULL,NULL,0,'a6d26c56b6d511eeb65dc858c0b7f92f');

/*Table structure for table `tx_tag` */

DROP TABLE IF EXISTS `tx_tag`;

CREATE TABLE `tx_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(150) NOT NULL,
  `frequency` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tx_theme` */

insert  into `tx_theme`(`id`,`office_id`,`title`,`theme_type`,`content`,`asset_name`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`,`uuid`) values 
(1,1,'Logo Frontend Header',1,NULL,NULL,'Logo Frontend Header','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'eb910935-7a55-11ee-aaf5-441ea14ed578'),
(2,1,'Logo Frontend Footer',2,NULL,NULL,'Logo Frontend Footer','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'eb910cd7-7a55-11ee-aaf5-441ea14ed578'),
(3,1,'Logo Backend Header',3,NULL,NULL,'Logo Backend Header','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'eb910de7-7a55-11ee-aaf5-441ea14ed578'),
(4,1,'Logo Backend Footer',4,NULL,NULL,'Logo Backend Footer','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'eb910e82-7a55-11ee-aaf5-441ea14ed578'),
(5,1,'Logo Report',5,NULL,NULL,'Logo Report','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'eb910f02-7a55-11ee-aaf5-441ea14ed578'),
(6,1,'Logo Invoice',6,NULL,NULL,'Logo Invoice','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'eb910f7a-7a55-11ee-aaf5-441ea14ed578'),
(7,1,'Title',7,NULL,NULL,'Title','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'eb910ff0-7a55-11ee-aaf5-441ea14ed578'),
(8,1,'Content',8,NULL,NULL,'Content','2023-09-17 20:25:47','2023-09-17 20:25:47',1,1,NULL,NULL,NULL,0,'eb911062-7a55-11ee-aaf5-441ea14ed578'),
(9,2,'Logo Frontend Header',1,NULL,NULL,'Logo Frontend Header','2023-11-03 21:34:23','2023-11-03 21:34:23',1,1,NULL,NULL,NULL,0,'109db2d67a5611eeaaf5441ea14ed578'),
(10,2,'Logo Frontend Footer',2,NULL,NULL,'Logo Frontend Footer','2023-11-03 21:34:23','2023-11-03 21:34:23',1,1,NULL,NULL,NULL,0,'109ddcae7a5611eeaaf5441ea14ed578'),
(11,2,'Logo Backend Header',3,NULL,NULL,'Logo Backend Header','2023-11-03 21:34:23','2023-11-03 21:34:23',1,1,NULL,NULL,NULL,0,'109e05d97a5611eeaaf5441ea14ed578'),
(12,2,'Logo Backend Footer',4,NULL,NULL,'Logo Backend Footer','2023-11-03 21:34:23','2023-11-03 21:34:23',1,1,NULL,NULL,NULL,0,'109e2e7e7a5611eeaaf5441ea14ed578'),
(13,2,'Logo Report',5,NULL,NULL,'Logo Report','2023-11-03 21:34:23','2023-11-03 21:34:23',1,1,NULL,NULL,NULL,0,'10a042557a5611eeaaf5441ea14ed578'),
(14,2,'Logo Invoice',6,NULL,NULL,'Logo Invoice','2023-11-03 21:34:23','2023-11-03 21:34:23',1,1,NULL,NULL,NULL,0,'10a090db7a5611eeaaf5441ea14ed578'),
(15,2,'Title',7,NULL,NULL,'Title','2023-11-03 21:34:23','2023-11-03 21:34:23',1,1,NULL,NULL,NULL,0,'10a0cc5e7a5611eeaaf5441ea14ed578'),
(16,2,'Content',8,NULL,NULL,'Content','2023-11-03 21:34:23','2023-11-03 21:34:23',1,1,NULL,NULL,NULL,0,'10a0fee07a5611eeaaf5441ea14ed578');

/*Table structure for table `tx_user` */

DROP TABLE IF EXISTS `tx_user`;

CREATE TABLE `tx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `confirmed_at` int(11) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `last_login_at` int(11) DEFAULT NULL,
  `auth_tf_key` varchar(16) DEFAULT NULL,
  `auth_tf_enabled` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_email` (`email`),
  UNIQUE KEY `idx_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_user` */

insert  into `tx_user`(`id`,`username`,`email`,`password_hash`,`auth_key`,`unconfirmed_email`,`registration_ip`,`flags`,`confirmed_at`,`blocked_at`,`updated_at`,`created_at`,`last_login_at`,`auth_tf_key`,`auth_tf_enabled`) values 
(1,'admin','ombakrinai@gmail.com','$2y$10$oD129/e5PjrTkIV1yiR3AuOc2/XAOXLWgKPfb8svo8BdBA4PUsw3G','e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm',NULL,NULL,0,NULL,NULL,1675777211,1675777211,1705928360,NULL,0),
(2,'rajahati','rajahati@oke.com','$2y$12$ZBs3Bnv1RrdVWxhrxNMeLeT9Fr1EdLD1T6zY70KJ.fzkOxOilVgFy','oyb5maS0UL9P11U6EUjDo4ok980M8wNR',NULL,'180.241.44.219',0,NULL,NULL,1699022063,1699022063,1705159096,NULL,0),
(3,'sadiqulwahyudi@gmail.com','sadiqulwahyudi@gmail.com','$2y$12$evPFMD73ILudJ/lF4qfIh.Lt9QmrZ77aOPA/bTxzkNTu/0suIIyNK','ecNmxD3FGiFOf5HX7J3pwtuqN16GPxZo',NULL,'180.241.46.7',0,NULL,NULL,1704188118,1704183532,1704560204,NULL,0),
(4,'afna','afna@rajahati.com','$2y$12$fwJhdAvfKR86cj4oHi2QbuVU7C1woAXuBgw13fqM/RXYUfg8vkXKe','ukgumez3ivNnx9mOazFJiVBKM0Ebyzmh',NULL,'36.85.110.2',0,NULL,NULL,1704187889,1704187889,1704196731,NULL,0),
(5,'rahmah','rahmah@rajahati.com','$2y$12$Hwyf/DkFNWzes4pOZtWXmO.9.ZYwWp3D8IyaAbAz6Xi4v.QekcEj.','lWP3wX6sso0DVqiXJGJX8JW1TqJ5o7VI',NULL,'36.85.110.2',0,NULL,NULL,1704187934,1704187934,1704194261,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
