-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2016 at 09:07 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `managershop`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `landline` varchar(20) NOT NULL,
  `email` varchar(250) NOT NULL,
  `birthday` date NOT NULL,
  `code` varchar(15) NOT NULL,
  `id_groupcustomer` bigint(20) NOT NULL,
  `id_province` bigint(20) NOT NULL,
  `address` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `avatar` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE `customer_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(300) NOT NULL,
  `id_parent` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_cart`
--

CREATE TABLE `detail_cart` (
  `id` bigint(20) NOT NULL,
  `prcode` varchar(100) NOT NULL,
  `id_product` bigint(20) NOT NULL,
  `id_unit` bigint(20) NOT NULL,
  `count` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `decline` bigint(20) NOT NULL,
  `id_infocart` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_inventory`
--

CREATE TABLE `detail_inventory` (
  `id` bigint(20) NOT NULL,
  `id_inventory` bigint(20) NOT NULL,
  `type` enum('Nhập kho','Xuất kho','Chuyển kho','Hủy hàng','Sửa tồn kho','Nhập nhà cung cấp','Sửa nhà cung cấp') CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL,
  `note` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `id_province` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `role` enum('Nhân viên kho','Nhân viên thu ngân','Nhân viên bán hàng','Quản lý cửa hàng') CHARACTER SET utf8 NOT NULL,
  `address` varchar(500) NOT NULL,
  `cmnd` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Hoạt động','Không hoạt động') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` bigint(20) NOT NULL,
  `title` varchar(500) CHARACTER SET latin1 NOT NULL,
  `id_parent` bigint(20) NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `avatar` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `info_cart`
--

CREATE TABLE `info_cart` (
  `id` bigint(20) NOT NULL,
  `id_customer` bigint(20) NOT NULL,
  `id_employee` bigint(20) NOT NULL,
  `receive_fullname` varchar(250) NOT NULL,
  `receive_phone` varchar(20) NOT NULL,
  `receive_address` varchar(500) NOT NULL,
  `receive_date` date NOT NULL,
  `receive_time` time NOT NULL,
  `status` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `id_province` bigint(20) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `avatar` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint(20) NOT NULL,
  `number_invoice` varchar(100) NOT NULL,
  `reason` enum('0','1','2','3','4','5') NOT NULL,
  `original_voucher` varchar(100) NOT NULL,
  `id_employee` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `people` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(300) NOT NULL,
  `note` varchar(500) NOT NULL,
  `typy` enum('Phiếu thu','Phiếu chi') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `id_province` bigint(20) NOT NULL,
  `address` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `avatar` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `qrcode` varchar(100) CHARACTER SET latin1 NOT NULL,
  `title` varchar(500) CHARACTER SET latin1 NOT NULL,
  `price` bigint(20) NOT NULL,
  `id_group` bigint(20) NOT NULL,
  `id_unit` bigint(20) NOT NULL,
  `limit_min` bigint(20) NOT NULL,
  `limit_max` bigint(20) NOT NULL,
  `manager` enum('1','0') CHARACTER SET latin1 NOT NULL,
  `cost` bigint(20) NOT NULL,
  `id_producer` bigint(20) NOT NULL,
  `id_tags` bigint(20) NOT NULL,
  `description` longtext CHARACTER SET latin1 NOT NULL,
  `avatar` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory`
--

CREATE TABLE `product_inventory` (
  `id` bigint(20) NOT NULL,
  `id_product` varchar(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `count` bigint(20) NOT NULL,
  `id_detailinventory` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id` bigint(20) NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` bigint(20) NOT NULL,
  `title` varchar(500) CHARACTER SET latin1 NOT NULL,
  `id_group` bigint(20) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `description` varchar(500) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `store_shop`
--

CREATE TABLE `store_shop` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `hotline` varchar(250) NOT NULL,
  `address` varchar(500) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE `subscriber` (
  `id` bigint(20) NOT NULL,
  `name` varchar(500) CHARACTER SET latin1 NOT NULL,
  `id_group` bigint(20) NOT NULL,
  `id_unittime` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `avatar` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `value` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL,
  `limit` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unitcount`
--

CREATE TABLE `unitcount` (
  `id` bigint(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unittime`
--

CREATE TABLE `unittime` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `count` bigint(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_groupcustomer` (`id_groupcustomer`),
  ADD KEY `id_province` (`id_province`);

--
-- Indexes for table `customer_group`
--
ALTER TABLE `customer_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_cart`
--
ALTER TABLE `detail_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_unit` (`id_unit`),
  ADD KEY `id_infocart` (`id_infocart`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `detail_inventory`
--
ALTER TABLE `detail_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_inventory` (`id_inventory`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nameprovince` (`id_province`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_cart`
--
ALTER TABLE `info_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_province` (`id_province`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_province` (`id_province`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_group` (`id_group`),
  ADD KEY `id_unit` (`id_unit`),
  ADD KEY `id_producer` (`id_producer`),
  ADD KEY `id_tags` (`id_tags`);

--
-- Indexes for table `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_detailinventory` (`id_detailinventory`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_group` (`id_group`);

--
-- Indexes for table `store_shop`
--
ALTER TABLE `store_shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_group` (`id_group`),
  ADD KEY `id_unittime` (`id_unittime`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unitcount`
--
ALTER TABLE `unitcount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unittime`
--
ALTER TABLE `unittime`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_group`
--
ALTER TABLE `customer_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_cart`
--
ALTER TABLE `detail_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_inventory`
--
ALTER TABLE `detail_inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `info_cart`
--
ALTER TABLE `info_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `producer`
--
ALTER TABLE `producer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_inventory`
--
ALTER TABLE `product_inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `store_shop`
--
ALTER TABLE `store_shop`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unitcount`
--
ALTER TABLE `unitcount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unittime`
--
ALTER TABLE `unittime`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id_groupcustomer`) REFERENCES `customer_group` (`id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`id_province`) REFERENCES `province` (`id`);

--
-- Constraints for table `detail_cart`
--
ALTER TABLE `detail_cart`
  ADD CONSTRAINT `detail_cart_ibfk_1` FOREIGN KEY (`id_infocart`) REFERENCES `info_cart` (`id`),
  ADD CONSTRAINT `detail_cart_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `unitcount` (`id`);

--
-- Constraints for table `detail_inventory`
--
ALTER TABLE `detail_inventory`
  ADD CONSTRAINT `detail_inventory_ibfk_1` FOREIGN KEY (`id_inventory`) REFERENCES `inventory` (`id`);

--
-- Constraints for table `info_cart`
--
ALTER TABLE `info_cart`
  ADD CONSTRAINT `info_cart_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`id_province`) REFERENCES `province` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`);

--
-- Constraints for table `producer`
--
ALTER TABLE `producer`
  ADD CONSTRAINT `producer_ibfk_1` FOREIGN KEY (`id_province`) REFERENCES `province` (`id`);

--
-- Constraints for table `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD CONSTRAINT `product_inventory_ibfk_1` FOREIGN KEY (`id_detailinventory`) REFERENCES `detail_inventory` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
