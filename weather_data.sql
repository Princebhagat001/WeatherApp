-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql202.infinityfree.com
-- Generation Time: Jan 31, 2026 at 03:30 AM
-- Server version: 11.4.9-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_41002515_weather_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `weather_data`
--

CREATE TABLE `weather_data` (
  `id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL,
  `temperature` float NOT NULL,
  `weather_condition` varchar(100) NOT NULL,
  `weather_description` varchar(100) NOT NULL,
  `humidity` int(11) NOT NULL,
  `wind_speed` float NOT NULL,
  `wind_deg` int(11) NOT NULL,
  `pressure` int(11) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `timezone` int(11) NOT NULL,
  `dt` int(11) NOT NULL,
  `weather_date` date NOT NULL,
  `last_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `weather_data`
--

INSERT INTO `weather_data` (`id`, `city`, `country`, `temperature`, `weather_condition`, `weather_description`, `humidity`, `wind_speed`, `wind_deg`, `pressure`, `icon`, `timezone`, `dt`, `weather_date`, `last_updated`) VALUES
(1, 'North Lanarkshire', 'GB', 3.36, 'Rain', 'light rain', 87, 9.62, 93, 989, '10n', 0, 1769494179, '2026-01-27', '2026-01-27 06:10:30'),
(3, 'LahÄn', 'NP', 23.59, 'Clouds', 'broken clouds', 39, 2.37, 163, 1019, '04d', 20700, 1769493092, '2026-01-27', '2026-01-27 06:02:52'),
(21, 'North Lanarkshire', 'GB', 5.03, 'Clouds', 'overcast clouds', 89, 5.52, 72, 995, '04n', 0, 1769846982, '2026-01-31', '2026-01-31 08:09:42'),
(7, 'Lumbini', 'NP', 21.72, 'Clouds', 'scattered clouds', 43, 2.49, 134, 1020, '03d', 20700, 1769493613, '2026-01-27', '2026-01-27 06:00:13'),
(20, 'Biratnagar', 'NP', 15.88, 'Clouds', 'few clouds', 62, 1.59, 298, 1018, '02n', 20700, 1769790988, '2026-01-30', '2026-01-30 16:44:26'),
(9, 'Dublin', 'US', 7.64, 'Mist', 'mist', 83, 2.57, 50, 1025, '50n', -28800, 1769494066, '2026-01-27', '2026-01-27 06:09:45'),
(10, 'North Lanarkshire', 'GB', 4.1, 'Clouds', 'overcast clouds', 85, 6.01, 96, 990, '04d', 0, 1769791151, '2026-01-30', '2026-01-30 16:39:11'),
(19, 'Palpa', 'PE', 30.52, 'Clear', 'clear sky', 43, 2.64, 213, 1011, '01d', -18000, 1769791448, '2026-01-30', '2026-01-30 16:44:08'),
(18, 'Norway', 'US', -13.59, 'Clouds', 'overcast clouds', 75, 6.17, 340, 1035, '04d', -21600, 1769791433, '2026-01-30', '2026-01-30 16:43:53'),
(17, 'Kathmandu', 'NP', 11.12, 'Mist', 'mist', 82, 1.03, 0, 1020, '50n', 20700, 1769791044, '2026-01-30', '2026-01-30 16:41:55'),
(14, 'LahÄn', 'NP', 17.06, 'Clouds', 'broken clouds', 59, 1.75, 341, 1017, '04n', 20700, 1769782254, '2026-01-30', '2026-01-30 14:10:54'),
(15, 'ButwÄl', 'NP', 15.45, 'Clouds', 'broken clouds', 75, 1.39, 15, 1019, '04n', 20700, 1769790482, '2026-01-30', '2026-01-30 16:28:02'),
(16, 'Bharatpur', 'IN', 14.3, 'Clouds', 'overcast clouds', 52, 1.3, 113, 1018, '04n', 19800, 1769790511, '2026-01-30', '2026-01-30 16:28:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `weather_data`
--
ALTER TABLE `weather_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date_city` (`city`,`weather_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `weather_data`
--
ALTER TABLE `weather_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
