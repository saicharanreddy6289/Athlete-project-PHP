-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 03, 2020 at 10:50 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Athlete`
--

CREATE TABLE `Athlete` (
  `Athlete_id` int(11) NOT NULL DEFAULT 0,
  `Athlete_Name` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Athlete`
--

INSERT INTO `Athlete` (`Athlete_id`, `Athlete_Name`, `age`, `location_id`) VALUES
(3, 'remo', 25, 3),
(4, 'julie', 26, 4),
(5, 'aravind', 23, 5),
(6, 'john', 24, 6),
(7, 'remo', 25, 7),
(8, 'julie', 26, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Location`
--

CREATE TABLE `Location` (
  `Location_id` int(11) NOT NULL DEFAULT 0,
  `City` varchar(30) NOT NULL,
  `Province` varchar(30) NOT NULL,
  `Country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Location`
--

INSERT INTO `Location` (`Location_id`, `City`, `Province`, `Country`) VALUES
(3, 'halifax', 'NS', 'Canada'),
(4, 'toronto', 'ontario', 'Canada'),
(5, 'halifax', 'NS', 'Canada'),
(6, 'toronto', 'ontario', 'Canada'),
(7, 'halifax', 'NS', 'Canada'),
(8, 'toronto', 'ontario', 'Canada');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Athlete`
--
ALTER TABLE `Athlete`
  ADD PRIMARY KEY (`Athlete_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`Location_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Athlete`
--
ALTER TABLE `Athlete`
  ADD CONSTRAINT `Athlete_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `Location` (`Location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
