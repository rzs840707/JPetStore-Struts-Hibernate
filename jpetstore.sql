/*
Navicat MySQL Data Transfer

Source Server         : MySql连接
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : jpetstore

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-04-13 23:41:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `catid` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `descn` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Fish', 'Saultwater,Freshwater');
INSERT INTO `category` VALUES ('2', 'Dogs', 'Various Breeds ');
INSERT INTO `category` VALUES ('3', 'Cats', 'Various Breeds, Exotic Varieties ');
INSERT INTO `category` VALUES ('4', 'Reptiles', 'Lizards, Turtles, Snakes ');
INSERT INTO `category` VALUES ('5', 'Birds', 'Exotic Varieties');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `itemid` varchar(20) NOT NULL,
  `productid` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `descn` varchar(255) NOT NULL,
  `listprice` double(10,2) NOT NULL,
  `image` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('EST-4', 'FI-FW-01', 'Spotted Koi', 'Fresh Water fish from Japan', '18.50', 'EST-4.jpg');
INSERT INTO `item` VALUES ('EST-5', 'FI-FW-01', 'Spotless Koi', 'Fresh Water fish from Japan', '18.50', 'EST-5.jpg');
INSERT INTO `item` VALUES ('EST-20', 'FI-FW-02', 'Adult Male Goldfish', 'Fresh Water fish from China', '5.50', 'EST-20.jpg');
INSERT INTO `item` VALUES ('EST-21', 'FI-FW-02', 'Adult Female Goldfish', 'Fresh Water fish from China', '5.29', 'EST-21.jpg');
INSERT INTO `item` VALUES ('EST-1', 'FI-SW-01', 'Large Angelfish', 'Salt Water fish from Australia', '16.50', 'EST-1.jpg');
INSERT INTO `item` VALUES ('EST-2', 'FI-SW-01', 'Small Angelfish', 'Salt Water fish from Australia', '16.50', 'EST-2.jpg');
INSERT INTO `item` VALUES ('EST-3', 'FI-SW-02', 'Toothless Tiger Shark', 'Salt Water fish from Australia', '18.50', 'EST-3.jpg');
INSERT INTO `item` VALUES ('EST-6', 'K9-BD-01', 'Male Adult Bulldog', 'Friendly dog from England', '18.50', 'EST-6.jpg');
INSERT INTO `item` VALUES ('EST-7', 'K9-BD-01', 'Female Puppy Bulldog', 'Friendly dog from England', '18.50', 'EST-7.jpg');
INSERT INTO `item` VALUES ('EST-26', 'K9-CW-01', 'Adult Male Chihuahua', 'Great companion dog', '125.50', 'EST-26.jpg');
INSERT INTO `item` VALUES ('EST-27', 'K9-CW-01', 'Adult Female Chihuahua', 'Great companion dog', '155.29', 'EST-27.jpg');
INSERT INTO `item` VALUES ('EST-10', 'K9-DL-01', 'Spotted Adult Female Dalmation', 'Great dog for a Fire Station', '18.50', 'EST-10.jpg');
INSERT INTO `item` VALUES ('EST-9', 'K9-DL-01', 'Spotless Male Puppy Dalmation', 'Great dog for a Fire Station', '18.50', 'EST-9.png');
INSERT INTO `item` VALUES ('EST-8', 'K9-PO-02', 'Male Puppy Poodle', 'Cute dog from France', '18.50', 'EST-8.png');
INSERT INTO `item` VALUES ('EST-28', 'K9-RT-01', 'Adult Female Golden Retriever', 'Great family dog', '155.29', 'EST-28.jpg');
INSERT INTO `item` VALUES ('EST-22', 'K9-RT-02', 'Adult Male Labrador Retriever', 'Great hunting dog', '135.50', 'EST-22.jpg');
INSERT INTO `item` VALUES ('EST-23', 'K9-RT-02', 'Adult Female Labrador Retriever', 'Great hunting dog', '145.49', 'EST-23.jpg');
INSERT INTO `item` VALUES ('EST-24', 'K9-RT-02', 'Adult Male Labrador Retriever', 'Great hunting dog', '255.50', 'EST-24.jpg');
INSERT INTO `item` VALUES ('EST-25', 'K9-RT-02', 'Adult Female Labrador Retriever', 'Great hunting dog', '325.29', 'EST-25.jpg');
INSERT INTO `item` VALUES ('EST-16', 'FL-DLH-02', 'Adult Female Persian', 'Friendly house cat, doubles as a princess', '93.50', 'EST-16.jpg');
INSERT INTO `item` VALUES ('EST-17', 'FL-DLH-02', 'Adult Male Persian', 'Friendly house cat, doubles as a princess', '93.50', 'EST-17.jpg');
INSERT INTO `item` VALUES ('EST-14', 'FL-DSH-01', 'Tailless Manx', 'Great for reducing mouse populations', '58.50', 'EST-14.jpg');
INSERT INTO `item` VALUES ('EST-15', 'FL-DSH-01', 'With tail Manx', 'Great for reducing mouse populations', '23.50', 'EST-15.jpg');
INSERT INTO `item` VALUES ('EST-13', 'RP-LI-02', 'Green Adult  Iguana', 'Friendly green friend', '18.50', 'EST-13.jpg');
INSERT INTO `item` VALUES ('EST-12', 'RP-SN-01', 'Rattleless  Rattlesnake', 'Doubles as a watch dog', '18.50', 'EST-12.jpg');
INSERT INTO `item` VALUES ('EST-11', 'RP-SN-01', 'Venomless  Rattlesnake', 'Doubles as a watch dog', '18.50', 'EST-11.jpg');
INSERT INTO `item` VALUES ('EST-18', 'AV-CB-01', 'Adult Male  \nAmazon Parrot', 'Great companion for up to 75 years', '193.50', 'EST-18.jpg');
INSERT INTO `item` VALUES ('EST-19', 'AV-SB-02', 'Adult Male  Finch', 'Great stress reliever', '15.50', 'EST-19.jpg');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `userid` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dowhat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('admin', '2016-04-11 19:56:28', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:19:48', '管理员登陆');
INSERT INTO `log` VALUES ('root', '2016-04-11 20:32:26', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-11 20:32:28', '搜索categorytid=4的product');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:34:13', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:37:51', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:38:52', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:40:36', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:41:32', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:43:29', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:45:45', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:47:05', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:47:24', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:49:58', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:52:46', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:55:45', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:56:44', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:57:07', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:59:30', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 20:59:59', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:03:27', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:04:25', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:10:04', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:10:38', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:11:03', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:11:46', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:12:11', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:14:44', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:16:15', '管理员登陆');
INSERT INTO `log` VALUES ('root', '2016-04-11 21:16:49', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-11 21:16:51', '搜索categorytid=3的product');
INSERT INTO `log` VALUES ('root', '2016-04-11 21:16:54', '搜索itemtid=EST-16的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-11 21:16:59', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-11 21:17:11', '搜索categorytid=3的product');
INSERT INTO `log` VALUES ('root', '2016-04-11 21:17:14', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-11 21:17:15', '搜索categorytid=1的product');
INSERT INTO `log` VALUES ('root', '2016-04-11 21:17:16', '搜索itemtid=EST-4的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-11 21:17:26', '搜索categorytid=3的product');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:33:57', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:42:02', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:44:59', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 21:46:28', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:28:39', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:29:45', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:32:19', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:32:30', '管理员登陆');
INSERT INTO `log` VALUES ('root', '2016-04-11 22:34:36', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-11 22:34:38', '查看购物车');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:37:04', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:38:56', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:39:17', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:39:27', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:39:28', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:40:18', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:41:07', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:41:30', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:41:42', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:43:20', '管理员登陆');
INSERT INTO `log` VALUES ('root', '2016-04-11 22:43:55', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-11 22:43:56', '搜索itemtid=EST-6的item的详细信息');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:45:02', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:45:13', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:46:22', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:47:18', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:56:08', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:56:34', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:56:55', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 22:58:30', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:01:32', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:04:01', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:06:42', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:06:59', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:09:38', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:09:41', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:10:18', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:10:37', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:11:20', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:11:40', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:12:08', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:15:24', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:15:53', '管理员登陆');
INSERT INTO `log` VALUES ('root', '2016-04-11 23:18:03', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-11 23:18:06', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-11 23:18:09', '搜索输入的内容=koi的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-11 23:18:09', '搜索输入的内容=koi的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-11 23:18:12', '搜索输入的内容=k的item的详细信息');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:18:18', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:19:19', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:20:14', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-11 23:21:09', '管理员登陆');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:13:54', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:14:36', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:24:23', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:24:44', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:25:01', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:29:31', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:29:39', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:29:43', '搜索categorytid=3的product');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:29:45', '搜索categorytid=4的product');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:29:47', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:29:49', '搜索categorytid=1的product');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:29:59', '查看购物车');
INSERT INTO `log` VALUES ('root', '2016-04-12 19:30:01', '搜索输入的内容=的item的详细信息');
INSERT INTO `log` VALUES ('admin', '2016-04-12 19:30:15', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-12 19:32:32', '管理员登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:34:23', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:34:25', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:34:28', '搜索categorytid=4的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:34:29', '搜索categorytid=3的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:34:30', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:34:31', '搜索categorytid=1的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:34:32', '搜索categorytid=3的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:34:33', '搜索categorytid=4的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:34:34', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:36:19', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:37:02', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:38:15', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:41:28', '搜索categorytid=3的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:41:38', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:41:41', '搜索itemtid=EST-27的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:41:47', '搜索itemtid=EST-26的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:43:00', '搜索itemtid=EST-26的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:43:21', '将itemid=EST-26数量=16总价=2008.0加入购物车');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:43:23', '查看购物车');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:46:43', '查看购物车');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:46:54', '查看购物车');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:47:28', '查看购物车');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:47:29', '查看购物车');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:47:30', '查看购物车');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:47:31', '查看购物车');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:48:57', '查看购物车');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:51:56', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:51:57', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:51:59', '搜索itemtid=EST-18的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:03', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:10', '搜索itemtid=EST-23的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:13', '搜索categorytid=3的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:15', '搜索categorytid=4的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:18', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:20', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:21', '搜索categorytid=1的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:24', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:34', '搜索categorytid=4的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:36', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:39', '搜索categorytid=3的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:41', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:44', '搜索categorytid=4的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:50', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:51', '搜索categorytid=3的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:52', '搜索categorytid=4的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:54', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:52:55', '搜索categorytid=1的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:57:48', '搜索categorytid=1的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:58:28', '搜索itemtid=EST-5的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:59:06', '搜索categorytid=1的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:59:09', '搜索categorytid=4的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:59:10', '搜索categorytid=4的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:59:11', '搜索categorytid=5的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 15:59:14', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:01:10', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:01:58', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:02:29', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:04:29', '搜索categorytid=2的product');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:04:30', '搜索itemtid=EST-6的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:05:55', '搜索itemtid=EST-6的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:06:26', '搜索itemtid=EST-6的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:06:28', '搜索输入的内容=的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:07:42', '搜索输入的内容=的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:07:55', '搜索输入的内容=Spotless Koi的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:08:00', '搜索输入的内容=Toothless Tiger Shark的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:08:08', '搜索输入的内容=With tail Manx的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:08:51', '搜索输入的内容=With tail Manx的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:09:33', '搜索输入的内容=With tail Manx的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:31:17', '搜索输入的内容=With tail Manx的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:31:52', '搜索输入的内容=With tail Manx的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:32:35', '搜索输入的内容=With tail Manx的item的详细信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:33:24', '搜索输入的内容=With tail Manx的item的详细信息');
INSERT INTO `log` VALUES ('admin', '2016-04-13 16:38:13', '管理员登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 16:40:06', '用户登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-13 16:40:39', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-13 16:41:32', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-13 16:42:20', '管理员登陆');
INSERT INTO `log` VALUES ('admin', '2016-04-13 16:47:04', '搜索输入的内容=的item的详细信息');
INSERT INTO `log` VALUES ('admin', '2016-04-13 16:47:05', '查看购物车');
INSERT INTO `log` VALUES ('admin', '2016-04-13 18:38:17', '管理员登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 18:38:35', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 19:10:11', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 19:10:27', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 19:11:16', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 19:11:19', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 19:12:01', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 19:12:07', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 19:12:36', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:23:21', '用户登陆');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:38:20', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:39:19', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:12', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:51', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:52', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:52', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:52', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:53', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:53', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:53', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:54', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:54', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:54', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:55', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:55', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:55', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:56', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:56', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:56', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:57', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:57', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:57', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:58', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:58', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:58', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:58', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:59', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:59', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:59', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:41:59', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:42:00', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:42:00', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:42:00', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:42:01', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:43:31', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:46:23', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 20:54:02', '修改个人信息');
INSERT INTO `log` VALUES ('root', '2016-04-13 21:56:12', '用户登陆');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ordersid` varchar(20) NOT NULL,
  `itemid` varchar(20) NOT NULL,
  `quatity` int(11) NOT NULL,
  `totalprice` double(10,2) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('root', 'EST-4', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-5', '9', '166.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-27', '10', '1552.90', '1');
INSERT INTO `orders` VALUES ('root', 'EST-27', '100', '15529.00', '1');
INSERT INTO `orders` VALUES ('root', 'EST-22', '10', '1355.00', '1');
INSERT INTO `orders` VALUES ('root', 'EST-22', '10', '1355.00', '1');
INSERT INTO `orders` VALUES ('root', 'EST-4', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-21', '1', '5.29', '1');
INSERT INTO `orders` VALUES ('root', 'EST-4', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-16', '10', '935.00', '1');
INSERT INTO `orders` VALUES ('root', 'EST-4', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-5', '9', '166.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-21', '1', '5.29', '1');
INSERT INTO `orders` VALUES ('root', 'EST-4', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-5', '9', '166.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-6', '20', '370.00', '1');
INSERT INTO `orders` VALUES ('root', 'EST-16', '10', '935.00', '1');
INSERT INTO `orders` VALUES ('root', 'EST-4', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-4', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-16', '1', '93.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-18', '1', '193.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-13', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-13', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-6', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-16', '1', '93.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-16', '1', '93.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-16', '1', '93.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-6', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-6', '1', '18.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-16', '1', '93.50', '1');
INSERT INTO `orders` VALUES ('root', 'EST-26', '600218', '75327359.00', '1');
INSERT INTO `orders` VALUES ('root', 'EST-19', '10', '155.00', '1');
INSERT INTO `orders` VALUES ('root', 'EST-18', '20', '3870.00', '1');
INSERT INTO `orders` VALUES ('root', 'EST-26', '600218', '75327359.00', '0');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` varchar(20) NOT NULL,
  `catid` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `descn` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('FI-FW-01', '1', 'Koi', '	Koi');
INSERT INTO `product` VALUES ('FI-FW-02', '1', 'Goldfish', 'Goldfish');
INSERT INTO `product` VALUES ('FI-SW-01', '1', 'Angelfish', 'Angelfish');
INSERT INTO `product` VALUES ('FI-SW-02', '1', 'Tiger Shark', 'Tiger Shark');
INSERT INTO `product` VALUES ('K9-BD-01', '2', 'Bulldog', 'Bulldog');
INSERT INTO `product` VALUES ('K9-CW-01', '2', 'Chihuahua', 'Chihuahua');
INSERT INTO `product` VALUES ('K9-DL-01', '2', 'Dalmation', 'Dalmation');
INSERT INTO `product` VALUES ('K9-PO-02', '2', 'Poodle', 'Poodle');
INSERT INTO `product` VALUES ('K9-RT-01', '2', 'Golden Retriever', '	Golden Retriever');
INSERT INTO `product` VALUES ('K9-RT-02', '2', 'Labrador Retriever', 'Labrador Retriever');
INSERT INTO `product` VALUES ('FL-DLH-02', '3', 'Persian', 'Persian');
INSERT INTO `product` VALUES ('FL-DSH-01', '3', 'Manx', 'Manx');
INSERT INTO `product` VALUES ('RP-LI-02', '4', 'Iguana', 'Iguana');
INSERT INTO `product` VALUES ('RP-SN-01', '4', 'Rattlesnake', 'Rattlesnake');
INSERT INTO `product` VALUES ('AV-CB-01', '5', 'Amazon Parrot', 'Amazon Parrot');
INSERT INTO `product` VALUES ('AV-SB-02', '5', 'Finch', 'Finch');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(80) NOT NULL,
  `zip` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('root', '1234567', '18932445033', 'machao623231@qq.com', 'ma', 'xiaolong', 'zhangjiahe', '430075');
INSERT INTO `user` VALUES ('admin', 'admin', '1', '1', '1', '1', '1', '1');
INSERT INTO `user` VALUES ('superBall', 'ball45', '13952417845', 'maxiaol@163.com', 'Horse', 'Dragon', 'Ten', '154210');
