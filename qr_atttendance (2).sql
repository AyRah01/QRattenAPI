-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2023 at 07:41 PM
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
(100, '2022-12-07', 'css 215', 'CHD 12345'),
(101, '2023-02-03', '1939', 'CC-17-192');

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
(60, '1939', 'CC-17-192');

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
(21, 'Emman', 'SANCTO', 'Bonitillo', 'emman', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `year` int(1) NOT NULL,
  `class_id` varchar(9) NOT NULL,
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

INSERT INTO `students` (`id`, `student_id`, `firstname`, `year`, `class_id`, `middlename`, `lastname`, `gender`, `section`, `course`, `teacher`) VALUES
(2493002, 'ff32', 'Deizy ', 4, '', 'Rie', 'Calceña ', 'Female', 'A', 'BSIT', 'ayrah@gmail.com'),
(2493003, 'CC-17-192', 'Angela', 4, '', 'Braza', 'Giner', 'Female', 'A', 'BSIT', 'emman');

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
(37, '1939', 'Hahha', 'emman', '1', '2023');

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
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2493004;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
