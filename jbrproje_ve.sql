-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 06-Jun-2021 às 18:52
-- Versão do servidor: 10.2.37-MariaDB-cll-lve
-- versão do PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `jbrproje_ve`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidates`
--

CREATE TABLE `candidates` (
  `candidate_id` int(11) NOT NULL,
  `candidate_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `candidate_entourage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `candidates`
--

INSERT INTO `candidates` (`candidate_id`, `candidate_name`, `candidate_entourage`) VALUES
(54, 'José', 'Agente da PSP'),
(44, 'Eduardo ', NULL),
(45, 'João', 'Lista EI'),
(46, 'Hugo', 'Lista EM'),
(47, 'José', 'WEB'),
(48, 'Jorge', 'Programação'),
(49, NULL, 'PSD'),
(50, 'Ruben Amorim', 'Sporting CP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `document_type`
--

CREATE TABLE `document_type` (
  `doc_id` int(11) NOT NULL,
  `doc_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `document_type`
--

INSERT INTO `document_type` (`doc_id`, `doc_name`) VALUES
(1, 'Cartão de Cidadão'),
(2, 'Número de Aluno'),
(19, 'Número de Docente'),
(24, 'Número de Treinador'),
(25, 'Numero de Agente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date_ini` date NOT NULL,
  `event_date_exp` date NOT NULL,
  `event_n_votes` int(11) DEFAULT NULL,
  `doc_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `events`
--

INSERT INTO `events` (`event_id`, `event_title`, `event_description`, `event_date_ini`, `event_date_exp`, `event_n_votes`, `doc_id`) VALUES
(72, 'Eleger Presidente dos Professores', NULL, '2021-05-13', '2021-05-15', 1, 19),
(73, 'Eleições Autárquicas', 'Eleições Autárquicas', '2021-05-16', '2021-05-22', 0, 1),
(74, 'Eleger Associação Académica do IspGaya(2)', NULL, '2021-05-11', '2021-05-12', 1, 2),
(97, 'Evento Futuro', 'Declare o que pretende votar explicitamente', '2021-05-31', '2021-06-04', 0, 1),
(71, 'Eleger Associação Académica do IspGaya', NULL, '2021-05-10', '2021-05-10', 3, 2),
(86, 'Treinador do Ano', NULL, '2021-05-11', '2021-05-12', 1, 24),
(87, 'Policia do Ano', NULL, '2021-05-15', '2021-05-16', 0, 25),
(83, 'asdas', NULL, '2021-05-13', '2021-05-13', 0, 19),
(100, 'Evento Teste de Votações', NULL, '2021-06-04', '2021-06-05', 1, 2),
(103, 'Agente do Mês de Maio', 'Vote no Agente que teve melhor prestação no Mês de Maio', '2021-06-06', '2021-06-10', NULL, 25),
(104, 'Voto para Chefe dos Agentes', 'Academia da Polícia de Gaia', '2021-06-06', '2021-06-13', NULL, 25),
(105, 'Sinaleiro do Mês ', 'Zona Gaia', '2021-06-13', '2021-06-15', NULL, 25);

-- --------------------------------------------------------

--
-- Estrutura da tabela `events_candidates`
--

CREATE TABLE `events_candidates` (
  `event_id` int(11) NOT NULL,
  `candidate_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `events_candidates`
--

INSERT INTO `events_candidates` (`event_id`, `candidate_id`) VALUES
(73, 44),
(78, 46),
(82, 45),
(100, 46),
(77, 45),
(86, 50),
(77, 46),
(76, 45),
(82, 46),
(76, 46),
(75, 45),
(81, 45),
(75, 46),
(81, 46),
(74, 45),
(80, 45),
(74, 46),
(80, 46),
(71, 45),
(79, 45),
(71, 46),
(79, 46),
(72, 47),
(100, 47),
(100, 45),
(101, 49),
(72, 48),
(73, 49),
(78, 45),
(101, 44),
(101, 54),
(102, 54),
(102, 50),
(103, 44),
(103, 45),
(103, 47),
(104, 46),
(104, 50),
(104, 48);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_nmri` bigint(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `user_change_pw` tinyint(1) NOT NULL,
  `user_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_exp_pw_date` datetime NOT NULL,
  `user_role` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_email`, `user_nmri`, `doc_id`, `user_change_pw`, `user_key`, `user_exp_pw_date`, `user_role`) VALUES
