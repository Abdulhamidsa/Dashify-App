-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2023 at 11:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dashify`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_email`, `admin_password`) VALUES
(1, 'dashify@admin.com', '123456789aA');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `partner_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_status` varchar(255) DEFAULT NULL,
  `order_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `partner_id`, `user_id`, `order_date`, `order_status`, `order_total`) VALUES
(1, 1, 20, '2023-09-09 00:09:11', 'pending', 193.19),
(2, 2, 31, '2023-02-11 21:36:36', 'pending', 439.33),
(3, 3, 16, '2023-09-28 20:12:00', 'pending', 3.39),
(4, 4, 9, '2023-09-22 03:10:05', 'complete', 798.28),
(5, 5, 4, '2023-11-15 12:21:51', 'pending', 761.28),
(6, 6, 34, '2023-02-07 05:52:42', 'complete', 632.87),
(7, 7, 4, '2023-11-20 18:51:18', 'pending', 444.22),
(8, 8, 21, '2023-12-09 05:34:24', 'pending', 72.58),
(9, 9, 11, '2023-08-30 08:48:22', 'complete', 369.66),
(10, 10, 18, '2023-05-18 01:24:35', 'complete', 631.43),
(11, 11, 29, '2023-01-15 15:22:04', 'pending', 147.63),
(12, 12, 15, '2023-11-28 01:52:40', 'pending', 788.29),
(13, 13, 25, '2023-10-25 03:54:06', 'complete', 534.05),
(14, 14, 3, '2023-11-19 10:18:00', 'complete', 334.19),
(15, 15, 12, '2023-06-08 22:39:50', 'pending', 601.85),
(16, 16, 7, '2023-04-24 07:47:54', 'pending', 415.62),
(17, 17, 33, '2023-03-06 02:18:53', 'pending', 508.74),
(18, 18, 10, '2023-11-11 00:17:05', 'complete', 75.95),
(19, 19, 2, '2023-02-22 04:58:55', 'pending', 844.00),
(20, 20, 15, '2023-10-12 08:17:48', 'pending', 790.31),
(21, 21, 21, '2023-07-27 00:35:33', 'pending', 605.48),
(22, 22, 35, '2023-02-13 23:58:42', 'pending', 234.70),
(23, 23, 21, '2023-04-03 10:41:59', 'pending', 962.34),
(24, 24, 8, '2023-07-13 15:36:08', 'pending', 157.27),
(25, 25, 18, '2023-03-22 19:24:18', 'complete', 782.35),
(26, 1, 28, '2023-10-30 03:29:45', 'pending', 935.07),
(27, 2, 8, '2023-02-19 02:27:30', 'pending', 441.30),
(28, 3, 1, '2023-01-23 13:54:22', 'pending', 899.85),
(29, 4, 18, '2023-10-13 22:30:56', 'complete', 33.40),
(30, 5, 8, '2023-05-18 02:52:20', 'complete', 897.11),
(31, 6, 9, '2023-12-03 21:01:05', 'pending', 269.95),
(32, 7, 30, '2023-06-11 12:16:53', 'pending', 317.70),
(33, 8, 4, '2023-01-18 16:49:14', 'complete', 249.87),
(34, 9, 34, '2023-07-22 00:20:45', 'pending', 151.00),
(35, 10, 28, '2023-12-04 13:48:08', 'pending', 944.19),
(36, 11, 33, '2023-07-29 07:17:40', 'pending', 913.34),
(37, 12, 10, '2023-10-24 09:18:06', 'pending', 811.60),
(38, 13, 21, '2023-11-22 09:32:37', 'pending', 177.84),
(39, 14, 18, '2023-03-06 14:34:37', 'pending', 569.10),
(40, 15, 18, '2023-03-19 02:27:00', 'pending', 649.11),
(41, 16, 1, '2023-02-12 14:44:39', 'pending', 704.99),
(42, 17, 10, '2023-08-06 02:37:11', 'pending', 338.15),
(43, 18, 9, '2023-12-17 04:54:47', 'complete', 274.73),
(44, 19, 27, '2023-02-23 10:35:55', 'complete', 819.78),
(45, 20, 2, '2023-01-24 16:11:31', 'pending', 392.26),
(46, 21, 14, '2023-12-11 06:44:17', 'complete', 52.44),
(47, 22, 12, '2023-01-09 01:18:10', 'pending', 393.10),
(48, 23, 4, '2023-08-05 02:55:02', 'complete', 439.74),
(49, 24, 31, '2023-05-20 15:41:56', 'pending', 442.48),
(50, 25, 7, '2023-07-02 05:46:49', 'pending', 661.29),
(51, 1, 13, '2023-06-22 11:42:17', 'pending', 140.31),
(52, 2, 23, '2023-12-13 23:33:27', 'complete', 624.94),
(53, 3, 23, '2023-02-14 04:41:59', 'pending', 318.42),
(54, 4, 7, '2023-06-14 03:48:22', 'pending', 891.22),
(55, 5, 11, '2023-05-16 11:33:18', 'pending', 536.26),
(56, 6, 26, '2023-05-26 09:41:46', 'pending', 829.52),
(57, 7, 31, '2023-04-22 17:44:13', 'complete', 203.37),
(58, 8, 8, '2023-06-20 04:40:29', 'complete', 281.35),
(59, 9, 16, '2023-04-04 10:18:24', 'pending', 717.32),
(60, 10, 9, '2023-12-15 11:18:52', 'complete', 653.86),
(61, 11, 33, '2023-02-09 14:18:57', 'complete', 771.92),
(62, 12, 20, '2023-10-05 06:57:13', 'complete', 336.30),
(63, 13, 20, '2023-03-22 07:08:36', 'complete', 403.69),
(64, 14, 6, '2023-11-06 11:13:27', 'pending', 780.62),
(65, 15, 27, '2023-05-21 13:00:55', 'complete', 236.53),
(66, 16, 16, '2023-08-07 05:03:17', 'pending', 175.85),
(67, 17, 30, '2023-07-12 03:47:01', 'complete', 878.02),
(68, 18, 23, '2023-10-02 15:11:43', 'complete', 242.76),
(69, 19, 19, '2023-09-09 07:49:21', 'complete', 585.41),
(70, 20, 12, '2023-09-19 01:06:26', 'complete', 28.05),
(71, 21, 9, '2023-02-11 10:14:36', 'pending', 122.41),
(72, 22, 5, '2023-01-30 02:01:38', 'complete', 983.75),
(73, 23, 30, '2023-07-20 18:00:01', 'pending', 474.09),
(74, 24, 35, '2023-07-28 12:33:07', 'pending', 404.01),
(75, 25, 14, '2023-03-04 05:19:31', 'complete', 994.02),
(76, 1, 6, '2023-11-06 03:02:49', 'complete', 775.68),
(77, 2, 23, '2023-12-02 16:56:50', 'pending', 124.54),
(78, 3, 5, '2023-04-02 10:06:10', 'pending', 995.75),
(79, 4, 17, '2023-03-25 03:36:27', 'pending', 726.00),
(80, 5, 26, '2023-08-12 19:35:41', 'complete', 664.50),
(81, 6, 29, '2023-10-24 22:57:10', 'pending', 174.42),
(82, 7, 5, '2023-01-29 08:00:08', 'pending', 211.06),
(83, 8, 1, '2023-07-06 09:24:02', 'pending', 631.10),
(84, 9, 4, '2023-01-25 20:34:02', 'pending', 812.94),
(85, 10, 8, '2023-10-05 09:27:56', 'pending', 228.13),
(86, 11, 33, '2023-12-15 20:09:43', 'pending', 341.09),
(87, 12, 1, '2023-06-02 02:18:13', 'complete', 288.46),
(88, 13, 14, '2023-04-21 14:57:59', 'pending', 10.69),
(89, 14, 2, '2023-06-04 09:14:21', 'complete', 60.93),
(90, 15, 3, '2023-10-14 11:43:06', 'pending', 1.05),
(91, 16, 14, '2023-04-19 04:12:21', 'complete', 816.96),
(92, 17, 22, '2023-06-29 20:21:40', 'pending', 366.45),
(93, 18, 32, '2023-04-08 01:41:39', 'pending', 696.20),
(94, 19, 16, '2023-11-11 12:03:26', 'complete', 926.72),
(95, 20, 7, '2023-07-11 15:05:07', 'pending', 122.43),
(96, 21, 10, '2023-05-21 19:50:55', 'pending', 199.14),
(97, 22, 35, '2023-11-15 12:12:48', 'complete', 524.80),
(98, 23, 8, '2023-07-28 01:27:45', 'complete', 12.73),
(99, 24, 15, '2023-11-29 12:14:10', 'complete', 19.78),
(100, 25, 1, '2023-06-06 18:58:25', 'complete', 448.36),
(101, 1, 16, '2023-12-18 15:15:22', 'complete', 897.60),
(102, 2, 19, '2023-10-14 01:21:50', 'complete', 289.04),
(103, 3, 16, '2023-12-09 09:01:40', 'complete', 486.35),
(104, 4, 29, '2023-12-09 16:24:36', 'complete', 112.34),
(105, 5, 23, '2023-08-11 16:29:35', 'complete', 486.30),
(106, 6, 26, '2023-09-20 02:48:09', 'complete', 279.06),
(107, 7, 7, '2023-07-21 06:18:18', 'pending', 941.12),
(108, 8, 15, '2023-01-13 15:31:55', 'pending', 677.19),
(109, 9, 21, '2023-06-11 04:57:48', 'pending', 791.28),
(110, 10, 32, '2023-08-28 16:59:50', 'complete', 111.55),
(111, 11, 4, '2023-10-31 16:11:04', 'complete', 143.54),
(112, 12, 29, '2023-10-29 01:22:03', 'complete', 671.47),
(113, 13, 30, '2023-03-27 04:49:44', 'pending', 958.08),
(114, 14, 28, '2023-03-23 04:03:38', 'pending', 479.06),
(115, 15, 12, '2023-02-03 13:56:11', 'pending', 691.69),
(116, 16, 2, '2023-07-11 18:45:47', 'pending', 23.89),
(117, 17, 33, '2023-11-13 21:01:17', 'complete', 820.58),
(118, 18, 11, '2023-06-29 10:59:58', 'pending', 694.28),
(119, 19, 33, '2023-11-12 22:23:52', 'pending', 656.48),
(120, 20, 16, '2023-01-13 20:23:02', 'pending', 812.78),
(121, 21, 34, '2023-08-02 15:00:50', 'pending', 278.14),
(122, 22, 21, '2023-03-05 08:51:36', 'pending', 703.54),
(123, 23, 12, '2023-10-17 16:57:29', 'complete', 728.70),
(124, 24, 22, '2023-10-28 09:19:18', 'pending', 409.90),
(125, 25, 28, '2023-03-03 18:24:36', 'complete', 177.07),
(126, 1, 35, '2023-08-02 18:22:17', 'complete', 489.62),
(127, 2, 15, '2023-04-07 02:07:36', 'pending', 882.19),
(128, 3, 11, '2023-07-31 18:08:52', 'pending', 325.53),
(129, 4, 33, '2023-05-01 19:55:31', 'pending', 372.45),
(130, 5, 25, '2023-02-19 02:38:11', 'pending', 418.02),
(131, 6, 18, '2023-03-27 10:52:53', 'complete', 928.60),
(132, 7, 32, '2023-08-04 07:00:35', 'complete', 664.46),
(133, 8, 18, '2023-09-29 16:28:25', 'complete', 343.33),
(134, 9, 29, '2023-01-21 22:44:18', 'pending', 821.72),
(135, 10, 7, '2023-05-05 14:50:28', 'pending', 904.24),
(136, 11, 11, '2023-12-02 02:25:10', 'complete', 840.48),
(137, 12, 18, '2023-09-04 07:46:50', 'pending', 152.49),
(138, 13, 3, '2023-02-02 05:22:16', 'complete', 947.84),
(139, 14, 35, '2023-04-15 21:25:20', 'complete', 85.36),
(140, 15, 16, '2023-08-28 18:01:43', 'complete', 309.27),
(141, 16, 26, '2023-06-15 12:42:24', 'pending', 657.87),
(142, 17, 23, '2023-03-25 07:14:50', 'complete', 448.77),
(143, 18, 5, '2023-06-01 20:56:13', 'pending', 831.07),
(144, 19, 19, '2023-09-25 20:21:41', 'complete', 946.42),
(145, 20, 4, '2023-01-05 16:28:24', 'complete', 674.55),
(146, 21, 19, '2023-02-21 05:30:47', 'pending', 544.88),
(147, 22, 20, '2023-01-08 16:28:30', 'complete', 431.77),
(148, 23, 1, '2023-08-03 08:03:33', 'complete', 761.71),
(149, 24, 16, '2023-09-04 01:39:17', 'complete', 528.73),
(150, 25, 10, '2023-11-26 12:33:32', 'pending', 149.96),
(151, 1, 23, '2023-01-07 11:25:58', 'pending', 940.14),
(152, 2, 32, '2023-08-15 06:49:27', 'complete', 828.14),
(153, 3, 11, '2023-03-17 14:18:19', 'complete', 60.76),
(154, 4, 12, '2023-04-18 00:08:51', 'complete', 774.61),
(155, 5, 30, '2023-04-10 16:56:12', 'pending', 223.72),
(156, 6, 16, '2023-12-09 01:45:32', 'pending', 70.75),
(157, 7, 2, '2023-04-15 18:30:24', 'complete', 78.51),
(158, 8, 33, '2023-01-20 00:14:34', 'pending', 242.69),
(159, 9, 6, '2023-04-07 02:12:53', 'complete', 165.83),
(160, 10, 29, '2023-09-27 20:41:15', 'pending', 178.09),
(161, 11, 12, '2023-03-08 06:07:03', 'complete', 77.57),
(162, 12, 34, '2023-03-22 22:17:55', 'pending', 530.35),
(163, 13, 35, '2023-11-19 16:34:47', 'pending', 983.83),
(164, 14, 24, '2023-09-28 14:30:51', 'pending', 596.52),
(165, 15, 15, '2023-04-13 13:52:13', 'complete', 620.20),
(166, 16, 35, '2023-05-19 11:18:13', 'pending', 54.29),
(167, 17, 30, '2023-01-12 06:46:21', 'complete', 807.50),
(168, 18, 28, '2023-01-27 23:46:52', 'pending', 303.97),
(169, 19, 18, '2023-04-23 19:48:16', 'pending', 580.46),
(170, 20, 3, '2023-09-17 01:28:34', 'pending', 547.44),
(171, 21, 20, '2023-08-30 10:44:19', 'complete', 906.25),
(172, 22, 11, '2023-01-23 00:57:44', 'pending', 250.03),
(173, 23, 10, '2023-07-02 15:29:51', 'complete', 680.74),
(174, 24, 26, '2023-12-03 01:33:41', 'pending', 944.21),
(175, 25, 21, '2023-07-23 18:19:41', 'complete', 125.82);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `order_id`, `product_id`) VALUES
(1, 19, 44),
(2, 14, 14),
(3, 5, 27),
(4, 7, 40),
(5, 16, 37),
(6, 24, 67),
(7, 4, 46),
(8, 18, 74),
(9, 9, 26),
(10, 15, 55),
(11, 12, 8),
(12, 20, 55),
(13, 3, 38),
(14, 10, 58),
(15, 25, 80),
(16, 1, 21),
(17, 8, 59),
(18, 21, 53),
(19, 23, 24),
(20, 13, 26),
(21, 11, 8),
(22, 2, 4),
(23, 17, 68),
(24, 6, 49),
(25, 22, 53),
(26, 28, 65),
(27, 41, 34),
(28, 19, 41),
(29, 45, 36),
(30, 14, 69),
(31, 5, 74),
(32, 7, 27),
(33, 33, 17),
(34, 48, 30),
(35, 16, 31),
(36, 50, 21),
(37, 24, 13),
(38, 27, 45),
(39, 30, 20),
(40, 4, 27),
(41, 31, 19),
(42, 43, 11),
(43, 18, 42),
(44, 37, 19),
(45, 42, 47),
(46, 9, 56),
(47, 15, 26),
(48, 47, 58),
(49, 46, 11),
(50, 12, 75),
(51, 20, 23),
(52, 3, 44),
(53, 10, 24),
(54, 25, 34),
(55, 29, 46),
(56, 39, 75),
(57, 40, 9),
(58, 1, 29),
(59, 8, 79),
(60, 21, 65),
(61, 23, 14),
(62, 38, 24),
(63, 13, 69),
(64, 44, 45),
(65, 26, 33),
(66, 35, 59),
(67, 11, 29),
(68, 32, 64),
(69, 2, 40),
(70, 49, 16),
(71, 17, 58),
(72, 36, 15),
(73, 6, 71),
(74, 34, 50),
(75, 22, 63),
(76, 28, 5),
(77, 41, 60),
(78, 83, 58),
(79, 87, 66),
(80, 100, 3),
(81, 19, 53),
(82, 45, 34),
(83, 89, 34),
(84, 14, 66),
(85, 90, 4),
(86, 5, 51),
(87, 7, 2),
(88, 33, 19),
(89, 48, 51),
(90, 84, 59),
(91, 72, 55),
(92, 78, 25),
(93, 82, 25),
(94, 64, 34),
(95, 76, 40),
(96, 16, 53),
(97, 50, 71),
(98, 54, 66),
(99, 95, 40),
(100, 24, 74),
(101, 27, 65),
(102, 30, 74),
(103, 58, 68),
(104, 85, 36),
(105, 98, 57),
(106, 4, 49),
(107, 31, 60),
(108, 43, 26),
(109, 60, 56),
(110, 71, 58),
(111, 18, 37),
(112, 37, 12),
(113, 42, 46),
(114, 96, 66),
(115, 9, 70),
(116, 55, 45),
(117, 15, 26),
(118, 47, 66),
(119, 70, 57),
(120, 51, 61),
(121, 46, 12),
(122, 75, 52),
(123, 88, 12),
(124, 91, 58),
(125, 12, 50),
(126, 20, 68),
(127, 99, 31),
(128, 3, 16),
(129, 59, 27),
(130, 66, 55),
(131, 94, 22),
(132, 79, 49),
(133, 10, 25),
(134, 25, 54),
(135, 29, 71),
(136, 39, 50),
(137, 40, 39),
(138, 69, 59),
(139, 1, 25),
(140, 62, 30),
(141, 63, 34),
(142, 8, 75),
(143, 21, 46),
(144, 23, 72),
(145, 38, 6),
(146, 92, 43),
(147, 52, 35),
(148, 53, 48),
(149, 68, 80),
(150, 77, 38),
(151, 13, 40),
(152, 56, 49),
(153, 80, 29),
(154, 44, 21),
(155, 65, 25),
(156, 26, 60),
(157, 35, 14),
(158, 11, 57),
(159, 81, 20),
(160, 32, 66),
(161, 67, 16),
(162, 73, 57),
(163, 2, 16),
(164, 49, 34),
(165, 57, 50),
(166, 93, 29),
(167, 17, 36),
(168, 36, 28),
(169, 61, 6),
(170, 86, 26),
(171, 6, 59),
(172, 34, 52),
(173, 22, 39),
(174, 74, 29),
(175, 97, 35),
(176, 28, 37),
(177, 41, 33),
(178, 83, 36),
(179, 87, 25),
(180, 100, 37),
(181, 148, 67),
(182, 19, 23),
(183, 45, 38),
(184, 89, 37),
(185, 116, 75),
(186, 157, 75),
(187, 14, 58),
(188, 90, 76),
(189, 138, 15),
(190, 170, 39),
(191, 5, 34),
(192, 7, 18),
(193, 33, 10),
(194, 48, 4),
(195, 84, 2),
(196, 111, 64),
(197, 145, 32),
(198, 72, 23),
(199, 78, 59),
(200, 82, 6),
(201, 143, 26),
(202, 64, 4),
(203, 76, 40),
(204, 159, 72),
(205, 16, 56),
(206, 50, 2),
(207, 54, 49),
(208, 95, 10),
(209, 107, 55),
(210, 135, 57),
(211, 24, 7),
(212, 27, 52),
(213, 30, 60),
(214, 58, 63),
(215, 85, 32),
(216, 98, 65),
(217, 4, 31),
(218, 31, 47),
(219, 43, 53),
(220, 60, 64),
(221, 71, 67),
(222, 18, 19),
(223, 37, 41),
(224, 42, 75),
(225, 96, 51),
(226, 150, 36),
(227, 173, 2),
(228, 9, 40),
(229, 55, 39),
(230, 118, 31),
(231, 128, 12),
(232, 136, 69),
(233, 153, 14),
(234, 172, 2),
(235, 15, 53),
(236, 47, 64),
(237, 70, 13),
(238, 115, 4),
(239, 123, 49),
(240, 154, 31),
(241, 161, 7),
(242, 51, 12),
(243, 46, 44),
(244, 75, 67),
(245, 88, 68),
(246, 91, 33),
(247, 12, 37),
(248, 20, 74),
(249, 99, 73),
(250, 108, 13),
(251, 127, 37),
(252, 165, 3),
(253, 3, 3),
(254, 59, 2),
(255, 66, 55),
(256, 94, 59),
(257, 101, 9),
(258, 103, 32),
(259, 120, 22),
(260, 140, 77),
(261, 149, 20),
(262, 156, 32),
(263, 79, 36),
(264, 10, 60),
(265, 25, 59),
(266, 29, 25),
(267, 39, 27),
(268, 40, 68),
(269, 131, 27),
(270, 133, 56),
(271, 137, 37),
(272, 169, 53),
(273, 69, 22),
(274, 102, 25),
(275, 144, 7),
(276, 146, 71),
(277, 1, 5),
(278, 62, 39),
(279, 63, 48),
(280, 147, 46),
(281, 171, 47),
(282, 8, 28),
(283, 21, 52),
(284, 23, 15),
(285, 38, 77),
(286, 109, 4),
(287, 122, 4),
(288, 175, 39),
(289, 92, 63),
(290, 124, 52),
(291, 52, 28),
(292, 53, 67),
(293, 68, 51),
(294, 77, 36),
(295, 105, 14),
(296, 142, 3),
(297, 151, 47),
(298, 164, 66),
(299, 13, 20),
(300, 130, 9),
(301, 56, 42),
(302, 80, 3),
(303, 106, 6),
(304, 141, 49),
(305, 174, 54),
(306, 44, 24),
(307, 65, 64),
(308, 26, 71),
(309, 35, 61),
(310, 114, 58),
(311, 125, 1),
(312, 168, 56),
(313, 11, 18),
(314, 81, 69),
(315, 104, 18),
(316, 112, 21),
(317, 134, 39),
(318, 160, 45),
(319, 32, 33),
(320, 67, 25),
(321, 73, 34),
(322, 113, 22),
(323, 155, 18),
(324, 167, 80),
(325, 2, 79),
(326, 49, 6),
(327, 57, 54),
(328, 93, 14),
(329, 110, 60),
(330, 132, 21),
(331, 152, 14),
(332, 17, 74),
(333, 36, 74),
(334, 61, 20),
(335, 86, 38),
(336, 117, 12),
(337, 119, 13),
(338, 129, 18),
(339, 158, 71),
(340, 6, 50),
(341, 34, 77),
(342, 121, 20),
(343, 162, 6),
(344, 22, 73),
(345, 74, 51),
(346, 97, 75),
(347, 126, 44),
(348, 139, 14),
(349, 163, 62),
(350, 166, 76);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_items_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `partner_id` bigint(20) UNSIGNED NOT NULL,
  `partner_name` varchar(255) NOT NULL,
  `partner_email` varchar(255) NOT NULL,
  `partner_password` varchar(255) NOT NULL,
  `partner_mobile` varchar(20) NOT NULL,
  `partner_rating` tinyint(4) NOT NULL,
  `partner_registration_number` varchar(50) NOT NULL,
  `partner_blocked` tinyint(4) NOT NULL,
  `partner_created_at` int(20) NOT NULL,
  `partner_updated_at` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`partner_id`, `partner_name`, `partner_email`, `partner_password`, `partner_mobile`, `partner_rating`, `partner_registration_number`, `partner_blocked`, `partner_created_at`, `partner_updated_at`) VALUES
(1, 'Vandervort Ltd', 'kling.enid@example.com', '$2y$10$Rhfq/VGPW0kHm34PG70WAOh8Ty4q6FcTTyJN1UEflDZVEDrqQb0jW', '95863800', 2, '506108911', 0, 2018, 1703057346),
(2, 'Padberg, Brekke and Kunze', 'abigale78@example.net', '$2y$10$f7CTNdsvND8/VcL4.GDTuehQo.rchomVUsDrt31wNaq4Ph8Ib/Rku', '58016636', 3, '551603124', 0, 2019, 2019),
(3, 'Schinner', 'webster.mclaughlin@example.com', '$2y$10$eYEd8rhfkaCUycSsgp5Mb.j/lxE4XgKajXld.ZxDg7eQauNBYmMM2', '89878255', 2, '951702855', 0, 2016, 1703026528),
(4, 'Harber, Raynor and Fisher', 'lyric36@example.org', '$2y$10$iaN9wXY6rtArnYpQs0A/suLtx4ghyQXyWYWIJg2ftPe3IFRlni6J6', '39401710', 4, '601641504', 0, 2015, 2014),
(5, 'Bosco, Welch and Gaylord', 'frath@example.com', '$2y$10$eZhB1ISHxmu0UjCTb5p.ueHIrLVBKThPUGy05Pht3uFNL.43c9lDS', '26538928', 2, '239024746', 0, 2017, 2021),
(6, 'Carroll, Hodkiewicz and Jacobs', 'stevie62@example.org', '$2y$10$qJJsMc3HsqiwHvEZ/5SS9uWIpOQ66WReL/HZvk9ifXMGgTUKMAIke', '94004441', 4, '714090198', 1, 2020, 2016),
(7, 'White-Cormier', 'mosciski.gladyce@example.org', '$2y$10$ygyhNe7JQpuisWhCE/2RT.L4V/p9ozBjcEW/a2DYBhJsK1vF0UK0m', '38263585', 1, '133528507', 1, 2014, 2020),
(8, 'Lebsack, Shanahan and Russel', 'darryl.sporer@example.org', '$2y$10$6ehlHVpHxXGfVvuechnSBO0gIxYsVJvWCk6VksPdv3ptp2ZS0TLe.', '84279288', 4, '200102645', 0, 2019, 2014),
(9, 'WunschGrant', 'rborer@example.org', '$2y$10$k.b4Nt2sVGacOy8yx9YTVulrWFfYXhqETgRZAqpqzHrtGgnXqh8jS', '7861038', 4, '149156409', 0, 2021, 1703066931),
(10, 'Gorczany, Lakin and Doyle', 'gtreutel@example.com', '$2y$10$y.cYkUJ1R7lH5DJJdK0Bo.jBSU5eYGtX0xrf7DMtyLNEhj9fAeEnW', '94523168', 2, '928768107', 0, 2014, 2019),
(11, 'Schmitt, Ferry and Maggio', 'brycen71@example.com', '$2y$10$qmIrbbhYJbGLC.vdbaQtI.Al.vBiuPNqC64XDHw.BWGMd/mr6BZ46', '58747213', 4, '720225456', 0, 2023, 2023),
(12, 'Feeney-Gislason', 'vdubuque@example.net', '$2y$10$bjlktZy8M12GG29d0rM9d.ukSJArXwO8/xaVl9avgB9dGqPSs0swy', '65950422', 5, '955588730', 0, 2014, 2015),
(13, 'Rutherford-Bogan', 'fbotsford@example.org', '$2y$10$78eZuZLsL2A1ple/3XhXn.OLgxVl6W7PLp/DgMfiVADtBhQzxtBei', '45063690', 2, '155444829', 0, 2014, 2017),
(14, 'Jerde Inc', 'terry.tyrell@example.com', '$2y$10$3Gd.b0sI6lb4Bwev2hGRKORoD9lHtTTpVkUrszI0uAQch6FSJOri.', '43955879', 2, '299877986', 0, 2017, 2022),
(15, 'Collins, Roob and Kovacek', 'mustafa53@example.org', '$2y$10$7BitQFJiQQIwmnvSAcpi5O1s5dsmR75FITAaVuv04RT7h.fZlYVGa', '17185362', 5, '398777426', 0, 2018, 2014),
(16, 'Corwin-Murphy', 'reta.spinka@example.net', '$2y$10$kDms8Jo1KK9HCHy1FfErgOwEWMx8or9Zp6kP31iWrOqgmDLasAHF6', '28669967', 3, '912673748', 0, 2019, 2023),
(17, 'Mitchell-Hegmann', 'cassin.mariano@example.net', '$2y$10$Q/VAWhytnXBHJBzM30Qp9O0yxZUv.IBtB1tA9nBGpBKnqCzINxEnm', '85416157', 4, '263111289', 0, 2023, 2023),
(18, 'Stoltenberg Ltd', 'raphael62@example.com', '$2y$10$EFH9VjvY4K/NM1QKosw6CeDsl5kKLjbDMD6i4JYy8mE8plkpApcD.', '64776759', 3, '221602308', 0, 2018, 2017),
(19, 'Grant, Douglas and Nolan', 'hagenes.ahmad@example.com', '$2y$10$9bmcCPN7CHB0LY2V9gGJzepc/.DDddess19yWN8.zGW.cm0srR1uW', '97136273', 3, '173389028', 0, 2021, 2013),
(20, 'Spinka-Frami', 'reynolds.aurelia@example.org', '$2y$10$GZMmek4Aa4SMuLZvIVNBGujg2WijELX1CQ8wo7UKo9iBaUEvwuAoC', '47922271', 5, '657349870', 0, 2019, 2014),
(21, 'Ondricka LLC', 'kreiger.ismael@example.net', '$2y$10$9T4.b4rKwEr6UwbrhRb7EuyE3UgrERD.4rryrB.lNcODyKfShC.ZG', '63814822', 5, '327482745', 0, 2017, 2019),
(22, 'Wisoky PLC', 'kacie.metz@example.net', '$2y$10$FzNvEgPlneKncESzSu/i6ui6.3g7P3NCvSAJjnhcyBiRb7U4EMkSa', '57749399', 5, '182602625', 0, 2023, 2019),
(23, 'Luettgen-Gaylord', 'fisher.nels@example.com', '$2y$10$9K6swCA0/0rwXtbBEiIHFu.fTF7XFZiu1x.8V8Dok5QQpJNFvXeCS', '69067159', 4, '744841054', 0, 2019, 2019),
(24, 'Kilback Ltd', 'verdie92@example.org', '$2y$10$8rLPwAQvN0iXuTs0jVndWe3kcxoFosBHFfRCirQNwoDltCvDLFSLq', '74779618', 4, '376205820', 1, 2017, 2021),
(25, 'LittelDibbert', 'amaya13@example.org', '$2y$10$FvO/Xw/aU9MjB0IQZ2kWvOzkuDp6B//Eb2mZfDEEDCfaJythPbFMK', '9736386', 2, '974912138', 0, 2021, 1703060771),
(26, 'abooo', 'a@a.com', '$2y$10$n65FgiYHxZdy/36kpaxxV.BFG.5LtUoHo/ysVkpHJDIJEkOU1srFO', '71808214', 0, 'vsdsads55', 0, 1703047457, 1703052280),
(27, 'aboooooodi', 'alsaati.abdulhamid@gmail.com', '$2y$10$ZoWlRx4nvlaorklhO.CqiuVig4qAV9hS2MV6RBYrUZjkJUezUwHPq', '71808214', 0, 'dfdsfdsf', 0, 1703059364, 0);

-- --------------------------------------------------------

--
-- Table structure for table `partner_address`
--

CREATE TABLE `partner_address` (
  `partner_id` bigint(20) UNSIGNED NOT NULL,
  `street` varchar(255) NOT NULL,
  `zip_code` int(4) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner_address`
