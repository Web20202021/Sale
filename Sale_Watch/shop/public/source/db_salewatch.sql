-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 16, 2020 lúc 05:25 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_salewatch`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(14, 14, '2017-03-23', 160000, 'COD', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 13, '2017-03-21', 400000, 'ATM', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 12, '2017-03-21', 520000, 'COD', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 11, '2017-03-21', 420000, 'COD', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(15, 15, '2017-03-24', 220000, 'COD', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(18, 15, 62, 5, 220000, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(17, 14, 2, 1, 160000, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(16, 13, 60, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 13, 59, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(14, 12, 60, 2, 200000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(13, 12, 61, 1, 120000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(12, 11, 61, 1, 120000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(11, 11, 57, 2, 150000, '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(15, 'ê', 'Nữ', 'huongnguyen@gmail.com', 'e', 'e', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(14, 'hhh', 'nam', 'huongnguyen@gmail.com', 'Lê thị riêng', '99999999999999999', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '23456789', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 'Khoa phạm', 'Nam', 'khoapham@gmail.com', 'Lê thị riêng', '1234567890', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '234567890-', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `trademark` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_product` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `glass_type` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `system` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `the_dial_diameter` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_surface_thickness` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `strap` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_color` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `function` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `trademark`, `code_product`, `gender`, `glass_type`, `system`, `the_dial_diameter`, `number_surface_thickness`, `strap`, `dial_color`, `function`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Calvin Klein K2Y211C3', 6, 'Calvin Klein', 'K2Y211C3', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '41mm', '9mm', 'Da', 'Đen', 'Lịch Ngày', 'Mẫu đồng hồ nam K2Y211C3 với kiểu dáng đơn giản mặt đồng hồ to tròn phong cách nam tính đến từ thương hiệu CK trẻ trung thời trang, kết họp dây da đen có vân mang lại vẻ lịch lãm.', 8060000, 0, 'K2Y211C3.jpg', 'máy', 1, NULL, NULL),
(2, 'Calvin Klein K7B21626', 6, 'Calvin Klein', 'K7B21626', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '42mm', '7mm', 'Thép Không Gỉ', 'Trắng', 'Lịch Ngày', 'Mẫu Calvin Klein K7B21626 phiên bản dây vỏ kim loại vàng hồng thời trang với thiết kế đơn giản 2 kim kết hợp cùng mẫu dây đeo dạng lưới.', 7830000, 0, 'K7B21626.jpg', 'máy', 0, NULL, NULL),
(3, 'Calvin Klein K5S34141', 6, 'Calvin Klein', 'K5S34141', 'Nam', 'Sapphire (Kính Chống Trầy)', 'Automatic (Tự động)', '42mm', '9.35mm', 'Thép Không Gỉ', 'Đen', 'Lịch Ngày', 'Nền số đồng hồ Calvin Klein K5S34141 màu đen nổi bật, kim chỉ và gạch số mỏng được mạ bạc, dây đeo kim loại chắc chắn, mang lại vẻ nam tính, lịch lãm, sang trọng cho phái mạnh.', 15890000, 0, 'K5S34141.jpg', 'máy', 0, NULL, NULL),
(4, 'Calvin Klein K3G23526', 6, 'Calvin Klein', 'K3G23526', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '34mm', '8mm', 'Thép Không Gỉ', 'Trắng', 'Lịch Ngày', 'Mẫu Calvin Klein K3G23526 phiên bản dây lắc mạ vàng cùng với thiết kế đơn giản 2 kim trẻ trung trên nền mặt số xà cừ tạo nên mẫu trang sức sang trọng cho phái đẹp.', 9180000, 0, 'K3G23526.jpg', 'máy', 0, NULL, NULL),
(5, 'Calvin Klein K2G17TC1', 6, 'Calvin Klein', 'K2G17TC1', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '43mm', '11mm', 'Dây cao su', 'Đen', 'Lịch Ngày', 'Mẫu Calvin Klein K2G17TC1 thiết kế 3 núm vặn điều chỉnh các chức năng đo thời gian Chronograph với kiểu dáng đồng hồ 6 kim, cùng với phần vỏ máy phối tone vàng hồng thời trang.', 9630000, 0, 'K2G17TC1.jpg', 'máy', 0, NULL, NULL),
(6, 'Calvin Klein K8N2364W', 6, 'Calvin Klein', 'K8N2364W', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '32mm', '6mm', 'Thép Không Gỉ', 'Trắng', 'Lịch Ngày', 'Mẫu Calvin Klein K8N2364W phiên bản tone màu vàng hồng thời trang cho các chi tiết dây vỏ lẫn núm vặn, mẫu dây lắc tăng thêm vẻ trẻ trung cho phái đẹp.', 13790000, 0, 'K8N2364W.jpg', 'máy', 0, NULL, NULL),
(7, 'Claude Bernard 20508.3M.CIELN', 4, 'Claude Bernard', '20508.3M.CIELN', 'Nữ', 'Sapphire (Kính Chống Trầy)', 'Quartz (Pin)', '34mm', '6.8mm', 'Thép Không Gỉ', 'Xanh', 'Lịch Ngày', 'Mẫu Claude Bernard 20508.3M.CIELN phiên bản dây đeo kim loại trẻ trung kiểu dây lưới mạ bạc, thiết kế đính hạt châu trên nền mặt số xanh có họa tiết tone màu thời trang cho phái đẹp.', 6160000, 0, '20508.3M.CIELN.jpg', 'máy', 0, NULL, NULL),
(8, 'Claude Bernard 63003.3M.BR', 4, 'Claude Bernard', '63003.3M.BR', 'Nam', 'Sapphire (Kính Chống Trầy)', 'Quartz (Pin)', '40.5mm', '8mm', 'Thép Không Gỉ', 'Trắng', 'Lịch Ngày', 'Đồng hồ Claude Bernard 63003.3M.BR với thiết kế sang trọng khi dây đeo làm bằng kim loại thép không gỉ, nền trắng mặt số cùng kim chỉ và gạch số được phủ đen nổi bật.', 7040000, 0, '63003.3M.BR.jpg', 'máy', 0, NULL, NULL),
(9, 'Claude Bernard 70169.3.NIN', 4, 'Claude Bernard', '70169.3.NIN', 'Nam', 'Sapphire (Kính Chống Trầy)', 'Quartz (Pin)', '36mm', '8mm', 'Thép Không Gỉ', 'Đen', 'Lịch Ngày', 'Đồng hồ Claude Bernard 70169.3.NIN có vỏ và dây đeo kim loại màu bạc sáng bóng, kim chỉ và vạch số phủ màu trắng nổi bật trên nền số màu đen, tạo nên phụ kiện thời trang sang trọng, lịch lãm cho phái mạnh.', 7040000, 0, '70169.3.NIN.jpg', 'máy', 0, NULL, NULL),
(10, 'Claude Bernard 20503.3.NPN2', 4, 'Claude Bernard', '20503.3.NPN2', 'Nữ', 'Sapphire (Kính Chống Trầy)', 'Quartz (Pin)', '21mm x 30mm', '8mm', 'Thép Không Gỉ', 'Đen', 'Lịch Ngày', 'Đồng hồ Claude Bernard 20503.3.NPN2 có mặt số hình chữ nhật độc đáo, kim chỉ thon gọn và vạch số Swarovski quyến rũ nổi bật trên nền số màu đen, dây đeo kim loại dạng lưới thời trang sang trọng cho phái nữ.', 6160000, 0, '20503.3.NPN2.jpg', 'máy', 0, NULL, NULL),
(11, 'Claude Bernard 20217.37RM.NIR', 4, 'Claude Bernard', '20217.37RM.NIR', 'Nữ', 'Sapphire (Kính Chống Trầy)', 'Quartz (Pin)', '36mm', '6mm', 'Thép Không Gỉ', 'Đen', 'Lịch Ngày', 'Mẫu Claude Bernard 20217.37RM.NIR phiên bản mỏng thời trang với phần vỏ máy pin chỉ 6mm mạ tone màu vàng hồng, thiết kế đơn giản trẻ trung kiểu dáng đồng hồ 3 kim trên mặt số size 36mm.', 7920000, 0, '20217.37RM.NIR.jpg', 'máy', 1, NULL, NULL),
(12, 'Claude Bernard 20218.3M.AIN', 4, 'Claude Bernard', '20218.3M.AIN', 'Nữ', 'Sapphire (Kính Chống Trầy)', 'Quartz (Pin)', '24 mm x 21 mm', '6mm', 'Thép Không Gỉ', 'Trắng', 'Lịch Ngày', 'Mẫu Claude Bernard 20217.37RM.NIR phiên bản mỏng thời trang với phần vỏ máy pin chỉ 6mm mạ tone màu vàng hồng, thiết kế đơn giản trẻ trung kiểu dáng đồng hồ 3 kim trên mặt số size 36mm.', 6380000, 0, '20218.3M.AIN.jpg', 'máy', 0, NULL, NULL),
(13, 'Claude Bernard 65001.37J.GID2', 4, 'Claude Bernard', '65001.37J.GID2', 'Nam', 'Sapphire (Kính Chống Trầy)', 'Quartz (Pin)', '42mm', '6mm', 'Da', 'Đen', 'Lịch Ngày', 'Đồng hồ Claude Bernard 65001.37J.GID2 dành cho nam với kiểu dáng sang trọng, vỏ máy bằng thép không gỉ mạ vàng nổi bật trên nền đen nam tính, phối cùng dây đeo bằng da màu đen đem lại phong cách lịch lãm sang trọng.', 7260000, 0, '65001.37J.GID2.jpg', 'máy', 0, NULL, NULL),
(14, 'Claude Bernard 20203.NA.N', 4, 'Claude Bernard', '20203.NA.N', 'Nữ', 'Sapphire (Kính Chống Trầy)', 'Quartz (Pin)', '31.5mm', '8mm', 'Dây đá', 'Đen', 'Lịch Ngày', 'Đồng hồ Claude Bernard 20203.NA.N có viền kim loại và vạch số được đính pha lê Swarovski quyến rũ, kim chỉ thon gọn nổi bật trên nền số màu đen, dây đeo bằng chất liệu đá ceramic thời trang quyến rũ cho phái nữ.', 8800000, 0, '20203.NA.N.jpg', 'máy', 0, NULL, NULL),
(15, 'Claude Bernard 16062.3P.NP', 4, 'Claude Bernard', '16062.3P.NP', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '27mm', '6.5mm', 'Thép Không Gỉ', 'Đen', 'Lịch Ngày', 'Đồng hồ Claude Bernard 16062.3P.NP thiết kế dành cho nữ với phong cách thanh mảnh, vỏ máy bằng thép không gỉ, mặt đồng hồ đính hình kim cương kết hợp với dây kim loại màu bạc chủ đạo như 1 phụ kiện thời trang cho phái nữ.', 8360000, 0, '16062.3P.NP.jpg', 'máy', 0, NULL, NULL),
(16, 'Claude Bernard 10237.37R.NIKAR', 4, 'Claude Bernard', '10237.37R.NIKAR', 'Nam', 'Sapphire (Kính Chống Trầy)', 'Quartz (Pin)', '40mm', '10mm', 'Thép Không Gỉ', 'Đen', '', 'Mẫu Claude Bernard 10237.37R.NIKAR phiên bản vàng hồng tone màu thời trang sang trọng trên chi tiết vỏ máy pin kiểu dáng thiết kế 10mm, mặt số size 40mm kiểu dáng 6 kim đi kèm chức năng Chronograph.', 13200000, 0, '10237.37R.NIKAR.jpg', 'máy', 0, NULL, NULL),
(17, 'Seiko SRPD73K2', 5, 'Seiko', 'SRPD73K2', 'Nam', 'Hardlex Crystal (Kính Cứng)', 'Automatic (Tự động)', '42.5 mm', '13.4 mm', 'Cao su', 'Đen', 'Lịch Ngày - Lịch Thứ', 'Mẫu Seiko SRPD73K2 nam tính dày dặn với thiết kế máy cơ kích thước 13mm vỏ máy mạ bạc sang trọng cùng khả năng chịu nước lên đến 10atm.', 7060000, 0, 'SRPD73K2.jpg', 'máy', 1, NULL, NULL),
(18, 'Seiko SRK037P1', 5, 'Seiko', 'SRK037P1', 'Nam', 'Sapphire (Kính chống trầy)', 'Quartz (Pin)', '38.2 mm', '7.9 mm', 'Da', 'Xanh', '', 'Mẫu Seiko SRK037P1 phiên bản dây đeo chất liệu da vân đen nam tính, vẻ ngoài lịch lãm nhưng cũng không kém cạnh về sự trẻ trung dành cho phái mạnh với nền cọc số la mã được tạo nét mỏng cách tân.', 9720000, 0, 'SRK037P1.jpg', 'máy', 0, NULL, NULL),
(19, 'Seiko SKS545P1', 5, 'Seiko', 'SKS545P1', 'Nam', 'Hardlex Crystal (Kính Cứng)', 'Quartz (Pin)', '42 mm', '12 mm', 'Kim loại', 'Đen', 'Lịch Ngày', 'Đồng hồ nam Seiko SKS545P1 với kích thước đồng hồ to dày dặn, mặt số tông nền đen mạnh mẽ với 6 kim chỉ kèm theo tính năng Chronograph mang lại nhiều tiện ích cho người dùng, phối cùng dây đeo kim loại màu bạc tăng thêm vẻ nam tính.', 4820000, 0, 'SKS545P1.jpg', 'máy', 0, NULL, NULL),
(20, 'Seiko SSC445P1', 5, 'Seiko', 'SSC445P1', 'Nam', 'Hardlex Crystal (Kính Cứng)', 'Solar (Năng lượng ánh sáng)', '43 mm', '13 mm', 'Kim loại', 'Xanh', 'Lịch Ngày', 'Mẫu Seiko SSC445P1 phiên bản mặt xanh thời trang đầy nam tính với kiểu dáng 6 kim đi kèm thiết kế 3 núm vặn điều chỉnh chức năng Chronograph.', 8540000, 0, 'SSC445P1.jpg', 'máy', 0, NULL, NULL),
(21, 'Seiko SNE491P1', 5, 'Seiko', 'SNE491P1', 'Nam', 'Hardlex Crystal (Kính Cứng)', 'Solar (Năng lượng ánh sáng)', '42 mm', '10.6 mm', 'Da', 'Xanh', 'Lịch Ngày', 'Mẫu Seiko SNE491P1 mặt số xanh size 42mm tone màu thời trang cho phái mạnh, phiên bản nổi bật bộ máy pin trang bị công nghệ Solar (Năng Lượng Ánh Sáng).', 5240000, 0, 'SNE491P1.jpg', 'máy', 0, NULL, NULL),
(22, 'Seiko SNP143P1', 5, 'Seiko', 'SNP143P1', 'Nam', 'Sapphire (Kính chống trầy)', 'Kinetic (Vừa pin - Vừa tự động)', '42.9 mm', '12.3 mm', 'Da', 'Trắng', 'Lịch Ngày - Lịch Thứ - Đồng hồ 24h', 'Cọc số được thiết kế kiểu chữ cổ la mã phối cùng mẫu dây da đen có vân là yếu tố tạo nên vẻ ngoài lịch lãm, mang lại ấn tượng độc đáo với mẫu đồng hồ Seiko SNP143P1 sử fụng dạng năng lượng Kinetic (Vừa Pin – Vừa Tự Động).', 22090000, 0, 'SNP143P1.jpg', 'máy', 0, NULL, NULL),
(23, 'Seiko SKA781P1', 5, 'Seiko', 'SKA781P1', 'Nam', 'Hardlex Crystal (Kính Cứng)', 'Kinetic (Vừa pin - Vừa tự động)', '40 mm', '11 mm', 'Da', 'Đen', '', 'Mẫu Seiko SKA781P1 phiên bản đồng hồ Kinetic (Vừa Pin – Vừa Tự Động) thiết kế độc đáo dành cho phái mạnh, mặt số nền đen 40mm đi kèm chi tiết 2 núm vặn điều chỉnh được mạ bạc.', 5940000, 0, 'SKA781P1.jpg', 'máy', 0, NULL, NULL),
(24, 'Seiko SNP139P1', 5, 'Seiko', 'SNP139P1', 'Nam', 'Sapphire (Kính chống trầy)', 'Kinetic (Vừa pin - Vừa tự động)', '42.9 mm', '12.3 mm', 'Kim loại', 'Trắng', 'Lịch Ngày - Lịch Thứ - Đồng hồ 24h', 'Mẫu Seiko SNP139P1 tạo nên sự độc đáo với phần năng lượng đồng hồ trang bị công nghệ Kinetic (Vừa Pin – Vừa Tự Động), phiên bản kim chỉ xanh nổi bật trên nền kính Sapphire.', 20690000, 0, 'SNP139P1.jpg', 'máy', 0, NULL, NULL),
(25, 'Seiko SKA873P1', 5, 'Seiko', 'SKA873P1', 'Nữ', 'Sapphire (Kính chống trầy)', 'Kinetic (Vừa pin - Vừa tự động)', '37.2 mm', '11 mm', 'Kim loại', 'Xanh', 'Lịch Ngày', 'Mẫu Seiko SKA873P1 phiên bản sang trọng 11 viên kim cương đính trên nền mặt số tone xanh thời trang, thiết kế độc đáo đồng hồ sử dụng năng lương Kinetic (Vừa Pin – Vừa Tự Động).', 13870000, 0, 'SKA873P1.jpg', 'máy', 1, NULL, NULL),
(26, 'Seiko SUR688P1', 5, 'Seiko', 'SUR688P1', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '28 mm', '7.5 mm', 'Kim loại', 'Vàng', 'Lịch Ngày', 'Vẻ đẹp sang trọng ẩn mình với vẻ ngoài giản dị của chiếc đồng hồ 3 kim Seiko SUR688P1 cùng với thiết kế tỉ mỉ đính kèm các viên pha lê xung quanh đầy nổi bật khoác lên vẻ kiêu sa.', 4940000, 0, 'SUR688P1.jpg', 'máy', 0, NULL, NULL),
(27, 'Seiko SRP890J1', 5, 'Seiko', 'SRP890J1', 'Nữ', 'Sapphire (Kính chống trầy)', 'Automatic (Tự động)', '34 mm', '10 mm', 'Kim loại', 'Đen', 'Lịch Ngày - Lịch Thứ', 'Đồng hồ cao cấp Seiko SRP890J1 dành cho nữ giới với mặt đồng hồ nền đen nâu viền vàng đồng nổi bật, dây đeo demi thời trang, 3 kim vàng và 2 lịch ngày, thứ.', 11520000, 0, 'SRP890J1.jpg', 'máy', 0, NULL, NULL),
(28, 'Seiko SUP277P1', 5, 'Seiko', 'SUP277P1', 'Nữ', 'Hardlex Crystal (Kính Cứng)', 'Solar (Năng lượng ánh sáng)', '27.4 mm', '7 mm', 'Titanium', 'Trắng', '', 'Đồng hồ Seiko SUP277P1 có mặt số tròn nhỏ nhắn với vỏ và dây đeo bằng chất liệu Titanium siêu nhẹ siêu bền, kim chỉ và vạch số thanh mãnh nổi bật trên nền số màu trắng trang nhã, tạo nên vẻ quyến rũ, sang trọng cho phái nữ.', 7056000, 0, 'SUP277P1.jpg', 'máy', 1, NULL, NULL),
(29, 'Seiko SXDG96P1', 5, 'Seiko', 'SXDG96P1', 'Nữ', 'Hardlex Crystal (Kính Cứng)', 'Quartz (Pin)', '28.7 mm', '8 mm', 'Da', 'Vàng', 'Lịch Ngày', 'Mẫu Seiko SXDG96P1 vẻ thanh lịch trẻ trung cho phái đẹp với mẫu dây da nâu bản nhỏ có vân, chi tiết vạch số mỏng mạ vàng thời trang sang trọng phần vỏ máy độ dày chỉ 7mm.', 4740000, 0, 'SXDG96P1.jpg', 'máy', 0, NULL, NULL),
(30, 'Seiko SUT326P1', 5, 'Seiko', 'SUT326P1', 'Nữ', 'Hardlex Crystal (Kính Cứng)', 'Solar (Năng lượng ánh sáng)', '31 mm', '8 mm', 'Kim loại', 'Trắng', 'Lịch Ngày', 'Mẫu Seiko SUT326P1 mang lại một vẻ tinh tế cho phái đẹp với chi tiết vạch số cùng núm vặn được bao phủ tông màu vàng hồng sang trọng trẻ trung, tạo nên điểm nhấn với đồng hồ được trang bị công nghệ Solar (Năng Lượng Ánh Sáng).', 7720000, 0, 'SUT326P1.jpg', 'máy', 0, NULL, NULL),
(31, 'Seiko SSA812J1', 5, 'Seiko', 'SSA812J1', 'Nữ', 'Sapphire (Kính chống trầy)', 'Automatic (Tự động)', '34 mm', '10 mm', 'Da', 'Trắng', '', 'Mang đến cho phái đẹp với thiết kế độc đáo cùng ô chân kính trong suốt phô diễn ra 1 phần bên trong của bộ máy cơ chứa đựng cả một trải nghiệm thú vị dành cho mẫu Seiko SSA812J1.', 16420000, 0, 'SSA812J1.jpg', 'máy', 0, NULL, NULL),
(32, 'Citizen NH8350-08E', 3, 'Citizen', 'NH8350-08E', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Automatic (Tự động)', '40 mm', '12 mm', 'Da', 'Đen', 'Lịch Ngày - Lịch Thứ', 'Đồng hồ nam Citizen NH8350-08E có vỏ kim loại màu bạc sáng bóng, kim chỉ và vạch số mạ bạc nổi bật trên nền đen, kết hợp với dây đeo bằng chất liệu da màu đen đem lại phong cách cổ điển lịch lãm cho phái mạnh.', 5250000, 0, 'NH8350-08E.jpg', 'máy', 0, NULL, NULL),
(33, 'Citizen AU1080-11L', 3, 'Citizen', 'AU1080-11L', 'Nam', 'Sapphire (Kính chống trầy)', 'Eco-Drive (Năng lượng ánh sáng', '38 mm', '6.9 mm', 'Da', 'Xanh', 'Lịch Ngày', 'Đồng hồ nam Citizen AU1080-11L nổi bật với công nghệ Pin hiện đại Eco-Drive (Năng Lượng Ánh Sáng), kim chỉ vạch số thiết kế giản dị trên nền kính Sapphire, màu mặt số kết hợp với dây đeo bằng da cùng tone xanh thời trang.', 5600000, 0, 'AU1080-11L.jpg', 'máy', 0, NULL, NULL),
(34, 'Citizen NJ0090-81A', 3, 'Citizen', 'NJ0090-81A', 'Nam', 'Sapphire (Kính chống trầy)', 'Automatic (Tự động)', '42 mm', '10.6 mm', 'Titanium', 'Trắng', 'Lịch Ngày', 'Mẫu Citizen NJ0090-81A giản dị đầy tinh tế với thiết kế các chi tiết vạch số tạo hình mỏng, kèm theo chất liệu dây đeo Titanium tạo cảm giác nhẹ nhàng thoải mái cho phái nam.', 11950000, 0, 'NJ0090-81A.jpg', 'máy', 0, NULL, NULL),
(35, 'Citizen NH8397-80H', 3, 'Citizen', 'NH8397-80H', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Automatic (Tự động)', '40.2 mm', '13.1 mm', 'Kim loại', 'Xám', 'Lịch Ngày - Lịch Thứ', 'Mẫu Citizen C7 NH8397-80H phiên bản dây đeo dạng lưới tone màu đen trẻ trung phối cùng thiết kế đơn giản chức năng 3 kim trên nền mặt số size 40mm với họa tiết trải tia nhẹ.', 9177000, 0, 'NH8397-80H.jpg', 'máy', 0, NULL, NULL),
(36, 'Citizen FE6089-84A', 3, 'Citizen', 'FE6089-84A', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Eco-Drive (Năng lượng ánh sáng', '36 mm', '7 mm', 'Kim loại', 'Trắng', 'Lịch Ngày', 'Mẫu Citizen FE6089-84A ấn tượng với đồng hồ sử dụng công nghệ Eco-Drive (Năng Lượng Ánh Sáng), khoác lên sự sang trọng với vỏ máy cùng dây đeo mạ vàng nổi bật, dây đeo bằng thép không gỉ với kiểu dáng dây lưới thời trang.', 6090000, 0, 'FE6089-84A.jpg', 'máy', 0, NULL, NULL),
(37, 'Citizen NH8350-08E', 3, 'Citizen', 'NH8350-08E', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Automatic (Tự động)', '40 mm', '12 mm', 'Da', 'Đen', 'Lịch Ngày - Lịch Thứ', 'Đồng hồ nam Citizen NH8350-08E có vỏ kim loại màu bạc sáng bóng, kim chỉ và vạch số mạ bạc nổi bật trên nền đen, kết hợp với dây đeo bằng chất liệu da màu đen đem lại phong cách cổ điển lịch lãm cho phái mạnh.', 5250000, 0, 'NH8350-08E.jpg', 'máy', 1, NULL, NULL),
(38, 'Citizen AU1080-11L', 3, 'Citizen', 'AU1080-11L', 'Nam', 'Sapphire (Kính chống trầy)', 'Eco-Drive (Năng lượng ánh sáng', '38 mm', '6.9 mm', 'Da', 'Xanh', 'Lịch Ngày', 'Đồng hồ nam Citizen AU1080-11L nổi bật với công nghệ Pin hiện đại Eco-Drive (Năng Lượng Ánh Sáng), kim chỉ vạch số thiết kế giản dị trên nền kính Sapphire, màu mặt số kết hợp với dây đeo bằng da cùng tone xanh thời trang.', 5600000, 0, 'AU1080-11L.jpg', 'máy', 0, NULL, NULL),
(39, 'Citizen NJ0090-81A', 3, 'Citizen', 'NJ0090-81A', 'Nam', 'Sapphire (Kính chống trầy)', 'Automatic (Tự động)', '42 mm', '10.6 mm', 'Titanium', 'Trắng', 'Lịch Ngày', 'Mẫu Citizen NJ0090-81A giản dị đầy tinh tế với thiết kế các chi tiết vạch số tạo hình mỏng, kèm theo chất liệu dây đeo Titanium tạo cảm giác nhẹ nhàng thoải mái cho phái nam.', 11950000, 0, 'NJ0090-81A.jpg', 'máy', 0, NULL, NULL),
(40, 'Citizen NH8397-80H', 3, 'Citizen', 'NH8397-80H', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Automatic (Tự động)', '40.2 mm', '13.1 mm', 'Kim loại', 'Xám', 'Lịch Ngày - Lịch Thứ', 'Mẫu Citizen C7 NH8397-80H phiên bản dây đeo dạng lưới tone màu đen trẻ trung phối cùng thiết kế đơn giản chức năng 3 kim trên nền mặt số size 40mm với họa tiết trải tia nhẹ.', 9177000, 0, 'NH8397-80H.jpg', 'máy', 0, NULL, NULL),
(41, 'Citizen FE6089-84A', 3, 'Citizen', 'FE6089-84A', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Eco-Drive (Năng lượng ánh sáng', '36 mm', '7 mm', 'Kim loại', 'Trắng', 'Lịch Ngày', 'Mẫu Citizen FE6089-84A ấn tượng với đồng hồ sử dụng công nghệ Eco-Drive (Năng Lượng Ánh Sáng), khoác lên sự sang trọng với vỏ máy cùng dây đeo mạ vàng nổi bật, dây đeo bằng thép không gỉ với kiểu dáng dây lưới thời trang.', 6090000, 0, 'FE6089-84A.jpg', 'máy', 0, NULL, NULL),
(42, 'Citizen EM0550-16N', 3, 'Citizen', 'EM0550-16N', 'Nữ', 'Sapphire (Kính chống trầy)', 'Eco-Drive (Năng lượng ánh sáng', '32.5 mm', '8.3 mm', 'Da', 'Xanh', '', 'Mẫu Citizen EM0550-16N phiên bản vượt trội với mẫu đồng hồ được trang bị công nghệ Eco-drive (năng lượng ánh sáng), mẫu dây da trơn phối tone màu trắng góp phần tạo nên vẻ thời trang cho phái đẹp.', 7250000, 7040000, 'EM0550-16N.jpg', 'máy', 1, NULL, NULL),
(43, 'Citizen EM0579-14A', 3, 'Citizen', 'EM0579-14A', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Eco-Drive (Năng lượng ánh sáng', '30.2 mm', '7.5 mm', 'Da', 'Trắng', '', 'Mẫu Citizen EM0579-14A phiên bản dây da trơn bản nhỏ tone màu trắng thanh lịch dành cho phái đẹp đi kèm lối thiết kế giản dị 3 kim được mạ vàng hồng.', 5530000, 0, 'EM0579-14A.jpg', 'máy', 0, NULL, NULL),
(44, 'Citizen EJ6070-51E', 3, 'Citizen', 'EJ6070-51E', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '23 mm', '7 mm', 'Kim loại', 'Đen', '', 'Đồng hồ nữ Citizen EJ6070-51E có viền kim loại được đính pha lê Swarovski sang trọng, kim chỉ thanh mảnh và vạch số được điểm tô chấm tròn độc đáo, dây đeo kim loại với hình dáng mắc xích tạo nên vòng tay thời trang.', 3600000, 0, 'EJ6070-51E.jpg', 'máy', 0, NULL, NULL),
(45, 'Citizen FD2030-51H', 3, 'Citizen', 'FD2030-51H', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Eco-Drive (Năng lượng ánh sáng', '37 mm', '9 mm', 'Kim loại', 'Xám', 'Lịch Ngày - Lịch Thứ - Đồng hồ 24h', 'Đồng hồ Citizen FD2030-51H có mặt số tròn lớn, kim chỉ và vạch số được thiết kế độc đáo mạ bạc nổi bật trên nền số màu xám, dây đeo kim loại màu bạc sáng bóng đem lại phong cách quyến rũ thanh lịch cho phái nữ.', 7000000, 0, 'FD2030-51H.jpg', 'máy', 0, NULL, NULL),
(46, 'Citizen 13993 - 12844', 3, 'Citizen', '13993 - 12844', 'Đôi', 'Mineral Crystal (Kính Cứng)', 'Eco-Drive (Năng lượng ánh sáng', '37 mm - 28 mm', '9 mm - 7 mm', 'Da', 'Trắng', '', 'Đồng hồ đôi Citizen với phong cách cổ điển, nổi bật Pin sử dụng công nghệ Eco-Drive (Năng Lượng Ánh Sáng), vỏ máy mạ đồng sang trọng phối cùng dây da màu nâu, tạo cho cặp đôi vẻ thanh lịch đầy quý phái.', 14000000, 0, '13993 - 12844.jpg', 'máy', 0, NULL, NULL),
(47, 'Citizen 13796 - 13787', 3, 'Citizen', '13796 - 13787', 'Đôi', 'Sapphire (Kính chống trầy)', 'Eco-Drive (Năng lượng ánh sáng', '40 mm -34 mm', '9 mm - 8 mm', 'Kim loại', 'Đen', 'Lịch Ngày', 'Đồng hồ đôi Citizen với phong cách giản dị với Pin sử dụng công nghệ Eco-Drive (Năng Lượng Ánh Sáng), vỏ máy cùng dây đeo kim loại màu bạc mang lại cho cặp đôi vẻ sang trọng.', 14000000, 0, '13796 - 13787.jpg', 'máy', 0, NULL, NULL),
(48, 'Citizen 11324 - 13339', 3, 'Citizen', '11324 - 13339', 'Đôi', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '40 mm - 27 mm', '7.2 mm - 6.7 mm', 'Kim loại', 'Đen', 'Lịch Ngày', 'Đồng hồ đôi Citizen với xu hướng giản dị, kim chỉ được thiết kế mỏng phủ vàng nổi bật trên nền màu đen huyền bí, vỏ máy cùng với dây đeo bằng thép không gỉ mạ vàng đem lại cho cặp đôi sự giản dị đầy sang trọng.', 7300000, 0, '11324 - 13339.jpg', 'máy', 0, NULL, NULL),
(49, 'Casio EQS-920DB-1BVUDF', 2, 'Casio', 'EQS-920DB-1BVUDF', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Solar (Năng lượng ánh sáng)', '47.6 mm', '12.5 mm', 'Kim loại', 'Đen', 'Lịch Ngày', 'Mẫu Casio EQS-920DB-1BVUDF mặt số lớn size 47mm kiểu dáng 6 kim Chronograph đầy nam tính, nổi bật với phiên bản máy pin trang bị công nghệ Solar (Năng lượng ánh sáng).', 5758000, 4606000, 'EQS-920DB-1BVUDF.jpg', 'máy', 1, NULL, NULL),
(50, 'Casio MRW-200H-1B2VDF', 2, 'Casio', 'MRW-200H-1B2VDF', 'Nam', 'Resin Glass (Kính nhựa)', 'Quartz (Pin)', '44 mm', '11 mm', 'Cao su', 'Đen', 'Lịch Ngày - Lịch Thứ', 'Đồng hồ nam Casio MRW-200H-1B3VDF với kích thước mặt số to dày dặn đầy nam tính, ấn tượng với vỏ viền ngoài với tạo hình viền số kết hợp cùng bộ dây đeo bằng cao su năng động.', 776000, 619000, 'MRW-200H-1B2VDF.jpg', 'máy', 0, NULL, NULL),
(51, 'Casio MTP-1183E-7ADF', 2, 'Casio', 'MTP-1183E-7ADF', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '38 mm', '8 mm', 'Da', 'Trắng', 'Lịch Ngày', 'Đồng hồ Casio MTP-1183E-7ADF có vỏ kim loại màu bạc sáng bóng, bao quanh nền số màu trắng trang nhã, kim chỉ và vạch số mỏng tinh tế, còn có lịch ngày vị trí 3h, dây đeo bằng chất liệu da màu đen lịch lãm.', 870000, 696000, 'MTP-1183E-7ADF.jpg', 'máy', 0, NULL, NULL),
(52, 'Casio MTP-1129A-7ARDF', 2, 'Casio', 'MTP-1129A-7ARDF', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '36.8 mm', '7.2 mm', 'Kim loại', 'Trắng', 'Lịch Ngày', 'Đồng hồ Casio MTP-1129A-7ARDF có thiết kế kiểu cổ điển, mặt số tròn và dây đeo kim loại chắc chắn, kim chỉ và vạch số thanh mãnh nổi bật trên nền số.', 870000, 790000, 'MTP-1129A-7ARDF.jpg', 'máy', 0, NULL, NULL),
(53, 'Casio EFR-526L-7BVUDF', 2, 'Casio', 'EFR-526L-7BVUDF', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '48.5 mm', '11.6 mm', 'Da', 'Trắng', 'Lịch Ngày', 'Đồng hồ nam Casio EFR-526L-7BVUDF với thiết kế mặt đồng to tròn phong cách nam tính, kim chỉ và vạch số được in hiện thị to rõ tạo dáng vẻ mạnh mẽ, ô lịch ngày sắp ở vị trí 3 giờ, kết hợp với dây đeo bằng da nâu tạo nên phong cách cổ điển lịch lãm.', 3196000, 2557000, 'EFR-526L-7BVUDF.jpg', 'máy', 0, NULL, NULL),
(54, 'Casio AE-1000W-1A3VDF', 2, 'Casio', 'AE-1000W-1A3VDF', 'Nam', 'Resin Glass (Kính nhựa)', 'Quartz (Pin)', '43.7 mm', '13.7 mm', 'Cao su', 'Đen', 'Lịch – Bộ Bấm Giờ – Giờ Kép – Đèn Led – Vài Chức Năng Khác', 'Đồng hồ nam Casio AE-1000W-1A3VDF mặt số tròn to với phong cách thể thao, cùng mặt số điện tử với những tính năng hiện đại tiện dụng, vỏ máy bằng nhựa kết hợp với dây đeo cao su đem lại sự năng động cá tính cho các bạn nam.', 940000, 752000, 'AE-1000W-1A3VDF.jpg', 'máy', 0, NULL, NULL),
(55, 'Casio LTP-1165A-1C2DF', 2, 'Casio', 'LTP-1165A-1C2DF', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '32 mm', '8 mm', 'Kim loại', 'Đen', '', 'Đồng hồ nữ Casio LTP-1165A-1C2DF phong cách thời trang nhẹ nhàng nhưng sang trọng, mặt số bầu màu đen có chữ số hạt ở vị trí 12 và 6, kiểu dáng tinh tế giản dị 3 kim.', 1199000, 1080000, 'LTP-1165A-1C2DF.jpg', 'máy', 0, NULL, NULL),
(56, 'Casio LRW-200H-4E3VDF', 2, 'Casio', 'LRW-200H-4E3VDF', 'Nữ', 'Resin Glass (Kính nhựa)', 'Quartz (Pin)', '34.2 mm', '11.5 mm', 'Cao su', 'Hồng', 'Lịch Ngày', 'Mẫu Casio LRW-200H-4E3VDF thiết kế dây vỏ nhựa tone màu trắng năng động, mặt số đơn giản size 34mm kiểu dáng 3 kim 1 lịch.', 776000, 621000, 'LRW-200H-4E3VDF.jpg', 'máy', 0, NULL, NULL),
(57, 'Casio SHE-4056PG-2AUDF', 2, 'Casio', 'SHE-4056PG-2AUDF', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '32 mm', '8 mm', 'Da', 'Xanh', 'Lịch Ngày', 'Mẫu Casio SHE-4056PG-2AUDF phiên bản đính 11 viên pha lê tương ứng với các múi giờ trên mặt số xanh size 32mm, vỏ máy pin thiết kế mỏng chỉ 8mm được phối tone vàng hồng thời trang.', 4536000, 0, 'SHE-4056PG-2AUDF.jpg', 'máy', 0, NULL, NULL),
(58, 'Casio SHE-4800SG-7AUDR', 2, 'Casio', 'SHE-4800SG-7AUDR', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '33 mm', '8.9 mm', 'Kim loại', 'Trắng xà cừ', 'Lịch Ngày - Lịch Thứ', 'Đồng hồ nữ thời trang Casio SHE-4800SG-7AUDR với mẫu dây đeo demi vàng hồng, mặt đồng hồ có niềng mạ vàng đồng và đính hạt pha lê.', 4747000, 0, 'SHE-4800SG-7AUDR.jpg', 'máy', 0, NULL, NULL),
(59, 'Casio GA-700-1ADR', 2, 'Casio', 'GA-700-1ADR', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '57.4 mm', '18.4 mm', 'Cao su', 'Đen', 'Lịch – Bộ Bấm Giờ – Giờ Kép – Đèn Led – Vài Chức Năng Khác', 'Đồng hồ G-Shock GA-700-1ADR với thiết kế vỏ máy bằng nhựa kết hợp cùng dây đeo cao su khả năng chống nước cao, theo phong cách thể thao kết hợp mặt số điện tử với những tính năng tiện dụng.', 3196000, 2556000, 'GA-700-1ADR.jpg', 'máy', 0, NULL, NULL),
(60, 'Casio GST-S110-1ADR', 2, 'Casio', 'GST-S110-1ADR', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Solar (Năng lượng ánh sáng)', '59.1 mm', '16.1 mm', 'Cao su', 'Đen', 'Lịch – Bộ Bấm Giờ – Giờ Kép – Đèn Led – Vài Chức Năng Khác', 'Đồng hồ G-Shock GST-S110-1ADR có mặt tròn to phong cách thể thao độc đáo, nền đen mặt số, kim chỉ và vạch số được phủ phản quang nổi bật, độc đáo với 3 đồng hồ phụ bằng điện tử với các tính năng tiện dụng.', 8202000, 0, 'GST-S110-1ADR.jpg', 'máy', 0, NULL, NULL),
(61, 'Casio 10198 - 10013', 2, 'Casio', '10198 - 10013', 'Đôi', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '38 mm - 32 mm', '9.2 mm - 8.7 mm', 'Kim loại', 'Trắng', 'Lịch Ngày', 'Đồng hồ đôi Casio theo xu hướng thời trang, mặt đồng hồ tròn với kim chỉ thiết kế kiểu dáng mỏng phủ vàng, niổ bật với vỏ máy kết hợp cùng dây đeo demi thời trang cho các cặp đôi.', 3478000, 0, '10198 - 10013.jpg', 'máy', 0, NULL, NULL),
(62, 'Casio 12770 - 12771', 2, 'Casio', '12770 - 12771', 'Đôi', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '55 mm - 46.3 mm', '16.9 mm - 15.8 mm', 'Cao su', 'Trắng', 'Lịch – Bộ Bấm Giờ – Giờ Kép – Đèn Led – Vài Chức Năng Khác', 'Đồng hồ đôi Casio với kiểu dáng thời trang, mặt đồng hồ điện tử hiện thị với các chức năng tiện ích hiện đại, vỏ máy nhựa kết hợp cùng với dây đeo cao su cùng tông mảu xanh, đem lại cho cặp đôi năng động .', 9890000, 0, '12770 - 12771.jpg', 'máy', 0, NULL, NULL),
(63, 'Casio 13218 - 13222', 2, 'Casio', '13218 - 13222', 'Đôi', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '47.3 mm - 36 mm', '8.9 mm - 8.5 mm', 'Kim loại', 'Đỏ', '', 'Đồng hồ đôi Casio với kiểu dáng thời trang, mặt đồng hồ với cạnh ngoài bo tròn, vỏ máy cùng dây đeo kim loại mạ bạc nổi bật với nền mặt số màu đỏ, đem lại cho cặp đôi vẻ trẻ trung thời trang.', 4554000, 0, '13218 - 13222.jpg', 'máy', 0, NULL, NULL),
(64, 'Adriatica A3508.1143QZ', 7, 'Adriatica', 'A3508.1143QZ', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '17mm', '7mm', 'Thép Không Gỉ', 'Trắng', '', 'Đồng hồ nữ thời trang Adriatica A3508.1143QZ với kiểu dáng lắc tay tinh xảo, dây đeo có đính hạt sang trọng, mặt số ovan nền trắng, chất liệu thép không gỉ mạ vàng, 2 kim chỉ tinh tế.', 5310000, 0, 'A3508.1143QZ.jpg', 'máy', 1, NULL, NULL),
(65, 'Adriatica A8177.52B3CH', 7, 'Adriatica', 'A8177.52B3CH', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '46mm', '12mm', 'Da', 'Trắng', 'Lịch Ngày', 'Đồng hồ dây da nam Adriatica A8177.52B3CH cao cấp với chất lượng thép không gỉ, dây da màu đen có vân, kiểu dáng thể thao 6 kim chỉ, chữ số màu xanh dễ đọc, còn có 1 lịch ngày.', 10530000, 0, 'A8177.52B3CH.jpg', 'máy', 0, NULL, NULL),
(66, 'Adriatica A3811.51B3QZ', 7, 'Adriatica', 'A3811.51B3QZ', 'Nữ', 'Sapphire (Kính Chống Trầy)', 'Quartz (Pin)', '37mm', '8mm', 'Thép Không Gỉ', 'Trắng', 'Lịch Ngày', 'Mẫu đồng hồ nữ Adriatica A3811.51B3QZ với kim chỉ và vạch số cùng tông màu tím trẻ trung nổi bật trên nền mặt số màu trắng, mặt đồng hồ kiểu dáng tròn nhỏ nữ tính, với viền ngoài thiết kế tinh xảo, đem lại vẻ thời trang dành cho phái nữ.', 6310000, 0, 'A3811.51B3QZ.jpg', 'máy', 0, NULL, NULL),
(67, 'Adriatica A3415.1111QZ', 7, 'Adriatica', 'A3415.1111QZ', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '35mm', '8mm', 'Thép Không Gỉ', 'Vàng', 'Lịch Ngày', 'Đồng hồ Adriatica A3415.1111QZ có mặt số tròn với viền được đính pha lê sang trọng, tô điểm nền số màu vàng trang nhã, kim chỉ và vạch số được làm mỏng tinh tế, còn có lịch ngày vị trí 3h, dây đeo kim loại bằng chất liệu thép không gỉ cao cấp, đem đến nét quyến rũ dành cho phái nữ.', 6640000, 0, 'A3415.1111QZ.jpg', 'máy', 0, NULL, NULL),
(68, 'Adriatica A1233.52B3Q', 7, 'Adriatica', 'A1233.52B3Q', 'Nam', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '47.6mm', '5.6mm', 'Da', 'Trắng', 'Lịch Ngày', 'Đồng hồ nam Adriatica A1233.52B3Q với chất lượng cao cấp được làm bằng thép không gỉ và dây đeo dây da màu đen có vân, mặt số nền trắng cùng chi tiết màu xanh kết hợp tinh tế và 3 kim chỉ.', 4120000, 0, 'A1233.52B3Q.jpg', 'máy', 0, NULL, NULL),
(69, 'Adriatica A3143.1213Q', 7, 'Adriatica', 'A3143.1213Q', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '30mm', '7mm', 'Da', 'Trắng', 'Lịch Ngày', 'Đồng hồ nữ dây da Adriatica A3143.1213Q thanh lịch với mặt đồng hồ tròn nền trắng cùng với chữ số mạ vàng, chất liệu thép không gỉ cao cấp mạ vàng, còn có 3 kim chỉ màu vàng và 1 lịch ngày.', 4190000, 0, 'A3143.1213Q.jpg', 'máy', 0, NULL, NULL),
(70, 'Adriatica A3644.1141QZ', 7, 'Adriatica', 'A3644.1141QZ', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '33mm', '7mm', 'Thép Không Gỉ', 'Vàng', 'Lịch Ngày', 'Đồng hồ Adriatica A3644.1141QZ có vỏ và dây đeo kim loại màu vàng sang trọng, kim chỉ thanh mãnh và vạch số Swarovski quyến rũ nổi bật trên nền số màu trắng trang nhã, tạo nên phụ kiện thời trang sang trọng quyến rũ cho phái nữ.', 5370000, 0, 'A3644.1141QZ.jpg', 'máy', 0, NULL, NULL),
(71, 'Adriatica A3694.1113QZ', 7, 'Adriatica', 'A3694.1113QZ', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '35mm', '6mm', 'Thép Không Gỉ', 'Vàng', 'Lịch Ngày', 'Đồng hồ Adriatica A3694.1113QZ có mặt số tròn với viền được đính pha lê sang trọng, nền số màu trắng trang nhã, kim chỉ và vạch số được dát mỏng mạ vàng nổi bật, còn có lịch ngày vị trí 3h, dây đeo kim loại bằng chất liệu thép không gỉ cao cấp đem đến nét quyến rũ cho phái nữ.', 5480000, 0, 'A3694.1113QZ.jpg', 'máy', 1, NULL, NULL),
(72, 'Cadino C4471_2', 1, 'Cadino', 'C4471_2', 'Nam', 'Sapphire (Kính chống trầy)', 'Quartz (Pin)', '41 mm', '9 mm', 'Da', 'Trắng', '', 'Đồng hồ cao cấp nam dây da Candino C4471/2, với chất liệu cao cấp thép không gỉ mạ vàng, dây da nâu có vân, mặt kính Sapphire chịu lực chống trầy, chữ số và 3 kim chỉ giờ cũng được mạ vàng.', 5710000, 0, 'C4471_2.jpg', 'máy', 0, NULL, NULL),
(73, 'Cadino C4618_4', 1, 'Cadino', 'C4618_4', 'Nam', 'Sapphire (Kính chống trầy)', 'Quartz (Pin)', '40 mm', '8 mm', 'Da', 'Xanh', 'Lịch Ngày', 'Mẫu Candino C4618/4 nổi bật với nền mặt kính chất liệu kính Sapphire, các vạch số thiết kế kiểu dáng mỏng 1 cách tinh tế trên nền mặt số tông màu xanh trẻ trung, phối cùng bô dây đeo bằng da màu cùng tông xanh đậm tính thời trang cho các phái nam.', 6750000, 0, 'C4618_4.jpg', 'máy', 0, NULL, NULL),
(74, 'Cadino C4495_5', 1, 'Cadino', 'C4495_5', 'Nam', 'Sapphire (Kính chống trầy)', 'Automatic (Tự động)', '40 mm', '11 mm', 'Kim loại', 'Trắng', 'Lịch Ngày', 'Với vỏ và dây đeo kim loại đồng hồ Candino C4495/5 bằng chất liệu thép không gỉ mạ bạc sáng bóng, kim chỉ và vạch số mỏng tinh tế nổi bật trên nền số màu trắng trang nhã, còn có ô lịch ngày vị trí 3h, mặt kính Sapphire có thể chịu nước ở độ sâu 50m.', 13690000, 0, 'C4495_5.jpg', 'máy', 1, NULL, NULL),
(75, 'Cadino C4494_3', 1, 'Cadino', 'C4494_3', 'Nam', 'Sapphire (Kính chống trầy)', 'Automatic (Tự động)', '40 mm', '11 mm', 'Da', 'Trắng', 'Lịch Ngày', 'Đồng hồ Candino C4494/3 với mặt số tròn cổ điển kết hợp dây đeo da vân đen lịch lãm, kim chỉ và gạch số mỏng được mạ bạc cùng niềng kim loại mang đến vẻ sang trọng cho phái mạnh.', 12730000, 0, 'C4494_3.jpg', 'máy', 0, NULL, NULL),
(76, 'Cadino C4595_1', 1, 'Cadino', 'C4595_1', 'Nữ', 'Mineral Crystal (Kính Cứng)', 'Quartz (Pin)', '35 mm', '8 mm', 'Kim loại', 'Trắng', '', 'Đồng hồ Candino C4595/1 có viền kim loại được đính pha lê Swarovski sang trọng, bao quanh nền số màu trắng trang nhã, kim chỉ và vạch số được phủ màu đồng nổi bật, dây đeo kim loại màu bạc sang trọng đem lại thời trang sang trọng.', 8340000, 0, 'C4595_1.jpg', 'máy', 0, NULL, NULL),
(77, 'Cadino C4658_1', 1, 'Cadino', 'C4658_1', 'Nữ', 'Sapphire (Kính chống trầy)', 'Quartz (Pin)', '29 mm', '8 mm', 'Da', 'Trắng', '', 'Mẫu Candino C4658/1 chi tiết kim chỉ tạo nét thanh mãnh mạ vàng hồng phong cách thời trang trước nền mặt kính Sapphire, mẫu dây da trơn bản nhỏ tone màu trắng dành cho phái đẹp.', 6070000, 0, 'C4658_1.jpg', 'máy', 0, NULL, NULL),
(78, 'Cadino 6573 - 6577', 1, 'Cadino', '6573 - 6577', 'Đôi', 'Sapphire (Kính chống trầy)', 'Quartz (Pin)', '40 mm - 36 mm', '10 mm - 10 mm', 'Kim loại', 'Trắng', 'Lịch Ngày', 'Đồng hồ đôi Candino tinh tế với thiết kế thời trang sang trọng tinh tế, mặt đồng hồ nền trắng và mặt kính sapphire chịu lực chống trầy.', 12660000, 0, '6573 - 6577.jpg', 'máy', 1, NULL, NULL),
(79, 'Cadino 11999 - 13483', 1, 'Cadino', '11999 - 13483', 'Đôi', 'Sapphire (Kính chống trầy)', 'Quartz (Pin)', '39 mm - 30 mm', '8 mm - 7mm', 'Da', 'Vàng', 'Lịch Ngày', 'Đồng hồ đôi Candino theo phong cách giản dị, với chức năng lịch ngày sắp ở vị trí 3 giờ, mặt đồng hồ tròn vỏ máy bằng thép không gỉ mạ vàng sang trọng phối cùng dây da mảu đen, mang lại đầy phong cách cổ điển cho cặp đôi.', 9980000, 0, '11999 - 13483.jpg', 'máy', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Cadino', 'Nếu từng bị mê hoặc bởi các loại tarlet ngọt thì chắn chắn bạn không thể bỏ qua những loại tarlet mặn. Ngoài hình dáng bắt mắt, lớp vở bánh giòn giòn cùng với nhân mặn như thịt gà, nấm, thị heo ,… của bánh sẽ chinh phục bất cứ ai dùng thử.', 'banh-man-thu-vi-nhat-1.jpg', NULL, NULL),
(2, 'Casio', 'Bánh ngọt là một loại thức ăn thường dưới hình thức món bánh dạng bánh mì từ bột nhào, được nướng lên dùng để tráng miệng. Bánh ngọt có nhiều loại, có thể phân loại dựa theo nguyên liệu và kỹ thuật chế biến như bánh ngọt làm từ lúa mì, bơ, bánh ngọt dạng bọt biển. Bánh ngọt có thể phục vụ những mục đính đặc biệt như bánh cưới, bánh sinh nhật, bánh Giáng sinh, bánh Halloween..', '20131108144733.jpg', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'Citizen', 'Bánh trái cây, hay còn gọi là bánh hoa quả, là một món ăn chơi, không riêng gì của Huế nhưng khi \"lạc\" vào mảnh đất Cố đô, món bánh này dường như cũng mang chút tinh tế, cầu kỳ và đặc biệt. Lấy cảm hứng từ những loại trái cây trong vườn, qua bàn tay khéo léo của người phụ nữ Huế, món bánh trái cây ra đời - ngọt thơm, dịu nhẹ làm đẹp lòng biết bao người thưởng thức.', 'banhtraicay.jpg', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'Claude Bernard\r\n', 'Với người Việt Nam thì bánh ngọt nói chung đều hay được quy về bánh bông lan – một loại tráng miệng bông xốp, ăn không hoặc được phủ kem lên thành bánh kem. Tuy nhiên, cốt bánh kem thực ra có rất nhiều loại với hương vị, kết cấu và phương thức làm khác nhau chứ không chỉ đơn giản là “bánh bông lan” chung chung đâu nhé!', 'banhkem.jpg', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Seiko', 'Crepe là một món bánh nổi tiếng của Pháp, nhưng từ khi du nhập vào Việt Nam món bánh đẹp mắt, ngon miệng này đã làm cho biết bao bạn trẻ phải “xiêu lòng”', 'crepe.jpg', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'Calvin Klein\r\n', 'Pizza đã không chỉ còn là một món ăn được ưa chuộng khắp thế giới mà còn được những nhà cầm quyền EU chứng nhận là một phần di sản văn hóa ẩm thực châu Âu. Và để được chứng nhận là một nhà sản xuất pizza không hề đơn giản. Người ta phải qua đủ mọi các bước xét duyệt của chính phủ Ý và liên minh châu Âu nữa… tất cả là để đảm bảo danh tiếng cho món ăn này.', 'pizza.jpg', '2016-10-25 17:19:00', NULL),
(7, 'Adriatica\r\n', 'Bánh su kem là món bánh ngọt ở dạng kem được làm từ các nguyên liệu như bột mì, trứng, sữa, bơ.... đánh đều tạo thành một hỗn hợp và sau đó bằng thao tác ép và phun qua một cái túi để định hình thành những bánh nhỏ và cuối cùng được nướng chín. Bánh su kem có thể thêm thành phần Sô cô la để tăng vị hấp dẫn. Bánh có xuất xứ từ nước Pháp.', 'sukemdau.jpg', '2016-10-25 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Hương Hương', 'huonghuong08.php@gmail.com', '$2y$10$rGY4KT6ZSMmLnxIbmTXrsu2xdgRxm8x0UTwCyYCAzrJ320kYheSRq', '23456789', 'Hoàng Diệu 2', NULL, '2017-03-23 07:17:33', '2017-03-23 07:17:33');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
