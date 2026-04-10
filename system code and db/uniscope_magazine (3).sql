-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2026 at 04:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniscope_magazine`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `academic_year_id` int(10) UNSIGNED NOT NULL,
  `year_name` varchar(20) NOT NULL COMMENT 'e.g. 2025-2026',
  `submission_opens` date DEFAULT NULL COMMENT 'Optional: when submissions open',
  `initial_closure` date NOT NULL COMMENT 'No new submissions after this date',
  `final_closure` date NOT NULL COMMENT 'No edits after this date',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`academic_year_id`, `year_name`, `submission_opens`, `initial_closure`, `final_closure`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '2026', '2026-02-12', '2026-03-09', '2026-03-10', 1, '2026-02-13 17:36:43', '2026-03-11 08:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `submission_id` int(10) UNSIGNED NOT NULL,
  `coordinator_id` int(10) UNSIGNED NOT NULL,
  `comment_text` text NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `submission_id`, `coordinator_id`, `comment_text`, `comment_date`) VALUES
(6, 11, 17, 'Good', '2026-02-22 08:10:38'),
(7, 10, 17, 'Nice', '2026-02-22 08:11:11'),
(8, 9, 17, 'Bad', '2026-02-22 08:11:26'),
(10, 15, 17, 'Awesome post', '2026-02-25 09:46:17'),
(11, 19, 17, 'Good Job!', '2026-03-10 23:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `comment_replies`
--

CREATE TABLE `comment_replies` (
  `reply_id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reply_text` text NOT NULL,
  `reply_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_replies`
--

INSERT INTO `comment_replies` (`reply_id`, `comment_id`, `user_id`, `reply_text`, `reply_date`) VALUES
(1, 6, 19, 'Thanks, do you think i should improve?', '2026-03-10 23:40:10'),
(2, 6, 17, 'Yes', '2026-03-10 23:47:23'),
(3, 11, 21, 'Thanks! Do you think i should improve?', '2026-03-10 23:58:40');

-- --------------------------------------------------------

--
-- Table structure for table `coordinator_faculties`
--

CREATE TABLE `coordinator_faculties` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `assigned_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coordinator_faculties`
--

INSERT INTO `coordinator_faculties` (`user_id`, `faculty_id`, `assigned_at`) VALUES
(17, 2, '2026-02-17 17:02:51'),
(17, 4, '2026-02-17 17:02:51'),
(22, 3, '2026-03-09 15:36:42');

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE `email_log` (
  `email_log_id` int(10) UNSIGNED NOT NULL,
  `recipient_id` int(10) UNSIGNED DEFAULT NULL,
  `email_type` varchar(80) NOT NULL COMMENT 'e.g. submission_confirmation, comment_added',
  `sent_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'sent' COMMENT 'sent, failed',
  `error_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_log`
--

