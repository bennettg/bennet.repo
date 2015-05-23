/*
Navicat MySQL Data Transfer

Source Server         : homeStead
Source Server Version : 50619
Source Host           : 127.0.0.1:33060
Source Database       : cart

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2015-05-22 19:06:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for madmin_cache
-- ----------------------------
DROP TABLE IF EXISTS `madmin_cache`;
CREATE TABLE `madmin_cache` (
  `id` varchar(255) NOT NULL,
  `siteid` int(11) NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`,`siteid`),
  KEY `idx_majob_expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of madmin_cache
-- ----------------------------

-- ----------------------------
-- Table structure for madmin_cache_tag
-- ----------------------------
DROP TABLE IF EXISTS `madmin_cache_tag`;
CREATE TABLE `madmin_cache_tag` (
  `tid` varchar(255) NOT NULL,
  `tsiteid` int(11) DEFAULT NULL,
  `tname` varchar(255) NOT NULL,
  UNIQUE KEY `unq_macacta_id_name` (`tid`,`tsiteid`,`tname`),
  CONSTRAINT `fk_macac_tid` FOREIGN KEY (`tid`) REFERENCES `madmin_cache` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of madmin_cache_tag
-- ----------------------------

-- ----------------------------
-- Table structure for madmin_job
-- ----------------------------
DROP TABLE IF EXISTS `madmin_job`;
CREATE TABLE `madmin_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `parameter` text NOT NULL,
  `result` text NOT NULL,
  `status` smallint(6) NOT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_majob_ctime` (`ctime`),
  KEY `idx_majob_sid_status` (`siteid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of madmin_job
-- ----------------------------

-- ----------------------------
-- Table structure for madmin_log
-- ----------------------------
DROP TABLE IF EXISTS `madmin_log`;
CREATE TABLE `madmin_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `facility` varchar(32) NOT NULL,
  `timestamp` datetime NOT NULL,
  `priority` smallint(6) NOT NULL,
  `message` mediumtext NOT NULL,
  `request` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_malog_sid_time_facility_prio` (`siteid`,`timestamp`,`facility`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of madmin_log
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mshop_attribute`;
CREATE TABLE `mshop_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattr_sid_dom_cod_tid` (`siteid`,`domain`,`code`,`typeid`),
  KEY `fk_msattr_typeid` (`typeid`),
  KEY `idx_msatt_sid_status` (`siteid`,`status`),
  KEY `idx_msatt_sid_dom_label` (`siteid`,`domain`,`label`),
  KEY `idx_msatt_sid_dom_pos` (`siteid`,`domain`,`pos`),
  KEY `idx_msatt_sid_dom_ctime` (`siteid`,`domain`,`ctime`),
  KEY `idx_msatt_sid_dom_mtime` (`siteid`,`domain`,`mtime`),
  KEY `idx_msatt_sid_dom_editor` (`siteid`,`domain`,`editor`),
  CONSTRAINT `fk_msattr_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_attribute_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_attribute
-- ----------------------------
INSERT INTO `mshop_attribute` VALUES ('1', '1', '1', 'product', 'demo-black', 'Demo: Black', '1', '1', '2015-05-22 21:36:25', '2015-05-22 21:36:25', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('2', '1', '5', 'product', 'demo-print-small', 'Demo: Small print', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('3', '1', '5', 'product', 'demo-print-large', 'Demo: Large print', '1', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('4', '1', '6', 'product', 'demo-print-text', 'Demo: Text for print', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('5', '1', '1', 'product', 'demo-blue', 'Demo: Blue', '2', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('6', '1', '3', 'product', 'demo-width-32', 'Demo: Width 32', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('7', '1', '4', 'product', 'demo-length-34', 'Demo: Length 34', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('8', '1', '1', 'product', 'demo-beige', 'Demo: Beige', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('9', '1', '3', 'product', 'demo-width-33', 'Demo: Width 33', '1', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('10', '1', '4', 'product', 'demo-length-36', 'Demo: Length 36', '1', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('11', '1', '5', 'product', 'demo-sticker-small', 'Demo: Small sticker', '2', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute` VALUES ('12', '1', '5', 'product', 'demo-sticker-large', 'Demo: Large sticker', '3', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');

-- ----------------------------
-- Table structure for mshop_attribute_list
-- ----------------------------
DROP TABLE IF EXISTS `mshop_attribute_list`;
CREATE TABLE `mshop_attribute_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `refid` varchar(32) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattli_sid_dm_rid_tid_pid` (`siteid`,`domain`,`refid`,`typeid`,`parentid`),
  KEY `fk_msattli_typeid` (`typeid`),
  KEY `idx_msattli_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_msattli_pid_sid_rid_dm_tid` (`parentid`,`siteid`,`refid`,`domain`,`typeid`),
  KEY `idx_msattli_pid_sid_start` (`parentid`,`siteid`,`start`),
  KEY `idx_msattli_pid_sid_end` (`parentid`,`siteid`,`end`),
  KEY `idx_msattli_pid_sid_pos` (`parentid`,`siteid`,`pos`),
  CONSTRAINT `fk_msattrli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msattli_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_attribute_list_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_attribute_list
-- ----------------------------
INSERT INTO `mshop_attribute_list` VALUES ('1', '1', '1', '4', 'media', '1', null, null, '[]', '0', '1', '2015-05-22 21:36:26', '2015-05-22 21:36:26', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('2', '1', '1', '8', 'text', '1', null, null, '[]', '0', '1', '2015-05-22 21:36:26', '2015-05-22 21:36:26', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('3', '1', '1', '8', 'text', '2', null, null, '[]', '0', '1', '2015-05-22 21:36:26', '2015-05-22 21:36:26', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('4', '1', '1', '8', 'text', '3', null, null, '[]', '0', '1', '2015-05-22 21:36:26', '2015-05-22 21:36:26', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('5', '1', '1', '8', 'text', '4', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('6', '2', '1', '5', 'price', '1', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('7', '2', '1', '5', 'price', '2', null, null, '[]', '1', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('8', '2', '1', '8', 'text', '5', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('9', '2', '1', '8', 'text', '6', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('10', '2', '1', '8', 'text', '7', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('11', '2', '1', '8', 'text', '8', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('12', '3', '1', '5', 'price', '3', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('13', '3', '1', '5', 'price', '4', null, null, '[]', '1', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('14', '3', '1', '8', 'text', '9', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('15', '3', '1', '8', 'text', '10', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('16', '3', '1', '8', 'text', '11', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('17', '3', '1', '8', 'text', '12', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('18', '4', '1', '8', 'text', '13', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('19', '4', '1', '8', 'text', '14', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('20', '5', '1', '4', 'media', '6', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('21', '5', '1', '8', 'text', '20', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('22', '5', '1', '8', 'text', '21', null, null, '[]', '1', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('23', '5', '1', '8', 'text', '22', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('24', '5', '1', '8', 'text', '23', null, null, '[]', '1', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('25', '6', '1', '8', 'text', '24', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('26', '6', '1', '8', 'text', '25', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('27', '6', '1', '8', 'text', '26', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('28', '7', '1', '8', 'text', '27', null, null, '[]', '2', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('29', '7', '1', '8', 'text', '28', null, null, '[]', '2', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('30', '7', '1', '8', 'text', '29', null, null, '[]', '2', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('31', '8', '1', '4', 'media', '7', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('32', '8', '1', '8', 'text', '30', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('33', '8', '1', '8', 'text', '31', null, null, '[]', '1', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('34', '8', '1', '8', 'text', '32', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('35', '8', '1', '8', 'text', '33', null, null, '[]', '1', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('36', '9', '1', '8', 'text', '34', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('37', '9', '1', '8', 'text', '35', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('38', '9', '1', '8', 'text', '36', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('39', '10', '1', '8', 'text', '37', null, null, '[]', '2', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('40', '10', '1', '8', 'text', '38', null, null, '[]', '2', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('41', '10', '1', '8', 'text', '39', null, null, '[]', '2', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('42', '11', '1', '5', 'price', '11', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('43', '11', '1', '5', 'price', '12', null, null, '[]', '1', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('44', '11', '1', '8', 'text', '40', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('45', '11', '1', '8', 'text', '41', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('46', '11', '1', '8', 'text', '42', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('47', '11', '1', '8', 'text', '43', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('48', '12', '1', '5', 'price', '13', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('49', '12', '1', '5', 'price', '14', null, null, '[]', '1', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('50', '12', '1', '8', 'text', '44', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('51', '12', '1', '8', 'text', '45', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('52', '12', '1', '8', 'text', '46', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_attribute_list` VALUES ('53', '12', '1', '8', 'text', '47', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');

-- ----------------------------
-- Table structure for mshop_attribute_list_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_attribute_list_type`;
CREATE TABLE `mshop_attribute_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msattlity_sid_status` (`siteid`,`status`),
  KEY `idx_msattlity_sid_label` (`siteid`,`label`),
  KEY `idx_msattlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_attribute_list_type
-- ----------------------------
INSERT INTO `mshop_attribute_list_type` VALUES ('1', '1', 'attribute', 'default', 'Default', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_list_type` VALUES ('2', '1', 'catalog', 'default', 'Default', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_list_type` VALUES ('3', '1', 'media', 'default', 'Default', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_list_type` VALUES ('4', '1', 'media', 'icon', 'Icon', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_list_type` VALUES ('5', '1', 'price', 'default', 'Default', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_list_type` VALUES ('6', '1', 'product', 'default', 'Default', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_list_type` VALUES ('7', '1', 'service', 'default', 'Default', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_list_type` VALUES ('8', '1', 'text', 'default', 'Default', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');

-- ----------------------------
-- Table structure for mshop_attribute_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_attribute_type`;
CREATE TABLE `mshop_attribute_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msattty_sid_status` (`siteid`,`status`),
  KEY `idx_msattty_sid_label` (`siteid`,`label`),
  KEY `idx_msattty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_attribute_type
-- ----------------------------
INSERT INTO `mshop_attribute_type` VALUES ('1', '1', 'product', 'color', 'Color', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_type` VALUES ('2', '1', 'product', 'size', 'Size', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_type` VALUES ('3', '1', 'product', 'width', 'Width', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_type` VALUES ('4', '1', 'product', 'length', 'Length', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_type` VALUES ('5', '1', 'product', 'option', 'Option', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');
INSERT INTO `mshop_attribute_type` VALUES ('6', '1', 'product', 'text', 'Text', '1', '2015-05-22 21:36:16', '2015-05-22 21:36:16', '');

-- ----------------------------
-- Table structure for mshop_catalog
-- ----------------------------
DROP TABLE IF EXISTS `mshop_catalog`;
CREATE TABLE `mshop_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `nleft` int(11) NOT NULL,
  `nright` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscat_sid_code` (`siteid`,`code`),
  KEY `idx_mscat_sid_nlt_nrt_lvl_pid` (`siteid`,`nleft`,`nright`,`level`,`parentid`),
  KEY `idx_mscat_sid_status` (`siteid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_catalog
-- ----------------------------
INSERT INTO `mshop_catalog` VALUES ('1', '0', '1', '0', 'home', 'Home', '[]', '1', '2', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');

-- ----------------------------
-- Table structure for mshop_catalog_index_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mshop_catalog_index_attribute`;
CREATE TABLE `mshop_catalog_index_attribute` (
  `prodid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `attrid` int(11) DEFAULT NULL,
  `listtype` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  UNIQUE KEY `unq_mscatinat_p_s_aid_lt` (`prodid`,`siteid`,`attrid`,`listtype`),
  KEY `idx_mscatinat_s_at_lt` (`siteid`,`attrid`,`listtype`),
  KEY `idx_mscatinat_p_s_lt_t_c` (`prodid`,`siteid`,`listtype`,`type`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_catalog_index_attribute
-- ----------------------------
INSERT INTO `mshop_catalog_index_attribute` VALUES ('1', '1', '1', 'default', 'color', 'demo-black', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('1', '1', '2', 'config', 'option', 'demo-print-small', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('1', '1', '4', 'custom', 'text', 'demo-print-text', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('1', '1', '3', 'config', 'option', 'demo-print-large', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('4', '1', '11', 'config', 'option', 'demo-sticker-small', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('4', '1', '12', 'config', 'option', 'demo-sticker-large', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('5', '1', '1', 'default', 'color', 'demo-black', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('5', '1', '2', 'config', 'option', 'demo-print-small', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('5', '1', '4', 'custom', 'text', 'demo-print-text', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('5', '1', '3', 'config', 'option', 'demo-print-large', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('4', '1', '5', 'variant', 'color', 'demo-blue', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('4', '1', '6', 'variant', 'width', 'demo-width-32', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('4', '1', '7', 'variant', 'length', 'demo-length-34', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('4', '1', '8', 'variant', 'color', 'demo-beige', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('4', '1', '9', 'variant', 'width', 'demo-width-33', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('4', '1', '10', 'variant', 'length', 'demo-length-36', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('5', '1', '11', 'config', 'option', 'demo-sticker-small', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_catalog_index_attribute` VALUES ('5', '1', '12', 'config', 'option', 'demo-sticker-large', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');

-- ----------------------------
-- Table structure for mshop_catalog_index_catalog
-- ----------------------------
DROP TABLE IF EXISTS `mshop_catalog_index_catalog`;
CREATE TABLE `mshop_catalog_index_catalog` (
  `prodid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  `listtype` varchar(32) NOT NULL,
  `pos` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  UNIQUE KEY `unq_mscatinca_p_s_cid_lt_po` (`prodid`,`siteid`,`catid`,`listtype`,`pos`),
  KEY `idx_mscatinca_s_ca_lt_po` (`siteid`,`catid`,`listtype`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_catalog_index_catalog
-- ----------------------------
INSERT INTO `mshop_catalog_index_catalog` VALUES ('1', '1', '1', 'default', '1', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_catalog` VALUES ('1', '1', '1', 'promotion', '0', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_catalog` VALUES ('4', '1', '1', 'default', '0', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_catalog` VALUES ('5', '1', '1', 'default', '2', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');

-- ----------------------------
-- Table structure for mshop_catalog_index_price
-- ----------------------------
DROP TABLE IF EXISTS `mshop_catalog_index_price`;
CREATE TABLE `mshop_catalog_index_price` (
  `prodid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `priceid` int(11) DEFAULT NULL,
  `listtype` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `currencyid` char(3) DEFAULT NULL,
  `value` decimal(12,2) NOT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `taxrate` decimal(12,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  UNIQUE KEY `unq_mscatinpr_p_s_prid_lt` (`prodid`,`siteid`,`priceid`,`listtype`),
  KEY `idx_mscatinpr_s_lt_cu_ty_va` (`siteid`,`listtype`,`currencyid`,`type`,`value`),
  KEY `idx_mscatinpr_p_s_lt_cu_ty_va` (`prodid`,`siteid`,`listtype`,`currencyid`,`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_catalog_index_price
-- ----------------------------
INSERT INTO `mshop_catalog_index_price` VALUES ('1', '1', '5', 'default', 'default', 'EUR', '100.00', '5.00', '20.00', '20.00', '1', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_price` VALUES ('1', '1', '6', 'default', 'default', 'EUR', '90.00', '5.00', '30.00', '20.00', '5', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_price` VALUES ('1', '1', '7', 'default', 'default', 'EUR', '80.00', '5.00', '40.00', '20.00', '10', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_price` VALUES ('4', '1', '15', 'default', 'default', 'EUR', '150.00', '10.00', '0.00', '10.00', '1', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_price` VALUES ('4', '1', '16', 'default', 'default', 'EUR', '135.00', '10.00', '15.00', '10.00', '5', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_price` VALUES ('4', '1', '17', 'default', 'default', 'EUR', '120.00', '10.00', '30.00', '10.00', '10', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_price` VALUES ('5', '1', '21', 'default', 'default', 'EUR', '250.00', '10.00', '0.00', '10.00', '1', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_price` VALUES ('5', '1', '22', 'default', 'default', 'EUR', '235.00', '10.00', '15.00', '10.00', '5', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_price` VALUES ('5', '1', '23', 'default', 'default', 'EUR', '220.00', '10.00', '30.00', '10.00', '10', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');

-- ----------------------------
-- Table structure for mshop_catalog_index_text
-- ----------------------------
DROP TABLE IF EXISTS `mshop_catalog_index_text`;
CREATE TABLE `mshop_catalog_index_text` (
  `prodid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `textid` int(11) DEFAULT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `listtype` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  UNIQUE KEY `unq_mscatinte_p_s_tid_lt` (`prodid`,`siteid`,`textid`,`listtype`),
  KEY `idx_mscatinte_sid` (`siteid`),
  KEY `idx_mscatinte_p_s_lt_la_ty_va` (`prodid`,`siteid`,`listtype`,`langid`,`type`,`value`(16)),
  FULLTEXT KEY `idx_mscatinte_value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_catalog_index_text
-- ----------------------------
INSERT INTO `mshop_catalog_index_text` VALUES ('1', '1', '18', 'en', 'default', 'short', 'product', 'This is the short description of the demo article.', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_text` VALUES ('1', '1', '19', 'en', 'default', 'long', 'product', 'Add a detailed description of the demo article that may be a little bit longer.', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_text` VALUES ('1', '1', null, 'en', 'default', 'name', 'product', 'Demo article', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_text` VALUES ('4', '1', '52', 'en', 'default', 'short', 'product', 'This is the short description of the selection demo article.', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_text` VALUES ('4', '1', '53', 'en', 'default', 'long', 'product', 'Add a detailed description of the selection demo article that may be a little bit longer.', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_text` VALUES ('4', '1', null, 'en', 'default', 'name', 'product', 'Demo selection article', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_text` VALUES ('5', '1', '58', 'en', 'default', 'short', 'product', 'This is the short description of the bundle demo article.', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_text` VALUES ('5', '1', '59', 'en', 'default', 'long', 'product', 'Add a detailed description of the bundle demo article that may be a little bit longer.', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_text` VALUES ('5', '1', null, 'en', 'default', 'name', 'product', 'Demo bundle article', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_text` VALUES ('1', '1', '2', 'en', 'default', 'name', 'attribute', 'Black', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');
INSERT INTO `mshop_catalog_index_text` VALUES ('1', '1', '4', 'en', 'default', 'url', 'attribute', 'Black', '2015-05-22 21:36:39', '2015-05-22 21:36:39', 'core:setup');

-- ----------------------------
-- Table structure for mshop_catalog_list
-- ----------------------------
DROP TABLE IF EXISTS `mshop_catalog_list`;
CREATE TABLE `mshop_catalog_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `refid` varchar(32) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscatli_sid_dm_rid_tid_pid` (`siteid`,`domain`,`refid`,`typeid`,`parentid`),
  KEY `fk_mscatli_typeid` (`typeid`),
  KEY `idx_mscatli_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_mscatli_pid_sid_rid_dm_tid` (`parentid`,`siteid`,`refid`,`domain`,`typeid`),
  KEY `idx_mscatli_pid_sid_start` (`parentid`,`siteid`,`start`),
  KEY `idx_mscatli_pid_sid_end` (`parentid`,`siteid`,`end`),
  KEY `idx_mscatli_pid_sid_pos` (`parentid`,`siteid`,`pos`),
  CONSTRAINT `fk_mscatli_parentid` FOREIGN KEY (`parentid`) REFERENCES `mshop_catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mscatli_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_catalog_list_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_catalog_list
-- ----------------------------
INSERT INTO `mshop_catalog_list` VALUES ('1', '1', '1', '4', 'media', '16', null, null, '[]', '0', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('2', '1', '1', '5', 'media', '17', null, null, '[]', '0', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('3', '1', '1', '10', 'product', '1', null, null, '[]', '0', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('4', '1', '1', '7', 'product', '4', null, null, '[]', '0', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('5', '1', '1', '7', 'product', '1', null, null, '[]', '1', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('6', '1', '1', '7', 'product', '5', null, null, '[]', '2', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('7', '1', '1', '9', 'text', '61', null, null, '[]', '0', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('8', '1', '1', '9', 'text', '62', null, null, '[]', '0', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('9', '1', '1', '9', 'text', '63', null, null, '[]', '1', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('10', '1', '1', '9', 'text', '64', null, null, '[]', '2', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('11', '1', '1', '9', 'text', '65', null, null, '[]', '3', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_catalog_list` VALUES ('12', '1', '1', '9', 'text', '66', null, null, '[]', '4', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');

-- ----------------------------
-- Table structure for mshop_catalog_list_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_catalog_list_type`;
CREATE TABLE `mshop_catalog_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscatlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mscatlity_sid_status` (`siteid`,`status`),
  KEY `idx_mscatlity_sid_label` (`siteid`,`label`),
  KEY `idx_mscatlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_catalog_list_type
-- ----------------------------
INSERT INTO `mshop_catalog_list_type` VALUES ('1', '1', 'attribute', 'default', 'Default', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');
INSERT INTO `mshop_catalog_list_type` VALUES ('2', '1', 'catalog', 'default', 'Default', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');
INSERT INTO `mshop_catalog_list_type` VALUES ('3', '1', 'media', 'default', 'Default', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');
INSERT INTO `mshop_catalog_list_type` VALUES ('4', '1', 'media', 'icon', 'Icon', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');
INSERT INTO `mshop_catalog_list_type` VALUES ('5', '1', 'media', 'stage', 'Stage', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');
INSERT INTO `mshop_catalog_list_type` VALUES ('6', '1', 'price', 'default', 'Default', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');
INSERT INTO `mshop_catalog_list_type` VALUES ('7', '1', 'product', 'default', 'Default', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');
INSERT INTO `mshop_catalog_list_type` VALUES ('8', '1', 'service', 'default', 'Default', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');
INSERT INTO `mshop_catalog_list_type` VALUES ('9', '1', 'text', 'default', 'Default', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');
INSERT INTO `mshop_catalog_list_type` VALUES ('10', '1', 'product', 'promotion', 'Promotion', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');

-- ----------------------------
-- Table structure for mshop_coupon
-- ----------------------------
DROP TABLE IF EXISTS `mshop_coupon`;
CREATE TABLE `mshop_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mscou_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_mscou_sid_label` (`siteid`,`label`),
  KEY `idx_mscou_sid_provider` (`siteid`,`provider`),
  KEY `idx_mscou_sid_start` (`siteid`,`start`),
  KEY `idx_mscou_sid_end` (`siteid`,`end`),
  KEY `idx_mscou_sid_mtime` (`siteid`,`mtime`),
  KEY `idx_mscou_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_mscou_sid_editor` (`siteid`,`editor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_coupon
-- ----------------------------
INSERT INTO `mshop_coupon` VALUES ('1', '1', 'demo-fixed', 'FixedRebate', '{\"fixedrebate.productcode\":\"demo-rebate\",\"fixedrebate.rebate\":{\"EUR\":125,\"USD\":150}}', null, null, '1', '2015-05-22 21:36:33', '2015-05-22 21:36:33', 'core:setup');
INSERT INTO `mshop_coupon` VALUES ('2', '1', 'demo-percent', 'PercentRebate', '{\"percentrebate.productcode\":\"demo-rebate\",\"percentrebate.rebate\":\"10\"}', null, null, '1', '2015-05-22 21:36:33', '2015-05-22 21:36:33', 'core:setup');

-- ----------------------------
-- Table structure for mshop_coupon_code
-- ----------------------------
DROP TABLE IF EXISTS `mshop_coupon_code`;
CREATE TABLE `mshop_coupon_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `couponid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `count` int(11) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscouco_sid_code` (`siteid`,`code`),
  KEY `fk_mscouco_couponid` (`couponid`),
  KEY `idx_mscouco_sid_ct_start_end` (`siteid`,`count`,`start`,`end`),
  KEY `idx_mscouco_sid_start` (`siteid`,`start`),
  KEY `idx_mscouco_sid_end` (`siteid`,`end`),
  KEY `idx_mscouco_sid_mtime` (`siteid`,`mtime`),
  KEY `idx_mscouco_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_mscouco_sid_editor` (`siteid`,`editor`),
  CONSTRAINT `fk_mscouco_couponid` FOREIGN KEY (`couponid`) REFERENCES `mshop_coupon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_coupon_code
-- ----------------------------
INSERT INTO `mshop_coupon_code` VALUES ('1', '1', '1', 'fixed', '1000', null, null, '2015-05-22 21:36:33', '2015-05-22 21:36:33', 'core:setup');
INSERT INTO `mshop_coupon_code` VALUES ('2', '2', '1', 'percent', '1000', null, null, '2015-05-22 21:36:33', '2015-05-22 21:36:33', 'core:setup');

-- ----------------------------
-- Table structure for mshop_customer
-- ----------------------------
DROP TABLE IF EXISTS `mshop_customer`;
CREATE TABLE `mshop_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `salutation` varchar(8) NOT NULL,
  `company` varchar(100) NOT NULL,
  `vatid` varchar(32) NOT NULL,
  `title` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `address3` varchar(255) NOT NULL,
  `postal` varchar(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `countryid` char(2) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefax` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `vdate` date DEFAULT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscus_sid_code` (`siteid`,`code`),
  KEY `idx_mscus_langid` (`langid`),
  KEY `idx_mscus_sid_st_ln_fn` (`siteid`,`status`,`lastname`,`firstname`),
  KEY `idx_mscus_sid_st_ad1_ad2` (`siteid`,`status`,`address1`,`address2`),
  KEY `idx_mscus_sid_st_post_ci` (`siteid`,`status`,`postal`,`city`),
  KEY `idx_mscus_sid_lastname` (`siteid`,`lastname`),
  KEY `idx_mscus_sid_address1` (`siteid`,`address1`),
  KEY `idx_mscus_sid_city` (`siteid`,`city`),
  KEY `idx_mscus_sid_postal` (`siteid`,`postal`),
  KEY `idx_mscus_sid_email` (`siteid`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_customer
-- ----------------------------
INSERT INTO `mshop_customer` VALUES ('1', '1', 'Test user', 'demo-test', 'mr', 'Test company', 'DE999999999', '', 'Test', 'User', 'Test street', '1', '', '10000', 'Test city', 'CA', 'en', 'US', '', 'demo@example.com', '', '', null, '$2y$10$jTCpDrasx/aRHW0l/qf5LOtG.bry6uzWjlf9rg3KV0kwityWEFwI6', '1', null, '2015-05-22 21:36:34', '2015-05-22 21:36:34', 'core:setup');

-- ----------------------------
-- Table structure for mshop_customer_address
-- ----------------------------
DROP TABLE IF EXISTS `mshop_customer_address`;
CREATE TABLE `mshop_customer_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `refid` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `vatid` varchar(32) NOT NULL,
  `salutation` varchar(8) NOT NULL,
  `title` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `address3` varchar(255) NOT NULL,
  `postal` varchar(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `countryid` char(2) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefax` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `flag` int(11) NOT NULL,
  `pos` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mscusad_refid` (`refid`),
  KEY `idx_mscusad_sid_ln_fn` (`siteid`,`lastname`,`firstname`),
  KEY `idx_mscusad_sid_ad1_ad2` (`siteid`,`address1`,`address2`),
  KEY `idx_mscusad_sid_post_ci` (`siteid`,`postal`,`city`),
  KEY `idx_mscusad_sid_rid` (`siteid`,`refid`),
  KEY `idx_mscusad_sid_lastname` (`siteid`,`lastname`),
  KEY `idx_mscusad_sid_postal` (`siteid`,`postal`),
  KEY `idx_mscusad_sid_city` (`siteid`,`city`),
  KEY `idx_mscusad_sid_addr1` (`siteid`,`address1`),
  KEY `idx_mscusad_sid_email` (`siteid`,`email`),
  CONSTRAINT `fk_mscusad_refid` FOREIGN KEY (`refid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_customer_address
-- ----------------------------
INSERT INTO `mshop_customer_address` VALUES ('1', '1', '1', 'Demo company', 'DE999999999', 'mrs', '', 'Test', 'User', 'Demo street', '100', '', '12345', 'Demo city', 'NY', 'en', 'US', '', 'demo@example.com', '', '', '0', '0', '2015-05-22 21:36:34', '2015-05-22 21:36:34', 'core:setup');

-- ----------------------------
-- Table structure for mshop_customer_list
-- ----------------------------
DROP TABLE IF EXISTS `mshop_customer_list`;
CREATE TABLE `mshop_customer_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `refid` varchar(32) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscusli_sid_dm_rid_tid_pid` (`siteid`,`domain`,`refid`,`typeid`,`parentid`),
  KEY `fk_mscusli_typeid` (`typeid`),
  KEY `idx_mscusli_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_mscusli_pid_sid_rid_dom_tid` (`parentid`,`siteid`,`refid`,`domain`,`typeid`),
  KEY `idx_mscusli_pid_sid_start` (`parentid`,`siteid`,`start`),
  KEY `idx_mscusli_pid_sid_end` (`parentid`,`siteid`,`end`),
  KEY `idx_mscusli_pid_sid_pos` (`parentid`,`siteid`,`pos`),
  KEY `idx_mscusli_pid_sid_tid` (`parentid`,`siteid`,`typeid`),
  CONSTRAINT `fk_mscusli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mscusli_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_customer_list_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_customer_list
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_customer_list_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_customer_list_type`;
CREATE TABLE `mshop_customer_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscuslity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mscuslity_sid_status` (`siteid`,`status`),
  KEY `idx_mscuslity_sid_label` (`siteid`,`label`),
  KEY `idx_mscuslity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_customer_list_type
-- ----------------------------
INSERT INTO `mshop_customer_list_type` VALUES ('1', '1', 'product', 'favorite', 'Favorite', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');
INSERT INTO `mshop_customer_list_type` VALUES ('2', '1', 'product', 'watch', 'Watch list', '1', '2015-05-22 21:36:17', '2015-05-22 21:36:17', '');

-- ----------------------------
-- Table structure for mshop_locale
-- ----------------------------
DROP TABLE IF EXISTS `mshop_locale`;
CREATE TABLE `mshop_locale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `langid` varchar(5) NOT NULL,
  `currencyid` char(3) NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msloc_sid_lang_curr` (`siteid`,`langid`,`currencyid`),
  KEY `fk_msloc_langid` (`langid`),
  KEY `fk_msloc_currid` (`currencyid`),
  KEY `idx_msloc_sid_curid` (`siteid`,`currencyid`),
  KEY `idx_msloc_sid_status` (`siteid`,`status`),
  KEY `idx_msloc_sid_pos` (`siteid`,`pos`),
  KEY `idx_msloc_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_msloc_sid_mtime` (`siteid`,`mtime`),
  KEY `idx_msloc_sid_editor` (`siteid`,`editor`),
  CONSTRAINT `fk_msloc_siteid` FOREIGN KEY (`siteid`) REFERENCES `mshop_locale_site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msloc_langid` FOREIGN KEY (`langid`) REFERENCES `mshop_locale_language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msloc_currid` FOREIGN KEY (`currencyid`) REFERENCES `mshop_locale_currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_locale
-- ----------------------------
INSERT INTO `mshop_locale` VALUES ('1', '1', 'en', 'EUR', '0', '1', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'core:setup');
INSERT INTO `mshop_locale` VALUES ('2', '1', 'en', 'USD', '1', '1', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'core:setup');
INSERT INTO `mshop_locale` VALUES ('3', '1', 'de', 'EUR', '2', '1', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'core:setup');

-- ----------------------------
-- Table structure for mshop_locale_currency
-- ----------------------------
DROP TABLE IF EXISTS `mshop_locale_currency`;
CREATE TABLE `mshop_locale_currency` (
  `id` char(3) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msloccu_sid_status` (`siteid`,`status`),
  CONSTRAINT `fk_msloccu_siteid` FOREIGN KEY (`siteid`) REFERENCES `mshop_locale_site` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_locale_currency
-- ----------------------------
INSERT INTO `mshop_locale_currency` VALUES ('AED', null, 'United Arab Emirates dirham', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('AFN', null, 'Afghan afghani', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('ALL', null, 'Albanian Lek', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('AMD', null, 'Armenian Dram', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('ANG', null, 'Netherlands Antillean gulden', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('AOA', null, 'Angolan Kwanza', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('ARS', null, 'Argentine Peso', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('AUD', null, 'Australian Dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('AWG', null, 'Aruban Guilder', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('AZN', null, 'Azerbaijani Manat', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BAM', null, 'Bosnia-Herzegovina Conv. Mark', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BBD', null, 'Barbados Dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BDT', null, 'Bangladeshi taka', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BGN', null, 'Bulgarian Lev', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BHD', null, 'Bahraini Dinar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BIF', null, 'Burundi Franc', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BMD', null, 'Bermuda Dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BND', null, 'Brunei Dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BOB', null, 'Boliviano', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BRL', null, 'Brazilian Real', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BSD', null, 'Bahamian Dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BTN', null, 'Bhutanese Ngultrum', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BWP', null, 'Botswana pula', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BYR', null, 'Belarussian Ruble', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('BZD', null, 'Belize Dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('CAD', null, 'Canadian Dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('CDF', null, 'Congolese franc', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('CHF', null, 'Swiss franc', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('CLP', null, 'Chilean Peso', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('CNY', null, 'Chinese Yuan Renminbi', '1', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('COP', null, 'Colombian Peso', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('CRC', null, 'Costa Rican colón', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('CUP', null, 'Cuban peso', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('CVE', null, 'Cape Verde Escudo', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('CZK', null, 'Czech koruna', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('DJF', null, 'Djibouti franc', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('DKK', null, 'Danish krone', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('DOP', null, 'Dominican peso', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('DZD', null, 'Algerian Dinar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('EGP', null, 'Egyptian pound', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('ERN', null, 'Eritrean nakfa', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('ETB', null, 'Ethiopian birr', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('EUR', null, 'Euro', '1', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('FJD', null, 'Fijian dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('FKP', null, 'Falkland Islands pound', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('GBP', null, 'Pound sterling', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('GEL', null, 'Georgian lari', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('GHC', null, 'Ghanaian cedi', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('GIP', null, 'Gibraltar pound', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('GMD', null, 'Gambian dalasi', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('GNF', null, 'Guinea Franc', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('GTQ', null, 'Guatemalan quetzal', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('GYD', null, 'Guyana Dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('HKD', null, 'Hong Kong dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('HNL', null, 'Honduran lempira', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('HRK', null, 'Croatian kuna', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('HTG', null, 'Haitian gourde', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('HUF', null, 'Hungarian forint', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('IDR', null, 'Indonesian rupiah', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('ILS', null, 'New Israeli Sheqel', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('INR', null, 'Indian rupee', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('IQD', null, 'Iraqi dinar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('IRR', null, 'Iranian rial', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('ISK', null, 'Icelandic króna', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('JMD', null, 'Jamaican dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('JOD', null, 'Jordanian dinar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('JPY', null, 'Japanese yen', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('KES', null, 'Kenyan shilling', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('KGS', null, 'Kyrgyzstani som', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('KHR', null, 'Cambodian riel', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('KMF', null, 'Comorian Franc', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('KPW', null, 'North Korean won', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('KRW', null, 'South Corean won', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('KWD', null, 'Kuwaiti dinar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('KYD', null, 'Cayman Islands Dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('KZT', null, 'Kazakhstani tenge', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('LAK', null, 'Lao kip', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('LBP', null, 'Lebanese pound', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('LKR', null, 'Sri Lankan rupee', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('LRD', null, 'Liberian dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('LSL', null, 'Lesotho loti', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('LTL', null, 'Lithuanian litas', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('LVL', null, 'Latvian lats', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('LYD', null, 'Libyan dinar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MAD', null, 'Moroccan dirham', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MDL', null, 'Moldovan leu', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MGA', null, 'Malagasy ariary', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MKD', null, 'Macedonian denar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MMK', null, 'Myanmar kyat', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MNT', null, 'Mongolian tugrug', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MOP', null, 'Macanese pataca', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MRO', null, 'Mauritanian ouguiya', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MUR', null, 'Mauritian rupee', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MVR', null, 'Maldivian rufiyaa', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MWK', null, 'Malawian kwacha', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MXN', null, 'Mexican peso', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MYR', null, 'Malaysian ringgit', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('MZM', null, 'Mozambican metical', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('NAD', null, 'Namibian dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('NGN', null, 'Nigerian naira', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('NIO', null, 'Nicaraguan córdoba', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('NOK', null, 'Norvegian krone', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('NPR', null, 'Nepalese rupee', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('NZD', null, 'New Zealand dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('OMR', null, 'Omani rial', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('PAB', null, 'Panamanian balboa', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('PEN', null, 'Peruvian nuevo sol', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('PGK', null, 'Papua New Guinean kina', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('PHP', null, 'Philippine peso', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('PKR', null, 'Pakistani rupee', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('PLN', null, 'Polish złoty', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('PYG', null, 'Paraguayan guaraní', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('QAR', null, 'Qatari riyal', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('RON', null, 'Romanian leu', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('RSD', null, 'Serbian dinar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('RUB', null, 'Russian ruble', '1', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('RWF', null, 'Rwandan franc', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SAR', null, 'Saudi riyal', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SBD', null, 'Solomon Islands dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SCR', null, 'Seychelles rupee', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SDG', null, 'Sudanese pound', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SEK', null, 'Swedish krona', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SGD', null, 'Singapore dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SHP', null, 'Saint Helena pound', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SLL', null, 'Sierra Leonean leone', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SOS', null, 'Somali shilling', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SRD', null, 'Suriname dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('STD', null, 'São Tomé and Príncipe dobra', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SYP', null, 'Syrian pound', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('SZL', null, 'Swazi lilangeni', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('THB', null, 'Baht', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('TJS', null, 'Tajikistani somoni', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('TMT', null, 'Turkmenistani manat', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('TND', null, 'Tunisian dinar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('TOP', null, 'Tongan pa\'anga', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('TRY', null, 'Turkish new lira', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('TTD', null, 'Trinidad and Tobago dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('TWD', null, 'New Taiwan dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('TZS', null, 'Tanzanian shilling', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('UAH', null, 'Ukrainian hryvnia', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('UGX', null, 'Ugandan shilling', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('USD', null, 'US dollar', '1', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('UYU', null, 'Uruguayan peso', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('UZS', null, 'Uzbekistani som', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('VEF', null, 'Venezuelan bolivar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('VND', null, 'Vietnamese dong', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('VUV', null, 'Vatu', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('WST', null, 'Samoan tala', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('XAF', null, 'CFA Franc BEAC', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('XCD', null, 'East Caribbean dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('XOF', null, 'CFA Franc BCEAO', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('XPF', null, 'CFP Franc', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('YER', null, 'Yemeni rial', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('ZAR', null, 'South African rand', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('ZMW', null, 'Zambian kwacha', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');
INSERT INTO `mshop_locale_currency` VALUES ('ZWL', null, 'Zimbabwean dollar', '0', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'aimeos:setup');

-- ----------------------------
-- Table structure for mshop_locale_language
-- ----------------------------
DROP TABLE IF EXISTS `mshop_locale_language`;
CREATE TABLE `mshop_locale_language` (
  `id` varchar(5) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mslocla_siteid` (`siteid`),
  KEY `idx_mslocla_status` (`status`),
  KEY `idx_mslocla_label` (`label`),
  CONSTRAINT `fk_mslocla_siteid` FOREIGN KEY (`siteid`) REFERENCES `mshop_locale_site` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_locale_language
-- ----------------------------
INSERT INTO `mshop_locale_language` VALUES ('aa', null, 'Afar', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ab', null, 'Abkhazian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('af', null, 'Afrikaans', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ak', null, 'Akan', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('am', null, 'Amharic', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('an', null, 'Aragonese', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ar', null, 'Arabic', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('as', null, 'Assamese', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('av', null, 'Avar', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ay', null, 'Aymara', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('az', null, 'Azerbaijani', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ba', null, 'Bashkir', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('be', null, 'Belarusian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('bg', null, 'Bulgarian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('bh', null, 'Bihari', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('bi', null, 'Bislama', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('bm', null, 'Bambara', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('bn', null, 'Bengali', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('bo', null, 'Tibetan', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('br', null, 'Breton', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('bs', null, 'Bosnian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ca', null, 'Catalan', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ce', null, 'Chechen', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ch', null, 'Chamorro', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('co', null, 'Corsican', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('cr', null, 'Cree', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('cs', null, 'Czech', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('cu', null, 'Church Slavonic', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('cv', null, 'Chuvash', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('cy', null, 'Welsh', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('da', null, 'Danish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('de', null, 'German', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('dv', null, 'Dhivehi', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('dz', null, 'Dzongkha', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ee', null, 'Ewe', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('el', null, 'Greek', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('en', null, 'English', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('eo', null, 'Esperanto', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('es', null, 'Spanish', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('et', null, 'Estonian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('eu', null, 'Basque', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('fa', null, 'Persian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('fa_IR', null, 'Persian (Iran)', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ff', null, 'Fula', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('fi', null, 'Finnish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('fj', null, 'Fijian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('fo', null, 'Faeroese', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('fr', null, 'French', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('fy', null, 'Frisian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ga', null, 'Irish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('gd', null, 'Scottish Gaelic', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('gl', null, 'Galician', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('gn', null, 'Guaraní', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('gu', null, 'Gujarati', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('gv', null, 'Manx', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ha', null, 'Hausa', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('he', null, 'Hebrew', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('hi', null, 'Hindi', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ho', null, 'Hiri motu', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('hr', null, 'Croatian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ht', null, 'Haïtian Creole', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('hu', null, 'Hungarian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('hy', null, 'Armenian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('hz', null, 'Herero', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ia', null, 'Interlingua', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('id', null, 'Indonesian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ie', null, 'Interlingue', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ig', null, 'Igbo', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ii', null, 'Yi', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ik', null, 'Inupiaq', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('io', null, 'Ido', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('is', null, 'Icelandic', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('it', null, 'Italian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('iu', null, 'Inuktitut', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ja', null, 'Japanese', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('jv', null, 'Javanese', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ka', null, 'Georgian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('kg', null, 'Kongo', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ki', null, 'Kikuyu', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('kj', null, 'Kuanyama', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('kk', null, 'Kazakh', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('kl', null, 'Greenlandic', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('km', null, 'Khmer', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('kn', null, 'Kannada', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ko', null, 'Korean', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('kr', null, 'Kanuri', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ks', null, 'Kashmiri', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ku', null, 'Kurdish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('kv', null, 'Komi', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('kw', null, 'Cornish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ky', null, 'Kirghiz', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('lb', null, 'Luxembourgish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('lg', null, 'Luganda', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('li', null, 'Limburgish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ln', null, 'Lingala', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('lo', null, 'Lao', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('lt', null, 'Lithuanian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('lu', null, 'Luba-Katanga', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('lv', null, 'Latvian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('mg', null, 'Malagasy', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('mh', null, 'Marshallese', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('mi', null, 'Māori', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('mk', null, 'Macedonian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ml', null, 'Malayalam', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('mn', null, 'Mongolian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('mo', null, 'Moldavian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('mr', null, 'Marathi', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ms', null, 'Malay', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('mt', null, 'Maltese', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('my', null, 'Burmese', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('na', null, 'Nauru', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('nb', null, 'Norwegian Bokmål', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('nd', null, 'North Ndebele', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ne', null, 'Nepali', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ng', null, 'Ndonga', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('nl', null, 'Dutch', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('nl_BE', null, 'Dutch (Belgium)', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('nn', null, 'Norwegian Nynorsk', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('no', null, 'Norwegian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('nr', null, 'South Ndebele', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('nv', null, 'Navajo', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ny', null, 'Chichewa', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('oc', null, 'Occitan', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('oj', null, 'Ojibwa', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('om', null, 'Oromo', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('or', null, 'Oriya', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('os', null, 'Ossetic', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('pa', null, 'Punjabi', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('pi', null, 'Pali', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('pl', null, 'Polish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ps', null, 'Pashto', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('pt', null, 'Portuguese', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('qu', null, 'Quechua', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('rm', null, 'Rhaeto-Romance', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('rn', null, 'Kirundi', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ro', null, 'Romanian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ru', null, 'Russian', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('rw', null, 'Kinyarwanda', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sa', null, 'Sanskrit', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sc', null, 'Sardinian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sd', null, 'Sindhi', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('se', null, 'Northern Sami', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sg', null, 'Sango', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('si', null, 'Sinhala', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sk', null, 'Slovak', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sl', null, 'Slovenian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sm', null, 'Samoan', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sn', null, 'Shona', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('so', null, 'Somali', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sq', null, 'Albanian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sr', null, 'Serbian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sr_RS', null, 'Serbian (Serbia)', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ss', null, 'Swati', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('st', null, 'Sesotho', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('su', null, 'Sundanese', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sv', null, 'Swedish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('sw', null, 'Swahili', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ta', null, 'Tamil', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('te', null, 'Telugu', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('tg', null, 'Tajik', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('th', null, 'Thai', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ti', null, 'Tigrinya', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('tk', null, 'Turkmen', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('tl', null, 'Tagalog', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('tn', null, 'Setswana', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('to', null, 'Tongan', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('tr', null, 'Turkish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('tr_TR', null, 'Turkish (Turkey)', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ts', null, 'Tsonga', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('tt', null, 'Tatar', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('tw', null, 'Twi', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ty', null, 'Tahitian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ug', null, 'Uyghur', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('uk', null, 'Ukrainian', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ur', null, 'Urdu', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('uz', null, 'Uzbek', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('ve', null, 'Venda', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('vi', null, 'Vietnamese', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('vo', null, 'Volapük', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('wa', null, 'Walloon', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('wo', null, 'Wolof', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('xh', null, 'Xhosa', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('yi', null, 'Yiddish', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('yo', null, 'Yoruba', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('za', null, 'Zhuang', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('zh', null, 'Chinese', '1', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('zh_CN', null, 'Chinese (China)', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');
INSERT INTO `mshop_locale_language` VALUES ('zu', null, 'Zulu', '0', '2015-05-22 21:36:12', '2015-05-22 21:36:12', 'aimeos:setup');

-- ----------------------------
-- Table structure for mshop_locale_site
-- ----------------------------
DROP TABLE IF EXISTS `mshop_locale_site`;
CREATE TABLE `mshop_locale_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL,
  `nleft` int(11) NOT NULL,
  `nright` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mslocsi_code` (`code`),
  KEY `idx_mslocsi_nleft_nright` (`nleft`,`nright`),
  KEY `idx_mslocsi_level_status` (`level`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_locale_site
-- ----------------------------
INSERT INTO `mshop_locale_site` VALUES ('1', '0', 'default', 'Default', '[]', '1', '0', '1', '2', '2015-05-22 21:36:13', '2015-05-22 21:36:13', 'core:setup');

-- ----------------------------
-- Table structure for mshop_media
-- ----------------------------
DROP TABLE IF EXISTS `mshop_media`;
CREATE TABLE `mshop_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `preview` varchar(255) NOT NULL,
  `mimetype` varchar(64) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msmed_typeid` (`typeid`),
  KEY `idx_msmed_sid_status_langid` (`siteid`,`status`,`langid`),
  KEY `idx_msmed_sid_dom_langid` (`siteid`,`domain`,`langid`),
  KEY `idx_msmed_sid_dom_label` (`siteid`,`domain`,`label`),
  KEY `idx_msmed_sid_dom_mime` (`siteid`,`domain`,`mimetype`),
  KEY `idx_msmed_sid_dom_link` (`siteid`,`domain`,`link`),
  KEY `idx_msmed_sid_dom_ctime` (`siteid`,`domain`,`ctime`),
  KEY `idx_msmed_sid_dom_mtime` (`siteid`,`domain`,`mtime`),
  KEY `idx_msmed_sid_dom_editor` (`siteid`,`domain`,`editor`),
  CONSTRAINT `fk_msmed_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_media_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_media
-- ----------------------------
INSERT INTO `mshop_media` VALUES ('1', '1', null, '2', 'attribute', 'Demo: black.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs=', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs=', 'image/gif', '1', '2015-05-22 21:36:26', '2015-05-22 21:36:26', 'core:setup');
INSERT INTO `mshop_media` VALUES ('2', '1', null, '1', 'product', 'Demo: Article 1.jpg', 'http://demo.aimeos.org/media/1-big.jpg', 'http://demo.aimeos.org/media/1.jpg', 'image/jpeg', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_media` VALUES ('3', '1', null, '1', 'product', 'Demo: Article 2.jpg', 'http://demo.aimeos.org/media/2-big.jpg', 'http://demo.aimeos.org/media/2.jpg', 'image/jpeg', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_media` VALUES ('4', '1', null, '1', 'product', 'Demo: Article 3.jpg', 'http://demo.aimeos.org/media/3-big.jpg', 'http://demo.aimeos.org/media/3.jpg', 'image/jpeg', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_media` VALUES ('5', '1', null, '1', 'product', 'Demo: Article 4.jpg', 'http://demo.aimeos.org/media/4-big.jpg', 'http://demo.aimeos.org/media/4.jpg', 'image/jpeg', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_media` VALUES ('6', '1', null, '2', 'attribute', 'Demo: blue.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAA/wAAACwAAAAAAQABAAACAkQBADs=', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAA/wAAACwAAAAAAQABAAACAkQBADs=', 'image/gif', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_media` VALUES ('7', '1', null, '2', 'attribute', 'Demo: beige.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs=', 'data:image/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs=', 'image/gif', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_media` VALUES ('8', '1', null, '1', 'product', 'Demo: Selection article 1.jpg', 'http://demo.aimeos.org/media/1-big.jpg', 'http://demo.aimeos.org/media/1.jpg', 'image/jpeg', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_media` VALUES ('9', '1', null, '1', 'product', 'Demo: Selection article 2.jpg', 'http://demo.aimeos.org/media/2-big.jpg', 'http://demo.aimeos.org/media/2.jpg', 'image/jpeg', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_media` VALUES ('10', '1', null, '1', 'product', 'Demo: Selection article 3.jpg', 'http://demo.aimeos.org/media/3-big.jpg', 'http://demo.aimeos.org/media/3.jpg', 'image/jpeg', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_media` VALUES ('11', '1', null, '1', 'product', 'Demo: Selection article 4.jpg', 'http://demo.aimeos.org/media/4-big.jpg', 'http://demo.aimeos.org/media/4.jpg', 'image/jpeg', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_media` VALUES ('12', '1', null, '1', 'product', 'Demo: Bundle article 1.jpg', 'http://demo.aimeos.org/media/1-big.jpg', 'http://demo.aimeos.org/media/1.jpg', 'image/jpeg', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_media` VALUES ('13', '1', null, '1', 'product', 'Demo: Bundle article 2.jpg', 'http://demo.aimeos.org/media/2-big.jpg', 'http://demo.aimeos.org/media/2.jpg', 'image/jpeg', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_media` VALUES ('14', '1', null, '1', 'product', 'Demo: Bundle article 3.jpg', 'http://demo.aimeos.org/media/3-big.jpg', 'http://demo.aimeos.org/media/3.jpg', 'image/jpeg', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_media` VALUES ('15', '1', null, '1', 'product', 'Demo: Bundle article 4.jpg', 'http://demo.aimeos.org/media/4-big.jpg', 'http://demo.aimeos.org/media/4.jpg', 'image/jpeg', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_media` VALUES ('16', '1', null, '3', 'catalog', 'Demo: Home icon', 'http://demo.aimeos.org/media/home.png', 'http://demo.aimeos.org/media/home.png', 'image/png', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_media` VALUES ('17', '1', null, '3', 'catalog', 'Demo: Home stage image', 'http://demo.aimeos.org/media/stage.jpg', 'http://demo.aimeos.org/media/stage.jpg', 'image/png', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_media` VALUES ('18', '1', null, '6', 'service', 'Demo: dhl.png', 'http://demo.aimeos.org/media/service/dhl.png', 'http://demo.aimeos.org/media/service/dhl.png', 'image/png', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_media` VALUES ('19', '1', null, '6', 'service', 'Demo: dhl-express.png', 'http://demo.aimeos.org/media/service/dhl-express.png', 'http://demo.aimeos.org/media/service/dhl-express.png', 'image/png', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_media` VALUES ('20', '1', null, '6', 'service', 'Demo: fedex.png', 'http://demo.aimeos.org/media/service/fedex.png', 'http://demo.aimeos.org/media/service/fedex.png', 'image/png', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_media` VALUES ('21', '1', null, '6', 'service', 'Demo: tnt.png', 'http://demo.aimeos.org/media/service/tnt.png', 'http://demo.aimeos.org/media/service/tnt.png', 'image/png', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_media` VALUES ('22', '1', 'de', '6', 'service', 'Demo: payment-in-advance.png', 'http://demo.aimeos.org/media/service/payment-in-advance.png', 'http://demo.aimeos.org/media/service/payment-in-advance.png', 'image/png', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_media` VALUES ('23', '1', 'de', '6', 'service', 'Demo: sepa.png', 'http://demo.aimeos.org/media/service/sepa.png', 'http://demo.aimeos.org/media/service/sepa.png', 'image/png', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_media` VALUES ('24', '1', 'en', '6', 'service', 'Demo: direct-debit.png', 'http://demo.aimeos.org/media/service/direct-debit.png', 'http://demo.aimeos.org/media/service/direct-debit.png', 'image/png', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_media` VALUES ('25', '1', null, '6', 'service', 'Demo: paypal.png', 'http://demo.aimeos.org/media/service/paypal.png', 'http://demo.aimeos.org/media/service/paypal.png', 'image/png', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_media` VALUES ('26', '1', 'de', '6', 'service', 'Demo: dhl-cod.png', 'http://demo.aimeos.org/media/service/dhl-cod.png', 'http://demo.aimeos.org/media/service/dhl-cod.png', 'image/png', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_media` VALUES ('27', '1', 'de', '6', 'service', 'Demo: payment-in-advance-alternative.png', 'http://demo.aimeos.org/media/service/payment-in-advance-alternative.png', 'http://demo.aimeos.org/media/service/payment-in-advance-alternative.png', 'image/png', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');

-- ----------------------------
-- Table structure for mshop_media_list
-- ----------------------------
DROP TABLE IF EXISTS `mshop_media_list`;
CREATE TABLE `mshop_media_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `refid` varchar(32) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedli_sid_dm_rid_tid_pid` (`siteid`,`domain`,`refid`,`typeid`,`parentid`),
  KEY `fk_msmedli_typeid` (`typeid`),
  KEY `idx_msmedli_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_msmedli_pid_sid_rid_dom_tid` (`parentid`,`siteid`,`refid`,`domain`,`typeid`),
  KEY `idx_msmedli_pid_sid_start` (`parentid`,`siteid`,`start`),
  KEY `idx_msmedli_pid_sid_end` (`parentid`,`siteid`,`end`),
  KEY `idx_msmedli_pid_sid_pos` (`parentid`,`siteid`,`pos`),
  CONSTRAINT `fk_msmedli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msmedli_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_media_list_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_media_list
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_media_list_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_media_list_type`;
CREATE TABLE `mshop_media_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msmedlity_sid_status` (`siteid`,`status`),
  KEY `idx_msmedlity_sid_label` (`siteid`,`label`),
  KEY `idx_msmedlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_media_list_type
-- ----------------------------
INSERT INTO `mshop_media_list_type` VALUES ('1', '1', 'product', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_list_type` VALUES ('2', '1', 'attribute', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_list_type` VALUES ('3', '1', 'catalog', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_list_type` VALUES ('4', '1', 'media', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_list_type` VALUES ('5', '1', 'price', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_list_type` VALUES ('6', '1', 'service', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_list_type` VALUES ('7', '1', 'text', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');

-- ----------------------------
-- Table structure for mshop_media_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_media_type`;
CREATE TABLE `mshop_media_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msmedty_sid_status` (`siteid`,`status`),
  KEY `idx_msmedty_sid_code` (`siteid`,`code`),
  KEY `idx_msmedty_sid_label` (`siteid`,`label`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_media_type
-- ----------------------------
INSERT INTO `mshop_media_type` VALUES ('1', '1', 'product', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_type` VALUES ('2', '1', 'attribute', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_type` VALUES ('3', '1', 'catalog', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_type` VALUES ('4', '1', 'media', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_type` VALUES ('5', '1', 'price', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_type` VALUES ('6', '1', 'service', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_type` VALUES ('7', '1', 'text', 'default', 'Default', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');
INSERT INTO `mshop_media_type` VALUES ('8', '1', 'catalog', 'stage', 'Stage', '1', '2015-05-22 21:36:18', '2015-05-22 21:36:18', '');

-- ----------------------------
-- Table structure for mshop_order
-- ----------------------------
DROP TABLE IF EXISTS `mshop_order`;
CREATE TABLE `mshop_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baseid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `type` varchar(8) NOT NULL,
  `datepayment` datetime NOT NULL,
  `datedelivery` datetime DEFAULT NULL,
  `statuspayment` smallint(6) NOT NULL DEFAULT '-1',
  `statusdelivery` smallint(6) NOT NULL DEFAULT '-1',
  `relatedid` bigint(20) DEFAULT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msord_baseid` (`baseid`),
  KEY `idx_msord_sid_mtime_pstat` (`siteid`,`mtime`,`statuspayment`),
  KEY `idx_msord_sid_mtime_dstat` (`siteid`,`mtime`,`statusdelivery`),
  KEY `idx_msord_sid_type` (`siteid`,`type`),
  KEY `idx_msord_sid_pdate` (`siteid`,`datepayment`),
  KEY `idx_msord_sid_ddate` (`siteid`,`datedelivery`),
  KEY `idx_msord_sid_dstatus` (`siteid`,`statusdelivery`),
  KEY `idx_msord_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_msord_sid_editor` (`siteid`,`editor`),
  CONSTRAINT `fk_msord_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_order
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_order_base
-- ----------------------------
DROP TABLE IF EXISTS `mshop_order_base`;
CREATE TABLE `mshop_order_base` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `customerid` varchar(32) NOT NULL,
  `sitecode` varchar(32) DEFAULT NULL,
  `langid` varchar(5) NOT NULL,
  `currencyid` char(3) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `comment` text NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordba_scode_custid` (`sitecode`,`customerid`),
  KEY `idx_msordba_sid_custid` (`siteid`,`customerid`),
  KEY `idx_msordba_sid_ctime` (`siteid`,`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_order_base
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_order_base_address
-- ----------------------------
DROP TABLE IF EXISTS `mshop_order_base_address`;
CREATE TABLE `mshop_order_base_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baseid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `addrid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(8) NOT NULL,
  `company` varchar(100) NOT NULL,
  `vatid` varchar(32) NOT NULL,
  `salutation` varchar(8) NOT NULL,
  `title` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `address3` varchar(255) NOT NULL,
  `postal` varchar(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `countryid` char(2) DEFAULT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefax` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `flag` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaad_bid_type` (`baseid`,`type`),
  KEY `idx_msordbaad_sid_bid_typ` (`siteid`,`baseid`,`type`),
  KEY `idx_msordbaad_bid_sid_lname` (`baseid`,`siteid`,`lastname`),
  KEY `idx_msordbaad_bid_sid_addr1` (`baseid`,`siteid`,`address1`),
  KEY `idx_msordbaad_bid_sid_postal` (`baseid`,`siteid`,`postal`),
  KEY `idx_msordbaad_bid_sid_city` (`baseid`,`siteid`,`city`),
  KEY `idx_msordbaad_bid_sid_email` (`baseid`,`siteid`,`email`),
  CONSTRAINT `fk_msordbaad_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_order_base_address
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_order_base_coupon
-- ----------------------------
DROP TABLE IF EXISTS `mshop_order_base_coupon`;
CREATE TABLE `mshop_order_base_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baseid` bigint(20) NOT NULL,
  `siteid` int(11) NOT NULL,
  `ordprodid` bigint(20) DEFAULT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msordbaco_baseid` (`baseid`),
  KEY `fk_msordbaco_ordprodid` (`ordprodid`),
  KEY `idx_msordbaco_sid_bid_code` (`siteid`,`baseid`,`code`),
  CONSTRAINT `fk_msordbaco_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msordbaco_ordprodid` FOREIGN KEY (`ordprodid`) REFERENCES `mshop_order_base_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_order_base_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_order_base_product
-- ----------------------------
DROP TABLE IF EXISTS `mshop_order_base_product`;
CREATE TABLE `mshop_order_base_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baseid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `prodid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ordprodid` bigint(20) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `prodcode` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `suppliercode` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `warehousecode` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `mediaurl` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `taxrate` decimal(5,2) NOT NULL,
  `flags` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '-1',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbapr_bid_pos` (`baseid`,`pos`),
  KEY `idx_msordbapr_sid_bid_pcd` (`siteid`,`baseid`,`prodcode`),
  KEY `idx_msordbapr_sid_ct_pid_bid` (`siteid`,`ctime`,`prodid`,`baseid`),
  CONSTRAINT `fk_msordbapr_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_order_base_product
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_order_base_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `mshop_order_base_product_attr`;
CREATE TABLE `mshop_order_base_product_attr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `attrid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ordprodid` bigint(20) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaprat_ordprodid_code` (`ordprodid`,`code`),
  KEY `idx_msordbaprat_si_oi_ty_cd_va` (`siteid`,`ordprodid`,`type`,`code`,`value`(16)),
  KEY `idx_msordbaprat_si_cd_va` (`siteid`,`code`,`value`(16)),
  CONSTRAINT `fk_msordbaprat_ordprodid` FOREIGN KEY (`ordprodid`) REFERENCES `mshop_order_base_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_order_base_product_attr
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_order_base_service
-- ----------------------------
DROP TABLE IF EXISTS `mshop_order_base_service`;
CREATE TABLE `mshop_order_base_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baseid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `servid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(8) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `mediaurl` varchar(255) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `taxrate` decimal(5,2) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbase_bid_type_code` (`baseid`,`type`,`code`),
  KEY `idx_msordbase_sid_bid_cd_typ` (`siteid`,`baseid`,`code`,`type`),
  KEY `idx_msordbase_sid_code_type` (`siteid`,`code`,`type`),
  CONSTRAINT `fk_msordbase_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_order_base_service
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_order_base_service_attr
-- ----------------------------
DROP TABLE IF EXISTS `mshop_order_base_service_attr`;
CREATE TABLE `mshop_order_base_service_attr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `attrid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ordservid` bigint(20) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaseat_ordservid_code` (`ordservid`,`code`),
  KEY `idx_msordbaseat_si_oi_ty_cd_va` (`siteid`,`ordservid`,`type`,`code`,`value`(16)),
  KEY `idx_msordbaseat_si_cd_va` (`siteid`,`code`,`value`(16)),
  CONSTRAINT `fk_msordbaseat_ordservid` FOREIGN KEY (`ordservid`) REFERENCES `mshop_order_base_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_order_base_service_attr
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_order_status
-- ----------------------------
DROP TABLE IF EXISTS `mshop_order_status`;
CREATE TABLE `mshop_order_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `parentid` bigint(20) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` varchar(32) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msordst_parentid` (`parentid`),
  KEY `idx_msordstatus_val_sid` (`siteid`,`parentid`,`type`,`value`),
  CONSTRAINT `fk_msordst_parentid` FOREIGN KEY (`parentid`) REFERENCES `mshop_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_order_status
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_plugin
-- ----------------------------
DROP TABLE IF EXISTS `mshop_plugin`;
CREATE TABLE `mshop_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspul_sid_tid_provider` (`siteid`,`typeid`,`provider`),
  KEY `fk_msplu_typeid` (`typeid`),
  KEY `idx_msplu_sid_status` (`siteid`,`status`),
  KEY `idx_msplu_sid_label` (`siteid`,`label`),
  KEY `idx_msplu_sid_provider` (`siteid`,`pos`),
  KEY `idx_msplu_sid_mtime` (`siteid`,`mtime`),
  KEY `idx_msplu_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_msplu_sid_editor` (`siteid`,`editor`),
  CONSTRAINT `fk_msplu_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_plugin_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_plugin
-- ----------------------------
INSERT INTO `mshop_plugin` VALUES ('1', '1', '1', 'Adds addresses/delivery/payment to basket', 'Autofill', '{\"autofill.useorder\":1,\"autofill.orderaddress\":1,\"autofill.orderservice\":1,\"autofill.delivery\":1,\"autofill.payment\":0}', '0', '1', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_plugin` VALUES ('2', '1', '1', 'Updates delivery/payment options on basket change', 'ServicesUpdate', '[]', '1', '1', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_plugin` VALUES ('3', '1', '1', 'Checks for required addresses (billing/delivery)', 'AddressesAvailable', '{\"payment\":1,\"delivery\":\"\"}', '1', '1', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_plugin` VALUES ('4', '1', '1', 'Checks for required services (delivery/payment)', 'ServicesAvailable', '{\"payment\":1,\"delivery\":1}', '2', '1', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_plugin` VALUES ('5', '1', '1', 'Checks for deleted products', 'ProductGone', '[]', '3', '1', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_plugin` VALUES ('6', '1', '1', 'Checks for changed product prices', 'ProductPrice', '[]', '4', '1', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_plugin` VALUES ('7', '1', '1', 'Checks for products out of stock', 'ProductStock', '[]', '5', '1', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_plugin` VALUES ('8', '1', '1', 'Checks for necessary basket limits', 'BasketLimits', '{\"min-products\":1,\"max-products\":100,\"min-value\":{\"EUR\":\"1.00\"},\"max-value\":{\"EUR\":\"10000.00\"}}', '6', '0', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_plugin` VALUES ('9', '1', '1', 'Limits maximum amount of products', 'ProductLimit', '{\"single-number-max\":10,\"total-number-max\":100,\"single-value-max\":{\"EUR\":\"1000.00\"},\"total-value-max\":{\"EUR\":\"10000.00\"}}', '7', '0', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_plugin` VALUES ('10', '1', '1', 'Free shipping above threshold', 'Shipping', '{\"threshold\":{\"EUR\":\"1.00\"}}', '8', '0', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');
INSERT INTO `mshop_plugin` VALUES ('11', '1', '1', 'Coupon update', 'Coupon', '[]', '100', '1', '2015-05-22 21:36:40', '2015-05-22 21:36:40', 'core:setup');

-- ----------------------------
-- Table structure for mshop_plugin_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_plugin_type`;
CREATE TABLE `mshop_plugin_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspluty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mspluty_sid_status` (`siteid`,`status`),
  KEY `idx_mspluty_sid_code` (`siteid`,`code`),
  KEY `idx_mspluty_sid_label` (`siteid`,`label`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_plugin_type
-- ----------------------------
INSERT INTO `mshop_plugin_type` VALUES ('1', '1', 'plugin', 'order', 'Order', '1', '2015-05-22 21:36:19', '2015-05-22 21:36:19', '');

-- ----------------------------
-- Table structure for mshop_price
-- ----------------------------
DROP TABLE IF EXISTS `mshop_price`;
CREATE TABLE `mshop_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `label` varchar(255) NOT NULL,
  `currencyid` char(3) NOT NULL,
  `quantity` int(11) NOT NULL,
  `value` decimal(12,2) NOT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `taxrate` decimal(5,2) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mspri_typeid` (`typeid`),
  KEY `idx_mspri_sid_status_currencyid` (`siteid`,`status`,`currencyid`),
  KEY `idx_mspri_sid_dom_currid` (`siteid`,`domain`,`currencyid`),
  KEY `idx_mspri_sid_dom_quantity` (`siteid`,`domain`,`quantity`),
  KEY `idx_mspri_sid_dom_value` (`siteid`,`domain`,`value`),
  KEY `idx_mspri_sid_dom_costs` (`siteid`,`domain`,`costs`),
  KEY `idx_mspri_sid_dom_rebate` (`siteid`,`domain`,`rebate`),
  KEY `idx_mspri_sid_dom_taxrate` (`siteid`,`domain`,`taxrate`),
  KEY `idx_mspri_sid_dom_mtime` (`siteid`,`domain`,`mtime`),
  KEY `idx_mspri_sid_dom_ctime` (`siteid`,`domain`,`ctime`),
  KEY `idx_mspri_sid_dom_editor` (`siteid`,`domain`,`editor`),
  KEY `idx_mspri_sid_domain` (`siteid`,`domain`),
  KEY `idx_mspri_sid_label` (`siteid`,`label`),
  CONSTRAINT `fk_mspri_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_price_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_price
-- ----------------------------
INSERT INTO `mshop_price` VALUES ('1', '1', '1', 'attribute', 'Demo: Small print', 'EUR', '1', '5.00', '0.00', '0.00', '20.00', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_price` VALUES ('2', '1', '1', 'attribute', 'Demo: Small print', 'USD', '1', '7.00', '0.00', '0.00', '10.00', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_price` VALUES ('3', '1', '1', 'attribute', 'Demo: Large print', 'EUR', '1', '15.00', '0.00', '0.00', '20.00', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_price` VALUES ('4', '1', '1', 'attribute', 'Demo: Large print', 'USD', '1', '20.00', '0.00', '0.00', '10.00', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_price` VALUES ('5', '1', '3', 'product', 'Demo: Article from 1', 'EUR', '1', '100.00', '5.00', '20.00', '20.00', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_price` VALUES ('6', '1', '3', 'product', 'Demo: Article from 5', 'EUR', '5', '90.00', '5.00', '30.00', '20.00', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_price` VALUES ('7', '1', '3', 'product', 'Demo: Article from 10', 'EUR', '10', '80.00', '5.00', '40.00', '20.00', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_price` VALUES ('8', '1', '3', 'product', 'Demo: Article from 1', 'USD', '1', '130.00', '7.50', '30.00', '10.00', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_price` VALUES ('9', '1', '3', 'product', 'Demo: Article from 5', 'USD', '5', '120.00', '7.50', '40.00', '10.00', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_price` VALUES ('10', '1', '3', 'product', 'Demo: Article from 10', 'USD', '10', '100.00', '7.50', '60.00', '10.00', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_price` VALUES ('11', '1', '1', 'attribute', 'Demo: Small sticker', 'EUR', '1', '2.50', '0.00', '0.00', '10.00', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_price` VALUES ('12', '1', '1', 'attribute', 'Demo: Small sticker', 'USD', '1', '3.50', '0.00', '0.00', '5.00', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_price` VALUES ('13', '1', '1', 'attribute', 'Demo: Large sticker', 'EUR', '1', '5.00', '0.00', '0.00', '10.00', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_price` VALUES ('14', '1', '1', 'attribute', 'Demo: Large sticker', 'USD', '1', '7.00', '0.00', '0.00', '5.00', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_price` VALUES ('15', '1', '3', 'product', 'Demo: Selection article from 1', 'EUR', '1', '150.00', '10.00', '0.00', '10.00', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_price` VALUES ('16', '1', '3', 'product', 'Demo: Selection article from 5', 'EUR', '5', '135.00', '10.00', '15.00', '10.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('17', '1', '3', 'product', 'Demo: Selection article from 10', 'EUR', '10', '120.00', '10.00', '30.00', '10.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('18', '1', '3', 'product', 'Demo: Selection article from 1', 'USD', '1', '200.00', '15.00', '0.00', '5.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('19', '1', '3', 'product', 'Demo: Selection article from 5', 'USD', '5', '175.00', '15.00', '25.00', '5.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('20', '1', '3', 'product', 'Demo: Selection article from 10', 'USD', '10', '150.00', '15.00', '50.00', '5.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('21', '1', '3', 'product', 'Demo: Bundle article from 1', 'EUR', '1', '250.00', '10.00', '0.00', '10.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('22', '1', '3', 'product', 'Demo: Bundle article from 5', 'EUR', '5', '235.00', '10.00', '15.00', '10.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('23', '1', '3', 'product', 'Demo: Bundle article from 10', 'EUR', '10', '220.00', '10.00', '30.00', '10.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('24', '1', '3', 'product', 'Demo: Bundle article from 1', 'USD', '1', '250.00', '15.00', '0.00', '5.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('25', '1', '3', 'product', 'Demo: Bundle article from 5', 'USD', '5', '225.00', '15.00', '25.00', '5.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('26', '1', '3', 'product', 'Demo: Bundle article from 10', 'USD', '10', '200.00', '15.00', '50.00', '5.00', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_price` VALUES ('27', '1', '2', 'service', 'Demo: DHL', 'EUR', '1', '0.00', '5.90', '0.00', '20.00', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_price` VALUES ('28', '1', '2', 'service', 'Demo: DHL', 'USD', '1', '0.00', '7.90', '0.00', '10.00', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_price` VALUES ('29', '1', '2', 'service', 'Demo: DHL', 'EUR', '1', '0.00', '11.90', '0.00', '20.00', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_price` VALUES ('30', '1', '2', 'service', 'Demo: DHL', 'USD', '1', '0.00', '15.90', '0.00', '10.00', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_price` VALUES ('31', '1', '2', 'service', 'Demo: Fedex', 'EUR', '1', '0.00', '6.90', '0.00', '20.00', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_price` VALUES ('32', '1', '2', 'service', 'Demo: Fedex', 'USD', '1', '0.00', '8.50', '0.00', '10.00', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_price` VALUES ('33', '1', '2', 'service', 'Demo: TNT', 'EUR', '1', '0.00', '8.90', '0.00', '20.00', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_price` VALUES ('34', '1', '2', 'service', 'Demo: TNT', 'USD', '1', '0.00', '12.90', '0.00', '10.00', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_price` VALUES ('35', '1', '2', 'service', 'Demo: Invoice', 'EUR', '1', '0.00', '0.00', '0.00', '20.00', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_price` VALUES ('36', '1', '2', 'service', 'Demo: Invoice', 'USD', '1', '0.00', '0.00', '0.00', '10.00', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_price` VALUES ('37', '1', '2', 'service', 'Demo: Direct debit', 'EUR', '1', '0.00', '0.00', '0.00', '20.00', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_price` VALUES ('38', '1', '2', 'service', 'Demo: Direct debit', 'USD', '1', '0.00', '0.00', '0.00', '10.00', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_price` VALUES ('39', '1', '2', 'service', 'Demo: PayPal', 'EUR', '1', '0.00', '0.00', '0.00', '20.00', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_price` VALUES ('40', '1', '2', 'service', 'Demo: PayPal', 'USD', '1', '0.00', '0.00', '0.00', '10.00', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_price` VALUES ('41', '1', '2', 'service', 'Demo: Cache on delivery', 'EUR', '1', '0.00', '8.00', '0.00', '20.00', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_price` VALUES ('42', '1', '2', 'service', 'Demo: Cache on delivery', 'USD', '1', '0.00', '12.00', '0.00', '10.00', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_price` VALUES ('43', '1', '2', 'service', 'Demo: Prepayment', 'EUR', '1', '0.00', '0.00', '0.00', '20.00', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_price` VALUES ('44', '1', '2', 'service', 'Demo: Prepayment', 'USD', '1', '0.00', '0.00', '0.00', '10.00', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');

-- ----------------------------
-- Table structure for mshop_price_list
-- ----------------------------
DROP TABLE IF EXISTS `mshop_price_list`;
CREATE TABLE `mshop_price_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `refid` varchar(32) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprili_sid_dm_rid_tid_pid` (`siteid`,`domain`,`refid`,`typeid`,`parentid`),
  KEY `fk_msprili_typeid` (`typeid`),
  KEY `idx_msprili_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_msprili_pid_sid_rid_dom_tid` (`parentid`,`siteid`,`refid`,`domain`,`typeid`),
  KEY `idx_msprili_pid_sid_start` (`parentid`,`siteid`,`start`),
  KEY `idx_msprili_pid_sid_end` (`parentid`,`siteid`,`end`),
  KEY `idx_msprili_pid_sid_pos` (`parentid`,`siteid`,`pos`),
  CONSTRAINT `fk_msprili_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_price` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msprili_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_price_list_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_price_list
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_price_list_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_price_list_type`;
CREATE TABLE `mshop_price_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprility_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msprility_sid_status` (`siteid`,`status`),
  KEY `idx_msprility_sid_label` (`siteid`,`label`),
  KEY `idx_msprility_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_price_list_type
-- ----------------------------
INSERT INTO `mshop_price_list_type` VALUES ('1', '1', 'customer', 'default', 'Default', '1', '2015-05-22 21:36:19', '2015-05-22 21:36:19', '');

-- ----------------------------
-- Table structure for mshop_price_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_price_type`;
CREATE TABLE `mshop_price_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msprity_sid_status` (`siteid`,`status`),
  KEY `idx_msprity_sid_label` (`siteid`,`label`),
  KEY `idx_msprity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_price_type
-- ----------------------------
INSERT INTO `mshop_price_type` VALUES ('1', '1', 'attribute', 'default', 'Default', '1', '2015-05-22 21:36:19', '2015-05-22 21:36:19', '');
INSERT INTO `mshop_price_type` VALUES ('2', '1', 'service', 'default', 'Default', '1', '2015-05-22 21:36:19', '2015-05-22 21:36:19', '');
INSERT INTO `mshop_price_type` VALUES ('3', '1', 'product', 'default', 'Default', '1', '2015-05-22 21:36:19', '2015-05-22 21:36:19', '');

-- ----------------------------
-- Table structure for mshop_product
-- ----------------------------
DROP TABLE IF EXISTS `mshop_product`;
CREATE TABLE `mshop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `suppliercode` varchar(32) NOT NULL,
  `label` varchar(255) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspro_siteid_code` (`siteid`,`code`),
  KEY `fk_mspro_typeid` (`typeid`),
  KEY `idx_mspro_sid_stat_st_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_mspro_id_sid_stat_st_end` (`id`,`siteid`,`status`,`start`,`end`),
  KEY `idx_mspro_sid_label` (`siteid`,`label`),
  KEY `idx_mspro_sid_supplier` (`siteid`,`suppliercode`),
  KEY `idx_mspro_sid_start` (`siteid`,`start`),
  KEY `idx_mspro_sid_end` (`siteid`,`end`),
  KEY `idx_mspro_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_mspro_sid_mtime` (`siteid`,`mtime`),
  KEY `idx_mspro_sid_editor` (`siteid`,`editor`),
  CONSTRAINT `fk_mspro_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_product
-- ----------------------------
INSERT INTO `mshop_product` VALUES ('1', '1', '1', 'demo-article', '', 'Demo article', null, null, '2015-05-22 21:36:25', '2015-05-22 21:36:25', 'core:setup', '1');
INSERT INTO `mshop_product` VALUES ('2', '1', '1', 'demo-selection-article-1', '', 'Demo variant article 1', null, null, '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup', '1');
INSERT INTO `mshop_product` VALUES ('3', '1', '1', 'demo-selection-article-2', '', 'Demo variant article 2', null, null, '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup', '1');
INSERT INTO `mshop_product` VALUES ('4', '1', '2', 'demo-selection-article', '', 'Demo selection article', null, null, '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup', '1');
INSERT INTO `mshop_product` VALUES ('5', '1', '3', 'demo-bundle-article', '', 'Demo bundle article', null, null, '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup', '1');
INSERT INTO `mshop_product` VALUES ('6', '1', '1', 'demo-rebate', '', 'Demo rebate', null, null, '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup', '1');

-- ----------------------------
-- Table structure for mshop_product_list
-- ----------------------------
DROP TABLE IF EXISTS `mshop_product_list`;
CREATE TABLE `mshop_product_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `refid` varchar(32) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproli_sid_dm_rid_tid_pid` (`siteid`,`domain`,`refid`,`typeid`,`parentid`),
  KEY `fk_msproli_typeid` (`typeid`),
  KEY `idx_msproli_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_msproli_pid_sid_rid_dom_tid` (`parentid`,`siteid`,`refid`,`domain`,`typeid`),
  KEY `idx_msproli_pid_sid_start` (`parentid`,`siteid`,`start`),
  KEY `idx_msproli_pid_sid_end` (`parentid`,`siteid`,`end`),
  KEY `idx_msproli_pid_sid_pos` (`parentid`,`siteid`,`pos`),
  CONSTRAINT `fk_msproli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msproli_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_product_list_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_product_list
-- ----------------------------
INSERT INTO `mshop_product_list` VALUES ('1', '1', '1', '2', 'attribute', '1', null, null, '[]', '0', '1', '2015-05-22 21:36:25', '2015-05-22 21:36:25', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('2', '1', '1', '3', 'attribute', '2', null, null, '[]', '1', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('3', '1', '1', '3', 'attribute', '3', null, null, '[]', '2', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('4', '1', '1', '6', 'attribute', '4', null, null, '[]', '1', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('5', '1', '1', '8', 'media', '2', null, null, '[]', '0', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('6', '1', '1', '8', 'media', '3', null, null, '[]', '1', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('7', '1', '1', '8', 'media', '4', null, null, '[]', '2', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('8', '1', '1', '8', 'media', '5', null, null, '[]', '3', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('9', '1', '1', '10', 'price', '5', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('10', '1', '1', '10', 'price', '6', null, null, '[]', '1', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('11', '1', '1', '10', 'price', '7', null, null, '[]', '2', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('12', '1', '1', '10', 'price', '8', null, null, '[]', '3', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('13', '1', '1', '10', 'price', '9', null, null, '[]', '4', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('14', '1', '1', '10', 'price', '10', null, null, '[]', '5', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('15', '1', '1', '12', 'text', '15', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('16', '1', '1', '12', 'text', '16', null, null, '[]', '1', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('17', '1', '1', '12', 'text', '17', null, null, '[]', '2', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('18', '1', '1', '12', 'text', '18', null, null, '[]', '3', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('19', '1', '1', '12', 'text', '19', null, null, '[]', '4', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('20', '2', '1', '4', 'attribute', '5', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('21', '2', '1', '4', 'attribute', '6', null, null, '[]', '1', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('22', '2', '1', '4', 'attribute', '7', null, null, '[]', '1', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('23', '3', '1', '4', 'attribute', '8', null, null, '[]', '0', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('24', '3', '1', '4', 'attribute', '9', null, null, '[]', '1', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('25', '3', '1', '4', 'attribute', '10', null, null, '[]', '2', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('26', '4', '1', '3', 'attribute', '11', null, null, '[]', '1', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('27', '4', '1', '3', 'attribute', '12', null, null, '[]', '2', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('28', '4', '1', '8', 'media', '8', null, null, '[]', '3', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('29', '4', '1', '8', 'media', '9', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('30', '4', '1', '8', 'media', '10', null, null, '[]', '1', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('31', '4', '1', '8', 'media', '11', null, null, '[]', '2', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('32', '4', '1', '10', 'price', '15', null, null, '[]', '0', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('33', '4', '1', '10', 'price', '16', null, null, '[]', '1', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('34', '4', '1', '10', 'price', '17', null, null, '[]', '2', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('35', '4', '1', '10', 'price', '18', null, null, '[]', '3', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('36', '4', '1', '10', 'price', '19', null, null, '[]', '4', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('37', '4', '1', '10', 'price', '20', null, null, '[]', '5', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('38', '4', '1', '12', 'text', '48', null, null, '[]', '0', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('39', '4', '1', '12', 'text', '49', null, null, '[]', '0', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('40', '4', '1', '12', 'text', '50', null, null, '[]', '1', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('41', '4', '1', '12', 'text', '51', null, null, '[]', '2', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('42', '4', '1', '12', 'text', '52', null, null, '[]', '3', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('43', '4', '1', '12', 'text', '53', null, null, '[]', '4', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('44', '4', '1', '1', 'product', '2', null, null, '[]', '0', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('45', '4', '1', '1', 'product', '3', null, null, '[]', '1', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('46', '4', '1', '14', 'product', '1', null, null, '[]', '0', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('47', '4', '1', '15', 'product', '1', null, null, '[]', '0', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('48', '5', '1', '8', 'media', '12', null, null, '[]', '2', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('49', '5', '1', '8', 'media', '13', null, null, '[]', '3', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('50', '5', '1', '8', 'media', '14', null, null, '[]', '0', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('51', '5', '1', '8', 'media', '15', null, null, '[]', '1', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('52', '5', '1', '10', 'price', '21', null, null, '[]', '0', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('53', '5', '1', '10', 'price', '22', null, null, '[]', '1', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('54', '5', '1', '10', 'price', '23', null, null, '[]', '2', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('55', '5', '1', '10', 'price', '24', null, null, '[]', '3', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('56', '5', '1', '10', 'price', '25', null, null, '[]', '4', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('57', '5', '1', '10', 'price', '26', null, null, '[]', '5', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('58', '5', '1', '12', 'text', '54', null, null, '[]', '0', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('59', '5', '1', '12', 'text', '55', null, null, '[]', '0', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('60', '5', '1', '12', 'text', '56', null, null, '[]', '1', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('61', '5', '1', '12', 'text', '57', null, null, '[]', '2', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('62', '5', '1', '12', 'text', '58', null, null, '[]', '3', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('63', '5', '1', '12', 'text', '59', null, null, '[]', '4', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('64', '5', '1', '1', 'product', '4', null, null, '[]', '0', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('65', '5', '1', '1', 'product', '1', null, null, '[]', '1', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_product_list` VALUES ('66', '6', '1', '12', 'text', '60', null, null, '[]', '0', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');

-- ----------------------------
-- Table structure for mshop_product_list_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_product_list_type`;
CREATE TABLE `mshop_product_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprolity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msprolity_sid_status` (`siteid`,`status`),
  KEY `idx_msprolity_sid_label` (`siteid`,`label`),
  KEY `idx_msprolity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_product_list_type
-- ----------------------------
INSERT INTO `mshop_product_list_type` VALUES ('1', '1', 'product', 'default', 'Default', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('2', '1', 'attribute', 'default', 'Default', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('3', '1', 'attribute', 'config', 'Configurable', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('4', '1', 'attribute', 'variant', 'Variant', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('5', '1', 'attribute', 'hidden', 'Hidden', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('6', '1', 'attribute', 'custom', 'Custom value', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('7', '1', 'catalog', 'default', 'Default', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('8', '1', 'media', 'default', 'Default', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('9', '1', 'media', 'download', 'Download', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('10', '1', 'price', 'default', 'Default', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('11', '1', 'service', 'default', 'Default', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('12', '1', 'text', 'default', 'Default', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('13', '1', 'product/tag', 'default', 'Default', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('14', '1', 'product', 'suggestion', 'Suggestion', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_list_type` VALUES ('15', '1', 'product', 'bought-together', 'Bought together', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');

-- ----------------------------
-- Table structure for mshop_product_property
-- ----------------------------
DROP TABLE IF EXISTS `mshop_product_property`;
CREATE TABLE `mshop_product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspropr_sid_tid_lid_value` (`parentid`,`siteid`,`typeid`,`langid`,`value`),
  KEY `fk_mspropr_typeid` (`typeid`),
  KEY `idx_mspropr_sid_value` (`siteid`,`value`),
  KEY `idx_mspropr_sid_langid` (`siteid`,`langid`),
  CONSTRAINT `fk_mspropr_parentid` FOREIGN KEY (`parentid`) REFERENCES `mshop_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mspropr_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_product_property_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_product_property
-- ----------------------------
INSERT INTO `mshop_product_property` VALUES ('1', '1', '1', '2', null, '20.00', '2015-05-22 21:36:25', '2015-05-22 21:36:25', 'core:setup');
INSERT INTO `mshop_product_property` VALUES ('2', '1', '1', '3', null, '10.00', '2015-05-22 21:36:25', '2015-05-22 21:36:25', 'core:setup');
INSERT INTO `mshop_product_property` VALUES ('3', '1', '1', '1', null, '5.00', '2015-05-22 21:36:25', '2015-05-22 21:36:25', 'core:setup');
INSERT INTO `mshop_product_property` VALUES ('4', '1', '1', '4', null, '2.5', '2015-05-22 21:36:25', '2015-05-22 21:36:25', 'core:setup');

-- ----------------------------
-- Table structure for mshop_product_property_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_product_property_type`;
CREATE TABLE `mshop_product_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msproprty_sid_status` (`siteid`,`status`),
  KEY `idx_msproprty_sid_label` (`siteid`,`label`),
  KEY `idx_msproprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_product_property_type
-- ----------------------------
INSERT INTO `mshop_product_property_type` VALUES ('1', '1', 'product/property', 'package-height', 'Package height', '1', '2015-05-22 21:36:21', '2015-05-22 21:36:21', '');
INSERT INTO `mshop_product_property_type` VALUES ('2', '1', 'product/property', 'package-length', 'Package length', '1', '2015-05-22 21:36:21', '2015-05-22 21:36:21', '');
INSERT INTO `mshop_product_property_type` VALUES ('3', '1', 'product/property', 'package-width', 'Package width', '1', '2015-05-22 21:36:21', '2015-05-22 21:36:21', '');
INSERT INTO `mshop_product_property_type` VALUES ('4', '1', 'product/property', 'package-weight', 'Package Weight', '1', '2015-05-22 21:36:21', '2015-05-22 21:36:21', '');

-- ----------------------------
-- Table structure for mshop_product_stock
-- ----------------------------
DROP TABLE IF EXISTS `mshop_product_stock`;
CREATE TABLE `mshop_product_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prodid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `warehouseid` int(11) NOT NULL,
  `stocklevel` int(11) DEFAULT NULL,
  `backdate` datetime DEFAULT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprost_sid_pid_wid` (`siteid`,`prodid`,`warehouseid`),
  KEY `fk_msprost_prodid` (`prodid`),
  KEY `fk_msprost_stock_warehouseid` (`warehouseid`),
  KEY `idx_msprost_sid_stocklevel` (`siteid`,`stocklevel`),
  KEY `idx_msprost_sid_backdate` (`siteid`,`backdate`),
  KEY `idx_msprost_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_msprost_sid_mtime` (`siteid`,`mtime`),
  KEY `idx_msprost_sid_editor` (`siteid`,`editor`),
  CONSTRAINT `fk_msprost_prodid` FOREIGN KEY (`prodid`) REFERENCES `mshop_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msprost_stock_warehouseid` FOREIGN KEY (`warehouseid`) REFERENCES `mshop_product_stock_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_product_stock
-- ----------------------------
INSERT INTO `mshop_product_stock` VALUES ('1', '1', '1', '1', null, null, '2015-05-22 21:36:25', '2015-05-22 21:36:25', 'core:setup');
INSERT INTO `mshop_product_stock` VALUES ('2', '2', '1', '1', '3', null, '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_stock` VALUES ('3', '3', '1', '1', '0', '2015-01-01 12:00:00', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_product_stock` VALUES ('4', '5', '1', '1', '3', null, '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');

-- ----------------------------
-- Table structure for mshop_product_stock_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `mshop_product_stock_warehouse`;
CREATE TABLE `mshop_product_stock_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprostwa_sid_code` (`siteid`,`code`),
  KEY `idx_msprostwa_sid_label` (`siteid`,`label`),
  KEY `idx_msprostwa_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_msprostwa_sid_mtime` (`siteid`,`mtime`),
  KEY `idx_msprostwa_sid_editor` (`siteid`,`editor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_product_stock_warehouse
-- ----------------------------
INSERT INTO `mshop_product_stock_warehouse` VALUES ('1', '1', 'default', 'Default', '1', '2015-05-22 21:36:15', '2015-05-22 21:36:15', 'core:setup');

-- ----------------------------
-- Table structure for mshop_product_tag
-- ----------------------------
DROP TABLE IF EXISTS `mshop_product_tag`;
CREATE TABLE `mshop_product_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprota_sid_tid_lid_label` (`siteid`,`typeid`,`langid`,`label`),
  KEY `fk_msprota_typeid` (`typeid`),
  KEY `idx_msprota_sid_label` (`siteid`,`label`),
  KEY `idx_msprota_sid_langid` (`siteid`,`langid`),
  CONSTRAINT `fk_msprota_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_product_tag_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_product_tag
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_product_tag_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_product_tag_type`;
CREATE TABLE `mshop_product_tag_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprotaty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msprotaty_sid_status` (`siteid`,`status`),
  KEY `idx_msprotaty_sid_label` (`siteid`,`label`),
  KEY `idx_msprotaty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_product_tag_type
-- ----------------------------
INSERT INTO `mshop_product_tag_type` VALUES ('1', '1', 'product/tag', 'default', 'Default', '1', '2015-05-22 21:36:21', '2015-05-22 21:36:21', '');

-- ----------------------------
-- Table structure for mshop_product_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_product_type`;
CREATE TABLE `mshop_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msproty_sid_status` (`siteid`,`status`),
  KEY `idx_msproty_sid_code` (`siteid`,`code`),
  KEY `idx_msproty_sid_label` (`siteid`,`label`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_product_type
-- ----------------------------
INSERT INTO `mshop_product_type` VALUES ('1', '1', 'product', 'default', 'Article', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_type` VALUES ('2', '1', 'product', 'select', 'Selection', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');
INSERT INTO `mshop_product_type` VALUES ('3', '1', 'product', 'bundle', 'Bundle', '1', '2015-05-22 21:36:20', '2015-05-22 21:36:20', '');

-- ----------------------------
-- Table structure for mshop_service
-- ----------------------------
DROP TABLE IF EXISTS `mshop_service`;
CREATE TABLE `mshop_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msser_siteid_typeid_code` (`siteid`,`typeid`,`code`),
  KEY `fk_mstyp_typeid` (`typeid`),
  KEY `idx_msser_sid_status` (`siteid`,`status`),
  KEY `idx_msser_sid_prov` (`siteid`,`provider`),
  KEY `idx_msser_sid_code` (`siteid`,`code`),
  KEY `idx_msser_sid_label` (`siteid`,`label`),
  KEY `idx_msser_sid_pos` (`siteid`,`pos`),
  KEY `idx_msser_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_msser_sid_mtime` (`siteid`,`mtime`),
  KEY `idx_msser_sid_editor` (`siteid`,`editor`),
  CONSTRAINT `fk_mstyp_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_service_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_service
-- ----------------------------
INSERT INTO `mshop_service` VALUES ('1', '1', '0', '2', 'demo-dhl', 'DHL', 'Manual,Reduction', '{\"reduction.basket-value-min\":{\"EUR\":\"200.00\"},\"reduction.percent\":100}', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service` VALUES ('2', '1', '1', '2', 'demo-dhlexpress', 'DHL Express', 'Manual', '[]', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service` VALUES ('3', '1', '2', '2', 'demo-fedex', 'Fedex', 'Manual', '[]', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service` VALUES ('4', '1', '4', '2', 'demo-tnt', 'TNT', 'Manual', '[]', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service` VALUES ('5', '1', '0', '1', 'demo-invoice', 'Invoice', 'PostPay', '[]', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service` VALUES ('6', '1', '1', '1', 'demo-sepa', 'Direct debit', 'DirectDebit', '[]', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service` VALUES ('7', '1', '2', '1', 'demo-paypal', 'PayPal', 'PayPalExpress', '{\"paypalexpress.AccountEmail\":\"selling2@metaways.de\",\"paypalexpress.ApiUsername\":\"unit_1340199666_biz_api1.yahoo.de\",\"paypalexpress.ApiPassword\":\"1340199685\",\"paypalexpress.ApiSignature\":\"A34BfbVoMVoHt7Sf8BlufLXS8tKcAVxmJoDiDUgBjWi455pJoZXGoJ87\",\"paypalexpress.PaypalUrl\":\"https:\\/\\/www.sandbox.paypal.com\\/webscr&cmd=_express-checkout&useraction=commit&token=%1$s\",\"paypalexpress.ApiEndpoint\":\"https:\\/\\/api-3t.sandbox.paypal.com\\/nvp\"}', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service` VALUES ('8', '1', '3', '1', 'demo-cashondelivery', 'Cash on delivery', 'PostPay', '[]', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service` VALUES ('9', '1', '4', '1', 'demo-prepay', 'Prepayment', 'PrePay', '[]', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');

-- ----------------------------
-- Table structure for mshop_service_list
-- ----------------------------
DROP TABLE IF EXISTS `mshop_service_list`;
CREATE TABLE `mshop_service_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `refid` varchar(32) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserli_sid_dm_rid_tid_pid` (`siteid`,`domain`,`refid`,`typeid`,`parentid`),
  KEY `fk_msserli_typeid` (`typeid`),
  KEY `idx_msserli_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_msserli_pid_sid_rid_dom_tid` (`parentid`,`siteid`,`refid`,`domain`,`typeid`),
  KEY `idx_msserli_pid_sid_start` (`parentid`,`siteid`,`start`),
  KEY `idx_msserli_pid_sid_end` (`parentid`,`siteid`,`end`),
  KEY `idx_msserli_pid_sid_pos` (`parentid`,`siteid`,`pos`),
  CONSTRAINT `fk_msserli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msserli_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_service_list_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_service_list
-- ----------------------------
INSERT INTO `mshop_service_list` VALUES ('1', '1', '1', '4', 'media', '18', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('2', '1', '1', '6', 'price', '27', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('3', '1', '1', '6', 'price', '28', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('4', '1', '1', '8', 'text', '67', null, null, '[]', '1', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('5', '1', '1', '8', 'text', '68', null, null, '[]', '2', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('6', '1', '1', '8', 'text', '69', null, null, '[]', '3', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('7', '1', '1', '8', 'text', '70', null, null, '[]', '4', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('8', '2', '1', '4', 'media', '19', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('9', '2', '1', '6', 'price', '29', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('10', '2', '1', '6', 'price', '30', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('11', '2', '1', '8', 'text', '71', null, null, '[]', '1', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('12', '2', '1', '8', 'text', '72', null, null, '[]', '2', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('13', '2', '1', '8', 'text', '73', null, null, '[]', '3', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('14', '2', '1', '8', 'text', '74', null, null, '[]', '4', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('15', '3', '1', '4', 'media', '20', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('16', '3', '1', '6', 'price', '31', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('17', '3', '1', '6', 'price', '32', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('18', '3', '1', '8', 'text', '75', null, null, '[]', '1', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('19', '3', '1', '8', 'text', '76', null, null, '[]', '2', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('20', '3', '1', '8', 'text', '77', null, null, '[]', '3', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('21', '3', '1', '8', 'text', '78', null, null, '[]', '4', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('22', '4', '1', '4', 'media', '21', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('23', '4', '1', '6', 'price', '33', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('24', '4', '1', '6', 'price', '34', null, null, '[]', '0', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('25', '4', '1', '8', 'text', '79', null, null, '[]', '1', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('26', '4', '1', '8', 'text', '80', null, null, '[]', '2', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('27', '4', '1', '8', 'text', '81', null, null, '[]', '3', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('28', '4', '1', '8', 'text', '82', null, null, '[]', '4', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('29', '5', '1', '4', 'media', '22', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('30', '5', '1', '6', 'price', '35', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('31', '5', '1', '6', 'price', '36', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('32', '5', '1', '8', 'text', '83', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('33', '5', '1', '8', 'text', '84', null, null, '[]', '1', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('34', '5', '1', '8', 'text', '85', null, null, '[]', '2', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('35', '5', '1', '8', 'text', '86', null, null, '[]', '3', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('36', '5', '1', '8', 'text', '87', null, null, '[]', '4', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('37', '6', '1', '4', 'media', '23', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('38', '6', '1', '4', 'media', '24', null, null, '[]', '1', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('39', '6', '1', '6', 'price', '37', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('40', '6', '1', '6', 'price', '38', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('41', '6', '1', '8', 'text', '88', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('42', '6', '1', '8', 'text', '89', null, null, '[]', '1', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('43', '6', '1', '8', 'text', '90', null, null, '[]', '2', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('44', '6', '1', '8', 'text', '91', null, null, '[]', '3', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('45', '6', '1', '8', 'text', '92', null, null, '[]', '4', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('46', '7', '1', '4', 'media', '25', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('47', '7', '1', '6', 'price', '39', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('48', '7', '1', '6', 'price', '40', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('49', '7', '1', '8', 'text', '93', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('50', '7', '1', '8', 'text', '94', null, null, '[]', '1', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('51', '7', '1', '8', 'text', '95', null, null, '[]', '2', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('52', '7', '1', '8', 'text', '96', null, null, '[]', '3', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('53', '8', '1', '4', 'media', '26', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('54', '8', '1', '6', 'price', '41', null, null, '[]', '0', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('55', '8', '1', '6', 'price', '42', null, null, '[]', '0', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('56', '8', '1', '8', 'text', '97', null, null, '[]', '0', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('57', '8', '1', '8', 'text', '98', null, null, '[]', '1', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('58', '8', '1', '8', 'text', '99', null, null, '[]', '2', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('59', '8', '1', '8', 'text', '100', null, null, '[]', '3', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('60', '9', '1', '4', 'media', '27', null, null, '[]', '0', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('61', '9', '1', '6', 'price', '43', null, null, '[]', '0', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('62', '9', '1', '6', 'price', '44', null, null, '[]', '0', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('63', '9', '1', '8', 'text', '101', null, null, '[]', '0', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('64', '9', '1', '8', 'text', '102', null, null, '[]', '1', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('65', '9', '1', '8', 'text', '103', null, null, '[]', '2', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('66', '9', '1', '8', 'text', '104', null, null, '[]', '3', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_service_list` VALUES ('67', '9', '1', '8', 'text', '105', null, null, '[]', '4', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');

-- ----------------------------
-- Table structure for mshop_service_list_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_service_list_type`;
CREATE TABLE `mshop_service_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msserlity_sid_status` (`siteid`,`status`),
  KEY `idx_msserlity_sid_label` (`siteid`,`label`),
  KEY `idx_msserlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_service_list_type
-- ----------------------------
INSERT INTO `mshop_service_list_type` VALUES ('1', '1', 'product', 'default', 'Default', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_service_list_type` VALUES ('2', '1', 'attribute', 'default', 'Default', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_service_list_type` VALUES ('3', '1', 'catalog', 'default', 'Default', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_service_list_type` VALUES ('4', '1', 'media', 'default', 'Default', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_service_list_type` VALUES ('5', '1', 'media', 'icon', 'Icon', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_service_list_type` VALUES ('6', '1', 'price', 'default', 'Default', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_service_list_type` VALUES ('7', '1', 'service', 'default', 'Default', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_service_list_type` VALUES ('8', '1', 'text', 'default', 'Default', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');

-- ----------------------------
-- Table structure for mshop_service_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_service_type`;
CREATE TABLE `mshop_service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msserty_sid_status` (`siteid`,`status`),
  KEY `idx_msserty_sid_code` (`siteid`,`code`),
  KEY `idx_msserty_sid_label` (`siteid`,`label`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_service_type
-- ----------------------------
INSERT INTO `mshop_service_type` VALUES ('1', '1', 'service', 'payment', 'Payment', '1', '2015-05-22 21:36:21', '2015-05-22 21:36:21', '');
INSERT INTO `mshop_service_type` VALUES ('2', '1', 'service', 'delivery', 'Delivery', '1', '2015-05-22 21:36:21', '2015-05-22 21:36:21', '');

-- ----------------------------
-- Table structure for mshop_supplier
-- ----------------------------
DROP TABLE IF EXISTS `mshop_supplier`;
CREATE TABLE `mshop_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mssup_sid_status` (`siteid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_supplier_address
-- ----------------------------
DROP TABLE IF EXISTS `mshop_supplier_address`;
CREATE TABLE `mshop_supplier_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `refid` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `vatid` varchar(32) NOT NULL,
  `salutation` varchar(8) NOT NULL,
  `title` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `address3` varchar(255) NOT NULL,
  `postal` varchar(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `countryid` char(2) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefax` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `flag` int(11) NOT NULL,
  `pos` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mssupad_refid` (`refid`),
  KEY `idx_mssupad_sid_rid` (`siteid`,`refid`),
  CONSTRAINT `fk_mssupad_refid` FOREIGN KEY (`refid`) REFERENCES `mshop_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_supplier_address
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_text
-- ----------------------------
DROP TABLE IF EXISTS `mshop_text`;
CREATE TABLE `mshop_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `label` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mstex_typeid` (`typeid`),
  KEY `idx_mstex_sid_status_langid` (`siteid`,`status`,`langid`),
  KEY `idx_mstex_sid_dom_lid` (`siteid`,`domain`,`langid`),
  KEY `idx_mstex_sid_dom_label` (`siteid`,`domain`,`label`),
  KEY `idx_mstex_sid_dom_cont` (`siteid`,`domain`,`content`(255)),
  KEY `idx_mstex_sid_dom_ctime` (`siteid`,`domain`,`ctime`),
  KEY `idx_mstex_sid_dom_mtime` (`siteid`,`domain`,`mtime`),
  KEY `idx_mstex_sid_dom_editor` (`siteid`,`domain`,`editor`),
  CONSTRAINT `fk_mstex_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_text_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_text
-- ----------------------------
INSERT INTO `mshop_text` VALUES ('1', '1', 'de', '1', 'attribute', 'Demo name/de: Schwarz', 'Schwarz', '1', '2015-05-22 21:36:26', '2015-05-22 21:36:26', 'core:setup');
INSERT INTO `mshop_text` VALUES ('2', '1', 'en', '1', 'attribute', 'Demo name/en: Black', 'Black', '1', '2015-05-22 21:36:26', '2015-05-22 21:36:26', 'core:setup');
INSERT INTO `mshop_text` VALUES ('3', '1', 'de', '4', 'attribute', 'Demo url/de: Schwarz', 'Schwarz', '1', '2015-05-22 21:36:26', '2015-05-22 21:36:26', 'core:setup');
INSERT INTO `mshop_text` VALUES ('4', '1', 'en', '4', 'attribute', 'Demo url/en: Black', 'Black', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('5', '1', 'de', '1', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Kleiner Aufdruck', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('6', '1', 'en', '1', 'attribute', 'Demo name/en: Small print', 'Small print', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('7', '1', 'de', '4', 'attribute', 'Demo url/de: Kleiner Aufdruck', 'Kleiner_Aufdruck', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('8', '1', 'en', '4', 'attribute', 'Demo url/en: Small print', 'small_print', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('9', '1', 'de', '1', 'attribute', 'Demo name/de: Grosser Aufdruck', 'Grosser Aufdruck', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('10', '1', 'en', '1', 'attribute', 'Demo name/en: Large print', 'Large print', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('11', '1', 'de', '4', 'attribute', 'Demo url/de: Grosser Aufdruck', 'Grosser_Aufdruck', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('12', '1', 'en', '4', 'attribute', 'Demo url/en: Large print', 'large_print', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('13', '1', 'de', '4', 'attribute', 'Demo url/de: Kleiner Aufdruck', 'Text_Aufdruck', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('14', '1', 'en', '4', 'attribute', 'Demo url/en: Small print', 'print_text', '1', '2015-05-22 21:36:27', '2015-05-22 21:36:27', 'core:setup');
INSERT INTO `mshop_text` VALUES ('15', '1', 'de', '15', 'product', 'Demo name/de: Demoartikel', 'Demoartikel', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('16', '1', 'de', '16', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('17', '1', 'de', '17', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('18', '1', 'en', '16', 'product', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('19', '1', 'en', '17', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('20', '1', 'de', '1', 'attribute', 'Demo name/de: Blau', 'Blau', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('21', '1', 'en', '1', 'attribute', 'Demo name/en: Blue', 'Blue', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('22', '1', 'de', '4', 'attribute', 'Demo url/de: Blau', 'Blau', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('23', '1', 'en', '4', 'attribute', 'Demo url/en: Blue', 'blue', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('24', '1', null, '1', 'attribute', 'Demo name: Width 32', '32', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('25', '1', 'de', '4', 'attribute', 'Demo url: Width 32', 'Weite_32', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('26', '1', 'en', '4', 'attribute', 'Demo url: Width 32', 'width_32', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('27', '1', null, '1', 'attribute', 'Demo name: Length 34', '34', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('28', '1', 'de', '4', 'attribute', 'Demo url: Length 34', 'Länge_34', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('29', '1', 'en', '4', 'attribute', 'Demo url: Length 34', 'length_34', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('30', '1', 'de', '1', 'attribute', 'Demo name/de: Beige', 'Beige', '1', '2015-05-22 21:36:28', '2015-05-22 21:36:28', 'core:setup');
INSERT INTO `mshop_text` VALUES ('31', '1', 'en', '1', 'attribute', 'Demo name/en: Beige', 'Beige', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('32', '1', 'de', '4', 'attribute', 'Demo url/de: Beige', 'Beige', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('33', '1', 'en', '4', 'attribute', 'Demo url/en: Beige', 'beige', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('34', '1', null, '1', 'attribute', 'Demo name: Width 33', '33', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('35', '1', 'de', '4', 'attribute', 'Demo url: Width 33', 'Weite_33', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('36', '1', 'en', '4', 'attribute', 'Demo url: Width 33', 'width_33', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('37', '1', null, '1', 'attribute', 'Demo name: Length 36', '36', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('38', '1', null, '4', 'attribute', 'Demo url: Length 36', 'Länge_36', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('39', '1', null, '4', 'attribute', 'Demo url: Length 36', 'length_36', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('40', '1', 'de', '1', 'attribute', 'Demo name/de: Kleines Etikett', 'Kleines Etikett', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('41', '1', 'en', '1', 'attribute', 'Demo name/en: Small sticker', 'Small sticker', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('42', '1', 'de', '4', 'attribute', 'Demo url/de: Kleines Etikett', 'Kleines_Etikett', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('43', '1', 'en', '4', 'attribute', 'Demo url/en: Small sticker', 'small_sticker', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('44', '1', 'de', '1', 'attribute', 'Demo name/de: Grosses Etikett', 'Grosses Etikett', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('45', '1', 'en', '1', 'attribute', 'Demo name/en: Large sticker', 'Large sticker', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('46', '1', 'de', '4', 'attribute', 'Demo url/de: Grosses Etikett', 'Grosses_Etikett', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('47', '1', 'en', '4', 'attribute', 'Demo url/en: Large sticker', 'large_sticker', '1', '2015-05-22 21:36:29', '2015-05-22 21:36:29', 'core:setup');
INSERT INTO `mshop_text` VALUES ('48', '1', 'de', '15', 'product', 'Demo name/de: Demoartikel mit Auswahl', 'Demoartikel mit Auswahl', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_text` VALUES ('49', '1', 'de', '18', 'product', 'Demo url/de: Demoartikel mit Auswahl', 'Demoartikel_mit_Auswahl', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_text` VALUES ('50', '1', 'de', '16', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels mit Auswahl', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_text` VALUES ('51', '1', 'de', '17', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels mit Auswahl, die gerne etwas länger sein darf.', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_text` VALUES ('52', '1', 'en', '16', 'product', 'Demo short/en: This is the short description', 'This is the short description of the selection demo article.', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_text` VALUES ('53', '1', 'en', '17', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the selection demo article that may be a little bit longer.', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_text` VALUES ('54', '1', 'de', '15', 'product', 'Demo name/de: Demoartikel mit Bundle', 'Demoartikel mit Bundle', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_text` VALUES ('55', '1', 'de', '18', 'product', 'Demo url/de: Demoartikel mit Bundle', 'Demoartikel_mit_Bundle', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_text` VALUES ('56', '1', 'de', '16', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels mit Bundle', '1', '2015-05-22 21:36:30', '2015-05-22 21:36:30', 'core:setup');
INSERT INTO `mshop_text` VALUES ('57', '1', 'de', '17', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels mit Bundle, die gerne etwas länger sein darf.', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_text` VALUES ('58', '1', 'en', '16', 'product', 'Demo short/en: This is the short description', 'This is the short description of the bundle demo article.', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_text` VALUES ('59', '1', 'en', '17', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the bundle demo article that may be a little bit longer.', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_text` VALUES ('60', '1', 'de', '15', 'product', 'Demo name/de: Rabatt', 'Demorabatt', '1', '2015-05-22 21:36:31', '2015-05-22 21:36:31', 'core:setup');
INSERT INTO `mshop_text` VALUES ('61', '1', 'de', '7', 'catalog', 'Demo name/de: Start', 'Start', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_text` VALUES ('62', '1', 'de', '9', 'catalog', 'Demo url/de: Start', 'Start', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_text` VALUES ('63', '1', 'de', '5', 'catalog', 'Demo short/de: Dies ist der Kurztext', 'Dies ist der Kurztext für die Hauptkategorie ihres neuen Webshops.', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_text` VALUES ('64', '1', 'en', '5', 'catalog', 'Demo short/en: This is the short text', 'This is the short text for the main category of your new web shop.', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_text` VALUES ('65', '1', 'de', '6', 'catalog', 'Demo long/de: Hier kann eine ausführliche Einleitung', 'Hier kann eine ausführliche Einleitung für ihre Hauptkategorie stehen.', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_text` VALUES ('66', '1', 'en', '6', 'catalog', 'Demo long/en: Here you can add a long introduction', 'Here you can add a long introduction for you main category.', '1', '2015-05-22 21:36:32', '2015-05-22 21:36:32', 'core:setup');
INSERT INTO `mshop_text` VALUES ('67', '1', 'de', '22', 'service', 'Demo short/de: Lieferung innerhalb von drei Tagen', 'Lieferung innerhalb von drei Tagen.', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('68', '1', 'de', '23', 'service', 'Demo long/de: Die Lieferung erfolgt in der Regel', 'Die Lieferung erfolgt in der Regel innerhalb von drei Werktagen', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('69', '1', 'en', '22', 'service', 'Demo short/en: Delivery within three days', 'Delivery within three days', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('70', '1', 'en', '23', 'service', 'Demo long/en: The parcel is usually delivered', 'The parcel is usually delivered within three working days', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('71', '1', 'de', '22', 'service', 'Demo short/de: Lieferung am nächsten Tag', 'Lieferung am nächsten Tag.', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('72', '1', 'de', '23', 'service', 'Demo long/de: Bei Bestellungen bis 16:00 Uhr', 'Bei Bestellungen bis 16:00 Uhr erfolgt die Lieferung am nächsten Werktag', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('73', '1', 'en', '22', 'service', 'Demo short/en: Delivery on the next day', 'Delivery on the next day', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('74', '1', 'en', '23', 'service', 'Demo long/en: If you order till 16 o\'clock', 'If you order till 16 o\'clock the delivery will be on the next working day', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('75', '1', 'de', '22', 'service', 'Demo short/de: Lieferung innerhalb von drei Tagen', 'Lieferung innerhalb von drei Tagen.', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('76', '1', 'de', '23', 'service', 'Demo long/de: Die Lieferung erfolgt in der Regel', 'Die Lieferung erfolgt in der Regel innerhalb von drei Werktagen', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('77', '1', 'en', '22', 'service', 'Demo short/en: Delivery within three days', 'Delivery within three days', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('78', '1', 'en', '23', 'service', 'Demo long/en: The parcel is usually delivered', 'The parcel is usually delivered within three working days', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('79', '1', 'de', '22', 'service', 'Demo short/de: Lieferung innerhalb von drei Tagen', 'Lieferung innerhalb von drei Tagen.', '1', '2015-05-22 21:36:35', '2015-05-22 21:36:35', 'core:setup');
INSERT INTO `mshop_text` VALUES ('80', '1', 'de', '23', 'service', 'Demo long/de: Die Lieferung erfolgt in der Regel', 'Die Lieferung erfolgt in der Regel innerhalb von drei Werktagen', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('81', '1', 'en', '22', 'service', 'Demo short/en: Delivery within three days', 'Delivery within three days', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('82', '1', 'en', '23', 'service', 'Demo long/en: The parcel is usually delivered', 'The parcel is usually delivered within three working days', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('83', '1', 'de', '21', 'service', 'Demo name/de: Rechnung', 'Rechnung', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('84', '1', 'de', '22', 'service', 'Demo short/de: Zahlung per Rechnung', 'Zahlung per Rechnung innerhalb von 14 Tagen.', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('85', '1', 'de', '23', 'service', 'Demo long/de: Bitte überweisen Sie den Betrag', 'Bitte überweisen Sie den Betrag innerhalb von 14 Tagen an BIC: XXX, IBAN: YYY', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('86', '1', 'en', '22', 'service', 'Demo short/en: Pay by invoice', 'Pay by invoice within 14 days', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('87', '1', 'en', '23', 'service', 'Demo long/en: Please transfer the money', 'Please transfer the money within 14 days to BIC: XXX, IBAN: YYY', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('88', '1', 'de', '21', 'service', 'Demo name/de: Lastschrift', 'Lastschrift', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('89', '1', 'de', '22', 'service', 'Demo short/de: Abbuchung vom angegebenen Konto', 'Abbuchung vom angegebenen Konto.', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('90', '1', 'de', '23', 'service', 'Demo long/de: Der Betrag wird in den nächsten 1-3 Tagen', 'Der Betrag wird in den nächsten 1-3 Tagen von Ihrem Konto abgebucht', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('91', '1', 'en', '22', 'service', 'Demo short/en: Payment via your bank account', 'Payment via your bank account', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('92', '1', 'en', '23', 'service', 'Demo long/en: The money will be collected', 'The money will be collected from your bank account within 1-3 days', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('93', '1', 'de', '22', 'service', 'Demo short/de: Zahlung mit ihrem PayPal Konto', 'Zahlung mit PayPal', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('94', '1', 'de', '23', 'service', 'Demo long/de: Einfache Bezahlung mit Ihrem PayPal Konto', 'Einfache Bezahlung mit Ihrem PayPal Konto.', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('95', '1', 'en', '22', 'service', 'Demo short/en: Payment via your PayPal account', 'Payment via PayPal', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('96', '1', 'en', '23', 'service', 'Demo long/en: Easy and secure payment with your PayPal account', 'Easy and secure payment with your PayPal account', '1', '2015-05-22 21:36:36', '2015-05-22 21:36:36', 'core:setup');
INSERT INTO `mshop_text` VALUES ('97', '1', 'de', '21', 'service', 'Demo name/de: Nachnahme', 'Nachnahme', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_text` VALUES ('98', '1', 'de', '22', 'service', 'Demo short/de: Zahlung bei Lieferung', 'Zahlung bei Lieferung.', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_text` VALUES ('99', '1', 'de', '23', 'service', 'Demo long/de: Die Bezahlung erfolgt bei Übergabe der Ware', 'Die Bezahlung erfolgt bei Übergabe der Ware', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_text` VALUES ('100', '1', 'en', '22', 'service', 'Demo short/en: Pay cash on delivery of the parcel', 'Pay cash on delivery of the parcel', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_text` VALUES ('101', '1', 'de', '21', 'service', 'Demo name/de: Vorauskasse', 'Vorauskasse', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_text` VALUES ('102', '1', 'de', '22', 'service', 'Demo short/de: Versand der Ware nach Zahlungseingang', 'Versand der Ware nach Zahlungseingang.', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_text` VALUES ('103', '1', 'de', '23', 'service', 'Demo long/de: Bitte überweisen Sie den Betrag', 'Bitte überweisen Sie den Betrag an BIC: XXX, IBAN: YYY', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_text` VALUES ('104', '1', 'en', '22', 'service', 'Demo short/en: The parcel will be shipped after the payment has been received', 'The parcel will be shipped after the payment has been received', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');
INSERT INTO `mshop_text` VALUES ('105', '1', 'en', '23', 'service', 'Demo long/en: Please transfer the money', 'Please transfer the money to BIC: XXX, IBAN: YYY', '1', '2015-05-22 21:36:37', '2015-05-22 21:36:37', 'core:setup');

-- ----------------------------
-- Table structure for mshop_text_list
-- ----------------------------
DROP TABLE IF EXISTS `mshop_text_list`;
CREATE TABLE `mshop_text_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `refid` varchar(32) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexli_sid_dm_rid_tid_pid` (`siteid`,`domain`,`refid`,`typeid`,`parentid`),
  KEY `fk_mstexli_typeid` (`typeid`),
  KEY `idx_mstexli_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_mstexli_pid_sid_rid_dom_tid` (`parentid`,`siteid`,`refid`,`domain`,`typeid`),
  KEY `idx_mstexli_pid_sid_start` (`parentid`,`siteid`,`start`),
  KEY `idx_mstexli_pid_sid_end` (`parentid`,`siteid`,`end`),
  KEY `idx_mstexli_pid_sid_pos` (`parentid`,`siteid`,`pos`),
  CONSTRAINT `fk_mstexli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mstexli_typeid` FOREIGN KEY (`typeid`) REFERENCES `mshop_text_list_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_text_list
-- ----------------------------

-- ----------------------------
-- Table structure for mshop_text_list_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_text_list_type`;
CREATE TABLE `mshop_text_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mstexlity_sid_status` (`siteid`,`status`),
  KEY `idx_mstexlity_sid_label` (`siteid`,`label`),
  KEY `idx_mstexlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_text_list_type
-- ----------------------------
INSERT INTO `mshop_text_list_type` VALUES ('1', '1', 'product', 'default', 'Default', '1', '2015-05-22 21:36:23', '2015-05-22 21:36:23', '');
INSERT INTO `mshop_text_list_type` VALUES ('2', '1', 'attribute', 'default', 'Default', '1', '2015-05-22 21:36:23', '2015-05-22 21:36:23', '');
INSERT INTO `mshop_text_list_type` VALUES ('3', '1', 'catalog', 'default', 'Default', '1', '2015-05-22 21:36:23', '2015-05-22 21:36:23', '');
INSERT INTO `mshop_text_list_type` VALUES ('4', '1', 'media', 'default', 'Default', '1', '2015-05-22 21:36:23', '2015-05-22 21:36:23', '');
INSERT INTO `mshop_text_list_type` VALUES ('5', '1', 'price', 'default', 'Default', '1', '2015-05-22 21:36:23', '2015-05-22 21:36:23', '');
INSERT INTO `mshop_text_list_type` VALUES ('6', '1', 'service', 'default', 'Default', '1', '2015-05-22 21:36:23', '2015-05-22 21:36:23', '');
INSERT INTO `mshop_text_list_type` VALUES ('7', '1', 'text', 'default', 'Default', '1', '2015-05-22 21:36:23', '2015-05-22 21:36:23', '');

-- ----------------------------
-- Table structure for mshop_text_type
-- ----------------------------
DROP TABLE IF EXISTS `mshop_text_type`;
CREATE TABLE `mshop_text_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mstexty_sid_status` (`siteid`,`status`),
  KEY `idx_mstexty_sid_code` (`siteid`,`code`),
  KEY `idx_mstexty_sid_label` (`siteid`,`label`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mshop_text_type
-- ----------------------------
INSERT INTO `mshop_text_type` VALUES ('1', '1', 'attribute', 'name', 'Name', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('2', '1', 'attribute', 'short', 'Short description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('3', '1', 'attribute', 'long', 'Long description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('4', '1', 'attribute', 'url', 'URL segment', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('5', '1', 'catalog', 'short', 'Short description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('6', '1', 'catalog', 'long', 'Long description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('7', '1', 'catalog', 'name', 'Name', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('8', '1', 'catalog', 'quote', 'Quote', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('9', '1', 'catalog', 'url', 'URL segment', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('10', '1', 'catalog', 'meta-keyword', 'Meta keywords', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('11', '1', 'catalog', 'meta-description', 'Meta description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('12', '1', 'media', 'short', 'Short description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('13', '1', 'media', 'long', 'Long description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('14', '1', 'media', 'name', 'Name', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('15', '1', 'product', 'name', 'Name', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('16', '1', 'product', 'short', 'Short description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('17', '1', 'product', 'long', 'Long description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('18', '1', 'product', 'url', 'URL segment', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('19', '1', 'product', 'meta-keyword', 'Meta keywords', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('20', '1', 'product', 'meta-description', 'Meta description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('21', '1', 'service', 'name', 'Name', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('22', '1', 'service', 'short', 'Short description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');
INSERT INTO `mshop_text_type` VALUES ('23', '1', 'service', 'long', 'Long description', '1', '2015-05-22 21:36:22', '2015-05-22 21:36:22', '');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `salutation` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryid` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `telefax` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `vdate` date DEFAULT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_langid_index` (`langid`),
  KEY `users_status_lastname_firstname_index` (`status`,`lastname`,`firstname`),
  KEY `users_status_address1_address2_index` (`status`,`address1`,`address2`),
  KEY `users_lastname_index` (`lastname`),
  KEY `users_address1_index` (`address1`),
  KEY `users_city_index` (`city`),
  KEY `users_postal_index` (`postal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for users_address
-- ----------------------------
DROP TABLE IF EXISTS `users_address`;
CREATE TABLE `users_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `refid` int(10) unsigned NOT NULL,
  `company` varchar(100) NOT NULL,
  `vatid` varchar(32) NOT NULL,
  `salutation` varchar(8) NOT NULL,
  `title` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `address3` varchar(255) NOT NULL,
  `postal` varchar(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `countryid` char(2) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefax` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `flag` int(11) NOT NULL,
  `pos` smallint(6) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lvuad_refid` (`refid`),
  KEY `idx_lvuad_ln_fn` (`lastname`,`firstname`),
  KEY `idx_lvuad_ad1_ad2` (`address1`,`address2`),
  KEY `idx_lvuad_post_ci` (`postal`,`city`),
  KEY `idx_lvuad_city` (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_address
-- ----------------------------

-- ----------------------------
-- Table structure for users_list
-- ----------------------------
DROP TABLE IF EXISTS `users_list`;
CREATE TABLE `users_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `typeid` int(11) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `refid` varchar(32) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvuli_sid_dm_rid_tid_pid` (`siteid`,`domain`,`refid`,`typeid`,`parentid`),
  KEY `fk_lvuli_typeid` (`typeid`),
  KEY `idx_lvuli_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_lvuli_pid_sid_rid_dom_tid` (`parentid`,`siteid`,`refid`,`domain`,`typeid`),
  KEY `idx_lvuli_pid_sid_start` (`parentid`,`siteid`,`start`),
  KEY `idx_lvuli_pid_sid_end` (`parentid`,`siteid`,`end`),
  KEY `idx_lvuli_pid_sid_pos` (`parentid`,`siteid`,`pos`),
  KEY `idx_lvuli_pid_sid_tid` (`parentid`,`siteid`,`typeid`),
  CONSTRAINT `fk_lvuli_typeid` FOREIGN KEY (`typeid`) REFERENCES `users_list_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_list
-- ----------------------------

-- ----------------------------
-- Table structure for users_list_type
-- ----------------------------
DROP TABLE IF EXISTS `users_list_type`;
CREATE TABLE `users_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvulity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_lvulity_sid_status` (`siteid`,`status`),
  KEY `idx_lvulity_sid_label` (`siteid`,`label`),
  KEY `idx_lvulity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_list_type
-- ----------------------------
