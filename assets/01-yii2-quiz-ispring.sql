-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2024 at 05:25 AM
-- Server version: 10.4.21-MariaDB
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
-- Table structure for table `tx_assessment`
--

CREATE TABLE `tx_assessment` (
                                 `id` int(11) NOT NULL,
                                 `office_id` int(11) DEFAULT NULL,
                                 `schedule_id` int(11) DEFAULT NULL,
                                 `schedule_detail_id` int(11) DEFAULT NULL,
                                 `participant_id` int(11) DEFAULT NULL,
                                 `period_id` int(11) DEFAULT NULL,
                                 `group_id` int(11) DEFAULT NULL,
                                 `subject_id` int(11) DEFAULT NULL,
                                 `question_type` int(11) DEFAULT NULL,
                                 `exam_type` int(11) DEFAULT NULL,
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
                                 `submission_status` int(11) DEFAULT NULL,
                                 `token` varchar(6) DEFAULT NULL,
                                 `created_at` datetime DEFAULT NULL,
                                 `updated_at` datetime DEFAULT NULL,
                                 `created_by` int(11) DEFAULT NULL,
                                 `updated_by` int(11) DEFAULT NULL,
                                 `is_deleted` int(11) DEFAULT NULL,
                                 `deleted_at` datetime DEFAULT NULL,
                                 `deleted_by` int(11) DEFAULT NULL,
                                 `verlock` int(11) DEFAULT NULL,
                                 `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tx_assessment`
--

INSERT INTO `tx_assessment` (`id`, `office_id`, `schedule_id`, `schedule_detail_id`, `participant_id`, `period_id`, `group_id`, `subject_id`, `question_type`, `exam_type`, `app_version`, `earned_points`, `passing_score`, `passing_score_percent`, `gained_score`, `evaluate_score`, `quiz_title`, `quiz_type`, `username`, `time_limit`, `used_time`, `time_spent`, `submission_status`, `token`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (431, 1, 44, 81, 146, 2, 32, 35, 1, 1, '9.0', '0.00', '25.00', '100.00', '25.00', '0.00', 'KIMIA  XII (P)', 'graded', 'Uwolff.yolanda@von.com', '7200', '9', '9 sec', 2, NULL, '2024-09-14 14:04:10', '2024-09-14 14:04:37', 146, 146, NULL, '2024-09-14 20:22:42', 1, 1, '897e0d34726711ef82ebc858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_asset`
--

CREATE TABLE `tx_asset` (
                            `id` int(11) NOT NULL,
                            `office_id` int(11) DEFAULT NULL,
                            `is_visible` int(11) DEFAULT NULL,
                            `asset_type` int(11) DEFAULT NULL,
                            `asset_category_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_asset`
--

INSERT INTO `tx_asset` (`id`, `office_id`, `is_visible`, `asset_type`, `asset_category_id`, `title`, `date_issued`, `asset_name`, `asset_url`, `size`, `mime_type`, `view_counter`, `download_counter`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (6, 1, 1, 2, 5, 'Data siswa', '2024-09-04', '_66d744b275f98.xlsx', '/uploads/asset/65a7fb0e28f7b/template_participant.xlsx', NULL, NULL, 0, 1, NULL, '2024-09-04 00:17:38', '2024-09-07 10:45:14', 1, 1, NULL, NULL, NULL, 1, '6b63b2776a1811ef9b76c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_asset_category`
--

CREATE TABLE `tx_asset_category` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tx_asset_category`
--

INSERT INTO `tx_asset_category` (`id`, `office_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                 (5, 1, 'Test', 1, '', '2024-01-17 23:20:28', '2024-01-17 23:20:28', 1, 1, NULL, NULL, NULL, 0, '53bcf82eb55411ee9384c858c0b7f92f'),
                                                                                                                                                                                                                 (6, 1, 'test', 2, '', '2024-07-05 21:40:09', '2024-07-05 21:40:09', 1, 1, NULL, NULL, NULL, 0, '7ac97fc83adc11efbaefc858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_assignment`
--

CREATE TABLE `tx_auth_assignment` (
                                      `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                                      `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                                      `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_auth_assignment`
--

INSERT INTO `tx_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
    ('admin', '1', 1725461637);

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_item`
--

CREATE TABLE `tx_auth_item` (
                                `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                                `type` smallint(6) NOT NULL,
                                `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
                                `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
                                `data` blob DEFAULT NULL,
                                `created_at` int(11) DEFAULT NULL,
                                `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_auth_item`
--

INSERT INTO `tx_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
                                                                                                                ('admin', 1, 'Admin', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-assessment', 2, 'Create Assessment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-asset', 2, 'Create Asset', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-assetcategory', 2, 'Create Asset Category', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-employment', 2, 'Create Employment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-group', 2, 'Create Group', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-ispring-master', 2, 'Create Ispring Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-ispring-transaction', 2, 'Create Ispring Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-master', 2, 'Create Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-office', 2, 'Create Office', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-officemedia', 2, 'Create Office Media', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-page', 2, 'Create Page', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-participant', 2, 'Create Participant', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-period', 2, 'Create Period', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-profile', 2, 'Create Profile', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-room', 2, 'Create Room', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-schedule', 2, 'Create Schedule', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-scheduledetail', 2, 'Create Schedule Detail', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-staff', 2, 'Create Staff', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-subject', 2, 'Create Subject', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-transaction', 2, 'Create Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-user-owner', 2, 'Create User Owner', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('create-user-regular', 2, 'Create User Regular', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-assessment', 2, 'Delete Assessment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-asset', 2, 'Delete Asset', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-assetcategory', 2, 'Delete Asset Category', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-employment', 2, 'Delete Employment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-group', 2, 'Delete Group', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-ispring-master', 2, 'Delete Ispring Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-ispring-transaction', 2, 'Delete Ispring Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-master', 2, 'Delete Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-office', 2, 'Delete Office', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-officemedia', 2, 'Delete Office Media', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-page', 2, 'Delete Page', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-participant', 2, 'Delete Participant', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-period', 2, 'Delete Period', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-profile', 2, 'Delete Profile', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-room', 2, 'Delete Room', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-schedule', 2, 'Delete Schedule', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-scheduledetail', 2, 'Delete Schedule Detail', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-staff', 2, 'Delete Staff', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-subject', 2, 'Delete Subject', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('delete-transaction', 2, 'Delete Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('guest', 1, 'Guest', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-assessment', 2, 'Index Assessment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-asset', 2, 'Index Asset', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-assetcategory', 2, 'Index Asset Category', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-employment', 2, 'Index Employment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-group', 2, 'Index Group', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-ispring-master', 2, 'Index Ispring Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-ispring-transaction', 2, 'Index Ispring Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-master', 2, 'Index Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-office', 2, 'Index Office', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-officemedia', 2, 'Index Office Media', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-page', 2, 'Index Page', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-participant', 2, 'Index Participant', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-period', 2, 'Index Period', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-profile', 2, 'Index Profile', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-room', 2, 'Index Room', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-schedule', 2, 'Index Schedule', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-scheduledetail', 2, 'Index Schedule Detail', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-staff', 2, 'Index Staff', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-subject', 2, 'Index Subject', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('index-transaction', 2, 'Index Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('owner', 1, 'Company Owner', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('participant', 1, 'Participant', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('regular', 1, 'Regular', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-assessment', 2, 'Report Assessment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-asset', 2, 'Report Asset', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-assetcategory', 2, 'Report Asset Category', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-group', 2, 'Report Group', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-ispring-master', 2, 'Report Ispring Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-ispring-transaction', 2, 'Report Ispring Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-master', 2, 'Report Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-participant', 2, 'Report Participant', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-period', 2, 'Report Period', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-room', 2, 'Report Room', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-schedule', 2, 'Report Schedule', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-scheduledetail', 2, 'Report Schedule Detail', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-subject', 2, 'Report Subject', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('report-transaction', 2, 'Report Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-assessment', 2, 'Update Assessment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-asset', 2, 'Update Asset', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-assetcategory', 2, 'Update Asset Category', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-employment', 2, 'Update Employment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-group', 2, 'Update Group', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-ispring-master', 2, 'Update Ispring Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-ispring-transaction', 2, 'Update Ispring Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-master', 2, 'Update Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-office', 2, 'Update Office', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-officemedia', 2, 'Update Office Media', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-page', 2, 'Update Page', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-participant', 2, 'Update Participant', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-period', 2, 'Update Period', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-profile', 2, 'Update Profile', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-room', 2, 'Update Room', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-schedule', 2, 'Update Schedule', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-scheduledetail', 2, 'Update Schedule Detail', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-staff', 2, 'Update Staff', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-subject', 2, 'Update Subject', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('update-transaction', 2, 'Update Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-assessment', 2, 'View Assessment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-asset', 2, 'View Asset', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-assetcategory', 2, 'View Asset Category', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-employment', 2, 'View Employment', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-group', 2, 'View Group', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-ispring-master', 2, 'View Ispring Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-ispring-transaction', 2, 'View Ispring Transaction', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-master', 2, 'View Master', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-office', 2, 'View Office', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-officemedia', 2, 'View Office Media', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-page', 2, 'View Page', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-participant', 2, 'View Participant', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-period', 2, 'View Period', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-profile', 2, 'View Profile', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-room', 2, 'View Room', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-schedule', 2, 'View Schedule', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-scheduledetail', 2, 'View Schedule Detail', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-staff', 2, 'View Staff', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-subject', 2, 'View Subject', NULL, NULL, 1725461637, 1725461637),
                                                                                                                ('view-transaction', 2, 'View Transaction', NULL, NULL, 1725461637, 1725461637);

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_item_child`
--

CREATE TABLE `tx_auth_item_child` (
                                      `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                                      `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
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
                                                         ('create-master', 'create-assetcategory'),
                                                         ('create-master', 'create-employment'),
                                                         ('create-master', 'create-office'),
                                                         ('create-master', 'create-officemedia'),
                                                         ('create-master', 'create-page'),
                                                         ('create-master', 'create-profile'),
                                                         ('create-master', 'create-staff'),
                                                         ('create-transaction', 'create-asset'),
                                                         ('delete-ispring-master', 'delete-group'),
                                                         ('delete-ispring-master', 'delete-participant'),
                                                         ('delete-ispring-master', 'delete-period'),
                                                         ('delete-ispring-master', 'delete-room'),
                                                         ('delete-ispring-master', 'delete-schedule'),
                                                         ('delete-ispring-master', 'delete-scheduledetail'),
                                                         ('delete-ispring-master', 'delete-subject'),
                                                         ('delete-ispring-transaction', 'delete-assessment'),
                                                         ('delete-master', 'delete-assetcategory'),
                                                         ('delete-master', 'delete-employment'),
                                                         ('delete-master', 'delete-office'),
                                                         ('delete-master', 'delete-officemedia'),
                                                         ('delete-master', 'delete-page'),
                                                         ('delete-master', 'delete-profile'),
                                                         ('delete-master', 'delete-staff'),
                                                         ('delete-transaction', 'delete-asset'),
                                                         ('guest', 'index-asset'),
                                                         ('guest', 'view-asset'),
                                                         ('index-ispring-master', 'index-group'),
                                                         ('index-ispring-master', 'index-participant'),
                                                         ('index-ispring-master', 'index-period'),
                                                         ('index-ispring-master', 'index-room'),
                                                         ('index-ispring-master', 'index-schedule'),
                                                         ('index-ispring-master', 'index-scheduledetail'),
                                                         ('index-ispring-master', 'index-subject'),
                                                         ('index-ispring-transaction', 'index-assessment'),
                                                         ('index-master', 'index-assetcategory'),
                                                         ('index-master', 'index-employment'),
                                                         ('index-master', 'index-office'),
                                                         ('index-master', 'index-officemedia'),
                                                         ('index-master', 'index-page'),
                                                         ('index-master', 'index-profile'),
                                                         ('index-master', 'index-staff'),
                                                         ('index-transaction', 'create-user-regular'),
                                                         ('index-transaction', 'index-asset'),
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
                                                         ('regular', 'create-ispring-transaction'),
                                                         ('regular', 'create-transaction'),
                                                         ('regular', 'delete-transaction'),
                                                         ('regular', 'index-ispring-master'),
                                                         ('regular', 'index-ispring-transaction'),
                                                         ('regular', 'index-master'),
                                                         ('regular', 'index-transaction'),
                                                         ('regular', 'report-ispring-master'),
                                                         ('regular', 'report-ispring-transaction'),
                                                         ('regular', 'report-transaction'),
                                                         ('regular', 'update-profile'),
                                                         ('regular', 'update-transaction'),
                                                         ('regular', 'view-ispring-master'),
                                                         ('regular', 'view-ispring-transaction'),
                                                         ('regular', 'view-master'),
                                                         ('regular', 'view-profile'),
                                                         ('regular', 'view-transaction'),
                                                         ('report-ispring-master', 'report-group'),
                                                         ('report-ispring-master', 'report-participant'),
                                                         ('report-ispring-master', 'report-period'),
                                                         ('report-ispring-master', 'report-room'),
                                                         ('report-ispring-master', 'report-schedule'),
                                                         ('report-ispring-master', 'report-scheduledetail'),
                                                         ('report-ispring-master', 'report-subject'),
                                                         ('report-ispring-transaction', 'report-assessment'),
                                                         ('report-master', 'report-assetcategory'),
                                                         ('report-transaction', 'report-asset'),
                                                         ('update-ispring-master', 'update-group'),
                                                         ('update-ispring-master', 'update-participant'),
                                                         ('update-ispring-master', 'update-period'),
                                                         ('update-ispring-master', 'update-room'),
                                                         ('update-ispring-master', 'update-schedule'),
                                                         ('update-ispring-master', 'update-scheduledetail'),
                                                         ('update-ispring-master', 'update-subject'),
                                                         ('update-ispring-transaction', 'update-assessment'),
                                                         ('update-master', 'update-assetcategory'),
                                                         ('update-master', 'update-employment'),
                                                         ('update-master', 'update-office'),
                                                         ('update-master', 'update-officemedia'),
                                                         ('update-master', 'update-page'),
                                                         ('update-master', 'update-profile'),
                                                         ('update-master', 'update-staff'),
                                                         ('update-transaction', 'update-asset'),
                                                         ('view-ispring-master', 'view-group'),
                                                         ('view-ispring-master', 'view-participant'),
                                                         ('view-ispring-master', 'view-period'),
                                                         ('view-ispring-master', 'view-room'),
                                                         ('view-ispring-master', 'view-schedule'),
                                                         ('view-ispring-master', 'view-scheduledetail'),
                                                         ('view-ispring-master', 'view-subject'),
                                                         ('view-ispring-transaction', 'view-assessment'),
                                                         ('view-master', 'view-assetcategory'),
                                                         ('view-master', 'view-employment'),
                                                         ('view-master', 'view-office'),
                                                         ('view-master', 'view-officemedia'),
                                                         ('view-master', 'view-page'),
                                                         ('view-master', 'view-profile'),
                                                         ('view-master', 'view-staff'),
                                                         ('view-transaction', 'view-asset');

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_rule`
--

CREATE TABLE `tx_auth_rule` (
                                `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_counter`
--

INSERT INTO `tx_counter` (`id`, `office_id`, `title`, `counter`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (4, 1, 'SCD', 41, '2024-09-08 21:07:50', '2024-09-12 13:53:05', 1, 1, NULL, NULL, NULL, 40, 'b9f896246deb11efa9f1c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_dashblock`
--

CREATE TABLE `tx_dashblock` (
                                `id` int(10) UNSIGNED NOT NULL,
                                `title` varchar(255) NOT NULL DEFAULT '',
                                `actions` text DEFAULT NULL,
                                `weight` int(10) UNSIGNED NOT NULL DEFAULT 0,
                                `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_employment`
--

INSERT INTO `tx_employment` (`id`, `office_id`, `title`, `description`, `sequence`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (1, 1, 'Programmer', '-', 1, '2023-08-22 22:30:26', '2024-07-07 10:37:04', 1, 1, NULL, NULL, NULL, 2, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tx_group`
--

INSERT INTO `tx_group` (`id`, `office_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                        (32, 1, 'X1', 1, 'Kelas X1', '2024-09-11 13:35:38', '2024-09-11 13:35:38', 1, 1, NULL, NULL, NULL, 0, '0ee9a97a700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                        (33, 1, 'X3', 2, 'Kelas X3', '2024-09-11 13:35:38', '2024-09-11 13:35:38', 1, 1, NULL, NULL, NULL, 0, '0eea2d5b700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                        (34, 1, 'XI 2', 3, 'Kelas XI 2', '2024-09-11 13:35:38', '2024-09-11 13:35:38', 1, 1, NULL, NULL, NULL, 0, '0eeaa741700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                        (35, 1, 'XI 3', 4, 'Kelas XI 3', '2024-09-11 13:35:38', '2024-09-11 13:35:38', 1, 1, NULL, NULL, NULL, 0, '0eeb1bba700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                        (36, 1, 'XII-1', 5, 'Kelas XII-1', '2024-09-11 13:35:38', '2024-09-11 13:35:38', 1, 1, NULL, NULL, NULL, 0, '0eeb7cf7700811ef8bc7c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_migration`
--

CREATE TABLE `tx_migration` (
                                `version` varchar(180) NOT NULL,
                                `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_office`
--

INSERT INTO `tx_office` (`id`, `user_id`, `unique_id`, `title`, `phone_number`, `fax_number`, `email`, `web`, `address`, `latitude`, `longitude`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (1, 1, '65a7fb0e28f7b', 'Daraspace', '-', NULL, 'ombakrinai@gmail.com', 'https://daraspace.com', '-', NULL, NULL, '-', '2023-08-18 22:25:10', '2024-07-07 10:34:30', 1, 1, NULL, NULL, NULL, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tx_office_media`
--

CREATE TABLE `tx_office_media` (
                                   `id` int(11) NOT NULL,
                                   `office_id` int(11) DEFAULT NULL,
                                   `media_type` int(11) DEFAULT NULL,
                                   `title` varchar(100) DEFAULT NULL,
                                   `description` longtext DEFAULT NULL,
                                   `created_at` datetime DEFAULT NULL,
                                   `updated_at` datetime DEFAULT NULL,
                                   `created_by` int(11) DEFAULT NULL,
                                   `updated_by` int(11) DEFAULT NULL,
                                   `is_deleted` int(11) DEFAULT NULL,
                                   `deleted_at` datetime DEFAULT NULL,
                                   `deleted_by` int(11) DEFAULT NULL,
                                   `verlock` bigint(20) DEFAULT NULL,
                                   `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_office_media`
--

INSERT INTO `tx_office_media` (`id`, `office_id`, `media_type`, `title`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (1, 1, 11, 'fa-brands fa-twitter', '', '2024-07-25 00:04:27', '2024-07-25 00:04:27', 1, 1, NULL, NULL, NULL, 0, 'c92e8b7749de11ef9de9c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_page`
--

CREATE TABLE `tx_page` (
                           `id` int(11) NOT NULL,
                           `page_type` int(11) DEFAULT NULL,
                           `title` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_page`
--

INSERT INTO `tx_page` (`id`, `page_type`, `title`, `content`, `asset_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                    (1, 2, 'Logo 1', '<p><img style=\"width: 103px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGcAAAAnCAYAAAASGVaVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3YTJkN2YzYS0xNGQxLTQyODQtYmYwZC00MGUxZTJkMjNjOGYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODcxNjQ4RjBEMDI5MTFFNjhFOUZCNTlCN0ZERTdEREIiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODcxNjQ4RUZEMDI5MTFFNjhFOUZCNTlCN0ZERTdEREIiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3YTJkN2YzYS0xNGQxLTQyODQtYmYwZC00MGUxZTJkMjNjOGYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6N2EyZDdmM2EtMTRkMS00Mjg0LWJmMGQtNDBlMWUyZDIzYzhm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\" data-filename=\"logo-1.png\"><br></p>', NULL, 'Logo 1 - Bagian Atas Kiri', '2018-01-08 21:47:15', '2024-08-18 15:55:56', 1, 1, NULL, NULL, NULL, 0, ''),
                                                                                                                                                                                                                    (2, 2, 'Logo 2', '<p><img style=\"width: 200px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAAAnCAYAAABKSgfJAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDE0IDc5LjE1Njc5NywgMjAxNC8wOC8yMC0wOTo1MzowMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MERFMUI5RERGNTlGMTFFNDk4QTZDQjA2OEIzQTJBRUUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MERFMUI5REVGNTlGMTFFNDk4QTZDQjA2OEIzQTJBRUUiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowREUxQjlEQkY1OUYxMUU0OThBNkNCMDY4QjNBMkFFRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowREUxQjlEQ0Y1OUYxMUU0OThBNkNCMDY4QjNBMkFFRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoaoddcAAA6SSURBVHja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\" data-filename=\"logo-14.png\"><br></p>', NULL, 'Logo 2 - Bagian Bawah Kiri', '2018-01-08 21:47:15', '2024-08-18 15:55:41', 1, 1, NULL, NULL, NULL, 0, ''),
                                                                                                                                                                                                                    (3, 2, 'Logo Report 1', 'b3MYTwJeYCkb4IUmLrPkjcePntzALUBi.png', NULL, 'Logo 1 - Bagian Atas Kiri', '2018-01-08 21:47:15', '2018-01-08 21:47:15', 1, 1, NULL, NULL, NULL, 0, ''),
                                                                                                                                                                                                                    (4, 2, 'Logo Report 2', 'q8Z7e_TqQrBwU8URdcZ4I7t62u3-EHCm.png', NULL, 'NA', '2018-01-08 21:47:15', '2018-01-08 21:47:15', 1, 1, NULL, NULL, NULL, 0, ''),
                                                                                                                                                                                                                    (11, 1, 'SEO Description', NULL, NULL, 'SEO Description', '2018-01-08 21:47:15', '2018-01-08 21:47:15', 1, 1, NULL, NULL, NULL, 0, ''),
                                                                                                                                                                                                                    (12, 1, 'SEO Keyword', NULL, NULL, 'SEO Keyword', '2018-01-08 21:47:15', '2018-01-08 21:47:15', 1, 1, NULL, NULL, NULL, 0, ''),
                                                                                                                                                                                                                    (21, 1, 'About', 'VD6pJHgk7ikBhHW6gmW59mfrWLQhjpFx.png', NULL, 'Donec id elit y DESCRIPTION.', '2017-12-02 22:33:55', '2017-12-02 22:39:25', 1, 1, NULL, NULL, NULL, 0, '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tx_participant`
--

INSERT INTO `tx_participant` (`id`, `office_id`, `group_id`, `title`, `identity_number`, `username`, `password`, `email`, `status`, `last_login_at`, `auth_key`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                                                                          (146, 1, 32, 'Jessika Douglas', 'wolff.yolanda@von.com', 'Uwolff.yolanda@von.com', '0ab45', 'pierre51@boyle.com', 2, '2024-09-14 13:16:25', 'BKwseKK5OOz7cNrZvaeCWhZ70HCLKRk7', '2024-09-11 13:35:40', '2024-09-14 13:16:25', 1, NULL, NULL, NULL, NULL, 7, '1043ae5e700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (147, 1, 32, 'Ottilie Becker', 'dylan22@nitzsche.com', 'Udylan22@nitzsche.com', 'ec805', 'mwiza@yahoo.com', 1, '2024-09-11 13:39:47', 'q3fyreLCzHwqRVw_ZOFsvkudBy3Os_p_', '2024-09-11 13:35:40', '2024-09-11 14:16:03', 1, 1, NULL, NULL, NULL, 2, '1044b142700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (148, 1, 32, 'Wilhelmine Mills', 'arvid.pollich@gmail.com', 'Uarvid.pollich@gmail.com', '083e9', 'rylee.leannon@gmail.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '10456a75700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (149, 1, 32, 'Anna Ledner', 'julie.nikolaus@gmail.com', 'Ujulie.nikolaus@gmail.com', 'c0a6f', 'jenkins.cory@yahoo.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '1045b66c700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (150, 1, 34, 'Carter Konopelski', 'robert46@yahoo.com', 'Urobert46@yahoo.com', 'b6154', 'domenick.douglas@gmail.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104837c3700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (151, 1, 34, 'Kassandra Stehr', 'maddison46@hotmail.com', 'Umaddison46@hotmail.com', '62520', 'adolphus.wiegand@hotmail.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '10490073700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (152, 1, 34, 'Briana Lehner', 'dicki.mariana@gorczany.info', 'Udicki.mariana@gorczany.info', '316d3', 'cartwright.orion@gmail.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104974f5700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (153, 1, 34, 'Jeramy Boyer', 'gracie.langosh@hotmail.com', 'Ugracie.langosh@hotmail.com', '24833', 'leila.beer@veum.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '1049fbb5700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (154, 1, 34, 'Murphy Hudson', 'della18@robel.com', 'Udella18@robel.com', '250d4', 'etorphy@gmail.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104a5a0a700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (155, 1, 35, 'Ahmed O\'Keefe', 'gkerluke@ryan.info', 'Ugkerluke@ryan.info', '83a5c', 'leannon.savannah@hand.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104b4f8c700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (156, 1, 35, 'Earnest Dickens', 'jacobs.carter@streich.biz', 'Ujacobs.carter@streich.biz', 'f38ab', 'fay.dashawn@gmail.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104bbe5c700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (157, 1, 35, 'Camille Morissette', 'qmosciski@gmail.com', 'Uqmosciski@gmail.com', 'd34f0', 'fwolf@hayes.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104c3b94700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (158, 1, 35, 'Hailie Purdy', 'lura.donnelly@rosenbaum.biz', 'Ulura.donnelly@rosenbaum.biz', 'b1e4a', 'leta33@kihn.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104c83c7700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (159, 1, 35, 'Cory Leannon', 'sonia.hackett@yahoo.com', 'Usonia.hackett@yahoo.com', '0cc1e', 'lois.leffler@nolan.biz', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104cf3a7700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (160, 1, 36, 'Bradford Thiel', 'vern88@yahoo.com', 'Uvern88@yahoo.com', '18fda', 'jamel90@kshlerin.net', 2, '2024-09-12 13:43:57', 'xnRb3DKzQgMzYXcWhAQSH1S36-PwvPaP', '2024-09-11 13:35:40', '2024-09-12 13:43:57', 1, NULL, NULL, NULL, NULL, 1, '104da705700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (161, 1, 36, 'Leanna Mertz', 'gail33@herzog.com', 'Ugail33@herzog.com', '007a2', 'wolf.carson@collins.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104df102700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (162, 1, 36, 'Aiden Schultz', 'abeahan@yahoo.com', 'Uabeahan@yahoo.com', '7854c', 'georgiana08@gmail.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104f07ad700811ef8bc7c858c0b7f92f');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
                              `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                              `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                              `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                              `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
                              `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                              `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                              `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
                              `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
                              `file_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
                               `staff_id` int(11) DEFAULT NULL,
                               `exam_type` int(11) DEFAULT NULL,
                               `date_start` datetime DEFAULT NULL,
                               `date_end` datetime DEFAULT NULL,
                               `token` varchar(6) DEFAULT NULL,
                               `token_time` datetime DEFAULT NULL,
                               `is_asset` int(11) DEFAULT NULL COMMENT 'Available or not',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tx_schedule`
--

INSERT INTO `tx_schedule` (`id`, `office_id`, `title`, `period_id`, `group_id`, `room_id`, `staff_id`, `exam_type`, `date_start`, `date_end`, `token`, `token_time`, `is_asset`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
    (44, 1, '00041', 2, 32, 2, 1, 1, '2024-09-15 20:31:00', '2024-09-15 21:51:00', '253188', '2024-09-14 14:53:39', 1, 'Test', '2024-09-12 13:53:05', '2024-09-14 20:22:42', 1, 1, NULL, NULL, NULL, 24, 'a9bc4df370d311ef95b8c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_schedule_detail`
--

CREATE TABLE `tx_schedule_detail` (
                                      `id` int(11) NOT NULL,
                                      `office_id` int(11) DEFAULT NULL,
                                      `schedule_id` int(11) DEFAULT NULL,
                                      `subject_id` int(11) DEFAULT NULL,
                                      `question_type` int(11) DEFAULT NULL,
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
                                      `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tx_schedule_detail`
--

INSERT INTO `tx_schedule_detail` (`id`, `office_id`, `schedule_id`, `subject_id`, `question_type`, `remark`, `asset_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                                    (81, 1, 44, 35, 1, 'Kimia', '81_KIMIA-XII_.zip', '2024-09-12 13:53:05', '2024-09-14 20:22:42', 1, 1, NULL, NULL, NULL, 18, 'a9be59f870d311ef95b8c858c0b7f92f'),
                                                                                                                                                                                                                                                    (82, 1, 44, 35, 2, 'Kimia', '82_KIMIA-XII_.zip', '2024-09-12 13:53:05', '2024-09-14 20:22:42', 1, 1, NULL, NULL, NULL, 16, 'a9bec91370d311ef95b8c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_session`
--

CREATE TABLE `tx_session` (
                              `id` char(32) NOT NULL,
                              `expire` int(11) DEFAULT NULL,
                              `data` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_session`
--

INSERT INTO `tx_session` (`id`, `expire`, `data`) VALUES
                                                      ('0t1pt1somtbs8fvup9vu2h2c81', 1726127604, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('116pf18qnb38o7a3kegi0hv0sn', 1726458476, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('18r9golq270qp4t5lbodqut8it', 1726067825, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('2sius8n2n3e8pgj98jr09r00jm', 1726037762, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('44f70ef855rb39pbru7c4fmpsn', 1726127409, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('56te0oapkkh3opitkcsdempdvp', 1726070552, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b737563636573737c613a313a7b733a373a226d657373616765223b733a31353a2255706461746520737563636573732e223b7d),
                                                      ('6scmte4tg7r82cmjph9k3qlnsj', 1726032070, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('7hsj59g0o0dgrpfr92g3crjcll', 1726302527, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('9213uie0sje22v6jald4q5n6i5', 1726289833, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('9o2habuqllfa1p767in5arorbm', 1726128905, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b737563636573737c613a313a7b733a373a226d657373616765223b733a31353a2255706461746520737563636573732e223b7d),
                                                      ('bvdsm1fls1gfur155m7idj6rut', 1726325446, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('e5ntc69b0sjuf4fb1sebq4jsm3', 1726032083, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a3134333b5f5f617574684b65797c733a33323a227275427637614c697a46346362444f50755247324369466d327158694149616a223b),
                                                      ('ef5ntsi0014m7nfdl9qnodec6q', 1726044926, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('fvidmgek7cmefaru42anbvquna', 1726045004, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('hl36k4kpigujssom69or62cir4', 1726321029, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('iir9no6lntk3j3cac616qa959h', 1726458357, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('j67gs9q6tijoo3va44meobobia', 1726070707, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a3134363b5f5f617574684b65797c733a33323a2257345a2d686c6748715746783232377956786b7341657455585f674273316b33223b),
                                                      ('lk962p7tgvrg5t03q11rvhdnnj', 1726301694, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a3134363b5f5f617574684b65797c733a33323a22424b7773654b4b354f4f7a37634e725a7661654357685a373048434c4b526b37223b),
                                                      ('qsvdngu9qkkjonu71g4bgojus9', 1726237924, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('s8ccat7qbv8kdmbpk9iuk94itf', 1726237945, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b);

-- --------------------------------------------------------

--
-- Table structure for table `tx_social_account`
--

CREATE TABLE `tx_social_account` (
                                     `id` int(11) NOT NULL,
                                     `user_id` int(11) DEFAULT NULL,
                                     `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                     `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                     `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
                                     `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                                     `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                                     `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tx_subject`
--

INSERT INTO `tx_subject` (`id`, `office_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                          (34, 1, 'Matematika', 1, 'Matematika', '2024-09-11 13:35:34', '2024-09-11 13:35:34', 1, 1, NULL, NULL, NULL, 0, '0c98ca3d700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                          (35, 1, 'Kimia', 2, 'Kimia', '2024-09-11 13:35:34', '2024-09-11 13:35:34', 1, 1, NULL, NULL, NULL, 0, '0c9974c1700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                          (36, 1, 'Fisika', 3, 'Fisika', '2024-09-11 13:35:34', '2024-09-11 13:35:34', 1, 1, NULL, NULL, NULL, 0, '0c99dfb9700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                          (37, 1, 'Bahasa Indonesia', 4, 'Bahasa Indonesia', '2024-09-11 13:35:34', '2024-09-11 13:35:34', 1, 1, NULL, NULL, NULL, 0, '0c9a975c700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                          (38, 1, 'Sejarah', 5, 'Sejarah', '2024-09-11 13:35:34', '2024-09-11 13:35:34', 1, 1, NULL, NULL, NULL, 0, '0c9b2529700811ef8bc7c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_tag`
--

CREATE TABLE `tx_tag` (
                          `id` int(11) NOT NULL,
                          `tag_name` varchar(150) NOT NULL,
                          `frequency` int(11) DEFAULT NULL,
                          `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_user`
--

CREATE TABLE `tx_user` (
                           `id` int(11) NOT NULL,
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
                           `auth_tf_enabled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_user`
--

INSERT INTO `tx_user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `unconfirmed_email`, `registration_ip`, `flags`, `confirmed_at`, `blocked_at`, `updated_at`, `created_at`, `last_login_at`, `auth_tf_key`, `auth_tf_enabled`) VALUES
    (1, 'admin', 'ombakrinai@gmail.com', '$2y$10$oD129/e5PjrTkIV1yiR3AuOc2/XAOXLWgKPfb8svo8BdBA4PUsw3G', 'e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm', NULL, NULL, 0, NULL, NULL, 1675777211, 1675777211, 1726456922, NULL, 0);

--
-- Indexes for dumped tables
--

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
    ADD KEY `Fk_assessment_detail_period` (`period_id`),
    ADD KEY `FK_tx_assessment_group` (`group_id`);

--
-- Indexes for table `tx_asset`
--
ALTER TABLE `tx_asset`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FK_tx_archive_category` (`asset_category_id`),
    ADD KEY `FK_tx_archive_office` (`office_id`);

--
-- Indexes for table `tx_asset_category`
--
ALTER TABLE `tx_asset_category`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FK_tx_archive_category_office` (`office_id`);

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
-- Indexes for table `tx_office_media`
--
ALTER TABLE `tx_office_media`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FK_tx_office_media_office` (`office_id`);

--
-- Indexes for table `tx_page`
--
ALTER TABLE `tx_page`
    ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `tx_assessment`
--
ALTER TABLE `tx_assessment`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=432;

--
-- AUTO_INCREMENT for table `tx_asset`
--
ALTER TABLE `tx_asset`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tx_asset_category`
--
ALTER TABLE `tx_asset_category`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tx_counter`
--
ALTER TABLE `tx_counter`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tx_dashblock`
--
ALTER TABLE `tx_dashblock`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tx_office`
--
ALTER TABLE `tx_office`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_office_media`
--
ALTER TABLE `tx_office_media`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_page`
--
ALTER TABLE `tx_page`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tx_participant`
--
ALTER TABLE `tx_participant`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tx_schedule_detail`
--
ALTER TABLE `tx_schedule_detail`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tx_tag`
--
ALTER TABLE `tx_tag`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_user`
--
ALTER TABLE `tx_user`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tx_assessment`
--
ALTER TABLE `tx_assessment`
    ADD CONSTRAINT `FK_tx_assessment_group` FOREIGN KEY (`group_id`) REFERENCES `tx_group` (`id`),
    ADD CONSTRAINT `Fk_assessment_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`),
    ADD CONSTRAINT `Fk_assessment_participant` FOREIGN KEY (`participant_id`) REFERENCES `tx_participant` (`id`),
    ADD CONSTRAINT `Fk_assessment_period` FOREIGN KEY (`period_id`) REFERENCES `tx_period` (`id`),
    ADD CONSTRAINT `Fk_assessment_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `tx_schedule` (`id`),
    ADD CONSTRAINT `Fk_assessment_schedule_detail` FOREIGN KEY (`schedule_detail_id`) REFERENCES `tx_schedule_detail` (`id`),
    ADD CONSTRAINT `Fk_assessment_subject` FOREIGN KEY (`subject_id`) REFERENCES `tx_subject` (`id`);

--
-- Constraints for table `tx_asset`
--
ALTER TABLE `tx_asset`
    ADD CONSTRAINT `FK_tx_archive_category` FOREIGN KEY (`asset_category_id`) REFERENCES `tx_asset_category` (`id`),
    ADD CONSTRAINT `FK_tx_archive_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

--
-- Constraints for table `tx_asset_category`
--
ALTER TABLE `tx_asset_category`
    ADD CONSTRAINT `FK_tx_archive_category_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

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
-- Constraints for table `tx_office_media`
--
ALTER TABLE `tx_office_media`
    ADD CONSTRAINT `FK_tx_office_media_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