--

INSERT INTO `partner_address` (`partner_id`, `street`, `zip_code`, `city`) VALUES
(1, '80191 Lourdes Forg', 6544, 'East Donny'),
(2, '273 Larkin Port', 5007, 'North Lempi'),
(3, '54935 Jocelyn Harbors', 6765, 'Samantha'),
(4, '962 Rodriguez Fort', 4410, 'Murielton'),
(5, '251 Polly Fort', 2884, 'North Beulahshire'),
(6, '8132 Pfannerstill Spurs', 3169, 'Beahantown'),
(7, '6539 Morar Forest', 4596, 'North Reyview'),
(8, '5093 Schultz Walks Apt. 714', 7522, 'East Wymanmouth'),
(9, '67700 Katelyn Ramp Suite 451', 9989, 'Myriamfurt'),
(10, '600 Jewell Drive', 8977, 'West Floy'),
(11, '92818 Holden Terrace Apt. 370', 3087, 'Herzogberg'),
(12, '28728 Herzog Shoal', 2277, 'Maymiebury'),
(13, '5649 Tromp Squares Suite 507', 7076, 'Lake Sheldon'),
(14, '705 Eulah Bypass Apt. 376', 3459, 'Lake Isaiahbury'),
(15, '91857 Tomasa Mission', 7377, 'Port Adelle'),
(16, '170 Kacie Keys', 1071, 'East Karellechester'),
(17, '6746 Baylee Manor', 7101, 'Elizabethhaven'),
(18, '4058 Raymundo Valleys Apt. 537', 4417, 'Graciebury'),
(19, '26562 Lemke Walk Apt. 188', 6533, 'Loyton'),
(20, '823 Douglas Flats', 8885, 'Port Ike'),
(21, '42864 Elise Creek', 1887, 'Ruthieland'),
(22, '668 Earnestine Fork', 5248, 'New Audreyfurt'),
(23, '3013 Ben Oval Apt. 533', 9197, 'Goodwinhaven'),
(24, '6236 Mosciski Corners Suite 897', 8174, 'New Alessandro'),
(25, '6184 Blick Mills Apt. 005', 2287, 'New Aliya'),
(26, 'Ringpa', 4000, 'Roskilde'),
(27, 'Ringparken 6, St, Th', 4000, 'Roskilde');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `partner_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `partner_id`, `product_name`, `product_description`, `product_price`) VALUES
(1, 1, 'Burger nisi', 'Quas sint ut sed sed.', 98.08),
(2, 2, 'Salad praesentium', 'Libero ipsa officiis impedit qui voluptatem sit excepturi.', 52.91),
(3, 3, 'Soup adipisci', 'Et minus corrupti aspernatur nobis ut mollitia ea.', 65.92),
(4, 4, 'Pizza enim', 'Et quia fugiat hic suscipit.', 14.98),
(5, 5, 'Burger vel', 'Cupiditate sit quae quam sunt autem delectus.', 44.91),
(6, 6, 'Salad odio', 'A tenetur deserunt quaerat nostrum maxime et nihil.', 66.47),
(7, 7, 'Pizza doloribus', 'Perferendis reiciendis modi ut facere aut in quia eos.', 27.12),
(8, 8, 'Salad est', 'Quo facere blanditiis omnis modi libero voluptas doloremque molestias.', 3.51),
(9, 9, 'Salad iure', 'Distinctio mollitia temporibus sit dolorum sit.', 94.54),
(10, 10, 'Burger aperiam', 'Et dicta rem placeat ex architecto.', 27.07),
(11, 11, 'Salad eos', 'Sapiente eveniet aspernatur minima a voluptas rerum corrupti quis.', 1.35),
(12, 12, 'Salad voluptas', 'Aliquid magnam distinctio ut ipsa aperiam voluptatem.', 69.44),
(13, 13, 'Pizza similique', 'Blanditiis voluptatem veniam et quae.', 97.32),
(14, 14, 'Soup laboriosam', 'Explicabo quibusdam illo debitis est dolorum enim.', 52.02),
(15, 15, 'Burger quo', 'Nisi eius nulla nemo cum quam.', 50.21),
(16, 16, 'Salad sit', 'Nostrum quia debitis nam nihil cum sit est id.', 97.38),
(17, 17, 'Salad quidem', 'Voluptas nulla vel fugit nihil aspernatur enim repudiandae.', 68.87),
(18, 18, 'Burger voluptas', 'Veritatis repellat autem quod omnis veniam.', 43.21),
(19, 19, 'Burger sed', 'Eum dolor consectetur dolorem et.', 52.10),
(20, 20, 'Pizza voluptatem', 'Quia iste id nostrum dolor exercitationem consequuntur et.', 4.61),
(21, 1, 'Salad repudiandae', 'Tempore reiciendis porro dignissimos modi deserunt placeat.', 41.08),
(22, 2, 'Salad perspiciatis', 'Officia magni est animi magnam aperiam quas explicabo illum.', 22.00),
(23, 3, 'Salad quis', 'Consequatur rem quia enim voluptas ea saepe repudiandae.', 28.49),
(24, 4, 'Salad soluta', 'Consequuntur qui tempore sit tempora deserunt dolore porro.', 86.04),
(25, 5, 'Burger non', 'Voluptatem commodi id quis.', 74.60),
(26, 6, 'Salad non', 'Cumque est neque consequuntur nam minima est saepe dolorem.', 84.96),
(27, 7, 'Soup officiis', 'Animi est vel voluptates rerum laudantium.', 83.66),
(28, 8, 'Burger enim', 'Numquam ut voluptatem error neque ipsam recusandae pariatur asperiores.', 44.55),
(29, 9, 'Salad exercitationem', 'Eligendi quos dolor aut et nemo consequuntur dolores.', 17.68),
(30, 10, 'Salad vel', 'Blanditiis quis sequi totam quaerat tenetur.', 30.88),
(31, 11, 'Pasta beatae', 'Et dolores pariatur facilis ad non consequatur quaerat.', 88.74),
(32, 12, 'Burger id', 'Repudiandae ducimus non repellendus ipsum provident sunt.', 82.93),
(33, 13, 'Pizza animi', 'Odio ullam autem enim non aut quam quod autem.', 94.16),
(34, 14, 'Soup ut', 'Ut totam esse architecto dolor.', 14.58),
(35, 15, 'Burger ut', 'Et a quam voluptas quos corrupti unde.', 42.80),
(36, 16, 'Salad sint', 'Sapiente quaerat quod molestiae sint magni.', 33.55),
(37, 17, 'Burger quas', 'Repellendus ducimus cupiditate nesciunt in debitis.', 6.70),
(38, 18, 'Pizza sequi', 'Qui aliquid quidem quia rerum temporibus consectetur.', 18.87),
(39, 19, 'Pizza dolores', 'Non repellendus ipsam id in sunt eveniet.', 19.23),
(40, 20, 'Salad ipsa', 'Et saepe qui veritatis sed culpa ut quis.', 32.17),
(41, 1, 'Burger minus', 'Et fuga laborum atque blanditiis quidem ut.', 24.17),
(42, 2, 'Pizza quis', 'Qui non et quod necessitatibus dolores fuga.', 23.75),
(43, 3, 'Soup eveniet', 'Minus quae corrupti rerum magni et id eum.', 23.11),
(44, 4, 'Pasta est', 'Tenetur sunt dolor suscipit commodi.', 76.24),
(45, 5, 'Pizza facere', 'Harum et tempore fugiat ipsam.', 55.25),
(46, 6, 'Soup aut', 'Quasi cupiditate delectus impedit provident magnam.', 49.68),
(47, 7, 'Salad cum', 'Quos ut ut cum officiis beatae velit sunt.', 66.24),
(48, 8, 'Soup delectus', 'Molestias velit laborum eaque nostrum soluta.', 97.75),
(49, 9, 'Pasta facilis', 'Non ut tempora molestiae et et placeat veritatis eum.', 26.90),
(50, 10, 'Pasta dignissimos', 'Et debitis beatae totam animi expedita deserunt sit.', 78.97),
(51, 11, 'Burger eius', 'Ea iste enim sint sed laboriosam placeat repudiandae officia.', 54.88),
(52, 12, 'Soup nisi', 'Ut et at magnam corrupti recusandae minus laborum ipsa.', 28.90),
(53, 13, 'Burger sit', 'Ut debitis voluptatum rerum sequi ut qui qui iusto.', 47.16),
(54, 14, 'Pasta voluptas', 'Dolor quas ratione ea repellat.', 79.05),
(55, 15, 'Salad nisi', 'Eos itaque optio temporibus voluptas libero odio vero expedita.', 94.34),
(56, 16, 'Pizza est', 'Eum ut nesciunt consequatur magnam minima consequuntur voluptatem.', 93.57),
(57, 17, 'Pizza culpa', 'Alias quo nobis natus perspiciatis.', 64.80),
(58, 18, 'Soup necessitatibus', 'Doloribus reiciendis quidem vel at consequuntur ut facere.', 13.63),
(59, 19, 'Soup eius', 'At ea commodi et et et quia.', 76.49),
(60, 20, 'Soup illum', 'Quidem qui libero laboriosam omnis aliquam dolorem recusandae.', 17.20),
(61, 1, 'Soup vel', 'Et ipsam ea quo deserunt provident dolores.', 87.38),
(62, 2, 'Soup eos', 'Minima qui nostrum alias autem voluptas omnis id.', 69.63),
(63, 3, 'Pizza similique', 'Culpa possimus itaque expedita quod.', 48.75),
(64, 4, 'Soup aliquid', 'Qui impedit tempore vel ex ut asperiores.', 72.52),
(65, 5, 'Soup ratione', 'Voluptatem consectetur doloribus sapiente omnis repellendus.', 8.84),
(66, 6, 'Salad accusantium', 'Deleniti aspernatur soluta amet magni.', 82.78),
(67, 7, 'Pizza iusto', 'Velit dolorem consequatur et quia est reiciendis amet.', 78.98),
(68, 8, 'Burger voluptate', 'Accusamus qui fugiat modi molestiae non.', 29.26),
(69, 9, 'Pasta ad', 'Cumque velit quo debitis recusandae ea animi.', 56.09),
(70, 10, 'Soup laborum', 'Suscipit laudantium cum optio magnam minus repellendus.', 39.35),
(71, 11, 'Pasta similique', 'Perferendis iste vero quo fuga.', 6.53),
(72, 12, 'Pizza eum', 'Aut maxime atque veritatis dicta eveniet veritatis.', 77.39),
(73, 13, 'Soup nemo', 'Reprehenderit qui ut aliquam dolor.', 62.26),
(74, 14, 'Pasta labore', 'Voluptatem culpa impedit saepe voluptate optio deserunt autem.', 21.12),
(75, 15, 'Salad quae', 'Nihil rerum nesciunt autem.', 87.62),
(76, 16, 'Soup deserunt', 'Sed voluptatem tenetur dolorum porro libero quas.', 49.13),
(77, 17, 'Pasta ea', 'Esse aut odit est.', 96.44),
(78, 18, 'Salad deserunt', 'Facere excepturi incidunt pariatur qui aut est aliquid.', 75.62),
(79, 19, 'Soup ab', 'Velit distinctio repellendus pariatur ut mollitia enim.', 92.37),
(80, 20, 'Pizza soluta', 'Aliquam enim et quod rerum.', 87.92);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_firstname` varchar(20) NOT NULL,
  `user_lastname` varchar(20) NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_mobile` varchar(20) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_created_at` char(10) NOT NULL,
  `user_updated_at` char(10) NOT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_firstname`, `user_lastname`, `user_username`, `user_email`, `user_mobile`, `user_password`, `user_created_at`, `user_updated_at`, `user_status`) VALUES
(1, 'Jaylon harry', 'Block', 'lula79j', 'sbruen@example.org', '71106892', '$2y$10$vfJCWC/zHW7arC2haX2.RuLL/4ENpsYtBdVRHL045Ro6z.q7YHY3e', '2022-06-14', '1703059211', 0),
(2, 'Jerad', 'Shields', 'ikris', 'vtremblay@example.com', '59889688', '$2y$10$QL/QRJEkqkQuGAM5SB.YQedpNnjzAKEj2YrU.AkIeCdaFuHYLUeUi', '2019-01-27', '2017-11-12', 0),
(3, 'Nova', 'Wuckert', 'ebert.arthur', 'derrick52@example.com', '74825088', '$2y$10$d6KcXAt4ecKG5.XlMQU/lO.mHly9oT/Gkh5rAwjGb8DmuVN30UCqG', '2017-02-14', '2018-08-22', 0),
(4, 'Rhoda', 'Effertz', 'isadore.ebert', 'corrine51@example.net', '40444669', '$2y$10$9t4dfRlN5MZRClWpuGNal.q3QVqXSvb5WKWK0ie/0wSavH/p6VK.G', '2017-11-20', '2020-04-04', 0),
(5, 'Elmo', 'Dach', 'ferry.wiley', 'parisian.alan@example.com', '33135587', '$2y$10$iFDFD9mSN998SziJ0P8EceUPwftP3wdOlN5TbmDiLiloBWiPViQB.', '2021-12-12', '2016-11-17', 0),
(6, 'Pamela', 'DuBuque', 'trent62', 'barton.veum@example.net', '91631647', '$2y$10$f66yc37gy6ncyUZE1WMaw.R7r0mSPiFnvn6l0MWQr0a3wI2buHcmq', '2019-04-11', '2017-05-24', 0),
(7, 'Citlalli', 'Gulgowski', 'schumm.lucienne', 'bernier.marlon@example.com', '77202295', '$2y$10$4BOE8eycYNTXTdZKlJSpQOXHPpFXdu7YxLvg7jv4Csp934.mvD7Dm', '2018-07-25', '2023-08-03', 0),
(8, 'Jimmy', 'Adams', 'frederik45', 'emmerich.mina@example.org', '16592983', '$2y$10$FKBYeLK1OvWMnOlZmg6Vou8T67T.5y5Dap.vy1ryJQ4seTz5LCvUa', '2022-12-19', '2023-09-12', 1),
(9, 'Reginald', 'Maggio', 'green.tromp', 'bernadine27@example.org', '50397046', '$2y$10$6ZW1GVyrFFfFEk1nUb8rkuFlTCxHSgQw1NcKgCPOtUGQTaMRcaq92', '2019-01-25', '1703065290', 0),
(10, 'Tobin', 'Cummerata', 'wbuckridge', 'ireynolds@example.org', '28831600', '$2y$10$0ksP42jnUrfYIaqJyDmqieogWuiFweXa3Szj4tyM4CQOTfPn7GlMu', '2023-06-20', '2017-02-03', 0),
(11, 'Lavada', 'Streich', 'nicolette92', 'laverna25@example.org', '78082281', '$2y$10$RICYdSv9chILNpr8GB90WOUgKbA5vhCdBZLyeVM4dgevEHkfIs.6a', '2014-11-07', '2023-05-01', 0),
(12, 'Dora', 'Nicolas', 'felicita.friesen', 'mittie90@example.com', '66066006', '$2y$10$OaWa4qsx6vc2e7aTPknNTeJhhvKW9PczmpfpoHQBH51NRq1WL54KK', '2014-05-15', '2021-06-25', 0),
(13, 'Mozell', 'Mayert', 'becker.jena', 'irma.batz@example.com', '43689767', '$2y$10$9Do/NFyET.77vD5UqDh0p.n5FAfAM12Q.4fC0PfUGzZ5LQrfFTfIW', '2016-03-10', '2020-04-18', 0),
(14, 'Tom', 'Treutel', 'uhahn', 'fmckenzie@example.org', '40230822', '$2y$10$bRJbZ67eJ6xYbDfiMize.eeMwplmDEJUh/sCWnTRRukq/Kx5r8PCW', '2014-10-30', '2022-08-30', 0),
(15, 'Wayne', 'Lemke', 'dudley86', 'gordon75@example.org', '90090067', '$2y$10$oiW/JABwn9nqL/x2MvHA.eGkz60aHa73uw.oiJQ79Qj8ZOVaF57DC', '2020-04-29', '2019-11-08', 0),
(16, 'Hassan', 'Gusikowski', 'kassulke.lucienne', 'lowe.dexter@example.com', '35126583', '$2y$10$yBElFzfUeyJdf1NjO/FPLucqbitK9BMjBhIQSesnpQ69mV1s1ltzW', '2022-08-22', '2021-04-30', 0),
(17, 'Watson', 'Brown', 'murray.bruen', 'rowe.jeanette@example.net', '90667417', '$2y$10$kWUWjOofdiTR.azfUkhC/OlcZbkUpAtApiyOg2PfdqO1cKD9ulrE6', '2021-10-25', '2014-08-27', 0),
(18, 'Alice', 'Fisher', 'remington63', 'gudrun.johnston@example.net', '68286961', '$2y$10$CHWj06GVHrR8G..UvVCw9eYgJ7xje/RGrxH8i/QyxvIFrRDfZzKiW', '2020-01-03', '2022-12-30', 0),
(19, 'Broderick', 'Goyette', 'mweber', 'robert.mante@example.net', '16125250', '$2y$10$VFHYvK4tgx7sGbq6/AomhupD5CiCd.O90VwRerjDAj2eqEwKT6p76', '2023-04-16', '2020-06-17', 0),
(20, 'Jacinto', 'Goldner', 'jkemmer', 'pfeffer.arch@example.net', '37673806', '$2y$10$n3W81xJ1vg/.QE7RHQ97LOjDpZyvearU8GtUflvSEB.FJ8TOLsxkS', '2023-10-12', '2020-08-14', 1),
(21, 'Bessie', 'Hansen', 'pschaefer', 'sherwood.davis@example.org', '88467527', '$2y$10$ao.h0oQkrXNPAFzcJSTC5OuVQMPvswbrOjuz6wXOICLTIGwyzxnwq', '2016-04-29', '2018-09-12', 0),
(22, 'Abe', 'Lynch', 'reina02', 'mosciski.rowan@example.com', '88060829', '$2y$10$YVumleO.JiCUYoxIeDnyG.PQrOxl04UbMZ1VTxFACghxWi7.rvkK2', '2016-01-27', '2020-01-05', 0),
(23, 'Adele', 'Sporer', 'reese.keebler', 'ali.quigley@example.net', '87899836', '$2y$10$uw.SxAOShYlObyyupWE85Ozcp0dZu3N25g/paRpaJhkdKJrOmFmc.', '2017-11-11', '2017-09-08', 0),
(24, 'Kareem', 'Pollich', 'karli10', 'jacques36@example.net', '37388725', '$2y$10$NWvyDsx1OwrezrWSh43dlue7vBzF3ZAWa.n3CzJ96HUDAUPFHpTSm', '2015-02-10', '2018-06-29', 0),
(25, 'Gennaro', 'Leffler', 'frankie.stokes', 'marvin.solon@example.com', '97629822', '$2y$10$TYcm/.S.Ma3wPHs3fBNS2eQTQXG6f3hHoEmYtPqySAnoc3zAMoDvy', '2017-09-21', '2018-03-09', 0),
(26, 'Florence', 'Johnston', 'istanton', 'travon62@example.net', '32070615', '$2y$10$Rk97/sEiVP3qZacopoXqP.zWgz8TnCGUqcqAh4X.uP2VDsypOuKFO', '2021-09-21', '2017-07-30', 0),
(27, 'Raleigh', 'Gislason', 'koepp.anastasia', 'oda62@example.net', '82832247', '$2y$10$GbkwCR9iEJcr0g5rxiVLme1zT7wSIeuHD04ziLbYyED.LjEjFJPRC', '2016-12-25', '2018-10-05', 0),
(28, 'Adolph', 'Beier', 'salvatore64', 'zachary76@example.net', '21974441', '$2y$10$pEDD1fWyTLriZ05nZI6b3eDrIqvvTXdbegSAsV3ov4t70uCu1tpBu', '2019-05-03', '2023-04-07', 0),
(29, 'Miguel', 'Kunde', 'alexander48', 'kelton78@example.org', '51124312', '$2y$10$0SCSLBf0XKXcaxsECv1b0ew7tqs0eH3u9QDX8zFJp5.RJreftlrgG', '2022-06-21', '2017-07-06', 0),
(30, 'Dovie', 'Hayes', 'althea.kunde', 'terence83@example.org', '36607876', '$2y$10$ElhfsfwbMDv1KL92VaMML.BfGQyr1Op1E90i7jSrsPmj1Q2sDccXq', '2017-03-10', '2017-01-18', 0),
(31, 'Nathanael', 'Upton', 'jbernier', 'emmie72@example.org', '14489114', '$2y$10$g9H9sNocIn73ig3unVI4mueg9ELwttTgrfRTvLUjizyvMz1rcjxsm', '2017-12-16', '2018-01-21', 0),
(32, 'Royce', 'Heaney', 'vince62', 'volkman.dorothy@example.net', '57570467', '$2y$10$7AGp9P2UGspwqG4v8WviCeDFvwqyFeu8TAcuU8fjngj7BFZKIqule', '2018-10-15', '2021-10-30', 0),
(33, 'Joelle', 'Stoltenberg', 'krajcik.tomas', 'lbuckridge@example.com', '31944303', '$2y$10$l1q0cEnvY7hL2oeOY52sAO2UyslySYiy62eVs8koMsc4EQosWRxsy', '2014-01-26', '2021-03-25', 0),
(34, 'Dashawn', 'Abbott', 'mhoppe', 'lindgren.dillon@example.net', '32984637', '$2y$10$rOkBbJMiodbCo8wMmkdA6O0bEms5nHpUFl1vOH1XtWs9Y9LSciWE2', '2022-05-01', '2019-11-28', 0),
(35, 'Alexa', 'Beatty', 'homenick.kole', 'lmayert@example.org', '97279930', '$2y$10$eAHDCTjACMr9FyPX5e2AUeT6/efqlzOMN58I6p1BCyhSCm6GxMPMq', '2023-10-15', '2020-06-12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `street` varchar(255) NOT NULL,
  `zip_code` int(4) UNSIGNED NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`user_id`, `street`, `zip_code`, `city`) VALUES
(1, '12728 Macy Lights Apt. 793', 3514, 'North Asaview'),
(2, '852 Metz Trail Suite 574', 2747, 'Jerrodport'),
(3, '603 Yost Radial Suite 984', 8474, 'Marilynemouth'),
(4, '1432 Schuppe Rest Apt. 313', 7730, 'South Ovaton'),
(5, '6015 Dickens Flats', 2539, 'Cathrinefurt'),
(6, '75231 Broderick Centers Suite 735', 3669, 'Agnesborough'),
(7, '6988 Beer Motorway', 1988, 'Sylviastad'),
(8, '56118 Streich Springs', 6332, 'Thompsonport'),
(9, '741 Reinger Club Suite 204', 5443, 'Brekketon'),
(10, '7746 Kristopher Circles', 9946, 'South Perry'),
(11, '85284 Domingo Shoal Suite 081', 6728, 'North Michelle'),
(12, '5698 Ignatius Wall', 2458, 'South Bonnie'),
(13, '45729 Bert Meadows', 5056, 'East Kiarra'),
(14, '91878 Kip Mission', 1073, 'Kubfort'),
(15, '7904 Hickle Isle', 6108, 'Ebertshire'),
(16, '590 Estelle Route', 9890, 'Conradhaven'),
(17, '959 Harvey Shore', 7372, 'Elyssafort'),
(18, '7648 Wiegand Crescent Apt. 187', 5347, 'South Allen'),
(19, '807 Nolan Hills', 7346, 'Cedrickmouth'),
(20, '426 Issac Haven', 2770, 'Ziemannmouth'),
(21, '927 Huel Land', 2475, 'Hudsonview'),
(22, '761 Luettgen Trace', 5908, 'New Darioton'),
(23, '742 Letha Radial', 7624, 'Laronhaven'),
(24, '511 Littel Ridge', 1172, 'Lake Brookehaven'),
(25, '60500 Koepp Expressway', 3148, 'Lake Aryanna'),
(26, '42474 Murray Plains', 3131, 'Mullerside'),
(27, '22662 Lily Park Suite 969', 7969, 'Lindland'),
(28, '108 Clementina Isle Suite 876', 3878, 'Langoshchester'),
(29, '222 Howell Mills Apt. 423', 9013, 'Stiedemannshire'),
(30, '912 Itzel Islands', 7836, 'Carrollbury'),
(31, '620 Tod Lights Apt. 571', 6865, 'South Terrell'),
(32, '85891 Alessandro Ports Suite 715', 5761, 'Hammestown'),
(33, '74565 Ona Meadows', 1985, 'New Inesport'),
(34, '929 Lolita Drives', 7802, 'Lake Daisha'),
(35, '127 Adah Mission', 5482, 'Keeblerview');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`partner_id`);

--
-- Indexes for table `partner_address`
--
ALTER TABLE `partner_address`
  ADD PRIMARY KEY (`partner_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `partner_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_partner_id_order` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`partner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id_order` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_id_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `fk_products_order` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `partner_address`
--
ALTER TABLE `partner_address`
  ADD CONSTRAINT `fk_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`partner_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_partner_product` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`partner_id`);

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `fk_user_address` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
