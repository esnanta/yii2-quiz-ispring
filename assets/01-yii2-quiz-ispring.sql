-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2024 at 05:26 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

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
                              `id` int(11) NOT NULL,
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
                              `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tx_archive`
--

INSERT INTO `tx_archive` (`id`, `office_id`, `is_visible`, `archive_type`, `archive_category_id`, `title`, `date_issued`, `asset_name`, `asset_url`, `size`, `mime_type`, `view_counter`, `download_counter`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (3, 1, 1, 2, 5, 'Data siswa XII 1 - 24', '2024-01-17', '_65b501abb9aa0.xlsx', NULL, NULL, NULL, 0, 1, '', '2024-01-17 23:29:35', '2024-01-27 20:14:19', 1, 1, NULL, NULL, NULL, 5, '99d2cde2b55511ee9384c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_archive_category`
--

CREATE TABLE `tx_archive_category` (
                                       `id` int(11) NOT NULL,
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
                                       `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
                                 `id` int(11) NOT NULL,
                                 `office_id` int(11) DEFAULT NULL,
                                 `title` varchar(15) DEFAULT NULL,
                                 `schedule_id` int(11) DEFAULT NULL,
                                 `period_id` int(11) DEFAULT NULL,
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
                                 `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_assessment_detail`
--

CREATE TABLE `tx_assessment_detail` (
                                        `id` int(11) NOT NULL,
                                        `office_id` int(11) DEFAULT NULL,
                                        `assessment_id` int(11) DEFAULT NULL,
                                        `schedule_detail_id` int(11) DEFAULT NULL,
                                        `participant_id` int(11) DEFAULT NULL,
                                        `subject_id` int(11) DEFAULT NULL,
                                        `period_id` int(11) DEFAULT NULL,
                                        `app_version` varchar(50) DEFAULT NULL,
                                        `earned_points` decimal(18,2) DEFAULT NULL,
                                        `passing_score` decimal(18,2) DEFAULT NULL,
                                        `passing_score_percent` decimal(18,2) DEFAULT NULL,
                                        `gained_score` decimal(18,2) DEFAULT NULL,
                                        `quiz_title` varchar(50) DEFAULT NULL,
                                        `quiz_type` varchar(50) DEFAULT NULL,
                                        `username` varchar(50) DEFAULT NULL,
                                        `time_limit` varchar(50) DEFAULT NULL,
                                        `used_time` varchar(50) DEFAULT NULL,
                                        `time_spent` varchar(50) DEFAULT NULL,
                                        `created_at` datetime DEFAULT NULL,
                                        `updated_at` datetime DEFAULT NULL,
                                        `created_by` int(11) DEFAULT NULL,
                                        `updated_by` int(11) DEFAULT NULL,
                                        `is_deleted` int(11) DEFAULT NULL,
                                        `deleted_at` datetime DEFAULT NULL,
                                        `deleted_by` int(11) DEFAULT NULL,
                                        `verlock` int(11) DEFAULT NULL,
                                        `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_assignment`
--

CREATE TABLE `tx_auth_assignment` (
                                      `item_name` varchar(64) NOT NULL,
                                      `user_id` varchar(64) NOT NULL,
                                      `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_auth_assignment`
--

INSERT INTO `tx_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
    ('admin', '1', 1707467765);

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_item`
--

CREATE TABLE `tx_auth_item` (
                                `name` varchar(64) NOT NULL,
                                `type` smallint(6) NOT NULL,
                                `description` text DEFAULT NULL,
                                `rule_name` varchar(64) DEFAULT NULL,
                                `data` blob DEFAULT NULL,
                                `created_at` int(11) DEFAULT NULL,
                                `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_auth_item`
--

INSERT INTO `tx_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
                                                                                                                ('admin', 1, 'Admin', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-archive', 2, 'Create Archive', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-archivecategory', 2, 'Create Archive Category', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-assessment', 2, 'Create Assessment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-assessmentdetail', 2, 'Create Assessment Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-employment', 2, 'Create Employment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-group', 2, 'Create Group', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-ispring-master', 2, 'Create Ispring Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-ispring-transaction', 2, 'Create Ispring Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-master', 2, 'Create Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-office', 2, 'Create Office', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-participant', 2, 'Create Participant', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-period', 2, 'Create Period', NULL, NULL, 1707876579, 1707876579),
                                                                                                                ('create-profile', 2, 'Create Profile', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-room', 2, 'Create Room', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-schedule', 2, 'Create Schedule', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-scheduledetail', 2, 'Create Schedule Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-staff', 2, 'Create Staff', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-subject', 2, 'Create Subject', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-theme', 2, 'Create Theme', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('create-transaction', 2, 'Create Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-archive', 2, 'Delete Archive', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-archivecategory', 2, 'Delete Archive Category', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-assessment', 2, 'Delete Assessment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-assessmentdetail', 2, 'Delete Assessment Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-employment', 2, 'Delete Employment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-group', 2, 'Delete Group', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-ispring-master', 2, 'Delete Ispring Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-ispring-transaction', 2, 'Delete Ispring Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-master', 2, 'Delete Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-office', 2, 'Delete Office', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-participant', 2, 'Delete Participant', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-period', 2, 'Delete Period', NULL, NULL, 1707876579, 1707876579),
                                                                                                                ('delete-profile', 2, 'Delete Profile', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-room', 2, 'Delete Room', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-schedule', 2, 'Delete Schedule', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-scheduledetail', 2, 'Delete Schedule Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-staff', 2, 'Delete Staff', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-subject', 2, 'Delete Subject', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-theme', 2, 'Delete Theme', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('delete-transaction', 2, 'Delete Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('guest', 1, 'Guest', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-archive', 2, 'Index Archive', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-archivecategory', 2, 'Index Archive Category', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-assessment', 2, 'Index Assessment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-assessmentdetail', 2, 'Index Assessment Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-employment', 2, 'Index Employment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-group', 2, 'Index Group', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-ispring-master', 2, 'Index Ispring Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-ispring-transaction', 2, 'Index Ispring Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-master', 2, 'Index Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-office', 2, 'Index Office', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-participant', 2, 'Index Participant', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-period', 2, 'Index Period', NULL, NULL, 1707876579, 1707876579),
                                                                                                                ('index-profile', 2, 'Index Profile', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-room', 2, 'Index Room', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-schedule', 2, 'Index Schedule', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-scheduledetail', 2, 'Index Schedule Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-staff', 2, 'Index Staff', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-subject', 2, 'Index Subject', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-theme', 2, 'Index Theme', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('index-transaction', 2, 'Index Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('owner', 1, 'Company Owner', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('participant', 1, 'Participant', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('reguler', 1, 'Reguler', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-archive', 2, 'Report Archive', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-archivecategory', 2, 'Report Archive Category', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-assessment', 2, 'Report Assessment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-assessmentdetail', 2, 'Report Assessment Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-group', 2, 'Report Group', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-ispring-master', 2, 'Report Ispring Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-ispring-transaction', 2, 'Report Ispring Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-master', 2, 'Report Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-participant', 2, 'Report Participant', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-period', 2, 'Report Period', NULL, NULL, 1707876579, 1707876579),
                                                                                                                ('report-room', 2, 'Report Room', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-schedule', 2, 'Report Schedule', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-scheduledetail', 2, 'Report Schedule Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-subject', 2, 'Report Subject', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('report-transaction', 2, 'Report Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-archive', 2, 'Update Archive', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-archivecategory', 2, 'Update Archive Category', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-assessment', 2, 'Update Assessment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-assessmentdetail', 2, 'Update Assessment  Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-employment', 2, 'Update Employment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-group', 2, 'Update Group', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-ispring-master', 2, 'Update Ispring Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-ispring-transaction', 2, 'Update Ispring Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-master', 2, 'Update Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-office', 2, 'Update Office', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-participant', 2, 'Update Participant', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-period', 2, 'Update Period', NULL, NULL, 1707876579, 1707876579),
                                                                                                                ('update-profile', 2, 'Update Profile', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-room', 2, 'Update Room', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-schedule', 2, 'Update Schedule', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-scheduledetail', 2, 'Update Schedule Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-staff', 2, 'Update Staff', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-subject', 2, 'Update Subject', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-theme', 2, 'Update Theme', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('update-transaction', 2, 'Update Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-archive', 2, 'View Archive', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-archivecategory', 2, 'View Archive Category', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-assessment', 2, 'View Assessment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-assessmentdetail', 2, 'View Assessment Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-employment', 2, 'View Employment', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-group', 2, 'View Group', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-ispring-master', 2, 'View Ispring Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-ispring-transaction', 2, 'View Ispring Transaction', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-master', 2, 'View Master', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-office', 2, 'View Office', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-participant', 2, 'View Participant', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-period', 2, 'View Period', NULL, NULL, 1707876579, 1707876579),
                                                                                                                ('view-profile', 2, 'View Profile', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-room', 2, 'View Room', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-schedule', 2, 'View Schedule', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-scheduledetail', 2, 'View Schedule Detail', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-staff', 2, 'View Staff', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-subject', 2, 'View Subject', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-theme', 2, 'View Theme', NULL, NULL, 1707467765, 1707467765),
                                                                                                                ('view-transaction', 2, 'View Transaction', NULL, NULL, 1707467765, 1707467765);

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_item_child`
--

CREATE TABLE `tx_auth_item_child` (
                                      `parent` varchar(64) NOT NULL,
                                      `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_auth_item_child`
--

INSERT INTO `tx_auth_item_child` (`parent`, `child`) VALUES
                                                         ('admin', 'create-ispring-master'),
                                                         ('admin', 'create-ispring-transaction'),
                                                         ('admin', 'create-master'),
                                                         ('admin', 'create-transaction'),
                                                         ('admin', 'delete-ispring-master'),
                                                         ('admin', 'delete-ispring-transaction'),
                                                         ('admin', 'delete-master'),
                                                         ('admin', 'delete-transaction'),
                                                         ('admin', 'index-ispring-master'),
                                                         ('admin', 'index-ispring-transaction'),
                                                         ('admin', 'index-master'),
                                                         ('admin', 'index-transaction'),
                                                         ('admin', 'report-ispring-master'),
                                                         ('admin', 'report-ispring-transaction'),
                                                         ('admin', 'report-master'),
                                                         ('admin', 'report-transaction'),
                                                         ('admin', 'update-ispring-master'),
                                                         ('admin', 'update-ispring-transaction'),
                                                         ('admin', 'update-master'),
                                                         ('admin', 'update-transaction'),
                                                         ('admin', 'view-ispring-master'),
                                                         ('admin', 'view-ispring-transaction'),
                                                         ('admin', 'view-master'),
                                                         ('admin', 'view-transaction'),
                                                         ('create-ispring-master', 'create-group'),
                                                         ('create-ispring-master', 'create-participant'),
                                                         ('create-ispring-master', 'create-period'),
                                                         ('create-ispring-master', 'create-room'),
                                                         ('create-ispring-master', 'create-schedule'),
                                                         ('create-ispring-master', 'create-scheduledetail'),
                                                         ('create-ispring-master', 'create-subject'),
                                                         ('create-ispring-transaction', 'create-assessment'),
                                                         ('create-ispring-transaction', 'create-assessmentdetail'),
                                                         ('create-master', 'create-archivecategory'),
                                                         ('create-master', 'create-employment'),
                                                         ('create-master', 'create-office'),
                                                         ('create-master', 'create-profile'),
                                                         ('create-master', 'create-staff'),
                                                         ('create-master', 'create-theme'),
                                                         ('create-transaction', 'create-archive'),
                                                         ('delete-ispring-master', 'delete-group'),
                                                         ('delete-ispring-master', 'delete-participant'),
                                                         ('delete-ispring-master', 'delete-period'),
                                                         ('delete-ispring-master', 'delete-room'),
                                                         ('delete-ispring-master', 'delete-schedule'),
                                                         ('delete-ispring-master', 'delete-scheduledetail'),
                                                         ('delete-ispring-master', 'delete-subject'),
                                                         ('delete-ispring-transaction', 'delete-assessment'),
                                                         ('delete-ispring-transaction', 'delete-assessmentdetail'),
                                                         ('delete-master', 'delete-archivecategory'),
                                                         ('delete-master', 'delete-employment'),
                                                         ('delete-master', 'delete-office'),
                                                         ('delete-master', 'delete-profile'),
                                                         ('delete-master', 'delete-staff'),
                                                         ('delete-master', 'delete-theme'),
                                                         ('delete-transaction', 'delete-archive'),
                                                         ('guest', 'index-archive'),
                                                         ('guest', 'view-archive'),
                                                         ('index-ispring-master', 'index-group'),
                                                         ('index-ispring-master', 'index-participant'),
                                                         ('index-ispring-master', 'index-period'),
                                                         ('index-ispring-master', 'index-room'),
                                                         ('index-ispring-master', 'index-schedule'),
                                                         ('index-ispring-master', 'index-scheduledetail'),
                                                         ('index-ispring-master', 'index-subject'),
                                                         ('index-ispring-transaction', 'index-assessment'),
                                                         ('index-ispring-transaction', 'index-assessmentdetail'),
                                                         ('index-master', 'index-archivecategory'),
                                                         ('index-master', 'index-employment'),
                                                         ('index-master', 'index-office'),
                                                         ('index-master', 'index-profile'),
                                                         ('index-master', 'index-staff'),
                                                         ('index-master', 'index-theme'),
                                                         ('index-transaction', 'index-archive'),
                                                         ('owner', 'create-ispring-master'),
                                                         ('owner', 'create-ispring-transaction'),
                                                         ('owner', 'create-master'),
                                                         ('owner', 'create-transaction'),
                                                         ('owner', 'delete-ispring-master'),
                                                         ('owner', 'delete-ispring-transaction'),
                                                         ('owner', 'delete-master'),
                                                         ('owner', 'delete-transaction'),
                                                         ('owner', 'index-ispring-master'),
                                                         ('owner', 'index-ispring-transaction'),
                                                         ('owner', 'index-master'),
                                                         ('owner', 'index-transaction'),
                                                         ('owner', 'report-ispring-master'),
                                                         ('owner', 'report-ispring-transaction'),
                                                         ('owner', 'report-master'),
                                                         ('owner', 'report-transaction'),
                                                         ('owner', 'update-ispring-master'),
                                                         ('owner', 'update-ispring-transaction'),
                                                         ('owner', 'update-master'),
                                                         ('owner', 'update-transaction'),
                                                         ('owner', 'view-ispring-master'),
                                                         ('owner', 'view-ispring-transaction'),
                                                         ('owner', 'view-master'),
                                                         ('owner', 'view-transaction'),
                                                         ('reguler', 'create-ispring-transaction'),
                                                         ('reguler', 'create-transaction'),
                                                         ('reguler', 'delete-transaction'),
                                                         ('reguler', 'index-ispring-master'),
                                                         ('reguler', 'index-ispring-transaction'),
                                                         ('reguler', 'index-master'),
                                                         ('reguler', 'index-transaction'),
                                                         ('reguler', 'report-ispring-master'),
                                                         ('reguler', 'report-ispring-transaction'),
                                                         ('reguler', 'report-transaction'),
                                                         ('reguler', 'update-profile'),
                                                         ('reguler', 'update-transaction'),
                                                         ('reguler', 'view-ispring-master'),
                                                         ('reguler', 'view-ispring-transaction'),
                                                         ('reguler', 'view-master'),
                                                         ('reguler', 'view-profile'),
                                                         ('reguler', 'view-transaction'),
                                                         ('report-ispring-master', 'report-group'),
                                                         ('report-ispring-master', 'report-participant'),
                                                         ('report-ispring-master', 'report-period'),
                                                         ('report-ispring-master', 'report-room'),
                                                         ('report-ispring-master', 'report-schedule'),
                                                         ('report-ispring-master', 'report-scheduledetail'),
                                                         ('report-ispring-master', 'report-subject'),
                                                         ('report-ispring-transaction', 'report-assessment'),
                                                         ('report-ispring-transaction', 'report-assessmentdetail'),
                                                         ('report-master', 'report-archivecategory'),
                                                         ('report-transaction', 'report-archive'),
                                                         ('update-ispring-master', 'update-group'),
                                                         ('update-ispring-master', 'update-participant'),
                                                         ('update-ispring-master', 'update-period'),
                                                         ('update-ispring-master', 'update-room'),
                                                         ('update-ispring-master', 'update-schedule'),
                                                         ('update-ispring-master', 'update-scheduledetail'),
                                                         ('update-ispring-master', 'update-subject'),
                                                         ('update-ispring-transaction', 'update-assessment'),
                                                         ('update-ispring-transaction', 'update-assessmentdetail'),
                                                         ('update-master', 'update-archivecategory'),
                                                         ('update-master', 'update-employment'),
                                                         ('update-master', 'update-office'),
                                                         ('update-master', 'update-profile'),
                                                         ('update-master', 'update-staff'),
                                                         ('update-master', 'update-theme'),
                                                         ('update-transaction', 'update-archive'),
                                                         ('view-ispring-master', 'view-group'),
                                                         ('view-ispring-master', 'view-participant'),
                                                         ('view-ispring-master', 'view-period'),
                                                         ('view-ispring-master', 'view-room'),
                                                         ('view-ispring-master', 'view-schedule'),
                                                         ('view-ispring-master', 'view-scheduledetail'),
                                                         ('view-ispring-master', 'view-subject'),
                                                         ('view-ispring-transaction', 'view-assessment'),
                                                         ('view-ispring-transaction', 'view-assessmentdetail'),
                                                         ('view-master', 'view-archivecategory'),
                                                         ('view-master', 'view-employment'),
                                                         ('view-master', 'view-office'),
                                                         ('view-master', 'view-profile'),
                                                         ('view-master', 'view-staff'),
                                                         ('view-master', 'view-theme'),
                                                         ('view-transaction', 'view-archive');

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_rule`
--

CREATE TABLE `tx_auth_rule` (
                                `name` varchar(64) NOT NULL,
                                `data` blob DEFAULT NULL,
                                `created_at` int(11) DEFAULT NULL,
                                `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_counter`
--

CREATE TABLE `tx_counter` (
                              `id` int(11) NOT NULL,
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
                              `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_dashblock`
--

CREATE TABLE `tx_dashblock` (
                                `id` int(11) UNSIGNED NOT NULL,
                                `title` varchar(255) NOT NULL DEFAULT '',
                                `actions` text DEFAULT NULL,
                                `weight` int(11) UNSIGNED NOT NULL DEFAULT 0,
                                `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_employment`
--

CREATE TABLE `tx_employment` (
                                 `id` int(11) NOT NULL,
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
                                 `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
                            `id` int(11) NOT NULL,
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
                            `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_group`
--

CREATE TABLE `tx_group` (
                            `id` int(11) NOT NULL,
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
                            `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tx_group`
--

INSERT INTO `tx_group` (`id`, `office_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (1, 1, 'XII - IPA 1', NULL, '', '2024-01-19 21:18:59', '2024-01-19 21:18:59', 1, 1, NULL, NULL, NULL, 0, 'b020dab7b6d511eeb65dc858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_migration`
--

CREATE TABLE `tx_migration` (
                                `version` varchar(180) NOT NULL,
                                `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_office`
--

CREATE TABLE `tx_office` (
                             `id` int(11) NOT NULL,
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
                             `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
                                  `id` int(11) NOT NULL,
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
                                  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tx_participant`
--

INSERT INTO `tx_participant` (`id`, `office_id`, `group_id`, `title`, `identity_number`, `username`, `password`, `email`, `status`, `last_login_at`, `auth_key`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                                                                          (1, 1, 1, 'Achmad Maula Fata', '0078294733', 'U0078294733', '8a5fb', 'test@oke.com', 2, '2024-02-09 16:45:26', 'L57Do7d51zFeRkJgsVddjqVcc9fjOLKp', '2024-01-27 20:23:42', '2024-02-09 23:02:45', 1, 1, NULL, NULL, NULL, 12, '490d19a6bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (2, 1, 1, 'Adila Khalisah', '0063509763', 'U0063509763', 'e2696', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '490db883bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (3, 1, 1, 'Amira Jufri', '0053756117', 'U0053756117', 'ea297', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '490e1178bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (4, 1, 1, 'Anbar Salsabilla', '0065125737', 'U0065125737', 'dfc57', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '490e7782bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (5, 1, 1, 'Aninda Belta Shakira', '0065757046', 'U0065757046', 'c98f3', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '490ebc24bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (6, 1, 1, 'Annisa Salsabila', '0064848339', 'U0064848339', '3d88a', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '490f0090bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (7, 1, 1, 'Ardian Saputra', '0055531022', 'U0055531022', '1b3a1', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '490f4326bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (8, 1, 1, 'Cut Sahara Tantri', '0050410064', 'U0050410064', 'c8875', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '490f85bcbd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (9, 1, 1, 'Ersya Elysia', '0076787140', 'U0076787140', 'fa455', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '490fce54bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (10, 1, 1, 'Fachri Satria Tanjung', '0066822084', 'U0066822084', '1d96b', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '49104d7fbd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (11, 1, 1, 'Faiz Rusdy', '0067053895', 'U0067053895', '38d99', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '4910a82dbd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (12, 1, 1, 'Faturrahman', '0064788352', 'U0064788352', 'f704d', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '4910f1aabd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (13, 1, 1, 'Gery Juan Devista', '0056176047', 'U0056176047', 'e0c03', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '491135dfbd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (14, 1, 1, 'Ghaliza Anandistya Medina', '0066765899', 'U0066765899', '1c9e2', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '491178e4bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (15, 1, 1, 'Hadisty Ananda', '0064226685', 'U0064226685', '799cc', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '4911bad9bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (16, 1, 1, 'Haifa Azizah', '0064115981', 'U0064115981', 'e3fa0', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '4911fd67bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (17, 1, 1, 'Izzah Rizqina', '0067675678', 'U0067675678', 'f773f', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '49125177bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (18, 1, 1, 'Maqsal Mina', '0062231412', 'U0062231412', '5aa71', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '4912b72cbd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (19, 1, 1, 'Muhammad Rafiqul Abbrar', '0068042913', 'U0068042913', 'dc34c', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '49130313bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (20, 1, 1, 'Muhammad Rayyis Rasikh', '0062475153', 'U0062475153', '049af', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '4913463dbd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (21, 1, 1, 'Nabila Alya Zahra', '0061728059', 'U0061728059', '2d6be', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '491389b6bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (22, 1, 1, 'Nayla Putri Agustin', '0063723566', 'U0063723566', 'fd13a', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '4913cc61bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (23, 1, 1, 'Naylatul Uhiya', '0066038509', 'U0066038509', 'd4112', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '49140e91bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (24, 1, 1, 'Nouval Temas Mico', '0051515150', 'U0051515150', 'b00ce', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '491450b4bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (25, 1, 1, 'Raisya Nikmatul Maula', '0069297662', 'U0069297662', 'c2726', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '49149528bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (26, 1, 1, 'Reza Aulia', '0063784793', 'U0063784793', '49fcf', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '491503a2bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (27, 1, 1, 'Ridho Adha', '0068307640', 'U0068307640', 'f8b58', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '49156c4fbd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (28, 1, 1, 'Riva Afaiza', '0062599709', 'U0062599709', '75ca7', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '4915b715bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (29, 1, 1, 'Syauqi Amran', '0067129512', 'U0067129512', 'bfe1e', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '4915fbb0bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (30, 1, 1, 'Syifaus Syauqina', '0062471428', 'U0062471428', 'd3178', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '49163f79bd1711eeb275c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (31, 1, 1, 'Zaqi Aulia', '0067476158', 'U0067476158', 'e9fac', 'test@oke.com', 2, NULL, NULL, '2024-01-27 20:23:42', '2024-01-27 20:23:42', 1, 1, NULL, NULL, NULL, 0, '491681cabd1711eeb275c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_period`
--

CREATE TABLE `tx_period` (
                             `id` int(11) NOT NULL,
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
                             `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
                              `user_id` int(11) NOT NULL,
                              `name` varchar(255) DEFAULT NULL,
                              `public_email` varchar(255) DEFAULT NULL,
                              `gravatar_email` varchar(255) DEFAULT NULL,
                              `gravatar_id` varchar(32) DEFAULT NULL,
                              `location` varchar(255) DEFAULT NULL,
                              `website` varchar(255) DEFAULT NULL,
                              `timezone` varchar(40) DEFAULT NULL,
                              `bio` text DEFAULT NULL,
                              `file_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
                            `id` int(11) NOT NULL,
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
                            `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_room`
--

CREATE TABLE `tx_room` (
                           `id` int(11) NOT NULL,
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
                           `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
                               `id` int(11) NOT NULL,
                               `office_id` int(11) DEFAULT NULL,
                               `title` varchar(100) DEFAULT NULL,
                               `period_id` int(11) DEFAULT NULL,
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
                               `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_schedule_detail`
--

CREATE TABLE `tx_schedule_detail` (
                                      `id` int(11) NOT NULL,
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
                                      `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_session`
--

CREATE TABLE `tx_session` (
                              `id` char(32) NOT NULL,
                              `expire` int(11) DEFAULT NULL,
                              `data` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tx_session`
--

INSERT INTO `tx_session` (`id`, `expire`, `data`) VALUES
    ('4hr4vdsnsjpq6qq6d1kgq36m0p', 1707885995, 0x5f5f666c6173687c613a303a7b7d5f5f72657475726e55726c7c733a35333a22687474703a2f2f6c6f63616c686f73742f6170706c69636174696f6e2f796969322d7175697a2d69737072696e672f61646d696e2f223b5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b);

-- --------------------------------------------------------

--
-- Table structure for table `tx_site_link`
--

CREATE TABLE `tx_site_link` (
                                `id` int(11) NOT NULL,
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
                                `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_social_account`
--

CREATE TABLE `tx_social_account` (
                                     `id` int(11) NOT NULL,
                                     `user_id` int(11) DEFAULT NULL,
                                     `provider` varchar(255) NOT NULL,
                                     `client_id` varchar(255) NOT NULL,
                                     `code` varchar(32) DEFAULT NULL,
                                     `email` varchar(255) DEFAULT NULL,
                                     `username` varchar(255) DEFAULT NULL,
                                     `data` text DEFAULT NULL,
                                     `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_staff`
--

CREATE TABLE `tx_staff` (
                            `id` int(11) NOT NULL,
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
                            `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tx_staff`
--

INSERT INTO `tx_staff` (`id`, `user_id`, `office_id`, `employment_id`, `title`, `initial`, `identity_number`, `phone_number`, `gender_status`, `active_status`, `address`, `asset_name`, `email`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (1, 1, 1, 1, 'Nanta Es', 'Ade', '123', '123', 1, 1, '-', '654f25f00c353.jpg', 'asdf', '-', '2023-08-23 22:29:45', '2023-11-11 13:57:56', 1, 1, NULL, NULL, NULL, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tx_subject`
--

CREATE TABLE `tx_subject` (
                              `id` int(11) NOT NULL,
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
                              `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tx_subject`
--

INSERT INTO `tx_subject` (`id`, `office_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (1, 1, 'Metematika', 1, '', '2024-01-19 21:18:43', '2024-01-19 21:18:43', 1, 1, NULL, NULL, NULL, 0, 'a6d26c56b6d511eeb65dc858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_tag`
--

CREATE TABLE `tx_tag` (
                          `id` int(11) NOT NULL,
                          `tag_name` varchar(150) NOT NULL,
                          `frequency` int(11) DEFAULT NULL,
                          `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_theme`
--

CREATE TABLE `tx_theme` (
                            `id` int(11) NOT NULL,
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
                            `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tx_theme`
--

INSERT INTO `tx_theme` (`id`, `office_id`, `title`, `theme_type`, `content`, `asset_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                   (1, 1, 'Logo Frontend Header', 1, NULL, NULL, 'Logo Frontend Header', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '2bf1f422-caf1-11ee-8332-c858c0b7f92f'),
                                                                                                                                                                                                                                   (2, 1, 'Logo Frontend Footer', 2, NULL, NULL, 'Logo Frontend Footer', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '2bf20101-caf1-11ee-8332-c858c0b7f92f'),
                                                                                                                                                                                                                                   (3, 1, 'Logo Backend Header', 3, NULL, NULL, 'Logo Backend Header', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '2bf201df-caf1-11ee-8332-c858c0b7f92f'),
                                                                                                                                                                                                                                   (4, 1, 'Logo Backend Footer', 4, NULL, NULL, 'Logo Backend Footer', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '2bf2035c-caf1-11ee-8332-c858c0b7f92f'),
                                                                                                                                                                                                                                   (5, 1, 'Logo Report', 5, NULL, NULL, 'Logo Report', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '2bf20398-caf1-11ee-8332-c858c0b7f92f'),
                                                                                                                                                                                                                                   (6, 1, 'Logo Invoice', 6, NULL, NULL, 'Logo Invoice', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '2bf203e8-caf1-11ee-8332-c858c0b7f92f'),
                                                                                                                                                                                                                                   (7, 1, 'Title', 7, NULL, NULL, 'Title', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '2bf2043e-caf1-11ee-8332-c858c0b7f92f'),
                                                                                                                                                                                                                                   (8, 1, 'Content', 8, NULL, NULL, 'Content', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '2bf20494-caf1-11ee-8332-c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_user`
--

CREATE TABLE `tx_user` (
                           `id` int(11) NOT NULL,
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
                           `auth_tf_enabled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_user`
--

INSERT INTO `tx_user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `unconfirmed_email`, `registration_ip`, `flags`, `confirmed_at`, `blocked_at`, `updated_at`, `created_at`, `last_login_at`, `auth_tf_key`, `auth_tf_enabled`) VALUES
    (1, 'admin', 'ombakrinai@gmail.com', '$2y$10$oD129/e5PjrTkIV1yiR3AuOc2/XAOXLWgKPfb8svo8BdBA4PUsw3G', 'e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm', NULL, NULL, 0, NULL, NULL, 1675777211, 1675777211, 1707876624, NULL, 0);

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
    ADD KEY `Fk_assessment_office` (`office_id`),
    ADD KEY `Fk_assessment_room` (`schedule_id`),
    ADD KEY `Fk_assessment_period` (`period_id`);

--
-- Indexes for table `tx_assessment_detail`
--
ALTER TABLE `tx_assessment_detail`
    ADD PRIMARY KEY (`id`),
    ADD KEY `Fk_assessment_detail_office` (`office_id`),
    ADD KEY `Fk_assessment_detail_assessment` (`assessment_id`),
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
    ADD KEY `Fk_schedule_period` (`period_id`);

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tx_archive_category`
--
ALTER TABLE `tx_archive_category`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tx_assessment`
--
ALTER TABLE `tx_assessment`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_assessment_detail`
--
ALTER TABLE `tx_assessment_detail`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_counter`
--
ALTER TABLE `tx_counter`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_dashblock`
--
ALTER TABLE `tx_dashblock`
    MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_employment`
--
ALTER TABLE `tx_employment`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_event`
--
ALTER TABLE `tx_event`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_group`
--
ALTER TABLE `tx_group`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_office`
--
ALTER TABLE `tx_office`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_participant`
--
ALTER TABLE `tx_participant`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tx_period`
--
ALTER TABLE `tx_period`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tx_profile`
--
ALTER TABLE `tx_profile`
    MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_quote`
--
ALTER TABLE `tx_quote`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_room`
--
ALTER TABLE `tx_room`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tx_schedule`
--
ALTER TABLE `tx_schedule`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_schedule_detail`
--
ALTER TABLE `tx_schedule_detail`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_site_link`
--
ALTER TABLE `tx_site_link`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tx_social_account`
--
ALTER TABLE `tx_social_account`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_staff`
--
ALTER TABLE `tx_staff`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_subject`
--
ALTER TABLE `tx_subject`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_tag`
--
ALTER TABLE `tx_tag`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_theme`
--
ALTER TABLE `tx_theme`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tx_user`
--
ALTER TABLE `tx_user`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
    ADD CONSTRAINT `Fk_assessment_period` FOREIGN KEY (`period_id`) REFERENCES `tx_period` (`id`),
    ADD CONSTRAINT `Fk_assessment_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `tx_schedule` (`id`);

--
-- Constraints for table `tx_assessment_detail`
--
ALTER TABLE `tx_assessment_detail`
    ADD CONSTRAINT `Fk_assessment_detail_assessment` FOREIGN KEY (`assessment_id`) REFERENCES `tx_assessment` (`id`),
    ADD CONSTRAINT `Fk_assessment_detail_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
    ADD CONSTRAINT `Fk_assessment_detail_participant` FOREIGN KEY (`participant_id`) REFERENCES `tx_participant` (`id`),
    ADD CONSTRAINT `Fk_assessment_detail_period` FOREIGN KEY (`period_id`) REFERENCES `tx_period` (`id`),
    ADD CONSTRAINT `Fk_assessment_detail_schedule_detail` FOREIGN KEY (`schedule_detail_id`) REFERENCES `tx_schedule_detail` (`id`),
    ADD CONSTRAINT `Fk_assessment_detail_subject` FOREIGN KEY (`subject_id`) REFERENCES `tx_subject` (`id`);

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
    ADD CONSTRAINT `Fk_schedule_room` FOREIGN KEY (`room_id`) REFERENCES `tx_room` (`id`);

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
