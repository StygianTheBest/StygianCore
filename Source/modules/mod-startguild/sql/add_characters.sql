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
-- AUTH: DEFAULT GUILDMASTER CHARACTERS
--
-- Creates two characters on the default admin account and sets them each to Guildmaster
-- for the Horde and Alliance default guilds. These are for use with the StygianCore
-- StartGuild module.
--
-- ###################################################################################### --
*/

USE stygian_characters;

-- --------------------------------------------------------------------------------------
-- Table structure for characters
-- --------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `xp` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `skin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `face` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hairStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hairColor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `facialStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bankSlots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `restState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `playerFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0',
  `instance_mode_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` text NOT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cinematic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `totaltime` int(10) unsigned NOT NULL DEFAULT '0',
  `leveltime` int(10) unsigned NOT NULL DEFAULT '0',
  `logout_time` int(10) unsigned NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int(10) unsigned NOT NULL DEFAULT '0',
  `resettalents_time` int(10) unsigned NOT NULL DEFAULT '0',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extra_flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stable_slots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `at_login` smallint(5) unsigned NOT NULL DEFAULT '0',
  `zone` smallint(5) unsigned NOT NULL DEFAULT '0',
  `death_expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  `taxi_path` text,
  `arenaPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `totalHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `todayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `totalKills` int(10) unsigned NOT NULL DEFAULT '0',
  `todayKills` smallint(5) unsigned NOT NULL DEFAULT '0',
  `yesterdayKills` smallint(5) unsigned NOT NULL DEFAULT '0',
  `chosenTitle` int(10) unsigned NOT NULL DEFAULT '0',
  `knownCurrencies` bigint(20) unsigned NOT NULL DEFAULT '0',
  `watchedFaction` int(10) unsigned NOT NULL DEFAULT '0',
  `drunk` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `health` int(10) unsigned NOT NULL DEFAULT '0',
  `power1` int(10) unsigned NOT NULL DEFAULT '0',
  `power2` int(10) unsigned NOT NULL DEFAULT '0',
  `power3` int(10) unsigned NOT NULL DEFAULT '0',
  `power4` int(10) unsigned NOT NULL DEFAULT '0',
  `power5` int(10) unsigned NOT NULL DEFAULT '0',
  `power6` int(10) unsigned NOT NULL DEFAULT '0',
  `power7` int(10) unsigned NOT NULL DEFAULT '0',
  `latency` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `talentGroupsCount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `activeTalentGroup` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `exploredZones` longtext,
  `equipmentCache` longtext,
  `ammoId` int(10) unsigned NOT NULL DEFAULT '0',
  `knownTitles` longtext,
  `actionBars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grantableLevels` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleteInfos_Account` int(10) unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) DEFAULT NULL,
  `deleteDate` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------------------------------------
