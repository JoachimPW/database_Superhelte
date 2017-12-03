-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 03. 12 2017 kl. 22:44:13
-- Serverversion: 10.1.21-MariaDB
-- PHP-version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `superhelte`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `beskder`
--

CREATE TABLE `beskder` (
  `BeskedID` int(3) NOT NULL,
  `Besked_sender` int(3) NOT NULL,
  `Besked_modtager` int(3) NOT NULL,
  `Besked` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `gaver`
--

CREATE TABLE `gaver` (
  `GaveID` int(3) NOT NULL,
  `Gave_sender` int(3) NOT NULL,
  `Gave_modtager` int(3) NOT NULL,
  `Gave` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `helte`
--

CREATE TABLE `helte` (
  `id` int(100) NOT NULL,
  `Helt` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Age` int(100) NOT NULL,
  `Power` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Billede` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Liikes` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Data dump for tabellen `helte`
--

INSERT INTO `helte` (`id`, `Helt`, `Age`, `Power`, `Billede`, `Liikes`) VALUES
(1, 'Batman', 37, 'Money', 'batman.jpg', 165),
(2, 'Hulk', 35, 'Styrke', 'hulk.jpg', 141),
(3, 'Superman', 40, 'Flyve, stærk og røntgensyn', 'superman.jpg', 38),
(4, 'Hellboy', 40, 'Råstyrke og immun for ild', 'hellboy.jpg', 11),
(5, 'Catwoman', 33, 'Burgler', 'catwoman.png', 14),
(17, 'Botman', 21, 'Spicy meme', '68833.png', 19),
(18, 'Wonderwoman', 41, 'Flyve', '32889.jpg', 25);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `kommentarer`
--

CREATE TABLE `kommentarer` (
  `Comment_id` int(3) NOT NULL,
  `Comment_Sender` int(3) NOT NULL,
  `Comment_Modtager` int(3) NOT NULL,
  `Kommentar` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Data dump for tabellen `kommentarer`
--

INSERT INTO `kommentarer` (`Comment_id`, `Comment_Sender`, `Comment_Modtager`, `Kommentar`) VALUES
(1, 3, 4, 'Hej'),
(112, 18, 2, 'HEJ HULK'),
(114, 18, 3, 'Dette er en test'),
(118, 18, 4, 'Hell of a boy'),
(121, 18, 2, 'Dav'),
(124, 18, 2, 'Test12345'),
(125, 18, 3, 'Hej Superman'),
(126, 18, 17, 'Hej Botman'),
(132, 18, 5, 'Dav'),
(133, 18, 1, 'HALLOEJ');

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `beskder`
--
ALTER TABLE `beskder`
  ADD PRIMARY KEY (`BeskedID`),
  ADD UNIQUE KEY `Besked_sender` (`Besked_sender`),
  ADD UNIQUE KEY `Besked_modtager` (`Besked_modtager`);

--
-- Indeks for tabel `gaver`
--
ALTER TABLE `gaver`
  ADD PRIMARY KEY (`GaveID`),
  ADD UNIQUE KEY `Gave_sender` (`Gave_sender`),
  ADD UNIQUE KEY `Gave_modtager` (`Gave_modtager`);

--
-- Indeks for tabel `helte`
--
ALTER TABLE `helte`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `kommentarer`
--
ALTER TABLE `kommentarer`
  ADD PRIMARY KEY (`Comment_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `beskder`
--
ALTER TABLE `beskder`
  MODIFY `BeskedID` int(3) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `gaver`
--
ALTER TABLE `gaver`
  MODIFY `GaveID` int(3) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `helte`
--
ALTER TABLE `helte`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Tilføj AUTO_INCREMENT i tabel `kommentarer`
--
ALTER TABLE `kommentarer`
  MODIFY `Comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `beskder`
--
ALTER TABLE `beskder`
  ADD CONSTRAINT `beskder_ibfk_1` FOREIGN KEY (`Besked_sender`) REFERENCES `helte` (`id`),
  ADD CONSTRAINT `beskder_ibfk_2` FOREIGN KEY (`Besked_modtager`) REFERENCES `helte` (`id`);

--
-- Begrænsninger for tabel `gaver`
--
ALTER TABLE `gaver`
  ADD CONSTRAINT `gaver_ibfk_1` FOREIGN KEY (`Gave_sender`) REFERENCES `helte` (`id`),
  ADD CONSTRAINT `gaver_ibfk_2` FOREIGN KEY (`Gave_modtager`) REFERENCES `helte` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
