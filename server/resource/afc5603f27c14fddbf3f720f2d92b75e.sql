/*
 Navicat Premium Data Transfer

 Source Server         : mac-local
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : SDMS

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 22/03/2020 11:42:45
*/

DROP DATABASE IF EXISTS SDMS;
CREATE DATABASE SDMS;
use SDMS;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) NOT NULL,
  `hash_name` varchar(200) NOT NULL,
  `upload_time` timestamp NOT NULL,
  `type` varchar(20) NOT NULL,
  `size` varchar(20) NOT NULL,
  `download` varchar(50) NOT NULL,
  `uid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
BEGIN;
INSERT INTO `file` VALUES (1, '网盘主页.png', '9120e2fc48830d99471066500dfc7809.png', '2020-03-16 23:40:07', '.png', '29636', '0', 1);
INSERT INTO `file` VALUES (3, '安装免验证补丁.dmg', '577431d9722c4c564b17ecea6c5b5fd2.dmg', '2020-03-16 23:49:32', '.dmg', '94848', '0', 2);
INSERT INTO `file` VALUES (6, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-17 23:37:23', '.png', '31119', '3', 7);
INSERT INTO `file` VALUES (7, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-18 01:10:08', '.pptx', '7830573', '2', 7);
INSERT INTO `file` VALUES (8, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-18 02:33:12', '.pdf', '122049', '0', 7);
INSERT INTO `file` VALUES (9, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-18 14:09:15', '.js', '352', '0', 7);
INSERT INTO `file` VALUES (10, 'lyw-ssr-5640990@qq.com.txt', '98d3d462d1b1e99ebaaf04708e6814f6.com', '2020-03-18 22:09:40', '.txt', '4252', '2', 7);
INSERT INTO `file` VALUES (11, 'lyw-ssr-75869142@qq.com.txt', '5d25e1ca41a3764f59dc2c26c2003630.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 7);
INSERT INTO `file` VALUES (12, 'lyw-ssr-123221411@qq.com.txt', 'd34fa0a5eec3d30982807ce3bd0b9de3.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (13, 'lyw-ssr-358816277@qq.com.txt', '16983c5cc1ad046bba1a2f82167619c4.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (14, 'lyw-ssr-445970731@qq.com.txt', '7e0a6222ad37da84cc578537b975286e.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (15, 'lyw-ssr-386857670@qq.com.txt', '328527dc578511b4d35b5edda640cc34.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (16, 'lyw-ssr-616784236@qq.com.txt', '099247200d897a697c646ba61d77e6bc.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (17, 'lyw-ssr-635525562@qq.com.txt', '272c4a9992aee988cb63b56555f4fca9.com', '2020-03-18 22:09:40', '.txt', '5984', '0', 6);
INSERT INTO `file` VALUES (18, 'lyw-ssr-761057989@qq.com.txt', 'd7aa10d0018067b8b94afee069c4fe40.com', '2020-03-18 22:09:40', '.txt', '4644', '0', 6);
INSERT INTO `file` VALUES (19, 'lyw-ssr-794000685@qq.com.txt', '56139c57e05f115f31e52d35f4b6e0a0.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (20, 'lyw-ssr-845090638@qq.com.txt', 'ee2c1e095b7e83eefbc8efd32458a3a5.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (21, 'lyw-ssr-907671419@qq.com.txt', '3ade5a1e819865c9e2384a2782ec6b94.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (22, 'lyw-ssr-947346004@qq.com.txt', 'e1aadbec181c36ae555126fefaa95cce.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (23, 'lyw-ssr-1274096495@qq.com.txt', 'c7202a4bb744d5ed432796a7622967f1.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (24, 'lyw-ssr-1480252946@qq.com.txt', '5a5376fcd02174c9bfbc820f980ab5cc.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (25, 'lyw-ssr-1747052398@qq.com.txt', '10cc8e4c6f1b4bc2ecd9af75b2c6ea00.com', '2020-03-18 22:09:40', '.txt', '4644', '0', 6);
INSERT INTO `file` VALUES (26, 'lyw-ssr-2310308583@qq.com.txt', 'ae1da3972222b79a94fc290c13c731e2.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (27, 'lyw-ssr-2365668305@qq.com.txt', '8c7645520016ef845c86767b77b2a56d.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (28, 'lyw-ssr-chiangweijiang@qq.com.txt', 'e156826c87ccfd4f8079ef9b47b79e64.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (29, 'lyw-ssr-danyizhang94@163.com.txt', 'e47378cfc2e369b3bcdeb9c413baea9f.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (30, 'lyw-ssr-huzhe2016@163.com.txt', 'a4233787474d3f41b8e2a6db66c39c5a.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (31, 'lyw-ssr-isabelyin94@gmail.com.txt', 'bbc754df3f068ebd1213b3bd46e25bf9.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (32, 'lyw-ssr-lili1074052804@qq.com.txt', '0ad9960126bf67e26254825f9a9a151a.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (33, 'lyw-ssr-lyw.txt', '309a50f081e1b69d47ed9377cf046497.txt', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (34, 'lyw-ssr-lywdeol@outlook.com.txt', '5854a8522956ba0a25ea2326019c7b32.com', '2020-03-18 22:09:40', '.txt', '3560', '0', 6);
INSERT INTO `file` VALUES (35, 'lyw-ssr-shihuishihuihz@163.com.txt', '2055b0a3427b9784032bf363daba517e.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (36, 'lyw-ssr-test.txt', 'a40a303d29da3228a4b7e65e2b3da76d.txt', '2020-03-18 22:09:40', '.txt', '3664', '0', 6);
INSERT INTO `file` VALUES (37, 'lyw-ssr-zy13440@outlook.com.txt', 'f9a8caf1c4fbd02a038ea30ea8fbd913.com', '2020-03-18 22:09:40', '.txt', '4252', '0', 6);
INSERT INTO `file` VALUES (38, 'qq.txt', '099b3b060154898840f0ebdfb46ec78f.txt', '2020-03-18 22:09:40', '.txt', '104', '0', 6);
INSERT INTO `file` VALUES (39, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 01:58:51', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (40, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 01:58:51', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (41, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:04:11', '.pptx', '7830573', '0', 1);
INSERT INTO `file` VALUES (42, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 02:04:11', '.pdf', '122049', '0', 1);
INSERT INTO `file` VALUES (43, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:12:21', '.pptx', '7830573', '0', 11);
INSERT INTO `file` VALUES (44, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 02:12:21', '.pdf', '122049', '0', 11);
INSERT INTO `file` VALUES (45, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:15:30', '.pptx', '7830573', '0', 5);
INSERT INTO `file` VALUES (46, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 02:15:30', '.pdf', '122049', '0', 5);
INSERT INTO `file` VALUES (47, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 02:38:46', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (48, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:38:46', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (49, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 02:40:45', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (50, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:40:45', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (51, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 02:40:45', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (52, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:40:48', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (53, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:40:49', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (54, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 02:40:52', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (55, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:40:52', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (56, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 02:40:52', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (57, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 02:40:54', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (58, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:40:54', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (59, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 02:40:54', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (60, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:47:54', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (61, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 02:59:47', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (62, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:51:13', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (63, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:56:21', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (64, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:56:56', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (65, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 14:57:34', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (66, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:57:34', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (67, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 14:57:34', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (68, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:57:38', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (69, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:57:51', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (70, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:58:00', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (71, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:58:29', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (72, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:58:37', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (73, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:58:49', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (74, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 14:58:49', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (75, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 14:58:49', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (76, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:58:55', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (77, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 14:59:41', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (78, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:59:41', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (79, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 14:59:41', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (80, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 14:59:59', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (81, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:00:07', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (82, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:00:22', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (83, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:00:22', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (84, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:00:22', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (85, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:00:25', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (86, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:00:40', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (87, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:00:40', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (88, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:00:40', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (89, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:00:41', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (90, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:00:55', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (91, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:01:39', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (92, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:01:54', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (93, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:16:41', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (94, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:25:54', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (95, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:30:58', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (96, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:31:12', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (97, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:33:09', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (98, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:33:09', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (99, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:33:09', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (100, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:33:16', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (101, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:33:26', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (102, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:35:09', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (103, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:45:28', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (104, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:45:34', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (105, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:45:51', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (106, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:46:24', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (107, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:46:24', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (108, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:46:24', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (109, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:46:48', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (110, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:46:48', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (111, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:46:48', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (112, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:46:56', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (113, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:47:04', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (114, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:47:07', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (115, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:47:07', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (116, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:47:07', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (117, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:47:19', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (118, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:47:23', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (119, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:47:30', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (120, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:48:48', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (121, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:48:50', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (122, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:48:50', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (123, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:48:50', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (124, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:48:56', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (125, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:48:56', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (126, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:48:56', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (127, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:48:58', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (128, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:49:05', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (129, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:49:11', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (130, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:49:11', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (131, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:50:54', '.pptx', '7830573', '1', 6);
INSERT INTO `file` VALUES (132, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:51:08', '.pptx', '7830573', '1', 6);
INSERT INTO `file` VALUES (133, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:51:37', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (134, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:51:45', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (135, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:52:03', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (136, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:57:14', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (137, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:57:14', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (138, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:57:14', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (139, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 15:57:14', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (140, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:57:30', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (141, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:57:30', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (142, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:57:30', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (143, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:59:27', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (144, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:59:27', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (145, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:59:27', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (146, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 15:59:27', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (147, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:59:32', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (148, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:59:35', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (149, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:59:35', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (150, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:59:35', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (151, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 15:59:46', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (152, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 15:59:46', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (153, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 15:59:46', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (154, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 16:00:46', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (155, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 16:00:46', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (156, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 16:00:46', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (157, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 16:00:46', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (158, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 16:01:01', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (159, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 16:01:01', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (160, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 16:01:01', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (161, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 19:53:22', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (162, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 19:53:22', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (163, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 19:53:22', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (164, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 19:53:44', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (165, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 19:53:44', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (166, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 19:53:44', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (167, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 19:53:44', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (168, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 19:55:52', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (169, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 19:55:52', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (170, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 19:57:23', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (171, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 19:57:23', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (172, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 19:57:23', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (173, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 22:19:41', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (174, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 22:19:41', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (175, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 22:19:41', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (176, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 22:19:41', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (177, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 22:20:02', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (178, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 22:20:02', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (179, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 22:20:21', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (180, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 22:20:21', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (181, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 22:20:21', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (182, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:02:20', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (183, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:03:13', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (184, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:03:13', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (185, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:03:13', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (186, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 23:03:13', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (187, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:04:05', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (188, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:04:27', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (189, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:05:14', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (190, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:05:14', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (191, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:05:14', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (192, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:12:34', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (193, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:12:34', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (194, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:12:34', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (195, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 23:12:34', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (196, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:13:40', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (197, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:13:40', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (198, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:13:40', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (199, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 23:13:40', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (200, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:13:52', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (201, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:14:48', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (202, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:14:48', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (203, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:17:32', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (204, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:17:32', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (205, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:18:02', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (206, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:21:37', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (207, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:21:37', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (208, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:23:08', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (209, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:23:08', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (210, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:26:39', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (211, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:26:39', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (212, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:29:41', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (213, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:29:41', '.pptx', '7830573', '1', 6);
INSERT INTO `file` VALUES (214, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:29:41', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (215, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 23:29:41', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (216, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:29:49', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (217, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:29:49', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (218, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:35:34', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (219, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:35:34', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (220, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:35:34', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (221, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 23:35:34', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (222, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:38:12', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (223, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:38:12', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (224, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:38:12', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (225, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:38:22', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (226, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:38:22', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (227, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:38:22', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (228, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 23:38:22', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (229, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:39:56', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (230, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:39:56', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (231, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:46:10', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (232, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:46:10', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (233, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:48:03', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (234, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:48:03', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (235, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:48:03', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (236, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 23:48:03', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (237, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:48:10', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (238, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:48:10', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (239, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:48:10', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (240, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:48:39', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (241, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:48:56', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (242, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:48:56', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (243, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:48:56', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (244, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 23:48:56', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (245, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:50:32', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (246, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:50:32', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (247, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:50:32', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (248, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-21 23:50:32', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (249, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-21 23:50:40', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (250, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-21 23:50:40', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (251, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-21 23:50:40', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (252, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 00:10:23', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (253, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 00:10:23', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (254, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 00:10:23', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (255, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 00:10:23', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (256, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 00:11:49', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (257, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 00:58:39', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (258, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 00:58:39', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (259, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 00:58:39', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (260, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 00:58:39', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (261, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:01:14', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (262, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:01:14', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (263, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:01:14', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (264, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:01:14', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (265, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:10:26', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (266, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:13:13', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (267, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:13:13', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (268, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:13:13', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (269, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:14:49', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (270, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:14:49', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (271, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:14:49', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (272, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:14:49', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (273, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:15:14', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (274, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:16:23', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (275, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:16:23', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (276, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:16:23', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (277, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:24:15', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (278, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:24:15', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (279, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:24:16', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (280, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:24:16', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (281, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:26:18', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (282, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:26:18', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (283, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:26:18', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (284, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:26:18', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (285, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:34:05', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (286, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:34:05', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (287, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:34:05', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (288, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:34:05', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (289, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:36:18', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (290, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:36:18', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (291, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:36:18', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (292, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:36:18', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (293, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:36:50', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (294, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:36:50', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (295, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:36:50', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (296, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:37:30', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (297, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:37:30', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (298, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:38:23', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (299, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:38:23', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (300, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:38:23', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (301, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:38:23', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (302, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:53:24', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (303, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:53:24', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (304, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:53:24', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (305, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:54:08', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (306, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:54:08', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (307, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:54:08', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (308, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:54:08', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (309, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 01:54:19', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (310, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 01:54:19', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (311, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 01:54:19', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (312, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 01:54:19', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (313, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:07:37', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (314, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:07:37', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (315, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:07:37', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (316, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:26:15', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (317, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:26:15', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (318, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:26:15', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (319, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:26:15', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (320, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:26:19', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (321, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:26:19', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (322, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:26:19', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (323, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:26:19', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (324, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:26:19', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (325, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:26:19', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (326, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:31:11', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (327, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:31:11', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (328, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:31:11', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (329, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:31:11', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (330, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:52:25', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (331, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:52:25', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (332, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:52:25', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (333, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:52:25', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (334, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:52:40', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (335, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:52:40', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (336, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:52:40', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (337, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:52:51', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (338, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:52:51', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (339, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:52:51', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (340, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:53:44', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (341, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:53:44', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (342, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:53:44', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (343, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:53:44', '.js', '352', '1', 6);
INSERT INTO `file` VALUES (344, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:53:49', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (345, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:53:49', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (346, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:53:49', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (347, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:53:51', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (348, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:53:51', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (349, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:53:51', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (350, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:53:51', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (351, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:53:53', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (352, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:53:53', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (353, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:53:53', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (354, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:53:53', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (355, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:53:55', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (356, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:53:55', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (357, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:53:55', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (358, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:54:04', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (359, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:54:04', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (360, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:54:04', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (361, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:54:04', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (362, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:54:05', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (363, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:54:06', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (364, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:54:06', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (365, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:54:06', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (366, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:54:06', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (367, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:54:06', '.pptx', '7830573', '0', 6);
INSERT INTO `file` VALUES (368, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:54:06', '.pdf', '122049', '1', 6);
INSERT INTO `file` VALUES (369, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:54:06', '.js', '352', '0', 6);
INSERT INTO `file` VALUES (370, 'Share files(2).png', '64ca0cf8841e684219607a6e24a2ff96.png', '2020-03-22 02:54:08', '.png', '31119', '0', 6);
INSERT INTO `file` VALUES (371, 'Academic - report -  Writing- Learning Development - PRCO308- 18-3-2019 - Jason Truscott.pptx', 'b1ee680c3c0c4f3bbd7097b0465d930a.pptx', '2020-03-22 02:54:08', '.pptx', '7830573', '1', 6);
INSERT INTO `file` VALUES (372, '项目说明.pdf', '9237a23eb5b4053fc8e63118f9475dd0.pdf', '2020-03-22 02:54:08', '.pdf', '122049', '0', 6);
INSERT INTO `file` VALUES (373, 'main.js', 'fad58de7366495db4650cfefac2fcd61.js', '2020-03-22 02:54:08', '.js', '352', '0', 6);
COMMIT;

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL,
  `file_id_list` varchar(255) NOT NULL,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------
BEGIN;
INSERT INTO `share` VALUES (1, '2020-03-18 17:45:45', '6,7,8,9', 7, 2, 'Unhandled');
INSERT INTO `share` VALUES (2, '2020-03-18 17:55:20', '6,7', 7, 2, 'Unhandled');
INSERT INTO `share` VALUES (4, '2020-03-18 17:58:38', '6,7,8,9', 7, 6, 'Unhandled');
INSERT INTO `share` VALUES (6, '2020-03-18 18:03:41', '6,7,8,9', 7, 6, 'Unhandled');
INSERT INTO `share` VALUES (7, '2020-03-18 18:04:08', '6,7,8,9', 7, 0, 'Unhandled');
INSERT INTO `share` VALUES (8, '2020-03-18 18:04:11', '6,7,8,9', 7, 0, 'Unhandled');
INSERT INTO `share` VALUES (9, '2020-03-18 18:05:56', '6,7', 7, 0, 'Unhandled');
INSERT INTO `share` VALUES (10, '2020-03-18 18:07:32', '6,7,8,9', 7, 0, 'Unhandled');
INSERT INTO `share` VALUES (13, '2020-03-18 20:06:34', '6,7,8,9', 7, 2, 'Unhandled');
INSERT INTO `share` VALUES (14, '2020-03-18 20:08:40', '6,9', 7, 0, 'Unhandled');
INSERT INTO `share` VALUES (16, '2020-03-18 20:11:12', '6,7,8,9', 7, 0, 'Unhandled');
INSERT INTO `share` VALUES (17, '2020-03-18 20:16:04', '7,8,9', 7, 6, 'Unhandled');
INSERT INTO `share` VALUES (18, '2020-03-18 20:16:45', '7,8,9', 7, 2, 'Unhandled');
INSERT INTO `share` VALUES (19, '2020-03-18 20:17:00', '7,8,9', 7, 6, 'Unhandled');
INSERT INTO `share` VALUES (22, '2020-03-18 20:20:31', '6,7,8,9', 7, 6, 'Unhandled');
INSERT INTO `share` VALUES (23, '2020-03-18 20:20:35', '6,7,8,9', 7, 0, 'Unhandled');
INSERT INTO `share` VALUES (24, '2020-03-18 20:25:12', '6,7,8,9', 7, 0, 'Unhandled');
INSERT INTO `share` VALUES (26, '2020-03-18 20:29:13', '6,9', 7, 4, 'Unhandled');
INSERT INTO `share` VALUES (28, '2020-03-18 20:36:49', '6,7,8,9', 7, 6, 'Unhandled');
INSERT INTO `share` VALUES (29, '2020-03-18 20:38:20', '6,8', 7, 9, 'Unhandled');
INSERT INTO `share` VALUES (30, '2020-03-18 20:39:05', '8,6,7,9', 9, 6, 'Unhandled');
INSERT INTO `share` VALUES (31, '2020-03-18 20:39:34', '8,6,7,9', 7, 2, 'Unhandled');
INSERT INTO `share` VALUES (32, '2020-03-18 20:41:18', '6,7,8,9', 7, 9, 'Unhandled');
INSERT INTO `share` VALUES (33, '2020-03-18 20:41:43', '6', 7, 4, 'Unhandled');
INSERT INTO `share` VALUES (34, '2020-03-18 20:47:05', '6', 7, 4, 'Unhandled');
INSERT INTO `share` VALUES (35, '2020-03-18 20:47:08', '6', 7, 4, 'Unhandled');
INSERT INTO `share` VALUES (36, '2020-03-18 20:47:17', '6', 7, 4, 'Unhandled');
INSERT INTO `share` VALUES (37, '2020-03-18 20:49:11', '6,7,8,9', 7, 9, 'Unhandled');
INSERT INTO `share` VALUES (51, '2020-03-18 20:55:25', '6,7,8,9', 7, 9, 'Unhandled');
INSERT INTO `share` VALUES (54, '2020-03-18 20:58:57', '6,7,8,9', 7, 9, 'Unhandled');
INSERT INTO `share` VALUES (55, '2020-03-18 20:59:24', '7', 5, 6, 'Unhandled');
INSERT INTO `share` VALUES (56, '2020-03-18 20:59:45', '7,8,6', 7, 6, 'Unhandled');
INSERT INTO `share` VALUES (59, '2020-03-18 21:07:03', '6,7,8,9', 7, 6, 'Unhandled');
INSERT INTO `share` VALUES (66, '2020-03-19 16:09:12', '10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38', 6, 7, 'Unhandled');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'user1', '1');
INSERT INTO `user` VALUES (2, 'ww', 'newnew');
INSERT INTO `user` VALUES (4, 'sa', 'sa');
INSERT INTO `user` VALUES (5, 'd', 'admin');
INSERT INTO `user` VALUES (6, 's', 'ss');
INSERT INTO `user` VALUES (7, 'gfregarega@mail.com', 'dd');
INSERT INTO `user` VALUES (9, 'qaz', 'qaz');
INSERT INTO `user` VALUES (11, 'cc', 'cc');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
