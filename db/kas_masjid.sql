-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2022 at 05:09 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kas_masjid`
--

-- --------------------------------------------------------

--
-- Table structure for table `kas_masjid`
--

CREATE TABLE `kas_masjid` (
  `id_km` int(11) NOT NULL,
  `tgl_km` date NOT NULL,
  `uraian_pm` varchar(200) NOT NULL,
  `uraian_km` varchar(200) NOT NULL,
  `masuk` int(11) NOT NULL,
  `keluar` int(11) NOT NULL,
  `jenis` enum('Masuk','Keluar') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kas_masjid`
--

INSERT INTO `kas_masjid` (`id_km`, `tgl_km`, `uraian_pm`, `uraian_km`, `masuk`, `keluar`, `jenis`) VALUES
(10, '2022-10-15', '-', 'Semen', 0, 50000, 'Keluar'),
(11, '2022-10-14', 'Amal jumat', '0', 100000, 0, 'Masuk'),
(12, '2022-10-14', 'amal orang', '-', 50000, 0, 'Masuk'),
(13, '2022-10-14', '-', 'makan', 0, 50000, 'Keluar');

-- --------------------------------------------------------

--
-- Table structure for table `kas_sosial`
--

CREATE TABLE `kas_sosial` (
  `id_ks` int(11) NOT NULL,
  `tgl_ks` date NOT NULL,
  `uraian_ks` varchar(200) NOT NULL,
  `uraian_keluar` varchar(200) NOT NULL,
  `masuk` int(11) NOT NULL,
  `keluar` int(11) NOT NULL,
  `jenis` enum('Masuk','Keluar') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kas_sosial`
--

INSERT INTO `kas_sosial` (`id_ks`, `tgl_ks`, `uraian_ks`, `uraian_keluar`, `masuk`, `keluar`, `jenis`) VALUES
(6, '2022-10-03', 'Shodaqoh Lestiani', '', 750000, 0, 'Masuk'),
(7, '2022-10-01', 'Shodaqoh dede yulyandri', '', 200000, 0, 'Masuk'),
(8, '2022-10-03', 'shodaqoh apriliani', '', 250000, 0, 'Masuk'),
(9, '2022-10-03', '-', 'amal duafa', 0, 30000, 'Keluar'),
(10, '2022-10-14', 'Shodaqoh Lestiani', '-', 250000, 0, 'Masuk'),
(11, '2022-10-14', '-', 'dicuri', 0, 200000, 'Keluar');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` enum('Administrator','Bendahara','DKM') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(1, 'Admin Masjid', 'admin', 'admin', 'Administrator'),
(4, 'Bendahara1', 'Bendahara1', 'bendahara', 'Bendahara'),
(5, 'DKM', 'DKM', 'dkm', 'DKM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kas_masjid`
--
ALTER TABLE `kas_masjid`
  ADD PRIMARY KEY (`id_km`);

--
-- Indexes for table `kas_sosial`
--
ALTER TABLE `kas_sosial`
  ADD PRIMARY KEY (`id_ks`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kas_masjid`
--
ALTER TABLE `kas_masjid`
  MODIFY `id_km` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kas_sosial`
--
ALTER TABLE `kas_sosial`
  MODIFY `id_ks` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
