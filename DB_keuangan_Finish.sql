# ************************************************************
# Antares - SQL Client
# Version 0.7.19
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 192.168.1.99 ((Ubuntu) 8.0.35)
# Database: DB_keuangan
# Generation time: 2023-11-13T11:47:46+07:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table benpen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `benpen`;

CREATE TABLE `benpen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_ini` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `benpen_trans_id` bigint DEFAULT NULL,
  `id_kode_transaksi_penerimaan` bigint DEFAULT NULL,
  `no_kertas` int DEFAULT NULL,
  `no_bukti` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tanggal_kuitansi` date DEFAULT NULL,
  `shift` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tindakan_id` bigint DEFAULT NULL,
  `nominal_tindakan` bigint DEFAULT NULL,
  `DK` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `diskon` bigint DEFAULT NULL,
  `jumlah` bigint DEFAULT NULL,
  `harga` bigint DEFAULT NULL,
  `keterangan` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





# Dump of table benpen_trans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `benpen_trans`;

CREATE TABLE `benpen_trans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_kertas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_kuitansi` date DEFAULT NULL,
  `tunai` bigint DEFAULT NULL,
  `edc` bigint DEFAULT NULL,
  `qris` bigint DEFAULT NULL,
  `transfer` bigint DEFAULT NULL,
  `va` bigint DEFAULT NULL,
  `grandtotal` bigint DEFAULT NULL,
  `deposit` bigint DEFAULT NULL,
  `pengembalian_deposit` bigint DEFAULT NULL,
  `pengakuanbendahara` bigint DEFAULT NULL,
  `uangmuka_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table checklist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checklist`;

CREATE TABLE `checklist` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jenis_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_checklist_master` bigint unsigned DEFAULT NULL,
  `id_ppk` bigint unsigned DEFAULT NULL,
  `id_penerima` bigint unsigned DEFAULT NULL,
  `id_ppspm` bigint unsigned DEFAULT NULL,
  `id_efaktur` json DEFAULT NULL,
  `id_bast` json DEFAULT NULL,
  `id_kwitansi` bigint unsigned DEFAULT NULL,
  `id_invoice` json DEFAULT NULL,
  `id_suratjalan` json DEFAULT NULL,
  `id_monev_realisasi` bigint DEFAULT NULL,
  `nomor_checklist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terminke` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_urut` bigint DEFAULT NULL,
  `nama_pekerjaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jenis_pekerjaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_input` date DEFAULT NULL,
  `payment_by` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal_transfer` date DEFAULT NULL,
  `mulai_acc` int DEFAULT NULL COMMENT 'mulai atau tidak proses acc',
  `acc1` int DEFAULT NULL COMMENT 'persetujuan user 1',
  `acc2` int DEFAULT NULL COMMENT 'persetujuan user 2',
  `acc3` int DEFAULT NULL COMMENT 'persetujuan user 3',
  `acc4` int DEFAULT NULL COMMENT 'persetujuan user 4',
  `metode_edit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ada_spby` int DEFAULT NULL COMMENT 'Jika udah buat nilai 1, jika blm buat nilai 0 / NULL. syarat: sudah di setujui dulu.',
  `kode_billing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ntpn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ntb` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kode_jenispajak` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kode_jenissetoran` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `no_spm` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `no_sp2d` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sudah_dilengkapi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_user_id_foreign` (`user_id`),
  CONSTRAINT `checklist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table checklist_item_belanja
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checklist_item_belanja`;

CREATE TABLE `checklist_item_belanja` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_ini` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id_checklist` bigint unsigned DEFAULT NULL,
  `id_itemsrkaklakun` bigint unsigned DEFAULT NULL,
  `id_itemsrkaklitem` bigint unsigned DEFAULT NULL,
  `id_monev` bigint DEFAULT NULL,
  `id_monev_akhir` bigint DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nominal_pagu_saat_itu` bigint DEFAULT NULL,
  `nominal_belanja` bigint DEFAULT NULL,
  `nominal_terminlist` bigint DEFAULT NULL,
  `nominal_sisa_tagihan` bigint DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_item_belanja_id_checklist_foreign` (`id_checklist`),
  KEY `checklist_item_belanja_id_itemsrkaklakun_foreign` (`id_itemsrkaklakun`),
  KEY `checklist_item_belanja_id_itemsrkaklitem_foreign` (`id_itemsrkaklitem`),
  KEY `checklist_item_belanja_user_id_foreign` (`user_id`),
  CONSTRAINT `checklist_item_belanja_id_checklist_foreign` FOREIGN KEY (`id_checklist`) REFERENCES `checklist` (`id`),
  CONSTRAINT `checklist_item_belanja_id_itemsrkaklakun_foreign` FOREIGN KEY (`id_itemsrkaklakun`) REFERENCES `itemsv3rkakl` (`id`),
  CONSTRAINT `checklist_item_belanja_id_itemsrkaklitem_foreign` FOREIGN KEY (`id_itemsrkaklitem`) REFERENCES `itemsv3rkakl` (`id`),
  CONSTRAINT `checklist_item_belanja_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table checklist_item_belanja_termin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checklist_item_belanja_termin`;

CREATE TABLE `checklist_item_belanja_termin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_checklist` bigint unsigned DEFAULT NULL,
  `id_itemsrkaklakun` bigint unsigned DEFAULT NULL,
  `id_itemsrkaklitem` bigint unsigned DEFAULT NULL,
  `id_item_belanja` bigint unsigned DEFAULT NULL,
  `id_monev` bigint DEFAULT NULL,
  `id_monev_akhir` bigint DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nominal_pagu_saat_itu` bigint DEFAULT NULL,
  `nominal_belanja` bigint DEFAULT NULL,
  `nominal_sisa_tagihan` bigint DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_item_belanja_termin_id_checklist_foreign` (`id_checklist`),
  KEY `checklist_item_belanja_termin_id_itemsrkaklakun_foreign` (`id_itemsrkaklakun`),
  KEY `checklist_item_belanja_termin_id_itemsrkaklitem_foreign` (`id_itemsrkaklitem`),
  KEY `checklist_item_belanja_termin_user_id_foreign` (`user_id`),
  CONSTRAINT `checklist_item_belanja_termin_id_checklist_foreign` FOREIGN KEY (`id_checklist`) REFERENCES `checklist` (`id`),
  CONSTRAINT `checklist_item_belanja_termin_id_itemsrkaklakun_foreign` FOREIGN KEY (`id_itemsrkaklakun`) REFERENCES `itemsv3rkakl` (`id`),
  CONSTRAINT `checklist_item_belanja_termin_id_itemsrkaklitem_foreign` FOREIGN KEY (`id_itemsrkaklitem`) REFERENCES `itemsv3rkakl` (`id`),
  CONSTRAINT `checklist_item_belanja_termin_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table checklist_kontrak
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checklist_kontrak`;

CREATE TABLE `checklist_kontrak` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `identitas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'spk / kontrak',
  `nomor_kontrak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_kontrak` date DEFAULT NULL,
  `nominal_kontrak` bigint DEFAULT NULL,
  `durasi_pekerjaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `file_kontrak` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `punya_kontrak` int DEFAULT NULL,
  `is_actived` int DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_kontrak_user_id_foreign` (`user_id`),
  CONSTRAINT `checklist_kontrak_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table checklist_kwitansi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checklist_kwitansi`;

CREATE TABLE `checklist_kwitansi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nomor_kwitansi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_kwitansi` date DEFAULT NULL,
  `nominal_kwitansi` bigint DEFAULT NULL,
  `nominal_dpp` bigint DEFAULT NULL,
  `file_kwitansi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `punya_kwitansi` int DEFAULT NULL,
  `is_actived` int DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_kwitansi_user_id_foreign` (`user_id`),
  CONSTRAINT `checklist_kwitansi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table checklist_master
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checklist_master`;

CREATE TABLE `checklist_master` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_itemsrkaklakun` bigint unsigned DEFAULT NULL,
  `id_itemsrkaklitem` bigint unsigned DEFAULT NULL,
  `id_kontrak` bigint DEFAULT NULL,
  `id_monev_realisasi` bigint DEFAULT NULL,
  `nama_penyedia` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `npwp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `periode` date DEFAULT NULL,
  `metode_pembayaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal_keep` bigint unsigned DEFAULT NULL,
  `nominal_change` bigint unsigned DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_master_id_itemsrkaklakun_foreign` (`id_itemsrkaklakun`),
  KEY `checklist_master_id_itemsrkaklitem_foreign` (`id_itemsrkaklitem`),
  KEY `checklist_master_user_id_foreign` (`user_id`),
  CONSTRAINT `checklist_master_id_itemsrkaklakun_foreign` FOREIGN KEY (`id_itemsrkaklakun`) REFERENCES `itemsv3rkakl` (`id`),
  CONSTRAINT `checklist_master_id_itemsrkaklitem_foreign` FOREIGN KEY (`id_itemsrkaklitem`) REFERENCES `itemsv3rkakl` (`id`),
  CONSTRAINT `checklist_master_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table checklist_penerima
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checklist_penerima`;

CREATE TABLE `checklist_penerima` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `penerima` bigint unsigned DEFAULT NULL,
  `is_actived` int DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_penerima_penerima_foreign` (`penerima`),
  KEY `checklist_penerima_user_id_foreign` (`user_id`),
  CONSTRAINT `checklist_penerima_penerima_foreign` FOREIGN KEY (`penerima`) REFERENCES `use` (`id`),
  CONSTRAINT `checklist_penerima_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `checklist_penerima` WRITE;
/*!40000 ALTER TABLE `checklist_penerima` DISABLE KEYS */;

INSERT INTO `checklist_penerima` (`id`, `penerima`, `is_actived`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 16, 1, 1, "2022-11-16 09:27:51", NULL, NULL),
	(4, 8, 1, 12, "2022-12-07 10:58:41", "2022-12-07 10:58:41", NULL);

/*!40000 ALTER TABLE `checklist_penerima` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table checklist_ppk
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checklist_ppk`;

CREATE TABLE `checklist_ppk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jenis_ppk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ppk` bigint unsigned DEFAULT NULL,
  `is_actived` int DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_ppk_ppk_foreign` (`ppk`),
  KEY `checklist_ppk_user_id_foreign` (`user_id`),
  CONSTRAINT `checklist_ppk_ppk_foreign` FOREIGN KEY (`ppk`) REFERENCES `use` (`id`),
  CONSTRAINT `checklist_ppk_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `checklist_ppk` WRITE;
/*!40000 ALTER TABLE `checklist_ppk` DISABLE KEYS */;

INSERT INTO `checklist_ppk` (`id`, `jenis_ppk`, `ppk`, `is_actived`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, "BLU", 15, 1, 12, "2022-02-18 14:43:33", "2022-08-09 10:28:26", NULL),
	(2, "RM", 14, 1, 12, "2022-08-09 11:04:07", "2022-08-09 11:04:07", NULL);

/*!40000 ALTER TABLE `checklist_ppk` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table checklist_ppspm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checklist_ppspm`;

CREATE TABLE `checklist_ppspm` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ppspm` bigint unsigned DEFAULT NULL,
  `is_actived` int DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_ppspm_ppspm_foreign` (`ppspm`),
  KEY `checklist_ppspm_user_id_foreign` (`user_id`),
  CONSTRAINT `checklist_ppspm_ppspm_foreign` FOREIGN KEY (`ppspm`) REFERENCES `use` (`id`),
  CONSTRAINT `checklist_ppspm_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `checklist_ppspm` WRITE;
/*!40000 ALTER TABLE `checklist_ppspm` DISABLE KEYS */;

INSERT INTO `checklist_ppspm` (`id`, `ppspm`, `is_actived`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 13, 1, 12, NULL, NULL, NULL);

/*!40000 ALTER TABLE `checklist_ppspm` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table checklist_trackrecord
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checklist_trackrecord`;

CREATE TABLE `checklist_trackrecord` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_checklist` bigint unsigned DEFAULT NULL,
  `nomor_trackrecord` int DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status_berkas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_trackrecord_id_checklist_foreign` (`id_checklist`),
  KEY `checklist_trackrecord_user_id_foreign` (`user_id`),
  CONSTRAINT `checklist_trackrecord_id_checklist_foreign` FOREIGN KEY (`id_checklist`) REFERENCES `checklist` (`id`),
  CONSTRAINT `checklist_trackrecord_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table coa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coa`;

CREATE TABLE `coa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `periode_coa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_akun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_parent` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_child` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_akun` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_akun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coa_user_id_foreign` (`user_id`),
  CONSTRAINT `coa_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `coa` WRITE;
/*!40000 ALTER TABLE `coa` DISABLE KEYS */;

INSERT INTO `coa` (`id`, `periode_coa`, `level_akun`, `nomor_parent`, `nomor_child`, `nomor`, `no_akun`, `nama_akun`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, "periode1", "1", NULL, "1", "1", "1-", "Aset", 21, "2023-01-12 10:13:43", "2023-01-12 10:13:43", NULL),
	(2, "periode1", "2", "1", "1", "1.1", "1-1", "Aset Lancar", 21, "2023-01-12 10:20:20", "2023-01-12 10:20:20", NULL),
	(3, "periode1", "2", "1", "2", "1.2", "1-2", "Aset Tetap", 21, "2023-01-12 10:20:20", "2023-01-12 10:20:20", NULL),
	(5, "periode1", "3", "1.1", "1", "1.1.1", "1-11", "Kas dan Setara Kas", 21, "2023-01-12 10:27:54", "2023-01-12 10:27:54", NULL),
	(6, "periode1", "3", "1.1", "2", "1.1.2", "1-12", "Investasi Jangka Pendek", 21, "2023-01-12 10:27:54", "2023-01-12 10:27:54", NULL),
	(8, "periode1", "3", "1.1", "5", "1.1.5", "1-15", "Piutang Usaha Lainnya", 21, "2023-01-12 10:27:54", "2023-01-12 10:27:54", NULL),
	(9, "periode1", "3", "1.1", "6", "1.1.6", "1-16", "Piutang Lainnya", 21, "2023-01-12 10:27:54", "2023-01-12 10:27:54", NULL),
	(10, "periode1", "3", "1.1", "7", "1.1.7", "1-17", "Barang Persediaan", 21, "2023-01-12 10:27:54", "2023-01-12 10:27:54", NULL),
	(11, "periode1", "3", "1.1", "8", "1.1.8", "1-18", "Biaya dibayar dimuka", 21, "2023-01-12 10:27:55", "2023-01-12 10:27:55", NULL),
	(12, "periode1", "4", "1.1.1", "1", "1.1.1.1", "1-111", "Kas pada Bendahara Pengeluaran", 21, "2023-01-12 10:34:24", "2023-01-12 10:34:24", NULL),
	(13, "periode1", "4", "1.1.1", "2", "1.1.1.2", "1-112", "Kas Lainnya dan Setara Kas", 21, "2023-01-12 10:34:24", "2023-01-12 10:34:24", NULL),
	(14, "periode1", "4", "1.1.1", "4", "1.1.1.4", "1-114", "Kas pada Badan Layanan Umum", 21, "2023-01-12 10:34:24", "2023-01-12 10:34:24", NULL),
	(15, "periode1", "4", "1.1.1", "5", "1.1.1.5", "1-115", "Rencana Pengembalian Kas", 21, "2023-01-12 10:34:25", "2023-01-12 10:34:25", NULL),
	(18, "periode1", "5", "1.1.1.1", "3", "1.1.1.1.3", "1-1113", "Kas Bank", 21, "2023-01-12 10:42:33", "2023-01-12 10:42:33", NULL),
	(19, "periode1", "5", "1.1.1.1", "4", "1.1.1.1.4", "1-1114", "Kas Lainya di Bendahara Pengeluaran", 21, "2023-01-12 10:42:33", "2023-01-12 10:42:33", NULL),
	(21, "periode1", "3", "1.2", "1", "1.2.1", "1-21", "Tanah", 21, "2023-01-12 11:00:44", "2023-01-12 11:00:44", NULL),
	(22, "periode1", "3", "1.2", "2", "1.2.2", "1-22", "Peralatan dan Mesin", 21, "2023-01-12 11:00:44", "2023-01-12 11:00:44", NULL),
	(23, "periode1", "3", "1.2", "3", "1.2.3", "1-23", "Gedung dan Bangunan", 21, "2023-01-12 11:00:44", "2023-01-12 11:00:44", NULL),
	(24, "periode1", "3", "1.2", "4", "1.2.4", "1-24", "Jalan, Irigasi dan Jaringan", 21, "2023-01-12 11:00:44", "2023-01-12 11:00:44", NULL),
	(25, "periode1", "3", "1.2", "5", "1.2.5", "1-25", "Aset Tetap Lainnya", 21, "2023-01-12 11:00:44", "2023-01-12 11:00:44", NULL),
	(26, "periode1", "3", "1.2", "6", "1.2.6", "1-26", "Konstruksi dalam pengerjaan", 21, "2023-01-12 11:00:44", "2023-01-12 11:00:44", NULL),
	(27, "periode1", "3", "1.2", "7", "1.2.7", "1-27", "Akumulasi Penyusutan Aset Tetap", 21, "2023-01-12 11:00:44", "2023-01-12 11:00:44", NULL),
	(28, "periode1", "4", "1.2.1", "1", "1.2.1.1", "1-211", "Pengadaan Tanah", 21, "2023-01-12 11:03:16", "2023-01-12 11:03:16", NULL),
	(29, "periode1", "4", "1.2.1", "2", "1.2.1.2", "1-212", "Tanah Hasil Revaluasi", 21, "2023-01-12 11:03:16", "2023-01-12 11:03:16", NULL),
	(30, "periode1", "4", "1.2.2", "1", "1.2.2.1", "1-221", "Pengadaan Peralatan dan Mesin", 21, "2023-01-12 11:09:57", "2023-01-12 11:09:57", NULL),
	(31, "periode1", "4", "1.2.2", "2", "1.2.2.2", "1-222", "Hibah Peralatan dan Mesin", 21, "2023-01-12 11:09:57", "2023-01-12 11:09:57", NULL),
	(32, "periode1", "4", "1.2.2", "3", "1.2.2.3", "1-223", "Transfer Masuk Peralatan dan Mesin", 21, "2023-01-12 11:09:57", "2023-01-12 11:09:57", NULL),
	(33, "periode1", "4", "1.2.2", "4", "1.2.2.4", "1-224", "Transfer Keluar Peralatan dan Mesin", 21, "2023-01-12 11:09:57", "2023-01-12 11:09:57", NULL),
	(34, "periode1", "4", "1.2.2", "5", "1.2.2.5", "1-225", "Peralatan dan Mesin hasil Revaluasi", 21, "2023-01-12 11:09:57", "2023-01-12 11:09:57", NULL),
	(35, "periode1", "4", "1.2.3", "1", "1.2.3.1", "1-231", "Pengadaan Gedung dan Bangunan", 21, "2023-01-12 11:12:44", "2023-01-12 11:12:44", NULL),
	(36, "periode1", "4", "1.2.3", "2", "1.2.3.2", "1-232", "Hibah Gedung dan Bangunan", 21, "2023-01-12 11:12:44", "2023-01-12 11:12:44", NULL),
	(37, "periode1", "4", "1.2.3", "3", "1.2.3.3", "1-233", "Gedung dan Bangunan Hasil Revaluasi", 21, "2023-01-12 11:12:44", "2023-01-12 11:12:44", NULL),
	(38, "periode1", "4", "1.2.4", "1", "1.2.4.1", "1-241", "Pengadaan Jalan, Irigasi dan Jaringan", 21, "2023-01-12 11:13:44", "2023-01-12 11:13:44", NULL),
	(39, "periode1", "4", "1.2.4", "2", "1.2.4.2", "1-242", "Jalan, Irigasi dan Jaringan hasil revaluasi", 21, "2023-01-12 11:13:44", "2023-01-12 11:13:44", NULL),
	(40, "periode1", "4", "1.2.5", "1", "1.2.5.1", "1-251", "Pengadaan Aset Tetap Lainnya", 21, "2023-01-12 11:15:09", "2023-01-12 11:15:09", NULL),
	(41, "periode1", "4", "1.2.5", "2", "1.2.5.2", "1-252", "Hibah Aset Tetap Lainnya", 21, "2023-01-12 11:15:09", "2023-01-12 11:15:09", NULL),
	(42, "periode1", "4", "1.2.5", "3", "1.2.5.3", "1-253", "Transfer Masuk Aset Tetap Lainnya", 21, "2023-01-12 11:15:10", "2023-01-12 11:15:10", NULL),
	(43, "periode1", "4", "1.2.5", "4", "1.2.5.4", "1-254", "Aset Tetap Lainnya hasil revaluasi", 21, "2023-01-12 11:15:10", "2023-01-12 11:15:10", NULL),
	(47, "periode1", "3", "1.3", "1", "1.3.1", "1-31", "Aset Kerjasama Operasi", 21, "2023-01-12 12:54:44", "2023-01-12 12:54:44", NULL),
	(48, "periode1", "3", "1.3", "2", "1.3.2", "1-32", "Aset Sewa Guna Usaha", 21, "2023-01-12 12:54:44", "2023-01-12 12:54:44", NULL),
	(49, "periode1", "3", "1.3", "3", "1.3.3", "1-33", "Aset Tak Berwujud", 21, "2023-01-12 12:54:44", "2023-01-12 12:54:44", NULL),
	(50, "periode1", "3", "1.3", "4", "1.3.4", "1-34", "Aset yang tidak digunakan dalam operasi Pemerintahan", 21, "2023-01-12 12:54:44", "2023-01-12 12:54:44", NULL),
	(51, "periode1", "3", "1.3", "5", "1.3.5", "1-35", "Akumulasi Amortisasi & Penyusutan Aset Lainnya", 21, "2023-01-12 12:54:44", "2023-01-12 12:54:44", NULL),
	(58, "periode1", "4", "1.3.4", "1", "1.3.4.1", "1-341", "Persediaan Kadaluarsa", 21, "2023-01-12 13:10:33", "2023-01-12 13:10:33", NULL),
	(59, "periode1", "4", "1.3.4", "2", "1.3.4.2", "1-342", "Peralatan dan Mesin yang tidak digunakan", 21, "2023-01-12 13:10:33", "2023-01-12 13:10:33", NULL),
	(60, "periode1", "4", "1.3.4", "3", "1.3.4.3", "1-343", "Aset Tak Berwujud yang tidak digunakan", 21, "2023-01-12 13:10:33", "2023-01-12 13:10:33", NULL),
	(61, "periode1", "4", "1.3.5", "1", "1.3.5.1", "1-351", "Akumulasi Amortisasi Aset Tak Berwujud", 21, "2023-01-12 13:15:56", "2023-01-12 13:15:56", NULL),
	(62, "periode1", "4", "1.3.5", "2", "1.3.5.2", "1-352", "Akumulasi Penyusutan Aset Yang Tidak Digunakan", 21, "2023-01-12 13:15:56", "2023-01-12 13:15:56", NULL),
	(63, "periode1", "4", "1.3.5", "3", "1.3.5.3", "1-353", "Akumulasi Penyusutan Lisensi", 21, "2023-01-12 13:15:56", "2023-01-12 13:15:56", NULL),
	(64, "periode1", "4", "1.1.8", "1", "1.1.8.1", "1-181", "Uang Muka Kerja Belanja Barang", 21, "2023-01-12 13:17:29", "2023-01-12 13:17:29", NULL),
	(65, "periode1", "4", "1.1.8", "2", "1.1.8.2", "1-182", "Uang Muka Kerja Belanja Jasa", 21, "2023-01-12 13:17:29", "2023-01-12 13:17:29", NULL),
	(66, "periode1", "4", "1.1.8", "3", "1.1.8.3", "1-183", "Uang Muka Kerja Belanja Modal", 21, "2023-01-12 13:17:29", "2023-01-12 13:17:29", NULL),
	(67, "periode1", "4", "1.1.8", "4", "1.1.8.4", "1-184", "Sewa dibayar dimuka", 21, "2023-01-12 13:17:29", "2023-01-12 13:17:29", NULL),
	(68, "periode1", "4", "1.1.8", "9", "1.1.8.9", "1-189", "Biaya lainnya dibayar dimuka", 21, "2023-01-12 13:17:29", "2023-01-12 13:17:29", NULL),
	(69, "periode1", "5", "1.1.1.2", "1", "1.1.1.2.1", "1-1121", "Diterima Uang Muka Pasien", 21, "2023-01-12 13:20:36", "2023-01-12 13:20:36", NULL),
	(70, "periode1", "5", "1.1.1.2", "2", "1.1.1.2.2", "1-1122", "BRI Cab. Jelambar (000610)", 21, "2023-01-12 13:20:36", "2023-01-12 13:20:36", NULL),
	(71, "periode1", "5", "1.1.1.2", "3", "1.1.1.2.3", "1-1123", "BRI Cab. Jelambar (000788)", 21, "2023-01-12 13:20:36", "2023-01-12 13:20:36", NULL),
	(73, "periode1", "5", "1.1.1.2", "2", "1.1.1.2.2", "1-1122", "Diterima Pendapatan Dimuka", 21, "2023-01-12 13:24:03", "2023-01-12 13:24:03", NULL),
	(74, "periode1", "5", "1.1.1.2", "3", "1.1.1.2.3", "1-1123", "Diterima Dana Titipan", 21, "2023-01-12 13:24:03", "2023-01-12 13:24:03", NULL),
	(75, "periode1", "5", "1.1.1.1", "1", "1.1.1.1.1", "1-1111", "Kas Rupiah Murni di Bendahara Pengeluaran", 21, "2023-01-12 13:27:26", "2023-01-12 13:27:26", NULL),
	(78, "periode1", "5", "1.1.1.4", "1", "1.1.1.4.1", "1-1141", "Kas Tunai di Bendahara", 21, "2023-01-12 13:33:09", "2023-01-12 13:33:09", NULL),
	(79, "periode1", "5", "1.1.1.4", "2", "1.1.1.4.2", "1-1142", "Kas Bank", 21, "2023-01-12 13:33:09", "2023-01-12 13:33:09", NULL),
	(80, "periode1", "5", "1.1.1.4", "3", "1.1.1.4.3", "1-1143", "Kas Lainya di Bendahara Penerimaan", 21, "2023-01-12 13:33:09", "2023-01-12 13:33:09", NULL),
	(82, "periode1", "5", "1.1.1.4", "2", "1.1.1.4.2", "1-1142", "Kas PNBP di Bendahara Pengeluaran", 21, "2023-01-12 13:39:11", "2023-01-12 13:39:11", NULL),
	(83, "periode1", "5", "1.1.1.4", "3", "1.1.1.4.3", "1-1143", "Uang Tunai di Bendahara Penerimaan", 21, "2023-01-12 13:39:11", "2023-01-12 13:39:11", NULL),
	(85, "periode1", "5", "1.1.1.4", "2", "1.1.1.4.2", "1-1142", "BRI Cab. Jelambar (000021)", 21, "2023-01-12 13:50:04", "2023-01-12 13:50:04", NULL),
	(86, "periode1", "5", "1.1.1.4", "3", "1.1.1.4.3", "1-1143", "BTN", 21, "2023-01-12 13:50:04", "2023-01-12 13:50:04", NULL),
	(87, "periode1", "5", "1.1.1.4", "4", "1.1.1.4.4", "1-1144", "BNI", 21, "2023-01-12 13:50:04", "2023-01-12 13:50:04", NULL),
	(88, "periode1", "5", "1.1.1.4", "5", "1.1.1.4.5", "1-1145", "Mandiri (117-00-1018814-2)", 21, "2023-01-12 13:50:04", "2023-01-12 13:50:04", NULL),
	(89, "periode1", "5", "1.1.1.4", "6", "1.1.1.4.6", "1-1146", "Deposito (Berjangka < 6 bulan)", 21, "2023-01-12 13:50:04", "2023-01-12 13:50:04", NULL),
	(90, "periode1", "5", "1.1.1.4", "7", "1.1.1.4.7", "1-1147", "BRIVA (653134154541000)  BLU", 21, "2023-01-12 13:50:04", "2023-01-12 13:50:04", NULL),
	(91, "periode1", "4", "1.1.2", "1", "1.1.2.1", "1-121", "Deposito (Berjangka 6 s.d 12 bulan)", 21, "2023-01-12 13:51:17", "2023-01-12 13:51:17", NULL),
	(92, "periode1", "4", "1.1.2", "9", "1.1.2.9", "1-129", "Penanaman Dana Lainnya", 21, "2023-01-12 13:51:17", "2023-01-12 13:51:17", NULL),
	(99, "periode1", "4", "1.1.1", "2", "1.1.1.2", "1-112", "Investasi Jangka Pendek", 21, "2023-01-12 14:01:54", "2023-01-17 14:52:03", "2023-01-17 14:52:03"),
	(101, "periode1", "4", "1.1.1", "5", "1.1.1.5", "1-115", "Piutang Usaha Lainnya", 21, "2023-01-12 14:01:54", "2023-01-12 14:01:54", NULL),
	(108, "periode1", "4", "1.1.7", "1", "1.1.7.1", "1-171", "Barang Konsumsi", 21, "2023-01-12 14:10:15", "2023-01-12 14:10:15", NULL),
	(109, "periode1", "4", "1.1.7", "2", "1.1.7.2", "1-172", "Bahan untuk Pemeliharaan", 21, "2023-01-12 14:10:15", "2023-01-12 14:10:15", NULL),
	(110, "periode1", "4", "1.1.7", "3", "1.1.7.3", "1-173", "Bahan Baku", 21, "2023-01-12 14:10:15", "2023-01-12 14:10:15", NULL),
	(111, "periode1", "4", "1.1.7", "4", "1.1.7.4", "1-174", "Suku Cadang", 21, "2023-01-12 14:10:15", "2023-01-12 14:10:15", NULL),
	(112, "periode1", "4", "1.1.7", "5", "1.1.7.5", "1-175", "Persediaan Lainnya", 21, "2023-01-12 14:10:15", "2023-01-12 14:10:15", NULL),
	(113, "periode1", "4", "1.1.7", "6", "1.1.7.6", "1-176", "Persediaan dari HIBAH", 21, "2023-01-12 14:10:15", "2023-01-12 14:10:15", NULL),
	(114, "periode1", "4", "1.1.7", "7", "1.1.7.7", "1-177", "Persediaan dari Transfer Masuk", 21, "2023-01-12 14:10:15", "2023-01-12 14:10:15", NULL),
	(115, "periode1", "4", "1.1.5", "1", "1.1.5.1", "1-151", "Piutang Jasa Perbankkan", 21, "2023-01-12 14:11:05", "2023-01-12 14:11:05", NULL),
	(116, "periode1", "4", "1.1.6", "1", "1.1.6.1", "1-161", "Piutang Karyawan", 21, "2023-01-12 14:12:01", "2023-01-12 14:12:01", NULL),
	(117, "periode1", "4", "1.1.6", "9", "1.1.6.9", "1-169", "Piutang Lain-lain", 21, "2023-01-12 14:12:01", "2023-01-12 14:12:01", NULL),
	(125, "periode1", "5", "1.1.7.2", "1", "1.1.7.2.1", "1-1721", "Barang Teknik (Bangunan)", 21, "2023-01-12 14:17:21", "2023-01-12 14:17:21", NULL),
	(126, "periode1", "5", "1.1.7.2", "2", "1.1.7.2.2", "1-1722", "Kelontong", 21, "2023-01-12 14:17:21", "2023-01-12 14:17:21", NULL),
	(127, "periode1", "5", "1.1.7.3", "1", "1.1.7.3.1", "1-1731", "Barang Teknik (Bangunan) 2", 21, "2023-01-12 14:18:42", "2023-01-12 14:18:42", NULL),
	(128, "periode1", "5", "1.1.7.3", "2", "1.1.7.3.2", "1-1732", "Kelontong 2", 21, "2023-01-12 14:18:42", "2023-01-12 14:18:42", NULL),
	(129, "periode1", "5", "1.1.7.4", "1", "1.1.7.4.1", "1-1741", "Alat Kesehatan Habis Pakai", 21, "2023-01-12 14:19:19", "2023-01-12 14:19:19", NULL),
	(130, "periode1", "5", "1.1.7.5", "1", "1.1.7.5.1", "1-1751", "Obat-obatan", 21, "2023-01-12 14:20:27", "2023-01-12 14:20:27", NULL),
	(131, "periode1", "5", "1.1.7.5", "2", "1.1.7.5.2", "1-1752", "Pipa", 21, "2023-01-12 14:20:27", "2023-01-12 14:20:27", NULL),
	(132, "periode1", "5", "1.1.7.5", "3", "1.1.7.5.3", "1-1753", "BMHP", 21, "2023-01-12 14:20:27", "2023-01-12 14:20:27", NULL),
	(137, "periode1", "1", NULL, "2", "2", "2-", "Kewajiban", 21, "2023-01-13 13:25:32", "2023-01-13 13:25:32", NULL),
	(138, "periode1", "2", "2", "1", "2.1", "2-1", "Kewajiban Jangka Pendek", 21, "2023-01-13 13:28:37", "2023-01-13 13:28:37", NULL),
	(139, "periode1", "2", "2", "2", "2.2", "2-2", "Kewajiban Jangka Pendek Non Kas", 21, "2023-01-13 13:28:37", "2023-01-13 13:28:37", NULL),
	(140, "periode1", "2", "2", "3", "2.3", "2-3", "Kewajiban Jangka Panjang", 21, "2023-01-13 13:28:37", "2023-01-13 13:28:37", NULL),
	(141, "periode1", "3", "2.1", "1", "2.1.1", "2-11", "Utang kepada pihak ke tiga", 21, "2023-01-13 13:33:02", "2023-01-13 13:33:02", NULL),
	(142, "periode1", "3", "2.1", "2", "2.1.2", "2-12", "Utang Pajak", 21, "2023-01-13 13:33:03", "2023-01-13 13:33:03", NULL),
	(143, "periode1", "3", "2.1", "3", "2.1.3", "2-13", "Diterima Uang Muka", 21, "2023-01-13 13:33:03", "2023-01-13 13:33:03", NULL),
	(144, "periode1", "3", "2.1", "4", "2.1.4", "2-14", "Pendapatan Diterima Dimuka", 21, "2023-01-13 13:33:03", "2023-01-13 13:33:03", NULL),
	(145, "periode1", "3", "2.1", "5", "2.1.5", "2-15", "Uang Muka dari KPPN", 21, "2023-01-13 13:33:03", "2023-01-13 13:33:03", NULL),
	(146, "periode1", "3", "2.1", "6", "2.1.6", "2-16", "Kewajiban Jangka Pendek Lainnya", 21, "2023-01-13 13:33:03", "2023-01-13 13:33:03", NULL),
	(147, "periode1", "4", "2.1.1", "1", "2.1.1.1", "2-111", "Utang Obat", 21, "2023-01-13 13:34:25", "2023-01-13 13:34:25", NULL),
	(149, "periode1", "4", "2.1.1", "2", "2.1.1.2", "2-112", "Utang BMHP", 21, "2023-01-13 13:37:43", "2023-01-13 13:37:43", NULL),
	(150, "periode1", "4", "2.1.1", "3", "2.1.1.3", "2-113", "Utang Bahan Makanan", 21, "2023-01-13 13:37:43", "2023-01-13 13:37:43", NULL),
	(151, "periode1", "4", "2.1.1", "4", "2.1.1.4", "2-114", "Utang Belanja Langganan Daya dan Jasa", 21, "2023-01-13 13:37:43", "2023-01-13 13:37:43", NULL),
	(152, "periode1", "4", "2.1.1", "5", "2.1.1.5", "2-115", "Utang Bahan Non Medis Habis Pakai", 21, "2023-01-13 13:37:43", "2023-01-13 13:37:43", NULL),
	(153, "periode1", "4", "2.1.1", "6", "2.1.1.6", "2-116", "Utang Pemeliharaan", 21, "2023-01-13 13:37:43", "2023-01-13 13:37:43", NULL),
	(154, "periode1", "4", "2.1.1", "7", "2.1.1.7", "2-117", "Utang Belanja Modal", 21, "2023-01-13 13:37:43", "2023-01-13 13:37:43", NULL),
	(155, "periode1", "4", "2.1.2", "1", "2.1.2.1", "2-121", "Utang PPN", 21, "2023-01-13 13:41:32", "2023-01-13 13:41:32", NULL),
	(156, "periode1", "4", "2.1.2", "2", "2.1.2.2", "2-122", "Utang PPh 22", 21, "2023-01-13 13:41:32", "2023-01-13 13:41:32", NULL),
	(157, "periode1", "4", "2.1.2", "3", "2.1.2.3", "2-123", "Utang PPh 23", 21, "2023-01-13 13:41:32", "2023-01-13 13:41:32", NULL),
	(158, "periode1", "4", "2.1.2", "4", "2.1.2.4", "2-124", "Utang PPh 21", 21, "2023-01-13 13:41:32", "2023-01-13 13:41:32", NULL),
	(159, "periode1", "4", "2.1.3", "1", "2.1.3.1", "2-131", "Diterima Uang Muka Pelayanan", 21, "2023-01-13 13:42:50", "2023-01-13 13:42:50", NULL),
	(161, "periode1", "5", "2.1.3.1", "1", "2.1.3.1.1", "2-1311", "Uang Muka Rawat Pasien", 21, "2023-01-13 13:43:43", "2023-01-13 13:43:43", NULL),
	(163, "periode1", "4", "2.1.1", "2", "2.1.1.2", "2-112", "Utang PPN", 21, "2023-01-13 13:47:38", "2023-01-17 14:53:06", "2023-01-17 14:53:06"),
	(164, "periode1", "4", "2.1.1", "3", "2.1.1.3", "2-113", "Diterima Uang Muka Pelayanan", 21, "2023-01-13 13:47:38", "2023-01-17 14:50:55", "2023-01-17 14:50:55"),
	(166, "periode1", "4", "2.1.6", "1", "2.1.6.1", "2-161", "Dana Pihak ke tiga", 21, "2023-01-13 13:51:02", "2023-01-13 13:51:02", NULL),
	(167, "periode1", "3", "2.2", "1", "2.2.1", "2-21", "Perhitungan Uang Diterima Dimuka", 21, "2023-01-13 13:52:33", "2023-01-13 13:52:33", NULL),
	(168, "periode1", "3", "2.2", "2", "2.2.2", "2-22", "Kewajiban Jangka Pendek Non Kas Lainnya", 21, "2023-01-13 13:52:33", "2023-01-13 13:52:33", NULL),
	(169, "periode1", "4", "2.2.1", "1", "2.2.1.1", "2-211", "Penyesuaian Pendapatan Diterima Dimuka", 21, "2023-01-13 13:53:05", "2023-01-13 13:53:05", NULL),
	(170, "periode1", "1", NULL, "3", "3", "3-", "Ekuitas", 21, "2023-01-13 13:53:34", "2023-01-13 13:53:34", NULL),
	(171, "periode1", "2", "3", "1", "3.1", "3-1", "Ekuitas", 21, "2023-01-13 13:55:59", "2023-01-13 13:55:59", NULL),
	(172, "periode1", "2", "3", "2", "3.2", "3-2", "Koreksi Ekuitas", 21, "2023-01-13 13:55:59", "2023-01-13 13:55:59", NULL),
	(173, "periode1", "2", "3", "3", "3.3", "3-3", "Transaksi Antar Entitas", 21, "2023-01-13 13:55:59", "2023-01-13 13:55:59", NULL),
	(174, "periode1", "3", "3.1", "1", "3.1.1", "3-11", "Ekuitas Awal Tahun", 21, "2023-01-13 13:58:16", "2023-01-13 13:58:16", NULL),
	(175, "periode1", "3", "3.1", "2", "3.1.2", "3-12", "Surplus & Defisit Tahun Berjalan", 21, "2023-01-13 13:58:16", "2023-01-13 13:58:16", NULL),
	(177, "periode1", "3", "3.1", "1", "3.1.1", "3-11", "Ekuitas Awal Tahun", 21, "2023-01-13 13:59:21", "2023-01-17 14:51:13", "2023-01-17 14:51:13"),
	(179, "periode1", "3", "3.1", "4", "3.1.4", "3-14", "Ekuitas Donasi/Hibah", 21, "2023-01-13 13:59:22", "2023-01-13 13:59:22", NULL),
	(180, "periode1", "3", "3.2", "1", "3.2.1", "3-21", "Koreksi Ekuitas Yang Menambah/Mengurangai Ekuitas", 21, "2023-01-13 13:59:54", "2023-01-13 13:59:54", NULL),
	(181, "periode1", "4", "3.2.1", "1", "3.2.1.1", "3-211", "Penyesuaian Nilai Aset", 21, "2023-01-13 14:01:24", "2023-01-13 14:01:24", NULL),
	(182, "periode1", "4", "3.2.1", "2", "3.2.1.2", "3-212", "Koreksi Nilai Persediaan", 21, "2023-01-13 14:01:24", "2023-01-13 14:01:24", NULL),
	(183, "periode1", "4", "3.2.1", "3", "3.2.1.3", "3-213", "Koreksi Atas Reklasifikasi", 21, "2023-01-13 14:01:24", "2023-01-13 14:01:24", NULL),
	(184, "periode1", "4", "3.2.1", "4", "3.2.1.4", "3-214", "Selisih Revaluasi Aset Tetap", 21, "2023-01-13 14:01:24", "2023-01-13 14:01:24", NULL),
	(185, "periode1", "4", "3.2.1", "5", "3.2.1.5", "3-215", "Koreksi Nilai Aset Tetap Non Revaluasi", 21, "2023-01-13 14:01:24", "2023-01-13 14:01:24", NULL),
	(186, "periode1", "4", "3.2.1", "6", "3.2.1.6", "3-216", "Koreksi Lain-lain", 21, "2023-01-13 14:01:24", "2023-01-13 14:01:24", NULL),
	(187, "periode1", "3", "3.3", "1", "3.3.1", "3-31", "Diterima dari Entitas Lain", 21, "2023-01-13 14:09:35", "2023-01-13 14:09:35", NULL),
	(188, "periode1", "3", "3.3", "2", "3.3.2", "3-32", "Ditagihkan ke Entitas Lain", 21, "2023-01-13 14:09:35", "2023-01-13 14:09:35", NULL),
	(189, "periode1", "3", "3.3", "3", "3.3.3", "3-33", "Transfer Masuk", 21, "2023-01-13 14:09:35", "2023-01-13 14:09:35", NULL),
	(190, "periode1", "3", "3.3", "4", "3.3.4", "3-34", "Transfer Keluar", 21, "2023-01-13 14:09:35", "2023-01-13 14:09:35", NULL),
	(191, "periode1", "3", "3.3", "5", "3.3.5", "3-35", "Pengesahan Hibah Langsung", 21, "2023-01-13 14:09:35", "2023-01-13 14:09:35", NULL),
	(192, "periode1", "3", "3.3", "6", "3.3.6", "3-36", "Pengesahan Pengembalian Hibah Langsung", 21, "2023-01-13 14:09:35", "2023-01-13 14:09:35", NULL),
	(193, "periode1", "1", NULL, "4", "4", "4-", "Pendapatan", 21, "2023-01-13 14:10:22", "2023-01-13 14:10:22", NULL),
	(194, "periode1", "2", "4", "1", "4.1", "4-1", "Pendapatan dari Alokasi APBN", 21, "2023-01-13 14:13:04", "2023-01-13 14:13:04", NULL),
	(195, "periode1", "2", "4", "2", "4.2", "4-2", "Pendapatan Jasa Pelayanan Rumah Sakit", 21, "2023-01-13 14:13:04", "2023-01-13 14:13:04", NULL),
	(196, "periode1", "2", "4", "3", "4.3", "4-3", "Pendapatan Jasa Layanan dari Entitas Lain", 21, "2023-01-13 14:13:04", "2023-01-13 14:13:04", NULL),
	(197, "periode1", "2", "4", "4", "4.4", "4-4", "Pendapatan Hibah", 21, "2023-01-13 14:13:04", "2023-01-13 14:13:04", NULL),
	(198, "periode1", "2", "4", "5", "4.5", "4-5", "Pendapatan Hasil Kerjasama", 21, "2023-01-13 14:13:04", "2023-01-13 14:13:04", NULL),
	(199, "periode1", "2", "4", "6", "4.6", "4-6", "Pendapatan Lainnya", 21, "2023-01-13 14:13:04", "2023-01-13 14:13:04", NULL),
	(200, "periode1", "2", "4", "7", "4.7", "4-7", "Pendapatan Non Operasional", 21, "2023-01-13 14:13:04", "2023-01-13 14:13:04", NULL),
	(201, "periode1", "2", "4", "8", "4.8", "4-8", "Pendapatan Non Kas", 21, "2023-01-13 14:13:04", "2023-01-13 14:13:04", NULL),
	(202, "periode1", "2", "4", "9", "4.9", "4-9", "Iktisar Aktivitas", 21, "2023-01-13 14:13:04", "2023-01-13 14:13:04", NULL),
	(209, "periode1", "3", "4.2", "1", "4.2.1", "4-21", "Jasa Layanan Kesehatan dengan Jaminan Swasta", 21, "2023-01-13 14:17:25", "2023-01-13 14:17:25", NULL),
	(210, "periode1", "3", "4.2", "2", "4.2.2", "4-22", "Jasa Layanan Kesehatan dengan Jaminan BPJS Kesehatan", 21, "2023-01-13 14:17:25", "2023-01-13 14:17:25", NULL),
	(211, "periode1", "3", "4.2", "3", "4.2.3", "4-23", "Jasa Layanan Kesehatan dengan Jamkesda", 21, "2023-01-13 14:17:25", "2023-01-13 14:17:25", NULL),
	(212, "periode1", "3", "4.2", "4", "4.2.4", "4-24", "Jasa Layanan Kesehatan dengan Jaminan Lainnya", 21, "2023-01-13 14:17:25", "2023-01-13 14:17:25", NULL),
	(213, "periode1", "3", "4.2", "5", "4.2.5", "4-25", "Jasa Layanan Kesehatan Non Jaminan", 21, "2023-01-13 14:17:25", "2023-01-13 14:17:25", NULL),
	(214, "periode1", "3", "4.3", "1", "4.3.1", "4-31", "Pendapatan yang bersumber dari Entitas Pemerintah Pusat", 21, "2023-01-13 14:18:06", "2023-01-13 14:18:06", NULL),
	(215, "periode1", "4", "4.3.1", "1", "4.3.1.1", "4-311", "Pendapatan DIKLAT dari satu Kementerian", 21, "2023-01-13 14:18:50", "2023-01-13 14:18:50", NULL),
	(216, "periode1", "4", "4.3.1", "2", "4.3.1.2", "4-312", "Pendapatan Pelayanan Kesehatan", 21, "2023-01-13 14:18:50", "2023-01-13 14:18:50", NULL),
	(217, "periode1", "4", "4.3.1", "3", "4.3.1.3", "4-313", "Pendapatan DIKLAT dari Berbeda Kementerian", 21, "2023-01-13 14:18:50", "2023-01-13 14:18:50", NULL),
	(218, "periode1", "3", "4.5", "1", "4.5.1", "4-51", "Pendapatan dari Pemanfaatan BMN RS", 21, "2023-01-13 14:19:25", "2023-01-13 14:19:25", NULL),
	(219, "periode1", "4", "4.5.1", "1", "4.5.1.1", "4-511", "Pendapatan Hasil Kerjasama Perorangan", 21, "2023-01-13 14:20:07", "2023-01-13 14:20:07", NULL),
	(220, "periode1", "4", "4.5.1", "2", "4.5.1.2", "4-512", "Pendapatan Hasil Kerjasama Lembaga/Badan Usaha", 21, "2023-01-13 14:20:07", "2023-01-13 14:20:07", NULL),
	(221, "periode1", "5", "4.5.1.2", "1", "4.5.1.2.1", "4-5121", "Pendapatan dari Rumah Duka", 21, "2023-01-13 14:21:01", "2023-01-13 14:21:01", NULL),
	(222, "periode1", "5", "4.5.1.2", "2", "4.5.1.2.2", "4-5122", "Pendapatan dari KOPMART KOPERASI", 21, "2023-01-13 14:21:01", "2023-01-13 14:21:01", NULL),
	(223, "periode1", "5", "4.5.1.2", "3", "4.5.1.2.3", "4-5123", "Pendapatan dari Sewa Lahan ATM", 21, "2023-01-13 14:21:01", "2023-01-13 14:21:01", NULL),
	(224, "periode1", "3", "4.6", "1", "4.6.1", "4-61", "Jasa Lembaga keuangan", 21, "2023-01-13 14:21:42", "2023-01-13 14:21:42", NULL),
	(225, "periode1", "3", "4.6", "2", "4.6.2", "4-62", "Jasa Giro Bend. Pengeluaran", 21, "2023-01-13 14:21:42", "2023-01-13 14:21:42", NULL),
	(226, "periode1", "3", "4.6", "3", "4.6.3", "4-63", "Jasa Giro Bend. Penerima", 21, "2023-01-13 14:21:42", "2023-01-13 14:21:42", NULL),
	(227, "periode1", "3", "4.6", "4", "4.6.4", "4-64", "Bunga Deposito", 21, "2023-01-13 14:21:42", "2023-01-13 14:21:42", NULL),
	(228, "periode1", "3", "4.6", "1", "4.6.1", "4-61", "Jasa Lembaga keuangan", 21, "2023-01-13 14:23:31", "2023-01-17 14:52:35", "2023-01-17 14:52:35"),
	(229, "periode1", "3", "4.6", "2", "4.6.2", "4-62", "Pendapatan Fungsional Lainnya", 21, "2023-01-13 14:23:31", "2023-01-13 14:23:31", NULL),
	(230, "periode1", "4", "4.6.2", "1", "4.6.2.1", "4-621", "Pendapatan DIKLAT dari Lembaga Lainnya", 21, "2023-01-13 14:25:58", "2023-01-13 14:25:58", NULL),
	(231, "periode1", "4", "4.6.2", "2", "4.6.2.2", "4-622", "Pendapatan Sewa Gedung", 21, "2023-01-13 14:25:58", "2023-01-13 14:25:58", NULL),
	(232, "periode1", "4", "4.6.2", "3", "4.6.2.3", "4-623", "Pendapatan Lahan", 21, "2023-01-13 14:25:58", "2023-01-13 14:25:58", NULL),
	(233, "periode1", "4", "4.6.2", "4", "4.6.2.4", "4-624", "Pendapatan Wisma / Asrama", 21, "2023-01-13 14:25:58", "2023-01-13 14:25:58", NULL),
	(234, "periode1", "4", "4.6.2", "5", "4.6.2.5", "4-625", "Pendapatan Sewa Kendaraan", 21, "2023-01-13 14:25:58", "2023-01-13 14:25:58", NULL),
	(235, "periode1", "4", "4.6.2", "6", "4.6.2.6", "4-626", "Pendapatan Laundry", 21, "2023-01-13 14:25:58", "2023-01-13 14:25:58", NULL),
	(236, "periode1", "4", "4.6.2", "7", "4.6.2.7", "4-627", "Pendapatan Denda", 21, "2023-01-13 14:25:58", "2023-01-13 14:25:58", NULL),
	(237, "periode1", "4", "4.6.2", "8", "4.6.2.8", "4-628", "Pendapatan Lainnya", 21, "2023-01-13 14:25:58", "2023-01-13 14:25:58", NULL),
	(238, "periode1", "3", "4.7", "1", "4.7.1", "4-71", "Pendapatan Pelepasan Aset Non Lancar", 21, "2023-01-13 14:26:48", "2023-01-13 14:26:48", NULL),
	(239, "periode1", "3", "4.7", "2", "4.7.2", "4-72", "Pendapatan dari Pengembalian Belanja BLU TAYL", 21, "2023-01-13 14:26:48", "2023-01-13 14:26:48", NULL),
	(240, "periode1", "3", "4.7", "3", "4.7.3", "4-73", "Pendapatan PNBP Umum", 21, "2023-01-13 14:26:48", "2023-01-13 14:26:48", NULL),
	(241, "periode1", "3", "4.7", "4", "4.7.4", "4-74", "Pendapatan Kegiatan Non Operasional Lainnya", 21, "2023-01-13 14:26:48", "2023-01-13 14:26:48", NULL),
	(242, "periode1", "3", "4.8", "1", "4.8.1", "4-81", "Pendapatan Jasa Pelayanan Rumah Sakit Non Kas", 21, "2023-01-13 14:28:15", "2023-01-13 14:28:15", NULL),
	(243, "periode1", "3", "4.8", "2", "4.8.2", "4-82", "Pendapatan Fungsional Lainnya", 21, "2023-01-13 14:28:15", "2023-01-13 14:28:15", NULL),
	(244, "periode1", "3", "4.8", "3", "4.8.3", "4-83", "Pendapatan dari Hibah/Donasi/Sumbangan Non PemerintahPendapatan dari Hibah/Donasi/Sumbangan Non Pemerintah", 21, "2023-01-13 14:28:15", "2023-01-13 14:28:15", NULL),
	(245, "periode1", "4", "4.8.2", "1", "4.8.2.1", "4-821", "Pendapatan Sewa Gedung dan Lahan Non Kas", 21, "2023-01-13 14:29:13", "2023-01-13 14:29:13", NULL),
	(246, "periode1", "4", "4.8.2", "2", "4.8.2.2", "4-822", "Pendapatan Hasil Kerjasama Non Kas", 21, "2023-01-13 14:29:13", "2023-01-13 14:29:13", NULL),
	(247, "periode1", "1", NULL, "5", "5", "5-", "Pembelian Persediaan", 21, "2023-01-13 14:29:46", "2023-01-13 14:29:46", NULL),
	(248, "periode1", "2", "5", "1", "5.1", "5-1", "Pembelian Barang Persediaan", 21, "2023-01-13 14:31:47", "2023-01-13 14:31:47", NULL),
	(249, "periode1", "2", "5", "2", "5.2", "5-2", "Pembelian Barang Non Persediaan", 21, "2023-01-13 14:31:47", "2023-01-13 14:31:47", NULL),
	(250, "periode1", "2", "5", "3", "5.3", "5-3", "Retur Pembelian", 21, "2023-01-13 14:31:47", "2023-01-13 14:31:47", NULL),
	(251, "periode1", "2", "5", "4", "5.4", "5-4", "Biaya Angkut", 21, "2023-01-13 14:31:47", "2023-01-13 14:31:47", NULL),
	(252, "periode1", "2", "5", "5", "5.5", "5-5", "Pot. Pembelian", 21, "2023-01-13 14:31:47", "2023-01-13 14:31:47", NULL),
	(253, "periode1", "3", "5.1", "1", "5.1.1", "5-11", "Pemb. Barang Konsumsi", 21, "2023-01-13 14:33:33", "2023-01-13 14:33:33", NULL),
	(254, "periode1", "3", "5.1", "2", "5.1.2", "5-12", "Bahan untuk Pemeliharaan", 21, "2023-01-13 14:33:33", "2023-01-13 14:33:33", NULL),
	(255, "periode1", "3", "5.1", "3", "5.1.3", "5-13", "Bahan Baku", 21, "2023-01-13 14:33:33", "2023-01-13 14:33:33", NULL),
	(256, "periode1", "3", "5.1", "4", "5.1.4", "5-14", "Suku Cadang", 21, "2023-01-13 14:33:33", "2023-01-13 14:33:33", NULL),
	(257, "periode1", "3", "5.1", "5", "5.1.5", "5-15", "Persediaan Lainnya", 21, "2023-01-13 14:33:33", "2023-01-13 14:33:33", NULL),
	(258, "periode1", "3", "5.2", "1", "5.2.1", "5-21", "Pemb. Barang Konsumsi", 21, "2023-01-13 14:34:45", "2023-01-13 14:34:45", NULL),
	(259, "periode1", "3", "5.2", "2", "5.2.2", "5-22", "Bahan untuk Pemeliharaan", 21, "2023-01-13 14:34:45", "2023-01-13 14:34:45", NULL),
	(260, "periode1", "3", "5.2", "3", "5.2.3", "5-23", "Bahan Baku", 21, "2023-01-13 14:34:45", "2023-01-13 14:34:45", NULL),
	(261, "periode1", "4", "5.1.1", "1", "5.1.1.1", "5-111", "Pemb. Alat Tulis Kantor", 21, "2023-01-13 14:36:15", "2023-01-13 14:36:15", NULL),
	(262, "periode1", "4", "5.1.1", "2", "5.1.1.2", "5-112", "Pemb. Bahan Makanan", 21, "2023-01-13 14:36:15", "2023-01-13 14:36:15", NULL),
	(263, "periode1", "4", "5.1.1", "3", "5.1.1.3", "5-113", "Pemb. Barang Cetakan", 21, "2023-01-13 14:36:15", "2023-01-13 14:36:15", NULL),
	(264, "periode1", "4", "5.1.1", "4", "5.1.1.4", "5-114", "Pemb. Barang Komputer", 21, "2023-01-13 14:36:15", "2023-01-13 14:36:15", NULL),
	(265, "periode1", "4", "5.1.1", "5", "5.1.1.5", "5-115", "Pemb. Barang Teknik (Listrik)", 21, "2023-01-13 14:36:15", "2023-01-13 14:36:15", NULL),
	(266, "periode1", "4", "5.1.1", "6", "5.1.1.6", "5-116", "Pemb. Barang Tekstil", 21, "2023-01-13 14:36:15", "2023-01-13 14:36:15", NULL),
	(267, "periode1", "4", "5.1.1", "7", "5.1.1.7", "5-117", "Pemb. Alat/Bahan untuk Kegiatan Kantor Lainnya", 21, "2023-01-13 14:36:15", "2023-01-13 14:36:15", NULL),
	(268, "periode1", "4", "5.1.2", "1", "5.1.2.1", "5-121", "Pemb. Barang Teknik (Bangunan)", 21, "2023-01-13 14:37:03", "2023-01-13 14:37:03", NULL),
	(269, "periode1", "4", "5.1.2", "2", "5.1.2.2", "5-122", "Pemb. Kelontong", 21, "2023-01-13 14:37:03", "2023-01-13 14:37:03", NULL),
	(270, "periode1", "4", "5.1.3", "1", "5.1.3.1", "5-131", "Pemb. Barang Teknik (Bangunan) 2", 21, "2023-01-13 14:37:41", "2023-01-13 14:37:41", NULL),
	(271, "periode1", "4", "5.1.3", "2", "5.1.3.2", "5-132", "Pemb. Kelontong 2", 21, "2023-01-13 14:37:41", "2023-01-13 14:37:41", NULL),
	(272, "periode1", "4", "5.1.4", "1", "5.1.4.1", "5-141", "Pemb. Alat Kesehatan Habis Pakai", 21, "2023-01-13 14:38:22", "2023-01-13 14:38:22", NULL),
	(273, "periode1", "4", "5.1.5", "1", "5.1.5.1", "5-151", "Pemb. Obat-obatan", 21, "2023-01-13 14:39:47", "2023-01-13 14:39:47", NULL),
	(274, "periode1", "4", "5.1.5", "2", "5.1.5.2", "5-152", "Pemb. Pipa", 21, "2023-01-13 14:39:47", "2023-01-13 14:39:47", NULL),
	(275, "periode1", "4", "5.2.1", "1", "5.2.1.1", "5-211", "Pemb. PDTT", 21, "2023-01-13 14:40:21", "2023-01-13 14:40:21", NULL),
	(276, "periode1", "1", NULL, "6", "6", "6-", "Beban Operasional", 21, "2023-01-13 14:41:07", "2023-01-13 14:41:07", NULL),
	(277, "periode1", "2", "6", "1", "6.1", "6-1", "Beban Pegawai", 21, "2023-01-13 14:42:29", "2023-01-13 14:42:29", NULL),
	(278, "periode1", "2", "6", "2", "6.2", "6-2", "Beban Pegawai Non PNS", 21, "2023-01-13 14:42:29", "2023-01-17 14:49:08", "2023-01-17 14:49:08"),
	(279, "periode1", "2", "6", "3", "6.3", "6-3", "Beban Remunerasi", 21, "2023-01-13 14:42:29", "2023-01-17 14:49:31", "2023-01-17 14:49:31"),
	(280, "periode1", "2", "6", "4", "6.4", "6-4", "Beban Uang Lembur PNS", 21, "2023-01-13 14:42:29", "2023-01-17 14:49:49", "2023-01-17 14:49:49"),
	(281, "periode1", "2", "6", "5", "6.5", "6-5", "Beban Uang Makan PNS", 21, "2023-01-13 14:42:29", "2023-01-17 14:49:59", "2023-01-17 14:49:59"),
	(282, "periode1", "2", "6", "1", "6.1", "6-1", "Beban Pegawai", 21, "2023-01-13 14:46:46", "2023-01-17 14:48:22", "2023-01-17 14:48:22"),
	(283, "periode1", "2", "6", "2", "6.2", "6-2", "Beban Persediaan", 21, "2023-01-13 14:46:46", "2023-01-13 14:46:46", NULL),
	(284, "periode1", "2", "6", "3", "6.3", "6-3", "Beban Barang dan Jasa", 21, "2023-01-13 14:46:46", "2023-01-13 14:46:46", NULL),
	(285, "periode1", "2", "6", "4", "6.4", "6-4", "Beban Pemeliharaan", 21, "2023-01-13 14:46:46", "2023-01-13 14:46:46", NULL),
	(286, "periode1", "2", "6", "5", "6.5", "6-5", "Beban Perjalanan Dinas", 21, "2023-01-13 14:46:46", "2023-01-13 14:46:46", NULL),
	(287, "periode1", "2", "6", "6", "6.6", "6-6", "Beban Barang yang diserahkan ke masyarakat", 21, "2023-01-13 14:46:46", "2023-01-13 14:46:46", NULL),
	(288, "periode1", "2", "6", "7", "6.7", "6-7", "Beban Penyusutan dan Amortisasi", 21, "2023-01-13 14:46:46", "2023-01-13 14:46:46", NULL),
	(289, "periode1", "2", "6", "8", "6.8", "6-8", "Beban Penyisihan Piutang Tak Tertagih", 21, "2023-01-13 14:46:46", "2023-01-13 14:46:46", NULL),
	(290, "periode1", "3", "6.1", "1", "6.1.1", "6-11", "Beban Pegawai PNS", 21, "2023-01-13 14:48:34", "2023-01-13 14:48:34", NULL),
	(291, "periode1", "3", "6.1", "2", "6.1.2", "6-12", "Beban Pegawai Non PNS", 21, "2023-01-13 14:48:34", "2023-01-13 14:48:34", NULL),
	(292, "periode1", "3", "6.1", "3", "6.1.3", "6-13", "Beban Remunerasi", 21, "2023-01-13 14:48:34", "2023-01-13 14:48:34", NULL),
	(293, "periode1", "3", "6.1", "4", "6.1.4", "6-14", "Beban Uang Lembur PNS", 21, "2023-01-13 14:48:34", "2023-01-13 14:48:34", NULL),
	(294, "periode1", "3", "6.1", "5", "6.1.5", "6-15", "Beban Uang Makan PNS", 21, "2023-01-13 14:48:34", "2023-01-13 14:48:34", NULL),
	(295, "periode1", "4", "6.1.1", "1", "6.1.1.1", "6-111", "Potongan PPh Pasal 21 (411121)", 21, "2023-01-13 14:50:05", "2023-01-13 14:50:05", NULL),
	(296, "periode1", "4", "6.1.1", "2", "6.1.1.2", "6-112", "Potongan Sewa Tanah, Gedung, dan Bangunan (425131)", 21, "2023-01-13 14:50:05", "2023-01-13 14:50:05", NULL),
	(297, "periode1", "4", "6.1.1", "3", "6.1.1.3", "6-113", "Beban Tunj. Fungsional PNS (511124)", 21, "2023-01-13 14:50:05", "2023-01-13 14:50:05", NULL),
	(298, "periode1", "4", "6.1.1", "4", "6.1.1.4", "6-114", "Potongan PFK 8% Gaji PNS Pusat (811132)", 21, "2023-01-13 14:50:05", "2023-01-13 14:50:05", NULL),
	(299, "periode1", "4", "6.1.1", "5", "6.1.1.5", "6-115", "Potongan PFK 2% Gaji PNS Pusat (811135)", 21, "2023-01-13 14:50:05", "2023-01-13 14:50:05", NULL),
	(300, "periode1", "4", "6.1.1", "6", "6.1.1.6", "6-116", "Beban Pembulatan Gaji PNS (511119)", 21, "2023-01-13 14:50:05", "2023-01-13 14:50:05", NULL),
	(301, "periode1", "4", "6.1.1", "7", "6.1.1.7", "6-117", "Penerimaan Kembali Belanja Pegawai Tahun Anggaran Yang Lalu (425911)", 21, "2023-01-13 14:50:05", "2023-01-13 14:50:05", NULL),
	(302, "periode1", "4", "6.1.1", "8", "6.1.1.8", "6-118", "Potongan & Pengembalian Lainnya", 21, "2023-01-13 14:50:05", "2023-01-13 14:50:05", NULL),
	(303, "periode1", "3", "6.2", "1", "6.2.1", "6-21", "Beban Persediaan Konsumsi", 21, "2023-01-13 14:51:34", "2023-01-13 14:51:34", NULL),
	(304, "periode1", "3", "6.2", "2", "6.2.2", "6-22", "Beban Persediaan Bahan Baku", 21, "2023-01-13 14:51:34", "2023-01-13 14:51:34", NULL),
	(305, "periode1", "3", "6.2", "3", "6.2.3", "6-23", "Beban Persediaan Lainnya", 21, "2023-01-13 14:51:34", "2023-01-13 14:51:34", NULL),
	(306, "periode1", "3", "6.3", "1", "6.3.1", "6-31", "Beban Barang Operasional", 21, "2023-01-13 14:53:05", "2023-01-13 14:53:05", NULL),
	(307, "periode1", "3", "6.3", "2", "6.3.2", "6-32", "Beban Jasa Operasional", 21, "2023-01-13 14:53:05", "2023-01-13 14:53:05", NULL),
	(308, "periode1", "4", "6.3.1", "1", "6.3.1.1", "6-311", "Beban Keperluan Perkantoran", 21, "2023-01-13 14:54:15", "2023-01-13 14:54:15", NULL),
	(309, "periode1", "4", "6.3.1", "2", "6.3.1.2", "6-312", "Beban Penambah Daya Tahan Tubuh", 21, "2023-01-13 14:54:15", "2023-01-13 14:54:15", NULL),
	(310, "periode1", "4", "6.3.1", "3", "6.3.1.3", "6-313", "Beban Barang Lainnya", 21, "2023-01-13 14:54:15", "2023-01-13 14:54:15", NULL),
	(320, "periode1", "4", "1.3.3", "1", "1.3.3.1", "1-331", "Aplikasi/Program/Softwere", 21, "2023-01-16 09:40:05", "2023-01-16 09:40:05", NULL),
	(321, "periode1", "4", "1.3.3", "2", "1.3.3.2", "1-332", "Website", 21, "2023-01-16 09:40:05", "2023-01-16 09:40:05", NULL),
	(322, "periode1", "4", "1.3.3", "3", "1.3.3.3", "1-333", "Lisensi", 21, "2023-01-16 09:40:05", "2023-01-16 09:40:05", NULL),
	(323, "periode1", "3", "6.4", "1", "6.4.1", "6-41", "Beban Pemeliharaan Gedung dan Bangunan", 21, "2023-01-16 09:58:51", "2023-01-16 09:58:51", NULL),
	(324, "periode1", "3", "6.4", "2", "6.4.2", "6-42", "Beban Pemeliharaan Peralatan dan Mesin", 21, "2023-01-16 09:58:51", "2023-01-16 09:58:51", NULL),
	(325, "periode1", "3", "6.4", "3", "6.4.3", "6-43", "Beban Pemeliharaan Jaringan", 21, "2023-01-16 09:58:51", "2023-01-16 09:58:51", NULL),
	(326, "periode1", "3", "6.4", "4", "6.4.4", "6-44", "Beban Pemeliharaan Lainnya", 21, "2023-01-16 09:58:51", "2023-01-16 09:58:51", NULL),
	(327, "periode1", "4", "6.4.1", "1", "6.4.1.1", "6-411", "Beban Pemeliharan Gedung dan Bangunan Bertingkat", 21, "2023-01-16 09:59:54", "2023-01-16 09:59:54", NULL),
	(328, "periode1", "4", "6.4.1", "2", "6.4.1.2", "6-412", "Beban Pemeliharan Gedung dan Bangunan Tidak Bertingkat", 21, "2023-01-16 09:59:54", "2023-01-16 09:59:54", NULL),
	(329, "periode1", "4", "6.4.2", "1", "6.4.2.1", "6-421", "Beban Pemeliharaan Peralatan dan Mesin Medik", 21, "2023-01-16 10:02:09", "2023-01-16 10:02:09", NULL),
	(330, "periode1", "4", "6.4.2", "2", "6.4.2.2", "6-422", "Beban Pemeliharaan Peralatan dan Mesin Non Medik", 21, "2023-01-16 10:02:09", "2023-01-16 10:02:09", NULL),
	(331, "periode1", "4", "6.4.3", "1", "6.4.3.1", "6-431", "Beban Pemeliharaan Jaringan Internet", 21, "2023-01-16 10:03:19", "2023-01-16 10:03:19", NULL),
	(332, "periode1", "4", "6.4.3", "2", "6.4.3.2", "6-432", "Beban Pemeliharaan Jaringan LAN", 21, "2023-01-16 10:03:19", "2023-01-16 10:03:19", NULL),
	(333, "periode1", "4", "6.4.4", "1", "6.4.4.1", "6-441", "Beban Pemeliharaan Instalasi", 21, "2023-01-16 10:04:37", "2023-01-16 10:04:37", NULL),
	(334, "periode1", "4", "6.4.4", "2", "6.4.4.2", "6-442", "Beban Persediaan", 21, "2023-01-16 10:04:37", "2023-01-16 10:04:37", NULL),
	(335, "periode1", "5", "6.4.4.1", "1", "6.4.4.1.1", "6-4411", "Beban Pemeliharaan Instalasi Listrik", 21, "2023-01-16 10:07:18", "2023-01-16 10:07:18", NULL),
	(336, "periode1", "5", "6.4.4.1", "2", "6.4.4.1.2", "6-4412", "Beban Pemeliharaan Instalasi Air Bersih", 21, "2023-01-16 10:07:18", "2023-01-16 10:07:18", NULL),
	(337, "periode1", "5", "6.4.4.1", "3", "6.4.4.1.3", "6-4413", "Beban Pemeliharaan Instalasi Air Kotor", 21, "2023-01-16 10:07:18", "2023-01-16 10:07:18", NULL),
	(338, "periode1", "5", "6.4.4.1", "4", "6.4.4.1.4", "6-4414", "Beban Pemeliharan Aplikasi", 21, "2023-01-16 10:07:18", "2023-01-16 10:07:18", NULL),
	(339, "periode1", "3", "6.2", "4", "6.2.4", "6-24", "Beban Persediaan untuk Pemeliharaan", 21, "2023-01-16 10:08:23", "2023-01-16 10:08:23", NULL),
	(340, "periode1", "3", "6.2", "5", "6.2.5", "6-25", "Beban Persediaan untuk Suku Cadang", 21, "2023-01-16 10:08:23", "2023-01-16 10:08:23", NULL),
	(341, "periode1", "3", "6.5", "1", "6.5.1", "6-51", "Beban Perjalanan Dinas Dalam Negeri", 21, "2023-01-16 10:09:41", "2023-01-16 10:09:41", NULL),
	(342, "periode1", "3", "6.5", "2", "6.5.2", "6-52", "Beban Perjalanan Dinas Luar Negeri", 21, "2023-01-16 10:09:41", "2023-01-16 10:09:41", NULL),
	(343, "periode1", "3", "6.6", "1", "6.6.1", "6-61", "Barang Persediaan diserahkan ke masyarakat", 21, "2023-01-16 10:13:03", "2023-01-16 10:13:03", NULL),
	(344, "periode1", "4", "6.6.1", "1", "6.6.1.1", "6-611", "Beban Hibah Obat dan BMHP ke masyarakat", 21, "2023-01-16 10:14:13", "2023-01-16 10:14:13", NULL),
	(345, "periode1", "4", "6.6.1", "2", "6.6.1.2", "6-612", "Beban Hibah Alkes ke Masyarakat", 21, "2023-01-16 10:14:13", "2023-01-16 10:14:13", NULL),
	(346, "periode1", "3", "6.7", "1", "6.7.1", "6-71", "Beban Penyusutan", 21, "2023-01-16 10:15:29", "2023-01-16 10:15:29", NULL),
	(347, "periode1", "3", "6.7", "2", "6.7.2", "6-72", "Beban Amortisasi", 21, "2023-01-16 10:15:29", "2023-01-16 10:15:29", NULL),
	(348, "periode1", "3", "6.7", "3", "6.7.3", "6-73", "Beban Penyusutan dan Amortisasi Aset yang tidak digunakan dalam Operasi Pemerintahan", 21, "2023-01-16 10:15:29", "2023-01-16 10:15:29", NULL),
	(349, "periode1", "4", "6.7.1", "1", "6.7.1.1", "6-711", "Beban Penyusutan Peralatan dan Mesin", 21, "2023-01-16 10:17:01", "2023-01-16 10:17:01", NULL),
	(350, "periode1", "4", "6.7.1", "2", "6.7.1.2", "6-712", "Beban Penyusutan Gedung dan Bangunan", 21, "2023-01-16 10:17:01", "2023-01-16 10:17:01", NULL),
	(351, "periode1", "4", "6.7.1", "3", "6.7.1.3", "6-713", "Beban Penyusutan Jalan, Jembatan dan Irigasi", 21, "2023-01-16 10:17:01", "2023-01-16 10:17:01", NULL),
	(352, "periode1", "4", "6.7.1", "4", "6.7.1.4", "6-714", "Beban Penyusutan Jaringan", 21, "2023-01-16 10:17:01", "2023-01-16 10:17:01", NULL),
	(353, "periode1", "4", "6.7.1", "5", "6.7.1.5", "6-715", "Beban Penyusutan Aset Tetap Lainnya", 21, "2023-01-16 10:17:01", "2023-01-16 10:17:01", NULL),
	(354, "periode1", "4", "6.7.2", "1", "6.7.2.1", "6-721", "Beban Amortisasi Softwere", 21, "2023-01-16 10:17:33", "2023-01-16 10:17:33", NULL),
	(355, "periode1", "4", "6.7.2", "2", "6.7.2.2", "6-722", "Beban Amortisasi Lisensi", 21, "2023-01-16 10:17:33", "2023-01-16 10:17:33", NULL),
	(356, "periode1", "3", "6.8", "1", "6.8.1", "6-81", "Penyisihan Piutang Pasien Jaminan", 21, "2023-01-16 10:18:15", "2023-01-16 10:18:15", NULL),
	(357, "periode1", "3", "6.8", "2", "6.8.2", "6-82", "Penyisihan Piutang Pasien Non Jaminan", 21, "2023-01-16 10:18:15", "2023-01-16 10:18:15", NULL),
	(358, "periode1", "3", "6.8", "3", "6.8.3", "6-83", "Penyisihan Piutang Usaha Lainnya", 21, "2023-01-16 10:18:16", "2023-01-16 10:18:16", NULL),
	(359, "periode1", "1", NULL, "7", "7", "7-", "Beban Non Operasional", 21, "2023-01-16 10:18:50", "2023-01-16 10:18:50", NULL),
	(360, "periode1", "2", "7", "1", "7.1", "7-1", "Beban Perbankan", 21, "2023-01-16 10:21:15", "2023-01-16 10:21:15", NULL),
	(361, "periode1", "2", "7", "2", "7.2", "7-2", "Beban Pengembalian ke Kas Negara", 21, "2023-01-16 10:21:15", "2023-01-16 10:21:15", NULL),
	(362, "periode1", "2", "7", "3", "7.3", "7-3", "Beban Pelepasan Aset Non Lancar", 21, "2023-01-16 10:21:15", "2023-01-16 10:21:15", NULL),
	(363, "periode1", "2", "7", "4", "7.4", "7-4", "Beban Kegiatan Non Operasioanl Lainnya", 21, "2023-01-16 10:21:15", "2023-01-16 10:21:15", NULL),
	(364, "periode1", "2", "7", "5", "7.5", "7-5", "Beban Non Kas", 21, "2023-01-16 10:21:15", "2023-01-16 10:21:15", NULL),
	(365, "periode1", "3", "7.1", "1", "7.1.1", "7-11", "Beban Bunga", 21, "2023-01-16 10:22:01", "2023-01-16 10:22:01", NULL),
	(366, "periode1", "3", "7.1", "2", "7.1.2", "7-12", "Beban Admin Bank", 21, "2023-01-16 10:22:01", "2023-01-16 10:22:01", NULL),
	(367, "periode1", "4", "7.1.2", "1", "7.1.2.1", "7-121", "Beban Admin Bank Atas Penerimaan dari Piutang Jaminan", 21, "2023-01-16 10:23:07", "2023-01-16 10:23:07", NULL),
	(368, "periode1", "4", "7.1.2", "2", "7.1.2.2", "7-122", "Beban Admin Bank Atas Penerimaan dari Piutang Non Jaminan", 21, "2023-01-16 10:23:07", "2023-01-16 10:23:07", NULL),
	(369, "periode1", "4", "7.1.2", "3", "7.1.2.3", "7-123", "Beban Admin Bank Atas Penerimaan dari Piutang Kerjasama", 21, "2023-01-16 10:23:07", "2023-01-16 10:23:07", NULL),
	(370, "periode1", "4", "7.1.2", "4", "7.1.2.4", "7-124", "Beban Admin Bank Atas Penerimaan dari Piutang Entitas Lainnya", 21, "2023-01-16 10:23:07", "2023-01-16 10:23:07", NULL),
	(371, "periode1", "4", "7.1.2", "5", "7.1.2.5", "7-125", "Beban Admin Bank Atas Penerimaan dari Piutang Fungsional Lainnya", 21, "2023-01-16 10:23:07", "2023-01-16 10:23:07", NULL),
	(372, "periode1", "4", "7.1.2", "6", "7.1.2.6", "7-126", "Beban Admin Bank atas Pembayaran / Transfer Dana Keluar", 21, "2023-01-16 10:23:08", "2023-01-16 10:23:08", NULL),
	(373, "periode1", "4", "7.1.2", "7", "7.1.2.7", "7-127", "Beban Admin Bank atas Penerimaan / Transfer Dana Masuk", 21, "2023-01-16 10:23:08", "2023-01-16 10:23:08", NULL),
	(374, "periode1", "3", "7.2", "1", "7.2.1", "7-21", "Pembayaran Pengembalian Pendapatan BLU TAYL", 21, "2023-01-16 10:23:50", "2023-01-16 10:23:50", NULL),
	(375, "periode1", "3", "7.2", "2", "7.2.2", "7-22", "Penyetoran PNBP ke Kas Negara", 21, "2023-01-16 10:23:50", "2023-01-16 10:23:50", NULL),
	(383, "periode1", "4", "6.3.2", "1", "6.3.2.1", "6-321", "Beban Honor Operasional Satuan Kerja", 21, "2023-01-16 10:33:45", "2023-01-16 10:33:45", NULL),
	(384, "periode1", "4", "6.3.2", "2", "6.3.2.2", "6-322", "Beban Langganan Daya dan Jasa", 21, "2023-01-16 10:33:45", "2023-01-16 10:33:45", NULL),
	(385, "periode1", "4", "6.3.2", "3", "6.3.2.3", "6-323", "Beban Jasa BLU", 21, "2023-01-16 10:33:45", "2023-01-16 10:33:45", NULL),
	(386, "periode1", "4", "6.3.2", "4", "6.3.2.4", "6-324", "Beban Jasa Lainnya", 21, "2023-01-16 10:33:45", "2023-01-16 10:33:45", NULL),
	(387, "periode1", "4", "6.3.2", "5", "6.3.2.5", "6-325", "Beban Penyediaan Barang dan Jasa BLU Lainnya", 21, "2023-01-16 10:33:45", "2023-01-16 10:33:45", NULL),
	(388, "periode1", "5", "6.3.2.2", "1", "6.3.2.2.1", "6-3221", "Beban Langganan Listrik", 21, "2023-01-16 10:35:34", "2023-01-16 10:35:34", NULL),
	(390, "periode1", "2", "1", "2", "1.2", "1-2", "Investasi Jangka Pendek", 21, "2023-01-16 10:52:12", "2023-01-17 14:52:18", "2023-01-17 14:52:18"),
	(396, "periode1", "5", "1.3.3.1", "1", "1.3.3.1.1", "1-3311", "Pengadaan/Pengembangan Aplikasi/Program", 21, "2023-01-16 11:09:51", "2023-01-16 11:09:51", NULL),
	(397, "periode1", "5", "1.3.3.2", "1", "1.3.3.2.1", "1-3321", "Pengadaan/Pengembangan Website", 21, "2023-01-16 11:10:27", "2023-01-16 11:10:27", NULL),
	(398, "periode1", "5", "1.3.3.3", "1", "1.3.3.3.1", "1-3331", "Pengadaan/Perpanjangan Lisensi", 21, "2023-01-16 11:10:56", "2023-01-16 11:10:56", NULL),
	(404, "periode1", "3", "1.1", "4", "1.1.4", "1-14", "Piutang Usaha BLU", 21, "2023-01-16 13:06:37", "2023-01-16 13:06:37", NULL),
	(405, "periode1", "5", "1.1.7.1", "1", "1.1.7.1.1", "1-1711", "Alat Tulis Kantor", 21, "2023-01-16 14:15:24", "2023-01-16 14:15:24", NULL),
	(406, "periode1", "5", "1.1.7.1", "2", "1.1.7.1.2", "1-1712", "Bahan Makanan", 21, "2023-01-16 14:15:24", "2023-01-16 14:15:24", NULL),
	(407, "periode1", "5", "1.1.7.1", "3", "1.1.7.1.3", "1-1713", "Barang Cetakan", 21, "2023-01-16 14:15:24", "2023-01-16 14:15:24", NULL),
	(408, "periode1", "5", "1.1.7.1", "4", "1.1.7.1.4", "1-1714", "Barang Komputer", 21, "2023-01-16 14:15:25", "2023-01-16 14:15:25", NULL),
	(409, "periode1", "5", "1.1.7.1", "5", "1.1.7.1.5", "1-1715", "Barang Teknik (Listrik)", 21, "2023-01-16 14:15:25", "2023-01-16 14:15:25", NULL),
	(410, "periode1", "5", "1.1.7.1", "6", "1.1.7.1.6", "1-1716", "Barang Tekstil", 21, "2023-01-16 14:15:25", "2023-01-16 14:15:25", NULL),
	(411, "periode1", "5", "1.1.7.1", "7", "1.1.7.1.7", "1-1717", "Alat/Bahan untuk Kegiatan Kantor Lainnya", 21, "2023-01-16 14:15:25", "2023-01-16 14:15:25", NULL),
	(413, "periode1", "6", "6.3.2.2.1", "1", "6.3.2.2.1.1", "6-32211", "Beban Langganan Telepon", 21, "2023-01-17 12:02:07", "2023-01-17 12:02:07", NULL),
	(414, "periode1", "6", "6.3.2.2.1", "2", "6.3.2.2.1.2", "6-32212", "Beban Langganan Air", 21, "2023-01-17 12:02:07", "2023-01-17 12:02:07", NULL),
	(415, "periode1", "6", "6.3.2.2.1", "3", "6.3.2.2.1.3", "6-32213", "Beban Langganan Daya dan Jasa Lainnya", 21, "2023-01-17 12:02:07", "2023-01-17 14:47:22", "2023-01-17 14:47:22"),
	(416, "periode1", "6", "1.1.7.1.1", "1", "1.1.7.1.1.1", "1-17111", "Hibah ATK", 21, "2023-01-17 12:03:04", "2023-01-17 12:03:04", NULL),
	(417, "periode1", "6", "1.1.7.1.1", "2", "1.1.7.1.1.2", "1-17112", "ATK yang belum dibayar", 21, "2023-01-17 12:03:04", "2023-01-17 12:03:04", NULL),
	(418, "periode1", "6", "1.1.7.1.2", "1", "1.1.7.1.2.1", "1-17121", "Hibah Bahan Makanan", 21, "2023-01-17 13:22:13", "2023-01-17 13:22:13", NULL),
	(419, "periode1", "6", "1.1.7.1.2", "2", "1.1.7.1.2.2", "1-17122", "Bahan Makanan yang belum dibayar", 21, "2023-01-17 13:22:14", "2023-01-17 13:22:14", NULL),
	(420, "periode1", "6", "1.1.7.1.3", "1", "1.1.7.1.3.1", "1-17131", "Hibah Barang Cetakan", 21, "2023-01-17 13:23:20", "2023-01-17 13:23:20", NULL),
	(421, "periode1", "6", "1.1.7.1.3", "2", "1.1.7.1.3.2", "1-17132", "Barang Cetakan yang belum dibayar", 21, "2023-01-17 13:23:20", "2023-01-17 13:23:20", NULL),
	(422, "periode1", "6", "1.1.7.1.4", "1", "1.1.7.1.4.1", "1-17141", "Hibah Barang Komputer", 21, "2023-01-17 13:24:40", "2023-01-17 13:24:40", NULL),
	(423, "periode1", "6", "1.1.7.1.4", "2", "1.1.7.1.4.2", "1-17142", "Barang Komputer yang belum dibayar", 21, "2023-01-17 13:24:40", "2023-01-17 13:24:40", NULL),
	(424, "periode1", "6", "1.1.7.1.5", "1", "1.1.7.1.5.1", "1-17151", "Hibah Barang Teknik (Listrik)", 21, "2023-01-17 13:25:24", "2023-01-17 13:25:24", NULL),
	(425, "periode1", "6", "1.1.7.1.5", "2", "1.1.7.1.5.2", "1-17152", "Barang Teknik (Listrik) yang belum dibayar", 21, "2023-01-17 13:25:24", "2023-01-17 13:25:24", NULL),
	(426, "periode1", "6", "1.1.7.1.6", "1", "1.1.7.1.6.1", "1-17161", "Hibah Barang Tekstil", 21, "2023-01-17 13:26:19", "2023-01-17 13:26:19", NULL),
	(427, "periode1", "6", "1.1.7.1.6", "2", "1.1.7.1.6.2", "1-17162", "Barang Tekstil yang belum dibayar", 21, "2023-01-17 13:26:19", "2023-01-17 13:26:19", NULL),
	(428, "periode1", "6", "1.1.7.1.7", "1", "1.1.7.1.7.1", "1-17171", "Hibah Alat/Bahan untuk Kegiatan Kantor Lainnya", 21, "2023-01-17 13:27:29", "2023-01-17 13:27:29", NULL),
	(429, "periode1", "6", "1.1.7.1.7", "2", "1.1.7.1.7.2", "1-17172", "Alat/Bahan untuk Kegiatan Kantor Lainnya yang belum dibayar", 21, "2023-01-17 13:27:29", "2023-01-17 13:27:29", NULL),
	(430, "periode1", "6", "1.1.7.2.1", "1", "1.1.7.2.1.1", "1-17211", "Hibah Barang Teknik (Bangunan)", 21, "2023-01-17 13:28:24", "2023-01-17 13:28:24", NULL),
	(431, "periode1", "6", "1.1.7.2.1", "2", "1.1.7.2.1.2", "1-17212", "Barang Teknik (Bangunan) yang belum dibayar", 21, "2023-01-17 13:28:25", "2023-01-17 13:28:25", NULL),
	(432, "periode1", "6", "1.1.7.2.2", "1", "1.1.7.2.2.1", "1-17221", "Hibah Kelontong", 21, "2023-01-17 13:29:32", "2023-01-17 13:29:32", NULL),
	(433, "periode1", "6", "1.1.7.2.2", "2", "1.1.7.2.2.2", "1-17222", "Kelontong yang belum dibayar", 21, "2023-01-17 13:29:32", "2023-01-17 13:29:32", NULL),
	(434, "periode1", "6", "1.1.7.3.1", "1", "1.1.7.3.1.1", "1-17311", "Hibah Barang Teknik (Bangunan) 2", 21, "2023-01-17 13:30:30", "2023-01-17 13:30:30", NULL),
	(435, "periode1", "6", "1.1.7.3.1", "2", "1.1.7.3.1.2", "1-17312", "Barang Teknik (Bangunan) 2 yang belum dibayar", 21, "2023-01-17 13:30:30", "2023-01-17 13:30:30", NULL),
	(436, "periode1", "6", "1.1.7.3.2", "1", "1.1.7.3.2.1", "1-17321", "Hibah Kelontong 2", 21, "2023-01-17 13:31:14", "2023-01-17 13:31:14", NULL),
	(437, "periode1", "6", "1.1.7.3.2", "2", "1.1.7.3.2.2", "1-17322", "Kelontong 2 yang belum dibayar", 21, "2023-01-17 13:31:14", "2023-01-17 13:31:14", NULL),
	(438, "periode1", "6", "1.1.7.4.1", "1", "1.1.7.4.1.1", "1-17411", "Hibah Alat Kesehatan Habis Pakai", 21, "2023-01-17 13:32:05", "2023-01-17 13:32:05", NULL),
	(439, "periode1", "6", "1.1.7.4.1", "2", "1.1.7.4.1.2", "1-17412", "Alat Kesehatan Habis Pakai yang belum dibayar", 21, "2023-01-17 13:32:05", "2023-01-17 13:32:05", NULL),
	(440, "periode1", "6", "1.1.7.5.1", "1", "1.1.7.5.1.1", "1-17511", "Hibah Obat-obatan", 21, "2023-01-17 13:33:16", "2023-01-17 13:33:16", NULL),
	(441, "periode1", "6", "1.1.7.5.1", "2", "1.1.7.5.1.2", "1-17512", "Obat-obatan yang belum dibayar", 21, "2023-01-17 13:33:16", "2023-01-17 13:33:16", NULL),
	(442, "periode1", "6", "1.1.7.5.1", "3", "1.1.7.5.1.3", "1-17513", "Transfer Masuk Obat-obatan", 21, "2023-01-17 13:33:16", "2023-01-17 13:33:16", NULL),
	(443, "periode1", "6", "1.1.7.5.2", "1", "1.1.7.5.2.1", "1-17521", "Hibah Pipa", 21, "2023-01-17 13:34:02", "2023-01-17 13:34:02", NULL),
	(444, "periode1", "6", "1.1.7.5.2", "2", "1.1.7.5.2.2", "1-17522", "Pipa yang belum dibayar", 21, "2023-01-17 13:34:02", "2023-01-17 13:34:02", NULL),
	(445, "periode1", "6", "6.3.2.2.1", "1", "6.3.2.2.1.1", "6-32211", "Beban Langganan Telepon", 21, "2023-01-17 13:38:38", "2023-01-17 14:46:54", "2023-01-17 14:46:54"),
	(446, "periode1", "6", "6.3.2.2.1", "2", "6.3.2.2.1.2", "6-32212", "Beban Langganan Air", 21, "2023-01-17 13:38:38", "2023-01-17 14:46:21", "2023-01-17 14:46:21"),
	(447, "periode1", "6", "6.3.2.2.1", "9", "6.3.2.2.1.9", "6-32219", "Beban Langganan Daya dan Jasa Lainnya", 21, "2023-01-17 13:38:38", "2023-01-17 13:38:38", NULL),
	(448, "periode1", "4", "1.1.4", "1", "1.1.4.1", "1-141", "Piutang dari Layanan Kesehatan Kepada Masyarakat", 21, "2023-01-17 13:40:17", "2023-01-17 13:40:17", NULL),
	(449, "periode1", "4", "1.1.4", "2", "1.1.4.2", "1-142", "Piutang dari Jasa Layanan Kepada Entitas Lain", 21, "2023-01-17 13:40:17", "2023-01-17 13:40:17", NULL),
	(450, "periode1", "4", "1.1.4", "3", "1.1.4.3", "1-143", "Piutang dari Hasil Kerja Sama", 21, "2023-01-17 13:40:17", "2023-01-17 13:40:17", NULL),
	(451, "periode1", "4", "1.1.4", "4", "1.1.4.4", "1-144", "Piutang Fungsional Lain BLU", 21, "2023-01-17 13:40:17", "2023-01-17 13:40:17", NULL),
	(452, "periode1", "4", "1.1.4", "5", "1.1.4.5", "1-145", "Akum. Penyisihan Kerugian Piutang Usaha BLU", 21, "2023-01-17 13:40:17", "2023-01-17 13:40:17", NULL),
	(453, "periode1", "5", "1.1.4.1", "1", "1.1.4.1.1", "1-1411", "Jaminan Perusahaan", 21, "2023-01-17 13:42:26", "2023-01-17 13:42:26", NULL),
	(454, "periode1", "5", "1.1.4.1", "2", "1.1.4.1.2", "1-1412", "Jaminan Rujukan ( TKIB )", 21, "2023-01-17 13:42:26", "2023-01-17 13:42:26", NULL),
	(455, "periode1", "5", "1.1.4.1", "3", "1.1.4.1.3", "1-1413", "Jaminan BPJS Kesehatan", 21, "2023-01-17 13:42:26", "2023-01-17 13:42:26", NULL),
	(456, "periode1", "5", "1.1.4.1", "4", "1.1.4.1.4", "1-1414", "Jamkesda", 21, "2023-01-17 13:42:26", "2023-01-17 13:42:26", NULL),
	(457, "periode1", "5", "1.1.4.1", "5", "1.1.4.1.5", "1-1415", "Pasien Non Jaminan", 21, "2023-01-17 13:42:26", "2023-01-17 13:42:26", NULL),
	(461, "periode1", "5", "1.1.4.2", "1", "1.1.4.2.1", "1-1421", "Piutang DIKLAT dari satu Kementerian", 21, "2023-01-17 13:45:41", "2023-01-17 13:45:41", NULL),
	(462, "periode1", "6", "1.1.4.2.1", "1", "1.1.4.2.1.1", "1-14211", "Piutang Pelayanan Kesehatan", 21, "2023-01-17 13:46:15", "2023-01-17 13:46:15", NULL),
	(463, "periode1", "6", "1.1.4.2.1", "2", "1.1.4.2.1.2", "1-14212", "Piutang DIKLAT dari Berbeda Kementerian", 21, "2023-01-17 13:46:15", "2023-01-17 13:46:15", NULL),
	(464, "periode1", "5", "1.1.4.3", "1", "1.1.4.3.1", "1-1431", "Piutang Hasil Kerjasama Perorangan", 21, "2023-01-17 13:47:49", "2023-01-17 13:47:49", NULL),
	(465, "periode1", "5", "1.1.4.3", "2", "1.1.4.3.2", "1-1432", "Piutang Hasil Kerjasama Lembaga/Badan Usaha", 21, "2023-01-17 13:47:49", "2023-01-17 13:47:49", NULL),
	(466, "periode1", "5", "1.1.4.3", "3", "1.1.4.3.3", "1-1433", "Piutang dari Rumah Duka", 21, "2023-01-17 13:47:49", "2023-01-17 13:47:49", NULL),
	(467, "periode1", "5", "1.1.4.3", "4", "1.1.4.3.4", "1-1434", "Piutang dari KOPMART KOPERASI", 21, "2023-01-17 13:47:49", "2023-01-17 13:47:49", NULL),
	(468, "periode1", "5", "1.1.4.3", "5", "1.1.4.3.5", "1-1435", "Piutang dari Sewa Lahan ATM", 21, "2023-01-17 13:47:49", "2023-01-17 13:47:49", NULL),
	(469, "periode1", "5", "1.1.4.4", "1", "1.1.4.4.1", "1-1441", "Piutang Diklat", 21, "2023-01-17 13:49:06", "2023-01-17 13:49:06", NULL),
	(470, "periode1", "5", "1.1.4.4", "2", "1.1.4.4.2", "1-1442", "Piutang Sewa Kantin", 21, "2023-01-17 13:49:06", "2023-01-17 13:49:06", NULL),
	(471, "periode1", "5", "1.1.4.4", "3", "1.1.4.4.3", "1-1443", "Piutang Sewa Bangunan & Lahan", 21, "2023-01-17 13:49:06", "2023-01-17 13:49:06", NULL),
	(472, "periode1", "5", "1.1.4.4", "4", "1.1.4.4.4", "1-1444", "Piutang Sewa Kendaraan", 21, "2023-01-17 13:49:06", "2023-01-17 13:49:06", NULL),
	(473, "periode1", "5", "1.1.4.4", "5", "1.1.4.4.5", "1-1445", "Piutang Fungsional Lainnya", 21, "2023-01-17 13:49:06", "2023-01-17 13:49:06", NULL),
	(474, "periode1", "6", "1.1.1.1.1", "1", "1.1.1.1.1.1", "1-11111", "Dana UP", 21, "2023-01-17 13:50:09", "2023-01-17 13:50:09", NULL),
	(475, "periode1", "6", "1.1.1.1.1", "2", "1.1.1.1.1.2", "1-11112", "Dana TUP", 21, "2023-01-17 13:50:09", "2023-01-17 13:50:09", NULL),
	(476, "periode1", "6", "1.1.1.1.3", "1", "1.1.1.1.3.1", "1-11131", "BRIVA (653134154541000) RM", 21, "2023-01-17 13:50:45", "2023-01-17 13:50:45", NULL),
	(477, "periode1", "3", "4.1", "2", "4.1.2", "4-12", "Dari Belanja Pegawai", 21, "2023-01-17 14:07:03", "2023-01-17 14:07:03", NULL),
	(478, "periode1", "3", "4.1", "3", "4.1.3", "4-13", "Dari Belanja Barang", 21, "2023-01-17 14:07:03", "2023-01-17 14:07:03", NULL),
	(479, "periode1", "3", "4.1", "4", "4.1.4", "4-14", "Dari Belanja Modal", 21, "2023-01-17 14:07:03", "2023-01-17 14:07:03", NULL);

/*!40000 ALTER TABLE `coa` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table histori_itemsv3rkakl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `histori_itemsv3rkakl`;

CREATE TABLE `histori_itemsv3rkakl` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `itemsv3rkakl_id` bigint unsigned DEFAULT NULL,
  `revisi` bigint DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `volume` bigint DEFAULT NULL,
  `satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_satuan` bigint DEFAULT NULL,
  `jumlah_biaya` bigint DEFAULT NULL,
  `biaya_publish` bigint DEFAULT NULL,
  `master_biaya_publish` bigint DEFAULT NULL,
  `is_actived` int DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `histori_itemsv3rkakl_itemsv3rkakl_id_foreign` (`itemsv3rkakl_id`),
  KEY `histori_itemsv3rkakl_user_id_foreign` (`user_id`),
  CONSTRAINT `histori_itemsv3rkakl_itemsv3rkakl_id_foreign` FOREIGN KEY (`itemsv3rkakl_id`) REFERENCES `itemsv3rkakl` (`id`),
  CONSTRAINT `histori_itemsv3rkakl_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table hutang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hutang`;

CREATE TABLE `hutang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_checklist` bigint unsigned NOT NULL,
  `id_coa` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hutang_id_checklist_foreign` (`id_checklist`),
  KEY `hutang_id_coa_foreign` (`id_coa`),
  KEY `hutang_user_id_foreign` (`user_id`),
  CONSTRAINT `hutang_id_checklist_foreign` FOREIGN KEY (`id_checklist`) REFERENCES `checklist` (`id`),
  CONSTRAINT `hutang_id_coa_foreign` FOREIGN KEY (`id_coa`) REFERENCES `coa` (`id`),
  CONSTRAINT `hutang_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table hutang_item_belanja
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hutang_item_belanja`;

CREATE TABLE `hutang_item_belanja` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_hutang_manual` bigint unsigned DEFAULT NULL,
  `id_itemsrkaklakun` bigint unsigned DEFAULT NULL,
  `id_itemsrkaklitem` bigint unsigned DEFAULT NULL,
  `nominal_pagu_saat_itu` bigint DEFAULT NULL,
  `nominal_belanja` bigint DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `hutang_item_belanja_id_hutang_manual_foreign` (`id_hutang_manual`),
  KEY `hutang_item_belanja_id_itemsrkaklakun_foreign` (`id_itemsrkaklakun`),
  KEY `hutang_item_belanja_id_itemsrkaklitem_foreign` (`id_itemsrkaklitem`),
  KEY `hutang_item_belanja_user_id_foreign` (`user_id`),
  CONSTRAINT `hutang_item_belanja_id_hutang_manual_foreign` FOREIGN KEY (`id_hutang_manual`) REFERENCES `hutang_manual` (`id`),
  CONSTRAINT `hutang_item_belanja_id_itemsrkaklakun_foreign` FOREIGN KEY (`id_itemsrkaklakun`) REFERENCES `itemsv3rkakl` (`id`),
  CONSTRAINT `hutang_item_belanja_id_itemsrkaklitem_foreign` FOREIGN KEY (`id_itemsrkaklitem`) REFERENCES `itemsv3rkakl` (`id`),
  CONSTRAINT `hutang_item_belanja_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table hutang_manual
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hutang_manual`;

CREATE TABLE `hutang_manual` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tanggal_input` date DEFAULT NULL,
  `id_coa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_hutang_manual` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nama_pekerjaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jenis_pekerjaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metode_pembayaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terminke` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_by` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal_transfer` date DEFAULT NULL,
  `nama_penyedia` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `identitas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'spk / kontrak',
  `nomor_kontrak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_kontrak` date DEFAULT NULL,
  `nominal_kontrak` bigint DEFAULT NULL,
  `durasi_pekerjaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `file_kontrak` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nomor_kwitansi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_kwitansi` date DEFAULT NULL,
  `nominal_kwitansi` bigint DEFAULT NULL,
  `file_kwitansi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `efaktur` json DEFAULT NULL,
  `bast` json DEFAULT NULL,
  `invoice` json DEFAULT NULL,
  `suratjalan` json DEFAULT NULL,
  `sudahdibayar` int DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hutang_manual_user_id_foreign` (`user_id`),
  CONSTRAINT `hutang_manual_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table itemsv3rkakl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `itemsv3rkakl`;

CREATE TABLE `itemsv3rkakl` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `masterv3rkakl_id` bigint unsigned NOT NULL,
  `levelrkakl_id` bigint unsigned NOT NULL,
  `urutan_head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urutan_child` bigint DEFAULT NULL,
  `urutan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urutan_char` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_revisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `volume` float DEFAULT NULL,
  `satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_satuan` bigint DEFAULT NULL,
  `jumlah_biaya` bigint DEFAULT NULL,
  `biaya_publish` bigint DEFAULT NULL,
  `master_biaya_publish` bigint DEFAULT NULL,
  `is_actived` int DEFAULT NULL,
  `is_used` int DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemsv3rkakl_masterv3rkakl_id_foreign` (`masterv3rkakl_id`),
  KEY `itemsv3rkakl_levelrkakl_id_foreign` (`levelrkakl_id`),
  KEY `itemsv3rkakl_user_id_foreign` (`user_id`),
  CONSTRAINT `itemsv3rkakl_levelrkakl_id_foreign` FOREIGN KEY (`levelrkakl_id`) REFERENCES `level_rkakl` (`id`),
  CONSTRAINT `itemsv3rkakl_masterv3rkakl_id_foreign` FOREIGN KEY (`masterv3rkakl_id`) REFERENCES `masterv3rkakl` (`id`),
  CONSTRAINT `itemsv3rkakl_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=534 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `itemsv3rkakl` WRITE;
/*!40000 ALTER TABLE `itemsv3rkakl` DISABLE KEYS */;

INSERT INTO `itemsv3rkakl` (`id`, `masterv3rkakl_id`, `levelrkakl_id`, `urutan_head`, `urutan_child`, `urutan`, `urutan_char`, `revisi`, `status_revisi`, `kode`, `deskripsi`, `volume`, `satuan`, `harga_satuan`, `jumlah_biaya`, `biaya_publish`, `master_biaya_publish`, `is_actived`, `is_used`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, NULL, 1, "1", "1", "0", "0", "024.04.DG", "Program Pelayanan Kesehatan dan JKN", 0, NULL, 0, 66442080314, 66442083000, 66442083000, 0, NULL, 10, "2023-01-10 10:00:59", "2023-08-29 10:49:37", NULL),
	(2, 1, 2, "1", 1, "1.1", "11", "0", "0", "6388", "Dukungan Pelayanan Kesehatan Unit Pelaksana Teknis Ditjen Pelayanan Kesehatan", 0, NULL, 0, 66442080314, 66442083000, 66442083000, 0, NULL, 10, "2023-01-10 10:02:31", "2023-08-29 10:49:37", NULL),
	(3, 1, 3, "1.1", 1, "1.1.1", "111", "0", "0", "6388.ADE", "Akreditasi Lembaga", 1, "Lembaga", 0, 150000000, 150000000, 150000000, 0, NULL, 10, "2023-01-10 10:43:14", "2023-01-10 11:09:26", NULL),
	(4, 1, 4, "1.1.1", 1, "1.1.1.1", "1111", "0", "0", "6388.ADE.001", "Akreditasi Rumah Sakit", 1, "Unit_kerja", 0, 150000000, 150000000, 150000000, 0, NULL, 10, "2023-01-10 10:44:22", "2023-01-10 11:09:40", NULL),
	(5, 1, 5, "1.1.1.1", 1, "1.1.1.1.1", "11111", "0", "0", "052", "Layanan Akreditasi Rumah Sakit-BLU", 0, NULL, 0, 150000000, 150000000, 150000000, 0, NULL, 10, "2023-01-10 10:59:17", "2023-01-10 10:59:17", NULL),
	(6, 1, 6, "1.1.1.1.1", 1, "1.1.1.1.1.1", "111111", "0", "0", "A", "Akreditasi Rumah Sakit-BLU", 0, NULL, 0, 150000000, 150000000, 150000000, 0, NULL, 10, "2023-01-10 11:00:01", "2023-01-10 11:00:01", NULL),
	(7, 1, 7, "1.1.1.1.1.1", 1, "1.1.1.1.1.1.1", "1111111", "0", "0", "525119", "Belanja Penyediaan Barang dan Jasa BLU Lainnya", 0, NULL, 0, 150000000, 150000000, 150000000, 0, NULL, 10, "2023-01-10 11:05:59", "2023-01-10 11:05:59", NULL),
	(8, 1, 8, "1.1.1.1.1.1.1", 1, "1.1.1.1.1.1.1.1", "11111111", "0", "0", "6388.ADE.001/052/A/525119", "Kegiatan Akreditasi Rumah Sakit - Kegiatan Verifikasi Akreditasi", 1, "Tahun", 100860000, 100860000, 100860000, 100860000, 0, NULL, 10, "2023-01-10 11:15:25", "2023-01-10 11:15:25", NULL),
	(9, 1, 8, "1.1.1.1.1.1.1", 2, "1.1.1.1.1.1.1.2", "11111112", "0", "0", "6388.ADE.001/052/A/525119", "Kegiatan Akreditasi Rumah Sakit - Bimbingan Teknis Akreditasi", 1, "Tahun", 39640000, 39640000, 39640000, 39640000, 0, NULL, 10, "2023-01-10 11:39:11", "2023-07-17 09:25:01", NULL),
	(10, 1, 8, "1.1.1.1.1.1.1", 3, "1.1.1.1.1.1.1.3", "11111113", "0", "0", "6388.ADE.001/052/A/525119", "Kegiatan Akreditasi Rumah Sakit - Pelatihan Akreditasi", 1, "Tahun", 9500000, 9500000, 9500000, 9500000, 0, NULL, 10, "2023-01-10 11:41:04", "2023-08-29 10:49:37", NULL),
	(11, 1, 3, "1.1", 2, "1.1.2", "112", "0", "0", "6388.BJB", "Penyidikan dan Pengujian Peralatan", 1, "Unit", 0, 919641000, 919641000, 919641000, 0, NULL, 10, "2023-01-10 11:48:51", "2023-01-10 11:48:51", NULL),
	(12, 1, 4, "1.1.2", 1, "1.1.2.1", "1121", "0", "0", "6388.BJB.001", "Layanan Pengujian Kalibrasi dan Proteksi Radiasi", 1, "Unit", 0, 919641000, 919641000, 919641000, 0, NULL, 10, "2023-01-10 11:50:01", "2023-01-10 11:50:01", NULL),
	(13, 1, 5, "1.1.2.1", 1, "1.1.2.1.1", "11211", "0", "0", "051", "Layanan Pengujian Alat dan Proteksi Radiasi", 0, NULL, 0, 919641000, 919641000, 919641000, 0, NULL, 10, "2023-01-10 11:50:41", "2023-01-10 11:50:41", NULL),
	(14, 1, 6, "1.1.2.1.1", 1, "1.1.2.1.1.1", "112111", "0", "0", "A", "Layanan Pengujian Alat dan Proteksi Radiasi", 0, NULL, 0, 919641000, 919641000, 919641000, 0, NULL, 10, "2023-01-10 11:51:26", "2023-01-10 11:51:26", NULL),
	(15, 1, 7, "1.1.2.1.1.1", 1, "1.1.2.1.1.1.1", "1121111", "0", "0", "523121", "Belanja Pemeliharaan Peralatan dan Mesin", 0, NULL, 0, 919641000, 919641000, 919641000, 0, NULL, 10, "2023-01-10 11:52:10", "2023-01-10 11:52:10", NULL),
	(16, 1, 8, "1.1.2.1.1.1.1", 1, "1.1.2.1.1.1.1.1", "11211111", "0", "0", "6388.BJB.001/051/A/523121", "Biaya Pemeliharaan dan Operasional Alat Medis dan Kalibrasi - Kalibrasi Alat Medis", 1, "Tahun", 157556000, 157556000, 157556000, 157556000, 0, NULL, 10, "2023-01-10 11:53:33", "2023-01-10 11:53:33", NULL),
	(17, 1, 8, "1.1.2.1.1.1.1", 2, "1.1.2.1.1.1.1.2", "11211112", "0", "0", "6388.BJB.001/051/A/523121", "Biaya Pemeliharaan dan Operasional Alat Medis dan Kalibrasi - Kalibrasi Alat Ukur", 1, "Tahun", 6999000, 6999000, 6999000, 6999000, 0, NULL, 10, "2023-01-10 12:04:40", "2023-01-10 12:04:40", NULL),
	(18, 1, 8, "1.1.2.1.1.1.1", 3, "1.1.2.1.1.1.1.3", "11211113", "0", "0", "6388.BJB.001/051/A/523121", "Biaya Pemeliharaan dan Operasional Alat Medis dan Kalibrasi - Pemeliharaan Operasional dan Perbaikan Alat Medis", 1, "Tahun", 755086000, 755086000, 755086000, 755086000, 0, NULL, 10, "2023-01-10 12:06:35", "2023-08-29 10:49:38", NULL),
	(19, 1, 3, "1.1", 3, "1.1.3", "113", "0", "0", "6388.CAB", "Sarana Bidang Kesehatan", 33, "PKT", 0, 15296922000, 15296922000, 15296922000, 0, NULL, 10, "2023-01-10 14:25:27", "2023-01-10 14:25:27", NULL),
	(20, 1, 4, "1.1.3", 1, "1.1.3.1", "1131", "0", "0", "6388.CAB.002", "Alat Kesehatan", 27, "PKT", 0, 5216136000, 5216136000, 5216136000, 0, NULL, 10, "2023-01-10 14:26:17", "2023-01-10 14:26:17", NULL),
	(21, 1, 5, "1.1.3.1", 1, "1.1.3.1.1", "11311", "0", "0", "052", "Pengadaan Alat Kesehatan Pelayanan Reguler-BLU", 0, NULL, 0, 5216136000, 5216136000, 5216136000, 0, NULL, 10, "2023-01-10 14:27:05", "2023-01-10 14:27:05", NULL),
	(22, 1, 6, "1.1.3.1.1", 1, "1.1.3.1.1.1", "113111", "0", "0", "A", "Alat Kesehatan Pelayanan Reguler-BLU", 0, NULL, 0, 5216136000, 5216136000, 5216136000, 0, NULL, 10, "2023-01-10 14:28:16", "2023-01-10 14:28:16", NULL),
	(23, 1, 7, "1.1.3.1.1.1", 1, "1.1.3.1.1.1.1", "1131111", "0", "0", "537112", "Belanja Modal Peralatan dan Mesin BLU", 0, NULL, 0, 5216136000, 5216136000, 5216136000, 0, NULL, 10, "2023-01-10 14:28:53", "2023-01-10 14:28:53", NULL),
	(24, 1, 8, "1.1.3.1.1.1.1", 1, "1.1.3.1.1.1.1.1", "11311111", "0", "0", "6388.CAB.002/052/A/537112", "Mesin Anestesi Ventilator", 1, "Unit", 754619000, 754619000, 754619000, 754619000, 0, NULL, 10, "2023-01-10 14:30:42", "2023-07-04 09:44:29", "2023-07-04 09:44:29"),
	(25, 1, 8, "1.1.3.1.1.1.1", 2, "1.1.3.1.1.1.1.2", "11311112", "0", "0", "6388.CAB.002/052/A/537112", "Bed Side Monitor / Bed Patient Monitor / Patient Monitor", 3, "Unit", 150700000, 452100000, 452100000, 452100000, 0, NULL, 10, "2023-01-10 14:31:24", "2023-07-04 09:44:46", "2023-07-04 09:44:46"),
	(26, 1, 8, "1.1.3.1.1.1.1", 3, "1.1.3.1.1.1.1.3", "11311113", "0", "0", "6388.CAB.002/052/A/537112", "Microsurgical Instrument", 1, "Unit", 99307000, 99307000, 99307000, 99307000, 0, NULL, 10, "2023-01-10 14:31:58", "2023-07-04 09:44:58", "2023-07-04 09:44:58"),
	(27, 1, 8, "1.1.3.1.1.1.1", 4, "1.1.3.1.1.1.1.4", "11311114", "1", "0", "6388.CAB.002/052/A/537112", "X-Ray Film Viewer", 1, "Unit", 5317000, 5317000, 5317000, 5317000, 0, NULL, 10, "2023-01-10 14:32:38", "2023-07-04 09:45:44", NULL),
	(28, 1, 8, "1.1.3.1.1.1.1", 5, "1.1.3.1.1.1.1.5", "11311115", "0", "0", "6388.CAB.002/052/A/537112", "Operating Table Electric", 1, "Unit", 366300000, 366300000, 366300000, 366300000, 0, NULL, 10, "2023-01-10 14:39:46", "2023-07-04 09:46:19", "2023-07-04 09:46:19"),
	(29, 1, 8, "1.1.3.1.1.1.1", 6, "1.1.3.1.1.1.1.6", "11311116", "0", "0", "6388.CAB.002/052/A/537112", "Infusion Pump", 2, "Unit", 28255000, 56510000, 56510000, 56510000, 0, NULL, 10, "2023-01-10 14:40:20", "2023-07-04 09:46:36", "2023-07-04 09:46:36"),
	(30, 1, 8, "1.1.3.1.1.1.1", 7, "1.1.3.1.1.1.1.7", "11311117", "0", "0", "6388.CAB.002/052/A/537112", "Uv Sterilizer", 1, "Unit", 14300000, 14300000, 14300000, 14300000, 0, NULL, 10, "2023-01-10 14:40:52", "2023-07-04 09:46:47", "2023-07-04 09:46:47"),
	(31, 1, 8, "1.1.3.1.1.1.1", 8, "1.1.3.1.1.1.1.8", "11311118", "0", "0", "6388.CAB.002/052/A/537112", "Sectio Caesarian Set", 1, "Unit", 120934000, 120934000, 120934000, 120934000, 0, NULL, 10, "2023-01-10 14:41:25", "2023-07-04 09:46:58", "2023-07-04 09:46:58"),
	(32, 1, 8, "1.1.3.1.1.1.1", 9, "1.1.3.1.1.1.1.9", "11311119", "0", "0", "6388.CAB.002/052/A/537112", "Suction", 2, "Unit", 33895000, 67790000, 67790000, 67790000, 0, NULL, 10, "2023-01-10 14:42:05", "2023-07-04 09:47:10", "2023-07-04 09:47:10"),
	(33, 1, 8, "1.1.3.1.1.1.1", 10, "1.1.3.1.1.1.1.10", "113111110", "0", "0", "6388.CAB.002/052/A/537112", "Nebulizer", 2, "Unit", 12848000, 25696000, 25696000, 25696000, 0, NULL, 10, "2023-01-10 14:42:46", "2023-07-04 09:47:21", "2023-07-04 09:47:21"),
	(34, 1, 8, "1.1.3.1.1.1.1", 11, "1.1.3.1.1.1.1.11", "113111111", "0", "0", "6388.CAB.002/052/A/537112", "Hecting Set", 1, "Unit", 10989000, 10989000, 10989000, 10989000, 0, NULL, 10, "2023-01-10 14:43:52", "2023-07-04 09:47:32", "2023-07-04 09:47:32"),
	(35, 1, 8, "1.1.3.1.1.1.1", 12, "1.1.3.1.1.1.1.12", "113111112", "0", "0", "6388.CAB.002/052/A/537112", "Microscopes and Accessories / Mikroskop", 1, "Unit", 23251000, 23251000, 23251000, 23251000, 0, NULL, 10, "2023-01-10 14:45:19", "2023-08-29 10:49:38", NULL),
	(36, 1, 8, "1.1.3.1.1.1.1", 13, "1.1.3.1.1.1.1.13", "113111113", "2", "0", "6388.CAB.002/052/A/537112", "Blood Storage Refrigerator", 1, "Unit", 150000000, 150000000, 150000000, 150000000, 0, NULL, 10, "2023-01-10 14:45:52", "2023-07-04 10:02:10", NULL),
	(37, 1, 8, "1.1.3.1.1.1.1", 14, "1.1.3.1.1.1.1.14", "113111114", "1", "0", "6388.CAB.002/052/A/537112", "Autoclave", 1, "Unit", 53260000, 53260000, 53260000, 53260000, 0, NULL, 10, "2023-01-10 14:46:20", "2023-08-24 13:22:40", NULL),
	(38, 1, 8, "1.1.3.1.1.1.1", 15, "1.1.3.1.1.1.1.15", "113111115", "0", "0", "6388.CAB.002/052/A/537112", "Electric Tube Sealer", 1, "Unit", 46088000, 46088000, 46088000, 46088000, 0, NULL, 10, "2023-01-10 14:46:49", "2023-08-29 10:49:38", NULL),
	(39, 1, 8, "1.1.3.1.1.1.1", 16, "1.1.3.1.1.1.1.16", "113111116", "1", "0", "6388.CAB.002/052/A/537112", "Id-Centrifuge", 1, "Unit", 91575000, 91575000, 91575000, 91575000, 0, NULL, 10, "2023-01-10 14:47:17", "2023-08-24 13:22:40", NULL),
	(40, 1, 8, "1.1.3.1.1.1.1", 17, "1.1.3.1.1.1.1.17", "113111117", "1", "0", "6388.CAB.002/052/A/537112", "Centrifuge tabung darah vacutainer", 1, "Unit", 65100000, 65100000, 65100000, 65100000, 0, NULL, 10, "2023-01-10 14:48:21", "2023-08-29 10:49:38", NULL),
	(41, 1, 8, "1.1.3.1.1.1.1", 18, "1.1.3.1.1.1.1.18", "113111118", "1", "0", "6388.CAB.002/052/A/537112", "Medical Deep Freezer", 1, "Unit", 265867000, 265867000, 265867000, 265867000, 0, NULL, 10, "2023-01-10 14:48:50", "2023-08-29 10:49:38", NULL),
	(42, 1, 8, "1.1.3.1.1.1.1", 19, "1.1.3.1.1.1.1.19", "113111119", "0", "0", "6388.CAB.002/052/A/537112", "Automated Hematology Alayzer", 1, "Unit", 255306000, 255306000, 255306000, 255306000, 0, NULL, 10, "2023-01-10 14:49:18", "2023-08-29 10:49:38", NULL),
	(43, 1, 8, "1.1.3.1.1.1.1", 20, "1.1.3.1.1.1.1.20", "113111120", "0", "0", "6388.CAB.002/052/A/537112", "Platelet Agitator", 1, "Unit", 46123000, 46123000, 46123000, 46123000, 0, NULL, 10, "2023-01-10 14:49:49", "2023-08-29 10:49:38", NULL),
	(44, 1, 8, "1.1.3.1.1.1.1", 21, "1.1.3.1.1.1.1.21", "113111121", "0", "0", "6388.CAB.002/052/A/537112", "Automated Blood Coagulation Analyzer", 1, "Unit", 492297000, 492297000, 492297000, 492297000, 0, NULL, 10, "2023-01-10 14:50:18", "2023-08-29 10:49:38", NULL),
	(45, 1, 8, "1.1.3.1.1.1.1", 22, "1.1.3.1.1.1.1.22", "113111122", "0", "0", "6388.CAB.002/052/A/537112", "Micropipette Adjustable volume 1 - 10 ul", 1, "Unit", 4485000, 4485000, 4485000, 4485000, 0, NULL, 10, "2023-01-10 14:50:49", "2023-08-29 10:49:38", NULL),
	(46, 1, 4, "1.1.3", 2, "1.1.3.2", "1132", "0", "0", "6388.CAB.003", "Obat-obatan dan BMHP", 6, "PKT", 0, 10080786000, 10080786000, 10080786000, 0, NULL, 10, "2023-01-10 14:53:38", "2023-01-10 14:53:38", NULL),
	(47, 1, 5, "1.1.3.2", 1, "1.1.3.2.1", "11321", "0", "0", "051", "Pengadaan Obat-obatan dan BMHP Pelayanan Reguler", 0, NULL, 0, 5864354000, 5864354000, 5864354000, 0, NULL, 10, "2023-01-10 14:54:33", "2023-01-10 14:54:33", NULL),
	(48, 1, 6, "1.1.3.2.1", 1, "1.1.3.2.1.1", "113211", "0", "0", "A", "Obat-obatan dan BMHP", 0, NULL, 0, 5864354000, 5864354000, 5864354000, 0, NULL, 10, "2023-01-10 14:55:03", "2023-01-10 14:55:03", NULL),
	(49, 1, 7, "1.1.3.2.1.1", 1, "1.1.3.2.1.1.1", "1132111", "0", "0", "521811", "Belanja Barang Persediaan Barang Konsumsi", 0, NULL, 0, 5464354000, 5464354000, 5464354000, 0, NULL, 10, "2023-01-10 14:55:51", "2023-01-10 14:55:51", NULL),
	(50, 1, 8, "1.1.3.2.1.1.1", 1, "1.1.3.2.1.1.1.1", "11321111", "0", "0", "6388.CAB.003/051/A/521811", "Bahan Medis Habis Pakai", 1, "PKT", 426620000, 426620000, 426620000, 426620000, 0, NULL, 10, "2023-01-10 14:57:17", "2023-08-29 10:49:38", NULL),
	(51, 1, 8, "1.1.3.2.1.1.1", 2, "1.1.3.2.1.1.1.2", "11321112", "0", "0", "6388.CAB.003/051/A/521811", "Obat-obatan - Obat-obatan Psikiatri", 1, "PKT", 3030054000, 3030054000, 3030054000, 3030054000, 0, NULL, 10, "2023-01-10 14:58:49", "2023-09-12 15:00:19", NULL),
	(52, 1, 8, "1.1.3.2.1.1.1", 3, "1.1.3.2.1.1.1.3", "11321113", "0", "0", "6388.CAB.003/051/A/521811", "Obat-obatan - Obat-obatan Non Psikiatri", 1, "PKT", 592882000, 592882000, 592882000, 592882000, 0, NULL, 10, "2023-01-10 14:59:39", "2023-08-29 10:49:38", NULL),
	(53, 1, 8, "1.1.3.2.1.1.1", 4, "1.1.3.2.1.1.1.4", "11321114", "0", "0", "6388.CAB.003/051/A/521811", "Obat-obatan - Automatic Adjustment", 1, "PKT", 1414798000, 1414798000, 1414798000, 1414798000, 0, NULL, 10, "2023-01-10 15:00:41", "2023-01-10 15:03:44", NULL),
	(54, 1, 7, "1.1.3.2.1.1", 2, "1.1.3.2.1.1.2", "1132112", "0", "0", "521841", "Belanja Barang Persediaan - Penanganan Pandemi COVID-19", 0, NULL, 0, 400000000, 400000000, 400000000, 0, NULL, 10, "2023-01-10 15:05:13", "2023-01-10 15:05:13", NULL),
	(55, 1, 8, "1.1.3.2.1.1.2", 1, "1.1.3.2.1.1.2.1", "11321121", "0", "0", "6388.CAB.003/051/A/521841", "Obat-obatan Covid-19", 1, "PKT", 150000000, 150000000, 150000000, 150000000, 0, NULL, 10, "2023-01-10 15:06:01", "2023-08-29 10:49:38", NULL),
	(56, 1, 8, "1.1.3.2.1.1.2", 2, "1.1.3.2.1.1.2.2", "11321122", "0", "0", "6388.CAB.003/051/A/521841", "Bahan Medis Habis Pakai Covid-19", 1, "PKT", 250000000, 250000000, 250000000, 250000000, 0, NULL, 10, "2023-01-10 15:06:47", "2023-01-10 15:06:47", NULL),
	(57, 1, 5, "1.1.3.2", 2, "1.1.3.2.2", "11322", "0", "0", "052", "Pengadaan Obat-obatan dan BMHP Pelayanan Reguler - BLU", 0, NULL, 0, 4216432000, 4216432000, 4216432000, 0, NULL, 10, "2023-01-10 15:08:41", "2023-01-10 15:08:41", NULL),
	(58, 1, 6, "1.1.3.2.2", 1, "1.1.3.2.2.1", "113221", "0", "0", "A", "Obat-obatan dan BMHP Pelayanan Reguler - BLU", 0, NULL, 0, 4216432000, 4216432000, 4216432000, 0, NULL, 10, "2023-01-10 15:09:43", "2023-01-10 15:09:43", NULL),
	(59, 1, 7, "1.1.3.2.2.1", 1, "1.1.3.2.2.1.1", "1132211", "0", "0", "525121", "Belanja Barang Persediaan Barang Konsumsi - BLU", 0, NULL, 0, 4216432000, 4216432000, 4216432000, 0, NULL, 10, "2023-01-10 15:11:12", "2023-01-10 15:11:12", NULL),
	(60, 1, 8, "1.1.3.2.2.1.1", 1, "1.1.3.2.2.1.1.1", "11322111", "1", "0", "6388.CAB.003/052/A/525121", "Obat-obatan Psikiatri", 1, "PKT", 4216432000, 4216432000, 4216432000, 4216432000, 0, NULL, 10, "2023-01-10 15:12:13", "2023-09-12 14:00:04", NULL),
	(61, 1, 3, "1.1", 4, "1.1.4", "114", "0", "0", "6388.CAN", "Sarana Bidang Teknologi Informasi dan Komunikasi", 31, "Unit", 0, 409390000, 409390000, 409390000, 0, NULL, 10, "2023-01-10 15:14:52", "2023-01-10 15:14:52", NULL),
	(62, 1, 4, "1.1.4", 1, "1.1.4.1", "1141", "0", "0", "6388.CAN.001", "Perangkat Pengolah Data dan Informasi", 31, "Unit", 0, 409390000, 409390000, 409390000, 0, NULL, 10, "2023-01-10 15:16:38", "2023-01-10 15:16:38", NULL),
	(63, 1, 5, "1.1.4.1", 1, "1.1.4.1.1", "11411", "0", "0", "052", "Pengadaan Perangkat Pengolah Data dan Informasi RS/Balai - BLU", 0, NULL, 0, 409390000, 409390000, 409390000, 0, NULL, 10, "2023-01-10 15:17:33", "2023-01-10 15:17:33", NULL),
	(64, 1, 6, "1.1.4.1.1", 1, "1.1.4.1.1.1", "114111", "0", "0", "A", "Perangkat Pengolah Data dan Informasi RS/Balai", 0, NULL, 0, 409390000, 409390000, 409390000, 0, NULL, 10, "2023-01-10 15:18:24", "2023-01-10 15:18:24", NULL),
	(65, 1, 7, "1.1.4.1.1.1", 1, "1.1.4.1.1.1.1", "1141111", "0", "0", "537112", "Belanja Modal Peralatan dan Mesin - BLU", 0, NULL, 0, 409390000, 409390000, 409390000, 0, NULL, 10, "2023-01-10 15:19:08", "2023-01-10 15:19:08", NULL),
	(66, 1, 8, "1.1.4.1.1.1.1", 1, "1.1.4.1.1.1.1.1", "11411111", "0", "0", "6388.CAN.001/052/A/537112", "Hardisk Eksternal 2 TB", 2, "Unit", 1249000, 2498000, 2498000, 2498000, 0, NULL, 10, "2023-01-10 15:19:56", "2023-01-10 15:19:56", NULL),
	(67, 1, 8, "1.1.4.1.1.1.1", 2, "1.1.4.1.1.1.1.2", "11411112", "0", "0", "6388.CAN.001/052/A/537112", "Hardisk External 5TB", 2, "Unit", 4389500, 8779000, 8779000, 8779000, 0, NULL, 10, "2023-01-10 15:20:27", "2023-09-07 12:00:40", NULL),
	(68, 1, 8, "1.1.4.1.1.1.1", 3, "1.1.4.1.1.1.1.3", "11411113", "0", "0", "6388.CAN.001/052/A/537112", "Komputer", 2, "Unit", 45212500, 90425000, 90425000, 90425000, 0, NULL, 10, "2023-01-10 15:21:02", "2023-01-10 15:21:02", NULL),
	(69, 1, 8, "1.1.4.1.1.1.1", 4, "1.1.4.1.1.1.1.4", "11411114", "0", "0", "6388.CAN.001/052/A/537112", "Komputer", 6, "Unit", 18676000, 112056000, 112056000, 112056000, 0, NULL, 10, "2023-01-10 15:22:27", "2023-01-10 15:22:27", NULL),
	(70, 1, 8, "1.1.4.1.1.1.1", 5, "1.1.4.1.1.1.1.5", "11411115", "0", "0", "6388.CAN.001/052/A/537112", "Laptop", 5, "Unit", 28580000, 142900000, 142900000, 142900000, 0, NULL, 10, "2023-01-10 15:22:57", "2023-01-10 15:22:57", NULL),
	(71, 1, 8, "1.1.4.1.1.1.1", 6, "1.1.4.1.1.1.1.6", "11411116", "0", "0", "6388.CAN.001/052/A/537112", "Printer", 6, "Unit", 2802000, 16812000, 16812000, 16812000, 0, NULL, 10, "2023-01-10 15:23:33", "2023-01-10 15:23:33", NULL),
	(72, 1, 8, "1.1.4.1.1.1.1", 7, "1.1.4.1.1.1.1.7", "11411117", "0", "0", "6388.CAN.001/052/A/537112", "Scanner", 8, "Unit", 4490000, 35920000, 35920000, 35920000, 0, NULL, 10, "2023-01-10 15:24:02", "2023-01-10 15:24:02", NULL),
	(73, 1, 1, NULL, 2, "2", "2", "0", "0", "024.04.WA", "Program Dukungan manajemen", 0, NULL, 0, 57435179000, 57435179000, 57435179000, 0, NULL, 20, "2023-01-10 15:54:50", "2023-01-10 15:54:50", NULL),
	(74, 1, 2, "2", 1, "2.1", "21", "0", "0", "4813", "Dukungan Manajemen Pelaksanaan Program di Ditjen Pelayanan Kesehatan", 0, NULL, 0, 57435179000, 57435179000, 57435179000, 0, NULL, 20, "2023-01-10 15:56:15", "2023-01-10 15:56:15", NULL),
	(75, 1, 3, "2.1", 1, "2.1.1", "211", "0", "0", "4813.EBA", "Layanan Dukungan Manajemen Internal", 2, "Layanan", 0, 57435179000, 57435179000, 57435179000, 0, NULL, 20, "2023-01-10 15:57:22", "2023-01-10 15:57:22", NULL),
	(76, 1, 4, "2.1.1", 1, "2.1.1.1", "2111", "0", "0", "4813.EBA.994", "Layanan Perkantoran", 2, "Layanan", 0, 57435179000, 57435179000, 57435179000, 0, NULL, 20, "2023-01-10 15:58:15", "2023-01-10 15:58:15", NULL),
	(77, 1, 5, "2.1.1.1", 1, "2.1.1.1.1", "21111", "0", "0", "001", "Gaji dan Tunjangan", 0, NULL, 0, 26374590000, 26374590000, 26374590000, 0, NULL, 20, "2023-01-10 15:59:17", "2023-01-10 15:59:17", NULL),
	(78, 1, 6, "2.1.1.1.1", 1, "2.1.1.1.1.1", "211111", "0", "0", "A", "Gaji dan Tunjangan", 0, NULL, 0, 26374590000, 26374590000, 26374590000, 0, NULL, 20, "2023-01-10 15:59:56", "2023-01-10 15:59:56", NULL),
	(79, 1, 7, "2.1.1.1.1.1", 1, "2.1.1.1.1.1.1", "2111111", "0", "0", "511111", "Belanja Gaji Pokok PNS", 0, NULL, 0, 17334893000, 17334893000, 17334893000, 0, NULL, 20, "2023-01-10 16:00:43", "2023-01-10 16:00:43", NULL),
	(80, 1, 8, "2.1.1.1.1.1.1", 1, "2.1.1.1.1.1.1.1", "21111111", "0", "0", "4813.EBA.994/001/A/511111", "Belanja Gaji Pokok PNS", 1, "Tahun", 12705811000, 12705811000, 12705811000, 12705811000, 0, NULL, 20, "2023-01-10 16:01:29", "2023-01-10 16:01:29", NULL),
	(81, 1, 3, "1.1", 5, "1.1.5", "115", "0", "0", "6388.CBV", "Prasarana Bidang Kesehatan", 570.5, "Unit", 0, 4367874000, 4367874000, 4367874000, 0, NULL, 10, "2023-01-10 16:04:36", "2023-01-10 16:04:36", NULL),
	(82, 1, 8, "2.1.1.1.1.1.1", 2, "2.1.1.1.1.1.1.2", "21111112", "0", "0", "4813.EBA.994/001/A/511111", "Belanja Gaji Pokok PNS (Gaji ke 13)", 1, "Bulan", 1150000000, 1150000000, 1150000000, 1150000000, 0, NULL, 20, "2023-01-11 07:33:23", "2023-01-11 07:33:23", NULL),
	(83, 1, 8, "2.1.1.1.1.1.1", 3, "2.1.1.1.1.1.1.3", "21111113", "0", "0", "4813.EBA.994/001/A/511111", "Belanja Gaji Pokok PNS (Gaji ke 14)", 1, "Bulan", 1150000000, 1150000000, 1150000000, 1150000000, 0, NULL, 20, "2023-01-11 07:34:40", "2023-01-11 07:34:40", NULL),
	(84, 1, 8, "2.1.1.1.1.1.1", 4, "2.1.1.1.1.1.1.4", "21111114", "0", "0", "4813.EBA.994/001/A/511111", "Automatic Adjustment", 1, "PKT", 2329082000, 2329082000, 2329082000, 2329082000, 0, NULL, 20, "2023-01-11 07:39:42", "2023-01-11 07:39:42", NULL),
	(85, 1, 7, "2.1.1.1.1.1", 2, "2.1.1.1.1.1.2", "2111112", "0", "0", "511119", "Belanja Pembulatan Gaji PNS", 0, NULL, 0, 311000, 311000, 311000, 0, NULL, 20, "2023-01-11 07:41:37", "2023-01-11 07:41:37", NULL),
	(86, 1, 8, "2.1.1.1.1.1.2", 1, "2.1.1.1.1.1.2.1", "21111121", "0", "0", "4813.EBA.994/001/A/511119", "Belanja Pembulatan Gaji PNS", 1, "Tahun", 267000, 267000, 267000, 267000, 0, NULL, 20, "2023-01-11 07:42:49", "2023-01-11 07:42:49", NULL),
	(87, 1, 8, "2.1.1.1.1.1.2", 2, "2.1.1.1.1.1.2.2", "21111122", "0", "0", "4813.EBA.994/001/A/511119", "Belanja Pembulatan Gaji PNS (Gaji ke 13)", 1, "Bulan", 22000, 22000, 22000, 22000, 0, NULL, 20, "2023-01-11 07:43:33", "2023-01-11 07:43:33", NULL),
	(88, 1, 8, "2.1.1.1.1.1.2", 3, "2.1.1.1.1.1.2.3", "21111123", "0", "0", "4813.EBA.994/001/A/511119", "Belanja Pembulatan Gaji PNS (Gaji ke 14)", 1, "Bulan", 22000, 22000, 22000, 22000, 0, NULL, 20, "2023-01-11 07:44:12", "2023-01-11 07:44:12", NULL),
	(89, 1, 7, "2.1.1.1.1.1", 3, "2.1.1.1.1.1.3", "2111113", "0", "0", "511121", "Belanja Tunj. Suami/Istri PNS", 0, NULL, 0, 1281000000, 1281000000, 1281000000, 0, NULL, 20, "2023-01-11 07:45:30", "2023-01-11 07:45:30", NULL),
	(90, 1, 8, "2.1.1.1.1.1.3", 1, "2.1.1.1.1.1.3.1", "21111131", "0", "0", "4813.EBA.994/001/A/511121", "Belanja Tunjangan Suami/Istri PNS", 1, "Tahun", 1098000000, 1098000000, 1098000000, 1098000000, 0, NULL, 20, "2023-01-11 07:46:26", "2023-01-11 07:46:26", NULL),
	(91, 1, 8, "2.1.1.1.1.1.3", 2, "2.1.1.1.1.1.3.2", "21111132", "0", "0", "4813.EBA.994/001/A/511121", "Belanja Tunjangan Suami/Istri PNS (Gaji ke 13)", 1, "Bulan", 91500000, 91500000, 91500000, 91500000, 0, NULL, 20, "2023-01-11 07:47:22", "2023-01-11 07:47:22", NULL),
	(92, 1, 8, "2.1.1.1.1.1.3", 3, "2.1.1.1.1.1.3.3", "21111133", "0", "0", "4813.EBA.994/001/A/511121", "Belanja Tunjangan Suami/Istri PNS (Gaji ke 14)", 1, "Bulan", 91500000, 91500000, 91500000, 91500000, 0, NULL, 20, "2023-01-11 07:48:13", "2023-01-11 07:48:13", NULL),
	(93, 1, 7, "2.1.1.1.1.1", 4, "2.1.1.1.1.1.4", "2111114", "0", "0", "511122", "Belanja Tunj. Anak PNS", 0, NULL, 0, 357000000, 357000000, 357000000, 0, NULL, 20, "2023-01-11 07:49:31", "2023-01-11 07:49:31", NULL),
	(94, 1, 8, "2.1.1.1.1.1.4", 1, "2.1.1.1.1.1.4.1", "21111141", "0", "0", "4813.EBA.994/001/A/511122", "Belanja Tunjangan Anak PNS", 1, "Tahun", 306000000, 306000000, 306000000, 306000000, 0, NULL, 20, "2023-01-11 07:51:46", "2023-01-11 07:51:46", NULL),
	(95, 1, 8, "2.1.1.1.1.1.4", 2, "2.1.1.1.1.1.4.2", "21111142", "0", "0", "4813.EBA.994/001/A/511122", "Belanja Tunjangan Anak PNS (Gaji ke 13)", 1, "Bulan", 25500000, 25500000, 25500000, 25500000, 0, NULL, 20, "2023-01-11 07:52:31", "2023-01-11 07:52:31", NULL),
	(96, 1, 8, "2.1.1.1.1.1.4", 3, "2.1.1.1.1.1.4.3", "21111143", "0", "0", "4813.EBA.994/001/A/511122", "Belanja Tunjangan Anak PNS (Gaji ke 14)", 1, "Bulan", 25500000, 25500000, 25500000, 25500000, 0, NULL, 20, "2023-01-11 07:53:21", "2023-01-11 07:53:21", NULL),
	(97, 1, 7, "2.1.1.1.1.1", 5, "2.1.1.1.1.1.5", "2111115", "0", "0", "511123", "Belanja Tunj. Struktural PNS", 0, NULL, 0, 176190000, 176190000, 176190000, 0, NULL, 20, "2023-01-11 07:54:18", "2023-01-11 07:54:18", NULL),
	(98, 1, 8, "2.1.1.1.1.1.5", 1, "2.1.1.1.1.1.5.1", "21111151", "0", "0", "4813.EBA.994/001/A/511123", "Belanja Tunjangan Struktural PNS", 1, "Tahun", 151020000, 151020000, 151020000, 151020000, 0, NULL, 20, "2023-01-11 07:55:06", "2023-01-11 07:55:06", NULL),
	(99, 1, 8, "2.1.1.1.1.1.5", 2, "2.1.1.1.1.1.5.2", "21111152", "0", "0", "4813.EBA.994/001/A/511123", "Belanja Tunjangan Struktural PNS (Gaji ke 13)", 1, "Bulan", 12585000, 12585000, 12585000, 12585000, 0, NULL, 20, "2023-01-11 07:56:04", "2023-01-11 07:56:04", NULL),
	(100, 1, 8, "2.1.1.1.1.1.5", 3, "2.1.1.1.1.1.5.3", "21111153", "0", "0", "4813.EBA.994/001/A/511123", "Belanja Tunjangan Struktural PNS (Gaji ke 14)", 1, "Bulan", 12585000, 12585000, 12585000, 12585000, 0, NULL, 20, "2023-01-11 07:56:47", "2023-01-11 07:56:47", NULL),
	(101, 1, 7, "2.1.1.1.1.1", 6, "2.1.1.1.1.1.6", "2111116", "0", "0", "511124", "Belanja Tunj. Fungsional PNS", 0, NULL, 0, 2105320000, 2105320000, 2105320000, 0, NULL, 20, "2023-01-11 07:57:33", "2023-01-11 07:57:33", NULL),
	(102, 1, 8, "2.1.1.1.1.1.6", 1, "2.1.1.1.1.1.6.1", "21111161", "0", "0", "4813.EBA.994/001/A/511124", "Belanja Tunjangan Fungsional PNS", 1, "Tahun", 1804560000, 1804560000, 1804560000, 1804560000, 0, NULL, 20, "2023-01-11 07:58:25", "2023-01-11 07:58:25", NULL),
	(103, 1, 8, "2.1.1.1.1.1.6", 2, "2.1.1.1.1.1.6.2", "21111162", "0", "0", "4813.EBA.994/001/A/511124", "Belanja Tunjangan Fungsional PNS (Gaji ke 13)", 1, "Bulan", 150380000, 150380000, 150380000, 150380000, 0, NULL, 20, "2023-01-11 07:59:31", "2023-01-11 07:59:31", NULL),
	(104, 1, 8, "2.1.1.1.1.1.6", 3, "2.1.1.1.1.1.6.3", "21111163", "0", "0", "4813.EBA.994/001/A/511124", "Belanja Tunjangan Fungsional PNS (Gaji ke 14)", 1, "Bulan", 150380000, 150380000, 150380000, 150380000, 0, NULL, 20, "2023-01-11 08:00:15", "2023-01-11 08:00:15", NULL),
	(105, 1, 7, "2.1.1.1.1.1", 7, "2.1.1.1.1.1.7", "2111117", "0", "0", "511125", "Belanja Tunj. PPh PNS", 0, NULL, 0, 65518000, 65518000, 65518000, 0, NULL, 20, "2023-01-11 08:00:52", "2023-01-11 08:00:52", NULL),
	(106, 1, 8, "2.1.1.1.1.1.7", 1, "2.1.1.1.1.1.7.1", "21111171", "0", "0", "4813.EBA.994/001/A/511125", "Belanja Tunjangan PPh PNS", 1, "Tahun", 30518000, 30518000, 30518000, 30518000, 0, NULL, 20, "2023-01-11 08:01:48", "2023-08-24 13:22:24", NULL),
	(107, 1, 8, "2.1.1.1.1.1.7", 2, "2.1.1.1.1.1.7.2", "21111172", "0", "0", "4813.EBA.994/001/A/511125", "Belanja Tunjangan PPh PNS (Gaji ke 13)", 1, "Bulan", 17500000, 17500000, 17500000, 17500000, 0, NULL, 20, "2023-01-11 08:02:31", "2023-08-24 13:22:24", NULL),
	(108, 1, 8, "2.1.1.1.1.1.7", 3, "2.1.1.1.1.1.7.3", "21111173", "0", "0", "4813.EBA.994/001/A/511125", "Belanja Tunjangan PPh PNS (Gaji ke 14)", 1, "Bulan", 17500000, 17500000, 17500000, 17500000, 0, NULL, 20, "2023-01-11 08:03:16", "2023-01-11 08:03:16", NULL),
	(109, 1, 7, "2.1.1.1.1.1", 8, "2.1.1.1.1.1.8", "2111118", "0", "0", "511126", "Belanja Tunj. Beras PNS", 0, NULL, 0, 1190000000, 1190000000, 1190000000, 0, NULL, 20, "2023-01-11 08:03:51", "2023-01-11 08:03:51", NULL),
	(110, 1, 8, "2.1.1.1.1.1.8", 1, "2.1.1.1.1.1.8.1", "21111181", "0", "0", "4813.EBA.994/001/A/511126", "Belanja Tunjangan Beras PNS", 1, "Tahun", 1020000000, 1020000000, 1020000000, 1020000000, 0, NULL, 20, "2023-01-11 08:04:42", "2023-07-18 14:41:45", NULL),
	(111, 1, 8, "2.1.1.1.1.1.8", 2, "2.1.1.1.1.1.8.2", "21111182", "0", "0", "4813.EBA.994/001/A/511126", "Belanja Tunjangan Beras PNS (Gaji ke 13)", 1, "Bulan", 85000000, 85000000, 82000000, 85000000, 0, NULL, 20, "2023-01-11 08:05:25", "2023-10-30 12:06:39", NULL),
	(112, 1, 8, "2.1.1.1.1.1.8", 3, "2.1.1.1.1.1.8.3", "21111183", "0", "0", "4813.EBA.994/001/A/511126", "Belanja Tunjangan Beras PNS (Gaji ke 14)", 1, "Bulan", 85000000, 85000000, 85000000, 85000000, 0, NULL, 20, "2023-01-11 08:06:10", "2023-01-11 08:06:10", NULL),
	(113, 1, 7, "2.1.1.1.1.1", 9, "2.1.1.1.1.1.9", "2111119", "0", "0", "511129", "Belanja Uang Makan PNS", 0, NULL, 0, 3302208000, 3302208000, 3302208000, 0, NULL, 20, "2023-01-11 08:06:48", "2023-01-11 08:06:48", NULL),
	(114, 1, 8, "2.1.1.1.1.1.9", 1, "2.1.1.1.1.1.9.1", "21111191", "0", "0", "4813.EBA.994/001/A/511129", "Belanja Uang Makan PNS", 1, "Tahun", 3302208000, 3302208000, 3302208000, 3302208000, 0, NULL, 20, "2023-01-11 08:07:34", "2023-07-18 13:10:34", NULL),
	(115, 1, 7, "2.1.1.1.1.1", 10, "2.1.1.1.1.1.10", "21111110", "0", "0", "511134", "Belanja Tunj. Kompensasi Kerja PNS", 0, NULL, 0, 98000000, 98000000, 98000000, 0, NULL, 20, "2023-01-11 08:08:17", "2023-01-11 08:08:17", NULL),
	(116, 1, 8, "2.1.1.1.1.1.10", 1, "2.1.1.1.1.1.10.1", "211111101", "0", "0", "4813.EBA.994/001/A/511134", "Belanja Tunjangan Kompensasi Kerja PNS", 1, "Tahun", 98000000, 98000000, 98000000, 98000000, 0, NULL, 20, "2023-01-11 08:09:13", "2023-08-29 10:49:39", NULL),
	(117, 1, 7, "2.1.1.1.1.1", 11, "2.1.1.1.1.1.11", "21111111", "0", "0", "511151", "Belanja Tunjangan Umum PNS", 0, NULL, 0, 231000000, 231000000, 231000000, 0, NULL, 20, "2023-01-11 08:10:20", "2023-01-11 08:10:20", NULL),
	(118, 1, 8, "2.1.1.1.1.1.11", 1, "2.1.1.1.1.1.11.1", "211111111", "0", "0", "4813.EBA.994/001/A/511151", "Belanja Tunjangan Umum PNS", 1, "Tahun", 198000000, 198000000, 198000000, 198000000, 0, NULL, 20, "2023-01-11 08:11:05", "2023-08-29 10:49:39", NULL),
	(119, 1, 8, "2.1.1.1.1.1.11", 2, "2.1.1.1.1.1.11.2", "211111112", "0", "0", "4813.EBA.994/001/A/511151", "Belanja Tunjangan Umum PNS (Gaji ke 13)", 1, "Bulan", 16500000, 16500000, 14500000, 16500000, 0, NULL, 20, "2023-01-11 08:11:44", "2023-10-30 11:59:36", NULL),
	(120, 1, 8, "2.1.1.1.1.1.11", 3, "2.1.1.1.1.1.11.3", "211111113", "0", "0", "4813.EBA.994/001/A/511151", "Belanja Tunjangan Umum PNS (Gaji ke 14)", 1, "Bulan", 16500000, 16500000, 16500000, 16500000, 0, NULL, 20, "2023-01-11 08:12:40", "2023-08-29 10:49:39", NULL),
	(121, 1, 7, "2.1.1.1.1.1", 12, "2.1.1.1.1.1.12", "21111112", "0", "0", "512211", "Belanja Uang Lembur", 0, NULL, 0, 233150000, 233150000, 233150000, 0, NULL, 20, "2023-01-11 08:13:13", "2023-01-11 08:13:13", NULL),
	(122, 1, 8, "2.1.1.1.1.1.12", 1, "2.1.1.1.1.1.12.1", "211111121", "0", "0", "4813.EBA.994/001/A/512211", "Uang Lembur Golongan I (10 Org x 20 Jam)", 200, "OJ", 13000, 2600000, 2600000, 2600000, 0, NULL, 20, "2023-01-11 08:15:02", "2023-01-11 08:15:02", NULL),
	(123, 1, 8, "2.1.1.1.1.1.12", 2, "2.1.1.1.1.1.12.2", "211111122", "0", "0", "4813.EBA.994/001/A/512211", "Uang Lembur Golongan II (115 Org x 20 Jam)", 2300, "OJ", 17000, 39100000, 39100000, 39100000, 0, NULL, 20, "2023-01-11 08:16:10", "2023-01-11 08:16:10", NULL),
	(124, 1, 8, "2.1.1.1.1.1.12", 3, "2.1.1.1.1.1.12.3", "211111123", "0", "0", "4813.EBA.994/001/A/512211", "Uang Lembur Golongan III (225 Org x 20 Jam)", 4500, "OJ", 20000, 90000000, 90000000, 90000000, 0, NULL, 20, "2023-01-11 08:17:06", "2023-01-11 08:17:06", NULL),
	(125, 1, 8, "2.1.1.1.1.1.12", 4, "2.1.1.1.1.1.12.4", "211111124", "0", "0", "4813.EBA.994/001/A/512211", "Uang Lembur Golongan IV (45 Org x 20 Jam)", 900, "OJ", 25000, 22500000, 22500000, 22500000, 0, NULL, 20, "2023-01-11 08:18:02", "2023-01-11 08:18:02", NULL),
	(126, 1, 8, "2.1.1.1.1.1.12", 5, "2.1.1.1.1.1.12.5", "211111125", "0", "0", "4813.EBA.994/001/A/512211", "Uang Makan PNS Golongan I (10 Org x 10 Jam)", 100, "OH", 35000, 3500000, 3500000, 3500000, 0, NULL, 20, "2023-01-11 08:19:06", "2023-01-11 08:19:06", NULL),
	(127, 1, 8, "2.1.1.1.1.1.12", 6, "2.1.1.1.1.1.12.6", "211111126", "0", "0", "4813.EBA.994/001/A/512211", "Uang Makan PNS Golongan II (70 Org x 10 Jam)", 700, "OH", 35000, 24500000, 24500000, 24500000, 0, NULL, 20, "2023-01-11 08:20:01", "2023-01-11 08:20:01", NULL),
	(128, 1, 8, "2.1.1.1.1.1.12", 7, "2.1.1.1.1.1.12.7", "211111127", "0", "0", "4813.EBA.994/001/A/512211", "Uang Makan PNS Golongan III (110 Org x 10 Jam)", 1100, "OH", 37000, 40700000, 40700000, 40700000, 0, NULL, 20, "2023-01-11 08:20:56", "2023-01-11 08:20:56", NULL),
	(129, 1, 8, "2.1.1.1.1.1.12", 8, "2.1.1.1.1.1.12.8", "211111128", "0", "0", "4813.EBA.994/001/A/512211", "Uang Makan PNS Golongan IV (25 Org x 10 Jam)", 250, "OH", 41000, 10250000, 10250000, 10250000, 0, NULL, 20, "2023-01-11 08:22:29", "2023-01-11 08:22:29", NULL),
	(130, 1, 5, "2.1.1.1", 2, "2.1.1.1.2", "21112", "0", "0", "002", "Operasional dan Pemeliharaan Kantor", 0, NULL, 0, 31060589000, 31060589000, 31060589000, 0, NULL, 20, "2023-01-11 08:24:35", "2023-01-11 08:24:35", NULL),
	(131, 1, 6, "2.1.1.1.2", 1, "2.1.1.1.2.1", "211121", "0", "0", "A", "Operasional dan Pemeliharaan Kantor", 0, NULL, 0, 31060589000, 31060589000, 31060589000, 0, NULL, 20, "2023-01-11 08:25:14", "2023-01-11 08:25:14", NULL),
	(132, 1, 7, "2.1.1.1.2.1", 1, "2.1.1.1.2.1.1", "2111211", "0", "0", "521111", "Belanja Keperluan Perkantoran", 0, NULL, 0, 393371000, 393371000, 393371000, 0, NULL, 20, "2023-01-11 08:26:23", "2023-01-11 08:26:23", NULL),
	(133, 1, 8, "2.1.1.1.2.1.1", 1, "2.1.1.1.2.1.1.1", "21112111", "0", "0", "4813.EBA.994/002/A/521111", "Biaya Fotocopy", 1, "Tahun", 60000000, 60000000, 60000000, 60000000, 0, NULL, 20, "2023-01-11 08:27:39", "2023-08-29 10:49:39", NULL),
	(134, 1, 8, "2.1.1.1.2.1.1", 2, "2.1.1.1.2.1.1.2", "21112112", "0", "0", "4813.EBA.994/002/A/521111", "Konsumsi Dinas Libur Lebaran dan Natal (248 Peg x 4 Hr)", 992, "OH", 35000, 34720000, 34720000, 34720000, 0, NULL, 20, "2023-01-11 08:28:59", "2023-08-29 10:49:39", NULL),
	(135, 1, 8, "2.1.1.1.2.1.1", 3, "2.1.1.1.2.1.1.3", "21112113", "0", "0", "4813.EBA.994/002/A/521111", "Biaya Promosi", 1, "Tahun", 50000000, 50000000, 50000000, 50000000, 0, NULL, 20, "2023-01-11 08:29:43", "2023-08-29 10:49:39", NULL),
	(136, 1, 8, "2.1.1.1.2.1.1", 4, "2.1.1.1.2.1.1.4", "21112114", "0", "0", "4813.EBA.994/002/A/521111", "Makan Rapat Biasa D.K.I. Jakarta", 3102, "OK", 39591, 122811282, 122811000, 122811000, 0, NULL, 20, "2023-01-11 08:31:32", "2023-08-29 10:49:39", NULL),
	(137, 1, 8, "2.1.1.1.2.1.1", 5, "2.1.1.1.2.1.1.5", "21112115", "0", "0", "4813.EBA.994/002/A/521111", "Snack Rapat Biasa D.K.I. Jakarta", 6720.1, "OK", 18726, 125840593, 125840000, 125840000, 0, NULL, 20, "2023-01-11 08:32:41", "2023-08-29 10:49:39", NULL),
	(138, 1, 7, "2.1.1.1.2.1", 2, "2.1.1.1.2.1.2", "2111212", "0", "0", "521113", "Belanja Penambah Daya Tahan Tubuh", 0, NULL, 0, 1835856000, 1835856000, 1835856000, 0, NULL, 20, "2023-01-11 08:33:24", "2023-01-11 08:33:24", NULL),
	(139, 1, 8, "2.1.1.1.2.1.2", 1, "2.1.1.1.2.1.2.1", "21112121", "0", "0", "4813.EBA.994/002/A/521113", "Penambah Daya Tahan Tubuh (DKI Jakarta)(366 Org x 22 Hr x 12 Bln)", 96624, "OH", 19000, 1835856000, 1835856000, 1835856000, 0, NULL, 20, "2023-01-11 08:34:39", "2023-08-29 10:49:39", NULL),
	(140, 1, 7, "2.1.1.1.2.1", 3, "2.1.1.1.2.1.3", "2111213", "0", "0", "521115", "Belanja Honor Operasional Satuan Kerja", 0, NULL, 0, 327672000, 327672000, 327672000, 0, NULL, 20, "2023-01-11 08:35:33", "2023-01-11 08:35:33", NULL),
	(141, 1, 8, "2.1.1.1.2.1.3", 1, "2.1.1.1.2.1.3.1", "21112131", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Pejabat Kuasa Pengguna Anggaran (pagu dana di atas Rp100 miliar s.d. Rp250 miliar)(1 Org x 12 Bln)", 12, "OB", 4770000, 57240000, 57240000, 57240000, 0, NULL, 20, "2023-01-11 08:38:08", "2023-08-29 10:49:39", NULL),
	(142, 1, 8, "2.1.1.1.2.1.3", 2, "2.1.1.1.2.1.3.2", "21112132", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Pejabat Pembuat Komitmen RM dan BLU (pagu dana di atas  Rp50 miliar s.d. Rp75 miliar) [2 ORG x 12 BLN]", 24, "OB", 3720000, 89280000, 89280000, 89280000, 0, NULL, 20, "2023-01-11 08:40:31", "2023-08-29 10:49:39", NULL),
	(143, 1, 4, "1.1.5", 1, "1.1.5.1", "1151", "0", "0", "6388.CBV.004", "Alat Non Medik", 570.5, "Unit", 0, 2744874000, 2744874000, 2744874000, 0, NULL, 10, "2023-01-11 08:50:09", "2023-01-11 08:50:09", NULL),
	(144, 1, 5, "1.1.5.1", 1, "1.1.5.1.1", "11511", "0", "0", "052", "Pengadaan Alat Non Medik - BLU", 0, NULL, 0, 2744874000, 2744874000, 2744874000, 0, NULL, 10, "2023-01-11 08:50:56", "2023-01-11 08:50:56", NULL),
	(145, 1, 6, "1.1.5.1.1", 1, "1.1.5.1.1.1", "115111", "0", "0", "A", "Alat Non Medik - BLU", 0, NULL, 0, 2744874000, 2744874000, 2744874000, 0, NULL, 10, "2023-01-11 08:51:27", "2023-01-11 08:51:27", NULL),
	(146, 1, 7, "1.1.5.1.1.1", 1, "1.1.5.1.1.1.1", "1151111", "0", "0", "537112", "Belanja Modal Peralatan dan Mesin BLU", 0, NULL, 0, 2744874000, 2744874000, 2744874000, 0, NULL, 10, "2023-01-11 08:52:51", "2023-01-11 08:52:51", NULL),
	(147, 1, 8, "2.1.1.1.2.1.3", 3, "2.1.1.1.2.1.3.3", "21112133", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Pejabat  Penguji Tagihan   Penandatangan  Spm (pagu dana di atas  Rp100 miliar s.d. Rp250 miliar) [1 ORG x 12 BLN]", 12, "OB", 2440000, 29280000, 29280000, 29280000, 0, NULL, 20, "2023-01-11 08:53:13", "2023-08-29 10:49:40", NULL),
	(148, 1, 8, "1.1.5.1.1.1.1", 1, "1.1.5.1.1.1.1.1", "11511111", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - AC 1 PK", 8, "Unit", 7900000, 63200000, 63200000, 63200000, 0, NULL, 10, "2023-01-11 08:56:01", "2023-07-04 10:45:59", NULL),
	(149, 1, 8, "1.1.5.1.1.1.1", 2, "1.1.5.1.1.1.1.2", "11511112", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - AC 2 PK", 2, "Unit", 8830000, 17660000, 17660000, 17660000, 0, NULL, 10, "2023-01-11 08:56:36", "2023-07-04 10:46:23", NULL),
	(150, 1, 8, "1.1.5.1.1.1.1", 3, "1.1.5.1.1.1.1.3", "11511113", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - CCTV", 6, "Unit", 5586000, 33516000, 33516000, 33516000, 0, NULL, 10, "2023-01-11 08:57:16", "2023-01-11 08:57:16", NULL),
	(151, 1, 8, "1.1.5.1.1.1.1", 4, "1.1.5.1.1.1.1.4", "11511114", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Kipas Dinding", 2, "Unit", 1227000, 2454000, 2454000, 2454000, 0, NULL, 10, "2023-01-11 08:57:51", "2023-08-29 10:49:40", NULL),
	(152, 1, 8, "2.1.1.1.2.1.3", 4, "2.1.1.1.2.1.3.4", "21112134", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Kepala ULP [1 ORG x 12 BLN]", 12, "OB", 1000000, 12000000, 12000000, 12000000, 0, NULL, 20, "2023-01-11 08:58:10", "2023-08-29 10:49:40", NULL),
	(153, 1, 8, "1.1.5.1.1.1.1", 5, "1.1.5.1.1.1.1.5", "11511115", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Extech Phase Rotation Tester PRT 200", 1, "Unit", 5568000, 5568000, 5568000, 5568000, 0, NULL, 10, "2023-01-11 08:58:36", "2023-08-29 10:49:40", NULL),
	(154, 1, 8, "2.1.1.1.2.1.3", 5, "2.1.1.1.2.1.3.5", "21112135", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Sekretaris/Staf Pendukung ULP [1 ORG x 12 BLN]", 12, "OB", 750000, 9000000, 9000000, 9000000, 0, NULL, 20, "2023-01-11 08:58:53", "2023-08-29 10:49:40", NULL),
	(155, 1, 8, "1.1.5.1.1.1.1", 6, "1.1.5.1.1.1.1.6", "11511116", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Filling Cabinet", 20, "Unit", 4635000, 92700000, 92700000, 92700000, 0, NULL, 10, "2023-01-11 08:59:24", "2023-07-04 10:46:51", "2023-07-04 10:46:51"),
	(156, 1, 8, "2.1.1.1.2.1.3", 6, "2.1.1.1.2.1.3.6", "21112136", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Pejabat Pengadaan Barang/Jasa [3 ORG x 12 BLN]", 36, "OB", 680000, 24480000, 24480000, 24480000, 0, NULL, 20, "2023-01-11 08:59:59", "2023-08-29 10:49:40", NULL),
	(157, 1, 8, "1.1.5.1.1.1.1", 7, "1.1.5.1.1.1.1.7", "11511117", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Handphone", 1, "Unit", 2899000, 2899000, 2899000, 2899000, 0, NULL, 10, "2023-01-11 09:00:02", "2023-01-11 09:00:02", NULL),
	(158, 1, 8, "1.1.5.1.1.1.1", 8, "1.1.5.1.1.1.1.8", "11511118", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Sofa Bed", 12, "Unit", 4700000, 56400000, 56400000, 56400000, 0, NULL, 10, "2023-01-11 09:00:48", "2023-07-04 10:47:23", NULL),
	(159, 1, 8, "2.1.1.1.2.1.3", 7, "2.1.1.1.2.1.3.7", "21112137", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Staf Pengelola Keuangan [2 ORG x 12 BLN]", 24, "OB", 550000, 13200000, 13200000, 13200000, 0, NULL, 20, "2023-01-11 09:01:12", "2023-08-29 10:49:40", NULL),
	(160, 1, 8, "1.1.5.1.1.1.1", 9, "1.1.5.1.1.1.1.9", "11511119", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Lemari Arsip Kaca", 8, "Unit", 3254000, 26032000, 26032000, 26032000, 0, NULL, 10, "2023-01-11 09:01:25", "2023-07-04 10:47:48", "2023-07-04 10:47:48"),
	(161, 1, 8, "2.1.1.1.2.1.3", 8, "2.1.1.1.2.1.3.8", "21112138", "1", "0", "4813.EBA.994/002/A/521115", "Honorarium Staf Petugas Pengelola Administrasi Belanja Pegawai [1 ORG x 12 BLN]", 12, "OB", 550000, 6600000, 6600000, 6600000, 0, NULL, 10, "2023-01-11 09:01:56", "2023-08-29 10:49:40", NULL),
	(162, 1, 8, "1.1.5.1.1.1.1", 10, "1.1.5.1.1.1.1.10", "115111110", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Lemari Display", 2, "Unit", 5700000, 11400000, 11400000, 11400000, 0, NULL, 10, "2023-01-11 09:02:14", "2023-01-11 09:02:14", NULL),
	(163, 1, 8, "2.1.1.1.2.1.3", 9, "2.1.1.1.2.1.3.9", "21112139", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Penanggung Jawab (UAKPA/Barang) [1 ORG x 12 BLN]", 12, "OB", 300000, 3600000, 3600000, 3600000, 0, NULL, 20, "2023-01-11 09:02:44", "2023-08-29 10:49:40", NULL),
	(164, 1, 8, "1.1.5.1.1.1.1", 11, "1.1.5.1.1.1.1.11", "115111111", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Meja Makan", 26, "Unit", 2880000, 74880000, 74880000, 74880000, 0, NULL, 10, "2023-01-11 09:03:02", "2023-07-04 10:55:39", NULL),
	(165, 1, 8, "1.1.5.1.1.1.1", 12, "1.1.5.1.1.1.1.12", "115111112", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Meja Kerja 1/2 Biro", 31, "Unit", 2860000, 88660000, 88660000, 88660000, 0, NULL, 10, "2023-01-11 09:03:38", "2023-01-11 09:03:38", NULL),
	(166, 1, 8, "2.1.1.1.2.1.3", 10, "2.1.1.1.2.1.3.10", "211121310", "1", "0", "4813.EBA.994/002/A/521115", "Honorarium Ketua/Wakil Ketua (UAKPA/Barang) [1 ORG x 12 BLN]", 12, "OB", 80000, 960000, 960000, 960000, 0, NULL, 10, "2023-01-11 09:03:51", "2023-08-29 10:49:40", NULL),
	(167, 1, 8, "1.1.5.1.1.1.1", 13, "1.1.5.1.1.1.1.13", "115111113", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Mesin Steam Mobil", 1, "Unit", 5060000, 5060000, 5060000, 5060000, 0, NULL, 10, "2023-01-11 09:04:21", "2023-01-11 09:04:21", NULL),
	(168, 1, 8, "2.1.1.1.2.1.3", 11, "2.1.1.1.2.1.3.11", "211121311", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Anggota/Petugas (UAKPA/Barang) [4 ORG x 12 BLN]", 48, "OB", 150000, 7200000, 7200000, 7200000, 0, NULL, 20, "2023-01-11 09:04:28", "2023-08-29 10:49:40", NULL),
	(169, 1, 8, "2.1.1.1.2.1.3", 12, "2.1.1.1.2.1.3.12", "211121312", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Ketua Tim Pendukung PPK [3 ORG x 12 BLN]", 36, "OB", 500000, 18000000, 18000000, 18000000, 0, NULL, 20, "2023-01-11 09:05:12", "2023-08-29 10:49:40", NULL),
	(170, 1, 8, "2.1.1.1.2.1.3", 13, "2.1.1.1.2.1.3.13", "211121313", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Anggota Tim Pendukung PPK [8 ORG x 12 BLN]", 96, "OB", 400000, 38400000, 38400000, 38400000, 0, NULL, 20, "2023-01-11 09:05:59", "2023-08-29 10:49:40", NULL),
	(171, 1, 8, "2.1.1.1.2.1.3", 14, "2.1.1.1.2.1.3.14", "211121314", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Bendahara Pengeluaran [1 ORG x 12 BLN]", 12, "OB", 848000, 10176000, 10176000, 10176000, 0, NULL, 20, "2023-01-11 09:09:33", "2023-08-29 10:49:40", NULL),
	(172, 1, 8, "1.1.5.1.1.1.1", 14, "1.1.5.1.1.1.1.14", "115111114", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Meteran Digital Laser", 1, "Unit", 2852000, 2852000, 2852000, 2852000, 0, NULL, 10, "2023-01-11 09:09:40", "2023-08-29 10:49:40", NULL),
	(173, 1, 8, "2.1.1.1.2.1.3", 15, "2.1.1.1.2.1.3.15", "211121315", "0", "0", "4813.EBA.994/002/A/521115", "Honorarium Bendahara Penerimaan [1 ORG x 12 BLN]", 12, "OB", 688000, 8256000, 8256000, 8256000, 0, NULL, 20, "2023-01-11 09:10:21", "2023-08-29 10:49:41", NULL),
	(174, 1, 8, "1.1.5.1.1.1.1", 15, "1.1.5.1.1.1.1.15", "115111115", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Mic Wireless", 2, "Unit", 5445000, 10890000, 10890000, 10890000, 0, NULL, 10, "2023-01-11 09:10:24", "2023-01-11 09:10:24", NULL),
	(175, 1, 8, "1.1.5.1.1.1.1", 16, "1.1.5.1.1.1.1.16", "115111116", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Microwave", 1, "Unit", 2179000, 2179000, 2179000, 2179000, 0, NULL, 10, "2023-01-11 09:12:14", "2023-01-11 09:12:14", NULL),
	(176, 1, 8, "1.1.5.1.1.1.1", 17, "1.1.5.1.1.1.1.17", "115111117", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Pompa Air, Shimizu PS 230 BIT", 4, "Unit", 1579000, 6316000, 6316000, 6316000, 0, NULL, 10, "2023-01-11 09:12:51", "2023-08-29 10:49:41", NULL),
	(177, 1, 8, "1.1.5.1.1.1.1", 18, "1.1.5.1.1.1.1.18", "115111118", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Pompa Air, Shimizu PS 135 E", 7, "Unit", 1193000, 8351000, 8351000, 8351000, 0, NULL, 10, "2023-01-11 09:13:25", "2023-08-29 10:49:41", NULL),
	(178, 1, 8, "1.1.5.1.1.1.1", 19, "1.1.5.1.1.1.1.19", "115111119", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Pompa Diesel, Merk Honda Tipe WL 20 XNPompa Diesel, Merk Honda Tipe WL 20 XN", 1, "Unit", 5514000, 5514000, 5514000, 5514000, 0, NULL, 10, "2023-01-11 09:13:58", "2023-08-29 10:49:41", NULL),
	(179, 1, 7, "2.1.1.1.2.1", 4, "2.1.1.1.2.1.4", "2111214", "0", "0", "521252", "Belanja Peralatan dan Mesin - Ekstrakomptabel", 0, NULL, 0, 250000000, 250000000, 250000000, 0, NULL, 20, "2023-01-11 09:14:11", "2023-01-11 09:14:11", NULL),
	(180, 1, 8, "1.1.5.1.1.1.1", 20, "1.1.5.1.1.1.1.20", "115111120", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Pompa Submersible Tsurumi WLC 0,7", 7, "Unit", 6095000, 42665000, 42665000, 42665000, 0, NULL, 10, "2023-01-11 09:14:29", "2023-08-29 10:49:41", NULL),
	(181, 1, 8, "2.1.1.1.2.1.4", 1, "2.1.1.1.2.1.4.1", "21112141", "0", "0", "4813.EBA.994/002/A/521252", "Pengadaan Barang Inventaris Di Bawah Nilai Kapitalisasi", 1, "Tahun", 250000000, 250000000, 250000000, 250000000, 0, NULL, 20, "2023-01-11 09:14:57", "2023-08-29 10:49:41", NULL),
	(182, 1, 8, "1.1.5.1.1.1.1", 21, "1.1.5.1.1.1.1.21", "115111121", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Pompa Submersible Tsurumi WLC  0,4 Kw", 10, "Unit", 4704000, 47040000, 47040000, 47040000, 0, NULL, 10, "2023-01-11 09:15:28", "2023-08-29 10:49:41", NULL),
	(183, 1, 8, "1.1.5.1.1.1.1", 22, "1.1.5.1.1.1.1.22", "115111122", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Rice Cooker", 1, "Unit", 18300000, 18300000, 18300000, 18300000, 0, NULL, 10, "2023-01-11 09:16:22", "2023-01-11 09:16:22", NULL),
	(184, 1, 8, "1.1.5.1.1.1.1", 23, "1.1.5.1.1.1.1.23", "115111123", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Smart TV 55 Inchi", 2, "Unit", 27720000, 55440000, 55440000, 55440000, 0, NULL, 10, "2023-01-11 09:16:57", "2023-08-29 10:49:41", NULL),
	(185, 1, 8, "1.1.5.1.1.1.1", 24, "1.1.5.1.1.1.1.24", "115111124", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Smart TV 75 INCHI", 1, "Unit", 69795000, 69795000, 69795000, 69795000, 0, NULL, 10, "2023-01-11 09:17:30", "2023-08-29 10:49:41", NULL),
	(186, 1, 7, "2.1.1.1.2.1", 5, "2.1.1.1.2.1.5", "2111215", "0", "0", "521811", "Belanja Barang Persediaan Barang Konsumsi", 0, NULL, 0, 3997366000, 3997366000, 3997366000, 0, NULL, 20, "2023-01-11 09:17:35", "2023-01-11 09:17:35", NULL),
	(187, 1, 8, "1.1.5.1.1.1.1", 25, "1.1.5.1.1.1.1.25", "115111125", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Smart TV 85 INCHI", 1, "Unit", 137650000, 137650000, 137650000, 137650000, 0, NULL, 10, "2023-01-11 09:18:04", "2023-08-29 10:49:41", NULL),
	(188, 1, 8, "2.1.1.1.2.1.5", 1, "2.1.1.1.2.1.5.1", "21112151", "0", "0", "4813.EBA.994/002/A/521811", "Alat Rumah Tangga/Kelontong", 1, "PKT", 750000000, 750000000, 750000000, 750000000, 0, NULL, 20, "2023-01-11 09:18:32", "2023-08-29 10:49:41", NULL),
	(189, 1, 8, "1.1.5.1.1.1.1", 26, "1.1.5.1.1.1.1.26", "115111126", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Speaker Portable AUBERN SPEAKER PS8DR", 2, "Unit", 7300000, 14600000, 14600000, 14600000, 0, NULL, 10, "2023-01-11 09:18:42", "2023-01-11 09:18:42", NULL),
	(190, 1, 8, "2.1.1.1.2.1.5", 2, "2.1.1.1.2.1.5.2", "21112152", "0", "0", "4813.EBA.994/002/A/521811", "Linen Pasien dan Rumah Sakit", 1, "PKT", 448079000, 448079000, 448079000, 448079000, 0, NULL, 20, "2023-01-11 09:19:04", "2023-01-11 09:19:04", NULL),
	(191, 1, 8, "2.1.1.1.2.1.5", 3, "2.1.1.1.2.1.5.3", "21112153", "0", "0", "4813.EBA.994/002/A/521811", "Belanja Rumah Tangga Cleaning Service", 1, "PKT", 661584000, 661584000, 661584000, 661584000, 0, NULL, 20, "2023-01-11 09:19:53", "2023-08-29 10:49:41", NULL),
	(192, 1, 8, "1.1.5.1.1.1.1", 27, "1.1.5.1.1.1.1.27", "115111127", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Standing Mixer", 2, "Unit", 12057000, 24114000, 24114000, 24114000, 0, NULL, 10, "2023-01-11 09:20:17", "2023-08-29 10:49:41", NULL),
	(193, 1, 8, "2.1.1.1.2.1.5", 4, "2.1.1.1.2.1.5.4", "21112154", "0", "0", "4813.EBA.994/002/A/521811", "Bahan Komputer", 1, "PKT", 757778000, 757778000, 757778000, 757778000, 0, NULL, 20, "2023-01-11 09:20:31", "2023-08-29 10:49:41", NULL),
	(194, 1, 8, "1.1.5.1.1.1.1", 28, "1.1.5.1.1.1.1.28", "115111128", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Televisi LED 32 INCHI", 15, "Unit", 2365000, 35475000, 35475000, 35475000, 0, NULL, 10, "2023-01-11 09:20:53", "2023-08-29 10:49:42", NULL),
	(195, 1, 8, "2.1.1.1.2.1.5", 5, "2.1.1.1.2.1.5.5", "21112155", "0", "0", "4813.EBA.994/002/A/521811", "Alat Tulis Kantor (ATK)", 1, "PKT", 579925000, 579925000, 579925000, 579925000, 0, NULL, 20, "2023-01-11 09:21:12", "2023-08-29 10:49:42", NULL),
	(196, 1, 8, "1.1.5.1.1.1.1", 29, "1.1.5.1.1.1.1.29", "115111129", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - TOA Megaphone", 1, "Unit", 1023000, 1023000, 1023000, 1023000, 0, NULL, 10, "2023-01-11 09:21:26", "2023-01-11 09:21:26", NULL),
	(197, 1, 8, "2.1.1.1.2.1.5", 6, "2.1.1.1.2.1.5.6", "21112156", "0", "0", "4813.EBA.994/002/A/521811", "Belanja Alat Teknik", 1, "PKT", 400000000, 400000000, 400000000, 400000000, 0, NULL, 20, "2023-01-11 09:21:48", "2023-08-29 10:49:42", NULL),
	(198, 1, 8, "1.1.5.1.1.1.1", 30, "1.1.5.1.1.1.1.30", "115111130", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Trolly Barang", 3, "Unit", 2550000, 7650000, 7650000, 7650000, 0, NULL, 10, "2023-01-11 09:22:01", "2023-07-04 10:57:04", NULL),
	(199, 1, 8, "2.1.1.1.2.1.5", 7, "2.1.1.1.2.1.5.7", "21112157", "0", "0", "4813.EBA.994/002/A/521811", "Belanja Cetakan", 1, "PKT", 400000000, 400000000, 400000000, 400000000, 0, NULL, 20, "2023-01-11 09:22:33", "2023-08-29 10:49:42", NULL),
	(200, 1, 8, "1.1.5.1.1.1.1", 31, "1.1.5.1.1.1.1.31", "115111131", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Meja Rapat", 1, "Unit", 13100000, 13100000, 13100000, 13100000, 0, NULL, 10, "2023-01-11 09:22:47", "2023-08-29 10:49:42", NULL),
	(201, 1, 7, "2.1.1.1.2.1", 6, "2.1.1.1.2.1.6", "2111216", "0", "0", "522111", "Belanja Langganan Listrik", 0, NULL, 0, 3949344000, 3949344000, 3949344000, 0, NULL, 20, "2023-01-11 09:23:15", "2023-01-11 09:23:15", NULL),
	(202, 1, 8, "1.1.5.1.1.1.1", 32, "1.1.5.1.1.1.1.32", "115111132", "2", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Kursi Rapat", 10, "Unit", 2220000, 22200000, 22200000, 22200000, 0, NULL, 10, "2023-01-11 09:23:23", "2023-08-29 10:49:42", NULL),
	(203, 1, 8, "1.1.5.1.1.1.1", 33, "1.1.5.1.1.1.1.33", "115111133", "2", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Backdrop", 89, "Unit", 1110000, 98790000, 98790000, 98790000, 0, NULL, 10, "2023-01-11 09:24:01", "2023-07-04 10:57:36", NULL),
	(204, 1, 8, "2.1.1.1.2.1.6", 1, "2.1.1.1.2.1.6.1", "21112161", "1", "0", "4813.EBA.994/002/A/522111", "Belanja Langganan Listrik", 1, "Tahun", 3949344000, 3949344000, 3949344000, 3949344000, 0, NULL, 10, "2023-01-11 09:24:09", "2023-08-29 10:49:42", NULL),
	(205, 1, 7, "2.1.1.1.2.1", 7, "2.1.1.1.2.1.7", "2111217", "0", "0", "522112", "Belanja Langganan Telepon", 0, NULL, 0, 75000000, 75000000, 75000000, 0, NULL, 20, "2023-01-11 09:24:39", "2023-01-11 09:24:39", NULL),
	(206, 1, 8, "1.1.5.1.1.1.1", 34, "1.1.5.1.1.1.1.34", "115111134", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Lemari Buku", 2, "Unit", 6750000, 13500000, 13500000, 13500000, 0, NULL, 10, "2023-01-11 09:24:42", "2023-03-14 09:24:22", "2023-03-14 09:24:22"),
	(207, 1, 8, "1.1.5.1.1.1.1", 35, "1.1.5.1.1.1.1.35", "115111135", "2", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Credenza", 1, "Unit", 6630000, 6630000, 6630000, 6630000, 0, NULL, 10, "2023-01-11 09:25:23", "2023-08-29 10:49:42", NULL),
	(208, 1, 8, "1.1.5.1.1.1.1", 36, "1.1.5.1.1.1.1.36", "115111136", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Loker Pintu", 1, "Unit", 8330000, 8330000, 8330000, 8330000, 0, NULL, 10, "2023-01-11 09:25:57", "2023-08-29 10:49:42", NULL),
	(209, 1, 8, "2.1.1.1.2.1.7", 1, "2.1.1.1.2.1.7.1", "21112171", "0", "0", "4813.EBA.994/002/A/522112", "Belanja Langganan Telepon", 1, "Tahun", 75000000, 75000000, 75000000, 75000000, 0, NULL, 20, "2023-01-11 09:26:35", "2023-08-29 10:49:42", NULL),
	(210, 1, 8, "1.1.5.1.1.1.1", 37, "1.1.5.1.1.1.1.37", "115111137", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Lemari Kecil", 1, "Unit", 1450000, 1450000, 1450000, 1450000, 0, NULL, 10, "2023-01-11 09:27:02", "2023-03-14 09:32:36", "2023-03-14 09:32:36"),
	(211, 1, 7, "2.1.1.1.2.1", 8, "2.1.1.1.2.1.8", "2111218", "0", "0", "522113", "Belanja Langganan Air", 0, NULL, 0, 308353000, 308353000, 308353000, 0, NULL, 20, "2023-01-11 09:27:10", "2023-01-11 09:27:10", NULL),
	(212, 1, 8, "1.1.5.1.1.1.1", 38, "1.1.5.1.1.1.1.38", "115111138", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Kursi Kerja", 15, "Unit", 1218000, 18270000, 18270000, 18270000, 0, NULL, 10, "2023-01-11 09:27:44", "2023-07-04 10:58:12", NULL),
	(213, 1, 8, "2.1.1.1.2.1.8", 1, "2.1.1.1.2.1.8.1", "21112181", "0", "0", "4813.EBA.994/002/A/522113", "Belanja Langganan Air", 1, "Tahun", 308353000, 308353000, 308353000, 308353000, 0, NULL, 20, "2023-01-11 09:27:49", "2023-08-29 10:49:42", NULL),
	(214, 1, 7, "2.1.1.1.2.1", 9, "2.1.1.1.2.1.9", "2111219", "0", "0", "522119", "Belanja Langganan Daya dan Jasa Lainnya", 0, NULL, 0, 1146628000, 1146628000, 1146628000, 0, NULL, 20, "2023-01-11 09:28:21", "2023-01-11 09:28:21", NULL),
	(215, 1, 8, "1.1.5.1.1.1.1", 39, "1.1.5.1.1.1.1.39", "115111139", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Lemari Besi", 3, "Unit", 3781000, 11343000, 11343000, 11343000, 0, NULL, 10, "2023-01-11 09:28:26", "2023-07-04 10:58:42", NULL),
	(216, 1, 8, "2.1.1.1.2.1.9", 1, "2.1.1.1.2.1.9.1", "21112191", "0", "0", "4813.EBA.994/002/A/522119", "Belanja Langganan Internet", 1, "PKT", 492000000, 492000000, 492000000, 492000000, 0, NULL, 20, "2023-01-11 09:29:04", "2023-08-29 10:49:42", NULL),
	(217, 1, 8, "1.1.5.1.1.1.1", 40, "1.1.5.1.1.1.1.40", "115111140", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Dispenser", 3, "Unit", 2500000, 7500000, 7500000, 7500000, 0, NULL, 10, "2023-01-11 09:29:08", "2023-07-04 10:59:09", NULL),
	(218, 1, 8, "2.1.1.1.2.1.9", 2, "2.1.1.1.2.1.9.2", "21112192", "0", "0", "4813.EBA.994/002/A/522119", "Belanja Langganan Aplikasi Absensi", 1, "PKT", 40629000, 40629000, 40629000, 40629000, 0, NULL, 20, "2023-01-11 09:29:48", "2023-08-29 10:49:42", NULL),
	(219, 1, 8, "2.1.1.1.2.1.9", 3, "2.1.1.1.2.1.9.3", "21112193", "0", "0", "4813.EBA.994/002/A/522119", "Belanja Langganan Virtualisasi Komputasi", 2, "PKT", 31220000, 62440000, 62440000, 62440000, 0, NULL, 20, "2023-01-11 09:30:35", "2023-08-29 10:49:42", NULL),
	(220, 1, 8, "1.1.5.1.1.1.1", 41, "1.1.5.1.1.1.1.41", "115111141", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Kursi Tunggu", 8, "Unit", 9042000, 72336000, 72336000, 72336000, 0, NULL, 10, "2023-01-11 09:31:01", "2023-07-04 11:00:05", NULL),
	(221, 1, 8, "2.1.1.1.2.1.9", 4, "2.1.1.1.2.1.9.4", "21112194", "0", "0", "4813.EBA.994/002/A/522119", "Belanja Langganan Firewall", 1, "PKT", 198801000, 198801000, 198801000, 198801000, 0, NULL, 20, "2023-01-11 09:31:04", "2023-01-11 09:31:04", NULL),
	(222, 1, 8, "1.1.5.1.1.1.1", 42, "1.1.5.1.1.1.1.42", "115111142", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Loker", 5, "Unit", 4562000, 22810000, 22810000, 22810000, 0, NULL, 10, "2023-01-11 09:32:16", "2023-07-04 11:14:42", NULL),
	(223, 1, 8, "1.1.5.1.1.1.1", 43, "1.1.5.1.1.1.1.43", "115111143", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Lemari Pakaian", 11, "Unit", 4990000, 54890000, 54890000, 54890000, 0, NULL, 10, "2023-01-11 09:32:52", "2023-07-04 11:15:12", NULL),
	(224, 1, 8, "1.1.5.1.1.1.1", 44, "1.1.5.1.1.1.1.44", "115111144", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Rak Barang", 10, "Unit", 3300000, 33000000, 33000000, 33000000, 0, NULL, 10, "2023-01-11 09:33:54", "2023-07-04 11:15:34", "2023-07-04 11:15:34"),
	(225, 1, 8, "1.1.5.1.1.1.1", 45, "1.1.5.1.1.1.1.45", "115111145", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Vivente Sofa 2 Seater Levante Jati", 4, "Unit", 4500000, 18000000, 18000000, 18000000, 0, NULL, 10, "2023-01-11 09:34:39", "2023-07-04 11:15:45", "2023-07-04 11:15:45"),
	(226, 1, 8, "2.1.1.1.2.1.9", 5, "2.1.1.1.2.1.9.5", "21112195", "0", "0", "4813.EBA.994/002/A/522119", "Belanja langganan endpoint", 1, "PKT", 237930000, 237930000, 237930000, 237930000, 0, NULL, 20, "2023-01-11 09:34:43", "2023-08-29 10:49:43", NULL),
	(227, 1, 8, "2.1.1.1.2.1.9", 6, "2.1.1.1.2.1.9.6", "21112196", "0", "0", "4813.EBA.994/002/A/522119", "Belanja Langganan zoom meeting", 1, "PKT", 51105000, 51105000, 51105000, 51105000, 0, NULL, 20, "2023-01-11 09:35:22", "2023-01-11 09:35:22", NULL),
	(228, 1, 8, "1.1.5.1.1.1.1", 46, "1.1.5.1.1.1.1.46", "115111146", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Vivente Sofa 1 Seater Levante Jati 1", 2, "Unit", 2640000, 5280000, 5280000, 5280000, 0, NULL, 10, "2023-01-11 09:35:27", "2023-07-04 11:15:52", "2023-07-04 11:15:52"),
	(229, 1, 8, "2.1.1.1.2.1.9", 7, "2.1.1.1.2.1.9.7", "21112197", "0", "0", "4813.EBA.994/002/A/522119", "Belanja Langganan aplikasi mobile periksa .id (pendaftaran pasien)", 1, "PKT", 63723000, 63723000, 63723000, 63723000, 0, NULL, 20, "2023-01-11 09:36:06", "2023-01-11 09:36:06", NULL),
	(230, 1, 8, "1.1.5.1.1.1.1", 47, "1.1.5.1.1.1.1.47", "115111147", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Gresco Sofa LS 04 - 2S", 3, "Unit", 3345000, 10035000, 10035000, 10035000, 0, NULL, 10, "2023-01-11 09:36:31", "2023-07-04 11:17:32", NULL),
	(231, 1, 7, "2.1.1.1.2.1", 10, "2.1.1.1.2.1.10", "21112110", "0", "0", "522191", "Belanja Jasa Lainnya", 0, NULL, 0, 11613014000, 11613014000, 11613014000, 0, NULL, 20, "2023-01-11 09:36:48", "2023-01-11 09:36:48", NULL),
	(232, 1, 8, "1.1.5.1.1.1.1", 48, "1.1.5.1.1.1.1.48", "115111148", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Gresco Sofa LS 04 - 1S", 3, "Unit", 1673000, 5019000, 5019000, 5019000, 0, NULL, 10, "2023-01-11 09:37:03", "2023-07-04 11:17:58", NULL),
	(233, 1, 8, "1.1.5.1.1.1.1", 49, "1.1.5.1.1.1.1.49", "115111149", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Legano Meja Tamu/Coffe Table MCF-100", 3, "Unit", 2558000, 7674000, 7674000, 7674000, 0, NULL, 10, "2023-01-11 09:37:38", "2023-07-04 11:18:28", NULL),
	(234, 1, 8, "2.1.1.1.2.1.10", 1, "2.1.1.1.2.1.10.1", "211121101", "0", "0", "4813.EBA.994/002/A/522191", "Outsourcing Cleaning Service (72 Orang)", 1, "Tahun", 5659730000, 5659730000, 5659730000, 5659730000, 0, NULL, 20, "2023-01-11 09:37:43", "2023-08-29 10:49:43", NULL),
	(235, 1, 8, "1.1.5.1.1.1.1", 50, "1.1.5.1.1.1.1.50", "115111150", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris RT - Informa Meja Tamu Novara", 2, "Unit", 1479000, 2958000, 2958000, 2958000, 0, NULL, 10, "2023-01-11 09:38:12", "2023-07-04 11:18:52", "2023-07-04 11:18:52"),
	(236, 1, 8, "2.1.1.1.2.1.10", 2, "2.1.1.1.2.1.10.2", "211121102", "0", "0", "4813.EBA.994/002/A/522191", "Outsourcing Security (51 Orang)", 1, "Tahun", 3882700000, 3882700000, 3882700000, 3882700000, 0, NULL, 20, "2023-01-11 09:38:17", "2023-08-29 10:49:43", NULL),
	(237, 1, 8, "2.1.1.1.2.1.10", 3, "2.1.1.1.2.1.10.3", "211121103", "0", "0", "4813.EBA.994/002/A/522191", "Penyusunan Dokumen Evaluasi Lingkungan Hidup (DELH)", 1, "PKT", 902907000, 902907000, 902907000, 902907000, 0, NULL, 20, "2023-01-11 09:38:55", "2023-08-29 10:49:43", NULL),
	(238, 1, 8, "2.1.1.1.2.1.10", 4, "2.1.1.1.2.1.10.4", "211121104", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Penyehatan kualitas Lingkungan", 1, "Tahun", 49092000, 49092000, 49092000, 49092000, 0, NULL, 20, "2023-01-11 09:40:00", "2023-01-11 09:40:00", NULL),
	(239, 1, 8, "2.1.1.1.2.1.10", 5, "2.1.1.1.2.1.10.5", "211121105", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Penyehatan Hygiene Sanitasi Makanan dan Minuman", 1, "Tahun", 129680000, 129680000, 129680000, 129680000, 0, NULL, 20, "2023-01-11 09:44:23", "2023-01-11 09:44:23", NULL),
	(240, 1, 8, "2.1.1.1.2.1.10", 6, "2.1.1.1.2.1.10.6", "211121106", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Pemeriksaan kualitas air bersih", 1, "Tahun", 81440000, 81440000, 81440000, 81440000, 0, NULL, 20, "2023-01-11 09:45:48", "2023-08-29 10:49:43", NULL),
	(241, 1, 8, "2.1.1.1.2.1.10", 7, "2.1.1.1.2.1.10.7", "211121107", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Pemeriksaan kualitas air minum", 1, "Tahun", 91200000, 91200000, 91200000, 91200000, 0, NULL, 20, "2023-01-11 09:46:36", "2023-08-29 10:49:43", NULL),
	(242, 1, 8, "2.1.1.1.2.1.10", 8, "2.1.1.1.2.1.10.8", "211121108", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Pemeriksaaan kualitas mikrobiologi linen", 1, "Tahun", 3400000, 3400000, 3400000, 3400000, 0, NULL, 20, "2023-01-11 09:47:25", "2023-01-11 09:47:25", NULL),
	(243, 1, 8, "2.1.1.1.2.1.10", 9, "2.1.1.1.2.1.10.9", "211121109", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Pemeriksaan kualitas mikro terhadap proses  dekontaminasi", 1, "Tahun", 23600000, 23600000, 23600000, 23600000, 0, NULL, 20, "2023-01-11 09:48:21", "2023-01-11 09:48:21", NULL),
	(244, 1, 8, "1.1.5.1.1.1.1", 51, "1.1.5.1.1.1.1.51", "115111151", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Brankar", 2, "Unit", 25539000, 51078000, 51078000, 51078000, 0, NULL, 10, "2023-01-11 09:52:38", "2023-07-07 11:41:41", "2023-07-07 11:41:41"),
	(245, 1, 8, "1.1.5.1.1.1.1", 52, "1.1.5.1.1.1.1.52", "115111152", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Easy Move", 5, "Unit", 4635000, 23175000, 23175000, 23175000, 0, NULL, 10, "2023-01-11 09:53:25", "2023-08-29 10:49:43", NULL),
	(246, 1, 8, "1.1.5.1.1.1.1", 53, "1.1.5.1.1.1.1.53", "115111153", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Tensimeter Digital", 6, "Unit", 3512000, 21072000, 21072000, 21072000, 0, NULL, 10, "2023-01-11 09:54:03", "2023-01-11 09:54:03", NULL),
	(247, 1, 8, "1.1.5.1.1.1.1", 54, "1.1.5.1.1.1.1.54", "115111154", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Pulse Oximeter", 6, "Unit", 3300000, 19800000, 19800000, 19800000, 0, NULL, 10, "2023-01-11 09:54:38", "2023-01-11 09:54:38", NULL),
	(248, 1, 8, "1.1.5.1.1.1.1", 55, "1.1.5.1.1.1.1.55", "115111155", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Lemari Obat", 10, "Unit", 4743000, 47430000, 47430000, 47430000, 0, NULL, 10, "2023-01-11 09:55:14", "2023-07-07 11:42:14", NULL),
	(249, 1, 8, "1.1.5.1.1.1.1", 56, "1.1.5.1.1.1.1.56", "115111156", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Stretcher", 1, "Unit", 32669000, 32669000, 32669000, 32669000, 0, NULL, 10, "2023-01-11 09:55:57", "2023-01-11 09:55:57", NULL),
	(250, 1, 8, "1.1.5.1.1.1.1", 57, "1.1.5.1.1.1.1.57", "115111157", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Vena Finder", 4, "Unit", 1310000, 5240000, 5240000, 5240000, 0, NULL, 10, "2023-01-11 09:56:35", "2023-01-11 09:56:35", NULL),
	(251, 1, 8, "1.1.5.1.1.1.1", 58, "1.1.5.1.1.1.1.58", "115111158", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Instrument Trolley", 5, "Unit", 18222000, 91110000, 91110000, 91110000, 0, NULL, 10, "2023-01-11 09:57:23", "2023-08-29 10:49:43", NULL),
	(252, 1, 8, "1.1.5.1.1.1.1", 59, "1.1.5.1.1.1.1.59", "115111159", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Lampu Kepala / Head Lamp", 2, "Unit", 1980000, 3960000, 3960000, 3960000, 0, NULL, 10, "2023-01-11 09:58:06", "2023-08-29 10:49:43", NULL),
	(253, 1, 8, "1.1.5.1.1.1.1", 60, "1.1.5.1.1.1.1.60", "115111160", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Lampu Tindakan", 2, "Unit", 9100000, 18200000, 18200000, 18200000, 0, NULL, 10, "2023-01-11 09:58:49", "2023-07-07 11:42:51", NULL),
	(254, 1, 8, "2.1.1.1.2.1.10", 10, "2.1.1.1.2.1.10.10", "2111211010", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Pemeliharaaan instalasi pengolahan air limbah (IPAL)", 1, "Tahun", 154202000, 154202000, 154202000, 154202000, 0, NULL, 20, "2023-01-11 10:11:05", "2023-08-29 10:49:43", NULL),
	(255, 1, 8, "2.1.1.1.2.1.10", 11, "2.1.1.1.2.1.10.11", "2111211011", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Pengendalian Vektor dan Binatang Pengganggu", 1, "Tahun", 196992000, 196992000, 196992000, 196992000, 0, NULL, 20, "2023-01-11 10:12:00", "2023-08-29 10:49:43", NULL),
	(256, 1, 8, "2.1.1.1.2.1.10", 12, "2.1.1.1.2.1.10.12", "2111211012", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Pengelolaan Limbah B3 padat", 1, "Tahun", 128018000, 128018000, 128018000, 128018000, 0, NULL, 20, "2023-01-11 10:13:03", "2023-08-29 10:49:43", NULL),
	(257, 1, 8, "2.1.1.1.2.1.10", 13, "2.1.1.1.2.1.10.13", "2111211013", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Pengelolaan Limbah B3 cair", 1, "Tahun", 1000000, 1000000, 1000000, 1000000, 0, NULL, 20, "2023-01-11 10:13:43", "2023-01-11 10:13:43", NULL),
	(258, 1, 8, "1.1.5.1.1.1.1", 61, "1.1.5.1.1.1.1.61", "115111161", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - film viewer", 2, "Unit", 7613000, 15226000, 15226000, 15226000, 0, NULL, 10, "2023-01-11 10:14:28", "2023-07-07 11:43:14", "2023-07-07 11:43:14"),
	(259, 1, 8, "2.1.1.1.2.1.10", 14, "2.1.1.1.2.1.10.14", "2111211014", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Pengelolaan Limbah B3 cair", 1, "Tahun", 1000000, 1000000, 1000000, 1000000, 0, NULL, 20, "2023-01-11 10:14:31", "2023-01-11 10:15:43", "2023-01-11 10:15:43"),
	(260, 1, 8, "1.1.5.1.1.1.1", 62, "1.1.5.1.1.1.1.62", "115111162", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Washer Desinfection (CSSD)", 1, "Unit", 800000000, 800000000, 800000000, 800000000, 0, NULL, 10, "2023-01-11 10:16:45", "2023-07-07 11:43:35", "2023-07-07 11:43:35"),
	(261, 1, 8, "2.1.1.1.2.1.10", 14, "2.1.1.1.2.1.10.14", "2111211014", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Pengangkutan sampah non medis (domestik)", 1, "Tahun", 117216000, 117216000, 117216000, 117216000, 0, NULL, 20, "2023-01-11 10:17:02", "2023-08-29 10:49:43", NULL),
	(262, 1, 8, "1.1.5.1.1.1.1", 63, "1.1.5.1.1.1.1.63", "115111163", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Eye Washer", 1, "Unit", 5313000, 5313000, 5313000, 5313000, 0, NULL, 10, "2023-01-11 10:17:30", "2023-01-11 10:17:30", NULL),
	(263, 1, 8, "2.1.1.1.2.1.10", 15, "2.1.1.1.2.1.10.15", "2111211015", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Penebangan dan perapihan pohon", 1, "Tahun", 4800000, 4800000, 4800000, 4800000, 0, NULL, 20, "2023-01-11 10:17:50", "2023-08-29 10:49:43", NULL),
	(264, 1, 8, "1.1.5.1.1.1.1", 64, "1.1.5.1.1.1.1.64", "115111164", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Sealer", 1, "Unit", 1625000, 1625000, 1625000, 1625000, 0, NULL, 10, "2023-01-11 10:18:07", "2023-07-07 11:44:07", "2023-07-07 11:44:07"),
	(265, 1, 8, "2.1.1.1.2.1.10", 16, "2.1.1.1.2.1.10.16", "2111211016", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Komposting", 1, "Tahun", 7137000, 7137000, 7137000, 7137000, 0, NULL, 20, "2023-01-11 10:18:33", "2023-01-11 10:18:33", NULL),
	(266, 1, 8, "1.1.5.1.1.1.1", 65, "1.1.5.1.1.1.1.65", "115111165", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Kursi Roda", 3, "Unit", 4896000, 14688000, 14688000, 14688000, 0, NULL, 10, "2023-01-11 10:18:44", "2023-07-07 11:44:36", NULL),
	(267, 1, 8, "1.1.5.1.1.1.1", 66, "1.1.5.1.1.1.1.66", "115111166", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Box Bayi", 4, "Unit", 11289000, 45156000, 45156000, 45156000, 0, NULL, 10, "2023-01-11 10:19:16", "2023-07-07 11:44:54", "2023-07-07 11:44:54"),
	(268, 1, 8, "2.1.1.1.2.1.10", 17, "2.1.1.1.2.1.10.17", "2111211017", "0", "0", "4813.EBA.994/002/A/522191", "Kesehatan Lingkungan - Penggantian lamella IPAL", 1, "Tahun", 179900000, 179900000, 179900000, 179900000, 0, NULL, 20, "2023-01-11 10:19:22", "2023-01-11 10:19:22", NULL),
	(269, 1, 7, "2.1.1.1.2.1", 11, "2.1.1.1.2.1.11", "21112111", "0", "0", "523111", "Belanja Pemeliharaan Gedung dan Bangunan", 0, NULL, 0, 4287109000, 4287109000, 4287109000, 0, NULL, 20, "2023-01-11 10:19:52", "2023-01-11 10:19:52", NULL),
	(270, 1, 8, "2.1.1.1.2.1.11", 1, "2.1.1.1.2.1.11.1", "211121111", "0", "0", "4813.EBA.994/002/A/523111", "Pemeliharaan Gedung/Bangunan Kantor Bertingkat (D.K.I.  Jakarta)", 17186, "M2", 206000, 3540316000, 3540316000, 3540316000, 0, NULL, 20, "2023-01-11 10:20:37", "2023-08-29 10:49:44", NULL),
	(271, 1, 8, "2.1.1.1.2.1.11", 2, "2.1.1.1.2.1.11.2", "211121112", "0", "0", "4813.EBA.994/002/A/523111", "Pemeliharaan Gedung/Bangunan Kantor Tidak Bertingkat (D.K.I.  Jakarta)", 4881, "M2", 153000, 746793000, 746793000, 746793000, 0, NULL, 20, "2023-01-11 10:21:16", "2023-08-29 10:49:44", NULL),
	(272, 1, 7, "2.1.1.1.2.1", 12, "2.1.1.1.2.1.12", "21112112", "0", "0", "523121", "Belanja Pemeliharaan Peralatan dan Mesin", 0, NULL, 0, 2696100000, 2696100000, 2696100000, 0, NULL, 20, "2023-01-11 10:21:46", "2023-01-11 10:21:46", NULL),
	(273, 1, 8, "2.1.1.1.2.1.12", 1, "2.1.1.1.2.1.12.1", "211121121", "0", "0", "4813.EBA.994/002/A/523121", "Biaya Pemeliharaan dan Operasional Kendaraan Roda 4 (D.K.I.  Jakarta)", 12, "Unit", 33650000, 403800000, 403800000, 403800000, 0, NULL, 20, "2023-01-11 10:22:24", "2023-08-29 10:49:44", NULL),
	(274, 1, 8, "2.1.1.1.2.1.12", 2, "2.1.1.1.2.1.12.2", "211121122", "0", "0", "4813.EBA.994/002/A/523121", "Biaya Pemeliharaan dan Operasional Kendaraan Dinas Pejabat Eselon II (D.K.I.  Jakarta)", 4, "Unit", 38730000, 154920000, 154920000, 154920000, 0, NULL, 20, "2023-01-11 10:22:59", "2023-08-29 10:49:44", NULL),
	(275, 1, 8, "2.1.1.1.2.1.12", 3, "2.1.1.1.2.1.12.3", "211121123", "0", "0", "4813.EBA.994/002/A/523121", "Biaya Pemeliharaan dan Operasional Peralatan Mesin Non Medis", 1, "Tahun", 1670000000, 1670000000, 1670000000, 1670000000, 0, NULL, 20, "2023-01-11 10:23:50", "2023-08-29 10:49:44", NULL),
	(276, 1, 8, "2.1.1.1.2.1.12", 4, "2.1.1.1.2.1.12.4", "211121124", "0", "0", "4813.EBA.994/002/A/523121", "Biaya Pemeliharaan Airphone dan Telepon", 1, "Tahun", 110000000, 110000000, 110000000, 110000000, 0, NULL, 20, "2023-01-11 10:24:31", "2023-08-29 10:49:44", NULL),
	(277, 1, 8, "2.1.1.1.2.1.12", 5, "2.1.1.1.2.1.12.5", "211121125", "0", "0", "4813.EBA.994/002/A/523121", "Pemeliharaan Genset lebih kecil dari 50 KVA (Genset 10 KVA)", 1, "Unit", 7190000, 7190000, 7190000, 7190000, 0, NULL, 20, "2023-01-11 10:25:23", "2023-01-11 10:25:23", NULL),
	(278, 1, 8, "2.1.1.1.2.1.12", 6, "2.1.1.1.2.1.12.6", "211121126", "0", "0", "4813.EBA.994/002/A/523121", "Pemeliharaan Genset lebih kecil dari 50 KVA (Genset 27 KVA)", 1, "Unit", 7190000, 7190000, 7190000, 7190000, 0, NULL, 20, "2023-01-11 10:26:37", "2023-01-11 10:26:37", NULL),
	(279, 1, 8, "2.1.1.1.2.1.12", 7, "2.1.1.1.2.1.12.7", "211121127", "0", "0", "4813.EBA.994/002/A/523121", "Pemeliharaan Genset 100 KVA", 3, "Unit", 10150000, 30450000, 30450000, 30450000, 0, NULL, 20, "2023-01-11 10:27:26", "2023-01-11 10:27:26", NULL),
	(280, 1, 8, "2.1.1.1.2.1.12", 8, "2.1.1.1.2.1.12.8", "211121128", "0", "0", "4813.EBA.994/002/A/523121", "Pemeliharaan Genset 250 KVA", 1, "Unit", 16790000, 16790000, 16790000, 16790000, 0, NULL, 20, "2023-01-11 10:28:02", "2023-01-11 10:28:02", NULL),
	(281, 1, 8, "2.1.1.1.2.1.12", 9, "2.1.1.1.2.1.12.9", "211121129", "0", "0", "4813.EBA.994/002/A/523121", "Pemeliharaan Genset 350 KVA", 1, "Unit", 22960000, 22960000, 22960000, 22960000, 0, NULL, 20, "2023-01-11 10:28:34", "2023-01-11 10:28:34", NULL),
	(282, 1, 8, "2.1.1.1.2.1.12", 10, "2.1.1.1.2.1.12.10", "2111211210", "0", "0", "4813.EBA.994/002/A/523121", "Pemeliharaan Personal Computer/Notebook (Komputer)", 150, "Unit", 730000, 109500000, 109500000, 109500000, 0, NULL, 20, "2023-01-11 10:29:18", "2023-01-11 10:29:18", NULL),
	(283, 1, 8, "2.1.1.1.2.1.12", 11, "2.1.1.1.2.1.12.11", "2111211211", "0", "0", "4813.EBA.994/002/A/523121", "Pemeliharaan Personal Computer/Notebook (Laptop)", 30, "Unit", 730000, 21900000, 21900000, 21900000, 0, NULL, 20, "2023-01-11 10:29:55", "2023-01-11 10:29:55", NULL),
	(284, 1, 8, "2.1.1.1.2.1.12", 12, "2.1.1.1.2.1.12.12", "2111211212", "0", "0", "4813.EBA.994/002/A/523121", "Pemeliharaan printer", 60, "Unit", 690000, 41400000, 41400000, 41400000, 0, NULL, 20, "2023-01-11 10:30:39", "2023-01-11 10:30:39", NULL),
	(285, 1, 8, "2.1.1.1.2.1.12", 13, "2.1.1.1.2.1.12.13", "2111211213", "0", "0", "4813.EBA.994/002/A/523121", "Biaya Pemeliharaan dan Perbaikan SIMRS", 1, "PKT", 110000000, 110000000, 110000000, 110000000, 0, NULL, 20, "2023-01-11 10:31:11", "2023-03-15 09:50:33", "2023-03-15 09:50:33"),
	(286, 1, 8, "1.1.5.1.1.1.1", 67, "1.1.5.1.1.1.1.67", "115111167", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Tabung Oksigen Kecil", 9, "Set", 2375000, 21375000, 21375000, 21375000, 0, NULL, 10, "2023-01-11 10:31:28", "2023-08-29 10:49:44", NULL),
	(287, 1, 8, "2.1.1.1.2.1.12", 14, "2.1.1.1.2.1.12.14", "2111211214", "0", "0", "4813.EBA.994/002/A/523121", "Pemeliharaan server", 2, "PKT", 50000000, 100000000, 100000000, 100000000, 0, NULL, 20, "2023-01-11 10:31:53", "2023-01-11 10:31:53", NULL),
	(288, 1, 8, "1.1.5.1.1.1.1", 68, "1.1.5.1.1.1.1.68", "115111168", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Blender Obat Racikan", 1, "Unit", 1939000, 1939000, 1939000, 1939000, 0, NULL, 10, "2023-01-11 10:32:10", "2023-01-11 10:32:10", NULL),
	(289, 1, 8, "2.1.1.1.2.1.12", 15, "2.1.1.1.2.1.12.15", "2111211215", "0", "0", "4813.EBA.994/002/A/523121", "Biaya Pemeliharaan dan Perbaikan Jaringan LAN", 1, "PKT", 70776000, 70776000, 70776000, 70776000, 0, NULL, 20, "2023-01-11 10:32:25", "2023-03-15 09:51:04", "2023-03-15 09:51:04"),
	(290, 1, 8, "1.1.5.1.1.1.1", 69, "1.1.5.1.1.1.1.69", "115111169", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Scrub Station", 1, "Unit", 123543000, 123543000, 123543000, 123543000, 0, NULL, 10, "2023-01-11 10:32:48", "2023-07-07 11:45:20", "2023-07-07 11:45:20"),
	(291, 1, 8, "1.1.5.1.1.1.1", 70, "1.1.5.1.1.1.1.70", "115111170", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Gynaecolog Examination Table", 1, "Unit", 13986000, 13986000, 13986000, 13986000, 0, NULL, 10, "2023-01-11 10:34:41", "2023-07-07 11:45:34", "2023-07-07 11:45:34"),
	(292, 1, 8, "1.1.5.1.1.1.1", 71, "1.1.5.1.1.1.1.71", "115111171", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Partus Set", 1, "Unit", 8236000, 8236000, 8236000, 8236000, 0, NULL, 10, "2023-01-11 10:35:21", "2023-01-11 10:35:21", NULL),
	(293, 1, 8, "1.1.5.1.1.1.1", 72, "1.1.5.1.1.1.1.72", "115111172", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Curettage Set", 1, "Unit", 26220000, 26220000, 26220000, 26220000, 0, NULL, 10, "2023-01-11 10:35:57", "2023-08-29 10:49:44", NULL),
	(294, 1, 8, "1.1.5.1.1.1.1", 73, "1.1.5.1.1.1.1.73", "115111173", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Examination Table", 6, "Unit", 7693000, 46158000, 46158000, 46158000, 0, NULL, 10, "2023-01-11 10:36:36", "2023-07-07 11:46:13", "2023-07-07 11:46:13"),
	(295, 1, 8, "1.1.5.1.1.1.1", 74, "1.1.5.1.1.1.1.74", "115111174", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Bed 3 Crank", 8, "Unit", 27273000, 218184000, 218184000, 218184000, 0, NULL, 10, "2023-01-11 10:37:10", "2023-07-07 11:46:27", "2023-07-07 11:46:27"),
	(296, 1, 8, "1.1.5.1.1.1.1", 75, "1.1.5.1.1.1.1.75", "115111175", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Hepafilter", 3, "Unit", 83272000, 249816000, 249816000, 249816000, 0, NULL, 10, "2023-01-11 10:37:51", "2023-07-07 11:46:41", "2023-07-07 11:46:41"),
	(297, 1, 8, "1.1.5.1.1.1.1", 76, "1.1.5.1.1.1.1.76", "115111176", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Statistic Bicycle", 1, "Unit", 9037000, 9037000, 9037000, 9037000, 0, NULL, 10, "2023-01-11 10:38:42", "2023-08-29 10:49:44", NULL),
	(298, 1, 8, "1.1.5.1.1.1.1", 77, "1.1.5.1.1.1.1.77", "115111177", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Emergency Trolley", 4, "Unit", 26674000, 106696000, 106696000, 106696000, 0, NULL, 10, "2023-01-11 10:39:13", "2023-01-11 10:39:13", NULL),
	(299, 1, 8, "1.1.5.1.1.1.1", 78, "1.1.5.1.1.1.1.78", "115111178", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Stethoscope", 15, "Unit", 1515000, 22725000, 22725000, 22725000, 0, NULL, 10, "2023-01-11 10:39:58", "2023-08-29 10:49:44", NULL),
	(300, 1, 8, "1.1.5.1.1.1.1", 79, "1.1.5.1.1.1.1.79", "115111179", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Tiang Infuse", 15, "Unit", 1718000, 25770000, 25770000, 25770000, 0, NULL, 10, "2023-01-11 10:40:39", "2023-07-07 11:47:01", "2023-07-07 11:47:01"),
	(301, 1, 8, "1.1.5.1.1.1.1", 80, "1.1.5.1.1.1.1.80", "115111180", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Meja Mayo", 6, "Unit", 3389000, 20334000, 20334000, 20334000, 0, NULL, 10, "2023-01-11 10:41:49", "2023-07-07 11:47:10", "2023-07-07 11:47:10"),
	(302, 1, 8, "1.1.5.1.1.1.1", 81, "1.1.5.1.1.1.1.81", "115111181", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Bed Icu, Hcu", 6, "Unit", 50450000, 302700000, 302700000, 302700000, 0, NULL, 10, "2023-01-11 10:42:25", "2023-07-07 11:47:22", "2023-07-07 11:47:22"),
	(303, 1, 8, "1.1.5.1.1.1.1", 82, "1.1.5.1.1.1.1.82", "115111182", "1", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Bed 3 Crank", 5, "Unit", 27273000, 136365000, 136365000, 136365000, 0, NULL, 10, "2023-01-11 10:43:00", "2023-07-07 11:48:08", NULL),
	(304, 1, 8, "1.1.5.1.1.1.1", 83, "1.1.5.1.1.1.1.83", "115111183", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Trolly Laundry", 4, "Unit", 9000000, 36000000, 36000000, 36000000, 0, NULL, 10, "2023-01-11 10:43:32", "2023-07-07 11:48:34", "2023-07-07 11:48:34"),
	(305, 1, 8, "1.1.5.1.1.1.1", 84, "1.1.5.1.1.1.1.84", "115111184", "0", "0", "6388.CBV.004/052/A/537112", "Inventaris Medis - Deaver Retractor", 4, "Unit", 1650000, 6600000, 6600000, 6600000, 0, NULL, 10, "2023-01-11 10:44:05", "2023-07-07 11:48:50", "2023-07-07 11:48:50"),
	(306, 1, 3, "1.1", 6, "1.1.6", "116", "0", "0", "6388.CCB", "OM Sarana Bidang Kesehatan", 1, "PKT", 0, 5401692310, 5401695000, 5401695000, 0, NULL, 10, "2023-01-11 10:46:27", "2023-01-11 10:46:27", NULL),
	(307, 1, 4, "1.1.6", 1, "1.1.6.1", "1161", "0", "0", "6388.CCB.001", "Operasional dan pemeliharaan UPT BLU", 1, "PKT", 0, 5401692310, 5401695000, 5401695000, 0, NULL, 10, "2023-01-11 10:47:13", "2023-01-11 11:01:37", NULL),
	(308, 1, 5, "1.1.6.1", 1, "1.1.6.1.1", "11611", "0", "0", "051", "Operasional dan pemeliharaan UPT BLU", 0, NULL, 0, 2185687310, 2185690000, 2185690000, 0, NULL, 10, "2023-01-11 10:47:49", "2023-01-11 11:01:20", NULL),
	(309, 1, 6, "1.1.6.1.1", 1, "1.1.6.1.1.1", "116111", "0", "0", "A", "Operasional dan pemeliharaan UPT BLU", 0, NULL, 0, 2185687310, 2185690000, 2185690000, 0, NULL, 10, "2023-01-11 10:48:13", "2023-01-11 11:02:02", NULL),
	(310, 1, 7, "1.1.6.1.1.1", 1, "1.1.6.1.1.1.1", "1161111", "0", "0", "525121", "Belanja Barang Persediaan Barang Konsumsi - BLU", 0, NULL, 0, 2185687310, 2185690000, 2185690000, 0, NULL, 10, "2023-01-11 11:02:49", "2023-03-20 09:24:48", NULL),
	(311, 1, 8, "1.1.6.1.1.1.1", 1, "1.1.6.1.1.1.1.1", "11611111", "0", "0", "6388.CCB.001/051/A/525121", "Belanja Bahan Makanan Pasien Kelas VIP [10 ORG x 365 HARI]", 3650, "OH", 60000, 219000000, 219000000, 219000000, 0, NULL, 10, "2023-01-11 11:03:24", "2023-08-29 10:49:44", NULL),
	(312, 1, 8, "1.1.6.1.1.1.1", 2, "1.1.6.1.1.1.1.2", "11611112", "0", "0", "6388.CCB.001/051/A/525121", "Belanja Bahan Makanan Pasien Kelas 1 [60 ORG x 365 HARI]", 21900, "OH", 54000, 1182600000, 1182600000, 1182600000, 0, NULL, 10, "2023-01-11 11:04:12", "2023-08-29 10:49:44", NULL),
	(313, 1, 8, "1.1.6.1.1.1.1", 3, "1.1.6.1.1.1.1.3", "11611113", "0", "0", "6388.CCB.001/051/A/525121", "Belanja Bahan Makanan Pasien Kelas 2 [18 ORG x 365 HARI]", 6570, "OH", 42000, 275940000, 275940000, 275940000, 0, NULL, 10, "2023-01-11 11:04:43", "2023-08-29 10:49:44", NULL),
	(314, 1, 8, "1.1.6.1.1.1.1", 4, "1.1.6.1.1.1.1.4", "11611114", "0", "0", "6388.CCB.001/051/A/525121", "Pengadaan Bahan Makan Siang Pasien Day Care (Rehab) 59 x 212 HARI", 12500, "OH", 17000, 212500000, 212500000, 212500000, 0, NULL, 10, "2023-01-11 11:05:26", "2023-08-29 10:49:44", NULL),
	(315, 1, 8, "1.1.6.1.1.1.1", 5, "1.1.6.1.1.1.1.5", "11611115", "0", "0", "6388.CCB.001/051/A/525121", "Extra Fooding Untuk Pasien Malnutrisi [45 ORG x 365 HARI]", 16425, "OH", 18000, 295650000, 295650000, 295650000, 0, NULL, 10, "2023-01-11 11:06:22", "2023-08-29 10:49:45", NULL),
	(316, 1, 5, "1.1.6.1", 2, "1.1.6.1.2", "11612", "0", "0", "052", "Operasional dan pemeliharaan UPT BLU - RM", 0, NULL, 0, 3216005000, 3216005000, 3216005000, 0, NULL, 10, "2023-01-11 11:13:16", "2023-01-11 11:13:16", NULL),
	(317, 1, 6, "1.1.6.1.2", 1, "1.1.6.1.2.1", "116121", "0", "0", "A", "Operasional dan Pemeliharaan UPT BLU - RM", 0, NULL, 0, 3216005000, 3216005000, 3216005000, 0, NULL, 10, "2023-01-11 11:13:46", "2023-01-11 11:13:46", NULL),
	(318, 1, 7, "1.1.6.1.2.1", 1, "1.1.6.1.2.1.1", "1161211", "0", "0", "521811", "Belanja Barang Persediaan Barang Konsumsi", 0, NULL, 0, 3018905000, 3018905000, 3018905000, 0, NULL, 10, "2023-01-11 11:14:13", "2023-01-11 11:14:13", NULL),
	(319, 1, 8, "1.1.6.1.2.1.1", 1, "1.1.6.1.2.1.1.1", "11612111", "0", "0", "6388.CCB.001/052/A/521811", "Pengadaan Bama Pasien RS D.K.I.  Jakarta [162 ORG x 365 HR]", 59130, "OH", 30000, 1773900000, 1773900000, 1773900000, 0, NULL, 10, "2023-01-11 11:16:55", "2023-08-29 10:49:45", NULL),
	(320, 1, 8, "1.1.6.1.2.1.1", 2, "1.1.6.1.2.1.1.2", "11612112", "0", "0", "6388.CCB.001/052/A/521811", "Reagensia", 1, "PKT", 957005000, 957005000, 957005000, 957005000, 0, NULL, 10, "2023-01-11 11:17:27", "2023-08-29 10:49:45", NULL),
	(321, 1, 8, "1.1.6.1.2.1.1", 3, "1.1.6.1.2.1.1.3", "11612113", "0", "0", "6388.CCB.001/052/A/521811", "Biaya Gas Elpiji (1 bulan 20 tabung)", 240, "Tabung", 1200000, 288000000, 288000000, 288000000, 0, NULL, 10, "2023-01-11 11:28:40", "2023-08-29 10:49:45", NULL),
	(322, 1, 7, "1.1.6.1.2.1", 2, "1.1.6.1.2.1.2", "1161212", "0", "0", "521841", "Belanja Barang Persediaan - Penanganan Pandemi COVID-19", 0, NULL, 0, 197100000, 197100000, 197100000, 0, NULL, 10, "2023-01-11 11:29:17", "2023-01-11 11:29:17", NULL),
	(323, 1, 8, "1.1.6.1.2.1.2", 1, "1.1.6.1.2.1.2.1", "11612121", "0", "0", "6388.CCB.001/052/A/521841", "Pengadaan Bama Pasien Covid RS D.K.I. Jakarta [10 ORG x 365 HR]", 3650, "OH", 54000, 197100000, 197100000, 197100000, 0, NULL, 10, "2023-01-11 11:29:58", "2023-01-11 11:29:58", NULL),
	(324, 1, 3, "1.1", 7, "1.1.7", "117", "0", "0", "6388.DCM", "Pelatihan Bidang Kesehatan", 307, "KEG", 0, 1084888000, 1084888000, 1084888000, 0, NULL, 10, "2023-01-11 11:31:10", "2023-01-11 11:31:10", NULL),
	(325, 1, 4, "1.1.7", 1, "1.1.7.1", "1171", "0", "0", "6388.DCM.002", "Pelatihan Bidang Kesehatan", 307, "Layanan", 0, 1084888000, 1084888000, 1084888000, 0, NULL, 10, "2023-01-11 11:42:26", "2023-01-11 11:42:26", NULL),
	(326, 1, 5, "1.1.7.1", 1, "1.1.7.1.1", "11711", "0", "0", "051", "Pelatihan Bidang Kesehatan - BLU", 0, NULL, 0, 1084888000, 1084888000, 1084888000, 0, NULL, 10, "2023-01-11 11:43:02", "2023-01-11 11:43:02", NULL),
	(327, 1, 6, "1.1.7.1.1", 1, "1.1.7.1.1.1", "117111", "0", "0", "A", "Pelatihan Bidang Kesehatan - BLU", 0, NULL, 0, 1084888000, 1084888000, 1084888000, 0, NULL, 10, "2023-01-11 11:43:27", "2023-01-11 11:43:27", NULL),
	(328, 1, 7, "1.1.7.1.1.1", 1, "1.1.7.1.1.1.1", "1171111", "0", "0", "525119", "Belanja Penyediaan Barang dan Jasa BLU Lainnya", 0, NULL, 0, 1084888000, 1084888000, 1084888000, 0, NULL, 10, "2023-01-11 11:43:55", "2023-01-11 11:43:55", NULL),
	(329, 1, 8, "1.1.7.1.1.1.1", 1, "1.1.7.1.1.1.1.1", "11711111", "0", "0", "6388.DCM.002/051/A/525119", "Peningkatan Kapasitas Pegawai - Penelitian", 6, "Orang", 15000000, 90000000, 90000000, 90000000, 0, NULL, 10, "2023-01-11 11:45:06", "2023-08-29 10:49:45", NULL),
	(330, 1, 8, "1.1.7.1.1.1.1", 2, "1.1.7.1.1.1.1.2", "11711112", "0", "0", "6388.DCM.002/051/A/525119", "Peningkatan Kapasitas Pegawai - Pelatihan", 179, "Orang", 3765364, 674000156, 674000000, 674000000, 0, NULL, 10, "2023-01-11 11:46:05", "2023-08-29 10:49:45", NULL),
	(331, 1, 8, "1.1.7.1.1.1.1", 3, "1.1.7.1.1.1.1.3", "11711113", "0", "0", "6388.DCM.002/051/A/525119", "Peningkatan Kapasitas Pegawai - Pendidikan Formal Pegawai", 6, "Orang", 18333400, 110000400, 110000000, 110000000, 0, NULL, 10, "2023-01-11 11:46:55", "2023-01-11 14:58:07", NULL),
	(332, 1, 8, "1.1.7.1.1.1.1", 4, "1.1.7.1.1.1.1.4", "11711114", "0", "0", "6388.DCM.002/051/A/525119", "Peningkatan Kapasitas Pegawai - Seminar/Workshop", 116, "Orang", 1818000, 210888000, 210888000, 210888000, 0, NULL, 10, "2023-01-11 11:47:42", "2023-08-29 10:49:45", NULL),
	(333, 1, 3, "1.1", 8, "1.1.8", "118", "0", "0", "6388.EBA", "Layanan Dukungan Manajemen Internal", 2, "Layanan", 0, 38701673004, 38701673000, 38701673000, 0, NULL, 10, "2023-01-11 11:49:36", "2023-08-29 10:49:45", NULL),
	(334, 1, 4, "1.1.8", 1, "1.1.8.1", "1181", "0", "0", "6388.EBA.962", "Layanan Umum", 2, "Layanan", 0, 38701673004, 38701673000, 38701673000, 0, NULL, 10, "2023-01-11 11:50:25", "2023-08-29 10:49:45", NULL),
	(335, 1, 5, "1.1.8.1", 1, "1.1.8.1.1", "11811", "0", "0", "051", "Pembayaran Remunerasi", 0, NULL, 0, 21697764000, 21697764000, 21697764000, 0, NULL, 10, "2023-01-11 11:51:05", "2023-01-11 11:51:05", NULL),
	(336, 1, 6, "1.1.8.1.1", 1, "1.1.8.1.1.1", "118111", "0", "0", "A", "Remunerasi", 0, NULL, 0, 21697764000, 21697764000, 21697764000, 0, NULL, 10, "2023-01-11 11:51:53", "2023-01-11 11:51:53", NULL),
	(337, 1, 7, "1.1.8.1.1.1", 1, "1.1.8.1.1.1.1", "1181111", "0", "0", "525111", "Belanja Gaji dan Tunjangan", 0, NULL, 0, 21697764000, 21697764000, 21697764000, 0, NULL, 10, "2023-01-11 11:52:49", "2023-01-11 11:52:49", NULL),
	(338, 1, 8, "1.1.8.1.1.1.1", 1, "1.1.8.1.1.1.1.1", "11811111", "0", "0", "6388.EBA.962/051/A/525111", "Honorarium dan Insentif Dewas", 14, "Bulan", 28847000, 403858000, 403858000, 403858000, 0, NULL, 10, "2023-01-11 11:54:37", "2023-08-29 10:49:45", NULL),
	(339, 1, 8, "1.1.8.1.1.1.1", 2, "1.1.8.1.1.1.1.2", "11811112", "0", "0", "6388.EBA.962/051/A/525111", "Santukan Purna Jabatan Dewas", 1, "PKT", 15000000, 15000000, 15000000, 15000000, 0, NULL, 10, "2023-01-11 11:56:32", "2023-01-11 11:56:32", NULL),
	(340, 1, 8, "1.1.8.1.1.1.1", 3, "1.1.8.1.1.1.1.3", "11811113", "0", "0", "6388.EBA.962/051/A/525111", "Santunan Purna Jabatan Direksi", 1, "PKT", 48000000, 48000000, 48000000, 48000000, 0, NULL, 20, "2023-01-11 13:31:21", "2023-01-11 13:31:21", NULL),
	(341, 1, 8, "1.1.8.1.1.1.1", 4, "1.1.8.1.1.1.1.4", "11811114", "0", "0", "6388.EBA.962/051/A/525111", "Penghargaan atas Prestasi Pegawai dan Unit", 1, "PKT", 177600000, 177600000, 177600000, 177600000, 0, NULL, 20, "2023-01-11 13:32:05", "2023-01-11 13:32:05", NULL),
	(342, 1, 8, "1.1.8.1.1.1.1", 5, "1.1.8.1.1.1.1.5", "11811115", "0", "0", "6388.EBA.962/051/A/525111", "Remunerasi ke-13", 1, "PKT", 1492380000, 1492380000, 1492380000, 1492380000, 0, NULL, 20, "2023-01-11 13:32:52", "2023-08-29 10:49:45", NULL),
	(343, 1, 8, "1.1.8.1.1.1.1", 6, "1.1.8.1.1.1.1.6", "11811116", "0", "0", "6388.EBA.962/051/A/525111", "Remunerasi Pegawai (P1P2 Dirut, Direksi dan Pegawai, IKT Dirut)", 13, "Bulan", 1504686663, 19560926619, 19560926000, 19560926000, 0, NULL, 20, "2023-01-11 13:33:36", "2023-08-29 10:49:45", NULL),
	(344, 1, 5, "1.1.8.1", 2, "1.1.8.1.2", "11812", "0", "0", "052", "Layanan Penyelenggaraan Tugas dan Fungsi UPT Vertikal - BLU", 0, NULL, 0, 17003909004, 17003909000, 17003909000, 0, NULL, 20, "2023-01-11 13:37:00", "2023-08-29 10:49:45", NULL),
	(345, 1, 6, "1.1.8.1.2", 1, "1.1.8.1.2.1", "118121", "0", "0", "A", "Layanan Penyelenggaraan Tupoksi", 0, NULL, 0, 17003909004, 17003909000, 17003909000, 0, NULL, 20, "2023-01-11 13:38:30", "2023-08-29 10:49:45", NULL),
	(346, 1, 7, "1.1.8.1.2.1", 1, "1.1.8.1.2.1.1", "1181211", "0", "0", "525112", "Belanja Barang", 0, NULL, 0, 234530000, 234530000, 234530000, 0, NULL, 20, "2023-01-11 13:45:37", "2023-01-11 13:45:37", NULL),
	(347, 1, 8, "1.1.8.1.2.1.1", 1, "1.1.8.1.2.1.1.1", "11812111", "0", "0", "6388.EBA.962/052/A/525112", "Tunjangan Perumahan Direktur Utama [1 ORG x 12 BLN]", 12, "OB", 4000000, 48000000, 0, 48000000, 0, NULL, 20, "2023-01-11 13:46:45", "2023-09-07 11:01:15", NULL),
	(348, 1, 8, "1.1.8.1.2.1.1", 2, "1.1.8.1.2.1.1.2", "11812112", "0", "0", "6388.EBA.962/052/A/525112", "Tunjangan Perumahan Direksi [3 ORG x 12 BLN]", 36, "OB", 3600000, 129600000, 129600000, 129600000, 0, NULL, 20, "2023-01-11 13:48:49", "2023-09-01 08:32:10", NULL),
	(349, 1, 8, "1.1.8.1.2.1.1", 3, "1.1.8.1.2.1.1.3", "11812113", "0", "0", "6388.EBA.962/052/A/525112", "Biaya Solar Genset", 3195.1, "Liter", 17818, 56930292, 56930000, 56930000, 0, NULL, 20, "2023-01-11 13:49:35", "2023-08-31 15:07:48", NULL),
	(350, 1, 7, "1.1.8.1.2.1", 2, "1.1.8.1.2.1.2", "1181212", "0", "0", "525113", "Belanja Jasa", 0, NULL, 0, 13609417004, 13609417000, 13609417000, 0, NULL, 20, "2023-01-11 13:50:25", "2023-01-11 13:50:25", NULL),
	(351, 1, 8, "1.1.8.1.2.1.2", 1, "1.1.8.1.2.1.2.1", "11812121", "0", "0", "6388.EBA.962/052/A/525113", "Biaya Jasa Pelayanan Petugas Poli Eksekutif Sore", 1, "Layanan", 150000000, 150000000, 150000000, 150000000, 0, NULL, 20, "2023-01-11 13:51:05", "2023-09-06 08:28:04", NULL),
	(352, 1, 8, "1.1.8.1.2.1.2", 2, "1.1.8.1.2.1.2.2", "11812122", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Medis Dokter Umum [6 ORG x 12 BLN]", 72, "OB", 7500000, 540000000, 540000000, 540000000, 0, NULL, 20, "2023-01-11 13:52:29", "2023-09-04 09:49:49", NULL),
	(353, 1, 8, "1.1.8.1.2.1.2", 3, "1.1.8.1.2.1.2.3", "11812123", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Medis Dokter Spesialis [7 ORG x 12 BLN]", 84, "OB", 15000000, 1260000000, 1260000000, 1260000000, 0, NULL, 20, "2023-01-11 13:53:27", "2023-09-05 13:07:32", NULL),
	(354, 1, 8, "1.1.8.1.2.1.2", 4, "1.1.8.1.2.1.2.4", "11812124", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Operasional S1 [20 ORG x 12 BLN]", 240, "OB", 4797000, 1151280000, 1151280000, 1151280000, 0, NULL, 10, "2023-01-11 13:54:22", "2023-08-29 10:49:46", NULL),
	(355, 1, 8, "1.1.8.1.2.1.2", 5, "1.1.8.1.2.1.2.5", "11812125", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Operasional D3 [20 ORG x 12 BLN]", 240, "OB", 4463000, 1071120000, 1071120000, 1071120000, 0, NULL, 10, "2023-01-11 13:55:13", "2023-08-29 10:49:46", NULL),
	(356, 1, 8, "1.1.8.1.2.1.2", 6, "1.1.8.1.2.1.2.6", "11812126", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Operasional SMA [50 ORG x 12 BLN]", 600, "OB", 4277000, 2566200000, 2565000000, 2566200000, 0, NULL, 10, "2023-01-11 13:56:01", "2023-10-30 11:26:21", NULL),
	(357, 1, 8, "1.1.8.1.2.1.2", 7, "1.1.8.1.2.1.2.7", "11812127", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Paramedis S1 [6 ORG x 12 BLN]", 72, "OB", 4932000, 355104000, 355104000, 355104000, 0, NULL, 10, "2023-01-11 13:56:48", "2023-08-29 10:49:46", NULL),
	(358, 1, 8, "1.1.8.1.2.1.2", 8, "1.1.8.1.2.1.2.8", "11812128", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Paramedis D3 [64 ORG x 12 BLN]", 768, "OB", 4656000, 3575808000, 3575808000, 3575808000, 0, NULL, 10, "2023-01-11 13:57:36", "2023-08-29 10:49:46", NULL),
	(359, 1, 8, "1.1.8.1.2.1.2", 9, "1.1.8.1.2.1.2.9", "11812129", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Apoteker [1 ORG x 12 BLN]", 12, "OB", 6095000, 73140000, 73140000, 73140000, 0, NULL, 20, "2023-01-11 13:58:31", "2023-03-14 10:23:19", "2023-03-14 10:23:19"),
	(360, 1, 8, "1.1.8.1.2.1.2", 10, "1.1.8.1.2.1.2.10", "118121210", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Programer [2 ORG x 12 BLN]", 24, "OB", 6830000, 163920000, 163920000, 163920000, 0, NULL, 20, "2023-01-11 13:59:59", "2023-08-29 10:49:46", NULL),
	(361, 1, 8, "1.1.8.1.2.1.2", 11, "1.1.8.1.2.1.2.11", "118121211", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Auditor [1 ORG x 12 BLN]", 12, "OB", 5514000, 66168000, 66168000, 66168000, 0, NULL, 20, "2023-01-11 14:00:53", "2023-03-14 10:25:59", "2023-03-14 10:25:59"),
	(362, 1, 8, "1.1.8.1.2.1.2", 12, "1.1.8.1.2.1.2.12", "118121212", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Fisikawan [1 ORG x 12 BLN]", 12, "OB", 3500000, 42000000, 42000000, 42000000, 0, NULL, 20, "2023-01-11 14:01:40", "2023-08-29 10:49:46", NULL),
	(363, 1, 8, "1.1.8.1.2.1.2", 13, "1.1.8.1.2.1.2.13", "118121213", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Medis Dokter Umum THR dan Gaji 13 [6 ORG x 2 BLN]", 12, "OB", 6950000, 83400000, 83400000, 83400000, 0, NULL, 20, "2023-01-11 14:02:32", "2023-08-29 10:49:46", NULL),
	(364, 1, 8, "1.1.8.1.2.1.2", 14, "1.1.8.1.2.1.2.14", "118121214", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Medis Dokter Spesialis THR dan Gaji 13 [7 ORG x 2 BLN]", 14, "OB", 14450000, 202300000, 202300000, 202300000, 0, NULL, 20, "2023-01-11 14:03:18", "2023-08-29 10:49:46", NULL),
	(365, 1, 8, "1.1.8.1.2.1.2", 15, "1.1.8.1.2.1.2.15", "118121215", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Operasional S1 THR dan gaji 13 [20 ORG x 2 BLN]", 40, "OB", 4247000, 169880000, 169880000, 169880000, 0, NULL, 10, "2023-01-11 14:04:07", "2023-08-29 10:49:46", NULL),
	(366, 1, 8, "1.1.8.1.2.1.2", 16, "1.1.8.1.2.1.2.16", "118121216", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Operasional D3 THR dan Gaji 13 [20 ORG x 2 BLN]", 40, "OB", 3913000, 156520000, 156520000, 156520000, 0, NULL, 10, "2023-01-11 14:05:08", "2023-08-29 10:49:46", NULL),
	(367, 1, 8, "1.1.8.1.2.1.2", 17, "1.1.8.1.2.1.2.17", "118121217", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Operasional SMA THR dan Gaji 13 [50 ORG x 2 BLN]", 100, "OB", 3727000, 372700000, 372700000, 372700000, 0, NULL, 10, "2023-01-11 14:05:55", "2023-08-29 10:49:47", NULL),
	(368, 1, 8, "1.1.8.1.2.1.2", 18, "1.1.8.1.2.1.2.18", "118121218", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Medis Paramedis S1 THR dan Gaji 13 [6 ORG x 2 BLN]", 12, "OB", 4382000, 52584000, 52584000, 52584000, 0, NULL, 10, "2023-01-11 14:06:41", "2023-08-29 10:49:47", NULL),
	(369, 1, 8, "1.1.8.1.2.1.2", 19, "1.1.8.1.2.1.2.19", "118121219", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Medis Paramedis D3 THR dan Gaji 13 [64 ORG x 2 BLN]", 128, "OB", 4106000, 525568000, 525568000, 525568000, 0, NULL, 10, "2023-01-11 14:07:27", "2023-08-29 10:49:47", NULL),
	(370, 1, 8, "1.1.8.1.2.1.2", 20, "1.1.8.1.2.1.2.20", "118121220", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Apoteker THR [1 ORG x 2 BLN]", 2, "OB", 5545000, 11090000, 11090000, 11090000, 0, NULL, 20, "2023-01-11 14:08:13", "2023-03-14 10:34:59", "2023-03-14 10:34:59"),
	(371, 1, 8, "1.1.8.1.2.1.2", 21, "1.1.8.1.2.1.2.21", "118121221", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Programer THR [2 ORG x 2 BLN]", 4, "OB", 6280000, 25120000, 25120000, 25120000, 0, NULL, 20, "2023-01-11 14:09:00", "2023-08-29 10:49:47", NULL),
	(372, 1, 8, "1.1.8.1.2.1.2", 22, "1.1.8.1.2.1.2.22", "118121222", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Honorer Auditor THR [1 ORG x 2 BLN]", 2, "OB", 4967500, 9935000, 9935000, 9935000, 0, NULL, 20, "2023-01-11 14:09:42", "2023-03-14 10:35:25", "2023-03-14 10:35:25"),
	(373, 1, 8, "1.1.8.1.2.1.2", 23, "1.1.8.1.2.1.2.23", "118121223", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Asuransi Ketenagakerjaan Pemberi Kerja", 12, "Bulan", 35535000, 426420000, 426420000, 426420000, 0, NULL, 10, "2023-01-11 14:10:28", "2023-03-14 10:38:15", NULL),
	(374, 1, 8, "1.1.8.1.2.1.2", 24, "1.1.8.1.2.1.2.24", "118121224", "1", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Belanja Jasa Asuransi Kesehatan Pemberi Kerja", 12, "Bulan", 33535417, 402425004, 402425000, 402425000, 0, NULL, 10, "2023-01-11 14:11:18", "2023-03-14 10:38:47", NULL),
	(375, 1, 8, "1.1.8.1.2.1.2", 25, "1.1.8.1.2.1.2.25", "118121225", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Uang Lembur Honorer [18 ORG x 22 JAM x 12 BLN]", 4752, "OJ", 20000, 95040000, 95040000, 95040000, 0, NULL, 20, "2023-01-11 14:12:11", "2023-08-29 10:49:47", NULL),
	(376, 1, 8, "1.1.8.1.2.1.2", 26, "1.1.8.1.2.1.2.26", "118121226", "0", "0", "6388.EBA.962/052/A/525113", "Gaji Pegawai Honor - Uang Makan Lembur Honorer [18 ORG x 8 JAM x 12 BLN]", 1728, "OJ", 31000, 53568000, 53568000, 53568000, 0, NULL, 20, "2023-01-11 14:12:57", "2023-01-11 14:12:57", NULL),
	(377, 1, 7, "1.1.8.1.2.1", 3, "1.1.8.1.2.1.3", "1181213", "0", "0", "525115", "Belanja Perjalanan", 0, NULL, 0, 1595636000, 1595636000, 1595636000, 0, NULL, 20, "2023-01-11 14:13:31", "2023-08-29 10:49:47", NULL),
	(378, 1, 8, "1.1.8.1.2.1.3", 1, "1.1.8.1.2.1.3.1", "11812131", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Pertemuan ARVI (Bali) - Paket Kegiatan Rapat/Pertemuan di Luar Kantor pejabat eselon  I dan II  ( fullboard)", 12, "OH", 1569000, 18828000, 18828000, 18828000, 0, NULL, 20, "2023-01-11 14:15:08", "2023-03-14 10:41:11", "2023-03-14 10:41:11"),
	(379, 1, 8, "1.1.8.1.2.1.3", 2, "1.1.8.1.2.1.3.2", "11812132", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Pertemuan ARVI (Bali) - Tiket Pesawat Jakarta-Denpasar", 4, "OH", 3262000, 13048000, 13048000, 13048000, 0, NULL, 20, "2023-01-11 14:16:12", "2023-03-14 10:41:27", "2023-03-14 10:41:27"),
	(380, 1, 8, "1.1.8.1.2.1.3", 3, "1.1.8.1.2.1.3.3", "11812133", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Pertemuan ARVI (Bali) - Taksi Jakarta-Bandara PP", 8, "OH", 256000, 2048000, 2048000, 2048000, 0, NULL, 20, "2023-01-11 14:17:22", "2023-03-14 10:41:49", "2023-03-14 10:41:49"),
	(381, 1, 8, "1.1.8.1.2.1.3", 4, "1.1.8.1.2.1.3.4", "11812134", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Pertemuan ARVI (Bali) - Taksi Bandara-Denpasar PP", 8, "OH", 189000, 1512000, 1512000, 1512000, 0, NULL, 20, "2023-01-11 14:18:25", "2023-03-14 10:42:05", "2023-03-14 10:42:05"),
	(382, 1, 8, "1.1.8.1.2.1.3", 5, "1.1.8.1.2.1.3.5", "11812135", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Pertemuan ARVI (Bali) - Uang Representatif Pejabat Eselon II", 12, "OH", 150000, 1800000, 1800000, 1800000, 0, NULL, 20, "2023-01-11 14:19:20", "2023-03-14 10:42:20", "2023-03-14 10:42:20"),
	(383, 1, 8, "1.1.8.1.2.1.3", 6, "1.1.8.1.2.1.3.6", "11812136", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Pertemuan ARSAWAKOI (4 direksi, 3 hari) - Paket Kegiatan Rapat/Pertemuan di Luar Kantor pejabat eselon  I dan II  ( fullboard)", 12, "OH", 1569000, 18828000, 18828000, 18828000, 0, NULL, 20, "2023-01-11 14:20:34", "2023-03-14 10:42:36", "2023-03-14 10:42:36"),
	(384, 1, 8, "1.1.8.1.2.1.3", 7, "1.1.8.1.2.1.3.7", "11812137", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Pertemuan ARSAWAKOI (4 direksi, 3 hari) - Tiket Pesawat Jakarta-Denpasar", 4, "OH", 3262000, 13048000, 13048000, 13048000, 0, NULL, 20, "2023-01-11 14:22:06", "2023-03-14 10:42:53", "2023-03-14 10:42:53"),
	(385, 1, 8, "1.1.8.1.2.1.3", 8, "1.1.8.1.2.1.3.8", "11812138", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Pertemuan ARSAWAKOI (4 direksi, 3 hari) - Uang Harian Kegiatan Rapat/Pertemuan di Luar Kantor (Fullboard diluar kota)", 8, "OH", 256000, 2048000, 2048000, 2048000, 0, NULL, 20, "2023-01-11 14:23:08", "2023-03-14 10:43:27", "2023-03-14 10:43:27"),
	(386, 1, 8, "1.1.8.1.2.1.3", 9, "1.1.8.1.2.1.3.9", "11812139", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Pertemuan ARSAWAKOI (4 direksi, 3 hari) - Taksi Bandara-Denpasar PP", 8, "OH", 189000, 1512000, 1512000, 1512000, 0, NULL, 20, "2023-01-11 14:24:13", "2023-03-14 10:43:58", "2023-03-14 10:43:58"),
	(387, 1, 8, "1.1.8.1.2.1.3", 10, "1.1.8.1.2.1.3.10", "118121310", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Pertemuan ARSAWAKOI (4 direksi, 3 hari) - Uang Representatif Pejabat Eselon II", 12, "OH", 150000, 1800000, 1800000, 1800000, 0, NULL, 20, "2023-01-11 14:25:19", "2023-03-14 10:44:25", "2023-03-14 10:44:25"),
	(388, 1, 8, "1.1.8.1.2.1.3", 11, "1.1.8.1.2.1.3.11", "118121311", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Reviu Anggaran Indikatif (luring) di Bandung - Paket Kegiatan Rapat/Pertemuan di Luar Kantor pejabat eselon  I dan II  ( fullboard)", 10, "OH", 1110000, 11100000, 6300000, 11100000, 0, NULL, 20, "2023-01-11 14:29:53", "2023-03-14 10:45:59", "2023-03-14 10:45:59"),
	(389, 1, 8, "1.1.8.1.2.1.3", 12, "1.1.8.1.2.1.3.12", "118121312", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Reviu Anggaran Indikatif (luring) di Bandung - Paket Kegiatan Rapat/Pertemuan di Luar Kantor pejabat eselon  III kebawah ( fullboard)", 30, "OH", 822000, 24660000, 13219000, 24660000, 0, NULL, 20, "2023-01-11 14:30:57", "2023-03-14 10:46:47", "2023-03-14 10:46:47"),
	(390, 1, 8, "1.1.8.1.2.1.3", 13, "1.1.8.1.2.1.3.13", "118121313", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Reviu Anggaran Indikatif (luring) di Bandung - Transport PP", 8, "OH", 800000, 6400000, 5300000, 6400000, 0, NULL, 20, "2023-01-11 14:32:03", "2023-03-14 10:47:04", "2023-03-14 10:47:04"),
	(391, 1, 8, "1.1.8.1.2.1.3", 14, "1.1.8.1.2.1.3.14", "118121314", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Reviu Anggaran Indikatif (luring) di Bandung - Uang Harian Kegiatan Rapat/Pertemuan di Luar Kantor (Fullboard diluar kota)", 30, "OH", 150000, 4500000, 4500000, 4500000, 0, NULL, 20, "2023-01-11 14:33:03", "2023-03-14 10:47:21", "2023-03-14 10:47:21"),
	(392, 1, 8, "1.1.8.1.2.1.3", 15, "1.1.8.1.2.1.3.15", "118121315", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Reviu Anggaran Definitif (luring) di Yogyakarta - Paket Kegiatan Rapat/Pertemuan di Luar Kantor pejabat eselon  I dan II  ( fullboard)", 10, "OH", 1204000, 12040000, 12040000, 12040000, 0, NULL, 20, "2023-01-11 14:34:05", "2023-03-14 10:47:39", "2023-03-14 10:47:39"),
	(393, 1, 8, "1.1.8.1.2.1.3", 16, "1.1.8.1.2.1.3.16", "118121316", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Reviu Anggaran Definitif (luring) di Yogyakarta - Paket Kegiatan Rapat/Pertemuan di Luar Kantor pejabat eselon  III kebawah ( fullboard)", 30, "OH", 750000, 22500000, 22500000, 22500000, 0, NULL, 20, "2023-01-11 14:35:05", "2023-03-14 10:47:53", "2023-03-14 10:47:53"),
	(394, 1, 8, "1.1.8.1.2.1.3", 17, "1.1.8.1.2.1.3.17", "118121317", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Reviu Anggaran Definitif (luring) di Yogyakarta - Biaya Tiket Pesawat Perjalanan Dinas Dalam Negeri (PP)", 8, "OH", 2268000, 18144000, 18144000, 18144000, 0, NULL, 20, "2023-01-11 14:36:13", "2023-03-14 10:48:30", "2023-03-14 10:48:30"),
	(395, 1, 8, "1.1.8.1.2.1.3", 18, "1.1.8.1.2.1.3.18", "118121318", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Reviu Anggaran Definitif (luring) di Yogyakarta - Uang Taxi Jakarta - Bandara (PP)", 16, "OH", 256000, 4096000, 4096000, 4096000, 0, NULL, 20, "2023-01-11 14:37:06", "2023-03-14 10:49:10", "2023-03-14 10:49:10"),
	(396, 1, 8, "1.1.8.1.2.1.3", 19, "1.1.8.1.2.1.3.19", "118121319", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Reviu Anggaran Definitif (luring) di Yogyakarta - Uang Taxi Yogyakarta - Bandara (PP)", 16, "OH", 222000, 3552000, 3552000, 3552000, 0, NULL, 20, "2023-01-11 14:38:17", "2023-03-14 10:49:27", "2023-03-14 10:49:27"),
	(397, 1, 8, "1.1.8.1.2.1.3", 20, "1.1.8.1.2.1.3.20", "118121320", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Paket Kegiatan Rapat/Pertemuan di Luar Kantor pejabat eselon  III kebawah ( fullboard) Bandung", 144, "OH", 822000, 118368000, 62002400, 118368000, 0, NULL, 20, "2023-01-11 14:39:21", "2023-03-14 10:49:43", "2023-03-14 10:49:43"),
	(398, 1, 8, "1.1.8.1.2.1.3", 21, "1.1.8.1.2.1.3.21", "118121321", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Transport Jawa Barat PP (Bandung)", 54, "OH", 800000, 43200000, 43200000, 43200000, 0, NULL, 20, "2023-01-11 14:40:16", "2023-03-14 10:49:54", "2023-03-14 10:49:54"),
	(399, 1, 8, "1.1.8.1.2.1.3", 22, "1.1.8.1.2.1.3.22", "118121322", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Paket Kegiatan Rapat/Pertemuan di Luar Kantor pejabat eselon  III kebawah ( fullboard) Denpasar", 72, "OH", 1419000, 102168000, 82600440, 102168000, 0, NULL, 20, "2023-01-11 14:41:26", "2023-03-14 10:50:23", "2023-03-14 10:50:23"),
	(400, 1, 8, "1.1.8.1.2.1.3", 23, "1.1.8.1.2.1.3.23", "118121323", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Tiket Pesawat Jakarta-Denpasar", 18, "OH", 3262000, 58716000, 58716000, 58716000, 0, NULL, 20, "2023-01-11 14:42:22", "2023-03-14 10:50:37", "2023-03-14 10:50:37"),
	(401, 1, 8, "1.1.8.1.2.1.3", 24, "1.1.8.1.2.1.3.24", "118121324", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Taksi Jakarta-Bandara PP", 36, "OH", 257000, 9252000, 9252000, 9252000, 0, NULL, 20, "2023-01-11 14:43:14", "2023-03-14 10:50:50", "2023-03-14 10:50:50"),
	(402, 1, 8, "1.1.8.1.2.1.3", 25, "1.1.8.1.2.1.3.25", "118121325", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Taksi Bandara-Denpasar PP", 36, "OH", 189000, 6804000, 6804000, 6804000, 0, NULL, 20, "2023-01-11 14:44:05", "2023-03-14 10:51:06", "2023-03-14 10:51:06"),
	(403, 1, 8, "1.1.8.1.2.1.3", 26, "1.1.8.1.2.1.3.26", "118121326", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Biaya Akomodasi Kegiatan (pendaftaran) Kegiatan Sosialisai Peraturan Penatalaksanaan BMN (Jakarta)", 21, "OH", 300000, 6300000, 6300000, 6300000, 0, NULL, 20, "2023-01-11 14:44:53", "2023-03-14 10:51:30", "2023-03-14 10:51:30"),
	(404, 1, 8, "1.1.8.1.2.1.3", 27, "1.1.8.1.2.1.3.27", "118121327", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Biaya transportasi dari DKI Jakarta ke kabupaten/kota  untuk Evakuasi Pasien ke Bekasi dan sekitarnya", 666, "OH", 284000, 189144000, 168320000, 189144000, 0, NULL, 20, "2023-01-11 14:45:46", "2023-03-14 10:51:46", "2023-03-14 10:51:46"),
	(405, 1, 8, "1.1.8.1.2.1.3", 28, "1.1.8.1.2.1.3.28", "118121328", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Biaya transportasi dari DKI Jakarta ke kabupaten/kota untuk Evakuasi Pasien ke Kabupaten Tangerang dan sekitarnya", 1097, "OH", 310000, 340070000, 317885000, 340070000, 0, NULL, 20, "2023-01-11 14:46:43", "2023-03-14 10:52:03", "2023-03-14 10:52:03"),
	(406, 1, 8, "1.1.8.1.2.1.3", 29, "1.1.8.1.2.1.3.29", "118121329", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Biaya transportasi kegiatan dalam Kabupaten/kota PP", 450, "OH", 150000, 67500000, 37540000, 67500000, 0, NULL, 20, "2023-01-11 14:47:44", "2023-03-14 10:52:45", "2023-03-14 10:52:45"),
	(407, 1, 8, "1.1.8.1.2.1.3", 30, "1.1.8.1.2.1.3.30", "118121330", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Uang harian kegiatan rapat/pertemuan di luar kantor (fullday/halfday dalam kota)", 450, "OH", 130000, 58500000, 56370000, 58500000, 0, NULL, 20, "2023-01-11 14:48:37", "2023-03-14 11:15:12", "2023-03-14 11:15:12"),
	(408, 1, 8, "1.1.8.1.2.1.3", 31, "1.1.8.1.2.1.3.31", "118121331", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Uang harian kegiatan rapat/pertemuan di luar kantor (fullday/halfday luar kota kota)", 270, "OH", 130000, 35100000, 35100000, 35100000, 0, NULL, 20, "2023-01-11 14:49:32", "2023-03-14 11:15:27", "2023-03-14 11:15:27"),
	(409, 1, 8, "1.1.8.1.2.1.3", 32, "1.1.8.1.2.1.3.32", "118121332", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Uang Harian Kegiatan Rapat/Pertemuan di Luar Kantor (Fullboard diluar kota)", 300, "OH", 150000, 45000000, 42310000, 45000000, 0, NULL, 20, "2023-01-11 14:50:25", "2023-03-14 11:15:40", "2023-03-14 11:15:40"),
	(410, 1, 8, "1.1.8.1.2.1.3", 33, "1.1.8.1.2.1.3.33", "118121333", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Uang Representatif Pejabat Eselon II", 50, "OH", 150000, 7500000, 7500000, 7500000, 0, NULL, 20, "2023-01-11 14:51:19", "2023-03-14 11:15:53", "2023-03-14 11:15:53"),
	(411, 1, 8, "1.1.8.1.2.1.3", 34, "1.1.8.1.2.1.3.34", "118121334", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Dalam Negeri - Undangan Dari Eselon 1 Atau Instansi Lain - Biaya test PCR/SWAB/Antigen", 50, "OH", 246360, 12318000, 12318000, 12318000, 0, NULL, 20, "2023-01-11 14:52:14", "2023-03-14 11:16:08", "2023-03-14 11:16:08"),
	(412, 1, 8, "1.1.8.1.2.1.3", 35, "1.1.8.1.2.1.3.35", "118121335", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Luar Negeri - Uang Harian", 30, "OH", 5006000, 150180000, 150180000, 150180000, 0, NULL, 20, "2023-01-11 14:53:33", "2023-01-11 14:53:33", NULL),
	(413, 1, 8, "1.1.8.1.2.1.3", 36, "1.1.8.1.2.1.3.36", "118121336", "0", "0", "6388.EBA.962/052/A/525115", "Perjalanan Dinas Luar Negeri - Tiket pesawat (PP) kelas ekonomi", 6, "OH", 27342000, 164052000, 164052000, 164052000, 0, NULL, 20, "2023-01-11 14:54:17", "2023-01-11 14:54:17", NULL),
	(414, 1, 7, "1.1.8.1.2.1", 4, "1.1.8.1.2.1.4", "1181214", "0", "0", "525119", "Belanja Penyediaan Barang dan Jasa BLU Lainnya", 0, NULL, 0, 1564326000, 1564326000, 1564326000, 0, NULL, 20, "2023-01-11 14:54:50", "2023-08-29 10:49:47", NULL),
	(415, 1, 8, "1.1.8.1.2.1.4", 1, "1.1.8.1.2.1.4.1", "11812141", "0", "0", "6388.EBA.962/052/A/525119", "Biaya Pelayanan Pasien Pengadaan Darah dan Pemeriksaan Laboratorium", 1, "Tahun", 90240000, 90240000, 90240000, 90240000, 0, NULL, 20, "2023-01-11 14:55:27", "2023-08-29 10:49:47", NULL),
	(416, 1, 8, "1.1.8.1.2.1.4", 2, "1.1.8.1.2.1.4.2", "11812142", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Jumat Bersih dan Sehat", 1, "Tahun", 12000000, 12000000, 12000000, 12000000, 0, NULL, 20, "2023-01-11 14:55:57", "2023-01-11 14:55:57", NULL),
	(417, 1, 8, "1.1.8.1.2.1.4", 3, "1.1.8.1.2.1.4.3", "11812143", "0", "0", "6388.EBA.962/052/A/525119", "Pemantapan Mutu Eksternal Laboratorium", 1, "Tahun", 6300000, 6300000, 6300000, 6300000, 0, NULL, 20, "2023-01-11 14:56:38", "2023-08-29 10:49:47", NULL),
	(418, 1, 8, "1.1.8.1.2.1.4", 4, "1.1.8.1.2.1.4.4", "11812144", "0", "0", "6388.EBA.962/052/A/525119", "Medical Check Up Pegawai (200 orang)", 1, "KEG", 40797000, 40797000, 40797000, 40797000, 0, NULL, 20, "2023-01-11 14:57:13", "2023-01-11 14:57:13", NULL),
	(419, 1, 8, "1.1.8.1.2.1.4", 5, "1.1.8.1.2.1.4.5", "11812145", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Penghapusan BMN - Pemusnahan obat", 1, "Tahun", 19540000, 19540000, 19540000, 19540000, 0, NULL, 20, "2023-01-11 14:57:57", "2023-01-11 14:57:57", NULL),
	(420, 1, 8, "1.1.8.1.2.1.4", 6, "1.1.8.1.2.1.4.6", "11812146", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Penghapusan BMN - Lelang barang inventaris dibawah 100 juta", 1, "Tahun", 16000000, 16000000, 16000000, 16000000, 0, NULL, 20, "2023-01-11 14:58:49", "2023-08-29 10:49:47", NULL),
	(421, 1, 8, "1.1.8.1.2.1.4", 7, "1.1.8.1.2.1.4.7", "11812147", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Penghapusan BMN - Lelang barang inventaris diatas 100 juta", 1, "Tahun", 16000000, 16000000, 16000000, 16000000, 0, NULL, 20, "2023-01-11 14:59:38", "2023-01-11 14:59:38", NULL),
	(422, 1, 8, "1.1.8.1.2.1.4", 8, "1.1.8.1.2.1.4.8", "11812148", "0", "0", "6388.EBA.962/052/A/525119", "Pengelolaan Kegiatan BLU - Kegiatan Rencana Kinerja Tahunan", 1, "KEG", 155268000, 155268000, 154568000, 155268000, 0, NULL, 20, "2023-01-11 15:00:19", "2023-03-14 14:11:15", "2023-03-14 14:11:15"),
	(423, 1, 8, "1.1.8.1.2.1.4", 9, "1.1.8.1.2.1.4.9", "11812149", "0", "0", "6388.EBA.962/052/A/525119", "Pengelolaan Kegiatan BLU - Kegiatan Evaluasi Kinerja Tahunan", 1, "KEG", 313300000, 313300000, 304804000, 313300000, 0, NULL, 20, "2023-01-11 15:01:16", "2023-03-14 14:11:38", "2023-03-14 14:11:38"),
	(424, 1, 8, "1.1.8.1.2.1.4", 10, "1.1.8.1.2.1.4.10", "118121410", "0", "0", "6388.EBA.962/052/A/525119", "Belanja Latihan Kerja, Terapi Pasien / Rehabilitasi Psikososial - Daycare (Setiap hari kerja)", 1, "Tahun", 128800000, 128800000, 128800000, 128800000, 0, NULL, 20, "2023-01-11 15:01:55", "2023-08-29 10:49:47", NULL),
	(425, 1, 8, "1.1.8.1.2.1.4", 11, "1.1.8.1.2.1.4.11", "118121411", "0", "0", "6388.EBA.962/052/A/525119", "Belanja Latihan Kerja, Terapi Pasien / Rehabilitasi Psikososial - Terapi Kelompok luar Ruangan/Rekreasi", 1, "Tahun", 15000000, 15000000, 15000000, 15000000, 0, NULL, 20, "2023-01-11 15:02:32", "2023-01-11 15:02:32", NULL),
	(426, 1, 8, "1.1.8.1.2.1.4", 12, "1.1.8.1.2.1.4.12", "118121412", "0", "0", "6388.EBA.962/052/A/525119", "Belanja Latihan Kerja, Terapi Pasien / Rehabilitasi Psikososial - Terapi Kelompok luar Ruangan/Rekreasi", 1, "Tahun", 15000000, 15000000, 15000000, 15000000, 0, NULL, 20, "2023-01-11 15:03:38", "2023-01-11 15:04:54", "2023-01-11 15:04:54"),
	(427, 1, 8, "1.1.8.1.2.1.4", 12, "1.1.8.1.2.1.4.12", "118121412", "0", "0", "6388.EBA.962/052/A/525119", "Belanja Latihan Kerja, Terapi Pasien / Rehabilitasi Psikososial - Kegiatan Family gathering", 1, "Tahun", 3000000, 3000000, 3000000, 3000000, 0, NULL, 20, "2023-01-11 15:05:46", "2023-08-29 10:49:47", NULL),
	(428, 1, 8, "1.1.8.1.2.1.4", 13, "1.1.8.1.2.1.4.13", "118121413", "0", "0", "6388.EBA.962/052/A/525119", "Belanja Latihan Kerja, Terapi Pasien / Rehabilitasi Psikososial - Program Pemberdayaan Rehabilitan (2 kegiatan)", 1, "Tahun", 2000000, 2000000, 2000000, 2000000, 0, NULL, 20, "2023-01-11 15:06:36", "2023-01-11 15:06:36", NULL),
	(429, 1, 8, "1.1.8.1.2.1.4", 14, "1.1.8.1.2.1.4.14", "118121414", "0", "0", "6388.EBA.962/052/A/525119", "Belanja Latihan Kerja, Terapi Pasien / Rehabilitasi Psikososial - Program Pemberdayaan Rehabilitan (2 kegiatan)", 1, "Tahun", 2000000, 2000000, 2000000, 2000000, 0, NULL, 20, "2023-01-11 15:07:16", "2023-01-11 15:10:15", "2023-01-11 15:10:15"),
	(430, 1, 8, "1.1.8.1.2.1.4", 14, "1.1.8.1.2.1.4.14", "118121414", "0", "0", "6388.EBA.962/052/A/525119", "Belanja Latihan Kerja, Terapi Pasien / Rehabilitasi Psikososial - Homevisite (1 Bulan 2 kali)", 1, "Tahun", 2400000, 2400000, 2400000, 2400000, 0, NULL, 20, "2023-01-11 15:11:54", "2023-01-11 15:11:54", NULL),
	(431, 1, 8, "1.1.8.1.2.1.4", 15, "1.1.8.1.2.1.4.15", "118121415", "0", "0", "6388.EBA.962/052/A/525119", "Belanja Latihan Kerja, Terapi Pasien / Rehabilitasi Psikososial - Pameran Rehabilitasi", 1, "Tahun", 30000000, 30000000, 30000000, 30000000, 0, NULL, 20, "2023-01-11 15:12:37", "2023-01-11 15:12:37", NULL),
	(432, 1, 8, "1.1.8.1.2.1.4", 16, "1.1.8.1.2.1.4.16", "118121416", "0", "0", "6388.EBA.962/052/A/525119", "Belanja Latihan Kerja, Terapi Pasien / Rehabilitasi Psikososial - Rehabilitasi Geriatri", 1, "Tahun", 28000000, 28000000, 28000000, 28000000, 0, NULL, 20, "2023-01-11 15:13:15", "2023-01-11 15:13:15", NULL),
	(433, 1, 8, "1.1.8.1.2.1.4", 17, "1.1.8.1.2.1.4.17", "118121417", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Droping Pasien dan Edukasi Keluarga", 50, "KEG", 450000, 22500000, 22500000, 22500000, 0, NULL, 20, "2023-01-11 15:13:57", "2023-08-29 10:49:47", NULL),
	(434, 1, 8, "1.1.8.1.2.1.4", 18, "1.1.8.1.2.1.4.18", "118121418", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Penyuluhan dan Pemulangan Pasien Panti Sosial", 96, "KEG", 450000, 43200000, 43200000, 43200000, 0, NULL, 20, "2023-01-11 15:14:41", "2023-08-29 10:49:47", NULL),
	(435, 1, 8, "1.1.8.1.2.1.4", 19, "1.1.8.1.2.1.4.19", "118121419", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Penyuluhan dan Penjemputan Pasien Panti Sosial", 96, "KEG", 450000, 43200000, 43200000, 43200000, 0, NULL, 20, "2023-01-11 15:15:28", "2023-08-29 10:49:48", NULL),
	(436, 1, 8, "1.1.8.1.2.1.4", 20, "1.1.8.1.2.1.4.20", "118121420", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Penyuluhan dan promosi kesehatan bagi pegawai di lingkungan RSJ Dr Soeharto Heerdjan", 6, "KEG", 1125000, 6750000, 6750000, 6750000, 0, NULL, 20, "2023-01-11 15:16:14", "2023-01-11 15:16:14", NULL),
	(437, 1, 8, "1.1.8.1.2.1.4", 21, "1.1.8.1.2.1.4.21", "118121421", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Penyuluhan dan skreening deteksi dini di lapas", 6, "KEG", 1125000, 6750000, 6750000, 6750000, 0, NULL, 20, "2023-01-11 15:16:54", "2023-01-11 15:16:54", NULL),
	(438, 1, 8, "1.1.8.1.2.1.4", 22, "1.1.8.1.2.1.4.22", "118121422", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Penyuluhan dan skreening deteksi dini di Posbindu", 6, "KEG", 1125000, 6750000, 6750000, 6750000, 0, NULL, 20, "2023-01-11 15:17:35", "2023-01-11 15:17:35", NULL),
	(439, 1, 8, "1.1.8.1.2.1.4", 23, "1.1.8.1.2.1.4.23", "118121423", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Penyuluhan dan skreening deteksi dini di sekolah", 6, "KEG", 1575000, 9450000, 9450000, 9450000, 0, NULL, 20, "2023-01-11 15:18:15", "2023-08-29 10:49:48", NULL),
	(440, 1, 8, "1.1.8.1.2.1.4", 24, "1.1.8.1.2.1.4.24", "118121424", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Kegiatan promosi dalam rangka Peringatan Hari Kesehatan Jiwa Sedunia", 1, "KEG", 71240000, 71240000, 71240000, 71240000, 0, NULL, 20, "2023-01-11 15:19:04", "2023-01-11 15:19:04", NULL),
	(441, 1, 8, "1.1.8.1.2.1.4", 25, "1.1.8.1.2.1.4.25", "118121425", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Kegiatan promosi dalam rangka Peringatan Hari Kesehatan Nasional", 1, "KEG", 77960000, 77960000, 77960000, 77960000, 0, NULL, 20, "2023-01-11 15:19:42", "2023-01-11 15:19:42", NULL),
	(442, 1, 8, "1.1.8.1.2.1.4", 26, "1.1.8.1.2.1.4.26", "118121426", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Kegiatan promosi dalam rangka Peringatan Ulang Tahun RSJSH", 1, "KEG", 50682500, 50682500, 50682000, 50682000, 0, NULL, 20, "2023-01-11 15:20:56", "2023-01-11 15:20:56", NULL),
	(443, 1, 8, "1.1.8.1.2.1.4", 27, "1.1.8.1.2.1.4.27", "118121427", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Promkes bagi keluarga, pasien, mahasiswa dan umum", 24, "KEG", 1125000, 27000000, 27000000, 27000000, 0, NULL, 20, "2023-01-11 15:21:37", "2023-08-29 10:49:48", NULL),
	(444, 1, 8, "1.1.8.1.2.1.4", 28, "1.1.8.1.2.1.4.28", "118121428", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Promkes bagi petugas, WBS di Panti Sosial", 36, "KEG", 1575000, 56700000, 56700000, 56700000, 0, NULL, 20, "2023-01-11 15:22:19", "2023-08-29 10:49:48", NULL),
	(445, 1, 8, "1.1.8.1.2.1.4", 29, "1.1.8.1.2.1.4.29", "118121429", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Promosi kesehatan di Car Free Day", 12, "KEG", 2240000, 26880000, 26880000, 26880000, 0, NULL, 20, "2023-01-11 15:22:58", "2023-01-11 15:22:58", NULL),
	(446, 1, 8, "1.1.8.1.2.1.4", 30, "1.1.8.1.2.1.4.30", "118121430", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Sosialisasi bagi petugas kesehatan, dokter dan perawat PKM tentang layanan di RSJSH", 6, "KEG", 900000, 5400000, 5400000, 5400000, 0, NULL, 20, "2023-01-11 15:23:31", "2023-01-11 15:23:31", NULL),
	(447, 1, 8, "1.1.8.1.2.1.4", 31, "1.1.8.1.2.1.4.31", "118121431", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Sosialisasi kesehatan jiwa", 12, "KEG", 840000, 10080000, 10080000, 10080000, 0, NULL, 20, "2023-01-11 15:24:17", "2023-01-11 15:24:17", NULL),
	(448, 1, 8, "1.1.8.1.2.1.4", 32, "1.1.8.1.2.1.4.32", "118121432", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswamas - Webinar/ seminar kesehatan jiwa", 6, "KEG", 18375000, 110250000, 110250000, 110250000, 0, NULL, 20, "2023-01-11 15:24:58", "2023-08-29 10:49:48", NULL),
	(449, 1, 8, "1.1.8.1.2.1.4", 33, "1.1.8.1.2.1.4.33", "118121433", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Promosi Layanan Keswa Anak", 1, "Tahun", 21360000, 21360000, 19956500, 21360000, 0, NULL, 20, "2023-01-11 15:25:41", "2023-04-06 10:24:12", "2023-04-06 10:24:12"),
	(450, 1, 8, "1.1.8.1.2.1.4", 34, "1.1.8.1.2.1.4.34", "118121434", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Edukasi dan screening kesehatan mental anak", 1, "Tahun", 6400000, 6400000, 6400000, 6400000, 0, NULL, 20, "2023-01-11 15:26:20", "2023-04-06 10:25:42", "2023-04-06 10:25:42"),
	(451, 1, 8, "1.1.8.1.2.1.4", 35, "1.1.8.1.2.1.4.35", "118121435", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Pengembangan Kompetensi Terapis", 1, "Tahun", 10180000, 10180000, 10180000, 10180000, 0, NULL, 20, "2023-01-11 15:27:13", "2023-04-06 10:26:13", "2023-04-06 10:26:13"),
	(452, 1, 8, "1.1.8.1.2.1.4", 36, "1.1.8.1.2.1.4.36", "118121436", "1", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Training Orang Tua", 1, "Tahun", 1575000, 1575000, 1575000, 1575000, 0, NULL, 10, "2023-01-11 15:27:47", "2023-04-06 10:26:53", NULL),
	(453, 1, 8, "1.1.8.1.2.1.4", 37, "1.1.8.1.2.1.4.37", "118121437", "1", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Pengembangan Kemadirian Anak dan Remaja", 1, "Tahun", 10400000, 10400000, 10400000, 10400000, 0, NULL, 10, "2023-01-11 15:28:26", "2023-08-29 10:49:48", NULL),
	(454, 1, 8, "1.1.8.1.2.1.4", 38, "1.1.8.1.2.1.4.38", "118121438", "1", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Terapi Olah Raga", 1, "Tahun", 1500000, 1500000, 1500000, 1500000, 0, NULL, 10, "2023-01-11 15:29:06", "2023-04-06 10:28:13", NULL),
	(455, 1, 8, "1.1.8.1.2.1.4", 39, "1.1.8.1.2.1.4.39", "118121439", "1", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Terapi Seni dan Kriya", 1, "Tahun", 8086000, 8086000, 8086000, 8086000, 0, NULL, 10, "2023-01-11 15:30:07", "2023-04-06 10:28:48", NULL),
	(456, 1, 8, "1.1.8.1.2.1.4", 40, "1.1.8.1.2.1.4.40", "118121440", "1", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Terapi Remedial", 1, "Tahun", 1898000, 1898000, 1898000, 1898000, 0, NULL, 10, "2023-01-11 15:30:51", "2023-04-06 10:29:35", NULL),
	(457, 1, 8, "1.1.8.1.2.1.4", 41, "1.1.8.1.2.1.4.41", "118121441", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Saluran Informasi dan edukasi", 1, "Tahun", 10000000, 10000000, 10000000, 10000000, 0, NULL, 20, "2023-01-11 15:31:31", "2023-04-06 10:30:11", "2023-04-06 10:30:11"),
	(458, 1, 8, "1.1.8.1.2.1.4", 42, "1.1.8.1.2.1.4.42", "118121442", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Saluran Informasi dan edukasi", 1, "Tahun", 10000000, 10000000, 10000000, 10000000, 0, NULL, 20, "2023-01-11 15:32:08", "2023-01-11 15:39:38", "2023-01-11 15:39:38"),
	(459, 1, 8, "1.1.8.1.2.1.4", 43, "1.1.8.1.2.1.4.43", "118121443", "1", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - FGD (Focus Group Discussion) R. Kolibri", 1, "Tahun", 2000000, 2000000, 2000000, 2000000, 0, NULL, 10, "2023-01-11 15:32:48", "2023-04-06 10:31:54", NULL),
	(460, 1, 8, "1.1.8.1.2.1.4", 44, "1.1.8.1.2.1.4.44", "118121444", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Stimulasi Minat Bakat R. Kolibri", 1, "Tahun", 4000000, 4000000, 4000000, 4000000, 0, NULL, 20, "2023-01-11 15:33:26", "2023-08-29 10:49:48", NULL),
	(461, 1, 8, "1.1.8.1.2.1.4", 45, "1.1.8.1.2.1.4.45", "118121445", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Anak dan Remaja - Saluran Informasi dan edukasi", 1, "Tahun", 2000000, 2000000, 2000000, 2000000, 0, NULL, 20, "2023-01-11 15:34:04", "2023-04-06 10:33:05", "2023-04-06 10:33:05"),
	(462, 1, 8, "1.1.8.1.2.1.4", 46, "1.1.8.1.2.1.4.46", "118121446", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Rawat Inap Dewasa -  Terapi aktifitas  kelompok (ketrampilan tangan)", 1, "Tahun", 8640000, 8640000, 8640000, 8640000, 0, NULL, 20, "2023-01-11 15:34:44", "2023-01-11 15:34:44", NULL),
	(463, 1, 8, "1.1.8.1.2.1.4", 47, "1.1.8.1.2.1.4.47", "118121447", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Rawat Inap Dewasa - Focus Grup Diskusi Keluarga", 1, "Tahun", 5400000, 5400000, 5400000, 5400000, 0, NULL, 20, "2023-01-11 15:35:23", "2023-08-29 10:49:48", NULL),
	(464, 1, 8, "1.1.8.1.2.1.4", 48, "1.1.8.1.2.1.4.48", "118121448", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Rawat Inap Dewasa - Terapi Spiritual", 1, "Tahun", 5400000, 5400000, 5400000, 5400000, 0, NULL, 20, "2023-01-11 15:36:02", "2023-01-11 15:36:02", NULL),
	(465, 1, 8, "1.1.8.1.2.1.4", 49, "1.1.8.1.2.1.4.49", "118121449", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Rawat Inap Dewasa - Terapi Olah Raga", 1, "Tahun", 4200000, 4200000, 4200000, 4200000, 0, NULL, 20, "2023-01-11 15:36:45", "2023-01-11 15:36:45", NULL),
	(466, 1, 8, "1.1.8.1.2.1.4", 50, "1.1.8.1.2.1.4.50", "118121450", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Keswa Rawat Inap Dewasa - Terapi seni, arth terapi, craft", 1, "Tahun", 9025000, 9025000, 9025000, 9025000, 0, NULL, 20, "2023-01-11 15:37:30", "2023-01-11 15:37:30", NULL),
	(467, 1, 3, "1.1", 9, "1.1.9", "119", "0", "0", "6388.FAE", "Pemantauan dan Evaluasi serta Pelaporan", 2, "Laporan", 0, 110000000, 110000000, 110000000, 0, NULL, 10, "2023-01-12 08:32:14", "2023-01-12 08:32:14", NULL),
	(468, 1, 4, "1.1.9", 1, "1.1.9.1", "1191", "0", "0", "6388.FAE.001", "Layanan Pemantauan dan Evaluasi serta Pelaporan di UPT Vertikal", 2, "Laporan", 0, 110000000, 110000000, 110000000, 0, NULL, 10, "2023-01-12 08:33:09", "2023-01-12 08:33:09", NULL),
	(469, 1, 5, "1.1.9.1", 1, "1.1.9.1.1", "11911", "0", "0", "052", "Layanan Pemantauan dan Evaluasi serta Pelaporan di UPT Vertikal", 0, NULL, 0, 110000000, 110000000, 110000000, 0, NULL, 10, "2023-01-12 08:33:40", "2023-01-12 08:33:40", NULL),
	(470, 1, 6, "1.1.9.1.1", 1, "1.1.9.1.1.1", "119111", "0", "0", "A", "Layanan Pemantauan dan Evaluasi serta Pelaporan di UPT Vertikal BLU", 0, NULL, 0, 110000000, 110000000, 110000000, 0, NULL, 10, "2023-01-12 08:34:24", "2023-01-12 08:34:24", NULL),
	(471, 1, 7, "1.1.9.1.1.1", 1, "1.1.9.1.1.1.1", "1191111", "0", "0", "525113", "Belanja Jasa", 0, NULL, 0, 110000000, 110000000, 110000000, 0, NULL, 10, "2023-01-12 08:34:52", "2023-01-12 08:34:52", NULL),
	(472, 1, 8, "1.1.9.1.1.1.1", 1, "1.1.9.1.1.1.1.1", "11911111", "0", "0", "6388.FAE.001/052/A/525113", "Jasa Konsultan Audit Kinerja", 1, "Layanan", 40000000, 40000000, 40000000, 40000000, 0, NULL, 10, "2023-01-12 08:35:49", "2023-09-06 14:42:30", NULL),
	(473, 1, 8, "1.1.9.1.1.1.1", 2, "1.1.9.1.1.1.1.2", "11911112", "0", "0", "6388.FAE.001/052/A/525113", "Jasa Konsultan Audit Keuangan", 1, "Layanan", 70000000, 70000000, 10000000, 70000000, 0, NULL, 10, "2023-01-12 08:35:49", "2023-09-06 13:34:53", NULL),
	(474, 1, 8, "1.1.5.1.1.1.1", 85, "1.1.5.1.1.1.1.85", "115111185", "1", "0", "6388.CBV.004/052/A/537112", "Meja Kerja 1 biro", 1, "Unit", 3175000, 3175000, 3175000, 3175000, 0, NULL, 10, "2023-03-14 09:35:16", "2023-07-04 11:19:18", NULL),
	(475, 1, 8, "1.1.8.1.2.1.2", 27, "1.1.8.1.2.1.2.27", "118121227", "0", "0", "6388.EBA.962/052/A/525113", "Belanja Jasa Honorer S2 Psikologi Klinis [1 ORG x 12 BLN]", 12, "OB", 6095000, 73140000, 73140000, 73140000, 0, NULL, 10, "2023-03-14 10:28:19", "2023-08-29 10:49:48", NULL),
	(476, 1, 8, "1.1.8.1.2.1.2", 28, "1.1.8.1.2.1.2.28", "118121228", "0", "0", "6388.EBA.962/052/A/525113", "Belanja Jasa Honorer S2 kompetensi Bidang Kontruksi [1 ORG x 12 BLN]", 12, "OB", 6095000, 73140000, 73140000, 73140000, 0, NULL, 10, "2023-03-14 10:29:28", "2023-08-29 10:49:48", NULL),
	(477, 1, 8, "1.1.8.1.2.1.2", 29, "1.1.8.1.2.1.2.29", "118121229", "0", "0", "6388.EBA.962/052/A/525113", "Belanja Jasa Honorer S2 Psikologi Klinis THR dan Gaji 13 [1 ORG x 2 BLN]", 2, "OB", 5545000, 11090000, 11090000, 11090000, 0, NULL, 10, "2023-03-14 10:36:42", "2023-08-29 10:49:48", NULL),
	(478, 1, 8, "1.1.8.1.2.1.2", 30, "1.1.8.1.2.1.2.30", "118121230", "0", "0", "6388.EBA.962/052/A/525113", "Belanja Jasa Honorer S2 kompetensi Bidang Kontruksi THR dan Gaji 13 [1 ORG x 2 BLN]", 2, "OB", 5545000, 11090000, 11090000, 11090000, 0, NULL, 10, "2023-03-14 10:37:35", "2023-09-05 13:08:33", NULL),
	(479, 1, 8, "1.1.8.1.2.1.3", 37, "1.1.8.1.2.1.3.37", "118121337", "0", "0", "6388.EBA.962/052/A/525115", "Biaya Transportasi Kegiatan Dalam Kabupaten/Kota Pulang Pergi (PP)", 523, "OH", 150000, 78450000, 78450000, 78450000, 0, NULL, 10, "2023-03-14 11:19:14", "2023-08-29 10:49:48", NULL),
	(480, 1, 8, "1.1.8.1.2.1.3", 38, "1.1.8.1.2.1.3.38", "118121338", "0", "0", "6388.EBA.962/052/A/525115", "Uang Representasi Luar Kota Pejabat Eselon II", 73, "OH", 150000, 10950000, 10950000, 10950000, 0, NULL, 10, "2023-03-14 11:19:53", "2023-08-29 10:49:49", NULL),
	(481, 1, 8, "1.1.8.1.2.1.3", 39, "1.1.8.1.2.1.3.39", "118121339", "0", "0", "6388.EBA.962/052/A/525115", "Uang Representasi Dalam Kota Pejabat Eselon II", 100, "OH", 75000, 7500000, 7500000, 7500000, 0, NULL, 10, "2023-03-14 11:20:27", "2023-08-29 10:49:49", NULL),
	(482, 1, 8, "1.1.8.1.2.1.3", 40, "1.1.8.1.2.1.3.40", "118121340", "0", "0", "6388.EBA.962/052/A/525115", "Uang Harian Kegiatan Rapat / Pertemuan Di Luar Kantor (Fullboard Di Dalam Kota)", 40, "OH", 180000, 7200000, 7200000, 7200000, 0, NULL, 10, "2023-03-14 11:21:12", "2023-08-29 10:49:49", NULL),
	(483, 1, 8, "1.1.8.1.2.1.3", 41, "1.1.8.1.2.1.3.41", "118121341", "0", "0", "6388.EBA.962/052/A/525115", "Uang Harian Kegiatan Rapat / Pertemuan Di Luar Kantor (Fullday/Halfday Di Luar Kota/Di Dalam Kota)", 1915, "OH", 130000, 248950000, 248950000, 248950000, 0, NULL, 10, "2023-03-14 11:22:04", "2023-08-29 10:49:49", NULL),
	(484, 1, 8, "1.1.8.1.2.1.3", 42, "1.1.8.1.2.1.3.42", "118121342", "0", "0", "6388.EBA.962/052/A/525115", "Uang Harian Kegiatan Rapat / Pertemuan Di Luar Kantor (Fullboard Di Luar Kota)", 360, "OH", 180000, 64800000, 64800000, 64800000, 0, NULL, 10, "2023-03-14 11:22:49", "2023-08-29 10:49:49", NULL),
	(485, 1, 8, "1.1.8.1.2.1.3", 43, "1.1.8.1.2.1.3.43", "118121343", "0", "0", "6388.EBA.962/052/A/525115", "Biaya Penginapan Perjalanan Dinas Dalam Negeri", 171, "OH", 2755000, 471105000, 471105000, 471105000, 0, NULL, 10, "2023-03-14 11:23:52", "2023-08-29 10:49:49", NULL),
	(486, 1, 8, "1.1.8.1.2.1.3", 44, "1.1.8.1.2.1.3.44", "118121344", "0", "0", "6388.EBA.962/052/A/525115", "Biaya Tiket Pesawat Perjalanan Dinas Dalam Negeri Pulang Pergi (PP)", 41, "OH", 3262000, 133742000, 133742000, 133742000, 0, NULL, 10, "2023-03-14 11:24:39", "2023-08-29 10:49:49", NULL),
	(487, 1, 8, "1.1.8.1.2.1.3", 45, "1.1.8.1.2.1.3.45", "118121345", "0", "0", "6388.EBA.962/052/A/525115", "Biaya Taksi Perjalanan Dinas Dalam Negeri", 106, "OH", 256000, 27136000, 27136000, 27136000, 0, NULL, 10, "2023-03-14 11:25:27", "2023-08-29 10:49:49", NULL),
	(488, 1, 8, "1.1.8.1.2.1.3", 46, "1.1.8.1.2.1.3.46", "118121346", "0", "0", "6388.EBA.962/052/A/525115", "Biaya Transportasi dari DKI Jakarta ke Kota/Kabupaten Sekitar (Oneway)", 707, "OH", 310000, 219170000, 219170000, 219170000, 0, NULL, 10, "2023-03-14 11:29:53", "2023-08-29 10:49:49", NULL),
	(489, 1, 8, "1.1.8.1.2.1.3", 47, "1.1.8.1.2.1.3.47", "118121347", "0", "0", "6388.EBA.962/052/A/525115", "Biaya Test PCR/SWAB/Rapid Antigen", 50, "OH", 248020, 12401000, 12401000, 12401000, 0, NULL, 10, "2023-03-14 11:30:42", "2023-03-14 11:30:42", NULL),
	(490, 1, 8, "1.1.8.1.2.1.4", 51, "1.1.8.1.2.1.4.51", "118121451", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Rencana Kinerja Tahunan", 1, "KEG", 177120000, 177120000, 177120000, 177120000, 0, NULL, 10, "2023-03-14 12:15:07", "2023-03-14 12:15:07", NULL),
	(491, 1, 8, "1.1.8.1.2.1.4", 52, "1.1.8.1.2.1.4.52", "118121452", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Penguatan Kinerja Staf Medis", 1, "KEG", 129551000, 129551000, 129551000, 129551000, 0, NULL, 10, "2023-03-14 14:09:48", "2023-03-14 14:09:48", NULL),
	(492, 1, 8, "1.1.8.1.2.1.4", 53, "1.1.8.1.2.1.4.53", "118121453", "0", "0", "6388.EBA.962/052/A/525119", "Pengelolaan Kegiatan BLU", 1, "Tahun", 160385000, 160385000, 160385000, 160385000, 0, NULL, 10, "2023-03-14 14:10:51", "2023-08-29 10:49:49", NULL),
	(493, 1, 7, "1.1.6.1.2.1", 3, "1.1.6.1.2.1.3", "1161213", "0", "0", "523133", "Belanja Pemeliharaan Jaringan", 0, NULL, 0, 0, 0, 0, 0, NULL, 10, "2023-03-15 09:53:01", "2023-03-15 09:54:20", "2023-03-15 09:54:20"),
	(494, 1, 7, "2.1.1.1.2.1", 13, "2.1.1.1.2.1.13", "21112113", "0", "0", "523133", "Belanja Pemeliharaan Jaringan", 0, NULL, 0, 180776000, 180776000, 180776000, 0, NULL, 10, "2023-03-15 09:56:31", "2023-03-15 09:56:31", NULL),
	(495, 1, 8, "2.1.1.1.2.1.13", 1, "2.1.1.1.2.1.13.1", "211121131", "0", "0", "4813.EBA.994/002/A/523133", "Biaya Pemeliharaan dan Perbaikan SIMRS", 1, "PKT", 110000000, 110000000, 110000000, 110000000, 0, NULL, 10, "2023-03-15 09:57:24", "2023-09-04 11:44:31", NULL),
	(496, 1, 8, "2.1.1.1.2.1.13", 2, "2.1.1.1.2.1.13.2", "211121132", "0", "0", "4813.EBA.994/002/A/523133", "Biaya Pemeliharaan dan Perbaikan Jaringan LAN", 1, "PKT", 70776000, 70776000, 70776000, 70776000, 0, NULL, 10, "2023-03-15 09:58:20", "2023-09-06 08:28:04", NULL),
	(497, 1, 8, "1.1.8.1.2.1.4", 54, "1.1.8.1.2.1.4.54", "118121454", "0", "0", "6388.EBA.962/052/A/525119", "Terapi Rekreasi", 1, "Tahun", 25000000, 25000000, 25000000, 25000000, 0, NULL, 10, "2023-04-06 10:34:26", "2023-04-06 10:34:26", NULL),
	(498, 1, 8, "1.1.8.1.2.1.4", 55, "1.1.8.1.2.1.4.55", "118121455", "0", "0", "6388.EBA.962/052/A/525119", "Kegiatan Daycare Transisi", 1, "Tahun", 25277000, 25277000, 25277000, 25277000, 0, NULL, 10, "2023-04-06 10:35:51", "2023-04-06 10:35:51", NULL),
	(499, 1, 8, "1.1.3.1.1.1.1", 23, "1.1.3.1.1.1.1.23", "113111123", "1", "0", "6388.CAB.002/052/A/537112", "USG Bone dan Interventional Pain", 1, "Unit", 879121000, 879121000, 879121000, 879121000, 0, NULL, 10, "2023-04-06 10:43:33", "2023-08-24 13:22:34", NULL),
	(500, 1, 8, "1.1.5.1.1.1.1", 86, "1.1.5.1.1.1.1.86", "115111186", "0", "0", "6388.CBV.004/052/A/537112", "Gas Detector", 1, "Unit", 3640000, 3640000, 3640000, 3640000, 0, NULL, 10, "2023-04-06 10:48:04", "2023-08-29 10:49:49", NULL),
	(501, 1, 8, "1.1.3.1.1.1.1", 24, "1.1.3.1.1.1.1.24", "113111124", "1", "0", "6388.CAB.002/052/A/537112", "Laryngoscope", 4, "Unit", 8503000, 34012000, 34012000, 34012000, 0, NULL, 10, "2023-07-04 10:09:42", "2023-07-04 10:09:57", NULL),
	(502, 1, 8, "1.1.3.1.1.1.1", 25, "1.1.3.1.1.1.1.25", "113111125", "0", "0", "6388.CAB.002/052/A/537112", "Autoclave", 1, "Unit", 62210000, 62210000, 62210000, 62210000, 0, NULL, 10, "2023-07-04 10:10:34", "2023-07-04 10:10:34", NULL),
	(503, 1, 8, "1.1.3.1.1.1.1", 26, "1.1.3.1.1.1.1.26", "113111126", "0", "0", "6388.CAB.002/052/A/537112", "BIS Complete Monitoring System", 1, "Unit", 138085000, 138085000, 138085000, 138085000, 0, NULL, 10, "2023-07-04 10:13:29", "2023-07-04 10:13:29", NULL),
	(504, 1, 8, "1.1.3.1.1.1.1", 27, "1.1.3.1.1.1.1.27", "113111127", "0", "0", "6388.CAB.002/052/A/537112", "Alat kimia klinik otomatik", 1, "Unit", 300003000, 300003000, 300003000, 300003000, 0, NULL, 10, "2023-07-04 10:14:01", "2023-07-04 10:14:01", NULL),
	(505, 1, 8, "1.1.3.1.1.1.1", 28, "1.1.3.1.1.1.1.28", "113111128", "0", "0", "6388.CAB.002/052/A/537112", "EKG (Electrocardiograph)", 3, "Unit", 65600000, 196800000, 196800000, 196800000, 0, NULL, 10, "2023-07-04 10:14:40", "2023-07-04 10:14:40", NULL),
	(506, 1, 8, "1.1.3.1.1.1.1", 29, "1.1.3.1.1.1.1.29", "113111129", "0", "0", "6388.CAB.002/052/A/537112", "Video Laringoscope", 2, "Unit", 44289000, 88578000, 88578000, 88578000, 0, NULL, 10, "2023-07-04 10:22:32", "2023-08-24 13:22:40", NULL),
	(507, 1, 8, "1.1.3.1.1.1.1", 30, "1.1.3.1.1.1.1.30", "113111130", "0", "0", "6388.CAB.002/052/A/537112", "PACS", 1, "Unit", 1087400000, 1087400000, 1087400000, 1087400000, 0, NULL, 10, "2023-07-04 10:27:27", "2023-07-04 10:27:27", NULL),
	(508, 1, 8, "1.1.3.1.1.1.1", 31, "1.1.3.1.1.1.1.31", "113111131", "0", "0", "6388.CAB.002/052/A/537112", "Target Control Infusion (TCI)", 2, "Unit", 39804000, 79608000, 79608000, 79608000, 0, NULL, 10, "2023-07-04 10:28:08", "2023-07-04 10:28:08", NULL),
	(509, 1, 8, "1.1.3.1.1.1.1", 32, "1.1.3.1.1.1.1.32", "113111132", "0", "0", "6388.CAB.002/052/A/537112", "Head Cap", 4, "Set", 21090000, 84360000, 84360000, 84360000, 0, NULL, 10, "2023-07-04 10:28:38", "2023-07-04 10:28:38", NULL),
	(510, 1, 8, "1.1.3.1.1.1.1", 33, "1.1.3.1.1.1.1.33", "113111133", "0", "0", "6388.CAB.002/052/A/537112", "Automatic External Defibrilator (AED )", 3, "Unit", 34240000, 102720000, 102720000, 102720000, 0, NULL, 10, "2023-07-04 10:29:04", "2023-07-04 10:29:04", NULL),
	(511, 1, 8, "1.1.3.1.1.1.1", 34, "1.1.3.1.1.1.1.34", "113111134", "0", "0", "6388.CAB.002/052/A/537112", "Panoramic", 1, "Unit", 664570000, 664570000, 664570000, 664570000, 0, NULL, 10, "2023-07-04 10:29:50", "2023-07-04 10:29:50", NULL),
	(512, 1, 4, "1.1.5", 2, "1.1.5.2", "1152", "1", "0", "6388.CBV.002", "Renovasi Gedung Layanan", 1330, "Unit", 0, 1623000000, 1623000000, 1623000000, 0, NULL, 10, "2023-07-04 10:31:58", "2023-07-04 10:34:19", NULL),
	(513, 1, 5, "1.1.5.2", 1, "1.1.5.2.1", "11521", "0", "0", "052", "Renovasi Gedung Layanan", 0, NULL, 0, 1623000000, 1623000000, 1623000000, 0, NULL, 10, "2023-07-04 10:34:55", "2023-07-04 10:34:55", NULL),
	(514, 1, 6, "1.1.5.2.1", 1, "1.1.5.2.1.1", "115211", "0", "0", "A", "Renovasi Gedung Layanan", 0, NULL, 0, 1623000000, 1623000000, 1623000000, 0, NULL, 10, "2023-07-04 10:36:09", "2023-07-04 10:36:09", NULL),
	(515, 1, 7, "1.1.5.2.1.1", 1, "1.1.5.2.1.1.1", "1152111", "0", "0", "537113", "Belanja Modal Gedung dan Bangunan BLU", 0, NULL, 0, 1623000000, 1623000000, 1623000000, 0, NULL, 10, "2023-07-04 10:36:56", "2023-07-04 10:36:56", NULL),
	(516, 1, 8, "1.1.5.2.1.1.1", 1, "1.1.5.2.1.1.1.1", "11521111", "0", "0", "6388.CBV.002/052/A/537113", "Renovasi Gedung Merak, Perkutut dan Napza (Puri Nurani)", 1330, "M2", 1220301, 1623000330, 1623000000, 1623000000, 0, NULL, 10, "2023-07-04 10:37:34", "2023-07-04 10:37:34", NULL),
	(517, 1, 8, "1.1.5.1.1.1.1", 87, "1.1.5.1.1.1.1.87", "115111187", "0", "0", "6388.CBV.004/052/A/537112", "Kulkas 1 pintu", 12, "Unit", 4500000, 54000000, 54000000, 54000000, 0, NULL, 10, "2023-07-04 11:21:17", "2023-07-04 11:21:17", NULL),
	(518, 1, 8, "1.1.5.1.1.1.1", 88, "1.1.5.1.1.1.1.88", "115111188", "0", "0", "6388.CBV.004/052/A/537112", "Kursi Pasien", 145, "Unit", 2500000, 362500000, 362500000, 362500000, 0, NULL, 10, "2023-07-04 11:21:55", "2023-07-04 11:21:55", NULL),
	(519, 1, 8, "1.1.5.1.1.1.1", 89, "1.1.5.1.1.1.1.89", "115111189", "0", "0", "6388.CBV.004/052/A/537112", "Baby Taufel", 1, "Unit", 8962000, 8962000, 8962000, 8962000, 0, NULL, 10, "2023-07-04 11:22:36", "2023-07-04 11:22:36", NULL),
	(520, 1, 8, "1.1.5.1.1.1.1", 90, "1.1.5.1.1.1.1.90", "115111190", "0", "0", "6388.CBV.004/052/A/537112", "chiller", 1, "Unit", 166938000, 166938000, 166938000, 166938000, 0, NULL, 10, "2023-07-04 11:23:08", "2023-07-04 11:23:08", NULL),
	(521, 1, 8, "1.1.5.1.1.1.1", 91, "1.1.5.1.1.1.1.91", "115111191", "0", "0", "6388.CBV.004/052/A/537112", "Pallet", 6, "Unit", 1387500, 8325000, 8325000, 8325000, 0, NULL, 10, "2023-07-04 11:23:45", "2023-07-04 11:23:45", NULL),
	(522, 1, 8, "1.1.5.1.1.1.1", 92, "1.1.5.1.1.1.1.92", "115111192", "0", "0", "6388.CBV.004/052/A/537112", "Water Heater", 1, "Unit", 10550000, 10550000, 10550000, 10550000, 0, NULL, 10, "2023-07-04 11:24:15", "2023-07-04 11:24:15", NULL),
	(523, 1, 8, "1.1.5.1.1.1.1", 93, "1.1.5.1.1.1.1.93", "115111193", "0", "0", "6388.CBV.004/052/A/537112", "AC 2PK", 2, "Unit", 9712500, 19425000, 19425000, 19425000, 0, NULL, 10, "2023-07-04 11:24:53", "2023-07-04 11:24:53", NULL),
	(524, 1, 8, "1.1.5.1.1.1.1", 94, "1.1.5.1.1.1.1.94", "115111194", "0", "0", "6388.CBV.004/052/A/537112", "Fresh Air", 1, "Unit", 57720000, 57720000, 57720000, 57720000, 0, NULL, 10, "2023-07-04 11:26:57", "2023-07-04 11:26:57", NULL),
	(525, 1, 8, "1.1.5.1.1.1.1", 95, "1.1.5.1.1.1.1.95", "115111195", "0", "0", "6388.CBV.004/052/A/537112", "Rak Besi", 2, "Unit", 2110000, 4220000, 4220000, 4220000, 0, NULL, 10, "2023-07-04 11:27:30", "2023-07-04 11:27:30", NULL),
	(526, 1, 8, "1.1.5.1.1.1.1", 96, "1.1.5.1.1.1.1.96", "115111196", "0", "0", "6388.CBV.004/052/A/537112", "CCTV 4 channel", 1, "Set", 17700000, 17700000, 17700000, 17700000, 0, NULL, 10, "2023-07-04 11:31:57", "2023-07-04 11:31:57", NULL),
	(527, 1, 8, "1.1.5.1.1.1.1", 97, "1.1.5.1.1.1.1.97", "115111197", "0", "0", "6388.CBV.004/052/A/537112", "Printer Dot Matrix", 1, "Unit", 9191000, 9191000, 9191000, 9191000, 0, NULL, 10, "2023-07-04 11:41:26", "2023-07-04 11:41:26", NULL),
	(528, 1, 8, "1.1.5.1.1.1.1", 98, "1.1.5.1.1.1.1.98", "115111198", "0", "0", "6388.CBV.004/052/A/537112", "Komputer", 4, "Set", 28761000, 115044000, 115044000, 115044000, 0, NULL, 10, "2023-07-04 11:42:32", "2023-07-04 11:42:32", NULL),
	(529, 1, 8, "1.1.5.1.1.1.1", 99, "1.1.5.1.1.1.1.99", "115111199", "0", "0", "6388.CBV.004/052/A/537112", "Laptop", 1, "Unit", 22731000, 22731000, 22731000, 22731000, 0, NULL, 10, "2023-07-04 11:43:03", "2023-07-04 11:43:03", NULL),
	(530, 1, 8, "1.1.5.1.1.1.1", 100, "1.1.5.1.1.1.1.100", "1151111100", "0", "0", "6388.CBV.004/052/A/537112", "Printer Kartu Berobat", 1, "Unit", 18000000, 18000000, 18000000, 18000000, 0, NULL, 10, "2023-07-07 11:39:51", "2023-07-07 11:39:51", NULL),
	(531, 1, 8, "1.1.5.1.1.1.1", 101, "1.1.5.1.1.1.1.101", "1151111101", "0", "0", "6388.CBV.004/052/A/537112", "Mesin Cuci Laundry", 1, "Unit", 23125000, 23125000, 23125000, 23125000, 0, NULL, 10, "2023-07-07 11:40:27", "2023-07-07 11:40:27", NULL),
	(532, 1, 8, "1.1.5.1.1.1.1", 102, "1.1.5.1.1.1.1.102", "1151111102", "0", "0", "6388.CBV.004/052/A/537112", "Printer Laserjet Pro 107A", 2, "Unit", 2250000, 4500000, 4500000, 4500000, 0, NULL, 10, "2023-07-07 11:40:59", "2023-07-07 11:40:59", NULL),
	(533, 1, 8, "1.1.5.1.1.1.1", 103, "1.1.5.1.1.1.1.103", "1151111103", "0", "0", "6388.CBV.004/052/A/537112", "Finger Print", 4, "Unit", 2350000, 9400000, 9400000, 9400000, 0, NULL, 10, "2023-07-07 11:41:27", "2023-07-07 11:41:27", NULL);

/*!40000 ALTER TABLE `itemsv3rkakl` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table kelengkapan_pajak
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kelengkapan_pajak`;

CREATE TABLE `kelengkapan_pajak` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_checklist` bigint DEFAULT NULL,
  `kode_billing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ntpn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ntb` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kode_jenispajak` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kode_jenissetoran` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `no_spm` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `no_sp2d` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sudah_dilengkapi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kelengkapan_pajak_user_id_foreign` (`user_id`),
  CONSTRAINT `kelengkapan_pajak_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table kode_transaksi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kode_transaksi`;

CREATE TABLE `kode_transaksi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jenis_transaksi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpkas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpbank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bptunai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpbpp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpupb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpls` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bppajak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bppendapatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpudbp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpupk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bphibah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpuangtitipan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpdana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bplain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_transaksi_user_id_foreign` (`user_id`),
  CONSTRAINT `kode_transaksi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `kode_transaksi` WRITE;
/*!40000 ALTER TABLE `kode_transaksi` DISABLE KEYS */;

INSERT INTO `kode_transaksi` (`id`, `jenis_transaksi`, `bku`, `bpkas`, `bpbank`, `bptunai`, `bpum`, `bpbpp`, `bpupb`, `bpup`, `bpls`, `bppajak`, `bppendapatan`, `bpudbp`, `bpupk`, `bphibah`, `bpuangtitipan`, `bpdana`, `bplain`, `kode`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, "Pagu DIPA", "3", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(2, "SPM/SP2D LS Bendahara", "1", "1", "1", "", "", "", "", "", "1", "", "", "", "", "", "", "", "", "1", NULL, NULL, NULL, NULL),
	(3, "Pembayaran SPM/SP2D LS Bendahara Tunai", "2", "2", "", "2", "", "", "", "", "2", "", "", "", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(4, "Pembayaran SPM/SP2D LS Bendahara Transfer", "2", "2", "2", "", "", "", "", "", "2", "", "", "", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(5, "Setor SPM/SP2D LS Bendahara", "2", "2", "", "2", "", "", "", "", "2", "", "", "", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(6, "SPM/SP2D UP/TUP/GUP", "1", "1", "1", "", "", "", "", "1", "", "", "", "", "", "", "", "", "", "1", NULL, NULL, NULL, NULL),
	(7, "Setor Sisa UP/TUP", "2", "2", "", "2", "", "", "", "2", "", "", "", "", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(8, "PU Bank", "3", "3", "2", "1", "", "", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(9, "Kuitansi Tunai RM", "2", "2", "", "2", "", "", "", "2", "", "", "", "", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(10, "Kuitansi Transfer RM", "2", "2", "2", "", "", "", "", "2", "", "", "", "", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(11, "Pungut Pajak", "1", "1", "", "1", "", "", "", "", "", "1", "", "", "", "", "", "", "", "1", NULL, NULL, NULL, NULL),
	(12, "Setor Pajak", "2", "2", "", "2", "", "", "", "", "", "2", "", "", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(13, "Bayar Uang Muka Tunai", "3", "2", "", "2", "1", "", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(14, "Bayar Uang Muka Transfer", "3", "2", "2", "", "1", "", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(15, "Kekurangan Uang Muka", "3", "2", "", "2", "1", "", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(16, "Kuitansi Uang Muka/Rampung RM", "2", "", "", "", "2", "", "", "2", "", "", "", "", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(17, "Kuitansi Uang Muka/Rampung BLU", "2", "", "", "", "2", "", "", "", "", "", "", "2", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(18, "Kelebihan/Pengembalian Uang Muka", "3", "1", "", "1", "2", "", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(19, "Transfer ke BPP", "3", "3", "2", "", "", "1", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(20, "Tunai ke BPP", "3", "3", "", "2", "", "1", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(21, "Pengembalian Transfer BPP", "3", "3", "1", "", "", "2", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(22, "Pengembalian Tunai BPP", "3", "3", "", "1", "", "2", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(23, "Kuitansi LPJ BPP RM", "2", "", "", "", "", "2", "", "2", "", "", "", "", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(24, "Kuitansi LPJ BPP BLU", "2", "", "", "", "", "2", "", "", "", "", "", "2", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(25, "Terima Transfer Uang Lain-lain ", "1", "1", "1", "", "", "", "", "", "", "", "", "", "", "", "", "", "1", "1", NULL, NULL, NULL, NULL),
	(26, "Terima Tunai Uang Lain-lain ", "1", "1", "", "1", "", "", "", "", "", "", "", "", "", "", "", "", "1", "1", NULL, NULL, NULL, NULL),
	(27, "Keluar Transfer Uang Lain-lain ", "2", "2", "2", "", "", "", "", "", "", "", "", "", "", "", "", "", "2", "2", NULL, NULL, NULL, NULL),
	(28, "Keluar Tunai Uang Lain-lain ", "2", "2", "", "2", "", "", "", "", "", "", "", "", "", "", "", "", "2", "2", NULL, NULL, NULL, NULL),
	(29, "Setor ke Bank", "3", "3", "1", "2", "", "", "", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(30, "Terima Pendapatan BLU dari Bendahara Penerimaan", "1", "1", "1", "", "", "", "", "", "", "", "", "1", "", "", "", "", "", "1", NULL, NULL, NULL, NULL),
	(31, "Kuitansi Tunai BLU", "2", "2", "", "2", "", "", "", "", "", "", "", "2", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(32, "Kuitansi Transfer BLU", "2", "2", "2", "", "", "", "", "", "", "", "", "2", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(33, "Terima Dana Pihak Ketiga Transfer", "1", "1", "1", "", "", "", "", "", "", "", "", "", "1", "", "", "", "", "1", NULL, NULL, NULL, NULL),
	(34, "Terima Dana Pihak Ketiga Tunai", "1", "1", "", "", "", "", "", "", "", "", "", "", "1", "", "", "", "", "1", NULL, NULL, NULL, NULL),
	(35, "Alih Dana Pihak Ketiga ke Pendapatan", "3", "", "", "", "", "", "", "", "", "", "1", "", "2", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(36, "Bayar Dana Pihak Ketiga Tunai ", "2", "2", "", "2", "", "", "", "", "", "", "", "", "2", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(37, "Terima Dana Hibah/Donasi/Sumbangan", "1", "1", "1", "", "", "", "", "", "", "", "", "", "", "1", "", "", "", "1", NULL, NULL, NULL, NULL),
	(38, "Alih Dana Hibah/Donasi/Sumbangan ke Pendapatan", "3", "", "", "", "", "", "", "", "", "", "1", "", "", "2", "", "", "", "3", NULL, NULL, NULL, NULL),
	(39, "Kuitansi dari Dana Hibah/Donasi/Sumbangan", "2", "2", "", "2", "", "", "", "", "", "", "", "", "", "2", "", "", "", "2", NULL, NULL, NULL, NULL),
	(40, "Terima Dana Bergulir", "1", "1", "1", "", "", "", "", "", "", "", "", "", "", "", "", "1", "", "1", NULL, NULL, NULL, NULL),
	(41, "Penyaluran Dana Bergulir", "3", "2", "2", "", "", "", "1", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(42, "Pengembalian Dana Bergulir", "3", "1", "1", "", "", "", "2", "", "", "", "", "", "", "", "", "", "", "3", NULL, NULL, NULL, NULL),
	(43, "Pendapatan atas Dana Bergulir", "1", "1", "1", "", "", "", "", "", "", "", "1", "", "", "", "", "", "", "1", NULL, NULL, NULL, NULL),
	(44, "Penyelesaian Dana Bergulir", "2", "2", "2", "", "", "", "", "", "", "", "", "", "", "", "", "2", "", "2", NULL, NULL, NULL, NULL),
	(45, "Terima Uang Titipan", "1", "1", "1", "", "", "", "", "", "", "", "", "", "", "", "1", "", "", "1", NULL, NULL, NULL, NULL),
	(46, "Alih Dana Titipan ke Pendapatan", "3", "", "", "", "", "", "", "", "", "", "1", "", "", "", "2", "", "", "3", NULL, NULL, NULL, NULL),
	(47, "Penyaluran Pendapatan ke Bendahara Penerimaan", "2", "2", "2", "", "", "", "", "", "", "", "2", "", "", "", "", "", "", "2", NULL, NULL, NULL, NULL),
	(48, "Bayar Dana Pihak Ketiga Transfer", "2", "2", "2", "", "", "", "", "", "", "", "", "", "2", "", "", "", "", "2", NULL, NULL, NULL, NULL);

/*!40000 ALTER TABLE `kode_transaksi` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table kode_transaksi_penerimaan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kode_transaksi_penerimaan`;

CREATE TABLE `kode_transaksi_penerimaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jenis_transaksi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpkas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpbank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bptunai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bppendapatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpuangdibp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpdeposito` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bpinvestasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `bplain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika 1 maka debit, jika 2 maka kredit, jika 3 debit & kredit, jika kosong data tidak ada',
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_transaksi_penerimaan_user_id_foreign` (`user_id`),
  CONSTRAINT `kode_transaksi_penerimaan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `kode_transaksi_penerimaan` WRITE;
/*!40000 ALTER TABLE `kode_transaksi_penerimaan` DISABLE KEYS */;

INSERT INTO `kode_transaksi_penerimaan` (`id`, `jenis_transaksi`, `bku`, `bpkas`, `bpbank`, `bptunai`, `bppendapatan`, `bpuangdibp`, `bpdeposito`, `bpinvestasi`, `bplain`, `kode`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, "Pagu DIPA", "3", "", "", "", "", "", "", "", "", "3", 6, NULL, NULL, NULL),
	(2, "Bukti Pendapatan (SBS) Bank", "1", "1", "1", "", "1", "", "", "", "", "1", 6, NULL, NULL, NULL),
	(3, "Bukti Pendapatan (SBS) Tunai", "1", "1", "", "1", "1", "", "", "", "", "1", 6, NULL, NULL, NULL),
	(4, "Penarikan Uang dari Bank", "3", "3", "2", "1", "", "", "", "", "", "3", 6, NULL, NULL, NULL),
	(5, "Penyetoran Uang ke Bank", "3", "3", "1", "2", "", "", "", "", "", "3", 6, NULL, NULL, NULL),
	(6, "Penyaluran Uang ke Bendahara Pengeluaran Bank", "3", "2", "2", "", "", "1", "", "", "", "3", 6, NULL, NULL, NULL),
	(7, "Penyaluran Uang ke Bendahara Pengeluaran Tunai", "3", "2", "", "2", "", "1", "", "", "", "3", 6, NULL, NULL, NULL),
	(8, "Pembayaran Deposito", "3", "2", "2", "", "", "", "1", "", "", "3", 6, NULL, NULL, NULL),
	(9, "Pencairan Deposito", "3", "1", "1", "", "", "", "2", "", "", "3", 6, NULL, NULL, NULL),
	(10, "Pencairan Bunga Deposito", "1", "1", "1", "", "1", "", "", "", "", "1", 6, NULL, NULL, NULL),
	(11, "Pembayaran Investasi Jangka Pendek", "3", "2", "2", "", "", "", "", "1", "", "3", 6, NULL, NULL, NULL),
	(12, "Pencairan Investasi Jangka Pendek", "3", "1", "1", "", "", "", "", "2", "", "3", 6, NULL, NULL, NULL),
	(13, "Pencairan Return Investasi Jangka Pendek", "1", "1", "1", "", "1", "", "", "", "", "1", 6, NULL, NULL, NULL),
	(14, "Terima Transfer Uang Lain-lain ", "1", "1", "1", "", "", "", "", "", "1", "1", 6, NULL, NULL, NULL),
	(15, "Terima Tunai Uang Lain-lain", "1", "1", "", "1", "", "", "", "", "1", "1", 6, NULL, NULL, NULL),
	(16, "Keluar Transfer Uang Lain-lain ", "2", "2", "2", "", "", "", "", "", "2", "2", 6, NULL, NULL, NULL),
	(17, "Keluar Tunai Uang Lain-lain ", "2", "2", "", "2", "", "", "", "", "2", "2", 6, NULL, NULL, NULL),
	(18, "Terima Pendapatan dari Bendahara Pengeluaran", "1", "1", "1", "", "1", "", "", "", "", "1", 6, NULL, NULL, NULL),
	(19, "Belanja oleh Bendahara Pengeluaran (Rekon Internal)", "2", "", "", "", "2", "2", "", "", "", "2", 6, NULL, NULL, NULL),
	(20, "Pengembalian Pendapatan BLU kepada Pihak Ketiga Transfer", "2", "2", "2", "", "2", "", "", "", "", "2", 6, NULL, NULL, NULL),
	(21, "Pengembalian Pendapatan BLU kepada Pihak Ketiga Tunai", "2", "2", "", "2", "2", "", "", "", "", "2", 6, NULL, NULL, NULL),
	(22, "Alih Uang Lain-lain menjadi Pendapatan", "3", "3", "", "", "1", "", "", "", "2", "3", 6, NULL, NULL, NULL),
	(23, "Saldo Awal Rekening Koran", "1", "1", "1", "", "", "", "", "", "", "1", 6, NULL, NULL, NULL),
	(24, "Saldo Awal Kas Ditangan", "1", "1", "", "1", "", "", "", "", "", "1", 6, NULL, NULL, NULL),
	(25, "Saldo Awal Deposito", "", "", "", "", "", "", "1", "", "", "1", 6, NULL, NULL, NULL),
	(27, "Setoran Penerimaan Tunai ke Bank", "", "", "1", "", "", "", "", "", "", "1", 1, NULL, NULL, NULL);

/*!40000 ALTER TABLE `kode_transaksi_penerimaan` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table level_rkakl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `level_rkakl`;

CREATE TABLE `level_rkakl` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tingkatan` int DEFAULT NULL,
  `periode_tahun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `level_rkakl_user_id_foreign` (`user_id`),
  CONSTRAINT `level_rkakl_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `level_rkakl` WRITE;
/*!40000 ALTER TABLE `level_rkakl` DISABLE KEYS */;

INSERT INTO `level_rkakl` (`id`, `nama_level`, `tingkatan`, `periode_tahun`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, "program", 1, "2023", 10, "2023-01-10 09:05:56", "2023-01-10 09:05:56", NULL),
	(2, "kegiatan", 2, "2023", 10, "2023-01-10 09:06:17", "2023-01-10 09:06:17", NULL),
	(3, "kro", 3, "2023", 10, "2023-01-10 09:55:07", "2023-01-10 09:55:07", NULL),
	(4, "ro", 4, "2023", 10, "2023-01-10 09:55:21", "2023-01-10 09:55:21", NULL),
	(5, "komponen", 5, "2023", 10, "2023-01-10 09:55:49", "2023-01-10 09:55:49", NULL),
	(6, "sub komponen", 6, "2023", 10, "2023-01-10 09:56:07", "2023-01-10 09:56:07", NULL),
	(7, "akun", 7, "2023", 10, "2023-01-10 09:56:30", "2023-01-10 09:56:30", NULL),
	(8, "detil", 8, "2023", 10, "2023-01-10 09:57:09", "2023-01-10 09:57:09", NULL);

/*!40000 ALTER TABLE `level_rkakl` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table lv1_sumberdana
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lv1_sumberdana`;

CREATE TABLE `lv1_sumberdana` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lv1periode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv1kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv1deskripsi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv1volume` bigint NOT NULL,
  `lv1satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv1harga_satuan` bigint NOT NULL,
  `lv1jumlah_biaya` bigint NOT NULL,
  `lv1sisa` bigint NOT NULL,
  `lv1is_actived` int NOT NULL,
  `lv1is_used` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lv1_sumberdana_user_id_foreign` (`user_id`),
  CONSTRAINT `lv1_sumberdana_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table lv2_output
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lv2_output`;

CREATE TABLE `lv2_output` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sumberdana_id` bigint unsigned NOT NULL,
  `lv2periode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv2kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv2deskripsi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv2volume` bigint NOT NULL,
  `lv2satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv2harga_satuan` bigint NOT NULL,
  `lv2jumlah_biaya` bigint NOT NULL,
  `lv2sisa` bigint NOT NULL,
  `lv2is_actived` int NOT NULL,
  `lv2is_used` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lv2_output_sumberdana_id_foreign` (`sumberdana_id`),
  KEY `lv2_output_user_id_foreign` (`user_id`),
  CONSTRAINT `lv2_output_sumberdana_id_foreign` FOREIGN KEY (`sumberdana_id`) REFERENCES `lv1_sumberdana` (`id`),
  CONSTRAINT `lv2_output_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table lv3_komponen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lv3_komponen`;

CREATE TABLE `lv3_komponen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `output_id` bigint unsigned NOT NULL,
  `lv3periode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv3kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv3deskripsi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv3volume` bigint NOT NULL,
  `lv3satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv3harga_satuan` bigint NOT NULL,
  `lv3jumlah_biaya` bigint NOT NULL,
  `lv3sisa` bigint NOT NULL,
  `lv3is_actived` int NOT NULL,
  `lv3is_used` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lv3_komponen_output_id_foreign` (`output_id`),
  KEY `lv3_komponen_user_id_foreign` (`user_id`),
  CONSTRAINT `lv3_komponen_output_id_foreign` FOREIGN KEY (`output_id`) REFERENCES `lv2_output` (`id`),
  CONSTRAINT `lv3_komponen_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table lv4_akun
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lv4_akun`;

CREATE TABLE `lv4_akun` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `komponen_id` bigint unsigned NOT NULL,
  `lv4periode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv4kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv4deskripsi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv4volume` bigint NOT NULL,
  `lv4satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv4harga_satuan` bigint NOT NULL,
  `lv4jumlah_biaya` bigint NOT NULL,
  `lv4sisa` bigint NOT NULL,
  `lv4is_actived` int NOT NULL,
  `lv4is_used` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lv4_akun_komponen_id_foreign` (`komponen_id`),
  KEY `lv4_akun_user_id_foreign` (`user_id`),
  CONSTRAINT `lv4_akun_komponen_id_foreign` FOREIGN KEY (`komponen_id`) REFERENCES `lv3_komponen` (`id`),
  CONSTRAINT `lv4_akun_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table lv5_kegiatan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lv5_kegiatan`;

CREATE TABLE `lv5_kegiatan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `akun_id` bigint unsigned NOT NULL,
  `lv5periode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv5kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv5deskripsi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv5volume` bigint NOT NULL,
  `lv5satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lv5harga_satuan` bigint NOT NULL,
  `lv5jumlah_biaya` bigint NOT NULL,
  `lv5sisa` bigint NOT NULL,
  `lv5is_actived` int NOT NULL,
  `lv5is_used` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lv5_kegiatan_akun_id_foreign` (`akun_id`),
  KEY `lv5_kegiatan_user_id_foreign` (`user_id`),
  CONSTRAINT `lv5_kegiatan_akun_id_foreign` FOREIGN KEY (`akun_id`) REFERENCES `lv4_akun` (`id`),
  CONSTRAINT `lv5_kegiatan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table masterv3rkakl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `masterv3rkakl`;

CREATE TABLE `masterv3rkakl` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_rkakl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periode_rkakl` int DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `masterv3rkakl_user_id_foreign` (`user_id`),
  CONSTRAINT `masterv3rkakl_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `masterv3rkakl` WRITE;
/*!40000 ALTER TABLE `masterv3rkakl` DISABLE KEYS */;

INSERT INTO `masterv3rkakl` (`id`, `nama_rkakl`, `periode_rkakl`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, "Rincian Kertas Kerja Satker TA 2023", 2023, 10, "2023-01-10 09:59:26", "2023-01-10 09:59:26", NULL);

/*!40000 ALTER TABLE `masterv3rkakl` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, "2014_10_12_000000_create_users_table", 1),
	(2, "2014_10_12_100000_create_password_resets_table", 1),
	(3, "2019_08_19_000000_create_failed_jobs_table", 1),
	(4, "2020_08_22_094721_unit_layanan", 1),
	(7, "2020_10_07_043855_create_permission_tables", 2),
	(8, "2020_10_29_112348_create_penjamin", 3),
	(10, "2020_11_03_040755_create_bap", 5),
	(11, "2020_11_03_041126_create_pencairan", 6),
	(15, "2020_10_09_141033_create_pelayanan", 7),
	(22, "2020_10_31_033231_create_pengajuan_klaim", 8),
	(23, "2020_12_03_040631_create_item_pengajuanklaim", 8),
	(25, "2020_12_28_063437_create_penagihan", 10),
	(26, "2021_01_07_041448_create_penagihan_umum", 11),
	(27, "2021_02_13_065938_saldo_awal", 12),
	(28, "2021_02_16_015223_create_rkakl", 13),
	(29, "2021_02_17_012908_create_item_rkakl", 13),
	(30, "2021_03_02_011912_create_sumber_dana", 13),
	(31, "2021_03_02_011925_create_output", 13),
	(32, "2021_03_02_011936_create_komponen", 13),
	(33, "2021_03_02_011945_create_akun", 13),
	(35, "2021_03_09_020713_lv1_histori_sumberdana", 13),
	(36, "2021_03_09_023403_lv2_histori_output", 13),
	(37, "2021_03_09_031541_lv3_histori_komponen", 13),
	(38, "2021_03_09_032727_lv4_histori_akun", 13),
	(40, "2021_03_02_011953_create_kegiatan", 14),
	(41, "2021_03_09_032738_lv5_histori_kegiatan", 14),
	(44, "2021_06_10_073522_create_cicilan_jaminan", 15),
	(45, "2021_06_10_073535_create_cicilan_nonjaminan", 15),
	(47, "2020_12_22_005435_nonjaminan", 16),
	(48, "2021_07_17_144001_create_transaksi_jaminan", 17),
	(50, "2021_07_18_132643_create_transaksi_nonjaminan", 18),
	(51, "2021_07_28_125202_create_penggolongan_jaminan", 19),
	(52, "2021_07_28_125422_create_penggolongan_nonjaminan", 19),
	(53, "2021_09_30_030520_create_level_rkakl", 20),
	(59, "2021_10_01_062834_create_master_rkakl", 21),
	(60, "2021_10_01_063339_create_items_rkakl", 21),
	(61, "2021_11_21_024604_create_histori_itemsv3rkakl", 22),
	(103, "2022_01_10_012748_create_checklist_ppk", 23),
	(104, "2022_01_10_012800_create_checklist_kontrak", 23),
	(105, "2022_01_10_012811_create_checklist_penerima", 23),
	(106, "2022_01_10_012817_create_checklist_bast", 23),
	(107, "2022_01_10_012822_create_checklist_kwitansi", 23),
	(108, "2022_01_10_012824_create_checklist_ppspm", 23),
	(109, "2022_01_10_012842_create_checklist_invoice", 23),
	(110, "2022_01_10_012848_create_checklist_suratjalan", 23),
	(111, "2022_01_10_012858_create_checklistmaster", 23),
	(112, "2022_01_10_012858_create_efaktur", 23),
	(113, "2022_01_10_012859_create_checklist", 23),
	(114, "2022_01_10_012910_create_checklist_trackrecord", 23),
	(116, "2022_03_31_124702_create_pph21", 25),
	(117, "2022_03_31_124704_create_pph22", 25),
	(118, "2022_03_31_124706_create_pph23", 25),
	(119, "2022_03_31_124726_create_setoranlain", 25),
	(120, "2022_04_04_135826_create_ppn", 26),
	(122, "2022_04_21_092152_create_persekot", 28),
	(124, "2022_01_10_012840_create_monev_realisasi", 29),
	(127, "2022_03_22_141013_create_spby", 30),
	(129, "2022_03_22_141012_create_kode_trans", 31),
	(130, "2022_03_22_141012_create_kode_transaksi", 31),
	(132, "2020_08_22_095332_create_tindakan", 32),
	(133, "2020_08_22_095734_create_benpen", 33),
	(134, "2022_04_20_141639_create_bridge_pemindah_bukuan", 34),
	(135, "2022_06_17_091248_create_coa", 34),
	(137, "2022_06_28_143806_create_hutang", 35),
	(141, "2022_08_05_145520_create_pemindahbukuan", 37),
	(142, "2022_01_10_012841_create_dokumenlain", 38),
	(143, "2022_09_26_101237_create_pasal4ayat2", 39),
	(144, "2022_09_28_142348_create_kode_transaksi_penerimaan", 40),
	(145, "2022_12_29_085102_create_kelengkapan_pajak", 41),
	(147, "2023_02_14_152337_create_cobacoba", 42),
	(150, "2023_02_13_111943_create_checklist_item_belanja", 43),
	(151, "2022_07_04_095937_create_hutang_manual", 44),
	(152, "2023_03_10_152421_create_hutang_item_belanja", 45),
	(155, "2023_04_11_121038_create_checklist_item_belanja_termin", 46),
	(157, "2023_06_20_094126_create_trans_benpen", 47),
	(158, "2023_08_14_150726_create_uang_muka", 48),
	(161, "2023_09_21_093611_create_uangmuka_item", 49);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, "App\\User", 1),
	(24, "App\\User", 40),
	(3, "App\\User", 45),
	(4, "App\\User", 46),
	(25, "App\\User", 48),
	(25, "App\\User", 49),
	(6, "App\\User", 52),
	(22, "App\\User", 75),
	(25, "App\\User", 356),
	(11, "App\\User", 366),
	(8, "App\\User", 382),
	(25, "App\\User", 391),
	(25, "App\\User", 398),
	(25, "App\\User", 405),
	(26, "App\\User", 410),
	(25, "App\\User", 422),
	(12, "App\\User", 426),
	(23, "App\\User", 468);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table monev_realisasi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monev_realisasi`;

CREATE TABLE `monev_realisasi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tanggal_transaksi` date DEFAULT NULL,
  `id_itemsrkaklitem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rpd` bigint DEFAULT NULL,
  `rpd_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagihan` bigint DEFAULT NULL,
  `tagihan_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realisasi` bigint DEFAULT NULL,
  `realisasi_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monev_realisasi_user_id_foreign` (`user_id`),
  CONSTRAINT `monev_realisasi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1089 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table pasal4ayat2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pasal4ayat2`;

CREATE TABLE `pasal4ayat2` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_kode_transaksi` bigint DEFAULT NULL,
  `id_spby` bigint unsigned DEFAULT NULL,
  `note_pasal4ayat2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `statusdk_pasal4ayat2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal_pasal4ayat2` decimal(19,0) DEFAULT NULL,
  `debit_pasal4ayat2` decimal(19,0) DEFAULT NULL,
  `kredit_pasal4ayat2` decimal(19,0) DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pasal4ayat2_user_id_foreign` (`user_id`),
  CONSTRAINT `pasal4ayat2_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table pemindahbukuan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pemindahbukuan`;

CREATE TABLE `pemindahbukuan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idbenpen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idspby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tindakan_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_kode_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_dana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_transfer` date DEFAULT NULL,
  `uraian` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nominal` bigint DEFAULT NULL,
  `status_konfirmasi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'dikonfirmasi oleh user bendahara penerimaan',
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pemindahbukuan_user_id_foreign` (`user_id`),
  CONSTRAINT `pemindahbukuan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, "Bendahara Penerimaan - Manage Tindakan", "web", "2020-10-07 06:55:53", "2022-12-27 13:40:37"),
	(2, "Bendahara Penerimaan - Data Penerimaan", "web", "2020-10-07 06:56:26", "2022-12-27 13:34:12"),
	(3, "Bendahara Penerimaan - Laporan", "web", "2020-10-07 06:57:11", "2022-12-27 13:48:48"),
	(4, "Manage All User Plus Role Permission", "web", "2020-10-11 15:04:33", "2020-10-11 15:04:33"),
	(5, "Manage Klaim Jaminan", "web", "2020-10-18 06:40:29", "2020-10-18 06:40:29"),
	(6, "Manage Laporan Klaim Jaminan", "web", "2020-11-04 00:37:04", "2020-11-04 00:37:04"),
	(7, "Manage Data Master Penjamin", "web", "2021-02-14 18:52:20", "2021-02-14 18:52:20"),
	(8, "Manage Data RKAKL V.2", "web", "2021-03-30 14:30:51", "2021-03-30 14:30:51"),
	(9, "Laporan RKAKL V.2", "web", "2021-03-30 14:31:07", "2021-03-30 14:31:07"),
	(10, "Manage Data RKAKL (V.1)", "web", "2021-03-30 14:31:23", "2021-05-07 01:51:54"),
	(11, "Return Data RKAKL V.2", "web", "2021-05-07 01:52:12", "2021-05-07 01:52:12"),
	(12, "Manage Data RKAKL V.3", "web", "2021-09-30 08:54:44", "2021-09-30 08:54:44"),
	(14, "Tagihan/Checklist - Manage Checklist Tagihan", "web", "2022-01-07 13:17:18", "2022-12-28 11:16:45"),
	(16, "Restore Data", "web", "2022-02-15 12:19:19", "2022-02-15 13:13:32"),
	(17, "Bendahara Pengeluaran - Review Tagihan / Checklist", "web", "2022-02-17 08:31:00", "2023-06-08 13:27:37"),
	(18, "Bendahara Pengeluaran - Manage BP Bendahara Pengeluaran", "web", "2022-03-29 16:25:02", "2022-12-27 15:26:03"),
	(19, "Bendahara Penerimaan - Pemindah Bukuan", "web", "2022-04-20 15:15:05", "2022-12-27 13:52:37"),
	(20, "Bendahara Pengeluaran - Persekot", "web", "2022-04-21 16:17:09", "2022-12-27 15:24:05"),
	(21, "Bendahara Pengeluaran - Review Lumpsum", "web", "2022-04-26 16:04:41", "2022-12-27 15:23:45"),
	(22, "Hutang - COA", "web", "2022-06-15 18:15:17", "2022-12-28 14:12:16"),
	(23, "Bendahara Penerimaan - Manage Unit Layanan", "web", "2022-08-04 16:16:44", "2022-12-27 13:40:06"),
	(24, "Manage Hutang - Hutang Manual", "web", "2022-08-10 13:37:39", "2022-08-10 13:37:39"),
	(25, "Bendahara Pengeluaran - Manage Tagihan Tanpa Approval", "web", "2022-08-23 10:03:00", "2022-12-27 15:22:31"),
	(26, "PAJAK - Laporan Pajak", "web", "2022-08-24 14:55:34", "2022-12-28 14:24:29"),
	(27, "Bendahara Penerimaan - Laporan BP", "web", "2022-09-28 13:18:34", "2022-12-27 13:50:45"),
	(28, "Bendahara Pengeluaran - Kelengkapan Berkas Pajak", "web", "2022-10-13 09:59:42", "2023-06-30 10:49:56"),
	(29, "Bendahara Pengeluaran - Kelengkapan Berkas Non LS (Pajak)", "web", "2022-10-13 09:59:53", "2022-12-27 15:25:09"),
	(30, "Bendahara Pengeluaran - Uraian Kegiatan", "web", "2022-11-08 08:21:48", "2022-12-27 15:23:00"),
	(31, "Bendahara Penerimaan - Uraian Kegiatan", "web", "2022-11-09 08:24:14", "2022-12-27 13:31:24"),
	(32, "Bendahara Penerimaan - Data Pengeluaran", "web", "2022-12-27 13:35:09", "2022-12-27 13:35:09"),
	(33, "Anggaran - Sub Level Pagu / RKAKL", "web", "2022-12-27 14:04:05", "2022-12-27 14:06:37"),
	(34, "Anggaran - Data Pagu / RKAKL", "web", "2022-12-27 14:05:41", "2022-12-27 14:06:45"),
	(35, "Anggaran - Laporan Pagu / RKAKL", "web", "2022-12-27 15:18:24", "2022-12-27 15:18:24"),
	(36, "Anggaran - Laporan Semula Menjadi", "web", "2022-12-27 15:19:29", "2022-12-27 15:19:29"),
	(37, "Anggaran - Laporan Monev Evaluasi", "web", "2022-12-27 15:19:38", "2022-12-27 15:19:38"),
	(38, "Anggaran - Laporan Realisasi Belanja", "web", "2022-12-27 15:19:48", "2022-12-27 15:19:48"),
	(39, "Tagihan/Checklist - Rekap Data Tagihan", "web", "2022-12-28 11:17:02", "2022-12-28 11:17:02"),
	(40, "Tagihan/Checklist - Master PPK", "web", "2022-12-28 11:17:30", "2022-12-28 11:17:30"),
	(41, "Tagihan/Checklist - Master Penerima", "web", "2022-12-28 11:17:47", "2022-12-28 11:17:47"),
	(42, "Tagihan/Checklist - Master PPSPM", "web", "2022-12-28 11:17:56", "2022-12-28 11:17:56"),
	(43, "Hutang - Data Hutang", "web", "2022-12-28 14:13:33", "2022-12-28 14:13:33"),
	(44, "Hutang - Rekapitulasi Hutang", "web", "2022-12-28 14:13:45", "2022-12-28 14:13:45"),
	(45, "Hutang - Hutang Manual Perusahaan", "web", "2022-12-28 14:16:13", "2022-12-28 14:16:13"),
	(46, "Hutang - Hutang Manual Penerimaan", "web", "2022-12-28 14:16:21", "2022-12-28 14:16:21"),
	(47, "PAJAK - Rekap PPH 21", "web", "2022-12-28 14:30:10", "2022-12-28 14:30:10"),
	(48, "PAJAK - Rekap PPH 22", "web", "2022-12-28 14:30:19", "2022-12-28 14:30:19"),
	(49, "PAJAK - Rekap PPH 23", "web", "2022-12-28 14:30:29", "2022-12-28 14:30:29"),
	(50, "PAJAK - Rekap PPN", "web", "2022-12-28 14:30:38", "2022-12-28 14:30:38"),
	(51, "PAJAK - Rekap PPH Pasal 4(2)", "web", "2022-12-28 14:30:48", "2022-12-28 14:30:48"),
	(52, "Bendahara Penerimaan - Referensi BP", "web", "2023-01-10 15:42:46", "2023-01-10 15:42:46"),
	(53, "Bendahara Pengeluaran - Referensi BP", "web", "2023-01-11 08:42:10", "2023-01-11 08:42:10"),
	(59, "PPK BLU - Review Tagihan / Checklist", "web", "2023-06-08 13:25:39", "2023-06-08 13:25:39"),
	(60, "PPK RM - Review Tagihan / Checklist", "web", "2023-06-08 13:25:46", "2023-06-08 13:25:46"),
	(61, "PPSPM - Review Tagihan / Checklist", "web", "2023-06-08 13:25:55", "2023-06-08 13:25:55"),
	(62, "Bendahara Penerimaan - Rekap Uraian Pemasukan Berdasarkan tanggal", "web", "2023-06-26 08:59:25", "2023-06-26 08:59:25"),
	(63, "Bendahara Penerimaan - Rekap Uraian Pemasukan Berdasarkan Antar Tanggal", "web", "2023-06-26 08:59:35", "2023-06-26 08:59:35"),
	(64, "Bendahara Penerimaan - Rekap Uraian Pemasukan Berdasarkan Tahun", "web", "2023-06-26 08:59:44", "2023-06-26 08:59:44"),
	(65, "Bendahara Penerimaan - Buku Kas Umum", "web", "2023-06-26 08:59:52", "2023-06-26 08:59:52"),
	(66, "Bendahara Penerimaan - Rekap Penerimaan Berdasarkan Tindakan", "web", "2023-06-26 09:00:01", "2023-06-26 09:00:01"),
	(67, "Bendahara Penerimaan - Uang Muka", "web", "2023-08-15 08:47:35", "2023-08-15 08:47:35"),
	(68, "Bendahara Pengeluaran - Realisasi Tagihan", "web", "2023-09-08 14:52:10", "2023-09-08 14:52:10"),
	(69, "Bendahara Penerimaan - Data Pengembalian", "web", "2023-09-15 09:52:35", "2023-09-15 09:52:35");

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table persekot
# ------------------------------------------------------------

DROP TABLE IF EXISTS `persekot`;

CREATE TABLE `persekot` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tanggal_persekot` date DEFAULT NULL,
  `nama_persekot` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jumlah_persekot` bigint DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persekot_user_id_foreign` (`user_id`),
  CONSTRAINT `persekot_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table pph21
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pph21`;

CREATE TABLE `pph21` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_kode_transaksi` bigint DEFAULT NULL,
  `id_spby` bigint unsigned DEFAULT NULL,
  `note_pph21` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `statusdk_pph21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal_pph21` double DEFAULT NULL,
  `debit_pph21` double DEFAULT NULL,
  `kredit_pph21` double DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pph21_user_id_foreign` (`user_id`),
  CONSTRAINT `pph21_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table pph22
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pph22`;

CREATE TABLE `pph22` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_kode_transaksi` bigint DEFAULT NULL,
  `id_spby` bigint unsigned DEFAULT NULL,
  `note_pph22` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `statusdk_pph22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal_pph22` double DEFAULT NULL,
  `debit_pph22` double DEFAULT NULL,
  `kredit_pph22` double DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pph22_user_id_foreign` (`user_id`),
  CONSTRAINT `pph22_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table pph23
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pph23`;

CREATE TABLE `pph23` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_kode_transaksi` bigint DEFAULT NULL,
  `id_spby` bigint unsigned DEFAULT NULL,
  `note_pph23` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `statusdk_pph23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal_pph23` double DEFAULT NULL,
  `debit_pph23` double DEFAULT NULL,
  `kredit_pph23` double DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pph23_user_id_foreign` (`user_id`),
  CONSTRAINT `pph23_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table ppn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ppn`;

CREATE TABLE `ppn` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_kode_transaksi` bigint DEFAULT NULL,
  `id_spby` bigint unsigned DEFAULT NULL,
  `note_ppn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `statusdk_ppn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal_ppn` double DEFAULT NULL,
  `debit_ppn` double DEFAULT NULL,
  `kredit_ppn` double DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ppn_user_id_foreign` (`user_id`),
  CONSTRAINT `ppn_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table rkakl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rkakl`;

CREATE TABLE `rkakl` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `periode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(14, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(4, 2),
	(1, 3),
	(2, 3),
	(23, 3),
	(27, 3),
	(31, 3),
	(32, 3),
	(52, 3),
	(62, 3),
	(63, 3),
	(64, 3),
	(65, 3),
	(66, 3),
	(67, 3),
	(69, 3),
	(17, 4),
	(18, 4),
	(21, 4),
	(25, 4),
	(28, 4),
	(29, 4),
	(30, 4),
	(37, 4),
	(38, 4),
	(5, 5),
	(6, 5),
	(7, 5),
	(12, 6),
	(33, 6),
	(34, 6),
	(35, 6),
	(36, 6),
	(37, 6),
	(14, 8),
	(24, 8),
	(39, 8),
	(40, 8),
	(41, 8),
	(42, 8),
	(22, 11),
	(24, 11),
	(43, 11),
	(44, 11),
	(45, 11),
	(46, 11),
	(26, 12),
	(28, 12),
	(29, 12),
	(47, 12),
	(48, 12),
	(49, 12),
	(50, 12),
	(51, 12),
	(59, 22),
	(60, 23),
	(61, 24),
	(2, 25),
	(62, 25),
	(67, 25),
	(69, 25),
	(17, 26),
	(68, 26);

/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, "superadmin", "web", "2020-10-07 06:54:51", "2020-10-07 06:54:51"),
	(2, "administrator", "web", "2020-10-07 06:54:56", "2020-10-07 06:54:56"),
	(3, "bendahara_penerimaan", "web", "2020-10-07 06:55:08", "2023-06-08 09:11:42"),
	(4, "bendahara_pengeluaran", "web", "2020-10-07 06:55:17", "2020-10-07 06:55:17"),
	(5, "penjamin", "web", "2020-10-07 06:55:23", "2020-10-07 06:55:23"),
	(6, "anggaran", "web", "2021-03-30 14:29:33", "2021-03-30 14:29:33"),
	(8, "checklist_tagihan", "web", "2022-01-07 13:16:28", "2022-01-07 13:16:28"),
	(10, "pengadaan", "web", "2022-03-11 23:13:09", "2022-03-11 23:13:09"),
	(11, "hutang", "web", "2022-06-15 17:29:31", "2022-06-15 17:29:31"),
	(12, "pajak", "web", "2022-08-24 14:51:34", "2022-08-24 14:51:34"),
	(22, "PPKBLU", "web", "2023-06-08 10:02:58", "2023-06-08 10:05:33"),
	(23, "PPKRM", "web", "2023-06-08 10:03:03", "2023-06-08 10:09:48"),
	(24, "PPSPM", "web", "2023-06-08 10:03:09", "2023-06-08 10:09:56"),
	(25, "Kasir", "web", "2023-06-09 14:16:24", "2023-06-09 14:16:24"),
	(26, "Perbendaharaan", "web", "2023-06-26 14:12:16", "2023-06-26 14:12:16");

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table setoranlain
# ------------------------------------------------------------

DROP TABLE IF EXISTS `setoranlain`;

CREATE TABLE `setoranlain` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_kode_transaksi` bigint DEFAULT NULL,
  `id_spby` bigint unsigned DEFAULT NULL,
  `note_setoranlain` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `statusdk_setoranlain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal_setoranlain` double DEFAULT NULL,
  `debit_setoranlain` double DEFAULT NULL,
  `kredit_setoranlain` double DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `setoranlain_user_id_foreign` (`user_id`),
  CONSTRAINT `setoranlain_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table spby
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spby`;

CREATE TABLE `spby` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_ini` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal_transaksi` date DEFAULT NULL,
  `id_checklist` bigint DEFAULT NULL,
  `id_monev` json DEFAULT NULL,
  `id_kode_transaksi` bigint DEFAULT NULL,
  `text_nomor_spby` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nomor_spby` bigint DEFAULT NULL,
  `jenis_anggaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akun_anggaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kepada` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `desk_pengeluaran` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanda_pembelian` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nota_penerimaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status_dk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit_benpeng` bigint DEFAULT NULL,
  `kredit_benpeng` bigint DEFAULT NULL,
  `nominal_spby` bigint DEFAULT NULL,
  `ada_ppn` int DEFAULT NULL,
  `ada_pph21` int DEFAULT NULL,
  `ada_pph22` int DEFAULT NULL,
  `ada_pph23` int DEFAULT NULL,
  `ada_pasal4ayat2` int DEFAULT NULL,
  `ada_setoranlain` int DEFAULT NULL,
  `tanggal_setor_pajak` date DEFAULT NULL,
  `status_realisasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_bukti_realisasi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status_lapor_pajak` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status_uraian_kegiatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spby_user_id_foreign` (`user_id`),
  CONSTRAINT `spby_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `use` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table struktur_organisasi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `struktur_organisasi`;

CREATE TABLE `struktur_organisasi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `head` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `parent` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `child` int DEFAULT NULL,
  `kode` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jabatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `struktur_organisasi` WRITE;
/*!40000 ALTER TABLE `struktur_organisasi` DISABLE KEYS */;

INSERT INTO `struktur_organisasi` (`id`, `head`, `parent`, `child`, `kode`, `jabatan`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(14, "1", NULL, 1, "1", "Direktur Utama", "2023-08-09 08:40:43", "2023-08-09 08:40:43", NULL),
	(106, "2", "1", 1, "1.1", "Ketua Dewan Pengawas", "2023-11-03 10:02:31", "2023-11-03 10:02:31", NULL),
	(107, "2", "1", 2, "1.2", "Kepala Satuan Pemeriksa Internal", "2023-11-03 10:02:31", "2023-11-03 10:02:31", NULL),
	(108, "2", "1", 3, "1.3", "Direktur SDM, Pendidikan dan Penelitian", "2023-11-03 10:02:31", "2023-11-03 10:02:31", NULL),
	(109, "2", "1", 4, "1.4", "Direktur Perencanaan, Keuangan dan BMN", "2023-11-03 10:02:31", "2023-11-03 10:02:31", NULL),
	(110, "2", "1", 5, "1.5", "Direktur Medik dan Keperawatan", "2023-11-03 10:02:31", "2023-11-03 10:02:31", NULL),
	(111, "2", "1", 6, "1.6", "Ketua Komite Medik", "2023-11-03 10:02:31", "2023-11-03 10:02:31", NULL),
	(112, "2", "1", 7, "1.7", "Ketua Komite Etik dan Hukum", "2023-11-03 10:02:31", "2023-11-03 10:02:31", NULL),
	(113, "2", "1", 8, "1.8", "Ketua Komite Mutu Rumah Sakit", "2023-11-03 10:02:31", "2023-11-03 10:02:31", NULL),
	(114, "2", "1", 9, "1.9", "Ketua Komite Keperawatan", "2023-11-03 10:02:31", "2023-11-03 10:02:31", NULL),
	(115, "2", "1", 10, "1.10", "Ketua Komite Tenaga Kesehatan Lainnya", "2023-11-03 10:02:31", "2023-11-03 10:02:31", NULL),
	(116, "3", "1.5", 1, "1.5.1", "Manajer Pelayanan Medik", "2023-11-03 10:06:09", "2023-11-03 10:06:09", NULL),
	(117, "3", "1.5", 2, "1.5.2", "Manajer Pelayanan Keperawatan", "2023-11-03 10:06:09", "2023-11-03 10:06:09", NULL),
	(118, "3", "1.5", 3, "1.5.3", "Manajer Pelayanan Penunjang", "2023-11-03 10:06:09", "2023-11-03 10:06:09", NULL),
	(119, "3", "1.5", 4, "1.5.4", "Ketua KSM Psikiatri", "2023-11-03 10:06:09", "2023-11-03 10:06:09", NULL),
	(120, "3", "1.5", 5, "1.5.5", "Ketua KSM Non Psikiatri", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(121, "3", "1.5", 6, "1.5.6", "Ketua KSM Umum", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(122, "3", "1.5", 7, "1.5.7", "Kepala Instalasi Farmasi", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(123, "3", "1.5", 8, "1.5.8", "Kepala Instalasi Rawat Inap Psikiatri Dewasa", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(124, "3", "1.5", 9, "1.5.9", "Kepala Instalasi Laboratorium", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(125, "3", "1.5", 10, "1.5.10", "Kepala Instalasi Gizi", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(126, "3", "1.5", 11, "1.5.11", "Kepala Instalasi Psikogeriatri", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(127, "3", "1.5", 12, "1.5.12", "Kepala Instalasi Rehabilitasi", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(128, "3", "1.5", 13, "1.5.13", "Kepala Instalasi Rawat Jalan Psikiatri Dewasa", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(129, "3", "1.5", 14, "1.5.14", "Kepala Instalasi Gawat Darurat", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(130, "3", "1.5", 15, "1.5.15", "Kepala Instalasi Radiologi", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(131, "3", "1.5", 16, "1.5.16", "Kepala Instalasi Psikiatri Anak dan Remaja", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(132, "3", "1.5", 17, "1.5.17", "Kepala Instalasi Elektromedik", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(133, "3", "1.5", 18, "1.5.18", "Kepala Instalasi Bedah Sentral", "2023-11-03 10:06:10", "2023-11-03 10:06:10", NULL),
	(134, "4", "1.5.1", 1, "1.5.1.1", "Asisten Manajer Pelayanan Medik", "2023-11-03 10:07:09", "2023-11-03 10:07:09", NULL),
	(135, "4", "1.5.2", 1, "1.5.2.1", "Asisten Manajer Pelayanan Keperawatan", "2023-11-03 10:07:26", "2023-11-03 10:07:26", NULL),
	(136, "4", "1.5.3", 1, "1.5.3.1", "Asisten Manajer Pelayanan Penunjang", "2023-11-03 10:08:08", "2023-11-03 10:08:08", NULL),
	(137, "3", "1.3", 1, "1.3.1", "Manajer Organisasi dan SDM", "2023-11-03 10:08:44", "2023-11-03 10:08:44", NULL),
	(138, "3", "1.3", 2, "1.3.2", "Manajer Pendidikan dan Pelatihan", "2023-11-03 10:08:44", "2023-11-03 10:08:44", NULL),
	(139, "3", "1.3", 3, "1.3.3", "Kepala Instalasi Pendidikan dan Penelitian", "2023-11-03 10:08:44", "2023-11-03 10:08:44", NULL),
	(140, "4", "1.3.1", 1, "1.3.1.1", "Asisten Manajer Organisasi SDM", "2023-11-03 10:09:03", "2023-11-03 10:09:03", NULL),
	(141, "4", "1.3.2", 1, "1.3.2.1", "Asisten Manajer Pendidikan dan Pelatihan", "2023-11-03 10:09:17", "2023-11-03 10:09:17", NULL),
	(142, "3", "1.4", 1, "1.4.1", "Kepala Unit Layanan Pengadaan", "2023-11-03 10:13:30", "2023-11-03 10:13:30", NULL),
	(143, "3", "1.4", 2, "1.4.2", "Manajer Perencanaan Program, Anggaran dan Evaluasi", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(144, "3", "1.4", 3, "1.4.3", "Manajer Pelaksanaan Keuangan", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(145, "3", "1.4", 4, "1.4.4", "Manajer Akuntansi dan BMN", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(146, "3", "1.4", 5, "1.4.5", "Manajer Hukum dan Hubungan Masyarakat", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(147, "3", "1.4", 6, "1.4.6", "Manajer Tata Usaha dan Rumah Tangga", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(148, "3", "1.4", 7, "1.4.7", "Kepala Instalasi Rekam Medik", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(149, "3", "1.4", 8, "1.4.8", "Kepala Instalasi Kesehatan Lingkungan dan K3RS", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(150, "3", "1.4", 9, "1.4.9", "Kepala Instalasi Verifikasi dan Penjamin Pasien", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(151, "3", "1.4", 10, "1.4.10", "Kepala Instalasi Keswamas dan PKRS", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(152, "3", "1.4", 12, "1.4.12", "Kepala Instalasi Sistem Informasi Manajemen Rumah Sakit", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(153, "3", "1.4", 13, "1.4.13", "Kepala Instalasi Pemeliharaan Sarana dan Prasarana RS", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(154, "3", "1.4", 14, "1.4.14", "Kepala Instalasi Sentralisasi Sentral dan Binatu", "2023-11-03 10:13:31", "2023-11-03 10:13:31", NULL),
	(155, "4", "1.4.2", 1, "1.4.2.1", "Asisten Manajer Perencanaan Program, Anggaran dan Evaluasi", "2023-11-03 10:21:37", "2023-11-03 10:21:37", NULL),
	(156, "4", "1.4.3", 1, "1.4.3.1", "Asisten Manajer Pelaksanaan Keuangan", "2023-11-03 10:21:56", "2023-11-03 10:21:56", NULL),
	(157, "4", "1.4.4", 1, "1.4.4.1", "Asisten Manajer Akuntansi dan BMN", "2023-11-03 10:22:16", "2023-11-03 10:22:16", NULL),
	(158, "4", "1.4.5", 1, "1.4.5.1", "Asisten Manajer Hukum dan Hubungan Masyarakat", "2023-11-03 10:22:35", "2023-11-03 10:22:35", NULL),
	(159, "4", "1.4.6", 1, "1.4.6.1", "Asisten Manajer Usaha dan Rumah Tangga", "2023-11-03 10:22:52", "2023-11-03 10:22:52", NULL),
	(160, "3", "1.9", 1, "1.9.1", "testing", "2023-11-03 10:37:04", "2023-11-03 10:37:30", "2023-11-03 10:37:30"),
	(161, "2", "1", 11, "1.11", "testing", "2023-11-13 11:21:10", "2023-11-13 11:21:15", "2023-11-13 11:21:15");

/*!40000 ALTER TABLE `struktur_organisasi` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table tindakan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tindakan`;

CREATE TABLE `tindakan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit_layanan_id` bigint unsigned NOT NULL,
  `tindakan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tarif` int DEFAULT NULL,
  `status_tarif` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `munculkan_lapbytindakan` int DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tindakan` WRITE;
/*!40000 ALTER TABLE `tindakan` DISABLE KEYS */;

INSERT INTO `tindakan` (`id`, `unit_layanan_id`, `tindakan`, `satuan`, `tarif`, `status_tarif`, `munculkan_lapbytindakan`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, "RAWAT JALAN EKSEKUTIF - Pendaftaran ", "Pendaftaran", 15000, "baku", 1, "-", NULL, NULL, NULL),
	(2, 1, "RAWAT JALAN EKSEKUTIF - Administrasi Rekam Medis", "Pendaftaran", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(3, 1, "KONSULTASI EKSEKUTIF - Dokter Sub Spesialis", "Per Pemeriksaan", 130000, "baku", 1, "-", NULL, NULL, NULL),
	(4, 1, "KONSULTASI EKSEKUTIF - Dokter Spesialis", "Per Konsul", 120000, "baku", 1, "-", NULL, NULL, NULL),
	(5, 1, "KONSULTASI EKSEKUTIF - Dokter Umum", "Per Konsul", 70000, "baku", 1, "-", NULL, NULL, NULL),
	(6, 1, "KONSULTASI EKSEKUTIF - Dokter Gigi", "Per Konsul", 70000, "baku", 1, "-", NULL, NULL, NULL),
	(7, 1, "KONSULTASI EKSEKUTIF - Psikolog Klinis", "Per Konsul", 70000, "baku", 1, "-", NULL, NULL, NULL),
	(8, 1, "KONSULTASI EKSEKUTIF - Keperawatan", "Per Konsul", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(9, 1, "KONSULTASI EKSEKUTIF - Gizi", "Per Konsul", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(10, 1, "KONSULTASI EKSEKUTIF - Pekerja Sosial", "Per Konsul", 25000, "baku", 1, "-", NULL, NULL, NULL),
	(11, 1, "KONSULTASI EKSEKUTIF - Eksekutif Sore - Dokter Sub Spesialis Kesehatan Jiwa", "Per Pemeriksaan", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(12, 1, "KONSULTASI EKSEKUTIF - Eksekutif Sore - Dokter Spesialis Kesehatan Jiwa", "Per Pemeriksaan", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(13, 1, "KONSULTASI EKSEKUTIF - Eksekutif Sore - Dokter Sp. Penyakit Dalam", "Per Pemeriksaan", 160000, "baku", 1, "-", NULL, NULL, NULL),
	(14, 1, "KONSULTASI EKSEKUTIF - Eksekutif Sore - Dokter Umum", "Per Pemeriksaan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(15, 1, "KONSULTASI EKSEKUTIF - Eksekutif Sore - Dokter Gigi", "Per Pemeriksaan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(16, 1, "KONSULTASI EKSEKUTIF - Eksekutif Sore - Psikolog Klinis", "Per Pemeriksaan", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(17, 1, "KONSULTASI EKSEKUTIF -Poli BPJS Eksekutif Sore - Konsultasi Psikiater (Pasien Baru)", "Per Konsul", 450000, "baku", 1, "-", NULL, NULL, NULL),
	(18, 1, "KONSULTASI EKSEKUTIF - Poli BPJS Eksekutif Sore - Konsultasi Psikiater (Pasien Lama)", "Per Konsul", 350000, "baku", 1, "-", NULL, NULL, NULL),
	(19, 1, "KONSULTASI EKSEKUTIF - Poli BPJS Eksekutif Sore - Obat", "Untuk 7 Hari", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(20, 1, "RAWAT JALAN EKSEKUTIF - Tarif Paket Pemeriksaan ECT Rujukan Dari Poli Eksekutif (Tindakan ECT,Infus,Injeksi 3x,Oksigen,Dokter Anestesi dan Obat)", "Pertindakan", 2270000, "baku", 1, "-", NULL, NULL, NULL),
	(21, 1, "KONSULTASI EKSEKUTIF - Klinik VVIP Sore - Dokter Subspesialis", "Per Pemeriksaan", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(22, 1, "KONSULTASI EKSEKUTIF - Klinik VVIP Sore - Dokter Spesialis", "Per Pemeriksaan", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(23, 1, "KONSULTASI EKSEKUTIF - Klinik VVIP Sore - Psikolog Klinis", "Per Pemeriksaan", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(24, 1, "RAWAT JALAN REGULER / ANAK REMAJA / IGD - Pendaftaran ", "Pendaftaran", 15000, "baku", 1, "-", NULL, NULL, NULL),
	(25, 1, "RAWAT JALAN REGULER / ANAK REMAJA / IGD - Administrasi Rekam Medis", "Pendaftaran", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(26, 1, "KONSULTASI REGULER / ANAK REMAJA / IGD - Dokter Sub Spesialis", "Per Konsultasi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(27, 1, "KONSULTASI REGULER / ANAK REMAJA / IGD - Dokter Spesialis", "Per Konsultasi", 90000, "baku", 1, "-", NULL, NULL, NULL),
	(28, 1, "KONSULTASI REGULER / ANAK REMAJA / IGD - Dokter Umum", "Per Konsultasi", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(29, 1, "KONSULTASI REGULER / ANAK REMAJA / IGD - Dokter Gigi", "Per Konsultasi", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(30, 1, "KONSULTASI REGULER / ANAK REMAJA / IGD - Psikolog Klinis", "Per Konsultasi", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(31, 1, "KONSULTASI REGULER / ANAK REMAJA / IGD - Keperawatan", "Per Konsultasi", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(32, 1, "KONSULTASI REGULER / ANAK REMAJA / IGD - Gizi", "Per Konsultasi", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(33, 1, "KONSULTASI REGULER / ANAK REMAJA / IGD - Pekerja Sosial", "Per Konsultasi", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(34, 1, "PELAYANAN TELEMEDICINE - Pendaftaran", "Pendaftaran", 15000, "baku", 1, "-", NULL, NULL, NULL),
	(35, 1, "PELAYANAN TELEMEDICINE - Administrasi Rekam Medis", "Pendaftaran", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(36, 1, "PELAYANAN TELEMEDICINE - Dokter Spesialis", "Per Konsul", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(37, 1, "PELAYANAN TELEMEDICINE - Biaya Pengiriman Obat - Wilayah Jakarta Barat", "Per Antar", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(38, 1, "PELAYANAN TELEMEDICINE - Biaya Pengiriman Obat - Wilayah Jakarta Lainnya", "Per Antar", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(39, 1, "PELAYANAN TELEMEDICINE - Biaya Pengiriman Obat - Wilayah Bodetabek", "Per Antar", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(40, 1, "PELAYANAN TELEMEDICINE - Telemedicine Bagi Warga Negara Asing (WNA) - Konsultasi Dokter Psikiater dalam Bahasa Inggris", "Per Konsul", 750000, "baku", 1, "-", NULL, NULL, NULL),
	(41, 1, "PELAYANAN TELEMEDICINE - Telemedicine A", "Per Paket", 250000, "baku", 1, "-", NULL, NULL, NULL),
	(42, 1, "PELAYANAN TELEMEDICINE - Telemedicine B", "Per Paket", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(43, 1, "LAYANAN HOMEVISITE - Homevisite A", "Per Paket", 650000, "baku", 1, "-", NULL, NULL, NULL),
	(44, 1, "LAYANAN HOMEVISITE - Homevisite B", "Per Paket", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(45, 1, "LAYANAN HOMEVISITE - Homevisite C", "Per Paket", 950000, "baku", 1, "-", NULL, NULL, NULL),
	(46, 1, "LAYANAN HOMEVISITE - Homevisite D", "Per Paket", 800000, "baku", 1, "-", NULL, NULL, NULL),
	(47, 1, "LAYANAN HOMEVISITE - Biaya Transportasi - Jarak < ", "Per Visit", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(48, 1, "LAYANAN HOMEVISITE - Biaya Transportasi - Jarak 11 - 20 Km", "Per Visit", 250000, "baku", 1, "-", NULL, NULL, NULL),
	(49, 1, "LAYANAN HOMEVISITE - Biaya Transportasi - Jarak 21 - 30 Km", "Per Visit", 375000, "baku", 1, "-", NULL, NULL, NULL),
	(50, 1, "PELAYANAN ESKETAMIN - Konsultasi Dokter", "Per Konsul", 950000, "baku", 1, "-", NULL, NULL, NULL),
	(51, 1, "PELAYANAN ESKETAMIN - Tindakan Esketamin", "Per Pemeriksaan", 2150000, "baku", 1, "-", NULL, NULL, NULL),
	(52, 1, "PELAYANAN ESKETAMIN - Obat Spravato 28 mg", "1 Bliser @1 pre - filled nasal spray", 4200000, "baku", 1, "-", NULL, NULL, NULL),
	(53, 1, "Pemberi Keterangan Ahli/Saksi dan Beracara", "Per Kunjungan", 1800000, "baku", 1, "-", NULL, NULL, NULL),
	(54, 1, "Paket Pemeriksaan Kes. Jiwa Untuk Kepentingan Pekerjaan Atau Jabatan Tertentu \r\n(Tes IQ,Tes Kepribadian,Tes MMPI,Tes Napza,Konsultasi Psikolog) sudah termasuk surat keterangan", "Per Pemeriksaan", 990000, "baku", 1, "-", NULL, NULL, NULL),
	(55, 2, "RAWAT INAP VIP -Akomodasi", "Per Hari", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(56, 2, "RAWAT INAP VIP - Visite -Dokter Sub Spesialis", "Per Visite", 175000, "baku", 1, "-", NULL, NULL, NULL),
	(57, 2, "RAWAT INAP VIP - Visite - Dokter Spesialis", "Per Visite", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(58, 2, "RAWAT INAP VIP - Visite - Dokter Umum", "Per Visite", 70000, "baku", 1, "-", NULL, NULL, NULL),
	(59, 2, "RAWAT INAP VIP - Asuhan Keperawatan - Intensive Care", "Per Kegiatan", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(60, 2, "RAWAT INAP VIP - Asuhan Keperawatan - Total Care", "Per Kegiatan", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(61, 2, "RAWAT INAP VIP - Asuhan Keperawatan - Parsial Care", "Per Kegiatan", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(62, 2, "RAWAT INAP VIP - Asuhan Keperawatan - Minimal Care", "Per Kegiatan", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(63, 2, "RAWAT INAP VIP - Rawat Inap NAPZA - HCU Napza", "Per Orang/Paket", 700000, "baku", 1, "-", NULL, NULL, NULL),
	(64, 2, "RAWAT INAP VIP - Rawat Inap NAPZA - Detoksifikasi", "Per Orang/Paket", 600000, "baku", 1, "-", NULL, NULL, NULL),
	(65, 2, "RAWAT INAP VIP - Rawat Inap NAPZA - Hospice / Ruang Sakit Napza", "Per Orang/Paket", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(66, 2, "RAWAT INAP VIP - Rawat Inap NAPZA - Motivational Enhancement Therapy", "Per Orang/Paket", 300000, "baku", 1, "-", NULL, NULL, NULL),
	(67, 2, "RAWAT INAP VIP - Rawat Inap NAPZA - Terapi Substitusi-(Codein)", "Per Orang/Paket", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(68, 2, "RAWAT INAP VIP - Rawat Inap NAPZA - Kegiatan Napza  (Outbond / Retret)", "Per Orang/Paket", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(69, 2, "RAWAT INAP KELAS I/ R. PICU - Akomodasi", "Per Hari", 255000, "baku", 1, "-", NULL, NULL, NULL),
	(70, 2, "RAWAT INAP KELAS I/ R. PICU - Visite - Dokter Sub Spesialis", "Per Visite", 140000, "baku", 1, "-", NULL, NULL, NULL),
	(71, 2, "RAWAT INAP KELAS I/ R. PICU - Visite - Dokter Spesialis", "Per Visite", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(72, 2, "RAWAT INAP KELAS I/ R. PICU - Visite - Dokter Umum", "Per Visite", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(73, 2, "RAWAT INAP KELAS I/ R. PICU - Asuhan Keperawatan - Intensive Care", "Per Kegiatan", 45000, "baku", 1, "-", NULL, NULL, NULL),
	(74, 2, "RAWAT INAP KELAS I/ R. PICU - Asuhan Keperawatan - Total Care", "Per Kegiatan", 45000, "baku", 1, "-", NULL, NULL, NULL),
	(75, 2, "RAWAT INAP KELAS I/ R. PICU - Asuhan Keperawatan - Parsial Care", "Per Kegiatan", 45000, "baku", 1, "-", NULL, NULL, NULL),
	(76, 2, "RAWAT INAP KELAS I/ R. PICU - Asuhan Keperawatan - Minimal Care", "Per Kegiatan", 45000, "baku", 1, "-", NULL, NULL, NULL),
	(77, 2, "RAWAT INAP KELAS I/ R. PICU - Rawat Inap NAPZA - HCU Napza", "Per Orang/Paket", 600000, "baku", 1, "-", NULL, NULL, NULL),
	(78, 2, "RAWAT INAP KELAS I/ R. PICU - Rawat Inap NAPZA - Detoksifikasi", "Per Orang/Paket", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(79, 2, "RAWAT INAP KELAS I/ R. PICU - Rawat Inap NAPZA - Hospice / Ruang Sakit Napza", "Per Orang/Paket", 450000, "baku", 1, "-", NULL, NULL, NULL),
	(80, 2, "RAWAT INAP KELAS I/ R. PICU - Rawat Inap NAPZA - Motivational Enhancement Therapy", "Per Orang/Paket", 250000, "baku", 1, "-", NULL, NULL, NULL),
	(81, 2, "RAWAT INAP KELAS I/ R. PICU - Rawat Inap NAPZA - Terapi Substitusi-(Codein)", "Per Orang/Paket", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(82, 2, "RAWAT INAP KELAS I/ R. PICU - Rawat Inap NAPZA - Kegiatan Napza  (Outbond / Retret)", "Per Orang/Paket", 350000, "baku", 1, "-", NULL, NULL, NULL),
	(83, 2, "RAWAT INAP KELAS II - Akomodasi", "Per Hari", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(84, 2, "RAWAT INAP KELAS II - Visite - Dokter Sub Spesialis", "Per Visite", 75000, "baku", 1, "-", NULL, NULL, NULL),
	(85, 2, "RAWAT INAP KELAS II - Visite - Dokter Spesialis", "Per Visite", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(86, 2, "RAWAT INAP KELAS II - Visite - Dokter Umum", "Per Visite", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(87, 2, "RAWAT INAP KELAS II - Asuhan Keperawatan - Intensive Care", "Per Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(88, 2, "RAWAT INAP KELAS II - Asuhan Keperawatan - Total Care", "Per Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(89, 2, "RAWAT INAP KELAS II - Asuhan Keperawatan - Parsial Care", "Per Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(90, 2, "RAWAT INAP KELAS II - Asuhan Keperawatan - Minimal Care", "Per Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(91, 2, "RAWAT INAP KELAS II - Rawat Inap NAPZA - HCU Napza", "Per Orang/Paket", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(92, 2, "RAWAT INAP KELAS II - Rawat Inap NAPZA - Detoksifikasi", "Per Orang/Paket", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(93, 2, "RAWAT INAP KELAS II - Rawat Inap NAPZA - Hospice / Ruang Sakit Napza", "Per Orang/Paket", 350000, "baku", 1, "-", NULL, NULL, NULL),
	(94, 2, "RAWAT INAP KELAS II - Rawat Inap NAPZA - Motivational Enhancement Therapy", "Per Orang/Paket", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(95, 2, "RAWAT INAP KELAS II - Rawat Inap NAPZA - Terapi Substitusi-(Codein)", "Per Orang/Paket", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(96, 2, "RAWAT INAP KELAS II - Rawat Inap NAPZA - Kegiatan Napza (Outbond / Retret)", "Per Orang/Paket", 300000, "baku", 1, "-", NULL, NULL, NULL),
	(97, 2, "RAWAT INAP KELAS III - Akomodasi", "Per Hari", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(98, 2, "RAWAT INAP KELAS III - Visite - Dokter Sub Spesialis", "Per Visite", 65000, "baku", 1, "-", NULL, NULL, NULL),
	(99, 2, "RAWAT INAP KELAS III - Visite - Dokter Spesialis", "Per Visite", 45000, "baku", 1, "-", NULL, NULL, NULL),
	(100, 2, "RAWAT INAP KELAS III - Visite - Dokter Umum", "Per Visite", 18000, "baku", 1, "-", NULL, NULL, NULL),
	(101, 2, "RAWAT INAP KELAS III - Asuhan Keperawatan - Intensive Care", "Per Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(102, 2, "RAWAT INAP KELAS III - Asuhan Keperawatan - Total Care", "Per Kegiatan", 28000, "baku", 1, "-", NULL, NULL, NULL),
	(103, 2, "RAWAT INAP KELAS III - Asuhan Keperawatan - Parsial Care", "Per Kegiatan", 25000, "baku", 1, "-", NULL, NULL, NULL),
	(104, 2, "RAWAT INAP KELAS III - Asuhan Keperawatan - Minimal Care", "Per Kegiatan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(105, 2, "RAWAT INAP KELAS III - Rawat Inap NAPZA - HCU Napza", "Per Orang/Paket", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(106, 2, "RAWAT INAP KELAS III - Rawat Inap NAPZA - Detoksifikasi", "Per Orang/Paket", 300000, "baku", 1, "-", NULL, NULL, NULL),
	(107, 2, "RAWAT INAP KELAS III - Rawat Inap NAPZA - Hospice / Ruang Sakit Napza", "Per Orang/Paket", 250000, "baku", 1, "-", NULL, NULL, NULL),
	(108, 2, "RAWAT INAP KELAS III - Rawat Inap NAPZA - Motivational Enhancement  Therapy", "Per Orang/Paket", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(109, 2, "RAWAT INAP KELAS III - Rawat Inap NAPZA - Terapi Substitusi-(Codein)", "Per Orang/Paket", 350000, "baku", 1, "-", NULL, NULL, NULL),
	(110, 2, "RAWAT INAP KELAS III - Rawat Inap NAPZA - Kegiatan Napza  (Outbond / Retret)", "Per Orang/Paket", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(111, 2, "KONSULTASI Dokter Gigi", "Per Konsul", 70000, "baku", 1, "-", NULL, NULL, NULL),
	(112, 2, "KONSULTASI Gizi", "Per Konsul", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(113, 3, "Psiko Terapi Individual", "Per Kegiatan", 110000, "baku", 1, "-", NULL, NULL, NULL),
	(114, 4, "Psikoterapi", "Perjam", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(115, 4, "Tes Kecerdasan", "Per Test", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(116, 4, "Tes Kepribadian", "Per Test", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(117, 4, "Tes Minat", "Per Test", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(118, 4, "Tes Bakat", "Per Test", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(119, 4, "Tes Kematangan", "Per Test", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(120, 4, "Tes Kualitas Kerja", "Per Test", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(121, 4, "Tes MMPI (diluar surat sehat jiwa)", "Per Test", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(122, 4, "Konseling Keluarga", "Per Test", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(123, 4, "Psikoterapi Sederhana", "Per test", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(124, 4, "Konsultasi", "Per test", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(125, 4, "Observasi", "Per test", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(126, 5, "Psikiater - MCMI-III", "Per Tindakan", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(127, 5, "Psikiater - MMPI-2 DX", "Per Tindakan", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(128, 5, "Psikolog - Sederhana", "Per Tindakan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(129, 5, "Psikolog - Sedang", "Per Tindakan", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(130, 6, "Kecil - Poles Tambalan", "Per Tindakan", 65000, "baku", 1, "-", NULL, NULL, NULL),
	(131, 6, "Kecil - Incici Abces intra oral", "Per Tindakan", 65000, "baku", 1, "-", NULL, NULL, NULL),
	(132, 6, "Sedang - Curettage", "Per Tindakan", 95000, "baku", 1, "-", NULL, NULL, NULL),
	(133, 6, "Sedang - Tumpatan Sementara", "Per Tindakan", 95000, "baku", 1, "-", NULL, NULL, NULL),
	(134, 6, "Sedang - Perawatan syaraf gigi anterior tetap/ gigi sulung", "Per Tindakan", 95000, "baku", 1, "-", NULL, NULL, NULL),
	(135, 6, "Sedang - Perawatan syaraf gigi posterior tetap", "Per Tindakan", 95000, "baku", 1, "-", NULL, NULL, NULL),
	(136, 6, "Sedang - Ekstraksi Gigi Sulung", "Per Tindakan", 95000, "baku", 1, "-", NULL, NULL, NULL),
	(137, 6, "Sedang - Incici Abses ekstra oral", "Per Tindakan", 95000, "baku", 1, "-", NULL, NULL, NULL),
	(138, 6, "Besar - Tumpatan Amalgam", "Per Tindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(139, 6, "Besar - Ekstraksi Gigi Tetap", "Per Tindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(140, 6, "Besar - Tumpatan GIC", "Per Tindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(141, 6, "Besar - Scalling Rahang Atas", "Per Tindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(142, 6, "Besar - Scalling Rahang Bawah", "Per Tindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(143, 6, "Khusus - Ekstraksi Komplikasi", "Per Tindakan", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(144, 6, "Khusus - Tumpatan Composit ", "Per Tindakan", 300000, "baku", 1, "-", NULL, NULL, NULL),
	(145, 6, "Khusus - Alveolektomi", "Per Tindakan", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(146, 6, "Khusus - Odontektomi", "Per Tindakan", 600000, "baku", 1, "-", NULL, NULL, NULL),
	(147, 7, "Play Therapy", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(148, 7, "Terapi Wicara", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(149, 7, "Terapi Okupasi", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(150, 7, "Terapi Sensori Integrasi", "Perterapi", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(151, 7, "Modifikasi Perilaku", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(152, 7, "Terapi Snoozellen ", "Perterapi", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(153, 7, "Terapi Remedial ", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(154, 7, "Terapi Musik", "Perterapi", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(155, 7, "Art Therapy", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(156, 7, "Fisioterapi Anak", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(157, 7, "Psikoterapi Individual", "Perterapi", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(158, 7, "Cognitive Behaviour Therapy*", "Perterapi", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(159, 7, "Terapi Kelompok", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(160, 7, "Hypnotherapy", "Perterapi", 350000, "baku", 1, "-", NULL, NULL, NULL),
	(161, 7, "Terapi Relaksasi", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(162, 7, "Konseling Individu", "Perterapi", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(163, 7, "Psikoedukasi Keluarga", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(164, 7, "Terapi Keluarga*", "Perterapi", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(165, 7, "Tindakan Medis (Suntikan)", "Perterapi", 10000, "baku", 1, "-", NULL, NULL, NULL),
	(166, 8, "MEDIKOLEGAL - Surat Keterangan Sehat Jiwa ", "Persurat", 130000, "baku", 1, "-", NULL, NULL, NULL),
	(167, 8, "MEDIKOLEGAL - Surat Keterangan Bebas Narkoba", "Persurat", 130000, "baku", 1, "-", NULL, NULL, NULL),
	(168, 8, "MEDIKOLEGAL - Surat Keterangan Visum ", "Persurat", 600000, "baku", 1, "-", NULL, NULL, NULL),
	(169, 8, "MEDIKOLEGAL - Surat Keterangan Berbadan Sehat", "Persurat", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(170, 8, "PSIKOMETRI - Tes Kecerdasan", "Pertest", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(171, 8, "PSIKOMETRI - Tes Kepribadian", "Pertest", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(172, 8, "PSIKOMETRI - Tes Minat ", "Pertest", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(173, 8, "PSIKOMETRI - Tes Bakat", "Pertest", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(174, 8, "PSIKOMETRI - Tes Kematangan", "Pertest", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(175, 8, "PSIKOMETRI - Tes Kualitas Kerja", "Pertest", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(176, 8, "PSIKOMETRI - Tes Profil Lengkap", "Pertest", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(177, 8, "PSIKOMETRI - Tes MMPI (diluar surat sehat jiwa) - Pemeriksaan Perorangan", "Pertest", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(178, 8, "PSIKOMETRI - Tes MMPI (diluar surat sehat jiwa) - Paket klasikal tanpa surat Keterangan sehat jiwa - MMPI Paket klasikal    26-50 orang", "Perorang", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(179, 8, "PSIKOMETRI - Tes MMPI (diluar surat sehat jiwa) - Paket klasikal tanpa surat Keterangan sehat jiwa - MMPI Paket klasikal    51-100 orang", "Perorang", 160000, "baku", 1, "-", NULL, NULL, NULL),
	(180, 8, "PSIKOMETRI - Tes MMPI (diluar surat sehat jiwa) - Paket klasikal tanpa surat Keterangan sehat jiwa - MMPI Paket klasikal  100-500 orang", "Perorang", 140000, "baku", 1, "-", NULL, NULL, NULL),
	(181, 8, "PSIKOMETRI - Tes MMPI (diluar surat sehat jiwa) - Paket klasikal tanpa surat Keterangan sehat jiwa - MMPI Paket klasikal   >500 orang", "Perorang", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(182, 8, "Asesmen ASN (Aparatur Sipil Negara) - Asesmen Fungsional Madya dan Utama (Individual)", "Per Orang", 630000, "baku", 1, "-", NULL, NULL, NULL),
	(183, 8, "Asesmen ASN (Aparatur Sipil Negara) - Asesmen Fungsional Madya dan Utama (Group Min 20 Org)", "Per Orang", 395000, "baku", 1, "-", NULL, NULL, NULL),
	(184, 8, "Asesmen ASN (Aparatur Sipil Negara) - Interprestasi Asesmen", "Per Orang", 300000, "baku", 1, "-", NULL, NULL, NULL),
	(185, 9, "Akomodasi Day Care", "Perkunjungan", 90000, "baku", 1, "-", NULL, NULL, NULL),
	(186, 9, "Rekreasi", "Orang/Kegiatan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(187, 9, "Educational Therapy - Pelatihan English Class", "Orang/Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(188, 9, "Educational Therapy - Pelatihan Administrasi", "Orang/Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(189, 9, "Educational Therapy - Pelatihan Komputer", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(190, 9, "Occupational Therapy - AKS/ADL(Aktifitas kegiatan sehari-hari)", "Orang/Kegiatan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(191, 9, "Occupational Therapy - Tata Boga", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(192, 9, "Occupational Therapy - Salon", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(193, 9, "Occupational Therapy - Menjahit", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(194, 9, "Occupational Therapy - Kerajinan Tangan", "Orang/Kegiatan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(195, 9, "Occupational Therapy - Perkebunan/Pertamanan", "Orang/Kegiatan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(196, 9, "Occupational Therapy - Sablon Mug", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(197, 9, "Occupational Therapy - Pertukangan", "Orang/Kegiatan", 15000, "baku", 1, "-", NULL, NULL, NULL),
	(198, 9, "Music Therapy - Organ Tunggal/Band/Music", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(199, 9, "Music Therapy - Paduan Suara", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(200, 9, "Music Therapy - Seni Tari", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(201, 9, "Music Therapy - Karaoke", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(202, 9, "Vocational Rehabilitation - RH Ponsel", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(203, 9, "Vocational Rehabilitation - RH Garden", "Orang/Kegiatan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(204, 9, "Vocational Rehabilitation - RH Corner", "Orang/Kegiatan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(205, 9, "Vocational Rehabilitation - RH Cleaning Service", "Orang/Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(206, 9, "Rehabilitation Not Classified - Perpustakaan", "Orang/Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(207, 9, "Relaxation Training - Terapi Relaksasi", "Orang/Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(208, 9, "Play Psycotherapy - Olahraga", "Orang/Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(209, 9, "Play Psycotherapy - Olahraga dengan alat (fitnes)", "Orang/Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(210, 9, "Play Psycotherapy - Melukis", "Orang/Kegiatan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(211, 9, "Play Psycotherapy - Menonton Film/DVD", "Orang/Kegiatan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(212, 9, "Supprotive Verbal Psycotherapy - Kerohanian Islam", "Orang/Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(213, 9, "Supprotive Verbal Psycotherapy - Kerohanian Kristen", "Orang/Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(214, 9, "Supprotive Verbal Psycotherapy - Latihan Teknik Komunikasi", "Orang/Kegiatan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(215, 9, "Family Therapy - Terapi Keluarga", "Orang/Kegiatan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(216, 9, "Family Therapy - Family Gathering", "Orang/Kegiatan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(217, 9, "Family Therapy - Kunjungan Rumah", "Orang/Kunjungan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(218, 9, "Psycodrama", "Orang/Kegiatan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(219, 9, "Other Group Therapy - Terapi Kelompok Tim Profesi ", "Orang/Kegiatan", 10000, "baku", 1, "-", NULL, NULL, NULL),
	(220, 9, "Program Night Care - Program Night Care I", "Orang/bulan", 3600000, "baku", 1, "-", NULL, NULL, NULL),
	(221, 9, "Program Night Care - Program Night Care II", "Orang/bulan", 2300000, "baku", 1, "-", NULL, NULL, NULL),
	(222, 9, "Program Night Care - Program Night Care III", "Orang/bulan", 1850000, "baku", 1, "-", NULL, NULL, NULL),
	(223, 9, "Paket Rehabilitasi Psikososial - Paket 1 (Stase Seleksi)", "Per Paket", 760000, "baku", 1, "-", NULL, NULL, NULL),
	(224, 9, "Paket Rehabilitasi Psikososial - Paket 2 (Stase Aktifitas)", "Per Paket", 3125000, "baku", 1, "-", NULL, NULL, NULL),
	(225, 9, "Paket Rehabilitasi Psikososial - Paket 3 (Stase Mandiri)", "Per Paket", 7200000, "baku", 1, "-", NULL, NULL, NULL),
	(226, 9, "Terapi Koognitif - CBT", "Perterapi", 25000, "baku", 1, "-", NULL, NULL, NULL),
	(227, 9, "Terapi Koognitif - Konseling Individu/seleksi", "Perterapi", 25000, "baku", 1, "-", NULL, NULL, NULL),
	(228, 9, "Terapi Koognitif - Psikoedukasi Keluarga", "Perterapi", 25000, "baku", 1, "-", NULL, NULL, NULL),
	(229, 10, "Short Wave Diathermy (SWD)", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(230, 10, "Microwave Diathermy (MWD)", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(231, 10, "Trans Electrical Nerve Stimulatin  (TENS)", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(232, 10, "Faradisasi", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(233, 10, "Traksi Lumbal", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(234, 10, "Traksi Cervival", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(235, 10, "Exercise Therapy Ringan", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(236, 10, "Exercise Therapy Berat", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(237, 10, "Masase", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(238, 10, "Ultrasound Therapy", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(239, 10, "Infra Red Radiation (IRR)", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(240, 10, "IPP General", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(241, 10, "Asuhan Fisioterapi", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(242, 10, "Pemeriksaan Kebugaran  (Treadmill)", "Pertindakan", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(243, 11, "Terapi Aktivitas Kelompok (per orang)", "Perkegiatan", 10000, "baku", 1, "-", NULL, NULL, NULL),
	(244, 11, "Fiksasi Gerak", "Pertindakan", 60000, "baku", 1, "-", NULL, NULL, NULL),
	(245, 11, "Ambil Darah Astrup", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(246, 11, "Combustio (Kecil)", "Pertindakan", 75000, "baku", 1, "-", NULL, NULL, NULL),
	(247, 11, "Combustio (Sedang)", "Pertindakan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(248, 11, "Combustio (Besar)", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(249, 11, "Corpus Alineum", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(250, 11, "Debridement Sedang", "Pertindakan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(251, 11, "Debridement Besar", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(252, 11, "Dilatasi Phymosis", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(253, 11, "Eksterpasi Tumor Vagina/Vulva Kecil", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(254, 11, "Ekstraksi Kuku", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(255, 11, "Ganti / Balut Besar", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(256, 11, "Ganti/Balut Sedang", "Pertindakan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(257, 11, "Ganti/Balut Kecil", "Pertindakan", 75000, "baku", 1, "-", NULL, NULL, NULL),
	(258, 11, "Hidrotubasi", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(259, 11, "Incisi Abses", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(260, 11, "Injeksi", "Pertindakan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(261, 11, "Intubasi", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(262, 11, "Jahit Luka 1 s/d 5", "Pertindakan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(263, 11, "Jahit Luka > 5", "Perjahitan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(264, 11, "Jahitan Luka Besar Vagina / Vulva", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(265, 11, "Klisma", "Pertindakan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(266, 11, "Kuretage", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(267, 11, "Lavage Lambung", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(268, 11, "Nekrotomi Kecil", "Pertindakan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(269, 11, "Nekrotomi Sedang", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(270, 11, "Nekrotomi Besar", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(271, 11, "Pasang Folley Catheter/ Pelepasan", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(272, 11, "Pemasangan Infus / Pelepasan", "Pertindakan", 75000, "baku", 1, "-", NULL, NULL, NULL),
	(273, 11, "Pemasangan NGT / Pelepasan", "Pertindakan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(274, 11, "Pemasangan O2 / jam", "Pertindakan", 75000, "baku", 1, "-", NULL, NULL, NULL),
	(275, 11, "Pemasangan Kondom Cateter / Pelepasan", "Pertindakan", 75000, "baku", 1, "-", NULL, NULL, NULL),
	(276, 11, "Pemasangan Ventilator", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(277, 11, "Pemasangan WSD", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(278, 11, "Pungsi Ascites", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(279, 11, "Pungsi Pleura", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(280, 11, "Partus Normal ", "Pertindakan", 1250000, "baku", 1, "-", NULL, NULL, NULL),
	(281, 11, "Pungsi Cairan Sendi", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(282, 11, "Reposisi FR Sederhana+Pasang Bidai", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(283, 11, "Supra Pungsi Pubis", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(284, 11, "Terapi Inhalasi / Nebulizer (Tanpa Obat)", "Pertindakan", 75000, "baku", 1, "-", NULL, NULL, NULL),
	(285, 11, "Terapi Inhalasi / Nebulizer (Dengan Obat)", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(286, 11, "Toxoid", "Pertindakan", 72000, "baku", 1, "-", NULL, NULL, NULL),
	(287, 11, "Vena Seksi", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(288, 11, "Observasi 2 Jam Pertama (IGD)", "Pertindakan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(289, 11, "Observasi 1 Jam Berikutnya (IGD)", "Pertindakan", 72000, "baku", 1, "-", NULL, NULL, NULL),
	(290, 11, "Skin Tes", "Pertindakan", 72000, "baku", 1, "-", NULL, NULL, NULL),
	(291, 11, "Suction", "Pertindakan", 72000, "baku", 1, "-", NULL, NULL, NULL),
	(292, 11, "Memasang Infus Pump", "Pertindakan", 72000, "baku", 1, "-", NULL, NULL, NULL),
	(293, 11, "Pemasangan Data Scope", "Pertindakan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(294, 11, "Ekatraksi korpus alineum", "Perkegiatan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(295, 11, "RJP", "Perkegiatan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(296, 11, "ANC/Pemeriksaan kehamilan", "Perkegiatan", 72000, "baku", 1, "-", NULL, NULL, NULL),
	(297, 11, "Vulva Higienis", "Perkegiatan", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(298, 11, "Tindakan Khusus Fiksasi", "Pertindakan", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(299, 11, "Eksplorasi", "Pertindakan", 15000, "baku", 1, "-", NULL, NULL, NULL),
	(300, 11, "Kateterisasi", "Pertindakan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(301, 11, "Resusitasi", "Pertindakan", 60000, "baku", 1, "-", NULL, NULL, NULL),
	(302, 12, "Sederhana 1", "Per Pemeriksaan", 75000, "baku", 1, "-", NULL, NULL, NULL),
	(303, 12, "Sederhana 2", "Per Pemeriksaan", 97500, "baku", 1, "-", NULL, NULL, NULL),
	(304, 12, "Sedang", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(305, 12, "Besar", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(306, 12, "Khusus", "Per Pemeriksaan", 345000, "baku", 1, "-", NULL, NULL, NULL),
	(307, 12, "Kelompok 1 - Foto Thorax PA/AP dan Lat", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(308, 12, "Kelompok 1 - Foto Schedel/Kepala AP/Lat", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(309, 12, "Kelompok 1 - Foto Mandibula AP/Lat", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(310, 12, "Kelompok 1 - Foto Abdomen Polos", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(311, 12, "Kelompok 1 - Foto Shoulder Joint", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(312, 12, "Kelompok 1 - Foto Cubiti AP/Lat", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(313, 12, "Kelompok 1 - Foto Wrist Joint Perbandingan", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(314, 12, "Kelompok 1 - Foto Clavicula AP/Lat Perbandingan", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(315, 12, "Kelompok 1 - Foto Coccygues AP/LAT", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(316, 12, "Kelompok 1 - Foto Pedis Perbandingan", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(317, 12, "Kelompok 1 - Foto Angkle Joint Perbandingan", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(318, 12, "Kelompok 1 - Foto Manus Perbandingan", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(319, 12, "Kelompok 1 - Foto Cranium  /Basiscranium", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(320, 12, "Kelompok 1 - Foto Pelvis", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(321, 12, "Kelompok 1 - Foto Extermitas atas-bawah Ka/Ki", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(322, 12, "Kelompok 1 - Foto Vertebrae Thoracal AP/Lat", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(323, 12, "Kelompok 1 - Foto Vertebrae Lumbal AP/Lat", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(324, 12, "Kelompok 1 - Foto Lumbo Sacral", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(325, 12, "Kelompok 1 - Foto Panoramic", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(326, 12, "Kelompok 1 - Foto Top Lordotic", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(327, 12, "Kelompok 2 - Foto Os Nasal", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(328, 12, "Kelompok 2 - Foto Pedis Ka/Ki", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(329, 12, "Kelompok 2 - Foto Cubiti AP/Lat", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(330, 12, "Kelompok 2 - Foto Gigi", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(331, 12, "Kelompok 2 - Foto Basis Cranii", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(332, 12, "Kelompok 2 - Foto Wrist Joint Ka/Ki", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(333, 12, "Kelompok 2 - Foto Genu AP/Lat Ka/Ki", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(334, 12, "Kelompok 2 - Foto Clavicula Ka/Ki", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(335, 12, "Kelompok 2 - Foto Manus Ka/Ki", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(336, 12, "Kelompok 2 - Foto Angkle Joint Ka/Ki", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(337, 12, "Kelompok 2 - Foto Leher/Adenoid Lateral", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(338, 12, "Kelompok 2 - Foto Scavula Ka/Ki", "Per Pemeriksaan", 137500, "baku", 1, "-", NULL, NULL, NULL),
	(339, 12, "Kelompok 3 - Foto Sinus Paranasal", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(340, 12, "Kelompok 3 - Foto Extremitas atas Perbandingan", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(341, 12, "Kelompok 3 - Foto Shoulder Joint Perbandingan", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(342, 12, "Kelompok 3 - Foto TMJ PA/Lat", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(343, 12, "Kelompok 3 - Foto Extremitas Bawah Perbandingan                  ", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(344, 12, "Kelompok 3 - Foto Genu AP/LAT Perbandingan", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(345, 12, "Kelompok 3 - Foto Mastoid", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(346, 12, "Kelompok 3 - Foto Os Sacrum", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(347, 12, "Kelompok 4 - Foto Cervical AP/Lat/Oblique", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(348, 12, "Kelompok 4 - Foto Thoraco Lumbal AP/Lat", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(349, 12, "Kelompok 4 - Foto Thoracal AP/Lat", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(350, 12, "Kelompok 4 - Foto Lumbo Sacral AP/Lat", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(351, 12, "Kelompok 5 - Foto Thoracal AP/Lat/Oblique", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(352, 12, "Kelompok 5 - Foto Abdomen 3 Posisi", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(353, 12, "Kelompok 5 - Foto Lumbo Sacral AP/Lat/Oblique", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(354, 12, "Kelompok 5 - Thoracal AP/Lat/Oblique", "Per Pemeriksaan", 162500, "baku", 1, "-", NULL, NULL, NULL),
	(355, 12, "Kelompok 6 (USG) - USG Abdomen", "Per Pemeriksaan", 600000, "baku", 1, "-", NULL, NULL, NULL),
	(356, 12, "Kelompok 6 (USG) - USG Obgyn", "Per Pemeriksaan", 345000, "baku", 1, "-", NULL, NULL, NULL),
	(357, 12, "Kelompok 6 (USG) - USG Thyroid", "Per Pemeriksaan", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(358, 12, "Kelompok 6 (USG) - USG Mammae", "Per Pemeriksaan", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(359, 12, "Kelompok 6 (USG) - Scrotum", "Per Pemeriksaan", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(360, 12, "Kelompok 6 (USG) - USG Traktus Urinarius", "Per Pemeriksaan", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(361, 13, "HEMATOLOGI - Darah Rutin (Leukosit, Hb, Hematokrit, Trombosit) ", "Per Pemeriksaan", 70000, "baku", 1, "-", NULL, NULL, NULL),
	(362, 13, "HEMATOLOGI - Darah Lengkap", "Per Pemeriksaan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(363, 13, "HEMATOLOGI - Diff/Hitung Jenis", "Per Pemeriksaan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(364, 13, "HEMATOLOGI - LED", "Per Pemeriksaan", 25000, "baku", 1, "-", NULL, NULL, NULL),
	(365, 13, "HEMATOLOGI - Malaria", "Per Pemeriksaan", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(366, 13, "HEMATOLOGI - Golongan Darah", "Per Pemeriksaan", 25000, "baku", 1, "-", NULL, NULL, NULL),
	(367, 13, "HEMATOLOGI - Morfologi Darah Tepi (MDT)", "Per Pemeriksaan", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(368, 13, "HEMOSTATIS - CT", "Per Pemeriksaan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(369, 13, "HEMOSTATIS - BT", "Per Pemeriksaan", 20000, "baku", 1, "-", NULL, NULL, NULL),
	(370, 13, "URINALISIS - Urin Rutin", "Per Pemeriksaan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(371, 13, "URINALISIS - Tes Kehamilan", "Per Pemeriksaan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(372, 13, "KIMIA DARAH - Gula (Swaktu, Puasa, 2 Jam PP)", "Per Pemeriksaan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(373, 13, "KIMIA DARAH - SGOT", "Per Pemeriksaan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(374, 13, "KIMIA DARAH - SGPT", "Per Pemeriksaan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(375, 13, "KIMIA DARAH - Ureum ", "Per Pemeriksaan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(376, 13, "KIMIA DARAH - Creatinin", "Per Pemeriksaan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(377, 13, "KIMIA DARAH - Asam Urat", "Per Pemeriksaan", 30000, "baku", 1, "-", NULL, NULL, NULL),
	(378, 13, "KIMIA DARAH - Koleserol Total", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(379, 13, "KIMIA DARAH - HDL", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(380, 13, "KIMIA DARAH - LDL", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(381, 13, "KIMIA DARAH - Trigliserid", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(382, 13, "KIMIA DARAH - Bilirubin Total", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(383, 13, "KIMIA DARAH - Bilirubin Direct", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(384, 13, "KIMIA DARAH - Protein Total", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(385, 13, "KIMIA DARAH - Albumin", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(386, 13, "KIMIA DARAH - Alkali Pospatase", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(387, 13, "KIMIA DARAH - Gamma GT", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(388, 13, "ELEKTROLIT - Na, K, Cl", "Per Pemeriksaan", 170000, "baku", 1, "-", NULL, NULL, NULL),
	(389, 13, "ELEKTROLIT - Li", "Per Pemeriksaan", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(390, 13, "SEROLOGI - Tubex", "Per Pemeriksaan", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(391, 13, "SEROLOGI - HBsAg", "Per Pemeriksaan", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(392, 13, "SEROLOGI - Anti HCV", "Per Pemeriksaan", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(393, 13, "SEROLOGI - Anti HIV", "Per Pemeriksaan", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(394, 13, "SEROLOGI - Dengue Combo (NS1 & Ig M/G)", "Per Pemeriksaan", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(395, 13, "SEROLOGI - Faeces Lengkap", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(396, 13, "SEROLOGI - DRUG (Amphetamin, BZO,  CocIN, Metamphatin, Opiate)", "Per Pemeriksaan", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(397, 13, "SEROLOGI - BTA Sputum", "Per Pemeriksaan", 25000, "baku", 1, "-", NULL, NULL, NULL),
	(398, 13, "SEROLOGI - Tes NAPZA ", "Per Pemeriksaan", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(399, 13, "Transfusi Darah - PRC KTP DKI", "Per Pemeriksaan", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(400, 13, "Transfusi Darah - PRC KTP  Luar DKI", "Per Pemeriksaan", 750000, "baku", 1, "-", NULL, NULL, NULL),
	(401, 13, "Transfusi Darah - Plasma Konvalese", "Per Pemeriksaan", 2500000, "baku", 1, "-", NULL, NULL, NULL),
	(402, 13, "Widal", "Per Pemeriksaan", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(403, 13, "Anti TB", "Per Pemeriksaan", 67000, "baku", 1, "-", NULL, NULL, NULL),
	(404, 13, "Multitest", "Per Pemeriksaan", 120000, "baku", 1, "-", NULL, NULL, NULL),
	(405, 13, "HBA1C", "Per Pemeriksaan", 182000, "baku", 1, "-", NULL, NULL, NULL),
	(406, 13, "T3", "Per Pemeriksaan", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(407, 13, "T4", "Per Pemeriksaan", 180000, "baku", 1, "-", NULL, NULL, NULL),
	(408, 13, "TSHs", "Per Pemeriksaan", 195000, "baku", 1, "-", NULL, NULL, NULL),
	(409, 13, "Free T3", "Per Pemeriksaan", 297000, "baku", 1, "-", NULL, NULL, NULL),
	(410, 13, "Free T4", "Per Pemeriksaan", 250000, "baku", 1, "-", NULL, NULL, NULL),
	(411, 13, "Swab PCR", "Per Pemeriksaan", 275000, "baku", 1, "-", NULL, NULL, NULL),
	(412, 13, "PCR-S-Gene Target Failure (SGTF)", "Per Pemeriksaan", 350000, "baku", 1, "-", NULL, NULL, NULL),
	(413, 13, "Rapid Antibodi", "Per Pemeriksaan", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(414, 13, "Rapid Diagnostic Test Antigen", "Per Pemeriksaan", 75000, "baku", 1, "-", NULL, NULL, NULL),
	(415, 13, "Pemeriksaan CRP Kuantitatif", "Per Pemeriksaan", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(416, 13, "Pemeriksaan D-Dimer", "Per Pemeriksaan", 484000, "baku", 1, "-", NULL, NULL, NULL),
	(417, 13, "Pemeriksaan Analisis Gas Darah", "Per Pemeriksaan", 280000, "baku", 1, "-", NULL, NULL, NULL),
	(418, 13, "Tarif Pembuatan Kartu", "-", 15000, "baku", 1, "-", NULL, NULL, NULL),
	(419, 13, "Rheumatoid Factor Kualitatif", "Per Pemeriksaan", 250000, "baku", 1, "-", NULL, NULL, NULL),
	(420, 13, "Rhematoid Factor Kuantitatif", "Per Pemeriksaan", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(421, 13, "Hbe Ag", "Per Pemeriksaan", 800000, "baku", 1, "-", NULL, NULL, NULL),
	(422, 14, "Operasi Besar I", "Pertindakan", 5040000, "baku", 1, "-", NULL, NULL, NULL),
	(423, 14, "Operasi Besar II", "Pertindakan", 5040000, "baku", 1, "-", NULL, NULL, NULL),
	(424, 14, "Operasi Sedang I", "Pertindakan", 3120000, "baku", 1, "-", NULL, NULL, NULL),
	(425, 14, "Operasi Sedang II", "Pertindakan", 3120000, "baku", 1, "-", NULL, NULL, NULL),
	(426, 14, "Operasi Kecil I", "Pertindakan", 1680000, "baku", 1, "-", NULL, NULL, NULL),
	(427, 14, "Operasi Kecil II", "Pertindakan", 1680000, "baku", 1, "-", NULL, NULL, NULL),
	(428, 14, "Operasi Khusus I", "Pertindakan", 9480000, "baku", 1, "-", NULL, NULL, NULL),
	(429, 14, "Operasi Khusus II", "Pertindakan", 10200000, "baku", 1, "-", NULL, NULL, NULL),
	(430, 14, "Eksisi Tumor Jinak Kulit", "Pertindakan", 285000, "baku", 1, "-", NULL, NULL, NULL),
	(431, 14, "Ekstirpasi Tumor Jinak Kulit ", "Pertindakan", 285000, "baku", 1, "-", NULL, NULL, NULL),
	(432, 14, "Sirkumsisi Tanpa Sedasi", "Pertindakan", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(433, 14, "Sirkumsisi Dengan Sedasi", "Pertindakan", 780000, "baku", 1, "-", NULL, NULL, NULL),
	(434, 15, "Brain Mapping", "Perpemeriksaan", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(435, 15, "EEG Konvensional", "Perpemeriksaan", 280000, "baku", 1, "-", NULL, NULL, NULL),
	(436, 15, "EKG", "Pertindakan", 80000, "baku", 1, "-", NULL, NULL, NULL),
	(437, 15, "ECT - ECT Bermonitor premedikasi", "Perpemeriksaan", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(438, 15, "ECT - ECT Konvensional", "Perpemeriksaan", 350000, "baku", 1, "-", NULL, NULL, NULL),
	(439, 15, "Pemeriksaan HRV Tes", "Perpemeriksaan", 80000, "baku", 1, "-", NULL, NULL, NULL),
	(440, 15, "Tes Berra", "Per Tindakan", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(441, 15, "P300", "Per Tindakan", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(442, 15, "Polysomnografi", "Per Tindakan", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(443, 15, "Mobile Polygrafh", "Per Tindakan", 550000, "baku", 1, "-", NULL, NULL, NULL),
	(444, 15, "Terapi Bio-Feedback", "Per Tindakan", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(445, 15, "Neurofeedback", "Per Tindakan", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(446, 15, "Terapi TOVA - Visual", "Per Tindakan", 300000, "baku", 1, "-", NULL, NULL, NULL),
	(447, 15, "Terapi TOVA - Auditori", "Per Tindakan", 300000, "baku", 1, "-", NULL, NULL, NULL),
	(448, 15, "Terapi TOVA - Double (Visual + Auditori)", "Per Tindakan", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(449, 15, "TMS - Satuan", "Per tindakan", 800000, "baku", 1, "-", NULL, NULL, NULL),
	(450, 15, "TMS - Paket Tindakan", "5 Kali Tindakan", 3500000, "baku", 1, "-", NULL, NULL, NULL),
	(451, 15, "TMS - Paket Tindakan dan Konsultasi", "5 Kali Tindakan dan 1 Kali Konsultasi akhir", 3800000, "baku", 1, "-", NULL, NULL, NULL),
	(452, 15, "EMG", "Per Pemeriksaan", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(453, 15, "Konsultasi Dokter Psikiater atau Neurolog", "Per Konsultasi", 350000, "baku", 1, "-", NULL, NULL, NULL),
	(454, 15, "CT Scan - CT Kepala Non Kontras", "Per pemeriksaan", 1300000, "baku", 1, "-", NULL, NULL, NULL),
	(455, 15, "CT Scan - CT Kepala Trauma/ 3d", "Per pemeriksaan", 1400000, "baku", 1, "-", NULL, NULL, NULL),
	(456, 15, "CT Scan - CT Kepala Kontras", "Per pemeriksaan", 2400000, "baku", 1, "-", NULL, NULL, NULL),
	(457, 15, "CT Scan - CT Abdomen (Whole) Non Kontras", "Per pemeriksaan", 2500000, "baku", 1, "-", NULL, NULL, NULL),
	(458, 15, "CT Scan - CT Abdomen (Whole) Kontras", "Per pemeriksaan", 3500000, "baku", 1, "-", NULL, NULL, NULL),
	(459, 15, "CT Scan - CT Upper Abdomen Non Kontras", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(460, 15, "CT Scan - CT Upper Abdomen Kontras", "Per pemeriksaan", 3000000, "baku", 1, "-", NULL, NULL, NULL),
	(461, 15, "CT Scan - CT Pelvis Non Kontras", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(462, 15, "CT Scan - CT Pelvis Kontras", "Per pemeriksaan", 3000000, "baku", 1, "-", NULL, NULL, NULL),
	(463, 15, "CT Scan - CT Thorax Non Kontras", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(464, 15, "CT Scan - CT Thorax Kontras", "Per pemeriksaan", 3000000, "baku", 1, "-", NULL, NULL, NULL),
	(465, 15, "CT Scan - CT Spn Non Kontras", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(466, 15, "CT Scan - CT Spn Kontras", "Per pemeriksaan", 2500000, "baku", 1, "-", NULL, NULL, NULL),
	(467, 15, "CT Scan - CT Mastoid Non Kontras", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(468, 15, "CT Scan - CT Mastoid Kontras", "Per pemeriksaan", 2500000, "baku", 1, "-", NULL, NULL, NULL),
	(469, 15, "CT Scan - CT Orbita Non Kontras", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(470, 15, "CT Scan - CT Orbita Kontras", "Per pemeriksaan", 2500000, "baku", 1, "-", NULL, NULL, NULL),
	(471, 15, "CT Scan - CT Nasofaring Non Kontras", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(472, 15, "CT Scan - CT Nasofaring Kontras", "Per pemeriksaan", 2500000, "baku", 1, "-", NULL, NULL, NULL),
	(473, 15, "CT Scan - CT Soft Tissue Leher Non Kontras", "Per pemeriksaan", 1800000, "baku", 1, "-", NULL, NULL, NULL),
	(474, 15, "CT Scan - CT Soft Tissue Leher Kontras", "Per pemeriksaan", 2800000, "baku", 1, "-", NULL, NULL, NULL),
	(475, 15, "CT Scan - CT Cervical 3d", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(476, 15, "CT Scan - CT Thoracal 3d", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(477, 15, "CT Scan - CT Lumbal 3d", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(478, 15, "CT Scan - CT Ektremitas Superior 3d", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(479, 15, "CT Scan - CT Ektermitas Inferior 3d", "Per pemeriksaan", 1500000, "baku", 1, "-", NULL, NULL, NULL),
	(480, 15, "CT Scan - CT Larynx Non Kontras", "Per pemeriksaan", 1800000, "baku", 1, "-", NULL, NULL, NULL),
	(481, 15, "CT Scan - CT Larynx Kontras", "Per pemeriksaan", 2800000, "baku", 1, "-", NULL, NULL, NULL),
	(482, 16, "Tindakan Carpal Tunnel Release", "Per pemeriksaan", 570000, "baku", 1, "-", NULL, NULL, NULL),
	(483, 16, "Tindakan Besar pada saraf perifer", "Per pemeriksaan", 1270000, "baku", 1, "-", NULL, NULL, NULL),
	(484, 16, "Tindakan Kecil pada saraf perifer", "Per pemeriksaan", 800000, "baku", 1, "-", NULL, NULL, NULL),
	(485, 16, "Tindakan Besar pada tulang belakang", "Per pemeriksaan", 1600000, "baku", 1, "-", NULL, NULL, NULL),
	(486, 16, "Tindakan Kecil pada tulang belakang", "Per pemeriksaan", 750000, "baku", 1, "-", NULL, NULL, NULL),
	(487, 16, "Tindakan Tap dan ineksi pada spinal", "Per pemeriksaan", 440000, "baku", 1, "-", NULL, NULL, NULL),
	(488, 16, "Tindakan injeksi pada saraf perifer", "Per pemeriksaan", 330000, "baku", 1, "-", NULL, NULL, NULL),
	(489, 16, "Tindakan pemeriksaan neurologis lain", "Per pemeriksaan", 530000, "baku", 1, "-", NULL, NULL, NULL),
	(490, 16, "Tindakan besar pada tulang kepala dan wajah", "Per pemeriksaan", 1630000, "baku", 1, "-", NULL, NULL, NULL),
	(491, 16, "Tindakan kecil pada tulang kepala dan wajah", "Per pemeriksaan", 270000, "baku", 1, "-", NULL, NULL, NULL),
	(492, 16, "Tindakan besar pada lutut dan tungkai bawah", "Per pemeriksaan", 1580000, "baku", 1, "-", NULL, NULL, NULL),
	(493, 16, "Tindakan kecil pada lutut dan tungkai bawah", "Per pemeriksaan", 870000, "baku", 1, "-", NULL, NULL, NULL),
	(494, 16, "Tindakan besar pada lengan, siku dan bahu", "Per pemeriksaan", 1850000, "baku", 1, "-", NULL, NULL, NULL),
	(495, 16, "Tindakan kecil pada lengan, siku dan bahu", "Per pemeriksaan", 940000, "baku", 1, "-", NULL, NULL, NULL),
	(496, 16, "Tindakan besar pada tangan dan pergelangan tangan", "Per pemeriksaan", 420000, "baku", 1, "-", NULL, NULL, NULL),
	(497, 16, "Tindakan kecil pada tangan dan pergelangan tangan", "Per pemeriksaan", 320000, "baku", 1, "-", NULL, NULL, NULL),
	(498, 16, "Tindakan diagnostik dan terapeutik muskuloskeletal", "Per pemeriksaan", 420000, "baku", 1, "-", NULL, NULL, NULL),
	(499, 16, "Tindakan biopsi sendi dan traksi skeletal", "Per pemeriksaan", 930000, "baku", 1, "-", NULL, NULL, NULL),
	(500, 16, "Tindakan besar lain pada kepala dan leher", "Per pemeriksaan", 1900000, "baku", 1, "-", NULL, NULL, NULL),
	(501, 17, " a. Pendaftaran", "Per Pendaftaran", 15000, "baku", 1, "-", NULL, NULL, NULL),
	(502, 17, " b. Adm rekam Medis", "Per Pendaftaran", 35000, "baku", 1, "-", NULL, NULL, NULL),
	(503, 17, " c. Dokter Umum", "Per Pemeriksaan", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(504, 18, "Pendidikan Kepanitraan Medis - Program Dokter Spesialis", "Per Orang / Paket", 2500000, "baku", 1, "-", NULL, NULL, NULL),
	(505, 18, "Pendidikan Kepanitraan Medis - Program Dokter / Co Ass", "Per Orang / Paket", 650000, "baku", 1, "-", NULL, NULL, NULL),
	(506, 18, "Pendidikan Kepanitraan Medis - Magang S1 Kedokteran", "10 Hari/ orang", 300000, "baku", 1, "-", NULL, NULL, NULL),
	(507, 18, "Pendidikan Kepanitraan Medis - Penelitian S1 Kedokteran", "1 Penelitian/ Keg", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(508, 18, "Pendidikan keperawatan - Program pendidikan D3 - Praktek Laboratorium", "Perorang/Paket/5 hari", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(509, 18, "Pendidikan keperawatan - Program pendidikan D3 - Praktek Klinik Keperawatan  (PKK)", "Perorang/Paket/14 -21 hari", 270000, "baku", 1, "-", NULL, NULL, NULL),
	(510, 18, "Pendidikan keperawatan - Program pendidikan D3 - Praktek UAP", "Perorang/Paket/ 3 - 5 hari", 160000, "baku", 1, "-", NULL, NULL, NULL),
	(511, 18, "Pendidikan keperawatan - Program pendidikan D4 - Praktek Klinik Keperawatan  (PKK)", "Per Orang/Paket/5 hari", 270000, "baku", 1, "-", NULL, NULL, NULL),
	(512, 18, "Pendidikan keperawatan - Program Pendidikan S1 : - Praktek Laboratorium", "Per Orang/Paket/5 hari", 110000, "baku", 1, "-", NULL, NULL, NULL),
	(513, 18, "Pendidikan keperawatan - Program Pendidikan S1 : - Praktek Profesi Keperawatan/Nurse", "Per Orang/Paket/20 hari", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(514, 18, "Pendidikan keperawatan - Program Pendidikan S1 : - Magang Dosen", "Per Orang/Paket/3 bulan", 750000, "baku", 1, "-", NULL, NULL, NULL),
	(515, 18, "Pendidikan keperawatan - Program Pendidikan S2 : - Praktek Klinik Keperawatan Jiwa", "Per Orang/Paket/5 hari", 750000, "baku", 1, "-", NULL, NULL, NULL),
	(516, 18, "Pendidikan Psikologi - Kuliah Kerja Lapangan (KKL) S1", "Per Orang/Paket/20 hari", 350000, "baku", 1, "-", NULL, NULL, NULL),
	(517, 18, "Pendidikan Psikologi - Praktek Kerja (Magang) S1", "Per Orang/Paket/40 hari", 700000, "baku", 1, "-", NULL, NULL, NULL),
	(518, 18, "Pendidikan Psikologi - Praktek Magister Profesi", "Per Orang/Paket/10 hari", 250000, "baku", 1, "-", NULL, NULL, NULL),
	(519, 18, "Pendidikan Lain-lain - Setara D3", "Per Orang/Paket/20 hari", 350000, "baku", 1, "-", NULL, NULL, NULL),
	(520, 18, "Pendidikan Lain-lain - Setara S1", "Per Orang/Paket/20 hari", 410000, "baku", 1, "-", NULL, NULL, NULL),
	(521, 18, "Pendidikan Program Vokasi - D3 ", "Per Orang/Paket/20 hari", 400000, "baku", 1, "-", NULL, NULL, NULL),
	(522, 18, "Pendidikan Program Vokasi - D4 - S1", "Per Orang/Paket/20 hari", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(523, 18, "Praktek Kerja (Magang) - Praktek Kerja (Magang) SLTA", "-", 0, "baku", 1, "-", NULL, NULL, NULL),
	(524, 18, "Praktek Kerja (Magang) - Praktek Kerja (Magang) D1 - D3", "Per Orang/Paket/10 hari", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(525, 18, "Praktek Kerja (Magang) - Praktek Kerja (Magang) S1", "Per Orang/Paket/10 hari", 200000, "baku", 1, "-", NULL, NULL, NULL),
	(526, 18, "Praktek Kerja (Magang) - Praktek Kerja  (Magang)S2", "Per Orang/Paket/10 hari", 300000, "baku", 1, "-", NULL, NULL, NULL),
	(527, 18, "Praktek Kerja (Magang) - Praktik Kerja (Magang) Institusi", "Per Orang/Paket/10 hari", 300000, "baku", 1, "-", NULL, NULL, NULL),
	(528, 18, "Kegiatan Lainnya - Survey/ Observasi Lapangan", "Per Orang/data", 100000, "baku", 1, "-", NULL, NULL, NULL),
	(529, 18, "Kegiatan Lainnya - Studi Banding", "Per Orang/hari", 275000, "baku", 1, "-", NULL, NULL, NULL),
	(530, 18, "Kegiatan Lainnya - Kunjungan Institusi Pendidikan - SMA dan sederajat (termasuk Materi)", "Per Kunjungan", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(531, 18, "Kegiatan Lainnya - Kunjungan Institusi Pendidikan - D1 - S3 (termasuk Materi)", "Per Kunjungan", 1000000, "baku", 1, "-", NULL, NULL, NULL),
	(532, 18, "Kegiatan Lainnya - Tambahan Materi", "-", 275000, "baku", 1, "-", NULL, NULL, NULL),
	(533, 18, "Kegiatan Lainnya - Penelitian - D1 - D3", "Per Penelitian", 250000, "baku", 1, "-", NULL, NULL, NULL),
	(534, 18, "Kegiatan Lainnya - Penelitian - D4 - S1", "Per Penelitian", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(535, 18, "Kegiatan Lainnya - Penelitian - S2", "Per Penelitian", 750000, "baku", 1, "-", NULL, NULL, NULL),
	(536, 18, "Kegiatan Lainnya - Penelitian - S3", "Per Penelitian", 1000000, "baku", 1, "-", NULL, NULL, NULL),
	(537, 18, "Kegiatan Lainnya - Penelitian - Institusional Komersial", "Per Sampel", 2000000, "baku", 1, "-", NULL, NULL, NULL),
	(538, 18, "Kegiatan Lainnya - Penelitian (Anak pegawai RSJSH) - D1-D3", "1 Penelitian/Keg", 125000, "baku", 1, "-", NULL, NULL, NULL),
	(539, 18, "Kegiatan Lainnya - Penelitian (Anak pegawai RSJSH) - D4-S1", "1 Penelitian/Keg", 250000, "baku", 1, "-", NULL, NULL, NULL),
	(540, 18, "Kegiatan Lainnya - Sertifikat Kompetensi", "Per Sertifikat", 10000, "baku", 1, "-", NULL, NULL, NULL),
	(541, 19, "Penggunaan Gedung dan Bangunan", "Per m2", 22000, "baku", 1, "-", NULL, NULL, NULL),
	(542, 19, "Penggunaan Gedung SerbagunaPer Jam (Hari Kerja)", "Per Jam (Hari Kerja)", 700000, "baku", 1, "-", NULL, NULL, NULL),
	(543, 19, "Penggunaan Gedung SerbagunaPer Jam (Hari Libur)", "Per Jam (Hari Libur)", 800000, "baku", 1, "-", NULL, NULL, NULL),
	(544, 19, "Penggunaan Gedung SerbagunaPer Paket (Hari Kerja)", "Per Paket (Hari Kerja)", 5000000, "baku", 1, "-", NULL, NULL, NULL),
	(545, 19, "Penggunaan Gedung SerbagunaPer Paket (Hari Libur)", "Per Paket (Hari Libur)", 5600000, "baku", 1, "-", NULL, NULL, NULL),
	(546, 19, "Penggunaan Tanah/Lahan Rumah Sakit ", "Per m2/bulan", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(547, 19, "Pengambilan Film (Shoting)", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(548, 19, "Parkir", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(549, 19, "Penggunaan Sarana Olah Raga - Lapangan Sepakbola/Futsal", "Per Jam", 75000, "baku", 1, "-", NULL, NULL, NULL),
	(550, 19, "Penggunaan Sarana Olah Raga - Lapangan Tenis", "Per Jam", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(551, 19, "Penggunaan Sarana Olah Raga - Bulutangkis/Volly Ball", "Per Jam", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(552, 19, "Penggunaan Lahan untuk ATM BRI", "Per Bulan", 2100000, "baku", 1, "-", NULL, NULL, NULL),
	(553, 19, "Asrama Putri ", "Per Kamar/hari/orng", 40000, "baku", 1, "-", NULL, NULL, NULL),
	(554, 19, "Wisma Diklat - Kamar Deluxe", "Per Kamar/hari/orng", 50000, "baku", 1, "-", NULL, NULL, NULL),
	(555, 19, "Wisma Diklat - Kamar Standart", "Per Kamar/hari/orng", 45000, "baku", 1, "-", NULL, NULL, NULL),
	(556, 19, "Wisma Diklat - Extra Bed", "", 15000, "baku", 1, "-", NULL, NULL, NULL),
	(557, 19, "Wisma Diklat (Pasien Isolasi Mandiri) - Makan 3 Kali Sehari, Kamar mandi dalam (1 Orang)", "Per Hari", 160000, "baku", 1, "-", NULL, NULL, NULL),
	(558, 19, "Wisma Diklat (Pasien Isolasi Mandiri) - Makan 3 Kali Sehari, Kamar mandi dalam (2 Orang)", "Per Hari", 250000, "baku", 1, "-", NULL, NULL, NULL),
	(559, 19, "Wisma Diklat (Pasien Isolasi Mandiri) - Makan 3 Kali Sehari, Kamar mandi luar (1 Orang)", "Per Hari", 150000, "baku", 1, "-", NULL, NULL, NULL),
	(560, 19, "Wisma Diklat (Pasien Isolasi Mandiri) - Makan 3 Kali Sehari, Kamar mandi luar (2 Orang)", "Per Hari", 220000, "baku", 1, "-", NULL, NULL, NULL),
	(561, 19, "Perawatan Jenazah", "Per Kegiatan", 500000, "baku", 1, "-", NULL, NULL, NULL),
	(562, 19, "Ambulance - Dalam Kota 10 Km", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(563, 19, "Ambulance - Dalam Kota 10 s/d 20 Km", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(564, 19, "Ambulance - Dalam Kota 20 s/d 30 Km", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(565, 19, "Ambulance - Kab. Tangerang", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(566, 19, "Ambulance - Kab. Serang", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(567, 19, "Ambulance - Kab. Lebak", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(568, 19, "Ambulance - Pandegelang", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(569, 19, "Ambulance - Kota Cilegon dan Merak", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(570, 19, "Ambulance - Kota Serang", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(571, 19, "Ambulance - Kab. Bekasi", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(572, 19, "Ambulance - Kab. Bogor", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(573, 19, "Ambulance - Kota Bogor", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(574, 19, "Ambulance - Kab. Karawang", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(575, 19, "Ambulance - Kab. Purwakarta", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(576, 19, "Ambulance - Kab. Sukabumi", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(577, 19, "Ambulance - Kab. Cianjur", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(578, 19, "Ambulance - Kab. Subang", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(579, 19, "Ambulance - Kab. Bandung Barat", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(580, 19, "Ambulance - Kab. Bandung", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(581, 19, "Ambulance - Kab. Sumedang", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(582, 19, "Ambulance - Kab. Majalengka", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(583, 19, "Ambulance - Kab. Indramayu", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(584, 19, "Ambulance - Kab. Cirebon", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(585, 19, "Ambulance - Kab. Tasikmalaya", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(586, 19, "Ambulance - Kab. Kuningan", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(587, 19, "Ambulance - Kab. Garut", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(588, 19, "Ambulance - Kab. Ciamis", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(589, 19, "Ambulance - Kota Bandung", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(590, 19, "Ambulance - Kota Sukabumi", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(591, 19, "Ambulance - Kota Tasikmalaya", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(592, 19, "Ambulance - Kota Banjar", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(593, 19, "Ambulance - Kota Cirebon", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(594, 19, "Ambulance - Kota Cimahi", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(595, 19, "Ambulance - Blitar", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(596, 19, "Ambulance - Tarif Dasar Per 25 Km", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(597, 19, "Ambulance - Tarif Tambahan Per Km", "-", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(598, 19, "Bus - Dalam Kota  (10 jam)", "Per 10 Jam", 0, "nonbaku", 1, "-", NULL, NULL, NULL),
	(599, 19, "Bus - Luar Kota (paket)", "Per Hari", 2500000, "baku", 1, "-", NULL, NULL, NULL),
	(600, 19, "Laundry", "Per Kg", 14000, "baku", 1, "-", NULL, NULL, NULL);

/*!40000 ALTER TABLE `tindakan` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table uangmuka
# ------------------------------------------------------------

DROP TABLE IF EXISTS `uangmuka`;

CREATE TABLE `uangmuka` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_pasien` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nomor_mr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uang_muka` bigint DEFAULT NULL,
  `uang_penerimaan` bigint DEFAULT NULL,
  `uang_pengembalian` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table uangmuka_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `uangmuka_item`;

CREATE TABLE `uangmuka_item` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uangmuka_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shift` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal_awal` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `jenis_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saldo` bigint DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table unit_layanan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_layanan`;

CREATE TABLE `unit_layanan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `layanan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `unit_layanan` WRITE;
/*!40000 ALTER TABLE `unit_layanan` DISABLE KEYS */;

INSERT INTO `unit_layanan` (`id`, `layanan`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, "RAWAT JALAN", NULL, NULL, NULL),
	(2, "RAWAT INAP", NULL, NULL, NULL),
	(3, "PSIKIATRIK DEWASA", NULL, NULL, NULL),
	(4, "TINDAKAN PSIKOLOGI", NULL, NULL, NULL),
	(5, "Check Up Kesehatan Jiwa", NULL, NULL, NULL),
	(6, "TINDAKAN GIGI ", NULL, NULL, NULL),
	(7, "TINDAKAN TERAPI ANAK DAN REMAJA", NULL, NULL, NULL),
	(8, "MHCU", NULL, NULL, NULL),
	(9, "REHABILITASI PSIKOSOSIAL", NULL, NULL, NULL),
	(10, "REHABILITASI MEDIK (FISIOTERAPI)", NULL, NULL, NULL),
	(11, "TINDAKAN MEDIS DAN KEPERAWATAN", NULL, NULL, NULL),
	(12, "RADIOLOGI", NULL, NULL, NULL),
	(13, "LABORATORIUM", NULL, NULL, NULL),
	(14, "BEDAH", NULL, NULL, NULL),
	(15, "ELEKTROMEDIK", NULL, NULL, NULL),
	(16, "Klinik Nyeri", NULL, NULL, NULL),
	(17, "Tes Buta Warna", NULL, NULL, NULL),
	(18, "PENDIDIKAN DAN LATIHAN (DIKLAT)", NULL, NULL, NULL),
	(19, "PENGGUNAAN SARANA DAN PRASARANA", NULL, NULL, NULL);

/*!40000 ALTER TABLE `unit_layanan` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table use
# ------------------------------------------------------------

DROP TABLE IF EXISTS `use`;

CREATE TABLE `use` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rolee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `use` WRITE;
/*!40000 ALTER TABLE `use` DISABLE KEYS */;

INSERT INTO `use` (`id`, `rolee`, `name`, `nip`, `username`, `password`, `email`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, "bendahara_penerimaan", "April Santy, SE", NULL, "april.santy", "$2y$10$dVqLj2GOsQ4RsU87NukZ4esOq1R.D6WeU0CZW5emgJje8L9w8uFTK", "april.santy@gmail.com", NULL, NULL, "2020-09-16 06:31:46", "2023-11-13 09:24:15"),
	(4, "penjamin", "Ahmad Furkon, SE", NULL, "ahmad.furkon", "$2y$10$/FSzEG8CKJuCGFYl9P1SqeCJ6ELtJjY53/O8Hzs3TXjsiH4RyYaYm", "email1@gmail.com", NULL, NULL, "2020-10-07 01:36:13", "2020-10-07 01:36:13"),
	(6, "superadmin", "Fauzi", NULL, "superadmin", "$2y$10$e8PuXPffEriV4QXOy6caiO4Fs6MJQoj8EWQ/7un6x4rFjCdNQLZMq", "arsipfauzi@gmail.com", NULL, NULL, "2020-10-15 01:52:40", "2020-10-15 01:52:40"),
	(7, "user", "User Satu", NULL, "testing1", "$2y$10$TQLcIF3XbkzhdRlh.yRR6.5pXaCLT.vJfi9siyDpb72E1zQ/FQ/zq", "asdadsa@gmail.com", NULL, NULL, "2020-10-16 12:52:42", "2020-10-16 12:52:42"),
	(8, "bendahara_penerimaan", "Rivaldiansyah", NULL, "rivaldiansyah", "$2y$10$pKMyONSd..U3qSHygZ1fe.9HtGuD6HFP8gQY4agAJBjNujiN75pca", "email2@gmail.com", NULL, NULL, "2021-01-18 01:25:22", "2021-01-18 01:25:22"),
	(9, "supervisor", "Apriliani Indah Tamher", NULL, "apriliani.indah.tamher", "$2y$10$FUKdyecR0iWqJuw1I4GNjuBWYeXau3mBhShx7zjtjkGt8rrXGt/1q", "dummy@gmail.com", NULL, NULL, "2021-03-04 08:59:56", "2021-03-04 08:59:56"),
	(10, "anggaran", "Dwi Budi Astuti", NULL, "dwi.budi.astuti", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", "email3@gmail.com", NULL, NULL, "2021-03-30 14:29:16", "2021-03-30 14:29:16"),
	(11, "subkoor_anggaran", "Supardi", NULL, "supardi", "$2y$10$zGKe1sz8CQLCYzyDcYPGHe5lN3T6wHPG8zq7eV0XssqaliHHtBOs.", "gmail4@gmail.com", NULL, NULL, "2021-12-01 10:24:37", "2021-12-01 10:30:43"),
	(12, "Acc1Checklist", "Bambang Trio Saputro", NULL, "bambang.trio.saputro", "$2y$10$.nJJYcxiOsa5UhXzNi3ZV.ntqP/2v9E/BlfhY4nUW0lVdbA7bWM8i", "email10@gmail.com", NULL, NULL, "2022-01-07 10:09:09", "2022-02-16 11:06:47"),
	(13, "Acc4Checklist", "Harris Fadillah SE, MM", NULL, "harris.fadillah", "$2y$10$nUwXXRZE02AMCDOxTWeZhuslNCqXr7L9mdbgffW2yh.9nhdlAmWry", "email@gmaill.com", NULL, NULL, "2022-02-15 14:53:40", "2022-02-16 11:07:29"),
	(14, "Acc2Checklist", "Diyah Asida, S.Gz", NULL, "diyah.asida", "$2y$10$8wOeW.rELpXjlR0fsF/jReBiLWc8xUYWCsj0nt3lvFvXvds0TrK3G", "email1@gmaill.com", NULL, NULL, "2022-02-15 15:02:36", "2023-01-09 15:32:39"),
	(15, "Acc3Checklist", "dr. Yune Laukati PPK BLU", "1234567890", "dr.yune.laukati", "$2y$10$68nIkUuuiCZFJ3sgZjQ1WeZyslM1Srckoc4sa0nfoZ7AGr0FhHLBe", "email2@gmaill.com", NULL, NULL, "2022-02-15 15:11:01", "2023-05-30 10:39:12"),
	(16, "Acc5Checklist", "Rommel Pakpahan, Amd", "198507242014021001", "rommel.pakpahan", "$2y$10$68nIkUuuiCZFJ3sgZjQ1WeZyslM1Srckoc4sa0nfoZ7AGr0FhHLBe", "email5@gmaill.com", NULL, NULL, "2022-02-15 15:12:26", "2022-08-22 08:23:56"),
	(18, "hutang", "Nurbaeti Sholehah", NULL, "nurbaeti.sholehah", "$2y$10$5xJlCVHXUbOpuxMwRPXS9OZLKCSJHe1Uw.UfP61o/rGeQw0Oh2K3m", "email12@gmail.com", NULL, NULL, "2022-06-15 17:29:12", "2022-06-15 17:29:12"),
	(19, "pajak", "Isra Maharani Dwiasnita, S.Ak", NULL, "isra.maharani", "$2y$10$aeBjr1syTHZ7nw9T2uraReqoNQUmOhrCDyMAxSfuHMZRh9rs.sQPi", "emailpajak@gmail.com", NULL, NULL, "2022-08-24 14:49:56", "2022-08-24 14:49:56"),
	(20, "anggaran", "user anggaran 1", NULL, "user.anggaran.1", "$2y$10$VsFytLOe/yiOjZnV2Kx3TuiwZCcunCR1kafzxV1eO.B/L9KUHALPq", "user_anggaran_1@gmail.com", NULL, NULL, "2023-01-10 15:41:45", "2023-01-10 15:44:24"),
	(21, "hutang", "User Hutang 1", NULL, "user.hutang.1", "$2y$10$bclvPEnBDe5.HNtMaimFPuCCvPhubyJiw7XszF.9RUDBE/kfqOiVa", "user.hutang.1@gmail.com", NULL, NULL, "2023-01-11 08:41:28", "2023-01-11 08:41:28"),
	(25, "user", "Darsono", NULL, "darsono", "$2y$10$zxb7XC0PV3d9mn1V1v0xEe.3tnDlp0TdkpM2FUmoF/GyjTdL0UN5m", "darsono@gmail.com", NULL, NULL, "2023-06-09 14:12:44", "2023-06-09 14:12:44"),
	(26, "user", "Heri Kusuma", NULL, "heri.kusuma", "$2y$10$zS8vNIkuJTJq7KBNL/R/UeaWb0APTXXnpGBZVeS2wgIcVtT/m1hrS", "herikusuma@gmail.com", NULL, NULL, "2023-06-09 14:13:20", "2023-06-09 14:13:20"),
	(27, "user", "Kadir", NULL, "kadir", "$2y$10$fobcMN83D68Yw5mWN5hflOZKIrt6ajATSgz5bnMOCa85PW9rTKn1K", "kadir@gmail.com", NULL, NULL, "2023-06-09 14:13:43", "2023-06-09 14:13:43"),
	(28, "user", "Majid", NULL, "majid", "$2y$10$ZJFxpbgNOFF1ogXJ1Mz6Re96/gBAlAmxaqV2.awU1MXSXfht658cy", "majid@gmail.com", NULL, NULL, "2023-06-09 14:14:05", "2023-06-09 14:14:05"),
	(29, "user", "Sutjitawati", NULL, "sutjitawati", "$2y$10$amOoz51akXJU7tbVOZep5eqL5LE/0PVsjDjWu0.Er5IJN.aBLed3G", "sutjitawati@gmail.com", NULL, NULL, "2023-06-09 14:14:41", "2023-06-09 14:14:41"),
	(30, "user", "Vivi Latifah", NULL, "vivi.latifah", "$2y$10$iml.Ts33Le1ye4L9T5dhk.2Vh2xaa93FLwYw/vFGM8OsQz.qyiZmq", "vivilatifah@gmail.com", NULL, NULL, "2023-06-09 14:15:11", "2023-06-09 14:15:11"),
	(31, "user", "Zaenudin", NULL, "zaenudin", "$2y$10$apy4desw3A7.WqCK3.AQo.yZhCs4H3UAvJwFA/wh0Y0nzFwcJkhgC", "zaenudin@gmail.com", NULL, NULL, "2023-06-09 14:15:39", "2023-06-09 14:15:39");

/*!40000 ALTER TABLE `use` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table user_has_strukturorganisasi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_has_strukturorganisasi`;

CREATE TABLE `user_has_strukturorganisasi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `strukturorganisasi_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_pegawai` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=469 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `status_pegawai`, `nip`, `name`, `username`, `password`, `email`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, NULL, "", "Fauzi", "superadmin", "$2y$10$e8PuXPffEriV4QXOy6caiO4Fs6MJQoj8EWQ/7un6x4rFjCdNQLZMq", NULL, NULL, NULL, NULL, NULL),
	(2, "PNS", "197009072001122001", "dr. DESMIARTI, Sp.KJ, MARS", "197009072001122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(3, "PNS", "197309282005012001", "dr. GALIANTI PRIHANDAYANI, Sp.KJ, MARS", "197309282005012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(4, "PNS", "197112231997031002", "EKO HEPPY PURWANTO, SKM, MM, MARS", "197112231997031002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(5, "PNS", "196607121987032001", "Ns. ILAWATI, S.Kep", "196607121987032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(6, "PNS", "198509142015031001", "HENDRO PRASETIYO, Amd", "198509142015031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(7, "PNS", "196709181991031003", "SUNARTO", "196709181991031003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(8, "PNS", "198005162005011005", "Ns. BAMBANG SUMARDI, S.Kep,M.Kep, Sp.Kep.J", "198005162005011005", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(9, "PNS", "196703041992031002", "IMAM PURWADI, S.Pd", "196703041992031002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(10, "PNS", "198205202006041009", "TRI PRASETYO, Amd", "198205202006041009", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(11, "PNS", "196508121987031008", "DEDI SUTISNA", "196508121987031008", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(12, "PNS", "198302172010122002", "WIWIK KURNIATI, S.Kom", "198302172010122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(13, "PNS", "197110111992031004", "SUHUR, SH, MH", "197110111992031004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(14, "PNS", "197912232006041014", "CHRISTIAN HUTAPEA, SH", "197912232006041014", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(15, "PNS", "196801021988032001", "DORTEA LEWEN, Ners., M.Kes., MH", "196801021988032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(16, "PNS", "197704272008121001", "JAKPAR RANGKUTI", "197704272008121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(17, "PNS", "196908192007101001", "BAMBANG HENDARTO", "196908192007101001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(18, "PNS", "197510092005012001", "Ns. DIAH SUKAESTI, S.Kep,M.Kep, Sp.Kep.J", "197510092005012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(19, "PNS", "197306161998031001", "CHANDRA BENYAL, S.Sos", "197306161998031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(20, "PNS", "196510061992021001", "SATIAWAN PUTRA SARAGIH, S.Sos", "196510061992021001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(21, "PNS", "196811051994032001", "SITI SAPUR", "196811051994032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(22, "PNS", "197405222006041009", "WISNOE AKBAR KERTAPATI, SE", "197405222006041009", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(23, "PNS", "196510091990031003", "EKO SUPRAPTO", "196510091990031003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(24, "PNS", "196608011992031001", "RAKIM", "196608011992031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(25, "PNS", "196603031992031004", "AMBAR", "196603031992031004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(26, "PNS", "197009012007011033", "MAMAN SULAEMAN", "197009012007011033", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(27, "PNS", "197407212008121002", "MULYADI", "197407212008121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(28, "PNS", "197605312006042001", "Ns. NENG ESTI WINAHAYU, Sp.Kep.J. M.Kep", "197605312006042001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(29, "PNS", "197705012008121001", "MUHAMAD RIDWAN", "197705012008121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(30, "PNS", "196712121998031002", "KHAMZAH, S.ST", "196712121998031002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(31, "PNS", "196609302007011028", "NGADIMAN", "196609302007011028", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(32, "PNS", "197903302006042006", "dr. RENY ROSNITA BAASALEM, M.K.K", "197903302006042006", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(33, "PNS", "197204211997031005", "RUDI PRIHANTANA, Amd", "197204211997031005", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(34, "PNS", "198712142010122004", "DWI ASTUTI, Amd.KL", "198712142010122004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(35, "PNS", "198304202010121002", "ICHSANI, Amd.KL", "198304202010121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(36, "PNS", "199612252023211004", "WISDA FAHMI SAPUTRA", "199612252023211004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(37, "PNS", "197103231996032001", "ERIKA BAKKARA, SKM", "197103231996032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(38, "PNS", "196507302007011012", "DIDI ROSADI", "196507302007011012", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(39, "PNS", "196609272007011019", "EDDY SURYANA", "196609272007011019", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(40, "PNS", "196312241987031001", "HARRIS FADILLAH, SE, MM", "196312241987031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(41, "PNS", "197803282005011002", "PETRUS DARIA KONDOALLO, SE., M.Ak", "197803282005011002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(42, "PNS", "197512132005012002", "TAMIANNA SINAGA, SE, M.Ak", "197512132005012002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(43, "PNS", "199309022022032003", "ANIS SEPTYANI PUTRI", "199309022022032003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(44, "PNS", "198204072006042022", "APRILIANI INDAH TAMHER, SE", "198204072006042022", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(45, "PNS", "197304161992032001", "APRIL SANTY, SE", "197304161992032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(46, "PNS", "198507242014021001", "ROMMEL PAKPAHAN, Amd", "198507242014021001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(47, "PNS", "198003132008012016", "DEWI ISABELLA PARMONO, SE", "198003132008012016", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(48, "PNS", "196905081993032001", "SUTJITAWATI", "196905081993032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(49, "PNS", "196810122007011031", "KADIR SOLAIMAN, SE", "196810122007011031", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(50, "PNS", "197207022008121002", "MOHAMMAD ZAENUDIN", "197207022008121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(51, "PNS", "196510101993031006", "SUPARDI, SE", "196510101993031006", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(52, "PNS", "198510112014022001", "DWI BUDI ASTUTI, Amd", "198510112014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(53, "PNS", "197106071996022001", "SUSI FATIMAH, SKM, M.Kes", "197106071996022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(54, "PNS", "198001112007012018", "SILVI TRIANA, SKM", "198001112007012018", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(55, "PNS", "197211132005012002", "SUWALGIYAH, S.Kep, Ners ", "197211132005012002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(56, "PNS", "196508061999031001", "ARYA YUDHA PUTRA, S.Psi", "196508061999031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(57, "PNS", "198612032015031001", "WAHYU NUGRAHA NUR ARIFFIANTO, Amd", "198612032015031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(58, "PNS", "197207272008121002", "MOH ARIF SALAMPESSY", "197207272008121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(59, "PNS", "198501242014121001", "drg. IWAN SETIADI", "198501242014121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(60, "PNS", "197810092010121001", "SULAIMAN, Amd", "197810092010121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(61, "PNS", "198201132010121003", "TEDHY GARDO YUDHO, Amd", "198201132010121003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(62, "PNS", "199309212022031001", "NURHIDAYATULOH", "199309212022031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(63, "PNS", "199506062022031002", "MUHAMMAD WARDHIANSYAH", "199506062022031002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(64, "PNS", "197102262008011007", "dr. AGUNG FRIJANTO, Sp.KJ, MH", "197102262008011007", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(65, "PNS", "197503092009122003", "dr. AYESHA DEVINA, Sp.KJ", "197503092009122003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(66, "PNS", "196503231993032002", "Ns. SALAMIYAH, S.Kep, M.Si", "196503231993032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(67, "PNS", "197011292005012003", "dr. I GUSTI AYU DIAH TUNTIAN, M.K.K", "197011292005012003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(68, "PNS", "197105021999031002", "CECE KURNAWAN, SE", "197105021999031002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(69, "PNS", "197702252008012011", "ROSDIYANA ARYATI SYAM, AMG", "197702252008012011", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(70, "PNS", "198007022010121002", "YUDI RACHMAN, AMK", "198007022010121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(71, "PNS", "196610041987032002", "NANI RUKMANAH, S.Kep, Ners, M.Kes ", "196610041987032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(72, "PNS", "196506221991032004", "WAHYU RAHAYUNI, SH", "196506221991032004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(73, "PNS", "197410311999032001", "SONDANG MAWATI INDRIANA BUTAR - BUTAR, S.ST, M.Kes", "197410311999032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(74, "PNS", "196911162002122001", "dr. PARULIAN SANDY NOVERIA, MKK", "196911162002122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(75, "PNS", "197906092008012019", "dr. YUNE LAUKATI", "197906092008012019", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(76, "PNS", "197802232002122002", "LAILI MAHMUDAH, S.Kp", "197802232002122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(77, "PNS", "198602102008012001", "DIAH FATMAWATI, AM.Keb", "198602102008012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(78, "PNS", "198202282012122001", "dr. MARISSA FEBIYANI SETIONO", "198202282012122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(79, "PNS", "198312302014022001", "UMBAR KUATININGSIH, Amd", "198312302014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(80, "PNS", "196607121989032001", "CAROLINA, S.Kep, Ners, M.Kep", "196607121989032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(81, "PNS", "198108272008012011", "dr. FRISKA AGNOVITA", "198108272008012011", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(82, "PNS", "198309062006042003", "DIAH ASRINA PUTRI, SKM", "198309062006042003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(83, "PNS", "198211172010122002", "ENDAH TRI LESTARI, M.Psi, Psikolog", "198211172010122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(84, "PNS", "197301231997032001", "MUHAJIRAH ANNISAI, M.Psi.Psikolog", "197301231997032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(85, "PNS", "198102172009122001", "HERNITA WIJAYARATNA, M.Psi, Psikolog", "198102172009122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(86, "PNS", "196606181994031003", "UJANG ASEP MAWARDI", "196606181994031003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(87, "PNS", "199406192022032001", "SILVIANI", "199406192022032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(88, "PNS", "198412162018012001", "dr. ANANDITYA SUKMA DEWI UTAMI, Sp.KJ", "198412162018012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(89, "PNS", "198106072008122001", "Ns. JUNITA LASMA, S.Kep", "198106072008122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(90, "PNS", "196606121989031002", "SOFYAN, AMK ", "196606121989031002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(91, "PNS", "196511201988031001", "PARDOMUAN SIMANJUNTAK", "196511201988031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(92, "PNS", "197307041998032002", "ROLENTA SIDABUTAR, S.Ft", "197307041998032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(93, "PNS", "198508032010121003", "DWI BIMANTORO, Amd.OT", "198508032010121003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(94, "PNS", "198511072018011001", "MUHAMMAD BAYU SATRIA, AMK", "198511072018011001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(95, "PNS", "198510102009121001", "LUKITO LUHUR WASKITO, AKFIS", "198510102009121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(96, "PNS", "199205042020121005", "AZRUL ARDIANSYAH, SST", "199205042020121005", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(97, "PNS", "199801182022032001", "DYAH NUR KHASANAH", "199801182022032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(98, "PNS", "196901261993032001", "TRI SUSILOWATI", "196901261993032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(99, "PNS", "196812291995031001", "CHERUDIN, S.Psi", "196812291995031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(100, "PNS", "196610052002121004", "dr. H. MUH DANIAL UMAR, Sp.KJ., M.Kes", "196610052002121004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(101, "PNS", "197707062006042001", "ENDAH SUDARWATI, SKM", "197707062006042001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(102, "PNS", "196609011991032003", "ROSWITA ERNAWATI SITOMPUL, SKM", "196609011991032003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(103, "PNS", "197710282005011002", "JOSUA OTTO LAMORA PASARIBU, SKM", "197710282005011002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(104, "PNS", "197512202002121003", "AGUS PRIYANTO, SKM", "197512202002121003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(105, "PNS", "197207271991031001", "HERI YULIANTO MUNAHADI, SE,MM", "197207271991031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(106, "PNS", "196704251999032003", "Dr. dr. SUZY YUSNA DEWI, Sp.KJ (K)., MARS", "196704251999032003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(107, "PNS", "197402022014122001", "dr. ENY FEBRIANI, Sp.A", "197402022014122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(108, "PNS", "197508251999032001", "Ns. DYAH AGUS TRIWIDYANSARI, S.Kep", "197508251999032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(109, "PNS", "198206042008012018", "Ns. ROFIAH, S.Kep", "198206042008012018", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(110, "PNS", "196509181987032001", "NITARINI SUPRIATIN, S.Kep", "196509181987032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(111, "PNS", "198206062006042033", "BANI SABANIAH, AMK", "198206062006042033", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(112, "PNS", "197711152006042010", "SUSILAWATI, AMK", "197711152006042010", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(113, "PNS", "197812232001122001", "Ns. JUNI DARMAWANTI, S.Kep", "197812232001122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(114, "PNS", "198111102006041014", "MOHAMAD ANDI, S.Kep", "198111102006041014", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(115, "PNS", "197506152009121001", "RUDIYANTO, S.FT", "197506152009121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(116, "PNS", "196903291990032001", "ROSIANA", "196903291990032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(117, "PNS", "197811242010122001", "LILIES SYACHDIANTIE, AKFIS", "197811242010122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(118, "PNS", "197901102010122001", "RIRIN CHAERUL JANAH, Amd.OT", "197901102010122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(119, "PNS", "198008062014022001", "SUSI AGUSTIN, Amd.OT", "198008062014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(120, "PNS", "199111182015032002", "NOVI LISTIANI, Amd.OT", "199111182015032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(121, "PNS", "198706182010122005", "YUNI ANDREASIH, Amd.TW", "198706182010122005", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(122, "PNS", "199104072020122004", "VIVI RAHMADHANI", "199104072020122004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(123, "PNS", "199701192020122005", "TITIS HARDIAN WIJAYA", "199701192020122005", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(124, "PNS", "196709291987032001", "JATY SUPRIJATI, S.Kep, Ners ", "196709291987032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(125, "PNS", "196605231992031002", "MAIZAR ", "196605231992031002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(126, "PNS", "197012192005012009", "dr. ISMOYOWATI PUTRI UTAMI, Sp.KJ", "197012192005012009", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(127, "PNS", "198104052008012017", "YULINDA, S.Kep, Ners", "198104052008012017", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(128, "PNS", "196502041989032002", "DEDE ROSTINI, S.Kep", "196502041989032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(129, "PNS", "198302022012122001", "ANDRIANI, AMK", "198302022012122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(130, "PNS", "198504242008011002", "ABDUL LATIEF, AMK", "198504242008011002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(131, "PNS", "198808082009122001", "PUTRI KUSUMAWATI, AMK", "198808082009122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(132, "PNS", "196412061993032003", "drg. HUGANDINI", "196412061993032003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(133, "PNS", "198203012006042002", "PUJI ASTUTI, AMKG", "198203012006042002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(134, "PNS", "199206072014022002", "ARYSNA ANGGERRINI SUNARIYO, AMKG", "199206072014022002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(135, "PNS", "198311242019021001", "dr. WIBOWO PANDAPOTAN SARAGIH", "198311242019021001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(136, "PNS", "197711082000032001", "Ns. LOLY HERAWATI, S.Kep", "197711082000032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(137, "PNS", "197611092010121001", "HARTANTO, AMK", "197611092010121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(138, "PNS", "199111292014022001", "WENDY ATIKA WIJAYANTI, AMK", "199111292014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(139, "PNS", "198812012012122002", "DEWI SUSANTI, AMK", "198812012012122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(140, "PNS", "197910152012122002", "Rahmawati, AMK", "197910152012122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(141, "PNS", "199112152018012001", "ADE PUTRI PRANOWO, AMK", "199112152018012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(142, "PNS", "198707122009122001", "Ns. EVI KURNIAWATI, S.Kep", "198707122009122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(143, "PNS", "199003182022032004", "CYERILIA VITAENDAHASTIWI", "199003182022032004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(144, "PNS", "198705282008122003", "INES TESIAWATY RANUM, AMK", "198705282008122003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(145, "PNS", "198001302014021001", "KUSWANTO, AMK", "198001302014021001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(146, "PNS", "199104152015031001", "FAIZIN, AMK", "199104152015031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(147, "PNS", "197707062008121002", "SOPRI, AMK", "197707062008121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(148, "PNS", "198801222014021002", "ANDRE WIDYAWAN ERLANGGA, AMK", "198801222014021002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(149, "PNS", "197710282008121001", "ZAKARIA ACHMAD, S.Kep., Ners", "197710282008121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(150, "PNS", "198101242008121001", "Ns. WAHYUDIN, S.Kep", "198101242008121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(151, "PNS", "198312042010122001", "SUSMIYATI, AMK", "198312042010122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(152, "PNS", "198604012009121003", "GIAN ARIESANDI, AMK", "198604012009121003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(153, "PNS", "198010282006042015", "RINA DAMAYANTI LUMBANTORUAN, AMK", "198010282006042015", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(154, "PNS", "198301092018011001", "ASEP AZIZ SIDIK, AMK", "198301092018011001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(155, "PNS", "199111192014022001", "SITI RETNO WULANDARI, AMK", "199111192014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(156, "PNS", "198205062008122003", "dr. NURADDIYANI HIDAYAH, Sp.P.K", "198205062008122003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(157, "PNS", "197203071997032001", "SRI SUHARJATI, S.ST", "197203071997032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(158, "PNS", "198403192006042001", "PURNAMASARI FAZAILA, AMd", "198403192006042001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(159, "PNS", "199204142015032001", "ALFINA AMARINI, AMd", "199204142015032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(160, "PNS", "199208062015032001", "FANNY NOVITA SARI, AMd", "199208062015032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(161, "PNS", "199111272014022001", "IKA NURYANTI, AMd", "199111272014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(162, "PNS", "199305282018011001", "KELLIK FAHRIYANTO, AMd", "199305282018011001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(163, "PNS", "199607052022031002", "MUHAMMAD GALIH NUGROHO", "199607052022031002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(164, "PNS", "199602152022032005", "ADISA NINDI AYU PURWASIH", "199602152022032005", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(165, "PNS", "199403092022031001", "RIZKY AMBAR TRIHUTOMO", "199403092022031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(166, "PNS", "199906012022032001", "ANISA TRI HANDAYANI", "199906012022032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(167, "PNS", "197811022005012005", "INDAH NOVIANA, S.Si.T", "197811022005012005", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(168, "PNS", "198311152009122001", "DWIARTI TUNGGA DEWI, S.Gz", "198311152009122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(169, "PNS", "196807081991032001", "SUHARTI", "196807081991032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(170, "PNS", "197106171998032001", "KHUSNUL KHOTIMAH, AMG", "197106171998032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(171, "PNS", "197604062005012002", "KUSNANI PRIHARDIATI, AMG", "197604062005012002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(172, "PNS", "197102232008121001", "RACHWAN EFFENDI", "197102232008121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(173, "PNS", "196802072007011031", "NUR YAMAN", "196802072007011031", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(174, "PNS", "197210141997032001", "MARICE TAMPUBOLON, S.ST", "197210141997032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(175, "PNS", "197509231994021001", "MUHAMAD BUDIMAN, Amd,Rad", "197509231994021001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(176, "PNS", "197702181999032002", "JUHRIAH, S.ST", "197702181999032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(177, "PNS", "199211082015032001", "DIANI NOVIYANTI, Amd.Rad", "199211082015032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(178, "PNS", "199305132022032002", "ATIK MULYANAH", "199305132022032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(179, "PNS", "199306242022031001", "LALU IRFANI JUNIARTA", "199306242022031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(180, "PNS", "197811282009122001", "dr. EKA CANDRA SASMITA PUTRI, Sp.S", "197811282009122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(181, "PNS", "198812172018011001", "Ns. NISWANTO, S.Kep", "198812172018011001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(182, "PNS", "196401201991032003", "ROSMALEM, S.Kep", "196401201991032003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(183, "PNS", "197310151995031002", "Ns. BACHTIAR SIAHAAN, S.Kep", "197310151995031002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(184, "PNS", "199002222018011001", "MIFTACHUL MUJAHID, AMK", "199002222018011001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(185, "PNS", "197805172005012006", "USTITA HANUM DELIAN, S.ST", "197805172005012006", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(186, "PNS", "197710012005012002", "IKA DAMAYANTI, S.ST", "197710012005012002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(187, "PNS", "199201152018011001", "AGUNG WAHYUDI,Amd", "199201152018011001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(188, "PNS", "196911031992032001", "RUSTI WINARNI, S.Si.Apt", "196911031992032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(189, "PNS", "196307151989032002", "Dra. SURIYATI HUTAURUK, S.Si.Apt", "196307151989032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(190, "PNS", "197112061997032002", "THIN MARDIAH, S.Si.Apt", "197112061997032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(191, "PNS", "196808251997032001", "AWALATUNI, Amd.Farm", "196808251997032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(192, "PNS", "197601281999032001", "ELIBUN NATIO SAGALA, Amd.Far", "197601281999032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(193, "PNS", "198301072014022001", "YUSNITA, S.Si.Apt  ", "198301072014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(194, "PNS", "199204292018012001", "FREYDA MONICA SIMBOLON, S.Si.Apt", "199204292018012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(195, "PNS", "198710182008121001", "AGUNG NUGROHO EDDY SULISTYO, S.Farm, Apt", "198710182008121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(196, "PNS", "197611132010122001", "RHINE R. NORITA SITINJAK, Amd.Far", "197611132010122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(197, "PNS", "198808162010122001", "DEVI AGUSTIYANI, Amd.Far", "198808162010122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(198, "PNS", "198510262009121001", "WAHYU BUDI PRASTIO, Amd.Far", "198510262009121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(199, "PNS", "199210012014022001", "OKTAVIA ANGGRAINY, Amd.Far", "199210012014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(200, "PNS", "199207182014022001", "ANNISA JULITA SARI, Amd.Far", "199207182014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(201, "PNS", "199006302015032001", "DIAH EKOWATI UTAMI, Amd.Far", "199006302015032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(202, "PNS", "196803132007011049", "SUTIRWAN", "196803132007011049", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(203, "PNS", "199505212018012001", "HERWIDHIYA AZIZAH, Amd.Far", "199505212018012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(204, "PNS", "199309082020122015", "SARTIKA HUTAGAOL, Amd.Farm", "199309082020122015", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(205, "PNS", "198910142022032001", "Apt WIWIN LIDYA, S.Farm", "198910142022032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(206, "PNS", "199402022022032002", "ARDINI ROBIYANTI", "199402022022032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(207, "PNS", "199503292022032001", "VIRDA THERESA SITORUS", "199503292022032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(208, "PNS", "198407252010122002", "IFAH MUZDALIFAH, Amd", "198407252010122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(209, "PNS", "196710061991032002", "SAMIYATI", "196710061991032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(210, "PNS", "197303261994031001", "ISNEN MARJUKI", "197303261994031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(211, "PNS", "198103012010122002", "PIPIT LINDASARI, S.ST", "198103012010122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(212, "PNS", "198312222010121002", "DEDDY ABDUL HADI, Amd", "198312222010121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(213, "PNS", "198505022010121004", "ROBI ANDIKA, Amd", "198505022010121004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(214, "PNS", "199209072014022001", "SHUCI UTARI NURMAULIDA, Amd", "199209072014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(215, "PNS", "198401012015032001", "YUNINGSIH, Amd", "198401012015032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(216, "PNS", "199207202015032001", "RISHA WULANSARI, Amd", "199207202015032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(217, "PNS", "199206102018012001", "NURUL ARFIANTI, Amd", "199206102018012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(218, "PNS", "199802012020121002", "FITRA ANGGA PRATAMA", "199802012020121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(219, "PNS", "199708182020122004", "METI ANNISA", "199708182020122004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(220, "PNS", "199104092020122003", "APRILIA INDRA CAHYA", "199104092020122003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(221, "PNS", "196507122000031001", "dr. ASRUL MUHADI, Sp.B", "196507122000031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(222, "PNS", "196506012008012008", "dr. SAFYUNI NASWATI SAHUPALA, Sp.KJ", "196506012008012008", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(223, "PNS", "197201132002121002", "dr. ADHI WIBOWO N, SpKJ, MPH", "197201132002121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(224, "PNS", "19750726200604107", "dr. BUDI YUWONO, Sp.PD", "19750726200604107", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(225, "PNS", "198205052014121002", "dr. WILLY STEVEN, SpKJ", "198205052014121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(226, "PNS", "198202202014122006", "dr. ARUNDHANTI NUGRAHANING AJI, SpKJ", "198202202014122006", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(227, "PNS", "197309152014122001", "dr. SAVITRI WULANDARI, SpKJ", "197309152014122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(228, "PNS", "196704212014121002", "dr. SALIKUR KARTONO, M.Biomed., Sp.KJ", "196704212014121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(229, "PNS", "197207212002122007", "dr. NURINDAH KADIR, Sp.KJ", "197207212002122007", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(230, "PNS", "197512052009121002", "dr. ISA MULTAZAM NOOR, Sp.KJ (K)", "197512052009121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(231, "PNS", "198504302012121002", "dr. HANDRY CARLOS GUNAWAN", "198504302012121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(232, "PNS", "199107202018011001", "dr. ADIBA KARLEN", "199107202018011001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(233, "PNS", "199101162019032008", "dr. VICKY VICTORINE PERSIA WARDENAAR", "199101162019032008", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(234, "PNS", "199603112022031003", "dr. GIVARY DYMAR LAZUARDI", "199603112022031003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(235, "PNS", "199302032022032004", "dr. TRY FEBRIANI SIREGAR", "199302032022032004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(236, "PNS", "196602131989032002", "Ns. SORITA BR SURBAKTI, S.Kep", "196602131989032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(237, "PNS", "196710201988032001", "Ns. LILIS ISTRIANI, S.Kep", "196710201988032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(238, "PNS", "196811201990032003", "Ns. NURITA TUMANGGER, S.Kep", "196811201990032003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(239, "PNS", "197607172000032002", "TRI YULI HERAWATI, S.Kep, Ners", "197607172000032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(240, "PNS", "198307192005012001", "SHINTA DEWI, AMK", "198307192005012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(241, "PNS", "197912192009121002", "SUPRIYADI, AMK", "197912192009121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(242, "PNS", "199210142019022001", "OKTI HANALUTFI KHAIRIYAH, S.Kep, Ners", "199210142019022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(243, "PNS", "198310182008012007", "INA RUFIANA, AMK", "198310182008012007", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(244, "PNS", "198712222008121001", "Ns. INDRA MAULANA SANI, S.Kep", "198712222008121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(245, "PNS", "198306302008011011", "AGUNG LAKSONO, AMK", "198306302008011011", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(246, "PNS", "197903282005012002", "REHULINA Br SEMBIRING, AMK", "197903282005012002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(247, "PNS", "198010282006042015", "RETNO PAWISTIYATUN, AMK", "198010282006042015", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(248, "PNS", "197904052002122002", "DIAN SETIAWANING ENDARTI, AMK", "197904052002122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(249, "PNS", "197405122000032001", "SUHARTINI, AMK", "197405122000032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(250, "PNS", "198310232008012008", "RAHMI RAHARDIANSARI, AMK", "198310232008012008", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(251, "PNS", "198004272006042012", "APRIANA NONA LINGGU, S.Kep", "198004272006042012", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(252, "PNS", "198110242006041007", "Ns. DARMOKO, S.Kep", "198110242006041007", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(253, "PNS", "198310162012122001", "IIN THERAWATI NUGRAHENI, AMK", "198310162012122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(254, "PNS", "199510202018012001", "VERA EVI ANTARA, AMK", "199510202018012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(255, "PNS", "198507222009122002", "Ns. SRI SURYANTI, S.Kep", "198507222009122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(256, "PNS", "196610091987032001", "Ns. DEDEH NUROR BANI ADRIAN, S.Kep", "196610091987032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(257, "PNS", "199708142022031001", "ALDILA PANDU KARTIKO", "199708142022031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(258, "PNS", "199204282022031001", "CHANDRA PRIAN PRATAMA", "199204282022031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(259, "PNS", "197507012005012002", "JUJU, AMK", "197507012005012002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(260, "PNS", "198011132005012004", "Ns. NUNI NURAFNI, S.Kep", "198011132005012004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(261, "PNS", "199212192019022002", "Ns. GADIS MADADETA SM, S.Kep", "199212192019022002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(262, "PNS", "198804262020122006", "GITA KERINA TARIGAN,S.Kep., Ns", "198804262020122006", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(263, "PNS", "198001282006042001", "Ns. MOLIDDIA PRIHATINNIA SUSKA, S.Kep", "198001282006042001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(264, "PNS", "197801152002122004", "LINDAMORA RITONGA, AMK", "197801152002122004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(265, "PNS", "198401282010122002", "INDRIANI ENDAH MITASARI, AMK", "198401282010122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(266, "PNS", "199301272022032003", "GANDA NUR PATMA SUPROBO", "199301272022032003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(267, "PNS", "198801082022031001", "SITI ZULAEHA", "198801082022031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(268, "PNS", "199703072022032004", "RETNO PUJIANA", "199703072022032004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(269, "PNS", "197001021997031003", "SURANTO, S.Kep", "197001021997031003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(270, "PNS", "196811221990032001", "Ns. ERNI NURHAYATI, S.Kep", "196811221990032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(271, "PNS", "197710172006042002", "Ns. ADRIANA LUBIS, S.Kep", "197710172006042002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(272, "PNS", "196807181989032002", "Ns. T. LUKERTINA TAMBUNAN, S.Kep", "196807181989032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(273, "PNS", "199508112018011001", "MAULANA YUDHI NURDHYAS, AMK", "199508112018011001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(274, "PNS", "199601082018012001", "SITI NURJANNAH, AMK", "199601082018012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(275, "PNS", "199311122022032002", "NOVEL SUMENDA TAKALALUMANG", "199311122022032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(276, "PNS", "198808282014022001", "LIN MARLINA, AMK", "198808282014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(277, "PNS", "199202192019022001", "FYANTIAS RENIESTY PISCELIA, S.Kep, Ners", "199202192019022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(278, "PNS", "198004012012121001", "R ARIEF AWALLUDIN. AMK", "198004012012121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(279, "PNS", "199308092022032001", "RISTY AMBARWATI", "199308092022032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(280, "PNS", "197711302005012003", "Ns. DIANA NOMIARSIH, S.Kep", "197711302005012003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(281, "PNS", "196712311987032002", "Ns. NORMAL BR KARO, S.Kep", "196712311987032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(282, "PNS", "197711192001121001", "TRI DONO AJI SASMITO, AMK", "197711192001121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(283, "PNS", "199312242018011001", "Ns. BAKHTIAR NUR ABDILAH, S.Kep", "199312242018011001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(284, "PNS", "197508101999032001", "NETTY HERAWATY, AMK", "197508101999032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(285, "PNS", "199004142014022001", "LILIS KOMALASARI, AMK", "199004142014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(286, "PNS", "198403232008122003", "ROSIE MARDINAH, AMK", "198403232008122003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(287, "PNS", "198008112006041004", "YAYAN RIYANTO, AMK ", "198008112006041004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(288, "PNS", "199704122022032004", "DEVI MUTIARASANDY", "199704122022032004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(289, "PNS", "198311202009122001", "Ns. WIWIT KURNIASIH, S.Kep", "198311202009122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(290, "PNS", "197702211999031001", "Ns. AHMAD QAFRAWI, S.Kep", "197702211999031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(291, "PNS", "197508081997031005", "Ns. ADLAN BADUWI, S.Kep", "197508081997031005", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(292, "PNS", "197402122006042002", "ANNY ROYANA TAMBUNAN, S.Kep., Ns", "197402122006042002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(293, "PNS", "196906201993032001", "HOTIBAH, AMK", "196906201993032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(294, "PNS", "197604281998032001", "TETTY SIRAIT, AMK", "197604281998032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(295, "PNS", "198808022012122001", "SRI PUJI ASTUTI, AMK", "198808022012122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(296, "PNS", "199811202022032003", "SHINTA RIZKI WULANDARI", "199811202022032003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(297, "PNS", "196805121988022001", "Ns. ERNI ERNAWATI, S.Kep", "196805121988022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(298, "PNS", "196805031988022001", "Ns. ANNA ELFAH SURI, S.Kep", "196805031988022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(299, "PNS", "198802152019022001", "Ns. ALVINDA KURNIA DEWI, S.Kep", "198802152019022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(300, "PNS", "198206062009122004", "YUNI DWI RAHARDIYATI, AMK", "198206062009122004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(301, "PNS", "197710262009022002", "MAGDALENA VERITA INTAN MANIK, AMK", "197710262009022002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(302, "PNS", "198208212008122001", "YAN LORENSA SAGALA, AMK", "198208212008122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(303, "PNS", "198505082014022001", "RATNA CATUR SETYANINGSIH, AMK", "198505082014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(304, "PNS", "197603071997032001", "SURYANAH, A.Md.Kep", "197603071997032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(305, "PNS", "199107112020122006", "FITRIA YULIANTI, AmdKep", "199107112020122006", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(306, "PNS", "198804092008122001", "FAJAR APRILIANA DEWI, S.Kep", "198804092008122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(307, "PNS", "197909182005012001", "ERNAWATI, AMK", "197909182005012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(308, "PNS", "199407062022032001", "DIAN ANGGRAINI", "199407062022032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(309, "PNS", "197807112005012002", "SRI MULYANI, S.Kep, Ners", "197807112005012002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(310, "PNS", "197812232000032001", "Ns. RINA SOGIRIN TRISNAWATI, S.Kep", "197812232000032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(311, "PNS", "198211192009122002", "TRI WAHYUNI, AMK", "198211192009122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(312, "PNS", "198002112006042007", "RISTIN RATI YULIANA, S.Kep", "198002112006042007", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(313, "PNS", "197508222002122003", "PAWIT CAHYATI, AMK", "197508222002122003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(314, "PNS", "197611151999031004", "M. NURSYAH FAHLEVY, AMK", "197611151999031004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(315, "PNS", "197709092009121001", "BAGIYO, AMK", "197709092009121001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(316, "PNS", "198412032008011005", "ARDHY NUGROHO, AMK", "198412032008011005", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(317, "PNS", "198206142006041012", "ERICK ABDUL RAHMAN BUDIMAN, AMK", "198206142006041012", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(318, "PNS", "197308172001121006", "TASAM, AMK", "197308172001121006", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(319, "PNS", "198207052006042003", "SRI LESTARI, AMK", "198207052006042003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(320, "PNS", "198307312005012001", "PUTRI SUCI KRISTANTI, AMK", "198307312005012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(321, "PNS", "198010122006041004", "Ns. FAHRUDIN, S.Kep", "198010122006041004", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(322, "PNS", "199405032020122008", "MILKA MARAMBA, S.Kep.,Ns.", "199405032020122008", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(323, "PNS", "199106162018012001", "Ns. MELVA YUSTRIANA SUKMA P, S.Kep", "199106162018012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(324, "PNS", "198012022008012014", "SITI MUSRIFAH, AMK", "198012022008012014", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(325, "PNS", "198307222014022001", "NURUL HIDAYAH, AMK", "198307222014022001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(326, "PNS", "199102072014021001", "DENDI SUPRIYADI, AMK", "199102072014021001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(327, "PNS", "199506272018012001", "YUNITA SOFIANA LATIFAH, AMK", "199506272018012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(328, "PNS", "198703032020121002", "MUHAMMAD FAJAR HIDAYAT, AmdKep", "198703032020121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(329, "PNS", "198706172008122003", "SRI SUGIARTI, AMK", "198706172008122003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(330, "PNS", "198707182022031001", "YUDHI SUKMAYA, AMK", "198707182022031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(331, "PNS", "199503192022032002", "YUMNI FARHAH", "199503192022032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(332, "PNS", "199512152022032007", "LISNIA DWI SAHARANINGRUM", "199512152022032007", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(333, "PNS", "196705201994032002", "Ns. MERI SIMANJUNTAK, S.Kep", "196705201994032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(334, "PNS", "196708101998032001", "Ns. HERLINA PASARIBU, S.Kep", "196708101998032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(335, "PNS", "197010161998032001", "Ns. DWI PUTRI NISFUROCHMAH, S.Kep", "197010161998032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(336, "PNS", "198011262008121002", "Ns. CEPI JAPAR SIDIK, S.Kep", "198011262008121002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(337, "PNS", "198406132010122002", "LIAN PURNAMA SARI, S.Kep., Ns", "198406132010122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(338, "PNS", "199009042015031001", "MUHAMAD DZULFAN HALIL, AMK", "199009042015031001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(339, "PNS", "196906201993032001", "ERNI SIMANJUNTAK, AMK", "196906201993032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(340, "PNS", "199706282020122006", "ALIFA RETNO ASTRIANI, AmdKep", "199706282020122006", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(341, "PNS", "198302022012122001", "RATNA WIJAYANTI, AMK", "198302022012122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(342, "PNS", "198401152012122001", "TRISNANINGSIH, AMK", "198401152012122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(343, "PNS", "198210142008122002", "Ns. IRMA SOFIANI KUSMARA, S.Kep", "198210142008122002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(344, "PNS", "196805171992032002", "Ns. HERNAWATI, S.Kep", "196805171992032002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(345, "PNS", "199309232022032006", "AYU SEPTIANI", "199309232022032006", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(346, "PNS", "197909302008011011", "ASEP SETIADI, AMK", "197909302008011011", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(347, "PNS", "198201052008122001", "Ns. ELLYA FADLLAH, S.Kep", "198201052008122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(348, "PNS", "196803221994032003", "Ns. SRI SUGIATUN, S.Kep", "196803221994032003", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(349, "PNS", "196507091990031002", "SULISTIONO", "196507091990031002", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(350, "PNS", "196601031992031006", "MORING SUMOLANG, S.Sos", "196601031992031006", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(351, "PNS", "198401222009122001", "RATIH PUSPITA KUSUMAYANTI, AMK", "198401222009122001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(352, "PNS", "199001292018012001", "LINTANG KUSUMANING HANAR, AMK", "199001292018012001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(353, "NONPNS", "919640903201001101", "SUTISNA PRIYATNA", "919640903201001101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(354, "NONPNS", "919661019200902201", "SITI RODIAH", "919661019200902201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(355, "NONPNS", "919671211200902201", "SURIP SUMARTI", "919671211200902201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(356, "NONPNS", "919690901200901101", "M. ZAENUDIN", "919690901200901101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(357, "NONPNS", "919720427201803201", "TITI MULYANI", "919720427201803201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(358, "NONPNS", "919730325201609201", "ARNITA SARI", "919730325201609201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(359, "NONPNS", "919740609200905101", "M. ABDUL RAHMAN", "919740609200905101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(360, "NONPNS", "919751003200901201", "HARIYATI", "919751003200901201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(361, "NONPNS", "919751207201001101", "ARIA CANDRA KELANA", "919751207201001101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(362, "NONPNS", "919760929201005101", "STEVAN IMANUEL", "919760929201005101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(363, "NONPNS", "919770818200805101", "SUPRIYATNO", "919770818200805101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(364, "NONPNS", "919771212200905101", "AHMAD MUKAROM", "919771212200905101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(365, "NONPNS", "919781101201101201", "EVI NOVIYANTI", "919781101201101201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(366, "NONPNS", "919781227201101201", "NURBAETI SHOLEHAH", "919781227201101201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(367, "NONPNS", "919790715201001201", "LAELAH SARIAH", "919790715201001201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(368, "NONPNS", "919800327201410101", "ROKY SAPUTRA", "919800327201410101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(369, "NONPNS", "919810418200902101", "SELAMET", "919810418200902101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(370, "NONPNS", "919820107201211201", "GUSTI AYU AMBARWATI", "919820107201211201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(371, "NONPNS", "919820427202207101", "DEA RYANGGA", "919820427202207101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(372, "NONPNS", "919820817201604201", "AGUSTINA HARDANDINI MERDIKA", "919820817201604201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(373, "NONPNS", "919820928202205101", "SUHARPUDIANTO", "919820928202205101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(374, "NONPNS", "919830311201501101", "SAHRUL ARIPIN", "919830311201501101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(375, "NONPNS", "919830402201001101", "ASAM SYAMSUDIN", "919830402201001101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(376, "NONPNS", "919830508201001201", "SUJIYATI", "919830508201001201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(377, "NONPNS", "919831021200901101", "WIBOWO DWI PRASETYO", "919831021200901101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(378, "NONPNS", "919840505201201101", "EROLMAN", "919840505201201101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(379, "NONPNS", "919841020201001101", "JAKA RANTAU PARAPAT", "919841020201001101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(380, "NONPNS", "919850711202105101", "MAULANA", "919850711202105101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(381, "NONPNS", "919850719201310101", "JULIANTO", "919850719201310101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(382, "NONPNS", "919850913201001101", "BAMBANG TRI SAPUTRO", "919850913201001101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(383, "NONPNS", "919851218201707101", "BUDHI PRASETYO", "919851218201707101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(384, "NONPNS", "919860214200905101", "ANGGA HIDAYAT", "919860214200905101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(385, "NONPNS", "919860616201706201", "UQI ZULFA RIZQIYAH", "919860616201706201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(386, "NONPNS", "919860925201001101", "HERI DWI SEPTIONO", "919860925201001101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(387, "NONPNS", "919870316201803101", "RIAN FAJRIAN, S.KOM", "919870316201803101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(388, "NONPNS", "919870509201909101", "DEDY MURDIANTORO", "919870509201909101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(389, "NONPNS", "919870621201306101", "YUNIARTO SETIADI", "919870621201306101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(390, "NONPNS", "919870728202105101", "BAYU JULIAN RENDRA", "919870728202105101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(391, "NONPNS", "919880111201001101", "DARSONO", "919880111201001101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(392, "NONPNS", "919880330202105201", "RETNO PRATIWI", "919880330202105201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(393, "NONPNS", "919880407202101101", "HERI HIDAYAT", "919880407202101101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(394, "NONPNS", "919880424201604201", "APRILIA", "919880424201604201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(395, "NONPNS", "919880629201608101", "TEDI YOGI YONO", "919880629201608101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(396, "NONPNS", "919880707201707101", "DWI YULIANDRY", "919880707201707101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(397, "NONPNS", "919881114201304101", "MASRUKHIN JIRJIS", "919881114201304101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(398, "NONPNS", "919881124201301101", "HERI KUSUMA", "919881124201301101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(399, "NONPNS", "919890127200902201", "LIA NUR AINI", "919890127200902201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(400, "NONPNS", "919890217201101201", "DWI INDRI WIDYANINGSIH", "919890217201101201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(401, "NONPNS", "919890501201802201", "PENNI ERMAWATI", "919890501201802201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(402, "NONPNS", "919890909201706101", "RONI ANTONI", "919890909201706101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(403, "NONPNS", "919891219201706201", "MEILINDA DWI ASTUTI", "919891219201706201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(404, "NONPNS", "919900131201803201", "RAHMY QUDSIA", "919900131201803201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(405, "NONPNS", "919900505201803101", "AHMAD MAJID", "919900505201803101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(406, "NONPNS", "919900828201706201", "LEO GUSTA INDRAJIT", "919900828201706201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(407, "NONPNS", "919900922201601101", "ADITYA EKO NUGROHO", "919900922201601101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(408, "NONPNS", "919910119202105101", "ARIQ AZIZ", "919910119202105101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(409, "NONPNS", "919910207202110201", "RR LUSTYWULAN AYUCAHYANI SUKMA HIDAYAT", "919910207202110201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(410, "NONPNS", "919910222201911101", "RIVALDIANSYAH", "919910222201911101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(411, "NONPNS", "919910305201901201", "MENIK SETYANINGSIH", "919910305201901201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(412, "NONPNS", "919910518201203101", "DADDY YANSURI", "919910518201203101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(413, "NONPNS", "919910712202101101", "IRIANTO WIBOWO", "919910712202101101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(414, "NONPNS", "919910802202101101", "ANGGA RIYANA SAPUTRA", "919910802202101101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(415, "NONPNS", "919911210201501201", "IRHINEU DWI WAHYU PRATIWI", "919911210201501201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(416, "NONPNS", "919920101201712201", "FANI FITRIANI WINDY ASTUTI", "919920101201712201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(417, "NONPNS", "919920401201607201", "MAYA RIANTI", "919920401201607201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(418, "NONPNS", "919920628201601101", "DHIKY TEGUH PRASETYO", "919920628201601101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(419, "NONPNS", "919920806201605201", "AISAH MAMANG", "919920806201605201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(420, "NONPNS", "919920929201910201", "SABILA DINILHAQ", "919920929201910201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(421, "NONPNS", "919930105201601101", "AFIF FATHUL KODIR", "919930105201601101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(422, "NONPNS", "919930728201803201", "VIVI LATIFAH", "919930728201803201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(423, "NONPNS", "919931013202010101", "WAHYUDI", "919931013202010101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(424, "NONPNS", "919931129201908101", "LUBIS", "919931129201908101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(425, "NONPNS", "919931223201910101", "RANDY ABDUL GANI", "919931223201910101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(426, "NONPNS", "919940110201708201", "ISRA MAHARANI DWIASNITA", "919940110201708201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(427, "NONPNS", "919940302201608101", "M. REZA PAHLEVI", "919940302201608101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(428, "NONPNS", "919940302201910101", "ERIFA MAHFUDZ MUDSANA NUR", "919940302201910101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(429, "NONPNS", "919940805202101201", "ENDAH PRADANI", "919940805202101201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(430, "NONPNS", "919941115201608101", "FARIZ DWI PERMANA", "919941115201608101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(431, "NONPNS", "919941128202110101", "WILDAN FAUZI", "919941128202110101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(432, "NONPNS", "919941207202106201", "HERMANITA", "919941207202106201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(433, "NONPNS", "919941211202207201", "DEVINA SAGITANIA", "919941211202207201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(434, "NONPNS", "919941212201801101", "MUHAMAD FAHMI", "919941212201801101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(435, "NONPNS", "919941227201912201", "NIKEN CAHYANTI", "919941227201912201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(436, "NONPNS", "919950225202106201", "ATIKA RINDA SALEH", "919950225202106201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(437, "NONPNS", "919950324201703101", "HANDY SURIYANSYAH", "919950324201703101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(438, "NONPNS", "919950509201910201", "KANA ADYA ISLAMI", "919950509201910201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(439, "NONPNS", "919950608202105201", "NIDIA JUNITA SARI", "919950608202105201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(440, "NONPNS", "919950619202101101", "MUHAMMAD ERWANDI SAPUTRA", "919950619202101101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(441, "NONPNS", "919950711202105101", "MUHAMMAD FAKHRI RAFIF", "919950711202105101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(442, "NONPNS", "919951001202110101", "OKTA CHANDRA PRASAKTI", "919951001202110101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(443, "NONPNS", "919951221201907201", "DESI NURMALA SARI", "919951221201907201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(444, "NONPNS", "919960314201912101", "FAUZI", "919960314201912101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(445, "NONPNS", "919960403202110201", "ARESTIANING PUTRI", "919960403202110201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(446, "NONPNS", "919961010202105101", "RISKI WAHYU KURNIAWAN", "919961010202105101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(447, "NONPNS", "919961014201907201", "DEWI OCTAVIANA CAISARA", "919961014201907201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(448, "NONPNS", "919961019202001201", "IQLIMA NABILA", "919961019202001201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(449, "NONPNS", "919970110202110101", "AGIS RAMDAN", "919970110202110101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(450, "NONPNS", "919970319202201101", "SOBRUN JAMIL", "919970319202201101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(451, "NONPNS", "919970522201912201", "ALFY DANIYATI ROHMAH", "919970522201912201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(452, "NONPNS", "919971106202101201", "ALMATRIA", "919971106202101201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(453, "NONPNS", "919980311202101201", "VANNYA REFYTA", "919980311202101201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(454, "NONPNS", "919980312202105101", "HAFIZ MARDIANSYAH", "919980312202105101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(455, "NONPNS", "919980425202101201", "DADIES APRILYA REDISTA", "919980425202101201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(456, "NONPNS", "919980608202101202", "YESI ARISNI", "919980608202101202", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(457, "NONPNS", "919980614202110101", "GUSTI FIRDAUS", "919980614202110101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(458, "NONPNS", "919981125202110201", "NUR AYNA ANGKAT", "919981125202110201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(459, "NONPNS", "919981223202105201", "MONIKA", "919981223202105201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(460, "NONPNS", "919981223202105202", "INDAH PURWANINGTYAS", "919981223202105202", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(461, "NONPNS", "919990417202105201", "ROJANAH", "919990417202105201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(462, "NONPNS", "919990512202105101", "TUBAGUS MOHAMAD FAUZI IRFANI", "919990512202105101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(463, "NONPNS", "919990512202110101", "ACHMAD NAUFAL ALIM", "919990512202110101", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(464, "NONPNS", "919991008202105201", "WINDY OKVANDIFA", "919991008202105201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(465, "NONPNS", "920000428202109201", "FAJAR EVILIANI", "920000428202109201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(466, "NONPNS", "920000810202109201", "AYU GUSTINA", "920000810202109201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(467, "NONPNS", "920030611202201201", "AIRINE HANANIAH", "920030611202201201", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL),
	(468, "PNS", " 197302011996032001", "Diyah Asida, S.Gz", " 197302011996032001", "$2y$10$wh8bfkCdPkmKZ/aQxy6QeuZOSXIsQByQAQREKj/p.1MLBcuhpTK5G", NULL, NULL, NULL, NULL, NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of views
# ------------------------------------------------------------

# Creating temporary tables to overcome VIEW dependency errors


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# Dump completed on 2023-11-13T11:47:47+07:00
