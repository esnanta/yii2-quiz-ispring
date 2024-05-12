-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2024 at 08:15 AM
-- Server version: 8.4.0
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2_quiz_ispring`
--

-- --------------------------------------------------------

--
-- Table structure for table `tx_archive`
--

CREATE TABLE `tx_archive` (
  `id` int NOT NULL,
  `office_id` int DEFAULT NULL,
  `is_visible` int DEFAULT NULL,
  `archive_type` int DEFAULT NULL,
  `archive_category_id` int DEFAULT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tx_archive`
--

INSERT INTO `tx_archive` (`id`, `office_id`, `is_visible`, `archive_type`, `archive_category_id`, `title`, `date_issued`, `asset_name`, `asset_url`, `size`, `mime_type`, `view_counter`, `download_counter`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(3, 1, 1, 2, 5, 'Data siswa XII 1 - 24', '2024-01-17', '_663c88d4e212d.xlsx', NULL, NULL, NULL, 0, 1, '', '2024-01-17 23:29:35', '2024-05-09 15:27:00', 1, 1, NULL, NULL, NULL, 14, '99d2cde2b55511ee9384c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_archive_category`
--

CREATE TABLE `tx_archive_category` (
  `id` int NOT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tx_archive_category`
--

INSERT INTO `tx_archive_category` (`id`, `office_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(5, 1, 'Test', 1, '', '2024-01-17 23:20:28', '2024-01-17 23:20:28', 1, 1, NULL, NULL, NULL, 0, '53bcf82eb55411ee9384c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_assessment`
--

CREATE TABLE `tx_assessment` (
  `id` int NOT NULL,
  `office_id` int DEFAULT NULL,
  `schedule_id` int DEFAULT NULL,
  `schedule_detail_id` int DEFAULT NULL,
  `participant_id` int DEFAULT NULL,
  `period_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `subject_type` int DEFAULT NULL,
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
  `work_status` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tx_assessment`
--

INSERT INTO `tx_assessment` (`id`, `office_id`, `schedule_id`, `schedule_detail_id`, `participant_id`, `period_id`, `subject_id`, `subject_type`, `app_version`, `earned_points`, `passing_score`, `passing_score_percent`, `gained_score`, `evaluate_score`, `quiz_title`, `quiz_type`, `username`, `time_limit`, `used_time`, `time_spent`, `work_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(6, 1, 1, 1, 147, 2, 15, 2, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-12 13:12:59', '2024-05-12 13:12:59', 147, 147, NULL, NULL, NULL, 0, 'ae6fa8b2102611ef953fc858c0b7f92f'),
(7, 1, 1, 1, 148, 2, 15, 2, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-12 13:14:27', '2024-05-12 13:14:27', 148, 148, NULL, NULL, NULL, 0, 'e2f27e67102611ef953fc858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_assignment`
--

CREATE TABLE `tx_auth_assignment` (
  `item_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tx_auth_assignment`
--

INSERT INTO `tx_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1715484149);

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_item`
--

CREATE TABLE `tx_auth_item` (
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` smallint NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tx_auth_item`
--

INSERT INTO `tx_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Admin', NULL, NULL, 1715484149, 1715484149),
('create-archive', 2, 'Create Archive', NULL, NULL, 1715484149, 1715484149),
('create-archivecategory', 2, 'Create Archive Category', NULL, NULL, 1715484149, 1715484149),
('create-assessment', 2, 'Create Assessment', NULL, NULL, 1715484149, 1715484149),
('create-employment', 2, 'Create Employment', NULL, NULL, 1715484149, 1715484149),
('create-group', 2, 'Create Group', NULL, NULL, 1715484149, 1715484149),
('create-ispring-master', 2, 'Create Ispring Master', NULL, NULL, 1715484149, 1715484149),
('create-ispring-transaction', 2, 'Create Ispring Transaction', NULL, NULL, 1715484149, 1715484149),
('create-master', 2, 'Create Master', NULL, NULL, 1715484149, 1715484149),
('create-office', 2, 'Create Office', NULL, NULL, 1715484149, 1715484149),
('create-participant', 2, 'Create Participant', NULL, NULL, 1715484149, 1715484149),
('create-period', 2, 'Create Period', NULL, NULL, 1715484149, 1715484149),
('create-profile', 2, 'Create Profile', NULL, NULL, 1715484149, 1715484149),
('create-room', 2, 'Create Room', NULL, NULL, 1715484149, 1715484149),
('create-schedule', 2, 'Create Schedule', NULL, NULL, 1715484149, 1715484149),
('create-scheduledetail', 2, 'Create Schedule Detail', NULL, NULL, 1715484149, 1715484149),
('create-staff', 2, 'Create Staff', NULL, NULL, 1715484149, 1715484149),
('create-subject', 2, 'Create Subject', NULL, NULL, 1715484149, 1715484149),
('create-theme', 2, 'Create Theme', NULL, NULL, 1715484149, 1715484149),
('create-transaction', 2, 'Create Transaction', NULL, NULL, 1715484149, 1715484149),
('delete-archive', 2, 'Delete Archive', NULL, NULL, 1715484149, 1715484149),
('delete-archivecategory', 2, 'Delete Archive Category', NULL, NULL, 1715484149, 1715484149),
('delete-assessment', 2, 'Delete Assessment', NULL, NULL, 1715484149, 1715484149),
('delete-employment', 2, 'Delete Employment', NULL, NULL, 1715484149, 1715484149),
('delete-group', 2, 'Delete Group', NULL, NULL, 1715484149, 1715484149),
('delete-ispring-master', 2, 'Delete Ispring Master', NULL, NULL, 1715484149, 1715484149),
('delete-ispring-transaction', 2, 'Delete Ispring Transaction', NULL, NULL, 1715484149, 1715484149),
('delete-master', 2, 'Delete Master', NULL, NULL, 1715484149, 1715484149),
('delete-office', 2, 'Delete Office', NULL, NULL, 1715484149, 1715484149),
('delete-participant', 2, 'Delete Participant', NULL, NULL, 1715484149, 1715484149),
('delete-period', 2, 'Delete Period', NULL, NULL, 1715484149, 1715484149),
('delete-profile', 2, 'Delete Profile', NULL, NULL, 1715484149, 1715484149),
('delete-room', 2, 'Delete Room', NULL, NULL, 1715484149, 1715484149),
('delete-schedule', 2, 'Delete Schedule', NULL, NULL, 1715484149, 1715484149),
('delete-scheduledetail', 2, 'Delete Schedule Detail', NULL, NULL, 1715484149, 1715484149),
('delete-staff', 2, 'Delete Staff', NULL, NULL, 1715484149, 1715484149),
('delete-subject', 2, 'Delete Subject', NULL, NULL, 1715484149, 1715484149),
('delete-theme', 2, 'Delete Theme', NULL, NULL, 1715484149, 1715484149),
('delete-transaction', 2, 'Delete Transaction', NULL, NULL, 1715484149, 1715484149),
('guest', 1, 'Guest', NULL, NULL, 1715484149, 1715484149),
('index-archive', 2, 'Index Archive', NULL, NULL, 1715484149, 1715484149),
('index-archivecategory', 2, 'Index Archive Category', NULL, NULL, 1715484149, 1715484149),
('index-assessment', 2, 'Index Assessment', NULL, NULL, 1715484149, 1715484149),
('index-employment', 2, 'Index Employment', NULL, NULL, 1715484149, 1715484149),
('index-group', 2, 'Index Group', NULL, NULL, 1715484149, 1715484149),
('index-ispring-master', 2, 'Index Ispring Master', NULL, NULL, 1715484149, 1715484149),
('index-ispring-transaction', 2, 'Index Ispring Transaction', NULL, NULL, 1715484149, 1715484149),
('index-master', 2, 'Index Master', NULL, NULL, 1715484149, 1715484149),
('index-office', 2, 'Index Office', NULL, NULL, 1715484149, 1715484149),
('index-participant', 2, 'Index Participant', NULL, NULL, 1715484149, 1715484149),
('index-period', 2, 'Index Period', NULL, NULL, 1715484149, 1715484149),
('index-profile', 2, 'Index Profile', NULL, NULL, 1715484149, 1715484149),
('index-room', 2, 'Index Room', NULL, NULL, 1715484149, 1715484149),
('index-schedule', 2, 'Index Schedule', NULL, NULL, 1715484149, 1715484149),
('index-scheduledetail', 2, 'Index Schedule Detail', NULL, NULL, 1715484149, 1715484149),
('index-staff', 2, 'Index Staff', NULL, NULL, 1715484149, 1715484149),
('index-subject', 2, 'Index Subject', NULL, NULL, 1715484149, 1715484149),
('index-theme', 2, 'Index Theme', NULL, NULL, 1715484149, 1715484149),
('index-transaction', 2, 'Index Transaction', NULL, NULL, 1715484149, 1715484149),
('owner', 1, 'Company Owner', NULL, NULL, 1715484149, 1715484149),
('participant', 1, 'Participant', NULL, NULL, 1715484149, 1715484149),
('reguler', 1, 'Reguler', NULL, NULL, 1715484149, 1715484149),
('report-archive', 2, 'Report Archive', NULL, NULL, 1715484149, 1715484149),
('report-archivecategory', 2, 'Report Archive Category', NULL, NULL, 1715484149, 1715484149),
('report-assessment', 2, 'Report Assessment', NULL, NULL, 1715484149, 1715484149),
('report-group', 2, 'Report Group', NULL, NULL, 1715484149, 1715484149),
('report-ispring-master', 2, 'Report Ispring Master', NULL, NULL, 1715484149, 1715484149),
('report-ispring-transaction', 2, 'Report Ispring Transaction', NULL, NULL, 1715484149, 1715484149),
('report-master', 2, 'Report Master', NULL, NULL, 1715484149, 1715484149),
('report-participant', 2, 'Report Participant', NULL, NULL, 1715484149, 1715484149),
('report-period', 2, 'Report Period', NULL, NULL, 1715484149, 1715484149),
('report-room', 2, 'Report Room', NULL, NULL, 1715484149, 1715484149),
('report-schedule', 2, 'Report Schedule', NULL, NULL, 1715484149, 1715484149),
('report-scheduledetail', 2, 'Report Schedule Detail', NULL, NULL, 1715484149, 1715484149),
('report-subject', 2, 'Report Subject', NULL, NULL, 1715484149, 1715484149),
('report-transaction', 2, 'Report Transaction', NULL, NULL, 1715484149, 1715484149),
('update-archive', 2, 'Update Archive', NULL, NULL, 1715484149, 1715484149),
('update-archivecategory', 2, 'Update Archive Category', NULL, NULL, 1715484149, 1715484149),
('update-assessment', 2, 'Update Assessment', NULL, NULL, 1715484149, 1715484149),
('update-employment', 2, 'Update Employment', NULL, NULL, 1715484149, 1715484149),
('update-group', 2, 'Update Group', NULL, NULL, 1715484149, 1715484149),
('update-ispring-master', 2, 'Update Ispring Master', NULL, NULL, 1715484149, 1715484149),
('update-ispring-transaction', 2, 'Update Ispring Transaction', NULL, NULL, 1715484149, 1715484149),
('update-master', 2, 'Update Master', NULL, NULL, 1715484149, 1715484149),
('update-office', 2, 'Update Office', NULL, NULL, 1715484149, 1715484149),
('update-participant', 2, 'Update Participant', NULL, NULL, 1715484149, 1715484149),
('update-period', 2, 'Update Period', NULL, NULL, 1715484149, 1715484149),
('update-profile', 2, 'Update Profile', NULL, NULL, 1715484149, 1715484149),
('update-room', 2, 'Update Room', NULL, NULL, 1715484149, 1715484149),
('update-schedule', 2, 'Update Schedule', NULL, NULL, 1715484149, 1715484149),
('update-scheduledetail', 2, 'Update Schedule Detail', NULL, NULL, 1715484149, 1715484149),
('update-staff', 2, 'Update Staff', NULL, NULL, 1715484149, 1715484149),
('update-subject', 2, 'Update Subject', NULL, NULL, 1715484149, 1715484149),
('update-theme', 2, 'Update Theme', NULL, NULL, 1715484149, 1715484149),
('update-transaction', 2, 'Update Transaction', NULL, NULL, 1715484149, 1715484149),
('view-archive', 2, 'View Archive', NULL, NULL, 1715484149, 1715484149),
('view-archivecategory', 2, 'View Archive Category', NULL, NULL, 1715484149, 1715484149),
('view-assessment', 2, 'View Assessment', NULL, NULL, 1715484149, 1715484149),
('view-employment', 2, 'View Employment', NULL, NULL, 1715484149, 1715484149),
('view-group', 2, 'View Group', NULL, NULL, 1715484149, 1715484149),
('view-ispring-master', 2, 'View Ispring Master', NULL, NULL, 1715484149, 1715484149),
('view-ispring-transaction', 2, 'View Ispring Transaction', NULL, NULL, 1715484149, 1715484149),
('view-master', 2, 'View Master', NULL, NULL, 1715484149, 1715484149),
('view-office', 2, 'View Office', NULL, NULL, 1715484149, 1715484149),
('view-participant', 2, 'View Participant', NULL, NULL, 1715484149, 1715484149),
('view-period', 2, 'View Period', NULL, NULL, 1715484149, 1715484149),
('view-profile', 2, 'View Profile', NULL, NULL, 1715484149, 1715484149),
('view-room', 2, 'View Room', NULL, NULL, 1715484149, 1715484149),
('view-schedule', 2, 'View Schedule', NULL, NULL, 1715484149, 1715484149),
('view-scheduledetail', 2, 'View Schedule Detail', NULL, NULL, 1715484149, 1715484149),
('view-staff', 2, 'View Staff', NULL, NULL, 1715484149, 1715484149),
('view-subject', 2, 'View Subject', NULL, NULL, 1715484149, 1715484149),
('view-theme', 2, 'View Theme', NULL, NULL, 1715484149, 1715484149),
('view-transaction', 2, 'View Transaction', NULL, NULL, 1715484149, 1715484149);

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_item_child`
--

CREATE TABLE `tx_auth_item_child` (
  `parent` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tx_auth_item_child`
--

INSERT INTO `tx_auth_item_child` (`parent`, `child`) VALUES
('create-transaction', 'create-archive'),
('create-master', 'create-archivecategory'),
('create-ispring-transaction', 'create-assessment'),
('create-master', 'create-employment'),
('create-ispring-master', 'create-group'),
('admin', 'create-ispring-master'),
('owner', 'create-ispring-master'),
('admin', 'create-ispring-transaction'),
('owner', 'create-ispring-transaction'),
('reguler', 'create-ispring-transaction'),
('admin', 'create-master'),
('owner', 'create-master'),
('create-master', 'create-office'),
('create-ispring-master', 'create-participant'),
('create-ispring-master', 'create-period'),
('create-master', 'create-profile'),
('create-ispring-master', 'create-room'),
('create-ispring-master', 'create-schedule'),
('create-ispring-master', 'create-scheduledetail'),
('create-master', 'create-staff'),
('create-ispring-master', 'create-subject'),
('create-master', 'create-theme'),
('admin', 'create-transaction'),
('owner', 'create-transaction'),
('reguler', 'create-transaction'),
('delete-transaction', 'delete-archive'),
('delete-master', 'delete-archivecategory'),
('delete-ispring-transaction', 'delete-assessment'),
('delete-master', 'delete-employment'),
('delete-ispring-master', 'delete-group'),
('admin', 'delete-ispring-master'),
('owner', 'delete-ispring-master'),
('admin', 'delete-ispring-transaction'),
('owner', 'delete-ispring-transaction'),
('admin', 'delete-master'),
('owner', 'delete-master'),
('delete-master', 'delete-office'),
('delete-ispring-master', 'delete-participant'),
('delete-ispring-master', 'delete-period'),
('delete-master', 'delete-profile'),
('delete-ispring-master', 'delete-room'),
('delete-ispring-master', 'delete-schedule'),
('delete-ispring-master', 'delete-scheduledetail'),
('delete-master', 'delete-staff'),
('delete-ispring-master', 'delete-subject'),
('delete-master', 'delete-theme'),
('admin', 'delete-transaction'),
('owner', 'delete-transaction'),
('reguler', 'delete-transaction'),
('guest', 'index-archive'),
('index-transaction', 'index-archive'),
('index-master', 'index-archivecategory'),
('index-ispring-transaction', 'index-assessment'),
('index-master', 'index-employment'),
('index-ispring-master', 'index-group'),
('admin', 'index-ispring-master'),
('owner', 'index-ispring-master'),
('reguler', 'index-ispring-master'),
('admin', 'index-ispring-transaction'),
('owner', 'index-ispring-transaction'),
('reguler', 'index-ispring-transaction'),
('admin', 'index-master'),
('owner', 'index-master'),
('reguler', 'index-master'),
('index-master', 'index-office'),
('index-ispring-master', 'index-participant'),
('index-ispring-master', 'index-period'),
('index-master', 'index-profile'),
('index-ispring-master', 'index-room'),
('index-ispring-master', 'index-schedule'),
('index-ispring-master', 'index-scheduledetail'),
('index-master', 'index-staff'),
('index-ispring-master', 'index-subject'),
('index-master', 'index-theme'),
('admin', 'index-transaction'),
('owner', 'index-transaction'),
('reguler', 'index-transaction'),
('report-transaction', 'report-archive'),
('report-master', 'report-archivecategory'),
('report-ispring-transaction', 'report-assessment'),
('report-ispring-master', 'report-group'),
('admin', 'report-ispring-master'),
('owner', 'report-ispring-master'),
('reguler', 'report-ispring-master'),
('admin', 'report-ispring-transaction'),
('owner', 'report-ispring-transaction'),
('reguler', 'report-ispring-transaction'),
('admin', 'report-master'),
('owner', 'report-master'),
('report-ispring-master', 'report-participant'),
('report-ispring-master', 'report-period'),
('report-ispring-master', 'report-room'),
('report-ispring-master', 'report-schedule'),
('report-ispring-master', 'report-scheduledetail'),
('report-ispring-master', 'report-subject'),
('admin', 'report-transaction'),
('owner', 'report-transaction'),
('reguler', 'report-transaction'),
('update-transaction', 'update-archive'),
('update-master', 'update-archivecategory'),
('update-ispring-transaction', 'update-assessment'),
('update-master', 'update-employment'),
('update-ispring-master', 'update-group'),
('admin', 'update-ispring-master'),
('owner', 'update-ispring-master'),
('admin', 'update-ispring-transaction'),
('owner', 'update-ispring-transaction'),
('admin', 'update-master'),
('owner', 'update-master'),
('update-master', 'update-office'),
('update-ispring-master', 'update-participant'),
('update-ispring-master', 'update-period'),
('reguler', 'update-profile'),
('update-master', 'update-profile'),
('update-ispring-master', 'update-room'),
('update-ispring-master', 'update-schedule'),
('update-ispring-master', 'update-scheduledetail'),
('update-master', 'update-staff'),
('update-ispring-master', 'update-subject'),
('update-master', 'update-theme'),
('admin', 'update-transaction'),
('owner', 'update-transaction'),
('reguler', 'update-transaction'),
('guest', 'view-archive'),
('view-transaction', 'view-archive'),
('view-master', 'view-archivecategory'),
('view-ispring-transaction', 'view-assessment'),
('view-master', 'view-employment'),
('view-ispring-master', 'view-group'),
('admin', 'view-ispring-master'),
('owner', 'view-ispring-master'),
('reguler', 'view-ispring-master'),
('admin', 'view-ispring-transaction'),
('owner', 'view-ispring-transaction'),
('reguler', 'view-ispring-transaction'),
('admin', 'view-master'),
('owner', 'view-master'),
('reguler', 'view-master'),
('view-master', 'view-office'),
('view-ispring-master', 'view-participant'),
('view-ispring-master', 'view-period'),
('reguler', 'view-profile'),
('view-master', 'view-profile'),
('view-ispring-master', 'view-room'),
('view-ispring-master', 'view-schedule'),
('view-ispring-master', 'view-scheduledetail'),
('view-master', 'view-staff'),
('view-ispring-master', 'view-subject'),
('view-master', 'view-theme'),
('admin', 'view-transaction'),
('owner', 'view-transaction'),
('reguler', 'view-transaction');

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_rule`
--

CREATE TABLE `tx_auth_rule` (
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_counter`
--

CREATE TABLE `tx_counter` (
  `id` int NOT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tx_counter`
--

INSERT INTO `tx_counter` (`id`, `office_id`, `title`, `counter`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(1, 1, 'SCD', 1, '2024-05-11 04:20:52', '2024-05-11 04:20:52', 1, 1, NULL, NULL, NULL, 0, '2e19ca3d0f1311ef8849c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_dashblock`
--

CREATE TABLE `tx_dashblock` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `actions` text,
  `weight` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tx_employment`
--

CREATE TABLE `tx_employment` (
  `id` int NOT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tx_employment`
--

INSERT INTO `tx_employment` (`id`, `office_id`, `title`, `description`, `sequence`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(1, 1, 'Manajer', '-', 1, '2023-08-22 22:30:26', '2023-08-22 22:31:50', 1, 1, NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tx_event`
--

CREATE TABLE `tx_event` (
  `id` int NOT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tx_group`
--

CREATE TABLE `tx_group` (
  `id` int NOT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tx_group`
--

INSERT INTO `tx_group` (`id`, `office_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(12, 1, 'X1', 1, 'Kelas X1', '2024-05-10 13:11:55', '2024-05-10 13:11:55', 1, 1, NULL, NULL, NULL, 0, '334d304b0e9411ef9f9dc858c0b7f92f'),
(13, 1, 'X3', 2, 'Kelas X3', '2024-05-10 13:11:55', '2024-05-10 13:11:55', 1, 1, NULL, NULL, NULL, 0, '334de8f30e9411ef9f9dc858c0b7f92f'),
(14, 1, 'XI 2', 3, 'Kelas XI 2', '2024-05-10 13:11:55', '2024-05-10 13:11:55', 1, 1, NULL, NULL, NULL, 0, '334e65b70e9411ef9f9dc858c0b7f92f'),
(15, 1, 'XI 3', 4, 'Kelas XI 3', '2024-05-10 13:11:55', '2024-05-10 13:11:55', 1, 1, NULL, NULL, NULL, 0, '334ed8cd0e9411ef9f9dc858c0b7f92f'),
(16, 1, 'XII-1', 5, 'Kelas XII-1', '2024-05-10 13:11:55', '2024-05-10 13:11:55', 1, 1, NULL, NULL, NULL, 0, '334f6de10e9411ef9f9dc858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_migration`
--

CREATE TABLE `tx_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_office`
--

CREATE TABLE `tx_office` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
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
  `description` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tx_office`
--

INSERT INTO `tx_office` (`id`, `user_id`, `unique_id`, `title`, `phone_number`, `fax_number`, `email`, `web`, `address`, `latitude`, `longitude`, `facebook`, `google_plus`, `instagram`, `twitter`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(1, 1, '65a7fb0e28f7b', 'Es Nanta ID', '-', NULL, 'ombakrinai@gmail.com', 'esnanta.my.id', '-', NULL, NULL, NULL, NULL, NULL, NULL, '-', '2023-08-18 22:25:10', '2024-01-17 23:06:53', 1, 1, NULL, NULL, NULL, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tx_participant`
--

CREATE TABLE `tx_participant` (
  `id` int NOT NULL,
  `office_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `identity_number` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` smallint DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `auth_key` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tx_participant`
--

INSERT INTO `tx_participant` (`id`, `office_id`, `group_id`, `title`, `identity_number`, `username`, `password`, `email`, `status`, `last_login_at`, `auth_key`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(147, 1, 12, 'Aurelie Schinner', 'molly.jerde@carter.com', 'Umolly.jerde@carter.com', '0915a', 'howard.lueilwitz@gmail.com', 2, '2024-05-12 12:46:32', 'fhsgjPmYEntuo9VKcagjKfWzR2jj3N4H', '2024-05-10 13:11:58', '2024-05-12 13:14:01', 1, 147, NULL, NULL, NULL, 6, '35557a8c0e9411ef9f9dc858c0b7f92f'),
(148, 1, 12, 'Isabel Schiller', 'marcia30@hotmail.com', 'Umarcia30@hotmail.com', '85de0', 'kenyatta.simonis@ernser.com', 3, '2024-05-12 13:14:25', 'D9G-BR5FslDbPo-0Jk7FDJFECUPJPt01', '2024-05-10 13:11:58', '2024-05-12 13:14:25', 1, NULL, NULL, NULL, NULL, 1, '35564b5a0e9411ef9f9dc858c0b7f92f'),
(149, 1, 12, 'Soledad Pfeffer', 'paucek.duncan@gerhold.info', 'Upaucek.duncan@gerhold.info', 'ea6c3', 'lmaggio@halvorson.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '35568c940e9411ef9f9dc858c0b7f92f'),
(150, 1, 12, 'Lilla Murazik', 'oflatley@bauch.com', 'Uoflatley@bauch.com', '3fe61', 'bruen.ben@lesch.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '35571ea50e9411ef9f9dc858c0b7f92f'),
(151, 1, 13, 'Bonnie Schneider', 'pearl54@yahoo.com', 'Upearl54@yahoo.com', '24451', 'nyasia.ward@effertz.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '35578fe40e9411ef9f9dc858c0b7f92f'),
(152, 1, 13, 'Odessa Christiansen', 'john86@stracke.info', 'Ujohn86@stracke.info', 'd2df3', 'ylowe@gmail.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '3557ec330e9411ef9f9dc858c0b7f92f'),
(153, 1, 14, 'Reilly Lebsack', 'paris.buckridge@willms.com', 'Uparis.buckridge@willms.com', '82726', 'tbogisich@gmail.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '35593a020e9411ef9f9dc858c0b7f92f'),
(154, 1, 14, 'Vidal Reilly', 'wyman.batz@yahoo.com', 'Uwyman.batz@yahoo.com', '60cb3', 'garrett64@yahoo.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '355985df0e9411ef9f9dc858c0b7f92f'),
(155, 1, 14, 'Fern Gorczany', 'gulgowski.ryleigh@bauch.com', 'Ugulgowski.ryleigh@bauch.com', 'c1e41', 'rgleason@franecki.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '3559c3850e9411ef9f9dc858c0b7f92f'),
(156, 1, 14, 'Hulda Swaniawski', 'kavon55@gmail.com', 'Ukavon55@gmail.com', '062c0', 'xauer@yahoo.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '3559ff930e9411ef9f9dc858c0b7f92f'),
(157, 1, 14, 'Paul Hill', 'dcummings@schroeder.com', 'Udcummings@schroeder.com', 'e03dd', 'zita.hyatt@carter.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '355a3caf0e9411ef9f9dc858c0b7f92f'),
(158, 1, 15, 'Luella Schuppe', 'greenholt.juston@rutherford.com', 'Ugreenholt.juston@rutherford.com', '6d658', 'lonzo78@feeney.net', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '355b1e4a0e9411ef9f9dc858c0b7f92f'),
(159, 1, 15, 'Tianna Reichel', 'regan.koss@reinger.org', 'Uregan.koss@reinger.org', '99534', 'gspinka@satterfield.net', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '355c43380e9411ef9f9dc858c0b7f92f'),
(160, 1, 15, 'Hillard Erdman', 'jocelyn88@christiansen.net', 'Ujocelyn88@christiansen.net', '76452', 'noelia.wolf@gmail.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '355c96c00e9411ef9f9dc858c0b7f92f'),
(161, 1, 16, 'Beth Kohler', 'lhilpert@kohler.org', 'Ulhilpert@kohler.org', 'd46ee', 'lebsack.leola@gulgowski.net', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '355dca1b0e9411ef9f9dc858c0b7f92f'),
(162, 1, 16, 'Demetris Boehm', 'joana.larson@bogan.com', 'Ujoana.larson@bogan.com', '2f3ea', 'golden.walter@gmail.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '355e101d0e9411ef9f9dc858c0b7f92f'),
(163, 1, 16, 'Tess Goyette', 'orin83@skiles.biz', 'Uorin83@skiles.biz', '2b5a5', 'alabadie@osinski.info', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '355e71710e9411ef9f9dc858c0b7f92f'),
(164, 1, 16, 'Abigayle Emard', 'fidel.baumbach@kling.org', 'Ufidel.baumbach@kling.org', 'c4a76', 'madge.ebert@mills.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '355ed5f30e9411ef9f9dc858c0b7f92f'),
(165, 1, 16, 'Kattie Brekke', 'connie.bergnaum@jaskolski.com', 'Uconnie.bergnaum@jaskolski.com', '279bc', 'nora62@daniel.com', 2, NULL, NULL, '2024-05-10 13:11:58', '2024-05-10 13:11:58', 1, 1, NULL, NULL, NULL, 0, '355f2c9c0e9411ef9f9dc858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_period`
--

CREATE TABLE `tx_period` (
  `id` int NOT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tx_period`
--

INSERT INTO `tx_period` (`id`, `office_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(1, NULL, 'Semester 1', 1, '', '2024-02-14 09:39:06', '2024-02-14 09:39:06', 1, 1, NULL, NULL, NULL, 0, '39503330cae211ee8332c858c0b7f92f'),
(2, 1, 'Semester 1', 1, '', '2024-02-14 09:43:28', '2024-02-14 09:43:28', 1, 1, NULL, NULL, NULL, 0, 'd52bfb6acae211ee8332c858c0b7f92f'),
(3, 1, 'Semester 2', 2, '', '2024-02-14 09:46:25', '2024-02-14 09:46:25', 1, 1, NULL, NULL, NULL, 0, '3ee7aa1bcae311ee8332c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_profile`
--

CREATE TABLE `tx_profile` (
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `file_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tx_profile`
--

INSERT INTO `tx_profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `timezone`, `bio`, `file_name`) VALUES
(1, 'Nanta Es', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tx_quote`
--

CREATE TABLE `tx_quote` (
  `id` int NOT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tx_room`
--

CREATE TABLE `tx_room` (
  `id` int NOT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tx_room`
--

INSERT INTO `tx_room` (`id`, `office_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(2, 1, 'Ruang 1', 1, '-', '2024-01-16 13:36:04', '2024-01-16 13:36:04', 1, 1, NULL, NULL, NULL, 0, '8607a981b43911ee80c4c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_schedule`
--

CREATE TABLE `tx_schedule` (
  `id` int NOT NULL,
  `office_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `period_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tx_schedule`
--

INSERT INTO `tx_schedule` (`id`, `office_id`, `title`, `period_id`, `group_id`, `room_id`, `staff_id`, `date_start`, `date_end`, `token`, `token_time`, `is_asset`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(1, 1, '00001-Bahasa Indonesia', 2, 12, 2, 1, '2024-05-11 04:00:00', '2024-05-13 08:00:00', '360301', '2024-05-12 13:07:12', 2, '', '2024-05-11 04:20:52', '2024-05-12 13:14:52', 1, 1, NULL, NULL, NULL, 26, '2e16a6780f1311ef8849c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_schedule_detail`
--

CREATE TABLE `tx_schedule_detail` (
  `id` int NOT NULL,
  `office_id` int DEFAULT NULL,
  `schedule_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `subject_type` int DEFAULT NULL,
  `remark` tinytext,
  `asset_name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tx_schedule_detail`
--

INSERT INTO `tx_schedule_detail` (`id`, `office_id`, `schedule_id`, `subject_id`, `subject_type`, `remark`, `asset_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(1, 1, 1, 15, 2, 'Kimia', NULL, '2024-05-11 04:20:52', '2024-05-12 13:14:52', 1, 1, NULL, NULL, NULL, 17, '2e1b034b0f1311ef8849c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_session`
--

CREATE TABLE `tx_session` (
  `id` char(32) NOT NULL,
  `expire` int DEFAULT NULL,
  `data` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tx_session`
--

INSERT INTO `tx_session` (`id`, `expire`, `data`) VALUES
('0ktffmjrmvuvaogsk0f2sruv2k', 1715321312, 0x5f5f666c6173687c613a303a7b7d),
('3mr835rk6rhlo2uckv8fihp101', 1715334065, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
('8fk7h7hqnsnkuhjr7288r3r1dg', 1715378283, 0x5f5f666c6173687c613a303a7b7d),
('8uf0ag3c0prp44gtu0ckhfo6lr', 1715310928, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
('973efkfmp4vqcuptfr71947tug', 1715495932, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
('d7j2ldq79ktuisqfoholkcb1bs', 1715485776, 0x5f5f666c6173687c613a303a7b7d5f5f72657475726e55726c7c733a34353a22687474703a2f2f6c6f63616c686f73742f6170702f796969322d7175697a2d69737072696e672f61646d696e2f223b),
('f8s64vm1cq3tufgc8cri3f3oap', 1715380845, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a3134373b5f5f617574684b65797c733a33323a22756862395f534e456145664e587a6774567132594757456b4c44486e63337243223b),
('ff91gj3bstianlevuofja2bc05', 1715309195, 0x5f5f666c6173687c613a303a7b7d),
('ffbpvi0lo2nicemmpe45l2ns23', 1715327727, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
('gorjfjm9lj8pd4lighum2sk745', 1715377922, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
('grv5bcnbtkh2bel5algdtojrpf', 1715488427, 0x5f5f666c6173687c613a303a7b7d),
('h2h3rbf7o8217ma6r08k8m20o0', 1715495918, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a3134383b5f5f617574684b65797c733a33323a224439472d42523546736c4462506f2d304a6b3746444a46454355504a50743031223b),
('nepaijo35jnp2hud1eue9ar6a2', 1715331377, 0x5f5f666c6173687c613a303a7b7d),
('nvck76tdj3m0qqra4aq61va5ba', 1715485864, 0x5f5f666c6173687c613a303a7b7d),
('qc9bopvcbcs24sig6lkmrf1ie6', 1715266149, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
('s7a005t823mfbejejnlq8f64uq', 1715377427, 0x5f5f666c6173687c613a303a7b7d),
('uekimflc97ahlsesbpiam3fj8h', 1715381053, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b);

-- --------------------------------------------------------

--
-- Table structure for table `tx_site_link`
--

CREATE TABLE `tx_site_link` (
  `id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `description` tinytext,
  `created_at` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` bigint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_social_account`
--

CREATE TABLE `tx_social_account` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_staff`
--

CREATE TABLE `tx_staff` (
  `id` int NOT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tx_staff`
--

INSERT INTO `tx_staff` (`id`, `user_id`, `office_id`, `employment_id`, `title`, `initial`, `identity_number`, `phone_number`, `gender_status`, `active_status`, `address`, `asset_name`, `email`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(1, 1, 1, 1, 'Nanta Es', 'Ade', '123', '123', 1, 1, '-', '662a80f98ab73.jpg', 'asdf', '-', '2023-08-23 22:29:45', '2024-04-25 23:12:43', 1, 1, NULL, NULL, NULL, 25, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tx_subject`
--

CREATE TABLE `tx_subject` (
  `id` int NOT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tx_subject`
--

INSERT INTO `tx_subject` (`id`, `office_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(14, 1, 'Matematika', 1, 'Matematika', '2024-05-10 13:11:56', '2024-05-10 13:11:56', 1, 1, NULL, NULL, NULL, 0, '346849760e9411ef9f9dc858c0b7f92f'),
(15, 1, 'Kimia', 2, 'Kimia', '2024-05-10 13:11:56', '2024-05-10 13:11:56', 1, 1, NULL, NULL, NULL, 0, '346966d00e9411ef9f9dc858c0b7f92f'),
(16, 1, 'Fisika', 3, 'Fisika', '2024-05-10 13:11:56', '2024-05-10 13:11:56', 1, 1, NULL, NULL, NULL, 0, '3469fdd50e9411ef9f9dc858c0b7f92f'),
(17, 1, 'Bahasa Indonesia', 4, 'Bahasa Indonesia', '2024-05-10 13:11:56', '2024-05-10 13:11:56', 1, 1, NULL, NULL, NULL, 0, '346a81170e9411ef9f9dc858c0b7f92f'),
(18, 1, 'Sejarah', 5, 'Sejarah', '2024-05-10 13:11:56', '2024-05-10 13:11:56', 1, 1, NULL, NULL, NULL, 0, '346aefe30e9411ef9f9dc858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_tag`
--

CREATE TABLE `tx_tag` (
  `id` int NOT NULL,
  `tag_name` varchar(150) NOT NULL,
  `frequency` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tx_theme`
--

CREATE TABLE `tx_theme` (
  `id` int NOT NULL,
  `office_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `theme_type` int DEFAULT NULL,
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
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_theme`
--

INSERT INTO `tx_theme` (`id`, `office_id`, `title`, `theme_type`, `content`, `asset_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
(1, 1, 'Logo Frontend Header', 1, NULL, NULL, 'Logo Frontend Header', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'fffe01c9-0f12-11ef-8849-c858c0b7f92f'),
(2, 1, 'Logo Frontend Footer', 2, NULL, NULL, 'Logo Frontend Footer', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'fffe04c4-0f12-11ef-8849-c858c0b7f92f'),
(3, 1, 'Logo Backend Header', 3, NULL, NULL, 'Logo Backend Header', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'fffe0520-0f12-11ef-8849-c858c0b7f92f'),
(4, 1, 'Logo Backend Footer', 4, NULL, NULL, 'Logo Backend Footer', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'fffe056d-0f12-11ef-8849-c858c0b7f92f'),
(5, 1, 'Logo Report', 5, NULL, NULL, 'Logo Report', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'fffe05b4-0f12-11ef-8849-c858c0b7f92f'),
(6, 1, 'Logo Invoice', 6, NULL, NULL, 'Logo Invoice', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'fffe0609-0f12-11ef-8849-c858c0b7f92f'),
(7, 1, 'Title', 7, NULL, NULL, 'Title', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'fffe064f-0f12-11ef-8849-c858c0b7f92f'),
(8, 1, 'Content', 8, NULL, NULL, 'Content', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'fffe0695-0f12-11ef-8849-c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_user`
--

CREATE TABLE `tx_user` (
  `id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `unconfirmed_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `registration_ip` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `confirmed_at` int DEFAULT NULL,
  `blocked_at` int DEFAULT NULL,
  `updated_at` int NOT NULL,
  `created_at` int NOT NULL,
  `last_login_at` int DEFAULT NULL,
  `auth_tf_key` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_tf_enabled` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tx_user`
--

INSERT INTO `tx_user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `unconfirmed_email`, `registration_ip`, `flags`, `confirmed_at`, `blocked_at`, `updated_at`, `created_at`, `last_login_at`, `auth_tf_key`, `auth_tf_enabled`) VALUES
(1, 'admin', 'ombakrinai@gmail.com', '$2y$10$oD129/e5PjrTkIV1yiR3AuOc2/XAOXLWgKPfb8svo8BdBA4PUsw3G', 'e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm', NULL, NULL, 0, NULL, NULL, 1675777211, 1675777211, 1715489482, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tx_archive`
--
ALTER TABLE `tx_archive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_archive_category` (`archive_category_id`),
  ADD KEY `FK_tx_archive_office` (`office_id`);

--
-- Indexes for table `tx_archive_category`
--
ALTER TABLE `tx_archive_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_archive_category_office` (`office_id`);

--
-- Indexes for table `tx_assessment`
--
ALTER TABLE `tx_assessment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_assessment_detail_office` (`office_id`),
  ADD KEY `Fk_assessment_detail_assessment` (`schedule_id`),
  ADD KEY `Fk_assessment_detail_participant` (`participant_id`),
  ADD KEY `Fk_assessment_detail_schedule_detail` (`schedule_detail_id`),
  ADD KEY `Fk_assessment_detail_subject` (`subject_id`),
  ADD KEY `Fk_assessment_detail_period` (`period_id`);

--
-- Indexes for table `tx_auth_assignment`
--
ALTER TABLE `tx_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indexes for table `tx_auth_item`
--
ALTER TABLE `tx_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `tx_auth_item_child`
--
ALTER TABLE `tx_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `tx_auth_rule`
--
ALTER TABLE `tx_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `tx_counter`
--
ALTER TABLE `tx_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_counter_office` (`office_id`);

--
-- Indexes for table `tx_dashblock`
--
ALTER TABLE `tx_dashblock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_employment`
--
ALTER TABLE `tx_employment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_tx_employment_office` (`office_id`);

--
-- Indexes for table `tx_event`
--
ALTER TABLE `tx_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_group`
--
ALTER TABLE `tx_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_group_office` (`office_id`);

--
-- Indexes for table `tx_migration`
--
ALTER TABLE `tx_migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tx_office`
--
ALTER TABLE `tx_office`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_tx_office_user` (`user_id`);

--
-- Indexes for table `tx_participant`
--
ALTER TABLE `tx_participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_participant_office` (`office_id`),
  ADD KEY `Fk_participant_group` (`group_id`);

--
-- Indexes for table `tx_period`
--
ALTER TABLE `tx_period`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_period_office` (`office_id`);

--
-- Indexes for table `tx_profile`
--
ALTER TABLE `tx_profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tx_quote`
--
ALTER TABLE `tx_quote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_room`
--
ALTER TABLE `tx_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_room_office` (`office_id`);

--
-- Indexes for table `tx_schedule`
--
ALTER TABLE `tx_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_schedule_office` (`office_id`),
  ADD KEY `Fk_schedule_room` (`room_id`),
  ADD KEY `Fk_schedule_group` (`group_id`),
  ADD KEY `Fk_schedule_period` (`period_id`),
  ADD KEY `Fk_schedule_staff` (`staff_id`);

--
-- Indexes for table `tx_schedule_detail`
--
ALTER TABLE `tx_schedule_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_schedule_detail_office` (`office_id`),
  ADD KEY `Fk_schedule_detail_schedule` (`schedule_id`),
  ADD KEY `Fk_schedule_detail_subject` (`subject_id`);

--
-- Indexes for table `tx_session`
--
ALTER TABLE `tx_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_site_link`
--
ALTER TABLE `tx_site_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_social_account`
--
ALTER TABLE `tx_social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_social_account_provider_client_id` (`provider`,`client_id`),
  ADD UNIQUE KEY `idx_social_account_code` (`code`),
  ADD KEY `fk_social_account_user` (`user_id`);

--
-- Indexes for table `tx_staff`
--
ALTER TABLE `tx_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_staff_gender` (`gender_status`),
  ADD KEY `FK_tx_staff_role` (`employment_id`),
  ADD KEY `FK_tx_staff_office` (`office_id`);

--
-- Indexes for table `tx_subject`
--
ALTER TABLE `tx_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_subject_office` (`office_id`);

--
-- Indexes for table `tx_tag`
--
ALTER TABLE `tx_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_theme`
--
ALTER TABLE `tx_theme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_content_theme` (`office_id`);

--
-- Indexes for table `tx_user`
--
ALTER TABLE `tx_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_email` (`email`),
  ADD UNIQUE KEY `idx_user_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tx_archive`
--
ALTER TABLE `tx_archive`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tx_archive_category`
--
ALTER TABLE `tx_archive_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tx_assessment`
--
ALTER TABLE `tx_assessment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tx_counter`
--
ALTER TABLE `tx_counter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_dashblock`
--
ALTER TABLE `tx_dashblock`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_employment`
--
ALTER TABLE `tx_employment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_event`
--
ALTER TABLE `tx_event`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_group`
--
ALTER TABLE `tx_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tx_office`
--
ALTER TABLE `tx_office`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_participant`
--
ALTER TABLE `tx_participant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `tx_period`
--
ALTER TABLE `tx_period`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tx_profile`
--
ALTER TABLE `tx_profile`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_quote`
--
ALTER TABLE `tx_quote`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_room`
--
ALTER TABLE `tx_room`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tx_schedule`
--
ALTER TABLE `tx_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_schedule_detail`
--
ALTER TABLE `tx_schedule_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_site_link`
--
ALTER TABLE `tx_site_link`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tx_social_account`
--
ALTER TABLE `tx_social_account`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_staff`
--
ALTER TABLE `tx_staff`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_subject`
--
ALTER TABLE `tx_subject`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tx_tag`
--
ALTER TABLE `tx_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_theme`
--
ALTER TABLE `tx_theme`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tx_user`
--
ALTER TABLE `tx_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tx_archive`
--
ALTER TABLE `tx_archive`
  ADD CONSTRAINT `FK_tx_archive_category` FOREIGN KEY (`archive_category_id`) REFERENCES `tx_archive_category` (`id`),
  ADD CONSTRAINT `FK_tx_archive_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_archive_category`
--
ALTER TABLE `tx_archive_category`
  ADD CONSTRAINT `FK_tx_archive_category_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_assessment`
--
ALTER TABLE `tx_assessment`
  ADD CONSTRAINT `Fk_assessment_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  ADD CONSTRAINT `Fk_assessment_participant` FOREIGN KEY (`participant_id`) REFERENCES `tx_participant` (`id`),
  ADD CONSTRAINT `Fk_assessment_period` FOREIGN KEY (`period_id`) REFERENCES `tx_period` (`id`),
  ADD CONSTRAINT `Fk_assessment_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `tx_schedule` (`id`),
  ADD CONSTRAINT `Fk_assessment_schedule_detail` FOREIGN KEY (`schedule_detail_id`) REFERENCES `tx_schedule_detail` (`id`),
  ADD CONSTRAINT `Fk_assessment_subject` FOREIGN KEY (`subject_id`) REFERENCES `tx_subject` (`id`);

--
-- Constraints for table `tx_auth_assignment`
--
ALTER TABLE `tx_auth_assignment`
  ADD CONSTRAINT `tx_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tx_auth_item`
--
ALTER TABLE `tx_auth_item`
  ADD CONSTRAINT `tx_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `tx_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tx_auth_item_child`
--
ALTER TABLE `tx_auth_item_child`
  ADD CONSTRAINT `tx_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tx_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tx_counter`
--
ALTER TABLE `tx_counter`
  ADD CONSTRAINT `Fk_counter_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_employment`
--
ALTER TABLE `tx_employment`
  ADD CONSTRAINT `Fk_tx_employment_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_group`
--
ALTER TABLE `tx_group`
  ADD CONSTRAINT `Fk_group_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_office`
--
ALTER TABLE `tx_office`
  ADD CONSTRAINT `Fk_tx_office_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`);

--
-- Constraints for table `tx_participant`
--
ALTER TABLE `tx_participant`
  ADD CONSTRAINT `Fk_participant_group` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`),
  ADD CONSTRAINT `Fk_participant_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_period`
--
ALTER TABLE `tx_period`
  ADD CONSTRAINT `Fk_period_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_profile`
--
ALTER TABLE `tx_profile`
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tx_room`
--
ALTER TABLE `tx_room`
  ADD CONSTRAINT `Fk_room_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_schedule`
--
ALTER TABLE `tx_schedule`
  ADD CONSTRAINT `Fk_schedule_group` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`),
  ADD CONSTRAINT `Fk_schedule_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  ADD CONSTRAINT `Fk_schedule_period` FOREIGN KEY (`period_id`) REFERENCES `tx_period` (`id`),
  ADD CONSTRAINT `Fk_schedule_room` FOREIGN KEY (`room_id`) REFERENCES `tx_room` (`id`),
  ADD CONSTRAINT `Fk_schedule_staff` FOREIGN KEY (`staff_id`) REFERENCES `tx_staff` (`id`);

--
-- Constraints for table `tx_schedule_detail`
--
ALTER TABLE `tx_schedule_detail`
  ADD CONSTRAINT `Fk_schedule_detail_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
  ADD CONSTRAINT `Fk_schedule_detail_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `tx_schedule` (`id`),
  ADD CONSTRAINT `Fk_schedule_detail_subject` FOREIGN KEY (`subject_id`) REFERENCES `tx_subject` (`id`);

--
-- Constraints for table `tx_social_account`
--
ALTER TABLE `tx_social_account`
  ADD CONSTRAINT `fk_social_account_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tx_staff`
--
ALTER TABLE `tx_staff`
  ADD CONSTRAINT `FK_tx_staff_employment` FOREIGN KEY (`employment_id`) REFERENCES `tx_employment` (`id`),
  ADD CONSTRAINT `FK_tx_staff_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_subject`
--
ALTER TABLE `tx_subject`
  ADD CONSTRAINT `Fk_subject_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_theme`
--
ALTER TABLE `tx_theme`
  ADD CONSTRAINT `Fx_tx_theme_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
