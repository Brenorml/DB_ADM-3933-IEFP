-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 03, 2023 at 04:41 PM
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
-- Database: `associacao_jovens`
--

-- --------------------------------------------------------

--
-- Table structure for table `atividades`
--

DROP TABLE IF EXISTS `atividades`;
CREATE TABLE IF NOT EXISTS `atividades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `atividades`
--

INSERT INTO `atividades` (`id`, `nome`, `descricao`) VALUES
(1, 'Futebol', 'Uma atividade desportiva que consiste em chutar uma bola para a baliza do adversário.'),
(2, 'Voleibol', 'Uma atividade desportiva que consiste em segurar uma bola no ar com as mãos e braços.'),
(3, 'Basquetebol', 'Uma atividade desportiva que consiste em encestar uma bola num cesto.');

-- --------------------------------------------------------

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fornecedor_id` (`fornecedor_id`),
  KEY `fk_produto_id` (`produto_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `compras`
--

INSERT INTO `compras` (`id`, `fornecedor_id`, `produto_id`, `quantidade`, `preco_unitario`, `total`) VALUES
(1, 1, 1, 10, '10.00', '100.00'),
(2, 2, 2, 20, '15.00', '300.00'),
(3, 3, 3, 30, '20.00', '600.00');

-- --------------------------------------------------------

--
-- Table structure for table `contas`
--

DROP TABLE IF EXISTS `contas`;
CREATE TABLE IF NOT EXISTS `contas` (
  `id` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `numero_da_conta` varchar(255) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contas`
--

INSERT INTO `contas` (`id`, `nome`, `numero_da_conta`, `saldo`) VALUES
(1, 'Conta Bancária', '0000-0000-0000-0000', '10000.00'),
(2, 'Conta de Cartão de\r\nCrédito', '1234-5678-9012-3456', '5000.00');

-- --------------------------------------------------------

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `int` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  PRIMARY KEY (`int`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fornecedores`
--

INSERT INTO `fornecedores` (`int`, `nome`, `endereco`, `telefone`) VALUES
(1, 'Adidas', 'Rua da Liberdade, 123', '912345678'),
(2, 'Nike', 'Rua da Paz, 456', '923456789'),
(3, 'Puma', 'Rua da Alegria, 789', '934567890');

-- --------------------------------------------------------

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `funcao` varchar(255) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `funcao`, `salario`) VALUES
(1, 'José', 'Diretor', '1000.00'),
(2, 'Maria', 'Coordenador', '800.00'),
(3, 'Pedro', 'Monitor', '600.00');

-- --------------------------------------------------------

--
-- Table structure for table `inscricoes`
--

DROP TABLE IF EXISTS `inscricoes`;
CREATE TABLE IF NOT EXISTS `inscricoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `membro_id` int NOT NULL,
  `atividade_id` int NOT NULL,
  `data_de_inscricao` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_membro_id` (`membro_id`),
  KEY `fk_atividade_id` (`atividade_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inscricoes`
--

INSERT INTO `inscricoes` (`id`, `membro_id`, `atividade_id`, `data_de_inscricao`) VALUES
(1, 1, 1, '2023-01-01'),
(2, 2, 2, '2023-01-02'),
(3, 3, 3, '2023-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `membros`
--

DROP TABLE IF EXISTS `membros`;
CREATE TABLE IF NOT EXISTS `membros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `idade` int NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `membros`
--

INSERT INTO `membros` (`id`, `nome`, `idade`, `endereco`, `telefone`) VALUES
(1, 'João', 15, 'Rua da Liberdade, 123', '912345678'),
(2, 'Maria', 16, 'Rua da Paz, 456', '923456789'),
(3, 'Pedro', 17, 'Rua da Alegria, 789', '934567890');

-- --------------------------------------------------------

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
CREATE TABLE IF NOT EXISTS `pagamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inscricao_id` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_do_pagamento` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inscricao_id` (`inscricao_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pagamentos`
--

INSERT INTO `pagamentos` (`id`, `inscricao_id`, `valor`, `data_do_pagamento`) VALUES
(3, 3, '20.00', '2023-01-03'),
(2, 2, '15.00', '2023-01-02'),
(1, 1, '10.00', '2023-01-01');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
