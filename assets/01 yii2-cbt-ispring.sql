-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 07:40 AM
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
-- Database: `yii2_cbt_ispring`
--

-- --------------------------------------------------------

--
-- Table structure for table `tx_archive`
--

CREATE TABLE `tx_archive` (
                              `id` int(11) NOT NULL,
                              `is_visible` int(11) DEFAULT NULL,
                              `archive_type` int(11) DEFAULT NULL,
                              `archive_category_id` int(11) DEFAULT NULL,
                              `title` varchar(200) DEFAULT NULL,
                              `date_issued` date DEFAULT NULL,
                              `file_name` varchar(200) DEFAULT NULL,
                              `archive_url` varchar(500) DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `tx_archive_category`
--

CREATE TABLE `tx_archive_category` (
                                       `id` int(11) NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `tx_assessment`
--

CREATE TABLE `tx_assessment` (
                                 `id` int(11) NOT NULL,
                                 `office_id` int(11) DEFAULT NULL,
                                 `test1` text DEFAULT NULL,
                                 `test2` text DEFAULT NULL,
                                 `test3` text DEFAULT NULL,
                                 `created_at` datetime DEFAULT NULL,
                                 `updated_at` datetime DEFAULT NULL,
                                 `created_by` int(11) DEFAULT NULL,
                                 `updated_by` int(11) DEFAULT NULL,
                                 `verlock` int(11) DEFAULT NULL,
                                 `is_deleted` int(11) DEFAULT NULL,
                                 `deleted_at` datetime DEFAULT NULL,
                                 `deleted_by` int(11) DEFAULT NULL,
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
    ('admin', '1', 1705331584);

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
                                                                                                                ('admin', 1, 'Admin', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-archive', 2, 'Create Archive', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-archivecategory', 2, 'Create Archive Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-assessment', 2, 'Create Assessment', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('create-author', 2, 'Create Author', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-blog', 2, 'Create Blog', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-category', 2, 'Create Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-employment', 2, 'Create Employment', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-event', 2, 'Create Event', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-ispring-master', 2, 'Create Ispring Master', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('create-ispring-transaction', 2, 'Create Ispring Transaction', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('create-master', 2, 'Create Master', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-office', 2, 'Create Office', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-participant', 2, 'Create Participant', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('create-profile', 2, 'Create Profile', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-quote', 2, 'Create Quote', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-room', 2, 'Create Room', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('create-staff', 2, 'Create Staff', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-subject', 2, 'Create Subject', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('create-theme', 2, 'Create Theme', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('create-transaction', 2, 'Create Transaction', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-archive', 2, 'Delete Archive', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-archivecategory', 2, 'Delete Archive Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-assessment', 2, 'Delete Assessment', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('delete-author', 2, 'Delete Author', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-blog', 2, 'Delete Blog', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-category', 2, 'Delete Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-employment', 2, 'Delete Employment', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-event', 2, 'Delete Event', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-ispring-master', 2, 'Delete Ispring Master', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('delete-ispring-transaction', 2, 'Delete Ispring Transaction', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('delete-master', 2, 'Delete Master', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-office', 2, 'Delete Office', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-participant', 2, 'Delete Participant', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('delete-profile', 2, 'Delete Profile', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-quote', 2, 'Delete Quote', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-room', 2, 'Delete Room', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('delete-staff', 2, 'Delete Staff', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-subject', 2, 'Delete Subject', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('delete-theme', 2, 'Delete Theme', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('delete-transaction', 2, 'Delete Transaction', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('guest', 1, 'Guest', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-archive', 2, 'Index Archive', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-archivecategory', 2, 'Index Archive Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-assessment', 2, 'Index Assessment', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('index-author', 2, 'Index Author', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-blog', 2, 'Index Blog', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-category', 2, 'Index Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-employment', 2, 'Index Employment', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-event', 2, 'Index Event', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-ispring-master', 2, 'Index Ispring Master', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('index-ispring-transaction', 2, 'Index Ispring Transaction', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('index-master', 2, 'Index Master', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-office', 2, 'Index Office', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-participant', 2, 'Index Participant', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('index-profile', 2, 'Index Profile', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-quote', 2, 'Index Quote', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-room', 2, 'Index Room', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('index-staff', 2, 'Index Staff', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-subject', 2, 'Index Subject', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('index-theme', 2, 'Index Theme', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('index-transaction', 2, 'Index Transaction', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('owner', 1, 'Company Owner', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('reguler', 1, 'Reguler', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('report-archive', 2, 'Report Archive', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('report-archivecategory', 2, 'Report Archive Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('report-assessment', 2, 'Report Assessment', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('report-ispring-master', 2, 'Report Ispring Master', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('report-ispring-transaction', 2, 'Report Ispring Transaction', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('report-master', 2, 'Report Master', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('report-participant', 2, 'Report Participant', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('report-room', 2, 'Report Room', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('report-subject', 2, 'Report Subject', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('report-transaction', 2, 'Report Transaction', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-archive', 2, 'Update Archive', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-archivecategory', 2, 'Update Archive Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-assessment', 2, 'Update Assessment', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('update-author', 2, 'Update Author', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-blog', 2, 'Update Blog', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-category', 2, 'Update Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-employment', 2, 'Update Employment', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-event', 2, 'Update Event', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-ispring-master', 2, 'Update Ispring Master', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('update-ispring-transaction', 2, 'Update Ispring Transaction', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('update-master', 2, 'Update Master', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-office', 2, 'Update Office', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-participant', 2, 'Update Participant', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('update-profile', 2, 'Update Profile', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-quote', 2, 'Update Quote', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-room', 2, 'Update Room', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('update-staff', 2, 'Update Staff', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-subject', 2, 'Update Subject', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('update-theme', 2, 'Update Theme', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('update-transaction', 2, 'Update Transaction', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-archive', 2, 'View Archive', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-archivecategory', 2, 'View Archive Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-assessment', 2, 'View Assessment', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('view-author', 2, 'View Author', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-blog', 2, 'View Blog', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-category', 2, 'View Category', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-employment', 2, 'View Employment', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-event', 2, 'View Event', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-ispring-master', 2, 'View Ispring Master', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('view-ispring-transaction', 2, 'View Ispring Transaction', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('view-master', 2, 'View Master', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-office', 2, 'View Office', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-participant', 2, 'View Participant', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('view-profile', 2, 'View Profile', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-quote', 2, 'View Quote', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-room', 2, 'View Room', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('view-staff', 2, 'View Staff', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-subject', 2, 'View Subject', NULL, NULL, 1705331599, 1705331599),
                                                                                                                ('view-theme', 2, 'View Theme', NULL, NULL, 1705331584, 1705331584),
                                                                                                                ('view-transaction', 2, 'View Transaction', NULL, NULL, 1705331584, 1705331584);

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
                                                         ('create-ispring-master', 'create-participant'),
                                                         ('create-ispring-master', 'create-room'),
                                                         ('create-ispring-master', 'create-subject'),
                                                         ('create-ispring-transaction', 'create-assessment'),
                                                         ('create-master', 'create-archivecategory'),
                                                         ('create-master', 'create-author'),
                                                         ('create-master', 'create-category'),
                                                         ('create-master', 'create-employment'),
                                                         ('create-master', 'create-event'),
                                                         ('create-master', 'create-office'),
                                                         ('create-master', 'create-profile'),
                                                         ('create-master', 'create-quote'),
                                                         ('create-master', 'create-staff'),
                                                         ('create-master', 'create-theme'),
                                                         ('create-transaction', 'create-archive'),
                                                         ('create-transaction', 'create-blog'),
                                                         ('delete-ispring-master', 'delete-participant'),
                                                         ('delete-ispring-master', 'delete-room'),
                                                         ('delete-ispring-master', 'delete-subject'),
                                                         ('delete-ispring-transaction', 'delete-assessment'),
                                                         ('delete-master', 'delete-archivecategory'),
                                                         ('delete-master', 'delete-author'),
                                                         ('delete-master', 'delete-category'),
                                                         ('delete-master', 'delete-employment'),
                                                         ('delete-master', 'delete-event'),
                                                         ('delete-master', 'delete-office'),
                                                         ('delete-master', 'delete-profile'),
                                                         ('delete-master', 'delete-quote'),
                                                         ('delete-master', 'delete-staff'),
                                                         ('delete-master', 'delete-theme'),
                                                         ('delete-transaction', 'delete-archive'),
                                                         ('delete-transaction', 'delete-blog'),
                                                         ('guest', 'index-archive'),
                                                         ('guest', 'view-archive'),
                                                         ('index-ispring-master', 'index-participant'),
                                                         ('index-ispring-master', 'index-room'),
                                                         ('index-ispring-master', 'index-subject'),
                                                         ('index-ispring-transaction', 'index-assessment'),
                                                         ('index-master', 'index-archivecategory'),
                                                         ('index-master', 'index-author'),
                                                         ('index-master', 'index-category'),
                                                         ('index-master', 'index-employment'),
                                                         ('index-master', 'index-event'),
                                                         ('index-master', 'index-office'),
                                                         ('index-master', 'index-profile'),
                                                         ('index-master', 'index-quote'),
                                                         ('index-master', 'index-staff'),
                                                         ('index-master', 'index-theme'),
                                                         ('index-transaction', 'index-archive'),
                                                         ('index-transaction', 'index-blog'),
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
                                                         ('report-ispring-master', 'report-participant'),
                                                         ('report-ispring-master', 'report-room'),
                                                         ('report-ispring-master', 'report-subject'),
                                                         ('report-ispring-transaction', 'report-assessment'),
                                                         ('report-master', 'report-archivecategory'),
                                                         ('report-transaction', 'report-archive'),
                                                         ('update-ispring-master', 'update-participant'),
                                                         ('update-ispring-master', 'update-room'),
                                                         ('update-ispring-master', 'update-subject'),
                                                         ('update-ispring-transaction', 'update-assessment'),
                                                         ('update-master', 'update-archivecategory'),
                                                         ('update-master', 'update-author'),
                                                         ('update-master', 'update-category'),
                                                         ('update-master', 'update-employment'),
                                                         ('update-master', 'update-event'),
                                                         ('update-master', 'update-office'),
                                                         ('update-master', 'update-profile'),
                                                         ('update-master', 'update-quote'),
                                                         ('update-master', 'update-staff'),
                                                         ('update-master', 'update-theme'),
                                                         ('update-transaction', 'update-archive'),
                                                         ('update-transaction', 'update-blog'),
                                                         ('view-ispring-master', 'view-participant'),
                                                         ('view-ispring-master', 'view-room'),
                                                         ('view-ispring-master', 'view-subject'),
                                                         ('view-ispring-transaction', 'view-assessment'),
                                                         ('view-master', 'view-archivecategory'),
                                                         ('view-master', 'view-author'),
                                                         ('view-master', 'view-category'),
                                                         ('view-master', 'view-employment'),
                                                         ('view-master', 'view-event'),
                                                         ('view-master', 'view-office'),
                                                         ('view-master', 'view-profile'),
                                                         ('view-master', 'view-quote'),
                                                         ('view-master', 'view-staff'),
                                                         ('view-master', 'view-theme'),
                                                         ('view-transaction', 'view-archive'),
                                                         ('view-transaction', 'view-blog');

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

--
-- Dumping data for table `tx_counter`
--

INSERT INTO `tx_counter` (`id`, `office_id`, `title`, `counter`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                          (1, 2, 'PCX', 5, '2024-01-02 15:23:56', '2024-01-02 17:32:03', 2, 2, NULL, NULL, NULL, 4, '466bd81aa94811ee97d144a84247fe3b'),
                                                                                                                                                                                          (2, 2, 'SDT', 3, '2024-01-02 15:30:17', '2024-01-02 17:33:13', 2, 2, NULL, NULL, NULL, 2, '29b0c991a94911ee97d144a84247fe3b'),
                                                                                                                                                                                          (3, 2, 'FSX', 26, '2024-01-02 15:31:56', '2024-01-13 17:14:12', 2, 5, NULL, NULL, NULL, 25, '6478a2a1a94911ee97d144a84247fe3b');

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
                                                                                                                                                                                                             (1, 1, 'Manajer', '-', 1, '2023-08-22 22:30:26', '2023-08-22 22:31:50', 1, 1, NULL, NULL, NULL, 1, NULL),
                                                                                                                                                                                                             (2, 2, 'Manager', NULL, 1, '2023-11-03 21:34:23', '2023-11-03 21:34:23', 1, 1, NULL, NULL, NULL, 0, '109913837a5611eeaaf5441ea14ed578'),
                                                                                                                                                                                                             (3, 2, 'Staff', '-', 2, '2024-01-02 15:15:58', '2024-01-02 15:15:58', 2, 2, NULL, NULL, NULL, 0, '29466d8aa94711ee97d144a84247fe3b');

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

INSERT INTO `tx_office` (`id`, `user_id`, `title`, `phone_number`, `fax_number`, `email`, `web`, `address`, `latitude`, `longitude`, `facebook`, `google_plus`, `instagram`, `twitter`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                                                                                                                (1, 1, 'Es Nanta ID', '-', NULL, 'ombakrinai@gmail.com', 'esnanta.my.id', '-', NULL, NULL, NULL, NULL, NULL, NULL, '-', '2023-08-18 22:25:10', '2023-08-18 22:25:10', 1, 1, NULL, NULL, NULL, 0, NULL),
                                                                                                                                                                                                                                                                                                                                (2, 2, 'CV Rajahati', '081360328522', NULL, 'rajahati@rajahati.com', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-11-03 21:34:23', '2024-01-02 16:33:28', 1, 2, NULL, NULL, NULL, 1, '1096ca237a5611eeaaf5441ea14ed578');

-- --------------------------------------------------------

--
-- Table structure for table `tx_participant`
--

CREATE TABLE `tx_participant` (
                                  `id` int(11) NOT NULL,
                                  `office_id` int(11) DEFAULT NULL,
                                  `title` varchar(15) DEFAULT NULL,
                                  `participant_name` varchar(100) DEFAULT NULL,
                                  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
                                                                                                                                                         (1, 'Nanta Es', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
                                                                                                                                                         (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
                                                                                                                                                         (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
                                                                                                                                                         (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
                                                                                                                                                         (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
                                                      ('0h29agn1a4u8g1dqjvqcg7rdgs', 1705252315, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('2la9aa5f7at6pl8gd7b56fsi9o', 1705251795, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('7dej2rrhrf4j4qnc9emhm87ska', 1705251825, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('ets0ivb83dc83s1po5gijde52i', 1705251644, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('fnngqq77pi8rq7t1csk0k0t969', 1705334907, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('ifhk0d4vf2c82qj1ksonp7thg0', 1705252225, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('lkaib0q71gpegi72dsd6kel2ii', 1705250792, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('v56f8816i8jr3lugr66f3pqiv4', 1705388519, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('vr8s85l0elb0p0tu4o1vqm6m8u', 1705251590, 0x5f5f666c6173687c613a303a7b7d);

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
                            `file_name` varchar(200) DEFAULT NULL,
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

INSERT INTO `tx_staff` (`id`, `user_id`, `office_id`, `employment_id`, `title`, `initial`, `identity_number`, `phone_number`, `gender_status`, `active_status`, `address`, `file_name`, `email`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                                                                                                                         (1, 1, 1, 1, 'Nanta Es', 'Ade', '123', '123', 1, 1, '-', '654f25f00c353.jpg', 'asdf', '-', '2023-08-23 22:29:45', '2023-11-11 13:57:56', 1, 1, NULL, NULL, NULL, 6, NULL),
                                                                                                                                                                                                                                                                                                                                         (2, 2, 2, 2, 'rajahati', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-11-03 21:34:23', '2023-11-03 21:34:23', 1, 1, NULL, NULL, NULL, 0, '109bc5fe7a5611eeaaf5441ea14ed578'),
                                                                                                                                                                                                                                                                                                                                         (3, 3, 2, 3, 'Sadiqul Wahyudi', '', NULL, '', NULL, 1, '', '', '', '', '2024-01-02 15:18:52', '2024-01-02 16:32:45', 2, 2, NULL, NULL, NULL, 1, '913a1c0aa94711ee97d144a84247fe3b'),
                                                                                                                                                                                                                                                                                                                                         (4, 4, 2, 3, 'Afna Lilia', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-02 16:31:29', '2024-01-02 16:31:29', 2, 2, NULL, NULL, NULL, 0, 'b6529c42a95111ee97d144a84247fe3b'),
                                                                                                                                                                                                                                                                                                                                         (5, 5, 2, 3, 'Nurahmah Yanti', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-02 16:32:14', '2024-01-02 16:32:14', 2, 2, NULL, NULL, NULL, 0, 'd0cd01a6a95111ee97d144a84247fe3b');

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
                            `file_name` varchar(200) DEFAULT NULL,
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

INSERT INTO `tx_theme` (`id`, `office_id`, `title`, `theme_type`, `content`, `file_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                  (1, 1, 'Logo Frontend Header', 1, NULL, NULL, 'Logo Frontend Header', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'eb910935-7a55-11ee-aaf5-441ea14ed578'),
                                                                                                                                                                                                                                  (2, 1, 'Logo Frontend Footer', 2, NULL, NULL, 'Logo Frontend Footer', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'eb910cd7-7a55-11ee-aaf5-441ea14ed578'),
                                                                                                                                                                                                                                  (3, 1, 'Logo Backend Header', 3, NULL, NULL, 'Logo Backend Header', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'eb910de7-7a55-11ee-aaf5-441ea14ed578'),
                                                                                                                                                                                                                                  (4, 1, 'Logo Backend Footer', 4, NULL, NULL, 'Logo Backend Footer', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'eb910e82-7a55-11ee-aaf5-441ea14ed578'),
                                                                                                                                                                                                                                  (5, 1, 'Logo Report', 5, NULL, NULL, 'Logo Report', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'eb910f02-7a55-11ee-aaf5-441ea14ed578'),
                                                                                                                                                                                                                                  (6, 1, 'Logo Invoice', 6, NULL, NULL, 'Logo Invoice', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'eb910f7a-7a55-11ee-aaf5-441ea14ed578'),
                                                                                                                                                                                                                                  (7, 1, 'Title', 7, NULL, NULL, 'Title', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'eb910ff0-7a55-11ee-aaf5-441ea14ed578'),
                                                                                                                                                                                                                                  (8, 1, 'Content', 8, NULL, NULL, 'Content', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, 'eb911062-7a55-11ee-aaf5-441ea14ed578'),
                                                                                                                                                                                                                                  (9, 2, 'Logo Frontend Header', 1, NULL, NULL, 'Logo Frontend Header', '2023-11-03 21:34:23', '2023-11-03 21:34:23', 1, 1, NULL, NULL, NULL, 0, '109db2d67a5611eeaaf5441ea14ed578'),
                                                                                                                                                                                                                                  (10, 2, 'Logo Frontend Footer', 2, NULL, NULL, 'Logo Frontend Footer', '2023-11-03 21:34:23', '2023-11-03 21:34:23', 1, 1, NULL, NULL, NULL, 0, '109ddcae7a5611eeaaf5441ea14ed578'),
                                                                                                                                                                                                                                  (11, 2, 'Logo Backend Header', 3, NULL, NULL, 'Logo Backend Header', '2023-11-03 21:34:23', '2023-11-03 21:34:23', 1, 1, NULL, NULL, NULL, 0, '109e05d97a5611eeaaf5441ea14ed578'),
                                                                                                                                                                                                                                  (12, 2, 'Logo Backend Footer', 4, NULL, NULL, 'Logo Backend Footer', '2023-11-03 21:34:23', '2023-11-03 21:34:23', 1, 1, NULL, NULL, NULL, 0, '109e2e7e7a5611eeaaf5441ea14ed578'),
                                                                                                                                                                                                                                  (13, 2, 'Logo Report', 5, NULL, NULL, 'Logo Report', '2023-11-03 21:34:23', '2023-11-03 21:34:23', 1, 1, NULL, NULL, NULL, 0, '10a042557a5611eeaaf5441ea14ed578'),
                                                                                                                                                                                                                                  (14, 2, 'Logo Invoice', 6, NULL, NULL, 'Logo Invoice', '2023-11-03 21:34:23', '2023-11-03 21:34:23', 1, 1, NULL, NULL, NULL, 0, '10a090db7a5611eeaaf5441ea14ed578'),
                                                                                                                                                                                                                                  (15, 2, 'Title', 7, NULL, NULL, 'Title', '2023-11-03 21:34:23', '2023-11-03 21:34:23', 1, 1, NULL, NULL, NULL, 0, '10a0cc5e7a5611eeaaf5441ea14ed578'),
                                                                                                                                                                                                                                  (16, 2, 'Content', 8, NULL, NULL, 'Content', '2023-11-03 21:34:23', '2023-11-03 21:34:23', 1, 1, NULL, NULL, NULL, 0, '10a0fee07a5611eeaaf5441ea14ed578');

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
                                                                                                                                                                                                                                                 (1, 'admin', 'ombakrinai@gmail.com', '$2y$10$oD129/e5PjrTkIV1yiR3AuOc2/XAOXLWgKPfb8svo8BdBA4PUsw3G', 'e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm', NULL, NULL, 0, NULL, NULL, 1675777211, 1675777211, 1705386953, NULL, 0),
                                                                                                                                                                                                                                                 (2, 'rajahati', 'rajahati@oke.com', '$2y$12$ZBs3Bnv1RrdVWxhrxNMeLeT9Fr1EdLD1T6zY70KJ.fzkOxOilVgFy', 'oyb5maS0UL9P11U6EUjDo4ok980M8wNR', NULL, '180.241.44.219', 0, NULL, NULL, 1699022063, 1699022063, 1705159096, NULL, 0),
                                                                                                                                                                                                                                                 (3, 'sadiqulwahyudi@gmail.com', 'sadiqulwahyudi@gmail.com', '$2y$12$evPFMD73ILudJ/lF4qfIh.Lt9QmrZ77aOPA/bTxzkNTu/0suIIyNK', 'ecNmxD3FGiFOf5HX7J3pwtuqN16GPxZo', NULL, '180.241.46.7', 0, NULL, NULL, 1704188118, 1704183532, 1704560204, NULL, 0),
                                                                                                                                                                                                                                                 (4, 'afna', 'afna@rajahati.com', '$2y$12$fwJhdAvfKR86cj4oHi2QbuVU7C1woAXuBgw13fqM/RXYUfg8vkXKe', 'ukgumez3ivNnx9mOazFJiVBKM0Ebyzmh', NULL, '36.85.110.2', 0, NULL, NULL, 1704187889, 1704187889, 1704196731, NULL, 0),
                                                                                                                                                                                                                                                 (5, 'rahmah', 'rahmah@rajahati.com', '$2y$12$Hwyf/DkFNWzes4pOZtWXmO.9.ZYwWp3D8IyaAbAz6Xi4v.QekcEj.', 'lWP3wX6sso0DVqiXJGJX8JW1TqJ5o7VI', NULL, '36.85.110.2', 0, NULL, NULL, 1704187934, 1704187934, 1704194261, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tx_archive`
--
ALTER TABLE `tx_archive`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FK_tx_archive_category` (`archive_category_id`);

--
-- Indexes for table `tx_archive_category`
--
ALTER TABLE `tx_archive_category`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_assessment`
--
ALTER TABLE `tx_assessment`
    ADD PRIMARY KEY (`id`),
    ADD KEY `Fk_assessment_office` (`office_id`);

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
    ADD KEY `Fk_participant_office` (`office_id`);

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_archive_category`
--
ALTER TABLE `tx_archive_category`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tx_assessment`
--
ALTER TABLE `tx_assessment`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tx_counter`
--
ALTER TABLE `tx_counter`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tx_dashblock`
--
ALTER TABLE `tx_dashblock`
    MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_employment`
--
ALTER TABLE `tx_employment`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tx_event`
--
ALTER TABLE `tx_event`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_office`
--
ALTER TABLE `tx_office`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tx_participant`
--
ALTER TABLE `tx_participant`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_profile`
--
ALTER TABLE `tx_profile`
    MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tx_subject`
--
ALTER TABLE `tx_subject`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_tag`
--
ALTER TABLE `tx_tag`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_theme`
--
ALTER TABLE `tx_theme`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tx_user`
--
ALTER TABLE `tx_user`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tx_archive`
--
ALTER TABLE `tx_archive`
    ADD CONSTRAINT `FK_tx_archive_category` FOREIGN KEY (`archive_category_id`) REFERENCES `tx_archive_category` (`id`);

--
-- Constraints for table `tx_assessment`
--
ALTER TABLE `tx_assessment`
    ADD CONSTRAINT `Fk_assessment_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

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
-- Constraints for table `tx_office`
--
ALTER TABLE `tx_office`
    ADD CONSTRAINT `Fk_tx_office_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`);

--
-- Constraints for table `tx_participant`
--
ALTER TABLE `tx_participant`
    ADD CONSTRAINT `Fk_participant_office` FOREIGN KEY (`office_id`) REFERENCES `tx_office` (`id`);

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
