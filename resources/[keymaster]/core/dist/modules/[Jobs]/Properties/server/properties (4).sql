-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 07 mai 2025 à 13:38
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `neva-base`
--

-- --------------------------------------------------------

--
-- Structure de la table `properties`
--

CREATE TABLE `properties` (
  `propertiesID` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `propertiesOWNER` longtext DEFAULT NULL,
  `ownerName` longtext DEFAULT NULL,
  `enter` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `garage` tinyint(1) UNSIGNED ZEROFILL DEFAULT 0,
  `garagePos` varchar(255) DEFAULT NULL,
  `garageSpawn` varchar(255) DEFAULT NULL,
  `garageRotation` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `garageType` longtext DEFAULT NULL,
  `players` longtext DEFAULT '{}',
  `type` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `trunkPos` varchar(255) DEFAULT NULL,
  `logementType` longtext DEFAULT NULL,
  `time` int(11) UNSIGNED ZEROFILL DEFAULT NULL,
  `street` longtext DEFAULT NULL,
  `entrepot` tinyint(4) DEFAULT NULL,
  `pound` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `properties`
--

INSERT INTO `properties` (`propertiesID`, `name`, `label`, `propertiesOWNER`, `ownerName`, `enter`, `exit`, `garage`, `garagePos`, `garageSpawn`, `garageRotation`, `price`, `garageType`, `players`, `type`, `trunk`, `trunkPos`, `logementType`, `time`, `street`, `entrepot`, `pound`) VALUES
(1, 'test2', 'Test 2', '2', NULL, '{\"x\":856.6099853515625,\"y\":-2042.8607177734376,\"z\":48.08122634887695}', '{\"x\":151.45628356933595,\"y\":-1007.577880859375,\"z\":-99.00504302978516}', 1, '{\"x\":860.120849609375,\"y\":-2047.6768798828126,\"z\":47.36997604370117}', '{\"x\":860.5372314453125,\"y\":-2047.779052734375,\"z\":47.31781005859375}', '267.6719970703125', 2000, 'garage12', '{\"2\":true}', 'location', NULL, '{\"x\":152.1093292236328,\"y\":-1000.18798828125,\"z\":-98.99996185302735}', 'Motel', NULL, 'Cypress Flats', 0, 0),
(2, 'test3', 'Test 3', '2', NULL, '{\"x\":24.19142341613769,\"y\":-1113.100830078125,\"z\":29.27035903930664}', '{\"x\":265.3023376464844,\"y\":-1002.802001953125,\"z\":-99.01371002197266}', 1, '{\"x\":31.97971153259277,\"y\":-1108.1466064453126,\"z\":29.30498695373535}', '{\"x\":32.55476379394531,\"y\":-1108.1278076171876,\"z\":29.29761886596679}', '270.8528137207031', 2100, 'garage12', '{\"2\":true}', 'location', NULL, '{\"x\":263.5093078613281,\"y\":-995.48046875,\"z\":-99.00865936279297}', 'Petit appartement', NULL, 'Pillbox Hill', 0, 0),
(3, 'Test3', 'Test 3', 'none', NULL, '{\"x\":27.26651382446289,\"y\":-1106.822998046875,\"z\":29.53474235534668}', '{\"x\":151.44969177246095,\"y\":-1007.5751342773438,\"z\":-99.13572692871094}', 0, '\"none\"', '\"none\"', 'none', 2000, 'none', '[]', 'location', NULL, '{\"x\":151.29344177246095,\"y\":-1004.6681518554688,\"z\":-99.0000228881836}', 'Motel', NULL, 'Pillbox Hill', 0, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`propertiesID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `properties`
--
ALTER TABLE `properties`
  MODIFY `propertiesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
