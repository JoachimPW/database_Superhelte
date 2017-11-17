-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2017 at 10:25 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

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
-- Table structure for table `beskder`
--

CREATE TABLE `beskder` (
  `BeskedID` int(3) NOT NULL,
  `Besked_sender` int(3) NOT NULL,
  `Besked_modtager` int(3) NOT NULL,
  `Besked` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gaver`
--

CREATE TABLE `gaver` (
  `GaveID` int(3) NOT NULL,
  `Gave_sender` int(3) NOT NULL,
  `Gave_modtager` int(3) NOT NULL,
  `Gave` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kommentarer`
--

CREATE TABLE `kommentarer` (
  `CommentID` int(3) NOT NULL,
  `Comment_sender` int(3) NOT NULL,
  `Comment_modtager` int(3) NOT NULL,
  `Kommentar` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `superhelte`
--

CREATE TABLE `superhelte` (
  `id` int(100) NOT NULL,
  `Helt` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Age` int(100) NOT NULL,
  `Power` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Billede` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Liikes` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `superhelte`
--

INSERT INTO `superhelte` (`id`, `Helt`, `Age`, `Power`, `Billede`, `Liikes`) VALUES
(1, 'Batman', 37, 'Money', 'batman.jpg', 15),
(2, 'Hulk', 35, 'Styrke', 'hulk.jpg', 29),
(3, 'Superman', 40, 'Flyve, stærk og røntgensyn', 'superman.jpg', 22),
(4, 'Hellboy', 40, 'Råstyrke og immun for ild', 'hellboy.jpg', 8),
(5, 'Catwoman', 33, 'Burgler', 'catwoman.png', 1),
(17, 'Botman', 21, 'Spicy meme', '68833.png', 8),
(18, 'Wonderwoman', 41, 'Flyve', '32889.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userID` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userProfession` varchar(50) NOT NULL,
  `userPic` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userID`, `userName`, `userProfession`, `userPic`) VALUES
(42, 'dwayne johnson', 'actor, wrestler', '380289.jpg'),
(43, 'justin bieber', 'singer', '995062.jpg'),
(44, 'chris hemsworth', 'actor', '171544.jpg'),
(41, 'john cena', 'wrestler', '549279.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beskder`
--
ALTER TABLE `beskder`
  ADD PRIMARY KEY (`BeskedID`),
  ADD UNIQUE KEY `Besked_sender` (`Besked_sender`),
  ADD UNIQUE KEY `Besked_modtager` (`Besked_modtager`);

--
-- Indexes for table `gaver`
--
ALTER TABLE `gaver`
  ADD PRIMARY KEY (`GaveID`),
  ADD UNIQUE KEY `Gave_sender` (`Gave_sender`),
  ADD UNIQUE KEY `Gave_modtager` (`Gave_modtager`);

--
-- Indexes for table `kommentarer`
--
ALTER TABLE `kommentarer`
  ADD PRIMARY KEY (`CommentID`),
  ADD UNIQUE KEY `Comment_sender` (`Comment_sender`),
  ADD UNIQUE KEY `Comment_modtager` (`Comment_modtager`);

--
-- Indexes for table `superhelte`
--
ALTER TABLE `superhelte`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beskder`
--
ALTER TABLE `beskder`
  MODIFY `BeskedID` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gaver`
--
ALTER TABLE `gaver`
  MODIFY `GaveID` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kommentarer`
--
ALTER TABLE `kommentarer`
  MODIFY `CommentID` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `superhelte`
--
ALTER TABLE `superhelte`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `beskder`
--
ALTER TABLE `beskder`
  ADD CONSTRAINT `beskder_ibfk_1` FOREIGN KEY (`Besked_sender`) REFERENCES `superhelte` (`id`),
  ADD CONSTRAINT `beskder_ibfk_2` FOREIGN KEY (`Besked_modtager`) REFERENCES `superhelte` (`id`);

--
-- Constraints for table `gaver`
--
ALTER TABLE `gaver`
  ADD CONSTRAINT `gaver_ibfk_1` FOREIGN KEY (`Gave_sender`) REFERENCES `superhelte` (`id`),
  ADD CONSTRAINT `gaver_ibfk_2` FOREIGN KEY (`Gave_modtager`) REFERENCES `superhelte` (`id`);

--
-- Constraints for table `kommentarer`
--
ALTER TABLE `kommentarer`
  ADD CONSTRAINT `kommentarer_ibfk_1` FOREIGN KEY (`Comment_sender`) REFERENCES `superhelte` (`id`),
  ADD CONSTRAINT `kommentarer_ibfk_2` FOREIGN KEY (`Comment_modtager`) REFERENCES `superhelte` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
