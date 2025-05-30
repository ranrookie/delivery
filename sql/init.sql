-- --------------------------------------------------------
-- 主机:                           localhost
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='地址簿';

-- 正在导出表  sky_take_out.address_book 的数据：~0 rows (大约)

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

-- 正在导出表  sky_take_out.category 的数据：~0 rows (大约)

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品';

-- 正在导出表  sky_take_out.dish 的数据：~0 rows (大约)

-- 导出  表 sky_take_out.dish_flavor 结构
CREATE TABLE IF NOT EXISTS `dish_flavor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品口味关系表';

-- 正在导出表  sky_take_out.dish_flavor 的数据：~0 rows (大约)

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

-- 正在导出表  sky_take_out.employee 的数据：~1 rows (大约)
INSERT IGNORE INTO `employee` (`id`, `name`, `username`, `password`, `phone`, `sex`, `id_number`, `status`, `create_time`, `update_time`, `create_user`, `update_user`) VALUES
	(1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单表';

-- 正在导出表  sky_take_out.orders 的数据：~0 rows (大约)

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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单明细表';

-- 正在导出表  sky_take_out.order_detail 的数据：~0 rows (大约)

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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='购物车';

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='用户信息';

-- 正在导出表  sky_take_out.user 的数据：~0 rows (大约)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
