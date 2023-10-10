-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Okt 2023 pada 05.06
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `jam_buka` time NOT NULL,
  `jam_tutup` time NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `company`
--

INSERT INTO `company` (`id`, `nama`, `lokasi`, `jam_buka`, `jam_tutup`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'PT.Juragan Jengkol Indonesia jaya', '-4327846821632dbes8932-43243243', '00:00:00', '00:00:00', 1, '2023-09-29 07:14:37', '2023-09-29 07:36:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `nip` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tmp_tgl_lahir` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` int(11) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`id`, `uuid`, `nip`, `nama`, `tmp_tgl_lahir`, `jenis_kelamin`, `alamat`, `no_hp`, `jabatan`, `image`, `url`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'd49c15b6-53d3-420c-a4d1-5755d49afb9d', 6453656, 'dedi', 'garut, 04 desember 2005', 'pria', 'garut selatan well', 864562536, 'dewa lautan', '46c35b21121e55d43c0b4b1ca261fc4f.jpg', 'http://localhost:5000/images/46c35b21121e55d43c0b4b1ca261fc4f.jpg', 2, '2023-09-26 16:08:15', '2023-09-26 16:08:15'),
(2, '4472af2d-494c-4291-8b99-4716f88ec351', 454543263, 'asep', 'garut, 04 desember 2005', 'pria', 'garut selatan kidul kaler wetan danau toba', 864562536, 'boss muda', '5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 'http://localhost:5000/images/5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 3, '2023-09-27 07:30:43', '2023-09-27 07:30:43'),
(5, 'be99c5ba-03a9-4a56-ac3b-091a8f866211', 454543263, 'azriel shidiq', 'bandung, 04 desember 2005', 'pria', 'garut selatan kidul kaler wetan danau toba', 2147483647, 'boss muda', '5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 'http://localhost:5000/images/5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 8, '2023-09-29 08:02:18', '2023-09-29 08:02:18'),
(6, '974cf868-04c7-4a4e-b8f0-00c033980c18', 696969, 'lukman', 'bandung, 04 oktober2005', 'pria', 'kdmfkfmmewkfselatan kidul kaler wetan danau toba', 84342344, 'swepper', '5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 'http://localhost:5000/images/5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 9, '2023-10-02 06:46:14', '2023-10-02 06:46:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `information`
--

CREATE TABLE `information` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `tgl_keterangan` date DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `alasan` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `information`
--

INSERT INTO `information` (`id`, `userId`, `tgl_keterangan`, `keterangan`, `alasan`, `image`, `url`, `createdAt`, `updatedAt`) VALUES
(1, 8, '2023-10-24', 'izin', 'pengen main epep', '6b7fc010cbaab3e13b1bae5d55a1e61e.png', 'http://localhost:5000/images/6b7fc010cbaab3e13b1bae5d55a1e61e.png', '2023-09-30 06:29:40', '2023-09-30 06:29:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `position`
--

INSERT INTO `position` (`id`, `jabatan`, `createdAt`, `updatedAt`) VALUES
(3, 'manager', '2023-09-29 04:37:47', '2023-09-29 06:24:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `presence`
--

CREATE TABLE `presence` (
  `id` int(11) NOT NULL,
  `tgl_absen` date DEFAULT NULL,
  `masuk` time DEFAULT NULL,
  `pulang` time DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `presence`
--

INSERT INTO `presence` (`id`, `tgl_absen`, `masuk`, `pulang`, `image`, `url`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, '2023-09-30', '08:20:00', '20:40:00', '5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 'http://localhost:5000/images/5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 3, '2023-09-29 16:48:26', '2023-09-29 18:09:36'),
(2, '2023-09-30', '08:40:00', '17:00:00', '5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 'http://localhost:5000/images/5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 3, '2023-09-29 16:51:55', '2023-09-29 17:28:04'),
(3, '2023-10-01', '08:10:00', '15:00:00', '5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 'http://localhost:5000/images/5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 3, '2023-09-29 17:28:47', '2023-09-29 17:29:45'),
(4, '2023-10-01', '08:35:00', '18:40:50', '5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 'http://localhost:5000/images/5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 2, '2023-09-29 17:37:32', '2023-09-30 03:22:22'),
(6, '2023-10-02', '08:55:00', '18:40:59', '5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 'http://localhost:5000/images/5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 2, '2023-09-29 18:12:56', '2023-09-30 05:59:36'),
(7, '2023-10-03', '09:55:00', '17:40:59', '5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 'http://localhost:5000/images/5c2fa5cf78b50b0c05eadbc5f1d86b95.jpg', 8, '2023-09-30 06:04:28', '2023-09-30 06:05:14'),
(8, '2023-10-04', '07:55:00', '16:40:59', '8b50bf5bafd4be60b99510f55858df89.jpg', 'http://localhost:5000/images/8b50bf5bafd4be60b99510f55858df89.jpg', 8, '2023-09-30 06:07:36', '2023-09-30 06:08:49'),
(9, '2023-10-02', '07:55:00', '16:40:59', '8b50bf5bafd4be60b99510f55858df89.jpg', 'http://localhost:5000/images/8b50bf5bafd4be60b99510f55858df89.jpg', 9, '2023-10-02 06:49:30', '2023-10-02 06:50:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('-N74btMlxS1y0OTLKG2ua2qxSHJGv7qr', '2023-10-10 07:52:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:52:59', '2023-10-09 07:52:59'),
('0cOgu33MQupDVOOHT4VvzycLMqoLne9W', '2023-10-10 07:53:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:53:11', '2023-10-09 07:53:11'),
('0HBBk_OKjFlLUnBog1GEFGQesa8BjWIL', '2023-10-10 07:24:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:24:08', '2023-10-09 07:24:08'),
('0yY22uqfLjIe4Yv3jaF68C8QXzf4j0Ey', '2023-10-10 07:14:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:14:24', '2023-10-09 07:14:24'),
('1FaJAOWMBa2-b418vjSqmZ5DD9HYWNIW', '2023-10-10 07:52:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:52:23', '2023-10-09 07:52:23'),
('2lKdKzAimRl5477BWa5LEERFTTb8fAN5', '2023-10-10 06:15:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:15:05', '2023-10-09 06:15:05'),
('2qOkZDd5yqasTQICBkWCwu0ZDV6CnIMK', '2023-10-10 06:21:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:21:00', '2023-10-09 06:21:00'),
('2Y6NX8lNis0gsFHg873rF8Gnxz1twNMv', '2023-10-10 04:35:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:35:19', '2023-10-09 04:35:19'),
('3TLKzM3o9aHUSXRQBBNhwKEpUEYUUD0e', '2023-10-10 04:24:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:24:54', '2023-10-09 04:24:54'),
('4bbm7K6NfbjMiSBtopnQqin11HbscFA3', '2023-10-10 08:11:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:11:56', '2023-10-09 08:11:56'),
('4O9QuiUYORtVxuNsthUn8d0Qv9981Ycy', '2023-10-10 08:00:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:00:49', '2023-10-09 08:00:49'),
('4xYZEi--0X5bDIyI2VnY9-igpJMuNM62', '2023-10-10 08:03:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:03:42', '2023-10-09 08:03:42'),
('5sdVVWhGMqVuUkAE4UcUTcj5upicyXIz', '2023-10-10 08:07:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:07:30', '2023-10-09 08:07:30'),
('6G4FG__8ebpGtRau4ouzmf93k-4E67rD', '2023-10-10 08:00:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:00:56', '2023-10-09 08:00:56'),
('8l8kGAubpDQXQkm4BPicHToNIT8JPKrw', '2023-10-10 06:36:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:36:55', '2023-10-09 06:36:55'),
('8Tll8RaOBMNfpn0ga74XBiC2QmYypfVL', '2023-10-10 04:37:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:37:16', '2023-10-09 04:37:16'),
('92GaTTyoUEU_sVj2U_hEevVquNj406nK', '2023-10-10 04:25:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:25:30', '2023-10-09 04:25:30'),
('AjaUplhwype4FwayuRkOVrky42B6EUgV', '2023-10-10 06:15:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:15:57', '2023-10-09 06:15:57'),
('Ak2GKB2kk5fBT4pfwGpHFe2GDJmQNTpm', '2023-10-10 06:33:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:33:04', '2023-10-09 06:33:04'),
('amTU_g5tqwFyfx3XgunFp4op7eBFYOYI', '2023-10-10 07:48:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:48:38', '2023-10-09 07:48:38'),
('asHKGAekOZz_XW3YmtIVHeT7kuW_ITOB', '2023-10-10 04:29:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:29:42', '2023-10-09 04:29:42'),
('bINSNyA5jFV2CpxNwR-q47M4BaD7nE6v', '2023-10-10 06:36:37', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:36:37', '2023-10-09 06:36:37'),
('BmW-BGBg29MNokq4vIlxwA6Zla0pNLun', '2023-10-10 06:32:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:32:18', '2023-10-09 06:32:18'),
('BPIb2Rf71kuiAQpbx1LyHBjM2fFhJhH8', '2023-10-10 06:22:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:22:36', '2023-10-09 06:22:36'),
('BvgGeSY0vTNHDFm_G7ohRql5NxHembAs', '2023-10-10 08:01:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:01:27', '2023-10-09 08:01:27'),
('BX5lqWsTaKR0ZrEYfHT0EavmG3rO-XRk', '2023-10-10 04:43:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:43:54', '2023-10-09 04:43:54'),
('C2Xhv24LyMebPcnJZ41oBLJvSXijR2K9', '2023-10-10 04:45:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:45:21', '2023-10-09 04:45:21'),
('c6U2X8Gkd_Aw3nXSpWG0_IwdZfvhaY0I', '2023-10-10 07:21:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:21:38', '2023-10-09 07:21:38'),
('CcquZi_PHhohQmklEM_3a6-oYsBWWkIs', '2023-10-10 07:26:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:26:33', '2023-10-09 07:26:33'),
('CfeykBceFDDUYWLNZndzskBGC65BYr0L', '2023-10-10 07:48:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:48:04', '2023-10-09 07:48:04'),
('CFFEvVJBwrMfhAITqp6TsSr8viCzS3Px', '2023-10-10 06:15:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:15:24', '2023-10-09 06:15:24'),
('CFOtRuxQGv_GtR_9xv5-HM-nV9qkdC5T', '2023-10-10 07:20:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:20:35', '2023-10-09 07:20:35'),
('dqzeQzLwrXP9sPXI_QiNblwui8xXUwU4', '2023-10-10 07:48:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:48:10', '2023-10-09 07:48:10'),
('eIaljlh3r162l4zz6ircuEi0a014UVXP', '2023-10-10 04:25:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:25:56', '2023-10-09 04:25:56'),
('F2yaqX9f5mLGWfEgN33KGWx_tQAIURXq', '2023-10-10 07:58:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:58:05', '2023-10-09 07:58:05'),
('FIv861so6JRkzCfFS7R17hQVsOpGLvbP', '2023-10-10 08:17:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:17:54', '2023-10-09 08:17:54'),
('FleoJR9XPf2fnQWWj8jEtxPfAMeuaBv_', '2023-10-10 04:23:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:23:07', '2023-10-09 04:23:07'),
('fzM83LgO8cUZcAcf6hapbzUifjRDHxfq', '2023-10-10 06:32:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:32:51', '2023-10-09 06:32:51'),
('G0-qFteOBxoFYHHYM99iQ0BW372XUXvF', '2023-10-10 06:37:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:37:11', '2023-10-09 06:37:11'),
('GbaudQGoOpYb0Dk9-ZjCMn-hJIB5A8qw', '2023-10-10 07:23:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:23:18', '2023-10-09 07:23:18'),
('GDGXpwIYyoUft2GfS-44gmRUtE_F1FCP', '2023-10-10 08:20:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:20:16', '2023-10-09 08:20:16'),
('gXtURz42VqjJynqNJOnDiNffIZdEwsf1', '2023-10-10 06:22:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:22:56', '2023-10-09 06:22:56'),
('hFR1d8cyYtmVpPMnoo6b8e-bOrsN9sQn', '2023-10-10 08:12:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:12:04', '2023-10-09 08:12:04'),
('IIcFPymJqU3ryUPsB2FtdLensx-Hy9s4', '2023-10-10 04:31:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:31:50', '2023-10-09 04:31:50'),
('iNIPmVJZGbDYZMbfrR6Hat6jtIpm_4oT', '2023-10-10 04:34:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:34:51', '2023-10-09 04:34:51'),
('ix6OfDCj51LNY-HSVukmY9KdsL_FKOqT', '2023-10-10 08:04:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:04:24', '2023-10-09 08:04:24'),
('jiodd3JKkC0qA_brUxUfAfM-o9HAkls2', '2023-10-10 06:15:14', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:15:14', '2023-10-09 06:15:14'),
('jo9bQY7-8LeNRDtL377TdpEgm8WjMrRg', '2023-10-10 07:51:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:51:36', '2023-10-09 07:51:36'),
('K-6rhFNrNH7SeUtbUjCR9azIEwwobyer', '2023-10-10 04:43:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:43:24', '2023-10-09 04:43:24'),
('L0kdr06qgTKHW0EuGew-pvJYkJ6tXszq', '2023-10-10 07:53:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:53:06', '2023-10-09 07:53:06'),
('ll-qyqZK3FUTTiglgJzrRquiTZXsjdns', '2023-10-10 07:59:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:59:16', '2023-10-09 07:59:16'),
('lstKyy8eCyRvOhDhyGeMcRzk9bpXezQa', '2023-10-10 04:42:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:42:03', '2023-10-09 04:42:03'),
('lV2c89DAPbL8cq13Za6EwQZXj7_Plxh5', '2023-10-10 06:40:53', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:40:53', '2023-10-09 06:40:53'),
('N3bLD-d18GuKhjJEX567TE9PZ5oc3CvA', '2023-10-10 07:52:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:52:28', '2023-10-09 07:52:28'),
('NhI9_yexZiJOuociKUO29C-ALh1IPb3f', '2023-10-10 04:43:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:43:44', '2023-10-09 04:43:44'),
('O0I30ET-c2VIdoem9ATGA3Lw_yQd7hkH', '2023-10-10 07:52:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:52:54', '2023-10-09 07:52:54'),
('oH5kqlnj7AAYaaV3AMoMPAZ_zEI-4M9U', '2023-10-10 08:02:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:02:13', '2023-10-09 08:02:13'),
('P-5NWBje80B0n2gl2Xwt-EryDus5N94Y', '2023-10-10 07:48:34', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:48:34', '2023-10-09 07:48:34'),
('q3J8Yz6LfSuclXpHm4ScSCAMCrSgTKWb', '2023-10-10 07:53:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:53:36', '2023-10-09 07:53:36'),
('QAaorbiLXKW8nUcU1Nd93hcFyr2zQSEg', '2023-10-10 07:58:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:58:28', '2023-10-09 07:58:28'),
('qdv6dH3mdoxGiVUwC0zSYeoroKbywPiZ', '2023-10-10 07:17:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"379007ed-2040-440c-bb5a-9aade648b3ed\"}', '2023-10-09 07:17:31', '2023-10-09 07:17:31'),
('qMZyTjmz3dL011YbUST-0rMSReU-VyK5', '2023-10-10 04:44:34', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:44:34', '2023-10-09 04:44:34'),
('qx_725LzR48EneBpCb6kjMl30U0nJJMX', '2023-10-10 08:20:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:20:27', '2023-10-09 08:20:27'),
('r9OIGwW1DWxjGB1TSq1n5yudodBb83D1', '2023-10-10 08:03:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:03:28', '2023-10-09 08:03:28'),
('rgHbCPrbqTb7ociMi90ofFSyjsQgZN3N', '2023-10-10 06:21:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:21:28', '2023-10-09 06:21:28'),
('rqqxywgxj7l9C-v22c1caB2SsGLVge7J', '2023-10-10 08:01:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:01:22', '2023-10-09 08:01:22'),
('RT7kx__aGPLeCuYDksJrrbEoYWQ6EmI5', '2023-10-10 08:17:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"ce252fcc-2bbf-4a5e-a4ff-6bdc8d4af510\"}', '2023-10-09 08:17:54', '2023-10-09 08:17:54'),
('sKlqlAK3pEdeHXcPnHWbm3ZQLHJAKtRy', '2023-10-10 06:35:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"379007ed-2040-440c-bb5a-9aade648b3ed\"}', '2023-10-09 06:33:04', '2023-10-09 06:35:58'),
('SL8uHiUwLhrUM0O3myROl-paWQy4-dG1', '2023-10-10 06:06:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:06:30', '2023-10-09 06:06:30'),
('Sp9eA_OQskxWzQac8-nC-32ztVSJMA52', '2023-10-10 06:09:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:09:27', '2023-10-09 06:09:27'),
('tckEsUlQDHUeN4fNBhav3YHO-9ea2URN', '2023-10-10 04:29:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:29:02', '2023-10-09 04:29:02'),
('txCcOruLEGCc_9YWdiW_XNStl51vCFsd', '2023-10-10 07:26:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:26:45', '2023-10-09 07:26:45'),
('U2KG-tIDAEftg6GspfS6WQZGZfUAiKIr', '2023-10-10 07:52:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:52:07', '2023-10-09 07:52:07'),
('ukkV6lgOzoN6ypeKcyA2dUm0CCmgGxp9', '2023-10-10 07:59:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:59:21', '2023-10-09 07:59:21'),
('uPU-WNWonJ_jAARDJMm1S0FuLHhxPvsL', '2023-10-10 08:17:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:17:45', '2023-10-09 08:17:45'),
('UpWrueOoVq3kaTtbsSlJsxWa9-dVO_DR', '2023-10-10 08:02:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:02:21', '2023-10-09 08:02:21'),
('vnqziKFCwNngB3gy6lmfAksLPJsUixmt', '2023-10-10 04:29:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:29:26', '2023-10-09 04:29:26'),
('vXjh6-pwk3v5nzDkROkPkmDxAbW8wEPw', '2023-10-10 04:36:37', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:36:37', '2023-10-09 04:36:37'),
('W0fjufybKoZ4xcsTpqQyGtuvvHQ7_z-C', '2023-10-10 07:14:34', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:14:34', '2023-10-09 07:14:34'),
('wQ4IbCjdrJTLeP1CdFEkuTzdveVCSJ5J', '2023-10-10 06:09:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:09:18', '2023-10-09 06:09:18'),
('wqiX4kBaavvHWWorUIY7rTi1DWJF05Ox', '2023-10-10 07:39:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:39:35', '2023-10-09 07:39:35'),
('XcYEgX8TZ2nB9O98Lp74gMaXkDYoiiYK', '2023-10-10 07:15:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:15:27', '2023-10-09 07:15:27'),
('y3zzS5L7TVDP75CjkrFmJ4PLe1lRlkga', '2023-10-10 06:40:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:40:47', '2023-10-09 06:40:47'),
('YHsyAgFZH3q4xwvxnLcSdlvDxv1-3o9O', '2023-10-10 06:36:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:36:27', '2023-10-09 06:36:27'),
('YNV55b6OuuwRHgtSoSPlTE2gqtvFVn_Y', '2023-10-10 07:50:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 07:50:44', '2023-10-09 07:50:44'),
('yuNAgxEqFbKljsgTBoDxCg6YhPlMr8hJ', '2023-10-10 06:32:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 06:32:27', '2023-10-09 06:32:27'),
('ZGjefr4WRVhhjCOWv9e4cCw-yGMkf4M1', '2023-10-10 04:33:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:33:41', '2023-10-09 04:33:41'),
('_2Dh2gaPQ4qxr_4KobQ6_taJXT3uXtem', '2023-10-10 08:04:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 08:04:30', '2023-10-09 08:04:30'),
('_CKjran4h6h3gREvmdvAABNtKrPOfwNJ', '2023-10-10 04:32:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-10-09 04:32:58', '2023-10-09 04:32:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(1, '379007ed-2040-440c-bb5a-9aade648b3ed', 'daffafauzan', 'admin@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$vY6GCKJL6ydXOhq50AHJzA$W0qcsC7QBFE3phKGZiNMPRChOJ6vQF7Lg3T8ZTiemxU', 'admin', '2023-09-26 16:01:28', '2023-10-08 11:11:10'),
(2, 'ce252fcc-2bbf-4a5e-a4ff-6bdc8d4af510', 'usep', 'user@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Itm35u5Nk9vZ+ZkC4X46+g$MEzctBTEeE+cn9M62tRYLtUbhYRz+cCbjaiaimE3FXk', 'user', '2023-09-26 16:07:26', '2023-10-06 06:27:25'),
(3, '7a964f53-e2ea-43a9-914c-3a4b50398085', 'asep', 'asep@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$hKJm3eNRSVyXF91WSjN8Fw$BQQ5BPG7mesHiDfQz5oIAWTPa6TViati9OrXS/yV1qg', 'user', '2023-09-27 07:29:05', '2023-10-04 07:11:28'),
(8, 'b9ccc62e-c672-4c50-8166-724c9c155a39', 'Azriel shidiiq', 'Azriell@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$vSOH/1Tgxok6OT0X/p7LaQ$AUAi9QiDOZmqrs6CNgCbMMz/ypT01atZD4HpICXk2gM', 'user', '2023-09-29 08:02:18', '2023-10-02 06:09:44'),
(9, 'dd9bea23-9ad0-4071-a381-e9dfc1be3074', 'lukman', 'lukman@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$przW3ijChZq4VwBDIr9LXA$7v/Tv9zvrrirIW9OkXSPnNdssBXEh1XG6/yURZJ9pwU', 'user', '2023-10-02 06:46:14', '2023-10-02 07:55:05');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indeks untuk tabel `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indeks untuk tabel `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `presence`
--
ALTER TABLE `presence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `information`
--
ALTER TABLE `information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `presence`
--
ALTER TABLE `presence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `information`
--
ALTER TABLE `information`
  ADD CONSTRAINT `information_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `presence`
--
ALTER TABLE `presence`
  ADD CONSTRAINT `presence_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
