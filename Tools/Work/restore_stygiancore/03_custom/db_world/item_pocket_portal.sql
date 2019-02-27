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
-- WORLD: POCKET PORTAL
--
-- Creates a personal teleporter that can be carried by the player.
--
-- This Trinity script has been around for a number of years, and during my port I found
-- the NPC would never despawn. The only reference I could find had a 'Teleporter Despawn' 
-- that did not work. I have added the missing Smart Script data flags that fix it. I
-- don't see how it would have worked on Trinity without this missing data either, so it
-- has likely been fucked up for years! 
--
-- ################################################################################### --
*/

USE stygian_world;

-- --------------------------------------------------------------------------------------
-- Pocket Portal
-- --------------------------------------------------------------------------------------
SET 
@ITEMENTRY 			:= 701002,
@NAME				:= "Pocket Portal",
@ENTRY 				:= 128,
@QUALITY			:= 7,
@MODEL				:= 29133,
@FLAGS				:= 134217728, -- BOA
@FLAGSEXTRA			:= 0,
@SCALE				:= 0.2,
@SOURCETYPE 		:= 0,
@COOLDOWN			:= 30000,
@TEXT_ID        	:= 300000,
@GOSSIP_MENU    	:= 50000,
@SCRIPTNAME			:= ""; -- internalitemhanler
-- --------------------------------------------------------------------------------------
-- Teleporter Item
-- --------------------------------------------------------------------------------------
DELETE FROM `item_template` WHERE (`entry`= @ITEMENTRY);
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `Duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `VerifiedBuild`) 
VALUES (@ITEMENTRY, 0, 0, @NAME, @Model, @QUALITY, @FLAGS, @FLAGSEXTRA, 1, 20000, 10000, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 897, 0, 0, 0, @COOLDOWN, 1193, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @SCRIPTNAME, 0, 0, 0, 0, 12340);

-- Easy View
UPDATE `stygian_world`.`item_template`
SET 
 `entry` = '701002',
 `class` = '0',
 `subclass` = '0',
 `SoundOverrideSubclass` = '-1',
 `name` = 'Pocket Portal',
 `displayid` = @Model, -- 26341 (Purple Jeeves), 30076 (Jeeves), 27320 (Goblin Mechanic), 21572 (Elven Portal Master)
 `Quality` = '7', -- BOA
 `Flags` = '134217728', -- BOA
 `FlagsExtra` = '0',
 `BuyCount` = '1',
 `BuyPrice` = '0',
 `SellPrice` = '0',
 `InventoryType` = '0',
 `AllowableClass` = '-1',
 `AllowableRace` = '-1',
 `ItemLevel` = '277',
 `RequiredLevel` = '0',
 `RequiredSkill` = '0',
 `RequiredSkillRank` = '0',
 `requiredspell` = '0',
 `requiredhonorrank` = '0',
 `RequiredCityRank` = '0',
 `RequiredReputationFaction` = '0',
 `RequiredReputationRank` = '0',
 `maxcount` = '0',
 `stackable` = '1',
 `ContainerSlots` = '0',
 `StatsCount` = '0',
 `stat_type1` = '0',
 `stat_value1` = '0',
 `stat_type2` = '0',
 `stat_value2` = '0',
 `stat_type3` = '0',
 `stat_value3` = '0',
 `stat_type4` = '0',
 `stat_value4` = '0',
 `stat_type5` = '0',
 `stat_value5` = '0',
 `stat_type6` = '0',
 `stat_value6` = '0',
 `stat_type7` = '0',
 `stat_value7` = '0',
 `stat_type8` = '0',
 `stat_value8` = '0',
 `stat_type9` = '0',
 `stat_value9` = '0',
 `stat_type10` = '0',
 `stat_value10` = '0',
 `ScalingStatDistribution` = '0',
 `ScalingStatValue` = '0',
 `dmg_min1` = '0',
 `dmg_max1` = '0',
 `dmg_type1` = '0',
 `dmg_min2` = '0',
 `dmg_max2` = '0',
 `dmg_type2` = '0',
 `armor` = '0',
 `holy_res` = '0',
 `fire_res` = '0',
 `nature_res` = '0',
 `frost_res` = '0',
 `shadow_res` = '0',
 `arcane_res` = '0',
 `delay` = '0',
 `ammo_type` = '0',
 `RangedModRange` = '0',
 `spellid_1` = '897',
 `spelltrigger_1` = '0',
 `spellcharges_1` = '0',
 `spellppmRate_1` = '0',
 `spellcooldown_1` = '30000',
 `spellcategory_1` = '1193',
 `spellcategorycooldown_1` = '60000',
 `spellid_2` = '0',
 `spelltrigger_2` = '0',
 `spellcharges_2` = '0',
 `spellppmRate_2` = '0',
 `spellcooldown_2` = '0',
 `spellcategory_2` = '0',
 `spellcategorycooldown_2` = '0',
 `spellid_3` = '0',
 `spelltrigger_3` = '0',
 `spellcharges_3` = '0',
 `spellppmRate_3` = '0',
 `spellcooldown_3` = '0',
 `spellcategory_3` = '0',
 `spellcategorycooldown_3` = '0',
 `spellid_4` = '0',
 `spelltrigger_4` = '0',
 `spellcharges_4` = '0',
 `spellppmRate_4` = '0',
 `spellcooldown_4` = '0',
 `spellcategory_4` = '0',
 `spellcategorycooldown_4` = '0',
 `spellid_5` = '0',
 `spelltrigger_5` = '0',
 `spellcharges_5` = '0',
 `spellppmRate_5` = '0',
 `spellcooldown_5` = '0',
 `spellcategory_5` = '0',
 `spellcategorycooldown_5` = '0',
 `bonding` = '1',
 `description` = 'The surface is somewhat transparent and peering deeper reveals a swirling maelstrom of mountains, oceans, and forests.',
 `PageText` = '0',
 `LanguageID` = '0',
 `PageMaterial` = '0',
 `startquest` = '0',
 `lockid` = '0',
 `Material` = '-1',
 `sheath` = '0',
 `RandomProperty` = '0',
 `RandomSuffix` = '0',
 `block` = '0',
 `itemset` = '0',
 `MaxDurability` = '0',
 `area` = '0',
 `Map` = '0',
 `BagFamily` = '0',
 `TotemCategory` = '0',
 `socketColor_1` = '0',
 `socketContent_1` = '0',
 `socketColor_2` = '0',
 `socketContent_2` = '0',
 `socketColor_3` = '0',
 `socketContent_3` = '0',
 `socketBonus` = '0',
 `GemProperties` = '0',
 `RequiredDisenchantSkill` = '0',
 `ArmorDamageModifier` = '0',
 `duration` = '0',
 `ItemLimitCategory` = '0',
 `HolidayId` = '0',
 `ScriptName` = '',
 `DisenchantID` = '0',
 `FoodType` = '0',
 `minMoneyLoot` = '0',
 `maxMoneyLoot` = '0',
 `flagsCustom` = '0',
 `VerifiedBuild` = '12340'
WHERE
	(`entry` = '701002');

-- --------------------------------------------------------------------------------------
-- Teleporter NPC
--
-- `modelid` = 30076 (Jeeves), 27320 (Goblin Mechanic), 21572 (Elven Portal Master)
--
-- --------------------------------------------------------------------------------------
DELETE FROM `creature_template` WHERE (`entry`= @ENTRY);
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, Health_mod, Mana_mod, Armor_mod, faction, npcflag, speed_walk, speed_run, scale, rank, dmg_multiplier, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName) VALUES
(@ENTRY, @Model, "Pocket Portal", "", 'Directions', '50000', 80, 83, 1.56, 1.56, 1.56, 35, 3, 1, 1.14286, @SCALE, 1, 1, 1, 2, 7, 138936390, 3, 1, 2, 'SmartAI');

-- --------------------------------------------------------------------------------------
-- Give the creature a few items
-- --------------------------------------------------------------------------------------
-- DELETE FROM `creature_equip_template` WHERE (`CreatureID`=@ENTRY);
-- INSERT INTO `creature_equip_template` (`CreatureID`,`ItemID1`,`ItemID2`,`ItemID3`) VALUES (@ENTRY,11855,5956,0);

-- --------------------------------------------------------------------------------------
-- Set Teleporter Despawn Time
-- --------------------------------------------------------------------------------------
SET @ENTRY		:= 128; 	-- CREATURE_TEMPLATE ID
SET @SOURCETYPE	:= 0; 		-- 0 = CREATURE
SET @SSID		:= 200; 	-- SCRIPT ID
SET @LINK		:= 0; 		-- LINKED SCRIPT (EXECUTES AFTER)
SET @EVENTTYPE	:= 25; 		-- 25 = SMART_EVENT_RESET (After spawn, respawn, etc.)
SET @ACTIONTYPE := 41; 		-- 41 = SMART_ACTION_FORCE_DESPAWN
SET @APARM1		:= 15000; 	-- Milliseconds until despawn occurs
SET @TTYPE		:= 19;  	-- 19 - SMART_TARGET_CLOSEST_CREATURE
SET @TPARM1		:= 128; 	-- SMART_TARGET CREATURE ID
SET @NOTE		:= "Personal Teleporter Despawn";

DELETE FROM `smart_scripts` WHERE (`entryorguid`=@ENTRY) AND (`source_type`=@SOURCETYPE) AND (`id` = @SSID);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,@SSID,@LINK,@EVENTTYPE,0,100,0,0,0,0,0,@ACTIONTYPE,@APARM1,0,0,0,0,0,@TTYPE,@TPARM1,0,0,0.0,0.0,0.0,0.0,@NOTE);

-- --------------------------------------------------------------------------------------
-- Smart Scripts
-- These mirror the same destinations as the StygianCore Portal Master
-- --------------------------------------------------------------------------------------
DELETE FROM `smart_scripts` WHERE (`entryorguid`= @ENTRY) AND (`source_type`= @SOURCETYPE) AND (`event_type`= 62);
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES 
(@ENTRY, 0, 1, 0, 62, 0, 100, 0, @GOSSIP_MENU, 1, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8842.09, 626.358, 94.0867, 3.61363, "Teleporter script"),
(@ENTRY, 0, 2, 0, 62, 0, 100, 0, @GOSSIP_MENU, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1601.08, -4378.69, 9.9846, 2.14362, "Teleporter script"),
(@ENTRY, 0, 3, 0, 62, 0, 100, 0, @GOSSIP_MENU, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -14281.9, 552.564, 8.90422, 0.860144, "Teleporter script"),
(@ENTRY, 0, 4, 0, 62, 0, 100, 0, @GOSSIP_MENU, 10, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1887.62, 5359.09, -12.4279, 4.40435, "Teleporter script"),
(@ENTRY, 0, 5, 0, 62, 0, 100, 0, @GOSSIP_MENU, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5809.55, 503.975, 657.526, 2.38338, "Teleporter script"),
(@ENTRY, 0, 6, 0, 62, 0, 100, 0, @GOSSIP_MENU, 12, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -13181.8, 339.356, 42.9805, 1.18013, "Teleporter script"),
(@ENTRY, 0, 7, 0, 62, 0, 100, 0, @GOSSIP_MENU, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9869.91, 2493.58, 1315.88, 2.78897, "Teleporter script"),
(@ENTRY, 0, 8, 0, 62, 0, 100, 0, @GOSSIP_MENU, 4, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4900.47, -962.585, 501.455, 5.40538, "Teleporter script"),
(@ENTRY, 0, 9, 0, 62, 0, 100, 0, @GOSSIP_MENU, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3864.92, -11643.7, -137.644, 5.50862, "Teleporter script"),
(@ENTRY, 0, 10, 0, 62, 0, 100, 0, @GOSSIP_MENU, 6, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1274.45, 71.8601, 128.159, 2.80623, "Teleporter script"),
(@ENTRY, 0, 11, 0, 62, 0, 100, 0, @GOSSIP_MENU, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1633.75, 240.167, -43.1034, 6.26128, "Teleporter script"),
(@ENTRY, 0, 12, 0, 62, 0, 100, 0, @GOSSIP_MENU, 8, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9738.28, -7454.19, 13.5605, 0.043914, "Teleporter script"),
(@ENTRY, 0, 13, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 0, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5163.54, 925.423, 257.181, 1.57423, "Teleporter script"),
(@ENTRY, 0, 14, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 1, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11209.6, 1666.54, 24.6974, 1.42053, "Teleporter script"),
(@ENTRY, 0, 15, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 2, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8799.15, 832.718, 97.6348, 6.04085, "Teleporter script"),
(@ENTRY, 0, 16, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1811.78, -4410.5, -18.4704, 5.20165, "Teleporter script"),
(@ENTRY, 0, 17, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 4, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4657.3, -2519.35, 81.0529, 4.54808, "Teleporter script"),
(@ENTRY, 0, 18, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 5, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4470.28, -1677.77, 81.3925, 1.16302, "Teleporter script"),
(@ENTRY, 0, 19, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 6, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2873.15, -764.523, 160.332, 5.10447, "Teleporter script"),
(@ENTRY, 0, 20, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -234.675, 1561.63, 76.8921, 1.24031, "Teleporter script"),
(@ENTRY, 0, 21, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 8, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -731.607, -2218.39, 17.0281, 2.78486, "Teleporter script"),
(@ENTRY, 0, 22, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 9, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4249.99, 740.102, -25.671, 1.34062, "Teleporter script"),
(@ENTRY, 0, 23, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 10, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -7179.34, -921.212, 165.821, 5.09599, "Teleporter script"),
(@ENTRY, 0, 24, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -7527.05, -1226.77, 285.732, 5.29626, "Teleporter script"),
(@ENTRY, 0, 25, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3520.14, 1119.38, 161.025, 4.70454, "Teleporter script"),
(@ENTRY, 0, 26, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 13, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1421.42, 2907.83, 137.415, 1.70718, "Teleporter script"),
(@ENTRY, 0, 27, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 14, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1269.64, -2556.21, 93.6088, 0.620623, "Teleporter script"),
(@ENTRY, 0, 28, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 15, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3352.92, -3379.03, 144.782, 6.25978, "Teleporter script"),
(@ENTRY, 0, 29, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 16, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10177.9, -3994.9, -111.239, 6.01885, "Teleporter script"),
(@ENTRY, 0, 30, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 17, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6071.37, -2955.16, 209.782, 0.015708, "Teleporter script"),
(@ENTRY, 0, 31, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 18, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6801.19, -2893.02, 9.00388, 0.158639, "Teleporter script"),
(@ENTRY, 0, 32, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3324.49, 4943.45, -101.239, 4.63901, "Teleporter script"),
(@ENTRY, 0, 33, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8369.65, -4253.11, -204.272, -2.70526, "Teleporter script"),
(@ENTRY, 0, 34, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 2, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 738.865, 6865.77, -69.4659, 6.27655, "Teleporter script"),
(@ENTRY, 0, 35, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -347.29, 3089.82, 21.394, 5.68114, "Teleporter script"),
(@ENTRY, 0, 36, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 12884.6, -7317.69, 65.5023, 4.799, "Teleporter script"),
(@ENTRY, 0, 37, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3100.48, 1536.49, 190.3, 4.62226, "Teleporter script"),
(@ENTRY, 0, 38, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3707.86, 2150.23, 36.76, 3.22, "Teleporter script"),
(@ENTRY, 0, 39, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8756.39, -4440.68, -199.489, 4.66289, "Teleporter script"),
(@ENTRY, 0, 40, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 2, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8590.95, 791.792, 558.235, 3.13127, "Teleporter script"),
(@ENTRY, 0, 41, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 3, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4765.59, -2038.24, 229.363, 0.887627, "Teleporter script"),
(@ENTRY, 0, 42, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6722.44, -4640.67, 450.632, 3.91123, "Teleporter script"),
(@ENTRY, 0, 43, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 5, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5643.16, 2028.81, 798.274, 4.60242, "Teleporter script"),
(@ENTRY, 0, 44, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 6, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3782.89, 6965.23, 105.088, 6.14194, "Teleporter script"),
(@ENTRY, 0, 45, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5693.08, 502.588, 652.672, 4.0229, "Teleporter script"),
(@ENTRY, 0, 46, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 8, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9136.52, -1311.81, 1066.29, 5.19113, "Teleporter script"),
(@ENTRY, 0, 47, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8922.12, -1009.16, 1039.56, 1.57044, "Teleporter script"),
(@ENTRY, 0, 48, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 10, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1203.41, -4868.59, 41.2486, 0.283237, "Teleporter script"),
(@ENTRY, 0, 49, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 11, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1267.24, -4857.3, 215.764, 3.22768, "Teleporter script"),
(@ENTRY, 0, 50, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3649.92, 317.469, 35.2827, 2.94285, "Teleporter script"),
(@ENTRY, 0, 51, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 1, 0, 0, 62, 229, 0, 0, 0, 0, 0, 7, 0, 0, 0, 152.451, -474.881, 116.84, 0.001073, "Teleporter script"),
(@ENTRY, 0, 52, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8177.89, -4181.23, -167.552, 0.913338, "Teleporter script"),
(@ENTRY, 0, 53, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 797.855, 6865.77, -65.4165, 0.005938, "Teleporter script"),
(@ENTRY, 0, 54, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8515.61, 714.153, 558.248, 1.57753, "Teleporter script"),
(@ENTRY, 0, 55, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3530.06, 5104.08, 3.50861, 5.51117, "Teleporter script"),
(@ENTRY, 0, 56, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 6, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -336.411, 3130.46, -102.928, 5.20322, "Teleporter script"),
(@ENTRY, 0, 57, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5855.22, 2102.03, 635.991, 3.57899, "Teleporter script"),
(@ENTRY, 0, 58, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 8, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11118.9, -2010.33, 47.0819, 0.649895, "Teleporter script"),
(@ENTRY, 0, 59, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 9, 0, 0, 62, 230, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1126.64, -459.94, -102.535, 3.46095, "Teleporter script"),
(@ENTRY, 0, 60, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 10, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3668.72, -1262.46, 243.622, 4.785, "Teleporter script"),
(@ENTRY, 0, 61, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 11, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4708.27, -3727.64, 54.5589, 3.72786, "Teleporter script"),
(@ENTRY, 0, 62, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8409.82, 1499.06, 27.7179, 2.51868, "Teleporter script"),
(@ENTRY, 0, 63, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 13, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 12574.1, -6774.81, 15.0904, 3.13788, "Teleporter script"),
(@ENTRY, 0, 64, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 14, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3088.49, 1381.57, 184.863, 4.61973, "Teleporter script"),
(@ENTRY, 0, 65, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 15, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8240.09, 1991.32, 129.072, 0.941603, "Teleporter script"),
(@ENTRY, 0, 66, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 16, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3784.17, 7028.84, 161.258, 5.79993, "Teleporter script"),
(@ENTRY, 0, 67, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 17, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3472.43, 264.923, -120.146, 3.27923, "Teleporter script"),
(@ENTRY, 0, 68, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 18, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9222.88, -1113.59, 1216.12, 6.27549, "Teleporter script"),
(@ENTRY, 0, 69, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 19, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5453.72, 2840.79, 421.28, 0, "Teleporter script"),
(@ENTRY, 0, 70, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 21, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11916.7, -1215.72, 92.289, 4.72454, "Teleporter script"),
(@ENTRY, 0, 71, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 22, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6851.78, -7972.57, 179.242, 4.64691, "Teleporter script"),
(@ENTRY, 0, 72, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 0, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -9449.06, 64.8392, 56.3581, 3.07047, "Teleporter script"),
(@ENTRY, 0, 73, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 1, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9024.37, -6682.55, 16.8973, 3.14131, "Teleporter script"),
(@ENTRY, 0, 74, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 2, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5603.76, -482.704, 396.98, 5.23499, "Teleporter script"),
(@ENTRY, 0, 75, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 3, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2274.95, 323.918, 34.1137, 4.24367, "Teleporter script"),
(@ENTRY, 0, 76, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7595.73, -6819.6, 84.3718, 2.56561, "Teleporter script"),
(@ENTRY, 0, 77, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 5, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5405.85, -2894.15, 341.972, 5.48238, "Teleporter script"),
(@ENTRY, 0, 78, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 6, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 505.126, 1504.63, 124.808, 1.77987, "Teleporter script"),
(@ENTRY, 0, 79, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10684.9, 1033.63, 32.5389, 6.07384, "Teleporter script"),
(@ENTRY, 0, 80, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 8, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -9447.8, -2270.85, 71.8224, 0.283853, "Teleporter script"),
(@ENTRY, 0, 81, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 9, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10531.7, -1281.91, 38.8647, 1.56959, "Teleporter script"),
(@ENTRY, 0, 82, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 10, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -385.805, -787.954, 54.6655, 1.03926, "Teleporter script"),
(@ENTRY, 0, 83, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3517.75, -913.401, 8.86625, 2.60705, "Teleporter script"),
(@ENTRY, 0, 84, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 12, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 275.049, -652.044, 130.296, 0.502032, "Teleporter script"),
(@ENTRY, 0, 85, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 13, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1581.45, -2704.06, 35.4168, 0.490373, "Teleporter script"),
(@ENTRY, 0, 86, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 14, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11921.7, -59.544, 39.7262, 3.73574, "Teleporter script"),
(@ENTRY, 0, 87, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 15, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6782.56, -3128.14, 240.48, 5.65912, "Teleporter script"),
(@ENTRY, 0, 88, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 16, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10368.6, -2731.3, 21.6537, 5.29238, "Teleporter script"),
(@ENTRY, 0, 89, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 17, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 112.406, -3929.74, 136.358, 0.981903, "Teleporter script"),
(@ENTRY, 0, 90, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 18, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6686.33, -1198.55, 240.027, 0.916887, "Teleporter script"),
(@ENTRY, 0, 91, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 19, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11184.7, -3019.31, 7.29238, 3.20542, "Teleporter script"),
(@ENTRY, 0, 92, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 20, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -7979.78, -2105.72, 127.919, 5.10148, "Teleporter script"),
(@ENTRY, 0, 93, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 21, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1743.69, -1723.86, 59.6648, 5.23722, "Teleporter script"),
(@ENTRY, 0, 94, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 22, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2280.64, -5275.05, 82.0166, 4.7479, "Teleporter script"),
(@ENTRY, 0, 95, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 23, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 12806.5, -6911.11, 41.1156, 2.22935, "Teleporter script"),
(@ENTRY, 0, 96, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4192.62, -12576.7, 36.7598, 1.62813, "Teleporter script"),
(@ENTRY, 0, 97, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9889.03, 915.869, 1307.43, 1.9336, "Teleporter script"),
(@ENTRY, 0, 98, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 228.978, -4741.87, 10.1027, 0.416883, "Teleporter script"),
(@ENTRY, 0, 99, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2473.87, -501.225, -9.42465, 0.6525, "Teleporter script"),
(@ENTRY, 0, 100, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2095.7, -11841.1, 51.1557, 6.19288, "Teleporter script"),
(@ENTRY, 0, 101, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 5, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6463.25, 683.986, 8.92792, 4.33534, "Teleporter script"),
(@ENTRY, 0, 102, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 6, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -575.772, -2652.45, 95.6384, 0.006469, "Teleporter script"),
(@ENTRY, 0, 103, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 7, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1574.89, 1031.57, 137.442, 3.8013, "Teleporter script"),
(@ENTRY, 0, 104, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 8, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1919.77, -2169.68, 94.6729, 6.14177, "Teleporter script"),
(@ENTRY, 0, 105, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 9, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5375.53, -2509.2, -40.432, 2.41885, "Teleporter script"),
(@ENTRY, 0, 106, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 10, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -656.056, 1510.12, 88.3746, 3.29553, "Teleporter script"),
(@ENTRY, 0, 107, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 11, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3350.12, -3064.85, 33.0364, 5.12666, "Teleporter script"),
(@ENTRY, 0, 108, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4808.31, 1040.51, 103.769, 2.90655, "Teleporter script"),
(@ENTRY, 0, 109, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 13, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6940.91, -3725.7, 48.9381, 3.11174, "Teleporter script"),
(@ENTRY, 0, 110, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 14, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3117.12, -4387.97, 91.9059, 5.49897, "Teleporter script"),
(@ENTRY, 0, 111, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 15, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3898.8, -1283.33, 220.519, 6.24307, "Teleporter script"),
(@ENTRY, 0, 112, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 16, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6291.55, -1158.62, -258.138, 0.457099, "Teleporter script"),
(@ENTRY, 0, 113, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 17, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6815.25, 730.015, 40.9483, 2.39066, "Teleporter script"),
(@ENTRY, 0, 114, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 18, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6658.57, -4553.48, 718.019, 5.18088, "Teleporter script"),
(@ENTRY, 0, 115, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -207.335, 2035.92, 96.464, 1.59676, "Teleporter script"),
(@ENTRY, 0, 116, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 1, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -220.297, 5378.58, 23.3223, 1.61718, "Teleporter script"),
(@ENTRY, 0, 117, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 2, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2266.23, 4244.73, 1.47728, 3.68426, "Teleporter script"),
(@ENTRY, 0, 118, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1610.85, 7733.62, -17.2773, 1.33522, "Teleporter script"),
(@ENTRY, 0, 119, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2029.75, 6232.07, 133.495, 1.30395, "Teleporter script"),
(@ENTRY, 0, 120, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3271.2, 3811.61, 143.153, 3.44101, "Teleporter script"),
(@ENTRY, 0, 121, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 6, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3681.01, 2350.76, 76.587, 4.25995, "Teleporter script"),
(@ENTRY, 0, 122, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2954.24, 5379.13, 60.4538, 2.55544, "Teleporter script"),
(@ENTRY, 0, 123, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 1, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 682.848, -3978.3, 230.161, 1.54207, "Teleporter script"),
(@ENTRY, 0, 124, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 2, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2678.17, 891.826, 4.37494, 0.101121, "Teleporter script"),
(@ENTRY, 0, 125, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 3, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4017.35, -3403.85, 290, 5.35431, "Teleporter script"),
(@ENTRY, 0, 126, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5560.23, -3211.66, 371.709, 5.55055, "Teleporter script"),
(@ENTRY, 0, 127, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 5, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5614.67, 5818.86, -69.722, 3.60807, "Teleporter script"),
(@ENTRY, 0, 128, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 6, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5411.17, -966.37, 167.082, 1.57167, "Teleporter script"),
(@ENTRY, 0, 129, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6120.46, -1013.89, 408.39, 5.12322, "Teleporter script"),
(@ENTRY, 0, 130, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 8, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8323.28, 2763.5, 655.093, 2.87223, "Teleporter script"),
(@ENTRY, 0, 131, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4522.23, 2828.01, 389.975, 0.215009, "Teleporter script"),

-- StygianCore Portals
-- SmartScript Action 62 = MAPID (0 - KALIMDOR, 1 - AZEROTH (Eastern Kingdoms))
-- Pay attention to the value of SmartScript action 62. It needs the correct value for the teleport location to work.
-- Asterisks show fields that must be updated when adding a new location.
-- -----------*------------------------------------*------------*------------------------
(@ENTRY, 0, 132, 0, 62, 0, 100, 0, @GOSSIP_MENU+9, 0, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -745.952, -989.286, 194.098, 2.01729, "Cairne's Overlook"),
(@ENTRY, 0, 133, 0, 62, 0, 100, 0, @GOSSIP_MENU+9, 1, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5813.9, 448.287, 658.752, 1.23946, "Dalaran"),
(@ENTRY, 0, 134, 0, 62, 0, 100, 0, @GOSSIP_MENU+9, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7758.24, -2409.7, 489.282, 4.14574, "Moonglade"),
(@ENTRY, 0, 135, 0, 62, 0, 100, 0, @GOSSIP_MENU+9, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 966.147, 926.499, 104.649, 1.27231, "Sunrock Retreat"),
(@ENTRY, 0, 136, 0, 62, 0, 100, 0, @GOSSIP_MENU+9, 4, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6769.96, -4633.98, 721.208, 0.927772, "Winterspring"),
(@ENTRY, 0, 137, 0, 62, 0, 100, 0, @GOSSIP_MENU+9, 5, 0, 0, 62, 451, 0, 0, 0, 0, 0, 7, 0, 0, 0, 16303, -16173, 40, 0.361313, "Zone: Designer Isle"),
(@ENTRY, 0, 138, 0, 62, 0, 100, 0, @GOSSIP_MENU+9, 6, 0, 0, 62, 451, 0, 0, 0, 0, 0, 7, 0, 0, 0, 16205.5, 16123.6, 71.5889, 5.5253, "Zone: Programmer Isle"),

-- --------------------------------------------------------------------------------------
-- Loremaster Portals
-- SmartScript Action 62 = MAPID (0 - KALIMDOR, 1 - AZEROTH (Eastern Kingdoms))
-- Pay attention to the value of SmartScript action 62. It needs the correct value for the teleport location to work.
-- Asterisks show fields that must be updated when adding a new location.
-- -----------*-------------------------------------*------------*-----------------------
(@ENTRY, 0, 139, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -531.232, 7401.32, 186.393, 0.939364, "Challe's Home for Little Tykes"),
(@ENTRY, 0, 140, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 1, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6583.62, -3486.57, 318.362, 0.49825, "Dead King's Crypt"),
(@ENTRY, 0, 141, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 2, 0, 0, 62, 169, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2729.99, 2987.88, 23.2229, 0.326661, "The Emerald Dream"),
(@ENTRY, 0, 142, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 3, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11068.6, -1808.88, 52.7882, 2.32419, "The Forgotten Crypt"),
(@ENTRY, 0, 143, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 4, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -396.86, -2183.42, 158.1, 0.162564, "Koiter's Shrine"),
(@ENTRY, 0, 144, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 5, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7443.72, -1690.19, 194.643, 5.49535, "Shatterspear Vale"),
(@ENTRY, 0, 145, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 6, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10733.8, 2509.35, 5.88962, 0.899085, "Silithus Camp");
-- --------------------------------------------------------------------------------------