-- Koiter 
-- Male Orc Warrior (HD Features: 8,3,2,5,0) (Default Features: 8,0,1,5,0)
-- Horde Default Guildmaster (GUID 1) 
-- Rest In Peace Twincruiser!
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_characters`.`characters` (`guid`, `account`, `name`, `race`, `class`, `gender`, `level`, `xp`, `money`, `skin`, `face`, `hairStyle`, `hairColor`, `facialStyle`, `bankSlots`, `restState`, `playerFlags`, `position_x`, `position_y`, `position_z`, `map`, `instance_id`, `instance_mode_mask`, `orientation`, `taximask`, `online`, `cinematic`, `totaltime`, `leveltime`, `logout_time`, `is_logout_resting`, `rest_bonus`, `resettalents_cost`, `resettalents_time`, `trans_x`, `trans_y`, `trans_z`, `trans_o`, `transguid`, `extra_flags`, `stable_slots`, `at_login`, `zone`, `death_expire_time`, `taxi_path`, `arenaPoints`, `totalHonorPoints`, `todayHonorPoints`, `yesterdayHonorPoints`, `totalKills`, `todayKills`, `yesterdayKills`, `chosenTitle`, `knownCurrencies`, `watchedFaction`, `drunk`, `health`, `power1`, `power2`, `power3`, `power4`, `power5`, `power6`, `power7`, `latency`, `talentGroupsCount`, `activeTalentGroup`, `exploredZones`, `equipmentCache`, `ammoId`, `knownTitles`, `actionBars`, `grantableLevels`, `deleteInfos_Account`, `deleteInfos_Name`, `deleteDate`) VALUES ('1', '1', 'Koiter', '2', '1', '0', '1', '0', '10000000', '8', '0', '1', '5', '0', '0', '2', '0', '-618.518', '-4251.67', '38.718', '1', '0', '0', '0', '4194304 0 0 4 0 0 0 0 0 0 0 0 0 0 ', '0', '0', '0', '0', '1544530457', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '32', '14', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4294967295', '0', '80', '0', '0', '0', '100', '0', '0', '0', '1', '1', '0', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0 0 0 0 0 0 6125 0 0 0 0 0 139 0 140 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 12282 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '0 0 0 0 0 0 ', '0', '0', NULL, NULL, NULL);

-- --------------------------------------------------------------------------------------
-- Miasara
-- Female Dwarf Warrior
-- Alliance Default Guildmaster (GUID: 2)
-- Thick dwarven females really stoke my forge!
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_characters`.`characters` (`guid`, `account`, `name`, `race`, `class`, `gender`, `level`, `xp`, `money`, `skin`, `face`, `hairStyle`, `hairColor`, `facialStyle`, `bankSlots`, `restState`, `playerFlags`, `position_x`, `position_y`, `position_z`, `map`, `instance_id`, `instance_mode_mask`, `orientation`, `taximask`, `online`, `cinematic`, `totaltime`, `leveltime`, `logout_time`, `is_logout_resting`, `rest_bonus`, `resettalents_cost`, `resettalents_time`, `trans_x`, `trans_y`, `trans_z`, `trans_o`, `transguid`, `extra_flags`, `stable_slots`, `at_login`, `zone`, `death_expire_time`, `taxi_path`, `arenaPoints`, `totalHonorPoints`, `todayHonorPoints`, `yesterdayHonorPoints`, `totalKills`, `todayKills`, `yesterdayKills`, `chosenTitle`, `knownCurrencies`, `watchedFaction`, `drunk`, `health`, `power1`, `power2`, `power3`, `power4`, `power5`, `power6`, `power7`, `latency`, `talentGroupsCount`, `activeTalentGroup`, `exploredZones`, `equipmentCache`, `ammoId`, `knownTitles`, `actionBars`, `grantableLevels`, `deleteInfos_Account`, `deleteInfos_Name`, `deleteDate`) VALUES ('2', '1', 'Miasara', '3', '1', '1', '1', '0', '10000000', '3', '4', '12', '7', '4', '0', '2', '0', '-6240.32', '331.033', '382.758', '0', '0', '0', '6.17716', '32 0 0 8 0 0 0 0 0 0 0 0 0 0 ', '0', '0', '0', '0', '1545278591', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '32', '1', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4294967295', '0', '90', '0', '0', '0', '100', '0', '0', '0', '1', '1', '0', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0 0 0 0 0 0 38 0 0 0 0 0 39 0 40 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 12282 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '0 0 0 0 0 0 ', '0', '0', NULL, NULL, NULL);

-- --------------------------------------------------------------------------------------
-- Table structure for item_instance
-- --------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `item_instance`;
CREATE TABLE `item_instance` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `itemEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `creatorGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `giftCreatorGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '1',
  `duration` int(10) NOT NULL DEFAULT '0',
  `charges` tinytext,
  `flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enchantments` text NOT NULL,
  `randomPropertyId` smallint(5) NOT NULL DEFAULT '0',
  `durability` smallint(5) unsigned NOT NULL DEFAULT '0',
  `playedTime` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item System';

-- --------------------------------------------------------------------------------------
-- PLAYER 1 (Koiter - Horde GM)
-- --------------------------------------------------------------------------------------
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('1', '10125', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '60', 'Ornate Pauldrons');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('2', '10118', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '100', 'Ornate Breastplate');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('3', '10122', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '35', 'Ornate Girdle');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('4', '10124', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '75', 'Ornate Legguards');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('5', '10119', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '50', 'Ornate Greaves');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('6', '10126', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '35', 'Ornate Bracers');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('7', '10121', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '35', 'Ornate Gauntlets');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('8', '10120', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '0', 'Ornate Cloak');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('9', '15229', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '75', 'Blesswind Hammer');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('10', '10362', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '85', 'Ornate Shield');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('11', '701002', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '0', 'Guildmaster\'s License');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('12', '701004', '1', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '0', 'Pocket Portal');

-- --------------------------------------------------------------------------------------
-- PLAYER 2 (MiaSara - Alliance GM)
-- --------------------------------------------------------------------------------------
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('13', '10125', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '60', 'Ornate Pauldrons');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('14', '10118', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '100', 'Ornate Breastplate');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('15', '10122', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '35', 'Ornate Girdle');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('16', '10124', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '75', 'Ornate Legguards');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('17', '10119', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '50', 'Ornate Greaves');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('18', '10126', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '35', 'Ornate Bracers');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('19', '10121', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '35', 'Ornate Gauntlets');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('20', '10120', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '0', 'Ornate Cloak');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('21', '15229', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '75', 'Blesswind Hammer');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('22', '10362', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '85', 'Ornate Shield');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('23', '701002', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '0', 'Guildmaster\'s License');
INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `count`, `enchantments`, `charges`, `durability`, `text`) VALUES ('24', '701004', '2', '1', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '0', '0', 'Pocket Portal');

-- --------------------------------------------------------------------------------------
-- Table structure for character_inventory
-- --------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `character_inventory`;
CREATE TABLE `character_inventory` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` int(10) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  PRIMARY KEY (`item`),
  UNIQUE KEY `guid` (`guid`,`bag`,`slot`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------------------------------------
-- PLAYER 1 (Koiter - Horde GM)
-- --------------------------------------------------------------------------------------

-- Equipped
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '2', '1'); -- Shoulders
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '4', '2'); -- Chest
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '5', '3'); -- Waist
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '6', '4'); -- Legs
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '7', '5'); -- Feet
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '8', '6'); -- Wrists
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '9', '7'); -- Hands
-- INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '14', '8'); -- Cloak
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '15', '9'); -- Main Hand
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '16', '10'); -- Shield

