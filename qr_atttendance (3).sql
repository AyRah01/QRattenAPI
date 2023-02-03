-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2023 at 10:14 PM
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
(131, '2023-02-04', NULL, 'CIT 207', 'CC-19-125', 0),
(132, '2023-02-04', NULL, 'CIT 207', 'CC-19-102 ', 0),
(133, '2023-02-04', '00:00:00', 'CIT 207', 'CC-19-124', 1),
(134, '2023-02-02', NULL, 'CIT 207', 'CC-19-164', 0),
(135, '2023-02-04', '04:43:26', 'CIT 207', 'CC-22-150', 1),
(136, '2023-02-04', '04:43:59', 'CIT 207', 'CC-12-167', 1),
(137, '2023-02-04', '04:44:02', 'CIT 207', 'CC-17-146', 1),
(138, '2023-02-04', '04:43:21', 'CIT 207', 'CC-44-777', 1),
(139, '2023-02-04', '04:44:04', 'CIT 207', 'CC-19-164', 1);

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
(52, 'CIT 207', 'CC-19-367'),
(53, 'CIT 207', 'CC-19-168'),
(54, 'CIT 207', 'CC-19-360'),
(55, 'css 215', 'CHD 12345'),
(56, 'CIT 207', 'CC-19-361'),
(57, 'CIT-101', 'CC-19-361'),
(58, 'CIT-101', 'CC-19-367'),
(59, 'CIT 207', 'CC-17-129'),
(60, '1939', 'CC-17-192'),
(61, '1939', 'MSLS192'),
(62, 'CIT 123', 'CC-54-545'),
(64, 'CIT 207', 'CC-19-102 '),
(65, 'CIT 207', 'CC-19-124'),
(66, 'CIT 207', 'CC-19-125'),
(67, 'CIT 207', 'CC-22-150'),
(68, 'CIT 207', 'CC-19-164'),
(69, 'CIT 207', 'CC-12-167'),
(70, 'CIT 207', 'CC-17-146'),
(71, 'CIT 207', 'CC-44-777');

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
(18, 'Ira', 'Laquick', 'Gojol', 'ayrah@gmail.com', '1234'),
(19, 'Jose', 'Abad', 'Santos', 'Santos', 'Abad'),
(20, 'Emman', 'Bonitillo', 'Bonitillo ', 'emman123', '1234'),
(21, 'Emman', 'SANCTO', 'Bonitillo', 'emman', '1234'),
(22, 'Deizy Ree', 'Paredes ', 'Calceña ', 'DeizyRee', 'deizy04');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `year` int(1) NOT NULL,
  `middlename` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `section` varchar(1) NOT NULL,
  `course` varchar(8) NOT NULL,
  `teacher` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `firstname`, `year`, `middlename`, `lastname`, `gender`, `section`, `course`, `teacher`) VALUES
(2493002, 'CC-19-125', 'Deizy ', 4, 'Rie', 'Calceña ', 'Female', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493003, 'CC-17-192', 'Angela', 4, 'Braza', 'Giner', 'Female', 'A', 'BSIT', 'emman'),
(2493004, 'MSLS192', 'Tata', 1, 'Yaya', 'Kslayay', 'Male', 'A', 'COE', 'emman'),
(2493005, 'CC-19-102 ', 'Alden', 1, 'James', 'Nico', 'Male', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493006, '1234', 'Alnica', 2, 'S', 'Nice', 'Female', 'G', 'BSIT', 'ayrah@gmail.com'),
(2493007, 'SK32', 'Bia', 4, 'C', 'jhn', 'Female', 'D', 'BSIT', 'ayrah@gmail.com'),
(2493008, '683G', 'James', 2, 'gsh', 'vdvd', 'Male', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493011, '75792B', 'Lemis', 1, 'C', 'Noice', 'Male', 'D', 'COE', 'ayrah@gmail.com'),
(2493012, 'CC', 'Honey', 3, 'SUgar', 'gihvc', 'Male', 'C', 'COE', 'ayrah@gmail.com'),
(2493015, 'CC-19-124', 'Weerrto', 1, 'Weldy', 'Latino', 'Male', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493016, 'CC 18L89R', 'Ej', 2, 'J', 'Lo', 'Male', 'D', 'COE', 'ayrah@gmail.com'),
(2493021, 'CC-19-365', 'Gdghdge', 2, 'Dhdh', 'Hdgdgx', 'Male', 'E', 'CBM', 'ayrah@gmail.com'),
(2493024, 'CC-19-132', 'zlKm', 2, 'pool', 'mzmzmm', 'Male', 'F', 'SOA', 'DeizyRee'),
(2493025, 'CC-13-986', 'Zbxv', 2, 'Zvnvz', 'Fnaf', 'Female', 'D', 'SOA', 'ayrah@gmail.com'),
(2493026, 'CC-12-862', 'gug', 2, 'guess ', 'rhvc', 'Male', 'D', 'SOA', 'DeizyRee'),
(2493027, 'CC-19-222', 'Louise', 2, 'Cy', 'Chui', 'Female', 'A', 'BSIT', 'DeizyRee'),
(2493028, 'CC-19-333', 'Ha', 1, 'He', 'Hi', 'Female', 'C', 'CBM', 'DeizyRee'),
(2493029, 'CC-19-444', 'hdhs', 2, 'hdhd', 'jdhdb', 'Female', 'G', 'COE', 'DeizyRee'),
(2493030, 'CC-21-246', 'Blaire', 4, 'ha', 'hatdog', 'Female', 'A', 'BSIT', 'DeizyRee'),
(2493031, 'CC-54-545', 'Claire', 2, 'Naive', 'Hahaha', 'Female', 'A', 'COE', 'DeizyRee'),
(2493032, 'CC-19-164', 'Billy', 1, 'Gates', 'Pale', 'Male', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493033, 'CC-22-150', 'Alpi', 1, 'y', 'gcb', 'Male', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493034, 'CC-12-167', 'Wally', 1, 'Weer', 'Kaal', 'Male', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493035, 'CC-66-333', 'Jhonny', 1, 'I', 'lol', 'Male', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493036, 'CC-17-146', 'Quuu', 1, 'Yuuu', 'Tale', 'Female', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493037, 'CC-68-777', 'Ruy', 1, 'C', 'No', 'Male', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493038, 'CC-44-777', 'aeb', 1, 'yu', 'nii', 'Male', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493039, 'CC-12-121', 'Seeeb', 3, 'vu', 'ni', 'Female', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493040, 'CC-23-001', 'Yayer', 4, 'Yutlo', 'Waryl', 'Female', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493041, 'CC-23-001', 'Yayer', 4, 'Yutlo', 'Waryl', 'Female', 'A', 'BSIT', 'ayrah@gmail.com');

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
(38, 'CIT 123', 'Software Engineering ', 'DeizyRee', '1', '2023');

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
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2493042;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
