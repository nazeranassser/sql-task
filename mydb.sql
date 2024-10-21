-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 17, 2024 at 12:32 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `credits` int NOT NULL,
  `department` varchar(100) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_code`, `credits`, `department`) VALUES
(1, 'html', 'h1', 4, 'web'),
(2, 'css', 'c1', 4, 'web'),
(3, 'javascript', 'j1', 3, 'web'),
(4, 'php', 'p1', 3, 'it');

-- --------------------------------------------------------

--
-- Table structure for table `course_assignments`
--

DROP TABLE IF EXISTS `course_assignments`;
CREATE TABLE IF NOT EXISTS `course_assignments` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `instructor_id` int NOT NULL,
  `course_id` int NOT NULL,
  `semester` varchar(50) NOT NULL,
  `year` year NOT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `instructor_id` (`instructor_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `course_assignments`
--

INSERT INTO `course_assignments` (`assignment_id`, `instructor_id`, `course_id`, `semester`, `year`) VALUES
(1, 1, 1, 'Fall', '2024'),
(2, 2, 2, 'Fall', '2024'),
(3, 3, 3, 'Fall', '2024'),
(4, 4, 4, 'Fall', '2024'),
(5, 5, 5, 'Fall', '2024');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
CREATE TABLE IF NOT EXISTS `enrollments` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
CREATE TABLE IF NOT EXISTS `instructors` (
  `instructor_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hire_date` date NOT NULL,
  `department` varchar(100) NOT NULL,
  PRIMARY KEY (`instructor_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructor_id`, `first_name`, `last_name`, `email`, `hire_date`, `department`) VALUES
(1, 'alaa', 'mohammad', 'alaa@gmail.com', '2015-08-08', 'web'),
(2, 'ayham', 'mohammad', 'ayham@gmail.com', '2019-05-05', 'web'),
(3, 'mona', 'mohammad', 'mona@gmail.com', '2017-09-08', 'web'),
(4, 'mohammad', 'mohammad', 'mohammad@gmail.com', '2014-07-08', 'web'),
(5, 'saja', 'mohammad', 'saja@gmail.com', '2020-02-01', 'it');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `major` varchar(100) DEFAULT NULL,
  `enrollment_year` year NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `firstname`, `lastname`, `email`, `date_of_birth`, `gender`, `major`, `enrollment_year`) VALUES
(1, 'rama', 'nasser', 'rama@gmail.com', '2020-05-12', 'F', 'CIS', '2022'),
(2, 'rawan', 'nasser', 'rawan@gmail.com', '1994-09-28', 'F', 'CIS', '2022'),
(3, 'farah', 'nasser', 'farah@gmail.com', '1999-09-28', 'F', 'CIS', '2022'),
(4, 'razan', 'nasser', 'razan@gmail.com', '2001-09-28', 'F', 'CIS', '2022'),
(5, 'wan', 'ser', 'wan@gmail.com', '2003-09-28', 'F', 'CIS', '2022'),
(6, 'sara', 'moh', 'sara@gmail.com', '2002-09-28', 'F', 'CIS', '2022'),
(7, 'mona', 'moh', 'mona@gmail.com', '2000-09-28', 'M', 'CIS', '2022'),
(8, 'sami', 'jaber', 'sami@gmail.com', '1994-02-02', 'M', 'CS', '2020'),
(9, 'majd', 'ayham', 'mj@gmail.com', '1994-02-02', 'M', 'CS', '2021'),
(10, 'sami', 'jaber', 'sami@gmail.com', '1994-02-02', 'M', 'CIS', '2022');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
--1
 select * 
 from students 
 --2 
 select count(*) as total_corces
 from courses
 --3 
SELECT s.first_name, s.last_name 
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.course_id = '2'; 
 --4 
 select email 
 from instructors 
 where department ='web'
 --5
 SELECT c.course_name, COUNT(e.student_id) AS number_of_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;
--6
SELECT s.first_name, s.last_name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN grades g ON e.student_id = g.student_id AND e.course_id = g.course_id
JOIN courses c ON e.course_id = c.course_id
WHERE g.grade = 'A';

--7
SELECT c.course_name, i.first_name, i.last_name
FROM courses c
JOIN course_instructors ci ON c.course_id = ci.course_id
JOIN instructors i ON ci.instructor_id = i.instructor_id
WHERE ci.semester = 'specific_semester';

--8
SELECT c.course_name, AVG(CASE 
                            WHEN e.grade = 'A' THEN 4.0 
                            WHEN e.grade = 'B' THEN 3.0 
                            WHEN e.grade = 'C' THEN 2.0 
                            WHEN e.grade = 'D' THEN 1.0 
                            WHEN e.grade = 'F' THEN 0.0 
                            ELSE NULL END) AS average_grade
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
WHERE c.course_id = 1;


