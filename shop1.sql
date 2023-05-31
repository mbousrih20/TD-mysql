-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 31 mai 2023 à 09:28
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shop1`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateurs`
--

DROP TABLE IF EXISTS `administrateurs`;
CREATE TABLE IF NOT EXISTS `administrateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `super_admin` tinyint(1) NOT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `administrateurs`
--

INSERT INTO `administrateurs` (`id`, `nom`, `super_admin`, `date_creation`) VALUES
(1, 'admin 1', 100, '2020-05-30 14:07:08'),
(2, 'admin 2', 75, '2023-01-30 14:07:08'),
(3, 'admin 3', 50, '2023-03-30 14:07:08');

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  'type_adresse' enum ('facturation, livraison') NOT NULL
  `pays` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `région` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `code postal` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `adresse` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ville` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `longitude` int NOT NULL,
  `latitude` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `carte_fidelite`
--

DROP TABLE IF EXISTS `carte_fidelite`;
CREATE TABLE IF NOT EXISTS `carte_fidelite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `card_number` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `points` int NOT NULL,
  `date_creation` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `carte_fidelite`
--

INSERT INTO `carte_fidelite` (`id`, `user_id`, `card_number`, `points`, `date_creation`) VALUES
(1, 1, '4000', 50, '2023-05-20'),
(2, 2, '4001', 100, '2023-05-15');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `tva` float NOT NULL,
  `created` date NOT NULL,
  `quantity` int NOT NULL,
  `status` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `user_id`, `tva`, `created`, `quantity`, `status`) VALUES
(1, 3, 20, '2020-05-13', 3, ''),
(2, 2, 10, '2023-05-29', 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `readed` tinyint(1) NOT NULL,
  `created` date NOT NULL,
  `note` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `product_id`, `user_id`, `content`, `readed`, `created`, `note`) VALUES
(3, 1, 1, 'Blabla ...', 0, '2023-05-08', 0),
(4, 1, 1, 'Test', 1, '2022-05-08', 0),
(5, 1, 1, 'Bla bla etc...', 0, '2021-05-08', 0),
(6, 1, 1, 'OK', 1, '2023-06-08', 0),
(7, 1, 1, 'Test', 1, '2021-05-09', 0),
(8, 0, 0, 'qsdqsd', 0, '0000-00-00', 0),
(9, 2, 3, 'Très satisfait de mon achat', 0, '2023-05-24', 5),
(10, 1, 1, 'article conforme à mes attentes', 0, '2023-05-30', 5);

-- --------------------------------------------------------

--
-- Structure de la table `extras`
--

DROP TABLE IF EXISTS `extras`;
CREATE TABLE IF NOT EXISTS `extras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `poid` int NOT NULL,
  `longeur` int NOT NULL,
  `largeur` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `extras`
--

INSERT INTO `extras` (`id`, `poid`, `longeur`, `largeur`, `product_id`) VALUES
(1, 20, 30, 20, 1),
(2, 15, 15, 10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `feature`
--

DROP TABLE IF EXISTS `feature`;
CREATE TABLE IF NOT EXISTS `feature` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clef` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valeur` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `feature`
--

INSERT INTO `feature` (`id`, `clef`, `valeur`) VALUES
(1, 'couleur', 'sidéral'),
(2, 'couleur', 'rose'),
(3, 'RAM', '8'),
(4, 'CPU', '8 cors');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `adresse` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`id`, `nom`, `adresse`) VALUES
(1, 'DARTY', '11 rue victor hugo'),
(2, 'Boulanger', 'place bellecour'),
(3, 'Carrefour', 'centre commercial la part dieu');

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `version` int NOT NULL,
  `date_archive` datetime NOT NULL,
  `content` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `history`
--

INSERT INTO `history` (`id`, `product_id`, `version`, `date_archive`, `content`) VALUES
(1, 1, 1, '2023-05-25 09:03:09', '{\"title\": \"Apple Mackbook Air\"}');

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

DROP TABLE IF EXISTS `langue`;
CREATE TABLE IF NOT EXISTS `langue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `langue`
--

INSERT INTO `langue` (`id`, `title`, `pays`, `product_id`) VALUES
(1, 'Producto Uno', 'es', 1);

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'NOT NULL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id`, `nom`) VALUES
(1, 'APPLE'),
(2, 'IKEA'),
(3, 'JBL');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `price`, `createdAt`, `updatedAt`) VALUES
(1, 'Apple MacBook', 'test de Produit 1', 10, '2023-05-17 14:53:57', '2023-05-17 14:53:57'),
(2, 'Apple Imac Mini', 'Desc...', 60, '2023-05-25 08:11:47', '2023-05-25 08:11:47'),
(3, 'ecouteurs JBL', 'ecouteur sans fil JBL', 50, '2023-05-29 19:22:46', '2023-05-29 19:22:46'),
(4, 'chaise bureau', 'chaise de bureau', 100, '2023-05-29 19:22:46', '2023-05-29 19:22:46'),
(5, 'airpods apple', 'airpods pro apple', 120, '2023-05-29 20:41:01', '2023-05-29 20:41:01'),
(6, 'Apple Iphone 14', 'Iphone 14 apple', 900, '2023-05-29 20:41:01', '2023-05-29 20:41:01');