(264, 'Tiago', 'f1f58e8c06b2a61ce13e0c0aa9473a72', 'hugogigas2000@gmail.com', 2019103225, 2, 1, '683934bef6a004a6605de8ae028acf94', '0000-00-00 00:00:00', 0),
(60, 'João Bruno', 'aa1bf4646de67fd9086cf6c79007026c', 'fanta7313@gmail.com', 231752458, 1, 1, '005695dc94b80edc671a402d5ebaab12', '0000-00-00 00:00:00', 0),
(70, 'Hugo Queirós', '415f1bcf72fdd66c49d6151908d93336', 'tds.hugo.queiros@gmail.com', 2019103226, 2, 1, '561461c96f90649f19a2c0d1c04ec23a', '0000-00-00 00:00:00', 0),
(1, 'João Rocha', 'd3db960183dff191b0bc46b5e29ff6a4', 'ispg2019101503@ispgaya.pt', 0, 0, 0, '7a78611ae52ad84dcedbd15f774af392', '0000-00-00 00:00:00', 1),
(2, 'Hugo Queirós', '6de3e21b70ce5c5ccd591e7ac4ae005b', 'ispg2019103226@ispgaya.pt', 0, 0, 0, '', '0000-00-00 00:00:00', 1),
(247, 'José Monteiro', '2ddbc46a537e4272851f7e9fc11bd189', 'jaam@ispgaya.pt', 88657, 19, 0, '8e569883357e8919a309d4dd83c14863', '0000-00-00 00:00:00', 0),
(249, 'José Monteiro', 'fda8715a1dc50d24f44f08a58c09e027', 'jaam@voto-eletronico.pt', 0, 0, 0, '', '0000-00-00 00:00:00', 1),
(260, 'Hugo Queirós', 'f1f58e8c06b2a61ce13e0c0aa9473a72', 'hugo-_queiros@hotmail.com', 250969319, 1, 1, '0abecb4df178bf5c75e152d46fc1ac83', '0000-00-00 00:00:00', 0),
(265, 'Alvaro', '98db6b79acb71383b5a83e0bbc1cadd4', 'alvaro@gmail.com', 2019103224, 2, 0, '', '0000-00-00 00:00:00', 0),
(263, 'João Rocha', 'aa1bf4646de67fd9086cf6c79007026c', 'joaobruno43@gmail.com', 2019101503, 2, 1, 'c2d185592cbb5a2d9eb6bf717f7df165', '2021-05-26 17:09:39', 0),
(262, 'Afonso123', 'b0a8828bed9aaac367ae4bcafe5d7804', 'afonso123@gmail.com', 88658, 19, 0, '', '0000-00-00 00:00:00', 0),
(259, 'António Queirós', 'aefe34008e63f1eb205dc4c4b8322253', 'toni-queiros@hotmail.com', 250969318, 1, 0, '', '0000-00-00 00:00:00', 0),
(275, 'HugoTeste', '74b9a02323bde242947485477a67d395', 'capitaotarijo@gmail.com', 2345, 25, 1, '773a1f5b37ff2b54046948de5012918d', '0000-00-00 00:00:00', 0),
(270, 'Esmeralda Pinheiro', 'f1f58e8c06b2a61ce13e0c0aa9473a72', 'esmeralda.pinheiro.queiros@gmail.com', 88661, 19, 1, 'acbe775328edc3d5e09e9dfcf4a79c50', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `votes`
--

CREATE TABLE `votes` (
  `user_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `vote_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `votes`
--

INSERT INTO `votes` (`user_id`, `candidate_id`, `event_id`, `vote_key`) VALUES
(269, 0, 86, '1790b0141b669ff639c8cde887d9a35c'),
(70, 46, 71, 'e4bc31a6189817e67184271443281441'),
(263, 0, 71, '35cc4899f11fe5f008dd0386258bffea'),
(264, 45, 71, '9bc27b3ca16dcdb201b81a40d57c61c2'),
(70, 46, 74, '03aa3954f61bdbfda50da1f09cdcb686'),
(270, 47, 72, 'c5845e7e17cdc4281d41e3ee7acc9b9f'),
(70, 46, 100, 'a65c1c764c6d85ac201163b61fcd87f1'),
(275, 49, 101, 'ce6dd7c88388cb9774b81e8d790dab9f'),
(275, 50, 102, '8c461ceed8c89793a5aa3d7f829168d9'),
(275, 45, 103, 'ab086cec09c8ffe7f4359a88b1dc706d');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`candidate_id`);

--
-- Índices para tabela `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`doc_id`);

--
-- Índices para tabela `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Índices para tabela `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`user_id`,`candidate_id`,`event_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `candidates`
--
ALTER TABLE `candidates`
  MODIFY `candidate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `document_type`
--
ALTER TABLE `document_type`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
