-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2026 at 01:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traveljabsv1db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Appointments`
--

CREATE TABLE `Appointments` (
  `AppointmentID` int(11) NOT NULL,
  `AppointmentDatetime` datetime NOT NULL,
  `AppointmentPatientID` int(11) NOT NULL,
  `AppointmentClinicID` int(11) NOT NULL,
  `AppointmentStaffID` int(11) NOT NULL,
  `AppointmentStatusID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Appointments`
--

INSERT INTO `Appointments` (`AppointmentID`, `AppointmentDatetime`, `AppointmentPatientID`, `AppointmentClinicID`, `AppointmentStaffID`, `AppointmentStatusID`) VALUES
(1, '2025-11-14 09:00:00', 69, 10, 35, 2),
(2, '2025-11-16 17:00:00', 99, 3, 9, 2),
(3, '2025-11-16 13:00:00', 90, 10, 35, 2),
(4, '2025-11-18 10:00:00', 91, 6, 21, 3),
(5, '2025-11-17 17:00:00', 16, 3, 9, 2),
(6, '2025-11-20 17:00:00', 69, 5, 16, 2),
(7, '2025-11-20 14:00:00', 21, 7, 25, 2),
(8, '2025-11-21 15:00:00', 6, 10, 34, 2),
(9, '2025-11-20 14:00:00', 38, 2, 7, 2),
(10, '2025-11-23 17:00:00', 12, 10, 35, 4),
(11, '2025-11-23 14:00:00', 59, 7, 24, 2),
(12, '2025-11-24 16:00:00', 88, 1, 4, 2),
(13, '2025-11-25 11:00:00', 56, 3, 10, 2),
(14, '2025-11-27 16:00:00', 95, 4, 13, 3),
(15, '2025-11-26 15:00:00', 15, 8, 28, 2),
(16, '2025-11-30 17:00:00', 91, 4, 13, 2),
(17, '2025-11-30 09:00:00', 74, 1, 2, 2),
(18, '2025-11-30 12:00:00', 20, 5, 16, 2),
(19, '2025-12-01 12:00:00', 16, 7, 25, 2),
(20, '2025-12-04 17:00:00', 1, 2, 6, 2),
(21, '2025-12-02 11:00:00', 22, 6, 21, 4),
(22, '2025-12-04 10:00:00', 85, 7, 25, 2),
(23, '2025-12-05 11:00:00', 54, 2, 6, 2),
(24, '2025-12-08 14:00:00', 60, 5, 18, 3),
(25, '2025-12-09 13:00:00', 32, 2, 6, 2),
(26, '2025-12-07 12:00:00', 15, 6, 21, 2),
(27, '2025-12-08 16:00:00', 2, 1, 4, 2),
(28, '2025-12-09 16:00:00', 7, 1, 2, 2),
(29, '2025-12-12 12:00:00', 44, 1, 4, 2),
(30, '2025-12-14 14:00:00', 9, 8, 28, 2),
(31, '2025-12-13 15:00:00', 51, 9, 31, 4),
(32, '2025-12-16 16:00:00', 52, 7, 25, 2),
(33, '2025-12-16 11:00:00', 15, 9, 31, 2),
(34, '2025-12-17 12:00:00', 95, 4, 13, 2),
(35, '2025-12-17 16:00:00', 98, 3, 10, 3),
(36, '2025-12-18 14:00:00', 84, 2, 6, 2),
(37, '2025-12-20 16:00:00', 98, 1, 4, 2),
(38, '2025-12-22 11:00:00', 62, 5, 16, 2),
(39, '2025-12-22 14:00:00', 67, 4, 14, 2),
(40, '2025-12-23 16:00:00', 79, 10, 35, 4),
(41, '2025-12-25 14:00:00', 14, 9, 32, 2),
(42, '2025-12-26 17:00:00', 95, 1, 2, 2),
(43, '2025-12-25 10:00:00', 58, 2, 7, 2),
(44, '2025-12-27 11:00:00', 3, 9, 32, 3),
(45, '2025-12-27 11:00:00', 49, 9, 31, 2),
(46, '2025-12-27 13:00:00', 89, 9, 32, 2),
(47, '2025-12-31 10:00:00', 63, 5, 18, 2),
(48, '2025-12-29 11:00:00', 73, 9, 30, 2),
(49, '2026-01-02 17:00:00', 76, 10, 34, 2),
(50, '2026-01-01 14:00:00', 88, 4, 14, 2),
(51, '2026-01-02 14:00:00', 79, 5, 18, 4),
(52, '2026-01-03 17:00:00', 56, 1, 4, 2),
(53, '2026-01-04 14:00:00', 5, 8, 27, 2),
(54, '2026-01-07 16:00:00', 86, 8, 27, 2),
(55, '2026-01-08 12:00:00', 28, 10, 35, 2),
(56, '2026-01-09 17:00:00', 31, 1, 4, 2),
(57, '2026-01-07 10:00:00', 21, 5, 17, 3),
(58, '2026-01-11 14:00:00', 89, 1, 4, 2),
(59, '2026-01-10 10:00:00', 56, 7, 23, 2),
(60, '2026-01-11 09:00:00', 54, 1, 2, 4),
(61, '2026-01-12 11:00:00', 67, 9, 31, 2),
(62, '2026-01-14 13:00:00', 9, 7, 24, 2),
(63, '2026-01-14 14:00:00', 40, 7, 23, 2),
(64, '2026-01-16 11:00:00', 35, 5, 17, 3),
(65, '2026-01-15 12:00:00', 76, 6, 20, 2),
(66, '2026-01-17 17:00:00', 3, 7, 23, 2),
(67, '2026-01-18 15:00:00', 43, 9, 30, 2),
(68, '2026-01-21 10:00:00', 86, 7, 24, 2),
(69, '2026-01-20 15:00:00', 74, 9, 31, 2),
(70, '2026-01-23 12:00:00', 57, 7, 24, 2),
(71, '2026-01-24 13:00:00', 89, 10, 35, 2),
(72, '2026-01-22 14:00:00', 56, 9, 31, 4),
(73, '2026-01-23 10:00:00', 80, 7, 23, 2),
(74, '2026-01-26 14:00:00', 37, 1, 4, 3),
(75, '2026-01-26 14:00:00', 40, 9, 32, 2),
(76, '2026-01-28 15:00:00', 54, 10, 35, 2),
(77, '2026-01-27 13:00:00', 36, 3, 9, 2),
(78, '2026-01-28 17:00:00', 8, 3, 10, 2),
(79, '2026-01-30 09:00:00', 70, 7, 24, 2),
(80, '2026-02-02 09:00:00', 78, 9, 30, 4),
(81, '2026-02-02 11:00:00', 6, 1, 2, 2),
(82, '2026-02-04 11:00:00', 94, 6, 20, 2),
(83, '2026-02-03 10:00:00', 61, 4, 13, 2),
(84, '2026-02-03 12:00:00', 63, 4, 14, 2),
(85, '2026-02-07 14:00:00', 96, 3, 9, 2),
(86, '2026-02-07 17:00:00', 6, 8, 27, 3),
(87, '2026-02-08 09:00:00', 23, 5, 16, 2),
(88, '2026-02-09 10:00:00', 11, 5, 17, 2),
(89, '2026-02-11 17:00:00', 48, 5, 17, 2),
(90, '2026-02-12 16:00:00', 21, 6, 20, 2),
(91, '2026-02-12 11:00:00', 51, 3, 11, 2),
(92, '2026-02-12 10:00:00', 50, 10, 35, 4),
(93, '2026-02-12 16:00:00', 46, 6, 21, 2),
(94, '2026-02-14 17:00:00', 73, 2, 7, 2),
(95, '2026-02-15 13:00:00', 29, 5, 18, 3),
(96, '2026-02-17 11:00:00', 93, 3, 9, 2),
(97, '2026-02-18 16:00:00', 49, 8, 28, 2),
(98, '2026-02-20 09:00:00', 36, 4, 14, 2),
(99, '2026-02-18 16:00:00', 56, 5, 17, 2),
(100, '2026-02-21 14:00:00', 20, 6, 20, 4),
(101, '2026-02-21 13:00:00', 29, 7, 24, 2),
(102, '2026-02-23 12:00:00', 69, 9, 32, 2),
(103, '2026-02-22 15:00:00', 62, 5, 17, 2),
(104, '2026-02-26 14:00:00', 96, 9, 30, 1),
(105, '2026-02-26 15:00:00', 20, 9, 32, 1),
(106, '2026-02-25 17:00:00', 41, 1, 2, 1),
(107, '2026-02-27 10:00:00', 3, 2, 7, 1),
(108, '2026-03-02 10:00:00', 99, 9, 31, 1),
(109, '2026-02-28 12:00:00', 60, 2, 7, 1),
(110, '2026-03-03 15:00:00', 34, 8, 28, 1),
(111, '2026-03-02 16:00:00', 65, 7, 24, 1),
(112, '2026-03-04 12:00:00', 99, 10, 35, 1),
(113, '2026-03-06 12:00:00', 7, 3, 9, 1),
(114, '2026-03-07 11:00:00', 70, 10, 35, 1),
(115, '2026-03-09 15:00:00', 37, 1, 4, 1),
(116, '2026-03-10 13:00:00', 72, 5, 17, 1),
(117, '2026-03-11 10:00:00', 21, 9, 31, 1),
(118, '2026-03-12 11:00:00', 32, 3, 9, 1),
(119, '2026-03-11 10:00:00', 93, 7, 25, 1),
(120, '2026-03-12 09:00:00', 45, 2, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Clinics`
--

