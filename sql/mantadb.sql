-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.4-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mantadb
CREATE DATABASE IF NOT EXISTS `mantadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `mantadb`;

-- Dumping structure for table mantadb.artefak
CREATE TABLE IF NOT EXISTS `artefak` (
  `no_artefak` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_kelompok` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pengumpulan` date NOT NULL,
  PRIMARY KEY (`no_artefak`),
  KEY `FK_artefak_kelompok_ta` (`no_kelompok`),
  CONSTRAINT `FK_artefak_kelompok_ta` FOREIGN KEY (`no_kelompok`) REFERENCES `kelompok_ta` (`no_kelompok`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.artefak: ~0 rows (approximately)
/*!40000 ALTER TABLE `artefak` DISABLE KEYS */;
/*!40000 ALTER TABLE `artefak` ENABLE KEYS */;

-- Dumping structure for table mantadb.baak
CREATE TABLE IF NOT EXISTS `baak` (
  `id_staff` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.baak: ~0 rows (approximately)
/*!40000 ALTER TABLE `baak` DISABLE KEYS */;
/*!40000 ALTER TABLE `baak` ENABLE KEYS */;

-- Dumping structure for table mantadb.berita_acara
CREATE TABLE IF NOT EXISTS `berita_acara` (
  `id_berita_acara` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_staff` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi_berita_acara` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_berita_acara`),
  KEY `FK__baak` (`id_staff`),
  CONSTRAINT `FK__baak` FOREIGN KEY (`id_staff`) REFERENCES `baak` (`id_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.berita_acara: ~0 rows (approximately)
/*!40000 ALTER TABLE `berita_acara` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita_acara` ENABLE KEYS */;

-- Dumping structure for table mantadb.dosen_pembimbing
CREATE TABLE IF NOT EXISTS `dosen_pembimbing` (
  `id_dosen` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.dosen_pembimbing: ~0 rows (approximately)
/*!40000 ALTER TABLE `dosen_pembimbing` DISABLE KEYS */;
/*!40000 ALTER TABLE `dosen_pembimbing` ENABLE KEYS */;

-- Dumping structure for table mantadb.dosen_penguji
CREATE TABLE IF NOT EXISTS `dosen_penguji` (
  `id_dosen` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.dosen_penguji: ~0 rows (approximately)
/*!40000 ALTER TABLE `dosen_penguji` DISABLE KEYS */;
/*!40000 ALTER TABLE `dosen_penguji` ENABLE KEYS */;

-- Dumping structure for table mantadb.jadwal
CREATE TABLE IF NOT EXISTS `jadwal` (
  `id_jadwal` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_staff` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_dosen` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `no_kelompok` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `FK__dosen_penguji` (`id_dosen`),
  KEY `FK_jadwal_kelompok_ta` (`no_kelompok`),
  KEY `FK_jadwal_baak` (`id_staff`),
  CONSTRAINT `FK__dosen_pembimbing` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_pembimbing` (`id_dosen`),
  CONSTRAINT `FK__dosen_penguji` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_penguji` (`id_dosen`),
  CONSTRAINT `FK_jadwal_baak` FOREIGN KEY (`id_staff`) REFERENCES `baak` (`id_staff`),
  CONSTRAINT `FK_jadwal_kelompok_ta` FOREIGN KEY (`no_kelompok`) REFERENCES `kelompok_ta` (`no_kelompok`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.jadwal: ~0 rows (approximately)
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;

-- Dumping structure for table mantadb.kelompok_ta
CREATE TABLE IF NOT EXISTS `kelompok_ta` (
  `no_kelompok` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NIM` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_dosen` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no_kelompok`),
  KEY `FK_kelompok_ta_mahasiswa` (`NIM`),
  KEY `FK_kelompok_ta_koordinator_ta` (`id_dosen`),
  CONSTRAINT `FK_kelompok_ta_koordinator_ta` FOREIGN KEY (`id_dosen`) REFERENCES `koordinator_ta` (`id_dosen`),
  CONSTRAINT `FK_kelompok_ta_mahasiswa` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.kelompok_ta: ~0 rows (approximately)
/*!40000 ALTER TABLE `kelompok_ta` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompok_ta` ENABLE KEYS */;

-- Dumping structure for table mantadb.koordinator_ta
CREATE TABLE IF NOT EXISTS `koordinator_ta` (
  `id_dosen` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.koordinator_ta: ~0 rows (approximately)
/*!40000 ALTER TABLE `koordinator_ta` DISABLE KEYS */;
/*!40000 ALTER TABLE `koordinator_ta` ENABLE KEYS */;

-- Dumping structure for table mantadb.mahasiswa
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `NIM` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Prodi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`NIM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.mahasiswa: ~0 rows (approximately)
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;

-- Dumping structure for table mantadb.meeting_management
CREATE TABLE IF NOT EXISTS `meeting_management` (
  `id_meeting` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_kelompok` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_dosen` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  PRIMARY KEY (`id_meeting`),
  KEY `FK_meeting_management_kelompok_ta` (`no_kelompok`),
  KEY `FK_meeting_management_dosen_pembimbing` (`id_dosen`),
  CONSTRAINT `FK_meeting_management_dosen_pembimbing` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_pembimbing` (`id_dosen`),
  CONSTRAINT `FK_meeting_management_kelompok_ta` FOREIGN KEY (`no_kelompok`) REFERENCES `kelompok_ta` (`no_kelompok`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.meeting_management: ~0 rows (approximately)
/*!40000 ALTER TABLE `meeting_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_management` ENABLE KEYS */;

-- Dumping structure for table mantadb.nilai
CREATE TABLE IF NOT EXISTS `nilai` (
  `no_kelompok` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_dosen` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nilai_sidang` float NOT NULL DEFAULT 0,
  `nilai_prasidang` float NOT NULL DEFAULT 0,
  `nilai_TA1` float NOT NULL DEFAULT 0,
  `nilai_TA2` float NOT NULL DEFAULT 0,
  `status_kelulusan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no_kelompok`),
  KEY `FK_nilai_dosen_penguji` (`id_dosen`),
  CONSTRAINT `FK_nilai_dosen_pembimbing` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_pembimbing` (`id_dosen`),
  CONSTRAINT `FK_nilai_dosen_penguji` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_penguji` (`id_dosen`),
  CONSTRAINT `FK_nilai_kelompok_ta` FOREIGN KEY (`no_kelompok`) REFERENCES `kelompok_ta` (`no_kelompok`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.nilai: ~0 rows (approximately)
/*!40000 ALTER TABLE `nilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `nilai` ENABLE KEYS */;

-- Dumping structure for table mantadb.pendaftaran
CREATE TABLE IF NOT EXISTS `pendaftaran` (
  `no_pendaftaran` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NIM` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_pendaftaran` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pendaftaran` date NOT NULL,
  PRIMARY KEY (`no_pendaftaran`),
  KEY `FK__mahasiswa` (`NIM`),
  CONSTRAINT `FK__mahasiswa` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.pendaftaran: ~0 rows (approximately)
/*!40000 ALTER TABLE `pendaftaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendaftaran` ENABLE KEYS */;

-- Dumping structure for table mantadb.topik_ta
CREATE TABLE IF NOT EXISTS `topik_ta` (
  `judul_TA` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_kelompok` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`judul_TA`),
  KEY `FK_topik_ta_kelompok_ta` (`no_kelompok`),
  CONSTRAINT `FK_topik_ta_kelompok_ta` FOREIGN KEY (`no_kelompok`) REFERENCES `kelompok_ta` (`no_kelompok`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mantadb.topik_ta: ~0 rows (approximately)
/*!40000 ALTER TABLE `topik_ta` DISABLE KEYS */;
/*!40000 ALTER TABLE `topik_ta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
