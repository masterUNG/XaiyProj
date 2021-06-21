-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2021 at 08:13 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mlao`
--

-- --------------------------------------------------------

--
-- Table structure for table `foodtable`
--

CREATE TABLE `foodtable` (
  `id` int(11) NOT NULL,
  `idShop` text COLLATE utf8_unicode_ci NOT NULL,
  `idGrp` text COLLATE utf8_unicode_ci NOT NULL,
  `NameFood` text COLLATE utf8_unicode_ci NOT NULL,
  `PathImage` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` text COLLATE utf8_unicode_ci NOT NULL,
  `Detail` text COLLATE utf8_unicode_ci NOT NULL,
  `Status` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `foodtable`
--

INSERT INTO `foodtable` (`id`, `idShop`, `idGrp`, `NameFood`, `PathImage`, `Price`, `Detail`, `Status`) VALUES
(1, '15', '1', 'ປີ້ງໄກ່', '/mlao/Food/pinkai.jpg', '10000', 'ໂຕ', '1'),
(2, '15', '1', 'ປີ້ງໄກ່', '/mlao/Food/pinkai.jpg', '90000', 'ໂຕ', '1'),
(3, '15', '1', 'ປີ້ງໄກ່', '/mlao/Food/pinkai.jpg', '80000', 'ໂຕ', '1'),
(4, '15', '1', 'ກ້ອຍປາ', '/mlao/Food/koypa1.jpg', '55000', 'ຈານ', '1'),
(5, '15', '1', 'ແກງປາ', '/mlao/Food/keng1.jpg', '55000', 'ຈານ', '1'),
(6, '15', '5', 'ຕົ້ມໄກ່', '/mlao/Food/tomkai1.jpg', '80000', 'ໂຕ', '1'),
(7, '15', '8', 'ຕົ້ມໄກ ເຄີ່ງໂຕ', '/mlao/Food/kaikheng1.jpg', '50000', 'ໂຕ', '1'),
(12, '2', '2', 'เลือดหมู ข้าวเปล่า', '/mlao/Food/editShop68019.jpg', '50000', 'อร่อย มากๆๆ', '1'),
(16, '2', '2', 'เค้กช้อกโกเล็ด', '/mlao/Food/editShop68019.jpg', '30000', 'ກະທຽມ', ''),
(19, '16', '8', 'เกาเหลา ข้าวเปล่า', '/mlao/Food/editShop68019.jpg', '60000', 'อิ่มอร่อย', '1'),
(20, '2', '3', 'beerlao', '/mlao/Food/food323644.jpg', '10000', '1', '1'),
(21, '22', '3', 'numduem', '/mlao/Food/food612326.jpg', '4000', 'huh', '1'),
(22, '22', '3', 'ghggh', '/mlao/Food/food287085.jpg', '5000', 'hjjk', '1'),
(23, '2', '3', 'ປາໃນ', '/mlao/Food/editShop68019.jpg', '20000', 'ໂລ1', '1'),
(25, '23', '3', 'beerlao', '/mlao/Food/food964808.jpg', '10000', '1 keo', '1'),
(26, '23', '2', 'beerlao', '/mlao/Food/food743733.jpg', '12000', '1 keo', '1'),
(27, '2', '4', 'ຜັກກາດ', '/mlao/Food/food871713.jpg', '5000', '1 ກິໂລ', '1'),
(28, '2', '4', 'ປານິນ', '/mlao/Food/food796035.jpg', '20000', 'ກິໂລ', '1'),
(29, '2', '1', 'ຫອມບົ່ວໃບ', '/mlao/Food/bai.jpg', '15000', 'ກິໂລ', '1'),
(30, '2', '1', 'ຫອມບົ່ວໃບ', '/mlao/Food/bai.jpg', '2000', 'ຂີດ', '1'),
(31, '2', '1', 'ຫອມປ້ອມ', '/mlao/Food/pom.jpg', '20000', 'ກິໂລ', '1'),
(32, '2', '1', 'ຫອມປ້ອມ', '/mlao/Food/pom.jpg', '2000', 'ຂີດ', '1'),
(33, '2', '1', 'ຫອມລາບ', '/mlao/Food/larp.jpg', '12000', 'ກິໂລ', '1'),
(34, '2', '1', 'ຫອມລາບ', '/mlao/Food/larp.jpg', '1000', 'ຂີດ', '1');

