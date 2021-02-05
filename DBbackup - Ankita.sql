-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Dec 08, 2020 at 08:26 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lifetime_fitness`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRAINER_PERFORMANCE1` (IN `DMESSAGE` VARCHAR(200))  BEGIN
SELECT M.userName, MS.planName, M.joinDate, MS.planType, C.cancellationDate, D.message, R.reservationDate, W.description,W.workoutType,
T.trainerName,T.joinDate,T.phoneNumber,T.salary
FROM member AS M INNER JOIN membership AS MS ON M.planID=MS.planID
LEFT JOIN cancellation AS C ON C.memberID=M.memberID
LEFT JOIN dissatisfaction_cancellation AS D ON D.dCancellationID=C.cancellationID
LEFT JOIN reservation AS R ON R.memberID=M.memberID
LEFT JOIN workout_session AS W ON W.workoutID=R.workoutID
LEFT JOIN TRAINER AS T ON T.sessionID=W.workoutID
WHERE D.message=DMESSAGE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cancellation`
--

CREATE TABLE `cancellation` (
  `cancellationID` int(50) NOT NULL,
  `cancellationDate` date NOT NULL,
  `reason` varchar(150) NOT NULL,
  `finalDecision` varchar(150) NOT NULL,
  `memberID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cancellation`
--

INSERT INTO `cancellation` (`cancellationID`, `cancellationDate`, `reason`, `finalDecision`, `memberID`) VALUES
(1, '2020-11-01', 'Rate', 'Yes, Cancel Membership', 1),
(2, '2020-11-02', 'Dissatisfaction', 'No, Continue Membership', 2),
(3, '2020-11-02', 'Move', 'Yes, Cancel Membership', 3),
(4, '2020-11-03', 'Rate', 'No, Continue Membership', 4),
(5, '2020-11-04', 'Dissatisfaction', 'No, Continue Membership', 5),
(6, '2020-11-04', 'Move', 'No, Continue Membership', 6),
(7, '2020-11-06', 'Dissatisfaction', 'Yes, Cancel Membership', 10),
(8, '2020-11-07', 'Rate', 'No, Continue Membership', 11),
(9, '2020-11-08', 'Dissatisfaction', 'Yes, Cancel Membership', 12),
(10, '2020-11-09', 'Rate', 'No, Continue Membership', 13);

-- --------------------------------------------------------

--
-- Table structure for table `dissatisfaction_cancellation`
--

CREATE TABLE `dissatisfaction_cancellation` (
  `dCancellationID` int(50) NOT NULL,
  `message` varchar(200) NOT NULL,
  `managerID` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dissatisfaction_cancellation`
--

INSERT INTO `dissatisfaction_cancellation` (`dCancellationID`, `message`, `managerID`) VALUES
(2, 'Billing Issue', 1),
(5, 'Problems with the Service', 2),
(7, 'Problems with the Product', 3),
(9, 'Training Issue', 4);

-- --------------------------------------------------------

--
-- Table structure for table `group_class`
--

