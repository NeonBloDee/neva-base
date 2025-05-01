ALTER TABLE `users` ADD COLUMN `ranks` LONGTEXT NOT NULL;

CREATE TABLE IF NOT EXISTS `gfxmdt_appointment` (
  `id` varchar(50) NOT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
DELETE FROM `gfxmdt_appointment`;

CREATE TABLE IF NOT EXISTS `gfxmdt_avatars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
DELETE FROM `gfxmdt_avatars`;

CREATE TABLE IF NOT EXISTS `gfxmdt_banlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `addedBy` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `ranks` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
DELETE FROM `gfxmdt_banlist`;

CREATE TABLE IF NOT EXISTS `gfxmdt_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
DELETE FROM `gfxmdt_department`;

CREATE TABLE IF NOT EXISTS `gfxmdt_fines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `jailTime` varchar(50) DEFAULT NULL,
  `jailType` varchar(50) DEFAULT NULL,
  `money` varchar(50) DEFAULT NULL,
  `lastEdited` varchar(50) DEFAULT NULL,
  `addedBy` varchar(50) DEFAULT NULL,
  `punishment` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
DELETE FROM `gfxmdt_fines`;

CREATE TABLE IF NOT EXISTS `gfxmdt_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `text` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
DELETE FROM `gfxmdt_notifications`;

CREATE TABLE IF NOT EXISTS `gfxmdt_offenders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `madeBy` varchar(50) DEFAULT NULL,
  `ranks` varchar(50) DEFAULT NULL,
  `reportText` varchar(50) DEFAULT NULL,
  `evidences` varchar(50) DEFAULT NULL,
  `fines` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
DELETE FROM `gfxmdt_offenders`;

CREATE TABLE IF NOT EXISTS `gfxmdt_polices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `madeBy` varchar(50) DEFAULT NULL,
  `ranks` varchar(50) DEFAULT NULL,
  `reportText` varchar(50) DEFAULT NULL,
  `evidences` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
DELETE FROM `gfxmdt_polices`;

CREATE TABLE IF NOT EXISTS `gfxmdt_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `text` varchar(50) DEFAULT NULL,
  `ranks` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `addedBy` varchar(50) DEFAULT NULL,
  `reportText` varchar(50) DEFAULT NULL,
  `offenders` varchar(50) DEFAULT NULL,
  `evidences` varchar(50) DEFAULT NULL,
  `polices` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
DELETE FROM `gfxmdt_records`;

CREATE TABLE IF NOT EXISTS `gfxmdt_wanteds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` longtext DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ranks` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `reportText` varchar(50) DEFAULT NULL,
  `addedBy` varchar(50) DEFAULT NULL,
  `evidences` longtext DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
DELETE FROM `gfxmdt_wanteds`;

CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DELETE FROM `gloveboxitems`;

INSERT INTO `gfxmdt_fines` (`id`, `name`, `jailTime`, `jailType`, `money`, `lastEdited`, `addedBy`, `punishment`) VALUES
(1, 'Usage abusif du klaxon', '15', 'Minutes', '3000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(2, 'Franchir une ligne continue', '20', 'Minutes', '4000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(3, 'Circulation à contresens', '30', 'Minutes', '25000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(4, 'Demi-tour non autorisé', '25', 'Minutes', '25000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(5, 'Circulation hors-route', '20', 'Minutes', '17000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(6, 'Non-respect des distances de sécurité', '15', 'Minutes', '3000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(7, 'Arrêt dangereux / interdit', '20', 'Minutes', '15000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(8, 'Stationnement gênant / interdit', '15', 'Minutes', '7000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(9, 'Non respect  de la priorité à droite', '15', 'Minutes', '7000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(10, 'Non-respect à un véhicule prioritaire', '20', 'Minutes', '9000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(11, 'Non-respect d\'un stop', '20', 'Minutes', '10500', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(12, 'Non-respect d\'un feu rouge', '25', 'Minutes', '13000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(13, 'Dépassement dangereux', '30', 'Minutes', '10000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(14, 'Véhicule non en état', '20', 'Minutes', '10000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(15, 'Conduite sans permis', '60', 'Minutes', '150000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(16, 'Délit de fuite', '60', 'Minutes', '80000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(17, 'Excès de vitesse < 5 kmh', '15', 'Minutes', '9000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(18, 'Excès de vitesse 5-15 kmh', '20', 'Minutes', '12000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(19, 'Excès de vitesse 15-30 kmh', '30', 'Minutes', '18000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(20, 'Excès de vitesse > 30 kmh', '45', 'Minutes', '30000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(21, 'Entrave de la circulation', '30', 'Minutes', '11000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(22, 'Dégradation de la voie publique', '25', 'Minutes', '9000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(23, 'Trouble à l\'ordre publique', '20', 'Minutes', '9000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(24, 'Entrave opération de police', '30', 'Minutes', '13000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(25, 'Insulte envers / entre civils', '15', 'Minutes', '7500', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(26, 'Outrage à agent de police', '20', 'Minutes', '1100', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(27, 'Menace verbale ou intimidation envers civil', '15', 'Minutes', '900', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(28, 'Menace verbale ou intimidation envers policier', '20', 'Minutes', '1500', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(29, 'Manifestation illégale', '25', 'Minutes', '2500', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(30, 'Tentative de corruption', '40', 'Minutes', '15000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(31, 'Arme blanche sortie en ville', '30', 'Minutes', '1200', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(32, 'Arme léthale sortie en ville', '45', 'Minutes', '3000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(33, 'Port d\'arme non autorisé (défaut de license)', '60', 'Minutes', '6000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(34, 'Port d\'arme illégal', '60', 'Minutes', '7000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(35, 'Pris en flag lockpick', '30', 'Minutes', '3000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(36, 'Vol de voiture', '60', 'Minutes', '18000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(37, 'Vente de drogue', '60', 'Minutes', '15000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(38, 'Fabriquation de drogue', '60', 'Minutes', '15000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(39, 'Possession de drogue', '30', 'Minutes', '6500', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(40, 'Prise d\'ôtage civil', '90', 'Minutes', '15000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(41, 'Prise d\'ôtage agent de l\'état', '120', 'Minutes', '20000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(42, 'Braquage particulier', '60', 'Minutes', '6500', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(43, 'Braquage magasin', '60', 'Minutes', '6500', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(44, 'Braquage de banque', '120', 'Minutes', '15000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(45, 'Tir sur civil', '60', 'Minutes', '20000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(46, 'Tir sur agent de l\'état', '90', 'Minutes', '25000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(47, 'Tentative de meurtre sur civil', '90', 'Minutes', '30000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(48, 'Tentative de meurtre sur agent de l\'état', '120', 'Minutes', '50000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(49, 'Meurtre sur civil', '120', 'Minutes', '100000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(50, 'Meurte sur agent de l\'état', '120', 'Minutes', '300000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(51, 'Meurtre involontaire', '60', 'Minutes', '18000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun'),
(52, 'Escroquerie à l\'entreprise', '60', 'Minutes', '20000', '{"time":1714587600,"editedBy":"Chief Of LSPD"}', 'Chief Of LSPD', 'Aucun');