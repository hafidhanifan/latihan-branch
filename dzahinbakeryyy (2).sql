-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2023 at 03:12 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dzahinbakeryyy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idAdmin`, `username`, `password`, `role`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `detail_order`
--

CREATE TABLE `detail_order` (
  `idDetail` int(11) NOT NULL,
  `jumlah` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_harga` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `idFoto` int(11) NOT NULL,
  `foto_depan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `foto_atas` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `foto_samping` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idKategori` int(11) NOT NULL,
  `namaKategori` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idKategori`, `namaKategori`) VALUES
(1, 'Roti Bun'),
(2, 'Donat');

-- --------------------------------------------------------

--
-- Table structure for table `konsumen`
--

CREATE TABLE `konsumen` (
  `idKonsumen` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `namaKonsumen` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `no_telp` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alamat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `konsumen`
--

INSERT INTO `konsumen` (`idKonsumen`, `username`, `password`, `namaKonsumen`, `email`, `no_telp`, `alamat`) VALUES
(1, 'johndoe', '94727b16c2221c188d39993e39f39ac3', 'John Doe', 'johndoe@gmail.com', '083265567184', 'Jalan Nusa Indah No.2'),
(26, 'yanto', '$2y$10$OXtwgqZDFaAODu..3ylkFe9bi6Me1bkO6', 'yanto', 'yanto@gmail.com', '08763672819', 'Jalan Merbabu'),
(27, 'zzz', '$2y$10$yWZkJFrIoEXEQGsAeG8ay.k85WXEl2mUV', 'zzz', 'zzz', 'zzz', 'zzz'),
(28, 'qwe', '$2y$10$WwPLMk9Et3G2Hsm4UasFCOgC1mCDXjh8j', 'qwe', 'qwe', 'qwe', 'qwe'),
(29, 'hujan', '$2y$10$i.abeSnrZLv4Sryru6kK5e.TbZrSFUmc3', 'hujan', 'hujan', 'hujan', 'hujan'),
(30, 'hitam', '41ca8ad4ce6c678b3c5f665df556839a', 'hitam', 'hitam', 'hitam', 'hitam');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `idOrder` int(11) NOT NULL,
  `tglOrder` date NOT NULL,
  `statusPembayaran` enum('Tekah Terkonfirmasi','Belum Terkonfirmasi','','') NOT NULL,
  `statusPesanan` enum('Sedang di Proses','Sedang di Kirim','Sudah Tiba','') NOT NULL,
  `resi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idProduk` int(11) NOT NULL,
  `idKategori` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `namaProduk` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `harga` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deskripsi_produk` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stok` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idProduk`, `idKategori`, `foto`, `namaProduk`, `harga`, `deskripsi_produk`, `stok`) VALUES
(1, 1, 'cream-bun.jpg', 'Cream Bun', '10.000', 'Kue lembut dengan topping krim manis serta memiliki tekstur yang lembut dan creamy. Cocok untuk dinikmati sebagai camilan atau hidangan penutup.', 15),
(2, 2, 'donat.jpg', 'Donat Gula Halus', '8.000', 'Kudapan manis dengan perpaduan sempurna antara tekstur lembut dan empuk, serta aroma yang menggugah selera.', 15),
(3, 1, 'roti_blueberry.jpg', 'Roti Blueberry', '15.000', 'Roti bun dengan isian blueberry.', 10),
(4, 1, 'Roti_coklat_keju.jpg', 'Roti Coklat Keju', '15.000', 'Roti bun dengan isian coklat dan keju.', 10),
(5, 1, 'roti_keju.jpg', 'Roti Keju', '10.000', 'Roti bun dengan isian dan topping keju.', 10),
(6, 1, 'roti_kopi.jpg', 'Roti Kopi', '8.000', 'Roti bun dengan citarasa kopi, cocok menjadi hidangan pelengkap ketika ngopi.', 10),
(7, 1, 'roti_meses.jpg', 'Roti Meses', '10.000', 'Roti bun dengan isian meses lumer dan topping.', 15),
(8, 1, 'roti_sosis.jpg', 'Roti Sosis', '15.000', 'Roti bun dengan topping sosis dan saus, memberikan citarasa gurih.', 20);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `namaKonsumen` varchar(100) NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `no_telp` int(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `alamat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `namaKonsumen`, `email`, `no_telp`, `username`, `password`, `role`, `alamat`) VALUES
(12, 'user', 'user', 0, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user', 'user'),
(13, 'fg', 'fg', 0, 'fg', '3d4044d65abdda407a92991f1300ec97', 'user', 'fg'),
(14, 'erw', 'erw', 0, 'erw', 'a893f8f514feb300f3283947f20b253a', 'user', 'erw'),
(15, 'zxc', 'zxc', 0, 'zxc', '5fa72358f0b4fb4f2c5d7de8c9a41846', 'user', 'zxc'),
(16, 'yanto', 'yanto@gmail.com', 2147483647, 'yanto', '7849816e52e7d1596c51f3e36f21c498', 'user', 'Jalan Kasuari'),
(17, 'yanti', 'yanti@gmail.com', 986527123, 'yanti', '0bfdcd8914a53e117fda8d10954810e8', 'user', 'Jalan Kusumanegara'),
(18, 'asd', 'asd', 0, 'asd', '7815696ecbf1c96e6894b779456d330e', 'user', 'asd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `detail_order`
--
ALTER TABLE `detail_order`
  ADD PRIMARY KEY (`idDetail`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`idFoto`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idKategori`);

--
-- Indexes for table `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`idKonsumen`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`idOrder`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idProduk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `detail_order`
--
ALTER TABLE `detail_order`
  MODIFY `idDetail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `idFoto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idKategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `konsumen`
--
ALTER TABLE `konsumen`
  MODIFY `idKonsumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idProduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
