-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mer. 17 mai 2023 à 12:15
-- Version du serveur : 8.0.33
-- Version de PHP : 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Binomotron`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `id_étudiants` int NOT NULL,
  `prenom` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nom` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adresse_mail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`id_étudiants`, `prenom`, `nom`, `adresse_mail`) VALUES
(1, 'Morgan', 'COULM', 'morgan.coulm@isen-ouest.yncrea.fr'),
(2, 'Camille', 'ULVOAS', 'camille.ulvoas@isen-ouest.yncrea.fr'),
(3, 'Yves', 'PAUL', 'yves.paul@isen-ouest.yncrea.fr'),
(4, 'Laura', 'PERTRON', 'laura.pertron@isen-ouest.yncrea.fr'),
(5, 'Frédéric', 'BOIREAU', 'frederic.boireau@isen-ouest.yncrea.fr'),
(6, 'Guillaume', 'CARDON', 'guillaume.cardon@isen-ouest.yncrea.fr'),
(7, 'Jonathan', 'NEEDHAM', 'jonathan.needham@isen-ouest.yncrea.fr'),
(8, 'Jérémy', 'LARDIC', 'jeremy.lardic@isen-ouest.yncrea.fr'),
(9, 'Mickaël', 'RENNARD', 'mickael.rennard@isen-ouest.yncrea.fr'),
(10, 'Ibrahim', 'MOHAMMAD', 'ibrahim.mohammad@isen-ouest.yncrea.fr'),
(11, 'Andy', 'DUBIGNY', 'andy.dubigny@isen-ouest.yncrea.fr'),
(12, 'Pierre-Marie', 'GUEVEL', 'pierre-marie.guevel@isen-ouest.yncrea.fr'),
(13, 'Youenn', 'FEULVARC’H', 'youenn.feulvarc-h@isen-ouest.yncrea.fr'),
(14, 'Gwendal', 'QUENET', 'gwendal.quenet@isen-ouest.yncrea.fr'),
(15, 'Alexandre', 'CARAES', 'alexandre.caraes@isen-ouest.yncrea.fr'),
(16, 'Bastien', 'SUCHY-REINARD', 'bastien.suchy-reinard@isen-ouest.yncrea.fr');

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

CREATE TABLE `groupes` (
  `id-groupes` int NOT NULL,
  `Libellé du groupe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `id_ensemble`
--

CREATE TABLE `id_ensemble` (
  `id_étudiants` int NOT NULL,
  `id_projet` int NOT NULL,
  `id_groupe` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

CREATE TABLE `projets` (
  `id_projet` int NOT NULL,
  `libelle_du_projet` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_de _debut` date NOT NULL,
  `date de fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id_étudiants`);

--
-- Index pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`id-groupes`);

--
-- Index pour la table `id_ensemble`
--
ALTER TABLE `id_ensemble`
  ADD KEY `id_ensemble_ibfk_1` (`id_groupe`),
  ADD KEY `id_projet` (`id_projet`),
  ADD KEY `id_étudiants` (`id_étudiants`);

--
-- Index pour la table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`id_projet`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `id_ensemble`
--
ALTER TABLE `id_ensemble`
  ADD CONSTRAINT `id_ensemble_ibfk_1` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id-groupes`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_ensemble_ibfk_3` FOREIGN KEY (`id_projet`) REFERENCES `projets` (`id_projet`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_ensemble_ibfk_4` FOREIGN KEY (`id_étudiants`) REFERENCES `etudiants` (`id_étudiants`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
