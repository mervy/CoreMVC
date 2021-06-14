
--
-- Banco de dados: `coremvc_1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `status` char(3) NOT NULL DEFAULT 'not' COMMENT 'yes or not',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `authors_id` int NOT NULL,
  `categories_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_articles_authors_idx` (`authors_id`),
  KEY `fk_articles_categories1_idx` (`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Estrutura da tabela `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(60) NOT NULL,
  `status` char(3) NOT NULL DEFAULT 'yes' COMMENT 'yes or not',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `authors`
-- Password: 12345

INSERT INTO `authors` (`id`, `nickname`, `name`, `email`, `password`, `status`) VALUES
(1, 'admin', 'Administrador', 'admin@admin.com', '$2y$10$GgJCickfqNzbnuZS4sfPO.BUry85IRRm1BI/vWMD6o9wJK0glOvqm', 'yes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `description` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `registered_in` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `visitors`
--

DROP TABLE IF EXISTS `visitors`;
CREATE TABLE IF NOT EXISTS `visitors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `articles_id` int NOT NULL,
  `ip` varchar(20) NOT NULL,
  `acessed_in` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_visitors_articles_id` (`articles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `fk_articles_authors` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `fk_articles_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);

--
-- Limitadores para a tabela `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `fk_visitors_articles` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;