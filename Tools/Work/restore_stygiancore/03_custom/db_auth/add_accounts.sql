/*
-- ###################################################################################### --
--  ____    __                                         ____                           
-- /\  _`\ /\ \__                  __                 /\  _`\                         
-- \ \,\L\_\ \ ,_\  __  __     __ /\_\     __      ___\ \ \/\_\    ___   _ __    __   
--  \/_\__ \\ \ \/ /\ \/\ \  /'_ `\/\ \  /'__`\  /' _ `\ \ \/_/_  / __`\/\`'__\/'__`\ 
--    /\ \L\ \ \ \_\ \ \_\ \/\ \L\ \ \ \/\ \L\.\_/\ \/\ \ \ \L\ \/\ \L\ \ \ \//\  __/ 
--    \ `\____\ \__\\/`____ \ \____ \ \_\ \__/.\_\ \_\ \_\ \____/\ \____/\ \_\\ \____\
--     \/_____/\/__/ `/___/> \/___L\ \/_/\/__/\/_/\/_/\/_/\/___/  \/___/  \/_/ \/____/
--                      /\___/ /\____/                                                
--                      \/__/  \_/__/          http://stygianthebest.github.io                                         
-- 
-- ###################################################################################### --
--
-- AUTH: DEFAULT ADMIN ACCOUNT
-- ID 1: Admin
-- Creates a default GM account.
--
-- Login: admin
-- Pass: wow
--
-- ###################################################################################### --
*/

USE stygian_auth;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `token_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `reg_mail` varchar(255) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  `totaltime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Account System';

-- ----------------------------
-- Records of account
-- ----------------------------

-- Admin
INSERT INTO `account` VALUES ('1', 'ADMIN', 'D75C24A81F7448C8977EC63357E5B6F6002834E4', '', '', '', '', '', '', '2018-11-27 19:53:00', '127.0.0.1', '127.0.0.1', '0', '0', '00', '0000-00-00 00:00:00', '0', '2', '0', '', '', '0', '', '0', '0');

-- Graham
INSERT INTO `stygian_auth`.`account` (`id`, `username`, `sha_pass_hash`, `sessionkey`, `v`, `s`, `token_key`, `email`, `reg_mail`, `joindate`, `last_ip`, `last_attempt_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `expansion`, `mutetime`, `mutereason`, `muteby`, `locale`, `os`, `recruiter`, `totaltime`) VALUES ('2', 'GRAHAM', 'FD2769C76EA8EE83C34EC4004A42A963B07B1F8B', 'A61CC4F1DF9030FC3660B52608E75CBA81E8EE92810322A8F1524FC95F3ED068D74E9403D5311A00', '5AFA0E9E3897F8A2A39EAA4545DBE2CC36F664CDE649902714581E1281827E0F', 'CF2EE161EA0A1750B9B2912281902564ACD25E79400B5C9B1E0460D64F3F72B7', '', '', '', '2018-12-27 21:16:31', '192.168.1.11', '127.0.0.1', '0', '0', '00', '2018-12-27 21:16:49', '1', '2', '0', '', '', '0', 'Win', '0', '0');

-- Elise
INSERT INTO `stygian_auth`.`account` (`id`, `username`, `sha_pass_hash`, `sessionkey`, `v`, `s`, `token_key`, `email`, `reg_mail`, `joindate`, `last_ip`, `last_attempt_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `expansion`, `mutetime`, `mutereason`, `muteby`, `locale`, `os`, `recruiter`, `totaltime`) VALUES ('3', 'ELISE', 'E399533EF9B394FDB2BBF3A9479F5D4D084F91DF', 'BB55E0D5ED1F90683EB280F25E98E82451349062DA8CF4FDCAACE3557939CDE6BBDB4F801FE681B1', '673DE27EB7BFB2CD2CF9190189199CF61C6816846A8A5EFC704ACF1BC2443B28', 'A64753ECA98405C905B60647B9243AF32B0FFBA5E9A0FC4BC9BB09B403F5F7AD', '', '', '', '2018-12-27 21:16:46', '192.168.1.105', '127.0.0.1', '0', '0', '00', '2018-12-27 21:16:48', '1', '2', '0', '', '', '0', 'Win', '0', '0');

-- ----------------------------
-- Table structure for account_access
-- ----------------------------
DROP TABLE IF EXISTS `account_access`;
CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_access
-- ----------------------------
INSERT INTO `account_access` VALUES ('1', '3', '-1');
INSERT INTO `account_access` VALUES ('2', '3', '-1');
INSERT INTO `account_access` VALUES ('3', '3', '-1');

-- ----------------------------
-- Table structure for realmcharacters
-- ----------------------------
DROP TABLE IF EXISTS `realmcharacters`;
CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

-- ----------------------------
-- Records of realmcharacters
-- ----------------------------
INSERT INTO `realmcharacters` VALUES ('1', '1', '0');
INSERT INTO `realmcharacters` VALUES ('1', '2', '0');
INSERT INTO `realmcharacters` VALUES ('1', '3', '0');