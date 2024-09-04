-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2024 at 07:42 PM
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
                                 `work_status` int(11) DEFAULT NULL,
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
    ('admin', '1', 1721842247);

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
                                                                                                                ('admin', 1, 'Admin', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-assessment', 2, 'Create Assessment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-asset', 2, 'Create Asset', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-assetcategory', 2, 'Create Asset Category', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-employment', 2, 'Create Employment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-group', 2, 'Create Group', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-ispring-master', 2, 'Create Ispring Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-ispring-transaction', 2, 'Create Ispring Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-master', 2, 'Create Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-office', 2, 'Create Office', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-officemedia', 2, 'Create Office Media', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-page', 2, 'Create Page', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-participant', 2, 'Create Participant', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-period', 2, 'Create Period', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-profile', 2, 'Create Profile', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-room', 2, 'Create Room', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-schedule', 2, 'Create Schedule', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-scheduledetail', 2, 'Create Schedule Detail', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-staff', 2, 'Create Staff', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-subject', 2, 'Create Subject', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('create-transaction', 2, 'Create Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-assessment', 2, 'Delete Assessment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-asset', 2, 'Delete Asset', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-assetcategory', 2, 'Delete Asset Category', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-employment', 2, 'Delete Employment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-group', 2, 'Delete Group', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-ispring-master', 2, 'Delete Ispring Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-ispring-transaction', 2, 'Delete Ispring Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-master', 2, 'Delete Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-office', 2, 'Delete Office', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-officemedia', 2, 'Delete Office Media', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-page', 2, 'Delete Page', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-participant', 2, 'Delete Participant', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-period', 2, 'Delete Period', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-profile', 2, 'Delete Profile', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-room', 2, 'Delete Room', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-schedule', 2, 'Delete Schedule', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-scheduledetail', 2, 'Delete Schedule Detail', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-staff', 2, 'Delete Staff', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-subject', 2, 'Delete Subject', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('delete-transaction', 2, 'Delete Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('guest', 1, 'Guest', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-assessment', 2, 'Index Assessment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-asset', 2, 'Index Asset', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-assetcategory', 2, 'Index Asset Category', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-employment', 2, 'Index Employment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-group', 2, 'Index Group', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-ispring-master', 2, 'Index Ispring Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-ispring-transaction', 2, 'Index Ispring Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-master', 2, 'Index Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-office', 2, 'Index Office', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-officemedia', 2, 'Index Office Media', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-page', 2, 'Index Page', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-participant', 2, 'Index Participant', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-period', 2, 'Index Period', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-profile', 2, 'Index Profile', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-room', 2, 'Index Room', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-schedule', 2, 'Index Schedule', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-scheduledetail', 2, 'Index Schedule Detail', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-staff', 2, 'Index Staff', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-subject', 2, 'Index Subject', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('index-transaction', 2, 'Index Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('owner', 1, 'Company Owner', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('participant', 1, 'Participant', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('regular', 1, 'Regular', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-assessment', 2, 'Report Assessment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-asset', 2, 'Report Asset', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-assetcategory', 2, 'Report Asset Category', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-group', 2, 'Report Group', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-ispring-master', 2, 'Report Ispring Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-ispring-transaction', 2, 'Report Ispring Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-master', 2, 'Report Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-participant', 2, 'Report Participant', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-period', 2, 'Report Period', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-room', 2, 'Report Room', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-schedule', 2, 'Report Schedule', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-scheduledetail', 2, 'Report Schedule Detail', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-subject', 2, 'Report Subject', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('report-transaction', 2, 'Report Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-assessment', 2, 'Update Assessment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-asset', 2, 'Update Asset', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-assetcategory', 2, 'Update Asset Category', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-employment', 2, 'Update Employment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-group', 2, 'Update Group', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-ispring-master', 2, 'Update Ispring Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-ispring-transaction', 2, 'Update Ispring Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-master', 2, 'Update Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-office', 2, 'Update Office', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-officemedia', 2, 'Update Office Media', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-page', 2, 'Update Page', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-participant', 2, 'Update Participant', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-period', 2, 'Update Period', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-profile', 2, 'Update Profile', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-room', 2, 'Update Room', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-schedule', 2, 'Update Schedule', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-scheduledetail', 2, 'Update Schedule Detail', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-staff', 2, 'Update Staff', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-subject', 2, 'Update Subject', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('update-transaction', 2, 'Update Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-assessment', 2, 'View Assessment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-asset', 2, 'View Asset', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-assetcategory', 2, 'View Asset Category', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-employment', 2, 'View Employment', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-group', 2, 'View Group', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-ispring-master', 2, 'View Ispring Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-ispring-transaction', 2, 'View Ispring Transaction', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-master', 2, 'View Master', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-office', 2, 'View Office', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-officemedia', 2, 'View Office Media', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-page', 2, 'View Page', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-participant', 2, 'View Participant', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-period', 2, 'View Period', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-profile', 2, 'View Profile', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-room', 2, 'View Room', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-schedule', 2, 'View Schedule', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-scheduledetail', 2, 'View Schedule Detail', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-staff', 2, 'View Staff', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-subject', 2, 'View Subject', NULL, NULL, 1721842247, 1721842247),
                                                                                                                ('view-transaction', 2, 'View Transaction', NULL, NULL, 1721842247, 1721842247);

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
                           `office_id` int(11) DEFAULT NULL,
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

INSERT INTO `tx_page` (`id`, `page_type`, `office_id`, `title`, `content`, `asset_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                 (1, 1, 1, 'Logo Frontend Header', NULL, NULL, 'Logo Frontend Header', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '60de76b6-3c11-11ef-9f1b-c858c0b7f92f'),
                                                                                                                                                                                                                                 (2, 1, 1, 'Logo Frontend Footer', NULL, NULL, 'Logo Frontend Footer', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '60de92a2-3c11-11ef-9f1b-c858c0b7f92f'),
                                                                                                                                                                                                                                 (3, 1, 1, 'Logo Backend Header', NULL, NULL, 'Logo Backend Header', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '60de9351-3c11-11ef-9f1b-c858c0b7f92f'),
                                                                                                                                                                                                                                 (4, 1, 1, 'Logo Backend Footer', NULL, NULL, 'Logo Backend Footer', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '60de93b0-3c11-11ef-9f1b-c858c0b7f92f'),
                                                                                                                                                                                                                                 (5, 1, 1, 'Logo Report', NULL, NULL, 'Logo Report', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '60de942d-3c11-11ef-9f1b-c858c0b7f92f'),
                                                                                                                                                                                                                                 (6, 1, 1, 'Logo Invoice', NULL, NULL, 'Logo Invoice', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '60de948e-3c11-11ef-9f1b-c858c0b7f92f'),
                                                                                                                                                                                                                                 (7, 1, 1, 'Title', NULL, NULL, 'Title', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '60de94c6-3c11-11ef-9f1b-c858c0b7f92f'),
                                                                                                                                                                                                                                 (8, 1, 1, 'Content', NULL, NULL, 'Content', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, '60de94fd-3c11-11ef-9f1b-c858c0b7f92f');

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

-- --------------------------------------------------------

--
-- Table structure for table `tx_schedule_detail`
--

CREATE TABLE `tx_schedule_detail` (
                                      `id` int(11) NOT NULL,
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
                                      `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
                                                      ('6v14br8pj3sihijvnhs036jtf0', 1721844196, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('99bm5e8rng35av0od4r2a1m4js', 1721844333, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b);

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
    (1, 'admin', 'ombakrinai@gmail.com', '$2y$10$oD129/e5PjrTkIV1yiR3AuOc2/XAOXLWgKPfb8svo8BdBA4PUsw3G', 'e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm', NULL, NULL, 0, NULL, NULL, 1675777211, 1675777211, 1721840937, NULL, 0);

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
    ADD KEY `Fk_assessment_detail_period` (`period_id`);

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
    ADD PRIMARY KEY (`id`),
    ADD KEY `FK_tx_content_theme` (`office_id`);

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_asset`
--
ALTER TABLE `tx_asset`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tx_asset_category`
--
ALTER TABLE `tx_asset_category`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tx_counter`
--
ALTER TABLE `tx_counter`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tx_participant`
--
ALTER TABLE `tx_participant`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
-- Constraints for table `tx_page`
--
ALTER TABLE `tx_page`
    ADD CONSTRAINT `Fx_tx_theme_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

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
