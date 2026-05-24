-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2026 at 06:46 PM
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
-- Database: `student_table`
--

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `BlockID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `BlockName` varchar(100) NOT NULL,
  `YearLevel` int(11) DEFAULT NULL,
  `Semester` varchar(20) DEFAULT NULL,
  `AcademicYear` year(4) DEFAULT NULL,
  `MaxStudents` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`BlockID`, `CourseID`, `BlockName`, `YearLevel`, `Semester`, `AcademicYear`, `MaxStudents`, `IsActive`) VALUES
(1, 1, 'BSIT 1-A', 1, '1st', '2024', 45, 1),
(2, 1, 'BSIT 1-B', 1, '1st', '2024', 45, 1),
(3, 1, 'BSIT 2-A', 2, '2nd', '2024', 45, 1),
(4, 2, 'BSCS 1-A', 1, '1st', '2024', 40, 1),
(5, 2, 'BSCS 2-A', 2, '2nd', '2024', 40, 1),
(6, 3, 'BSCE 1-A', 1, '1st', '2024', 50, 1),
(7, 5, 'BSBA 1-A', 1, '1st', '2024', 50, 1),
(8, 6, 'BSA  1-A', 1, '1st', '2024', 50, 1),
(9, 7, 'BSED 1-A', 1, '1st', '2024', 45, 1),
(10, 8, 'BEED 1-A', 1, '1st', '2024', 45, 1),
(11, 9, 'BSBIO 1-A', 1, '1st', '2024', 45, 1),
(12, 10, 'ABCOM 1-A', 1, '1st', '2024', 50, 1),
(13, 11, 'BSN  1-A', 1, '1st', '2024', 40, 1),
(14, 14, 'BSAg 1-A', 1, '1st', '2024', 45, 1),
(15, 15, 'BSHRM 1-A', 1, '1st', '2024', 45, 1),
(16, 1, 'BSIT 2-B', 2, '2nd', '2024', 45, 1),
(17, 1, 'BSIT 3-A', 3, '1st', '2024', 40, 1),
(18, 1, 'BSIT 4-A', 4, '1st', '2024', 40, 1),
(19, 2, 'BSCS 1-B', 1, '1st', '2024', 40, 1),
(20, 2, 'BSCS 3-A', 3, '1st', '2024', 35, 1),
(21, 3, 'BSCE 1-B', 1, '1st', '2024', 50, 1),
(22, 3, 'BSCE 2-A', 2, '2nd', '2024', 45, 1),
(23, 5, 'BSBA 1-B', 1, '1st', '2024', 50, 1),
(24, 5, 'BSBA 2-A', 2, '2nd', '2024', 50, 1),
(25, 6, 'BSA 2-A', 2, '2nd', '2024', 45, 1),
(26, 7, 'BSED 2-A', 2, '2nd', '2024', 45, 1),
(27, 8, 'BEED 2-A', 2, '2nd', '2024', 45, 1),
(28, 9, 'BSBIO 2-A', 2, '2nd', '2024', 40, 1),
(29, 10, 'ABCOM 2-A', 2, '2nd', '2024', 50, 1),
(30, 11, 'BSN 2-A', 2, '2nd', '2024', 40, 1),
(31, 14, 'BSAg 2-A', 2, '2nd', '2024', 45, 1),
(32, 15, 'BSHRM 2-A', 2, '2nd', '2024', 45, 1),
(33, 1, 'BSIT 1-C', 1, '1st', '2024', 45, 1),
(34, 1, 'BSIT 3-B', 3, '1st', '2024', 40, 1),
(35, 2, 'BSCS 4-A', 4, '1st', '2024', 35, 1),
(36, 3, 'BSCE 3-A', 3, '1st', '2024', 45, 1),
(37, 5, 'BSBA 3-A', 3, '1st', '2024', 50, 1),
(38, 6, 'BSA 3-A', 3, '1st', '2024', 45, 1),
(39, 7, 'BSED 3-A', 3, '1st', '2024', 45, 1),
(40, 8, 'BEED 3-A', 3, '1st', '2024', 45, 1),
(41, 9, 'BSBIO 3-A', 3, '1st', '2024', 40, 1),
(42, 10, 'ABCOM 3-A', 3, '1st', '2024', 50, 1),
(43, 11, 'BSN 3-A', 3, '1st', '2024', 40, 1),
(44, 14, 'BSAg 3-A', 3, '1st', '2024', 45, 1),
(45, 15, 'BSHRM 3-A', 3, '1st', '2024', 45, 1),
(46, 1, 'BSIT 4-B', 4, '1st', '2024', 40, 1),
(47, 2, 'BSCS 2-B', 2, '2nd', '2024', 40, 1),
(48, 3, 'BSCE 4-A', 4, '1st', '2024', 45, 1),
(49, 5, 'BSBA 4-A', 4, '1st', '2024', 50, 1),
(50, 6, 'BSA 4-A', 4, '1st', '2024', 45, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `BlockID` int(11) NOT NULL,
  `StudentNumber` varchar(20) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `YearLevel` int(11) DEFAULT NULL,
  `Semester` varchar(20) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `BlockID`, `StudentNumber`, `FirstName`, `LastName`, `Email`, `YearLevel`, `Semester`, `IsActive`) VALUES
(1, 1, '2024-00001', 'Juan', 'Dela Cruz', 'juan.delacruz@student.edu', 1, '1st', 1),
(2, 1, '2024-00002', 'Ana', 'Santos', 'ana.santos@student.edu', 1, '1st', 1),
(3, 1, '2024-00003', 'Marco', 'Reyes', 'marco.reyes@student.edu', 1, '1st', 1),
(4, 2, '2024-00004', 'Liza', 'Gomez', 'liza.gomez@student.edu', 1, '1st', 1),
(5, 2, '2024-00005', 'Paolo', 'Villanueva', 'paolo.villanueva@student.edu', 1, '1st', 1),
(6, 3, '2024-00006', 'Maria', 'Torres', 'maria.torres@student.edu', 2, '2nd', 1),
(7, 4, '2024-00007', 'Carlos', 'Lim', 'carlos.lim@student.edu', 1, '1st', 1),
(8, 5, '2024-00008', 'Rosa', 'Fernandez', 'rosa.fernandez@student.edu', 2, '2nd', 1),
(9, 6, '2024-00009', 'Miguel', 'Cruz', 'miguel.cruz@student.edu', 1, '1st', 1),
(10, 7, '2024-00010', 'Elena', 'Aquino', 'elena.aquino@student.edu', 1, '1st', 1),
(11, 8, '2024-00011', 'Ramon', 'Bautista', 'ramon.bautista@student.edu', 1, '1st', 1),
(12, 9, '2024-00012', 'Carla', 'Navarro', 'carla.navarro@student.edu', 1, '1st', 1),
(13, 11, '2024-00013', 'Dennis', 'Salazar', 'dennis.salazar@student.edu', 1, '1st', 1),
(14, 13, '2024-00014', 'Kristine', 'Ramos', 'kristine.ramos@student.edu', 1, '1st', 1),
(15, 15, '2024-00015', 'Jerome', 'Magbanua', 'jerome.magbanua@student.edu', 1, '1st', 1),
(16, 1, '2024-00016', 'Antonio', 'Luna', 'antonio.luna@student.edu', 2, '2nd', 1),
(17, 2, '2024-00017', 'Christina', 'Mendoza', 'christina.mendoza@student.edu', 1, '1st', 1),
(18, 3, '2024-00018', 'Manuel', 'Quezon', 'manuel.quezon@student.edu', 2, '2nd', 1),
(19, 4, '2024-00019', 'Angel', 'Locsin', 'angel.locsin@student.edu', 1, '1st', 1),
(20, 5, '2024-00020', 'Ricardo', 'Dalisay', 'ricardo.dalisay@student.edu', 1, '1st', 1),
(21, 6, '2024-00021', 'Lea', 'Salonga', 'lea.salonga@student.edu', 1, '1st', 1),
(22, 7, '2024-00022', 'Gabriel', 'Mercado', 'gabriel.mercado@student.edu', 1, '1st', 1),
(23, 8, '2024-00023', 'Nadine', 'Lustre', 'nadine.lustre@student.edu', 2, '1st', 1),
(24, 9, '2024-00024', 'Francis', 'Magalona', 'francis.magalona@student.edu', 1, '1st', 1),
(25, 10, '2024-00025', 'Catriona', 'Gray', 'catriona.gray@student.edu', 3, '1st', 1),
(26, 11, '2024-00026', 'Pio', 'Valenzuela', 'pio.valenzuela@student.edu', 1, '1st', 1),
(27, 12, '2024-00027', 'Kathryn', 'Bernardo', 'kathryn.bernardo@student.edu', 2, '2nd', 1),
(28, 13, '2024-00028', 'Daniel', 'Padilla', 'daniel.padilla@student.edu', 1, '1st', 1),
(29, 14, '2024-00029', 'Jose', 'Rizal', 'jose.rizal@student.edu', 1, '1st', 1),
(30, 15, '2024-00030', 'Andres', 'Bonifacio', 'andres.bonifacio@student.edu', 1, '1st', 1),
(31, 1, '2024-00031', 'Apolinario', 'Mabini', 'apolinario.mabini@student.edu', 2, '2nd', 1),
(32, 2, '2024-00032', 'Melchora', 'Aquino', 'melchora.aquino@student.edu', 1, '1st', 1),
(33, 3, '2024-00033', 'Emilio', 'Aguinaldo', 'emilio.aguinaldo@student.edu', 2, '2nd', 1),
(34, 4, '2024-00034', 'Marcelo', 'Del Pilar', 'marcelo.delpilar@student.edu', 1, '1st', 1),
(35, 5, '2024-00035', 'Gabriela', 'Silang', 'gabriela.silang@student.edu', 1, '1st', 1),
(36, 6, '2024-00036', 'Juan', 'Luna', 'juan.luna2@student.edu', 1, '1st', 1),
(37, 7, '2024-00037', 'Gregorio', 'Del Pilar', 'gregorio.delpilar@student.edu', 1, '1st', 1),
(38, 8, '2024-00038', 'Diego', 'Silang', 'diego.silang@student.edu', 2, '1st', 1),
(39, 9, '2024-00039', 'Lapu', 'Lapu', 'lapu.lapu@student.edu', 1, '1st', 1),
(40, 10, '2024-00040', 'Francisco', 'Balagtas', 'francisco.balagtas@student.edu', 3, '1st', 1),
(41, 11, '2024-00041', 'Epifanio', 'Delos Santos', 'epifanio.delossantos@student.edu', 1, '1st', 1),
(42, 12, '2024-00042', 'Sultan', 'Kudarat', 'sultan.kudarat@student.edu', 2, '2nd', 1),
(43, 13, '2024-00043', 'Macario', 'Sakay', 'macario.sakay@student.edu', 1, '1st', 1),
(44, 14, '2024-00044', 'Mariano', 'Ponce', 'mariano.ponce@student.edu', 1, '1st', 1),
(45, 15, '2024-00045', 'Benigno', 'Aquino', 'benigno.aquino@student.edu', 3, '2nd', 1),
(46, 1, '2024-00046', 'Galicano', 'Apacible', 'galicano.apacible@student.edu', 2, '1st', 1),
(47, 2, '2024-00047', 'Teodora', 'Alonzo', 'teodora.alonzo@student.edu', 1, '1st', 1),
(48, 3, '2024-00048', 'Geronima', 'Pecson', 'geronima.pecson@student.edu', 4, '2nd', 1),
(49, 4, '2024-00049', 'Lope', 'Santos', 'lope.santos@student.edu', 1, '1st', 1),
(50, 5, '2024-00050', 'Honoria', 'Acosta', 'honoria.acosta@student.edu', 2, '1st', 1),
(51, 43, '2024-000051', 'lany', 'mirabel', 'lany.mirabel@student.edu', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD KEY `BlockID` (`BlockID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `BlockID` (`BlockID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_block` FOREIGN KEY (`BlockID`) REFERENCES `block` (`BlockID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
