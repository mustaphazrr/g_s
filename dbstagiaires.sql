-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le :  Janvier 2014 à 21:10
-- Version du serveur: 5.5.8
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dbstagiaires`
--
CREATE DATABASE `dbstagiaires` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `dbstagiaires`;

-- --------------------------------------------------------

--
-- Structure de la table `encadreurs`
--

CREATE TABLE IF NOT EXISTS `encadreurs` (
  `matricule` int(11) NOT NULL AUTO_INCREMENT,
  `codeFonction` int(11) NOT NULL,
  `nomenc` varchar(15) COLLATE utf8_bin NOT NULL,
  `prenomenc` varchar(15) COLLATE utf8_bin NOT NULL,
  `sexe` varchar(1) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`matricule`),
  KEY `codeFonction` (`codeFonction`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `encadreurs`
--

INSERT INTO `encadreurs` (`matricule`, `codeFonction`, `nomenc`, `prenomenc`, `sexe`, `telephone`) VALUES
(1, 1, 'tsimba', 'serge', 'm', '0895242861'),
(2, 2, 'nsiangani', 'rodrigue', 'm', '0895146418'),
(3, 2, 'kinkie', 'digital', 'm', '0897777705');

-- --------------------------------------------------------

--
-- Structure de la table `fonctions`
--

CREATE TABLE IF NOT EXISTS `fonctions` (
  `codeFonction` int(11) NOT NULL AUTO_INCREMENT,
  `libelleFonction` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codeFonction`),
  KEY `codeFonction` (`codeFonction`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `fonctions`
--

INSERT INTO `fonctions` (`codeFonction`, `libelleFonction`) VALUES
(1, 'directeur RH'),
(2, 'informaticien'),
(3, 'comptable'),
(4, 'marketer');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `codeserv` int(11) NOT NULL AUTO_INCREMENT,
  `libelleserv` varchar(20) COLLATE utf8_bin NOT NULL,
  `chefserv` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codeserv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `services`
--

INSERT INTO `services` (`codeserv`, `libelleserv`, `chefserv`) VALUES
(1, 'ressources humaines', 'tsimba'),
(2, 'informatique', 'nsiangani');

-- --------------------------------------------------------

--
-- Structure de la table `stagiaires`
--

CREATE TABLE IF NOT EXISTS `stagiaires` (
  `numstagiaire` varchar(5) COLLATE utf8_bin NOT NULL,
  `matricule` int(11) NOT NULL,
  `codeserv` int(11) NOT NULL,
  `nom` varchar(15) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(15) COLLATE utf8_bin NOT NULL,
  `sexe` varchar(1) COLLATE utf8_bin NOT NULL,
  `datenais` text COLLATE utf8_bin NOT NULL,
  `debutstage` text COLLATE utf8_bin NOT NULL,
  `finstage` text COLLATE utf8_bin NOT NULL,
  `photo` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'defaultpict.jpg',
  PRIMARY KEY (`numstagiaire`),
  KEY `matricule` (`matricule`,`codeserv`),
  KEY `codeserv` (`codeserv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `stagiaires`
--

INSERT INTO `stagiaires` (`numstagiaire`, `matricule`, `codeserv`, `nom`, `prenom`, `sexe`, `datenais`, `debutstage`, `finstage`, `photo`) VALUES
('E0001', 1, 1, 'LEKA', 'EMILIE', 'f', '1987-05-04', '2013-08-07', '2013-09-12', 'defaultpict.jpg'),
('E0003', 2, 2, 'SAMBA', 'DANIEL', 'm', '1980-07-09', '2013-12-13', '2014-01-14', 'daniel_samba.jpg'),
('E0005', 3, 1, 'TSIMBA', 'SERGE', 'm', '1986-11-24', '04/02/2014', '09/03/2014', 'P101012_07.17.jpg'),
('E0008', 2, 1, 'OMEONGA', 'PAPY', 'm', '1980/05/09', '2013/07/09', '2013/08/11', 'P101012_07.39.jpg'),
('E0012', 3, 1, 'lukanyi', 'happy', 'f', '1981-10-11', '01/01/2014', '01/02/2014', '704202_514606001958054_644559290_o.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `nomuser` varchar(20) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(15) COLLATE utf8_bin NOT NULL,
  `login` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`iduser`,`password`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`iduser`, `nomuser`, `prenom`, `login`, `password`) VALUES
(1, 'lukanyi', 'happy', 'sandrine', 'abcde'),
(2, 'tsimba', 'serge', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `visites`
--

CREATE TABLE IF NOT EXISTS `visites` (
  `matricule` int(11) NOT NULL,
  `codeserv` int(11) NOT NULL,
  `datevisite` date NOT NULL,
  KEY `matricule` (`matricule`,`codeserv`),
  KEY `codeserv` (`codeserv`),
  KEY `codeserv_2` (`codeserv`),
  KEY `codeserv_3` (`codeserv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `visites`
--


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `encadreurs`
--
ALTER TABLE `encadreurs`
  ADD CONSTRAINT `encadreurs_ibfk_1` FOREIGN KEY (`codeFonction`) REFERENCES `fonctions` (`codeFonction`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stagiaires`
--
ALTER TABLE `stagiaires`
  ADD CONSTRAINT `stagiaires_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `encadreurs` (`matricule`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stagiaires_ibfk_2` FOREIGN KEY (`codeserv`) REFERENCES `services` (`codeserv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `visites`
--
ALTER TABLE `visites`
  ADD CONSTRAINT `visites_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `encadreurs` (`matricule`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visites_ibfk_2` FOREIGN KEY (`codeserv`) REFERENCES `services` (`codeserv`) ON DELETE CASCADE ON UPDATE CASCADE;
