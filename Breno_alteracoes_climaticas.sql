-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 04, 2023 at 03:26 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alterações_climáticas`
--

-- --------------------------------------------------------

--
-- Table structure for table `dadosclimaticos`
--

DROP TABLE IF EXISTS `dadosclimaticos`;
CREATE TABLE IF NOT EXISTS `dadosclimaticos` (
  `DadoID` int NOT NULL,
  `PaisID` smallint DEFAULT NULL,
  `Temperatura` smallint DEFAULT NULL,
  `Precipitacao` smallint DEFAULT NULL,
  `Ano` smallint DEFAULT NULL,
  PRIMARY KEY (`DadoID`),
  KEY `PaisID` (`PaisID`),
  KEY `idx_Ano` (`Ano`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dadosclimaticos`
--

INSERT INTO `dadosclimaticos` (`DadoID`, `PaisID`, `Temperatura`, `Precipitacao`, `Ano`) VALUES
(1, 1, 25, 100, 2020),
(2, 1, 28, 80, 2021),
(3, 2, 20, 50, 2020),
(4, 2, 22, 60, 2021),
(5, 3, 15, 70, 2020),
(6, 3, 18, 75, 2021);

-- --------------------------------------------------------

--
-- Stand-in structure for view `dadosclimaticosview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `dadosclimaticosview`;
CREATE TABLE IF NOT EXISTS `dadosclimaticosview` (
`DadoID` int
,`NomePais` varchar(100)
,`Temperatura` smallint
,`Precipitacao` smallint
,`Ano` smallint
);

-- --------------------------------------------------------

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE IF NOT EXISTS `paises` (
  `PaisID` smallint NOT NULL,
  `NomePais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PaisID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `paises`
--

INSERT INTO `paises` (`PaisID`, `NomePais`) VALUES
(1, 'Brasil'),
(2, 'Estados Unidos'),
(3, 'Canadá');

-- --------------------------------------------------------

--
-- Structure for view `dadosclimaticosview`
--
DROP TABLE IF EXISTS `dadosclimaticosview`;

DROP VIEW IF EXISTS `dadosclimaticosview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dadosclimaticosview`  AS SELECT `dc`.`DadoID` AS `DadoID`, `p`.`NomePais` AS `NomePais`, `dc`.`Temperatura` AS `Temperatura`, `dc`.`Precipitacao` AS `Precipitacao`, `dc`.`Ano` AS `Ano` FROM (`dadosclimaticos` `dc` join `paises` `p` on((`dc`.`PaisID` = `p`.`PaisID`)))  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