-- In Backpack
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '23', '11'); -- Pocket Portal (701002)
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '24', '12'); -- Gamemaster's License

-- --------------------------------------------------------------------------------------
-- PLAYER 2 (MiaSara - Alliance GM)
-- --------------------------------------------------------------------------------------

-- Equipped
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '2', '13'); -- Shoulders
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '4', '14'); -- Chest
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '5', '15'); -- Waist
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '6', '16'); -- Legs
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '7', '17'); -- Feet
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '8', '18'); -- Wrists
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '9', '19'); -- Hands
-- INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '14', '20'); -- Cloak
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '15', '21'); -- Main Hand
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '16', '22'); -- Shield

-- In Backpack
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '23', '23'); -- Pocket Portal
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('2', '0', '24', '24'); -- Gamemaster's License

-- --------------------------------------------------------------------------------------
-- Table structure for playercreateinfo_item
-- --------------------------------------------------------------------------------------
USE stygian_world;
DROP TABLE IF EXISTS `playercreateinfo_item`;
CREATE TABLE `playercreateinfo_item` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `amount` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`race`,`class`,`itemid`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- All players start with Pocket Portal 
INSERT INTO `stygian_world`.`playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('0', '0', '701002', '1');

-- --------------------------------------------------------------------------------------
-- REFERENCE/TEMPLATE
-- --------------------------------------------------------------------------------------

/*
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '0', '1'); -- Head
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '1', '1'); -- Neck
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '2', '1'); -- Shoulders
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '3', '1'); -- Body
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '4', '1'); -- Chest
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '5', '1'); -- Waist
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '6', '1'); -- Legs
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '7', '1'); -- Feet
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '8', '1'); -- Wrists
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '9', '1'); -- Hands
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '10', '1'); -- Finger 1
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '11', '1'); -- Finger 2
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '12', '1'); -- Trinket 1
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '13', '1'); -- Trinket 2
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '14', '1'); -- Back
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '15', '1'); -- Main Hand
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '16', '1'); -- Off Hand
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '17', '1'); -- Ranged
INSERT INTO `stygian_characters`.`character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES ('1', '0', '18', '1'); -- Tabard
*/