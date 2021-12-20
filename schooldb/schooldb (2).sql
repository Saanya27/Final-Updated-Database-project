-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2021 at 06:49 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schooldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `id` int(4) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `description`, `status`) VALUES
(1, 'JHGT', 'Qqwreerryytury', 'Y'),
(2, 'FGHJ', 'gndfgnmdfng,msdfng', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `section` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`, `section`) VALUES
(1, 'Class A', 'A'),
(2, 'CLASS 2', 'B'),
(3, 'CLASS 3', 'A'),
(4, 'CLASS 4', 'A'),
(5, 'CLASS 5', 'A');

-- --------------------------------------------------------

--
-- Stand-in structure for view `list`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `list`;
CREATE TABLE `list` (
`id` int(4)
,`name` varchar(128)
,`classid` int(4)
,`classteacher` int(4)
,`teacher` varchar(128)
,`subject` varchar(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(4) NOT NULL,
  `name` varchar(128) NOT NULL,
  `classid` int(4) NOT NULL,
  `classteacher` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `classid`, `classteacher`) VALUES
(1, 'YUGI', 2, 5),
(2, 'FNGM', 2, 3),
(3, 'XNAME', 2, 5),
(4, 'YNAME', 3, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `studentteacher`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `studentteacher`;
CREATE TABLE `studentteacher` (
`id` int(4)
,`name` varchar(128)
,`classid` int(4)
,`classteacher` int(4)
,`teacher` varchar(128)
);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`) VALUES
(1, 'GMAT'),
(2, 'GRE'),
(3, 'SAT'),
(4, 'MATH');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `id` int(4) NOT NULL,
  `name` varchar(128) NOT NULL,
  `stuatus` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `stuatus`) VALUES
(1, 'TYUIOP', 1),
(2, 'TYUIOPPP', 1),
(3, 'GHJKL', 1),
(4, 'TIUTIUGHG', 1),
(5, 'ASDDFFF', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

DROP TABLE IF EXISTS `teacher_subjects`;
CREATE TABLE `teacher_subjects` (
  `id` int(11) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `classid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_subjects`
--

INSERT INTO `teacher_subjects` (`id`, `teacherid`, `subjectid`, `classid`) VALUES
(1, 5, 1, 2),
(2, 5, 2, 5),
(3, 1, 2, 4),
(4, 4, 4, 1);

-- --------------------------------------------------------

--
-- Structure for view `list`
--
DROP TABLE IF EXISTS `list`;

DROP VIEW IF EXISTS `list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list`  AS SELECT `s`.`id` AS `id`, `s`.`name` AS `name`, `s`.`classid` AS `classid`, `s`.`classteacher` AS `classteacher`, `t`.`name` AS `teacher`, `sub`.`name` AS `subject` FROM (((`students` `s` left join `teachers` `t` on(`s`.`classteacher` = `t`.`name`)) left join `teacher_subjects` `ts` on(`ts`.`teacherid` = `t`.`id`)) left join `subjects` `sub` on(`sub`.`id` = `ts`.`subjectid`)) ;

-- --------------------------------------------------------

--
-- Structure for view `studentteacher`
--
DROP TABLE IF EXISTS `studentteacher`;

DROP VIEW IF EXISTS `studentteacher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentteacher`  AS SELECT `s`.`id` AS `id`, `s`.`name` AS `name`, `s`.`classid` AS `classid`, `s`.`classteacher` AS `classteacher`, `t`.`name` AS `teacher` FROM ((`students` `s` left join `teachers` `t` on(`s`.`classteacher` = `t`.`name`)) left join `teacher_subjects` `ts` on(`ts`.`teacherid` = `t`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `classid` (`classid`),
  ADD KEY `classteacher` (`classteacher`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacherid` (`teacherid`),
  ADD KEY `subjectid` (`subjectid`),
  ADD KEY `classid` (`classid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`classid`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`classteacher`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD CONSTRAINT `teacher_subjects_ibfk_1` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_subjects_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_subjects_ibfk_3` FOREIGN KEY (`classid`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
