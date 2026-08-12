-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 13, 2026 at 01:58 AM
-- Server version: 8.0.37
-- PHP Version: 8.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eialk_logindb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','superadmin') NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'superadmin', 'superadmin@eia.lk', '$2a$12$prgLl9QcFd68VqUKjj/SBOpVZnLvfWUsODEHbJRCL3jqTm2apgKL2', 'superadmin', '2025-04-16 05:56:44'),
(2, 'joash', 'joashjeshurun9@protonmail.ch', '$2y$10$Hhikxr9Xmfi5JgXXmEnLUOvNACZLxwoSc96e9aWGvshue4YldQVM6', 'superadmin', '2025-11-14 20:01:11'),
(6, 'Jeffy', 'jeffersonben369@gmail.com', '$2y$10$lgJTe0bB/7FkSY1RxBl9OuP54rQuj1iKsuLRNuR462ACWuqsFpA46', 'superadmin', '2025-04-16 10:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int NOT NULL,
  `admin_id` int NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `admin_id`, `action`, `details`, `created_at`) VALUES
(1, 1, 'Admin login', 'Admin superadmin logged in', '2025-04-16 06:02:00'),
(2, 1, 'Admin login', 'Admin superadmin logged in', '2025-04-16 06:31:57'),
(3, 1, 'Admin login', 'Admin superadmin logged in', '2025-04-16 08:54:47'),
(4, 1, 'Admin added', 'New admin: jeffy (admin)', '2025-04-16 09:19:45'),
(5, 1, 'Admin added', 'New admin: 2153 (admin)', '2025-04-16 09:20:23'),
(6, 1, 'Admin deleted', 'Admin ID: 2 deleted', '2025-04-16 09:21:02'),
(7, 1, 'Admin deleted', 'Admin ID: 2 deleted', '2025-04-16 09:21:05'),
(8, 1, 'Admin deleted', 'Admin ID: 2 deleted', '2025-04-16 09:22:20'),
(9, 1, 'Admin added', 'New admin: admin (admin)', '2025-04-16 09:49:33'),
(10, 1, 'Admin added', 'New admin: jeffersonben369@gmail.com (superadmin)', '2025-04-16 09:49:54'),
(11, 1, 'Admin deleted', 'Admin ID: 5 deleted', '2025-04-16 09:50:10'),
(12, 1, 'Admin deleted', 'Admin ID: 5 deleted', '2025-04-16 09:50:13'),
(13, 1, 'Admin deleted', 'Admin ID: 4 deleted', '2025-04-16 09:50:20'),
(14, 1, 'Admin deleted', 'Admin ID: 4 deleted', '2025-04-16 09:50:24'),
(15, 1, 'Admin deleted', 'Admin ID: 4 deleted', '2025-04-16 09:59:25'),
(16, 1, 'Admin login', 'Admin superadmin logged in', '2025-04-16 10:30:06'),
(17, 1, 'User deleted', 'User ID: 6 deleted', '2025-04-16 10:30:42'),
(18, 1, 'User deleted', 'User ID: 6 deleted', '2025-04-16 10:30:46'),
(19, 1, 'User deleted', 'User ID: 6 deleted', '2025-04-16 10:32:23'),
(20, 1, 'User deleted', 'User ID: 6 deleted', '2025-04-16 10:32:30'),
(21, 1, 'Admin added', 'New admin: Jeffy (superadmin)', '2025-04-16 10:32:57'),
(22, 1, 'Payment status updated', 'User ID: 13 set to Paid', '2025-04-16 10:41:01'),
(23, 1, 'Payment status updated', 'User ID: 4 set to Paid', '2025-04-16 10:41:08'),
(24, 1, 'Payment status updated', 'User ID: 4 set to Unpaid', '2025-04-16 10:41:15'),
(25, 1, 'Payment status updated', 'User ID: 13 set to Unpaid', '2025-04-16 10:45:21'),
(26, 1, 'Payment status updated', 'User ID: 13 set to Paid', '2025-04-16 10:45:25'),
(27, 1, 'Emails sent', 'Sent 1 emails, 0 failed', '2025-04-16 10:51:27'),
(28, 6, 'Admin login', 'Admin Jeffy logged in', '2025-04-16 10:53:51'),
(29, 6, 'Payment status updated', 'User ID: 4 set to Paid', '2025-04-16 10:54:37'),
(30, 6, 'Payment status updated', 'User ID: 4 set to Unpaid', '2025-04-16 10:57:21'),
(31, 6, 'Payment status updated', 'User ID: 4 set to Paid', '2025-04-16 10:57:37'),
(32, 6, 'Payment status updated', 'User ID: 4 set to Unpaid', '2025-04-16 10:57:39'),
(33, 6, 'Payment status updated', 'User ID: 13 set to Unpaid', '2025-04-16 10:57:41'),
(34, 6, 'Payment status updated', 'User ID: 13 set to Paid', '2025-04-16 10:57:55'),
(35, 6, 'Admin login', 'Admin Jeffy logged in', '2025-04-16 12:12:30'),
(36, 6, 'Admin login', 'Admin Jeffy logged in', '2025-04-16 12:19:36'),
(37, 6, 'Payment status updated', 'User ID: 4 set to Paid', '2025-04-16 12:20:06'),
(38, 6, 'Payment status updated', 'User ID: 4 set to Unpaid', '2025-04-16 12:20:10'),
(39, 6, 'Admin login', 'Admin Jeffy logged in', '2025-04-16 14:17:49'),
(40, 6, 'Payment status updated', 'User ID: 13 set to Paid', '2025-04-16 14:17:58'),
(41, 6, 'Payment status updated', 'User ID: 13 set to Paid', '2025-04-16 14:18:01'),
(42, 6, 'Payment status updated', 'User ID: 13 set to Paid', '2025-04-16 14:18:55'),
(43, 6, 'Payment status updated', 'User ID: 13 set to Paid', '2025-04-16 14:18:57'),
(44, 6, 'Admin added', 'New admin: admin (admin)', '2025-04-16 14:19:41'),
(48, 6, 'Admin login', 'Admin Jeffy logged in', '2025-04-16 15:19:28'),
(49, 6, 'Payment status updated', 'User ID: 13 set to Paid', '2025-04-16 15:19:41'),
(50, 6, 'Payment status updated', 'User ID: 13 set to Paid', '2025-04-16 15:19:46'),
(51, 6, 'Admin login', 'Admin Jeffy logged in', '2025-04-18 19:31:14'),
(52, 6, 'Admin login', 'Admin Jeffy logged in', '2025-04-20 11:12:24'),
(53, 2, 'Admin login', 'Admin joash logged in', '2025-11-14 20:32:49'),
(54, 2, 'Emails sent', 'Sent 1 emails, 0 failed', '2025-11-14 20:44:06'),
(55, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2025-11-14 20:44:36'),
(56, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2025-11-14 20:44:40'),
(57, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2025-11-14 20:44:43'),
(58, 2, 'Payment status updated', 'User ID: 52 set to Paid', '2025-11-14 20:44:46'),
(59, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2025-11-14 20:49:45'),
(60, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2025-11-14 20:50:28'),
(61, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2025-11-14 21:11:18'),
(62, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2025-11-14 21:11:21'),
(63, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2025-11-14 21:14:23'),
(64, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2025-11-14 21:14:26'),
(65, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2025-11-14 21:15:32'),
(66, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2025-11-14 21:16:07'),
(67, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2025-11-14 21:16:10'),
(68, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2025-11-14 21:16:29'),
(69, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2025-11-14 21:16:58'),
(70, 2, 'Payment status updated', 'User ID: 52 set to Unpaid', '2025-11-14 21:17:01'),
(71, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2025-11-14 21:19:01'),
(72, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2025-11-14 21:20:31'),
(73, 2, 'Admin deleted', 'Admin ID: 8 deleted', '2025-11-14 21:27:58'),
(74, 2, 'Payment status updated', 'User ID: 54 set to Paid', '2025-11-14 21:30:50'),
(75, 2, 'Payment status updated', 'User ID: 54 set to Unpaid', '2025-11-14 21:31:23'),
(76, 2, 'Payment status updated', 'User ID: 54 set to Paid', '2025-11-14 21:31:27'),
(77, 2, 'Admin login', 'Admin joash logged in', '2025-11-15 06:07:43'),
(78, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2025-11-15 06:08:40'),
(79, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2025-11-15 06:21:24'),
(80, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2025-11-15 06:21:27'),
(81, 6, 'Admin login', 'Admin Jeffy logged in', '2025-11-15 12:57:55'),
(82, 6, 'Payment status updated', 'User ID: 54 set to Unpaid', '2025-11-15 12:58:14'),
(83, 6, 'Payment status updated', 'User ID: 54 set to Paid', '2025-11-15 12:58:17'),
(84, 2, 'Admin login', 'Admin joash logged in', '2025-11-17 17:46:22'),
(85, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2025-11-17 17:46:42'),
(86, 2, 'Admin login', 'Admin joash logged in', '2025-11-19 18:29:01'),
(87, 2, 'Admin login', 'Admin joash logged in', '2026-04-20 17:56:06'),
(88, 2, 'Admin login', 'Admin joash logged in', '2026-04-20 18:26:18'),
(89, 2, 'Admin login', 'Admin joash logged in', '2026-04-20 18:30:09'),
(90, 2, 'Admin login', 'Admin joash logged in', '2026-04-20 18:48:12'),
(91, 2, 'Payment status updated', 'User ID: 60 set to Unpaid', '2026-04-20 18:52:32'),
(92, 2, 'Payment status updated', 'User ID: 60 set to Paid', '2026-04-20 18:52:34'),
(93, 2, 'Payment status updated', 'User ID: 60 set to Unpaid', '2026-04-20 18:52:37'),
(94, 2, 'User deleted', 'User ID: 57 deleted', '2026-04-20 18:52:51'),
(95, 2, 'User deleted', 'User ID: 57 deleted', '2026-04-20 18:52:54'),
(96, 2, 'Admin login', 'Admin joash logged in', '2026-04-22 21:08:59'),
(97, 2, 'Admin login', 'Admin joash logged in', '2026-04-23 18:32:32'),
(98, 2, 'Payment status updated', 'User ID: 61 set to Paid', '2026-04-23 18:34:53'),
(99, 2, 'Admin login', 'Admin joash logged in', '2026-04-24 10:06:20'),
(100, 2, 'Payment status updated', 'User ID: 63 set to Paid', '2026-04-24 10:08:38'),
(101, 2, 'Admin login', 'Admin joash logged in', '2026-04-24 15:17:40'),
(102, 2, 'Payment status updated', 'User ID: 60 set to Paid', '2026-04-24 15:17:50'),
(103, 2, 'Admin login', 'Admin joash logged in', '2026-04-25 15:13:01'),
(104, 2, 'Payment status updated', 'User ID: 63 set to Unpaid', '2026-04-25 15:24:14'),
(105, 2, 'Payment status updated', 'User ID: 61 set to Unpaid', '2026-04-25 15:24:26'),
(106, 2, 'Payment status updated', 'User ID: 63 set to Paid', '2026-04-25 15:31:35'),
(107, 2, 'Payment status updated', 'User ID: 62 set to Paid', '2026-04-25 15:31:43'),
(108, 2, 'Payment status updated', 'User ID: 61 set to Paid', '2026-04-25 15:31:48'),
(109, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2026-04-25 15:32:10'),
(110, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2026-04-25 15:38:22'),
(111, 2, 'Payment status updated', 'User ID: 60 set to Unpaid', '2026-04-25 15:38:26'),
(112, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2026-04-25 15:45:15'),
(113, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2026-04-25 15:45:34'),
(114, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2026-04-25 15:45:46'),
(115, 2, 'Payment status updated', 'User ID: 53 set to Unpaid', '2026-04-25 15:45:55'),
(116, 2, 'Payment status updated', 'User ID: 53 set to Paid', '2026-04-25 15:46:14'),
(117, 2, 'Admin login', 'Admin joash logged in', '2026-04-25 16:44:24'),
(118, 2, 'Payment status updated', 'User ID: 63 set to Unpaid', '2026-04-25 16:47:42'),
(119, 2, 'Admin login', 'Admin joash logged in', '2026-04-25 17:30:47'),
(120, 2, 'Admin login', 'Admin joash logged in', '2026-04-25 17:44:23'),
(121, 2, 'Payment status updated', 'User ID: 72 set to Paid', '2026-04-25 18:06:24'),
(122, 2, 'Payment status updated', 'User ID: 72 set to Unpaid', '2026-04-25 18:06:36'),
(123, 2, 'Admin login', 'Admin joash logged in', '2026-04-25 18:37:53'),
(124, 2, 'Payment status updated', 'User ID: 74 set to Paid', '2026-04-25 18:52:14'),
(125, 2, 'Payment status updated', 'User ID: 73 set to Paid', '2026-04-25 18:56:22'),
(126, 2, 'Payment status updated', 'User ID: 73 set to Unpaid', '2026-04-25 18:56:25'),
(127, 2, 'Payment status updated', 'User ID: 74 set to Paid', '2026-04-25 18:59:07'),
(128, 2, 'Payment status updated', 'User ID: 73 set to Paid', '2026-04-25 18:59:15'),
(129, 2, 'Payment status updated', 'User ID: 74 set to Unpaid', '2026-04-25 18:59:20'),
(130, 2, 'Payment status updated', 'User ID: 73 set to Unpaid', '2026-04-25 18:59:21'),
(131, 2, 'User deleted', 'User ID: 73 deleted', '2026-04-25 18:59:27'),
(132, 2, 'User deleted', 'User ID: 73 deleted', '2026-04-25 18:59:31'),
(133, 2, 'Admin login', 'Admin joash logged in', '2026-04-25 19:14:16'),
(134, 2, 'Admin login', 'Admin joash logged in', '2026-04-25 19:19:14'),
(135, 2, 'Admin login', 'Admin joash logged in', '2026-04-25 21:19:32'),
(136, 2, 'User deleted', 'User ID: 77 deleted', '2026-04-25 21:19:43'),
(137, 2, 'User deleted', 'User ID: 77 deleted', '2026-04-25 21:19:49'),
(138, 2, 'Admin login', 'Admin joash logged in', '2026-08-11 12:55:34'),
(139, 2, 'Admin login', 'Admin joash logged in', '2026-08-12 19:08:39'),
(140, 2, 'Admin login', 'Admin joash logged in', '2026-08-12 20:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `sent_emails`
--

CREATE TABLE `sent_emails` (
  `id` int NOT NULL,
  `admin_id` int NOT NULL,
  `recipient_id` int DEFAULT NULL,
  `recipient_email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sent_emails`
--

INSERT INTO `sent_emails` (`id`, `admin_id`, `recipient_id`, `recipient_email`, `subject`, `message`, `sent_at`) VALUES
(2, 2, 53, 'joashjeshurun9@protonmail.ch', 'EIA Website Login Page Updated', 'A new option has been enabled to add a profile picture.\r\n\r\nIf you still encounter any errors, please contact the developer via mail: joashjeshurun9@protonmail.ch', '2025-11-14 20:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `site_images`
--

CREATE TABLE `site_images` (
  `id` int NOT NULL,
  `image_key` varchar(100) NOT NULL,
  `image_src` text NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `site_images`
--

INSERT INTO `site_images` (`id`, `image_key`, `image_src`, `alt_text`, `description`, `updated_at`) VALUES
(1, 'home_slider_1', '/Mentor/assets/img/hero-bg.jpg', 'Abstract blue background', 'Home page slider, first image.', '2025-11-17 20:32:27'),
(2, 'home_slider_2', 'https://live.staticflickr.com/65535/54469245540_865f08e49a_o.jpg', 'Group photo', 'Home page slider, second image.', '2025-11-17 20:32:27'),
(3, 'home_slider_3', '/Mentor/2024/Thumbnail/IMG_3330.JPG', 'Students at event', 'Home page slider, third image.', '2025-11-17 20:32:27'),
(4, 'home_slider_4', '/Mentor/2024/Thumbnail/kanali.jpg', 'Kanali event', 'Home page slider, fourth image.', '2025-11-17 20:32:27'),
(5, 'home_slider_5', '/Mentor/2024/Thumbnail/IMG_9007.JPG', 'Students in a hall', 'Home page slider, fifth image.', '2025-11-17 20:32:27'),
(6, 'about_section_cover', '/Mentor/assets/img/cover.JPG', 'EIA members group photo', 'Image next to the \"About Us\" text on the home page.', '2025-11-17 20:32:27'),
(7, 'project_teaching_thumbnail', 'https://1.bp.blogspot.com/-CgHbqDC5BDc/Xxk9faCxbXI/AAAAAAAAZ90/wBTaGLz9n847x72UxHRa8zMjUX2MnT8dACLcBGAsYHQ/d/z_p05-sidelined.jpg', 'Teaching Project', 'Thumbnail for the Teaching Project card on the home page.', '2025-11-19 18:23:41'),
(8, 'project_arduino_thumbnail', 'assets/img/course-1.jpg', 'Arduino Workshop', 'Thumbnail for the Arduino Project card on the home page.', '2025-11-19 18:23:41'),
(9, 'project_physics_thumbnail', 'https://i.ytimg.com/vi/JTvzP7HrMxU/maxresdefault.jpg', 'Physics Practical', 'Thumbnail for the Physics Workshop card on the home page.', '2025-11-19 18:23:41'),
(10, 'project_youtube_thumbnail', 'assets/img/course-3.jpg', 'YouTube Project', 'Thumbnail for the YouTube Project card on the home page.', '2025-11-19 18:23:41'),
(11, 'site_favicon', 'assets/img/favicon.png', 'EIA Favicon', 'Browser tab icon found in head section', '2025-11-19 17:44:03'),
(12, 'site_apple_icon', 'assets/img/apple-touch-icon.png', 'Apple Touch Icon', 'Apple touch icon found in head section', '2025-11-19 17:44:03'),
(13, 'header_logo', 'assets/img/logo.png', 'EIA Logo', 'Header logo (currently commented out in HTML)', '2025-11-19 17:44:03'),
(14, 'hero_iphone_1', 'assets/img/iphone3.png', 'Image', 'Hero section first iPhone image (phone-1)', '2025-11-19 17:44:03'),
(15, 'hero_iphone_2', 'assets/img/iphone4_new.png', 'Image', 'Hero section second iPhone image (phone-2)', '2025-11-19 17:44:03'),
(16, 'mentor_favicon', 'assets/img/eia.png', 'EIA Favicon', 'Browser tab icon', '2025-11-19 17:52:43'),
(17, 'mentor_apple_icon', 'assets/img/eia.png', 'EIA Touch Icon', 'Apple touch icon', '2025-11-19 17:52:43'),
(18, 'project_physics_trainer', 'assets/img/default-avatar.png', 'Physics Trainer', 'Profile picture for Physics project trainer', '2025-11-19 17:52:43'),
(19, 'project_medical_visit_thumbnail', 'https://bottishamvc.org/wp-content/uploads/2022/03/2022-03-16-IMG_4113-1536x1024.jpg', 'Medical Faculty Visit', 'Thumbnail for Medical Visit', '2025-11-19 18:23:41'),
(20, 'project_blood_donation_thumbnail', 'https://t3.ftcdn.net/jpg/10/52/12/88/360_F_1052128878_vIHikjpTLNiJIUxR8VdjKdjWKjC4bomB.jpg', 'Blood Donation Camp', 'Thumbnail for Blood Donation', '2025-11-19 18:23:41'),
(21, 'project_motivational_thumbnail', 'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTEwL3Jhd3BpeGVsb2ZmaWNlMTFfaW1hZ2Vfb2ZfbW90aXZhdGlvbmFsX3NwZWFrZXJfc3RhbmRpbmdfb25fc3RhZ18wMWZlOTQ0YS0zOTFlLTQ4ZTgtOWZkMi00MjNiODFjYmI4YTJfMS5qcGc.jpg', 'Motivational Seminar', 'Thumbnail for Motivational Seminar', '2025-11-19 18:23:41'),
(22, 'project_medical_camp_thumbnail', 'https://samwumed.org/wp-content/uploads/2024/05/SAMWUMED-Medical-Aid-plans-post-Compressed0-21-May-2024.jpg', 'Medical Camp', 'Thumbnail for Medical Camp', '2025-11-19 18:23:41'),
(23, 'project_social_thumbnail', 'https://static.vecteezy.com/system/resources/previews/022/171/704/large_2x/people-helping-planting-tree-in-nature-for-save-earth-environment-eco-concept-free-photo.jpg', 'Social Project', 'Thumbnail for Social Related Project', '2025-11-19 18:23:41'),
(24, 'project_chess_thumbnail', 'https://img.freepik.com/premium-photo/chess-pieces-chess-board-with-words-chess-pieces-bottom_931576-20116.jpg', 'Chess Tournament', 'Thumbnail for Chess Tournament', '2025-11-19 18:23:41'),
(25, 'project_carwash_thumbnail', 'https://img.freepik.com/premium-photo/washing-red-car-with-active-foam-car-wash-service_1041545-7410.jpg', 'Car Wash', 'Thumbnail for Car Wash', '2025-11-19 18:23:41'),
(26, 'project_cricket_thumbnail', 'https://media.istockphoto.com/id/490665558/photo/cricket-ball.jpg?s=612x612&w=0&k=20&c=PzdAOajvhUcSHVH7ZJiqNqNDMap6zHosRuDTgKQBTaQ=', 'Cricket Tournament', 'Thumbnail for Cricket Tournament', '2025-11-19 18:23:41'),
(27, 'project_agt_thumbnail', 'https://t3.ftcdn.net/jpg/08/69/62/12/360_F_869621205_uYfl5FjuUmTa06KSF8NENcyUq4QEj26m.jpg', 'Annual Get-together', 'Thumbnail for AGT', '2025-11-19 18:23:41'),
(28, 'project_agm_thumbnail', 'https://t4.ftcdn.net/jpg/07/23/61/59/360_F_723615917_w5ucZiHyuld9OqKlk6BvJx010u7iEt6f.jpg', 'Annual General Meeting', 'Thumbnail for AGM', '2025-11-19 18:23:41'),
(29, 'project_special_thumbnail', 'https://stint.com/wp-content/uploads/2024/02/Special-Projects-1.png', 'Special Projects', 'Thumbnail for Special Projects', '2026-08-12 19:33:35'),
(34, 'project_youtube_2023_cover', 'https://live.staticflickr.com/65535/54466616673_41a447bc37_z.jpg', 'Youtube Project 2023', 'Main cover image for Youtube Project 2023', '2025-11-19 18:27:53'),
(35, 'project_youtube_tab_1', 'assets/img/course-details-tab-1.png', 'Benefits Graph', 'Image for Benefits tab', '2025-11-19 18:27:53'),
(36, 'project_youtube_tab_2', 'assets/img/course-details-tab-2.png', 'Impact Graph', 'Image for Impact tab', '2025-11-19 18:27:53'),
(37, 'project_youtube_tab_3', 'assets/img/course-details-tab-3.png', 'Feedback Graph', 'Image for Feedback tab', '2025-11-19 18:27:53'),
(38, 'project_youtube_tab_4', 'assets/img/course-details-tab-4.png', 'Budget Graph', 'Image for Budget tab', '2025-11-19 18:27:53'),
(39, 'project_youtube_tab_5', 'assets/img/course-details-tab-5.png', 'Conclusion Graph', 'Image for Conclusion tab', '2025-11-19 18:27:53');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` int NOT NULL,
  `category` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role_title` varchar(100) DEFAULT NULL,
  `description` text,
  `image_src` varchar(255) NOT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `display_order` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `category`, `name`, `role_title`, `description`, `image_src`, `twitter`, `facebook`, `instagram`, `linkedin`, `display_order`) VALUES
(1, 'Board', 'Dr. J. Jeyaruban', '', 'Senior Lecturer in Surgery / <br>Consultant Surgeon (Hon.),<br>Eastern University, Sri Lanka / <br>Teaching Hospital, Batticaloa', 'assets/img/trainers/Jeyaruben.png', '', '', '', '', 1),
(2, 'Board', 'Mr. M. Dayananthan', '', 'Ex. Assistant Director of Education <br>(Non formal Education),<br>Zonal Education Office, Batticaloa', 'assets/img/trainers/daya1.jpg', '', '', '', '', 2),
(3, 'Board', 'Dr. M. Shiyamasundaran', '', 'Project Director,<br>South West London Orthopaedic Centre,<br>Epsom Hospital,<br>Epsom, <br>UK.', 'assets/img/trainers/shiyam.jpg', '', '', '', '', 3),
(4, 'Council', 'Dr. S. Mathanalagan', '', 'Consultant Anaesthetist,<br>Special Training in Intensive Care,<br>Teaching Hospital, Batticaloa.', 'assets/img/trainers/mathan.jpg', '', '', '', '', 1),
(5, 'Council', 'Eng. A. Pushparajah', '', 'Additional General Manager<br> ( EPC- North),<br>Central Engineering Consultancy Bureau,<br>IESL Council Member.', 'assets/img/trainers/pushpa.jpg', '', '', '', '', 2),
(6, 'Council', 'Dr. Visvaan', '', 'Medical Officer,<br>Teaching Hospital, Batticaloa', 'assets/img/trainers/vishwa.jpg', '', '', '', '', 3),
(7, 'Council', 'Eng. R. Valluvan', '', 'B.Sc.Eng(Hons)(Peradeniya),<br>M.Sc in Electrical Engineering, AMIE(SL),<br>Lecturer (Probationary),<br>Department of Electrical and Electronic Engineering,<br>University of Jaffna.', 'assets/img/trainers/valluvan.jpeg', '', '', '', '', 4),
(8, 'Council', 'Dr. G. R. Francis', '', 'Honorary Consultant Cardiologist,<br> Teaching Hospital, Batticaloa.<br>Senior Lecturer in Medicine,<br>Faculty of Health-care Sciences, <br>Eastern University.', 'assets/img/trainers/francis.jpg', '', '', '', '', 5),
(9, 'Council', 'Eng. U. Mauran', '', 'Electrical Engineer, <br> Ceylon Electricity Board.', 'assets/img/trainers/mauran.jpg', '', '', '', '', 6),
(10, 'Council', 'Dr. M. Thamaneeyan', '', 'Medical Officer,<br>Teaching Hospital, Batticaloa.', 'assets/img/trainers/thamaneeyan.jpg', '', '', '', '', 7),
(11, 'Council', 'Eng. A. Printhan', '', 'Maintenance Engineer, <br>Sri Sathya Sai Sanjeevani Hospital.', 'assets/img/trainers/printhan.JPG', '', '', '', '', 8),
(12, 'Council', 'Dr. S. Ahilan', '', 'Consultant Histopathologist,<br>Teaching Hospital, Batticaloa.', 'assets/img/trainers/ahilan.jpg', '', '', '', '', 9),
(13, 'Council', 'Dr. M. Roshini', '', 'Senior Lecturer,<br>Faculty of Health-Care Sciences,<br>Eastern University, Sri Lanka.', 'assets/img/trainers/roshini.jpg', '', '', '', '', 10),
(14, 'Council', 'Dr. K. Brinda', '', 'MBBS (University of Jaffna),<br>Master of Science in Medical Toxicology (University of Colombo).', 'assets/img/trainers/brinda.jpg', '', '', '', '', 11),
(15, 'Council', 'Eng. S. Thushan', '', 'Doctoral Researcher,<br>Center for Wireless Communication,<br>University of Oulu, Finland.', 'assets/img/trainers/thushan.jpg', '', '', '', '', 12),
(16, 'Council', 'Eng. N. Sulaxshan', '', 'Lecturer (Probationary),<br> Faculty of Engineering, <br>South Eastern University of Sri Lanka.', 'assets/img/trainers/sulakshna.jpg', '', '', '', '', 13),
(17, 'Council', 'Dr. K. Mehanathan', '', 'Dental Surgeon,<br>Restorative Dentistry Unit, <br>Teaching Hospital,<br>Batticaloa.', 'assets/img/trainers/mehanathan.jpg', '', '', '', '', 14),
(18, 'Council', 'Dr. T. Kogulan', '', 'Lecturer in Surgery,<br>Faculty of Health-Care Sciences,<br>Eastern University, Sri Lanka.', 'assets/img/trainers/kogulan1.jpg', '', '', '', '', 15),
(19, 'Senior', 'Nagarajan Sorupan', 'Senior President', 'Temporary Instructor <br/>Department of Mathematics<br/> University of Colombo', 'assets/img/trainers/active/sorupan.jpeg', '', '', '', '', 1),
(20, 'Senior', 'Thanushkodi Tharanitharan', 'Senior Vice President', 'Undergraduate (MBBS)<br>FHCS, EUSL<br>Sri Lanka.', 'assets/img/trainers/active/tharanitharan.jpeg', '', '', '', '', 2),
(21, 'Senior', 'Eng. Sampavi Sivakumaran', 'Senior Secretary', 'Academic Instructor,<br>Department of Electrical and Telecommunication Engineering,<br/>South Eastern University.', 'assets/img/trainers/active/sampu.jpeg', '', '', '', '', 3),
(22, 'Senior', 'Mayrariniy Charles Jeyakumar', 'Senior Vice Secretary', 'Undergraduate<br>Faculty of Computer Engineering<br/>University of Jaffna.', 'assets/img/trainers/active/mayira.jpeg', '', '', '', '', 4),
(23, 'Senior', 'Eng. Monisha Varatharaj', 'Senior Treasurer', 'Junior Electrical Engineer<br>YHW LLP<br>Jaffna', 'assets/img/trainers/active/monisha.jpeg', '', '', '', '', 5),
(24, 'Junior', 'Lingeswaran Thanojith', 'Junior President', 'Undergraduate<br>Faculty of Medicine<br>University of Ruhuna', 'assets/img/trainers/active/thanojith.jpeg', 'https://x.com/diloshanpr91216?s=21', '', 'https://www.instagram.com/diloshankumar', '', 1),
(25, 'Junior', 'Sureshkumar Vetheesan', 'Junior Vice President', 'Undergraduate<br>Faculty of Engineering<br/>University of Moratuwa', 'assets/img/trainers/active/jvp.jpeg', '', '', '', '', 2),
(26, 'Junior', 'Navalogithan Sobia', 'Junior Secretary', 'Undergraduate<br>Faculty of Health-Care Sciences<br>Eastern University, SriLanka.', 'assets/img/trainers/active/sobia.jpeg', 'https://x.com/diloshanpr91216?s=21', '', 'https://www.instagram.com/diloshankumar', '', 3),
(27, 'Junior', 'Bawanthy Jeyatheepan', 'Junior Vice secretary', 'Undergraduate<br>Faculty of Medicine<br/>University of Colombo', 'assets/img/trainers/active/bawanthy.jpeg', 'https://x.com/kaarkyi?s=21', 'https://www.facebook.com/share/1Apxzv62kk/?mibextid=wwXIfr', 'https://www.instagram.com/im.kaarky?igsh=NTM4ajg1ZmhnMjZq&utm_source=qr', 'https://www.linkedin.com/in/kaarky-inpamohan-9a33b52a2?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app', 4),
(28, 'Junior', 'Puvanendrarajah Yohashmar', 'Junior Treasurer', 'Undergraduate<br>Faculty of Engineering <br>University of Moratuwa', 'assets/img/trainers/active/Yohashmar.jpeg', 'https://x.com/diloshanpr91216?s=21', '', 'https://www.instagram.com/diloshankumar', '', 5),
(29, 'Junior', 'Gowripalan Pavan', 'Junior Editor', 'Undergraduate<br>Faculty of Engineering<br/>University of Jaffna', 'assets/img/trainers/active/pavan.jpg', '', '', '', '', 6),
(30, 'Junior', 'Kavuchikan Nanthakumar', 'Junior Editor', 'Undergraduate<br>Faculty of Medicine<br/>University of Colombo', 'assets/img/trainers/active/kavi.jpeg', '', '', '', '', 7),
(31, 'Junior', 'Thusharika Pratheepan', 'Event Coordinator', 'Undergraduate<br>Faculty of Medicine<br/>University of Jaffna', 'assets/img/trainers/active/thusharika.jpeg', '', '', '', '', 8),
(32, 'Junior', 'Sasinanthan Abhiram', 'Event Coordinator', 'Undergraduate<br>Faculty of Engineering<br/>University of Jaffna', 'assets/img/trainers/active/abhiramsasi.jpeg', '', '', '', '', 9),
(33, 'Junior', 'Gunarajasegaram Kajaram', 'Event Coordinator', 'Undergraduate<br>Faculty of Engineering<br/>University of Moratuwa', 'assets/img/trainers/active/kaja.jpeg', '', '', '', '', 10),
(34, 'Junior', 'Theivanayagam Rujan', 'Event Coordinator', 'Undergraduate<br>Faculty of Health-Care & Sciences<br/>Eastern University, SriLanka.', 'assets/img/trainers/active/rujanp.jpeg', '', '', '', '', 11),
(35, 'Senior_2019', 'Yanes Mahalingam', 'Senior President', 'Engineer,<br>Road Development Authority (RDA),<br>Sri Lanka.', 'assets/img/trainers/yanes1.jpg', NULL, NULL, NULL, NULL, 1),
(36, 'Senior_2019', 'Visvaan Navarasanathan', 'Senior Secretary', 'Medical Officer,<br> Teaching Hospital, Batticaloa', 'assets/img/trainers/vishwa.jpg', NULL, NULL, NULL, NULL, 2),
(37, 'Senior_2019', 'Sujeeka Nadarajah', 'Senior Treasurer', 'Engineer and Research Assistant,<br>University of Moratuwa.', 'assets/img/trainers/2019 20/sujika.jpg', NULL, NULL, NULL, NULL, 3),
(38, 'Senior_2019', 'Shrijen Puwaneswaran', 'Senior Treasurer', 'Highway Design Engineer,<br>CICO-SUN Constructions JV.', 'assets/img/trainers/2019 20/shrijen.jpg', NULL, NULL, NULL, NULL, 4),
(39, 'Junior_2019', 'Sriram Newjithan', 'Junior President', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Jaffna.', 'assets/img/trainers/2019 20/newjithan.jpg', NULL, NULL, NULL, NULL, 1),
(40, 'Junior_2019', 'Nagarajan Sorupan', 'Junior Vice President', 'Undergraduate,<br/>Faculty Of Science,<br/>University Of Colombo', 'assets/img/trainers/2019 20/sorupan.jpg', NULL, NULL, NULL, NULL, 2),
(41, 'Junior_2019', 'Delini Sellar', 'Junior Secretary', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Peradeniya', 'assets/img/trainers/2019 20/delini.jpeg', NULL, NULL, NULL, NULL, 3),
(42, 'Junior_2019', 'Varnakulasingam Dineshka', 'Junior Vice Secretary', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Jaffna', 'assets/img/trainers/2019 20/dineshka.jpeg', NULL, NULL, NULL, NULL, 4),
(43, 'Junior_2019', 'Sivapalasundharam Thanusiyan', 'Junior Treasurer', 'Undergraduate,<br/>Faculty Of Information Technology,<br/>University Of Moratuwa', 'assets/img/trainers/2019 20/thanushikan.jpeg', NULL, NULL, NULL, NULL, 5),
(44, 'Junior_2019', 'Pakkiyarajah Thareejan', 'Editor', 'Undergraduate,<br/>Faculty Of Information Technology,<br/>University Of Moratuwa', 'assets/img/trainers/2019 20/thareejan.jpeg', NULL, NULL, NULL, NULL, 6),
(45, 'Junior_2019', 'Kithurshika kirushnan', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Ruhunu', 'assets/img/trainers/2019 20/kithurshika.jpeg', NULL, NULL, NULL, NULL, 7),
(46, 'Junior_2019', 'Yogendran Kayooran', 'Committee Member', 'Undergraduate,<br/>Faculty Of Health Care Sciences,<br/>Eastern University', 'assets/img/trainers/2019 20/kayooran.jpg', NULL, NULL, NULL, NULL, 8),
(47, 'Junior_2019', 'Lainitha Krishnakumar', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Moratuwa', 'assets/img/trainers/2019 20/lainitha.jpeg', NULL, NULL, NULL, NULL, 9),
(48, 'Junior_2019', 'Sathiyeswaran Shathurnithan', 'Committee Member', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Jaffna', 'assets/img/trainers/2019 20/sathurnithan.jpg', NULL, NULL, NULL, NULL, 10),
(49, 'Junior_2019', 'Abinaya Kanagaretnam', 'Committee Member', 'Undergraduate,<br/>Faculty Of Health Care Sciences,<br/>Eastern University', 'assets/img/trainers/2019 20/abinaya.jpeg', NULL, NULL, NULL, NULL, 11),
(50, 'Junior_2019', 'Vyshnnavi Piranavasothy', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Ruhunu', 'assets/img/trainers/2019 20/vyshnavi.jpeg', NULL, NULL, NULL, NULL, 12),
(51, 'Junior_2019', 'Saaitha Sandeswaran', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Peradeniya', 'assets/img/trainers/2019 20/saaitha.jpeg', NULL, NULL, NULL, NULL, 13),
(52, 'Junior_2019', 'Shantosh Muraleetharan', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Peradeniya', 'assets/img/trainers/2019 20/santhosh.jpeg', NULL, NULL, NULL, NULL, 14),
(53, 'Junior_2019', 'Shathuja Sitsabeshan', 'Committee Member', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Jaffna', 'assets/img/trainers/2019 20/shathuja.jpeg', NULL, NULL, NULL, NULL, 15),
(54, 'Junior_2019', 'Mathushagan Jeganathan', 'Committee Member', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Jaffna', 'assets/img/trainers/2019 20/jeganathan1.jpg', NULL, NULL, NULL, NULL, 16),
(55, 'Junior_2019', 'Mayrariniy Charles Jeyakumar', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Jaffna', 'assets/img/trainers/2019 20/Ms.Mayrariniy Charles Jeyakumar_BSc.Eng in UOJ.jpg', NULL, NULL, NULL, NULL, 17),
(56, 'Junior_2019', 'Jude Surenraj', 'Committee Member', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Colombo', 'assets/img/trainers/2019 20/jude.jpg', NULL, NULL, NULL, NULL, 18),
(57, 'Junior_2019', 'Kasthoori Jegatheeswaran', 'Committee Member', 'Undergraduate,<br/>Faculty Of Health Care Sciences,<br/>Eastern University', 'assets/img/trainers/2019 20/kasthoori.jpeg', NULL, NULL, NULL, NULL, 19),
(58, 'Junior_2019', 'Vinoja Gunasekaran', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Jaffna', 'assets/img/trainers/2019 20/vinoja.jpeg', NULL, NULL, NULL, NULL, 20),
(59, 'Junior_2019', 'Ms. Abinaya Seevaratnam', 'Committee Member', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Ruhunu', 'assets/img/trainers/2019 20/abinaya.jpg', NULL, NULL, NULL, NULL, 21),
(60, 'Junior_2019', 'Piramiya Perinparasa', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Jaffna', 'assets/img/trainers/2019 20/piramiya.jpeg', NULL, NULL, NULL, NULL, 22),
(61, 'Junior_2019', 'Abishaya Thayaparan', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Peradeniya', 'assets/img/trainers/2019 20/abishaya.jpeg', NULL, NULL, NULL, NULL, 23),
(62, 'Junior_2019', 'Hammche Loganayagam', 'Committee Member', 'Undergraduate,<br/>Faculty Of Health Care Sciences,<br/>Eastern University', 'assets/img/trainers/2019 20/hammchee.jpeg', NULL, NULL, NULL, NULL, 24),
(63, 'Junior_2019', 'Wysnave Jeyakumar', 'Committee Member', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Moratuwa', 'assets/img/trainers/2019 20/Wyshnavi.jpeg', NULL, NULL, NULL, NULL, 25),
(64, 'Junior_2019', 'Lithushayini Inparajah', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Jaffna', 'assets/img/trainers/2019 20/lithushaayini.jpeg', NULL, NULL, NULL, NULL, 26),
(65, 'Junior_2019', 'Kimasha Benedict', 'Committee Member', 'Undergraduate,<br/>Faculty Of Health Care Sciences,<br/>Eastern University', 'assets/img/trainers/2019 20/kimaasha.jpeg', NULL, NULL, NULL, NULL, 27),
(66, 'Junior_2019', 'Sancheka Yoganathan', 'Committee Member', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Moratuwa', 'assets/img/trainers/2019 20/sancheja.jpeg', NULL, NULL, NULL, NULL, 28),
(67, 'Junior_2019', 'Vigneswararajah Mithulavan', 'Committee Member', 'Undergraduate,<br/>Faculty Of Engineering,<br/>University Of Jaffna', 'assets/img/trainers/2019 20/mithulavan.jpeg', NULL, NULL, NULL, NULL, 29),
(68, 'Junior_2019', 'Shenika Joseph', 'Committee Member', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Jaffna', 'assets/img/trainers/2019 20/shenika.jpeg', NULL, NULL, NULL, NULL, 30),
(69, 'Junior_2019', 'Ravichandran Yathushan', 'Committee Member', 'Undergraduate,<br/>Faculty Of Medicine,<br/>University Of Colombo', 'assets/img/trainers/2019 20/yathusan.jpg', NULL, NULL, NULL, NULL, 31),
(70, 'Senior_2020', 'Thadsanamoorthy Phapetha', 'Senior President', 'Lecturer (Probationary),<br>Department of Civil Engineering,<br>South Eastern University of Srilanka', 'assets/img/trainers/2020 21/phapetha.jpeg', NULL, NULL, NULL, NULL, 1),
(71, 'Senior_2020', 'Kulanthaivel Raakulan', 'Senior Vice President', 'Civil Engineer,<br>National Building Research Organisation,<br>Sri Lanka.', 'assets/img/trainers/2020 21/raakulan.jpeg', NULL, NULL, NULL, NULL, 2),
(72, 'Senior_2020', 'Kamalanathan Havipriya', 'Senior Secretary', 'Intern House Officer<br>Teaching Hospital, Peradeniya.', 'assets/img/trainers/2020 21/havipriya.jpg', NULL, NULL, NULL, NULL, 3),
(73, 'Senior_2020', 'Jeevathas Dalshika', 'Senior Vice Secretary', 'Irrigation Engineer,<br>Office of Director of Irrigation,<br>Trincomalee.', 'assets/img/trainers/2020 21/dalshika.jpeg', NULL, NULL, NULL, NULL, 4),
(74, 'Senior_2020', 'Saravanapavan Sanjith', 'Treasurer', 'Site Engineer,<br>New Dawn Marketing and Engineering (pvt.) Ltd.<br>Batticaloa', 'assets/img/trainers/2020 21/snajith.jpeg', NULL, NULL, NULL, NULL, 5),
(75, 'Junior_2020', 'Sivanathan Merujan', 'Junior President', 'Final year Undergraduate,<br>Department of Electrical and Electronic Engineering,<br>University of Jaffna.', 'assets/img/trainers/2020 21/merujan1.jpg', NULL, NULL, NULL, NULL, 1),
(76, 'Junior_2020', 'Tharmaseelan Vishagarabavan', 'Junior Vice President', 'Undergraduate,<br>Faculty of Medicine,<br>University of Peradeniya, Sri Lanka.', 'assets/img/trainers/2020 21/vishagarabavan.jpeg', NULL, NULL, NULL, NULL, 2),
(77, 'Junior_2020', 'Soundararajah Kophiny', 'Junior Secretary', 'Undergraduate,<br>Faculty of Health Care Sciences,<br>Eastern University, Sri Lanka.', 'assets/img/trainers/2020 21/kophiny.jpg', NULL, NULL, NULL, NULL, 3),
(78, 'Junior_2020', 'Sayalolibavan Pravarsine', 'Junior Vice Secretary', 'Final year Undergraduate,<br>Department of Computer Engineering,<br>University of Jaffna.', 'assets/img/trainers/2020 21/pravarsine3.jpg', NULL, NULL, NULL, NULL, 4),
(79, 'Junior_2020', 'Pathmanathan Whyshnavi', 'Junior Treasurer', 'Final year Undergraduate,<br>Department of Electrical and Electronic Engineering,<br>University of Jaffna.', 'assets/img/trainers/2020 21/whyyshnavi.jpeg', NULL, NULL, NULL, NULL, 5),
(80, 'Senior_2021', 'Sayalolibavan Vithurshan', 'Senior President', 'Regional Engineer - Radio Network Planning & Optimization<br>at SLT Mobitel', 'assets/img/trainers/2021 22/vithuna.jpg', NULL, NULL, NULL, NULL, 1),
(81, 'Senior_2021', 'Uthayakumaran Neshaprasanth', 'Senior Secretary', 'Undergraduate,<br>Faculty of Health Care Sciences,<br>Eastern University, Sri Lanka.', 'assets/img/trainers/2021 22/nesha.jpg', NULL, NULL, NULL, NULL, 2),
(82, 'Senior_2021', 'Ravindran Javahar', 'Senior Treasurer', 'Facility Engineer,<br> Brandix Essentials,<br> Batticaloa.', 'assets/img/trainers/2021 22/java.jpg', NULL, NULL, NULL, NULL, 3),
(83, 'Junior_2021', 'Ravindran Nithusan', 'Junior President', 'Undergraduate,<br>Faculty of Medicine,<br>University of Kelaniya, Sri Lanka.', 'assets/img/trainers/2021 22/nithuna.jpg', NULL, NULL, NULL, NULL, 1),
(84, 'Junior_2021', 'Sivashanmuganathan Dinooshan', 'Junior Vice President', 'Undergraduate,<br>Department of Electrical and Electronics Engineering,<br>University of Jaffna, Sri Lanka.', 'assets/img/trainers/2021 22/dino.jpg', NULL, NULL, NULL, NULL, 2),
(85, 'Junior_2021', 'Stephanie Sanchya Rajendran', 'Junior Secretary', 'Undergraduate,<br>Faculty of Health Care Sciences,<br>Eastern University, Sri Lanka.', 'assets/img/trainers/2021 22/sanch.jpg', NULL, NULL, NULL, NULL, 3),
(86, 'Junior_2021', 'Venijaa Sritharan', 'Junior Vice Secretary', 'Undergraduate,<br>Faculty of Health Care Sciences,<br>Eastern University, Sri Lanka.', 'assets/img/trainers/2021 22/venijaa.jpg', NULL, NULL, NULL, NULL, 4),
(87, 'Junior_2021', 'Arumaithurai Sanjith', 'Junior Treasurer', 'Undergraduate,<br>Faculty of Engineering,<br>University of Ruhunu, Sri Lanka.', 'assets/img/trainers/2021 22/sanjith.jpg', NULL, NULL, NULL, NULL, 5),
(88, 'Junior_2021', 'Narayanapillai Ananthasagaran', 'Editor', 'Undergraduate,<br>Faculty of Engineering,<br>University of Peradeniya, Sri Lanka.', 'assets/img/trainers/2021 22/anantha.jpg', NULL, NULL, NULL, NULL, 6),
(89, 'Senior_2022', 'Eng. S. Vithurshan', 'Senior President', 'Regional Engineer - Radio Network Planning & Optimization<br>at SLT Mobitel', 'assets/img/trainers/vithuna.jpg', NULL, NULL, NULL, NULL, 1),
(90, 'Senior_2022', 'R. Rugshanaa', 'Senior Vice President', 'Final year Undergraduate,<br>Faculty Of Medicine,<br>University Of Kelaniya', 'assets/img/trainers/rukshana.jpg', NULL, NULL, NULL, NULL, 2),
(91, 'Senior_2022', 'Eng. P. Justin Kishok', 'Senior Secretary', 'Instructor,<br>Department of Civil and Environmental Engineering,<br>University of Ruhuna.', 'assets/img/trainers/kishookna.jpg', NULL, NULL, NULL, NULL, 3),
(92, 'Senior_2022', 'Eng. T. Rebecca Jeny', 'Senior Treasurer', 'Software Engineer (Specialized in AI),<br>Emojot (Pvt) Ltd.', 'assets/img/trainers/jeni.jpg', NULL, NULL, NULL, NULL, 4),
(93, 'Junior_2022', 'Imyavan', 'Junior President', 'Undergraduate,<br>Faculty of Science,<br>University of Colombo.', 'assets/img/trainers/imy.jpg', NULL, NULL, NULL, NULL, 1),
(94, 'Junior_2022', 'Subothanan', 'Junior Vice President', 'Undergraduate,<br>Faculty of Medicine,<br>University of Peradeniya.', 'assets/img/trainers/subo.jpg', NULL, NULL, NULL, NULL, 2),
(95, 'Junior_2022', 'Sheymughe', 'Junior Secretary', 'Undergraduate,<br>Faculty of Engineering,<br>University of Sri Jayawardhanapura.', 'assets/img/trainers/sheymughe.jpeg', NULL, NULL, NULL, NULL, 3),
(96, 'Junior_2022', 'Roshan', 'Junior Treasurer', 'Undergraduate,<br>Faculty of Engineering,<br>University of Ruhunu.', 'assets/img/trainers/roshan1.jpg', NULL, NULL, NULL, NULL, 4),
(97, 'Junior_2022', 'Jefferson', 'Editor', 'Undergraduate,<br>Faculty of Engineering,<br>University of Jaffna.', 'assets/img/trainers/jeffy.jpeg', NULL, NULL, NULL, NULL, 5),
(98, 'Junior_2022', 'Kaviseyan', 'Event Coordinator', 'Undergraduate,<br>Faculty of Medicine,<br>University of Jaffna.', 'assets/img/trainers/kavibro.jpg', NULL, NULL, NULL, NULL, 6),
(99, 'Junior_2022', 'Sezhnu', 'Event Coordinator', 'Undergraduate,<br>Faculty of Medicine,<br>University of Colombo.', 'assets/img/trainers/sezhnu.jpeg', NULL, NULL, NULL, NULL, 7),
(100, 'Junior_2022', 'Subeetshan', 'Event Coordinator', 'Undergraduate,<br>Faculty of Engineering,<br>University of Moratuwa.', 'assets/img/trainers/subrr.jpeg', NULL, NULL, NULL, NULL, 8),
(101, 'Junior_2022', 'Abisheka', 'Event Coordinator', 'Undergraduate,<br>Faculty of Medicine,<br>University of Colombo.', 'assets/img/trainers/abisheka.jpeg', NULL, NULL, NULL, NULL, 9),
(102, 'Junior_2022', 'Ahanya', 'Event Coordinator', 'Undergraduate,<br>Faculty of Medicine,<br>University of Sri Jayawardhanapura.', 'assets/img/trainers/ahanya.jpeg', NULL, NULL, NULL, NULL, 10),
(103, 'Senior_2023', 'Eng. M. Sajeevan', 'Senior President', 'Lecturer/Civil Engineer,<br/>Department of Civil Engineering<br/>University of Jaffna', 'assets/img/trainers/2023 24/sajeevan1.jpeg', '', '', '', '', 1),
(104, 'Senior_2023', 'Eng. N. Sarvankigan', 'Senior Vice President', 'Academic Instructor,<br/>Department of Electrical and Telecommunication Engineering,<br/>South Eastern University, Sri Lanka', 'assets/img/trainers/2023 24/sarva.jpeg', '', '', '', '', 2),
(105, 'Senior_2023', 'Dr. R. Henola', 'Senior Secretary', 'Intern Medical officer<br>Teaching Hospital, Badulla', 'assets/img/trainers/2023 24/henola1.jpeg', '', '', '', '', 3),
(106, 'Senior_2023', 'Eng. S. Sampavi', 'Senior Vice Secretary', 'Academic Instructor<br>Department of Electrical and Telecommunication Engineering<br/>South Eastern University.', 'assets/img/trainers/2023 24/sampu.jpeg', '', '', '', '', 4),
(107, 'Senior_2023', 'M. Priyankari', 'Senior Treasurer', 'Pre Intern Doctor,<br>University of Sri Jayewardenepura.', 'assets/img/trainers/2023 24/priyankari.jpeg', '', '', '', '', 5),
(108, 'Junior_2023', 'Nethujan', 'Junior President', 'Undergraduate, <br/>Faculty of Medicine,<br/>University of Colombo.', 'assets/img/trainers/2023 24/nethujanp.jpeg', '', '', '', '', 1),
(109, 'Junior_2023', 'Viashan Dhevathas', 'Junior Vice President', 'Undergraduate,<br>Faculty of Engineering,<br>University of Ruhuna.', 'assets/img/trainers/2023 24/viashan.jpg', 'https://x.com/', '', 'https://www.instagram.com/', '', 2),
(110, 'Junior_2023', 'Rammiyasagari', 'Junior Secretary', 'Undergraduate,<br>Faculty of Medicine,<br>University of Kelaniya.', 'assets/img/trainers/2023 24/ramya.jpeg', 'https://x.com/', '', 'https://www.instagram.com/', '', 3),
(111, 'Junior_2023', 'Thagshana Narendiran', 'Junior Vice Secretary', 'Undergraduate,<br>Faculty of Engineering,<br>University of Ruhuna.', 'assets/img/trainers/2023 24/thahsganap.jpeg', 'https://x.com/', '', 'https://www.instagram.com/', '', 4),
(112, 'Junior_2023', 'Kathirgamaththamby Vinmathy', 'Junior Treasurer', 'Undergraduate,<br>Faculty of Engineering,<br>University of Jaffna.', 'assets/img/trainers/2023 24/vinmathy.jpg', 'https://x.com/', '', 'https://www.instagram.com/', '', 5),
(113, 'Junior_2023', 'Joash Jeshurun', 'Web Developer', 'Ai Undergraduate,<br>Faculty of Information Technology,<br>University of Moratuwa.', 'assets/img/trainers/2023 24/joash1.jpg', '', '', 'https://www.instagram.com/alfredjoejr/', '', 6),
(114, 'Junior_2023', 'Inpamohan Kaarky', 'Editor', 'Undergraduate,<br>Faculty of Engineering,<br>University of Ruhuna.', 'assets/img/trainers/2023 24/kaarky.jpg', 'https://x.com/kaarkyi?s=21', 'https://www.facebook.com/share/1Apxzv62kk/?mibextid=wwXIfr', 'https://www.instagram.com/im.kaarky?igsh=NTM4ajg1ZmhnMjZq&utm_source=qr', 'https://www.linkedin.com/in/kaarky-inpamohan-9a33b52a2?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app', 7),
(115, 'Junior_2023', 'Diloshan Premkumar', 'Editor', 'Undergraduate,<br>Faculty of Medicine,<br>University of Peradeniya.', 'assets/img/trainers/2023 24/diloshan.jpg', 'https://x.com/', '', 'https://www.instagram.com/', '', 8),
(116, 'Junior_2023', 'Nithusha Suresh', 'Committee member', 'Undergraduate,<br>Faculty of Engineering,<br>University of Ruhuna.', 'assets/img/trainers/2023 24/nithusha.jpg', '', '', '', '', 9),
(117, 'Junior_2023', 'Aeroshika Thadchaneswaramoorthy', 'Committee member', 'Undergraduate,<br>Faculty of Engineering,<br>University of Sri Jayewardenepura.', 'assets/img/trainers/2023 24/aeroshika.jpg', '', '', '', '', 10),
(118, 'Junior_2023', 'Kimathire Karunaharan', 'Committee member', 'Undergraduate,<br>Faculty of Medicine,<br>University of Moratuwa.', 'assets/img/trainers/2023 24/kimathirie1.jpg', '', '', '', '', 11),
(119, 'Junior_2023', 'Rajalingam Rohanabawan', 'Committee member', 'Undergraduate,<br>Faculty of Medicine,<br>University of Jaffna.', 'assets/img/trainers/2023 24/bawan.jpeg', '', '', '', '', 12);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `member_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dob` date NOT NULL,
  `wano` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `memType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_paid` tinyint(1) DEFAULT '0',
  `university` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `examYear` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `reset_token_hash` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL,
  `account_activation_hash` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profile_image_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DocPrivileages` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `member_id`, `name`, `email`, `fullName`, `sex`, `dob`, `wano`, `designation`, `nic`, `address`, `memType`, `is_paid`, `university`, `course`, `shy`, `examYear`, `password_hash`, `reset_token_hash`, `reset_token_expires_at`, `account_activation_hash`, `is_deleted`, `created_at`, `updated_at`, `profile_image_path`, `DocPrivileages`) VALUES
(32, 'EM25001', 'Jeyakulendran', 'jeffersonben369@gmail.com', 'Benjamin', 'Male', '2025-05-08', '4563259862', 'dcsdcscdc', '1546236875', 'Govinton Road', 'Graduate', 0, 'University of Kelaniya', 'scdscs', '1', '2025', '$2y$10$x8HvbLoDmFH7kjv77EWqJe/cykJ28lq6Qe0mxLCdmBUpoPTU30Rb6', '3049a822b23d375ce4c81e3ec4bc3f3baca1e0b5779cc395e05e8cb51beb557b', '2025-11-15 13:14:37', 'a630c0e8ff86e5e5826de9013ce181f8fc00d768487e077ee3193be1bbe26796', 0, '2025-05-05 06:47:39', '2026-04-25 19:18:55', NULL, 0),
(36, 'EM22002', 'Jefferson ', 'jeffydev@proton.me', 'Jeyakulendran Jefferson Benjamin ', 'Male', '2003-06-17', '0772690960', 'Bsc Eng (Reading)', '200316910135', 'No:27A,Govinton Road,Batticaloa ', 'Undergraduate', 0, 'University of Jaffna', 'Engineering ', '', '2022', '$2y$10$lgJTe0bB/7FkSY1RxBl9OuP54rQuj1iKsuLRNuR462ACWuqsFpA46', NULL, NULL, NULL, 0, '2025-05-25 05:13:58', '2026-04-25 19:18:55', 'https://res.cloudinary.com/dzzqliyfa/image/upload/v1763210891/eia_profiles/user_36.png', 0),
(40, 'EM22003', 'Benja', 'kingjoseph1645@gmail.com', 'Hsjhdhnd', 'Male', '2025-05-16', '6258031645', 'Hjnnkk', '1234567890', 'Hushhhs', 'Graduate', 0, 'University of Ruhuna', 'Hjjnjj', '', '2022', '$2y$10$m9lEol7Isc5EPaMqTTCx5uRHR/Iei4mnsZkOo.vKLbj1lMemCUiLW', NULL, NULL, NULL, 0, '2025-05-25 10:31:13', '2026-04-25 19:18:55', NULL, 0),
(41, 'EM24002', 'Pavan Gowripalan', 'pavan.gowripalan@gmail.com', 'Pavan Gowripalan', 'Male', '2005-04-29', '0706678795', 'Undergradute', '200512002355', 'No 78. Sarvodhaya Road, Sinna Urani, Batticaloa', 'Undergraduate', 0, 'University of Jaffna', 'Engineering', '', '2024', '$2y$10$mJ9abFc0M1U6qGnT93pMBeJ/wjY3p3GtNC7zf6x5/RZofx/4UShG.', NULL, NULL, NULL, 0, '2025-05-28 16:36:53', '2026-04-25 19:18:55', NULL, 0),
(42, 'EM24003', 'S.Madumitha ', 'mathusunther66@gmail.com', 'Madumitha Suntharalingam', 'Female', '2003-06-06', '0754684452', 'Medical student', '200365810400', '47/2, 4thCross,Thiruchenthoor, Kallady, Batticaloa', 'Pre-University', 0, 'Eastern University', 'Medicine ', '', '2024', '$2y$10$GPDAkPxLfTaPwvEbvS4hMOjRrOD1OOFIyRevWpWANMGiVnYg.uZjS', NULL, NULL, NULL, 0, '2025-05-28 16:44:51', '2026-04-25 19:18:55', NULL, 0),
(43, 'EM21001', 'Dinooshan ', 'chakob777@gmail.com', 'Dinooshan Sivashanmuganathan', 'Male', '2001-08-25', '0706666151', 'Student', '200123800157', 'No 98, Central Road, Batticaloa', 'Undergraduate', 0, 'University of Jaffna', 'Engineering', '', '2021', '$2y$10$BAhgQ6lt4EBTyCGRJLbUIu48XCH71Zf2AqyFA7QZHNuDI3IRfYtqm', 'd2d28a03a123733f2258ad057eee93c69e983432c8185943fed0740328485c86', '2026-07-20 12:14:59', NULL, 0, '2025-05-28 16:45:45', '2026-08-11 08:26:03', 'https://res.cloudinary.com/dzzqliyfa/image/upload/v1786436762/eia_profiles/user_43.png', 0),
(44, 'EM20001', 'Whyshnavi', 'whyshnavi01@gmail.com', 'Pathmanathan', 'Female', '2001-05-08', '0767677434', 'Undergraduate ', '200162901124', '127/13, Varnakulasingam road,Kallady, Batticaloa', 'Undergraduate', 0, 'University of Jaffna', 'Engineering ', '', '2020', '$2y$10$d/FZhbMe9sey1LVNdNPceOFfdJ0AulwlDPQfDPUnEJagksv7H8oom', NULL, NULL, NULL, 0, '2025-05-28 17:02:01', '2026-04-25 19:18:55', NULL, 0),
(45, 'EM24004', 'Abhiram ', 'abhiramsasinanthan@gmail.com', 'Sasinanthan Abhiram', 'Male', '2005-11-01', '0754974326', '-', '200530601961', 'No. 35 Natpiddimunai road, Kalmunai ', 'Undergraduate', 0, 'University of Moratuwa', 'Q. S', '', '2024', '$2y$10$vWB/iJWbcsLlu/lrYbrBK.pfNDA3VlByjSEzmLl6z5.C3U40TqXgC', NULL, NULL, NULL, 0, '2025-05-28 17:13:37', '2026-04-25 19:18:55', 'https://res.cloudinary.com/dzzqliyfa/image/upload/v1763431880/eia_profiles/user_45.png', 0),
(46, 'EM19001', 'V. Dineshka', 'dineshkavarnakulasingam@gmail.com', 'Varnakulasingam Dineshka ', 'Female', '1999-03-02', '0759338141', 'Medical Student ', '995620804V', '43/1, Trinco Road, Batticaloa ', 'Undergraduate', 0, 'University of Jaffna', 'Medicine', '', '2019', '$2y$10$dM6CxXAzsDOGn.A0qHCROORnNKgKE4T/UNf/oHaS8KmS9jKY1dobi', NULL, NULL, NULL, 0, '2025-05-28 18:05:28', '2026-04-25 19:18:55', NULL, 0),
(47, 'EM24005', 'Kiruthangnan ', 'slkiru2005@gmail.com', 'Nagendran Kiruthangnan ', 'Male', '2005-06-25', '0740807413', 'Member', '200517701155', 'Beach road, Kaluwanchikudy ', 'Pre-University', 0, 'University of Colombo', 'Medicine ', '', '2024', '$2y$10$2aR6gLd/X.qrQW5aVH9cOuiUPS2sBQY7i7DUmV4sr/O1ZWgac2FH.', NULL, NULL, NULL, 0, '2025-05-29 05:10:10', '2026-04-25 19:18:55', NULL, 0),
(48, 'EM14001', 'Ravichandren Logithan', 'logithan0@gmail.com', 'Ravichandren Logithan', 'Male', '1993-03-26', '0712121413', 'Temporary Instructor ', '930861332V', 'No 45. Post office Road, Navithanveli, Kalmunai', 'Graduate', 0, 'University of Ruhuna', 'Engineering', '', '2014', '$2y$10$HgB4yyShIkdU04COwerojeU2RFCTca5zMz7Gm.xok7Hc4f6MY4qfm', NULL, NULL, NULL, 0, '2025-08-28 04:03:18', '2026-04-25 19:18:55', NULL, 0),
(49, 'EM07001', 'Wekumburegedara', 'wgsujith.qs@gmail.com', 'Sujith Kumara', 'Male', '1987-12-21', '94761166633', 'Quantity Surveyor', '198735603214', '90/14 Chaithya Road thelangapatha', 'Graduate', 0, 'University of Moratuwa', 'Quantity Surveying', '', '2007', '$2y$10$Oi78NImeD6oRBE.rMklqeuWA4.bKBmBOneql47.g3DRHD1jtWYVA2', NULL, NULL, NULL, 0, '2025-09-26 12:04:08', '2026-04-25 19:18:55', NULL, 0),
(50, 'EM24006', 'Kavuchikan ', 'kavuchi24@gmail.com', 'Kavuchikan Nanthakumar', 'Male', '2005-12-15', '0742402783', 'editor', '200535001520', '35/2, Gnanasooriyam square, Batticaloa', 'Undergraduate', 0, 'University of Colombo', 'medicine', '', '2024', '$2y$10$u5yTYtwB1A/nX6uKzSwArOicSYIf6JynSLKV4s3YDOaz5xxzARr3W', NULL, NULL, NULL, 0, '2025-10-04 05:34:18', '2026-04-25 19:18:55', NULL, 0),
(51, 'EM13001', 'Janarth', 'janartha@esn.ac.lk', 'Asoharasa Janarth', 'Male', '1994-11-09', '0771396648', 'Lecturer ', '942552564v', '10/12a, Varnakulasingam Road, kallady, Batticaloa.', 'Graduate', 0, 'University of Jaffna', 'B.Sc. (Hons) in Engineering', '', '2013', '$2y$10$0Q.lfK91Zm09T9l4.FooZeUlagaM0zIOyhmpPMUBvV.KeO6hSTxKC', NULL, NULL, NULL, 0, '2025-11-10 09:26:13', '2026-04-25 19:18:55', NULL, 0),
(52, 'EM17001', 'Sajeevan', 'sajivan1997@gmail.com', 'Mohan Sajeevan', 'Male', '1997-12-28', '+94768589058', 'Lecturer (On Contract)', '973630571V', '5A, Mahindarama Road, Rathmalana', 'Graduate', 0, 'University of Jaffna', 'Bachelor of Science Honest of Engineering', '', '2017', '$2y$10$CnXYb9MCvUNCstppvpZZ0ukU8vGA.vwlfqFTNUOZrQD8AJlKzp6Ke', NULL, NULL, NULL, 0, '2025-11-10 11:58:59', '2026-05-06 06:58:49', 'https://res.cloudinary.com/dzzqliyfa/image/upload/v1778050728/eia_profiles/user_52.png', 0),
(53, 'EM23002', 'Alfred Joe Jr', 'joashjeshurun9@protonmail.ch', 'Alfred Jeevaranjan', 'Male', '2004-11-22', '0777778984', 'Undergraduate', '0000000000', 'batticaloa', 'Undergraduate', 0, 'University of Moratuwa', 'Ai', '', '2023', '$2y$10$C6XUfPDcWLPAHmXDM74ZTepBMeB96ThG7QSV6M2TsA1kvTa.9pgkC', NULL, NULL, NULL, 0, '2025-11-14 18:41:23', '2026-04-25 19:18:55', 'https://res.cloudinary.com/dzzqliyfa/image/upload/v1763402232/eia_profiles/user_53.png', 1),
(56, 'EM21003', 'test', 'milliapme@yahoo.com', 'test', 'Male', '0001-11-11', '1234561726', 'ccc', '200432700877', '212', 'Graduate', 0, 'University of Peradeniya', 'ccc', '', '2021', '$2y$10$68yCNp.CW5wzoZWj9xAn1eRmouGErr1qZoEmaV55M6HhlkD7lFMey', NULL, NULL, '6538b295a6f09a4c5daef536904444a759189b1ded9649d04fde2da714971ec8', 0, '2025-11-16 15:32:37', '2026-04-25 19:18:55', NULL, 0),
(58, 'EM20002', 'Hshs', 'moontontlol321@gmail.com', 'Hshs', 'Female', '2000-01-14', '1212121212', 'Gaha', '6789012345', 'Gaha', 'Undergraduate', 0, 'University of Ruhuna', 'Hshs', '', '2020', '$2y$10$kL/hXLMY42i2/cwigxMcbep1Axt0l903mDxIFOBcGZKZ0EkIJ9MLm', NULL, NULL, NULL, 0, '2026-01-13 20:30:29', '2026-04-25 19:18:55', 'https://res.cloudinary.com/dzzqliyfa/image/upload/v1768336360/eia_profiles/user_58.png', 0),
(59, 'EM22004', 'R. Subothanan', 'subothanan2003@gmail.com', 'Ravendran Subothanan ', 'Male', '2003-01-07', '0763525081', 'Undergraduate ', '200300700661', 'NO 3 , Bundings lane ,Batticaloa', 'Undergraduate', 0, 'University of Peradeniya', 'Medicine', '', '2022', '$2y$10$.dkI.EFLflP2wJzj0fQfTuR/AF1AhveF2RhxxU6nCUXPbZ7OaQ7fa', NULL, NULL, NULL, 0, '2026-01-27 08:14:48', '2026-04-25 19:18:55', NULL, 0),
(60, 'EM20003', 'Merujan', 'Sivameru18@gmail.com', 'Merujan Sivanathan', 'Male', '2000-03-18', '0752146650', 'Electrical and Electronic Engineer ', '200007803345', 'No.33, 2nd Bailey road, Batticaloa', 'Undergraduate', 0, 'University of Jaffna', 'Engineering', '', '2020', '$2y$10$3wzrO3tpvdmf02vRhVLGmeHthHP1Tw8JPnlLrU/1YAxkdbuxAYD7G', NULL, NULL, NULL, 0, '2026-04-20 18:28:06', '2026-04-25 19:18:55', NULL, 0),
(81, 'EM23003', 'Shyshake', 'Shyshake24@gmail.com', 'Pirathapan Shyshake', 'Male', '2004-09-10', '0712113574', 'Student', '200425400337', '23A,Boundary Road South', 'Undergraduate', 0, 'University of Moratuwa', 'Engineering', '', '2023', '$2y$10$2mn2ZNmaBljFSFQHQJmXkuIP8I2emczbXXYQaPFrqOMpTgUdWTgWS', NULL, NULL, NULL, 0, '2026-08-09 18:55:13', '2026-08-09 18:55:39', NULL, 0),
(82, 'EM22005', 'Haris', 'sahayarajahharis@gmail.com', 'Sahayarajah Haris ', 'Male', '2002-10-28', '0774900611', 'Students ', '200230200730', '54/12, 6th cross, Iruthayapuram-west, Batticaloa ', 'Undergraduate', 0, 'University of Jaffna', 'B.Sc.Engineering ', '', '2022', '$2y$10$AtScMexM4DK7MUlFxv3a/eiZOIZeNQbjifbCU90eF3BIOyfceDywC', NULL, NULL, NULL, 0, '2026-08-11 08:27:33', '2026-08-11 08:28:04', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `sent_emails`
--
ALTER TABLE `sent_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `site_images`
--
ALTER TABLE `site_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `image_key` (`image_key`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `reset_token_hash` (`reset_token_hash`),
  ADD UNIQUE KEY `member_id` (`member_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `sent_emails`
--
ALTER TABLE `sent_emails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_images`
--
ALTER TABLE `site_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `sent_emails`
--
ALTER TABLE `sent_emails`
  ADD CONSTRAINT `sent_emails_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `sent_emails_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
