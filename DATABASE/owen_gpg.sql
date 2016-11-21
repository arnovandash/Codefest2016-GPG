-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 20, 2016 at 05:49 AM
-- Server version: 5.6.33
-- PHP Version: 5.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `owen_gpg`
--
CREATE DATABASE IF NOT EXISTS `owen_gpg` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `owen_gpg`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_application_link`
--

CREATE TABLE IF NOT EXISTS `tb_application_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `status` enum('pending','accepted','rejected','offer') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_userIDjobID` (`job_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `tb_application_link`
--

INSERT INTO `tb_application_link` (`id`, `user_id`, `job_id`, `status`) VALUES
(5, 42, 6, 'pending'),
(11, 53, 6, 'pending'),
(27, 45, 6, 'accepted'),
(30, 45, 9, 'pending'),
(32, 53, 9, 'pending'),
(34, 76, 9, 'pending'),
(40, 90, 9, 'pending'),
(47, 92, 9, 'rejected'),
(51, 96, 12, 'pending'),
(52, 45, 12, 'pending'),
(54, 45, 11, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `tb_company`
--

CREATE TABLE IF NOT EXISTS `tb_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_name` (`listing_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_company`
--

INSERT INTO `tb_company` (`id`, `listing_name`) VALUES
(1, 'GPG'),
(2, 'private');

-- --------------------------------------------------------

--
-- Table structure for table `tb_complaints`
--

CREATE TABLE IF NOT EXISTS `tb_complaints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `status` enum('processing','complete') NOT NULL DEFAULT 'processing',
  `station_id` int(11) NOT NULL,
  `police_officer_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tb_complaints`
--

INSERT INTO `tb_complaints` (`id`, `user_id`, `detail`, `status`, `station_id`, `police_officer_id`, `date_created`) VALUES
(10, 45, 'test', 'processing', 3, 0, '2016-10-06 11:29:36'),
(11, 86, 'Hijacking', 'processing', 2, 0, '2016-10-06 11:54:48'),
(12, 86, 'Break In', 'processing', 3, 0, '2016-10-06 11:55:32'),
(13, 85, 'Theft', 'processing', 1, 0, '2016-10-06 11:57:46'),
(14, 45, 'qwer', 'processing', 5, 0, '2016-10-06 16:13:02'),
(15, 45, 'A cop blackmailed me', 'processing', 1, 0, '2016-10-06 19:11:04'),
(16, 45, 'A cop blackmailed me', 'processing', 1, 0, '2016-10-06 19:11:06'),
(17, 76, 'Break Into House', 'processing', 2, 0, '2016-10-07 02:19:15'),
(18, 76, 'Domestic Abuse', 'processing', 4, 0, '2016-10-07 02:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `tb_departments`
--

CREATE TABLE IF NOT EXISTS `tb_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `province` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `suburb` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_hotspots`
--

CREATE TABLE IF NOT EXISTS `tb_hotspots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `crime` enum('Hijacking','Mugging','Burglary') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tb_hotspots`
--

INSERT INTO `tb_hotspots` (`id`, `longitude`, `latitude`, `crime`) VALUES
(1, '-26.116418, ', '27.957708', 'Burglary'),
(2, '-26.117767', '27.958309', 'Mugging'),
(3, '-26.117699', '27.958233', 'Hijacking'),
(4, '-26.115418', '27.956708', 'Mugging'),
(5, '-26.116553', '27.955907', 'Mugging'),
(6, '23.5689', '-23.5689', 'Hijacking'),
(7, '23.5689', '-23.5689', 'Mugging'),
(8, '23.5689', '-23.5689', 'Burglary');

-- --------------------------------------------------------

--
-- Table structure for table `tb_incident`
--

CREATE TABLE IF NOT EXISTS `tb_incident` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NOT NULL,
  `event` varchar(200) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `station_id` (`station_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `tb_incident`
--

INSERT INTO `tb_incident` (`id`, `station_id`, `event`, `latitude`, `longitude`, `description`) VALUES
(1, 1, 'mugging', '-26.123737', '27.966854', 'Some dude got mugged and he was really upset about it.'),
(2, 2, 'burglary', '-26.125053', '27.958730', 'They broke into my heart and stole my dignity...'),
(3, 3, 'smash and grab', '-26.045270', '28.046221', 'We broke his icon, which broke his heart..'),
(4, 4, 'hijacking', '-26.123737', '27.966854', 'Jacked up really hi...'),
(5, 5, 'burglary', '-26.111718', '27.955052', 'They broke into my heart and stole my dignity...'),
(6, 6, 'hijacking', '-26.109831', '27.952770', 'Jacked up really hi...'),
(7, 1, 'burglary', '-26.122324', '27.943392', 'She broke into my heart and stole my dignity...'),
(8, 2, 'smash and grab', '-26.122431', '27.966149', 'Some stuff got smashed and grabbed'),
(9, 3, 'smash and grab', '-26.108601', '27.960980', 'Some stuff got smashed and grabbed'),
(10, 4, 'hijacking', '-26.130260', '27.942764', 'Jacked up really hi...'),
(12, 1, 'burglary', '-26.099577', '28.016146', 'Late for work!'),
(13, 2, 'burglary', '-26.125629', '28.073198', 'Cat was stuck in a tree, then someone stole the tree..'),
(14, 2, 'mugging', '-23.0014', '23.5896', 'I have no dignity...'),
(15, 1, 'burglary', '-26.127259', '27.969318', 'Stole a pen from work'),
(16, 2, 'burglary', '-26.125699', '27.970112', 'Horse stole an apple'),
(17, 4, 'hijacking', '-26.128550', '27.970091', 'Jacked up really hi...'),
(18, 3, 'smash and grab', '-26.129312', '28.046221', 'We broke his icon, which broke his heart..'),
(19, 2, 'burglary', '-26.129741', '27.971335', 'They broke into my heart and stole my dignity...'),
(20, 1, 'burglary', '-26.130295', '27.980600', 'Pescatarian fish stole some fish from another fish'),
(21, 6, 'hijacking', '-26.152601', '28.005145', 'Angus hijacked a pescapescatarian fish.... He stole it''s boat'),
(22, 2, 'burglary', '-26.145178', '27.892560', 'My bushes got trimmed'),
(23, 2, 'burglary', '-26.109660', '27.949812', 'There was a moose involved'),
(39, 2, 'Milpark admin issue', '-26.178861', '28.0156354', 'Milpark admin issue'),
(40, 2, 'Blah', '-26.1786993', '28.0160013', 'Blah'),
(41, 2, 'Jjjjy', '-26.2571967', '28.1271719', 'Jjjjy');

-- --------------------------------------------------------

--
-- Table structure for table `tb_job`
--

CREATE TABLE IF NOT EXISTS `tb_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `type` enum('private','comercial','recruting_agency') NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT '2',
  `status` enum('avalible','taken') NOT NULL DEFAULT 'avalible',
  `views` int(11) NOT NULL DEFAULT '0',
  `expierydate` date NOT NULL,
  `recruter_id` int(11) NOT NULL,
  `latitude` int(11) DEFAULT NULL,
  `longatude` int(11) DEFAULT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(40) NOT NULL,
  `postalcode` varchar(4) NOT NULL,
  `province` varchar(50) NOT NULL,
  `date_listed` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `recruter_id` (`recruter_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tb_job`
--

INSERT INTO `tb_job` (`id`, `title`, `description`, `type`, `company_id`, `status`, `views`, `expierydate`, `recruter_id`, `latitude`, `longatude`, `address1`, `address2`, `city`, `postalcode`, `province`, `date_listed`) VALUES
(6, 'Manager', 'Manage an egove development team', 'comercial', 1, 'avalible', 0, '2016-10-31', 1, 231, 123, '12 Albert st', NULL, 'Johanesburg', '0123', 'Gauteng', '2016-10-05'),
(9, 'developer', 'software developer specialised in C# and .Net ', 'comercial', 1, 'avalible', 0, '2017-01-20', 2, 234, 243, '56 Risik str', NULL, 'Johanesburg', '0123', 'Gauteng', '2016-10-06'),
(11, 'Junior Developer', 'Junior java and web developer', 'comercial', 1, 'avalible', 0, '2016-11-16', 1, NULL, NULL, '86 Commissioner str', NULL, 'Johanasburg', '0123', 'Gauteng', '2016-10-07'),
(12, 'Gadener', 'need a privet gardener for a medium gaurden', 'private', 2, 'avalible', 0, '2016-10-14', 1, NULL, NULL, '68 Louis st', NULL, 'Pretoria', '0122', 'Gauteng', '2016-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `tb_police_officer`
--

CREATE TABLE IF NOT EXISTS `tb_police_officer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badge_number` varchar(40) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `police_station_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `badge_number` (`badge_number`),
  KEY `police_station_id` (`police_station_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tb_police_officer`
--

INSERT INTO `tb_police_officer` (`id`, `badge_number`, `name`, `surname`, `police_station_id`, `start_date`, `end_date`) VALUES
(1, '1234qwer1324', 'John', 'Richards', 1, '2015-07-01', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_police_station`
--

CREATE TABLE IF NOT EXISTS `tb_police_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `street_address1` varchar(150) NOT NULL,
  `street_address2` varchar(150) DEFAULT NULL,
  `suburb` varchar(150) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postalcode` varchar(4) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tb_police_station`
--

INSERT INTO `tb_police_station` (`id`, `name`, `street_address1`, `street_address2`, `suburb`, `city`, `postalcode`, `latitude`, `longitude`, `email`, `telephone`) VALUES
(1, 'Hillbrow Police Station', '01 Claredon Place', NULL, 'Hillbrow', 'Johannesburg', '2038', -26.18823, 28.04464, 'NtandaneV@saps.gov.za', '0114886511'),
(2, 'Honeydew Police Station', 'Plot 3 Juice Road', NULL, 'Honeydew', 'Johannesburg', '2040', -26.0732, 27.9201, ' gp.honeydew.sc@saps.gov.za', '0118018400'),
(3, 'Douglasdale Police Station', 'c/o Topaas Avenue & Douglasdale Drive', NULL, 'Sandton', 'Johannesburg', '2191', -26.0263, 27.9907, 'gp.douglasdale.sc@saps.gov.za', '0116991300'),
(4, 'Rosebank Police Station', '15 Sturdee Avenue', NULL, 'Rosebank', 'Johannesburg', '2196', -26.14538, 28.03842, 'Rosebank-SAPS@saps.gov.za', '0117784700'),
(5, 'Randburg Police Station', '20 Shepard Avenue', NULL, 'Kensington Randburg', 'Johannesburg', '2194', -26.0765, 27.997, 'T0023694@saps.gov.za', '0114499100'),
(6, 'Florida Police Station', '5 Sauer Street', NULL, 'Florida', 'Johannesburg', '1709', -26.1693, 27.9051, 'RautenbachC@saps.gov.za', '0118317000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_qualification`
--

CREATE TABLE IF NOT EXISTS `tb_qualification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_qualification`
--

INSERT INTO `tb_qualification` (`id`, `user_id`, `institution`, `start_date`, `end_date`, `name`, `type`, `description`) VALUES
(1, 34, 'Wits', '2012-01-01', '2015-12-01', 'BEng electrical', 'BEng', 'stuff more stuff and more usefuly useles info'),
(2, 42, 'University of pretoria', '2014-01-15', '2016-10-02', 'batchular of the arts in graphic desing', 'BA', 'It looks pretty I said so.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_recruiter`
--

CREATE TABLE IF NOT EXISTS `tb_recruiter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_recruiter`
--

INSERT INTO `tb_recruiter` (`id`, `user_id`) VALUES
(1, 45),
(2, 76);

-- --------------------------------------------------------

--
-- Table structure for table `tb_social_scholarship`
--

CREATE TABLE IF NOT EXISTS `tb_social_scholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `racial_group` text NOT NULL,
  `local_municipality` text NOT NULL,
  `ward_number` int(11) NOT NULL,
  `youth_care` tinyint(1) NOT NULL,
  `has_disability` tinyint(1) NOT NULL,
  `disability` text,
  `university_admission` tinyint(1) NOT NULL,
  `studying_university` tinyint(1) NOT NULL,
  `institution` varchar(250) DEFAULT NULL,
  `degree` varchar(250) DEFAULT NULL,
  `curr_year_of_stdy` int(11) DEFAULT NULL,
  `gauName` varchar(250) NOT NULL,
  `gauSurname` varchar(250) NOT NULL,
  `gauID` varchar(128) NOT NULL,
  `gauTelephone` varchar(10) DEFAULT NULL,
  `gauCell` varchar(10) NOT NULL,
  `gauEmail` varchar(250) NOT NULL,
  `gauEmployment` enum('Employed','Unemployed','Self-Employed') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_social_scholarship`
--

INSERT INTO `tb_social_scholarship` (`id`, `user_id`, `nationality`, `racial_group`, `local_municipality`, `ward_number`, `youth_care`, `has_disability`, `disability`, `university_admission`, `studying_university`, `institution`, `degree`, `curr_year_of_stdy`, `gauName`, `gauSurname`, `gauID`, `gauTelephone`, `gauCell`, `gauEmail`, `gauEmployment`) VALUES
(1, 45, 'RSA', 'Neither', 'JHB', 123456, 0, 0, '', 0, 1, 'WeThinkCode', 'Software Engineering', 2016, 'Michael', 'Exall', 'ed2f91d2bfa4cbbac7d689646e0bdbf3e470bc11784459d64e039077bb071613677db9d2fd4f74a76ac4881c6fe5a7112407814731b804caa7a5e6ded86630fb', '', '0125422812', 't@g.com', 'Unemployed'),
(2, 45, 'RSA', 'Neither', 'JHB', 123456, 0, 0, '', 0, 1, 'WeThinkCode', 'Software Engineering', 2016, 'Michael', 'Exall', 'ed2f91d2bfa4cbbac7d689646e0bdbf3e470bc11784459d64e039077bb071613677db9d2fd4f74a76ac4881c6fe5a7112407814731b804caa7a5e6ded86630fb', '', '0125422812', 't@g.com', 'Unemployed'),
(3, 76, 'South African', 'Indian', 'Eastern Metropolis', 22, 0, 1, 'Short Sighted', 0, 1, 'Natal', 'BCOMM', 1990, 'ABC', 'ABC', 'b2e20f78280acb1078592c0f726bba4def98afa89c657b4b9bc0798cea797e2e504fc0dc07a4d079e5a766446810119afe528d6ce5756e1e4c7da99afe35f9a7', '', '0812345678', 'kaps@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_rights` enum('Admin','Member') NOT NULL DEFAULT 'Member',
  `id_department_rights` int(11) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dpoh_id` varchar(200) NOT NULL,
  `cell_num` varchar(10) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `address_1` varchar(100) DEFAULT NULL,
  `address_2` varchar(100) DEFAULT NULL,
  `suburb` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `postal_code` int(4) DEFAULT NULL,
  `po_box` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dpoh_id` (`dpoh_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `admin_rights`, `id_department_rights`, `first_name`, `surname`, `password`, `dpoh_id`, `cell_num`, `email`, `address_1`, `address_2`, `suburb`, `city`, `province`, `postal_code`, `po_box`) VALUES
(34, 'Member', NULL, 'Test 1 Name', 'Test 1 Surname', '$2y$12$PqTaRsjdsh9XHSWKC8/Ys.zs1gPudqoOLbYAZ9q0aQwKSb75TgCse', '8825e9eb7cba09b209b2a27630e1470567dd05dd05251c5fc45ce58e0b92fc94bcd60f91298514d33bff788cd345373576fc875244795a07df74c6845527f184', '', 'test1@gmail.com', '', '', 'CBD', 'Johannesburg', 'Gauteng', 4242, ''),
(42, 'Member', NULL, 'Test 2 Name', 'Test 2 Surname', '$2y$12$DTqykFkDPkN2XPjJZbhF8.mx6LFhJz2Q2arBkoFyRrmYDdOdTO15W', '004027be9648c8c580b3069035fc4ef3ff7624a3299375b80e4a60f50cb143c919ed5c8ff815b2f61f0e9458069e76d7334591398301bff2a14a3c434c852a33', '', 'test2@gmail.com', '', '', 'CBD', 'Johannesburg', 'Gauteng', 4242, ''),
(45, 'Admin', NULL, 'Owen', 'Exall', '$2y$12$HGZ3ytOw1ETv.J3aORmRTuMSfrBjJ0RuOHPggjeSxGtA.umJUwQrm', 'f3504df33b930200666d02340b096deeca77809cc944174cee28e9b0580f582ef19a78c0505e2dfd93fa0d90467f1cc9ae29a01bec0755b4758305c79f1769e4', '061882934', 'owen@exall.za.net', '02 Road Str', '', 'CBD', 'Johannesburg', 'Gauteng', 4242, '5058 PO Box'),
(53, 'Member', NULL, 'Arno', 'van wyk', '$2y$12$BDYMJTocc1DpFQbyF0dAmeIWrY.eCdKhus6IUpLVeldxcNSxLxKH.', 'b6beedcd0c70c6c88bb21e440f4d24d9e9e925ad501a109062e7fc8019db75aba626637c58506178bf86b1ad71bd3a5323ce5d69ee4ba233b87bb3ab9b15669e', '0112356899', 'cat@gmail.com', '01 Road', '', 'Fairlands', 'Johannesburg', 'Gauteng', 2000, '5058 PO Box'),
(76, 'Member', NULL, 'Kapil', 'Bookhan', '$2y$12$hMitm/A5Cl8.anRlNWWO7e9qvnehlk/5H37Ij6m8TQ3.AfyKu5j1G', '8e1b6be623a25825393e116e1a179ada2d8fff8a6dc4823f8913c7d5574cfa8a8845ec0aea4d1e66a50d9ecc07df831885dd292e05ae37ab324317a330bd0c02', '0845804990', 'kapilb16@gmail.com', '30 Pretoria Street Ext', '', 'Highlands North Ext', 'Johannesburg', 'Gauteng', 2192, NULL),
(82, 'Member', NULL, 'test', 'test', '$2y$12$ANUrvBWdG9M6gHTQEncG7OTYB5yBfz3Z5ePxTvTaxtSYfVaV.9.Iy', 'c49bf7808941a307208527f44e676975838c22a49a31bf44d075b78ffda761cd3260238a5b30106368e4b83ad966741fe57fa2976daeed73ee2e7e5716934cc5', '', 't@g.com', '', '', '', '', 'Gauteng', 2012, NULL),
(84, 'Member', NULL, 'Zapil', 'Zookhan', '$2y$12$H55UOPXjaV2R05muWQB4duwWq0eCucjiOHVkjmvUSsVJ0IzqaDSZG', '0965d850be16f844a44fd62b9c35deeba55ecabd6fd1b6fa1f02d97ff1e1e6048df05ab04074c1be043f08d59c2df6c265e4d549584125bd6f332ea07d1db74f', '0855804990', 'zapilb@gmail.com', '', '', 'Highlands North Ext', 'Johannesburg', 'Gauteng', 2121, NULL),
(85, 'Member', NULL, 'Huey', 'Duck', '$2y$12$t8XCMSChsoi77ALitdKhnu1Tph0lrvJ1EQE3CLzs2C1.zdlmlLz2G', '3e2245edc9c94f2d30963726e2835eeda0d1bc4bee83a0d5488714c8dfa9b8176c86ef5b74cc0750e8d9b95b9ddf011438c9743076f1251e4c787ba5845d5ab5', '', 'hueyduck@gmail.com', '', '', '', '', 'Gauteng', 1212, NULL),
(86, 'Member', NULL, 'DUEY', 'Duck', '$2y$12$JZxf1j5u.57d.WhLU12FDeVMW9JbKKzZVA24lRMvROfHAKOlZe/Sq', '188cd7bafd636ad57a7859b9a9793a8304d7f4a6d4f93c393b549edea6175cee08a9aa7184e7e180cc985d2d7aa0de91a1a37fa7a138b94292e5afa9466a3ac0', '', 'dueyduck@gmail.com', '', '', 'Duckville', 'Disneyland', 'Gauteng', 2121, NULL),
(87, 'Member', NULL, 'Porky', 'Pig', '$2y$12$/hcVoVrC6OP45emSMOpRwuYmx/ZP/1jkwJRzrOpf26o70ZdRmkn2y', 'd409702d13f47c2b67ba7dc32e713128d9dc51acc7ee9b6fc67a4466ce2cef4be726fa5f89032050743ec11c34e8136ba0577b17667dbafa84bf7216fbc9a362', '', 'porky@looney.com', '', '', 'Duckville', 'Disneyland', 'Gauteng', 2222, NULL),
(88, 'Member', NULL, 'Louie', 'Duck', '$2y$12$nWxxwVt2ShmUM64ePLWlx.f5EHATyWWiG7Xl8lna102JsJVcS9xxq', 'dc9b4904b857aac2d528a262f1d6d60b7513f60923cdea127517cfe3d3cf176b30dfb697d06b2a2b36cc6b7baa53daeed26589f18658ea2a0387fe771e7c6af9', '', 'louieduck@gmail.com', '', '', '', '', 'Gauteng', 2345, NULL),
(89, 'Member', NULL, 'Amy', 'Lee', '$2y$12$tetmi0lFrNEhLE7tBepuL.zfMyYq0hqYcyO9cA7r5KnFMp7Ts/lG.', '91dd038b0d6bdc03127ff1a85fd2b7ae06084b33ce6286a490a3faba53a5e96b0edf7e10c93e2ce18da8213b67db275a56cce54bd76747bb14d871f3f074be24', '0833000111', 'amy@something.co.za', '', '', 'Hout Bay', 'Cape Town', 'Gauteng', 2001, NULL),
(90, 'Member', NULL, 'dsds', 'fdfd', '$2y$12$oMeJym83AgAhIzVFZgX8reqTrjODCzonmQZa7Erghy95lXEeSPShC', 'ab79c2a08ea82b9db4335e5af212d924c6e002e25af0e03f021690d0693a527178b33f0eb7f9a7e74a658a78ac1f25d009c71bcedb6b2de797afe1ec6b581564', 'dfdf', 'dfdf', '', '', 'asaas', 'asas', 'Gauteng', 2000, NULL),
(91, 'Member', NULL, 'test', 'test', '$2y$12$pX8r6Aqju4brx/llU1ow7eQPMs8lHL5MMCwjJ19Kw7RepgqtA4QRu', '57afb03caa8b10e424375cdec40d65176e40427e0ec44584601758304238f003cc8c887a9aff29a8ae52c6c335ec8b315e0d9a114a90b1edcaf72682a66417cd', '12345', 'test@gmail.com', '', '', '', '', 'Gauteng', 1234, NULL),
(92, 'Member', NULL, 'Angus', 'dippenaar', '$2y$12$m0t/XwQRhAZk3VsC9hbzve1TVymDj51.5ht81VogInvLg8IA0WRFq', '37c7e388661c87ea1c6acec93dc84fac2da194c1c13c1792d569d9eb02431b142d32226ad478c5a421c9ec8303aa9ddb3e3e8cbfeb320231eab306d4d58f1039', '086075759', 'angusdippenaar@gmail.com', '', '', 'Byranston', 'Johannesburg', 'Gauteng', 2121, NULL),
(93, 'Member', NULL, 'Bugs', 'Bunny', '$2y$12$e2l/EgbSZJKtRIJ1bzmWluQUb6Aysuy3vk3rhIbKfeMKF8wZhInMS', '42db55f19e167afcd05b8a14cd2097035eb302bc4f34f91a99a3d568303f7a0067256d32a66c3f87f42a64e7c9c213bca17e4cf1accb96e8b5ea51803b11bd4b', '0976665554', 'bugs@gmail.com', '', '', 'Warner Bros', 'Studio City', 'Gauteng', 2222, NULL),
(94, 'Member', NULL, 'Happy', 'Duck', '$2y$12$IUPiuebFiCly.JYRiVOSSORbstZKvp4CSKifmN/kFE5uRzuMOiSBm', '4dcc3bb539387dffabd328abd4ed9052a1f565a0ec27f0deab6a0fbf4c15b54a274c688285676ef8ba1c1a223965acfa115b693c2bc4b1d35a5a7c0213543dc8', '7652347890', 'happy@gmail.com', '', '', 'City Y', 'Z-Town', 'Gauteng', 2345, NULL),
(95, 'Member', NULL, 'Hello', 'Petter', '$2y$12$H3BnyT8a73RHdxigu1ihL.XCmSZqg5kxnFdVFEpGu8BZZwU/AR04q', '3927d52647e3a4688b21c6675b2ec94852763c960b03138b3c796fa27eb8583cf2fe61afacbf861d0eab6e2195a69adda4dbb053c0330f342454d5bcb129e6f0', '0725567654', 'hello@gmail.com', '', '', '', '', 'Gauteng', 2000, NULL),
(96, 'Member', NULL, 'Robert', 'Jones', '$2y$12$kejzYvPdKFzW7B71QDpsFuDFGd0A9HTUciUj8gEnOnCWKnNFGUWey', '5d7ddb94aa7f5e7a48a07f36cda7feead9620fc9efb196cfc501e7bcaf34e7435e750fcec338f9cc789eb5be2cfc24fb7674b26ec6b4c37a179b94ffd2301b71', '(609) 240-', '94.rob.jones@gmail.com', '66 Verdi st', '', 'Constantia Park', 'Pretoria', 'Gauteng', 122, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_work_experience`
--

CREATE TABLE IF NOT EXISTS `tb_work_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_work_experience`
--

INSERT INTO `tb_work_experience` (`id`, `user_id`, `role`, `description`, `start_date`, `end_date`) VALUES
(3, 34, 'Waiter', 'really? what do you expect?', '2016-05-11', '2016-10-03');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_application_link`
--
ALTER TABLE `tb_application_link`
  ADD CONSTRAINT `tb_application_link_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_application_link_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `tb_job` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_complaints`
--
ALTER TABLE `tb_complaints`
  ADD CONSTRAINT `tb_complaints_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `tb_incident`
--
ALTER TABLE `tb_incident`
  ADD CONSTRAINT `tb_incident_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `tb_police_station` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_job`
--
ALTER TABLE `tb_job`
  ADD CONSTRAINT `tb_job_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `tb_company` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_job_ibfk_2` FOREIGN KEY (`recruter_id`) REFERENCES `tb_recruiter` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_police_officer`
--
ALTER TABLE `tb_police_officer`
  ADD CONSTRAINT `tb_police_officer_ibfk_1` FOREIGN KEY (`police_station_id`) REFERENCES `tb_police_station` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_qualification`
--
ALTER TABLE `tb_qualification`
  ADD CONSTRAINT `tb_qualification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_recruiter`
--
ALTER TABLE `tb_recruiter`
  ADD CONSTRAINT `tb_recruiter_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_work_experience`
--
ALTER TABLE `tb_work_experience`
  ADD CONSTRAINT `tb_work_experience_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
