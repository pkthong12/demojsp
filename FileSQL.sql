-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_web
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Hoten` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Diachi` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Img` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `RoleID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Stt` int DEFAULT NULL,
  `TimeSignup` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `account_ibfk_1` (`RoleID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roleus` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'admin','123','Hưởng MLonn','Hà Nội','0367697758','pkthong12@gmail.com',NULL,'1',1,'2023-03-27 20:33:38'),(2,'quynhkool','123','Quỳnh','Hà Nội','0000224343','quynhKook@gmail.com',NULL,'3',2,'2023-03-27 20:33:38'),(29,'cuzemm3','111','Quốc anh','Hà Nội','0367697756','congamai@gmail.com',NULL,'1',1,'2023-03-27 20:33:38'),(32,'pkthong','111','Phùng Kim Thông','Hà Nội','0367697759','congamai22@gmail.com',NULL,'2',1,'2023-03-27 20:33:38'),(36,'ly_nam_doan_km5_0616','123','Quốc anh','','','pkthongd12@gmail.com',NULL,'3',1,'2023-04-27 20:33:38'),(38,'cuzemm','khongnoi','Phùng Kim Thôngg','Hà Nộii','0367697734','conga2mai3@gmail.com',NULL,'3',2,'2023-06-13 00:01:17');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tensach` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Tacgia` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Dinhdang` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Trongluong` double NOT NULL,
  `Giaban` double NOT NULL,
  `CategoryID` int NOT NULL,
  `Giamgia` int DEFAULT NULL,
  `statusID` int DEFAULT NULL,
  `Image` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Ngaythem` datetime DEFAULT NULL,
  `Soluong` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `statusID` (`statusID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`statusID`) REFERENCES `book_status` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'CHÚ THUẬT HỒI CHIẾN - TẬP 9 (TẶNG KÈM OBI VÀ THẺ BO GÓC NHỰA)','Gege Akutami','bìa mềm',140,30000,2,10,5,'img/img-product/9-d9b6a0f9ef194d81911bab6a34406c6b-master-344041102815200.webp','2023-02-28 00:00:00',52),(2,'ONE - PUNCH MAN - TẬP 23 (TẶNG KÈM BOOKMARK PVC SAITAMA)','Yusuke Murata','bìa mềm',165,25000,2,10,5,'img/img-product/anh-id2-588268166887000.webp','2023-02-28 00:00:00',40),(3,'DORAEMON TRUYỆN NGẮN - TẬP 1',' Fujiko F Fujio','bìa mềm',140,22000,2,10,5,'img/img-product/anh-id3.webp','2023-03-05 00:00:00',66),(4,'\'CẬU\' MA NHÀ XÍ HANAKO - TẬP 16 (TẶNG KÈM 1 TRONG 2 MẪU BOOKMARK CÀI PVC)','AidaIro','bìa mềm',150,30000,3,10,3,'img/img-product/anh-id4.webp','2023-03-17 00:00:00',2),(5,'GIẢI MÃ 12 CHÒM SAO - KHÁM PHÁ TẤT TẦN TẬT CUNG XỬ NỮ',' Nhiều tác giả','bìa mềm',60,19500,8,30,5,'img/img-product/anh-id5.webp','2023-03-17 00:00:00',3),(6,'HÀNH TRÌNH TRÁI TIM NHÓM CUNG KHÍ - SONG TỬ - THIÊN BÌNH - BẢO BÌNH','Nhóm Lovedia','bìa mềm',205,50000,8,50,5,'img/img-product/anh-id6.webp','2023-03-17 00:00:00',7),(7,'12 CUNG YÊU - MẶT TRỜI SOI ĐƯỜNG, KIM TINH DẪN LỐI','Khúc Cẩm Huyên','bìa mềm',345,120000,8,10,5,'img/img-product/anh-id7.jpg','2023-03-17 00:00:00',2),(12,'CÁ LINH ĐI HỌC','Lê Quang Trạng','bìa mềm',165,88000,4,10,5,'https://product.hstatic.net/200000343865/product/ca-linh-di-hoc_bia_255b7ee31342443283859aadc9461d88_master.jpg','2023-03-22 18:16:03',12),(13,'COMBO THÁM TỬ LỪNG DANH CONAN - KẺ HÀNH PHÁP ZERO (2 TẬP)','Gosho Aoyama ','bìa mềm',400,120000,2,15,5,'img/img-product/combo-tham-tu-lung-danh-conan---ke-hanh-phap-zero--2-cuon--738a704180ff414788c5654e0926a428-master-587911462489300.jpg','2023-03-23 00:55:31',322),(14,'COMBO KHÉO TAY TÔ MÀU (8 QUYỂN)','Nhiều tác giả','bìa mềm',680,200000,6,14,5,'https://product.hstatic.net/200000343865/product/cb_468c5aeb87f540c9803b95a44bbcdd2a_master.jpg','2023-03-23 01:01:59',32),(15,'DRAGON QUEST - DẤU ẤN ROTO RETURNS (EMBLEM OF ROTO RETURNS) (TẶNG KÈM BOOKMARK PVC)','Kamui Fujiwara | Chiaki Kawamata | Junji Koyanagi','bìa mềm',245,70000,2,10,5,'https://product.hstatic.net/200000343865/product/dragon-quest---dau-an-roto-returns-_emblem-of-roto-returns__91a79f913a5f44bd9924337cdb0c89fb_master.jpg','2023-03-26 22:05:40',132),(16,'THÁNH THẠCH RAVE - TẬP 6 (TẶNG KÈM BOOKMARK PLUE)','Hiro Mashima','bìa mềm',135,30000,2,10,3,'https://product.hstatic.net/200000343865/product/6_96233f5e23dd48ba8f4588a557cb034c_master.jpg','2023-04-01 15:47:46',24),(17,'HÔN NHÂN HẠNH PHÚC CỦA TÔI (MANGA) - TẬP 2 (TẶNG 02 BOOKMARK + SỔ XÉ)','Akumi Agitogi | Rito Kohsaka | Tsukiho Tsukioka','bìa mềm',210,50000,6,10,5,'https://product.hstatic.net/200000343865/product/2_8009fea5970f4a9ea9a2bda340fe6e2b_master.jpg','2023-04-01 15:49:35',34),(18,'NGUYỄN ĐỨC CẢNH','Nghiêm Đa Văn','bìa mềm',200,46000,4,10,5,'https://product.hstatic.net/200000343865/product/nguyen_duc_canh_709ad193aea749de99332d7806ee6cf9_master.jpg','2023-04-01 15:51:15',35),(19,'THƠ HAY VIẾT CHO THIẾU NHI - LÀM ANH','Phan Thị Thanh Nhàn','bìa mềm',175,60000,4,10,5,'https://product.hstatic.net/200000343865/product/tho-hay-viet-cho-thieu-nhi---lam-anh_fd0c6918776e4e96aa3556ab317428ad_master.jpg','2023-04-01 15:52:19',43),(20,'TIỂU THUYẾT THANH GƯƠM DIỆT QUỶ - NGƯỜI DẪN LỐI CỦA GIÓ (TẶNG KÈM CARD PVC)','Koyoharu Gotouge | Aya Yajima','bìa mềm',215,50000,2,10,5,'img/img-product/tieu-thuyet-thanh-guom-diet-quy-nguoi-dan-loi-cua-gio-d9adab5163fe4350966d631b9ee302e5-master-343870175784900.webp','2023-04-03 22:42:21',32),(22,'CHÚ THUẬT HỒI CHIẾN - TẬP 12 (TẶNG KÈM OBI VÀ THẺ BO GÓC NHỰA)','Gege Akutami','bìa mềm',140,30000,2,10,5,'img/img-product/12-c2e7d24246de4aa499666e3d5b85d200-master-342727886158000.webp','2023-04-16 17:20:55',13),(23,'CHÚ GIÀ NUÔI MÈO Ú - TẬP 10 (TẶNG KÈM POSTCARD)','Umi Sakurai','bìa mềm',190,50000,6,10,5,'img/img-product/qqq.webp','2023-04-16 17:43:29',132),(24,'SINH VẬT THẦN THOẠI KHẮP THẾ GIAN','Epic','bìa mềm',285,79000,7,10,5,'img/img-product/sinh-vat-than-thoai-khap-the-gian-bia-1-bed53d66bffc4056982523d86e9a9f69-master-345045643551100.jpg','2023-04-16 17:51:02',43),(25,'HOÀNG TỬ BÉ','Antoine de Saint Exupéry','bìa mềm',115,35000,7,10,5,'img/img-product/hoang-tu-be-tb-2022-6e3dfd01ace949c6b114186402117726-master-345460160483700.webp','2023-04-16 17:57:57',16),(26,'Chuyện Cỏn Con Về \'\' Ông Cụ Non\'\' Roland','Starman','bìa mềm',340,99000,3,70,5,'img/img-product/chuyen-con-con-ve-ong-cu-non-roland-91d80936e4584aa98327452764357f44-master-508644664219000.jpg','2023-04-18 15:17:32',33),(27,'15 BỨC THƯ GỬI TUỔI THANH XUÂN - GỬI NHỮNG CÔ GÁI MỚI LỚN',' Ân Kiện Linh','bìa mềm',275,90000,3,50,5,'img/img-product/moi-lon-b7c58f5591974aa18fa5433f3b9e6330-master-546246037630700.jpg','2023-06-13 00:05:11',12);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_status`
--

DROP TABLE IF EXISTS `book_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_status` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Statusbook` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_status`
--

LOCK TABLES `book_status` WRITE;
/*!40000 ALTER TABLE `book_status` DISABLE KEYS */;
INSERT INTO `book_status` VALUES (3,'Đặt trước'),(4,'Hết hàng'),(5,'Còn hàng');
/*!40000 ALTER TABLE `book_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `AccountID` int NOT NULL,
  `Spvsl` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `AccountID_idx` (`AccountID`),
  CONSTRAINT `AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,',26:4,0:0'),(2,',25:2'),(29,',0:0'),(32,',26:1'),(36,',0:0'),(38,',0:0');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tenloai` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'MANGA - COMIC'),(3,'TRUYỆN TRANH'),(4,'VĂN HỌC VIỆT NAM'),(5,'KIẾN THỨC - KHOA HỌC'),(6,'WINGS BOOKS'),(7,'VĂN HỌC NƯỚC NGOÀI'),(8,'GIẢI MÃ BẢN THÂN');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configsweb`
--

DROP TABLE IF EXISTS `configsweb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configsweb` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tenweb` varchar(405) COLLATE utf8mb3_bin DEFAULT NULL,
  `DiachiDuong` varchar(450) COLLATE utf8mb3_bin DEFAULT NULL,
  `DiachiThanhpho` varchar(450) COLLATE utf8mb3_bin DEFAULT NULL,
  `Phone` varchar(14) COLLATE utf8mb3_bin DEFAULT NULL,
  `Email` varchar(450) COLLATE utf8mb3_bin DEFAULT NULL,
  `Facebook` varchar(450) COLLATE utf8mb3_bin DEFAULT NULL,
  `Zalo` varchar(450) COLLATE utf8mb3_bin DEFAULT NULL,
  `Instagram` varchar(450) COLLATE utf8mb3_bin DEFAULT NULL,
  `Stt` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configsweb`
--

LOCK TABLES `configsweb` WRITE;
/*!40000 ALTER TABLE `configsweb` DISABLE KEYS */;
INSERT INTO `configsweb` VALUES (1,'Nhà sách D','Nhuệ Giang, Tây Mỗ','Nam Từ Liêm, Hà Nội, Việt Nam','+84 367697758','pkthong12@gmail.com','https://www.facebook.com/profile.php?id=100084687950939','0367697758','thongg.1',1);
/*!40000 ALTER TABLE `configsweb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounttt`
--

DROP TABLE IF EXISTS `discounttt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounttt` (
  `Magg` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Rate` double NOT NULL,
  `Stt` int DEFAULT NULL,
  PRIMARY KEY (`Magg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounttt`
--

LOCK TABLES `discounttt` WRITE;
/*!40000 ALTER TABLE `discounttt` DISABLE KEYS */;
INSERT INTO `discounttt` VALUES ('thongdeptraivcd',10,1),('thongdzai',100,1);
/*!40000 ALTER TABLE `discounttt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_web`
--

DROP TABLE IF EXISTS `history_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history_web` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `ActionHis` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TimeHis` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `history_web_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `account` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_web`
--

LOCK TABLES `history_web` WRITE;
/*!40000 ALTER TABLE `history_web` DISABLE KEYS */;
INSERT INTO `history_web` VALUES (7,1,'admin đã thêm sách mới TIỂU THUYẾT THANH GƯƠM DIỆT QUỶ - NGƯỜI DẪN LỐI CỦA GIÓ (TẶNG KÈM CARD PVC)','2023-04-03 22:42:21'),(8,1,'admin đã tạo đơn hàng #20','2023-04-03 23:07:52'),(9,1,'admin đã tạo đơn hàng #21','2023-04-10 21:26:54'),(10,1,'admin đã cập nhật thông tin sách CHÚ THUẬT HỒI CHIẾN - TẬP 9 (TẶNG KÈM OBI VÀ THẺ BO GÓC NHỰA)','2023-04-16 16:24:01'),(11,1,'admin đã cập nhật thông tin sách CHÚ THUẬT HỒI CHIẾN - TẬP 9 (TẶNG KÈM OBI VÀ THẺ BO GÓC NHỰA)','2023-04-16 16:25:41'),(12,1,'admin đã thêm sách mới CHÚ THUẬT HỒI CHIẾN - TẬP 12 (TẶNG KÈM OBI VÀ THẺ BO GÓC NHỰA)','2023-04-16 17:12:25'),(13,1,'admin đã thêm sách mới CHÚ THUẬT HỒI CHIẾN - TẬP 12 (TẶNG KÈM OBI VÀ THẺ BO GÓC NHỰA)','2023-04-16 17:20:55'),(14,1,'admin đã cập nhật thông tin sách TIỂU THUYẾT THANH GƯƠM DIỆT QUỶ - NGƯỜI DẪN LỐI CỦA GIÓ (TẶNG KÈM CARD PVC)','2023-04-16 17:31:27'),(15,1,'admin đã cập nhật thông tin sách CHÚ THUẬT HỒI CHIẾN - TẬP 9 (TẶNG KÈM OBI VÀ THẺ BO GÓC NHỰA)','2023-04-16 17:34:18'),(16,1,'admin đã thêm sách mới CHÚ GIÀ NUÔI MÈO Ú - TẬP 10 (TẶNG KÈM POSTCARD)','2023-04-16 17:43:29'),(17,1,'admin đã thêm sách mới SINH VẬT THẦN THOẠI KHẮP THẾ GIAN','2023-04-16 17:51:03'),(18,1,'admin đã thêm sách mới HOÀNG TỬ BÉ','2023-04-16 17:57:57'),(19,1,'admin đã thêm sách mới CHUYỆN CỎN CON VỀ \"ÔNG CỤ NON\" ROLAND (2017)','2023-04-18 15:17:32'),(20,1,'admin đã cập nhật thông tin sách COMBO THÁM TỬ LỪNG DANH CONAN - KẺ HÀNH PHÁP ZERO (2 TẬP)','2023-04-19 13:13:28'),(21,1,'admin đã cập nhật thông tin sách COMBO THÁM TỬ LỪNG DANH CONAN - KẺ HÀNH PHÁP ZERO (2 TẬP)','2023-04-19 13:17:34'),(22,1,'admin đã cập nhật thông tin sách COMBO THÁM TỬ LỪNG DANH CONAN - KẺ HÀNH PHÁP ZERO (2 TẬP)','2023-04-19 13:18:34'),(23,1,'admin đã cập nhật thông tin sách ONE - PUNCH MAN - TẬP 23 (TẶNG KÈM BOOKMARK PVC SAITAMA)','2023-04-19 13:22:41'),(24,1,'admin đã cập nhật thông tin sách ONE - PUNCH MAN - TẬP 23 (TẶNG KÈM BOOKMARK PVC SAITAMA)','2023-04-19 13:24:30'),(25,1,'admin đã cập nhật thông tin sách ONE - PUNCH MAN - TẬP 23 (TẶNG KÈM BOOKMARK PVC SAITAMA)','2023-04-19 13:24:42'),(26,1,'admin đã cập nhật thông tin sách ONE - PUNCH MAN - TẬP 23 (TẶNG KÈM BOOKMARK PVC SAITAMA)','2023-04-19 13:32:33'),(27,2,'quynhkool đã tạo đơn hàng #22','2023-04-24 16:35:14'),(28,36,'Đã tạo tài khoản ly_nam_doan_km5_0616','2023-04-27 20:33:38'),(29,1,'admin đã tạo đơn hàng #23','2023-04-28 18:26:08'),(30,32,'pkthong đã tạo đơn hàng #24','2023-05-10 13:31:40'),(31,1,'admin đã tạo đơn hàng #25','2023-05-10 16:04:43'),(33,1,'admin đã tạo đơn hàng #26','2023-06-07 19:16:43'),(34,1,'admin đã tạo đơn hàng #27','2023-06-07 21:15:06'),(35,1,'admin đã tạo đơn hàng #28','2023-06-07 21:59:14'),(36,1,'admin đã cập nhật thông tin sách CHUYỆN CỎN CON VỀ ','2023-06-08 18:51:17'),(37,1,'admin đã cập nhật thông tin sách Chuyện Cỏn Con Về \'\' Ông Cụ Non\'\' Roland','2023-06-08 19:00:54'),(38,1,'admin đã cập nhật thông tin web','2023-06-12 23:18:09'),(39,1,'admin đã cập nhật thông tin web','2023-06-12 23:18:24'),(40,1,'admin đã cập nhật thông tin web','2023-06-12 23:25:11'),(41,1,'admin đã tạo đơn hàng #29','2023-06-12 23:42:40'),(42,1,'admin đã tạo đơn hàng #30','2023-06-12 23:56:13'),(43,1,'admin đã tạo đơn hàng #31','2023-06-12 23:58:46'),(44,1,'admin đã thêm sách mới 15 BỨC THƯ GỬI TUỔI THANH XUÂN - GỬI NHỮNG CÔ GÁI MỚI LỚN','2023-06-13 00:05:11');
/*!40000 ALTER TABLE `history_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `methodpayment`
--

DROP TABLE IF EXISTS `methodpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `methodpayment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NameMethod` varchar(450) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `methodpayment`
--

LOCK TABLES `methodpayment` WRITE;
/*!40000 ALTER TABLE `methodpayment` DISABLE KEYS */;
INSERT INTO `methodpayment` VALUES (1,'Thanh toán khi giao hàng (COD)'),(2,'Ví MoMo'),(3,'Ví Zalopay bằng QRCode'),(4,'Thẻ Visa/Master/JCB'),(5,'Thẻ ATM nội địa');
/*!40000 ALTER TABLE `methodpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `BookID` int DEFAULT NULL,
  `Soluong` int NOT NULL,
  `Thanhtien` double NOT NULL,
  `Giaban` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `OrderID` (`OrderID`),
  KEY `BookID_idx` (`BookID`),
  CONSTRAINT `BookID` FOREIGN KEY (`BookID`) REFERENCES `book` (`ID`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `ordercart` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (28,26,26,3,89100,29700),(29,27,26,1,29700,29700),(30,28,26,3,89100,29700),(31,29,15,4,252000,63000),(32,30,23,3,135000,45000),(33,31,24,1,71100,71100);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `des_status` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'Đặt hàng thành công, chờ xác nhận'),(2,'Đơn hàng đã được xác nhận, chờ vận chuyển'),(3,'Đơn hàng đang được vận chuyển '),(4,'Giao hàng thành công'),(5,'Giao hàng thất bại'),(6,'Đã hủy'),(7,'Thành công'),(8,'Yêu cầu hoàn hàng'),(9,'Yêu cầu hủy đơn hàng'),(10,'Hoàn hàng thành công');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordercart`
--

DROP TABLE IF EXISTS `ordercart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordercart` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Hoten` varchar(450) DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  `AccountID` int NOT NULL,
  `Total` double NOT NULL,
  `Stt` int DEFAULT NULL,
  `Diachi` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Giamgia` double DEFAULT NULL,
  `Thoigian` datetime DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Method` int DEFAULT NULL,
  `TotalFirst` double DEFAULT NULL,
  `Phiship` double DEFAULT NULL,
  `ReqStt` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AccountID` (`AccountID`),
  KEY `Method_idx` (`Method`),
  KEY `Stt_idx` (`Stt`),
  CONSTRAINT `Method` FOREIGN KEY (`Method`) REFERENCES `methodpayment` (`ID`),
  CONSTRAINT `ordercart_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `account` (`ID`),
  CONSTRAINT `Stt` FOREIGN KEY (`Stt`) REFERENCES `order_status` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordercart`
--

LOCK TABLES `ordercart` WRITE;
/*!40000 ALTER TABLE `ordercart` DISABLE KEYS */;
INSERT INTO `ordercart` VALUES (26,'Hưởng MLon','0367697758',1,124100,6,'21, Xã Đông Cứu, Huyện Gia Bình, Tỉnh Bắc Ninh',0,'2023-06-07 19:16:43','pkthong12@gmail.com',1,124100,35000,NULL),(27,'Hưởng MLon','0367697758',1,64700,6,'31, Phường Trưng Nhị, Thành phố Phúc Yên, Tỉnh Vĩnh Phúc',0,'2023-06-07 21:15:06','pkthong12@gmail.com',1,64700,35000,NULL),(28,'Hưởng MLon','0367697758',1,124100,1,'65, Phường Cửa Ông, Thành phố Cẩm Phả, Tỉnh Quảng Ninh',0,'2023-06-07 21:59:14','pkthong12@gmail.com',1,124100,35000,NULL),(29,'Hưởng MLon','0367697758',1,0,1,'23, Xã Xín Cái, Huyện Mèo Vạc, Tỉnh Hà Giang',100,'2023-06-12 23:42:40','pkthong12@gmail.com',1,35000,35000,NULL),(30,'Hưởng MLon','0367697758',1,0,1,'23, Xã Hồng Phong, Huyện Ninh Giang, Tỉnh Hải Dương',100,'2023-06-12 23:56:13','pkthong12@gmail.com',1,135000,35000,NULL),(31,'Hưởng MLon','0367697758',1,96100,6,'23, Phường Hàng Buồm, Quận Hoàn Kiếm, Thành phố Hà Nội',0,'2023-06-12 23:58:46','pkthong12@gmail.com',1,71100,25000,NULL);
/*!40000 ALTER TABLE `ordercart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleus`
--

DROP TABLE IF EXISTS `roleus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleus` (
  `ID` varchar(10) NOT NULL,
  `Rolename` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleus`
--

LOCK TABLES `roleus` WRITE;
/*!40000 ALTER TABLE `roleus` DISABLE KEYS */;
INSERT INTO `roleus` VALUES ('1','Admin'),('2','Nhân viên'),('3','User'),('4','Quản lý');
/*!40000 ALTER TABLE `roleus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `Title` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `Description` longtext COLLATE utf8mb3_bin,
  `Replied` tinyint DEFAULT NULL,
  `Substance_rep` longtext COLLATE utf8mb3_bin,
  `ID_person_rep` int DEFAULT NULL,
  `TimeOpen` datetime DEFAULT NULL,
  `TimeReply` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AccountID_idx` (`AccountID`) /*!80000 INVISIBLE */,
  KEY `OrderID_idx` (`OrderID`),
  KEY `nguoirep_idx` (`ID_person_rep`),
  CONSTRAINT `nguoirep` FOREIGN KEY (`ID_person_rep`) REFERENCES `account` (`ID`),
  CONSTRAINT `OrderID` FOREIGN KEY (`OrderID`) REFERENCES `ordercart` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (11,1,27,'Hủy đơn hàng','Đổi ý, không mua nữa',1,'Đã hủy',NULL,'2023-06-09 18:43:38',NULL),(12,1,26,'Yêu cầu trả hàng/hoàn tiền','Đổi ý, không mua nữa',0,'',NULL,'2023-06-09 18:51:43',NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_web'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-13  0:07:09
