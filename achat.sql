-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2017 at 08:12 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `achat`
--

-- --------------------------------------------------------

--
-- Table structure for table `u1`
--

CREATE TABLE `u1` (
  `contactId` int(11) NOT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `u1`
--

INSERT INTO `u1` (`contactId`, `status`) VALUES
(2, 'Unblocked');

-- --------------------------------------------------------

--
-- Table structure for table `u1:u2`
--

CREATE TABLE `u1:u2` (
  `messgeId` int(11) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `time` datetime NOT NULL,
  `status` varchar(40) NOT NULL,
  `message` varchar(1024) NOT NULL,
  `messagetype` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `u1:u2`
--

INSERT INTO `u1:u2` (`messgeId`, `sender`, `time`, `status`, `message`, `messagetype`) VALUES
(1, '2', '2017-04-15 11:29:07', 'RECEIVED', 'Hii', 'text'),
(2, '1', '2017-04-15 11:29:13', 'RECEIVED', 'Yo', 'text'),
(3, '1', '2017-04-15 11:30:21', 'RECEIVED', 'awesome', 'text'),
(4, '1', '2017-04-15 11:30:52', 'RECEIVED', 'how you doin?', 'text'),
(5, '2', '2017-04-15 11:37:49', 'RECEIVED', 'system/storage/data/image/9cBVYKVeYzVLVQp1rS5s.jpg', 'img');

-- --------------------------------------------------------

--
-- Table structure for table `u2`
--

CREATE TABLE `u2` (
  `contactId` int(11) NOT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `u2`
--

INSERT INTO `u2` (`contactId`, `status`) VALUES
(1, 'Unblocked');

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `detail_id` int(11) NOT NULL,
  `name` tinytext CHARACTER SET ascii NOT NULL,
  `filename` tinytext NOT NULL,
  `code` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upload`
--

INSERT INTO `upload` (`detail_id`, `name`, `filename`, `code`, `date_added`) VALUES
(1, 'EC1c4VBLDGgAhbRC1jzn.jpg', '9cBVYKVeYzVLVQp1rS5s.jpg', 'ce7a1c4085ddc6a01b7acf6513410461598f91af', '2017-04-15 11:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE `url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `date_joined` datetime NOT NULL,
  `userstate` varchar(10) NOT NULL,
  `status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `email`, `date_joined`, `userstate`, `status`) VALUES
(1, 'akash29697', 'e4cf979cf717fd295f4e4edc427ee1aee78fa7dc', 'akash29697@gmail.com', '2017-04-15 11:19:48', 'Online', 1),
(2, 'hackerbee', '7a0cc5741991101d7cda61ea10e0d44b1d880a32', 'hacker@bee.site', '2017-04-15 11:23:19', 'Online', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `ip` varchar(40) NOT NULL,
  `userid` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`ip`, `userid`, `url`, `referer`, `date_added`) VALUES
('127.0.0.1', 2, 'http://aloha/index.php?route=common/messagelist&amp;token=2ceFZys5wdHlvqXtiFy8PjMwZcRktY27&amp;q=', 'http://aloha/index.php?route=common/home&amp;token=2ceFZys5wdHlvqXtiFy8PjMwZcRktY27', '2017-04-15 08:12:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `u1`
--
ALTER TABLE `u1`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `u1:u2`
--
ALTER TABLE `u1:u2`
  ADD PRIMARY KEY (`messgeId`);

--
-- Indexes for table `u2`
--
ALTER TABLE `u2`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `url_alias`
--
ALTER TABLE `url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `u1:u2`
--
ALTER TABLE `u1:u2`
  MODIFY `messgeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `url_alias`
--
ALTER TABLE `url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
