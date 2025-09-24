/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : xuanke

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 18/06/2025 14:43:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `href` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` smallint(5) NULL DEFAULT 0 COMMENT '父ID',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` tinyint(4) NULL DEFAULT 0 COMMENT '排序',
  `spread` tinyint(2) NULL DEFAULT 0 COMMENT '默认展开 0:false   1:true',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '', '首页', 0, '&#xe68e;', 0, 1);
INSERT INTO `menu` VALUES (10, 'admin/index/main', '首页', 1, '&#xe68e;', 0, 1);
INSERT INTO `menu` VALUES (11, 'admin/index/pwd', '修改密码', 1, '&#xe716;', 1, 0);
INSERT INTO `menu` VALUES (3, NULL, '用户管理', 0, '&#xe653;', 5, 1);
INSERT INTO `menu` VALUES (25, 'admin/shop/index', '课程管理', 2, '&#xe653;', 3, 0);
INSERT INTO `menu` VALUES (2, NULL, '应用管理', 0, '&#xe653;', 2, 1);
INSERT INTO `menu` VALUES (12, 'admin/user/index?rid=1', '管理员', 3, '&#xe653;', 0, 0);
INSERT INTO `menu` VALUES (13, 'admin/user/index?rid=2', '教师', 3, '&#xe653;', 1, 0);
INSERT INTO `menu` VALUES (28, 'admin/shop/index2', '课程列表', 2, '&#xe653;', 3, 0);
INSERT INTO `menu` VALUES (30, 'admin/order/index', '我的选课', 2, '&#xe653;', 3, 0);
INSERT INTO `menu` VALUES (14, 'admin/user/index?rid=3', '学生', 3, '&#xe653;', 2, 0);
INSERT INTO `menu` VALUES (29, 'admin/order/add', '选择课程', 2, '&#xe653;', 3, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `role` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', '1,2,3,10,11,12,13,14,25');
INSERT INTO `role` VALUES (2, '老师', '1,2,10,11,28,3,14');
INSERT INTO `role` VALUES (3, '学生', '1,2,10,11,29,30');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, '历史学', 2434, '李老师');
INSERT INTO `shop` VALUES (2, '世界史', 2435, '王老师');
INSERT INTO `shop` VALUES (3, '考古学', 2434, '李老师');
INSERT INTO `shop` VALUES (4, '文物与博物馆学', 2434, '李老师');
INSERT INTO `shop` VALUES (5, '文物保护技术', 2434, '李老师');
INSERT INTO `shop` VALUES (6, '外国语言与外国历史', 2434, '李老师');
INSERT INTO `shop` VALUES (7, '文化遗产', 2434, '李老师');
INSERT INTO `shop` VALUES (8, '物理学', 2434, '李老师');
INSERT INTO `shop` VALUES (9, '应用物理学', 2434, '李老师');
INSERT INTO `shop` VALUES (10, '核物理', 2434, '李老师');
INSERT INTO `shop` VALUES (11, '声学', 2434, '李老师');
INSERT INTO `shop` VALUES (12, '系统科学与工程', 2434, '李老师');

