-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2024 at 07:14 AM
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
                                 `subject_type` int(11) DEFAULT NULL,
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

--
-- Dumping data for table `tx_assessment`
--

INSERT INTO `tx_assessment` (`id`, `office_id`, `schedule_id`, `schedule_detail_id`, `participant_id`, `period_id`, `group_id`, `subject_id`, `subject_type`, `exam_type`, `app_version`, `earned_points`, `passing_score`, `passing_score_percent`, `gained_score`, `evaluate_score`, `quiz_title`, `quiz_type`, `username`, `time_limit`, `used_time`, `time_spent`, `work_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (95, 1, 21, 41, 99, 2, 22, 24, 3, NULL, 'x.x.x', '21.00', '25.00', NULL, '35.00', '60.00', 'Matematika', 'graded', 'Ulowe.eino@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db7e8c896d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (96, 1, 21, 41, 100, 2, 22, 24, 3, NULL, 'x.x.x', '20.00', '25.00', NULL, '28.00', '72.00', 'Matematika', 'graded', 'Ufelicia.pollich@beier.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db7f3f716d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (97, 1, 21, 41, 101, 2, 22, 24, 3, NULL, 'x.x.x', '30.00', '25.00', NULL, '14.00', '215.00', 'Matematika', 'graded', 'Umgoldner@orn.biz', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8036236d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (98, 1, 21, 41, 102, 2, 22, 24, 3, NULL, 'x.x.x', '34.00', '25.00', NULL, '34.00', '100.00', 'Matematika', 'graded', 'Uacormier@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db80aa256d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (99, 1, 21, 41, 103, 2, 22, 24, 3, NULL, 'x.x.x', '11.00', '25.00', NULL, '22.00', '50.00', 'Matematika', 'graded', 'Ucbatz@leffler.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db810f9a6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (100, 1, 21, 41, 104, 2, 22, 24, 3, NULL, 'x.x.x', '37.00', '25.00', NULL, '34.00', '109.00', 'Matematika', 'graded', 'Ufeeney.ava@bergnaum.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db81712e6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (101, 1, 21, 41, 119, 2, 22, 24, 3, NULL, 'x.x.x', '33.00', '25.00', NULL, '13.00', '254.00', 'Matematika', 'graded', 'Uoferry@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db81e1016d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (102, 1, 21, 41, 120, 2, 22, 24, 3, NULL, 'x.x.x', '47.00', '25.00', NULL, '17.00', '277.00', 'Matematika', 'graded', 'Udaphne.marquardt@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8266246d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (103, 1, 21, 41, 121, 2, 22, 24, 3, NULL, 'x.x.x', '15.00', '25.00', NULL, '35.00', '43.00', 'Matematika', 'graded', 'Uaric.herman@hotmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db82d2da6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (104, 1, 21, 42, 99, 2, 22, 25, 1, NULL, 'x.x.x', '11.00', '25.00', NULL, '11.00', '100.00', 'Kimia', 'graded', 'Ulowe.eino@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db83803d6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (105, 1, 21, 42, 100, 2, 22, 25, 1, NULL, 'x.x.x', '13.00', '25.00', NULL, '23.00', '57.00', 'Kimia', 'graded', 'Ufelicia.pollich@beier.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8403d96d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (106, 1, 21, 42, 101, 2, 22, 25, 1, NULL, 'x.x.x', '31.00', '25.00', NULL, '40.00', '78.00', 'Kimia', 'graded', 'Umgoldner@orn.biz', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8494656d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (107, 1, 21, 42, 102, 2, 22, 25, 1, NULL, 'x.x.x', '10.00', '25.00', NULL, '43.00', '24.00', 'Kimia', 'graded', 'Uacormier@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db853ca56d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (108, 1, 21, 42, 103, 2, 22, 25, 1, NULL, 'x.x.x', '26.00', '25.00', NULL, '29.00', '90.00', 'Kimia', 'graded', 'Ucbatz@leffler.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db85bd176d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (109, 1, 21, 42, 104, 2, 22, 25, 1, NULL, 'x.x.x', '19.00', '25.00', NULL, '35.00', '55.00', 'Kimia', 'graded', 'Ufeeney.ava@bergnaum.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8620236d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (110, 1, 21, 42, 119, 2, 22, 25, 1, NULL, 'x.x.x', '15.00', '25.00', NULL, '16.00', '94.00', 'Kimia', 'graded', 'Uoferry@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db86a21c6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (111, 1, 21, 42, 120, 2, 22, 25, 1, NULL, 'x.x.x', '23.00', '25.00', NULL, '22.00', '105.00', 'Kimia', 'graded', 'Udaphne.marquardt@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8725e26d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (112, 1, 21, 42, 121, 2, 22, 25, 1, NULL, 'x.x.x', '48.00', '25.00', NULL, '13.00', '370.00', 'Kimia', 'graded', 'Uaric.herman@hotmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db87ac576d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (113, 1, 22, 43, 105, 2, 23, 24, 2, NULL, 'x.x.x', '16.00', '25.00', NULL, '41.00', '40.00', 'Matematika', 'graded', 'Usauer.barney@hotmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db889ab66d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (114, 1, 22, 43, 106, 2, 23, 24, 2, NULL, 'x.x.x', '44.00', '25.00', NULL, '13.00', '339.00', 'Matematika', 'graded', 'Ubosco.kenny@hickle.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db890d5f6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (115, 1, 22, 43, 107, 2, 23, 24, 2, NULL, 'x.x.x', '32.00', '25.00', NULL, '26.00', '124.00', 'Matematika', 'graded', 'Ufrankie.sanford@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db899b576d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (116, 1, 22, 43, 108, 2, 23, 24, 2, NULL, 'x.x.x', '24.00', '25.00', NULL, '35.00', '69.00', 'Matematika', 'graded', 'Umwhite@schowalter.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8a38ae6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (117, 1, 22, 43, 109, 2, 23, 24, 2, NULL, 'x.x.x', '46.00', '25.00', NULL, '26.00', '177.00', 'Matematika', 'graded', 'Uwehner.maureen@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8a9da76d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (118, 1, 22, 43, 122, 2, 23, 24, 2, NULL, 'x.x.x', '33.00', '25.00', NULL, '44.00', '75.00', 'Matematika', 'graded', 'Uturcotte.zita@hyatt.net', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8b11006d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (119, 1, 22, 43, 123, 2, 23, 24, 2, NULL, 'x.x.x', '38.00', '25.00', NULL, '46.00', '83.00', 'Matematika', 'graded', 'Uadah.cruickshank@oberbrunner.info', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8b77146d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (120, 1, 22, 43, 124, 2, 23, 24, 2, NULL, 'x.x.x', '49.00', '25.00', NULL, '40.00', '123.00', 'Matematika', 'graded', 'Usbergstrom@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8bde396d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (121, 1, 22, 43, 125, 2, 23, 24, 2, NULL, 'x.x.x', '24.00', '25.00', NULL, '48.00', '50.00', 'Matematika', 'graded', 'Uhuel.macie@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8c79966d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (122, 1, 22, 43, 126, 2, 23, 24, 2, NULL, 'x.x.x', '45.00', '25.00', NULL, '41.00', '110.00', 'Matematika', 'graded', 'Urose96@kozey.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8d06766d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (123, 1, 22, 43, 127, 2, 23, 24, 2, NULL, 'x.x.x', '48.00', '25.00', NULL, '27.00', '178.00', 'Matematika', 'graded', 'Ubobbie23@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8d7eff6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (124, 1, 22, 44, 105, 2, 23, 25, 3, NULL, 'x.x.x', '18.00', '25.00', NULL, '14.00', '129.00', 'Kimia', 'graded', 'Usauer.barney@hotmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8e57f06d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (125, 1, 22, 44, 106, 2, 23, 25, 3, NULL, 'x.x.x', '11.00', '25.00', NULL, '34.00', '33.00', 'Kimia', 'graded', 'Ubosco.kenny@hickle.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8efffd6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (126, 1, 22, 44, 107, 2, 23, 25, 3, NULL, 'x.x.x', '22.00', '25.00', NULL, '14.00', '158.00', 'Kimia', 'graded', 'Ufrankie.sanford@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db8f9ea86d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (127, 1, 22, 44, 108, 2, 23, 25, 3, NULL, 'x.x.x', '14.00', '25.00', NULL, '18.00', '78.00', 'Kimia', 'graded', 'Umwhite@schowalter.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db90151d6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (128, 1, 22, 44, 109, 2, 23, 25, 3, NULL, 'x.x.x', '29.00', '25.00', NULL, '38.00', '77.00', 'Kimia', 'graded', 'Uwehner.maureen@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db90785c6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (129, 1, 22, 44, 122, 2, 23, 25, 3, NULL, 'x.x.x', '33.00', '25.00', NULL, '49.00', '68.00', 'Kimia', 'graded', 'Uturcotte.zita@hyatt.net', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db90f1936d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (130, 1, 22, 44, 123, 2, 23, 25, 3, NULL, 'x.x.x', '46.00', '25.00', NULL, '16.00', '288.00', 'Kimia', 'graded', 'Uadah.cruickshank@oberbrunner.info', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9191296d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (131, 1, 22, 44, 124, 2, 23, 25, 3, NULL, 'x.x.x', '30.00', '25.00', NULL, '35.00', '86.00', 'Kimia', 'graded', 'Usbergstrom@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db92125f6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (132, 1, 22, 44, 125, 2, 23, 25, 3, NULL, 'x.x.x', '21.00', '25.00', NULL, '23.00', '92.00', 'Kimia', 'graded', 'Uhuel.macie@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9277d06d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (133, 1, 22, 44, 126, 2, 23, 25, 3, NULL, 'x.x.x', '47.00', '25.00', NULL, '39.00', '121.00', 'Kimia', 'graded', 'Urose96@kozey.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db92d8ba6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (134, 1, 22, 44, 127, 2, 23, 25, 3, NULL, 'x.x.x', '48.00', '25.00', NULL, '27.00', '178.00', 'Kimia', 'graded', 'Ubobbie23@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db933a2b6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (135, 1, 23, 45, 110, 2, 24, 24, 3, NULL, 'x.x.x', '39.00', '25.00', NULL, '47.00', '83.00', 'Matematika', 'graded', 'Ubdickens@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db944a586d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (136, 1, 23, 45, 111, 2, 24, 24, 3, NULL, 'x.x.x', '26.00', '25.00', NULL, '15.00', '174.00', 'Matematika', 'graded', 'Ulon.quigley@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db94bf876d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (137, 1, 23, 45, 112, 2, 24, 24, 3, NULL, 'x.x.x', '38.00', '25.00', NULL, '29.00', '132.00', 'Matematika', 'graded', 'Usummer86@hotmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9520786d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (138, 1, 23, 45, 128, 2, 24, 24, 3, NULL, 'x.x.x', '30.00', '25.00', NULL, '10.00', '300.00', 'Matematika', 'graded', 'Uamacejkovic@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9587ab6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (139, 1, 23, 45, 129, 2, 24, 24, 3, NULL, 'x.x.x', '26.00', '25.00', NULL, '28.00', '93.00', 'Matematika', 'graded', 'Ugiovanna.hilpert@hermiston.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db95f9756d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (140, 1, 23, 46, 110, 2, 24, 25, 3, NULL, 'x.x.x', '32.00', '25.00', NULL, '27.00', '119.00', 'Kimia', 'graded', 'Ubdickens@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9708a06d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (141, 1, 23, 46, 111, 2, 24, 25, 3, NULL, 'x.x.x', '32.00', '25.00', NULL, '10.00', '320.00', 'Kimia', 'graded', 'Ulon.quigley@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9764a46d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (142, 1, 23, 46, 112, 2, 24, 25, 3, NULL, 'x.x.x', '20.00', '25.00', NULL, '13.00', '154.00', 'Kimia', 'graded', 'Usummer86@hotmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db97c2576d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (143, 1, 23, 46, 128, 2, 24, 25, 3, NULL, 'x.x.x', '46.00', '25.00', NULL, '18.00', '256.00', 'Kimia', 'graded', 'Uamacejkovic@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9822ac6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (144, 1, 23, 46, 129, 2, 24, 25, 3, NULL, 'x.x.x', '39.00', '25.00', NULL, '20.00', '195.00', 'Kimia', 'graded', 'Ugiovanna.hilpert@hermiston.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db987eda6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (145, 1, 24, 47, 113, 2, 25, 24, 2, NULL, 'x.x.x', '30.00', '25.00', NULL, '30.00', '100.00', 'Matematika', 'graded', 'Ususana64@rogahn.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9956076d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (146, 1, 24, 47, 114, 2, 25, 24, 2, NULL, 'x.x.x', '32.00', '25.00', NULL, '36.00', '89.00', 'Matematika', 'graded', 'Ufelicita.schamberger@crona.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db99af6d6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (147, 1, 24, 47, 115, 2, 25, 24, 2, NULL, 'x.x.x', '26.00', '25.00', NULL, '45.00', '58.00', 'Matematika', 'graded', 'Ueric.lubowitz@schaefer.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9a03fb6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (148, 1, 24, 47, 130, 2, 25, 24, 2, NULL, 'x.x.x', '33.00', '25.00', NULL, '15.00', '221.00', 'Matematika', 'graded', 'Ukacey85@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9a69e96d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (149, 1, 24, 47, 131, 2, 25, 24, 2, NULL, 'x.x.x', '46.00', '25.00', NULL, '39.00', '118.00', 'Matematika', 'graded', 'Uconnelly.wilburn@nicolas.biz', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9ac5fc6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (150, 1, 24, 48, 113, 2, 25, 25, 2, NULL, 'x.x.x', '48.00', '25.00', NULL, '49.00', '98.00', 'Kimia', 'graded', 'Ususana64@rogahn.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9b98126d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (151, 1, 24, 48, 114, 2, 25, 25, 2, NULL, 'x.x.x', '24.00', '25.00', NULL, '45.00', '54.00', 'Kimia', 'graded', 'Ufelicita.schamberger@crona.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9c16c36d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (152, 1, 24, 48, 115, 2, 25, 25, 2, NULL, 'x.x.x', '19.00', '25.00', NULL, '36.00', '53.00', 'Kimia', 'graded', 'Ueric.lubowitz@schaefer.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9c84bd6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (153, 1, 24, 48, 130, 2, 25, 25, 2, NULL, 'x.x.x', '17.00', '25.00', NULL, '38.00', '45.00', 'Kimia', 'graded', 'Ukacey85@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9cf0a66d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (154, 1, 24, 48, 131, 2, 25, 25, 2, NULL, 'x.x.x', '43.00', '25.00', NULL, '18.00', '239.00', 'Kimia', 'graded', 'Uconnelly.wilburn@nicolas.biz', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9d508d6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (155, 1, 25, 49, 116, 2, 26, 24, 2, NULL, 'x.x.x', '43.00', '25.00', NULL, '40.00', '108.00', 'Matematika', 'graded', 'Utrace28@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9e473e6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (156, 1, 25, 49, 117, 2, 26, 24, 2, NULL, 'x.x.x', '36.00', '25.00', NULL, '10.00', '360.00', 'Matematika', 'graded', 'Uwilderman.garett@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9ea9806d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (157, 1, 25, 49, 118, 2, 26, 24, 2, NULL, 'x.x.x', '33.00', '25.00', NULL, '31.00', '107.00', 'Matematika', 'graded', 'Ukmarks@senger.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9efc3a6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (158, 1, 25, 49, 132, 2, 26, 24, 2, NULL, 'x.x.x', '42.00', '25.00', NULL, '28.00', '150.00', 'Matematika', 'graded', 'Ugaylord.janis@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9f53296d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (159, 1, 25, 50, 116, 2, 26, 25, 3, NULL, 'x.x.x', '38.00', '25.00', NULL, '46.00', '83.00', 'Kimia', 'graded', 'Utrace28@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'db9feb3e6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (160, 1, 25, 50, 117, 2, 26, 25, 3, NULL, 'x.x.x', '32.00', '25.00', NULL, '12.00', '267.00', 'Kimia', 'graded', 'Uwilderman.garett@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba0792a6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (161, 1, 25, 50, 118, 2, 26, 25, 3, NULL, 'x.x.x', '31.00', '25.00', NULL, '22.00', '141.00', 'Kimia', 'graded', 'Ukmarks@senger.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba0dd3e6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (162, 1, 25, 50, 132, 2, 26, 25, 3, NULL, 'x.x.x', '46.00', '25.00', NULL, '32.00', '144.00', 'Kimia', 'graded', 'Ugaylord.janis@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba135246d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (163, 1, 26, 51, 133, 2, 27, 24, 1, NULL, 'x.x.x', '39.00', '25.00', NULL, '25.00', '156.00', 'Matematika', 'graded', 'Udemarcus.mitchell@heller.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba1cf746d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (164, 1, 26, 51, 134, 2, 27, 24, 1, NULL, 'x.x.x', '33.00', '25.00', NULL, '20.00', '165.00', 'Matematika', 'graded', 'Ubernita02@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba235926d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (165, 1, 26, 51, 135, 2, 27, 24, 1, NULL, 'x.x.x', '31.00', '25.00', NULL, '13.00', '239.00', 'Matematika', 'graded', 'Ugulgowski.destini@herman.org', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba28d8b6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (166, 1, 26, 52, 133, 2, 27, 25, 3, NULL, 'x.x.x', '34.00', '25.00', NULL, '18.00', '189.00', 'Kimia', 'graded', 'Udemarcus.mitchell@heller.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba36f216d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (167, 1, 26, 52, 134, 2, 27, 25, 3, NULL, 'x.x.x', '20.00', '25.00', NULL, '49.00', '41.00', 'Kimia', 'graded', 'Ubernita02@yahoo.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba3f0a96d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (168, 1, 26, 52, 135, 2, 27, 25, 3, NULL, 'x.x.x', '37.00', '25.00', NULL, '17.00', '218.00', 'Kimia', 'graded', 'Ugulgowski.destini@herman.org', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba44ded6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (169, 1, 27, 53, 136, 2, 28, 24, 2, NULL, 'x.x.x', '17.00', '25.00', NULL, '46.00', '37.00', 'Matematika', 'graded', 'Ujillian.hill@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba4d8456d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (170, 1, 27, 53, 137, 2, 28, 24, 2, NULL, 'x.x.x', '33.00', '25.00', NULL, '25.00', '132.00', 'Matematika', 'graded', 'Ujeramie.stamm@towne.biz', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba5399d6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (171, 1, 27, 54, 136, 2, 28, 25, 2, NULL, 'x.x.x', '50.00', '25.00', NULL, '12.00', '417.00', 'Kimia', 'graded', 'Ujillian.hill@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba633076d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (172, 1, 27, 54, 137, 2, 28, 25, 2, NULL, 'x.x.x', '29.00', '25.00', NULL, '26.00', '112.00', 'Kimia', 'graded', 'Ujeramie.stamm@towne.biz', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba6991a6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (173, 1, 28, 55, 138, 2, 29, 24, 3, NULL, 'x.x.x', '32.00', '25.00', NULL, '40.00', '80.00', 'Matematika', 'graded', 'Ufgutkowski@kohler.org', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba72b806d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (174, 1, 28, 56, 138, 2, 29, 25, 3, NULL, 'x.x.x', '41.00', '25.00', NULL, '36.00', '114.00', 'Kimia', 'graded', 'Ufgutkowski@kohler.org', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba7bc646d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (175, 1, 29, 57, 139, 2, 30, 24, 3, NULL, 'x.x.x', '38.00', '25.00', NULL, '34.00', '112.00', 'Matematika', 'graded', 'Uustroman@gusikowski.net', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba8e2716d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (176, 1, 29, 57, 140, 2, 30, 24, 3, NULL, 'x.x.x', '42.00', '25.00', NULL, '13.00', '324.00', 'Matematika', 'graded', 'Uqfeest@hotmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba941a36d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (177, 1, 29, 57, 141, 2, 30, 24, 3, NULL, 'x.x.x', '45.00', '25.00', NULL, '43.00', '105.00', 'Matematika', 'graded', 'Udbauch@pagac.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba99e106d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (178, 1, 29, 57, 142, 2, 30, 24, 3, NULL, 'x.x.x', '19.00', '25.00', NULL, '25.00', '76.00', 'Matematika', 'graded', 'Ulhodkiewicz@bode.info', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dba9f5906d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (179, 1, 29, 58, 139, 2, 30, 25, 3, NULL, 'x.x.x', '32.00', '25.00', NULL, '26.00', '124.00', 'Kimia', 'graded', 'Uustroman@gusikowski.net', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dbaab8976d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (180, 1, 29, 58, 140, 2, 30, 25, 3, NULL, 'x.x.x', '34.00', '25.00', NULL, '34.00', '100.00', 'Kimia', 'graded', 'Uqfeest@hotmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dbab3e106d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (181, 1, 29, 58, 141, 2, 30, 25, 3, NULL, 'x.x.x', '28.00', '25.00', NULL, '17.00', '165.00', 'Kimia', 'graded', 'Udbauch@pagac.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dbaba8666d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (182, 1, 29, 58, 142, 2, 30, 25, 3, NULL, 'x.x.x', '48.00', '25.00', NULL, '26.00', '185.00', 'Kimia', 'graded', 'Ulhodkiewicz@bode.info', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dbac0eab6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (183, 1, 30, 59, 143, 2, 31, 24, 2, NULL, 'x.x.x', '49.00', '25.00', NULL, '26.00', '189.00', 'Matematika', 'graded', 'Ukreichel@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dbad22da6d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (184, 1, 30, 59, 144, 2, 31, 24, 2, NULL, 'x.x.x', '42.00', '25.00', NULL, '15.00', '280.00', 'Matematika', 'graded', 'Uspencer.leonor@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dbadda956d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (185, 1, 30, 59, 145, 2, 31, 24, 2, NULL, 'x.x.x', '28.00', '25.00', NULL, '21.00', '134.00', 'Matematika', 'graded', 'Uleila.wilderman@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dbae7b796d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (186, 1, 30, 60, 143, 2, 31, 25, 2, NULL, 'x.x.x', '46.00', '25.00', NULL, '13.00', '354.00', 'Kimia', 'graded', 'Ukreichel@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dbaf4fa46d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (187, 1, 30, 60, 144, 2, 31, 25, 2, NULL, 'x.x.x', '31.00', '25.00', NULL, '31.00', '100.00', 'Kimia', 'graded', 'Uspencer.leonor@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dbafd1f96d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (188, 1, 30, 60, 145, 2, 31, 25, 2, NULL, 'x.x.x', '46.00', '25.00', NULL, '44.00', '105.00', 'Kimia', 'graded', 'Uleila.wilderman@gmail.com', NULL, NULL, NULL, 2, '2024-09-07 19:36:51', '2024-09-07 19:36:51', 1, 1, NULL, NULL, NULL, 0, 'dbb044c56d1511efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (189, 1, 21, 41, 99, 2, 22, 24, 3, NULL, 'x.x.x', '41.00', '25.00', NULL, '27.00', '152.00', 'Matematika', 'graded', 'Ulowe.eino@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdab5fd16d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (190, 1, 21, 41, 100, 2, 22, 24, 3, NULL, 'x.x.x', '47.00', '25.00', NULL, '43.00', '110.00', 'Matematika', 'graded', 'Ufelicia.pollich@beier.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdac8e8e6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (191, 1, 21, 41, 101, 2, 22, 24, 3, NULL, 'x.x.x', '41.00', '25.00', NULL, '47.00', '88.00', 'Matematika', 'graded', 'Umgoldner@orn.biz', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdacf4776d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (192, 1, 21, 41, 102, 2, 22, 24, 3, NULL, 'x.x.x', '17.00', '25.00', NULL, '41.00', '42.00', 'Matematika', 'graded', 'Uacormier@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdad5f8d6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (193, 1, 21, 41, 103, 2, 22, 24, 3, NULL, 'x.x.x', '50.00', '25.00', NULL, '32.00', '157.00', 'Matematika', 'graded', 'Ucbatz@leffler.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdadb66d6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (194, 1, 21, 41, 104, 2, 22, 24, 3, NULL, 'x.x.x', '27.00', '25.00', NULL, '14.00', '193.00', 'Matematika', 'graded', 'Ufeeney.ava@bergnaum.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdae0bcd6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (195, 1, 21, 41, 119, 2, 22, 24, 3, NULL, 'x.x.x', '40.00', '25.00', NULL, '15.00', '267.00', 'Matematika', 'graded', 'Uoferry@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdae5f876d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (196, 1, 21, 41, 120, 2, 22, 24, 3, NULL, 'x.x.x', '49.00', '25.00', NULL, '19.00', '258.00', 'Matematika', 'graded', 'Udaphne.marquardt@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdaeb2546d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (197, 1, 21, 41, 121, 2, 22, 24, 3, NULL, 'x.x.x', '37.00', '25.00', NULL, '12.00', '309.00', 'Matematika', 'graded', 'Uaric.herman@hotmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdaf1ef06d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (198, 1, 21, 42, 99, 2, 22, 25, 1, NULL, 'x.x.x', '36.00', '25.00', NULL, '34.00', '106.00', 'Kimia', 'graded', 'Ulowe.eino@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdaff7536d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (199, 1, 21, 42, 100, 2, 22, 25, 1, NULL, 'x.x.x', '43.00', '25.00', NULL, '49.00', '88.00', 'Kimia', 'graded', 'Ufelicia.pollich@beier.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb052086d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (200, 1, 21, 42, 101, 2, 22, 25, 1, NULL, 'x.x.x', '49.00', '25.00', NULL, '31.00', '159.00', 'Kimia', 'graded', 'Umgoldner@orn.biz', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb0a7776d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (201, 1, 21, 42, 102, 2, 22, 25, 1, NULL, 'x.x.x', '29.00', '25.00', NULL, '43.00', '68.00', 'Kimia', 'graded', 'Uacormier@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb1babd6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (202, 1, 21, 42, 103, 2, 22, 25, 1, NULL, 'x.x.x', '15.00', '25.00', NULL, '15.00', '100.00', 'Kimia', 'graded', 'Ucbatz@leffler.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb23fba6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (203, 1, 21, 42, 104, 2, 22, 25, 1, NULL, 'x.x.x', '44.00', '25.00', NULL, '44.00', '100.00', 'Kimia', 'graded', 'Ufeeney.ava@bergnaum.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb297276d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (204, 1, 21, 42, 119, 2, 22, 25, 1, NULL, 'x.x.x', '34.00', '25.00', NULL, '40.00', '85.00', 'Kimia', 'graded', 'Uoferry@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb2ebb56d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (205, 1, 21, 42, 120, 2, 22, 25, 1, NULL, 'x.x.x', '13.00', '25.00', NULL, '46.00', '29.00', 'Kimia', 'graded', 'Udaphne.marquardt@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb33ee16d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (206, 1, 21, 42, 121, 2, 22, 25, 1, NULL, 'x.x.x', '16.00', '25.00', NULL, '30.00', '54.00', 'Kimia', 'graded', 'Uaric.herman@hotmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb3937b6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (207, 1, 22, 43, 105, 2, 23, 24, 2, NULL, 'x.x.x', '47.00', '25.00', NULL, '43.00', '110.00', 'Matematika', 'graded', 'Usauer.barney@hotmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb499ec6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (208, 1, 22, 43, 106, 2, 23, 24, 2, NULL, 'x.x.x', '26.00', '25.00', NULL, '12.00', '217.00', 'Matematika', 'graded', 'Ubosco.kenny@hickle.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb507b16d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (209, 1, 22, 43, 107, 2, 23, 24, 2, NULL, 'x.x.x', '41.00', '25.00', NULL, '50.00', '82.00', 'Matematika', 'graded', 'Ufrankie.sanford@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb56bcd6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (210, 1, 22, 43, 108, 2, 23, 24, 2, NULL, 'x.x.x', '13.00', '25.00', NULL, '40.00', '33.00', 'Matematika', 'graded', 'Umwhite@schowalter.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb5f5de6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (211, 1, 22, 43, 109, 2, 23, 24, 2, NULL, 'x.x.x', '31.00', '25.00', NULL, '17.00', '183.00', 'Matematika', 'graded', 'Uwehner.maureen@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb689af6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (212, 1, 22, 43, 122, 2, 23, 24, 2, NULL, 'x.x.x', '27.00', '25.00', NULL, '21.00', '129.00', 'Matematika', 'graded', 'Uturcotte.zita@hyatt.net', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb719bd6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (213, 1, 22, 43, 123, 2, 23, 24, 2, NULL, 'x.x.x', '22.00', '25.00', NULL, '12.00', '184.00', 'Matematika', 'graded', 'Uadah.cruickshank@oberbrunner.info', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb76ff56d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (214, 1, 22, 43, 124, 2, 23, 24, 2, NULL, 'x.x.x', '28.00', '25.00', NULL, '13.00', '216.00', 'Matematika', 'graded', 'Usbergstrom@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb7c6606d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (215, 1, 22, 43, 125, 2, 23, 24, 2, NULL, 'x.x.x', '36.00', '25.00', NULL, '48.00', '75.00', 'Matematika', 'graded', 'Uhuel.macie@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb81ae36d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (216, 1, 22, 43, 126, 2, 23, 24, 2, NULL, 'x.x.x', '48.00', '25.00', NULL, '28.00', '172.00', 'Matematika', 'graded', 'Urose96@kozey.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb86d9c6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (217, 1, 22, 43, 127, 2, 23, 24, 2, NULL, 'x.x.x', '43.00', '25.00', NULL, '40.00', '108.00', 'Matematika', 'graded', 'Ubobbie23@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb8bd4d6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (218, 1, 22, 44, 105, 2, 23, 25, 3, NULL, 'x.x.x', '43.00', '25.00', NULL, '17.00', '253.00', 'Kimia', 'graded', 'Usauer.barney@hotmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb98f916d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (219, 1, 22, 44, 106, 2, 23, 25, 3, NULL, 'x.x.x', '34.00', '25.00', NULL, '19.00', '179.00', 'Kimia', 'graded', 'Ubosco.kenny@hickle.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdb9f01c6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (220, 1, 22, 44, 107, 2, 23, 25, 3, NULL, 'x.x.x', '23.00', '25.00', NULL, '28.00', '83.00', 'Kimia', 'graded', 'Ufrankie.sanford@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdba45a06d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (221, 1, 22, 44, 108, 2, 23, 25, 3, NULL, 'x.x.x', '46.00', '25.00', NULL, '49.00', '94.00', 'Kimia', 'graded', 'Umwhite@schowalter.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdba98826d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (222, 1, 22, 44, 109, 2, 23, 25, 3, NULL, 'x.x.x', '14.00', '25.00', NULL, '34.00', '42.00', 'Kimia', 'graded', 'Uwehner.maureen@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbaeba66d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (223, 1, 22, 44, 122, 2, 23, 25, 3, NULL, 'x.x.x', '23.00', '25.00', NULL, '49.00', '47.00', 'Kimia', 'graded', 'Uturcotte.zita@hyatt.net', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbb3ef26d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (224, 1, 22, 44, 123, 2, 23, 25, 3, NULL, 'x.x.x', '35.00', '25.00', NULL, '28.00', '125.00', 'Kimia', 'graded', 'Uadah.cruickshank@oberbrunner.info', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbb9f1f6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (225, 1, 22, 44, 124, 2, 23, 25, 3, NULL, 'x.x.x', '18.00', '25.00', NULL, '46.00', '40.00', 'Kimia', 'graded', 'Usbergstrom@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbc24ef6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (226, 1, 22, 44, 125, 2, 23, 25, 3, NULL, 'x.x.x', '12.00', '25.00', NULL, '26.00', '47.00', 'Kimia', 'graded', 'Uhuel.macie@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbc75c86d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (227, 1, 22, 44, 126, 2, 23, 25, 3, NULL, 'x.x.x', '31.00', '25.00', NULL, '11.00', '282.00', 'Kimia', 'graded', 'Urose96@kozey.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbcbe4d6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (228, 1, 22, 44, 127, 2, 23, 25, 3, NULL, 'x.x.x', '48.00', '25.00', NULL, '21.00', '229.00', 'Kimia', 'graded', 'Ubobbie23@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbd07df6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (229, 1, 23, 45, 110, 2, 24, 24, 3, NULL, 'x.x.x', '49.00', '25.00', NULL, '21.00', '234.00', 'Matematika', 'graded', 'Ubdickens@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbd83ad6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (230, 1, 23, 45, 111, 2, 24, 24, 3, NULL, 'x.x.x', '44.00', '25.00', NULL, '17.00', '259.00', 'Matematika', 'graded', 'Ulon.quigley@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbdcb106d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (231, 1, 23, 45, 112, 2, 24, 24, 3, NULL, 'x.x.x', '49.00', '25.00', NULL, '33.00', '149.00', 'Matematika', 'graded', 'Usummer86@hotmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbe16a06d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (232, 1, 23, 45, 128, 2, 24, 24, 3, NULL, 'x.x.x', '32.00', '25.00', NULL, '14.00', '229.00', 'Matematika', 'graded', 'Uamacejkovic@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbe9acb6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (233, 1, 23, 45, 129, 2, 24, 24, 3, NULL, 'x.x.x', '41.00', '25.00', NULL, '10.00', '410.00', 'Matematika', 'graded', 'Ugiovanna.hilpert@hermiston.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbef13f6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (234, 1, 23, 46, 110, 2, 24, 25, 3, NULL, 'x.x.x', '48.00', '25.00', NULL, '11.00', '437.00', 'Kimia', 'graded', 'Ubdickens@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbf85a26d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (235, 1, 23, 46, 111, 2, 24, 25, 3, NULL, 'x.x.x', '13.00', '25.00', NULL, '13.00', '100.00', 'Kimia', 'graded', 'Ulon.quigley@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdbfd77a6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (236, 1, 23, 46, 112, 2, 24, 25, 3, NULL, 'x.x.x', '13.00', '25.00', NULL, '34.00', '39.00', 'Kimia', 'graded', 'Usummer86@hotmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc02a6a6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (237, 1, 23, 46, 128, 2, 24, 25, 3, NULL, 'x.x.x', '20.00', '25.00', NULL, '15.00', '134.00', 'Kimia', 'graded', 'Uamacejkovic@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc07b576d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (238, 1, 23, 46, 129, 2, 24, 25, 3, NULL, 'x.x.x', '29.00', '25.00', NULL, '13.00', '224.00', 'Kimia', 'graded', 'Ugiovanna.hilpert@hermiston.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc0e5606d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (239, 1, 24, 47, 113, 2, 25, 24, 2, NULL, 'x.x.x', '47.00', '25.00', NULL, '37.00', '128.00', 'Matematika', 'graded', 'Ususana64@rogahn.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc18c816d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (240, 1, 24, 47, 114, 2, 25, 24, 2, NULL, 'x.x.x', '14.00', '25.00', NULL, '30.00', '47.00', 'Matematika', 'graded', 'Ufelicita.schamberger@crona.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc1e2f16d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (241, 1, 24, 47, 115, 2, 25, 24, 2, NULL, 'x.x.x', '47.00', '25.00', NULL, '13.00', '362.00', 'Matematika', 'graded', 'Ueric.lubowitz@schaefer.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc2349a6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (242, 1, 24, 47, 130, 2, 25, 24, 2, NULL, 'x.x.x', '33.00', '25.00', NULL, '22.00', '150.00', 'Matematika', 'graded', 'Ukacey85@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc284c76d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (243, 1, 24, 47, 131, 2, 25, 24, 2, NULL, 'x.x.x', '30.00', '25.00', NULL, '20.00', '150.00', 'Matematika', 'graded', 'Uconnelly.wilburn@nicolas.biz', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc2d6416d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (244, 1, 24, 48, 113, 2, 25, 25, 2, NULL, 'x.x.x', '10.00', '25.00', NULL, '47.00', '22.00', 'Kimia', 'graded', 'Ususana64@rogahn.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc393116d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (245, 1, 24, 48, 114, 2, 25, 25, 2, NULL, 'x.x.x', '48.00', '25.00', NULL, '44.00', '110.00', 'Kimia', 'graded', 'Ufelicita.schamberger@crona.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc3e8176d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (246, 1, 24, 48, 115, 2, 25, 25, 2, NULL, 'x.x.x', '10.00', '25.00', NULL, '17.00', '59.00', 'Kimia', 'graded', 'Ueric.lubowitz@schaefer.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc438b26d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (247, 1, 24, 48, 130, 2, 25, 25, 2, NULL, 'x.x.x', '46.00', '25.00', NULL, '11.00', '419.00', 'Kimia', 'graded', 'Ukacey85@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc487f56d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (248, 1, 24, 48, 131, 2, 25, 25, 2, NULL, 'x.x.x', '37.00', '25.00', NULL, '42.00', '89.00', 'Kimia', 'graded', 'Uconnelly.wilburn@nicolas.biz', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc4d87d6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (249, 1, 25, 49, 116, 2, 26, 24, 2, NULL, 'x.x.x', '31.00', '25.00', NULL, '30.00', '104.00', 'Matematika', 'graded', 'Utrace28@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc5653e6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (250, 1, 25, 49, 117, 2, 26, 24, 2, NULL, 'x.x.x', '22.00', '25.00', NULL, '34.00', '65.00', 'Matematika', 'graded', 'Uwilderman.garett@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc5bb8c6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (251, 1, 25, 49, 118, 2, 26, 24, 2, NULL, 'x.x.x', '24.00', '25.00', NULL, '35.00', '69.00', 'Matematika', 'graded', 'Ukmarks@senger.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc62d056d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (252, 1, 25, 49, 132, 2, 26, 24, 2, NULL, 'x.x.x', '15.00', '25.00', NULL, '14.00', '108.00', 'Matematika', 'graded', 'Ugaylord.janis@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc6a4c06d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (253, 1, 25, 50, 116, 2, 26, 25, 3, NULL, 'x.x.x', '44.00', '25.00', NULL, '21.00', '210.00', 'Kimia', 'graded', 'Utrace28@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc72d836d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (254, 1, 25, 50, 117, 2, 26, 25, 3, NULL, 'x.x.x', '17.00', '25.00', NULL, '49.00', '35.00', 'Kimia', 'graded', 'Uwilderman.garett@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc77e496d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (255, 1, 25, 50, 118, 2, 26, 25, 3, NULL, 'x.x.x', '14.00', '25.00', NULL, '33.00', '43.00', 'Kimia', 'graded', 'Ukmarks@senger.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc7cd3c6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (256, 1, 25, 50, 132, 2, 26, 25, 3, NULL, 'x.x.x', '38.00', '25.00', NULL, '30.00', '127.00', 'Kimia', 'graded', 'Ugaylord.janis@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc81d276d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (257, 1, 26, 51, 133, 2, 27, 24, 1, NULL, 'x.x.x', '26.00', '25.00', NULL, '15.00', '174.00', 'Matematika', 'graded', 'Udemarcus.mitchell@heller.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc8ca356d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (258, 1, 26, 51, 134, 2, 27, 24, 1, NULL, 'x.x.x', '33.00', '25.00', NULL, '19.00', '174.00', 'Matematika', 'graded', 'Ubernita02@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc92c9e6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (259, 1, 26, 51, 135, 2, 27, 24, 1, NULL, 'x.x.x', '19.00', '25.00', NULL, '41.00', '47.00', 'Matematika', 'graded', 'Ugulgowski.destini@herman.org', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdc97e646d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (260, 1, 26, 52, 133, 2, 27, 25, 3, NULL, 'x.x.x', '49.00', '25.00', NULL, '33.00', '149.00', 'Kimia', 'graded', 'Udemarcus.mitchell@heller.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdca02b26d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (261, 1, 26, 52, 134, 2, 27, 25, 3, NULL, 'x.x.x', '32.00', '25.00', NULL, '42.00', '77.00', 'Kimia', 'graded', 'Ubernita02@yahoo.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdca521b6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (262, 1, 26, 52, 135, 2, 27, 25, 3, NULL, 'x.x.x', '14.00', '25.00', NULL, '37.00', '38.00', 'Kimia', 'graded', 'Ugulgowski.destini@herman.org', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdcaad646d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (263, 1, 27, 53, 136, 2, 28, 24, 2, NULL, 'x.x.x', '35.00', '25.00', NULL, '13.00', '270.00', 'Matematika', 'graded', 'Ujillian.hill@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdcb50736d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (264, 1, 27, 53, 137, 2, 28, 24, 2, NULL, 'x.x.x', '15.00', '25.00', NULL, '22.00', '69.00', 'Matematika', 'graded', 'Ujeramie.stamm@towne.biz', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdcba3256d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (265, 1, 27, 54, 136, 2, 28, 25, 2, NULL, 'x.x.x', '48.00', '25.00', NULL, '33.00', '146.00', 'Kimia', 'graded', 'Ujillian.hill@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdcc25ed6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (266, 1, 27, 54, 137, 2, 28, 25, 2, NULL, 'x.x.x', '39.00', '25.00', NULL, '10.00', '390.00', 'Kimia', 'graded', 'Ujeramie.stamm@towne.biz', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdcc75c16d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (267, 1, 28, 55, 138, 2, 29, 24, 3, NULL, 'x.x.x', '31.00', '25.00', NULL, '50.00', '62.00', 'Matematika', 'graded', 'Ufgutkowski@kohler.org', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdccf19f6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (268, 1, 28, 56, 138, 2, 29, 25, 3, NULL, 'x.x.x', '32.00', '25.00', NULL, '46.00', '70.00', 'Kimia', 'graded', 'Ufgutkowski@kohler.org', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdcd80ad6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (269, 1, 29, 57, 139, 2, 30, 24, 3, NULL, 'x.x.x', '20.00', '25.00', NULL, '39.00', '52.00', 'Matematika', 'graded', 'Uustroman@gusikowski.net', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdce1a576d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (270, 1, 29, 57, 140, 2, 30, 24, 3, NULL, 'x.x.x', '28.00', '25.00', NULL, '23.00', '122.00', 'Matematika', 'graded', 'Uqfeest@hotmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdce6c566d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (271, 1, 29, 57, 141, 2, 30, 24, 3, NULL, 'x.x.x', '47.00', '25.00', NULL, '37.00', '128.00', 'Matematika', 'graded', 'Udbauch@pagac.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdcebe556d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (272, 1, 29, 57, 142, 2, 30, 24, 3, NULL, 'x.x.x', '45.00', '25.00', NULL, '13.00', '347.00', 'Matematika', 'graded', 'Ulhodkiewicz@bode.info', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdcf117b6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (273, 1, 29, 58, 139, 2, 30, 25, 3, NULL, 'x.x.x', '43.00', '25.00', NULL, '23.00', '187.00', 'Kimia', 'graded', 'Uustroman@gusikowski.net', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdcf9c176d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (274, 1, 29, 58, 140, 2, 30, 25, 3, NULL, 'x.x.x', '41.00', '25.00', NULL, '18.00', '228.00', 'Kimia', 'graded', 'Uqfeest@hotmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdcff8036d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (275, 1, 29, 58, 141, 2, 30, 25, 3, NULL, 'x.x.x', '44.00', '25.00', NULL, '32.00', '138.00', 'Kimia', 'graded', 'Udbauch@pagac.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdd065a06d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (276, 1, 29, 58, 142, 2, 30, 25, 3, NULL, 'x.x.x', '42.00', '25.00', NULL, '28.00', '150.00', 'Kimia', 'graded', 'Ulhodkiewicz@bode.info', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdd0b8a36d9b11ef90a7c858c0b7f92f');
INSERT INTO `tx_assessment` (`id`, `office_id`, `schedule_id`, `schedule_detail_id`, `participant_id`, `period_id`, `group_id`, `subject_id`, `subject_type`, `exam_type`, `app_version`, `earned_points`, `passing_score`, `passing_score_percent`, `gained_score`, `evaluate_score`, `quiz_title`, `quiz_type`, `username`, `time_limit`, `used_time`, `time_spent`, `work_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (277, 1, 30, 59, 143, 2, 31, 24, 2, NULL, 'x.x.x', '12.00', '25.00', NULL, '12.00', '100.00', 'Matematika', 'graded', 'Ukreichel@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdd13c5d6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (278, 1, 30, 59, 144, 2, 31, 24, 2, NULL, 'x.x.x', '10.00', '25.00', NULL, '24.00', '42.00', 'Matematika', 'graded', 'Uspencer.leonor@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdd18c256d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (279, 1, 30, 59, 145, 2, 31, 24, 2, NULL, 'x.x.x', '23.00', '25.00', NULL, '48.00', '48.00', 'Matematika', 'graded', 'Uleila.wilderman@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdd1db276d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (280, 1, 30, 60, 143, 2, 31, 25, 2, NULL, 'x.x.x', '28.00', '25.00', NULL, '35.00', '80.00', 'Kimia', 'graded', 'Ukreichel@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdd2791a6d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (281, 1, 30, 60, 144, 2, 31, 25, 2, NULL, 'x.x.x', '36.00', '25.00', NULL, '50.00', '72.00', 'Kimia', 'graded', 'Uspencer.leonor@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdd2fae66d9b11ef90a7c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               (282, 1, 30, 60, 145, 2, 31, 25, 2, NULL, 'x.x.x', '50.00', '25.00', NULL, '34.00', '148.00', 'Kimia', 'graded', 'Uleila.wilderman@gmail.com', NULL, NULL, NULL, 2, '2024-09-08 11:35:14', '2024-09-08 11:35:14', 1, 1, NULL, NULL, NULL, 0, 'bdd34ece6d9b11ef90a7c858c0b7f92f');

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
    (1, 1, 'SCD', 30, '2024-09-07 19:12:27', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 29, '72abc7996d1211efa121c858c0b7f92f');

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
                                                                                                                                                                                                        (22, 1, 'X1', 1, 'Kelas X1', '2024-09-07 10:19:30', '2024-09-07 10:19:30', 1, 1, NULL, NULL, NULL, 0, 'ff07a94e6cc711efac41c858c0b7f92f'),
                                                                                                                                                                                                        (23, 1, 'X3', 2, 'Kelas X3', '2024-09-07 10:19:30', '2024-09-07 10:19:30', 1, 1, NULL, NULL, NULL, 0, 'ff08426a6cc711efac41c858c0b7f92f'),
                                                                                                                                                                                                        (24, 1, 'XI 2', 3, 'Kelas XI 2', '2024-09-07 10:19:30', '2024-09-07 10:19:30', 1, 1, NULL, NULL, NULL, 0, 'ff08bc1f6cc711efac41c858c0b7f92f'),
                                                                                                                                                                                                        (25, 1, 'XI 3', 4, 'Kelas XI 3', '2024-09-07 10:19:30', '2024-09-07 10:19:30', 1, 1, NULL, NULL, NULL, 0, 'ff09614a6cc711efac41c858c0b7f92f'),
                                                                                                                                                                                                        (26, 1, 'XII-1', 5, 'Kelas XII-1', '2024-09-07 10:19:30', '2024-09-07 10:19:30', 1, 1, NULL, NULL, NULL, 0, 'ff0a17926cc711efac41c858c0b7f92f'),
                                                                                                                                                                                                        (27, 1, 'X1', 1, 'Kelas X1', '2024-09-07 19:12:16', '2024-09-07 19:12:16', 1, 1, NULL, NULL, NULL, 0, '6c10672f6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                        (28, 1, 'X3', 2, 'Kelas X3', '2024-09-07 19:12:16', '2024-09-07 19:12:16', 1, 1, NULL, NULL, NULL, 0, '6c12c7f46d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                        (29, 1, 'XI 2', 3, 'Kelas XI 2', '2024-09-07 19:12:16', '2024-09-07 19:12:16', 1, 1, NULL, NULL, NULL, 0, '6c13423d6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                        (30, 1, 'XI 3', 4, 'Kelas XI 3', '2024-09-07 19:12:16', '2024-09-07 19:12:16', 1, 1, NULL, NULL, NULL, 0, '6c14772a6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                        (31, 1, 'XII-1', 5, 'Kelas XII-1', '2024-09-07 19:12:16', '2024-09-07 19:12:16', 1, 1, NULL, NULL, NULL, 0, '6c1500b66d1211efa121c858c0b7f92f');

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
                                                                                                                                                                                                                                                                                          (99, 1, 22, 'Loy Fisher', 'lowe.eino@gmail.com', 'Ulowe.eino@gmail.com', '46d8b', 'dschimmel@hotmail.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '023655546cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (100, 1, 22, 'Jacquelyn Krajcik', 'felicia.pollich@beier.com', 'Ufelicia.pollich@beier.com', '9c244', 'neva.cole@hessel.net', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '023737f66cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (101, 1, 22, 'Kara Cremin', 'mgoldner@orn.biz', 'Umgoldner@orn.biz', 'e1b61', 'fritsch.flavio@yahoo.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '0237be5b6cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (102, 1, 22, 'Pat Schmeler', 'acormier@gmail.com', 'Uacormier@gmail.com', '754ef', 'hope09@hotmail.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '023845bc6cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (103, 1, 22, 'Chris Reilly', 'cbatz@leffler.com', 'Ucbatz@leffler.com', 'b5927', 'kacie52@abshire.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '02388ce66cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (104, 1, 22, 'Phoebe Cassin', 'feeney.ava@bergnaum.com', 'Ufeeney.ava@bergnaum.com', '8cb16', 'alexandria06@konopelski.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '0239c82c6cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (105, 1, 23, 'Reynold Ryan', 'sauer.barney@hotmail.com', 'Usauer.barney@hotmail.com', 'eb903', 'broderick65@schmitt.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '023bcca26cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (106, 1, 23, 'Ashley Altenwerth', 'bosco.kenny@hickle.com', 'Ubosco.kenny@hickle.com', 'b28a8', 'labadie.imani@wilderman.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '023c6e9a6cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (107, 1, 23, 'Clementine Schmitt', 'frankie.sanford@yahoo.com', 'Ufrankie.sanford@yahoo.com', '96b55', 'herman.rafaela@hegmann.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '023d576a6cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (108, 1, 23, 'Adriana Cole', 'mwhite@schowalter.com', 'Umwhite@schowalter.com', '0df26', 'stokes.lavada@davis.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '023de2a16cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (109, 1, 23, 'Delmer Watsica', 'wehner.maureen@yahoo.com', 'Uwehner.maureen@yahoo.com', '43a60', 'kirstin.pacocha@douglas.biz', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '023ecd846cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (110, 1, 24, 'Jadon Jerde', 'bdickens@yahoo.com', 'Ubdickens@yahoo.com', '01d32', 'doyle.edward@reilly.info', 3, '2024-09-07 11:19:17', 'QXOygQ6LB0T2QrhwGgLjwZjbTJvIaVxz', '2024-09-07 10:19:35', '2024-09-07 11:19:17', 1, NULL, NULL, NULL, NULL, 1, '023fdb0f6cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (111, 1, 24, 'Estevan Rempel', 'lon.quigley@yahoo.com', 'Ulon.quigley@yahoo.com', '29cd3', 'leatha.kuhic@yahoo.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '0240c12f6cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (112, 1, 24, 'Olin Wiegand', 'summer86@hotmail.com', 'Usummer86@hotmail.com', '6d1af', 'milan14@klocko.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '02410df26cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (113, 1, 25, 'Vincenza Marvin', 'susana64@rogahn.com', 'Ususana64@rogahn.com', '39d2a', 'scorkery@schinner.com', 3, '2024-09-07 14:27:30', '-9TnRuoJ6AvYp40XHeNk_lOe_MSK2CB5', '2024-09-07 10:19:35', '2024-09-07 14:27:30', 1, NULL, NULL, NULL, NULL, 1, '024194de6cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (114, 1, 25, 'Gail Hansen', 'felicita.schamberger@crona.com', 'Ufelicita.schamberger@crona.com', '94c99', 'hmedhurst@gmail.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '024456986cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (115, 1, 25, 'Kathryn McGlynn', 'eric.lubowitz@schaefer.com', 'Ueric.lubowitz@schaefer.com', '3fe83', 'lsauer@koss.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '024553206cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (116, 1, 26, 'Silas Kuvalis', 'trace28@yahoo.com', 'Utrace28@yahoo.com', '2a119', 'mrowe@davis.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '02479dc56cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (117, 1, 26, 'Krystel Ledner', 'wilderman.garett@yahoo.com', 'Uwilderman.garett@yahoo.com', '31294', 'reinger.kayden@von.biz', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '0249bfad6cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (118, 1, 26, 'Deon Kuvalis', 'kmarks@senger.com', 'Ukmarks@senger.com', '4fd39', 'tnolan@considine.com', 2, NULL, NULL, '2024-09-07 10:19:35', '2024-09-07 10:19:35', 1, 1, NULL, NULL, NULL, 0, '024b5bb86cc811efac41c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (119, 1, 22, 'Israel Lindgren', 'oferry@gmail.com', 'Uoferry@gmail.com', 'a36fb', 'antwan76@gmail.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fa60aaa6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (120, 1, 22, 'Nico Lemke', 'daphne.marquardt@gmail.com', 'Udaphne.marquardt@gmail.com', 'e0e6d', 'allison.torp@gmail.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fa6f3a06d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (121, 1, 22, 'Russell Zulauf', 'aric.herman@hotmail.com', 'Uaric.herman@hotmail.com', '06f96', 'vhowell@hotmail.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fa74ed06d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (122, 1, 23, 'Easton Fay', 'turcotte.zita@hyatt.net', 'Uturcotte.zita@hyatt.net', 'd986b', 'aryanna.lindgren@purdy.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fa7c7676d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (123, 1, 23, 'Lambert Gleason', 'adah.cruickshank@oberbrunner.info', 'Uadah.cruickshank@oberbrunner.info', '4e325', 'cody.hettinger@yahoo.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fa833df6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (124, 1, 23, 'Sydni Beahan', 'sbergstrom@yahoo.com', 'Usbergstrom@yahoo.com', '3d55d', 'okuneva.zachery@roberts.org', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fa8ae5b6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (125, 1, 23, 'Vilma Altenwerth', 'huel.macie@yahoo.com', 'Uhuel.macie@yahoo.com', '4fecb', 'bogan.mateo@hotmail.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fa8f64f6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (126, 1, 23, 'Ned Gutkowski', 'rose96@kozey.com', 'Urose96@kozey.com', '09c1a', 'hyatt.bradley@okeefe.info', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fa99f1e6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (127, 1, 23, 'Mac Witting', 'bobbie23@yahoo.com', 'Ubobbie23@yahoo.com', 'a919c', 'hartmann.roxanne@shanahan.info', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fa9f3a56d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (128, 1, 24, 'Kendall Reinger', 'amacejkovic@yahoo.com', 'Uamacejkovic@yahoo.com', '3b755', 'west.roy@yahoo.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6faad18f6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (129, 1, 24, 'Coralie Kunze', 'giovanna.hilpert@hermiston.com', 'Ugiovanna.hilpert@hermiston.com', '6fba1', 'aimee.beier@runolfsdottir.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fab50786d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (130, 1, 25, 'Lenny Gorczany', 'kacey85@gmail.com', 'Ukacey85@gmail.com', 'ca572', 'frederic46@hotmail.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fabf4ff6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (131, 1, 25, 'Norma Gleason', 'connelly.wilburn@nicolas.biz', 'Uconnelly.wilburn@nicolas.biz', '760cc', 'pschneider@hansen.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fad23ce6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (132, 1, 26, 'Peter D\'Amore', 'gaylord.janis@yahoo.com', 'Ugaylord.janis@yahoo.com', 'c1ac0', 'saige39@muller.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fadc83b6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (133, 1, 27, 'Fausto Breitenberg', 'demarcus.mitchell@heller.com', 'Udemarcus.mitchell@heller.com', 'bdce6', 'euna87@hotmail.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fafd47f6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (134, 1, 27, 'Agustina Crona', 'bernita02@yahoo.com', 'Ubernita02@yahoo.com', 'fe986', 'xwalker@bashirian.org', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb01ace6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (135, 1, 27, 'Murphy Gutmann', 'gulgowski.destini@herman.org', 'Ugulgowski.destini@herman.org', 'f2c96', 'king.everardo@gmail.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb05b046d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (136, 1, 28, 'Augustine Romaguera', 'jillian.hill@gmail.com', 'Ujillian.hill@gmail.com', 'b1a8a', 'christophe.jerde@kozey.net', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb0db906d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (137, 1, 28, 'Sandra Eichmann', 'jeramie.stamm@towne.biz', 'Ujeramie.stamm@towne.biz', '20762', 'glover.efrain@gmail.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb169e66d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (138, 1, 29, 'Ardith Strosin', 'fgutkowski@kohler.org', 'Ufgutkowski@kohler.org', 'c104f', 'krutherford@bruen.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb363496d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (139, 1, 30, 'Eloise DuBuque', 'ustroman@gusikowski.net', 'Uustroman@gusikowski.net', 'ea445', 'oberbrunner.shyanne@yahoo.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb4510b6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (140, 1, 30, 'Carlee Cruickshank', 'qfeest@hotmail.com', 'Uqfeest@hotmail.com', 'c685b', 'rsmith@reichel.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb492e96d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (141, 1, 30, 'Eulah Little', 'dbauch@pagac.com', 'Udbauch@pagac.com', '6408a', 'mcglynn.mae@yahoo.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb4d1336d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (142, 1, 30, 'Donavon Cruickshank', 'lhodkiewicz@bode.info', 'Ulhodkiewicz@bode.info', 'd6e78', 'sam62@okon.net', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb50fc06d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (143, 1, 31, 'Emie Runolfsson', 'kreichel@gmail.com', 'Ukreichel@gmail.com', '2595c', 'mayer.dayton@yahoo.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb6421e6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (144, 1, 31, 'Brian Trantow', 'spencer.leonor@gmail.com', 'Uspencer.leonor@gmail.com', '9501e', 'parker.alejandrin@hotmail.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb683a86d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                          (145, 1, 31, 'Noemy Goldner', 'leila.wilderman@gmail.com', 'Uleila.wilderman@gmail.com', '29fd1', 'ipfeffer@yahoo.com', 2, NULL, NULL, '2024-09-07 19:12:22', '2024-09-07 19:12:22', 1, 1, NULL, NULL, NULL, 0, '6fb6c2f46d1211efa121c858c0b7f92f');

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
                                                                                                                                                                                                                                                                                                                         (21, 1, '00021', 2, 22, 2, 1, NULL, '2024-09-07 19:19:34', '2024-09-07 21:19:34', '709673', '2024-09-07 19:19:34', NULL, NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '71148c856d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (22, 1, '00022', 2, 23, 2, 1, NULL, '2024-09-07 22:19:34', '2024-09-08 00:19:34', '133520', '2024-09-07 22:19:34', NULL, NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '7117741f6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (23, 1, '00023', 2, 24, 2, 1, NULL, '2024-09-08 01:19:34', '2024-09-08 03:19:34', '205525', '2024-09-08 01:19:34', NULL, NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '71193fb16d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (24, 1, '00024', 2, 25, 2, 1, NULL, '2024-09-08 04:19:34', '2024-09-08 06:19:34', '374840', '2024-09-08 04:19:34', NULL, NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711b3ae46d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (25, 1, '00025', 2, 26, 2, 1, NULL, '2024-09-08 07:19:34', '2024-09-08 09:19:34', '317950', '2024-09-08 07:19:34', NULL, NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711cf2656d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (26, 1, '00026', 2, 27, 2, 1, NULL, '2024-09-08 10:19:34', '2024-09-08 12:19:34', '231790', '2024-09-08 10:19:34', NULL, NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711ec2de6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (27, 1, '00027', 2, 28, 2, 1, NULL, '2024-09-08 13:19:34', '2024-09-08 15:19:34', '681640', '2024-09-08 13:19:34', NULL, NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '712061866d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (28, 1, '00028', 2, 29, 2, 1, NULL, '2024-09-08 16:19:34', '2024-09-08 18:19:34', '463535', '2024-09-08 16:19:34', NULL, NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '712209076d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (29, 1, '00029', 2, 30, 2, 1, NULL, '2024-09-08 19:19:34', '2024-09-08 21:19:34', '203427', '2024-09-08 19:19:34', NULL, NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '7123fe5a6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                                                                                         (30, 1, '00030', 2, 31, 2, 1, NULL, '2024-09-08 22:19:34', '2024-09-09 00:19:34', '763517', '2024-09-07 19:23:13', NULL, NULL, '2024-09-07 19:19:34', '2024-09-07 19:23:13', 1, 1, NULL, NULL, NULL, 2, '7125f8556d1311efa121c858c0b7f92f');

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

--
-- Dumping data for table `tx_schedule_detail`
--

INSERT INTO `tx_schedule_detail` (`id`, `office_id`, `schedule_id`, `subject_id`, `subject_type`, `remark`, `asset_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`) VALUES
                                                                                                                                                                                                                                                   (41, 1, 21, 24, 3, 'Matematika', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '71161a0d6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (42, 1, 21, 25, 1, 'Kimia', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711685d86d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (43, 1, 22, 24, 2, 'Matematika', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '71180bda6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (44, 1, 22, 25, 3, 'Kimia', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711858306d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (45, 1, 23, 24, 3, 'Matematika', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '7119f7f26d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (46, 1, 23, 25, 3, 'Kimia', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711a561b6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (47, 1, 24, 24, 2, 'Matematika', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711bf8a96d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (48, 1, 24, 25, 2, 'Kimia', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711c48056d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (49, 1, 25, 24, 2, 'Matematika', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711d8dae6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (50, 1, 25, 25, 3, 'Kimia', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711e17fb6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (51, 1, 26, 24, 1, 'Matematika', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711f57b96d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (52, 1, 26, 25, 3, 'Kimia', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '711fa4756d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (53, 1, 27, 24, 2, 'Matematika', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '71210c2d6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (54, 1, 27, 25, 2, 'Kimia', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '71215eda6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (55, 1, 28, 24, 3, 'Matematika', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '7122c4ed6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (56, 1, 28, 25, 3, 'Kimia', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '7123316d6d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (57, 1, 29, 24, 3, 'Matematika', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '7124a9446d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (58, 1, 29, 25, 3, 'Kimia', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '71251c406d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (59, 1, 30, 24, 2, 'Matematika', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '7126bf986d1311efa121c858c0b7f92f'),
                                                                                                                                                                                                                                                   (60, 1, 30, 25, 2, 'Kimia', NULL, '2024-09-07 19:19:34', '2024-09-07 19:19:34', 1, 1, NULL, NULL, NULL, 0, '7127255b6d1311efa121c858c0b7f92f');

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
                                                      ('e6dpbs5uf837egi8ik1u64qm17', 1725769863, 0x5f5f666c6173687c613a303a7b7d),
                                                      ('pa209mgo352ele2plrk9h65eao', 1725773870, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33323a226530656538647744706c4c5661476c4b475a74654d5371507031696b4a46516d223b);

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
                                                                                                                                                                                                          (24, 1, 'Matematika', 1, 'Matematika', '2024-09-07 10:19:25', '2024-09-07 10:19:25', 1, 1, NULL, NULL, NULL, 0, 'fc19dc0d6cc711efac41c858c0b7f92f'),
                                                                                                                                                                                                          (25, 1, 'Kimia', 2, 'Kimia', '2024-09-07 10:19:25', '2024-09-07 10:19:25', 1, 1, NULL, NULL, NULL, 0, 'fc1b6ba36cc711efac41c858c0b7f92f'),
                                                                                                                                                                                                          (26, 1, 'Fisika', 3, 'Fisika', '2024-09-07 10:19:25', '2024-09-07 10:19:25', 1, 1, NULL, NULL, NULL, 0, 'fc1c53b66cc711efac41c858c0b7f92f'),
                                                                                                                                                                                                          (27, 1, 'Bahasa Indonesia', 4, 'Bahasa Indonesia', '2024-09-07 10:19:25', '2024-09-07 10:19:25', 1, 1, NULL, NULL, NULL, 0, 'fc1d33a16cc711efac41c858c0b7f92f'),
                                                                                                                                                                                                          (28, 1, 'Sejarah', 5, 'Sejarah', '2024-09-07 10:19:25', '2024-09-07 10:19:25', 1, 1, NULL, NULL, NULL, 0, 'fc1dee826cc711efac41c858c0b7f92f'),
                                                                                                                                                                                                          (29, 1, 'Matematika', 1, 'Matematika', '2024-09-07 19:12:12', '2024-09-07 19:12:12', 1, 1, NULL, NULL, NULL, 0, '69a9d6b96d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                          (30, 1, 'Kimia', 2, 'Kimia', '2024-09-07 19:12:12', '2024-09-07 19:12:12', 1, 1, NULL, NULL, NULL, 0, '69ac62466d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                          (31, 1, 'Fisika', 3, 'Fisika', '2024-09-07 19:12:12', '2024-09-07 19:12:12', 1, 1, NULL, NULL, NULL, 0, '69acfb576d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                          (32, 1, 'Bahasa Indonesia', 4, 'Bahasa Indonesia', '2024-09-07 19:12:12', '2024-09-07 19:12:12', 1, 1, NULL, NULL, NULL, 0, '69ad8fdb6d1211efa121c858c0b7f92f'),
                                                                                                                                                                                                          (33, 1, 'Sejarah', 5, 'Sejarah', '2024-09-07 19:12:12', '2024-09-07 19:12:12', 1, 1, NULL, NULL, NULL, 0, '69ae07a06d1211efa121c858c0b7f92f');

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
    (1, 'admin', 'ombakrinai@gmail.com', '$2y$10$oD129/e5PjrTkIV1yiR3AuOc2/XAOXLWgKPfb8svo8BdBA4PUsw3G', 'e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm', NULL, NULL, 0, NULL, NULL, 1675777211, 1675777211, 1725766323, NULL, 0);

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tx_schedule_detail`
--
ALTER TABLE `tx_schedule_detail`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