INSERT INTO `email_log` (`email_log_id`, `recipient_id`, `email_type`, `sent_at`, `status`, `error_message`) VALUES
(1, NULL, 'password_reset', '2026-02-09 19:27:48', 'failed', 'mail() failed'),
(2, NULL, 'password_reset', '2026-02-09 20:44:40', 'sent', NULL),
(3, NULL, 'password_reset', '2026-02-09 20:49:08', 'sent', NULL),
(4, NULL, 'password_reset', '2026-02-09 21:00:07', 'sent', NULL),
(5, NULL, 'password_reset', '2026-02-09 21:01:12', 'sent', NULL),
(6, NULL, 'password_reset', '2026-02-09 21:03:54', 'sent', NULL),
(7, NULL, 'new_account_credentials', '2026-02-13 14:08:31', 'sent', NULL),
(8, NULL, 'new_account_credentials', '2026-02-13 14:15:42', 'sent', NULL),
(9, NULL, 'new_account_credentials', '2026-02-13 14:17:57', 'sent', NULL),
(10, NULL, 'new_account_credentials', '2026-02-13 14:19:21', 'sent', NULL),
(11, NULL, 'new_account_credentials', '2026-02-13 14:29:29', 'sent', NULL),
(12, NULL, 'new_account_credentials', '2026-02-13 14:34:27', 'sent', NULL),
(13, NULL, 'password_reset', '2026-02-13 14:47:26', 'sent', NULL),
(14, NULL, 'password_reset', '2026-02-13 14:53:59', 'sent', NULL),
(15, NULL, 'password_reset', '2026-02-13 14:57:07', 'sent', NULL),
(16, NULL, 'password_reset', '2026-02-13 14:57:46', 'sent', NULL),
(17, NULL, 'password_reset', '2026-02-13 14:58:00', 'sent', NULL),
(18, NULL, 'password_reset', '2026-02-13 14:59:14', 'sent', NULL),
(19, NULL, 'submission_confirmation', '2026-02-13 17:56:22', 'sent', NULL),
(20, NULL, 'new_submission', '2026-02-13 18:03:34', 'sent', NULL),
(21, NULL, 'submission_confirmation', '2026-02-13 18:03:38', 'sent', NULL),
(22, NULL, 'new_submission', '2026-02-13 18:17:03', 'sent', NULL),
(23, NULL, 'submission_confirmation', '2026-02-13 18:17:07', 'sent', NULL),
(24, NULL, 'new_submission', '2026-02-13 18:19:02', 'sent', NULL),
(25, NULL, 'submission_confirmation', '2026-02-13 18:19:06', 'sent', NULL),
(26, NULL, 'new_submission', '2026-02-15 18:21:44', 'sent', NULL),
(27, NULL, 'submission_confirmation', '2026-02-15 18:21:47', 'sent', NULL),
(28, NULL, 'password_reset', '2026-02-15 18:23:26', 'sent', NULL),
(29, NULL, 'submission_confirmation', '2026-02-15 18:25:22', 'sent', NULL),
(30, NULL, 'new_account_credentials', '2026-02-15 18:37:29', 'sent', NULL),
(31, NULL, 'new_submission', '2026-02-15 18:41:53', 'sent', NULL),
(32, NULL, 'new_submission', '2026-02-15 18:41:56', 'sent', NULL),
(33, NULL, 'submission_confirmation', '2026-02-15 18:41:59', 'sent', NULL),
(34, NULL, 'comment_added', '2026-02-15 18:43:21', 'sent', NULL),
(35, NULL, 'comment_added', '2026-02-15 18:46:25', 'sent', NULL),
(36, NULL, 'comment_added', '2026-02-15 18:55:11', 'sent', NULL),
(37, NULL, 'selection_decision', '2026-02-15 18:55:56', 'sent', NULL),
(38, NULL, 'selection_decision', '2026-02-15 19:13:20', 'sent', NULL),
(39, NULL, 'new_account_credentials', '2026-02-15 19:26:03', 'sent', NULL),
(40, 16, 'new_account_credentials', '2026-02-17 17:01:34', 'sent', NULL),
(41, 18, 'new_account_credentials', '2026-02-17 17:03:25', 'sent', NULL),
(42, 17, 'new_submission', '2026-02-21 17:37:50', 'sent', NULL),
(43, 19, 'submission_confirmation', '2026-02-21 17:37:53', 'sent', NULL),
(44, 17, 'new_submission', '2026-02-21 17:38:15', 'sent', NULL),
(45, 19, 'submission_confirmation', '2026-02-21 17:38:18', 'sent', NULL),
(46, 17, 'new_submission', '2026-02-21 17:38:56', 'sent', NULL),
(47, 19, 'submission_confirmation', '2026-02-21 17:38:58', 'sent', NULL),
(48, 17, 'new_submission', '2026-02-22 07:41:00', 'sent', NULL),
(49, 19, 'submission_confirmation', '2026-02-22 07:41:03', 'sent', NULL),
(50, 19, 'comment_added', '2026-02-22 08:10:41', 'sent', NULL),
(51, 19, 'comment_added', '2026-02-22 08:11:14', 'sent', NULL),
(52, 19, 'selection_decision', '2026-02-22 08:11:19', 'sent', NULL),
(53, 19, 'comment_added', '2026-02-22 08:11:28', 'sent', NULL),
(54, 19, 'rejection_decision', '2026-02-22 08:11:33', 'sent', NULL),
(55, 17, 'new_submission', '2026-02-23 20:00:22', 'sent', NULL),
(56, 19, 'submission_confirmation', '2026-02-23 20:00:25', 'sent', NULL),
(57, 17, 'new_submission', '2026-02-24 23:11:38', 'sent', NULL),
(58, 19, 'submission_confirmation', '2026-02-24 23:11:41', 'sent', NULL),
(59, 17, 'new_submission', '2026-02-24 23:24:43', 'sent', NULL),
(60, 19, 'submission_confirmation', '2026-02-24 23:24:45', 'sent', NULL),
(61, 19, 'comment_added', '2026-02-25 08:38:50', 'sent', NULL),
(62, 19, 'comment_added', '2026-02-25 09:46:21', 'sent', NULL),
(63, 19, 'selection_decision', '2026-02-25 09:54:50', 'sent', NULL),
(64, 19, 'selection_decision', '2026-02-25 09:55:02', 'sent', NULL),
(65, 19, 'selection_decision', '2026-02-25 10:03:36', 'sent', NULL),
(66, 19, 'selection_decision', '2026-02-25 10:21:59', 'sent', NULL),
(67, 19, 'rejection_decision', '2026-02-25 12:50:02', 'sent', NULL),
(68, 19, 'selection_decision', '2026-02-25 12:50:58', 'sent', NULL),
(69, 17, 'password_reset', '2026-03-10 23:17:45', 'sent', NULL),
(70, 17, 'password_reset', '2026-03-10 23:23:09', 'sent', NULL),
(71, 17, 'password_reset', '2026-03-10 23:26:53', 'sent', NULL),
(72, 17, 'password_reset', '2026-03-10 23:29:02', 'sent', NULL),
(73, 17, 'password_reset', '2026-03-10 23:36:29', 'sent', NULL),
(74, 17, 'password_reset', '2026-03-10 23:37:22', 'sent', NULL),
(75, 17, 'new_submission', '2026-03-10 23:51:57', 'sent', NULL),
(76, 22, 'new_submission', '2026-03-10 23:52:01', 'sent', NULL),
(77, 21, 'submission_confirmation', '2026-03-10 23:52:04', 'sent', NULL),
(78, 21, 'comment_added', '2026-03-10 23:54:23', 'sent', NULL),
(79, 22, 'new_submission', '2026-03-11 08:19:50', 'sent', NULL),
(80, 28, 'submission_confirmation', '2026-03-11 08:19:53', 'sent', NULL),
(81, 28, 'selection_decision', '2026-03-11 08:20:43', 'sent', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `faculty_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`faculty_id`, `faculty_name`, `description`, `created_at`) VALUES
(1, 'Faculty of Engineering', NULL, '2026-02-07 23:12:54'),
(2, 'Faculty of Arts', NULL, '2026-02-07 23:13:55'),
(3, 'Faculty of Science', NULL, '2026-02-07 23:14:04'),
(4, 'Faculty of Business', NULL, '2026-02-07 23:14:12'),
(5, 'Faculty of Computing', 'Testing faculty', '2026-03-09 15:36:42');

-- --------------------------------------------------------

--
-- Table structure for table `guest_access`
--

CREATE TABLE `guest_access` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `can_view_selected` tinyint(1) NOT NULL DEFAULT 1,
  `can_view_statistics` tinyint(1) NOT NULL DEFAULT 0,
  `can_download_files` tinyint(1) NOT NULL DEFAULT 0,
  `can_add_comments` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guest_access`
--

INSERT INTO `guest_access` (`user_id`, `can_view_selected`, `can_view_statistics`, `can_download_files`, `can_add_comments`) VALUES
(16, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `submission_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Optional link to article',
  `file_path` varchar(500) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL COMMENT 'Size in bytes',
  `dimensions` varchar(50) DEFAULT NULL COMMENT 'e.g. 1920x1080',
  `upload_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `student_id`, `submission_id`, `file_path`, `file_name`, `file_size`, `dimensions`, `upload_date`) VALUES
(3, 19, 11, 'images/19/20260222054103_the-way-of-samurai-k5.jpg', 'the-way-of-samurai-k5.jpg', 3999787, '5120x2880', '2026-02-22 07:41:03');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `token_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token_hash` varchar(64) NOT NULL COMMENT 'SHA-256 of token',
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`token_id`, `user_id`, `token_hash`, `expires_at`, `created_at`) VALUES
(18, 17, 'fbef6f1ef766d1016348a6423912b6774aec7c66b568d34158c50794dce8be28', '2026-03-10 22:36:26', '2026-03-10 23:36:26'),
(19, 17, '656d5be9b84397105deefd04cb2e83f4f3d448bccfaa953d6f62021b50f6488a', '2026-03-10 22:37:19', '2026-03-10 23:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(4, 'Administrator'),
(5, 'Guest'),
(2, 'Marketing Coordinator'),
(3, 'Marketing Manager'),
(1, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `academic_year_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL COMMENT 'Size in bytes',
  `submission_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_modified_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`submission_id`, `student_id`, `faculty_id`, `academic_year_id`, `title`, `file_path`, `file_name`, `file_size`, `submission_date`, `last_modified_at`, `status_id`) VALUES
(9, 19, 4, 1, 'Upload 2', 'articles/19/20260221153812_COMP_1770_Coursework_by_Karndeep_Singh.docx', 'COMP 1770 Coursework by Karndeep Singh.docx', 202178, '2026-02-21 17:38:12', '2026-02-22 08:11:30', 6),
(10, 19, 4, 1, 'Coursework', 'articles/19/20260221153853_COMP1806_2025_Bhamrah_Igraneza_Kallah_Eweillar.docx', 'COMP1806_2025_Bhamrah_Igraneza_Kallah_Eweillar.docx', 41606, '2026-02-21 17:38:53', '2026-02-22 08:11:16', 5),
(11, 19, 4, 1, 'Upload with image', 'articles/19/20260222054056_COMP1649_Coursework_Doc_by_Karndeep_Singh.docx', 'COMP1649 Coursework Doc by Karndeep Singh.docx', 1930504, '2026-02-22 07:40:56', '2026-02-22 08:10:38', 4),
(12, 19, 4, 1, 'Draft example', 'articles/19/20260222063749_COMP1649_Coursework_Doc_by_Karndeep_Singh.docx', 'COMP1649_Coursework_Doc_by_Karndeep_Singh.docx', 23277, '2026-02-22 08:37:49', '2026-02-22 08:37:49', 1),
(13, 19, 4, 1, 'Project', 'articles/19/20260223180019_For_Project.docx', 'For Project.docx', 34237, '2026-02-23 20:00:19', '2026-02-25 08:38:46', 4),
(15, 19, 4, 1, 'EDWS Coursework', 'articles/19/20260224212439_For_Project.docx', 'For Project.docx', 34237, '2026-02-24 23:24:39', '2026-02-25 12:50:55', 5),
(16, 19, 4, 1, 'Test article – 15 days ago', 'articles/1/test_15_days_ago.docx', 'test_15_days_ago.docx', 12345, '2026-02-09 10:00:00', '2026-02-24 23:57:49', 2),
(17, 19, 4, 1, 'Test article – 20 days ago', 'articles/1/test_20_days_ago.docx', 'test_20_days_ago.docx', 12345, '2026-02-04 10:00:00', '2026-02-25 08:20:30', 3),
(18, 19, 4, 1, 'Test article – 8 days ago', 'articles/1/test_8_days_ago.docx', 'test_8_days_ago.docx', 12345, '2026-02-16 10:00:00', '2026-02-24 23:59:18', 3),
(19, 21, 2, 1, 'Article Test', 'articles/21/20260310215154_gantt_chart.docx', 'gantt chart.docx', 178739, '2026-03-10 23:51:54', '2026-03-10 23:54:20', 4),
(20, 28, 3, 1, 'Test Doc', 'articles/28/20260311061946_gantt_chart.docx', 'gantt chart.docx', 178739, '2026-03-11 08:19:46', '2026-03-11 08:20:39', 5);

-- --------------------------------------------------------

--
-- Table structure for table `submission_statuses`
--

CREATE TABLE `submission_statuses` (
  `status_id` int(10) UNSIGNED NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `submission_statuses`
--

INSERT INTO `submission_statuses` (`status_id`, `status_name`) VALUES
(4, 'Commented'),
(1, 'Draft'),
(6, 'Rejected'),
(3, 'Reviewing'),
(5, 'Selected'),
(2, 'Submitted');

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `page_visited` varchar(255) DEFAULT NULL,
  `action_taken` varchar(100) DEFAULT NULL,
  `log_time` datetime NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  `browser` varchar(150) DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL COMMENT 'mobile, tablet, desktop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_logs`
--

INSERT INTO `system_logs` (`log_id`, `user_id`, `page_visited`, `action_taken`, `log_time`, `ip_address`, `browser`, `device_type`) VALUES
(1, NULL, '/Uni_Scope/coordinator/review.php', NULL, '2026-02-07 23:40:53', '::1', 'Chrome', 'desktop'),
(2, NULL, '/Uni_Scope/coordinator/review.php?filter=pending', NULL, '2026-02-07 23:40:54', '::1', 'Chrome', 'desktop'),
(3, NULL, '/Uni_Scope/coordinator/review.php?filter=commented', NULL, '2026-02-07 23:40:54', '::1', 'Chrome', 'desktop'),
(4, NULL, '/Uni_Scope/coordinator/review.php?filter=selected', NULL, '2026-02-07 23:40:54', '::1', 'Chrome', 'desktop'),
(5, NULL, '/Uni_Scope/coordinator/review.php', NULL, '2026-02-07 23:40:55', '::1', 'Chrome', 'desktop'),
(6, NULL, '/Uni_Scope/dashboard.php', NULL, '2026-02-07 23:40:55', '::1', 'Chrome', 'desktop'),
(7, NULL, '/Uni_Scope/dashboard.php', NULL, '2026-02-07 23:40:57', '::1', 'Chrome', 'desktop'),
(8, NULL, '/Uni_Scope/coordinator/review.php', NULL, '2026-02-07 23:40:57', '::1', 'Chrome', 'desktop'),
(9, NULL, '/Uni_Scope/dashboard.php', NULL, '2026-02-07 23:40:58', '::1', 'Chrome', 'desktop'),
(10, NULL, '/Uni_Scope/coordinator/statistics.php', NULL, '2026-02-07 23:40:59', '::1', 'Chrome', 'desktop'),
(11, NULL, '/Uni_Scope/dashboard.php', NULL, '2026-02-07 23:41:04', '::1', 'Chrome', 'desktop'),
(12, NULL, '/Uni_Scope/dashboard.php', NULL, '2026-02-07 23:47:41', '::1', 'Chrome', 'desktop'),
(13, NULL, '/Uni_Scope/coordinator/review.php', NULL, '2026-02-07 23:47:43', '::1', 'Chrome', 'desktop'),
(14, NULL, '/Uni_Scope/coordinator/review.php?filter=pending', NULL, '2026-02-07 23:47:44', '::1', 'Chrome', 'desktop'),
(15, NULL, '/Uni_Scope/coordinator/review.php?filter=commented', NULL, '2026-02-07 23:47:44', '::1', 'Chrome', 'desktop'),
(16, NULL, '/Uni_Scope/coordinator/review.php', NULL, '2026-02-07 23:47:45', '::1', 'Chrome', 'desktop'),
(17, NULL, '/Uni_Scope/dashboard.php', NULL, '2026-02-07 23:47:46', '::1', 'Chrome', 'desktop'),
(18, NULL, '/Uni_Scope/coordinator/review.php', NULL, '2026-02-07 23:47:47', '::1', 'Chrome', 'desktop'),
(19, NULL, '/Uni_Scope/dashboard.php', NULL, '2026-02-07 23:47:48', '::1', 'Chrome', 'desktop'),
(20, NULL, '/Uni_Scope/logout.php', NULL, '2026-02-07 23:47:49', '::1', 'Chrome', 'desktop'),
(21, 1, '/Uni_Scope/index.php', NULL, '2026-02-07 23:48:00', '::1', 'Chrome', 'desktop'),
(22, 1, '/Uni_Scope/dashboard.php?role=admin', NULL, '2026-02-07 23:48:00', '::1', 'Chrome', 'desktop'),
(23, 1, '/Uni_Scope/admin/index.php', NULL, '2026-02-07 23:48:01', '::1', 'Chrome', 'desktop'),
(24, 1, '/Uni_Scope/admin/faculties.php', NULL, '2026-02-07 23:48:06', '::1', 'Chrome', 'desktop'),
(25, 1, '/Uni_Scope/admin/faculties.php?edit=2', NULL, '2026-02-07 23:48:08', '::1', 'Chrome', 'desktop'),
(26, 1, '/Uni_Scope/admin/faculties.php', NULL, '2026-02-07 23:48:11', '::1', 'Chrome', 'desktop'),
(27, 1, '/Uni_Scope/admin/faculties.php?edit=4', NULL, '2026-02-07 23:48:12', '::1', 'Chrome', 'desktop'),
(28, 1, '/Uni_Scope/admin/faculties.php', NULL, '2026-02-07 23:48:15', '::1', 'Chrome', 'desktop'),
(29, 1, '/Uni_Scope/admin/faculties.php?edit=1', NULL, '2026-02-07 23:48:16', '::1', 'Chrome', 'desktop'),
(30, 1, '/Uni_Scope/admin/faculties.php', NULL, '2026-02-07 23:48:19', '::1', 'Chrome', 'desktop'),
(31, 1, '/Uni_Scope/admin/index.php', NULL, '2026-02-07 23:48:24', '::1', 'Chrome', 'desktop'),
(32, 1, '/Uni_Scope/admin/academic_years.php', NULL, '2026-02-07 23:48:25', '::1', 'Chrome', 'desktop'),
(33, 1, '/Uni_Scope/admin/index.php', NULL, '2026-02-07 23:48:28', '::1', 'Chrome', 'desktop'),
(34, 1, '/Uni_Scope/admin/users.php', NULL, '2026-02-07 23:48:29', '::1', 'Chrome', 'desktop'),
(35, 1, '/Uni_Scope/admin/users.php?edit=1', NULL, '2026-02-07 23:48:33', '::1', 'Chrome', 'desktop'),
(36, 1, '/Uni_Scope/admin/users.php?edit=1', NULL, '2026-02-07 23:48:35', '::1', 'Chrome', 'desktop'),
(37, 1, '/Uni_Scope/admin/users.php', NULL, '2026-02-07 23:48:37', '::1', 'Chrome', 'desktop'),
(38, 1, '/Uni_Scope/admin/user_add.php', NULL, '2026-02-07 23:48:39', '::1', 'Chrome', 'desktop'),
(39, 1, '/Uni_Scope/admin/users.php', NULL, '2026-02-07 23:48:41', '::1', 'Chrome', 'desktop'),
(40, 1, '/Uni_Scope/admin/index.php', NULL, '2026-02-07 23:48:42', '::1', 'Chrome', 'desktop'),
(41, 1, '/Uni_Scope/admin/send_reminders.php', NULL, '2026-02-07 23:48:43', '::1', 'Chrome', 'desktop'),
(42, 1, '/Uni_Scope/admin/index.php', NULL, '2026-02-07 23:48:50', '::1', 'Chrome', 'desktop'),
(43, 1, '/Uni_Scope/admin/usage_reports.php', NULL, '2026-02-07 23:48:51', '::1', 'Chrome', 'desktop'),
(44, 1, '/Uni_Scope/admin/index.php', NULL, '2026-02-07 23:49:13', '::1', 'Chrome', 'desktop'),
(45, 1, '/Uni_Scope/admin/faculties.php', NULL, '2026-02-07 23:49:24', '::1', 'Chrome', 'desktop'),
(46, 1, '/Uni_Scope/admin/index.php', NULL, '2026-02-07 23:49:25', '::1', 'Chrome', 'desktop'),
(47, NULL, '/Uni_Scope/index.php', NULL, '2026-02-09 18:54:30', '::1', 'Chrome', 'desktop'),
(48, NULL, '/Uni_Scope/dashboard.php?role=student', NULL, '2026-02-09 18:54:30', '::1', 'Chrome', 'desktop'),
(49, NULL, '/Uni_Scope/logout.php', NULL, '2026-02-09 19:21:44', '::1', 'Chrome', 'desktop'),
(50, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-12 17:45:09', '::1', 'Chrome', 'desktop'),
(51, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-12 17:45:09', '::1', 'Chrome', 'desktop'),
(52, NULL, '/Uni_Scope1/terms.php', NULL, '2026-02-12 17:45:49', '::1', 'Chrome', 'desktop'),
(53, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-12 17:45:51', '::1', 'Chrome', 'desktop'),
(54, NULL, '/Uni_Scope1/', NULL, '2026-02-12 17:46:47', '::1', 'Chrome', 'desktop'),
(55, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-12 17:46:47', '::1', 'Chrome', 'desktop'),
(56, NULL, '/Uni_Scope1/admin/', NULL, '2026-02-12 17:46:55', '::1', 'Chrome', 'desktop'),
(57, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-12 17:48:09', '::1', 'Chrome', 'desktop'),
(58, 1, '/Uni_Scope1/index.php', NULL, '2026-02-12 17:48:20', '::1', 'Chrome', 'desktop'),
(59, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-12 17:48:20', '::1', 'Chrome', 'desktop'),
(60, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-12 17:48:24', '::1', 'Chrome', 'desktop'),
(61, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-12 17:49:32', '::1', 'Chrome', 'desktop'),
(62, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-12 17:49:34', '::1', 'Chrome', 'desktop'),
(63, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-12 17:49:35', '::1', 'Chrome', 'desktop'),
(64, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-12 17:49:36', '::1', 'Chrome', 'desktop'),
(65, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-12 17:49:37', '::1', 'Chrome', 'desktop'),
(66, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-12 17:49:38', '::1', 'Chrome', 'desktop'),
(67, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-02-12 17:49:39', '::1', 'Chrome', 'desktop'),
(68, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-12 17:49:41', '::1', 'Chrome', 'desktop'),
(69, 1, '/Uni_Scope1/admin/send_reminders.php', NULL, '2026-02-12 17:49:42', '::1', 'Chrome', 'desktop'),
(70, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-12 17:49:42', '::1', 'Chrome', 'desktop'),
(71, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-12 17:49:45', '::1', 'Chrome', 'desktop'),
(72, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-12 17:49:46', '::1', 'Chrome', 'desktop'),
(73, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-12 17:49:46', '::1', 'Chrome', 'desktop'),
(74, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-02-12 17:49:47', '::1', 'Chrome', 'desktop'),
(75, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-12 17:49:48', '::1', 'Chrome', 'desktop'),
(76, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-12 17:50:14', '::1', 'Chrome', 'desktop'),
(77, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-12 17:50:15', '::1', 'Chrome', 'desktop'),
(78, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-12 17:50:16', '::1', 'Chrome', 'desktop'),
(79, 1, '/Uni_Scope1/admin/users.php?edit=5', NULL, '2026-02-12 17:50:18', '::1', 'Chrome', 'desktop'),
(80, 1, '/Uni_Scope1/admin/users.php?edit=1', NULL, '2026-02-12 17:50:22', '::1', 'Chrome', 'desktop'),
(81, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-12 17:50:24', '::1', 'Chrome', 'desktop'),
(82, 1, '/Uni_Scope1/admin/users.php?edit=1', NULL, '2026-02-12 17:50:27', '::1', 'Chrome', 'desktop'),
(83, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-12 17:52:19', '::1', 'Chrome', 'desktop'),
(84, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-12 17:53:04', '::1', 'Chrome', 'desktop'),
(85, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-12 17:53:04', '::1', 'Chrome', 'desktop'),
(86, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-02-12 17:53:06', '::1', 'Chrome', 'desktop'),
(87, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-12 17:53:23', '::1', 'Chrome', 'desktop'),
(88, 1, '/Uni_Scope1/index.php', NULL, '2026-02-12 18:09:34', '::1', 'Chrome', 'desktop'),
(89, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-12 18:09:34', '::1', 'Chrome', 'desktop'),
(90, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-12 18:09:36', '::1', 'Chrome', 'desktop'),
(91, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-12 18:09:38', '::1', 'Chrome', 'desktop'),
(92, 1, '/Uni_Scope1/admin/users.php?edit=1', NULL, '2026-02-12 18:11:56', '::1', 'Chrome', 'desktop'),
(93, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-12 18:15:24', '::1', 'Chrome', 'desktop'),
(94, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-12 18:15:26', '::1', 'Chrome', 'desktop'),
(95, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-12 18:17:31', '::1', 'Chrome', 'desktop'),
(96, 1, '/Uni_Scope1/admin/user_edit.php?id=5', NULL, '2026-02-12 18:17:37', '::1', 'Chrome', 'desktop'),
(97, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-12 18:17:39', '::1', 'Chrome', 'desktop'),
(98, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-12 18:19:11', '::1', 'Chrome', 'desktop'),
(99, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-12 18:21:29', '::1', 'Chrome', 'desktop'),
(100, 1, '/Uni_Scope1/index.php', NULL, '2026-02-13 13:49:56', '::1', 'Chrome', 'desktop'),
(101, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-13 13:49:56', '::1', 'Chrome', 'desktop'),
(102, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 13:50:00', '::1', 'Chrome', 'desktop'),
(103, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-13 13:50:01', '::1', 'Chrome', 'desktop'),
(104, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 13:50:03', '::1', 'Chrome', 'desktop'),
(105, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 13:50:04', '::1', 'Chrome', 'desktop'),
(106, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:04:48', '::1', 'Chrome', 'desktop'),
(107, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:06:06', '::1', 'Chrome', 'desktop'),
(108, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:08:27', '::1', 'Chrome', 'desktop'),
(109, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:08:31', '::1', 'Chrome', 'desktop'),
(110, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:12:23', '::1', 'Chrome', 'desktop'),
(111, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:13:22', '::1', 'Chrome', 'desktop'),
(112, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:13:35', '::1', 'Chrome', 'desktop'),
(113, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:14:27', '::1', 'Chrome', 'desktop'),
(114, 1, '/Uni_Scope1/admin/users.php?q=admin&role=&faculty=', NULL, '2026-02-13 14:14:38', '::1', 'Chrome', 'desktop'),
(115, 1, '/Uni_Scope1/admin/users.php?q=&role=&faculty=', NULL, '2026-02-13 14:14:41', '::1', 'Chrome', 'desktop'),
(116, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:14:42', '::1', 'Chrome', 'desktop'),
(117, 1, '/Uni_Scope1/admin/users.php?q=adm&role=&faculty=', NULL, '2026-02-13 14:14:46', '::1', 'Chrome', 'desktop'),
(118, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:14:46', '::1', 'Chrome', 'desktop'),
(119, 1, '/Uni_Scope1/admin/users.php?q=s&role=&faculty=', NULL, '2026-02-13 14:14:48', '::1', 'Chrome', 'desktop'),
(120, 1, '/Uni_Scope1/admin/users.php?q=&role=&faculty=', NULL, '2026-02-13 14:14:51', '::1', 'Chrome', 'desktop'),
(121, 1, '/Uni_Scope1/admin/users.php?q=un&role=&faculty=', NULL, '2026-02-13 14:14:55', '::1', 'Chrome', 'desktop'),
(122, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:14:56', '::1', 'Chrome', 'desktop'),
(123, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:15:17', '::1', 'Chrome', 'desktop'),
(124, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:15:39', '::1', 'Chrome', 'desktop'),
(125, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:15:42', '::1', 'Chrome', 'desktop'),
(126, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:17:02', '::1', 'Chrome', 'desktop'),
(127, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:17:08', '::1', 'Chrome', 'desktop'),
(128, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:17:09', '::1', 'Chrome', 'desktop'),
(129, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:17:26', '::1', 'Chrome', 'desktop'),
(130, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:17:26', '::1', 'Chrome', 'desktop'),
(131, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:17:29', '::1', 'Chrome', 'desktop'),
(132, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:17:31', '::1', 'Chrome', 'desktop'),
(133, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:17:53', '::1', 'Chrome', 'desktop'),
(134, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:17:57', '::1', 'Chrome', 'desktop'),
(135, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:18:47', '::1', 'Chrome', 'desktop'),
(136, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:18:48', '::1', 'Chrome', 'desktop'),
(137, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:19:17', '::1', 'Chrome', 'desktop'),
(138, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:19:21', '::1', 'Chrome', 'desktop'),
(139, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:20:39', '::1', 'Chrome', 'desktop'),
(140, 1, '/Uni_Scope1/index.php', NULL, '2026-02-13 14:21:00', '::1', 'Chrome', 'desktop'),
(141, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-13 14:21:00', '::1', 'Chrome', 'desktop'),
(142, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-13 14:21:03', '::1', 'Chrome', 'desktop'),
(143, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:21:04', '::1', 'Chrome', 'desktop'),
(144, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-13 14:23:55', '::1', 'Chrome', 'desktop'),
(145, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:24:14', '::1', 'Chrome', 'desktop'),
(146, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:24:52', '::1', 'Chrome', 'desktop'),
(147, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:24:56', '::1', 'Chrome', 'desktop'),
(148, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:24:59', '::1', 'Chrome', 'desktop'),
(149, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:28:37', '::1', 'Chrome', 'desktop'),
(150, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:29:21', '::1', 'Chrome', 'desktop'),
(151, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:29:26', '::1', 'Chrome', 'desktop'),
(152, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:29:29', '::1', 'Chrome', 'desktop'),
(153, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:33:54', '::1', 'Chrome', 'desktop'),
(154, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:33:56', '::1', 'Chrome', 'desktop'),
(155, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:33:56', '::1', 'Chrome', 'desktop'),
(156, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:34:23', '::1', 'Chrome', 'desktop'),
(157, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-13 14:34:27', '::1', 'Chrome', 'desktop'),
(158, 1, '/Uni_Scope1/index.php', NULL, '2026-02-13 14:40:12', '::1', 'Chrome', 'desktop'),
(159, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-13 14:40:12', '::1', 'Chrome', 'desktop'),
(160, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-13 14:40:13', '::1', 'Chrome', 'desktop'),
(161, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:40:14', '::1', 'Chrome', 'desktop'),
(162, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:40:16', '::1', 'Chrome', 'desktop'),
(163, 1, '/Uni_Scope1/index.php', NULL, '2026-02-13 14:40:27', '::1', 'Chrome', 'desktop'),
(164, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-13 14:40:27', '::1', 'Chrome', 'desktop'),
(165, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-13 14:40:28', '::1', 'Chrome', 'desktop'),
(166, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:40:29', '::1', 'Chrome', 'desktop'),
(167, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-13 14:40:31', '::1', 'Chrome', 'desktop'),
(168, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 14:41:28', '::1', 'Chrome', 'desktop'),
(169, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-13 14:47:16', '::1', 'Chrome', 'desktop'),
(170, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-13 17:07:57', '::1', 'Chrome', 'desktop'),
(171, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-13 17:07:57', '::1', 'Chrome', 'desktop'),
(172, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-13 17:09:16', '::1', 'Chrome', 'desktop'),
(173, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-13 17:11:52', '::1', 'Chrome', 'desktop'),
(174, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-13 17:11:52', '::1', 'Chrome', 'desktop'),
(175, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:12:11', '::1', 'Chrome', 'desktop'),
(176, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:12:12', '::1', 'Chrome', 'desktop'),
(177, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:12:13', '::1', 'Chrome', 'desktop'),
(178, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:12:16', '::1', 'Chrome', 'desktop'),
(179, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:12:20', '::1', 'Chrome', 'desktop'),
(180, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:12:21', '::1', 'Chrome', 'desktop'),
(181, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:12:22', '::1', 'Chrome', 'desktop'),
(182, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:12:24', '::1', 'Chrome', 'desktop'),
(183, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:12:26', '::1', 'Chrome', 'desktop'),
(184, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-13 17:12:29', '::1', 'Chrome', 'desktop'),
(185, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:12:33', '::1', 'Chrome', 'desktop'),
(186, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:12:45', '::1', 'Chrome', 'desktop'),
(187, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:12:58', '::1', 'Chrome', 'desktop'),
(188, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:13:28', '::1', 'Chrome', 'desktop'),
(189, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:13:35', '::1', 'Chrome', 'desktop'),
(190, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:16:03', '::1', 'Chrome', 'desktop'),
(191, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:16:06', '::1', 'Chrome', 'desktop'),
(192, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:16:07', '::1', 'Chrome', 'desktop'),
(193, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:16:10', '::1', 'Chrome', 'desktop'),
(194, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:16:11', '::1', 'Chrome', 'desktop'),
(195, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:16:12', '::1', 'Chrome', 'desktop'),
(196, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:16:15', '::1', 'Chrome', 'desktop'),
(197, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:16:16', '::1', 'Chrome', 'desktop'),
(198, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-13 17:16:18', '::1', 'Chrome', 'desktop'),
(199, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:16:18', '::1', 'Chrome', 'desktop'),
(200, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:16:19', '::1', 'Chrome', 'desktop'),
(201, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:16:19', '::1', 'Chrome', 'desktop'),
(202, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:16:20', '::1', 'Chrome', 'desktop'),
(203, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:16:22', '::1', 'Chrome', 'desktop'),
(204, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:16:25', '::1', 'Chrome', 'desktop'),
(205, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:16:27', '::1', 'Chrome', 'desktop'),
(206, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:16:28', '::1', 'Chrome', 'desktop'),
(207, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:16:29', '::1', 'Chrome', 'desktop'),
(208, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:16:30', '::1', 'Chrome', 'desktop'),
(209, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:16:31', '::1', 'Chrome', 'desktop'),
(210, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-13 17:16:42', '::1', 'Chrome', 'desktop'),
(211, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:17:05', '::1', 'Chrome', 'desktop'),
(212, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:17:27', '::1', 'Chrome', 'desktop'),
(213, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:17:28', '::1', 'Chrome', 'desktop'),
(214, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-13 17:17:33', '::1', 'Chrome', 'desktop'),
(215, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-13 17:17:40', '::1', 'Chrome', 'desktop'),
(216, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-13 17:17:40', '::1', 'Chrome', 'desktop'),
(217, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:18:28', '::1', 'Chrome', 'desktop'),
(218, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:18:30', '::1', 'Chrome', 'desktop'),
(219, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:18:54', '::1', 'Chrome', 'desktop'),
(220, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:18:55', '::1', 'Chrome', 'desktop'),
(221, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:19:50', '::1', 'Chrome', 'desktop'),
(222, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:19:51', '::1', 'Chrome', 'desktop'),
(223, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:20:23', '::1', 'Chrome', 'desktop'),
(224, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:20:26', '::1', 'Chrome', 'desktop'),
(225, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:20:26', '::1', 'Chrome', 'desktop'),
(226, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-13 17:20:27', '::1', 'Chrome', 'desktop'),
(227, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:20:28', '::1', 'Chrome', 'desktop'),
(228, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:20:30', '::1', 'Chrome', 'desktop'),
(229, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:20:31', '::1', 'Chrome', 'desktop'),
(230, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:20:32', '::1', 'Chrome', 'desktop'),
(231, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:20:35', '::1', 'Chrome', 'desktop'),
(232, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:20:39', '::1', 'Chrome', 'desktop'),
(233, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:20:40', '::1', 'Chrome', 'desktop'),
(234, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:20:42', '::1', 'Chrome', 'desktop'),
(235, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:20:43', '::1', 'Chrome', 'desktop'),
(236, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:21:11', '::1', 'Chrome', 'desktop'),
(237, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:21:13', '::1', 'Chrome', 'desktop'),
(238, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:21:14', '::1', 'Chrome', 'desktop'),
(239, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:22:41', '::1', 'Chrome', 'desktop'),
(240, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:22:43', '::1', 'Chrome', 'desktop'),
(241, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:22:45', '::1', 'Chrome', 'desktop'),
(242, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:22:46', '::1', 'Chrome', 'desktop'),
(243, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:22:47', '::1', 'Chrome', 'desktop'),
(244, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:22:48', '::1', 'Chrome', 'desktop'),
(245, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:22:49', '::1', 'Chrome', 'desktop'),
(246, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:22:53', '::1', 'Chrome', 'desktop'),
(247, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:22:57', '::1', 'Chrome', 'desktop'),
(248, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:22:59', '::1', 'Chrome', 'desktop'),
(249, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:23:01', '::1', 'Chrome', 'desktop'),
(250, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-13 17:23:02', '::1', 'Chrome', 'desktop'),
(251, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:23:03', '::1', 'Chrome', 'desktop'),
(252, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:23:04', '::1', 'Chrome', 'desktop'),
(253, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:23:04', '::1', 'Chrome', 'desktop'),
(254, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:23:06', '::1', 'Chrome', 'desktop'),
(255, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:23:06', '::1', 'Chrome', 'desktop'),
(256, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:23:07', '::1', 'Chrome', 'desktop'),
(257, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:26:26', '::1', 'Chrome', 'desktop'),
(258, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:26:27', '::1', 'Chrome', 'desktop'),
(259, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:26:30', '::1', 'Chrome', 'desktop'),
(260, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:26:32', '::1', 'Chrome', 'desktop'),
(261, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:26:35', '::1', 'Chrome', 'desktop'),
(262, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:26:39', '::1', 'Chrome', 'desktop'),
(263, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:28:59', '::1', 'Chrome', 'desktop'),
(264, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:30:13', '::1', 'Chrome', 'desktop'),
(265, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:30:16', '::1', 'Chrome', 'desktop'),
(266, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:30:17', '::1', 'Chrome', 'desktop'),
(267, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-13 17:30:19', '::1', 'Chrome', 'desktop'),
(268, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:30:20', '::1', 'Chrome', 'desktop'),
(269, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-13 17:30:21', '::1', 'Chrome', 'desktop'),
(270, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:30:23', '::1', 'Chrome', 'desktop'),
(271, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:30:23', '::1', 'Chrome', 'desktop'),
(272, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-13 17:30:25', '::1', 'Chrome', 'desktop'),
(273, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:30:27', '::1', 'Chrome', 'desktop'),
(274, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:30:28', '::1', 'Chrome', 'desktop'),
(275, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:30:29', '::1', 'Chrome', 'desktop'),
(276, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-13 17:30:30', '::1', 'Chrome', 'desktop'),
(277, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:30:32', '::1', 'Chrome', 'desktop'),
(278, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-13 17:30:32', '::1', 'Chrome', 'desktop'),
(279, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:30:33', '::1', 'Chrome', 'desktop'),
(280, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:30:35', '::1', 'Chrome', 'desktop'),
(281, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:30:36', '::1', 'Chrome', 'desktop'),
(282, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:30:48', '::1', 'Chrome', 'desktop'),
(283, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:30:55', '::1', 'Chrome', 'desktop'),
(284, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-13 17:30:57', '::1', 'Chrome', 'desktop'),
(285, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-13 17:32:52', '::1', 'Chrome', 'desktop'),
(286, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-13 17:32:52', '::1', 'Chrome', 'desktop'),
(287, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-13 17:33:01', '::1', 'Chrome', 'desktop'),
(288, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-13 17:33:10', '::1', 'Chrome', 'desktop'),
(289, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-13 17:33:10', '::1', 'Chrome', 'desktop'),
(290, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:33:13', '::1', 'Chrome', 'desktop'),
(291, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:33:15', '::1', 'Chrome', 'desktop'),
(292, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-13 17:33:16', '::1', 'Chrome', 'desktop'),
(293, 1, '/Uni_Scope1/index.php', NULL, '2026-02-13 17:33:21', '::1', 'Chrome', 'desktop'),
(294, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-13 17:33:22', '::1', 'Chrome', 'desktop'),
(295, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-13 17:35:40', '::1', 'Chrome', 'desktop'),
(296, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-13 17:35:47', '::1', 'Chrome', 'desktop'),
(297, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:36:09', '::1', 'Chrome', 'desktop'),
(298, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-13 17:36:10', '::1', 'Chrome', 'desktop'),
(299, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:36:13', '::1', 'Chrome', 'desktop'),
(300, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-13 17:36:14', '::1', 'Chrome', 'desktop'),
(301, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-13 17:36:17', '::1', 'Chrome', 'desktop'),
(302, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-13 17:36:17', '::1', 'Chrome', 'desktop'),
(303, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-13 17:36:18', '::1', 'Chrome', 'desktop'),
(304, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-13 17:36:20', '::1', 'Chrome', 'desktop'),
(305, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:36:21', '::1', 'Chrome', 'desktop'),
(306, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-13 17:36:21', '::1', 'Chrome', 'desktop'),
(307, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-02-13 17:36:22', '::1', 'Chrome', 'desktop'),
(308, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:36:22', '::1', 'Chrome', 'desktop'),
(309, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:36:23', '::1', 'Chrome', 'desktop'),
(310, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-13 17:36:25', '::1', 'Chrome', 'desktop'),
(311, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:36:27', '::1', 'Chrome', 'desktop'),
(312, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:36:43', '::1', 'Chrome', 'desktop'),
(313, 1, '/Uni_Scope1/admin/academic_years.php?edit=1', NULL, '2026-02-13 17:36:44', '::1', 'Chrome', 'desktop'),
(314, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:36:47', '::1', 'Chrome', 'desktop'),
(315, 1, '/Uni_Scope1/admin/academic_years.php?edit=1', NULL, '2026-02-13 17:37:01', '::1', 'Chrome', 'desktop'),
(316, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:37:04', '::1', 'Chrome', 'desktop'),
(317, 1, '/Uni_Scope1/admin/academic_years.php?edit=1', NULL, '2026-02-13 17:37:14', '::1', 'Chrome', 'desktop'),
(318, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:37:15', '::1', 'Chrome', 'desktop'),
(319, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:40:01', '::1', 'Chrome', 'desktop'),
(320, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:43:57', '::1', 'Chrome', 'desktop'),
(321, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:44:03', '::1', 'Chrome', 'desktop'),
(322, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:44:06', '::1', 'Chrome', 'desktop'),
(323, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:44:14', '::1', 'Chrome', 'desktop'),
(324, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-13 17:44:20', '::1', 'Chrome', 'desktop'),
(325, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-13 17:45:23', '::1', 'Chrome', 'desktop'),
(326, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-13 17:45:29', '::1', 'Chrome', 'desktop'),
(327, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-13 17:45:29', '::1', 'Chrome', 'desktop'),
(328, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:51:10', '::1', 'Chrome', 'desktop'),
(329, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:51:14', '::1', 'Chrome', 'desktop'),
(330, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:51:16', '::1', 'Chrome', 'desktop'),
(331, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:51:18', '::1', 'Chrome', 'desktop'),
(332, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:52:30', '::1', 'Chrome', 'desktop'),
(333, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:54:40', '::1', 'Chrome', 'desktop'),
(334, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:55:29', '::1', 'Chrome', 'desktop'),
(335, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:56:10', '::1', 'Chrome', 'desktop'),
(336, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:56:13', '::1', 'Chrome', 'desktop'),
(337, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:56:18', '::1', 'Chrome', 'desktop'),
(338, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:56:25', '::1', 'Chrome', 'desktop'),
(339, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:56:30', '::1', 'Chrome', 'desktop'),
(340, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:56:32', '::1', 'Chrome', 'desktop'),
(341, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:56:38', '::1', 'Chrome', 'desktop'),
(342, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 17:56:40', '::1', 'Chrome', 'desktop'),
(343, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 17:56:40', '::1', 'Chrome', 'desktop'),
(344, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:56:42', '::1', 'Chrome', 'desktop'),
(345, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-13 17:56:55', '::1', 'Chrome', 'desktop'),
(346, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-13 17:57:01', '::1', 'Chrome', 'desktop'),
(347, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-13 17:57:01', '::1', 'Chrome', 'desktop'),
(348, NULL, '/Uni_Scope1/terms.php', NULL, '2026-02-13 17:57:21', '::1', 'Chrome', 'desktop'),
(349, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:57:28', '::1', 'Chrome', 'desktop'),
(350, NULL, '/Uni_Scope1/terms.php', NULL, '2026-02-13 17:57:30', '::1', 'Chrome', 'desktop'),
(351, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:57:38', '::1', 'Chrome', 'desktop'),
(352, NULL, '/Uni_Scope1/terms.php', NULL, '2026-02-13 17:58:53', '::1', 'Chrome', 'desktop'),
(353, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 17:59:23', '::1', 'Chrome', 'desktop'),
(354, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:01:40', '::1', 'Chrome', 'desktop'),
(355, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:02:39', '::1', 'Chrome', 'desktop'),
(356, NULL, '/Uni_Scope1/dashboard.php?terms_accepted=1', NULL, '2026-02-13 18:02:39', '::1', 'Chrome', 'desktop'),
(357, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 18:03:12', '::1', 'Chrome', 'desktop'),
(358, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 18:03:29', '::1', 'Chrome', 'desktop'),
(359, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:03:41', '::1', 'Chrome', 'desktop'),
(360, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 18:03:53', '::1', 'Chrome', 'desktop'),
(361, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:03:55', '::1', 'Chrome', 'desktop'),
(362, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:06:48', '::1', 'Chrome', 'desktop'),
(363, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:07:27', '::1', 'Chrome', 'desktop'),
(364, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:08:33', '::1', 'Chrome', 'desktop'),
(365, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:09:01', '::1', 'Chrome', 'desktop'),
(366, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:10:48', '::1', 'Chrome', 'desktop'),
(367, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 18:16:48', '::1', 'Chrome', 'desktop'),
(368, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 18:16:59', '::1', 'Chrome', 'desktop'),
(369, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:17:10', '::1', 'Chrome', 'desktop'),
(370, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 18:18:17', '::1', 'Chrome', 'desktop'),
(371, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 18:18:19', '::1', 'Chrome', 'desktop'),
(372, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-13 18:18:22', '::1', 'Chrome', 'desktop'),
(373, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-13 18:18:25', '::1', 'Chrome', 'desktop'),
(374, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 18:18:50', '::1', 'Chrome', 'desktop'),
(375, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-13 18:18:58', '::1', 'Chrome', 'desktop'),
(376, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 17:50:03', '::1', 'Chrome', 'desktop'),
(377, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 17:50:03', '::1', 'Chrome', 'desktop'),
(378, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:01:59', '::1', 'Chrome', 'desktop'),
(379, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:02:08', '::1', 'Chrome', 'desktop'),
(380, NULL, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-15 18:02:08', '::1', 'Chrome', 'desktop'),
(381, NULL, '/Uni_Scope1/coordinator/submission.php?id=4', NULL, '2026-02-15 18:02:27', '::1', 'Chrome', 'desktop'),
(382, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:02:46', '::1', 'Chrome', 'desktop'),
(383, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:02:46', '::1', 'Chrome', 'desktop'),
(384, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:02:47', '::1', 'Chrome', 'desktop'),
(385, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 18:02:48', '::1', 'Chrome', 'desktop'),
(386, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 18:02:49', '::1', 'Chrome', 'desktop'),
(387, NULL, '/Uni_Scope1/coordinator/statistics.php', NULL, '2026-02-15 18:02:49', '::1', 'Chrome', 'desktop'),
(388, NULL, '/Uni_Scope1/coordinator/exception_reports.php', NULL, '2026-02-15 18:02:50', '::1', 'Chrome', 'desktop'),
(389, NULL, '/Uni_Scope1/coordinator/statistics.php', NULL, '2026-02-15 18:02:50', '::1', 'Chrome', 'desktop'),
(390, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 18:02:50', '::1', 'Chrome', 'desktop'),
(391, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 18:02:51', '::1', 'Chrome', 'desktop'),
(392, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:02:51', '::1', 'Chrome', 'desktop'),
(393, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:03:38', '::1', 'Chrome', 'desktop'),
(394, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 18:03:38', '::1', 'Chrome', 'desktop'),
(395, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:03:40', '::1', 'Chrome', 'desktop'),
(396, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 18:04:05', '::1', 'Chrome', 'desktop'),
(397, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 18:04:07', '::1', 'Chrome', 'desktop'),
(398, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 18:04:08', '::1', 'Chrome', 'desktop'),
(399, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 18:04:08', '::1', 'Chrome', 'desktop'),
(400, NULL, '/Uni_Scope1/coordinator/review.php?filter=selected', NULL, '2026-02-15 18:04:09', '::1', 'Chrome', 'desktop'),
(401, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 18:04:10', '::1', 'Chrome', 'desktop'),
(402, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:04:21', '::1', 'Chrome', 'desktop'),
(403, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:06:59', '::1', 'Chrome', 'desktop'),
(404, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:07:05', '::1', 'Chrome', 'desktop'),
(405, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:07:16', '::1', 'Chrome', 'desktop'),
(406, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 18:07:16', '::1', 'Chrome', 'desktop'),
(407, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 18:07:19', '::1', 'Chrome', 'desktop'),
(408, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:07:21', '::1', 'Chrome', 'desktop'),
(409, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-15 18:07:23', '::1', 'Chrome', 'desktop'),
(410, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:08:21', '::1', 'Chrome', 'desktop'),
(411, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:08:25', '::1', 'Chrome', 'desktop'),
(412, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 18:08:50', '::1', 'Chrome', 'desktop'),
(413, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-02-15 18:08:52', '::1', 'Chrome', 'desktop'),
(414, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 18:08:53', '::1', 'Chrome', 'desktop'),
(415, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-15 18:08:55', '::1', 'Chrome', 'desktop'),
(416, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 18:08:56', '::1', 'Chrome', 'desktop'),
(417, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:08:57', '::1', 'Chrome', 'desktop'),
(418, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:11:09', '::1', 'Chrome', 'desktop'),
(419, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:11:41', '::1', 'Chrome', 'desktop'),
(420, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:21:09', '::1', 'Chrome', 'desktop'),
(421, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-15 18:21:09', '::1', 'Chrome', 'desktop'),
(422, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 18:21:15', '::1', 'Chrome', 'desktop'),
(423, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 18:21:23', '::1', 'Chrome', 'desktop'),
(424, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 18:21:25', '::1', 'Chrome', 'desktop'),
(425, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:21:28', '::1', 'Chrome', 'desktop'),
(426, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 18:21:30', '::1', 'Chrome', 'desktop'),
(427, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 18:21:40', '::1', 'Chrome', 'desktop'),
(428, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:22:04', '::1', 'Chrome', 'desktop'),
(429, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 18:22:06', '::1', 'Chrome', 'desktop'),
(430, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:22:09', '::1', 'Chrome', 'desktop'),
(431, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 18:22:12', '::1', 'Chrome', 'desktop'),
(432, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 18:22:13', '::1', 'Chrome', 'desktop'),
(433, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:22:14', '::1', 'Chrome', 'desktop'),
(434, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:22:17', '::1', 'Chrome', 'desktop'),
(435, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:22:25', '::1', 'Chrome', 'desktop'),
(436, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 18:22:25', '::1', 'Chrome', 'desktop'),
(437, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 18:22:26', '::1', 'Chrome', 'desktop'),
(438, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:22:28', '::1', 'Chrome', 'desktop'),
(439, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:22:33', '::1', 'Chrome', 'desktop'),
(440, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-15 18:22:34', '::1', 'Chrome', 'desktop'),
(441, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:22:41', '::1', 'Chrome', 'desktop'),
(442, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:22:43', '::1', 'Chrome', 'desktop'),
(443, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:23:57', '::1', 'Chrome', 'desktop'),
(444, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-15 18:23:57', '::1', 'Chrome', 'desktop'),
(445, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-15 18:24:07', '::1', 'Chrome', 'desktop'),
(446, NULL, '/Uni_Scope1/dashboard.php?terms_accepted=1', NULL, '2026-02-15 18:24:07', '::1', 'Chrome', 'desktop'),
(447, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 18:24:11', '::1', 'Chrome', 'desktop'),
(448, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:24:12', '::1', 'Chrome', 'desktop'),
(449, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:24:32', '::1', 'Chrome', 'desktop'),
(450, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:24:47', '::1', 'Chrome', 'desktop'),
(451, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 18:24:47', '::1', 'Chrome', 'desktop'),
(452, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 18:24:49', '::1', 'Chrome', 'desktop'),
(453, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:24:49', '::1', 'Chrome', 'desktop'),
(454, 1, '/Uni_Scope1/admin/user_edit.php?id=5', NULL, '2026-02-15 18:24:54', '::1', 'Chrome', 'desktop'),
(455, 1, '/Uni_Scope1/admin/user_edit.php?id=5', NULL, '2026-02-15 18:24:58', '::1', 'Chrome', 'desktop'),
(456, 1, '/Uni_Scope1/admin/users.php?updated=1', NULL, '2026-02-15 18:24:58', '::1', 'Chrome', 'desktop'),
(457, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:25:01', '::1', 'Chrome', 'desktop'),
(458, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:25:08', '::1', 'Chrome', 'desktop'),
(459, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-15 18:25:08', '::1', 'Chrome', 'desktop'),
(460, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 18:25:10', '::1', 'Chrome', 'desktop'),
(461, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 18:25:11', '::1', 'Chrome', 'desktop'),
(462, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 18:25:18', '::1', 'Chrome', 'desktop'),
(463, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:35:49', '::1', 'Chrome', 'desktop'),
(464, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:36:18', '::1', 'Chrome', 'desktop'),
(465, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:36:46', '::1', 'Chrome', 'desktop'),
(466, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 18:36:46', '::1', 'Chrome', 'desktop'),
(467, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 18:36:51', '::1', 'Chrome', 'desktop'),
(468, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:36:52', '::1', 'Chrome', 'desktop'),
(469, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-15 18:36:53', '::1', 'Chrome', 'desktop'),
(470, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:36:55', '::1', 'Chrome', 'desktop'),
(471, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-15 18:36:59', '::1', 'Chrome', 'desktop'),
(472, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-15 18:37:26', '::1', 'Chrome', 'desktop'),
(473, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-15 18:37:29', '::1', 'Chrome', 'desktop'),
(474, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:37:36', '::1', 'Chrome', 'desktop'),
(475, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 18:37:37', '::1', 'Chrome', 'desktop'),
(476, 1, '/Uni_Scope1/login.php', NULL, '2026-02-15 18:38:21', '::1', 'Chrome', 'desktop'),
(477, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:38:21', '::1', 'Chrome', 'desktop'),
(478, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 18:38:21', '::1', 'Chrome', 'desktop'),
(479, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:38:53', '::1', 'Chrome', 'desktop'),
(480, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:38:59', '::1', 'Chrome', 'desktop'),
(481, NULL, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-15 18:38:59', '::1', 'Chrome', 'desktop'),
(482, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 18:39:29', '::1', 'Chrome', 'desktop'),
(483, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 18:39:31', '::1', 'Chrome', 'desktop'),
(484, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 18:39:31', '::1', 'Chrome', 'desktop'),
(485, NULL, '/Uni_Scope1/coordinator/review.php?filter=selected', NULL, '2026-02-15 18:39:32', '::1', 'Chrome', 'desktop'),
(486, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 18:39:32', '::1', 'Chrome', 'desktop'),
(487, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:39:32', '::1', 'Chrome', 'desktop'),
(488, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 18:40:06', '::1', 'Chrome', 'desktop'),
(489, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:40:50', '::1', 'Chrome', 'desktop'),
(490, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:40:55', '::1', 'Chrome', 'desktop'),
(491, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-15 18:40:55', '::1', 'Chrome', 'desktop'),
(492, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:41:00', '::1', 'Chrome', 'desktop');
INSERT INTO `system_logs` (`log_id`, `user_id`, `page_visited`, `action_taken`, `log_time`, `ip_address`, `browser`, `device_type`) VALUES
(493, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:41:12', '::1', 'Chrome', 'desktop'),
(494, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 18:41:12', '::1', 'Chrome', 'desktop'),
(495, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 18:41:13', '::1', 'Chrome', 'desktop'),
(496, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 18:41:14', '::1', 'Chrome', 'desktop'),
(497, 1, '/Uni_Scope1/admin/user_edit.php?id=5', NULL, '2026-02-15 18:41:16', '::1', 'Chrome', 'desktop'),
(498, 1, '/Uni_Scope1/admin/user_edit.php?id=5', NULL, '2026-02-15 18:41:18', '::1', 'Chrome', 'desktop'),
(499, 1, '/Uni_Scope1/admin/users.php?updated=1', NULL, '2026-02-15 18:41:18', '::1', 'Chrome', 'desktop'),
(500, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 18:41:19', '::1', 'Chrome', 'desktop'),
(501, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:41:22', '::1', 'Chrome', 'desktop'),
(502, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:41:28', '::1', 'Chrome', 'desktop'),
(503, NULL, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-15 18:41:28', '::1', 'Chrome', 'desktop'),
(504, NULL, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-15 18:41:31', '::1', 'Chrome', 'desktop'),
(505, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:41:36', '::1', 'Chrome', 'desktop'),
(506, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:41:42', '::1', 'Chrome', 'desktop'),
(507, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-15 18:41:42', '::1', 'Chrome', 'desktop'),
(508, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 18:41:43', '::1', 'Chrome', 'desktop'),
(509, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 18:41:50', '::1', 'Chrome', 'desktop'),
(510, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 18:42:44', '::1', 'Chrome', 'desktop'),
(511, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 18:42:50', '::1', 'Chrome', 'desktop'),
(512, NULL, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-15 18:42:50', '::1', 'Chrome', 'desktop'),
(513, NULL, '/Uni_Scope1/coordinator/submission.php?id=7', NULL, '2026-02-15 18:42:59', '::1', 'Chrome', 'desktop'),
(514, NULL, '/Uni_Scope1/download.php?id=7', NULL, '2026-02-15 18:43:02', '::1', 'Chrome', 'desktop'),
(515, NULL, '/Uni_Scope1/coordinator/submission.php?id=7', NULL, '2026-02-15 18:43:17', '::1', 'Chrome', 'desktop'),
(516, NULL, '/Uni_Scope1/coordinator/submission.php?id=7', NULL, '2026-02-15 18:46:22', '::1', 'Chrome', 'desktop'),
(517, NULL, '/Uni_Scope1/coordinator/submission.php?id=7', NULL, '2026-02-15 18:55:08', '::1', 'Chrome', 'desktop'),
(518, NULL, '/Uni_Scope1/coordinator/submission.php?id=7', NULL, '2026-02-15 18:55:53', '::1', 'Chrome', 'desktop'),
(519, NULL, '/Uni_Scope1/coordinator/submission.php?id=7', NULL, '2026-02-15 19:13:17', '::1', 'Chrome', 'desktop'),
(520, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:13:48', '::1', 'Chrome', 'desktop'),
(521, NULL, '/Uni_Scope1/coordinator/submission.php?id=7', NULL, '2026-02-15 19:13:50', '::1', 'Chrome', 'desktop'),
(522, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:13:52', '::1', 'Chrome', 'desktop'),
(523, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:13:53', '::1', 'Chrome', 'desktop'),
(524, NULL, '/Uni_Scope1/coordinator/review.php?filter=selected', NULL, '2026-02-15 19:13:53', '::1', 'Chrome', 'desktop'),
(525, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:13:54', '::1', 'Chrome', 'desktop'),
(526, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 19:13:54', '::1', 'Chrome', 'desktop'),
(527, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 19:13:55', '::1', 'Chrome', 'desktop'),
(528, NULL, '/Uni_Scope1/coordinator/review.php?filter=selected', NULL, '2026-02-15 19:13:55', '::1', 'Chrome', 'desktop'),
(529, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:13:55', '::1', 'Chrome', 'desktop'),
(530, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:13:56', '::1', 'Chrome', 'desktop'),
(531, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:13:57', '::1', 'Chrome', 'desktop'),
(532, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:13:57', '::1', 'Chrome', 'desktop'),
(533, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:13:58', '::1', 'Chrome', 'desktop'),
(534, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:13:59', '::1', 'Chrome', 'desktop'),
(535, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:13:59', '::1', 'Chrome', 'desktop'),
(536, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:14:00', '::1', 'Chrome', 'desktop'),
(537, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:14:00', '::1', 'Chrome', 'desktop'),
(538, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 19:14:00', '::1', 'Chrome', 'desktop'),
(539, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 19:14:01', '::1', 'Chrome', 'desktop'),
(540, NULL, '/Uni_Scope1/coordinator/review.php?filter=selected', NULL, '2026-02-15 19:14:01', '::1', 'Chrome', 'desktop'),
(541, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 19:14:01', '::1', 'Chrome', 'desktop'),
(542, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 19:14:02', '::1', 'Chrome', 'desktop'),
(543, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:14:02', '::1', 'Chrome', 'desktop'),
(544, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:14:03', '::1', 'Chrome', 'desktop'),
(545, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:14:03', '::1', 'Chrome', 'desktop'),
(546, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:14:03', '::1', 'Chrome', 'desktop'),
(547, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:14:04', '::1', 'Chrome', 'desktop'),
(548, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:14:04', '::1', 'Chrome', 'desktop'),
(549, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 19:14:05', '::1', 'Chrome', 'desktop'),
(550, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:14:05', '::1', 'Chrome', 'desktop'),
(551, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:14:06', '::1', 'Chrome', 'desktop'),
(552, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:14:08', '::1', 'Chrome', 'desktop'),
(553, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:14:45', '::1', 'Chrome', 'desktop'),
(554, NULL, '/Uni_Scope1/coordinator/statistics.php', NULL, '2026-02-15 19:15:10', '::1', 'Chrome', 'desktop'),
(555, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:15:13', '::1', 'Chrome', 'desktop'),
(556, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:15:38', '::1', 'Chrome', 'desktop'),
(557, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:15:39', '::1', 'Chrome', 'desktop'),
(558, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:15:42', '::1', 'Chrome', 'desktop'),
(559, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 19:15:43', '::1', 'Chrome', 'desktop'),
(560, NULL, '/Uni_Scope1/coordinator/review.php?filter=selected', NULL, '2026-02-15 19:15:43', '::1', 'Chrome', 'desktop'),
(561, NULL, '/Uni_Scope1/coordinator/submission.php?id=7', NULL, '2026-02-15 19:15:45', '::1', 'Chrome', 'desktop'),
(562, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:15:47', '::1', 'Chrome', 'desktop'),
(563, NULL, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-15 19:15:48', '::1', 'Chrome', 'desktop'),
(564, NULL, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-15 19:15:49', '::1', 'Chrome', 'desktop'),
(565, NULL, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-15 19:15:49', '::1', 'Chrome', 'desktop'),
(566, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:25:13', '::1', 'Chrome', 'desktop'),
(567, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:25:21', '::1', 'Chrome', 'desktop'),
(568, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 19:25:21', '::1', 'Chrome', 'desktop'),
(569, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 19:25:23', '::1', 'Chrome', 'desktop'),
(570, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 19:25:44', '::1', 'Chrome', 'desktop'),
(571, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 19:25:45', '::1', 'Chrome', 'desktop'),
(572, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 19:25:46', '::1', 'Chrome', 'desktop'),
(573, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-15 19:25:47', '::1', 'Chrome', 'desktop'),
(574, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-15 19:26:00', '::1', 'Chrome', 'desktop'),
(575, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-15 19:26:03', '::1', 'Chrome', 'desktop'),
(576, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:26:26', '::1', 'Chrome', 'desktop'),
(577, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:26:31', '::1', 'Chrome', 'desktop'),
(578, NULL, '/Uni_Scope1/dashboard.php?role=manager', NULL, '2026-02-15 19:26:32', '::1', 'Chrome', 'desktop'),
(579, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:27:06', '::1', 'Chrome', 'desktop'),
(580, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:27:36', '::1', 'Chrome', 'desktop'),
(581, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:27:38', '::1', 'Chrome', 'desktop'),
(582, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:27:39', '::1', 'Chrome', 'desktop'),
(583, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:27:39', '::1', 'Chrome', 'desktop'),
(584, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:27:40', '::1', 'Chrome', 'desktop'),
(585, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:27:40', '::1', 'Chrome', 'desktop'),
(586, NULL, '/Uni_Scope1/manager/selected.php?err=not_available', NULL, '2026-02-15 19:27:41', '::1', 'Chrome', 'desktop'),
(587, NULL, '/Uni_Scope1/manager/exception_reports.php', NULL, '2026-02-15 19:27:43', '::1', 'Chrome', 'desktop'),
(588, NULL, '/Uni_Scope1/manager/exception_reports.php?report=no_comment&faculty_id=&export=csv', NULL, '2026-02-15 19:27:48', '::1', 'Chrome', 'desktop'),
(589, NULL, '/Uni_Scope1/manager/exception_reports.php?report=no_comment&faculty_id=2', NULL, '2026-02-15 19:28:42', '::1', 'Chrome', 'desktop'),
(590, NULL, '/Uni_Scope1/manager/exception_reports.php?report=no_comment&faculty_id=4', NULL, '2026-02-15 19:28:43', '::1', 'Chrome', 'desktop'),
(591, NULL, '/Uni_Scope1/manager/exception_reports.php?report=no_comment&faculty_id=3', NULL, '2026-02-15 19:28:44', '::1', 'Chrome', 'desktop'),
(592, NULL, '/Uni_Scope1/manager/exception_reports.php?report=no_comment&faculty_id=', NULL, '2026-02-15 19:28:46', '::1', 'Chrome', 'desktop'),
(593, NULL, '/Uni_Scope1/manager/exception_reports.php?report=overdue&faculty_id=', NULL, '2026-02-15 19:28:47', '::1', 'Chrome', 'desktop'),
(594, NULL, '/Uni_Scope1/manager/exception_reports.php?report=no_comment&faculty_id=', NULL, '2026-02-15 19:28:49', '::1', 'Chrome', 'desktop'),
(595, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:28:50', '::1', 'Chrome', 'desktop'),
(596, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:28:53', '::1', 'Chrome', 'desktop'),
(597, NULL, '/Uni_Scope1/manager/statistics.php', NULL, '2026-02-15 19:28:55', '::1', 'Chrome', 'desktop'),
(598, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:28:58', '::1', 'Chrome', 'desktop'),
(599, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:28:59', '::1', 'Chrome', 'desktop'),
(600, NULL, '/Uni_Scope1/manager/selected.php?err=not_available', NULL, '2026-02-15 19:28:59', '::1', 'Chrome', 'desktop'),
(601, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:29:00', '::1', 'Chrome', 'desktop'),
(602, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:29:03', '::1', 'Chrome', 'desktop'),
(603, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:29:04', '::1', 'Chrome', 'desktop'),
(604, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:29:06', '::1', 'Chrome', 'desktop'),
(605, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:29:09', '::1', 'Chrome', 'desktop'),
(606, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:29:10', '::1', 'Chrome', 'desktop'),
(607, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:29:12', '::1', 'Chrome', 'desktop'),
(608, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:29:30', '::1', 'Chrome', 'desktop'),
(609, NULL, '/Uni_Scope1/manager/exception_reports.php', NULL, '2026-02-15 19:29:30', '::1', 'Chrome', 'desktop'),
(610, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:29:31', '::1', 'Chrome', 'desktop'),
(611, NULL, '/Uni_Scope1/manager/selected.php?err=not_available', NULL, '2026-02-15 19:29:31', '::1', 'Chrome', 'desktop'),
(612, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:29:31', '::1', 'Chrome', 'desktop'),
(613, NULL, '/Uni_Scope1/manager/statistics.php', NULL, '2026-02-15 19:29:32', '::1', 'Chrome', 'desktop'),
(614, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:29:40', '::1', 'Chrome', 'desktop'),
(615, NULL, '/Uni_Scope1/manager/selected.php?err=not_available', NULL, '2026-02-15 19:29:40', '::1', 'Chrome', 'desktop'),
(616, NULL, '/Uni_Scope1/manager/exception_reports.php', NULL, '2026-02-15 19:29:41', '::1', 'Chrome', 'desktop'),
(617, NULL, '/Uni_Scope1/manager/statistics.php', NULL, '2026-02-15 19:29:41', '::1', 'Chrome', 'desktop'),
(618, NULL, '/Uni_Scope1/manager/exception_reports.php', NULL, '2026-02-15 19:29:42', '::1', 'Chrome', 'desktop'),
(619, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:29:42', '::1', 'Chrome', 'desktop'),
(620, NULL, '/Uni_Scope1/manager/selected.php?err=not_available', NULL, '2026-02-15 19:29:42', '::1', 'Chrome', 'desktop'),
(621, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:29:43', '::1', 'Chrome', 'desktop'),
(622, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:29:44', '::1', 'Chrome', 'desktop'),
(623, NULL, '/Uni_Scope1/manager/selected.php?err=not_available', NULL, '2026-02-15 19:29:44', '::1', 'Chrome', 'desktop'),
(624, NULL, '/Uni_Scope1/manager/exception_reports.php', NULL, '2026-02-15 19:29:44', '::1', 'Chrome', 'desktop'),
(625, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:33:14', '::1', 'Chrome', 'desktop'),
(626, NULL, '/Uni_Scope1/manager/selected.php?err=not_available', NULL, '2026-02-15 19:33:14', '::1', 'Chrome', 'desktop'),
(627, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:33:22', '::1', 'Chrome', 'desktop'),
(628, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:33:33', '::1', 'Chrome', 'desktop'),
(629, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 19:33:33', '::1', 'Chrome', 'desktop'),
(630, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 19:33:35', '::1', 'Chrome', 'desktop'),
(631, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-15 19:33:36', '::1', 'Chrome', 'desktop'),
(632, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-15 19:33:54', '::1', 'Chrome', 'desktop'),
(633, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 19:33:56', '::1', 'Chrome', 'desktop'),
(634, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:33:59', '::1', 'Chrome', 'desktop'),
(635, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:34:06', '::1', 'Chrome', 'desktop'),
(636, NULL, '/Uni_Scope1/dashboard.php?role=manager', NULL, '2026-02-15 19:34:06', '::1', 'Chrome', 'desktop'),
(637, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:34:08', '::1', 'Chrome', 'desktop'),
(638, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:34:08', '::1', 'Chrome', 'desktop'),
(639, NULL, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-15 19:34:20', '::1', 'Chrome', 'desktop'),
(640, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:34:22', '::1', 'Chrome', 'desktop'),
(641, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:34:22', '::1', 'Chrome', 'desktop'),
(642, NULL, '/Uni_Scope1/manager/exception_reports.php', NULL, '2026-02-15 19:34:29', '::1', 'Chrome', 'desktop'),
(643, NULL, '/Uni_Scope1/manager/statistics.php', NULL, '2026-02-15 19:34:30', '::1', 'Chrome', 'desktop'),
(644, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:34:31', '::1', 'Chrome', 'desktop'),
(645, NULL, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-02-15 19:34:31', '::1', 'Chrome', 'desktop'),
(646, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:35:30', '::1', 'Chrome', 'desktop'),
(647, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:35:38', '::1', 'Chrome', 'desktop'),
(648, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 19:35:38', '::1', 'Chrome', 'desktop'),
(649, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 19:35:41', '::1', 'Chrome', 'desktop'),
(650, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-02-15 19:35:45', '::1', 'Chrome', 'desktop'),
(651, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 19:35:52', '::1', 'Chrome', 'desktop'),
(652, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-15 19:36:09', '::1', 'Chrome', 'desktop'),
(653, 1, '/Uni_Scope1/admin/user_edit.php?id=15', NULL, '2026-02-15 19:36:11', '::1', 'Chrome', 'desktop'),
(654, 1, '/Uni_Scope1/admin/user_edit.php?id=15', NULL, '2026-02-15 19:36:19', '::1', 'Chrome', 'desktop'),
(655, 1, '/Uni_Scope1/admin/users.php?updated=1', NULL, '2026-02-15 19:36:19', '::1', 'Chrome', 'desktop'),
(656, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:36:23', '::1', 'Chrome', 'desktop'),
(657, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:36:31', '::1', 'Chrome', 'desktop'),
(658, NULL, '/Uni_Scope1/dashboard.php?role=guest', NULL, '2026-02-15 19:36:31', '::1', 'Chrome', 'desktop'),
(659, NULL, '/Uni_Scope1/guest/selected.php', NULL, '2026-02-15 19:36:35', '::1', 'Chrome', 'desktop'),
(660, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:38:38', '::1', 'Chrome', 'desktop'),
(661, NULL, '/Uni_Scope1/guest/selected.php', NULL, '2026-02-15 19:38:39', '::1', 'Chrome', 'desktop'),
(662, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:38:42', '::1', 'Chrome', 'desktop'),
(663, NULL, '/Uni_Scope1/guest/selected.php', NULL, '2026-02-15 19:38:45', '::1', 'Chrome', 'desktop'),
(664, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:38:48', '::1', 'Chrome', 'desktop'),
(665, NULL, '/Uni_Scope1/guest/selected.php', NULL, '2026-02-15 19:38:52', '::1', 'Chrome', 'desktop'),
(666, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:38:53', '::1', 'Chrome', 'desktop'),
(667, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:38:54', '::1', 'Chrome', 'desktop'),
(668, NULL, '/Uni_Scope1/guest/selected.php', NULL, '2026-02-15 19:38:54', '::1', 'Chrome', 'desktop'),
(669, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:38:58', '::1', 'Chrome', 'desktop'),
(670, NULL, '/Uni_Scope1/guest/selected.php', NULL, '2026-02-15 19:39:00', '::1', 'Chrome', 'desktop'),
(671, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:39:02', '::1', 'Chrome', 'desktop'),
(672, NULL, '/Uni_Scope1/guest/selected.php', NULL, '2026-02-15 19:39:59', '::1', 'Chrome', 'desktop'),
(673, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:40:02', '::1', 'Chrome', 'desktop'),
(674, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:40:12', '::1', 'Chrome', 'desktop'),
(675, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:40:21', '::1', 'Chrome', 'desktop'),
(676, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-15 19:40:21', '::1', 'Chrome', 'desktop'),
(677, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 19:40:29', '::1', 'Chrome', 'desktop'),
(678, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:40:32', '::1', 'Chrome', 'desktop'),
(679, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:40:34', '::1', 'Chrome', 'desktop'),
(680, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:40:47', '::1', 'Chrome', 'desktop'),
(681, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 19:40:47', '::1', 'Chrome', 'desktop'),
(682, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 19:40:49', '::1', 'Chrome', 'desktop'),
(683, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:40:51', '::1', 'Chrome', 'desktop'),
(684, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 19:40:52', '::1', 'Chrome', 'desktop'),
(685, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-15 19:40:55', '::1', 'Chrome', 'desktop'),
(686, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-15 19:41:03', '::1', 'Chrome', 'desktop'),
(687, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:41:07', '::1', 'Chrome', 'desktop'),
(688, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:41:11', '::1', 'Chrome', 'desktop'),
(689, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-15 19:41:11', '::1', 'Chrome', 'desktop'),
(690, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 19:41:13', '::1', 'Chrome', 'desktop'),
(691, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:41:46', '::1', 'Chrome', 'desktop'),
(692, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-15 19:41:48', '::1', 'Chrome', 'desktop'),
(693, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:41:50', '::1', 'Chrome', 'desktop'),
(694, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 19:41:51', '::1', 'Chrome', 'desktop'),
(695, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 19:46:50', '::1', 'Chrome', 'desktop'),
(696, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:47:22', '::1', 'Chrome', 'desktop'),
(697, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-15 19:47:25', '::1', 'Chrome', 'desktop'),
(698, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-15 19:47:39', '::1', 'Chrome', 'desktop'),
(699, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-15 19:47:59', '::1', 'Chrome', 'desktop'),
(700, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-15 19:48:28', '::1', 'Chrome', 'desktop'),
(701, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:48:31', '::1', 'Chrome', 'desktop'),
(702, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 19:48:36', '::1', 'Chrome', 'desktop'),
(703, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:48:41', '::1', 'Chrome', 'desktop'),
(704, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 19:48:48', '::1', 'Chrome', 'desktop'),
(705, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:48:49', '::1', 'Chrome', 'desktop'),
(706, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 19:48:51', '::1', 'Chrome', 'desktop'),
(707, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:48:52', '::1', 'Chrome', 'desktop'),
(708, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:48:56', '::1', 'Chrome', 'desktop'),
(709, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:49:04', '::1', 'Chrome', 'desktop'),
(710, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 19:49:04', '::1', 'Chrome', 'desktop'),
(711, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 19:49:05', '::1', 'Chrome', 'desktop'),
(712, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-15 19:49:06', '::1', 'Chrome', 'desktop'),
(713, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-15 19:49:13', '::1', 'Chrome', 'desktop'),
(714, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:49:14', '::1', 'Chrome', 'desktop'),
(715, NULL, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:49:21', '::1', 'Chrome', 'desktop'),
(716, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-15 19:49:21', '::1', 'Chrome', 'desktop'),
(717, NULL, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-15 19:49:25', '::1', 'Chrome', 'desktop'),
(718, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:49:26', '::1', 'Chrome', 'desktop'),
(719, NULL, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-15 19:49:27', '::1', 'Chrome', 'desktop'),
(720, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:49:29', '::1', 'Chrome', 'desktop'),
(721, NULL, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-15 19:49:31', '::1', 'Chrome', 'desktop'),
(722, NULL, '/Uni_Scope1/dashboard.php', NULL, '2026-02-15 19:49:32', '::1', 'Chrome', 'desktop'),
(723, NULL, '/Uni_Scope1/logout.php', NULL, '2026-02-15 19:49:34', '::1', 'Chrome', 'desktop'),
(724, 1, '/Uni_Scope1/index.php', NULL, '2026-02-15 19:49:45', '::1', 'Chrome', 'desktop'),
(725, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-15 19:49:45', '::1', 'Chrome', 'desktop'),
(726, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-15 19:49:47', '::1', 'Chrome', 'desktop'),
(727, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-15 19:49:48', '::1', 'Chrome', 'desktop'),
(728, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-15 19:49:54', '::1', 'Chrome', 'desktop'),
(729, 1, '/Uni_Scope1/index.php', NULL, '2026-02-17 16:55:31', '::1', 'Chrome', 'desktop'),
(730, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-17 16:55:31', '::1', 'Chrome', 'desktop'),
(731, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:55:47', '::1', 'Chrome', 'desktop'),
(732, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 16:55:54', '::1', 'Chrome', 'desktop'),
(733, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 16:55:55', '::1', 'Chrome', 'desktop'),
(734, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:55:56', '::1', 'Chrome', 'desktop'),
(735, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-17 16:56:24', '::1', 'Chrome', 'desktop'),
(736, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:56:25', '::1', 'Chrome', 'desktop'),
(737, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-17 16:56:26', '::1', 'Chrome', 'desktop'),
(738, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:56:27', '::1', 'Chrome', 'desktop'),
(739, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 16:56:29', '::1', 'Chrome', 'desktop'),
(740, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:56:30', '::1', 'Chrome', 'desktop'),
(741, 1, '/Uni_Scope1/admin/send_reminders.php', NULL, '2026-02-17 16:56:31', '::1', 'Chrome', 'desktop'),
(742, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:56:32', '::1', 'Chrome', 'desktop'),
(743, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-02-17 16:56:32', '::1', 'Chrome', 'desktop'),
(744, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:56:33', '::1', 'Chrome', 'desktop'),
(745, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-17 16:56:34', '::1', 'Chrome', 'desktop'),
(746, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:58:46', '::1', 'Chrome', 'desktop'),
(747, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 16:58:47', '::1', 'Chrome', 'desktop'),
(748, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-17 16:58:50', '::1', 'Chrome', 'desktop'),
(749, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 16:58:51', '::1', 'Chrome', 'desktop'),
(750, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:58:51', '::1', 'Chrome', 'desktop'),
(751, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-17 16:58:53', '::1', 'Chrome', 'desktop'),
(752, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:58:55', '::1', 'Chrome', 'desktop'),
(753, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-17 16:58:56', '::1', 'Chrome', 'desktop'),
(754, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:58:58', '::1', 'Chrome', 'desktop'),
(755, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-02-17 16:58:59', '::1', 'Chrome', 'desktop'),
(756, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:00', '::1', 'Chrome', 'desktop'),
(757, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-02-17 16:59:01', '::1', 'Chrome', 'desktop'),
(758, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-17 16:59:03', '::1', 'Chrome', 'desktop'),
(759, 1, '/Uni_Scope1/index.php', NULL, '2026-02-17 16:59:26', '::1', 'Chrome', 'desktop'),
(760, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-17 16:59:26', '::1', 'Chrome', 'desktop'),
(761, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:27', '::1', 'Chrome', 'desktop'),
(762, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 16:59:29', '::1', 'Chrome', 'desktop'),
(763, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-17 16:59:35', '::1', 'Chrome', 'desktop'),
(764, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 16:59:36', '::1', 'Chrome', 'desktop'),
(765, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:45', '::1', 'Chrome', 'desktop'),
(766, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-17 16:59:46', '::1', 'Chrome', 'desktop'),
(767, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:48', '::1', 'Chrome', 'desktop'),
(768, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-17 16:59:49', '::1', 'Chrome', 'desktop'),
(769, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:49', '::1', 'Chrome', 'desktop'),
(770, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 16:59:50', '::1', 'Chrome', 'desktop'),
(771, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:51', '::1', 'Chrome', 'desktop'),
(772, 1, '/Uni_Scope1/admin/send_reminders.php', NULL, '2026-02-17 16:59:51', '::1', 'Chrome', 'desktop'),
(773, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:52', '::1', 'Chrome', 'desktop'),
(774, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-02-17 16:59:52', '::1', 'Chrome', 'desktop'),
(775, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:53', '::1', 'Chrome', 'desktop'),
(776, 1, '/Uni_Scope1/admin/send_reminders.php', NULL, '2026-02-17 16:59:54', '::1', 'Chrome', 'desktop'),
(777, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:54', '::1', 'Chrome', 'desktop'),
(778, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-17 16:59:55', '::1', 'Chrome', 'desktop'),
(779, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:56', '::1', 'Chrome', 'desktop'),
(780, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-17 16:59:57', '::1', 'Chrome', 'desktop'),
(781, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:57', '::1', 'Chrome', 'desktop'),
(782, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 16:59:58', '::1', 'Chrome', 'desktop'),
(783, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-17 16:59:59', '::1', 'Chrome', 'desktop'),
(784, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 17:00:37', '::1', 'Chrome', 'desktop'),
(785, 1, '/Uni_Scope1/admin/users.php?q=&role=2&faculty=', NULL, '2026-02-17 17:00:49', '::1', 'Chrome', 'desktop'),
(786, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 17:00:51', '::1', 'Chrome', 'desktop'),
(787, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-17 17:00:52', '::1', 'Chrome', 'desktop'),
(788, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-17 17:01:30', '::1', 'Chrome', 'desktop'),
(789, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-17 17:01:34', '::1', 'Chrome', 'desktop'),
(790, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-17 17:02:21', '::1', 'Chrome', 'desktop'),
(791, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-17 17:02:50', '::1', 'Chrome', 'desktop'),
(792, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-17 17:02:51', '::1', 'Chrome', 'desktop'),
(793, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-17 17:03:02', '::1', 'Chrome', 'desktop'),
(794, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-17 17:03:22', '::1', 'Chrome', 'desktop'),
(795, 1, '/Uni_Scope1/admin/users.php?created=1', NULL, '2026-02-17 17:03:25', '::1', 'Chrome', 'desktop'),
(796, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-17 17:03:38', '::1', 'Chrome', 'desktop'),
(797, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 17:03:43', '::1', 'Chrome', 'desktop'),
(798, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-17 17:03:47', '::1', 'Chrome', 'desktop'),
(799, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-17 17:03:50', '::1', 'Chrome', 'desktop'),
(800, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-17 17:04:06', '::1', 'Chrome', 'desktop'),
(801, 19, '/Uni_Scope1/index.php', NULL, '2026-02-17 17:04:44', '::1', 'Chrome', 'desktop'),
(802, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-17 17:04:44', '::1', 'Chrome', 'desktop'),
(803, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-17 17:05:20', '::1', 'Chrome', 'desktop'),
(804, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 17:05:20', '::1', 'Chrome', 'desktop'),
(805, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 17:05:23', '::1', 'Chrome', 'desktop'),
(806, 19, '/Uni_Scope1/dashboard.php?terms_accepted=1', NULL, '2026-02-17 17:05:23', '::1', 'Chrome', 'desktop'),
(807, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-17 17:17:28', '::1', 'Chrome', 'desktop'),
(808, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 17:17:30', '::1', 'Chrome', 'desktop'),
(809, 19, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-17 17:17:32', '::1', 'Chrome', 'desktop'),
(810, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 17:17:33', '::1', 'Chrome', 'desktop'),
(811, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-17 17:17:34', '::1', 'Chrome', 'desktop'),
(812, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 17:17:36', '::1', 'Chrome', 'desktop'),
(813, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 17:18:16', '::1', 'Chrome', 'desktop'),
(814, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 17:18:17', '::1', 'Chrome', 'desktop'),
(815, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 17:18:18', '::1', 'Chrome', 'desktop'),
(816, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-17 17:18:21', '::1', 'Chrome', 'desktop'),
(817, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-17 17:18:22', '::1', 'Chrome', 'desktop'),
(818, 1, '/Uni_Scope1/index.php', NULL, '2026-02-21 17:01:02', '::1', 'Chrome', 'desktop'),
(819, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-21 17:01:02', '::1', 'Chrome', 'desktop'),
(820, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-21 17:01:07', '::1', 'Chrome', 'desktop'),
(821, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-21 17:01:08', '::1', 'Chrome', 'desktop'),
(822, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-21 17:01:08', '::1', 'Chrome', 'desktop'),
(823, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-21 17:01:54', '::1', 'Chrome', 'desktop'),
(824, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-21 17:01:56', '::1', 'Chrome', 'desktop'),
(825, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-21 17:02:27', '::1', 'Chrome', 'desktop'),
(826, 1, '/Uni_Scope1/admin/user_add.php', NULL, '2026-02-21 17:02:42', '::1', 'Chrome', 'desktop'),
(827, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-21 17:03:25', '::1', 'Chrome', 'desktop'),
(828, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-21 17:03:26', '::1', 'Chrome', 'desktop'),
(829, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-21 17:03:27', '::1', 'Chrome', 'desktop'),
(830, 1, '/Uni_Scope1/admin/faculties.php?edit=2', NULL, '2026-02-21 17:03:39', '::1', 'Chrome', 'desktop'),
(831, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-02-21 17:03:41', '::1', 'Chrome', 'desktop'),
(832, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-21 17:04:30', '::1', 'Chrome', 'desktop'),
(833, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-21 17:04:32', '::1', 'Chrome', 'desktop'),
(834, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-21 17:31:49', '::1', 'Chrome', 'desktop'),
(835, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-21 17:31:52', '::1', 'Chrome', 'desktop'),
(836, 19, '/Uni_Scope1/index.php', NULL, '2026-02-21 17:32:15', '::1', 'Chrome', 'desktop'),
(837, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-21 17:32:15', '::1', 'Chrome', 'desktop'),
(838, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-21 17:32:25', '::1', 'Chrome', 'desktop'),
(839, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-21 17:32:31', '::1', 'Chrome', 'desktop'),
(840, 19, '/Uni_Scope1/logout.php', NULL, '2026-02-21 17:32:33', '::1', 'Chrome', 'desktop'),
(841, 1, '/Uni_Scope1/index.php', NULL, '2026-02-21 17:32:41', '::1', 'Chrome', 'desktop'),
(842, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-21 17:32:41', '::1', 'Chrome', 'desktop'),
(843, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-21 17:32:43', '::1', 'Chrome', 'desktop'),
(844, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-21 17:32:44', '::1', 'Chrome', 'desktop'),
(845, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-21 17:32:56', '::1', 'Chrome', 'desktop'),
(846, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-21 17:32:58', '::1', 'Chrome', 'desktop'),
(847, 19, '/Uni_Scope1/index.php', NULL, '2026-02-21 17:33:05', '::1', 'Chrome', 'desktop'),
(848, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-21 17:33:05', '::1', 'Chrome', 'desktop'),
(849, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-21 17:33:07', '::1', 'Chrome', 'desktop'),
(850, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-21 17:37:46', '::1', 'Chrome', 'desktop'),
(851, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-21 17:37:55', '::1', 'Chrome', 'desktop'),
(852, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-21 17:37:57', '::1', 'Chrome', 'desktop'),
(853, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-21 17:38:12', '::1', 'Chrome', 'desktop'),
(854, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-21 17:38:19', '::1', 'Chrome', 'desktop'),
(855, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-21 17:38:20', '::1', 'Chrome', 'desktop'),
(856, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-21 17:38:53', '::1', 'Chrome', 'desktop'),
(857, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-21 17:39:02', '::1', 'Chrome', 'desktop'),
(858, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-21 17:39:04', '::1', 'Chrome', 'desktop'),
(859, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-21 17:39:31', '::1', 'Chrome', 'desktop'),
(860, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-21 17:39:35', '::1', 'Chrome', 'desktop'),
(861, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-21 17:39:36', '::1', 'Chrome', 'desktop'),
(862, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-21 17:39:49', '::1', 'Chrome', 'desktop'),
(863, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-21 17:40:11', '::1', 'Chrome', 'desktop'),
(864, 17, '/Uni_Scope1/index.php', NULL, '2026-02-22 07:33:22', '::1', 'Chrome', 'desktop'),
(865, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-22 07:33:22', '::1', 'Chrome', 'desktop'),
(866, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-22 07:33:29', '::1', 'Chrome', 'desktop'),
(867, 19, '/Uni_Scope1/index.php', NULL, '2026-02-22 07:33:40', '::1', 'Chrome', 'desktop'),
(868, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-22 07:33:40', '::1', 'Chrome', 'desktop'),
(869, 19, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-22 07:33:43', '::1', 'Chrome', 'desktop'),
(870, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 07:34:04', '::1', 'Chrome', 'desktop'),
(871, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 07:34:06', '::1', 'Chrome', 'desktop'),
(872, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 07:34:45', '::1', 'Chrome', 'desktop'),
(873, 19, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-22 07:34:47', '::1', 'Chrome', 'desktop'),
(874, 19, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-22 07:40:01', '::1', 'Chrome', 'desktop'),
(875, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 07:40:02', '::1', 'Chrome', 'desktop'),
(876, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 07:40:04', '::1', 'Chrome', 'desktop'),
(877, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 07:40:56', '::1', 'Chrome', 'desktop'),
(878, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 07:41:05', '::1', 'Chrome', 'desktop'),
(879, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 07:41:07', '::1', 'Chrome', 'desktop'),
(880, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 07:41:13', '::1', 'Chrome', 'desktop'),
(881, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 07:41:16', '::1', 'Chrome', 'desktop'),
(882, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 07:42:06', '::1', 'Chrome', 'desktop'),
(883, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 07:42:58', '::1', 'Chrome', 'desktop'),
(884, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 07:49:09', '::1', 'Chrome', 'desktop'),
(885, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 07:53:53', '::1', 'Chrome', 'desktop'),
(886, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 07:59:07', '::1', 'Chrome', 'desktop'),
(887, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 07:59:13', '::1', 'Chrome', 'desktop'),
(888, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 07:59:17', '::1', 'Chrome', 'desktop'),
(889, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 07:59:18', '::1', 'Chrome', 'desktop'),
(890, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 07:59:20', '::1', 'Chrome', 'desktop'),
(891, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 07:59:22', '::1', 'Chrome', 'desktop'),
(892, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 07:59:23', '::1', 'Chrome', 'desktop'),
(893, 19, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-22 07:59:23', '::1', 'Chrome', 'desktop'),
(894, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 07:59:25', '::1', 'Chrome', 'desktop'),
(895, 19, '/Uni_Scope1/logout.php', NULL, '2026-02-22 08:07:47', '::1', 'Chrome', 'desktop'),
(896, 17, '/Uni_Scope1/index.php', NULL, '2026-02-22 08:07:52', '::1', 'Chrome', 'desktop'),
(897, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-22 08:07:52', '::1', 'Chrome', 'desktop'),
(898, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-22 08:10:14', '::1', 'Chrome', 'desktop'),
(899, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:10:21', '::1', 'Chrome', 'desktop'),
(900, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 08:10:26', '::1', 'Chrome', 'desktop'),
(901, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 08:10:38', '::1', 'Chrome', 'desktop'),
(902, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:10:59', '::1', 'Chrome', 'desktop'),
(903, 17, '/Uni_Scope1/coordinator/submission.php?id=10', NULL, '2026-02-22 08:11:04', '::1', 'Chrome', 'desktop'),
(904, 17, '/Uni_Scope1/coordinator/submission.php?id=10', NULL, '2026-02-22 08:11:06', '::1', 'Chrome', 'desktop'),
(905, 17, '/Uni_Scope1/coordinator/submission.php?id=10', NULL, '2026-02-22 08:11:11', '::1', 'Chrome', 'desktop'),
(906, 17, '/Uni_Scope1/coordinator/submission.php?id=10', NULL, '2026-02-22 08:11:16', '::1', 'Chrome', 'desktop'),
(907, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:11:20', '::1', 'Chrome', 'desktop'),
(908, 17, '/Uni_Scope1/coordinator/submission.php?id=9', NULL, '2026-02-22 08:11:22', '::1', 'Chrome', 'desktop'),
(909, 17, '/Uni_Scope1/coordinator/submission.php?id=9', NULL, '2026-02-22 08:11:26', '::1', 'Chrome', 'desktop'),
(910, 17, '/Uni_Scope1/coordinator/submission.php?id=9', NULL, '2026-02-22 08:11:30', '::1', 'Chrome', 'desktop'),
(911, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:11:37', '::1', 'Chrome', 'desktop'),
(912, 17, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-22 08:12:04', '::1', 'Chrome', 'desktop'),
(913, 17, '/Uni_Scope1/coordinator/review.php?filter=selected', NULL, '2026-02-22 08:12:05', '::1', 'Chrome', 'desktop'),
(914, 17, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-22 08:12:06', '::1', 'Chrome', 'desktop'),
(915, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:12:07', '::1', 'Chrome', 'desktop'),
(916, 17, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-22 08:12:14', '::1', 'Chrome', 'desktop'),
(917, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:12:15', '::1', 'Chrome', 'desktop'),
(918, 17, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-22 08:12:16', '::1', 'Chrome', 'desktop'),
(919, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:12:16', '::1', 'Chrome', 'desktop'),
(920, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:12:19', '::1', 'Chrome', 'desktop'),
(921, 17, '/Uni_Scope1/coordinator/statistics.php', NULL, '2026-02-22 08:12:21', '::1', 'Chrome', 'desktop'),
(922, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:12:27', '::1', 'Chrome', 'desktop'),
(923, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:12:29', '::1', 'Chrome', 'desktop'),
(924, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:12:30', '::1', 'Chrome', 'desktop'),
(925, 17, '/Uni_Scope1/coordinator/statistics.php', NULL, '2026-02-22 08:12:30', '::1', 'Chrome', 'desktop'),
(926, 17, '/Uni_Scope1/coordinator/exception_reports.php', NULL, '2026-02-22 08:12:31', '::1', 'Chrome', 'desktop'),
(927, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:12:31', '::1', 'Chrome', 'desktop'),
(928, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:12:32', '::1', 'Chrome', 'desktop'),
(929, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:12:33', '::1', 'Chrome', 'desktop'),
(930, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:12:37', '::1', 'Chrome', 'desktop'),
(931, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:12:39', '::1', 'Chrome', 'desktop'),
(932, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:12:41', '::1', 'Chrome', 'desktop'),
(933, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:14:39', '::1', 'Chrome', 'desktop'),
(934, 17, '/Uni_Scope1/coordinator/review.php?filter=selected', NULL, '2026-02-22 08:14:43', '::1', 'Chrome', 'desktop'),
(935, 17, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-22 08:14:44', '::1', 'Chrome', 'desktop'),
(936, 17, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-22 08:14:45', '::1', 'Chrome', 'desktop'),
(937, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 08:14:45', '::1', 'Chrome', 'desktop'),
(938, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-22 08:14:54', '::1', 'Chrome', 'desktop'),
(939, 19, '/Uni_Scope1/index.php', NULL, '2026-02-22 08:15:02', '::1', 'Chrome', 'desktop'),
(940, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-22 08:15:02', '::1', 'Chrome', 'desktop'),
(941, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:15:04', '::1', 'Chrome', 'desktop'),
(942, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:16:17', '::1', 'Chrome', 'desktop'),
(943, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:22:07', '::1', 'Chrome', 'desktop'),
(944, 19, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-22 08:22:10', '::1', 'Chrome', 'desktop'),
(945, 19, '/Uni_Scope1/download_image.php?id=3&download=1', NULL, '2026-02-22 08:22:19', '::1', 'Chrome', 'desktop'),
(946, 19, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-22 08:24:33', '::1', 'Chrome', 'desktop'),
(947, 19, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-22 08:24:38', '::1', 'Chrome', 'desktop'),
(948, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:25:29', '::1', 'Chrome', 'desktop'),
(949, 19, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-22 08:26:25', '::1', 'Chrome', 'desktop'),
(950, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:26:30', '::1', 'Chrome', 'desktop'),
(951, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:27:36', '::1', 'Chrome', 'desktop'),
(952, 19, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-22 08:27:37', '::1', 'Chrome', 'desktop'),
(953, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:28:04', '::1', 'Chrome', 'desktop'),
(954, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:28:10', '::1', 'Chrome', 'desktop'),
(955, 19, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-22 08:28:24', '::1', 'Chrome', 'desktop'),
(956, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:28:39', '::1', 'Chrome', 'desktop'),
(957, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:28:54', '::1', 'Chrome', 'desktop'),
(958, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:30:42', '::1', 'Chrome', 'desktop'),
(959, 19, '/Uni_Scope1/student/my_submissions.php?filter=draft', NULL, '2026-02-22 08:30:44', '::1', 'Chrome', 'desktop'),
(960, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:30:45', '::1', 'Chrome', 'desktop'),
(961, 19, '/Uni_Scope1/student/my_submissions.php?filter=pending', NULL, '2026-02-22 08:30:47', '::1', 'Chrome', 'desktop'),
(962, 19, '/Uni_Scope1/student/my_submissions.php?filter=commented', NULL, '2026-02-22 08:30:47', '::1', 'Chrome', 'desktop'),
(963, 19, '/Uni_Scope1/student/my_submissions.php?filter=selected', NULL, '2026-02-22 08:30:48', '::1', 'Chrome', 'desktop'),
(964, 19, '/Uni_Scope1/student/my_submissions.php?filter=rejected', NULL, '2026-02-22 08:30:48', '::1', 'Chrome', 'desktop'),
(965, 19, '/Uni_Scope1/student/my_submissions.php?filter=selected', NULL, '2026-02-22 08:30:49', '::1', 'Chrome', 'desktop'),
(966, 19, '/Uni_Scope1/student/my_submissions.php?filter=commented', NULL, '2026-02-22 08:30:50', '::1', 'Chrome', 'desktop'),
(967, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:30:50', '::1', 'Chrome', 'desktop'),
(968, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:31:07', '::1', 'Chrome', 'desktop'),
(969, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 08:31:09', '::1', 'Chrome', 'desktop');
INSERT INTO `system_logs` (`log_id`, `user_id`, `page_visited`, `action_taken`, `log_time`, `ip_address`, `browser`, `device_type`) VALUES
(970, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:31:10', '::1', 'Chrome', 'desktop'),
(971, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:31:12', '::1', 'Chrome', 'desktop'),
(972, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:31:14', '::1', 'Chrome', 'desktop'),
(973, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 08:31:15', '::1', 'Chrome', 'desktop'),
(974, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:31:16', '::1', 'Chrome', 'desktop'),
(975, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:31:17', '::1', 'Chrome', 'desktop'),
(976, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:31:44', '::1', 'Chrome', 'desktop'),
(977, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 08:31:45', '::1', 'Chrome', 'desktop'),
(978, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:32:01', '::1', 'Chrome', 'desktop'),
(979, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:32:03', '::1', 'Chrome', 'desktop'),
(980, 19, '/Uni_Scope1/student/my_submissions.php?filter=draft', NULL, '2026-02-22 08:33:10', '::1', 'Chrome', 'desktop'),
(981, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:33:11', '::1', 'Chrome', 'desktop'),
(982, 19, '/Uni_Scope1/student/my_submissions.php?filter=pending', NULL, '2026-02-22 08:33:13', '::1', 'Chrome', 'desktop'),
(983, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:33:17', '::1', 'Chrome', 'desktop'),
(984, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:34:13', '::1', 'Chrome', 'desktop'),
(985, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 08:34:27', '::1', 'Chrome', 'desktop'),
(986, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:34:28', '::1', 'Chrome', 'desktop'),
(987, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:34:30', '::1', 'Chrome', 'desktop'),
(988, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:35:15', '::1', 'Chrome', 'desktop'),
(989, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:35:57', '::1', 'Chrome', 'desktop'),
(990, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:36:18', '::1', 'Chrome', 'desktop'),
(991, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:37:12', '::1', 'Chrome', 'desktop'),
(992, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 08:37:25', '::1', 'Chrome', 'desktop'),
(993, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 08:37:49', '::1', 'Chrome', 'desktop'),
(994, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:37:50', '::1', 'Chrome', 'desktop'),
(995, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:37:54', '::1', 'Chrome', 'desktop'),
(996, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:43:18', '::1', 'Chrome', 'desktop'),
(997, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:43:52', '::1', 'Chrome', 'desktop'),
(998, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:44:28', '::1', 'Chrome', 'desktop'),
(999, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:45:21', '::1', 'Chrome', 'desktop'),
(1000, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-22 08:45:30', '::1', 'Chrome', 'desktop'),
(1001, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-22 08:45:32', '::1', 'Chrome', 'desktop'),
(1002, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:45:35', '::1', 'Chrome', 'desktop'),
(1003, 19, '/Uni_Scope1/student/my_submissions.php?filter=rejected', NULL, '2026-02-22 08:46:06', '::1', 'Chrome', 'desktop'),
(1004, 19, '/Uni_Scope1/student/my_submissions.php?filter=draft', NULL, '2026-02-22 08:46:08', '::1', 'Chrome', 'desktop'),
(1005, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:46:09', '::1', 'Chrome', 'desktop'),
(1006, 19, '/Uni_Scope1/student/my_submissions.php?filter=pending', NULL, '2026-02-22 08:46:10', '::1', 'Chrome', 'desktop'),
(1007, 19, '/Uni_Scope1/student/my_submissions.php?filter=commented', NULL, '2026-02-22 08:46:10', '::1', 'Chrome', 'desktop'),
(1008, 19, '/Uni_Scope1/student/my_submissions.php?filter=selected', NULL, '2026-02-22 08:46:11', '::1', 'Chrome', 'desktop'),
(1009, 19, '/Uni_Scope1/student/my_submissions.php?filter=rejected', NULL, '2026-02-22 08:46:12', '::1', 'Chrome', 'desktop'),
(1010, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:46:13', '::1', 'Chrome', 'desktop'),
(1011, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:47:35', '::1', 'Chrome', 'desktop'),
(1012, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-22 08:48:11', '::1', 'Chrome', 'desktop'),
(1013, 17, '/Uni_Scope1/index.php', NULL, '2026-02-22 10:27:12', '::1', 'Chrome', 'desktop'),
(1014, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-22 10:27:12', '::1', 'Chrome', 'desktop'),
(1015, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:27:17', '::1', 'Chrome', 'desktop'),
(1016, 17, '/Uni_Scope1/coordinator/submission.php?id=12', NULL, '2026-02-22 10:27:22', '::1', 'Chrome', 'desktop'),
(1017, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:27:24', '::1', 'Chrome', 'desktop'),
(1018, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:28:06', '::1', 'Chrome', 'desktop'),
(1019, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:28:09', '::1', 'Chrome', 'desktop'),
(1020, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:28:22', '::1', 'Chrome', 'desktop'),
(1021, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:29:05', '::1', 'Chrome', 'desktop'),
(1022, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:29:10', '::1', 'Chrome', 'desktop'),
(1023, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:29:38', '::1', 'Chrome', 'desktop'),
(1024, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:31:44', '::1', 'Chrome', 'desktop'),
(1025, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:31:53', '::1', 'Chrome', 'desktop'),
(1026, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:32:25', '::1', 'Chrome', 'desktop'),
(1027, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:33:19', '::1', 'Chrome', 'desktop'),
(1028, 17, '/Uni_Scope1/coordinator/review.php?search=sun', NULL, '2026-02-22 10:33:31', '::1', 'Chrome', 'desktop'),
(1029, 17, '/Uni_Scope1/coordinator/review.php?search=sun', NULL, '2026-02-22 10:33:33', '::1', 'Chrome', 'desktop'),
(1030, 17, '/Uni_Scope1/coordinator/review.php?search=sun', NULL, '2026-02-22 10:33:33', '::1', 'Chrome', 'desktop'),
(1031, 17, '/Uni_Scope1/coordinator/review.php?search=sun', NULL, '2026-02-22 10:33:34', '::1', 'Chrome', 'desktop'),
(1032, 17, '/Uni_Scope1/coordinator/review.php?search=Sun', NULL, '2026-02-22 10:33:39', '::1', 'Chrome', 'desktop'),
(1033, 17, '/Uni_Scope1/coordinator/review.php?search=Upl', NULL, '2026-02-22 10:33:44', '::1', 'Chrome', 'desktop'),
(1034, 17, '/Uni_Scope1/coordinator/review.php?search=Upl', NULL, '2026-02-22 10:33:49', '::1', 'Chrome', 'desktop'),
(1035, 17, '/Uni_Scope1/coordinator/review.php?search=u', NULL, '2026-02-22 10:33:52', '::1', 'Chrome', 'desktop'),
(1036, 17, '/Uni_Scope1/coordinator/review.php?search=', NULL, '2026-02-22 10:33:56', '::1', 'Chrome', 'desktop'),
(1037, 17, '/Uni_Scope1/coordinator/review.php?search=', NULL, '2026-02-22 10:35:02', '::1', 'Chrome', 'desktop'),
(1038, 17, '/Uni_Scope1/coordinator/review.php?search=', NULL, '2026-02-22 10:35:03', '::1', 'Chrome', 'desktop'),
(1039, 17, '/Uni_Scope1/coordinator/review.php?search=', NULL, '2026-02-22 10:35:04', '::1', 'Chrome', 'desktop'),
(1040, 17, '/Uni_Scope1/coordinator/review.php?search=sun', NULL, '2026-02-22 10:35:06', '::1', 'Chrome', 'desktop'),
(1041, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:35:09', '::1', 'Chrome', 'desktop'),
(1042, 17, '/Uni_Scope1/coordinator/review.php?search=Upl', NULL, '2026-02-22 10:35:12', '::1', 'Chrome', 'desktop'),
(1043, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:35:13', '::1', 'Chrome', 'desktop'),
(1044, 17, '/Uni_Scope1/coordinator/review.php?search=Upl', NULL, '2026-02-22 10:35:16', '::1', 'Chrome', 'desktop'),
(1045, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:35:21', '::1', 'Chrome', 'desktop'),
(1046, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:35:45', '::1', 'Chrome', 'desktop'),
(1047, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:35:48', '::1', 'Chrome', 'desktop'),
(1048, 17, '/Uni_Scope1/coordinator/submission.php?id=10', NULL, '2026-02-22 10:35:49', '::1', 'Chrome', 'desktop'),
(1049, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:36:15', '::1', 'Chrome', 'desktop'),
(1050, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:36:15', '::1', 'Chrome', 'desktop'),
(1051, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:37:45', '::1', 'Chrome', 'desktop'),
(1052, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:39:12', '::1', 'Chrome', 'desktop'),
(1053, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:39:43', '::1', 'Chrome', 'desktop'),
(1054, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:43:06', '::1', 'Chrome', 'desktop'),
(1055, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:43:12', '::1', 'Chrome', 'desktop'),
(1056, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:43:13', '::1', 'Chrome', 'desktop'),
(1057, 17, '/Uni_Scope1/coordinator/submission.php?id=9', NULL, '2026-02-22 10:43:30', '::1', 'Chrome', 'desktop'),
(1058, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:43:33', '::1', 'Chrome', 'desktop'),
(1059, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:43:55', '::1', 'Chrome', 'desktop'),
(1060, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:44:05', '::1', 'Chrome', 'desktop'),
(1061, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:48:35', '::1', 'Chrome', 'desktop'),
(1062, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:49:34', '::1', 'Chrome', 'desktop'),
(1063, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:49:53', '::1', 'Chrome', 'desktop'),
(1064, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:49:55', '::1', 'Chrome', 'desktop'),
(1065, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:49:56', '::1', 'Chrome', 'desktop'),
(1066, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:49:56', '::1', 'Chrome', 'desktop'),
(1067, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:49:57', '::1', 'Chrome', 'desktop'),
(1068, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:50:01', '::1', 'Chrome', 'desktop'),
(1069, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:50:03', '::1', 'Chrome', 'desktop'),
(1070, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:50:03', '::1', 'Chrome', 'desktop'),
(1071, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:50:03', '::1', 'Chrome', 'desktop'),
(1072, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:50:03', '::1', 'Chrome', 'desktop'),
(1073, 17, '/Uni_Scope1/coordinator/submission.php?id=10', NULL, '2026-02-22 10:50:07', '::1', 'Chrome', 'desktop'),
(1074, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:50:08', '::1', 'Chrome', 'desktop'),
(1075, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:50:20', '::1', 'Chrome', 'desktop'),
(1076, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:50:26', '::1', 'Chrome', 'desktop'),
(1077, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:51:04', '::1', 'Chrome', 'desktop'),
(1078, 17, '/Uni_Scope1/coordinator/submission.php?id=10', NULL, '2026-02-22 10:51:05', '::1', 'Chrome', 'desktop'),
(1079, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:51:11', '::1', 'Chrome', 'desktop'),
(1080, 17, '/Uni_Scope1/coordinator/submission.php?id=9', NULL, '2026-02-22 10:52:15', '::1', 'Chrome', 'desktop'),
(1081, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:52:25', '::1', 'Chrome', 'desktop'),
(1082, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:52:32', '::1', 'Chrome', 'desktop'),
(1083, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:52:35', '::1', 'Chrome', 'desktop'),
(1084, 17, '/Uni_Scope1/coordinator/submission.php?id=9', NULL, '2026-02-22 10:52:41', '::1', 'Chrome', 'desktop'),
(1085, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:52:43', '::1', 'Chrome', 'desktop'),
(1086, 17, '/Uni_Scope1/coordinator/submission.php?id=10', NULL, '2026-02-22 10:52:45', '::1', 'Chrome', 'desktop'),
(1087, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:52:47', '::1', 'Chrome', 'desktop'),
(1088, 17, '/Uni_Scope1/coordinator/submission.php?id=9', NULL, '2026-02-22 10:52:49', '::1', 'Chrome', 'desktop'),
(1089, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:52:51', '::1', 'Chrome', 'desktop'),
(1090, 17, '/Uni_Scope1/coordinator/submission.php?id=8', NULL, '2026-02-22 10:52:56', '::1', 'Chrome', 'desktop'),
(1091, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:52:58', '::1', 'Chrome', 'desktop'),
(1092, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-22 10:53:00', '::1', 'Chrome', 'desktop'),
(1093, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:53:02', '::1', 'Chrome', 'desktop'),
(1094, 17, '/Uni_Scope1/coordinator/submission.php?id=10', NULL, '2026-02-22 10:53:04', '::1', 'Chrome', 'desktop'),
(1095, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:53:05', '::1', 'Chrome', 'desktop'),
(1096, 17, '/Uni_Scope1/coordinator/submission.php?id=9', NULL, '2026-02-22 10:53:06', '::1', 'Chrome', 'desktop'),
(1097, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:53:08', '::1', 'Chrome', 'desktop'),
(1098, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:53:10', '::1', 'Chrome', 'desktop'),
(1099, 17, '/Uni_Scope1/coordinator/review.php?filter=selected', NULL, '2026-02-22 10:53:14', '::1', 'Chrome', 'desktop'),
(1100, 17, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-22 10:53:15', '::1', 'Chrome', 'desktop'),
(1101, 17, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-22 10:53:15', '::1', 'Chrome', 'desktop'),
(1102, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-22 10:53:16', '::1', 'Chrome', 'desktop'),
(1103, 17, '/Uni_Scope1/index.php', NULL, '2026-02-23 19:53:51', '::1', 'Chrome', 'desktop'),
(1104, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-23 19:53:51', '::1', 'Chrome', 'desktop'),
(1105, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-23 19:59:19', '::1', 'Chrome', 'desktop'),
(1106, 19, '/Uni_Scope1/index.php', NULL, '2026-02-23 19:59:26', '::1', 'Chrome', 'desktop'),
(1107, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-23 19:59:26', '::1', 'Chrome', 'desktop'),
(1108, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-23 19:59:28', '::1', 'Chrome', 'desktop'),
(1109, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-23 20:00:19', '::1', 'Chrome', 'desktop'),
(1110, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-23 20:00:28', '::1', 'Chrome', 'desktop'),
(1111, 19, '/Uni_Scope1/logout.php', NULL, '2026-02-23 20:03:25', '::1', 'Chrome', 'desktop'),
(1112, 17, '/Uni_Scope1/index.php', NULL, '2026-02-23 20:03:30', '::1', 'Chrome', 'desktop'),
(1113, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-23 20:03:30', '::1', 'Chrome', 'desktop'),
(1114, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-23 20:03:37', '::1', 'Chrome', 'desktop'),
(1115, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:03:40', '::1', 'Chrome', 'desktop'),
(1116, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:08:03', '::1', 'Chrome', 'desktop'),
(1117, 17, '/Uni_Scope1/download.php?id=13&inline=1', NULL, '2026-02-23 20:08:05', '::1', 'Chrome', 'desktop'),
(1118, 17, '/Uni_Scope1/download.php?id=13&inline=1', NULL, '2026-02-23 20:08:09', '::1', 'Chrome', 'desktop'),
(1119, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:11:07', '::1', 'Chrome', 'desktop'),
(1120, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:13:44', '::1', 'Chrome', 'desktop'),
(1121, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:17:24', '::1', 'Chrome', 'desktop'),
(1122, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-23 20:17:33', '::1', 'Chrome', 'desktop'),
(1123, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-23 20:17:35', '::1', 'Chrome', 'desktop'),
(1124, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-23 20:17:42', '::1', 'Chrome', 'desktop'),
(1125, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:17:43', '::1', 'Chrome', 'desktop'),
(1126, 17, '/Uni_Scope1/download.php?id=13&inline=1', NULL, '2026-02-23 20:17:44', '::1', 'Chrome', 'desktop'),
(1127, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:18:11', '::1', 'Chrome', 'desktop'),
(1128, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:20:05', '::1', 'Chrome', 'desktop'),
(1129, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:23:53', '::1', 'Chrome', 'desktop'),
(1130, 17, '/Uni_Scope1/coordinator/preview_document.php?id=13', NULL, '2026-02-23 20:23:55', '::1', 'Chrome', 'desktop'),
(1131, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:24:07', '::1', 'Chrome', 'desktop'),
(1132, 17, '/Uni_Scope1/coordinator/preview_document.php?id=13', NULL, '2026-02-23 20:24:10', '::1', 'Chrome', 'desktop'),
(1133, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:24:11', '::1', 'Chrome', 'desktop'),
(1134, 17, '/Uni_Scope1/coordinator/preview_document.php?id=13', NULL, '2026-02-23 20:24:17', '::1', 'Chrome', 'desktop'),
(1135, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:24:18', '::1', 'Chrome', 'desktop'),
(1136, 17, '/Uni_Scope1/coordinator/preview_document.php?id=13', NULL, '2026-02-23 20:24:19', '::1', 'Chrome', 'desktop'),
(1137, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:25:24', '::1', 'Chrome', 'desktop'),
(1138, 17, '/Uni_Scope1/coordinator/preview_document.php?id=13', NULL, '2026-02-23 20:25:29', '::1', 'Chrome', 'desktop'),
(1139, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:25:31', '::1', 'Chrome', 'desktop'),
(1140, 17, '/Uni_Scope1/coordinator/preview_document.php?id=13', NULL, '2026-02-23 20:25:32', '::1', 'Chrome', 'desktop'),
(1141, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:25:42', '::1', 'Chrome', 'desktop'),
(1142, 17, '/Uni_Scope1/coordinator/preview_document.php?id=13', NULL, '2026-02-23 20:41:51', '::1', 'Chrome', 'desktop'),
(1143, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:41:56', '::1', 'Chrome', 'desktop'),
(1144, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-23 20:45:59', '::1', 'Chrome', 'desktop'),
(1145, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-23 20:46:01', '::1', 'Chrome', 'desktop'),
(1146, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-23 20:46:29', '::1', 'Chrome', 'desktop'),
(1147, 19, '/Uni_Scope1/index.php', NULL, '2026-02-23 20:46:36', '::1', 'Chrome', 'desktop'),
(1148, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-23 20:46:36', '::1', 'Chrome', 'desktop'),
(1149, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-23 20:46:39', '::1', 'Chrome', 'desktop'),
(1150, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-23 20:52:13', '::1', 'Chrome', 'desktop'),
(1151, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-23 20:52:15', '::1', 'Chrome', 'desktop'),
(1152, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-23 20:52:16', '::1', 'Chrome', 'desktop'),
(1153, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-23 20:52:18', '::1', 'Chrome', 'desktop'),
(1154, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-23 20:52:19', '::1', 'Chrome', 'desktop'),
(1155, 19, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-23 20:52:20', '::1', 'Chrome', 'desktop'),
(1156, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-23 20:52:21', '::1', 'Chrome', 'desktop'),
(1157, 17, '/Uni_Scope1/index.php', NULL, '2026-02-24 22:47:41', '::1', 'Chrome', 'desktop'),
(1158, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-24 22:47:41', '::1', 'Chrome', 'desktop'),
(1159, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-24 22:47:44', '::1', 'Chrome', 'desktop'),
(1160, 19, '/Uni_Scope1/index.php', NULL, '2026-02-24 22:48:04', '::1', 'Chrome', 'desktop'),
(1161, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-24 22:48:04', '::1', 'Chrome', 'desktop'),
(1162, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-24 22:54:13', '::1', 'Chrome', 'desktop'),
(1163, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-24 22:54:16', '::1', 'Chrome', 'desktop'),
(1164, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-24 22:54:17', '::1', 'Chrome', 'desktop'),
(1165, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-24 22:54:38', '::1', 'Chrome', 'desktop'),
(1166, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-24 22:54:40', '::1', 'Chrome', 'desktop'),
(1167, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-24 23:11:35', '::1', 'Chrome', 'desktop'),
(1168, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-24 23:24:39', '::1', 'Chrome', 'desktop'),
(1169, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-24 23:28:06', '::1', 'Chrome', 'desktop'),
(1170, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-24 23:28:10', '::1', 'Chrome', 'desktop'),
(1171, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-24 23:28:11', '::1', 'Chrome', 'desktop'),
(1172, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-24 23:28:12', '::1', 'Chrome', 'desktop'),
(1173, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-24 23:28:18', '::1', 'Chrome', 'desktop'),
(1174, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-24 23:28:24', '::1', 'Chrome', 'desktop'),
(1175, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-24 23:28:27', '::1', 'Chrome', 'desktop'),
(1176, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-24 23:28:28', '::1', 'Chrome', 'desktop'),
(1177, 19, '/Uni_Scope1/logout.php', NULL, '2026-02-24 23:34:17', '::1', 'Chrome', 'desktop'),
(1178, 1, '/Uni_Scope1/index.php', NULL, '2026-02-24 23:34:25', '::1', 'Chrome', 'desktop'),
(1179, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-24 23:34:25', '::1', 'Chrome', 'desktop'),
(1180, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-24 23:34:27', '::1', 'Chrome', 'desktop'),
(1181, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-24 23:34:29', '::1', 'Chrome', 'desktop'),
(1182, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-24 23:34:55', '::1', 'Chrome', 'desktop'),
(1183, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-24 23:34:57', '::1', 'Chrome', 'desktop'),
(1184, 19, '/Uni_Scope1/index.php', NULL, '2026-02-24 23:35:03', '::1', 'Chrome', 'desktop'),
(1185, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-24 23:35:03', '::1', 'Chrome', 'desktop'),
(1186, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-24 23:35:08', '::1', 'Chrome', 'desktop'),
(1187, 19, '/Uni_Scope1/logout.php', NULL, '2026-02-24 23:40:01', '::1', 'Chrome', 'desktop'),
(1188, 17, '/Uni_Scope1/index.php', NULL, '2026-02-24 23:40:06', '::1', 'Chrome', 'desktop'),
(1189, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-24 23:40:06', '::1', 'Chrome', 'desktop'),
(1190, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-24 23:40:09', '::1', 'Chrome', 'desktop'),
(1191, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-02-24 23:41:15', '::1', 'Chrome', 'desktop'),
(1192, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-24 23:41:28', '::1', 'Chrome', 'desktop'),
(1193, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-24 23:41:30', '::1', 'Chrome', 'desktop'),
(1194, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-24 23:41:32', '::1', 'Chrome', 'desktop'),
(1195, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-24 23:41:32', '::1', 'Chrome', 'desktop'),
(1196, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-24 23:41:35', '::1', 'Chrome', 'desktop'),
(1197, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-24 23:41:39', '::1', 'Chrome', 'desktop'),
(1198, 1, '/Uni_Scope1/index.php', NULL, '2026-02-24 23:41:51', '::1', 'Chrome', 'desktop'),
(1199, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-24 23:41:51', '::1', 'Chrome', 'desktop'),
(1200, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-24 23:41:52', '::1', 'Chrome', 'desktop'),
(1201, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-24 23:41:54', '::1', 'Chrome', 'desktop'),
(1202, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-24 23:42:17', '::1', 'Chrome', 'desktop'),
(1203, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-24 23:42:22', '::1', 'Chrome', 'desktop'),
(1204, 17, '/Uni_Scope1/index.php', NULL, '2026-02-24 23:42:26', '::1', 'Chrome', 'desktop'),
(1205, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-24 23:42:26', '::1', 'Chrome', 'desktop'),
(1206, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-24 23:58:55', '::1', 'Chrome', 'desktop'),
(1207, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-24 23:58:58', '::1', 'Chrome', 'desktop'),
(1208, 17, '/Uni_Scope1/coordinator/submission.php?id=18', NULL, '2026-02-24 23:59:18', '::1', 'Chrome', 'desktop'),
(1209, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-24 23:59:20', '::1', 'Chrome', 'desktop'),
(1210, 17, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-24 23:59:37', '::1', 'Chrome', 'desktop'),
(1211, 17, '/Uni_Scope1/coordinator/review.php?filter=commented', NULL, '2026-02-24 23:59:39', '::1', 'Chrome', 'desktop'),
(1212, 17, '/Uni_Scope1/coordinator/review.php?filter=selected', NULL, '2026-02-24 23:59:40', '::1', 'Chrome', 'desktop'),
(1213, 17, '/Uni_Scope1/coordinator/review.php?filter=pending', NULL, '2026-02-24 23:59:40', '::1', 'Chrome', 'desktop'),
(1214, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-24 23:59:41', '::1', 'Chrome', 'desktop'),
(1215, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:02:41', '::1', 'Chrome', 'desktop'),
(1216, 17, '/Uni_Scope1/coordinator/submission.php?id=9', NULL, '2026-02-25 00:03:54', '::1', 'Chrome', 'desktop'),
(1217, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:04:01', '::1', 'Chrome', 'desktop'),
(1218, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:07:09', '::1', 'Chrome', 'desktop'),
(1219, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:07:10', '::1', 'Chrome', 'desktop'),
(1220, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:07:11', '::1', 'Chrome', 'desktop'),
(1221, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:07:11', '::1', 'Chrome', 'desktop'),
(1222, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:07:12', '::1', 'Chrome', 'desktop'),
(1223, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:07:13', '::1', 'Chrome', 'desktop'),
(1224, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:07:13', '::1', 'Chrome', 'desktop'),
(1225, 17, '/Uni_Scope1/coordinator/submission.php?id=10', NULL, '2026-02-25 00:07:16', '::1', 'Chrome', 'desktop'),
(1226, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:07:17', '::1', 'Chrome', 'desktop'),
(1227, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-25 00:07:20', '::1', 'Chrome', 'desktop'),
(1228, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:07:21', '::1', 'Chrome', 'desktop'),
(1229, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:09:14', '::1', 'Chrome', 'desktop'),
(1230, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:09:25', '::1', 'Chrome', 'desktop'),
(1231, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:11:03', '::1', 'Chrome', 'desktop'),
(1232, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 00:11:07', '::1', 'Chrome', 'desktop'),
(1233, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:11:08', '::1', 'Chrome', 'desktop'),
(1234, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 00:11:20', '::1', 'Chrome', 'desktop'),
(1235, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 00:14:41', '::1', 'Chrome', 'desktop'),
(1236, 17, '/Uni_Scope1/index.php', NULL, '2026-02-25 07:59:26', '::1', 'Chrome', 'desktop'),
(1237, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-25 07:59:26', '::1', 'Chrome', 'desktop'),
(1238, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 07:59:28', '::1', 'Chrome', 'desktop'),
(1239, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 07:59:33', '::1', 'Chrome', 'desktop'),
(1240, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:06:20', '::1', 'Chrome', 'desktop'),
(1241, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:06:49', '::1', 'Chrome', 'desktop'),
(1242, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:06:52', '::1', 'Chrome', 'desktop'),
(1243, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:06:59', '::1', 'Chrome', 'desktop'),
(1244, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 08:07:00', '::1', 'Chrome', 'desktop'),
(1245, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-25 08:07:12', '::1', 'Chrome', 'desktop'),
(1246, 1, '/Uni_Scope1/index.php', NULL, '2026-02-25 08:07:21', '::1', 'Chrome', 'desktop'),
(1247, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-25 08:07:21', '::1', 'Chrome', 'desktop'),
(1248, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-25 08:07:22', '::1', 'Chrome', 'desktop'),
(1249, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-25 08:07:27', '::1', 'Chrome', 'desktop'),
(1250, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-25 08:07:35', '::1', 'Chrome', 'desktop'),
(1251, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-25 08:07:37', '::1', 'Chrome', 'desktop'),
(1252, 17, '/Uni_Scope1/index.php', NULL, '2026-02-25 08:07:43', '::1', 'Chrome', 'desktop'),
(1253, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-25 08:07:43', '::1', 'Chrome', 'desktop'),
(1254, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:07:45', '::1', 'Chrome', 'desktop'),
(1255, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:07:47', '::1', 'Chrome', 'desktop'),
(1256, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-25 08:07:54', '::1', 'Chrome', 'desktop'),
(1257, 1, '/Uni_Scope1/index.php', NULL, '2026-02-25 08:08:01', '::1', 'Chrome', 'desktop'),
(1258, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-25 08:08:01', '::1', 'Chrome', 'desktop'),
(1259, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-25 08:08:02', '::1', 'Chrome', 'desktop'),
(1260, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-25 08:08:03', '::1', 'Chrome', 'desktop'),
(1261, 1, '/Uni_Scope1/admin/user_edit.php?id=1', NULL, '2026-02-25 08:08:05', '::1', 'Chrome', 'desktop'),
(1262, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-02-25 08:08:08', '::1', 'Chrome', 'desktop'),
(1263, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-25 08:08:10', '::1', 'Chrome', 'desktop'),
(1264, 18, '/Uni_Scope1/index.php', NULL, '2026-02-25 08:08:39', '::1', 'Chrome', 'desktop'),
(1265, 18, '/Uni_Scope1/dashboard.php?role=manager', NULL, '2026-02-25 08:08:39', '::1', 'Chrome', 'desktop'),
(1266, 18, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-25 08:08:41', '::1', 'Chrome', 'desktop'),
(1267, 18, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-25 08:08:44', '::1', 'Chrome', 'desktop'),
(1268, 18, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 08:08:44', '::1', 'Chrome', 'desktop'),
(1269, 18, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-25 08:08:45', '::1', 'Chrome', 'desktop'),
(1270, 18, '/Uni_Scope1/manager/exception_reports.php', NULL, '2026-02-25 08:08:46', '::1', 'Chrome', 'desktop'),
(1271, 18, '/Uni_Scope1/manager/statistics.php', NULL, '2026-02-25 08:08:46', '::1', 'Chrome', 'desktop'),
(1272, 18, '/Uni_Scope1/manager/exception_reports.php', NULL, '2026-02-25 08:08:47', '::1', 'Chrome', 'desktop'),
(1273, 18, '/Uni_Scope1/manager/statistics.php', NULL, '2026-02-25 08:08:49', '::1', 'Chrome', 'desktop'),
(1274, 18, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-25 08:08:58', '::1', 'Chrome', 'desktop'),
(1275, 18, '/Uni_Scope1/manager/selected.php', NULL, '2026-02-25 08:09:01', '::1', 'Chrome', 'desktop'),
(1276, 18, '/Uni_Scope1/logout.php', NULL, '2026-02-25 08:09:04', '::1', 'Chrome', 'desktop'),
(1277, 17, '/Uni_Scope1/index.php', NULL, '2026-02-25 08:09:10', '::1', 'Chrome', 'desktop'),
(1278, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-25 08:09:10', '::1', 'Chrome', 'desktop'),
(1279, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:09:13', '::1', 'Chrome', 'desktop'),
(1280, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:09:15', '::1', 'Chrome', 'desktop'),
(1281, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:16:37', '::1', 'Chrome', 'desktop'),
(1282, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:17:20', '::1', 'Chrome', 'desktop'),
(1283, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:20:26', '::1', 'Chrome', 'desktop'),
(1284, 17, '/Uni_Scope1/coordinator/submission.php?id=17', NULL, '2026-02-25 08:20:30', '::1', 'Chrome', 'desktop'),
(1285, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:20:34', '::1', 'Chrome', 'desktop'),
(1286, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-25 08:20:36', '::1', 'Chrome', 'desktop'),
(1287, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-25 08:25:10', '::1', 'Chrome', 'desktop'),
(1288, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-25 08:25:10', '::1', 'Chrome', 'desktop'),
(1289, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-25 08:36:04', '::1', 'Chrome', 'desktop'),
(1290, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-25 08:36:04', '::1', 'Chrome', 'desktop'),
(1291, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-25 08:36:38', '::1', 'Chrome', 'desktop'),
(1292, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-25 08:36:38', '::1', 'Chrome', 'desktop'),
(1293, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:36:40', '::1', 'Chrome', 'desktop'),
(1294, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:36:45', '::1', 'Chrome', 'desktop'),
(1295, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:36:51', '::1', 'Chrome', 'desktop'),
(1296, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:36:52', '::1', 'Chrome', 'desktop'),
(1297, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:36:54', '::1', 'Chrome', 'desktop'),
(1298, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:37:05', '::1', 'Chrome', 'desktop'),
(1299, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:37:15', '::1', 'Chrome', 'desktop'),
(1300, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:37:24', '::1', 'Chrome', 'desktop'),
(1301, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:37:29', '::1', 'Chrome', 'desktop'),
(1302, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:37:39', '::1', 'Chrome', 'desktop'),
(1303, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-25 08:37:42', '::1', 'Chrome', 'desktop'),
(1304, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-25 08:37:42', '::1', 'Chrome', 'desktop'),
(1305, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:37:45', '::1', 'Chrome', 'desktop'),
(1306, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-25 08:37:46', '::1', 'Chrome', 'desktop'),
(1307, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-25 08:37:46', '::1', 'Chrome', 'desktop'),
(1308, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:37:49', '::1', 'Chrome', 'desktop'),
(1309, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:37:56', '::1', 'Chrome', 'desktop'),
(1310, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:38:11', '::1', 'Chrome', 'desktop'),
(1311, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-25 08:38:13', '::1', 'Chrome', 'desktop'),
(1312, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-25 08:38:13', '::1', 'Chrome', 'desktop'),
(1313, 17, '/Uni_Scope1/download_image.php?id=3&download=1', NULL, '2026-02-25 08:38:16', '::1', 'Chrome', 'desktop'),
(1314, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:38:23', '::1', 'Chrome', 'desktop'),
(1315, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-25 08:38:35', '::1', 'Chrome', 'desktop'),
(1316, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-25 08:38:46', '::1', 'Chrome', 'desktop'),
(1317, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:38:52', '::1', 'Chrome', 'desktop'),
(1318, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:38:57', '::1', 'Chrome', 'desktop'),
(1319, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:40:29', '::1', 'Chrome', 'desktop'),
(1320, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:40:33', '::1', 'Chrome', 'desktop'),
(1321, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:40:36', '::1', 'Chrome', 'desktop'),
(1322, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:40:39', '::1', 'Chrome', 'desktop'),
(1323, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:40:41', '::1', 'Chrome', 'desktop'),
(1324, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:40:42', '::1', 'Chrome', 'desktop'),
(1325, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:40:44', '::1', 'Chrome', 'desktop'),
(1326, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:40:46', '::1', 'Chrome', 'desktop'),
(1327, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:40:47', '::1', 'Chrome', 'desktop'),
(1328, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:40:48', '::1', 'Chrome', 'desktop'),
(1329, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:44:07', '::1', 'Chrome', 'desktop'),
(1330, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:44:12', '::1', 'Chrome', 'desktop'),
(1331, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:44:13', '::1', 'Chrome', 'desktop'),
(1332, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:46:36', '::1', 'Chrome', 'desktop'),
(1333, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:51:10', '::1', 'Chrome', 'desktop'),
(1334, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-25 08:51:11', '::1', 'Chrome', 'desktop'),
(1335, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:51:14', '::1', 'Chrome', 'desktop'),
(1336, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 08:51:45', '::1', 'Chrome', 'desktop'),
(1337, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:51:48', '::1', 'Chrome', 'desktop'),
(1338, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-25 08:51:52', '::1', 'Chrome', 'desktop'),
(1339, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:52:29', '::1', 'Chrome', 'desktop'),
(1340, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-02-25 08:52:32', '::1', 'Chrome', 'desktop'),
(1341, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-02-25 08:52:32', '::1', 'Chrome', 'desktop'),
(1342, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:52:34', '::1', 'Chrome', 'desktop'),
(1343, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-25 08:52:35', '::1', 'Chrome', 'desktop'),
(1344, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:52:38', '::1', 'Chrome', 'desktop'),
(1345, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-25 08:52:42', '::1', 'Chrome', 'desktop'),
(1346, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:52:45', '::1', 'Chrome', 'desktop'),
(1347, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 08:52:51', '::1', 'Chrome', 'desktop'),
(1348, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-25 08:53:28', '::1', 'Chrome', 'desktop'),
(1349, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-25 09:00:21', '::1', 'Chrome', 'desktop'),
(1350, 17, '/Uni_Scope1/coordinator/submission.php?id=13', NULL, '2026-02-25 09:03:28', '::1', 'Chrome', 'desktop'),
(1351, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-25 09:03:46', '::1', 'Chrome', 'desktop'),
(1352, 1, '/Uni_Scope1/index.php', NULL, '2026-02-25 09:03:53', '::1', 'Chrome', 'desktop'),
(1353, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-25 09:03:53', '::1', 'Chrome', 'desktop'),
(1354, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 09:03:54', '::1', 'Chrome', 'desktop'),
(1355, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-25 09:03:55', '::1', 'Chrome', 'desktop'),
(1356, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-25 09:03:56', '::1', 'Chrome', 'desktop'),
(1357, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-25 09:04:01', '::1', 'Chrome', 'desktop'),
(1358, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-25 09:04:03', '::1', 'Chrome', 'desktop'),
(1359, 17, '/Uni_Scope1/index.php', NULL, '2026-02-25 09:04:07', '::1', 'Chrome', 'desktop'),
(1360, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-25 09:04:07', '::1', 'Chrome', 'desktop'),
(1361, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 09:04:09', '::1', 'Chrome', 'desktop'),
(1362, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:04:11', '::1', 'Chrome', 'desktop'),
(1363, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 09:04:20', '::1', 'Chrome', 'desktop'),
(1364, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-25 09:04:23', '::1', 'Chrome', 'desktop'),
(1365, 1, '/Uni_Scope1/index.php', NULL, '2026-02-25 09:04:47', '::1', 'Chrome', 'desktop'),
(1366, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-25 09:04:47', '::1', 'Chrome', 'desktop'),
(1367, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-25 09:04:48', '::1', 'Chrome', 'desktop'),
(1368, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-25 09:04:49', '::1', 'Chrome', 'desktop'),
(1369, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-25 09:04:56', '::1', 'Chrome', 'desktop'),
(1370, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-25 09:05:20', '::1', 'Chrome', 'desktop'),
(1371, 17, '/Uni_Scope1/index.php', NULL, '2026-02-25 09:05:26', '::1', 'Chrome', 'desktop'),
(1372, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-25 09:05:26', '::1', 'Chrome', 'desktop'),
(1373, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 09:05:30', '::1', 'Chrome', 'desktop'),
(1374, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:05:32', '::1', 'Chrome', 'desktop'),
(1375, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:17:59', '::1', 'Chrome', 'desktop'),
(1376, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:46:17', '::1', 'Chrome', 'desktop'),
(1377, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 09:46:35', '::1', 'Chrome', 'desktop'),
(1378, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 09:46:38', '::1', 'Chrome', 'desktop'),
(1379, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:46:40', '::1', 'Chrome', 'desktop'),
(1380, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:52:07', '::1', 'Chrome', 'desktop'),
(1381, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-25 09:52:22', '::1', 'Chrome', 'desktop'),
(1382, 1, '/Uni_Scope1/index.php', NULL, '2026-02-25 09:52:34', '::1', 'Chrome', 'desktop'),
(1383, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-25 09:52:34', '::1', 'Chrome', 'desktop'),
(1384, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-25 09:52:35', '::1', 'Chrome', 'desktop'),
(1385, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-25 09:52:52', '::1', 'Chrome', 'desktop'),
(1386, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-25 09:53:00', '::1', 'Chrome', 'desktop'),
(1387, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-25 09:53:02', '::1', 'Chrome', 'desktop'),
(1388, 17, '/Uni_Scope1/index.php', NULL, '2026-02-25 09:53:07', '::1', 'Chrome', 'desktop'),
(1389, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-25 09:53:07', '::1', 'Chrome', 'desktop'),
(1390, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 09:53:09', '::1', 'Chrome', 'desktop'),
(1391, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:53:11', '::1', 'Chrome', 'desktop'),
(1392, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-25 09:54:18', '::1', 'Chrome', 'desktop'),
(1393, 1, '/Uni_Scope1/index.php', NULL, '2026-02-25 09:54:24', '::1', 'Chrome', 'desktop'),
(1394, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-02-25 09:54:24', '::1', 'Chrome', 'desktop'),
(1395, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-02-25 09:54:25', '::1', 'Chrome', 'desktop'),
(1396, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-25 09:54:26', '::1', 'Chrome', 'desktop'),
(1397, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-02-25 09:54:31', '::1', 'Chrome', 'desktop'),
(1398, 1, '/Uni_Scope1/logout.php', NULL, '2026-02-25 09:54:33', '::1', 'Chrome', 'desktop'),
(1399, 17, '/Uni_Scope1/index.php', NULL, '2026-02-25 09:54:40', '::1', 'Chrome', 'desktop'),
(1400, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-25 09:54:40', '::1', 'Chrome', 'desktop'),
(1401, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 09:54:41', '::1', 'Chrome', 'desktop'),
(1402, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:54:42', '::1', 'Chrome', 'desktop'),
(1403, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:54:47', '::1', 'Chrome', 'desktop'),
(1404, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 09:54:55', '::1', 'Chrome', 'desktop'),
(1405, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:54:56', '::1', 'Chrome', 'desktop'),
(1406, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 09:54:59', '::1', 'Chrome', 'desktop'),
(1407, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 10:03:29', '::1', 'Chrome', 'desktop'),
(1408, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 10:03:32', '::1', 'Chrome', 'desktop'),
(1409, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 10:21:56', '::1', 'Chrome', 'desktop'),
(1410, 17, '/Uni_Scope1/index.php', NULL, '2026-02-25 12:49:52', '::1', 'Chrome', 'desktop'),
(1411, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-25 12:49:53', '::1', 'Chrome', 'desktop'),
(1412, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 12:49:55', '::1', 'Chrome', 'desktop'),
(1413, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 12:49:56', '::1', 'Chrome', 'desktop'),
(1414, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 12:49:58', '::1', 'Chrome', 'desktop'),
(1415, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 12:50:55', '::1', 'Chrome', 'desktop'),
(1416, 17, '/Uni_Scope1/logout.php', NULL, '2026-02-25 12:51:02', '::1', 'Chrome', 'desktop'),
(1417, 19, '/Uni_Scope1/index.php', NULL, '2026-02-25 12:51:10', '::1', 'Chrome', 'desktop'),
(1418, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-02-25 12:51:10', '::1', 'Chrome', 'desktop'),
(1419, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-25 12:51:11', '::1', 'Chrome', 'desktop'),
(1420, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 12:53:32', '::1', 'Chrome', 'desktop'),
(1421, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-25 12:53:33', '::1', 'Chrome', 'desktop'),
(1422, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-25 12:56:34', '::1', 'Chrome', 'desktop'),
(1423, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 12:56:52', '::1', 'Chrome', 'desktop'),
(1424, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-25 12:56:59', '::1', 'Chrome', 'desktop'),
(1425, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-25 12:58:29', '::1', 'Chrome', 'desktop'),
(1426, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-25 12:58:30', '::1', 'Chrome', 'desktop'),
(1427, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-25 12:58:30', '::1', 'Chrome', 'desktop'),
(1428, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 12:58:31', '::1', 'Chrome', 'desktop'),
(1429, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 12:58:32', '::1', 'Chrome', 'desktop'),
(1430, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-25 12:58:34', '::1', 'Chrome', 'desktop'),
(1431, 19, '/Uni_Scope1/student/upload_images.php', NULL, '2026-02-25 12:58:35', '::1', 'Chrome', 'desktop'),
(1432, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-25 12:58:37', '::1', 'Chrome', 'desktop'),
(1433, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-25 12:58:38', '::1', 'Chrome', 'desktop'),
(1434, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-25 12:58:40', '::1', 'Chrome', 'desktop');
INSERT INTO `system_logs` (`log_id`, `user_id`, `page_visited`, `action_taken`, `log_time`, `ip_address`, `browser`, `device_type`) VALUES
(1435, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-25 12:58:40', '::1', 'Chrome', 'desktop'),
(1436, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-25 12:58:42', '::1', 'Chrome', 'desktop'),
(1437, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 12:58:42', '::1', 'Chrome', 'desktop'),
(1438, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-02-25 12:58:44', '::1', 'Chrome', 'desktop'),
(1439, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-02-25 13:08:03', '::1', 'Chrome', 'desktop'),
(1440, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-02-25 13:08:04', '::1', 'Chrome', 'desktop'),
(1441, 19, '/Uni_Scope1/logout.php', NULL, '2026-02-25 13:08:28', '::1', 'Chrome', 'desktop'),
(1442, 17, '/Uni_Scope1/index.php', NULL, '2026-02-25 13:08:33', '::1', 'Chrome', 'desktop'),
(1443, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-02-25 13:08:33', '::1', 'Chrome', 'desktop'),
(1444, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 13:08:34', '::1', 'Chrome', 'desktop'),
(1445, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 13:08:36', '::1', 'Chrome', 'desktop'),
(1446, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 13:08:37', '::1', 'Chrome', 'desktop'),
(1447, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 13:08:39', '::1', 'Chrome', 'desktop'),
(1448, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-02-25 13:08:57', '::1', 'Chrome', 'desktop'),
(1449, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-02-25 13:09:19', '::1', 'Chrome', 'desktop'),
(1450, 20, '/Uni_Scope1/index.php', NULL, '2026-03-01 22:25:01', '::1', 'Chrome', 'desktop'),
(1451, 20, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-01 22:25:01', '::1', 'Chrome', 'desktop'),
(1452, 20, '/Uni_Scope1/logout.php', NULL, '2026-03-01 22:26:47', '::1', 'Chrome', 'desktop'),
(1453, 17, '/Uni_Scope1/index.php', NULL, '2026-03-01 22:28:45', '::1', 'Chrome', 'desktop'),
(1454, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-01 22:28:45', '::1', 'Chrome', 'desktop'),
(1455, 17, '/Uni_Scope1/logout.php', NULL, '2026-03-01 22:28:48', '::1', 'Chrome', 'desktop'),
(1456, 19, '/Uni_Scope1/index.php', NULL, '2026-03-01 22:28:56', '::1', 'Chrome', 'desktop'),
(1457, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-01 22:28:56', '::1', 'Chrome', 'desktop'),
(1458, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-03-01 22:29:07', '::1', 'Chrome', 'desktop'),
(1459, 19, '/Uni_Scope1/logout.php', NULL, '2026-03-01 22:33:49', '::1', 'Chrome', 'desktop'),
(1460, 1, '/Uni_Scope1/index.php', NULL, '2026-03-01 22:33:57', '::1', 'Chrome', 'desktop'),
(1461, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-03-01 22:33:57', '::1', 'Chrome', 'desktop'),
(1462, 1, '/Uni_Scope1/dashboard.php', NULL, '2026-03-01 22:33:58', '::1', 'Chrome', 'desktop'),
(1463, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-03-01 22:33:59', '::1', 'Chrome', 'desktop'),
(1464, 1, '/Uni_Scope1/admin/users.php', NULL, '2026-03-01 22:34:00', '::1', 'Chrome', 'desktop'),
(1465, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-03-01 22:35:36', '::1', 'Chrome', 'desktop'),
(1466, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-03-01 22:35:38', '::1', 'Chrome', 'desktop'),
(1467, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-03-01 22:39:52', '::1', 'Chrome', 'desktop'),
(1468, 1, '/Uni_Scope1/admin/faculties.php', NULL, '2026-03-01 22:46:01', '::1', 'Chrome', 'desktop'),
(1469, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-03-01 22:46:03', '::1', 'Chrome', 'desktop'),
(1470, 1, '/Uni_Scope1/admin/usage_reports.php', NULL, '2026-03-01 22:46:03', '::1', 'Chrome', 'desktop'),
(1471, 1, '/Uni_Scope1/logout.php', NULL, '2026-03-01 22:50:01', '::1', 'Chrome', 'desktop'),
(1472, 17, '/Uni_Scope1/index.php', NULL, '2026-03-01 22:50:06', '::1', 'Chrome', 'desktop'),
(1473, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-01 22:50:06', '::1', 'Chrome', 'desktop'),
(1474, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-01 22:50:08', '::1', 'Chrome', 'desktop'),
(1475, 17, '/Uni_Scope1/coordinator/review.php?search=edw', NULL, '2026-03-01 22:50:33', '::1', 'Chrome', 'desktop'),
(1476, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-01 22:50:39', '::1', 'Chrome', 'desktop'),
(1477, 17, '/Uni_Scope1/coordinator/review.php?search=edWs', NULL, '2026-03-01 22:50:42', '::1', 'Chrome', 'desktop'),
(1478, 17, '/Uni_Scope1/coordinator/review.php?search=edW', NULL, '2026-03-01 22:50:47', '::1', 'Chrome', 'desktop'),
(1479, 17, '/Uni_Scope1/index.php', NULL, '2026-03-09 19:04:17', '::1', 'Chrome', 'desktop'),
(1480, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-09 19:04:17', '::1', 'Chrome', 'desktop'),
(1481, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-03-09 19:04:24', '::1', 'Chrome', 'desktop'),
(1482, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-09 19:04:24', '::1', 'Chrome', 'desktop'),
(1483, 17, '/Uni_Scope1/logout.php', NULL, '2026-03-09 19:11:25', '::1', 'Chrome', 'desktop'),
(1484, 24, '/Uni_Scope1/index.php', NULL, '2026-03-09 19:27:19', '::1', 'Chrome', 'desktop'),
(1485, 24, '/Uni_Scope1/dashboard.php?role=guest', NULL, '2026-03-09 19:27:19', '::1', 'Chrome', 'desktop'),
(1486, 24, '/Uni_Scope1/logout.php', NULL, '2026-03-09 19:27:46', '::1', 'Chrome', 'desktop'),
(1487, 17, '/Uni_Scope1/index.php', NULL, '2026-03-09 19:27:51', '::1', 'Chrome', 'desktop'),
(1488, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-09 19:27:51', '::1', 'Chrome', 'desktop'),
(1489, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-09 19:27:53', '::1', 'Chrome', 'desktop'),
(1490, 17, '/Uni_Scope1/logout.php', NULL, '2026-03-09 19:28:11', '::1', 'Chrome', 'desktop'),
(1491, 23, '/Uni_Scope1/index.php', NULL, '2026-03-09 19:28:44', '::1', 'Chrome', 'desktop'),
(1492, 23, '/Uni_Scope1/dashboard.php?role=manager', NULL, '2026-03-09 19:28:44', '::1', 'Chrome', 'desktop'),
(1493, 23, '/Uni_Scope1/dashboard.php', NULL, '2026-03-09 19:28:45', '::1', 'Chrome', 'desktop'),
(1494, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-09 19:28:46', '::1', 'Chrome', 'desktop'),
(1495, 23, '/Uni_Scope1/logout.php', NULL, '2026-03-09 19:29:15', '::1', 'Chrome', 'desktop'),
(1496, 24, '/Uni_Scope1/index.php', NULL, '2026-03-09 19:29:20', '::1', 'Chrome', 'desktop'),
(1497, 24, '/Uni_Scope1/dashboard.php?role=guest', NULL, '2026-03-09 19:29:20', '::1', 'Chrome', 'desktop'),
(1498, 24, '/Uni_Scope1/guest/selected.php', NULL, '2026-03-09 19:29:24', '::1', 'Chrome', 'desktop'),
(1499, 24, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 19:32:35', '::1', 'Chrome', 'desktop'),
(1500, 24, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 19:34:36', '::1', 'Chrome', 'desktop'),
(1501, 24, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 19:42:20', '::1', 'Chrome', 'desktop'),
(1502, 24, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 19:45:23', '::1', 'Chrome', 'desktop'),
(1503, 24, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 19:47:51', '::1', 'Chrome', 'desktop'),
(1504, 24, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 19:51:16', '::1', 'Chrome', 'desktop'),
(1505, 24, '/Uni_Scope1/logout.php', NULL, '2026-03-09 19:52:21', '::1', 'Chrome', 'desktop'),
(1506, 1, '/Uni_Scope1/index.php', NULL, '2026-03-09 19:52:27', '::1', 'Chrome', 'desktop'),
(1507, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-03-09 19:52:27', '::1', 'Chrome', 'desktop'),
(1508, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-03-09 19:52:30', '::1', 'Chrome', 'desktop'),
(1509, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:12:21', '::1', 'Chrome', 'desktop'),
(1510, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:13:34', '::1', 'Chrome', 'desktop'),
(1511, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:14:36', '::1', 'Chrome', 'desktop'),
(1512, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:14:38', '::1', 'Chrome', 'desktop'),
(1513, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:14:40', '::1', 'Chrome', 'desktop'),
(1514, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:14:42', '::1', 'Chrome', 'desktop'),
(1515, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:14:43', '::1', 'Chrome', 'desktop'),
(1516, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:14:45', '::1', 'Chrome', 'desktop'),
(1517, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:14:47', '::1', 'Chrome', 'desktop'),
(1518, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:14:49', '::1', 'Chrome', 'desktop'),
(1519, 1, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-09 20:14:51', '::1', 'Chrome', 'desktop'),
(1520, 1, '/Uni_Scope1/logout.php', NULL, '2026-03-09 20:36:30', '::1', 'Chrome', 'desktop'),
(1521, 17, '/Uni_Scope1/index.php', NULL, '2026-03-10 22:36:08', '::1', 'Chrome', 'desktop'),
(1522, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-10 22:36:08', '::1', 'Chrome', 'desktop'),
(1523, 17, '/Uni_Scope1/coordinator/statistics.php', NULL, '2026-03-10 22:36:13', '::1', 'Chrome', 'desktop'),
(1524, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-03-10 22:36:14', '::1', 'Chrome', 'desktop'),
(1525, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-10 22:36:16', '::1', 'Chrome', 'desktop'),
(1526, 17, '/Uni_Scope1/coordinator/submission.php?id=15', NULL, '2026-03-10 22:36:22', '::1', 'Chrome', 'desktop'),
(1527, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-10 22:36:24', '::1', 'Chrome', 'desktop'),
(1528, 17, '/Uni_Scope1/logout.php', NULL, '2026-03-10 22:36:26', '::1', 'Chrome', 'desktop'),
(1529, 19, '/Uni_Scope1/index.php', NULL, '2026-03-10 22:36:33', '::1', 'Chrome', 'desktop'),
(1530, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 22:36:33', '::1', 'Chrome', 'desktop'),
(1531, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 22:36:36', '::1', 'Chrome', 'desktop'),
(1532, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-03-10 22:36:43', '::1', 'Chrome', 'desktop'),
(1533, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 22:36:47', '::1', 'Chrome', 'desktop'),
(1534, 19, '/Uni_Scope1/logout.php', NULL, '2026-03-10 22:43:48', '::1', 'Chrome', 'desktop'),
(1535, 17, '/Uni_Scope1/index.php', NULL, '2026-03-10 22:44:01', '::1', 'Chrome', 'desktop'),
(1536, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-10 22:44:01', '::1', 'Chrome', 'desktop'),
(1537, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-10 22:44:03', '::1', 'Chrome', 'desktop'),
(1538, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-03-10 22:44:09', '::1', 'Chrome', 'desktop'),
(1539, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-03-10 22:44:09', '::1', 'Chrome', 'desktop'),
(1540, 17, '/Uni_Scope1/portal_selection.php', NULL, '2026-03-10 22:52:02', '::1', 'Chrome', 'desktop'),
(1541, 17, '/Uni_Scope1/index.php', NULL, '2026-03-10 22:52:02', '::1', 'Chrome', 'desktop'),
(1542, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-10 22:52:02', '::1', 'Chrome', 'desktop'),
(1543, 17, '/Uni_Scope1/logout.php', NULL, '2026-03-10 22:52:06', '::1', 'Chrome', 'desktop'),
(1544, 1, '/Uni_Scope1/index.php', NULL, '2026-03-10 22:55:18', '::1', 'Chrome', 'desktop'),
(1545, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-03-10 22:55:18', '::1', 'Chrome', 'desktop'),
(1546, 1, '/Uni_Scope1/logout.php', NULL, '2026-03-10 22:55:21', '::1', 'Chrome', 'desktop'),
(1547, 1, '/Uni_Scope1/index.php', NULL, '2026-03-10 22:57:06', '::1', 'Chrome', 'desktop'),
(1548, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-03-10 22:57:06', '::1', 'Chrome', 'desktop'),
(1549, 1, '/Uni_Scope1/logout.php', NULL, '2026-03-10 22:57:09', '::1', 'Chrome', 'desktop'),
(1550, NULL, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:13:54', '::1', 'Chrome', 'desktop'),
(1551, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 23:13:54', '::1', 'Chrome', 'desktop'),
(1552, NULL, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:15:10', '::1', 'Chrome', 'desktop'),
(1553, NULL, '/Uni_Scope1/login.php?just_registered=1', NULL, '2026-03-10 23:15:38', '::1', 'Chrome', 'desktop'),
(1554, NULL, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:15:38', '::1', 'Chrome', 'desktop'),
(1555, NULL, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 23:15:38', '::1', 'Chrome', 'desktop'),
(1556, NULL, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:17:03', '::1', 'Chrome', 'desktop'),
(1557, 28, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:20:08', '::1', 'Chrome', 'desktop'),
(1558, 28, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 23:20:09', '::1', 'Chrome', 'desktop'),
(1559, 28, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 23:20:38', '::1', 'Chrome', 'desktop'),
(1560, 28, '/Uni_Scope1/dashboard.php', NULL, '2026-03-10 23:20:40', '::1', 'Chrome', 'desktop'),
(1561, 28, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:20:42', '::1', 'Chrome', 'desktop'),
(1562, 19, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:20:51', '::1', 'Chrome', 'desktop'),
(1563, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 23:20:51', '::1', 'Chrome', 'desktop'),
(1564, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 23:20:53', '::1', 'Chrome', 'desktop'),
(1565, 19, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:21:09', '::1', 'Chrome', 'desktop'),
(1566, 19, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:37:40', '::1', 'Chrome', 'desktop'),
(1567, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 23:37:40', '::1', 'Chrome', 'desktop'),
(1568, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 23:37:43', '::1', 'Chrome', 'desktop'),
(1569, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 23:38:13', '::1', 'Chrome', 'desktop'),
(1570, 19, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:38:30', '::1', 'Chrome', 'desktop'),
(1571, 1, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:38:42', '::1', 'Chrome', 'desktop'),
(1572, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-03-10 23:38:42', '::1', 'Chrome', 'desktop'),
(1573, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-03-10 23:38:52', '::1', 'Chrome', 'desktop'),
(1574, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-03-10 23:38:53', '::1', 'Chrome', 'desktop'),
(1575, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-03-10 23:39:19', '::1', 'Chrome', 'desktop'),
(1576, 1, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:39:22', '::1', 'Chrome', 'desktop'),
(1577, 19, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:39:32', '::1', 'Chrome', 'desktop'),
(1578, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 23:39:32', '::1', 'Chrome', 'desktop'),
(1579, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 23:39:35', '::1', 'Chrome', 'desktop'),
(1580, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 23:40:10', '::1', 'Chrome', 'desktop'),
(1581, 19, '/Uni_Scope1/student/my_submissions.php?open_comments=11', NULL, '2026-03-10 23:40:10', '::1', 'Chrome', 'desktop'),
(1582, 19, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:40:21', '::1', 'Chrome', 'desktop'),
(1583, 17, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:40:29', '::1', 'Chrome', 'desktop'),
(1584, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-10 23:40:29', '::1', 'Chrome', 'desktop'),
(1585, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-10 23:40:32', '::1', 'Chrome', 'desktop'),
(1586, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-03-10 23:40:35', '::1', 'Chrome', 'desktop'),
(1587, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-03-10 23:40:35', '::1', 'Chrome', 'desktop'),
(1588, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-03-10 23:43:55', '::1', 'Chrome', 'desktop'),
(1589, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-03-10 23:44:03', '::1', 'Chrome', 'desktop'),
(1590, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-03-10 23:47:11', '::1', 'Chrome', 'desktop'),
(1591, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-03-10 23:47:11', '::1', 'Chrome', 'desktop'),
(1592, 17, '/Uni_Scope1/coordinator/submission.php?id=11', NULL, '2026-03-10 23:47:23', '::1', 'Chrome', 'desktop'),
(1593, 17, '/Uni_Scope1/download_image.php?id=3', NULL, '2026-03-10 23:47:23', '::1', 'Chrome', 'desktop'),
(1594, 17, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:47:29', '::1', 'Chrome', 'desktop'),
(1595, 19, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:47:46', '::1', 'Chrome', 'desktop'),
(1596, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 23:47:46', '::1', 'Chrome', 'desktop'),
(1597, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 23:48:25', '::1', 'Chrome', 'desktop'),
(1598, 19, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-10 23:49:59', '::1', 'Chrome', 'desktop'),
(1599, 19, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:50:10', '::1', 'Chrome', 'desktop'),
(1600, 21, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:50:27', '::1', 'Chrome', 'desktop'),
(1601, 21, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 23:50:27', '::1', 'Chrome', 'desktop'),
(1602, 21, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 23:50:51', '::1', 'Chrome', 'desktop'),
(1603, 21, '/Uni_Scope1/dashboard.php?terms_accepted=1', NULL, '2026-03-10 23:50:51', '::1', 'Chrome', 'desktop'),
(1604, 21, '/Uni_Scope1/student/submit_article.php', NULL, '2026-03-10 23:51:06', '::1', 'Chrome', 'desktop'),
(1605, 21, '/Uni_Scope1/dashboard.php', NULL, '2026-03-10 23:51:23', '::1', 'Chrome', 'desktop'),
(1606, 21, '/Uni_Scope1/student/submit_article.php', NULL, '2026-03-10 23:51:37', '::1', 'Chrome', 'desktop'),
(1607, 21, '/Uni_Scope1/student/submit_article.php', NULL, '2026-03-10 23:51:54', '::1', 'Chrome', 'desktop'),
(1608, 21, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:52:07', '::1', 'Chrome', 'desktop'),
(1609, 17, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:52:18', '::1', 'Chrome', 'desktop'),
(1610, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-10 23:52:18', '::1', 'Chrome', 'desktop'),
(1611, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-10 23:52:21', '::1', 'Chrome', 'desktop'),
(1612, 17, '/Uni_Scope1/coordinator/submission.php?id=19', NULL, '2026-03-10 23:52:30', '::1', 'Chrome', 'desktop'),
(1613, 17, '/Uni_Scope1/coordinator/submission.php?id=19', NULL, '2026-03-10 23:54:20', '::1', 'Chrome', 'desktop'),
(1614, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-10 23:54:28', '::1', 'Chrome', 'desktop'),
(1615, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-03-10 23:54:29', '::1', 'Chrome', 'desktop'),
(1616, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-10 23:54:45', '::1', 'Chrome', 'desktop'),
(1617, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-03-10 23:54:47', '::1', 'Chrome', 'desktop'),
(1618, 17, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:55:07', '::1', 'Chrome', 'desktop'),
(1619, 21, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:55:19', '::1', 'Chrome', 'desktop'),
(1620, 21, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-10 23:55:19', '::1', 'Chrome', 'desktop'),
(1621, 21, '/Uni_Scope1/dashboard.php', NULL, '2026-03-10 23:55:30', '::1', 'Chrome', 'desktop'),
(1622, 21, '/Uni_Scope1/dashboard.php', NULL, '2026-03-10 23:56:00', '::1', 'Chrome', 'desktop'),
(1623, 21, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 23:56:03', '::1', 'Chrome', 'desktop'),
(1624, 21, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-10 23:58:40', '::1', 'Chrome', 'desktop'),
(1625, 21, '/Uni_Scope1/student/my_submissions.php?open_comments=19', NULL, '2026-03-10 23:58:40', '::1', 'Chrome', 'desktop'),
(1626, 21, '/Uni_Scope1/logout.php', NULL, '2026-03-10 23:58:44', '::1', 'Chrome', 'desktop'),
(1627, 17, '/Uni_Scope1/index.php', NULL, '2026-03-10 23:58:51', '::1', 'Chrome', 'desktop'),
(1628, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-10 23:58:51', '::1', 'Chrome', 'desktop'),
(1629, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-10 23:58:53', '::1', 'Chrome', 'desktop'),
(1630, 17, '/Uni_Scope1/coordinator/submission.php?id=19', NULL, '2026-03-10 23:58:56', '::1', 'Chrome', 'desktop'),
(1632, 19, '/Uni_Scope1/login.php?redirect=%2FUni_Scope1%2Fcoordinator%2Fsubmission.php%3Fid%3D19', NULL, '2026-03-11 08:02:48', '::1', 'Chrome', 'desktop'),
(1633, 19, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:02:48', '::1', 'Chrome', 'desktop'),
(1634, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-11 08:02:48', '::1', 'Chrome', 'desktop'),
(1635, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-11 08:02:55', '::1', 'Chrome', 'desktop'),
(1636, 19, '/Uni_Scope1/student/submit_article.php', NULL, '2026-03-11 08:02:59', '::1', 'Chrome', 'desktop'),
(1637, 19, '/Uni_Scope1/dashboard.php', NULL, '2026-03-11 08:03:01', '::1', 'Chrome', 'desktop'),
(1638, 19, '/Uni_Scope1/student/my_submissions.php', NULL, '2026-03-11 08:03:02', '::1', 'Chrome', 'desktop'),
(1639, 19, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:11:37', '::1', 'Chrome', 'desktop'),
(1640, 17, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:11:54', '::1', 'Chrome', 'desktop'),
(1641, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-11 08:11:54', '::1', 'Chrome', 'desktop'),
(1642, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-11 08:12:00', '::1', 'Chrome', 'desktop'),
(1643, 17, '/Uni_Scope1/dashboard.php', NULL, '2026-03-11 08:12:07', '::1', 'Chrome', 'desktop'),
(1644, 17, '/Uni_Scope1/login.php', NULL, '2026-03-11 08:13:25', '::1', 'Chrome', 'desktop'),
(1645, 17, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:13:25', '::1', 'Chrome', 'desktop'),
(1646, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-11 08:13:25', '::1', 'Chrome', 'desktop'),
(1647, 17, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:13:35', '::1', 'Chrome', 'desktop'),
(1648, 23, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:13:45', '::1', 'Chrome', 'desktop'),
(1649, 23, '/Uni_Scope1/dashboard.php?role=manager', NULL, '2026-03-11 08:13:45', '::1', 'Chrome', 'desktop'),
(1650, 23, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:13:53', '::1', 'Chrome', 'desktop'),
(1651, 19, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:14:02', '::1', 'Chrome', 'desktop'),
(1652, 19, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-11 08:14:02', '::1', 'Chrome', 'desktop'),
(1653, 19, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:14:09', '::1', 'Chrome', 'desktop'),
(1654, 23, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:14:19', '::1', 'Chrome', 'desktop'),
(1655, 23, '/Uni_Scope1/dashboard.php?role=manager', NULL, '2026-03-11 08:14:19', '::1', 'Chrome', 'desktop'),
(1656, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-11 08:14:23', '::1', 'Chrome', 'desktop'),
(1657, 23, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:15:21', '::1', 'Chrome', 'desktop'),
(1658, 17, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:15:28', '::1', 'Chrome', 'desktop'),
(1659, 17, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-11 08:15:28', '::1', 'Chrome', 'desktop'),
(1660, 17, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-11 08:15:36', '::1', 'Chrome', 'desktop'),
(1661, 17, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:17:27', '::1', 'Chrome', 'desktop'),
(1662, 22, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:17:47', '::1', 'Chrome', 'desktop'),
(1663, 22, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-11 08:17:47', '::1', 'Chrome', 'desktop'),
(1664, 22, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-11 08:17:54', '::1', 'Chrome', 'desktop'),
(1665, 22, '/Uni_Scope1/dashboard.php', NULL, '2026-03-11 08:18:00', '::1', 'Chrome', 'desktop'),
(1666, 22, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-11 08:18:03', '::1', 'Chrome', 'desktop'),
(1667, 22, '/Uni_Scope1/dashboard.php', NULL, '2026-03-11 08:18:11', '::1', 'Chrome', 'desktop'),
(1668, 22, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-11 08:18:24', '::1', 'Chrome', 'desktop'),
(1669, 22, '/Uni_Scope1/dashboard.php', NULL, '2026-03-11 08:18:30', '::1', 'Chrome', 'desktop'),
(1670, 22, '/Uni_Scope1/dashboard.php', NULL, '2026-03-11 08:18:44', '::1', 'Chrome', 'desktop'),
(1671, 22, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-11 08:18:46', '::1', 'Chrome', 'desktop'),
(1672, 22, '/Uni_Scope1/dashboard.php', NULL, '2026-03-11 08:18:47', '::1', 'Chrome', 'desktop'),
(1673, 22, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:19:17', '::1', 'Chrome', 'desktop'),
(1674, 28, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:19:28', '::1', 'Chrome', 'desktop'),
(1675, 28, '/Uni_Scope1/dashboard.php?role=student', NULL, '2026-03-11 08:19:28', '::1', 'Chrome', 'desktop'),
(1676, 28, '/Uni_Scope1/student/submit_article.php', NULL, '2026-03-11 08:19:31', '::1', 'Chrome', 'desktop'),
(1677, 28, '/Uni_Scope1/student/submit_article.php', NULL, '2026-03-11 08:19:46', '::1', 'Chrome', 'desktop'),
(1678, 28, '/Uni_Scope1/dashboard.php', NULL, '2026-03-11 08:19:55', '::1', 'Chrome', 'desktop'),
(1679, 28, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:20:01', '::1', 'Chrome', 'desktop'),
(1680, 22, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:20:29', '::1', 'Chrome', 'desktop'),
(1681, 22, '/Uni_Scope1/dashboard.php?role=coordinator', NULL, '2026-03-11 08:20:29', '::1', 'Chrome', 'desktop'),
(1682, 22, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-11 08:20:32', '::1', 'Chrome', 'desktop'),
(1683, 22, '/Uni_Scope1/coordinator/submission.php?id=20', NULL, '2026-03-11 08:20:34', '::1', 'Chrome', 'desktop'),
(1684, 22, '/Uni_Scope1/coordinator/submission.php?id=20', NULL, '2026-03-11 08:20:39', '::1', 'Chrome', 'desktop'),
(1685, 22, '/Uni_Scope1/coordinator/review.php', NULL, '2026-03-11 08:20:47', '::1', 'Chrome', 'desktop'),
(1686, 22, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:20:50', '::1', 'Chrome', 'desktop'),
(1687, 23, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:21:05', '::1', 'Chrome', 'desktop'),
(1688, 23, '/Uni_Scope1/dashboard.php?role=manager', NULL, '2026-03-11 08:21:05', '::1', 'Chrome', 'desktop'),
(1689, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-11 08:21:07', '::1', 'Chrome', 'desktop'),
(1690, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-11 08:23:57', '::1', 'Chrome', 'desktop'),
(1691, 23, '/Uni_Scope1/manager/selected.php?faculty=4', NULL, '2026-03-11 08:24:00', '::1', 'Chrome', 'desktop'),
(1692, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-11 08:24:01', '::1', 'Chrome', 'desktop'),
(1693, 23, '/Uni_Scope1/manager/selected.php?faculty=3', NULL, '2026-03-11 08:24:02', '::1', 'Chrome', 'desktop'),
(1694, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-11 08:24:03', '::1', 'Chrome', 'desktop'),
(1695, 23, '/Uni_Scope1/manager/selected.php?faculty=3', NULL, '2026-03-11 08:24:10', '::1', 'Chrome', 'desktop'),
(1696, 23, '/Uni_Scope1/manager/selected.php?faculty=4', NULL, '2026-03-11 08:24:12', '::1', 'Chrome', 'desktop'),
(1697, 23, '/Uni_Scope1/manager/selected.php?faculty=3', NULL, '2026-03-11 08:24:12', '::1', 'Chrome', 'desktop'),
(1698, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-11 08:24:14', '::1', 'Chrome', 'desktop'),
(1699, 23, '/Uni_Scope1/manager/selected.php?search=tanve', NULL, '2026-03-11 08:25:24', '::1', 'Chrome', 'desktop'),
(1700, 23, '/Uni_Scope1/manager/selected.php?search=', NULL, '2026-03-11 08:25:27', '::1', 'Chrome', 'desktop'),
(1701, 23, '/Uni_Scope1/manager/selected.php?search=', NULL, '2026-03-11 08:26:56', '::1', 'Chrome', 'desktop'),
(1702, 23, '/Uni_Scope1/manager/selected.php?faculty=4', NULL, '2026-03-11 08:27:00', '::1', 'Chrome', 'desktop'),
(1703, 23, '/Uni_Scope1/manager/selected.php?faculty=', NULL, '2026-03-11 08:27:01', '::1', 'Chrome', 'desktop'),
(1704, 23, '/Uni_Scope1/manager/selected.php?faculty=4', NULL, '2026-03-11 08:27:05', '::1', 'Chrome', 'desktop'),
(1705, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-11 08:27:07', '::1', 'Chrome', 'desktop'),
(1706, 23, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:31:40', '::1', 'Chrome', 'desktop'),
(1707, 1, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:31:47', '::1', 'Chrome', 'desktop'),
(1708, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-03-11 08:31:47', '::1', 'Chrome', 'desktop'),
(1709, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-03-11 08:31:49', '::1', 'Chrome', 'desktop'),
(1710, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-03-11 08:31:50', '::1', 'Chrome', 'desktop'),
(1711, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-03-11 08:32:03', '::1', 'Chrome', 'desktop'),
(1712, 1, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:32:07', '::1', 'Chrome', 'desktop'),
(1713, 23, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:32:16', '::1', 'Chrome', 'desktop'),
(1714, 23, '/Uni_Scope1/dashboard.php?role=manager', NULL, '2026-03-11 08:32:16', '::1', 'Chrome', 'desktop'),
(1715, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-11 08:32:19', '::1', 'Chrome', 'desktop'),
(1716, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:32:22', '::1', 'Chrome', 'desktop'),
(1717, 23, '/Uni_Scope1/manager/selected.php?err=zip', NULL, '2026-03-11 08:32:22', '::1', 'Chrome', 'desktop'),
(1718, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:32:26', '::1', 'Chrome', 'desktop'),
(1719, 23, '/Uni_Scope1/manager/selected.php?err=zip', NULL, '2026-03-11 08:32:26', '::1', 'Chrome', 'desktop'),
(1720, 23, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:32:39', '::1', 'Chrome', 'desktop'),
(1721, 1, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:32:45', '::1', 'Chrome', 'desktop'),
(1722, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-03-11 08:32:45', '::1', 'Chrome', 'desktop'),
(1723, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-03-11 08:32:46', '::1', 'Chrome', 'desktop'),
(1724, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-03-11 08:32:47', '::1', 'Chrome', 'desktop'),
(1725, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-03-11 08:32:56', '::1', 'Chrome', 'desktop'),
(1726, 1, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:32:58', '::1', 'Chrome', 'desktop'),
(1727, 23, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:33:06', '::1', 'Chrome', 'desktop'),
(1728, 23, '/Uni_Scope1/dashboard.php?role=manager', NULL, '2026-03-11 08:33:06', '::1', 'Chrome', 'desktop'),
(1729, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-11 08:33:07', '::1', 'Chrome', 'desktop'),
(1730, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:33:08', '::1', 'Chrome', 'desktop'),
(1731, 23, '/Uni_Scope1/manager/selected.php?err=not_available', NULL, '2026-03-11 08:33:08', '::1', 'Chrome', 'desktop'),
(1732, 23, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:33:51', '::1', 'Chrome', 'desktop'),
(1733, 1, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:34:08', '::1', 'Chrome', 'desktop'),
(1734, 1, '/Uni_Scope1/dashboard.php?role=admin', NULL, '2026-03-11 08:34:08', '::1', 'Chrome', 'desktop'),
(1735, 1, '/Uni_Scope1/admin/index.php', NULL, '2026-03-11 08:34:09', '::1', 'Chrome', 'desktop'),
(1736, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-03-11 08:34:10', '::1', 'Chrome', 'desktop'),
(1737, 1, '/Uni_Scope1/admin/academic_years.php', NULL, '2026-03-11 08:34:22', '::1', 'Chrome', 'desktop'),
(1738, 1, '/Uni_Scope1/logout.php', NULL, '2026-03-11 08:34:26', '::1', 'Chrome', 'desktop'),
(1739, 23, '/Uni_Scope1/index.php', NULL, '2026-03-11 08:34:35', '::1', 'Chrome', 'desktop'),
(1740, 23, '/Uni_Scope1/dashboard.php?role=manager', NULL, '2026-03-11 08:34:35', '::1', 'Chrome', 'desktop'),
(1741, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:34:37', '::1', 'Chrome', 'desktop'),
(1742, 23, '/Uni_Scope1/manager/selected.php?err=zip', NULL, '2026-03-11 08:34:37', '::1', 'Chrome', 'desktop'),
(1743, 23, '/Uni_Scope1/manager/selected.php?err=zip', NULL, '2026-03-11 08:36:52', '::1', 'Chrome', 'desktop'),
(1744, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:37:11', '::1', 'Chrome', 'desktop'),
(1745, 23, '/Uni_Scope1/manager/selected.php?err=zip_ext', NULL, '2026-03-11 08:37:11', '::1', 'Chrome', 'desktop'),
(1746, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:39:57', '::1', 'Chrome', 'desktop'),
(1747, 23, '/Uni_Scope1/manager/selected.php?err=zip_ext', NULL, '2026-03-11 08:39:57', '::1', 'Chrome', 'desktop'),
(1748, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:39:58', '::1', 'Chrome', 'desktop'),
(1749, 23, '/Uni_Scope1/manager/selected.php?err=zip_ext', NULL, '2026-03-11 08:39:58', '::1', 'Chrome', 'desktop'),
(1750, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:39:59', '::1', 'Chrome', 'desktop'),
(1751, 23, '/Uni_Scope1/manager/selected.php?err=zip_ext', NULL, '2026-03-11 08:39:59', '::1', 'Chrome', 'desktop'),
(1752, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:40:00', '::1', 'Chrome', 'desktop'),
(1753, 23, '/Uni_Scope1/manager/selected.php?err=zip_ext', NULL, '2026-03-11 08:40:00', '::1', 'Chrome', 'desktop'),
(1754, 23, '/Uni_Scope1/manager/selected.php?err=zip_ext', NULL, '2026-03-11 08:40:01', '::1', 'Chrome', 'desktop'),
(1755, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:40:02', '::1', 'Chrome', 'desktop'),
(1756, 23, '/Uni_Scope1/manager/selected.php?err=zip_ext', NULL, '2026-03-11 08:40:02', '::1', 'Chrome', 'desktop'),
(1757, 23, '/Uni_Scope1/dashboard.php', NULL, '2026-03-11 08:47:51', '::1', 'Chrome', 'desktop'),
(1758, 23, '/Uni_Scope1/manager/selected.php', NULL, '2026-03-11 08:47:54', '::1', 'Chrome', 'desktop'),
(1759, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:47:55', '::1', 'Chrome', 'desktop'),
(1760, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:47:56', '::1', 'Chrome', 'desktop'),
(1761, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:47:56', '::1', 'Chrome', 'desktop'),
(1762, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:51:08', '::1', 'Chrome', 'desktop'),
(1763, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:51:12', '::1', 'Chrome', 'desktop'),
(1764, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:51:24', '::1', 'Chrome', 'desktop'),
(1765, 23, '/Uni_Scope1/manager/download_zip.php', NULL, '2026-03-11 08:51:24', '::1', 'Chrome', 'desktop'),
(1766, 23, '/Uni_Scope1/manager/exception_reports.php', NULL, '2026-03-11 08:57:35', '::1', 'Chrome', 'desktop'),
(1767, 23, '/Uni_Scope1/manager/exception_reports.php?report=no_comment&faculty_id=&export=csv', NULL, '2026-03-11 09:04:59', '::1', 'Chrome', 'desktop'),
(1768, 23, '/Uni_Scope1/logout.php', NULL, '2026-03-11 09:09:02', '::1', 'Chrome', 'desktop');

-- --------------------------------------------------------

--
-- Table structure for table `terms_acceptance`
--

CREATE TABLE `terms_acceptance` (
  `acceptance_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `accepted_date` datetime NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  `terms_version` varchar(20) NOT NULL DEFAULT '1.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms_acceptance`
--

INSERT INTO `terms_acceptance` (`acceptance_id`, `user_id`, `accepted_date`, `ip_address`, `terms_version`) VALUES
(4, 19, '2026-02-17 17:05:23', '::1', '1.0'),
(8, 28, '2026-03-10 23:20:07', '::1', '1.0'),
(9, 21, '2026-03-10 23:50:51', '::1', '1.0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'Bcrypt hash',
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `faculty_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'For Student & Guest; NULL for Coordinator/Manager/Admin',
  `last_login` datetime DEFAULT NULL COMMENT 'Previous login; NULL = first login',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `first_name`, `last_name`, `role_id`, `faculty_id`, `last_login`, `created_at`, `is_active`) VALUES
(1, 'admin@uniscope.local', '$2y$10$nSMECA7TgyKPR64rD847iu7pYRMUGChpVHM0Jpna8owSSZqkDQ3fq', 'System', 'Administrator', 4, NULL, '2026-03-11 08:34:08', '2026-02-07 22:32:40', 1),
(16, 'karndeep20047@gmail.com', '$2y$10$GOP8DodjjHaZjbwgWHE99e0EDpdslprJIpAUrM1SJ7UlXwxcuDAnS', 'Sunny', 'Singh', 5, 2, NULL, '2026-02-17 17:01:30', 1),
(17, 'awesomeanimetv22@gmail.com', '$2y$10$hmcb4zWFsZVLdYrZn9XGc.b6Gsw4uTAURDzhqQASbFqAvGKbQJC7W', 'Sunny', 'Singh', 2, NULL, '2026-03-11 08:15:28', '2026-02-17 17:02:51', 1),
(18, 'karandeeps949@gmail.com', '$2y$10$VgyZ6sGuTOkIDHZrSLeYgu3SKuEFD4LS9hASlEieqUKyi16HKjWGS', 'Sunny', 'Singh', 3, NULL, '2026-02-25 08:08:39', '2026-02-17 17:03:22', 1),
(19, 'tanveers20067@gmail.com', '$2y$10$oqMgrF1qE8fICYYibQypEeLS8eKV1NyfZZ14uRGnSCl3Zumgi5ne.', 'Sunny', 'Singh', 1, 4, '2026-03-11 08:14:02', '2026-02-17 17:04:33', 1),
(20, 'sunny2@gmail.com', '$2y$10$9NuhCfG0plVfWOIQA4p4R.NrbC19MOtWtrYcDsS50TnYdcOTrBHoi', 'Sunny', 'Bhamrah', 1, 1, '2026-03-01 22:25:01', '2026-03-01 22:24:54', 1),
(21, 'student@uniscope.local', '$2y$10$21icgUDxuxLQSe6kd2413OV0VwDN6DqX7nMNSC750g4UEz/SYEwR6', 'Test', 'Student', 1, 2, '2026-03-10 23:55:19', '2026-03-09 15:36:42', 1),
(22, 'coordinator@uniscope.local', '$2y$10$Bymzk9.INxQLxUg2zBhWHu.x9mGEn.3VCJQQbhUtr1Z3mbyHm2h/a', 'Test', 'Coordinator', 2, NULL, '2026-03-11 08:20:29', '2026-03-09 15:36:42', 1),
(23, 'manager@uniscope.local', '$2y$10$xFxSWNDapQk16OieH/B2CuhEulCA7wKsq1uf8VSWeMNK.ENhfOM.i', 'Test', 'Manager', 3, NULL, '2026-03-11 08:34:35', '2026-03-09 15:36:43', 1),
(24, 'guest@uniscope.local', '$2y$10$tc8l3BAhGC8r64U0l3oT8Omc4x8I7ZltT2gL3oqivTMWydzM3eST.', 'Test', 'Guest', 5, 2, '2026-03-09 19:29:20', '2026-03-09 15:36:43', 1),
(28, 'tanveer2@gmail.com', '$2y$10$iYN/ADAxfKG3cjCnz4U51euroav.fAiWEK3zPFfYSDi3vXdtSPzzm', 'Tanveer', 'Singh', 1, 3, '2026-03-11 08:19:28', '2026-03-10 23:20:07', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`academic_year_id`),
  ADD UNIQUE KEY `uk_academic_years_name` (`year_name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `idx_comments_submission` (`submission_id`),
  ADD KEY `idx_comments_coordinator` (`coordinator_id`);

--
-- Indexes for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `idx_replies_comment` (`comment_id`),
  ADD KEY `fk_replies_user` (`user_id`);

--
-- Indexes for table `coordinator_faculties`
--
ALTER TABLE `coordinator_faculties`
  ADD PRIMARY KEY (`user_id`,`faculty_id`),
  ADD KEY `idx_coord_faculty` (`faculty_id`);

--
-- Indexes for table `email_log`
--
ALTER TABLE `email_log`
  ADD PRIMARY KEY (`email_log_id`),
  ADD KEY `idx_email_recipient` (`recipient_id`),
  ADD KEY `idx_email_sent_at` (`sent_at`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`faculty_id`),
  ADD UNIQUE KEY `uk_faculties_name` (`faculty_name`);

--
-- Indexes for table `guest_access`
--
ALTER TABLE `guest_access`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `idx_images_student` (`student_id`),
  ADD KEY `idx_images_submission` (`submission_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `idx_reset_token_hash` (`token_hash`),
  ADD KEY `idx_reset_expires` (`expires_at`),
  ADD KEY `fk_reset_user` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `uk_roles_name` (`role_name`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `idx_submissions_student` (`student_id`),
  ADD KEY `idx_submissions_faculty` (`faculty_id`),
  ADD KEY `idx_submissions_academic_year` (`academic_year_id`),
  ADD KEY `idx_submissions_status` (`status_id`),
  ADD KEY `idx_submissions_submission_date` (`submission_date`);

--
-- Indexes for table `submission_statuses`
--
ALTER TABLE `submission_statuses`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `uk_status_name` (`status_name`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idx_logs_user` (`user_id`),
  ADD KEY `idx_logs_time` (`log_time`),
  ADD KEY `idx_logs_page` (`page_visited`(100));

--
-- Indexes for table `terms_acceptance`
--
ALTER TABLE `terms_acceptance`
  ADD PRIMARY KEY (`acceptance_id`),
  ADD KEY `idx_terms_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uk_users_email` (`email`),
  ADD KEY `idx_users_role` (`role_id`),
  ADD KEY `idx_users_faculty` (`faculty_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `academic_year_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comment_replies`
--
ALTER TABLE `comment_replies`
  MODIFY `reply_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_log`
--
ALTER TABLE `email_log`
  MODIFY `email_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `faculty_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `token_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `submission_statuses`
--
ALTER TABLE `submission_statuses`
  MODIFY `status_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1769;

--
-- AUTO_INCREMENT for table `terms_acceptance`
--
ALTER TABLE `terms_acceptance`
  MODIFY `acceptance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_coordinator` FOREIGN KEY (`coordinator_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_comments_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Constraints for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD CONSTRAINT `fk_replies_comment` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_replies_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `coordinator_faculties`
--
ALTER TABLE `coordinator_faculties`
  ADD CONSTRAINT `fk_coordfac_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_coordfac_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `email_log`
--
ALTER TABLE `email_log`
  ADD CONSTRAINT `fk_email_recipient` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `guest_access`
--
ALTER TABLE `guest_access`
  ADD CONSTRAINT `fk_guest_access_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_images_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE SET NULL;

--
-- Constraints for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD CONSTRAINT `fk_reset_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `fk_submissions_academic_year` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_years` (`academic_year_id`),
  ADD CONSTRAINT `fk_submissions_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`),
  ADD CONSTRAINT `fk_submissions_status` FOREIGN KEY (`status_id`) REFERENCES `submission_statuses` (`status_id`),
  ADD CONSTRAINT `fk_submissions_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD CONSTRAINT `fk_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `terms_acceptance`
--
ALTER TABLE `terms_acceptance`
  ADD CONSTRAINT `fk_terms_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`),
  ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
