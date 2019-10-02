-- phpMyAdmin SQL Dump
-- version 5.1.0-dev
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2019 at 02:36 PM
-- Server version: 10.1.34-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbgeobak`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(6) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id_article` int(10) NOT NULL,
  `title_article` varchar(50) NOT NULL,
  `content_article` text NOT NULL,
  `date_add` varchar(24) NOT NULL,
  `date_edit` varchar(24) NOT NULL,
  `publish_status` int(1) NOT NULL,
  `id_admin` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_profile`
--

CREATE TABLE `company_profile` (
  `id_content` int(2) NOT NULL,
  `title_content` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date_add` varchar(24) NOT NULL,
  `date_edit` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(10) NOT NULL,
  `name_customer` varchar(75) NOT NULL,
  `phone_customer` varchar(15) NOT NULL,
  `email_customer` varchar(50) NOT NULL,
  `password_customer` varchar(255) NOT NULL,
  `address_customer` varchar(255) NOT NULL,
  `date_join_customer` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `name_customer`, `phone_customer`, `email_customer`, `password_customer`, `address_customer`, `date_join_customer`) VALUES
(1, 'haydar', '081932352247', 'hardabell@gmail.com', 'lostsaga12', 'bekasi', '0000-00-00 00:00:00'),
(2, 'kapten', '325235', 'haydar@gmail.com', 'lostsaga12', 'beji', '0000-00-00 00:00:00'),
(5, 'wawa memek', '12988', 'awe@awe.cor', '123', 'Lambir Gang', '2019-10-02 05:44:31'),
(6, 'wawa memek', '12988', 'awe@awe.col', '123', 'Lambir Gang', '2019-10-02 05:52:21'),
(7, 'ajsk', '4249', 'ywu.@akek.sk', '123qwe', 'gahah', '2019-10-02 06:05:47'),
(8, 'ahsga', '1243154', 'tuyaj@ahwha.sh', '123qwe', 'guhas', '2019-10-02 06:13:04'),
(9, 'kntl', '08973494', 'kontol@uhuy.com', 'kntl', 'bwh perut', '2019-10-02 07:31:48');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaction`
--

CREATE TABLE `detail_transaction` (
  `id_transaction` bigint(128) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(6) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaction`
--

INSERT INTO `detail_transaction` (`id_transaction`, `id_product`, `quantity`, `price`) VALUES
(1, 1, 1, 15000),
(2, 1, 2, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `master_transaction`
--

CREATE TABLE `master_transaction` (
  `id_transaction` bigint(128) NOT NULL,
  `id_customer` int(10) NOT NULL,
  `transaction_total` int(8) NOT NULL,
  `date_transaction` varchar(24) NOT NULL,
  `time_transaction` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_transaction`
--

INSERT INTO `master_transaction` (`id_transaction`, `id_customer`, `transaction_total`, `date_transaction`, `time_transaction`) VALUES
(0, 1, 15000, '31-01-12', '12:17:34'),
(1, 1, 15000, '9/30/2019', '00:00:16'),
(2, 2, 10000, '18123937173', '12:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_product` int(10) NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `description_product` text NOT NULL,
  `price_unit` int(7) NOT NULL,
  `unit` varchar(25) NOT NULL,
  `id_category` int(6) NOT NULL,
  `rating` float NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `description_product`, `price_unit`, `unit`, `id_category`, `rating`, `image`) VALUES
(1, 'sate ayam', 'sate mantapp', 15000, '1', 1, 4.5, ''),
(2, 'aqua', 'aqua enak', 20, '1', 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id_category` int(6) NOT NULL,
  `name_category` varchar(75) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id_category`, `name_category`, `type`) VALUES
(1, 'daging', '1');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id_seller` int(10) NOT NULL,
  `name_seller` varchar(75) NOT NULL,
  `address_seller` varchar(255) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  `phone_seller` varchar(15) NOT NULL,
  `email_seller` varchar(50) DEFAULT NULL,
  `password_seller` varchar(255) NOT NULL,
  `date_join_seller` varchar(24) NOT NULL,
  `id_product` int(10) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id_seller`, `name_seller`, `address_seller`, `zip_code`, `phone_seller`, `email_seller`, `password_seller`, `date_join_seller`, `id_product`, `latitude`, `longitude`) VALUES
(3, 'pak gembul', 'beji', '1', '0921490295', 'gembul@gmail.com', 'lostsaga12', '9/27/2019', 1, '-6.371975', '106.824409'),
(4, 'wawa', 'beji', '23', '0345934', 'wawa@gmail.com', 'lostsaga12', '9/30/2019', 2, '-6.224469', '106.850524');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `company_profile`
--
ALTER TABLE `company_profile`
  ADD PRIMARY KEY (`id_content`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detail_transaction`
--
ALTER TABLE `detail_transaction`
  ADD KEY `id_transaction` (`id_transaction`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `master_transaction`
--
ALTER TABLE `master_transaction`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id_seller`),
  ADD KEY `id_product` (`id_product`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_profile`
--
ALTER TABLE `company_profile`
  MODIFY `id_content` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id_category` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id_seller` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `detail_transaction`
--
ALTER TABLE `detail_transaction`
  ADD CONSTRAINT `detail_transaction_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`),
  ADD CONSTRAINT `detail_transaction_ibfk_2` FOREIGN KEY (`id_transaction`) REFERENCES `master_transaction` (`id_transaction`);

--
-- Constraints for table `master_transaction`
--
ALTER TABLE `master_transaction`
  ADD CONSTRAINT `master_transaction_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `product_category` (`id_category`);

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

