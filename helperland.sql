-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2022 at 11:33 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helperland`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `add_id` int(11) NOT NULL,
  `street_name` varchar(30) NOT NULL,
  `house_no` varchar(10) NOT NULL,
  `postal_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(20) NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `l_name` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blocked_customer`
--

CREATE TABLE `blocked_customer` (
  `block_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `card_details`
--

CREATE TABLE `card_details` (
  `card_no` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `cvv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `postal_code` int(11) NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `l_name` varchar(15) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `DoB` date NOT NULL,
  `language` tinyint(1) NOT NULL,
  `add_id` int(11) NOT NULL,
  `favh_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `favh_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `helper`
--

CREATE TABLE `helper` (
  `h_id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `l_name` varchar(15) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `DoB` date NOT NULL,
  `nationality` tinyint(1) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `add_id` int(11) NOT NULL,
  `blockc_id` int(11) DEFAULT NULL,
  `rating_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `p_id` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `ammount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `refund`
--

CREATE TABLE `refund` (
  `refund_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reschedule`
--

CREATE TABLE `reschedule` (
  `reschedule_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `add_id` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `callcenter_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `s_id` int(11) NOT NULL,
  `s_date` date NOT NULL,
  `s_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `s_duration` time NOT NULL,
  `c_id` int(11) NOT NULL,
  `inside_cabinet` tinyint(1) DEFAULT NULL,
  `inside_fridge` tinyint(1) DEFAULT NULL,
  `inside_oven` tinyint(1) DEFAULT NULL,
  `inside_wash` tinyint(1) DEFAULT NULL,
  `inside_window` tinyint(1) DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL,
  `pet` tinyint(1) DEFAULT NULL,
  `add_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL,
  `ammount` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `p_id` int(11) NOT NULL,
  `reschedule_id` int(11) DEFAULT NULL,
  `refund_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`add_id`),
  ADD KEY `postal_code_fk` (`postal_code`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `blocked_customer`
--
ALTER TABLE `blocked_customer`
  ADD PRIMARY KEY (`block_id`),
  ADD KEY `c_id_fk` (`c_id`);

--
-- Indexes for table `card_details`
--
ALTER TABLE `card_details`
  ADD PRIMARY KEY (`card_no`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`postal_code`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `add_id_fk` (`add_id`),
  ADD KEY `favh_id_fk` (`favh_id`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`favh_id`),
  ADD KEY `h_id_fk` (`h_id`);

--
-- Indexes for table `helper`
--
ALTER TABLE `helper`
  ADD PRIMARY KEY (`h_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `add_id_fk` (`add_id`),
  ADD KEY `blockc_id_fk` (`blockc_id`),
  ADD KEY `rating_id` (`rating_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `card_no_fk` (`card_no`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `s_id_fk` (`s_id`),
  ADD KEY `c_id_fk` (`c_id`);

--
-- Indexes for table `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `p_id_fk` (`p_id`);

--
-- Indexes for table `reschedule`
--
ALTER TABLE `reschedule`
  ADD PRIMARY KEY (`reschedule_id`),
  ADD KEY `s_id_fk` (`s_id`),
  ADD KEY `add_id_fk` (`add_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `c_id_fk` (`c_id`),
  ADD KEY `add_id_fk` (`add_id`),
  ADD KEY `h_id_fk` (`h_id`),
  ADD KEY `p_id_fk` (`p_id`),
  ADD KEY `reschedule_id_fk` (`reschedule_id`),
  ADD KEY `refund_id` (`refund_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `add_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blocked_customer`
--
ALTER TABLE `blocked_customer`
  MODIFY `block_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `postal_code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `favh_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `helper`
--
ALTER TABLE `helper`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund`
--
ALTER TABLE `refund`
  MODIFY `refund_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reschedule`
--
ALTER TABLE `reschedule`
  MODIFY `reschedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`postal_code`) REFERENCES `city` (`postal_code`);

--
-- Constraints for table `blocked_customer`
--
ALTER TABLE `blocked_customer`
  ADD CONSTRAINT `blocked_customer_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`add_id`) REFERENCES `address` (`add_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`favh_id`) REFERENCES `favourite` (`favh_id`);

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `favourite_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `helper` (`h_id`);

--
-- Constraints for table `helper`
--
ALTER TABLE `helper`
  ADD CONSTRAINT `helper_ibfk_1` FOREIGN KEY (`add_id`) REFERENCES `address` (`add_id`),
  ADD CONSTRAINT `helper_ibfk_2` FOREIGN KEY (`blockc_id`) REFERENCES `blocked_customer` (`block_id`),
  ADD CONSTRAINT `helper_ibfk_3` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`card_no`) REFERENCES `card_details` (`card_no`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `service` (`s_id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`add_id`) REFERENCES `address` (`add_id`),
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`),
  ADD CONSTRAINT `service_ibfk_3` FOREIGN KEY (`h_id`) REFERENCES `helper` (`h_id`),
  ADD CONSTRAINT `service_ibfk_4` FOREIGN KEY (`p_id`) REFERENCES `payment` (`p_id`),
  ADD CONSTRAINT `service_ibfk_5` FOREIGN KEY (`refund_id`) REFERENCES `refund` (`refund_id`),
  ADD CONSTRAINT `service_ibfk_6` FOREIGN KEY (`reschedule_id`) REFERENCES `reschedule` (`reschedule_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
