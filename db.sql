-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 28, 2016 at 05:50 PM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `houtell`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `nama_kota`) VALUES
(1, 'Jakarta'),
(2, 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_hotel` varchar(300) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `rating` decimal(10,0) DEFAULT NULL,
  `bintang` tinyint(4) NOT NULL,
  `url_foto` varchar(200) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `canonical_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id`, `nama_hotel`, `id_kota`, `rating`, `bintang`, `url_foto`, `lokasi`, `canonical_name`) VALUES
(1, 'Hotel Dummy', 1, NULL, 5, NULL, NULL, 'hotel-dummy');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review` text NOT NULL,
  `is_positive` tinyint(1) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL,
  `dummy` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `review`, `is_positive`, `hotel_id`, `dummy`) VALUES
(2, 'iya ini sangat bagus ya wow', 1, 1, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;