CREATE TABLE `group_class` (
  `gworkoutID` int(50) NOT NULL,
  `className` varchar(20) NOT NULL,
  `classSize` int(5) NOT NULL,
  `roomNumber` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_class`
--

INSERT INTO `group_class` (`gworkoutID`, `className`, `classSize`, `roomNumber`) VALUES
(1, 'Group PWR', 10, 1),
(2, 'Group H.I.I.T', 10, 2),
(3, 'Group Strength', 20, 3),
(4, 'Group SOL', 15, 4),
(5, 'Group EDG Cycle', 13, 5),
(6, 'Group Pilates', 12, 6),
(7, 'Group Yoga', 23, 1),
(8, 'Group Zumba', 11, 2),
(9, 'Meditation', 23, 3),
(10, 'Group SHRED', 12, 4),
(11, 'Group Sculpt', 12, 5),
(12, 'Group Pilates Fusion', 23, 6),
(13, 'Group Strength', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gym_location`
--

CREATE TABLE `gym_location` (
  `locationID` int(50) NOT NULL,
  `locationName` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `zipcode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gym_location`
--

INSERT INTO `gym_location` (`locationID`, `locationName`, `state`, `zipcode`) VALUES
(1, 'Vestavia Hills', 'Alabama', '35243'),
(2, 'Biltmore', 'Arizona', '85016'),
(3, 'Happy Valley-Peoria', 'Arizona', '85383'),
(4, 'Palm Valley', 'Arizona', '85395'),
(5, 'Tempe', 'Arizona', '85284'),
(6, 'Gilbert', 'Arizona', '85296'),
(7, 'North Scottsdale', 'Arizona', '85054'),
(8, 'Folsom', 'California', '95630'),
(9, 'Laguna Niguel', 'California', '92677'),
(10, 'Roseville', 'California', '95661'),
(11, 'La Jolla', 'California', '92037'),
(12, 'Rancho San Clemente', 'California', '92672'),
(13, 'Centennial', 'Colarado', '80122'),
(14, 'Cherry Creek', 'Colarado', '80246'),
(15, 'Flatirons', 'Colarado', '80021'),
(16, 'Westminster', 'Colarado', '80020'),
(17, 'Centennial Tennis', 'Colarado', '80122'),
(18, 'Colarado Springs', 'Colarado', '80920'),
(19, 'Parker-Aurora', 'Colarado', '80138'),
(20, 'Boca Baton', 'Florida', '33431'),
(21, 'Life Time Living Coral Gables', 'Florida', '33133'),
(22, 'Palm Beach Gardens', 'Florida', '33410'),
(23, 'Coral Gables', 'Florida', '33146'),
(24, 'Tampa', 'Florida', '33607'),
(25, 'Alpharetta', 'Georgia', '30005'),
(26, 'Peachtree Corners', 'Georgia', '30092'),
(27, 'Sugarloaf', 'Georgia', '30024'),
(28, 'John Creeks', 'Georgia', '30097'),
(29, 'Sandy Springs', 'Georgia', '30342'),
(30, 'Woodstock', 'Georgia', '30188'),
(31, 'Algonquin', 'Illinois', '60102'),
(32, 'Burr Ridge', 'Illinois', '60527'),
(33, 'Northbrook', 'Illinois', '60062'),
(34, 'Old Orchard', 'Illinois', '60077'),
(35, 'Schaumburg', 'Illinois', '60173'),
(36, 'Warrenville', 'Illinois', '60555'),
(37, 'Bloomingdale', 'Illinois', '60108'),
(38, 'Lake Zurich', 'Illinois', '60047'),
(39, 'Oakbrook', 'Illinois', '60523'),
(40, 'Orland Park', 'Illinois', '60467'),
(41, 'Romeoville', 'Illinois', '60446'),
(42, 'Vernon Hills', 'Illinois', '60061'),
(43, 'Castle Creek', 'Indiana', '46250'),
(44, 'North Meridian', 'Indiana', '46260'),
(45, 'Fishers', 'Indiana', '46038'),
(46, 'Des Moines', 'IOWA', '50323'),
(47, 'Lenexa', 'Kansas', '66219'),
(48, 'Overland Park', 'Kansas', '66223'),
(49, 'Columbia', 'Maryland', '21046'),
(50, 'Rockville', 'Maryland', '20854'),
(51, 'Gaithersburg', 'Maryland', '20878'),
(52, 'Burlington', 'Massachusetts', '1803'),
(53, 'MetroWest-Boston', 'Massachusetts', '1701'),
(54, 'Westwood', 'Massachusetts', '2090'),
(55, 'Chestnut Hill', 'Massachusetts', '2467'),
(56, 'Northshore', 'Massachusetts', '1960'),
(57, 'No match', 'No match', 'No match');

-- --------------------------------------------------------

--
-- Table structure for table `gym_membership`
--

CREATE TABLE `gym_membership` (
  `gplanID` int(50) NOT NULL,
  `equipmentSeries` varchar(20) NOT NULL,
  `floorNo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gym_membership`
--

INSERT INTO `gym_membership` (`gplanID`, `equipmentSeries`, `floorNo`) VALUES
(1, '1-20', 1),
(2, '21-26', 2),
(3, '27-31', 1),
(5, '32-36', 2),
(6, '37-40', 1),
(7, '41-45', 2),
(8, '46-48', 1),
(9, '49-51', 2),
(10, '52-54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `individual_session`
--

CREATE TABLE `individual_session` (
  `iworkoutID` int(50) NOT NULL,
  `roomName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `individual_session`
--

INSERT INTO `individual_session` (`iworkoutID`, `roomName`) VALUES
(14, 'Studio One'),
(15, 'Pilates Room'),
(16, 'Yoga Studio'),
(17, 'GTX Space'),
(18, 'Studio 1'),
(19, 'Yoga Studio'),
(20, 'Cycle Studio'),
(21, 'Studio 2'),
(22, 'Outdoors'),
(23, 'Yoga Studio'),
(26, 'Fitness Floor');

-- --------------------------------------------------------

--
-- Stand-in structure for view `locationanalysis`
-- (See below for the actual view)
--
CREATE TABLE `locationanalysis` (
`memberID` int(50)
,`memberFirstName` varchar(20)
,`reason` varchar(150)
,`planName` varchar(20)
,`newZipCode` int(20)
,`newLocationName` varchar(200)
,`state` varchar(200)
,`locationName` varchar(200)
,`finalDecision` varchar(150)
);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `managerID` int(50) NOT NULL,
  `managerName` varchar(20) NOT NULL,
  `contactNumber` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`managerID`, `managerName`, `contactNumber`, `email`) VALUES
(1, 'Daniel Malone', '(360) 669-3923', 'dan@gmail.com'),
(2, 'Emerson Espinoza', '(873) 392-8802', 'emerson@gmail.com'),
(3, 'Elmo Lopez', '(295) 983-3476', 'elmo@gmail.com'),
(4, 'Aaron Trujillo', '(983) 632-8597', 'aaron@gmail.com'),
(5, 'Liberty Walton', '(581) 379-7573', 'liberty@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `memberID` int(50) NOT NULL,
  `memberFirstName` varchar(20) NOT NULL,
  `memberLastName` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `emailAddress` varchar(20) NOT NULL,
  `userName` varchar(20) GENERATED ALWAYS AS (`memberFirstName`) VIRTUAL,
  `joinDate` date NOT NULL,
  `planID` int(50) NOT NULL,
  `aptNo` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberID`, `memberFirstName`, `memberLastName`, `DOB`, `phoneNumber`, `emailAddress`, `joinDate`, `planID`, `aptNo`, `street`, `city`, `state`, `zip`) VALUES
(1, 'Ankita', 'Singh', '1960-07-30', '(257) 563-7401', 'abc@gmail.com', '2018-01-01', 1, '111', '711-2880 Nulla St.', 'Mankato', 'Mississippi', '96522'),
(2, 'Iris', 'Watson', '1961-07-30', '(372) 587-2335', 'def@gmail.com', '2016-03-02', 1, 'P.O. Box 283', 'Fusce Rd.', 'Frederick', 'Nebraska', '20620'),
(3, 'Celeste', 'Slater', '1990-04-12', '(786) 713-8616', 'ghi@gmail.com', '2019-04-12', 2, '606-3727', 'Ullamcorper. Street', 'Roseville', 'NH', '11523'),
(4, 'Theodore', 'Lowe', '2000-12-01', '(793) 151-6230', 'Lowe@gmail.com', '2015-03-05', 3, 'Ap #867-859', 'Sit Rd.', 'Azusa', 'New York', '39531'),
(5, 'Calista', 'Wise', '1998-03-09', '(492) 709-6392', 'wise@gmail.com', '2019-05-12', 7, '7292', 'Dictum Av.', 'San Antonio', 'MI', '47096'),
(6, 'Kyla', 'Olsen', '1985-02-22', '(654) 393-5734', 'olsen@gmail.com', '2019-03-05', 10, 'Ap #651-8679', 'Sodales Av.', 'Tamuning', 'PA', '10855'),
(7, 'Forrest', 'Ray', '1995-05-20', '(404) 960-3807', 'ray@gmail.com', '2019-05-23', 8, '191-103', ' Integer Rd.', 'Corona', 'New Mexico', '8219'),
(8, 'Hiroko', 'Potter', '1993-06-13', '(314) 244-6306', 'potter@gmail.com', '2018-02-04', 9, 'P.O. Box 887 2508', 'Dolor. Av.', 'Muskegon', 'KY', '12482'),
(9, 'Nyssa', 'Vazquez', '2001-01-01', '(947) 278-5929', 'nya@gmail.com', '2018-04-07', 4, '511-5762', 'At Rd.', 'Chelsea', 'MI', '67708'),
(10, 'Lawrence', 'Moreno', '1999-10-23', '(684) 579-1879', 'moreno@gmail.com', '2017-12-12', 5, '935-9940', 'Tortor. Street', 'Santa Rosa', 'MN', '98804'),
(11, 'Ina', 'Moran', '1989-03-14', '(389) 737-2852', 'ina@gmail.com', '2018-03-14', 6, 'P.O. Box 929 4189', 'Nunc Road', 'Lebanon', 'KY', '69409'),
(12, 'Aaron', 'Hawkins', '1989-04-01', '(660) 663-4518', 'hawk@gmail.com', '2019-04-05', 8, '5587', 'Nunc. Avenue', 'Erie', 'Rhode Island', '24975'),
(13, 'Hedy', 'Greene', '1990-09-26', '(608) 265-2215', 'greene@gmail.com', '2017-02-12', 8, 'Ap #696-3279', 'Viverra. Avenue', 'Latrobe', 'DE', '38100'),
(14, 'Melvin', 'Porter', '1994-06-11', '(959) 119-8364', 'porter@gmail.com', '2018-02-12', 8, 'P.O. Box 132 1599', 'Curabitur Rd.', 'Bandera', 'South Dakota', '45149'),
(15, 'Keefe', 'Sellers', '1996-07-30', '(468) 353-2641', 'seller@gmail.com', '2019-12-23', 7, '347-7666', 'Iaculis St.', 'Woodruff', 'SC', '49854');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `planID` int(50) NOT NULL,
  `planName` varchar(20) NOT NULL,
  `membershipRate` double NOT NULL,
  `signUpFee` float NOT NULL,
  `durationMonths` int(5) NOT NULL,
  `planType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`planID`, `planName`, `membershipRate`, `signUpFee`, `durationMonths`, `planType`) VALUES
(1, 'Monthly', 100, 50, 1, 'Gym and Spa'),
(2, 'Quarterly', 250, 50, 3, 'Gym and Spa'),
(3, 'Yearly', 600, 150, 12, 'Gym and Spa'),
(4, 'Spa Access', 200, 50, 6, 'Spa'),
(5, 'Club Access', 99, 50, 1, 'Gym and Spa'),
(6, 'Club + Training', 189, 50, 1, 'Gym'),
(7, '26 & Under', 89, 50, 1, 'Gym'),
(8, 'Student', 89, 50, 1, 'Gym and Spa'),
(9, 'Couple', 80, 40, 1, 'Gym and Spa'),
(10, 'Family', 150, 60, 1, 'Gym and Spa');

-- --------------------------------------------------------

--
-- Table structure for table `move_cancellation`
--

CREATE TABLE `move_cancellation` (
  `mCancellationID` int(50) NOT NULL,
  `newLocationName` varchar(200) NOT NULL,
  `newZipCode` int(20) NOT NULL,
  `locationID` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `move_cancellation`
--

INSERT INTO `move_cancellation` (`mCancellationID`, `newLocationName`, `newZipCode`, `locationID`) VALUES
(3, 'Silver Spring', 20910, 57),
(6, 'Rockville', 20854, 50);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rateanalysis`
-- (See below for the actual view)
--
CREATE TABLE `rateanalysis` (
`memberID` int(50)
,`memberFirstName` varchar(20)
,`reason` varchar(150)
,`planName` varchar(20)
,`membershipRate` double
,`preferredRate` float
,`revisedMembershipRate` double
,`revisedPlan` varchar(50)
,`finalDecision` varchar(150)
);

-- --------------------------------------------------------

--
-- Table structure for table `rate_cancellation`
--

CREATE TABLE `rate_cancellation` (
  `rCancellationID` int(50) NOT NULL,
  `preferredRate` float NOT NULL,
  `rateID` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rate_cancellation`
--

INSERT INTO `rate_cancellation` (`rCancellationID`, `preferredRate`, `rateID`) VALUES
(1, 70, 1),
(4, 300, 3),
(8, 130, 6),
(10, 50, 8);

-- --------------------------------------------------------

--
-- Table structure for table `rate_chart`
--

CREATE TABLE `rate_chart` (
  `rateID` int(50) NOT NULL,
  `revisedMembershipRate` double NOT NULL,
  `revisedPlan` varchar(50) NOT NULL,
  `planID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rate_chart`
--

INSERT INTO `rate_chart` (`rateID`, `revisedMembershipRate`, `revisedPlan`, `planID`) VALUES
(1, 75, 'Discounted Monthly Charges', 1),
(2, 200, 'Discounted Quarterly Charges', 2),
(3, 500, 'Discounted Yearly Charges', 3),
(4, 150, 'Discounted Spa Charges', 4),
(5, 50, 'Discounted Club Access Charges', 5),
(6, 140, 'Discounted Club & Training Charges', 6),
(7, 50, 'Discounted 26& Under Charges', 7),
(8, 50, 'Discounted Student Charges', 8),
(9, 50, 'Discounted Couple Charges', 9),
(11, 100, 'Discounted Family Charges', 10);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservationID` int(50) NOT NULL,
  `reservationDate` date NOT NULL,
  `memberID` int(50) NOT NULL,
  `workoutID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservationID`, `reservationDate`, `memberID`, `workoutID`) VALUES
(1, '2020-10-05', 1, 1),
(2, '2020-10-05', 2, 2),
(3, '2020-10-05', 3, 3),
(4, '2020-10-05', 3, 4),
(5, '2020-10-05', 3, 4),
(6, '2020-10-05', 3, 4),
(7, '2020-10-05', 4, 5),
(8, '2020-10-05', 5, 6),
(9, '2020-10-05', 6, 7),
(10, '2020-10-05', 7, 8),
(11, '2020-10-05', 8, 9),
(12, '2020-10-06', 10, 10),
(13, '2020-10-06', 11, 11),
(14, '2020-10-06', 12, 12),
(15, '2020-10-06', 13, 14),
(16, '2020-10-06', 14, 13),
(17, '2020-10-06', 15, 16);

-- --------------------------------------------------------

--
-- Stand-in structure for view `serviceanalysis`
-- (See below for the actual view)
--
CREATE TABLE `serviceanalysis` (
`memberID` int(50)
,`memberFirstName` varchar(20)
,`reason` varchar(150)
,`planName` varchar(20)
,`message` varchar(200)
,`managerName` varchar(20)
,`email` varchar(20)
,`contactNumber` varchar(20)
,`finalDecision` varchar(150)
);

-- --------------------------------------------------------

--
-- Table structure for table `spa_membership`
--

CREATE TABLE `spa_membership` (
  `splanID` int(50) NOT NULL,
  `service` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spa_membership`
--

INSERT INTO `spa_membership` (`splanID`, `service`) VALUES
(1, 'Massage-Time Based'),
(2, 'Nail Care-Time Based'),
(3, 'Hair Care-Time Based'),
(4, 'Skin Care-Time Based'),
(5, 'Massage-Guest Based'),
(8, 'Me-Time-Time Based'),
(9, 'Nail Care- Guest Based'),
(10, 'Hair Care-Guest Based');

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `trainerID` int(50) NOT NULL,
  `trainerName` varchar(100) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `salary` float NOT NULL,
  `joinDate` date NOT NULL,
  `sessionID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trainer`
--

INSERT INTO `trainer` (`trainerID`, `trainerName`, `phoneNumber`, `emailAddress`, `address`, `salary`, `joinDate`, `sessionID`) VALUES
(2, 'Tamara Howe', '(655) 840-6139', 'we3@gmail.com', '3415 Lobortis. Avenue\r\nRocky Mount WA 48580', 4300, '2016-10-06', 1),
(3, 'Keegan Blair', '(577) 333-6244', 'kee@gmail.com', 'Ap #761-2515 Egestas. Rd.\r\nManitowoc TN 07528', 4300, '2016-11-03', 2),
(4, 'Keaton Underwood', '(564) 908-6970', 'keaton@gmail.com', 'p #636-8082 Arcu Avenue\r\nThiensville Maryland 19587', 5000, '2017-04-03', 3),
(5, 'Nasim Strong', '(437) 994-5270', 'nasim@gmail.com', 'Ap #630-3889 Nulla. Street\r\nWatervliet Oklahoma 70863', 5500, '2018-05-23', 3),
(6, 'Pascale Patton', '(676) 334-2174', 'pas@gmail.com', 'P.O. Box 399 4275 Amet Street\r\nWest Allis NC 36734', 5000, '2019-01-20', 4),
(7, 'Ivor Delgado', '(689) 721-5145', 'ivor@gmail.com', 'Ap #310-1678 Ut Av.\r\nSanta Barbara MT 88317', 4000, '2020-02-13', 5),
(9, 'Jordan Calderon', '(427) 930-5255', 'jordan@gmail.com', '430-985 Eleifend St.\r\nDuluth Washington 92611', 5000, '2016-06-03', 6),
(10, 'Zorita Anderson', '(126) 940-2753', 'zor@gmail.com', '1964 Facilisis Avenue\r\nBell Gardens Texas 87065', 5500, '2017-04-12', 7),
(11, 'Sade Higgins', '(422) 517-6053', 'sade@gmail.com', 'Ap #287-3260 Ut St.\r\nWilmington OR 05182', 4000, '2018-05-08', 8),
(12, 'Dante Bennett', '(840) 987-9449', 'dante@gmail.com', '481-8762 Nulla Street\r\nDearborn OR 62401', 4500, '2018-07-08', 9);

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `transferID` int(50) NOT NULL,
  `agreement` varchar(200) NOT NULL,
  `moveDate` date NOT NULL,
  `locationID` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`transferID`, `agreement`, `moveDate`, `locationID`) VALUES
(1, 'yes', '2020-11-29', 50);

-- --------------------------------------------------------

--
-- Table structure for table `workout_session`
--

CREATE TABLE `workout_session` (
  `workoutID` int(50) NOT NULL,
  `workoutTime` varchar(50) NOT NULL,
  `duration` int(2) NOT NULL,
  `days` varchar(15) NOT NULL,
  `description` varchar(50) NOT NULL,
  `workoutType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workout_session`
--

INSERT INTO `workout_session` (`workoutID`, `workoutTime`, `duration`, `days`, `description`, `workoutType`) VALUES
(1, '5:30 AM', 1, 'Monday', 'PWR Cycle', 'Group Class'),
(2, '7:15 AM', 1, 'Monday', 'H.I.I.T', 'Group Class'),
(3, '8:30 AM', 1, 'Monday', 'Barbell Strength', 'Group Class'),
(4, '9:30 AM', 1, 'Monday', 'SOL', 'Group Class'),
(5, '9:45 AM', 1, 'Monday', 'EDG Cycle', 'Group Class'),
(6, '10 AM', 1, 'Monday', 'Discover Pilates', 'Group Class'),
(7, '11 AM', 1, 'Monday', 'Surrender', 'Group Class'),
(8, '5:30 PM', 1, 'Monday', 'Zumba', 'Group Class'),
(9, '7 PM', 1, 'Monday', 'Surrender', 'Group Class'),
(10, '7:15 AM', 1, 'Tuesday', 'SHRED', 'Group Class'),
(11, '8:30 AM', 1, 'Tuesday', 'EDG Sculpt', 'Group Class'),
(12, '8:30 AM', 1, 'Tuesday', 'Pilates Fusion', 'Group Class'),
(13, '9:30 AM', 1, 'Tuesday', 'Strictly Strength', 'Group Class'),
(14, '10:00 AM', 1, 'Tuesday', 'Life Barre', 'Individual Session'),
(15, '11:00 AM', 1, 'Tuesday', 'Core Pilates', 'Individual Session'),
(16, '4:45 PM', 1, 'Tuesday', 'ROOT', 'Individual Session'),
(17, '5:00 PM', 1, 'Tuesday', 'GTX Conditioning', 'Individual Session'),
(18, '7:00 PM', 1, 'Tuesday', 'Dance', 'Individual Session'),
(19, '7:00 PM', 1, 'Tuesday', 'Flow Guided', 'Individual Session'),
(20, '5:30 AM', 1, 'Wednesday', 'PWR Cycle', 'Individual Session'),
(21, '8:30 AM', 1, 'Wednesday', 'Barbell Strength', 'Individual Session'),
(22, '9:30 AM', 1, 'Wednesday', 'ROOT', 'Individual Session'),
(23, '10:30 AM', 1, 'Wednesday', 'SURRENDER', 'Individual Session'),
(24, '4:30 AM', 2, 'Wednesday', 'Zumba', 'Group Class'),
(25, '5:30 PM', 1, 'Wednesday', 'Tabata', 'Group Class'),
(26, '6:30 PM', 1, 'Wednesday', 'C.R.T.', 'Individual Session');

-- --------------------------------------------------------

--
-- Structure for view `locationanalysis`
--
DROP TABLE IF EXISTS `locationanalysis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `locationanalysis`  AS  select `m`.`memberID` AS `memberID`,`m`.`memberFirstName` AS `memberFirstName`,`c`.`reason` AS `reason`,`ms`.`planName` AS `planName`,`l`.`newZipCode` AS `newZipCode`,`l`.`newLocationName` AS `newLocationName`,`gl`.`state` AS `state`,`gl`.`locationName` AS `locationName`,`c`.`finalDecision` AS `finalDecision` from ((((`member` `m` join `cancellation` `c` on((`m`.`memberID` = `c`.`memberID`))) join `membership` `ms` on((`m`.`planID` = `ms`.`planID`))) join `move_cancellation` `l` on((`l`.`mCancellationID` = `c`.`cancellationID`))) join `gym_location` `gl` on(((`gl`.`locationID` = `l`.`locationID`) and (`c`.`reason` = 'Move')))) ;

-- --------------------------------------------------------

--
-- Structure for view `rateanalysis`
--
DROP TABLE IF EXISTS `rateanalysis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rateanalysis`  AS  select `m`.`memberID` AS `memberID`,`m`.`memberFirstName` AS `memberFirstName`,`c`.`reason` AS `reason`,`ms`.`planName` AS `planName`,`ms`.`membershipRate` AS `membershipRate`,`r`.`preferredRate` AS `preferredRate`,`rc`.`revisedMembershipRate` AS `revisedMembershipRate`,`rc`.`revisedPlan` AS `revisedPlan`,`c`.`finalDecision` AS `finalDecision` from ((((`member` `m` join `cancellation` `c` on((`m`.`memberID` = `c`.`memberID`))) join `membership` `ms` on((`m`.`planID` = `ms`.`planID`))) join `rate_chart` `rc` on((`ms`.`planID` = `rc`.`planID`))) join `rate_cancellation` `r` on(((`r`.`rateID` = `rc`.`rateID`) and (`c`.`reason` = 'Rate')))) ;

-- --------------------------------------------------------

--
-- Structure for view `serviceanalysis`
--
DROP TABLE IF EXISTS `serviceanalysis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `serviceanalysis`  AS  select `m`.`memberID` AS `memberID`,`m`.`memberFirstName` AS `memberFirstName`,`c`.`reason` AS `reason`,`ms`.`planName` AS `planName`,`d`.`message` AS `message`,`ma`.`managerName` AS `managerName`,`ma`.`email` AS `email`,`ma`.`contactNumber` AS `contactNumber`,`c`.`finalDecision` AS `finalDecision` from ((((`member` `m` join `cancellation` `c` on((`m`.`memberID` = `c`.`memberID`))) join `membership` `ms` on((`m`.`planID` = `ms`.`planID`))) join `dissatisfaction_cancellation` `d` on((`d`.`dCancellationID` = `c`.`cancellationID`))) join `manager` `ma` on(((`ma`.`managerID` = `d`.`managerID`) and (`c`.`reason` = 'Dissatisfaction')))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cancellation`
--
ALTER TABLE `cancellation`
  ADD PRIMARY KEY (`cancellationID`),
  ADD KEY `memberID_FK9` (`memberID`);

--
-- Indexes for table `dissatisfaction_cancellation`
--
ALTER TABLE `dissatisfaction_cancellation`
  ADD PRIMARY KEY (`dCancellationID`),
  ADD KEY `managerID_FK12` (`managerID`);

--
-- Indexes for table `group_class`
--
ALTER TABLE `group_class`
  ADD PRIMARY KEY (`gworkoutID`);

--
-- Indexes for table `gym_location`
--
ALTER TABLE `gym_location`
  ADD PRIMARY KEY (`locationID`);

--
-- Indexes for table `gym_membership`
--
ALTER TABLE `gym_membership`
  ADD PRIMARY KEY (`gplanID`);

--
-- Indexes for table `individual_session`
--
ALTER TABLE `individual_session`
  ADD PRIMARY KEY (`iworkoutID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`managerID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberID`),
  ADD KEY `planID_FK1` (`planID`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`planID`);

--
-- Indexes for table `move_cancellation`
--
ALTER TABLE `move_cancellation`
  ADD PRIMARY KEY (`mCancellationID`),
  ADD KEY `locationID_FK13` (`locationID`);

--
-- Indexes for table `rate_cancellation`
--
ALTER TABLE `rate_cancellation`
  ADD PRIMARY KEY (`rCancellationID`),
  ADD KEY `rateID_FK11` (`rateID`);

--
-- Indexes for table `rate_chart`
--
ALTER TABLE `rate_chart`
  ADD PRIMARY KEY (`rateID`),
  ADD KEY `planID_FK10` (`planID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservationID`),
  ADD KEY `workoutID_FK6` (`workoutID`),
  ADD KEY `memberID_FK7` (`memberID`);

--
-- Indexes for table `spa_membership`
--
ALTER TABLE `spa_membership`
  ADD PRIMARY KEY (`splanID`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`trainerID`),
  ADD KEY `workoutID_FK8` (`sessionID`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`transferID`),
  ADD KEY `locationID_FK14` (`locationID`);

--
-- Indexes for table `workout_session`
--
ALTER TABLE `workout_session`
  ADD PRIMARY KEY (`workoutID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cancellation`
--
ALTER TABLE `cancellation`
  MODIFY `cancellationID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cancellation`
--
ALTER TABLE `cancellation`
  ADD CONSTRAINT `memberID_FK9` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`);

--
-- Constraints for table `dissatisfaction_cancellation`
--
ALTER TABLE `dissatisfaction_cancellation`
  ADD CONSTRAINT `managerID_FK12` FOREIGN KEY (`managerID`) REFERENCES `manager` (`managerID`);

--
-- Constraints for table `group_class`
--
ALTER TABLE `group_class`
  ADD CONSTRAINT `workoutID_FK4` FOREIGN KEY (`gworkoutID`) REFERENCES `workout_session` (`workoutID`);

--
-- Constraints for table `gym_membership`
--
ALTER TABLE `gym_membership`
  ADD CONSTRAINT `planID_FK2` FOREIGN KEY (`gplanID`) REFERENCES `membership` (`planID`);

--
-- Constraints for table `individual_session`
--
ALTER TABLE `individual_session`
  ADD CONSTRAINT `workoutID_FK5` FOREIGN KEY (`iworkoutID`) REFERENCES `workout_session` (`workoutID`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `planID_FK1` FOREIGN KEY (`planID`) REFERENCES `membership` (`planID`);

--
-- Constraints for table `move_cancellation`
--
ALTER TABLE `move_cancellation`
  ADD CONSTRAINT `locationID_FK13` FOREIGN KEY (`locationID`) REFERENCES `gym_location` (`locationID`);

--
-- Constraints for table `rate_cancellation`
--
ALTER TABLE `rate_cancellation`
  ADD CONSTRAINT `rateID_FK11` FOREIGN KEY (`rateID`) REFERENCES `rate_chart` (`rateID`);

--
-- Constraints for table `rate_chart`
--
ALTER TABLE `rate_chart`
  ADD CONSTRAINT `planID_FK10` FOREIGN KEY (`planID`) REFERENCES `membership` (`planID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `memberID_FK7` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`),
  ADD CONSTRAINT `workoutID_FK6` FOREIGN KEY (`workoutID`) REFERENCES `workout_session` (`workoutID`);

--
-- Constraints for table `spa_membership`
--
ALTER TABLE `spa_membership`
  ADD CONSTRAINT `planID_FK3` FOREIGN KEY (`splanID`) REFERENCES `membership` (`planID`);

--
-- Constraints for table `trainer`
--
ALTER TABLE `trainer`
  ADD CONSTRAINT `workoutID_FK8` FOREIGN KEY (`sessionID`) REFERENCES `workout_session` (`workoutID`);

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `locationID_FK14` FOREIGN KEY (`locationID`) REFERENCES `gym_location` (`locationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
