/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 101.35.169.211:3777
 Source Schema         : library_management_system

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 03/12/2023 11:43:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '书名',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `translator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '译者',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ISBN',
  `current_inventory` int(11) NULL DEFAULT 0 COMMENT '当前库存',
  `inventory` int(11) NULL DEFAULT 0 COMMENT '总库存',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '藏书位置',
  `borrowed_times` int(11) NULL DEFAULT 0 COMMENT '借阅次数',
  `publisher_id` bigint(20) NULL DEFAULT NULL COMMENT '出版社id',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '出版时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '图书添加人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '图书添加时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '图书更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '图书更新时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态 0正常 1停用',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志 0未删除 1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '胡萝卜的种子', 29.80, '露丝.克劳斯', '李剑敏', '儿童成长绘本', 'http://101.35.169.211:8998/files/b24a1f9b36c94990ae73bf0dfe3b696b', '9787559622983', 35, 72, '01#12A#1-1', 37, 0, '2018-09-16 00:00:00', NULL, '2018-10-01 00:00:00', 24, '2023-12-02 16:19:21', NULL, '0');
INSERT INTO `book` VALUES (2, '想象力：极致艺术视觉游戏书', 88.00, '诺曼.梅辛杰', '董海雅', '儿童成长绘本', 'http://101.35.169.211:8998/files/da6e0ea410dd42adba3522c904795307', '9787544846240', 30, 36, '02#01B#2-2', 6, 0, '2016-11-23 00:00:00', NULL, '2016-06-23 00:00:00', 23, '2023-11-30 19:47:05', NULL, '0');
INSERT INTO `book` VALUES (3, '一个人的朝圣', 32.80, '蕾秋·乔伊斯', '黄妙瑜', '长篇小说', 'http://101.35.169.211:8998/files/35520cad42e347f1b04ee2028ab77eba', '9787550213524', 41, 105, '03#02B#3-1', 64, 0, '2013-09-01 00:00:00', NULL, '2013-09-01 00:00:00', 23, '2023-12-02 16:13:07', NULL, '0');
INSERT INTO `book` VALUES (4, '追风筝的人', 29.00, '卡勒德.胡赛尼', '李继宏', '长篇小说', 'http://101.35.169.211:8998/files/0f35d893a11d4afba07365d20cadddbb', '9787208061644', 3, 13, '03#02B#3-2', 10, 0, '2003-02-06 00:00:00', NULL, '2003-02-06 00:00:00', 23, '2023-12-02 16:13:24', NULL, '0');
INSERT INTO `book` VALUES (5, '一见你就好心情', 49.00, '莉兹.克里莫', '周高逸', '漫画', 'http://101.35.169.211:8998/files/38df10cea915451eb9f9baf3fc310605', '9787201146591', 34, 80, '03#02C#3-1', 46, 0, '2019-05-10 00:00:00', NULL, '2019-05-10 00:00:00', 23, '2023-11-30 19:50:41', NULL, '0');
INSERT INTO `book` VALUES (6, '非平面', 60.00, '尼克.索萨尼斯', '严安若', '漫画', 'http://101.35.169.211:8998/files/da4f779b350349508456bd815c7a112d', '9787559619433', 54, 78, '03#02C#3-2', 24, 0, '2018-11-27 00:00:00', NULL, '2018-11-27 00:00:00', 23, '2023-11-30 19:51:50', NULL, '0');
INSERT INTO `book` VALUES (7, '饺子和汤圆', 36.00, '卷儿', '——', '儿童成长绘本', 'http://101.35.169.211:8998/files/ae32d5be684d4d0791e63025f58bc218', '9787505634503', 31, 124, '03#02C#3-3', 93, 0, '2017-12-13 00:00:00', NULL, '2017-12-13 00:00:00', 23, '2023-11-30 19:53:12', NULL, '0');
INSERT INTO `book` VALUES (8, '了不起的中医养生妙招', 49.80, '佟彤', '——', '中医养生', 'http://101.35.169.211:8998/files/4e4d9cf4d95e47f1b7a90b60cc515ee9', '9787571022761', 21, 24, '03#02C#3-4', 3, 0, '2023-07-01 00:00:00', NULL, '2021-07-14 00:00:00', 23, '2023-12-02 16:26:55', NULL, '0');
INSERT INTO `book` VALUES (9, '人间失格', 16.00, '太宰治', '许时嘉', '长篇小说', 'http://101.35.169.211:8998/files/adf683e834f842e4b201336b7d32ac57', '9787502062347', 22, 32, '03#02C#3-5', 10, 0, '2009-09-17 00:00:00', NULL, '2016-10-18 00:00:00', 23, '2023-12-02 16:13:43', NULL, '0');
INSERT INTO `book` VALUES (10, '莫泊桑短篇小说选', 39.80, '居伊·德·莫泊桑', '常非常', '短篇小说', 'http://101.35.169.211:8998/files/18412a67a2a24c8e9edcae186e004797', '9787516832721', 33, 43, '03#02C#3-6', 10, 0, '2009-08-01 00:00:00', NULL, '2009-08-01 00:00:00', 23, '2023-12-02 16:13:56', NULL, '0');
INSERT INTO `book` VALUES (11, '月亮与六便士', 39.80, '威廉·萨默塞特·毛姆', '王鑫', '长篇小说', 'http://101.35.169.211:8998/files/df3e1d4a1b5543279ae1f569567b2640', '9787541495137', 32, 34, '03#02C#3-7', 2, 0, '2017-03-01 00:00:00', NULL, '1919-07-17 00:00:00', 23, '2023-12-02 16:14:16', NULL, '0');
INSERT INTO `book` VALUES (12, '安娜·卡列尼娜', 138.00, '列夫·托尔斯泰', '草婴', '长篇小说', 'http://101.35.169.211:8998/files/61f55e2d5e4f4711990db0f998eb6d53', '9787538761016', 66, 68, '03#02B#3-3', 2, 0, '2019-10-14 00:00:00', NULL, '2019-11-14 00:00:00', 23, '2023-12-02 16:14:33', NULL, '0');
INSERT INTO `book` VALUES (13, '全球通史（上下）', 42.00, '斯塔夫里阿诺斯', '吴象婴 / 梁赤民 / 董书慧 / 王昶', '历史', 'http://101.35.169.211:8998/files/b7343bf7ff6c4ee6aecd895cf3709484', '9787301109489', 6, 21, '03#02C#3-8', 15, 0, '2006-01-10 00:00:00', NULL, '2006-10-11 00:00:00', 23, '2023-12-01 22:48:11', NULL, '0');
INSERT INTO `book` VALUES (14, '左宗棠全传', 68.00, '秦翰才', '——', '历史', 'http://101.35.169.211:8998/files/550c67c9d2a241fc90d93677116b0edb', '9787101115079', 117, 122, '03#02C#3-9', 5, 0, '2016-06-01 00:00:00', NULL, '2016-06-21 00:00:00', 23, '2023-12-01 22:25:57', NULL, '0');
INSERT INTO `book` VALUES (15, '上帝掷骰子吗?-量子物理史话', 45.00, '曹天元', '——', '自然科学', 'http://101.35.169.211:8998/files/ffc6adaffc7546ec8ca8659394faa54a', '9787550217454', 65, 93, '03#02B#3-4', 28, 0, '2013-08-01 00:00:00', NULL, '2013-09-11 00:00:00', 23, '2023-12-01 22:27:14', NULL, '0');
INSERT INTO `book` VALUES (16, '傅立叶分析导论', 59.00, 'Elias , Rami Shakarchi', '——', '自然科学', 'http://101.35.169.211:8998/files/4ffad493ac0b43a6a03ccc92c0ded8f5', '9787510040559', 5, 24, '03#02B#3-5', 19, 0, '2013-01-01 00:00:00', NULL, '2012-12-18 00:00:00', 23, '2023-12-01 22:29:32', NULL, '0');
INSERT INTO `book` VALUES (17, '孙子兵法', 20.00, '孙武', '郭化若', '军事', 'http://101.35.169.211:8998/files/64e170cda20448cfa79e24c340c6bd77', '9787532544400', 34, 37, '03#02B#3-6', 3, 0, '2006-07-21 00:00:00', NULL, '2006-07-21 00:00:00', 23, '2023-12-01 22:45:31', NULL, '0');
INSERT INTO `book` VALUES (18, '雪白血红-一名德军士兵的苏德战争回忆录', 89.80, '京特.K.科朔雷克', '小小冰人', '军事', 'http://101.35.169.211:8998/files/fa93fd9af3984d16a8eebb369eda754e', '9787516819104', 66, 79, '03#02B#3-7', 13, 0, '2018-06-15 00:00:00', NULL, '2018-06-25 00:00:00', 23, '2023-12-01 22:46:37', NULL, '0');
INSERT INTO `book` VALUES (19, '西洋镜：一个英国风光摄影大师镜头下的中国', 168.00, '唐纳德•曼尼', '赵省伟 / 彭金枝 / 栾晓敏', '地理', 'http://101.35.169.211:8998/files/076ccb36fda044129fce8162c0a84bad', '9787218124735', 14, 323, '03#02B#3-8', 309, 0, '2018-04-13 00:00:00', NULL, '2018-04-13 00:00:00', 23, '2023-12-01 22:48:01', NULL, '0');
INSERT INTO `book` VALUES (20, '徐霞客游记全译', 185.00, '徐弘', '——', '地理', 'http://101.35.169.211:8998/files/1e53c8cd2bd94e2da143e01cfc216390', '9787221082121', 8, 13, '03#02B#3-9', 5, 0, '2008-09-20 00:00:00', NULL, '2008-02-20 00:00:00', 23, '2023-12-01 22:49:24', NULL, '0');
INSERT INTO `book` VALUES (31, '数据挖掘-原理与实践', 99.00, 'Charu C.Aggarwal', '王晓阳等', '计算机科学', 'http://101.35.169.211:8998/files/d007574b315147f2a1b87fd1df9807cb', '9787111670308', 34, 50, '04#01A#1-1', 16, 0, '2020-12-17 00:00:00', 23, '2023-11-30 17:04:23', 23, '2023-12-02 16:11:41', NULL, '0');
INSERT INTO `book` VALUES (32, '计算机网络-自顶向下方法', 129.00, 'James F.Kurose, Keith W.Ross', '陈鸣', '计算机科学', 'http://101.35.169.211:8998/files/a6fe38a0ad204358a1f234b3f986939d', '9787111712367', 11, 55, '04#01A#1-2', 44, 0, '2022-07-24 00:00:00', 23, '2023-11-30 17:14:16', 23, '2023-12-02 16:11:44', NULL, '0');
INSERT INTO `book` VALUES (33, '算法导论', 99.00, 'Cormen T.H等', '殷建平等', '计算机科学', 'http://101.35.169.211:8998/files/d9bb1390691b4391a5b6abe3bce16623', '9787111407010', 7, 34, '04#01A#1-3', 27, 0, '2013-01-03 00:00:00', 23, '2023-11-30 19:08:36', 23, '2023-12-02 16:11:47', NULL, '0');
INSERT INTO `book` VALUES (34, '现代操作系统', 65.00, 'Tanenbaum A.S', '陈向群等', '计算机科学', 'http://101.35.169.211:8998/files/547245b8b8f1485f9525194f410d1b6b', '9787111255444', 27, 52, '04#01A#1-4', 25, 0, '2009-06-21 00:00:00', 23, '2023-11-30 19:14:27', 23, '2023-12-02 16:11:50', NULL, '0');
INSERT INTO `book` VALUES (35, '计算机组成原理', 79.00, 'Alan Clements', '王苏峰等', '计算机科学', 'http://101.35.169.211:8998/files/e23216b64e9d4de99ec9ecfc985048b4', '9787111558071', 11, 23, '04#01A#1-5', 12, 0, '2017-03-18 00:00:00', 23, '2023-11-30 19:31:47', 23, '2023-12-02 16:11:53', NULL, '0');
INSERT INTO `book` VALUES (36, '破败之咒', 98.00, '安东尼·雷诺兹', '刘阳汝鑫 / 谢楚聿', '长篇小说', 'http://101.35.169.211:8998/files/4a35239b7c00481493980c38d4200ff1', '9787559655035', 0, 15, NULL, 0, NULL, '2022-10-20 00:00:00', 23, '2023-12-02 16:29:14', 23, '2023-12-02 16:29:14', NULL, '0');
INSERT INTO `book` VALUES (37, '球状闪电', 22.00, '刘慈欣', '——', '科幻小说', 'http://101.35.169.211:8998/files/dc50f7412cb4491c9d44855831b6abb6', '9787536455382', 0, 76, NULL, 0, NULL, '2005-06-14 00:00:00', 23, '2023-12-02 16:32:35', 23, '2023-12-02 16:32:35', NULL, '0');
INSERT INTO `book` VALUES (38, '中国历史通论', 99.00, '王家范', '——', '历史', 'http://101.35.169.211:8998/files/cee3bc35956943818454f4a27b4af337', '9787108064776', 0, 24, NULL, 0, NULL, '2019-06-16 00:00:00', 23, '2023-12-02 16:36:05', 23, '2023-12-02 16:36:05', NULL, '0');
INSERT INTO `book` VALUES (39, '战争改变历史', 68.00, '马克斯·布特', '——', '军事', 'http://101.35.169.211:8998/files/82f38b16d4df421d9cdc83cb7015156f', '9787543945623', 0, 33, NULL, 0, NULL, '2011-03-30 00:00:00', 23, '2023-12-02 16:37:37', 23, '2023-12-02 16:37:37', NULL, '0');

-- ----------------------------
-- Table structure for book_mark
-- ----------------------------
DROP TABLE IF EXISTS `book_mark`;
CREATE TABLE `book_mark`  (
  `user_id` bigint(20) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `score` int(11) NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book_mark
-- ----------------------------

-- ----------------------------
-- Table structure for borrow_history
-- ----------------------------
DROP TABLE IF EXISTS `borrow_history`;
CREATE TABLE `borrow_history`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `book_id` bigint(20) NOT NULL COMMENT '图书id',
  `reservation_time` datetime NULL DEFAULT NULL COMMENT '预约时间',
  `reservation_to_time` datetime NULL DEFAULT NULL COMMENT '预约过期时间（最长预约一周的时间，一周后就不能在预约了）',
  `borrow_date` datetime NULL DEFAULT NULL COMMENT '借阅时间',
  `return_date` datetime NULL DEFAULT NULL COMMENT '归还时间',
  `borrow_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '借阅状态 0已借出 / 1已归还 / 2过期未还 / 3已预约',
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE,
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of borrow_history
-- ----------------------------
INSERT INTO `borrow_history` VALUES (1, 1, '2023-10-25 17:10:07', NULL, '2023-10-25 17:10:12', '2023-10-25 17:10:16', '0');
INSERT INTO `borrow_history` VALUES (1, 2, NULL, NULL, '2023-10-29 11:20:33', NULL, '0');
INSERT INTO `borrow_history` VALUES (2, 2, NULL, NULL, '2023-10-29 15:44:42', NULL, '1');
INSERT INTO `borrow_history` VALUES (2, 3, NULL, NULL, '2023-10-29 16:48:16', NULL, '1');
INSERT INTO `borrow_history` VALUES (2, 4, NULL, NULL, '2023-10-29 16:48:39', NULL, '3');
INSERT INTO `borrow_history` VALUES (9, 5, NULL, NULL, '2023-10-29 19:56:02', NULL, '0');
INSERT INTO `borrow_history` VALUES (9, 2, NULL, NULL, '2023-10-29 20:03:27', NULL, '0');
INSERT INTO `borrow_history` VALUES (19, 1, NULL, NULL, '2023-11-29 11:29:52', '2023-11-29 19:23:31', '1');
INSERT INTO `borrow_history` VALUES (19, 2, NULL, NULL, '2023-11-29 11:30:42', NULL, '1');
INSERT INTO `borrow_history` VALUES (19, 3, NULL, NULL, '2023-11-29 11:37:41', NULL, '1');
INSERT INTO `borrow_history` VALUES (19, 7, NULL, NULL, '2023-11-29 13:33:55', NULL, '1');
INSERT INTO `borrow_history` VALUES (19, 8, NULL, NULL, '2023-11-29 13:33:57', NULL, '1');
INSERT INTO `borrow_history` VALUES (19, 9, NULL, NULL, '2023-11-29 13:33:59', NULL, '1');
INSERT INTO `borrow_history` VALUES (19, 1, NULL, NULL, '2023-11-29 17:14:43', '2023-11-29 19:23:31', '1');
INSERT INTO `borrow_history` VALUES (19, 2, NULL, NULL, '2023-11-29 17:16:24', NULL, '1');
INSERT INTO `borrow_history` VALUES (19, 3, NULL, NULL, '2023-11-29 17:16:54', NULL, '1');
INSERT INTO `borrow_history` VALUES (19, 1, NULL, NULL, '2023-11-29 17:32:44', '2023-11-29 19:23:31', '1');
INSERT INTO `borrow_history` VALUES (19, 1, NULL, NULL, '2023-11-29 19:23:23', '2023-11-29 19:23:31', '1');
INSERT INTO `borrow_history` VALUES (19, 1, NULL, NULL, '2023-11-29 20:13:20', NULL, '0');
INSERT INTO `borrow_history` VALUES (22, 1, NULL, NULL, '2023-11-29 20:19:20', NULL, '0');
INSERT INTO `borrow_history` VALUES (22, 3, NULL, NULL, '2023-11-29 20:19:24', NULL, '0');
INSERT INTO `borrow_history` VALUES (18, 1, NULL, NULL, '2023-11-29 20:22:40', NULL, '0');
INSERT INTO `borrow_history` VALUES (24, 1, NULL, NULL, '2023-11-30 16:53:43', '2023-12-02 16:19:21', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2049 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '0', '', 'system', 0, '2021-11-12 10:46:19', 0, NULL, '系统管理目录', '0');
INSERT INTO `menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', '0', 'system:user:list', 'user', 0, '2021-11-12 10:46:19', 1, '2022-07-31 15:47:58', '用户管理菜单', '0');
INSERT INTO `menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', 0, '2021-11-12 10:46:19', 0, NULL, '角色管理菜单', '0');
INSERT INTO `menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', 0, '2021-11-12 10:46:19', 0, NULL, '菜单管理菜单', '0');
INSERT INTO `menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:user:query', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:user:add', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:user:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:user:remove', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:user:export', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:user:import', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:user:resetPwd', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', '0', 'system:role:query', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', '0', 'system:role:add', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', '0', 'system:role:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', '0', 'system:role:remove', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', '0', 'system:role:export', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', '0', 'system:menu:query', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', '0', 'system:menu:add', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', '0', 'system:menu:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', '0', 'system:menu:remove', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `menu` VALUES (2017, '内容管理', 0, 4, 'content', NULL, 1, 'M', '0', '0', NULL, 'table', NULL, '2022-01-08 02:44:38', 1, '2022-07-31 12:34:23', '', '0');
INSERT INTO `menu` VALUES (2018, '分类管理', 2017, 1, 'category', 'content/category/index', 1, 'C', '0', '0', 'content:category:list', 'example', NULL, '2022-01-08 02:51:45', NULL, '2022-01-08 02:51:45', '', '0');
INSERT INTO `menu` VALUES (2019, '文章管理', 2017, 0, 'article', 'content/article/index', 1, 'C', '0', '0', 'content:article:list', 'build', NULL, '2022-01-08 02:53:10', NULL, '2022-01-08 02:53:10', '', '0');
INSERT INTO `menu` VALUES (2021, '标签管理', 2017, 6, 'tag', 'content/tag/index', 1, 'C', '0', '0', 'content:tag:index', 'button', NULL, '2022-01-08 02:55:37', NULL, '2022-01-08 02:55:50', '', '0');
INSERT INTO `menu` VALUES (2022, '友链管理', 2017, 4, 'link', 'content/link/index', 1, 'C', '0', '0', 'content:link:list', '404', NULL, '2022-01-08 02:56:50', NULL, '2022-01-08 02:56:50', '', '0');
INSERT INTO `menu` VALUES (2023, '写博文', 0, 0, 'write', 'content/article/write/index', 1, 'C', '0', '0', 'content:article:writer', 'build', NULL, '2022-01-08 03:39:58', 1, '2022-07-31 22:07:05', '', '0');
INSERT INTO `menu` VALUES (2024, '友链新增', 2022, 0, '', NULL, 1, 'F', '0', '0', 'content:link:add', '#', NULL, '2022-01-16 07:59:17', NULL, '2022-01-16 07:59:17', '', '0');
INSERT INTO `menu` VALUES (2025, '友链修改', 2022, 1, '', NULL, 1, 'F', '0', '0', 'content:link:edit', '#', NULL, '2022-01-16 07:59:44', NULL, '2022-01-16 07:59:44', '', '0');
INSERT INTO `menu` VALUES (2026, '友链删除', 2022, 1, '', NULL, 1, 'F', '0', '0', 'content:link:remove', '#', NULL, '2022-01-16 08:00:05', NULL, '2022-01-16 08:00:05', '', '0');
INSERT INTO `menu` VALUES (2027, '友链查询', 2022, 2, '', NULL, 1, 'F', '0', '0', 'content:link:query', '#', NULL, '2022-01-16 08:04:09', NULL, '2022-01-16 08:04:09', '', '0');
INSERT INTO `menu` VALUES (2028, '导出分类', 2018, 1, '', NULL, 1, 'F', '0', '0', 'content:category:export', '#', NULL, '2022-01-21 07:06:59', NULL, '2022-01-21 07:06:59', '', '0');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 'admin', 1, '0', '0', 0, '2021-11-12 10:46:19', 0, NULL, '超级管理员');
INSERT INTO `role` VALUES (2, '普通角色', 'common', 2, '0', '0', 0, '2021-11-12 10:46:19', 0, '2022-01-01 22:32:58', '普通角色');
INSERT INTO `role` VALUES (11, '嘎嘎嘎', 'aggag', 5, '0', '0', NULL, '2022-01-06 14:07:40', NULL, '2022-01-07 03:48:48', '嘎嘎嘎');
INSERT INTO `role` VALUES (12, '友链审核员', 'link', 1, '0', '0', NULL, '2022-01-16 06:49:30', NULL, '2022-01-16 08:05:09', NULL);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (0, 0);
INSERT INTO `role_menu` VALUES (2, 1);
INSERT INTO `role_menu` VALUES (2, 102);
INSERT INTO `role_menu` VALUES (2, 1013);
INSERT INTO `role_menu` VALUES (2, 1014);
INSERT INTO `role_menu` VALUES (2, 1015);
INSERT INTO `role_menu` VALUES (2, 1016);
INSERT INTO `role_menu` VALUES (2, 2000);
INSERT INTO `role_menu` VALUES (3, 2);
INSERT INTO `role_menu` VALUES (3, 3);
INSERT INTO `role_menu` VALUES (3, 4);
INSERT INTO `role_menu` VALUES (3, 100);
INSERT INTO `role_menu` VALUES (3, 101);
INSERT INTO `role_menu` VALUES (3, 103);
INSERT INTO `role_menu` VALUES (3, 104);
INSERT INTO `role_menu` VALUES (3, 105);
INSERT INTO `role_menu` VALUES (3, 106);
INSERT INTO `role_menu` VALUES (3, 107);
INSERT INTO `role_menu` VALUES (3, 108);
INSERT INTO `role_menu` VALUES (3, 109);
INSERT INTO `role_menu` VALUES (3, 110);
INSERT INTO `role_menu` VALUES (3, 111);
INSERT INTO `role_menu` VALUES (3, 112);
INSERT INTO `role_menu` VALUES (3, 113);
INSERT INTO `role_menu` VALUES (3, 114);
INSERT INTO `role_menu` VALUES (3, 115);
INSERT INTO `role_menu` VALUES (3, 116);
INSERT INTO `role_menu` VALUES (3, 500);
INSERT INTO `role_menu` VALUES (3, 501);
INSERT INTO `role_menu` VALUES (3, 1001);
INSERT INTO `role_menu` VALUES (3, 1002);
INSERT INTO `role_menu` VALUES (3, 1003);
INSERT INTO `role_menu` VALUES (3, 1004);
INSERT INTO `role_menu` VALUES (3, 1005);
INSERT INTO `role_menu` VALUES (3, 1006);
INSERT INTO `role_menu` VALUES (3, 1007);
INSERT INTO `role_menu` VALUES (3, 1008);
INSERT INTO `role_menu` VALUES (3, 1009);
INSERT INTO `role_menu` VALUES (3, 1010);
INSERT INTO `role_menu` VALUES (3, 1011);
INSERT INTO `role_menu` VALUES (3, 1012);
INSERT INTO `role_menu` VALUES (3, 1017);
INSERT INTO `role_menu` VALUES (3, 1018);
INSERT INTO `role_menu` VALUES (3, 1019);
INSERT INTO `role_menu` VALUES (3, 1020);
INSERT INTO `role_menu` VALUES (3, 1021);
INSERT INTO `role_menu` VALUES (3, 1022);
INSERT INTO `role_menu` VALUES (3, 1023);
INSERT INTO `role_menu` VALUES (3, 1024);
INSERT INTO `role_menu` VALUES (3, 1025);
INSERT INTO `role_menu` VALUES (3, 1026);
INSERT INTO `role_menu` VALUES (3, 1027);
INSERT INTO `role_menu` VALUES (3, 1028);
INSERT INTO `role_menu` VALUES (3, 1029);
INSERT INTO `role_menu` VALUES (3, 1030);
INSERT INTO `role_menu` VALUES (3, 1031);
INSERT INTO `role_menu` VALUES (3, 1032);
INSERT INTO `role_menu` VALUES (3, 1033);
INSERT INTO `role_menu` VALUES (3, 1034);
INSERT INTO `role_menu` VALUES (3, 1035);
INSERT INTO `role_menu` VALUES (3, 1036);
INSERT INTO `role_menu` VALUES (3, 1037);
INSERT INTO `role_menu` VALUES (3, 1038);
INSERT INTO `role_menu` VALUES (3, 1039);
INSERT INTO `role_menu` VALUES (3, 1040);
INSERT INTO `role_menu` VALUES (3, 1041);
INSERT INTO `role_menu` VALUES (3, 1042);
INSERT INTO `role_menu` VALUES (3, 1043);
INSERT INTO `role_menu` VALUES (3, 1044);
INSERT INTO `role_menu` VALUES (3, 1045);
INSERT INTO `role_menu` VALUES (3, 1046);
INSERT INTO `role_menu` VALUES (3, 1047);
INSERT INTO `role_menu` VALUES (3, 1048);
INSERT INTO `role_menu` VALUES (3, 1049);
INSERT INTO `role_menu` VALUES (3, 1050);
INSERT INTO `role_menu` VALUES (3, 1051);
INSERT INTO `role_menu` VALUES (3, 1052);
INSERT INTO `role_menu` VALUES (3, 1053);
INSERT INTO `role_menu` VALUES (3, 1054);
INSERT INTO `role_menu` VALUES (3, 1055);
INSERT INTO `role_menu` VALUES (3, 1056);
INSERT INTO `role_menu` VALUES (3, 1057);
INSERT INTO `role_menu` VALUES (3, 1058);
INSERT INTO `role_menu` VALUES (3, 1059);
INSERT INTO `role_menu` VALUES (3, 1060);
INSERT INTO `role_menu` VALUES (3, 2000);
INSERT INTO `role_menu` VALUES (11, 1);
INSERT INTO `role_menu` VALUES (11, 100);
INSERT INTO `role_menu` VALUES (11, 101);
INSERT INTO `role_menu` VALUES (11, 102);
INSERT INTO `role_menu` VALUES (11, 103);
INSERT INTO `role_menu` VALUES (11, 104);
INSERT INTO `role_menu` VALUES (11, 105);
INSERT INTO `role_menu` VALUES (11, 106);
INSERT INTO `role_menu` VALUES (11, 107);
INSERT INTO `role_menu` VALUES (11, 108);
INSERT INTO `role_menu` VALUES (11, 500);
INSERT INTO `role_menu` VALUES (11, 501);
INSERT INTO `role_menu` VALUES (11, 1001);
INSERT INTO `role_menu` VALUES (11, 1002);
INSERT INTO `role_menu` VALUES (11, 1003);
INSERT INTO `role_menu` VALUES (11, 1004);
INSERT INTO `role_menu` VALUES (11, 1005);
INSERT INTO `role_menu` VALUES (11, 1006);
INSERT INTO `role_menu` VALUES (11, 1007);
INSERT INTO `role_menu` VALUES (11, 1008);
INSERT INTO `role_menu` VALUES (11, 1009);
INSERT INTO `role_menu` VALUES (11, 1010);
INSERT INTO `role_menu` VALUES (11, 1011);
INSERT INTO `role_menu` VALUES (11, 1012);
INSERT INTO `role_menu` VALUES (11, 1013);
INSERT INTO `role_menu` VALUES (11, 1014);
INSERT INTO `role_menu` VALUES (11, 1015);
INSERT INTO `role_menu` VALUES (11, 1016);
INSERT INTO `role_menu` VALUES (11, 1017);
INSERT INTO `role_menu` VALUES (11, 1018);
INSERT INTO `role_menu` VALUES (11, 1019);
INSERT INTO `role_menu` VALUES (11, 1020);
INSERT INTO `role_menu` VALUES (11, 1021);
INSERT INTO `role_menu` VALUES (11, 1022);
INSERT INTO `role_menu` VALUES (11, 1023);
INSERT INTO `role_menu` VALUES (11, 1024);
INSERT INTO `role_menu` VALUES (11, 1025);
INSERT INTO `role_menu` VALUES (11, 1026);
INSERT INTO `role_menu` VALUES (11, 1027);
INSERT INTO `role_menu` VALUES (11, 1028);
INSERT INTO `role_menu` VALUES (11, 1029);
INSERT INTO `role_menu` VALUES (11, 1030);
INSERT INTO `role_menu` VALUES (11, 1031);
INSERT INTO `role_menu` VALUES (11, 1032);
INSERT INTO `role_menu` VALUES (11, 1033);
INSERT INTO `role_menu` VALUES (11, 1034);
INSERT INTO `role_menu` VALUES (11, 1035);
INSERT INTO `role_menu` VALUES (11, 1036);
INSERT INTO `role_menu` VALUES (11, 1037);
INSERT INTO `role_menu` VALUES (11, 1038);
INSERT INTO `role_menu` VALUES (11, 1039);
INSERT INTO `role_menu` VALUES (11, 1040);
INSERT INTO `role_menu` VALUES (11, 1041);
INSERT INTO `role_menu` VALUES (11, 1042);
INSERT INTO `role_menu` VALUES (11, 1043);
INSERT INTO `role_menu` VALUES (11, 1044);
INSERT INTO `role_menu` VALUES (11, 1045);
INSERT INTO `role_menu` VALUES (11, 2000);
INSERT INTO `role_menu` VALUES (11, 2003);
INSERT INTO `role_menu` VALUES (11, 2004);
INSERT INTO `role_menu` VALUES (11, 2005);
INSERT INTO `role_menu` VALUES (11, 2006);
INSERT INTO `role_menu` VALUES (11, 2007);
INSERT INTO `role_menu` VALUES (11, 2008);
INSERT INTO `role_menu` VALUES (11, 2009);
INSERT INTO `role_menu` VALUES (11, 2010);
INSERT INTO `role_menu` VALUES (11, 2011);
INSERT INTO `role_menu` VALUES (11, 2012);
INSERT INTO `role_menu` VALUES (11, 2013);
INSERT INTO `role_menu` VALUES (11, 2014);
INSERT INTO `role_menu` VALUES (12, 2017);
INSERT INTO `role_menu` VALUES (12, 2022);
INSERT INTO `role_menu` VALUES (12, 2024);
INSERT INTO `role_menu` VALUES (12, 2025);
INSERT INTO `role_menu` VALUES (12, 2026);
INSERT INTO `role_menu` VALUES (12, 2027);
INSERT INTO `role_menu` VALUES (18, 1);
INSERT INTO `role_menu` VALUES (18, 100);
INSERT INTO `role_menu` VALUES (18, 101);
INSERT INTO `role_menu` VALUES (18, 102);
INSERT INTO `role_menu` VALUES (18, 2017);
INSERT INTO `role_menu` VALUES (18, 2018);
INSERT INTO `role_menu` VALUES (18, 2019);
INSERT INTO `role_menu` VALUES (18, 2021);
INSERT INTO `role_menu` VALUES (18, 2022);
INSERT INTO `role_menu` VALUES (19, 1);
INSERT INTO `role_menu` VALUES (19, 100);
INSERT INTO `role_menu` VALUES (19, 101);
INSERT INTO `role_menu` VALUES (19, 102);
INSERT INTO `role_menu` VALUES (21, 1);
INSERT INTO `role_menu` VALUES (21, 100);
INSERT INTO `role_menu` VALUES (21, 2017);
INSERT INTO `role_menu` VALUES (21, 2018);
INSERT INTO `role_menu` VALUES (21, 2019);
INSERT INTO `role_menu` VALUES (21, 2021);
INSERT INTO `role_menu` VALUES (21, 2022);
INSERT INTO `role_menu` VALUES (21, 2023);
INSERT INTO `role_menu` VALUES (21, 2042);
INSERT INTO `role_menu` VALUES (21, 2043);
INSERT INTO `role_menu` VALUES (21, 2044);
INSERT INTO `role_menu` VALUES (21, 2045);
INSERT INTO `role_menu` VALUES (21, 2046);
INSERT INTO `role_menu` VALUES (21, 2049);
INSERT INTO `role_menu` VALUES (22, 1);
INSERT INTO `role_menu` VALUES (22, 101);
INSERT INTO `role_menu` VALUES (22, 2023);
INSERT INTO `role_menu` VALUES (22, 2042);
INSERT INTO `role_menu` VALUES (22, 2043);
INSERT INTO `role_menu` VALUES (22, 2044);
INSERT INTO `role_menu` VALUES (22, 2045);
INSERT INTO `role_menu` VALUES (22, 2046);
INSERT INTO `role_menu` VALUES (22, 2049);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工号 / 学号',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NULL' COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NULL' COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'http://101.35.169.211:8998/files/663057c8a84d449fa3b3b59ffee33f28' COMMENT '头像',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户性别（0男，1女，2未知）',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户类型：0代表普通用户，1代表管理员',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人的用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  `remaining_times` int(11) NULL DEFAULT 6 COMMENT '剩余借阅次数',
  `max_borrow_times` int(11) NULL DEFAULT 6 COMMENT '最大借阅次数 默认为6',
  `current_borrow_times` int(11) NULL DEFAULT 0 COMMENT '当前借阅数',
  `total_borrow_times` int(11) NULL DEFAULT 0 COMMENT '总借阅数',
  `overdue_borrow_times` int(11) NULL DEFAULT 0 COMMENT '总逾期数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '3123358142', 'wangkang1', '$2a$10$HuMkowYU.rJ/NomdTRg2LugnQ2OZfB3/gLQXfdvpklh/KwAWxSHDa', 'http://101.35.169.211:8998/files/c5a5280bcf5f4ea2be5250b95104eafb', '男', 12, '1', '13082838117', '1686617586@qq.com', 'hahahh', '0', 0, '2023-10-23 10:06:06', 23, '2023-12-02 16:46:23', 0, 0, 0, 0, 0, 0);
