-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2023 at 05:15 PM
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
  `course_id` varchar(30) NOT NULL,
  `student_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `date`, `course_id`, `student_id`) VALUES
(97, '2022-12-07', 'CIT 207', 'CC-19-367'),
(98, '2022-12-07', 'CIT 207', 'CC-19-168'),
(99, '2022-12-07', 'CIT 207', 'CC-19-360'),
(100, '2022-12-07', 'css 215', 'CHD 12345');

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
(58, 'CIT-101', 'CC-19-367');

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
(20, 'Emman', 'Bonitillo', 'Bonitillo ', 'emman123', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `year` int(1) NOT NULL,
  `class_id` varchar(9) NOT NULL,
  `middlename` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `section` varchar(1) NOT NULL,
  `course` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `firstname`, `year`, `class_id`, `middlename`, `lastname`, `gender`, `section`, `course`) VALUES
(2492995, 'CC-19-168', 'Dezy', 4, '', 'Ree', 'Cacelna', 'Female', 'A', 'BSIT'),
(2492996, 'CC-19-367', 'Emmanuel', 4, '', 'Sansyo', 'Bonitillo', 'Male', 'A', 'BSIT'),
(2492997, 'CC-19-369', 'Michelle', 4, '', 'Paren', 'Tayo', 'Female', 'A', 'BSIT'),
(2492998, 'CC-19-360', 'Ivy Jean', 4, '', 'Alcarde', 'Pelale', 'Female', 'B', 'BSIT'),
(2492999, 'CC-19-361', 'Coleen', 2, '', 'Garcia', 'Crowford', 'Female', 'B', 'COE'),
(2493000, 'CHD 12345', 'Luisito', 1, '', 'Agenda', 'Close', 'Male', 'D', 'BSIT');

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
(36, 'CIT-101', 'Methods of research ', 'ayrah@gmail.com', '2nd', '2023');

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

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
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2493001;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
