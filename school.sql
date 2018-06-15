-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 15, 2018 at 06:29 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `absences`
--

DROP TABLE IF EXISTS `absences`;
CREATE TABLE IF NOT EXISTS `absences` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `test_taken` enum('T','F') NOT NULL DEFAULT 'F',
  `date` date NOT NULL,
  PRIMARY KEY (`student_id`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absences`
--

INSERT INTO `absences` (`student_id`, `test_taken`, `date`) VALUES
(7, 'F', '2018-08-29'),
(6, 'F', '2018-08-27');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `name` varchar(30) NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`name`, `class_id`) VALUES
('English', 1),
('Biology', 2),
('History', 3),
('Chemistry', 4),
('Earth Science', 5),
('Mathematics', 6),
('Art', 7),
('Gymnastic', 8);

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
CREATE TABLE IF NOT EXISTS `scores` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`test_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`student_id`, `test_id`, `score`) VALUES
(1, 1, 15),
(1, 2, 13),
(1, 3, 26),
(1, 4, 29),
(1, 5, 19),
(2, 1, 30),
(2, 2, 13),
(2, 3, 23),
(2, 4, 19),
(2, 5, 11),
(3, 1, 10),
(3, 2, 23),
(3, 3, 28),
(3, 4, 29),
(3, 5, 22),
(4, 1, 20),
(4, 2, 30),
(4, 3, 18),
(4, 4, 29),
(4, 5, 29),
(5, 1, 29),
(5, 2, 10),
(5, 3, 28),
(5, 4, 28),
(5, 5, 18),
(7, 1, 30),
(6, 6, 17),
(6, 5, 28),
(6, 4, 30),
(6, 3, 23),
(6, 2, 16),
(6, 1, 26);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT 'SRB',
  `zip` mediumint(8) UNSIGNED NOT NULL,
  `phone` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `sex` enum('M','F','T') NOT NULL,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`first_name`, `last_name`, `email`, `street`, `city`, `state`, `zip`, `phone`, `birth_date`, `sex`, `date_entered`, `student_id`) VALUES
('Dave', 'Cooper', 'dcooper@mail.com', '123 Main Str', 'Yakama', 'BIH', 98901, '064-333-222', '1999-03-04', 'M', '2018-05-30 16:56:29', 1),
('Stave', 'Gper', 'gper@mail.com', '124 Main Str', 'Zakama', 'BIH', 98902, '064-333-444', '1980-04-02', 'M', '2018-05-30 16:59:47', 2),
('Graves', 'Soper', 'soper@mail.com', '223 Main Str', 'Okama', 'BIH', 98903, '064-123-422', '1993-03-01', 'M', '2018-05-30 17:01:00', 3),
('Janna', 'Jennet', 'jnnjnn@mail.com', '123 Main Str', 'Sarama', 'SRB', 98904, '064-332-337', '1994-01-01', 'F', '2018-05-30 17:02:19', 4),
('Zanna', 'Gennet', 'GnnZan@mail.com', '125 Main Str', 'Karma', 'SRB', 98905, '064-832-338', '1992-02-05', 'F', '2018-05-30 17:03:36', 5),
('Merlinka', 'Menson', 'quir@mail.com', '126 Main Str', 'Sarma', 'SRB', 98906, '063-432-347', '1991-04-02', 'T', '2018-05-30 17:04:51', 6),
('katarina', 'bozinovic', 'kaca@mail.com', '35 Vukosave', 'Kragujevac', 'SRB', 11222, '064-224-9542', '1994-12-20', 'F', '2018-06-01 20:09:24', 7),
('Nemanja', 'Kostic', 'kolle@gmail.com', 'Vukosava O. 35', 'Beograd', 'CRO', 11000, '064-225-86-42', '1980-05-05', 'F', '2018-06-09 17:12:08', 8),
('Creeat', 'Usher', 'usher@gmail.com', 'Idi Dodjimi 2', 'Novi Sad', 'SRB', 12333, '064-100-100', '1985-01-11', 'M', '2018-06-08 22:00:00', 9),
('Time', 'PhpDate', 'date@gmail.com', 'Idimi Dodji 3', 'Novi Sad', 'SRB', 12333, '064-110-101', '1995-02-12', 'M', '2018-06-09 20:21:24', 10),
('Firs', 'Las', 'svepopuni@gmail.com', 'ili je undifine 12', 'Zamzobar', 'MNE', 12334, '061-2233-321', '1991-04-05', 'T', '2018-06-09 20:21:24', 11),
('MyWay', 'Frank', 'sorter@gmail.com', 'Hope it will work', 'Zrenjanin', 'SRB', 11333, '064-3993-131', '1993-04-08', 'F', '2018-06-15 17:22:21', 13);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE IF NOT EXISTS `tests` (
  `date` date NOT NULL,
  `type` enum('T','Q') NOT NULL,
  `maxscore` int(11) NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`test_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`date`, `type`, `maxscore`, `class_id`, `test_id`) VALUES
('2018-09-01', 'Q', 30, 1, 1),
('2018-09-01', 'T', 30, 1, 2),
('2018-09-02', 'Q', 30, 2, 3),
('2018-09-05', 'Q', 30, 2, 4),
('2018-09-06', 'T', 30, 3, 5),
('2018-09-09', 'T', 30, 4, 6),
('2018-06-06', 'Q', 30, 3, 7),
('2018-06-06', 'T', 30, 2, 8),
('2018-06-06', 'T', 30, 5, 9),
('2018-06-06', 'Q', 30, 5, 10),
('2018-06-06', 'Q', 30, 6, 11);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