-- ----------------------------
-- Table structure for torder
-- ----------------------------
DROP TABLE IF EXISTS `torder`;
CREATE TABLE `torder`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sid` int(11) NULL DEFAULT NULL,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `uid2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `uname2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of torder
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `name` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  `rname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nid` int(11) NULL DEFAULT NULL,
  `nname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `bid` int(11) NULL DEFAULT NULL,
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2839 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管工', '15644564', 1, '管理员', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2434, 'laoshi1', 'e10adc3949ba59abbe56e057f20f883e', '李老师', '134545', 2, '老师', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2435, 'laoshi2', 'e10adc3949ba59abbe56e057f20f883e', '王老师', '13454564', 2, '老师', 4, '2024年学期', 2, '2班');
INSERT INTO `user` VALUES (2639, '20001', 'e10adc3949ba59abbe56e057f20f883e', '姓名1', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2640, '20002', 'e10adc3949ba59abbe56e057f20f883e', '姓名2', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2641, '20003', 'e10adc3949ba59abbe56e057f20f883e', '姓名3', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2642, '20004', 'e10adc3949ba59abbe56e057f20f883e', '姓名4', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2643, '20005', 'e10adc3949ba59abbe56e057f20f883e', '姓名5', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2644, '20006', 'e10adc3949ba59abbe56e057f20f883e', '姓名6', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2645, '20007', 'e10adc3949ba59abbe56e057f20f883e', '姓名7', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2646, '20008', 'e10adc3949ba59abbe56e057f20f883e', '姓名8', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2647, '20009', 'e10adc3949ba59abbe56e057f20f883e', '姓名9', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2648, '200010', 'e10adc3949ba59abbe56e057f20f883e', '姓名10', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2649, '200011', 'e10adc3949ba59abbe56e057f20f883e', '姓名11', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2650, '200012', 'e10adc3949ba59abbe56e057f20f883e', '姓名12', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2651, '200013', 'e10adc3949ba59abbe56e057f20f883e', '姓名13', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2652, '200014', 'e10adc3949ba59abbe56e057f20f883e', '姓名14', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2653, '200015', 'e10adc3949ba59abbe56e057f20f883e', '姓名15', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2654, '200016', 'e10adc3949ba59abbe56e057f20f883e', '姓名16', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2655, '200017', 'e10adc3949ba59abbe56e057f20f883e', '姓名17', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2656, '200018', 'e10adc3949ba59abbe56e057f20f883e', '姓名18', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2657, '200019', 'e10adc3949ba59abbe56e057f20f883e', '姓名19', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2658, '200020', 'e10adc3949ba59abbe56e057f20f883e', '姓名20', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2659, '200021', 'e10adc3949ba59abbe56e057f20f883e', '姓名21', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2660, '200022', 'e10adc3949ba59abbe56e057f20f883e', '姓名22', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2661, '200023', 'e10adc3949ba59abbe56e057f20f883e', '姓名23', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2662, '200024', 'e10adc3949ba59abbe56e057f20f883e', '姓名24', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2663, '200025', 'e10adc3949ba59abbe56e057f20f883e', '姓名25', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2664, '200026', 'e10adc3949ba59abbe56e057f20f883e', '姓名26', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2665, '200027', 'e10adc3949ba59abbe56e057f20f883e', '姓名27', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2666, '200028', 'e10adc3949ba59abbe56e057f20f883e', '姓名28', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2667, '200029', 'e10adc3949ba59abbe56e057f20f883e', '姓名29', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2668, '200030', 'e10adc3949ba59abbe56e057f20f883e', '姓名30', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2669, '200031', 'e10adc3949ba59abbe56e057f20f883e', '姓名31', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2670, '200032', 'e10adc3949ba59abbe56e057f20f883e', '姓名32', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2671, '200033', 'e10adc3949ba59abbe56e057f20f883e', '姓名33', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2672, '200034', 'e10adc3949ba59abbe56e057f20f883e', '姓名34', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2673, '200035', 'e10adc3949ba59abbe56e057f20f883e', '姓名35', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2674, '200036', 'e10adc3949ba59abbe56e057f20f883e', '姓名36', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2675, '200037', 'e10adc3949ba59abbe56e057f20f883e', '姓名37', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2676, '200038', 'e10adc3949ba59abbe56e057f20f883e', '姓名38', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2677, '200039', 'e10adc3949ba59abbe56e057f20f883e', '姓名39', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2678, '200040', 'e10adc3949ba59abbe56e057f20f883e', '姓名40', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2679, '200041', 'e10adc3949ba59abbe56e057f20f883e', '姓名41', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2680, '200042', 'e10adc3949ba59abbe56e057f20f883e', '姓名42', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2681, '200043', 'e10adc3949ba59abbe56e057f20f883e', '姓名43', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2682, '200044', 'e10adc3949ba59abbe56e057f20f883e', '姓名44', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2683, '200045', 'e10adc3949ba59abbe56e057f20f883e', '姓名45', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2684, '200046', 'e10adc3949ba59abbe56e057f20f883e', '姓名46', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2685, '200047', 'e10adc3949ba59abbe56e057f20f883e', '姓名47', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2686, '200048', 'e10adc3949ba59abbe56e057f20f883e', '姓名48', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2687, '200049', 'e10adc3949ba59abbe56e057f20f883e', '姓名49', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2688, '200050', 'e10adc3949ba59abbe56e057f20f883e', '姓名50', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2689, '200051', 'e10adc3949ba59abbe56e057f20f883e', '姓名51', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2690, '200052', 'e10adc3949ba59abbe56e057f20f883e', '姓名52', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2691, '200053', 'e10adc3949ba59abbe56e057f20f883e', '姓名53', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2692, '200054', 'e10adc3949ba59abbe56e057f20f883e', '姓名54', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2693, '200055', 'e10adc3949ba59abbe56e057f20f883e', '姓名55', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2694, '200056', 'e10adc3949ba59abbe56e057f20f883e', '姓名56', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2695, '200057', 'e10adc3949ba59abbe56e057f20f883e', '姓名57', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2696, '200058', 'e10adc3949ba59abbe56e057f20f883e', '姓名58', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2697, '200059', 'e10adc3949ba59abbe56e057f20f883e', '姓名59', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2698, '200060', 'e10adc3949ba59abbe56e057f20f883e', '姓名60', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2699, '200061', 'e10adc3949ba59abbe56e057f20f883e', '姓名61', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2700, '200062', 'e10adc3949ba59abbe56e057f20f883e', '姓名62', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2701, '200063', 'e10adc3949ba59abbe56e057f20f883e', '姓名63', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2702, '200064', 'e10adc3949ba59abbe56e057f20f883e', '姓名64', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2703, '200065', 'e10adc3949ba59abbe56e057f20f883e', '姓名65', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2704, '200066', 'e10adc3949ba59abbe56e057f20f883e', '姓名66', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2705, '200067', 'e10adc3949ba59abbe56e057f20f883e', '姓名67', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2706, '200068', 'e10adc3949ba59abbe56e057f20f883e', '姓名68', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2707, '200069', 'e10adc3949ba59abbe56e057f20f883e', '姓名69', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2708, '200070', 'e10adc3949ba59abbe56e057f20f883e', '姓名70', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2709, '200071', 'e10adc3949ba59abbe56e057f20f883e', '姓名71', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2710, '200072', 'e10adc3949ba59abbe56e057f20f883e', '姓名72', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2711, '200073', 'e10adc3949ba59abbe56e057f20f883e', '姓名73', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2712, '200074', 'e10adc3949ba59abbe56e057f20f883e', '姓名74', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2713, '200075', 'e10adc3949ba59abbe56e057f20f883e', '姓名75', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2714, '200076', 'e10adc3949ba59abbe56e057f20f883e', '姓名76', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2715, '200077', 'e10adc3949ba59abbe56e057f20f883e', '姓名77', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2716, '200078', 'e10adc3949ba59abbe56e057f20f883e', '姓名78', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2717, '200079', 'e10adc3949ba59abbe56e057f20f883e', '姓名79', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2718, '200080', 'e10adc3949ba59abbe56e057f20f883e', '姓名80', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2719, '200081', 'e10adc3949ba59abbe56e057f20f883e', '姓名81', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2720, '200082', 'e10adc3949ba59abbe56e057f20f883e', '姓名82', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2721, '200083', 'e10adc3949ba59abbe56e057f20f883e', '姓名83', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2722, '200084', 'e10adc3949ba59abbe56e057f20f883e', '姓名84', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2723, '200085', 'e10adc3949ba59abbe56e057f20f883e', '姓名85', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2724, '200086', 'e10adc3949ba59abbe56e057f20f883e', '姓名86', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2725, '200087', 'e10adc3949ba59abbe56e057f20f883e', '姓名87', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2726, '200088', 'e10adc3949ba59abbe56e057f20f883e', '姓名88', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2727, '200089', 'e10adc3949ba59abbe56e057f20f883e', '姓名89', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2728, '200090', 'e10adc3949ba59abbe56e057f20f883e', '姓名90', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2729, '200091', 'e10adc3949ba59abbe56e057f20f883e', '姓名91', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2730, '200092', 'e10adc3949ba59abbe56e057f20f883e', '姓名92', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2731, '200093', 'e10adc3949ba59abbe56e057f20f883e', '姓名93', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2732, '200094', 'e10adc3949ba59abbe56e057f20f883e', '姓名94', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2733, '200095', 'e10adc3949ba59abbe56e057f20f883e', '姓名95', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2734, '200096', 'e10adc3949ba59abbe56e057f20f883e', '姓名96', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2735, '200097', 'e10adc3949ba59abbe56e057f20f883e', '姓名97', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2736, '200098', 'e10adc3949ba59abbe56e057f20f883e', '姓名98', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2737, '200099', 'e10adc3949ba59abbe56e057f20f883e', '姓名99', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2738, '2000100', 'e10adc3949ba59abbe56e057f20f883e', '姓名100', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2739, '2000101', 'e10adc3949ba59abbe56e057f20f883e', '姓名101', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2740, '2000102', 'e10adc3949ba59abbe56e057f20f883e', '姓名102', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2741, '2000103', 'e10adc3949ba59abbe56e057f20f883e', '姓名103', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2742, '2000104', 'e10adc3949ba59abbe56e057f20f883e', '姓名104', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2743, '2000105', 'e10adc3949ba59abbe56e057f20f883e', '姓名105', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2744, '2000106', 'e10adc3949ba59abbe56e057f20f883e', '姓名106', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2745, '2000107', 'e10adc3949ba59abbe56e057f20f883e', '姓名107', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2746, '2000108', 'e10adc3949ba59abbe56e057f20f883e', '姓名108', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2747, '2000109', 'e10adc3949ba59abbe56e057f20f883e', '姓名109', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2748, '2000110', 'e10adc3949ba59abbe56e057f20f883e', '姓名110', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2749, '2000111', 'e10adc3949ba59abbe56e057f20f883e', '姓名111', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2750, '2000112', 'e10adc3949ba59abbe56e057f20f883e', '姓名112', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2751, '2000113', 'e10adc3949ba59abbe56e057f20f883e', '姓名113', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2752, '2000114', 'e10adc3949ba59abbe56e057f20f883e', '姓名114', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2753, '2000115', 'e10adc3949ba59abbe56e057f20f883e', '姓名115', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2754, '2000116', 'e10adc3949ba59abbe56e057f20f883e', '姓名116', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2755, '2000117', 'e10adc3949ba59abbe56e057f20f883e', '姓名117', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2756, '2000118', 'e10adc3949ba59abbe56e057f20f883e', '姓名118', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2757, '2000119', 'e10adc3949ba59abbe56e057f20f883e', '姓名119', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2758, '2000120', 'e10adc3949ba59abbe56e057f20f883e', '姓名120', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2759, '2000121', 'e10adc3949ba59abbe56e057f20f883e', '姓名121', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2760, '2000122', 'e10adc3949ba59abbe56e057f20f883e', '姓名122', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2761, '2000123', 'e10adc3949ba59abbe56e057f20f883e', '姓名123', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2762, '2000124', 'e10adc3949ba59abbe56e057f20f883e', '姓名124', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2763, '2000125', 'e10adc3949ba59abbe56e057f20f883e', '姓名125', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2764, '2000126', 'e10adc3949ba59abbe56e057f20f883e', '姓名126', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2765, '2000127', 'e10adc3949ba59abbe56e057f20f883e', '姓名127', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2766, '2000128', 'e10adc3949ba59abbe56e057f20f883e', '姓名128', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2767, '2000129', 'e10adc3949ba59abbe56e057f20f883e', '姓名129', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2768, '2000130', 'e10adc3949ba59abbe56e057f20f883e', '姓名130', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2769, '2000131', 'e10adc3949ba59abbe56e057f20f883e', '姓名131', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2770, '2000132', 'e10adc3949ba59abbe56e057f20f883e', '姓名132', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2771, '2000133', 'e10adc3949ba59abbe56e057f20f883e', '姓名133', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2772, '2000134', 'e10adc3949ba59abbe56e057f20f883e', '姓名134', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2773, '2000135', 'e10adc3949ba59abbe56e057f20f883e', '姓名135', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2774, '2000136', 'e10adc3949ba59abbe56e057f20f883e', '姓名136', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2775, '2000137', 'e10adc3949ba59abbe56e057f20f883e', '姓名137', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2776, '2000138', 'e10adc3949ba59abbe56e057f20f883e', '姓名138', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2777, '2000139', 'e10adc3949ba59abbe56e057f20f883e', '姓名139', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2778, '2000140', 'e10adc3949ba59abbe56e057f20f883e', '姓名140', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2779, '2000141', 'e10adc3949ba59abbe56e057f20f883e', '姓名141', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2780, '2000142', 'e10adc3949ba59abbe56e057f20f883e', '姓名142', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2781, '2000143', 'e10adc3949ba59abbe56e057f20f883e', '姓名143', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2782, '2000144', 'e10adc3949ba59abbe56e057f20f883e', '姓名144', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2783, '2000145', 'e10adc3949ba59abbe56e057f20f883e', '姓名145', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2784, '2000146', 'e10adc3949ba59abbe56e057f20f883e', '姓名146', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2785, '2000147', 'e10adc3949ba59abbe56e057f20f883e', '姓名147', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2786, '2000148', 'e10adc3949ba59abbe56e057f20f883e', '姓名148', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2787, '2000149', 'e10adc3949ba59abbe56e057f20f883e', '姓名149', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2788, '2000150', 'e10adc3949ba59abbe56e057f20f883e', '姓名150', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2789, '2000151', 'e10adc3949ba59abbe56e057f20f883e', '姓名151', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2790, '2000152', 'e10adc3949ba59abbe56e057f20f883e', '姓名152', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2791, '2000153', 'e10adc3949ba59abbe56e057f20f883e', '姓名153', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2792, '2000154', 'e10adc3949ba59abbe56e057f20f883e', '姓名154', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2793, '2000155', 'e10adc3949ba59abbe56e057f20f883e', '姓名155', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2794, '2000156', 'e10adc3949ba59abbe56e057f20f883e', '姓名156', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2795, '2000157', 'e10adc3949ba59abbe56e057f20f883e', '姓名157', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2796, '2000158', 'e10adc3949ba59abbe56e057f20f883e', '姓名158', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2797, '2000159', 'e10adc3949ba59abbe56e057f20f883e', '姓名159', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2798, '2000160', 'e10adc3949ba59abbe56e057f20f883e', '姓名160', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2799, '2000161', 'e10adc3949ba59abbe56e057f20f883e', '姓名161', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2800, '2000162', 'e10adc3949ba59abbe56e057f20f883e', '姓名162', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2801, '2000163', 'e10adc3949ba59abbe56e057f20f883e', '姓名163', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2802, '2000164', 'e10adc3949ba59abbe56e057f20f883e', '姓名164', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2803, '2000165', 'e10adc3949ba59abbe56e057f20f883e', '姓名165', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2804, '2000166', 'e10adc3949ba59abbe56e057f20f883e', '姓名166', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2805, '2000167', 'e10adc3949ba59abbe56e057f20f883e', '姓名167', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2806, '2000168', 'e10adc3949ba59abbe56e057f20f883e', '姓名168', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2807, '2000169', 'e10adc3949ba59abbe56e057f20f883e', '姓名169', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2808, '2000170', 'e10adc3949ba59abbe56e057f20f883e', '姓名170', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2809, '2000171', 'e10adc3949ba59abbe56e057f20f883e', '姓名171', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2810, '2000172', 'e10adc3949ba59abbe56e057f20f883e', '姓名172', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2811, '2000173', 'e10adc3949ba59abbe56e057f20f883e', '姓名173', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2812, '2000174', 'e10adc3949ba59abbe56e057f20f883e', '姓名174', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2813, '2000175', 'e10adc3949ba59abbe56e057f20f883e', '姓名175', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2814, '2000176', 'e10adc3949ba59abbe56e057f20f883e', '姓名176', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2815, '2000177', 'e10adc3949ba59abbe56e057f20f883e', '姓名177', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2816, '2000178', 'e10adc3949ba59abbe56e057f20f883e', '姓名178', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2817, '2000179', 'e10adc3949ba59abbe56e057f20f883e', '姓名179', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2818, '2000180', 'e10adc3949ba59abbe56e057f20f883e', '姓名180', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2819, '2000181', 'e10adc3949ba59abbe56e057f20f883e', '姓名181', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2820, '2000182', 'e10adc3949ba59abbe56e057f20f883e', '姓名182', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2821, '2000183', 'e10adc3949ba59abbe56e057f20f883e', '姓名183', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2822, '2000184', 'e10adc3949ba59abbe56e057f20f883e', '姓名184', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2823, '2000185', 'e10adc3949ba59abbe56e057f20f883e', '姓名185', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2824, '2000186', 'e10adc3949ba59abbe56e057f20f883e', '姓名186', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2825, '2000187', 'e10adc3949ba59abbe56e057f20f883e', '姓名187', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2826, '2000188', 'e10adc3949ba59abbe56e057f20f883e', '姓名188', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2827, '2000189', 'e10adc3949ba59abbe56e057f20f883e', '姓名189', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2828, '2000190', 'e10adc3949ba59abbe56e057f20f883e', '姓名190', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2829, '2000191', 'e10adc3949ba59abbe56e057f20f883e', '姓名191', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2830, '2000192', 'e10adc3949ba59abbe56e057f20f883e', '姓名192', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2831, '2000193', 'e10adc3949ba59abbe56e057f20f883e', '姓名193', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2832, '2000194', 'e10adc3949ba59abbe56e057f20f883e', '姓名194', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2833, '2000195', 'e10adc3949ba59abbe56e057f20f883e', '姓名195', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2834, '2000196', 'e10adc3949ba59abbe56e057f20f883e', '姓名196', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2835, '2000197', 'e10adc3949ba59abbe56e057f20f883e', '姓名197', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2836, '2000198', 'e10adc3949ba59abbe56e057f20f883e', '姓名198', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2837, '2000199', 'e10adc3949ba59abbe56e057f20f883e', '姓名199', '10086', 3, '学生', 4, '2024年学期', 1, '1班');
INSERT INTO `user` VALUES (2838, '2000200', 'e10adc3949ba59abbe56e057f20f883e', '姓名200', '10086', 3, '学生', 4, '2024年学期', 1, '1班');

SET FOREIGN_KEY_CHECKS = 1;
