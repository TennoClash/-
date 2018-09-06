# Host: 127.0.0.1  (Version: 5.0.96-community-nt)
# Date: 2018-09-06 16:33:24
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "fight"
#

DROP TABLE IF EXISTS `fight`;
CREATE TABLE `fight` (
  `Id` int(11) NOT NULL auto_increment,
  `player1` int(11) default NULL,
  `player2` int(11) default NULL,
  `song1` varchar(255) default NULL,
  `song2` varchar(255) default NULL,
  `des` varchar(255) default NULL,
  `state` int(1) default NULL,
  `ticket1` varchar(255) default NULL,
  `ticket2` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "fight"
#

INSERT INTO `fight` VALUES (1,6,8,'song1','song2','对战对战',0,'10','7'),(2,7,4,'我心飞翔','Landslide','对战',0,'1','0'),(3,9,7,'I Really Like You','God knows...','对战',0,'1','3'),(4,5,9,'Rock Star','Heathens','对战对战对战',0,'1','1'),(5,11,7,'たぐいまれる','unomi','对战',0,'0','1'),(6,12,7,'In the Long Run','If I Die Young','duizhan ',0,'2','0'),(7,13,7,'22222222222222','333333333333333','666666666666666666',0,'1','0'),(8,14,13,'333','1111','sssssssssssss\n',0,'1','1'),(9,8,15,'zzzzz','xxxxxxxxxx','666666666666666666666666',0,'1','0'),(10,16,15,'666','666555','55555555555',0,'1','0'),(11,17,15,'2312313','123123','123123123',0,'1','0');

#
# Structure for table "player"
#

DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `Id` int(11) NOT NULL auto_increment,
  `pic` varchar(255) default '',
  `name` varchar(255) default NULL,
  `age` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `hobby` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "player"
#

INSERT INTO `player` VALUES (4,'headimg1.jpg','一一','20','1','羽毛球'),(5,'headimg2.jpg','二二','22','0','篮球'),(6,'headimg4.jpg','三三','19','1','足球'),(7,'headimg6.jpg','四四','20','0','种植'),(8,'headimg9.jpg','xxxxx','30','1','钓鱼'),(9,'headimg7.jpg','张三','25','0','乒乓球'),(11,'headimg3.jpg','赵四','30','0','睡觉'),(12,'headimg5.jpg','Ana','19','0','唱歌'),(13,'headimg8.jpg','kkk','20','1','无'),(14,'headimg10.jpg','oooo','20','0','8888'),(15,'headimg5.jpg','王五','20','1','66'),(16,'headimg11.jpg','666','20','1','666'),(17,'headimg3.jpg','111112222','20','1','5555');

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL auto_increment,
  `username` varchar(13) default NULL,
  `password` varchar(20) default NULL,
  `birthday` varchar(255) default NULL,
  `sex` int(1) default NULL,
  `telephone` varchar(225) default NULL,
  `usertype` int(1) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'wd','123','1997-2-11',1,'18680458141',1),(2,'hmp','123','2018-6-15',0,'15151515151',0),(3,'123','123','2018-6-7',0,'15151515151',0),(4,'test','123','2018-6-8',1,'18545427355',0);

#
# Structure for table "voterecord"
#

DROP TABLE IF EXISTS `voterecord`;
CREATE TABLE `voterecord` (
  `Id` int(11) NOT NULL auto_increment,
  `userid` int(11) default NULL,
  `player` int(11) default NULL,
  `fight` int(11) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

#
# Data for table "voterecord"
#

INSERT INTO `voterecord` VALUES (18,3,12,6),(19,3,7,3),(20,3,5,4),(21,3,6,1),(22,4,7,3),(23,2,7,3),(24,1,9,3),(25,1,7,5),(26,1,9,4),(27,1,7,2),(28,1,12,6),(29,1,13,7),(30,3,14,8),(31,1,13,8),(32,1,16,10),(33,1,17,11),(34,1,8,9);
