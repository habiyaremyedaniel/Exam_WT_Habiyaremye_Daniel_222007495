-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 09:39 AM
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
-- Database: `home_automation_control_systems`
--

-- --------------------------------------------------------

--
-- Table structure for table `automation_rules`
--

CREATE TABLE `automation_rules` (
  `ruleid` int(11) NOT NULL,
  `rulename` varchar(255) DEFAULT NULL,
  `trigger_event` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `deviceid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `automation_rules`
--

INSERT INTO `automation_rules` (`ruleid`, `rulename`, `trigger_event`, `action`, `deviceid`, `userid`) VALUES
(1, 'Turn on lights when motion detected', 'motion detected', 'turn on lights', 1, 1),
(2, 'Adjust thermostat at night', 'time of day (night)', 'set temperature to 68°F', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `deviceid` int(11) NOT NULL,
  `devicename` varchar(255) DEFAULT NULL,
  `devicetype` varchar(50) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`deviceid`, `devicename`, `devicetype`, `location`, `status`, `lastupdated`) VALUES
(1, 'Living Room Light', 'light', 'Living Room', 'on', '2024-04-09 05:52:01'),
(2, 'Kitchen Thermostat', 'thermostat', 'Kitchen', 'off', '2024-04-09 05:52:01');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventid` int(11) NOT NULL,
  `eventtype` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventid`, `eventtype`, `description`, `timestamp`) VALUES
(1, 'System Startup', 'System started up successfully', '2024-04-09 05:54:00'),
(2, 'Device Failure', 'Living room light malfunctioned', '2024-04-09 05:54:00'),
(3, 'temp', 'Turn off lights', '2024-05-02 14:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity_available` int(11) NOT NULL,
  `quantity_sold` int(11) DEFAULT NULL,
  `reorder_threshold` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `product_id`, `quantity_available`, `quantity_sold`, `reorder_threshold`, `created_at`) VALUES
(1, 1, 50, 10, 20, '2024-05-07 17:38:04'),
(2, 2, 30, 5, 15, '2024-05-07 17:38:04'),
(3, 3, 40, 8, 18, '2024-05-07 17:38:04'),
(4, 4, 60, 15, 25, '2024-05-07 17:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `logid` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `userid` int(11) DEFAULT NULL,
  `deviceid` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`logid`, `timestamp`, `userid`, `deviceid`, `action`) VALUES
(1, '2024-04-09 05:52:58', 1, 1, 'turned on lights'),
(2, '2024-04-09 05:52:58', 1, 2, 'adjusted temperature'),
(3, '2024-05-02 13:43:01', NULL, 1, 'turn off'),
(4, '2024-05-02 14:37:17', NULL, 1, 'turn off');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notificationid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notificationid`, `userid`, `message`, `timestamp`) VALUES
(1, 1, 'Motion detected in the living room', '2024-04-09 05:53:45'),
(2, 1, 'Temperature set to 72°F', '2024-04-09 05:53:45'),
(3, 6, 'temperatures22% is too low in light', '2024-05-22 17:39:29'),
(4, 6, 'temperatures94% is too HIGH  in light', '2024-05-22 17:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` date NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','shipped') NOT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_price`, `status`, `shipping_address`, `created_at`) VALUES
(1, 1, '2024-05-01', 3498.00, 'pending', 'kigali City, Country', '2024-05-07 17:32:22'),
(2, 2, '2024-05-02', 2999.00, 'shipped', 'musanze city, Town, Country', '2024-05-07 17:32:22'),
(3, 3, '2024-05-03', 999.00, 'pending', 'huye city, Village, Country', '2024-05-07 17:32:22'),
(4, 4, '2024-05-04', 7999.00, 'shipped', 'nairobi, Hamlet, Country', '2024-05-07 17:32:22'),
(5, 1, '2024-05-07', 597.00, 'pending', 'kigali ', '2024-05-07 19:58:50'),
(6, 1, '2024-05-08', 4500.00, 'pending', 'kigali ', '2024-05-08 12:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permissionid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `deviceid` int(11) DEFAULT NULL,
  `permissiontype` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permissionid`, `userid`, `deviceid`, `permissiontype`) VALUES
(1, 1, 1, 'control'),
(2, 1, 2, 'read-only'),
(3, 2, 2, 'allowed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `material` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `category`, `price`, `material`, `image_url`, `created_at`) VALUES
(1, 'Organic Cotton Onesie', 'Soft and comfortable onesie for babies', 'Clothing', 199.9, 'Organic Cotton', 'https://example.com/onesie.jpg', '2024-05-07 17:16:57'),
(2, 'Natural Wooden Rattle', 'Handcrafted wooden rattle toy for infants', 'Toys', 149.9, 'Wood', 'https://example.com/rattle.jpg', '2024-05-07 17:16:57'),
(3, 'Bamboo Swaddle Blanket', 'Breathable and eco-friendly blanket for newborns', 'Bedding', 299, 'Bamboo', 'https://example.com/blanket.jpg', '2024-05-07 17:16:57'),
(4, 'Organic Baby Hat', 'Adorable hat made from organic materials', 'Accessories', 999, 'Organic Cotton', 'https://example.com/hat.jpg', '2024-05-07 17:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review_text` text DEFAULT NULL,
  `review_date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `product_id`, `customer_id`, `rating`, `review_text`, `review_date`) VALUES
(1, 1, 1, 5, 'Great quality onesie! Very soft and well-made.', '2024-05-05'),
(2, 2, 2, 4, 'Lovely rattle, my baby enjoys playing with it.', '2024-05-06'),
(3, 3, 3, 5, 'Absolutely love this blanket! So cozy and eco-friendly.', '2024-05-07'),
(4, 4, 4, 5, 'Cute and comfortable hat. Fits perfectly on my baby.', '2024-05-08'),
(5, 1, 1, 9, 'cut trauser', '2024-05-07');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roomid` int(10) NOT NULL,
  `roomname` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roomid`, `roomname`, `description`) VALUES
(1, 'benghazi', 'Turn off lights'),
(2, 'Kitchen', 'Place for cooking and dining'),
(3, 'linda', 'Turn off lights'),
(4, 'linda', 'Turn off lights'),
(5, 'benghazi', 'Turn off lights'),
(6, 'linda', 'Turn off lights'),
(7, 'tumba2', 'Turn on lights');

-- --------------------------------------------------------

--
-- Table structure for table `scenes`
--

CREATE TABLE `scenes` (
  `sceneid` int(50) NOT NULL,
  `scenename` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `active` tinyint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scenes`
--

INSERT INTO `scenes` (`sceneid`, `scenename`, `description`, `active`) VALUES
(1, 'Evening Relaxation', 'Turn on lights', 1),
(2, 'Evening Relaxation', 'Turn off lights', 1),
(3, 'Evening Relaxation', 'Turn on lights', 80);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settingid` int(20) NOT NULL,
  `settingname` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settingid`, `settingname`, `value`) VALUES
