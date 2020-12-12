/*
 Navicat Premium Data Transfer

 Source Server         : DB MySQL Local
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : 127.0.0.1:3306
 Source Schema         : manager_department

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 12/12/2020 11:51:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apartment
-- ----------------------------
DROP TABLE IF EXISTS `apartment`;
CREATE TABLE `apartment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `area` decimal(10, 0) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apartment
-- ----------------------------
INSERT INTO `apartment` VALUES (1, '2', 1, 1, '1', 1, '2020-11-17', '2020-11-17', '1', '1', '1');
INSERT INTO `apartment` VALUES (3, '123123', 321321, 321321, '12312312', 1, '2020-11-25', NULL, 'admin', NULL, '6513213');
INSERT INTO `apartment` VALUES (8, 'abcd', 1231231, 123123, NULL, 1, '2020-11-25', NULL, 'admin', NULL, '123123');

-- ----------------------------
-- Table structure for apartment_detail
-- ----------------------------
DROP TABLE IF EXISTS `apartment_detail`;
CREATE TABLE `apartment_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `id_person` int(11) NOT NULL,
  `id_apartment` int(11) NOT NULL,
  `is_main` bigint(20) NULL DEFAULT NULL,
  `created_at` date NULL DEFAULT NULL,
  `updated_at` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_person`(`id_person`) USING BTREE,
  INDEX `id_apartment`(`id_apartment`) USING BTREE,
  CONSTRAINT `apartment_detail_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `apartment_detail_ibfk_2` FOREIGN KEY (`id_apartment`) REFERENCES `apartment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apartment_detail
-- ----------------------------
INSERT INTO `apartment_detail` VALUES (1, NULL, NULL, NULL, 1, 4, 3, NULL, '2020-11-25', '2020-11-25');
INSERT INTO `apartment_detail` VALUES (2, NULL, NULL, NULL, 1, 2, 8, NULL, '2020-11-25', '2020-11-25');
INSERT INTO `apartment_detail` VALUES (3, NULL, NULL, NULL, 1, 3, 1, NULL, '2020-11-25', '2020-11-25');

-- ----------------------------
-- Table structure for bill_electrict
-- ----------------------------
DROP TABLE IF EXISTS `bill_electrict`;
CREATE TABLE `bill_electrict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `old_number` decimal(10, 0) NULL DEFAULT NULL,
  `new_number` decimal(10, 0) NULL DEFAULT NULL,
  `amount` decimal(10, 0) NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `month` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_department` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_department`(`id_department`) USING BTREE,
  CONSTRAINT `bill_electrict_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill_service
-- ----------------------------
DROP TABLE IF EXISTS `bill_service`;
CREATE TABLE `bill_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `month` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_department` int(11) NOT NULL,
  `code_apartment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_apartment` bigint(20) NULL DEFAULT NULL,
  `total_price` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_department`(`id_department`) USING BTREE,
  CONSTRAINT `bill_service_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill_service_detail
-- ----------------------------
DROP TABLE IF EXISTS `bill_service_detail`;
CREATE TABLE `bill_service_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10, 0) NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `id_bill_service` int(11) NOT NULL,
  `id_service_type` int(11) NOT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_bill_service`(`id_bill_service`) USING BTREE,
  INDEX `id_service_type`(`id_service_type`) USING BTREE,
  CONSTRAINT `bill_service_detail_ibfk_1` FOREIGN KEY (`id_bill_service`) REFERENCES `bill_service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bill_service_detail_ibfk_2` FOREIGN KEY (`id_service_type`) REFERENCES `bill_service_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill_service_type
-- ----------------------------
DROP TABLE IF EXISTS `bill_service_type`;
CREATE TABLE `bill_service_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_service` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill_water
-- ----------------------------
DROP TABLE IF EXISTS `bill_water`;
CREATE TABLE `bill_water`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `old_number` decimal(10, 0) NULL DEFAULT NULL,
  `new_number` decimal(10, 0) NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `month` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_department` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_department`(`id_department`) USING BTREE,
  CONSTRAINT `bill_water_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill_water_electric
-- ----------------------------
DROP TABLE IF EXISTS `bill_water_electric`;
CREATE TABLE `bill_water_electric`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `old_number` decimal(10, 0) NULL DEFAULT NULL,
  `new_number` decimal(10, 0) NULL DEFAULT NULL,
  `amount` decimal(10, 0) NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `month` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_apartment` int(11) NOT NULL,
  `total_price` decimal(12, 0) NULL DEFAULT NULL,
  `id_bill_type` int(11) NULL DEFAULT NULL,
  `code_apartment` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_department`(`id_apartment`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for complaint
-- ----------------------------
DROP TABLE IF EXISTS `complaint`;
CREATE TABLE `complaint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_person` int(11) NOT NULL,
  `id_apartment` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_person`(`id_person`) USING BTREE,
  INDEX `id_apartment`(`id_apartment`) USING BTREE,
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`id_apartment`) REFERENCES `apartment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'DEP1', 'Hành chính', 1, '2019-11-18', '2019-11-18', 'admin', 'admin');
INSERT INTO `department` VALUES (2, 'DEP2', 'Kế toán', 0, '2019-11-18', '2019-11-18', 'admin', 'admin');
INSERT INTO `department` VALUES (3, 'DEP3', 'Kế hoạch', 1, '2019-11-18', '2019-12-22', 'admin', 'admin');
INSERT INTO `department` VALUES (4, 'DEP4', 'Lễ tân', 1, '2019-11-18', '2019-12-22', 'admin', 'admin');
INSERT INTO `department` VALUES (5, 'DEP5', 'Vui chơi giải trí', 0, '2019-11-18', '2019-12-22', 'admin', 'admin');
INSERT INTO `department` VALUES (6, 'DEP6', 'Quản lý', 1, '2019-11-18', '2019-12-22', 'admin', 'admin');
INSERT INTO `department` VALUES (7, 'DEP7', 'Tài chính', 1, '2019-11-18', '2019-12-22', 'admin', 'admin');
INSERT INTO `department` VALUES (8, 'DEP8', 'Quản lý vệ sinh', 1, '2019-11-18', '2019-12-22', 'admin', 'admin');
INSERT INTO `department` VALUES (9, 'DEP9', 'Văn thư', 1, '2019-11-18', '2019-12-22', 'admin', 'admin');
INSERT INTO `department` VALUES (10, 'DEP10', 'Quản lý', 1, '2019-11-18', '2019-12-22', 'admin', 'admin');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_of_bird` date NULL DEFAULT NULL,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phonenumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_working` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1021 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'EMP1', 'Virgie Bankes', '2019-01-18', 0, 'vbankes0@dropbox.com', '892 316 1553', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (2, 'EMP2', 'Mellie Feak', '2019-01-27', 0, 'mfeak1@google.nl', '339 705 7864', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (3, 'EMP3', 'Marya Geroldi', '2019-08-31', 1, 'mgeroldi2@mac.com', '212 581 9660', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (4, 'EMP4', 'Ervin Kirton', '2019-08-23', 1, 'ekirton3@paginegialle.it', '657 788 6271', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (5, 'EMP5', 'Violette Neylon', '2019-08-07', 0, 'vneylon4@mysql.com', '931 847 5766', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (6, 'EMP6', 'Bettine Corstan', '2019-08-04', 1, 'bcorstan5@gravatar.com', '640 640 2689', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (7, 'EMP7', 'Erroll Brownsett', '2019-08-14', 1, 'ebrownsett6@indiegogo.com', '254 446 6282', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (8, 'EMP8', 'Berthe Brassill', '2019-01-17', 0, 'bbrassill7@flickr.com', '984 844 7766', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (9, 'EMP9', 'Morgan Markson', '2019-09-25', 1, 'mmarkson8@studiopress.com', '363 270 6031', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (10, 'EMP10', 'Geoff Bruty', '2019-04-12', 1, 'gbruty9@statcounter.com', '231 397 5784', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (11, 'EMP11', 'Malina Brimblecomb', '2019-04-03', 0, 'mbrimblecomba@sakura.ne.jp', '815 234 7044', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (12, 'EMP12', 'Ase Le Barr', '2019-07-23', 0, 'aleb@oakley.com', '652 416 6580', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (13, 'EMP13', 'Rosette Mattiello', '2019-01-22', 1, 'rmattielloc@cocolog-nifty.com', '960 812 3823', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (14, 'EMP14', 'Cletus Borsay', '2019-05-01', 0, 'cborsayd@state.tx.us', '599 521 9653', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (15, 'EMP15', 'Hadrian Milksop', '2019-08-03', 0, 'hmilksope@gravatar.com', '909 384 8244', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (16, 'EMP16', 'Amelie Isaacson', '2019-06-30', 0, 'aisaacsonf@ustream.tv', '928 573 5745', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (17, 'EMP17', 'Aggi Sharma', '2019-03-28', 0, 'asharmag@symantec.com', '854 859 4871', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (18, 'EMP18', 'Grannie Filipchikov', '2019-06-12', 0, 'gfilipchikovh@gmpg.org', '111 872 8688', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (19, 'EMP19', 'Debora Wheal', '2019-08-06', 0, 'dwheali@themeforest.net', '899 554 7294', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (20, 'EMP20', 'Irvine Strippel', '2019-11-18', 1, 'istrippelj@typepad.com', '960 970 1380', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (21, 'EMP21', 'Minnaminnie Spoure', '2019-04-24', 0, 'mspourek@youku.com', '742 541 7338', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (22, 'EMP22', 'Omero Ellerton', '2019-12-18', 1, 'oellertonl@barnesandnoble.com', '233 432 5071', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (23, 'EMP23', 'Alard Frazer', '2019-04-18', 1, 'afrazerm@chron.com', '966 233 3731', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (24, 'EMP24', 'Merci Boyall', '2019-12-10', 1, 'mboyalln@youtube.com', '281 677 4897', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (25, 'EMP25', 'Vilhelmina Batie', '2019-05-12', 1, 'vbatieo@g.co', '791 482 4511', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (26, 'EMP26', 'Winonah Rothman', '2019-08-03', 1, 'wrothmanp@mapquest.com', '264 316 7016', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (27, 'EMP27', 'Halley Mounce', '2019-11-24', 0, 'hmounceq@wix.com', '533 246 3901', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (28, 'EMP28', 'Elmer Snoden', '2019-01-25', 0, 'esnodenr@dot.gov', '651 102 8288', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (29, 'EMP29', 'Lynette Gamage', '2019-07-26', 0, 'lgamages@imdb.com', '122 370 4649', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (30, 'EMP30', 'Irita Winram', '2019-11-28', 0, 'iwinramt@mozilla.com', '774 687 4759', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (31, 'EMP31', 'Nero Titterrell', '2019-02-08', 1, 'ntitterrellu@themeforest.net', '474 198 4085', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (32, 'EMP32', 'Farr Goadsby', '2019-01-21', 0, 'fgoadsbyv@cam.ac.uk', '184 857 8753', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (33, 'EMP33', 'Hailey Paumier', '2019-04-22', 1, 'hpaumierw@ibm.com', '762 372 1188', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (34, 'EMP34', 'Sayres Simoes', '2019-07-30', 1, 'ssimoesx@forbes.com', '164 520 1399', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (35, 'EMP35', 'Maury Dunbabin', '2019-09-12', 0, 'mdunbabiny@yahoo.co.jp', '386 137 5220', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (36, 'EMP36', 'Caril Dragonette', '2019-10-24', 0, 'cdragonettez@reverbnation.com', '895 502 4843', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (37, 'EMP37', 'Ranna Trayhorn', '2019-05-11', 0, 'rtrayhorn10@surveymonkey.com', '640 979 0286', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (38, 'EMP38', 'Lindsey Kestell', '2019-09-22', 0, 'lkestell11@umich.edu', '631 531 9685', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (39, 'EMP39', 'Matthias Hammarberg', '2019-06-15', 1, 'mhammarberg12@cbslocal.com', '112 629 3669', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (40, 'EMP40', 'Koenraad Humbell', '2019-03-06', 1, 'khumbell13@guardian.co.uk', '809 868 4170', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (41, 'EMP41', 'Yetta Hannam', '2019-08-22', 1, 'yhannam14@springer.com', '404 956 0998', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (42, 'EMP42', 'Rita Yegorov', '2019-01-15', 1, 'ryegorov15@indiatimes.com', '910 752 4099', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (43, 'EMP43', 'Carola Gallimore', '2019-03-04', 0, 'cgallimore16@baidu.com', '107 368 4992', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (44, 'EMP44', 'Barthel McManus', '2019-06-07', 1, 'bmcmanus17@fotki.com', '642 536 9472', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (45, 'EMP45', 'Cloe Bonnavant', '2019-12-11', 1, 'cbonnavant18@hao123.com', '320 347 5927', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (46, 'EMP46', 'Parrnell Warboy', '2019-01-01', 0, 'pwarboy19@uiuc.edu', '111 467 4810', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (47, 'EMP47', 'Byrle Reicharz', '2019-03-06', 1, 'breicharz1a@google.cn', '146 704 7001', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (48, 'EMP48', 'Kristoforo Haggart', '2019-04-13', 1, 'khaggart1b@blogger.com', '302 411 0382', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (49, 'EMP49', 'Tobye De la Yglesias', '2019-03-25', 1, 'tde1c@meetup.com', '803 207 1171', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (50, 'EMP50', 'Caralie Hewlings', '2019-07-22', 0, 'chewlings1d@1688.com', '396 263 7297', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (51, 'EMP51', 'Lynett Belcham', '2019-07-03', 1, 'lbelcham1e@php.net', '782 203 2997', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (52, 'EMP52', 'Mella Paxeford', '2019-03-26', 0, 'mpaxeford1f@desdev.cn', '136 334 7692', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (53, 'EMP53', 'Jacki Coldman', '2019-11-13', 1, 'jcoldman1g@dell.com', '683 116 2306', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (54, 'EMP54', 'Joete Berthe', '2019-10-01', 1, 'jberthe1h@buzzfeed.com', '561 719 1619', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (55, 'EMP55', 'Alika Kubacek', '2019-10-09', 1, 'akubacek1i@cnn.com', '363 851 5779', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (56, 'EMP56', 'Eula Portinari', '2019-06-17', 0, 'eportinari1j@freewebs.com', '246 313 8315', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (57, 'EMP57', 'Kiley Calley', '2019-10-26', 1, 'kcalley1k@amazonaws.com', '140 908 2694', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (58, 'EMP58', 'Xavier Wilding', '2019-01-17', 0, 'xwilding1l@feedburner.com', '394 404 6542', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (59, 'EMP59', 'Cher Wildt', '2019-05-23', 1, 'cwildt1m@xrea.com', '378 668 8187', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (60, 'EMP60', 'Tildie Bartozzi', '2019-01-06', 0, 'tbartozzi1n@xinhuanet.com', '305 446 1538', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (61, 'EMP61', 'Cello Dudenie', '2019-12-12', 0, 'cdudenie1o@acquirethisname.com', '167 191 6089', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (62, 'EMP62', 'Merrel Tremayne', '2019-03-16', 1, 'mtremayne1p@lulu.com', '279 270 0815', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (63, 'EMP63', 'Elvira Lavalde', '2019-04-19', 0, 'elavalde1q@loc.gov', '186 843 4373', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (64, 'EMP64', 'Hi Skayman', '2019-07-03', 0, 'hskayman1r@yellowbook.com', '360 636 9977', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (65, 'EMP65', 'Evey Gabbitis', '2019-04-13', 0, 'egabbitis1s@upenn.edu', '753 919 5154', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (66, 'EMP66', 'Hyman Dikes', '2019-12-15', 0, 'hdikes1t@dailymail.co.uk', '932 466 3372', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (67, 'EMP67', 'Nada Bunten', '2019-12-20', 1, 'nbunten1u@wunderground.com', '185 819 9748', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (68, 'EMP68', 'Josefa Cleaveland', '2019-03-21', 0, 'jcleaveland1v@studiopress.com', '803 304 6009', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (69, 'EMP69', 'Antone Acland', '2019-05-29', 1, 'aacland1w@hugedomains.com', '333 334 2074', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (70, 'EMP70', 'Glynda Galbraeth', '2019-07-27', 1, 'ggalbraeth1x@infoseek.co.jp', '924 693 3948', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (71, 'EMP71', 'Jeddy Ipsley', '2019-12-05', 0, 'jipsley1y@berkeley.edu', '980 490 2932', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (72, 'EMP72', 'Kial Belsher', '2019-07-22', 1, 'kbelsher1z@dmoz.org', '605 146 9654', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (73, 'EMP73', 'Guthrey Georgius', '2019-02-25', 1, 'ggeorgius20@sfgate.com', '595 452 3243', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (74, 'EMP74', 'Boigie Drane', '2019-05-23', 1, 'bdrane21@quantcast.com', '444 186 2724', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (75, 'EMP75', 'Maisey Peirone', '2019-11-15', 0, 'mpeirone22@t.co', '134 148 6843', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (76, 'EMP76', 'Shandeigh Dunckley', '2019-09-10', 0, 'sdunckley23@yale.edu', '657 740 6260', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (77, 'EMP77', 'Jana Pomroy', '2019-08-14', 1, 'jpomroy24@cpanel.net', '295 696 6618', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (78, 'EMP78', 'Rudie Helstrip', '2019-02-14', 1, 'rhelstrip25@apache.org', '119 875 4710', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (79, 'EMP79', 'Cointon Calafato', '2019-07-03', 0, 'ccalafato26@washington.edu', '203 954 9677', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (80, 'EMP80', 'Carolee Uridge', '2019-06-25', 1, 'curidge27@rakuten.co.jp', '319 461 5094', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (81, 'EMP81', 'Verne Bootyman', '2019-07-17', 1, 'vbootyman28@diigo.com', '445 631 0665', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (82, 'EMP82', 'Lorry Prestige', '2019-04-30', 0, 'lprestige29@booking.com', '762 220 6390', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (83, 'EMP83', 'Rosabel Winwright', '2019-06-06', 0, 'rwinwright2a@marriott.com', '650 595 1051', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (84, 'EMP84', 'Bat Salatino', '2019-12-23', 1, 'bsalatino2b@homestead.com', '104 538 0634', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (85, 'EMP85', 'Marven Spat', '2019-11-23', 1, 'mspat2c@tinyurl.com', '335 471 8736', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (86, 'EMP86', 'Loren Faux', '2019-07-25', 0, 'lfaux2d@utexas.edu', '366 122 7550', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (87, 'EMP87', 'Kally Goundrill', '2019-07-09', 1, 'kgoundrill2e@vk.com', '378 883 5418', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (88, 'EMP88', 'Brnaba Goudard', '2019-03-10', 1, 'bgoudard2f@yelp.com', '205 314 1413', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (89, 'EMP89', 'Fedora Aris', '2018-12-30', 0, 'faris2g@opensource.org', '259 445 4191', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (90, 'EMP90', 'Alphonso Labell', '2019-06-11', 1, 'alabell2h@xing.com', '970 528 5675', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (91, 'EMP91', 'Trueman St. Aubyn', '2019-06-21', 0, 'tst2i@mozilla.com', '166 999 8998', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (92, 'EMP92', 'Hal Hubber', '2019-04-27', 0, 'hhubber2j@amazon.com', '541 239 2468', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (93, 'EMP93', 'Alfonse Burns', '2019-07-23', 1, 'aburns2k@netscape.com', '172 896 1603', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (94, 'EMP94', 'Kathleen Dreinan', '2019-12-17', 1, 'kdreinan2l@spotify.com', '899 207 2188', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (95, 'EMP95', 'Willy Peabody', '2019-10-12', 1, 'wpeabody2m@nytimes.com', '367 894 4842', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (96, 'EMP96', 'Connie Rignold', '2019-05-21', 1, 'crignold2n@hibu.com', '385 293 9038', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (97, 'EMP97', 'Ashton Scola', '2019-05-22', 1, 'ascola2o@un.org', '608 392 7789', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (98, 'EMP98', 'Vivia Beggio', '2019-02-20', 0, 'vbeggio2p@ucla.edu', '277 280 1024', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (99, 'EMP99', 'Kipper Schust', '2019-03-26', 1, 'kschust2q@angelfire.com', '400 957 4715', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (100, 'EMP100', 'Merralee Heape', '2019-02-17', 1, 'mheape2r@independent.co.uk', '950 992 7245', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (101, 'EMP101', 'Paolo Shord', '2019-07-16', 1, 'pshord2s@stumbleupon.com', '785 420 0403', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (102, 'EMP102', 'Stanfield Sherbrooke', '2019-10-25', 1, 'ssherbrooke2t@utexas.edu', '400 796 2584', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (103, 'EMP103', 'Marijn Hinkensen', '2019-12-08', 0, 'mhinkensen2u@japanpost.jp', '861 436 9567', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (104, 'EMP104', 'Erie Olivey', '2019-04-01', 1, 'eolivey2v@washingtonpost.com', '875 334 3192', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (105, 'EMP105', 'Abraham Hotson', '2019-04-01', 0, 'ahotson2w@storify.com', '753 581 2557', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (106, 'EMP106', 'Pail Skokoe', '2019-07-05', 1, 'pskokoe2x@com.com', '917 200 4038', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (107, 'EMP107', 'Rhianna Maisey', '2019-06-16', 0, 'rmaisey2y@nhs.uk', '261 872 5242', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (108, 'EMP108', 'Port Fiddeman', '2019-04-19', 0, 'pfiddeman2z@wikia.com', '580 738 6045', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (109, 'EMP109', 'Erin Sewart', '2019-10-02', 1, 'esewart30@hubpages.com', '490 418 4601', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (110, 'EMP110', 'Ware Agg', '2019-02-22', 1, 'wagg31@vinaora.com', '451 223 0235', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (111, 'EMP111', 'Barton Mann', '2019-09-07', 1, 'bmann32@paginegialle.it', '816 137 2240', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (112, 'EMP112', 'Ab Espine', '2019-07-13', 1, 'aespine33@exblog.jp', '904 449 7611', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (113, 'EMP113', 'Drusy Domico', '2019-01-31', 1, 'ddomico34@goo.gl', '848 259 3125', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (114, 'EMP114', 'Jeffie Barts', '2019-12-11', 1, 'jbarts35@auda.org.au', '906 244 2954', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (115, 'EMP115', 'Annis Benford', '2019-03-30', 1, 'abenford36@bloomberg.com', '955 345 8289', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (116, 'EMP116', 'Candra Ceeley', '2019-10-31', 1, 'cceeley37@upenn.edu', '682 437 3986', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (117, 'EMP117', 'Annadiane Clemensen', '2019-10-05', 0, 'aclemensen38@foxnews.com', '850 262 8613', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (118, 'EMP118', 'Elena Hastin', '2019-09-24', 0, 'ehastin39@yahoo.com', '458 405 2021', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (119, 'EMP119', 'El Hilliam', '2019-12-25', 1, 'ehilliam3a@bloglines.com', '544 518 9639', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (120, 'EMP120', 'Eberto Slatter', '2019-10-28', 0, 'eslatter3b@ox.ac.uk', '222 224 8923', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (121, 'EMP121', 'Anne Ewebank', '2019-07-27', 1, 'aewebank3c@businessweek.com', '518 445 7475', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (122, 'EMP122', 'Amy Mangeney', '2019-09-29', 1, 'amangeney3d@taobao.com', '102 239 9468', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (123, 'EMP123', 'Chaunce Cane', '2019-04-30', 0, 'ccane3e@geocities.com', '147 337 4785', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (124, 'EMP124', 'Cammy Levey', '2019-09-12', 0, 'clevey3f@wikipedia.org', '138 116 1517', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (125, 'EMP125', 'Janella Hearst', '2019-09-19', 1, 'jhearst3g@state.gov', '241 600 6411', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (126, 'EMP126', 'Natka Goldis', '2018-12-30', 0, 'ngoldis3h@icio.us', '390 470 1664', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (127, 'EMP127', 'Alane Swindles', '2019-05-15', 0, 'aswindles3i@zdnet.com', '396 867 2006', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (128, 'EMP128', 'Martin Dibdale', '2019-03-05', 1, 'mdibdale3j@wunderground.com', '162 408 8412', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (129, 'EMP129', 'Matilda Lumley', '2019-04-11', 1, 'mlumley3k@histats.com', '225 531 6791', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (130, 'EMP130', 'Katine Needs', '2019-10-31', 0, 'kneeds3l@furl.net', '447 766 0177', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (131, 'EMP131', 'Camila Sapsford', '2019-10-15', 1, 'csapsford3m@infoseek.co.jp', '705 733 9556', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (132, 'EMP132', 'Ber Mousley', '2019-09-04', 1, 'bmousley3n@time.com', '817 666 4689', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (133, 'EMP133', 'Brnaba Wilcocke', '2019-11-09', 1, 'bwilcocke3o@w3.org', '429 935 3850', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (134, 'EMP134', 'Tiphany Shory', '2019-12-20', 0, 'tshory3p@tripod.com', '295 737 9208', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (135, 'EMP135', 'Gerald Britzius', '2019-04-05', 1, 'gbritzius3q@scientificamerican.com', '939 752 2740', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (136, 'EMP136', 'Rhett Kittle', '2019-01-14', 1, 'rkittle3r@paginegialle.it', '802 534 2664', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (137, 'EMP137', 'Lewie McGlynn', '2019-06-23', 1, 'lmcglynn3s@amazon.co.uk', '820 727 0315', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (138, 'EMP138', 'Augy Liggett', '2019-06-14', 0, 'aliggett3t@usda.gov', '521 384 0138', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (139, 'EMP139', 'Des Focke', '2019-10-07', 0, 'dfocke3u@canalblog.com', '532 287 7163', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (140, 'EMP140', 'Marnie Bellhanger', '2019-09-04', 0, 'mbellhanger3v@tripod.com', '236 538 9652', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (141, 'EMP141', 'Costa Bardnam', '2019-04-07', 0, 'cbardnam3w@de.vu', '111 121 4109', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (142, 'EMP142', 'Karleen Valde', '2019-01-04', 1, 'kvalde3x@hc360.com', '467 619 2970', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (143, 'EMP143', 'Monica Sepey', '2019-08-09', 1, 'msepey3y@skype.com', '913 880 9871', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (144, 'EMP144', 'Elli Goding', '2019-01-18', 0, 'egoding3z@sina.com.cn', '300 815 0761', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (145, 'EMP145', 'Ragnar Andrini', '2019-06-10', 1, 'randrini40@nydailynews.com', '955 549 7803', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (146, 'EMP146', 'Zeke Wolfers', '2019-05-28', 0, 'zwolfers41@pcworld.com', '405 378 4945', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (147, 'EMP147', 'Laure Arunowicz', '2019-07-07', 0, 'larunowicz42@comcast.net', '717 465 6340', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (148, 'EMP148', 'Dominik Kineton', '2019-01-01', 1, 'dkineton43@miibeian.gov.cn', '668 562 8354', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (149, 'EMP149', 'Moore Terrett', '2019-10-25', 1, 'mterrett44@accuweather.com', '261 617 9730', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (150, 'EMP150', 'Zaneta Heatherington', '2019-12-14', 1, 'zheatherington45@chicagotribune.com', '679 885 6429', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (151, 'EMP151', 'Brier Darbey', '2019-08-23', 1, 'bdarbey46@usda.gov', '792 721 6284', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (152, 'EMP152', 'Betti Linskey', '2019-04-20', 0, 'blinskey47@bizjournals.com', '384 784 5699', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (153, 'EMP153', 'Cristie Handlin', '2019-07-31', 0, 'chandlin48@studiopress.com', '278 119 9938', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (154, 'EMP154', 'Vevay Mathely', '2019-06-15', 0, 'vmathely49@disqus.com', '929 730 7506', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (155, 'EMP155', 'Felice Elcomb', '2019-04-20', 0, 'felcomb4a@google.ca', '167 618 1154', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (156, 'EMP156', 'Celene Bembrick', '2019-06-10', 0, 'cbembrick4b@ucoz.com', '658 562 1445', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (157, 'EMP157', 'Gran Manthroppe', '2018-12-29', 1, 'gmanthroppe4c@engadget.com', '418 155 4207', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (158, 'EMP158', 'Lavinia Abramcik', '2019-03-22', 0, 'labramcik4d@posterous.com', '738 847 6869', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (159, 'EMP159', 'Elisabet Elen', '2019-09-26', 1, 'eelen4e@chicagotribune.com', '352 420 3101', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (160, 'EMP160', 'Derek Fearnyough', '2019-09-10', 0, 'dfearnyough4f@elegantthemes.com', '321 747 4821', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (161, 'EMP161', 'Frasquito Emmins', '2019-08-14', 0, 'femmins4g@home.pl', '583 987 9448', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (162, 'EMP162', 'Vincenty Halt', '2019-10-07', 1, 'vhalt4h@hatena.ne.jp', '583 686 1387', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (163, 'EMP163', 'Starr Reedy', '2019-12-03', 0, 'sreedy4i@zdnet.com', '433 602 4250', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (164, 'EMP164', 'Erinna Jelks', '2019-04-17', 0, 'ejelks4j@usa.gov', '708 893 5350', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (165, 'EMP165', 'Gustavus Ostler', '2019-01-28', 1, 'gostler4k@unesco.org', '798 110 8574', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (166, 'EMP166', 'Kent Bainton', '2019-11-10', 1, 'kbainton4l@tiny.cc', '820 106 8153', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (167, 'EMP167', 'Wilie Steely', '2019-01-13', 1, 'wsteely4m@yellowpages.com', '441 868 0221', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (168, 'EMP168', 'Lauren Chansonne', '2019-12-07', 0, 'lchansonne4n@europa.eu', '458 828 4226', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (169, 'EMP169', 'Hogan Suerz', '2019-07-26', 0, 'hsuerz4o@cmu.edu', '501 340 5227', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (170, 'EMP170', 'Dimitry Trunchion', '2019-11-15', 1, 'dtrunchion4p@time.com', '280 991 6018', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (171, 'EMP171', 'Cyndie Wevell', '2019-09-29', 1, 'cwevell4q@newyorker.com', '145 605 5459', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (172, 'EMP172', 'Annalee McLoney', '2019-10-30', 0, 'amcloney4r@goo.gl', '674 465 7178', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (173, 'EMP173', 'Beck Courtin', '2019-01-04', 1, 'bcourtin4s@stumbleupon.com', '824 480 0742', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (174, 'EMP174', 'Sydney Tuite', '2019-12-06', 0, 'stuite4t@google.co.jp', '792 723 5004', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (175, 'EMP175', 'Jecho Gurrado', '2019-11-27', 1, 'jgurrado4u@phoca.cz', '189 676 2499', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (176, 'EMP176', 'Renie Gooke', '2019-05-24', 1, 'rgooke4v@sphinn.com', '402 285 4395', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (177, 'EMP177', 'Marylynne Stampfer', '2019-12-26', 0, 'mstampfer4w@si.edu', '895 970 1881', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (178, 'EMP178', 'Katine Forryan', '2019-07-12', 0, 'kforryan4x@booking.com', '127 769 7238', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (179, 'EMP179', 'Noel Markussen', '2019-07-10', 1, 'nmarkussen4y@naver.com', '487 509 7846', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (180, 'EMP180', 'Halie Gillebert', '2019-01-17', 0, 'hgillebert4z@multiply.com', '423 824 4138', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (181, 'EMP181', 'Friedrick Ceschi', '2019-09-01', 1, 'fceschi50@statcounter.com', '373 410 7066', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (182, 'EMP182', 'Alfonse Hatch', '2019-12-03', 0, 'ahatch51@yandex.ru', '711 353 8963', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (183, 'EMP183', 'Xavier O\'Scollain', '2019-08-17', 0, 'xoscollain52@microsoft.com', '118 492 0591', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (184, 'EMP184', 'Hernando Leason', '2019-04-23', 0, 'hleason53@netscape.com', '988 240 2344', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (185, 'EMP185', 'Ennis Wheatland', '2019-10-25', 1, 'ewheatland54@gov.uk', '729 258 7656', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (186, 'EMP186', 'Toddie McClaughlin', '2019-06-06', 0, 'tmcclaughlin55@google.es', '705 197 7030', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (187, 'EMP187', 'Xena Hubane', '2019-09-16', 0, 'xhubane56@ezinearticles.com', '797 886 0298', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (188, 'EMP188', 'Art Flay', '2019-04-28', 0, 'aflay57@deliciousdays.com', '710 818 0021', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (189, 'EMP189', 'Franklyn Sutworth', '2019-06-01', 1, 'fsutworth58@tinypic.com', '914 553 0415', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (190, 'EMP190', 'Ros Lorence', '2019-09-13', 0, 'rlorence59@google.de', '390 554 1105', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (191, 'EMP191', 'Bar Menichini', '2019-04-18', 1, 'bmenichini5a@arstechnica.com', '949 395 2904', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (192, 'EMP192', 'Maribelle O\'Lynn', '2019-06-17', 1, 'molynn5b@moonfruit.com', '772 259 1934', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (193, 'EMP193', 'Bess Costain', '2019-04-02', 0, 'bcostain5c@earthlink.net', '861 549 4762', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (194, 'EMP194', 'Angelina Stitfall', '2019-07-24', 1, 'astitfall5d@devhub.com', '970 136 3975', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (195, 'EMP195', 'Kellen Chubb', '2019-09-15', 0, 'kchubb5e@lulu.com', '786 567 9521', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (196, 'EMP196', 'Stinky Vogelein', '2019-08-16', 0, 'svogelein5f@ycombinator.com', '854 333 0997', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (197, 'EMP197', 'Oliviero Mariotte', '2019-09-14', 1, 'omariotte5g@utexas.edu', '780 433 4931', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (198, 'EMP198', 'Albertina Twinn', '2019-06-08', 1, 'atwinn5h@china.com.cn', '599 830 5474', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (199, 'EMP199', 'Gherardo Byres', '2019-06-07', 0, 'gbyres5i@usgs.gov', '304 276 3153', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (200, 'EMP200', 'Alfonso Tremmil', '2019-01-11', 1, 'atremmil5j@furl.net', '395 342 6803', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (201, 'EMP201', 'Benyamin Lownds', '2019-07-08', 0, 'blownds5k@tinyurl.com', '912 999 8130', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (202, 'EMP202', 'Adeline Mee', '2019-01-26', 1, 'amee5l@senate.gov', '550 100 1783', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (203, 'EMP203', 'Hinda Huddle', '2019-03-27', 1, 'hhuddle5m@ft.com', '495 779 9447', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (204, 'EMP204', 'Bartolemo Trafford', '2019-11-25', 0, 'btrafford5n@buzzfeed.com', '439 355 0665', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (205, 'EMP205', 'Elfie Lantiff', '2019-11-20', 0, 'elantiff5o@wiley.com', '392 397 5067', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (206, 'EMP206', 'Levey Tessier', '2019-04-25', 1, 'ltessier5p@ebay.co.uk', '427 469 4382', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (207, 'EMP207', 'Cyrillus Naulls', '2019-11-15', 1, 'cnaulls5q@tripadvisor.com', '681 774 0397', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (208, 'EMP208', 'Karita Davenell', '2019-02-08', 0, 'kdavenell5r@vimeo.com', '344 851 4332', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (209, 'EMP209', 'Torrey Dickon', '2019-05-23', 0, 'tdickon5s@nature.com', '193 738 1595', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (210, 'EMP210', 'Joleen Mote', '2019-04-01', 0, 'jmote5t@simplemachines.org', '813 866 9111', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (211, 'EMP211', 'Boniface Pilsworth', '2019-11-30', 0, 'bpilsworth5u@privacy.gov.au', '847 881 4209', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (212, 'EMP212', 'Glenden Wisson', '2019-09-28', 0, 'gwisson5v@seesaa.net', '361 451 7874', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (213, 'EMP213', 'Gypsy Drover', '2019-12-07', 0, 'gdrover5w@sbwire.com', '341 363 4906', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (214, 'EMP214', 'Merrill Mayzes', '2019-02-03', 0, 'mmayzes5x@goodreads.com', '533 176 7597', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (215, 'EMP215', 'Ottilie Fitzpatrick', '2019-11-18', 1, 'ofitzpatrick5y@washingtonpost.com', '986 916 1469', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (216, 'EMP216', 'Stefano Lukacs', '2019-01-08', 1, 'slukacs5z@sohu.com', '941 250 2245', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (217, 'EMP217', 'Antin Petteford', '2019-10-06', 1, 'apetteford60@163.com', '181 559 8884', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (218, 'EMP218', 'Kirby Reuter', '2019-08-03', 0, 'kreuter61@rediff.com', '439 508 7641', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (219, 'EMP219', 'Lizzy Murty', '2019-04-20', 1, 'lmurty62@hubpages.com', '549 140 2929', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (220, 'EMP220', 'Dud Heinrich', '2019-09-29', 1, 'dheinrich63@wordpress.org', '509 845 1196', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (221, 'EMP221', 'Janessa Foresight', '2019-07-21', 0, 'jforesight64@php.net', '418 363 9982', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (222, 'EMP222', 'Arvy Dellit', '2019-03-16', 0, 'adellit65@ovh.net', '738 378 5054', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (223, 'EMP223', 'Faustina Rippingale', '2019-04-22', 1, 'frippingale66@reference.com', '741 609 2179', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (224, 'EMP224', 'Paton Penning', '2019-10-17', 1, 'ppenning67@mac.com', '367 686 3722', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (225, 'EMP225', 'Dasie Renoden', '2019-02-12', 0, 'drenoden68@mtv.com', '647 332 8870', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (226, 'EMP226', 'Trista Sommerville', '2019-03-01', 1, 'tsommerville69@pinterest.com', '213 891 5487', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (227, 'EMP227', 'Naomi O\'Suaird', '2019-12-26', 0, 'nosuaird6a@ustream.tv', '764 513 0896', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (228, 'EMP228', 'Morgana Stanborough', '2019-09-16', 1, 'mstanborough6b@google.com.br', '644 394 8722', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (229, 'EMP229', 'Ange Leffek', '2019-08-29', 1, 'aleffek6c@tamu.edu', '939 895 5755', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (230, 'EMP230', 'Celine Calverd', '2019-09-10', 1, 'ccalverd6d@1688.com', '231 706 5306', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (231, 'EMP231', 'Wolfgang McFadin', '2019-12-26', 1, 'wmcfadin6e@clickbank.net', '671 888 7337', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (232, 'EMP232', 'Rosella Scorey', '2019-07-28', 1, 'rscorey6f@cisco.com', '157 284 7352', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (233, 'EMP233', 'Blayne Larchier', '2019-07-29', 1, 'blarchier6g@wikispaces.com', '501 293 6554', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (234, 'EMP234', 'Darelle Mathonnet', '2019-04-12', 1, 'dmathonnet6h@mapquest.com', '667 953 7552', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (235, 'EMP235', 'Barbabas Dureden', '2019-04-29', 0, 'bdureden6i@jiathis.com', '380 284 5262', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (236, 'EMP236', 'Earlie Scrimshire', '2019-04-25', 1, 'escrimshire6j@tinypic.com', '453 373 3521', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (237, 'EMP237', 'Merill Kewzick', '2019-08-04', 0, 'mkewzick6k@gravatar.com', '957 805 6517', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (238, 'EMP238', 'Adriaens Cutten', '2019-02-25', 0, 'acutten6l@surveymonkey.com', '204 939 6639', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (239, 'EMP239', 'Darb Swaddle', '2019-07-03', 0, 'dswaddle6m@virginia.edu', '720 415 5987', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (240, 'EMP240', 'Madelaine Andrich', '2019-04-15', 1, 'mandrich6n@si.edu', '365 889 9103', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (241, 'EMP241', 'Sindee Nicolls', '2019-05-19', 0, 'snicolls6o@ovh.net', '759 163 5475', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (242, 'EMP242', 'Nicolis Meekin', '2019-03-28', 1, 'nmeekin6p@house.gov', '470 158 2494', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (243, 'EMP243', 'Laverna Worsham', '2019-07-20', 1, 'lworsham6q@tmall.com', '570 814 4114', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (244, 'EMP244', 'Lauren Addy', '2019-04-22', 1, 'laddy6r@twitter.com', '601 839 4588', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (245, 'EMP245', 'Ellynn Richemont', '2019-04-12', 1, 'erichemont6s@icio.us', '224 648 8806', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (246, 'EMP246', 'Robyn Alibone', '2019-07-16', 0, 'ralibone6t@diigo.com', '370 675 2188', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (247, 'EMP247', 'Abigael Dietz', '2019-12-18', 1, 'adietz6u@stanford.edu', '973 772 4371', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (248, 'EMP248', 'Kelsey Powlesland', '2019-11-23', 0, 'kpowlesland6v@istockphoto.com', '598 778 2282', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (249, 'EMP249', 'Lotta Mossop', '2019-07-14', 0, 'lmossop6w@bloglovin.com', '194 235 6115', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (250, 'EMP250', 'Jacky Ruperti', '2019-03-31', 0, 'jruperti6x@cdbaby.com', '973 834 8853', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (251, 'EMP251', 'Bay Von Oertzen', '2019-11-01', 0, 'bvon6y@tamu.edu', '640 303 3622', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (252, 'EMP252', 'Herta Croxley', '2019-05-09', 0, 'hcroxley6z@google.pl', '329 149 1181', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (253, 'EMP253', 'Gillie Sawle', '2019-03-10', 0, 'gsawle70@state.gov', '380 519 2768', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (254, 'EMP254', 'Naomi Bolam', '2019-12-07', 1, 'nbolam71@slashdot.org', '517 892 1970', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (255, 'EMP255', 'Orin Donati', '2019-07-28', 1, 'odonati72@shop-pro.jp', '109 450 5310', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (256, 'EMP256', 'Merwin Bleythin', '2019-05-19', 1, 'mbleythin73@furl.net', '426 820 7639', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (257, 'EMP257', 'Vernice Coonihan', '2019-02-26', 0, 'vcoonihan74@marriott.com', '870 725 5259', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (258, 'EMP258', 'Caldwell Livock', '2019-04-30', 0, 'clivock75@dot.gov', '791 852 4281', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (259, 'EMP259', 'Donna Offord', '2019-04-29', 1, 'dofford76@tmall.com', '883 875 9826', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (260, 'EMP260', 'Mata Selcraig', '2019-05-20', 0, 'mselcraig77@buzzfeed.com', '416 105 5003', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (261, 'EMP261', 'Zondra Pardue', '2019-01-08', 0, 'zpardue78@mashable.com', '570 691 8322', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (262, 'EMP262', 'Mallorie Wildgoose', '2019-03-24', 1, 'mwildgoose79@woothemes.com', '103 953 7267', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (263, 'EMP263', 'Lulita Lucchi', '2019-11-15', 1, 'llucchi7a@biblegateway.com', '866 668 4400', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (264, 'EMP264', 'Augustina O\'Coskerry', '2019-03-27', 0, 'aocoskerry7b@simplemachines.org', '749 770 7626', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (265, 'EMP265', 'Jacky Meeke', '2019-12-07', 0, 'jmeeke7c@mtv.com', '734 351 2221', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (266, 'EMP266', 'Lexis Ricks', '2019-08-13', 0, 'lricks7d@slate.com', '991 973 8567', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (267, 'EMP267', 'Susan O\'Luney', '2019-05-14', 0, 'soluney7e@taobao.com', '501 523 9811', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (268, 'EMP268', 'Zoe Muckersie', '2019-07-20', 0, 'zmuckersie7f@examiner.com', '719 594 1049', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (269, 'EMP269', 'Chrissie MacCathay', '2019-05-19', 0, 'cmaccathay7g@skype.com', '490 526 4852', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (270, 'EMP270', 'Iorgo Cready', '2019-02-03', 1, 'icready7h@barnesandnoble.com', '694 463 1432', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (271, 'EMP271', 'Lori Edgecumbe', '2019-03-12', 0, 'ledgecumbe7i@blogtalkradio.com', '756 592 9230', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (272, 'EMP272', 'Mariel Tregidga', '2019-10-10', 1, 'mtregidga7j@sourceforge.net', '294 196 6537', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (273, 'EMP273', 'Ilise Suttell', '2019-10-08', 0, 'isuttell7k@psu.edu', '647 132 9058', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (274, 'EMP274', 'Walliw Seiffert', '2019-07-21', 0, 'wseiffert7l@prnewswire.com', '571 233 7140', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (275, 'EMP275', 'Hillel Cottie', '2019-11-06', 1, 'hcottie7m@youtube.com', '764 186 4165', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (276, 'EMP276', 'Wyatan Mollatt', '2019-04-26', 1, 'wmollatt7n@icio.us', '905 140 8288', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (277, 'EMP277', 'Teodorico Antoniutti', '2019-11-22', 0, 'tantoniutti7o@about.com', '997 757 7929', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (278, 'EMP278', 'Stormy Peters', '2019-12-25', 1, 'speters7p@blogs.com', '745 167 1339', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (279, 'EMP279', 'York Rykert', '2019-06-14', 1, 'yrykert7q@flickr.com', '529 704 5495', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (280, 'EMP280', 'Pedro Gristhwaite', '2019-07-08', 1, 'pgristhwaite7r@smh.com.au', '243 572 5891', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (281, 'EMP281', 'Chico Bollins', '2019-03-12', 1, 'cbollins7s@wsj.com', '527 547 5181', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (282, 'EMP282', 'Evan Jobin', '2019-01-16', 0, 'ejobin7t@canalblog.com', '762 559 4172', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (283, 'EMP283', 'Valerye Teideman', '2019-05-15', 0, 'vteideman7u@reverbnation.com', '922 367 0956', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (284, 'EMP284', 'Cirillo Rubberts', '2019-02-25', 1, 'crubberts7v@edublogs.org', '199 818 9725', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (285, 'EMP285', 'North Schneidau', '2019-01-09', 0, 'nschneidau7w@bigcartel.com', '918 847 3345', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (286, 'EMP286', 'Sal Derx', '2019-02-28', 1, 'sderx7x@zdnet.com', '813 234 6990', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (287, 'EMP287', 'Marcel Denkin', '2019-11-13', 1, 'mdenkin7y@nbcnews.com', '637 659 0929', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (288, 'EMP288', 'Adrien Punt', '2019-07-16', 0, 'apunt7z@google.fr', '495 907 0739', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (289, 'EMP289', 'Ellswerth Blackshaw', '2019-06-13', 0, 'eblackshaw80@thetimes.co.uk', '867 877 0885', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (290, 'EMP290', 'Edvard Cowser', '2019-05-22', 0, 'ecowser81@smugmug.com', '205 790 4704', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (291, 'EMP291', 'Friedrick Rainforth', '2019-12-03', 0, 'frainforth82@oakley.com', '229 178 3934', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (292, 'EMP292', 'Raimondo Rothschild', '2019-03-19', 1, 'rrothschild83@yahoo.com', '851 861 5051', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (293, 'EMP293', 'Bernita Ebbs', '2019-11-13', 0, 'bebbs84@addthis.com', '469 855 3973', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (294, 'EMP294', 'Carla Karby', '2019-02-18', 1, 'ckarby85@wikimedia.org', '603 795 2982', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (295, 'EMP295', 'Aida Stetlye', '2019-09-18', 0, 'astetlye86@51.la', '104 987 3013', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (296, 'EMP296', 'Sayres Minci', '2019-08-09', 0, 'sminci87@fotki.com', '858 371 1577', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (297, 'EMP297', 'Rip Pendre', '2019-12-16', 0, 'rpendre88@webeden.co.uk', '361 181 4059', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (298, 'EMP298', 'Vera Forre', '2019-07-31', 1, 'vforre89@hibu.com', '218 772 3949', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (299, 'EMP299', 'Milicent Clapison', '2019-09-06', 1, 'mclapison8a@cisco.com', '732 633 5462', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (300, 'EMP300', 'Sonnie Bartkowiak', '2019-05-30', 1, 'sbartkowiak8b@amazon.com', '881 178 2194', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (301, 'EMP301', 'Darius Haythornthwaite', '2019-12-06', 0, 'dhaythornthwaite8c@joomla.org', '773 639 4754', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (302, 'EMP302', 'Meggie Dome', '2019-09-05', 1, 'mdome8d@livejournal.com', '310 321 6390', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (303, 'EMP303', 'Odille Offiler', '2019-02-19', 0, 'ooffiler8e@cbc.ca', '943 422 6011', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (304, 'EMP304', 'Eleen Stother', '2019-12-16', 0, 'estother8f@sourceforge.net', '986 945 1734', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (305, 'EMP305', 'Helena Beeden', '2019-08-09', 1, 'hbeeden8g@google.com', '563 445 2732', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (306, 'EMP306', 'Clarabelle Dacks', '2019-11-21', 0, 'cdacks8h@feedburner.com', '625 944 3242', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (307, 'EMP307', 'Robinet Androsik', '2019-10-21', 0, 'randrosik8i@forbes.com', '537 327 5227', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (308, 'EMP308', 'Jayne Lammertz', '2019-10-31', 0, 'jlammertz8j@tripadvisor.com', '853 341 9355', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (309, 'EMP309', 'Stafford O\'Brollachain', '2019-02-08', 0, 'sobrollachain8k@intel.com', '423 930 8190', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (310, 'EMP310', 'Ware Hammon', '2019-04-13', 1, 'whammon8l@wiley.com', '861 216 3407', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (311, 'EMP311', 'Ingrim Ruddoch', '2019-02-26', 1, 'iruddoch8m@dailymail.co.uk', '989 118 7271', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (312, 'EMP312', 'Klement Wandrey', '2019-07-28', 1, 'kwandrey8n@friendfeed.com', '520 669 7835', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (313, 'EMP313', 'Guenna Twigley', '2019-12-08', 1, 'gtwigley8o@oracle.com', '308 208 9166', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (314, 'EMP314', 'Joline Menier', '2019-07-30', 1, 'jmenier8p@examiner.com', '135 517 4182', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (315, 'EMP315', 'Klarika Manifould', '2019-06-06', 0, 'kmanifould8q@jalbum.net', '269 233 0182', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (316, 'EMP316', 'Elden Infantino', '2019-04-10', 1, 'einfantino8r@goo.gl', '372 289 0153', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (317, 'EMP317', 'Efren Smuth', '2019-01-24', 0, 'esmuth8s@wunderground.com', '796 407 9274', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (318, 'EMP318', 'Alfonso Pasquale', '2019-12-04', 1, 'apasquale8t@sourceforge.net', '947 322 7251', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (319, 'EMP319', 'Debee Chapier', '2019-06-21', 0, 'dchapier8u@mozilla.org', '867 407 2744', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (320, 'EMP320', 'Venus Gever', '2019-09-15', 1, 'vgever8v@wordpress.org', '653 295 0624', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (321, 'EMP321', 'Oliver Clow', '2019-01-30', 0, 'oclow8w@ustream.tv', '841 535 3259', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (322, 'EMP322', 'Salomon Hessel', '2019-06-27', 0, 'shessel8x@dropbox.com', '985 628 8022', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (323, 'EMP323', 'Paulina Sill', '2019-07-19', 0, 'psill8y@un.org', '996 176 6475', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (324, 'EMP324', 'Lorraine Thurnham', '2019-06-20', 0, 'lthurnham8z@tumblr.com', '187 214 6369', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (325, 'EMP325', 'Aarika Pedlingham', '2019-05-26', 1, 'apedlingham90@newsvine.com', '156 560 6750', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (326, 'EMP326', 'Avram Gonneau', '2019-02-26', 0, 'agonneau91@nps.gov', '321 825 8821', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (327, 'EMP327', 'Nonnah Place', '2019-04-13', 1, 'nplace92@nydailynews.com', '669 301 4918', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (328, 'EMP328', 'Nancey Lasslett', '2019-08-23', 0, 'nlasslett93@odnoklassniki.ru', '250 567 4441', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (329, 'EMP329', 'Lutero Armell', '2019-11-01', 1, 'larmell94@issuu.com', '237 347 9797', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (330, 'EMP330', 'Lindsy Cuppleditch', '2019-11-28', 0, 'lcuppleditch95@adobe.com', '971 208 0680', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (331, 'EMP331', 'Ariadne Nickoll', '2019-10-08', 0, 'anickoll96@dailymail.co.uk', '972 897 5014', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (332, 'EMP332', 'Redford Addyman', '2019-05-28', 1, 'raddyman97@reddit.com', '168 844 7268', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (333, 'EMP333', 'Sunny Le Clercq', '2019-06-15', 0, 'sle98@ezinearticles.com', '234 220 9752', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (334, 'EMP334', 'Alberik Breffit', '2019-01-20', 1, 'abreffit99@de.vu', '483 464 0939', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (335, 'EMP335', 'Katey Gook', '2019-04-27', 1, 'kgook9a@free.fr', '591 463 8955', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (336, 'EMP336', 'Cody Houndson', '2019-01-22', 0, 'choundson9b@google.de', '802 890 2401', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (337, 'EMP337', 'Pascal Larkkem', '2019-05-08', 1, 'plarkkem9c@wikimedia.org', '770 470 9049', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (338, 'EMP338', 'Alexa Yurshev', '2019-04-21', 0, 'ayurshev9d@t-online.de', '590 575 9501', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (339, 'EMP339', 'Hally Coghlin', '2019-02-10', 0, 'hcoghlin9e@dion.ne.jp', '769 345 0826', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (340, 'EMP340', 'Jason Pargeter', '2019-05-14', 0, 'jpargeter9f@friendfeed.com', '996 597 9504', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (341, 'EMP341', 'Dalli Matzel', '2019-01-13', 1, 'dmatzel9g@dell.com', '137 762 3786', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (342, 'EMP342', 'Artie Mullender', '2019-03-23', 1, 'amullender9h@tumblr.com', '225 545 5616', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (343, 'EMP343', 'Suzanna Ainsley', '2019-08-23', 0, 'sainsley9i@cnbc.com', '736 199 4053', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (344, 'EMP344', 'Merrilee Ison', '2019-06-02', 0, 'mison9j@harvard.edu', '941 539 6241', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (345, 'EMP345', 'Ruben Petrillo', '2019-03-09', 0, 'rpetrillo9k@bing.com', '180 125 7116', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (346, 'EMP346', 'Kata Ors', '2019-09-21', 0, 'kors9l@artisteer.com', '774 509 7977', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (347, 'EMP347', 'Miner Bexley', '2019-07-24', 1, 'mbexley9m@hao123.com', '788 377 2683', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (348, 'EMP348', 'Munmro Bambery', '2019-10-31', 1, 'mbambery9n@addthis.com', '424 813 3416', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (349, 'EMP349', 'Bryant Reiglar', '2019-08-02', 1, 'breiglar9o@macromedia.com', '446 258 3942', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (350, 'EMP350', 'Christie Lebreton', '2019-10-01', 0, 'clebreton9p@stanford.edu', '349 341 7395', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (351, 'EMP351', 'Ewen Murcutt', '2019-06-15', 1, 'emurcutt9q@sogou.com', '720 851 4087', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (352, 'EMP352', 'Brana Saxton', '2019-09-06', 1, 'bsaxton9r@google.nl', '125 881 3360', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (353, 'EMP353', 'Carlos Kinvan', '2019-05-13', 0, 'ckinvan9s@engadget.com', '286 648 8128', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (354, 'EMP354', 'Nahum Jeffels', '2019-01-18', 1, 'njeffels9t@washingtonpost.com', '632 618 8795', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (355, 'EMP355', 'Beck Snartt', '2018-12-30', 1, 'bsnartt9u@exblog.jp', '903 630 5890', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (356, 'EMP356', 'Judye Wallis', '2019-02-17', 1, 'jwallis9v@about.me', '860 500 5638', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (357, 'EMP357', 'Wilhelmina Noone', '2019-08-15', 0, 'wnoone9w@taobao.com', '882 969 5082', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (358, 'EMP358', 'Joseph Eagell', '2019-01-27', 0, 'jeagell9x@cbc.ca', '996 527 7117', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (359, 'EMP359', 'Darline Del Checolo', '2019-05-19', 1, 'ddel9y@t-online.de', '259 128 0690', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (360, 'EMP360', 'Sherlocke Grumley', '2019-01-05', 1, 'sgrumley9z@nifty.com', '904 983 2379', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (361, 'EMP361', 'Peyter Fehner', '2019-07-03', 1, 'pfehnera0@irs.gov', '520 488 6761', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (362, 'EMP362', 'Caryl Brooking', '2019-08-10', 0, 'cbrookinga1@cam.ac.uk', '648 438 9708', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (363, 'EMP363', 'Glad Wildt', '2019-12-21', 0, 'gwildta2@tinyurl.com', '845 497 7803', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (364, 'EMP364', 'Felike Candlish', '2019-09-25', 1, 'fcandlisha3@ask.com', '512 493 2358', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (365, 'EMP365', 'Zorah Yosselevitch', '2019-08-01', 1, 'zyosselevitcha4@canalblog.com', '929 820 0350', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (366, 'EMP366', 'Ashlen Couthard', '2019-09-29', 0, 'acoutharda5@infoseek.co.jp', '395 305 1212', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (367, 'EMP367', 'Suellen Solway', '2019-04-05', 0, 'ssolwaya6@huffingtonpost.com', '762 145 8724', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (368, 'EMP368', 'Mateo Bonafacino', '2019-02-22', 1, 'mbonafacinoa7@t-online.de', '142 805 0496', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (369, 'EMP369', 'Gabbey April', '2019-08-26', 0, 'gaprila8@ftc.gov', '202 605 4756', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (370, 'EMP370', 'Perkin McGowan', '2019-05-13', 1, 'pmcgowana9@salon.com', '179 435 3736', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (371, 'EMP371', 'Caz Honnan', '2019-06-01', 0, 'chonnanaa@ovh.net', '947 443 0981', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (372, 'EMP372', 'Kristoffer Bill', '2019-02-22', 0, 'kbillab@patch.com', '154 928 5471', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (373, 'EMP373', 'Dorris Jedrzejewsky', '2019-07-05', 0, 'djedrzejewskyac@shinystat.com', '164 877 5244', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (374, 'EMP374', 'Mendie Kemm', '2019-04-12', 0, 'mkemmad@slate.com', '844 356 0526', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (375, 'EMP375', 'Heloise Scammell', '2019-03-09', 1, 'hscammellae@behance.net', '363 660 7179', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (376, 'EMP376', 'Dyanne Eric', '2019-08-02', 1, 'dericaf@irs.gov', '790 425 1614', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (377, 'EMP377', 'Andee Halling', '2019-04-07', 1, 'ahallingag@unc.edu', '475 959 9184', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (378, 'EMP378', 'Demetris Flecknoe', '2019-10-05', 1, 'dflecknoeah@epa.gov', '578 914 4966', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (379, 'EMP379', 'Odette Ferre', '2019-09-10', 1, 'oferreai@cisco.com', '908 407 4509', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (380, 'EMP380', 'Karil Boorne', '2019-10-30', 0, 'kboorneaj@topsy.com', '204 808 1632', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (381, 'EMP381', 'Serene Autry', '2019-04-22', 0, 'sautryak@baidu.com', '670 525 8642', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (382, 'EMP382', 'Cathee Frowen', '2019-07-22', 1, 'cfrowenal@de.vu', '617 736 7017', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (383, 'EMP383', 'Abelard Pennell', '2019-05-01', 0, 'apennellam@rakuten.co.jp', '436 730 6206', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (384, 'EMP384', 'Berton Kestin', '2019-06-04', 1, 'bkestinan@huffingtonpost.com', '638 280 2362', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (385, 'EMP385', 'Borden Neylan', '2019-09-06', 1, 'bneylanao@nba.com', '395 331 0248', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (386, 'EMP386', 'Madella Jurca', '2019-10-22', 1, 'mjurcaap@furl.net', '923 539 6587', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (387, 'EMP387', 'Muire Palfrey', '2019-01-13', 0, 'mpalfreyaq@exblog.jp', '489 331 5047', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (388, 'EMP388', 'Woodman Daughtery', '2019-08-28', 0, 'wdaughteryar@businessweek.com', '964 444 3749', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (389, 'EMP389', 'Corette Heinecke', '2019-05-14', 0, 'cheineckeas@google.pl', '566 836 2036', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (390, 'EMP390', 'Riva Downham', '2019-07-19', 0, 'rdownhamat@walmart.com', '415 712 2155', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (391, 'EMP391', 'Cole Masey', '2019-12-17', 1, 'cmaseyau@acquirethisname.com', '970 671 2491', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (392, 'EMP392', 'Sarene Vergine', '2019-01-05', 0, 'svergineav@printfriendly.com', '899 949 7753', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (393, 'EMP393', 'Tracie Berns', '2019-01-10', 1, 'tbernsaw@sphinn.com', '149 293 5513', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (394, 'EMP394', 'Ariela Bolzen', '2019-11-22', 1, 'abolzenax@cafepress.com', '321 361 9370', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (395, 'EMP395', 'Pavel Ledamun', '2019-06-10', 0, 'pledamunay@prlog.org', '337 349 7439', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (396, 'EMP396', 'Wilek Starling', '2019-12-17', 1, 'wstarlingaz@lulu.com', '898 298 9188', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (397, 'EMP397', 'Norry Stanett', '2019-07-29', 0, 'nstanettb0@t-online.de', '458 444 8901', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (398, 'EMP398', 'Hedwig Claye', '2019-10-16', 1, 'hclayeb1@wikispaces.com', '446 131 2221', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (399, 'EMP399', 'Courtney Goodbairn', '2019-07-20', 0, 'cgoodbairnb2@mozilla.org', '904 407 0217', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (400, 'EMP400', 'Barnabas Reynish', '2019-02-22', 1, 'breynishb3@foxnews.com', '821 970 9278', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (401, 'EMP401', 'Romola Klimentov', '2019-06-29', 0, 'rklimentovb4@mashable.com', '803 651 5355', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (402, 'EMP402', 'Doug Aarons', '2019-07-25', 1, 'daaronsb5@fda.gov', '496 861 8790', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (403, 'EMP403', 'Simmonds Graben', '2019-12-25', 1, 'sgrabenb6@dagondesign.com', '866 432 5012', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (404, 'EMP404', 'Farrel Drayson', '2019-06-10', 1, 'fdraysonb7@who.int', '464 960 2697', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (405, 'EMP405', 'Edsel Manion', '2019-03-18', 0, 'emanionb8@cbc.ca', '375 882 0120', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (406, 'EMP406', 'Norris Hexham', '2019-06-13', 0, 'nhexhamb9@sfgate.com', '463 864 0896', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (407, 'EMP407', 'Wileen Lorman', '2019-04-05', 1, 'wlormanba@arstechnica.com', '818 803 1808', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (408, 'EMP408', 'Padraig Ledley', '2019-08-08', 1, 'pledleybb@squarespace.com', '558 142 1690', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (409, 'EMP409', 'Win Ager', '2019-02-24', 0, 'wagerbc@cyberchimps.com', '340 257 7236', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (410, 'EMP410', 'Estel Oswick', '2019-02-15', 0, 'eoswickbd@salon.com', '878 167 2689', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (411, 'EMP411', 'Missy Segges', '2019-01-26', 1, 'mseggesbe@digg.com', '824 348 8861', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (412, 'EMP412', 'Augustina Stoile', '2019-04-05', 1, 'astoilebf@shutterfly.com', '155 237 5416', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (413, 'EMP413', 'Charlotta Bedboro', '2019-01-30', 1, 'cbedborobg@mapy.cz', '522 268 7513', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (414, 'EMP414', 'Kellen Hover', '2019-10-26', 0, 'khoverbh@sbwire.com', '457 173 1649', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (415, 'EMP415', 'Artemas Clist', '2019-01-03', 1, 'aclistbi@networksolutions.com', '918 772 6461', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (416, 'EMP416', 'Yalonda Humber', '2019-05-25', 0, 'yhumberbj@yale.edu', '850 791 0129', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (417, 'EMP417', 'Lilla Bartomieu', '2019-11-01', 0, 'lbartomieubk@timesonline.co.uk', '444 468 7375', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (418, 'EMP418', 'Lea Pettegre', '2019-05-09', 0, 'lpettegrebl@youku.com', '722 822 9583', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (419, 'EMP419', 'Shamus Giraudoux', '2019-03-15', 1, 'sgiraudouxbm@biglobe.ne.jp', '509 683 1021', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (420, 'EMP420', 'Anna Merryman', '2019-08-16', 0, 'amerrymanbn@tumblr.com', '948 692 7918', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (421, 'EMP421', 'Trista McGrory', '2019-03-18', 0, 'tmcgrorybo@loc.gov', '110 914 5965', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (422, 'EMP422', 'Therese Stallard', '2019-03-01', 0, 'tstallardbp@bravesites.com', '429 321 5804', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (423, 'EMP423', 'Thoma Keasey', '2019-08-09', 1, 'tkeaseybq@slideshare.net', '200 321 7235', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (424, 'EMP424', 'Stacee Stearley', '2019-01-08', 0, 'sstearleybr@surveymonkey.com', '451 685 7548', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (425, 'EMP425', 'Noach Mundie', '2019-01-04', 1, 'nmundiebs@hc360.com', '743 338 4396', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (426, 'EMP426', 'Claudian Murname', '2019-08-09', 1, 'cmurnamebt@msu.edu', '303 551 5715', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (427, 'EMP427', 'Chryste Corker', '2019-06-14', 1, 'ccorkerbu@chronoengine.com', '201 603 8489', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (428, 'EMP428', 'Pavlov Boughen', '2019-12-16', 0, 'pboughenbv@redcross.org', '703 208 7362', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (429, 'EMP429', 'Uriah Grossman', '2019-05-08', 0, 'ugrossmanbw@omniture.com', '110 898 9432', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (430, 'EMP430', 'Tina Kneath', '2019-11-27', 0, 'tkneathbx@phoca.cz', '352 710 7355', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (431, 'EMP431', 'Gabrielle Dot', '2019-04-11', 0, 'gdotby@twitpic.com', '874 267 1186', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (432, 'EMP432', 'Tish Harmes', '2019-01-21', 1, 'tharmesbz@wsj.com', '391 373 7224', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (433, 'EMP433', 'Clarice Hanselmann', '2019-11-08', 1, 'chanselmannc0@businessinsider.com', '690 172 5619', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (434, 'EMP434', 'Hetti Dykes', '2019-08-10', 1, 'hdykesc1@simplemachines.org', '703 805 4572', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (435, 'EMP435', 'Lynne Torry', '2019-10-01', 0, 'ltorryc2@shop-pro.jp', '290 960 2663', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (436, 'EMP436', 'Sydney Challender', '2019-12-12', 1, 'schallenderc3@usatoday.com', '768 967 4936', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (437, 'EMP437', 'Tadeo Gosden', '2019-08-02', 0, 'tgosdenc4@networkadvertising.org', '711 363 8532', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (438, 'EMP438', 'Raoul Balden', '2019-05-27', 0, 'rbaldenc5@constantcontact.com', '158 971 6976', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (439, 'EMP439', 'Audre Hiers', '2019-08-23', 0, 'ahiersc6@discovery.com', '467 845 3895', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (440, 'EMP440', 'Rinaldo Basant', '2019-01-29', 1, 'rbasantc7@weebly.com', '505 332 4071', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (441, 'EMP441', 'Marie-ann Nerne', '2019-07-29', 0, 'mnernec8@deliciousdays.com', '797 649 3495', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (442, 'EMP442', 'Baird Dockrell', '2019-03-22', 1, 'bdockrellc9@free.fr', '987 264 6167', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (443, 'EMP443', 'Bunnie Augar', '2019-06-12', 0, 'baugarca@hibu.com', '776 135 4630', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (444, 'EMP444', 'Lillis Hansod', '2019-05-19', 0, 'lhansodcb@pinterest.com', '405 784 7237', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (445, 'EMP445', 'Maribel Prosser', '2019-11-26', 1, 'mprossercc@narod.ru', '888 151 0885', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (446, 'EMP446', 'Ailey Calderon', '2019-10-25', 1, 'acalderoncd@symantec.com', '864 622 6278', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (447, 'EMP447', 'Roddie Binnie', '2019-11-03', 0, 'rbinniece@so-net.ne.jp', '744 336 0540', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (448, 'EMP448', 'Myrta Weall', '2019-04-29', 0, 'mweallcf@icq.com', '129 135 4782', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (449, 'EMP449', 'Dav Alvarez', '2019-09-27', 1, 'dalvarezcg@facebook.com', '999 716 1585', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (450, 'EMP450', 'Gabby Owthwaite', '2019-02-26', 1, 'gowthwaitech@devhub.com', '903 195 7726', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (451, 'EMP451', 'Chandra Hallum', '2019-09-12', 0, 'challumci@dailymail.co.uk', '661 522 3100', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (452, 'EMP452', 'Susette Gyves', '2019-01-18', 1, 'sgyvescj@loc.gov', '305 656 2652', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (453, 'EMP453', 'Rahel Boundy', '2019-05-16', 0, 'rboundyck@icq.com', '301 158 1029', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (454, 'EMP454', 'Shirley Wisbey', '2019-11-26', 0, 'swisbeycl@intel.com', '945 616 4077', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (455, 'EMP455', 'Spence Credland', '2019-03-06', 0, 'scredlandcm@huffingtonpost.com', '396 241 4629', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (456, 'EMP456', 'Larina Gantlett', '2019-03-20', 1, 'lgantlettcn@dailymotion.com', '507 611 9166', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (457, 'EMP457', 'Martina Parsonson', '2019-11-29', 1, 'mparsonsonco@dyndns.org', '425 322 5648', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (458, 'EMP458', 'Laurel Mateo', '2019-07-21', 0, 'lmateocp@howstuffworks.com', '612 837 2302', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (459, 'EMP459', 'Emmit Dawtry', '2019-10-04', 0, 'edawtrycq@nps.gov', '561 977 8797', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (460, 'EMP460', 'Chas O\'Hartagan', '2019-04-17', 1, 'cohartagancr@google.nl', '222 343 8878', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (461, 'EMP461', 'Abbye Hallatt', '2019-12-09', 0, 'ahallattcs@wikia.com', '903 404 1527', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (462, 'EMP462', 'Violet Tallow', '2019-09-13', 1, 'vtallowct@symantec.com', '184 763 7250', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (463, 'EMP463', 'Marget Rolfe', '2019-08-22', 1, 'mrolfecu@mac.com', '334 408 9862', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (464, 'EMP464', 'Hermine Gebhard', '2019-02-19', 1, 'hgebhardcv@cdc.gov', '354 636 8835', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (465, 'EMP465', 'Jaimie Ellesworthe', '2019-12-20', 0, 'jellesworthecw@facebook.com', '209 902 2455', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (466, 'EMP466', 'Loren Stit', '2019-07-15', 0, 'lstitcx@aboutads.info', '314 127 4455', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (467, 'EMP467', 'Micky Wheatman', '2019-09-04', 0, 'mwheatmancy@google.co.jp', '229 624 1908', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (468, 'EMP468', 'Philippe Cuchey', '2019-03-29', 1, 'pcucheycz@reddit.com', '894 444 8941', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (469, 'EMP469', 'Ofelia Luberti', '2019-04-16', 0, 'olubertid0@themeforest.net', '856 100 6996', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (470, 'EMP470', 'Myra Crawshaw', '2019-01-05', 0, 'mcrawshawd1@feedburner.com', '404 980 1618', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (471, 'EMP471', 'Ailene Bearcroft', '2019-02-04', 0, 'abearcroftd2@slideshare.net', '172 725 1927', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (472, 'EMP472', 'Lucinda Gynne', '2019-05-03', 0, 'lgynned3@intel.com', '144 169 2461', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (473, 'EMP473', 'Aurelie Bortolutti', '2019-07-11', 1, 'abortoluttid4@surveymonkey.com', '246 375 6587', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (474, 'EMP474', 'Shalna Jamrowicz', '2019-07-04', 1, 'sjamrowiczd5@biglobe.ne.jp', '681 415 1168', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (475, 'EMP475', 'Noland Povah', '2019-08-12', 0, 'npovahd6@unblog.fr', '937 210 1419', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (476, 'EMP476', 'Ulrike Kezar', '2019-10-27', 1, 'ukezard7@gravatar.com', '666 411 9288', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (477, 'EMP477', 'Lisbeth Goch', '2019-09-30', 0, 'lgochd8@google.de', '402 522 3011', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (478, 'EMP478', 'Sean Grovier', '2019-05-12', 0, 'sgrovierd9@php.net', '164 211 7645', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (479, 'EMP479', 'Irv Keirle', '2019-01-21', 1, 'ikeirleda@tiny.cc', '755 939 2497', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (480, 'EMP480', 'Tonnie Brunker', '2019-10-26', 1, 'tbrunkerdb@chicagotribune.com', '948 738 8920', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (481, 'EMP481', 'Gunter Moorey', '2019-04-05', 1, 'gmooreydc@theguardian.com', '696 588 9864', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (482, 'EMP482', 'Sonni MacGettigen', '2019-03-03', 1, 'smacgettigendd@tumblr.com', '812 308 6155', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (483, 'EMP483', 'Hersh Levine', '2019-12-22', 0, 'hlevinede@google.com.au', '810 651 2347', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (484, 'EMP484', 'Alex Le Sieur', '2019-09-01', 1, 'aledf@loc.gov', '438 148 8352', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (485, 'EMP485', 'Gerek Bushnell', '2019-11-14', 1, 'gbushnelldg@epa.gov', '557 816 9243', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (486, 'EMP486', 'Kaycee Cuddehy', '2019-05-12', 1, 'kcuddehydh@spotify.com', '105 853 7256', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (487, 'EMP487', 'Marve Marfell', '2019-04-12', 0, 'mmarfelldi@google.pl', '340 496 1145', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (488, 'EMP488', 'Travus Camellini', '2019-07-02', 1, 'tcamellinidj@weibo.com', '657 929 9891', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (489, 'EMP489', 'Toby Halsworth', '2019-03-03', 1, 'thalsworthdk@nydailynews.com', '368 661 7311', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (490, 'EMP490', 'Isador Veasey', '2019-03-15', 1, 'iveaseydl@thetimes.co.uk', '774 526 8860', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (491, 'EMP491', 'Lyndel Whilde', '2019-11-14', 1, 'lwhildedm@yale.edu', '199 112 2189', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (492, 'EMP492', 'Erwin McCulley', '2019-03-29', 0, 'emcculleydn@cpanel.net', '307 328 4107', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (493, 'EMP493', 'Ellyn Petts', '2019-08-08', 1, 'epettsdo@eventbrite.com', '491 383 1265', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (494, 'EMP494', 'Lemar Deveril', '2019-09-29', 0, 'ldeverildp@admin.ch', '303 705 3880', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (495, 'EMP495', 'Errol Pluvier', '2019-05-17', 1, 'epluvierdq@wisc.edu', '263 825 5657', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (496, 'EMP496', 'Allyce Tzar', '2019-09-09', 1, 'atzardr@virginia.edu', '334 113 3555', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (497, 'EMP497', 'Julienne Pude', '2019-10-28', 1, 'jpudeds@godaddy.com', '903 589 0767', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (498, 'EMP498', 'Bibbie Tonkinson', '2019-01-06', 0, 'btonkinsondt@blogger.com', '292 548 2654', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (499, 'EMP499', 'Lauree Glentworth', '2019-02-23', 0, 'lglentworthdu@pinterest.com', '307 121 8073', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (500, 'EMP500', 'Edvard Jupp', '2019-08-13', 0, 'ejuppdv@furl.net', '926 160 0030', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (501, 'EMP501', 'Celestia Lorenzo', '2019-10-24', 1, 'clorenzodw@slate.com', '382 656 9776', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (502, 'EMP502', 'Paulie Trevance', '2019-03-22', 0, 'ptrevancedx@comcast.net', '632 993 8777', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (503, 'EMP503', 'Matilde Maffezzoli', '2019-08-05', 1, 'mmaffezzolidy@mysql.com', '743 138 9878', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (504, 'EMP504', 'Clemente Keitch', '2019-01-18', 1, 'ckeitchdz@netlog.com', '412 333 5708', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (505, 'EMP505', 'Denny Walkingshaw', '2019-01-02', 1, 'dwalkingshawe0@psu.edu', '936 779 6545', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (506, 'EMP506', 'Stacie Sprosson', '2019-09-29', 0, 'ssprossone1@youtu.be', '138 237 0804', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (507, 'EMP507', 'Linoel Brugsma', '2019-08-12', 1, 'lbrugsmae2@fda.gov', '651 562 7245', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (508, 'EMP508', 'Kendrick Brownlie', '2019-02-22', 0, 'kbrownliee3@google.nl', '451 192 1865', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (509, 'EMP509', 'Valaree Newton', '2019-11-09', 0, 'vnewtone4@marketwatch.com', '435 885 9169', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (510, 'EMP510', 'Donny Morit', '2019-11-23', 0, 'dmorite5@weather.com', '785 599 7460', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (511, 'EMP511', 'Keenan Ronchetti', '2019-12-20', 1, 'kronchettie6@newsvine.com', '150 815 7199', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (512, 'EMP512', 'Petr Le Gall', '2019-03-22', 0, 'plee7@mayoclinic.com', '479 504 3432', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (513, 'EMP513', 'Julio Castleman', '2019-08-16', 1, 'jcastlemane8@vinaora.com', '493 896 1444', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (514, 'EMP514', 'Julina Firth', '2019-05-08', 0, 'jfirthe9@odnoklassniki.ru', '744 889 4656', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (515, 'EMP515', 'Stevy Wellard', '2019-01-01', 1, 'swellardea@techcrunch.com', '453 115 9072', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (516, 'EMP516', 'Benn Haggarty', '2019-07-26', 1, 'bhaggartyeb@umich.edu', '288 829 7330', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (517, 'EMP517', 'Edyth Lyddiard', '2019-01-04', 0, 'elyddiardec@over-blog.com', '522 957 6830', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (518, 'EMP518', 'Mallorie Germon', '2019-05-27', 1, 'mgermoned@slashdot.org', '131 311 5699', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (519, 'EMP519', 'Sargent Cosyns', '2019-04-18', 1, 'scosynsee@hp.com', '336 391 7015', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (520, 'EMP520', 'Phil Pashba', '2019-07-28', 1, 'ppashbaef@answers.com', '285 398 0578', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (521, 'EMP521', 'Tommie Simonard', '2019-04-17', 0, 'tsimonardeg@flavors.me', '347 988 1302', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (522, 'EMP522', 'Meryl Lindop', '2019-07-20', 0, 'mlindopeh@unblog.fr', '890 689 5877', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (523, 'EMP523', 'Darelle Rosenschein', '2019-12-21', 1, 'drosenscheinei@hp.com', '183 340 4329', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (524, 'EMP524', 'Sancho Heathwood', '2019-03-15', 0, 'sheathwoodej@tuttocitta.it', '381 362 5770', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (525, 'EMP525', 'Ivor Hagley', '2019-10-25', 1, 'ihagleyek@shutterfly.com', '736 890 0285', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (526, 'EMP526', 'Myrtie Cometti', '2019-09-29', 1, 'mcomettiel@comcast.net', '294 808 4787', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (527, 'EMP527', 'Wylma Gaffey', '2019-03-31', 1, 'wgaffeyem@sun.com', '428 563 7259', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (528, 'EMP528', 'Arri Paiton', '2019-04-04', 0, 'apaitonen@tripod.com', '271 305 0763', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (529, 'EMP529', 'Ricardo Molnar', '2019-02-16', 0, 'rmolnareo@disqus.com', '347 624 0817', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (530, 'EMP530', 'Antonin Whelpton', '2019-12-05', 0, 'awhelptonep@youtu.be', '762 187 1689', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (531, 'EMP531', 'Roselia Sussems', '2019-04-11', 1, 'rsussemseq@so-net.ne.jp', '990 957 1829', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (532, 'EMP532', 'Krishna Harpur', '2019-12-21', 0, 'kharpurer@netlog.com', '193 376 9654', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (533, 'EMP533', 'Andros Agerskow', '2019-12-15', 0, 'aagerskowes@cocolog-nifty.com', '126 402 6355', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (534, 'EMP534', 'Tonnie McClarence', '2019-06-21', 1, 'tmcclarenceet@studiopress.com', '967 479 0069', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (535, 'EMP535', 'Matilde Goard', '2019-03-08', 0, 'mgoardeu@ustream.tv', '258 410 6144', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (536, 'EMP536', 'Wenonah Denyagin', '2019-03-29', 1, 'wdenyaginev@cocolog-nifty.com', '305 842 2887', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (537, 'EMP537', 'Sarina Gresty', '2019-04-27', 0, 'sgrestyew@1688.com', '610 275 2813', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (538, 'EMP538', 'Meriel Plitz', '2019-09-01', 0, 'mplitzex@example.com', '403 256 5588', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (539, 'EMP539', 'Iorgo Fretwell', '2019-09-18', 0, 'ifretwelley@twitpic.com', '577 423 3870', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (540, 'EMP540', 'Henderson Outhwaite', '2019-02-17', 1, 'houthwaiteez@squarespace.com', '825 737 0706', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (541, 'EMP541', 'Corty Luberti', '2019-10-10', 1, 'clubertif0@imageshack.us', '610 440 7141', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (542, 'EMP542', 'Jimmie Wesson', '2019-12-04', 1, 'jwessonf1@is.gd', '554 527 3038', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (543, 'EMP543', 'Leanor McIlmorie', '2019-07-31', 0, 'lmcilmorief2@wix.com', '258 554 6542', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (544, 'EMP544', 'Darcy Maron', '2019-09-15', 1, 'dmaronf3@biblegateway.com', '251 424 6186', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (545, 'EMP545', 'Lela Tzarkov', '2019-07-13', 1, 'ltzarkovf4@ifeng.com', '530 923 1090', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (546, 'EMP546', 'Claudian Biglin', '2019-04-23', 1, 'cbiglinf5@people.com.cn', '641 178 9317', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (547, 'EMP547', 'Sydney Largent', '2019-08-12', 0, 'slargentf6@seattletimes.com', '449 733 0256', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (548, 'EMP548', 'Skell Leebetter', '2019-12-06', 1, 'sleebetterf7@wordpress.org', '555 794 3328', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (549, 'EMP549', 'Bucky MacDonough', '2019-12-24', 0, 'bmacdonoughf8@springer.com', '968 615 5659', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (550, 'EMP550', 'Ambrose Annakin', '2019-12-19', 1, 'aannakinf9@ezinearticles.com', '732 461 6202', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (551, 'EMP551', 'Bernadine Ericsson', '2019-12-18', 0, 'bericssonfa@sakura.ne.jp', '384 881 6862', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (552, 'EMP552', 'Ivar Edinburgh', '2019-01-14', 0, 'iedinburghfb@dagondesign.com', '240 345 3346', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (553, 'EMP553', 'Bink Jackling', '2019-07-24', 1, 'bjacklingfc@fastcompany.com', '932 356 9635', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (554, 'EMP554', 'Rex Fieldhouse', '2019-06-24', 1, 'rfieldhousefd@eventbrite.com', '876 220 4345', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (555, 'EMP555', 'Gregoor Charlesworth', '2019-09-26', 1, 'gcharlesworthfe@newsvine.com', '600 541 2778', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (556, 'EMP556', 'Yoshi Dursley', '2019-07-15', 0, 'ydursleyff@zdnet.com', '798 338 0097', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (557, 'EMP557', 'Any Tours', '2019-04-13', 0, 'atoursfg@dyndns.org', '422 646 8985', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (558, 'EMP558', 'Lesley Matchett', '2019-10-22', 1, 'lmatchettfh@foxnews.com', '872 910 4489', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (559, 'EMP559', 'Alvis Caitlin', '2019-03-21', 1, 'acaitlinfi@cbc.ca', '123 502 9394', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (560, 'EMP560', 'Ivar Glyn', '2019-01-15', 0, 'iglynfj@dmoz.org', '666 571 7245', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (561, 'EMP561', 'Bell Austin', '2019-08-23', 1, 'baustinfk@japanpost.jp', '618 296 0854', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (562, 'EMP562', 'Alica Beverage', '2019-07-15', 1, 'abeveragefl@toplist.cz', '641 978 5724', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (563, 'EMP563', 'Rozella Downs', '2019-12-18', 1, 'rdownsfm@feedburner.com', '545 167 1439', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (564, 'EMP564', 'Karena Bisatt', '2019-04-19', 0, 'kbisattfn@ftc.gov', '534 905 2294', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (565, 'EMP565', 'Annamaria Kruger', '2019-06-12', 1, 'akrugerfo@weebly.com', '902 943 4064', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (566, 'EMP566', 'Guendolen Campanelli', '2019-09-17', 1, 'gcampanellifp@rediff.com', '914 192 7360', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (567, 'EMP567', 'Ricoriki Silverton', '2019-11-17', 1, 'rsilvertonfq@chron.com', '160 230 1233', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (568, 'EMP568', 'Erny Cobleigh', '2019-02-01', 0, 'ecobleighfr@usa.gov', '703 982 4187', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (569, 'EMP569', 'Laurent Dureden', '2019-10-08', 1, 'lduredenfs@jiathis.com', '885 643 2538', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (570, 'EMP570', 'Xylia Shapira', '2019-03-27', 0, 'xshapiraft@globo.com', '797 609 7503', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (571, 'EMP571', 'Abigael Doxey', '2019-10-08', 0, 'adoxeyfu@ed.gov', '189 386 4542', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (572, 'EMP572', 'Ellwood Sobey', '2019-04-14', 0, 'esobeyfv@google.pl', '834 503 7394', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (573, 'EMP573', 'Elspeth Jehan', '2019-06-30', 0, 'ejehanfw@accuweather.com', '730 681 9062', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (574, 'EMP574', 'Calhoun Aucott', '2019-03-06', 1, 'caucottfx@skype.com', '936 175 6038', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (575, 'EMP575', 'Kylen Kryzhov', '2019-07-09', 1, 'kkryzhovfy@webnode.com', '449 516 0421', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (576, 'EMP576', 'Drusie Scarlon', '2019-08-27', 1, 'dscarlonfz@merriam-webster.com', '714 742 4382', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (577, 'EMP577', 'Web Rosendale', '2019-07-12', 1, 'wrosendaleg0@narod.ru', '621 722 9482', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (578, 'EMP578', 'Dal Macklam', '2019-11-12', 1, 'dmacklamg1@last.fm', '262 558 2401', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (579, 'EMP579', 'Sophia Gierck', '2019-04-06', 1, 'sgierckg2@bigcartel.com', '540 516 9371', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (580, 'EMP580', 'Nikita Authers', '2019-05-24', 0, 'nauthersg3@samsung.com', '891 335 6188', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (581, 'EMP581', 'Katine Forber', '2019-11-20', 1, 'kforberg4@europa.eu', '454 363 1208', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (582, 'EMP582', 'Bernardo Goodsir', '2019-07-19', 0, 'bgoodsirg5@europa.eu', '363 402 7094', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (583, 'EMP583', 'Lolita Mounter', '2019-03-29', 0, 'lmounterg6@reference.com', '721 486 3687', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (584, 'EMP584', 'Berkley Hellen', '2019-01-30', 0, 'bhelleng7@imdb.com', '310 281 7362', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (585, 'EMP585', 'Oberon O\'Nions', '2019-11-06', 0, 'oonionsg8@free.fr', '607 118 2011', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (586, 'EMP586', 'Modesty Livingstone', '2019-04-01', 0, 'mlivingstoneg9@baidu.com', '327 381 1354', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (587, 'EMP587', 'Deana Varnam', '2019-10-06', 0, 'dvarnamga@acquirethisname.com', '399 403 7571', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (588, 'EMP588', 'Heda Rankin', '2019-04-15', 0, 'hrankingb@telegraph.co.uk', '466 391 3585', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (589, 'EMP589', 'Margit Balsillie', '2019-01-03', 0, 'mbalsilliegc@wisc.edu', '911 191 4649', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (590, 'EMP590', 'Madonna Meryett', '2019-07-28', 0, 'mmeryettgd@google.de', '559 740 8487', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (591, 'EMP591', 'Vail Menault', '2019-09-18', 1, 'vmenaultge@hugedomains.com', '658 353 9927', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (592, 'EMP592', 'Portia Akrigg', '2019-02-06', 1, 'pakrigggf@adobe.com', '688 507 2484', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (593, 'EMP593', 'Clay Kynston', '2019-06-09', 0, 'ckynstongg@scientificamerican.com', '608 102 0086', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (594, 'EMP594', 'Jaquith Kalkhoven', '2019-01-18', 0, 'jkalkhovengh@cargocollective.com', '979 796 6226', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (595, 'EMP595', 'Leonardo Beckworth', '2019-10-29', 0, 'lbeckworthgi@drupal.org', '325 673 7724', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (596, 'EMP596', 'Holmes Willerson', '2019-02-07', 0, 'hwillersongj@ehow.com', '318 328 0838', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (597, 'EMP597', 'Hube Burges', '2019-04-27', 1, 'hburgesgk@unesco.org', '313 821 2761', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (598, 'EMP598', 'Libbey Demcak', '2019-02-13', 1, 'ldemcakgl@washingtonpost.com', '379 662 8505', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (599, 'EMP599', 'Winni Pollie', '2019-11-21', 1, 'wpolliegm@ft.com', '560 979 6402', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (600, 'EMP600', 'Nigel Grene', '2019-04-04', 1, 'ngrenegn@ustream.tv', '848 493 9869', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (601, 'EMP601', 'Allayne Peasey', '2019-12-08', 1, 'apeaseygo@people.com.cn', '441 454 3858', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (602, 'EMP602', 'Tally Brixey', '2019-11-19', 1, 'tbrixeygp@scientificamerican.com', '150 628 6375', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (603, 'EMP603', 'Silvio Risby', '2019-09-24', 1, 'srisbygq@goo.ne.jp', '885 729 3084', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (604, 'EMP604', 'Remington Girod', '2019-11-08', 0, 'rgirodgr@github.io', '187 811 5727', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (605, 'EMP605', 'Kaja Hackney', '2019-02-13', 1, 'khackneygs@abc.net.au', '642 895 3000', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (606, 'EMP606', 'Dill Olech', '2019-03-16', 0, 'dolechgt@foxnews.com', '466 279 6138', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (607, 'EMP607', 'Hobey Waterworth', '2019-04-06', 0, 'hwaterworthgu@hostgator.com', '253 179 7625', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (608, 'EMP608', 'Ben Durn', '2019-02-03', 0, 'bdurngv@jiathis.com', '381 698 1650', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (609, 'EMP609', 'Gail Combes', '2019-09-19', 1, 'gcombesgw@123-reg.co.uk', '991 546 7409', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (610, 'EMP610', 'Gilburt Pettit', '2019-09-23', 1, 'gpettitgx@apple.com', '976 721 9176', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (611, 'EMP611', 'Kalinda Findon', '2019-05-05', 0, 'kfindongy@google.ca', '778 923 6178', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (612, 'EMP612', 'Sydney Crankshaw', '2019-05-04', 1, 'scrankshawgz@wired.com', '110 772 0362', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (613, 'EMP613', 'Emelita Stean', '2019-04-11', 0, 'esteanh0@biblegateway.com', '380 973 8934', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (614, 'EMP614', 'Darlene Pheazey', '2019-03-07', 1, 'dpheazeyh1@so-net.ne.jp', '784 484 1794', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (615, 'EMP615', 'Pietrek Cubin', '2019-01-15', 0, 'pcubinh2@dmoz.org', '474 677 0758', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (616, 'EMP616', 'Rafaelia Houndson', '2019-06-24', 0, 'rhoundsonh3@free.fr', '537 379 1558', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (617, 'EMP617', 'Bebe Antonioni', '2019-06-13', 0, 'bantonionih4@unesco.org', '645 308 3048', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (618, 'EMP618', 'Edsel Tommasetti', '2019-06-15', 0, 'etommasettih5@pagesperso-orange.fr', '460 430 2620', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (619, 'EMP619', 'Kelley Cliss', '2019-09-11', 1, 'kclissh6@chicagotribune.com', '923 291 6818', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (620, 'EMP620', 'Diandra Copnall', '2019-05-10', 1, 'dcopnallh7@smugmug.com', '693 920 7495', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (621, 'EMP621', 'Yolanda Tredget', '2019-01-09', 0, 'ytredgeth8@usgs.gov', '645 866 5686', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (622, 'EMP622', 'Bartholemy Nial', '2019-06-15', 1, 'bnialh9@dagondesign.com', '316 424 0377', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (623, 'EMP623', 'Hy Rolling', '2019-08-21', 1, 'hrollingha@deviantart.com', '166 665 3867', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (624, 'EMP624', 'Datha Lardge', '2019-05-21', 0, 'dlardgehb@soundcloud.com', '996 663 4247', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (625, 'EMP625', 'Alfonse Symons', '2019-08-04', 0, 'asymonshc@dyndns.org', '187 774 8272', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (626, 'EMP626', 'Juan Streeten', '2019-09-11', 1, 'jstreetenhd@pen.io', '268 755 6746', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (627, 'EMP627', 'Skippy Stallworthy', '2019-11-12', 0, 'sstallworthyhe@yolasite.com', '609 889 8072', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (628, 'EMP628', 'Grady Prin', '2019-03-24', 0, 'gprinhf@europa.eu', '432 698 7133', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (629, 'EMP629', 'Teresita Caldicot', '2019-01-01', 0, 'tcaldicothg@nifty.com', '500 361 5465', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (630, 'EMP630', 'Cyril Barnish', '2019-01-11', 1, 'cbarnishhh@amazonaws.com', '110 237 7226', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (631, 'EMP631', 'Ninnette Rosenschein', '2019-06-27', 1, 'nrosenscheinhi@china.com.cn', '610 487 6255', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (632, 'EMP632', 'Sky Dobbing', '2019-08-27', 0, 'sdobbinghj@digg.com', '190 921 2365', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (633, 'EMP633', 'Tanner Ible', '2019-06-17', 1, 'tiblehk@ameblo.jp', '350 974 6711', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (634, 'EMP634', 'Beitris Swithenby', '2019-03-16', 0, 'bswithenbyhl@youtube.com', '266 761 2102', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (635, 'EMP635', 'Rowney Mawhinney', '2019-07-07', 0, 'rmawhinneyhm@uol.com.br', '598 636 6381', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (636, 'EMP636', 'Gerome Kloster', '2019-03-24', 1, 'gklosterhn@delicious.com', '918 616 0053', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (637, 'EMP637', 'Kiley Saltmarsh', '2019-04-01', 1, 'ksaltmarshho@barnesandnoble.com', '431 823 0027', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (638, 'EMP638', 'Cassey Booley', '2019-04-02', 1, 'cbooleyhp@mashable.com', '198 655 9356', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (639, 'EMP639', 'Dennie Skyme', '2019-08-17', 1, 'dskymehq@buzzfeed.com', '322 676 9729', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (640, 'EMP640', 'Rina Livingstone', '2019-09-19', 1, 'rlivingstonehr@businessinsider.com', '453 671 3142', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (641, 'EMP641', 'Cindelyn Bakeup', '2019-05-04', 0, 'cbakeuphs@discovery.com', '346 295 6242', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (642, 'EMP642', 'Bobbye Crocetto', '2019-01-13', 0, 'bcrocettoht@google.pl', '248 455 6203', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (643, 'EMP643', 'Ethan Olohan', '2019-10-04', 0, 'eolohanhu@salon.com', '288 997 6691', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (644, 'EMP644', 'Somerset Stieger', '2019-03-25', 1, 'sstiegerhv@dagondesign.com', '626 822 0219', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (645, 'EMP645', 'Dew Dello', '2019-06-22', 0, 'ddellohw@ucoz.com', '824 147 1555', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (646, 'EMP646', 'Raddie Manilove', '2019-01-11', 1, 'rmanilovehx@youtube.com', '202 385 7460', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (647, 'EMP647', 'Phil Margrie', '2019-09-05', 0, 'pmargriehy@kickstarter.com', '409 812 3096', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (648, 'EMP648', 'Shandie Southerill', '2019-10-30', 1, 'ssoutherillhz@phoca.cz', '482 414 2880', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (649, 'EMP649', 'Lief Stonestreet', '2019-07-18', 1, 'lstonestreeti0@tinypic.com', '125 872 2245', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (650, 'EMP650', 'Brit Jorg', '2019-08-26', 0, 'bjorgi1@noaa.gov', '139 590 6506', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (651, 'EMP651', 'Loretta Stitfall', '2019-07-03', 1, 'lstitfalli2@t.co', '553 583 6856', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (652, 'EMP652', 'Jarrett Antonchik', '2018-12-30', 1, 'jantonchiki3@dailymail.co.uk', '323 323 8994', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (653, 'EMP653', 'Marlo Lathleiffure', '2019-04-27', 1, 'mlathleiffurei4@google.fr', '924 846 9198', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (654, 'EMP654', 'Pace Doyley', '2019-08-19', 0, 'pdoyleyi5@dailymotion.com', '574 693 6936', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (655, 'EMP655', 'Rosemary Ketchell', '2019-04-16', 0, 'rketchelli6@dmoz.org', '819 322 2331', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (656, 'EMP656', 'Kristopher Purdie', '2019-07-11', 0, 'kpurdiei7@google.it', '334 148 1186', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (657, 'EMP657', 'Greggory Ginnety', '2019-09-09', 1, 'gginnetyi8@redcross.org', '665 235 6373', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (658, 'EMP658', 'Jo Allibon', '2019-01-25', 1, 'jalliboni9@marketwatch.com', '504 631 3888', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (659, 'EMP659', 'Dacey Ambrogini', '2019-12-15', 1, 'dambroginiia@tripod.com', '756 932 8065', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (660, 'EMP660', 'Chrissie Varnals', '2019-04-12', 0, 'cvarnalsib@google.ru', '242 385 9764', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (661, 'EMP661', 'Reinald Bursnall', '2019-12-24', 1, 'rbursnallic@tiny.cc', '979 825 8731', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (662, 'EMP662', 'Cammi Paff', '2019-04-17', 0, 'cpaffid@privacy.gov.au', '915 721 8950', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (663, 'EMP663', 'Roldan McLaughlin', '2019-09-02', 1, 'rmclaughlinie@angelfire.com', '704 316 1145', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (664, 'EMP664', 'Garek Banton', '2019-10-24', 0, 'gbantonif@gravatar.com', '108 908 4795', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (665, 'EMP665', 'Terese Haldene', '2019-11-07', 0, 'thaldeneig@earthlink.net', '274 725 3502', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (666, 'EMP666', 'Ezekiel Carme', '2019-11-27', 1, 'ecarmeih@yolasite.com', '313 971 2995', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (667, 'EMP667', 'Bailie Doyle', '2019-11-05', 1, 'bdoyleii@ftc.gov', '794 301 1122', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (668, 'EMP668', 'Darsie Foston', '2019-01-26', 0, 'dfostonij@barnesandnoble.com', '817 234 3727', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (669, 'EMP669', 'Rafferty Fransoni', '2019-02-15', 0, 'rfransoniik@gmpg.org', '729 627 5235', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (670, 'EMP670', 'Yasmin Ramel', '2019-12-01', 0, 'yramelil@studiopress.com', '791 888 4539', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (671, 'EMP671', 'Christin Moore', '2019-08-19', 1, 'cmooreim@live.com', '223 170 3345', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (672, 'EMP672', 'Carlotta Hutchinson', '2019-07-11', 0, 'chutchinsonin@ibm.com', '496 432 1162', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (673, 'EMP673', 'Roley Snufflebottom', '2019-12-21', 1, 'rsnufflebottomio@state.tx.us', '736 581 3916', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (674, 'EMP674', 'Shirleen Brayne', '2019-10-06', 1, 'sbrayneip@cloudflare.com', '807 445 5588', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (675, 'EMP675', 'Jermaine McAlinion', '2019-02-07', 0, 'jmcalinioniq@lycos.com', '430 755 7520', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (676, 'EMP676', 'Evvy Josey', '2019-12-15', 0, 'ejoseyir@ovh.net', '147 245 4751', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (677, 'EMP677', 'Goldarina Boreham', '2019-03-09', 1, 'gborehamis@stumbleupon.com', '911 195 4920', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (678, 'EMP678', 'Wini Clementi', '2019-12-08', 1, 'wclementiit@wufoo.com', '356 656 5189', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (679, 'EMP679', 'Giulietta Grissett', '2019-03-28', 1, 'ggrissettiu@indiatimes.com', '716 494 4422', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (680, 'EMP680', 'Blair Wadmore', '2018-12-29', 1, 'bwadmoreiv@tamu.edu', '386 878 4088', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (681, 'EMP681', 'April Le Franc', '2019-10-05', 1, 'aleiw@accuweather.com', '166 120 6623', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (682, 'EMP682', 'Joletta Bothwell', '2019-06-27', 1, 'jbothwellix@meetup.com', '436 457 3071', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (683, 'EMP683', 'Florry Markie', '2019-07-04', 1, 'fmarkieiy@scientificamerican.com', '546 621 1228', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (684, 'EMP684', 'Theobald Rowlatt', '2019-12-14', 0, 'trowlattiz@dion.ne.jp', '385 677 4283', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (685, 'EMP685', 'Adriane Baulcombe', '2019-04-02', 0, 'abaulcombej0@etsy.com', '386 129 7691', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (686, 'EMP686', 'Weidar Boothroyd', '2019-01-18', 1, 'wboothroydj1@mediafire.com', '895 806 3409', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (687, 'EMP687', 'Frankie Brolechan', '2019-10-08', 0, 'fbrolechanj2@bloglines.com', '366 100 9926', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (688, 'EMP688', 'Franciska Farthin', '2019-07-30', 0, 'ffarthinj3@indiatimes.com', '981 162 8046', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (689, 'EMP689', 'Devonne Hercules', '2019-08-19', 1, 'dherculesj4@icio.us', '939 239 8641', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (690, 'EMP690', 'Gus Harvatt', '2019-07-08', 0, 'gharvattj5@washington.edu', '150 415 9622', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (691, 'EMP691', 'Chic Barrack', '2019-02-10', 0, 'cbarrackj6@networksolutions.com', '194 596 8148', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (692, 'EMP692', 'Neile Lideard', '2019-10-30', 1, 'nlideardj7@goo.ne.jp', '220 284 0441', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (693, 'EMP693', 'Way Moodey', '2019-08-07', 0, 'wmoodeyj8@freewebs.com', '728 639 9495', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (694, 'EMP694', 'Wylma Figgures', '2019-03-28', 1, 'wfigguresj9@hubpages.com', '513 319 6222', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (695, 'EMP695', 'Anthiathia Clyburn', '2019-12-15', 0, 'aclyburnja@exblog.jp', '657 828 0699', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (696, 'EMP696', 'Corney Sibbons', '2019-09-07', 1, 'csibbonsjb@imdb.com', '790 930 4324', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (697, 'EMP697', 'Sholom Rist', '2019-07-04', 0, 'sristjc@dell.com', '180 942 3429', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (698, 'EMP698', 'Bella Sloane', '2019-04-24', 1, 'bsloanejd@homestead.com', '516 738 4103', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (699, 'EMP699', 'Ryley Beininck', '2019-06-19', 1, 'rbeininckje@redcross.org', '296 761 1405', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (700, 'EMP700', 'Yvor Ramsbotham', '2019-05-13', 0, 'yramsbothamjf@latimes.com', '619 763 2215', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (701, 'EMP701', 'Chico Inglesfield', '2019-08-05', 0, 'cinglesfieldjg@eepurl.com', '512 644 4980', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (702, 'EMP702', 'Esteban Labbe', '2019-02-05', 1, 'elabbejh@psu.edu', '556 727 4540', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (703, 'EMP703', 'Grantham Jorioz', '2019-12-12', 0, 'gjoriozji@odnoklassniki.ru', '972 608 6536', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (704, 'EMP704', 'Stepha Evers', '2019-11-14', 0, 'seversjj@t.co', '525 142 5541', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (705, 'EMP705', 'Hilly Walbridge', '2019-03-08', 1, 'hwalbridgejk@archive.org', '661 241 8340', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (706, 'EMP706', 'Annette Woliter', '2019-08-29', 1, 'awoliterjl@fotki.com', '937 331 2373', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (707, 'EMP707', 'Noah Sinclair', '2019-03-24', 1, 'nsinclairjm@biblegateway.com', '656 941 6063', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (708, 'EMP708', 'Maxy Middas', '2019-05-17', 1, 'mmiddasjn@elegantthemes.com', '488 225 3224', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (709, 'EMP709', 'Ainsley Gatman', '2019-05-10', 0, 'agatmanjo@tuttocitta.it', '688 747 4960', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (710, 'EMP710', 'Win Tapsfield', '2019-11-19', 0, 'wtapsfieldjp@usda.gov', '628 260 5145', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (711, 'EMP711', 'Clarine Exelby', '2019-12-25', 1, 'cexelbyjq@youtube.com', '240 533 4791', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (712, 'EMP712', 'Andris Duprey', '2019-11-09', 1, 'adupreyjr@chron.com', '698 521 4414', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (713, 'EMP713', 'Cleopatra Snailham', '2019-12-27', 1, 'csnailhamjs@com.com', '753 863 9107', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (714, 'EMP714', 'Carine Pardey', '2019-03-12', 0, 'cpardeyjt@hugedomains.com', '827 986 9626', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (715, 'EMP715', 'Melessa Bernier', '2019-08-25', 1, 'mbernierju@google.com.hk', '432 501 7035', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (716, 'EMP716', 'Leontine Edsell', '2019-12-17', 0, 'ledselljv@yellowbook.com', '974 234 3887', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (717, 'EMP717', 'Cecilius Hyndley', '2019-01-06', 1, 'chyndleyjw@goo.ne.jp', '131 417 4641', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (718, 'EMP718', 'Meyer Beebee', '2019-01-17', 0, 'mbeebeejx@oracle.com', '827 570 5132', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (719, 'EMP719', 'Nicki Skilbeck', '2019-05-08', 0, 'nskilbeckjy@ucsd.edu', '205 601 9851', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (720, 'EMP720', 'Vasili Rivilis', '2019-10-22', 1, 'vrivilisjz@networkadvertising.org', '170 106 9732', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (721, 'EMP721', 'Brigitte Plampin', '2019-04-17', 1, 'bplampink0@jigsy.com', '540 849 5308', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (722, 'EMP722', 'Franchot Wince', '2019-06-14', 1, 'fwincek1@homestead.com', '745 991 0675', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (723, 'EMP723', 'Jasen Dresser', '2019-08-16', 1, 'jdresserk2@vinaora.com', '389 569 4406', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (724, 'EMP724', 'Haskel Forgan', '2019-03-21', 1, 'hforgank3@foxnews.com', '674 538 8271', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (725, 'EMP725', 'Quintilla MacCallum', '2019-09-23', 1, 'qmaccallumk4@youku.com', '289 310 6859', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (726, 'EMP726', 'Jayme Waudby', '2019-08-19', 0, 'jwaudbyk5@amazonaws.com', '230 916 5855', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (727, 'EMP727', 'Neall Wyrill', '2019-11-24', 1, 'nwyrillk6@devhub.com', '324 892 6369', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (728, 'EMP728', 'Doris Huleatt', '2019-06-12', 1, 'dhuleattk7@weather.com', '961 732 5106', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (729, 'EMP729', 'Timmy Brumen', '2019-02-10', 1, 'tbrumenk8@hostgator.com', '418 698 0058', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (730, 'EMP730', 'Davita Chippindall', '2019-08-09', 1, 'dchippindallk9@sphinn.com', '359 454 6770', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (731, 'EMP731', 'Tine Fehners', '2019-01-20', 0, 'tfehnerska@who.int', '230 993 3815', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (732, 'EMP732', 'Sholom Justice', '2019-01-04', 1, 'sjusticekb@furl.net', '525 921 6040', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (733, 'EMP733', 'Jaquenetta McKissack', '2019-12-17', 1, 'jmckissackkc@bandcamp.com', '809 902 0705', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (734, 'EMP734', 'Truda Ker', '2019-12-21', 0, 'tkerkd@uiuc.edu', '794 739 7001', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (735, 'EMP735', 'Torrey Cherrett', '2019-10-21', 1, 'tcherrettke@bravesites.com', '592 249 1899', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (736, 'EMP736', 'D\'arcy Betchley', '2019-04-25', 1, 'dbetchleykf@loc.gov', '367 302 4403', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (737, 'EMP737', 'Cesare Girardez', '2019-09-17', 1, 'cgirardezkg@bloglovin.com', '243 987 4450', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (738, 'EMP738', 'Matt Delgaty', '2019-12-02', 0, 'mdelgatykh@github.com', '928 332 1356', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (739, 'EMP739', 'Darsey Ranscome', '2019-09-30', 1, 'dranscomeki@who.int', '934 731 6348', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (740, 'EMP740', 'Jackson Stebbings', '2019-02-15', 1, 'jstebbingskj@craigslist.org', '672 460 0624', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (741, 'EMP741', 'Gracia Francello', '2019-01-10', 1, 'gfrancellokk@google.cn', '434 466 0136', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (742, 'EMP742', 'Emilia Kohnemann', '2019-06-05', 0, 'ekohnemannkl@cocolog-nifty.com', '355 731 8371', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (743, 'EMP743', 'Anthia Worman', '2019-11-02', 1, 'awormankm@google.fr', '643 572 6799', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (744, 'EMP744', 'Christal Tunna', '2019-03-21', 1, 'ctunnakn@geocities.jp', '827 277 6683', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (745, 'EMP745', 'Dulcy Urwin', '2019-07-29', 1, 'durwinko@cloudflare.com', '135 863 5732', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (746, 'EMP746', 'Daniella Ives', '2019-04-04', 0, 'diveskp@archive.org', '390 287 0546', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (747, 'EMP747', 'Bernice Borrowman', '2019-09-09', 0, 'bborrowmankq@vkontakte.ru', '329 813 6195', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (748, 'EMP748', 'Clem Coote', '2019-06-19', 1, 'ccootekr@google.de', '180 210 6015', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (749, 'EMP749', 'Staffard Sapey', '2019-04-18', 1, 'ssapeyks@macromedia.com', '796 237 7366', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (750, 'EMP750', 'Adrianne Braden', '2019-04-09', 1, 'abradenkt@bloglovin.com', '335 876 5363', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (751, 'EMP751', 'Sibella Ben', '2019-04-14', 1, 'sbenku@yelp.com', '148 231 7520', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (752, 'EMP752', 'Lynette Laws', '2019-06-17', 1, 'llawskv@google.es', '679 901 3721', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (753, 'EMP753', 'Nanine Fonzone', '2019-07-10', 1, 'nfonzonekw@netvibes.com', '918 680 4427', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (754, 'EMP754', 'Hillier Amis', '2019-06-13', 1, 'hamiskx@drupal.org', '178 297 3268', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (755, 'EMP755', 'Lannie Josuweit', '2019-03-08', 1, 'ljosuweitky@tinypic.com', '150 252 7869', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (756, 'EMP756', 'Webb Tams', '2019-04-28', 1, 'wtamskz@globo.com', '960 389 1443', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (757, 'EMP757', 'Tobie Kelcey', '2019-11-23', 1, 'tkelceyl0@squidoo.com', '655 752 7781', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (758, 'EMP758', 'Nani Reinhardt', '2019-02-10', 1, 'nreinhardtl1@sbwire.com', '709 404 0503', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (759, 'EMP759', 'Jandy Hutley', '2019-05-27', 0, 'jhutleyl2@icio.us', '521 582 7553', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (760, 'EMP760', 'Justin Spelling', '2019-03-12', 1, 'jspellingl3@mayoclinic.com', '468 223 5568', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (761, 'EMP761', 'Cristobal Christy', '2019-10-27', 1, 'cchristyl4@nbcnews.com', '586 436 3434', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (762, 'EMP762', 'Valeria Witnall', '2019-06-27', 1, 'vwitnalll5@ca.gov', '871 701 7743', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (763, 'EMP763', 'Sile Thorn', '2019-03-07', 0, 'sthornl6@microsoft.com', '260 188 3213', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (764, 'EMP764', 'Aurlie Bellhouse', '2019-08-07', 0, 'abellhousel7@xrea.com', '326 734 8515', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (765, 'EMP765', 'Tammara Rowth', '2019-07-25', 1, 'trowthl8@is.gd', '949 696 7619', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (766, 'EMP766', 'Raven Myner', '2019-01-23', 0, 'rmynerl9@smugmug.com', '844 407 5171', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (767, 'EMP767', 'Mikel Grahl', '2019-08-28', 0, 'mgrahlla@geocities.jp', '701 882 8817', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (768, 'EMP768', 'Leanna Eskrigg', '2019-04-15', 1, 'leskrigglb@va.gov', '181 648 3419', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (769, 'EMP769', 'Neel Keitley', '2019-12-15', 0, 'nkeitleylc@cmu.edu', '290 349 8997', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (770, 'EMP770', 'Edeline Wragge', '2019-05-11', 0, 'ewraggeld@last.fm', '523 183 4229', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (771, 'EMP771', 'Natale Simonyi', '2019-10-19', 0, 'nsimonyile@drupal.org', '463 428 8300', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (772, 'EMP772', 'Kerr Batting', '2019-03-08', 1, 'kbattinglf@spotify.com', '245 973 5787', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (773, 'EMP773', 'Kary Alyutin', '2019-04-10', 0, 'kalyutinlg@vk.com', '483 411 9590', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (774, 'EMP774', 'Kara Cominetti', '2019-12-07', 0, 'kcominettilh@home.pl', '363 615 7286', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (775, 'EMP775', 'Justina Clevely', '2019-03-03', 0, 'jclevelyli@printfriendly.com', '839 579 8687', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (776, 'EMP776', 'Lombard Gabby', '2019-08-22', 0, 'lgabbylj@g.co', '454 645 3625', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (777, 'EMP777', 'Iggie Stace', '2019-03-10', 0, 'istacelk@macromedia.com', '539 105 7450', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (778, 'EMP778', 'Wenonah Tilston', '2019-10-23', 0, 'wtilstonll@youtu.be', '214 194 5354', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (779, 'EMP779', 'Phil Wooddisse', '2019-01-31', 1, 'pwooddisselm@ask.com', '640 763 7175', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (780, 'EMP780', 'Estelle Hedingham', '2019-10-25', 0, 'ehedinghamln@noaa.gov', '171 585 2424', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (781, 'EMP781', 'Maryl Gipp', '2019-04-03', 1, 'mgipplo@bandcamp.com', '291 669 7928', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (782, 'EMP782', 'Annis Barnsdale', '2019-03-01', 0, 'abarnsdalelp@walmart.com', '798 597 8493', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (783, 'EMP783', 'Barbabas Screech', '2019-03-12', 1, 'bscreechlq@spiegel.de', '941 374 2287', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (784, 'EMP784', 'Leif Faldoe', '2019-11-17', 0, 'lfaldoelr@salon.com', '724 828 1037', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (785, 'EMP785', 'Sven Birchill', '2019-04-10', 0, 'sbirchillls@skype.com', '468 510 0729', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (786, 'EMP786', 'Buck Robbey', '2019-06-21', 1, 'brobbeylt@illinois.edu', '363 539 8793', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (787, 'EMP787', 'Thatch Free', '2019-02-09', 0, 'tfreelu@ehow.com', '530 102 7895', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (788, 'EMP788', 'Marcile Shewan', '2019-02-08', 0, 'mshewanlv@1und1.de', '563 139 2318', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (789, 'EMP789', 'Eliot Butten', '2019-12-12', 1, 'ebuttenlw@constantcontact.com', '513 420 1636', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (790, 'EMP790', 'Sutton Pack', '2019-10-13', 0, 'spacklx@biglobe.ne.jp', '417 209 0902', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (791, 'EMP791', 'Aharon Barfitt', '2019-12-24', 0, 'abarfittly@blogs.com', '273 594 7159', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (792, 'EMP792', 'Guilbert Gossipin', '2019-05-18', 1, 'ggossipinlz@storify.com', '510 290 1384', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (793, 'EMP793', 'Debbi Thebeaud', '2019-08-31', 1, 'dthebeaudm0@irs.gov', '364 139 3197', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (794, 'EMP794', 'Giacomo Wasson', '2019-02-15', 0, 'gwassonm1@skype.com', '958 210 1199', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (795, 'EMP795', 'Quintilla Loseke', '2019-09-06', 0, 'qlosekem2@51.la', '993 325 7811', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (796, 'EMP796', 'Agnesse Rummins', '2019-04-07', 0, 'arumminsm3@yahoo.co.jp', '272 832 7378', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (797, 'EMP797', 'Butch Huddart', '2019-09-20', 0, 'bhuddartm4@flickr.com', '719 108 8468', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (798, 'EMP798', 'Mira Di Maria', '2019-12-09', 1, 'mdim5@techcrunch.com', '452 527 3373', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (799, 'EMP799', 'Ermentrude Bestman', '2019-11-16', 1, 'ebestmanm6@live.com', '519 166 7550', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (800, 'EMP800', 'Kermie Doe', '2019-11-07', 1, 'kdoem7@plala.or.jp', '138 899 1604', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (801, 'EMP801', 'Nichol Haws', '2019-07-04', 0, 'nhawsm8@howstuffworks.com', '151 411 1508', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (802, 'EMP802', 'Emyle MacKeig', '2019-12-04', 1, 'emackeigm9@domainmarket.com', '893 140 6474', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (803, 'EMP803', 'Karena Burcombe', '2019-09-04', 0, 'kburcombema@walmart.com', '338 627 9247', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (804, 'EMP804', 'Henrieta Ilem', '2019-07-31', 0, 'hilemmb@soup.io', '632 632 7579', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (805, 'EMP805', 'Dael Brydon', '2019-09-10', 0, 'dbrydonmc@nyu.edu', '268 421 4071', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (806, 'EMP806', 'Lorene Croley', '2019-10-21', 1, 'lcroleymd@google.es', '106 626 0216', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (807, 'EMP807', 'Horatius Skirrow', '2019-10-20', 1, 'hskirrowme@home.pl', '533 433 5665', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (808, 'EMP808', 'Merci Casemore', '2019-12-03', 1, 'mcasemoremf@ocn.ne.jp', '794 197 4085', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (809, 'EMP809', 'Veronika Snazle', '2019-02-05', 1, 'vsnazlemg@soup.io', '855 448 6798', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (810, 'EMP810', 'Mirabella Gilhespy', '2019-01-07', 0, 'mgilhespymh@epa.gov', '972 264 6528', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (811, 'EMP811', 'Pauletta Milsap', '2019-08-26', 1, 'pmilsapmi@wufoo.com', '227 890 3292', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (812, 'EMP812', 'Pierrette Profit', '2019-10-23', 0, 'pprofitmj@dmoz.org', '732 201 8144', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (813, 'EMP813', 'Haslett Stolte', '2019-07-17', 1, 'hstoltemk@gizmodo.com', '828 280 0439', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (814, 'EMP814', 'Ariella Tregea', '2019-01-09', 0, 'atregeaml@forbes.com', '955 610 1966', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (815, 'EMP815', 'Mendel Cadalleder', '2019-10-24', 1, 'mcadalledermm@hubpages.com', '198 464 5114', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (816, 'EMP816', 'Isaak MacPadene', '2019-09-14', 1, 'imacpadenemn@deliciousdays.com', '100 406 2166', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (817, 'EMP817', 'Alma Erb', '2019-12-08', 0, 'aerbmo@howstuffworks.com', '608 324 0641', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (818, 'EMP818', 'Gayel Harnwell', '2019-09-26', 0, 'gharnwellmp@moonfruit.com', '936 192 7532', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (819, 'EMP819', 'Woodie Ayers', '2019-12-19', 1, 'wayersmq@vimeo.com', '817 716 2215', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (820, 'EMP820', 'Carson Chardin', '2019-03-10', 1, 'cchardinmr@mozilla.com', '111 338 5232', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (821, 'EMP821', 'Coleman Piens', '2019-10-03', 0, 'cpiensms@reuters.com', '109 122 0059', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (822, 'EMP822', 'Ravid Hallor', '2019-12-02', 1, 'rhallormt@stanford.edu', '341 942 1196', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (823, 'EMP823', 'Erasmus Orkney', '2019-05-17', 0, 'eorkneymu@github.com', '755 645 5093', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (824, 'EMP824', 'Aurie Warboys', '2019-10-24', 1, 'awarboysmv@cdc.gov', '851 923 7367', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (825, 'EMP825', 'Elvira Witherop', '2019-05-02', 1, 'ewitheropmw@webmd.com', '537 671 4508', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (826, 'EMP826', 'Luca Noli', '2019-03-10', 1, 'lnolimx@army.mil', '447 914 0803', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (827, 'EMP827', 'Ronalda Henningham', '2019-08-28', 1, 'rhenninghammy@theguardian.com', '817 470 9581', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (828, 'EMP828', 'Licha Askew', '2019-04-02', 1, 'laskewmz@blogger.com', '508 913 4189', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (829, 'EMP829', 'Waylin Beakes', '2019-01-25', 1, 'wbeakesn0@gov.uk', '402 506 4065', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (830, 'EMP830', 'Donnie Matthews', '2019-03-03', 1, 'dmatthewsn1@nifty.com', '965 268 9279', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (831, 'EMP831', 'Kassi Zanazzi', '2019-04-01', 0, 'kzanazzin2@kickstarter.com', '876 678 6855', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (832, 'EMP832', 'Boyd Poole', '2019-01-19', 0, 'bpoolen3@meetup.com', '659 417 2206', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (833, 'EMP833', 'Kerri Zanetello', '2019-08-09', 1, 'kzanetellon4@prlog.org', '236 771 6521', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (834, 'EMP834', 'Ruggiero Pacitti', '2019-04-15', 1, 'rpacittin5@list-manage.com', '158 851 7247', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (835, 'EMP835', 'Scot Jachtym', '2019-11-09', 0, 'sjachtymn6@booking.com', '568 385 2311', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (836, 'EMP836', 'Titus McDool', '2019-07-11', 1, 'tmcdooln7@comcast.net', '397 502 5265', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (837, 'EMP837', 'Derry Langran', '2019-07-30', 0, 'dlangrann8@economist.com', '541 103 8465', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (838, 'EMP838', 'Kyle Megany', '2019-06-04', 0, 'kmeganyn9@google.com.au', '486 468 7497', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (839, 'EMP839', 'Helaina Blaxlande', '2019-09-06', 1, 'hblaxlandena@ted.com', '691 778 9295', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (840, 'EMP840', 'Linea Kellogg', '2019-11-07', 1, 'lkelloggnb@harvard.edu', '688 324 6864', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (841, 'EMP841', 'Michail Maggs', '2019-10-29', 0, 'mmaggsnc@businesswire.com', '734 696 0084', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (842, 'EMP842', 'Pia Sharrard', '2019-10-30', 0, 'psharrardnd@histats.com', '570 662 6322', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (843, 'EMP843', 'Enrique Simenon', '2019-09-03', 0, 'esimenonne@blogtalkradio.com', '976 250 1042', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (844, 'EMP844', 'Gisele Risley', '2019-08-30', 0, 'grisleynf@g.co', '292 420 5002', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (845, 'EMP845', 'Riki Perkinson', '2019-10-30', 0, 'rperkinsonng@theguardian.com', '159 923 3931', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (846, 'EMP846', 'Hamilton Lyffe', '2019-08-19', 1, 'hlyffenh@wikispaces.com', '779 971 6748', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (847, 'EMP847', 'Constantia Bolgar', '2019-06-22', 1, 'cbolgarni@ftc.gov', '310 850 1977', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (848, 'EMP848', 'Walsh Bossel', '2019-07-22', 0, 'wbosselnj@paypal.com', '617 571 0273', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (849, 'EMP849', 'Edna Crowne', '2019-10-13', 1, 'ecrownenk@dyndns.org', '879 694 2031', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (850, 'EMP850', 'Stacey Louch', '2019-05-27', 0, 'slouchnl@cargocollective.com', '789 728 8007', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (851, 'EMP851', 'Nathalie Riddiough', '2019-09-20', 0, 'nriddioughnm@bizjournals.com', '272 568 4252', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (852, 'EMP852', 'Jerry Bille', '2019-03-26', 1, 'jbillenn@upenn.edu', '811 591 6151', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (853, 'EMP853', 'Mariele Conti', '2019-01-30', 1, 'mcontino@yahoo.co.jp', '265 754 8086', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (854, 'EMP854', 'Levy Cherrison', '2019-02-17', 1, 'lcherrisonnp@behance.net', '388 852 5458', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (855, 'EMP855', 'Sonni Swinbourne', '2019-10-09', 0, 'sswinbournenq@domainmarket.com', '469 196 3964', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (856, 'EMP856', 'Niki Bartoloma', '2019-08-17', 0, 'nbartolomanr@loc.gov', '721 515 1132', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (857, 'EMP857', 'Willis Kinsell', '2019-01-04', 1, 'wkinsellns@accuweather.com', '303 816 3535', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (858, 'EMP858', 'Mathilde Whitland', '2019-02-05', 0, 'mwhitlandnt@liveinternet.ru', '928 479 2890', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (859, 'EMP859', 'Analiese Well', '2019-02-12', 1, 'awellnu@ca.gov', '980 453 8286', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (860, 'EMP860', 'Hanni Shambrook', '2019-11-16', 0, 'hshambrooknv@homestead.com', '779 451 2070', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (861, 'EMP861', 'Cassie Flippen', '2019-01-03', 1, 'cflippennw@answers.com', '611 114 2257', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (862, 'EMP862', 'Mariejeanne Lownsbrough', '2019-05-19', 0, 'mlownsbroughnx@cbsnews.com', '224 464 9312', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (863, 'EMP863', 'Iorgo Chopy', '2019-11-23', 0, 'ichopyny@shareasale.com', '849 815 9766', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (864, 'EMP864', 'Elisa Bellenie', '2019-11-14', 1, 'ebellenienz@etsy.com', '460 222 3340', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (865, 'EMP865', 'Kinnie Pay', '2019-03-20', 1, 'kpayo0@last.fm', '869 253 2262', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (866, 'EMP866', 'Florian Cavey', '2019-09-02', 0, 'fcaveyo1@columbia.edu', '510 996 7643', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (867, 'EMP867', 'Vallie Sherrett', '2019-12-26', 0, 'vsherretto2@networksolutions.com', '704 792 3005', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (868, 'EMP868', 'Virgina Fischer', '2019-08-18', 0, 'vfischero3@ebay.co.uk', '540 111 3856', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (869, 'EMP869', 'Cassie Mouncher', '2019-12-14', 1, 'cmounchero4@flickr.com', '456 376 4928', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (870, 'EMP870', 'Flossi Gliddon', '2019-02-19', 0, 'fgliddono5@tripod.com', '801 106 8107', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (871, 'EMP871', 'Gwendolen Achromov', '2019-11-12', 1, 'gachromovo6@google.com.br', '193 517 7697', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (872, 'EMP872', 'Phedra Emm', '2019-02-04', 0, 'pemmo7@nifty.com', '349 716 5608', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (873, 'EMP873', 'Max Harses', '2019-12-01', 0, 'mharseso8@tripod.com', '526 676 8366', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (874, 'EMP874', 'Lief Payfoot', '2019-09-09', 0, 'lpayfooto9@diigo.com', '250 898 2934', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (875, 'EMP875', 'Tallulah Jorez', '2019-06-14', 1, 'tjorezoa@baidu.com', '707 152 9815', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (876, 'EMP876', 'Susi Hourston', '2019-12-02', 1, 'shourstonob@engadget.com', '494 968 9981', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (877, 'EMP877', 'Ame Sowter', '2019-04-23', 1, 'asowteroc@state.tx.us', '445 508 2754', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (878, 'EMP878', 'Ursa Husthwaite', '2019-05-10', 1, 'uhusthwaiteod@blogger.com', '573 460 5724', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (879, 'EMP879', 'Creighton Castanares', '2019-04-24', 1, 'ccastanaresoe@fema.gov', '493 640 0911', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (880, 'EMP880', 'Coralyn Minico', '2019-01-26', 1, 'cminicoof@icq.com', '384 151 3236', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (881, 'EMP881', 'Corry Goodreid', '2019-09-14', 1, 'cgoodreidog@springer.com', '892 851 8623', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (882, 'EMP882', 'Albie Blunderfield', '2019-04-17', 1, 'ablunderfieldoh@nymag.com', '106 743 1001', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (883, 'EMP883', 'Bibby Copping', '2019-12-04', 1, 'bcoppingoi@intel.com', '519 990 8395', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (884, 'EMP884', 'Gard Maulkin', '2019-06-28', 1, 'gmaulkinoj@europa.eu', '346 285 4081', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (885, 'EMP885', 'Minda Barthel', '2019-04-04', 0, 'mbarthelok@tamu.edu', '231 730 3476', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (886, 'EMP886', 'Brittni Franzetti', '2019-05-01', 1, 'bfranzettiol@cbslocal.com', '207 713 9011', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (887, 'EMP887', 'Sherline Falcus', '2019-04-02', 1, 'sfalcusom@mayoclinic.com', '317 838 8803', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (888, 'EMP888', 'Farleigh Jachimiak', '2019-12-23', 1, 'fjachimiakon@senate.gov', '966 261 4845', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (889, 'EMP889', 'Sheridan Andrea', '2019-07-25', 1, 'sandreaoo@prnewswire.com', '123 271 4899', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (890, 'EMP890', 'Jamison Cordall', '2019-05-07', 1, 'jcordallop@wufoo.com', '690 114 2892', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (891, 'EMP891', 'Joeann Kerrey', '2019-07-27', 1, 'jkerreyoq@guardian.co.uk', '933 513 0682', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (892, 'EMP892', 'Brietta Jobke', '2019-02-21', 1, 'bjobkeor@businessinsider.com', '734 775 1805', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (893, 'EMP893', 'Kizzie Humphrey', '2019-09-02', 1, 'khumphreyos@last.fm', '777 452 8375', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (894, 'EMP894', 'Alisha Suggey', '2019-05-06', 1, 'asuggeyot@oracle.com', '649 235 2709', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (895, 'EMP895', 'Roxie Litherborough', '2019-05-08', 0, 'rlitherboroughou@ibm.com', '424 389 9710', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (896, 'EMP896', 'Fredelia Dibbert', '2019-10-16', 1, 'fdibbertov@aboutads.info', '213 886 9652', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (897, 'EMP897', 'Carolyne Cartman', '2019-06-19', 0, 'ccartmanow@gmpg.org', '396 137 6827', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (898, 'EMP898', 'Becki Nehl', '2019-02-02', 1, 'bnehlox@1und1.de', '728 940 1507', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (899, 'EMP899', 'Budd Boxill', '2019-04-20', 0, 'bboxilloy@china.com.cn', '874 400 2340', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (900, 'EMP900', 'Cully Jossum', '2019-11-22', 1, 'cjossumoz@admin.ch', '992 889 8339', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (901, 'EMP901', 'Thorin Guerrin', '2019-07-27', 1, 'tguerrinp0@xinhuanet.com', '919 453 8767', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (902, 'EMP902', 'Theda Donnett', '2019-06-09', 0, 'tdonnettp1@constantcontact.com', '464 229 0498', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (903, 'EMP903', 'Chevy Smithin', '2019-12-03', 1, 'csmithinp2@xing.com', '980 507 7855', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (904, 'EMP904', 'Valdemar Caskey', '2019-11-09', 0, 'vcaskeyp3@ebay.com', '214 318 2546', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (905, 'EMP905', 'Sabra Hoys', '2019-06-12', 1, 'shoysp4@springer.com', '504 322 2847', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (906, 'EMP906', 'Pamella Kyston', '2019-07-20', 1, 'pkystonp5@ebay.co.uk', '481 924 7558', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (907, 'EMP907', 'Chris Chessman', '2019-03-23', 1, 'cchessmanp6@bluehost.com', '208 758 8681', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (908, 'EMP908', 'Alfi Headland', '2019-04-04', 1, 'aheadlandp7@histats.com', '834 272 8900', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (909, 'EMP909', 'Nikita Trevena', '2019-07-28', 1, 'ntrevenap8@macromedia.com', '918 392 7019', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (910, 'EMP910', 'Clement Gooly', '2019-01-28', 0, 'cgoolyp9@unblog.fr', '574 863 0400', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (911, 'EMP911', 'Coralyn Herries', '2019-06-13', 1, 'cherriespa@flickr.com', '471 650 7748', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (912, 'EMP912', 'Lothaire Madge', '2019-03-07', 1, 'lmadgepb@omniture.com', '758 206 6623', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (913, 'EMP913', 'Cal Waterstone', '2019-12-12', 0, 'cwaterstonepc@miibeian.gov.cn', '690 644 0294', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (914, 'EMP914', 'Van Offord', '2019-06-28', 1, 'voffordpd@slate.com', '762 522 7464', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (915, 'EMP915', 'Caresa Skirrow', '2019-09-09', 1, 'cskirrowpe@sohu.com', '918 827 7728', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (916, 'EMP916', 'Nikola Cuckoo', '2019-03-12', 0, 'ncuckoopf@mozilla.org', '217 652 3195', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (917, 'EMP917', 'Peggie Sommersett', '2019-02-18', 0, 'psommersettpg@tripadvisor.com', '591 542 7448', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (918, 'EMP918', 'Corby Penrose', '2019-01-16', 0, 'cpenroseph@nifty.com', '188 345 4499', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (919, 'EMP919', 'Rogers Bishell', '2019-10-11', 1, 'rbishellpi@g.co', '244 549 9603', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (920, 'EMP920', 'Annadiana Beckenham', '2019-04-01', 0, 'abeckenhampj@wikimedia.org', '711 258 9067', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (921, 'EMP921', 'Seka Crumly', '2019-04-17', 1, 'scrumlypk@bloglines.com', '971 749 7704', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (922, 'EMP922', 'Hanny Nelligan', '2019-03-18', 0, 'hnelliganpl@123-reg.co.uk', '589 745 1923', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (923, 'EMP923', 'Elyssa D\'Agostino', '2019-11-17', 0, 'edagostinopm@msn.com', '917 255 1698', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (924, 'EMP924', 'Lenka Landsberg', '2019-04-08', 1, 'llandsbergpn@archive.org', '799 216 4684', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (925, 'EMP925', 'Torey Furber', '2019-12-25', 0, 'tfurberpo@sciencedirect.com', '196 388 7136', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (926, 'EMP926', 'Delinda Sunter', '2019-06-04', 1, 'dsunterpp@phoca.cz', '336 111 5024', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (927, 'EMP927', 'Gerrilee Vigus', '2019-11-05', 0, 'gviguspq@adobe.com', '361 175 1729', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (928, 'EMP928', 'Kinna Jefferson', '2019-05-31', 1, 'kjeffersonpr@state.tx.us', '865 110 3847', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (929, 'EMP929', 'Tony Brittoner', '2019-11-25', 1, 'tbrittonerps@uol.com.br', '163 446 0617', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (930, 'EMP930', 'Demetris Dodsworth', '2019-06-26', 1, 'ddodsworthpt@com.com', '805 399 5022', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (931, 'EMP931', 'Shani Glasheen', '2019-04-01', 1, 'sglasheenpu@digg.com', '692 602 0273', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (932, 'EMP932', 'Hilliary Axten', '2019-04-29', 1, 'haxtenpv@ft.com', '725 439 7563', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (933, 'EMP933', 'Nance Iacobetto', '2019-02-28', 0, 'niacobettopw@live.com', '185 480 8348', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (934, 'EMP934', 'Garv Eliez', '2019-06-26', 1, 'geliezpx@twitpic.com', '179 805 3640', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (935, 'EMP935', 'Joleen Raynor', '2019-08-25', 0, 'jraynorpy@163.com', '526 397 5935', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (936, 'EMP936', 'Prinz Saull', '2019-01-10', 0, 'psaullpz@statcounter.com', '251 818 0435', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (937, 'EMP937', 'Etienne Foyster', '2019-09-15', 0, 'efoysterq0@utexas.edu', '442 563 5991', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (938, 'EMP938', 'Kip Bockmann', '2019-11-14', 1, 'kbockmannq1@sbwire.com', '801 900 5252', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (939, 'EMP939', 'Eugenia Kenvin', '2019-12-02', 0, 'ekenvinq2@biblegateway.com', '130 568 3877', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (940, 'EMP940', 'Tabitha Griswood', '2019-11-01', 0, 'tgriswoodq3@typepad.com', '410 715 3307', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (941, 'EMP941', 'Shalna Brockington', '2019-07-09', 0, 'sbrockingtonq4@who.int', '639 992 4776', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (942, 'EMP942', 'Alane Le Barr', '2019-01-18', 1, 'aleq5@sina.com.cn', '305 702 4797', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (943, 'EMP943', 'Bell Eke', '2019-02-09', 0, 'bekeq6@issuu.com', '199 365 7540', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (944, 'EMP944', 'Leland De L\'Isle', '2019-06-23', 0, 'ldeq7@walmart.com', '424 768 0414', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (945, 'EMP945', 'Finlay Dahler', '2019-07-31', 1, 'fdahlerq8@opera.com', '759 141 0582', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (946, 'EMP946', 'Pall Stocker', '2019-03-05', 1, 'pstockerq9@mozilla.com', '294 247 3626', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (947, 'EMP947', 'Donelle Giscken', '2019-10-16', 1, 'dgisckenqa@wunderground.com', '523 803 1549', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (948, 'EMP948', 'Dolli Blakiston', '2019-08-06', 0, 'dblakistonqb@google.com.au', '837 887 2335', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (949, 'EMP949', 'Peg Iacomini', '2019-05-19', 0, 'piacominiqc@icq.com', '955 360 1387', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (950, 'EMP950', 'Maurise Burroughes', '2019-12-21', 0, 'mburroughesqd@toplist.cz', '347 315 6911', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (951, 'EMP951', 'Sylas Linstead', '2019-01-24', 0, 'slinsteadqe@domainmarket.com', '820 661 4160', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (952, 'EMP952', 'Curran Stapford', '2019-03-14', 0, 'cstapfordqf@goo.gl', '125 296 3046', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (953, 'EMP953', 'Euell McGrirl', '2019-03-17', 0, 'emcgrirlqg@fc2.com', '526 843 0497', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (954, 'EMP954', 'Clo Hanburry', '2019-01-09', 0, 'chanburryqh@flavors.me', '452 853 9222', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (955, 'EMP955', 'Cassie Ceeley', '2019-02-02', 1, 'cceeleyqi@deviantart.com', '918 254 0432', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (956, 'EMP956', 'Alejoa McKeggie', '2019-05-07', 1, 'amckeggieqj@meetup.com', '884 342 9808', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (957, 'EMP957', 'Brittany Pischof', '2019-12-09', 0, 'bpischofqk@lycos.com', '324 659 3807', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (958, 'EMP958', 'Klaus Leger', '2019-10-07', 0, 'klegerql@creativecommons.org', '381 636 3903', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (959, 'EMP959', 'Velvet Croy', '2019-04-24', 0, 'vcroyqm@newyorker.com', '421 109 7387', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (960, 'EMP960', 'Joline Bodd', '2019-10-02', 1, 'jboddqn@prnewswire.com', '189 162 6567', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (961, 'EMP961', 'Ida Blesing', '2019-11-30', 1, 'iblesingqo@comcast.net', '229 392 1954', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (962, 'EMP962', 'Gwenni Mournian', '2019-04-01', 1, 'gmournianqp@aboutads.info', '510 698 6454', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (963, 'EMP963', 'Gussie Effnert', '2019-08-19', 1, 'geffnertqq@wsj.com', '417 171 2823', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (964, 'EMP964', 'Petronella Wiles', '2019-08-04', 1, 'pwilesqr@npr.org', '794 437 8685', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (965, 'EMP965', 'Phelia Aisbett', '2019-11-01', 1, 'paisbettqs@geocities.jp', '246 540 3049', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (966, 'EMP966', 'Glynis Longden', '2019-10-19', 0, 'glongdenqt@go.com', '225 602 9773', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (967, 'EMP967', 'Darby Castagnier', '2019-08-27', 0, 'dcastagnierqu@hexun.com', '939 638 7215', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (968, 'EMP968', 'Hart Beeken', '2019-07-05', 0, 'hbeekenqv@wufoo.com', '670 455 3196', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (969, 'EMP969', 'Shanon Corgenvin', '2019-03-31', 0, 'scorgenvinqw@vinaora.com', '688 904 7225', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (970, 'EMP970', 'Jessa Lazer', '2019-04-09', 1, 'jlazerqx@gravatar.com', '888 648 6125', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (971, 'EMP971', 'Oriana Basezzi', '2019-09-30', 0, 'obasezziqy@imgur.com', '838 624 6749', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (972, 'EMP972', 'Errick Janata', '2019-05-15', 0, 'ejanataqz@spiegel.de', '616 850 2258', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (973, 'EMP973', 'Emlen Ackery', '2019-03-31', 0, 'eackeryr0@uol.com.br', '600 883 2579', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (974, 'EMP974', 'Bourke Gaddie', '2019-12-02', 1, 'bgaddier1@army.mil', '469 248 9065', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (975, 'EMP975', 'Dorella Methringham', '2019-06-02', 1, 'dmethringhamr2@wiley.com', '417 106 5584', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (976, 'EMP976', 'Gerianne Screeton', '2019-01-08', 1, 'gscreetonr3@cocolog-nifty.com', '721 679 7609', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (977, 'EMP977', 'Kania Daubeny', '2019-01-18', 1, 'kdaubenyr4@cafepress.com', '403 499 0050', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (978, 'EMP978', 'Murdock Manshaw', '2019-08-08', 1, 'mmanshawr5@nhs.uk', '840 611 6126', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (979, 'EMP979', 'Riobard Lumly', '2019-01-06', 1, 'rlumlyr6@ehow.com', '271 666 2666', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (980, 'EMP980', 'Iorgos Twatt', '2019-09-12', 1, 'itwattr7@dailymotion.com', '193 735 2201', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (981, 'EMP981', 'Silvanus Cabedo', '2019-01-03', 1, 'scabedor8@unc.edu', '772 508 7832', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (982, 'EMP982', 'Arlyne Grendon', '2019-05-15', 0, 'agrendonr9@topsy.com', '281 246 9115', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (983, 'EMP983', 'Eolanda Matzaitis', '2019-01-27', 0, 'ematzaitisra@geocities.jp', '466 417 9517', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (984, 'EMP984', 'Alfonso Marham', '2019-05-20', 1, 'amarhamrb@icio.us', '658 582 2518', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (985, 'EMP985', 'Britta Muslim', '2019-01-07', 0, 'bmuslimrc@youtube.com', '179 758 2584', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (986, 'EMP986', 'Irvin Strodder', '2019-08-04', 0, 'istrodderrd@senate.gov', '962 368 9384', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (987, 'EMP987', 'Dacey Rummin', '2019-02-17', 1, 'drumminre@blogspot.com', '680 578 9546', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (988, 'EMP988', 'Rafe Brigstock', '2019-12-19', 0, 'rbrigstockrf@bigcartel.com', '349 247 2702', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (989, 'EMP989', 'Eddi Halgarth', '2019-05-16', 1, 'ehalgarthrg@facebook.com', '690 685 7909', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (990, 'EMP990', 'Barbey Kleinstein', '2019-05-16', 0, 'bkleinsteinrh@pbs.org', '148 121 2945', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (991, 'EMP991', 'Abner Atwel', '2019-09-08', 0, 'aatwelri@i2i.jp', '376 169 9906', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (992, 'EMP992', 'Alex Corderoy', '2019-03-21', 0, 'acorderoyrj@ocn.ne.jp', '445 944 5779', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (993, 'EMP993', 'Loren Foucar', '2019-07-11', 0, 'lfoucarrk@mtv.com', '446 952 3198', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (994, 'EMP994', 'Desiri Joynes', '2019-07-31', 0, 'djoynesrl@ustream.tv', '481 272 1965', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (995, 'EMP995', 'Isabel Lampe', '2019-11-09', 1, 'ilamperm@indiatimes.com', '262 947 4881', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (996, 'EMP996', 'Imojean Gudyer', '2019-12-25', 1, 'igudyerrn@joomla.org', '875 875 5384', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (997, 'EMP997', 'Morten Baverstock', '2019-09-27', 0, 'mbaverstockro@addthis.com', '207 277 7602', 1, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (998, 'EMP998', 'Maxwell Poulston', '2019-08-30', 0, 'mpoulstonrp@simplemachines.org', '187 773 2481', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (999, 'EMP999', 'Carmita Dutson', '2019-04-05', 1, 'cdutsonrq@ask.com', '857 131 3600', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (1000, 'EMP1000', 'Nedi Wiggett', '2019-09-21', 0, 'nwiggettrr@tiny.cc', '713 294 5913', 0, '2019-12-29', '2019-12-29', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (1014, 'EMP 1014', '123123', '2020-11-03', 1, 'zxdasd@gmail.com', 'asdasdasd', 0, '2020-11-22', NULL, 'admin', NULL, 1);
INSERT INTO `employee` VALUES (1015, NULL, 'giang', '2020-11-03', 1, 'zxdasd@gmail.com', 'asdasdasd', 1, '2020-11-22', '2020-11-23', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (1016, 'EMP1016', 'tesst', '2020-11-03', 1, '123@gmail.com', '123123123', 0, '2020-11-22', NULL, 'admin', NULL, 1);
INSERT INTO `employee` VALUES (1019, NULL, 'giang 1', '2020-11-03', 1, 'giang@gmail.com', '0362947187', 1, '2020-11-24', '2020-11-24', 'admin', 'admin', 1);
INSERT INTO `employee` VALUES (1020, 'EMP1020', 'test 2324123123', '2020-11-04', 1, 'asdasd@gmail.com', '123123123', 1, '2020-11-24', '2020-11-24', 'admin', 'admin', 1);

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `identity_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_person` bigint(20) NULL DEFAULT NULL,
  `is_main` bigint(20) NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (2, 'test', '123', 1, 'asdasd', NULL, '2020-11-28', NULL, NULL, NULL, NULL, '2020-11-02', '2020-11-27');
INSERT INTO `person` VALUES (3, '123123', '123123', 1, '123123123', NULL, '2020-11-03', NULL, NULL, NULL, NULL, '2020-02-06', NULL);
INSERT INTO `person` VALUES (4, 'sadasdas', 'zxczxczxc', 1, 'zxczxcccc', NULL, '2020-11-04', NULL, NULL, NULL, NULL, '2020-05-15', NULL);
INSERT INTO `person` VALUES (5, 'zxczxczxc', 'zxczxc', 1, 'zxczxczc', NULL, '2020-11-03', NULL, NULL, NULL, NULL, '2020-02-06', NULL);

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `salary` decimal(10, 0) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of positions
-- ----------------------------
INSERT INTO `positions` VALUES (1, 'POS1', 'Chuyên viên', 1200, 1, '2019-12-18', '2019-12-18', 'admin', 'admin');
INSERT INTO `positions` VALUES (2, 'POS2', 'Thư kí', 2000, 1, '2019-11-11', '2019-11-11', 'admin', 'admin');
INSERT INTO `positions` VALUES (3, 'POS3', 'Quản lý', 2000, 1, '2019-11-11', '2019-11-11', 'admin', 'admin');
INSERT INTO `positions` VALUES (4, 'POS4', 'Nhân viên văn phòng', 2000, 1, '2019-11-11', '2019-11-11', 'admin', 'admin');
INSERT INTO `positions` VALUES (5, 'POS5', 'Quản lý', 2000, 1, '2019-12-18', '2019-12-18', 'admin', 'admin');
INSERT INTO `positions` VALUES (6, 'POS6', 'Nhân viên văn phòng', 700, 1, '2019-12-18', '2019-12-18', 'admin', 'admin');
INSERT INTO `positions` VALUES (7, 'POS7', 'Nhân viên lao động phổ thông', 200, 0, '2019-12-18', '2019-12-18', 'admin', 'admin');
INSERT INTO `positions` VALUES (8, 'POS8', 'Trợ lý', 1000, 1, '2019-12-18', '2019-12-18', 'admin', 'admin');
INSERT INTO `positions` VALUES (9, 'POS9', 'Thợ sửa chữa', 1000, 1, '2019-12-18', '2019-12-18', 'admin', 'admin');
INSERT INTO `positions` VALUES (11, 'POS11', 'Người yêu Giang', 50000, 1, '2020-11-24', '2020-11-24', 'admin', 'admin');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'ROLE_ADMIN', 'Quản trị viên');
INSERT INTO `roles` VALUES (2, 'ROLE_SV', 'Quản lý phòng');
INSERT INTO `roles` VALUES (3, 'ROLE_GVCN', 'Quản lý hóa đơn');
INSERT INTO `roles` VALUES (4, 'ROLE_GVPT', 'Quản lý thông báo');

-- ----------------------------
-- Table structure for service_type
-- ----------------------------
DROP TABLE IF EXISTS `service_type`;
CREATE TABLE `service_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `edited_date` date NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `created_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (5, 126, 1, NULL, NULL);
INSERT INTO `user_role` VALUES (6, 126, 2, NULL, NULL);
INSERT INTO `user_role` VALUES (7, 126, 3, NULL, NULL);
INSERT INTO `user_role` VALUES (8, 126, 4, NULL, NULL);
INSERT INTO `user_role` VALUES (13, 127, 1, NULL, NULL);
INSERT INTO `user_role` VALUES (14, 128, 1, NULL, NULL);
INSERT INTO `user_role` VALUES (15, 128, 2, NULL, NULL);
INSERT INTO `user_role` VALUES (16, 128, 3, NULL, NULL);
INSERT INTO `user_role` VALUES (17, 128, 4, NULL, NULL);
INSERT INTO `user_role` VALUES (18, 129, 1, NULL, NULL);
INSERT INTO `user_role` VALUES (19, 129, 2, NULL, NULL);
INSERT INTO `user_role` VALUES (20, 129, 3, NULL, NULL);
INSERT INTO `user_role` VALUES (21, 129, 4, NULL, NULL);
INSERT INTO `user_role` VALUES (26, 132, 1, '2020-11-17 14:56:52', '2020-11-17 14:56:52');
INSERT INTO `user_role` VALUES (27, 132, 2, '2020-11-17 14:56:52', '2020-11-17 14:56:52');
INSERT INTO `user_role` VALUES (28, 132, 3, '2020-11-17 14:56:52', '2020-11-17 14:56:52');
INSERT INTO `user_role` VALUES (29, 132, 4, '2020-11-17 14:56:52', '2020-11-17 14:56:52');
INSERT INTO `user_role` VALUES (30, 133, 1, '2020-11-17 15:01:32', '2020-11-17 15:01:32');
INSERT INTO `user_role` VALUES (31, 133, 2, '2020-11-17 15:01:32', '2020-11-17 15:01:32');
INSERT INTO `user_role` VALUES (32, 133, 3, '2020-11-17 15:01:32', '2020-11-17 15:01:32');
INSERT INTO `user_role` VALUES (33, 133, 4, '2020-11-17 15:01:32', '2020-11-17 15:01:32');
INSERT INTO `user_role` VALUES (34, 134, 1, '2020-11-17 15:03:15', '2020-11-17 15:03:15');
INSERT INTO `user_role` VALUES (35, 134, 2, '2020-11-17 15:03:15', '2020-11-17 15:03:15');
INSERT INTO `user_role` VALUES (36, 134, 3, '2020-11-17 15:03:15', '2020-11-17 15:03:15');
INSERT INTO `user_role` VALUES (39, 1, 3, '2020-11-17 18:22:47', '2020-11-17 18:22:47');
INSERT INTO `user_role` VALUES (40, 1, 2, '2020-11-17 18:22:47', '2020-11-17 18:22:47');
INSERT INTO `user_role` VALUES (41, 130, 1, '2020-11-17 18:23:27', '2020-11-17 18:23:27');
INSERT INTO `user_role` VALUES (42, 130, 2, '2020-11-17 18:23:27', '2020-11-17 18:23:27');
INSERT INTO `user_role` VALUES (43, 130, 3, '2020-11-17 18:23:27', '2020-11-17 18:23:27');
INSERT INTO `user_role` VALUES (44, 130, 4, '2020-11-17 18:23:27', '2020-11-17 18:23:27');
INSERT INTO `user_role` VALUES (45, 135, 1, '2020-11-25 05:08:46', '2020-11-25 05:08:46');
INSERT INTO `user_role` VALUES (46, 136, 3, '2020-11-25 05:09:20', '2020-11-25 05:09:20');
INSERT INTO `user_role` VALUES (47, 137, 2, '2020-11-25 05:10:09', '2020-11-25 05:10:09');
INSERT INTO `user_role` VALUES (48, 138, 4, '2020-11-25 05:10:38', '2020-11-25 05:10:38');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `full_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `position_id` bigint(20) NULL DEFAULT NULL,
  `user_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '$2y$10$W3JdHI3UTBVeA3FScfnFse5W6yPc6QVwliP7cvBBBuTwFsBBTW97a', 'Phan Trịnh Đẹp Trai', '1996-10-23', 1, 'kito2310@gmail.com', '9874654321', 2, '66DCHT21668', NULL, NULL, 1, NULL, '2020-11-06 22:05:01');
INSERT INTO `users` VALUES (126, 'giangth', 'giangth', 'Trần Hoàng Giang', '1999-02-04', 1, '', '', NULL, '077010', '2020-10-23 09:15:08', NULL, 1, NULL, '2020-11-04 22:04:57');
INSERT INTO `users` VALUES (128, '1123', 'q2eqwe', 'qweqwezxczxc', '2020-10-31', 1, '', 'as', NULL, 'asdasd', '2020-11-16 15:07:17', NULL, 1, NULL, '2020-11-02 22:04:52');
INSERT INTO `users` VALUES (130, NULL, '$2y$10$7sAapoxxRtw4ApOmZAgcwOHIcIfl3x7wNxmqbqiux2c4jmVJMDwg2', 'giang 1', '2020-11-02', 1, 'giang@gmail.com', NULL, NULL, '132', '0000-00-00 00:00:00', NULL, NULL, '2020-11-17 07:48:46', '2020-11-17 07:48:46');
INSERT INTO `users` VALUES (132, NULL, '123456', 'Phương Linh', '2020-11-05', 1, 'phuonglinh@gmail.com', NULL, NULL, 'PL123', NULL, NULL, NULL, NULL, '2020-11-02 22:05:04');
INSERT INTO `users` VALUES (134, NULL, '$2y$10$2sqSY5FXNv/KGI7MP3kMAe2MEttdhvTiXM/RYv69cx5UZkzrjmMwW', 'Hoang Giang', '2020-11-01', 1, 'giang2@gmail.com', NULL, NULL, '123', NULL, NULL, NULL, NULL, '2020-11-02 22:05:07');
INSERT INTO `users` VALUES (135, NULL, '$2y$10$nE4Pv5Rdj2zsys3ogmVL0OWkHqZGKgv3J5bVgThKlERdooO/OrUAy', 'role_admin', '2020-11-01', 1, 'admin@gmail.com', NULL, NULL, '077010', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (136, NULL, '$2y$10$QEcoXlTEfZ/WJ3sBf4vD6uNiaXe8GT3EaY9prCvtcHFwVwU.jS4fC', 'role_gvcn', '2020-11-01', 1, 'gvcn@gmail.com', NULL, NULL, '321', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (137, NULL, '$2y$10$0qO.ztnM/HZDsSYtlcA57OO4qQgycniU1Ao6s9mueU7DS1YqqWkIy', 'role_gvcn', '2020-11-08', 2, 'sv@gmail.com', NULL, NULL, 'aaaa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (138, NULL, '$2y$10$N6P2aB1TODLU43AMwNuSR.I3m/7JNMSl/S6dQLGhmD8WdY1PzbLUK', 'role_nhanvien', '2020-11-08', 1, 'man@gmail.com', NULL, NULL, '123123', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (139, NULL, '$2y$10$8/bClhXLpqn.c1OGeJBZt../KPPkZAv9KyLShZrBl3pvbQfFsbOYq', NULL, '2020-11-04', NULL, 'norole@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-25 05:22:18', '2020-11-25 05:22:18');

-- ----------------------------
-- Table structure for work_process
-- ----------------------------
DROP TABLE IF EXISTS `work_process`;
CREATE TABLE `work_process`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `id_department` int(11) NOT NULL,
  `id_positions` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_department`(`id_department`) USING BTREE,
  INDEX `id_positions`(`id_positions`) USING BTREE,
  INDEX `id_employee`(`id_employee`) USING BTREE,
  CONSTRAINT `work_process_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `work_process_ibfk_2` FOREIGN KEY (`id_positions`) REFERENCES `positions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `work_process_ibfk_3` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_process
-- ----------------------------
INSERT INTO `work_process` VALUES (2, '2020-11-05', '2020-11-20', 4, 3, 1014, NULL, '2020-11-22 15:13:17', '2020-11-22 15:13:17');
INSERT INTO `work_process` VALUES (3, '2020-11-05', '2020-11-20', 4, 3, 1015, NULL, '2020-11-22 15:13:35', '2020-11-22 15:13:35');
INSERT INTO `work_process` VALUES (4, '2020-11-04', '2020-11-26', 1, 2, 1016, NULL, '2020-11-22 16:46:01', '2020-11-22 16:46:01');
INSERT INTO `work_process` VALUES (5, '2020-11-03', '2020-11-12', 3, 2, 1019, NULL, '2020-11-24 00:38:53', '2020-11-24 00:38:53');
INSERT INTO `work_process` VALUES (6, '2020-11-01', '2020-11-29', 3, 4, 1020, NULL, '2020-11-24 00:46:30', '2020-11-24 00:46:30');

-- ----------------------------
-- View structure for v_month
-- ----------------------------
DROP VIEW IF EXISTS `v_month`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_month` AS select 1 AS `MONTH` union select 2 AS `MONTH` union select 3 AS `MONTH` union select 4 AS `MONTH` union select 5 AS `MONTH` union select 6 AS `MONTH` union select 7 AS `MONTH` union select 8 AS `MONTH` union select 9 AS `MONTH` union select 10 AS `MONTH` union select 11 AS `MONTH` union select 12 AS `MONTH` ;

SET FOREIGN_KEY_CHECKS = 1;