-- --------------------------------------------------------

--
-- Structure de la table `product_commande`
--

DROP TABLE IF EXISTS `product_commande`;
CREATE TABLE IF NOT EXISTS `product_commande` (
  `product_id` int NOT NULL,
  `commande_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_commande`
--

INSERT INTO `product_commande` (`product_id`, `commande_id`) VALUES
(2, 0),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `product_feature`
--

DROP TABLE IF EXISTS `product_feature`;
CREATE TABLE IF NOT EXISTS `product_feature` (
  `product_id` int NOT NULL,
  `feature_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_feature`
--

INSERT INTO `product_feature` (`product_id`, `feature_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `product_fournisseur`
--

DROP TABLE IF EXISTS `product_fournisseur`;
CREATE TABLE IF NOT EXISTS `product_fournisseur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `fournisseur_id` int NOT NULL,
  `nom` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `product_fournisseur`
--

INSERT INTO `product_fournisseur` (`id`, `product_id`, `fournisseur_id`, `nom`) VALUES
(1, 1, 1, 'DARTY'),
(2, 2, 1, 'DARTY'),
(3, 5, 1, 'DARTY'),
(4, 4, 2, 'BOULANGER'),
(5, 6, 2, 'BOULANGER'),
(6, 3, 3, 'CARREFOUR');

-- --------------------------------------------------------

--
-- Structure de la table `product_marque`
--

DROP TABLE IF EXISTS `product_marque`;
CREATE TABLE IF NOT EXISTS `product_marque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'NOT NULL',
  `localisation` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'NOT NULLL',
  `marque_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `product_marque`
--

INSERT INTO `product_marque` (`id`, `title`, `localisation`, `marque_id`) VALUES
(1, 'MAC', 'LYON', 1),
(2, 'AIRPODS', 'PARIS', 1),
(3, 'IPHONE 14', 'LYON', 1),
(4, 'chaise de bureau', 'NICE', 2),
(5, 'ecouteurs', 'MARSEILLE', 3);

-- --------------------------------------------------------

--
-- Structure de la table `product_panier`
--

DROP TABLE IF EXISTS `product_panier`;
CREATE TABLE IF NOT EXISTS `product_panier` (
  `panier_id` int NOT NULL,
  `product_id` int NOT NULL,
  `promotion_id` int DEFAULT NULL,
  `created` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_promotion`
--

DROP TABLE IF EXISTS `product_promotion`;
CREATE TABLE IF NOT EXISTS `product_promotion` (
  `product_id` int NOT NULL,
  `promotion_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `product_id` (`product_id`),
  KEY `promotion_id` (`promotion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_promotion`
--

INSERT INTO `product_promotion` (`product_id`, `promotion_id`, `created`) VALUES
(1, 1, '2023-05-16 10:15:19'),
(1, 2, '2023-05-16 10:15:30'),
(1, 3, '2023-05-16 10:15:34'),
(1, 4, '2023-05-16 10:15:39'),
(1, 1, '2023-05-29 22:48:27'),
(2, 1, '2023-05-29 22:48:27'),
(5, 1, '2023-05-29 22:48:27'),
(6, 1, '2023-05-29 22:48:27');

-- --------------------------------------------------------

--
-- Structure de la table `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE IF NOT EXISTS `product_tag` (
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taux` float NOT NULL,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`id`, `taux`, `title`, `enabled`) VALUES
(1, 20, 'Promotion été', 1),
(2, 10, 'Promotion hiver', 1),
(3, 15, 'Promotion printemps', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `tags`
--

INSERT INTO `tags` (`id`, `tag`) VALUES
(1, 'ordi'),
(2, 'SIRI'),
(3, 'AAAA10'),
(4, 'zzz20');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `age`, `email`, `longitude`, `latitude`, `date_updated`) VALUES
(1, 'test', 'françois', 35, 'françois2023@gmail.com', 0, 0, '0000-00-00 00:00:00'),
(2, 'Test', 'younous', 21, 'younous@gmail.com', 4.91285, 45.7047, '0000-00-00 00:00:00'),
(3, '', 'Mohamed', 20, 'mohamed20@gmail.com', 5.36995, 43.2962, '0000-00-00 00:00:00');

--
-- Déclencheurs `user`
--
DROP TRIGGER IF EXISTS `update_user`;
DELIMITER $$
CREATE TRIGGER `update_user` AFTER UPDATE ON `user` FOR EACH ROW UPDATE `user` SET `date_updated` = NOW()
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
