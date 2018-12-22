/*
-- ################################################################################### --
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
-- ################################################################################### --
--
-- CORE MOD: NPC_CODEBOX
-- NPC ID: 601021
-- 
-- Meet Retdream, the Keeper of Codes. She’s a codebox NPC that emotes and speaks. This 
-- NPC takes codes from the player and checks them against custom database tables to 
-- determine the loot. You can set charges for items to allow players to use the code 
-- once or a specific number of times. It also supports unique codes that can only be 
-- used once by any player.
--
-- // Sample Codes
-- These codes will add the following items to the player's inventory:
-- artifact: A one-charge code from a questgiver or GM.
-- ballroom: A multi-charge code giving three items for a tuxedo outfit.
-- sixbags: A limited multi-charge code giving 6 Netherweave bags to the player.
--
-- // *** NOTICE ***
-- Worldserver will crash if this data has not been committed to the database!
-- Comment the drop/create for 'lootcode_player' to avoid overwriting player data.
--
-- ################################################################################### --
*/

USE stygian_world;

-- --------------------------------------------------------------------------------------
--	CODEBOX - 601021
-- --------------------------------------------------------------------------------------
SET
@Entry 		:= 601021,
@Model 		:= 16804, -- Elven Jeweler
@Name 		:= "Retdream",
@Title 		:= "Keeper of Codes",
@Icon 		:= "Buy",
@GossipMenu := 0,
@MinLevel 	:= 80,
@MaxLevel 	:= 80,
@Faction 	:= 35,
@NPCFlag 	:= 1,
@Scale		:= 1.0,
@Rank		:= 0,
@Type 		:= 7,
@TypeFlags 	:= 138936390,
@FlagsExtra := 2,
@AIName		:= "SmartAI",
@Script 	:= "codebox_npc";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC Text
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Greetings $N. Do you have a loot code to redeem?');

-- --------------------------------------------------------------------------------------
-- Table structure for lootcode_items
-- --------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `lootcode_items`;
CREATE TABLE `lootcode_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) DEFAULT NULL,
  `itemId` int(7) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(14) NOT NULL DEFAULT '1',
  `gold` int(14) unsigned DEFAULT NULL,
  `charges` tinyint(5) DEFAULT '1',
  `isUnique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------------------------------------
-- Default Records of lootcode_items
-- --------------------------------------------------------------------------------------
--                                    ID     CODE        ITEMID   NAME             Q     G    C    U
INSERT INTO `lootcode_items` VALUES ('1', 'threebags', '21841', 'Netherweave Bag', '1', '0', '1', '0');
INSERT INTO `lootcode_items` VALUES ('2', 'artifact', '4696', 'Lapidis Tankard of Tidesippe', '1', '0', '1', '1');
INSERT INTO `lootcode_items` VALUES ('3', 'ballroom', '3419', 'Red Rose', '1', '0', '3', '0');
INSERT INTO `lootcode_items` VALUES ('4', 'ballroom', '6833', 'Tuxedo Shirt', '1', '0', '3', '0');
INSERT INTO `lootcode_items` VALUES ('5', 'ballroom', '6835', 'Tuxedo Pants', '1', '0', '3', '0');
INSERT INTO `lootcode_items` VALUES ('6', 'lockpick', '15869', 'Skeleton Key', '5', '0', '3', '0');

-- --------------------------------------------------------------------------------------
-- Table structure for lootcode_player
-- Comment this to avoid overwriting existing 'lootcore_player' data.
-- --------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `lootcode_player`;
CREATE TABLE `lootcode_player` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `playerGUID` int(7) unsigned DEFAULT NULL,
  `isUnique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `redeemed` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
