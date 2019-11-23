-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shoes
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_dept`
--

DROP TABLE IF EXISTS `tb_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门ID',
  `name` varchar(20) NOT NULL COMMENT '部门名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dept`
--

LOCK TABLES `tb_dept` WRITE;
/*!40000 ALTER TABLE `tb_dept` DISABLE KEYS */;
INSERT INTO `tb_dept` VALUES (1,0,'开发部','2019-01-01 00:00:00'),(2,1,'开发一部','2019-02-02 13:08:33'),(3,1,'开发二部','2019-02-02 13:08:57'),(4,0,'测试部','2019-01-01 00:00:00'),(5,4,'测试一部','2019-02-02 13:09:11'),(6,0,'人事部','2019-01-01 00:00:00');
/*!40000 ALTER TABLE `tb_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_item`
--

DROP TABLE IF EXISTS `tb_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `picture` varchar(500) CHARACTER SET latin1 NOT NULL COMMENT '图片',
  `title` varchar(100) NOT NULL,
  `price` double(6,2) NOT NULL COMMENT '价格',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上架时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item`
--

LOCK TABLES `tb_item` WRITE;
/*!40000 ALTER TABLE `tb_item` DISABLE KEYS */;
INSERT INTO `tb_item` VALUES (1,'雪地靴','/img/item/1.jpg','百丽雪地靴2019冬新商场同款加绒户外风工装保暖靴',499.00,'2019-11-18 04:16:36'),(2,'雪地靴','/img/item/2.jpg','百丽雪地靴女2019冬新款休闲加绒保暖毛靴',499.00,'2019-11-18 04:36:16'),(6,'马丁靴','/img/item/3.jpg','百丽6孔马丁靴女2019冬商场新款加绒保暖厚底短靴',749.00,'2019-11-21 14:16:02'),(7,'马丁靴','/img/item/4.jpg','百丽黑天鹅007马丁靴女2019新款张嘉倪同款短靴',699.00,'2019-11-21 14:16:02'),(8,'马丁靴','/img/item/6.jpg','百丽8孔马丁靴2019冬商场新款女加绒保暖英伦短靴',799.00,'2019-11-21 14:16:02'),(9,'马丁靴','/img/item/4.jpg','百丽高帮潮靴女2019秋新商场同款厚底系带休闲马丁靴',599.00,'2019-11-23 07:06:41'),(10,'马丁靴','/img/item/8.jpg','百丽方跟马丁靴2019冬新商场同款休闲牛皮加绒保暖女短靴',599.00,'2019-11-23 07:14:49');
/*!40000 ALTER TABLE `tb_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_item_color`
--

DROP TABLE IF EXISTS `tb_item_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_item_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL COMMENT '款号',
  `color` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item_color`
--

LOCK TABLES `tb_item_color` WRITE;
/*!40000 ALTER TABLE `tb_item_color` DISABLE KEYS */;
INSERT INTO `tb_item_color` VALUES (1,1,'卡其'),(2,1,'酒红'),(3,1,'黑色'),(4,2,'浅粉'),(5,2,'浅棕'),(6,2,'米白'),(8,6,'黑色'),(9,6,'白色'),(10,7,'黑单里'),(11,7,'黑里绒'),(12,7,'白里绒'),(13,8,'黑色'),(14,8,'米白色'),(15,9,'粉色'),(16,9,'杏色'),(17,10,'粉色'),(18,10,'杏色');
/*!40000 ALTER TABLE `tb_item_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_item_size`
--

DROP TABLE IF EXISTS `tb_item_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_item_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `size` varchar(20) NOT NULL COMMENT '尺码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item_size`
--

LOCK TABLES `tb_item_size` WRITE;
/*!40000 ALTER TABLE `tb_item_size` DISABLE KEYS */;
INSERT INTO `tb_item_size` VALUES (1,1,'35'),(2,1,'36'),(3,1,'37'),(4,1,'38'),(5,1,'39'),(6,1,'40'),(7,2,'34'),(8,2,'35'),(9,6,'34'),(10,6,'35'),(11,6,'36'),(12,6,'37'),(13,6,'38'),(14,6,'39'),(15,6,'40'),(16,2,'36'),(17,2,'37'),(18,2,'38'),(19,2,'39'),(20,7,'34'),(21,7,'35'),(22,7,'36'),(23,7,'37'),(24,7,'38'),(25,7,'39'),(26,7,'40'),(27,8,'34'),(28,8,'35'),(29,8,'36'),(30,8,'37'),(31,8,'38'),(32,8,'39'),(33,8,'40'),(34,9,'34'),(35,9,'35'),(36,9,'36'),(37,9,'37'),(38,9,'38'),(39,9,'39'),(40,9,'40'),(41,10,'34'),(42,10,'35'),(43,10,'36'),(44,10,'37'),(45,10,'38'),(46,10,'39'),(47,10,'40');
/*!40000 ALTER TABLE `tb_item_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_log`
--

DROP TABLE IF EXISTS `tb_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(20) DEFAULT NULL COMMENT '操作描述',
  `time` bigint(20) DEFAULT NULL COMMENT '耗时(毫秒)',
  `method` varchar(100) DEFAULT NULL COMMENT '操作方法',
  `params` varchar(255) DEFAULT NULL COMMENT '操作参数',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `location` varchar(20) DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COMMENT='系统日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_log`
--

LOCK TABLES `tb_log` WRITE;
/*!40000 ALTER TABLE `tb_log` DISABLE KEYS */;
INSERT INTO `tb_log` VALUES (1,'admin','查看用户列表',20,'cn.tycoding.system.controller.UserController.queryList()',' queryPage\"QueryPage(pageCode=1, pageSize=6)\" user\"User(id=null, username=null, password=null, salt=null, deptId=null, deptName=null, createTime=null, modifyTime=null, avatar=null, phone=null, sex=null, description=null, status=null)\"','127.0.0.1','2019-03-13 00:42:34','内网IP|0|0|内网IP|内网IP'),(7,'admin','更新用户',83,'cn.tycoding.system.controller.UserController.update()',' user\"UserWithRole(roleId=1, roleIds=[1])\"','127.0.0.1','2019-03-13 01:21:48','内网IP|0|0|内网IP|内网IP'),(10,'admin','删除用户',65,'cn.tycoding.system.controller.UserController.delete()',' ids\"[9]\"','127.0.0.1','2019-03-13 05:00:56','内网IP|0|0|内网IP|内网IP'),(11,'admin','删除用户',9,'cn.tycoding.system.controller.UserController.delete()',' ids\"[9]\"','127.0.0.1','2019-03-13 05:01:18','内网IP|0|0|内网IP|内网IP'),(12,'admin','删除登录日志',39,'cn.tycoding.monitor.controller.LoginLogController.delete()',' ids\"[3]\"','127.0.0.1','2019-03-13 05:13:03','内网IP|0|0|内网IP|内网IP'),(13,'admin','删除日志',44,'cn.tycoding.monitor.controller.LogController.delete()',' ids\"[8]\"','127.0.0.1','2019-03-13 05:15:54','内网IP|0|0|内网IP|内网IP'),(14,'admin','删除日志',9,'cn.tycoding.monitor.controller.LogController.delete()',' ids\"[9]\"','127.0.0.1','2019-03-13 05:15:58','内网IP|0|0|内网IP|内网IP'),(15,'admin','删除七牛云文件',378,'cn.tycoding.storage.controller.QiniuController.delete()',' name\"ss1074261491006988288.jpg\"','127.0.0.1','2019-03-13 08:30:31','内网IP|0|0|内网IP|内网IP'),(16,'admin','更新七牛云文件名',430,'cn.tycoding.storage.controller.QiniuController.update()',' oldname\"ss1074213185631420416.png\" newname\"1074213185631420416.png\"','127.0.0.1','2019-03-13 08:32:56','内网IP|0|0|内网IP|内网IP'),(17,'admin','上传七牛云文件',1948,'cn.tycoding.storage.controller.QiniuController.upload()',' file\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@576e7f4b\" request: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest@5ac44dd6','127.0.0.1','2019-03-13 19:14:19','内网IP|0|0|内网IP|内网IP'),(18,'admin','添加用户',96,'cn.tycoding.system.controller.UserController.add()',' user\"UserWithRole(roleId=null, roleIds=[3])\"','127.0.0.1','2019-03-14 08:27:07','内网IP|0|0|内网IP|内网IP'),(19,'admin','文件上传',7,'cn.tycoding.storage.controller.UploadController.upload()',' file\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@150e5550\" request: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest@38af3773','127.0.0.1','2019-03-14 08:27:50','内网IP|0|0|内网IP|内网IP'),(20,'admin','更新用户',19,'cn.tycoding.system.controller.UserController.update()',' user\"UserWithRole(roleId=3, roleIds=[3])\"','127.0.0.1','2019-03-14 08:28:01','内网IP|0|0|内网IP|内网IP'),(21,'admin','上传七牛云文件',2087,'cn.tycoding.storage.controller.QiniuController.upload()',' file\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@367a9b8b\" request: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest@322fa353','127.0.0.1','2019-03-14 08:29:17','内网IP|0|0|内网IP|内网IP'),(22,'admin','更新用户',19,'cn.tycoding.system.controller.UserController.update()',' user\"UserWithRole(roleId=3, roleIds=[3])\"','127.0.0.1','2019-03-14 08:29:21','内网IP|0|0|内网IP|内网IP'),(23,'tycoding','添加用户',22,'cn.tycoding.system.controller.UserController.add()',' user\"UserWithRole(roleId=null, roleIds=[2])\"','127.0.0.1','2019-03-15 22:54:35','内网IP|0|0|内网IP|内网IP'),(24,'tycoding','更新用户',22,'cn.tycoding.system.controller.UserController.update()',' user\"UserWithRole(roleId=2, roleIds=[2])\"','127.0.0.1','2019-03-15 22:56:35','内网IP|0|0|内网IP|内网IP'),(25,'tycoding','商品列表',55,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-20 12:27:06','内网IP|0|0|内网IP|内网IP'),(26,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-20 12:27:17','内网IP|0|0|内网IP|内网IP'),(27,'tycoding','商品列表',76,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-20 13:46:05','内网IP|0|0|内网IP|内网IP'),(28,'tycoding','商品列表',5,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-20 13:46:18','内网IP|0|0|内网IP|内网IP'),(29,'tycoding','商品列表',105,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-20 13:49:01','内网IP|0|0|内网IP|内网IP'),(30,'tycoding','商品列表',141,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:11:08','内网IP|0|0|内网IP|内网IP'),(31,'tycoding','商品列表',17,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=xuex, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:18:52','内网IP|0|0|内网IP|内网IP'),(32,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=雪地靴, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:19:01','内网IP|0|0|内网IP|内网IP'),(33,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:19:05','内网IP|0|0|内网IP|内网IP'),(34,'tycoding','商品列表',9,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:19:11','内网IP|0|0|内网IP|内网IP'),(35,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:19:15','内网IP|0|0|内网IP|内网IP'),(36,'tycoding','商品列表',5,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:19:19','内网IP|0|0|内网IP|内网IP'),(37,'tycoding','商品列表',9,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:26:58','内网IP|0|0|内网IP|内网IP'),(38,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:27:06','内网IP|0|0|内网IP|内网IP'),(39,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:28:25','内网IP|0|0|内网IP|内网IP'),(40,'tycoding','商品列表',93,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:45:12','内网IP|0|0|内网IP|内网IP'),(41,'tycoding','商品列表',11,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:46:52','内网IP|0|0|内网IP|内网IP'),(42,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:46:54','内网IP|0|0|内网IP|内网IP'),(43,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:47:08','内网IP|0|0|内网IP|内网IP'),(44,'tycoding','商品列表',94,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:49:12','内网IP|0|0|内网IP|内网IP'),(45,'tycoding','商品列表',13,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 08:56:41','内网IP|0|0|内网IP|内网IP'),(46,'tycoding','商品列表',14,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 09:02:39','内网IP|0|0|内网IP|内网IP'),(47,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, filedTime=null)','127.0.0.1','2019-11-21 09:02:51','内网IP|0|0|内网IP|内网IP'),(48,'tycoding','商品列表',17,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:17:07','内网IP|0|0|内网IP|内网IP'),(49,'tycoding','商品列表',20,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=2019-11-13 00:00:00,2019-11-21 00:00:00)','127.0.0.1','2019-11-21 09:17:12','内网IP|0|0|内网IP|内网IP'),(50,'tycoding','商品列表',4,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=2019-11-20 00:00:00,2019-11-20 00:00:00)','127.0.0.1','2019-11-21 09:17:36','内网IP|0|0|内网IP|内网IP'),(51,'tycoding','商品列表',3,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=2019-11-21 00:00:00,2019-11-21 00:00:00)','127.0.0.1','2019-11-21 09:17:40','内网IP|0|0|内网IP|内网IP'),(52,'tycoding','商品列表',5,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=2019-11-20 00:00:00,2019-11-20 00:00:00)','127.0.0.1','2019-11-21 09:17:47','内网IP|0|0|内网IP|内网IP'),(53,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=2019-11-18 00:00:00,2019-11-18 00:00:00)','127.0.0.1','2019-11-21 09:17:52','内网IP|0|0|内网IP|内网IP'),(54,'tycoding','商品列表',5,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=2,0)','127.0.0.1','2019-11-21 09:17:54','内网IP|0|0|内网IP|内网IP'),(55,'tycoding','商品列表',5,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=2,,)','127.0.0.1','2019-11-21 09:17:54','内网IP|0|0|内网IP|内网IP'),(56,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=2,,)','127.0.0.1','2019-11-21 09:17:55','内网IP|0|0|内网IP|内网IP'),(57,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=2,,)','127.0.0.1','2019-11-21 09:17:56','内网IP|0|0|内网IP|内网IP'),(58,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=)','127.0.0.1','2019-11-21 09:18:00','内网IP|0|0|内网IP|内网IP'),(59,'tycoding','商品列表',85,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:19:36','内网IP|0|0|内网IP|内网IP'),(60,'tycoding','商品列表',95,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:32:20','内网IP|0|0|内网IP|内网IP'),(61,'tycoding','商品列表',10,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:37:33','内网IP|0|0|内网IP|内网IP'),(62,'tycoding','商品列表',92,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:38:06','内网IP|0|0|内网IP|内网IP'),(63,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:38:40','内网IP|0|0|内网IP|内网IP'),(64,'tycoding','商品列表',13,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:40:43','内网IP|0|0|内网IP|内网IP'),(65,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:40:50','内网IP|0|0|内网IP|内网IP'),(66,'tycoding','商品列表',9,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:42:11','内网IP|0|0|内网IP|内网IP'),(67,'tycoding','商品列表',11,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:43:37','内网IP|0|0|内网IP|内网IP'),(68,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 09:44:26','内网IP|0|0|内网IP|内网IP'),(69,'tycoding','商品列表',51,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 11:49:57','内网IP|0|0|内网IP|内网IP'),(70,'tycoding','商品列表',89,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:00:26','内网IP|0|0|内网IP|内网IP'),(71,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:01:20','内网IP|0|0|内网IP|内网IP'),(72,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:01:35','内网IP|0|0|内网IP|内网IP'),(73,'tycoding','商品列表',76,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:07:47','内网IP|0|0|内网IP|内网IP'),(74,'tycoding','商品列表',76,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:11:09','内网IP|0|0|内网IP|内网IP'),(75,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:18:39','内网IP|0|0|内网IP|内网IP'),(76,'tycoding','商品列表',129,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:22:29','内网IP|0|0|内网IP|内网IP'),(77,'tycoding','商品列表',82,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:23:39','内网IP|0|0|内网IP|内网IP'),(78,'tycoding','商品列表',11,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:24:19','内网IP|0|0|内网IP|内网IP'),(79,'tycoding','商品列表',91,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:39:29','内网IP|0|0|内网IP|内网IP'),(80,'tycoding','商品列表',121,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:44:43','内网IP|0|0|内网IP|内网IP'),(81,'tycoding','商品列表',117,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:48:31','内网IP|0|0|内网IP|内网IP'),(82,'tycoding','商品列表',120,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:51:21','内网IP|0|0|内网IP|内网IP'),(83,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:51:33','内网IP|0|0|内网IP|内网IP'),(84,'tycoding','商品列表',24,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 12:58:19','内网IP|0|0|内网IP|内网IP'),(85,'tycoding','商品列表',12,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:06:19','内网IP|0|0|内网IP|内网IP'),(86,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:06:23','内网IP|0|0|内网IP|内网IP'),(87,'tycoding','商品列表',13,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:20:26','内网IP|0|0|内网IP|内网IP'),(88,'tycoding','编辑商品',4,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=2, type=雪地靴, picture=/img/item/2.jpg, title=百丽雪地靴女2019冬新款休闲加绒保暖毛靴, price=499.0, time=Mon Nov 18 20:36:16 CST 2019, color=浅粉,浅棕,米白, size=34,35)','127.0.0.1','2019-11-21 13:20:30','内网IP|0|0|内网IP|内网IP'),(89,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:20:30','内网IP|0|0|内网IP|内网IP'),(90,'tycoding','编辑商品',0,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=2, type=雪地靴, picture=/img/item/2.jpg, title=百丽雪地靴女2019冬新款休闲加绒保暖毛靴, price=499.0, time=Mon Nov 18 20:36:16 CST 2019, color=浅粉,浅棕,米白, size=34,35,36)','127.0.0.1','2019-11-21 13:20:37','内网IP|0|0|内网IP|内网IP'),(91,'tycoding','商品列表',4,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:20:37','内网IP|0|0|内网IP|内网IP'),(92,'tycoding','编辑商品',0,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=2, type=雪地靴, picture=/img/item/2.jpg, title=百丽雪地靴女2019冬新款休闲加绒保暖毛靴, price=499.0, time=Mon Nov 18 20:36:16 CST 2019, color=浅粉,浅棕,米白, size=34,35,36)','127.0.0.1','2019-11-21 13:21:23','内网IP|0|0|内网IP|内网IP'),(93,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:21:23','内网IP|0|0|内网IP|内网IP'),(94,'tycoding','编辑商品',0,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=2, type=马丁靴, picture=/img/item/3.jpg, title=百丽6孔马丁靴女2019冬商场新款加绒保暖厚底短靴, price=749.0, time=Mon Nov 18 20:36:16 CST 2019, color=黑色,白色, size=34,35,36,37,38,39,40)','127.0.0.1','2019-11-21 13:29:57','内网IP|0|0|内网IP|内网IP'),(95,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:29:57','内网IP|0|0|内网IP|内网IP'),(96,'tycoding','编辑商品',0,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=2, type=, picture=, title=百丽6孔马丁靴女2019冬商场新款加绒保暖厚底短靴, price=null, time=Mon Nov 18 20:36:16 CST 2019, color=, size=)','127.0.0.1','2019-11-21 13:31:12','内网IP|0|0|内网IP|内网IP'),(97,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:31:12','内网IP|0|0|内网IP|内网IP'),(98,'tycoding','编辑商品',0,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=2, type=, picture=, title=百丽6孔马丁靴女2019冬商场新款加绒保暖厚底短靴, price=null, time=Mon Nov 18 20:36:16 CST 2019, color=, size=)','127.0.0.1','2019-11-21 13:35:23','内网IP|0|0|内网IP|内网IP'),(99,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:35:23','内网IP|0|0|内网IP|内网IP'),(100,'tycoding','商品列表',4,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:48:24','内网IP|0|0|内网IP|内网IP'),(101,'tycoding','编辑商品',0,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=null, type=, picture=, title=百丽6孔马丁靴女2019冬商场新款加绒保暖厚底短靴, price=null, time=null, color=, size=)','127.0.0.1','2019-11-21 13:48:32','内网IP|0|0|内网IP|内网IP'),(102,'tycoding','商品列表',4,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:48:32','内网IP|0|0|内网IP|内网IP'),(103,'tycoding','商品列表',88,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:51:20','内网IP|0|0|内网IP|内网IP'),(104,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:51:24','内网IP|0|0|内网IP|内网IP'),(105,'tycoding','商品列表',11,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:51:31','内网IP|0|0|内网IP|内网IP'),(106,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:51:40','内网IP|0|0|内网IP|内网IP'),(107,'tycoding','商品列表',81,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:53:10','内网IP|0|0|内网IP|内网IP'),(108,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:53:11','内网IP|0|0|内网IP|内网IP'),(109,'tycoding','商品列表',4,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:53:14','内网IP|0|0|内网IP|内网IP'),(110,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:54:48','内网IP|0|0|内网IP|内网IP'),(111,'tycoding','商品列表',5,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:55:57','内网IP|0|0|内网IP|内网IP'),(112,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 13:56:34','内网IP|0|0|内网IP|内网IP'),(113,'tycoding','商品列表',13935,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 14:00:37','内网IP|0|0|内网IP|内网IP'),(114,'tycoding','商品列表',108,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 14:02:41','内网IP|0|0|内网IP|内网IP'),(115,'tycoding','商品列表',9,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 14:03:35','内网IP|0|0|内网IP|内网IP'),(116,'tycoding','商品列表',124,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 14:13:45','内网IP|0|0|内网IP|内网IP'),(117,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 14:14:48','内网IP|0|0|内网IP|内网IP'),(118,'tycoding','添加商品',12395,'cn.tycoding.item.controller.ItemController.add()',' itemModel: ItemModel(id=null, type=马丁靴, picture=/img/item/3.jpg, title=百丽6孔马丁靴女2019冬商场新款加绒保暖厚底短靴, price=749.0, time=null, color=黑色, size=34,35,36,37,38,39,40)','127.0.0.1','2019-11-21 14:16:10','内网IP|0|0|内网IP|内网IP'),(119,'tycoding','商品列表',10,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-21 14:16:10','内网IP|0|0|内网IP|内网IP'),(120,'tycoding','商品列表',44,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 05:52:20','内网IP|0|0|内网IP|内网IP'),(121,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 05:52:36','内网IP|0|0|内网IP|内网IP'),(122,'tycoding','商品列表',83,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 05:53:43','内网IP|0|0|内网IP|内网IP'),(123,'tycoding','编辑商品',27,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=6, type=马丁靴, picture=/img/item/3.jpg, title=百丽6孔马丁靴女2019冬商场新款加绒保暖厚底短靴, price=749.0, time=Fri Nov 22 06:16:02 CST 2019, color=黑色,白色, size=34,35,36,37,38,39,40)','127.0.0.1','2019-11-23 05:53:52','内网IP|0|0|内网IP|内网IP'),(124,'tycoding','商品列表',10,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 05:53:52','内网IP|0|0|内网IP|内网IP'),(125,'tycoding','编辑商品',36,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=2, type=雪地靴, picture=/img/item/2.jpg, title=百丽雪地靴女2019冬新款休闲加绒保暖毛靴, price=499.0, time=Mon Nov 18 20:36:16 CST 2019, color=浅粉,浅棕,米白, size=34,35,36,37,38,39)','127.0.0.1','2019-11-23 05:54:32','内网IP|0|0|内网IP|内网IP'),(126,'tycoding','商品列表',5,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 05:54:32','内网IP|0|0|内网IP|内网IP'),(127,'tycoding','添加商品',55,'cn.tycoding.item.controller.ItemController.add()',' itemModel: ItemModel(id=null, type=马丁靴, picture=/img/item/4.jpg, title=百丽黑天鹅007马丁靴女2019新款张嘉倪同款短靴, price=699.0, time=Fri Nov 22 06:16:02 CST 2019, color=黑单里,黑里绒,白里绒, size=34,35,36,37,38,39,40)','127.0.0.1','2019-11-23 05:57:52','内网IP|0|0|内网IP|内网IP'),(128,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 05:57:52','内网IP|0|0|内网IP|内网IP'),(129,'tycoding','编辑商品',15,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=7, type=马丁靴, picture=/img/item/4.jpg, title=百丽黑天鹅007马丁靴女2019新款张嘉倪同款短靴, price=699.0, time=Fri Nov 22 06:16:02 CST 2019, color=黑单里,黑里绒,白里绒, size=34,35,36,37,38,39,40)','127.0.0.1','2019-11-23 05:58:04','内网IP|0|0|内网IP|内网IP'),(130,'tycoding','商品列表',4,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 05:58:04','内网IP|0|0|内网IP|内网IP'),(131,'tycoding','商品列表',9,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 05:59:28','内网IP|0|0|内网IP|内网IP'),(132,'tycoding','编辑商品',10,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=7, type=马丁靴, picture=/img/item/3.jpg, title=百丽黑天鹅007马丁靴女2019新款张嘉倪同款短靴, price=699.0, time=Fri Nov 22 06:16:02 CST 2019, color=黑单里,黑里绒,白里绒, size=34,35,36,37,38,39,40)','127.0.0.1','2019-11-23 05:59:56','内网IP|0|0|内网IP|内网IP'),(133,'tycoding','商品列表',4,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 05:59:56','内网IP|0|0|内网IP|内网IP'),(134,'tycoding','编辑商品',9,'cn.tycoding.item.controller.ItemController.update()',' itemModel: ItemModel(id=7, type=马丁靴, picture=/img/item/4.jpg, title=百丽黑天鹅007马丁靴女2019新款张嘉倪同款短靴, price=699.0, time=Fri Nov 22 06:16:02 CST 2019, color=黑单里,黑里绒,白里绒, size=34,35,36,37,38,39,40)','127.0.0.1','2019-11-23 06:00:01','内网IP|0|0|内网IP|内网IP'),(135,'tycoding','商品列表',5,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 06:00:01','内网IP|0|0|内网IP|内网IP'),(136,'tycoding','商品列表',10,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 06:01:31','内网IP|0|0|内网IP|内网IP'),(137,'tycoding','商品列表',4,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 06:01:34','内网IP|0|0|内网IP|内网IP'),(138,'tycoding','商品列表',77,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 06:04:53','内网IP|0|0|内网IP|内网IP'),(139,'tycoding','商品列表',8,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 06:06:07','内网IP|0|0|内网IP|内网IP'),(140,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 06:38:13','内网IP|0|0|内网IP|内网IP'),(141,'tycoding','商品列表',106,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 06:42:37','内网IP|0|0|内网IP|内网IP'),(142,'tycoding','添加商品',57,'cn.tycoding.item.controller.ItemController.add()',' itemModel: ItemModel(id=null, type=马丁靴, picture=/img/item/6.jpg, title=百丽8孔马丁靴2019冬商场新款女加绒保暖英伦短靴, price=799.0, time=Fri Nov 22 06:16:02 CST 2019, color=黑色,米白色, size=34,35,36,37,38,39,40)','127.0.0.1','2019-11-23 06:49:23','内网IP|0|0|内网IP|内网IP'),(143,'tycoding','商品列表',5,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 06:49:23','内网IP|0|0|内网IP|内网IP'),(144,'tycoding','商品列表',12,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 06:49:44','内网IP|0|0|内网IP|内网IP'),(145,'tycoding','添加商品',45,'cn.tycoding.item.controller.ItemController.add()',' itemModel: ItemModel(id=null, type=马丁靴, picture=/img/item/4.jpg, title=百丽高帮潮靴女2019秋新商场同款厚底系带休闲马丁靴, price=599.0, time=null, color=粉色,杏色, size=34,35,36,37,38,39,40)','127.0.0.1','2019-11-23 07:06:42','内网IP|0|0|内网IP|内网IP'),(146,'tycoding','商品列表',7,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 07:06:42','内网IP|0|0|内网IP|内网IP'),(147,'tycoding','商品列表',85,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 07:10:25','内网IP|0|0|内网IP|内网IP'),(148,'tycoding','商品列表',83,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 15:11:54','内网IP|0|0|内网IP|内网IP'),(149,'tycoding','添加商品',62,'cn.tycoding.item.controller.ItemController.add()',' itemModel: ItemModel(id=null, type=马丁靴, picture=/img/item/8.jpg, title=百丽方跟马丁靴2019冬新商场同款休闲牛皮加绒保暖女短靴, price=599.0, time=null, color=粉色,杏色, size=34,35,36,37,38,39,40)','127.0.0.1','2019-11-23 15:14:50','内网IP|0|0|内网IP|内网IP'),(150,'tycoding','商品列表',6,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 15:14:50','内网IP|0|0|内网IP|内网IP'),(151,'tycoding','商品列表',60,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 16:07:25','内网IP|0|0|内网IP|内网IP'),(152,'tycoding','商品列表',54,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 16:08:39','内网IP|0|0|内网IP|内网IP'),(153,'tycoding','商品列表',41,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 16:10:59','内网IP|0|0|内网IP|内网IP'),(154,'tycoding','商品列表',61,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 16:12:19','内网IP|0|0|内网IP|内网IP'),(155,'tycoding','商品列表',60,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 17:19:48','内网IP|0|0|内网IP|内网IP'),(156,'tycoding','商品列表',44,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 17:26:59','内网IP|0|0|内网IP|内网IP'),(157,'tycoding','商品列表',69,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 17:39:26','内网IP|0|0|内网IP|内网IP'),(158,'tycoding','商品列表',55,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 17:48:56','内网IP|0|0|内网IP|内网IP'),(159,'tycoding','商品列表',47,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 17:49:56','内网IP|0|0|内网IP|内网IP'),(160,'tycoding','商品列表',50,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 17:51:08','内网IP|0|0|内网IP|内网IP'),(161,'tycoding','商品列表',57,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 17:52:46','内网IP|0|0|内网IP|内网IP'),(162,'tycoding','商品列表',46,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 17:56:17','内网IP|0|0|内网IP|内网IP'),(163,'tycoding','商品列表',57,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 17:59:44','内网IP|0|0|内网IP|内网IP'),(164,'tycoding','商品列表',51,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 18:04:19','内网IP|0|0|内网IP|内网IP'),(165,'tycoding','商品列表',4,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 18:04:53','内网IP|0|0|内网IP|内网IP'),(166,'tycoding','商品列表',45,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 18:05:16','内网IP|0|0|内网IP|内网IP'),(167,'tycoding','商品列表',57,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 18:08:13','内网IP|0|0|内网IP|内网IP'),(168,'tycoding','商品列表',46,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 18:09:24','内网IP|0|0|内网IP|内网IP'),(169,'tycoding','商品列表',53,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 18:13:38','内网IP|0|0|内网IP|内网IP'),(170,'tycoding','商品列表',5,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 18:14:42','内网IP|0|0|内网IP|内网IP'),(171,'tycoding','商品列表',20,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 20:11:02','内网IP|0|0|内网IP|内网IP'),(172,'tycoding','商品列表',73,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 20:17:32','内网IP|0|0|内网IP|内网IP'),(173,'tycoding','商品列表',58,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 20:33:30','内网IP|0|0|内网IP|内网IP'),(174,'tycoding','商品列表',10,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 20:40:17','内网IP|0|0|内网IP|内网IP'),(175,'tycoding','商品列表',71,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 20:51:00','内网IP|0|0|内网IP|内网IP'),(176,'tycoding','商品列表',4,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 20:51:13','内网IP|0|0|内网IP|内网IP'),(177,'tycoding','商品列表',52,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:15:04','内网IP|0|0|内网IP|内网IP'),(178,'tycoding','商品列表',8,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:15:45','内网IP|0|0|内网IP|内网IP'),(179,'tycoding','商品列表',87,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:19:10','内网IP|0|0|内网IP|内网IP'),(180,'tycoding','商品列表',49,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:22:10','内网IP|0|0|内网IP|内网IP'),(181,'tycoding','商品列表',34,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:28:33','内网IP|0|0|内网IP|内网IP'),(182,'tycoding','商品列表',179,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 21:28:36','内网IP|0|0|内网IP|内网IP'),(183,'tycoding','商品列表',7,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:29:09','内网IP|0|0|内网IP|内网IP'),(184,'tycoding','商品列表',51,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:32:08','内网IP|0|0|内网IP|内网IP'),(185,'tycoding','商品列表',58,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:49:53','内网IP|0|0|内网IP|内网IP'),(186,'tycoding','商品列表',68,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:52:40','内网IP|0|0|内网IP|内网IP'),(187,'tycoding','编辑商品',20,'cn.tycoding.item.controller.NewsController.update()',' news: News(id=1, title=2019冬季上新, picture=/img/item/1.jpg, time=Sat Nov 23 05:30:25 CST 2019, content=快来看看本季最美雪地靴吧)','127.0.0.1','2019-11-23 21:53:34','内网IP|0|0|内网IP|内网IP'),(188,'tycoding','商品列表',3,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:53:34','内网IP|0|0|内网IP|内网IP'),(189,'tycoding','商品列表',55,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:57:36','内网IP|0|0|内网IP|内网IP'),(190,'tycoding','编辑商品',15,'cn.tycoding.item.controller.NewsController.update()',' news: News(id=1, title=2019双十二预热, picture=/img/item/2.jpg, time=Sat Nov 23 05:30:25 CST 2019, content=双十二预热！！欢迎加购，购物满999有好礼相送！！)','127.0.0.1','2019-11-23 21:58:22','内网IP|0|0|内网IP|内网IP'),(191,'tycoding','商品列表',5,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:58:22','内网IP|0|0|内网IP|内网IP'),(192,'tycoding','商品列表',11,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 21:58:25','内网IP|0|0|内网IP|内网IP'),(193,'tycoding','商品列表',27,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 22:00:41','内网IP|0|0|内网IP|内网IP'),(194,'tycoding','编辑商品',17,'cn.tycoding.item.controller.NewsController.update()',' news: News(id=null, title=2019冬上新, picture=/img/item/1.jpg, time=null, content=冬季雪地靴上架了~)','127.0.0.1','2019-11-23 22:05:14','内网IP|0|0|内网IP|内网IP'),(195,'tycoding','商品列表',18,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 22:05:14','内网IP|0|0|内网IP|内网IP'),(196,'tycoding','商品列表',4,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 22:05:20','内网IP|0|0|内网IP|内网IP'),(197,'tycoding','商品列表',69,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 22:07:18','内网IP|0|0|内网IP|内网IP'),(198,'tycoding','商品列表',3,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 22:07:51','内网IP|0|0|内网IP|内网IP'),(199,'tycoding','商品列表',66,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 22:11:01','内网IP|0|0|内网IP|内网IP'),(200,'tycoding','添加商品',20,'cn.tycoding.item.controller.NewsController.add()',' news: News(id=2, title=2019冬上新, picture=/img/item/1.jpg, time=null, content=雪地靴上架了 快来选购~~)','127.0.0.1','2019-11-23 22:11:30','内网IP|0|0|内网IP|内网IP'),(201,'tycoding','商品列表',4,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 22:11:30','内网IP|0|0|内网IP|内网IP'),(202,'tycoding','商品列表',61,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 22:15:20','内网IP|0|0|内网IP|内网IP'),(203,'tycoding','商品列表',53,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 22:15:30','内网IP|0|0|内网IP|内网IP'),(204,'tycoding','商品列表',17,'cn.tycoding.item.controller.NewsController.getNews()',' news: News(id=null, title=null, picture=null, time=null, content=null)','127.0.0.1','2019-11-23 22:18:34','内网IP|0|0|内网IP|内网IP'),(205,'tycoding','商品列表',31,'cn.tycoding.item.controller.ItemController.getItemByFields()',' queryPage\"QueryPage(pageCode=1, pageSize=10)\" item: Item(id=null, type=null, picture=null, title=null, price=null, time=null, timeField=null)','127.0.0.1','2019-11-23 22:19:00','内网IP|0|0|内网IP|内网IP');
/*!40000 ALTER TABLE `tb_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_login_log`
--

DROP TABLE IF EXISTS `tb_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `location` varchar(255) DEFAULT NULL COMMENT '登录地点',
  `create_time` datetime DEFAULT NULL COMMENT '登录时间',
  `device` varchar(255) DEFAULT NULL COMMENT '登录设备',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_login_log`
--

LOCK TABLES `tb_login_log` WRITE;
/*!40000 ALTER TABLE `tb_login_log` DISABLE KEYS */;
INSERT INTO `tb_login_log` VALUES (1,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 04:36:13','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(4,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 06:15:56','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(5,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 08:05:34','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(6,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 08:52:32','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(7,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 18:31:09','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(8,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 20:33:47','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(9,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 21:32:03','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(10,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 01:03:48','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(11,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 01:39:52','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(12,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 05:25:56','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(13,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 06:39:46','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(14,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 18:34:34','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(15,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 19:04:50','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(16,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 03:08:48','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(17,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 05:31:11','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(18,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 05:35:07','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(19,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 06:09:02','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(20,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 20:18:15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(21,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 20:54:48','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(22,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 21:51:47','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(23,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 22:01:24','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(24,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 22:04:35','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(25,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 22:49:37','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(26,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-18 07:23:58','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36'),(27,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 08:20:12','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(28,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 09:08:06','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(29,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 12:08:37','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(30,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 13:44:00','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(31,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 13:44:34','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(32,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 13:46:14','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(33,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 14:09:00','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(34,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 14:10:28','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(35,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-20 12:27:03','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(36,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-20 13:46:01','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(37,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-21 08:11:05','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(38,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-21 11:49:54','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(39,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-23 05:52:17','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(40,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-23 06:38:04','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(41,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-23 15:53:33','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(42,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-23 17:17:50','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(43,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-23 20:10:58','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14');
/*!40000 ALTER TABLE `tb_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源编号',
  `name` varchar(20) NOT NULL COMMENT '资源名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `url` varchar(100) DEFAULT NULL COMMENT 'URL',
  `perms` text COMMENT '权限标识',
  `type` varchar(20) NOT NULL COMMENT '类型：如button按钮 menu菜单',
  `icon` varchar(30) DEFAULT NULL COMMENT '菜单图标',
  `priority` bigint(20) DEFAULT NULL COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0锁定 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,'系统管理',0,NULL,NULL,'menu','fa fa-gear',0,'2019-01-01 00:00:00',1),(2,'用户管理',1,'/system/user','user:list','menu',NULL,1,'2019-01-01 00:00:00',1),(3,'角色管理',1,'/system/role','role:list','menu',NULL,2,'2019-01-01 00:00:00',1),(4,'菜单管理',1,'/system/menu','menu:list','menu',NULL,3,'2019-01-01 00:00:00',1),(5,'部门管理',1,'/system/dept','dept:list','menu',NULL,NULL,'2019-02-14 13:19:56',1),(6,'新增用户',2,NULL,'user:add','button',NULL,1,'2019-01-01 00:00:00',1),(7,'修改用户',2,NULL,'user:update','button',NULL,2,'2019-01-01 00:00:00',1),(8,'删除用户',2,NULL,'user:delete','button',NULL,1,'2019-01-01 00:00:00',1),(9,'新增角色',3,NULL,'role:add','button',NULL,2,'2019-01-01 00:00:00',1),(10,'修改角色',3,NULL,'role:update','button',NULL,NULL,'2019-03-15 13:46:26',0),(11,'删除用户',3,NULL,'role:delete','button',NULL,NULL,'2019-03-15 13:47:14',0),(12,'新增菜单',4,NULL,'menu:add','button',NULL,NULL,'2019-03-15 13:47:55',0),(13,'修改菜单',4,NULL,'menu:update','button',NULL,NULL,'2019-03-15 13:47:55',0),(14,'删除菜单',4,NULL,'menu:delete','button',NULL,NULL,'2019-03-15 13:47:14',0),(15,'新增部门',5,NULL,'dept:add','button',NULL,NULL,'2019-03-15 13:47:14',0),(16,'修改部门',5,NULL,'dept:update','button',NULL,NULL,'2019-03-15 13:47:14',0),(17,'删除部门',5,NULL,'dept:delete','button',NULL,NULL,'2019-03-15 13:47:14',0),(18,'系统监控',0,NULL,NULL,'menu','fa fa-shield',0,'2019-02-05 09:07:39',1),(19,'在线用户',18,'/monitor/online','online:list','menu',NULL,NULL,'2019-02-14 14:29:53',1),(20,'登录日志',18,'/monitor/loginlog','loginlog:list','menu',NULL,NULL,'2019-02-14 14:31:54',0),(21,'系统日志',18,'/monitor/log','log:list','menu',NULL,1,'2019-02-05 09:09:36',1),(22,'Redis监控',18,'/monitor/redis/monitor','redis:list','menu',NULL,1,'2019-02-05 09:10:28',1),(23,'Druid监控',18,'/monitor/druid','druid:list','menu',NULL,NULL,'2019-03-14 13:07:56',1),(24,'踢出用户',19,NULL,'online:delete','button',NULL,NULL,'2019-02-05 09:23:24',0),(25,'删除日志',20,NULL,'loginlog:delete','button',NULL,NULL,'2019-02-05 09:23:24',0),(26,'删除日志',21,NULL,'log:delete','button',NULL,NULL,'2019-02-05 09:23:24',0),(27,'任务调度',0,NULL,NULL,'menu','fa fa-bell',2,'2019-01-01 00:00:00',1),(28,'定时任务',27,'/task','task','menu',NULL,1,'2019-02-05 09:23:28',1),(29,'对象储存',0,NULL,NULL,'menu','fa fa-cloud',1,'2019-02-05 08:49:45',1),(30,'七牛云',29,'/storage/qiniu','qiniu:list','menu','',2,'2019-02-05 08:51:30',1),(31,'上传文件',30,NULL,'qiniu:upload','button',NULL,NULL,'2019-03-14 11:38:01',0),(32,'修改文件',30,NULL,'qiniu:update','button',NULL,NULL,'2019-03-14 11:38:01',0),(33,'删除文件',30,NULL,'qiniu:delete','button',NULL,NULL,'2019-03-14 11:38:01',0),(34,'网络资源',0,NULL,NULL,'menu','fa fa-support',1,'2019-02-05 09:23:24',1),(35,'天气查询',34,'/web/weather','weather:list','menu',NULL,1,'2019-02-05 09:25:06',1),(36,'影视资讯',34,'/web/movie','movie:list','menu',NULL,NULL,'2019-03-14 11:38:01',1),(37,'百丽商城',0,'','','menu','fa fa-support',0,'2019-11-19 12:21:55',1),(38,'商品列表',37,'/item/shop','shop:list','menu','',1,'2019-11-19 12:22:51',0),(39,'上架商品',38,'','shop:add','button','',NULL,'2019-11-21 13:00:30',0),(40,'修改商品',38,'','shop:update','button','',NULL,'2019-11-21 13:02:05',0),(41,'删除商品',38,'','shop:delete','button',NULL,NULL,'2019-11-21 13:02:46',0),(42,'品牌新闻',37,'/shop/news','news:list','menu',NULL,NULL,'2019-11-23 07:58:45',0),(43,'新增新闻',42,'','news:add','button',NULL,NULL,'2019-11-23 07:59:47',0),(44,'编辑新闻',42,NULL,'news:update','button',NULL,NULL,'2019-11-23 08:00:18',0),(45,'删除新闻',42,NULL,'news:delete','button',NULL,NULL,'2019-11-23 08:00:49',0);
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_news`
--

DROP TABLE IF EXISTS `tb_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `picture` varchar(500) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_news`
--

LOCK TABLES `tb_news` WRITE;
/*!40000 ALTER TABLE `tb_news` DISABLE KEYS */;
INSERT INTO `tb_news` VALUES (1,'2019双十二预热','双十二预热！！欢迎加购，购物满999有好礼相送！！','/img/item/2.jpg','2019-11-22 21:30:25'),(2,'2019冬上新','雪地靴上架了 快来选购~~','/img/item/1.jpg','2019-11-23 14:11:29');
/*!40000 ALTER TABLE `tb_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nums` int(11) NOT NULL COMMENT '件数',
  `sum` int(11) NOT NULL COMMENT '总金额',
  `pay_mode` int(11) NOT NULL COMMENT '支付方式',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `member_id` int(11) NOT NULL COMMENT '会员号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_detail`
--

DROP TABLE IF EXISTS `tb_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  `price` double(6,2) NOT NULL COMMENT '单价',
  `discount` double(4,2) NOT NULL COMMENT '折扣',
  `dis_price` double(8,2) NOT NULL COMMENT '折扣价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_detail`
--

LOCK TABLES `tb_order_detail` WRITE;
/*!40000 ALTER TABLE `tb_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0锁定 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'管理员','2019-01-01 00:00:00','管理员',1),(2,'测试账号','2019-01-01 00:00:00','测试，可查看所有页面，但无操作权限',1),(3,'用户管理员','2019-01-01 00:00:00','负责用户的增删改查操作',1),(4,'系统监控员','2019-02-14 08:51:48','可查看系统监控信息',1),(5,'天气预报员','2019-02-14 02:54:56','可查看天气预报信息',1),(6,'用户查看','2019-02-14 02:59:17','查看用户，但无操作权限',1);
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_menu`
--

DROP TABLE IF EXISTS `tb_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单/按钮ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_menu`
--

LOCK TABLES `tb_role_menu` WRITE;
/*!40000 ALTER TABLE `tb_role_menu` DISABLE KEYS */;
INSERT INTO `tb_role_menu` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(2,1),(2,2),(2,3),(2,4),(2,5),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,27),(2,28),(2,29),(2,30),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(3,2),(3,6),(3,7),(3,8),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(5,34),(5,35),(6,2);
/*!40000 ALTER TABLE `tb_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `salt` varchar(100) NOT NULL COMMENT '盐值',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别 0男 1女',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0锁定 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'admin','e66118cc37a2d48679d2125786da4e32','4bb248295857990678f15b9410e78e4d',3,'2019-01-01 00:00:00','2019-02-05 02:46:38','/img/avatar/default.jpg','19809587839','0','管理员',1),(2,'tycoding','18caf8ff1512ad84f46053ac0f4561cf','ab2874470d60b14ed8f1248ab0e527ad',5,'2019-01-01 00:00:00','2019-02-05 02:47:26','/img/avatar/20180414165754.jpg','18798797687','0','测试账号，可查看所有页面',1),(3,'tumo','4416ceb6e10bf309149358e90a6ce6bb','a9d14a4b3c80b20c3042842393623384',6,'2019-02-03 03:37:34','2019-02-03 07:37:12','/img/avatar/20180414165827.jpg','781797907','1','用户管理员，负责用户增删改查操作',1),(4,'monitor','dbdb4ec62a5b3782a040e0df86dee6a5','9be3bd45b443283cc63ebc6a0b0c0cc9',1,'2019-02-03 03:37:34','2019-02-03 07:37:12','/img/avatar/20180414165827.jpg','18798797687','1','系统监控员，查看系统监控',1),(5,'synoptic','23384e9d6e4bbab9b8b07096c3afbe4e','850ff5eb7d00cdd36a0e1f98d4a11553',1,'2019-02-03 03:37:34','2019-02-03 07:37:12','/img/avatar/20180414165827.jpg','18798797687','1','天气预报员，查看天气预报信息',0),(6,'user','e315802c9a5c617cd6fad4a951417455','aa8d31f90f27ef28fe16f0b0c670540d',1,'2019-02-03 03:37:34','2019-02-03 07:37:12','/img/avatar/20180414165827.jpg','18798797687','1','用户查看，尽可查看用户信息',0),(7,'121ewfd','','xxx',6,'2019-03-15 22:54:35','2019-03-15 22:56:35','','232324','','',0);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_role`
--

DROP TABLE IF EXISTS `tb_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_role`
--

LOCK TABLES `tb_user_role` WRITE;
/*!40000 ALTER TABLE `tb_user_role` DISABLE KEYS */;
INSERT INTO `tb_user_role` VALUES (1,1),(2,2),(3,3),(3,4),(4,4),(4,5),(5,5),(6,6),(7,2);
/*!40000 ALTER TABLE `tb_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-23 22:29:36
