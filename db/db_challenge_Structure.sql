/*
 Navicat Premium Data Transfer

 Source Server         : LocalHost
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : db_challenge

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 26/01/2022 13:25:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_badges
-- ----------------------------
DROP TABLE IF EXISTS `c_badges`;
CREATE TABLE `c_badges`  (
  `id_badge` int NOT NULL AUTO_INCREMENT,
  `badge` varchar(15) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `min` int NOT NULL,
  `max` int NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' COMMENT 'A=Active D=delete',
  PRIMARY KEY (`id_badge`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_countrys
-- ----------------------------
DROP TABLE IF EXISTS `c_countrys`;
CREATE TABLE `c_countrys`  (
  `id_country` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `code` char(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `phone_code` varchar(7) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT 'A' COMMENT 'A=active, D=Delete',
  PRIMARY KEY (`id_country`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250 CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_relations
-- ----------------------------
DROP TABLE IF EXISTS `t_relations`;
CREATE TABLE `t_relations`  (
  `id_relation` int NOT NULL AUTO_INCREMENT,
  `id_userA` int NOT NULL COMMENT 'user adding relationship',
  `id_userR` int NOT NULL COMMENT 'user receiving relationship',
  `date_add` date NOT NULL,
  `time_add` time(0) NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' COMMENT 'A=Active, D=Delete',
  PRIMARY KEY (`id_relation`) USING BTREE,
  INDEX `FK_idUserA`(`id_userA`) USING BTREE,
  INDEX `FK_idUserR`(`id_userR`) USING BTREE,
  CONSTRAINT `FK_idUserA` FOREIGN KEY (`id_userA`) REFERENCES `t_users` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_idUserR` FOREIGN KEY (`id_userR`) REFERENCES `t_users` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(150) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `LastName` varchar(150) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Email` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `id_country` int NOT NULL,
  `id_badge` int NOT NULL DEFAULT 1,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' COMMENT 'A=active, D=delete',
  PRIMARY KEY (`id_user`) USING BTREE,
  UNIQUE INDEX `EmailKey`(`Email`) USING BTREE,
  INDEX `FK_country`(`id_country`) USING BTREE,
  INDEX `FK_badge`(`id_badge`) USING BTREE,
  CONSTRAINT `FK_badge` FOREIGN KEY (`id_badge`) REFERENCES `c_badges` (`id_badge`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_country` FOREIGN KEY (`id_country`) REFERENCES `c_countrys` (`id_country`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
