-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2015 at 11:01 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE Database IF NOT EXISTS scip;
USE scip;
--
-- Database: `scip`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pic`
--

CREATE TABLE IF NOT EXISTS `tbl_pic` (
  `id` int(10) NOT NULL,
  `picPath` text NOT NULL,
  `likes` int(10) DEFAULT NULL,
  `dislikes` int(10) DEFAULT NULL,
  `comments` varchar(60) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_pic`
--

INSERT INTO `tbl_pic` (`id`, `picPath`, `likes`, `dislikes`, `comments`, `userId`) VALUES
(1, 'pics/defaultProfilPic.png', NULL, NULL, NULL, 1),
(2, 'pics/Desert.jpg', NULL, NULL, NULL, 1),
(3, 'pics/Jellyfish.jpg', NULL, NULL, NULL, 1),
(4, 'pics/logo.png', NULL, NULL, NULL, 1),
(5, 'pics/Hydrangeas.jpg', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(10) NOT NULL,
  `username` varchar(31) NOT NULL,
  `password` varchar(60) NOT NULL,
  `mail` varchar(63) DEFAULT NULL,
  `profilPicId` int(11) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `mail`, `profilPicId`, `gender`, `birthday`, `phonenumber`) VALUES
(1, 'mario', 'Scip12345', NULL, 2, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_pic`
--
ALTER TABLE `tbl_pic`
  ADD PRIMARY KEY (`id`), ADD KEY `userId` (`userId`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`), ADD KEY `picId` (`profilPicId`), ADD KEY `profilPicId` (`profilPicId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_pic`
--
ALTER TABLE `tbl_pic`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_pic`
--
ALTER TABLE `tbl_pic`
ADD CONSTRAINT `tbl_pic_userId_to_tbl_users_Id` FOREIGN KEY (`userId`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
ADD CONSTRAINT `tbl_user_profilPicId_to_tbl_pic_Id` FOREIGN KEY (`profilPicId`) REFERENCES `tbl_pic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
