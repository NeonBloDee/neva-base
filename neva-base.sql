-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 16 mai 2025 à 11:12
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
-- Structure de la table `0r_clothing_image_data`
--

CREATE TABLE `0r_clothing_image_data` (
  `id` int(11) NOT NULL,
  `data` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `0r_clothing_tattoos`
--

CREATE TABLE `0r_clothing_tattoos` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin_jails`
--

CREATE TABLE `admin_jails` (
  `UniqueID` int(11) NOT NULL,
  `time` longtext DEFAULT NULL,
  `staff` longtext DEFAULT NULL,
  `reason` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ad_admin`
--

CREATE TABLE `ad_admin` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `ad_banlist`
--

CREATE TABLE `ad_banlist` (
  `id` int(11) NOT NULL,
  `STEAM` longtext NOT NULL,
  `DISCORD` longtext NOT NULL,
  `LICENSE` longtext NOT NULL,
  `LIVE` longtext NOT NULL,
  `XBL` longtext NOT NULL,
  `IP` longtext NOT NULL,
  `TOKENS` longtext NOT NULL,
  `BANID` longtext NOT NULL,
  `REASON` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `ad_unban`
--

CREATE TABLE `ad_unban` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `ad_whitelist`
--

CREATE TABLE `ad_whitelist` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `aircraft_categorie`
--

CREATE TABLE `aircraft_categorie` (
  `name` text NOT NULL,
  `label` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aircraft_categorie`
--

INSERT INTO `aircraft_categorie` (`name`, `label`) VALUES
('aircraft', 'Antenne'),
('aircraft', 'Antenne');

-- --------------------------------------------------------

--
-- Structure de la table `animals_perm`
--

CREATE TABLE `animals_perm` (
  `idunique` int(11) NOT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `owner_identifier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appel_jobs`
--

CREATE TABLE `appel_jobs` (
  `id` int(11) NOT NULL,
  `raison` text NOT NULL,
  `pos` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `appel_jobs`
--

INSERT INTO `appel_jobs` (`id`, `raison`, `pos`, `job`, `plate`) VALUES
(1, 'Drogenverkauf', '{\"x\":-219.93475341796876,\"y\":6347.3173828125,\"z\":31.89797973632812}', 'saspn', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `bcso_plainte`
--

CREATE TABLE `bcso_plainte` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `date` text DEFAULT NULL,
  `numberphone` text DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `author` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `billing`
--

INSERT INTO `billing` (`id`, `identifier`, `sender`, `target_type`, `target`, `label`, `amount`) VALUES

-- --------------------------------------------------------

--
-- Structure de la table `blanchiment`
--

CREATE TABLE `blanchiment` (
  `id` int(11) NOT NULL,
  `owner` int(11) DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `pos` varchar(255) DEFAULT NULL,
  `percent` longtext DEFAULT '0',
  `time` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `blanchiment`
--

INSERT INTO `blanchiment` (`id`, `owner`, `name`, `label`, `pos`, `percent`, `time`) VALUES
(43, 0, 'blachiment1', 'Blachiment', '{\"x\":347.46478271484377,\"y\":-1255.8421630859376,\"z\":32.45035171508789}', '0', 0),
(44, 0, 'blachiment2', 'Blachiment', '{\"x\":-1704.3978271484376,\"y\":-441.2682189941406,\"z\":41.67023849487305}', '0.09999999999999432', 0);

-- --------------------------------------------------------

--
-- Structure de la table `boat_categories`
--

CREATE TABLE `boat_categories` (
  `name` varchar(50) NOT NULL DEFAULT 'none',
  `label` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boat_categories`
--

INSERT INTO `boat_categories` (`name`, `label`) VALUES
('boat', 'Boot');

-- --------------------------------------------------------

--
-- Structure de la table `boost_farm`
--

CREATE TABLE `boost_farm` (
  `UniqueID` int(11) NOT NULL,
  `boost` longtext NOT NULL,
  `time` longtext NOT NULL,
  `multiplication` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boutique`
--

CREATE TABLE `boutique` (
  `citizenID` varchar(255) NOT NULL,
  `boutique_code` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boutique`
--

INSERT INTO `boutique` (`citizenID`, `boutique_code`, `points`) VALUES
('license:99572c46c4419a0f597d110a31640f1a3ff1655e', 1, 20000);

-- --------------------------------------------------------

--
-- Structure de la table `boutique_gains`
--

CREATE TABLE `boutique_gains` (
  `id` int(11) NOT NULL,
  `citizenId` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boutique_history`
--

CREATE TABLE `boutique_history` (
  `uniqueid` int(11) DEFAULT NULL,
  `data` longtext NOT NULL DEFAULT 'Indéfini',
  `lot` longtext NOT NULL DEFAULT 'Indéfini',
  `reward_type` varchar(20) NOT NULL DEFAULT 'purchase'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boutique_history`
--

INSERT INTO `boutique_history` (`uniqueid`, `data`, `lot`, `reward_type`) VALUES
(1, 'hat die l\'Waffe g17gen5', 'g17gen5', 'gekauft'),
(1, 'hat die l\'Waffe g17gen5', 'g17gen5', 'gekauft');

-- --------------------------------------------------------

--
-- Structure de la table `boutique_reward`
--

CREATE TABLE `boutique_reward` (
  `UniqueID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boutique_reward`
--

INSERT INTO `boutique_reward` (`UniqueID`) VALUES
(1),
(7),
(11),
(12);

-- --------------------------------------------------------

--
-- Structure de la table `calendar`
--

CREATE TABLE `calendar` (
  `identifier` varchar(60) NOT NULL,
  `days` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chasse`
--

CREATE TABLE `chasse` (
  `uniqueid` int(11) DEFAULT NULL,
  `levels` int(11) DEFAULT 0,
  `animals` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chasse`
--

INSERT INTO `chasse` (`uniqueid`, `levels`, `animals`) VALUES
(215, 20, '[\"Kaninchen\"]'),
(237, 0, '[\"Kaninchen\"]'),
(343, 0, '[\"Kaninchen\"]'),
(3, -50, '[\"Kaninchen\"]'),
(376, 30, '[\"Kaninchen\"]'),
(566, 380, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\"]'),
(559, 0, '[\"Kaninchen\"]'),
(257, 80, '[\"Kaninchen\"]'),
(617, 130, '[\"Reh\",\"Kaninchen\"]'),
(505, 40, '[\"Kaninchen\"]'),
(643, 150, '[\"Reh\",\"Kaninchen\"]'),
(310, 550, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(551, -10, '[\"Kaninchen\"]'),
(808, 560, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(207, -60, '[\"Kaninchen\"]'),
(850, 520, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(811, 80, '[\"Reh\",\"Kaninchen\"]'),
(571, -50, '[\"Kaninchen\"]'),
(412, 50, '[\"Kaninchen\"]'),
(512, 520, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(276, 170, '[\"Reh\",\"Kaninchen\"]'),
(553, 900, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Wildschwein\"]'),
(378, 60, '[\"Kaninchen\"]'),
(935, 30, '[\"Kaninchen\"]'),
(409, 780, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Wildschwein\"]'),
(928, 710, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Wildschwein\"]'),
(199, 240, '[\"Reh\",\"Kaninchen\",\"Jaguar\"]'),
(219, 50, '[\"Kaninchen\"]'),
(170, 30, '[\"Kaninchen\"]'),
(1104, 0, '[\"Kaninchen\"]'),
(1101, 20, '[\"Kaninchen\"]'),
(579, 20, '[\"Kaninchen\"]'),
(222, 150, '[\"Reh\",\"Kaninchen\"]'),
(1108, 500, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(1047, 610, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(484, 380, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\"]'),
(1172, 20, '[\"Kaninchen\"]'),
(515, 170, '[\"Reh\",\"Kaninchen\"]'),
(1032, 270, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\"]'),
(1197, -30, '[\"Kaninchen\"]'),
(1248, 310, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\"]'),
(585, 130, '[\"Reh\",\"Kaninchen\"]'),
(537, 0, '[\"Kaninchen\"]'),
(1271, 660, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(1275, 0, '[\"Kaninchen\"]'),
(221, 30, '[\"Kaninchen\"]'),
(1256, 30, '[\"Kaninchen\"]'),
(1222, 0, '[\"Kaninchen\"]'),
(632, 390, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(330, 10, '[\"Kaninchen\"]'),
(583, 0, '[\"Kaninchen\"]'),
(225, 60, '[\"Kaninchen\"]'),
(1417, 160, '[\"Reh\",\"Kaninchen\"]'),
(1459, 590, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(173, 20, '[\"Kaninchen\"]'),
(1326, 540, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(1334, 590, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(1490, -10, '[\"Kaninchen\"]'),
(1339, 520, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(1236, 10, '[\"Kaninchen\"]'),
(1440, 120, '[\"Reh\",\"Kaninchen\"]'),
(4, -50, '[\"Kaninchen\"]'),
(1498, 630, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(1364, 100, '[\"Reh\",\"Kaninchen\"]'),
(806, 0, '[\"Kaninchen\"]'),
(722, 360, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\"]'),
(1583, 480, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\",\"Hirsch\"]'),
(322, 70, '[\"Kaninchen\"]'),
(1622, 20, '[\"Kaninchen\"]'),
(1611, 0, '[\"Kaninchen\"]'),
(1628, 0, '[\"Kaninchen\"]'),
(1630, 300, '[\"Reh\",\"Kaninchen\",\"Jaguar\",\"Wolf\"]'),
(201, 0, '[\"Kaninchen\"]'),
(1687, 30, '[\"Kaninchen\"]'),
(1761, 20, '[\"Kaninchen\"]'),
(544, 100, '[\"Reh\",\"Kaninchen\"]'),
(1839, 140, '[\"Reh\",\"Kaninchen\"]'),
(166, -50, '[\"Kaninchen\"]'),
(1, 0, '[\"Kaninchen\"]'),
(2, -50, '[\"Kaninchen\"]');

-- --------------------------------------------------------

--
-- Structure de la table `clothes_inventory`
--

CREATE TABLE `clothes_inventory` (
  `UniqueID` int(11) NOT NULL,
  `clothes` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clothes_inventory`
--

INSERT INTO `clothes_inventory` (`UniqueID`, `clothes`) VALUES
(1, '[{\"number2\":3,\"informations\":false,\"name\":\"Chic White\",\"itemType\":\"shoes\",\"itemName\":\"shoes_1\",\"label\":\"Chic White\",\"image\":\"/src/html/assets/icons/shoes.png\",\"number\":93,\"informationsText\":\"Indéfini\",\"count\":1,\"usable\":true,\"type\":\"item_clothes\"},{\"number2\":8,\"informations\":false,\"name\":\"Chic White\",\"itemType\":\"pants\",\"itemName\":\"pants_1\",\"label\":\"Chic White\",\"image\":\"/src/html/assets/icons/pants.png\",\"number\":92,\"informationsText\":\"Indéfini\",\"count\":1,\"usable\":true,\"type\":\"item_clothes\"}]'),
(4, '[{\"usable\":true,\"label\":\"test\",\"number2\":0,\"informations\":false,\"itemName\":\"bproof_1\",\"number\":0,\"count\":1,\"name\":\"test\",\"informationsText\":\"Indéfini\",\"itemType\":\"bproof\",\"image\":\"/src/html/assets/icons/bproof.png\",\"type\":\"item_clothes\"},{\"usable\":true,\"label\":\"test\",\"number2\":0,\"informations\":false,\"image\":\"/src/html/assets/icons/shoes.png\",\"number\":30,\"count\":1,\"name\":\"test\",\"itemName\":\"shoes_1\",\"informationsText\":\"Indéfini\",\"itemType\":\"shoes\",\"type\":\"item_clothes\"},{\"usable\":true,\"label\":\"SACSKATE\",\"number2\":0,\"informations\":false,\"itemName\":\"bags_1\",\"number\":125,\"count\":1,\"name\":\"SACSKATE\",\"informationsText\":\"Indéfini\",\"itemType\":\"bags\",\"image\":\"/src/html/assets/icons/bags.png\",\"type\":\"item_clothes\"},{\"usable\":true,\"label\":\"lunette\",\"number2\":3,\"informations\":false,\"image\":\"/src/html/assets/icons/glasses.png\",\"number\":33,\"count\":1,\"name\":\"lunette\",\"itemName\":\"glasses_1\",\"informationsText\":\"Indéfini\",\"itemType\":\"glasses\",\"type\":\"item_clothes\"},{\"usable\":true,\"label\":\"test\",\"number2\":0,\"informations\":false,\"image\":\"/src/html/assets/icons/torso.png\",\"number\":693,\"count\":1,\"name\":\"test\",\"informationsText\":\"Indéfini\",\"itemType\":\"torso\",\"itemName\":\"torso_1\",\"type\":\"item_clothes\"},{\"usable\":true,\"label\":\"test\",\"number2\":3,\"informations\":false,\"itemName\":\"pants_1\",\"number\":86,\"count\":1,\"name\":\"test\",\"informationsText\":\"Indéfini\",\"itemType\":\"pants\",\"image\":\"/src/html/assets/icons/pants.png\",\"type\":\"item_clothes\"}]'),
(5, '[]'),
(6, '[{\"usable\":true,\"label\":\"33\\n\",\"number2\":0,\"informations\":false,\"itemName\":\"glasses_1\",\"informationsText\":\"Indéfini\",\"count\":1,\"image\":\"/src/html/assets/icons/glasses.png\",\"itemType\":\"glasses\",\"name\":\"33\\n\",\"number\":21,\"type\":\"item_clothes\"}]'),
(7, '[]'),
(8, '[]'),
(9, '[]'),
(10, '[]'),
(11, '[]'),
(13, '[]'),
(53, '[{\"type\":\"item_clothes\",\"name\":\"Chic Noir\",\"usable\":true,\"image\":\"/src/html/assets/icons/torso.png\",\"label\":\"Chic Noir\",\"number\":654,\"itemType\":\"torso\",\"informations\":false,\"itemName\":\"torso_1\",\"count\":1,\"number2\":3,\"informationsText\":\"Indéfini\"},{\"type\":\"item_clothes\",\"name\":\"Chic Noir\",\"usable\":true,\"image\":\"/src/html/assets/icons/pants.png\",\"informationsText\":\"Indéfini\",\"number\":92,\"itemType\":\"pants\",\"informations\":false,\"itemName\":\"pants_1\",\"count\":1,\"number2\":0,\"label\":\"Chic Noir\"},{\"type\":\"item_clothes\",\"name\":\"Chic Noir\",\"usable\":true,\"image\":\"/src/html/assets/icons/bproof.png\",\"label\":\"Chic Noir\",\"number\":0,\"itemType\":\"bproof\",\"informations\":false,\"itemName\":\"bproof_1\",\"count\":1,\"number2\":0,\"informationsText\":\"Indéfini\"},{\"type\":\"item_clothes\",\"name\":\"Chic Noir\",\"usable\":true,\"image\":\"/src/html/assets/icons/shoes.png\",\"informationsText\":\"Indéfini\",\"number\":10,\"itemType\":\"shoes\",\"informations\":false,\"itemName\":\"shoes_1\",\"count\":1,\"number2\":0,\"label\":\"Chic Noir\"},{\"type\":\"item_clothes\",\"name\":\"Lunette noir\",\"usable\":true,\"image\":\"/src/html/assets/icons/glasses.png\",\"informationsText\":\"Indéfini\",\"number\":16,\"itemType\":\"glasses\",\"informations\":false,\"itemName\":\"glasses_1\",\"count\":1,\"number2\":5,\"label\":\"Lunette noir\"}]'),
(54, '[]'),
(55, '[]'),
(56, '[{\"type\":\"item_clothes\",\"count\":1,\"name\":\"dead\",\"itemName\":\"pants_1\",\"itemType\":\"pants\",\"informationsText\":\"Indéfini\",\"number2\":1,\"label\":\"dead\",\"usable\":true,\"image\":\"/src/html/assets/icons/pants.png\",\"informations\":false,\"number\":248},{\"type\":\"item_clothes\",\"label\":\"dead\",\"name\":\"dead\",\"itemName\":\"torso_1\",\"itemType\":\"torso\",\"informationsText\":\"Indéfini\",\"informations\":false,\"number2\":0,\"usable\":true,\"image\":\"/src/html/assets/icons/torso.png\",\"count\":1,\"number\":155},{\"label\":\"dead\",\"count\":1,\"informationsText\":\"Indéfini\",\"itemName\":\"bproof_1\",\"itemType\":\"bproof\",\"name\":\"dead\",\"informations\":false,\"number2\":2,\"usable\":true,\"image\":\"/src/html/assets/icons/bproof.png\",\"type\":\"item_clothes\",\"number\":176}]'),
(57, '[{\"label\":\"oui\\n\",\"number2\":4,\"number\":30,\"itemName\":\"pants_1\",\"count\":1,\"image\":\"/src/html/assets/icons/pants.png\",\"usable\":true,\"type\":\"item_clothes\",\"itemType\":\"pants\",\"informationsText\":\"Indéfini\",\"informations\":false,\"name\":\"oui\\n\"},{\"label\":\"oui\\n\",\"number2\":6,\"number\":79,\"itemName\":\"torso_1\",\"count\":1,\"image\":\"/src/html/assets/icons/torso.png\",\"itemType\":\"torso\",\"type\":\"item_clothes\",\"informationsText\":\"Indéfini\",\"usable\":true,\"informations\":false,\"name\":\"oui\\n\"},{\"label\":\"flor\",\"number2\":0,\"number\":23,\"itemName\":\"helmet_1\",\"count\":1,\"usable\":true,\"itemType\":\"helmet\",\"type\":\"item_clothes\",\"informationsText\":\"Indéfini\",\"image\":\"/src/html/assets/icons/helmet.png\",\"informations\":false,\"name\":\"flor\"}]'),
(58, '[{\"itemName\":\"bags_1\",\"count\":1,\"informationsText\":\"Indéfini\",\"number2\":0,\"image\":\"/src/html/assets/icons/bags.png\",\"itemType\":\"bags\",\"number\":112,\"type\":\"item_clothes\",\"informations\":false,\"usable\":true}]'),
(59, '[]'),
(61, '[]'),
(62, '[]'),
(63, '[]');

-- --------------------------------------------------------

--
-- Structure de la table `darkchat_messages`
--

CREATE TABLE `darkchat_messages` (
  `id` int(11) NOT NULL,
  `password` text NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detention_records`
--

CREATE TABLE `detention_records` (
  `id` int(11) NOT NULL,
  `target_id` varchar(50) DEFAULT NULL,
  `officer_name` varchar(100) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `prison_name` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `release_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dpkeybinds`
--

CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


-- --------------------------------------------------------

--
-- Structure de la table `drugs_circuits`
--

CREATE TABLE `drugs_circuits` (
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `recolte` longtext DEFAULT NULL,
  `traitement` longtext DEFAULT NULL,
  `animtype` longtext DEFAULT NULL,
  `animdict` longtext DEFAULT NULL,
  `anim` longtext DEFAULT NULL,
  `animtime` int(11) DEFAULT NULL,
  `marker` tinyint(1) DEFAULT 0,
  `props` longtext DEFAULT NULL,
  `name_pooch` longtext DEFAULT NULL,
  `label_pooch` longtext DEFAULT NULL,
  `animtype_t` longtext DEFAULT NULL,
  `animdict_t` longtext DEFAULT NULL,
  `anim_t` longtext DEFAULT NULL,
  `animtime_t` int(11) DEFAULT NULL,
  `marker_t` tinyint(1) DEFAULT 0,
  `props_t` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `drugs_circuits`
--

INSERT INTO `drugs_circuits` (`name`, `label`, `recolte`, `traitement`, `animtype`, `animdict`, `anim`, `animtime`, `marker`, `props`, `name_pooch`, `label_pooch`, `animtype_t`, `animdict_t`, `anim_t`, `animtime_t`, `marker_t`, `props_t`) VALUES
('mdma', 'MDMA', '[{\"x\":2482.186279296875,\"y\":3722.605224609375,\"z\":43.92522430419922}]', '[{\"x\":106.07408905029297,\"y\":6903.52880859375,\"z\":19.48505401611328}]', 'anim', 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 5, 1, 'none', 'mdma_pochon', 'MDMA-Tütchen', 'anim', 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 5, 1, 'none');

-- --------------------------------------------------------

--
-- Structure de la table `drugs_sell`
--

CREATE TABLE `drugs_sell` (
  `id` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ediscordboost`
--

CREATE TABLE `ediscordboost` (
  `identifier` varchar(50) DEFAULT '255',
  `time` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Missbräuchliche Nutzung der Hupe', 300, 0),
(2, 'Überfahren einer durchgezogenen Linie', 400, 0),
(3, 'Fahren in falscher Richtung', 2500, 0),
(4, 'Unerlaubtes Wenden', 2500, 0),
(5, 'Fahren abseits der Straße', 1700, 0),
(6, 'Nicht-Einhalten des Sicherheitsabstands', 300, 0),
(7, 'Gefährliches / Verbotenes Anhalten', 1500, 0),
(8, 'Behinderndes / Verbotenes Parken', 700, 0),
(9, 'Vorfahrt von rechts missachtet', 700, 0),
(10, 'Einsatzfahrzeug nicht beachtet', 900, 0),
(11, 'Stoppschild missachtet', 1050, 0),
(12, 'Rote Ampel missachtet', 1300, 0),
(13, 'Gefährliches Überholen', 1000, 0),
(14, 'Fahrzeug nicht verkehrstauglich', 1000, 0),
(15, 'Fahren ohne Führerschein', 15000, 0),
(16, 'Fahrerflucht', 8000, 0),
(17, 'Geschwindigkeitsüberschreitung < 5 km/h', 900, 0),
(18, 'Geschwindigkeitsüberschreitung 5–15 km/h', 1200, 0),
(19, 'Geschwindigkeitsüberschreitung 15–30 km/h', 1800, 0),
(20, 'Geschwindigkeitsüberschreitung > 30 km/h', 3000, 0),
(21, 'Behinderung des Straßenverkehrs', 1100, 1),
(22, 'Beschädigung öffentlichen Eigentums', 900, 1),
(23, 'Störung der öffentlichen Ordnung', 900, 1),
(24, 'Behinderung eines Polizeieinsatzes', 1300, 1),
(25, 'Beleidigung gegen/zischen Zivilisten', 750, 1),
(26, 'Beamtenbeleidigung', 110, 1),
(27, 'Verbale Bedrohung/Belästigung gegen Zivilisten', 90, 1),
(28, 'Verbale Bedrohung/Belästigung gegen Polizei', 150, 1),
(29, 'Unerlaubte Demonstration', 250, 1),
(30, 'Bestechungsversuch', 1500, 1),
(31, 'Tragen einer Stichwaffe in der Stadt', 120, 2),
(32, 'Tragen einer Schusswaffe in der Stadt', 300, 2),
(33, 'Unerlaubter Waffenbesitz (ohne Lizenz)', 600, 2),
(34, 'Illegaler Waffenbesitz', 700, 2),
(35, 'Mit Lockpick erwischt', 300, 2),
(36, 'Autodiebstahl', 1800, 2),
(37, 'Drogenverkauf', 1500, 2),
(38, 'Drogenherstellung', 1500, 2),
(39, 'Drogenbesitz', 650, 2),
(40, 'Geiselnahme eines Zivilisten', 1500, 2),
(41, 'Geiselnahme eines Staatsbeamten', 2000, 2),
(42, 'Raubüberfall auf Zivilisten', 650, 2),
(43, 'Raubüberfall auf Geschäft', 650, 2),
(44, 'Banküberfall', 1500, 2),
(45, 'Schuss auf Zivilisten', 2000, 3),
(46, 'Schuss auf Staatsbeamten', 2500, 3),
(47, 'Mordversuch an Zivilisten', 3000, 3),
(48, 'Mordversuch an Staatsbeamten', 5000, 3),
(49, 'Mord an Zivilisten', 10000, 3),
(50, 'Mord an Staatsbeamten', 30000, 3),
(51, 'Fahrlässige Tötung', 1800, 3),
(52, 'Betrug gegenüber Unternehmen', 2000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `fishing`
--

CREATE TABLE `fishing` (
  `UniqueID` int(11) DEFAULT NULL,
  `level` longtext DEFAULT 0,
  `fishList` longtext DEFAULT NULL,
  `permit` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gangs_new`
--

CREATE TABLE `gangs_new` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `positions` longtext DEFAULT NULL,
  `permissions` longtext DEFAULT NULL,
  `circuit` longtext DEFAULT NULL,
  `chest` longtext DEFAULT NULL,
  `cat` longtext DEFAULT NULL,
  `blips` tinyint(1) DEFAULT NULL,
  `blipscolor` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gangs_new`
--

INSERT INTO `gangs_new` (`id`, `name`, `label`, `positions`, `permissions`, `circuit`, `chest`, `cat`, `blips`, `blipscolor`) VALUES
(12, 'Sinaloa', 'Sinaloa Kartell', '{\"boss\":{\"x\":-3336.09130859375,\"y\":540.81591796875,\"z\":17.44402503967285},\"chest\":{\"x\":-3337.791748046875,\"y\":543.443115234375,\"z\":17.44402503967285}}', '{\"accounts_add\":{\"Plaza Boss\":true,\"Halcón\":true,\"Jefe Operaciones\":true,\"Sous Chef\":true,\"Cocinero\":true},\"items_remove\":{\"Jefe Operaciones\":true,\"Sous Chef\":true,\"Plaza Boss\":true},\"*\":{\"boss\":true,\"Sous Chef\":false,\"Halcón\":false,\"Jefe Operaciones\":true},\"recruit_remove_player\":{\"Sous Chef\":true,\"Jefe Operaciones\":true},\"accounts_remove\":{\"Sous Chef\":true,\"Jefe Operaciones\":true},\"change_group_player\":{\"Sous Chef\":true,\"Jefe Operaciones\":true},\"manage_members\":{\"Sous Chef\":true,\"Jefe Operaciones\":true},\"weapons_remove\":{\"Jefe Operaciones\":true,\"Sous Chef\":true,\"Plaza Boss\":true},\"items_add\":{\"Plaza Boss\":true,\"Halcón\":true,\"Jefe Operaciones\":true,\"Sous Chef\":true,\"Cocinero\":true},\"weapons_add\":{\"Plaza Boss\":true,\"Halcón\":true,\"Jefe Operaciones\":true,\"Sous Chef\":true,\"Cocinero\":true},\"weapons\":{\"Plaza Boss\":true,\"Sous Chef\":true,\"Jefe Operaciones\":true,\"Cocinero\":true},\"items\":{\"Plaza Boss\":true,\"Sous Chef\":true,\"Jefe Operaciones\":true,\"Cocinero\":true},\"accounts\":{\"Plaza Boss\":false,\"Sous Chef\":true,\"Jefe Operaciones\":true,\"Cocinero\":false},\"create_edit_grades\":{\"Sous Chef\":true,\"Jefe Operaciones\":true}}', '0', '{\"weapons\":[{\"name\":\"WEAPON_SWITCHBLADE\",\"count\":255,\"label\":\"Couteau à cran d\'arrêt\"}],\"accounts\":{\"black_money\":3604727,\"cash\":350000},\"items\":[{\"name\":\"hydrochloric_acid\",\"count\":132,\"label\":\"Acide chlorhydrique\"},{\"name\":\"gasoline\",\"count\":25,\"label\":\"Essence\"},{\"name\":\"coca_blend\",\"count\":27,\"label\":\"Mélange de coca\"},{\"name\":\"kevlar\",\"count\":34,\"label\":\"Kevlar\"},{\"name\":\"pure_meth_pills\",\"count\":37,\"label\":\"Pseudoéphédrine pure\"},{\"name\":\"phosphorerouge\",\"count\":86,\"label\":\"Phosphore rouge\"},{\"name\":\"kq_acetone\",\"count\":10,\"label\":\"Acétone\"},{\"name\":\"kq_ammonia\",\"count\":17,\"label\":\"Ammoniaque\"},{\"name\":\"methpure\",\"count\":1,\"label\":\"Méthamphétamine pure\"},{\"name\":\"kq_ethanol\",\"count\":1,\"label\":\"Éthanol\"},{\"name\":\"kq_meth_pills\",\"count\":22,\"label\":\"Pseudoéphédrine\"},{\"name\":\"kq_lithium\",\"count\":21,\"label\":\"Pack de lithium\"},{\"name\":\"kq_meth_lab_kit\",\"count\":1,\"label\":\"Kit de cuisson\"},{\"name\":\"crochetage_kit\",\"count\":1,\"label\":\"Kit de Crochetage\"},{\"name\":\"pistol_ammo\",\"count\":126,\"label\":\"Munitions pour pistolet\"},{\"name\":\"cokepure\",\"count\":537,\"label\":\"Cocaïne pure\"},{\"name\":\"bmx\",\"count\":8,\"label\":\"BMX\"},{\"name\":\"cement\",\"count\":19,\"label\":\"Ciment\"},{\"name\":\"lapin\",\"count\":1,\"label\":\"Lapin\"},{\"name\":\"coca_leaf\",\"count\":2,\"label\":\"Feuille de coca exotique\"},{\"name\":\"coke_pooch\",\"count\":2,\"label\":\"Pochon de Coke\"}]}', 'Cartel', 0, NULL),
(13, 'Vagos', 'Vagos', '{\"chest\":{\"x\":316.9051208496094,\"y\":-2043.51025390625,\"z\":20.93636894226074},\"boss\":{\"x\":313.8473815917969,\"y\":-2040.437255859375,\"z\":20.93387985229492}}', '{\"recruit_remove_player\":[],\"change_group_player\":[],\"accounts_add\":[],\"accounts_remove\":[],\"*\":{\"boss\":true},\"weapons\":[],\"items\":[],\"weapons_remove\":[],\"items_add\":[],\"create_edit_grades\":[],\"manage_members\":[],\"items_remove\":[],\"accounts\":[],\"weapons_add\":[]}', '0', '{\"accounts\":{\"cash\":0,\"black_money\":243355},\"weapons\":[{\"count\":255,\"label\":\"Couteau\",\"name\":\"WEAPON_KNIFE\"},{\"count\":1,\"label\":\"Couteau\",\"name\":\"WEAPON_KNIFE\"}],\"items\":[{\"count\":1,\"label\":\"Jumelles\",\"name\":\"jumelles\"},{\"count\":1,\"label\":\"Weed\",\"name\":\"weed\"},{\"count\":243,\"label\":\"Feuille de coca exotique\",\"name\":\"coca_leaf\"}]}', NULL, 0, NULL),
(14, 'Cayo', 'Cayo Kartell', '{\"boss\":{\"x\":4979.35595703125,\"y\":-5713.34765625,\"z\":19.88697242736816},\"chest\":{\"x\":4984.9619140625,\"y\":-5707.1181640625,\"z\":19.88697242736816}}', '{\"*\":{\"boss\":true},\"items_remove\":[],\"change_group_player\":[],\"items_add\":[],\"weapons_add\":[],\"accounts\":[],\"manage_members\":[],\"items\":[],\"create_edit_grades\":[],\"weapons\":[],\"accounts_add\":[],\"recruit_remove_player\":[],\"accounts_remove\":[],\"weapons_remove\":[]}', '0', '{\"items\":[{\"name\":\"combatpistol\",\"label\":\"Glock 17\",\"count\":130},{\"name\":\"kevlar\",\"label\":\"Kevlar\",\"count\":362},{\"name\":\"bat\",\"label\":\"Batte de baseball\",\"count\":50},{\"name\":\"battleaxe\",\"label\":\"Hache de combat\",\"count\":50},{\"name\":\"knife\",\"label\":\"Couteau\",\"count\":50},{\"name\":\"switchblade\",\"label\":\"Couteau pliant\",\"count\":50},{\"name\":\"rifle_ammo\",\"label\":\"Munitions pour fusil\",\"count\":3100},{\"name\":\"smg_ammo\",\"label\":\"Munitions pour mitraillette\",\"count\":6129},{\"name\":\"shotgun_ammo\",\"label\":\"Munitions pour fusil à pompe\",\"count\":6833},{\"name\":\"smg\",\"label\":\"Mitraillette MP5\",\"count\":3},{\"name\":\"machinepistol\",\"label\":\"TEC-9\",\"count\":5},{\"name\":\"minismg\",\"label\":\"Mini Uzi\",\"count\":4},{\"name\":\"microsmg\",\"label\":\"Micro Uzi\",\"count\":5},{\"name\":\"assaultrifle\",\"label\":\"Fusil d\'assaut AK-47\",\"count\":2},{\"name\":\"pistol50\",\"label\":\"Desert Eagle\",\"count\":8},{\"name\":\"tablet\",\"label\":\"Tablet\",\"count\":1}],\"accounts\":{\"cash\":4501,\"black_money\":1800159},\"weapons\":[{\"name\":\"WEAPON_HOMINGLAUNCHER\",\"label\":\"Lance tête-chercheuse\",\"count\":255},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"label\":\"Fusil d\'assaut\",\"count\":150},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"label\":\"Fusil d\'assaut\",\"count\":150}]}', 'Cartel', 0, NULL),
(15, 'Madrazo', 'Madrazo', '{\"boss\":{\"x\":1441.87548828125,\"y\":1142.0230712890626,\"z\":114.33203887939453},\"chest\":{\"x\":1441.4482421875,\"y\":1138.111083984375,\"z\":114.32554626464844}}', '{\"items_add\":{\"Lieutenant\":true,\"Soldat 1\":true,\"Soldat 2\":true,\"Soldat 3\":true,\"Bras Droit\":true,\"Sergent \":true},\"weapons_add\":{\"Lieutenant\":true,\"Soldat 1\":true,\"Soldat 2\":true,\"Soldat 3\":true,\"Bras Droit\":true,\"Sergent \":true},\"recruit_remove_player\":{\"Bras Droit\":true,\"Lieutenant\":true},\"manage_members\":{\"Bras Droit\":true},\"accounts_remove\":{\"Bras Droit\":true},\"weapons_remove\":{\"Lieutenant\":true,\"Bras Droit\":true,\"Sergent \":true},\"weapons\":{\"Lieutenant\":true,\"Bras Droit\":true,\"Sergent \":true},\"items\":{\"Lieutenant\":true,\"Soldat 1\":true,\"Soldat 2\":true,\"Soldat 3\":true,\"Bras Droit\":true,\"Sergent \":true},\"change_group_player\":{\"Bras Droit\":true},\"accounts\":{\"Bras Droit\":true},\"create_edit_grades\":{\"Bras Droit\":true},\"*\":{\"Bras Droit\":true,\"boss\":true},\"accounts_add\":{\"Lieutenant\":true,\"Soldat 1\":true,\"Soldat 2\":true,\"Soldat 3\":true,\"Bras Droit\":true,\"Sergent \":true},\"items_remove\":{\"Lieutenant\":true,\"Soldat 1\":false,\"Soldat 2\":true,\"Soldat 3\":true,\"Bras Droit\":true,\"Sergent \":true}}', '0', '{\"weapons\":[{\"name\":\"WEAPON_BAT\",\"label\":\"Batte\",\"count\":255}],\"accounts\":{\"cash\":483001,\"black_money\":494793},\"items\":[{\"name\":\"kq_ammonia\",\"label\":\"Ammoniaque\",\"count\":5},{\"name\":\"hydrochloric_acid\",\"label\":\"Acide chlorhydrique\",\"count\":390},{\"name\":\"poissonchat\",\"label\":\"Poisson Chat\",\"count\":1},{\"name\":\"battleaxe\",\"label\":\"Hache de combat\",\"count\":4},{\"name\":\"pure_meth_pills\",\"label\":\"Pseudoéphédrine pure\",\"count\":2},{\"name\":\"kq_acetone\",\"label\":\"Acétone\",\"count\":11},{\"name\":\"water\",\"label\":\"Eau\",\"count\":20},{\"name\":\"bread\",\"label\":\"Pain\",\"count\":1},{\"name\":\"coca_leaf\",\"label\":\"Feuille de coca exotique\",\"count\":357},{\"name\":\"hack_laptop\",\"label\":\"Ordinateur Portable\",\"count\":2},{\"name\":\"phosphorerouge\",\"label\":\"Phosphore rouge\",\"count\":2141},{\"name\":\"wire\",\"label\":\"Fil de fer\",\"count\":1},{\"name\":\"jumelles\",\"label\":\"Jumelles\",\"count\":1},{\"name\":\"soudeuse\",\"label\":\"Poste à souder\",\"count\":1},{\"name\":\"lockpick\",\"label\":\"Lockpick\",\"count\":2},{\"name\":\"hack_phone\",\"label\":\"Téléphone Jailbreak\",\"count\":1},{\"name\":\"kevlar\",\"label\":\"Kevlar\",\"count\":1},{\"name\":\"coca_blend\",\"label\":\"Mélange de coca\",\"count\":125},{\"name\":\"coca_paste\",\"label\":\"Pâte de coca\",\"count\":25},{\"name\":\"cement\",\"label\":\"Ciment\",\"count\":346},{\"name\":\"gasoline\",\"label\":\"Essence\",\"count\":400},{\"name\":\"combatpistol\",\"label\":\"Glock 17\",\"count\":5},{\"name\":\"tablet\",\"label\":\"Tablet\",\"count\":1},{\"label\":\"Appât d\'Eau Profonde\",\"name\":\"ocean_lures\",\"count\":300}]}', 'Orga', 0, NULL),
(16, 'McReary', 'McReary', '{\"chest\":{\"x\":-1525.311767578125,\"y\":148.8480224609375,\"z\":60.78971481323242},\"boss\":{\"x\":-1529.44873046875,\"y\":151.06224060058595,\"z\":60.79813766479492}}', '{\"items_add\":{\"co-lead\":true,\"lieutenant\":true},\"items_remove\":{\"co-lead\":true,\"lieutenant\":true},\"change_group_player\":{\"co-lead\":true},\"weapons_add\":{\"co-lead\":true,\"lieutenant\":true},\"weapons\":{\"co-lead\":true,\"lieutenant\":true},\"*\":{\"co-lead\":true,\"boss\":true},\"weapons_remove\":{\"co-lead\":true,\"lieutenant\":true},\"create_edit_grades\":{\"co-lead\":true},\"accounts\":{\"co-lead\":true},\"manage_members\":{\"co-lead\":true},\"accounts_remove\":{\"co-lead\":true},\"items\":{\"co-lead\":true,\"lieutenant\":true},\"recruit_remove_player\":{\"co-lead\":true},\"accounts_add\":{\"co-lead\":true,\"lieutenant\":true}}', '0', '{\"accounts\":{\"cash\":116040,\"black_money\":41513},\"weapons\":[{\"name\":\"WEAPON_BAT\",\"label\":\"Batte\",\"count\":255},{\"name\":\"WEAPON_BAT\",\"label\":\"Batte\",\"count\":255}],\"items\":[{\"name\":\"9mm\",\"label\":\"9mm Munition\",\"count\":549},{\"name\":\"kq_lithium\",\"label\":\"Pack de lithium\",\"count\":20},{\"name\":\"kq_ethanol\",\"label\":\"Éthanol\",\"count\":20},{\"name\":\"hack_laptop\",\"label\":\"Ordinateur Portable\",\"count\":1},{\"name\":\"hack_phone\",\"label\":\"Téléphone Jailbreak\",\"count\":1},{\"name\":\"kq_meth_lab_kit\",\"label\":\"Kit de cuisson\",\"count\":1},{\"name\":\"hydrochloric_acid\",\"label\":\"Acide chlorhydrique\",\"count\":12},{\"name\":\"762mm\",\"label\":\"7.62mm Munition\",\"count\":9},{\"name\":\"556mm\",\"label\":\"5.56mm Munition\",\"count\":10},{\"name\":\"68kal\",\"label\":\"Kal.68 Munition\",\"count\":100},{\"name\":\"mg_ammo\",\"label\":\"Munitions pour mitrailleuse\",\"count\":1},{\"name\":\"snspistol\",\"label\":\"Pistolet SNS\",\"count\":1},{\"name\":\"combatpistol\",\"label\":\"Glock 17\",\"count\":3}]}', 'Orga', 0, NULL),
(17, 'Duggan-crime', 'Duggan crime family', '{\"chest\":{\"x\":790.4530029296875,\"y\":3404.861572265625,\"z\":57.8841438293457},\"boss\":{\"x\":750.2612915039063,\"y\":3421.88232421875,\"z\":67.43805694580078}}', '{\"items\":[],\"change_group_player\":[],\"create_edit_grades\":[],\"*\":{\"boss\":true},\"items_add\":[],\"weapons\":[],\"accounts\":[],\"accounts_remove\":[],\"manage_members\":[],\"items_remove\":[],\"accounts_add\":[],\"weapons_remove\":[],\"weapons_add\":[],\"recruit_remove_player\":[]}', '0', '{\"accounts\":{\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', 'Orga', 0, NULL),
(18, 'Duggan', 'Duggan', '{\"chest\":{\"x\":790.27294921875,\"y\":3405.045654296875,\"z\":57.88414764404297},\"boss\":{\"x\":750.133056640625,\"y\":3422.416748046875,\"z\":67.43794250488281}}', '{\"items\":{\"Frère Rapprocher \":true,\"Petit Coussin\":false,\"Bras Droit\":true},\"accounts_add\":{\"Coussin\":true,\"Frère\":true,\"Frère Rapprocher \":true,\"Bras Droit\":true},\"create_edit_grades\":{\"Bras Droit\":false},\"*\":{\"boss\":true},\"items_add\":{\"Frère Rapprocher \":true,\"Coussin\":true,\"Frère\":true,\"Petit Coussin\":true,\"Bras Droit\":true},\"weapons\":{\"Frère Rapprocher \":true,\"Bras Droit\":true},\"accounts\":{\"Frère Rapprocher \":false,\"Bras Droit\":true},\"items_remove\":{\"Frère Rapprocher \":true,\"Coussin\":true,\"Frère\":true,\"Petit Coussin\":true,\"Bras Droit\":true},\"accounts_remove\":{\"Frère Rapprocher \":true,\"Frère\":false,\"Bras Droit\":true},\"change_group_player\":[],\"recruit_remove_player\":{\"Bras Droit\":true},\"weapons_remove\":{\"Frère Rapprocher \":true,\"Coussin\":true,\"Frère\":true,\"Petit Coussin\":true,\"Bras Droit\":true},\"weapons_add\":{\"Frère Rapprocher \":true,\"Coussin\":true,\"Frère\":true,\"Petit Coussin\":true,\"Bras Droit\":true},\"manage_members\":[]}', '0', '{\"accounts\":{\"cash\":150000,\"black_money\":0},\"items\":[],\"weapons\":[{\"name\":\"WEAPON_SWITCHBLADE\",\"label\":\"Couteau à cran d\'arrêt\",\"count\":255}]}', 'Orga', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `garages`
--

CREATE TABLE `garages` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT 'none',
  `label` varchar(50) NOT NULL DEFAULT 'none',
  `defaultpos` varchar(255) DEFAULT NULL,
  `deletepos` varchar(255) DEFAULT NULL,
  `spawnpos` longtext DEFAULT NULL,
  `headingspawnpos` varchar(255) DEFAULT NULL,
  `activeblip` bit(1) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'car'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `garages`
--

INSERT INTO `garages` (`id`, `name`, `label`, `defaultpos`, `deletepos`, `spawnpos`, `headingspawnpos`, `activeblip`, `type`) VALUES
(1, 'pc', 'Zentrales Parkhaus', '{\"z\":30.73324203491211,\"x\":215.437744140625,\"y\":-810.1314086914063}', '{\"z\":30.77027511596679,\"x\":221.9745330810547,\"y\":-786.7836303710938}', '[{\"z\":29.45521926879882,\"h\":64.86729431152344,\"x\":232.85386657714845,\"y\":-805.0956420898438},{\"z\":29.46154594421386,\"h\":62.95913696289062,\"x\":233.96218872070313,\"y\":-802.8009033203125},{\"z\":29.48854019165039,\"x\":235.16432189941407,\"h\":74.0940933227539,\"y\":-800.3082885742188}]', '162.05015563964844', b'1', 'car'),
(2, 'hangar_airport', 'Flughafenhangar 1', '{\"z\":14.04568004608154,\"y\":-2665.697998046875,\"x\":-1276.8614501953126}', '{\"x\":-1310.375,\"y\":-2720.837158203125,\"z\":15.0649127960205}', '[{\"x\":-1316.348388671875,\"z\":12.94494247436523,\"y\":-2731.16259765625,\"h\":147.71737670898438},{\"x\":-1329.6566162109376,\"z\":12.96492721557617,\"y\":-2754.07080078125,\"h\":150.55368041992188}]', '147.15330505371094', b'1', 'aircraft'),
(3, 'dock_marina', 'Marina-Dock 1', '{\"z\":1.60516726970672,\"x\":-895.2451782226563,\"y\":-1331.3834228515626}', '{\"z\":1.08127129077911,\"x\":-892.1829833984375,\"y\":-1336.7296142578126}', '[{\"z\":-1.4748937189579,\"h\":291.3253173828125,\"x\":-931.0884399414063,\"y\":-1356.4119873046876},{\"z\":-1.45478234767913,\"x\":-966.6730346679688,\"h\":286.77239990234377,\"y\":-1370.198974609375},{\"z\":-1.58051393508911,\"h\":286.7681884765625,\"x\":-885.8867797851563,\"y\":-1343.6484375}]', '281.8470764160156', b'1', 'boat'),
(201, 'sandy_garage', 'Garage Sandy', '{\"x\":1542.3330078125,\"y\":3680.4755859375,\"z\":34.59654998779297}', '{\"x\":1546.4061279296876,\"y\":3684.100341796875,\"z\":34.45106506347656}', '[{\"h\":337.30059814453127,\"x\":1550.66748046875,\"z\":33.44745971679688,\"y\":3674.59521484375}]', NULL, b'1', 'car'),
(202, 'sandy_boat', 'Sandy Boote', '{\"x\":1400.24365234375,\"y\":3790.069580078125,\"z\":31.84799766540527}', '{\"x\":1398.984130859375,\"y\":3795.605712890625,\"z\":31.38217735290527}', '[{\"h\":351.4951171875,\"x\":1382.1025390625,\"z\":30.57751037597656,\"y\":3797.844970703125}]', NULL, b'1', 'boat'),
(203, 'sandy_bcso_heli', 'BCSO Luftstützpunkt', '{\"x\":-466.67742919921877,\"y\":6005.9189453125,\"z\":31.48917198181152}', '{\"z\":41.58304977416992,\"x\":1729.6837158203126,\"y\":3863.082275390625}', '[{\"z\":40.60304977416992,\"x\":1729.6837158203126,\"h\":221.4136199951172,\"y\":3863.082275390625}]', NULL, b'0', 'aircraft'),
(204, 'paleto_bcso', 'Paleto BCSO', '{\"x\":1789.6358642578126,\"y\":3755.377685546875,\"z\":39.56131744384765}', '{\"x\":-459.3150939941406,\"z\":31.31083488464355,\"y\":5987.0205078125}', '[{\"x\":-465.0893859863281,\"h\":43.72171783447265,\"z\":30.32791664123535,\"y\":5980.115234375}]', NULL, b'0', 'car'),
(205, 'paleto_garage', 'Garaga Paleto', '{\"x\":105.27259826660156,\"y\":6613.736328125,\"z\":32.3973274230957}', '{\"x\":117.05117797851563,\"y\":6599.6572265625,\"z\":32.00846862792969}', '[{\"z\":30.93478729248047,\"x\":119.82846069335938,\"h\":324.8345031738281,\"y\":6609.6591796875}]', NULL, b'0', 'car'),
(206, 'paleto_bcso_heli', 'BCSO Luftstützpunkt Paleto', '{\"x\":-480.13421630859377,\"y\":5972.32958984375,\"z\":31.30229377746582}', '{\"x\":-475.4081726074219,\"y\":5988.54736328125,\"z\":31.33646965026855}', '[{\"z\":30.35646965026855,\"x\":-475.4081726074219,\"h\":298.8329772949219,\"y\":5988.54736328125}]', NULL, b'0', 'aircraft'),
(207, 'leftbeach_garage', 'Garage Linker Strand', '{\"x\":-3156.890869140625,\"y\":1093.45654296875,\"z\":20.85467147827148}', '{\"x\":-3153.370849609375,\"y\":1092.623291015625,\"z\":20.70772743225097}', '[{\"z\":19.72720672607422,\"x\":-3151.6875,\"h\":282.340087890625,\"y\":1095.885986328125}]', NULL, b'1', 'car'),
(208, 'ems_garage', 'EMS Garage', '{\"x\":293.8675842285156,\"y\":-599.842041015625,\"z\":43.30205154418945}', '{\"x\":296.14093017578127,\"y\":-606.9788818359375,\"z\":43.32892227172851}', '[{\"z\":42.41240264892578,\"x\":293.5664978027344,\"h\":61.77568435668945,\"y\":-613.1773071289063}]', NULL, b'0', 'car'),
(210, 'police_garage', 'Polizei', '{\"x\":76.72515106201172,\"y\":-387.6198425292969,\"z\":38.36684799194336}', '{\"x\":73.93659973144531,\"y\":-396.49212646484377,\"z\":38.36689376831055}', '[{\"x\":64.98226928710938,\"y\":-396.0665283203125,\"z\":37.38685562133789,\"h\":247.25498962402345},{\"x\":66.33686828613281,\"y\":-391.7403564453125,\"z\":37.36688995361328,\"h\":242.03652954101563}]', NULL, b'0', 'car'),
(211, 'sandy_bcso', 'BCSO Sandy', '{\"x\":1749.390869140625,\"y\":3886.221435546875,\"z\":34.6863784790039}', '{\"x\":1750.97265625,\"y\":3879.0595703125,\"z\":34.64656829833984}', '[{\"x\":1740.118896484375,\"h\":300.141357421875,\"z\":33.67858840942383,\"y\":3875.886962890625}]', NULL, b'0', 'car'),
(212, 'villa-madrazo', 'Villa Madrazo', '{\"x\":-1488.198974609375,\"y\":18.36956405639648,\"z\":54.71760940551758}', '{\"x\":-1490.5205078125,\"y\":24.69636535644531,\"z\":54.7542839050293}', '[{\"y\":24.69621467590332,\"z\":53.7742839050293,\"h\":347.8213195800781,\"x\":-1490.5205078125}]', NULL, b'0', 'car'),
(213, 'coke_island_boat', 'Insel', '{\"x\":5497.58447265625,\"y\":2262.285888671875,\"z\":2.98080849647521}', '{\"z\":0.76285117864608,\"y\":2274.01953125,\"x\":5493.47802734375}', '[{\"h\":109.80205535888672,\"z\":-0.21714882135391,\"y\":2274.01953125,\"x\":5493.47802734375}]', NULL, b'0', 'boat'),
(214, 'coke_island_aircraft', 'Insel', '{\"x\":5578.291015625,\"y\":2171.10791015625,\"z\":12.95929527282714}', '{\"x\":5588.3486328125,\"y\":2172.797119140625,\"z\":12.50102806091308}', '[{\"x\":5588.3486328125,\"z\":11.52102806091308,\"y\":2172.797119140625,\"h\":304.7853698730469}]', NULL, b'0', 'aircraft'),
(215, 'villa1', 'Villa 1', '{\"x\":-1253.5521240234376,\"y\":809.6049194335938,\"z\":193.37997436523438}', '{\"x\":-1252.2374267578126,\"y\":816.0172729492188,\"z\":193.37997436523438}', '[{\"h\":29.56255912780761,\"x\":-1252.1505126953126,\"y\":815.9951171875,\"z\":192.39997436523439}]', NULL, b'0', 'car'),
(216, 'villa1.2', 'Villa 1 Helikopter', '{\"x\":-1282.442138671875,\"y\":760.0734252929688,\"z\":190.82989501953126}', '{\"x\":-1288.176025390625,\"y\":756.8605346679688,\"z\":190.8351593017578}', '[{\"h\":204.72933959960938,\"x\":-1288.163330078125,\"y\":756.8800048828125,\"z\":189.85515930175783}]', NULL, b'0', 'aircraft'),
(217, 'taxicar', 'Taxi Fahrzeug', '{\"x\":871.070556640625,\"y\":-160.79696655273438,\"z\":69.42191314697266}', '{\"x\":881.8155517578125,\"y\":-160.27610778808595,\"z\":69.39041900634766}', '[{\"h\":238.720947265625,\"y\":-157.1535186767578,\"z\":68.42475463867187,\"x\":876.2837524414063},{\"h\":238.50216674804688,\"y\":-159.59169006347657,\"z\":68.43151428222656,\"x\":874.674072265625},{\"h\":239.30520629882813,\"y\":-154.6509552001953,\"z\":68.41777374267578,\"x\":877.9386596679688},{\"h\":238.7008056640625,\"y\":-151.87730407714845,\"z\":68.41117431640625,\"x\":879.5030517578125}]', NULL, b'0', 'car'),
(218, 'ammunation', 'Waffengeschäft', '{\"x\":-1319.187255859375,\"y\":-395.5570373535156,\"z\":36.59865570068359}', '{\"x\":-1323.7532958984376,\"y\":-387.6374816894531,\"z\":36.55613327026367}', '[{\"y\":-396.38128662109377,\"h\":33.90383529663086,\"x\":-1329.3468017578126,\"z\":35.47465087890625},{\"y\":-400.1935119628906,\"h\":28.63836097717285,\"x\":-1335.197509765625,\"z\":35.45971252441406}]', NULL, b'1', 'car'),
(219, 'Parking Principal', 'Hauptparkplatz', '{\"x\":-345.9163513183594,\"y\":-875.054931640625,\"z\":31.08417129516601}', '{\"x\":-353.7779235839844,\"y\":-880.5213012695313,\"z\":31.07143402099609}', '[{\"y\":-889.0284423828125,\"x\":-314.5383605957031,\"h\":70.83589172363281,\"z\":30.09977294921875},{\"y\":-891.9327392578125,\"x\":-300.78851318359377,\"h\":70.67552947998047,\"z\":30.10060073852539}]', NULL, b'1', 'car'),
(220, 'parking_2', 'Scheunenparkplatz', '{\"x\":-87.45509338378906,\"y\":1877.7344970703126,\"z\":197.32583618164063}', '{\"x\":-79.6023178100586,\"y\":1879.413330078125,\"z\":197.2173309326172}', '[{\"y\":1888.537109375,\"h\":147.2346649169922,\"x\":-63.33160400390625,\"z\":195.21285583496096},{\"y\":1875.3203125,\"h\":90.66307830810547,\"x\":-53.1242561340332,\"z\":195.88265563964846}]', NULL, b'1', 'car'),
(221, 'parking_3', 'Paleto Parkplatz', '{\"x\":112.9619369506836,\"y\":6376.36279296875,\"z\":31.37590026855468}', '{\"x\":109.33660125732422,\"y\":6381.28466796875,\"z\":31.2258243560791}', '[{\"y\":6376.42724609375,\"h\":5.95497798919677,\"x\":101.82656860351563,\"z\":30.2458243560791},{\"y\":6372.33984375,\"h\":5.21031761169433,\"x\":94.47178649902344,\"z\":30.2458243560791}]', NULL, b'1', 'car'),
(222, 'parking_sandy_helico', 'Sandy Helikopter Parkplatz', '{\"x\":1714.807373046875,\"y\":3275.628173828125,\"z\":41.14509963989258}', '{\"x\":1770.2337646484376,\"y\":3240.2109375,\"z\":42.11545944213867}', '[{\"y\":3240.2109375,\"h\":239.2730712890625,\"x\":1770.2337646484376,\"z\":41.13545944213867},{\"y\":3254.76513671875,\"h\":102.80104064941406,\"x\":1710.818359375,\"z\":40.0770182800293}]', NULL, b'1', 'aircraft'),
(223, 'Rockford', 'Rockford', '{\"x\":-754.662841796875,\"y\":-75.79722595214844,\"z\":41.7537841796875}', '{\"x\":-745.7488403320313,\"y\":-71.41999816894531,\"z\":41.75031661987305}', '[{\"y\":-77.83419799804688,\"x\":-742.92333984375,\"h\":20.98543548583984,\"z\":40.76689483642578},{\"y\":-75.96763610839844,\"x\":-739.4658813476563,\"h\":26.57181930541992,\"z\":40.76694061279297},{\"y\":-74.68482208251953,\"x\":-735.9535522460938,\"h\":28.85975074768066,\"z\":40.76673843383789}]', NULL, b'1', 'car'),
(224, 'parking_4', 'Autobahn-Parkplatz', '{\"x\":2588.286376953125,\"y\":425.98199462890627,\"z\":108.50659942626953}', '{\"x\":2579.1220703125,\"y\":428.3394470214844,\"z\":108.45570373535156}', '[{\"y\":428.10302734375,\"h\":8.06246757507324,\"x\":2568.37939453125,\"z\":107.4756884765625},{\"y\":409.2273254394531,\"h\":3.56273341178894,\"x\":2569.148681640625,\"z\":107.47652770996094}]', NULL, b'1', 'car'),
(225, 'parking_5', 'Abschlepphof', '{\"x\":430.509765625,\"y\":-1279.8125,\"z\":30.41626930236816}', '{\"x\":421.2193908691406,\"y\":-1284.4705810546876,\"z\":30.26226997375488}', '[{\"y\":-1289.4398193359376,\"h\":318.0606689453125,\"x\":414.8553161621094,\"z\":29.28924133300781},{\"y\":-1277.3033447265626,\"h\":243.55703735351563,\"x\":407.40087890625,\"z\":29.29394104003906}]', NULL, b'1', 'car'),
(226, 'parking_6', 'Marina Parkplatz', '{\"x\":-831.8294067382813,\"y\":-1330.42431640625,\"z\":5.15208101272583}', '{\"x\":-829.6473999023438,\"y\":-1320.8873291015626,\"z\":5.00034284591674}', '[{\"y\":-1312.8118896484376,\"h\":347.4923095703125,\"x\":-813.9197998046875,\"z\":4.0262346458435},{\"y\":-1296.2125244140626,\"h\":163.68295288085938,\"x\":-811.2744140625,\"z\":4.02038242340087}]', NULL, b'1', 'car'),
(227, 'parking_7', 'Angelparkplatz Grape Seed', '{\"x\":1299.0855712890626,\"y\":4322.3662109375,\"z\":38.25406265258789}', '{\"x\":1302.8204345703126,\"y\":4325.82177734375,\"z\":38.41980361938476}', '[{\"y\":4313.921875,\"h\":323.11834716796877,\"x\":1307.389404296875,\"z\":36.72991897583008},{\"y\":4332.46142578125,\"h\":270.0415344238281,\"x\":1294.953125,\"z\":37.54588653564453}]', NULL, b'1', 'car'),
(228, 'parking_9', 'Lieferparkplatz', '{\"x\":966.0907592773438,\"y\":-1811.4278564453126,\"z\":31.17859649658203}', '{\"x\":968.7085571289063,\"y\":-1818.6629638671876,\"z\":31.09031867980957}', '[{\"y\":-1824.7218017578126,\"h\":0.12698569893836,\"x\":969.5081787109375,\"z\":30.12181617736816},{\"y\":-1817.6868896484376,\"h\":84.32490539550781,\"x\":980.69970703125,\"z\":30.20135643005371}]', NULL, b'1', 'car'),
(229, 'parking_10', 'Flughafen Parkplatz', '{\"x\":-906.822998046875,\"y\":-2039.1212158203126,\"z\":9.40497970581054}', '{\"x\":-898.6197509765625,\"y\":-2048.46533203125,\"z\":9.30317497253418}', '[{\"y\":-2050.173828125,\"h\":220.32992553710938,\"x\":-912.8701171875,\"z\":8.31903507232666}]', NULL, b'1', 'car'),
(230, 'cayo', 'Cayo', '{\"x\":4982.20947265625,\"y\":-5693.98681640625,\"z\":19.886962890625}', '{\"x\":4989.20263671875,\"y\":-5684.8193359375,\"z\":20.09181213378906}', '[{\"h\":140.31544494628907,\"z\":19.01393844604492,\"y\":-5687.72509765625,\"x\":4987.4072265625}]', NULL, b'0', 'car'),
(231, 'car_vigneron', 'Garage Winzer', '{\"x\":-1925.5537109375,\"y\":2048.15478515625,\"z\":140.83206176757813}', '{\"x\":-1920.55908203125,\"y\":2048.664306640625,\"z\":140.73492431640626}', '[{\"h\":248.7144775390625,\"x\":-1920.41796875,\"y\":2048.711181640625,\"z\":139.75493957519533},{\"h\":258.2930603027344,\"x\":-1919.721923828125,\"y\":2052.711181640625,\"z\":139.75504638671877},{\"h\":254.61041259765626,\"x\":-1918.927001953125,\"y\":2056.674560546875,\"z\":139.7551531982422},{\"h\":258.9326477050781,\"x\":-1921.82421875,\"y\":2044.613525390625,\"z\":139.7547412109375}]', NULL, b'0', 'car'),
(232, 'car_lscustoms', 'Garage LSCustoms', '{\"x\":-357.8121643066406,\"y\":-107.69117736816406,\"z\":38.70040130615234}', '{\"x\":-370.3961181640625,\"y\":-107.66962432861328,\"z\":38.68401336669922}', '[{\"h\":68.06565856933594,\"x\":-370.3970947265625,\"y\":-107.66983795166016,\"z\":37.70401336669922},{\"h\":72.5738296508789,\"x\":-356.32611083984377,\"y\":-110.31575775146485,\"z\":37.72026016235352},{\"h\":162.15240478515626,\"x\":-359.3999938964844,\"y\":-123.711669921875,\"z\":37.71945907592774}]', NULL, b'0', 'car'),
(234, 'vagos', 'Vagos', '{\"x\":327.6126403808594,\"y\":-2034.0263671875,\"z\":20.94764328002929}', '{\"x\":312.6851806640625,\"y\":-2021.0089111328126,\"z\":20.42727088928222}', '[{\"y\":-2027.2498779296876,\"z\":19.73053504943847,\"x\":319.94952392578127,\"h\":51.13272857666015}]', NULL, b'0', 'car'),
(235, 'Garage Madrazo', 'Garage Madrazo', '{\"x\":1407.881591796875,\"y\":1114.8983154296876,\"z\":114.83773040771485}', '{\"x\":1407.670654296875,\"y\":1118.2861328125,\"z\":114.83773040771485}', '[{\"z\":113.8577456665039,\"y\":1117.9486083984376,\"h\":92.16088104248047,\"x\":1400.701171875}]', NULL, b'0', 'car'),
(236, 'Helico', 'Helikopter', '{\"x\":1460.2686767578126,\"y\":1111.8538818359376,\"z\":116.22811126708985}', '{\"x\":1462.2664794921876,\"y\":1111.821044921875,\"z\":116.22811126708985}', '[{\"x\":1460.616943359375,\"y\":1111.362060546875,\"z\":115.24811126708984,\"h\":74.22420501708985}]', NULL, b'0', 'aircraft'),
(237, 'sinaloa', 'Sinaloa', '{\"x\":-3276.97216796875,\"y\":534.3275146484375,\"z\":12.26541423797607}', '{\"x\":-3272.251220703125,\"y\":533.6539306640625,\"z\":12.26540184020996}', '[{\"x\":-3280.298095703125,\"y\":526.85791015625,\"z\":11.28541423797607,\"h\":125.91364288330078}]', NULL, b'0', 'car'),
(238, 'sinaloaboat', 'Sinaloa-Boote', '{\"x\":-3373.070556640625,\"y\":594.0513305664063,\"z\":3.67391848564147}', '{\"x\":-3383.26611328125,\"y\":594.9461669921875,\"z\":-0.02042291685938}', '[{\"x\":-3390.834716796875,\"y\":610.2230834960938,\"z\":-1.30108843326568,\"h\":40.24918365478515}]', NULL, b'0', 'boat'),
(239, 'pacificbluff', 'Pacific Bluff', '{\"x\":-3115.574462890625,\"y\":87.78883361816406,\"z\":11.50630092620849}', '{\"x\":-3117.428466796875,\"y\":76.45403289794922,\"z\":13.02966403961181}', '[{\"x\":-3117.428466796875,\"y\":76.45403289794922,\"z\":12.04966403961181,\"h\":175.39419555664063}]', NULL, b'0', 'aircraft'),
(240, 'pacificbluffboat', 'Pacific Bluff Boote', '{\"x\":-3046.2744140625,\"y\":-46.77909851074219,\"z\":3.8787772655487}', '{\"x\":-3041.2158203125,\"y\":-65.85303497314453,\"z\":0.00216955970972}', '[{\"x\":-3041.217041015625,\"y\":-65.85292053222656,\"z\":-0.81874987065792,\"h\":248.0730438232422}]', NULL, b'0', 'boat'),
(241, 'pacificbluffcar', 'Pacific Bluff Auto', '{\"x\":-2952.728271484375,\"y\":49.71783828735351,\"z\":11.60876083374023}', '{\"x\":-2957.00927734375,\"y\":58.37648773193359,\"z\":11.60883235931396}', '[{\"x\":-2957.303955078125,\"y\":58.57454299926758,\"z\":10.62850429534912,\"h\":56.04696273803711}]', NULL, b'0', 'car');

-- --------------------------------------------------------

--
-- Structure de la table `gfxmdt_appointment`
--

CREATE TABLE `gfxmdt_appointment` (
  `id` varchar(50) NOT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



-- --------------------------------------------------------

--
-- Structure de la table `gfxmdt_avatars`
--

CREATE TABLE `gfxmdt_avatars` (
  `id` int(11) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gfxmdt_banlist`
--

CREATE TABLE `gfxmdt_banlist` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `addedBy` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `ranks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gfxmdt_department`
--

CREATE TABLE `gfxmdt_department` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gfxmdt_fines`
--

CREATE TABLE `gfxmdt_fines` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `jailTime` varchar(50) DEFAULT NULL,
  `jailType` varchar(50) DEFAULT NULL,
  `money` varchar(50) DEFAULT NULL,
  `lastEdited` varchar(50) DEFAULT NULL,
  `addedBy` varchar(50) DEFAULT NULL,
  `punishment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `gfxmdt_fines`
--

INSERT INTO `gfxmdt_fines` (`id`, `name`, `jailTime`, `jailType`, `money`, `lastEdited`, `addedBy`, `punishment`) VALUES
(1, 'Missbräuchliche Benutzung der Hupe', '15', 'Minutes', '3000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(2, 'Überfahren einer durchgezogenen Linie', '20', 'Minutes', '4000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(3, 'Fahren entgegen der Fahrtrichtung', '30', 'Minutes', '25000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(4, 'Unerlaubtes Wenden', '25', 'Minutes', '25000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(5, 'Fahren abseits der Straße', '20', 'Minutes', '17000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(6, 'Nichtbeachtung des Sicherheitsabstands', '15', 'Minutes', '3000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(7, 'Gefährliches/verbotenes Halten', '20', 'Minutes', '15000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(8, 'Behinderndes/verbotenes Parken', '15', 'Minutes', '7000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(9, 'Nichtbeachtung der Vorfahrt von rechts', '15', 'Minutes', '7000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(10, 'Nichtbeachtung eines Einsatzfahrzeugs', '20', 'Minutes', '9000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(11, 'Nichtbeachtung eines Stoppschilds', '20', 'Minutes', '10500', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(12, 'Nichtbeachtung einer roten Ampel', '25', 'Minutes', '13000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(13, 'Gefährliches Überholen', '30', 'Minutes', '10000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(14, 'Fahrzeug in schlechtem Zustand', '20', 'Minutes', '10000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(15, 'Fahren ohne Führerschein', '60', 'Minutes', '150000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(16, 'Unerlaubtes Entfernen vom Unfallort', '60', 'Minutes', '80000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(17, 'Geschwindigkeitsüberschreitung < 5 km/h', '15', 'Minutes', '9000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(18, 'Geschwindigkeitsüberschreitung 5-15 km/h', '20', 'Minutes', '12000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(19, 'Geschwindigkeitsüberschreitung 15-30 km/h', '30', 'Minutes', '18000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(20, 'Geschwindigkeitsüberschreitung > 30 km/h', '45', 'Minutes', '30000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(21, 'Behinderung des Verkehrs', '30', 'Minutes', '11000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(22, 'Beschädigung der öffentlichen Infrastruktur', '25', 'Minutes', '9000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(23, 'Störung der öffentlichen Ordnung', '20', 'Minutes', '9000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(24, 'Behinderung einer Polizeimaßnahme', '30', 'Minutes', '13000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(25, 'Beleidigung gegenüber/zwischen Zivilisten', '15', 'Minutes', '7500', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(26, 'Beleidigung eines Polizeibeamten', '20', 'Minutes', '1100', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(27, 'Verbale Drohung oder Einschüchterung gegenüber Zivilisten', '15', 'Minutes', '900', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(28, 'Verbale Drohung oder Einschüchterung gegenüber Polizisten', '20', 'Minutes', '1500', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(29, 'Illegale Demonstration', '25', 'Minutes', '2500', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(30, 'Bestechungsversuch', '40', 'Minutes', '15000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(31, 'Messer in der Stadt gezogen', '30', 'Minutes', '1200', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(32, 'Todeswaffe in der Stadt gezogen', '45', 'Minutes', '3000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(33, 'Führen einer Waffe ohne Lizenz', '60', 'Minutes', '6000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(34, 'Illegaler Waffenbesitz', '60', 'Minutes', '7000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(35, 'Beim Aufbrechen erwischt', '30', 'Minutes', '3000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(36, 'Autodiebstahl', '60', 'Minutes', '18000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(37, 'Drogenverkauf', '60', 'Minutes', '15000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(38, 'Drogenherstellung', '60', 'Minutes', '15000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(39, 'Drogenbesitz', '30', 'Minutes', '6500', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(40, 'Zivilist als Geisel genommen', '90', 'Minutes', '15000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(41, 'Staatlicher Beamter als Geisel genommen', '120', 'Minutes', '20000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(42, 'Raub bei Privatperson', '60', 'Minutes', '6500', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(43, 'Raubüberfall auf Geschäft', '60', 'Minutes', '6500', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(44, 'Banküberfall', '120', 'Minutes', '15000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(45, 'Schuss auf Zivilisten', '60', 'Minutes', '20000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(46, 'Schuss auf staatlichen Beamten', '90', 'Minutes', '25000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(47, 'Versuchter Mord an Zivilist', '90', 'Minutes', '30000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(48, 'Versuchter Mord an staatlichem Beamten', '120', 'Minutes', '50000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(49, 'Mord an Zivilist', '120', 'Minutes', '100000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(50, 'Mord an staatlichem Beamten', '120', 'Minutes', '300000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(51, 'Fahrlässige Tötung', '60', 'Minutes', '18000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun'),
(52, 'Betrug gegenüber Unternehmen', '60', 'Minutes', '20000', '{\"time\":1714587600,\"editedBy\":\"Chief Of LSPD\"}', 'Chief Of LSPD', 'Aucun');

-- --------------------------------------------------------

--
-- Structure de la table `gfxmdt_notifications`
--

CREATE TABLE `gfxmdt_notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `text` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gfxmdt_offenders`
--

CREATE TABLE `gfxmdt_offenders` (
  `id` int(11) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `madeBy` varchar(50) DEFAULT NULL,
  `ranks` varchar(50) DEFAULT NULL,
  `reportText` varchar(50) DEFAULT NULL,
  `evidences` varchar(50) DEFAULT NULL,
  `fines` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ------------------------oqu--------------------------------

--
-- Structure de la table `gfxmdt_polices`
--

CREATE TABLE `gfxmdt_polices` (
  `id` int(11) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `madeBy` varchar(50) DEFAULT NULL,
  `ranks` varchar(50) DEFAULT NULL,
  `reportText` varchar(50) DEFAULT NULL,
  `evidences` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gfxmdt_records`
--

CREATE TABLE `gfxmdt_records` (
  `id` int(11) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `text` varchar(50) DEFAULT NULL,
  `ranks` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `addedBy` varchar(50) DEFAULT NULL,
  `reportText` varchar(50) DEFAULT NULL,
  `offenders` varchar(50) DEFAULT NULL,
  `evidences` varchar(50) DEFAULT NULL,
  `polices` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gfxmdt_wanteds`
--

CREATE TABLE `gfxmdt_wanteds` (
  `id` int(11) NOT NULL,
  `avatar` longtext DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ranks` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `reportText` varchar(50) DEFAULT NULL,
  `addedBy` varchar(50) DEFAULT NULL,
  `evidences` longtext DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gloveboxitems`
--

CREATE TABLE `gloveboxitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `identity_cards`
--

CREATE TABLE `identity_cards` (
  `UID` longtext NOT NULL,
  `UniqueID` longtext NOT NULL,
  `firstname` longtext NOT NULL,
  `lastname` longtext NOT NULL,
  `dateofbirth` longtext NOT NULL,
  `sex` longtext NOT NULL,
  `height` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `illegal_drugs_circuits`
--

CREATE TABLE `illegal_drugs_circuits` (
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `recolte` longtext DEFAULT NULL,
  `traitement` longtext DEFAULT NULL,
  `animtype` longtext DEFAULT NULL,
  `animdict` longtext DEFAULT NULL,
  `anim` longtext DEFAULT NULL,
  `animtime` int(11) DEFAULT NULL,
  `marker` tinyint(1) DEFAULT 0,
  `props` longtext DEFAULT NULL,
  `name_pooch` longtext DEFAULT NULL,
  `label_pooch` longtext DEFAULT NULL,
  `animtype_t` longtext DEFAULT NULL,
  `animdict_t` longtext DEFAULT NULL,
  `anim_t` longtext DEFAULT NULL,
  `animtime_t` int(11) DEFAULT NULL,
  `marker_t` tinyint(1) DEFAULT 0,
  `props_t` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `illegal_drugs_sell`
--

CREATE TABLE `illegal_drugs_sell` (
  `id` int(11) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `illegal_drugs_sell`
--

INSERT INTO `illegal_drugs_sell` (`id`, `position`, `message`) VALUES
(1, '{\"x\":223.64340209960938,\"y\":361.93609619140627,\"z\":106.01580047607422}', 'Hey, ich habe gerade deinen Kontakt bekommen, komm zu mir!'),
(2, '{\"x\":631.2670288085938,\"y\":126.13030242919922,\"z\":92.8271713256836}', 'Ich habe ein Bündel Geld für dich, komm zu mir!'),
(3, '{\"x\":919.8397827148438,\"y\":-101.06559753417969,\"z\":78.76405334472656}', 'Ich will mal abschalten, komm zu mir!'),
(4, '{\"x\":744.7858276367188,\"y\":-1226.4090576171876,\"z\":24.76889991760254}', 'Mein Lieblingsdealer, hast du ein bisschen Stoff für mich? Komm zu mir!'),
(5, '{\"x\":48.1136589050293,\"y\":-1617.7509765625,\"z\":29.35910987854004}', 'Hey, ich habe gerade deinen Kontakt bekommen, komm zu mir!'),
(6, '{\"x\":-337.1455993652344,\"y\":-1485.842041015625,\"z\":30.58897018432617}', 'Ich habe ein Bündel Geld für dich, komm zu mir!'),
(7, '{\"x\":866.59130859375,\"y\":-1061.0830078125,\"z\":28.92093086242675}', 'Ich will mal abschalten, komm zu mir!'),
(8, '{\"x\":1139.843994140625,\"y\":-793.9586791992188,\"z\":57.59371185302734}', 'Hey, ich habe gerade deinen Kontakt bekommen, komm zu mir!'),
(9, '{\"x\":1116.4549560546876,\"y\":-975.5618286132813,\"z\":46.4276008605957}', 'Ich habe ein Bündel Geld für dich, komm zu mir!'),
(10, '{\"x\":1255.7490234375,\"y\":-728.9434814453125,\"z\":63.08428955078125}', 'Mein Lieblingsdealer, hast du ein bisschen Stoff für mich? Komm zu mir!'),
(11, '{\"x\":1347.6109619140626,\"y\":-579.915283203125,\"z\":74.27182006835938}', 'Wo bist du? Ich brauche deinen Stoff, komm zu mir!'),
(12, '{\"x\":955.7034912109375,\"y\":-1060.512939453125,\"z\":36.9140510559082}', 'Hast du noch magische Ware? Komm zu mir, ich weiß, ich kann auf dich zählen!'),
(13, '{\"x\":1098.948974609375,\"y\":-257.17230224609377,\"z\":69.23422241210938}', 'Hast du noch etwas Ware für mich? Komm zu mir!'),
(14, '{\"x\":-337.54510498046877,\"y\":-937.4935913085938,\"z\":31.08061027526855}', 'Hast du noch magische Ware? Komm zu mir, ich weiß, ich kann auf dich zählen!'),
(15, '{\"x\":-321.01458740234377,\"y\":-708.7540283203125,\"z\":32.90948867797851}', 'Ich brauche deinen Stoff, komm zu diesem Ort!'),
(16, '{\"x\":250.98289489746095,\"y\":-84.9937515258789,\"z\":69.94864654541016}', 'Mein Lieblingsdealer, hast du ein bisschen Stoff für mich? Komm zu mir!'),
(17, '{\"x\":-529.8306274414063,\"y\":-28.73513031005859,\"z\":44.48300170898437}', 'Hey, ich habe gerade deinen Kontakt bekommen, komm zu mir!'),
(18, '{\"x\":-1447.862060546875,\"y\":-366.66900634765627,\"z\":43.54209899902344}', 'Ich habe ein Bündel Geld für dich, komm zu mir!'),
(19, '{\"x\":-1665.5570068359376,\"y\":72.42794036865235,\"z\":63.42919158935547}', 'Wo bist du? Ich brauche deinen Stoff, komm zu mir!'),
(20, '{\"x\":-1089.6529541015626,\"y\":-303.50421142578127,\"z\":37.64749908447265}', 'Hast du noch etwas Ware für mich? Komm zu mir!'),
(21, '{\"x\":67.83145904541016,\"y\":-582.4771728515625,\"z\":31.6286506652832}', 'Ich will mal abschalten, komm zu mir!'),
(22, '{\"x\":508.6759948730469,\"y\":-609.5554809570313,\"z\":24.75115013122558}', 'Mein Lieblingsdealer, hast du ein bisschen Stoff für mich? Komm zu mir!'),
(23, '{\"x\":460.6315002441406,\"y\":-761.1773071289063,\"z\":27.35788917541504}', 'Hast du noch etwas Ware für mich? Komm zu mir!'),
(24, '{\"x\":469.0552062988281,\"y\":-585.181396484375,\"z\":28.49962997436523}', 'Ich will mal abschalten, komm zu mir!'),
(25, '{\"x\":188.4803924560547,\"y\":-446.4894104003906,\"z\":41.65034103393555}', 'Hast du noch magische Ware? Komm zu mir, ich weiß, ich kann auf dich zählen!'),
(26, '{\"x\":-113.11299896240235,\"y\":-603.218994140625,\"z\":36.28079986572265}', 'Ich brauche deinen Stoff, komm zu diesem Ort!'),
(27, '{\"x\":171.55740356445313,\"y\":-1235.2259521484376,\"z\":29.31716918945312}', 'Mein Lieblingsdealer, hast du ein bisschen Stoff für mich? Komm zu mir!'),
(28, '{\"x\":168.8957061767578,\"y\":-1074.22900390625,\"z\":29.19271087646484}', 'Hey, ich habe gerade deinen Kontakt bekommen, komm zu mir!'),
(29, '{\"x\":-1026.3599853515626,\"y\":-490.5504150390625,\"z\":36.95706939697265}', 'Ich habe ein Bündel Geld für dich, komm zu mir!'),
(30, '{\"x\":-1187.1409912109376,\"y\":-561.4119262695313,\"z\":27.69302940368652}', 'Hast du noch etwas Ware für mich? Komm zu mir!'),
(31, '{\"x\":-1625.845947265625,\"y\":-1013.4970092773438,\"z\":13.14282989501953}', 'Ich will mal abschalten, komm zu mir!'),
(32, '{\"x\":-1478.70703125,\"y\":-1007.2210083007813,\"z\":6.27883720397949}', 'Hey, ich habe gerade deinen Kontakt bekommen, komm zu mir!'),
(33, '{\"x\":-1366.8370361328126,\"y\":-1118.6409912109376,\"z\":4.4401888847351}', 'Ich habe ein Bündel Geld für dich, komm zu mir!'),
(34, '{\"x\":-1307.5059814453126,\"y\":-1310.718017578125,\"z\":4.88076877593994}', 'Ich will mal abschalten, komm zu mir!'),
(35, '{\"x\":-1249.5250244140626,\"y\":-1432.083984375,\"z\":4.32881879806518}', 'Ich brauche deinen Stoff, komm zu diesem Ort!'),
(36, '{\"x\":-1105.416015625,\"y\":-1289.6519775390626,\"z\":5.40987110137939}', 'Ich will mal abschalten, komm zu mir!'),
(37, '{\"x\":-862.0740966796875,\"y\":-1225.4300537109376,\"z\":6.1647138595581}', 'Mein Lieblingsdealer, hast du ein bisschen Stoff für mich? Komm zu mir!'),
(38, '{\"x\":-770.1005859375,\"y\":-1068.8199462890626,\"z\":11.83907032012939}', 'Hey, ich habe gerade deinen Kontakt bekommen, komm zu mir!'),
(39, '{\"x\":-798.7150268554688,\"y\":372.9659118652344,\"z\":87.87606048583985}', 'Ich habe ein Bündel Geld für dich, komm zu mir!'),
(40, '{\"x\":-612.0228881835938,\"y\":333.997802734375,\"z\":85.1166763305664}', 'Hast du noch etwas Ware für mich? Komm zu mir!'),
(41, '{\"x\":-7.89298391342163,\"y\":-575.7495727539063,\"z\":37.74507904052734}', 'Wo bist du? Ich brauche deinen Stoff, komm zu mir!'),
(42, '{\"x\":295.7923889160156,\"y\":-569.9384765625,\"z\":43.26082992553711}', 'Hast du noch magische Ware? Komm zu mir, ich weiß, ich kann auf dich zählen!'),
(43, '{\"x\":382.614501953125,\"y\":-344.03131103515627,\"z\":46.81528091430664}', 'Mein Lieblingsdealer, hast du ein bisschen Stoff für mich? Komm zu mir!'),
(44, '{\"x\":274.8113098144531,\"y\":-326.7182922363281,\"z\":44.91986083984375}', 'Hey, ich habe gerade deinen Kontakt bekommen, komm zu mir!'),
(45, '{\"x\":182.42529296875,\"y\":-183.635498046875,\"z\":54.1486701965332}', 'Ich habe ein Bündel Geld für dich, komm zu mir!'),
(46, '{\"x\":-29.66706085205078,\"y\":-92.48367309570313,\"z\":57.25431060791015}', 'Ich will mal abschalten, komm zu mir!'),
(47, '{\"x\":-359.9700012207031,\"y\":79.45751190185547,\"z\":63.18901824951172}', 'Hast du noch etwas Ware für mich? Komm zu mir!'),
(48, '{\"x\":-275.6081848144531,\"y\":201.5198974609375,\"z\":85.69867706298828}', 'Mein Lieblingsdealer, hast du ein bisschen Stoff für mich? Komm zu mir!'),
(49, '{\"x\":-448.37420654296877,\"y\":177.04269409179688,\"z\":75.20374298095703}', 'Hey, ich habe gerade deinen Kontakt bekommen, komm zu mir!'),
(50, '{\"x\":-499.0154113769531,\"y\":58.75120162963867,\"z\":56.49613189697265}', 'Ich habe ein Bündel Geld für dich, komm zu mir!');

-- --------------------------------------------------------

--
-- Structure de la table `illegal_laboratory`
--

CREATE TABLE `illegal_laboratory` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `type` longtext DEFAULT NULL,
  `interior` longtext DEFAULT NULL,
  `owner` longtext DEFAULT NULL,
  `pos` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  `weight` float NOT NULL DEFAULT 0.3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `rare`, `can_remove`, `weight`) VALUES
('12gauge', '12mm Munition', 0, 1, 0.1),
('556mm', '5.56mm Munition', 0, 1, 0.1),
('5fromages', 'Pizza mit 5 Käsesorten', 0, 1, 0.3),
('68kal', 'Kal.68 Munition', 0, 1, 0.1),
('762mm', '7.62mm Munition', 0, 1, 0.1),
('9mm', '9mm Munition', 0, 1, 0.1),
('accesscard', 'Zugangskarte', 0, 1, 0.3),
('advancedrifle', 'Fortschrittliches Bullpup-Gewehr', 0, 1, 3.5),
('aks74u', 'AKS-74U', 0, 1, 3),
('alive_chicken', 'Lebendes Huhn', 0, 1, 0.3),
('ananas', 'Ananas', 0, 1, 0.3),
('anchois', 'Sardelle', 0, 0, 0),
('anchor', 'Schiffsanker', 0, 0, 10),
('appistol', 'FN Five-Seven', 0, 1, 1.5),
('ar15', 'AR-15', 0, 1, 4),
('assaultrifle', 'AK-47 Sturmgewehr', 0, 1, 4),
('assaultrifle_mk2', 'MK2 Sturmgewehr', 0, 1, 4),
('assaultshotgun', 'Sturm-Schrotflinte', 0, 1, 4),
('assaultsmg', 'P90', 0, 1, 3),
('autoshotgun', 'Automatische Schrotflinte', 0, 1, 4),
('ball', 'Ball', 0, 1, 0.3),
('ball_ammo', 'Ball-Box', 0, 1, 0),
('bandage', 'Verband', 0, 1, 0.3),
('bar', 'Bar', 0, 1, 0.3),
('barbecue', 'Barbecue-Pizza', 0, 1, 0.3),
('bat', 'Baseballschläger', 0, 1, 2.5),
('battleaxe', 'Streitaxt', 0, 1, 3),
('belini', 'Bellini', 0, 1, 0.3),
('bierepleine', 'Vollbier', 0, 1, 0.3),
('bierevide', 'Leere Bierflasche', 0, 1, 0.3),
('bijoux', 'Schmuck', 0, 1, 0.3),
('bird_crap_ammo', 'Vogelkot-Munition', 0, 1, 0.1),
('black_phone', 'Schwarzes Telefon', 0, 1, 10),
('blowpipe', 'Lötlampe', 0, 1, 0.3),
('blowtorch', 'Lötbrenner', 0, 1, 0.3),
('blue_phone', 'Blaues Telefon', 0, 1, 0.3),
('bmx', 'BMX', 0, 1, 0.5),
('bodycam', 'Bodycam', 0, 1, 0.3),
('bolcacahuetes', 'Erdnussschale', 0, 1, 0.3),
('bolchips', 'Chips-Schale', 0, 1, 0.3),
('bolnoixcajou', 'Cashew-Schale', 0, 1, 0.3),
('bolpistache', 'Pistazien-Schale', 0, 1, 0.3),
('bottle', 'Flasche', 0, 1, 0.3),
('boulon', 'Bolzen', 0, 1, 0.3),
('boulonneuse', 'Schlagschrauber', 0, 1, 0.3),
('bouteilleremplie', 'Gefüllte Flasche', 0, 1, 0.3),
('boutilletvide', 'Leere Flasche', 0, 1, 0.3),
('bread', 'Brot', 0, 1, 0.3),
('bren', 'Bren-Maschinengewehr', 0, 1, 5),
('brochette', 'Holzspieß', 0, 1, 0.3),
('bullpuprifle', 'Bullpup-Gewehr', 0, 1, 3.5),
('bullpuprifle_mk2', 'Bullpup MK2-Gewehr', 0, 1, 3.5),
('bullpupshotgun', 'Bullpup-Schrotflinte', 0, 1, 4),
('burgershot_bacon', 'Speck', 0, 1, 1),
('burgershot_biere', 'Bier', 0, 1, 1),
('burgershot_burger', 'Burger', 0, 1, 2),
('burgershot_cheddar', 'Cheddar', 0, 1, 1),
('burgershot_chesseburger', 'Cheeseburger', 0, 1, 2),
('burgershot_coca', 'Coca Cola', 0, 1, 1),
('burgershot_cookie', 'Keks', 0, 1, 1),
('burgershot_frite', 'Pommes', 0, 1, 1),
('burgershot_milkshake', 'Milkshake', 0, 1, 1),
('burgershot_oignonrings', 'Zwiebelringe', 0, 1, 1),
('burgershot_pain', 'Burgerbrot', 0, 1, 0.3),
('burgershot_painburger', 'Burgerbrot', 0, 1, 1),
('burgershot_poulet', 'Chicken Nuggets', 0, 1, 1),
('burgershot_salade', 'Salat', 0, 1, 1),
('burgershot_sprite', 'Sprite', 0, 1, 1),
('burgershot_tomate', 'Tomate', 0, 1, 1),
('burgershot_viandeburger', 'Burgerfleisch', 0, 1, 1),
('bzgas', 'Tränengas', 0, 1, 1),
('c4_bank', 'C4-Sprengsatz', 0, 1, 0.3),
('cabillaud', 'Kabeljau', 0, 0, 0),
('cacahuete', 'Erdnuss', 0, 1, 0.3),
('cagoule', 'Sturmhaube', 0, 1, 0.1),
('caissepleine', 'Volle Kiste', 0, 1, 0.3),
('caissevide', 'Leere Kiste', 0, 1, 0.3),
('calzone', 'Calzone-Pizza', 0, 1, 0.3),
('canette', 'Dose', 0, 1, 0.3),
('canettefondue', 'Zerdrückte Dose', 0, 1, 0.3),
('canettepropre', 'Saubere Dose', 0, 1, 0.3),
('canneapeche', 'Angelrute', 0, 0, 0),
('canneapechecarbonne', 'Carbon-Angelrute', 0, 0, 0),
('canneapecheoretcarbonne', 'Gold-Carbon Angelrute', 0, 0, 0),
('cappuccino', 'Cappuccino', 0, 1, 0.3),
('caprisun', 'Capri-Sun', 0, 1, 0.3),
('carassin', 'Karas', 0, 0, 0),
('carbinerifle', 'M4 Karabiner', 0, 1, 3.5),
('carbinerifle_mk2', 'M4 Karabiner MK2', 0, 1, 3.5),
('carokit', 'Karosserie-Kit', 0, 1, 0.3),
('carotool', 'Karosserie-Werkzeuge', 0, 1, 0.3),
('carpecommune', 'Karpfen (gewöhnlich)', 0, 0, 0),
('carpekoi', 'Koi-Karpfen', 0, 0, 0),
('carpemiroir', 'Spiegelkarpfen', 0, 0, 0),
('carrosserie', 'Karosserie', 0, 1, 0.3),
('cartesecu', 'Zugangskarte für Panel 11441188', 0, 1, 0.3),
('casino_beer', 'Casino Bier', 0, 1, -1),
('casino_burger', 'Burger', 0, 1, -1),
('casino_chips', 'Casino Chips', 0, 1, -1),
('casino_coffee', 'Casino Kaffee', 0, 1, -1),
('casino_coke', 'Casino Kofola', 0, 1, -1),
('casino_donut', 'Casino Donut', 0, 1, -1),
('casino_ego_chaser', 'Casino Ego Chaser', 0, 1, -1),
('casino_luckypotion', 'Casino Glückstrank', 0, 1, -1),
('casino_psqs', 'Casino Ps & Qs', 0, 1, -1),
('casino_sandwitch', 'Casino Sandwich', 0, 1, -1),
('casino_sprite', 'Casino Sprite', 0, 1, -1),
('caviar', 'Kaviar', 0, 1, 0.3),
('cement', 'Zement', 0, 1, 0.6),
('cerf', 'Hirsch', 0, 1, 0.3),
('chaine', 'Motorradkette', 0, 1, 0.3),
('chevreuil', 'Reh', 0, 1, 0.3),
('chiffon', 'Lappen', 0, 1, 0.3),
('chou', 'Kohl', 0, 1, 0.3),
('ciseaux', 'Schere', 0, 1, 0.1),
('citron', 'Zitrone', 0, 1, 0.3),
('classic_phone', 'Klassisches Telefon', 0, 1, 10),
('cles', 'Fahrzeugschlüssel', 0, 1, 0.3),
('clip', 'Magazin', 0, 1, 0.3),
('coca', 'Coca-Cola', 0, 1, 0.3),
('coca_blend', 'Coca-Mischung', 0, 1, 1),
('coca_leaf', 'Coca-Blatt exotisch', 0, 1, 1),
('coca_paste', 'Coca-Paste', 0, 1, 1),
('cocktailmaison', 'Hausgemachter Cocktail', 0, 1, 0.3),
('coco', 'Kokosnuss', 0, 1, 0.3),
('cokepure', 'Reines Kokain', 0, 1, 1),
('coke_pooch', 'Tüte Kokain', 0, 1, 1),
('colis', 'Paket', 0, 1, 0.3),
('combatmg', 'Combat MG', 0, 1, 4),
('combatmg_mk2', 'Combat MG MK2', 0, 1, 4),
('combatpdw', 'SIG Sauer MPX', 0, 1, 0.3),
('combatpistol', 'Glock 17', 0, 1, 1.5),
('combatpistolpol', 'Combat Pistol Polizei', 0, 1, 2),
('compactlauncher', 'Kompakter M79 Granatwerfer', 0, 1, 4),
('compo', 'Bauteile', 0, 1, 0.3),
('contrat', 'Vertrag', 0, 1, 0.3),
('contratlocation', 'Mietvertrag', 0, 1, 0.3),
('contratvente', 'Kaufvertrag', 0, 1, 0.3),
('copper', 'Kupfer', 0, 1, 0.3),
('crepe', 'Crêpe', 0, 1, 0.3),
('crick', 'Wagenheber', 0, 1, 0.3),
('crochetage_kit', 'Lockpicking-Kit', 0, 0, 1),
('crowbar', 'Brecheisen', 0, 1, 2.5),
('dagger', 'Dolch', 0, 1, 1),
('dashcam', 'Dashcam', 0, 1, 0.3),
('diamant', 'Diamant', 0, 1, 0.3),
('diamond', 'Diamant', 0, 1, 0.3),
('digiscanner', 'Digiscanner', 0, 1, 0.3),
('dorade', 'Dorade', 0, 1, 0.3),
('doubleaction', 'Double Action', 0, 1, 2),
('doublebarrel', 'Doppelrohr-Flinte', 0, 1, 4),
('douce_lures', 'Süßwasser-Köder', 0, 0, 0),
('drill', 'Bohrer', 0, 1, 1),
('drink_burgershot', 'BurgerShot Getränk', 0, 1, 0.1),
('driver_license', 'Führerschein', 0, 1, 1),
('drpepper', 'Dr. Pepper', 0, 1, 0.3),
('elixir', 'Elixier', 0, 1, 0.3),
('elixirblanco', 'Weißes Elixier', 0, 1, 0.3),
('enceinte', 'Lautsprecher', 0, 1, 0.3),
('enemy_laser_ammo', 'Munition für Feindlaser', 0, 1, 0.1),
('energy', 'Energy Drink', 0, 1, 0.3),
('eperlant', 'Eperlan (kleiner Fisch)', 0, 0, 0),
('fakebankingcard', 'Gefälschte Bankkarte', 0, 1, 0.3),
('fake_id_card', 'Gefälschter Personalausweis', 0, 1, 1),
('fake_job_card', 'Gefälschter Berufsausweis', 0, 1, 1),
('fanta', 'Fanta', 0, 1, 0.3),
('ferraille', 'Schrott', 0, 1, 0.3),
('feuillechanvre', 'Hanfblatt', 0, 1, 0.5),
('feuillecoca', 'Coca-Blatt', 0, 1, 0.05),
('fichelocation', 'Mietvertrag (Papier)', 0, 1, 0.3),
('fichenotaire', 'Notarvertrag', 0, 1, 0.3),
('fireaxe', 'Feuerwehraxt', 0, 1, 2),
('fireextinguisher', 'Feuerlöscher', 0, 1, 3),
('fireextinguisher_ammo', 'Feuerlöschmittel', 0, 1, 0.1),
('firework', 'Feuerwerk', 0, 1, 1),
('fish', 'Fisch', 0, 1, 0.3),
('fishbait', 'Fischköder', 0, 1, 0.3),
('fishingrod', 'Angel', 0, 1, 0.3),
('fixkit', 'Reparatur-Kit', 0, 1, 0.3),
('fixtool', 'Reparatur-Werkzeuge', 0, 1, 0.3),
('flare', 'Leuchtfackel', 0, 1, 1),
('flaregun', 'Signalpistole', 0, 1, 1),
('flare_ammo', 'Leuchtfackeln (Munition)', 0, 1, 0.1),
('flashlight', 'Taschenlampe', 0, 1, 1),
('fn509', 'FN 509', 0, 1, 2),
('frite', 'Pommes Frites', 0, 3, 0.3),
('fromage', 'Käseportion', 0, 1, 0.3),
('g17gen5', 'Glock 17 Gen 5', 0, 1, 2),
('g17neonoir', 'Glock 17 Neon Schwarz', 0, 1, 2),
('galette', 'Galette', 0, 1, 0.3),
('garbagebag', 'Müllsack', 0, 1, 0.3),
('garniture', 'Taco-Beilage', 0, 1, 0.3),
('gasoline', 'Benzin', 0, 1, 0.1),
('gateauxchance', 'Glückskuchen', 0, 1, 0.3),
('gazbottle', 'Gasflasche', 0, 1, 0.3),
('gigatacos', 'Giga Tacos', 0, 1, 0.3),
('gigatacosfroid', 'Giga Tacos kalt', 0, 1, 0.3),
('gitanes', 'Gitanes (Zigarettenmarke)', 0, 1, 0.3),
('glacealitalienne', 'Italienisches Eis', 0, 1, 0.3),
('glitchpopvandal', 'Glitchpop Vandal', 0, 1, 4),
('gobeletcoca', 'Coca-Becher', 0, 1, 0.3),
('gobeletdecoca', 'Coca-Becher', 0, 1, 0.3),
('gobeletdehawai', 'Hawai-Becher', 0, 1, 0.3),
('gobeletdeicetea', 'Eistee-Becher', 0, 1, 0.3),
('gobeletfanta', 'Fanta-Becher', 0, 1, 0.3),
('gobeleticetea', 'Eistee-Becher', 0, 1, 0.3),
('gobeletlimonade', 'Limonaden-Becher', 0, 1, 0.3),
('gobeletoasis', 'Oasis-Becher', 0, 1, 0.3),
('gobeletorange', 'Orangen-Becher', 0, 1, 0.3),
('gobeletorangina', 'Orangina-Becher', 0, 1, 0.3),
('gobeletpied', 'Becher mit Stiel', 0, 1, 0.3),
('gobeletsake', 'Sake-Becher', 0, 1, 0.3),
('gobeletsheps', 'Sheps-Becher', 0, 1, 0.3),
('gobelettropicana', 'Tropicana-Becher', 0, 1, 0.3),
('gobeletvide', 'Leerer Becher', 0, 1, 0.3),
('gobeletvolvic', 'Volvic-Becher', 0, 1, 0.3),
('gold', 'Gold', 0, 1, 0.3),
('goldbar', 'Goldbarren', 0, 1, 0.3),
('goldnecklace', 'Goldkette', 0, 1, 0.3),
('goldwatch', 'Goldene Uhr', 0, 1, 0.3),
('gold_phone', 'Golden Phone', 0, 1, 10),
('golem', 'Golem', 0, 1, 0.3),
('golfclub', 'Golfschläger', 0, 1, 2.5),
('grandefrite', 'Große Pommes', 0, 1, 0.3),
('grandefroidfrite', 'Große kalte Pommes', 0, 1, 0.3),
('grand_cru', 'Großer Jahrgang', 0, 1, 0.3),
('grapperaisin', 'Weintraube', 0, 1, 0.3),
('greenlight_phone', 'Green Light Phone', 0, 1, 10),
('green_phone', 'Grünes Telefon', 0, 1, 0.3),
('grenade', 'Granate', 0, 1, 1),
('grenadelauncher', 'Granatwerfer', 0, 1, 4),
('grenadelauncher_ammo', 'Granatwerfer-Munition', 0, 1, 0.1),
('grenadelauncher_smoke_ammo', 'Rauchgranaten für Granatwerfer', 0, 1, 0.1),
('gusenberg', 'Gusenberg Sweeper', 0, 1, 3.5),
('gzgas_ammo', 'Reizgas-Munition', 0, 1, 0.1),
('hackerDevice', 'Hacker Gerät', 0, 1, 0.3),
('hack_laptop', 'Laptop', 1, 1, 1),
('hack_phone', 'Jailbreak Telefon', 0, 1, 1),
('hammer', 'Hammer', 0, 1, 2),
('hammerwirecutter', 'Hammer und Drahtschneider', 0, 1, 0.3),
('handcuffs', 'Handschellen', 0, 1, 1),
('hareng', 'Hering', 0, 0, 0),
('haschich', 'Haschisch', 0, 1, 0.3),
('haschich_pooch', 'Haschisch', 0, 1, 0.3),
('hashish', 'Hashish', 0, 1, 0.7),
('hashish_pooch', 'Haschischbeutel', 0, 1, 1),
('hatchet', 'Beil', 0, 1, 0.3),
('heavypistol', 'Schwere Pistole', 0, 1, 2),
('heavyshotgun', 'Saiga-12K', 0, 1, 0.3),
('heavysniper', 'Schweres Scharfschützengewehr', 0, 1, 4),
('heavysniper_mk2', 'Schweres Scharfschützengewehr MK2', 0, 1, 4),
('heineken', 'Heineken', 0, 1, 0.3),
('hk416', 'HK 416', 0, 1, 3),
('hkump', 'HK UMP', 0, 1, 3),
('hominglauncher', 'Lenkraketenwerfer', 0, 1, 4),
('honeybadgercod', 'Honey Badger (COD)', 0, 1, 4),
('hornys_glace', 'Eis', 0, 1, 0.3),
('hydrochloric_acid', 'Salzsäure', 0, 1, 0.1),
('ice', 'Eiswürfel', 0, 1, 0.3),
('icetea', 'Eistee', 0, 1, 0.3),
('idcard', 'Personalausweis', 0, 0, 0),
('id_card', 'Personalausweis', 0, 1, 1),
('id_card_f', 'Bösartige Zugangskarte', 3, 1, 0.3),
('ing', 'Pizzazutat', 0, 1, 0.3),
('iron', 'Eisen', 0, 1, 0.3),
('jager', 'Jägermeister', 0, 1, 0.3),
('jagerbomb', 'Jägerbomb', 0, 1, 0.3),
('jagercerbere', 'Jäger Cerbère', 0, 1, 0.3),
('jaguar', 'Jaguar', 0, 1, 0.3),
('jewels', 'Schmuck', 0, 1, 0.3),
('job_card', 'Berufsausweis', 0, 1, 1),
('jumelles', 'Fernglas', 0, 1, 0.3),
('jusfruit', 'Fruchtsaft', 0, 1, 0.3),
('jus_raisin', 'Wein', 0, 1, 0.3),
('karambitknife', 'Karambit-Messer', 0, 1, 1),
('katana', 'Katana', 0, 1, 1),
('kevlar', 'Kevlar', 0, 1, 0.3),
('kevlarlow', 'Beschädigtes Kevlar', 0, 1, 0.3),
('kevlarmid', 'Gebrauchtes Kevlar', 0, 1, 0.3),
('kitcarro', 'Karosserie-Kit', 0, 1, 0.3),
('kitmoteur', 'Motorkit', 0, 1, 0.3),
('knife', 'Messer', 0, 1, 1),
('knuckle', 'Schlagring', 0, 1, 0.3),
('kq_acetone', 'Aceton', 0, 1, 2),
('kq_ammonia', 'Ammoniak', 0, 1, 2),
('kq_ethanol', 'Ethanol', 0, 1, 0.1),
('kq_lithium', 'Lithium-Pack', 0, 1, 0.3),
('kq_meth_high', 'Methamphetamin (hohe Qualität)', 0, 1, 1),
('kq_meth_lab_kit', 'Kochset', 0, 1, 5),
('kq_meth_low', 'Methamphetamin (niedrige Qualität)', 0, 1, 1),
('kq_meth_mid', 'Methamphetamin (mittlere Qualität)', 0, 1, 1),
('kq_meth_pills', 'Pseudoephedrin', 0, 1, 0.4),
('lapin', 'Kaninchen', 0, 1, 0.3),
('letter', 'Brief', 0, 1, 0.3),
('lieu', 'Ort', 0, 1, 0.3),
('limonade', 'Limonade', 0, 1, 0.3),
('lockpick', 'Dietrich', 0, 1, 0.3),
('loup', 'Wolf', 0, 1, 0.3),
('m6ic', 'M6 IC', 0, 1, 4),
('m9a3', 'M9A3 Pistole', 0, 1, 2),
('m9bayonnetlore', 'M9 Bayonet Lore', 0, 1, 1),
('machete', 'Machete', 0, 1, 0.3),
('machinepistol', 'TEC-9', 0, 1, 0.3),
('macro', 'Makro', 0, 1, 0.3),
('maille', 'Kettengeflecht', 0, 1, 0.3),
('malboro', 'Marlboro', 0, 1, 0.3),
('mangoloco', 'Mangoloco', 0, 1, 0.3),
('marksmanpistol', 'Thompson-Center Contender G2', 0, 1, 0.3),
('marksmanrifle', 'Scharfschützengewehr', 0, 1, 4),
('marksmanrifle_mk2', 'Scharfschützengewehr MK2', 0, 1, 4),
('martini', 'Martini weiß', 0, 1, 0.3),
('mcxspear', 'MCX Spear', 0, 1, 4),
('mdma', 'MDMA', 0, 1, 0.3),
('medikit', 'Medikit', 0, 1, 0.3),
('melted_steel', 'Geschmolzener Stahl', 0, 1, 0.3),
('menthe', 'Minzblatt', 0, 1, 0.3),
('mer_lures', 'Salzwasserköder', 0, 0, 0),
('meth', 'Meth', 0, 1, 0.3),
('methpure', 'Reines Methamphetamin', 0, 1, 1),
('meth_pooch', 'Methbeutel', 0, 1, 0.3),
('metreshooter', 'Shooter-Meter', 0, 1, 0.3),
('mg', 'MG-Maschinengewehr', 0, 1, 4),
('mg_ammo', 'MG-Munition', 0, 1, 0),
('microsmg', 'Micro-Uzi', 0, 1, 2),
('minigun', 'Minigun', 0, 1, 4),
('minigun_ammo', 'Minigun-Munition', 0, 1, 0.1),
('minismg', 'Mini-Uzi', 0, 1, 2),
('mixapero', 'Aperitif-Mix', 0, 1, 0.3),
('mochi', 'Mochi', 0, 1, 0.3),
('mojito', 'Mojito', 0, 1, 0.3),
('molotov', 'Molotow-Cocktail', 0, 1, 1.5),
('molotov_ammo', 'Molotow-Munition', 0, 1, 0.1),
('morgane', 'Captain Morgane', 0, 1, 0.3),
('moteur', 'Motor', 0, 1, 0.3),
('moyennefrite', 'Mittlere Pommes', 0, 1, 0.3),
('moyennefroidfrite', 'Mittlere kalte Pommes', 0, 1, 0.3),
('mp5sdfm', 'MP5 SD Full Metal', 0, 1, 3),
('musket', 'Musket', 0, 1, 3.5),
('neonbox', 'Neon-Box', 0, 1, 1),
('neoncontroller', 'Neon-Controller', 0, 1, 1),
('nightstick', 'Schlagstock', 0, 1, 2),
('nightvision', 'Nachtsichtgerät', 0, 1, 2),
('nioki', 'Lustukru Gnocchi', 0, 1, 0.3),
('nitrovehicle', 'Nitro', 0, 1, 0.3),
('nouille', 'Nudelportion', 0, 1, 0.3),
('oblivionPill', 'Vergessen-Pille', 0, 1, 0.3),
('ocean_lures', 'Tiefsee-Köder', 0, 0, 0),
('okonomiyaki', 'Okonomiyaki', 0, 1, 0.3),
('opium', 'Opium', 0, 1, 0.3),
('opium_pooch', 'Beutel Opium', 0, 1, 0.3),
('orange', 'Orange', 0, 1, 0.3),
('orientale', 'Orientalische Pizza', 0, 1, 0.3),
('pacific_brochettes', 'Fruchtspieße', 0, 1, 0.3),
('pacific_chips', 'Kochbananen-Chips', 0, 1, 0.3),
('pacific_coco', 'Kokoswasser', 0, 1, 0.3),
('pacific_margarita', 'Margarita ', 0, 1, 0.3),
('pacific_mojito', 'Mojito ', 0, 1, 0.3),
('pacific_pina', 'Piña Colada', 0, 1, 0.3),
('pacific_smoothie', 'Tropischer Smoothie', 0, 1, 0.3),
('packaged_chicken', 'Verpacktes Hähnchen', 0, 1, 0.3),
('papierblanc', 'Weißes Papier', 0, 1, 0.3),
('papiermache', 'Pappmaché', 0, 1, 0.3),
('parachute', 'Fallschirm', 0, 1, 3),
('pastis', 'Pastis', 0, 1, 0.3),
('pate', 'Pizzateig', 0, 1, 0.3),
('pattecuite', 'Gebackener Pizzateig', 0, 1, 0.3),
('pc', 'Pc', 0, 1, 0.3),
('pearls_crevette', 'Garnele', 0, 1, 0.3),
('pearls_fish', 'Fisch', 0, 1, 0.3),
('pearls_fishandchips', 'Fish and Chips', 0, 1, 0.3),
('pearls_frite', 'Pommes', 0, 1, 0.3),
('pearls_moule', 'Muschel', 0, 1, 0.3),
('pearls_moulefrite', 'Miesmuscheln mit Pommes', 0, 1, 0.3),
('pepsi', 'Pepsi', 0, 1, 0.3),
('petitefrite', 'Kleine Pommes', 0, 1, 0.3),
('petitefroidfrite', 'Kleine kalte Pommes', 0, 1, 0.3),
('petrolcan', 'Benzinkanister', 0, 1, 4),
('phone', 'Telefon', 0, 1, 0.3),
('phone_hack', 'Telefon-Hackmodul', 0, 1, 10),
('phone_module', 'Telefon-Modul', 0, 1, 10),
('phosphorerouge', 'Roter Phosphor', 0, 1, 0.2),
('pibwasser', 'Pißwasser', 0, 1, 0.3),
('pince', 'Zange', 0, 1, 0.3),
('pink_phone', 'Pinkes Telefon', 0, 1, 10),
('pipebomb', 'Rohrbombe', 0, 1, 2.5),
('pistol', 'Beretta', 0, 1, 1.5),
('pistol50', 'Desert Eagle', 0, 1, 2),
('pistolxm3', 'Pistole XM3', 0, 1, 2),
('pistol_ammo', 'Pistolenmunition', 0, 1, 0),
('pistol_mk2', 'Pistole Sig Sauer P226 MK2', 0, 1, 1.5),
('pizza', 'Pizza', 0, 1, 0.3),
('pizzapate', 'Pizzateig', 0, 1, 0.3),
('pizzasavoyarde', ' Savoyer Pizza', 0, 1, 0.3),
('plane_rocket_ammo', 'Raketenmunition für Flugzeuge', 0, 1, 0.1),
('player_laser_ammo', 'Spieler-Lasermunition', 0, 1, 0.1),
('pneu', 'Reifen', 0, 1, 0.3),
('pochon_meth', 'Beutel Meth', 0, 1, 0.3),
('pochon_opium', 'Beutel Opium', 0, 1, 0.3),
('pochon_weed', 'Beutel Weed', 0, 1, 0.3),
('poisson', 'Fischportion', 0, 35, 0.3),
('poissonchat', 'Wels', 0, 0, 0),
('poolcue', 'Billardqueue', 0, 1, 2),
('poolreceipt', 'Pool-Quittung', 0, 1, 0.3),
('pops_donut', 'Donut', 0, 1, 0.3),
('pops_granité', 'Eisgetränk', 0, 1, 0.3),
('pops_hotdog', 'Hot Dog', 0, 1, 0.3),
('pops_sauce', 'Soße', 0, 1, 0.3),
('pops_saucisse', 'Wurst', 0, 1, 0.3),
('porc', 'Schweinefleischportion', 0, 35, 0.3),
('potatos', 'Kartoffeltaschen', 0, 5, 0.3),
('poulet', 'Hähnchenportion', 0, 35, 0.3),
('powerbank', 'Powerbank', 0, 1, 10),
('produitchimique', 'Chemisches Produkt', 0, 1, 0.3),
('proxmine', 'Annäherungsmine', 0, 1, 1.5),
('pumpshotgun', 'Pumpgun', 0, 1, 4),
('pumpshotgun_mk2', 'Pumpgun MK2', 0, 1, 4),
('pure_meth_pills', 'Reines Pseudoephedrin', 0, 1, 0.4),
('raie', 'Rochen', 0, 1, 0.3),
('railgun', 'Railgun', 0, 1, 4),
('raisin', 'Traube', 0, 1, 0.3),
('ramen', ' Ramen', 0, 1, 0.3),
('raspberry', 'Himbeere', 0, 1, 0.3),
('reco_burgershot', 'Brötchen', 0, 1, 0.3),
('reco_ferrailleur', 'Verrostetes Altmetall', 0, 1, 0.3),
('reco_petitpecheur', 'Frischer Fisch', 0, 1, 0.3),
('reco_tabac', 'Tabak', 0, 1, 0.3),
('reco_vigneron', 'Traube', 0, 1, 0.3),
('red_phone', 'Rotes Telefon', 0, 1, 10),
('reine', 'Pizza Königin', 0, 1, 0.3),
('remotesniper', 'Ferngesteuertes Scharfschützengewehr', 0, 1, 4),
('repairkit', 'Reparaturset', 0, 1, 0.3),
('requin', 'Hai', 0, 0, 0),
('revolver', 'Schwerer Revolver', 0, 1, 2.5),
('revolver_mk2', 'Revolver MK2', 0, 1, 2.5),
('rhum', 'Rum', 0, 1, 0.3),
('rhumcoca', 'Rum-Cola', 0, 1, 0.3),
('rhumfruit', 'Rum mit Fruchtsaft', 0, 1, 0.3),
('ricard', 'Ricard', 0, 1, 0.3),
('rifle_ammo', 'Gewehrmunition', 0, 1, 0),
('riz', 'Reisportion', 0, 1, 0.3),
('rpg', 'RPG', 0, 1, 4),
('rpg_ammo', 'RPG-Munition', 0, 1, 0.1),
('sac_poubelle', 'Müllsack', 0, 1, 0.2),
('salami', 'Salami', 0, 1, 0.3),
('sanglier', 'Wildschwein', 0, 1, 0.3),
('sardine', 'Sardine', 0, 1, 0.3),
('sauce', 'Saucenportion', 0, 1, 0.3),
('saucisson', 'Wurst', 0, 1, 0.3),
('saumon', 'Lachs', 0, 1, 0.3),
('saumons', 'Lachs-Pizza', 0, 1, 0.3),
('sawnoffshotgun', 'Abgesägte Schrotflinte', 0, 1, 3.5),
('scar17fm', 'SCAR 17 Vollmetall', 0, 1, 4),
('secure_card', 'Sichere ID-Karte', 3, 1, 0.3),
('sfrites', 'Tiefkühl-Pommes-Tüte', 0, 1, 0.3),
('shark', 'Hai', 0, 1, 0.3),
('shisha', 'Shisha', 0, 1, 0.3),
('shotgun_ammo', 'Schrotflintenmunition', 0, 1, 0),
('silure', 'Wels', 0, 0, 0),
('sim', 'SIM-Karte', 0, 1, 0.3),
('siredward', 'Sir Edward', 0, 1, 0.3),
('slaughtered_chicken', 'Geschlachtetes Huhn', 0, 1, 0.3),
('sledgehammer', 'Vorschlaghammer', 0, 1, 4),
('smg', 'MP5 Maschinenpistole', 0, 1, 3),
('smg_ammo', 'Maschinenpistolenmunition', 0, 1, 0),
('smg_mk2', 'MP MK2', 0, 1, 3),
('smokegrenade', 'Rauchgranate', 0, 1, 1),
('smokegrenade_ammo', 'Rauchgranatenmunition', 0, 1, 0.1),
('sniperrifle', 'Scharfschützengewehr', 0, 1, 4),
('sniper_ammo', 'Scharfschützenmunition', 0, 1, 0.1),
('sniper_remote_ammo', 'Munition für ferngesteuertes Scharfschützengewehr', 0, 1, 0.1),
('snowball', 'Schneeball', 0, 1, 0.5),
('snspistol', 'SNS-Pistole', 0, 1, 1.5),
('snspistol_mk2', 'SNS-Pistole MK2', 0, 1, 1.5),
('soda', 'Limonade', 0, 1, 0.3),
('sole', 'See-Zunge', 0, 0, 0),
('soudeuse', 'Schweißgerät', 0, 1, 0.3),
('space_rocket_ammo', 'Raumraketenmunition', 0, 1, 0.1),
('specialcarbine', 'Spezialkarabiner', 0, 1, 3.5),
('specialcarbine_mk2', 'Spezialkarabiner MK2', 0, 1, 3.5),
('spotatoss', 'Tiefkühl-Potatos-Tüte', 0, 1, 0.3),
('spray_remover', 'Schwamm', 1, 1, 0.3),
('sprite', 'Sprite', 0, 1, 0.3),
('steellingo', 'Stahlbarren', 0, 1, 0.3),
('stickybomb', 'Klebebombe', 0, 1, 2),
('stickybomb_ammo', 'Klebebombenmunition', 0, 1, 0.1),
('stinger', 'Stinger-Raketenwerfer', 0, 1, 4),
('stinger_ammo', 'Munition für Stinger-Raketenwerfer', 0, 1, 0.1),
('stone', 'Stein', 0, 1, 0.3),
('stungun', 'Taser', 0, 1, 1),
('stungun_ammo', 'Taser-Munition', 0, 1, 0.1),
('sundayfraise', 'Erdbeer-Sundae', 0, 1, 0.3),
('sundaynature', 'Natur-Sundae', 0, 1, 0.3),
('sushi', 'Sushi', 0, 1, 0.3),
('sw', 'Sandwich', 0, 1, 0.3),
('switchblade', 'Klappmesser', 0, 1, 1),
('tabacblond', 'Heller Tabak', 0, 1, 0.3),
('tabacblondsec', 'Getrockneter heller Tabak', 0, 1, 0.3),
('tabacbrun', 'Dunkler Tabak', 0, 1, 0.3),
('tabacbrunsec', 'Getrockneter dunkler Tabak', 0, 1, 0.3),
('tableau', 'Gemälde', 0, 1, 0.3),
('tablet', 'Tablet', 0, 1, 0.3),
('tacos2', 'Tacos mit 2 Fleischsorten', 0, 1, 0.3),
('tacos3', 'Tacos mit 3 Fleischsorten', 0, 1, 0.3),
('tacosfroid2', 'Tacos mit 2 Fleischsorten (kalt)', 0, 1, 0.3),
('tacosfroid3', 'Tacos mit 3 Fleischsorten (kalt)', 0, 1, 0.3),
('tacosfroidxll', 'Tacos XXL (kalt)', 0, 1, 0.3),
('tacosl', 'Tacos L', 0, 1, 0.3),
('tacosm', 'Tacos M', 0, 1, 0.3),
('tacosxl', 'Tacos XL', 0, 1, 0.3),
('tacosxll', 'Tacos XXL', 0, 1, 0.3),
('tank_ammo', 'Panzergranate', 0, 1, 0.1),
('tel', 'Telefon', 0, 1, 0.3),
('tele', 'Fernseher', 0, 1, 0.3),
('teqpaf', 'Tequila Paf', 0, 1, 0.3),
('tequila', 'Tequila', 0, 1, 0.3),
('terre', 'Erde', 0, 1, 0.5),
('thermite', 'Thermit', 0, 1, 1),
('thon', 'Thunfisch', 0, 1, 0.3),
('tomate', 'Tomate', 0, 1, 0.3),
('trait_burgershot', 'Paket', 0, 1, 0.3),
('trait_ferrailleur', 'Verarbeitetes Altmetall', 0, 1, 0.3),
('trait_petitpecheur', 'Frittierter Fisch', 0, 1, 0.3),
('trait_tabac', 'Zigarette', 0, 1, 0.3),
('trait_vigneron', 'Wein', 0, 1, 0.3),
('treatedsteel', 'Behandelter Stahlbarren', 0, 1, 0.3),
('turtle', 'Meeresschildkröte', 0, 1, 0.3),
('turtlebait', 'Schildkrötenköder', 0, 1, 0.3),
('unicorn_jusorange', 'Frisch gepresster Orangensaft', 0, 1, 0.3),
('unicorn_miniburger', 'Mini-Burger-Slider', 0, 1, 0.3),
('unicorn_pepsi', 'Pepsi ', 0, 1, 0.3),
('unicorn_poulet', 'Scharfe Hähnchenflügel', 0, 1, 0.3),
('unicorn_tequila', 'Tequila Sunrise', 0, 1, 0.3),
('unicorn_vodka', 'Wodka Martini', 0, 1, 0.3),
('unicorn_wisky', 'Whisky Sour', 0, 1, 0.3),
('usbhacked', 'Illegale USB-Stick', 0, 1, 0.3),
('vase', 'Vase', 0, 1, 0.3),
('vehicle_case', 'Fahrzeugkiste', 0, 0, 0.3),
('viande', 'Fleischportion', 0, 1, 0.3),
('victusxmr', 'Victus XMR', 0, 1, 5),
('vinblanc', 'Weißwein', 0, 1, 0.3),
('vinrose', 'Rosé', 0, 1, 0.3),
('vinrouge', 'Rotwein', 0, 1, 0.3),
('vintagepistol', 'Vintage-Pistole', 0, 1, 1.5),
('vodka', 'Wodka', 0, 1, 0.3),
('vodkaenergy', 'Wodka-Energy', 0, 1, 0.3),
('vodkafruit', 'Wodka-Fruchtsaft', 0, 1, 0.3),
('vp9', 'VP9', 0, 1, 2),
('washed_stone', 'Gewaschener Stein', 0, 1, 0.3),
('water', 'Wasser', 0, 1, 0.3),
('weapons_license', 'Waffenschein', 0, 1, 1),
('weed', 'Gras', 0, 1, 0.7),
('weed_pooch', 'Tüte Gras', 0, 1, 1),
('wet_black_phone', 'Nasses Schwarzes Telefon', 0, 1, 10),
('wet_blue_phone', 'Nasses Blaues Telefon', 0, 1, 10),
('wet_classic_phone', 'Nasses Klassisches Telefon', 0, 1, 10),
('wet_gold_phone', 'Nasses Goldenes Telefon', 0, 1, 10),
('wet_greenlight_phone', 'Nasses Grünlicht-Telefon', 0, 1, 10),
('wet_green_phone', 'Nasses Grünes Telefon', 0, 1, 10),
('wet_phone', 'Nasses Telefon', 0, 1, 10),
('wet_pink_phone', 'Nasses Pinkes Telefon', 0, 1, 10),
('wet_red_phone', 'Nasses Rotes Telefon', 0, 1, 10),
('wet_white_phone', 'Nasses Weißes Telefon', 0, 1, 10),
('whisky', 'Whisky', 0, 1, 0.3),
('whiskycoca', 'Whisky-Cola', 0, 1, 0.3),
('white_phone', 'Weißes Telefon', 0, 1, 10),
('wire', 'Draht', 0, 1, 0.3),
('wiwang_caviar', 'Kaviar', 0, 1, 0.3),
('wiwang_cocktail', 'Cocktail Bora Bora', 0, 1, 0.3),
('wiwang_donperignon', 'Don Perignon', 0, 1, 0.3),
('wiwang_juspassion', 'Maracuja-Mango-Saft', 0, 1, 0.3),
('wiwang_macarons', 'Macarons', 0, 1, 0.3),
('wiwang_ruinart', 'Ruinart', 0, 1, 0.3),
('wiwang_vin', 'Wein', 0, 1, 0.3),
('wrench', 'Schraubenschlüssel', 0, 1, 2),
('xanax', 'Xanax', 0, 1, 0.3),
('yakitori', 'Yakitori', 0, 1, 0.3);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  `type` int(1) NOT NULL DEFAULT 1,
  `handyservice` varchar(2) NOT NULL DEFAULT '0',
  `hasapp` int(2) NOT NULL DEFAULT 0,
  `onlyboss` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `type`, `handyservice`, `hasapp`, `onlyboss`) VALUES
('airdealer', 'Flugzeughändler', 0, 1, '0', 0, 0),
('ambulance', 'Rettungsdienst', 0, 1, '0', 0, 0),
('ambulancesandy', 'Rettungsdienst Sandy', 0, 1, '0', 0, 0),
('bar_beachclub', 'Beach Club', 0, 1, '0', 0, 0),
('bar_mojitoinn', 'Mojito Inn', 0, 1, '0', 0, 0),
('bar_salieris', 'Salieris', 1, 1, '0', 0, 0),
('bar_tequila', 'Tequila Bar', 0, 1, '0', 0, 0),
('boatdealer', 'Bootshändler', 0, 1, '0', 0, 0),
('boite_pacific', 'Pacific Bluffs', 0, 1, '0', 0, 0),
('boite_unicorn', 'Unicorn Club', 0, 1, '0', 0, 0),
('boite_wiwang', 'Wiwang Club', 0, 1, '0', 0, 0),
('cardealer', 'Autohändler', 1, 1, '0', 0, 0),
('Cartel De Cayo', 'Cayo Kartell', 0, 0, '0', 0, 0),
('Cartel de Sinaloa', 'Sinaloa Kartell', 0, 0, '0', 0, 0),
('Duggan', 'Duggan', 0, 0, '0', 0, 0),
('Duggan crime family', 'Duggan-Verbrecherfamilie', 0, 0, '0', 0, 0),
('garage_driveline', 'Driveline', 0, 1, '0', 0, 0),
('garage_eastcustoms', 'East Customs', 0, 1, '0', 0, 0),
('garage_lscustom', 'LS Customs', 0, 1, '0', 0, 0),
('garage_octacyp', 'Octa Cyp', 0, 1, '0', 0, 0),
('garage_paletocustoms', 'Paleto Customs', 0, 1, '0', 0, 0),
('garage_speedhunters', 'Speed Hunters', 0, 1, '0', 0, 0),
('gouvernement', 'Regierung', 1, 1, '0', 0, 0),
('hornys', 'Horny´s', 0, 1, '0', 0, 0),
('le_ferailleur', 'Der Schrotthändler', 0, 1, '0', 0, 0),
('ltd_arena', 'LTD Arena', 0, 1, '0', 0, 0),
('ltd_ballas', 'LTD Grove Street', 0, 1, '0', 0, 0),
('ltd_f4l', 'LTD Forum Drive', 0, 1, '0', 0, 0),
('ltd_littleseoul', 'LTD Little Seoul', 0, 1, '0', 0, 0),
('ltd_paletobay', 'LTD Paleto Bay', 0, 1, '0', 0, 0),
('Madrazo', 'Madrazo', 0, 0, '0', 0, 0),
('McReary', 'McReary', 0, 0, '0', 0, 0),
('mecano', 'Benny´s', 0, 1, '0', 0, 0),
('motodealer', 'Motorradhändler', 1, 1, '0', 0, 0),
('petitpecheur', 'Kleiner Fischer', 0, 1, '0', 0, 0),
('police', 'Polizei', 1, 1, '0', 0, 0),
('realestateagent', 'Immobilienmakler', 0, 1, '0', 0, 0),
('restau_burgershot', 'Burgershot', 0, 1, '0', 0, 0),
('restau_catcafe', 'CatCafe', 0, 1, '0', 0, 0),
('restau_pearls', 'Pearls', 0, 1, '0', 0, 0),
('restau_pops', 'Pop´s Diner', 0, 1, '0', 0, 0),
('saspn', 'Sheriff', 0, 1, '0', 0, 0),
('tabac', 'Tabakladen', 0, 1, '0', 0, 0),
('taxi', 'Taxi', 0, 1, '0', 0, 0),
('unemployed', 'Arbeitslos', 0, 1, '0', 0, 0),
('unemployed2', 'Arbeitslos', 0, 0, '0', 0, 0),
('Vagos', 'Vagos', 0, 0, '0', 0, 0),
('vangelico', 'Vangelico', 0, 1, '0', 0, 0),
('vigne', 'Winzer', 0, 1, '0', 0, 0),
('weazelnews', 'Weazle News', 0, 1, '0', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `skin_male` longtext DEFAULT NULL,
  `skin_female` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'Arbeitslos', '', 100, '{}', '{}'),
(2, 'unemployed2', 0, 'rsa', '', 50, '{}', '{}'),
(11, 'police', 0, 'recrue', 'Anwärter', 1500, '{}', '{}'),
(12, 'police', 1, 'cadet', 'Kadett', 1700, '{}', '{}'),
(13, 'police', 2, 'officier1', 'Polizist I', 2000, '{}', '{}'),
(14, 'police', 3, 'officier2', 'Polizist II', 2300, '{}', '{}'),
(15, 'police', 4, 'officier3', 'Polizist III', 2600, '{}', '{}'),
(16, 'police', 5, 'detective1', 'Detektiv I', 2900, '{}', '{}'),
(17, 'police', 6, 'detective2', 'Detektiv II', 3200, '{}', '{}'),
(18, 'police', 7, 'sergent1', 'Sergeant I', 3500, '{}', '{}'),
(19, 'police', 8, 'sergent2', 'Sergeant II', 3800, '{}', '{}'),
(20, 'police', 9, 'lieutenant', 'Leutnant', 4100, '{}', '{}'),
(21, 'police', 10, 'capitaine', 'Hauptmann', 4400, '{}', '{}'),
(22, 'police', 11, 'commandant', 'Kommandant', 4700, '{}', '{}'),
(23, 'police', 12, 'dchief', 'Stellv. Polizeichef', 5000, '{}', '{}'),
(24, 'police', 13, 'achief', 'Assistenzchef', 5300, '{}', '{}'),
(25, 'police', 14, 'chief', 'Polizeichef', 6000, '{}', '{}'),
(30, 'gouvernement', 13, 'boss', 'Gouverneur', 0, 'null', 'null'),
(31, 'gouvernement', 12, 'Vice Gouverneur', 'Vize-Gouverneur', 0, '[]', '[]'),
(32, 'gouvernement', 11, 'Premier Ministre', 'Premierminister', 0, '[]', '[]'),
(33, 'gouvernement', 10, 'Secretaire Défense', 'Verteidigungssekretär', 0, '[]', '[]'),
(34, 'gouvernement', 9, 'Ministre de la Justice', 'Justizminister', 0, '[]', '[]'),
(35, 'gouvernement', 8, 'Ministre de l\'Economie', 'Finanzminister', 0, '[]', '[]'),
(36, 'gouvernement', 7, 'Secrétaire d\'Etat', 'Staatssekretär', 0, '[]', '[]'),
(37, 'gouvernement', 6, 'Secretaire au Logement', 'Wohnungssekretär', 0, '[]', '[]'),
(38, 'gouvernement', 5, 'juge', 'Richter', 0, '[]', '[]'),
(39, 'gouvernement', 4, 'procureur', 'Staatsanwalt', 0, '[]', '[]'),
(40, 'gouvernement', 2, 'garde', 'Leibwächter', 1000, '[]', '[]'),
(41, 'gouvernement', 1, 'chefsecu', 'Sicherheitschef', 0, '[]', '[]'),
(703, 'cardealer', 7, 'boss', 'Geschäftsführer', 1, '{}', '{}'),
(704, 'motodealer', 7, 'Praktikant', '🎓 Praktikant', 0, '{}', '{}'),
(706, 'motodealer', 8, 'Employé+', '✨ Erfahrener Angestellter', 0, '{}', '{}'),
(707, 'motodealer', 1, 'boss', '👑 Geschäftsführer', 300, '{}', '{}'),
(708, 'salieris', 1, 'recrue', 'Barkeeper', 0, '{}', '{}'),
(709, 'salieris', 2, 'novice', 'DJ', 0, '{}', '{}'),
(710, 'salieris', 3, 'boss', 'Geschäftsführer', 0, '{}', '{}'),
(765, 'vigne', 4, 'boss', 'Geschäftsführer', 1000, '{}', '{}'),
(1781, 'realestateagent', 2, 'vendeur', 'Angestellter', 5500, '{}', '{}'),
(1782, 'realestateagent', 3, 'manager', 'Manager', 6500, '{}', '{}'),
(1783, 'realestateagent', 4, 'Co-gérant', 'Stellvertretender Geschäftsführer', 7500, '{}', '{}'),
(1784, 'realestateagent', 5, 'boss', 'Geschäftsführer', 9000, '{}', '{}'),
(1850, 'boatdealer', 1, 'Praktikant', 'Angestellter', 0, '{}', '{}'),
(1851, 'boatdealer', 6, 'boss', 'CEO', 1, '{}', '{}'),
(1852, 'boatdealer', 5, 'Co-Chef', 'Stellvertretender Chef', 0, '[]', '[]'),
(1870, 'airdealer', 4, 'boss', 'CEO', 5000, NULL, NULL),
(1871, 'airdealer', 3, 'Co Patron', 'Stellvertretender Chef', 500, '[]', '[]'),
(1872, 'airdealer', 1, 'Salarié', 'Angestellter', 500, '[]', '[]'),
(1946, 'saspn', 0, 'cadet', 'Auszubildender', 800, '{}', '{}'),
(1947, 'saspn', 1, 'officier1', 'Deputy Sheriff I', 900, '{}', '{}'),
(1948, 'saspn', 2, 'officier2', 'Deputy Sheriff II', 1000, '{}', '{}'),
(1949, 'saspn', 3, 'officier3', 'Deputy Sheriff III', 1000, '{}', '{}'),
(1950, 'saspn', 4, 'officierprincipal ', 'Leitender Deputy Sheriff', 1000, '{}', '{}'),
(1951, 'saspn', 5, 'sergent1', 'Sergeant', 1000, NULL, NULL),
(1952, 'saspn', 6, 'sergent2', 'Chef-Sergeant', 1500, NULL, NULL),
(1953, 'saspn', 7, 'lieutenant', 'Leutnant', 2000, NULL, NULL),
(1954, 'saspn', 8, 'capitaine', 'Hauptmann', 3000, NULL, NULL),
(1955, 'saspn', 11, 'boss', 'Sheriff', 5000, NULL, NULL),
(2032, 'le_ferailleur', 3, 'boss', 'Chef', 0, '{}', '{}'),
(2033, 'le_ferailleur', 2, 'Co -patron', 'Stellvertretender Chef', 0, '[]', '[]'),
(2034, 'le_ferailleur', 1, 'Ramasseur', 'Sammler', 0, '[]', '[]'),
(2062, 'taxi', 15, 'boss', '💼 Geschäftsführer', 10, NULL, NULL),
(2063, 'taxi', 12, 'co-boss', '💼 Stellvertretender Geschäftsführer', 1, '[]', '[]'),
(2093, 'garage_lscustom', 6, 'boss', 'Geschäftsführer', 1000, NULL, NULL),
(2138, 'garage_lscustom', 3, 'mecano', 'Mechaniker', 250, '[]', '[]'),
(2139, 'garage_lscustom', 4, 'chefequipe', 'Teamleiter', 1, '[]', '[]'),
(2140, 'garage_lscustom', 5, 'copatron', 'Stellvertretender Geschäftsführer', 500, '[]', '[]'),
(2887, 'weazelnews', 2, 'employed', 'Angestellter', 0, NULL, NULL),
(2888, 'weazelnews', 1, 'employed', 'Angestellter', 0, NULL, NULL),
(2889, 'weazelnews', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(2890, 'weazelnews', 3, 'sous-boss', 'Manager', 0, NULL, NULL),
(2894, 'petitpecheur', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(2895, 'petitpecheur', 1, 'employed', 'Angestellter', 0, NULL, NULL),
(2896, 'petitpecheur', 2, 'employed', 'Manager', 0, NULL, NULL),
(2897, 'petitpecheur', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(2901, 'taxi', 3, 'chauffeur', '⭐ Fahrer', 300, '[]', '[]'),
(2903, 'taxi', 5, 'manager', 'Manager', 0, '[]', '[]'),
(2904, 'taxi', 1, 'stagiare', 'Praktikant', 0, '[]', '[]'),
(2961, 'vigne', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 1000, NULL, NULL),
(2968, 'saspn', 10, 'Under Sheriff', 'Stellvertretender Sheriff', 4500, '[]', '[]'),
(2978, 'tabac', 3, 'sous-boss', 'Teamleiter', NULL, NULL, NULL),
(2979, 'tabac', 2, 'employed', 'Angestellte', 0, NULL, NULL),
(2980, 'tabac', 2, 'employed', 'Angestellte', 0, NULL, NULL),
(2981, 'tabac', 4, 'boss', 'CEO', 1, NULL, NULL),
(2988, 'motodealer', 2, 'Responsable', '📊 Verantwortlicher', 0, '[]', '[]'),
(3018, 'gouvernement', 3, 'Avocat', 'Anwalt', 0, '[]', '[]'),
(3021, 'ltd_littleseoul', 4, 'boss', 'Geschäftsführer', 1, NULL, NULL),
(3022, 'ltd_littleseoul', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 1, NULL, NULL),
(3024, 'ltd_paletobay', 1, 'employed', 'Angestellter', 0, NULL, NULL),
(3025, 'ltd_paletobay', 2, 'employed', 'Angestellter', 0, NULL, NULL),
(3026, 'ltd_paletobay', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3027, 'ltd_paletobay', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3028, 'ltd_f4l', 2, 'employer', 'Verkäufer', 0, NULL, NULL),
(3029, 'ltd_f4l', 2, 'employer', 'Verkäufer', 0, NULL, NULL),
(3030, 'ltd_f4l', 3, 'sous-boss', 'Verantwortlicher', 500, NULL, NULL),
(3031, 'ltd_f4l', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3032, 'ltd_ballas', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3033, 'ltd_ballas', 2, 'employed', 'Angestellter', 0, NULL, NULL),
(3034, 'ltd_ballas', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3035, 'ltd_ballas', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3044, 'ambulancesandy', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3045, 'ambulancesandy', 3, 'sous-boss', 'Arzt', 0, NULL, NULL),
(3046, 'ambulancesandy', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3047, 'ambulancesandy', 2, 'employed', 'Krankenpfleger', 0, NULL, NULL),
(3067, 'ltd_littleseoul', 2, 'Expérimenté', 'Erfahrener', 650, '[]', '[]'),
(3071, 'realestateagent', 6, 'Co-Chef', 'Stellvertretender Geschäftsführer', 8500, '[]', '[]'),
(3074, 'boatdealer', 2, 'Expérimenté', 'Neuling', 0, '[]', '[]'),
(3075, 'vigne', 2, 'Sous chef', 'Stellvertretender Chef', 400, '[]', '[]'),
(3076, 'vigne', 1, 'Employer', 'Angestellter', 250, '[]', '[]'),
(3085, 'ambulance', 1, 'boss', 'Direktor', 5000, NULL, NULL),
(3093, 'restau_burgershot', 1, 'employed', 'Angestellter', 0, NULL, NULL),
(3094, 'restau_burgershot', 2, 'employed', 'Angestellter', 0, NULL, NULL),
(3095, 'restau_burgershot', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3096, 'restau_burgershot', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3097, 'mecano', 3, 'Praktikant', 'Mechaniker', 1, NULL, NULL),
(3098, 'mecano', 3, 'Praktikant', 'Mechaniker', 1, NULL, NULL),
(3099, 'mecano', 5, 'Co patron', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3100, 'mecano', 6, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3101, 'boite_unicorn', 1, 'employed', 'Angestellter', 0, NULL, NULL),
(3102, 'boite_unicorn', 2, 'employed', 'Angestellter', 0, NULL, NULL),
(3103, 'boite_unicorn', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3104, 'boite_unicorn', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3105, 'gouvernement', 14, 'president', 'Präsident', 500, '[]', '[]'),
(3106, 'ambulance', 7, 'Infirmier', 'Krankenpfleger', 100, '[]', '[]'),
(3107, 'vangelico', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3108, 'vangelico', 2, 'employed', 'Bestätigter', 0, NULL, NULL),
(3109, 'vangelico', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3110, 'vangelico', 1, 'employed', 'Angestellter', 0, NULL, NULL),
(3111, 'restau_pops', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3112, 'restau_pops', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3113, 'restau_pops', 2, 'employed', 'Angestellter', 0, NULL, NULL),
(3114, 'restau_pops', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3115, 'hornys', 2, 'employed', 'Praktikant', 0, NULL, NULL),
(3116, 'hornys', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3117, 'hornys', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3118, 'hornys', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3119, 'restau_pearls', 4, 'boss', 'Geschäftsführer', 2500, NULL, NULL),
(3120, 'restau_pearls', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 1000, NULL, NULL),
(3121, 'restau_pearls', 2, 'employed', 'Angestellter', 550, NULL, NULL),
(3122, 'restau_pearls', 2, 'employed', 'Angestellter', 550, NULL, NULL),
(3123, 'boite_wiwang', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3124, 'boite_wiwang', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3125, 'boite_wiwang', 2, 'employed', 'Angestellter', 0, NULL, NULL),
(3126, 'boite_wiwang', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3127, 'pacific', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3128, 'boite_pacific', 3, 'dj', 'dj', 0, NULL, NULL),
(3129, 'boite_pacific', 2, 'Sécurité', 'Sicherheitskraft', 0, NULL, NULL),
(3130, 'boite_pacific', 2, 'Sécurité', 'Sicherheitskraft', 0, NULL, NULL),
(3136, 'mecano', 4, 'Mécano Expérimenté', 'Erfahrener Mechaniker', 200, '[]', '[]'),
(3138, 'mecano', 2, 'Recrue', 'Rekrut', 100, '[]', '[]'),
(3143, 'Cartel de Sinaloa', 1, 'boss', 'Anführer', NULL, NULL, NULL),
(3146, 'cardealer', 1, 'Vendeur', 'Verkäufer', 1000, '[]', '[]'),
(3147, 'cardealer', 5, 'Directeur Ressource Humaine', 'Personalleiter', 3500, '[]', '[]'),
(3148, 'cardealer', 6, 'Ressource Humaine', 'Personalreferent', 3500, '[]', '[]'),
(3149, 'Vagos', 1, 'boss', 'Anführer', NULL, NULL, NULL),
(3150, 'Vagos', 2, 'Capo', 'Capo', NULL, NULL, NULL),
(3151, 'Vagos', 3, 'Affiliado', 'Mitglied', NULL, NULL, NULL),
(3152, 'Vagos', 4, 'Tirador', 'Schütze', NULL, NULL, NULL),
(3153, 'Vagos', 5, 'Labron ', 'Arbeiter ', NULL, NULL, NULL),
(3154, 'Vagos', 6, 'Esperanza ', 'Hoffnungsträger ', NULL, NULL, NULL),
(3155, 'Vagos', 7, 'Iniciado', 'Neuling', NULL, NULL, NULL),
(3157, 'cardealer', 8, 'Directeur des ventes', 'Vertriebsleiter', 1, '[]', '[]'),
(3158, 'Cartel De Cayo', 1, 'boss', 'Anführer', NULL, NULL, NULL),
(3159, 'Madrazo', 1, 'boss', 'Anführer', NULL, NULL, NULL),
(3170, 'McReary', 1, 'boss', 'Anführer', NULL, NULL, NULL),
(3171, 'McReary', 2, 'co-lead', 'Stellvertretender Anführer', NULL, NULL, NULL),
(3172, 'McReary', 3, 'lieutenant', 'Leutnant', NULL, NULL, NULL),
(3173, 'McReary', 4, 'gros-bras', 'Schläger', NULL, NULL, NULL),
(3174, 'McReary', 5, 'mafieux', 'Mafioso', NULL, NULL, NULL),
(3175, 'McReary', 6, 'soldat', 'Soldat', NULL, NULL, NULL),
(3176, 'McReary', 7, 'gosse de rue', 'Straßenkind', NULL, NULL, NULL),
(3177, 'saspn', 9, 'Commander', 'Bereichskommandant', 4000, '[]', '[]'),
(3179, 'Cartel de Sinaloa', 2, 'Halcón', 'Späher', NULL, NULL, NULL),
(3180, 'Cartel de Sinaloa', 3, 'Cocinero', 'Koch', NULL, NULL, NULL),
(3181, 'Cartel de Sinaloa', 4, 'Plaza Boss', 'Platzleiter', NULL, NULL, NULL),
(3182, 'Cartel de Sinaloa', 5, 'Jefe Operaciones', 'Leiter Operationen', NULL, NULL, NULL),
(3183, 'Cartel de Sinaloa', 6, 'Sous Chef', 'Stellv. Chef', NULL, NULL, NULL),
(3185, 'Duggan', 1, 'boss', 'Anführer', NULL, NULL, NULL),
(3186, 'Duggan', 2, 'Petit Coussin', 'Kleiner Cousin', NULL, NULL, NULL),
(3187, 'Duggan', 3, 'Coussin', 'Cousin ', NULL, NULL, NULL),
(3189, 'Duggan', 4, 'Frère', 'Bruder', NULL, NULL, NULL),
(3190, 'Duggan', 5, 'Frère Rapprocher ', 'Vertrauter Bruder', NULL, NULL, NULL),
(3191, 'Duggan', 6, 'Bras Droit', 'Stellvertreter', NULL, NULL, NULL),
(3194, 'ambulance', 4, 'rh', 'Personalreferent', 300, '[]', '[]'),
(3195, 'ambulance', 3, 'drh', 'Leiter Personalwesen', 300, '[]', '[]'),
(3198, 'ambulance', 6, 'médecin', 'Arzt', 400, '[]', '[]'),
(3199, 'ambulance', 5, 'médecin chef', 'Chefarzt', 500, '[]', '[]'),
(3200, 'ambulance', 2, 'co patron', 'Mitgeschäftsführer', 2000, '[]', '[]'),
(3202, 'Madrazo', 2, 'Bras Droit', 'Stellvertreter', NULL, NULL, NULL),
(3203, 'Madrazo', 3, 'Lieutenant', 'Leutnant', NULL, NULL, NULL),
(3204, 'Madrazo', 4, 'Sergent ', 'Sergeant', NULL, NULL, NULL),
(3206, 'Madrazo', 5, 'Soldat 1', 'Soldat 1', NULL, NULL, NULL),
(3207, 'Madrazo', 6, 'Soldat 2', 'Soldat 2', NULL, NULL, NULL),
(3208, 'Madrazo', 7, 'Soldat 3', 'Soldat 3', NULL, NULL, NULL),
(3209, 'ltd_littleseoul', 1, 'Employé', 'Mitarbeiter', 350, '[]', '[]'),
(3211, 'Cartel De Cayo', 3, 'soldat', 'Soldat Cayo', NULL, NULL, NULL),
(3212, 'cardealer', 2, 'Vendeur confirmé', 'Erfahrener Verkäufer', 1500, '[]', '[]'),
(3213, 'restau_catcafe', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3214, 'restau_catcafe', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3215, 'restau_catcafe', 2, 'employed', 'Mitarbeiter', 0, NULL, NULL),
(3216, 'restau_catcafe', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3217, 'bar_tequila', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3218, 'bar_tequila', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3219, 'bar_tequila', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3220, 'bar_tequila', 2, 'employed', 'Mitarbeiter', 0, NULL, NULL),
(3221, 'bar_beachclub', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3222, 'bar_beachclub', 2, 'employed', 'Mitarbeiter', 0, NULL, NULL),
(3223, 'bar_beachclub', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3224, 'bar_beachclub', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3225, 'bar_mojitoinn', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3226, 'bar_mojitoinn', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3227, 'bar_mojitoinn', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3228, 'bar_mojitoinn', 2, 'employed', 'Mitarbeiter', 0, NULL, NULL),
(3229, 'ltd_arena', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3230, 'ltd_arena', 2, 'employed', 'Mitarbeiter', 0, NULL, NULL),
(3231, 'ltd_arena', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3232, 'ltd_arena', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3233, 'garage_octacyp', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3234, 'garage_octacyp', 2, 'employed', 'Mitarbeiter', 0, NULL, NULL),
(3235, 'garage_octacyp', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3236, 'garage_octacyp', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3237, 'garage_driveline', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3238, 'garage_driveline', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3239, 'garage_driveline', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3240, 'garage_driveline', 2, 'employed', 'Mitarbeiter', 0, NULL, NULL),
(3241, 'garage_eastcustoms', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3242, 'garage_eastcustoms', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3243, 'garage_eastcustoms', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3244, 'garage_eastcustoms', 2, 'employed', 'Mitarbeiter', 0, NULL, NULL),
(3245, 'garage_paletocustoms', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3246, 'garage_paletocustoms', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL),
(3247, 'garage_paletocustoms', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3248, 'garage_paletocustoms', 2, 'employed', 'Mitarbeiter', 0, NULL, NULL),
(3249, 'garage_speedhunters', 1, 'employed', 'Praktikant', 0, NULL, NULL),
(3250, 'garage_speedhunters', 2, 'employed', 'Mitarbeiter', 0, NULL, NULL),
(3251, 'garage_speedhunters', 3, 'sous-boss', 'Stellvertretender Geschäftsführer', 0, NULL, NULL),
(3252, 'garage_speedhunters', 4, 'boss', 'Geschäftsführer', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_accounts`
--

CREATE TABLE `lbtablet_ambulance_accounts` (
  `id` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `callsign` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_bulletin`
--

CREATE TABLE `lbtablet_ambulance_bulletin` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------C----------

--
-- Structure de la table `lbtablet_ambulance_conditions`
--

CREATE TABLE `lbtablet_ambulance_conditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `severity` varchar(25) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbtablet_ambulance_conditions`
--

INSERT INTO `lbtablet_ambulance_conditions` (`id`, `severity`, `category_id`, `title`) VALUES
(98, 'critical', 24, 'Aortenaneurysma'),
(91, 'critical', 24, 'Herzinfarkt'),
(92, 'critical', 24, 'Herzinsuffizienz'),
(94, 'critical', 24, 'Schlaganfall'),
(103, 'critical', 25, 'Hüftfraktur'),
(108, 'critical', 25, 'Beckenfraktur'),
(126, 'critical', 27, 'Ebolavirus-Krankheit'),
(123, 'critical', 27, 'Meningitis'),
(145, 'critical', 29, 'Hirntumor'),
(138, 'critical', 29, 'Brustkrebs'),
(142, 'critical', 29, 'Darmkrebs'),
(141, 'critical', 29, 'Leukämie'),
(143, 'critical', 29, 'Lymphom'),
(144, 'critical', 29, 'Bauchspeicheldrüsenkrebs'),
(139, 'critical', 29, 'Prostatakrebs'),
(149, 'critical', 30, 'Lungenkrebs'),
(153, 'critical', 30, 'Lungenembolie'),
(170, 'critical', 32, 'Rückenmarksverletzung'),
(163, 'critical', 32, 'Schädel-Hirn-Trauma'),
(97, 'minor', 24, 'Angina Pectoris'),
(95, 'minor', 24, 'Herzrhythmusstörungen'),
(96, 'minor', 24, 'Bluthochdruck'),
(100, 'minor', 24, 'Periphere arterielle Verschlusskrankheit'),
(101, 'minor', 25, 'Armbruch'),
(109, 'minor', 25, 'Rotatorenmanschettenriss'),
(106, 'minor', 25, 'Verstauchter Knöchel'),
(110, 'minor', 25, 'Tennisarm'),
(104, 'minor', 25, 'Kreuzbandriss'),
(114, 'minor', 26, 'Refluxkrankheit (GERD)'),
(118, 'minor', 26, 'Magengeschwür'),
(124, 'minor', 27, 'Grippe (Influenza)'),
(127, 'minor', 27, 'Zika-Virus'),
(131, 'minor', 28, 'Angststörung'),
(133, 'minor', 28, 'Zwangsstörung (OCD)'),
(135, 'minor', 28, 'Phobien'),
(147, 'minor', 30, 'Asthma'),
(152, 'minor', 30, 'Bronchitis'),
(151, 'minor', 30, 'Schlafapnoe'),
(160, 'minor', 31, 'Hyperthyreose'),
(157, 'minor', 31, 'Schilddrüsenerkrankungen'),
(169, 'minor', 32, 'Fazialisparese (Bell’s Palsy)'),
(171, 'minor', 32, 'Clusterkopfschmerzen'),
(162, 'minor', 32, 'Gehirnerschütterung'),
(168, 'minor', 32, 'Migräne'),
(93, 'moderate', 24, 'Koronare Herzkrankheit'),
(99, 'moderate', 24, 'Tiefe Venenthrombose (TVT)'),
(102, 'moderate', 25, 'Beinbruch'),
(105, 'moderate', 25, 'Schulterluxation'),
(107, 'moderate', 25, 'Bandscheibenvorfall'),
(111, 'moderate', 26, 'Blinddarmentzündung'),
(116, 'moderate', 26, 'Gallensteine'),
(117, 'moderate', 26, 'Bauchspeicheldrüsenentzündung'),
(120, 'moderate', 27, 'COVID-19'),
(125, 'moderate', 27, 'Malaria'),
(137, 'moderate', 28, 'Demenz'),
(129, 'moderate', 28, 'Depression'),
(132, 'moderate', 28, 'Posttraumatische Belastungsstörung (PTBS)'),
(146, 'moderate', 30, 'Lungenentzündung'),
(159, 'moderate', 31, 'Nebenniereninsuffizienz (Morbus Addison)'),
(158, 'moderate', 31, 'Cushing-Syndrom'),
(164, 'moderate', 32, 'Epilepsie'),
(112, 'severe', 26, 'Morbus Crohn'),
(119, 'severe', 26, 'Hepatitis C'),
(115, 'severe', 26, 'Reizdarmsyndrom'),
(113, 'severe', 26, 'Colitis ulcerosa'),
(121, 'severe', 27, 'Hepatitis'),
(122, 'severe', 27, 'HIV/AIDS'),
(128, 'severe', 27, 'Borreliose'),
(130, 'severe', 28, 'Bipolare Störung'),
(136, 'severe', 28, 'Essstörungen'),
(134, 'severe', 28, 'Schizophrenie'),
(140, 'severe', 29, 'Hautkrebs'),
(148, 'severe', 30, 'Chronisch obstruktive Lungenerkrankung (COPD)'),
(154, 'severe', 30, 'Mukoviszidose'),
(150, 'severe', 30, 'Tuberkulose (TB)'),
(161, 'severe', 31, 'Polyzystisches Ovarialsyndrom (PCOS)'),
(155, 'severe', 31, 'Typ 1 Diabetes'),
(156, 'severe', 31, 'Typ 2 Diabetes'),
(167, 'severe', 32, 'Alzheimer-Krankheit'),
(165, 'severe', 32, 'Multiple Sklerose'),
(166, 'severe', 32, 'Parkinson-Krankheit');

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_conditions_categories`
--

CREATE TABLE `lbtablet_ambulance_conditions_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbtablet_ambulance_conditions_categories`
--

INSERT INTO `lbtablet_ambulance_conditions_categories` (`id`, `title`) VALUES
(29, 'Krebsarten'),
(24, 'Herz-Kreislauf-Erkrankungen'),
(31, 'Endokrine Störungen'),
(26, 'Magen-Darm-Erkrankungen'),
(27, 'Infektionskrankheiten'),
(28, 'Psychische Erkrankungen'),
(32, 'Neurologische Erkrankungen'),
(25, 'Orthopädische Verletzungen'),
(30, 'Atemwegserkrankungen');

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_logs`
--

CREATE TABLE `lbtablet_ambulance_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `related_id` varchar(500) DEFAULT NULL,
  `log_action` varchar(25) NOT NULL,
  `log_type` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_profiles`
--

CREATE TABLE `lbtablet_ambulance_profiles` (
  `id` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `notes` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_profile_conditions`
--

CREATE TABLE `lbtablet_ambulance_profile_conditions` (
  `profile_id` varchar(100) NOT NULL,
  `condition_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_profile_tags`
--

CREATE TABLE `lbtablet_ambulance_profile_tags` (
  `id` varchar(100) NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_reports`
--

CREATE TABLE `lbtablet_ambulance_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `patient` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `report_type` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_reports_attachments`
--

CREATE TABLE `lbtablet_ambulance_reports_attachments` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_reports_conditions`
--

CREATE TABLE `lbtablet_ambulance_reports_conditions` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `condition_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_reports_doctors`
--

CREATE TABLE `lbtablet_ambulance_reports_doctors` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `doctor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_reports_tags`
--

CREATE TABLE `lbtablet_ambulance_reports_tags` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_tags`
--

CREATE TABLE `lbtablet_ambulance_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL,
  `tag_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_apps_loggedin`
--

CREATE TABLE `lbtablet_apps_loggedin` (
  `tablet_id` varchar(100) NOT NULL,
  `app` varchar(25) NOT NULL,
  `account` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_chat_rooms`
--

CREATE TABLE `lbtablet_chat_rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `terminal_type` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `creator` varchar(100) NOT NULL,
  `last_message` text DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_chat_rooms_members`
--

CREATE TABLE `lbtablet_chat_rooms_members` (
  `room_id` int(10) UNSIGNED NOT NULL,
  `account` varchar(100) NOT NULL,
  `notifications` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_chat_rooms_messages`
--

CREATE TABLE `lbtablet_chat_rooms_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `author` varchar(100) NOT NULL,
  `message` text DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_clock_alarms`
--

CREATE TABLE `lbtablet_clock_alarms` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `hours` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `minutes` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `label` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_notes`
--

CREATE TABLE `lbtablet_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` mediumtext NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_notifications`
--

CREATE TABLE `lbtablet_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `app` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `show_avatar` tinyint(1) NOT NULL DEFAULT 0,
  `received_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_photos`
--

CREATE TABLE `lbtablet_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `link` varchar(500) DEFAULT NULL,
  `is_video` tinyint(1) DEFAULT 0,
  `size` float NOT NULL DEFAULT 0,
  `metadata` varchar(20) DEFAULT NULL,
  `is_favourite` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_photo_albums`
--

CREATE TABLE `lbtablet_photo_albums` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_photo_album_photos`
--

CREATE TABLE `lbtablet_photo_album_photos` (
  `album_id` int(10) UNSIGNED NOT NULL,
  `photo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_accounts`
--

CREATE TABLE `lbtablet_police_accounts` (
  `id` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `callsign` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_bulletin`
--

CREATE TABLE `lbtablet_police_bulletin` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases`
--

CREATE TABLE `lbtablet_police_cases` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_charges`
--

CREATE TABLE `lbtablet_police_cases_charges` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `criminal` varchar(100) NOT NULL,
  `offence_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_criminals`
--

CREATE TABLE `lbtablet_police_cases_criminals` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `id` varchar(100) NOT NULL,
  `fine` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `jail_time` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_evidence`
--

CREATE TABLE `lbtablet_police_cases_evidence` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_involved`
--

CREATE TABLE `lbtablet_police_cases_involved` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `involved` varchar(100) NOT NULL,
  `involvement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_tags`
--

CREATE TABLE `lbtablet_police_cases_tags` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_jail`
--

CREATE TABLE `lbtablet_police_jail` (
  `id` int(10) UNSIGNED NOT NULL,
  `prisoner` varchar(100) NOT NULL,
  `jailed_by` varchar(100) DEFAULT NULL,
  `reason` varchar(100) NOT NULL,
  `original_time` int(10) UNSIGNED NOT NULL,
  `jail_time` int(10) UNSIGNED NOT NULL,
  `jailed_at` datetime NOT NULL DEFAULT current_timestamp(),
  `related_case` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_logs`
--

CREATE TABLE `lbtablet_police_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `related_id` varchar(500) DEFAULT NULL,
  `log_action` varchar(50) NOT NULL,
  `log_type` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_offences`
--

CREATE TABLE `lbtablet_police_offences` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `class` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `fine` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `jail_time` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbtablet_police_offences`
--

INSERT INTO `lbtablet_police_offences` (`id`, `category_id`, `class`, `title`, `description`, `fine`, `jail_time`) VALUES
(1, 1, 'misdemeanor', 'Besitz kontrollierter Substanzen', 'Besitz illegaler Drogen für den Eigenbedarf.', 500, 0),
(2, 1, 'infraction', 'Besitz von Drogenutensilien', 'Besitz von Gegenständen, die mit dem Konsum oder der Zubereitung von Drogen in Verbindung stehen.', 200, 0),
(3, 1, 'felony', 'Drogenhandel', 'Der Vertrieb oder Verkauf illegaler Drogen.', 0, 60),
(4, 1, 'felony', 'Fahren unter Drogeneinfluss', 'Führen eines Fahrzeugs unter Drogeneinfluss.', 1000, 12),
(5, 1, 'felony', 'Anbau illegaler Drogen', 'Anbau von Pflanzen zur Herstellung kontrollierter Substanzen.', 0, 48),
(6, 1, 'misdemeanor', 'Öffentlicher Drogenkonsum', 'Konsum illegaler Drogen im öffentlichen Raum.', 300, 0),
(7, 1, 'felony', 'Drogenherstellung', 'Herstellung illegaler Drogen zum Verkauf oder Vertrieb.', 0, 72),
(8, 1, 'felony', 'Rezeptbetrug', 'Fälschung von Rezepten zum Erwerb kontrollierter Substanzen.', 1000, 24),
(9, 1, 'felony', 'Besitz mit der Absicht der Verbreitung', 'Besitz von Drogen in Mengen, die auf Verkaufsabsicht schließen lassen.', 0, 48),
(10, 1, 'felony', 'Betrieb eines Drogenhauses', 'Betreiben einer Immobilie zur Herstellung oder Verteilung von Drogen.', 0, 72),
(11, 1, 'felony', 'Öffentlicher Verkauf von Arzneimitteln', 'Verkauf illegaler Drogen in einem öffentlichen Bereich.', 2000, 36),
(12, 2, 'felony', 'Tragen einer versteckten Waffe ohne Genehmigung', 'Besitz einer versteckten Waffe ohne die erforderliche Genehmigung.', 0, 36),
(13, 2, 'felony', 'Illegaler Verkauf von Schusswaffen', 'Verkauf von Waffen ohne die notwendigen Lizenzen oder Hintergrundprüfungen.', 5000, 60),
(14, 2, 'felony', 'Unerlaubtes Abfeuern einer Schusswaffe', 'Abfeuern einer Waffe in verbotenen Bereichen oder auf eine Weise, die andere gefährdet.', 4000, 36),
(15, 2, 'felony', 'Besitz einer verbotenen Waffe', 'Besitz oder Tragen von gesetzlich verbotenen Waffen, wie abgesägten Schrotflinten oder Sprengstoffen.', 5000, 48),
(16, 2, 'misdemeanor', 'Drohgebärde mit einer Waffe', 'Bedrohliches Zeigen einer Waffe ohne berechtigten Grund.', 750, 12),
(17, 2, 'misdemeanor', 'Waffenbenutzung unter Einfluss', 'Bedienen oder Handhaben einer Waffe unter Einfluss von Drogen oder Alkohol.', 1000, 12),
(18, 2, 'felony', 'Besitz einer Waffe in einem Sperrgebiet', 'Mitführen von Schusswaffen oder anderen Waffen an Orten, an denen sie streng verboten sind, z.B. Flughäfen oder Schulen.', 3000, 24),
(19, 2, 'felony', 'Handel mit illegalen Schusswaffen', 'Transport oder Verkauf von Waffen über Rechtsgebietsgrenzen hinweg ohne Erlaubnis.', 7000, 72),
(20, 2, 'misdemeanor', 'Versäumnis, eine Waffe sicher zu verwahren', 'Unterlassung, eine Waffe sicher zu lagern, wodurch unbefugter Zugriff möglich wird.', 500, 0),
(21, 2, 'felony', 'Illegale Veränderung einer Schusswaffe', 'Veränderung einer Waffe zur Steigerung der Tödlichkeit, z.B. Umbau zu vollautomatisch.', 6000, 48),
(22, 2, 'felony', 'Besitz einer Waffe ohne Seriennummer', 'Besitz oder Nutzung einer Waffe mit entfernter oder verdeckter Seriennummer.', 4000, 36),
(23, 2, 'misdemeanor', 'Mitführen einer geladenen Waffe in der Öffentlichkeit', 'Besitz einer Waffe mit scharfer Munition in der Öffentlichkeit ohne Erlaubnis.', 2000, 24),
(24, 2, 'misdemeanor', 'Fahrlässiger Umgang mit einer Waffe', 'Unachtsamer Umgang mit einer Schusswaffe, der andere gefährdet.', 1500, 12),
(25, 2, 'felony', 'Besitz einer gestohlenen Waffe', 'Besitz einer Waffe, von der bekannt ist, dass sie gestohlen ist.', 5000, 36),
(26, 3, 'misdemeanor', 'Vandalismus', 'Absichtliche Zerstörung oder Beschädigung von Eigentum.', 1000, 0),
(27, 3, 'felony', 'Einbruch', 'Unerlaubtes Eindringen in ein Gebäude mit der Absicht, ein Verbrechen zu begehen.', 0, 24),
(28, 3, 'felony', 'Brandstiftung', 'Absichtliches und böswilliges Inbrandsetzen von Eigentum.', 2000, 48),
(29, 3, 'misdemeanor', 'Ladendiebstahl', 'Diebstahl von Waren aus einem Einzelhandelsgeschäft.', 300, 0),
(30, 3, 'infraction', 'Hausfriedensbruch', 'Betreten oder Verweilen auf fremdem Grundstück ohne Erlaubnis.', 200, 0),
(31, 3, 'felony', 'Schwerer Diebstahl', 'Diebstahl von Eigentum von erheblichem Wert.', 0, 36),
(32, 3, 'misdemeanor', 'Geringfügiger Diebstahl', 'Diebstahl von Eigentum geringem Wert.', 500, 0),
(33, 3, 'misdemeanor', 'Besitz von gestohlenem Eigentum', 'Besitz von Waren, die rechtswidrig von jemand anderem entwendet wurden.', 700, 0),
(34, 3, 'misdemeanor', 'Graffiti', 'Illegales Bemalen oder Beschmieren von öffentlichem oder privatem Eigentum.', 500, 0),
(35, 3, 'felony', 'Kreditkartenbetrug', 'Verwendung gestohlener oder gefälschter Kreditkartendaten für Einkäufe.', 2000, 24),
(36, 3, 'felony', 'Aufbrechen und Eindringen', 'Gewaltsames Eindringen in eine Immobilie ohne Erlaubnis.', 0, 36),
(37, 3, 'misdemeanor', 'Piraterie', 'Illegales Kopieren oder Verbreiten von urheberrechtlich geschütztem Material.', 1000, 0),
(38, 3, 'felony', 'Identitätsdiebstahl', 'Verwendung persönlicher Daten einer anderen Person zu betrügerischen Zwecken.', 2000, 48),
(39, 3, 'misdemeanor', 'Hausfriedensbruch', 'Betreten oder Verweilen auf einem Grundstück ohne Erlaubnis.', 250, 0),
(40, 3, 'felony', 'Diebstahl von öffentlichem Eigentum', 'Diebstahl von Gegenständen, die der Regierung oder öffentlichen Institutionen gehören.', 0, 36),
(41, 3, 'misdemeanor', 'Unbefugte Nutzung eines Fahrzeugs', 'Benutzung eines Fahrzeugs ohne Erlaubnis des Eigentümers, aber ohne Diebstahlsabsicht.', 500, 0),
(42, 3, 'misdemeanor', 'Illegaler Hausbesetzung', 'Besetzung einer verlassenen oder unbewohnten Immobilie ohne Erlaubnis.', 300, 0),
(43, 4, 'infraction', 'Geschwindigkeitsüberschreitung', 'Überschreitung der zulässigen Höchstgeschwindigkeit.', 100, 0),
(44, 4, 'infraction', 'Überfahren einer roten Ampel', 'Nicht anhalten an einer roten Verkehrsampel.', 200, 0),
(45, 4, 'felony', 'Fahren unter Einfluss (DUI)', 'Führen eines Fahrzeugs unter Einfluss von Alkohol oder Drogen.', 1000, 12),
(46, 4, 'misdemeanor', 'Rücksichtsloses Fahren', 'Führen eines Fahrzeugs mit vorsätzlicher oder grob fahrlässiger Missachtung der Sicherheit.', 500, 6),
(47, 4, 'misdemeanor', 'Fahren ohne Führerschein', 'Führen eines Fahrzeugs ohne gültige Fahrerlaubnis.', 250, 0),
(48, 4, 'felony', 'Unfallflucht', 'Verlassen der Unfallstelle ohne Angabe von Informationen oder Hilfeleistung.', 0, 24),
(49, 4, 'infraction', 'Fahren ohne Versicherung', 'Führen eines Fahrzeugs ohne gültigen Versicherungsschutz.', 500, 0),
(50, 4, 'infraction', 'Nichtgewähren der Vorfahrt', 'Nichtgewähren der Vorfahrt gemäß Verkehrsregeln.', 150, 0),
(51, 4, 'infraction', 'Verbotener U-Turn', 'Ausführen einer Wende an verbotener Stelle gemäß Verkehrszeichen oder Gesetzen.', 100, 0),
(52, 4, 'infraction', 'Fahren ohne Licht', 'Fahren bei Nacht oder schlechter Sicht ohne eingeschaltete Beleuchtung.', 50, 0),
(53, 4, 'felony', 'Straßenrennen', 'Teilnahme an illegalen Geschwindigkeitsrennen auf öffentlichen Straßen.', 1500, 24),
(54, 4, 'infraction', 'Fahren in falscher Richtung', 'Fahren entgegen der Verkehrsrichtung.', 200, 0),
(55, 4, 'infraction', 'Illegales Parken in Behindertenparkplätzen', 'Parken auf einem für Behinderte vorgesehenen Platz ohne entsprechende Genehmigung.', 200, 0),
(56, 4, 'misdemeanor', 'Aggressives Fahrverhalten (Road Rage)', 'Aggressives Fahren und Gefährdung anderer während eines Streits.', 750, 6),
(57, 4, 'infraction', 'Fahrzeug ohne Zulassung', 'Führen eines Fahrzeugs ohne gültige Zulassung.', 150, 0),
(58, 4, 'infraction', 'Übermäßige Tönung der Scheiben', 'Scheibentönung, die dunkler ist als gesetzlich erlaubt.', 100, 0),
(59, 5, 'felony', 'Unterschlagung', 'Betrügerische Aneignung von Geld oder Eigentum eines Arbeitgebers.', 0, 36),
(60, 5, 'felony', 'Betrug', 'Absichtliche Täuschung anderer zum finanziellen Vorteil.', 0, 48),
(61, 5, 'felony', 'Identitätsdiebstahl', 'Verwendung fremder persönlicher Daten zu betrügerischen Zwecken.', 1000, 36),
(62, 5, 'felony', 'Steuerhinterziehung', 'Bewusstes Vermeiden der Zahlung vorgeschriebener Steuern.', 5000, 60),
(63, 5, 'felony', 'Geldwäsche', 'Aufbereitung illegaler Gelder, um diese legal erscheinen zu lassen.', 0, 48),
(64, 5, 'felony', 'Insiderhandel', 'Handel mit Aktien basierend auf nicht öffentlichen Informationen zum finanziellen Vorteil.', 0, 36),
(65, 5, 'felony', 'Urkundenfälschung', 'Erstellung oder Veränderung von Dokumenten mit Betrugsabsicht.', 0, 24),
(66, 5, 'felony', 'Cyberkriminalität', 'Nutzung von Computern zur Begehung von Betrug, Identitätsdiebstahl oder unbefugtem Zugriff.', 0, 60),
(67, 5, 'felony', 'Gesundheitsbetrug', 'Einreichen falscher Forderungen oder Manipulation der Abrechnung im Gesundheitswesen zum Profit.', 0, 48),
(68, 5, 'felony', 'Schneeballsystem', 'Betrügerisches Investmentgeschäft, das hohe Renditen bei geringem Risiko verspricht.', 0, 120),
(69, 5, 'felony', 'Fälschung', 'Herstellung gefälschter Währung oder Dokumente.', 2000, 48),
(70, 5, 'felony', 'Industriespionage', 'Diebstahl von Geschäftsgeheimnissen oder vertraulichen Unternehmensinformationen.', 0, 72),
(71, 6, 'felony', 'Bigamie', 'Eingehen einer Ehe, während man bereits mit einer anderen Person verheiratet ist.', 0, 12),
(72, 6, 'felony', 'Meineid', 'Falsche Aussage unter Eid in einem Gerichtsverfahren.', 0, 24),
(73, 6, 'misdemeanor', 'Falsche Polizeimeldung', 'Absichtliche Angabe falscher Informationen bei der Polizei.', 500, 0),
(74, 6, 'misdemeanor', 'Widerstand gegen die Staatsgewalt', 'Physischer oder verbaler Widerstand gegen Vollstreckungsbeamte während einer Festnahme.', 0, 6),
(75, 6, 'misdemeanor', 'Nicht-Erscheinen vor Gericht', 'Nicht-Erscheinen zu einem angesetzten Gerichtstermin ohne gültigen Grund.', 500, 0),
(76, 6, 'infraction', 'Unrechtmäßige Versammlung', 'Versammlung in einer Weise, die eine Gefahr für die öffentliche Sicherheit oder Ordnung darstellt.', 200, 0),
(77, 6, 'misdemeanor', 'Nichtanzeige einer Straftat', 'Unterlassen der Meldung einer beobachteten Straftat an die Behörden.', 250, 0),
(78, 6, 'misdemeanor', 'Vorlage falscher Identifikation', 'Vorzeigen gefälschter oder irreführender Ausweispapiere gegenüber Behörden.', 300, 12),
(79, 7, 'misdemeanor', 'Körperverletzung', 'Absichtliche Zufügung körperlichen Schadens an einer anderen Person.', 0, 12),
(80, 7, 'felony', 'Raub', 'Wegnahme von Eigentum durch Gewalt oder Einschüchterung.', 0, 36),
(81, 7, 'felony', 'Tötung', 'Die rechtswidrige Tötung einer anderen Person.', 0, 120),
(82, 7, 'felony', 'Häusliche Gewalt', 'Körperlicher oder emotionaler Missbrauch innerhalb eines Haushalts oder einer engen Beziehung.', 0, 36),
(83, 7, 'felony', 'Entführung', 'Rechtswidrige Festnahme und Festhaltung einer Person gegen deren Willen.', 0, 120),
(84, 7, 'felony', 'Gefährliche Körperverletzung', 'Angriff, der schwere körperliche Schäden verursacht oder eine Waffe einsetzt.', 0, 60),
(85, 7, 'misdemeanor', 'Körperverletzung ohne Einwilligung', 'Absichtlicher körperlicher Kontakt oder Schaden an einer anderen Person ohne deren Zustimmung.', 0, 12),
(86, 7, 'felony', 'Terroristische Drohungen', 'Androhung von Gewalt zur Verursachung von Angst oder Störung.', 0, 48),
(87, 7, 'felony', 'Tötung im Straßenverkehr', 'Verursachung eines Todes durch fahrlässiges oder rücksichtsloses Fahren.', 0, 60),
(88, 7, 'felony', 'Hassverbrechen', 'Straftat, die durch Vorurteile gegen die Rasse, Religion oder andere Merkmale einer Person motiviert ist.', 0, 48),
(89, 7, 'felony', 'Misshandlung von Kindern', 'Körperlicher, emotionaler oder sexueller Missbrauch eines Minderjährigen.', 0, 72),
(90, 7, 'misdemeanor', 'Rücksichtsloses Gefährden', 'Handlungen, die anderen ernsthaften Schaden zufügen könnten.', 0, 12),
(93, 7, 'misdemeanor', 'Stalking', 'Wiederholtes Verfolgen oder Belästigen einer Person, das Angst verursacht.', 0, 12),
(94, 8, 'felony', 'Hacking', 'Unbefugter Zugriff auf Computersysteme.', 0, 36),
(95, 8, 'felony', 'Phishing', 'Verwendung gefälschter Kommunikation zur Erlangung sensibler Informationen.', 1500, 24),
(96, 8, 'misdemeanor', 'Online-Belästigung', 'Mobbing oder Bedrohung einer Person über das Internet.', 500, 0),
(97, 8, 'felony', 'Unbefugter Zugriff auf Computersysteme', 'Hacken von Computersystemen ohne Erlaubnis.', 3000, 48),
(98, 9, 'infraction', 'Überfischung', 'Überschreiten der gesetzlichen Fangquoten.', 500, 0),
(99, 9, 'felony', 'Illegale Abholzung', 'Holzeinschlag ohne Genehmigung.', 3000, 36),
(100, 9, 'felony', 'Handel mit gefährdeten Arten', 'Handel mit Tieren oder Pflanzen, die durch Naturschutzgesetze geschützt sind.', 0, 48),
(101, 9, 'felony', 'Illegale Bergbauaktivitäten', 'Gewinnung von Mineralien oder Ressourcen ohne entsprechende Genehmigungen.', 4000, 60),
(102, 9, 'misdemeanor', 'Illegale Müllentsorgung', 'Entsorgung von Abfällen in nicht autorisierten Bereichen.', 750, 0),
(103, 9, 'felony', 'Wilderei', 'Illegale Jagd oder Fang von Wildtieren.', 4000, 36),
(104, 10, 'misdemeanor', 'Unruhestiftung', 'Sich in der Öffentlichkeit störend oder ungebührlich verhalten.', 300, 0),
(105, 10, 'infraction', 'Öffentliche Trunkenheit', 'Sichtbar betrunken oder beeinträchtigt in der Öffentlichkeit sein.', 150, 0),
(106, 10, 'infraction', 'Herumlungern', 'Sich ohne legitimen Grund in einem Gebiet aufhalten.', 50, 0),
(107, 10, 'infraction', 'Störung des öffentlichen Friedens', 'Lautes oder störendes Verhalten in der Öffentlichkeit.', 100, 0),
(108, 10, 'felony', 'Aufruhr', 'Teilnahme an einer gewalttätigen öffentlichen Unruhe.', 0, 36),
(109, 10, 'misdemeanor', 'Prostitution', 'Erbringung oder Anbieten sexueller Dienstleistungen gegen Geld.', 500, 0),
(110, 10, 'misdemeanor', 'Hassrede', 'Äußerungen, die Gewalt oder Hass gegen eine Gruppe anstiften sollen.', 1000, 0),
(111, 10, 'infraction', 'Rechtswidrige Versammlung', 'Zusammenkünfte mit anderen auf eine Weise, die den öffentlichen Frieden stört.', 100, 0),
(112, 10, 'infraction', 'Illegale Proteste', 'Organisation oder Teilnahme an einem Protest ohne entsprechende Genehmigung.', 100, 0),
(113, 10, 'misdemeanor', 'Unsittliche Entblößung', 'Absichtliches Entblößen privater Körperteile in der Öffentlichkeit.', 500, 0),
(114, 10, 'felony', 'Behinderung der Justiz', 'Einmischung in Strafverfolgungs- oder Gerichtsverfahren.', 0, 24),
(115, 10, 'felony', 'Bestechung', 'Etwas Wertvolles anbieten oder annehmen, um Entscheidungen zu beeinflussen.', 5000, 36),
(117, 10, 'felony', 'Anstiftung zu einem Aufruhr', 'Ermutigung oder Anstiftung einer Gruppe zu gewalttätigem Verhalten.', 0, 48);

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_offences_categories`
--

CREATE TABLE `lbtablet_police_offences_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbtablet_police_offences_categories`
--

INSERT INTO `lbtablet_police_offences_categories` (`id`, `title`) VALUES
(3, 'Eigentumsdelikte'),
(6, 'Verschiedene Verbrechen'),
(5, 'Wirtschaftskriminalität'),
(7, 'Gewaltverbrechen'),
(8, 'Cyberkriminalität'),
(10, 'Straftaten gegen die öffentliche Ordnung'),
(4, 'Verkehrsverstöße'),
(9, 'Umweltdelikte'),
(2, 'Waffendelikte'),
(1, 'Drogendelikte');

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_profiles`
--

CREATE TABLE `lbtablet_police_profiles` (
  `id` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `notes` text NOT NULL DEFAULT '',
  `profile_type` varchar(50) NOT NULL DEFAULT 'player'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_profile_tags`
--

CREATE TABLE `lbtablet_police_profile_tags` (
  `id` varchar(100) NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_reports`
--

CREATE TABLE `lbtablet_police_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_type` varchar(100) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_reports_attachments`
--

CREATE TABLE `lbtablet_police_reports_attachments` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_reports_involved`
--

CREATE TABLE `lbtablet_police_reports_involved` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `involved` varchar(100) NOT NULL,
  `involvement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_reports_tags`
--

CREATE TABLE `lbtablet_police_reports_tags` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_tags`
--

CREATE TABLE `lbtablet_police_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_warrants`
--

CREATE TABLE `lbtablet_police_warrants` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `warrant_type` varchar(100) NOT NULL,
  `warrant_status` varchar(50) NOT NULL DEFAULT 'active',
  `priority` varchar(50) NOT NULL DEFAULT 'low',
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_warrants_attachments`
--

CREATE TABLE `lbtablet_police_warrants_attachments` (
  `warrant_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_warrants_linked_reports`
--

CREATE TABLE `lbtablet_police_warrants_linked_reports` (
  `warrant_id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_warrants_tags`
--

CREATE TABLE `lbtablet_police_warrants_tags` (
  `warrant_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_weapons`
--

CREATE TABLE `lbtablet_police_weapons` (
  `serial_number` varchar(100) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `weapon_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_registration_characters`
--

CREATE TABLE `lbtablet_registration_characters` (
  `identifier` varchar(100) NOT NULL,
  `character_id` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `dateofbirth` varchar(20) NOT NULL,
  `is_male` tinyint(1) NOT NULL,
  `job` varchar(100) NOT NULL DEFAULT 'unemployed',
  `height` smallint(5) UNSIGNED NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `description` text NOT NULL DEFAULT '',
  `phone_number` varchar(20) NOT NULL DEFAULT '',
  `jail` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_registration_licenses`
--

CREATE TABLE `lbtablet_registration_licenses` (
  `character_id` varchar(100) NOT NULL,
  `license` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_registration_properties`
--

CREATE TABLE `lbtablet_registration_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `character_id` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_registration_vehicles`
--

CREATE TABLE `lbtablet_registration_vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `character_id` varchar(100) NOT NULL,
  `plate` varchar(20) NOT NULL,
  `model` varchar(100) NOT NULL,
  `color` varchar(20) NOT NULL,
  `picture` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_tablets`
--

CREATE TABLE `lbtablet_tablets` (
  `id` varchar(100) NOT NULL,
  `tablet_name` varchar(50) NOT NULL,
  `settings` longtext DEFAULT NULL,
  `battery` tinyint(3) UNSIGNED NOT NULL DEFAULT 100,
  `is_setup` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_voice_memo_recordings`
--

CREATE TABLE `lbtablet_voice_memo_recordings` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_length` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('boat', 'Bootsführerschein'),
('dmv', 'Führerscheinprüfung'),
('drive', 'Führerschein'),
('drive_bike', 'Motorradführerschein'),
('drive_truck', 'LKW-Führerschein'),
('weapon', 'Waffenschein');

-- --------------------------------------------------------

--
-- Structure de la table `livraisons`
--

CREATE TABLE `livraisons` (
  `uniqueid` int(11) NOT NULL,
  `levels` int(11) DEFAULT 0,
  `gains` int(11) NOT NULL DEFAULT 100,
  `livraisons` int(11) DEFAULT 0,
  `vehicle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livraisons`
--

INSERT INTO `livraisons` (`uniqueid`, `levels`, `gains`, `livraisons`, `vehicle`) VALUES
(75, 50, 100, 5, '[\"boxville\"]'),
(142, 10, 100, 1, '[\"boxville\"]'),
(156, 50, 100, 5, '[\"boxville\"]'),
(166, 440, 400, 44, '[\"packer\"]'),
(210, 420, 400, 242, '[\"packer\"]'),
(252, 0, 500, 50, '[\"packer\"]'),
(219, 40, 100, 4, '[\"boxville\"]'),
(265, 30, 100, 3, '[\"boxville\"]'),
(234, 300, 300, 80, '[\"mule\"]'),
(274, 0, 100, 0, '[\"boxville\"]'),
(207, 0, 100, 0, '[\"boxville\"]'),
(291, 220, 200, 222, '[\"mule\"]'),
(310, 210, 200, 321, '[\"mule\"]'),
(232, 0, 100, 0, '[\"boxville\"]'),
(226, 0, 100, 0, '[\"boxville\"]'),
(171, 40, 100, 4, '[\"boxville\"]'),
(237, 40, 100, 4, '[\"boxville\"]'),
(257, 0, 100, 0, '[\"boxville\"]'),
(408, 100, 100, 10, '[\"boxville\"]'),
(201, 50, 500, 155, '[\"boxville\"]'),
(373, 40, 100, 4, '[\"boxville\"]'),
(438, 200, 200, 20, '[\"mule\"]'),
(276, 10, 100, 1, '[\"boxville\"]'),
(376, 60, 100, 6, '[\"boxville\"]'),
(466, 10, 100, 1, '[\"boxville\"]'),
(325, 90, 100, 9, '[\"boxville\"]'),
(279, 70, 100, 7, '[\"boxville\"]'),
(499, 80, 100, 8, '[\"boxville\"]'),
(236, 10, 100, 1, '[\"boxville\"]'),
(523, 10, 100, 1, '[\"boxville\"]'),
(505, 180, 100, 18, '[\"boxville\"]'),
(480, 0, 100, 0, '[\"boxville\"]'),
(412, 30, 100, 3, '[\"boxville\"]'),
(597, 10, 100, 1, '[\"boxville\"]'),
(606, 0, 100, 0, '[\"boxville\"]'),
(596, 110, 100, 11, '[\"boxville\"]'),
(643, 190, 100, 19, '[\"boxville\"]'),
(664, 70, 100, 7, '[\"boxville\"]'),
(642, 490, 400, 49, '[\"packer\"]'),
(695, 240, 200, 124, '[\"mule\"]'),
(681, 20, 100, 2, '[\"boxville\"]'),
(696, 110, 100, 11, '[\"boxville\"]'),
(692, 90, 100, 9, '[\"boxville\"]'),
(748, 40, 100, 4, '[\"boxville\"]'),
(571, 10, 100, 1, '[\"boxville\"]'),
(810, 30, 100, 3, '[\"boxville\"]'),
(806, 100, 100, 160, '[\"boxville\"]'),
(805, 70, 100, 7, '[\"boxville\"]'),
(808, 30, 100, 3, '[\"boxville\"]'),
(551, 110, 100, 11, '[\"boxville\"]'),
(559, 40, 100, 4, '[\"boxville\"]'),
(173, 0, 100, 0, '[\"boxville\"]'),
(856, 90, 100, 9, '[\"boxville\"]'),
(624, 40, 100, 4, '[\"boxville\"]'),
(566, 50, 100, 5, '[\"boxville\"]'),
(786, 20, 500, 52, '[\"boxville\"]'),
(378, 50, 100, 5, '[\"boxville\"]'),
(686, 50, 100, 5, '[\"boxville\"]'),
(661, 20, 100, 2, '[\"boxville\"]'),
(330, 180, 100, 18, '[\"boxville\"]'),
(222, 120, 100, 62, '[\"boxville\"]'),
(922, 10, 100, 1, '[\"boxville\"]'),
(579, 320, 300, 82, '[\"mule\"]'),
(1075, 120, 100, 12, '[\"boxville\"]'),
(1096, 10, 100, 1, '[\"boxville\"]'),
(1108, 330, 300, 33, '[\"mule\"]'),
(214, 0, 100, 0, '[\"boxville\"]'),
(1150, 70, 100, 7, '[\"boxville\"]'),
(1166, 20, 100, 2, '[\"boxville\"]'),
(1102, 100, 100, 10, '[\"boxville\"]'),
(1103, 0, 500, 50, '[\"packer\"]'),
(1106, 30, 100, 3, '[\"boxville\"]'),
(1236, 230, 200, 73, '[\"mule\"]'),
(1197, 10, 100, 1, '[\"boxville\"]'),
(1305, 30, 100, 3, '[\"boxville\"]'),
(1263, 120, 100, 62, '[\"boxville\"]'),
(1147, 20, 100, 2, '[\"boxville\"]'),
(1256, 340, 300, 34, '[\"mule\"]'),
(583, 120, 100, 112, '[\"boxville\"]'),
(1327, 70, 100, 7, '[\"boxville\"]'),
(1334, 110, 100, 11, '[\"boxville\"]'),
(1326, 200, 200, 20, '[\"mule\"]'),
(1339, 380, 300, 38, '[\"mule\"]'),
(1377, 110, 100, 11, '[\"boxville\"]'),
(1394, 40, 100, 4, '[\"boxville\"]'),
(1275, 230, 200, 23, '[\"mule\"]'),
(1421, 80, 500, 158, '[\"boxville\"]'),
(1420, 420, 400, 92, '[\"packer\"]'),
(1438, 0, 100, 0, '[\"boxville\"]'),
(1222, 60, 100, 6, '[\"boxville\"]'),
(205, 10, 500, 251, '[\"boxville\"]'),
(1364, 320, 300, 132, '[\"mule\"]'),
(843, 70, 100, 7, '[\"boxville\"]'),
(603, 70, 500, 107, '[\"boxville\"]'),
(1487, 90, 100, 9, '[\"boxville\"]'),
(585, 60, 100, 6, '[\"boxville\"]'),
(824, 80, 100, 8, '[\"boxville\"]'),
(1515, 60, 100, 6, '[\"boxville\"]'),
(1562, 50, 100, 5, '[\"boxville\"]'),
(1542, 200, 200, 20, '[\"mule\"]'),
(321, 110, 100, 11, '[\"boxville\"]'),
(1529, 60, 100, 6, '[\"boxville\"]'),
(1582, 40, 100, 4, '[\"boxville\"]'),
(1526, 50, 100, 5, '[\"boxville\"]'),
(557, 210, 200, 121, '[\"mule\"]'),
(1516, 0, 100, 0, '[\"boxville\"]'),
(722, 140, 100, 64, '[\"boxville\"]'),
(221, 20, 100, 2, '[\"boxville\"]'),
(369, 10, 100, 1, '[\"boxville\"]'),
(1618, 80, 100, 8, '[\"boxville\"]'),
(471, 180, 100, 18, '[\"boxville\"]'),
(1689, 0, 100, 0, '[\"boxville\"]'),
(1704, 20, 100, 2, '[\"boxville\"]'),
(1744, 0, 100, 0, '[\"boxville\"]'),
(1498, 40, 100, 4, '[\"boxville\"]'),
(1894, 0, 100, 0, '[\"boxville\"]'),
(1888, 0, 100, 0, '[\"boxville\"]'),
(1955, 20, 100, 2, '[\"boxville\"]'),
(1459, 0, 100, 0, '[\"boxville\"]');

-- --------------------------------------------------------

--
-- Structure de la table `maintenant`
--

CREATE TABLE `maintenant` (
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `maintenant`
--

INSERT INTO `maintenant` (`active`) VALUES
(0);

-- --------------------------------------------------------

--
-- Structure de la table `moto_categories`
--

CREATE TABLE `moto_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `moto_categories`
--

INSERT INTO `moto_categories` (`name`, `label`) VALUES
('motorcycles', 'Motorrad');

-- --------------------------------------------------------

--
-- Structure de la table `open_car`
--

CREATE TABLE `open_car` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `got` varchar(50) DEFAULT NULL,
  `NB` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(50) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `doubles` longtext NOT NULL DEFAULT '{"cles":[]}',
  `plate` varchar(255) NOT NULL,
  `vehicle` longtext NOT NULL,
  `status` int(12) DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `numero` int(12) DEFAULT NULL,
  `garage` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `degat` longtext DEFAULT NULL,
  `boutique` tinyint(1) NOT NULL DEFAULT 0,
  `garageid` int(11) NOT NULL DEFAULT 1,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `label` longtext NOT NULL DEFAULT 'A MODIFIER',
  `type` varchar(50) DEFAULT 'car',
  `job` text DEFAULT '\'unemployed\'',
  `propertiesID` int(11) DEFAULT 0,
  `fuel` longtext DEFAULT '100',
  `carseller` int(11) DEFAULT 0,
  `neons` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`owner`, `nom`, `doubles`, `plate`, `vehicle`, `status`, `inventory`, `numero`, `garage`, `name`, `position`, `degat`, `boutique`, `garageid`, `state`, `label`, `type`, `job`, `propertiesID`, `fuel`, `carseller`, `neons`) VALUES
('1', NULL, '{\"cles\":[]}', 'MSQZ3793', '{\"color2\":1,\"modTrimB\":-1,\"modFrontBumper\":-1,\"modXenon\":false,\"modTank\":-1,\"modStruts\":-1,\"wheels\":0,\"modTrunk\":-1,\"modDoorR\":-1,\"wheelSize\":1.0,\"modSubwoofer\":-1,\"bulletProofTyres\":true,\"plate\":\"MSQZ3793\",\"modAPlate\":-1,\"modTurbo\":false,\"neonColor\":[255,0,255],\"windows\":[4,5],\"modHydraulics\":false,\"modGrille\":-1,\"modOrnaments\":-1,\"modVanityPlate\":-1,\"dashboardColor\":0,\"modTrimA\":-1,\"modFrame\":-1,\"modSpeakers\":-1,\"fuelLevel\":22,\"modExhaust\":-1,\"modSeats\":-1,\"modRoof\":-1,\"engineHealth\":1000,\"pearlescentColor\":5,\"modSideSkirt\":-1,\"modHorns\":-1,\"modPlateHolder\":-1,\"modSpoilers\":-1,\"tyres\":[],\"modSmokeEnabled\":false,\"modEngine\":-1,\"interiorColor\":0,\"wheelColor\":156,\"driftTyres\":false,\"modDashboard\":-1,\"tankHealth\":1000,\"neonEnabled\":[false,false,false,false],\"paintType2\":7,\"modSuspension\":-1,\"modAirFilter\":-1,\"model\":970598228,\"modFender\":-1,\"modRoofLivery\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"modEngineBlock\":-1,\"modSteeringWheel\":-1,\"doors\":[],\"paintType1\":7,\"oilLevel\":5,\"modDoorSpeaker\":-1,\"wheelWidth\":1.0,\"modNitrous\":-1,\"modShifterLeavers\":-1,\"dirtLevel\":4,\"bodyHealth\":1000,\"color1\":1,\"modHood\":-1,\"modAerials\":-1,\"modLightbar\":-1,\"modFrontWheels\":-1,\"windowTint\":-1,\"modCustomTiresF\":false,\"modRightFender\":-1,\"modArchCover\":-1,\"modWindows\":-1,\"modRearBumper\":-1,\"extras\":{\"10\":1,\"12\":0},\"modArmor\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":0,\"modHydrolic\":-1,\"modDial\":-1,\"modCustomTiresR\":false,\"xenonColor\":255}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 'sultan', 'car', '\'unemployed\'', 0, '100', 0, 0),
('1', NULL, '{\"cles\":[]}', 'RWFP1366', '{\"modTurbo\":false,\"modTank\":-1,\"modRoof\":-1,\"modDoorSpeaker\":-1,\"modLightbar\":-1,\"bodyHealth\":1000,\"modTransmission\":-1,\"modExhaust\":-1,\"dirtLevel\":3,\"modArmor\":-1,\"modRoofLivery\":-1,\"modBrakes\":-1,\"modSubwoofer\":-1,\"dashboardColor\":0,\"modLivery\":-1,\"paintType2\":7,\"tyreSmokeColor\":[255,255,255],\"modFender\":-1,\"windowTint\":-1,\"xenonColor\":255,\"tyres\":[],\"modAPlate\":-1,\"neonEnabled\":[false,false,false,false],\"modSpeakers\":-1,\"modFrontWheels\":-1,\"modRearBumper\":-1,\"color1\":1,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"modDashboard\":-1,\"neonColor\":[255,0,255],\"modStruts\":-1,\"modNitrous\":-1,\"modEngineBlock\":-1,\"modDoorR\":-1,\"modEngine\":-1,\"modRightFender\":-1,\"modFrame\":-1,\"modSteeringWheel\":-1,\"wheelWidth\":1.0,\"modArchCover\":-1,\"engineHealth\":1000,\"tankHealth\":1000,\"model\":970598228,\"doors\":[],\"windows\":[4,5],\"bulletProofTyres\":true,\"modSmokeEnabled\":false,\"modTrunk\":-1,\"modCustomTiresR\":false,\"modCustomTiresF\":false,\"modAerials\":-1,\"fuelLevel\":44,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"paintType1\":7,\"modTrimB\":-1,\"plateIndex\":0,\"modDial\":-1,\"modTrimA\":-1,\"modAirFilter\":-1,\"modBackWheels\":-1,\"plate\":\"RWFP1366\",\"modHorns\":-1,\"modHydraulics\":false,\"modXenon\":false,\"extras\":{\"10\":1,\"12\":1},\"driftTyres\":false,\"modGrille\":-1,\"oilLevel\":5,\"modWindows\":-1,\"modFrontBumper\":-1,\"modHood\":-1,\"wheels\":0,\"modShifterLeavers\":-1,\"modSeats\":-1,\"pearlescentColor\":5,\"modOrnaments\":-1,\"modHydrolic\":-1,\"wheelColor\":156,\"modSuspension\":-1,\"interiorColor\":0,\"wheelSize\":1.0,\"color2\":1}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 'sultan', 'car', '\'unemployed\'', 0, '100', 0, 0),
('gouvernement', NULL, '{\"cles\":[]}', 'TCII3409', '{\"modTurbo\":false,\"modTank\":-1,\"modRoof\":-1,\"modDoorSpeaker\":-1,\"modLightbar\":-1,\"bodyHealth\":1000,\"modTransmission\":-1,\"modExhaust\":-1,\"dirtLevel\":8,\"modArmor\":-1,\"modRoofLivery\":-1,\"modBrakes\":-1,\"modSubwoofer\":-1,\"dashboardColor\":0,\"modLivery\":-1,\"paintType2\":7,\"tyreSmokeColor\":[255,255,255],\"modFender\":-1,\"windowTint\":-1,\"xenonColor\":255,\"tyres\":[],\"modAPlate\":-1,\"neonEnabled\":[false,false,false,false],\"modSpeakers\":-1,\"modFrontWheels\":-1,\"modRearBumper\":-1,\"color1\":1,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"modDashboard\":-1,\"neonColor\":[255,0,255],\"modStruts\":-1,\"modNitrous\":-1,\"modEngineBlock\":-1,\"modDoorR\":-1,\"modEngine\":-1,\"modRightFender\":-1,\"modFrame\":-1,\"modSteeringWheel\":-1,\"wheelWidth\":1.0,\"modArchCover\":-1,\"engineHealth\":1000,\"tankHealth\":1000,\"model\":970598228,\"doors\":[],\"windows\":[4,5],\"bulletProofTyres\":true,\"modSmokeEnabled\":false,\"modTrunk\":-1,\"modCustomTiresR\":false,\"modCustomTiresF\":false,\"modAerials\":-1,\"fuelLevel\":72,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"paintType1\":7,\"modTrimB\":-1,\"plateIndex\":3,\"modDial\":-1,\"modTrimA\":-1,\"modAirFilter\":-1,\"modBackWheels\":-1,\"plate\":\"TCII3409\",\"modHorns\":-1,\"modHydraulics\":false,\"modXenon\":false,\"extras\":{\"10\":1,\"12\":0},\"driftTyres\":false,\"modGrille\":-1,\"oilLevel\":5,\"modWindows\":-1,\"modFrontBumper\":-1,\"modHood\":-1,\"wheels\":0,\"modShifterLeavers\":-1,\"modSeats\":-1,\"pearlescentColor\":5,\"modOrnaments\":-1,\"modHydrolic\":-1,\"wheelColor\":156,\"modSuspension\":-1,\"interiorColor\":0,\"wheelSize\":1.0,\"color2\":1}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 'sultan', 'car', '\'unemployed\'', 0, '100', 0, 0),
('2', NULL, '{\"cles\":[]}', 'WFRF8756', '{\"modFrame\":-1,\"modBackWheels\":-1,\"tankHealth\":1000,\"modLightbar\":-1,\"wheelSize\":1.0,\"modCustomTiresR\":false,\"modHood\":-1,\"modSpoilers\":-1,\"modSteeringWheel\":-1,\"modDashboard\":-1,\"oilLevel\":5,\"modFrontWheels\":-1,\"paintType2\":7,\"modEngineBlock\":-1,\"modDoorR\":-1,\"modTrimB\":-1,\"modRoof\":-1,\"modTransmission\":-1,\"driftTyres\":false,\"modStruts\":-1,\"wheelWidth\":1.0,\"tyreSmokeColor\":[255,255,255],\"modExhaust\":-1,\"modLivery\":-1,\"color2\":1,\"dirtLevel\":5,\"modGrille\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"modAerials\":-1,\"modRightFender\":-1,\"modSpeakers\":-1,\"modCustomTiresF\":false,\"modHydrolic\":-1,\"modDoorSpeaker\":-1,\"xenonColor\":255,\"wheels\":0,\"dashboardColor\":0,\"modVanityPlate\":-1,\"modSubwoofer\":-1,\"modArchCover\":-1,\"modTurbo\":false,\"modXenon\":false,\"modHydraulics\":false,\"plateIndex\":0,\"modSmokeEnabled\":false,\"modFender\":-1,\"modArmor\":-1,\"extras\":{\"10\":1,\"12\":0},\"paintType1\":7,\"plate\":\"WFRF8756\",\"modRoofLivery\":-1,\"bodyHealth\":1000,\"model\":970598228,\"modTank\":-1,\"windowTint\":-1,\"modTrimA\":-1,\"modSeats\":-1,\"modSuspension\":-1,\"windows\":[4,5],\"modHorns\":-1,\"modPlateHolder\":-1,\"tyres\":[],\"modSideSkirt\":-1,\"color1\":1,\"bulletProofTyres\":true,\"modBrakes\":-1,\"fuelLevel\":46,\"modEngine\":-1,\"modAirFilter\":-1,\"modTrunk\":-1,\"neonColor\":[255,0,255],\"modNitrous\":-1,\"engineHealth\":1000,\"modAPlate\":-1,\"interiorColor\":0,\"modOrnaments\":-1,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"modDial\":-1,\"pearlescentColor\":5,\"wheelColor\":156,\"modWindows\":-1,\"doors\":[]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 'sultan', 'car', '\'unemployed\'', 0, '100', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ox_doorlock`
--

CREATE TABLE `ox_doorlock` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ox_doorlock`
--

INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
(389, 'Benny\'s', '{\"coords\":{\"x\":-230.8119659423828,\"y\":-1326.9986572265626,\"z\":30.24859428405761},\"heading\":270,\"model\":-48831039,\"state\":1,\"doors\":false,\"groups\":{\"mecano\":0},\"maxDistance\":5}'),
(390, 'Benny\'s', '{\"coords\":{\"x\":-215.73533630371095,\"y\":-1313.28564453125,\"z\":30.45402145385742},\"heading\":180,\"model\":-1453834687,\"state\":1,\"doors\":false,\"groups\":{\"mecano\":0},\"maxDistance\":5}'),
(391, 'Benny\'s', '{\"coords\":{\"x\":-207.76943969726563,\"y\":-1313.28564453125,\"z\":30.45402145385742},\"heading\":180,\"model\":-1453834687,\"state\":1,\"doors\":false,\"groups\":{\"mecano\":0},\"maxDistance\":5}'),
(392, 'Benny\'s', '{\"coords\":{\"x\":-230.69924926757813,\"y\":-1315.1455078125,\"z\":31.45024108886718},\"heading\":270,\"model\":-147325430,\"state\":1,\"doors\":false,\"groups\":{\"mecano\":0},\"maxDistance\":2}'),
(393, 'Unicorn', '{\"coords\":{\"x\":127.9578628540039,\"y\":-1298.50732421875,\"z\":29.41817283630371},\"maxDistance\":2,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":-1116041313,\"heading\":30,\"state\":1}'),
(394, 'Unicorn', '{\"coords\":{\"x\":127.47725677490235,\"y\":-1277.9189453125,\"z\":29.40505218505859},\"maxDistance\":2,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":634417522,\"heading\":300,\"state\":1}'),
(395, 'Unicorn', '{\"coords\":{\"x\":102.44144439697266,\"y\":-1301.199951171875,\"z\":29.40505218505859},\"maxDistance\":2,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":634417522,\"heading\":300,\"state\":1}'),
(396, 'Unicorn', '{\"coords\":{\"x\":97.64088439941406,\"y\":-1292.765625,\"z\":29.40505218505859},\"maxDistance\":2,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":634417522,\"heading\":300,\"state\":1}'),
(397, 'Unicorn', '{\"coords\":{\"x\":96.27252197265625,\"y\":-1291.91748046875,\"z\":29.40476608276367},\"maxDistance\":2,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":1226684428,\"heading\":210,\"state\":1}'),
(398, 'Unicorn', '{\"coords\":{\"x\":88.626220703125,\"y\":-1288.3873291015626,\"z\":30.28086280822754},\"maxDistance\":5,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":-190780785,\"heading\":210,\"state\":1}'),
(399, 'Unicorn', '{\"coords\":{\"x\":98.2591781616211,\"y\":-1299.4754638671876,\"z\":29.40505218505859},\"maxDistance\":2,\"groups\":{\"unicorn\":4},\"doors\":false,\"model\":634417522,\"heading\":300,\"state\":1}'),
(403, 'gouv1', '{\"coords\":{\"x\":-568.3768310546875,\"y\":-205.64947509765626,\"z\":38.49808502197265},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-567.73095703125,\"y\":-206.77691650390626,\"z\":38.49820327758789},\"model\":110411286,\"heading\":120},{\"coords\":{\"x\":-569.022705078125,\"y\":-204.52203369140626,\"z\":38.49796295166015},\"model\":110411286,\"heading\":300}]}'),
(404, 'gouv2', '{\"coords\":{\"x\":-560.0321044921875,\"y\":-200.95489501953126,\"z\":38.49074935913086},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-559.3864135742188,\"y\":-202.08290100097657,\"z\":38.49074935913086},\"model\":110411286,\"heading\":120},{\"coords\":{\"x\":-560.6777954101563,\"y\":-199.826904296875,\"z\":38.49074935913086},\"model\":110411286,\"heading\":300}]}'),
(405, 'gouv1', '{\"coords\":{\"x\":-557.024169921875,\"y\":-206.17874145507813,\"z\":38.49187850952148},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-557.671630859375,\"y\":-205.05099487304688,\"z\":38.49187850952148},\"model\":110411286,\"heading\":300},{\"coords\":{\"x\":-556.3766479492188,\"y\":-207.30648803710938,\"z\":38.49187850952148},\"model\":110411286,\"heading\":120}]}'),
(406, 'gouv1', '{\"coords\":{\"x\":-582.6526489257813,\"y\":-195.2283935546875,\"z\":38.60475158691406},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-581.834716796875,\"y\":-194.75848388671876,\"z\":38.60488128662109},\"model\":114775988,\"heading\":29},{\"coords\":{\"x\":-583.4705810546875,\"y\":-195.6982879638672,\"z\":38.60461807250976},\"model\":114775988,\"heading\":210}]}'),
(407, 'gouv1', '{\"coords\":{\"x\":-537.8333740234375,\"y\":-192.86798095703126,\"z\":38.3768081665039},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"model\":964838196,\"heading\":210,\"maxDistance\":3,\"doors\":false}'),
(408, 'gouv1', '{\"coords\":{\"x\":-543.501708984375,\"y\":-183.0404052734375,\"z\":38.37517929077148},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"model\":964838196,\"heading\":210,\"maxDistance\":3,\"doors\":false}'),
(409, 'gouv1', '{\"coords\":{\"x\":-552.1119995117188,\"y\":-191.58355712890626,\"z\":47.53792953491211},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":2,\"doors\":[{\"coords\":{\"x\":-553.2390747070313,\"y\":-192.22940063476563,\"z\":47.53792953491211},\"model\":110411286,\"heading\":30},{\"coords\":{\"x\":-550.9849243164063,\"y\":-190.9376983642578,\"z\":47.53792953491211},\"model\":110411286,\"heading\":210}]}'),
(410, 'gouv1', '{\"coords\":{\"x\":-546.9791870117188,\"y\":-191.7211456298828,\"z\":47.54242706298828},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-546.326171875,\"y\":-192.84524536132813,\"z\":47.54278945922851},\"model\":110411286,\"heading\":120},{\"coords\":{\"x\":-547.6322021484375,\"y\":-190.5970458984375,\"z\":47.54206848144531},\"model\":110411286,\"heading\":300}]}'),
(411, 'gouv1', '{\"coords\":{\"x\":-549.3726806640625,\"y\":-196.3401336669922,\"z\":47.53807830810547},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-550.5003662109375,\"y\":-196.98597717285157,\"z\":47.53807830810547},\"model\":110411286,\"heading\":30},{\"coords\":{\"x\":-548.2450561523438,\"y\":-195.6942901611328,\"z\":47.53807830810547},\"model\":110411286,\"heading\":210}]}'),
(412, 'gus', '{\"passcode\":\"4968\",\"state\":1,\"characters\":[4],\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-816.7160034179688,\"y\":179.09796142578126,\"z\":72.82737731933594},\"heading\":291,\"model\":159994461},{\"coords\":{\"x\":-816.1068115234375,\"y\":177.5108642578125,\"z\":72.82737731933594},\"heading\":291,\"model\":-1686014385}],\"coords\":{\"x\":-816.411376953125,\"y\":178.30441284179688,\"z\":72.82737731933594},\"autolock\":5}'),
(416, 'vec3(-593.979492, -418.964874, 35.145230)', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-593.9794921875,\"y\":-418.9648742675781,\"z\":35.14522933959961},\"model\":-1498371782,\"doors\":false,\"maxDistance\":2,\"heading\":90,\"state\":1}'),
(421, 'ambu1', '{\"groups\":{\"ambulance\":0},\"coords\":{\"x\":309.2215576171875,\"y\":-573.7056884765625,\"z\":43.43328094482422},\"doors\":[{\"heading\":160,\"model\":-164945599,\"coords\":{\"x\":310.43975830078127,\"y\":-574.1490478515625,\"z\":43.43328094482422}},{\"heading\":340,\"model\":-164945599,\"coords\":{\"x\":308.00335693359377,\"y\":-573.2622680664063,\"z\":43.43328094482422}}],\"maxDistance\":2,\"state\":1}'),
(422, 'ambu2', '{\"groups\":{\"ambulance\":0},\"coords\":{\"x\":309.28558349609377,\"y\":-592.2650146484375,\"z\":43.42947006225586},\"model\":-1999925837,\"doors\":false,\"maxDistance\":2,\"heading\":340,\"state\":1}'),
(423, 'ambu3', '{\"groups\":{\"ambulance\":0},\"coords\":{\"x\":317.9701843261719,\"y\":-595.43115234375,\"z\":43.41217041015625},\"model\":-1999925837,\"doors\":false,\"maxDistance\":2,\"heading\":340,\"state\":1}'),
(424, 'ambu4', '{\"groups\":{\"ambulance\":0},\"coords\":{\"x\":310.9762268066406,\"y\":-589.470458984375,\"z\":50.82203674316406},\"model\":-1999925837,\"doors\":false,\"maxDistance\":2,\"heading\":70,\"state\":1}'),
(425, 'ambu5', '{\"groups\":{\"ambulance\":0},\"coords\":{\"x\":317.0753173828125,\"y\":-588.8892211914063,\"z\":38.48796844482422},\"model\":-1999925837,\"doors\":false,\"maxDistance\":2,\"heading\":250,\"state\":1}'),
(426, 'gouv1', '{\"groups\":{\"gouvernement\":0},\"coords\":{\"x\":-545.5143432617188,\"y\":-203.3874969482422,\"z\":38.62826919555664},\"doors\":[{\"heading\":30,\"model\":2537604,\"coords\":{\"x\":-544.52197265625,\"y\":-202.8148956298828,\"z\":38.62826919555664}},{\"heading\":210,\"model\":2537604,\"coords\":{\"x\":-546.5067138671875,\"y\":-203.96009826660157,\"z\":38.62826919555664}}],\"maxDistance\":2,\"state\":0}'),
(433, 'cell1', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-570.6097412109375,\"y\":-434.10223388671877,\"z\":31.31497764587402},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(434, 'cell2', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-570.5843505859375,\"y\":-430.881591796875,\"z\":31.31951904296875},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(435, 'cell3', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-567.0748901367188,\"y\":-430.90771484375,\"z\":31.31951904296875},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(436, 'cell5', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-563.6044311523438,\"y\":-430.93353271484377,\"z\":31.31951904296875},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(437, 'cell6', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-560.2372436523438,\"y\":-430.9092712402344,\"z\":31.31951904296875},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(438, 'cell7', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-560.2557373046875,\"y\":-434.14801025390627,\"z\":31.31497764587402},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(439, 'cell8', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-563.6453247070313,\"y\":-434.122802734375,\"z\":31.31497764587402},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(440, 'cell9', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-567.10986328125,\"y\":-434.0970153808594,\"z\":31.31497764587402},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(441, 'cell10', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-550.1203002929688,\"y\":-434.12213134765627,\"z\":31.31497764587402},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(442, 'cell11', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-546.7158813476563,\"y\":-434.1474609375,\"z\":31.31951904296875},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(443, 'cell12', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-546.6907958984375,\"y\":-430.7794189453125,\"z\":31.31951904296875},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(444, 'cell13', '{\"groups\":{\"police\":0},\"coords\":{\"x\":-550.0977783203125,\"y\":-430.7540588378906,\"z\":31.31951904296875},\"model\":-557732756,\"doors\":false,\"maxDistance\":2,\"heading\":360,\"state\":1}'),
(446, 'ltdballas1', '{\"groups\":{\"ltd_ballas\":0},\"coords\":{\"x\":-52.96390533447265,\"y\":-1756.552001953125,\"z\":29.57094001770019},\"doors\":[{\"heading\":140,\"model\":-868672903,\"coords\":{\"x\":-53.96111297607422,\"y\":-1755.7171630859376,\"z\":29.57094001770019}},{\"heading\":320,\"model\":2065277225,\"coords\":{\"x\":-51.96669387817383,\"y\":-1757.38671875,\"z\":29.57094001770019}}],\"maxDistance\":2,\"state\":0}'),
(447, 'ltdf4l1', '{\"groups\":{\"ltd_f4l\":0},\"coords\":{\"x\":29.11810684204101,\"y\":-1349.1689453125,\"z\":29.6469612121582},\"doors\":[{\"heading\":180,\"model\":1196685123,\"coords\":{\"x\":27.8176097869873,\"y\":-1349.1689453125,\"z\":29.6469612121582}},{\"heading\":0,\"model\":997554217,\"coords\":{\"x\":30.41860198974609,\"y\":-1349.1689453125,\"z\":29.6469612121582}}],\"maxDistance\":2,\"state\":0}'),
(448, 'ltdseoul', '{\"groups\":{\"ltd_littleseoul\":0},\"coords\":{\"x\":-711.772705078125,\"y\":-916.5390625,\"z\":19.36553382873535},\"doors\":[{\"heading\":180,\"model\":-868672903,\"coords\":{\"x\":-713.0731811523438,\"y\":-916.5408935546875,\"z\":19.36553382873535}},{\"heading\":0,\"model\":2065277225,\"coords\":{\"x\":-710.4722290039063,\"y\":-916.5372314453125,\"z\":19.36553382873535}}],\"maxDistance\":2,\"state\":0}'),
(449, 'ltdpaleto1', '{\"groups\":{\"ltd_paletobay\":0},\"coords\":{\"x\":162.51104736328126,\"y\":6637.0400390625,\"z\":31.86056327819824},\"doors\":[{\"heading\":135,\"model\":1196685123,\"coords\":{\"x\":161.59323120117188,\"y\":6637.96142578125,\"z\":31.86056327819824}},{\"heading\":315,\"model\":997554217,\"coords\":{\"x\":163.42886352539063,\"y\":6636.11865234375,\"z\":31.86056327819824}}],\"maxDistance\":2,\"state\":0}'),
(450, 'weazel', '{\"groups\":{\"weazelnews\":0},\"coords\":{\"x\":-586.9149169921875,\"y\":-931.13671875,\"z\":24.01955986022949},\"doors\":[{\"heading\":270,\"model\":300848144,\"coords\":{\"x\":-586.903076171875,\"y\":-932.4364013671875,\"z\":24.01955986022949}},{\"heading\":91,\"model\":300848144,\"coords\":{\"x\":-586.9266967773438,\"y\":-929.8370971679688,\"z\":24.01955986022949}}],\"maxDistance\":2,\"state\":1}'),
(451, 'weazel2', '{\"groups\":{\"weazelnews\":0},\"coords\":{\"x\":-577.70361328125,\"y\":-926.956298828125,\"z\":24.02485847473144},\"doors\":[{\"heading\":359,\"model\":-1821777087,\"coords\":{\"x\":-576.4049072265625,\"y\":-926.9589233398438,\"z\":24.02485847473144}},{\"heading\":180,\"model\":-1821777087,\"coords\":{\"x\":-579.0022583007813,\"y\":-926.9537353515625,\"z\":24.02485847473144}}],\"maxDistance\":2,\"state\":1}'),
(452, 'weazelnews3', '{\"groups\":{\"weazelnews\":0},\"coords\":{\"x\":-570.0327758789063,\"y\":-931.954345703125,\"z\":24.02485847473144},\"doors\":[{\"heading\":270,\"model\":-1821777087,\"coords\":{\"x\":-570.0327758789063,\"y\":-933.25341796875,\"z\":24.02485847473144}},{\"heading\":90,\"model\":-1821777087,\"coords\":{\"x\":-570.0327758789063,\"y\":-930.6552124023438,\"z\":24.02485847473144}}],\"maxDistance\":2,\"state\":1}'),
(453, 'weazelnews5', '{\"groups\":{\"weazelnews\":0},\"coords\":{\"x\":-574.777587890625,\"y\":-939.5743408203125,\"z\":24.02605819702148},\"doors\":[{\"heading\":360,\"model\":1808123841,\"coords\":{\"x\":-576.0771484375,\"y\":-939.5714111328125,\"z\":24.02605819702148}},{\"heading\":180,\"model\":1808123841,\"coords\":{\"x\":-573.4779663085938,\"y\":-939.5773315429688,\"z\":24.02605819702148}}],\"maxDistance\":2,\"state\":1}'),
(454, 'wiwang1', '{\"groups\":{\"wiwang\":0},\"coords\":{\"x\":-826.434814453125,\"y\":-688.5369873046875,\"z\":28.35738372802734},\"doors\":[{\"heading\":90,\"model\":-237708675,\"coords\":{\"x\":-826.434814453125,\"y\":-687.47900390625,\"z\":28.35738372802734}},{\"heading\":270,\"model\":346857544,\"coords\":{\"x\":-826.434814453125,\"y\":-689.5949096679688,\"z\":28.35738372802734}}],\"maxDistance\":2,\"state\":1}'),
(455, 'wiwang2', '{\"groups\":{\"wiwang\":0},\"coords\":{\"x\":-826.434814453125,\"y\":-691.5411376953125,\"z\":28.35738372802734},\"doors\":[{\"heading\":90,\"model\":-237708675,\"coords\":{\"x\":-826.434814453125,\"y\":-690.483154296875,\"z\":28.35738372802734}},{\"heading\":270,\"model\":346857544,\"coords\":{\"x\":-826.434814453125,\"y\":-692.5990600585938,\"z\":28.35738372802734}}],\"maxDistance\":2,\"state\":1}'),
(456, 'wiwang3', '{\"groups\":{\"wiwang\":0},\"coords\":{\"x\":-826.434814453125,\"y\":-696.862548828125,\"z\":28.35738372802734},\"doors\":[{\"heading\":90,\"model\":-237708675,\"coords\":{\"x\":-826.434814453125,\"y\":-695.8046264648438,\"z\":28.35738372802734}},{\"heading\":270,\"model\":346857544,\"coords\":{\"x\":-826.434814453125,\"y\":-697.9205322265625,\"z\":28.35738372802734}}],\"maxDistance\":2,\"state\":1}'),
(457, 'wiwang4', '{\"groups\":{\"wiwang\":0},\"coords\":{\"x\":-826.434814453125,\"y\":-699.8653564453125,\"z\":28.35738372802734},\"doors\":[{\"heading\":90,\"model\":-237708675,\"coords\":{\"x\":-826.434814453125,\"y\":-698.8074340820313,\"z\":28.35738372802734}},{\"heading\":270,\"model\":346857544,\"coords\":{\"x\":-826.434814453125,\"y\":-700.92333984375,\"z\":28.35738372802734}}],\"maxDistance\":2,\"state\":1}'),
(459, 'wiwang5', '{\"groups\":{\"wiwang\":0},\"coords\":{\"x\":-810.0526123046875,\"y\":-698.3701171875,\"z\":28.35738372802734},\"doors\":[{\"heading\":270,\"model\":-237708675,\"coords\":{\"x\":-810.0526123046875,\"y\":-699.4281005859375,\"z\":28.35738372802734}},{\"heading\":90,\"model\":346857544,\"coords\":{\"x\":-810.0526123046875,\"y\":-697.3121948242188,\"z\":28.35738372802734}}],\"maxDistance\":2,\"state\":1}'),
(460, 'cardealer1', '{\"groups\":{\"cardealer\":0},\"coords\":{\"x\":-313.78363037109377,\"y\":-819.295654296875,\"z\":33.3983154296875},\"doors\":[{\"heading\":340,\"model\":1308911070,\"coords\":{\"x\":-312.5113525390625,\"y\":-819.7592163085938,\"z\":33.3983154296875}},{\"heading\":340,\"model\":-403433025,\"coords\":{\"x\":-315.055908203125,\"y\":-818.83203125,\"z\":33.3983154296875}}],\"maxDistance\":2,\"state\":0}'),
(461, 'cardealer2', '{\"groups\":{\"cardealer\":0},\"coords\":{\"x\":-319.5443115234375,\"y\":-800.7869262695313,\"z\":33.06874847412109},\"model\":-267139712,\"doors\":false,\"maxDistance\":2,\"heading\":69,\"state\":1}'),
(462, 'cardealer3', '{\"groups\":{\"cardealer\":0},\"coords\":{\"x\":-305.1866455078125,\"y\":-788.239990234375,\"z\":33.74763488769531},\"model\":-190780785,\"doors\":false,\"maxDistance\":2,\"heading\":161,\"state\":1}'),
(463, 'cardealer5', '{\"groups\":{\"cardealer\":0},\"coords\":{\"x\":-296.79656982421877,\"y\":-819.6038818359375,\"z\":33.3983154296875},\"doors\":[{\"heading\":70,\"model\":1308911070,\"coords\":{\"x\":-296.3393249511719,\"y\":-818.3302001953125,\"z\":33.3983154296875}},{\"heading\":70,\"model\":-403433025,\"coords\":{\"x\":-297.2538146972656,\"y\":-820.8775634765625,\"z\":33.3983154296875}}],\"maxDistance\":2,\"state\":1}'),
(464, 'realestateagent1', '{\"groups\":{\"realestateagent\":0},\"coords\":{\"x\":-699.201904296875,\"y\":270.93231201171877,\"z\":83.414794921875},\"doors\":[{\"heading\":115,\"model\":-1922281023,\"coords\":{\"x\":-699.6559448242188,\"y\":271.8886413574219,\"z\":83.41496276855469}},{\"heading\":295,\"model\":-1922281023,\"coords\":{\"x\":-698.7478637695313,\"y\":269.9759826660156,\"z\":83.41462707519531}}],\"maxDistance\":2,\"state\":1}'),
(465, 'realestateagent2', '{\"groups\":{\"realestateagent\":0},\"coords\":{\"x\":-713.950439453125,\"y\":264.4421691894531,\"z\":84.250732421875},\"model\":1901183774,\"doors\":false,\"maxDistance\":2,\"heading\":295,\"state\":1}'),
(466, 'realestateagent4', '{\"groups\":{\"realestateagent\":5},\"coords\":{\"x\":-719.6178588867188,\"y\":261.7711486816406,\"z\":84.250732421875},\"model\":1901183774,\"doors\":false,\"maxDistance\":2,\"heading\":295,\"state\":1}'),
(467, 'taxi1', '{\"groups\":{\"taxi\":0},\"coords\":{\"x\":894.5571899414063,\"y\":-178.92237854003907,\"z\":75.50926971435547},\"model\":-2098059029,\"doors\":false,\"maxDistance\":2,\"heading\":59,\"state\":1}'),
(468, 'taxi2', '{\"groups\":{\"taxi\":0},\"coords\":{\"x\":899.3930053710938,\"y\":-171.1678009033203,\"z\":75.49385833740235},\"model\":2138842842,\"doors\":false,\"maxDistance\":2,\"heading\":58,\"state\":1}'),
(469, 'taxi3', '{\"groups\":{\"taxi\":0},\"coords\":{\"x\":907.1697387695313,\"y\":-160.6458740234375,\"z\":73.21904754638672},\"doors\":[{\"heading\":59,\"model\":1011365067,\"coords\":{\"x\":906.5435791015625,\"y\":-161.6880645751953,\"z\":73.21904754638672}},{\"heading\":239,\"model\":1011365067,\"coords\":{\"x\":907.7958984375,\"y\":-159.60369873046876,\"z\":73.21904754638672}}],\"maxDistance\":2,\"state\":1}'),
(470, 'taxi5', '{\"groups\":{\"taxi\":5},\"coords\":{\"x\":900.6617431640625,\"y\":-161.3002166748047,\"z\":74.37418365478516},\"model\":964838196,\"doors\":false,\"maxDistance\":2,\"heading\":329,\"state\":1}'),
(471, 'taxi6', '{\"groups\":{\"taxi\":0},\"coords\":{\"x\":894.705078125,\"y\":-148.55316162109376,\"z\":75.47023010253906},\"model\":964838196,\"doors\":false,\"maxDistance\":2,\"heading\":149,\"state\":1}'),
(472, 'taxi6', '{\"groups\":{\"taxi\":0},\"coords\":{\"x\":890.0072631835938,\"y\":-153.34738159179688,\"z\":75.47378540039063},\"model\":964838196,\"doors\":false,\"maxDistance\":2,\"heading\":329,\"state\":1}'),
(473, 'taxi7', '{\"groups\":{\"taxi\":0},\"coords\":{\"x\":883.4339599609375,\"y\":-159.8505096435547,\"z\":77.27230834960938},\"model\":-364958508,\"doors\":false,\"maxDistance\":2,\"heading\":59,\"state\":1}'),
(474, 'hornys1', '{\"groups\":{\"hornys\":0},\"coords\":{\"x\":1235.200439453125,\"y\":-355.0050354003906,\"z\":69.2342300415039},\"doors\":[{\"heading\":75,\"model\":-726346986,\"coords\":{\"x\":1234.85986328125,\"y\":-356.27587890625,\"z\":69.2342300415039}},{\"heading\":255,\"model\":501736823,\"coords\":{\"x\":1235.5408935546876,\"y\":-353.73419189453127,\"z\":69.2342300415039}}],\"maxDistance\":2,\"state\":0}'),
(475, 'hornys2', '{\"groups\":{\"hornys\":0},\"coords\":{\"x\":1247.08642578125,\"y\":-355.6158447265625,\"z\":69.22708129882813},\"model\":-1265474312,\"doors\":false,\"maxDistance\":2,\"heading\":345,\"state\":1}'),
(476, 'hornys3', '{\"groups\":{\"hornys\":0},\"coords\":{\"x\":1241.745849609375,\"y\":-366.2578125,\"z\":69.2342300415039},\"doors\":[{\"heading\":345,\"model\":501736823,\"coords\":{\"x\":1240.4754638671876,\"y\":-365.91741943359377,\"z\":69.2342300415039}},{\"heading\":165,\"model\":-726346986,\"coords\":{\"x\":1243.01611328125,\"y\":-366.5981750488281,\"z\":69.2342300415039}}],\"maxDistance\":2,\"state\":0}'),
(477, 'hornys4', '{\"groups\":{\"hornys\":0},\"coords\":{\"x\":1242.441162109375,\"y\":-353.7304382324219,\"z\":69.22708129882813},\"model\":1358044601,\"doors\":false,\"maxDistance\":2,\"heading\":165,\"state\":1}'),
(478, 'hornys5', '{\"groups\":{\"hornys\":0},\"coords\":{\"x\":1241.003662109375,\"y\":-350.7965087890625,\"z\":69.22708129882813},\"model\":2096461247,\"doors\":false,\"maxDistance\":2,\"heading\":255,\"state\":1}'),
(479, 'hornys6', '{\"groups\":{\"hornys\":0},\"coords\":{\"x\":1246.293212890625,\"y\":-350.56890869140627,\"z\":69.22213745117188},\"model\":-147325430,\"doors\":false,\"maxDistance\":2,\"heading\":165,\"state\":1}'),
(480, 'lscustom1', '{\"groups\":{\"lscustom\":0},\"coords\":{\"x\":-356.1369934082031,\"y\":-134.79603576660157,\"z\":38.01285171508789},\"model\":1542392972,\"doors\":false,\"maxDistance\":2,\"heading\":70,\"state\":1}'),
(481, 'lscustom2', '{\"groups\":{\"lscustom\":0},\"coords\":{\"x\":-349.79541015625,\"y\":-117.29533386230469,\"z\":38.02347564697265},\"model\":1542392972,\"doors\":false,\"maxDistance\":2,\"heading\":70,\"state\":1}'),
(482, 'lscustom3', '{\"groups\":{\"lscustom\":0},\"coords\":{\"x\":-364.969970703125,\"y\":-102.12954711914063,\"z\":38.00654983520508},\"model\":260701421,\"doors\":false,\"maxDistance\":2,\"heading\":340,\"state\":1}'),
(483, 'lscustom4', '{\"groups\":{\"lscustom\":0},\"coords\":{\"x\":-371.953125,\"y\":-99.58789825439453,\"z\":38.01235580444336},\"model\":260701421,\"doors\":false,\"maxDistance\":2,\"heading\":340,\"state\":1}'),
(484, 'lscustom6', '{\"groups\":{\"lscustom\":0},\"coords\":{\"x\":-360.216796875,\"y\":-154.93658447265626,\"z\":37.72630310058594},\"model\":260701421,\"doors\":false,\"maxDistance\":2,\"heading\":30,\"state\":1}'),
(485, 'lscustom8', '{\"groups\":{\"lscustom\":0},\"coords\":{\"x\":-341.7755432128906,\"y\":-166.53225708007813,\"z\":38.01138687133789},\"model\":1157738230,\"doors\":false,\"maxDistance\":2,\"heading\":120,\"state\":1}'),
(486, 'lscustom9', '{\"groups\":{\"lscustom\":0},\"coords\":{\"x\":-334.98828125,\"y\":-162.2827606201172,\"z\":43.59593963623047},\"model\":1142444161,\"doors\":false,\"maxDistance\":2,\"heading\":95,\"state\":1}'),
(487, 'lscustom10', '{\"groups\":{\"lscustom\":6},\"coords\":{\"x\":-334.7458190917969,\"y\":-155.53330993652345,\"z\":43.59803009033203},\"doors\":[{\"heading\":264,\"model\":1142444161,\"coords\":{\"x\":-334.61260986328127,\"y\":-154.36585998535157,\"z\":43.59727096557617}},{\"heading\":83,\"model\":1142444161,\"coords\":{\"x\":-334.8790283203125,\"y\":-156.7007598876953,\"z\":43.59878540039062}}],\"maxDistance\":2,\"state\":1}'),
(488, 'boatdealer1', '{\"groups\":{\"boatdealer\":0},\"coords\":{\"x\":-814.9188232421875,\"y\":-1347.1102294921876,\"z\":5.40264844894409},\"doors\":[{\"heading\":50,\"model\":460069987,\"coords\":{\"x\":-815.7887573242188,\"y\":-1348.1248779296876,\"z\":5.40265226364135}},{\"heading\":230,\"model\":1235941600,\"coords\":{\"x\":-814.0489501953125,\"y\":-1346.0955810546876,\"z\":5.40264463424682}}],\"maxDistance\":2,\"state\":1}'),
(489, 'boatdealer', '{\"groups\":{\"boatdealer\":0},\"coords\":{\"x\":-788.1217651367188,\"y\":-1356.0006103515626,\"z\":9.10396957397461},\"model\":1641673703,\"doors\":false,\"maxDistance\":2,\"heading\":108,\"state\":1}'),
(490, 'boatdealer', '{\"groups\":{\"boatdealer\":0},\"coords\":{\"x\":-793.6581420898438,\"y\":-1343.779296875,\"z\":5.28006744384765},\"model\":1641673703,\"doors\":false,\"maxDistance\":2,\"heading\":81,\"state\":1}'),
(491, 'boatdealer', '{\"groups\":{\"boatdealer\":0},\"coords\":{\"x\":-788.7422485351563,\"y\":-1355.735107421875,\"z\":5.28452253341674},\"model\":1641673703,\"doors\":false,\"maxDistance\":2,\"heading\":325,\"state\":0}'),
(493, 'pearls', '{\"groups\":{\"pearls\":0},\"coords\":{\"x\":-1817.01611328125,\"y\":-1194.27587890625,\"z\":14.45957946777343},\"doors\":[{\"heading\":330,\"model\":-689707675,\"coords\":{\"x\":-1818.026123046875,\"y\":-1193.6927490234376,\"z\":14.45957946777343}},{\"heading\":330,\"model\":-1427501726,\"coords\":{\"x\":-1816.006103515625,\"y\":-1194.8590087890626,\"z\":14.45957946777343}}],\"maxDistance\":2,\"state\":1}'),
(494, 'pearls', '{\"groups\":{\"pearls\":0},\"coords\":{\"x\":-1824.295654296875,\"y\":-1185.231689453125,\"z\":14.45957946777343},\"doors\":[{\"heading\":330,\"model\":-689707675,\"coords\":{\"x\":-1825.3056640625,\"y\":-1184.6485595703126,\"z\":14.45957946777343}},{\"heading\":330,\"model\":-1427501726,\"coords\":{\"x\":-1823.2857666015626,\"y\":-1185.814697265625,\"z\":14.45957946777343}}],\"maxDistance\":2,\"state\":1}'),
(495, 'pearls3', '{\"groups\":{\"pearls\":0},\"coords\":{\"x\":-1840.8992919921876,\"y\":-1196.2825927734376,\"z\":14.45421028137207},\"model\":-1262354275,\"doors\":false,\"maxDistance\":2,\"heading\":60,\"state\":0}'),
(496, 'pearls5', '{\"groups\":{\"pearls\":0},\"coords\":{\"x\":-1833.71533203125,\"y\":-1201.546875,\"z\":14.45957946777343},\"doors\":[{\"heading\":150,\"model\":-1427501726,\"coords\":{\"x\":-1834.725341796875,\"y\":-1200.9637451171876,\"z\":14.45957946777343}},{\"heading\":150,\"model\":-689707675,\"coords\":{\"x\":-1832.705322265625,\"y\":-1202.1298828125,\"z\":14.45957946777343}}],\"maxDistance\":2,\"state\":1}'),
(497, 'pacific1', '{\"groups\":{\"pacific\":0},\"coords\":{\"x\":-3034.355224609375,\"y\":79.22632598876953,\"z\":12.97045516967773},\"model\":1462359845,\"doors\":false,\"maxDistance\":2,\"heading\":140,\"state\":1}'),
(498, 'pacific2', '{\"groups\":{\"pacific\":0},\"coords\":{\"x\":-3041.7041015625,\"y\":93.81405639648438,\"z\":12.5039358139038},\"model\":1639387890,\"doors\":false,\"maxDistance\":2,\"heading\":50,\"state\":1}'),
(499, 'pacific3', '{\"groups\":{\"pacific\":0},\"coords\":{\"x\":-3055.345703125,\"y\":96.55680847167969,\"z\":12.96355438232421},\"model\":1462359845,\"doors\":false,\"maxDistance\":2,\"heading\":140,\"state\":1}'),
(500, 'pops1', '{\"groups\":{\"pops\":0},\"coords\":{\"x\":1581.062255859375,\"y\":6458.740234375,\"z\":25.01383018493652},\"model\":861832298,\"doors\":false,\"maxDistance\":2,\"heading\":245,\"state\":1}'),
(501, 'pops2', '{\"groups\":{\"pops\":0},\"coords\":{\"x\":1595.5367431640626,\"y\":6451.9404296875,\"z\":25.01383018493652},\"model\":-1428884643,\"doors\":false,\"maxDistance\":2,\"heading\":245,\"state\":1}'),
(502, '247-closed', '{\"maxDistance\":2,\"state\":1,\"model\":549302953,\"doors\":false,\"coords\":{\"x\":245.38970947265626,\"y\":-898.6351318359375,\"z\":29.76454353332519},\"heading\":250}'),
(503, '247-locked2', '{\"coords\":{\"x\":164.1472930908203,\"y\":6646.35986328125,\"z\":31.85196685791015},\"heading\":315,\"state\":1,\"doors\":false,\"maxDistance\":2,\"model\":549302953}'),
(504, 'sandy_bcso_1', '{\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":1738.6820068359376,\"y\":3887.489990234375,\"z\":35.05236434936523},\"model\":-4342623,\"heading\":208},{\"coords\":{\"x\":1736.704345703125,\"y\":3886.4384765625,\"z\":35.05601119995117},\"model\":-245751846,\"heading\":28}],\"coords\":{\"x\":1737.693115234375,\"y\":3886.96435546875,\"z\":35.0541877746582},\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(505, 'sandy_bcso_2', '{\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":1736.811279296875,\"y\":3890.964599609375,\"z\":35.03292083740234},\"model\":521993055,\"heading\":209},{\"coords\":{\"x\":1734.8414306640626,\"y\":3889.908447265625,\"z\":35.03292083740234},\"model\":-1692470427,\"heading\":28}],\"coords\":{\"x\":1735.826416015625,\"y\":3890.4365234375,\"z\":35.03292083740234},\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(506, 'sandy_bcso_3', '{\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":1741.081787109375,\"y\":3896.65771484375,\"z\":35.83813858032226},\"model\":1014445351,\"heading\":30},{\"coords\":{\"x\":1740.001220703125,\"y\":3898.544677734375,\"z\":35.83813858032226},\"model\":246733219,\"heading\":210}],\"coords\":{\"x\":1740.54150390625,\"y\":3897.60107421875,\"z\":35.83813858032226},\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(508, 'sandy_bcso_4', '{\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":1708.947021484375,\"y\":3870.077392578125,\"z\":35.19426345825195},\"model\":1014445351,\"heading\":224},{\"coords\":{\"x\":1710.4686279296876,\"y\":3868.523681640625,\"z\":35.19426345825195},\"model\":246733219,\"heading\":44}],\"coords\":{\"x\":1709.707763671875,\"y\":3869.300537109375,\"z\":35.19426345825195},\"groups\":{\"saspn\":0},\"state\":0}'),
(509, 'sandy_bcso_5', '{\"maxDistance\":3,\"doors\":false,\"heading\":315,\"coords\":{\"x\":1716.37255859375,\"y\":3867.322021484375,\"z\":35.15103530883789},\"model\":-1692470427,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(510, 'sandy_bcso_6', '{\"maxDistance\":3,\"doors\":false,\"heading\":314,\"coords\":{\"x\":1721.4732666015626,\"y\":3867.18212890625,\"z\":35.14958572387695},\"model\":-1692470427,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(511, 'sandy_bcso_7', '{\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":1731.535888671875,\"y\":3870.960693359375,\"z\":35.09357452392578},\"model\":-1692470427,\"heading\":118},{\"coords\":{\"x\":1730.4752197265626,\"y\":3872.938720703125,\"z\":35.09357452392578},\"model\":521993055,\"heading\":298}],\"coords\":{\"x\":1731.005615234375,\"y\":3871.94970703125,\"z\":35.09357452392578},\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(512, 'sandy_bcso_8', '{\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":1733.9439697265626,\"y\":3874.766357421875,\"z\":35.03166580200195},\"model\":-4342623,\"heading\":298},{\"coords\":{\"x\":1735.0130615234376,\"y\":3872.79736328125,\"z\":35.02508926391601},\"model\":-245751846,\"heading\":118}],\"coords\":{\"x\":1734.478515625,\"y\":3873.78173828125,\"z\":35.02837753295898},\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(513, 'sandy_bcso_9', '{\"maxDistance\":6,\"doors\":false,\"heading\":210,\"coords\":{\"x\":1753.2860107421876,\"y\":3857.631103515625,\"z\":33.62252044677734},\"model\":1286535678,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(514, 'sandy_bcso_10', '{\"maxDistance\":3,\"doors\":false,\"heading\":118,\"coords\":{\"x\":1742.8299560546876,\"y\":3858.052490234375,\"z\":34.9615478515625},\"model\":-245751846,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(515, 'sandy_bcso_11', '{\"maxDistance\":3,\"doors\":false,\"heading\":208,\"coords\":{\"x\":1737.031982421875,\"y\":3891.0830078125,\"z\":31.59474372863769},\"model\":-1692470427,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(516, 'sandy_bcso_12', '{\"maxDistance\":3,\"doors\":false,\"heading\":208,\"coords\":{\"x\":1728.51611328125,\"y\":3886.50732421875,\"z\":31.6015338897705},\"model\":-2143634023,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(517, 'sandy_bcso_13', '{\"maxDistance\":3,\"doors\":false,\"heading\":209,\"coords\":{\"x\":1728.34228515625,\"y\":3882.052490234375,\"z\":31.59422874450683},\"model\":-1192743177,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(518, 'sandy_bcso_14', '{\"maxDistance\":3,\"doors\":false,\"heading\":216,\"coords\":{\"x\":1720.6068115234376,\"y\":3881.53076171875,\"z\":31.6001968383789},\"model\":-2143634023,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(519, 'sandy_bcso_15', '{\"maxDistance\":3,\"doors\":false,\"heading\":220,\"coords\":{\"x\":1709.031982421875,\"y\":3872.903564453125,\"z\":31.59975433349609},\"model\":-1692470427,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(520, 'sandy_bcso_16', '{\"maxDistance\":3,\"doors\":false,\"heading\":118,\"coords\":{\"x\":1731.7027587890626,\"y\":3884.264404296875,\"z\":39.9205207824707},\"model\":-1692470427,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(521, 'sandy_bcso_17', '{\"maxDistance\":3,\"doors\":false,\"heading\":119,\"coords\":{\"x\":1730.0140380859376,\"y\":3888.254150390625,\"z\":39.91827774047851},\"model\":-1692470427,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(522, 'sandy_bcso_19', '{\"maxDistance\":3,\"doors\":false,\"heading\":294,\"coords\":{\"x\":1718.1199951171876,\"y\":3886.353271484375,\"z\":39.92634582519531},\"model\":-1692470427,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(523, 'sandy_bcso_20', '{\"maxDistance\":3,\"doors\":false,\"heading\":44,\"coords\":{\"x\":1723.4168701171876,\"y\":3876.068603515625,\"z\":39.92269897460937},\"model\":-742300503,\"autolock\":15,\"groups\":{\"saspn\":0},\"state\":1}'),
(524, 'police1', '{\"groups\":{\"police\":0},\"state\":0,\"autolock\":15,\"coords\":{\"x\":100.0774154663086,\"y\":-396.65606689453127,\"z\":48.66217422485351},\"doors\":[{\"coords\":{\"x\":98.860595703125,\"y\":-396.2048034667969,\"z\":48.66217422485351},\"model\":868278398,\"heading\":340},{\"coords\":{\"x\":101.29423522949219,\"y\":-397.10736083984377,\"z\":48.66217422485351},\"model\":-847563779,\"heading\":160}],\"maxDistance\":3}'),
(525, 'police2', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":70.0411376953125,\"y\":-392.2704772949219,\"z\":48.77456283569336},\"doors\":false,\"heading\":70,\"maxDistance\":3}'),
(527, 'police3', '{\"groups\":{\"police\":0},\"state\":1,\"autolock\":15,\"coords\":{\"x\":83.52517700195313,\"y\":-381.00738525390627,\"z\":48.73375701904297},\"doors\":[{\"coords\":{\"x\":82.2674560546875,\"y\":-380.5876770019531,\"z\":48.73375701904297},\"model\":-533861766,\"heading\":340},{\"coords\":{\"x\":84.78289794921875,\"y\":-381.42706298828127,\"z\":48.73375701904297},\"model\":-533861766,\"heading\":160}],\"maxDistance\":3}'),
(528, 'police4', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":63.28347778320312,\"y\":-382.9669494628906,\"z\":48.74359512329101},\"doors\":false,\"heading\":71,\"maxDistance\":3}'),
(529, 'police5', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":66.48117065429688,\"y\":-375.00994873046877,\"z\":48.72427749633789},\"doors\":false,\"heading\":340,\"maxDistance\":3}'),
(530, 'police6', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":72.48040771484375,\"y\":-377.11199951171877,\"z\":48.72427749633789},\"doors\":false,\"heading\":340,\"maxDistance\":3}'),
(531, 'police7', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":2,\"coords\":{\"x\":75.74908447265625,\"y\":-414.0625915527344,\"z\":48.72124862670898},\"doors\":false,\"heading\":70,\"maxDistance\":15}'),
(532, 'police8', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":72.05093383789063,\"y\":-413.3603515625,\"z\":48.72551345825195},\"doors\":false,\"heading\":341,\"maxDistance\":2}'),
(533, 'police9', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":66.39540100097656,\"y\":-411.33477783203127,\"z\":48.72551345825195},\"doors\":false,\"heading\":341,\"maxDistance\":2}'),
(534, 'police10', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":60.77001953125,\"y\":-409.3514099121094,\"z\":48.72551345825195},\"doors\":false,\"heading\":341,\"maxDistance\":2}'),
(535, 'police11', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":59.64022827148437,\"y\":-404.4168701171875,\"z\":48.73299026489258},\"doors\":false,\"heading\":250,\"maxDistance\":3}'),
(536, 'police11', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":61.463134765625,\"y\":-399.36370849609377,\"z\":48.73299026489258},\"doors\":false,\"heading\":70,\"maxDistance\":3}'),
(537, 'police12', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":61.5819091796875,\"y\":-379.3091735839844,\"z\":53.30924224853515},\"doors\":false,\"heading\":340,\"maxDistance\":3}'),
(538, 'police13', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":64.77182006835938,\"y\":-380.43829345703127,\"z\":53.30057525634765},\"doors\":false,\"heading\":340,\"maxDistance\":3}'),
(539, 'police14', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":73.518798828125,\"y\":-374.26165771484377,\"z\":53.38082122802734},\"doors\":false,\"heading\":339,\"maxDistance\":3}'),
(540, 'police15', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":78.60189819335938,\"y\":-369.8385925292969,\"z\":53.37137985229492},\"doors\":false,\"heading\":70,\"maxDistance\":3}'),
(541, 'police15', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":80.3883056640625,\"y\":-364.7077331542969,\"z\":53.36549377441406},\"doors\":false,\"heading\":70,\"maxDistance\":3}'),
(542, 'police16', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":82.34194946289063,\"y\":-362.0165710449219,\"z\":53.3638916015625},\"doors\":false,\"heading\":340,\"maxDistance\":2}'),
(543, 'police17', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":83.43473815917969,\"y\":-365.8019104003906,\"z\":53.36436462402344},\"doors\":false,\"heading\":70,\"maxDistance\":3}'),
(544, 'police18', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":81.59358215332031,\"y\":-370.9073791503906,\"z\":53.36436462402344},\"doors\":false,\"heading\":70,\"maxDistance\":3}'),
(545, 'police18', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":81.14300537109375,\"y\":-376.9428405761719,\"z\":53.36635589599609},\"doors\":false,\"heading\":340,\"maxDistance\":3}'),
(546, 'police19', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":82.64480590820313,\"y\":-380.9698486328125,\"z\":53.36673355102539},\"doors\":false,\"heading\":69,\"maxDistance\":3}'),
(547, 'police20', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":80.6304931640625,\"y\":-386.21331787109377,\"z\":53.36518096923828},\"doors\":false,\"heading\":250,\"maxDistance\":3}'),
(548, 'police21', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":70.0948486328125,\"y\":-392.2306213378906,\"z\":53.30188369750976},\"doors\":false,\"heading\":71,\"maxDistance\":3}'),
(549, 'police22', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":68.13796997070313,\"y\":-397.75177001953127,\"z\":53.30188369750976},\"doors\":false,\"heading\":71,\"maxDistance\":3}'),
(550, 'police22', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":66.15213012695313,\"y\":-403.3213195800781,\"z\":53.30385589599609},\"doors\":false,\"heading\":70,\"maxDistance\":3}'),
(551, 'police23', '{\"groups\":{\"police\":0},\"state\":1,\"model\":-533861766,\"autolock\":15,\"coords\":{\"x\":72.49725341796875,\"y\":-413.2546691894531,\"z\":53.32859420776367},\"doors\":false,\"heading\":341,\"maxDistance\":3}'),
(552, 'policegarage', '{\"groups\":{\"police\":0},\"state\":1,\"model\":690299907,\"autolock\":30,\"coords\":{\"x\":25.22106170654297,\"y\":-390.3095703125,\"z\":40.34415817260742},\"doors\":false,\"heading\":249,\"maxDistance\":10}'),
(553, 'policegarage2', '{\"groups\":{\"police\":0},\"state\":1,\"model\":690299907,\"autolock\":30,\"coords\":{\"x\":23.10946464538574,\"y\":-396.40130615234377,\"z\":40.34415817260742},\"doors\":false,\"heading\":252,\"maxDistance\":10}'),
(554, 'policegrille', '{\"coords\":{\"x\":7.88553237915039,\"y\":-393.279541015625,\"z\":38.23446273803711},\"maxDistance\":10,\"groups\":{\"police\":0},\"heading\":252,\"autolock\":15,\"model\":-1603817716,\"doors\":false,\"state\":1}'),
(555, 'policegrille2', '{\"coords\":{\"x\":10.15061664581298,\"y\":-386.4800109863281,\"z\":38.23446273803711},\"maxDistance\":10,\"groups\":{\"police\":0},\"heading\":72,\"autolock\":15,\"model\":-1603817716,\"doors\":false,\"state\":1}'),
(556, 'alcatraz1', '{\"heading\":265,\"doors\":false,\"model\":298123530,\"autolock\":15,\"coords\":{\"x\":3910.767333984375,\"y\":24.70327186584472,\"z\":23.01962280273437},\"state\":1,\"maxDistance\":3}'),
(557, 'ltd_f4l', '{\"maxDistance\":2,\"autolock\":15,\"groups\":{\"ltd_f4l\":0},\"state\":1,\"heading\":0,\"doors\":false,\"model\":549302953,\"coords\":{\"x\":23.66998481750488,\"y\":-1341.4322509765626,\"z\":29.63836479187011}}'),
(559, 'Police cellule 1', '{\"state\":0,\"model\":-299326459,\"coords\":{\"x\":55.62501525878906,\"y\":-366.6278991699219,\"z\":40.98831176757812},\"doors\":false,\"groups\":{\"police\":0},\"maxDistance\":2,\"heading\":160}'),
(560, 'Police Cellule 2', '{\"state\":0,\"model\":-299326459,\"coords\":{\"x\":54.17803955078125,\"y\":-370.7012023925781,\"z\":40.98831176757812},\"doors\":false,\"groups\":{\"police\":0},\"maxDistance\":2,\"heading\":160}'),
(561, 'Police Cellule 3', '{\"state\":0,\"model\":-299326459,\"coords\":{\"x\":50.18000793457031,\"y\":-369.2818298339844,\"z\":40.98831176757812},\"doors\":false,\"groups\":{\"police\":0},\"maxDistance\":2,\"heading\":160}'),
(562, 'Police Cellule 4', '{\"state\":0,\"model\":-299326459,\"coords\":{\"x\":51.63092041015625,\"y\":-365.2100830078125,\"z\":40.98831176757812},\"doors\":false,\"groups\":{\"police\":0},\"maxDistance\":2,\"heading\":160}'),
(563, 'Police Cellule 5', '{\"state\":0,\"model\":-299326459,\"coords\":{\"x\":46.17866516113281,\"y\":-367.9224548339844,\"z\":40.98831176757812},\"doors\":false,\"groups\":{\"police\":0},\"maxDistance\":2,\"heading\":160}'),
(564, 'Police Cellule 6', '{\"state\":0,\"model\":-299326459,\"coords\":{\"x\":47.62913513183594,\"y\":-363.8224182128906,\"z\":40.98831176757812},\"doors\":false,\"groups\":{\"police\":0},\"maxDistance\":2,\"heading\":160}'),
(565, 'Police Cellule 7', '{\"state\":0,\"model\":-299326459,\"coords\":{\"x\":42.19534301757812,\"y\":-366.47625732421877,\"z\":40.98831176757812},\"doors\":false,\"groups\":{\"police\":0},\"maxDistance\":2,\"heading\":160}'),
(566, 'Police Cellule 8', '{\"state\":0,\"model\":-299326459,\"coords\":{\"x\":43.646240234375,\"y\":-362.3900146484375,\"z\":40.98831176757812},\"doors\":false,\"groups\":{\"police\":0},\"maxDistance\":2,\"heading\":160}'),
(567, 'Police Cellule 9', '{\"state\":0,\"model\":-299326459,\"coords\":{\"x\":38.20317077636719,\"y\":-365.0621032714844,\"z\":40.98831176757812},\"doors\":false,\"groups\":{\"police\":0},\"maxDistance\":2,\"heading\":160}'),
(568, 'Police Cellule 10', '{\"state\":0,\"model\":-299326459,\"coords\":{\"x\":39.65040588378906,\"y\":-360.95294189453127,\"z\":40.98831176757812},\"doors\":false,\"groups\":{\"police\":0},\"maxDistance\":2,\"heading\":160}'),
(571, 'Vigne 1', '{\"doors\":[{\"model\":1077118233,\"coords\":{\"x\":-1890.22509765625,\"y\":2052.23583984375,\"z\":141.3125},\"heading\":160},{\"model\":1077118233,\"coords\":{\"x\":-1887.903076171875,\"y\":2051.386962890625,\"z\":141.3115234375},\"heading\":340}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1889.0640869140626,\"y\":2051.8115234375,\"z\":141.31201171875},\"groups\":{\"vigne\":0}}'),
(572, 'Vigne 2', '{\"doors\":[{\"model\":1077118233,\"coords\":{\"x\":-1885.2110595703126,\"y\":2050.3798828125,\"z\":141.30850219726563},\"heading\":340},{\"model\":1077118233,\"coords\":{\"x\":-1887.5340576171876,\"y\":2051.23388671875,\"z\":141.3125},\"heading\":160}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1886.37255859375,\"y\":2050.806884765625,\"z\":141.3105010986328},\"groups\":{\"vigne\":0}}'),
(573, 'Vigne 3', '{\"doors\":[{\"model\":1843224684,\"coords\":{\"x\":-1907.7320556640626,\"y\":2071.8779296875,\"z\":140.91310119628907},\"heading\":320},{\"model\":1843224684,\"coords\":{\"x\":-1909.6240234375,\"y\":2073.471923828125,\"z\":140.91519165039063},\"heading\":140}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1908.677978515625,\"y\":2072.6748046875,\"z\":140.91415405273438},\"groups\":{\"vigne\":0}}'),
(574, 'Vigne 4', '{\"doors\":[{\"model\":1843224684,\"coords\":{\"x\":-1910.208984375,\"y\":2073.968994140625,\"z\":140.91310119628907},\"heading\":320},{\"model\":1843224684,\"coords\":{\"x\":-1912.10107421875,\"y\":2075.56005859375,\"z\":140.91490173339845},\"heading\":140}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1911.155029296875,\"y\":2074.7646484375,\"z\":140.91400146484376},\"groups\":{\"vigne\":0}}'),
(575, 'vigne5', '{\"doors\":[{\"model\":1843224684,\"coords\":{\"x\":-1911.81005859375,\"y\":2078.794921875,\"z\":140.9114990234375},\"heading\":230},{\"model\":1843224684,\"coords\":{\"x\":-1910.2020263671876,\"y\":2080.678955078125,\"z\":140.9114990234375},\"heading\":50}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1911.006103515625,\"y\":2079.73681640625,\"z\":140.9114990234375},\"groups\":{\"vigne\":0}}'),
(576, 'vigne7', '{\"doors\":[{\"model\":1843224684,\"coords\":{\"x\":-1907.5960693359376,\"y\":2083.743896484375,\"z\":140.9114990234375},\"heading\":230},{\"model\":1843224684,\"coords\":{\"x\":-1905.9940185546876,\"y\":2085.626953125,\"z\":140.9114990234375},\"heading\":50}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1906.7950439453126,\"y\":2084.685546875,\"z\":140.9114990234375},\"groups\":{\"vigne\":0}}'),
(577, 'vigne8', '{\"doors\":[{\"model\":1843224684,\"coords\":{\"x\":-1902.882080078125,\"y\":2086.544921875,\"z\":140.9167938232422},\"heading\":140},{\"model\":1843224684,\"coords\":{\"x\":-1900.993896484375,\"y\":2084.947265625,\"z\":140.91883850097657},\"heading\":320}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1901.93798828125,\"y\":2085.74609375,\"z\":140.91781616210938},\"groups\":{\"vigne\":0}}'),
(578, 'vigne9', '{\"doors\":[{\"model\":1843224684,\"coords\":{\"x\":-1898.5140380859376,\"y\":2082.85205078125,\"z\":140.91525268554688},\"heading\":320},{\"model\":1843224684,\"coords\":{\"x\":-1900.406005859375,\"y\":2084.44677734375,\"z\":140.9145965576172},\"heading\":140}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1899.4599609375,\"y\":2083.6494140625,\"z\":140.9149169921875},\"groups\":{\"vigne\":0}}'),
(579, 'vigne10', '{\"doors\":[{\"model\":1077118233,\"coords\":{\"x\":-1894.72998046875,\"y\":2075.967041015625,\"z\":141.3125},\"heading\":141},{\"model\":1077118233,\"coords\":{\"x\":-1892.8330078125,\"y\":2074.380859375,\"z\":141.30850219726563},\"heading\":319}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1893.781494140625,\"y\":2075.173828125,\"z\":141.3105010986328},\"groups\":{\"vigne\":0}}'),
(580, 'vigne11', '{\"doors\":[{\"model\":1077118233,\"coords\":{\"x\":-1887.2430419921876,\"y\":2074.307861328125,\"z\":141.3125},\"heading\":160},{\"model\":1077118233,\"coords\":{\"x\":-1884.9210205078126,\"y\":2073.4619140625,\"z\":141.30850219726563},\"heading\":340}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1886.08203125,\"y\":2073.884765625,\"z\":141.3105010986328},\"groups\":{\"vigne\":0}}'),
(581, 'vigne12', '{\"doors\":[{\"model\":1077118233,\"coords\":{\"x\":-1875.614013671875,\"y\":2070.06787109375,\"z\":141.3125},\"heading\":160},{\"model\":1077118233,\"coords\":{\"x\":-1873.2939453125,\"y\":2069.2197265625,\"z\":141.30850219726563},\"heading\":340}],\"state\":0,\"maxDistance\":2,\"coords\":{\"x\":-1874.4539794921876,\"y\":2069.643798828125,\"z\":141.3105010986328},\"groups\":{\"vigne\":0}}'),
(582, 'vigne13', '{\"doors\":false,\"model\":1077118233,\"state\":0,\"heading\":1,\"maxDistance\":2,\"coords\":{\"x\":-1859.2139892578126,\"y\":2054.117919921875,\"z\":141.35350036621095},\"groups\":{\"vigne\":0}}'),
(583, 'ems', '{\"maxDistance\":2,\"autolock\":15,\"state\":1,\"groups\":{\"ambulance\":0},\"doors\":false,\"coords\":{\"x\":304.3673095703125,\"y\":-593.5765991210938,\"z\":43.41555023193359},\"model\":-1999925837,\"heading\":340}'),
(584, 'bcsoprison1', '{\"model\":455942924,\"coords\":{\"x\":1733.8255615234376,\"y\":3858.6484375,\"z\":35.16487503051758},\"heading\":117,\"autolock\":15,\"state\":1,\"doors\":false,\"maxDistance\":2,\"groups\":{\"saspn\":0}}'),
(585, 'prisonbcso2', '{\"model\":455942924,\"coords\":{\"x\":1732.7735595703126,\"y\":3852.45947265625,\"z\":35.1646842956543},\"heading\":125,\"autolock\":15,\"state\":1,\"doors\":false,\"maxDistance\":2,\"groups\":{\"saspn\":0}}'),
(586, 'Pearls', '{\"groups\":{\"pearls\":0},\"heading\":330,\"maxDistance\":2,\"doors\":false,\"coords\":{\"x\":-1847.2374267578126,\"y\":-1190.0897216796876,\"z\":14.45908737182617},\"autolock\":15,\"model\":-147325430,\"state\":1}');

-- --------------------------------------------------------

--
-- Structure de la table `pausemenu_battlepass_dailymissions`
--

CREATE TABLE `pausemenu_battlepass_dailymissions` (
  `missions` longtext DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `pausemenu_battlepass_dailymissions`
--

INSERT INTO `pausemenu_battlepass_dailymissions` (`missions`, `updatedAt`) VALUES
('[]', 1734517005);

-- --------------------------------------------------------

--
-- Structure de la table `pausemenu_battlepass_data`
--

CREATE TABLE `pausemenu_battlepass_data` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `xp` int(11) NOT NULL DEFAULT 0,
  `purchased` int(11) NOT NULL DEFAULT 0,
  `claimedLevels` longtext NOT NULL DEFAULT '{}',
  `missions` longtext DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pausemenu_battlepass_day_counter`
--

CREATE TABLE `pausemenu_battlepass_day_counter` (
  `counter` int(11) DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `pausemenu_battlepass_day_counter`
--

INSERT INTO `pausemenu_battlepass_day_counter` (`counter`) VALUES
(5);

-- --------------------------------------------------------

--
-- Structure de la table `pausemenu_battlepass_transactions`
--

CREATE TABLE `pausemenu_battlepass_transactions` (
  `tbx_id` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pausemenu_commands`
--

CREATE TABLE `pausemenu_commands` (
  `command` longtext DEFAULT NULL,
  `desc` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `pausemenu_commands`
--

INSERT INTO `pausemenu_commands` (`command`, `desc`) VALUES
('report', 'Vous permet de contacter l\'équipe staff si besoin'),
('tv', 'Pour gérer les Télévisions (Fonctionne aussi en véhicule)'),
('streamermode', 'Désactive la music des véhicules et des Télévisions');

-- --------------------------------------------------------

--
-- Structure de la table `pausemenu_daily_awards`
--

CREATE TABLE `pausemenu_daily_awards` (
  `identifier` longtext DEFAULT NULL,
  `claimedDays` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `pausemenu_daily_awards_day_counter`
--

CREATE TABLE `pausemenu_daily_awards_day_counter` (
  `counter` int(11) DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `pausemenu_daily_awards_day_counter`
--

INSERT INTO `pausemenu_daily_awards_day_counter` (`counter`, `updatedAt`) VALUES
(27, 1734258639);

-- --------------------------------------------------------

--
-- Structure de la table `pausemenu_guidebook`
--

CREATE TABLE `pausemenu_guidebook` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `html` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pausemenu_keybinds`
--

CREATE TABLE `pausemenu_keybinds` (
  `key` longtext NOT NULL,
  `desc` longtext DEFAULT NULL,
  `combinationkey` longtext DEFAULT NULL,
  `combinationdesc` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `pausemenu_keybinds`
--

INSERT INTO `pausemenu_keybinds` (`key`, `desc`, `combinationkey`, `combinationdesc`) VALUES
('TAB', 'Öffnet das Inventar', 'false', ''),
('W', 'Stoppen Sie eine Animation', 'false', ''),
('T', 'Öffnen Sie den Chat', 'false', ''),
('U', 'Verriegelt das Fahrzeug', 'false', ''),
('G', 'Telefon herausnehmen/weglegen', 'false', ''),
('J', 'Einschlafen/Trebuchet', 'false', ''),
('L', 'Öffnen des Kofferraums eines Fahrzeugs', 'false', ''),
('LEFTSHIFT', 'Laufen', 'false', ''),
('X', 'Hebe deine Hände', 'false', ''),
('P', 'Öffne die Karte', 'false', ''),
('F11', 'Ändert den Stimmumfang', 'false', ''),
('F2', 'Öffnet das Animationsmenü', 'false', ''),
('F5', 'Inventar/Geldbörse/Einstellungen', 'false', ''),
('F6', 'Business-Menü', 'false', ''),
('F7', 'Illegales Menü', 'false', ''),
('1', 'Inventar-Verknüpfung / Fahrzeugsitz ändern', 'false', ''),
('2', 'Inventar-Verknüpfung / Fahrzeugsitz ändern', 'false', ''),
('3', 'Inventar-Verknüpfung / Fahrzeugsitz ändern', 'false', ''),
('4', 'Inventar-Verknüpfung / Fahrzeugsitz ändern', 'false', ''),
('5', 'Inventar-Verknüpfung / Fahrzeugsitz ändern', 'false', '');

-- --------------------------------------------------------

--
-- Structure de la table `pausemenu_peds`
--

CREATE TABLE `pausemenu_peds` (
  `identifier` longtext DEFAULT NULL,
  `ped` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `perso_preferences`
--

CREATE TABLE `perso_preferences` (
  `UniqueID` int(11) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `perso_preferences`
--

INSERT INTO `perso_preferences` (`UniqueID`, `data`) VALUES
(1, '{\"objects_infos\":{\"name\":\"objects_infos\",\"active\":false}}'),
(2, '[]');

-- --------------------------------------------------------

--
-- Structure de la table `phone_backups`
--

CREATE TABLE `phone_backups` (
  `id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_backups`
--

INSERT INTO `phone_backups` (`id`, `phone_number`) VALUES

-- --------------------------------------------------------

--
-- Structure de la table `phone_clock_alarms`
--

CREATE TABLE `phone_clock_alarms` (
  `id` varchar(10) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `hours` int(2) NOT NULL DEFAULT 0,
  `minutes` int(2) NOT NULL DEFAULT 0,
  `label` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--

-- --------------------------------------------------------

--
-- Structure de la table `phone_crypto`
--

CREATE TABLE `phone_crypto` (
  `id` varchar(100) NOT NULL,
  `coin` varchar(15) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `invested` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_darkchat_accounts`
--

CREATE TABLE `phone_darkchat_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_darkchat_accounts`
--

INSERT INTO `phone_darkchat_accounts` (`phone_number`, `username`, `password`) VALUES

-- --------------------------------------------------------

--
-- Structure de la table `phone_darkchat_channels`
--

CREATE TABLE `phone_darkchat_channels` (
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- --------------------------------------------------------

--
-- Structure de la table `phone_darkchat_members`
--

CREATE TABLE `phone_darkchat_members` (
  `channel_name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_darkchat_messages`
--

CREATE TABLE `phone_darkchat_messages` (
  `id` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_darkchat_messages`
--

INSERT INTO `phone_darkchat_messages` (`id`, `channel`, `sender`, `content`, `timestamp`) VALUES

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_accounts`
--

CREATE TABLE `phone_instagram_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `post_count` int(11) NOT NULL DEFAULT 0,
  `story_count` int(11) NOT NULL DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(15) NOT NULL,
  `private` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_instagram_accounts`
--

INSERT INTO `phone_instagram_accounts` (`display_name`, `username`, `password`, `profile_image`, `bio`, `post_count`, `story_count`, `follower_count`, `following_count`, `phone_number`, `private`, `verified`, `date_joined`) VALUES

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_comments`
--

CREATE TABLE `phone_instagram_comments` (
  `id` varchar(10) NOT NULL,
  `post_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(500) NOT NULL DEFAULT '',
  `like_count` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déclencheurs `phone_instagram_comments`
--
DELIMITER $$
CREATE TRIGGER `phone_instagram_decrement_comment_count` AFTER DELETE ON `phone_instagram_comments` FOR EACH ROW BEGIN
    UPDATE phone_instagram_posts
    SET comment_count = comment_count - 1
    WHERE id = OLD.post_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_instagram_increment_comment_count` AFTER INSERT ON `phone_instagram_comments` FOR EACH ROW BEGIN
    UPDATE phone_instagram_posts
    SET comment_count = comment_count + 1
    WHERE id = NEW.post_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_follows`
--

CREATE TABLE `phone_instagram_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_instagram_follows`
--

INSERT INTO `phone_instagram_follows` (`followed`, `follower`) VALUES

--
-- Déclencheurs `phone_instagram_follows`
--
DELIMITER $$
CREATE TRIGGER `phone_instagram_update_counts_after_follow` AFTER INSERT ON `phone_instagram_follows` FOR EACH ROW BEGIN
    UPDATE phone_instagram_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    UPDATE phone_instagram_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_instagram_update_counts_after_unfollow` AFTER DELETE ON `phone_instagram_follows` FOR EACH ROW BEGIN
    UPDATE phone_instagram_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    UPDATE phone_instagram_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_follow_requests`
--

CREATE TABLE `phone_instagram_follow_requests` (
  `requester` varchar(20) NOT NULL,
  `requestee` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_likes`
--

CREATE TABLE `phone_instagram_likes` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_instagram_likes`
--
DELIMITER $$
CREATE TRIGGER `phone_instagram_decrement_like_count` AFTER DELETE ON `phone_instagram_likes` FOR EACH ROW BEGIN
    IF OLD.is_comment = 0 THEN
        UPDATE phone_instagram_posts
        SET like_count = like_count - 1
        WHERE id = OLD.id;
    ELSE
        UPDATE phone_instagram_comments
        SET like_count = like_count - 1
        WHERE id = OLD.id;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_instagram_increment_like_count` AFTER INSERT ON `phone_instagram_likes` FOR EACH ROW BEGIN
    IF NEW.is_comment = 0 THEN
        UPDATE phone_instagram_posts
        SET like_count = like_count + 1
        WHERE id = NEW.id;
    ELSE
        UPDATE phone_instagram_comments
        SET like_count = like_count + 1
        WHERE id = NEW.id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_messages`
--

CREATE TABLE `phone_instagram_messages` (
  `id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_notifications`
--

CREATE TABLE `phone_instagram_notifications` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `post_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_posts`
--

CREATE TABLE `phone_instagram_posts` (
  `id` varchar(10) NOT NULL,
  `media` text DEFAULT NULL,
  `caption` varchar(500) NOT NULL DEFAULT '',
  `location` varchar(50) DEFAULT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_instagram_posts`
--
DELIMITER $$
CREATE TRIGGER `phone_instagram_decrement_post_count` AFTER DELETE ON `phone_instagram_posts` FOR EACH ROW BEGIN
    UPDATE phone_instagram_accounts
    SET post_count = post_count - 1
    WHERE username = OLD.username;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_instagram_increment_post_count` AFTER INSERT ON `phone_instagram_posts` FOR EACH ROW BEGIN
    UPDATE phone_instagram_accounts
    SET post_count = post_count + 1
    WHERE username = NEW.username;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_stories`
--

CREATE TABLE `phone_instagram_stories` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `image` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déclencheurs `phone_instagram_stories`
--
DELIMITER $$
CREATE TRIGGER `phone_instagram_decrement_story_count` AFTER DELETE ON `phone_instagram_stories` FOR EACH ROW BEGIN
    UPDATE phone_instagram_accounts
    SET story_count = story_count - 1
    WHERE username = OLD.username;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_instagram_increment_story_count` AFTER INSERT ON `phone_instagram_stories` FOR EACH ROW BEGIN
    UPDATE phone_instagram_accounts
    SET story_count = story_count + 1
    WHERE username = NEW.username;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_stories_views`
--

CREATE TABLE `phone_instagram_stories_views` (
  `story_id` varchar(50) NOT NULL,
  `viewer` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_last_phone`
--

CREATE TABLE `phone_last_phone` (
  `id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_logged_in_accounts`
--

CREATE TABLE `phone_logged_in_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_mail_accounts`
--

CREATE TABLE `phone_mail_accounts` (
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_mail_deleted`
--

CREATE TABLE `phone_mail_deleted` (
  `message_id` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_mail_messages`
--

CREATE TABLE `phone_mail_messages` (
  `id` varchar(10) NOT NULL,
  `recipient` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `attachments` longtext DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_maps_locations`
--

CREATE TABLE `phone_maps_locations` (
  `id` varchar(10) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `x_pos` float NOT NULL,
  `y_pos` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_marketplace_posts`
--

CREATE TABLE `phone_marketplace_posts` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachments` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_message_channels`
--

CREATE TABLE `phone_message_channels` (
  `id` int(11) NOT NULL,
  `is_group` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `last_message` varchar(50) NOT NULL DEFAULT '',
  `last_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_message_members`
--

CREATE TABLE `phone_message_members` (
  `channel_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `unread` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_message_messages`
--

CREATE TABLE `phone_message_messages` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_music_playlists`
--

CREATE TABLE `phone_music_playlists` (
  `id` varchar(10) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cover` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_music_saved_playlists`
--

CREATE TABLE `phone_music_saved_playlists` (
  `playlist_id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_music_songs`
--

CREATE TABLE `phone_music_songs` (
  `song_id` varchar(100) NOT NULL,
  `playlist_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_notes`
--

CREATE TABLE `phone_notes` (
  `id` varchar(10) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` longtext DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_notifications`
--

CREATE TABLE `phone_notifications` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `show_avatar` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_phones`
--

CREATE TABLE `phone_phones` (
  `id` varchar(100) NOT NULL,
  `owner_id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `face_id` varchar(100) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `is_setup` tinyint(1) DEFAULT 0,
  `assigned` tinyint(1) DEFAULT 0,
  `battery` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_phone_blocked_numbers`
--

CREATE TABLE `phone_phone_blocked_numbers` (
  `phone_number` varchar(15) NOT NULL,
  `blocked_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_phone_calls`
--

CREATE TABLE `phone_phone_calls` (
  `id` varchar(10) NOT NULL,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `answered` tinyint(1) DEFAULT 0,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_phone_contacts`
--

CREATE TABLE `phone_phone_contacts` (
  `contact_phone_number` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `profile_image` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `favourite` tinyint(1) DEFAULT 0,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_phone_voicemail`
--

CREATE TABLE `phone_phone_voicemail` (
  `id` varchar(10) NOT NULL,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `url` varchar(500) NOT NULL,
  `duration` int(11) NOT NULL,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_photos`
--

CREATE TABLE `phone_photos` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `link` varchar(500) NOT NULL,
  `is_video` tinyint(1) DEFAULT 0,
  `size` float NOT NULL DEFAULT 0,
  `metadata` varchar(20) DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_photo_albums`
--

CREATE TABLE `phone_photo_albums` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_photo_album_photos`
--

CREATE TABLE `phone_photo_album_photos` (
  `album_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_services_channels`
--

CREATE TABLE `phone_services_channels` (
  `id` varchar(10) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `company` varchar(50) NOT NULL,
  `last_message` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_services_messages`
--

CREATE TABLE `phone_services_messages` (
  `id` varchar(10) NOT NULL,
  `channel_id` varchar(50) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `x_pos` int(11) DEFAULT NULL,
  `y_pos` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_accounts`
--

CREATE TABLE `phone_tiktok_accounts` (
  `name` varchar(30) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `video_count` int(11) NOT NULL DEFAULT 0,
  `twitter` varchar(20) DEFAULT NULL,
  `instagram` varchar(20) DEFAULT NULL,
  `show_likes` tinyint(1) DEFAULT 1,
  `phone_number` varchar(15) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_channels`
--

CREATE TABLE `phone_tiktok_channels` (
  `id` varchar(10) NOT NULL,
  `last_message` varchar(50) NOT NULL,
  `member_1` varchar(20) NOT NULL,
  `member_2` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_comments`
--

CREATE TABLE `phone_tiktok_comments` (
  `id` varchar(10) NOT NULL,
  `reply_to` varchar(10) DEFAULT NULL,
  `video_id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(550) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `replies` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_tiktok_comments`
--
DELIMITER $$
CREATE TRIGGER `phone_tiktok_decrement_video_comments` BEFORE DELETE ON `phone_tiktok_comments` FOR EACH ROW BEGIN
    DECLARE v_replies_count INT;

    
    SELECT COUNT(*) INTO v_replies_count
    FROM phone_tiktok_comments
    WHERE reply_to = OLD.id;

    
    UPDATE phone_tiktok_videos
    SET comments = comments - (1 + v_replies_count)
    WHERE id = OLD.video_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_tiktok_increment_video_comments` AFTER INSERT ON `phone_tiktok_comments` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_videos
    SET comments = comments + 1
    WHERE id = NEW.video_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_comments_likes`
--

CREATE TABLE `phone_tiktok_comments_likes` (
  `username` varchar(20) NOT NULL,
  `comment_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déclencheurs `phone_tiktok_comments_likes`
--
DELIMITER $$
CREATE TRIGGER `phone_tiktok_decrement_comment_likes` AFTER DELETE ON `phone_tiktok_comments_likes` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_comments
    SET likes = likes - 1
    WHERE id = OLD.comment_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_tiktok_increment_comment_likes` AFTER INSERT ON `phone_tiktok_comments_likes` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_comments
    SET likes = likes + 1
    WHERE id = NEW.comment_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_follows`
--

CREATE TABLE `phone_tiktok_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_tiktok_follows`
--
DELIMITER $$
CREATE TRIGGER `phone_tiktok_update_counts_after_follow` AFTER INSERT ON `phone_tiktok_follows` FOR EACH ROW BEGIN
    
    UPDATE phone_tiktok_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    
    UPDATE phone_tiktok_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_tiktok_update_counts_after_unfollow` AFTER DELETE ON `phone_tiktok_follows` FOR EACH ROW BEGIN
    
    UPDATE phone_tiktok_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    
    UPDATE phone_tiktok_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_likes`
--

CREATE TABLE `phone_tiktok_likes` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_tiktok_likes`
--
DELIMITER $$
CREATE TRIGGER `phone_tiktok_decrement_account_likes` AFTER DELETE ON `phone_tiktok_likes` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_accounts
    JOIN phone_tiktok_videos ON phone_tiktok_videos.username = phone_tiktok_accounts.username
    SET phone_tiktok_accounts.like_count = phone_tiktok_accounts.like_count - 1
    WHERE phone_tiktok_videos.id = OLD.video_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_tiktok_decrement_video_likes` AFTER DELETE ON `phone_tiktok_likes` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_videos
    SET likes = likes - 1
    WHERE id = OLD.video_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_tiktok_increment_account_likes` AFTER INSERT ON `phone_tiktok_likes` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_accounts
    JOIN phone_tiktok_videos ON phone_tiktok_videos.username = phone_tiktok_accounts.username
    SET phone_tiktok_accounts.like_count = phone_tiktok_accounts.like_count + 1
    WHERE phone_tiktok_videos.id = NEW.video_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_tiktok_increment_video_likes` AFTER INSERT ON `phone_tiktok_likes` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_videos
    SET likes = likes + 1
    WHERE id = NEW.video_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_messages`
--

CREATE TABLE `phone_tiktok_messages` (
  `id` varchar(10) NOT NULL,
  `channel_id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déclencheurs `phone_tiktok_messages`
--
DELIMITER $$
CREATE TRIGGER `phone_tiktok_update_last_message` AFTER INSERT ON `phone_tiktok_messages` FOR EACH ROW BEGIN
    DECLARE modified_content TEXT CHARACTER SET utf8mb4;

    IF NEW.content LIKE '<!SHARED-VIDEO-URL%' THEN
        SET modified_content = 'Shared a video';
    ELSEIF LENGTH(NEW.content) > 50 THEN
        SET modified_content = CONCAT(SUBSTR(NEW.content, 1, 17), '...');
    ELSE
        SET modified_content = NEW.content;
    END IF;

    UPDATE phone_tiktok_channels
    SET last_message = modified_content
    WHERE id = NEW.channel_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_notifications`
--

CREATE TABLE `phone_tiktok_notifications` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `video_id` varchar(10) DEFAULT NULL,
  `comment_id` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_pinned_videos`
--

CREATE TABLE `phone_tiktok_pinned_videos` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_saves`
--

CREATE TABLE `phone_tiktok_saves` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_tiktok_saves`
--
DELIMITER $$
CREATE TRIGGER `phone_tiktok_decrement_video_saves` AFTER DELETE ON `phone_tiktok_saves` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_videos
    SET saves = saves - 1
    WHERE id = OLD.video_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_tiktok_increment_video_saves` AFTER INSERT ON `phone_tiktok_saves` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_videos
    SET saves = saves + 1
    WHERE id = NEW.video_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_unread_messages`
--

CREATE TABLE `phone_tiktok_unread_messages` (
  `username` varchar(20) NOT NULL,
  `channel_id` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_videos`
--

CREATE TABLE `phone_tiktok_videos` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `src` varchar(500) NOT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `music` text DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `comments` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `saves` int(11) NOT NULL DEFAULT 0,
  `pinned_comment` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_tiktok_videos`
--
DELIMITER $$
CREATE TRIGGER `phone_tiktok_increment_video_count` AFTER INSERT ON `phone_tiktok_videos` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_accounts
    SET video_count = video_count + 1
    WHERE username = NEW.username;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_views`
--

CREATE TABLE `phone_tiktok_views` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_tiktok_views`
--
DELIMITER $$
CREATE TRIGGER `phone_tiktok_increment_video_views` AFTER INSERT ON `phone_tiktok_views` FOR EACH ROW BEGIN
    UPDATE phone_tiktok_videos
    SET views = views + 1
    WHERE id = NEW.video_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tinder_accounts`
--

CREATE TABLE `phone_tinder_accounts` (
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `photos` text DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `dob` date NOT NULL,
  `is_male` tinyint(1) NOT NULL,
  `interested_men` tinyint(1) NOT NULL,
  `interested_women` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_tinder_matches`
--

CREATE TABLE `phone_tinder_matches` (
  `phone_number_1` varchar(15) NOT NULL,
  `phone_number_2` varchar(15) NOT NULL,
  `latest_message` varchar(1000) DEFAULT NULL,
  `latest_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_tinder_messages`
--

CREATE TABLE `phone_tinder_messages` (
  `id` int(11) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `recipient` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_tinder_swipes`
--

CREATE TABLE `phone_tinder_swipes` (
  `swiper` varchar(15) NOT NULL,
  `swipee` varchar(15) NOT NULL,
  `liked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_accounts`
--

CREATE TABLE `phone_twitter_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `profile_header` varchar(500) DEFAULT NULL,
  `pinned_tweet` varchar(50) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `private` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_follows`
--

CREATE TABLE `phone_twitter_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  `notifications` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_twitter_follows`
--
DELIMITER $$
CREATE TRIGGER `phone_twitter_update_counts_after_follow` AFTER INSERT ON `phone_twitter_follows` FOR EACH ROW BEGIN
    
    UPDATE phone_twitter_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    
    UPDATE phone_twitter_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_twitter_update_counts_after_unfollow` AFTER DELETE ON `phone_twitter_follows` FOR EACH ROW BEGIN
    
    UPDATE phone_twitter_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    
    UPDATE phone_twitter_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_follow_requests`
--

CREATE TABLE `phone_twitter_follow_requests` (
  `requester` varchar(20) NOT NULL,
  `requestee` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_hashtags`
--

CREATE TABLE `phone_twitter_hashtags` (
  `hashtag` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `last_used` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_likes`
--

CREATE TABLE `phone_twitter_likes` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_twitter_likes`
--
DELIMITER $$
CREATE TRIGGER `phone_twitter_update_like_count_after_like` AFTER INSERT ON `phone_twitter_likes` FOR EACH ROW BEGIN
    UPDATE phone_twitter_tweets
    SET like_count = like_count + 1
    WHERE id = NEW.tweet_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_twitter_update_like_count_after_unlike` AFTER DELETE ON `phone_twitter_likes` FOR EACH ROW BEGIN
    UPDATE phone_twitter_tweets
    SET like_count = like_count - 1
    WHERE id = OLD.tweet_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_messages`
--

CREATE TABLE `phone_twitter_messages` (
  `id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_notifications`
--

CREATE TABLE `phone_twitter_notifications` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `tweet_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_promoted`
--

CREATE TABLE `phone_twitter_promoted` (
  `tweet_id` varchar(50) NOT NULL,
  `promotions` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_retweets`
--

CREATE TABLE `phone_twitter_retweets` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Déclencheurs `phone_twitter_retweets`
--
DELIMITER $$
CREATE TRIGGER `phone_twitter_update_retweet_count_after_retweet` AFTER INSERT ON `phone_twitter_retweets` FOR EACH ROW BEGIN
    UPDATE phone_twitter_tweets
    SET retweet_count = retweet_count + 1
    WHERE id = NEW.tweet_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phone_twitter_update_retweet_count_after_unretweet` AFTER DELETE ON `phone_twitter_retweets` FOR EACH ROW BEGIN
    UPDATE phone_twitter_tweets
    SET retweet_count = retweet_count - 1
    WHERE id = OLD.tweet_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_tweets`
--

CREATE TABLE `phone_twitter_tweets` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `content` varchar(280) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `reply_to` varchar(50) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `reply_count` int(11) DEFAULT 0,
  `retweet_count` int(11) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_voice_memos_recordings`
--

CREATE TABLE `phone_voice_memos_recordings` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_length` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_wallet_transactions`
--

CREATE TABLE `phone_wallet_transactions` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `phone_yellow_pages_posts`
--

CREATE TABLE `phone_yellow_pages_posts` (
  `id` varchar(10) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `playerstattoos`
--

CREATE TABLE `playerstattoos` (
  `identifier` varchar(50) NOT NULL,
  `tattoos` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


-- --------------------------------------------------------

--
-- Structure de la table `players_gofast`
--

CREATE TABLE `players_gofast` (
  `id` int(11) NOT NULL,
  `license_identifier` varchar(50) NOT NULL,
  `gofast_cooldown` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `players_props`
--

CREATE TABLE `players_props` (
  `UniqueID` int(11) NOT NULL DEFAULT 0,
  `data` longtext DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `players_territories`
--

CREATE TABLE `players_territories` (
  `id` int(11) NOT NULL,
  `control` varchar(50) DEFAULT 'none',
  `namecontrol` varchar(50) DEFAULT 'none',
  `influence` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_clothes`
--

CREATE TABLE `player_clothes` (
  `UniqueID` int(11) NOT NULL,
  `clothes` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `player_entreprise`
--

CREATE TABLE `player_entreprise` (
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `PosVestiaire` varchar(255) DEFAULT NULL,
  `PosCustom` varchar(255) DEFAULT NULL,
  `PosCustom2` varchar(255) DEFAULT NULL,
  `PosCustom3` varchar(255) DEFAULT NULL,
  `PosBoss` varchar(255) DEFAULT NULL,
  `namerecolteitem` varchar(255) DEFAULT NULL,
  `PosRecolte` varchar(255) DEFAULT NULL,
  `nametraitementitem` varchar(255) DEFAULT NULL,
  `PosTraitement` varchar(255) DEFAULT NULL,
  `PosVente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_entreprise`
--

INSERT INTO `player_entreprise` (`type`, `name`, `label`, `PosVestiaire`, `PosCustom`, `PosCustom2`, `PosCustom3`, `PosBoss`, `namerecolteitem`, `PosRecolte`, `nametraitementitem`, `PosTraitement`, `PosVente`) VALUES
('Farm', 'le_ferailleur', 'Le Férailleur', NULL, NULL, NULL, NULL, 'null', 'reco_ferrailleur', '{\"x\":-471.3713073730469,\"y\":-1692.560546875,\"z\":18.90809059143066}', 'trait_ferrailleur', '{\"x\":1060.7255859375,\"y\":-1998.80908203125,\"z\":31.01581382751465}', '{\"x\":1269.7349853515626,\"y\":-3222.6962890625,\"z\":5.90104293823242}'),
('Farm', 'petitpecheur', 'PetitPecheur', NULL, NULL, NULL, NULL, 'null', 'reco_petitpecheur', '{\"x\":-161.963134765625,\"y\":-3560.025146484375,\"z\":1.38876366615295}', 'trait_petitpecheur', '{\"x\":907.828369140625,\"y\":-1723.7042236328126,\"z\":32.15963363647461}', '{\"x\":-1038.5352783203126,\"y\":-1396.851806640625,\"z\":5.55319213867187}'),
('Farm', 'tabac', 'Tabac', NULL, NULL, NULL, NULL, 'null', 'reco_tabac', '{\"x\":2868.0263671875,\"y\":4610.85205078125,\"z\":48.1182861328125}', 'trait_tabac', '{\"x\":932.3169555664063,\"y\":-1803.5010986328126,\"z\":30.69332313537597}', '{\"x\":1276.494140625,\"y\":-3217.777099609375,\"z\":5.90104436874389}'),
('Farm', 'vangelico', 'Vangelico', NULL, NULL, NULL, NULL, 'null', 'diamant', '{\"x\":1006.6739501953125,\"y\":-1219.7052001953126,\"z\":25.13553237915039}', 'bijoux', '{\"x\":-403.7701721191406,\"y\":-2274.496826171875,\"z\":7.60825490951538}', '{\"x\":-624.5750732421875,\"y\":-231.01414489746095,\"z\":38.0570068359375}'),
('Farm', 'vigne', 'Vigneron', NULL, NULL, NULL, NULL, 'null', 'reco_vigneron', '{\"x\":-1811.5535888671876,\"y\":2210.196044921875,\"z\":91.2333984375}', 'trait_vigneron', '{\"x\":-1137.95751953125,\"y\":2686.93798828125,\"z\":18.61795806884765}', '{\"x\":-25.15570068359375,\"y\":-86.69558715820313,\"z\":57.25407409667969}');

-- --------------------------------------------------------

--
-- Structure de la table `player_fishing`
--

CREATE TABLE `player_fishing` (
  `UniqueID` int(11) DEFAULT NULL,
  `level` longtext DEFAULT 0,
  `fishList` longtext DEFAULT NULL,
  `permit` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `player_gallery`
--

CREATE TABLE `player_gallery` (
  `id` int(11) NOT NULL,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_idcard`
--

CREATE TABLE `player_idcard` (
  `UID` longtext NOT NULL,
  `UniqueID` longtext NOT NULL,
  `firstname` longtext NOT NULL,
  `lastname` longtext NOT NULL,
  `dateofbirth` longtext NOT NULL,
  `sex` longtext NOT NULL,
  `height` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `player_inventory_clothes`
--

CREATE TABLE `player_inventory_clothes` (
  `UniqueID` int(11) NOT NULL,
  `clothes` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `player_isdead`
--

CREATE TABLE `player_isdead` (
  `UniqueID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_jails`
--

CREATE TABLE `player_jails` (
  `UniqueID` int(11) NOT NULL,
  `time` longtext DEFAULT NULL,
  `staff` longtext DEFAULT NULL,
  `reason` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `player_leboncoin`
--

CREATE TABLE `player_leboncoin` (
  `identifier` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `count` longtext DEFAULT NULL,
  `type` longtext DEFAULT NULL,
  `price` longtext DEFAULT NULL,
  `id` longtext DEFAULT NULL,
  `plate` longtext DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL,
  `UniqueID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `player_livraisons`
--

CREATE TABLE `player_livraisons` (
  `uniqueid` int(11) NOT NULL,
  `levels` int(11) DEFAULT 0,
  `gains` int(11) NOT NULL DEFAULT 100,
  `livraisons` int(11) DEFAULT 0,
  `vehicle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_livraisons`
--

INSERT INTO `player_livraisons` (`uniqueid`, `levels`, `gains`, `livraisons`, `vehicle`) VALUES
(1, 0, 100, 0, '[\"boxville\"]'),
(6, 0, 100, 0, '[\"boxville\"]');

-- --------------------------------------------------------

--
-- Structure de la table `player_ltdsales`
--

CREATE TABLE `player_ltdsales` (
  `uid` int(11) NOT NULL,
  `job` longtext NOT NULL,
  `u` longtext DEFAULT NULL,
  `d` longtext DEFAULT NULL,
  `night` longtext NOT NULL,
  `day` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `label` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playlist_songs`
--

CREATE TABLE `playlist_songs` (
  `id` int(11) NOT NULL,
  `playlist` int(11) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `playlist_songs`
--

INSERT INTO `playlist_songs` (`id`, `playlist`, `link`) VALUES
(26, 0, 'https://www.youtube.com/watch?v=EYAjqqWuBxg'),
(28, 0, 'https://www.youtube.com/watch?v=yXeJ8ZRActM'),
(32, 50, 'https://www.youtube.com/watch?v=CYgDUBH2Zro'),
(34, 54, 'https://www.youtube.com/watch?v=vGp4TwRNtFY&list=RDMM&start_radio=1');

-- --------------------------------------------------------

--
-- Structure de la table `police_plainte`
--

CREATE TABLE `police_plainte` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `date` text DEFAULT NULL,
  `numberphone` text DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `author` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `police_plainte`
--

INSERT INTO `police_plainte` (`id`, `name`, `date`, `numberphone`, `reason`, `author`) VALUES
(1, 'd', '12222', 'd', 'j\'essais !', 'Valentin Agl');

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

-- --------------------------------------------------------

--
-- Structure de la table `properties_access`
--

CREATE TABLE `properties_access` (
  `id_access` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `id_property` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties_list`
--

CREATE TABLE `properties_list` (
  `id_property` int(11) NOT NULL,
  `property_name` varchar(50) NOT NULL,
  `property_pos` varchar(100) DEFAULT NULL,
  `property_chest` varchar(50) DEFAULT NULL,
  `property_type` varchar(50) DEFAULT NULL,
  `property_price` int(11) DEFAULT NULL,
  `property_status` varchar(50) DEFAULT 'free',
  `property_owner` varchar(50) DEFAULT NULL,
  `garage_pos` varchar(100) DEFAULT NULL,
  `garage_max` int(11) DEFAULT NULL,
  `jobs` varchar(50) DEFAULT NULL,
  `orga` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties_news`
--

CREATE TABLE `properties_news` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `ownerName` longtext DEFAULT NULL,
  `positions` longtext DEFAULT NULL,
  `garage` longtext DEFAULT NULL,
  `entrepot` longtext DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `players` longtext DEFAULT '[]',
  `informations` longtext DEFAULT NULL,
  `colocations` longtext DEFAULT NULL,
  `chest` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties_vehicles`
--

CREATE TABLE `properties_vehicles` (
  `propertyID` int(11) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `data_vehicle` longtext NOT NULL,
  `stored` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `property_created`
--

CREATE TABLE `property_created` (
  `propertyID` int(11) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `pNumber` varchar(255) DEFAULT NULL,
  `pEnterPos` varchar(255) DEFAULT NULL,
  `gEnterPos` varchar(255) DEFAULT NULL,
  `gPlaces` varchar(255) DEFAULT NULL,
  `stockCapacity` varchar(255) DEFAULT NULL,
  `dateRented` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `pInventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}',
  `pVehicules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}',
  `pKeys` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `radiocar_music`
--

CREATE TABLE `radiocar_music` (
  `id` int(11) NOT NULL,
  `label` varchar(64) NOT NULL,
  `url` varchar(256) NOT NULL,
  `plate` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `radiocar_owned`
--

CREATE TABLE `radiocar_owned` (
  `id` int(11) NOT NULL,
  `spz` varchar(32) NOT NULL,
  `style` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `radiocar_playlist`
--

CREATE TABLE `radiocar_playlist` (
  `id` int(11) NOT NULL,
  `playlist` text NOT NULL,
  `plate` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rcore_tattoos`
--

CREATE TABLE `rcore_tattoos` (
  `identifier` varchar(100) NOT NULL,
  `tattoos` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `rcore_tattoos_business`
--

CREATE TABLE `rcore_tattoos_business` (
  `name` varchar(60) NOT NULL,
  `margin` int(11) DEFAULT 20,
  `money` int(11) DEFAULT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `selling_weapons`
--

CREATE TABLE `selling_weapons` (
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `slots_inventory`
--

CREATE TABLE `slots_inventory` (
  `UniqueID` int(11) NOT NULL,
  `slots` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `society_data`
--

CREATE TABLE `society_data` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `label` text DEFAULT NULL,
  `coffre` longtext DEFAULT NULL,
  `permissions` longtext DEFAULT NULL,
  `posCoffre` varchar(255) DEFAULT NULL,
  `posBoss` varchar(255) DEFAULT NULL,
  `blips` longtext DEFAULT NULL,
  `tax` text DEFAULT '0',
  `cloakroom` tinyint(1) DEFAULT NULL,
  `clothes` longtext DEFAULT '[]',
  `cloakpos` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `society_data`
--

INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(20, 'bar_salieris', 'Slieris', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"deposit_money_society\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":true,\"copatron\":true,\"copat\":true,\"securiter\":true,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true},\"novice\":true},\"delete_grade\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Supprimer un grade\",\"grades\":{\"boss\":true},\"novice\":false},\"recruit_player\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Recruté un joueur\",\"grades\":{\"boss\":true},\"novice\":false},\"deposit_black_money_coffre\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":true,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true},\"novice\":true},\"withdraw_money_society\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"editClothes\":{\"Co-Chef \":true,\"label\":\"Gérer les tenues dans le vestiaire\",\"danseuce\":false,\"securiter\":false,\"recrue\":false,\"grades\":{\"boss\":true},\"novice\":false},\"change_permissions_grade\":{\"securiter\":false,\"Co-Chef \":true,\"label\":\"Changer les permissions d\'un grade\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":false,\"novice\":false},\"dposit_item_chest_society\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":true,\"label\":\"Déposer un item dans le coffre de la société\",\"grades\":{\"boss\":true},\"novice\":true},\"withdraw_black_money_coffre\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"remove_weapon_chest_society\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"grades\":{\"boss\":true},\"novice\":[]},\"manage_grades\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Gérer les grades de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"deposit_item_chest\":{\"securiter\":false,\"Co-Chef \":true,\"label\":\"Déposer un item dans le coffre\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":[],\"novice\":[]},\"deposit_weapon_chest\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":true,\"label\":\"Déposer une arme dans le coffre\",\"grades\":{\"boss\":true},\"novice\":true},\"deposit_cash_coffre\":{\"securiter\":true,\"Co-Chef \":true,\"label\":\"Déposer de l\'argent dans le coffre\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":true,\"novice\":false},\"unmote_player\":{\"securiter\":false,\"Co-Chef \":true,\"label\":\"Descendre un employé\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":false,\"novice\":false},\"weapons_chest_society\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Arme(s) du coffre de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"open_boss\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Ouvrir le menu boss\",\"grades\":{\"boss\":true},\"novice\":false},\"remove_item_chest_society\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"withdraw_cash_coffre\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"open_coffre\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Ouvrir le coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"change_number_grade\":{\"securiter\":false,\"Co-Chef \":true,\"label\":\"Changer le numéro d\'un grade\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":false,\"novice\":false},\"rename_label_grade\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Changer le label d\'un grade\",\"grades\":{\"boss\":true},\"novice\":false},\"items_chest\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Items du coffre\",\"grades\":{\"boss\":true},\"novice\":[]},\"change_salary_grade\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Changer le salaire d\'un grade\",\"grades\":{\"boss\":true},\"novice\":false},\"manage_employeds\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Gérer les employés de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"weapons_chest\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Armes du coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"demote_player\":{\"Co-Chef \":false,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":false,\"copat\":true,\"securiter\":false,\"label\":\"Virer un employé\",\"grades\":{\"boss\":true},\"novice\":false},\"rename_grade\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Changer le nom d\'un grade\",\"grades\":{\"boss\":true},\"novice\":false},\"remove_item_chest\":{\"Co-Chef \":false,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer un item dans le coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"items_chest:society\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Item(s) du coffre de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"promote_player\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Augmenter un employé\",\"grades\":{\"boss\":true},\"novice\":false},\"chest\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Accéder au coffre de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"remove_weapon_chest\":{\"Co-Chef \":false,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer une arme dans le coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"deposit_weapon_chest_society\":{\"securiter\":true,\"Co-Chef \":true,\"label\":\"Déposer une arme dans le coffre de la société\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":[],\"novice\":false},\"create_grade\":{\"Co-Chef \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Créer un grade\",\"grades\":{\"boss\":true},\"novice\":false}}', '{\"z\":33.80733489990234,\"x\":415.5896606445313,\"y\":-1505.79052734375}', '{\"z\":33.80732727050781,\"x\":410.9037170410156,\"y\":-1500.8223876953126}', '{\"sprite\":93,\"color\":21,\"position\":{\"z\":33.80731582641601,\"x\":412.6139221191406,\"y\":-1490.606201171875},\"active\":true}', '1', 1, '[]', '{\"z\":33.80727386474609,\"x\":416.34576416015627,\"y\":-1484.687255859375}'),
(23, 'realestateagent', 'Agence Immobilière', '{\"accounts\":{\"society\":119.25,\"black_money\":0,\"cash\":0},\"weapons_boss\":[],\"items_boss\":[],\"weapons\":[],\"items\":[]}', '{\"deposit_black_money_coffre\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":true,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Déposer de l\'argent sale dans le coffre\",\"boss\":true},\"remove_item_chest_society\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":false,\"Co-gérant\":[],\"label\":\"Retirer un item dans le coffre de la société\",\"boss\":true},\"rename_grade\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Changer le nom d\'un grade\",\"boss\":true},\"unmote_player\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Descendre un employé\",\"boss\":true},\"deposit_cash_coffre\":{\"vendeur\":true,\"Recru\":false,\"Agent de sécurité\":true,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Déposer de l\'argent dans le coffre\",\"boss\":true},\"promote_player\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Augmenter un employé\",\"boss\":true},\"remove_weapon_chest\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":true,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":false,\"Co-gérant\":[],\"label\":\"Retirer une arme dans le coffre\",\"boss\":true},\"change_number_grade\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Changer le numéro d\'un grade\",\"boss\":true},\"remove_weapon_chest_society\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Retirer une arme dans la coffre de la société\",\"boss\":true},\"chest\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Accéder au coffre de la société\",\"boss\":true},\"delete_grade\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":false,\"Co-gérant\":[],\"label\":\"Supprimer un grade\",\"boss\":true},\"deposit_item_chest\":{\"vendeur\":[],\"Recru\":false,\"Agent de sécurité\":true,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Déposer un item dans le coffre\",\"boss\":true},\"remove_item_chest\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":true,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Retirer un item dans le coffre\",\"boss\":true},\"rename_label_grade\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Changer le label d\'un grade\",\"boss\":true},\"manage_grades\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Gérer les grades de la société\",\"boss\":true},\"withdraw_money_society\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":false,\"Co-gérant\":[],\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"boss\":true},\"deposit_money_society\":{\"vendeur\":[],\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"boss\":true},\"manage_employeds\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Gérer les employés de la société\",\"boss\":true},\"open_boss\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Ouvrir le menu boss\",\"boss\":true},\"withdraw_cash_coffre\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":true,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":false,\"Co-gérant\":[],\"label\":\"Retirer de l\'argent dans le coffre\",\"boss\":true},\"weapons_chest_society\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":false,\"Co-gérant\":[],\"label\":\"Arme(s) du coffre de la société\",\"boss\":true},\"open_coffre\":{\"vendeur\":true,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Ouvrir le coffre\",\"boss\":true},\"weapons_chest\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":true,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Armes du coffre\",\"boss\":true},\"withdraw_black_money_coffre\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":true,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Retirer de l\'argent sale dans le coffre\",\"boss\":true},\"dposit_item_chest_society\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Déposer un item dans le coffre de la société\",\"boss\":true},\"items_chest\":{\"vendeur\":true,\"Recru\":false,\"Agent de sécurité\":true,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Items du coffre\",\"boss\":true},\"demote_player\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Virer un employé\",\"boss\":true},\"deposit_weapon_chest_society\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Déposer une arme dans le coffre de la société\",\"boss\":true},\"editClothes\":{\"vendeur\":false,\"label\":\"Gérer les tenues dans le vestiaire\",\"Recru\":false,\"grades\":{\"boss\":true},\"Co-Chef\":true},\"items_chest:society\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Item(s) du coffre de la société\",\"boss\":true},\"change_salary_grade\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Changer le salaire d\'un grade\",\"boss\":true},\"create_grade\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Créer un grade\",\"boss\":true},\"recruit_player\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Recruté un joueur\",\"boss\":true},\"deposit_weapon_chest\":{\"vendeur\":true,\"Recru\":false,\"Agent de sécurité\":true,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Déposer une arme dans le coffre\",\"boss\":true},\"change_permissions_grade\":{\"vendeur\":false,\"Recru\":false,\"Agent de sécurité\":false,\"grades\":{\"boss\":true},\"employed\":[],\"Co-Chef\":true,\"Co-gérant\":[],\"label\":\"Changer les permissions d\'un grade\",\"boss\":true}}', '{\"z\":84.10100555419922,\"x\":-716.2175903320313,\"y\":266.65576171875}', '{\"z\":84.13785552978516,\"x\":-725.4684448242188,\"y\":263.7276916503906}', '{\"active\":true,\"position\":{\"z\":83.147262573242,\"x\":-702.89031982422,\"y\":270.38668823242},\"color\":1,\"sprite\":498}', '3', 1, '[]', '{\"z\":84.64998626708985,\"x\":-720.77685546875,\"y\":270.5213317871094}'),
(26, 'cardealer', 'Concessionnaire Automobile', '{\"weapons_boss\":[],\"items_boss\":[],\"weapons\":[],\"accounts\":{\"cash\":0,\"society\":2306328.7051327137,\"black_money\":47819},\"items\":{\"bread\":{\"count\":142,\"name\":\"bread\",\"label\":\"Pain\"},\"hack_phone\":{\"count\":1,\"name\":\"hack_phone\",\"label\":\"Téléphone Jailbreak\"},\"water\":{\"count\":153,\"name\":\"water\",\"label\":\"Eau\"},\"ciseaux\":{\"count\":1,\"name\":\"ciseaux\",\"label\":\"Ciseaux\"},\"ocean_lures\":{\"count\":300,\"name\":\"ocean_lures\",\"label\":\"Appât d\'Eau Profonde\"},\"hack_laptop\":{\"count\":1,\"name\":\"hack_laptop\",\"label\":\"Ordinateur Portable\"},\"crochetage_kit\":{\"count\":1,\"name\":\"crochetage_kit\",\"label\":\"Kit de Crochetage\"}}}', '{\"deposit_cash_coffre\":{\"recru\":true,\"experienced\":[],\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":false,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":true,\"label\":\"Déposer de l\'argent dans le coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":true,\"Directeur Comercial\":true,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"remove_weapon_chest\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Retirer une arme dans le coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"create_grade\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":false,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Créer un grade\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"weapons_chest\":{\"recru\":true,\"experienced\":true,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Armes du coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"manage_employeds\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Gérer les employés de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"manage_grades\":{\"recru\":false,\"experienced\":[],\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Gérer les grades de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"withdraw_money_society\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":false,\"responsable des ventes\":false,\"Directeur des ventes\":true,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":false,\"Vendeur\":false,\"Directeur Comercial\":true,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"demote_player\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":false,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Virer un employé\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"change_permissions_grade\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Changer les permissions d\'un grade\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"withdraw_black_money_coffre\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":false,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"remove_item_chest_society\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":true,\"label\":\"Retirer un item dans le coffre de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"delete_grade\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":false,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Supprimer un grade\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"remove_item_chest\":{\"recru\":false,\"experienced\":[],\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Retirer un item dans le coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":true,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"rename_grade\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Changer le nom d\'un grade\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"recruit_player\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":false,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Recruté un joueur\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"unmote_player\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Descendre un employé\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"dposit_item_chest_society\":{\"recru\":true,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Déposer un item dans le coffre de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":true,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"deposit_weapon_chest_society\":{\"recru\":true,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Déposer une arme dans le coffre de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":true,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"deposit_item_chest\":{\"recru\":true,\"experienced\":[],\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":false,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Déposer un item dans le coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":true,\"Directeur Comercial\":true,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"editClothes\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":false,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Gérer les tenues dans le vestiaire\",\"boss\":[],\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"rename_label_grade\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Changer le label d\'un grade\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"change_salary_grade\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Changer le salaire d\'un grade\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"chest\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":true,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":true,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Accéder au coffre de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":true,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"items_chest\":{\"recru\":true,\"experienced\":[],\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":false,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Items du coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":true,\"Directeur Comercial\":true,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"open_coffre\":{\"recru\":true,\"experienced\":[],\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":true,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Ouvrir le coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":true,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"promote_player\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Augmenter un employé\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"deposit_black_money_coffre\":{\"recru\":true,\"experienced\":true,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":false,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":true,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"change_number_grade\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Changer le numéro d\'un grade\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"remove_weapon_chest_society\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":true,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"weapons_chest_society\":{\"recru\":true,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":true,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Arme(s) du coffre de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"deposit_weapon_chest\":{\"recru\":true,\"experienced\":false,\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":true,\"dori\":true,\"responsable des ventes\":false,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Déposer une arme dans le coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":true,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":false},\"deposit_money_society\":{\"recru\":true,\"experienced\":[],\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":false,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":true,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":true,\"Directeur Comercial\":true,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"withdraw_cash_coffre\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":true,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":false,\"Vendeur\":false,\"Directeur Comercial\":true,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"open_boss\":{\"recru\":false,\"experienced\":false,\"Ressource Humaine\":true,\"novice\":false,\"Vendeur confirmé\":false,\"sénior\":false,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":true,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Ouvrir le menu boss\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":false,\"Directeur Comercial\":true,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true},\"items_chest:society\":{\"recru\":true,\"experienced\":[],\"Ressource Humaine\":false,\"novice\":false,\"Vendeur confirmé\":true,\"sénior\":true,\"dori\":true,\"responsable des ventes\":true,\"Directeur des ventes\":false,\"King le boss\":true,\"recruu\":false,\"recruit\":false,\"junior\":false,\"label\":\"Item(s) du coffre de la société\",\"boss\":true,\"mec trop gentil\":true,\"responable des ventes\":true,\"Vendeur\":true,\"Directeur Comercial\":false,\"vide\":false,\"Gerant\":[],\"grades\":{\"boss\":true},\"expérimenté\":false,\"BOSSSSSS\":true,\"Directeur Ressource Humaine\":true}}', '{\"y\":-1110.20703125,\"z\":22.32853317260742,\"x\":-613.7797241210938}', '{\"y\":-1111.85791015625,\"z\":22.33290481567382,\"x\":-613.935302734375}', '{\"position\":{\"y\":-1122.246826171875,\"z\":22.32414245605468,\"x\":-603.1704711914063},\"active\":true,\"color\":0,\"sprite\":523}', '3', 1, '[{\"grade\":true,\"grades\":{\"Vendeur confirmé\":\"Vendeur confirmé\",\"Directeur Ressource Humaine\":\"Directeur Ressource Humaine\",\"Ressource Humaine\":\"Ressource Humaine\",\"Directeur des ventes\":\"Directeur des ventes\",\"boss\":\"boss\",\"Directeur Comercial\":\"Directeur Comercial\",\"recru\":\"recru\",\"Vendeur\":\"Vendeur\"},\"data\":{\"bproof_2\":0,\"shoes_2\":2,\"mask_1\":0,\"chain_1\":0,\"mom\":16,\"skin_md_weight\":50,\"watches_2\":3,\"moles_2\":0,\"cheeks_1\":0,\"makeup_1\":0,\"age_1\":0,\"beard_3\":0,\"torso_2\":1,\"sun_2\":0,\"face_md_weight\":56,\"complexion_2\":0,\"hair_2\":0,\"neck_thickness\":0,\"hair_color_2\":0,\"bracelets_2\":0,\"bproof_1\":0,\"blush_2\":0,\"bracelets_1\":-1,\"beard_2\":10,\"age_2\":0,\"blush_1\":0,\"dad\":9,\"arms\":11,\"eyebrows_5\":0,\"watches_1\":4,\"cheeks_3\":0,\"chin_4\":0,\"lipstick_1\":0,\"tshirt_1\":15,\"nose_4\":0,\"mask_2\":0,\"lipstick_4\":0,\"shoes_1\":7,\"bags_1\":0,\"bodyb_2\":0,\"nose_1\":0,\"blush_3\":0,\"bodyb_4\":0,\"chin_1\":0,\"bags_2\":0,\"eyebrows_1\":26,\"complexion_1\":0,\"blemishes_1\":0,\"bodyb_3\":-1,\"beard_1\":10,\"pants_1\":10,\"chest_1\":3,\"torso_1\":95,\"makeup_2\":0,\"tshirt_2\":0,\"chin_3\":0,\"arms_2\":0,\"eyebrows_3\":1,\"eyebrows_4\":0,\"eye_squint\":0,\"chin_2\":0,\"makeup_4\":0,\"pants_2\":0,\"lipstick_3\":0,\"eye_color\":0,\"sex\":0,\"cheeks_2\":0,\"decals_2\":0,\"nose_2\":10,\"glasses_2\":0,\"eyebrows_2\":10,\"jaw_2\":0,\"chain_2\":0,\"beard_4\":0,\"chest_2\":10,\"nose_3\":10,\"nose_5\":2,\"ears_2\":0,\"hair_color_1\":2,\"lipstick_2\":0,\"helmet_2\":0,\"bodyb_1\":-1,\"glasses_1\":0,\"ears_1\":24,\"chest_3\":0,\"hair_1\":37,\"makeup_3\":0,\"helmet_1\":-1,\"eyebrows_6\":10,\"nose_6\":10,\"moles_1\":0,\"decals_1\":0,\"lip_thickness\":0,\"sun_1\":0,\"blemishes_2\":0,\"jaw_1\":0},\"name\":\"Vendeur\"},{\"grade\":true,\"grades\":{\"Ressource Humaine\":\"Ressource Humaine\",\"Directeur des ventes\":\"Directeur des ventes\",\"boss\":\"boss\",\"Directeur Comercial\":\"Directeur Comercial\",\"Directeur Ressource Humaine\":\"Directeur Ressource Humaine\"},\"data\":{\"bproof_2\":0,\"shoes_2\":2,\"mask_1\":0,\"chain_1\":0,\"mom\":16,\"skin_md_weight\":50,\"watches_2\":3,\"eyebrows_2\":10,\"cheeks_1\":0,\"makeup_1\":0,\"age_1\":0,\"beard_3\":0,\"torso_2\":0,\"decals_2\":0,\"face_md_weight\":56,\"complexion_2\":0,\"hair_2\":0,\"neck_thickness\":0,\"hair_color_2\":0,\"bracelets_2\":0,\"bproof_1\":0,\"blush_2\":0,\"bracelets_1\":-1,\"beard_2\":10,\"age_2\":0,\"blush_1\":0,\"dad\":9,\"arms\":4,\"eyebrows_5\":0,\"watches_1\":4,\"cheeks_3\":0,\"chin_4\":0,\"lipstick_1\":0,\"tshirt_1\":32,\"nose_4\":0,\"mask_2\":0,\"lipstick_4\":0,\"shoes_1\":7,\"jaw_1\":0,\"bodyb_2\":0,\"moles_2\":0,\"chin_1\":0,\"bodyb_4\":0,\"chest_3\":0,\"blemishes_1\":0,\"eyebrows_1\":26,\"arms_2\":0,\"torso_1\":30,\"bags_1\":0,\"beard_1\":10,\"pants_1\":10,\"bodyb_3\":-1,\"hair_color_1\":2,\"sun_2\":0,\"chest_1\":3,\"makeup_2\":0,\"tshirt_2\":0,\"blush_3\":0,\"eyebrows_4\":0,\"eye_squint\":0,\"chin_2\":0,\"makeup_4\":0,\"pants_2\":0,\"lipstick_3\":0,\"eye_color\":0,\"sex\":0,\"chin_3\":0,\"cheeks_2\":0,\"nose_2\":10,\"eyebrows_3\":1,\"blemishes_2\":0,\"jaw_2\":0,\"moles_1\":0,\"beard_4\":0,\"chain_2\":0,\"nose_3\":10,\"nose_5\":2,\"hair_1\":37,\"glasses_2\":0,\"bags_2\":0,\"ears_1\":24,\"bodyb_1\":-1,\"nose_1\":0,\"lipstick_2\":0,\"glasses_1\":0,\"helmet_2\":0,\"makeup_3\":0,\"helmet_1\":-1,\"nose_6\":10,\"ears_2\":0,\"eyebrows_6\":10,\"decals_1\":0,\"lip_thickness\":0,\"sun_1\":0,\"chest_2\":10,\"complexion_1\":0},\"name\":\"Haut Gradé\"},{\"grade\":true,\"grades\":{\"boss\":\"boss\"},\"data\":{\"bproof_2\":0,\"shoes_2\":4,\"mask_1\":0,\"chain_1\":27,\"mom\":20,\"skin_md_weight\":50,\"watches_2\":0,\"eyebrows_2\":10,\"cheeks_1\":0,\"makeup_1\":0,\"age_1\":0,\"beard_3\":0,\"torso_2\":0,\"sun_2\":0,\"face_md_weight\":49,\"complexion_2\":0,\"hair_2\":0,\"eyebrows_6\":0,\"hair_color_2\":60,\"bracelets_2\":0,\"bproof_1\":0,\"blush_2\":0,\"bracelets_1\":-1,\"beard_2\":10,\"age_2\":0,\"blush_1\":0,\"chest_3\":0,\"glasses_2\":1,\"eyebrows_5\":0,\"glasses_1\":93,\"cheeks_3\":0,\"chin_4\":0,\"lipstick_1\":0,\"tshirt_1\":33,\"nose_4\":0,\"mask_2\":0,\"lipstick_4\":0,\"shoes_1\":104,\"jaw_1\":0,\"bodyb_2\":0,\"nose_1\":0,\"chin_1\":0,\"bodyb_4\":0,\"hair_color_1\":60,\"blemishes_1\":0,\"eyebrows_1\":12,\"complexion_1\":0,\"bags_1\":203,\"bodyb_3\":0,\"beard_1\":3,\"pants_1\":260,\"chest_1\":0,\"torso_1\":753,\"makeup_2\":0,\"dad\":35,\"tshirt_2\":2,\"watches_1\":-1,\"chest_2\":0,\"eyebrows_4\":0,\"eye_squint\":0,\"chin_2\":0,\"makeup_4\":0,\"arms_2\":1,\"lipstick_3\":0,\"eye_color\":0,\"sex\":0,\"pants_2\":0,\"chin_3\":0,\"nose_2\":0,\"cheeks_2\":0,\"moles_2\":0,\"jaw_2\":0,\"nose_6\":0,\"beard_4\":0,\"moles_1\":0,\"nose_3\":0,\"nose_5\":0,\"hair_1\":225,\"decals_1\":0,\"blemishes_2\":0,\"ears_1\":-1,\"bodyb_1\":0,\"neck_thickness\":0,\"arms\":22,\"makeup_3\":0,\"blush_3\":0,\"lipstick_2\":0,\"helmet_1\":309,\"helmet_2\":0,\"eyebrows_3\":0,\"ears_2\":0,\"chain_2\":2,\"lip_thickness\":0,\"sun_1\":0,\"decals_2\":0,\"bags_2\":0},\"name\":\"patron\"}]', '{\"y\":-1147.7373046875,\"z\":22.33772277832031,\"x\":-616.8736572265625}');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(27, 'airdealer', 'Concessionnaire Aérien', '{\"items\":[],\"accounts\":{\"society\":441562.62467288758,\"black_money\":0,\"cash\":0},\"weapons\":[],\"weapons_boss\":[],\"items_boss\":[]}', '{\"withdraw_cash_coffre\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent dans le coffre\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"deposit_cash_coffre\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent dans le coffre\",\"Salarié\":true,\"Co Patron\":true,\"boss\":true},\"remove_weapon_chest_society\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer une arme dans la coffre de la société\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"deposit_black_money_coffre\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent sale dans le coffre\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"deposit_money_society\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"Salarié\":true,\"Co Patron\":true,\"boss\":true},\"change_salary_grade\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le salaire d\'un grade\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"withdraw_money_society\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"recruit_player\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":true,\"grades\":{\"boss\":true},\"label\":\"Recruté un joueur\",\"Salarié\":true,\"Co Patron\":[],\"boss\":true},\"change_permissions_grade\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Changer les permissions d\'un grade\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"promote_player\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Augmenter un employé\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"remove_weapon_chest\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer une arme dans le coffre\",\"Salarié\":true,\"Co Patron\":[],\"boss\":true},\"manage_grades\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les grades de la société\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"delete_grade\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Supprimer un grade\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"rename_grade\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le nom d\'un grade\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"change_number_grade\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le numéro d\'un grade\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"weapons_chest\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Armes du coffre\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"withdraw_black_money_coffre\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent sale dans le coffre\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"demote_player\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":true,\"grades\":{\"boss\":true},\"label\":\"Virer un employé\",\"Salarié\":true,\"Co Patron\":[],\"boss\":true},\"chest\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Accéder au coffre de la société\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"unmote_player\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Descendre un employé\",\"Salarié\":true,\"Co Patron\":true,\"boss\":true},\"dposit_item_chest_society\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer un item dans le coffre de la société\",\"Salarié\":true,\"Co Patron\":[],\"boss\":true},\"items_chest:society\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Item(s) du coffre de la société\",\"Salarié\":true,\"Co Patron\":true,\"boss\":true},\"editClothes\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les tenues dans le vestiaire\",\"Salarié\":true,\"Co Patron\":true,\"boss\":[]},\"weapons_chest_society\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Arme(s) du coffre de la société\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"create_grade\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Créer un grade\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"items_chest\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Items du coffre\",\"Salarié\":true,\"Co Patron\":true,\"boss\":true},\"remove_item_chest\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer un item dans le coffre\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"rename_label_grade\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le label d\'un grade\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"deposit_weapon_chest_society\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer une arme dans le coffre de la société\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"remove_item_chest_society\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer un item dans le coffre de la société\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"manage_employeds\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les employés de la société\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"deposit_weapon_chest\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer une arme dans le coffre\",\"Salarié\":true,\"Co Patron\":false,\"boss\":true},\"open_boss\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Ouvrir le menu boss\",\"Salarié\":true,\"Co Patron\":true,\"boss\":true},\"open_coffre\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Ouvrir le coffre\",\"Salarié\":true,\"Co Patron\":true,\"boss\":true},\"deposit_item_chest\":{\"Nouveau\":false,\"Novice\":false,\"Chef d\'equipe\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer un item dans le coffre\",\"Salarié\":true,\"Co Patron\":true,\"boss\":true}}', '{\"y\":-2979.162109375,\"x\":-900.5676879882813,\"z\":19.84539794921875}', '{\"y\":-2954.657470703125,\"x\":-941.421142578125,\"z\":19.84539794921875}', '{\"color\":0,\"active\":true,\"sprite\":423,\"position\":{\"y\":-2954.657470703125,\"x\":-941.421142578125,\"z\":19.84539794921875}}', '3', 1, '[{\"name\":\"Patron-Blanc\",\"grades\":{\"boss\":\"boss\"},\"data\":{\"nose_2\":0,\"chin_3\":0,\"nose_1\":0,\"blemishes_2\":0,\"torso_2\":4,\"eyebrows_1\":0,\"bproof_2\":0,\"mom\":0,\"lipstick_4\":0,\"cheeks_3\":0,\"lipstick_2\":10.0,\"blush_2\":10.0,\"moles_2\":10.0,\"chest_3\":0,\"bodyb_4\":0,\"pants_2\":5,\"jaw_2\":-1,\"pants_1\":24,\"chain_2\":0,\"chest_1\":0,\"lipstick_1\":-1,\"tshirt_1\":25,\"eyebrows_3\":0,\"mask_1\":0,\"eye_squint\":0,\"glasses_1\":-1,\"age_1\":0,\"age_2\":10.0,\"nose_5\":0,\"blemishes_1\":0,\"eyebrows_5\":0,\"decals_2\":0,\"chin_4\":0,\"hair_color_2\":0,\"blush_3\":0,\"makeup_4\":3.0,\"chin_1\":-1,\"nose_4\":0,\"bracelets_2\":0,\"makeup_2\":10.0,\"bags_2\":0,\"arms_2\":0,\"bodyb_2\":0,\"skin_md_weight\":0.0,\"complexion_1\":0,\"bags_1\":0,\"sun_2\":0,\"beard_1\":0,\"torso_1\":24,\"sun_1\":0,\"bodyb_1\":-1,\"hair_color_1\":0,\"bproof_1\":0,\"hair_2\":0,\"watches_2\":-1,\"neck_thickness\":-1,\"nose_3\":0,\"eyebrows_6\":0,\"sex\":0,\"moles_1\":-1,\"nose_6\":0,\"hair_1\":51,\"ears_1\":-1,\"beard_4\":0,\"complexion_2\":0,\"blush_1\":-1,\"chin_2\":0,\"face_md_weight\":0.0,\"decals_1\":0,\"lip_thickness\":0.0,\"beard_3\":0,\"helmet_1\":-1,\"eyebrows_4\":0,\"jaw_1\":-1,\"helmet_2\":-1,\"dad\":0,\"makeup_1\":-1,\"shoes_1\":20,\"arms\":39,\"ears_2\":-1,\"cheeks_2\":0,\"shoes_2\":3,\"makeup_3\":0,\"beard_2\":0,\"eye_color\":0,\"lipstick_3\":0,\"glasses_2\":-1,\"chain_1\":-1,\"mask_2\":0,\"tshirt_2\":0,\"cheeks_1\":0,\"chest_2\":0,\"watches_1\":-1,\"bodyb_3\":-1,\"bracelets_1\":-1,\"eyebrows_2\":10},\"grade\":true},{\"name\":\"salarié\",\"grades\":[],\"data\":{\"bodyb_3\":-1,\"chin_3\":0,\"nose_1\":0,\"blemishes_2\":0,\"torso_2\":3,\"eyebrows_1\":30,\"bproof_2\":0,\"mom\":23,\"lipstick_4\":0,\"cheeks_3\":0,\"chest_2\":0,\"nose_6\":0,\"moles_2\":0,\"beard_2\":0,\"cheeks_1\":0,\"pants_2\":0,\"jaw_2\":0,\"pants_1\":22,\"beard_4\":0,\"arms_2\":0,\"lipstick_1\":0,\"tshirt_1\":25,\"eyebrows_3\":0,\"blemishes_1\":0,\"makeup_3\":0,\"sex\":0,\"glasses_1\":0,\"watches_2\":0,\"age_2\":0,\"nose_5\":0,\"blush_1\":0,\"chest_1\":0,\"chest_3\":0,\"chin_4\":0,\"hair_color_2\":0,\"moles_1\":0,\"makeup_4\":0,\"chin_1\":0,\"bodyb_2\":0,\"bracelets_2\":0,\"makeup_2\":0,\"nose_4\":0,\"bags_1\":0,\"mask_1\":0,\"skin_md_weight\":50,\"complexion_1\":0,\"hair_2\":0,\"ears_2\":-1,\"watches_1\":-1,\"torso_1\":4,\"sun_1\":0,\"helmet_2\":-1,\"eye_squint\":0,\"bproof_1\":0,\"beard_1\":0,\"cheeks_2\":0,\"lipstick_2\":0,\"nose_3\":0,\"eyebrows_6\":0,\"face_color\":45,\"helmet_1\":-1,\"glasses_2\":0,\"hair_1\":273,\"age_1\":0,\"bodyb_1\":-1,\"complexion_2\":0,\"face_md_weight\":100,\"chin_2\":0,\"lip_thickness\":0,\"decals_1\":0,\"sun_2\":0,\"beard_3\":0,\"arms\":39,\"hair_color_1\":0,\"jaw_1\":0,\"eyebrows_2\":10,\"dad\":32,\"makeup_1\":0,\"shoes_1\":20,\"decals_2\":0,\"eye_color\":0,\"eyebrows_5\":0,\"shoes_2\":0,\"ears_1\":-1,\"bags_2\":0,\"bodyb_4\":0,\"lipstick_3\":0,\"nose_2\":0,\"chain_1\":-1,\"mask_2\":0,\"tshirt_2\":0,\"blush_3\":0,\"blush_2\":0,\"bracelets_1\":-1,\"eyebrows_4\":0,\"neck_thickness\":0,\"chain_2\":0},\"grade\":false}]', '{\"y\":-2965.811767578125,\"x\":-923.8231811523438,\"z\":19.84539794921875}'),
(28, 'boatdealer', 'Concessionaire Bateau', '{\"items\":[],\"accounts\":{\"society\":1615965.6895622602,\"black_money\":0,\"cash\":0},\"weapons\":[],\"weapons_boss\":[],\"items_boss\":[]}', '{\"withdraw_cash_coffre\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Retirer de l\'argent dans le coffre\",\"EMPLOYER\":false,\"boss\":true},\"deposit_cash_coffre\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":true,\"Co-Chef\":[],\"label\":\"Déposer de l\'argent dans le coffre\",\"EMPLOYER\":false,\"boss\":true},\"remove_weapon_chest_society\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"EMPLOYER\":false,\"boss\":true},\"deposit_black_money_coffre\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":true,\"CONSEILLER\":true,\"Co-Chef\":[],\"label\":\"Déposer de l\'argent sale dans le coffre\",\"EMPLOYER\":false,\"boss\":true},\"deposit_money_society\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":true,\"Co-Chef\":false,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"EMPLOYER\":false,\"boss\":true},\"change_salary_grade\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Changer le salaire d\'un grade\",\"EMPLOYER\":false,\"boss\":true},\"withdraw_money_society\":{\"grades\":{\"boss\":true},\"novice\":false,\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"EMPLOYER\":false,\"boss\":true},\"recruit_player\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":true,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Recruté un joueur\",\"EMPLOYER\":false,\"boss\":true},\"change_permissions_grade\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Changer les permissions d\'un grade\",\"EMPLOYER\":false,\"boss\":true},\"promote_player\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Augmenter un employé\",\"EMPLOYER\":false,\"boss\":true},\"remove_weapon_chest\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Retirer une arme dans le coffre\",\"EMPLOYER\":false,\"boss\":true},\"manage_grades\":{\"CO-FONDA\":false,\"grades\":{\"boss\":true},\"novice\":[],\"label\":\"Gérer les grades de la société\",\"CONSEILLER\":false,\"Praktikant\":false,\"Co-Chef\":[],\"EMPLOYER\":false,\"boss\":true},\"delete_grade\":{\"CO-FONDA\":false,\"grades\":{\"boss\":true},\"novice\":[],\"label\":\"Supprimer un grade\",\"CONSEILLER\":false,\"Praktikant\":false,\"Co-Chef\":false,\"EMPLOYER\":false,\"boss\":true},\"rename_grade\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Changer le nom d\'un grade\",\"EMPLOYER\":false,\"boss\":true},\"change_number_grade\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Changer le numéro d\'un grade\",\"EMPLOYER\":false,\"boss\":true},\"weapons_chest\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":true,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Armes du coffre\",\"EMPLOYER\":false,\"boss\":true},\"withdraw_black_money_coffre\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"EMPLOYER\":false,\"boss\":true},\"demote_player\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":true,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Virer un employé\",\"EMPLOYER\":false,\"boss\":true},\"chest\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":true,\"CONSEILLER\":false,\"Co-Chef\":false,\"label\":\"Accéder au coffre de la société\",\"EMPLOYER\":false,\"boss\":true},\"unmote_player\":{\"CO-FONDA\":false,\"grades\":{\"boss\":true},\"novice\":[],\"label\":\"Descendre un employé\",\"CONSEILLER\":false,\"Praktikant\":false,\"Co-Chef\":true,\"EMPLOYER\":false,\"boss\":true},\"dposit_item_chest_society\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":true,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Déposer un item dans le coffre de la société\",\"EMPLOYER\":false,\"boss\":true},\"items_chest:society\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Item(s) du coffre de la société\",\"EMPLOYER\":false,\"boss\":true},\"editClothes\":{\"Co-Chef\":[]},\"deposit_item_chest\":{\"CO-FONDA\":false,\"grades\":{\"boss\":true},\"novice\":[],\"label\":\"Déposer un item dans le coffre\",\"CONSEILLER\":true,\"Praktikant\":false,\"Co-Chef\":[],\"EMPLOYER\":false,\"boss\":true},\"items_chest\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":true,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Items du coffre\",\"EMPLOYER\":false,\"boss\":true},\"create_grade\":{\"CO-FONDA\":false,\"grades\":{\"boss\":true},\"novice\":[],\"label\":\"Créer un grade\",\"CONSEILLER\":false,\"Praktikant\":false,\"Co-Chef\":false,\"EMPLOYER\":false,\"boss\":true},\"remove_item_chest\":{\"CO-FONDA\":true,\"grades\":{\"boss\":true},\"novice\":[],\"label\":\"Retirer un item dans le coffre\",\"CONSEILLER\":true,\"Praktikant\":false,\"Co-Chef\":false,\"EMPLOYER\":false,\"boss\":true},\"rename_label_grade\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":false,\"label\":\"Changer le label d\'un grade\",\"EMPLOYER\":false,\"boss\":true},\"remove_item_chest_society\":{\"grades\":{\"boss\":true},\"novice\":false,\"CO-FONDA\":true,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Retirer un item dans le coffre de la société\",\"EMPLOYER\":false,\"boss\":true},\"weapons_chest_society\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Arme(s) du coffre de la société\",\"EMPLOYER\":false,\"boss\":true},\"manage_employeds\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Gérer les employés de la société\",\"EMPLOYER\":false,\"boss\":true},\"deposit_weapon_chest\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":true,\"CONSEILLER\":false,\"Co-Chef\":false,\"label\":\"Déposer une arme dans le coffre\",\"EMPLOYER\":false,\"boss\":true},\"deposit_weapon_chest_society\":{\"CO-FONDA\":false,\"grades\":{\"boss\":true},\"novice\":[],\"label\":\"Déposer une arme dans le coffre de la société\",\"CONSEILLER\":false,\"Praktikant\":false,\"Co-Chef\":[],\"EMPLOYER\":false,\"boss\":true},\"open_boss\":{\"grades\":{\"boss\":true},\"novice\":[],\"CO-FONDA\":false,\"CONSEILLER\":false,\"Co-Chef\":[],\"label\":\"Ouvrir le menu boss\",\"EMPLOYER\":false,\"boss\":true},\"open_coffre\":{\"CO-FONDA\":true,\"grades\":{\"boss\":true},\"novice\":[],\"label\":\"Ouvrir le coffre\",\"CONSEILLER\":false,\"Praktikant\":false,\"Co-Chef\":[],\"EMPLOYER\":false,\"boss\":true}}', '{\"y\":-1368.5792236328126,\"x\":-810.6853637695313,\"z\":5.17834520339965}', '{\"y\":-1345.907958984375,\"x\":-788.5839233398438,\"z\":5.1783447265625}', '{\"color\":0,\"active\":true,\"sprite\":410,\"position\":{\"y\":-1345.907958984375,\"x\":-788.5839233398438,\"z\":5.1783447265625}}', '3', 1, '[]', '{\"y\":-1344.47021484375,\"x\":-791.1055908203125,\"z\":9.03531646728515}'),
(29, 'motodealer', 'Concessionnaire Moto', '{\"items\":[],\"accounts\":{\"society\":85217.95063906576,\"black_money\":0,\"cash\":0},\"weapons\":[],\"weapons_boss\":[],\"items_boss\":[]}', '{\"withdraw_cash_coffre\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"deposit_cash_coffre\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Déposer de l\'argent dans le coffre\",\"grades\":{\"boss\":true},\"Apprentie\":[],\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"remove_weapon_chest_society\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"deposit_black_money_coffre\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true},\"Apprentie\":[],\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"deposit_money_society\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true},\"Apprentie\":[],\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"change_salary_grade\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Changer le salaire d\'un grade\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"withdraw_money_society\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"recruit_player\":{\"Manager \":true,\"Employer expert\":false,\"Responsable\":true,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Recruté un joueur\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"weapons_chest_society\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Arme(s) du coffre de la société\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"promote_player\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":true,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Augmenter un employé\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"remove_weapon_chest\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Retirer une arme dans le coffre\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"manage_grades\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Gérer les grades de la société\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"delete_grade\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Supprimer un grade\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"rename_grade\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Changer le nom d\'un grade\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"change_number_grade\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"employer Confirmer\":false,\"label\":\"Changer le numéro d\'un grade\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"deposit_item_chest\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Déposer un item dans le coffre\",\"grades\":{\"boss\":true},\"Apprentie\":[],\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"withdraw_black_money_coffre\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"demote_player\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":true,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Virer un employé\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"chest\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Accéder au coffre de la société\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"unmote_player\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":true,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Descendre un employé\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"dposit_item_chest_society\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Déposer un item dans le coffre de la société\",\"grades\":{\"boss\":true},\"Apprentie\":[],\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"items_chest:society\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Item(s) du coffre de la société\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"editClothes\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":true,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"employer Confirmer\":false,\"label\":\"Gérer les tenues dans le vestiaire\",\"grades\":{\"boss\":true},\"Apprentie\":true,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":true,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":[]},\"weapons_chest\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Armes du coffre\",\"grades\":{\"boss\":true},\"Apprentie\":[],\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"remove_item_chest_society\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"manage_employeds\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":true,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"employer Confirmer\":false,\"label\":\"Gérer les employés de la société\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"remove_item_chest\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Retirer un item dans le coffre\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"rename_label_grade\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Changer le label d\'un grade\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"change_permissions_grade\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Changer les permissions d\'un grade\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"items_chest\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Items du coffre\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"create_grade\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Créer un grade\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"deposit_weapon_chest\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Déposer une arme dans le coffre\",\"grades\":{\"boss\":true},\"Apprentie\":[],\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"deposit_weapon_chest_society\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Déposer une arme dans le coffre de la société\",\"grades\":{\"boss\":true},\"Apprentie\":[],\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":[],\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"open_coffre\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"confirmer\":false,\"employer Confirmer\":false,\"label\":\"Ouvrir le coffre\",\"grades\":{\"boss\":true},\"Apprentie\":[],\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true},\"open_boss\":{\"Manager \":false,\"Employer expert\":false,\"Responsable\":false,\"Praktikant \":false,\"Manager\":false,\"Praktikant\":false,\"Employer Expert\":false,\"employer Confirmer\":false,\"label\":\"Ouvrir le menu boss\",\"grades\":{\"boss\":true},\"Apprentie\":false,\"employer confirmer\":false,\"✨ Employé expérimenté\":false,\"Expérimenter\":false,\"Stagiare\":false,\"Employer\":false,\"Employer \":false,\"boss\":true}}', '{\"y\":-204.45040893554688,\"x\":-870.6925659179688,\"z\":37.83721542358398}', '{\"y\":-203.1305389404297,\"x\":-868.6610107421875,\"z\":37.83723831176758}', '{\"color\":0,\"active\":true,\"sprite\":348,\"position\":{\"y\":-194.85923767089845,\"x\":-867.6478881835938,\"z\":37.83718872070312}}', '3', 1, '[{\"grades\":{\"boss\":\"boss\",\"Responsable\":\"Responsable\"},\"data\":{\"eyebrows_5\":0,\"watches_2\":0,\"skin_md_weight\":50,\"nose_3\":0,\"glasses_1\":0,\"age_1\":0,\"chest_1\":0,\"decals_1\":0,\"eyebrows_1\":0,\"cheeks_1\":0,\"mask_2\":0,\"neck_thickness\":0,\"moles_2\":0,\"bproof_2\":0,\"lip_thickness\":0,\"hair_color_2\":0,\"bracelets_2\":0,\"mom\":21,\"bproof_1\":0,\"hair_2\":0,\"eyebrows_3\":0,\"chain_1\":0,\"nose_1\":0,\"cheeks_2\":0,\"face_md_weight\":50,\"nose_4\":0,\"makeup_1\":0,\"shoes_1\":10,\"glasses_2\":0,\"nose_6\":0,\"torso_2\":0,\"complexion_2\":0,\"jaw_2\":0,\"chest_3\":0,\"chin_1\":0,\"hair_color_1\":0,\"lipstick_4\":0,\"lipstick_2\":0,\"sex\":0,\"eye_color\":0,\"eyebrows_6\":0,\"beard_3\":0,\"watches_1\":-1,\"bags_1\":0,\"helmet_2\":0,\"lipstick_1\":0,\"decals_2\":0,\"ears_2\":-1,\"chain_2\":0,\"chin_2\":0,\"complexion_1\":0,\"nose_5\":0,\"makeup_4\":0,\"tshirt_2\":0,\"arms\":1,\"jaw_1\":0,\"bodyb_2\":0,\"mask_1\":0,\"tshirt_1\":150,\"torso_1\":31,\"nose_2\":0,\"blush_2\":0,\"helmet_1\":-1,\"beard_4\":0,\"eyebrows_4\":0,\"sun_1\":0,\"moles_1\":0,\"sun_2\":0,\"hair_1\":0,\"ears_1\":-1,\"shoes_2\":0,\"lipstick_3\":0,\"arms_2\":0,\"chin_4\":0,\"eye_squint\":0,\"dad\":0,\"makeup_3\":0,\"beard_1\":0,\"makeup_2\":0,\"bodyb_1\":-1,\"eyebrows_2\":0,\"blemishes_2\":0,\"chin_3\":0,\"chest_2\":0,\"pants_2\":0,\"beard_2\":0,\"blush_1\":0,\"blush_3\":0,\"bags_2\":0,\"bodyb_3\":-1,\"bracelets_1\":-1,\"pants_1\":24,\"bodyb_4\":0,\"age_2\":0,\"blemishes_1\":0,\"cheeks_3\":0},\"name\":\"Directeur | Responsable\",\"grade\":true},{\"grades\":{\"Praktikant\":\"Praktikant\",\"Employé+\":\"Employé+\"},\"data\":{\"eyebrows_5\":0,\"watches_2\":0,\"skin_md_weight\":50,\"nose_3\":0,\"glasses_1\":0,\"age_1\":0,\"chest_1\":0,\"decals_1\":0,\"eyebrows_1\":0,\"cheeks_1\":0,\"mask_2\":0,\"neck_thickness\":0,\"moles_2\":0,\"bproof_2\":0,\"lip_thickness\":0,\"hair_color_2\":0,\"bracelets_2\":0,\"mom\":21,\"bproof_1\":0,\"hair_2\":0,\"eyebrows_3\":0,\"chain_1\":0,\"nose_1\":0,\"cheeks_2\":0,\"face_md_weight\":50,\"nose_4\":0,\"makeup_1\":0,\"shoes_1\":10,\"glasses_2\":0,\"nose_6\":0,\"torso_2\":0,\"complexion_2\":0,\"jaw_2\":0,\"chest_3\":0,\"chin_1\":0,\"hair_color_1\":0,\"lipstick_4\":0,\"lipstick_2\":0,\"sex\":0,\"eye_color\":0,\"eyebrows_6\":0,\"beard_3\":0,\"watches_1\":-1,\"bags_1\":0,\"helmet_2\":0,\"lipstick_1\":0,\"decals_2\":0,\"ears_2\":-1,\"chain_2\":0,\"chin_2\":0,\"complexion_1\":0,\"nose_5\":0,\"makeup_4\":0,\"tshirt_2\":0,\"arms\":1,\"jaw_1\":0,\"bodyb_2\":0,\"mask_1\":0,\"tshirt_1\":21,\"torso_1\":31,\"nose_2\":0,\"blush_2\":0,\"helmet_1\":-1,\"beard_4\":0,\"eyebrows_4\":0,\"sun_1\":0,\"moles_1\":0,\"sun_2\":0,\"hair_1\":0,\"ears_1\":-1,\"shoes_2\":0,\"lipstick_3\":0,\"arms_2\":0,\"chin_4\":0,\"eye_squint\":0,\"dad\":0,\"makeup_3\":0,\"beard_1\":0,\"makeup_2\":0,\"bodyb_1\":-1,\"eyebrows_2\":0,\"blemishes_2\":0,\"chin_3\":0,\"chest_2\":0,\"pants_2\":0,\"beard_2\":0,\"blush_1\":0,\"blush_3\":0,\"bags_2\":0,\"bodyb_3\":-1,\"bracelets_1\":-1,\"pants_1\":24,\"bodyb_4\":0,\"age_2\":0,\"blemishes_1\":0,\"cheeks_3\":0},\"name\":\"Employé | Praktikant\",\"grade\":true}]', '{\"y\":-197.7801513671875,\"x\":-875.474609375,\"z\":37.83722305297851}');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(30, 'saspnn', 'BCSO', '{\"items_boss\":[],\"weapons\":[],\"items\":[],\"accounts\":{\"society\":1000,\"cash\":0,\"black_money\":0},\"weapons_boss\":[]}', '{\"manage_employeds\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Gérer les employés de la société\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"open_boss\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":false,\"sergent1\":[],\"sergent2\":false,\"officierprincipal \":[],\"label\":\"Ouvrir le menu boss\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"remove_weapon_chest\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Retirer une arme dans le coffre\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"change_permissions_grade\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Changer les permissions d\'un grade\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"rename_label_grade\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Changer le label d\'un grade\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"delete_grade\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Supprimer un grade\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"remove_item_chest\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Retirer un item dans le coffre\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"chest\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":[],\"label\":\"Accéder au coffre de la société\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":[]},\"withdraw_cash_coffre\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"promote_player\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":[],\"label\":\"Augmenter un employé\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"dposit_item_chest_society\":{\"officier3\":[],\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":false,\"sergent1\":[],\"sergent2\":[],\"officierprincipal \":[],\"label\":\"Déposer un item dans le coffre de la société\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":[]},\"open_coffre\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":false,\"sergent1\":[],\"sergent2\":[],\"officierprincipal \":[],\"label\":\"Ouvrir le coffre\",\"grades\":{\"boss\":true},\"capitaine\":[],\"boss\":true,\"officier1\":[]},\"deposit_black_money_coffre\":{\"officier3\":false,\"officier2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":false,\"sergent1\":[],\"sergent2\":[],\"officierprincipal \":[],\"label\":\"Déposer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":[]},\"remove_weapon_chest_society\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"weapons_chest_society\":{\"officier3\":[],\"officier2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":false,\"sergent1\":true,\"sergent2\":true,\"officierprincipal \":[],\"label\":\"Arme(s) du coffre de la société\",\"grades\":{\"boss\":true},\"capitaine\":[],\"boss\":true,\"officier1\":[]},\"deposit_item_chest\":{\"officier3\":false,\"officier2\":true,\"Under Sheriff\":true,\"lieutenant\":true,\"cadet\":false,\"sergent1\":true,\"sergent2\":[],\"officierprincipal \":[],\"label\":\"Déposer un item dans le coffre\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":[]},\"withdraw_black_money_coffre\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":[],\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"deposit_weapon_chest\":{\"officier3\":[],\"officier2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":[],\"sergent1\":[],\"sergent2\":[],\"officierprincipal \":true,\"label\":\"Déposer une arme dans le coffre\",\"grades\":{\"boss\":true},\"capitaine\":[],\"boss\":true,\"officier1\":[]},\"recruit_player\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Recruté un joueur\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"change_salary_grade\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Changer le salaire d\'un grade\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"editClothes\":{\"grades\":{\"boss\":true},\"label\":\"Gérer les tenues dans le vestiaire\",\"capitaine\":[],\"cadet\":false,\"Under Sheriff\":true},\"unmote_player\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Descendre un employé\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"manage_grades\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":[],\"officierprincipal \":false,\"label\":\"Gérer les grades de la société\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"deposit_weapon_chest_society\":{\"officier3\":[],\"officier2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":false,\"sergent1\":[],\"sergent2\":[],\"officierprincipal \":[],\"label\":\"Déposer une arme dans le coffre de la société\",\"grades\":{\"boss\":true},\"capitaine\":[],\"boss\":true,\"officier1\":[]},\"create_grade\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Créer un grade\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"items_chest:society\":{\"officier3\":[],\"officier2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":false,\"sergent1\":[],\"sergent2\":[],\"officierprincipal \":[],\"label\":\"Item(s) du coffre de la société\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":[]},\"deposit_money_society\":{\"officier3\":[],\"officier2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":false,\"sergent1\":[],\"sergent2\":[],\"officierprincipal \":[],\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true},\"capitaine\":[],\"boss\":true,\"officier1\":[]},\"change_number_grade\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Changer le numéro d\'un grade\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"deposit_cash_coffre\":{\"officier3\":[],\"officier2\":true,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":[],\"label\":\"Déposer de l\'argent dans le coffre\",\"grades\":{\"boss\":true},\"capitaine\":[],\"boss\":true,\"officier1\":[]},\"items_chest\":{\"officier3\":[],\"officier2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":[],\"sergent1\":[],\"sergent2\":[],\"officierprincipal \":true,\"label\":\"Items du coffre\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":[]},\"remove_item_chest_society\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Retirer un item dans le coffre de la société\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"withdraw_money_society\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"weapons_chest\":{\"officier3\":[],\"officier2\":true,\"Under Sheriff\":true,\"lieutenant\":[],\"cadet\":false,\"sergent1\":[],\"sergent2\":[],\"officierprincipal \":[],\"label\":\"Armes du coffre\",\"grades\":{\"boss\":true},\"capitaine\":[],\"boss\":true,\"officier1\":[]},\"rename_grade\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Changer le nom d\'un grade\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false},\"demote_player\":{\"officier3\":false,\"officier2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"cadet\":false,\"sergent1\":false,\"sergent2\":false,\"officierprincipal \":false,\"label\":\"Virer un employé\",\"grades\":{\"boss\":true},\"capitaine\":true,\"boss\":true,\"officier1\":false}}', '{\"x\":-437.8479614257813,\"y\":6011.97412109375,\"z\":27.58152770996093}', '{\"x\":-432.8706970214844,\"y\":6006.29931640625,\"z\":36.99566268920898}', '{\"color\":6,\"position\":{\"x\":-432.8706970214844,\"y\":6006.29931640625,\"z\":36.99566268920898},\"sprite\":60,\"active\":true}', '0', 1, '[{\"name\":\"unefined\",\"grades\":[],\"grade\":false,\"data\":{\"bracelets_2\":0,\"neck_thickness\":0,\"blemishes_1\":0,\"mask_1\":223,\"hair_color_1\":60,\"nose_1\":0,\"mask_2\":0,\"complexion_2\":0,\"tshirt_2\":2,\"hair_2\":0,\"chest_3\":0,\"nose_2\":0,\"beard_1\":16,\"bproof_1\":0,\"glasses_1\":56,\"lipstick_1\":0,\"lip_thickness\":0,\"watches_1\":21,\"lipstick_3\":0,\"dad\":37,\"chin_2\":0,\"bodyb_3\":-1,\"shoes_2\":0,\"mom\":21,\"eyebrows_6\":0,\"eyebrows_5\":0,\"complexion_1\":0,\"chin_4\":0,\"beard_2\":10,\"bags_1\":125,\"blemishes_2\":0,\"eyebrows_2\":0,\"face_md_weight\":50,\"face_color\":0,\"decals_1\":0,\"torso_2\":0,\"chin_1\":0,\"nose_3\":0,\"decals_2\":0,\"arms\":1,\"pants_2\":2,\"beard_3\":0,\"sun_2\":0,\"eyebrows_1\":0,\"tshirt_1\":81,\"sex\":0,\"bproof_2\":0,\"chain_2\":2,\"eyebrows_4\":0,\"cheeks_2\":0,\"hair_color_2\":0,\"ears_2\":0,\"chain_1\":278,\"eye_squint\":0,\"makeup_2\":0,\"sun_1\":0,\"helmet_2\":3,\"torso_1\":783,\"bags_2\":0,\"moles_1\":0,\"helmet_1\":113,\"pants_1\":327,\"skin_md_weight\":50,\"makeup_4\":0,\"hair_1\":73,\"nose_4\":0,\"watches_2\":0,\"moles_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"chest_1\":0,\"jaw_1\":0,\"chest_2\":0,\"blush_3\":0,\"nose_6\":0,\"ears_1\":-1,\"bodyb_1\":-1,\"shoes_1\":54,\"lipstick_4\":0,\"blush_2\":0,\"bracelets_1\":3,\"bodyb_2\":0,\"glasses_2\":0,\"beard_4\":0,\"blush_1\":0,\"nose_5\":0,\"eye_color\":0,\"makeup_3\":0,\"makeup_1\":0,\"chin_3\":0,\"age_1\":0,\"bodyb_4\":0,\"arms_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"jaw_2\":0,\"lipstick_2\":0}}]', '{\"x\":-439.0482177734375,\"y\":6011.17041015625,\"z\":36.99565887451172}'),
(32, 'police', 'LSPD', '{\"accounts\":{\"society\":11180325,\"black_money\":53444,\"cash\":0},\"weapons_boss\":[],\"weapons\":{\"WEAPON_COMBATPISTOL8\":{\"label\":\"Pistolet de combat\",\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":255,\"number\":8},\"WEAPON_COMBATPISTOLPOL3\":{\"label\":\"Pistolet de combat\",\"name\":\"WEAPON_COMBATPISTOLPOL\",\"ammo\":255,\"number\":3},\"WEAPON_PISTOL6\":{\"label\":\"Pistolet\",\"name\":\"WEAPON_PISTOL\",\"ammo\":255,\"number\":6},\"WEAPON_COMBATPISTOL7\":{\"label\":\"Pistolet de combat\",\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":255,\"number\":7},\"WEAPON_PISTOL5\":{\"label\":\"Pistolet\",\"name\":\"WEAPON_PISTOL\",\"ammo\":255,\"number\":5},\"WEAPON_FLASHLIGHT10\":{\"label\":\"Lampe torche\",\"name\":\"WEAPON_FLASHLIGHT\",\"ammo\":255,\"number\":10},\"WEAPON_NIGHTSTICK8\":{\"label\":\"Matraque\",\"name\":\"WEAPON_NIGHTSTICK\",\"ammo\":255,\"number\":8}},\"items_boss\":{\"rifle_ammo\":{\"count\":450,\"label\":\"Munitions pour fusil\",\"name\":\"rifle_ammo\"},\"smg_ammo\":{\"count\":450,\"label\":\"Munitions pour mitraillette\",\"name\":\"smg_ammo\"},\"pistol_ammo\":{\"count\":490,\"label\":\"Munitions pour pistolet\",\"name\":\"pistol_ammo\"},\"ball_ammo\":{\"count\":450,\"label\":\"Munitions pour balles\",\"name\":\"ball_ammo\"},\"mg_ammo\":{\"count\":500,\"label\":\"Munitions pour mitrailleuse\",\"name\":\"mg_ammo\"},\"burgershot_coca\":{\"count\":59,\"label\":\"Coca Cola\",\"name\":\"burgershot_coca\"},\"burgershot_burger\":{\"count\":54,\"label\":\"Burger\",\"name\":\"burgershot_burger\"},\"shotgun_ammo\":{\"count\":500,\"label\":\"Munitions pour fusil à pompe\",\"name\":\"shotgun_ammo\"}},\"items\":{\"kq_meth_low\":{\"count\":12,\"label\":\"Méthamphétamine (Qualité basse)\",\"name\":\"kq_meth_low\"},\"cokepure\":{\"count\":18,\"label\":\"Cocaïne pure\",\"name\":\"cokepure\"},\"coca_blend\":{\"count\":1,\"label\":\"Mélange de coca\",\"name\":\"coca_blend\"},\"crochetage_kit\":{\"count\":1,\"label\":\"Kit de Crochetage\",\"name\":\"crochetage_kit\"}}}', '{\"manage_employeds\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":true,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Gérer les employés de la société\",\"officierprincipal \":false,\"sergent1\":false},\"dposit_item_chest_society\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Déposer un item dans le coffre de la société\",\"officierprincipal \":false,\"sergent1\":false},\"change_permissions_grade\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":false,\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Changer les permissions d\'un grade\",\"officierprincipal \":false,\"sergent1\":false},\"manage_grades\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":false,\"cadet\":true,\"sergent2\":true,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Gérer les grades de la société\",\"officierprincipal \":false,\"sergent1\":false},\"deposit_item_chest\":{\"officier2\":true,\"lieutenant\":[],\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":[],\"crm\":true,\"officier1\":true,\"grades\":{\"boss\":true},\"officier3\":true,\"swat\":true,\"label\":\"Déposer un item dans le coffre\",\"officierprincipal \":[],\"sergent1\":[]},\"deposit_weapon_chest\":{\"officier2\":true,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":[],\"sergent2\":[],\"crm\":true,\"officier1\":true,\"grades\":{\"boss\":true},\"officier3\":true,\"swat\":true,\"label\":\"Déposer une arme dans le coffre\",\"officierprincipal \":[],\"sergent1\":[]},\"withdraw_money_society\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"officierprincipal \":false,\"sergent1\":false},\"deposit_money_society\":{\"officier2\":false,\"lieutenant\":[],\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":true,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"officierprincipal \":false,\"sergent1\":true},\"items_chest\":{\"officier2\":true,\"lieutenant\":[],\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":[],\"crm\":false,\"officier1\":true,\"grades\":{\"boss\":true},\"officier3\":true,\"swat\":true,\"label\":\"Items du coffre\",\"officierprincipal \":[],\"sergent1\":[]},\"rename_label_grade\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":false,\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Changer le label d\'un grade\",\"officierprincipal \":false,\"sergent1\":false},\"unmote_player\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":true,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Descendre un employé\",\"officierprincipal \":false,\"sergent1\":false},\"remove_weapon_chest_society\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Retirer une arme dans la coffre de la société\",\"officierprincipal \":false,\"sergent1\":false},\"remove_item_chest\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":[],\"crm\":true,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":true,\"swat\":true,\"label\":\"Retirer un item dans le coffre\",\"officierprincipal \":[],\"sergent1\":[]},\"weapons_chest_society\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":[],\"swat\":true,\"label\":\"Arme(s) du coffre de la société\",\"officierprincipal \":false,\"sergent1\":false},\"items_chest:society\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Item(s) du coffre de la société\",\"officierprincipal \":false,\"sergent1\":false},\"chest\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":true,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Accéder au coffre de la société\",\"officierprincipal \":false,\"sergent1\":[]},\"create_grade\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":true,\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Créer un grade\",\"officierprincipal \":false,\"sergent1\":false},\"remove_weapon_chest\":{\"officier2\":true,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":[],\"crm\":true,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":true,\"swat\":true,\"label\":\"Retirer une arme dans le coffre\",\"officierprincipal \":[],\"sergent1\":[]},\"demote_player\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":true,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Virer un employé\",\"officierprincipal \":false,\"sergent1\":false},\"open_boss\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":true,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Ouvrir le menu boss\",\"officierprincipal \":false,\"sergent1\":false},\"withdraw_black_money_coffre\":{\"officier2\":false,\"lieutenant\":[],\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":[],\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":true,\"swat\":true,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"officierprincipal \":[],\"sergent1\":[]},\"deposit_weapon_chest_society\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Déposer une arme dans le coffre de la société\",\"officierprincipal \":false,\"sergent1\":false},\"withdraw_cash_coffre\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":[],\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Retirer de l\'argent dans le coffre\",\"officierprincipal \":[],\"sergent1\":true},\"editClothes\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Gérer les tenues dans le vestiaire\",\"officierprincipal \":false,\"sergent1\":false},\"deposit_cash_coffre\":{\"officier2\":true,\"lieutenant\":[],\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":[],\"crm\":true,\"officier1\":[],\"grades\":{\"boss\":true},\"officier3\":[],\"swat\":true,\"label\":\"Déposer de l\'argent dans le coffre\",\"officierprincipal \":[],\"sergent1\":[]},\"remove_item_chest_society\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Retirer un item dans le coffre de la société\",\"officierprincipal \":false,\"sergent1\":false},\"weapons_chest\":{\"officier2\":true,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":[],\"sergent2\":[],\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":true,\"swat\":true,\"label\":\"Armes du coffre\",\"officierprincipal \":true,\"sergent1\":[]},\"change_salary_grade\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Changer le salaire d\'un grade\",\"officierprincipal \":false,\"sergent1\":false},\"deposit_black_money_coffre\":{\"officier2\":true,\"lieutenant\":[],\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":[],\"crm\":true,\"officier1\":true,\"grades\":{\"boss\":true},\"officier3\":true,\"swat\":true,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"officierprincipal \":[],\"sergent1\":[]},\"rename_grade\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":false,\"cadet\":true,\"sergent2\":true,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Changer le nom d\'un grade\",\"officierprincipal \":false,\"sergent1\":false},\"open_coffre\":{\"officier2\":true,\"lieutenant\":[],\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":[],\"crm\":true,\"officier1\":true,\"grades\":{\"boss\":true},\"officier3\":true,\"swat\":true,\"label\":\"Ouvrir le coffre\",\"officierprincipal \":[],\"sergent1\":[]},\"change_number_grade\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":false,\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Changer le numéro d\'un grade\",\"officierprincipal \":false,\"sergent1\":false},\"promote_player\":{\"officier2\":false,\"lieutenant\":[],\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":true,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":true,\"swat\":true,\"label\":\"Augmenter un employé\",\"officierprincipal \":false,\"sergent1\":false},\"recruit_player\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":[],\"cadet\":true,\"sergent2\":[],\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Recruté un joueur\",\"officierprincipal \":true,\"sergent1\":[]},\"delete_grade\":{\"officier2\":false,\"lieutenant\":false,\"Chief \":true,\"boss\":true,\"capitaine\":true,\"cadet\":true,\"sergent2\":false,\"crm\":false,\"officier1\":false,\"grades\":{\"boss\":true},\"officier3\":false,\"swat\":true,\"label\":\"Supprimer un grade\",\"officierprincipal \":false,\"sergent1\":false}}', '{\"x\":-1090.831298828125,\"z\":23.12088394165039,\"y\":-834.9634399414063}', '{\"x\":-1072.383544921875,\"z\":23.15277099609375,\"y\":-806.2178344726563}', '{\"active\":true,\"position\":{\"x\":-1111.691650390625,\"z\":19.31609344482422,\"y\":-825.0560302734375},\"sprite\":60,\"color\":67}', '10000', 1, '[{\"grades\":[],\"name\":\"LSPD FEMME\",\"data\":{\"helmet_1\":-1,\"hair_1\":510,\"nose_2\":0,\"decals_1\":0,\"pants_1\":346,\"makeup_1\":0,\"bodyb_3\":-1,\"lipstick_3\":0,\"tshirt_2\":0,\"nose_5\":0,\"eyebrows_2\":9,\"glasses_1\":79,\"hair_color_2\":0,\"eye_color\":19,\"eyebrows_5\":0,\"bproof_2\":0,\"lip_thickness\":0,\"face_md_weight\":50,\"cheeks_3\":0,\"cheeks_2\":0,\"blemishes_1\":0,\"pants_2\":0,\"jaw_1\":0,\"arms\":9,\"blush_1\":0,\"torso_1\":626,\"chest_2\":0,\"bodyb_1\":-1,\"blush_3\":0,\"cheeks_1\":0,\"mom\":41,\"glasses_2\":0,\"mask_2\":0,\"mask_1\":0,\"eyebrows_3\":3,\"beard_3\":0,\"helmet_2\":0,\"complexion_2\":0,\"age_1\":0,\"watches_2\":0,\"bags_1\":0,\"makeup_2\":0,\"tshirt_1\":6,\"chin_4\":0,\"bracelets_1\":0,\"chain_1\":0,\"bodyb_4\":0,\"bags_2\":0,\"blemishes_2\":0,\"lipstick_4\":0,\"makeup_4\":0,\"eyebrows_6\":0,\"eyebrows_4\":0,\"decals_2\":0,\"complexion_1\":0,\"chest_3\":0,\"jaw_2\":0,\"eyebrows_1\":1,\"shoes_1\":202,\"sex\":1,\"moles_2\":0,\"nose_1\":0,\"chain_2\":0,\"chin_2\":0,\"neck_thickness\":0,\"hair_2\":0,\"lipstick_1\":0,\"nose_4\":0,\"makeup_3\":0,\"bproof_1\":184,\"chest_1\":0,\"chin_3\":0,\"eye_squint\":0,\"sun_1\":0,\"beard_2\":0,\"age_2\":0,\"chin_1\":0,\"nose_6\":0,\"moles_1\":0,\"watches_1\":-1,\"nose_3\":0,\"sun_2\":0,\"bracelets_2\":0,\"ears_1\":-1,\"blush_2\":0,\"lipstick_2\":0,\"shoes_2\":0,\"ears_2\":0,\"bodyb_2\":0,\"arms_2\":0,\"dad\":26,\"beard_4\":0,\"skin_md_weight\":50,\"hair_color_1\":0,\"beard_1\":0,\"torso_2\":0},\"grade\":false},{\"grades\":[],\"name\":\"SASP\",\"data\":{\"torso_2\":2,\"hair_1\":0,\"nose_2\":0,\"hair_color_1\":0,\"pants_1\":49,\"makeup_1\":0,\"bodyb_3\":-1,\"lipstick_3\":0,\"eyebrows_1\":0,\"nose_5\":0,\"eyebrows_2\":0,\"glasses_1\":58,\"hair_color_2\":0,\"eye_color\":0,\"eyebrows_5\":0,\"bproof_2\":0,\"lip_thickness\":0,\"face_md_weight\":0,\"cheeks_3\":0,\"chain_2\":0,\"blemishes_1\":0,\"pants_2\":0,\"jaw_1\":0,\"arms\":12,\"blush_1\":0,\"torso_1\":193,\"chest_2\":0,\"bodyb_1\":-1,\"blush_3\":0,\"cheeks_1\":0,\"mom\":24,\"glasses_2\":0,\"mask_2\":0,\"mask_1\":274,\"nose_6\":0,\"beard_3\":0,\"helmet_2\":0,\"complexion_2\":0,\"chest_1\":0,\"watches_2\":0,\"bags_1\":33,\"makeup_2\":0,\"tshirt_1\":292,\"chin_4\":0,\"bracelets_1\":-1,\"chain_1\":233,\"complexion_1\":0,\"bags_2\":0,\"blemishes_2\":0,\"lipstick_4\":0,\"makeup_4\":0,\"lipstick_2\":0,\"nose_4\":0,\"decals_2\":5,\"sex\":0,\"age_2\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_1\":61,\"jaw_2\":0,\"moles_2\":0,\"nose_1\":0,\"bproof_1\":62,\"cheeks_2\":0,\"nose_3\":0,\"hair_2\":0,\"chest_3\":0,\"ears_2\":0,\"makeup_3\":0,\"arms_2\":0,\"age_1\":0,\"shoes_2\":0,\"eye_squint\":0,\"sun_1\":0,\"beard_2\":0,\"neck_thickness\":0,\"decals_1\":0,\"chin_3\":0,\"eyebrows_3\":0,\"watches_1\":-1,\"eyebrows_4\":0,\"sun_2\":0,\"bracelets_2\":0,\"ears_1\":-1,\"blush_2\":0,\"eyebrows_6\":0,\"chin_2\":0,\"tshirt_2\":0,\"bodyb_2\":0,\"helmet_1\":-1,\"dad\":3,\"chin_1\":0,\"skin_md_weight\":0,\"moles_1\":0,\"beard_1\":0,\"bodyb_4\":0},\"grade\":false}]', '{\"x\":-1086.743408203125,\"z\":23.15271377563476,\"y\":-814.5414428710938}');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(33, 'gouvernement', 'Gouvernement', '{\"weapons_boss\":[],\"items_boss\":[],\"items\":[],\"accounts\":{\"black_money\":0,\"cash\":0,\"society\":519.5492924946884},\"weapons\":[]}', '{\"editClothes\":{\"Ministre de la Justice\":[],\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":true,\"juge\":true,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":true,\"Ministre de l\'Economie\":[],\"label\":\"Gérer les tenues dans le vestiaire\",\"Secrétaire d\'Etat\":[],\"Secretaire Défense\":[],\"garde\":false,\"Avocat\":false},\"demote_player\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Virer un employé\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"open_coffre\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Ouvrir le coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":true,\"Avocat\":false},\"rename_label_grade\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Changer le label d\'un grade\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"remove_weapon_chest\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":true,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Retirer une arme dans le coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"manage_grades\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Gérer les grades de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"change_salary_grade\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Changer le salaire d\'un grade\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"remove_item_chest\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":true,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Retirer un item dans le coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"remove_item_chest_society\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"deposit_money_society\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"items_chest:society\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Item(s) du coffre de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"promote_player\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Augmenter un employé\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"withdraw_black_money_coffre\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"weapons_chest_society\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Arme(s) du coffre de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"items_chest\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":true,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Items du coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":true,\"Avocat\":false},\"open_boss\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Ouvrir le menu boss\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"remove_weapon_chest_society\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"unmote_player\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Descendre un employé\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"rename_grade\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Changer le nom d\'un grade\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"deposit_black_money_coffre\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":true,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":true,\"Avocat\":false},\"delete_grade\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Supprimer un grade\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"weapons_chest\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":true,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Armes du coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":true,\"Avocat\":false},\"withdraw_money_society\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"deposit_cash_coffre\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":true,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Déposer de l\'argent dans le coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":true,\"Avocat\":false},\"withdraw_cash_coffre\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":true,\"Avocat\":false},\"dposit_item_chest_society\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Déposer un item dans le coffre de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"deposit_item_chest\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":true,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Déposer un item dans le coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":true,\"Avocat\":false},\"chest\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Accéder au coffre de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"change_number_grade\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Changer le numéro d\'un grade\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"create_grade\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Créer un grade\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"deposit_weapon_chest_society\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":true,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Déposer une arme dans le coffre de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"recruit_player\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Recruté un joueur\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"change_permissions_grade\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Changer les permissions d\'un grade\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"deposit_weapon_chest\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":true,\"chefsecu\":true,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Déposer une arme dans le coffre\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false},\"manage_employeds\":{\"Ministre de la Justice\":false,\"Vice Gouverneur\":true,\"Chef S\'écurité\":true,\"procureur\":false,\"juge\":false,\"grades\":{\"boss\":true},\"boss\":true,\"Premier Ministre\":false,\"chefsecu\":false,\"test\":false,\"president\":true,\"Secretaire au Logement\":false,\"Ministre de l\'Economie\":false,\"label\":\"Gérer les employés de la société\",\"Secrétaire d\'Etat\":false,\"Secretaire Défense\":false,\"garde\":false,\"Avocat\":false}}', '{\"x\":-565.3583984375,\"y\":-193.72940063476563,\"z\":38.21800994873047}', '{\"x\":-568.2265014648438,\"y\":-193.75869750976566,\"z\":38.21842193603515}', '{\"position\":{\"x\":-545.161743,\"y\":-204.668915,\"z\":38.214741},\"sprite\":419,\"active\":true,\"color\":0}', '0', 1, '[{\"name\":\"Premier Ministre\",\"grades\":{\"Premier Ministre\":\"Premier Ministre\"},\"grade\":true,\"data\":{\"complexion_2\":1,\"lipstick_4\":0,\"mask_2\":0,\"chin_3\":0,\"ears_2\":-1,\"blemishes_1\":1,\"blush_2\":3,\"bodyb_2\":0,\"neck_thickness\":10,\"torso_2\":1,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":5,\"cheeks_1\":10,\"moles_2\":7.0,\"glasses_1\":35,\"complexion_1\":5,\"bracelets_1\":1,\"lipstick_1\":-1,\"jaw_2\":-1,\"nose_2\":5,\"eyebrows_5\":6,\"beard_3\":0,\"hair_color_2\":0,\"bodyb_3\":-1,\"eyebrows_3\":41,\"tshirt_2\":0,\"watches_2\":-1,\"chin_1\":0,\"torso_1\":40,\"chest_3\":0,\"cheeks_2\":0,\"arms_2\":0,\"pants_2\":11,\"bodyb_1\":-1,\"moles_1\":6,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_2\":0,\"pants_1\":105,\"chain_2\":0,\"bags_1\":0,\"nose_6\":0,\"hair_color_1\":55,\"bracelets_2\":0,\"dad\":15,\"makeup_2\":0,\"helmet_2\":0,\"mask_1\":254,\"mom\":44,\"chin_4\":0,\"lip_thickness\":5,\"helmet_1\":8,\"sun_1\":1,\"glasses_2\":0,\"eye_squint\":5,\"eye_color\":0,\"makeup_3\":0,\"nose_3\":0,\"nose_5\":0,\"beard_1\":3,\"eyebrows_4\":0,\"beard_4\":0,\"hair_1\":111,\"bproof_1\":0,\"beard_2\":3,\"eyebrows_1\":2,\"age_1\":0,\"face_md_weight\":10,\"decals_1\":191,\"jaw_1\":10,\"sun_2\":1,\"nose_1\":5,\"tshirt_1\":158,\"shoes_2\":7,\"blush_3\":0,\"bodyb_4\":5,\"nose_4\":6,\"arms\":6,\"blush_1\":-1,\"shoes_1\":20,\"chain_1\":25,\"eyebrows_2\":4,\"lipstick_2\":10.0,\"bproof_2\":0,\"blemishes_2\":1,\"chest_2\":0,\"age_2\":10.0,\"makeup_4\":10,\"eyebrows_6\":0,\"skin_md_weight\":3,\"watches_1\":11,\"chest_1\":0,\"lipstick_3\":37,\"sex\":0}},{\"name\":\"Securité\",\"grades\":[],\"grade\":false,\"data\":{\"complexion_2\":1,\"lipstick_4\":0,\"chin_4\":0,\"chin_3\":0,\"ears_2\":-1,\"mom\":44,\"blush_2\":3,\"bodyb_2\":0,\"neck_thickness\":10,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":5,\"cheeks_1\":10,\"moles_2\":7.0,\"glasses_1\":47,\"complexion_1\":5,\"bracelets_1\":1,\"lipstick_1\":-1,\"jaw_2\":-1,\"nose_2\":5,\"eyebrows_5\":6,\"beard_3\":0,\"mask_2\":0,\"bodyb_3\":-1,\"hair_color_1\":55,\"lipstick_2\":10.0,\"watches_2\":-1,\"chin_1\":0,\"hair_1\":104,\"chest_3\":0,\"makeup_4\":10,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":6,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_2\":0,\"cheeks_2\":0,\"helmet_2\":-1,\"bags_1\":138,\"nose_6\":0,\"dad\":15,\"bracelets_2\":0,\"mask_1\":254,\"makeup_2\":0,\"blemishes_1\":1,\"torso_1\":835,\"eyebrows_2\":4,\"helmet_1\":0,\"lip_thickness\":5,\"hair_color_2\":0,\"eyebrows_3\":41,\"glasses_2\":0,\"eye_squint\":5,\"nose_5\":0,\"makeup_3\":0,\"nose_3\":0,\"eyebrows_4\":0,\"beard_1\":3,\"bodyb_4\":5,\"beard_4\":0,\"decals_1\":0,\"bproof_1\":66,\"beard_2\":3,\"eyebrows_1\":2,\"age_1\":0,\"eye_color\":0,\"shoes_2\":0,\"jaw_1\":10,\"sun_2\":1,\"nose_1\":5,\"tshirt_1\":266,\"pants_1\":304,\"blush_3\":0,\"eyebrows_6\":0,\"nose_4\":6,\"arms\":96,\"blush_1\":-1,\"shoes_1\":259,\"chain_1\":368,\"tshirt_2\":0,\"sun_1\":1,\"bproof_2\":0,\"blemishes_2\":1,\"chest_2\":0,\"age_2\":10.0,\"skin_md_weight\":3,\"face_md_weight\":10,\"chain_2\":0,\"watches_1\":11,\"chest_1\":0,\"lipstick_3\":37,\"sex\":0}},{\"name\":\"Chef de Sécurité\",\"grades\":{\"chefsecu\":\"chefsecu\"},\"grade\":true,\"data\":{\"complexion_2\":1,\"lipstick_4\":0,\"chin_4\":0,\"chin_3\":0,\"ears_2\":-1,\"mom\":44,\"blush_2\":3,\"bodyb_2\":0,\"neck_thickness\":10,\"torso_2\":3,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":5,\"cheeks_1\":10,\"moles_2\":7.0,\"glasses_1\":47,\"complexion_1\":5,\"bracelets_1\":1,\"lipstick_1\":-1,\"jaw_2\":-1,\"nose_2\":5,\"eyebrows_5\":6,\"beard_3\":0,\"mask_2\":0,\"bodyb_3\":-1,\"hair_color_1\":55,\"lipstick_2\":10.0,\"watches_2\":-1,\"chin_1\":0,\"hair_1\":104,\"chest_3\":0,\"makeup_4\":10,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":6,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_2\":0,\"cheeks_2\":0,\"helmet_2\":-1,\"bags_1\":138,\"nose_6\":0,\"dad\":15,\"bracelets_2\":0,\"mask_1\":254,\"makeup_2\":0,\"blemishes_1\":1,\"torso_1\":835,\"eyebrows_2\":4,\"helmet_1\":0,\"lip_thickness\":5,\"hair_color_2\":0,\"eyebrows_3\":41,\"glasses_2\":0,\"eye_squint\":5,\"nose_5\":0,\"makeup_3\":0,\"nose_3\":0,\"eyebrows_4\":0,\"beard_1\":3,\"bodyb_4\":5,\"beard_4\":0,\"decals_1\":0,\"bproof_1\":66,\"beard_2\":3,\"eyebrows_1\":2,\"age_1\":0,\"eye_color\":0,\"shoes_2\":0,\"jaw_1\":10,\"sun_2\":1,\"nose_1\":5,\"tshirt_1\":266,\"pants_1\":304,\"blush_3\":0,\"eyebrows_6\":0,\"nose_4\":6,\"arms\":96,\"blush_1\":-1,\"shoes_1\":259,\"chain_1\":368,\"tshirt_2\":0,\"sun_1\":1,\"bproof_2\":1,\"blemishes_2\":1,\"chest_2\":0,\"age_2\":10.0,\"skin_md_weight\":3,\"face_md_weight\":10,\"chain_2\":0,\"watches_1\":11,\"chest_1\":0,\"lipstick_3\":37,\"sex\":0}},{\"name\":\"Juge\",\"grades\":{\"Premier Ministre\":\"Premier Ministre\",\"juge\":\"juge\",\"procureur\":\"procureur\"},\"grade\":true,\"data\":{\"complexion_2\":1,\"lipstick_4\":0,\"mask_2\":0,\"chin_3\":0,\"ears_2\":0,\"blemishes_1\":1,\"blush_2\":3,\"bodyb_2\":0,\"neck_thickness\":10,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":5,\"cheeks_1\":10,\"moles_2\":7.0,\"glasses_1\":34,\"complexion_1\":5,\"bracelets_1\":1,\"lipstick_1\":-1,\"jaw_2\":-1,\"nose_2\":5,\"eyebrows_5\":6,\"beard_3\":0,\"glasses_2\":0,\"bodyb_3\":-1,\"mask_1\":254,\"tshirt_2\":0,\"watches_2\":-1,\"chin_1\":0,\"cheeks_2\":0,\"chest_3\":0,\"pants_1\":118,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":6,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":223,\"bags_2\":0,\"helmet_2\":0,\"torso_1\":817,\"bags_1\":0,\"nose_6\":0,\"dad\":15,\"bracelets_2\":0,\"hair_1\":104,\"makeup_2\":0,\"nose_5\":0,\"chin_4\":0,\"eyebrows_3\":41,\"helmet_1\":8,\"lip_thickness\":5,\"sun_1\":1,\"hair_color_2\":0,\"face_md_weight\":10,\"eye_squint\":5,\"chain_2\":0,\"makeup_3\":0,\"nose_3\":0,\"eyebrows_4\":0,\"beard_1\":3,\"mom\":44,\"beard_4\":0,\"eyebrows_6\":0,\"bproof_1\":0,\"beard_2\":3,\"eyebrows_1\":2,\"age_1\":0,\"decals_1\":0,\"eye_color\":0,\"jaw_1\":10,\"sun_2\":1,\"nose_1\":5,\"tshirt_1\":311,\"shoes_2\":3,\"blush_3\":0,\"bodyb_4\":5,\"nose_4\":6,\"arms\":4,\"blush_1\":-1,\"shoes_1\":20,\"chain_1\":26,\"makeup_4\":10,\"lipstick_2\":10.0,\"bproof_2\":0,\"blemishes_2\":1,\"chest_2\":0,\"age_2\":10.0,\"hair_color_1\":55,\"skin_md_weight\":3,\"eyebrows_2\":4,\"watches_1\":11,\"chest_1\":0,\"lipstick_3\":37,\"sex\":0}},{\"name\":\"Secrétaire de Défense\",\"grades\":{\"Secretaire Défense\":\"Secretaire Défense\",\"boss\":\"boss\",\"Vice Gouverneur\":\"Vice Gouverneur\"},\"grade\":true,\"data\":{\"complexion_2\":1,\"lipstick_4\":0,\"mask_2\":0,\"chin_3\":0,\"ears_2\":0,\"mom\":44,\"blush_2\":3,\"bodyb_2\":0,\"neck_thickness\":10,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":5,\"cheeks_1\":10,\"moles_2\":7.0,\"glasses_1\":47,\"complexion_1\":5,\"bracelets_1\":1,\"lipstick_1\":-1,\"jaw_2\":-1,\"nose_2\":5,\"eyebrows_5\":6,\"beard_3\":0,\"pants_1\":315,\"bodyb_3\":-1,\"shoes_2\":1,\"lipstick_2\":10.0,\"watches_2\":-1,\"chin_1\":0,\"torso_1\":838,\"chest_3\":0,\"hair_color_1\":55,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":6,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":223,\"bags_2\":0,\"helmet_2\":-1,\"mask_1\":254,\"bags_1\":138,\"nose_6\":0,\"dad\":15,\"bracelets_2\":0,\"tshirt_2\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"eyebrows_3\":41,\"makeup_4\":10,\"helmet_1\":8,\"lip_thickness\":5,\"chin_4\":0,\"hair_color_2\":0,\"glasses_2\":0,\"eye_squint\":5,\"sun_1\":1,\"makeup_3\":0,\"nose_3\":0,\"blemishes_1\":1,\"beard_1\":3,\"hair_1\":104,\"beard_4\":0,\"bodyb_4\":5,\"bproof_1\":73,\"beard_2\":3,\"eyebrows_1\":2,\"age_1\":0,\"decals_1\":165,\"eye_color\":0,\"jaw_1\":10,\"sun_2\":1,\"nose_1\":5,\"tshirt_1\":292,\"nose_5\":0,\"blush_3\":0,\"eyebrows_6\":0,\"nose_4\":6,\"arms\":180,\"blush_1\":-1,\"shoes_1\":61,\"chain_1\":368,\"eyebrows_2\":4,\"cheeks_2\":0,\"bproof_2\":0,\"blemishes_2\":1,\"chest_2\":0,\"age_2\":10.0,\"skin_md_weight\":3,\"face_md_weight\":10,\"chain_2\":0,\"watches_1\":11,\"chest_1\":0,\"lipstick_3\":37,\"sex\":0}},{\"name\":\"Gouverneur 1\",\"grades\":{\"boss\":\"boss\",\"Vice Gouverneur\":\"Vice Gouverneur\"},\"grade\":true,\"data\":{\"complexion_2\":0,\"lipstick_4\":0,\"chin_4\":0,\"chin_3\":0,\"ears_2\":0,\"blemishes_1\":0,\"blush_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"moles_2\":0,\"glasses_1\":5,\"complexion_1\":0,\"bracelets_1\":-1,\"lipstick_1\":0,\"jaw_2\":0,\"nose_2\":0,\"eyebrows_5\":0,\"beard_3\":29,\"hair_1\":91,\"bodyb_3\":-1,\"mask_2\":0,\"watches_2\":0,\"dad\":24,\"chin_1\":0,\"cheeks_2\":0,\"chest_3\":0,\"makeup_4\":0,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":0,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":0,\"bags_2\":0,\"sun_1\":0,\"torso_1\":4,\"bags_1\":0,\"nose_6\":0,\"eyebrows_6\":0,\"bracelets_2\":0,\"mask_1\":0,\"makeup_2\":0,\"glasses_2\":0,\"mom\":2,\"helmet_1\":-1,\"hair_color_2\":29,\"lip_thickness\":0,\"hair_color_1\":29,\"eyebrows_2\":10,\"skin_md_weight\":50,\"eye_squint\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"nose_3\":0,\"face_md_weight\":50,\"beard_1\":10,\"bodyb_4\":0,\"beard_4\":0,\"decals_1\":0,\"bproof_1\":0,\"beard_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"eye_color\":0,\"helmet_2\":0,\"jaw_1\":0,\"sun_2\":0,\"nose_1\":0,\"tshirt_1\":146,\"pants_1\":24,\"blush_3\":0,\"tshirt_2\":0,\"nose_4\":0,\"arms\":4,\"blush_1\":0,\"shoes_1\":104,\"chain_1\":333,\"eyebrows_3\":0,\"lipstick_2\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chest_2\":0,\"age_2\":0,\"shoes_2\":0,\"chain_2\":0,\"nose_5\":0,\"watches_1\":-1,\"chest_1\":0,\"lipstick_3\":0,\"sex\":0}},{\"name\":\"gouverneur 2\",\"grades\":{\"boss\":\"boss\",\"Vice Gouverneur\":\"Vice Gouverneur\"},\"grade\":true,\"data\":{\"complexion_2\":0,\"lipstick_4\":0,\"chin_4\":0,\"chin_3\":0,\"ears_2\":-1,\"blemishes_1\":0,\"blush_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"torso_2\":4,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"moles_2\":0,\"glasses_1\":5,\"complexion_1\":0,\"bracelets_1\":-1,\"lipstick_1\":0,\"jaw_2\":0,\"nose_2\":0,\"eyebrows_5\":0,\"beard_3\":29,\"hair_1\":91,\"bodyb_3\":-1,\"mask_2\":0,\"watches_2\":0,\"dad\":24,\"chin_1\":0,\"cheeks_2\":0,\"chest_3\":0,\"makeup_4\":0,\"arms_2\":0,\"pants_2\":5,\"bodyb_1\":-1,\"moles_1\":0,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_2\":0,\"sun_1\":0,\"torso_1\":120,\"bags_1\":0,\"nose_6\":0,\"eyebrows_6\":0,\"bracelets_2\":0,\"mask_1\":0,\"makeup_2\":0,\"glasses_2\":0,\"mom\":2,\"helmet_1\":8,\"hair_color_2\":29,\"lip_thickness\":0,\"hair_color_1\":29,\"eyebrows_2\":10,\"skin_md_weight\":50,\"eye_squint\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"nose_3\":0,\"face_md_weight\":50,\"beard_1\":10,\"bodyb_4\":0,\"beard_4\":0,\"decals_1\":0,\"bproof_1\":0,\"beard_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"eye_color\":0,\"helmet_2\":0,\"jaw_1\":0,\"sun_2\":0,\"nose_1\":0,\"tshirt_1\":157,\"pants_1\":24,\"blush_3\":0,\"tshirt_2\":0,\"nose_4\":0,\"arms\":1,\"blush_1\":0,\"shoes_1\":104,\"chain_1\":29,\"eyebrows_3\":0,\"lipstick_2\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chest_2\":0,\"age_2\":0,\"shoes_2\":3,\"chain_2\":0,\"nose_5\":0,\"watches_1\":-1,\"chest_1\":0,\"lipstick_3\":0,\"sex\":0}},{\"name\":\"gouverneur 3\",\"grades\":{\"boss\":\"boss\",\"Vice Gouverneur\":\"Vice Gouverneur\"},\"grade\":true,\"data\":{\"complexion_2\":0,\"lipstick_4\":0,\"chin_4\":0,\"chin_3\":0,\"ears_2\":-1,\"blemishes_1\":0,\"blush_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"torso_2\":4,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"moles_2\":0,\"glasses_1\":5,\"complexion_1\":0,\"bracelets_1\":-1,\"lipstick_1\":0,\"jaw_2\":0,\"nose_2\":0,\"eyebrows_5\":0,\"beard_3\":29,\"hair_1\":91,\"bodyb_3\":-1,\"mask_2\":0,\"watches_2\":0,\"dad\":24,\"chin_1\":0,\"cheeks_2\":0,\"chest_3\":0,\"makeup_4\":0,\"arms_2\":0,\"pants_2\":5,\"bodyb_1\":-1,\"moles_1\":0,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_2\":0,\"sun_1\":0,\"torso_1\":120,\"bags_1\":0,\"nose_6\":0,\"eyebrows_6\":0,\"bracelets_2\":0,\"mask_1\":0,\"makeup_2\":0,\"glasses_2\":0,\"mom\":2,\"helmet_1\":8,\"hair_color_2\":29,\"lip_thickness\":0,\"hair_color_1\":29,\"eyebrows_2\":10,\"skin_md_weight\":50,\"eye_squint\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"nose_3\":0,\"face_md_weight\":50,\"beard_1\":10,\"bodyb_4\":0,\"beard_4\":0,\"decals_1\":0,\"bproof_1\":0,\"beard_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"eye_color\":0,\"helmet_2\":0,\"jaw_1\":0,\"sun_2\":0,\"nose_1\":0,\"tshirt_1\":157,\"pants_1\":24,\"blush_3\":0,\"tshirt_2\":0,\"nose_4\":0,\"arms\":1,\"blush_1\":0,\"shoes_1\":104,\"chain_1\":29,\"eyebrows_3\":0,\"lipstick_2\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chest_2\":0,\"age_2\":0,\"shoes_2\":3,\"chain_2\":0,\"nose_5\":0,\"watches_1\":-1,\"chest_1\":0,\"lipstick_3\":0,\"sex\":0}},{\"name\":\"Avocat\",\"grades\":{\"Avocat\":\"Avocat\"},\"grade\":true,\"data\":{\"complexion_2\":0,\"lipstick_4\":0,\"mask_2\":0,\"chin_3\":0,\"ears_2\":0,\"mom\":2,\"blush_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"eyebrows_3\":0,\"glasses_1\":5,\"complexion_1\":0,\"bracelets_1\":-1,\"lipstick_1\":0,\"jaw_2\":0,\"nose_2\":0,\"eyebrows_5\":0,\"beard_3\":29,\"eyebrows_2\":10,\"bodyb_3\":-1,\"hair_1\":91,\"torso_1\":295,\"watches_2\":0,\"chin_1\":0,\"cheeks_2\":0,\"chest_3\":0,\"makeup_4\":0,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":0,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":0,\"bags_2\":0,\"glasses_2\":0,\"pants_1\":28,\"bags_1\":0,\"nose_6\":0,\"dad\":24,\"bracelets_2\":0,\"sun_1\":0,\"makeup_2\":0,\"mask_1\":0,\"shoes_2\":3,\"bodyb_4\":0,\"helmet_1\":-1,\"lip_thickness\":0,\"tshirt_2\":0,\"face_md_weight\":50,\"skin_md_weight\":50,\"eye_squint\":0,\"hair_color_2\":29,\"makeup_3\":0,\"nose_3\":0,\"eyebrows_4\":0,\"beard_1\":10,\"blemishes_1\":0,\"beard_4\":0,\"helmet_2\":0,\"bproof_1\":0,\"beard_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"eye_color\":0,\"nose_5\":0,\"jaw_1\":0,\"sun_2\":0,\"nose_1\":0,\"tshirt_1\":35,\"decals_1\":0,\"blush_3\":0,\"eyebrows_6\":0,\"nose_4\":0,\"arms\":12,\"blush_1\":0,\"shoes_1\":104,\"chain_1\":343,\"chin_4\":0,\"lipstick_2\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chest_2\":0,\"age_2\":0,\"moles_2\":0,\"hair_color_1\":29,\"chain_2\":0,\"watches_1\":-1,\"chest_1\":0,\"lipstick_3\":0,\"sex\":0}},{\"grades\":{\"chefsecu\":\"chefsecu\",\"garde\":\"garde\"},\"name\":\"sécurité\",\"grade\":true,\"data\":{\"complexion_2\":0,\"lipstick_4\":0,\"mask_2\":0,\"chin_3\":0,\"hair_1\":0,\"mom\":2,\"blush_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"eyebrows_3\":0,\"glasses_1\":5,\"complexion_1\":0,\"bracelets_1\":-1,\"lipstick_1\":0,\"eyebrows_4\":0,\"nose_2\":0,\"eyebrows_5\":0,\"beard_3\":29,\"bproof_1\":0,\"skin_md_weight\":50,\"chain_2\":0,\"eyebrows_6\":0,\"bodyb_4\":0,\"chin_1\":0,\"bodyb_1\":-1,\"eye_color\":0,\"face_md_weight\":50,\"lipstick_2\":0,\"pants_2\":0,\"torso_1\":295,\"moles_1\":0,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":0,\"bags_2\":0,\"sun_1\":0,\"eyebrows_2\":10,\"bags_1\":0,\"nose_6\":0,\"nose_5\":0,\"bracelets_2\":0,\"tshirt_1\":35,\"makeup_2\":0,\"jaw_2\":0,\"mask_1\":0,\"hair_color_2\":29,\"watches_1\":-1,\"lip_thickness\":0,\"moles_2\":0,\"helmet_1\":-1,\"glasses_2\":0,\"eye_squint\":0,\"chin_4\":0,\"makeup_3\":0,\"nose_3\":0,\"arms_2\":0,\"beard_1\":10,\"shoes_2\":3,\"beard_4\":0,\"watches_2\":0,\"makeup_4\":0,\"beard_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"dad\":24,\"chest_3\":0,\"jaw_1\":0,\"sun_2\":0,\"nose_1\":0,\"pants_1\":28,\"decals_1\":0,\"blush_3\":0,\"tshirt_2\":0,\"nose_4\":0,\"arms\":12,\"blush_1\":0,\"shoes_1\":104,\"chain_1\":343,\"hair_color_1\":29,\"cheeks_2\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chest_2\":0,\"age_2\":0,\"blemishes_1\":0,\"ears_2\":0,\"bodyb_3\":-1,\"helmet_2\":0,\"chest_1\":0,\"lipstick_3\":0,\"sex\":0}}]', '{\"x\":-568.9598388671875,\"y\":-199.23117065429688,\"z\":38.21366500854492}'),
(35, 'le_ferailleur', 'Roger Salvage et Scrap', '{\"accounts\":{\"society\":15250,\"cash\":0,\"black_money\":0},\"items\":[],\"items_boss\":[],\"weapons\":[],\"weapons_boss\":[]}', '{\"create_grade\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Créer un grade\"},\"items_chest:society\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Item(s) du coffre de la société\"},\"chest\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Accéder au coffre de la société\"},\"promote_player\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Augmenter un employé\"},\"withdraw_money_society\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent dans le coffre de la société\"},\"remove_item_chest\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer un item dans le coffre\"},\"change_permissions_grade\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Changer les permissions d\'un grade\"},\"remove_weapon_chest_society\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer une arme dans la coffre de la société\"},\"withdraw_black_money_coffre\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent sale dans le coffre\"},\"open_boss\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Ouvrir le menu boss\"},\"demote_player\":{\"Ramasseur\":false,\"Co -patron\":false,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Virer un employé\"},\"deposit_money_society\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent dans le coffre de la société\"},\"editClothes\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Gérer les tenues dans le vestiaire\"},\"delete_grade\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Supprimer un grade\"},\"deposit_weapon_chest_society\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer une arme dans le coffre de la société\"},\"rename_label_grade\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Changer le label d\'un grade\"},\"remove_item_chest_society\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer un item dans le coffre de la société\"},\"manage_employeds\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Gérer les employés de la société\"},\"dposit_item_chest_society\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer un item dans le coffre de la société\"},\"deposit_weapon_chest\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer une arme dans le coffre\"},\"remove_weapon_chest\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer une arme dans le coffre\"},\"withdraw_cash_coffre\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent dans le coffre\"},\"change_number_grade\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Changer le numéro d\'un grade\"},\"recruit_player\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Recruté un joueur\"},\"deposit_item_chest\":{\"Ramasseur\":true,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer un item dans le coffre\"},\"manage_grades\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Gérer les grades de la société\"},\"deposit_cash_coffre\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent dans le coffre\"},\"items_chest\":{\"Ramasseur\":true,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Items du coffre\"},\"rename_grade\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Changer le nom d\'un grade\"},\"unmote_player\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Descendre un employé\"},\"weapons_chest_society\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Arme(s) du coffre de la société\"},\"change_salary_grade\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Changer le salaire d\'un grade\"},\"open_coffre\":{\"Ramasseur\":true,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Ouvrir le coffre\"},\"weapons_chest\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Armes du coffre\"},\"deposit_black_money_coffre\":{\"Ramasseur\":false,\"Co -patron\":true,\"boss\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent sale dans le coffre\"}}', '{\"y\":-1617.8726806640626,\"x\":-621.104248046875,\"z\":33.01055145263672}', '{\"y\":-1623.073974609375,\"x\":-617.3504028320313,\"z\":33.01055145263672}', '{\"sprite\":67,\"position\":{\"y\":-1629.8315429688,\"x\":-617.04089355469,\"z\":33.010578155518},\"active\":true,\"color\":0}', '1', 1, '[{\"data\":{\"cheeks_1\":0,\"eyebrows_4\":0,\"tshirt_1\":-1,\"lipstick_1\":0,\"hair_color_2\":15,\"skin_md_weight\":50,\"arms\":30,\"pants_1\":321,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"ears_1\":-1,\"hair_2\":0,\"complexion_1\":0,\"bags_2\":0,\"makeup_2\":0,\"makeup_4\":0,\"sun_2\":0,\"eyebrows_2\":10,\"complexion_2\":0,\"dad\":0,\"makeup_3\":0,\"blush_3\":0,\"bodyb_4\":0,\"cheeks_3\":0,\"lipstick_3\":0,\"eye_color\":0,\"blush_2\":0,\"bodyb_3\":-1,\"nose_4\":0,\"chains_2\":0,\"beard_3\":29,\"eyebrows_6\":0,\"mask_1\":0,\"beard_2\":9,\"age_1\":0,\"eyebrows_1\":22,\"moles_1\":0,\"torso_2\":2,\"beard_4\":0,\"hair_color_1\":29,\"chin_3\":0,\"decals_2\":0,\"glasses_1\":50,\"shoes_2\":9,\"neck_thickness\":0,\"glasses_2\":0,\"chest_2\":0,\"lip_thickness\":0,\"hair_1\":11,\"bproof_1\":0,\"torso_1\":0,\"bracelets_2\":0,\"chain_2\":1,\"pants_2\":0,\"helmet_1\":175,\"eyebrows_5\":0,\"nose_6\":0,\"watches_2\":0,\"arms_2\":0,\"blemishes_1\":0,\"mom\":38,\"shoes_1\":196,\"chest_1\":0,\"blemishes_2\":0,\"decals_1\":0,\"chains_1\":0,\"blush_1\":0,\"eye_squint\":0,\"arms_1\":30,\"nose_3\":0,\"chain_1\":248,\"bags_1\":82,\"bracelets_1\":-1,\"watches_1\":30,\"jaw_1\":0,\"sex\":0,\"makeup_1\":0,\"mask_2\":0,\"chin_4\":0,\"nose_1\":0,\"ears_2\":0,\"age_2\":0,\"chest_3\":0,\"jaw_2\":0,\"sun_1\":0,\"eyebrows_3\":29,\"beard_1\":10,\"helmet_2\":0,\"chin_2\":0,\"face_md_weight\":50,\"tshirt_2\":-1,\"cheeks_2\":0,\"lipstick_4\":0,\"moles_2\":0,\"nose_2\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"chin_1\":0},\"grades\":{\"Co -patron\":\"Co -patron\"},\"grade\":true,\"name\":\"Co-Chef\"},{\"data\":{\"cheeks_1\":0,\"eyebrows_4\":0,\"tshirt_1\":15,\"lipstick_1\":0,\"hair_color_2\":15,\"skin_md_weight\":50,\"arms\":1,\"pants_1\":317,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"ears_1\":-1,\"hair_2\":0,\"complexion_1\":0,\"bags_2\":2,\"makeup_2\":0,\"makeup_4\":0,\"sun_2\":0,\"eyebrows_2\":10,\"complexion_2\":0,\"dad\":0,\"makeup_3\":0,\"blush_3\":0,\"bodyb_4\":0,\"cheeks_3\":0,\"lipstick_3\":0,\"eye_color\":0,\"blush_2\":0,\"bodyb_3\":-1,\"nose_4\":0,\"chains_2\":0,\"beard_3\":29,\"eyebrows_6\":0,\"mask_1\":0,\"beard_2\":9,\"age_1\":0,\"eyebrows_1\":22,\"moles_1\":0,\"torso_2\":1,\"beard_4\":0,\"hair_color_1\":29,\"chin_3\":0,\"decals_2\":0,\"glasses_1\":0,\"shoes_2\":0,\"neck_thickness\":0,\"glasses_2\":0,\"chest_2\":0,\"lip_thickness\":0,\"hair_1\":11,\"bproof_1\":0,\"torso_1\":792,\"bracelets_2\":0,\"chain_2\":0,\"pants_2\":0,\"helmet_1\":238,\"eyebrows_5\":0,\"nose_6\":0,\"watches_2\":0,\"arms_2\":0,\"blemishes_1\":0,\"mom\":38,\"shoes_1\":259,\"chest_1\":0,\"blemishes_2\":0,\"decals_1\":190,\"chains_1\":0,\"blush_1\":0,\"eye_squint\":0,\"arms_1\":205,\"nose_3\":0,\"chain_1\":0,\"bags_1\":82,\"bracelets_1\":-1,\"watches_1\":-1,\"jaw_1\":0,\"sex\":0,\"makeup_1\":0,\"mask_2\":0,\"chin_4\":0,\"nose_1\":0,\"ears_2\":0,\"age_2\":0,\"chest_3\":0,\"jaw_2\":0,\"sun_1\":0,\"eyebrows_3\":29,\"beard_1\":10,\"helmet_2\":0,\"chin_2\":0,\"face_md_weight\":50,\"tshirt_2\":0,\"cheeks_2\":0,\"lipstick_4\":0,\"moles_2\":0,\"nose_2\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"chin_1\":0},\"grades\":[],\"grade\":false,\"name\":\"unefined\"},{\"data\":{\"cheeks_1\":0,\"eyebrows_4\":0,\"tshirt_1\":15,\"lipstick_1\":0,\"hair_color_2\":15,\"skin_md_weight\":50,\"arms\":1,\"pants_1\":317,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"ears_1\":-1,\"hair_2\":0,\"complexion_1\":0,\"bags_2\":2,\"makeup_2\":0,\"makeup_4\":0,\"sun_2\":0,\"eyebrows_2\":10,\"complexion_2\":0,\"dad\":0,\"makeup_3\":0,\"blush_3\":0,\"bodyb_4\":0,\"cheeks_3\":0,\"lipstick_3\":0,\"eye_color\":0,\"blush_2\":0,\"bodyb_3\":-1,\"nose_4\":0,\"chains_2\":0,\"beard_3\":29,\"eyebrows_6\":0,\"mask_1\":0,\"beard_2\":9,\"age_1\":0,\"eyebrows_1\":22,\"moles_1\":0,\"torso_2\":1,\"beard_4\":0,\"hair_color_1\":29,\"chin_3\":0,\"decals_2\":0,\"glasses_1\":0,\"shoes_2\":0,\"neck_thickness\":0,\"glasses_2\":0,\"chest_2\":0,\"lip_thickness\":0,\"hair_1\":11,\"bproof_1\":0,\"torso_1\":792,\"bracelets_2\":0,\"chain_2\":0,\"pants_2\":0,\"helmet_1\":238,\"eyebrows_5\":0,\"nose_6\":0,\"watches_2\":0,\"arms_2\":0,\"blemishes_1\":0,\"mom\":38,\"shoes_1\":259,\"chest_1\":0,\"blemishes_2\":0,\"decals_1\":190,\"chains_1\":0,\"blush_1\":0,\"eye_squint\":0,\"arms_1\":205,\"nose_3\":0,\"chain_1\":0,\"bags_1\":82,\"bracelets_1\":-1,\"watches_1\":-1,\"jaw_1\":0,\"sex\":0,\"makeup_1\":0,\"mask_2\":0,\"chin_4\":0,\"nose_1\":0,\"ears_2\":0,\"age_2\":0,\"chest_3\":0,\"jaw_2\":0,\"sun_1\":0,\"eyebrows_3\":29,\"beard_1\":10,\"helmet_2\":0,\"chin_2\":0,\"face_md_weight\":50,\"tshirt_2\":0,\"cheeks_2\":0,\"lipstick_4\":0,\"moles_2\":0,\"nose_2\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"chin_1\":0},\"grades\":[],\"grade\":true,\"name\":\"unefined\"}]', '{\"y\":-1618.1151123046876,\"x\":-619.4880981445313,\"z\":33.01055145263672}'),
(37, 'garage_lscustom', 'LsCustoms', '{\"weapons\":[],\"weapons_boss\":[],\"accounts\":{\"society\":3322165.0759126178,\"cash\":0,\"black_money\":0},\"items_boss\":[],\"items\":{\"bread\":{\"count\":205,\"name\":\"bread\",\"label\":\"Pain\"},\"water\":{\"count\":215,\"name\":\"water\",\"label\":\"Eau\"}}}', '{\"open_coffre\":{\"boss\":true,\"copatron\":true,\"chefequipe\":false,\"mecano\":false},\"dposit_item_chest_society\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":true},\"unmote_player\":{\"boss\":true,\"copatron\":true,\"chefequipe\":true,\"mecano\":false},\"deposit_cash_coffre\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"manage_employeds\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"items_chest:society\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"manage_grades\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"chest\":{\"boss\":true,\"copatron\":true,\"chefequipe\":false,\"mecano\":false},\"deposit_item_chest\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"delete_grade\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"withdraw_black_money_coffre\":{\"boss\":true,\"copatron\":true,\"chefequipe\":false,\"mecano\":false},\"rename_label_grade\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"items_chest\":{\"boss\":true,\"copatron\":true,\"chefequipe\":false,\"mecano\":false},\"withdraw_cash_coffre\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"change_salary_grade\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"weapons_chest_society\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"weapons_chest\":{\"boss\":true,\"copatron\":true,\"chefequipe\":false,\"mecano\":false},\"change_permissions_grade\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"deposit_black_money_coffre\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"remove_weapon_chest\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"recruit_player\":{\"boss\":true,\"copatron\":true,\"chefequipe\":[],\"mecano\":false},\"change_number_grade\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"deposit_weapon_chest\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"create_grade\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"deposit_money_society\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"withdraw_money_society\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"remove_item_chest\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"deposit_weapon_chest_society\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"demote_player\":{\"boss\":true,\"copatron\":true,\"chefequipe\":false,\"mecano\":false},\"remove_item_chest_society\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"editClothes\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"rename_grade\":{\"boss\":true,\"copatron\":false,\"chefequipe\":false,\"mecano\":false},\"promote_player\":{\"boss\":true,\"copatron\":[],\"chefequipe\":true,\"mecano\":false},\"remove_weapon_chest_society\":{\"boss\":true,\"copatron\":[],\"chefequipe\":false,\"mecano\":false},\"open_boss\":{\"boss\":true,\"copatron\":true,\"chefequipe\":false,\"mecano\":false}}', '{\"z\":42.0371208190918,\"y\":-124.81334686279296,\"x\":-344.1487731933594}', '{\"z\":42.03677368164062,\"y\":-131.3484039306641,\"x\":-348.3934631347656}', '{\"active\":true,\"position\":{\"z\":39.00970840454101,\"y\":-147.0532379150391,\"x\":-330.6905822753906},\"sprite\":446,\"color\":47}', '3', 1, '[{\"grades\":[],\"data\":{\"hair_1\":175,\"moles_2\":10.0,\"glasses_2\":2,\"complexion_2\":0,\"eyebrows_5\":0,\"beard_2\":20,\"nose_3\":0,\"jaw_1\":-1,\"chin_1\":-1,\"moles_1\":-1,\"skin_md_weight\":0.0,\"ears_1\":-1,\"eye_color\":8,\"bodyb_3\":-1,\"cheeks_3\":0,\"cheeks_1\":0,\"chest_2\":0,\"torso_2\":11,\"eyebrows_6\":0,\"tshirt_2\":0,\"lipstick_4\":0,\"bodyb_4\":0,\"chain_1\":-1,\"arms_2\":0,\"ears_2\":-1,\"mom\":0,\"shoes_1\":25,\"decals_2\":0,\"torso_1\":505,\"jaw_2\":-1,\"age_1\":0,\"bags_1\":44,\"tshirt_1\":15,\"sun_1\":0,\"pants_2\":2,\"chest_1\":0,\"nose_2\":0,\"complexion_1\":0,\"lipstick_1\":-1,\"hair_2\":0,\"shoes_2\":0,\"dad\":14,\"bproof_2\":0,\"face_md_weight\":0.0,\"age_2\":10.0,\"bodyb_1\":-1,\"helmet_2\":0,\"eye_squint\":0,\"mask_1\":0,\"helmet_1\":8,\"neck_thickness\":-1,\"makeup_1\":-1,\"makeup_4\":3.0,\"eyebrows_2\":10,\"pants_1\":98,\"nose_1\":0,\"hair_color_2\":0,\"bracelets_1\":0,\"nose_4\":0,\"mask_2\":0,\"decals_1\":0,\"nose_5\":0,\"chain_2\":0,\"blemishes_2\":0,\"lipstick_3\":0,\"glasses_1\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"blush_2\":10.0,\"cheeks_2\":0,\"bags_2\":0,\"blush_1\":-1,\"eyebrows_1\":33,\"blemishes_1\":0,\"bracelets_2\":0,\"beard_3\":61,\"sex\":0,\"chest_3\":0,\"lip_thickness\":0.0,\"bproof_1\":0,\"sun_2\":0,\"nose_6\":0,\"beard_1\":16,\"lipstick_2\":10.0,\"hair_color_1\":61,\"bodyb_2\":0,\"chin_2\":0,\"blush_3\":0,\"beard_4\":0,\"chin_3\":0,\"watches_2\":-1,\"eyebrows_4\":0,\"chin_4\":0,\"arms\":0,\"makeup_3\":0,\"makeup_2\":10.0},\"grade\":false,\"name\":\"tenue de service\"}]', '{\"z\":44.58747863769531,\"y\":-161.72747802734376,\"x\":-341.477294921875}');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(40, 'percio', 'Bar Perico', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"demote_player\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"chest\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true}}', '{\"y\":-4942.396484375,\"z\":3.38087058067321,\"x\":4903.65283203125}', '{\"y\":-4955.5009765625,\"z\":4.93026733398437,\"x\":4892.0478515625}', '{\"position\":{\"y\":-4918.95361328125,\"z\":3.36774158477783,\"x\":4896.77685546875},\"active\":false}', '1', 0, '[]', '\"none\"'),
(41, 'taxi', 'Taxi', '{\"items_boss\":[],\"accounts\":{\"society\":49803.7188,\"cash\":0,\"black_money\":0},\"weapons\":[],\"items\":{\"water\":{\"count\":90,\"label\":\"Eau\",\"name\":\"water\"},\"bread\":{\"count\":90,\"label\":\"Pain\",\"name\":\"bread\"}},\"weapons_boss\":[]}', '{\"open_boss\":{\"label\":\"Ouvrir le menu boss\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"recruit_player\":{\"label\":\"Recruté un joueur\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"unmote_player\":{\"label\":\"Descendre un employé\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"demote_player\":{\"label\":\"Virer un employé\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"withdraw_cash_coffre\":{\"label\":\"Retirer de l\'argent dans le coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"rename_grade\":{\"label\":\"Changer le nom d\'un grade\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"manage_employeds\":{\"label\":\"Gérer les employés de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"withdraw_black_money_coffre\":{\"label\":\"Retirer de l\'argent sale dans le coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"change_permissions_grade\":{\"label\":\"Changer les permissions d\'un grade\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"dposit_item_chest_society\":{\"label\":\"Déposer un item dans le coffre de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"promote_player\":{\"label\":\"Augmenter un employé\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"items_chest:society\":{\"label\":\"Item(s) du coffre de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"withdraw_money_society\":{\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"open_coffre\":{\"label\":\"Ouvrir le coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"weapons_chest\":{\"label\":\"Armes du coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"deposit_money_society\":{\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"editClothes\":{\"label\":\"Gérer les tenues dans le vestiaire\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"remove_item_chest\":{\"label\":\"Retirer un item dans le coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"deposit_weapon_chest\":{\"label\":\"Déposer une arme dans le coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"change_salary_grade\":{\"label\":\"Changer le salaire d\'un grade\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"chest\":{\"label\":\"Accéder au coffre de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"deposit_item_chest\":{\"label\":\"Déposer un item dans le coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"delete_grade\":{\"label\":\"Supprimer un grade\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"change_number_grade\":{\"label\":\"Changer le numéro d\'un grade\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"rename_label_grade\":{\"label\":\"Changer le label d\'un grade\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"remove_item_chest_society\":{\"label\":\"Retirer un item dans le coffre de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"manage_grades\":{\"label\":\"Gérer les grades de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"deposit_black_money_coffre\":{\"label\":\"Déposer de l\'argent sale dans le coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"create_grade\":{\"label\":\"Créer un grade\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"items_chest\":{\"label\":\"Items du coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"deposit_weapon_chest_society\":{\"label\":\"Déposer une arme dans le coffre de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"weapons_chest_society\":{\"label\":\"Arme(s) du coffre de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"deposit_cash_coffre\":{\"label\":\"Déposer de l\'argent dans le coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"remove_weapon_chest\":{\"label\":\"Retirer une arme dans le coffre\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false},\"remove_weapon_chest_society\":{\"label\":\"Retirer une arme dans la coffre de la société\",\"boss\":true,\"chauffeur\":false,\"chauffeur v.i.p\":false,\"grades\":{\"boss\":true},\"expérimenté\":false,\"stagiare\":false,\"manager\":false}}', '{\"z\":74.2222671508789,\"y\":-166.5725860595703,\"x\":900.9324340820313}', '{\"z\":74.22233581542969,\"y\":-165.82579040527345,\"x\":898.317626953125}', '{\"color\":5,\"active\":true,\"position\":{\"z\":78.16291809082031,\"y\":-162.7771148681641,\"x\":904.8250122070313},\"sprite\":56}', '3', 1, '[{\"grades\":{\"apprenti\":\"apprenti\",\"manager\":\"manager\",\"stagiare\":\"stagiare\",\"debutant\":\"debutant\",\"pratiquant\":\"pratiquant\",\"chauffeur\":\"chauffeur\",\"co-boss\":\"co-boss\",\"boss\":\"boss\"},\"name\":\"tenu taxi\",\"data\":{\"bproof_2\":0,\"bags_1\":0,\"skin_md_weight\":0.0,\"jaw_1\":0,\"lipstick_1\":-1,\"blush_3\":0,\"decals_2\":6,\"torso_2\":7,\"blemishes_1\":0,\"helmet_2\":0,\"decals_1\":0,\"chest_1\":0,\"pants_1\":37,\"arms_2\":0,\"shoes_2\":1,\"lipstick_2\":10.0,\"face_md_weight\":0.0,\"pants_2\":2,\"beard_1\":3,\"eyebrows_2\":10,\"dad\":29,\"ears_1\":-1,\"blush_1\":-1,\"moles_1\":-1,\"chin_1\":-1,\"sex\":0,\"hair_2\":0,\"beard_4\":0,\"eye_squint\":0,\"bproof_1\":95,\"sun_2\":0,\"eyebrows_3\":41,\"chain_2\":0,\"torso_1\":505,\"moles_2\":10.0,\"blush_2\":10.0,\"chin_4\":0,\"chain_1\":0,\"nose_6\":0,\"eye_color\":12,\"age_1\":0,\"bodyb_4\":0,\"neck_thickness\":-1,\"bodyb_1\":-1,\"age_2\":10.0,\"watches_1\":-1,\"beard_2\":20,\"helmet_1\":8,\"watches_2\":-1,\"glasses_2\":0,\"bracelets_1\":-1,\"mom\":0,\"eyebrows_1\":30,\"chest_3\":0,\"arms\":0,\"eyebrows_4\":0,\"nose_5\":0,\"sun_1\":0,\"jaw_2\":0,\"makeup_4\":3.0,\"makeup_1\":-1,\"cheeks_1\":1,\"blemishes_2\":0,\"cheeks_3\":0,\"mask_1\":0,\"tshirt_2\":0,\"nose_1\":0,\"hair_color_1\":0,\"makeup_2\":10.0,\"complexion_1\":0,\"eyebrows_6\":0,\"tshirt_1\":15,\"cheeks_2\":0,\"lipstick_4\":0,\"ears_2\":-1,\"bodyb_3\":-1,\"nose_2\":0,\"bodyb_2\":0,\"nose_3\":0,\"complexion_2\":0,\"lipstick_3\":0,\"shoes_1\":31,\"chin_3\":0,\"glasses_1\":0,\"hair_1\":221,\"chest_2\":0,\"makeup_3\":0,\"hair_color_2\":61,\"bags_2\":0,\"beard_3\":0,\"bracelets_2\":0,\"mask_2\":0,\"eyebrows_5\":0,\"chin_2\":0,\"nose_4\":2,\"lip_thickness\":0.0},\"grade\":true},{\"grades\":{\"boss\":\"boss\",\"co-boss\":\"co-boss\"},\"name\":\"tenu patron \",\"data\":{\"bproof_2\":0,\"bags_1\":0,\"skin_md_weight\":50,\"jaw_1\":3,\"lipstick_1\":0,\"blush_3\":0,\"decals_2\":0,\"torso_2\":0,\"lip_thickness\":0,\"helmet_2\":0,\"decals_1\":0,\"chest_1\":0,\"pants_1\":24,\"arms_2\":0,\"shoes_2\":0,\"lipstick_2\":0,\"hair_color_1\":0,\"pants_2\":5,\"beard_1\":19,\"eyebrows_2\":0,\"dad\":9,\"ears_1\":-1,\"blush_1\":0,\"helmet_1\":7,\"chin_1\":3,\"sex\":0,\"hair_2\":0,\"beard_4\":0,\"eye_squint\":0,\"bproof_1\":0,\"sun_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"torso_1\":321,\"mom\":4,\"blush_2\":0,\"chin_4\":6,\"chain_1\":362,\"nose_6\":0,\"eye_color\":0,\"age_1\":0,\"bodyb_4\":0,\"neck_thickness\":0,\"bodyb_1\":-1,\"age_2\":0,\"watches_1\":-1,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"watches_2\":0,\"glasses_2\":0,\"bracelets_1\":-1,\"arms\":22,\"lipstick_4\":0,\"chest_3\":0,\"nose_5\":1,\"blemishes_1\":0,\"face_color\":2,\"makeup_1\":0,\"jaw_2\":3,\"makeup_4\":0,\"blemishes_2\":0,\"cheeks_1\":4,\"mask_1\":0,\"shoes_1\":10,\"cheeks_3\":4,\"tshirt_2\":0,\"nose_1\":2,\"lipstick_3\":0,\"makeup_2\":0,\"complexion_1\":0,\"eyebrows_6\":0,\"tshirt_1\":15,\"cheeks_2\":0,\"eyebrows_4\":0,\"bodyb_3\":-1,\"moles_1\":0,\"nose_2\":2,\"bodyb_2\":0,\"nose_3\":5,\"complexion_2\":0,\"sun_1\":1,\"eyebrows_5\":0,\"hair_1\":8,\"glasses_1\":5,\"hair_color_2\":0,\"chest_2\":0,\"makeup_3\":0,\"bags_2\":0,\"moles_2\":0,\"beard_3\":0,\"bracelets_2\":0,\"mask_2\":0,\"chin_3\":3,\"chin_2\":3,\"nose_4\":5,\"face_md_weight\":100},\"grade\":true}]', '{\"z\":75.31824493408203,\"y\":-149.68199157714845,\"x\":900.0584716796875}'),
(46, 'weazelnews', 'Weazle News', '{\"items_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons_boss\":[],\"weapons\":[]}', '{\"unmote_player\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"chest\":{\"boss\":true},\"open_boss\":{\"boss\":true}}', '{\"x\":-574.282227,\"z\":23.86964,\"y\":-923.107971}', '{\"x\":-583.081238,\"z\":28.157051,\"y\":-928.580811}', '{\"sprite\":184,\"active\":true,\"position\":{\"x\":-583.081238,\"z\":28.157051,\"y\":-928.580811},\"color\":9}', '1', 1, '[]', '{\"x\":-588.1155395507813,\"z\":23.86913871765136,\"y\":-927.4957885742188}'),
(47, 'petitpecheur', 'Petit Pêcheur', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"change_number_grade\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"chest\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"weapons_chest\":{\"boss\":true}}', '{\"z\":5.00024080276489,\"y\":-2778.757568359375,\"x\":-316.8606872558594}', '{\"z\":5.00024032592773,\"y\":-2783.19775390625,\"x\":-315.61761474609377}', '{\"sprite\":455,\"active\":true,\"position\":{\"z\":5.00023221969604,\"y\":-2778.19970703125,\"x\":-313.3329162597656},\"color\":3}', '1', 1, '[]', '{\"z\":5.00023794174194,\"y\":-2784.130126953125,\"x\":-312.71258544921877}'),
(49, 'vigne', 'Vigneron', '{\"items\":{\"crochetage_kit\":{\"count\":2,\"label\":\"Kit de Crochetage\",\"name\":\"crochetage_kit\"},\"hack_phone\":{\"count\":1,\"label\":\"Téléphone Jailbreak\",\"name\":\"hack_phone\"}},\"accounts\":{\"society\":157900.0,\"black_money\":0,\"cash\":0},\"weapons\":[],\"weapons_boss\":[],\"items_boss\":{}}', '{\"withdraw_cash_coffre\":{\"employed\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_cash_coffre\":{\"employed\":false,\"label\":\"Déposer de l\'argent dans le coffre\",\"Employer\":true,\"grades\":{\"boss\":true},\"boss\":true},\"remove_weapon_chest_society\":{\"employed\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_black_money_coffre\":{\"employed\":false,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"Employer\":true,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_money_society\":{\"employed\":[],\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"change_salary_grade\":{\"employed\":false,\"label\":\"Changer le salaire d\'un grade\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"withdraw_money_society\":{\"employed\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"recruit_player\":{\"employed\":false,\"label\":\"Recruté un joueur\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"weapons_chest_society\":{\"employed\":false,\"label\":\"Arme(s) du coffre de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"promote_player\":{\"employed\":false,\"label\":\"Augmenter un employé\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"remove_weapon_chest\":{\"employed\":false,\"label\":\"Retirer une arme dans le coffre\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"manage_grades\":{\"employed\":false,\"label\":\"Gérer les grades de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"delete_grade\":{\"employed\":false,\"label\":\"Supprimer un grade\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"rename_grade\":{\"employed\":false,\"label\":\"Changer le nom d\'un grade\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"change_number_grade\":{\"employed\":false,\"label\":\"Changer le numéro d\'un grade\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"weapons_chest\":{\"employed\":false,\"label\":\"Armes du coffre\",\"Employer\":true,\"grades\":{\"boss\":true},\"boss\":true},\"withdraw_black_money_coffre\":{\"employed\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"demote_player\":{\"employed\":false,\"label\":\"Virer un employé\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"chest\":{\"employed\":false,\"label\":\"Accéder au coffre de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"unmote_player\":{\"employed\":false,\"label\":\"Descendre un employé\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"dposit_item_chest_society\":{\"employed\":false,\"label\":\"Déposer un item dans le coffre de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"items_chest:society\":{\"employed\":false,\"label\":\"Item(s) du coffre de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"create_grade\":{\"employed\":false,\"label\":\"Créer un grade\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"editClothes\":{\"employed\":false,\"label\":\"Gérer les tenues dans le vestiaire\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"remove_item_chest_society\":{\"employed\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"change_permissions_grade\":{\"employed\":false,\"label\":\"Changer les permissions d\'un grade\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"remove_item_chest\":{\"employed\":false,\"label\":\"Retirer un item dans le coffre\",\"Employer\":true,\"grades\":{\"boss\":true},\"boss\":true},\"rename_label_grade\":{\"employed\":false,\"label\":\"Changer le label d\'un grade\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_weapon_chest_society\":{\"employed\":false,\"label\":\"Déposer une arme dans le coffre de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"items_chest\":{\"employed\":false,\"label\":\"Items du coffre\",\"Employer\":true,\"grades\":{\"boss\":true},\"boss\":true},\"manage_employeds\":{\"employed\":false,\"label\":\"Gérer les employés de la société\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_weapon_chest\":{\"employed\":[],\"label\":\"Déposer une arme dans le coffre\",\"Employer\":true,\"grades\":{\"boss\":true},\"boss\":true},\"open_boss\":{\"employed\":false,\"label\":\"Ouvrir le menu boss\",\"Employer\":false,\"grades\":{\"boss\":true},\"boss\":true},\"open_coffre\":{\"employed\":true,\"label\":\"Ouvrir le coffre\",\"Employer\":true,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_item_chest\":{\"employed\":[],\"label\":\"Déposer un item dans le coffre\",\"Employer\":true,\"grades\":{\"boss\":true},\"boss\":true}}', '{\"y\":2061.106201171875,\"x\":-1881.4403076171876,\"z\":140.9839324951172}', '{\"y\":2060.869873046875,\"x\":-1876.074951171875,\"z\":145.5737457275391}', '{\"color\":8,\"active\":true,\"sprite\":85,\"position\":{\"y\":2058.33056640625,\"x\":-1884.1417236328128,\"z\":141.46322631835938}}', '0', 1, '[{\"name\":\"co patron\",\"grade\":true,\"grades\":{\"sous-boss\":\"sous-boss\",\"boss\":\"boss\"},\"data\":{\"complexion_2\":0,\"nose_3\":0,\"chin_4\":0,\"pants_2\":0,\"cheeks_1\":0,\"decals_2\":0,\"face_md_weight\":50,\"watches_1\":2,\"nose_5\":0,\"skin_md_weight\":50,\"eyebrows_5\":0,\"torso_2\":0,\"chest_3\":0,\"tshirt_2\":0,\"glasses_1\":56,\"makeup_4\":0,\"eyebrows_3\":0,\"chin_2\":0,\"sun_1\":0,\"pants_1\":23,\"helmet_2\":0,\"nose_4\":2,\"hair_1\":124,\"chain_2\":0,\"bproof_1\":0,\"ears_1\":3,\"chest_2\":0,\"age_2\":0,\"lipstick_2\":0,\"watches_2\":0,\"chin_3\":0,\"bags_2\":0,\"blemishes_1\":0,\"hair_color_1\":0,\"glasses_2\":0,\"blush_1\":0,\"beard_2\":10,\"bodyb_4\":0,\"age_1\":0,\"moles_2\":0,\"chin_1\":0,\"bodyb_3\":-1,\"decals_1\":0,\"eye_squint\":0,\"chain_1\":0,\"jaw_1\":0,\"helmet_1\":190,\"bproof_2\":0,\"cheeks_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"moles_1\":0,\"neck_thickness\":0,\"sun_2\":0,\"blush_3\":0,\"eyebrows_6\":0,\"tshirt_1\":130,\"shoes_1\":137,\"makeup_2\":0,\"arms_2\":0,\"blush_2\":0,\"eye_color\":0,\"beard_1\":3,\"bodyb_1\":-1,\"complexion_1\":0,\"lip_thickness\":0,\"blemishes_2\":0,\"mask_2\":26,\"makeup_3\":0,\"cheeks_3\":0,\"nose_1\":0,\"hair_2\":0,\"arms\":178,\"nose_2\":0,\"bodyb_2\":0,\"eyebrows_2\":10,\"hair_color_2\":1,\"mom\":25,\"nose_6\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_1\":33,\"dad\":24,\"torso_1\":349,\"beard_3\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"beard_4\":0,\"bags_1\":0,\"sex\":0,\"bracelets_1\":-1,\"mask_1\":111,\"makeup_1\":0,\"eyebrows_4\":0,\"ears_2\":0,\"jaw_2\":0}},{\"name\":\"patron\",\"grade\":true,\"grades\":{\"boss\":\"boss\"},\"data\":{\"complexion_2\":0,\"dad\":23,\"chin_4\":0,\"pants_2\":0,\"cheeks_1\":0,\"decals_2\":0,\"face_md_weight\":50,\"watches_1\":0,\"nose_5\":0,\"skin_md_weight\":50,\"eyebrows_5\":0,\"torso_2\":0,\"chest_3\":0,\"tshirt_2\":0,\"glasses_1\":51,\"makeup_4\":0,\"eyebrows_3\":0,\"chin_2\":0,\"sun_1\":0,\"pants_1\":10,\"helmet_2\":0,\"nose_4\":0,\"hair_1\":93,\"chain_2\":0,\"bproof_1\":0,\"ears_1\":-1,\"chest_2\":0,\"age_2\":0,\"lipstick_2\":0,\"watches_2\":0,\"chin_3\":0,\"bags_2\":0,\"arms_2\":0,\"hair_color_1\":0,\"glasses_2\":0,\"blush_1\":0,\"beard_2\":10,\"bodyb_4\":0,\"age_1\":0,\"moles_2\":0,\"chin_1\":0,\"eye_squint\":0,\"decals_1\":0,\"blemishes_2\":0,\"nose_3\":0,\"jaw_1\":0,\"helmet_1\":190,\"bproof_2\":0,\"cheeks_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"moles_1\":0,\"sun_2\":0,\"blush_3\":0,\"eyebrows_4\":0,\"neck_thickness\":0,\"tshirt_1\":4,\"shoes_1\":10,\"makeup_2\":0,\"sex\":0,\"blush_2\":0,\"beard_1\":3,\"bodyb_1\":-1,\"blemishes_1\":0,\"complexion_1\":0,\"lip_thickness\":0,\"bodyb_3\":-1,\"mask_2\":0,\"mask_1\":0,\"cheeks_3\":0,\"nose_1\":0,\"hair_2\":0,\"eyebrows_6\":0,\"nose_2\":0,\"bodyb_2\":0,\"eye_color\":0,\"eyebrows_2\":10,\"mom\":0,\"nose_6\":0,\"shoes_2\":0,\"hair_color_2\":0,\"eyebrows_1\":30,\"lipstick_4\":0,\"torso_1\":142,\"beard_3\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"makeup_3\":0,\"bags_1\":131,\"beard_4\":0,\"bracelets_1\":-1,\"chain_1\":20,\"makeup_1\":0,\"arms\":0,\"ears_2\":0,\"jaw_2\":0}},{\"name\":\"Emploie\",\"grade\":true,\"grades\":{\"Employer\":\"Employer\"},\"data\":{\"complexion_2\":0,\"dad\":23,\"chin_4\":0,\"pants_2\":1,\"cheeks_1\":0,\"decals_2\":0,\"face_md_weight\":50,\"watches_1\":15,\"nose_5\":0,\"skin_md_weight\":50,\"eyebrows_5\":0,\"torso_2\":0,\"chest_3\":0,\"tshirt_2\":0,\"glasses_1\":6,\"makeup_4\":0,\"eyebrows_3\":0,\"chin_2\":0,\"sun_1\":0,\"pants_1\":129,\"helmet_2\":2,\"nose_4\":0,\"hair_1\":93,\"chain_2\":0,\"bproof_1\":0,\"ears_1\":-1,\"chest_2\":0,\"age_2\":0,\"lipstick_2\":0,\"watches_2\":0,\"chin_3\":0,\"bags_2\":0,\"arms_2\":0,\"hair_color_1\":0,\"glasses_2\":0,\"blush_1\":0,\"beard_2\":10,\"bodyb_4\":0,\"age_1\":0,\"moles_2\":0,\"chin_1\":0,\"eyebrows_2\":10,\"decals_1\":0,\"blemishes_2\":0,\"chain_1\":151,\"jaw_1\":0,\"helmet_1\":13,\"bproof_2\":0,\"cheeks_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"moles_1\":0,\"sun_2\":0,\"blush_3\":0,\"arms\":11,\"eyebrows_4\":0,\"tshirt_1\":15,\"shoes_1\":12,\"makeup_2\":0,\"blush_2\":0,\"beard_1\":3,\"eye_squint\":0,\"bodyb_1\":-1,\"blemishes_1\":0,\"complexion_1\":0,\"lip_thickness\":0,\"neck_thickness\":0,\"mask_2\":0,\"bodyb_3\":-1,\"mask_1\":0,\"nose_1\":0,\"hair_2\":0,\"cheeks_3\":0,\"nose_2\":0,\"bodyb_2\":0,\"nose_3\":0,\"eye_color\":0,\"mom\":0,\"nose_6\":0,\"shoes_2\":6,\"hair_color_2\":0,\"eyebrows_1\":30,\"lipstick_4\":0,\"torso_1\":42,\"beard_3\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"makeup_3\":0,\"bags_1\":9,\"beard_4\":0,\"bracelets_1\":-1,\"sex\":0,\"makeup_1\":0,\"eyebrows_6\":0,\"ears_2\":0,\"jaw_2\":0}},{\"name\":\"Vigneron\",\"data\":{\"complexion_2\":0,\"nose_3\":0,\"blush_3\":0,\"lipstick_4\":0,\"cheeks_1\":0,\"decals_2\":0,\"face_md_weight\":50,\"watches_1\":-1,\"nose_5\":0,\"hair_color_2\":0,\"eyebrows_5\":0,\"torso_2\":3,\"chest_3\":0,\"tshirt_2\":0,\"glasses_1\":5,\"makeup_4\":0,\"eyebrows_3\":0,\"chin_2\":0,\"sun_1\":0,\"pants_1\":47,\"eye_color\":0,\"nose_4\":0,\"hair_1\":12,\"chain_2\":0,\"bproof_1\":0,\"ears_1\":-1,\"chest_2\":0,\"age_2\":0,\"sun_2\":0,\"lipstick_1\":0,\"chin_3\":0,\"bags_2\":0,\"arms_2\":0,\"hair_color_1\":3,\"glasses_2\":1,\"blush_1\":0,\"beard_2\":10,\"bodyb_4\":0,\"eye_squint\":0,\"moles_2\":0,\"makeup_3\":0,\"eyebrows_2\":0,\"decals_1\":0,\"sex\":0,\"chin_4\":0,\"jaw_1\":0,\"helmet_1\":-1,\"cheeks_3\":0,\"cheeks_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"moles_1\":0,\"blemishes_1\":0,\"chin_1\":0,\"watches_2\":0,\"lipstick_2\":0,\"tshirt_1\":15,\"shoes_1\":71,\"makeup_2\":0,\"bproof_2\":0,\"chain_1\":-1,\"mask_1\":0,\"age_1\":0,\"dad\":7,\"eyebrows_6\":0,\"blush_2\":0,\"bodyb_1\":-1,\"mask_2\":0,\"skin_md_weight\":50,\"neck_thickness\":0,\"nose_1\":0,\"hair_2\":0,\"lip_thickness\":0,\"nose_2\":0,\"bodyb_2\":0,\"beard_4\":0,\"bodyb_3\":-1,\"mom\":0,\"nose_6\":0,\"shoes_2\":3,\"beard_1\":10,\"eyebrows_1\":0,\"helmet_2\":0,\"torso_1\":241,\"beard_3\":0,\"blemishes_2\":0,\"bracelets_2\":0,\"complexion_1\":0,\"bags_1\":-1,\"eyebrows_4\":0,\"bracelets_1\":-1,\"pants_2\":0,\"makeup_1\":0,\"arms\":2,\"ears_2\":0,\"jaw_2\":0},\"grades\":[],\"grade\":false}]', '{\"y\":2053.555908203125,\"x\":-1874.4549560546876,\"z\":141.06919860839845}'),
(50, 'tabac', 'Tabac', '{\"accounts\":{\"cash\":0,\"society\":15550,\"black_money\":0},\"items_boss\":[],\"weapons\":[],\"weapons_boss\":[],\"items\":[]}', '{\"deposit_weapon_chest_society\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"withdraw_cash_coffre\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"change_salary_grade\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"weapons_chest_society\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"manage_employeds\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"rename_label_grade\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"promote_player\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"open_boss\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"deposit_black_money_coffre\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"change_permissions_grade\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"deposit_cash_coffre\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"remove_weapon_chest\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"manage_grades\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"rename_grade\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"delete_grade\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"change_number_grade\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"weapons_chest\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"create_grade\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"remove_item_chest\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"deposit_money_society\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"dposit_item_chest_society\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"open_coffre\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"withdraw_black_money_coffre\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"remove_weapon_chest_society\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"editClothes\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"withdraw_money_society\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"remove_item_chest_society\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"items_chest\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"deposit_item_chest\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"items_chest:society\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"chest\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"deposit_weapon_chest\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"demote_player\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"recruit_player\":{\"sous-boss\":false,\"boss\":true,\"employed\":false},\"unmote_player\":{\"sous-boss\":false,\"boss\":true,\"employed\":false}}', '{\"z\":50.30839920043945,\"y\":4397.13134765625,\"x\":2889.119384765625}', '{\"z\":50.3368911743164,\"y\":4391.7001953125,\"x\":2890.314208984375}', '{\"position\":{\"z\":50.3368911743164,\"y\":4391.7001953125,\"x\":2890.314208984375},\"active\":true,\"sprite\":208,\"color\":64}', '1', 1, '[{\"grades\":{\"employed\":\"employed\"},\"grade\":true,\"data\":{\"chain_2\":0,\"hair_color_2\":0,\"face_md_weight\":49,\"mom\":2,\"mask_2\":0,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"tshirt_1\":59,\"chin_4\":0,\"hair_1\":133,\"shoes_1\":12,\"arms\":0,\"blush_1\":0,\"chin_2\":0,\"bodyb_4\":0,\"decals_1\":0,\"helmet_2\":0,\"eye_color\":0,\"sex\":0,\"bracelets_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"eye_squint\":0,\"eyebrows_6\":0,\"bags_1\":0,\"eyebrows_2\":0,\"blemishes_2\":0,\"bracelets_1\":-1,\"chest_1\":0,\"eyebrows_1\":0,\"helmet_1\":-1,\"age_1\":0,\"jaw_2\":0,\"complexion_2\":0,\"bodyb_1\":-1,\"cheeks_2\":0,\"mask_1\":0,\"eyebrows_5\":0,\"sun_1\":0,\"eyebrows_3\":0,\"skin_md_weight\":49,\"nose_6\":0,\"torso_1\":751,\"cheeks_3\":0,\"bproof_1\":0,\"makeup_1\":0,\"lip_thickness\":0,\"nose_2\":0,\"dad\":9,\"lipstick_4\":0,\"moles_2\":0,\"nose_1\":0,\"beard_1\":10,\"hair_color_1\":55,\"makeup_3\":0,\"beard_2\":10,\"chin_1\":0,\"cheeks_1\":0,\"pants_1\":4,\"chain_1\":0,\"arms_2\":0,\"moles_1\":0,\"complexion_1\":0,\"glasses_2\":0,\"blemishes_1\":0,\"neck_thickness\":0,\"nose_4\":0,\"tshirt_2\":0,\"makeup_4\":0,\"bodyb_3\":-1,\"bags_2\":0,\"makeup_2\":0,\"blush_3\":0,\"hair_2\":0,\"glasses_1\":0,\"pants_2\":4,\"blush_2\":0,\"jaw_1\":0,\"lipstick_3\":0,\"chin_3\":0,\"chest_2\":0,\"watches_1\":0,\"age_2\":0,\"shoes_2\":6,\"nose_3\":0,\"sun_2\":0,\"torso_2\":5,\"lipstick_1\":0,\"ears_2\":0,\"beard_3\":0,\"beard_4\":0,\"watches_2\":0,\"decals_2\":0,\"chest_3\":0,\"bodyb_2\":0},\"name\":\"Praktikant\"},{\"grades\":{\"employed\":\"employed\"},\"grade\":true,\"data\":{\"chain_2\":0,\"hair_color_2\":0,\"face_md_weight\":49,\"mom\":2,\"mask_2\":0,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"tshirt_1\":15,\"chin_4\":0,\"hair_1\":133,\"shoes_1\":12,\"arms\":0,\"blush_1\":0,\"chin_2\":0,\"bodyb_4\":0,\"decals_1\":0,\"helmet_2\":0,\"eye_color\":0,\"sex\":0,\"bracelets_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"eye_squint\":0,\"eyebrows_6\":0,\"bags_1\":0,\"eyebrows_2\":0,\"blemishes_2\":0,\"bracelets_1\":-1,\"chest_1\":0,\"eyebrows_1\":0,\"helmet_1\":-1,\"age_1\":0,\"jaw_2\":0,\"complexion_2\":0,\"bodyb_1\":-1,\"cheeks_2\":0,\"mask_1\":0,\"eyebrows_5\":0,\"sun_1\":0,\"eyebrows_3\":0,\"skin_md_weight\":49,\"nose_6\":0,\"torso_1\":751,\"cheeks_3\":0,\"bproof_1\":0,\"makeup_1\":0,\"lip_thickness\":0,\"nose_2\":0,\"dad\":9,\"lipstick_4\":0,\"moles_2\":0,\"nose_1\":0,\"beard_1\":10,\"hair_color_1\":55,\"makeup_3\":0,\"beard_2\":10,\"chin_1\":0,\"cheeks_1\":0,\"pants_1\":4,\"chain_1\":0,\"arms_2\":0,\"moles_1\":0,\"complexion_1\":0,\"glasses_2\":0,\"blemishes_1\":0,\"neck_thickness\":0,\"nose_4\":0,\"tshirt_2\":0,\"makeup_4\":0,\"bodyb_3\":-1,\"bags_2\":0,\"makeup_2\":0,\"blush_3\":0,\"hair_2\":0,\"glasses_1\":0,\"pants_2\":4,\"blush_2\":0,\"jaw_1\":0,\"lipstick_3\":0,\"chin_3\":0,\"chest_2\":0,\"watches_1\":0,\"age_2\":0,\"shoes_2\":6,\"nose_3\":0,\"sun_2\":0,\"torso_2\":5,\"lipstick_1\":0,\"ears_2\":0,\"beard_3\":0,\"beard_4\":0,\"watches_2\":0,\"decals_2\":0,\"chest_3\":0,\"bodyb_2\":0},\"name\":\"Employé(e)\"},{\"grades\":{\"sous-boss\":\"sous-boss\"},\"grade\":true,\"data\":{\"chain_2\":0,\"hair_color_2\":0,\"face_md_weight\":49,\"mom\":2,\"mask_2\":0,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"tshirt_1\":15,\"chin_4\":0,\"hair_1\":133,\"shoes_1\":10,\"arms\":11,\"blush_1\":0,\"chin_2\":0,\"bodyb_4\":0,\"decals_1\":0,\"helmet_2\":0,\"eye_color\":0,\"sex\":0,\"bracelets_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"eye_squint\":0,\"eyebrows_6\":0,\"bags_1\":0,\"eyebrows_2\":0,\"blemishes_2\":0,\"bracelets_1\":-1,\"chest_1\":0,\"eyebrows_1\":0,\"helmet_1\":-1,\"age_1\":0,\"jaw_2\":0,\"complexion_2\":0,\"bodyb_1\":-1,\"cheeks_2\":0,\"mask_1\":0,\"eyebrows_5\":0,\"sun_1\":0,\"eyebrows_3\":0,\"skin_md_weight\":49,\"nose_6\":0,\"torso_1\":26,\"cheeks_3\":0,\"bproof_1\":0,\"makeup_1\":0,\"lip_thickness\":0,\"nose_2\":0,\"dad\":9,\"lipstick_4\":0,\"moles_2\":0,\"nose_1\":0,\"beard_1\":10,\"hair_color_1\":55,\"makeup_3\":0,\"beard_2\":10,\"chin_1\":0,\"cheeks_1\":0,\"pants_1\":10,\"chain_1\":0,\"arms_2\":0,\"moles_1\":0,\"complexion_1\":0,\"glasses_2\":0,\"blemishes_1\":0,\"neck_thickness\":0,\"nose_4\":0,\"tshirt_2\":0,\"makeup_4\":0,\"bodyb_3\":-1,\"bags_2\":0,\"makeup_2\":0,\"blush_3\":0,\"hair_2\":0,\"glasses_1\":0,\"pants_2\":0,\"blush_2\":0,\"jaw_1\":0,\"lipstick_3\":0,\"chin_3\":0,\"chest_2\":0,\"watches_1\":0,\"age_2\":0,\"shoes_2\":0,\"nose_3\":0,\"sun_2\":0,\"torso_2\":1,\"lipstick_1\":0,\"ears_2\":0,\"beard_3\":0,\"beard_4\":0,\"watches_2\":0,\"decals_2\":0,\"chest_3\":0,\"bodyb_2\":0},\"name\":\"Responsable\"},{\"grades\":{\"boss\":\"boss\"},\"grade\":true,\"data\":{\"chain_2\":0,\"hair_color_2\":0,\"face_md_weight\":49,\"mom\":2,\"mask_2\":0,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"tshirt_1\":15,\"chin_4\":0,\"hair_1\":133,\"shoes_1\":3,\"arms\":11,\"blush_1\":0,\"chin_2\":0,\"bodyb_4\":0,\"decals_1\":0,\"helmet_2\":0,\"eye_color\":0,\"sex\":0,\"bracelets_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"eye_squint\":0,\"eyebrows_6\":0,\"bags_1\":0,\"eyebrows_2\":0,\"blemishes_2\":0,\"bracelets_1\":-1,\"chest_1\":0,\"eyebrows_1\":0,\"helmet_1\":-1,\"age_1\":0,\"jaw_2\":0,\"complexion_2\":0,\"bodyb_1\":-1,\"cheeks_2\":0,\"mask_1\":0,\"eyebrows_5\":0,\"sun_1\":0,\"eyebrows_3\":0,\"skin_md_weight\":49,\"nose_6\":0,\"torso_1\":838,\"cheeks_3\":0,\"bproof_1\":0,\"makeup_1\":0,\"lip_thickness\":0,\"nose_2\":0,\"dad\":9,\"lipstick_4\":0,\"moles_2\":0,\"nose_1\":0,\"beard_1\":10,\"hair_color_1\":55,\"makeup_3\":0,\"beard_2\":10,\"chin_1\":0,\"cheeks_1\":0,\"pants_1\":24,\"chain_1\":0,\"arms_2\":0,\"moles_1\":0,\"complexion_1\":0,\"glasses_2\":0,\"blemishes_1\":0,\"neck_thickness\":0,\"nose_4\":0,\"tshirt_2\":0,\"makeup_4\":0,\"bodyb_3\":-1,\"bags_2\":0,\"makeup_2\":0,\"blush_3\":0,\"hair_2\":0,\"glasses_1\":0,\"pants_2\":5,\"blush_2\":0,\"jaw_1\":0,\"lipstick_3\":0,\"chin_3\":0,\"chest_2\":0,\"watches_1\":0,\"age_2\":0,\"shoes_2\":1,\"nose_3\":0,\"sun_2\":0,\"torso_2\":3,\"lipstick_1\":0,\"ears_2\":0,\"beard_3\":0,\"beard_4\":0,\"watches_2\":0,\"decals_2\":0,\"chest_3\":0,\"bodyb_2\":0},\"name\":\"Patron\"}]', '{\"z\":50.29619216918945,\"y\":4400.97314453125,\"x\":2887.09326171875}');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(53, 'ltd_littleseoul', 'LTD Little Seoul', '{\"items\":{\"canneapeche\":{\"count\":1,\"label\":\"Canne à Pêche\",\"name\":\"canneapeche\"},\"douce_lures\":{\"count\":660,\"label\":\"Appât d\'Eau Douce\",\"name\":\"douce_lures\"},\"ocean_lures\":{\"count\":60,\"label\":\"Appât d\'Eau Profonde\",\"name\":\"ocean_lures\"}},\"accounts\":{\"society\":91098.44978338284,\"black_money\":0,\"cash\":0},\"weapons\":[],\"weapons_boss\":[],\"items_boss\":{\"kq_acetone\":{\"count\":20,\"label\":\"Acétone\",\"name\":\"kq_acetone\"},\"bread\":{\"count\":18,\"label\":\"Pain\",\"name\":\"bread\"},\"kq_ethanol\":{\"count\":20,\"label\":\"Éthanol\",\"name\":\"kq_ethanol\"},\"water\":{\"count\":20,\"label\":\"Eau\",\"name\":\"water\"}}}', '{\"withdraw_cash_coffre\":{\"employed\":[],\"boss\":true,\"label\":\"Retirer de l\'argent dans le coffre\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"deposit_cash_coffre\":{\"employed\":[],\"boss\":true,\"label\":\"Déposer de l\'argent dans le coffre\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"remove_weapon_chest_society\":{\"employed\":[],\"boss\":true,\"label\":\"Retirer une arme dans la coffre de la société\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"deposit_black_money_coffre\":{\"employed\":[],\"boss\":true,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"deposit_money_society\":{\"employed\":[],\"boss\":true,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"Expérimenter\":true,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"change_salary_grade\":{\"employed\":[],\"boss\":true,\"label\":\"Changer le salaire d\'un grade\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"withdraw_money_society\":{\"employed\":[],\"boss\":true,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"recruit_player\":{\"employed\":[],\"boss\":true,\"label\":\"Recruté un joueur\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"change_permissions_grade\":{\"employed\":[],\"boss\":true,\"label\":\"Changer les permissions d\'un grade\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"promote_player\":{\"employed\":[],\"boss\":true,\"label\":\"Augmenter un employé\",\"Expérimenter\":true,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"remove_weapon_chest\":{\"employed\":[],\"boss\":true,\"label\":\"Retirer une arme dans le coffre\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"manage_grades\":{\"employed\":false,\"boss\":true,\"label\":\"Gérer les grades de la société\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"delete_grade\":{\"employed\":[],\"boss\":true,\"label\":\"Supprimer un grade\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"rename_grade\":{\"employed\":[],\"boss\":true,\"label\":\"Changer le nom d\'un grade\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"change_number_grade\":{\"employed\":[],\"boss\":true,\"label\":\"Changer le numéro d\'un grade\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"weapons_chest\":{\"employed\":[],\"boss\":true,\"label\":\"Armes du coffre\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"withdraw_black_money_coffre\":{\"employed\":[],\"boss\":true,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"demote_player\":{\"employed\":[],\"boss\":true,\"label\":\"Virer un employé\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"chest\":{\"employed\":[],\"boss\":true,\"label\":\"Accéder au coffre de la société\",\"Expérimenter\":true,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"unmote_player\":{\"employed\":[],\"boss\":true,\"label\":\"Descendre un employé\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"dposit_item_chest_society\":{\"employed\":[],\"boss\":true,\"label\":\"Déposer un item dans le coffre de la société\",\"Expérimenter\":true,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"items_chest:society\":{\"employed\":[],\"boss\":true,\"label\":\"Item(s) du coffre de la société\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"editClothes\":{\"employed\":[],\"boss\":true,\"label\":\"Gérer les tenues dans le vestiaire\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"deposit_item_chest\":{\"employed\":[],\"boss\":true,\"label\":\"Déposer un item dans le coffre\",\"Expérimenter\":true,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"items_chest\":{\"employed\":[],\"boss\":true,\"label\":\"Items du coffre\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"create_grade\":{\"employed\":[],\"boss\":true,\"label\":\"Créer un grade\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"remove_item_chest\":{\"employed\":[],\"boss\":true,\"label\":\"Retirer un item dans le coffre\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"rename_label_grade\":{\"employed\":[],\"boss\":true,\"label\":\"Changer le label d\'un grade\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"remove_item_chest_society\":{\"employed\":[],\"boss\":true,\"label\":\"Retirer un item dans le coffre de la société\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"weapons_chest_society\":{\"employed\":[],\"boss\":true,\"label\":\"Arme(s) du coffre de la société\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"manage_employeds\":{\"employed\":[],\"boss\":true,\"label\":\"Gérer les employés de la société\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"deposit_weapon_chest\":{\"employed\":[],\"boss\":true,\"label\":\"Déposer une arme dans le coffre\",\"Expérimenter\":true,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"deposit_weapon_chest_society\":{\"employed\":[],\"boss\":true,\"label\":\"Déposer une arme dans le coffre de la société\",\"Expérimenter\":true,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"open_boss\":{\"employed\":[],\"boss\":true,\"label\":\"Ouvrir le menu boss\",\"Expérimenter\":false,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}},\"open_coffre\":{\"employed\":[],\"boss\":true,\"label\":\"Ouvrir le coffre\",\"Expérimenter\":true,\"Employé\":false,\"Expérimenté\":false,\"sous-boss\":[],\"grades\":{\"boss\":true}}}', '{\"y\":-904.4976196289064,\"x\":-705.4893188476563,\"z\":19.21559906005859}', '{\"y\":-904.7119750976564,\"x\":-709.4483032226563,\"z\":19.21559906005859}', '{\"color\":69,\"active\":true,\"sprite\":52,\"position\":{\"y\":-914.44750976562,\"x\":-709.75347900391,\"z\":19.214469909668}}', '3', 1, '[{\"grade\":true,\"data\":{\"tshirt_1\":31,\"moles_1\":0,\"lipstick_1\":0,\"complexion_2\":0,\"beard_2\":10,\"lip_thickness\":0,\"dad\":15,\"chest_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"bodyb_3\":-1,\"shoes_1\":10,\"torso_1\":29,\"eyebrows_4\":0,\"bodyb_1\":0,\"chain_2\":0,\"mask_2\":0,\"decals_2\":0,\"jaw_2\":0,\"watches_2\":0,\"blush_2\":0,\"pants_2\":0,\"eye_squint\":0,\"arms\":1,\"sun_1\":0,\"bags_1\":0,\"nose_2\":1,\"glasses_1\":68,\"torso_2\":0,\"eyebrows_2\":0,\"eyebrows_6\":0,\"helmet_2\":0,\"bproof_1\":0,\"beard_4\":0,\"cheeks_3\":0,\"decals_1\":0,\"chain_1\":0,\"blush_3\":0,\"nose_4\":1,\"hair_color_1\":0,\"sex\":0,\"chin_2\":0,\"bproof_2\":0,\"glasses_2\":0,\"watches_1\":-1,\"sun_2\":0,\"hair_2\":0,\"arms_2\":0,\"mom\":2,\"chin_3\":0,\"bracelets_2\":0,\"nose_3\":0,\"lipstick_3\":0,\"age_2\":0,\"chin_1\":0,\"face_color\":0,\"ears_1\":0,\"blemishes_2\":0,\"eyebrows_1\":0,\"neck_thickness\":0,\"beard_3\":0,\"bags_2\":0,\"age_1\":0,\"nose_1\":0,\"face_md_weight\":0,\"blemishes_1\":0,\"lipstick_4\":0,\"helmet_1\":-1,\"hair_1\":81,\"eyebrows_3\":0,\"chest_1\":0,\"complexion_1\":0,\"cheeks_2\":0,\"blush_1\":0,\"shoes_2\":0,\"makeup_4\":0,\"cheeks_1\":0,\"bodyb_4\":0,\"hair_color_2\":0,\"beard_1\":3,\"makeup_3\":0,\"mask_1\":0,\"bodyb_2\":0,\"jaw_1\":0,\"tshirt_2\":0,\"moles_2\":0,\"nose_6\":0,\"chin_4\":0,\"chest_3\":0,\"lipstick_2\":0,\"ears_2\":0,\"pants_1\":13,\"nose_5\":0,\"makeup_1\":0,\"eyebrows_5\":0,\"makeup_2\":0,\"bracelets_1\":-1},\"name\":\"Tenue Patron\",\"grades\":{\"boss\":\"boss\"}},{\"grade\":true,\"data\":{\"tshirt_1\":15,\"moles_1\":0,\"lipstick_1\":0,\"complexion_2\":0,\"beard_2\":10,\"lip_thickness\":0,\"dad\":15,\"chest_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"bodyb_3\":-1,\"shoes_1\":201,\"torso_1\":825,\"eyebrows_4\":0,\"bodyb_1\":0,\"chain_2\":0,\"mask_2\":0,\"decals_2\":0,\"jaw_2\":0,\"watches_2\":0,\"blush_2\":0,\"pants_2\":0,\"eye_squint\":0,\"arms\":0,\"sun_1\":0,\"bags_1\":0,\"nose_2\":1,\"glasses_1\":68,\"torso_2\":1,\"eyebrows_2\":0,\"eyebrows_6\":0,\"helmet_2\":0,\"bproof_1\":0,\"beard_4\":0,\"cheeks_3\":0,\"decals_1\":0,\"chain_1\":0,\"blush_3\":0,\"nose_4\":1,\"hair_color_1\":0,\"sex\":0,\"chin_2\":0,\"bproof_2\":0,\"glasses_2\":0,\"watches_1\":-1,\"sun_2\":0,\"hair_2\":0,\"arms_2\":0,\"mom\":2,\"chin_3\":0,\"bracelets_2\":0,\"nose_3\":0,\"lipstick_3\":0,\"age_2\":0,\"chin_1\":0,\"face_color\":0,\"ears_1\":0,\"blemishes_2\":0,\"eyebrows_1\":0,\"neck_thickness\":0,\"beard_3\":0,\"bags_2\":0,\"age_1\":0,\"nose_1\":0,\"face_md_weight\":0,\"blemishes_1\":0,\"lipstick_4\":0,\"helmet_1\":-1,\"hair_1\":81,\"eyebrows_3\":0,\"chest_1\":0,\"complexion_1\":0,\"cheeks_2\":0,\"blush_1\":0,\"shoes_2\":0,\"makeup_4\":0,\"cheeks_1\":0,\"bodyb_4\":0,\"hair_color_2\":0,\"beard_1\":3,\"makeup_3\":0,\"mask_1\":0,\"bodyb_2\":0,\"jaw_1\":0,\"tshirt_2\":0,\"moles_2\":0,\"nose_6\":0,\"chin_4\":0,\"chest_3\":0,\"lipstick_2\":0,\"ears_2\":0,\"pants_1\":13,\"nose_5\":0,\"makeup_1\":0,\"eyebrows_5\":0,\"makeup_2\":0,\"bracelets_1\":-1},\"name\":\"Tenue Co Patron\",\"grades\":{\"sous-boss\":\"sous-boss\"}},{\"grade\":true,\"data\":{\"tshirt_1\":299,\"moles_1\":5,\"lipstick_1\":0,\"complexion_2\":0,\"beard_2\":10,\"lip_thickness\":0,\"beard_1\":11,\"chest_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"bodyb_3\":-1,\"shoes_1\":12,\"torso_1\":704,\"eyebrows_4\":0,\"bodyb_1\":-1,\"hair_1\":75,\"mask_2\":0,\"ears_2\":0,\"jaw_2\":0,\"watches_2\":0,\"blush_2\":0,\"pants_2\":0,\"hair_2\":0,\"helmet_1\":-1,\"sun_1\":0,\"nose_6\":0,\"nose_2\":0,\"glasses_1\":96,\"torso_2\":0,\"eyebrows_2\":10,\"eyebrows_6\":0,\"helmet_2\":0,\"chest_1\":0,\"chin_1\":0,\"cheeks_3\":0,\"decals_1\":0,\"chain_1\":397,\"blush_3\":0,\"nose_4\":0,\"hair_color_1\":0,\"sex\":0,\"chin_2\":0,\"decals_2\":0,\"glasses_2\":0,\"beard_4\":0,\"neck_thickness\":0,\"lipstick_2\":0,\"bracelets_1\":-1,\"jaw_1\":0,\"chin_3\":0,\"blemishes_1\":0,\"nose_3\":0,\"lipstick_3\":0,\"age_2\":0,\"hair_color_2\":0,\"eyebrows_5\":0,\"ears_1\":-1,\"blemishes_2\":0,\"eyebrows_1\":33,\"moles_2\":10,\"beard_3\":0,\"bags_2\":0,\"age_1\":0,\"nose_1\":0,\"face_md_weight\":0,\"lipstick_4\":0,\"sun_2\":0,\"complexion_1\":0,\"bracelets_2\":0,\"eyebrows_3\":0,\"watches_1\":0,\"bodyb_4\":0,\"cheeks_2\":7,\"blush_1\":0,\"shoes_2\":3,\"makeup_4\":0,\"cheeks_1\":10,\"bproof_1\":0,\"mom\":30,\"eye_squint\":0,\"makeup_3\":0,\"mask_1\":0,\"bodyb_2\":0,\"chain_2\":0,\"tshirt_2\":0,\"bags_1\":0,\"arms\":11,\"chin_4\":0,\"chest_3\":0,\"bproof_2\":0,\"pants_1\":102,\"arms_2\":0,\"nose_5\":0,\"makeup_1\":0,\"face_color\":0,\"makeup_2\":0,\"dad\":24},\"name\":\"Tenu  1\",\"grades\":{\"employed\":\"employed\"}},{\"grade\":true,\"data\":{\"tshirt_1\":2,\"moles_1\":0,\"lipstick_1\":0,\"complexion_2\":0,\"beard_2\":8,\"lip_thickness\":0,\"eyebrows_2\":9,\"chest_2\":0,\"eye_color\":0,\"chin_2\":0,\"bodyb_3\":-1,\"shoes_1\":99,\"torso_1\":602,\"eyebrows_4\":0,\"bodyb_1\":-1,\"chain_2\":0,\"mask_2\":0,\"decals_2\":0,\"chain_1\":203,\"watches_2\":28,\"blush_2\":0,\"pants_2\":0,\"hair_2\":0,\"arms\":35,\"sun_1\":0,\"nose_6\":0,\"bodyb_4\":0,\"glasses_1\":18,\"torso_2\":2,\"eyebrows_6\":0,\"helmet_2\":0,\"bproof_1\":129,\"nose_4\":0,\"complexion_1\":0,\"decals_1\":0,\"bracelets_2\":28,\"blush_3\":0,\"lipstick_4\":0,\"hair_color_1\":0,\"sex\":0,\"jaw_2\":0,\"helmet_1\":290,\"glasses_2\":2,\"watches_1\":-1,\"moles_2\":0,\"chest_1\":0,\"arms_2\":0,\"blemishes_1\":0,\"chin_3\":0,\"hair_1\":39,\"nose_3\":0,\"lipstick_3\":0,\"age_2\":0,\"jaw_1\":0,\"eyebrows_5\":0,\"ears_1\":0,\"blemishes_2\":0,\"eyebrows_1\":30,\"neck_thickness\":0,\"beard_3\":0,\"chin_1\":0,\"age_1\":0,\"nose_1\":0,\"face_md_weight\":50,\"eye_squint\":0,\"sun_2\":0,\"tshirt_2\":30,\"mom\":0,\"eyebrows_3\":0,\"beard_1\":10,\"bracelets_1\":-1,\"cheeks_2\":0,\"blush_1\":0,\"shoes_2\":1,\"makeup_4\":0,\"cheeks_1\":0,\"nose_2\":0,\"beard_4\":0,\"cheeks_3\":0,\"makeup_3\":0,\"mask_1\":0,\"bodyb_2\":0,\"bags_1\":0,\"ears_2\":0,\"hair_color_2\":0,\"bproof_2\":30,\"chin_4\":0,\"chest_3\":0,\"lipstick_2\":0,\"dad\":0,\"bags_2\":0,\"nose_5\":0,\"makeup_1\":0,\"skin_md_weight\":50,\"makeup_2\":0,\"pants_1\":221},\"name\":\"CO PATRON\",\"grades\":{\"sous-boss\":\"sous-boss\"}}]', '{\"y\":-915.3992309570313,\"x\":-705.880859375,\"z\":19.21560859680175}'),
(54, 'ltd_paletobay', 'LTD Paleto Bay', '{\"accounts\":{\"society\":15000,\"cash\":0,\"black_money\":0},\"weapons\":[],\"weapons_boss\":[],\"items\":[],\"items_boss\":[]}', '{\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true}}', '{\"x\":164.86036682128907,\"y\":6649.79931640625,\"z\":31.69863128662109}', '{\"x\":157.68443298339845,\"y\":6643.82568359375,\"z\":31.69863510131836}', '{\"sprite\":52,\"color\":69,\"position\":{\"y\":6637.4296875,\"z\":31.7012882232666,\"x\":162.81805419921876},\"active\":true}', '0', 1, '[]', '{\"x\":157.95318603515626,\"y\":6653.68505859375,\"z\":31.69862747192382}'),
(55, 'ltd_f4l', 'LTD Forum Drive', '{\"weapons_boss\":[],\"items_boss\":[],\"items\":{\"feuillecoca\":{\"count\":13,\"name\":\"feuillecoca\",\"label\":\"Feuille de coca\"},\"wiwang_macarons\":{\"count\":10,\"name\":\"wiwang_macarons\",\"label\":\"Macarons\"},\"rifle_ammo\":{\"count\":127,\"name\":\"rifle_ammo\",\"label\":\"Munitions pour fusil\"},\"coca_blend\":{\"count\":15,\"name\":\"coca_blend\",\"label\":\"Mélange de coca\"},\"wiwang_ruinart\":{\"count\":11,\"name\":\"wiwang_ruinart\",\"label\":\"Ruinart\"},\"hydrochloric_acid\":{\"count\":13,\"name\":\"hydrochloric_acid\",\"label\":\"Acide chlorhydrique\"},\"wiwang_donperignon\":{\"count\":10,\"name\":\"wiwang_donperignon\",\"label\":\"Don Perignon\"},\"wiwang_vin\":{\"count\":9,\"name\":\"wiwang_vin\",\"label\":\"Vin\"},\"wiwang_juspassion\":{\"count\":10,\"name\":\"wiwang_juspassion\",\"label\":\"Jus Passion Mangue\"},\"wiwang_cocktail\":{\"count\":10,\"name\":\"wiwang_cocktail\",\"label\":\"Cocktail Bora Bora\"},\"kq_meth_lab_kit\":{\"count\":1,\"name\":\"kq_meth_lab_kit\",\"label\":\"Kit de cuisson\"}},\"accounts\":{\"black_money\":274370,\"cash\":0,\"society\":1583407.0},\"weapons\":[]}', '{\"editClothes\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"demote_player\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"open_coffre\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"rename_label_grade\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"remove_weapon_chest\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"manage_grades\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"change_salary_grade\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"change_permissions_grade\":{\"employer\":false,\"sous-boss\":false,\"boss\":true},\"remove_item_chest_society\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"deposit_money_society\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"items_chest:society\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"promote_player\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"withdraw_black_money_coffre\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"weapons_chest_society\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"items_chest\":{\"employer\":true,\"sous-boss\":[],\"boss\":true},\"open_boss\":{\"employer\":false,\"sous-boss\":true,\"boss\":true},\"remove_weapon_chest_society\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"unmote_player\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"rename_grade\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"deposit_black_money_coffre\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"delete_grade\":{\"employer\":false,\"sous-boss\":false,\"boss\":true},\"weapons_chest\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"withdraw_money_society\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"deposit_cash_coffre\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"withdraw_cash_coffre\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"chest\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"deposit_item_chest\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"remove_item_chest\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"change_number_grade\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"create_grade\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"deposit_weapon_chest_society\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"recruit_player\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"dposit_item_chest_society\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"deposit_weapon_chest\":{\"employer\":false,\"sous-boss\":[],\"boss\":true},\"manage_employeds\":{\"employer\":false,\"sous-boss\":[],\"boss\":true}}', '{\"x\":31.03375053405761,\"y\":-1339.27978515625,\"z\":29.49405479431152}', '{\"x\":24.74807167053222,\"y\":-1339.3367919921876,\"z\":29.49405288696289}', '{\"position\":{\"x\":27.35817527771,\"y\":-1345.2635498047,\"z\":29.496807098389},\"sprite\":52,\"active\":true,\"color\":69}', '0', 1, '[{\"grades\":[],\"grade\":false,\"name\":\"Vendeur\",\"data\":{\"nose_3\":0,\"sun_1\":0,\"makeup_1\":0,\"nose_6\":0,\"decals_2\":0,\"ears_1\":8,\"chain_1\":11,\"watches_1\":8,\"moles_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"decals_1\":0,\"dad\":21,\"bracelets_1\":-1,\"eye_squint\":0,\"complexion_2\":0,\"mask_2\":0,\"eyebrows_4\":0,\"lipstick_1\":0,\"bproof_1\":0,\"bags_2\":0,\"blemishes_2\":0,\"glasses_1\":59,\"chain_2\":6,\"beard_1\":0,\"glasses_2\":0,\"eye_color\":11,\"hair_color_2\":0,\"pants_2\":3,\"blush_3\":0,\"chest_3\":0,\"torso_1\":25,\"eyebrows_3\":0,\"nose_1\":0,\"bags_1\":0,\"eyebrows_1\":0,\"chin_2\":0,\"lipstick_3\":0,\"lipstick_4\":0,\"moles_1\":0,\"bodyb_3\":-1,\"torso_2\":0,\"face_md_weight\":50,\"ears_2\":0,\"makeup_3\":36,\"cheeks_1\":0,\"bodyb_2\":0,\"helmet_1\":12,\"nose_4\":0,\"arms_2\":0,\"nose_2\":0,\"jaw_2\":0,\"cheeks_3\":0,\"makeup_2\":0,\"chin_4\":0,\"tshirt_1\":6,\"mom\":9,\"helmet_2\":1,\"blush_2\":0,\"bodyb_1\":-1,\"chin_3\":0,\"pants_1\":10,\"bproof_2\":0,\"sex\":0,\"hair_color_1\":14,\"eyebrows_5\":0,\"beard_3\":0,\"skin_md_weight\":50,\"nose_5\":0,\"watches_2\":0,\"beard_2\":0,\"shoes_1\":10,\"jaw_1\":0,\"blush_1\":0,\"eyebrows_2\":7,\"chest_2\":0,\"neck_thickness\":0,\"makeup_4\":0,\"eyebrows_6\":0,\"cheeks_2\":0,\"sun_2\":0,\"tshirt_2\":0,\"beard_4\":0,\"shoes_2\":9,\"arms\":74,\"hair_1\":57,\"lip_thickness\":0,\"bracelets_2\":0,\"hair_2\":0,\"blemishes_1\":0,\"age_2\":0,\"mask_1\":0,\"chest_1\":0,\"age_1\":0,\"chin_1\":0,\"bodyb_4\":0}},{\"grades\":[],\"grade\":false,\"name\":\"VendeurM\",\"data\":{\"nose_3\":0,\"sun_1\":0,\"makeup_1\":0,\"nose_6\":0,\"decals_2\":0,\"ears_1\":8,\"chain_1\":11,\"watches_1\":8,\"moles_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"decals_1\":0,\"dad\":21,\"bracelets_1\":-1,\"eye_squint\":0,\"complexion_2\":0,\"mask_2\":0,\"eyebrows_4\":0,\"lipstick_1\":0,\"bproof_1\":0,\"bags_2\":0,\"blemishes_2\":0,\"glasses_1\":59,\"chain_2\":6,\"beard_1\":0,\"glasses_2\":0,\"eye_color\":11,\"hair_color_2\":0,\"pants_2\":3,\"blush_3\":0,\"chest_3\":0,\"torso_1\":25,\"eyebrows_3\":0,\"nose_1\":0,\"bags_1\":0,\"eyebrows_1\":0,\"chin_2\":0,\"lipstick_3\":0,\"lipstick_4\":0,\"moles_1\":0,\"bodyb_3\":-1,\"torso_2\":0,\"face_md_weight\":50,\"ears_2\":0,\"makeup_3\":36,\"cheeks_1\":0,\"bodyb_2\":0,\"helmet_1\":12,\"nose_4\":0,\"arms_2\":0,\"nose_2\":0,\"jaw_2\":0,\"cheeks_3\":0,\"makeup_2\":0,\"chin_4\":0,\"tshirt_1\":6,\"mom\":9,\"helmet_2\":1,\"blush_2\":0,\"bodyb_1\":-1,\"chin_3\":0,\"pants_1\":10,\"bproof_2\":0,\"sex\":0,\"hair_color_1\":14,\"eyebrows_5\":0,\"beard_3\":0,\"skin_md_weight\":50,\"nose_5\":0,\"watches_2\":0,\"beard_2\":0,\"shoes_1\":10,\"jaw_1\":0,\"blush_1\":0,\"eyebrows_2\":7,\"chest_2\":0,\"neck_thickness\":0,\"makeup_4\":0,\"eyebrows_6\":0,\"cheeks_2\":0,\"sun_2\":0,\"tshirt_2\":0,\"beard_4\":0,\"shoes_2\":9,\"arms\":74,\"hair_1\":57,\"lip_thickness\":0,\"bracelets_2\":0,\"hair_2\":0,\"blemishes_1\":0,\"age_2\":0,\"mask_1\":0,\"chest_1\":0,\"age_1\":0,\"chin_1\":0,\"bodyb_4\":0}}]', '{\"x\":24.53115844726562,\"y\":-1348.7269287109376,\"z\":29.49773597717285}'),
(56, 'ltd_ballas', 'LTD Grove Street', '{\"items\":{},\"items_boss\":[],\"weapons_boss\":[],\"weapons\":[],\"accounts\":{\"black_money\":0,\"society\":0,\"cash\":0}}', '{\"promote_player\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true}}', '{\"x\":-40.55442428588867,\"y\":-1751.7152099609376,\"z\":29.42101097106933}', '{\"x\":-43.83893585205078,\"y\":-1749.273193359375,\"z\":29.42101669311523}', '{\"position\":{\"x\":-49.525199890137,\"y\":-1756.1180419922,\"z\":29.420993804932},\"active\":true,\"sprite\":52,\"color\":69}', '1', 1, '[{\"data\":{\"bodyb_2\":10,\"chin_4\":0,\"cheeks_3\":0,\"dad\":9,\"nose_5\":0,\"chest_2\":0,\"makeup_1\":0,\"eyebrows_5\":0,\"makeup_2\":0,\"face_md_weight\":50,\"mom\":21,\"blush_3\":0,\"sun_2\":0,\"cheeks_1\":0,\"decals_1\":0,\"shoes_1\":290,\"ears_1\":-1,\"arms\":4,\"complexion_1\":0,\"watches_1\":67,\"pants_2\":10,\"lipstick_2\":0,\"jaw_2\":0,\"bags_1\":0,\"blemishes_1\":0,\"pants_1\":321,\"ears_2\":0,\"age_2\":0,\"nose_3\":0,\"blemishes_2\":0,\"skin_md_weight\":50,\"bproof_2\":0,\"chin_3\":0,\"bags_2\":0,\"torso_1\":831,\"makeup_3\":0,\"shoes_2\":0,\"chin_1\":0,\"lipstick_3\":0,\"lipstick_1\":0,\"bracelets_1\":-1,\"nose_1\":0,\"beard_3\":0,\"blush_2\":0,\"tshirt_2\":0,\"nose_6\":0,\"tshirt_1\":299,\"complexion_2\":0,\"sex\":0,\"eyebrows_6\":0,\"eyebrows_4\":0,\"arms_2\":0,\"chain_2\":0,\"eyebrows_1\":30,\"helmet_2\":0,\"eyebrows_3\":0,\"bproof_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"hair_color_1\":0,\"beard_1\":3,\"neck_thickness\":0,\"moles_2\":0,\"beard_2\":10,\"mask_1\":0,\"bracelets_2\":0,\"bodyb_3\":-1,\"hair_1\":120,\"decals_2\":0,\"age_1\":0,\"moles_1\":0,\"blush_1\":0,\"nose_4\":0,\"chin_2\":0,\"bodyb_4\":0,\"eye_squint\":0,\"mask_2\":0,\"torso_2\":9,\"hair_2\":0,\"eye_color\":0,\"chest_1\":0,\"glasses_1\":0,\"sun_1\":0,\"cheeks_2\":0,\"bodyb_1\":-1,\"watches_2\":0,\"nose_2\":0,\"hair_color_2\":0,\"chest_3\":0,\"lipstick_4\":0,\"chain_1\":-1,\"helmet_1\":-1,\"lip_thickness\":0,\"jaw_1\":10,\"beard_4\":0,\"eyebrows_2\":10},\"name\":\"LTD\",\"grade\":false,\"grades\":[]},{\"data\":{\"bodyb_2\":10,\"chin_4\":0,\"cheeks_3\":0,\"dad\":9,\"nose_5\":0,\"chest_2\":0,\"makeup_1\":0,\"eyebrows_5\":0,\"makeup_2\":0,\"face_md_weight\":50,\"mom\":21,\"blush_3\":0,\"sun_2\":0,\"cheeks_1\":0,\"decals_1\":0,\"shoes_1\":290,\"ears_1\":-1,\"arms\":4,\"complexion_1\":0,\"watches_1\":67,\"pants_2\":10,\"lipstick_2\":0,\"jaw_2\":0,\"bags_1\":0,\"blemishes_1\":0,\"pants_1\":321,\"ears_2\":0,\"age_2\":0,\"nose_3\":0,\"blemishes_2\":0,\"skin_md_weight\":50,\"bproof_2\":0,\"chin_3\":0,\"bags_2\":0,\"torso_1\":831,\"makeup_3\":0,\"shoes_2\":0,\"chin_1\":0,\"lipstick_3\":0,\"lipstick_1\":0,\"bracelets_1\":-1,\"nose_1\":0,\"beard_3\":0,\"blush_2\":0,\"tshirt_2\":0,\"nose_6\":0,\"tshirt_1\":299,\"complexion_2\":0,\"sex\":0,\"eyebrows_6\":0,\"eyebrows_4\":0,\"arms_2\":0,\"chain_2\":0,\"eyebrows_1\":30,\"helmet_2\":0,\"eyebrows_3\":0,\"bproof_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"hair_color_1\":0,\"beard_1\":3,\"neck_thickness\":0,\"moles_2\":0,\"beard_2\":10,\"mask_1\":0,\"bracelets_2\":0,\"bodyb_3\":-1,\"hair_1\":120,\"decals_2\":0,\"age_1\":0,\"moles_1\":0,\"blush_1\":0,\"nose_4\":0,\"chin_2\":0,\"bodyb_4\":0,\"eye_squint\":0,\"mask_2\":0,\"torso_2\":9,\"hair_2\":0,\"eye_color\":0,\"chest_1\":0,\"glasses_1\":0,\"sun_1\":0,\"cheeks_2\":0,\"bodyb_1\":-1,\"watches_2\":0,\"nose_2\":0,\"hair_color_2\":0,\"chest_3\":0,\"lipstick_4\":0,\"chain_1\":-1,\"helmet_1\":99,\"lip_thickness\":0,\"jaw_1\":10,\"beard_4\":0,\"eyebrows_2\":10},\"name\":\"LTD NOEL\",\"grade\":false,\"grades\":[]}]', '{\"x\":-47.82780075073242,\"y\":-1759.3521728515626,\"z\":29.42099571228027}'),
(57, 'ambulancesandy', 'Ambulance Sandy', '{\"weapons_boss\":[],\"items\":[],\"accounts\":{\"black_money\":0,\"society\":15000,\"cash\":0},\"weapons\":[],\"items_boss\":[]}', '{\"deposit_item_chest\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"create_grade\":{\"boss\":true}}', '{\"x\":1768.4810791015626,\"y\":3643.358154296875,\"z\":34.85253524780273}', '{\"x\":1784.179931640625,\"y\":3658.7099609375,\"z\":34.8525276184082}', '{\"active\":true,\"color\":2,\"position\":{\"x\":1985.743652,\"y\":3762.457764,\"z\":32.603275},\"sprite\":61}', '1', 1, '[]', '{\"x\":1784.9034423828126,\"y\":3652.426513671875,\"z\":34.85258102416992}');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(58, 'saspn', 'BCSO Sandy', '{\"accounts\":{\"society\":1931155.0,\"black_money\":3633,\"cash\":0},\"weapons_boss\":{\"WEAPON_FLASHLIGHT47\":{\"label\":\"Lampe torche\",\"name\":\"WEAPON_FLASHLIGHT\",\"number\":47,\"ammo\":255},\"WEAPON_FLASHLIGHT44\":{\"label\":\"Lampe torche\",\"name\":\"WEAPON_FLASHLIGHT\",\"number\":44,\"ammo\":255},\"WEAPON_FLASHLIGHT27\":{\"label\":\"Lampe torche\",\"name\":\"WEAPON_FLASHLIGHT\",\"number\":27,\"ammo\":255},\"WEAPON_FLASHLIGHT43\":{\"label\":\"Lampe torche\",\"name\":\"WEAPON_FLASHLIGHT\",\"number\":43,\"ammo\":255},\"WEAPON_FLASHLIGHT50\":{\"label\":\"Lampe torche\",\"name\":\"WEAPON_FLASHLIGHT\",\"number\":50,\"ammo\":255},\"WEAPON_NIGHTSTICK40\":{\"label\":\"Matraque\",\"name\":\"WEAPON_NIGHTSTICK\",\"number\":40,\"ammo\":255},\"WEAPON_FLASHLIGHT51\":{\"label\":\"Lampe torche\",\"name\":\"WEAPON_FLASHLIGHT\",\"number\":51,\"ammo\":255}},\"items\":{\"heavypistol\":{\"label\":\"Pistolet lourd\",\"name\":\"heavypistol\",\"count\":1},\"coca_blend\":{\"label\":\"Mélange de coca\",\"name\":\"coca_blend\",\"count\":1},\"combatpistol\":{\"label\":\"Glock 17\",\"name\":\"combatpistol\",\"count\":1},\"kq_ammonia\":{\"label\":\"Ammoniaque\",\"name\":\"kq_ammonia\",\"count\":4}},\"weapons\":[],\"items_boss\":{\"pistol_ammo\":{\"label\":\"Munitions pour pistolet\",\"name\":\"pistol_ammo\",\"count\":16},\"sniper_ammo\":{\"label\":\"Munitions pour sniper\",\"name\":\"sniper_ammo\",\"count\":388},\"762mm\":{\"label\":\"7.62mm Munition\",\"name\":\"762mm\",\"count\":468},\"burgershot_coca\":{\"label\":\"Coca Cola\",\"name\":\"burgershot_coca\",\"count\":14},\"hack_phone\":{\"label\":\"Téléphone Jailbreak\",\"name\":\"hack_phone\",\"count\":1},\"flashlight\":{\"label\":\"Lampe torche\",\"name\":\"flashlight\",\"count\":1},\"nightstick\":{\"label\":\"Matraque\",\"name\":\"nightstick\",\"count\":1},\"assaultsmg\":{\"label\":\"P90\",\"name\":\"assaultsmg\",\"count\":2},\"12gauge\":{\"label\":\"12mm Munition\",\"name\":\"12gauge\",\"count\":153},\"smg_ammo\":{\"label\":\"Munitions pour mitraillette\",\"name\":\"smg_ammo\",\"count\":15},\"combatpistolpol\":{\"label\":\"Combat Pistol Police\",\"name\":\"combatpistolpol\",\"count\":1},\"rifle_ammo\":{\"label\":\"Munitions pour fusil\",\"name\":\"rifle_ammo\",\"count\":2112},\"shotgun_ammo\":{\"label\":\"Munitions pour fusil à pompe\",\"name\":\"shotgun_ammo\",\"count\":196},\"burgershot_burger\":{\"label\":\"Burger\",\"name\":\"burgershot_burger\",\"count\":10},\"mg_ammo\":{\"label\":\"Munitions pour mitrailleuse\",\"name\":\"mg_ammo\",\"count\":200},\"smg\":{\"label\":\"Mitraillette MP5\",\"name\":\"smg\",\"count\":1},\"kevlar\":{\"label\":\"Kevlar\",\"name\":\"kevlar\",\"count\":5},\"9mm\":{\"label\":\"9mm Munition\",\"name\":\"9mm\",\"count\":160},\"hack_laptop\":{\"label\":\"Ordinateur Portable\",\"name\":\"hack_laptop\",\"count\":1},\"lapin\":{\"label\":\"Lapin\",\"name\":\"lapin\",\"count\":13},\"bullpupshotgun\":{\"label\":\"Fusil Bullpup\",\"name\":\"bullpupshotgun\",\"count\":1},\"cerf\":{\"label\":\"Cerf\",\"name\":\"cerf\",\"count\":3},\"556mm\":{\"label\":\"5.56mm Munition\",\"name\":\"556mm\",\"count\":180}}}', '{\"deposit_weapon_chest\":{\"label\":\"Déposer une arme dans le coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"deposit_cash_coffre\":{\"label\":\"Déposer de l\'argent dans le coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"change_salary_grade\":{\"label\":\"Changer le salaire d\'un grade\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"remove_item_chest\":{\"label\":\"Retirer un item dans le coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"withdraw_money_society\":{\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"deposit_weapon_chest_society\":{\"label\":\"Déposer une arme dans le coffre de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"remove_weapon_chest_society\":{\"label\":\"Retirer une arme dans la coffre de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"remove_weapon_chest\":{\"label\":\"Retirer une arme dans le coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"open_coffre\":{\"label\":\"Ouvrir le coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"withdraw_cash_coffre\":{\"label\":\"Retirer de l\'argent dans le coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"weapons_chest_society\":{\"label\":\"Arme(s) du coffre de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"rename_label_grade\":{\"label\":\"Changer le label d\'un grade\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"chest\":{\"label\":\"Accéder au coffre de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"unmote_player\":{\"label\":\"Descendre un employé\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":true,\"grades\":{\"boss\":true},\"lieutenant\":[]},\"items_chest\":{\"label\":\"Items du coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"deposit_black_money_coffre\":{\"label\":\"Déposer de l\'argent sale dans le coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"manage_grades\":{\"label\":\"Gérer les grades de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"open_boss\":{\"label\":\"Ouvrir le menu boss\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"delete_grade\":{\"label\":\"Supprimer un grade\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"items_chest:society\":{\"label\":\"Item(s) du coffre de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"weapons_chest\":{\"label\":\"Armes du coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"promote_player\":{\"label\":\"Augmenter un employé\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":true,\"grades\":{\"boss\":true},\"lieutenant\":[]},\"manage_employeds\":{\"label\":\"Gérer les employés de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"recruit_player\":{\"label\":\"Recruté un joueur\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"editClothes\":{\"label\":\"Gérer les tenues dans le vestiaire\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"deposit_item_chest\":{\"label\":\"Déposer un item dans le coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"remove_item_chest_society\":{\"label\":\"Retirer un item dans le coffre de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"demote_player\":{\"label\":\"Virer un employé\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"change_permissions_grade\":{\"label\":\"Changer les permissions d\'un grade\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"rename_grade\":{\"label\":\"Changer le nom d\'un grade\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"deposit_money_society\":{\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"withdraw_black_money_coffre\":{\"label\":\"Retirer de l\'argent sale dans le coffre\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"change_number_grade\":{\"label\":\"Changer le numéro d\'un grade\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"dposit_item_chest_society\":{\"label\":\"Déposer un item dans le coffre de la société\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]},\"create_grade\":{\"label\":\"Créer un grade\",\"boss\":true,\"Commander\":true,\"Under Sheriff\":[],\"grades\":{\"boss\":true},\"lieutenant\":[]}}', '{\"x\":1852.9539794921876,\"y\":3690.775146484375,\"z\":34.21355438232422}', '{\"x\":1847.8760986328126,\"y\":3695.2216796875,\"z\":38.22046279907226}', '{\"active\":true,\"color\":47,\"sprite\":60,\"position\":{\"x\":1855.294677734375,\"y\":3683.089599609375,\"z\":34.26976013183594}}', '0', 1, '[{\"grade\":true,\"name\":\"Trainee\",\"grades\":{\"cadet\":\"cadet\"},\"data\":{\"eyebrows_1\":0,\"glasses_1\":0,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"glasses_2\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"face_color\":0,\"dad\":37,\"hair_color_2\":29,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":0,\"makeup_4\":0,\"helmet_1\":306,\"blemishes_2\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":902,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":33,\"lip_thickness\":0,\"jaw_1\":0,\"arms_2\":0,\"bproof_2\":0,\"neck_thickness\":0,\"bodyb_1\":-1,\"blush_2\":0,\"blemishes_1\":0,\"moles_2\":0,\"cheeks_2\":0,\"watches_1\":-1,\"cheeks_3\":0,\"decals_2\":0,\"nose_6\":0,\"arms\":22,\"mask_1\":0,\"chest_1\":0,\"lipstick_2\":0,\"makeup_3\":0,\"complexion_2\":0,\"shoes_1\":25,\"blush_3\":0,\"beard_3\":0,\"torso_2\":0,\"nose_3\":0,\"hair_2\":0,\"chin_4\":0,\"tshirt_1\":284,\"makeup_1\":0,\"hair_1\":79,\"cheeks_1\":0,\"bracelets_2\":0,\"watches_2\":0,\"face_md_weight\":0,\"bracelets_1\":-1,\"pants_2\":6,\"chain_1\":194,\"complexion_1\":0,\"eyebrows_4\":0,\"chain_2\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"bproof_1\":10,\"nose_2\":0,\"eyebrows_2\":10,\"chest_3\":0,\"bodyb_3\":-1,\"nose_1\":0,\"bags_1\":191,\"eyebrows_3\":0,\"ears_2\":0,\"chin_3\":0,\"eyebrows_5\":0,\"moles_1\":0,\"lipstick_4\":0,\"sun_2\":0,\"helmet_2\":1,\"bags_2\":0,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"hair_color_1\":0,\"pants_1\":341,\"decals_1\":0}},{\"grade\":true,\"name\":\"V.I.R\",\"grades\":{\"officier2\":\"officier2\",\"boss\":\"boss\",\"sergent2\":\"sergent2\",\"officier3\":\"officier3\",\"capitaine\":\"capitaine\",\"lieutenant\":\"lieutenant\",\"Commander\":\"Commander\",\"sergent1\":\"sergent1\",\"officier1\":\"officier1\",\"Under Sheriff\":\"Under Sheriff\",\"officierprincipal \":\"officierprincipal \",\"cadet\":\"cadet\"},\"data\":{\"eyebrows_1\":33,\"glasses_1\":4,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"glasses_2\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"face_color\":0,\"dad\":21,\"hair_color_2\":0,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":0,\"makeup_3\":0,\"helmet_1\":13,\"blemishes_2\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":897,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":0,\"lip_thickness\":3,\"jaw_1\":7,\"arms_2\":0,\"bproof_2\":0,\"neck_thickness\":0,\"bodyb_1\":0,\"blush_2\":0,\"bags_2\":0,\"moles_2\":0,\"hair_color_1\":0,\"watches_1\":3,\"cheeks_3\":0,\"decals_2\":0,\"eyebrows_5\":0,\"arms\":33,\"mask_1\":0,\"chest_1\":0,\"lipstick_2\":0,\"nose_1\":1,\"complexion_2\":0,\"shoes_1\":24,\"blush_3\":0,\"nose_6\":0,\"torso_2\":6,\"nose_3\":0,\"cheeks_2\":0,\"chin_4\":0,\"tshirt_1\":288,\"makeup_1\":0,\"hair_1\":45,\"cheeks_1\":0,\"bracelets_2\":0,\"watches_2\":0,\"face_md_weight\":0,\"bracelets_1\":-1,\"pants_2\":0,\"makeup_4\":0,\"complexion_1\":0,\"eyebrows_4\":0,\"chain_2\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"beard_3\":0,\"nose_2\":0,\"bags_1\":0,\"chest_3\":0,\"bodyb_3\":-1,\"chin_3\":0,\"hair_2\":0,\"eyebrows_3\":0,\"ears_2\":0,\"bproof_1\":80,\"moles_1\":0,\"lipstick_4\":0,\"beard_1\":11,\"sun_2\":0,\"helmet_2\":0,\"blemishes_1\":0,\"shoes_2\":0,\"beard_2\":10,\"chain_1\":219,\"eyebrows_2\":10,\"pants_1\":31,\"decals_1\":0}},{\"grade\":true,\"name\":\"Supervisor\",\"grades\":{\"capitaine\":\"capitaine\",\"Under Sheriff\":\"Under Sheriff\",\"Commander\":\"Commander\",\"boss\":\"boss\",\"sergent2\":\"sergent2\",\"lieutenant\":\"lieutenant\",\"sergent1\":\"sergent1\"},\"data\":{\"eyebrows_1\":33,\"glasses_1\":4,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"glasses_2\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"face_color\":0,\"dad\":21,\"hair_color_2\":0,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":0,\"makeup_3\":0,\"helmet_1\":286,\"blemishes_2\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":902,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":0,\"lip_thickness\":3,\"jaw_1\":7,\"arms_2\":0,\"bproof_2\":0,\"neck_thickness\":0,\"bodyb_1\":0,\"blush_2\":0,\"bags_2\":0,\"moles_2\":0,\"hair_color_1\":0,\"watches_1\":3,\"cheeks_3\":0,\"decals_2\":0,\"eyebrows_5\":0,\"arms\":27,\"mask_1\":0,\"chest_1\":0,\"lipstick_2\":0,\"nose_1\":1,\"complexion_2\":0,\"shoes_1\":25,\"blush_3\":0,\"nose_6\":0,\"torso_2\":0,\"nose_3\":0,\"cheeks_2\":0,\"chin_4\":0,\"tshirt_1\":288,\"makeup_1\":0,\"hair_1\":45,\"cheeks_1\":0,\"bracelets_2\":0,\"watches_2\":0,\"face_md_weight\":0,\"bracelets_1\":-1,\"pants_2\":0,\"makeup_4\":0,\"complexion_1\":0,\"eyebrows_4\":0,\"chain_2\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"beard_3\":0,\"nose_2\":0,\"bags_1\":0,\"chest_3\":0,\"bodyb_3\":-1,\"chin_3\":0,\"hair_2\":0,\"eyebrows_3\":0,\"ears_2\":0,\"bproof_1\":115,\"moles_1\":0,\"lipstick_4\":0,\"beard_1\":11,\"sun_2\":0,\"helmet_2\":0,\"blemishes_1\":0,\"shoes_2\":0,\"beard_2\":10,\"chain_1\":194,\"eyebrows_2\":10,\"pants_1\":49,\"decals_1\":0}},{\"grade\":true,\"name\":\"Corp de Commandemant\",\"grades\":{\"capitaine\":\"capitaine\",\"Under Sheriff\":\"Under Sheriff\",\"Commander\":\"Commander\",\"boss\":\"boss\",\"lieutenant\":\"lieutenant\"},\"data\":{\"eyebrows_1\":33,\"glasses_1\":4,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"glasses_2\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"face_color\":0,\"dad\":21,\"hair_color_2\":0,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":0,\"makeup_3\":0,\"helmet_1\":13,\"blemishes_2\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":902,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":0,\"lip_thickness\":3,\"jaw_1\":7,\"arms_2\":0,\"bproof_2\":0,\"neck_thickness\":0,\"bodyb_1\":0,\"blush_2\":0,\"bags_2\":0,\"moles_2\":0,\"hair_color_1\":0,\"watches_1\":3,\"cheeks_3\":0,\"decals_2\":0,\"eyebrows_5\":0,\"arms\":27,\"mask_1\":0,\"chest_1\":0,\"lipstick_2\":0,\"nose_1\":1,\"complexion_2\":0,\"shoes_1\":25,\"blush_3\":0,\"nose_6\":0,\"torso_2\":0,\"nose_3\":0,\"cheeks_2\":0,\"chin_4\":0,\"tshirt_1\":288,\"makeup_1\":0,\"hair_1\":45,\"cheeks_1\":0,\"bracelets_2\":0,\"watches_2\":0,\"face_md_weight\":0,\"bracelets_1\":-1,\"pants_2\":0,\"makeup_4\":0,\"complexion_1\":0,\"eyebrows_4\":0,\"chain_2\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"beard_3\":0,\"nose_2\":0,\"bags_1\":0,\"chest_3\":0,\"bodyb_3\":-1,\"chin_3\":0,\"hair_2\":0,\"eyebrows_3\":0,\"ears_2\":0,\"bproof_1\":115,\"moles_1\":0,\"lipstick_4\":0,\"beard_1\":11,\"sun_2\":0,\"helmet_2\":0,\"blemishes_1\":0,\"shoes_2\":0,\"beard_2\":10,\"chain_1\":194,\"eyebrows_2\":10,\"pants_1\":49,\"decals_1\":0}},{\"grade\":true,\"name\":\"Etat Major\",\"grades\":{\"boss\":\"boss\",\"Under Sheriff\":\"Under Sheriff\",\"Commander\":\"Commander\"},\"data\":{\"eyebrows_1\":33,\"glasses_1\":4,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"glasses_2\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"face_color\":0,\"dad\":21,\"hair_color_2\":0,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":0,\"makeup_3\":0,\"helmet_1\":13,\"blemishes_2\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":902,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":0,\"lip_thickness\":3,\"jaw_1\":7,\"arms_2\":0,\"bproof_2\":0,\"neck_thickness\":0,\"bodyb_1\":0,\"blush_2\":0,\"bags_2\":0,\"moles_2\":0,\"hair_color_1\":0,\"watches_1\":3,\"cheeks_3\":0,\"decals_2\":0,\"eyebrows_5\":0,\"arms\":82,\"mask_1\":0,\"chest_1\":0,\"lipstick_2\":0,\"nose_1\":1,\"complexion_2\":0,\"shoes_1\":25,\"blush_3\":0,\"nose_6\":0,\"torso_2\":0,\"nose_3\":0,\"cheeks_2\":0,\"chin_4\":0,\"tshirt_1\":288,\"makeup_1\":0,\"hair_1\":45,\"cheeks_1\":0,\"bracelets_2\":0,\"watches_2\":0,\"face_md_weight\":0,\"bracelets_1\":-1,\"pants_2\":0,\"makeup_4\":0,\"complexion_1\":0,\"eyebrows_4\":0,\"chain_2\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"beard_3\":0,\"nose_2\":0,\"bags_1\":0,\"chest_3\":0,\"bodyb_3\":-1,\"chin_3\":0,\"hair_2\":0,\"eyebrows_3\":0,\"ears_2\":0,\"bproof_1\":0,\"moles_1\":0,\"lipstick_4\":0,\"beard_1\":11,\"sun_2\":0,\"helmet_2\":0,\"blemishes_1\":0,\"shoes_2\":0,\"beard_2\":10,\"chain_1\":194,\"eyebrows_2\":10,\"pants_1\":25,\"decals_1\":0}},{\"grade\":true,\"name\":\"Ceremonie\",\"grades\":{\"officier2\":\"officier2\",\"boss\":\"boss\",\"sergent2\":\"sergent2\",\"officier3\":\"officier3\",\"capitaine\":\"capitaine\",\"lieutenant\":\"lieutenant\",\"Commander\":\"Commander\",\"sergent1\":\"sergent1\",\"officier1\":\"officier1\",\"Under Sheriff\":\"Under Sheriff\",\"officierprincipal \":\"officierprincipal \",\"cadet\":\"cadet\"},\"data\":{\"eyebrows_1\":33,\"glasses_1\":4,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"glasses_2\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"face_color\":0,\"dad\":21,\"hair_color_2\":0,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":0,\"makeup_3\":0,\"helmet_1\":13,\"blemishes_2\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":902,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":0,\"lip_thickness\":3,\"jaw_1\":7,\"arms_2\":0,\"bproof_2\":0,\"neck_thickness\":0,\"bodyb_1\":0,\"blush_2\":0,\"bags_2\":0,\"moles_2\":0,\"hair_color_1\":0,\"watches_1\":3,\"cheeks_3\":0,\"decals_2\":0,\"eyebrows_5\":0,\"arms\":82,\"mask_1\":0,\"chest_1\":0,\"lipstick_2\":0,\"nose_1\":1,\"complexion_2\":0,\"shoes_1\":25,\"blush_3\":0,\"nose_6\":0,\"torso_2\":0,\"nose_3\":0,\"cheeks_2\":0,\"chin_4\":0,\"tshirt_1\":288,\"makeup_1\":0,\"hair_1\":45,\"cheeks_1\":0,\"bracelets_2\":0,\"watches_2\":0,\"face_md_weight\":0,\"bracelets_1\":-1,\"pants_2\":0,\"makeup_4\":0,\"complexion_1\":0,\"eyebrows_4\":0,\"chain_2\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"beard_3\":0,\"nose_2\":0,\"bags_1\":0,\"chest_3\":0,\"bodyb_3\":-1,\"chin_3\":0,\"hair_2\":0,\"eyebrows_3\":0,\"ears_2\":0,\"bproof_1\":0,\"moles_1\":0,\"lipstick_4\":0,\"beard_1\":11,\"sun_2\":0,\"helmet_2\":0,\"blemishes_1\":0,\"shoes_2\":0,\"beard_2\":10,\"chain_1\":194,\"eyebrows_2\":10,\"pants_1\":25,\"decals_1\":0}},{\"grade\":true,\"name\":\"Corp des Officiers\",\"grades\":{\"officier2\":\"officier2\",\"boss\":\"boss\",\"sergent2\":\"sergent2\",\"officier3\":\"officier3\",\"capitaine\":\"capitaine\",\"lieutenant\":\"lieutenant\",\"officier1\":\"officier1\",\"Under Sheriff\":\"Under Sheriff\",\"officierprincipal \":\"officierprincipal \",\"sergent1\":\"sergent1\"},\"data\":{\"eyebrows_1\":33,\"glasses_1\":4,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"glasses_2\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"face_color\":0,\"dad\":21,\"hair_color_2\":0,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":0,\"makeup_3\":0,\"helmet_1\":286,\"blemishes_2\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":902,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":0,\"lip_thickness\":3,\"jaw_1\":7,\"arms_2\":0,\"bproof_2\":0,\"neck_thickness\":0,\"bodyb_1\":0,\"blush_2\":0,\"bags_2\":0,\"moles_2\":0,\"hair_color_1\":0,\"watches_1\":3,\"cheeks_3\":0,\"decals_2\":0,\"eyebrows_5\":0,\"arms\":27,\"mask_1\":0,\"chest_1\":0,\"lipstick_2\":0,\"nose_1\":1,\"complexion_2\":0,\"shoes_1\":25,\"blush_3\":0,\"nose_6\":0,\"torso_2\":0,\"nose_3\":0,\"cheeks_2\":0,\"chin_4\":0,\"tshirt_1\":288,\"makeup_1\":0,\"hair_1\":45,\"cheeks_1\":0,\"bracelets_2\":0,\"watches_2\":0,\"face_md_weight\":0,\"bracelets_1\":-1,\"pants_2\":0,\"makeup_4\":0,\"complexion_1\":0,\"eyebrows_4\":0,\"chain_2\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"beard_3\":0,\"nose_2\":0,\"bags_1\":0,\"chest_3\":0,\"bodyb_3\":-1,\"chin_3\":0,\"hair_2\":0,\"eyebrows_3\":0,\"ears_2\":0,\"bproof_1\":115,\"moles_1\":0,\"lipstick_4\":0,\"beard_1\":11,\"sun_2\":0,\"helmet_2\":0,\"blemishes_1\":0,\"shoes_2\":0,\"beard_2\":10,\"chain_1\":194,\"eyebrows_2\":10,\"pants_1\":49,\"decals_1\":0}},{\"grade\":true,\"name\":\"Trainee\",\"grades\":[],\"data\":{\"eyebrows_1\":0,\"glasses_1\":5,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"glasses_2\":1,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"dad\":0,\"hair_color_2\":29,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":0,\"makeup_4\":0,\"helmet_1\":306,\"nose_1\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":193,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"chin_2\":0,\"pants_1\":341,\"mom\":7,\"lip_thickness\":0,\"jaw_1\":0,\"arms_2\":0,\"bproof_2\":0,\"neck_thickness\":0,\"bodyb_1\":-1,\"blush_2\":0,\"bags_2\":0,\"moles_2\":0,\"hair_color_1\":0,\"watches_1\":-1,\"cheeks_3\":0,\"decals_2\":0,\"makeup_3\":0,\"arms\":22,\"mask_1\":0,\"chest_1\":0,\"lipstick_2\":0,\"complexion_1\":0,\"complexion_2\":0,\"shoes_1\":25,\"blush_3\":0,\"chin_4\":0,\"torso_2\":1,\"nose_3\":0,\"tshirt_1\":284,\"bracelets_2\":0,\"bproof_1\":10,\"makeup_1\":0,\"hair_1\":79,\"cheeks_1\":0,\"face_md_weight\":50,\"watches_2\":0,\"bags_1\":191,\"bracelets_1\":-1,\"pants_2\":6,\"hair_2\":0,\"chin_1\":0,\"eyebrows_4\":0,\"chain_2\":2,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"beard_3\":0,\"nose_2\":0,\"eyebrows_2\":0,\"chest_3\":0,\"bodyb_3\":-1,\"chin_3\":0,\"eyebrows_5\":0,\"eyebrows_3\":0,\"ears_2\":0,\"moles_1\":0,\"blemishes_2\":0,\"beard_1\":0,\"lipstick_4\":0,\"sun_2\":0,\"blemishes_1\":0,\"helmet_2\":1,\"shoes_2\":0,\"beard_2\":0,\"chain_1\":10,\"cheeks_2\":0,\"nose_6\":0,\"decals_1\":0}},{\"grade\":true,\"name\":\"ERT Intervention\",\"data\":{\"shoes_1\":25,\"glasses_1\":5,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"glasses_2\":1,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"dad\":0,\"hair_color_2\":26,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":13,\"makeup_3\":0,\"helmet_1\":231,\"blemishes_2\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":579,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":20,\"lip_thickness\":0,\"jaw_1\":0,\"arms_2\":0,\"beard_1\":0,\"neck_thickness\":0,\"bodyb_1\":-1,\"eyebrows_5\":0,\"blemishes_1\":0,\"moles_2\":0,\"cheeks_2\":0,\"watches_1\":-1,\"cheeks_3\":0,\"decals_2\":0,\"nose_1\":0,\"eyebrows_2\":0,\"watches_2\":0,\"chest_1\":0,\"lipstick_2\":0,\"arms\":179,\"complexion_2\":0,\"chain_1\":194,\"blush_3\":0,\"bags_1\":191,\"nose_6\":0,\"nose_3\":0,\"hair_2\":0,\"lipstick_4\":0,\"pants_1\":261,\"makeup_1\":0,\"hair_1\":79,\"cheeks_1\":0,\"decals_1\":0,\"mask_1\":169,\"makeup_4\":0,\"bracelets_1\":-1,\"pants_2\":1,\"bags_2\":0,\"eyebrows_4\":0,\"chin_4\":0,\"chin_3\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"eyebrows_1\":0,\"nose_2\":0,\"chain_2\":0,\"chest_3\":0,\"bodyb_3\":-1,\"helmet_2\":1,\"torso_2\":2,\"eyebrows_3\":0,\"ears_2\":0,\"complexion_1\":0,\"hair_color_1\":0,\"bproof_2\":0,\"bproof_1\":116,\"sun_2\":0,\"bracelets_2\":0,\"blush_2\":0,\"shoes_2\":0,\"beard_2\":0,\"face_md_weight\":50,\"beard_3\":0,\"moles_1\":0,\"tshirt_1\":247},\"grades\":{\"officier3\":\"officier3\"}},{\"grade\":false,\"name\":\"ERTV2\",\"data\":{\"shoes_1\":25,\"glasses_1\":5,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"glasses_2\":1,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"dad\":0,\"hair_color_2\":26,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":13,\"makeup_3\":0,\"helmet_1\":231,\"blemishes_2\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":579,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":0,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":20,\"lip_thickness\":0,\"jaw_1\":0,\"arms_2\":0,\"beard_1\":0,\"neck_thickness\":0,\"bodyb_1\":-1,\"eyebrows_5\":0,\"blemishes_1\":0,\"moles_2\":0,\"cheeks_2\":0,\"watches_1\":-1,\"cheeks_3\":0,\"decals_2\":0,\"nose_1\":0,\"eyebrows_2\":0,\"watches_2\":0,\"chest_1\":0,\"lipstick_2\":0,\"arms\":179,\"complexion_2\":0,\"chain_1\":194,\"blush_3\":0,\"bags_1\":191,\"nose_6\":0,\"nose_3\":0,\"hair_2\":0,\"lipstick_4\":0,\"pants_1\":261,\"makeup_1\":0,\"hair_1\":79,\"cheeks_1\":0,\"decals_1\":0,\"mask_1\":169,\"makeup_4\":0,\"bracelets_1\":-1,\"pants_2\":1,\"bags_2\":0,\"eyebrows_4\":0,\"chin_4\":0,\"chin_3\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"eyebrows_1\":0,\"nose_2\":0,\"chain_2\":0,\"chest_3\":0,\"bodyb_3\":-1,\"helmet_2\":1,\"torso_2\":2,\"eyebrows_3\":0,\"ears_2\":0,\"complexion_1\":0,\"hair_color_1\":0,\"bproof_2\":0,\"bproof_1\":116,\"sun_2\":0,\"bracelets_2\":0,\"blush_2\":0,\"shoes_2\":0,\"beard_2\":0,\"face_md_weight\":50,\"beard_3\":0,\"moles_1\":0,\"tshirt_1\":247},\"grades\":[]}]', '{\"x\":1852.7691650390626,\"y\":3688.220947265625,\"z\":29.81854057312011}'),
(60, 'ambulance', 'EMS', '{\"accounts\":{\"society\":5558600,\"black_money\":0,\"cash\":0},\"weapons_boss\":[],\"weapons\":[],\"items_boss\":{\"bread\":{\"count\":196,\"label\":\"Pain\",\"name\":\"bread\"},\"water\":{\"count\":207,\"label\":\"Eau\",\"name\":\"water\"}},\"items\":{\"water\":{\"count\":9,\"label\":\"Eau\",\"name\":\"water\"},\"burgershot_cookie\":{\"count\":38,\"label\":\"Cookie\",\"name\":\"burgershot_cookie\"},\"bread\":{\"count\":9,\"label\":\"Pain\",\"name\":\"bread\"},\"lapin\":{\"count\":2,\"label\":\"Lapin\",\"name\":\"lapin\"},\"pearls_moulefrite\":{\"count\":40,\"label\":\"Moule Frite\",\"name\":\"pearls_moulefrite\"}}}', '{\"manage_employeds\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Gérer les employés de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":true,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"dposit_item_chest_society\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Déposer un item dans le coffre de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"change_permissions_grade\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Changer les permissions d\'un grade\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"manage_grades\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Gérer les grades de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"deposit_item_chest\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Déposer un item dans le coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":true,\"Praktikant EMS\":false},\"deposit_weapon_chest\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Déposer une arme dans le coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"withdraw_money_society\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"deposit_money_society\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"items_chest\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Items du coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":true,\"Praktikant EMS\":false},\"rename_label_grade\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Changer le label d\'un grade\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"withdraw_black_money_coffre\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"remove_weapon_chest_society\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"remove_item_chest\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Retirer un item dans le coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":true,\"Praktikant EMS\":false},\"weapons_chest_society\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Arme(s) du coffre de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"items_chest:society\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Item(s) du coffre de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"chest\":{\"boss\":true,\"president\":true,\"medecin chef\":true,\"label\":\"Accéder au coffre de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"create_grade\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Créer un grade\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"remove_weapon_chest\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Retirer une arme dans le coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"demote_player\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Virer un employé\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":true,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"open_boss\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Ouvrir le menu boss\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"deposit_cash_coffre\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Déposer de l\'argent dans le coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"deposit_weapon_chest_society\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Déposer une arme dans le coffre de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"withdraw_cash_coffre\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"editClothes\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Gérer les tenues dans le vestiaire\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"unmote_player\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Descendre un employé\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":true,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"remove_item_chest_society\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"weapons_chest\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Armes du coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"change_salary_grade\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Changer le salaire d\'un grade\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"deposit_black_money_coffre\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"rename_grade\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Changer le nom d\'un grade\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"open_coffre\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Ouvrir le coffre\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":true,\"Praktikant EMS\":false},\"change_number_grade\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Changer le numéro d\'un grade\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"promote_player\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Augmenter un employé\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":true,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false},\"recruit_player\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Recruté un joueur\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":true,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":true,\"Praktikant EMS\":false},\"delete_grade\":{\"boss\":true,\"president\":true,\"medecin chef\":false,\"label\":\"Supprimer un grade\",\"directeur\":[],\"grades\":{\"boss\":true},\"Médecin Chef\":false,\"Aide Soignant\":false,\"Infirmier\":false,\"rh\":false,\"Praktikant EMS\":false}}', '{\"x\":-481.3997192382813,\"z\":33.6893081665039,\"y\":-1005.3652954101564}', '{\"x\":-485.8601379394531,\"z\":33.68928527832031,\"y\":-1002.9920043945313}', '{\"active\":true,\"position\":{\"x\":-493.1570434570313,\"z\":24.28947448730468,\"y\":-983.519287109375},\"sprite\":61,\"color\":3}', '10000', 1, '[{\"name\":\"EMS HOMME\",\"data\":{\"complexion_2\":0,\"nose_3\":0,\"blush_3\":0,\"pants_2\":0,\"cheeks_1\":2,\"decals_2\":0,\"face_md_weight\":49,\"watches_1\":3,\"nose_5\":0,\"skin_md_weight\":49,\"eyebrows_5\":0,\"eyebrows_4\":0,\"chest_3\":0,\"tshirt_2\":0,\"glasses_1\":5,\"makeup_4\":0,\"eyebrows_3\":0,\"chin_2\":2,\"sun_1\":0,\"pants_1\":7,\"helmet_2\":0,\"nose_4\":3,\"hair_1\":79,\"chain_2\":0,\"bproof_1\":0,\"ears_1\":-1,\"beard_4\":0,\"age_2\":0,\"eyebrows_2\":10,\"blemishes_2\":0,\"chin_3\":3,\"bags_2\":0,\"bodyb_1\":-1,\"hair_color_1\":0,\"lip_thickness\":9,\"blush_1\":0,\"beard_2\":10,\"bodyb_4\":0,\"eye_color\":0,\"moles_2\":0,\"makeup_3\":0,\"chain_1\":0,\"decals_1\":0,\"eyebrows_6\":0,\"lipstick_3\":0,\"jaw_1\":3,\"helmet_1\":-1,\"bproof_2\":2,\"cheeks_2\":3,\"sex\":0,\"chest_1\":0,\"moles_1\":0,\"chest_2\":0,\"beard_1\":3,\"watches_2\":0,\"lipstick_2\":0,\"tshirt_1\":0,\"eye_squint\":0,\"makeup_2\":0,\"sun_2\":0,\"lipstick_4\":0,\"mask_1\":0,\"arms_2\":0,\"shoes_1\":7,\"complexion_1\":0,\"torso_2\":0,\"arms\":1,\"mask_2\":0,\"bracelets_1\":-1,\"glasses_2\":1,\"nose_1\":1,\"hair_2\":0,\"cheeks_3\":0,\"nose_2\":7,\"bodyb_2\":0,\"lipstick_1\":0,\"dad\":10,\"mom\":0,\"nose_6\":0,\"shoes_2\":0,\"chin_4\":1,\"eyebrows_1\":1,\"chin_1\":4,\"torso_1\":897,\"beard_3\":0,\"blush_2\":0,\"bracelets_2\":0,\"neck_thickness\":2,\"bags_1\":0,\"age_1\":0,\"bodyb_3\":-1,\"blemishes_1\":0,\"makeup_1\":0,\"hair_color_2\":0,\"ears_2\":0,\"jaw_2\":2},\"grades\":[],\"grade\":false},{\"name\":\"ems femme interne\",\"grades\":[],\"data\":{\"complexion_2\":0,\"nose_3\":9,\"neck_thickness\":0,\"lipstick_4\":0,\"cheeks_1\":2,\"decals_2\":0,\"face_md_weight\":78,\"watches_1\":-1,\"nose_5\":4,\"skin_md_weight\":50,\"eyebrows_5\":0,\"torso_2\":0,\"chest_3\":0,\"tshirt_2\":0,\"glasses_1\":66,\"makeup_4\":0,\"face_color\":0,\"chin_2\":0,\"sun_1\":0,\"pants_1\":322,\"helmet_2\":0,\"nose_4\":8,\"hair_1\":219,\"chain_2\":0,\"bproof_1\":0,\"ears_1\":25,\"chest_2\":0,\"age_2\":0,\"lipstick_2\":0,\"watches_2\":0,\"chin_3\":0,\"bags_2\":0,\"bodyb_1\":-1,\"hair_color_1\":5,\"lip_thickness\":2,\"blush_1\":0,\"beard_2\":0,\"bodyb_4\":0,\"hair_color_2\":29,\"shoes_1\":222,\"moles_2\":6,\"makeup_3\":0,\"arms_2\":0,\"decals_1\":0,\"glasses_2\":0,\"lipstick_1\":0,\"jaw_1\":0,\"helmet_1\":-1,\"bproof_2\":0,\"cheeks_2\":0,\"sex\":1,\"chest_1\":0,\"moles_1\":0,\"chin_1\":0,\"age_1\":0,\"eyebrows_4\":0,\"eyebrows_3\":0,\"tshirt_1\":2,\"eye_squint\":0,\"makeup_2\":0,\"eye_color\":15,\"blemishes_2\":0,\"sun_2\":0,\"blemishes_1\":0,\"beard_1\":0,\"complexion_1\":0,\"chin_4\":0,\"pants_2\":0,\"mask_2\":0,\"mask_1\":0,\"dad\":30,\"nose_1\":0,\"hair_2\":0,\"lipstick_3\":0,\"nose_2\":5,\"bodyb_2\":0,\"bracelets_1\":-1,\"chain_1\":321,\"mom\":30,\"nose_6\":0,\"shoes_2\":0,\"eyebrows_2\":0,\"eyebrows_1\":0,\"beard_4\":0,\"torso_1\":950,\"beard_3\":0,\"blush_3\":0,\"bracelets_2\":0,\"blush_2\":0,\"bags_1\":0,\"cheeks_3\":2,\"bodyb_3\":-1,\"eyebrows_6\":0,\"makeup_1\":0,\"arms\":14,\"ears_2\":0,\"jaw_2\":0},\"grade\":false},{\"name\":\"Ems femme externe\",\"grades\":[],\"data\":{\"complexion_2\":0,\"nose_3\":9,\"neck_thickness\":0,\"lipstick_4\":0,\"cheeks_1\":2,\"decals_2\":0,\"face_md_weight\":78,\"watches_1\":-1,\"nose_5\":4,\"skin_md_weight\":50,\"eyebrows_5\":0,\"torso_2\":0,\"chest_3\":0,\"tshirt_2\":0,\"glasses_1\":66,\"makeup_4\":0,\"face_color\":0,\"chin_2\":0,\"sun_1\":0,\"pants_1\":341,\"helmet_2\":0,\"nose_4\":8,\"hair_1\":219,\"chain_2\":0,\"bproof_1\":0,\"ears_1\":25,\"chest_2\":0,\"age_2\":0,\"lipstick_2\":0,\"watches_2\":0,\"chin_3\":0,\"bags_2\":0,\"bodyb_1\":-1,\"hair_color_1\":5,\"lip_thickness\":2,\"blush_1\":0,\"beard_2\":0,\"bodyb_4\":0,\"hair_color_2\":29,\"shoes_1\":149,\"moles_2\":6,\"makeup_3\":0,\"arms_2\":0,\"decals_1\":0,\"glasses_2\":0,\"lipstick_1\":0,\"jaw_1\":0,\"helmet_1\":-1,\"bproof_2\":0,\"cheeks_2\":0,\"sex\":1,\"chest_1\":0,\"moles_1\":0,\"chin_1\":0,\"age_1\":0,\"eyebrows_4\":0,\"eyebrows_3\":0,\"tshirt_1\":69,\"eye_squint\":0,\"makeup_2\":0,\"eye_color\":15,\"blemishes_2\":0,\"sun_2\":0,\"blemishes_1\":0,\"beard_1\":0,\"complexion_1\":0,\"chin_4\":0,\"pants_2\":5,\"mask_2\":0,\"mask_1\":0,\"dad\":30,\"nose_1\":0,\"hair_2\":0,\"lipstick_3\":0,\"nose_2\":5,\"bodyb_2\":0,\"bracelets_1\":-1,\"chain_1\":321,\"mom\":30,\"nose_6\":0,\"shoes_2\":2,\"eyebrows_2\":0,\"eyebrows_1\":0,\"beard_4\":0,\"torso_1\":1087,\"beard_3\":0,\"blush_3\":0,\"bracelets_2\":0,\"blush_2\":0,\"bags_1\":0,\"cheeks_3\":2,\"bodyb_3\":-1,\"eyebrows_6\":0,\"makeup_1\":0,\"arms\":1,\"ears_2\":0,\"jaw_2\":0},\"grade\":false}]', '{\"x\":-481.5459289550781,\"z\":33.67815399169922,\"y\":-1011.929931640625}'),
(61, 'restau_burgershot', 'Burger Shot', '{\"accounts\":{\"black_money\":0,\"cash\":0,\"society\":15000},\"weapons\":[],\"weapons_boss\":[],\"items\":[],\"items_boss\":[]}', '{\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true}}', '{\"x\":-1196.744873046875,\"y\":-901.7516479492188,\"z\":13.8861608505249}', '{\"x\":-1199.842041015625,\"y\":-902.7513427734375,\"z\":13.88615703582763}', '{\"sprite\":106,\"color\":1,\"position\":{\"y\":-889.5091552734375,\"z\":13.79837894439697,\"x\":-1191.08642578125},\"active\":true}', '0', 1, '[]', '{\"x\":-1203.8621826171876,\"y\":-894.0457763671875,\"z\":13.88615131378173}'),
(63, 'bar_unicorn', 'Unicorn', '{\"weapons_boss\":[],\"items_boss\":[],\"accounts\":{\"cash\":0,\"society\":15000,\"black_money\":0},\"items\":[],\"weapons\":[]}', '{\"change_number_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"editClothes\":{\"boss\":true}}', '{\"x\":106.642578125,\"y\":-1299.41162109375,\"z\":28.76897048950195}', '{\"x\":108.66100311279297,\"y\":-1305.61962890625,\"z\":28.76774215698242}', '{\"sprite\":121,\"active\":true,\"position\":{\"x\":125.80050659179688,\"y\":-1295.0428466796876,\"z\":29.25549507141113},\"color\":7}', '0', 1, '[]', '{\"x\":109.80492401123049,\"y\":-1305.447998046875,\"z\":29.25551033020019}'),
(64, 'vangelico', 'Vangelico', '{\"items\":[],\"weapons_boss\":[],\"accounts\":{\"black_money\":0,\"society\":2725,\"cash\":0},\"weapons\":[],\"items_boss\":[]}', '{\"promote_player\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true}}', '{\"x\":-630.5894165039063,\"y\":-229.51231384277345,\"z\":38.05705642700195}', '{\"x\":-629.0260009765625,\"y\":-228.1563720703125,\"z\":38.05705642700195}', '{\"position\":{\"x\":-624.469482421875,\"y\":-232.24172973632813,\"z\":38.05701446533203},\"active\":true,\"sprite\":285,\"color\":0}', '1', 0, '[]', '\"none\"'),
(65, 'restau_pops', 'Pop\'s Diner', NULL, '{\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"chest\":{\"boss\":true}}', '{\"x\":1590.5518798828126,\"y\":6457.84765625,\"z\":26.01401901245117}', '{\"x\":1595.6212158203126,\"y\":6454.04931640625,\"z\":26.01402854919433}', '{\"active\":true,\"position\":{\"x\":1589.105712890625,\"y\":6456.9365234375,\"z\":26.01401138305664},\"color\":1,\"sprite\":267}', '0', 0, '[]', '\"none\"');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(67, 'restau_pearls', 'Pearls', '{\"weapons_boss\":[],\"items_boss\":{\"762mm\":{\"name\":\"762mm\",\"label\":\"7.62mm Munition\",\"count\":97}},\"accounts\":{\"cash\":0,\"society\":35360,\"black_money\":0},\"items\":{\"pearls_moule\":{\"name\":\"pearls_moule\",\"label\":\"Moule\",\"count\":58},\"burgershot_biere\":{\"name\":\"burgershot_biere\",\"label\":\"Bière\",\"count\":275},\"water\":{\"name\":\"water\",\"label\":\"Eau\",\"count\":508},\"pops_sauce\":{\"name\":\"pops_sauce\",\"label\":\"Sauce\",\"count\":197},\"pearls_fishandchips\":{\"name\":\"pearls_fishandchips\",\"label\":\"Fish And Chips\",\"count\":79},\"burgershot_cookie\":{\"name\":\"burgershot_cookie\",\"label\":\"Cookie\",\"count\":858},\"pearls_frite\":{\"name\":\"pearls_frite\",\"label\":\"Frite\",\"count\":55},\"pearls_crevette\":{\"name\":\"pearls_crevette\",\"label\":\"Crevette\",\"count\":320},\"pearls_moulefrite\":{\"name\":\"pearls_moulefrite\",\"label\":\"Moule Frite\",\"count\":139},\"burgershot_sprite\":{\"name\":\"burgershot_sprite\",\"label\":\"Sprite\",\"count\":274},\"pearls_fish\":{\"name\":\"pearls_fish\",\"label\":\"Poisson\",\"count\":157}},\"weapons\":[]}', '{\"change_number_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"change_permissions_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"deposit_cash_coffre\":{\"boss\":true,\"sous-boss\":true,\"employed\":false},\"deposit_money_society\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"remove_item_chest_society\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"rename_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"recruit_player\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"deposit_weapon_chest\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"delete_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"withdraw_black_money_coffre\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"remove_weapon_chest_society\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"unmote_player\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"rename_label_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"withdraw_money_society\":{\"boss\":true,\"sous-boss\":true,\"employed\":false},\"items_chest\":{\"boss\":true,\"sous-boss\":[],\"employed\":true},\"manage_employeds\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"change_salary_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"open_coffre\":{\"boss\":true,\"sous-boss\":true,\"employed\":true},\"deposit_black_money_coffre\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"manage_grades\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"withdraw_cash_coffre\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"deposit_weapon_chest_society\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"create_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"remove_item_chest\":{\"boss\":true,\"sous-boss\":[],\"employed\":true},\"chest\":{\"boss\":true,\"sous-boss\":true,\"employed\":false},\"weapons_chest\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"open_boss\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"dposit_item_chest_society\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"items_chest:society\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"demote_player\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"weapons_chest_society\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"deposit_item_chest\":{\"boss\":true,\"sous-boss\":[],\"employed\":true},\"promote_player\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"remove_weapon_chest\":{\"boss\":true,\"sous-boss\":[],\"employed\":false},\"editClothes\":{\"boss\":true,\"sous-boss\":false,\"employed\":false}}', '{\"x\":-1839.0009765625,\"y\":-1191.259033203125,\"z\":14.32817363739013}', '{\"x\":-1835.8304443359376,\"y\":-1178.9268798828126,\"z\":14.32764530181884}', '{\"sprite\":729,\"active\":true,\"position\":{\"x\":-1815.684814453125,\"y\":-1192.265625,\"z\":14.30337715148925},\"color\":3}', '0', 1, '[{\"grades\":{\"boss\":\"boss\",\"employed\":\"employed\",\"sous-boss\":\"sous-boss\"},\"grade\":true,\"data\":{\"jaw_2\":0,\"decals_2\":0,\"blemishes_2\":0,\"blush_1\":0,\"chest_3\":0,\"torso_2\":15,\"nose_2\":0,\"beard_2\":10,\"chin_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"hair_1\":10,\"dad\":30,\"makeup_3\":0,\"mom\":0,\"sex\":0,\"ears_1\":0,\"sun_2\":0,\"eyebrows_6\":0,\"face_md_weight\":0,\"nose_1\":0,\"torso_1\":11,\"skin_md_weight\":50,\"lip_thickness\":0,\"nose_4\":0,\"chain_2\":0,\"lipstick_4\":0,\"mask_1\":0,\"blemishes_1\":0,\"ears_2\":0,\"makeup_1\":0,\"bodyb_4\":0,\"helmet_2\":0,\"bags_2\":0,\"chain_1\":0,\"chest_2\":0,\"lipstick_2\":0,\"sun_1\":0,\"complexion_2\":0,\"mask_2\":0,\"age_1\":0,\"jaw_1\":0,\"cheeks_1\":0,\"chin_3\":0,\"bodyb_1\":-1,\"helmet_1\":-1,\"complexion_1\":0,\"bodyb_3\":-1,\"face_color\":0,\"eye_color\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"glasses_1\":0,\"nose_6\":0,\"chest_1\":0,\"hair_color_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"moles_1\":0,\"beard_4\":0,\"bproof_1\":0,\"nose_3\":0,\"lipstick_1\":0,\"decals_1\":0,\"shoes_1\":21,\"age_2\":0,\"cheeks_3\":0,\"bracelets_2\":0,\"bags_1\":43,\"moles_2\":0,\"beard_3\":0,\"eyebrows_2\":10,\"bproof_2\":0,\"arms_2\":0,\"chin_4\":0,\"watches_2\":0,\"eyebrows_1\":33,\"blush_2\":0,\"hair_color_2\":0,\"shoes_2\":0,\"chin_1\":0,\"makeup_4\":0,\"cheeks_2\":0,\"eye_squint\":0,\"glasses_2\":0,\"blush_3\":0,\"pants_1\":20,\"tshirt_2\":0,\"eyebrows_5\":0,\"hair_2\":0,\"lipstick_3\":0,\"tshirt_1\":50,\"bracelets_1\":-1,\"beard_1\":14,\"nose_5\":0,\"watches_1\":-1,\"arms\":11},\"name\":\"PEARLS\"},{\"grades\":{\"boss\":\"boss\",\"employed\":\"employed\",\"sous-boss\":\"sous-boss\"},\"grade\":true,\"data\":{\"bodyb_3\":-1,\"decals_2\":0,\"blemishes_2\":0,\"blush_1\":0,\"chest_3\":0,\"torso_2\":12,\"nose_2\":5,\"beard_2\":0,\"chin_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"hair_1\":219,\"dad\":30,\"makeup_3\":0,\"mom\":30,\"sex\":1,\"ears_1\":25,\"sun_2\":0,\"eyebrows_6\":0,\"face_md_weight\":78,\"nose_1\":0,\"torso_1\":28,\"skin_md_weight\":50,\"beard_4\":0,\"nose_4\":8,\"chain_2\":0,\"lipstick_4\":0,\"mask_1\":0,\"blemishes_1\":0,\"ears_2\":0,\"makeup_1\":0,\"bodyb_4\":0,\"helmet_2\":0,\"bags_2\":0,\"chain_1\":321,\"beard_1\":0,\"lipstick_2\":0,\"sun_1\":0,\"complexion_2\":0,\"arms\":0,\"age_1\":0,\"chest_2\":0,\"cheeks_1\":2,\"eye_color\":15,\"lipstick_1\":0,\"jaw_2\":0,\"complexion_1\":0,\"bodyb_1\":-1,\"face_color\":0,\"lipstick_3\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"glasses_1\":66,\"nose_6\":0,\"cheeks_3\":2,\"hair_color_1\":5,\"chin_3\":0,\"eyebrows_4\":0,\"helmet_1\":-1,\"moles_1\":0,\"bproof_1\":0,\"nose_3\":9,\"makeup_4\":0,\"decals_1\":0,\"shoes_1\":221,\"age_2\":0,\"chin_4\":0,\"tshirt_1\":24,\"bags_1\":0,\"moles_2\":6,\"beard_3\":0,\"eyebrows_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"arms_2\":0,\"watches_2\":0,\"eyebrows_1\":0,\"blush_2\":0,\"hair_color_2\":29,\"shoes_2\":0,\"mask_2\":0,\"tshirt_2\":3,\"lip_thickness\":2,\"eye_squint\":0,\"glasses_2\":0,\"bracelets_2\":0,\"pants_1\":23,\"cheeks_2\":0,\"eyebrows_5\":0,\"hair_2\":0,\"chin_1\":0,\"watches_1\":-1,\"bracelets_1\":-1,\"chest_1\":0,\"nose_5\":4,\"jaw_1\":0,\"blush_3\":0},\"name\":\"pearl femme\"}]', '{\"x\":-1849.905029296875,\"y\":-1202.2021484375,\"z\":14.3282241821289}'),
(68, 'bar_wiwang', 'Wiwang', '{\"items\":{\"wiwang_ruinart\":{\"count\":95,\"label\":\"Ruinart\",\"name\":\"wiwang_ruinart\"},\"wiwang_vin\":{\"count\":100,\"label\":\"Vin\",\"name\":\"wiwang_vin\"},\"wiwang_cocktail\":{\"count\":100,\"label\":\"Cocktail Bora Bora\",\"name\":\"wiwang_cocktail\"},\"wiwang_macarons\":{\"count\":100,\"label\":\"Macarons\",\"name\":\"wiwang_macarons\"},\"wiwang_juspassion\":{\"count\":100,\"label\":\"Jus Passion Mangue\",\"name\":\"wiwang_juspassion\"},\"wiwang_caviar\":{\"count\":100,\"label\":\"Caviar\",\"name\":\"wiwang_caviar\"},\"wiwang_donperignon\":{\"count\":100,\"label\":\"Don Perignon\",\"name\":\"wiwang_donperignon\"}},\"accounts\":{\"society\":94325.01320818739,\"black_money\":0,\"cash\":0},\"weapons\":[],\"weapons_boss\":[],\"items_boss\":[]}', '{\"withdraw_cash_coffre\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"open_boss\":{\"boss\":true}}', '{\"y\":-687.7308959960938,\"x\":-815.381103515625,\"z\":123.41831970214844}', '{\"y\":-691.3907470703125,\"x\":-820.621826171875,\"z\":127.38679504394533}', '{\"color\":7,\"active\":true,\"sprite\":93,\"position\":{\"y\":-686.4660034179688,\"x\":-817.693603515625,\"z\":123.41832733154296}}', '1', 1, '[]', '{\"y\":-683.3983764648438,\"x\":-820.3956298828125,\"z\":123.4223403930664}'),
(69, 'bar_pacific', 'Pacific Bluffs', '{\"items\":{\"pacific_margarita\":{\"count\":50,\"label\":\"Margarita \",\"name\":\"pacific_margarita\"},\"pacific_brochettes\":{\"count\":28,\"label\":\"Brochettes de fruits frais\",\"name\":\"pacific_brochettes\"},\"pacific_chips\":{\"count\":50,\"label\":\"Chips de banane plantain\",\"name\":\"pacific_chips\"},\"pacific_smoothie\":{\"count\":50,\"label\":\"Smoothie tropical\",\"name\":\"pacific_smoothie\"},\"pacific_pina\":{\"count\":45,\"label\":\"Piña Colada\",\"name\":\"pacific_pina\"},\"pacific_coco\":{\"count\":50,\"label\":\"Eau de coco\",\"name\":\"pacific_coco\"},\"pacific_mojito\":{\"count\":48,\"label\":\"Mojito \",\"name\":\"pacific_mojito\"}},\"accounts\":{\"society\":101000.0,\"black_money\":0,\"cash\":0},\"weapons\":[],\"weapons_boss\":[],\"items_boss\":{\"pacific_margarita\":{\"count\":5,\"label\":\"Margarita \",\"name\":\"pacific_margarita\"},\"pacific_brochettes\":{\"count\":5,\"label\":\"Brochettes de fruits frais\",\"name\":\"pacific_brochettes\"},\"pacific_chips\":{\"count\":5,\"label\":\"Chips de banane plantain\",\"name\":\"pacific_chips\"},\"pacific_smoothie\":{\"count\":5,\"label\":\"Smoothie tropical\",\"name\":\"pacific_smoothie\"},\"pacific_pina\":{\"count\":3,\"label\":\"Piña Colada\",\"name\":\"pacific_pina\"},\"pacific_coco\":{\"count\":5,\"label\":\"Eau de coco\",\"name\":\"pacific_coco\"},\"pacific_mojito\":{\"count\":5,\"label\":\"Mojito \",\"name\":\"pacific_mojito\"}}}', '{\"withdraw_cash_coffre\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"deposit_cash_coffre\":{\"Barman\":[],\"dj\":[],\"Sécurité\":[],\"boss\":true},\"remove_weapon_chest_society\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"deposit_black_money_coffre\":{\"Barman\":[],\"dj\":[],\"Sécurité\":[],\"boss\":true},\"deposit_money_society\":{\"Barman\":[],\"dj\":[],\"Sécurité\":true,\"boss\":true},\"change_salary_grade\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"withdraw_money_society\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"recruit_player\":{\"Barman\":false,\"dj\":true,\"Sécurité\":[],\"boss\":true},\"remove_item_chest_society\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"promote_player\":{\"Barman\":false,\"dj\":false,\"Sécurité\":[],\"boss\":true},\"remove_weapon_chest\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"manage_grades\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"delete_grade\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"rename_grade\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"change_number_grade\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"weapons_chest\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"withdraw_black_money_coffre\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"demote_player\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"chest\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"unmote_player\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"dposit_item_chest_society\":{\"Barman\":[],\"dj\":true,\"Sécurité\":[],\"boss\":true},\"items_chest:society\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"editClothes\":{\"Barman\":false,\"dj\":false,\"Sécurité\":[],\"boss\":true},\"change_permissions_grade\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"create_grade\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"items_chest\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"remove_item_chest\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"rename_label_grade\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"deposit_weapon_chest_society\":{\"Barman\":[],\"dj\":[],\"Sécurité\":[],\"boss\":true},\"weapons_chest_society\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"manage_employeds\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"deposit_weapon_chest\":{\"Barman\":[],\"dj\":[],\"Sécurité\":[],\"boss\":true},\"open_boss\":{\"Barman\":false,\"dj\":false,\"Sécurité\":false,\"boss\":true},\"open_coffre\":{\"Barman\":[],\"dj\":false,\"Sécurité\":[],\"boss\":true},\"deposit_item_chest\":{\"Barman\":[],\"dj\":[],\"Sécurité\":[],\"boss\":true}}', '{\"y\":36.9053955078125,\"x\":-3022.68603515625,\"z\":10.14832782745361}', '{\"y\":100.24765014648438,\"x\":-3053.260986328125,\"z\":12.82001209259033}', '{\"color\":7,\"active\":true,\"sprite\":93,\"position\":{\"y\":86.63282775878906,\"x\":-3018.800048828125,\"z\":11.5861759185791}}', '0', 1, '[{\"grade\":false,\"name\":\"Sécurité\",\"grades\":[],\"data\":{\"shoes_1\":12,\"glasses_1\":62,\"lipstick_1\":0,\"hair_2\":0,\"bodyb_4\":0,\"glasses_2\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"face_color\":0,\"dad\":31,\"hair_color_2\":10,\"eyebrows_6\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":0,\"age_1\":0,\"sun_1\":0,\"mask_2\":0,\"makeup_3\":0,\"helmet_1\":-1,\"chain_1\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":111,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":10,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":0,\"lip_thickness\":10,\"jaw_1\":0,\"arms_2\":0,\"bproof_2\":0,\"neck_thickness\":1,\"bodyb_1\":0,\"blush_2\":0,\"blemishes_1\":0,\"moles_2\":0,\"hair_color_1\":0,\"watches_1\":-1,\"cheeks_3\":0,\"decals_2\":0,\"bags_2\":0,\"arms\":12,\"cheeks_1\":0,\"chest_1\":0,\"lipstick_2\":0,\"beard_1\":3,\"complexion_2\":0,\"cheeks_2\":0,\"moles_1\":0,\"nose_6\":0,\"torso_2\":3,\"nose_3\":6,\"nose_1\":0,\"bproof_1\":100,\"eyebrows_1\":0,\"makeup_1\":0,\"hair_1\":12,\"beard_3\":0,\"helmet_2\":0,\"mask_1\":280,\"face_md_weight\":0,\"bracelets_1\":-1,\"pants_2\":0,\"blemishes_2\":0,\"decals_1\":0,\"pants_1\":10,\"chain_2\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"bracelets_2\":0,\"lipstick_4\":0,\"nose_2\":0,\"chest_3\":0,\"bodyb_3\":-1,\"watches_2\":0,\"eyebrows_5\":0,\"eyebrows_3\":0,\"ears_2\":0,\"complexion_1\":0,\"bags_1\":0,\"chin_4\":0,\"chin_3\":0,\"sun_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"shoes_2\":6,\"beard_2\":10,\"blush_3\":0,\"blush_1\":0,\"eyebrows_2\":10,\"tshirt_1\":229}},{\"grade\":false,\"name\":\"Barman\",\"grades\":[],\"data\":{\"shoes_1\":3,\"glasses_1\":62,\"lipstick_1\":0,\"hair_2\":0,\"bodyb_4\":0,\"glasses_2\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":-1,\"face_color\":0,\"dad\":31,\"hair_color_2\":10,\"bracelets_2\":0,\"eye_squint\":0,\"nose_5\":0,\"tshirt_2\":4,\"age_1\":0,\"sun_1\":0,\"mask_2\":0,\"makeup_3\":0,\"helmet_1\":-1,\"nose_1\":0,\"chest_2\":0,\"jaw_2\":0,\"torso_1\":11,\"bodyb_2\":0,\"age_2\":0,\"eye_color\":10,\"skin_md_weight\":50,\"chin_2\":0,\"chin_1\":0,\"mom\":0,\"lip_thickness\":10,\"jaw_1\":0,\"arms_2\":0,\"bproof_2\":0,\"neck_thickness\":1,\"bodyb_1\":0,\"blush_2\":0,\"bags_2\":0,\"moles_2\":0,\"hair_color_1\":0,\"watches_1\":-1,\"cheeks_3\":0,\"decals_2\":0,\"blemishes_2\":0,\"arms\":11,\"helmet_2\":0,\"chest_1\":0,\"lipstick_2\":0,\"beard_1\":3,\"complexion_2\":0,\"cheeks_2\":0,\"moles_1\":0,\"face_md_weight\":0,\"torso_2\":2,\"nose_3\":6,\"eyebrows_5\":0,\"bproof_1\":0,\"eyebrows_1\":0,\"makeup_1\":0,\"hair_1\":12,\"beard_3\":0,\"nose_6\":0,\"watches_2\":0,\"chain_2\":0,\"bracelets_1\":-1,\"pants_2\":3,\"decals_1\":0,\"blemishes_1\":0,\"blush_3\":0,\"eyebrows_4\":0,\"nose_4\":0,\"sex\":0,\"lipstick_3\":0,\"pants_1\":10,\"lipstick_4\":0,\"eyebrows_6\":0,\"chest_3\":0,\"bodyb_3\":-1,\"cheeks_1\":0,\"nose_2\":0,\"eyebrows_3\":0,\"ears_2\":0,\"complexion_1\":0,\"bags_1\":0,\"chin_4\":0,\"chin_3\":0,\"sun_2\":0,\"makeup_4\":0,\"chain_1\":0,\"shoes_2\":2,\"beard_2\":10,\"mask_1\":280,\"blush_1\":0,\"eyebrows_2\":10,\"tshirt_1\":7}}]', '{\"y\":83.89933013916016,\"x\":-3028.209228515625,\"z\":12.35983371734619}'),
(70, 'restau_catcafe', 'CatCafe', NULL, '{\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true}}', '{\"x\":-589.2982788085938,\"y\":-1067.9344482421876,\"z\":22.35098457336425}', '{\"x\":-577.4599609375,\"y\":-1067.5218505859376,\"z\":26.61410140991211}', '{\"sprite\":89,\"position\":{\"x\":-580.9511108398438,\"y\":-1071.050048828125,\"z\":22.32953071594238},\"color\":34,\"active\":true}', '0', 1, '[]', '{\"x\":-586.5808715820313,\"y\":-1050.059814453125,\"z\":22.34414291381836}'),
(71, 'bar_tequila', 'Tequila', NULL, '{\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true}}', '{\"x\":-561.85595703125,\"y\":289.775390625,\"z\":82.1761703491211}', '{\"x\":-576.2147827148438,\"y\":288.4426574707031,\"z\":79.17679595947266}', '{\"sprite\":93,\"position\":{\"x\":-564.6791381835938,\"y\":275.5182800292969,\"z\":83.04684448242188},\"color\":66,\"active\":true}', '0', 1, '[]', '{\"x\":-563.2454223632813,\"y\":287.3268737792969,\"z\":85.37666320800781}'),
(72, 'bar_beachclub', 'Beach Club', NULL, '{\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true}}', '{\"x\":-1831.4942626953126,\"y\":-771.742919921875,\"z\":8.63294315338134}', '{\"x\":-1829.4952392578126,\"y\":-774.0812377929688,\"z\":8.63290119171142}', '{\"sprite\":93,\"position\":{\"x\":-1833.158203125,\"y\":-776.1387939453125,\"z\":8.63294792175293},\"color\":36,\"active\":true}', '0', 1, '[]', '{\"x\":-1830.2406005859376,\"y\":-762.0389404296875,\"z\":8.31728839874267}'),
(73, 'bar_mojitoinn', 'Mojito Inn', NULL, '{\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true}}', '{\"x\":-114.8919906616211,\"y\":6377.15283203125,\"z\":32.09984588623047}', '{\"x\":-119.88825225830078,\"y\":6374.62158203125,\"z\":32.10536575317383}', '{\"sprite\":93,\"position\":{\"x\":-122.61236572265625,\"y\":6389.37060546875,\"z\":32.17693710327148},\"color\":56,\"active\":true}', '0', 1, '[]', '{\"x\":-131.45584106445313,\"y\":6368.08056640625,\"z\":32.1003532409668}'),
(74, 'ltd_arena', 'LTD Arena', NULL, '{\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true}}', '{\"x\":-354.58465576171877,\"y\":-1476.4898681640626,\"z\":30.74797439575195}', '{\"x\":-351.9770202636719,\"y\":-1481.4559326171876,\"z\":30.74867630004882}', '{\"sprite\":59,\"position\":{\"x\":-342.2063903808594,\"y\":-1483.3114013671876,\"z\":30.72286415100097},\"color\":2,\"active\":true}', '0', 1, '[]', '{\"x\":-355.1205139160156,\"y\":-1479.0557861328126,\"z\":30.74793624877929}'),
(75, 'garage_octacyp', 'Octa Cyp Garage', NULL, '{\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true}}', '{\"x\":-193.67124938964845,\"y\":-1363.70361328125,\"z\":34.91529846191406}', '{\"x\":-195.77638244628907,\"y\":-1362.3480224609376,\"z\":34.91531372070312}', '{\"sprite\":446,\"position\":{\"x\":-201.8139190673828,\"y\":-1377.9495849609376,\"z\":31.25924301147461},\"color\":2,\"active\":true}', '0', 1, '[]', '{\"x\":-192.8826446533203,\"y\":-1371.2496337890626,\"z\":34.91531372070312}'),
(76, 'garage_driveline', 'Driveline Garage', '{\"items_boss\":[],\"accounts\":{\"black_money\":0,\"cash\":0,\"society\":0},\"weapons\":[],\"items\":[],\"weapons_boss\":[]}', '{\"items_chest\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"chest\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true}}', '{\"x\":-816.6361083984375,\"y\":-416.0677490234375,\"z\":36.6374626159668}', '{\"x\":-810.2774047851563,\"y\":-412.0268249511719,\"z\":36.67690658569336}', '{\"active\":true,\"position\":{\"x\":-826.0863647460938,\"y\":-428.0570068359375,\"z\":36.641357421875},\"color\":27,\"sprite\":446}', '0', 1, '[]', '{\"x\":-816.5299682617188,\"y\":-413.7039184570313,\"z\":40.38003921508789}'),
(77, 'garage_eastcustoms', 'East Customs', '{\"weapons_boss\":[],\"items\":[],\"accounts\":{\"cash\":0,\"black_money\":0,\"society\":0},\"weapons\":[],\"items_boss\":[]}', '{\"dposit_item_chest_society\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"chest\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"delete_grade\":{\"boss\":true}}', '{\"z\":34.8885383605957,\"y\":-2099.921875,\"x\":898.4995727539063}', '{\"z\":34.88854217529297,\"y\":-2099.382568359375,\"x\":886.8599853515625}', '{\"position\":{\"z\":30.50685119628906,\"y\":-2113.13671875,\"x\":869.548095703125},\"sprite\":446,\"active\":true,\"color\":27}', '0', 1, '[]', '{\"z\":30.46023941040039,\"y\":-2097.070556640625,\"x\":877.8755493164063}'),
(78, 'garage_paletocustoms', 'Paleto Customs', NULL, '{\"chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true}}', '{\"x\":-242.16453552246095,\"y\":6073.89990234375,\"z\":31.38951110839843}', '{\"x\":-229.12408447265626,\"y\":6079.478515625,\"z\":31.37823867797851}', '{\"sprite\":446,\"position\":{\"x\":869.548095703125,\"y\":-2113.13671875,\"z\":30.50685119628906},\"color\":60,\"active\":true}', '0', 1, '[]', '{\"x\":-247.47232055664063,\"y\":6072.17578125,\"z\":31.38492393493652}'),
(79, 'garage_speedhunters', 'Speed Hunters', NULL, '{\"deposit_cash_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"chest\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true}}', '{\"x\":2731.2177734375,\"y\":3499.056884765625,\"z\":55.52353286743164}', '{\"x\":2728.6318359375,\"y\":3483.97412109375,\"z\":61.58583450317383}', '{\"position\":{\"x\":2750.90234375,\"y\":3471.458740234375,\"z\":55.68634033203125},\"color\":48,\"active\":true,\"sprite\":446}', '0', 1, '[]', '{\"x\":2730.07568359375,\"y\":3496.480712890625,\"z\":55.52352523803711}');

-- --------------------------------------------------------

--
-- Structure de la table `sunny_afk_players`
--

CREATE TABLE `sunny_afk_players` (
  `UniqueID` int(11) DEFAULT 0,
  `points` longtext DEFAULT '0',
  `time` longtext DEFAULT '0',
  `inZone` tinyint(1) DEFAULT 0,
  `skin` longtext DEFAULT 'none',
  `playerName` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sunny_clothes`
--

CREATE TABLE `sunny_clothes` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `identifier` varchar(60) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sunny_clothes`
--

INSERT INTO `sunny_clothes` (`id`, `type`, `identifier`, `name`, `data`) VALUES
(1, 'top', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Haut 226', '{\"bproof_1\":1,\"bproof_2\":0,\"arms\":0,\"tshirt_1\":15,\"arms_2\":0,\"tshirt_2\":0,\"torso_1\":226,\"torso_2\":0}'),
(2, 'top', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Haut 30', '{\"torso_2\":0,\"tshirt_1\":31,\"arms_2\":0,\"tshirt_2\":0,\"torso_1\":30,\"bproof_2\":0,\"arms\":4,\"bproof_1\":0}'),
(3, 'pants', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Pantalon ', '{\"pants_1\":24,\"pants_2\":0}'),
(4, 'shoes', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Chaussure ', '{\"shoes_2\":0,\"shoes_1\":10}'),
(5, 'mask', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Masque 3', '{\"mask_1\":3,\"mask_2\":0}');

-- --------------------------------------------------------

--
-- Structure de la table `sunny_trunk`
--

CREATE TABLE `sunny_trunk` (
  `info` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `UniqueID` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `playerName` longtext DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(255) DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT 0,
  `loadout` longtext NOT NULL DEFAULT '[]',
  `inventory` longtext NOT NULL DEFAULT '[]',
  `accounts` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `permission_group` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `dateofbirth` varchar(25) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `height` varchar(5) DEFAULT '',
  `status` longtext DEFAULT NULL,
  `clothes` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `ip` longtext DEFAULT NULL,
  `life` longtext DEFAULT NULL,
  `connected` tinyint(1) DEFAULT 0,
  `sunnycoins` int(11) NOT NULL DEFAULT 0,
  `totalCoins` text NOT NULL DEFAULT '0',
  `warns` longtext NOT NULL DEFAULT '[]',
  `boutiquereward` tinyint(4) DEFAULT 0,
  `apps` text DEFAULT NULL,
  `widget` text DEFAULT NULL,
  `bt` text DEFAULT NULL,
  `charinfo` text DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL,
  `cryptocurrency` longtext DEFAULT NULL,
  `cryptocurrencytransfers` text DEFAULT NULL,
  `phonePos` text DEFAULT NULL,
  `spotify` text DEFAULT NULL,
  `ringtone` text DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL,
  `xp` int(11) DEFAULT 1,
  `vie` int(55) NOT NULL DEFAULT 200,
  `report` longtext DEFAULT NULL CHECK (json_valid(`report`)),
  `reports_taken` int(11) DEFAULT 0,
  `ranks` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`UniqueID`, `identifier`, `money`, `playerName`, `skin`, `job`, `job_grade`, `job2`, `job2_grade`, `loadout`, `inventory`, `accounts`, `position`, `bank`, `permission_level`, `permission_group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `status`, `clothes`, `tattoos`, `phone_number`, `is_dead`, `last_property`, `rank`, `ip`, `life`, `connected`, `sunnycoins`, `totalCoins`, `warns`, `boutiquereward`, `apps`, `widget`, `bt`, `charinfo`, `metadata`, `cryptocurrency`, `cryptocurrencytransfers`, `phonePos`, `spotify`, `ringtone`, `first_screen_showed`, `xp`, `vie`, `report`, `reports_taken`, `ranks`) VALUES
(2, 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', NULL, 'NEVA', '{\"jaw_2\":2,\"shoes_1\":207,\"eyebrows_3\":0,\"tshirt_2\":0,\"arms_2\":0,\"neck_thickness\":2,\"jaw_1\":3,\"hair_2\":0,\"eye_squint\":0,\"eye_color\":0,\"bodyb_2\":0,\"bproof_2\":0,\"hair_1\":215,\"makeup_1\":0,\"blush_3\":0,\"lipstick_4\":0,\"lipstick_2\":0,\"mask_1\":0,\"pants_1\":283,\"arms\":4,\"moles_1\":0,\"makeup_3\":0,\"watches_1\":-1,\"shoes_2\":0,\"mask_2\":0,\"beard_3\":0,\"bodyb_3\":-1,\"moles_2\":0,\"nose_1\":1,\"ears_1\":-1,\"chest_1\":0,\"bproof_1\":0,\"age_2\":0,\"age_1\":0,\"helmet_2\":0,\"eyebrows_4\":0,\"blemishes_2\":0,\"ears_2\":0,\"watches_2\":0,\"eyebrows_1\":1,\"cheeks_2\":3,\"complexion_1\":0,\"chin_2\":2,\"blemishes_1\":0,\"beard_1\":3,\"torso_2\":0,\"nose_4\":3,\"glasses_2\":0,\"eyebrows_5\":0,\"dad\":10,\"chain_2\":0,\"bracelets_1\":-1,\"bags_2\":0,\"lip_thickness\":9,\"chin_3\":3,\"skin_md_weight\":0,\"glasses_1\":73,\"decals_2\":0,\"beard_4\":0,\"mom\":21,\"face_md_weight\":0,\"lipstick_1\":0,\"chain_1\":0,\"bags_1\":0,\"nose_5\":0,\"bracelets_2\":0,\"chest_3\":0,\"chin_1\":4,\"lipstick_3\":0,\"cheeks_3\":0,\"torso_1\":671,\"tshirt_1\":15,\"complexion_2\":0,\"nose_2\":7,\"hair_color_2\":0,\"bodyb_4\":0,\"chin_4\":1,\"decals_1\":0,\"bodyb_1\":-1,\"hair_color_1\":0,\"pants_2\":0,\"nose_6\":0,\"makeup_4\":0,\"eyebrows_6\":0,\"chest_2\":0,\"sun_1\":0,\"blush_2\":0,\"eyebrows_2\":9,\"sun_2\":0,\"cheeks_1\":2,\"beard_2\":10,\"makeup_2\":0,\"helmet_1\":-1,\"sex\":0,\"nose_3\":0,\"blush_1\":0}', 'garage_lscustom', 6, 'unemployed2', 0, '[]', '[{\"name\":\"ar15\",\"count\":1},{\"name\":\"douce_lures\",\"count\":9},{\"name\":\"ocean_lures\",\"count\":10},{\"name\":\"mer_lures\",\"count\":10},{\"name\":\"bandage\",\"count\":11},{\"name\":\"canneapeche\",\"count\":1},{\"name\":\"knife\",\"count\":1},{\"name\":\"doublebarrel\",\"count\":1},{\"name\":\"feuillecoca\",\"count\":20},{\"name\":\"combatpistol\",\"count\":1},{\"name\":\"honeybadgercod\",\"count\":1},{\"name\":\"kitcarro\",\"count\":11},{\"name\":\"kq_meth_lab_kit\",\"count\":10},{\"name\":\"repairkit\",\"count\":9},{\"name\":\"smg_ammo\",\"count\":10},{\"name\":\"snspistol\",\"count\":1},{\"name\":\"poissonchat\",\"count\":1},{\"name\":\"scar17fm\",\"count\":1},{\"name\":\"terre\",\"count\":20},{\"name\":\"vp9\",\"count\":1},{\"name\":\"weed\",\"count\":10},{\"name\":\"pistol_ammo\",\"count\":108}]', '[{\"name\":\"cash\",\"money\":390235},{\"name\":\"black_money\",\"money\":7542},{\"name\":\"bank\",\"money\":506461},{\"name\":\"chip\",\"money\":0},{\"name\":\"pesos\",\"money\":500}]', '{\"x\":-176.10000610351563,\"z\":29.89999961853027,\"y\":-853.7000122070313}', NULL, 0, 'fondateur', 'Marco', 'Alvarez', '1995-12-09', '0', '197', '[{\"percent\":79.08,\"val\":790800,\"name\":\"hunger\"},{\"percent\":85.356,\"val\":853560,\"name\":\"thirst\"}]', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, 0, '0', '[]', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114201, 200, NULL, 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `vehicles_boutique`
--

CREATE TABLE `vehicles_boutique` (
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `type` longtext NOT NULL DEFAULT 'car'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicles_boutique`
--

INSERT INTO `vehicles_boutique` (`name`, `label`, `price`, `type`) VALUES
('sultanrs', 'Sultanrs', 1000, 'car');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_catalogue`
--

CREATE TABLE `vehicle_catalogue` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicle_catalogue`
--

INSERT INTO `vehicle_catalogue` (`name`, `label`) VALUES
('compacts', 'Kompaktwagen'),
('coupes', 'Coupés'),
('motorcycles', 'Motorräder'),
('muscle', 'Muscle Cars'),
('offroad', 'Geländewagen'),
('sedans', 'Limousinen'),
('sports', 'Sportwagen'),
('sportsclassics', 'Klassische Sportwagen'),
('super', 'Supersportwagen'),
('suvs', 'SUVs'),
('vans', 'Transporter');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Kompaktwagen'),
('coupes', 'Coupés'),
('ENTREPRISE', 'Firmenfahrzeuge'),
('Imports', 'Importfahrzeuge'),
('muscle', 'Muscle Cars'),
('offroad', 'Geländewagen'),
('sedans', 'Limousinen'),
('sports', 'Sportwagen'),
('sportsclassics', 'Klassische Sportwagen'),
('super', 'Supersportwagen'),
('suvs', 'SUVs'),
('vans', 'Transporter');

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

CREATE TABLE `vehicules` (
  `id` int(12) NOT NULL,
  `job` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `price` int(12) NOT NULL,
  `category` varchar(255) NOT NULL,
  `ytd` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`id`, `job`, `name`, `model`, `price`, `category`, `ytd`, `image`) VALUES
(3, 'cardealer', 'Alpha', 'alpha', 60000, 'sports', NULL, NULL),
(4, 'cardealer', 'asbo', 'asbo', 8000, 'compacts', NULL, NULL),
(5, 'cardealer', 'Asea', 'asea', 5500, 'sedans', NULL, NULL),
(6, 'cardealer', 'asterope', 'asterope', 45000, 'sedans', NULL, NULL),
(8, 'motodealer', 'Avarus', 'avarus', 25000, 'motorcycles', NULL, NULL),
(9, 'motodealer', 'Bagger', 'bagger', 20000, 'motorcycles', NULL, NULL),
(12, 'cardealer', 'Baller Sport', 'baller4', 60000, 'suvs', NULL, NULL),
(13, 'cardealer', 'Banshee', 'banshee', 70000, 'sports', NULL, NULL),
(14, 'cardealer', 'Banshee 900R', 'banshee2', 47000, 'super', NULL, NULL),
(15, 'motodealer', 'Bati 801', 'bati', 20000, 'motorcycles', NULL, NULL),
(16, 'motodealer', 'Bati 801RR', 'bati2', 40000, 'motorcycles', NULL, NULL),
(17, 'cardealer', 'Bestia GTS', 'bestiagts', 95000, 'sports', NULL, NULL),
(18, 'motodealer', 'BF400', 'bf400', 25000, 'motorcycles', NULL, NULL),
(19, 'cardealer', 'Bf Injection', 'bfinjection', 16000, 'offroad', NULL, NULL),
(20, 'cardealer', 'Bifta', 'bifta', 12000, 'offroad', NULL, NULL),
(21, 'cardealer', 'Bison', 'bison', 45000, 'vans', NULL, NULL),
(22, 'cardealer', 'bison2', 'bison2', 20000, 'vans', NULL, NULL),
(23, 'cardealer', 'bjxl', 'bjxl', 45000, 'suvs', NULL, NULL),
(24, 'cardealer', 'Blade', 'blade', 15000, 'muscle', NULL, NULL),
(25, 'cardealer', 'Blazer', 'blazer', 6500, 'offroad', NULL, NULL),
(26, 'cardealer', 'Blazer Sport', 'blazer4', 8500, 'offroad', NULL, NULL),
(27, 'cardealer', 'Blista', 'blista', 8000, 'compacts', NULL, NULL),
(28, 'cardealer', 'blista2', 'blista2', 45000, 'sports', NULL, NULL),
(29, 'cardealer', 'blista3', 'blista3', 45000, 'sports', NULL, NULL),
(30, 'cardealer', 'BMX', 'bmx', 160, 'motorcycles', NULL, NULL),
(31, 'cardealer', 'Bobcat XL', 'bobcatxl', 32000, 'vans', NULL, NULL),
(32, 'cardealer', 'bodhi2', 'bodhi2', 45000, 'offroad', NULL, NULL),
(33, 'cardealer', 'Brawler', 'brawler', 45000, 'offroad', NULL, NULL),
(34, 'cardealer', 'Brioso R/A', 'brioso', 18000, 'compacts', NULL, NULL),
(35, 'cardealer', 'brioso2', 'brioso2', 8000, 'compacts', NULL, NULL),
(36, 'cardealer', 'Btype', 'btype', 62000, 'sportsclassics', NULL, NULL),
(37, 'cardealer', 'Btype Hotroad', 'btype2', 155000, 'sportsclassics', NULL, NULL),
(38, 'cardealer', 'Btype Luxe', 'btype3', 85000, 'sportsclassics', NULL, NULL),
(39, 'cardealer', 'Buccaneer', 'buccaneer', 18000, 'muscle', NULL, NULL),
(40, 'cardealer', 'Buccaneer Rider', 'buccaneer2', 24000, 'muscle', NULL, NULL),
(41, 'cardealer', 'Buffalo', 'buffalo', 22000, 'sports', NULL, NULL),
(42, 'cardealer', 'Buffalo S', 'buffalo2', 26000, 'sports', NULL, NULL),
(44, 'cardealer', 'Bullet', 'bullet', 90000, 'super', NULL, NULL),
(45, 'cardealer', 'burrito2', 'burrito2', 20000, 'vans', NULL, NULL),
(46, 'cardealer', 'Burrito', 'burrito3', 49000, 'vans', NULL, NULL),
(47, 'cardealer', 'burrito4', 'burrito4', 20000, 'vans', NULL, NULL),
(49, 'cardealer', 'Carbonizzare', 'carbonizzare', 75000, 'sports', NULL, NULL),
(50, 'motodealer', 'Carbon RS', 'carbonrs', 38000, 'motorcycles', NULL, NULL),
(51, 'cardealer', 'Casco', 'casco', 55000, 'sportsclassics', NULL, NULL),
(52, 'cardealer', 'cavalcade', 'cavalcade', 45000, 'suvs', NULL, NULL),
(53, 'cardealer', 'Cavalcade', 'cavalcade2', 55000, 'suvs', NULL, NULL),
(54, 'cardealer', 'Cheburek', 'cheburek', 20000, 'sedans', NULL, NULL),
(57, 'cardealer', 'Chimera', 'chimera', 25000, 'motorcycles', NULL, NULL),
(58, 'cardealer', 'Chino', 'chino', 15000, 'muscle', NULL, NULL),
(59, 'cardealer', 'Chino Luxe', 'chino2', 19000, 'muscle', NULL, NULL),
(60, 'motodealer', 'Cliffhanger', 'cliffhanger', 20000, 'motorcycles', NULL, NULL),
(61, 'cardealer', 'clique', 'clique', 45000, 'muscle', NULL, NULL),
(62, 'cardealer', 'club', 'club', 8000, 'compacts', NULL, NULL),
(63, 'cardealer', 'cog55', 'cog55', 45000, 'sedans', NULL, NULL),
(64, 'cardealer', 'Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes', NULL, NULL),
(65, 'cardealer', 'Cognoscenti', 'cognoscenti', 55000, 'sedans', NULL, NULL),
(66, 'cardealer', 'Comet', 'comet2', 72000, 'sports', NULL, NULL),
(67, 'cardealer', 'Comet 5', 'comet5', 145000, 'sports', NULL, NULL),
(68, 'cardealer', 'Contender', 'contender', 180000, 'suvs', NULL, NULL),
(69, 'cardealer', 'Coquette', 'coquette', 65000, 'sports', NULL, NULL),
(70, 'cardealer', 'Coquette Classic', 'coquette2', 40000, 'sportsclassics', NULL, NULL),
(71, 'cardealer', 'Coquette BlackFin', 'coquette3', 55000, 'muscle', NULL, NULL),
(72, 'cardealer', 'Cruiser', 'cruiser', 510, 'motorcycles', NULL, NULL),
(73, 'cardealer', 'Cyclone', 'cyclone', 189000, 'super', NULL, NULL),
(74, 'motodealer', 'Daemon', 'daemon', 20000, 'motorcycles', NULL, NULL),
(75, 'motodealer', 'Daemon High', 'daemon2', 30000, 'motorcycles', NULL, NULL),
(76, 'motodealer', 'Defiler', 'defiler', 30000, 'motorcycles', NULL, NULL),
(78, 'cardealer', 'deviant', 'deviant', 45000, 'muscle', NULL, NULL),
(79, 'motodealer', 'diablous', 'diablous', 45000, 'motorcycles', NULL, NULL),
(80, 'motodealer', 'diablous2', 'diablous2', 45000, 'motorcycles', NULL, NULL),
(81, 'cardealer', 'dilettante', 'dilettante', 8000, 'compacts', NULL, NULL),
(82, 'cardealer', 'dloader', 'dloader', 45000, 'offroad', NULL, NULL),
(83, 'cardealer', 'Dominator', 'dominator', 35000, 'muscle', NULL, NULL),
(84, 'cardealer', 'dominator2', 'dominator2', 45000, 'muscle', NULL, NULL),
(85, 'cardealer', 'dominator3', 'dominator3', 45000, 'muscle', NULL, NULL),
(86, 'motodealer', 'Double T', 'double', 28000, 'motorcycles', NULL, NULL),
(87, 'cardealer', 'drafter', 'drafter', 90000, 'sports', NULL, NULL),
(88, 'cardealer', 'Dubsta', 'dubsta', 45000, 'suvs', NULL, NULL),
(89, 'cardealer', 'Dubsta Luxuary', 'dubsta2', 90000, 'suvs', NULL, NULL),
(90, 'cardealer', 'Bubsta 6x6', 'dubsta3', 120000, 'offroad', NULL, NULL),
(91, 'cardealer', 'Dukes', 'dukes', 28000, 'muscle', NULL, NULL),
(92, 'cardealer', 'dukes3', 'dukes3', 45000, 'muscle', NULL, NULL),
(93, 'cardealer', 'Dune Buggy', 'dune', 8000, 'offroad', NULL, NULL),
(94, 'cardealer', 'dynasty', 'dynasty', 20000, 'sports', NULL, NULL),
(95, 'cardealer', 'Elegy', 'elegy', 90000, 'sports', NULL, NULL),
(96, 'cardealer', 'Elegy sport', 'elegy2', 95000, 'sports', NULL, NULL),
(97, 'cardealer', 'ellie', 'ellie', 45000, 'muscle', NULL, NULL),
(99, 'cardealer', 'Emperor', 'emperor', 8500, 'sedans', NULL, NULL),
(100, 'cardealer', 'emperor2', 'emperor2', 45000, 'sedans', NULL, NULL),
(101, 'motodealer', 'Enduro', 'enduro', 5500, 'motorcycles', NULL, NULL),
(104, 'motodealer', 'Esskey', 'esskey', 4200, 'motorcycles', NULL, NULL),
(105, 'cardealer', 'everon', 'everon', 45000, 'offroad', NULL, NULL),
(106, 'cardealer', 'Exemplar', 'exemplar', 56000, 'coupes', NULL, NULL),
(107, 'cardealer', 'F620', 'f620', 40000, 'coupes', NULL, NULL),
(108, 'cardealer', 'Faction', 'faction', 20000, 'muscle', NULL, NULL),
(109, 'cardealer', 'Faction Rider', 'faction2', 30000, 'muscle', NULL, NULL),
(110, 'cardealer', 'fagaloa', 'fagaloa', 20000, 'sports', NULL, NULL),
(112, 'motodealer', 'Faggio', 'faggio', 1900, 'motorcycles', NULL, NULL),
(113, 'motodealer', 'Vespa', 'faggio2', 2800, 'motorcycles', NULL, NULL),
(114, 'motodealer', 'faggio3', 'faggio3', 7000, 'motorcycles', NULL, NULL),
(115, 'motodealer', 'fcr', 'fcr', 45000, 'motorcycles', NULL, NULL),
(116, 'motodealer', 'fcr2', 'fcr2', 45000, 'motorcycles', NULL, NULL),
(117, 'cardealer', 'Felon', 'felon', 42000, 'coupes', NULL, NULL),
(118, 'cardealer', 'Felon GT', 'felon2', 55000, 'coupes', NULL, NULL),
(119, 'cardealer', 'Feltzer', 'feltzer2', 55000, 'sports', NULL, NULL),
(120, 'cardealer', 'Stirling GT', 'feltzer3', 65000, 'sportsclassics', NULL, NULL),
(121, 'cardealer', 'Fixter', 'fixter', 225, 'motorcycles', NULL, NULL),
(122, 'cardealer', 'flashgt', 'flashgt', 55000, 'sports', NULL, NULL),
(124, 'cardealer', 'Fhantom', 'fq2', 17000, 'suvs', NULL, NULL),
(125, 'cardealer', 'freecrawler', 'freecrawler', 45000, 'offroad', NULL, NULL),
(126, 'cardealer', 'Fugitive', 'fugitive', 12000, 'sedans', NULL, NULL),
(128, 'cardealer', 'Furore GT', 'furoregt', 45000, 'sports', NULL, NULL),
(129, 'cardealer', 'Fusilade', 'fusilade', 40000, 'sports', NULL, NULL),
(130, 'cardealer', 'futo', 'futo', 31000, 'sports', NULL, NULL),
(131, 'motodealer', 'Gargoyle', 'gargoyle', 16500, 'motorcycles', NULL, NULL),
(132, 'cardealer', 'Gauntlet', 'gauntlet', 30000, 'muscle', NULL, NULL),
(133, 'cardealer', 'gauntlet2', 'gauntlet2', 45000, 'muscle', NULL, NULL),
(134, 'cardealer', 'gauntlet3', 'gauntlet3', 45000, 'muscle', NULL, NULL),
(135, 'cardealer', 'gauntlet4', 'gauntlet4', 45000, 'muscle', NULL, NULL),
(136, 'cardealer', 'gauntlet5', 'gauntlet5', 45000, 'muscle', NULL, NULL),
(137, 'cardealer', 'gb200', 'gb200', 45000, 'sports', NULL, NULL),
(138, 'cardealer', 'Gang Burrito', 'gburrito', 45000, 'vans', NULL, NULL),
(139, 'cardealer', 'Burrito', 'gburrito2', 29000, 'vans', NULL, NULL),
(140, 'cardealer', 'Glendale', 'glendale', 16500, 'sedans', NULL, NULL),
(141, 'cardealer', 'glendale2', 'glendale2', 45000, 'sedans', NULL, NULL),
(142, 'cardealer', 'gp1', 'gp1', 112000, 'super', NULL, NULL),
(143, 'cardealer', 'Grabger', 'granger', 50000, 'suvs', NULL, NULL),
(144, 'cardealer', 'Gresley', 'gresley', 47500, 'suvs', NULL, NULL),
(145, 'cardealer', 'GT 500', 'gt500', 78500, 'sportsclassics', NULL, NULL),
(146, 'cardealer', 'Guardian', 'guardian', 235000, 'offroad', NULL, NULL),
(147, 'cardealer', 'habanero', 'habanero', 45000, 'suvs', NULL, NULL),
(148, 'motodealer', 'Hakuchou', 'hakuchou', 75000, 'motorcycles', NULL, NULL),
(149, 'motodealer', 'Hakuchou Sport', 'hakuchou2', 150000, 'motorcycles', NULL, NULL),
(150, 'cardealer', 'hellion', 'hellion', 45000, 'offroad', NULL, NULL),
(151, 'cardealer', 'Hermes', 'hermes', 255000, 'muscle', NULL, NULL),
(152, 'motodealer', 'Hexer', 'hexer', 12000, 'motorcycles', NULL, NULL),
(153, 'cardealer', 'Hotknife', 'hotknife', 125000, 'muscle', NULL, NULL),
(154, 'cardealer', 'hotring', 'hotring', 42000, 'sports', NULL, NULL),
(155, 'cardealer', 'Huntley S', 'huntley', 40000, 'suvs', NULL, NULL),
(156, 'cardealer', 'Hustler', 'hustler', 290000, 'muscle', NULL, NULL),
(157, 'cardealer', 'imorgon', 'imorgon', 70000, 'sports', NULL, NULL),
(158, 'cardealer', 'impaler', 'impaler', 45000, 'muscle', NULL, NULL),
(159, 'cardealer', 'Infernus', 'infernus', 180000, 'super', NULL, NULL),
(160, 'cardealer', 'infernus2', 'infernus2', 142000, 'sports', NULL, NULL),
(161, 'cardealer', 'ingot', 'ingot', 45000, 'sedans', NULL, NULL),
(162, 'motodealer', 'Innovation', 'innovation', 23500, 'motorcycles', NULL, NULL),
(163, 'cardealer', 'Intruder', 'intruder', 7500, 'sedans', NULL, NULL),
(164, 'cardealer', 'Issi', 'issi2', 10000, 'compacts', NULL, NULL),
(165, 'cardealer', 'issi3', 'issi3', 8000, 'compacts', NULL, NULL),
(166, 'cardealer', 'issi7', 'issi7', 80000, 'sports', NULL, NULL),
(167, 'cardealer', 'italigtb', 'italigtb', 129000, 'super', NULL, NULL),
(168, 'cardealer', 'italigtb2', 'italigtb2', 120000, 'super', NULL, NULL),
(169, 'cardealer', 'italigto', 'italigto', 110000, 'sports', NULL, NULL),
(171, 'cardealer', 'Jackal', 'jackal', 38000, 'coupes', NULL, NULL),
(172, 'cardealer', 'Jester', 'jester', 65000, 'sports', NULL, NULL),
(174, 'cardealer', 'jester3', 'jester3', 42000, 'sports', NULL, NULL),
(175, 'cardealer', 'Journey', 'journey', 42000, 'vans', NULL, NULL),
(176, 'cardealer', 'jugular', 'jugular', 165000, 'sports', NULL, NULL),
(177, 'cardealer', 'kalahari', 'kalahari', 45000, 'offroad', NULL, NULL),
(178, 'cardealer', 'Kamacho', 'kamacho', 170000, 'offroad', NULL, NULL),
(179, 'cardealer', 'kanjo', 'kanjo', 8000, 'compacts', NULL, NULL),
(180, 'cardealer', 'Khamelion', 'khamelion', 83000, 'sports', NULL, NULL),
(181, 'cardealer', 'komoda', 'komoda', 95000, 'sports', NULL, NULL),
(183, 'cardealer', 'Kuruma', 'kuruma', 100000, 'sports', NULL, NULL),
(184, 'cardealer', 'Landstalker', 'landstalker', 35000, 'suvs', NULL, NULL),
(185, 'cardealer', 'landstalker2', 'landstalker2', 45000, 'suvs', NULL, NULL),
(187, 'cardealer', 'locust', 'locust', 70000, 'sports', NULL, NULL),
(188, 'cardealer', 'Lynx', 'lynx', 50000, 'sports', NULL, NULL),
(189, 'cardealer', 'Mamba', 'mamba', 70000, 'sports', NULL, NULL),
(192, 'motodealer', 'Manchez', 'manchez', 5300, 'motorcycles', NULL, NULL),
(193, 'motodealer', 'Manchez2', 'manchez2', 14000, 'motorcycles', NULL, NULL),
(194, 'cardealer', 'Massacro', 'massacro', 65000, 'sports', NULL, NULL),
(196, 'cardealer', 'Mesa', 'mesa', 16000, 'suvs', NULL, NULL),
(197, 'cardealer', 'Mesa Trail', 'mesa3', 40000, 'suvs', NULL, NULL),
(198, 'cardealer', 'michelli', 'michelli', 31000, 'sports', NULL, NULL),
(199, 'cardealer', 'Minivan', 'minivan', 13000, 'vans', NULL, NULL),
(200, 'cardealer', 'minivan2', 'minivan2', 20000, 'vans', NULL, NULL),
(201, 'cardealer', 'Monroe', 'monroe', 55000, 'sportsclassics', NULL, NULL),
(202, 'cardealer', 'Moonbeam', 'moonbeam', 18000, 'vans', NULL, NULL),
(203, 'cardealer', 'Moonbeam Rider', 'moonbeam2', 35000, 'vans', NULL, NULL),
(204, 'cardealer', 'nebula', 'nebula', 31000, 'sports', NULL, NULL),
(205, 'motodealer', 'Nemesis', 'nemesis', 25000, 'motorcycles', NULL, NULL),
(206, 'cardealer', 'Neon', 'neon', 150000, 'sports', NULL, NULL),
(209, 'motodealer', 'Nightblade', 'nightblade', 65000, 'motorcycles', NULL, NULL),
(210, 'cardealer', 'Nightshade', 'nightshade', 65000, 'muscle', NULL, NULL),
(211, 'cardealer', '9F', 'ninef', 85000, 'sports', NULL, NULL),
(212, 'cardealer', '9F Cabrio', 'ninef2', 95000, 'sports', NULL, NULL),
(213, 'cardealer', 'novak', 'novak', 45000, 'suvs', NULL, NULL),
(214, 'cardealer', 'Omnis', 'omnis', 45000, 'sports', NULL, NULL),
(216, 'cardealer', 'oracle', 'oracle', 45000, 'coupes', NULL, NULL),
(217, 'cardealer', 'Oracle XS', 'oracle2', 35000, 'coupes', NULL, NULL),
(219, 'cardealer', 'outlaw', 'outlaw', 45000, 'offroad', NULL, NULL),
(220, 'cardealer', 'Panto', 'panto', 5000, 'compacts', NULL, NULL),
(222, 'cardealer', 'paragon', 'paragon', 115000, 'sports', NULL, NULL),
(223, 'cardealer', 'Pariah', 'pariah', 142000, 'sports', NULL, NULL),
(224, 'cardealer', 'Patriot', 'patriot', 55000, 'suvs', NULL, NULL),
(225, 'cardealer', 'patriot2', 'patriot2', 125000, 'suvs', NULL, NULL),
(226, 'motodealer', 'PCJ-600', 'pcj', 10800, 'motorcycles', NULL, NULL),
(227, 'cardealer', 'penetrator', 'penetrator', 142000, 'super', NULL, NULL),
(228, 'cardealer', 'Penumbra', 'penumbra', 28000, 'sports', NULL, NULL),
(229, 'cardealer', 'penumbra2', 'penumbra2', 32500, 'sports', NULL, NULL),
(230, 'cardealer', 'peyote', 'peyote', 20000, 'sports', NULL, NULL),
(231, 'cardealer', 'peyote2', 'peyote2', 45000, 'muscle', NULL, NULL),
(234, 'cardealer', 'Phoenix', 'phoenix', 12500, 'muscle', NULL, NULL),
(235, 'cardealer', 'Picador', 'picador', 18000, 'muscle', NULL, NULL),
(236, 'cardealer', 'Pigalle', 'pigalle', 20000, 'sportsclassics', NULL, NULL),
(239, 'cardealer', 'Prairie', 'prairie', 12000, 'compacts', NULL, NULL),
(240, 'cardealer', 'Premier', 'premier', 18000, 'sedans', NULL, NULL),
(241, 'cardealer', 'primo', 'primo', 35000, 'sedans', NULL, NULL),
(242, 'cardealer', 'Primo Custom', 'primo2', 45000, 'sedans', NULL, NULL),
(244, 'cardealer', 'Radius', 'radi', 29000, 'suvs', NULL, NULL),
(245, 'cardealer', 'raiden', 'raiden', 137500, 'sports', NULL, NULL),
(246, 'cardealer', 'rancherxl', 'rancherxl', 45000, 'offroad', NULL, NULL),
(247, 'cardealer', 'Rapid GT', 'rapidgt', 87000, 'sports', NULL, NULL),
(251, 'motodealer', 'ratbike', 'ratbike', 45000, 'motorcycles', NULL, NULL),
(252, 'cardealer', 'ratloader', 'ratloader', 45000, 'muscle', NULL, NULL),
(253, 'cardealer', 'ratloader2', 'ratloader2', 45000, 'muscle', NULL, NULL),
(254, 'cardealer', 'Reaper', 'reaper', 150000, 'super', NULL, NULL),
(255, 'cardealer', 'rebel', 'rebel', 45000, 'offroad', NULL, NULL),
(256, 'cardealer', 'Rebel', 'rebel2', 35000, 'offroad', NULL, NULL),
(257, 'cardealer', 'rebla', 'rebla', 45000, 'suvs', NULL, NULL),
(258, 'cardealer', 'Regina', 'regina', 5000, 'sedans', NULL, NULL),
(261, 'cardealer', 'Revolter', 'revolter', 161000, 'sports', NULL, NULL),
(262, 'cardealer', 'rhapsody', 'rhapsody', 8000, 'compacts', NULL, NULL),
(263, 'cardealer', 'riata', 'riata', 165000, 'offroad', NULL, NULL),
(264, 'cardealer', 'Rocoto', 'rocoto', 45000, 'suvs', NULL, NULL),
(265, 'motodealer', 'Ruffian', 'ruffian', 13900, 'motorcycles', NULL, NULL),
(266, 'cardealer', 'ruiner', 'ruiner', 45000, 'muscle', NULL, NULL),
(268, 'cardealer', 'Rumpo', 'rumpo', 15000, 'vans', NULL, NULL),
(270, 'cardealer', 'ruston', 'ruston', 55000, 'sports', NULL, NULL),
(272, 'cardealer', 'Sabre Turbo', 'sabregt', 20000, 'muscle', NULL, NULL),
(273, 'cardealer', 'Sabre GT', 'sabregt2', 25000, 'muscle', NULL, NULL),
(274, 'motodealer', 'Sanchez', 'sanchez', 9000, 'motorcycles', NULL, NULL),
(275, 'motodealer', 'Sanchez Sport', 'sanchez2', 10000, 'motorcycles', NULL, NULL),
(276, 'motodealer', 'Sanctus', 'sanctus', 50000, 'motorcycles', NULL, NULL),
(277, 'cardealer', 'Sandking', 'sandking', 55000, 'offroad', NULL, NULL),
(278, 'cardealer', 'sandking2', 'sandking2', 45000, 'offroad', NULL, NULL),
(280, 'cardealer', 'SC1', 'sc1', 160300, 'super', NULL, NULL),
(281, 'cardealer', 'Schafter', 'schafter2', 25000, 'sedans', NULL, NULL),
(282, 'cardealer', 'Schafter V12', 'schafter3', 50000, 'sports', NULL, NULL),
(283, 'cardealer', 'schafter4', 'schafter4', 55000, 'sports', NULL, NULL),
(284, 'cardealer', 'schlagen', 'schlagen', 82000, 'sports', NULL, NULL),
(286, 'cardealer', 'Scorcher', 'scorcher', 280, 'motorcycles', NULL, NULL),
(287, 'cardealer', 'Seminole', 'seminole', 25000, 'suvs', NULL, NULL),
(288, 'cardealer', 'seminole2', 'seminole2', 45000, 'suvs', NULL, NULL),
(289, 'cardealer', 'Sentinel', 'sentinel', 32000, 'coupes', NULL, NULL),
(290, 'cardealer', 'Sentinel XS', 'sentinel2', 40000, 'coupes', NULL, NULL),
(292, 'cardealer', 'serrano', 'serrano', 45000, 'suvs', NULL, NULL),
(293, 'cardealer', 'Seven 70', 'seven70', 69000, 'sports', NULL, NULL),
(294, 'cardealer', 'ETR1', 'sheava', 220000, 'super', NULL, NULL),
(295, 'cardealer', 'Slam Van', 'slamvan3', 21000, 'muscle', NULL, NULL),
(296, 'motodealer', 'Sovereign', 'sovereign', 35000, 'motorcycles', NULL, NULL),
(297, 'cardealer', 'specter', 'specter', 45000, 'sports', NULL, NULL),
(299, 'cardealer', 'speedo', 'speedo', 20000, 'vans', NULL, NULL),
(300, 'cardealer', 'speedo2', 'speedo2', 20000, 'vans', NULL, NULL),
(302, 'cardealer', 'squaddie', 'squaddie', 45000, 'suvs', NULL, NULL),
(303, 'cardealer', 'stafford', 'stafford', 45000, 'sedans', NULL, NULL),
(304, 'cardealer', 'stalion', 'stalion', 45000, 'muscle', NULL, NULL),
(305, 'cardealer', 'Stalion2', 'stalion2', 45000, 'muscle', NULL, NULL),
(306, 'cardealer', 'stanier', 'stanier', 45000, 'sedans', NULL, NULL),
(307, 'cardealer', 'Stinger', 'stinger', 80000, 'sportsclassics', NULL, NULL),
(308, 'cardealer', 'Stinger GT', 'stingergt', 75000, 'sportsclassics', NULL, NULL),
(309, 'cardealer', 'stratum', 'stratum', 45000, 'sedans', NULL, NULL),
(310, 'cardealer', 'Streiter', 'streiter', 125000, 'sports', NULL, NULL),
(311, 'cardealer', 'Stretch', 'stretch', 125000, 'sedans', NULL, NULL),
(312, 'motodealer', 'stryder', 'stryder', 55000, 'motorcycles', NULL, NULL),
(313, 'cardealer', 'sugoi', 'sugoi', 29000, 'sports', NULL, NULL),
(314, 'cardealer', 'Sultan', 'sultan', 61000, 'sports', NULL, NULL),
(315, 'cardealer', 'sultan2', 'sultan2', 20000, 'sports', NULL, NULL),
(316, 'cardealer', 'Sultan RS', 'sultanrs', 85000, 'sports', NULL, NULL),
(317, 'cardealer', 'Super Diamond', 'superd', 130000, 'sedans', NULL, NULL),
(318, 'cardealer', 'Surano', 'surano', 50000, 'sports', NULL, NULL),
(319, 'cardealer', 'Surfer', 'surfer', 12000, 'vans', NULL, NULL),
(321, 'cardealer', 'surge', 'surge', 45000, 'sedans', NULL, NULL),
(322, 'cardealer', 'swinger', 'swinger', 37000, 'sports', NULL, NULL),
(325, 'cardealer', 'Tailgater', 'tailgater', 30000, 'sedans', NULL, NULL),
(327, 'cardealer', 'Tampa', 'tampa', 16000, 'muscle', NULL, NULL),
(328, 'cardealer', 'Drift Tampa', 'tampa2', 80000, 'sports', NULL, NULL),
(329, 'cardealer', 'tempesta', 'tempesta', 185000, 'super', NULL, NULL),
(332, 'motodealer', 'Thrust', 'thrust', 24000, 'motorcycles', NULL, NULL),
(334, 'cardealer', 'torero', 'torero', 98000, 'sports', NULL, NULL),
(335, 'cardealer', 'tornado', 'tornado', 20000, 'sports', NULL, NULL),
(340, 'cardealer', 'tornado6', 'tornado6', 45000, 'sports', NULL, NULL),
(341, 'cardealer', 'toros', 'toros', 91000, 'suvs', NULL, NULL),
(342, 'cardealer', 'Tri bike', 'tribike', 520, 'motorcycles', NULL, NULL),
(343, 'cardealer', 'Tri bike', 'tribike2', 520, 'motorcycles', NULL, NULL),
(344, 'cardealer', 'Tri bike', 'tribike3', 520, 'motorcycles', NULL, NULL),
(345, 'cardealer', 'Trophy Truck', 'trophytruck', 60000, 'offroad', NULL, NULL),
(346, 'cardealer', 'Trophy Truck Limited', 'trophytruck2', 80000, 'offroad', NULL, NULL),
(347, 'cardealer', 'Tropos', 'tropos', 40000, 'sports', NULL, NULL),
(348, 'cardealer', 'tulip', 'tulip', 45000, 'muscle', NULL, NULL),
(349, 'cardealer', 'turismo2', 'turismo2', 122000, 'sports', NULL, NULL),
(354, 'motodealer', 'Vader', 'vader', 12200, 'motorcycles', NULL, NULL),
(356, 'cardealer', 'vagrant', 'vagrant', 45000, 'offroad', NULL, NULL),
(357, 'cardealer', 'vamos', 'vamos', 45000, 'muscle', NULL, NULL),
(358, 'cardealer', 'Verlierer', 'verlierer2', 70000, 'sports', NULL, NULL),
(359, 'cardealer', 'verus', 'verus', 45000, 'offroad', NULL, NULL),
(360, 'cardealer', 'Vigero', 'vigero', 12500, 'muscle', NULL, NULL),
(361, 'motodealer', 'vindicator', 'vindicator', 45000, 'motorcycles', NULL, NULL),
(362, 'cardealer', 'Virgo', 'virgo', 14000, 'muscle', NULL, NULL),
(363, 'cardealer', 'virgo2', 'virgo2', 45000, 'muscle', NULL, NULL),
(364, 'cardealer', 'virgo3', 'virgo3', 45000, 'muscle', NULL, NULL),
(365, 'cardealer', 'Viseris', 'viseris', 87500, 'sportsclassics', NULL, NULL),
(367, 'cardealer', 'Voltic', 'voltic', 90000, 'super', NULL, NULL),
(368, 'cardealer', 'Voodoo', 'voodoo', 22000, 'muscle', NULL, NULL),
(370, 'motodealer', 'Vortex', 'vortex', 9800, 'motorcycles', NULL, NULL),
(371, 'cardealer', 'vstr', 'vstr', 115000, 'sports', NULL, NULL),
(372, 'cardealer', 'Warrener', 'warrener', 4000, 'sedans', NULL, NULL),
(373, 'cardealer', 'Washington', 'washington', 9000, 'sedans', NULL, NULL),
(374, 'cardealer', 'weevil', 'weevil', 8000, 'compacts', NULL, NULL),
(375, 'cardealer', 'Windsor', 'windsor', 95000, 'coupes', NULL, NULL),
(376, 'cardealer', 'Windsor Drop', 'windsor2', 125000, 'coupes', NULL, NULL),
(377, 'cardealer', 'winky', 'winky', 45000, 'offroad', NULL, NULL),
(378, 'motodealer', 'Woflsbane', 'wolfsbane', 9000, 'motorcycles', NULL, NULL),
(379, 'cardealer', 'xa21', 'xa21', 70000, 'super', NULL, NULL),
(380, 'cardealer', 'XLS', 'xls', 32000, 'suvs', NULL, NULL),
(381, 'cardealer', 'Yosemite', 'yosemite', 101000, 'muscle', NULL, NULL),
(382, 'cardealer', 'yosemite2', 'yosemite2', 45000, 'muscle', NULL, NULL),
(383, 'cardealer', 'yosemite3', 'yosemite3', 45000, 'muscle', NULL, NULL),
(384, 'cardealer', 'Youga', 'youga', 10800, 'vans', NULL, NULL),
(385, 'cardealer', 'Youga Luxuary', 'youga2', 14500, 'vans', NULL, NULL),
(386, 'cardealer', 'youga3', 'youga3', 20000, 'vans', NULL, NULL),
(387, 'cardealer', 'Z190', 'z190', 90000, 'sportsclassics', NULL, NULL),
(389, 'cardealer', 'Zion', 'zion', 36000, 'coupes', NULL, NULL),
(390, 'cardealer', 'Zion Cabrio', 'zion2', 45000, 'coupes', NULL, NULL),
(391, 'cardealer', 'zion3', 'zion3', 90000, 'sports', NULL, NULL),
(392, 'motodealer', 'Zombie', 'zombiea', 9500, 'motorcycles', NULL, NULL),
(393, 'motodealer', 'Zombie Luxuary', 'zombieb', 12000, 'motorcycles', NULL, NULL),
(394, 'cardealer', 'zorrusso', 'zorrusso', 109000, 'super', NULL, NULL),
(395, 'cardealer', 'caracara2', 'caracara2', 55000, 'offroad', NULL, NULL),
(396, 'cardealer', 'Z-Type', 'ztype', 220000, 'sportsclassics', NULL, NULL),
(397, 'cardealer', 'comet6', 'comet6', 182000, 'sports', NULL, NULL),
(398, 'cardealer', 'dominator7', 'dominator7', 72000, 'sports', NULL, NULL),
(399, 'cardealer', 'dominator8', 'dominator8', 67000, 'sports', NULL, NULL),
(400, 'cardealer', 'euros', 'euros', 28000, 'sports', NULL, NULL),
(401, 'cardealer', 'futo2', 'futo2', 21000, 'compact', NULL, NULL),
(402, 'cardealer', 'rt3000', 'rt3000', 2000, 'sports', NULL, NULL),
(403, 'cardealer', 'sultan3', 'sultan3', 60000, 'sports', NULL, NULL),
(404, 'cardealer', 'tailgater2', 'tailgater2', 100000, 'sports', NULL, NULL),
(406, 'cardealer', 'vectre', 'vectre', 42000, 'sports', NULL, NULL),
(407, 'cardealer', 'remus', 'remus', 30000, 'sports', NULL, NULL),
(408, 'cardealer', 'calico', 'calico', 38000, 'sports', NULL, NULL),
(409, 'cardealer', 'cypher', 'cypher', 90000, 'sports', NULL, NULL),
(410, 'cardealer', 'jester4', 'jester4', 49000, 'sports', NULL, NULL),
(411, 'cardealer', 'zr350', 'zr350', 43000, 'sports', NULL, NULL),
(414, 'cardealer', 'Pfister Astron', 'astron', 103000, 'SUVs', NULL, NULL),
(415, 'cardealer', 'Gallivanter Baller ST', 'baller7', 55000, 'SUVs', NULL, NULL),
(416, 'cardealer', 'Bravado Buffalo STX', 'buffalo4', 42000, 'Muscle', NULL, NULL),
(418, 'cardealer', 'Lampadati Cinquemila', 'cinquemila', 65000, 'Sedans', NULL, NULL),
(419, 'cardealer', 'Pfister Comet S2 Cabrio', 'comet7', 137000, 'Sports', NULL, NULL),
(420, 'cardealer', 'Enus Deity', 'deity', 69000, 'Sedans', NULL, NULL),
(421, 'cardealer', 'Declasse Granger 3600LX', 'granger2', 65000, 'SUVs', NULL, NULL),
(423, 'cardealer', 'Obey IWagen', 'iwagen', 66000, 'SUVs', NULL, NULL),
(424, 'cardealer', 'Enus Jubilee', 'jubilee', 67000, 'SUVs', NULL, NULL),
(425, 'cardealer', 'Maibatsu Mule', 'mule5', 20000, 'Commercial', NULL, NULL),
(427, 'motodealer', 'Western Reever', 'reever', 20000, 'Motorcycles', NULL, NULL),
(428, 'motodealer', 'Nagasaki Shinobi', 'shinobi', 29000, 'Motorcycles', NULL, NULL),
(429, 'cardealer', 'Vapid Youga Custom', 'youga4', 20000, 'Vans', NULL, NULL),
(526, 'boatdealer', 'Toro', 'Toro2', 500000, 'boat', NULL, NULL),
(527, 'boatdealer', 'Speeder', 'speeder', 325000, 'boat', NULL, NULL),
(528, 'boatdealer', 'SeaShark V2', 'seashark2', 125000, 'boat', NULL, NULL),
(529, 'boatdealer', 'Marquis Voilier', 'marquis', 250000, 'boat', NULL, NULL),
(530, 'boatdealer', 'JetMax', 'jetmax', 300000, 'boat', NULL, NULL),
(532, 'boatdealer', 'Dinghy Super', 'dinghy4', 250000, 'boat', NULL, NULL),
(539, 'airdealer', 'Frogger', 'frogger', 610000, 'aircraft', NULL, NULL),
(540, 'airdealer', 'Frogger 2', 'frogger2', 800000, 'aircraft', NULL, NULL),
(541, 'airdealer', 'Havok', 'havok', 210000, 'aircraft', NULL, NULL),
(542, 'airdealer', 'Maverick', 'maverick', 750000, 'aircraft', NULL, NULL),
(545, 'airdealer', 'Supervolito 2', 'supervolito2', 1000000, 'aircraft', NULL, NULL),
(546, 'airdealer', 'Swift', 'swift', 1200000, 'aircraft', NULL, NULL),
(547, 'airdealer', 'Volatus', 'volatus', 2000000, 'aircraft', NULL, NULL),
(548, 'airdealer', 'Delta plane', 'microlight', 400000, 'aircraft', NULL, NULL),
(549, 'airdealer', 'AlphaZ1', 'alphaz1', 500000, 'aircraft', NULL, NULL),
(550, 'airdealer', 'Cuban 800', 'cuban800', 450000, 'aircraft', NULL, NULL),
(551, 'airdealer', 'Dodo', 'dodo', 550000, 'aircraft', NULL, NULL),
(552, 'airdealer', 'Duster', 'duster', 190000, 'aircraft', NULL, NULL),
(556, 'airdealer', 'Mammatus', 'mammatus', 400000, 'aircraft', NULL, NULL),
(563, 'airdealer', 'Velum sport', 'velum2', 700000, 'aircraft', NULL, NULL),
(564, 'airdealer', 'Vestra', 'vestra', 1000000, 'aircraft', NULL, NULL),
(565, 'airdealer', 'Swift 2', 'swift2', 1500000, 'aircraft', NULL, NULL),
(569, 'boatdealer', 'Yatch Semi-Luxe', 'sr650fly', 4000000, 'boat', NULL, NULL),
(638, 'cardealer', 'tyrus', 'tyrus', 340000, 'super', NULL, NULL),
(639, 'cardealer', 'tyrant', 'tyrant', 275000, 'super', NULL, NULL),
(640, 'cardealer', 'growler', 'growler', 100000, 'sports', NULL, NULL),
(641, 'cardealer', 'coquette4', 'coquette4', 410000, 'super', NULL, NULL),
(651, 'boatdealer', 'Suntrap', 'suntrap', 250000, 'boat', NULL, NULL),
(652, 'boatdealer', 'Longfin', 'longfin', 700000, 'boat', NULL, NULL),
(653, 'boatdealer', 'SeaShark V1', 'seashark', 100000, 'boat', NULL, NULL),
(656, 'cardealer', 'Buffalo H', 'buffaloh', 96000, 'Imports', NULL, NULL),
(657, 'cardealer', 'Cypher CT', 'cypherct', 85000, 'Imports', NULL, NULL),
(658, 'cardealer', 'Audace', 'audace', 268000, 'Imports', NULL, NULL),
(659, 'cardealer', 'Astero ', 'asteropers', 145000, 'Imports', NULL, NULL),
(660, 'cardealer', 'Argento', 'argento', 366000, 'Imports', NULL, NULL),
(661, 'cardealer', 'Gresley H', 'gresleyh', 125000, 'Imports', NULL, NULL),
(662, 'cardealer', 'GTorino', 'gtorino76', 55000, 'Imports', NULL, NULL),
(663, 'cardealer', 'Burrito 6', 'burrito6', 86000, 'Imports', NULL, NULL),
(664, 'cardealer', 'New Speedo', 'nspeedo', 85000, 'ENTREPRISE', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vehicules_categories`
--

CREATE TABLE `vehicules_categories` (
  `job` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicules_categories`
--

INSERT INTO `vehicules_categories` (`job`, `name`, `label`) VALUES
('cardealer', 'compacts', 'Kompaktwagen'),
('cardealer', 'coupes', 'Coupés'),
('boutique', 'imports', 'Boutique'),
('motodealer', 'motorcycles', 'Motorräder'),
('cardealer', 'muscle', 'Muscle Cars'),
('cardealer', 'offroad', 'Geländewagen'),
('cardealer', 'sedans', 'Limousinen'),
('cardealer', 'sports', 'Sportwagen'),
('cardealer', 'sportsclassics', 'Klassische Sportwagen'),
('cardealer', 'super', 'Supersportwagen'),
('cardealer', 'suvs', 'SUVs'),
('cardealer', 'vans', 'Transporter');

-- --------------------------------------------------------

--
-- Structure de la table `vente_leboncoin`
--

CREATE TABLE `vente_leboncoin` (
  `price` longtext DEFAULT NULL,
  `id` longtext DEFAULT NULL,
  `identifier` int(11) NOT NULL,
  `UniqueID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vips`
--

CREATE TABLE `vips` (
  `UniqueID` int(11) NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  `money` tinyint(4) DEFAULT NULL,
  `arme` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vips`
--

INSERT INTO `vips` (`UniqueID`, `time`, `money`, `arme`) VALUES
(1, 838, 0, 'ok'),
(2, 71, 1, 'ok');

-- --------------------------------------------------------

--
-- Structure de la table `weapon_confiscate`
--

CREATE TABLE `weapon_confiscate` (
  `id` int(255) NOT NULL,
  `uniqueid` varchar(255) NOT NULL,
  `weapon_name` varchar(255) NOT NULL,
  `time` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `world_props`
--

CREATE TABLE `world_props` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `owner` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `iid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `xmas_calendar`
--

CREATE TABLE `xmas_calendar` (
  `id` int(11) NOT NULL,
  `identifier` varchar(64) NOT NULL,
  `day` int(11) NOT NULL,
  `opened_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



-- --------------------------------------------------------

--
-- Structure de la table `zban`
--

CREATE TABLE `zban` (
  `uniqueid` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `perm` tinyint(1) DEFAULT 0,
  `reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `0r_clothing_image_data`
--
ALTER TABLE `0r_clothing_image_data`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `0r_clothing_tattoos`
--
ALTER TABLE `0r_clothing_tattoos`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Index pour la table `admin_jails`
--
ALTER TABLE `admin_jails`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `ad_admin`
--
ALTER TABLE `ad_admin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `ad_banlist`
--
ALTER TABLE `ad_banlist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ad_unban`
--
ALTER TABLE `ad_unban`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ad_whitelist`
--
ALTER TABLE `ad_whitelist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `animals_perm`
--
ALTER TABLE `animals_perm`
  ADD PRIMARY KEY (`idunique`);

--
-- Index pour la table `appel_jobs`
--
ALTER TABLE `appel_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bcso_plainte`
--
ALTER TABLE `bcso_plainte`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `blanchiment`
--
ALTER TABLE `blanchiment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `boat_categories`
--
ALTER TABLE `boat_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `boutique`
--
ALTER TABLE `boutique`
  ADD PRIMARY KEY (`citizenID`),
  ADD UNIQUE KEY `boutique_code` (`boutique_code`);

--
-- Index pour la table `boutique_gains`
--
ALTER TABLE `boutique_gains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `citizenId` (`citizenId`,`item`);

--
-- Index pour la table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `chasse`
--
ALTER TABLE `chasse`
  ADD UNIQUE KEY `uniqueid` (`uniqueid`);

--
-- Index pour la table `clothes_inventory`
--
ALTER TABLE `clothes_inventory`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `darkchat_messages`
--
ALTER TABLE `darkchat_messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Index pour la table `detention_records`
--
ALTER TABLE `detention_records`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `drugs_sell`
--
ALTER TABLE `drugs_sell`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gangs_new`
--
ALTER TABLE `gangs_new`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gfxmdt_avatars`
--
ALTER TABLE `gfxmdt_avatars`
  ADD KEY `id` (`id`);

--
-- Index pour la table `gfxmdt_banlist`
--
ALTER TABLE `gfxmdt_banlist`
  ADD KEY `id` (`id`);

--
-- Index pour la table `gfxmdt_department`
--
ALTER TABLE `gfxmdt_department`
  ADD KEY `id` (`id`);

--
-- Index pour la table `gfxmdt_fines`
--
ALTER TABLE `gfxmdt_fines`
  ADD KEY `id` (`id`);

--
-- Index pour la table `gfxmdt_notifications`
--
ALTER TABLE `gfxmdt_notifications`
  ADD KEY `id` (`id`);

--
-- Index pour la table `gfxmdt_offenders`
--
ALTER TABLE `gfxmdt_offenders`
  ADD KEY `id` (`id`);

--
-- Index pour la table `gfxmdt_polices`
--
ALTER TABLE `gfxmdt_polices`
  ADD KEY `id` (`id`);

--
-- Index pour la table `gfxmdt_records`
--
ALTER TABLE `gfxmdt_records`
  ADD KEY `id` (`id`);

--
-- Index pour la table `gfxmdt_wanteds`
--
ALTER TABLE `gfxmdt_wanteds`
  ADD KEY `id` (`id`);

--
-- Index pour la table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `illegal_drugs_sell`
--
ALTER TABLE `illegal_drugs_sell`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `illegal_laboratory`
--
ALTER TABLE `illegal_laboratory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_ambulance_accounts`
--
ALTER TABLE `lbtablet_ambulance_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_ambulance_bulletin`
--
ALTER TABLE `lbtablet_ambulance_bulletin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_ambulance_conditions`
--
ALTER TABLE `lbtablet_ambulance_conditions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `severity` (`severity`,`category_id`,`title`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `lbtablet_ambulance_conditions_categories`
--
ALTER TABLE `lbtablet_ambulance_conditions_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Index pour la table `lbtablet_ambulance_logs`
--
ALTER TABLE `lbtablet_ambulance_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Index pour la table `lbtablet_ambulance_profiles`
--
ALTER TABLE `lbtablet_ambulance_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_ambulance_profile_conditions`
--
ALTER TABLE `lbtablet_ambulance_profile_conditions`
  ADD PRIMARY KEY (`profile_id`,`condition_id`),
  ADD KEY `condition_id` (`condition_id`);

--
-- Index pour la table `lbtablet_ambulance_profile_tags`
--
ALTER TABLE `lbtablet_ambulance_profile_tags`
  ADD PRIMARY KEY (`id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_ambulance_reports`
--
ALTER TABLE `lbtablet_ambulance_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_ambulance_reports_attachments`
--
ALTER TABLE `lbtablet_ambulance_reports_attachments`
  ADD PRIMARY KEY (`report_id`,`attachment`);

--
-- Index pour la table `lbtablet_ambulance_reports_conditions`
--
ALTER TABLE `lbtablet_ambulance_reports_conditions`
  ADD PRIMARY KEY (`report_id`,`condition_id`),
  ADD KEY `condition_id` (`condition_id`);

--
-- Index pour la table `lbtablet_ambulance_reports_doctors`
--
ALTER TABLE `lbtablet_ambulance_reports_doctors`
  ADD PRIMARY KEY (`report_id`,`doctor`),
  ADD KEY `doctor` (`doctor`);

--
-- Index pour la table `lbtablet_ambulance_reports_tags`
--
ALTER TABLE `lbtablet_ambulance_reports_tags`
  ADD PRIMARY KEY (`report_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_ambulance_tags`
--
ALTER TABLE `lbtablet_ambulance_tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_apps_loggedin`
--
ALTER TABLE `lbtablet_apps_loggedin`
  ADD PRIMARY KEY (`tablet_id`,`app`,`account`);

--
-- Index pour la table `lbtablet_chat_rooms`
--
ALTER TABLE `lbtablet_chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_chat_rooms_members`
--
ALTER TABLE `lbtablet_chat_rooms_members`
  ADD PRIMARY KEY (`room_id`,`account`);

--
-- Index pour la table `lbtablet_chat_rooms_messages`
--
ALTER TABLE `lbtablet_chat_rooms_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Index pour la table `lbtablet_clock_alarms`
--
ALTER TABLE `lbtablet_clock_alarms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `lbtablet_notes`
--
ALTER TABLE `lbtablet_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `lbtablet_notifications`
--
ALTER TABLE `lbtablet_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `lbtablet_photos`
--
ALTER TABLE `lbtablet_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `lbtablet_photo_albums`
--
ALTER TABLE `lbtablet_photo_albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `lbtablet_photo_album_photos`
--
ALTER TABLE `lbtablet_photo_album_photos`
  ADD PRIMARY KEY (`album_id`,`photo_id`),
  ADD KEY `photo_id` (`photo_id`);

--
-- Index pour la table `lbtablet_police_accounts`
--
ALTER TABLE `lbtablet_police_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_police_bulletin`
--
ALTER TABLE `lbtablet_police_bulletin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_police_cases`
--
ALTER TABLE `lbtablet_police_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_police_cases_charges`
--
ALTER TABLE `lbtablet_police_cases_charges`
  ADD PRIMARY KEY (`case_id`,`criminal`,`offence_id`),
  ADD KEY `offence_id` (`offence_id`);

--
-- Index pour la table `lbtablet_police_cases_criminals`
--
ALTER TABLE `lbtablet_police_cases_criminals`
  ADD PRIMARY KEY (`case_id`,`id`);

--
-- Index pour la table `lbtablet_police_cases_evidence`
--
ALTER TABLE `lbtablet_police_cases_evidence`
  ADD PRIMARY KEY (`case_id`,`attachment`);

--
-- Index pour la table `lbtablet_police_cases_involved`
--
ALTER TABLE `lbtablet_police_cases_involved`
  ADD PRIMARY KEY (`case_id`,`involved`);

--
-- Index pour la table `lbtablet_police_cases_tags`
--
ALTER TABLE `lbtablet_police_cases_tags`
  ADD PRIMARY KEY (`case_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_police_jail`
--
ALTER TABLE `lbtablet_police_jail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `related_case` (`related_case`);

--
-- Index pour la table `lbtablet_police_logs`
--
ALTER TABLE `lbtablet_police_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Index pour la table `lbtablet_police_offences`
--
ALTER TABLE `lbtablet_police_offences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_id` (`category_id`,`class`,`title`);

--
-- Index pour la table `lbtablet_police_offences_categories`
--
ALTER TABLE `lbtablet_police_offences_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Index pour la table `lbtablet_police_profiles`
--
ALTER TABLE `lbtablet_police_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_police_profile_tags`
--
ALTER TABLE `lbtablet_police_profile_tags`
  ADD PRIMARY KEY (`id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_police_reports`
--
ALTER TABLE `lbtablet_police_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_police_reports_attachments`
--
ALTER TABLE `lbtablet_police_reports_attachments`
  ADD PRIMARY KEY (`report_id`,`attachment`);

--
-- Index pour la table `lbtablet_police_reports_involved`
--
ALTER TABLE `lbtablet_police_reports_involved`
  ADD PRIMARY KEY (`report_id`,`involved`);

--
-- Index pour la table `lbtablet_police_reports_tags`
--
ALTER TABLE `lbtablet_police_reports_tags`
  ADD PRIMARY KEY (`report_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_police_tags`
--
ALTER TABLE `lbtablet_police_tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_police_warrants`
--
ALTER TABLE `lbtablet_police_warrants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_police_warrants_attachments`
--
ALTER TABLE `lbtablet_police_warrants_attachments`
  ADD PRIMARY KEY (`warrant_id`,`attachment`);

--
-- Index pour la table `lbtablet_police_warrants_linked_reports`
--
ALTER TABLE `lbtablet_police_warrants_linked_reports`
  ADD PRIMARY KEY (`warrant_id`,`report_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Index pour la table `lbtablet_police_warrants_tags`
--
ALTER TABLE `lbtablet_police_warrants_tags`
  ADD PRIMARY KEY (`warrant_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_police_weapons`
--
ALTER TABLE `lbtablet_police_weapons`
  ADD PRIMARY KEY (`serial_number`);

--
-- Index pour la table `lbtablet_registration_characters`
--
ALTER TABLE `lbtablet_registration_characters`
  ADD PRIMARY KEY (`character_id`);

--
-- Index pour la table `lbtablet_registration_licenses`
--
ALTER TABLE `lbtablet_registration_licenses`
  ADD PRIMARY KEY (`character_id`,`license`);

--
-- Index pour la table `lbtablet_registration_properties`
--
ALTER TABLE `lbtablet_registration_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`);

--
-- Index pour la table `lbtablet_registration_vehicles`
--
ALTER TABLE `lbtablet_registration_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`),
  ADD KEY `character_id` (`character_id`);

--
-- Index pour la table `lbtablet_tablets`
--
ALTER TABLE `lbtablet_tablets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_voice_memo_recordings`
--
ALTER TABLE `lbtablet_voice_memo_recordings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Index pour la table `maintenant`
--
ALTER TABLE `maintenant`
  ADD PRIMARY KEY (`active`);

--
-- Index pour la table `moto_categories`
--
ALTER TABLE `moto_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `open_car`
--
ALTER TABLE `open_car`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `ox_doorlock`
--
ALTER TABLE `ox_doorlock`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pausemenu_battlepass_data`
--
ALTER TABLE `pausemenu_battlepass_data`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pausemenu_commands`
--
ALTER TABLE `pausemenu_commands`
  ADD UNIQUE KEY `command` (`command`) USING HASH;

--
-- Index pour la table `pausemenu_guidebook`
--
ALTER TABLE `pausemenu_guidebook`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pausemenu_keybinds`
--
ALTER TABLE `pausemenu_keybinds`
  ADD UNIQUE KEY `key` (`key`) USING HASH;

--
-- Index pour la table `phone_backups`
--
ALTER TABLE `phone_backups`
  ADD PRIMARY KEY (`id`,`phone_number`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_clock_alarms`
--
ALTER TABLE `phone_clock_alarms`
  ADD PRIMARY KEY (`id`,`phone_number`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_crypto`
--
ALTER TABLE `phone_crypto`
  ADD PRIMARY KEY (`id`,`coin`);

--
-- Index pour la table `phone_darkchat_accounts`
--
ALTER TABLE `phone_darkchat_accounts`
  ADD PRIMARY KEY (`username`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_darkchat_channels`
--
ALTER TABLE `phone_darkchat_channels`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `phone_darkchat_members`
--
ALTER TABLE `phone_darkchat_members`
  ADD PRIMARY KEY (`channel_name`,`username`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_darkchat_messages`
--
ALTER TABLE `phone_darkchat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel` (`channel`),
  ADD KEY `sender` (`sender`);

--
-- Index pour la table `phone_instagram_accounts`
--
ALTER TABLE `phone_instagram_accounts`
  ADD PRIMARY KEY (`username`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_instagram_comments`
--
ALTER TABLE `phone_instagram_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_instagram_follows`
--
ALTER TABLE `phone_instagram_follows`
  ADD PRIMARY KEY (`followed`,`follower`),
  ADD KEY `follower` (`follower`);

--
-- Index pour la table `phone_instagram_follow_requests`
--
ALTER TABLE `phone_instagram_follow_requests`
  ADD PRIMARY KEY (`requester`,`requestee`),
  ADD KEY `requestee` (`requestee`);

--
-- Index pour la table `phone_instagram_likes`
--
ALTER TABLE `phone_instagram_likes`
  ADD PRIMARY KEY (`id`,`username`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_instagram_messages`
--
ALTER TABLE `phone_instagram_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`sender`),
  ADD KEY `recipient` (`recipient`);

--
-- Index pour la table `phone_instagram_notifications`
--
ALTER TABLE `phone_instagram_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `from` (`from`);

--
-- Index pour la table `phone_instagram_posts`
--
ALTER TABLE `phone_instagram_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_instagram_stories`
--
ALTER TABLE `phone_instagram_stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_instagram_stories_views`
--
ALTER TABLE `phone_instagram_stories_views`
  ADD PRIMARY KEY (`story_id`,`viewer`),
  ADD KEY `viewer` (`viewer`);

--
-- Index pour la table `phone_last_phone`
--
ALTER TABLE `phone_last_phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_logged_in_accounts`
--
ALTER TABLE `phone_logged_in_accounts`
  ADD PRIMARY KEY (`phone_number`,`app`,`username`);

--
-- Index pour la table `phone_mail_accounts`
--
ALTER TABLE `phone_mail_accounts`
  ADD PRIMARY KEY (`address`);

--
-- Index pour la table `phone_mail_deleted`
--
ALTER TABLE `phone_mail_deleted`
  ADD PRIMARY KEY (`message_id`,`address`),
  ADD KEY `address` (`address`);

--
-- Index pour la table `phone_mail_messages`
--
ALTER TABLE `phone_mail_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_maps_locations`
--
ALTER TABLE `phone_maps_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_marketplace_posts`
--
ALTER TABLE `phone_marketplace_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_message_channels`
--
ALTER TABLE `phone_message_channels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_message_members`
--
ALTER TABLE `phone_message_members`
  ADD PRIMARY KEY (`channel_id`,`phone_number`);

--
-- Index pour la table `phone_message_messages`
--
ALTER TABLE `phone_message_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Index pour la table `phone_music_playlists`
--
ALTER TABLE `phone_music_playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_music_saved_playlists`
--
ALTER TABLE `phone_music_saved_playlists`
  ADD PRIMARY KEY (`playlist_id`,`phone_number`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_music_songs`
--
ALTER TABLE `phone_music_songs`
  ADD PRIMARY KEY (`song_id`,`playlist_id`),
  ADD KEY `playlist_id` (`playlist_id`);

--
-- Index pour la table `phone_notes`
--
ALTER TABLE `phone_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_notifications`
--
ALTER TABLE `phone_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_phones`
--
ALTER TABLE `phone_phones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_phone_blocked_numbers`
--
ALTER TABLE `phone_phone_blocked_numbers`
  ADD PRIMARY KEY (`phone_number`,`blocked_number`);

--
-- Index pour la table `phone_phone_calls`
--
ALTER TABLE `phone_phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_phone_contacts`
--
ALTER TABLE `phone_phone_contacts`
  ADD PRIMARY KEY (`contact_phone_number`,`phone_number`);

--
-- Index pour la table `phone_phone_voicemail`
--
ALTER TABLE `phone_phone_voicemail`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_photos`
--
ALTER TABLE `phone_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_photo_albums`
--
ALTER TABLE `phone_photo_albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_photo_album_photos`
--
ALTER TABLE `phone_photo_album_photos`
  ADD PRIMARY KEY (`album_id`,`photo_id`),
  ADD KEY `photo_id` (`photo_id`);

--
-- Index pour la table `phone_services_channels`
--
ALTER TABLE `phone_services_channels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_services_messages`
--
ALTER TABLE `phone_services_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Index pour la table `phone_tiktok_accounts`
--
ALTER TABLE `phone_tiktok_accounts`
  ADD PRIMARY KEY (`username`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_tiktok_channels`
--
ALTER TABLE `phone_tiktok_channels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_1` (`member_1`,`member_2`),
  ADD KEY `member_2` (`member_2`);

--
-- Index pour la table `phone_tiktok_comments`
--
ALTER TABLE `phone_tiktok_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `username` (`username`),
  ADD KEY `reply_to` (`reply_to`);

--
-- Index pour la table `phone_tiktok_comments_likes`
--
ALTER TABLE `phone_tiktok_comments_likes`
  ADD PRIMARY KEY (`username`,`comment_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Index pour la table `phone_tiktok_follows`
--
ALTER TABLE `phone_tiktok_follows`
  ADD PRIMARY KEY (`followed`,`follower`),
  ADD KEY `follower` (`follower`);

--
-- Index pour la table `phone_tiktok_likes`
--
ALTER TABLE `phone_tiktok_likes`
  ADD PRIMARY KEY (`username`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Index pour la table `phone_tiktok_messages`
--
ALTER TABLE `phone_tiktok_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `sender` (`sender`);

--
-- Index pour la table `phone_tiktok_notifications`
--
ALTER TABLE `phone_tiktok_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `from` (`from`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Index pour la table `phone_tiktok_pinned_videos`
--
ALTER TABLE `phone_tiktok_pinned_videos`
  ADD PRIMARY KEY (`username`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Index pour la table `phone_tiktok_saves`
--
ALTER TABLE `phone_tiktok_saves`
  ADD PRIMARY KEY (`username`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Index pour la table `phone_tiktok_unread_messages`
--
ALTER TABLE `phone_tiktok_unread_messages`
  ADD PRIMARY KEY (`username`,`channel_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Index pour la table `phone_tiktok_videos`
--
ALTER TABLE `phone_tiktok_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_tiktok_views`
--
ALTER TABLE `phone_tiktok_views`
  ADD PRIMARY KEY (`username`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Index pour la table `phone_tinder_accounts`
--
ALTER TABLE `phone_tinder_accounts`
  ADD PRIMARY KEY (`phone_number`);

--
-- Index pour la table `phone_tinder_matches`
--
ALTER TABLE `phone_tinder_matches`
  ADD PRIMARY KEY (`phone_number_1`,`phone_number_2`),
  ADD KEY `phone_number_2` (`phone_number_2`);

--
-- Index pour la table `phone_tinder_messages`
--
ALTER TABLE `phone_tinder_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`sender`),
  ADD KEY `recipient` (`recipient`);

--
-- Index pour la table `phone_tinder_swipes`
--
ALTER TABLE `phone_tinder_swipes`
  ADD PRIMARY KEY (`swiper`,`swipee`),
  ADD KEY `swipee` (`swipee`);

--
-- Index pour la table `phone_twitter_accounts`
--
ALTER TABLE `phone_twitter_accounts`
  ADD PRIMARY KEY (`username`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_twitter_follows`
--
ALTER TABLE `phone_twitter_follows`
  ADD PRIMARY KEY (`followed`,`follower`),
  ADD KEY `follower` (`follower`);

--
-- Index pour la table `phone_twitter_follow_requests`
--
ALTER TABLE `phone_twitter_follow_requests`
  ADD PRIMARY KEY (`requester`,`requestee`),
  ADD KEY `requestee` (`requestee`);

--
-- Index pour la table `phone_twitter_hashtags`
--
ALTER TABLE `phone_twitter_hashtags`
  ADD PRIMARY KEY (`hashtag`);

--
-- Index pour la table `phone_twitter_likes`
--
ALTER TABLE `phone_twitter_likes`
  ADD PRIMARY KEY (`tweet_id`,`username`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_twitter_messages`
--
ALTER TABLE `phone_twitter_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`sender`),
  ADD KEY `recipient` (`recipient`);

--
-- Index pour la table `phone_twitter_notifications`
--
ALTER TABLE `phone_twitter_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `from` (`from`);

--
-- Index pour la table `phone_twitter_promoted`
--
ALTER TABLE `phone_twitter_promoted`
  ADD PRIMARY KEY (`tweet_id`);

--
-- Index pour la table `phone_twitter_retweets`
--
ALTER TABLE `phone_twitter_retweets`
  ADD PRIMARY KEY (`tweet_id`,`username`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_twitter_tweets`
--
ALTER TABLE `phone_twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_voice_memos_recordings`
--
ALTER TABLE `phone_voice_memos_recordings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_wallet_transactions`
--
ALTER TABLE `phone_wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_yellow_pages_posts`
--
ALTER TABLE `phone_yellow_pages_posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `players_gofast`
--
ALTER TABLE `players_gofast`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `license_identifier` (`license_identifier`);

--
-- Index pour la table `players_props`
--
ALTER TABLE `players_props`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `players_territories`
--
ALTER TABLE `players_territories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `player_clothes`
--
ALTER TABLE `player_clothes`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `player_entreprise`
--
ALTER TABLE `player_entreprise`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `player_gallery`
--
ALTER TABLE `player_gallery`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `player_inventory_clothes`
--
ALTER TABLE `player_inventory_clothes`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `player_jails`
--
ALTER TABLE `player_jails`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `player_leboncoin`
--
ALTER TABLE `player_leboncoin`
  ADD UNIQUE KEY `identifier` (`identifier`) USING HASH;

--
-- Index pour la table `player_livraisons`
--
ALTER TABLE `player_livraisons`
  ADD PRIMARY KEY (`uniqueid`);

--
-- Index pour la table `player_ltdsales`
--
ALTER TABLE `player_ltdsales`
  ADD PRIMARY KEY (`uid`);

--
-- Index pour la table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playlist_songs`
--
ALTER TABLE `playlist_songs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `police_plainte`
--
ALTER TABLE `police_plainte`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`propertiesID`);

--
-- Index pour la table `radiocar_music`
--
ALTER TABLE `radiocar_music`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `radiocar_owned`
--
ALTER TABLE `radiocar_owned`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `radiocar_playlist`
--
ALTER TABLE `radiocar_playlist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rcore_tattoos`
--
ALTER TABLE `rcore_tattoos`
  ADD PRIMARY KEY (`identifier`),
  ADD UNIQUE KEY `rcore_tattoos_identifier_uindex` (`identifier`);

--
-- Index pour la table `rcore_tattoos_business`
--
ALTER TABLE `rcore_tattoos_business`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `slots_inventory`
--
ALTER TABLE `slots_inventory`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `society_data`
--
ALTER TABLE `society_data`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sunny_clothes`
--
ALTER TABLE `sunny_clothes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sunny_trunk`
--
ALTER TABLE `sunny_trunk`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UniqueID`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicle_catalogue`
--
ALTER TABLE `vehicle_catalogue`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `vehicules_categories`
--
ALTER TABLE `vehicules_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vente_leboncoin`
--
ALTER TABLE `vente_leboncoin`
  ADD UNIQUE KEY `id` (`id`) USING HASH;

--
-- Index pour la table `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `weapon_confiscate`
--
ALTER TABLE `weapon_confiscate`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `world_props`
--
ALTER TABLE `world_props`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `xmas_calendar`
--
ALTER TABLE `xmas_calendar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`,`day`);

--
-- Index pour la table `zban`
--
ALTER TABLE `zban`
  ADD PRIMARY KEY (`uniqueid`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `0r_clothing_image_data`
--
ALTER TABLE `0r_clothing_image_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `0r_clothing_tattoos`
--
ALTER TABLE `0r_clothing_tattoos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ad_admin`
--
ALTER TABLE `ad_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `ad_banlist`
--
ALTER TABLE `ad_banlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `ad_unban`
--
ALTER TABLE `ad_unban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ad_whitelist`
--
ALTER TABLE `ad_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `animals_perm`
--
ALTER TABLE `animals_perm`
  MODIFY `idunique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `appel_jobs`
--
ALTER TABLE `appel_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `bcso_plainte`
--
ALTER TABLE `bcso_plainte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=869;

--
-- AUTO_INCREMENT pour la table `blanchiment`
--
ALTER TABLE `blanchiment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `boutique_gains`
--
ALTER TABLE `boutique_gains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT pour la table `darkchat_messages`
--
ALTER TABLE `darkchat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `detention_records`
--
ALTER TABLE `detention_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `drugs_sell`
--
ALTER TABLE `drugs_sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gangs_new`
--
ALTER TABLE `gangs_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `garages`
--
ALTER TABLE `garages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT pour la table `gfxmdt_avatars`
--
ALTER TABLE `gfxmdt_avatars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gfxmdt_banlist`
--
ALTER TABLE `gfxmdt_banlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gfxmdt_department`
--
ALTER TABLE `gfxmdt_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gfxmdt_fines`
--
ALTER TABLE `gfxmdt_fines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `gfxmdt_notifications`
--
ALTER TABLE `gfxmdt_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `gfxmdt_offenders`
--
ALTER TABLE `gfxmdt_offenders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gfxmdt_polices`
--
ALTER TABLE `gfxmdt_polices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gfxmdt_records`
--
ALTER TABLE `gfxmdt_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gfxmdt_wanteds`
--
ALTER TABLE `gfxmdt_wanteds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `illegal_drugs_sell`
--
ALTER TABLE `illegal_drugs_sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `illegal_laboratory`
--
ALTER TABLE `illegal_laboratory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3253;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_bulletin`
--
ALTER TABLE `lbtablet_ambulance_bulletin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_conditions`
--
ALTER TABLE `lbtablet_ambulance_conditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_conditions_categories`
--
ALTER TABLE `lbtablet_ambulance_conditions_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_logs`
--
ALTER TABLE `lbtablet_ambulance_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_reports`
--
ALTER TABLE `lbtablet_ambulance_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_tags`
--
ALTER TABLE `lbtablet_ambulance_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_chat_rooms`
--
ALTER TABLE `lbtablet_chat_rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_chat_rooms_messages`
--
ALTER TABLE `lbtablet_chat_rooms_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_clock_alarms`
--
ALTER TABLE `lbtablet_clock_alarms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_notes`
--
ALTER TABLE `lbtablet_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_notifications`
--
ALTER TABLE `lbtablet_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_photos`
--
ALTER TABLE `lbtablet_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `lbtablet_photo_albums`
--
ALTER TABLE `lbtablet_photo_albums`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_bulletin`
--
ALTER TABLE `lbtablet_police_bulletin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_cases`
--
ALTER TABLE `lbtablet_police_cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_jail`
--
ALTER TABLE `lbtablet_police_jail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_logs`
--
ALTER TABLE `lbtablet_police_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_offences`
--
ALTER TABLE `lbtablet_police_offences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_offences_categories`
--
ALTER TABLE `lbtablet_police_offences_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_reports`
--
ALTER TABLE `lbtablet_police_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_tags`
--
ALTER TABLE `lbtablet_police_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_warrants`
--
ALTER TABLE `lbtablet_police_warrants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_registration_properties`
--
ALTER TABLE `lbtablet_registration_properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_registration_vehicles`
--
ALTER TABLE `lbtablet_registration_vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_voice_memo_recordings`
--
ALTER TABLE `lbtablet_voice_memo_recordings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `open_car`
--
ALTER TABLE `open_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;

--
-- AUTO_INCREMENT pour la table `ox_doorlock`
--
ALTER TABLE `ox_doorlock`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT pour la table `pausemenu_battlepass_data`
--
ALTER TABLE `pausemenu_battlepass_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

--
-- AUTO_INCREMENT pour la table `pausemenu_guidebook`
--
ALTER TABLE `pausemenu_guidebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_darkchat_messages`
--
ALTER TABLE `phone_darkchat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT pour la table `phone_marketplace_posts`
--
ALTER TABLE `phone_marketplace_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `phone_message_channels`
--
ALTER TABLE `phone_message_channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=661;

--
-- AUTO_INCREMENT pour la table `phone_message_messages`
--
ALTER TABLE `phone_message_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5806;

--
-- AUTO_INCREMENT pour la table `phone_notifications`
--
ALTER TABLE `phone_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9866;

--
-- AUTO_INCREMENT pour la table `phone_photos`
--
ALTER TABLE `phone_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1041;

--
-- AUTO_INCREMENT pour la table `phone_photo_albums`
--
ALTER TABLE `phone_photo_albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_tiktok_notifications`
--
ALTER TABLE `phone_tiktok_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT pour la table `phone_tinder_messages`
--
ALTER TABLE `phone_tinder_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `phone_voice_memos_recordings`
--
ALTER TABLE `phone_voice_memos_recordings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `phone_wallet_transactions`
--
ALTER TABLE `phone_wallet_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=827;

--
-- AUTO_INCREMENT pour la table `players_gofast`
--
ALTER TABLE `players_gofast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `players_props`
--
ALTER TABLE `players_props`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `players_territories`
--
ALTER TABLE `players_territories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `player_gallery`
--
ALTER TABLE `player_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `player_ltdsales`
--
ALTER TABLE `player_ltdsales`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2046;

--
-- AUTO_INCREMENT pour la table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `playlist_songs`
--
ALTER TABLE `playlist_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `police_plainte`
--
ALTER TABLE `police_plainte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `properties`
--
ALTER TABLE `properties`
  MODIFY `propertiesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `radiocar_music`
--
ALTER TABLE `radiocar_music`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=477;

--
-- AUTO_INCREMENT pour la table `radiocar_owned`
--
ALTER TABLE `radiocar_owned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `radiocar_playlist`
--
ALTER TABLE `radiocar_playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `society_data`
--
ALTER TABLE `society_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT pour la table `sunny_clothes`
--
ALTER TABLE `sunny_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `UniqueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;

--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=665;

--
-- AUTO_INCREMENT pour la table `weapon_confiscate`
--
ALTER TABLE `weapon_confiscate`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `world_props`
--
ALTER TABLE `world_props`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `xmas_calendar`
--
ALTER TABLE `xmas_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `lbtablet_ambulance_bulletin`
--
ALTER TABLE `lbtablet_ambulance_bulletin`
  ADD CONSTRAINT `lbtablet_ambulance_bulletin_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_ambulance_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_conditions`
--
ALTER TABLE `lbtablet_ambulance_conditions`
  ADD CONSTRAINT `lbtablet_ambulance_conditions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `lbtablet_ambulance_conditions_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_profile_conditions`
--
ALTER TABLE `lbtablet_ambulance_profile_conditions`
  ADD CONSTRAINT `lbtablet_ambulance_profile_conditions_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `lbtablet_ambulance_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_ambulance_profile_conditions_ibfk_2` FOREIGN KEY (`condition_id`) REFERENCES `lbtablet_ambulance_conditions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_profile_tags`
--
ALTER TABLE `lbtablet_ambulance_profile_tags`
  ADD CONSTRAINT `lbtablet_ambulance_profile_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_ambulance_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_reports`
--
ALTER TABLE `lbtablet_ambulance_reports`
  ADD CONSTRAINT `lbtablet_ambulance_reports_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_ambulance_accounts` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_reports_attachments`
--
ALTER TABLE `lbtablet_ambulance_reports_attachments`
  ADD CONSTRAINT `lbtablet_ambulance_reports_attachments_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_reports_conditions`
--
ALTER TABLE `lbtablet_ambulance_reports_conditions`
  ADD CONSTRAINT `lbtablet_ambulance_reports_conditions_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_ambulance_reports_conditions_ibfk_2` FOREIGN KEY (`condition_id`) REFERENCES `lbtablet_ambulance_conditions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_reports_doctors`
--
ALTER TABLE `lbtablet_ambulance_reports_doctors`
  ADD CONSTRAINT `lbtablet_ambulance_reports_doctors_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_ambulance_reports_doctors_ibfk_2` FOREIGN KEY (`doctor`) REFERENCES `lbtablet_ambulance_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_reports_tags`
--
ALTER TABLE `lbtablet_ambulance_reports_tags`
  ADD CONSTRAINT `lbtablet_ambulance_reports_tags_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_ambulance_reports_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_ambulance_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_apps_loggedin`
--
ALTER TABLE `lbtablet_apps_loggedin`
  ADD CONSTRAINT `lbtablet_apps_loggedin_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_chat_rooms_members`
--
ALTER TABLE `lbtablet_chat_rooms_members`
  ADD CONSTRAINT `lbtablet_chat_rooms_members_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `lbtablet_chat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_chat_rooms_messages`
--
ALTER TABLE `lbtablet_chat_rooms_messages`
  ADD CONSTRAINT `lbtablet_chat_rooms_messages_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `lbtablet_chat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_clock_alarms`
--
ALTER TABLE `lbtablet_clock_alarms`
  ADD CONSTRAINT `lbtablet_clock_alarms_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_notes`
--
ALTER TABLE `lbtablet_notes`
  ADD CONSTRAINT `lbtablet_notes_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_notifications`
--
ALTER TABLE `lbtablet_notifications`
  ADD CONSTRAINT `lbtablet_notifications_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_photos`
--
ALTER TABLE `lbtablet_photos`
  ADD CONSTRAINT `lbtablet_photos_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_photo_albums`
--
ALTER TABLE `lbtablet_photo_albums`
  ADD CONSTRAINT `lbtablet_photo_albums_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_photo_album_photos`
--
ALTER TABLE `lbtablet_photo_album_photos`
  ADD CONSTRAINT `lbtablet_photo_album_photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `lbtablet_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_photo_album_photos_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `lbtablet_photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_bulletin`
--
ALTER TABLE `lbtablet_police_bulletin`
  ADD CONSTRAINT `lbtablet_police_bulletin_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases`
--
ALTER TABLE `lbtablet_police_cases`
  ADD CONSTRAINT `lbtablet_police_cases_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_charges`
--
ALTER TABLE `lbtablet_police_cases_charges`
  ADD CONSTRAINT `lbtablet_police_cases_charges_ibfk_1` FOREIGN KEY (`case_id`,`criminal`) REFERENCES `lbtablet_police_cases_criminals` (`case_id`, `id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_cases_charges_ibfk_2` FOREIGN KEY (`offence_id`) REFERENCES `lbtablet_police_offences` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_criminals`
--
ALTER TABLE `lbtablet_police_cases_criminals`
  ADD CONSTRAINT `lbtablet_police_cases_criminals_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_evidence`
--
ALTER TABLE `lbtablet_police_cases_evidence`
  ADD CONSTRAINT `lbtablet_police_cases_evidence_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_involved`
--
ALTER TABLE `lbtablet_police_cases_involved`
  ADD CONSTRAINT `lbtablet_police_cases_involved_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_tags`
--
ALTER TABLE `lbtablet_police_cases_tags`
  ADD CONSTRAINT `lbtablet_police_cases_tags_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_cases_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_jail`
--
ALTER TABLE `lbtablet_police_jail`
  ADD CONSTRAINT `lbtablet_police_jail_ibfk_1` FOREIGN KEY (`related_case`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_offences`
--
ALTER TABLE `lbtablet_police_offences`
  ADD CONSTRAINT `lbtablet_police_offences_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `lbtablet_police_offences_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_profile_tags`
--
ALTER TABLE `lbtablet_police_profile_tags`
  ADD CONSTRAINT `lbtablet_police_profile_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_reports`
--
ALTER TABLE `lbtablet_police_reports`
  ADD CONSTRAINT `lbtablet_police_reports_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_reports_attachments`
--
ALTER TABLE `lbtablet_police_reports_attachments`
  ADD CONSTRAINT `lbtablet_police_reports_attachments_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_reports_involved`
--
ALTER TABLE `lbtablet_police_reports_involved`
  ADD CONSTRAINT `lbtablet_police_reports_involved_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_reports_tags`
--
ALTER TABLE `lbtablet_police_reports_tags`
  ADD CONSTRAINT `lbtablet_police_reports_tags_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_reports_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_warrants`
--
ALTER TABLE `lbtablet_police_warrants`
  ADD CONSTRAINT `lbtablet_police_warrants_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_warrants_attachments`
--
ALTER TABLE `lbtablet_police_warrants_attachments`
  ADD CONSTRAINT `lbtablet_police_warrants_attachments_ibfk_1` FOREIGN KEY (`warrant_id`) REFERENCES `lbtablet_police_warrants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_warrants_linked_reports`
--
ALTER TABLE `lbtablet_police_warrants_linked_reports`
  ADD CONSTRAINT `lbtablet_police_warrants_linked_reports_ibfk_1` FOREIGN KEY (`warrant_id`) REFERENCES `lbtablet_police_warrants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_warrants_linked_reports_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_warrants_tags`
--
ALTER TABLE `lbtablet_police_warrants_tags`
  ADD CONSTRAINT `lbtablet_police_warrants_tags_ibfk_1` FOREIGN KEY (`warrant_id`) REFERENCES `lbtablet_police_warrants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_warrants_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_registration_licenses`
--
ALTER TABLE `lbtablet_registration_licenses`
  ADD CONSTRAINT `lbtablet_registration_licenses_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `lbtablet_registration_characters` (`character_id`);

--
-- Contraintes pour la table `lbtablet_registration_properties`
--
ALTER TABLE `lbtablet_registration_properties`
  ADD CONSTRAINT `lbtablet_registration_properties_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `lbtablet_registration_characters` (`character_id`);

--
-- Contraintes pour la table `lbtablet_registration_vehicles`
--
ALTER TABLE `lbtablet_registration_vehicles`
  ADD CONSTRAINT `lbtablet_registration_vehicles_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `lbtablet_registration_characters` (`character_id`);

--
-- Contraintes pour la table `lbtablet_voice_memo_recordings`
--
ALTER TABLE `lbtablet_voice_memo_recordings`
  ADD CONSTRAINT `lbtablet_voice_memo_recordings_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_backups`
--
ALTER TABLE `phone_backups`
  ADD CONSTRAINT `phone_backups_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_clock_alarms`
--
ALTER TABLE `phone_clock_alarms`
  ADD CONSTRAINT `phone_clock_alarms_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_darkchat_accounts`
--
ALTER TABLE `phone_darkchat_accounts`
  ADD CONSTRAINT `phone_darkchat_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_darkchat_members`
--
ALTER TABLE `phone_darkchat_members`
  ADD CONSTRAINT `phone_darkchat_members_ibfk_1` FOREIGN KEY (`channel_name`) REFERENCES `phone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_darkchat_members_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_darkchat_messages`
--
ALTER TABLE `phone_darkchat_messages`
  ADD CONSTRAINT `phone_darkchat_messages_ibfk_1` FOREIGN KEY (`channel`) REFERENCES `phone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_darkchat_messages_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `phone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_accounts`
--
ALTER TABLE `phone_instagram_accounts`
  ADD CONSTRAINT `phone_instagram_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_comments`
--
ALTER TABLE `phone_instagram_comments`
  ADD CONSTRAINT `phone_instagram_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `phone_instagram_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_instagram_comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_follows`
--
ALTER TABLE `phone_instagram_follows`
  ADD CONSTRAINT `phone_instagram_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_instagram_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_follow_requests`
--
ALTER TABLE `phone_instagram_follow_requests`
  ADD CONSTRAINT `phone_instagram_follow_requests_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_instagram_follow_requests_ibfk_2` FOREIGN KEY (`requestee`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_likes`
--
ALTER TABLE `phone_instagram_likes`
  ADD CONSTRAINT `phone_instagram_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_messages`
--
ALTER TABLE `phone_instagram_messages`
  ADD CONSTRAINT `phone_instagram_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_instagram_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_notifications`
--
ALTER TABLE `phone_instagram_notifications`
  ADD CONSTRAINT `phone_instagram_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_instagram_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_posts`
--
ALTER TABLE `phone_instagram_posts`
  ADD CONSTRAINT `phone_instagram_posts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_stories`
--
ALTER TABLE `phone_instagram_stories`
  ADD CONSTRAINT `phone_instagram_stories_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_stories_views`
--
ALTER TABLE `phone_instagram_stories_views`
  ADD CONSTRAINT `phone_instagram_stories_views_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `phone_instagram_stories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_instagram_stories_views_ibfk_2` FOREIGN KEY (`viewer`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_last_phone`
--
ALTER TABLE `phone_last_phone`
  ADD CONSTRAINT `phone_last_phone_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_logged_in_accounts`
--
ALTER TABLE `phone_logged_in_accounts`
  ADD CONSTRAINT `phone_logged_in_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_mail_deleted`
--
ALTER TABLE `phone_mail_deleted`
  ADD CONSTRAINT `phone_mail_deleted_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `phone_mail_messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_mail_deleted_ibfk_2` FOREIGN KEY (`address`) REFERENCES `phone_mail_accounts` (`address`) ON DELETE CASCADE;

--
-- Contraintes pour la table `phone_maps_locations`
--
ALTER TABLE `phone_maps_locations`
  ADD CONSTRAINT `phone_maps_locations_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_marketplace_posts`
--
ALTER TABLE `phone_marketplace_posts`
  ADD CONSTRAINT `phone_marketplace_posts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_message_members`
--
ALTER TABLE `phone_message_members`
  ADD CONSTRAINT `phone_message_members_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_message_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_message_messages`
--
ALTER TABLE `phone_message_messages`
  ADD CONSTRAINT `phone_message_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_message_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_music_playlists`
--
ALTER TABLE `phone_music_playlists`
  ADD CONSTRAINT `phone_music_playlists_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_music_saved_playlists`
--
ALTER TABLE `phone_music_saved_playlists`
  ADD CONSTRAINT `phone_music_saved_playlists_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_music_saved_playlists_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_music_songs`
--
ALTER TABLE `phone_music_songs`
  ADD CONSTRAINT `phone_music_songs_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `phone_notes`
--
ALTER TABLE `phone_notes`
  ADD CONSTRAINT `phone_notes_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_notifications`
--
ALTER TABLE `phone_notifications`
  ADD CONSTRAINT `phone_notifications_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_photos`
--
ALTER TABLE `phone_photos`
  ADD CONSTRAINT `phone_photos_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_photo_albums`
--
ALTER TABLE `phone_photo_albums`
  ADD CONSTRAINT `phone_photo_albums_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_photo_album_photos`
--
ALTER TABLE `phone_photo_album_photos`
  ADD CONSTRAINT `phone_photo_album_photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `phone_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_photo_album_photos_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `phone_photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_services_messages`
--
ALTER TABLE `phone_services_messages`
  ADD CONSTRAINT `phone_services_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_services_channels` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_accounts`
--
ALTER TABLE `phone_tiktok_accounts`
  ADD CONSTRAINT `phone_tiktok_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_channels`
--
ALTER TABLE `phone_tiktok_channels`
  ADD CONSTRAINT `phone_tiktok_channels_ibfk_1` FOREIGN KEY (`member_1`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_channels_ibfk_2` FOREIGN KEY (`member_2`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_comments`
--
ALTER TABLE `phone_tiktok_comments`
  ADD CONSTRAINT `phone_tiktok_comments_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_comments_ibfk_3` FOREIGN KEY (`reply_to`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_comments_likes`
--
ALTER TABLE `phone_tiktok_comments_likes`
  ADD CONSTRAINT `phone_tiktok_comments_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_comments_likes_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_follows`
--
ALTER TABLE `phone_tiktok_follows`
  ADD CONSTRAINT `phone_tiktok_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_likes`
--
ALTER TABLE `phone_tiktok_likes`
  ADD CONSTRAINT `phone_tiktok_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_likes_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_messages`
--
ALTER TABLE `phone_tiktok_messages`
  ADD CONSTRAINT `phone_tiktok_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_tiktok_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_messages_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_notifications`
--
ALTER TABLE `phone_tiktok_notifications`
  ADD CONSTRAINT `phone_tiktok_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_notifications_ibfk_3` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_notifications_ibfk_4` FOREIGN KEY (`comment_id`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_pinned_videos`
--
ALTER TABLE `phone_tiktok_pinned_videos`
  ADD CONSTRAINT `phone_tiktok_pinned_videos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_pinned_videos_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_saves`
--
ALTER TABLE `phone_tiktok_saves`
  ADD CONSTRAINT `phone_tiktok_saves_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_saves_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_unread_messages`
--
ALTER TABLE `phone_tiktok_unread_messages`
  ADD CONSTRAINT `phone_tiktok_unread_messages_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_unread_messages_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `phone_tiktok_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_videos`
--
ALTER TABLE `phone_tiktok_videos`
  ADD CONSTRAINT `phone_tiktok_videos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_views`
--
ALTER TABLE `phone_tiktok_views`
  ADD CONSTRAINT `phone_tiktok_views_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_views_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tinder_accounts`
--
ALTER TABLE `phone_tinder_accounts`
  ADD CONSTRAINT `phone_tinder_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tinder_matches`
--
ALTER TABLE `phone_tinder_matches`
  ADD CONSTRAINT `phone_tinder_matches_ibfk_1` FOREIGN KEY (`phone_number_1`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tinder_matches_ibfk_2` FOREIGN KEY (`phone_number_2`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tinder_messages`
--
ALTER TABLE `phone_tinder_messages`
  ADD CONSTRAINT `phone_tinder_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tinder_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tinder_swipes`
--
ALTER TABLE `phone_tinder_swipes`
  ADD CONSTRAINT `phone_tinder_swipes_ibfk_1` FOREIGN KEY (`swiper`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tinder_swipes_ibfk_2` FOREIGN KEY (`swipee`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_accounts`
--
ALTER TABLE `phone_twitter_accounts`
  ADD CONSTRAINT `phone_twitter_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_follows`
--
ALTER TABLE `phone_twitter_follows`
  ADD CONSTRAINT `phone_twitter_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_twitter_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_follow_requests`
--
ALTER TABLE `phone_twitter_follow_requests`
  ADD CONSTRAINT `phone_twitter_follow_requests_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_twitter_follow_requests_ibfk_2` FOREIGN KEY (`requestee`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_likes`
--
ALTER TABLE `phone_twitter_likes`
  ADD CONSTRAINT `phone_twitter_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_messages`
--
ALTER TABLE `phone_twitter_messages`
  ADD CONSTRAINT `phone_twitter_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_twitter_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_notifications`
--
ALTER TABLE `phone_twitter_notifications`
  ADD CONSTRAINT `phone_twitter_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_twitter_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_promoted`
--
ALTER TABLE `phone_twitter_promoted`
  ADD CONSTRAINT `phone_twitter_promoted_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `phone_twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `phone_twitter_retweets`
--
ALTER TABLE `phone_twitter_retweets`
  ADD CONSTRAINT `phone_twitter_retweets_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_tweets`
--
ALTER TABLE `phone_twitter_tweets`
  ADD CONSTRAINT `phone_twitter_tweets_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_voice_memos_recordings`
--
ALTER TABLE `phone_voice_memos_recordings`
  ADD CONSTRAINT `phone_voice_memos_recordings_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_wallet_transactions`
--
ALTER TABLE `phone_wallet_transactions`
  ADD CONSTRAINT `phone_wallet_transactions_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;