-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 22 mars 2025 à 18:01
-- Version du serveur : 8.0.40-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3-4ubuntu2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `web`
--

-- --------------------------------------------------------

--
-- Structure de la table `Administrateur`
--

CREATE TABLE `Administrateur` (
  `id` int NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `logs` text NOT NULL,
  `added` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Administrateur`
--

INSERT INTO `Administrateur` (`id`, `user`, `password`, `logs`, `added`) VALUES
(5, 'abc', '$2b$12$51jxM.6B7NmOByC8b2p2V.thBnWNrIJYKWX0fNOWmerokqZv6ZSem', '', '2025-01-10 10:44:51'),
(8, 'test', '$2b$12$3B3y7UpZINXBWdEvyVH4ye50BjUF13nP1TKO0cZdrkpnFN6besOSS', '', '2025-01-10 10:49:34'),
(9, 'qsd', '$2b$12$dNluPk1Nlvv9S1hNikVgk.IRApXfvXhkAW0VZhMX5VHrbRAHBfc0u', '', '2025-01-10 10:55:03'),
(12, 'Le_TarakCharmeur', '$2b$12$iNGS8gmCIDzPHkJHeWM/u.m9/uZHnrscaVUGJMlsmlwxwUfcdoHv.', '', '2025-03-16 17:41:09');

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(3, 'DataPack'),
(4, 'Build'),
(5, '3d');

-- --------------------------------------------------------

--
-- Structure de la table `CategoryProject`
--

CREATE TABLE `CategoryProject` (
  `id` int NOT NULL,
  `id_Category` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `CategoryProject`
--

INSERT INTO `CategoryProject` (`id`, `id_Category`) VALUES
(8, 3),
(15, 3),
(16, 3),
(17, 3),
(8, 4);

-- --------------------------------------------------------

--
-- Structure de la table `Commentaire`
--

CREATE TABLE `Commentaire` (
  `id` int NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` text NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  `id_Project` int NOT NULL,
  `id_Commentaire` int DEFAULT NULL,
  `website` varchar(50) NOT NULL,
  `validate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Commentaire`
--

INSERT INTO `Commentaire` (`id`, `name`, `email`, `text`, `date`, `id_Project`, `id_Commentaire`, `website`, `validate`) VALUES
(1, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', 'sfdq  fsdf ', '2025-03-18', 8, NULL, '', 0),
(2, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', ' hg d d gf d d ', '2025-03-18', 8, NULL, '', 0),
(3, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', ' hg d d gf d d ', '2025-03-18', 8, 4, '', 0),
(4, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', 'qgf q fsqg fsq ggf ', '2025-03-18', 8, 1, '', 0),
(5, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', 'retb zre t z zert re', '2025-03-18', 8, 3, '', 0),
(6, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', 'sdfg sf dg sdf gdsfg ', '2025-03-18', 8, 4, '', 0),
(7, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', 'fdfs fg dg f', '2025-03-18', 8, 3, '', 0),
(8, 'hugo', 'hugo@gmail.com', 'oui', '2025-03-19', 8, 1, '', 0),
(9, 'tes', 'mathis.bruel17700@gmail.com', 'tesqsf rf se f  ', '2025-03-20', 8, NULL, 'test', 0),
(10, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', 'ts', '2025-03-20', 8, 9, 'test', 0),
(11, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', 'tes', '2025-03-20', 8, 2, 'tees', 0),
(12, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', 'test', '2025-03-20', 8, 1, 'test', 0),
(13, 'MATHIS M.B Bruel', 'mathis.bruel@petbeautystore.com', 'bidule', '2025-03-20', 8, NULL, 'https://www.mineevent.fr', 0),
(14, 'TEST', 'testazeaze@z.z', 'CHEH', '2025-03-21', 16, NULL, 'ma mere', 0);

-- --------------------------------------------------------

--
-- Structure de la table `Image`
--

CREATE TABLE `Image` (
  `id` int NOT NULL,
  `path` text NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Image`
--

INSERT INTO `Image` (`id`, `path`, `name`) VALUES
(25, 'content/files/images\\2025-03-10_22-19-02_logo.webp', 'logo'),
(26, 'content/files/images\\2025-03-10_22-19-04_membre_bigbublle.webp', 'membre_bigbublle'),
(28, 'content/files/images\\2025-03-10_22-19-09_membre_nizhuan.webp', 'membre_nizhuan'),
(29, 'content/files/images\\2025-03-10_22-19-13_membre_adri.webp', 'membre_adri'),
(30, 'content/files/images\\2025-03-10_22-19-17_membre_alexandra.webp', 'membre_alexandra'),
(31, 'content/files/images\\2025-03-10_22-19-22_membre_carnagiul.webp', 'membre_carnagiul'),
(32, 'content/files/images\\2025-03-10_22-19-27_membre_dorian_04.webp', 'membre_dorian_04'),
(33, 'content/files/images\\2025-03-10_22-19-31_membre_drsallan.webp', 'membre_drsallan'),
(34, 'content/files/images\\2025-03-10_22-19-38_membre_easyfrost.webp', 'membre_easyfrost'),
(35, 'content/files/images\\2025-03-10_22-19-44_membre_gioco.webp', 'membre_gioco'),
(36, 'content/files/images\\2025-03-10_22-19-48_membre_lordldoitor.webp', 'membre_lordldoitor'),
(37, 'content/files/images\\2025-03-10_22-19-53_membre_marvin_99.webp', 'membre_marvin_99'),
(38, 'content/files/images\\2025-03-10_22-19-58_favicon.webp', 'favicon'),
(39, 'content/files/images\\2025-03-10_22-19-59_banner.webp', 'banner'),
(40, 'content/files/images\\rendermembers.webp', 'rendermembers'),
(41, 'content/files/images\\2025-03-10_19-42-03_joyca.webp', 'joyca'),
(42, 'content/files/images\\2025-03-10_22-19-59_betc.webp', 'betc'),
(43, 'content/files/images\\2025-03-10_22-20-01_edf.webp', 'edf'),
(44, 'content/files/images\\2025-03-10_22-20-01_la-chose.webp', 'la-chose'),
(45, 'content/files/images\\2025-03-10_22-20-02_havas.webp', 'havas'),
(46, 'content/files/images\\2025-03-10_22-20-02_grand poitiers.webp', 'grand poitiers'),
(47, 'content/files/images\\2025-03-10_22-20-02_adem.webp', 'adem'),
(48, 'content/files/images\\2025-03-10_22-20-03_gotaga.webp', 'gotaga'),
(49, 'content/files/images\\2025-03-10_22-20-03_steve.webp', 'steve'),
(50, 'content/files/images\\2025-03-10_22-20-04_apericube.webp', 'apericube'),
(51, 'content/files/images\\2025-03-10_22-20-09_article_test_logo.webp', 'article_test_logo'),
(52, 'content/files/images\\2025-03-10_22-20-13_separator.webp', 'separator'),
(53, 'content/files/images\\2025-03-10_22-20-14_article_test_image.webp', 'article_test_image'),
(54, 'content/files/images\\2025-03-10_22-20-15_background-accueil.webp', 'background-accueil'),
(62, 'content/files/images\\2025-03-10_22-20-15_render_contact_us.webp', 'render_contact_us'),
(66, 'content/files/images\\2025-03-10_22-20-17_mascotte.webp', 'mascotte'),
(67, 'content/files/images\\2025-02-03_14-47-13_social_discord.svg', 'social_discord'),
(68, 'content/files/images\\2025-02-03_14-47-37_social_discord_hover.svg', 'social_discord_hover'),
(69, 'content/files/images\\2025-02-03_14-48-12_social_insta.svg', 'social_insta'),
(70, 'content/files/images\\2025-02-03_14-48-25_social_insta_hover.svg', 'social_insta_hover'),
(71, 'content/files/images\\2025-02-03_14-48-50_social_tiktok.svg', 'social_tiktok'),
(72, 'content/files/images\\2025-02-03_14-49-08_social_tiktok_hover.svg', 'social_tiktok_hover'),
(73, 'content/files/images\\2025-02-03_14-49-18_social_x.svg', 'social_x'),
(74, 'content/files/images\\2025-02-03_14-49-35_social_x_hover.svg', 'social_x_hover'),
(75, 'content/files/images\\2025-02-03_14-49-51_social_bluesky.svg', 'social_bluesky'),
(76, 'content/files/images\\2025-02-03_14-50-05_social_bluesky_hover.svg', 'social_bluesky_hover'),
(77, 'content/files/images\\2025-02-03_14-50-27_social_linkedin.svg', 'social_linkedin'),
(78, 'content/files/images\\2025-02-03_14-50-42_social_linkedin_hover.svg', 'social_linkedin_hover'),
(79, 'content/files/images\\2025-02-03_14-51-06_social_youtube.svg', 'social_youtube'),
(80, 'content/files/images\\2025-02-03_14-51-38_social_youtube_hover.svg', 'social_youtube_hover'),
(84, 'content/files/images\\2025-03-10_22-20-17_social_pmc_hover.webp', 'social_pmc_hover'),
(85, 'content/files/images\\2025-02-04_15-15-54_social_pmc_hover.png', 'social_pmc'),
(86, 'content/files/images\\2025-02-05_15-04-32_minesalt_logo.png', 'minesalt_logo'),
(88, 'content/files/images\\2025-03-10_22-20-18_brand_background.webp', 'brand_background'),
(89, 'content/files/images\\2025-02-27_19-08-30_social_pmc_svg.svg', 'social_pmc_svg'),
(90, 'content/files/images\\2025-03-10_22-20-19_testport-a.webp', 'testport-a'),
(91, 'content/files/images\\2025-03-10_22-20-20_testport-b.webp', 'testport-b'),
(92, 'content/files/images\\2025-03-10_22-20-21_testport-c.webp', 'testport-c'),
(93, 'content/files/images\\2025-03-10_22-20-22_testport-d.webp', 'testport-d'),
(94, 'content/files/images\\2025-03-10_22-20-23_testport-e.webp', 'testport-e'),
(95, 'content/files/images\\2025-03-10_22-20-24_testport-f.webp', 'testport-f'),
(96, 'content/files/images\\2025-03-10_22-20-26_testport-g.webp', 'testport-g'),
(97, 'content/files/images\\2025-03-10_22-20-27_testport-h.webp', 'testport-h'),
(98, 'content/files/images\\2025-03-10_22-20-28_testport-i.webp', 'testport-i'),
(99, 'content/files/images\\2025-03-10_22-20-29_testport-j.webp', 'testport-j'),
(100, 'content/files/images\\2025-03-10_22-20-31_testport-k.webp', 'testport-k'),
(101, 'content/files/images\\2025-03-10_22-20-32_testport-l.webp', 'testport-l'),
(102, 'content/files/images\\2025-03-10_22-20-33_testport-m.webp', 'testport-m'),
(103, 'content/files/images\\2025-03-10_22-20-35_testport-o.webp', 'testport-o'),
(104, 'content/files/images\\2025-03-10_22-20-36_testport-p.webp', 'testport-p'),
(105, 'content/files/images\\2025-03-10_22-20-36_testport-q.webp', 'testport-q'),
(106, 'content/files/images\\2025-03-10_22-20-37_testport-r.webp', 'testport-r'),
(107, 'content/files/images\\2025-03-10_22-20-38_testport-s.webp', 'testport-s'),
(108, 'content/files/images\\2025-03-10_22-20-43_membre_mathis.webp', 'membre_mathis'),
(109, 'content/files/images\\2025-03-10_22-20-47_membre_nemerios.webp', 'membre_nemerios'),
(110, 'content/files/images\\2025-03-10_22-20-52_membre_neylz.webp', 'membre_neylz'),
(111, 'content/files/images\\2025-03-10_22-20-57_membre_popi_craft.webp', 'membre_popi_craft'),
(112, 'content/files/images\\2025-03-10_22-21-01_membre_solheaven.webp', 'membre_solheaven'),
(113, 'content/files/images\\2025-03-10_22-21-04_membre_spino.webp', 'membre_spino'),
(114, 'content/files/images\\2025-03-10_22-21-07_membre_typhon.webp', 'membre_typhon'),
(115, 'content/files/images\\2025-03-10_22-21-13_membre_vitalie.webp', 'membre_vitalie'),
(116, 'content/files/images\\2025-03-10_22-21-18_membre_whaldan.webp', 'membre_whaldan'),
(117, 'content/files/images\\2025-03-10_22-21-22_membre_xraider.webp', 'membre_xraider'),
(118, 'content/files/images\\2025-03-05_13-55-33_icon_responsables.svg', 'icon_responsables'),
(119, 'content/files/images\\2025-03-10_22-21-24_46263f259b19940924fdb1b3bdb931275979c413.png.webp', '46263f259b19940924fdb1b3bdb931275979c413.png'),
(120, 'content/files/images\\2025-03-10_22-21-24_Capture d\'écran 2024-11-07 140512.png.webp', 'Capture d\'écran 2024-11-07 140512.png'),
(121, 'content/files/images\\2025-03-10_22-21-24_testupload.png.webp', 'testupload.png'),
(122, 'content/files/images\\2025-03-10_22-21-24_Design sans titre.png.webp', 'Design sans titre.png'),
(127, 'content/files/images\\2025-03-18_17-13-43_partenaire_minecraft.webp', 'partenaire_minecraft'),
(128, 'content/files/images\\2025-03-18_17-58-58_partenaire_omgserv.webp', 'partenaire_omgserv'),
(129, 'content/files/images\\2025-03-18_17-59-10_partenaire_mcfr.webp', 'partenaire_mcfr'),
(130, 'content/files/images\\2025-03-18_17-59-24_partenaire_ga.webp', 'partenaire_ga');

-- --------------------------------------------------------

--
-- Structure de la table `ImagesPortfolio`
--

CREATE TABLE `ImagesPortfolio` (
  `id_Projet` int NOT NULL,
  `id_Image` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ImagesPortfolio`
--

INSERT INTO `ImagesPortfolio` (`id_Projet`, `id_Image`) VALUES
(17, 25),
(8, 90),
(8, 91),
(8, 92),
(8, 93),
(8, 94),
(16, 94),
(8, 95),
(15, 96),
(15, 97),
(15, 98),
(15, 99),
(15, 100),
(15, 101),
(16, 102),
(16, 103),
(16, 104),
(16, 105),
(8, 106),
(16, 107);

-- --------------------------------------------------------

--
-- Structure de la table `Membre`
--

CREATE TABLE `Membre` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `anecdote` text NOT NULL,
  `date_ajout` date NOT NULL,
  `id_Image` int NOT NULL,
  `link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Membre`
--

INSERT INTO `Membre` (`id`, `name`, `description`, `anecdote`, `date_ajout`, `id_Image`, `link`) VALUES
(5, 'Rémy Dronneau', 'Fondateur d\\\'Endorah. Bigbublle est le pilier qui a fait grandir notre équipe. Il dirige nos projets depuis 2015.', 'Assieds-toi là dessus !', '2015-01-01', 26, ''),
(6, 'Aodren Fuss', 'Une joie de vivre constante. une imagination débordante et très active, Ses qualités lui ont permis de se hisser au poste de Responsable d\\\'équipe.', 'Salutations distinguées camarades', '2021-01-01', 28, ''),
(7, 'adrichefclan', 'En tant que coordinateur, Adri gère les projets en compagnie de SolHeaven. Il applique son savoir-faire et le met au profit de réquipe dans tous les projets.', 'Typiquement', '2020-01-01', 29, ''),
(8, 'Solheaven', 'Architecte dans l\\\'âme et de profession, SolHeaven est l\\\'un des coordinateurs construction de l\\\'équipe. Il sous•gère et guide les builders afin de mener à bien chaque projet', 'Dès son attivée en vocal, Son • Rtrrtr.e peut se faire entendre pendant de nombreuses secondes.', '2025-03-05', 112, ''),
(9, 'Mathis Bruel', 'Place à la jeunesse ! Un développeur d\\\'une qualité et efficacité sans précédent, toujours chaud pour faire des projets.', 'Normalement ça devrait fonctionner. je dis bien normalement ', '2025-03-05', 108, ''),
(10, 'Popi_craft', 'Discrète et réservée, en sa présence. un calme olympien règne. Minutieuse. elle se soucie du moindre détail et Cherche la perfection lorsqu\\\'elle fait son travail.', 'Elle peut donner une àme aux rendus qu\\\'elle réalise,', '2025-03-05', 111, ''),
(11, 'easyfrost', 'Un gestionnaire de qualité. une efficacité à toute épreuve, le pôle gestion était parfait pour lui.', 'Où sont passés mes RTT ?', '2025-03-05', 34, ''),
(12, 'Némérios', 'Toujours accompagné de son plus fidèle compagnon, Némérios gère l\\\'ensemble des stocks de l\\\'association. Si vous souhaitez changer la couleur de vos Cheveux. n\\\'hésitez pas à faire appel à ses talents de teinturier !', 'Vous avez déjà vu mon bébé chien ?', '2025-03-05', 109, ''),
(13, 'Vitalie', 'Vitalie est un builder d\\\'un sérieux des plus accrus, Toujours partant pour une petite partie', 'Tu veux te batue ?', '2025-03-05', 115, ''),
(14, 'Spinophore', 'Un maximum d\\\'originalité. le tout dans la technicité Un builder aussi appelé le couteau suisse fonctionnel et opérationnel', 'Bonjourrrr tout le monde', '2025-03-05', 113, ''),
(15, 'Marvin_99_', 'C\\\'est avec motivation sans faille et un style de build réaliste que Marvin propose ses idées et fait avancer grandement les projets de l\\\'équipe en leur donnant une plus-value exceptionnelle.', 'Marvin aime deux choses dans la vie, le build et sa souris.', '2025-03-05', 37, ''),
(16, 'Lordldoitor', 'Créatif et doté d\\\'un talent exceptionnel, Loro est capable de faire apparaitre une Ville en une nuit.', 'Vous n\\\'avez aucune preuve que je ne suis pas un poisson ', '2025-03-05', 36, ''),
(17, 'Dorian_04', 'Investit et efficace, sa créativité n\\\'a d\\\' égale qu\\\'optimisme et bonne humeur.', 'Mais vous savez. on peut trouver le bonheur même dans les mornents les plus sombres... Il Sumt de Se souvenir d\\\'allumer la lumière ', '2025-03-05', 32, ''),
(18, 'Arkkaas', 'Designer de profession, Arkkaas nous réalise de magnifiques rendus de nos différentes cartes ainsi que de multiples visuels que nous pouvons retrouver sur nos réseaux sociaux.', 'Tu as bu ma parole !', '2025-03-05', 26, ''),
(19, 'Gioco', 'Avec ses talents de dessinatrice ou encore de render maker, Gioco nous propose des visuels époustouflants qui mettent en valeur tous nos projets.', 'Ohana signifie famille', '2025-03-05', 35, ''),
(20, 'XRaider70', 'Son talent et son savoir-faire en termes de rendu de maps nous aident à mettre en avant ainsi qu\\\'à promouvoir notre travail.', 'Youtubeur réformé prochainement graphiste chez Pixar.', '2025-03-05', 117, ''),
(21, 'Carnagiul', 'Développeur de qualité, méme son cerveau est programmé pour charbonner dans la meilleure des qualités.', 'Vous vous êtes fait goumer !', '2025-03-05', 31, ''),
(22, 'DrSallan', 'II est le command blocker le plus ancien de l\\\'équipe. Son sérieux et son calme lui permettent de faire avancer les maps en un rien de temps', 'Vous vous êtes fait goumer !', '2025-03-05', 33, '');

-- --------------------------------------------------------

--
-- Structure de la table `MembreRole`
--

CREATE TABLE `MembreRole` (
  `id` int NOT NULL,
  `id_Role` int NOT NULL,
  `order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `MembreRole`
--

INSERT INTO `MembreRole` (`id`, `id_Role`, `order`) VALUES
(5, 1, 0),
(6, 2, 0),
(7, 3, 0),
(7, 10, 1),
(7, 12, 2),
(8, 3, 0),
(9, 6, 0),
(10, 7, 0),
(11, 8, 0),
(12, 9, 0),
(13, 10, 0),
(14, 10, 0),
(15, 10, 0),
(16, 10, 0),
(17, 10, 0),
(18, 13, 0),
(19, 13, 0),
(20, 13, 0),
(21, 17, 0),
(22, 15, 0);

-- --------------------------------------------------------

--
-- Structure de la table `Navbar`
--

CREATE TABLE `Navbar` (
  `id` int NOT NULL,
  `label` varchar(50) NOT NULL,
  `position` int NOT NULL,
  `id_Navbar` int DEFAULT NULL,
  `redirection` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Navbar`
--

INSERT INTO `Navbar` (`id`, `label`, `position`, `id_Navbar`, `redirection`) VALUES
(12, 'Portfolio', 0, NULL, '/portfolio'),
(13, 'Projets', 1, NULL, '/projets'),
(14, 'MarketPlace', 10, NULL, '/marketplace'),
(15, 'Equipe', 100, NULL, ''),
(16, 'Nous contacter', 106, NULL, ''),
(17, 'Nous rejoindre', 107, NULL, ''),
(18, 'Fallen Kingdoms', 1002, 13, ''),
(19, 'Sky Defender', 1003, 13, ''),
(20, 'Carte Aventure', 1004, 13, ''),
(21, 'Carte PVP', 1005, 13, ''),
(22, 'Carte Visite', 1006, 13, ''),
(23, 'Datapack', 1007, 13, ''),
(25, 'Skin pack', 1011, 14, ''),
(26, 'Add-on', 1012, 14, ''),
(27, 'Map', 1013, 14, ''),
(28, 'Membre', 1005, 15, '/membres'),
(29, 'Partenaire', 1001, 15, '/partenaires'),
(30, 'A propos', 1002, 15, ''),
(31, 'On parle de nous', 1003, 15, ''),
(32, 'Kit Press', 1004, 15, ''),
(33, '---', 1008, 13, ''),
(34, 'campagne', 1009, 13, '');

-- --------------------------------------------------------

--
-- Structure de la table `Page`
--

CREATE TABLE `Page` (
  `id` int NOT NULL,
  `route` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `image_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Page`
--

INSERT INTO `Page` (`id`, `route`, `name`, `body`, `image_id`) VALUES
(10, '/mentions-legales', 'Nos mentions légales', '<p id=\"docs-internal-guid-9c8997e6-7fff-2248-b076-c411a4bbd77f\" dir=\"ltr\" style=\"line-height: 1.2; text-align: center; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 52pt; font-family: \'Bebas Neue\',sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">MENTIONS L&Eacute;GALES</span></p>\r\n<h1 dir=\"ltr\" style=\"line-height: 1.2; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 12pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Pr&eacute;sentation du site</span></h1>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">En accord avec la loi n&deg; 2004-575 du 21 juin 2004 sur la confiance dans l\'&eacute;conomie num&eacute;rique, les informations relatives aux acteurs impliqu&eacute;s dans la cr&eacute;ation et la gestion du site https://endorah.net/ (ci-apr&egrave;s d&eacute;nomm&eacute; le \"Site\") sont pr&eacute;cis&eacute;es aux utilisateurs et visiteurs, d&eacute;sign&eacute;s ci-apr&egrave;s comme l\'\"Utilisateur\" :</span></p>\r\n<p>&nbsp;</p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: center; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Propri&eacute;taire : </span><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Endorah &ndash; 36 Sainte Acquiti&egrave;re, 16250 CHADURIE, FRANCE</span></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: center; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">RNA :</span><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"> W253005210</span></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: center; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Siret :</span><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"> 924 455 538 00018</span></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: center; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Siren :</span><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"> 924 455 538</span></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: center; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Pr&eacute;sident : </span><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">R&eacute;my DRONNEAU &ndash; contact@endorah.net</span></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: center; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Responsable publication :</span><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"> Aodren FUSS &ndash; contact@endorah.net</span></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: center; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">H&eacute;bergeur :</span><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"> Pulsheberg &ndash; 9 Boulevard de Strasbourg, 83000, TOULON</span></p>\r\n<p>&nbsp;</p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">La connexion et la navigation sur le Site par l&rsquo;Utilisateur implique l\'acceptation int&eacute;grale et sans r&eacute;serve des pr&eacute;sentes mentions l&eacute;gales et de la politique de confidentialit&eacute; disponible au lien suivant : </span><a style=\"text-decoration: none;\" href=\"https://endorah.net/politique-de-confidentialite/\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #1155cc; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: underline; -webkit-text-decoration-skip: none; text-decoration-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;\">https://endorah.net/politique-de-confidentialite/</span></a><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">.</span></p>\r\n<p>&nbsp;</p>\r\n<h1 dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 12pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">&Eacute;dition du site</span></h1>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">L&rsquo;&eacute;dition et la direction de la publication du Site est assur&eacute;e par l\'association Endorah, dont l\'adresse e-mail de contact est : contact@endorah.net.</span></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">ci-apr&egrave;s l\'\"Editeur\".</span></p>\r\n<p>&nbsp;</p>\r\n<h1 dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 12pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Acc&egrave;s au site</span></h1>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Le Site est normalement accessible, &agrave; tout moment, &agrave; l\'Utilisateur. Toutefois, l\'&Eacute;diteur pourra, &agrave; tout moment, suspendre, limiter ou interrompre le Site afin de proc&eacute;der, notamment, &agrave; des mises &agrave; jour ou des modifications de son contenu. L\'Editeur ne pourra en aucun cas &ecirc;tre tenu responsable des cons&eacute;quences &eacute;ventuelles de cette indisponibilit&eacute; sur les activit&eacute;s de l\'Utilisateur.</span></p>\r\n<p>&nbsp;</p>\r\n<h1 dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 12pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Collecte des donn&eacute;es</span></h1>\r\n<p>&nbsp;</p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Le Site assure &agrave; l\'Utilisateur une collecte et un traitement des donn&eacute;es personnelles dans le respect de la vie priv&eacute;e conform&eacute;ment &agrave; la loi n&deg;78-17 du 6 janvier 1978 relative &agrave; l\'informatique, aux fichiers aux libert&eacute;s et dans le respect de la r&eacute;glementation applicable en mati&egrave;re de traitement des donn&eacute;es &agrave; caract&egrave;re personnel conform&eacute;ment au r&egrave;glement (UE) 2016/679 du Parlement europ&eacute;en et du Conseil du 27 avril 2016 (</span><a style=\"text-decoration: none;\" href=\"https://endorah.net/rgpd/\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #1155cc; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: underline; -webkit-text-decoration-skip: none; text-decoration-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;\">https://endorah.net/rgpd/</span></a><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"> &amp; </span><a style=\"text-decoration: none;\" href=\"https://endorah.net/politique-de-confidentialite/\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #1155cc; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: underline; -webkit-text-decoration-skip: none; text-decoration-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;\">https://endorah.net/politique-de-confidentialite/</span></a><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">, ensemble, la \"R&egrave;glementation applicable en mati&egrave;re de protection des Donn&eacute;es &agrave; caract&egrave;re personnel\" ainsi que de la politique de confidentialit&eacute;).</span></p>\r\n<p>&nbsp;</p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">En vertu de la R&eacute;glementation applicable en mati&egrave;re de protection des Donn&eacute;es &agrave; caract&egrave;re personnel, l\'Utilisateur dispose d\'un droit d\'acc&egrave;s, de rectification, de suppression et d\'opposition de ses donn&eacute;es personnelles. L\'Utilisateur peut exercer ce droit :</span></p>\r\n<ul style=\"margin-top: 0; margin-bottom: 0; padding-inline-start: 48px;\">\r\n<li dir=\"ltr\" style=\"list-style-type: circle; font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre;\" aria-level=\"1\">\r\n<p dir=\"ltr\" style=\"line-height: 1.2; margin-top: 0pt; margin-bottom: 0pt;\" role=\"presentation\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">par mail &agrave; l\'adresse email contact@endorah.net</span></p>\r\n</li>\r\n</ul>\r\n<p><br><br></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.2; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 11pt; font-family: Roboto,sans-serif; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Toute utilisation, reproduction, diffusion, commercialisation, modification de toute ou partie du Site, sans autorisation expresse de l\'&Eacute;diteur est prohib&eacute;e et pourra entra&icirc;ner des actions et poursuites judiciaires telles que pr&eacute;vues par la r&eacute;glementation en vigueur.</span></p>', 91),
(11, '/rgpd', 'RGPD', '<p>rgpd</p>', 88),
(12, '/cgu', 'CGU', '<p>CGU</p>', 54),
(13, '/kit-press', 'Kit press', '<p>Kit press</p>', 92),
(14, '/a-propos', 'A propos', '<p>a propos</p>', 95);

-- --------------------------------------------------------

--
-- Structure de la table `Partenaire`
--

CREATE TABLE `Partenaire` (
  `id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `confiance` tinyint(1) NOT NULL,
  `id_Image` int NOT NULL,
  `date_ajout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Partenaire`
--

INSERT INTO `Partenaire` (`id`, `nom`, `description`, `confiance`, `id_Image`, `date_ajout`, `link`) VALUES
(3, 'Joyca', 'joyca', 1, 41, '2025-01-13 12:02:52', ''),
(4, 'Apericube', 'apecicube', 1, 50, '2025-01-13 12:03:07', ''),
(5, 'La-Chose', 'la-chose', 1, 44, '2025-01-13 12:03:22', ''),
(6, 'Gotaga', 'gotaga', 1, 48, '2025-01-13 12:03:37', ''),
(7, 'Havas', 'havas', 1, 45, '2025-01-13 12:03:51', ''),
(8, 'BETC', 'betc', 1, 42, '2025-01-13 12:04:03', ''),
(9, 'Ademe', 'ademe', 1, 47, '2025-01-13 12:04:23', ''),
(10, 'EDF', 'edf', 1, 43, '2025-01-13 12:04:35', ''),
(11, 'Grand Poitiers', 'grand poitiers', 1, 46, '2025-01-13 12:04:50', ''),
(12, 'Steve', 'steve', 1, 49, '2025-01-13 12:05:15', ''),
(14, 'mathis', 'le backend', 1, 25, '2025-01-19 18:38:19', ''),
(17, 'Minecraft', 'En étant partenaire officiel de Minecraft, notre travail se voit accorder un gage de qualité inestimable. De plus, grâce à lui, vous pourrez retrouver quelques-unes de nos futures créations sur Bedrock Edition depuis le marketplace ! Nous vous y attendons avec impatience !', 0, 127, '2025-03-18 17:01:27', 'https://www.minecraft.net/fr-fr/marketplace'),
(18, 'Omgserv', 'Un hébergeur de qualité qui n’a pas peur de la grandeur de nos maps ! OMGSERV nous fournissent et assurent la maintenance de nos serveurs depuis nos débuts. Sans eux nous n’en serions pas là aujourd’hui !', 0, 128, '2025-03-18 17:02:15', 'https://www.omgserv.com/fr/'),
(19, 'MC France', 'Partenaire 2021, Minecraft France nous soutient dans la création et la promotion de tous nos projets. Une plume toujours avisée lorsqu’il s’agit de la présentation de nos cartes !', 0, 129, '2025-03-18 17:02:33', 'https://www.minecraft-france.fr/'),
(20, 'GA', 'Depuis 2020 la Gamers Assembly nous fait confiance pour créer et relever les défis toujours plus fous qu’elle nous propose. Nous sommes en charge de la construction de la zone minecraft pour accueillir au mieux les futurs joueurs libres !', 0, 130, '2025-03-18 17:02:52', 'https://www.gamers-assembly.net/');

-- --------------------------------------------------------

--
-- Structure de la table `Portfolio`
--

CREATE TABLE `Portfolio` (
  `id` int NOT NULL,
  `id_Image` int NOT NULL,
  `value` int NOT NULL,
  `order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Portfolio`
--

INSERT INTO `Portfolio` (`id`, `id_Image`, `value`, `order`) VALUES
(7, 98, 1, 4),
(8, 99, 1, 2),
(9, 107, 1, 3),
(10, 94, 1, 1),
(11, 102, 2, 5),
(12, 97, 2, 6),
(13, 105, 4, 7),
(14, 92, 3, 8),
(15, 100, 1, 9),
(16, 95, 2, 10),
(17, 99, 1, 11),
(18, 101, 1, 12),
(19, 102, 4, 13),
(20, 103, 1, 15),
(21, 104, 3, 14),
(22, 106, 2, 16),
(23, 107, 2, 17),
(24, 95, 4, 18);

-- --------------------------------------------------------

--
-- Structure de la table `Project`
--

CREATE TABLE `Project` (
  `id` int NOT NULL,
  `titre` text NOT NULL,
  `body` text NOT NULL,
  `date` date NOT NULL,
  `id_Type` int NOT NULL,
  `id_Image` int NOT NULL,
  `id_logo` int NOT NULL,
  `route` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Project`
--

INSERT INTO `Project` (`id`, `titre`, `body`, `date`, `id_Type`, `id_Image`, `id_logo`, `route`) VALUES
(8, 'MineStalt', '<div class=\"wp-block-image aligncenter\">\r\n<figure class=\"size-large\"><img class=\"wp-image-2884\" title=\"Fallen Kingdoms GFight Invitational [1.8 et +] 1\" src=\"https://endorah.net/wp-content/uploads/2021/04/Logo-FK_Gfight_Invitational-1024x512.png\" alt=\"Logo FK Gfight Invitational\" width=\"1024\" height=\"512\"></figure>\r\n</div>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\"><span style=\"font-family: roboto;\">Pour cette carte de l&rsquo;&eacute;v&eacute;nement <strong><em>Fallen Kingdoms GFight Invitational</em></strong> de <strong>Gotaga</strong>, nous avons r&eacute;alis&eacute; un monde dans le style Maya. Aux quatre points cardinaux, des statues protectrices veillent sur l&rsquo;&icirc;le, o&ugrave; en son centre un temple mystique sommeille au sein d&rsquo;un calendrier maya bord&eacute; de jardins somptueux.</span></p>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\"><span style=\"font-family: \'bebas neue\';\">Plusieurs petits villages sont diss&eacute;min&eacute;s sur la carte, vous pourrez y retrouver diff&eacute;rentes ressources telles que du bl&eacute;, des past&egrave;ques ou encore des citrouilles qui y sont cultiv&eacute;es et vous permettront de vous nourrir. En explorant la jungle, vous tomberez sur d&rsquo;anciennes ruines : &agrave; vous de d&eacute;couvrir leurs secrets !</span></p>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\"><span style=\"font-family: \'bebas neue\';\">Les 5 bases sont toutes &agrave; &eacute;quidistance du temple central; ce dernier abrite les portails d&rsquo;acc&egrave;s au Nether ainsi qu&rsquo;&agrave; l&rsquo;End.</span></p>\r\n<p style=\"text-align: left;\"><span style=\"font-family: \'bebas neue\';\">Les participants de l&rsquo;&eacute;v&eacute;nement sont :</span></p>\r\n<ul class=\"wp-block-list\">\r\n<li style=\"font-family: \'bebas neue\'; text-align: left;\"><span style=\"font-family: \'bebas neue\';\"><strong>Equipe 1 :</strong> <em>Gotaga, Mickalow, Guill, Luccio</em></span></li>\r\n<li style=\"font-family: \'bebas neue\'; text-align: left;\"><span style=\"font-family: \'bebas neue\';\"><strong>Equipe 2 :</strong> <em>Kamel, Kotei, Bibi, Etoiles</em></span></li>\r\n<li style=\"font-family: \'bebas neue\'; text-align: left;\"><span style=\"font-family: \'bebas neue\';\"><strong>Equipe 3 :</strong> <em>Inoxtag, Mathox, Terracid, Potatoz</em></span></li>\r\n<li style=\"font-family: \'bebas neue\'; text-align: left;\"><span style=\"font-family: \'bebas neue\';\"><strong>Equipe 4 :</strong><em> Doigby, Skyyart, Nameless, Chelxie</em></span></li>\r\n<li style=\"font-family: \'bebas neue\'; text-align: left;\"><span style=\"font-family: \'bebas neue\';\"><strong>Equipe 5 :</strong> <em>Zerator, Aypierre, Kenny, Xari</em></span></li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<div class=\"wp-block-image aligncenter\">\r\n<figure class=\"size-large\"><img class=\"wp-image-1462\" title=\"Fallen Kingdoms GFight Invitational [1.8 et +] 2\" src=\"https://endorah.net/wp-content/uploads/2020/10/GoodBandeEndorahSoft-1024x59.png\" alt=\"GoodBandeEndorahSoft\" width=\"1024\" height=\"59\"></figure>\r\n</div>\r\n<h4 class=\"wp-block-heading has-text-align-center\" style=\"text-align: center;\">Aper&ccedil;u</h4>\r\n<p style=\"text-align: center;\">&lt;slider&gt;</p>\r\n<h4 class=\"wp-block-heading has-text-align-center\" style=\"text-align: center;\">Cin&eacute;matique</h4>\r\n<figure class=\"wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\">\r\n<div class=\"wp-block-embed__wrapper\"><iframe title=\"Minecraft Cinematic - Fallen Kingdoms GFight Invitational - Endorah\" src=\"https://www.youtube.com/embed/6yVzFAN4OS0?feature=oembed\" width=\"750\" height=\"422\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen=\"allowfullscreen\"></iframe></div>\r\n</figure>\r\n<p>&nbsp;</p>\r\n<div class=\"wp-block-image aligncenter\">\r\n<figure class=\"size-large\"><img class=\"wp-image-1462\" title=\"Fallen Kingdoms GFight Invitational [1.8 et +] 2\" src=\"https://endorah.net/wp-content/uploads/2020/10/GoodBandeEndorahSoft-1024x59.png\" alt=\"GoodBandeEndorahSoft\" width=\"1024\" height=\"59\"></figure>\r\n</div>\r\n<p>&nbsp;</p>\r\n<h4 class=\"wp-block-heading has-text-align-center\" style=\"text-align: center;\">T&eacute;l&eacute;chargement</h4>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\"><em>Rejoignez un combat sans merci avec les Mayas !</em></p>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\"><em><a title=\"Lien de t&eacute;l&eacute;chargement\" href=\"https://www.mediafire.com/file/o6hbaj4cnogx6gz/FallenKingdoms_GFight_Invitational.zip/file\" target=\"_blank\" rel=\"noopener\"><button>Fallen Kingdoms GFight Invitational [1.8 et +]</button></a>&nbsp;</em></p>\r\n<p>&nbsp;</p>\r\n<div class=\"wp-block-image aligncenter\">\r\n<figure class=\"size-large\"><img class=\"wp-image-1462\" title=\"Fallen Kingdoms GFight Invitational [1.8 et +] 2\" src=\"https://endorah.net/wp-content/uploads/2020/10/GoodBandeEndorahSoft-1024x59.png\" alt=\"GoodBandeEndorahSoft\" width=\"1024\" height=\"59\"></figure>\r\n</div>\r\n<h4 class=\"wp-block-heading has-text-align-center\" style=\"text-align: center;\">Cr&eacute;dits</h4>\r\n<p class=\"has-text-align-center\" style=\"text-align: left;\"><br><strong>Membres de la team ayant particip&eacute; &agrave; la cr&eacute;ation de la map :</strong></p>\r\n<ul class=\"wp-block-list\">\r\n<li style=\"text-align: left;\"><strong>Terraformers :</strong>&nbsp;<em>Bigbublle </em></li>\r\n<li style=\"text-align: left;\"><strong>Builders :&nbsp;</strong><em>adrichefclan, Guenquille, Xelah, EasyFrost, Nol&eacute;ler, SolHeaven, InoRyth, MissFlamme, Gabiscuit, Marvin</em>_99_</li>\r\n<li style=\"text-align: left;\"><strong>Graphiste</strong> : _<em>TaMyS_, LoupGarouNoir</em></li>\r\n<li style=\"text-align: left;\"><strong>R&eacute;daction </strong>: Typhon</li>\r\n<li style=\"text-align: left;\"><strong>Cin&eacute;matique</strong> : <em>Cryzopha</em></li>\r\n</ul>', '2021-04-03', 4, 54, 25, '/minesalt'),
(15, 'Fallen Kingdoms GFight Invitational [1.8 et +]', '<div class=\"wp-block-image aligncenter\">\r\n<figure class=\"size-large\"><img class=\"wp-image-2884\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"Fallen Kingdoms GFight Invitational [1.8 et +] 1\" src=\"https://endorah.net/wp-content/uploads/2021/04/Logo-FK_Gfight_Invitational-1024x512.png\" alt=\"Logo FK Gfight Invitational\" width=\"1024\" height=\"512\"></figure>\r\n</div>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\">Pour cette carte de l&rsquo;&eacute;v&eacute;nement <strong><em>Fallen Kingdoms GFight Invitational</em></strong> de <strong>Gotaga</strong>, nous avons r&eacute;alis&eacute; un monde dans le style Maya. Aux quatre points cardinaux, des statues protectrices veillent sur l&rsquo;&icirc;le, o&ugrave; en son centre un temple mystique sommeille au sein d&rsquo;un calendrier maya bord&eacute; de jardins somptueux.</p>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\">Plusieurs petits villages sont diss&eacute;min&eacute;s sur la carte, vous pourrez y retrouver diff&eacute;rentes ressources telles que du bl&eacute;, des past&egrave;ques ou encore des citrouilles qui y sont cultiv&eacute;es et vous permettront de vous nourrir. En explorant la jungle, vous tomberez sur d&rsquo;anciennes ruines : &agrave; vous de d&eacute;couvrir leurs secrets !</p>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\">Les 5 bases sont toutes &agrave; &eacute;quidistance du temple central; ce dernier abrite les portails d&rsquo;acc&egrave;s au Nether ainsi qu&rsquo;&agrave; l&rsquo;End.</p>\r\n<p>Les participants de l&rsquo;&eacute;v&eacute;nement sont :</p>\r\n<ul class=\"wp-block-list\">\r\n<li><strong>Equipe 1 :</strong> <em>Gotaga, Mickalow, Guill, Luccio</em></li>\r\n<li><strong>Equipe 2 :</strong> <em>Kamel, Kotei, Bibi, Etoiles</em></li>\r\n<li><strong>Equipe 3 :</strong> <em>Inoxtag, Mathox, Terracid, Potatoz</em></li>\r\n<li><strong>Equipe 4 :</strong><em> Doigby, Skyyart, Nameless, Chelxie</em></li>\r\n<li><strong>Equipe 5 :</strong> <em>Zerator, Aypierre, Kenny, Xari</em></li>\r\n</ul>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<div class=\"wp-block-image aligncenter\" style=\"text-align: center;\">\r\n<figure class=\"size-large\"><img class=\"wp-image-1462\" title=\"Fallen Kingdoms GFight Invitational [1.8 et +] 2\" src=\"https://endorah.net/wp-content/uploads/2020/10/GoodBandeEndorahSoft-1024x59.png\" alt=\"GoodBandeEndorahSoft\" width=\"1024\" height=\"59\"></figure>\r\n</div>\r\n<h4 class=\"wp-block-heading has-text-align-center\" style=\"text-align: center;\">Aper&ccedil;u</h4>\r\n<div class=\"carousel\">\r\n<div class=\"carousel-inner\" style=\"transform: translateX(0%);\">\r\n<div class=\"carousel-item active\"><img src=\"../../content/files/images/rendermembers.webp\" alt=\"Slide 1\"></div>\r\n<div class=\"carousel-item\"><img src=\"../../content/files/images/rendermembers.webp\" alt=\"Slide 2\"></div>\r\n<div class=\"carousel-item\"><img src=\"../../content/files/images/rendermembers.webp\" alt=\"Slide 3\"></div>\r\n<div class=\"carousel-item\"><img src=\"../../content/files/images/rendermembers.webp\" alt=\"Slide 4\"></div>\r\n<div class=\"carousel-item\"><img src=\"../../content/files/images/rendermembers.webp\" alt=\"Slide 5\"></div>\r\n<div class=\"carousel-item\"><img src=\"../../content/files/images/rendermembers.webp\" alt=\"Slide 6\"></div>\r\n</div>\r\n<button class=\"carousel-control prev\" data-direction=\"prev\">&lt;</button> <button class=\"carousel-control next\" data-direction=\"next\">&gt;</button></div>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\">&lt;slider&gt;</p>\r\n<h4 class=\"wp-block-heading has-text-align-center\" style=\"text-align: center;\">Cin&eacute;matique</h4>\r\n<figure class=\"wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\" style=\"text-align: center;\">\r\n<div class=\"wp-block-embed__wrapper\"><iframe title=\"Minecraft Cinematic - Fallen Kingdoms GFight Invitational - Endorah\" src=\"https://www.youtube.com/embed/6yVzFAN4OS0?feature=oembed\" width=\"750\" height=\"422\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen=\"allowfullscreen\"></iframe></div>\r\n</figure>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<div class=\"wp-block-image aligncenter\" style=\"text-align: center;\">\r\n<figure class=\"size-large\"><img class=\"wp-image-1462\" title=\"Fallen Kingdoms GFight Invitational [1.8 et +] 2\" src=\"https://endorah.net/wp-content/uploads/2020/10/GoodBandeEndorahSoft-1024x59.png\" alt=\"GoodBandeEndorahSoft\" width=\"1024\" height=\"59\"></figure>\r\n</div>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<h4 class=\"wp-block-heading has-text-align-center\" style=\"text-align: center;\">T&eacute;l&eacute;chargement</h4>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\"><em>Rejoignez un combat sans merci avec les Mayas !</em></p>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\"><em><a title=\"Lien de t&eacute;l&eacute;chargement\" href=\"https://www.mediafire.com/file/o6hbaj4cnogx6gz/FallenKingdoms_GFight_Invitational.zip/file\" target=\"_blank\" rel=\"noopener\"><button>Fallen Kingdoms GFight Invitational [1.8 et +]</button></a>&nbsp;</em></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<div class=\"wp-block-image aligncenter\" style=\"text-align: center;\">\r\n<figure class=\"size-large\"><img class=\"wp-image-1462\" title=\"Fallen Kingdoms GFight Invitational [1.8 et +] 2\" src=\"https://endorah.net/wp-content/uploads/2020/10/GoodBandeEndorahSoft-1024x59.png\" alt=\"GoodBandeEndorahSoft\" width=\"1024\" height=\"59\"></figure>\r\n</div>\r\n<h4 class=\"wp-block-heading has-text-align-center\" style=\"text-align: center;\">Cr&eacute;dits</h4>\r\n<p class=\"has-text-align-center\" style=\"text-align: center;\"><br><strong>Membres de la team ayant particip&eacute; &agrave; la cr&eacute;ation de la map :</strong></p>\r\n<ul class=\"wp-block-list\">\r\n<li><strong>Terraformers :</strong>&nbsp;<em>Bigbublle </em></li>\r\n<li><strong>Builders :&nbsp;</strong><em>adrichefclan, Guenquille, Xelah, EasyFrost, Nol&eacute;ler, SolHeaven, InoRyth, MissFlamme, Gabiscuit, Marvin</em>_99_</li>\r\n<li><strong>Graphiste</strong> : _<em>TaMyS_, LoupGarouNoir</em></li>\r\n<li><strong>R&eacute;daction </strong>: Typhon</li>\r\n<li><strong>Cin&eacute;matique</strong> : <em>Cryzopha</em></li>\r\n</ul>\r\n<div class=\"slide bg5\">&nbsp;</div>', '2021-04-03', 4, 53, 51, '/fktest'),
(16, 'test', '<p>test</p>', '2025-02-27', 4, 25, 26, '/testprojet'),
(17, 'test', '<p>test</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<details class=\"accordion\">\r\n<summary class=\"accordion-header\">Test</summary>\r\n<div class=\"accordion-content\">bidule qs dsf sqg fsgdqfqdhqdfh</div>\r\n</details>\r\n<p>&nbsp;</p>', '2025-03-11', 4, 25, 25, '/testtest');

-- --------------------------------------------------------

--
-- Structure de la table `Reseau`
--

CREATE TABLE `Reseau` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` int NOT NULL,
  `icon_hover` int NOT NULL,
  `link` text NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Reseau`
--

INSERT INTO `Reseau` (`id`, `name`, `icon`, `icon_hover`, `link`, `added`) VALUES
(23, 'X', 73, 74, 'https://twitter.com/EndorahCreation', '2025-02-03 13:57:24'),
(24, 'Instagram', 69, 70, 'https://www.instagram.com/endorahcreation/', '2025-02-03 13:57:53'),
(25, 'YouTube', 79, 80, 'https://www.youtube.com/channel/UCOpXVQfJQ1C-0KRG6sbwPTw', '2025-02-03 13:58:20'),
(26, 'Discord', 67, 68, 'https://discord.gg/FggdaDh2Ya', '2025-02-03 13:58:48'),
(27, 'Planet Minecraft', 89, 84, 'https://www.planetminecraft.com/member/endorah/', '2025-02-03 13:59:13'),
(28, 'Linkedin', 77, 78, 'https://www.linkedin.com/company/endorah/', '2025-02-03 14:00:19'),
(29, 'BlueSky', 75, 76, 'https://bsky.app/profile/endorah.net', '2025-02-03 14:01:38'),
(30, 'TikTok', 71, 72, 'https://www.tiktok.com/@endorahcreation', '2025-02-03 14:02:55');

-- --------------------------------------------------------

--
-- Structure de la table `Role`
--

CREATE TABLE `Role` (
  `id` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `id_Role_category` int NOT NULL,
  `icone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Role`
--

INSERT INTO `Role` (`id`, `nom`, `id_Role_category`, `icone`) VALUES
(1, 'Président', 1, 118),
(2, 'Responsable d\'équipe', 1, 118),
(3, 'Coordinateur Construction', 2, 118),
(6, 'Coordinateur développement', 2, 118),
(7, 'Coordinateur Audiovisuel', 2, 118),
(8, 'Chargé de gestion', 4, 118),
(9, 'Chargé des stocks et des envois', 4, 118),
(10, 'Builder', 5, 118),
(11, 'Décorateur', 5, 118),
(12, 'Terraformeur', 5, 118),
(13, 'Render Maker', 6, 118),
(14, 'Infographiste', 6, 118),
(15, 'DataPack Maker', 7, 118),
(16, 'Modélisateur', 6, 118),
(17, 'Développeur Java', 8, 118),
(18, 'Développeur Web', 8, 118),
(19, 'Rédacteur', 9, 118);

-- --------------------------------------------------------

--
-- Structure de la table `RoleAdmin`
--

CREATE TABLE `RoleAdmin` (
  `id` int NOT NULL,
  `id_Administrateur` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Role_admin`
--

CREATE TABLE `Role_admin` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `color` varchar(7) DEFAULT '#FFFFFF',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Role_admin`
--

INSERT INTO `Role_admin` (`id`, `name`, `permission`, `color`, `added`) VALUES
(1, 'test', '11111111111', '#FFFFFF', '2025-01-09 11:37:20'),
(2, 'test2', 'test2', '#574848', '2025-01-09 11:37:20'),
(3, 'admin', 'admin', '#FFFFFF', '2025-01-10 22:25:57'),
(4, 'test', 'test', '#FFFFFF', '2025-02-03 14:25:57');

-- --------------------------------------------------------

--
-- Structure de la table `Role_category`
--

CREATE TABLE `Role_category` (
  `id` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `couleur` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Role_category`
--

INSERT INTO `Role_category` (`id`, `nom`, `couleur`) VALUES
(1, 'Responsable', '#990000'),
(2, 'Direction', '#ea989a'),
(4, 'Gestion', '#f0baee'),
(5, 'Construction', '#d8ead2'),
(6, 'Audiovisuel', '#ffe599'),
(7, 'Technique', '#f9ca9c'),
(8, 'Développement', '#76a4b1'),
(9, 'Communication', '#9fc5e9'),
(10, 'Membre Honorable', '#334960');

-- --------------------------------------------------------

--
-- Structure de la table `Service`
--

CREATE TABLE `Service` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `background` int NOT NULL,
  `mascot` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Service`
--

INSERT INTO `Service` (`id`, `title`, `content`, `background`, `mascot`) VALUES
(1, 'Modélisation', 'Grâce à notre expertise, nous donnons vie à vos idées dans un univers Minecraft immersif.Construction, Décoration, Terraforming, Ambiance…', 40, 66),
(2, 'Etude de projet', 'Grâce à notre expertise, nous donnons vie à vos idées dans un univers Minecraft immersif.Construction, Décoration, Terraforming, Ambiance…', 54, 33),
(3, 'Construction', 'Grâce à notre expertise, nous donnons vie à vos idées dans un univers Minecraft immersif.Construction, Décoration, Terraforming, Ambiance…', 53, 30),
(4, 'Construction', 'Grâce à notre expertise, nous donnons vie à vos idées dans un univers Minecraft immersif.Construction, Décoration, Terraforming, Ambiance…', 62, 66),
(5, 'Construction', 'Grâce à notre expertise, nous donnons vie à vos idées dans un univers Minecraft immersif.Construction, Décoration, Terraforming, Ambiance…', 54, 28),
(6, 'Construction', 'Grâce à notre expertise, nous donnons vie à vos idées dans un univers Minecraft immersif.Construction, Décoration, Terraforming, Ambiance…', 40, 34),
(7, 'Construction', 'Grâce à notre expertise, nous donnons vie à vos idées dans un univers Minecraft immersif.Construction, Décoration, Terraforming, Ambiance…', 54, 26);

-- --------------------------------------------------------

--
-- Structure de la table `Tag`
--

CREATE TABLE `Tag` (
  `id` int NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Tag`
--

INSERT INTO `Tag` (`id`, `nom`) VALUES
(1, 'Aventure'),
(2, 'Visite');

-- --------------------------------------------------------

--
-- Structure de la table `TagProject`
--

CREATE TABLE `TagProject` (
  `id` int NOT NULL,
  `id_Project` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TagProject`
--

INSERT INTO `TagProject` (`id`, `id_Project`) VALUES
(1, 8),
(2, 8),
(2, 15),
(1, 16),
(1, 17);

-- --------------------------------------------------------

--
-- Structure de la table `Type`
--

CREATE TABLE `Type` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Type`
--

INSERT INTO `Type` (`id`, `name`) VALUES
(4, 'Campagne'),
(5, 'Projet');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Administrateur`
--
ALTER TABLE `Administrateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `CategoryProject`
--
ALTER TABLE `CategoryProject`
  ADD PRIMARY KEY (`id`,`id_Category`),
  ADD KEY `CategoryProject_Category1_FK` (`id_Category`);

--
-- Index pour la table `Commentaire`
--
ALTER TABLE `Commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Commentaire_Project0_FK` (`id_Project`),
  ADD KEY `Commentaire_Commentaire1_FK` (`id_Commentaire`);

--
-- Index pour la table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ImagesPortfolio`
--
ALTER TABLE `ImagesPortfolio`
  ADD PRIMARY KEY (`id_Projet`,`id_Image`),
  ADD KEY `ImagesPortfolio_Image1_FK` (`id_Image`);

--
-- Index pour la table `Membre`
--
ALTER TABLE `Membre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Membre_Image0_FK` (`id_Image`);

--
-- Index pour la table `MembreRole`
--
ALTER TABLE `MembreRole`
  ADD PRIMARY KEY (`id`,`id_Role`),
  ADD KEY `MembreRole_Role1_FK` (`id_Role`);

--
-- Index pour la table `Navbar`
--
ALTER TABLE `Navbar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Navbar_Navbar0_FK` (`id_Navbar`);

--
-- Index pour la table `Page`
--
ALTER TABLE `Page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Image` (`image_id`);

--
-- Index pour la table `Partenaire`
--
ALTER TABLE `Partenaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Partenaire_Image0_FK` (`id_Image`);

--
-- Index pour la table `Portfolio`
--
ALTER TABLE `Portfolio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Image_Portfolio` (`id_Image`);

--
-- Index pour la table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Project_Type0_FK` (`id_Type`),
  ADD KEY `Image_Logo` (`id_logo`),
  ADD KEY `Image_Image` (`id_Image`);

--
-- Index pour la table `Reseau`
--
ALTER TABLE `Reseau`
  ADD PRIMARY KEY (`id`),
  ADD KEY `icon_image` (`icon`),
  ADD KEY `icon_hover_image` (`icon_hover`);

--
-- Index pour la table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Role_Role_category0_FK` (`id_Role_category`),
  ADD KEY `image_icon` (`icone`);

--
-- Index pour la table `RoleAdmin`
--
ALTER TABLE `RoleAdmin`
  ADD PRIMARY KEY (`id`,`id_Administrateur`),
  ADD KEY `RoleAdmin_Administrateur1_FK` (`id_Administrateur`);

--
-- Index pour la table `Role_admin`
--
ALTER TABLE `Role_admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Role_category`
--
ALTER TABLE `Role_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `background_image` (`background`),
  ADD KEY `mascot_image` (`mascot`);

--
-- Index pour la table `Tag`
--
ALTER TABLE `Tag`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `TagProject`
--
ALTER TABLE `TagProject`
  ADD PRIMARY KEY (`id`,`id_Project`),
  ADD KEY `TagProject_Project1_FK` (`id_Project`);

--
-- Index pour la table `Type`
--
ALTER TABLE `Type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Administrateur`
--
ALTER TABLE `Administrateur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `CategoryProject`
--
ALTER TABLE `CategoryProject`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `Commentaire`
--
ALTER TABLE `Commentaire`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `Image`
--
ALTER TABLE `Image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT pour la table `ImagesPortfolio`
--
ALTER TABLE `ImagesPortfolio`
  MODIFY `id_Projet` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `Membre`
--
ALTER TABLE `Membre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `MembreRole`
--
ALTER TABLE `MembreRole`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `Navbar`
--
ALTER TABLE `Navbar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `Page`
--
ALTER TABLE `Page`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `Partenaire`
--
ALTER TABLE `Partenaire`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `Portfolio`
--
ALTER TABLE `Portfolio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `Project`
--
ALTER TABLE `Project`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `Reseau`
--
ALTER TABLE `Reseau`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `Role`
--
ALTER TABLE `Role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `RoleAdmin`
--
ALTER TABLE `RoleAdmin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Role_admin`
--
ALTER TABLE `Role_admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Role_category`
--
ALTER TABLE `Role_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Service`
--
ALTER TABLE `Service`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `Tag`
--
ALTER TABLE `Tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `TagProject`
--
ALTER TABLE `TagProject`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Type`
--
ALTER TABLE `Type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `CategoryProject`
--
ALTER TABLE `CategoryProject`
  ADD CONSTRAINT `CategoryProject_Category1_FK` FOREIGN KEY (`id_Category`) REFERENCES `Category` (`id`),
  ADD CONSTRAINT `CategoryProject_Project0_FK` FOREIGN KEY (`id`) REFERENCES `Project` (`id`);

--
-- Contraintes pour la table `Commentaire`
--
ALTER TABLE `Commentaire`
  ADD CONSTRAINT `Commentaire_Commentaire1_FK` FOREIGN KEY (`id_Commentaire`) REFERENCES `Commentaire` (`id`),
  ADD CONSTRAINT `Commentaire_Project0_FK` FOREIGN KEY (`id_Project`) REFERENCES `Project` (`id`);

--
-- Contraintes pour la table `ImagesPortfolio`
--
ALTER TABLE `ImagesPortfolio`
  ADD CONSTRAINT `ImagesPortfolio_Image1_FK` FOREIGN KEY (`id_Image`) REFERENCES `Image` (`id`),
  ADD CONSTRAINT `portfolio_projet` FOREIGN KEY (`id_Projet`) REFERENCES `Project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `Membre`
--
ALTER TABLE `Membre`
  ADD CONSTRAINT `Membre_Image0_FK` FOREIGN KEY (`id_Image`) REFERENCES `Image` (`id`);

--
-- Contraintes pour la table `MembreRole`
--
ALTER TABLE `MembreRole`
  ADD CONSTRAINT `MembreRole_Membre0_FK` FOREIGN KEY (`id`) REFERENCES `Membre` (`id`),
  ADD CONSTRAINT `MembreRole_Role1_FK` FOREIGN KEY (`id_Role`) REFERENCES `Role` (`id`);

--
-- Contraintes pour la table `Navbar`
--
ALTER TABLE `Navbar`
  ADD CONSTRAINT `Navbar_Navbar0_FK` FOREIGN KEY (`id_Navbar`) REFERENCES `Navbar` (`id`);

--
-- Contraintes pour la table `Page`
--
ALTER TABLE `Page`
  ADD CONSTRAINT `Image` FOREIGN KEY (`image_id`) REFERENCES `Image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `Partenaire`
--
ALTER TABLE `Partenaire`
  ADD CONSTRAINT `Partenaire_Image0_FK` FOREIGN KEY (`id_Image`) REFERENCES `Image` (`id`);

--
-- Contraintes pour la table `Portfolio`
--
ALTER TABLE `Portfolio`
  ADD CONSTRAINT `Image_Portfolio` FOREIGN KEY (`id_Image`) REFERENCES `Image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `Project`
--
ALTER TABLE `Project`
  ADD CONSTRAINT `Image_Image` FOREIGN KEY (`id_Image`) REFERENCES `Image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Image_Logo` FOREIGN KEY (`id_logo`) REFERENCES `Image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Project_Type0_FK` FOREIGN KEY (`id_Type`) REFERENCES `Type` (`id`);

--
-- Contraintes pour la table `Reseau`
--
ALTER TABLE `Reseau`
  ADD CONSTRAINT `icon_hover_image` FOREIGN KEY (`icon_hover`) REFERENCES `Image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `icon_image` FOREIGN KEY (`icon`) REFERENCES `Image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `Role`
--
ALTER TABLE `Role`
  ADD CONSTRAINT `image_icon` FOREIGN KEY (`icone`) REFERENCES `Image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Role_Role_category0_FK` FOREIGN KEY (`id_Role_category`) REFERENCES `Role_category` (`id`);

--
-- Contraintes pour la table `RoleAdmin`
--
ALTER TABLE `RoleAdmin`
  ADD CONSTRAINT `RoleAdmin_Administrateur1_FK` FOREIGN KEY (`id_Administrateur`) REFERENCES `Administrateur` (`id`),
  ADD CONSTRAINT `RoleAdmin_Role_admin0_FK` FOREIGN KEY (`id`) REFERENCES `Role_admin` (`id`);

--
-- Contraintes pour la table `Service`
--
ALTER TABLE `Service`
  ADD CONSTRAINT `background_image` FOREIGN KEY (`background`) REFERENCES `Image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `mascot_image` FOREIGN KEY (`mascot`) REFERENCES `Image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `TagProject`
--
ALTER TABLE `TagProject`
  ADD CONSTRAINT `TagProject_Project1_FK` FOREIGN KEY (`id_Project`) REFERENCES `Project` (`id`),
  ADD CONSTRAINT `TagProject_Tag0_FK` FOREIGN KEY (`id`) REFERENCES `Tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
