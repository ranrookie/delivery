-- --------------------------------------------------------
-- 主机:                           localhost
-- 服务器版本:                        8.0.41 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 sky_take_out 的数据库结构
CREATE DATABASE IF NOT EXISTS `sky_take_out` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sky_take_out`;

-- 导出  表 sky_take_out.address_book 结构
CREATE TABLE IF NOT EXISTS `address_book` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='地址簿';

-- 正在导出表  sky_take_out.address_book 的数据：~2 rows (大约)
INSERT IGNORE INTO `address_book` (`id`, `user_id`, `consignee`, `sex`, `phone`, `province_code`, `province_name`, `city_code`, `city_name`, `district_code`, `district_name`, `detail`, `label`, `is_default`) VALUES
	(10, 8, 'Fs', '0', '13516348525', '11', '北京市', '1101', '市辖区', '110102', '西城区', '算法', '2', 0),
	(11, 8, 'Fs', '0', '13516348525', '11', '北京市', '1101', '市辖区', '110102', '西城区', '算法', '2', 1);

-- 导出  表 sky_take_out.category 结构
CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `status` int DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品及套餐分类';

-- 正在导出表  sky_take_out.category 的数据：~0 rows (大约)
INSERT IGNORE INTO `category` (`id`, `type`, `name`, `sort`, `status`, `create_time`, `update_time`, `create_user`, `update_user`) VALUES
	(25, 1, '满汉全席', 1, 1, '2025-08-13 23:57:53', '2025-08-13 23:58:43', 1, 1);

-- 导出  表 sky_take_out.dish 结构
CREATE TABLE IF NOT EXISTS `dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述信息',
  `status` int DEFAULT '1' COMMENT '0 停售 1 起售',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品';

