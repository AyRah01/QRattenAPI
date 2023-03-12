-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2023 at 02:36 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qr_atttendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(9) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'teacher'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `password`, `type`) VALUES
(3, 'ayrah@gmail.com', '1234', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(9) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `time_in` time DEFAULT NULL,
  `course_id` varchar(30) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `present` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `date`, `time_in`, `course_id`, `student_id`, `present`) VALUES
(140, '2023-02-22', '12:32:12', 'CIT 207', 'CC-19-102 ', 1),
(141, '2023-02-22', NULL, 'CIT 207', 'CC-19-124', 0),
(142, '2023-02-22', NULL, 'CIT 207', 'CC-13-986', 0),
(143, '2023-02-22', NULL, 'CIT 207', 'CC-19-164', 0),
(144, '2023-02-22', '12:31:52', 'CIT 207', 'CC-22-150', 1),
(145, '2023-02-22', NULL, 'CIT 207', 'CC-12-167', 0),
(146, '2023-02-22', NULL, 'CIT 207', 'CC-66-333', 0),
(147, '2023-02-22', NULL, 'CIT 207', 'CC-17-146', 0),
(148, '2023-02-22', NULL, 'CIT 207', 'CC-68-777', 0),
(149, '2023-02-22', '14:55:55', 'CIT 207', 'CC-44-777', 1),
(150, '2023-02-22', NULL, 'CIT 207', 'CC-19-1236', 0),
(151, '2023-03-07', '16:52:52', 'CC-201', 'CC-12-3458', 1),
(152, '2023-03-07', '16:52:44', 'CC-201', 'CC-22-4576', 1),
(153, '2023-03-07', NULL, 'CC-201', 'CC-25-5754', 0),
(154, '2023-03-07', NULL, 'CC-201', 'CC-24-8467', 0),
(155, '2023-03-07', NULL, 'CC-201', 'CC-68-8866', 0),
(156, '2023-03-08', NULL, 'CIT 207', 'CC-19-102 ', 0),
(157, '2023-03-08', NULL, 'CIT 207', 'CC-19-124', 0),
(158, '2023-03-08', NULL, 'CIT 207', 'CC-13-986', 0),
(159, '2023-03-08', NULL, 'CIT 207', 'CC-19-164', 0),
(160, '2023-03-08', NULL, 'CIT 207', 'CC-22-150', 0),
(161, '2023-03-08', NULL, 'CIT 207', 'CC-12-167', 0),
(162, '2023-03-08', NULL, 'CIT 207', 'CC-66-333', 0),
(163, '2023-03-08', NULL, 'CIT 207', 'CC-17-146', 0),
(164, '2023-03-08', NULL, 'CIT 207', 'CC-68-777', 0),
(165, '2023-03-08', NULL, 'CIT 207', 'CC-44-777', 0),
(166, '2023-03-08', NULL, 'CIT 207', 'CC-19-1236', 0),
(167, '2023-03-08', '10:43:31', 'CIT-101', 'CC-19-125', 1),
(168, '2023-03-08', '10:43:26', 'CIT-101', 'CC-19-164', 1),
(169, '2023-03-09', NULL, 'CIT 207', 'CC-19-102 ', 0),
(170, '2023-03-09', NULL, 'CIT 207', 'CC-19-124', 0),
(171, '2023-03-09', NULL, 'CIT 207', 'CC-13-986', 0),
(172, '2023-03-09', NULL, 'CIT 207', 'CC-19-164', 0),
(173, '2023-03-09', NULL, 'CIT 207', 'CC-22-150', 0),
(174, '2023-03-09', NULL, 'CIT 207', 'CC-12-167', 0),
(175, '2023-03-09', NULL, 'CIT 207', 'CC-66-333', 0),
(176, '2023-03-09', NULL, 'CIT 207', 'CC-17-146', 0),
(177, '2023-03-09', NULL, 'CIT 207', 'CC-68-777', 0),
(178, '2023-03-09', NULL, 'CIT 207', 'CC-44-777', 0),
(179, '2023-03-09', NULL, 'CIT 207', 'CC-19-1236', 0),
(180, '2023-03-09', NULL, 'CIT-101', 'CC-19-125', 0),
(181, '2023-03-09', NULL, 'CIT-101', 'CC-19-164', 0),
(182, '2023-03-09', NULL, 'CIT-101', 'CC-11-2225', 0),
(183, '2023-03-10', NULL, 'CIT 207', 'CC-19-102 ', 0),
(184, '2023-03-10', NULL, 'CIT 207', 'CC-19-124', 0),
(185, '2023-03-10', NULL, 'CIT 207', 'CC-13-986', 0),
(186, '2023-03-10', NULL, 'CIT 207', 'CC-19-164', 0),
(187, '2023-03-10', NULL, 'CIT 207', 'CC-22-150', 0),
(188, '2023-03-10', NULL, 'CIT 207', 'CC-12-167', 0),
(189, '2023-03-10', NULL, 'CIT 207', 'CC-66-333', 0),
(190, '2023-03-10', NULL, 'CIT 207', 'CC-17-146', 0),
(191, '2023-03-10', NULL, 'CIT 207', 'CC-68-777', 0),
(192, '2023-03-10', NULL, 'CIT 207', 'CC-44-777', 0),
(193, '2023-03-10', NULL, 'CIT 207', 'CC-19-1236', 0);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `course_number` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `course_number`, `student_id`) VALUES
(75, 'CIT 207', 'CC-44-777'),
(76, 'CIT 207', 'CC-19-102 '),
(77, 'CIT 207', 'CC-22-150'),
(78, 'CIT 207', 'CC-19-164'),
(79, 'CIT 207', 'CC-66-333'),
(80, 'CIT 207', 'CC-17-146'),
(81, 'CIT 207', 'CC-68-777'),
(82, 'CIT 207', 'CC-12-167'),
(83, 'CIT 207', 'CC-19-124'),
(84, 'CIT 207', 'CC-13-986'),
(85, 'CIT 207', 'CC-19-1236'),
(86, 'CC-201', 'CC-22-4576'),
(87, 'CC-201', 'CC-25-5754'),
(88, 'CC-201', 'CC-68-8866'),
(89, 'CC-201', 'CC-24-8467'),
(90, 'CC-201', 'CC-12-3458'),
(91, 'CIT-101', 'CC-19-125'),
(94, 'CIT-101', 'CC-19-164'),
(95, 'CIT-101', 'CC-11-2225');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` int(8) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `middlename` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `firstname`, `middlename`, `lastname`, `email`, `password`) VALUES
(14, 'Deizy Ree', 'Paredes', 'Calceña ', 'deizy01', 'qwerty'),
(15, 'D', 'P', 'C', 'deizy', '1234'),
(16, 'I', 'L', 'G', 'Gojol', '1234'),
(17, 'Emmanuel ', 'Despi', 'Katipunan', 'emman', '1234'),
(18, 'Ira', 'Laquick', 'Gojol', 'ayrah@gmail.com', '12345'),
(19, 'Jose', 'Abad', 'Santos', 'Santos', 'Abad'),
(20, 'Emman', 'Bonitillo', 'Bonitillo ', 'emman123', '1234'),
(21, 'Emman', 'SANCTO', 'Bonitillo', 'emman', '1234'),
(22, 'Deizy Ree', 'Paredes ', 'Calceña ', 'DeizyRee', 'deizy04'),
(23, 'Mark ', 'Biskan ano lang jan', 'Caspillo', 'Mark AJ', '123Abc'),
(24, 'Pame', 'Falcis', 'Guevara', 'Pammz23', 'pukek'),
(25, 'Deizyree ', 'Paredes', 'Calceña ', 'DEIZYREE ', '1234'),
(26, 'Michelle', 'Paren', 'Tayo', 'Michelle', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `year` int(1) DEFAULT NULL,
  `middlename` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `section` varchar(1) DEFAULT NULL,
  `course` varchar(8) NOT NULL,
  `teacher` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'regular'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `firstname`, `year`, `middlename`, `lastname`, `gender`, `section`, `course`, `teacher`, `type`) VALUES
(2493002, 'CC-19-125', 'Deizy ', 4, 'Rie', 'Calceña ', 'Female', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493003, 'CC-17-192', 'Angela', 4, 'Braza', 'Giner', 'Female', 'A', 'BSIT', 'emman', 'regular'),
(2493004, 'MSLS192', 'Tata', 1, 'Yaya', 'Kslayay', 'Male', 'A', 'COE', 'emman', 'regular'),
(2493005, 'CC-19-102 ', 'Alden', 1, 'James', 'Nico', 'Male', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493006, '1234', 'Alnica', 2, 'S', 'Nice', 'Female', 'G', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493007, 'SK32', 'Bia', 4, 'C', 'jhn', 'Female', 'D', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493008, '683G', 'James', 2, 'gsh', 'vdvd', 'Male', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493011, '75792B', 'Lemis', 1, 'C', 'Noice', 'Male', 'D', 'COE', 'ayrah@gmail.com', 'regular'),
(2493012, 'CC', 'Honey', 3, 'SUgar', 'gihvc', 'Male', 'C', 'COE', 'ayrah@gmail.com', 'regular'),
(2493015, 'CC-19-124', 'Weerrto', 1, 'Weldy', 'Latino', 'Male', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493016, 'CC 18L89R', 'Ej', 2, 'J', 'Lo', 'Male', 'D', 'COE', 'ayrah@gmail.com', 'regular'),
(2493021, 'CC-19-365', 'Gdghdge', 2, 'Dhdh', 'Hdgdgx', 'Male', 'E', 'CBM', 'ayrah@gmail.com', 'regular'),
(2493024, 'CC-19-132', 'zlKm', 2, 'pool', 'mzmzmm', 'Male', 'F', 'SOA', 'DeizyRee', 'regular'),
(2493025, 'CC-13-986', 'Zbxv', 2, 'Zvnvz', 'Fnaf', 'Female', 'D', 'SOA', 'ayrah@gmail.com', 'regular'),
(2493026, 'CC-12-862', 'gug', 2, 'guess ', 'rhvc', 'Male', 'D', 'SOA', 'DeizyRee', 'regular'),
(2493027, 'CC-19-222', 'Louise', 2, 'Cy', 'Chui', 'Female', 'A', 'BSIT', 'DeizyRee', 'regular'),
(2493028, 'CC-19-333', 'Ha', 1, 'He', 'Hi', 'Female', 'C', 'CBM', 'DeizyRee', 'regular'),
(2493029, 'CC-19-444', 'hdhs', 2, 'hdhd', 'jdhdb', 'Female', 'G', 'COE', 'DeizyRee', 'regular'),
(2493030, 'CC-21-246', 'Blaire', 4, 'ha', 'hatdog', 'Female', 'A', 'BSIT', 'DeizyRee', 'regular'),
(2493031, 'CC-54-545', 'Claire', 2, 'Naive', 'Hahaha', 'Female', 'A', 'COE', 'DeizyRee', 'regular'),
(2493032, 'CC-19-164', 'Billy', 1, 'Gates', 'Pale', 'Male', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493033, 'CC-22-150', 'Alpi', 1, 'y', 'gcb', 'Male', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493034, 'CC-12-167', 'Wally', 1, 'Weer', 'Kaal', 'Male', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493035, 'CC-66-333', 'Jhonny', 1, 'I', 'lol', 'Male', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493036, 'CC-17-146', 'Quuu', 1, 'Yuuu', 'Tale', 'Female', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493037, 'CC-68-777', 'Ruy', 1, 'C', 'No', 'Male', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493038, 'CC-44-777', 'aeb', 1, 'yu', 'nii', 'Male', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493039, 'CC-12-121', 'Seeeb', 3, 'vu', 'ni', 'Female', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493040, 'CC-23-001', 'Yayer', 4, 'Yutlo', 'Waryl', 'Female', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493041, 'CC-23-001', 'Yayer', 4, 'Yutlo', 'Waryl', 'Female', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493042, 'CC-19-1236', 'Grace', 1, 'Gracia', 'Garcia', 'Female', 'G', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493043, 'CC-23-8646', 'wooedkkkdkk', 0, 'dkskwkwlo', 'doesoskkm', 'Male', NULL, 'COE', 'ayrah@gmail.com', 'irregular'),
(2493044, 'CC-67-8797', 'ggsgsbs', 2, 'hshzbsb', 'bsbsbzbz', 'Male', 'B', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493045, 'CC-12-3458', 'Ira13346', 4, 'Me', 'Gojol', 'Female', 'A', 'BSIT', 'Mark AJ', 'regular'),
(2493046, 'CC-22-4576', 'Jisson', 2, 'D', 'Quijano', 'Male', 'D', 'BSIT', 'Mark AJ', 'regular'),
(2493047, 'CC-25-5754', 'tdusb', 2, 'ydididn', 'hididb', 'Male', 'D', 'BSIT', 'Mark AJ', 'regular'),
(2493048, 'CC-24-8467', 'yd7dnd', 2, 'hdhshd', 'hshshs', 'Male', 'D', 'BSIT', 'Mark AJ', 'irregular'),
(2493049, 'CC-68-8866', 'hxnx djb', 2, 'hxhjxx bd', 'jdjdjxb', 'Male', 'D', 'BSIT', 'Mark AJ', 'irregular'),
(2493050, 'CC-11-2225', 'Andrea', 4, 'Camarig', 'Camarig', 'Female', 'A', 'BSIT', 'ayrah@gmail.com', 'regular'),
(2493051, 'CC-12-123', 'Ira', 4, 'Lacuit', 'Gojol', 'Female', 'A', 'BSIT', 'ayrah@gmail.com', 'regular');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(9) NOT NULL,
  `course_number` varchar(10) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `instructor` varchar(50) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `school_year` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `course_number`, `course_title`, `instructor`, `semester`, `school_year`) VALUES
(34, 'CIT 207', 'Computer Programming 1', 'ayrah@gmail.com', '2nd', '2022-2023'),
(35, 'css 215', 'networking', 'Santos', '1', '2022-23'),
(36, 'CIT-101', 'Methods of research ', 'ayrah@gmail.com', '2nd', '2023'),
(37, '1939', 'Hahha', 'emman', '1', '2023'),
(38, 'CIT 123', 'Software Engineering ', 'DeizyRee', '1', '2023'),
(39, 'CC-201', 'Programming ', 'Mark AJ', '1', '2026-2027'),
(40, 'Pathfit2', 'Fitness Exercises', 'Pammz23', '2nd', '2022-2023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2493052;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
