# openvpn
>sql script

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `admin_level` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('3', 'admin', '7f8d89e94683d6899314ca17fca35c6f', '1', '1');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trusted_ip` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trusted_port` int(10) DEFAULT NULL,
  `protocol` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remote_ip` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remote_netmask` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bytes_received` bigint(20) DEFAULT '0',
  `bytes_sent` bigint(20) DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '1',
  KEY `idx_username` (`username`),
  KEY `idx_start_time` (`start_time`),
  KEY `idx_end_time` (`end_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for stat
-- ----------------------------
DROP TABLE IF EXISTS `stat`;
CREATE TABLE `stat` (
  `total_used` bigint(20) NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `origin_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stat
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(10) NOT NULL DEFAULT '1',
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` char(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `quota_cycle` int(10) NOT NULL DEFAULT '30',
  `quota_bytes` bigint(20) NOT NULL DEFAULT '1024',
  `enabled` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`),
  KEY `idx_active` (`active`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
#密码为：admin
INSERT INTO `user` VALUES ('admin', '1ucc7n0Jvdv/M', '1', '2016-04-23 20:14:59', 'Mr.li', '1099532501@qq.com', '内测用户', '30', '900', '1');

