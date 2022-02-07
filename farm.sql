-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3303
-- Generation Time: Jan 31, 2022 at 08:01 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE DATABASE IF NOT EXISTS `Farm` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Farm`;

DROP TABLE IF EXISTS `User` CASCADE
;

DROP TABLE IF EXISTS `Supplier` CASCADE
;

DROP TABLE IF EXISTS `Crop` CASCADE
;

DROP TABLE IF EXISTS `Equip` CASCADE
;

DROP TABLE IF EXISTS `Fertilizer` CASCADE
;

DROP TABLE IF EXISTS `Insecticide` CASCADE
;

DROP TABLE IF EXISTS `Request` CASCADE
;

DROP TABLE IF EXISTS `Logs` CASCADE
;

DROP TABLE IF EXISTS `Consumed` CASCADE
;

-- --------------------------------------------------------

--
-- Table structure for table `consumed`
--

CREATE TABLE `consumed` (
  `name` varchar(30) NOT NULL,
  `itemName` varchar(30) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `totalPrice` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crop`
--

CREATE TABLE `crop` (
  `name` varchar(30) NOT NULL,
  `startMonth` varchar(30) DEFAULT NULL,
  `endMonth` varchar(30) DEFAULT NULL,
  `season` varchar(20) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `enabled` varchar(10) DEFAULT NULL,
  `describ` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crop`
--

INSERT INTO `crop` (`name`, `startMonth`, `endMonth`, `season`, `image`, `price`, `enabled`, `describ`) VALUES
('Apple', 'January', 'January', 'Spring', 'apple.jpg', 6.80, 'on', 'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. Apples have religious and mythological significance in many cultures, including Norse, Greek, and European Christian tradition.'),
('Orange', 'September', 'Decemeber', 'Winter', 'Orange.jpg', 34.50, 'on', 'An orange is a fruit of various citrus species in the family Rutaceae (see list of plants known as orange); it primarily refers to Citrus × sinensis,[1] which is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange. The sweet orange reproduces asexually (apomixis through nucellar embryony); varieties of sweet orange arise through mutations.'),
('Wheat', 'January', 'January', 'Spring', 'Wheat.jpg', 6.40, 'on', 'Wheat is a grass widely cultivated for its seed, a cereal grain which is a worldwide staple food.[2][3][4] The many species of wheat together make up the genus Triticum; the most widely grown is common wheat (T. aestivum). The archaeological record suggests that wheat was first cultivated in the regions of the Fertile Crescent around 9600 BCE. Botanically, the wheat kernel is a type of fruit called a caryopsis.');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `name` varchar(30) NOT NULL,
  `equipRange` int(11) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `enabled` varchar(10) NOT NULL,
  `describ` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`name`, `equipRange`, `image`, `price`, `enabled`, `describ`) VALUES
('AGRAS T30 Drone', 50, 'drone.png', 670.50, 'on', 'With the revolutionary branch-targeting technology and adjustable arms, the Agras T30 penetrates thick canopies with oblique spraying, ensuring uniform adhesion of liquid pesticides and increasing the number of droplets by 100%. With the help of the Smart Agriculture Cloud Platform and cloud-based mapping, users can manage a 3D digital orchard on their smartphone, making it easy to get started with digital agriculture.'),
('Rotary Tiller', 20, 'Agrimate Rotary Tiller.jpg', 595.50, 'on', 'Usage & Recommendation :\r\nWeeding/tilling in row crops (secondary tilling). \r\nLight tilling & weeding.\r\nApplications :\r\nGardens, Horticulture crops etc.\r\nHighly useful in small holding flower gardens, vegetable fields etc. \r\nBenefits :\r\nMore area coverage in less time, saving in Man days. \r\nAdjustable handle as per operator comfort.\r\nEasy to use.\r\nBy adopting the latest technology in manufacturing the product are made unique in design, portability, operating and utility.\r\nLight in weight & easy to use.');

-- --------------------------------------------------------

--
-- Table structure for table `fertilizer`
--

CREATE TABLE `fertilizer` (
  `name` varchar(30) NOT NULL,
  `fertRange` int(11) DEFAULT NULL,
  `plantType` varchar(40) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `enabled` varchar(10) DEFAULT NULL,
  `describ` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fertilizer`
--

INSERT INTO `fertilizer` (`name`, `fertRange`, `plantType`, `image`, `price`, `enabled`, `describ`) VALUES
('Amino Acid', 23, 'Rice', 'fert1.jpg', 43.50, 'on', 'Presently, there have been a lot of researches sharing benefiting from the amino acids after adding them in the soil, which significantly improves soil quality, resulting in dark green leafy plants. It shows that plants do not only need normal fertilizer application, but also amino acids application.'),
('Mahir Power', 30, 'Rice', 'Mihir.jpg', 43.80, 'on', 'Mahir (Pymetrozine 50% WG) has the best chemistry for effective control of BPH, it is a systematic and trans laminar insecticide that paralyzes the hopper, stops laying eggs and the insects die of starvation.');

-- --------------------------------------------------------

--
-- Table structure for table `insecticide`
--

CREATE TABLE `insecticide` (
  `name` varchar(30) NOT NULL,
  `insecRange` int(11) DEFAULT NULL,
  `insect` varchar(30) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `enabled` varchar(10) NOT NULL,
  `describ` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insecticide`
--

INSERT INTO `insecticide` (`name`, `insecRange`, `insect`, `image`, `price`, `enabled`, `describ`) VALUES
('Avera Spectrum', 100, 'Ants', 'Avera.jpg', 40.50, 'on', 'Areva (Thiamethoxam 25% Wg) is a granular soluble insecticide of Neonicotinoid group. It gives protection against insects for a longer period in comparison to other insecticides. Areva is safe to the environment in comparison to other insecticides because of its lesser dose per acre'),
('Fax Insecticide', 85, 'Worms', 'Fac_sc.jpg', 43.60, 'on', 'Fax SC (Fipronil 5% SC) is a modern insecticide of Phenylpyrazole group which controls the insect pests of rice, chilli, cabbage/cauliflower and sugarcane effectively. It has been proven to offer low dose, highly effective insect control against a broad range of economically important pests.');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `time` varchar(40) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`time`, `name`) VALUES
('Fri Jan 14 08:54:49 EET 2022', 'AbdoFarmer'),
('Fri Jan 14 13:02:09 EET 2022', 'AbdoFarmer'),
('Mon Jan 24 20:57:42 EET 2022', 'AbdoFarmer'),
('Mon Jan 31 07:48:23 EET 2022', 'AbdoFarmer'),
('Mon Jan 31 07:58:08 EET 2022', 'AbdoFarmer'),
('Sat Jan 15 17:00:51 EET 2022', 'AbdoFarmer'),
('Sun Jan 30 07:48:23 EET 2022', 'AbdoFarmer'),
('Thu Jan 13 21:55:10 EET 2022', 'AbdoFarmer'),
('Thu Jan 27 05:04:24 EET 2022', 'AbdoFarmer'),
('Thu Jan 27 06:58:27 EET 2022', 'AbdoFarmer'),
('Thu Jan 27 08:23:40 EET 2022', 'AbdoFarmer'),
('Thu Jan 27 08:27:01 EET 2022', 'AbdoFarmer'),
('Thu Jan 06 22:04:09 EET 2022', 'EgyManager'),
('Sun Jan 30 07:48:21 EET 2022', 'HamedSup'),
('Sun Jan 30 07:48:22 EET 2022', 'HamedSup'),
('Fri Jan 14 06:36:49 EET 2022', 'HassanOS'),
('Fri Jan 14 08:53:17 EET 2022', 'HassanOS'),
('Mon Jan 31 07:10:40 EET 2022', 'HassanOS'),
('Mon Jan 31 07:55:08 EET 2022', 'HassanOS'),
('Mon Jan 31 08:06:30 EET 2022', 'HassanOS'),
('Mon Jan 31 08:06:42 EET 2022', 'HassanOS'),
('Mon Jan 31 14:41:26 EET 2022', 'HassanOS'),
('Mon Jan 31 18:55:17 EET 2022', 'HassanOS'),
('Mon Jan 31 19:45:01 EET 2022', 'HassanOS'),
('Sat Jan 15 17:00:33 EET 2022', 'HassanOS'),
('Sat Jan 15 17:03:38 EET 2022', 'HassanOS'),
('Sat Jan 15 19:30:19 EET 2022', 'HassanOS'),
('Thu Jan 06 21:43:02 EET 2022', 'HassanOS'),
('Thu Jan 06 21:49:15 EET 2022', 'HassanOS'),
('Thu Jan 06 22:00:02 EET 2022', 'HassanOS'),
('Thu Jan 13 21:45:09 EET 2022', 'HassanOS'),
('Thu Jan 27 05:08:09 EET 2022', 'HassanOS'),
('Thu Jan 27 05:43:36 EET 2022', 'HassanOS'),
('Thu Jan 27 05:45:50 EET 2022', 'HassanOS'),
('Thu Jan 27 05:48:43 EET 2022', 'HassanOS'),
('Thu Jan 27 08:19:41 EET 2022', 'HassanOS'),
('Thu Jan 27 08:25:10 EET 2022', 'HassanOS'),
('Thu Jan 27 08:27:24 EET 2022', 'HassanOS'),
('Thu Jan 27 08:10:58 EET 2022', 'IbrahimLand'),
('Thu Jan 27 08:26:05 EET 2022', 'IbrahimLand');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `time` varchar(40) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `supName` varchar(30) DEFAULT NULL,
  `cname` varchar(30) DEFAULT NULL,
  `describ` varchar(550) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `totalPrice` double(10,2) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`time`, `type`, `name`, `supName`, `cname`, `describ`, `quantity`, `totalPrice`, `status`) VALUES
('Thu Jan 13 22:00:20 EET 2022', 'Crop', 'AbdoFarmer', 'HassanOS', 'Apple', 'I need apple seeds for next season', 7, 47.60, 'Delivered'),
('Thu Jan 26 07:21:14 EET 2022', 'Crop', 'AbdoFarmer', 'HassanOS', 'Wheat', 'I want some wheat for next season', 16, 102.40, 'Delivered'),
('Thu Jan 26 07:22:28 EET 2022', 'Equipment', 'AbdoFarmer', 'HassanOS', 'Rotary Tiller', 'I want to try new technologies', 4, 2382.00, 'Corrupted'),
('Thu Jan 27 05:06:22 EET 2022', 'Crop', 'AbdoFarmer', 'HassanOS', 'Wheat', 'hi', 6, 38.40, 'Delivered'),
('Thu Jan 27 07:21:14 EET 2022', 'Crop', 'AbdoFarmer', 'HassanOS', 'Wheat', 'I want some wheat for next season', 8, 51.20, 'Delivered'),
('Thu Jan 27 07:21:35 EET 2022', 'Crop', 'AbdoFarmer', 'All', 'Wheat', 'I want some wheat for next season', 2, 12.80, 'Rejected'),
('Thu Jan 27 07:22:15 EET 2022', 'Equipment', 'AbdoFarmer', 'All', 'AGRAS T30 Drone', 'I want to try new technologies', 1, 670.50, 'Rejected'),
('Thu Jan 27 07:22:28 EET 2022', 'Equipment', 'AbdoFarmer', 'HassanOS', 'Rotary Tiller', 'I want to try new technologies', 2, 1191.00, 'Delivered'),
('Thu Jan 27 07:22:56 EET 2022', 'Equipment', 'AbdoFarmer', 'HassanOS', 'AGRAS T30 Drone', 'I want to try new technologies', 1, 670.50, 'Delivered'),
('Thu Jan 27 07:23:56 EET 2022', 'Insecticide', 'AbdoFarmer', 'HassanOS', 'Avera Spectrum', 'I want Avera Spectrum to face insects in my farm', 6, 243.00, 'Corrupted'),
('Thu Jan 27 07:24:42 EET 2022', 'Insecticide', 'AbdoFarmer', 'HassanOS', 'Fax Insecticide', 'I want fax Spectrum to face insects in my farm', 89, 3880.40, 'Corrupted'),
('Thu Jan 27 07:25:05 EET 2022', 'Insecticide', 'AbdoFarmer', 'All', 'Avera Spectrum', 'I want Avera Spectrum to face insects in my farm', 32, 1296.00, 'Rejected'),
('Thu Jan 27 07:26:02 EET 2022', 'Fertilizer', 'AbdoFarmer', 'All', 'Amino Acid', 'I want Amino Acid to help plants to grow faster in my farm', 10, 435.00, 'Rejected'),
('Thu Jan 27 07:26:28 EET 2022', 'Fertilizer', 'AbdoFarmer', 'All', 'Mahir Power', 'I want Mahir to help plants to grow faster in my farm', 24, 1051.20, 'Rejected'),
('Thu Jan 27 08:12:58 EET 2022', 'Crop', 'IbrahimLand', 'HassanOS', 'Wheat', 'session requset: I want some wheat seeds to plant for next summer', 5, 32.00, 'Accepted'),
('Thu Jan 27 22:00:20 EET 2022', 'Crop', 'AbdoFarmer', 'HassanOS', 'Apple', 'I need apple seeds for next season', 7, 47.60, 'Delivered'),
('Thu Jan 30 07:21:14 EET 2022', 'Crop', 'AbdoFarmer', 'HassanOS', 'Wheat', 'I want some wheat for next season', 16, 102.40, 'Delivered'),
('Thu Jan 31 07:22:56 EET 2022', 'Equipment', 'AbdoFarmer', 'HassanOS', 'AGRAS T30 Drone', 'I want to try new technologies', 1, 670.50, 'Delivered'),
('Thu Jan 31 08:12:58 EET 2022', 'Crop', 'IbrahimLand', 'HassanOS', 'Wheat', 'session requset: I want some wheat seeds to plant for next summer', 5, 32.00, 'Accepted'),
('Thu Jan 31 22:00:20 EET 2022', 'Crop', 'AbdoFarmer', 'HassanOS', 'Apple', 'I need apple seeds for next season', 7, 47.60, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `name` varchar(30) DEFAULT NULL,
  `userName` varchar(30) NOT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Mobile` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`name`, `userName`, `RoleID`, `Password`, `Mobile`, `City`, `State`, `Address`, `Email`) VALUES
('Abdul Kader Ahmed', 'AbdoFarmer', 2, 'Kader123', '+60-4363-2353', 'Mekkah', 'Selangor', 'Al-jin street', 'Kader@gmail.com'),
('All', 'All', 3, NULL, NULL, NULL, NULL, NULL, NULL),
('Manager', 'EgyManager', 1, 'EgyManager1', '+60-3424-6543', 'Skudai', 'Selangor', 'taman U, 81300 1 jalan', 'osama@gmail.com'),
('Hamed', 'HamedSup', 3, 'AhmedOS1', '+60-2325-9548', 'south area', 'Selangor', 'Arvan street, 84500', 'hi@gmail.com'),
('Hassan', 'HassanOS', 3, 'AhmedOS1', '+60-2325-9548', 'south area', 'Selangor', 'Arvan street, 84500', 'hi@gmail.com'),
('Ibrahim Hassan', 'IbrahimLand', 2, 'Ibra123456', '+60-4363-2356', 'Tun Aminah', 'Johor', '1st jalan, 81300 ', 'ibrahim@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consumed`
--
ALTER TABLE `consumed`
  ADD PRIMARY KEY (`name`,`itemName`);

--
-- Indexes for table `crop`
--
ALTER TABLE `crop`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `fertilizer`
--
ALTER TABLE `fertilizer`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `insecticide`
--
ALTER TABLE `insecticide`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`time`),
  ADD KEY `FK_User_Logs` (`name`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`time`),
  ADD KEY `FK_User_Req` (`name`),
  ADD KEY `FK_Supplier_Req` (`supName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consumed`
--
ALTER TABLE `consumed`
  ADD CONSTRAINT `FK_Consumed_Supplier` FOREIGN KEY (`name`) REFERENCES `user` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `FK_User_Logs` FOREIGN KEY (`name`) REFERENCES `user` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `FK_Supplier_Req` FOREIGN KEY (`supName`) REFERENCES `user` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_User_Req` FOREIGN KEY (`name`) REFERENCES `user` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
