-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 31, 2019 at 02:25 AM
-- Server version: 5.7.27-0ubuntu0.16.04.1
-- PHP Version: 7.3.7-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omega`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `p_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `p_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(11,2) NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` bigint(20) UNSIGNED NOT NULL,
  `session_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'categoria de productos',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `empresa_id`, `name`, `description`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Frutas', NULL, 'verduleria/la-primavera/frutas', 1, '2019-08-14 21:29:33', '2019-08-14 21:29:33'),
(2, 3, 'Frutas Secas', NULL, 'verduleria/la-primavera/frutas-secas', 1, '2019-08-14 21:35:40', '2019-08-14 21:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Argentina',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city`, `state`, `zipcode`, `latitud`, `longitud`, `country`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ciudad Autonoma Buenos Aires', 'Buenos Aires', 'C1420', -34.603333, -58.381667, 'Argentina', 1, '2019-08-06 13:14:08', '2019-08-06 13:14:08'),
(2, 'La Plata', 'Buenos Aires', 'B1900', -34.921111, -57.954444, 'Argentina', 1, '2019-08-06 13:14:08', '2019-08-06 13:14:08'),
(3, 'Rosario', 'Santa Fe', 'S2000', -32.955139, -60.666667, 'Argentina', 1, '2019-08-06 13:14:08', '2019-08-06 13:14:08'),
(4, 'Cordoba', 'Cordoba', 'X5000', -31.416667, -64.183333, 'Argentina', 1, '2019-08-06 13:14:08', '2019-08-06 13:14:08'),
(5, 'Mendoza', 'Mendoza', 'M5500', -32.883333, -68.816667, 'Argentina', 1, '2019-08-06 13:14:08', '2019-08-06 13:14:08'),
(6, 'Ushuaia', 'Tierra del Fuego', 'V9410', -54.801944, -68.303056, 'Argentina', 1, '2019-08-06 13:14:08', '2019-08-06 13:14:08');

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

CREATE TABLE `empresas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre de la empresa',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupe_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL DEFAULT '3',
  `plan_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `cuit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openhours` text COLLATE utf8mb4_unicode_ci,
  `openhours_2` text COLLATE utf8mb4_unicode_ci,
  `minimum` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `shipping_area` text COLLATE utf8mb4_unicode_ci,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`id`, `isAdmin`, `name`, `email`, `password`, `groupe_id`, `city_id`, `type_id`, `plan_id`, `cuit`, `avatar`, `phone`, `address`, `zipcode`, `openhours`, `openhours_2`, `minimum`, `shipping`, `shipping_area`, `latitud`, `longitud`, `slug`, `website`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'WeOnMart', 'weonmart12@gmail.com', '$2y$10$yNwTpdwRJTu4Ztk2Mc8ZVujald/C4LQ.cgvYgABw7x66oc.AssMia', 7, 1, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'CEOYRq99BJ', '2019-08-06 13:14:09', '2019-08-06 13:19:51'),
