-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: maria:3306
-- Generation Time: Feb 05, 2023 at 03:21 AM
-- Server version: 5.7.41
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topsis`
--

-- --------------------------------------------------------

--
-- Table structure for table `kambing`
--

CREATE TABLE `kambing` (
  `id_kambing` int(10) NOT NULL,
  `no_kalung` varchar(6) NOT NULL,
  `ciri_khas` text NOT NULL,
  `tanggal_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kambing`
--

INSERT INTO `kambing` (`id_kambing`, `no_kalung`, `ciri_khas`, `tanggal_input`) VALUES
(10, '1', 'kabalen', '2023-01-29'),
(11, '2', 'babelan', '2023-01-29'),
(12, '3', 'kedung', '2023-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `type` enum('benefit','cost') NOT NULL,
  `bobot` float NOT NULL,
  `ada_pilihan` tinyint(1) DEFAULT NULL,
  `urutan_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama`, `type`, `bobot`, `ada_pilihan`, `urutan_order`) VALUES
(16, 'C1_Tinggi Badan', 'cost', 4, 0, 1),
(17, 'C2_Balita di timbang', 'cost', 3, 0, 2),
(18, 'C3_Balita sangat pendek', 'benefit', 2, 0, 3),
(19, 'C4_Balita Pendek', 'benefit', 3, 0, 4),
(20, 'C5_Balita Normal', 'benefit', 4, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_kambing`
--

CREATE TABLE `nilai_kambing` (
  `id_nilai_kambing` int(11) NOT NULL,
  `id_kambing` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_kambing`
--

INSERT INTO `nilai_kambing` (`id_nilai_kambing`, `id_kambing`, `id_kriteria`, `nilai`) VALUES
(84, 10, 16, 3),
(85, 10, 17, 3),
(86, 10, 18, 1),
(87, 10, 19, 2),
(88, 10, 20, 4),
(89, 11, 16, 4),
(90, 11, 17, 3),
(91, 11, 18, 2),
(92, 11, 19, 3),
(93, 11, 20, 4),
(94, 12, 16, 3),
(95, 12, 17, 4),
(96, 12, 18, 4),
(97, 12, 19, 3),
(98, 12, 20, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pilihan_kriteria`
--

CREATE TABLE `pilihan_kriteria` (
  `id_pil_kriteria` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `nilai` float NOT NULL,
  `urutan_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(5) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `role` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `email`, `alamat`, `role`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Uno Stacko', 'unoo@gmail.com', 'Jalan Naik Turun 3312', '1'),
(7, 'petugas', '670489f94b6997a870b148f74744ee5676304925', 'Uno S', 'test@thesamplemail.com', 'test', '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kambing`
--
ALTER TABLE `kambing`
  ADD PRIMARY KEY (`id_kambing`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `nilai_kambing`
--
ALTER TABLE `nilai_kambing`
  ADD PRIMARY KEY (`id_nilai_kambing`),
  ADD UNIQUE KEY `id_kambing_2` (`id_kambing`,`id_kriteria`),
  ADD KEY `id_kambing` (`id_kambing`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  ADD PRIMARY KEY (`id_pil_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kambing`
--
ALTER TABLE `kambing`
  MODIFY `id_kambing` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `nilai_kambing`
--
ALTER TABLE `nilai_kambing`
  MODIFY `id_nilai_kambing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  MODIFY `id_pil_kriteria` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai_kambing`
--
ALTER TABLE `nilai_kambing`
  ADD CONSTRAINT `nilai_kambing_ibfk_1` FOREIGN KEY (`id_kambing`) REFERENCES `kambing` (`id_kambing`),
  ADD CONSTRAINT `nilai_kambing_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Constraints for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  ADD CONSTRAINT `pilihan_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
