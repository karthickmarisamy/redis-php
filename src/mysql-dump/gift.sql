-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 13, 2023 at 04:37 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gift`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gift_id` int(11) NOT NULL COMMENT 'gifts table -> gift_id column',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `name`, `gift_id`, `created_at`, `updated_at`) VALUES
(1, 'severin', 0, '2023-05-11 18:30:00', '2023-05-13 03:24:29'),
(2, 'oliver', 0, '2023-05-12 11:32:49', '0000-00-00 00:00:00'),
(3, 'henry', 0, '2023-05-12 11:32:49', '2023-05-13 04:01:22'),
(4, 'karsten', 0, '2023-05-11 18:30:00', '2023-05-13 03:37:40'),
(5, 'mehmet', 0, '2023-05-12 11:32:49', '2023-05-13 03:36:21'),
(6, 'jan', 0, '2023-05-12 11:32:49', '2023-05-13 04:08:14'),
(7, 'alex', 0, '2023-05-11 18:30:00', '0000-00-00 00:00:00'),
(8, 'sarah', 0, '2023-05-12 11:32:49', '0000-00-00 00:00:00'),
(9, 'daniel', 0, '2023-05-12 11:32:49', '0000-00-00 00:00:00'),
(10, 'werner', 0, '2023-05-11 18:30:00', '2023-05-13 05:00:18'),
(11, 'robert', 0, '2023-05-12 11:32:49', '2023-05-13 07:07:59'),
(12, 'daniel', 0, '2023-05-12 11:32:49', '2023-05-13 05:23:30'),
(13, 'jonathan', 0, '2023-05-12 11:32:49', '2023-05-13 07:05:42'),
(14, 'maxim', 0, '2023-05-11 18:30:00', '0000-00-00 00:00:00'),
(15, 'michel', 0, '2023-05-12 11:32:49', '0000-00-00 00:00:00'),
(16, 'marc', 0, '2023-05-12 11:32:49', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `employee_interest_map`
--

CREATE TABLE `employee_interest_map` (
  `interest_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL COMMENT 'employees table -> emp_id column',
  `category_id` int(11) NOT NULL COMMENT 'gift_categories table -> id column',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_interest_map`
--

INSERT INTO `employee_interest_map` (`interest_id`, `emp_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 24, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(2, 1, 23, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(3, 1, 14, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(4, 2, 3, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(5, 2, 4, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(6, 2, 25, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(7, 3, 4, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(8, 3, 1, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(9, 3, 12, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(10, 3, 26, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(11, 4, 18, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(12, 4, 20, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(13, 5, 17, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(14, 5, 27, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(15, 5, 5, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(16, 6, 6, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(17, 6, 11, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(18, 6, 18, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(19, 7, 12, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(20, 7, 7, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(21, 7, 28, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(22, 8, 29, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(23, 8, 8, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(24, 8, 22, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(25, 9, 9, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(26, 9, 3, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(27, 10, 11, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(28, 10, 25, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(29, 11, 23, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(30, 11, 17, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(31, 12, 3, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(32, 13, 7, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(33, 13, 12, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(34, 13, 21, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(35, 13, 10, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(36, 14, 15, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(37, 14, 26, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(38, 14, 30, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(39, 15, 26, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(40, 15, 18, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(41, 15, 30, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(42, 16, 16, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(43, 16, 20, '2023-05-12 12:27:23', '0000-00-00 00:00:00'),
(44, 16, 18, '2023-05-12 12:27:23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `gift_id` int(11) NOT NULL,
  `gift_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gifts`
--

INSERT INTO `gifts` (`gift_id`, `gift_name`, `created_at`, `updated_at`) VALUES
(1, 'netflix card', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(2, 'gold plated water bottle', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(3, 'second hand earplugs', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(4, '6 pack of beer', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(5, 'peterborough united football shirt', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(6, 'bonsai tree', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(7, 'dog treats', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(8, 'running shoes', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(9, 'spotify voucher', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(10, 'goggles', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(11, 'recipe book', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(12, 'family vacation to disneyland', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(13, 'bottle of wine', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(14, 'book of german phrases', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(15, 'cocktail mixer', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(16, 'dog halloween costume', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(17, 'yoga ball', '2023-05-12 11:37:46', '0000-00-00 00:00:00'),
(18, 'book on photographing nature', '2023-05-12 11:37:46', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gift_categories`
--

CREATE TABLE `gift_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gift_categories`
--

INSERT INTO `gift_categories` (`category_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'music', '2023-05-12 12:31:51', '0000-00-00 00:00:00'),
(2, 'film', '2023-05-12 12:31:59', '0000-00-00 00:00:00'),
(3, 'pets', '2023-05-12 12:32:12', '0000-00-00 00:00:00'),
(4, 'scifi', '2023-05-12 12:32:30', '0000-00-00 00:00:00'),
(5, 'power lifting', '2023-05-12 12:32:46', '0000-00-00 00:00:00'),
(6, 'triathlons', '2023-05-12 12:32:57', '0000-00-00 00:00:00'),
(7, 'football', '2023-05-12 12:33:06', '0000-00-00 00:00:00'),
(8, 'crossfit', '2023-05-12 12:33:16', '0000-00-00 00:00:00'),
(9, 'handball', '2023-05-12 12:33:27', '0000-00-00 00:00:00'),
(10, 'running', '2023-05-12 12:33:36', '0000-00-00 00:00:00'),
(11, 'techno', '2023-05-12 12:33:44', '0000-00-00 00:00:00'),
(12, 'drinking', '2023-05-12 12:33:57', '0000-00-00 00:00:00'),
(13, 'botany', '2023-05-12 12:34:07', '0000-00-00 00:00:00'),
(14, 'sitting comfortably', '2023-05-12 12:34:14', '0000-00-00 00:00:00'),
(15, 'scuba', '2023-05-12 12:34:24', '0000-00-00 00:00:00'),
(16, 'skydiving', '2023-05-12 12:34:32', '0000-00-00 00:00:00'),
(17, 'eating', '2023-05-12 12:34:45', '0000-00-00 00:00:00'),
(18, 'family', '2023-05-12 12:34:52', '0000-00-00 00:00:00'),
(19, 'german', '2023-05-12 12:35:02', '0000-00-00 00:00:00'),
(20, 'reading', '2023-05-12 12:35:13', '0000-00-00 00:00:00'),
(21, 'cocktails', '2023-05-12 12:35:20', '0000-00-00 00:00:00'),
(22, 'yoga', '2023-05-12 12:35:33', '0000-00-00 00:00:00'),
(23, 'photography', '2023-05-12 12:35:44', '0000-00-00 00:00:00'),
(24, 'high end audio', '2023-05-12 12:09:03', '0000-00-00 00:00:00'),
(25, 'music making', '2023-05-12 12:09:22', '0000-00-00 00:00:00'),
(26, 'motorcross', '2023-05-12 12:11:14', '0000-00-00 00:00:00'),
(27, 'sleeping', '2023-05-12 12:11:18', '0000-00-00 00:00:00'),
(28, 'camping', '2023-05-12 12:11:20', '0000-00-00 00:00:00'),
(29, 'meditation', '2023-05-12 12:11:23', '0000-00-00 00:00:00'),
(30, 'warhammer', '2023-05-12 12:11:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gift_category_map`
--

CREATE TABLE `gift_category_map` (
  `id` int(11) NOT NULL,
  `gift_id` int(11) NOT NULL COMMENT 'gifts table -> gift_id column',
  `category_id` int(11) NOT NULL COMMENT 'categories table -> category_id column',
  `is_assigned` tinyint(1) NOT NULL COMMENT '1-> true, 0->false',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gift_category_map`
--

INSERT INTO `gift_category_map` (`id`, `gift_id`, `category_id`, `is_assigned`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2023-05-12 11:50:35', '2023-05-13 04:01:22'),
(2, 1, 2, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(3, 1, 3, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(4, 1, 4, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(5, 2, 5, 0, '2023-05-12 11:50:35', '2023-05-13 03:36:21'),
(6, 2, 6, 0, '2023-05-12 11:50:35', '2023-05-13 04:08:14'),
(7, 2, 7, 0, '2023-05-12 11:50:35', '2023-05-13 07:05:42'),
(8, 2, 8, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(9, 2, 9, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(10, 2, 10, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(11, 3, 11, 0, '2023-05-12 11:50:35', '2023-05-13 05:00:18'),
(12, 3, 1, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(13, 4, 12, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(14, 5, 7, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(15, 6, 13, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(16, 7, 3, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(17, 8, 10, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(18, 8, 6, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(19, 9, 1, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(20, 10, 15, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(21, 10, 16, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(22, 11, 17, 0, '2023-05-12 11:50:35', '2023-05-13 07:07:59'),
(23, 12, 18, 0, '2023-05-12 11:50:35', '2023-05-13 03:37:40'),
(24, 13, 12, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(25, 14, 19, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(26, 14, 20, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(27, 15, 21, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(28, 15, 12, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(29, 16, 3, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(30, 17, 22, 0, '2023-05-12 11:50:35', '0000-00-00 00:00:00'),
(31, 17, 14, 0, '2023-05-12 11:50:35', '2023-05-13 03:18:55'),
(32, 18, 23, 0, '2023-05-12 11:50:35', '2023-05-13 03:24:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `employee_interest_map`
--
ALTER TABLE `employee_interest_map`
  ADD PRIMARY KEY (`interest_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`gift_id`);

--
-- Indexes for table `gift_categories`
--
ALTER TABLE `gift_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `gift_category_map`
--
ALTER TABLE `gift_category_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `gift_id` (`gift_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employee_interest_map`
--
ALTER TABLE `employee_interest_map`
  MODIFY `interest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `gift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `gift_categories`
--
ALTER TABLE `gift_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `gift_category_map`
--
ALTER TABLE `gift_category_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_interest_map`
--
ALTER TABLE `employee_interest_map`
  ADD CONSTRAINT `employee_interest_map_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`),
  ADD CONSTRAINT `employee_interest_map_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `gift_categories` (`category_id`);

--
-- Constraints for table `gift_category_map`
--
ALTER TABLE `gift_category_map`
  ADD CONSTRAINT `gift_category_map_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `gift_categories` (`category_id`),
  ADD CONSTRAINT `gift_category_map_ibfk_2` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`gift_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