(2, 1, 'Administrador', 'hashetagme@gmail.com', '$2y$10$OtR.rFjuFhbbUOE.fmTuiet6YNNuFof6nLT4me6yYsbZO0xLh/tUG', 7, 1, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'fcFWrqHEKS', '2019-08-06 13:14:09', '2019-08-06 13:20:06'),
(3, 0, 'La Primavera', 'info@hashetag.com', '$2y$10$dyKr7ZppomNmloZk7UcqwOA6nkljLAI7UFrlFqVRarDWb66poZCVm', 15, 1, 3, 1, NULL, '1565828716.jpeg', '011 27040843', 'Cordoba 1314', '1425', 'Lunes a Viernes : 9hs - 18hs', 'Sabado : 9 hs - 18 hs', 200, 50, NULL, 0, 0, 'verduleria/la-primavera', NULL, 1, NULL, '2019-08-14 21:25:16', '2019-08-14 21:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `emp_payment_methods`
--

CREATE TABLE `emp_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'payment method',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_subscriptions`
--

CREATE TABLE `emp_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'abono',
  `description` text COLLATE utf8mb4_unicode_ci,
  `benefit` text COLLATE utf8mb4_unicode_ci,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(11,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emp_subscriptions`
--

INSERT INTO `emp_subscriptions` (`id`, `name`, `description`, `benefit`, `detail`, `price`, `status`) VALUES
(1, 'Gratis', NULL, NULL, NULL, '0.00', 1),
(2, 'Basic', NULL, NULL, NULL, '499.95', 1),
(3, 'Standard', NULL, NULL, NULL, '1499.95', 1),
(4, 'Premium', NULL, NULL, NULL, '4999.95', 1),
(5, 'Gold', NULL, NULL, NULL, '9999.95', 1),
(6, 'Platinum', NULL, NULL, NULL, '10.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_user_chats`
--

CREATE TABLE `emp_user_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_user_questions`
--

CREATE TABLE `emp_user_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_user_reviews`
--

CREATE TABLE `emp_user_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `rating` double(10,2) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groupes`
--

CREATE TABLE `groupes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Categoria de Empresa',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groupes`
--

INSERT INTO `groupes` (`id`, `name`, `logo`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Tienda de Ropa', NULL, 'tienda-de-ropa', 1, '2019-08-06 13:14:08', '2019-08-06 13:14:08'),
(9, 'Zapatería', NULL, 'zapateria', 1, '2019-08-06 13:14:08', '2019-08-06 13:14:08'),
(10, 'Electroníca', NULL, 'electronica', 1, '2019-08-06 13:14:08', '2019-08-06 13:14:08'),
(14, 'Muebleria', NULL, 'muebleria', 1, '2019-08-14 19:23:41', '2019-08-14 21:19:47'),
(15, 'Verduleria', NULL, 'verduleria', 1, '2019-08-14 19:24:10', '2019-08-14 21:20:09'),
(16, 'Carniceria', NULL, 'carniceria', 1, '2019-08-14 19:24:20', '2019-08-14 21:20:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_06_06_072754_create_cities_table', 1),
(4, '2019_06_06_074155_create_empresas_table', 1),
(5, '2019_06_06_074726_create_products_table', 1),
(6, '2019_06_06_075224_create_orders_table', 1),
(7, '2019_06_06_080345_create_reviews_table', 1),
(8, '2019_06_15_024844_create_carts_table', 1),
(9, '2019_06_25_043514_create_sessions_table', 1),
(10, '2019_06_25_083746_create_wishlists_table', 1),
(11, '2019_06_27_022853_create_weonmarts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `shipping` decimal(11,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phase_id` bigint(20) UNSIGNED NOT NULL DEFAULT '2',
  `delivered` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket` bigint(20) UNSIGNED NOT NULL,
  `p_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_phases`
--

CREATE TABLE `order_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_phases`
--

INSERT INTO `order_phases` (`id`, `name`) VALUES
(2, 'Aprobado'),
(4, 'Cancelado'),
(1, 'Pendiente'),
(3, 'Rechazado');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre del producto',
  `description` text COLLATE utf8mb4_unicode_ci,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `p_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `p_id` bigint(20) UNSIGNED NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `p_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `p_id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0EAioXLz4y06f0XXYLe5C9N5tJ1pQ6IHqrb3bljr', NULL, '157.55.39.131', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkxpdGdtS3ZpS3ZRdFpTMklxU2x2TVB3Qnk5NkI3eXlSQUgxYzJYTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9jYXJuaWNlcmlhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1566794769),
('3gavzPE2svw81UzOdsGeN0LrehJpGr50HXR0Z5eW', NULL, '54.36.150.162', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2kxM3BBU25jYXBlM1k5M3RnVDE4V2p6OUpkUENLMmlDaGhXSlg1QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566744144),
('5Jfacm5w9zLM6SFQ6uVJEAPvbigk7qBMSWYhuPBM', NULL, '66.249.91.156', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 (compatible; AdsBot-Google-Mobile; +http://www.google.com/mobile/adsbot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1EwbHVRTzJHNHJEUWhxUHZvZkZ0R3NORzlRQU9nano5eTJPeUVYbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS8/Z2I9MSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566741006),
('6S3vCV67lQAFrggSWSFZnDdaez0Yj3bFK3ckRVa4', NULL, '209.17.96.74', 'Mozilla/5.0 (compatible; Nimbostratus-Bot/v1.3.2; http://cloudsystemnetworks.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTEzZUFERmpDMnZtVk1GdUV0VnFlUjdLNHpVRXc3Y2F5bDdKN0tOcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566883441),
('7vD2WOtquzaIPwj1v6EBFJJGLZIsmrLj9kbbDDD7', NULL, '40.77.167.120', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXVPaHNkQUdnRlI5dTBqV3FpMDFSRVg3ZUJwbGFnNVFYS01NUzc1ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566802331),
('DcrnvwNFfPv6L8dzsgMpuNjKiIf0jbwXpBsXo8t2', NULL, '157.55.39.131', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUh5VWxiZ2hpdVFXVmN2djdydmJJRmhtZWlRMG14cmpIMWdtTDZMVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566793625),
('ERsdn8nLGV0dk4qcnGXrItUMYiPsT6YUHZkkwBwn', NULL, '35.243.229.195', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.4) Gecko/20030624', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHZlRGNmdGxwNGVnazZRdDNOVEV0YjhDdzlBREdCVjJVb2RER0t2ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566765906),
('GacOwVFWkSLkBNsv3WY7ZHoq5MWUHcq2HstmqPMb', NULL, '54.36.150.97', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmk2VEkyMVltS0ZJbEw3MTl6UG9GczJ5cXFpWjQxYXRaaXp4dVF0ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS92ZXJkdWxlcmlhL2xhLXByaW1hdmVyYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566730342),
('gfmF3T2wGQNoDEuonYSOtOVnUYbDPOtjhitQqKVA', NULL, '184.154.36.179', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/6.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiektJWFNEREdZQVRLN2dqYVRDVFB3c1Bmd0V4Z01oT2hRSUdETjFxTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566755592),
('gq0UhnCYOJSpzE6R5fEEG1K05gUXU5npIrjOlLam', NULL, '54.36.149.39', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkFEYnRFZGpZMjllaU1KMThnS1VLc0dzQmFWelp4QUtPVGRqYnlGbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9taW5vcmlzdGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1566732882),
('HOymGik5IHawP2Q1JsKwuztdirC4AwYa1PhY1hYs', NULL, '54.36.149.70', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmtUVFg1SWdvTE5pNHY3M1YwbE94c2d6cUdlWUV3VkZEaTZtV1NTbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9wb3B1bGFyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1566754729),
('i9l1tL4ddNTyQ0YIF67YVBUtDyG06GoIARiSHkl4', NULL, '137.226.113.28', 'Mozilla/5.0 zgrab/0.x (compatible; Researchscan/t12ca; +http://researchscan.comsys.rwth-aachen.de)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjM5bHRHT21OU2pERGRNVWVjT2tMdkJNbUU4OGNZRk9EM1g5WGgxcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566778068),
('kBqo7pGIiwqcVfV8mlVfBdNaE7FqtSCsfoyJgAMB', NULL, '185.6.9.216', '(info@domaincrawler.com; http://www.domaincrawler.com/weonmart.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTZuMUlmSkpQQTNzWFUwT01xU05GZzQxNFA3SDBVU3k3d1VObGpXTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566771165),
('KbVQAYekV4JxamT38JgQVBIHdtcBIiLlgUlFLLt7', NULL, '54.36.148.80', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnNrOXBjcTZHZUNab0xveENyZmg0UDNGaUlMWE9BYk5qU0lpZWhHViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS92ZXJkdWxlcmlhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1566818703),
('khOZSaDMeS8DeLcBNgnr0NGKavAyshgG2KXtSoBV', NULL, '157.55.39.78', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2k5TnltTjduQzlOVFptZjdFa1pZOFZMa2hlTHNQeEUwelJFb0o1YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9iYXphciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566766107),
('kqfqPL0s5PTTADjUJNhbpNjanWX9qcWEiITWlEh0', NULL, '157.55.39.2', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemFCYm43UGhPaG4zdzYxenBBZ1h3ZlV0bktvTkRoOEFjd0pPYkFBQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS92aW5vdGVjYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566762856),
('KyeIC9sa6AQpZjaBArb8U8qXdvoBjyFp4s0HgSzG', NULL, '184.154.36.179', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/6.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUpUN2NQMUI3SzVQY2x0UTFhT3Fua3hUTHl3cG00NkpoZXY3TFFRTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9wYXNzd29yZC9yZXNldCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566755598),
('l96teniUEw6o4F5igxjCFKdWeQslxw5vxOtNn7sX', NULL, '54.36.148.52', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0VoT0FNdHNDZFFBa2d1QktoNmFsTk9rTXFMQUxkbThpdGV3bDBQTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9tYXlvcmlzdGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1566762976),
('LuBHhLnccqvgKZuY5F1mE1rAht36wBypynA5D27Y', NULL, '157.55.39.131', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0F5OGlWdTNyY09IMmxZRE9KRDlPeFNQNzNjU1hENGxDNWFmQTFGdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9tdWVibGVyaWEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1566802369),
('Me1h6mG7zJnDpiJobCwvEBMxEJfuD9dfEONgd99y', NULL, '54.36.150.97', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUU82TXJGSVhYQ055cGFPOTRtb2ZSYW8yTnZQcnBuQUZEZWgySkFWQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS90ZXJtcy1jb25kaXRpb25zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1566872244),
('N7MLrNTevKrA86aXWnHbldimtPPlzp4VbwPgBgwR', NULL, '193.70.34.209', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblV5SXYzUFd2VDFXUFNOdDVidW80MnNzMkRKVFJZVzFmbjI3NkZqNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566783543),
('OG72VYXlsJIuwUTq8Y58VZOoxpF5TQjpTgxqXIWA', NULL, '157.55.39.78', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1NhZ082MFBwYm5ySVJKb1ZUbUcxcFBvYVVjQmJaZDU2ZXZzQm9GMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566760780),
('ovp3f3Pckzdbb1PVB6yjmkSeNScNeUfbAdcau4Aq', NULL, '185.6.9.216', '(info@domaincrawler.com; http://www.domaincrawler.com/weonmart.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiem1HWW5HcDhqNmdwMGtvZ0xnSmhNMHFsRFRNZ3luUUlxVEp4bkgzUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1566771173),
('qYEBuftoZf1ikEkNQQc9gavAtkhq0JBkvVrGSTbb', NULL, '40.77.167.65', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielFadks5dW42YXJUSVhoNGZucXJQVG9wcno4M2VnODMzQ2ZuVktUTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS8/cGFnZT00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1566727572),
('RpesIEZYHfGM7ZOHktvrNd26bw9j4tbCgWP3CgsT', NULL, '40.77.167.83', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUh6ZlV6ZFM2akRwZ1VJd0tVV2l6d09acTNUcTRBUXRHR3doQ2tuMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566813472),
('S90CANKoE9bjcuODZDVE2RFJnHCThCmttPqHqa55', NULL, '184.154.36.179', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/6.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXoyVFRJc2Z0ZXZEZHo2N3FSWWoybW5PSFJSVXNld1BIWk9XQjJaOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODk6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS8/X3Rva2VuPXpLSVhTRERHWUFUSzdnamFUQ1RQd3NQZndFeGdNaE9oUUlHRE4xcU4mY2l0eT0xJnNlYXJjaD0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1566755593),
('SBfNVyKkxKNg3iKQUNVdq6FAXQk700hMvdAz44U7', NULL, '137.226.113.26', 'Mozilla/5.0 zgrab/0.x (compatible; Researchscan/t12sns; +http://researchscan.comsys.rwth-aachen.de)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkZHblZuTndJVVhsTkJhOU9rWWJnYW9ZeTVQN0s0ME1iaDkzYW1jWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566744708),
('sYTLhy5yickgkMj0AoXubYzVIUAahXblNoiNRBWy', NULL, '184.154.36.179', 'SiteLockSpider [en] (WinNT; I ;Nav)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzJkQWlJYnRBNnpJcjV3UUcwbUR4M0VwR1cxN1BzMGVJQ0VxMTlPQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9jb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1566755599),
('THip1E2k2Ak6uEjepOO3ZwISB0IyKi6vGzKi1Lfg', NULL, '184.154.36.179', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/6.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVG0xNmswNHBzMmQ4bjd5SE9RWDh3SXg5RVI5a1Rya3JOdUVJWTJ0dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS92ZXJkdWxlcmlhL2xhLXByaW1hdmVyYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566755598),
('TmiTty2FVKECZHTxX9UyplKSsM6RNoj1ku5XIYYD', NULL, '54.36.148.248', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2tIQlpwcjRzNVRFM0hpd3RsTXBSZWQ4d0k2N0NSeUVMVmFLV3pVUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS90aWVuZGEtZGUtcm9wYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566806816),
('tULrCh9C9n3weQSrflcHfaJjSUF7SjAMgYE9uZUU', NULL, '190.245.28.16', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1pnekllbWcxTXFzQVB0MlZDbzlwbjJMVVdFZzVrYWZqd3paUXhmRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566777426),
('TylZSLStQIApoA00QadsoGc4Ql0RsAeOn98d2YRO', NULL, '173.252.87.12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnJKTjVMWVdMb01kR3RXZmdiQ2w5NzU5VzJ0cUg5aHY3bXpNTDliTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS8/ZmJjbGlkPUl3QVIzclJwRDEzMGNZZ21fQXVqMVp3WkpnM1M3TGdjSWZZMFBaOVYwZzloX3o0UWNPclhuVmFEM0ZyWk0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1566785525),
('u2BVZolfPcrrvsvo5dV3UBkrFLggB0Nm3E7TtQGK', NULL, '185.6.9.216', '(info@domaincrawler.com; http://www.domaincrawler.com/weonmart.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYldrZFBxcHFvZVlpU3poTDJNU1J6Zk9XNVFDOUNOTDdQZW1TWUNLNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9mYXEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1566771171),
('uSROBe3pYQb02xgrbK2uGJcEjsVhIts6Z7jof0NC', NULL, '185.6.9.216', '(info@domaincrawler.com; http://www.domaincrawler.com/weonmart.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlA4Zjc1dVhCUGRvbUdGSkU2VkFiWEFQdVRFNEVteXZwemRzN0RqdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9hYm91dHVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1566771168),
('VTkI4cvCmWHEqQKP1S9FfISPfXwkMA20Foy8lPTz', NULL, '137.226.113.26', 'Mozilla/5.0 zgrab/0.x (compatible; Researchscan/t13rl; +http://researchscan.comsys.rwth-aachen.de)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1NlZ0ZmdldldG43bE9mSzJnV3NVNGlYQXFIY2N1c0NIZFBxWFBYOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1566764563),
('X3zrNZI3sKOlnUzMyAaaBAZZE1yfmJp04Hh2exWT', NULL, '185.6.9.216', '(info@domaincrawler.com; http://www.domaincrawler.com/weonmart.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHFzT1YzVkZUQXdxZERkRm1BVTYzaXN1Qks0aU5Idm9Fc0p3dDVCWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3Lndlb25tYXJ0LmNvbS9tYXlvcmlzdGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1566771166);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'typo de Empresa',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `slug`, `status`) VALUES
(1, 'Fabrica', NULL, 1),
(2, 'Mayorista', NULL, 1),
(3, 'Minorista', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.jpg',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `verification_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weonmarts`
--

CREATE TABLE `weonmarts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weonmarts_logo`
--

CREATE TABLE `weonmarts_logo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weonmarts_logo`
--

INSERT INTO `weonmarts_logo` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'logo-frontend', 'logo.png', 1, '2019-08-06 13:14:10', '2019-08-06 13:14:10'),
(2, 'favicon', 'favicon.png', 1, '2019-08-06 13:14:10', '2019-08-06 13:14:10'),
(3, 'background search', 'bg.jpg', 1, '2019-08-06 13:14:10', '2019-08-06 13:14:10'),
(4, 'background search product', 'bg.jpg', 1, '2019-08-06 13:14:10', '2019-08-06 13:14:10');

-- --------------------------------------------------------

--
-- Table structure for table `weonmart_blog`
--

CREATE TABLE `weonmart_blog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weonmart_empresa_chat`
--

CREATE TABLE `weonmart_empresa_chat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weonmart_faq`
--

CREATE TABLE `weonmart_faq` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weonmart_forum`
--

CREATE TABLE `weonmart_forum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weonmart_privacy`
--

CREATE TABLE `weonmart_privacy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weonmart_terms`
--

CREATE TABLE `weonmart_terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weonmart_testimonios`
--

CREATE TABLE `weonmart_testimonios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rating` double(10,2) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weonmart_user_chats`
--

CREATE TABLE `weonmart_user_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `p_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_p_id_foreign` (`p_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `empresas_email_unique` (`email`),
  ADD KEY `empresas_groupe_id_foreign` (`groupe_id`),
  ADD KEY `empresas_type_id_foreign` (`type_id`),
  ADD KEY `empresas_city_id_foreign` (`city_id`),
  ADD KEY `empresas_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `emp_payment_methods`
--
ALTER TABLE `emp_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_payment_methods_name_unique` (`name`),
  ADD KEY `emp_payment_methods_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `emp_subscriptions`
--
ALTER TABLE `emp_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_subscriptions_name_unique` (`name`);

--
-- Indexes for table `emp_user_chats`
--
ALTER TABLE `emp_user_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_user_chats_user_id_foreign` (`user_id`),
  ADD KEY `emp_user_chats_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `emp_user_questions`
--
ALTER TABLE `emp_user_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_user_questions_user_id_foreign` (`user_id`),
  ADD KEY `emp_user_questions_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `emp_user_reviews`
--
ALTER TABLE `emp_user_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_user_reviews_user_id_foreign` (`user_id`),
  ADD KEY `emp_user_reviews_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_phase_id_foreign` (`phase_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_p_id_foreign` (`p_id`);

--
-- Indexes for table `order_phases`
--
ALTER TABLE `order_phases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_phases_name_unique` (`name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_empresa_id_foreign` (`empresa_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_p_id_foreign` (`p_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_p_id_foreign` (`p_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_p_id_foreign` (`p_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sizes_p_id_foreign` (`p_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `types_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `weonmarts`
--
ALTER TABLE `weonmarts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weonmarts_logo`
--
ALTER TABLE `weonmarts_logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weonmart_blog`
--
ALTER TABLE `weonmart_blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weonmart_empresa_chat`
--
ALTER TABLE `weonmart_empresa_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weonmart_empresa_chat_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `weonmart_faq`
--
ALTER TABLE `weonmart_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weonmart_forum`
--
ALTER TABLE `weonmart_forum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weonmart_privacy`
--
ALTER TABLE `weonmart_privacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weonmart_terms`
--
ALTER TABLE `weonmart_terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weonmart_testimonios`
--
ALTER TABLE `weonmart_testimonios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weonmart_testimonios_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `weonmart_user_chats`
--
ALTER TABLE `weonmart_user_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weonmart_user_chats_user_id_foreign` (`user_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_p_id_foreign` (`p_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_empresa_id_foreign` (`empresa_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `emp_payment_methods`
--
ALTER TABLE `emp_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emp_subscriptions`
--
ALTER TABLE `emp_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `emp_user_chats`
--
ALTER TABLE `emp_user_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emp_user_questions`
--
ALTER TABLE `emp_user_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emp_user_reviews`
--
ALTER TABLE `emp_user_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_phases`
--
ALTER TABLE `order_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weonmarts`
--
ALTER TABLE `weonmarts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weonmarts_logo`
--
ALTER TABLE `weonmarts_logo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `weonmart_blog`
--
ALTER TABLE `weonmart_blog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weonmart_empresa_chat`
--
ALTER TABLE `weonmart_empresa_chat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weonmart_faq`
--
ALTER TABLE `weonmart_faq`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weonmart_forum`
--
ALTER TABLE `weonmart_forum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weonmart_privacy`
--
ALTER TABLE `weonmart_privacy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weonmart_terms`
--
ALTER TABLE `weonmart_terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weonmart_testimonios`
--
ALTER TABLE `weonmart_testimonios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weonmart_user_chats`
--
ALTER TABLE `weonmart_user_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `carts_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Constraints for table `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `empresas_groupe_id_foreign` FOREIGN KEY (`groupe_id`) REFERENCES `groupes` (`id`),
  ADD CONSTRAINT `empresas_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `emp_subscriptions` (`id`),
  ADD CONSTRAINT `empresas_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);

--
-- Constraints for table `emp_payment_methods`
--
ALTER TABLE `emp_payment_methods`
  ADD CONSTRAINT `emp_payment_methods_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Constraints for table `emp_user_chats`
--
ALTER TABLE `emp_user_chats`
  ADD CONSTRAINT `emp_user_chats_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `emp_user_chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `emp_user_questions`
--
ALTER TABLE `emp_user_questions`
  ADD CONSTRAINT `emp_user_questions_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `emp_user_questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `emp_user_reviews`
--
ALTER TABLE `emp_user_reviews`
  ADD CONSTRAINT `emp_user_reviews_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `emp_user_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `orders_phase_id_foreign` FOREIGN KEY (`phase_id`) REFERENCES `order_phases` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `weonmart_empresa_chat`
--
ALTER TABLE `weonmart_empresa_chat`
  ADD CONSTRAINT `weonmart_empresa_chat_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Constraints for table `weonmart_testimonios`
--
ALTER TABLE `weonmart_testimonios`
  ADD CONSTRAINT `weonmart_testimonios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Constraints for table `weonmart_user_chats`
--
ALTER TABLE `weonmart_user_chats`
  ADD CONSTRAINT `weonmart_user_chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `wishlists_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
