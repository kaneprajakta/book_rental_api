-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 16, 2024 at 05:30 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_rental_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `b_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `b_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_author` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_isbn` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_genre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`b_id`, `b_title`, `b_author`, `b_isbn`, `b_genre`, `created_at`, `updated_at`) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 'Classics', '2024-08-14 23:31:09', '2024-08-14 23:31:09'),
(2, 'To Kill a Mockingbird', 'Harper Lee', '9780060935467', 'Classics', '2024-08-14 23:31:09', '2024-08-14 23:31:09'),
(3, '1984', 'George Orwell', '9780451524935', 'Dystopian', '2024-08-14 23:31:09', '2024-08-14 23:31:09'),
(4, 'Pride and Prejudice', 'Jane Austen', '9780141199078', 'Romance', '2024-08-14 23:31:09', '2024-08-14 23:31:09'),
(5, 'The Catcher in the Rye', 'J.D. Salinger', '9780316769488', 'Classics', '2024-08-14 23:31:09', '2024-08-14 23:31:09'),
(6, 'The Hobbit', 'J.R.R. Tolkien', '9780547928227', 'Fantasy', '2024-08-14 23:31:09', '2024-08-14 23:31:09'),
(7, 'Fahrenheit 451', 'Ray Bradbury', '9781451673319', 'Science Fiction', '2024-08-14 23:31:09', '2024-08-14 23:31:09'),
(8, 'The Book Thief', 'Markus Zusak', '9780375842207', 'Historical Fiction', '2024-08-14 23:31:09', '2024-08-14 23:31:09'),
(9, 'Moby-Dick', 'Herman Melville', '9781503280786', 'Classics', '2024-08-14 23:31:09', '2024-08-14 23:31:09'),
(10, 'War and Peace', 'Leo Tolstoy', '9781400079988', 'Historical Fiction', '2024-08-14 23:31:09', '2024-08-14 23:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '2024_08_14_102541_create_books_table', 1),
(4, '2024_08_14_103002_create_rent_activities_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tk_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rent_activities`
--

DROP TABLE IF EXISTS `rent_activities`;
CREATE TABLE IF NOT EXISTS `rent_activities` (
  `ra_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ra_b_id` int NOT NULL,
  `ra_u_id` int NOT NULL,
  `ra_rented_on` datetime NOT NULL,
  `ra_return_due_on` datetime NOT NULL,
  `ra_actual_return_dt` datetime DEFAULT NULL,
  `ra_is_overdue` tinyint NOT NULL DEFAULT '0',
  `ra_is_notified` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ra_id`),
  KEY `rent_activities_ra_b_id_foreign` (`ra_b_id`),
  KEY `rent_activities_ra_u_id_foreign` (`ra_u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('wkgPx4i2iHZnCotpvDro5SuUOVVqkxITlkXdV6Pd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3NwOXBqU2lPZ21BWWlEak9aV3ZuNWhIWmZsYTlpOGZmRFNRa2VTMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmVudF9hX2Jvb2siO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723702488),
('UAccbq74lQ9nyYgkWr5KUoYH6XjqixzSoBN13NuC', NULL, '127.0.0.1', 'PostmanRuntime/7.39.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1VOME9CdnQ0UWtqVlduY0FwQTFpWVNwbnpnbkNGR2NJMEhNVjJyZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ2V0X2xlYXN0X3BvcHVsYXJfYm9vayI7fX0=', 1723722157),
('x4JSbzNZ2f0KNwmVuB8VJkgnsDwPMvYeGx8ZiZy3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXVETWtiVzdFeFh2VDhOR2tUOG81bXpPNmg0WDdneHFIQkxsaTl3NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ2V0X2xlYXN0X3BvcHVsYXJfYm9vayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1723722271),
('4mdzQdHYgltMku8vjeDzhWNGlrP9Vt1bu0KqhTEe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVpsTGFBdUhTcXpSRHZOZFNrNGlPNlBpVFQyTktlWElId3R3MW9jdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYm9va3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723776325);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `u_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'kane.prajakta@gmail.com', '2024-08-14 05:58:40', '$2y$12$O4hvKT7NWJBzhOiWWOPVZuuzUcchhQfOtdw7mbPhJgBL5oq.FfrfO', 'lnWEquYzX1', '2024-08-14 05:58:40', '2024-08-14 05:58:40'),
(2, 'Brayan Rohan', 'obaumbach@example.net', '2024-08-14 06:35:58', '$2y$12$T7RLnmZ6iymcrCuXokYHrOmnxKAeUacCHifrM1WNb5jUldXIhIrPG', 'MmphCmPKcY', '2024-08-14 06:35:58', '2024-08-14 06:35:58'),
(3, 'Arely Wilkinson', 'rbalistreri@example.com', '2024-08-14 06:35:58', '$2y$12$T7RLnmZ6iymcrCuXokYHrOmnxKAeUacCHifrM1WNb5jUldXIhIrPG', 'muHj9D0n3u', '2024-08-14 06:35:59', '2024-08-14 06:35:59'),
(4, 'Prof. Chaim Kirlin Sr.', 'jerod.oberbrunner@example.com', '2024-08-14 06:35:58', '$2y$12$T7RLnmZ6iymcrCuXokYHrOmnxKAeUacCHifrM1WNb5jUldXIhIrPG', 'hOIGtvdimH', '2024-08-14 06:35:59', '2024-08-14 06:35:59'),
(5, 'Mackenzie Stamm', 'king.andy@example.org', '2024-08-14 06:35:58', '$2y$12$T7RLnmZ6iymcrCuXokYHrOmnxKAeUacCHifrM1WNb5jUldXIhIrPG', 'HNHAtDnXZr', '2024-08-14 06:35:59', '2024-08-14 06:35:59'),
(6, 'Elwyn Bogan', 'danika.huel@example.net', '2024-08-14 06:35:58', '$2y$12$T7RLnmZ6iymcrCuXokYHrOmnxKAeUacCHifrM1WNb5jUldXIhIrPG', 'lFHJK6As2h', '2024-08-14 06:35:59', '2024-08-14 06:35:59'),
(7, 'Mrs. Chelsie Ankunding', 'abbigail89@example.com', '2024-08-14 06:35:58', '$2y$12$T7RLnmZ6iymcrCuXokYHrOmnxKAeUacCHifrM1WNb5jUldXIhIrPG', '38LAEpbySh', '2024-08-14 06:35:59', '2024-08-14 06:35:59'),
(8, 'Laurine Yost V', 'schmitt.amos@example.org', '2024-08-14 06:35:58', '$2y$12$T7RLnmZ6iymcrCuXokYHrOmnxKAeUacCHifrM1WNb5jUldXIhIrPG', 'IEx1qzLfhT', '2024-08-14 06:35:59', '2024-08-14 06:35:59'),
(9, 'Carmela Legros', 'qemmerich@example.net', '2024-08-14 06:35:58', '$2y$12$T7RLnmZ6iymcrCuXokYHrOmnxKAeUacCHifrM1WNb5jUldXIhIrPG', '6sYqvu459F', '2024-08-14 06:35:59', '2024-08-14 06:35:59'),
(10, 'Monte Runolfsson Sr.', 'jerrod91@example.com', '2024-08-14 06:35:58', '$2y$12$T7RLnmZ6iymcrCuXokYHrOmnxKAeUacCHifrM1WNb5jUldXIhIrPG', 'mgH5MRekzM', '2024-08-14 06:35:59', '2024-08-14 06:35:59'),
(11, 'Prof. Kiley Von', 'nella46@example.com', '2024-08-14 06:35:58', '$2y$12$T7RLnmZ6iymcrCuXokYHrOmnxKAeUacCHifrM1WNb5jUldXIhIrPG', 'l6jXcGulVy', '2024-08-14 06:35:59', '2024-08-14 06:35:59');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