INSERT INTO `user` VALUES (2, '3123358143', 'wangkang2', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', 'http://101.35.169.211:8998/files/c4bfe8d8654746618b8f44f439f8ebec', '女', 18, '1', '13312312312', '1686617586@qq.com', '123123', '0', 0, '2023-10-23 10:07:41', 23, '2023-12-02 16:46:28', 0, 3, 0, 0, 0, 0);
INSERT INTO `user` VALUES (3, '3123358144', 'wangkang3', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', 'http://101.35.169.211:8998/files/1981b9fb0f624b1fa35debe65872b0a5', '男', 20, '1', '13478687527', '13@qq.com', 'a', '1', NULL, NULL, 23, '2023-12-02 16:41:34', 0, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (4, '3123358145', 'wangkang5', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', 'http://101.35.169.211:8998/files/60aa3ef97ca144b38333431bac8ff303', '女', 86, '0', '18674378636', '123213@qq.com', '12312323', '0', NULL, NULL, 23, '2023-12-02 16:41:59', 0, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (5, '3123358146', 'wangkang6', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', 'http://101.35.169.211:8998/files/69b8cac6cecf48cfa8f5e4ae8d76fa98', '男', 76, '0', '15376876836', '13312@qq.com', 'b', '1', NULL, NULL, 23, '2023-12-02 16:43:13', 0, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (9, '3123358141', '为空23123', '$2a$10$oLQ9TzLfyybytkDAtshmWOb4epG0f41oKTDWu.quvN/BGSvutu8GG', 'http://101.35.169.211:8998/files/736ce347f4f94ce78d93b875d69a9415', '男', 31, '0', '13257590005', '1312e143@qq.com', 'd', '0', NULL, NULL, 23, '2023-12-02 16:44:58', 0, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (10, '1234567011', 'wk1234511', '$2a$10$hTZ4AxjOsSIF/WRBK/ZdLelcHdubmjLr.ylelWKBpTZq7nc3jrpqy', 'http://101.35.169.211:8998/files/430b120ffb5846a68bc5033877bb7aaa', '女', 33, '0', '15076335747', 'fware3@qq.com', 'egewr', '0', 1, '2023-11-22 17:10:12', 23, '2023-12-02 16:45:08', 0, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (11, '1234560111', 'wk12345111', '$2a$10$fqD3dUfkk8xssom3OrG7I.8f.AI5FyJAlgUc49ON8E3WjWElydYRC', 'http://101.35.169.211:8998/files/01839b67a33b41859feebcc67187f18e', '男', 36, '0', '18078085723', '13yg5fe@qq.com', 'ed', '0', 1, '2023-11-22 17:12:28', 23, '2023-12-02 16:45:19', 0, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (12, '1234560121', 'wk12345121', '$2a$10$Ef/ADy1iLZnyRhuM9WD9Zu7755Aj.wQsEWpSdZgy8yDsuC1pVNJLC', 'http://101.35.169.211:8998/files/7405bc3ed91b48239048300dbf948e0c', '女', 25, '1', '18385720027', 'wgfefwe@qq.com', 'e', '0', 1, '2023-11-22 17:15:08', 1, '2023-11-23 14:48:01', 1, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (13, '1234567898', 'wk12345124', '$2a$10$dWWpxS8ExTKNwAVziJRH9eN87DV18sI.GGfDw3/ZA5Mpa0wiCbPoy', 'http://101.35.169.211:8998/files/7405bc3ed91b48239048300dbf948e0c', '女', 14, '1', '13247006877', 'fwewffew@qq.com', 'e', '0', 1, '2023-11-22 17:19:30', 1, '2023-11-30 16:47:47', 1, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (14, '1232131111', '123', '$2a$10$JXGuAsA1H2WiLSPqGAX2vewRsFRTf.LLtturbPvm/uuL7zl4k1Ory', 'http://101.35.169.211:8998/files/7405bc3ed91b48239048300dbf948e0c', '男', 65, '1', '13570658527', '1svd3@qq.com', '123', '0', 1, '2023-11-23 17:04:30', 1, '2023-11-30 16:47:50', 1, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (15, '1111111111', '321', '$2a$10$TU6dNHHImI7fF2twAz3T.uOnQpbeaxPmSccRHg02rUaJelllOZj6e', 'http://101.35.169.211:8998/files/7405bc3ed91b48239048300dbf948e0c', '男', 43, '1', '13212375288', '3eefef@qq.com', '123ew', '0', 1, '2023-11-23 17:05:54', 1, '2023-11-30 16:47:51', 1, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (16, '1231231111', '1231', '$2a$10$Gtd4J0Oar2ppHuT7RRz6veaDi5QM9t9jFG/PbKjMcEFKyIJ5KTx0G', 'http://101.35.169.211:8998/files/7405bc3ed91b48239048300dbf948e0c', '男', 33, '1', '15300857685', 'r3f13@qq.com', 'egr', '1', 1, '2023-11-23 17:06:41', 1, '2023-11-30 16:47:52', 1, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (17, '3123358177', 'kangwang', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', 'http://101.35.169.211:8998/files/7405bc3ed91b48239048300dbf948e0c', '女', 47, '0', '13087527874', '32113@qq.com', 'rr', '0', -1, '2023-11-28 13:20:20', 1, '2023-11-30 16:47:55', 1, 6, 0, 0, 0, 0);
INSERT INTO `user` VALUES (18, '3123358177', 'kangwang1', '$2a$10$ZI8eLzO.PqtI337Nb6OFCeFQzaqsaZ2ee0UD1EBdg0T9BtHPxCLpa', 'http://101.35.169.211:8998/files/7405bc3ed91b48239048300dbf948e0c', '男', 43, '0', '18372002078', '3212313@qq.com', 'gr', '0', -1, '2023-11-28 13:23:03', 1, '2023-11-30 16:47:56', 1, 5, 0, 0, 0, 0);
INSERT INTO `user` VALUES (19, '3123358188', 'kagnwang', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', 'http://101.35.169.211:8998/files/7405bc3ed91b48239048300dbf948e0c', '女', 76, '0', '15870327528', '123das13@qq.com', 'ffe', '0', -1, '2023-11-28 13:24:11', 1, '2023-11-30 16:47:57', 1, 7, 0, 0, 0, 0);
INSERT INTO `user` VALUES (20, '3123358111', '123123', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', 'http://101.35.169.211:8998/files/7405bc3ed91b48239048300dbf948e0c', '女', 44, '0', '15352002505', '123413@qq.com', 'egr', '0', -1, '2023-11-28 13:25:01', 1, '2023-11-30 16:48:01', 1, 5, 0, 0, 0, 0);
INSERT INTO `user` VALUES (21, '1234561233', '嗡嗡嗡嗡嗡嗡', '$2a$10$bBBp9B75hQyd2FmIH6pn6eShv4LfFcgUgpOvwYwd9KMlotkparU7m', 'http://101.35.169.211:8998/files/663057c8a84d449fa3b3b59ffee33f28', '男', 25, '0', '13502054544', '12313@qq.com', 'r', '0', -1, '2023-11-29 18:43:38', 1, '2023-11-30 16:48:03', 1, 6, 6, 0, 0, 0);
INSERT INTO `user` VALUES (22, '1231231230', '1111', '$2a$10$Grj.nCc6AEqFMQhUOQuCsesdxb3OQ7rpeIaCraX8bAc/PWqRg/TMe', 'http://101.35.169.211:8998/files/9bd9dbecec4b490f8d99a2ce6f341f8c', '女', 24, '0', '18767682454', '13r43gy513@qq.com', 'r', '0', -1, '2023-11-29 20:11:49', 23, '2023-12-02 16:47:20', 0, 4, 6, 0, 0, 0);
INSERT INTO `user` VALUES (23, '1234567890', 'admin', '$2a$10$cU0vtCo3xieACzpkiVodc.ysXKHZwgVlZkJd8OEMWkaGFPvpGVW5K', 'http://101.35.169.211:8998/files/06ddd177da434820b41423bb9299e02d', '男', 25, '1', '18723078527', 'hnil13@qq.com', 'erg', '0', 1, '2023-11-30 16:49:07', 1, '2023-11-30 16:49:07', 0, 6, 6, 0, 0, 0);
INSERT INTO `user` VALUES (24, '0987654321', 'user', '$2a$10$Y76yPi9tEQJSD4xsLeDQJe7ZrCcax7s7ppKlLgvENtTPLa3UXQppK', 'http://101.35.169.211:8998/files/37b70d7ce8494258bd6404bda98580dd', '男', 14, '0', '16782320788', 'ji13@qq.com', 'er', '0', 23, '2023-11-30 16:52:12', 23, '2023-12-02 16:47:30', 0, 6, 6, 0, 0, 0);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (2, 12);
INSERT INTO `user_role` VALUES (5, 2);
INSERT INTO `user_role` VALUES (6, 12);

SET FOREIGN_KEY_CHECKS = 1;