-- 正在导出表  sky_take_out.dish 的数据：~0 rows (大约)
INSERT IGNORE INTO `dish` (`id`, `name`, `category_id`, `price`, `image`, `description`, `status`, `create_time`, `update_time`, `create_user`, `update_user`) VALUES
	(83, '春卷', 25, 1434.00, 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', '微服务', 1, '2025-08-13 23:59:11', '2025-08-13 23:59:16', 1, 1);

-- 导出  表 sky_take_out.dish_flavor 结构
CREATE TABLE IF NOT EXISTS `dish_flavor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品口味关系表';

-- 正在导出表  sky_take_out.dish_flavor 的数据：~0 rows (大约)
INSERT IGNORE INTO `dish_flavor` (`id`, `dish_id`, `name`, `value`) VALUES
	(151, 83, '甜味', '["无糖","少糖","半糖","多糖","全糖"]');

-- 导出  表 sky_take_out.employee 结构
CREATE TABLE IF NOT EXISTS `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='员工信息';

-- 正在导出表  sky_take_out.employee 的数据：~0 rows (大约)
INSERT IGNORE INTO `employee` (`id`, `name`, `username`, `password`, `phone`, `sex`, `id_number`, `status`, `create_time`, `update_time`, `create_user`, `update_user`) VALUES
	(1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1);

-- 导出  表 sky_take_out.orders 结构
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单号',
  `version` int NOT NULL DEFAULT (0) COMMENT '版本号',
  `status` int NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int DEFAULT NULL COMMENT '打包费',
  `tableware_number` int DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_number` (`number`),
  KEY `idx_status_id` (`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单表';

-- 正在导出表  sky_take_out.orders 的数据：~51 rows (大约)
INSERT IGNORE INTO `orders` (`id`, `number`, `version`, `status`, `user_id`, `address_book_id`, `order_time`, `checkout_time`, `pay_method`, `pay_status`, `amount`, `remark`, `phone`, `address`, `user_name`, `consignee`, `cancel_reason`, `rejection_reason`, `cancel_time`, `estimated_delivery_time`, `delivery_status`, `delivery_time`, `pack_amount`, `tableware_number`, `tableware_status`) VALUES
	(57, '1955660605486665728', 4, 5, 8, 11, '2025-08-13 23:59:57', '2025-08-13 23:59:59', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', NULL, NULL, NULL, '2025-08-13 00:59:00', 0, NULL, 1, 0, 0),
	(58, '1955662185321598976', 2, 6, 8, 11, '2025-08-14 00:06:14', '2025-08-14 00:06:16', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:06:19', '2025-08-14 01:06:00', 0, NULL, 1, 0, 0),
	(59, '1955663002669813760', 2, 6, 8, 11, '2025-08-14 00:09:29', '2025-08-14 00:09:32', 1, 0, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:16:30', '2025-08-14 01:09:00', 0, NULL, 2, 0, 0),
	(60, '1955664875992780800', 2, 3, 8, 11, '2025-08-14 00:16:56', '2025-08-14 00:16:58', 1, 0, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', NULL, NULL, NULL, '2025-08-14 01:16:00', 0, NULL, 2, 0, 0),
	(61, '1955665177496129536', 4, 5, 8, 11, '2025-08-14 00:18:07', '2025-08-14 00:18:09', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', NULL, NULL, NULL, '2025-08-14 01:18:00', 0, NULL, 1, 0, 0),
	(62, '1955666566955798528', 2, 6, 8, 11, '2025-08-14 00:23:39', '2025-08-14 00:23:41', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:23:49', '2025-08-14 01:23:00', 0, NULL, 1, 0, 0),
	(63, '1955666912209932288', 2, 6, 8, 11, '2025-08-14 00:25:01', '2025-08-14 00:25:02', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '商家超过24小时未接单，已自动取消', NULL, '2025-08-15 00:34:53', '2025-08-14 01:24:00', 0, NULL, 1, 0, 0),
	(64, '1955667900987740160', 2, 6, 8, 11, '2025-08-14 00:28:57', '2025-08-14 00:28:59', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:29:21', '2025-08-14 01:28:00', 0, NULL, 1, 0, 0),
	(65, '1955668195465629696', 2, 6, 8, 11, '2025-08-14 00:30:07', '2025-08-14 00:30:09', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:30:23', '2025-08-14 01:30:00', 0, NULL, 1, 0, 0),
	(66, '1955668764808843264', 2, 6, 8, 11, '2025-08-14 00:32:23', '2025-08-14 00:32:24', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:32:45', '2025-08-14 01:32:00', 0, NULL, 1, 0, 0),
	(67, '1955669049979572224', 2, 6, 8, 11, '2025-08-14 00:33:31', '2025-08-14 00:33:32', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:34:40', '2025-08-14 01:33:00', 0, NULL, 1, 0, 0),
	(68, '1955670020126281728', 2, 6, 8, 11, '2025-08-14 00:37:22', '2025-08-14 00:37:38', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:38:28', '2025-08-14 01:37:00', 0, NULL, 1, 0, 0),
	(69, '1955670951081414656', 2, 6, 8, 11, '2025-08-14 00:41:04', '2025-08-14 00:41:06', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:42:08', '2025-08-14 01:41:00', 0, NULL, 1, 0, 0),
	(70, '1955671387062538240', 2, 6, 8, 11, '2025-08-14 00:42:48', '2025-08-14 00:42:50', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:43:38', '2025-08-14 01:42:00', 0, NULL, 1, 0, 0),
	(71, '1955672554224095232', 2, 6, 8, 11, '2025-08-14 00:47:26', '2025-08-14 00:47:28', 1, 2, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:47:50', '2025-08-14 01:47:00', 0, NULL, 2, 0, 0),
	(72, '1955673420335288320', 2, 6, 8, 11, '2025-08-14 00:50:53', '2025-08-14 00:50:54', 1, 2, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:51:16', '2025-08-14 01:50:00', 0, NULL, 2, 0, 0),
	(73, '1955673596982595584', 2, 6, 8, 11, '2025-08-14 00:51:35', '2025-08-14 00:51:36', 1, 2, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:51:40', '2025-08-14 01:51:00', 0, NULL, 2, 0, 0),
	(74, '1955673664666079232', 2, 6, 8, 11, '2025-08-14 00:51:51', '2025-08-14 00:52:05', 1, 2, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 00:52:58', '2025-08-14 01:51:00', 0, NULL, 2, 0, 0),
	(75, '1955675787411722240', 2, 6, 8, 11, '2025-08-14 01:00:17', '2025-08-14 01:00:19', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:01:32', '2025-08-14 02:00:00', 0, NULL, 1, 0, 0),
	(76, '1955676766869786624', 2, 6, 8, 11, '2025-08-14 01:04:11', '2025-08-14 01:04:12', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:05:07', '2025-08-14 02:04:00', 0, NULL, 1, 0, 0),
	(77, '1955677906655121408', 2, 6, 8, 11, '2025-08-14 01:08:42', '2025-08-14 01:08:44', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:09:22', '2025-08-14 02:08:00', 0, NULL, 1, 0, 0),
	(78, '1955680653127323648', 2, 6, 8, 11, '2025-08-14 01:19:37', '2025-08-14 01:19:39', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '商家超过24小时未接单，已自动取消', NULL, '2025-08-15 01:24:53', '2025-08-14 02:19:00', 0, NULL, 1, 0, 0),
	(79, '1955681026420379648', 2, 6, 8, 11, '2025-08-14 01:21:06', '2025-08-14 01:21:14', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '商家超过24小时未接单，已自动取消', NULL, '2025-08-15 01:24:53', '2025-08-14 02:21:00', 0, NULL, 1, 0, 0),
	(80, '1955681134885081088', 2, 6, 8, 11, '2025-08-14 01:21:32', '2025-08-14 01:21:40', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '商家超过24小时未接单，已自动取消', NULL, '2025-08-15 01:24:53', '2025-08-14 02:21:00', 0, NULL, 1, 0, 0),
	(81, '1955681283950645248', 2, 6, 8, 11, '2025-08-14 01:22:08', '2025-08-14 01:22:17', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '商家超过24小时未接单，已自动取消', NULL, '2025-08-15 01:24:53', '2025-08-14 02:22:00', 0, NULL, 1, 0, 0),
	(82, '1955681567519150080', 2, 6, 8, 11, '2025-08-14 01:23:15', '2025-08-14 01:23:28', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:24:08', '2025-08-14 02:23:00', 0, NULL, 1, 0, 0),
	(83, '1955682052900786176', 2, 6, 8, 11, '2025-08-14 01:25:11', '2025-08-14 01:25:20', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '商家超过24小时未接单，已自动取消', NULL, '2025-08-15 02:41:51', '2025-08-14 02:25:00', 0, NULL, 1, 0, 0),
	(84, '1955682172341981184', 2, 6, 8, 11, '2025-08-14 01:25:39', '2025-08-14 01:25:42', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '商家超过24小时未接单，已自动取消', NULL, '2025-08-15 02:41:51', '2025-08-14 02:25:00', 0, NULL, 1, 0, 0),
	(85, '1955682341422764032', 2, 6, 8, 11, '2025-08-14 01:26:20', '2025-08-14 01:26:21', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '商家超过24小时未接单，已自动取消', NULL, '2025-08-15 02:41:51', '2025-08-14 02:26:00', 0, NULL, 1, 0, 0),
	(86, '1955682394631704576', 2, 6, 8, 11, '2025-08-14 01:26:32', '2025-08-14 01:26:34', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:26:46', '2025-08-14 02:26:00', 0, NULL, 1, 0, 0),
	(87, '1955682489108402176', 2, 6, 8, 11, '2025-08-14 01:26:55', '2025-08-14 01:26:56', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:27:27', '2025-08-14 02:26:00', 0, NULL, 1, 0, 0),
	(88, '1955682664757465088', 2, 6, 8, 11, '2025-08-14 01:27:37', '2025-08-14 01:27:38', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:27:44', '2025-08-14 02:27:00', 0, NULL, 1, 0, 0),
	(89, '1955682720973721600', 2, 6, 8, 11, '2025-08-14 01:27:50', '2025-08-14 01:27:53', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:28:33', '2025-08-14 02:27:00', 0, NULL, 1, 0, 0),
	(90, '1955682814884188160', 2, 6, 8, 11, '2025-08-14 01:28:13', '2025-08-14 01:28:14', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:28:27', '2025-08-14 02:28:00', 0, NULL, 1, 0, 0),
	(91, '1955684595374624768', 2, 6, 8, 11, '2025-08-14 01:35:17', '2025-08-14 01:35:27', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:35:35', '2025-08-14 02:35:00', 0, NULL, 1, 0, 0),
	(92, '1955684710650875904', 2, 6, 8, 11, '2025-08-14 01:35:45', '2025-08-14 01:35:46', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:35:52', '2025-08-14 02:35:00', 0, NULL, 1, 0, 0),
	(93, '1955684837008478208', 2, 6, 8, 11, '2025-08-14 01:36:15', '2025-08-14 01:36:17', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:36:22', '2025-08-14 02:36:00', 0, NULL, 1, 0, 0),
	(94, '1955684894235561984', 2, 6, 8, 11, '2025-08-14 01:36:28', '2025-08-14 01:36:30', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:36:35', '2025-08-14 02:36:00', 0, NULL, 1, 0, 0),
	(95, '1955684964683091968', 2, 6, 8, 11, '2025-08-14 01:36:45', '2025-08-14 01:36:47', 1, 2, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:36:51', '2025-08-14 02:36:00', 0, NULL, 2, 0, 0),
	(96, '1955685014725332992', 2, 6, 8, 11, '2025-08-14 01:36:57', '2025-08-14 01:36:58', 1, 2, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:37:03', '2025-08-14 02:36:00', 0, NULL, 2, 0, 0),
	(97, '1955685068076879872', 2, 6, 8, 11, '2025-08-14 01:37:10', '2025-08-14 01:37:11', 1, 2, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-14 01:37:17', '2025-08-14 02:37:00', 0, NULL, 2, 0, 0),
	(98, '1955685131909992448', 4, 5, 8, 11, '2025-08-14 01:37:25', '2025-08-14 01:37:27', 1, 0, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', NULL, NULL, NULL, '2025-08-14 02:37:00', 0, NULL, 2, 0, 0),
	(99, '1956015495668961280', 2, 6, 8, 11, '2025-08-14 23:30:10', '2025-08-14 23:30:12', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '商家超过24小时未接单，已自动取消', NULL, '2025-08-15 23:34:52', '2025-08-14 00:28:00', 0, NULL, 1, 0, 0),
	(100, '1956015537838493696', 2, 6, 8, 11, '2025-08-14 23:30:20', '2025-08-14 23:30:21', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '商家超过24小时未接单，已自动取消', NULL, '2025-08-15 23:34:52', '2025-08-14 00:30:00', 0, NULL, 1, 0, 0),
	(101, '1956015644906491904', 4, 5, 8, 11, '2025-08-14 23:30:45', '2025-08-14 23:30:47', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', NULL, NULL, NULL, '2025-08-14 00:30:00', 0, NULL, 1, 0, 0),
	(102, '1956015730000531456', 1, 6, 8, 11, '2025-08-14 23:31:06', NULL, 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '支付时间超时', NULL, '2025-08-14 23:47:00', '2025-08-14 00:31:00', 0, NULL, 1, 0, 0),
	(103, '1957109142837661696', 2, 6, 8, 11, '2025-08-17 23:55:56', '2025-08-17 23:55:57', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-17 23:56:02', '2025-08-17 00:55:00', 0, NULL, 1, 0, 0),
	(104, '1957109191768412160', 2, 6, 8, 11, '2025-08-17 23:56:07', '2025-08-17 23:56:09', 1, 2, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', '用户取消', NULL, '2025-08-17 23:56:13', '2025-08-17 00:56:00', 0, NULL, 1, 0, 0),
	(105, '1957109374606512128', 4, 5, 8, 11, '2025-08-17 23:56:51', '2025-08-17 23:56:52', 1, 0, 1441.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', NULL, NULL, NULL, '2025-08-17 00:56:00', 0, NULL, 1, 0, 0),
	(106, '1957109535479042048', 2, 6, 8, 11, '2025-08-17 23:57:29', '2025-08-17 23:57:31', 1, 0, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', NULL, '菜品已销售完，暂时无法接单', '2025-08-18 00:03:55', '2025-08-17 00:57:00', 0, NULL, 2, 0, 0),
	(107, '1957111249087107072', 4, 5, 8, 11, '2025-08-18 00:04:18', '2025-08-18 00:04:20', 1, 0, 2876.00, '', '13516348525', '北京市 市辖区 西城区 算法', NULL, 'Fs', NULL, NULL, NULL, '2025-08-18 01:04:00', 0, NULL, 2, 0, 0);

-- 导出  表 sky_take_out.order_detail 结构
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单明细表';

-- 正在导出表  sky_take_out.order_detail 的数据：~57 rows (大约)
INSERT IGNORE INTO `order_detail` (`id`, `name`, `image`, `order_id`, `dish_id`, `setmeal_id`, `dish_flavor`, `number`, `amount`) VALUES
	(99, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 57, 83, NULL, '多糖', 1, 1434.00),
	(100, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 58, 83, NULL, '半糖', 1, 1434.00),
	(101, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 59, 83, NULL, '半糖', 1, 1434.00),
	(102, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 59, 83, NULL, '半糖', 1, 1434.00),
	(103, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 60, 83, NULL, '半糖', 1, 1434.00),
	(104, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 60, 83, NULL, '半糖', 1, 1434.00),
	(105, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 61, 83, NULL, '多糖', 1, 1434.00),
	(106, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 62, 83, NULL, '无糖', 1, 1434.00),
	(107, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 63, 83, NULL, '多糖', 1, 1434.00),
	(108, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 64, 83, NULL, '无糖', 1, 1434.00),
	(109, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 65, 83, NULL, '无糖', 1, 1434.00),
	(110, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 66, 83, NULL, '无糖', 1, 1434.00),
	(111, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 67, 83, NULL, '无糖', 1, 1434.00),
	(112, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 68, 83, NULL, '无糖', 1, 1434.00),
	(113, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 69, 83, NULL, '多糖', 1, 1434.00),
	(114, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 70, 83, NULL, '多糖', 1, 1434.00),
	(115, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 71, 83, NULL, '多糖', 1, 1434.00),
	(116, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 71, 83, NULL, '多糖', 1, 1434.00),
	(117, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 72, 83, NULL, '多糖', 1, 1434.00),
	(118, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 72, 83, NULL, '多糖', 1, 1434.00),
	(119, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 73, 83, NULL, '多糖', 1, 1434.00),
	(120, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 73, 83, NULL, '多糖', 1, 1434.00),
	(121, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 74, 83, NULL, '多糖', 1, 1434.00),
	(122, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 74, 83, NULL, '多糖', 1, 1434.00),
	(123, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 75, 83, NULL, '无糖', 1, 1434.00),
	(124, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 76, 83, NULL, '无糖', 1, 1434.00),
	(125, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 77, 83, NULL, '无糖', 1, 1434.00),
	(126, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 78, 83, NULL, '无糖', 1, 1434.00),
	(127, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 79, 83, NULL, '无糖', 1, 1434.00),
	(128, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 80, 83, NULL, '无糖', 1, 1434.00),
	(129, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 81, 83, NULL, '无糖', 1, 1434.00),
	(130, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 82, 83, NULL, '无糖', 1, 1434.00),
	(131, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 83, 83, NULL, '无糖', 1, 1434.00),
	(132, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 84, 83, NULL, '无糖', 1, 1434.00),
	(133, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 85, 83, NULL, '无糖', 1, 1434.00),
	(134, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 86, 83, NULL, '无糖', 1, 1434.00),
	(135, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 87, 83, NULL, '无糖', 1, 1434.00),
	(136, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 88, 83, NULL, '无糖', 1, 1434.00),
	(137, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 89, 83, NULL, '无糖', 1, 1434.00),
	(138, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 90, 83, NULL, '无糖', 1, 1434.00),
	(139, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 91, 83, NULL, '无糖', 1, 1434.00),
	(140, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 92, 83, NULL, '无糖', 1, 1434.00),
	(141, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 93, 83, NULL, '无糖', 1, 1434.00),
	(142, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 94, 83, NULL, '无糖', 1, 1434.00),
	(143, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 95, 83, NULL, '无糖', 2, 1434.00),
	(144, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 96, 83, NULL, '无糖', 2, 1434.00),
	(145, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 97, 83, NULL, '无糖', 2, 1434.00),
	(146, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 98, 83, NULL, '无糖', 2, 1434.00),
	(147, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 99, 83, NULL, '无糖', 1, 1434.00),
	(148, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 100, 83, NULL, '无糖', 1, 1434.00),
	(149, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 101, 83, NULL, '无糖', 1, 1434.00),
	(150, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 102, 83, NULL, '无糖', 1, 1434.00),
	(151, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 103, 83, NULL, '无糖', 1, 1434.00),
	(152, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 104, 83, NULL, '无糖', 1, 1434.00),
	(153, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 105, 83, NULL, '无糖', 1, 1434.00),
	(154, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 106, 83, NULL, '无糖', 2, 1434.00),
	(155, '春卷', 'https://shr88666.oss-cn-beijing.aliyuncs.com/d4e0c258-de41-4a79-a982-d76123615897.jpg', 107, 83, NULL, '无糖', 2, 1434.00);

-- 导出  表 sky_take_out.setmeal 结构
CREATE TABLE IF NOT EXISTS `setmeal` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '套餐名称',
  `price` decimal(10,2) NOT NULL COMMENT '套餐价格',
  `status` int DEFAULT '1' COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐';

-- 正在导出表  sky_take_out.setmeal 的数据：~0 rows (大约)

-- 导出  表 sky_take_out.setmeal_dish 结构
CREATE TABLE IF NOT EXISTS `setmeal_dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐菜品关系';

-- 正在导出表  sky_take_out.setmeal_dish 的数据：~0 rows (大约)

-- 导出  表 sky_take_out.shopping_cart 结构
CREATE TABLE IF NOT EXISTS `shopping_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='购物车';

-- 正在导出表  sky_take_out.shopping_cart 的数据：~0 rows (大约)

-- 导出  表 sky_take_out.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='用户信息';

-- 正在导出表  sky_take_out.user 的数据：~0 rows (大约)
INSERT IGNORE INTO `user` (`id`, `openid`, `name`, `phone`, `sex`, `id_number`, `avatar`, `create_time`) VALUES
	(8, 'oFOik7R1l9NZqfu1FL3Up_Uq_VFI', NULL, NULL, NULL, NULL, NULL, '2025-08-13 23:08:52');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