CREATE TABLE `Clinics` (
  `ClinicID` int(10) UNSIGNED NOT NULL,
  `ClinicName` varchar(100) NOT NULL,
  `ClinicAddress` varchar(255) NOT NULL,
  `ClinicPostcode` varchar(12) NOT NULL,
  `ClinicContact` varchar(20) NOT NULL,
  `ClinicManagerID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Clinics`
--

INSERT INTO `Clinics` (`ClinicID`, `ClinicName`, `ClinicAddress`, `ClinicPostcode`, `ClinicContact`, `ClinicManagerID`) VALUES
(1, 'TravelJabs Brighton', '12 Queens Road, Brighton, East Sussex', 'BN1 3XF', '01273 800 121', 1),
(2, 'TravelJabs Hastings', '5 Robertson Street, Hastings, East Sussex', 'TN34 1HL', '01424 700 242', 5),
(3, 'TravelJabs Eastbourne', '22 Terminus Road, Eastbourne, East Sussex', 'BN21 3LP', '01323 810 363', 8),
(4, 'TravelJabs Worthing', '14 Montague Street, Worthing, West Sussex', 'BN11 3BX', '01903 820 484', 12),
(5, 'TravelJabs Crawley', '7 High Street, Crawley, West Sussex', 'RH10 1BW', '01293 830 505', 15),
(6, 'TravelJabs Guildford', '18 High Street, Guildford, Surrey', 'GU1 3EL', '01483 840 626', 19),
(7, 'TravelJabs Woking', '9 Commercial Way, Woking, Surrey', 'GU21 6XN', '01483 850 747', 22),
(8, 'TravelJabs Reading', '25 Broad Street, Reading, Berkshire', 'RG1 2BH', '0118 860 868', 26),
(9, 'TravelJabs Milton Keynes', '6 Midsummer Boulevard, Milton Keynes, Buckinghamshire', 'MK9 2EA', '01908 870 989', 29),
(10, 'TravelJabs Oxford', '11 Cornmarket Street, Oxford, Oxfordshire', 'OX1 3EX', '01865 880 101', 33);

-- --------------------------------------------------------

--
-- Table structure for table `Invoices`
--

CREATE TABLE `Invoices` (
  `InvoiceID` int(11) NOT NULL,
  `InvoiceAppointmentID` int(11) NOT NULL,
  `InvoiceDatetime` datetime NOT NULL,
  `InvoiceStatus` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Invoices`
--

INSERT INTO `Invoices` (`InvoiceID`, `InvoiceAppointmentID`, `InvoiceDatetime`, `InvoiceStatus`) VALUES
(1, 3, '2025-11-17 17:00:00', 'Payment received'),
(2, 5, '2025-11-17 17:00:00', 'Payment received'),
(3, 1, '2025-11-18 17:00:00', 'Payment received'),
(4, 4, '2025-11-19 17:00:00', 'Payment received'),
(5, 2, '2025-11-20 17:00:00', 'Payment received'),
(6, 9, '2025-11-20 17:00:00', 'Payment received'),
(7, 6, '2025-11-21 17:00:00', 'Payment received'),
(8, 7, '2025-11-23 17:00:00', 'Payment received'),
(9, 8, '2025-11-23 17:00:00', 'Payment received'),
(10, 11, '2025-11-23 17:00:00', 'Payment received'),
(11, 10, '2025-11-24 17:00:00', 'Payment received'),
(12, 12, '2025-11-25 17:00:00', 'Payment received'),
(13, 13, '2025-11-25 17:00:00', 'Payment received'),
(14, 15, '2025-11-28 17:00:00', 'Payment received'),
(15, 14, '2025-11-29 17:00:00', 'Payment received'),
(16, 17, '0000-00-00 00:00:00', 'Payment received'),
(17, 16, '0000-00-00 00:00:00', 'Payment received'),
(18, 18, '0000-00-00 00:00:00', 'Payment received'),
(19, 19, '2025-12-01 17:00:00', 'Payment received'),
(20, 21, '2025-12-05 17:00:00', 'Payment received'),
(21, 22, '2025-12-05 17:00:00', 'Payment received'),
(22, 20, '2025-12-06 17:00:00', 'Payment received'),
(23, 26, '2025-12-08 17:00:00', 'Payment received'),
(24, 24, '2025-12-08 17:00:00', 'Payment received'),
(25, 23, '2025-12-09 17:00:00', 'Payment received'),
(26, 27, '2025-12-10 17:00:00', 'Payment received'),
(27, 28, '2025-12-10 17:00:00', 'Payment received'),
(28, 29, '2025-12-12 17:00:00', 'Payment received'),
(29, 25, '2025-12-13 17:00:00', 'Payment received'),
(30, 30, '2025-12-15 17:00:00', 'Payment received'),
(31, 31, '2025-12-17 17:00:00', 'Payment received'),
(32, 33, '2025-12-19 17:00:00', 'Payment received'),
(33, 35, '2025-12-19 17:00:00', 'Payment received'),
(34, 32, '2025-12-20 17:00:00', 'Payment received'),
(35, 34, '2025-12-21 17:00:00', 'Payment received'),
(36, 37, '2025-12-21 17:00:00', 'Payment received'),
(37, 36, '2025-12-22 17:00:00', 'Payment received'),
(38, 38, '2025-12-22 17:00:00', 'Payment received'),
(39, 39, '2025-12-22 17:00:00', 'Payment received'),
(40, 41, '2025-12-26 17:00:00', 'Payment requested'),
(41, 43, '2025-12-26 17:00:00', 'Payment received'),
(42, 40, '2025-12-27 17:00:00', 'Payment received'),
(43, 45, '2025-12-27 17:00:00', 'Payment received'),
(44, 44, '2025-12-29 17:00:00', 'Payment received'),
(45, 42, '2025-12-30 17:00:00', 'Payment received'),
(46, 46, '2025-12-30 17:00:00', 'Payment received'),
(47, 48, '0000-00-00 00:00:00', 'Payment received'),
(48, 47, '0000-00-00 00:00:00', 'Payment received'),
(49, 50, '2026-01-01 17:00:00', 'Payment received'),
(50, 49, '2026-01-02 17:00:00', 'Payment received'),
(51, 51, '2026-01-02 17:00:00', 'Payment received'),
(52, 53, '2026-01-04 17:00:00', 'Payment received'),
(53, 52, '2026-01-07 17:00:00', 'Payment received'),
(54, 54, '2026-01-07 17:00:00', 'Payment received'),
(55, 57, '2026-01-08 17:00:00', 'Payment received'),
(56, 55, '2026-01-09 17:00:00', 'Payment received'),
(57, 59, '2026-01-12 17:00:00', 'Payment received'),
(58, 58, '2026-01-12 17:00:00', 'Payment received'),
(59, 56, '2026-01-13 17:00:00', 'Payment received'),
(60, 60, '2026-01-14 17:00:00', 'Payment received'),
(61, 61, '2026-01-15 17:00:00', 'Payment received'),
(62, 65, '2026-01-16 17:00:00', 'Payment received'),
(63, 63, '2026-01-17 17:00:00', 'Payment received'),
(64, 62, '2026-01-18 17:00:00', 'Payment received'),
(65, 64, '2026-01-19 17:00:00', 'Payment received'),
(66, 66, '2026-01-21 17:00:00', 'Payment received'),
(67, 69, '2026-01-21 17:00:00', 'Payment received'),
(68, 67, '2026-01-22 17:00:00', 'Payment received'),
(69, 68, '2026-01-23 17:00:00', 'Payment received'),
(70, 73, '2026-01-23 17:00:00', 'Payment received'),
(71, 70, '2026-01-25 17:00:00', 'Payment received'),
(72, 71, '2026-01-25 17:00:00', 'Payment received'),
(73, 72, '2026-01-26 17:00:00', 'Payment received'),
(74, 74, '2026-01-26 17:00:00', 'Payment received'),
(75, 75, '2026-01-27 17:00:00', 'Payment received'),
(76, 77, '2026-01-27 17:00:00', 'Payment received'),
(77, 76, '2026-01-30 17:00:00', 'Payment received'),
(78, 78, '2026-01-30 17:00:00', 'Payment received'),
(79, 79, '0000-00-00 00:00:00', 'Payment received'),
(80, 80, '2026-02-05 17:00:00', 'Payment requested'),
(81, 81, '2026-02-05 17:00:00', 'Payment received'),
(82, 83, '2026-02-05 17:00:00', 'Payment received'),
(83, 82, '2026-02-05 17:00:00', 'Payment received'),
(84, 84, '2026-02-07 17:00:00', 'Payment received'),
(85, 87, '2026-02-08 17:00:00', 'Payment received'),
(86, 86, '2026-02-09 17:00:00', 'Payment received'),
(87, 88, '2026-02-10 17:00:00', 'Payment received'),
(88, 85, '2026-02-11 17:00:00', 'Payment received'),
(89, 89, '2026-02-11 17:00:00', 'Payment received'),
(90, 90, '2026-02-12 17:00:00', 'Payment received'),
(91, 92, '2026-02-12 17:00:00', 'Payment received'),
(92, 93, '2026-02-13 17:00:00', 'Payment received'),
(93, 91, '2026-02-14 17:00:00', 'Payment received'),
(94, 94, '2026-02-18 17:00:00', 'Payment received'),
(95, 95, '2026-02-18 17:00:00', 'Payment received'),
(96, 96, '2026-02-19 17:00:00', 'Payment requested'),
(97, 97, '2026-02-21 17:00:00', 'Payment received'),
(98, 99, '2026-02-21 17:00:00', 'Payment received'),
(99, 98, '2026-02-21 17:00:00', 'Payment received'),
(100, 101, '2026-02-23 17:00:00', 'Payment received'),
(101, 100, '2026-02-24 17:00:00', 'Payment received'),
(102, 102, '2026-02-25 17:00:00', 'Payment requested'),
(103, 103, '2026-02-26 17:00:00', 'Payment received'),
(104, 106, '2026-02-27 17:00:00', 'Payment requested'),
(105, 105, '2026-02-27 17:00:00', 'Payment requested'),
(106, 104, '0000-00-00 00:00:00', 'Payment requested'),
(107, 107, '0000-00-00 00:00:00', 'Payment requested'),
(108, 109, '0000-00-00 00:00:00', 'Payment requested'),
(109, 108, '2026-03-03 17:00:00', 'Payment requested'),
(110, 111, '2026-03-03 17:00:00', 'Payment requested');

-- --------------------------------------------------------

--
-- Table structure for table `Patients`
--

CREATE TABLE `Patients` (
  `PatientID` int(10) UNSIGNED NOT NULL,
  `PatientFirstname` varchar(80) NOT NULL,
  `PatientLastname` varchar(80) NOT NULL,
  `PatientAddress` varchar(255) NOT NULL,
  `PatientPostcode` varchar(12) NOT NULL,
  `PatientAge` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Patients`
--

INSERT INTO `Patients` (`PatientID`, `PatientFirstname`, `PatientLastname`, `PatientAddress`, `PatientPostcode`, `PatientAge`) VALUES
(1, 'Oliver', 'Hayes', '14 North Street, Canterbury, Kent', 'CT1 2JS', 34),
(2, 'Priya', 'Patel', '22 High Street, Maidstone, Kent', 'ME14 1HT', 29),
(3, 'Amina', 'Rahman', '8 Castle Road, Dover, Kent', 'CT16 1QW', 41),
(4, 'James', 'Carter', '5 Station Road, Ashford, Kent', 'TN23 1PP', 52),
(5, 'Sophie', 'Bennett', '11 Marine Parade, Folkestone, Kent', 'CT20 1TX', 27),
(6, 'Leila', 'Haddad', '9 Robertson Street, Hastings, East Sussex', 'TN34 1HL', 38),
(7, 'Thomas', 'Hughes', '17 Terminus Road, Eastbourne, East Sussex', 'BN21 3LP', 46),
(8, 'Emily', 'Carter', '3 Queens Road, Brighton, East Sussex', 'BN1 3XF', 31),
(9, 'Hamza', 'Farid', '24 Seaside Road, Bexhill-on-Sea, East Sussex', 'TN40 1DX', 23),
(10, 'Amelia', 'Clarke', '6 High Street, Lewes, East Sussex', 'BN7 2NB', 59),
(11, 'Jack', 'Turner', '10 Montague Street, Worthing, West Sussex', 'BN11 3BX', 36),
(12, 'Nadia', 'Abbas', '4 South Street, Chichester, West Sussex', 'PO19 1EL', 44),
(13, 'Daniel', 'Green', '19 London Road, Crawley, West Sussex', 'RH10 1BW', 28),
(14, 'Anna', 'Kowalska', '7 High Street, Horsham, West Sussex', 'RH12 1DR', 33),
(15, 'Liam', 'Murphy', '12 Station Road, Haywards Heath, West Sussex', 'RH16 1UA', 49),
(16, 'Emma', 'Collins', '25 High Street, Guildford, Surrey', 'GU1 3EL', 39),
(17, 'Omar', 'Rahman', '9 Commercial Way, Woking, Surrey', 'GU21 6XN', 57),
(18, 'Elise', 'Dubois', '16 Church Street, Epsom, Surrey', 'KT17 4PF', 26),
(19, 'Robert', 'Mitchell', '3 Bridge Street, Walton-on-Thames, Surrey', 'KT12 1AD', 62),
(20, 'Sana', 'Qureshi', '8 High Street, Redhill, Surrey', 'RH1 1RH', 35),
(21, 'Maria', 'Rossi', '14 Broad Street, Reading, Berkshire', 'RG1 2BH', 42),
(22, 'Farhan', 'Ali', '5 Market Place, Bracknell, Berkshire', 'RG12 1JG', 30),
(23, 'Chloe', 'Wilson', '21 King Street, Slough, Berkshire', 'SL1 1EA', 24),
(24, 'Tariq', 'Aziz', '6 High Street, Windsor, Berkshire', 'SL4 1LD', 55),
(25, 'George', 'Evans', '18 Midsummer Boulevard, Milton Keynes, Buckinghamshire', 'MK9 2EA', 40),
(26, 'Shazia', 'Iqbal', '10 Market Square, Aylesbury, Buckinghamshire', 'HP20 1TW', 32),
(27, 'Lukas', 'Schneider', '7 High Street, High Wycombe, Buckinghamshire', 'HP11 2AQ', 47),
(28, 'Laila', 'Hosseini', '12 Cornmarket Street, Oxford, Oxfordshire', 'OX1 3EX', 29),
(29, 'Youssef', 'Mansour', '4 George Street, Banbury, Oxfordshire', 'OX16 5BH', 51),
(30, 'Sarah', 'Thompson', '9 High Street, Winchester, Hampshire', 'SO23 9HG', 37),
(31, 'Hannah', 'Wright', '16 The Pantiles, Tunbridge Wells, Kent', 'TN2 5TD', 45),
(32, 'Khalid', 'Nasser', '2 Sandgate Road, Folkestone, Kent', 'CT20 2BY', 61),
(33, 'Zainab', 'Hussain', '8 Bank Street, Ashford, Kent', 'TN23 1DX', 22),
(34, 'Henry', 'Price', '11 King Street, Rochester, Kent', 'ME1 1EY', 53),
(35, 'Ayesha', 'Khan', '6 St George\'s Place, Canterbury, Kent', 'CT1 2DH', 28),
(36, 'Peter', 'Walsh', '20 High Street, Sevenoaks, Kent', 'TN13 1XE', 67),
(37, 'Mariam', 'AlFarsi', '5 Wellington Place, Hastings, East Sussex', 'TN34 1PN', 34),
(38, 'Jacob', 'Reed', '9 Devonshire Place, Eastbourne, East Sussex', 'BN21 4AH', 41),
(39, 'Isabella', 'Martinez', '13 Western Road, Brighton, East Sussex', 'BN1 2LA', 25),
(40, 'Noor', 'AlMansouri', '7 High Street, Hove, East Sussex', 'BN3 2AF', 31),
(41, 'Imran', 'Siddiqui', '15 Station Road, Lewes, East Sussex', 'BN7 2DA', 58),
(42, 'Grace', 'Hall', '2 St James\'s Street, Brighton, East Sussex', 'BN2 1RE', 43),
(43, 'Sofia', 'Novak', '18 Marina, St Leonards-on-Sea, East Sussex', 'TN38 0AX', 27),
(44, 'Abdul', 'Rahman', '4 London Road, Bexhill-on-Sea, East Sussex', 'TN39 3LE', 64),
(45, 'Callum', 'Stewart', '6 Chapel Road, Worthing, West Sussex', 'BN11 1BE', 21),
(46, 'Helena', 'Nowak', '3 South Street, Chichester, West Sussex', 'PO19 1EJ', 36),
(47, 'Mohammed', 'ElSayed', '10 Middle Street, Brighton, East Sussex', 'BN1 1AL', 48),
(48, 'Ruby', 'James', '22 High Street, Arundel, West Sussex', 'BN18 9AB', 57),
(49, 'Victor', 'Ionescu', '5 Market Square, Horsham, West Sussex', 'RH12 1EU', 39),
(50, 'Sophie', 'Martin', '9 Southgate, Chichester, West Sussex', 'PO19 1ES', 29),
(51, 'Amina', 'AlKhatib', '8 Queensway, Crawley, West Sussex', 'RH10 1EG', 33),
(52, 'Adam', 'Cooper', '4 High Street, Petworth, West Sussex', 'GU28 0AU', 52),
(53, 'Marta', 'Garcia', '12 London Road, Burgess Hill, West Sussex', 'RH15 9QA', 44),
(54, 'Alina', 'Popescu', '7 Swan Walk, Horsham, West Sussex', 'RH12 1HQ', 24),
(55, 'Nathan', 'Brooks', '19 North Street, Guildford, Surrey', 'GU1 4AF', 38),
(56, 'Mehdi', 'Farouk', '6 Chertsey Road, Woking, Surrey', 'GU21 5AB', 56),
(57, 'Ethan', 'Clark', '2 High Street, Epsom, Surrey', 'KT19 8AF', 27),
(58, 'Yasmin', 'Begum', '11 Church Road, Leatherhead, Surrey', 'KT22 8DP', 35),
(59, 'Charlotte', 'King', '8 Station Approach, Egham, Surrey', 'TW20 9LH', 41),
(60, 'Rafiq', 'Chowdhury', '5 High Street, Reigate, Surrey', 'RH2 9AA', 49),
(61, 'Lucia', 'Moretti', '10 High Street, Dorking, Surrey', 'RH4 1AZ', 31),
(62, 'Daniel', 'White', '14 George Street, Richmond, Surrey', 'TW9 1HY', 62),
(63, 'Amir', 'Saleh', '6 Bridge Road, Weybridge, Surrey', 'KT13 8XS', 28),
(64, 'Harriet', 'Green', '9 Church Street, Farnham, Surrey', 'GU9 7RE', 55),
(65, 'Bilal', 'Mahmood', '3 High Street, Camberley, Surrey', 'GU15 3RS', 46),
(66, 'Elena', 'Petrova', '12 Victoria Road, Woking, Surrey', 'GU21 8EW', 37),
(67, 'Connor', 'Mitchell', '7 High Street, Staines-upon-Thames, Surrey', 'TW18 4EE', 23),
(68, 'Maya', 'Sharma', '22 Broad Street, Reading, Berkshire', 'RG1 2BH', 26),
(69, 'Ben', 'Johnson', '6 Station Road, Wokingham, Berkshire', 'RG40 1XU', 51),
(70, 'Hina', 'Ahmed', '10 High Street, Newbury, Berkshire', 'RG14 5AA', 33),
(71, 'Paul', 'Anderson', '4 Peascod Street, Windsor, Berkshire', 'SL4 1DU', 68),
(72, 'Nadia', 'Karim', '18 King Street, Maidenhead, Berkshire', 'SL6 1EF', 45),
(73, 'Francesca', 'Russo', '7 High Street, Henley-on-Thames, Oxfordshire', 'RG9 2AA', 29),
(74, 'Owen', 'Scott', '9 Market Place, Reading, Berkshire', 'RG1 2DT', 40),
(75, 'Tomasz', 'Zielinski', '12 High Street, Slough, Berkshire', 'SL1 1EL', 36),
(76, 'Adeel', 'Chaudhry', '5 Broadway, Bracknell, Berkshire', 'RG12 1BA', 58),
(77, 'Laura', 'Brown', '14 High Street, Marlow, Buckinghamshire', 'SL7 1AW', 47),
(78, 'Sanjay', 'Mehta', '9 Market Square, Aylesbury, Buckinghamshire', 'HP20 1TW', 42),
(79, 'Holly', 'Turner', '22 Buckingham Street, Milton Keynes, Buckinghamshire', 'MK9 2EA', 25),
(80, 'Stefan', 'Muller', '3 Kings Road, High Wycombe, Buckinghamshire', 'HP13 5AB', 54),
(81, 'Mina', 'Haddad', '6 High Street, Amersham, Buckinghamshire', 'HP7 0DJ', 31),
(82, 'Ibrahim', 'Nouri', '12 Market Street, Buckingham, Buckinghamshire', 'MK18 1JX', 63),
(83, 'Zoe', 'Edwards', '8 Castle Street, Buckingham, Buckinghamshire', 'MK18 1BS', 22),
(84, 'Ewa', 'Kaczmarek', '4 High Street, Chesham, Buckinghamshire', 'HP5 1EP', 38),
(85, 'Samuel', 'Wood', '10 Church Street, Oxford, Oxfordshire', 'OX1 3DP', 44),
(86, 'Hassan', 'Alavi', '7 Queen Street, Oxford, Oxfordshire', 'OX1 1JD', 52),
(87, 'Alice', 'Walker', '15 High Street, Abingdon, Oxfordshire', 'OX14 5BB', 34),
(88, 'Noah', 'Harris', '9 Market Place, Witney, Oxfordshire', 'OX28 6AB', 27),
(89, 'Sara', 'Ahmadi', '4 Broad Street, Oxford, Oxfordshire', 'OX1 3AJ', 36),
(90, 'Faisal', 'Hamid', '12 High Street, Bicester, Oxfordshire', 'OX26 6AJ', 41),
(91, 'Julia', 'Schmidt', '10 Cornmarket Street, Oxford, Oxfordshire', 'OX1 3EY', 29),
(92, 'Ethan', 'Collins', '3 Bridge Street, Banbury, Oxfordshire', 'OX16 5QB', 59),
(93, 'Layla', 'Jafari', '6 High Street, Didcot, Oxfordshire', 'OX11 7ES', 23),
(94, 'Megan', 'Thomas', '18 High Street, Winchester, Hampshire', 'SO23 9HG', 48),
(95, 'Yusuf', 'Aziz', '7 London Road, Southampton, Hampshire', 'SO15 2ED', 57),
(96, 'Oliver', 'Stone', '10 Above Bar Street, Southampton, Hampshire', 'SO14 7DX', 35),
(97, 'Eva', 'Santos', '4 High Street, Portsmouth, Hampshire', 'PO1 2BZ', 28),
(98, 'Amal', 'Saad', '9 Commercial Road, Portsmouth, Hampshire', 'PO1 1HG', 44),
(99, 'Daniel', 'Reynolds', '12 High Street, Basingstoke, Hampshire', 'RG21 7JY', 52),
(100, 'Aisha', 'Malik', '6 High Street, Farnborough, Hampshire', 'GU14 7JN', 33);

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Roles`
--

INSERT INTO `Roles` (`RoleID`, `RoleName`) VALUES
(1, 'Manager'),
(2, 'Clinician');

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `StaffID` int(10) UNSIGNED NOT NULL,
  `StaffRoleID` tinyint(3) UNSIGNED NOT NULL,
  `StaffFirstname` varchar(80) NOT NULL,
  `StaffLastname` varchar(80) NOT NULL,
  `StaffClinicID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`StaffID`, `StaffRoleID`, `StaffFirstname`, `StaffLastname`, `StaffClinicID`) VALUES
(1, 1, 'Emma', 'Collins', 1),
(2, 2, 'Farhan', 'Ali', 1),
(3, 2, 'Leila', 'Haddad', 1),
(4, 2, 'Jack', 'Turner', 1),
(5, 1, 'Omar', 'Rahman', 2),
(6, 2, 'Sophie', 'Bennett', 2),
(7, 2, 'Youssef', 'Mansour', 2),
(8, 1, 'Priya', 'Shah', 3),
(9, 2, 'Imran', 'Siddiqui', 3),
(10, 2, 'Maria', 'Rossi', 3),
(11, 2, 'Rohan', 'Patel', 3),
(12, 1, 'Thomas', 'Hughes', 4),
(13, 2, 'Nadia', 'Abbas', 4),
(14, 2, 'Oliver', 'Wright', 4),
(15, 1, 'Samira', 'Noor', 5),
(16, 2, 'Ahmed', 'El-Sayed', 5),
(17, 2, 'Hina', 'Ahmed', 5),
(18, 2, 'Lukas', 'Schneider', 5),
(19, 1, 'Mehdi', 'Farouk', 6),
(20, 2, 'Emily', 'Carter', 6),
(21, 2, 'Tariq', 'Aziz', 6),
(22, 1, 'James', 'Walker', 7),
(23, 2, 'Salma', 'Ibrahim', 7),
(24, 2, 'Elise', 'Dubois', 7),
(25, 2, 'Amina', 'Al-Khatib', 7),
(26, 1, 'Saira', 'Malik', 8),
(27, 2, 'Daniel', 'Green', 8),
(28, 2, 'Noor', 'Al-Mansouri', 8),
(29, 1, 'Khalid', 'Nasser', 9),
(30, 2, 'Shazia', 'Iqbal', 9),
(31, 2, 'Hamza', 'Farid', 9),
(32, 2, 'Anna', 'Kowalska', 9),
(33, 1, 'Robert', 'Mitchell', 10),
(34, 2, 'Danish', 'Rahim', 10),
(35, 2, 'Laila', 'Hosseini', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Status`
--

CREATE TABLE `Status` (
  `StatusID` int(10) UNSIGNED NOT NULL,
  `StatusName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Status`
--

INSERT INTO `Status` (`StatusID`, `StatusName`) VALUES
(2, 'Delivered'),
(4, 'No delivery'),
(3, 'No show'),
(1, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `Vaccinations`
--

CREATE TABLE `Vaccinations` (
  `VaccinationID` int(11) DEFAULT NULL,
  `VaccinationAppointmentID` int(11) NOT NULL,
  `VaccinationVaccineID` int(11) NOT NULL,
  `VaccinationOutcomeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Vaccinations`
--

INSERT INTO `Vaccinations` (`VaccinationID`, `VaccinationAppointmentID`, `VaccinationVaccineID`, `VaccinationOutcomeID`) VALUES
(1, 1, 4, 1),
(2, 2, 7, 1),
(3, 3, 1, 1),
(4, 3, 5, 1),
(5, 3, 9, 1),
(6, 3, 4, 1),
(7, 3, 8, 1),
(8, 4, 6, 1),
(9, 4, 1, 1),
(10, 5, 1, 1),
(11, 5, 5, 1),
(12, 5, 9, 1),
(13, 5, 4, 1),
(14, 5, 8, 1),
(15, 6, 7, 1),
(16, 7, 3, 1),
(17, 7, 7, 1),
(18, 8, 2, 1),
(19, 8, 6, 1),
(20, 8, 1, 1),
(21, 9, 2, 1),
(22, 9, 6, 1),
(23, 10, 6, 1),
(24, 10, 1, 2),
(25, 10, 5, 1),
(26, 11, 9, 2),
(27, 11, 4, 1),
(28, 11, 8, 2),
(29, 11, 3, 1),
(30, 11, 7, 1),
(31, 12, 2, 1),
(32, 13, 4, 1),
(33, 13, 8, 1),
(34, 14, 6, 1),
(35, 15, 6, 1),
(36, 15, 1, 1),
(37, 16, 9, 1),
(38, 16, 4, 2),
(39, 16, 8, 1),
(40, 16, 3, 1),
(41, 16, 7, 1),
(42, 16, 2, 1),
(43, 17, 5, 1),
(44, 17, 9, 1),
(45, 18, 9, 1),
(46, 18, 4, 1),
(47, 18, 8, 1),
(48, 19, 9, 1),
(49, 19, 4, 2),
(50, 20, 4, 1),
(51, 20, 8, 1),
(52, 20, 3, 1),
(53, 21, 4, 1),
(54, 21, 8, 1),
(55, 22, 1, 1),
(56, 22, 5, 1),
(57, 22, 9, 1),
(58, 22, 4, 1),
(59, 23, 6, 1),
(60, 23, 1, 1),
(61, 23, 5, 2),
(62, 24, 7, 1),
(63, 24, 2, 2),
(64, 24, 6, 1),
(65, 25, 2, 1),
(66, 26, 2, 2),
(67, 26, 6, 1),
(68, 26, 1, 1),
(69, 26, 5, 1),
(70, 27, 8, 1),
(71, 28, 9, 1),
(72, 28, 4, 1),
(73, 29, 4, 1),
(74, 29, 8, 1),
(75, 29, 3, 1),
(76, 29, 7, 1),
(77, 30, 5, 1),
(78, 31, 5, 1),
(79, 31, 9, 1),
(80, 31, 4, 1),
(81, 31, 8, 1),
(82, 31, 3, 1),
(83, 32, 2, 1),
(84, 33, 4, 1),
(85, 34, 2, 1),
(86, 34, 6, 1),
(87, 34, 1, 1),
(88, 35, 6, 1),
(89, 36, 1, 1),
(90, 36, 5, 1),
(91, 36, 9, 1),
(92, 36, 4, 1),
(93, 37, 1, 1),
(94, 37, 5, 1),
(95, 37, 9, 1),
(96, 38, 3, 1),
(97, 39, 1, 1),
(98, 39, 5, 1),
(99, 39, 9, 1),
(100, 40, 9, 1),
(101, 41, 1, 1),
(102, 41, 5, 1),
(103, 41, 9, 1),
(104, 42, 6, 1),
(105, 42, 1, 1),
(106, 42, 5, 1),
(107, 42, 9, 1),
(108, 42, 4, 1),
(109, 43, 9, 1),
(110, 43, 4, 1),
(111, 43, 8, 2),
(112, 43, 3, 1),
(113, 44, 2, 1),
(114, 44, 6, 1),
(115, 45, 1, 1),
(116, 45, 5, 1),
(117, 46, 3, 1),
(118, 46, 7, 1),
(119, 47, 6, 1),
(120, 48, 2, 1),
(121, 49, 7, 1),
(122, 50, 4, 1),
(123, 50, 8, 1),
(124, 50, 3, 1),
(125, 50, 7, 1),
(126, 50, 2, 1),
(127, 51, 2, 1),
(128, 52, 6, 2),
(129, 52, 1, 1),
(130, 53, 3, 1),
(131, 54, 8, 1),
(132, 54, 3, 1),
(133, 54, 7, 1),
(134, 54, 2, 1),
(135, 55, 2, 1),
(136, 55, 6, 1),
(137, 55, 1, 1),
(138, 55, 5, 1),
(139, 55, 9, 1),
(140, 56, 6, 1),
(141, 57, 9, 1),
(142, 58, 4, 1),
(143, 59, 5, 1),
(144, 59, 9, 1),
(145, 59, 4, 1),
(146, 60, 9, 1),
(147, 60, 4, 1),
(148, 60, 8, 1),
(149, 61, 9, 1),
(150, 61, 4, 1),
(151, 61, 8, 1),
(152, 61, 3, 1),
(153, 61, 7, 1),
(154, 62, 9, 1),
(155, 62, 4, 1),
(156, 62, 8, 1),
(157, 63, 5, 1),
(158, 63, 9, 1),
(159, 63, 4, 1),
(160, 64, 5, 1),
(161, 64, 9, 1),
(162, 64, 4, 1),
(163, 64, 8, 1),
(164, 65, 4, 1),
(165, 65, 8, 1),
(166, 66, 2, 1),
(167, 66, 6, 1),
(168, 66, 1, 1),
(169, 66, 5, 1),
(170, 67, 3, 1),
(171, 67, 7, 1),
(172, 67, 2, 1),
(173, 68, 8, 2),
(174, 69, 2, 1),
(175, 69, 6, 1),
(176, 70, 6, 1),
(177, 70, 1, 1),
(178, 70, 5, 1),
(179, 70, 9, 1),
(180, 70, 4, 1),
(181, 71, 2, 1),
(182, 71, 6, 1),
(183, 72, 7, 1),
(184, 72, 2, 1),
(185, 72, 6, 1),
(186, 73, 8, 1),
(187, 73, 3, 1),
(188, 73, 7, 1),
(189, 73, 2, 1),
(190, 73, 6, 1),
(191, 74, 4, 1),
(192, 74, 8, 1),
(193, 74, 3, 1),
(194, 74, 7, 1),
(195, 74, 2, 1),
(196, 75, 3, 1),
(197, 75, 7, 1),
(198, 75, 2, 1),
(199, 75, 6, 1),
(200, 75, 1, 1),
(201, 75, 5, 1),
(202, 76, 9, 1),
(203, 77, 4, 1),
(204, 77, 8, 1),
(205, 77, 3, 1),
(206, 77, 7, 1),
(207, 77, 2, 1),
(208, 78, 1, 1),
(209, 78, 5, 1),
(210, 78, 9, 1),
(211, 78, 4, 1),
(212, 78, 8, 1),
(213, 79, 1, 1),
(214, 80, 4, 1),
(215, 80, 8, 1),
(216, 81, 7, 1),
(217, 81, 2, 1),
(218, 81, 6, 1),
(219, 81, 1, 1),
(220, 81, 5, 1),
(221, 82, 8, 1),
(222, 82, 3, 1),
(223, 83, 2, 1),
(224, 84, 7, 1),
(225, 84, 2, 1),
(226, 84, 6, 1),
(227, 84, 1, 1),
(228, 85, 1, 1),
(229, 85, 5, 1),
(230, 85, 9, 1),
(231, 86, 4, 1),
(232, 86, 8, 1),
(233, 86, 3, 1),
(234, 87, 5, 1),
(235, 87, 9, 1),
(236, 87, 4, 1),
(237, 88, 9, 2),
(238, 88, 4, 1),
(239, 89, 4, 1),
(240, 89, 8, 1),
(241, 89, 3, 1),
(242, 89, 7, 1),
(243, 89, 2, 1),
(244, 90, 3, 1),
(245, 90, 7, 2),
(246, 90, 2, 1),
(247, 90, 6, 1),
(248, 91, 7, 1),
(249, 91, 2, 1),
(250, 91, 6, 1),
(251, 91, 1, 1),
(252, 92, 1, 1),
(253, 93, 4, 1),
(254, 94, 8, 2),
(255, 94, 3, 1),
(256, 94, 7, 1),
(257, 94, 2, 2),
(258, 95, 9, 1),
(259, 95, 4, 1),
(260, 95, 8, 1),
(261, 96, 7, 1),
(262, 96, 2, 1),
(263, 96, 6, 1),
(264, 96, 1, 1),
(265, 97, 7, 1),
(266, 97, 2, 1),
(267, 97, 6, 1),
(268, 98, 7, 1),
(269, 98, 2, 1),
(270, 98, 6, 1),
(271, 99, 4, 1),
(272, 99, 8, 1),
(273, 100, 6, 1),
(274, 101, 9, 1),
(275, 101, 4, 1),
(276, 102, 8, 1),
(277, 102, 3, 1),
(278, 102, 7, 1),
(279, 103, 9, 1),
(280, 103, 4, 1),
(281, 103, 8, 1),
(282, 104, 5, 1),
(283, 104, 9, 1),
(284, 104, 4, 2),
(285, 104, 8, 1),
(286, 104, 3, 1),
(287, 105, 5, 1),
(288, 106, 3, 1),
(289, 107, 1, 1),
(290, 107, 5, 1),
(291, 107, 9, 1),
(292, 108, 2, 1),
(293, 109, 8, 1),
(294, 109, 3, 2),
(295, 109, 7, 1),
(296, 109, 2, 1),
(297, 110, 8, 1),
(298, 111, 3, 1),
(299, 111, 7, 1),
(300, 111, 2, 1),
(301, 111, 6, 1),
(302, 111, 1, 1),
(303, 112, 7, 1),
(304, 112, 2, 1),
(305, 112, 6, 1),
(306, 113, 4, 1),
(307, 114, 6, 1),
(308, 114, 1, 1),
(309, 114, 5, 1),
(310, 114, 9, 1),
(311, 114, 4, 1),
(312, 115, 9, 1),
(313, 115, 4, 1),
(314, 115, 8, 2),
(315, 115, 3, 1),
(316, 115, 7, 1),
(317, 116, 1, 1),
(318, 116, 5, 1),
(319, 116, 9, 1),
(320, 116, 4, 2),
(321, 117, 3, 1),
(322, 118, 3, 1),
(323, 119, 8, 1),
(324, 119, 3, 1),
(325, 119, 7, 1),
(326, 120, 3, 1),
(327, 120, 7, 1),
(328, 120, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Vaccines`
--

CREATE TABLE `Vaccines` (
  `VaccineID` int(10) UNSIGNED NOT NULL,
  `VaccineName` varchar(120) NOT NULL,
  `VaccineCost` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Vaccines`
--

INSERT INTO `Vaccines` (`VaccineID`, `VaccineName`, `VaccineCost`) VALUES
(1, 'Hepatitis A', 65.00),
(2, 'Typhoid', 35.00),
(3, 'Tetanus / Diphtheria / Polio (Td/IPV booster)', 45.00),
(4, 'Hepatitis B', 60.00),
(5, 'Rabies', 95.00),
(6, 'Influenza', 18.00),
(7, 'Covid-19', 10.00),
(8, 'Measles / Mumps / Rubella (MMR)', 40.00),
(9, 'Yellow fever', 85.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Appointments`
--
ALTER TABLE `Appointments`
  ADD PRIMARY KEY (`AppointmentID`);

--
-- Indexes for table `Clinics`
--
ALTER TABLE `Clinics`
  ADD PRIMARY KEY (`ClinicID`),
  ADD KEY `idx_postcode` (`ClinicPostcode`),
  ADD KEY `idx_manager` (`ClinicManagerID`);

--
-- Indexes for table `Invoices`
--
ALTER TABLE `Invoices`
  ADD PRIMARY KEY (`InvoiceID`);

--
-- Indexes for table `Patients`
--
ALTER TABLE `Patients`
  ADD PRIMARY KEY (`PatientID`),
  ADD KEY `idx_postcode` (`PatientPostcode`),
  ADD KEY `idx_lastname` (`PatientLastname`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `idx_role` (`StaffRoleID`),
  ADD KEY `idx_lastname` (`StaffLastname`);

--
-- Indexes for table `Status`
--
ALTER TABLE `Status`
  ADD PRIMARY KEY (`StatusID`),
  ADD UNIQUE KEY `uq_status_name` (`StatusName`);

--
-- Indexes for table `Vaccines`
--
ALTER TABLE `Vaccines`
  ADD PRIMARY KEY (`VaccineID`),
  ADD UNIQUE KEY `uq_vaccine_name` (`VaccineName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Appointments`
--
ALTER TABLE `Appointments`
  MODIFY `AppointmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `Clinics`
--
ALTER TABLE `Clinics`
  MODIFY `ClinicID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Invoices`
--
ALTER TABLE `Invoices`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `Patients`
--
ALTER TABLE `Patients`
  MODIFY `PatientID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `Roles`
--
ALTER TABLE `Roles`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Staff`
--
ALTER TABLE `Staff`
  MODIFY `StaffID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `Status`
--
ALTER TABLE `Status`
  MODIFY `StatusID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Vaccines`
--
ALTER TABLE `Vaccines`
  MODIFY `VaccineID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
