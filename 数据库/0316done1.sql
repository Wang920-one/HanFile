/*
SQLyog Ultimate v13.1.1 (64 bit)
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
  `atcId` int(11) NOT NULL AUTO_INCREMENT COMMENT '稿件编号',
  `userId` int(11) NOT NULL COMMENT '用户Id 作者',
  `atcTile` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '稿件标题',
  `actImg` varchar(255) NOT NULL COMMENT '稿件封面',
  `atcDescribe` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '稿件描述',
  `atcType` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '稿件分类',
  `atcLabel` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT '稿件标签',
  `atcBrowse` int(10) NOT NULL COMMENT '稿件浏览量，热门榜',
  `atcThumes` int(10) NOT NULL COMMENT '稿件点赞量，点赞榜',
  `atcTime` datetime NOT NULL COMMENT '稿件发布时间,最新动态',
  `actShare` int(10) NOT NULL COMMENT '稿件分享量',
  `actReview` tinyint(1) NOT NULL COMMENT '稿件审核状态',
  PRIMARY KEY (`atcId`),
  KEY `用户` (`userId`),
  CONSTRAINT `用户` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `articles` */

/*Table structure for table `collet` */

DROP TABLE IF EXISTS `collet`;

CREATE TABLE `collet` (
  `cltId` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏夹编号',
  `atcId` int(11) NOT NULL COMMENT '稿件编号',
  `cltName` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '收藏夹名称',
  `cltTime` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`cltId`),
  KEY `获取稿件编号` (`atcId`),
  CONSTRAINT `获取稿件编号` FOREIGN KEY (`atcId`) REFERENCES `articles` (`atcId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collet` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comtId` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `artId` int(11) NOT NULL COMMENT '稿件编号',
  `userId` int(11) NOT NULL COMMENT '发出评论用户Id',
  `parentId` int(11) NOT NULL COMMENT '父评论Id',
  `comtContent` varchar(255) NOT NULL COMMENT '评论内容',
  `comtTime` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comtId`),
  KEY `稿件编号` (`artId`),
  KEY `用户Id` (`userId`),
  KEY `父评论Id` (`parentId`),
  CONSTRAINT `父评论Id` FOREIGN KEY (`parentId`) REFERENCES `comment` (`comtId`),
  CONSTRAINT `用户Id` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `稿件编号` FOREIGN KEY (`artId`) REFERENCES `articles` (`atcId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `contribute` */

DROP TABLE IF EXISTS `contribute`;

CREATE TABLE `contribute` (
  `ctbtId` int(11) NOT NULL AUTO_INCREMENT COMMENT '投稿编号',
  `actId` int(11) NOT NULL COMMENT '稿件编号',
  `ctbtTime` datetime NOT NULL COMMENT '投稿时间',
  PRIMARY KEY (`ctbtId`),
  KEY `投稿` (`actId`),
  CONSTRAINT `投稿` FOREIGN KEY (`actId`) REFERENCES `articles` (`atcId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contribute` */

/*Table structure for table `db_subscribe` */

DROP TABLE IF EXISTS `db_subscribe`;

CREATE TABLE `db_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注编号',
  `beSubscribe` int(11) NOT NULL DEFAULT '0' COMMENT '被关注者Id',
  `subscribe` int(11) NOT NULL DEFAULT '0' COMMENT '关注者Id',
  `isDel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '存续关系，0继续关注，1取消关注',
  PRIMARY KEY (`id`),
  KEY `被关注` (`beSubscribe`),
  KEY `关注` (`subscribe`),
  CONSTRAINT `关注` FOREIGN KEY (`subscribe`) REFERENCES `user` (`userId`),
  CONSTRAINT `被关注` FOREIGN KEY (`beSubscribe`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `db_subscribe` */

/*Table structure for table `hanfuactivity` */

DROP TABLE IF EXISTS `hanfuactivity`;

CREATE TABLE `hanfuactivity` (
  `acId` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `acName` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '活动名称',
  `acAddress` varchar(255) NOT NULL COMMENT '活动地址',
  `acTime` datetime NOT NULL COMMENT '活动时间',
  `acForm` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '活动形式',
  `acSponsor` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '活动主办方',
  `acDetailes` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '活动详情',
  PRIMARY KEY (`acId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hanfuactivity` */

/*Table structure for table `hanfuknows` */

DROP TABLE IF EXISTS `hanfuknows`;

CREATE TABLE `hanfuknows` (
  `knowsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '知识条编号',
  `knowsName` varchar(255) NOT NULL COMMENT '知识条名称',
  `knowsClass` varchar(255) NOT NULL COMMENT '知识条分类',
  `knowsContainer` varchar(255) NOT NULL COMMENT '知识条内容',
  `knowsImage` varchar(255) DEFAULT NULL COMMENT '知识条配图',
  PRIMARY KEY (`knowsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hanfuknows` */

/*Table structure for table `hanfushop` */

DROP TABLE IF EXISTS `hanfushop`;

CREATE TABLE `hanfushop` (
  `shopId` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺编号',
  `shopName` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '店铺名称',
  `shopHttp` varchar(255) NOT NULL COMMENT '店铺链接',
  `shopImage` varchar(255) NOT NULL COMMENT '店铺图片',
  `shopSale` int(10) NOT NULL COMMENT '店铺销量',
  `shopYear` int(10) NOT NULL COMMENT '店铺资历',
  PRIMARY KEY (`shopId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hanfushop` */

/*Table structure for table `manage` */

DROP TABLE IF EXISTS `manage`;

CREATE TABLE `manage` (
  `manageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `manageName` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '管理员账户名字',
  `managePassword` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '管理员账户密码',
  `manageEmail` char(30) CHARACTER SET latin1 NOT NULL COMMENT '管理员邮箱',
  `manageSex` tinyint(1) DEFAULT NULL COMMENT '管理员性别（1男0女）',
  `managePhone` char(15) DEFAULT NULL COMMENT '管理员电话号码',
  PRIMARY KEY (`manageId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `manage` */

insert  into `manage`(`manageId`,`manageName`,`managePassword`,`manageEmail`,`manageSex`,`managePhone`) values 
(1,'w','123','1234@qq.com',0,NULL);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '私信编号',
  `userId` int(11) NOT NULL COMMENT '发送者Id，非真实',
  `friendId` int(11) NOT NULL COMMENT '接收者Id，非真实',
  `senderId` int(11) NOT NULL COMMENT '发送者Id，真实',
  `receiverId` int(11) NOT NULL COMMENT '接收者Id，真实',
  `sendTime` datetime NOT NULL COMMENT '发送时间',
  `content` varchar(255) NOT NULL COMMENT '私信内容',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '消息状态',
  PRIMARY KEY (`messageId`),
  KEY `发送非真` (`userId`),
  KEY `接收非真` (`friendId`),
  KEY `发送真` (`senderId`),
  KEY `接收真` (`receiverId`),
  CONSTRAINT `发送真` FOREIGN KEY (`senderId`) REFERENCES `user` (`userId`),
  CONSTRAINT `发送非真` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `接收真` FOREIGN KEY (`receiverId`) REFERENCES `user` (`userId`),
  CONSTRAINT `接收非真` FOREIGN KEY (`friendId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `suggest` */

DROP TABLE IF EXISTS `suggest`;

CREATE TABLE `suggest` (
  `sugId` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉编号',
  `userId` int(11) NOT NULL COMMENT '用户编号',
  `sugTitle` varchar(255) NOT NULL COMMENT '投诉标题',
  `sugDetail` varchar(255) NOT NULL COMMENT '投诉内容',
  `sugTime` datetime NOT NULL COMMENT '投诉时间',
  PRIMARY KEY (`sugId`),
  KEY `用户编号` (`userId`),
  CONSTRAINT `用户编号` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `suggest` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `userAccout` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '用户账号',
  `userName` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '用户昵称',
  `userPassword` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '用户密码',
  `userSex` tinyint(1) NOT NULL COMMENT '用户性别（1男0女）',
  `userEmail` char(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户邮箱',
  `userPhone` char(15) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户电话',
  `userQQ` char(15) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户QQ',
  `userImage` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `userAddress` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户地址',
  `userBirthday` datetime DEFAULT NULL COMMENT '用户生日',
  `userSign` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户个性签名',
  `userBackImg` varchar(255) DEFAULT NULL COMMENT '用户界面背景图',
  `createTime` datetime DEFAULT NULL COMMENT '用户创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '用户更新时间',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`userAccout`,`userName`,`userPassword`,`userSex`,`userEmail`,`userPhone`,`userQQ`,`userImage`,`userAddress`,`userBirthday`,`userSign`,`userBackImg`,`createTime`,`updateTime`) values 
(1,'111111','wang','1',0,'12345678@qq.com','12345678','123456789',NULL,NULL,NULL,NULL,NULL,'2021-03-16 10:57:23',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
