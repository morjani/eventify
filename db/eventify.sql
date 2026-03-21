-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 21, 2026 at 10:26 PM
-- Server version: 8.4.3
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventify`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shopify_categorie_id` bigint UNSIGNED DEFAULT NULL,
  `shopify_handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopify_synced_at` timestamp NULL DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name`, `description`, `shopify_categorie_id`, `shopify_handle`, `shopify_synced_at`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'Category 1', 'Category 1', NULL, NULL, NULL, 0, '2026-02-22 23:16:15', '2026-02-22 23:16:15'),
(2, 1, 'Category 1', 'Category 1', NULL, NULL, NULL, 0, '2026-02-22 23:16:24', '2026-02-22 23:16:24'),
(3, 1, 'Category 1', 'Category 1', NULL, NULL, NULL, 0, '2026-02-22 23:18:36', '2026-02-22 23:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `shopify_customer_id` bigint DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `country_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint UNSIGNED DEFAULT NULL,
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `prospect` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `shopify_customer_id`, `user_id`, `first_name`, `last_name`, `phone`, `mobile`, `fax`, `email`, `country_id`, `country_name`, `city_id`, `city_name`, `zip_code`, `address`, `prospect`, `deleted`, `created_at`, `updated_at`) VALUES
(9, 9209525239976, 1, 'test', 'morjani', '0666666666', NULL, NULL, 'mounirmorjani@gmail.com', NULL, 'Morocco', NULL, 'Marrakech', '30000', '6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, Marrakech-Ménara, Morocco', 0, 0, '2026-02-20 18:08:12', '2026-02-28 22:31:44'),
(11, 9227176411304, 1, 'Younes', 'Ennali', '+212661620351', NULL, NULL, NULL, NULL, 'Morocco', NULL, 'Tanger', '90000', 'Branes 2', 0, 0, '2026-02-21 13:51:36', '2026-02-21 13:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `evenements`
--

CREATE TABLE `evenements` (
  `id_event` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `inscription_ouverte` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `model_type` varchar(255) DEFAULT NULL,
  `model_id` bigint UNSIGNED DEFAULT NULL,
  `before` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `after` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `description` text,
  `log_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `action`, `model_type`, `model_id`, `before`, `after`, `ip_address`, `user_agent`, `description`, `log_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'create', 'App\\Models\\Order', 10, NULL, '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 19:08:12\\\",\\\"updated_at\\\":null}\"', '34.139.203.251', 'Shopify-Captain-Hook', 'Receiver order', '2026-02-20 19:08:20', '2026-02-20 18:08:20', '2026-02-20 18:08:20'),
(2, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"customer\\\":{\\\"id\\\":9,\\\"shopify_customer_id\\\":9209525239976,\\\"user_id\\\":1,\\\"first_name\\\":\\\"test\\\",\\\"last_name\\\":\\\"morjani\\\",\\\"phone\\\":\\\"+212666666666\\\",\\\"mobile\\\":null,\\\"fax\\\":null,\\\"email\\\":\\\"mounirmorjani@gmail.com\\\",\\\"country_id\\\":null,\\\"country_name\\\":\\\"Morocco\\\",\\\"city_id\\\":null,\\\"city_name\\\":\\\"fes\\\",\\\"zip_code\\\":\\\"30000\\\",\\\"address\\\":\\\"fes test\\\",\\\"prospect\\\":0,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 19:08:12\\\",\\\"updated_at\\\":\\\"2026-02-20 19:08:12\\\"},\\\"order_shipping_address\\\":null}\"', '\"{\\\"customer\\\":{\\\"id\\\":9,\\\"shopify_customer_id\\\":9209525239976,\\\"user_id\\\":1,\\\"first_name\\\":\\\"test\\\",\\\"last_name\\\":\\\"morjani\\\",\\\"phone\\\":\\\"+212666666666\\\",\\\"mobile\\\":null,\\\"fax\\\":null,\\\"email\\\":\\\"mounirmorjani@gmail.com\\\",\\\"country_id\\\":null,\\\"country_name\\\":\\\"Morocco\\\",\\\"city_id\\\":null,\\\"city_name\\\":\\\"fes\\\",\\\"zip_code\\\":\\\"30000\\\",\\\"address\\\":\\\"fes testt\\\",\\\"prospect\\\":0,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 19:08:12\\\",\\\"updated_at\\\":\\\"2026-02-20 20:45:24\\\"},\\\"order_shipping_address\\\":\\\"rabat testt\\\"}\"', '105.69.229.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Update order customer', '2026-02-20 20:45:24', '2026-02-20 19:45:24', '2026-02-20 19:45:24'),
(3, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"customer\\\":{\\\"id\\\":9,\\\"shopify_customer_id\\\":9209525239976,\\\"user_id\\\":1,\\\"first_name\\\":\\\"test\\\",\\\"last_name\\\":\\\"morjani\\\",\\\"phone\\\":\\\"+212666666666\\\",\\\"mobile\\\":null,\\\"fax\\\":null,\\\"email\\\":\\\"mounirmorjani@gmail.com\\\",\\\"country_id\\\":null,\\\"country_name\\\":\\\"Morocco\\\",\\\"city_id\\\":null,\\\"city_name\\\":\\\"fes\\\",\\\"zip_code\\\":\\\"30000\\\",\\\"address\\\":\\\"fes testt\\\",\\\"prospect\\\":0,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 19:08:12\\\",\\\"updated_at\\\":\\\"2026-02-20 20:45:24\\\"},\\\"order_shipping_address\\\":\\\"rabat testt\\\"}\"', '\"{\\\"customer\\\":{\\\"id\\\":9,\\\"shopify_customer_id\\\":9209525239976,\\\"user_id\\\":1,\\\"first_name\\\":\\\"test\\\",\\\"last_name\\\":\\\"morjani\\\",\\\"phone\\\":\\\"+212666666666\\\",\\\"mobile\\\":null,\\\"fax\\\":null,\\\"email\\\":\\\"mounirmorjani@gmail.com\\\",\\\"country_id\\\":null,\\\"country_name\\\":\\\"Morocco\\\",\\\"city_id\\\":null,\\\"city_name\\\":\\\"fes\\\",\\\"zip_code\\\":\\\"30000\\\",\\\"address\\\":\\\"fes testt btest\\\",\\\"prospect\\\":0,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 19:08:12\\\",\\\"updated_at\\\":\\\"2026-02-20 21:39:56\\\"},\\\"order_shipping_address\\\":\\\"rabat testt\\\"}\"', '105.155.249.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Update order customer', '2026-02-20 21:39:56', '2026-02-20 20:39:56', '2026-02-20 20:39:56'),
(4, 1, 'create', 'App\\Models\\Order', 10, NULL, '\"{\\\"id\\\":4,\\\"user_id\\\":1,\\\"order_id\\\":10,\\\"product_id\\\":4,\\\"shopify_product_id\\\":null,\\\"shopify_variant_id\\\":null,\\\"title\\\":null,\\\"sku\\\":\\\"0032-140X90-CN-OUI\\\",\\\"price\\\":\\\"1186.00\\\",\\\"quantity\\\":2,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 21:41:59\\\",\\\"updated_at\\\":null}\"', '105.155.249.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Add new product', '2026-02-20 21:41:59', '2026-02-20 20:41:59', '2026-02-20 20:41:59'),
(5, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"id\\\":3,\\\"user_id\\\":null,\\\"order_id\\\":10,\\\"product_id\\\":4,\\\"shopify_product_id\\\":8910631010472,\\\"shopify_variant_id\\\":null,\\\"title\\\":\\\"Tableau luxe \\\\u00c9clipse Dor\\\\u00e9e - Cadre am\\\\u00e9ricain\\\",\\\"sku\\\":\\\"0032-100X60\\\",\\\"price\\\":\\\"375.00\\\",\\\"quantity\\\":1,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 19:08:19\\\",\\\"updated_at\\\":null}\"', '\"{\\\"id\\\":3,\\\"user_id\\\":1,\\\"order_id\\\":10,\\\"product_id\\\":4,\\\"shopify_product_id\\\":8910631010472,\\\"shopify_variant_id\\\":null,\\\"title\\\":\\\"Tableau luxe \\\\u00c9clipse Dor\\\\u00e9e - Cadre am\\\\u00e9ricain\\\",\\\"sku\\\":\\\"0032-100X600\\\",\\\"price\\\":\\\"375.00\\\",\\\"quantity\\\":5,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 19:08:19\\\",\\\"updated_at\\\":\\\"2026-02-20 21:42:22\\\"}\"', '105.155.249.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Update order item', '2026-02-20 21:42:22', '2026-02-20 20:42:22', '2026-02-20 20:42:22'),
(6, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":\\\"rabat testt\\\",\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 19:08:12\\\",\\\"updated_at\\\":\\\"2026-02-20 21:39:56\\\"}\"', '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":\\\"rabat testt\\\",\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 19:08:12\\\",\\\"updated_at\\\":\\\"2026-02-20 21:42:32\\\"}\"', '105.155.249.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Confirm order', '2026-02-20 21:42:32', '2026-02-20 20:42:32', '2026-02-20 20:42:32'),
(7, NULL, 'create', 'App\\Models\\Order', 12, NULL, '\"{\\\"id\\\":12,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6963050479784,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1808\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"480.00\\\",\\\"total_ttc\\\":\\\"480.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 21:49:50\\\",\\\"updated_at\\\":null}\"', '34.73.181.40', 'Shopify-Captain-Hook', 'Receiver order', '2026-02-20 21:49:54', '2026-02-20 20:49:54', '2026-02-20 20:49:54'),
(8, 1, 'create', 'App\\Models\\Order', 12, NULL, '\"{\\\"id\\\":7,\\\"user_id\\\":1,\\\"order_id\\\":12,\\\"product_id\\\":4,\\\"shopify_product_id\\\":null,\\\"shopify_variant_id\\\":null,\\\"title\\\":null,\\\"sku\\\":\\\"0032-140X80-CN\\\",\\\"price\\\":\\\"786.00\\\",\\\"quantity\\\":1,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 22:00:52\\\",\\\"updated_at\\\":null}\"', '105.155.249.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Add new product', '2026-02-20 22:00:52', '2026-02-20 21:00:52', '2026-02-20 21:00:52'),
(9, NULL, 'create', 'App\\Models\\Order', 13, NULL, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21 14:51:36\\\",\\\"updated_at\\\":null}\"', '34.148.207.197', 'Shopify-Captain-Hook', 'Receiver order', '2026-02-21 14:51:40', '2026-02-21 13:51:40', '2026-02-21 13:51:40'),
(10, 1, 'update', 'App\\Models\\Order', 13, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"no_response\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":null}\"', '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:05:01.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Pending Validation', '2026-02-22 01:05:01', '2026-02-22 01:05:01', '2026-02-22 01:05:01'),
(11, 1, 'update', 'App\\Models\\Order', 13, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:05:01.000000Z\\\"}\"', '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:06:16.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Confirmed', '2026-02-22 01:06:16', '2026-02-22 01:06:16', '2026-02-22 01:06:16'),
(12, 1, 'update', 'App\\Models\\Order', 13, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:06:16.000000Z\\\"}\"', '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:06:22.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Pending Validation', '2026-02-22 01:06:22', '2026-02-22 01:06:22', '2026-02-22 01:06:22'),
(13, 1, 'update', 'App\\Models\\Order', 13, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:06:22.000000Z\\\"}\"', '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"no_response\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:15:15.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to No Response', '2026-02-22 01:15:15', '2026-02-22 01:15:15', '2026-02-22 01:15:15'),
(14, 1, 'update', 'App\\Models\\Order', 13, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"no_response\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:15:15.000000Z\\\"}\"', '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"no_response\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:15:15.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to No Response', '2026-02-22 01:44:50', '2026-02-22 01:44:50', '2026-02-22 01:44:50'),
(15, 1, 'update', 'App\\Models\\Order', 13, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"no_response\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:15:15.000000Z\\\"}\"', '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"no_response\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:15:15.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to No Response', '2026-02-22 01:44:53', '2026-02-22 01:44:53', '2026-02-22 01:44:53'),
(16, 1, 'update', 'App\\Models\\Order', 13, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"no_response\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T01:15:15.000000Z\\\"}\"', '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T02:07:56.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Pending Validation', '2026-02-22 02:07:56', '2026-02-22 02:07:56', '2026-02-22 02:07:56'),
(17, 1, 'update', 'App\\Models\\Order', 13, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T02:07:56.000000Z\\\"}\"', '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"no_response\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T02:08:01.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to No Response', '2026-02-22 02:08:01', '2026-02-22 02:08:01', '2026-02-22 02:08:01'),
(18, 1, 'update', 'App\\Models\\Order', 13, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"no_response\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T02:08:01.000000Z\\\"}\"', '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T02:10:16.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Pending Validation', '2026-02-22 02:10:16', '2026-02-22 02:10:16', '2026-02-22 02:10:16'),
(19, 1, 'update', 'App\\Models\\Order', 13, '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T02:10:16.000000Z\\\"}\"', '\"{\\\"id\\\":13,\\\"date\\\":\\\"2026-02-21T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":11,\\\"shopify_order_id\\\":6964698054824,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1809\\\",\\\"reference\\\":null,\\\"state\\\":\\\"cancelled\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"883.00\\\",\\\"total_ttc\\\":\\\"883.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"customer_address\\\":null,\\\"cancel_reason\\\":\\\"test test\\\",\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-21T13:51:36.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-22T02:10:39.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Cancelled', '2026-02-22 02:10:39', '2026-02-22 02:10:39', '2026-02-22 02:10:39'),
(20, 1, 'create', 'App\\Models\\Order', 13, NULL, '\"{\\\"id\\\":9,\\\"user_id\\\":1,\\\"order_id\\\":13,\\\"product_id\\\":4,\\\"shopify_product_id\\\":null,\\\"shopify_variant_id\\\":null,\\\"title\\\":null,\\\"sku\\\":\\\"0032-140X80-CN-OUI\\\",\\\"price\\\":\\\"1186.00\\\",\\\"quantity\\\":1,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-22 11:50:44\\\",\\\"updated_at\\\":null}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Add new product', '2026-02-22 11:50:44', '2026-02-22 11:50:44', '2026-02-22 11:50:44'),
(21, 1, 'create', 'App\\Models\\Order', 13, NULL, '\"{\\\"id\\\":10,\\\"user_id\\\":1,\\\"order_id\\\":13,\\\"product_id\\\":4,\\\"shopify_product_id\\\":null,\\\"shopify_variant_id\\\":null,\\\"title\\\":null,\\\"sku\\\":\\\"0032-140X80-CD\\\",\\\"price\\\":\\\"786.00\\\",\\\"quantity\\\":1,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-22 11:52:35\\\",\\\"updated_at\\\":null}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Add new product', '2026-02-22 11:52:35', '2026-02-22 11:52:35', '2026-02-22 11:52:35'),
(22, 1, 'create', 'App\\Models\\Category', 3, NULL, '\"{\\\"name\\\":\\\"Category 1\\\",\\\"description\\\":\\\"Category 1\\\",\\\"user_id\\\":1,\\\"updated_at\\\":\\\"2026-02-22 23:18:36\\\",\\\"created_at\\\":\\\"2026-02-22 23:18:36\\\",\\\"id\\\":3}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', NULL, '2026-02-22 23:18:36', '2026-02-22 23:18:36', '2026-02-22 23:18:36'),
(23, 1, 'create', 'App\\Models\\Product', 10, NULL, '\"{\\\"id\\\":10,\\\"user_id\\\":1,\\\"category_id\\\":1,\\\"name\\\":\\\"product 1\\\",\\\"slug\\\":\\\"product-1\\\",\\\"description\\\":\\\"test\\\",\\\"price\\\":\\\"22.00\\\",\\\"compare_price\\\":null,\\\"sku\\\":\\\"ull22\\\",\\\"quantity\\\":2,\\\"custom_product\\\":1,\\\"track_inventory\\\":1,\\\"is_active\\\":1,\\\"shopify_product_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":null,\\\"updated_at\\\":null}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Add custom product', '2026-02-22 23:19:25', '2026-02-22 23:19:25', '2026-02-22 23:19:25'),
(24, 1, 'create', 'App\\Models\\Order', 12, NULL, '\"{\\\"id\\\":11,\\\"user_id\\\":1,\\\"order_id\\\":12,\\\"product_id\\\":10,\\\"shopify_product_id\\\":null,\\\"shopify_variant_id\\\":null,\\\"title\\\":null,\\\"sku\\\":\\\"ull22\\\",\\\"price\\\":\\\"22.00\\\",\\\"quantity\\\":2,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-22 23:19:25\\\",\\\"updated_at\\\":null}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Add custom product', '2026-02-22 23:19:25', '2026-02-22 23:19:25', '2026-02-22 23:19:25'),
(25, 1, 'create', 'App\\Models\\Product', 12, NULL, '\"{\\\"id\\\":12,\\\"user_id\\\":1,\\\"category_id\\\":1,\\\"name\\\":\\\"product 1\\\",\\\"slug\\\":\\\"product-1\\\",\\\"description\\\":\\\"test\\\",\\\"price\\\":\\\"22.00\\\",\\\"compare_price\\\":null,\\\"sku\\\":\\\"ull22\\\",\\\"quantity\\\":2,\\\"custom_product\\\":1,\\\"track_inventory\\\":1,\\\"is_active\\\":1,\\\"shopify_product_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":null,\\\"updated_at\\\":null}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Add custom product', '2026-02-22 23:22:45', '2026-02-22 23:22:45', '2026-02-22 23:22:45'),
(26, 1, 'create', 'App\\Models\\Order', 12, NULL, '\"{\\\"id\\\":12,\\\"user_id\\\":1,\\\"order_id\\\":12,\\\"product_id\\\":12,\\\"shopify_product_id\\\":null,\\\"shopify_variant_id\\\":null,\\\"title\\\":null,\\\"sku\\\":\\\"ull22\\\",\\\"price\\\":\\\"22.00\\\",\\\"quantity\\\":2,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-22 23:22:45\\\",\\\"updated_at\\\":null}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Add custom product', '2026-02-22 23:22:45', '2026-02-22 23:22:45', '2026-02-22 23:22:45'),
(27, 1, 'create', 'App\\Models\\Product', 13, NULL, '\"{\\\"id\\\":13,\\\"user_id\\\":1,\\\"category_id\\\":3,\\\"name\\\":\\\"product 1\\\",\\\"slug\\\":\\\"product-1\\\",\\\"description\\\":null,\\\"price\\\":\\\"6666.00\\\",\\\"compare_price\\\":null,\\\"sku\\\":\\\"u48484\\\",\\\"quantity\\\":3,\\\"custom_product\\\":1,\\\"track_inventory\\\":1,\\\"is_active\\\":1,\\\"shopify_product_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":null,\\\"updated_at\\\":null}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Add custom product', '2026-02-22 23:28:50', '2026-02-22 23:28:50', '2026-02-22 23:28:50'),
(28, 1, 'create', 'App\\Models\\Order', 12, NULL, '\"{\\\"id\\\":13,\\\"user_id\\\":1,\\\"order_id\\\":12,\\\"product_id\\\":13,\\\"shopify_product_id\\\":null,\\\"shopify_variant_id\\\":null,\\\"title\\\":null,\\\"sku\\\":\\\"u48484\\\",\\\"price\\\":\\\"6666.00\\\",\\\"quantity\\\":3,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-22 23:28:50\\\",\\\"updated_at\\\":null}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Add custom product', '2026-02-22 23:28:50', '2026-02-22 23:28:50', '2026-02-22 23:28:50'),
(31, 1, 'update', 'App\\Models\\Customer', 9, '\"{\\\"id\\\":9,\\\"shopify_customer_id\\\":9209525239976,\\\"user_id\\\":1,\\\"first_name\\\":\\\"test\\\",\\\"last_name\\\":\\\"morjani\\\",\\\"phone\\\":\\\"0666666666\\\",\\\"mobile\\\":null,\\\"fax\\\":null,\\\"email\\\":\\\"mounirmorjani@gmail.com\\\",\\\"country_id\\\":null,\\\"country_name\\\":\\\"Morocco\\\",\\\"city_id\\\":null,\\\"city_name\\\":\\\"Marrakech\\\",\\\"zip_code\\\":\\\"30000\\\",\\\"address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, Marrakech-M\\\\u00e9nara, Morocco\\\",\\\"prospect\\\":0,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 18:08:12\\\",\\\"updated_at\\\":\\\"2026-02-20 20:49:50\\\"}\"', '\"{\\\"id\\\":9,\\\"shopify_customer_id\\\":9209525239976,\\\"user_id\\\":1,\\\"first_name\\\":\\\"test\\\",\\\"last_name\\\":\\\"morjani\\\",\\\"phone\\\":\\\"0666666666\\\",\\\"mobile\\\":null,\\\"fax\\\":null,\\\"email\\\":\\\"mounirmorjani@gmail.com\\\",\\\"country_id\\\":null,\\\"country_name\\\":\\\"Morocco\\\",\\\"city_id\\\":null,\\\"city_name\\\":\\\"Marrakech\\\",\\\"zip_code\\\":\\\"30000\\\",\\\"address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, Marrakech-M\\\\u00e9nara, Morocco\\\",\\\"prospect\\\":0,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 18:08:12\\\",\\\"updated_at\\\":\\\"2026-02-23 23:58:20\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'New customer created', '2026-02-23 23:58:20', '2026-02-23 23:58:20', '2026-02-23 23:58:20'),
(32, 1, 'create', 'App\\Models\\Order', 15, NULL, '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"test\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23 23:58:20\\\",\\\"updated_at\\\":\\\"2026-02-23 23:58:20\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'New order created', '2026-02-23 23:58:20', '2026-02-23 23:58:20', '2026-02-23 23:58:20'),
(33, 1, 'create', 'App\\Models\\Order', 15, NULL, '\"{\\\"id\\\":14,\\\"user_id\\\":1,\\\"order_id\\\":15,\\\"product_id\\\":4,\\\"shopify_product_id\\\":null,\\\"shopify_variant_id\\\":null,\\\"title\\\":null,\\\"sku\\\":\\\"0032-140X80-CB-OUI\\\",\\\"price\\\":\\\"1186.00\\\",\\\"quantity\\\":1,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-23 23:59:16\\\",\\\"updated_at\\\":null}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Add new product', '2026-02-23 23:59:16', '2026-02-23 23:59:16', '2026-02-23 23:59:16'),
(34, 1, 'update', 'App\\Models\\Order', 15, '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23 23:58:20\\\",\\\"updated_at\\\":\\\"2026-02-23 23:58:20\\\"}\"', '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000002\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23 23:58:20\\\",\\\"updated_at\\\":\\\"2026-02-24 00:52:42\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order updated', '2026-02-24 00:52:42', '2026-02-24 00:52:42', '2026-02-24 00:52:42'),
(35, 1, 'update', 'App\\Models\\Order', 15, '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000002\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23 23:58:20\\\",\\\"updated_at\\\":\\\"2026-02-24 00:52:42\\\"}\"', '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000003\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23 23:58:20\\\",\\\"updated_at\\\":\\\"2026-02-24 00:53:43\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order updated', '2026-02-24 00:53:43', '2026-02-24 00:53:43', '2026-02-24 00:53:43'),
(36, 1, 'update', 'App\\Models\\Order', 12, '\"{\\\"id\\\":12,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6963050479784,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1808\\\",\\\"custom_number\\\":null,\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"480.00\\\",\\\"total_ttc\\\":\\\"480.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 20:49:50\\\",\\\"updated_at\\\":null}\"', '\"{\\\"id\\\":12,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6963050479784,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1808\\\",\\\"custom_number\\\":\\\"crm_000004\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"480.00\\\",\\\"total_ttc\\\":\\\"480.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"tets test\\\",\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 20:49:50\\\",\\\"updated_at\\\":\\\"2026-02-24 01:09:32\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order updated', '2026-02-24 01:09:33', '2026-02-24 01:09:33', '2026-02-24 01:09:33'),
(37, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T18:08:12.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-20T20:42:32.000000Z\\\"}\"', '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T18:08:12.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-24T23:51:12.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Confirmed', '2026-02-24 23:51:12', '2026-02-24 23:51:12', '2026-02-24 23:51:12'),
(38, 1, 'update', 'App\\Models\\Order', 15, '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000003\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\\\",\\\"source\\\":\\\"crm\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23T23:58:20.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-24T00:53:43.000000Z\\\"}\"', '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000003\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\\\",\\\"source\\\":\\\"crm\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23T23:58:20.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-25T00:20:25.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Confirmed', '2026-02-25 00:20:25', '2026-02-25 00:20:25', '2026-02-25 00:20:25'),
(39, 1, 'update', 'App\\Models\\Order', 15, '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000003\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\\\",\\\"source\\\":\\\"crm\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23T23:58:20.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-25T00:20:25.000000Z\\\"}\"', '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000003\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\\\",\\\"source\\\":\\\"crm\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23T23:58:20.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-25T00:21:30.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Pending Validation', '2026-02-25 00:21:30', '2026-02-25 00:21:30', '2026-02-25 00:21:30'),
(40, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T18:08:12.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-24T23:51:12.000000Z\\\"}\"', '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T18:08:12.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-25T00:21:40.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Pending Validation', '2026-02-25 00:21:40', '2026-02-25 00:21:40', '2026-02-25 00:21:40');
INSERT INTO `logs` (`id`, `user_id`, `action`, `model_type`, `model_id`, `before`, `after`, `ip_address`, `user_agent`, `description`, `log_at`, `created_at`, `updated_at`) VALUES
(41, 1, 'update', 'App\\Models\\Order', 15, '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000003\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\\\",\\\"source\\\":\\\"crm\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23T23:58:20.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-25T00:21:30.000000Z\\\"}\"', '\"{\\\"id\\\":15,\\\"date\\\":\\\"2026-02-23T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000003\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\\\",\\\"source\\\":\\\"crm\\\",\\\"customer_address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-M\\\\u00e9nara, Morocco\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-23T23:58:20.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-25T00:21:58.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Confirmed', '2026-02-25 00:21:58', '2026-02-25 00:21:58', '2026-02-25 00:21:58'),
(42, 1, 'update', 'App\\Models\\Order', 12, '\"{\\\"id\\\":12,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6963050479784,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1808\\\",\\\"custom_number\\\":\\\"crm_000004\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"480.00\\\",\\\"total_ttc\\\":\\\"480.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"tets test\\\",\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T20:49:50.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-24T01:09:32.000000Z\\\"}\"', '\"{\\\"id\\\":12,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6963050479784,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1808\\\",\\\"custom_number\\\":\\\"crm_000004\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"480.00\\\",\\\"total_ttc\\\":\\\"480.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"tets test\\\",\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":null,\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T20:49:50.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-25T00:22:38.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Confirmed', '2026-02-25 00:22:38', '2026-02-25 00:22:38', '2026-02-25 00:22:38'),
(43, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T18:08:12.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-25T00:21:40.000000Z\\\"}\"', '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T18:08:12.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-25T00:24:33.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Confirmed', '2026-02-25 00:24:33', '2026-02-25 00:24:33', '2026-02-25 00:24:33'),
(44, 2, 'update', 'App\\Models\\Order', 10, '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 18:08:12\\\",\\\"updated_at\\\":\\\"2026-02-25 00:24:33\\\"}\"', '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":\\\"PROCESSING\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 18:08:12\\\",\\\"updated_at\\\":\\\"2026-02-25 01:00:13\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Shipping status set to PROCESSING', '2026-02-25 01:00:13', '2026-02-25 01:00:13', '2026-02-25 01:00:13'),
(45, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 18:08:12\\\",\\\"updated_at\\\":\\\"2026-02-27 00:11:21\\\"}\"', '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":\\\"processing\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 18:08:12\\\",\\\"updated_at\\\":\\\"2026-02-27 00:11:28\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Shipping status set to processing', '2026-02-27 00:11:28', '2026-02-27 00:11:28', '2026-02-27 00:11:28'),
(46, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T18:08:12.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-27T00:32:00.000000Z\\\"}\"', '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T18:08:12.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-27T00:39:33.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Pending Validation', '2026-02-27 00:39:33', '2026-02-27 00:39:33', '2026-02-27 00:39:33'),
(47, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T18:08:12.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-27T00:39:33.000000Z\\\"}\"', '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20T00:00:00.000000Z\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":false,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20T18:08:12.000000Z\\\",\\\"updated_at\\\":\\\"2026-02-27T00:39:38.000000Z\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Order status changed to Confirmed', '2026-02-27 00:39:38', '2026-02-27 00:39:38', '2026-02-27 00:39:38'),
(48, 1, 'update', 'App\\Models\\Order', 10, '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":\\\"pending\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 18:08:12\\\",\\\"updated_at\\\":\\\"2026-02-27 00:39:38\\\"}\"', '\"{\\\"id\\\":10,\\\"date\\\":\\\"2026-02-20\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":6962801377448,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":\\\"1807\\\",\\\"custom_number\\\":\\\"crm_000001\\\",\\\"reference\\\":null,\\\"state\\\":\\\"confirmed\\\",\\\"status_shipping\\\":\\\"processing\\\",\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"375.00\\\",\\\"total_ttc\\\":\\\"375.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":null,\\\"source\\\":\\\"shopify\\\",\\\"customer_address\\\":\\\"rabat testt\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-20 18:08:12\\\",\\\"updated_at\\\":\\\"2026-02-27 01:12:30\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Shipping status set to processing', '2026-02-27 01:12:30', '2026-02-27 01:12:30', '2026-02-27 01:12:30'),
(49, 1, 'update', 'App\\Models\\Customer', 9, '\"{\\\"id\\\":9,\\\"shopify_customer_id\\\":9209525239976,\\\"user_id\\\":1,\\\"first_name\\\":\\\"test\\\",\\\"last_name\\\":\\\"morjani\\\",\\\"phone\\\":\\\"0666666666\\\",\\\"mobile\\\":null,\\\"fax\\\":null,\\\"email\\\":\\\"mounirmorjani@gmail.com\\\",\\\"country_id\\\":null,\\\"country_name\\\":\\\"Morocco\\\",\\\"city_id\\\":null,\\\"city_name\\\":\\\"Marrakech\\\",\\\"zip_code\\\":\\\"30000\\\",\\\"address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, Marrakech-M\\\\u00e9nara, Morocco\\\",\\\"prospect\\\":0,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 18:08:12\\\",\\\"updated_at\\\":\\\"2026-02-23 23:58:20\\\"}\"', '\"{\\\"id\\\":9,\\\"shopify_customer_id\\\":9209525239976,\\\"user_id\\\":1,\\\"first_name\\\":\\\"test\\\",\\\"last_name\\\":\\\"morjani\\\",\\\"phone\\\":\\\"0666666666\\\",\\\"mobile\\\":null,\\\"fax\\\":null,\\\"email\\\":\\\"mounirmorjani@gmail.com\\\",\\\"country_id\\\":null,\\\"country_name\\\":\\\"Morocco\\\",\\\"city_id\\\":null,\\\"city_name\\\":\\\"Marrakech\\\",\\\"zip_code\\\":\\\"30000\\\",\\\"address\\\":\\\"6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, Marrakech-M\\\\u00e9nara, Morocco\\\",\\\"prospect\\\":0,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-20 18:08:12\\\",\\\"updated_at\\\":\\\"2026-02-28 22:31:44\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'New customer created', '2026-02-28 22:31:44', '2026-02-28 22:31:44', '2026-02-28 22:31:44'),
(50, 1, 'create', 'App\\Models\\Order', 16, NULL, '\"{\\\"id\\\":16,\\\"date\\\":\\\"2026-02-28\\\",\\\"user_id\\\":1,\\\"customer_id\\\":9,\\\"shopify_order_id\\\":null,\\\"shopify_handle\\\":null,\\\"shopify_synced_at\\\":null,\\\"number\\\":null,\\\"custom_number\\\":\\\"crm_000005\\\",\\\"reference\\\":null,\\\"state\\\":\\\"pending\\\",\\\"status_shipping\\\":null,\\\"payment_method\\\":null,\\\"total_ht\\\":\\\"0.00\\\",\\\"total_ttc\\\":\\\"0.00\\\",\\\"tva\\\":\\\"0.00\\\",\\\"description\\\":null,\\\"note\\\":\\\"sssssssssssssssss\\\",\\\"source\\\":\\\"crm\\\",\\\"customer_address\\\":\\\"sssssssssssssssssssss\\\",\\\"cancel_reason\\\":null,\\\"deleted\\\":0,\\\"sort\\\":0,\\\"created_at\\\":\\\"2026-02-28 22:31:44\\\",\\\"updated_at\\\":\\\"2026-02-28 22:31:44\\\"}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'New order created', '2026-02-28 22:31:44', '2026-02-28 22:31:44', '2026-02-28 22:31:44'),
(51, 1, 'create', 'App\\Models\\Order', 16, NULL, '\"{\\\"id\\\":15,\\\"user_id\\\":1,\\\"order_id\\\":16,\\\"product_id\\\":4,\\\"shopify_product_id\\\":null,\\\"shopify_variant_id\\\":null,\\\"title\\\":null,\\\"sku\\\":\\\"0032-140X80-CB-OUI\\\",\\\"price\\\":\\\"1186.00\\\",\\\"quantity\\\":2,\\\"total_discount\\\":\\\"0.00\\\",\\\"tax\\\":\\\"0.00\\\",\\\"requires_shipping\\\":1,\\\"is_gift_card\\\":0,\\\"vendor\\\":null,\\\"payload\\\":null,\\\"deleted\\\":0,\\\"created_at\\\":\\\"2026-02-28 22:32:21\\\",\\\"updated_at\\\":null}\"', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Add new product', '2026-02-28 22:32:21', '2026-02-28 22:32:21', '2026-02-28 22:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `medias`
--

CREATE TABLE `medias` (
  `id` bigint UNSIGNED NOT NULL,
  `mediaable_id` bigint UNSIGNED NOT NULL,
  `mediaable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medias`
--

INSERT INTO `medias` (`id`, `mediaable_id`, `mediaable_type`, `user_id`, `path`, `url`, `disk`, `alt`, `position`, `mime_type`, `size`, `width`, `height`, `is_primary`, `is_active`, `created_at`, `updated_at`) VALUES
(15, 4, 'App\\Models\\Product', 1, 'products/shopify_8910631010472_Untitled-1_copy.jpg', NULL, 'uploads', NULL, 0, 'image/jpeg', 141838, NULL, NULL, 1, 1, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(16, 4, 'App\\Models\\Product', 1, 'products/shopify_8910631010472_IMG_1281_1_5a2836dd-0aac-4d90-b400-552e366e8901.heic', NULL, 'uploads', NULL, 0, 'image/jpeg', 2209534, NULL, NULL, 0, 1, '2026-02-20 18:08:16', '2026-02-20 18:08:16'),
(17, 4, 'App\\Models\\Product', 1, 'products/shopify_8910631010472_Retouche-artistique-a-la-main_4a8679c3-e2e7-4d51-a152-7940e7b1474e.jpg', NULL, 'uploads', NULL, 0, 'image/jpeg', 187428, NULL, NULL, 0, 1, '2026-02-20 18:08:16', '2026-02-20 18:08:16'),
(18, 4, 'App\\Models\\Product', 1, 'products/shopify_8910631010472_wfbdf.jpg', NULL, 'uploads', NULL, 0, 'image/jpeg', 148017, NULL, NULL, 0, 1, '2026-02-20 18:08:17', '2026-02-20 18:08:17'),
(19, 4, 'App\\Models\\Product', 1, 'products/shopify_8910631010472_1.jpg', NULL, 'uploads', NULL, 0, 'image/jpeg', 137888, NULL, NULL, 0, 1, '2026-02-20 18:08:17', '2026-02-20 18:08:17'),
(20, 4, 'App\\Models\\Product', 1, 'products/shopify_8910631010472_2_copy.jpg', NULL, 'uploads', NULL, 0, 'image/jpeg', 382942, NULL, NULL, 0, 1, '2026-02-20 18:08:18', '2026-02-20 18:08:18'),
(21, 4, 'App\\Models\\Product', 1, 'products/shopify_8910631010472_arbre-dore-reflect-realistic-cadre-americain-moderne-424_1af7ff34-68d3-4458-acbc-7721c86d3f85.webp', NULL, 'uploads', NULL, 0, 'image/jpeg', 61067, NULL, NULL, 0, 1, '2026-02-20 18:08:19', '2026-02-20 18:08:19'),
(22, 4, 'App\\Models\\Product', 1, 'products/shopify_8910631010472_arbre-dore-reflect-realistic-cadre-americain-moderne-647_f9ebf4b6-0b27-424c-b10a-62eb7c21c67e.webp', NULL, 'uploads', NULL, 0, 'image/jpeg', 95086, NULL, NULL, 0, 1, '2026-02-20 18:08:19', '2026-02-20 18:08:19'),
(23, 6, 'App\\Models\\Product', 1, 'products/shopify_8910633566376_fezs.png', NULL, 'uploads', NULL, 0, 'image/jpeg', 434952, NULL, NULL, 1, 1, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(24, 6, 'App\\Models\\Product', 1, 'products/shopify_8910633566376_Untitledvv-1.png', NULL, 'uploads', NULL, 0, 'image/jpeg', 322505, NULL, NULL, 0, 1, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(25, 6, 'App\\Models\\Product', 1, 'products/shopify_8910633566376_Retouche-artistique-a-la-main_4a8679c3-e2e7-4d51-a152-7940e7b1474e.jpg', NULL, 'uploads', NULL, 0, 'image/jpeg', 187428, NULL, NULL, 0, 1, '2026-02-20 20:49:52', '2026-02-20 20:49:52'),
(26, 6, 'App\\Models\\Product', 1, 'products/shopify_8910633566376_Untitled-3_4.png', NULL, 'uploads', NULL, 0, 'image/jpeg', 401094, NULL, NULL, 0, 1, '2026-02-20 20:49:52', '2026-02-20 20:49:52'),
(27, 6, 'App\\Models\\Product', 1, 'products/shopify_8910633566376_frame-1-2g_1.png', NULL, 'uploads', NULL, 0, 'image/jpeg', 278146, NULL, NULL, 0, 1, '2026-02-20 20:49:52', '2026-02-20 20:49:52'),
(28, 6, 'App\\Models\\Product', 1, 'products/shopify_8910633566376_fe3.png', NULL, 'uploads', NULL, 0, 'image/jpeg', 348692, NULL, NULL, 0, 1, '2026-02-20 20:49:52', '2026-02-20 20:49:52'),
(29, 6, 'App\\Models\\Product', 1, 'products/shopify_8910633566376_sizes_5c1620ed-87e9-4c3e-8766-97d0e57505a8.jpg', NULL, 'uploads', NULL, 0, 'image/jpeg', 132941, NULL, NULL, 0, 1, '2026-02-20 20:49:52', '2026-02-20 20:49:52'),
(30, 7, 'App\\Models\\Product', 1, 'products/shopify_8910632321192_arbre-dore-reflect-realistic-cadre-americain-moderne-769.webp', NULL, 'uploads', NULL, 0, 'image/jpeg', 217633, NULL, NULL, 1, 1, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(31, 7, 'App\\Models\\Product', 1, 'products/shopify_8910632321192_arbre-dore-reflect-realistic-cadre-americain-moderne-396.webp', NULL, 'uploads', NULL, 0, 'image/jpeg', 93688, NULL, NULL, 0, 1, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(32, 7, 'App\\Models\\Product', 1, 'products/shopify_8910632321192_arbre-dore-reflect-realistic-cadre-americain-70x45cm-moderne-171.webp', NULL, 'uploads', NULL, 0, 'image/jpeg', 78843, NULL, NULL, 0, 1, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(33, 7, 'App\\Models\\Product', 1, 'products/shopify_8910632321192_arbre-dore-reflect-realistic-cadre-americain-moderne-424_cb2dfb78-e2d5-4f87-96ed-e7ef8fdbacad.webp', NULL, 'uploads', NULL, 0, 'image/jpeg', 61067, NULL, NULL, 0, 1, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(34, 7, 'App\\Models\\Product', 1, 'products/shopify_8910632321192_arbre-dore-reflect-realistic-cadre-americain-moderne-647_08f8b323-2ef3-450a-9466-b45ddd30fde2.webp', NULL, 'uploads', NULL, 0, 'image/jpeg', 95086, NULL, NULL, 0, 1, '2026-02-20 20:49:54', '2026-02-20 20:49:54'),
(35, 7, 'App\\Models\\Product', 1, 'products/shopify_8910632321192_arbre-dore-reflect-realistic-cadre-americain-70x45cm-sans-moderne-682.webp', NULL, 'uploads', NULL, 0, 'image/jpeg', 77314, NULL, NULL, 0, 1, '2026-02-20 20:49:54', '2026-02-20 20:49:54'),
(36, 7, 'App\\Models\\Product', 1, 'products/shopify_8910632321192_arbre-dore-reflect-realistic-cadre-americain-moderne-251.webp', NULL, 'uploads', NULL, 0, 'image/jpeg', 83295, NULL, NULL, 0, 1, '2026-02-20 20:49:54', '2026-02-20 20:49:54'),
(37, 8, 'App\\Models\\Product', 1, 'products/shopify_9262668218536_Gemini_Generated_Image_49tkrk49tkrk49tk.png', NULL, 'uploads', NULL, 0, 'image/jpeg', 1134389, NULL, NULL, 1, 1, '2026-02-21 13:51:38', '2026-02-21 13:51:38'),
(38, 8, 'App\\Models\\Product', 1, 'products/shopify_9262668218536_50b35849-4222-4484-bfca-c097e4bd5632.jpg', NULL, 'uploads', NULL, 0, 'image/jpeg', 152126, NULL, NULL, 0, 1, '2026-02-21 13:51:39', '2026-02-21 13:51:39'),
(39, 8, 'App\\Models\\Product', 1, 'products/shopify_9262668218536_Retouche-artistique-a-la-main_4a8679c3-e2e7-4d51-a152-7940e7b1474e.jpg', NULL, 'uploads', NULL, 0, 'image/jpeg', 187428, NULL, NULL, 0, 1, '2026-02-21 13:51:39', '2026-02-21 13:51:39'),
(40, 8, 'App\\Models\\Product', 1, 'products/shopify_9262668218536_arbre-dore-reflect-realistic-cadre-americain-moderne-647_1aa2897d-9aed-41b6-92f1-4cd6674619f6.webp', NULL, 'uploads', NULL, 0, 'image/jpeg', 95086, NULL, NULL, 0, 1, '2026-02-21 13:51:39', '2026-02-21 13:51:39'),
(41, 8, 'App\\Models\\Product', 1, 'products/shopify_9262668218536_sizes-vertical_a40d6f55-82c9-481e-b923-271365567eae.jpg', NULL, 'uploads', NULL, 0, 'image/jpeg', 131812, NULL, NULL, 0, 1, '2026-02-21 13:51:39', '2026-02-21 13:51:39'),
(42, 10, 'App\\Models\\Product', 1, 'products/R8WfD36ByAz9OBZVWMaCINfUe23qRkzeX4KFfVNw.png', NULL, 'uploads', NULL, 0, 'image/png', 5271, NULL, NULL, 1, 1, '2026-02-22 23:19:25', '2026-02-22 23:19:25'),
(43, 12, 'App\\Models\\Product', 1, 'products/ImpHNxaUSDWUk3wVBW81kvFwpfzKY9XmmMdpaHPu.png', NULL, 'uploads', NULL, 0, 'image/png', 5271, NULL, NULL, 1, 1, '2026-02-22 23:22:45', '2026-02-22 23:22:45'),
(44, 13, 'App\\Models\\Product', 1, 'products/6Ba06gX1gHE3yACvcuawVHQxLGrdVJ2tgxpREV8K.png', NULL, 'uploads', NULL, 0, 'image/png', 5271, NULL, NULL, 1, 1, '2026-02-22 23:28:50', '2026-02-22 23:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_04_203534_create_roles_table', 2),
(5, '2026_02_04_204151_add_new_fields_to_users_table', 3),
(6, '2026_02_04_212618_add_fields_first_name_last_name_to_users_table', 4),
(8, '2026_02_04_230650_create_customers_table', 6),
(11, '2026_02_05_155444_create_categories_table', 8),
(12, '2026_02_06_220007_create_logs_table', 9),
(13, '2026_02_05_155506_create_products_table', 10),
(14, '2026_02_07_205258_create_medias_table', 11),
(16, '2026_02_04_224346_create_orders_table', 13),
(17, '2026_02_08_202709_create_order_items_table', 14),
(18, '2026_02_18_224612_create_product_variants_table', 15),
(19, '2026_02_22_011036_create_order_no_responses_table', 16),
(20, '2026_02_25_143058_create_shops_table', 17),
(21, '2026_02_26_231749_create_permission_tables', 18),
(22, '2026_03_06_135055_pays', 19),
(23, '2026_03_08_221640__add_fields_id-pays_ville_to_users_table', 20),
(24, '2026_03_08_235320_add_ville_and_id_pays', 21),
(25, '2026_03_09_163628__add_verification_password_table_user', 22),
(26, '2026_03_09_164425__add_check_password_table_users', 23),
(27, '2026_03_13_132924_create_table_prendre_rdv', 24),
(28, '2026_03_13_153637__add_id_receiver_and_id_requesteur', 25),
(29, '2026_03_15_163249_evenements', 26);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `shopify_order_id` bigint UNSIGNED DEFAULT NULL,
  `shopify_handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopify_synced_at` timestamp NULL DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_ht` decimal(12,2) DEFAULT '0.00',
  `total_ttc` decimal(12,2) DEFAULT '0.00',
  `tva` decimal(12,2) DEFAULT '0.00',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'crm',
  `customer_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancel_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted` int DEFAULT '0',
  `sort` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date`, `user_id`, `customer_id`, `shopify_order_id`, `shopify_handle`, `shopify_synced_at`, `number`, `custom_number`, `reference`, `state`, `status_shipping`, `payment_method`, `total_ht`, `total_ttc`, `tva`, `description`, `note`, `source`, `customer_address`, `cancel_reason`, `deleted`, `sort`, `created_at`, `updated_at`) VALUES
(10, '2026-02-20', 1, 9, 6962801377448, NULL, NULL, '1807', 'crm_000001', NULL, 'confirmed', 'processing', NULL, 375.00, 375.00, 0.00, NULL, NULL, 'shopify', 'rabat testt', NULL, 0, 0, '2026-02-20 18:08:12', '2026-02-27 01:12:30'),
(12, '2026-02-20', 1, 9, 6963050479784, NULL, NULL, '1808', 'crm_000004', NULL, 'pending', NULL, NULL, 480.00, 480.00, 0.00, NULL, 'tets test', 'shopify', NULL, NULL, 0, 0, '2026-02-20 20:49:50', '2026-02-25 00:22:38'),
(13, '2026-02-21', 1, 11, 6964698054824, NULL, NULL, '1809', NULL, NULL, 'cancelled', NULL, NULL, 883.00, 883.00, 0.00, NULL, NULL, 'crm', NULL, 'test test', 0, 0, '2026-02-21 13:51:36', '2026-02-22 02:10:39'),
(15, '2026-02-23', 1, 9, NULL, NULL, NULL, NULL, 'crm_000003', NULL, 'confirmed', NULL, NULL, 0.00, 1186.00, 0.00, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', 'crm', '6 Commune Rurale Ouidane Sidi Youssef Ben Ali, 6, 03759, fes-Ménara, Morocco', NULL, 0, 0, '2026-02-23 23:58:20', '2026-02-28 22:30:54'),
(16, '2026-02-28', 1, 9, NULL, NULL, NULL, NULL, 'crm_000005', NULL, 'pending', NULL, NULL, 0.00, 2372.00, 0.00, NULL, 'sssssssssssssssss', 'crm', 'sssssssssssssssssssss', NULL, 0, 0, '2026-02-28 22:31:44', '2026-02-28 22:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `shopify_product_id` bigint UNSIGNED DEFAULT NULL,
  `shopify_variant_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int DEFAULT '1',
  `total_discount` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(10,2) DEFAULT '0.00',
  `requires_shipping` tinyint(1) DEFAULT '1',
  `is_gift_card` tinyint(1) DEFAULT '0',
  `vendor` varchar(255) DEFAULT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `deleted` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `user_id`, `order_id`, `product_id`, `shopify_product_id`, `shopify_variant_id`, `title`, `sku`, `price`, `quantity`, `total_discount`, `tax`, `requires_shipping`, `is_gift_card`, `vendor`, `payload`, `deleted`, `created_at`, `updated_at`) VALUES
(3, 1, 10, 4, 8910631010472, NULL, 'Tableau luxe Éclipse Dorée - Cadre américain', '0032-100X600', 375.00, 5, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-20 18:08:19', '2026-02-20 20:42:22'),
(4, 1, 10, 4, NULL, NULL, NULL, '0032-140X90-CN-OUI', 1186.00, 2, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-20 20:41:59', NULL),
(5, NULL, 12, 6, 8910633566376, NULL, 'Nuage tableau décoratif Gold - Cadre américain', '0010-70X45', 240.00, 1, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-20 20:49:52', NULL),
(6, NULL, 12, 7, 8910632321192, NULL, 'Arbre doré reflect realistic - Cadre américain', '0039-70X45', 240.00, 1, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-20 20:49:54', '2026-02-20 20:55:54'),
(7, 1, 12, 4, NULL, NULL, NULL, '0032-140X80-CN', 786.00, 1, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-20 21:00:52', NULL),
(8, NULL, 13, 8, 9262668218536, NULL, 'jazz saxophone Abstrait', '0085-120X70-CB-OUI', 883.00, 1, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-21 13:51:39', NULL),
(9, 1, 13, 4, NULL, NULL, NULL, '0032-140X80-CN-OUI', 1186.00, 1, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-22 11:50:44', NULL),
(10, 1, 13, 4, NULL, NULL, NULL, '0032-140X80-CD', 786.00, 1, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-22 11:52:35', NULL),
(11, 1, 12, 10, NULL, NULL, NULL, 'ull22', 22.00, 2, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-22 23:19:25', NULL),
(12, 1, 12, 12, NULL, NULL, NULL, 'ull22', 22.00, 2, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-22 23:22:45', NULL),
(13, 1, 12, 13, NULL, NULL, NULL, 'u48484', 6666.00, 3, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-22 23:28:50', NULL),
(14, 1, 15, 4, NULL, NULL, NULL, '0032-140X80-CB-OUI', 1186.00, 1, 0.00, 0.00, 1, 0, NULL, NULL, 0, '2026-02-23 23:59:16', NULL),
(15, 1, 16, 4, NULL, NULL, NULL, '0032-140X80-CB-OUI', 1186.00, 2, 0.00, 0.00, 1, 0, NULL, NULL, 1, '2026-02-28 22:32:21', '2026-03-05 11:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_no_responses`
--

CREATE TABLE `order_no_responses` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_no_responses`
--

INSERT INTO `order_no_responses` (`id`, `order_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 13, 1, '2026-02-22 01:15:15', '2026-02-22 01:15:15'),
(2, 13, 1, '2026-02-22 01:44:50', '2026-02-22 01:44:50'),
(3, 13, 1, '2026-02-22 01:44:53', '2026-02-22 01:44:53'),
(4, 13, 1, '2026-02-22 02:08:01', '2026-02-22 02:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `id` bigint UNSIGNED NOT NULL,
  `pays` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pays`
--

INSERT INTO `pays` (`id`, `pays`, `created_at`, `updated_at`) VALUES
(2, 'Maroc', NULL, NULL),
(3, 'France', NULL, NULL),
(4, 'Spain', NULL, NULL),
(5, 'Italie', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions_old`
--

CREATE TABLE `permissions_old` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prendre_rdv`
--

CREATE TABLE `prendre_rdv` (
  `id_rdv` bigint UNSIGNED NOT NULL,
  `heure` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_demande` int DEFAULT NULL,
  `id_demandeur` int DEFAULT NULL,
  `id_event` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prendre_rdv`
--

INSERT INTO `prendre_rdv` (`id_rdv`, `heure`, `message`, `id_demande`, `id_demandeur`, `id_event`, `created_at`, `updated_at`) VALUES
(11, '14-15', 'ccccccc', 28, 1, 0, '2026-03-15 16:16:42', '2026-03-15 16:16:42'),
(12, '14-15', 'hhhhhh', 27, 1, 0, '2026-03-15 16:21:13', '2026-03-15 16:21:13'),
(13, '15-16', 'kkkkkk', 26, 1, 0, '2026-03-15 16:23:19', '2026-03-15 16:23:19'),
(14, '9-10', 'jnj', 27, 1, 0, '2026-03-15 16:29:14', '2026-03-15 16:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) DEFAULT NULL,
  `compare_price` decimal(10,2) DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `custom_product` int DEFAULT '0',
  `track_inventory` tinyint(1) DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `shopify_product_id` bigint UNSIGNED DEFAULT NULL,
  `shopify_handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopify_synced_at` timestamp NULL DEFAULT NULL,
  `deleted` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `name`, `slug`, `description`, `price`, `compare_price`, `sku`, `quantity`, `custom_product`, `track_inventory`, `is_active`, `shopify_product_id`, `shopify_handle`, `shopify_synced_at`, `deleted`, `created_at`, `updated_at`) VALUES
(4, 1, NULL, 'Tableau luxe Éclipse Dorée - Cadre américain', 'tableau-luxe-eclipse-doree-cadre-americain', '\n\n\n \n\n\n\n\n\n\nToile :\n\nNous utilisons des toiles premium de (200 m/g²) en 100% Cotton résistantes à l’eau et aux rayures, prêtes à durer des générations.\n\n\n\n \n\n\nStructure :\n\nLe châssis est indéformable et peut être accroché immédiatement.\n\n\n\n \n\n', 375.00, NULL, '0032-100X60', 1, 0, 1, 1, 8910631010472, NULL, NULL, 0, '2026-02-20 18:08:12', NULL),
(6, 1, NULL, 'Nuage tableau décoratif Gold - Cadre américain', 'nuage-tableau-decoratif-gold-cadre-americain', '\n\n\n \n\n\n\n\n\n\nToile :\n\nNous utilisons des toiles premium de (200 m/g²) en 100% Cotton résistantes à l’eau et aux rayures, prêtes à durer des générations.\n\n\n\n \n\n\nStructure :\n\nLe châssis est indéformable et peut être accroché immédiatement.\n\n\n\n \n\n', 240.00, NULL, '0010-70X45', 1, 0, 1, 1, 8910633566376, NULL, NULL, 0, '2026-02-20 20:49:51', NULL),
(7, 1, NULL, 'Arbre doré reflect realistic - Cadre américain', 'arbre-dore-reflect-realistic', '\n \n\n\n\n\n\n\nToile :\n\nNous utilisons des toiles premium de (200 m/g²) en 100% Cotton résistantes à l’eau et aux rayures, prêtes à durer des générations.\n\n\n\n \n\n\nStructure :\n\nLe châssis est indéformable et peut être accroché immédiatement.\n\n\n\n \n', 240.00, NULL, '0039-70X45', 1, 0, 1, 1, 8910632321192, NULL, NULL, 0, '2026-02-20 20:49:53', NULL),
(8, 1, NULL, 'jazz saxophone Abstrait', 'jazz-saxophone-abstrait', '\n\n\n \n\n\n\n\n\n\nToile :\n\nNous utilisons des toiles premium de (200 m/g²) en 100% Cotton résistantes à l’eau et aux rayures, prêtes à durer des générations.\n\n\n\n \n\n\nStructure :\n\nLe châssis est indéformable et peut être accroché immédiatement.\n\n\n\n \n\n', 883.00, NULL, '0085-120X70-CB-OUI', 1, 0, 1, 1, 9262668218536, NULL, NULL, 0, '2026-02-21 13:51:37', NULL),
(12, 1, 1, 'product 1', 'product-1', 'test', 22.00, NULL, 'ull22', 2, 1, 1, 1, NULL, NULL, NULL, 0, NULL, NULL),
(13, 1, 3, 'product 1', 'product-1', NULL, 6666.00, NULL, 'u48484', 3, 1, 1, 1, NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `compare_price` decimal(12,2) DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `manage_stock` tinyint(1) NOT NULL DEFAULT '1',
  `shopify_variant_id` bigint UNSIGNED DEFAULT NULL,
  `shopify_handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopify_synced_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `user_id`, `name`, `sku`, `barcode`, `price`, `compare_price`, `stock`, `manage_stock`, `shopify_variant_id`, `shopify_handle`, `shopify_synced_at`, `is_active`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '70x45cm / Sans cadre / Non', '0032-70X45', NULL, 240.00, NULL, -10, 1, 52128203931816, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(2, 4, 1, '70x45cm / Sans cadre / Oui', '0032-70X45-OUI', NULL, 440.00, NULL, 0, 1, 54649960497320, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(3, 4, 1, '70x45cm / Cadre Doré / Non', '0032-70X45-CD', NULL, 375.00, NULL, -2, 1, 52128203964584, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(4, 4, 1, '70x45cm / Cadre Doré / Oui', '0032-70X45-CD-OUI', NULL, 575.00, NULL, 0, 1, 54649960530088, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(5, 4, 1, '70x45cm / Cadre Noir / Non', '0032-70X45-CN', NULL, 375.00, NULL, 0, 1, 54649960562856, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(6, 4, 1, '70x45cm / Cadre Noir / Oui', '0032-70X45-CN-OUI', NULL, 575.00, NULL, 0, 1, 54649960595624, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(7, 4, 1, '70x45cm / Cadre Blanc / Non', '0032-70X45-CB', NULL, 375.00, NULL, 0, 1, 54649960628392, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(8, 4, 1, '70x45cm / Cadre Blanc / Oui', '0032-70X45-CB-OUI', NULL, 575.00, NULL, 0, 1, 54649960661160, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(9, 4, 1, '100x60cm / Sans cadre / Non', '0032-100X60', NULL, 375.00, NULL, -6, 1, 52128203997352, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(10, 4, 1, '100x60cm / Sans cadre / Oui', '0032-100X60-OUI', NULL, 625.00, NULL, 0, 1, 54649960693928, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(11, 4, 1, '100x60cm / Cadre Doré / Non', '0032-100X60-CD', NULL, 535.00, NULL, -2, 1, 52128204030120, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(12, 4, 1, '100x60cm / Cadre Doré / Oui', '0032-100X60-CD-OUI', NULL, 785.00, NULL, 0, 1, 54649960726696, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(13, 4, 1, '100x60cm / Cadre Noir / Non', '0032-100X60-CN', NULL, 535.00, NULL, 0, 1, 54649960759464, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(14, 4, 1, '100x60cm / Cadre Noir / Oui', '0032-100X60-CN-OUI', NULL, 785.00, NULL, 0, 1, 54649960792232, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(15, 4, 1, '100x60cm / Cadre Blanc / Non', '0032-100X60-CB', NULL, 535.00, NULL, 0, 1, 54649960825000, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(16, 4, 1, '100x60cm / Cadre Blanc / Oui', '0032-100X60-CB-OUI', NULL, 785.00, NULL, 0, 1, 54649960857768, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(17, 4, 1, '120x70cm / Sans cadre / Non', '0032-120X70', NULL, 465.00, NULL, -1, 1, 52128204062888, NULL, '2026-02-20 18:08:12', 1, 0, '2026-02-20 18:08:12', '2026-02-20 18:08:12'),
(18, 4, 1, '120x70cm / Sans cadre / Oui', '0032-120X70-OUI', NULL, 756.00, NULL, 0, 1, 54649960890536, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(19, 4, 1, '120x70cm / Cadre Doré / Non', '0032-120X70-CD', NULL, 683.00, NULL, -8, 1, 52128204095656, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(20, 4, 1, '120x70cm / Cadre Doré / Oui', '0032-120X70-CD-OUI', NULL, 983.00, NULL, 0, 1, 54649960923304, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(21, 4, 1, '120x70cm / Cadre Noir / Non', '0032-120X70-CN', NULL, 683.00, NULL, 0, 1, 54649960956072, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(22, 4, 1, '120x70cm / Cadre Noir / Oui', '0032-120X70-CN-OUI', NULL, 983.00, NULL, 0, 1, 54649960988840, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(23, 4, 1, '120x70cm / Cadre Blanc / Non', '0032-120X70-CB', NULL, 683.00, NULL, 0, 1, 54649961021608, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(24, 4, 1, '120x70cm / Cadre Blanc / Oui', '0032-120X70-CB-OUI', NULL, 883.00, NULL, 0, 1, 54649961054376, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(25, 4, 1, '140x80cm / Sans cadre / Non', '0032-140X80', NULL, 535.00, NULL, 0, 1, 54649961087144, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(26, 4, 1, '140x80cm / Sans cadre / Oui', '0032-140X80-OUI', NULL, 935.00, NULL, 0, 1, 54649961119912, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(27, 4, 1, '140x80cm / Cadre Doré / Non', '0032-140X80-CD', NULL, 786.00, NULL, 0, 1, 54649961152680, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(28, 4, 1, '140x80cm / Cadre Doré / Oui', '0032-140X80-CD-OUI', NULL, 1186.00, NULL, 0, 1, 54649961185448, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(29, 4, 1, '140x80cm / Cadre Noir / Non', '0032-140X80-CN', NULL, 786.00, NULL, 0, 1, 54649961218216, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(30, 4, 1, '140x80cm / Cadre Noir / Oui', '0032-140X80-CN-OUI', NULL, 1186.00, NULL, 0, 1, 54649961250984, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(31, 4, 1, '140x80cm / Cadre Blanc / Non', '0032-140X80-CB', NULL, 786.00, NULL, 0, 1, 54649961283752, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(32, 4, 1, '140x80cm / Cadre Blanc / Oui', '0032-140X80-CB-OUI', NULL, 1186.00, NULL, 0, 1, 54649961316520, NULL, '2026-02-20 18:08:13', 1, 0, '2026-02-20 18:08:13', '2026-02-20 18:08:13'),
(33, 6, 1, '70x45cm / Sans cadre / Non', '0010-70X45', NULL, 240.00, NULL, -22, 1, 52128223166632, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(34, 6, 1, '70x45cm / Sans cadre / Oui', '0010-70X45-OUI', NULL, 440.00, NULL, 0, 1, 54649861275816, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(35, 6, 1, '70x45cm / Cadre Doré / Non', '0010-70X45-CD', NULL, 375.00, NULL, -1, 1, 52128223232168, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(36, 6, 1, '70x45cm / Cadre Doré / Oui', '0010-70X45-CD-OUI', NULL, 575.00, NULL, 0, 1, 54649861308584, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(37, 6, 1, '70x45cm / Cadre Noir / Non', '0010-70X45-CN', NULL, 375.00, NULL, 0, 1, 54649861341352, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(38, 6, 1, '70x45cm / Cadre Noir / Oui', '0010-70X45-CN-OUI', NULL, 575.00, NULL, 0, 1, 54649861374120, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(39, 6, 1, '70x45cm / Cadre Blanc / Non', '0010-70X45-CB', NULL, 375.00, NULL, 0, 1, 54649861406888, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(40, 6, 1, '70x45cm / Cadre Blanc / Oui', '0010-70X45-CB-OUI', NULL, 575.00, NULL, 0, 1, 54649861439656, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(41, 6, 1, '100x60cm / Sans cadre / Non', '0010-100X60', NULL, 375.00, NULL, -8, 1, 52128223264936, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(42, 6, 1, '100x60cm / Sans cadre / Oui', '0010-100X60-OUI', NULL, 625.00, NULL, 0, 1, 54649861472424, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(43, 6, 1, '100x60cm / Cadre Doré / Non', '0010-100X60-CD', NULL, 535.00, NULL, -6, 1, 52128223297704, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(44, 6, 1, '100x60cm / Cadre Doré / Oui', '0010-100X60-CD-OUI', NULL, 785.00, NULL, 0, 1, 54649861505192, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(45, 6, 1, '100x60cm / Cadre Noir / Non', '0010-100X60-CN', NULL, 535.00, NULL, 0, 1, 54649861537960, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(46, 6, 1, '100x60cm / Cadre Noir / Oui', '0010-100X60-CN-OUI', NULL, 785.00, NULL, 0, 1, 54649861570728, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(47, 6, 1, '100x60cm / Cadre Blanc / Non', '0010-100X60-CB', NULL, 535.00, NULL, 0, 1, 54649861603496, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(48, 6, 1, '100x60cm / Cadre Blanc / Oui', '0010-100X60-CB-OUI', NULL, 785.00, NULL, 0, 1, 54649861636264, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(49, 6, 1, '120x70cm / Sans cadre / Non', '0010-120X70', NULL, 465.00, NULL, -7, 1, 52128223330472, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(50, 6, 1, '120x70cm / Sans cadre / Oui', '0010-120X70-OUI', NULL, 756.00, NULL, 0, 1, 54649861669032, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(51, 6, 1, '120x70cm / Cadre Doré / Non', '0010-120X70-CD', NULL, 683.00, NULL, -15, 1, 52128223363240, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(52, 6, 1, '120x70cm / Cadre Doré / Oui', '0010-120X70-CD-OUI', NULL, 983.00, NULL, 0, 1, 54649861701800, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(53, 6, 1, '120x70cm / Cadre Noir / Non', '0010-120X70-CN', NULL, 683.00, NULL, 0, 1, 54649861734568, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(54, 6, 1, '120x70cm / Cadre Noir / Oui', '0010-120X70-CN-OUI', NULL, 983.00, NULL, 0, 1, 54649861767336, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(55, 6, 1, '120x70cm / Cadre Blanc / Non', '0010-120X70-CB', NULL, 683.00, NULL, 0, 1, 54649861800104, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(56, 6, 1, '120x70cm / Cadre Blanc / Oui', '0010-120X70-CB-OUI', NULL, 883.00, NULL, 0, 1, 54649861832872, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(57, 6, 1, '140x80cm / Sans cadre / Non', '0010-140X80', NULL, 535.00, NULL, -1, 1, 54649861865640, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(58, 6, 1, '140x80cm / Sans cadre / Oui', '0010-140X80-OUI', NULL, 935.00, NULL, 0, 1, 54649861898408, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(59, 6, 1, '140x80cm / Cadre Doré / Non', '0010-140X80-CD', NULL, 786.00, NULL, 0, 1, 54649861931176, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(60, 6, 1, '140x80cm / Cadre Doré / Oui', '0010-140X80-CD-OUI', NULL, 1186.00, NULL, -3, 1, 54649861963944, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(61, 6, 1, '140x80cm / Cadre Noir / Non', '0010-140X80-CN', NULL, 786.00, NULL, 0, 1, 54649861996712, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(62, 6, 1, '140x80cm / Cadre Noir / Oui', '0010-140X80-CN-OUI', NULL, 1186.00, NULL, 0, 1, 54649862029480, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(63, 6, 1, '140x80cm / Cadre Blanc / Non', '0010-140X80-CB', NULL, 786.00, NULL, 0, 1, 54649862062248, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(64, 6, 1, '140x80cm / Cadre Blanc / Oui', '0010-140X80-CB-OUI', NULL, 1186.00, NULL, 0, 1, 54649862095016, NULL, '2026-02-20 20:49:51', 1, 0, '2026-02-20 20:49:51', '2026-02-20 20:49:51'),
(65, 7, 1, '70x45cm / Sans cadre', '0039-70X45', NULL, 240.00, NULL, -226, 1, 52128213696680, NULL, '2026-02-20 20:49:53', 1, 0, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(66, 7, 1, '70x45cm / Cadre Doré', '0039-70X45-CD', NULL, 375.00, NULL, -54, 1, 52128213729448, NULL, '2026-02-20 20:49:53', 1, 0, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(67, 7, 1, '100x60cm / Sans cadre', '0039-100X60', NULL, 375.00, NULL, -60, 1, 52128213762216, NULL, '2026-02-20 20:49:53', 1, 0, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(68, 7, 1, '100x60cm / Cadre Doré', '0039-100X60-CD', NULL, 525.00, NULL, -33, 1, 52128213794984, NULL, '2026-02-20 20:49:53', 1, 0, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(69, 7, 1, '120x70cm / Sans cadre', '0039-120X70', NULL, 465.00, NULL, -119, 1, 52128213827752, NULL, '2026-02-20 20:49:53', 1, 0, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(70, 7, 1, '120x70cm / Cadre Doré', '0039-120X70-CD', NULL, 683.00, NULL, -108, 1, 52128213860520, NULL, '2026-02-20 20:49:53', 1, 0, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(71, 7, 1, '140x80cm / Sans cadre', '0039-140X80', NULL, 535.00, NULL, -3, 1, 54649890046120, NULL, '2026-02-20 20:49:53', 1, 0, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(72, 7, 1, '140x80cm / Cadre Doré', '0039-140X80-CD', NULL, 786.00, NULL, -2, 1, 54649890078888, NULL, '2026-02-20 20:49:53', 1, 0, '2026-02-20 20:49:53', '2026-02-20 20:49:53'),
(73, 8, 1, '70x45cm / Sans cadre / Non', '0085-70X45', NULL, 240.00, NULL, -2, 1, 55113888235688, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(74, 8, 1, '70x45cm / Sans cadre / Oui', '0085-70X45-OUI', NULL, 440.00, NULL, 0, 1, 55113888268456, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(75, 8, 1, '70x45cm / Cadre Noir / Non', '0085-70X45-CN', NULL, 375.00, NULL, -1, 1, 55113888301224, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(76, 8, 1, '70x45cm / Cadre Noir / Oui', '0085-70X45-CN-OUI', NULL, 575.00, NULL, 0, 1, 55113888333992, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(77, 8, 1, '70x45cm / Cadre Doré / Non', '0085-70X45-CD', NULL, 375.00, NULL, 0, 1, 55113888366760, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(78, 8, 1, '70x45cm / Cadre Doré / Oui', '0085-70X45-CD-OUI', NULL, 575.00, NULL, 0, 1, 55113888399528, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(79, 8, 1, '70x45cm / Cadre Blanc / Non', '0085-70X45-CB', NULL, 375.00, NULL, 0, 1, 55113888432296, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(80, 8, 1, '70x45cm / Cadre Blanc / Oui', '0085-70X45-CB-OUI', NULL, 575.00, NULL, 0, 1, 55113888465064, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(81, 8, 1, '100x60cm / Sans cadre / Non', '0085-100X60', NULL, 375.00, NULL, 0, 1, 55113888497832, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(82, 8, 1, '100x60cm / Sans cadre / Oui', '0085-100X60-OUI', NULL, 625.00, NULL, 0, 1, 55113888530600, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(83, 8, 1, '100x60cm / Cadre Noir / Non', '0085-100X60-CN', NULL, 535.00, NULL, -2, 1, 55113888563368, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(84, 8, 1, '100x60cm / Cadre Noir / Oui', '0085-100X60-CN-OUI', NULL, 785.00, NULL, -1, 1, 55113888596136, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(85, 8, 1, '100x60cm / Cadre Doré / Non', '0085-100X60-CD', NULL, 535.00, NULL, 0, 1, 55113888628904, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(86, 8, 1, '100x60cm / Cadre Doré / Oui', '0085-100X60-CD-OUI', NULL, 785.00, NULL, -1, 1, 55113888661672, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(87, 8, 1, '100x60cm / Cadre Blanc / Non', '0085-100X60-CB', NULL, 535.00, NULL, 0, 1, 55113888694440, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(88, 8, 1, '100x60cm / Cadre Blanc / Oui', '0085-100X60-CB-OUI', NULL, 785.00, NULL, 0, 1, 55113888727208, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(89, 8, 1, '120x70cm / Sans cadre / Non', '0085-120X70', NULL, 465.00, NULL, 0, 1, 55113888759976, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(90, 8, 1, '120x70cm / Sans cadre / Oui', '0085-120X70-OUI', NULL, 756.00, NULL, 0, 1, 55113888792744, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(91, 8, 1, '120x70cm / Cadre Noir / Non', '0085-120X70-CN', NULL, 683.00, NULL, -1, 1, 55113888825512, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(92, 8, 1, '120x70cm / Cadre Noir / Oui', '0085-120X70-CN-OUI', NULL, 983.00, NULL, -1, 1, 55113888858280, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(93, 8, 1, '120x70cm / Cadre Doré / Non', '0085-120X70-CD', NULL, 683.00, NULL, 0, 1, 55113888891048, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(94, 8, 1, '120x70cm / Cadre Doré / Oui', '0085-120X70-CD-OUI', NULL, 983.00, NULL, 0, 1, 55113888923816, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(95, 8, 1, '120x70cm / Cadre Blanc / Non', '0085-120X70-CB', NULL, 683.00, NULL, 0, 1, 55113888956584, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(96, 8, 1, '120x70cm / Cadre Blanc / Oui', '0085-120X70-CB-OUI', NULL, 883.00, NULL, -1, 1, 55113888989352, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(97, 8, 1, '140x80cm / Sans cadre / Non', '0085-140X80', NULL, 535.00, NULL, -1, 1, 55113889022120, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(98, 8, 1, '140x80cm / Sans cadre / Oui', '0085-140X80-OUI', NULL, 935.00, NULL, 0, 1, 55113889054888, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(99, 8, 1, '140x80cm / Cadre Noir / Non', '0085-140X80-CN', NULL, 786.00, NULL, 0, 1, 55113889087656, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(100, 8, 1, '140x80cm / Cadre Noir / Oui', '0085-140X80-CN-OUI', NULL, 1186.00, NULL, -2, 1, 55113889120424, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(101, 8, 1, '140x80cm / Cadre Doré / Non', '0085-140X80-CD', NULL, 786.00, NULL, 0, 1, 55113889153192, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(102, 8, 1, '140x80cm / Cadre Doré / Oui', '0085-140X80-CD-OUI', NULL, 1186.00, NULL, 0, 1, 55113889185960, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(103, 8, 1, '140x80cm / Cadre Blanc / Non', '0085-140X80-CB', NULL, 786.00, NULL, 0, 1, 55113889218728, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37'),
(104, 8, 1, '140x80cm / Cadre Blanc / Oui', '0085-140X80-CB-OUI', NULL, 1186.00, NULL, 0, 1, 55113889251496, NULL, '2026-02-21 13:51:37', 1, 0, '2026-02-21 13:51:37', '2026-02-21 13:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2026-02-26 23:32:33', '2026-02-26 23:32:38'),
(2, 'participant', 'web', '2026-02-26 23:34:42', '2026-02-26 23:34:46'),
(3, 'order_handler', 'web', '2026-02-26 23:35:09', '2026-02-26 23:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `roles_first`
--

CREATE TABLE `roles_first` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles_first`
--

INSERT INTO `roles_first` (`id`, `name`, `key`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, 1, '2026-02-04 19:36:11', '2026-02-04 19:36:15'),
(2, 'Order Confirmation', 'order_confirmation', NULL, 1, '2026-02-04 19:37:13', '2026-02-04 19:37:17'),
(3, 'Order Handler', 'order_handler', NULL, 1, '2026-02-24 22:20:35', '2026-02-24 22:20:39');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0OY4T1SJeNGNTH3K2zJ1Yfbqnrj8WRff6GUnSSZC', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaFd2eGZYNlhXOEpuVWlqa2V5TFk0b2JuUmZhT280UGVYeEZ0b1dkRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773354648),
('0uH7GJT3Y9e4KPsJ6RRRCX1URFSYEvt3DqJVD0aH', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZXVTQXZDMnZKaklwcXBIbkF2SHpmQWg4VWNUWEQ5WlBGYlRqdVBONCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773663586),
('1L6sYxwz4wKCV9KSqQ0OB19uW9QBnCuRQCAZXnJL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS0xpYVFlMm9kRXJhVVZaV0VGRTd3T3VETWFGSms3UTBzMWlQTmtMeSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773660407),
('1Qj1DR758RZPNkZJubWYY5oP0jJJrx5AxbaPN4i8', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMXlLVW1TQ3lDZkhwYlNHV25nYlBCQXFLQjNhS3RvZ2JUajdnellkUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773407300),
('1zF3uuLxDfI0QXf42XayuqZIyBwa6zhzcwtWnxPg', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieE5YUVk0WGRsaE43QjRhbU1zaHhUYTV6eUpLRVRhN0RrS0tHcG41TCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773353685),
('2E4qFU3xUlKEtvRca5QH4Xs4yaPHFICK09HC3jbt', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMmxVQmF3aDhhS1ZjMERjOUlqOUJtN2pqcGJIMndYMjBRSThOMU9obSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773405844),
('3bFKEvVrQm90nqBpGOF4nD49Xo4SdpLolzQiPusQ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZElwbkVUVUtmRmlsamFIckwzYVBMUU8wUHFKazFIOW1ndDlSOTNmZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773356218),
('59p9ezMG1cRSxQC6hTerYaqelTomJMiS9L1RPKp3', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMkM3bFRRN2JaeDExbGE0ZUFCOWhSMnpUbHFzcHZsb3FReUc4SzhxaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773407109),
('6BUi8R0OnIs5ky3aeL4dymf5iLNqBPd3W6eb04gL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZUVoQ2sxRTdUOWxoYkhqQ29xV2lWUUFZcW5xWVZSZHI4MHdHcjBjTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773407333),
('6Sw1sB9zUltSOtfr1JehIYwenzXHMuezHoQqeChG', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoid2dFbk1hbklJY2RWT2Vqc2dIcjNhTnRCcGFJcGZpN1E4RUdMZWxQcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773354437),
('79w8i7zIWhZTHmKAwJWzWq2lm0fouPcUmlXWpg6b', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOTNmeEhmS0ZWdjdHUkE3M0hwUzQ3a1BvTncxVTZsRkpqUlo0bzdjaCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1773442998),
('7J03gPA4GfXmrFrIsqZVshOvaxnXmdVGy9pQ9UMv', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoib1dyaFNtTEsxTFpkZ3ZGN09zdFM5b2VmZ0NYbnluQjkwUnlHNHpTeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773444005),
('8pd4spR7y1XeIo3ryh7vFjVcKoFYpRUASmLkcVWB', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS21jN1JuM01DWjE5SFI2NVhPdU80SlJXdDBHMEVOTVB6TFJNZHpuTCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1773615589),
('9zO8jfRfQpoKWAIYi1prJ5TATt8tZJYYBLsgQSWm', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieTFyaVJJck9iYURHZUVHU0NQQ0hZejZxejFtdWU3VUo0eDQ4RFhzUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773405796),
('aOd9TQRFRQfrtyKs0eqAefyeNAjysJTKhUFBKqkt', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiem9yak5jUXN5ZFRxT2k3MTFMUkRrWnRZR2RCU003UnVlTUJuTUFLQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773354021),
('bhDvABZjjDWDGzmFNcIEIbnH2Dy1BwWlBHCUshQO', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSll3S3VzdDBiMUl2NUxXRGMzUEFweE85dmY5YmtqS1lwQVVYenNIaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773663924),
('bkfr02eoOFBMctUsoKY88CNbcRhcuRXM7RFltYF2', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiODdHRnZURkpIOE82dHRiQmk4TThrYjJIQXJIVllHQUVZbFZwUm9pTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773664039),
('bWJ4CP1SvWI93FzXyCXZlGtjP394uS73TtJJMUZK', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibmM4UWZhM0RrWDBsNWpvbUx5MU1hRjAwcE02anM1OThHa0ZmSDhOZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773624325),
('cWULHmOO2bbBnryVdnSs7cc27KABZZo8glVbDTex', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoic1hVY1B4YTR2TDVlMHJORVNqM0FkWFJiQlFSMGFjUm1vTUpYNkRnSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773444057),
('dc4ecyFTqxSTwxyx31KY3RjzvbwAF00VsRxsba9O', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR3JYSWV6bURBMlFxUTF0emhHY1JTRmYxOXZSV0w3YloyeFZZaXpFUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773406970),
('DktexdtyIE3kPvkFXh6se4nPxGhs2MMA0JCgzuta', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaUY0WklXY2xGcFdocjUwaTFNTU1KVEFHUkQxWEEwQmthdHlqMDlxRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773405897),
('e3zeiXuQz82vgaD45Uk9rzbL3umxesGpcoI2mGTv', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMnAzYmptV25FTUVkZEVwYWhwMTYxaEVQQmFSZ3E1Zm1IYnJjdXRBQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773405880),
('eaZO3uLwwGUOBLTwJlYxo1Va1FuuUSwSJxGipzuQ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaExPRUNhSGJ5TDBjY1dVdDRLMGtqTUZFYlF0Skt3TE9tb3VGV3lrMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773663704),
('F17G29YpxXTj0xOZRq7KGaCPVSb6UyFf2KwpKzgJ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidkVPZnVzb05ZQ2RQMFEyNVpOa2FMS0VOVW9COFM2ZmVyYU0yQXV0biI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773663880),
('F7is9yXVBh3rkhFOc2G86Ozd61cq705m6sgo2cyr', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMDhUWVpnVVVhUnVoZjRMYTl0dnpPb0NCejlYWWJrUlJhUjdTcnUyUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773446035),
('faLRZWcZActk6I48AFGtrefDljwCvpT7z5B3mwsN', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMFhRTFlFMngxaVF4SGhiR0hXUTZrSWplUTF4bjBTaE9NQ1NrWWFxWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773406572),
('FMts9vpc6nlWR1jjhoLUea1UiCxGvcD66tTqSXct', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEJDd2JYTHlubDdvSE84TlVIQzFINkZYZkw1OXAzZ3czdW9wdFY0dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo1OiJpbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1773660700),
('FQYdqWJvDO3rJaw9EN6tapgpuJB8EJtAu71Cx4Aw', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVHNuY2dMQXcycnJ1eUQ3QkJqZWpFdG5oRjVVaHpXQTZ0aHF4TXMzRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773405784),
('gXF6apQCrUud1hRaDhLmikbogPJaVw9KTO9z0bSw', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOUlPODJkZjV4MWphUTNmcVFtTVFqUzRWNnlkTUVEWDE3TG1UZzhkOSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1773356234),
('hCmJKQsC8noaA1LRpbNNyWjEawDAhP7PbIVgYb21', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTWdRd2J5WWxCYWJBbU5tZlZQd3NQZXdWSjZ6Qmk2dWZjc0FFTWp3SyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1773591334),
('hgJE1th18wiVgNoCjpd0hbcBhJimRtv2AAixO549', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTXhKV1E1bnBEVDJaTG00c21VQ1VTZnREQU5VaUNwcEQ5bWJKc3U2aSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773407116),
('icAHuW4QgAxoe11IpIS1zUFyskfjasa15YxcF69u', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTEFFWmo0MnpZUWROcjg4NlBKa1pRZDB0OFJxcW9ieFFUMFIxWUw2QyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1773353643),
('iMghw8VWzRDk9exE2WLr8apXOGe3rlF3Z8W0ChyT', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUXBBa1ZpekNCRFY5bzROSE9XZzdKaUd0V2dsckJKMWlWYWlpdTJTWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773444215),
('IsQJLpJWShyIQrZh4AuZ1R1lyH19WRGHk46Dwzow', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMERDT2RLYU9JZmJsWmNmNng2cGZib2pxejFKdmRDdDhWUFNCVVdsOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773426668),
('jN07lxBb31gXHDqT6fxElyJgHhYzYA8lPufrRByu', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN0ZFampDRWlHUlUweHpLQ2p4RldheWdtS3lib0xjd1haaWEyTVBjUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773443835),
('jROZ79r6MPLCTnu7KsZb7ru85qz2bHc2IVOcruca', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYUY4bFBrRENuejNhc0N0NXJ2dEdWWkFlMkVVR3N5WloxNUNqaEFwdSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1773405767),
('L7EccKmtQHtiyNvLEqKRpBNEshWYKlgAVyDPnT2H', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVk9GRVJkNmFyOXJOZU56RzhIQjZPbnUyTGh4dkhaM0NSRG53MDd1SSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773356347),
('L7Huzew9aOfLDfrwGukpUPrfZ1VoKHMP46J9iY9q', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSHhmU0ZZb2Y2cWRneTlVMGRiVHBvMFZDWmR0QmltdGl2NTlQQm5KZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773354239),
('l7KRoqNzd9fHsRyYhkndK1NbaRJQw4bq6ToLI2al', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWDVuYzJIRGU3YkRxREVVdTB0NTdsTjdPdGxSMmVwU01lQjQ2b2dFZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773405927),
('LHlMYMz0CeYYvUZKao8fN8Nm47Y0ptjSgICE6eoS', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoic3JwcUhGYlI2YTF3a3lOSHVsakNlVnR5ejlPUUVUZTllaWRMNUVGdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773354271),
('mUhNcxwyVTNuFniMhBFbeDV5GXAy0bQ4bJR5MSfb', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZXNveXZVZFd1akl3ZkowSnd0QTlyVmxLWmdBdW9iWXZ4R0hvZnl2bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773591350),
('mUp9bgy3OnzH6ULUYZk14dBHIFH1oLkMrUciF1IT', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUkdubndRaFV6ZEdLcEhmSU9kcDhtWDJXRENtY0lEZThOOGtjeEEwRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773407244),
('nIIpXRt5AqpUZXR78yGfITzUj4HMnsi2NYFPQa7T', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibU11S1NaTHhlNTZSQXpQQ0twQnhiUW9jWmVUQ1Z3eXlnWnluYTBmTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773663313),
('NWAXZZwKREAtfPJJz1Ew9yjQIIDvarOa9DYP5MWq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiemZDdkJnaGQxelBhVHNmWFRaZWF2OTM4YUd1UGRyS0VuTWpLVWNWWiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1773406585),
('olYf1anJ3F2sVF1ESJpHVrmp1GgKddt6QsqpG4DX', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaVlMU3pzRmh3UjRhVG1aYTdaSDlJM1RjMVZSdERKdmJQSjZENE9VVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773663046),
('on60EyYsY80ozHbR3px3DTrnhno9pxsyUejjPDmX', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY0d3ZWpJNUhwS3lUYnAwVVVjVUJmbzQxQjBaSmNzS2gxc3BqcVM3dyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773444239),
('oozcRepI9nYxrlyae8qCbqFs0MezUtSooXcJqx9t', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRWdQempxZlRORHRWdVJBY2V2cjU3dDAybzFJRU9RUlpMMTc2OEhBQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773663949),
('oYnryEMrIqxMGJvUVf34dEbSiaWhB2yCsZrscQmu', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUXFXc05qMkV5WlhCenJwcXA3cTFvSFVTYVFXaGZrekZvZkhMcmdjeCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773591378),
('P19WXEHvZINtKRjFkaxPgDmBM8SKxJnrUQIxVgd2', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTB3V3Z4MGd0aTc0RkNOcWVsTHZOQ0JFTXNkWWx2OFBYZzBaQ2N5QiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZXZlbnRpZnkudGVzdCI7czo1OiJyb3V0ZSI7czo1OiJpbmRleCI7fX0=', 1773621968),
('PLM3C3CNh2WHqYUiN7646tfdc5KXt8vUzGf2Q6zA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidGJCQlZidTVLNWlHQWhGYWhCeTlxQ2M4bXhGb3E5cTlMd3luQ1ZPNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773354425),
('RJ05TXvLlo0lIq2RSQ7orRjIV7MN4jzopnJt9oJ5', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSUtuMEZmZlVSVWNCdkNnazNLaHpLcGZyaWFmN1Y1ajdmT1ZQZmJ0RCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773663491),
('RSFjHYub5rt8nT3WMO6H7MmfOF1yWoYLRrmAaxeL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUmtVdFU3S1ByNmR6bWo5MU1wUkRRZnFGYTlPZVZXcEIzeUhsVVZidiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773353904),
('s5PjZQ5PzYBTuYrRICzfDwBEY0iGYrDONKyAgk65', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicTVTWE9kRlRFMjFtT2R2S2FZejlWTVBNUktFcGhnR0dkeGozTjF6NCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773660895),
('sswJdzR1eKrD92Nsgj7LHwq0rj59BwYOV1ESxNjJ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN3FKdTJFTmtrbHlsNmthaW1haVpzOXY4cjVObW1KMWNjRGVHY3NkdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773354721),
('t5B5Dnzfo4aeM3TO90YUAJ85SpxGDiw8GVgL43t2', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMXdPN3lUS3FBODhtVVFBNXFWUDh2QXhpaVIzM0NITkQ5ek80blhHaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773664036),
('TA7lqAtUaundtWra8CiL1yl6y9yolAqbAzrHNwgt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZENaSjg0NWtGRlQ1S1djdlk3S2tpckdkd09MNlhPa2pTRGZLcW1GbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZXZlbnRpZnkudGVzdCI7czo1OiJyb3V0ZSI7czo1OiJpbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774131716),
('ToNoYPd74e1esJbsRRbutm1FDilYMIyZouTWzEGc', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibmVTRkV3TjMzZW04aXcwMDdWdmJvdUhWZWp1TGxadXNqeUI0OXU4YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773443408),
('uAqkh1yaGh6dc4YXpNynbpJ4BoaDYvTJGQtAPXjc', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQXBNam5uSUhMcVZ2SEhrcE5jRzNVVldocFRhUFZ4ZFpFWEpLd1lubyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vZXZlbnRpZnkudGVzdC9wcmVuZHJlIjtzOjU6InJvdXRlIjtzOjEzOiJwcmVuZHJlLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1773419332),
('umnse95Il2ESv2FLtla68QPj2evKBR7yjuD3k0FU', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUEs2TTZramo3Y0E3Mm42SU9LNWxjaWtLRlJET05FRmdPUlRSWGdDYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773353994),
('UMxCfzLTZ0YBnw7lntH7J87JltlBjVBwd1wSeG57', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVjNaWVVhU29MMWNlbjJNNU9GZXpuYjVLRjY1alFId0N5NXo1NENkMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773443565),
('wPAPloiBU074GfNkPD5tlXiB0SDaf7tfPtT72D2v', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicjZpOHg5ZUp6Y3pHTkt2UTM3R3lTYW45YlBXRnd5WHo3Znc4YjJoUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773592154),
('WqTy3MZZJrNSSWqnmKmlu6nZ1OR4xPtxRGFUZx8j', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOVg1MGw2cXEyMWhSZVZhS1BpZjYwY3I3Tlg4RWRBeHBrcGY4TVBJdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773407334),
('xICBgCGyAgfunowQyqNvHrBQFbB03Qs12jpqepHw', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicVRHWHNmV0pWUm5BNk90THFqbkJ5UzZZaW0yS1QyYmsyUlhVbkpUQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773354251),
('xsMbdc3kbuB7XwleL3dNoSRaFWifG2QPssesnuO9', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZW1XQk5vREo0eVR3Nlc0Vnp5QUJLMG43WDQ4OUN0WGtOWVpWdllmQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773443065),
('yAd65Uxpxb7SDGjFW4NuW4jVFU6EoKBanFvzMc3M', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOE9ET1JGZ25YOW41U3FZWUNabEttQ0tjTnFvejZCVUJObDZ0bUdxZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773354678),
('ybDlqBqUcJ6q3OZ53uKpUsAbu7oVBg951LKKrLsh', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibENReW1NdHozMktSSU9tU1Nad0R0a1F5cHhmWFhxR2REY2luenplMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3BhZ2VFdmVudCI7czo1OiJyb3V0ZSI7czoxNToicGFnZUV2ZW50LmluZGV4Ijt9fQ==', 1773663665),
('YUL2J6zZPSsOzwcwA9ko2JKkC3dfqCGrB2PYg71J', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYnB3bzlGUzcyREtlMDEwS0ZuWHJ6Y0gyMzk2UGk1ZHptNEpDNk1ONSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773591345),
('yZKIe21Cw1GFOsjuftFUJnJtktJNReSclDOKqF9W', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMzRwRnhneW5hU0czQUZUMmJsQ0FQdHhTZzBWb2lMTkZBYlFTS255MyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1773353582),
('Zf1OoWPN1b5a7XVeuQyqieKqTMNcrqMcgcyCFRCm', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUmliaHpRVmthQkFyQjhyNVdGbWVOb0dEbTBXbHFHNDBWdXkyWFZUeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ldmVudGlmeS50ZXN0L3ByZW5kcmUiO3M6NToicm91dGUiO3M6MTM6InByZW5kcmUuaW5kZXgiO319', 1773529768);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint UNSIGNED NOT NULL,
  `shop_domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `shop_domain`, `access_token`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'eqpca6-z4.myshopify.com', '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', 1, '2026-02-25 14:58:01', '2026-02-25 16:57:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pays` int DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `last_name`, `first_name`, `name`, `id_pays`, `ville`, `email`, `phone`, `role_id`, `last_login_at`, `email_verified_at`, `password`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Morjani', 'Mounir', 'Admin', NULL, NULL, 'mounirmorjani@gmail.com', '0666666666', 1, '2026-02-04 19:44:17', NULL, '$2y$12$lXKsICYCBFvjkerbk1NKXeGPVSRGh/4dk9Wssv.83DJPUl6Qto4eK', NULL, 'qllbag6U0jrNwnElHN4OtxZ8dAD3uY7NcE1bexeMeIXQiVa0GmzJMbJWSPob', '2026-02-03 19:37:11', '2026-02-03 19:37:11'),
(2, 'Abdo', 'Mohamed', 'Mohamed', NULL, NULL, 'mohamed@example.com', NULL, 3, NULL, NULL, '$2y$12$wpN5Px8PRNTw9pnube5GuunsIW0IQsaSNezC9Qxpa8gSWyUw4F4ie', NULL, NULL, '2026-02-24 22:42:08', '2026-02-24 22:42:08'),
(3, NULL, NULL, NULL, NULL, NULL, 'elboutifatimazahra555@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$sIQ2g3O3eQaq96/aVok5nuugjZP7gmDdvol5isW5wNevEAx6uC71W', NULL, NULL, '2026-03-09 12:33:05', '2026-03-09 12:33:05'),
(4, 'El bouti', 'Fatima', NULL, 2, 'fes', 'elboutifatimazahra555@gmail.comj', NULL, NULL, NULL, NULL, '$2y$12$4rre3WFaX5H3Xk7wRubKLOYp0cOe//ymyLhxknwe34TTcVWSgv2QS', NULL, NULL, '2026-03-09 12:33:53', '2026-03-09 12:33:53'),
(5, 'el bouti', 'imane', 'testtesttt', 3, 'snckdjsn', 'imane@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$En2P23GOKf793Ve9WFM.Wunqh.w6Nl71qhSmzPiH3Gmg99T9nZbNK', NULL, NULL, '2026-03-09 12:52:48', '2026-03-09 12:52:48'),
(6, 'El bouti', 'Fatima', 'El bouti', 5, 'fes', 'elboutifatimazahr@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$HA5OFEvvvPqwD7E5kwpfMu25CoJ3pSVWJc16vBaHOCh53fSDWxkTC', NULL, NULL, '2026-03-09 12:56:07', '2026-03-09 12:56:07'),
(7, 'karimi', 'amal', 'karimi', 4, 'fes', 'karimi@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$SvXvdjbWGkgbLNs0hFEWY.lbnYM9d87j.wav3pc5xsGZtEjQ41C8e', NULL, NULL, '2026-03-09 15:38:24', '2026-03-09 15:38:24'),
(9, 'bakali', 'mohamed', 'bakali', 2, 'casa', 'mohamed@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$W2OjPHOGhLYsCwxJiaNKKOxElPHeIL141BA87Io5aE/XgqwbxFIyK', NULL, NULL, '2026-03-09 16:56:36', '2026-03-09 16:56:36'),
(13, 'gbggr', 'gtrgkr,gk', 'gbggr', 3, 'hb,rkg,bhkrh', 'thtrkg@gebgke.thtr', NULL, NULL, NULL, NULL, '$2y$12$3d4duY6g1EnaGrRWkMmkK.e8RBRKCa0CkF0gMK4NBoWmViiJzQDt2', NULL, NULL, '2026-03-09 17:25:52', '2026-03-09 17:25:52'),
(14, 'ferfref', 'rfreref', 'ferfref', 5, 'ferer', 'vfevrfv@vrvrv.rvrv', NULL, NULL, NULL, NULL, '$2y$12$YXAHBZl4gi302UHX8V6.Uuiof6GRMtkXbVcq7d/arqQ5PWBNsXWTu', NULL, NULL, '2026-03-09 17:48:56', '2026-03-09 17:48:56'),
(15, 'kasimi', 'yassin', 'kasimi', 4, 'casa', 'kasimi@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$bEyfCbSSvY5JtEWQ3cG3IecYhCetcfcPK0AbjGbUCXAFgNzMMx/ue', NULL, NULL, '2026-03-10 14:07:25', '2026-03-10 14:07:25'),
(16, 'kasimi', 'kamal', 'kasimi', 4, 'casa', 'kamal@gmail.com', NULL, 2, NULL, NULL, '$2y$12$FTO808pMCjxHa9i3p0kFwufJq5x/Xw/.MxznOqWkNvjeR8eIe87gq', NULL, NULL, '2026-03-10 14:09:31', '2026-03-10 14:09:31'),
(26, 'ekljlez', 'fjdjnjknkcd', 'ekljlez', 4, 'dnldnldkn', 'dkkf@bdjkbk.dndf', NULL, 2, NULL, NULL, '$2y$12$dzN0hwN3WpzGO53ITONfP.rV/6mcWSW.ZSgrzRkXOUM7ME9PnEytG', NULL, NULL, '2026-03-10 14:58:15', '2026-03-10 14:58:15'),
(27, 'kasim', 'ahmad', 'kasim', 4, 'dsnk,s', 'ahmad@gmail.com', NULL, 2, NULL, NULL, '$2y$12$mwbdHHKBYvVMGgyd3B2rD.naRy1ezpZdjl8Mu4g05gt..h2hU36rW', NULL, NULL, '2026-03-10 15:01:25', '2026-03-10 15:01:25'),
(28, 'hachimi', 'ahlam', 'hachimi', 3, 'fes', 'hachimi@gmail.com', NULL, 2, NULL, NULL, '$2y$12$pZ8CNH7OR8BFSnxaTZbCmOIqMxrP8QeaTNdWhVJvx1BL.12X1F6Gi', NULL, NULL, '2026-03-12 17:33:40', '2026-03-12 17:33:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_shopify_categorie_id_index` (`shopify_categorie_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_user_id_index` (`user_id`);

--
-- Indexes for table `medias`
--
ALTER TABLE `medias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medias_mediaable_id_mediaable_type_index` (`mediaable_id`,`mediaable_type`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_shopify_order_id_index` (`shopify_order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_index` (`order_id`);

--
-- Indexes for table `order_no_responses`
--
ALTER TABLE `order_no_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `permissions_old`
--
ALTER TABLE `permissions_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `prendre_rdv`
--
ALTER TABLE `prendre_rdv`
  ADD PRIMARY KEY (`id_rdv`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles_first`
--
ALTER TABLE `roles_first`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_key_unique` (`key`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shops_shop_domain_unique` (`shop_domain`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `evenements`
--
ALTER TABLE `evenements`
  MODIFY `id_event` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `medias`
--
ALTER TABLE `medias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_no_responses`
--
ALTER TABLE `order_no_responses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions_old`
--
ALTER TABLE `permissions_old`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prendre_rdv`
--
ALTER TABLE `prendre_rdv`
  MODIFY `id_rdv` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles_first`
--
ALTER TABLE `roles_first`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
