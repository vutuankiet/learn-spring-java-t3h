-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for k34_dl
CREATE DATABASE IF NOT EXISTS `k34_dl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `k34_dl`;

-- Dumping structure for table k34_dl.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGO` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table k34_dl.brands: ~0 rows (approximately)
DELETE FROM `brands`;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

-- Dumping structure for table k34_dl.categoties
CREATE TABLE IF NOT EXISTS `categoties` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) DEFAULT '0',
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table k34_dl.categoties: ~0 rows (approximately)
DELETE FROM `categoties`;
/*!40000 ALTER TABLE `categoties` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoties` ENABLE KEYS */;

-- Dumping structure for table k34_dl.product
CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `FULL_DESCRITION` text COLLATE utf8mb4_unicode_ci,
  `SHORT_DESCRITION` text COLLATE utf8mb4_unicode_ci,
  `HEIGHT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IN_STOCK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LENGTH` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAIN_IMAGE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRICE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WEIGHT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WIDTH` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRAND_ID` int(11) DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table k34_dl.product: ~0 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table k34_dl.product_image
CREATE TABLE IF NOT EXISTS `product_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table k34_dl.product_image: ~25 rows (approximately)
DELETE FROM `product_image`;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` (`ID`, `PRODUCT_ID`, `IMAGE`) VALUES
	(10, 1, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/fc051a7d-04d1-4e72-8d60-61b006ed7e08jpg'),
	(11, 1, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/6fef421c-fa93-4b5a-9409-e4e905624fd1jpg'),
	(12, 1, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/f0be6d5b-6f58-4304-adb7-7d998ccf0941jpg'),
	(21, 0, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/e565c7ea-c0b0-4d3e-b9b0-cb59780b4625jpg'),
	(22, 0, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/6175ff2f-d155-4814-9e1d-3f5277143917jpg'),
	(23, 3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/bd91a667-cb34-4b56-81f1-84bc2d654fa5jpg'),
	(24, 3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/4172c39c-257d-4fba-948b-f50a6f9b646djpg'),
	(25, 3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/342f72f7-9c27-41ef-b494-561438df6f20jpg'),
	(26, 3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/a39a7ff8-fefe-4059-923b-4a48620b875ejpg'),
	(27, 3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/7dd20df7-0c9a-4c7a-ae83-2d761fe0d26djpg'),
	(28, 3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d763a2d0-5816-4e25-86e1-59025bf88dbajpg'),
	(29, 3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/ed810b7e-060f-4a8e-a755-ee4a2dbe9020jpg'),
	(30, 3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/818b8754-4a6c-498b-8700-a53a626cb2a7png'),
	(31, 3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/cc754998-1036-4590-badd-f95176cda237jpg'),
	(32, 4, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/1770caaf-1822-4970-b482-61c3ec32f901jpg'),
	(33, 4, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/80964a5b-2b91-42d3-a6a6-9f7843bf2b10jpg'),
	(34, 4, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/bb183cd4-ccc0-4b3c-82e0-cebe2ed097e8jpg'),
	(35, 4, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/df3a80c0-4e03-4c4a-b33f-de87e96acaedjpg'),
	(36, 4, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/ca24840b-9521-4f78-ae3b-daaafc950e08jpg'),
	(37, 4, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/a3ab8db3-17ce-450d-83e6-5c76c6cd2592jpg'),
	(38, 4, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d462d27a-99df-413e-90db-befb987e8cf1jpg'),
	(39, 5, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d77ef422-f696-4fca-8a24-b83a5efea0bejpg'),
	(40, 5, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/8d715580-7563-499c-9f9f-36b9c0e1c0b4jpg'),
	(42, 6, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/aab25544-e308-487b-83c1-25fdba4dcb81jpg'),
	(43, 6, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/7eb2e610-ef98-441b-8e3a-b4eee55952dajpg'),
	(44, 6, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/eb24a552-ddff-4545-80a0-9ef6351a4887jpg');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;

-- Dumping structure for table k34_dl.sach
CREATE TABLE IF NOT EXISTS `sach` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table k34_dl.sach: ~2 rows (approximately)
DELETE FROM `sach`;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` (`ID`, `NAME`, `AUTHOR`) VALUES
	(1, 'vutuankiet', 'Vu Tuan Kiet'),
	(2, 'vutuankiet1', 'Vu Tuan Kiet1');
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;

-- Dumping structure for table k34_dl.user
CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FULLNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ROLE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AVATAR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATUS` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table k34_dl.user: ~11 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `EMAIL`, `FULLNAME`, `ADDRESS`, `ROLE`, `PASSWORD`, `AVATAR`, `STATUS`) VALUES
	(3, '123@gmail.com', 'Vu Tuan Kiet', 'Ha Noi', 'null', '123123123', '1661820286814_code-snapshot.png', 1),
	(4, 'vutuankiet241111@gmail.com', 'Vu Tuan Kiet', 'Ha Noi', 'null', '123123', '1661823418346_6-game-nintendo-switch.jpg', 1),
	(5, '123456@gmail.com', 'Vu Tuan Kiet', 'Ha Noi', NULL, '121212', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d588d84d-9f49-4c7e-b208-bdaa3d2605ddjpg', 1),
	(6, 'vuthikhanhtuong@gmail.com', 'Vu Tuan Kiet', 'Ha Noi', NULL, '12121212', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/1ba06f25-8870-467e-b58c-15cfd87d7242jpg', 1),
	(7, 'lang@gmail.com', 'lang', 'Ha Noi', NULL, '12121212', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/a3ac0f92-b075-4e38-8e64-8ca8b37268f0jpg', 1),
	(8, 'vutuankiet242002@gmail.com', 'Vu Tuan Kiet', 'Ha Noi', 'USER', '1212', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/94f8df52-d869-41d1-b21c-96efcca1e8d1jpg', 1),
	(9, '234@gmail.com', 'lang', 'Ha Noi', NULL, '1212', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b6a08652-1753-4267-950f-59849123ac4ejpg', 1),
	(19, 'duy@gmail.com', 'Duy', 'Ha Noi', NULL, '1212121212', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/1942de4f-b682-462b-acd7-59cd146c0783jpg', 1),
	(41, 'user@gmail.com', 'user', 'Ha Noi', NULL, '$2a$12$AC6tDSbirlKAx.WniSANCON62HAf04aJE9Bwm2qGlMaryn9tA2iPS', 'https://storage.googleapis.com/test-78e6a.appspot.com/5c08e4ec-3a6d-435f-af57-b0f07da42e15jpg', 1),
	(42, 'admin@gmail.com', 'admin', 'Ha Noi', 'ADMIN', '$2a$10$xSNqCm1l5HGBWJ3C76lMfOjzL9YcHU29W0BWSH2UnZGEAVKLqj.a2', 'https://storage.googleapis.com/test-78e6a.appspot.com/a3d1468e-0066-4935-b9cd-689ccf1b78adjpg', 1),
	(43, 'vutuankiet24112002@gmail.com', 'Vu Tuan Kiet', 'Ha Noi', NULL, '$2a$10$RvU3TUpXioxObp3yavdGG.KND0OxqXi4od1xdbVBMSHAoTfaajvOW', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/f26b6e7b-14b1-471b-a0f2-01a459c9cd50jpg', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table k34_dl.user_token
CREATE TABLE IF NOT EXISTS `user_token` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table k34_dl.user_token: ~0 rows (approximately)
DELETE FROM `user_token`;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
INSERT INTO `user_token` (`ID`, `USER_ID`, `EMAIL`, `TOKEN`, `TYPE`, `CREATED_TIME`) VALUES
	(1, 8, 'vutuankiet242002@gmail.com', '6d93a82f-19f7-4415-a329-368bd95f4ce0', 0, '2022-10-08 10:49:20'),
	(2, 43, 'vutuankiet24112002@gmail.com', '11ff5368-f769-4472-a709-a5243e92945b', 0, '2022-10-08 08:10:33');
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
