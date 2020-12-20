-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 20, 2020 lúc 05:54 PM
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
-- Cơ sở dữ liệu: `db_salephone`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `bill_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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

INSERT INTO `bills` (`id`, `id_customer`, `bill_status`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(20, 20, 'Đã xử lý', '2020-12-20', 7380000, 'ATM', 'Không có', '2020-12-20 16:38:15', '2020-12-20 16:22:30');

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
(25, 20, 2, 2, 3690000, '2020-12-20 16:22:30', '2020-12-20 16:22:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
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

INSERT INTO `customer` (`id`, `customer_name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(20, 'vuong', 'nam', 'vuong@gmail.com', 'Thành phố Hồ Chí Minh', '1234566890', 'Không có', '2020-12-20 16:22:30', '2020-12-20 16:22:30');

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
  `operating_system` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `gpu` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ram` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rom` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `front_camera` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rear_camera` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpu` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `battery` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `warranty` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image_cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_product` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `operating_system`, `monitor`, `gpu`, `ram`, `rom`, `front_camera`, `rear_camera`, `cpu`, `battery`, `description`, `warranty`, `unit_price`, `promotion_price`, `image_cover`, `image_product`, `unit`, `new`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Samsung Galaxy A01', 1, 'Android 10', 'PLS TFT LCD / 5,7\" / HD+', 'Adreno 505', '2GB', '16GB', '5MP', 'Chính 13MP, Phụ 2MP', 'Snapdragon 439 8 nhân', '3000 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 2790000, 2000000, 'Samsung Galaxy A01 1.jfif', 'Samsung Galaxy A01 2.jfif', 'máy', 1, 0, NULL, NULL),
(2, 'Samsung Galaxy A10s', 1, 'Android 10', 'IPS TFT / 6,2\" / HD+', 'IMG PowerVR GE8320', '2GB', '32GB', '8MP', 'Chính 13MP, Phụ 2MP', 'MediaTek MT6762 8 nhân', '4000 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 3690000, 0, 'Samsung Galaxy A10s 1.jfif', 'Samsung Galaxy A10s 2.jfif', 'máy', 1, 0, NULL, NULL),
(3, 'Samsung Galaxy A11', 1, 'Android 10', 'PLS TFT LCD / 6,4\" / HD+', 'Adreno 506', '3GB', '32GB', '8MP', 'Chính 13MP, Phụ 5/2MP', 'Snapdragon 450 8 nhân', '4000 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 3690000, 0, 'Samsung Galaxy A11 1.jfif', 'Samsung Galaxy A11 2.jfif', 'máy', 0, 0, NULL, NULL),
(4, 'Samsung Galaxy A20s', 1, 'Android 10', 'IPS LCD / 6,5\" / HD+', 'Adreno 506', '3GB', '32GB', '8MP', 'Chính 13MP, Phụ 8/5MP', 'Snapdragon 450 8 nhân', '4000 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 4390000, 0, 'Samsung Galaxy A20s 1.jfif', 'Samsung Galaxy A20s 2.jfif', 'máy', 0, 0, NULL, NULL),
(5, 'Samsung Galaxy A21s', 1, 'Android 10', 'TFT LCD / 6,5\" / HD+', 'Mali-G52', '3GB', '32GB', '13MP', 'Chính 48MP, Phụ 8/2/2MP', 'Exynos 850 8 nhân', '5000 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 4690000, 0, 'Samsung Galaxy A21s 1.jfif', 'Samsung Galaxy A21s 2.jfif', 'máy', 0, 0, NULL, NULL),
(6, 'Samsung Galaxy A30s', 1, 'Android 10', 'Super AMOLED / 6,4\" / Full HD+', 'Mali-G71', '4GB', '64GB', '16MP', 'Chính 25MP, Phụ 8/5MP', 'Exynos 7904 8 nhân', '4000 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 6290000, 0, 'Samsung Galaxy A30s 1.jfif', 'Samsung Galaxy A30s 2.jfif', 'máy', 0, 0, NULL, NULL),
(7, 'Samsung Galaxy A31', 1, 'Android 10', 'Super AMOLED / 6,4\" / Full HD+', 'Mali-G52 MC2', '6GB', '128GB', '20MP', 'Chính 48MP, Phụ 8/5/5MP', 'MediaTek MT6768 8 nhân', '5000 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 6490000, 0, 'Samsung Galaxy A31 1.jfif', 'Samsung Galaxy A31 2.jfif', 'máy', 1, 0, NULL, NULL),
(8, 'Samsung Galaxy A50s', 1, 'Android 10', 'Super AMOLED / 6,4\" / Full HD+', 'Mali-G72 MP3', '4GB', '64GB', '32MP', 'Chính 48MP, Phụ 8/5MP', 'Exynos 9610 8 nhân', '4000 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 6990000, 0, 'Samsung Galaxy A50s 1.jfif', 'Samsung Galaxy A50s 2.jfif', 'máy', 0, 0, NULL, NULL),
(9, 'Samsung Galaxy A51', 1, 'Android 10', 'Super AMOLED / 6,5\" / Full HD+', 'Mali-G72', '6GB', '128GB', '32MP', 'Chính 48MP, Phụ 12/5/5MP', 'Exynos 9611 8 nhân', '4000 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 7390000, 0, 'Samsung Galaxy A51 1.jfif', 'Samsung Galaxy A51 2.jfif', 'máy', 0, 0, NULL, NULL),
(10, 'Samsung Galaxy A71', 1, 'Android 10', 'Super AMOLED / 6,7\" / Full HD+', 'Adreno 618', '8GB', '128GB', '32MP', 'Chính 64MP, Phụ 12/5/5MP', 'Snapdragon 730 8 nhân', '4500 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 8990000, 0, 'Samsung Galaxy A71 1.jfif', 'Samsung Galaxy A71 2.jfif', 'máy', 0, 0, NULL, NULL),
(11, 'Samsung Galaxy S20+', 1, 'Android 10', 'Dynamic AMOLED 2X / 6,7\" / Quad HD+', 'Mali-G77 MP11', '8GB', '128GB', '10MP', 'Chính 12MP, Phụ 64/12MP TOF 3D', 'Exynos 990 8 nhân', '4500 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 23990000, 0, 'Samsung Galaxy S20+ 1.jfif', 'Samsung Galaxy S20+ 2.jfif', 'máy', 0, 0, NULL, NULL),
(12, 'Samsung Galaxy S20 FE', 1, 'Android 10', 'Super AMOLED / 6,5\" / Full HD+', 'Mali-G77 MP11', '8GB', '128GB', '32MP', 'Chính 12MP, Phụ 12/8MP', 'Exynos 990 8 nhân', '4500 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 15990000, 0, 'Samsung Galaxy S20 FE 1.jfif', 'Samsung Galaxy S20 FE 2.jfif', 'máy', 0, 0, NULL, NULL),
(13, 'Samsung Galaxy Note 10 Lite', 1, 'Android 10', 'Super AMOLED / 6,7\" / Full HD+', 'Mali-G72 MP18', '8GB', '128GB', '32MP', '3 x 12MP', 'Exynos 9810 8 nhân', '4500 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng, bút cảm ứng', 'Bảo hành 12 tháng', 11490000, 0, 'Samsung Galaxy Note 10 Lite 1.jfif', 'Samsung Galaxy Note 10 Lite 2.jfif', 'máy', 0, 0, NULL, NULL),
(14, 'Samsung Galaxy Note 10+', 1, 'Android 10', 'Dynamic AMOLED / 6,8\" / Quad HD+', 'Mali-G76 MP12', '12GB', '256GB', '10MP', 'Chính 12MP, Phụ 12/16MP TOF 3D', 'Exynos 9825 8 nhân', '4300 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng, bút cảm ứng', 'Bảo hành 12 tháng', 16490000, 0, 'Samsung Galaxy Note 10+ 1.jfif', 'Samsung Galaxy Note 10+ 2.jfif', 'máy', 0, 0, NULL, NULL),
(15, 'Samsung Galaxy Note 20', 1, 'Android 10', 'Super AMOLED Plus / 6,7\" / Full HD+', 'Mali-G77 MP11', '8GB', '256GB', '10MP', 'Chính 12MP, Phụ 64/12MP', 'Exynos 990 8 nhân', '4300 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng, bút cảm ứng', 'Bảo hành 12 tháng', 23990000, 0, 'Samsung Galaxy Note 20 1.jfif', 'Samsung Galaxy Note 20 2.jfif', 'máy', 1, 0, NULL, NULL),
(16, 'Samsung Galaxy Note 20 Ultra', 1, 'Android 10', 'Dynamic AMOLED 2X / 6,9\" / Quad HD+', 'Mali-G77 MP11', '8GB', '256GB', '10MP', 'Chính 108MP, Phụ 12/12MP cảm biến Laser AF', 'Exynos 990 8 nhân', '4500 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng, bút cảm ứng', 'Bảo hành 12 tháng', 29990000, 0, 'Samsung Galaxy Note 20 Ultra 1.jfif', 'Samsung Galaxy Note 20 Ultra 2.jfif', 'máy', 0, 0, NULL, NULL),
(17, 'Samsung Galaxy Z Flip', 1, 'Android 10', 'Chính Dynamic AMOLED / 6,7\", Phụ Super AMOLED / 6,7\" / Quad HD', 'Adreno 640', '8GB', '256GB', '10MP', '2 x 12MP', 'Snapdragon 855+ 8 nhân', '3300 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 36000000, 0, 'Samsung Galaxy Z Flip 1.jfif', 'Samsung Galaxy Z Flip 2.jfif', 'máy', 0, 0, NULL, NULL),
(18, 'Samsung Galaxy Z Fold2 5G', 1, 'Android 10', 'Chính Dynamic AMOLED / 7,59\", Phụ Super AMOLED / 6,23\" / Full HD+', 'Adreno 650', '12GB', '256GB', '10MP', '3 x 12MP', 'Snapdragon 865+ 8 nhân', '4500 mAh', 'Hộp, sạc, cáp, tai nghe, sách hướng dẫn, điện thoại, cây lấy sim, ốp lưng', 'Bảo hành 12 tháng', 50000000, 0, 'Samsung Galaxy Z Fold2 5G 1.jfif', 'Samsung Galaxy Z Fold2 5G 2.jfif', 'máy', 0, 0, NULL, NULL),
(19, 'Realme C3', 2, 'Android 10', 'IPS  LCD / 6,5\" / HD+', 'Mali-G52 MC2', '3GB', '32GB', '5MP', 'Chính 12MP, Phụ 2/2MP', 'MediaTek Helio G70 8 nhân', '5000 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 2990000, 0, 'Realme C3 1.jfif', 'Realme C3 2.jfif', 'máy', 1, 0, NULL, NULL),
(20, 'Realme C11', 2, 'Android 10', 'IPS  LCD / 6,5\" / HD+', 'IMG PowerVR GE8320', '2GB', '32GB', '5MP', 'Chính 13MP, Phụ 2MP', 'MediaTek Helio G35 8 nhân', '5000 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 2690000, 0, 'Realme C11 1.jfif', 'Realme C11 2.jfif', 'máy', 0, 0, NULL, NULL),
(21, 'Realme C12', 2, 'Android 10', 'IPS  LCD / 6,52\" / HD+', 'IMG PowerVR GE8320', '3GB', '32GB', '5MP', 'Chính 13MP, Phụ 2/2MP', 'MediaTek Helio G35 8 nhân', '6000 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 3490000, 0, 'Realme C12 1.jfif', 'Realme C12 2.jfif', 'máy', 0, 0, NULL, NULL),
(22, 'Realme C15', 2, 'Android 10', 'IPS  LCD / 6,5\" / HD+', 'Adreno 610', '4GB', '64GB', '8MP', 'Chính 13MP, Phụ 8/2/2MP', 'Snapdragon 460 8 nhân', '6000 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 4190000, 0, 'Realme C15 1.jfif', 'Realme C15 2.jfif', 'máy', 0, 0, NULL, NULL),
(23, 'Realme C17', 2, 'Android 10', 'IPS  LCD / 6,5\" / HD+', 'Adreno 610', '6GB', '128GB', '8MP', 'Chính 13MP, Phụ 8/2/2MP', 'Snapdragon 460 8 nhân', '5000 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 5290000, 0, 'Realme C17 1.jfif', 'Realme C17 2.jfif', 'máy', 0, 0, NULL, NULL),
(24, 'Realme 5i', 2, 'Android 9', 'IPS  LCD / 6,52\" / HD+', 'Adreno 610', '4GB', '64GB', '8MP', 'Chính 12MP, Phụ 8/2/2MP', 'Snapdragon 665 AIE 8 nhân', '5000 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 3690000, 0, 'Realme 5i 1.jfif', 'Realme 5i 2.jfif', 'máy', 1, 0, NULL, NULL),
(25, 'Realme 6', 2, 'Android 10', 'IPS  LCD / 6,5\" / Full HD+', 'Mali-G76 MC4', '4GB', '128GB', '16MP', 'Chính 64MP, Phụ 8/2/2MP', 'MediaTek Helio G90T 8 nhân', '4300 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 5990000, 0, 'Realme 6 1.jfif', 'Realme 6 2.jfif', 'máy', 0, 0, NULL, NULL),
(26, 'Realme 6i', 2, 'Android 10', 'IPS  LCD / 6,5\" / HD+', 'Mali-G52 MC2', '4GB', '128GB', '16MP', 'Chính 48MP, Phụ 8/2/2MP', 'MediaTek Helio G80 8 nhân', '5000 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 4990000, 0, 'Realme 6i 1.jfif', 'Realme 6i 2.jfif', 'máy', 0, 0, NULL, NULL),
(27, 'Realme 6 Pro', 2, 'Android 10', 'IPS  LCD / 6,6\" / Full HD+', 'Adreno 618', '8GB', '128GB', 'Chính 16MP, Phụ 8MP', 'Chính 64MP, Phụ 12/8/2MP', 'Snapdragon 720G 8 nhân', '4300 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 7990000, 0, 'Realme 6 Pro 1.jfif', 'Realme 6 Pro 2.jfif', 'máy', 0, 0, NULL, NULL),
(28, 'Realme 7', 2, 'Android 10', 'IPS  LCD / 6,5\" / Full HD+', 'Mali-G76 MC4', '8GB', '128GB', '16MP', 'Chính 64MP, Phụ 8/2/2MP', 'MediaTek Helio G95 8 nhân', '5000 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 6990000, 0, 'Realme 7 1.jfif', 'Realme 7 2.jfif', 'máy', 0, 0, NULL, NULL),
(29, 'Realme 7i', 2, 'Android 10', 'IPS  LCD / 6,5\" / HD+', 'Adreno 610', '8GB', '128GB', '16MP', 'Chính 64MP, Phụ 8/2/2MP', 'Snapdragon 662 8 nhân', '5000 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 6290000, 0, 'Realme 7i 1.jfif', 'Realme 7i 2.jfif', 'máy', 0, 0, NULL, NULL),
(30, 'Realme 7 Pro', 2, 'Android 10', 'Super AMOLED / 6,44\" / Full HD+', 'Adreno 618', '8GB', '128GB', '32MP', 'Chính 64MP, Phụ 8/2/2MP', 'Snapdragon 720G 8 nhân', '4500 mAh', 'Hộp, sạc, sách hướng dẫn, cây lấy sim, cáp, điện thoại, sách hướng dẫn', 'Bảo hành 12 tháng', 8990000, 0, 'Realme 7 Pro 1.jfif', 'Realme 7 Pro 2.jfif', 'máy', 0, 0, NULL, NULL),
(31, 'OPPO A12', 3, 'Android 9', 'IPS LCD / 6,22\" / HD+', 'IMG PowerVR GE8320', '3GB', '32GB', '5MP', 'Chính 13MP, Phụ 2MP', 'MediaTek Helio P35 8 nhân', '4230 mAh', 'Tai nghe, Sách hướng dẫn, Củ sạc, Cáp USB type C, dụng cụ lấy sim, Miếng dán màn hình (Đã dán sẵn), Vỏ bảo vệ, Điện thoại', 'Bảo hành 12 tháng chính hãng', 2990000, 0, 'OPPO A12 1.jpg', 'OPPO A12 2.jpg', 'máy', 0, 0, NULL, NULL),
(32, 'OPPO A31', 3, 'Android 9', 'IPS LCD / 6,5\" / HD+', 'IMG PowerVR GE8320', '4GB', '128GB', '8MP', 'Chính 12MP, Phụ 2/2MP', 'MediaTek Helio P35 8 nhân', '4230 mAh', 'Tai nghe, Sách hướng dẫn, Củ sạc, Cáp USB type C, dụng cụ lấy sim, Miếng dán màn hình (Đã dán sẵn), Vỏ bảo vệ, Điện thoại', 'Bảo hành 12 tháng chính hãng', 4490000, 0, 'OPPO A31 1.jfif', 'OPPO A31 2.jfif', 'máy', 0, 0, NULL, NULL),
(33, 'OPPO A52', 3, 'Android 10', 'TFT LCD / 6,5\" / Full HD+', 'Adreno 610', '6GB', '128GB', '16MP', 'Chính 12MP, Phụ 8/2/2MP', 'Snapdragon 665 8 nhân', '5000 mAh', 'Tai nghe, Sách hướng dẫn, Củ sạc, Cáp USB type C, dụng cụ lấy sim, Miếng dán màn hình (Đã dán sẵn), Vỏ bảo vệ, Điện thoại', 'Bảo hành 12 tháng chính hãng', 5990000, 0, 'OPPO A52 1.jfif', 'OPPO A52 2.jfif', 'máy', 1, 0, NULL, NULL),
(34, 'OPPO A53', 3, 'Android 10', 'IPS LCD / 6,5\" / HD+', 'Adreno 610', '4GB', '128GB', '16MP', 'Chính 13MP, Phụ 2/2MP', 'Snapdragon 460 8 nhân', '5000 mAh', 'Tai nghe, Sách hướng dẫn, Củ sạc, Cáp USB type C, dụng cụ lấy sim, Miếng dán màn hình (Đã dán sẵn), Vỏ bảo vệ, Điện thoại', 'Bảo hành 12 tháng chính hãng', 4490000, 0, 'OPPO A53 1.jfif', 'OPPO A53 2.jfif', 'máy', 0, 0, NULL, NULL),
(35, 'OPPO A92', 3, 'Android 10', 'TFT LCD / 6,5\" / Full HD+', 'Adreno 610', '8GB', '128GB', '16MP', 'Chính 48MP, Phụ 8/2/2MP', 'Snapdragon 665 8 nhân', '5000 mAh', 'Tai nghe, Sách hướng dẫn, Củ sạc, Cáp USB type C, dụng cụ lấy sim, Miếng dán màn hình (Đã dán sẵn), Vỏ bảo vệ, Điện thoại', 'Bảo hành 12 tháng chính hãng', 6190000, 0, 'OPPO A92 1.jfif', 'OPPO A92 2.jfif', 'máy', 0, 0, NULL, NULL),
(36, 'OPPO A93', 3, 'Android 10', 'AMOLED / 6,43\" / Full HD+', 'IMG PowerVR GM9446', '8GB', '128GB', 'Chính 16MP, Phụ 2MP', 'Chính 48MP, Phụ 8/2/2MP', 'MediaTek Helio P95 8 nhân', '4000 mAh', 'Tai nghe, Sách hướng dẫn, Củ sạc, Cáp USB type C, dụng cụ lấy sim, Miếng dán màn hình (Đã dán sẵn), Vỏ bảo vệ, Điện thoại', 'Bảo hành 12 tháng chính hãng', 7490000, 0, 'OPPO A93 1.jfif', 'OPPO A93 2.jfif', 'máy', 0, 0, NULL, NULL),
(37, 'OPPO Reno4', 3, 'Android 10', 'AMOLED / 6,4\" / Full HD+', 'Adreno 618', '8GB', '128GB', 'Chính 32MP, Phụ cảm biến A.I.', 'Chính 48MP, Phụ 8/2/2MP', 'Snapdragon 720G 8 nhân', '4015 mAh', 'Tai nghe, Sách hướng dẫn, Củ sạc, Cáp USB type C, dụng cụ lấy sim, Miếng dán màn hình (Đã dán sẵn), Vỏ bảo vệ, Điện thoại', 'Bảo hành 12 tháng chính hãng', 8190000, 0, 'OPPO Reno4 1.jfif', 'OPPO Reno4 2.jfif', 'máy', 0, 0, NULL, NULL),
(38, 'OPPO Reno4 Pro', 3, 'Android 10', 'AMOLED / 6,5\" / Full HD+', 'Adreno 618', '8GB', '256GB', '32MP', 'Chính 48MP, Phụ 8/2/2MP', 'Snapdragon 720G 8 nhân', '4000 mAh', 'Tai nghe, Sách hướng dẫn, Củ sạc, Cáp USB type C, dụng cụ lấy sim, Miếng dán màn hình (Đã dán sẵn), Vỏ bảo vệ, Điện thoại', 'Bảo hành 12 tháng chính hãng', 11990000, 0, 'OPPO Reno4 Pro 1.jfif', 'OPPO Reno4 Pro 2.jfif', 'máy', 0, 0, NULL, NULL),
(39, 'OPPO Find X2', 3, 'Android 10', 'AMOLED / 6,78\" / Quad HD+', 'Adreno 650', '12GB', '256GB', '32MP', 'Chính 48MP, Phụ 13/12MP', 'Snapdragon 865 8 nhân', '4200 mAh', 'Tai nghe, Sách hướng dẫn, Củ sạc, Cáp USB type C, dụng cụ lấy sim, Miếng dán màn hình (Đã dán sẵn), Vỏ bảo vệ, Điện thoại', 'Bảo hành 12 tháng chính hãng', 23990000, 0, 'OPPO Find X2 1.jfif', 'OPPO Find X2 2.jfif', 'máy', 1, 0, NULL, NULL),
(40, 'Vsmart Bee 3', 4, 'Android 9', 'IPS LCD / 6\" / HD+', 'IMG PowerVR GE8100', '2GB', '16GB', '5MP', '8MP', 'MediaTek MT6739WW 4 nhân', '3000 mAh', 'Hộp, sạc, tai nghe, ốp lưng, điện thoại, cây lấy sim, sách hướng dẫn', 'Bảo hành 18 tháng', 1590000, 0, 'Vsmart Bee 3 1.jfif', 'Vsmart Bee 3 2.jfif', 'máy', 0, 0, NULL, NULL),
(41, 'Vsmart Active 3', 4, 'Android 9', 'AMOLED / 6,39\" / Full HD+', 'Mali-G72 MP3', '6GB', '64GB', '16MP', 'Chính 48MP, Phụ 8/2MP', 'MediaTek Helio P60 8 nhân', '4020 mAh', 'Hộp, sạc, tai nghe, ốp lưng, điện thoại, cây lấy sim, sách hướng dẫn', 'Bảo hành 18 tháng', 3990000, 0, 'Vsmart Active 3 1.jfif', 'Vsmart Active 3 2.jfif', 'máy', 0, 0, NULL, NULL),
(42, 'Vsmart Live 4', 4, 'Android 10', 'LTPS IPS LCD / 6,5\" / Full HD+', 'Adreno 612', '6GB', '64GB', '13MP', 'Chính 48MP, Phụ 8/5/2MP', 'Snapdragon 675 8 nhân', '5000 mAh', 'Hộp, sạc, tai nghe, ốp lưng, điện thoại, cây lấy sim, sách hướng dẫn', 'Bảo hành 18 tháng', 4790000, 0, 'Vsmart Live 4 1.jfif', 'Vsmart Live 4 2.jfif', 'máy', 0, 0, NULL, NULL),
(43, 'Vsmart Star 3', 4, 'Android 9', 'IPS LCD / 6,09\" / HD+', 'Adreno 308', '2GB', '16GB', '8MP', 'Chính 8MP, Phụ 5MP', 'Snapdragon 215 4 nhân', '3500 mAh', 'Hộp, sạc, tai nghe, ốp lưng, điện thoại, cây lấy sim, sách hướng dẫn', 'Bảo hành 18 tháng', 1990000, 0, 'Vsmart Star 3 1.jfif', 'Vsmart Star 3 2.jfif', 'máy', 0, 0, NULL, NULL),
(44, 'Vsmart Star 4', 4, 'Android 10', 'IPS LCD / 6,09\" / HD+', 'IMG PowerVR GE8320', '2GB', '32GB', '8MP', 'Chính 8MP, Phụ 5MP', 'MediaTek Helio P35 8 nhân', '3500 mAh', 'Hộp, sạc, tai nghe, ốp lưng, điện thoại, cây lấy sim, sách hướng dẫn', 'Bảo hành 18 tháng', 2050000, 0, 'Vsmart Star 4 1.jfif', 'Vsmart Star 4 2.jfif', 'máy', 1, 0, NULL, NULL),
(45, 'Vsmart Star 4', 4, 'Android 10', 'IPS LCD / 6,09\" / HD+', 'IMG PowerVR GE8320', '3GB', '32GB', '8MP', 'Chính 8MP, Phụ 5MP', 'MediaTek Helio P35 8 nhân', '3500 mAh', 'Hộp, sạc, tai nghe, ốp lưng, điện thoại, cây lấy sim, sách hướng dẫn', 'Bảo hành 18 tháng', 2490000, 0, 'Vsmart Star 4ver2 1.jfif', 'Vsmart Star 4ver2 2.jfif', 'máy', 0, 0, NULL, NULL),
(46, 'Vsmart Joy 3', 4, 'Android 9', 'IPS LCD / 6,5\" / HD+', 'Adreno 506', '4GB', '64GB', '8MP', 'Chính 13MP, Phụ 8/2MP', 'Snapdragon 632 8 nhân', '5000 mAh', 'Hộp, sạc, tai nghe, điện thoại, cây lấy sim, sách hướng dẫn', 'Bảo hành 18 tháng', 3290000, 0, 'Vsmart Joy 3 1.jfif', 'Vsmart Joy 3 2.jfif', 'máy', 0, 0, NULL, NULL),
(47, 'Vsmart Joy 4', 4, 'Android 10', 'LTPS IPS LCD / 6,53\" / Full HD+', 'Adreno 610', '3GB', '64GB', '13MP', 'Chính 16MP, Phụ 8/2/2MP', 'Snapdragon 665 8 nhân', '5000 mAh', 'Hộp, sạc, tai nghe, ốp lưng, điện thoại, cây lấy sim, sách hướng dẫn', 'Bảo hành 18 tháng', 3290000, 0, 'Vsmart Joy 4 1.jfif', 'Vsmart Joy 4 2.jfif', 'máy', 0, 0, NULL, NULL),
(48, 'Vsmart Aris', 4, 'Android 10', 'AMOLED / 6,39\" / Full HD+', 'Adreno 618', '6GB', '64GB', '20MP', 'Chính 64MP, Phụ 8/2MP', 'Snapdragon 730 8 nhân', '4000 mAh', 'Hộp, sạc, tai nghe, ốp lưng, điện thoại, cây lấy sim, sách hướng dẫn', 'Bảo hành 18 tháng', 7490000, 0, 'Vsmart Aris 1.jfif', 'Vsmart Aris 2.jfif', 'máy', 1, 0, NULL, NULL),
(49, 'Vsmart Aris Pro', 4, 'Android 10', 'AMOLED / 6,39\" / Full HD+', 'Adreno 618', '8GB', '128GB', '20MP', 'Chính 64MP, Phụ 8/8/2MP', 'Snapdragon 730 8 nhân', '4000 mAh', 'Hộp, sạc, tai nghe, ốp lưng, điện thoại, cây lấy sim, sách hướng dẫn', 'Bảo hành 18 tháng', 9990000, 0, 'Vsmart Aris Pro 1.jfif', 'Vsmart Aris Pro 2.jfif', 'máy', 0, 0, NULL, NULL),
(50, 'iPhone Xr 64GB', 5, 'iOS 12', 'IPS LCD / 6,1\" / Liquid Retina', 'Apple GPU 4 nhân', '3GB', '64GB', '7MP', '12MP', 'Apple A12 Bionic 6 nhân', '2942 mAh', 'Cáp sạc, Tài liệu, điện thoại', 'Bảo hành 12 tháng chính hãng', 14490000, 0, 'iPhone Xr 1.jfif', 'iPhone Xr 2.jfif', 'máy', 0, 0, NULL, NULL),
(51, 'iPhone SE 64GB', 5, 'iOS 13', 'IPS LCD / 4,7\" / Retina HD', 'Apple GPU 4 nhân', '3GB', '64GB', '7MP', '12MP', 'Apple A13 Bionic 6 nhân', '1821 mAh', 'Cáp sạc, Tài liệu, điện thoại, tai nghe, củ sạc', 'Bảo hành 12 tháng chính hãng', 12990000, 0, 'iPhone SE 1.jfif', 'iPhone SE 2.jfif', 'máy', 0, 0, NULL, NULL),
(52, 'iPhone 11 64GB', 5, 'iOS 13', 'IPS LCD / 6,1\" / Liquid Retina', 'Apple GPU 4 nhân', '4GB', '64GB', '12MP', '2 x 12MP', 'Apple A13 Bionic 6 nhân', '3110 mAh', 'Cáp sạc, Tài liệu, điện thoại', 'Bảo hành 12 tháng chính hãng', 19990000, 0, 'iPhone 11 1.jfif', 'iPhone 11 2.jfif', 'máy', 0, 0, NULL, NULL),
(53, 'iPhone 11 Pro 64GB', 5, 'iOS 13', 'OLED / 5,8\" / Super Retina XDR', 'Apple GPU 4 nhân', '4GB', '64GB', '12MP', '3 x 12MP', 'Apple A13 Bionic 6 nhân', '3046 mAh', 'Cáp sạc, Tài liệu, điện thoại', 'Bảo hành 12 tháng chính hãng', 26990000, 0, 'iPhone 11 Pro 1.jfif', 'iPhone 11 Pro 2.jfif', 'máy', 0, 0, NULL, NULL),
(54, 'iPhone 11 Pro Max 512GB', 5, 'iOS 13', 'OLED / 6,5\" / Super Retina XDR', 'Apple GPU 4 nhân', '4GB', '512GB', '12MP', '3 x 12MP', 'Apple A13 Bionic 6 nhân', '3969 mAh', 'Cáp sạc, Tài liệu, điện thoại', 'Bảo hành 12 tháng chính hãng', 37990000, 0, 'iPhone 11 Pro Max 1.jfif', 'iPhone 11 Pro Max 2.jfif', 'máy', 0, 0, NULL, NULL),
(55, 'iPhone 12 64GB', 5, 'iOS 14', 'OLED / 6,1\" / Super Retina XDR', 'Apple GPU 6 nhân', '4GB', '64GB', '12MP', '2 x 12MP', 'Apple A14 Bionic 6 nhân', '2815 mAh', 'Cáp sạc, Tài liệu, điện thoại', 'Bảo hành 12 tháng chính hãng', 24990000, 0, 'iPhone 12 1.jfif', 'iPhone 12 2.jfif', 'máy', 0, 0, NULL, NULL),
(56, 'iPhone 12 mini 64GB', 5, 'iOS 14', 'OLED / 5,4\" / Super Retina XDR', 'Apple GPU 6 nhân', '4GB', '64GB', '12MP', '2 x 12MP', 'Apple A14 Bionic 6 nhân', '2227 mAh', 'Cáp sạc, Tài liệu, điện thoại', 'Bảo hành 12 tháng chính hãng', 21990000, 0, 'iPhone 12 mini 1.jfif', 'iPhone 12 mini 2.jfif', 'máy', 1, 0, NULL, NULL),
(57, 'iPhone 12 Pro 128GB', 5, 'iOS 14', 'OLED / 6,1\" / Super Retina XDR', 'Apple GPU 6 nhân', '6GB', '128GB', '12MP', '3 x 12MP', 'Apple A14 Bionic 6 nhân', '2815 mAh', 'Cáp sạc, Tài liệu, điện thoại', 'Bảo hành 12 tháng chính hãng', 30990000, 0, 'iPhone 12 Pro 1.jfif', 'iPhone 12 Pro 2.jfif', 'máy', 0, 0, NULL, NULL),
(58, 'iPhone 12 Pro Max 128GB', 5, 'iOS 14', 'OLED / 6,7\" / Super Retina XDR', 'Apple GPU 6 nhân', '6GB', '128GB', '12MP', '3 x 12MP', 'Apple A14 Bionic 6 nhân', '3687 mAh', 'Cáp sạc, Tài liệu, điện thoại', 'Bảo hành 12 tháng chính hãng', 33990000, 0, 'iPhone 12 Pro Max 1.jfif', 'iPhone 12 Pro Max 2.jfif', 'máy', 1, 0, NULL, NULL),
(59, 'Xiaomi Redmi 9', 6, 'Android 10', 'IPS LCD / 6,53\" / Full HD+', 'Mali-G52 MC2', '3GB', '32GB', '8MP', 'Chính 13MP, Phụ 8/5/2MP', 'MediaTek Helio G80 8 nhân', '5020 mAh', 'Hộp, sạc, sách, cáp, cây lấy sim, điện thoại', 'Bảo hành 18 tháng', 3390000, 0, 'Xiaomi Redmi 9 1.jfif', 'Xiaomi Redmi 9 2.jfif', 'máy', 1, 0, NULL, NULL),
(60, 'Xiaomi Redmi 9A', 6, 'Android 10', 'IPS LCD / 6,53\" / HD+', 'IMG PowerVR GE8320', '2GB', '32GB', '5MP', '13MP', 'MediaTek Helio G25 8 nhân', '5000 mAh', 'Hộp, sạc, sách, cáp, cây lấy sim, điện thoại', 'Bảo hành 18 tháng', 1990000, 0, 'Xiaomi Redmi 9A 1.jfif', 'Xiaomi Redmi 9A 2.jfif', 'máy', 0, 0, NULL, NULL),
(61, 'Xiaomi Redmi 9C', 6, 'Android 10', 'IPS LCD / 6,53\" / HD+', 'IMG PowerVR GE8320', '2GB', '32GB', '5MP', 'Chính 13MP, Phụ 2/2MP', 'MediaTek Helio G35 8 nhân', '5000 mAh', 'Hộp, sạc, sách, cáp, cây lấy sim, điện thoại', 'Bảo hành 18 tháng', 2490000, 0, 'Xiaomi Redmi 9C 1.jfif', 'Xiaomi Redmi 9C 2.jfif', 'máy', 0, 0, NULL, NULL),
(62, 'Xiaomi Redmi Note 8', 6, 'Android 9', 'IPS LCD / 6,3\" / Full HD+', 'Areno 610', '3GB', '32GB', '13MP', 'Chính 48MP, Phụ 8/2/2MP', 'Snapdragon 665 8 nhân', '4000 mAh', 'Hộp, sạc, sách, cáp, cây lấy sim, điện thoại, ốp lưng', 'Bảo hành 18 tháng', 3990000, 0, 'Xiaomi Redmi Note 8 1.jfif', 'Xiaomi Redmi Note 8 2.jfif', 'máy', 0, 0, NULL, NULL),
(63, 'Xiaomi Redmi Note 8 Pro', 6, 'Android 9', 'IPS LCD / 6,53\" / Full HD+', 'Mali-G76 MC4', '6GB', '128GB', '20MP', 'Chính 64MP, Phụ 8/2/2MP', 'MediaTek Helio G90T 8 nhân', '4500 mAh', 'Hộp, sạc, sách, cáp, cây lấy sim, điện thoại, ốp lưng', 'Bảo hành 18 tháng', 5990000, 0, 'Redmi Note 8 Pro 1.jfif', 'Redmi Note 8 Pro 2.jfif', 'máy', 0, 0, NULL, NULL),
(64, 'Xiaomi Redmi Note 9', 6, 'Android 10', 'IPS LCD / 6,53\" / Full HD+', 'Mali-G52 MC2', '4GB', '128GB', '13MP', 'Chính 48MP, Phụ 8/2/2MP', 'MediaTek Helio G85 8 nhân', '5020 mAh', 'Hộp, sạc, sách, cáp, cây lấy sim, điện thoại, ốp lưng', 'Bảo hành 18 tháng', 4990000, 0, 'Xiaomi Redmi Note 9 1.jfif', 'Xiaomi Redmi Note 9 2.jfif', 'máy', 0, 0, NULL, NULL),
(65, 'Xiaomi Redmi Note 9 Pro', 6, 'Android 10', 'IPS LCD / 6,53\" / Full HD+', 'Mali-G52 MC2', '4GB', '128GB', '13MP', 'Chính 48MP, Phụ 8/2/2MP', 'MediaTek Helio G85 8 nhân', '5020 mAh', 'Hộp, sạc, sách, cáp, cây lấy sim, điện thoại, ốp lưng', 'Bảo hành 18 tháng', 4990000, 0, 'Xiaomi Redmi Note 9 Pro 1.jfif', 'Xiaomi Redmi Note 9 Pro 1.jfif', 'máy', 0, 0, NULL, NULL),
(66, 'Xiaomi Mi 10T Pro 5G', 6, 'Android 10', 'IPS LCD / 6,67\" / Full HD+', 'Areno 650', '8GB', '256GB', '20MP', 'Chính 108MP, Phụ 13/5MP', 'Snapdragon 865 8 nhân', '5000 mAh', 'Hộp, sạc, sách, cáp, cây lấy sim, điện thoại, jack chuyển tai nghe 3,5mm', 'Bảo hành 2 năm', 12990000, 0, 'Xiaomi Mi 10T Pro 5G 1.jfif', 'Xiaomi Mi 10T Pro 5G 2.jfif', 'máy', 1, 0, NULL, NULL),
(67, 'Poco X3 NFC mn', 6, 'Android 10', 'IPS LCD / 6,67\" / Full HD+', 'Areno 618', '6GB', '128GB', '20MP', 'Chính 64MP, Phụ 13/2/2MP', 'Snapdragon 732G 8 nhân', '5160 mAh', 'Hộp, sạc, sách, cáp, cây lấy sim, điện thoại, ốp lưng', 'Bảo hành 18 tháng', 6990000, 0, 'null', 'Xiaomi Poco X3 2.jfif', 'máy', 0, 0, NULL, NULL);

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
(1, '', 'tgdd-samsung-galaxy-800-300-1.jpg'),
(2, '', 'iphone-12-banner-1400x633.png'),
(3, '', 'Banner-Article-Oppo-A29-986-x-450-px.png'),
(4, '', '1545013271_92b2d94c5f6880b8845e68651eea4ab7_66923.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ngân', '0123456789', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `type_id` int(10) UNSIGNED NOT NULL,
  `type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`type_id`, `type_name`, `description`, `image`, `type_status`, `created_at`, `updated_at`) VALUES
