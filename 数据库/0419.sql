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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '稿件编号',
  `useId` int(11) NOT NULL COMMENT '用户Id 作者',
  `bioati` varchar(255) NOT NULL COMMENT '稿件标题',
  `pic` varchar(255) DEFAULT '/img/defualt/article.png' COMMENT '稿件封面',
  `atcDescribe` varchar(255) DEFAULT NULL COMMENT '稿件描述',
  `atcType` varchar(255) DEFAULT NULL COMMENT '稿件分类',
  `atcLabel` varchar(255) DEFAULT NULL COMMENT '稿件标签',
  `atcBrowse` int(10) DEFAULT '0' COMMENT '稿件浏览量，热门榜',
  `atcThumes` int(10) DEFAULT '0' COMMENT '稿件点赞量，点赞榜',
  `atcTime` datetime DEFAULT NULL COMMENT '稿件发布时间,最新动态',
  `actShare` int(10) DEFAULT '0' COMMENT '稿件分享量',
  `actText` text COMMENT '专栏内容',
  `actReview` tinyint(1) DEFAULT '0' COMMENT '审核状态，0未通过，1通过',
  `atcSc` int(10) DEFAULT '0' COMMENT '收藏量',
  PRIMARY KEY (`id`),
  KEY `用户` (`useId`),
  CONSTRAINT `用户` FOREIGN KEY (`useId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `articles` */

insert  into `articles`(`id`,`useId`,`bioati`,`pic`,`atcDescribe`,`atcType`,`atcLabel`,`atcBrowse`,`atcThumes`,`atcTime`,`actShare`,`actText`,`actReview`,`atcSc`) values 
(6,1,'rewrwet','/img/defualt/article.png','erttttter','发型',NULL,17,0,'2021-04-19 08:51:09',0,'<p>fdsfsf</p>',1,0),
(7,1,'汉服文化节','/img/defualt/article.png','上衣下裳制产生流行的主要时代是先秦G.	不得在楼道大声喧哗，为了保证第二天工作质量，23:00后应当休息，亦不得妨碍其他人员的休息；','发型',NULL,17,0,'2021-04-19 09:09:10',0,'<h1>深衣</h1><p>	深衣制形成于周朝，周朝分为西周和东周，东周也就是春秋战国，当时的社会正发生着深刻转变，深衣制就是在这一历史背景下诞生的。</p><p>	<span style=\"background-color: rgb(255, 153, 0);\">深衣制是上衣和下裳分开裁剪，在腰部相连，形成整体，也即上下连裳，在裁剪上就是分别裁好上衣和下裙，然后再缝缀在一起，最后衣服还是一体的样式。深衣男女均可穿，即被用作礼服，又可日常穿着，可做君主百官及士人燕居（非正式场合）时的休闲类服饰。深衣普及率很高，流传的时间有三千多年：从先秦到明代末年。</span></p><p>	深衣有两大类：<strong>直裾</strong>和<strong>曲裾</strong>。主要作为正规场合礼服，男女皆穿，它大气儒雅、中正平和、风韵满满。</p><p>	<strong>直裾</strong>：左大襟从前胸绕到右后方之后垂直而下，故称直裾，简洁干练、中正肃穆，它是历代男子礼服的通用服饰，影响极其深远。</p><p><br></p>',1,0),
(8,1,'十点十分大方','/img/defualt/article.png','大师傅但是第三方','发型',NULL,1,0,'2021-04-19 09:12:07',0,'<p class=\"ql-align-center\"><span class=\"ql-size-large\">曲裾：“裾”就是裙子的意思，曲裾就是弯曲盘绕的裙子，和直裾相比，它的襟是围着下体层层盘绕，最后系于腰部，其曲线优美流畅，令人赏心悦目。一说到曲裾，熟悉汉服的人第一反映就是想起那个强悍无比的大汉王朝，因为曲裾在那个时候可以说是泛滥成灾了，上至皇帝文武百官，下至于平民布衣皆穿曲裾。</span></p><p class=\"ql-align-center\"><br></p>',1,0),
(11,1,'ewqe请问','/img/defualt/article.png','趣味无穷','发型',NULL,1,0,'2021-04-19 09:44:53',0,'<p>而我却</p>',0,0),
(12,1,'2313','/img/defualt/article.png','432432','妆容',NULL,0,0,'2021-04-19 17:35:47',0,'<p>213213</p>',0,0);

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `useId` int(11) DEFAULT NULL COMMENT '用户编号',
  `type` tinyint(1) DEFAULT NULL COMMENT '收藏类型(0视频1专栏)',
  `atcId` int(11) DEFAULT NULL COMMENT '稿件编号',
  `videoId` int(11) DEFAULT NULL COMMENT '视频编号',
  `cltTime` date DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `获取稿件编号` (`atcId`),
  CONSTRAINT `获取稿件编号` FOREIGN KEY (`atcId`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `collect` */

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

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
  `pic` varchar(255) DEFAULT NULL COMMENT '活动图片',
  PRIMARY KEY (`acId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `hanfuactivity` */

insert  into `hanfuactivity`(`acId`,`acName`,`acAddress`,`acTime`,`acForm`,`acSponsor`,`acDetails`,`pic`) values 
(2,'432','312','2021-04-06','雅集','123q','123123w11e......................................=---------------------------------------------------------------','/img/activePic/16176913101302.jpg'),
(6,'ewqe432','qw342','2021-02-28','祭祀','qwe423','e2','/img/defualt/active.png'),
(7,'2311','321','2021-01-31','踏青','13','342','/img/defualt/active.png'),
(8,'231','123','2021-03-28','赏花','123','123','/img/defualt/active.png'),
(9,'1','2','2021-03-29','时装展','1','1','/img/defualt/active.png'),
(10,'231','21','2021-04-08','漫展','213','123',NULL),
(11,'而我却','恶趣味','2021-04-08','祈福',NULL,NULL,NULL),
(12,'2 ','额','2021-04-08','文化节',NULL,NULL,NULL),
(13,'q','q','2021-03-28','花朝节','q','q','/img/defualt/active.png');

/*Table structure for table `hanfushop` */

DROP TABLE IF EXISTS `hanfushop`;

CREATE TABLE `hanfushop` (
  `shopId` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺编号',
  `shopName` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  `shopHttp` varchar(255) DEFAULT NULL COMMENT '店铺链接',
  `pic` varchar(255) DEFAULT NULL COMMENT '店铺图片',
  `shopYear` datetime DEFAULT NULL COMMENT '店铺认证时间',
  `shopFans` int(11) DEFAULT NULL COMMENT '店铺粉丝量',
  PRIMARY KEY (`shopId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `hanfushop` */

insert  into `hanfushop`(`shopId`,`shopName`,`shopHttp`,`pic`,`shopYear`,`shopFans`) values 
(1,'汉尚华莲','https://hanshanghualian.tmall.com/shop/view_shop.htm?user_number_id=3358098495&ali_trackid=2%3Amm_16143309_397250212_106971550493%3A1617422133_246_258436896&union_lens=recoveryid%3A1617422133_246_258436896&bxsign=tbkKRmXlzFaJ3xpQMKPxF8IUYBJSETbguxzDYUMMgG','/img/shopPic/1617630528988清水溪.jpeg','2021-01-14 00:00:00',2321221),
(6,'we','q2','/img/shopPic/hhh.jpg','2021-03-29 00:00:00',231),
(7,'e1','1213','/img/shopPic/hhh.jpg','2021-03-29 00:00:00',12321),
(8,'we','12','/img/defualt/shop.png','2021-03-28 00:00:00',123),
(9,'池夏','ewrfda','/img/defualt/shop.png','2021-03-28 00:00:00',23452),
(11,'wqe','qwe','/img/defualt/shop.png','2020-12-04 00:00:00',2313),
(12,'4232','1431','/img/defualt/shop.png','2020-12-01 00:00:00',414),
(13,'e3214e','2321','/img/defualt/shop.png','2020-12-02 00:00:00',321312),
(14,'dw','ew','/img/defualt/shop.png','2021-01-25 00:00:00',231),
(15,'ew','213','/img/defualt/shop.png','2020-12-01 00:00:00',321),
(16,'weq','213','/img/defualt/shop.png','2021-04-08 00:00:00',1231),
(17,'1','2','/img/defualt/shop.png','2021-03-29 00:00:00',2),
(18,'ewe','q','/img/defualt/shop.png','2021-02-25 00:00:00',321),
(19,'34','2','/img/defualt/shop.png','2021-02-28 00:00:00',1),
(20,'34','2','/img/defualt/shop.png','2021-02-26 00:00:00',1),
(21,'w','q','/img/defualt/shop.png','2021-03-30 00:00:00',1),
(22,'e','2','/img/defualt/shop.png','2021-02-22 00:00:00',1),
(23,'2','1','/img/defualt/shop.png','2021-02-23 00:00:00',1),
(24,'cece','1','/img/defualt/shop.png','2021-03-12 00:00:00',1),
(25,'ce1','1','/img/defualt/shop.png','2021-03-14 00:00:00',1),
(26,'12','22','/img/defualt/shop.png','2021-03-29 00:00:00',21);

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

insert  into `manage`(`manageId`,`manageName`,`managePassword`,`manageEmail`,`manageSex`,`managePhone`) values 
(1,'w','123','1234@qq.com',0,NULL),
(2,'王','111','',NULL,NULL);

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

/*Table structure for table `subscribe` */

DROP TABLE IF EXISTS `subscribe`;

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注编号',
  `beSubscribe` int(11) DEFAULT '0' COMMENT '被关注者Id',
  `subscribe` int(11) DEFAULT '0' COMMENT '关注者Id',
  `time` date DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`),
  KEY `被关注` (`beSubscribe`),
  KEY `关注` (`subscribe`),
  CONSTRAINT `关注` FOREIGN KEY (`subscribe`) REFERENCES `user` (`id`),
  CONSTRAINT `被关注` FOREIGN KEY (`beSubscribe`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `subscribe` */

insert  into `subscribe`(`id`,`beSubscribe`,`subscribe`,`time`) values 
(5,2,1,'2021-04-16');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `suggest` */

insert  into `suggest`(`sugId`,`useId`,`sugTitle`,`sugDetail`,`sugTime`) values 
(1,1,'1','22','2021-04-08'),
(2,1,'1','1','2021-04-14');

/*Table structure for table `thumb` */

DROP TABLE IF EXISTS `thumb`;

CREATE TABLE `thumb` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '点赞编号',
  `useId` int(11) NOT NULL COMMENT '用户编号',
  `type` tinyint(1) DEFAULT NULL COMMENT '点赞类型(0视频1专栏)',
  `atcId` int(11) DEFAULT NULL COMMENT '稿件编号',
  `videoId` int(11) DEFAULT NULL COMMENT '视频编号',
  `dzTime` date DEFAULT NULL COMMENT '点赞时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `thumb` */

insert  into `thumb`(`id`,`useId`,`type`,`atcId`,`videoId`,`dzTime`) values 
(1,1,0,NULL,5,'2021-04-16'),
(2,1,1,1,NULL,'2021-04-16');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`userAccount`,`userName`,`userPassword`,`userSex`,`userImage`,`createTime`,`updateTime`,`userPhone`,`userQQ`,`userAddress`,`userBirthday`,`userSign`,`userBackImg`,`userEmail`) values 
(1,'111111','wang','12',0,'/img/userPic/16188027940551.jpg','2021-03-16 00:00:00','2021-04-19 00:00:00','1234345','werewrq213','天津市-天津市-南开区','2021-03-28 00:00:00','23234324',NULL,'543re'),
(2,'432','32','23',1,'/img/userPic/16177004888671 (2).jpg','2021-04-11 21:46:12','2021-04-11 21:46:12','21312312','12312312','daedqw','2021-04-11 21:46:12','3e2eqwe',NULL,'e3214213q'),
(3,'21','321','12',0,'/img/userPic/1617870997324girl.png','2021-04-08 16:39:45','2021-04-08 16:39:45','12321','23131','213','2021-04-08 16:39:45','123',NULL,'w21'),
(4,'w','`12','`21`2',1,'/img/userPic/1617937035138girl.png','2021-03-31 00:00:00','2021-03-31 00:00:00','12','12','12321','2021-03-31 00:00:00','',NULL,'12'),
(6,'qwewq1','wqdwqw','1234',1,'/img/defualt/user.png','2021-04-10 12:44:42','2021-04-10 12:44:42','231123','1231231','2021-3-29','2021-04-10 12:44:42','ewe',NULL,'123213'),
(7,'123','w3e12','123',0,'/img/defualt/user.png','2021-04-10 00:00:00','2021-04-10 00:00:00','32131231','12321321','','1990-01-30 00:00:00','132ewq',NULL,'32131231'),
(8,'w1','12','1',1,'/img/defualt/user.png','2021-04-10 00:00:00','2021-04-10 00:00:00','ewqe','q','','2021-03-29 00:00:00','21wwq',NULL,'qwe'),
(9,'eqweqweqe','1w12','12321',1,'/img/defualt/user.png','2021-03-28 00:00:00','2021-03-28 00:00:00','1','12','1','2021-03-28 00:00:00','2',NULL,'21'),
(10,'sqs','qs','q',1,'/img/defualt/user.png','2021-03-28 00:00:00','2021-03-28 00:00:00','','','','2021-03-28 00:00:00','',NULL,''),
(11,'3211','sdadasf','12',1,'/img/defualt/user.png','2021-04-19 00:00:00','2021-04-19 00:00:00','21343243123','21321312','湖北省-黄冈市-罗田县','1999-03-11 00:00:00','sgretge',NULL,'23132121');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `video` */

insert  into `video`(`id`,`useId`,`videoTitle`,`pic`,`videoDes`,`videoType`,`videoLabel`,`videoBrowse`,`videoThumes`,`videoTime`,`videoShare`,`videoFile`,`videoReview`,`videoSc`) values 
(28,1,'erewrf','/img/defualt/video.png','ewrw','发型',NULL,6,0,'2021-04-19 14:55:16',0,'/video/1618815316055son.mp4',1,0),
(29,1,'rew','/img/defualt/video.png','wer','发型',NULL,8,0,'2021-04-19 14:56:49',0,'/video/1618815409265son.mp4',0,0),
(30,1,'dsadw','/img/defualt/video.png','edqwdedewqe','发型',NULL,6,0,'2021-04-19 15:02:24',0,'/video/161881574119767.项目3-elm项目：PC端登录页-vue.mp4',0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
