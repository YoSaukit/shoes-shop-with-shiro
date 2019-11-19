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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item`
--

LOCK TABLES `tb_item` WRITE;
/*!40000 ALTER TABLE `tb_item` DISABLE KEYS */;
INSERT INTO `tb_item` VALUES (1,'雪地靴','/img/item/1.jpg','百丽雪地靴2019冬新商场同款加绒户外风工装保暖靴',499.00,'2019-11-18 04:16:36'),(2,'雪地靴','/img/item/2.jpg','百丽雪地靴女2019冬新款休闲加绒保暖毛靴',499.00,'2019-11-18 04:36:16');
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
  `color` varchar(20) NOT NULL COMMENT '颜色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item_color`
--

LOCK TABLES `tb_item_color` WRITE;
/*!40000 ALTER TABLE `tb_item_color` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_item_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_item_size`
--

DROP TABLE IF EXISTS `tb_item_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_item_size` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `size` varchar(20) NOT NULL COMMENT '尺码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_item_size_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item_size`
--

LOCK TABLES `tb_item_size` WRITE;
/*!40000 ALTER TABLE `tb_item_size` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='系统日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_log`
--

LOCK TABLES `tb_log` WRITE;
/*!40000 ALTER TABLE `tb_log` DISABLE KEYS */;
INSERT INTO `tb_log` VALUES (1,'admin','查看用户列表',20,'cn.tycoding.system.controller.UserController.queryList()',' queryPage\"QueryPage(pageCode=1, pageSize=6)\" user\"User(id=null, username=null, password=null, salt=null, deptId=null, deptName=null, createTime=null, modifyTime=null, avatar=null, phone=null, sex=null, description=null, status=null)\"','127.0.0.1','2019-03-13 00:42:34','内网IP|0|0|内网IP|内网IP'),(7,'admin','更新用户',83,'cn.tycoding.system.controller.UserController.update()',' user\"UserWithRole(roleId=1, roleIds=[1])\"','127.0.0.1','2019-03-13 01:21:48','内网IP|0|0|内网IP|内网IP'),(10,'admin','删除用户',65,'cn.tycoding.system.controller.UserController.delete()',' ids\"[9]\"','127.0.0.1','2019-03-13 05:00:56','内网IP|0|0|内网IP|内网IP'),(11,'admin','删除用户',9,'cn.tycoding.system.controller.UserController.delete()',' ids\"[9]\"','127.0.0.1','2019-03-13 05:01:18','内网IP|0|0|内网IP|内网IP'),(12,'admin','删除登录日志',39,'cn.tycoding.monitor.controller.LoginLogController.delete()',' ids\"[3]\"','127.0.0.1','2019-03-13 05:13:03','内网IP|0|0|内网IP|内网IP'),(13,'admin','删除日志',44,'cn.tycoding.monitor.controller.LogController.delete()',' ids\"[8]\"','127.0.0.1','2019-03-13 05:15:54','内网IP|0|0|内网IP|内网IP'),(14,'admin','删除日志',9,'cn.tycoding.monitor.controller.LogController.delete()',' ids\"[9]\"','127.0.0.1','2019-03-13 05:15:58','内网IP|0|0|内网IP|内网IP'),(15,'admin','删除七牛云文件',378,'cn.tycoding.storage.controller.QiniuController.delete()',' name\"ss1074261491006988288.jpg\"','127.0.0.1','2019-03-13 08:30:31','内网IP|0|0|内网IP|内网IP'),(16,'admin','更新七牛云文件名',430,'cn.tycoding.storage.controller.QiniuController.update()',' oldname\"ss1074213185631420416.png\" newname\"1074213185631420416.png\"','127.0.0.1','2019-03-13 08:32:56','内网IP|0|0|内网IP|内网IP'),(17,'admin','上传七牛云文件',1948,'cn.tycoding.storage.controller.QiniuController.upload()',' file\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@576e7f4b\" request: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest@5ac44dd6','127.0.0.1','2019-03-13 19:14:19','内网IP|0|0|内网IP|内网IP'),(18,'admin','添加用户',96,'cn.tycoding.system.controller.UserController.add()',' user\"UserWithRole(roleId=null, roleIds=[3])\"','127.0.0.1','2019-03-14 08:27:07','内网IP|0|0|内网IP|内网IP'),(19,'admin','文件上传',7,'cn.tycoding.storage.controller.UploadController.upload()',' file\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@150e5550\" request: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest@38af3773','127.0.0.1','2019-03-14 08:27:50','内网IP|0|0|内网IP|内网IP'),(20,'admin','更新用户',19,'cn.tycoding.system.controller.UserController.update()',' user\"UserWithRole(roleId=3, roleIds=[3])\"','127.0.0.1','2019-03-14 08:28:01','内网IP|0|0|内网IP|内网IP'),(21,'admin','上传七牛云文件',2087,'cn.tycoding.storage.controller.QiniuController.upload()',' file\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@367a9b8b\" request: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest@322fa353','127.0.0.1','2019-03-14 08:29:17','内网IP|0|0|内网IP|内网IP'),(22,'admin','更新用户',19,'cn.tycoding.system.controller.UserController.update()',' user\"UserWithRole(roleId=3, roleIds=[3])\"','127.0.0.1','2019-03-14 08:29:21','内网IP|0|0|内网IP|内网IP'),(23,'tycoding','添加用户',22,'cn.tycoding.system.controller.UserController.add()',' user\"UserWithRole(roleId=null, roleIds=[2])\"','127.0.0.1','2019-03-15 22:54:35','内网IP|0|0|内网IP|内网IP'),(24,'tycoding','更新用户',22,'cn.tycoding.system.controller.UserController.update()',' user\"UserWithRole(roleId=2, roleIds=[2])\"','127.0.0.1','2019-03-15 22:56:35','内网IP|0|0|内网IP|内网IP');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_login_log`
--

LOCK TABLES `tb_login_log` WRITE;
/*!40000 ALTER TABLE `tb_login_log` DISABLE KEYS */;
INSERT INTO `tb_login_log` VALUES (1,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 04:36:13','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(4,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 06:15:56','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(5,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 08:05:34','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(6,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 08:52:32','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(7,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 18:31:09','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(8,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 20:33:47','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(9,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-13 21:32:03','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(10,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 01:03:48','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(11,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 01:39:52','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(12,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 05:25:56','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(13,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 06:39:46','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(14,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 18:34:34','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(15,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-14 19:04:50','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(16,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 03:08:48','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(17,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 05:31:11','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(18,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 05:35:07','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(19,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 06:09:02','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(20,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 20:18:15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(21,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 20:54:48','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(22,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 21:51:47','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(23,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 22:01:24','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(24,'admin','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 22:04:35','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(25,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-03-15 22:49:37','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),(26,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-18 07:23:58','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36'),(27,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 08:20:12','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(28,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 09:08:06','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(29,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 12:08:37','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(30,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 13:44:00','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(31,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 13:44:34','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(32,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 13:46:14','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(33,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 14:09:00','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14'),(34,'tycoding','127.0.0.1','内网IP|0|0|内网IP|内网IP','2019-11-19 14:10:28','Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,'系统管理',0,NULL,NULL,'menu','fa fa-gear',0,'2019-01-01 00:00:00',1),(2,'用户管理',1,'/system/user','user:list','menu',NULL,1,'2019-01-01 00:00:00',1),(3,'角色管理',1,'/system/role','role:list','menu',NULL,2,'2019-01-01 00:00:00',1),(4,'菜单管理',1,'/system/menu','menu:list','menu',NULL,3,'2019-01-01 00:00:00',1),(5,'部门管理',1,'/system/dept','dept:list','menu',NULL,NULL,'2019-02-14 13:19:56',1),(6,'新增用户',2,NULL,'user:add','button',NULL,1,'2019-01-01 00:00:00',1),(7,'修改用户',2,NULL,'user:update','button',NULL,2,'2019-01-01 00:00:00',1),(8,'删除用户',2,NULL,'user:delete','button',NULL,1,'2019-01-01 00:00:00',1),(9,'新增角色',3,NULL,'role:add','button',NULL,2,'2019-01-01 00:00:00',1),(10,'修改角色',3,NULL,'role:update','button',NULL,NULL,'2019-03-15 13:46:26',0),(11,'删除用户',3,NULL,'role:delete','button',NULL,NULL,'2019-03-15 13:47:14',0),(12,'新增菜单',4,NULL,'menu:add','button',NULL,NULL,'2019-03-15 13:47:55',0),(13,'修改菜单',4,NULL,'menu:update','button',NULL,NULL,'2019-03-15 13:47:55',0),(14,'删除菜单',4,NULL,'menu:delete','button',NULL,NULL,'2019-03-15 13:47:14',0),(15,'新增部门',5,NULL,'dept:add','button',NULL,NULL,'2019-03-15 13:47:14',0),(16,'修改部门',5,NULL,'dept:update','button',NULL,NULL,'2019-03-15 13:47:14',0),(17,'删除部门',5,NULL,'dept:delete','button',NULL,NULL,'2019-03-15 13:47:14',0),(18,'系统监控',0,NULL,NULL,'menu','fa fa-shield',0,'2019-02-05 09:07:39',1),(19,'在线用户',18,'/monitor/online','online:list','menu',NULL,NULL,'2019-02-14 14:29:53',1),(20,'登录日志',18,'/monitor/loginlog','loginlog:list','menu',NULL,NULL,'2019-02-14 14:31:54',0),(21,'系统日志',18,'/monitor/log','log:list','menu',NULL,1,'2019-02-05 09:09:36',1),(22,'Redis监控',18,'/monitor/redis/monitor','redis:list','menu',NULL,1,'2019-02-05 09:10:28',1),(23,'Druid监控',18,'/monitor/druid','druid:list','menu',NULL,NULL,'2019-03-14 13:07:56',1),(24,'踢出用户',19,NULL,'online:delete','button',NULL,NULL,'2019-02-05 09:23:24',0),(25,'删除日志',20,NULL,'loginlog:delete','button',NULL,NULL,'2019-02-05 09:23:24',0),(26,'删除日志',21,NULL,'log:delete','button',NULL,NULL,'2019-02-05 09:23:24',0),(27,'任务调度',0,NULL,NULL,'menu','fa fa-bell',2,'2019-01-01 00:00:00',1),(28,'定时任务',27,'/task','task','menu',NULL,1,'2019-02-05 09:23:28',1),(29,'对象储存',0,NULL,NULL,'menu','fa fa-cloud',1,'2019-02-05 08:49:45',1),(30,'七牛云',29,'/storage/qiniu','qiniu:list','menu','',2,'2019-02-05 08:51:30',1),(31,'上传文件',30,NULL,'qiniu:upload','button',NULL,NULL,'2019-03-14 11:38:01',0),(32,'修改文件',30,NULL,'qiniu:update','button',NULL,NULL,'2019-03-14 11:38:01',0),(33,'删除文件',30,NULL,'qiniu:delete','button',NULL,NULL,'2019-03-14 11:38:01',0),(34,'网络资源',0,NULL,NULL,'menu','fa fa-support',1,'2019-02-05 09:23:24',1),(35,'天气查询',34,'/web/weather','weather:list','menu',NULL,1,'2019-02-05 09:25:06',1),(36,'影视资讯',34,'/web/movie','movie:list','menu',NULL,NULL,'2019-03-14 11:38:01',1),(37,'百丽商城',0,'','','menu','fa fa-support',0,'2019-11-19 12:21:55',1),(38,'商品列表',37,'/item/shop','shop:list','menu','',1,'2019-11-19 12:22:51',0);
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
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `picture` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_news`
--

LOCK TABLES `tb_news` WRITE;
/*!40000 ALTER TABLE `tb_news` DISABLE KEYS */;
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
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
INSERT INTO `tb_role_menu` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(2,1),(2,2),(2,3),(2,4),(2,5),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,27),(2,28),(2,29),(2,30),(2,34),(2,35),(2,36),(2,37),(2,38),(3,2),(3,6),(3,7),(3,8),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(5,34),(5,35),(6,2);
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

-- Dump completed on 2019-11-19 22:29:25
