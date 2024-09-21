-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2024 at 11:10 AM
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (988, 1, 75, 143, 146, 2, 32, 34, 2, 1, 'x.x.x', '21.00', '25.00', NULL, '41.00', '52.00', 'Matematika', 'graded', 'Uwolff.yolanda@von.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7f9b29da76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (989, 1, 75, 143, 147, 2, 32, 34, 2, 1, 'x.x.x', '22.00', '25.00', NULL, '28.00', '79.00', 'Matematika', 'graded', 'Udylan22@nitzsche.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7f9c8b7f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (990, 1, 75, 143, 148, 2, 32, 34, 2, 1, 'x.x.x', '22.00', '25.00', NULL, '10.00', '221.00', 'Matematika', 'graded', 'Uarvid.pollich@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7f9d39b476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (991, 1, 75, 143, 149, 2, 32, 34, 2, 1, 'x.x.x', '41.00', '25.00', NULL, '17.00', '242.00', 'Matematika', 'graded', 'Ujulie.nikolaus@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7f9dc3f576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (992, 1, 75, 143, 163, 2, 32, 34, 2, 1, 'x.x.x', '27.00', '25.00', NULL, '41.00', '66.00', 'Matematika', 'graded', 'U0078294733', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7f9e777076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (993, 1, 75, 143, 164, 2, 32, 34, 2, 1, 'x.x.x', '17.00', '25.00', NULL, '41.00', '42.00', 'Matematika', 'graded', 'U0063509763', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7f9f6cf276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (994, 1, 75, 143, 165, 2, 32, 34, 2, 1, 'x.x.x', '44.00', '25.00', NULL, '14.00', '315.00', 'Matematika', 'graded', 'U0053756117', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7f9febb676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (995, 1, 75, 143, 166, 2, 32, 34, 2, 1, 'x.x.x', '44.00', '25.00', NULL, '30.00', '147.00', 'Matematika', 'graded', 'U0065125737', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7fa09ba676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (996, 1, 75, 143, 167, 2, 32, 34, 2, 1, 'x.x.x', '26.00', '25.00', NULL, '38.00', '69.00', 'Matematika', 'graded', 'U0065757046', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7fa138af76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (997, 1, 75, 143, 168, 2, 32, 34, 2, 1, 'x.x.x', '32.00', '25.00', NULL, '28.00', '115.00', 'Matematika', 'graded', 'U0064848339', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7fa20d7a76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (998, 1, 75, 143, 171, 2, 32, 34, 2, 1, 'x.x.x', '10.00', '25.00', NULL, '49.00', '21.00', 'Matematika', 'graded', 'U0076787140', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7fa2ceec76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (999, 1, 75, 143, 172, 2, 32, 34, 2, 1, 'x.x.x', '23.00', '25.00', NULL, '37.00', '63.00', 'Matematika', 'graded', 'U0066822084', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7fa36d1f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1000, 1, 75, 143, 173, 2, 32, 34, 2, 1, 'x.x.x', '12.00', '25.00', NULL, '20.00', '60.00', 'Matematika', 'graded', 'U0067053895', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7fa43ec076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1001, 1, 75, 143, 174, 2, 32, 34, 2, 1, 'x.x.x', '17.00', '25.00', NULL, '24.00', '71.00', 'Matematika', 'graded', 'U0064788352', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7fa4bed576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1002, 1, 75, 143, 175, 2, 32, 34, 2, 1, 'x.x.x', '34.00', '25.00', NULL, '15.00', '227.00', 'Matematika', 'graded', 'U0056176047', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7fa572e676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1003, 1, 75, 143, 176, 2, 32, 34, 2, 1, 'x.x.x', '29.00', '25.00', NULL, '48.00', '61.00', 'Matematika', 'graded', 'U0066765899', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:54', '2024-09-19 23:44:54', 1, 1, NULL, NULL, NULL, 1, '7fa6041376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1004, 1, 75, 143, 177, 2, 32, 34, 2, 1, 'x.x.x', '43.00', '25.00', NULL, '33.00', '131.00', 'Matematika', 'graded', 'U0064226685', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fa6bb2376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1005, 1, 75, 143, 178, 2, 32, 34, 2, 1, 'x.x.x', '26.00', '25.00', NULL, '19.00', '137.00', 'Matematika', 'graded', 'U0064115981', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fa73bfb76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1006, 1, 75, 143, 179, 2, 32, 34, 2, 1, 'x.x.x', '10.00', '25.00', NULL, '29.00', '35.00', 'Matematika', 'graded', 'U0067675678', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fa7df7f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1007, 1, 75, 143, 180, 2, 32, 34, 2, 1, 'x.x.x', '24.00', '25.00', NULL, '42.00', '58.00', 'Matematika', 'graded', 'U0062231412', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fa861b376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1008, 1, 75, 143, 181, 2, 32, 34, 2, 1, 'x.x.x', '23.00', '25.00', NULL, '45.00', '52.00', 'Matematika', 'graded', 'U0068042913', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fa913e976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1009, 1, 75, 143, 182, 2, 32, 34, 2, 1, 'x.x.x', '24.00', '25.00', NULL, '17.00', '142.00', 'Matematika', 'graded', 'U0062475153', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fa9c41c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1010, 1, 75, 143, 183, 2, 32, 34, 2, 1, 'x.x.x', '25.00', '25.00', NULL, '33.00', '76.00', 'Matematika', 'graded', 'U0061728059', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7faa764576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1011, 1, 75, 143, 184, 2, 32, 34, 2, 1, 'x.x.x', '32.00', '25.00', NULL, '37.00', '87.00', 'Matematika', 'graded', 'U0063723566', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fab0c7776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1012, 1, 75, 143, 185, 2, 32, 34, 2, 1, 'x.x.x', '26.00', '25.00', NULL, '32.00', '82.00', 'Matematika', 'graded', 'U0066038509', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fabbcaf76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1013, 1, 75, 143, 186, 2, 32, 34, 2, 1, 'x.x.x', '25.00', '25.00', NULL, '39.00', '65.00', 'Matematika', 'graded', 'U0051515150', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fac6bc976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1014, 1, 75, 143, 187, 2, 32, 34, 2, 1, 'x.x.x', '50.00', '25.00', NULL, '18.00', '278.00', 'Matematika', 'graded', 'U0069297662', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7facf8e576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1015, 1, 75, 143, 188, 2, 32, 34, 2, 1, 'x.x.x', '48.00', '25.00', NULL, '39.00', '124.00', 'Matematika', 'graded', 'U0063784793', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fadb2df76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1016, 1, 75, 143, 189, 2, 32, 34, 2, 1, 'x.x.x', '18.00', '25.00', NULL, '24.00', '75.00', 'Matematika', 'graded', 'U0068307640', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fae72b976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1017, 1, 75, 143, 190, 2, 32, 34, 2, 1, 'x.x.x', '46.00', '25.00', NULL, '15.00', '307.00', 'Matematika', 'graded', 'U0062599709', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7faf391776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1018, 1, 75, 143, 191, 2, 32, 34, 2, 1, 'x.x.x', '37.00', '25.00', NULL, '24.00', '155.00', 'Matematika', 'graded', 'U0067129512', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fafbc4f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1019, 1, 75, 143, 192, 2, 32, 34, 2, 1, 'x.x.x', '49.00', '25.00', NULL, '14.00', '350.00', 'Matematika', 'graded', 'U0062471428', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb07c9d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1020, 1, 75, 143, 193, 2, 32, 34, 2, 1, 'x.x.x', '40.00', '25.00', NULL, '40.00', '100.00', 'Matematika', 'graded', 'U0067476158', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb14b5076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1021, 1, 75, 144, 146, 2, 32, 35, 2, 1, 'x.x.x', '22.00', '25.00', NULL, '42.00', '53.00', 'Kimia', 'graded', 'Uwolff.yolanda@von.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb29a2976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1022, 1, 75, 144, 147, 2, 32, 35, 2, 1, 'x.x.x', '50.00', '25.00', NULL, '41.00', '122.00', 'Kimia', 'graded', 'Udylan22@nitzsche.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb33c9f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1023, 1, 75, 144, 148, 2, 32, 35, 2, 1, 'x.x.x', '25.00', '25.00', NULL, '49.00', '52.00', 'Kimia', 'graded', 'Uarvid.pollich@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb3e85e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1024, 1, 75, 144, 149, 2, 32, 35, 2, 1, 'x.x.x', '26.00', '25.00', NULL, '50.00', '52.00', 'Kimia', 'graded', 'Ujulie.nikolaus@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb4618376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1025, 1, 75, 144, 163, 2, 32, 35, 2, 1, 'x.x.x', '43.00', '25.00', NULL, '28.00', '154.00', 'Kimia', 'graded', 'U0078294733', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb4f06476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1026, 1, 75, 144, 164, 2, 32, 35, 2, 1, 'x.x.x', '38.00', '25.00', NULL, '18.00', '212.00', 'Kimia', 'graded', 'U0063509763', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb5650276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1027, 1, 75, 144, 165, 2, 32, 35, 2, 1, 'x.x.x', '38.00', '25.00', NULL, '16.00', '238.00', 'Kimia', 'graded', 'U0053756117', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb624d476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1028, 1, 75, 144, 166, 2, 32, 35, 2, 1, 'x.x.x', '23.00', '25.00', NULL, '18.00', '128.00', 'Kimia', 'graded', 'U0065125737', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb69c0376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1029, 1, 75, 144, 167, 2, 32, 35, 2, 1, 'x.x.x', '10.00', '25.00', NULL, '34.00', '30.00', 'Kimia', 'graded', 'U0065757046', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb7348576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1030, 1, 75, 144, 168, 2, 32, 35, 2, 1, 'x.x.x', '31.00', '25.00', NULL, '28.00', '111.00', 'Kimia', 'graded', 'U0064848339', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb7a45576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1031, 1, 75, 144, 171, 2, 32, 35, 2, 1, 'x.x.x', '38.00', '25.00', NULL, '15.00', '254.00', 'Kimia', 'graded', 'U0076787140', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb8472d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1032, 1, 75, 144, 172, 2, 32, 35, 2, 1, 'x.x.x', '41.00', '25.00', NULL, '23.00', '179.00', 'Kimia', 'graded', 'U0066822084', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb9032c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1033, 1, 75, 144, 173, 2, 32, 35, 2, 1, 'x.x.x', '17.00', '25.00', NULL, '48.00', '36.00', 'Kimia', 'graded', 'U0067053895', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb97efa76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1034, 1, 75, 144, 174, 2, 32, 35, 2, 1, 'x.x.x', '14.00', '25.00', NULL, '10.00', '140.00', 'Kimia', 'graded', 'U0064788352', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fb9e54276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1035, 1, 75, 144, 175, 2, 32, 35, 2, 1, 'x.x.x', '35.00', '25.00', NULL, '12.00', '292.00', 'Kimia', 'graded', 'U0056176047', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fba511e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1036, 1, 75, 144, 176, 2, 32, 35, 2, 1, 'x.x.x', '34.00', '25.00', NULL, '20.00', '170.00', 'Kimia', 'graded', 'U0066765899', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fbb13a176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1037, 1, 75, 144, 177, 2, 32, 35, 2, 1, 'x.x.x', '26.00', '25.00', NULL, '36.00', '73.00', 'Kimia', 'graded', 'U0064226685', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fbb824476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1038, 1, 75, 144, 178, 2, 32, 35, 2, 1, 'x.x.x', '21.00', '25.00', NULL, '22.00', '96.00', 'Kimia', 'graded', 'U0064115981', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fbc168276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1039, 1, 75, 144, 179, 2, 32, 35, 2, 1, 'x.x.x', '12.00', '25.00', NULL, '44.00', '28.00', 'Kimia', 'graded', 'U0067675678', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fbc83f676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1040, 1, 75, 144, 180, 2, 32, 35, 2, 1, 'x.x.x', '43.00', '25.00', NULL, '23.00', '187.00', 'Kimia', 'graded', 'U0062231412', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fbd0cb676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1041, 1, 75, 144, 181, 2, 32, 35, 2, 1, 'x.x.x', '32.00', '25.00', NULL, '21.00', '153.00', 'Kimia', 'graded', 'U0068042913', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fbdada676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1042, 1, 75, 144, 182, 2, 32, 35, 2, 1, 'x.x.x', '49.00', '25.00', NULL, '19.00', '258.00', 'Kimia', 'graded', 'U0062475153', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fbe30e376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1043, 1, 75, 144, 183, 2, 32, 35, 2, 1, 'x.x.x', '44.00', '25.00', NULL, '17.00', '259.00', 'Kimia', 'graded', 'U0061728059', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fbec40176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1044, 1, 75, 144, 184, 2, 32, 35, 2, 1, 'x.x.x', '30.00', '25.00', NULL, '30.00', '100.00', 'Kimia', 'graded', 'U0063723566', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fbf518376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1045, 1, 75, 144, 185, 2, 32, 35, 2, 1, 'x.x.x', '40.00', '25.00', NULL, '42.00', '96.00', 'Kimia', 'graded', 'U0066038509', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fbfd7c376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1046, 1, 75, 144, 186, 2, 32, 35, 2, 1, 'x.x.x', '40.00', '25.00', NULL, '18.00', '223.00', 'Kimia', 'graded', 'U0051515150', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc05d1376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1047, 1, 75, 144, 187, 2, 32, 35, 2, 1, 'x.x.x', '33.00', '25.00', NULL, '16.00', '207.00', 'Kimia', 'graded', 'U0069297662', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc0f30f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1048, 1, 75, 144, 188, 2, 32, 35, 2, 1, 'x.x.x', '18.00', '25.00', NULL, '36.00', '50.00', 'Kimia', 'graded', 'U0063784793', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc1642c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1049, 1, 75, 144, 189, 2, 32, 35, 2, 1, 'x.x.x', '32.00', '25.00', NULL, '40.00', '80.00', 'Kimia', 'graded', 'U0068307640', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc209c976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1050, 1, 75, 144, 190, 2, 32, 35, 2, 1, 'x.x.x', '12.00', '25.00', NULL, '11.00', '110.00', 'Kimia', 'graded', 'U0062599709', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc2b55976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1051, 1, 75, 144, 191, 2, 32, 35, 2, 1, 'x.x.x', '18.00', '25.00', NULL, '26.00', '70.00', 'Kimia', 'graded', 'U0067129512', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc3502276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1052, 1, 75, 144, 192, 2, 32, 35, 2, 1, 'x.x.x', '18.00', '25.00', NULL, '14.00', '129.00', 'Kimia', 'graded', 'U0062471428', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc3db7376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1053, 1, 75, 144, 193, 2, 32, 35, 2, 1, 'x.x.x', '12.00', '25.00', NULL, '42.00', '29.00', 'Kimia', 'graded', 'U0067476158', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc466e676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1054, 1, 76, 145, 194, 2, 33, 34, 3, 1, 'x.x.x', '14.00', '25.00', NULL, '33.00', '43.00', 'Matematika', 'graded', 'U123123', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc5718e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1055, 1, 76, 146, 194, 2, 33, 35, 2, 1, 'x.x.x', '34.00', '25.00', NULL, '30.00', '114.00', 'Kimia', 'graded', 'U123123', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc619cf76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1056, 1, 77, 147, 150, 2, 34, 34, 3, 1, 'x.x.x', '40.00', '25.00', NULL, '33.00', '122.00', 'Matematika', 'graded', 'Urobert46@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc6da1676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1057, 1, 77, 147, 151, 2, 34, 34, 3, 1, 'x.x.x', '27.00', '25.00', NULL, '43.00', '63.00', 'Matematika', 'graded', 'Umaddison46@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc7712576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1058, 1, 77, 147, 152, 2, 34, 34, 3, 1, 'x.x.x', '28.00', '25.00', NULL, '47.00', '60.00', 'Matematika', 'graded', 'Udicki.mariana@gorczany.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc8255c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1059, 1, 77, 147, 153, 2, 34, 34, 3, 1, 'x.x.x', '30.00', '25.00', NULL, '49.00', '62.00', 'Matematika', 'graded', 'Ugracie.langosh@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc8a2b176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1060, 1, 77, 147, 154, 2, 34, 34, 3, 1, 'x.x.x', '24.00', '25.00', NULL, '14.00', '172.00', 'Matematika', 'graded', 'Udella18@robel.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fc939af76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1061, 1, 77, 148, 150, 2, 34, 35, 3, 1, 'x.x.x', '24.00', '25.00', NULL, '32.00', '75.00', 'Kimia', 'graded', 'Urobert46@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fca471576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1062, 1, 77, 148, 151, 2, 34, 35, 3, 1, 'x.x.x', '43.00', '25.00', NULL, '30.00', '144.00', 'Kimia', 'graded', 'Umaddison46@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fcad3de76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1063, 1, 77, 148, 152, 2, 34, 35, 3, 1, 'x.x.x', '21.00', '25.00', NULL, '27.00', '78.00', 'Kimia', 'graded', 'Udicki.mariana@gorczany.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fcb6ce176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1064, 1, 77, 148, 153, 2, 34, 35, 3, 1, 'x.x.x', '14.00', '25.00', NULL, '45.00', '32.00', 'Kimia', 'graded', 'Ugracie.langosh@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fcbe82e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1065, 1, 77, 148, 154, 2, 34, 35, 3, 1, 'x.x.x', '48.00', '25.00', NULL, '35.00', '138.00', 'Kimia', 'graded', 'Udella18@robel.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fcc9d0f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1066, 1, 78, 149, 155, 2, 35, 34, 2, 1, 'x.x.x', '36.00', '25.00', NULL, '36.00', '100.00', 'Matematika', 'graded', 'Ugkerluke@ryan.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fcdb77576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1067, 1, 78, 149, 156, 2, 35, 34, 2, 1, 'x.x.x', '17.00', '25.00', NULL, '44.00', '39.00', 'Matematika', 'graded', 'Ujacobs.carter@streich.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fce3ab876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1068, 1, 78, 149, 157, 2, 35, 34, 2, 1, 'x.x.x', '13.00', '25.00', NULL, '36.00', '37.00', 'Matematika', 'graded', 'Uqmosciski@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fcec4e376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1069, 1, 78, 149, 158, 2, 35, 34, 2, 1, 'x.x.x', '27.00', '25.00', NULL, '36.00', '75.00', 'Matematika', 'graded', 'Ulura.donnelly@rosenbaum.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fcf8c7076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1070, 1, 78, 149, 159, 2, 35, 34, 2, 1, 'x.x.x', '37.00', '25.00', NULL, '40.00', '93.00', 'Matematika', 'graded', 'Usonia.hackett@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd0362b76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1071, 1, 78, 150, 155, 2, 35, 35, 3, 1, 'x.x.x', '15.00', '25.00', NULL, '30.00', '50.00', 'Kimia', 'graded', 'Ugkerluke@ryan.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd0ec0876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1072, 1, 78, 150, 156, 2, 35, 35, 3, 1, 'x.x.x', '32.00', '25.00', NULL, '41.00', '79.00', 'Kimia', 'graded', 'Ujacobs.carter@streich.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd1a6e976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1073, 1, 78, 150, 157, 2, 35, 35, 3, 1, 'x.x.x', '34.00', '25.00', NULL, '49.00', '70.00', 'Kimia', 'graded', 'Uqmosciski@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd2b84076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1074, 1, 78, 150, 158, 2, 35, 35, 3, 1, 'x.x.x', '23.00', '25.00', NULL, '41.00', '57.00', 'Kimia', 'graded', 'Ulura.donnelly@rosenbaum.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd32dab76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1075, 1, 78, 150, 159, 2, 35, 35, 3, 1, 'x.x.x', '26.00', '25.00', NULL, '17.00', '153.00', 'Kimia', 'graded', 'Usonia.hackett@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd3aced76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1076, 1, 79, 151, 160, 2, 36, 34, 2, 1, 'x.x.x', '25.00', '25.00', NULL, '23.00', '109.00', 'Matematika', 'graded', 'Uvern88@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd498eb76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1077, 1, 79, 151, 161, 2, 36, 34, 2, 1, 'x.x.x', '44.00', '25.00', NULL, '36.00', '123.00', 'Matematika', 'graded', 'Ugail33@herzog.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd5388776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1078, 1, 79, 151, 162, 2, 36, 34, 2, 1, 'x.x.x', '17.00', '25.00', NULL, '35.00', '49.00', 'Matematika', 'graded', 'Uabeahan@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd5c33276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1079, 1, 79, 152, 160, 2, 36, 35, 3, 1, 'x.x.x', '39.00', '25.00', NULL, '20.00', '195.00', 'Kimia', 'graded', 'Uvern88@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd68d4f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1080, 1, 79, 152, 161, 2, 36, 35, 3, 1, 'x.x.x', '46.00', '25.00', NULL, '31.00', '149.00', 'Kimia', 'graded', 'Ugail33@herzog.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd73f7d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1081, 1, 79, 152, 162, 2, 36, 35, 3, 1, 'x.x.x', '28.00', '25.00', NULL, '24.00', '117.00', 'Kimia', 'graded', 'Uabeahan@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd7afd376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1082, 1, 80, 153, 146, 2, 32, 34, 2, 1, 'x.x.x', '34.00', '25.00', NULL, '20.00', '170.00', 'Matematika', 'graded', 'Uwolff.yolanda@von.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd9651176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1083, 1, 80, 153, 147, 2, 32, 34, 2, 1, 'x.x.x', '22.00', '25.00', NULL, '12.00', '184.00', 'Matematika', 'graded', 'Udylan22@nitzsche.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fd9f94d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1084, 1, 80, 153, 148, 2, 32, 34, 2, 1, 'x.x.x', '24.00', '25.00', NULL, '33.00', '73.00', 'Matematika', 'graded', 'Uarvid.pollich@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fda67b376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1085, 1, 80, 153, 149, 2, 32, 34, 2, 1, 'x.x.x', '11.00', '25.00', NULL, '16.00', '69.00', 'Matematika', 'graded', 'Ujulie.nikolaus@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fdaf04d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1086, 1, 80, 153, 163, 2, 32, 34, 2, 1, 'x.x.x', '42.00', '25.00', NULL, '41.00', '103.00', 'Matematika', 'graded', 'U0078294733', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fdb5faf76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1087, 1, 80, 153, 164, 2, 32, 34, 2, 1, 'x.x.x', '37.00', '25.00', NULL, '41.00', '91.00', 'Matematika', 'graded', 'U0063509763', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fdc02ca76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1088, 1, 80, 153, 165, 2, 32, 34, 2, 1, 'x.x.x', '37.00', '25.00', NULL, '20.00', '185.00', 'Matematika', 'graded', 'U0053756117', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fdc756e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1089, 1, 80, 153, 166, 2, 32, 34, 2, 1, 'x.x.x', '11.00', '25.00', NULL, '14.00', '79.00', 'Matematika', 'graded', 'U0065125737', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fdce4d876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1090, 1, 80, 153, 167, 2, 32, 34, 2, 1, 'x.x.x', '47.00', '25.00', NULL, '47.00', '100.00', 'Matematika', 'graded', 'U0065757046', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fdd934c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1091, 1, 80, 153, 168, 2, 32, 34, 2, 1, 'x.x.x', '11.00', '25.00', NULL, '19.00', '58.00', 'Matematika', 'graded', 'U0064848339', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fde05a676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1092, 1, 80, 153, 171, 2, 32, 34, 2, 1, 'x.x.x', '14.00', '25.00', NULL, '28.00', '50.00', 'Matematika', 'graded', 'U0076787140', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fdecdc376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1093, 1, 80, 153, 172, 2, 32, 34, 2, 1, 'x.x.x', '50.00', '25.00', NULL, '27.00', '186.00', 'Matematika', 'graded', 'U0066822084', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fdf446e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1094, 1, 80, 153, 173, 2, 32, 34, 2, 1, 'x.x.x', '29.00', '25.00', NULL, '28.00', '104.00', 'Matematika', 'graded', 'U0067053895', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fdfe2cc76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1095, 1, 80, 153, 174, 2, 32, 34, 2, 1, 'x.x.x', '45.00', '25.00', NULL, '42.00', '108.00', 'Matematika', 'graded', 'U0064788352', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe04ff176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1096, 1, 80, 153, 175, 2, 32, 34, 2, 1, 'x.x.x', '15.00', '25.00', NULL, '34.00', '45.00', 'Matematika', 'graded', 'U0056176047', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe11fe776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1097, 1, 80, 153, 176, 2, 32, 34, 2, 1, 'x.x.x', '32.00', '25.00', NULL, '28.00', '115.00', 'Matematika', 'graded', 'U0066765899', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe1c6b476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1098, 1, 80, 153, 177, 2, 32, 34, 2, 1, 'x.x.x', '25.00', '25.00', NULL, '29.00', '87.00', 'Matematika', 'graded', 'U0064226685', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe2379676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1099, 1, 80, 153, 178, 2, 32, 34, 2, 1, 'x.x.x', '14.00', '25.00', NULL, '21.00', '67.00', 'Matematika', 'graded', 'U0064115981', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe2a44476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1100, 1, 80, 153, 179, 2, 32, 34, 2, 1, 'x.x.x', '37.00', '25.00', NULL, '40.00', '93.00', 'Matematika', 'graded', 'U0067675678', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe3779d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1101, 1, 80, 153, 180, 2, 32, 34, 2, 1, 'x.x.x', '23.00', '25.00', NULL, '42.00', '55.00', 'Matematika', 'graded', 'U0062231412', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe4407a76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1102, 1, 80, 153, 181, 2, 32, 34, 2, 1, 'x.x.x', '43.00', '25.00', NULL, '17.00', '253.00', 'Matematika', 'graded', 'U0068042913', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe4e18c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1103, 1, 80, 153, 182, 2, 32, 34, 2, 1, 'x.x.x', '13.00', '25.00', NULL, '48.00', '28.00', 'Matematika', 'graded', 'U0062475153', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe56a1a76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1104, 1, 80, 153, 183, 2, 32, 34, 2, 1, 'x.x.x', '35.00', '25.00', NULL, '18.00', '195.00', 'Matematika', 'graded', 'U0061728059', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe60efc76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1105, 1, 80, 153, 184, 2, 32, 34, 2, 1, 'x.x.x', '42.00', '25.00', NULL, '30.00', '140.00', 'Matematika', 'graded', 'U0063723566', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe6a48176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1106, 1, 80, 153, 185, 2, 32, 34, 2, 1, 'x.x.x', '35.00', '25.00', NULL, '18.00', '195.00', 'Matematika', 'graded', 'U0066038509', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe719ab76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1107, 1, 80, 153, 186, 2, 32, 34, 2, 1, 'x.x.x', '33.00', '25.00', NULL, '50.00', '66.00', 'Matematika', 'graded', 'U0051515150', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe78ca076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1108, 1, 80, 153, 187, 2, 32, 34, 2, 1, 'x.x.x', '21.00', '25.00', NULL, '46.00', '46.00', 'Matematika', 'graded', 'U0069297662', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe8018476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1109, 1, 80, 153, 188, 2, 32, 34, 2, 1, 'x.x.x', '29.00', '25.00', NULL, '18.00', '162.00', 'Matematika', 'graded', 'U0063784793', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe8ade976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1110, 1, 80, 153, 189, 2, 32, 34, 2, 1, 'x.x.x', '18.00', '25.00', NULL, '14.00', '129.00', 'Matematika', 'graded', 'U0068307640', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe952b576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1111, 1, 80, 153, 190, 2, 32, 34, 2, 1, 'x.x.x', '32.00', '25.00', NULL, '31.00', '104.00', 'Matematika', 'graded', 'U0062599709', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fe9c10f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1112, 1, 80, 153, 191, 2, 32, 34, 2, 1, 'x.x.x', '13.00', '25.00', NULL, '20.00', '65.00', 'Matematika', 'graded', 'U0067129512', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fea6a2776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1113, 1, 80, 153, 192, 2, 32, 34, 2, 1, 'x.x.x', '23.00', '25.00', NULL, '20.00', '115.00', 'Matematika', 'graded', 'U0062471428', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7feafca476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1114, 1, 80, 153, 193, 2, 32, 34, 2, 1, 'x.x.x', '21.00', '25.00', NULL, '24.00', '88.00', 'Matematika', 'graded', 'U0067476158', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7febafb476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1115, 1, 80, 154, 146, 2, 32, 35, 3, 1, 'x.x.x', '11.00', '25.00', NULL, '23.00', '48.00', 'Kimia', 'graded', 'Uwolff.yolanda@von.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fecfcc676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1116, 1, 80, 154, 147, 2, 32, 35, 3, 1, 'x.x.x', '25.00', '25.00', NULL, '36.00', '70.00', 'Kimia', 'graded', 'Udylan22@nitzsche.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fed96ca76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1117, 1, 80, 154, 148, 2, 32, 35, 3, 1, 'x.x.x', '50.00', '25.00', NULL, '43.00', '117.00', 'Kimia', 'graded', 'Uarvid.pollich@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fee413f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1118, 1, 80, 154, 149, 2, 32, 35, 3, 1, 'x.x.x', '39.00', '25.00', NULL, '44.00', '89.00', 'Kimia', 'graded', 'Ujulie.nikolaus@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7feec10076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1119, 1, 80, 154, 163, 2, 32, 35, 3, 1, 'x.x.x', '39.00', '25.00', NULL, '37.00', '106.00', 'Kimia', 'graded', 'U0078294733', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fef384376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1120, 1, 80, 154, 164, 2, 32, 35, 3, 1, 'x.x.x', '50.00', '25.00', NULL, '42.00', '120.00', 'Kimia', 'graded', 'U0063509763', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fefa71376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1121, 1, 80, 154, 165, 2, 32, 35, 3, 1, 'x.x.x', '13.00', '25.00', NULL, '39.00', '34.00', 'Kimia', 'graded', 'U0053756117', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff049f676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1122, 1, 80, 154, 166, 2, 32, 35, 3, 1, 'x.x.x', '18.00', '25.00', NULL, '26.00', '70.00', 'Kimia', 'graded', 'U0065125737', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff0c4dc76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1123, 1, 80, 154, 167, 2, 32, 35, 3, 1, 'x.x.x', '27.00', '25.00', NULL, '10.00', '270.00', 'Kimia', 'graded', 'U0065757046', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff13bfa76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1124, 1, 80, 154, 168, 2, 32, 35, 3, 1, 'x.x.x', '16.00', '25.00', NULL, '38.00', '43.00', 'Kimia', 'graded', 'U0064848339', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff1af9d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1125, 1, 80, 154, 171, 2, 32, 35, 3, 1, 'x.x.x', '22.00', '25.00', NULL, '21.00', '105.00', 'Kimia', 'graded', 'U0076787140', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff2229d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1126, 1, 80, 154, 172, 2, 32, 35, 3, 1, 'x.x.x', '38.00', '25.00', NULL, '30.00', '127.00', 'Kimia', 'graded', 'U0066822084', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff2e37c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1127, 1, 80, 154, 173, 2, 32, 35, 3, 1, 'x.x.x', '30.00', '25.00', NULL, '28.00', '108.00', 'Kimia', 'graded', 'U0067053895', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff368a676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1128, 1, 80, 154, 174, 2, 32, 35, 3, 1, 'x.x.x', '32.00', '25.00', NULL, '30.00', '107.00', 'Kimia', 'graded', 'U0064788352', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff423c376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1129, 1, 80, 154, 175, 2, 32, 35, 3, 1, 'x.x.x', '50.00', '25.00', NULL, '46.00', '109.00', 'Kimia', 'graded', 'U0056176047', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff49fe076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1130, 1, 80, 154, 176, 2, 32, 35, 3, 1, 'x.x.x', '39.00', '25.00', NULL, '43.00', '91.00', 'Kimia', 'graded', 'U0066765899', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff5792f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1131, 1, 80, 154, 177, 2, 32, 35, 3, 1, 'x.x.x', '18.00', '25.00', NULL, '47.00', '39.00', 'Kimia', 'graded', 'U0064226685', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff6399c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1132, 1, 80, 154, 178, 2, 32, 35, 3, 1, 'x.x.x', '43.00', '25.00', NULL, '12.00', '359.00', 'Kimia', 'graded', 'U0064115981', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff6c64c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1133, 1, 80, 154, 179, 2, 32, 35, 3, 1, 'x.x.x', '38.00', '25.00', NULL, '10.00', '380.00', 'Kimia', 'graded', 'U0067675678', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff79b0776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1134, 1, 80, 154, 180, 2, 32, 35, 3, 1, 'x.x.x', '25.00', '25.00', NULL, '12.00', '209.00', 'Kimia', 'graded', 'U0062231412', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff8510a76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1135, 1, 80, 154, 181, 2, 32, 35, 3, 1, 'x.x.x', '37.00', '25.00', NULL, '32.00', '116.00', 'Kimia', 'graded', 'U0068042913', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff8c4bd76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1136, 1, 80, 154, 182, 2, 32, 35, 3, 1, 'x.x.x', '34.00', '25.00', NULL, '13.00', '262.00', 'Kimia', 'graded', 'U0062475153', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff9303876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1137, 1, 80, 154, 183, 2, 32, 35, 3, 1, 'x.x.x', '14.00', '25.00', NULL, '19.00', '74.00', 'Kimia', 'graded', 'U0061728059', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ff9b68a76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1138, 1, 80, 154, 184, 2, 32, 35, 3, 1, 'x.x.x', '25.00', '25.00', NULL, '41.00', '61.00', 'Kimia', 'graded', 'U0063723566', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ffa57bb76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1139, 1, 80, 154, 185, 2, 32, 35, 3, 1, 'x.x.x', '26.00', '25.00', NULL, '48.00', '55.00', 'Kimia', 'graded', 'U0066038509', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ffb0bda76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1140, 1, 80, 154, 186, 2, 32, 35, 3, 1, 'x.x.x', '48.00', '25.00', NULL, '43.00', '112.00', 'Kimia', 'graded', 'U0051515150', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ffb83e176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1141, 1, 80, 154, 187, 2, 32, 35, 3, 1, 'x.x.x', '35.00', '25.00', NULL, '40.00', '88.00', 'Kimia', 'graded', 'U0069297662', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ffc201176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1142, 1, 80, 154, 188, 2, 32, 35, 3, 1, 'x.x.x', '50.00', '25.00', NULL, '26.00', '193.00', 'Kimia', 'graded', 'U0063784793', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ffca44c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1143, 1, 80, 154, 189, 2, 32, 35, 3, 1, 'x.x.x', '37.00', '25.00', NULL, '12.00', '309.00', 'Kimia', 'graded', 'U0068307640', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ffd478976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1144, 1, 80, 154, 190, 2, 32, 35, 3, 1, 'x.x.x', '34.00', '25.00', NULL, '48.00', '71.00', 'Kimia', 'graded', 'U0062599709', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ffdbfb676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1145, 1, 80, 154, 191, 2, 32, 35, 3, 1, 'x.x.x', '33.00', '25.00', NULL, '50.00', '66.00', 'Kimia', 'graded', 'U0067129512', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ffe326976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1146, 1, 80, 154, 192, 2, 32, 35, 3, 1, 'x.x.x', '43.00', '25.00', NULL, '38.00', '114.00', 'Kimia', 'graded', 'U0062471428', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7ffeeba576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1147, 1, 80, 154, 193, 2, 32, 35, 3, 1, 'x.x.x', '15.00', '25.00', NULL, '43.00', '35.00', 'Kimia', 'graded', 'U0067476158', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '7fffa11276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1148, 1, 81, 155, 194, 2, 33, 34, 2, 1, 'x.x.x', '14.00', '25.00', NULL, '15.00', '94.00', 'Matematika', 'graded', 'U123123', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80003e4176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1149, 1, 81, 156, 194, 2, 33, 35, 3, 1, 'x.x.x', '40.00', '25.00', NULL, '46.00', '87.00', 'Kimia', 'graded', 'U123123', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8000eda976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1150, 1, 82, 157, 150, 2, 34, 34, 2, 1, 'x.x.x', '13.00', '25.00', NULL, '48.00', '28.00', 'Matematika', 'graded', 'Urobert46@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8001afc276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1151, 1, 82, 157, 151, 2, 34, 34, 2, 1, 'x.x.x', '11.00', '25.00', NULL, '14.00', '79.00', 'Matematika', 'graded', 'Umaddison46@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8002652d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1152, 1, 82, 157, 152, 2, 34, 34, 2, 1, 'x.x.x', '27.00', '25.00', NULL, '49.00', '56.00', 'Matematika', 'graded', 'Udicki.mariana@gorczany.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800300e776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1153, 1, 82, 157, 153, 2, 34, 34, 2, 1, 'x.x.x', '17.00', '25.00', NULL, '25.00', '68.00', 'Matematika', 'graded', 'Ugracie.langosh@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80038a0f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1154, 1, 82, 157, 154, 2, 34, 34, 2, 1, 'x.x.x', '34.00', '25.00', NULL, '49.00', '70.00', 'Matematika', 'graded', 'Udella18@robel.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8003fefd76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1155, 1, 82, 158, 150, 2, 34, 35, 3, 1, 'x.x.x', '37.00', '25.00', NULL, '50.00', '74.00', 'Kimia', 'graded', 'Urobert46@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80059b0b76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1156, 1, 82, 158, 151, 2, 34, 35, 3, 1, 'x.x.x', '21.00', '25.00', NULL, '23.00', '92.00', 'Kimia', 'graded', 'Umaddison46@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80060d7e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1157, 1, 82, 158, 152, 2, 34, 35, 3, 1, 'x.x.x', '29.00', '25.00', NULL, '38.00', '77.00', 'Kimia', 'graded', 'Udicki.mariana@gorczany.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8006988376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1158, 1, 82, 158, 153, 2, 34, 35, 3, 1, 'x.x.x', '34.00', '25.00', NULL, '39.00', '88.00', 'Kimia', 'graded', 'Ugracie.langosh@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8007592576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1159, 1, 82, 158, 154, 2, 34, 35, 3, 1, 'x.x.x', '17.00', '25.00', NULL, '21.00', '81.00', 'Kimia', 'graded', 'Udella18@robel.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8007ffb076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1160, 1, 83, 159, 155, 2, 35, 34, 3, 1, 'x.x.x', '49.00', '25.00', NULL, '10.00', '491.00', 'Matematika', 'graded', 'Ugkerluke@ryan.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8008a47c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1161, 1, 83, 159, 156, 2, 35, 34, 3, 1, 'x.x.x', '22.00', '25.00', NULL, '46.00', '48.00', 'Matematika', 'graded', 'Ujacobs.carter@streich.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8009549076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1162, 1, 83, 159, 157, 2, 35, 34, 3, 1, 'x.x.x', '31.00', '25.00', NULL, '15.00', '207.00', 'Matematika', 'graded', 'Uqmosciski@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800a261c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1163, 1, 83, 159, 158, 2, 35, 34, 3, 1, 'x.x.x', '49.00', '25.00', NULL, '19.00', '258.00', 'Matematika', 'graded', 'Ulura.donnelly@rosenbaum.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800aeff476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1164, 1, 83, 159, 159, 2, 35, 34, 3, 1, 'x.x.x', '21.00', '25.00', NULL, '37.00', '57.00', 'Matematika', 'graded', 'Usonia.hackett@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800b98e076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1165, 1, 83, 160, 155, 2, 35, 35, 3, 1, 'x.x.x', '32.00', '25.00', NULL, '34.00', '95.00', 'Kimia', 'graded', 'Ugkerluke@ryan.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800ca4de76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1166, 1, 83, 160, 156, 2, 35, 35, 3, 1, 'x.x.x', '36.00', '25.00', NULL, '44.00', '82.00', 'Kimia', 'graded', 'Ujacobs.carter@streich.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800d1d4976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1167, 1, 83, 160, 157, 2, 35, 35, 3, 1, 'x.x.x', '21.00', '25.00', NULL, '35.00', '60.00', 'Kimia', 'graded', 'Uqmosciski@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800d945576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1168, 1, 83, 160, 158, 2, 35, 35, 3, 1, 'x.x.x', '28.00', '25.00', NULL, '33.00', '85.00', 'Kimia', 'graded', 'Ulura.donnelly@rosenbaum.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800e07d576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1169, 1, 83, 160, 159, 2, 35, 35, 3, 1, 'x.x.x', '20.00', '25.00', NULL, '45.00', '45.00', 'Kimia', 'graded', 'Usonia.hackett@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800ea9ea76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1170, 1, 84, 161, 160, 2, 36, 34, 3, 1, 'x.x.x', '45.00', '25.00', NULL, '24.00', '188.00', 'Matematika', 'graded', 'Uvern88@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800f76bd76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1171, 1, 84, 161, 161, 2, 36, 34, 3, 1, 'x.x.x', '45.00', '25.00', NULL, '44.00', '103.00', 'Matematika', 'graded', 'Ugail33@herzog.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '800ff2f676a611efb428c858c0b7f92f');
INSERT INTO `tx_assessment` (`id`, `office_id`, `schedule_id`, `schedule_detail_id`, `participant_id`, `period_id`, `group_id`, `subject_id`, `question_type`, `exam_type`, `app_version`, `earned_points`, `passing_score`, `passing_score_percent`, `gained_score`, `evaluate_score`, `quiz_title`, `quiz_type`, `username`, `time_limit`, `used_time`, `time_spent`, `submission_status`, `token`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1172, 1, 84, 161, 162, 2, 36, 34, 3, 1, 'x.x.x', '24.00', '25.00', NULL, '26.00', '93.00', 'Matematika', 'graded', 'Uabeahan@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8010825676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1173, 1, 84, 162, 160, 2, 36, 35, 1, 1, 'x.x.x', '38.00', '25.00', NULL, '43.00', '89.00', 'Kimia', 'graded', 'Uvern88@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801173f776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1174, 1, 84, 162, 161, 2, 36, 35, 1, 1, 'x.x.x', '48.00', '25.00', NULL, '13.00', '370.00', 'Kimia', 'graded', 'Ugail33@herzog.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8011f26876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1175, 1, 84, 162, 162, 2, 36, 35, 1, 1, 'x.x.x', '44.00', '25.00', NULL, '15.00', '294.00', 'Kimia', 'graded', 'Uabeahan@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8012720776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1176, 1, 85, 163, 146, 2, 32, 34, 3, 1, 'x.x.x', '23.00', '25.00', NULL, '32.00', '72.00', 'Matematika', 'graded', 'Uwolff.yolanda@von.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8013c66976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1177, 1, 85, 163, 147, 2, 32, 34, 3, 1, 'x.x.x', '33.00', '25.00', NULL, '44.00', '75.00', 'Matematika', 'graded', 'Udylan22@nitzsche.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80144e3f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1178, 1, 85, 163, 148, 2, 32, 34, 3, 1, 'x.x.x', '24.00', '25.00', NULL, '31.00', '78.00', 'Matematika', 'graded', 'Uarvid.pollich@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8014c52076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1179, 1, 85, 163, 149, 2, 32, 34, 3, 1, 'x.x.x', '20.00', '25.00', NULL, '17.00', '118.00', 'Matematika', 'graded', 'Ujulie.nikolaus@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801555a576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1180, 1, 85, 163, 163, 2, 32, 34, 3, 1, 'x.x.x', '19.00', '25.00', NULL, '31.00', '62.00', 'Matematika', 'graded', 'U0078294733', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8015c3a076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1181, 1, 85, 163, 164, 2, 32, 34, 3, 1, 'x.x.x', '14.00', '25.00', NULL, '27.00', '52.00', 'Matematika', 'graded', 'U0063509763', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8016747b76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1182, 1, 85, 163, 165, 2, 32, 34, 3, 1, 'x.x.x', '38.00', '25.00', NULL, '40.00', '95.00', 'Matematika', 'graded', 'U0053756117', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8016e83676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1183, 1, 85, 163, 166, 2, 32, 34, 3, 1, 'x.x.x', '21.00', '25.00', NULL, '31.00', '68.00', 'Matematika', 'graded', 'U0065125737', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801753bc76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1184, 1, 85, 163, 167, 2, 32, 34, 3, 1, 'x.x.x', '50.00', '25.00', NULL, '45.00', '112.00', 'Matematika', 'graded', 'U0065757046', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8017c08f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1185, 1, 85, 163, 168, 2, 32, 34, 3, 1, 'x.x.x', '11.00', '25.00', NULL, '30.00', '37.00', 'Matematika', 'graded', 'U0064848339', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8018631376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1186, 1, 85, 163, 171, 2, 32, 34, 3, 1, 'x.x.x', '16.00', '25.00', NULL, '16.00', '100.00', 'Matematika', 'graded', 'U0076787140', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8019153476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1187, 1, 85, 163, 172, 2, 32, 34, 3, 1, 'x.x.x', '29.00', '25.00', NULL, '50.00', '58.00', 'Matematika', 'graded', 'U0066822084', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80198b9b76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1188, 1, 85, 163, 173, 2, 32, 34, 3, 1, 'x.x.x', '28.00', '25.00', NULL, '10.00', '280.00', 'Matematika', 'graded', 'U0067053895', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8019f8b776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1189, 1, 85, 163, 174, 2, 32, 34, 3, 1, 'x.x.x', '44.00', '25.00', NULL, '39.00', '113.00', 'Matematika', 'graded', 'U0064788352', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801a64d676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1190, 1, 85, 163, 175, 2, 32, 34, 3, 1, 'x.x.x', '50.00', '25.00', NULL, '19.00', '264.00', 'Matematika', 'graded', 'U0056176047', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801ae31d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1191, 1, 85, 163, 176, 2, 32, 34, 3, 1, 'x.x.x', '45.00', '25.00', NULL, '44.00', '103.00', 'Matematika', 'graded', 'U0066765899', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801b9bb376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1192, 1, 85, 163, 177, 2, 32, 34, 3, 1, 'x.x.x', '40.00', '25.00', NULL, '27.00', '149.00', 'Matematika', 'graded', 'U0064226685', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801c148876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1193, 1, 85, 163, 178, 2, 32, 34, 3, 1, 'x.x.x', '12.00', '25.00', NULL, '19.00', '64.00', 'Matematika', 'graded', 'U0064115981', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801ca32376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1194, 1, 85, 163, 179, 2, 32, 34, 3, 1, 'x.x.x', '43.00', '25.00', NULL, '46.00', '94.00', 'Matematika', 'graded', 'U0067675678', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801d14a376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1195, 1, 85, 163, 180, 2, 32, 34, 3, 1, 'x.x.x', '49.00', '25.00', NULL, '40.00', '123.00', 'Matematika', 'graded', 'U0062231412', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801d81d076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1196, 1, 85, 163, 181, 2, 32, 34, 3, 1, 'x.x.x', '16.00', '25.00', NULL, '21.00', '77.00', 'Matematika', 'graded', 'U0068042913', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801e425476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1197, 1, 85, 163, 182, 2, 32, 34, 3, 1, 'x.x.x', '12.00', '25.00', NULL, '21.00', '58.00', 'Matematika', 'graded', 'U0062475153', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801eb38976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1198, 1, 85, 163, 183, 2, 32, 34, 3, 1, 'x.x.x', '50.00', '25.00', NULL, '31.00', '162.00', 'Matematika', 'graded', 'U0061728059', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801f523476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1199, 1, 85, 163, 184, 2, 32, 34, 3, 1, 'x.x.x', '23.00', '25.00', NULL, '23.00', '100.00', 'Matematika', 'graded', 'U0063723566', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '801fc18d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1200, 1, 85, 163, 185, 2, 32, 34, 3, 1, 'x.x.x', '32.00', '25.00', NULL, '22.00', '146.00', 'Matematika', 'graded', 'U0066038509', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80205a8e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1201, 1, 85, 163, 186, 2, 32, 34, 3, 1, 'x.x.x', '36.00', '25.00', NULL, '22.00', '164.00', 'Matematika', 'graded', 'U0051515150', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8020efdd76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1202, 1, 85, 163, 187, 2, 32, 34, 3, 1, 'x.x.x', '11.00', '25.00', NULL, '25.00', '44.00', 'Matematika', 'graded', 'U0069297662', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802172c276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1203, 1, 85, 163, 188, 2, 32, 34, 3, 1, 'x.x.x', '41.00', '25.00', NULL, '37.00', '111.00', 'Matematika', 'graded', 'U0063784793', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8022041476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1204, 1, 85, 163, 189, 2, 32, 34, 3, 1, 'x.x.x', '42.00', '25.00', NULL, '42.00', '100.00', 'Matematika', 'graded', 'U0068307640', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8022765076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1205, 1, 85, 163, 190, 2, 32, 34, 3, 1, 'x.x.x', '28.00', '25.00', NULL, '49.00', '58.00', 'Matematika', 'graded', 'U0062599709', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802332f876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1206, 1, 85, 163, 191, 2, 32, 34, 3, 1, 'x.x.x', '31.00', '25.00', NULL, '27.00', '115.00', 'Matematika', 'graded', 'U0067129512', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8023ce6176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1207, 1, 85, 163, 192, 2, 32, 34, 3, 1, 'x.x.x', '16.00', '25.00', NULL, '36.00', '45.00', 'Matematika', 'graded', 'U0062471428', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802449e576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1208, 1, 85, 163, 193, 2, 32, 34, 3, 1, 'x.x.x', '17.00', '25.00', NULL, '46.00', '37.00', 'Matematika', 'graded', 'U0067476158', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8024d5f476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1209, 1, 85, 164, 146, 2, 32, 35, 3, 1, 'x.x.x', '27.00', '25.00', NULL, '39.00', '70.00', 'Kimia', 'graded', 'Uwolff.yolanda@von.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80264cfd76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1210, 1, 85, 164, 147, 2, 32, 35, 3, 1, 'x.x.x', '36.00', '25.00', NULL, '40.00', '90.00', 'Kimia', 'graded', 'Udylan22@nitzsche.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8026c23c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1211, 1, 85, 164, 148, 2, 32, 35, 3, 1, 'x.x.x', '41.00', '25.00', NULL, '43.00', '96.00', 'Kimia', 'graded', 'Uarvid.pollich@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80274b2b76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1212, 1, 85, 164, 149, 2, 32, 35, 3, 1, 'x.x.x', '47.00', '25.00', NULL, '16.00', '294.00', 'Kimia', 'graded', 'Ujulie.nikolaus@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8027dc6c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1213, 1, 85, 164, 163, 2, 32, 35, 3, 1, 'x.x.x', '16.00', '25.00', NULL, '44.00', '37.00', 'Kimia', 'graded', 'U0078294733', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802876ca76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1214, 1, 85, 164, 164, 2, 32, 35, 3, 1, 'x.x.x', '29.00', '25.00', NULL, '37.00', '79.00', 'Kimia', 'graded', 'U0063509763', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8028e98476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1215, 1, 85, 164, 165, 2, 32, 35, 3, 1, 'x.x.x', '32.00', '25.00', NULL, '36.00', '89.00', 'Kimia', 'graded', 'U0053756117', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8029584c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1216, 1, 85, 164, 166, 2, 32, 35, 3, 1, 'x.x.x', '26.00', '25.00', NULL, '36.00', '73.00', 'Kimia', 'graded', 'U0065125737', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8029f7b476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1217, 1, 85, 164, 167, 2, 32, 35, 3, 1, 'x.x.x', '44.00', '25.00', NULL, '45.00', '98.00', 'Kimia', 'graded', 'U0065757046', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802a89bb76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1218, 1, 85, 164, 168, 2, 32, 35, 3, 1, 'x.x.x', '21.00', '25.00', NULL, '27.00', '78.00', 'Kimia', 'graded', 'U0064848339', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802b2f9d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1219, 1, 85, 164, 171, 2, 32, 35, 3, 1, 'x.x.x', '49.00', '25.00', NULL, '42.00', '117.00', 'Kimia', 'graded', 'U0076787140', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802b98d976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1220, 1, 85, 164, 172, 2, 32, 35, 3, 1, 'x.x.x', '23.00', '25.00', NULL, '37.00', '63.00', 'Kimia', 'graded', 'U0066822084', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802c1db576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1221, 1, 85, 164, 173, 2, 32, 35, 3, 1, 'x.x.x', '46.00', '25.00', NULL, '32.00', '144.00', 'Kimia', 'graded', 'U0067053895', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802ca09e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1222, 1, 85, 164, 174, 2, 32, 35, 3, 1, 'x.x.x', '17.00', '25.00', NULL, '43.00', '40.00', 'Kimia', 'graded', 'U0064788352', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802d623576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1223, 1, 85, 164, 175, 2, 32, 35, 3, 1, 'x.x.x', '19.00', '25.00', NULL, '32.00', '60.00', 'Kimia', 'graded', 'U0056176047', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802dee7076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1224, 1, 85, 164, 176, 2, 32, 35, 3, 1, 'x.x.x', '49.00', '25.00', NULL, '20.00', '246.00', 'Kimia', 'graded', 'U0066765899', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802e7d1076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1225, 1, 85, 164, 177, 2, 32, 35, 3, 1, 'x.x.x', '19.00', '25.00', NULL, '28.00', '68.00', 'Kimia', 'graded', 'U0064226685', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '802ee4af76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1226, 1, 85, 164, 178, 2, 32, 35, 3, 1, 'x.x.x', '40.00', '25.00', NULL, '38.00', '106.00', 'Kimia', 'graded', 'U0064115981', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803045d876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1227, 1, 85, 164, 179, 2, 32, 35, 3, 1, 'x.x.x', '31.00', '25.00', NULL, '43.00', '73.00', 'Kimia', 'graded', 'U0067675678', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8030da5b76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1228, 1, 85, 164, 180, 2, 32, 35, 3, 1, 'x.x.x', '15.00', '25.00', NULL, '27.00', '56.00', 'Kimia', 'graded', 'U0062231412', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8031676576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1229, 1, 85, 164, 181, 2, 32, 35, 3, 1, 'x.x.x', '42.00', '25.00', NULL, '26.00', '162.00', 'Kimia', 'graded', 'U0068042913', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803214a376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1230, 1, 85, 164, 182, 2, 32, 35, 3, 1, 'x.x.x', '42.00', '25.00', NULL, '23.00', '183.00', 'Kimia', 'graded', 'U0062475153', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8032a80176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1231, 1, 85, 164, 183, 2, 32, 35, 3, 1, 'x.x.x', '50.00', '25.00', NULL, '14.00', '358.00', 'Kimia', 'graded', 'U0061728059', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8033274c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1232, 1, 85, 164, 184, 2, 32, 35, 3, 1, 'x.x.x', '40.00', '25.00', NULL, '32.00', '125.00', 'Kimia', 'graded', 'U0063723566', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80339f2276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1233, 1, 85, 164, 185, 2, 32, 35, 3, 1, 'x.x.x', '43.00', '25.00', NULL, '20.00', '215.00', 'Kimia', 'graded', 'U0066038509', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '80341c0276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1234, 1, 85, 164, 186, 2, 32, 35, 3, 1, 'x.x.x', '38.00', '25.00', NULL, '16.00', '238.00', 'Kimia', 'graded', 'U0051515150', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8034e99e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1235, 1, 85, 164, 187, 2, 32, 35, 3, 1, 'x.x.x', '18.00', '25.00', NULL, '34.00', '53.00', 'Kimia', 'graded', 'U0069297662', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803565d476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1236, 1, 85, 164, 188, 2, 32, 35, 3, 1, 'x.x.x', '22.00', '25.00', NULL, '27.00', '82.00', 'Kimia', 'graded', 'U0063784793', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8036076976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1237, 1, 85, 164, 189, 2, 32, 35, 3, 1, 'x.x.x', '41.00', '25.00', NULL, '32.00', '129.00', 'Kimia', 'graded', 'U0068307640', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8036763176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1238, 1, 85, 164, 190, 2, 32, 35, 3, 1, 'x.x.x', '44.00', '25.00', NULL, '43.00', '103.00', 'Kimia', 'graded', 'U0062599709', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803730ec76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1239, 1, 85, 164, 191, 2, 32, 35, 3, 1, 'x.x.x', '41.00', '25.00', NULL, '11.00', '373.00', 'Kimia', 'graded', 'U0067129512', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8037aa4276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1240, 1, 85, 164, 192, 2, 32, 35, 3, 1, 'x.x.x', '46.00', '25.00', NULL, '14.00', '329.00', 'Kimia', 'graded', 'U0062471428', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803849f876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1241, 1, 85, 164, 193, 2, 32, 35, 3, 1, 'x.x.x', '16.00', '25.00', NULL, '32.00', '50.00', 'Kimia', 'graded', 'U0067476158', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8038c1bf76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1242, 1, 86, 165, 194, 2, 33, 34, 1, 1, 'x.x.x', '25.00', '25.00', NULL, '10.00', '250.00', 'Matematika', 'graded', 'U123123', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '8039778d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1243, 1, 86, 166, 194, 2, 33, 35, 1, 1, 'x.x.x', '16.00', '25.00', NULL, '10.00', '160.00', 'Kimia', 'graded', 'U123123', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803a71ec76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1244, 1, 87, 167, 150, 2, 34, 34, 3, 1, 'x.x.x', '26.00', '25.00', NULL, '34.00', '77.00', 'Matematika', 'graded', 'Urobert46@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803b22c776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1245, 1, 87, 167, 151, 2, 34, 34, 3, 1, 'x.x.x', '50.00', '25.00', NULL, '28.00', '179.00', 'Matematika', 'graded', 'Umaddison46@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803bbddd76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1246, 1, 87, 167, 152, 2, 34, 34, 3, 1, 'x.x.x', '32.00', '25.00', NULL, '38.00', '85.00', 'Matematika', 'graded', 'Udicki.mariana@gorczany.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803c62dc76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1247, 1, 87, 167, 153, 2, 34, 34, 3, 1, 'x.x.x', '16.00', '25.00', NULL, '20.00', '80.00', 'Matematika', 'graded', 'Ugracie.langosh@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803d02c676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1248, 1, 87, 167, 154, 2, 34, 34, 3, 1, 'x.x.x', '35.00', '25.00', NULL, '26.00', '135.00', 'Matematika', 'graded', 'Udella18@robel.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803d727d76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1249, 1, 87, 168, 150, 2, 34, 35, 2, 1, 'x.x.x', '30.00', '25.00', NULL, '19.00', '158.00', 'Kimia', 'graded', 'Urobert46@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:55', '2024-09-19 23:44:55', 1, 1, NULL, NULL, NULL, 1, '803e381276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1250, 1, 87, 168, 151, 2, 34, 35, 2, 1, 'x.x.x', '50.00', '25.00', NULL, '28.00', '179.00', 'Kimia', 'graded', 'Umaddison46@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '803ec4fe76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1251, 1, 87, 168, 152, 2, 34, 35, 2, 1, 'x.x.x', '43.00', '25.00', NULL, '48.00', '90.00', 'Kimia', 'graded', 'Udicki.mariana@gorczany.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '803f599876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1252, 1, 87, 168, 153, 2, 34, 35, 2, 1, 'x.x.x', '18.00', '25.00', NULL, '20.00', '90.00', 'Kimia', 'graded', 'Ugracie.langosh@hotmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '803fc95576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1253, 1, 87, 168, 154, 2, 34, 35, 2, 1, 'x.x.x', '25.00', '25.00', NULL, '32.00', '79.00', 'Kimia', 'graded', 'Udella18@robel.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '8040564776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1254, 1, 88, 169, 155, 2, 35, 34, 1, 1, 'x.x.x', '10.00', '25.00', NULL, '15.00', '67.00', 'Matematika', 'graded', 'Ugkerluke@ryan.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '804107fd76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1255, 1, 88, 169, 156, 2, 35, 34, 1, 1, 'x.x.x', '12.00', '25.00', NULL, '17.00', '71.00', 'Matematika', 'graded', 'Ujacobs.carter@streich.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '8041d15c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1256, 1, 88, 169, 157, 2, 35, 34, 1, 1, 'x.x.x', '45.00', '25.00', NULL, '12.00', '375.00', 'Matematika', 'graded', 'Uqmosciski@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '8042600476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1257, 1, 88, 169, 158, 2, 35, 34, 1, 1, 'x.x.x', '48.00', '25.00', NULL, '32.00', '150.00', 'Matematika', 'graded', 'Ulura.donnelly@rosenbaum.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '8042fdc576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1258, 1, 88, 169, 159, 2, 35, 34, 1, 1, 'x.x.x', '44.00', '25.00', NULL, '26.00', '170.00', 'Matematika', 'graded', 'Usonia.hackett@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '8043728b76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1259, 1, 88, 170, 155, 2, 35, 35, 2, 1, 'x.x.x', '34.00', '25.00', NULL, '25.00', '136.00', 'Kimia', 'graded', 'Ugkerluke@ryan.info', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '804474e576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1260, 1, 88, 170, 156, 2, 35, 35, 2, 1, 'x.x.x', '29.00', '25.00', NULL, '20.00', '145.00', 'Kimia', 'graded', 'Ujacobs.carter@streich.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '8045127c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1261, 1, 88, 170, 157, 2, 35, 35, 2, 1, 'x.x.x', '32.00', '25.00', NULL, '37.00', '87.00', 'Kimia', 'graded', 'Uqmosciski@gmail.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '804584c576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1262, 1, 88, 170, 158, 2, 35, 35, 2, 1, 'x.x.x', '41.00', '25.00', NULL, '11.00', '373.00', 'Kimia', 'graded', 'Ulura.donnelly@rosenbaum.biz', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '804603c476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1263, 1, 88, 170, 159, 2, 35, 35, 2, 1, 'x.x.x', '35.00', '25.00', NULL, '40.00', '88.00', 'Kimia', 'graded', 'Usonia.hackett@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '8046b06c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1264, 1, 89, 171, 160, 2, 36, 34, 2, 1, 'x.x.x', '22.00', '25.00', NULL, '17.00', '130.00', 'Matematika', 'graded', 'Uvern88@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '804760b076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1265, 1, 89, 171, 161, 2, 36, 34, 2, 1, 'x.x.x', '41.00', '25.00', NULL, '35.00', '118.00', 'Matematika', 'graded', 'Ugail33@herzog.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '8047ced376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1266, 1, 89, 171, 162, 2, 36, 34, 2, 1, 'x.x.x', '47.00', '25.00', NULL, '22.00', '214.00', 'Matematika', 'graded', 'Uabeahan@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '80483d0676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1267, 1, 89, 172, 160, 2, 36, 35, 3, 1, 'x.x.x', '50.00', '25.00', NULL, '42.00', '120.00', 'Kimia', 'graded', 'Uvern88@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '8048efd376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1268, 1, 89, 172, 161, 2, 36, 35, 3, 1, 'x.x.x', '49.00', '25.00', NULL, '13.00', '377.00', 'Kimia', 'graded', 'Ugail33@herzog.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '804963ea76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (1269, 1, 89, 172, 162, 2, 36, 35, 3, 1, 'x.x.x', '44.00', '25.00', NULL, '38.00', '116.00', 'Kimia', 'graded', 'Uabeahan@yahoo.com', NULL, NULL, NULL, 2, NULL, '2024-09-19 23:44:56', '2024-09-19 23:44:56', 1, 1, NULL, NULL, NULL, 1, '8049d2f476a611efb428c858c0b7f92f');

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
    (4, 1, 'SCD', 86, '2024-09-08 21:07:50', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 85, 'b9f896246deb11efa9f1c858c0b7f92f');

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
                                                                                                                                                                                                                    (1, 2, 'Logo 1', '<p><img style=\"width: 103px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGcAAAAnCAYAAAASGVaVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3YTJkN2YzYS0xNGQxLTQyODQtYmYwZC00MGUxZTJkMjNjOGYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODcxNjQ4RjBEMDI5MTFFNjhFOUZCNTlCN0ZERTdEREIiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODcxNjQ4RUZEMDI5MTFFNjhFOUZCNTlCN0ZERTdEREIiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3YTJkN2YzYS0xNGQxLTQyODQtYmYwZC00MGUxZTJkMjNjOGYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6N2EyZDdmM2EtMTRkMS00Mjg0LWJmMGQtNDBlMWUyZDIzYzhmIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+B69CrgAABgxJREFUeNrsW3tQVFUYv/uARRBw1+K1DBMLFQwk5iL4AJJiKzOH0VxyQmdwqKX0j8pplElrxgabxek5pcmmIzUV2ZqOQ/YAiiQjs10GjKlEWURYeQi78l4i2fbbcfHcu3f3XgTu3XXvN8MM59x7OOee3/l+5/d958Ar0S23YnNoKeL1+rjQpfrY0CXHAoTB1RhntI031+Cgtiys4HR2dOGzfJ7gEjf1HgYOmEQUaypM/DjXXxB4ho0PHhwaUu57f/9X8PvaxxXa9FR5Ht22VqtVfLW7R1VV+7Oq1XBZhj6DvxUtleqlkRGlXguOA6CipE/TmfYgmNzX9paa0LoXCguK6UzomMWSs/et99zScnbGippHVmUpZmu8fDZWr2m8TVLbefgQ0/1axsflt9NucnJSRgUM2FL5g5rZHK+QLT4921v+UEZk/sMiYdBPTPUZIBLpnev8zVTt2tqvqIh1O17clhcSHKx1lI1d3TvRstd6ztRHDzZsYHSD5fHMMKnoPrFQIqFc7XW/nVWi5S35G0uJQMzmXsO654A19n2jSJBkMtonTGrJ7mLedNoQN/+oyIgaJsbKqud0DDfEeLqchf2Grb5ZBedf64g/F83MEq0tFMVizyd/jqs72JyP9Y+3uW23+b6DWEzwolscbizHfukmp/rdJWormcyFFdzV06skxhgSsdj89Prc0sjwMC2fzzdQfQP698F2vfKSYl5AQA2Zx0B/R4+f3El8RqbcgCpPVJ7S6Zv+nFKE8pQH9OvWrkmlM7fv7C8zmcxmsaNs+yaN0JNXTqfRKLeBY1dCHx0uV5PKctsH3XymphuzUFm/yaR694CmbLrtslYu19jAmWoHQOWuWS2jWjQQQ6HAgMXLYrV8Twbnale3rLXtstoVMESD92Bi2RqvzYu14MloHXgfVbtLhjbcO3GyewzgzR7tObDyHDQB0feKZWmlKAWRedQnFVr19m1FMwoGQV7baErjoLfX39zXSocKQaorsrO0NiqcWiBAw1ue2ejWm6tr63DgPJq9SsO6IKBrwL+QFiFOCFDYy1tVRUSag/wZW2NNuDdeQ5ThExMTLjMTMFYipcH+6RXgAE0kJyYUu1vlRCoZGh5hTf76+fnpQQigdVc6jS4XS3tHZw5aBoZw7FEeD87K9NQaoAt376QkJeImw2KxiNkcMwgDtHzy2x9I90FIxBIpbfGiZK1HxDl0DNLwVO+Ehd2NU0OjY2Nilr0dJwxcUe3Q8DBOpUEbaOs14ATPDzJgXmYOYYDW/X2hxQkcYh20QVnC48GxcbgZ80IjCoNff9flAI2hlAZ1xNjGY9I3d7IRhQHQl+1HiZRxKs0R2zAOTqh/uE8CRBQGjeeblUjgmUMW2zAOToBgvk+CQxQGtWfq7dQGP5XfVyvJYhscOAv8ogdmNvGhbp9LAxdjImGQT4JDJgzgggioNFexDQ6c8MBEI93ORv+77lQnC0lz24bq+Z1uRGEAyVyiSkNjGxw4yZKc03Q7GrthxnpG8ADfvyDLrddkSQs4YYAIA0jm/tVyUe4qtsGBExuy5Nh0OrtwvQ5XDg+S2c9rAAiHzROIscwIFVaQeICTbQRhAIlc9DyKGNugJoTbL3ATE27D0OlId02Lpdy1GgsV3VJgcJDmCoiB8R6sqe87n/agm8JATUxwksU2TmoNrsjSFQZAbScMe+yTTmVAgRUXt2OGwXM+7TngGblPPOYklcliGydw4Oblc0nlT8JNTDqdGUcbsQ+b19mPm1vM9U7Pz/dVYVXtH2CH/tlkP8KG933dYqKlTh5CFtvgQLVp7qnCpPVG/I8dZUfOXfssg6lB75LX83wBHDjT2VP6tg6te+PVHXHujrBxJ6HgQYqYrZmZUZsVbQMNG1oH/pA3mY/LMc5mbL19/bRiG5eew9nc2ZEvvmxFVRqc4FLdNuUSnwwYnOUQr3O5im04cBg0yKN9XXkKdwkF7tlRne5y4DDgMeUVR3Wo14B8jooIp3U7SMhN4ewZ1T9YAZ1tUj6VR8drOHAYNPAYAAZybXTbcODMogkFAiePgKRnWqpcezvXhP8XYAA+X5r2Quf1LQAAAABJRU5ErkJggg==\" data-filename=\"logo-1.png\"><br></p>', NULL, 'Logo 1 - Bagian Atas Kiri', '2018-01-08 21:47:15', '2024-08-18 15:55:56', 1, 1, NULL, NULL, NULL, 0, ''),
                                                                                                                                                                                                                    (2, 2, 'Logo 2', '<p><img style=\"width: 200px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAAAnCAYAAABKSgfJAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDE0IDc5LjE1Njc5NywgMjAxNC8wOC8yMC0wOTo1MzowMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MERFMUI5RERGNTlGMTFFNDk4QTZDQjA2OEIzQTJBRUUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MERFMUI5REVGNTlGMTFFNDk4QTZDQjA2OEIzQTJBRUUiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowREUxQjlEQkY1OUYxMUU0OThBNkNCMDY4QjNBMkFFRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowREUxQjlEQ0Y1OUYxMUU0OThBNkNCMDY4QjNBMkFFRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoaoddcAAA6SSURBVHja7F0JdBbVFb5JIBAiEcMaCy1bVURFakVFLKFE0OKCtFb0eHpciz3HaoWqLSINi1GoG1irp9goboCFIkUBWWSJLKaFuFXBhU2WioFASEC2TO/l/8ZcXt4s/58fCMe553wn88/c9+a9N+/d9c0kxXGcu4joFMY3FFFEEbnUkFGWwgskGoqIIvKg1GgIIoooWiARRZQQ1YuG4ASh7duJhg0jmj6dqFmzI89fcw3RqFFETZvWLLdiBdGDDxJ98glRkyY1r+/YQdSzJ9HgwUQLFxI9+yxRRgZRSkr8bTxwgCg9nWjkSKLVq4meeoooO7sm39dfE/XuTTR2LFHr1rFze/YQPf440fPPE1VVxco98ADRgAHV5ebPJ8rPJ9q4kSgr68g69++P3XvIEKKbbqpu/6pVRHPnEhUW8mzn6Z5q6ISyMqKLLiK6/XaiLVuI8vKI2rSpvi4+SIQ6jNJScnjyOg0bkniLnpDrwscP/HC5oiJy+vb1L3O8kZZGDk9456WXyGnRws7Towc5LBScK64IX+9ZZ5EzdSo5N98cf5tYiDjDh5NTXn54HCMnvS7TiBFEjzxC9E0cAca2bYk6dyZasCC+chEdSSefTMQLJVogdZXWriXq0CEahzrgg4hBew+DDU/aZ1zPZGxlPAINpInFFN3J2GmptzGDjV56mnEG6t+Ba2IcSt7l74xin7axYUg3MCqNe0t5MUBnM2Yychj3igXMqDLqaMRgw5LGMJozhoq1auELO1ZSbjja8wDaYYpp6ds7jJeN879iXKzGQY/xOsZ4xqGANnRj/FqseBVkkTaw40Dv+5T7KUOM+QqPsWTHhuYx2jN+Jx6B5XmHIRnvzYyx+C3j3QrP0KV0PKtxmFuaxEm6myFOADtP9JzlHlcyLmfsMs6Ls8NOFE22lElj9GNcyuiEPh/C3F3DeAvzqSaxBjnb8afNjFSLfTwgoNyH4PuZx/VVAfb3/QH1TwHfuQF8/wPfaU5yKJPRjLHfh+dNS3/+5cO/FvVW83/xhc1GHuTII6uJJQG2dYFHORd/A1+vAL4w+Ap1pTO+9uG7wNLOy9R1KZtp4XnOp85pFv5+jI0h2r2BcatZPi0/P38vJNFuRlNoEqEvGYsZ0xhFlrW1H9JgB6R4fZz/grGIMZHxHuMgJEuZwZcDCbbIQxrtRFtE6rVWIekSxtuMF3Cv/ahT2tGSYhlQofUS92BMgjQ6BC1QBqnWAHzljG2QmhUGduN6fdVu0Ypf4b7SpnaqzYshiUQif2zKIpSrUGXk3BxGIWN5jejK+PG2MW8E6XkqJKPQDyCll3mM5S41lm0w7kL/htSVsdyA+tMwlnqMdkFreY3RbvBK2VLGU3jue3C+PeqRc28yZkD77zXaeTe0pKuN5Ll9avDsxriVo9+Evk9HPz5TvLJL5CXxKNScno4xXwLN3QQQnqsYfcDzjS2K9YSSanfFEW1ZpMpd78O33JCcVdAAfnXXZ6xRZb7vwztJ8Q3w4Ztq6WeKBS7/y4q/vVHXFHWtMMRYTVT8L3ry2TWIizTGfw0JuJdxWoAmaczYpPib+vDOVHUPwrkUC1z+xeBdz8hQ5xsx1uDaLkaOzz2LjT6N8uG9TvH91XI9z6jrLp+6LoMGcXlvc6+ZicKUBJOIKQnyye/Hj1L9Tpx8trFzaYtPXaOU73Az40If3svgixD8mYcT9B1TLGMimvPRJPqn8Y7RTtWO+ur8HuUfie3fw+N+XRnnG+cu92lfb3X8H8v1oer4Pvh4XjQHfnYNSvX5Hc8CSQ05mVOVqVCO416M25K0QMK2P94dBB/BZFtgMQs+gsPp0r0+9dyvjschkGGnd94J6qfbh31qLMWBHRjnwqrtM3VpOcy0t/F8NS00FoJXAMJdUOtwfC6jowd/Z/w9VMM8jZmf7n0q4CYE0cfJmCjJIvFdRjM+UFI4pw5H+16E35BnibwQpI8bWRqAiIlJ/Rm5ON7uJbG+pSefjEfSj2R8jt8FsKmPNUl/2iLyaEb2dLTyEo/y/fF3EyKcbvSpr4W3o1oA6y2CJlP5opVYJEH0mXqGzvFeIK5D66rBVio0eCKSDOyf1e8hFp7fq+OxCAx46CtWSiUl8QgbCQzk43c7LJK6RJ9iIruS39gncjg41AXHWyHxXS3U3VLfaSqYtMSWRVJmcUs43kG0BSHg9gjsHPcF0hIRDTeKdSOk74lKTyop3gsREZcGIgdCkHb+ftf48fHeW3JZryAqJfQbxPyTRVW1LC+Rp5UqT3SxJeflWhASiVuttE4f5NU05arjFZb7idk1Rf2eqDSUH22HebenLiwQVwX+0VDTjY5xOw4lqR5Jfo1Rvwer4wcNp/6gb00S4o2PMi1jOeYoPKtMC04K+cy0n2A6473U8TLjryz+Cwx+HQj5wON+EgApUfN8Onyhq+OZY3VhN+8KSF/J4P6QMcyIQBxtugYP+RTLNRnIUgz2wRB1Seb3DsZ5jJ5wPOUBn4nr72r1bTdG2Bp5/fVE+7IAbbgNNvp9STJdR1BsN4RtvmRD4l8QIGyWquMfG9fylHnlLqR5aL+rMebjuLly3NeR926M3Vh401TEKxcow7MQ03QGggt2MuLv41WMfnAceZAiVe4GH75ixXetOp/F+Fxd62bkQT4LmQd5TfH93IdvehyZ81JGwzjG4kpV9l3sGHDpysDyr74aZtepZKlXq7j95epaC8YWnK9gnK6uZTE2h8yDzIoje74FuRm/Nmcjyy78WxkNcb6rqucNo63bLDsFdH7jtZC7dAda8kYuqhivMzrbytaV90HKEQKdit+P+UQ7kk0iTXZ6jEUTOG/x7EuaCUneW4Uu3fMzA0tPnFjb/myDqfUCTCAZyytqWecUSNpmlmsZ0LJBfsoOmE39EZQ5i2L5C20+vWHMiXmIil2CCNl6Fd4VKgrZ/slAT1gM4gP9CKZXCsyuqzEHx9Y1E8slUYUvw1nvgajPo5TYprl4qAD3yfQIocqD3xdnnaPpyEQWhY4s7dyZjD5NRMBDAgUScr6dMaEWYzkv0DQMRyXKWe6GBdLH4n9o8/sGHMuGy0LDX/kogcjpYhx/n2J5IzEdOyi/LQMm5VFz0tNqUXY4bEfXmW0R0vavDbkx+0oLKnREIw6SyNxc9XuCR7TlSHrrLbaM301Wv4YpqV4AR3t3gnUlS5AuUsedDH9kucXhnqMWtatpzlT+x4patGUjxfbVdYSWdSlfa/5Un8kdT3SnyojmJErS6T+pyElBEuoMopSjVO86dbzwOGjkD6HJ3EjQ6CRH7RKhj6k6638qtIH7fqtt64Ak71bhuDOCH9mqf3s97tMIVkgehUuairXyT/X7F14LRGdAT0lwkn1Vy0F8Aja80K2M6ym2C/NEo4Yex8eSRlD1PiUxJX55nMeyVAkLWSA/Uddm+Zh3Qq3B39SijUxqD1NqnmGS+dHztiibuUBWq+PuISsWCeBmQff7hszC02C1WMfAoTuRKeU43Vc0+xD1rMcqezvZdCnMyn9QLNPtp0VcE+s6HK9XmsIk1y/JgX/q0ns+99AbKTuHbL/WRg28FkgRVaf4L4VjFEQS93e3DogBvTag4WHoA2UStIG0CUNOyHsdi/eMHQ8TNFkTP2xfl1D1Ll95f6JlksfSpTzMGTFPvhfQHqGTlR+yTJleJonGkQx3OiJPQvIeUHHIfpwXku86IzjgqUEK1e8phho0SfwFndQL2r59II5JU0DeWVIv0rtID4bkqzpKC+Sgx/2SVfeBOCbwCEyqRMcyzBjVC+mHFlPNzYN+mVHhfduihSpDapD+CP6k+/D/lmKRPpem+UUnxFaVbcYXwrkTW06ymDMQ0UmFjSe+QVtV7iGyv9crmU+JPZ9hqDvJnLeD9Fjm0ck/+NimLmVAaolazzUcrzOgiudigK7FOZ1jkXc4GsNWn58Ev+MqSDq9F+pO9PV9jFGijvKpeOCdDVPpPpihRR6StQKCbEpA/VmoX8boInXezcw39tBmsiD6huzDDkjoPLUQg7TBIjw78nHozQVUgIXhCoi74YiXqMXfGv3tosoOPWI+emR00xnPhsw0lzFu9MkODwwovzIgu/ycwW9m0oPeSd8a8p30LxlNavkdq24B9yhntPEsP2dOUEZ4UEBGO+jd9MnGG4hmJj0Z76Q7qMevHWMV7+wQmXB5U/JAHPW7yGV8GLLNlYwbw2bS98O3kD1Sg6BNmkNapEJiiDn2JqSSX3x9MyTbFouzKhGJpQHSYCi0RDbsVDMvUY527LWYAlnKtBCnfw5Vv9OsSezhNRTuvYGgKM10jJGZXDwJ173v0Z4V83lsMq9c6cUhzqzkCzZaxrJ5CA14L1V/CaXU0sZSRH7KEux/fbRrawDfDEhtCce+EqJe2S7/F0SXRDusDNke0TxnQ1tdC82eDQ2ehv5/Dq0+2dbveL6L1UBFZA7S0U/gfXeJNQk99FDQW4URuZSZSdS9O4vhoqCP5aUoXyR4Hp9+evTp0TqN2bNjn96kBD7r2aoVOQMGkHPOOcf386Jdu5Lz2GPk5OYG87ZtS05hITmbNsU+SZqREVxGPklaXBwbr6VLk/O51exsch5+mJzKymiBnBCYNYsclpChHm69euTccQc5mzfHyu7bR87TT5PToYOdd8gQckpKYospmQuDpa8zYQI5Bw7E2lFVRc6kSeR06VKTt2NHcp55JtZW87vE99xj/y6xLIwVK+zjJf0ZOZKcTp3IycoK3+bmzckZPZqciopv64o+PXoi0cyZsc2MDRrYr5ezO9atGxFrjRq0axcRL7TDXz2XL5wL7/nnsyegAjjydfcNG9gzqMU7a1VwA/v1I2psCXrxIjjcD/kau7RD5p/wml9r17RmTcx8Eh6R6u3asfudG649ixcTbdsW+4r9uHGx9tWD6y1fxu/Vi+iWW9hTZle5Tx+inJyEfZCIIvrOUfQPdCKKKFogEUWUGIkxFv2X24giqkmH/8vt/wUYABc+wxOhtzkPAAAAAElFTkSuQmCC\" data-filename=\"logo-14.png\"><br></p>', NULL, 'Logo 2 - Bagian Bawah Kiri', '2018-01-08 21:47:15', '2024-08-18 15:55:41', 1, 1, NULL, NULL, NULL, 0, ''),
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
                                                                                                                                                                                                                                                                                          (146, 1, 32, 'Jessika Douglas', 'wolff.yolanda@von.com', 'Uwolff.yolanda@von.com', '0ab45', 'pierre51@boyle.com', 1, '2024-09-18 19:52:33', 'Cebs1cHJoKI6M_hNA3NgTT9mH5bgDv1-', '2024-09-11 13:35:40', '2024-09-19 23:30:05', 1, 1, NULL, NULL, NULL, 16, '1043ae5e700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (147, 1, 32, 'Ottilie Becker', 'dylan22@nitzsche.com', 'Udylan22@nitzsche.com', 'ec805', 'mwiza@yahoo.com', 1, '2024-09-18 23:18:05', 'lbMjNG7jycyvmT_S4w5WY6a4CXt_ukxG', '2024-09-11 13:35:40', '2024-09-19 23:30:08', 1, 1, NULL, NULL, NULL, 6, '1044b142700811ef8bc7c858c0b7f92f'),
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
                                                                                                                                                                                                                                                                                          (160, 1, 36, 'Bradford Thiel', 'vern88@yahoo.com', 'Uvern88@yahoo.com', '18fda', 'jamel90@kshlerin.net', 1, '2024-09-20 12:56:38', '2xkXdn0Z-P05E4MqO93LHTBAsNfkuVf2', '2024-09-11 13:35:40', '2024-09-20 13:57:07', 1, 1, NULL, NULL, NULL, 4, '104da705700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (161, 1, 36, 'Leanna Mertz', 'gail33@herzog.com', 'Ugail33@herzog.com', '007a2', 'wolf.carson@collins.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104df102700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (162, 1, 36, 'Aiden Schultz', 'abeahan@yahoo.com', 'Uabeahan@yahoo.com', '7854c', 'georgiana08@gmail.com', 1, NULL, NULL, '2024-09-11 13:35:40', '2024-09-11 13:35:40', 1, 1, NULL, NULL, NULL, 0, '104f07ad700811ef8bc7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (163, 1, 32, 'Achmad Maula Fata', '0078294733', 'U0078294733', '8b874', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18b650d274f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (164, 1, 32, 'Adila Khalisah', '0063509763', 'U0063509763', 'c35e8', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18b6f95274f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (165, 1, 32, 'Amira Jufri', '0053756117', 'U0053756117', 'fe073', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18b75fef74f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (166, 1, 32, 'Anbar Salsabilla', '0065125737', 'U0065125737', '6987e', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18b8328274f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (167, 1, 32, 'Aninda Belta Shakira', '0065757046', 'U0065757046', '7a99b', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18b8aef074f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (168, 1, 32, 'Annisa Salsabila', '0064848339', 'U0064848339', '1d217', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18b9037374f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (171, 1, 32, 'Ersya Elysia', '0076787140', 'U0076787140', '134da', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18ba2eba74f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (172, 1, 32, 'Fachri Satria Tanjung', '0066822084', 'U0066822084', '48a2b', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bac2c274f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (173, 1, 32, 'Faiz Rusdy', '0067053895', 'U0067053895', 'd3f6c', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bb540874f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (174, 1, 32, 'Faturrahman', '0064788352', 'U0064788352', '6befe', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bbbc5774f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (175, 1, 32, 'Gery Juan Devista', '0056176047', 'U0056176047', 'de974', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bc177d74f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (176, 1, 32, 'Ghaliza Anandistya Medina', '0066765899', 'U0066765899', '5a45b', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bc81f274f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (177, 1, 32, 'Hadisty Ananda', '0064226685', 'U0064226685', '49509', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bd027274f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (178, 1, 32, 'Haifa Azizah', '0064115981', 'U0064115981', '47972', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bd82c474f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (179, 1, 32, 'Izzah Rizqina', '0067675678', 'U0067675678', 'dcb8d', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bdf69b74f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (180, 1, 32, 'Maqsal Mina', '0062231412', 'U0062231412', 'facad', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18be4e8774f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (181, 1, 32, 'Muhammad Rafiqul Abbrar', '0068042913', 'U0068042913', '0ce71', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bea29374f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (182, 1, 32, 'Muhammad Rayyis Rasikh', '0062475153', 'U0062475153', '0dceb', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bf05a674f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (183, 1, 32, 'Nabila Alya Zahra', '0061728059', 'U0061728059', '61eb2', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18bf9f7574f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (184, 1, 32, 'Nayla Putri Agustin', '0063723566', 'U0063723566', 'd5ff1', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18c0150074f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (185, 1, 32, 'Naylatul Uhiya', '0066038509', 'U0066038509', 'fb889', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18c074cf74f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (186, 1, 32, 'Nouval Temas Mico', '0051515150', 'U0051515150', '7f03c', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18c0d4f774f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (187, 1, 32, 'Raisya Nikmatul Maula', '0069297662', 'U0069297662', '5aaf0', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18c1403374f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (188, 1, 32, 'Reza Aulia', '0063784793', 'U0063784793', 'e5939', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18c1a75374f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (189, 1, 32, 'Ridho Adha', '0068307640', 'U0068307640', '73fd6', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18c1fb2374f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (190, 1, 32, 'Riva Afaiza', '0062599709', 'U0062599709', '74c28', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18c2799474f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (191, 1, 32, 'Syauqi Amran', '0067129512', 'U0067129512', '5e71f', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18c2d4dd74f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (192, 1, 32, 'Syifaus Syauqina', '0062471428', 'U0062471428', 'bc3f3', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18c32a6e74f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (193, 1, 32, 'Zaqi Aulia', '0067476158', 'U0067476158', 'dee0c', 'test@oke.com', 1, NULL, NULL, '2024-09-17 20:23:58', '2024-09-17 20:23:58', 1, 1, NULL, NULL, NULL, 0, '18c37d9274f811efbf67c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (194, 1, 33, 'test 123', '123123', 'U123123', 'c62fc', NULL, 1, NULL, NULL, '2024-09-19 23:39:35', '2024-09-19 23:39:35', 1, 1, NULL, NULL, NULL, 0, 'c182afbb76a511efb428c858c0b7f92f');

-- --------------------------------------------------------

--
-- Table structure for table `tx_period`
--

CREATE TABLE `tx_period` (
                             `id` int(11) NOT NULL,
                             `office_id` int(11) DEFAULT NULL,
                             `title` varchar(100) DEFAULT NULL,
                             `is_active` int(11) DEFAULT NULL,
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

INSERT INTO `tx_period` (`id`, `office_id`, `title`, `is_active`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                          (1, NULL, 'Semester 1', NULL, '', '2024-02-14 09:39:06', '2024-02-14 09:39:06', 1, 1, NULL, NULL, NULL, 0, '39503330cae211ee8332c858c0b7f92f'),
                                                                                                                                                                                                          (2, 1, 'Semester 1', NULL, '', '2024-02-14 09:43:28', '2024-02-14 09:43:28', 1, 1, NULL, NULL, NULL, 0, 'd52bfb6acae211ee8332c858c0b7f92f'),
                                                                                                                                                                                                          (3, 1, 'Semester 2', NULL, '', '2024-02-14 09:46:25', '2024-02-14 09:46:25', 1, 1, NULL, NULL, NULL, 0, '3ee7aa1bcae311ee8332c858c0b7f92f'),
                                                                                                                                                                                                          (4, 1, 'test', 2, '-', '2024-09-20 16:09:06', '2024-09-20 16:09:27', 1, 1, NULL, NULL, NULL, 1, 'fd1be0f5772f11ef9f5cc858c0b7f92f');

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
                                                                                                                                                                                                                                                                                                                         (75, 1, '00072', 2, 32, 2, 1, 1, '2024-09-19 23:44:51', '2024-09-20 01:44:51', '279142', '2024-09-19 23:44:51', NULL, NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d55853e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (76, 1, '00073', 2, 33, 2, 1, 1, '2024-09-20 02:44:51', '2024-09-20 04:44:51', '054454', '2024-09-20 02:44:51', NULL, NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d5a1c6276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (77, 1, '00074', 2, 34, 2, 1, 1, '2024-09-20 05:44:51', '2024-09-20 07:44:51', '291816', '2024-09-20 05:44:51', NULL, NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d5be38076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (78, 1, '00075', 2, 35, 2, 1, 1, '2024-09-20 08:44:51', '2024-09-20 10:44:51', '670105', '2024-09-20 08:44:51', NULL, NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d5d828076a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (79, 1, '00076', 2, 36, 2, 1, 1, '2024-09-20 11:44:51', '2024-09-20 13:44:51', '743621', '2024-09-20 11:44:51', NULL, NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d5fa4a576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (80, 1, '00077', 2, 32, 2, 1, 1, '2024-09-19 23:44:52', '2024-09-20 01:44:52', '827878', '2024-09-19 23:44:52', NULL, NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e359bff76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (81, 1, '00078', 2, 33, 2, 1, 1, '2024-09-20 02:44:52', '2024-09-20 04:44:52', '474652', '2024-09-20 02:44:52', NULL, NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e385b2276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (82, 1, '00079', 2, 34, 2, 1, 1, '2024-09-20 05:44:52', '2024-09-20 07:44:52', '161946', '2024-09-20 05:44:52', NULL, NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e3a101976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (83, 1, '00080', 2, 35, 2, 1, 1, '2024-09-20 08:44:52', '2024-09-20 10:44:52', '933641', '2024-09-20 08:44:52', NULL, NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e3bb8c376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (84, 1, '00081', 2, 36, 2, 1, 1, '2024-09-20 11:44:52', '2024-09-20 13:44:52', '389781', '2024-09-20 11:44:52', NULL, NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e3d490376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (85, 1, '00082', 2, 32, 2, 1, 1, '2024-09-19 23:44:53', '2024-09-20 01:44:53', '799505', '2024-09-19 23:44:53', NULL, NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7ea800ef76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (86, 1, '00083', 2, 33, 2, 1, 1, '2024-09-20 02:44:53', '2024-09-20 04:44:53', '617559', '2024-09-20 02:44:53', NULL, NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eae15c376a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (87, 1, '00084', 2, 34, 2, 1, 1, '2024-09-20 05:44:53', '2024-09-20 07:44:53', '799839', '2024-09-20 05:44:53', NULL, NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eb040f576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (88, 1, '00085', 2, 35, 2, 1, 1, '2024-09-20 08:44:53', '2024-09-20 10:44:53', '864455', '2024-09-20 08:44:53', NULL, NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eb1c7f276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (89, 1, '00086', 2, 36, 2, 1, 1, '2024-09-20 11:44:53', '2024-09-20 13:44:53', '890637', '2024-09-20 13:30:41', NULL, NULL, '2024-09-19 23:44:53', '2024-09-20 13:30:41', 1, 160, NULL, NULL, NULL, 2, '7eb3c52776a611efb428c858c0b7f92f');

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
                                                                                                                                                                                                                                                    (143, 1, 75, 34, 2, 'Matematika', NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d586d6276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (144, 1, 75, 35, 2, 'Kimia', NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d58f9f476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (145, 1, 76, 34, 3, 'Matematika', NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d5acb6b76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (146, 1, 76, 35, 2, 'Kimia', NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d5b176876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (147, 1, 77, 34, 3, 'Matematika', NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d5c780776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (148, 1, 77, 35, 3, 'Kimia', NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d5cd2d276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (149, 1, 78, 34, 2, 'Matematika', NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d5e894e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (150, 1, 78, 35, 3, 'Kimia', NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d5ef58b76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (151, 1, 79, 34, 2, 'Matematika', NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d6037de76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (152, 1, 79, 35, 3, 'Kimia', NULL, '2024-09-19 23:44:51', '2024-09-19 23:44:51', 1, 1, NULL, NULL, NULL, 0, '7d609a4476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (153, 1, 80, 34, 2, 'Matematika', NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e372abf76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (154, 1, 80, 35, 3, 'Kimia', NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e379db976a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (155, 1, 81, 34, 2, 'Matematika', NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e39171676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (156, 1, 81, 35, 3, 'Kimia', NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e39647276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (157, 1, 82, 34, 2, 'Matematika', NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e3aa30c76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (158, 1, 82, 35, 3, 'Kimia', NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e3b0ac276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (159, 1, 83, 34, 3, 'Matematika', NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e3c538e76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (160, 1, 83, 35, 3, 'Kimia', NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e3ca10176a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (161, 1, 84, 34, 3, 'Matematika', NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e3e19ce76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (162, 1, 84, 35, 1, 'Kimia', NULL, '2024-09-19 23:44:52', '2024-09-19 23:44:52', 1, 1, NULL, NULL, NULL, 0, '7e3e675f76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (163, 1, 85, 34, 3, 'Matematika', NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eac744576a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (164, 1, 85, 35, 3, 'Kimia', NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7ead4fd676a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (165, 1, 86, 34, 1, 'Matematika', NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eaec06876a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (166, 1, 86, 35, 1, 'Kimia', NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eaf1eab76a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (167, 1, 87, 34, 3, 'Matematika', NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eb0d50476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (168, 1, 87, 35, 2, 'Kimia', NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eb1221276a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (169, 1, 88, 34, 1, 'Matematika', NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eb27b7476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (170, 1, 88, 35, 2, 'Kimia', NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eb2f1f776a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (171, 1, 89, 34, 2, 'Matematika', NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eb474d476a611efb428c858c0b7f92f'),
                                                                                                                                                                                                                                                    (172, 1, 89, 35, 3, 'Kimia', NULL, '2024-09-19 23:44:53', '2024-09-19 23:44:53', 1, 1, NULL, NULL, NULL, 0, '7eb4ca5376a611efb428c858c0b7f92f');

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
                                                      ('14ce4noe6uiscqo7h277nngohb', 1726680709, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('1noj41u9jrts54u20d8s8c9r3u', 1726824852, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('cnrc8tsjuln0jm3mcns9bdmfkd', 1726735643, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('elmu2559i7t2lmu3gmpvmrj3vd', 1726816868, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('j74kq5d4h11183mps6j41mb94l', 1726765968, 0x5f5f666c6173687c613a303a7b7d5f5f72657475726e55726c7c733a34353a22687474703a2f2f6c6f63616c686f73742f6170702f796969322d7175697a2d69737072696e672f61646d696e2f223b5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('m5qsjieifpp9fq4dutd1fcajf3', 1726816766, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a3136303b5f5f617574684b65797c733a33323a2232786b58646e305a2d50303545344d714f39334c48544241734e666b75566632223b),
                                                      ('ocgfvr812923ocq5pcqncrbffm', 1726821934, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('odksss09tltr595d9kn141ot2g', 1726813191, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('q26k1aan2k3o33jd5guon9ad2b', 1726744787, 0x5f5f666c6173687c613a303a7b7d5f5f72657475726e55726c7c733a35353a22687474703a2f2f6c6f63616c686f73742f6170702f796969322d7175697a2d69737072696e672f61646d696e2f736974652f696e646578223b5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b),
                                                      ('rcmoprg472pr8s3g4tfe5bj168', 1726680654, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a3134373b5f5f617574684b65797c733a33323a226c624d6a4e47376a796379766d545f5334773557593661344358745f756b7847223b),
                                                      ('rlf1bnbg3lokcli0ci240o7ar9', 1726814256, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('tteumagiskprge05gkehau67cm', 1726760587, 0x5f5f666c6173687c613a303a7b7d);

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
    (1, 'admin', 'ombakrinai@gmail.com', '$2y$10$oD129/e5PjrTkIV1yiR3AuOc2/XAOXLWgKPfb8svo8BdBA4PUsw3G', 'e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm', NULL, NULL, 0, NULL, NULL, 1675777211, 1675777211, 1726820503, NULL, 0);

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1270;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `tx_period`
--
ALTER TABLE `tx_period`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `tx_schedule_detail`
--
ALTER TABLE `tx_schedule_detail`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

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
