-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 22, 2021 at 02:54 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `idGrp` text COLLATE utf8_unicode_ci NOT NULL,
  `NameGroup` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ordertable`
--

INSERT INTO `ordertable` (`id`, `OrderDateTime`, `idUser`, `NameUser`, `idShop`, `NameShop`, `Distance`, `Transport`, `idFood`, `NameFood`, `Price`, `Amount`, `Sum`, `idRider`, `Status`, `idGrp`, `NameGroup`) VALUES
(1, '2021-06-22 10:53', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '4.23', '10030', '[34]', '[ຫອມລາບ]', '[1000]', '[1]', '[1000]', 'none', 'ReceiveOrder', '', ''),
(2, '2021-06-22 11:21', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '4.23', '10030', '[34]', '[ຫອມລາບ]', '[1000]', '[3]', '[3000]', 'none', 'Finish', '', ''),
(3, '2021-06-22 11:29', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '4.23', '10030', '[34]', '[ຫອມລາບ]', '[1000]', '[9]', '[9000]', 'none', 'CancelOrder', '', ''),
(4, '2021-06-22 11:33', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '4.23', '10030', '[34]', '[ຫອມລາບ]', '[1000]', '[2]', '[2000]', 'none', 'RiderOrder', '', ''),
(5, '2021-06-22 11:37', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '4.23', '10030', '[34]', '[ຫອມລາບ]', '[1000]', '[1]', '[1000]', 'none', 'UserOrder', '', ''),
(6, '2021-06-22 11:55', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '4.23', '10030', '[33]', '[ຫອມລາບ]', '[12000]', '[1]', '[12000]', 'none', 'UserOrder', '', ''),
(7, '2021-06-22 13:36', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '12280.28', '132790', '[33, 32, 31]', '[ຫອມລາບ, ຫອມປ້ອມ, ຫອມປ້ອມ]', '[12000, 2000, 20000]', '[7, 5, 1]', '[84000, 10000, 20000]', 'none', 'UserOrder', '', ''),
(8, '2021-06-22 13:36', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '12280.28', '132790', '[33, 32, 31]', '[ຫອມລາບ, ຫອມປ້ອມ, ຫອມປ້ອມ]', '[12000, 2000, 20000]', '[7, 5, 1]', '[84000, 10000, 20000]', 'none', 'UserOrder', '', ''),
(9, '2021-06-22 13:36', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '12280.28', '132790', '[33, 32, 31]', '[ຫອມລາບ, ຫອມປ້ອມ, ຫອມປ້ອມ]', '[12000, 2000, 20000]', '[7, 5, 1]', '[84000, 10000, 20000]', 'none', 'UserOrder', '', ''),
(10, '2021-06-22 13:36', '20', 'xaiy', '2', 'ຕະຫຼາດ ບຶງທາດຫລວງ', '12280.28', '132790', '[33, 32, 31]', '[ຫອມລາບ, ຫອມປ້ອມ, ຫອມປ້ອມ]', '[12000, 2000, 20000]', '[7, 5, 1]', '[84000, 10000, 20000]', 'none', 'UserOrder', '', '');

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
(2, 'Shop', 'xaiy', 'mlao', '123', 'ຕະຫຼາດ ບຶງທາດຫລວງ', 'ທາດຫລວງ', '123', '/mlao/Shop/editShop13760.jpg', '17.957523', '102.662928', 'null'),
(15, 'Shop', 'ຮ້ານ ນ້ອງນ້ອຍ', 'nongnoi', '123', 'ຮ້ານ ນ້ອງນ້ອຍ', 'ບ້ານ ໂພນຕ້ອງຈອມມະນີ', '55554341', '/mlao/Shop/editShop69972.jpg', '17.9460589', '102.6923375', 'e0jxyPIuQJCgQfG7TdJKWH:APA91bE1oCohUnKUUPfVzHRiMOouTC0ILOE81dG-p7tTa7MsseIBew_zvqy8Y-KKm_IAUVAv-0Mi9rDdwqOHe76nijg54Q6tNDb5ldF9-hkvsa0qaszTeSRBB3myqslhz6sv9xA95bxk'),
(16, 'Shop', 'ທ້າວ ຊາຍ', 'napong', '123', 'ປີ້ງໄກ່ນາປົ່ງ ສີບຸນເຮືອງ', 'ບ້ານ ສີບຸນເຮືອງ', '123', '/mlao/Shop/editShop99809.jpg', '17.9460635', '102.6923196', ''),
(20, 'User', 'xaiy', 'xaiy', '123', '', 'somsangar', '92949494', '', '', '', 'null'),
(21, 'Rider', 'xaiy', 'xaiy1', '123', '', '', '', '', '', '', ''),
(22, 'Shop', 'ming', 'ming', '123', 'mingshop', 'somsanga', '123', '/mlao/Shop/editShop14249.jpg', '17.9460283', '102.6923225', 'fZFLdbbhQD6vvoo29DOhQk:APA91bGV6fDZ81FBxxGRbc7niKR2kPCM-msWd70BYB7JLDvm1YvP8RtQgm2FFegC83m1vQeg9IPjzyMshpSXuZqTfuRU22z1sgjbwxlPcWcMRFsDEGTRqSyzhc8HWkOgH_uK4T8fabZQ'),
(23, 'Shop', 'xaiy', 'xaiy0', '123', 'XSHOP', 'address', '123', '/mlao/Shop/editShop75615.jpg', '17.9461566', '102.6923732', 'fZFLdbbhQD6vvoo29DOhQk:APA91bGV6fDZ81FBxxGRbc7niKR2kPCM-msWd70BYB7JLDvm1YvP8RtQgm2FFegC83m1vQeg9IPjzyMshpSXuZqTfuRU22z1sgjbwxlPcWcMRFsDEGTRqSyzhc8HWkOgH_uK4T8fabZQ'),
(26, 'User', 'noy', 'noy', '123', '', '', '', '', '', '', 'fZFLdbbhQD6vvoo29DOhQk:APA91bGV6fDZ81FBxxGRbc7niKR2kPCM-msWd70BYB7JLDvm1YvP8RtQgm2FFegC83m1vQeg9IPjzyMshpSXuZqTfuRU22z1sgjbwxlPcWcMRFsDEGTRqSyzhc8HWkOgH_uK4T8fabZQ'),
(27, 'User', 'jo', 'jo', '123', '', '', '', '', '', '', ''),
(33, 'User', 'fff', 'dddd', '123', '', 'gyuu', '4558899', '', '', '', ''),
(34, 'User', 'vhjj', 'tyuii', 'tyyuuh', '', 'gyuioo', '', '', '', '', ''),
(35, 'User', 'vhjj', 'tyuiih', 'tyyuuh', '', 'gyuioo', '856589', '', '', '', ''),
(36, 'User', 'Ung', 'ung01', '123456', '', '123/456 BBK', '123456', '', '', '', 'null');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
