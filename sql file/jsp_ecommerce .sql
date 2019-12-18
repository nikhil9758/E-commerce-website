-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2019 at 09:41 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsp_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Ghee'),
(2, 'Panner'),
(3, 'Milk'),
(4, 'Butter');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `picture` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `category`, `title`, `details`, `price`, `picture`) VALUES
(1, 1, 'Ghee', 'Amul Pure Ghee (Carton)', 500, 'https://cdn.grofers.com/app/images/products/normal/pro_15520.jpg?ts=1557814167'),
(2, 2, 'Amul Panner', 'Amul Cheese Slices', 350, 'https://cdn.grofers.com/app/images/products/normal/pro_94927.jpg'),
(3, 4, 'Butter', 'Amul Butter', 250, 'https://cdn.grofers.com/app/images/products/normal/pro_160.jpg?ts=1565763930'),
(4, 3, 'Soya Milk', 'Sofit Chocolate Soy Milk (Tetra Pak)', 24, 'https://cdn.grofers.com/app/images/products/normal/pro_10708.jpg'),
(5, 1, 'Ananda Ghee', 'Gopaljee Ananda Ghee', 450, 'https://cdn.grofers.com/app/images/products/normal/pro_73536.jpg'),
(6, 3, 'Amul Torn Milk', 'Amul Taaza Toned Milk (Tetra Pak) - Pack of 2', 124, 'https://cdn.grofers.com/app/images/products/normal/pro_405015.jpg?ts=1565270238'),
(7, 3, 'Amul Milk', 'Mother Dairy Strawberry Milk Shake - Pack of 2', 68, 'https://cdn.grofers.com/app/images/products/normal/pro_382162.jpg'),
(8, 4, 'Butter', 'Salted Butter', 300, 'https://cdn.grofers.com/app/images/products/normal/pro_403244.jpg?ts=1564554389');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
