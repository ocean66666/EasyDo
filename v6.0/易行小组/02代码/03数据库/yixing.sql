/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : yixing

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 02/11/2020 23:10:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chatroom
-- ----------------------------
DROP TABLE IF EXISTS `chatroom`;
CREATE TABLE `chatroom`  (
  `chatID` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `getterID` int(9) UNSIGNED NULL DEFAULT NULL,
  `senderID` int(9) UNSIGNED NULL DEFAULT NULL,
  `content` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isshow` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`chatID`) USING BTREE,
  INDEX `getterID`(`getterID`) USING BTREE,
  INDEX `senderID`(`senderID`) USING BTREE,
  CONSTRAINT `chatroom_ibfk_1` FOREIGN KEY (`getterID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chatroom_ibfk_2` FOREIGN KEY (`senderID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `collectionID` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `buyerID` int(9) UNSIGNED NULL DEFAULT NULL,
  `sellerID` int(9) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`collectionID`) USING BTREE,
  INDEX `userID`(`buyerID`) USING BTREE,
  INDEX `sellerID`(`sellerID`) USING BTREE,
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`buyerID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`sellerID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good`  (
  `goodID` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goodname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ownername` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` mediumblob NULL,
  `goodstate` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `price` double(8, 2) UNSIGNED NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`goodID`) USING BTREE,
  INDEX `goodname`(`goodname`) USING BTREE,
  INDEX `ownername`(`ownername`) USING BTREE,
  CONSTRAINT `good_ibfk_1` FOREIGN KEY (`ownername`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderID` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goodID` int(9) UNSIGNED NOT NULL,
  `buyerID` int(9) UNSIGNED NOT NULL,
  `sellerID` int(9) UNSIGNED NOT NULL,
  `orderstate` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isshow` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`) USING BTREE,
  INDEX `goodID`(`goodID`) USING BTREE,
  INDEX `buyerID`(`buyerID`) USING BTREE,
  INDEX `sellerID`(`sellerID`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`goodID`) REFERENCES `good` (`goodID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`buyerID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`sellerID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `reportID` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `buyerID` int(9) UNSIGNED NULL DEFAULT NULL,
  `sellerID` int(9) UNSIGNED NULL DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `decription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reportID`) USING BTREE,
  INDEX `buyerID`(`buyerID`) USING BTREE,
  INDEX `sellerID`(`sellerID`) USING BTREE,
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`buyerID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`sellerID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `cartID` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userID` int(9) UNSIGNED NULL DEFAULT NULL,
  `goodID` int(9) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`cartID`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  INDEX `goodID`(`goodID`) USING BTREE,
  CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`goodID`) REFERENCES `good` (`goodID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userID` int(9) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `classroom` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `studentID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `ismanager` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否是管理员',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`userID`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`  (
  `wishID` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userID` int(9) UNSIGNED NULL DEFAULT NULL,
  `wishname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wishprice` double(8, 2) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`wishID`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
