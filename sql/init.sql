-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.42 - MySQL Community Server - GPL
-- 服务器操作系统:                      Linux
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
CREATE DATABASE IF NOT EXISTS `sky_take_out` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='地址簿';

-- 正在导出表  sky_take_out.address_book 的数据：~1 rows (大约)
INSERT IGNORE INTO `address_book` (`id`, `user_id`, `consignee`, `sex`, `phone`, `province_code`, `province_name`, `city_code`, `city_name`, `district_code`, `district_name`, `detail`, `label`, `is_default`) VALUES
	(2, 6, 'sfs', '0', '13516348525', '11', '北京市', '1101', '市辖区', '110102', '西城区', '北京市从昌平区', '1', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品及套餐分类';

-- 正在导出表  sky_take_out.category 的数据：~10 rows (大约)
INSERT IGNORE INTO `category` (`id`, `type`, `name`, `sort`, `status`, `create_time`, `update_time`, `create_user`, `update_user`) VALUES
	(11, 1, '酒水饮料', 10, 1, '2022-06-09 22:09:18', '2022-06-09 22:09:18', 1, 1),
	(12, 1, '传统主食', 9, 1, '2022-06-09 22:09:32', '2022-06-09 22:18:53', 1, 1),
	(13, 2, '人气套餐', 12, 1, '2022-06-09 22:11:38', '2025-03-28 19:52:04', 1, 1),
	(15, 2, '商务套餐', 13, 1, '2022-06-09 22:14:10', '2022-06-10 11:04:48', 1, 1),
	(16, 1, '蜀味', 4, 1, '2022-06-09 22:15:37', '2025-03-24 21:32:53', 1, 1),
	(17, 1, '蜀味牛蛙', 5, 1, '2022-06-09 22:16:14', '2022-08-31 14:39:44', 1, 1),
	(18, 1, '特色蒸菜', 6, 1, '2022-06-09 22:17:42', '2022-06-09 22:17:42', 1, 1),
	(19, 1, '新鲜时蔬', 7, 1, '2022-06-09 22:18:12', '2022-06-09 22:18:28', 1, 1),
	(20, 1, '水煮鱼', 8, 1, '2022-06-09 22:22:29', '2022-06-09 22:23:45', 1, 1),
	(21, 1, '汤类', 11, 1, '2022-06-10 10:51:47', '2022-06-10 10:51:47', 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品';

-- 正在导出表  sky_take_out.dish 的数据：~25 rows (大约)
INSERT IGNORE INTO `dish` (`id`, `name`, `category_id`, `price`, `image`, `description`, `status`, `create_time`, `update_time`, `create_user`, `update_user`) VALUES
	(46, '王老吉', 11, 6.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', '', 1, '2022-06-09 22:40:47', '2022-06-09 22:40:47', 1, 1),
	(47, '北冰洋', 11, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png', '还是小时候的味道', 1, '2022-06-10 09:18:49', '2022-06-10 09:18:49', 1, 1),
	(48, '雪花啤酒', 11, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', '', 1, '2022-06-10 09:22:54', '2022-06-10 09:22:54', 1, 1),
	(49, '米饭', 12, 2.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', '精选五常大米', 1, '2022-06-10 09:30:17', '2022-06-10 09:30:17', 1, 1),
	(50, '馒头', 12, 1.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', '优质面粉', 1, '2022-06-10 09:34:28', '2022-06-10 09:34:28', 1, 1),
	(51, '老坛酸菜鱼', 20, 56.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4a9cefba-6a74-467e-9fde-6e687ea725d7.png', '原料：汤，草鱼，酸菜', 1, '2022-06-10 09:40:51', '2022-06-10 09:40:51', 1, 1),
	(52, '经典酸菜鮰鱼', 20, 66.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png', '原料：酸菜，江团，鮰鱼', 1, '2022-06-10 09:46:02', '2022-06-10 09:46:02', 1, 1),
	(53, '蜀味水煮草鱼', 20, 38.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', '原料：草鱼，汤', 1, '2022-06-10 09:48:37', '2022-06-10 09:48:37', 1, 1),
	(54, '清炒小油菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/3613d38e-5614-41c2-90ed-ff175bf50716.png', '原料：小油菜', 1, '2022-06-10 09:51:46', '2022-06-10 09:51:46', 1, 1),
	(55, '蒜蓉娃娃菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', '原料：蒜，娃娃菜', 1, '2022-06-10 09:53:37', '2022-06-10 09:53:37', 1, 1),
	(56, '清炒西兰花', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png', '原料：西兰花', 1, '2022-06-10 09:55:44', '2022-06-10 09:55:44', 1, 1),
	(57, '炝炒圆白菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png', '原料：圆白菜', 1, '2022-06-10 09:58:35', '2022-06-10 09:58:35', 1, 1),
	(58, '清蒸鲈鱼', 18, 98.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', '原料：鲈鱼', 1, '2022-06-10 10:12:28', '2022-06-10 10:12:28', 1, 1),
	(59, '东坡肘子', 18, 138.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', '原料：猪肘棒', 1, '2022-06-10 10:24:03', '2022-06-10 10:24:03', 1, 1),
	(60, '梅菜扣肉', 18, 58.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/6080b118-e30a-4577-aab4-45042e3f88be.png', '原料：猪肉，梅菜', 1, '2022-06-10 10:26:03', '2022-06-10 10:26:03', 1, 1),
	(61, '剁椒鱼头', 18, 66.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', '原料：鲢鱼，剁椒', 1, '2022-06-10 10:28:54', '2022-06-10 10:28:54', 1, 1),
	(62, '金汤酸菜牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', '原料：鲜活牛蛙，酸菜', 1, '2022-06-10 10:33:05', '2022-06-10 10:33:05', 1, 1),
	(63, '香锅牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png', '配料：鲜活牛蛙，莲藕，青笋', 1, '2022-06-10 10:35:40', '2022-06-10 10:35:40', 1, 1),
	(64, '馋嘴牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', '配料：鲜活牛蛙，丝瓜，黄豆芽', 1, '2022-06-10 10:37:52', '2022-06-10 10:37:52', 1, 1),
	(65, '草鱼2斤', 16, 68.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', '原料：草鱼，黄豆芽，莲藕', 1, '2022-06-10 10:41:08', '2025-03-24 21:52:33', 1, 1),
	(66, '江团鱼', 16, 119.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', '配料：江团鱼，黄豆芽，莲藕', 1, '2022-06-10 10:42:42', '2025-03-24 22:24:17', 1, 1),
	(69, '平菇', 21, 6.00, 'https://shr88666.oss-cn-beijing.aliyuncs.com/2a63745f-381b-44b5-9034-4aca44c6370d.jpg', '配料：豆腐，平菇', 1, '2022-06-10 10:55:02', '2025-03-27 22:58:12', 1, 1),
	(78, '够吧哇', 17, 1000.00, 'https://shr88666.oss-cn-beijing.aliyuncs.com/9221e43d-b051-4356-a356-a48fdfc797d3.jpg', '212123222', 1, '2025-03-24 12:15:14', '2025-03-27 22:57:01', 1, 1),
	(79, 'sf', 20, 545.00, 'https://shr88666.oss-cn-beijing.aliyuncs.com/71cff6ed-eb3d-4a8f-8298-a61d87530c9d.png', '\n\n457\\', 1, '2025-03-27 22:59:02', '2025-03-27 23:03:53', 1, 1),
	(80, 'sdfsd', 20, 2132.00, 'https://shr88666.oss-cn-beijing.aliyuncs.com/5ca7a787-38e3-467b-b003-0e663fbef492.png', '22', 0, '2025-03-27 23:01:47', '2025-05-12 20:19:27', 1, 1);

-- 导出  表 sky_take_out.dish_flavor 结构
CREATE TABLE IF NOT EXISTS `dish_flavor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品口味关系表';

-- 正在导出表  sky_take_out.dish_flavor 的数据：~31 rows (大约)
INSERT IGNORE INTO `dish_flavor` (`id`, `dish_id`, `name`, `value`) VALUES
	(40, 10, '甜味', '["无糖","少糖","半糖","多糖","全糖"]'),
	(41, 7, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(42, 7, '温度', '["热饮","常温","去冰","少冰","多冰"]'),
	(45, 6, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(46, 6, '辣度', '["不辣","微辣","中辣","重辣"]'),
	(47, 5, '辣度', '["不辣","微辣","中辣","重辣"]'),
	(48, 5, '甜味', '["无糖","少糖","半糖","多糖","全糖"]'),
	(49, 2, '甜味', '["无糖","少糖","半糖","多糖","全糖"]'),
	(50, 4, '甜味', '["无糖","少糖","半糖","多糖","全糖"]'),
	(51, 3, '甜味', '["无糖","少糖","半糖","多糖","全糖"]'),
	(52, 3, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(86, 52, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(87, 52, '辣度', '["不辣","微辣","中辣","重辣"]'),
	(88, 51, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(89, 51, '辣度', '["不辣","微辣","中辣","重辣"]'),
	(92, 53, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(93, 53, '辣度', '["不辣","微辣","中辣","重辣"]'),
	(94, 54, '忌口', '["不要葱","不要蒜","不要香菜"]'),
	(95, 56, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(96, 57, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(97, 60, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(103, 65, '辣度', '["不辣","微辣","中辣","重辣"]'),
	(106, 71, '甜味', '["无糖","少糖","半糖","多糖","全糖"]'),
	(107, 72, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(108, 73, '辣度', '["不辣","微辣","中辣","重辣"]'),
	(135, 66, '甜味', '["无糖"]'),
	(136, 66, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(144, 78, '温度', '["热饮","常温","去冰","少冰","多冰"]'),
	(145, 79, '温度', '["热饮","常温","去冰","少冰","多冰"]'),
	(146, 79, '忌口', '["不要葱","不要蒜","不要香菜","不要辣"]'),
	(147, 80, '温度', '["热饮","常温","去冰","少冰","多冰"]');

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

-- 正在导出表  sky_take_out.employee 的数据：~18 rows (大约)
INSERT IGNORE INTO `employee` (`id`, `name`, `username`, `password`, `phone`, `sex`, `id_number`, `status`, `create_time`, `update_time`, `create_user`, `update_user`) VALUES
	(1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1),
	(2, '张三', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '456456', 1, '2025-03-20 20:50:34', '2025-03-20 20:50:34', 10, 10),
	(3, 'lisi', '放fs四', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', 'asc', 1, '2025-03-20 21:00:02', '2025-03-22 20:21:45', 10, 1),
	(10, '李四', 'fsfs', 'e10adc3949ba59abbe56e057f20f883e', '13516348255', '1', '37120220031013291X', 1, '2025-03-21 13:33:56', '2025-03-21 13:33:56', 1, 1),
	(11, '李四', 'waffaf', 'e10adc3949ba59abbe56e057f20f883e', '13516348255', '1', '37120220031013291X', 1, '2025-03-21 13:34:52', '2025-03-21 13:34:52', 1, 1),
	(12, '李四da', 'retert', 'e10adc3949ba59abbe56e057f20f883e', '13516348255', '1', '37120220031013291X', 1, '2025-03-21 13:35:42', '2025-03-22 11:17:49', 1, 1),
	(13, '李四', 'dsf', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '54645654', 1, '2025-03-21 19:40:00', '2025-03-21 19:40:00', 1, 1),
	(15, '李四', 'dsef', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '54645654', 1, '2025-03-21 19:40:05', '2025-03-21 19:40:05', 1, 1),
	(16, '李四', 'dseff', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '54645654', 1, '2025-03-21 19:40:09', '2025-03-21 19:40:09', 1, 1),
	(17, '李四', 'dsageff', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '54645654', 1, '2025-03-21 19:40:11', '2025-03-21 19:40:11', 1, 1),
	(18, '李四', 'dsageffaaf', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '54645654', 1, '2025-03-21 19:40:15', '2025-03-21 19:40:15', 1, 1),
	(19, '李四', 'dsageffgaaaf', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '54645654', 1, '2025-03-21 19:40:17', '2025-03-21 19:40:17', 1, 1),
	(20, '李四', 'dsgagaageffgaaaf', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '54645654', 1, '2025-03-21 19:40:20', '2025-03-21 19:40:20', 1, 1),
	(21, '李四', 'dsgagwwaageffgaaaf', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '54645654', 1, '2025-03-21 19:40:21', '2025-03-21 19:40:21', 1, 1),
	(22, '李是', 'dsgag', 'e10adc3949ba59abbe56e057f20f883e', '13516348524', '1', '37120220061013291X', 1, '2025-03-21 19:40:23', '2025-03-24 21:15:16', 1, 1),
	(24, '李四', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '371202200310132910', 1, '2025-03-22 20:19:10', '2025-03-22 20:19:10', 1, 1),
	(27, '算法', 'fsge', 'e10adc3949ba59abbe56e057f20f883e', '13516348525', '1', '37120220031013291X', 1, '2025-03-23 13:33:24', '2025-03-23 13:33:24', 1, 1),
	(28, '李四', 'lsfdg', 'e10adc3949ba59abbe56e057f20f883e', '13516348523', '1', '37120220041013291X', 1, '2025-03-23 13:46:05', '2025-03-24 21:35:12', 1, 1);

-- 导出  表 sky_take_out.orders 结构
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单号',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单表';

-- 正在导出表  sky_take_out.orders 的数据：~7 rows (大约)
INSERT IGNORE INTO `orders` (`id`, `number`, `status`, `user_id`, `address_book_id`, `order_time`, `checkout_time`, `pay_method`, `pay_status`, `amount`, `remark`, `phone`, `address`, `user_name`, `consignee`, `cancel_reason`, `rejection_reason`, `cancel_time`, `estimated_delivery_time`, `delivery_status`, `delivery_time`, `pack_amount`, `tableware_number`, `tableware_status`) VALUES
	(30, '1743400716409', 5, 6, 2, '2025-03-30 11:58:39', '2025-03-30 11:58:39', 1, 1, 44.00, '', '13516348525', NULL, NULL, 'sfs', NULL, NULL, NULL, '2025-03-31 14:58:00', 0, NULL, 2, 0, 0),
	(31, '1743400736743', 5, 6, 2, '2025-03-30 13:58:57', '2025-03-30 13:59:27', 1, 1, 13.00, '', '13516348525', NULL, NULL, 'sfs', NULL, NULL, NULL, '2025-03-31 14:58:00', 0, NULL, 1, 0, 0),
	(32, '1743414447523', 5, 6, 2, '2025-03-30 17:47:28', '2025-03-30 17:47:30', 1, 1, 884858.00, '', '13516348525', NULL, NULL, 'sfs', NULL, NULL, NULL, '2025-03-31 18:47:00', 0, NULL, 4, 0, 0),
	(33, '1743414472306', 5, 6, 2, '2025-03-30 17:47:52', '2025-03-30 17:47:53', 1, 1, 1467.00, '', '13516348525', NULL, NULL, 'sfs', NULL, NULL, NULL, '2025-03-31 18:47:00', 0, NULL, 9, 0, 0),
	(34, '1743414477954', 5, 6, 2, '2025-03-30 17:47:58', '2025-03-30 17:47:59', 1, 1, 485.00, '', '13516348525', NULL, NULL, 'sfs', NULL, NULL, NULL, '2025-03-31 18:47:00', 0, NULL, 5, 0, 0),
	(35, '1743414487102', 5, 6, 2, '2025-03-30 17:48:07', '2025-03-30 17:48:08', 1, 1, 66.00, '', '13516348525', NULL, NULL, 'sfs', NULL, NULL, NULL, '2025-03-31 18:48:00', 0, NULL, 4, 0, 0),
	(36, '1743423671952', 5, 6, 2, '2025-03-31 20:21:12', '2025-03-31 20:21:13', 1, 1, 141.00, '', '13516348525', NULL, NULL, 'sfs', NULL, NULL, NULL, '2025-03-31 21:21:00', 0, NULL, 6, 0, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单明细表';

-- 正在导出表  sky_take_out.order_detail 的数据：~28 rows (大约)
INSERT IGNORE INTO `order_detail` (`id`, `name`, `image`, `order_id`, `dish_id`, `setmeal_id`, `dish_flavor`, `number`, `amount`) VALUES
	(51, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 22, 55, NULL, NULL, 1, 18.00),
	(52, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 22, 49, NULL, NULL, 1, 2.00),
	(53, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 22, 53, NULL, '不要葱,不辣', 1, 38.00),
	(54, '炝炒圆白菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png', 23, 57, NULL, '不要葱', 1, 18.00),
	(55, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 23, 55, NULL, NULL, 1, 18.00),
	(56, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 23, 49, NULL, NULL, 1, 2.00),
	(57, '平菇', 'https://shr88666.oss-cn-beijing.aliyuncs.com/2a63745f-381b-44b5-9034-4aca44c6370d.jpg', 23, 69, NULL, NULL, 1, 6.00),
	(58, 'sf', 'https://shr88666.oss-cn-beijing.aliyuncs.com/71cff6ed-eb3d-4a8f-8298-a61d87530c9d.png', 23, 79, NULL, '热饮,不要葱', 1, 545.00),
	(59, '北冰洋', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png', 24, 47, NULL, NULL, 3, 4.00),
	(60, 'sdfsd', 'https://shr88666.oss-cn-beijing.aliyuncs.com/5ca7a787-38e3-467b-b003-0e663fbef492.png', 24, 80, NULL, '热饮', 1, 2132.00),
	(61, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 25, 55, NULL, NULL, 3, 18.00),
	(62, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 26, 55, NULL, NULL, 3, 18.00),
	(63, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 27, 61, NULL, NULL, 1, 66.00),
	(64, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 28, 55, NULL, NULL, 6, 18.00),
	(65, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 29, 53, NULL, '不要葱,不辣', 1, 38.00),
	(66, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 30, 55, NULL, NULL, 2, 18.00),
	(67, '平菇', 'https://shr88666.oss-cn-beijing.aliyuncs.com/2a63745f-381b-44b5-9034-4aca44c6370d.jpg', 31, 69, NULL, NULL, 1, 6.00),
	(68, 'ss45', 'https://shr88666.oss-cn-beijing.aliyuncs.com/5ccb765d-5013-4001-8ab9-f75b55cd9686.png', 32, NULL, 43, NULL, 4, 221212.00),
	(69, '雪花啤酒', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', 33, 48, NULL, NULL, 3, 4.00),
	(70, '够吧哇', 'https://shr88666.oss-cn-beijing.aliyuncs.com/9221e43d-b051-4356-a356-a48fdfc797d3.jpg', 33, 78, NULL, '热饮', 1, 1000.00),
	(71, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 33, 64, NULL, NULL, 3, 88.00),
	(72, '香锅牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png', 33, 63, NULL, NULL, 2, 88.00),
	(73, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 34, 61, NULL, NULL, 3, 66.00),
	(74, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 34, 59, NULL, NULL, 2, 138.00),
	(75, '平菇', 'https://shr88666.oss-cn-beijing.aliyuncs.com/2a63745f-381b-44b5-9034-4aca44c6370d.jpg', 35, 69, NULL, NULL, 3, 6.00),
	(76, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 35, 53, NULL, '不要葱,不辣', 1, 38.00),
	(77, '江团鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', 36, 66, NULL, '无糖,不要葱', 1, 119.00),
	(78, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 36, 49, NULL, NULL, 5, 2.00);

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

-- 正在导出表  sky_take_out.setmeal 的数据：~1 rows (大约)
INSERT IGNORE INTO `setmeal` (`id`, `category_id`, `name`, `price`, `status`, `description`, `image`, `create_time`, `update_time`, `create_user`, `update_user`) VALUES
	(43, 15, 'ss45', 221212.00, 0, '21231', 'https://shr88666.oss-cn-beijing.aliyuncs.com/5ccb765d-5013-4001-8ab9-f75b55cd9686.png', '2025-03-31 13:43:24', '2025-05-12 20:19:16', 1, 1);

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

-- 正在导出表  sky_take_out.setmeal_dish 的数据：~9 rows (大约)
INSERT IGNORE INTO `setmeal_dish` (`id`, `setmeal_id`, `dish_id`, `name`, `price`, `copies`) VALUES
	(88, 42, 49, '米饭', 2.00, 1),
	(89, 42, 56, '清炒西兰花', 18.00, 1),
	(90, 42, 66, '江团鱼', 119.00, 1),
	(101, 43, 78, '够吧哇', 1000.00, 1),
	(102, 43, 64, '馋嘴牛蛙', 88.00, 1),
	(103, 43, 69, '平菇', 6.00, 1),
	(104, 43, 79, 'sf', 545.00, 1),
	(105, 43, 66, '江团鱼', 119.00, 1),
	(106, 43, 52, '经典酸菜鮰鱼', 66.00, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='购物车';

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='用户信息';

-- 正在导出表  sky_take_out.user 的数据：~1 rows (大约)
INSERT IGNORE INTO `user` (`id`, `openid`, `name`, `phone`, `sex`, `id_number`, `avatar`, `create_time`) VALUES
	(6, 'oFOik7R1l9NZqfu1FL3Up_Uq_VFI', NULL, NULL, NULL, NULL, NULL, '2025-03-28 23:10:19');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
