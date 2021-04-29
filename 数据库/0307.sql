/*
SQLyog v10.2 
MySQL - 5.7.30-log : Database - bishe
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bishe` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bishe`;

/*Table structure for table `articles` */

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `articlesId` int(10) NOT NULL AUTO_INCREMENT COMMENT '稿件编号',
  `articlesTile` varchar(20) DEFAULT NULL COMMENT '稿件标题',
  `articlesAuthor` varchar(20) DEFAULT NULL COMMENT '稿件作者',
  `articlesDescribe` varchar(30) DEFAULT NULL COMMENT '稿件描述',
  `articlesType` varchar(10) DEFAULT NULL COMMENT '稿件类型，视频，文章',
  `articlesLabel` varchar(10) DEFAULT NULL COMMENT '稿件标签',
  `articlesBrowse` int(10) DEFAULT NULL COMMENT '稿件浏览量，热门榜',
  `articlesThumes` int(10) DEFAULT NULL COMMENT '稿件点赞量，点赞榜',
  `articlesTime` year(4) DEFAULT NULL COMMENT '稿件发布时间,最新动态',
  PRIMARY KEY (`articlesId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `articles` */

/*Table structure for table `hanfuactivity` */

DROP TABLE IF EXISTS `hanfuactivity`;

CREATE TABLE `hanfuactivity` (
  `acId` int(10) NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `acAddress` varchar(30) NOT NULL COMMENT '活动地址',
  `acTime` year(4) NOT NULL COMMENT '活动时间',
  `acForm` varchar(20) NOT NULL COMMENT '活动形式',
  `acName` varchar(20) NOT NULL COMMENT '活动名称',
  `acSponsor` varchar(10) NOT NULL COMMENT '活动主办方',
  `acDetailes` varchar(60) NOT NULL COMMENT '活动详情',
  PRIMARY KEY (`acId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hanfuactivity` */

/*Table structure for table `hanfuintroduce` */

DROP TABLE IF EXISTS `hanfuintroduce`;

CREATE TABLE `hanfuintroduce` (
  `hanfuHistory` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hanfuintroduce` */

/*Table structure for table `hanfushop` */

DROP TABLE IF EXISTS `hanfushop`;

CREATE TABLE `hanfushop` (
  `shopId` int(10) NOT NULL AUTO_INCREMENT COMMENT '店铺编号',
  `shopName` varchar(20) NOT NULL COMMENT '店铺名称',
  `shopSale` int(10) NOT NULL COMMENT '店铺销量',
  PRIMARY KEY (`shopId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hanfushop` */

/*Table structure for table `manage` */

DROP TABLE IF EXISTS `manage`;

CREATE TABLE `manage` (
  `manageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `manageEmail` varchar(30) DEFAULT NULL COMMENT '管理员邮箱',
  `managePassword` varchar(20) NOT NULL COMMENT '管理员账户密码',
  `manageName` varchar(10) NOT NULL COMMENT '管理员账户名字',
  `manageSex` bit(1) DEFAULT b'0' COMMENT '管理员性别',
  `managePhone` varchar(11) DEFAULT NULL COMMENT '管理员电话号码',
  PRIMARY KEY (`manageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `manage` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `userEmail` varchar(30) NOT NULL COMMENT '用户邮箱',
  `userPassword` varchar(30) NOT NULL COMMENT '用户密码',
  `userName` varchar(30) NOT NULL COMMENT '用户昵称',
  `userAccout` varchar(30) NOT NULL COMMENT '用户账号',
  `userSex` bit(1) NOT NULL DEFAULT b'0' COMMENT '用户性别',
  `userPhone` varchar(11) DEFAULT NULL COMMENT '用户电话',
  `userQQ` varchar(20) DEFAULT NULL COMMENT '用户QQ',
  `userImage` bit(1) NOT NULL COMMENT '用户头像',
  `userAddres` varchar(30) DEFAULT NULL COMMENT '用户地址',
  `userBirthday` year(4) DEFAULT NULL COMMENT '用户生日',
  `userSign` varchar(60) DEFAULT NULL COMMENT '用户个性签名',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
