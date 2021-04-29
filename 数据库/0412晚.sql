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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '稿件编号',
  `useId` int(11) NOT NULL COMMENT '用户Id 作者',
  `bioati` varchar(255) NOT NULL COMMENT '稿件标题',
  `pic` varchar(255) DEFAULT '/img/defualt/article.png' COMMENT '稿件封面',
  `atcDescribe` varchar(255) DEFAULT NULL COMMENT '稿件描述',
  `atcType` varchar(255) DEFAULT NULL COMMENT '稿件分类',
  `atcLabel` varchar(255) DEFAULT NULL COMMENT '稿件标签',
  `atcBrowse` int(10) NOT NULL DEFAULT '0' COMMENT '稿件浏览量，热门榜',
  `atcThumes` int(10) NOT NULL DEFAULT '0' COMMENT '稿件点赞量，点赞榜',
  `atcTime` datetime NOT NULL COMMENT '稿件发布时间,最新动态',
  `actShare` int(10) NOT NULL DEFAULT '0' COMMENT '稿件分享量',
  `actText` text COMMENT '专栏内容',
  `actReview` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态，0未通过，1通过',
  `atcSc` int(10) DEFAULT '0' COMMENT '收藏量',
  PRIMARY KEY (`id`),
  KEY `用户` (`useId`),
  CONSTRAINT `用户` FOREIGN KEY (`useId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `articles` */

insert  into `articles`(`id`,`useId`,`bioati`,`pic`,`atcDescribe`,`atcType`,`atcLabel`,`atcBrowse`,`atcThumes`,`atcTime`,`actShare`,`actText`,`actReview`,`atcSc`) values (1,1,'1','/img/defualt/article.png','1','妆容','1',1,1,'2021-04-08 11:46:27',0,NULL,0,0),(5,3,'额外','/img/defualt/article.png','而我却','发型','为',0,0,'2021-04-08 16:03:00',0,NULL,1,0);

/*Table structure for table `collet` */

DROP TABLE IF EXISTS `collet`;

CREATE TABLE `collet` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏夹编号',
  `atcId` int(11) NOT NULL COMMENT '稿件编号',
  `cltName` varchar(255) NOT NULL COMMENT '收藏夹名称',
  `cltTime` date NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `获取稿件编号` (`atcId`),
  CONSTRAINT `获取稿件编号` FOREIGN KEY (`atcId`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collet` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `useId` int(11) NOT NULL COMMENT '用户id',
  `videoid` int(11) DEFAULT NULL COMMENT '视频id',
  `articleid` int(11) DEFAULT NULL COMMENT '专栏id',
  `type` tinyint(1) DEFAULT NULL COMMENT '评论类型（0视频1专栏）',
  `parentId` int(11) DEFAULT NULL COMMENT '父评论id',
  `comtContent` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `comtTime` datetime DEFAULT NULL COMMENT '评论时间',
  `up` int(11) DEFAULT '0' COMMENT '评论点赞数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`useId`,`videoid`,`articleid`,`type`,`parentId`,`comtContent`,`comtTime`,`up`) values (1,1,1,0,1,NULL,'as','2021-04-11 17:53:41',0),(3,1,1,NULL,0,NULL,'111','2021-04-12 20:25:04',0),(4,1,5,NULL,0,NULL,'111','2021-04-12 20:25:10',0),(5,1,3,NULL,0,NULL,'111','2021-04-12 20:25:15',0),(6,3,5,NULL,0,NULL,'2121','2021-04-12 20:25:36',0),(7,3,2,NULL,0,NULL,'2121','2021-04-12 20:25:41',0),(8,3,6,NULL,0,NULL,'2121','2021-04-12 20:25:48',0),(9,3,6,NULL,0,NULL,'eqwe','2021-04-12 20:26:25',0),(10,3,4,NULL,0,NULL,'我来了','2021-04-12 20:36:16',0),(11,3,7,NULL,0,NULL,'捧场','2021-04-12 20:36:33',0);

/*Table structure for table `db_subscribe` */

DROP TABLE IF EXISTS `db_subscribe`;

CREATE TABLE `db_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注编号',
  `beSubscribe` int(11) NOT NULL DEFAULT '0' COMMENT '被关注者Id',
  `subscribe` int(11) NOT NULL DEFAULT '0' COMMENT '关注者Id',
  `isDel` bit(1) NOT NULL DEFAULT b'0' COMMENT '存续关系，0继续关注，1取消关注',
  PRIMARY KEY (`id`),
  KEY `被关注` (`beSubscribe`),
  KEY `关注` (`subscribe`),
  CONSTRAINT `关注` FOREIGN KEY (`subscribe`) REFERENCES `user` (`id`),
  CONSTRAINT `被关注` FOREIGN KEY (`beSubscribe`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `db_subscribe` */

/*Table structure for table `hanfuactivity` */

DROP TABLE IF EXISTS `hanfuactivity`;

CREATE TABLE `hanfuactivity` (
  `acId` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `acName` varchar(255) NOT NULL COMMENT '活动名称',
  `acAddress` varchar(255) NOT NULL COMMENT '活动地址',
  `acTime` date NOT NULL COMMENT '活动时间',
  `acForm` varchar(255) NOT NULL COMMENT '活动形式',
  `acSponsor` varchar(255) DEFAULT NULL COMMENT '活动主办方',
  `acDetails` varchar(255) DEFAULT NULL COMMENT '活动详情',
  `acImg` varchar(255) DEFAULT NULL COMMENT '活动图片',
  PRIMARY KEY (`acId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `hanfuactivity` */

insert  into `hanfuactivity`(`acId`,`acName`,`acAddress`,`acTime`,`acForm`,`acSponsor`,`acDetails`,`acImg`) values (2,'432','312','2021-04-06','雅集','123q','123123w11e......................................=---------------------------------------------------------------','/img/activePic/16176913101302.jpg'),(6,'ewqe432','qw342','2021-02-28','祭祀','qwe423','e2','/img/defualt/active.png'),(7,'2311','321','2021-01-31','踏青','13','342','/img/defualt/active.png'),(8,'231','123','2021-03-28','赏花','123','123','/img/defualt/active.png'),(9,'1','2','2021-03-29','时装展','1','1','/img/defualt/active.png'),(10,'231','21','2021-04-08','漫展','213','123',NULL),(11,'而我却','恶趣味','2021-04-08','祈福',NULL,NULL,NULL),(12,'2 ','额','2021-04-08','文化节',NULL,NULL,NULL),(13,'q','q','2021-03-28','q','q','q','/img/defualt/active.png');

/*Table structure for table `hanfushop` */

DROP TABLE IF EXISTS `hanfushop`;

CREATE TABLE `hanfushop` (
  `shopId` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺编号',
  `shopName` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  `shopHttp` varchar(255) DEFAULT NULL COMMENT '店铺链接',
  `shopImage` varchar(255) DEFAULT NULL COMMENT '店铺图片',
  `shopYear` datetime DEFAULT NULL COMMENT '店铺认证时间',
  `shopFans` int(11) DEFAULT NULL COMMENT '店铺粉丝量',
  PRIMARY KEY (`shopId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `hanfushop` */

insert  into `hanfushop`(`shopId`,`shopName`,`shopHttp`,`shopImage`,`shopYear`,`shopFans`) values (1,'汉尚华莲','https://hanshanghualian.tmall.com/shop/view_shop.htm?user_number_id=3358098495&ali_trackid=2%3Amm_16143309_397250212_106971550493%3A1617422133_246_258436896&union_lens=recoveryid%3A1617422133_246_258436896&bxsign=tbkKRmXlzFaJ3xpQMKPxF8IUYBJSETbguxzDYUMMgG','/img/shopPic/1617630528988清水溪.jpeg','2021-01-14 00:00:00',2321221),(6,'we','q2','/img/shopPic/hhh.jpg','2021-03-29 00:00:00',231),(7,'e1','1213','/img/shopPic/hhh.jpg','2021-03-29 00:00:00',12321),(8,'we','12','/img/defualt/shop.png','2021-03-28 00:00:00',123),(9,'池夏','ewrfda','/img/defualt/shop.png','2021-03-28 00:00:00',23452),(10,'wqe','qwe','/img/defualt/shop.png','2021-03-28 00:00:00',2313),(11,'wqe','qwe','/img/defualt/shop.png','2021-03-28 00:00:00',2313),(12,'4232','1431','/img/defualt/shop.png','2021-03-29 00:00:00',414),(13,'e3214e','2321','/img/defualt/shop.png','2021-03-28 00:00:00',321312),(14,'dw','ew','/img/defualt/shop.png','2021-03-29 00:00:00',231),(15,'ew','213','/img/defualt/shop.png','2021-03-29 00:00:00',321),(16,'weq','213','/img/defualt/shop.png','2021-04-08 00:00:00',1231),(17,'1','2','/img/defualt/shop.png','2021-03-29 00:00:00',2),(18,'ewe','q','/img/defualt/shop.png','2021-03-29 00:00:00',321),(19,'34','2','/img/defualt/shop.png','2021-03-29 00:00:00',1),(20,'34','2','/img/defualt/shop.png','2021-03-29 00:00:00',1),(21,'w','q','/img/defualt/shop.png','2021-03-30 00:00:00',1),(22,'e','2','/img/defualt/shop.png','2021-03-30 00:00:00',1),(23,'2','1','/img/defualt/shop.png','2021-03-30 00:00:00',1),(24,'cece','1','/img/defualt/shop.png','2021-03-29 00:00:00',1),(25,'ce1','1','/img/defualt/shop.png','2021-03-29 00:00:00',1),(26,'12','22','/img/defualt/shop.png','2021-03-29 00:00:00',21);

/*Table structure for table `manage` */

DROP TABLE IF EXISTS `manage`;

CREATE TABLE `manage` (
  `manageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `manageName` varchar(255) NOT NULL COMMENT '管理员账户名字',
  `managePassword` varchar(255) NOT NULL COMMENT '管理员账户密码',
  `manageEmail` varchar(30) NOT NULL COMMENT '管理员邮箱',
  `manageSex` tinyint(1) DEFAULT NULL COMMENT '管理员性别（1男0女）',
  `managePhone` varchar(15) DEFAULT NULL COMMENT '管理员电话号码',
  PRIMARY KEY (`manageId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `manage` */

insert  into `manage`(`manageId`,`manageName`,`managePassword`,`manageEmail`,`manageSex`,`managePhone`) values (1,'w','123','1234@qq.com',0,NULL),(2,'王','111','',NULL,NULL);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '私信编号',
  `userId` int(11) NOT NULL COMMENT '发送者Id，非真实',
  `friendId` int(11) NOT NULL COMMENT '接收者Id，非真实',
  `senderId` int(11) NOT NULL COMMENT '发送者Id，真实',
  `receiverId` int(11) NOT NULL COMMENT '接收者Id，真实',
  `sendTime` date NOT NULL COMMENT '发送时间',
  `content` varchar(255) NOT NULL COMMENT '私信内容',
  `status` bit(4) NOT NULL DEFAULT b'1' COMMENT '消息状态',
  PRIMARY KEY (`id`),
  KEY `发送非真` (`userId`),
  KEY `接收非真` (`friendId`),
  KEY `发送真` (`senderId`),
  KEY `接收真` (`receiverId`),
  CONSTRAINT `发送真` FOREIGN KEY (`senderId`) REFERENCES `user` (`id`),
  CONSTRAINT `发送非真` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `接收真` FOREIGN KEY (`receiverId`) REFERENCES `user` (`id`),
  CONSTRAINT `接收非真` FOREIGN KEY (`friendId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `suggest` */

DROP TABLE IF EXISTS `suggest`;

CREATE TABLE `suggest` (
  `sugId` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉编号',
  `useId` int(11) NOT NULL COMMENT '用户编号',
  `sugTitle` varchar(255) NOT NULL COMMENT '投诉标题',
  `sugDetail` varchar(255) NOT NULL COMMENT '投诉内容',
  `sugTime` date NOT NULL COMMENT '投诉时间',
  PRIMARY KEY (`sugId`),
  KEY `用户编号` (`useId`),
  CONSTRAINT `用户编号` FOREIGN KEY (`useId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `suggest` */

insert  into `suggest`(`sugId`,`useId`,`sugTitle`,`sugDetail`,`sugTime`) values (1,1,'1','22','2021-04-08');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `userAccount` varchar(255) NOT NULL COMMENT '用户账号',
  `userName` varchar(255) NOT NULL COMMENT '用户昵称',
  `userPassword` varchar(255) NOT NULL COMMENT '用户密码',
  `userSex` tinyint(1) DEFAULT NULL COMMENT '用户性别（1男0女）',
  `userImage` varchar(255) DEFAULT 'img/defualt/user.png' COMMENT '用户头像',
  `createTime` datetime DEFAULT NULL COMMENT '用户创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '用户更新时间',
  `userPhone` varchar(15) DEFAULT NULL COMMENT '用户电话',
  `userQQ` varchar(15) DEFAULT NULL COMMENT '用户QQ',
  `userAddress` varchar(255) DEFAULT NULL COMMENT '用户地址',
  `userBirthday` datetime DEFAULT NULL COMMENT '用户生日',
  `userSign` varchar(255) DEFAULT NULL COMMENT '用户个性签名',
  `userBackImg` varchar(255) DEFAULT NULL COMMENT '用户界面背景图',
  `userEmail` varchar(30) DEFAULT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`userAccount`,`userName`,`userPassword`,`userSex`,`userImage`,`createTime`,`updateTime`,`userPhone`,`userQQ`,`userAddress`,`userBirthday`,`userSign`,`userBackImg`,`userEmail`) values (1,'111111','wang','1',0,'/img/userPic/1618149298525页面-1.jpg','2021-03-16 00:00:00','2021-04-06 00:00:00','12345678','123456789',NULL,NULL,NULL,NULL,'12345678@qq.com'),(2,'432','32','23',1,'/img/userPic/16177004888671 (2).jpg','2021-04-11 21:46:12','2021-04-11 21:46:12','21312312','12312312','daedqw','2021-04-11 21:46:12','3e2eqwe',NULL,'e3214213q'),(3,'21','321','12',0,'/img/userPic/1617870997324girl.png','2021-04-08 16:39:45','2021-04-08 16:39:45','12321','23131','213','2021-04-08 16:39:45','123',NULL,'w21'),(4,'w','`12','`21`2',1,'/img/userPic/1617937035138girl.png','2021-03-31 00:00:00','2021-03-31 00:00:00','12','12','12321','2021-03-31 00:00:00','',NULL,'12'),(6,'qwewq1','wqdwqw','1234',1,'/img/defualt/user.png','2021-04-10 12:44:42','2021-04-10 12:44:42','231123','1231231','2021-3-29','2021-04-10 12:44:42','ewe',NULL,'123213'),(7,'123','w3e12','123',0,'/img/defualt/user.png','2021-04-10 00:00:00','2021-04-10 00:00:00','32131231','12321321','','1990-01-30 00:00:00','132ewq',NULL,'32131231'),(8,'w1','12','1',1,'/img/defualt/user.png','2021-04-10 00:00:00','2021-04-10 00:00:00','ewqe','q','','2021-03-29 00:00:00','21wwq',NULL,'qwe'),(9,'eqweqweqe','1w12','12321',1,'/img/defualt/user.png','2021-03-28 00:00:00','2021-03-28 00:00:00','1','12','1','2021-03-28 00:00:00','2',NULL,'21'),(10,'sqs','qs','q',1,'/img/defualt/user.png','2021-03-28 00:00:00','2021-03-28 00:00:00','','','','2021-03-28 00:00:00','',NULL,'');

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `useId` int(11) NOT NULL COMMENT '用户编号',
  `videoTitle` varchar(255) NOT NULL COMMENT '标题',
  `pic` varchar(255) DEFAULT '/img/defualt/video.png' COMMENT '封面',
  `videoDes` varchar(255) DEFAULT NULL COMMENT '描述',
  `videoType` varchar(255) DEFAULT NULL COMMENT '分类',
  `videoLabel` varchar(255) DEFAULT NULL COMMENT '标签',
  `videoBrowse` int(10) DEFAULT '0' COMMENT '浏览量',
  `videoThumes` int(10) DEFAULT '0' COMMENT '点赞量',
  `videoTime` datetime DEFAULT NULL COMMENT '发布时间',
  `videoShare` int(10) DEFAULT '0' COMMENT '分享量',
  `videoFile` varchar(255) DEFAULT NULL COMMENT '文件',
  `videoReview` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态，0未通过，1通过',
  `videoSc` int(10) DEFAULT '0' COMMENT '收藏量',
  PRIMARY KEY (`id`),
  KEY `userId` (`useId`),
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`useId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `video` */

insert  into `video`(`id`,`useId`,`videoTitle`,`pic`,`videoDes`,`videoType`,`videoLabel`,`videoBrowse`,`videoThumes`,`videoTime`,`videoShare`,`videoFile`,`videoReview`,`videoSc`) values (1,1,'1','/img/defualt/video.png','1','发型','1',1,1,'2021-03-30 21:57:54',1,'1',0,0),(2,2,'而我却','/img/defualt/video.png','我','种草',NULL,0,0,'2021-04-02 21:57:38',0,NULL,0,0),(3,3,'4324','/img/defualt/video.png','234','发型','213',0,0,'2021-04-17 21:57:40',0,NULL,1,0),(4,1,'12','/img/defualt/video.png','123','搭配','人',0,0,'2021-04-02 21:57:43',0,NULL,0,0),(5,3,'委屈','/img/defualt/video.png','额','妆容',NULL,0,0,'2021-04-01 21:57:45',0,NULL,0,0),(6,3,'2123','/img/defualt/video.png','1231','妆容',NULL,0,0,'2021-03-30 21:57:49',0,NULL,0,0),(7,4,'we','/img/defualt/video.png','qwe','搭配',NULL,0,0,'2021-03-31 21:57:52',0,NULL,0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
