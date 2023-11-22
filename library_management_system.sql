/*
 Navicat Premium Data Transfer

 Source Server         : mysql本地
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : library_management_system

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 03/11/2023 22:15:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `translator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `inventory` int NULL DEFAULT 0,
  `publisher_id` bigint NULL DEFAULT NULL,
  `publish_time` datetime NULL DEFAULT NULL,
  `create_by` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '胡萝卜的种子', 20.51, '美）露丝.克劳斯', NULL, '儿童成长绘本', 'http://101.34.209.49:9090/files/f0206462de0d4e02b84acbfe42b82520', '9787559622983', 5322, NULL, NULL, NULL, '2018-10-01 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (2, '想象力', 44.00, '诺曼·梅辛杰', NULL, '儿童成长绘本', 'http://101.34.209.49:9090/files/597d3763ad9049a78e25e2fba15a87fe', '9787544846240', 3409, NULL, NULL, NULL, '2016-06-23 00:00:00', 9, '2023-10-29 20:03:27', '0');
INSERT INTO `book` VALUES (3, '一个人的朝圣', 16.40, '蕾秋·乔伊斯', NULL, '文学', 'http://101.34.209.49:9090/files/3cb20475c1e74feeaae2b5a66939ce3c', '9787550213524', 341, NULL, NULL, NULL, '2013-09-01 00:00:00', 2, '2023-10-29 16:53:19', '0');
INSERT INTO `book` VALUES (4, '追风筝的人', 29.00, '卡勒德.胡赛尼', NULL, '文学', 'http://101.34.209.49:9090/files/581882a040d34c368f61de4e6515ef15', '9787208061644', 423, NULL, NULL, NULL, '2003-02-06 00:00:00', 2, '2023-10-29 16:55:06', '0');
INSERT INTO `book` VALUES (5, '一见你就好心情', 49.00, '莉兹克里莫', NULL, '漫画', 'http://101.34.209.49:9090/files/8e8be36da8fb4446be024c0f80b29082', ' 9787201146591', 3462, NULL, NULL, NULL, '2019-05-10 00:00:00', 9, '2023-10-29 19:56:02', '0');
INSERT INTO `book` VALUES (6, '非平面', 60.00, '尼克·索萨尼斯', NULL, '漫画', 'http://101.34.209.49:9090/files/e8e85d893d264fddbae4ed5944602d97', '9787559619433', 7854, NULL, NULL, NULL, '2018-11-27 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (7, '饺子和汤圆', 36.00, '卷儿', NULL, '儿童成长绘本', 'http://101.34.209.49:9090/files/7ffd3f00a2eb4ae482f25876d48c0704', '9787505634503', 12431, NULL, NULL, NULL, '2017-12-13 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (8, '一穴一方对症按摩I', 42.00, '无', NULL, '中医养生', 'http://101.34.209.49:9090/files/afde048706524855a5b9181818a90d4c', '9787571317485', 24114, NULL, NULL, NULL, '2021-07-14 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (9, '人间失格', 30.00, '太宰治', NULL, '当代小说', 'http://101.34.209.49:9090/files/f41ce4ba2bdb4b8590f34cb6a62677ff', '9787502062347', 32532, NULL, NULL, NULL, '2016-10-18 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (10, '莫泊桑短篇小说选', 47.00, ' (法)莫泊桑', NULL, '短篇小说', 'http://101.34.209.49:9090/files/8e2df159ba2e49759a15b487eb72f986', ' 9787560573854', 43325, NULL, NULL, NULL, '2009-08-01 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (11, '月亮与六便士 (精装)', 39.80, '威廉· 萨默赛特·毛姆', NULL, '长篇小说', 'http://101.34.209.49:9090/files/a4292ce90cf84bbeab183a8cbd9c1a8c', ' 9787541495137', 32543, NULL, NULL, NULL, '1919-07-17 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (12, '战争与和平(上下)', 138.00, '〔俄〕列夫·托尔斯泰 ', NULL, '文学', 'http://101.34.209.49:9090/files/e3ade913a8454251a6f98f5b4478cfa2', '9787538761016', 6678, NULL, NULL, NULL, '2019-11-14 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (13, '全球通史（上下）', 42.00, '[美] 斯塔夫里阿诺斯', NULL, '历史', 'http://101.34.209.49:9090/files/29f0417de61a4d8585fb0548d3c5c57e', '9787301109489', 65768, NULL, NULL, NULL, '2006-10-11 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (14, '左宗棠全传', 68.00, '秦翰才', NULL, '历史', 'http://101.34.209.49:9090/files/8b89fb0535354176a4b72eb5a3e476b3', '9787101115079', 12243, NULL, NULL, NULL, '2016-06-21 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (15, '上帝掷骰子吗?：量子物理史话', 45.00, ' 曹天元', NULL, '自然科学', 'http://101.34.209.49:9090/files/ce851c7a69a04337881720b503ed5107', '9787550217454', 65768, NULL, NULL, NULL, '2013-09-11 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (16, '傅立叶分析导论', 59.00, 'Elias , Rami Shakarchi ', NULL, '自然科学', 'http://101.34.209.49:9090/files/005af4fdf25446dba9d9fa0a7d50aaed', '9787510040559', 24325, NULL, NULL, NULL, '2012-12-18 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (17, '孙子兵法', 20.00, '[春秋] 孙武', NULL, '军事', 'http://101.34.209.49:9090/files/f49a181cee2e481abbb0b62dd7a8e24b', '9787532544400', 3467, NULL, NULL, NULL, '2006-07-21 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (18, '雪白血红：一名德军士兵的苏德战争回忆录', 89.80, '[德] 京特·K．科朔雷克', NULL, '军事', 'http://101.34.209.49:9090/files/639b4912b419438a8f3f4170f264f790', '9787516819104', 7996, NULL, NULL, NULL, '2018-06-25 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (19, '西洋镜：一个英国风光摄影大师镜头下的中国', 168.00, '[英] 唐纳德·曼尼', NULL, '地理', 'http://101.34.209.49:9090/files/2216f46bb5b74e5f9150fe888af8309e', '9787218124735', 323, NULL, NULL, NULL, '2018-04-13 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (20, '徐霞客游记全译', 185.00, '[明] 徐弘祖', NULL, '地理', 'http://101.34.209.49:9090/files/737f05af477f405394ab381cad07ec70', '9787221082121', 13, NULL, NULL, NULL, '2008-02-20 00:00:00', NULL, NULL, '0');
INSERT INTO `book` VALUES (21, 'WANGKANG', NULL, NULL, NULL, NULL, NULL, '1234567890', 0, NULL, NULL, NULL, NULL, 1, '2023-10-25 15:32:20', '0');
INSERT INTO `book` VALUES (22, 'wangkang', NULL, NULL, NULL, NULL, NULL, '1234567890', 0, NULL, NULL, -1, '2023-10-25 15:28:13', -1, '2023-10-25 15:28:13', '0');
INSERT INTO `book` VALUES (23, 'wangkang', NULL, NULL, NULL, NULL, NULL, '1234567890', 0, NULL, NULL, 1, '2023-10-25 15:31:16', 1, '2023-10-25 15:31:16', '0');
INSERT INTO `book` VALUES (24, 'wangkang', NULL, NULL, NULL, NULL, NULL, '1234567890', 0, NULL, NULL, 3, '2023-10-25 15:31:46', 9, '2023-10-29 20:30:30', '0');
INSERT INTO `book` VALUES (25, 'wangkang', NULL, NULL, NULL, NULL, NULL, '1234567890', 0, NULL, NULL, 1, '2023-10-25 15:31:59', 1, '2023-10-25 15:31:59', '0');

-- ----------------------------
-- Table structure for book_mark
-- ----------------------------
DROP TABLE IF EXISTS `book_mark`;
CREATE TABLE `book_mark`  (
  `user_id` bigint NOT NULL,
  `book_id` bigint NOT NULL,
  `score` int NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_mark
-- ----------------------------

-- ----------------------------
-- Table structure for borrow_history
-- ----------------------------
DROP TABLE IF EXISTS `borrow_history`;
CREATE TABLE `borrow_history`  (
  `user_id` bigint NOT NULL,
  `book_id` bigint NOT NULL,
  `reservation_time` datetime NULL DEFAULT NULL,
  `reservation_to_time` datetime NULL DEFAULT NULL COMMENT '预约过期时间（最长预约一周的时间，一周后就不能在预约了）',
  `borrow_date` datetime NULL DEFAULT NULL,
  `return_date` datetime NULL DEFAULT NULL,
  `borrow_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '借阅状态 0已借出 / 1已归还 / 2过期未还 / 3已预约',
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE,
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow_history
-- ----------------------------
INSERT INTO `borrow_history` VALUES (1, 1, '2023-10-25 17:10:07', NULL, '2023-10-25 17:10:12', '2023-10-25 17:10:16', '0');
INSERT INTO `borrow_history` VALUES (1, 2, NULL, NULL, '2023-10-29 11:20:33', NULL, '0');
INSERT INTO `borrow_history` VALUES (2, 2, NULL, NULL, '2023-10-29 15:44:42', NULL, '1');
INSERT INTO `borrow_history` VALUES (2, 3, NULL, NULL, '2023-10-29 16:48:16', NULL, '1');
INSERT INTO `borrow_history` VALUES (2, 4, NULL, NULL, '2023-10-29 16:48:39', NULL, '3');
INSERT INTO `borrow_history` VALUES (2, 25, '2023-10-29 19:28:18', NULL, NULL, NULL, '3');
INSERT INTO `borrow_history` VALUES (5, 25, '2023-10-29 19:51:51', NULL, NULL, NULL, '3');
INSERT INTO `borrow_history` VALUES (9, 5, NULL, NULL, '2023-10-29 19:56:02', NULL, '0');
INSERT INTO `borrow_history` VALUES (9, 2, NULL, NULL, '2023-10-29 20:03:27', NULL, '0');
INSERT INTO `borrow_history` VALUES (9, 24, '2023-10-29 20:06:09', '2023-11-05 20:06:09', '2023-10-29 20:29:29', NULL, '1');
INSERT INTO `borrow_history` VALUES (9, 24, '2023-10-29 20:20:41', '2023-11-05 20:20:41', '2023-10-29 20:30:30', NULL, '0');
INSERT INTO `borrow_history` VALUES (9, 24, '2023-11-02 10:01:50', '2023-11-09 10:01:50', NULL, NULL, '3');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 'admin', 1, '0', '0', 0, '2021-11-12 10:46:19', 0, NULL, '超级管理员');
INSERT INTO `role` VALUES (2, '普通角色', 'common', 2, '0', '0', 0, '2021-11-12 10:46:19', 0, '2022-01-01 22:32:58', '普通角色');
INSERT INTO `role` VALUES (11, '嘎嘎嘎', 'aggag', 5, '0', '0', NULL, '2022-01-06 14:07:40', NULL, '2022-01-07 03:48:48', '嘎嘎嘎');
INSERT INTO `role` VALUES (12, '友链审核员', 'link', 1, '0', '0', NULL, '2022-01-16 06:49:30', NULL, '2022-01-16 08:05:09', NULL);
INSERT INTO `role` VALUES (13, 'admin22222', '奥多姆', 1000, '0', '0', NULL, NULL, NULL, NULL, '钱钱钱钱钱钱钱钱钱钱钱');
INSERT INTO `role` VALUES (14, 'admin22222', '奥多姆111', 1000, '0', '0', NULL, NULL, NULL, NULL, '钱钱钱钱钱钱钱钱钱钱钱');
INSERT INTO `role` VALUES (15, 'admin22222', '奥多姆3333', 1000, '0', '0', NULL, NULL, NULL, NULL, '钱钱钱钱钱钱钱钱钱钱钱');
INSERT INTO `role` VALUES (16, 'admin22222', '奥多姆666', 1000, '0', '0', NULL, NULL, NULL, NULL, '钱钱钱钱钱钱钱钱钱钱钱');
INSERT INTO `role` VALUES (17, 'admin22222', '奥多姆7777', 1000, '0', '0', NULL, NULL, NULL, NULL, '钱钱钱钱钱钱钱钱钱钱钱');
INSERT INTO `role` VALUES (18, 'admin22222', '奥多姆8888', 1000, '0', '0', NULL, NULL, NULL, NULL, '钱钱钱钱钱钱钱钱钱钱钱');
INSERT INTO `role` VALUES (19, '123', '123', 2, '0', '0', NULL, NULL, NULL, NULL, '2222222222');
INSERT INTO `role` VALUES (20, '22222', '33333', 1, '0', '0', NULL, NULL, NULL, NULL, '333333333333');
INSERT INTO `role` VALUES (21, '水水水水22222222', '三生三世十里桃花', 7, '0', '0', NULL, NULL, NULL, NULL, '11111111111');
INSERT INTO `role` VALUES (22, '强强强强QQ', '哇哇哇哇哇哇哇', 3, '0', '0', 1, '2023-09-29 10:18:07', 1, '2023-09-29 10:18:40', '嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工号 / 学号',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NULL' COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NULL' COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户性别（0男，1女，2未知）',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户类型：0代表普通用户，1代表管理员',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人的用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  `remaining_times` int NULL DEFAULT 6 COMMENT '剩余借阅次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '3123358142', 'wangkang1', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', NULL, NULL, '1', NULL, NULL, NULL, '0', 0, '2023-10-23 10:06:06', 2, '2023-10-29 15:31:49', 0, 0);
INSERT INTO `user` VALUES (2, '3123358143', 'wangkang2', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', NULL, NULL, '0', NULL, NULL, NULL, '0', 0, '2023-10-23 10:07:41', 2, '2023-10-29 16:55:06', 0, 3);
INSERT INTO `user` VALUES (3, '3123358144', 'wangkang3', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', NULL, NULL, '1', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 0, 6);
INSERT INTO `user` VALUES (4, '3123358145', 'wangkang5', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', NULL, NULL, '1', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 0, 6);
INSERT INTO `user` VALUES (5, '3123358146', 'wangkang6', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 0, 6);
INSERT INTO `user` VALUES (7, '1234567890123', 'wk12345123', '$2a$10$V0kGA9ZNFF7OLtUXeH94j.p5CEWuAFdP2IamFRXmAX9hupIuhBJ9e', NULL, NULL, '1', NULL, NULL, NULL, '0', 1, '2023-10-25 16:33:18', 3, '2023-10-25 16:59:18', 0, 6);
INSERT INTO `user` VALUES (8, '12345678901', 'wk123451', '$2a$10$oLQ9TzLfyybytkDAtshmWOb4epG0f41oKTDWu.quvN/BGSvutu8GG', NULL, NULL, '1', NULL, NULL, NULL, '0', 1, '2023-10-25 16:37:22', 3, '2023-10-25 16:45:04', 0, 6);
INSERT INTO `user` VALUES (9, '31233581410', '为空23123', '$2a$10$oLQ9TzLfyybytkDAtshmWOb4epG0f41oKTDWu.quvN/BGSvutu8GG', NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, 9, '2023-10-29 20:30:30', 0, 6);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
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