(1, 'Samsung', 'Một thương hiệu đến từ Hàn Quốc', NULL, 0, NULL, NULL),
(2, 'Realme', 'Một thương hiệu đến từ Trung Quốc', NULL, 0, '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'OPPO', 'Một thương hiệu đến từ Trung Quốc', NULL, 0, '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'Vsmart', 'Thương hiệu đến từ Việt Nam', NULL, 0, '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Iphone', 'Thương hiệu đến từ Mỹ', NULL, 0, '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'Xiaomi', 'Thương hiệu đến từ Trung Quốc', NULL, 0, '2016-10-25 17:19:00', NULL),
(10, 'Nokia', 'nokia', NULL, 0, NULL, NULL);

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
(6, 'Hương Hương', 'huonghuong08.php@gmail.com', '$2y$10$rGY4KT6ZSMmLnxIbmTXrsu2xdgRxm8x0UTwCyYCAzrJ320kYheSRq', '23456789', 'Hoàng Diệu 2', NULL, '2017-03-23 07:17:33', '2017-03-23 07:17:33'),
(7, 'Tên đầy đủ', 'Uiuiyhkjvj@g', '$2y$10$AN7gZ70gZzx6oVIqWmhFi.HTcoIEobFf2SEztdJ3gs2ifrO2P74WK', '1234566890', 'Street Address', NULL, '2020-12-18 00:41:13', '2020-12-18 00:41:13'),
(10, 'Vuong Dung', 'vuong@gmail.com', '$2y$10$FJ/gfXqF65uIBkhAo6cpzeXe4Zgp7GCv/NlygUN7ZCLzDgRAk5vqK', '1234566890', 'Thành phố Hồ Chí Minh', NULL, '2020-12-20 16:20:53', '2020-12-20 16:20:53');

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
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`type_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_type_id_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