(1, 'Living Room Light', 'ON'),
(2, 'kitchenware ', '50'),
(4, 'Security System', 'Armed'),
(5, 'Temperature', '90%'),
(6, 'Temperature', '90%');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `name`, `contact_person`, `email`, `phone_number`, `address`, `created_at`) VALUES
(1, 'Organic Textiles Inc.', 'emile', 'info@organic-textiles.com', '0727665433', 'musanze', '2024-05-07 17:37:17'),
(2, 'Wooden Wonders Co.', 'Bob Carpenter', 'bob@wooden-wonders.com', '0725334211', 'kigali city', '2024-05-07 17:37:17'),
(3, 'EcoFabrics Ltd.', 'Emmy', 'emma@ecofabrics.com', '0791291546', 'huye city', '2024-05-07 17:37:17'),
(4, 'SoftTouch Materials', 'Sam Brown', 'sam@softtouchmaterials.com', '0794567890', 'rubavu', '2024-05-07 17:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `firstname`, `lastname`, `email`, `role`) VALUES
(1, 'jack', 'password123', 'jack', 'maniraguha', 'jack@gmail.com', 'standard'),
(2, 'daniel', 'password456', 'daniel', 'habiyaremye', 'habiyaremyedaniel2021@gmail.com', 'admin'),
(3, 'Germany ', '1234556789', 'geremy', 'habiyaremye', 'chris@gmail.com', 'super user'),
(4, NULL, '1234', 'daniel', 'habiyaremye', 'tuyisengesilas9@gmail.com', 'super user'),
(5, 'Daniel', '1234', 'daniel', 'habiyaremye', 'habiyaremyedaniel2021@gmail.com', 'super user'),
(6, 'photide', '12345', 'niyonambaza', 'photide', 'fodite@gmail.com', 'super user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `automation_rules`
--
ALTER TABLE `automation_rules`
  ADD PRIMARY KEY (`ruleid`),
  ADD KEY `deviceid` (`deviceid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`deviceid`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventid`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `deviceid` (`deviceid`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notificationid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permissionid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `deviceid` (`deviceid`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomid`);

--
-- Indexes for table `scenes`
--
ALTER TABLE `scenes`
  ADD PRIMARY KEY (`sceneid`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settingid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `automation_rules`
--
ALTER TABLE `automation_rules`
  MODIFY `ruleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `deviceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eventid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notificationid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permissionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roomid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `scenes`
--
ALTER TABLE `scenes`
  MODIFY `sceneid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settingid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `automation_rules`
--
ALTER TABLE `automation_rules`
  ADD CONSTRAINT `automation_rules_ibfk_1` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`deviceid`),
  ADD CONSTRAINT `automation_rules_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`deviceid`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`deviceid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
