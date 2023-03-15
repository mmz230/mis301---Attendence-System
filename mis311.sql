-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 15, 2023 at 11:31 AM
-- Server version: 8.0.32-0ubuntu0.20.04.2
-- PHP Version: 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mis311`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `customerid` int NOT NULL,
  `customerfirstname` varchar(255) NOT NULL,
  `customerlastname` varchar(255) NOT NULL,
  `customerdob` date NOT NULL,
  `customeremail` varchar(255) NOT NULL,
  `customerage` int NOT NULL,
  `customergender` enum('male','female') NOT NULL,
  `customerphone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Inventorylocation`
--

CREATE TABLE `Inventorylocation` (
  `inventorylocationid` int NOT NULL,
  `inventorylocationcountry` varchar(255) NOT NULL,
  `inventorylocationcity` varchar(255) NOT NULL,
  `partid` int NOT NULL,
  `productid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Itemline`
--

CREATE TABLE `Itemline` (
  `itemlineid` int NOT NULL,
  `itemquantity` int NOT NULL,
  `itemname` int NOT NULL,
  `itemprice` int NOT NULL,
  `productid` int NOT NULL,
  `purchaseorderid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Part`
--

CREATE TABLE `Part` (
  `partid` int NOT NULL,
  `partname` varchar(255) NOT NULL,
  `partdescription` text NOT NULL,
  `supplierid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `productid` int NOT NULL,
  `productname` varchar(255) NOT NULL,
  `productbuydate` date NOT NULL,
  `productprice` int NOT NULL,
  `productcategoery` enum('bicycle','accessories') NOT NULL,
  `productdescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PurchaseOrder`
--

CREATE TABLE `PurchaseOrder` (
  `purchaseorderid` int NOT NULL,
  `purchaseorderdate` date NOT NULL,
  `customerid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Supplier`
--

CREATE TABLE `Supplier` (
  `supplierid` int NOT NULL,
  `suppliername` varchar(255) NOT NULL,
  `supplierlocation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customerid`);

--
-- Indexes for table `Inventorylocation`
--
ALTER TABLE `Inventorylocation`
  ADD PRIMARY KEY (`inventorylocationid`),
  ADD KEY `partid` (`partid`),
  ADD KEY `productid` (`productid`);

--
-- Indexes for table `Itemline`
--
ALTER TABLE `Itemline`
  ADD PRIMARY KEY (`itemlineid`),
  ADD KEY `productid` (`productid`),
  ADD KEY `purchaseorderid` (`purchaseorderid`);

--
-- Indexes for table `Part`
--
ALTER TABLE `Part`
  ADD PRIMARY KEY (`partid`),
  ADD KEY `supplierid` (`supplierid`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `PurchaseOrder`
--
ALTER TABLE `PurchaseOrder`
  ADD PRIMARY KEY (`purchaseorderid`),
  ADD KEY `customerid` (`customerid`);

--
-- Indexes for table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`supplierid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `customerid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Inventorylocation`
--
ALTER TABLE `Inventorylocation`
  MODIFY `inventorylocationid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Itemline`
--
ALTER TABLE `Itemline`
  MODIFY `itemlineid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Part`
--
ALTER TABLE `Part`
  MODIFY `partid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `productid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PurchaseOrder`
--
ALTER TABLE `PurchaseOrder`
  MODIFY `purchaseorderid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Supplier`
--
ALTER TABLE `Supplier`
  MODIFY `supplierid` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Inventorylocation`
--
ALTER TABLE `Inventorylocation`
  ADD CONSTRAINT `Inventorylocation_ibfk_1` FOREIGN KEY (`partid`) REFERENCES `Part` (`partid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Inventorylocation_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `Product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Itemline`
--
ALTER TABLE `Itemline`
  ADD CONSTRAINT `Itemline_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `Product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Itemline_ibfk_2` FOREIGN KEY (`purchaseorderid`) REFERENCES `PurchaseOrder` (`purchaseorderid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Part`
--
ALTER TABLE `Part`
  ADD CONSTRAINT `Part_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `Supplier` (`supplierid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `PurchaseOrder`
--
ALTER TABLE `PurchaseOrder`
  ADD CONSTRAINT `PurchaseOrder_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `Customer` (`customerid`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