-- --------------------------------------------------------

--
-- Table structure for table `groupfood`
--

CREATE TABLE `groupfood` (
  `id` int(11) NOT NULL,
  `idShop` text COLLATE utf8_unicode_ci NOT NULL,
  `NameGroup` text COLLATE utf8_unicode_ci NOT NULL,
  `PathImage` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groupfood`
--

INSERT INTO `groupfood` (`id`, `idShop`, `NameGroup`, `PathImage`) VALUES
(0, '2', 'ໝວດໝາກໄມ້', '/mlao/GroupFood/mai.jpg'),
(1, '2', 'ໝວດພືດຜັກເປັນໃບ', '/mlao/GroupFood/bai.jpg'),
(2, '2', 'ໝວດພືດຜັກເປັນໝາກ', '/mlao/GroupFood/phuk.jpg'),
(3, '2', 'ໝວດຊີ້ນສັດ', '/mlao/GroupFood/zin.jpg'),
(4, '2', 'ປະເພດປາ', '/mlao/GroupFood/pa.jpg'),
(5, '2', 'ໝວດເຄື່ອງປຸງ', '/mlao/GroupFood/poung.jpg'),
(7, '2', 'ໜວດເຫັດ', '/mlao/GroupFood/het.jpg'),
(8, '2', 'ອາຫານແຊແຂງ', '/mlao/GroupFood/zaekhaeng.jpg'),
(11, '22', 'ປະເພດຊີ້ນ', '/mlao/GroupFood/zin.jpg'),
(12, '15', 'ປະເພດຊີ້ນ', '/mlao/GroupFood/zin.jpg'),
(13, '2', 'ໜວດເຄື່ອງໃຊ້ໃນຄົວເຮືອນ', '/mlao/GroupFood/khua.jpg'),
(15, '2', 'ອາຫານທະເລ', '/mlao/GroupFood/ley.jpg'),
(50, '2', 'ໝວດອາຫານສຳເລັດຮູບ ແລະ ເສັ້ນ', '/mlao/GroupFood/sen.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ordertable`
--

CREATE TABLE `ordertable` (
  `id` int(11) NOT NULL,
  `OrderDateTime` text COLLATE utf8_unicode_ci NOT NULL,
  `idUser` text COLLATE utf8_unicode_ci NOT NULL,
  `NameUser` text COLLATE utf8_unicode_ci NOT NULL,
  `idShop` text COLLATE utf8_unicode_ci NOT NULL,
  `NameShop` text COLLATE utf8_unicode_ci NOT NULL,
  `Distance` text COLLATE utf8_unicode_ci NOT NULL,
  `Transport` text COLLATE utf8_unicode_ci NOT NULL,
  `idFood` text COLLATE utf8_unicode_ci NOT NULL,
  `NameFood` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` text COLLATE utf8_unicode_ci NOT NULL,
  `Amount` text COLLATE utf8_unicode_ci NOT NULL,
  `Sum` text COLLATE utf8_unicode_ci NOT NULL,
  `idRider` text COLLATE utf8_unicode_ci NOT NULL,
  `Status` text COLLATE utf8_unicode_ci NOT NULL,
  `idGrp` int(11) NOT NULL,
  `NameGroup` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ordertable`
--

INSERT INTO `ordertable` (`id`, `OrderDateTime`, `idUser`, `NameUser`, `idShop`, `NameShop`, `Distance`, `Transport`, `idFood`, `NameFood`, `Price`, `Amount`, `Sum`, `idRider`, `Status`, `idGrp`, `NameGroup`) VALUES
(1, '2020-08-04 05:05', '1', 'มาสเตอร์ ผู้ซื้อ', '2', 'อึ่ง อร่อยโครต จริงๆ', '1.72', '45', '[12, 17]', '[เลือดหมู ข้าวเปล่า, สุกี่แห้ง]', '[80, 50]', '[3, 2]', '[240, 100]', 'none', 'UserOrder', 0, '0'),
(2, '2020-08-04 05:06', '1', 'มาสเตอร์ ผู้ซื้อ', '15', 'โนบิตะ อร่อย มาก', '2.48', '45', '[1, 3, 6, 7]', '[ลูกชิ้นหมู, ขนมจีนแกงไก่, สลัดไข่, หมูผัดเผ็ด]', '[10, 60, 60, 80]', '[5, 1, 2, 2]', '[50, 60, 120, 160]', 'none', 'UserOrder', 0, '0'),
(3, '2021-05-19 15:56', '20', 'xaiy', '2', 'mingshop', '0.0', '35', '[12, 16, 17, 17, 20]', '[เลือดหมู ข้าวเปล่า, เค้กช้อกโกเล็ด, สุกี่แห้ง, สุกี่แห้ง, beerlao]', '[80, 300, 50, 50, 10000]', '[1, 1, 1, 1, 1]', '[80, 300, 50, 50, 10000]', 'none', 'UserOrder', 0, '0'),
(4, '2021-05-20 07:55', '22', 'xaiy', '16', 'ก้วยเตียว อึ่ง', '524.45', '5265', '[19, 19]', '[เกาเหลา ข้าวเปล่า, เกาเหลา ข้าวเปล่า]', '[60, 60]', '[1, 1]', '[60, 60]', 'none', 'UserOrder', 0, '0'),
(5, '2021-05-20 07:56', '22', 'xaiy', '2', 'mingshop', '0.0', '35', '[16, 17, 20]', '[เค้กช้อกโกเล็ด, สุกี่แห้ง, beerlao]', '[300, 50, 10000]', '[1, 1, 1]', '[300, 50, 10000]', 'none', 'UserOrder', 0, '0'),
(6, '2021-05-20 07:58', 'null', 'null', '15', 'โนบิตะ อร่อย มาก', '0.01', '35', '[6, 7, 4]', '[สลัดไข่, หมูผัดเผ็ด, สุกี่แห้ง]', '[60, 80, 60]', '[1, 1, 1]', '[60, 80, 60]', 'none', 'UserOrder', 0, '0'),
(9, '2021-05-20 14:15', '22', 'xaiy', '22', 'ບໍລິສັດເມືອງລາວ', '0', '35', '[23, 22, 21, 23, 21, 21]', '[ປາໃນ, ghggh, numduem, ປາໃນ, numduem, numduem]', '[20, 5000, 4000, 20, 4000, 4000]', '[1, 2, 1, 1, 1, 1]', '[20, 10000, 4000, 20, 4000, 4000]', 'none', 'UserOrder', 0, '0'),
(10, '2021-05-20 15:12', '22', 'xaiy', '22', 'ບໍລິສັດເມືອງລາວ', '0', '35', '[21, 22, 23]', '[numduem, ghggh, ປາໃນ]', '[4000, 5000, 20]', '[2, 1, 1]', '[8000, 5000, 20]', 'none', 'UserOrder', 0, '0'),
(11, '2021-05-20 20:06', '20', 'xaiy', '22', 'ບໍລິສັດເມືອງລາວ', '0', '35', '[22, 23, 21, 22, 23, 21, 22, 23]', '[ghggh, ປາໃນ, numduem, ghggh, ປາໃນ, numduem, ghggh, ປາໃນ]', '[5000, 20, 4000, 5000, 20, 4000, 5000, 20]', '[1, 1, 1, 1, 1, 1, 1, 1]', '[5000, 20, 4000, 5000, 20, 4000, 5000, 20]', 'none', 'UserOrder', 0, '0'),
(12, '2021-05-20 20:06', '20', 'xaiy', '22', 'ບໍລິສັດເມືອງລາວ', '0', '35', '[22, 23]', '[ghggh, ປາໃນ]', '[5000, 20]', '[1, 1]', '[5000, 20]', 'none', 'UserOrder', 0, '0'),
(13, '2021-05-21 21:47', '2', 'xaiy', '2', 'ບໍລິສັດເມືອງລາວ', '0', '35', '[12, 16, 20, 20]', '[เลือดหมู ข้าวเปล่า, เค้กช้อกโกเล็ด, beerlao, beerlao]', '[50000, 30000, 10000, 10000]', '[1, 2, 1, 1]', '[50000, 60000, 10000, 10000]', 'none', 'UserOrder', 0, '0'),
(14, '2021-05-22 17:16', '20', 'null', '2', 'ບໍລິສັດເມືອງລາວ', '0', '35', '[20, 16, 12]', '[beerlao, เค้กช้อกโกเล็ด, เลือดหมู ข้าวเปล่า]', '[10000, 30000, 50000]', '[1, 1, 1]', '[10000, 30000, 50000]', 'none', 'UserOrder', 0, '0'),
(15, '2021-05-22 17:34', '27', 'null', '2', 'ບໍລິສັດເມືອງລາວ', '0', '35', '[16, 27, 16, 12]', '[เค้กช้อกโกเล็ด, ຜັກກາດ, เค้กช้อกโกเล็ด, เลือดหมู ข้าวเปล่า]', '[30000, 5000, 30000, 50000]', '[1, 1, 1, 1]', '[30000, 5000, 30000, 50000]', 'none', 'UserOrder', 0, '0'),
(16, '2021-05-22 18:17', '20', 'xaiy', '2', 'ບໍລິສັດເມືອງລາວ', '0', '35', '[20, 27, 12, 16, 12]', '[beerlao, ຜັກກາດ, เลือดหมู ข้าวเปล่า, เค้กช้อกโกเล็ด, เลือดหมู ข้าวเปล่า]', '[10000, 5000, 50000, 30000, 50000]', '[1, 1, 1, 1, 1]', '[10000, 5000, 50000, 30000, 50000]', 'none', 'UserOrder', 0, '0'),
(17, '2021-05-22 19:02', '20', 'xaiy', '23', 'XSHOP', '0', '35', '[26, 25]', '[beerlao, beerlao]', '[12000, 10000]', '[1, 1]', '[12000, 10000]', 'none', 'UserOrder', 0, '0'),
(18, '2021-05-22 19:03', '20', 'xaiy', '23', 'XSHOP', '0', '35', '[25, 26]', '[beerlao, beerlao]', '[10000, 12000]', '[1, 1]', '[10000, 12000]', 'none', 'UserOrder', 0, '0'),
(19, '2021-05-22 19:08', '20', 'xaiy', '22', 'mingshop', '0', '35', '[21, 23]', '[numduem, ປາໃນ]', '[4000, 20000]', '[1, 1]', '[4000, 20000]', 'none', 'UserOrder', 0, '0'),
(20, '2021-05-22 19:09', '20', 'xaiy', '22', 'mingshop', '0', '35', '[23, 22, 21]', '[ປາໃນ, ghggh, numduem]', '[20000, 5000, 4000]', '[1, 1, 1]', '[20000, 5000, 4000]', 'none', 'UserOrder', 0, '0'),
(21, '2021-05-22 19:10', '20', 'xaiy', '2', 'ບໍລິສັດເມືອງລາວ', '0', '35', '[27, 20, 16, 12]', '[ຜັກກາດ, beerlao, เค้กช้อกโกเล็ด, เลือดหมู ข้าวเปล่า]', '[5000, 10000, 30000, 50000]', '[1, 1, 1, 1]', '[5000, 10000, 30000, 50000]', 'none', 'UserOrder', 0, '0'),
(22, '2021-05-22 19:11', '20', 'xaiy', '2', 'ບໍລິສັດເມືອງລາວ', '0', '35', '[12, 20, 27, 12]', '[เลือดหมู ข้าวเปล่า, beerlao, ຜັກກາດ, เลือดหมู ข้าวเปล่า]', '[50000, 10000, 5000, 50000]', '[1, 1, 1, 1]', '[50000, 10000, 5000, 50000]', 'none', 'UserOrder', 0, '0'),
(23, '2021-05-24 00:33', '20', 'xaiy', '16', 'ປີ້ງໄກ່ນາປົ່ງ ສີບຸນເຮືອງ', '0', '35', '[19]', '[เกาเหลา ข้าวเปล่า]', '[60000]', '[1]', '[60000]', 'none', 'UserOrder', 0, '0'),
(24, '2021-05-24 00:36', '20', 'xaiy', '22', 'mingshop', '0', '35', '[23, 22]', '[ປາໃນ, ghggh]', '[20000, 5000]', '[1, 1]', '[20000, 5000]', 'none', 'UserOrder', 0, '0'),
(25, '2021-05-24 00:36', '20', 'xaiy', '22', 'mingshop', '0', '35', '[21, 22, 23]', '[numduem, ghggh, ປາໃນ]', '[4000, 5000, 20000]', '[1, 1, 1]', '[4000, 5000, 20000]', 'none', 'UserOrder', 0, '0'),
(26, '2021-05-24 13:11', '26', 'noy', '15', 'ຮ້ານ ນ້ອງນ້ອຍ', '0', '35', '[2, 6, 5, 3]', '[ປີ້ງໄກ່, ຕົ້ມໄກ່, ແກງປາ, ປີ້ງໄກ່]', '[90000, 80000, 55000, 80000]', '[1, 1, 1, 1]', '[90000, 80000, 55000, 80000]', 'none', 'UserOrder', 0, '0'),
(27, '2021-05-24 13:14', '20', 'xaiy', '15', 'ຮ້ານ ນ້ອງນ້ອຍ', '0', '35', '[2, 1, 3]', '[ປີ້ງໄກ່, ປີ້ງໄກ່, ປີ້ງໄກ່]', '[90000, 10000, 80000]', '[1, 1, 1]', '[90000, 10000, 80000]', 'none', 'UserOrder', 0, '0'),
(28, '2021-06-01 23:44', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '3.36', '10020', '[29, 32, 34]', '[ຫອມບົ່ວໃບ, ຫອມປ້ອມ, ຫອມລາບ]', '[15000, 2000, 1000]', '[1, 1, 1]', '[15000, 2000, 1000]', 'none', 'UserOrder', 0, ''),
(29, '2021-06-01 23:45', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '3.36', '10020', '[30, 32, 34]', '[ຫອມບົ່ວໃບ, ຫອມປ້ອມ, ຫອມລາບ]', '[2000, 2000, 1000]', '[1, 1, 1]', '[2000, 2000, 1000]', 'none', 'UserOrder', 0, ''),
(30, '2021-06-01 23:45', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '3.36', '10020', '[30, 34, 33, 34, 27]', '[ຫອມບົ່ວໃບ, ຫອມລາບ, ຫອມລາບ, ຫອມລາບ, ຜັກກາດ]', '[2000, 1000, 12000, 1000, 5000]', '[1, 1, 1, 1, 1]', '[2000, 1000, 12000, 1000, 5000]', 'none', 'UserOrder', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `id` int(11) NOT NULL,
  `ChooseType` text COLLATE utf8_unicode_ci NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `User` text COLLATE utf8_unicode_ci NOT NULL,
  `Password` text COLLATE utf8_unicode_ci NOT NULL,
  `NameShop` text COLLATE utf8_unicode_ci NOT NULL,
  `Address` text COLLATE utf8_unicode_ci NOT NULL,
  `Phone` text COLLATE utf8_unicode_ci NOT NULL,
  `UrlPicture` text COLLATE utf8_unicode_ci NOT NULL,
  `Lat` text COLLATE utf8_unicode_ci NOT NULL,
  `Lng` text COLLATE utf8_unicode_ci NOT NULL,
  `Token` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`id`, `ChooseType`, `Name`, `User`, `Password`, `NameShop`, `Address`, `Phone`, `UrlPicture`, `Lat`, `Lng`, `Token`) VALUES
(2, 'Shop', 'xaiy', 'mlao', '123', 'ຕະຫຼາດ ບຶງທາດຫລວງ', 'ທາດຫລວງ', '123', '/mlao/Shop/editShop13760.jpg', '17.957523', '102.662928', 'fZFLdbbhQD6vvoo29DOhQk:APA91bGV6fDZ81FBxxGRbc7niKR2kPCM-msWd70BYB7JLDvm1YvP8RtQgm2FFegC83m1vQeg9IPjzyMshpSXuZqTfuRU22z1sgjbwxlPcWcMRFsDEGTRqSyzhc8HWkOgH_uK4T8fabZQ'),
(15, 'Shop', 'ຮ້ານ ນ້ອງນ້ອຍ', 'nongnoi', '123', 'ຮ້ານ ນ້ອງນ້ອຍ', 'ບ້ານ ໂພນຕ້ອງຈອມມະນີ', '55554341', '/mlao/Shop/editShop69972.jpg', '17.9460589', '102.6923375', 'e0jxyPIuQJCgQfG7TdJKWH:APA91bE1oCohUnKUUPfVzHRiMOouTC0ILOE81dG-p7tTa7MsseIBew_zvqy8Y-KKm_IAUVAv-0Mi9rDdwqOHe76nijg54Q6tNDb5ldF9-hkvsa0qaszTeSRBB3myqslhz6sv9xA95bxk'),
(16, 'Shop', 'ທ້າວ ຊາຍ', 'napong', '123', 'ປີ້ງໄກ່ນາປົ່ງ ສີບຸນເຮືອງ', 'ບ້ານ ສີບຸນເຮືອງ', '123', '/mlao/Shop/editShop99809.jpg', '17.9460635', '102.6923196', ''),
(20, 'User', 'xaiy', 'xaiy', '123', '', 'somsangar', '92949494', '', '', '', 'fZFLdbbhQD6vvoo29DOhQk:APA91bGV6fDZ81FBxxGRbc7niKR2kPCM-msWd70BYB7JLDvm1YvP8RtQgm2FFegC83m1vQeg9IPjzyMshpSXuZqTfuRU22z1sgjbwxlPcWcMRFsDEGTRqSyzhc8HWkOgH_uK4T8fabZQ'),
(21, 'Rider', 'xaiy', 'xaiy1', '123', '', '', '', '', '', '', ''),
(22, 'Shop', 'ming', 'ming', '123', 'mingshop', 'somsanga', '123', '/mlao/Shop/editShop14249.jpg', '17.9460283', '102.6923225', 'fZFLdbbhQD6vvoo29DOhQk:APA91bGV6fDZ81FBxxGRbc7niKR2kPCM-msWd70BYB7JLDvm1YvP8RtQgm2FFegC83m1vQeg9IPjzyMshpSXuZqTfuRU22z1sgjbwxlPcWcMRFsDEGTRqSyzhc8HWkOgH_uK4T8fabZQ'),
(23, 'Shop', 'xaiy', 'xaiy0', '123', 'XSHOP', 'address', '123', '/mlao/Shop/editShop75615.jpg', '17.9461566', '102.6923732', 'fZFLdbbhQD6vvoo29DOhQk:APA91bGV6fDZ81FBxxGRbc7niKR2kPCM-msWd70BYB7JLDvm1YvP8RtQgm2FFegC83m1vQeg9IPjzyMshpSXuZqTfuRU22z1sgjbwxlPcWcMRFsDEGTRqSyzhc8HWkOgH_uK4T8fabZQ'),
(26, 'User', 'noy', 'noy', '123', '', '', '', '', '', '', 'fZFLdbbhQD6vvoo29DOhQk:APA91bGV6fDZ81FBxxGRbc7niKR2kPCM-msWd70BYB7JLDvm1YvP8RtQgm2FFegC83m1vQeg9IPjzyMshpSXuZqTfuRU22z1sgjbwxlPcWcMRFsDEGTRqSyzhc8HWkOgH_uK4T8fabZQ'),
(27, 'User', 'jo', 'jo', '123', '', '', '', '', '', '', ''),
(33, 'User', 'fff', 'dddd', '123', '', 'gyuu', '4558899', '', '', '', ''),
(34, 'User', 'vhjj', 'tyuii', 'tyyuuh', '', 'gyuioo', '', '', '', '', ''),
(35, 'User', 'vhjj', 'tyuiih', 'tyyuuh', '', 'gyuioo', '856589', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foodtable`
--
ALTER TABLE `foodtable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupfood`
--
ALTER TABLE `groupfood`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertable`
--
ALTER TABLE `ordertable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foodtable`
--
ALTER TABLE `foodtable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `groupfood`
--
ALTER TABLE `groupfood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1115;

--
-- AUTO_INCREMENT for table `ordertable`
--
ALTER TABLE `ordertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
