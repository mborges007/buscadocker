-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/11/2024 às 03:55
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `busca`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE DATABASE IF NOT EXISTS busca;
USE busca;

CREATE TABLE IF NOT EXISTS `avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `fk_usuario_id_usuario` int(11) NOT NULL,
  `data_avaliacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `fk_profissional_id_profissional` int(11) NOT NULL,
  `estrelas_avaliacao` int(1) NOT NULL CHECK (`estrelas_avaliacao` >= 0 and `estrelas_avaliacao` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacao`
--

INSERT INTO `avaliacao` (`id_avaliacao`, `fk_usuario_id_usuario`, `data_avaliacao`, `fk_profissional_id_profissional`, `estrelas_avaliacao`) VALUES
(23, 2, '2024-11-20 19:38:08', 20, 3),
(24, 2, '2024-11-19 20:16:54', 15, 4),
(25, 2, '2024-11-19 21:02:09', 23, 4),
(26, 2, '2024-11-19 20:35:57', 21, 4),
(27, 2, '2024-11-19 20:39:59', 13, 3),
(28, 2, '2024-11-19 21:26:24', 5, 4),
(29, 2, '2024-11-20 14:08:36', 11, 4),
(30, 2, '2024-11-20 14:30:24', 9, 4),
(31, 2, '2024-11-20 15:08:57', 8, 4),
(32, 2, '2024-11-20 15:14:10', 19, 4),
(33, 2, '2024-11-20 16:52:26', 7, 4),
(34, 2, '2024-11-20 17:02:21', 6, 4),
(35, 2, '2024-11-20 19:37:42', 17, 3),
(36, 2, '2024-11-20 22:02:48', 10, 4),
(37, 2, '2024-11-20 22:03:36', 14, 4),
(38, 2, '2024-11-21 15:27:15', 16, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamentos`
--
CREATE TABLE IF NOT EXISTS `departamentos` (
  `id_area` int(11) NOT NULL,
  `nome_area` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `departamentos`
--

INSERT INTO `departamentos` (`id_area`, `nome_area`) VALUES
(1, 'Cuidados Pessoais'),
(2, 'Residencial'),
(3, 'Cuidado Automotivo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos_perfil`
--

CREATE TABLE IF NOT EXISTS `fotos_perfil` (
  `id_foto_perfil` int(11) NOT NULL,
  `caminho_foto_perfil` varchar(255) DEFAULT NULL,
  `fk_profissional_id_profissional` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fotos_perfil`
--

INSERT INTO `fotos_perfil` (`id_foto_perfil`, `caminho_foto_perfil`, `fk_profissional_id_profissional`) VALUES
(1, 'uploads/fotos_perfil/673f3ec4a7d8d.jpg', 5),
(2, 'uploads/fotos_perfil/673f3ee805401.jpg', 5),
(3, 'uploads/fotos_perfil/673f3ef4d5891.jpg', 5),
(4, 'uploads/fotos_perfil/673f3f351be38.jpg', 5),
(5, 'uploads/fotos_perfil/673f3f4f30ba8.jpg', 5),
(6, 'uploads/fotos_perfil/673f3f720ffd2.jpg', 5),
(7, 'uploads/fotos_perfil/673f3f75d6e08.jpg', 5),
(8, 'uploads/fotos_perfil/673f3fc464554.jpg', 5),
(9, 'uploads/fotos_perfil/673f3fccf0311.jpg', 5),
(10, 'uploads/fotos_perfil/673f3fd260c01.jpg', 5),
(11, 'uploads/fotos_perfil/673f3fdcb48f9.jpg', 5),
(12, 'uploads/fotos_perfil/673f4d63d370f.jpg', 5),
(13, 'uploads/fotos_perfil/673f4d67024ab.jpg', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos_profissionais`
--

CREATE TABLE IF NOT EXISTS `fotos_profissionais` (
  `id_foto` int(11) NOT NULL,
  `caminho_foto` varchar(255) DEFAULT NULL,
  `fk_profissional_id_profissional` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fotos_profissionais`
--

INSERT INTO `fotos_profissionais` (`id_foto`, `caminho_foto`, `fk_profissional_id_profissional`) VALUES
(10, 'uploads/fotos_profissionais/673e4899c9348.png', 5),
(15, 'uploads/fotos_profissionais/673f4e9782d9d.png', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `profissional`
--

CREATE TABLE IF NOT EXISTS `profissional` (
  `id_profissional` int(11) NOT NULL,
  `nome_profissional` varchar(50) NOT NULL,
  `senha_profissional` varchar(255) NOT NULL,
  `descricao_profissional` text DEFAULT NULL,
  `email_profissional` varchar(50) NOT NULL,
  `tel_profissional` varchar(11) NOT NULL,
  `ranking_profissional` int(11) NOT NULL,
  `fk_departamentos_id_area` int(11) NOT NULL,
  `fk_profissoes_id_profissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `profissional`
--

INSERT INTO `profissional` (`id_profissional`, `nome_profissional`, `senha_profissional`, `descricao_profissional`, `email_profissional`, `tel_profissional`, `ranking_profissional`, `fk_departamentos_id_area`, `fk_profissoes_id_profissao`) VALUES
(5, 'Ma', '$2y$10$07XqXBQglq4Sfg0uBGzgnulbWxlmZ0xZDLNTUP/T94yplqjSM.i..', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum Maecenas ipsum velit,', 'ma@gmail.com', '19998414123', 0, 1, 1),
(6, 'rafa', '$2y$10$75mO/bepgvrN0vEOOoB5B.4BrIoeAsrWMa7KccWHQ6XVUuGWMEkj6', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum', 'rafa@gmail.com', '19999098889', 0, 3, 7),
(7, 'Jose', '$2y$10$tyiu6vwmivn9J/dymecMnO0KA3lCHuu8apuFIw4ozUFazTty7g8ny', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus.ss', 'jose@gmaisl', '12312321322', 0, 3, 7),
(8, 'mariana', '$2y$10$ecaeyJmMi.zNZhvLVDSTI.zDNuPzfCOJARRi4m62bDrUA8LqNRAjm', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus.ss', 'marianam@gmails', '1293923923', 0, 3, 7),
(9, 'cleide', '$2y$10$soT9NwymS.vcprBd2HhzPOSjtXjW67SiLcAxVxev4kfPG6QCmlYXm', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus.ss', 'cliede@gmais', '12321312312', 0, 3, 7),
(10, 'marina lima', '$2y$10$4K7ckhGovbCh.eLlMvZOq.yjZC5qVXzj8ddNWzM8LHklNo..JZ6s2', 'Lorem ipsum dolor sit amet. 33 quas quam sit veritatis alias eos facere corporis ea voluptas ipsum sit molestias dolor. Et sint impedit est voluptatem commodi qui perferendis fugit? Ab eius accusantium qui sint dolorem id voluptas quia aut autem voluptas. Qui aliquid galisum et vitae quia et omnis deserunt qui repellendus natus. </p><p>Et sint animi qui eius ullam non ratione corporis At voluptas quasi. Sit eaque deleniti aut ipsum maxime cum magni quam. Quo enim voluptas At earum dolor in praesentium necessitatibus. </p><p>Non ducimus deleniti non animi reiciendis non dolore nemo quo sunt magnam aut voluptatem tempora sit sapiente natus! Sit repudiandae ducimus qui magni enim sed quos itaque et voluptas voluptate qui pariatur nulla. Et perferendis repellendus non vitae odit quo debitis sequi? Ex veritatis nihil et dolorem repellat est vero illum? \n', 'lima@marina', '19712334512', 0, 1, 4),
(11, 'Ana Borges ', '$2y$10$siKF3bnA3v7oEWGXoaOBhu0L96AH5vWk5VilP9unYMrL7x/zr7h/y', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus.ss', 'ana@outlook.com.br', '19999098884', 0, 2, 6),
(12, 'VITOR EDUARDO DE OLIVEIRA', '$2y$10$Fo3xgBCin4WWizPBSRgfqOP4UYJ599/6ftzfH9cD9ZvL75g9bwm3m', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus.ss', 'emailparavitor@gmail.com', '19997535726', 0, 1, 4),
(13, 'Maria Vitoria Suzarth', '$2y$10$frqqeYohURQZov8HFGD9uuAkhLas.I9GXXeU7rs7vteWbUJsKAFG.', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus.ss', 'maria.suzarth@hotmail.com', '19996595529', 0, 1, 4),
(14, 'Victor Gabriel Borges Lima 5', '$2y$10$jTzssrePnoCRQQ1NwbgzHuAGZp0Qdkd9oA02Afb2mVOnRx2rb8V0O', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus.ss', 'vi@gmail.com', '19996387167', 0, 1, 4),
(15, 'Cintia', '$2y$10$vF.CosrztsBCgP1gPODiI.JBC0YZaGwiAg4EqtS5BFeQUSuJH3f0W', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus.ss', 'cintia@gmail', '12313232323', 0, 1, 1),
(16, 'Victor Gabriel Borges', '$2y$10$zg32zFmEXythkus8pokdJOGWysRtohdUInyekGkxe5IJt.86SW4Ja', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus.ss', 'vic@gmail.com', '19996387167', 0, 2, 6),
(17, 'ana lima', '$2y$10$CCsCHGeamJEYrZdVOGnuMuOHKsaygpvbBMixkgteC1NNZbsmkonIa', 'Maecenas ipsum velit, consectetuer eu, lobortis ut, dictum at, dui. In rutrum. Sed ac dolor sit amet purus malesuada congue. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Suspendisse sagittis ultrices augue. Mauris metus.ss', 'lima@gmail.com', '19998414123', 0, 2, 6),
(18, 'Ivo Onofre', '$2y$10$25PGdnXXw6xQXoBRLHMTZOtcwkIZZbhDWvqxl6v5OQj5HbN8eTbpq', 'Ivo OnofreIvo OnofreIvo OnofreIvo OnofreIvo OnofreIvo OnofreIvo OnofreIvo OnofreIvo OnofreIvo Onofre', 'onofre@gmail.com', '19998414123', 0, 2, 2),
(19, 'talita', '$2y$10$63j6U5SzjyEFLKOwq9maQ.yv6xTDFpnpXdU9FB72ba7k3V7a16rAW', 'Caso o problema persista, por favor, compartilhe mais detalhes para que eu possa ajudar a diagnosticar melhor. Caso o problema persista, por favor, compartilhe mais detalhes para que eu possa ajudar a diagnosticar melhor.', 'talita@gmail.com', '19999998884', 0, 1, 1),
(20, 'descia', '$2y$10$AAD3yQLLQIfkw/hEhDgM2.v4gLI2OgH.9ZGZ8x89lcy6u12zfRe8m', 'desciadesciadesciadesciadesciadesciadesciadesciadesciadesciadesciadesciadesciadesciadescia', 'descia@gmail.com', '19555555555', 0, 2, 5),
(21, 'lima', '$2y$10$z1s/HdmvnXpgVlL/nvbnd.bZfJQkzpqKZvvLZI1VkoBiWnk7Amzq2', 'limalimalimalimalimalimalimalimalimalimalimalimalimalimalimalimalimalimalimalimalimalima', 'correa@gmail.com', '12345647897', 0, 1, 4),
(22, 'luiza', '$2y$10$ATjYyMElI2Gyo9V3AXK4KeXpwtgNg5eghs1XjcuIN.zqGOLYFYUAO', 'luizaluizaluizaluizaluizaluizaluizaluizaluizaluizaluizaluizaluizaluizaluizaluiza', 'lu2@gmail.com', '19998414123', 0, 2, 2),
(23, 'genilda', '$2y$10$MyFT1g7PYr6rmn6kClXBuudoOCbPeIa/5XSaTcPnHAF.RrUQvCXjO', 'genildagenildagenildagenildagenildagenildagenildagenildagenildagenildagenildagenilda', 'gege@gmail.com', '12345678955', 0, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `profissoes`
--

CREATE TABLE IF NOT EXISTS `profissoes` (
  `id_profissao` int(11) NOT NULL,
  `nome_profissao` varchar(60) NOT NULL,
  `fk_departamentos_id_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `profissoes`
--

INSERT INTO `profissoes` (`id_profissao`, `nome_profissao`, `fk_departamentos_id_area`) VALUES
(1, 'Manicure', 1),
(2, 'Pedreiro', 2),
(3, 'Pintor', 2),
(4, 'Massagista', 1),
(5, 'Calheiro', 2),
(6, 'Jardineiro', 2),
(7, 'Borracheiro', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `nome_usuario` varchar(100) NOT NULL,
  `senha_usuario` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email_usuario`, `nome_usuario`, `senha_usuario`, `criado_em`, `atualizado_em`) VALUES
(2, 'juris@gmail.com', 'juris', '$2y$10$XGMFSck4UwbiIoyJgTDjgeVBSw/CKXL6Ku7DnolxqEsjQ2KQ9uDtu', '2024-11-19 17:05:35', '2024-11-19 17:05:35');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD KEY `fk_profissional_id_profissional` (`fk_profissional_id_profissional`),
  ADD KEY `fk_avaliacao_usuario` (`fk_usuario_id_usuario`);

--
-- Índices de tabela `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_area`);

--
-- Índices de tabela `fotos_perfil`
--
ALTER TABLE `fotos_perfil`
  ADD PRIMARY KEY (`id_foto_perfil`),
  ADD KEY `fk_profissional_id_profissional_idx` (`fk_profissional_id_profissional`);

--
-- Índices de tabela `fotos_profissionais`
--
ALTER TABLE `fotos_profissionais`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `fk_profissional` (`fk_profissional_id_profissional`);

--
-- Índices de tabela `profissional`
--
ALTER TABLE `profissional`
  ADD PRIMARY KEY (`id_profissional`),
  ADD KEY `FK_profissional_2` (`fk_departamentos_id_area`),
  ADD KEY `FK_profissional_3` (`fk_profissoes_id_profissao`);

--
-- Índices de tabela `profissoes`
--
ALTER TABLE `profissoes`
  ADD PRIMARY KEY (`id_profissao`),
  ADD KEY `FK_profissoes_2` (`fk_departamentos_id_area`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email_usuario` (`email_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fotos_perfil`
--
ALTER TABLE `fotos_perfil`
  MODIFY `id_foto_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `fotos_profissionais`
--
ALTER TABLE `fotos_profissionais`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `profissional`
--
ALTER TABLE `profissional`
  MODIFY `id_profissional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `profissoes`
--
ALTER TABLE `profissoes`
  MODIFY `id_profissao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`fk_profissional_id_profissional`) REFERENCES `profissional` (`id_profissional`),
  ADD CONSTRAINT `fk_avaliacao_usuario` FOREIGN KEY (`fk_usuario_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `fotos_perfil`
--
ALTER TABLE `fotos_perfil`
  ADD CONSTRAINT `fk_profissional_id_profissional` FOREIGN KEY (`fk_profissional_id_profissional`) REFERENCES `profissional` (`id_profissional`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `fotos_profissionais`
--
ALTER TABLE `fotos_profissionais`
  ADD CONSTRAINT `fk_profissional` FOREIGN KEY (`fk_profissional_id_profissional`) REFERENCES `profissional` (`id_profissional`),
  ADD CONSTRAINT `fotos_profissionais_ibfk_1` FOREIGN KEY (`fk_profissional_id_profissional`) REFERENCES `profissional` (`id_profissional`) ON DELETE CASCADE;

--
-- Restrições para tabelas `profissional`
--
ALTER TABLE `profissional`
  ADD CONSTRAINT `FK_profissional_2` FOREIGN KEY (`fk_departamentos_id_area`) REFERENCES `departamentos` (`id_area`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_profissional_3` FOREIGN KEY (`fk_profissoes_id_profissao`) REFERENCES `profissoes` (`id_profissao`) ON DELETE CASCADE;

--
-- Restrições para tabelas `profissoes`
--
ALTER TABLE `profissoes`
  ADD CONSTRAINT `FK_profissoes_2` FOREIGN KEY (`fk_departamentos_id_area`) REFERENCES `departamentos` (`id_area`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
