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
-- WORLD: GIFT BOX SENDER
-- NPC ID: 601018
--
-- Sends the player a Gift Box at specific levels.
--
-- ################################################################################### --
*/

USE stygian_world;

-- --------------------------------------------------------------------------------------
--	MIN/MAX MONEY AMOUNTS PER LEVEL
-- --------------------------------------------------------------------------------------
SET @MIN10 = 1000; 
SET @MIN20 = 1000; 
SET @MIN30 = 1000; 
SET @MIN40 = 1000; 
SET @MIN50 = 1000; 
SET @MIN60 = 1000; 
SET @MIN70 = 1000; 
SET @MIN80 = 1000; 
SET @MAX10 = 1000; 
SET @MAX20 = 2000; 
SET @MAX30 = 3000; 
SET @MAX40 = 4000; 
SET @MAX50 = 5000; 
SET @MAX60 = 6000; 
SET @MAX70 = 7000; 
SET @MAX80 = 8000; 


-- --------------------------------------------------------------------------------------
-- GIFT BOX SENDER - 601018
-- --------------------------------------------------------------------------------------
DELETE FROM `creature_template` WHERE `entry`=601018;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (601018, 0, 0, 0, 0, 0, 21661, 0, 0, 0, 'Koiter', 'Sons of the Storm', NULL, 4110, 26, 26, 0, 12, 81, 1, 1.14286, 1, 0, 37, 49, 0, 90, 1, 1500, 2000, 1, 512, 2048, 0, 0, 2, 0, 0, 0, 25, 37, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 3, 1, 1.05, 1, 1, 0, 0, 1, 0, 2, '', 12340);

-- --------------------------------------------------------------------------------------
-- Achievement For Levels
-- --------------------------------------------------------------------------------------
REPLACE INTO `achievement_reward` (`entry`, `title_A`, `title_H`, `item`, `sender`, `subject`, `text`, `mailTemplate`) VALUES
(6, 0, 0, 60001, 601018, 'Congrats on your level! (10)', 'Dear $N,$B$BCongratulations on reaching another level milestone! For your hard work and dedication, please accept this gift on behalf of.. well, me. Keep it up!$B$BYour GM,$BGameMaster Koiter', 0),
(7, 0, 0, 60002, 601018, 'Congrats on your level! (20)', 'Dear $N,$B$BCongratulations on reaching another level milestone! For your hard work and dedication, please accept this gift on behalf of.. well, me. Keep it up!$B$BYour GM,$BGameMaster Koiter', 0),
(8, 0, 0, 60003, 601018, 'Congrats on your level! (30)', 'Dear $N,$B$BCongratulations on reaching another level milestone! For your hard work and dedication, please accept this gift on behalf of.. well, me. Keep it up!$B$BYour GM,$BGameMaster Koiter', 0),
(9, 0, 0, 60004, 601018, 'Congrats on your level! (40)', 'Dear $N,$B$BCongratulations on reaching another level milestone! For your hard work and dedication, please accept this gift on behalf of.. well, me. Keep it up!$B$BYour GM,$BGameMaster Koiter', 0),
(10, 0, 0, 60005, 601018, 'Congrats on your level! (50)', 'Dear $N,$B$BCongratulations on reaching another level milestone! For your hard work and dedication, please accept this gift on behalf of.. well, me. Keep it up!$B$BYour GM,$BGameMaster Koiter', 0),
(11, 0, 0, 60006, 601018, 'Congrats on your level! (60)', 'Dear $N,$B$BCongratulations on reaching another level milestone! For your hard work and dedication, please accept this gift on behalf of.. well, me. Keep it up!$B$BYour GM,$BGameMaster Koiter', 0),
(12, 0, 0, 60007, 601018, 'Congrats on your level! (70)', 'Dear $N,$B$BCongratulations on reaching another level milestone! For your hard work and dedication, please accept this gift on behalf of.. well, me. Keep it up!$B$BYour GM,$BGameMaster Koiter', 0),
(1558, 0, 0, 33223, 601018, 'We heard you like fishing...', '... so you might as well do it in style, $N!$B$BEnjoy!$BGameMaster Koiter', 0),
(1795, 0, 0, 32566, 601018, 'We heard you like cooking...', '... so take some time out to enjoy the fruits of your labour, $N!$B$BEnjoy!$BGameMaster Koiter', 0);

-- --------------------------------------------------------------------------------------
-- Items For Loot
-- --------------------------------------------------------------------------------------
DELETE FROM `item_loot_template` WHERE `Entry` = 50301;
DELETE FROM `item_loot_template` WHERE `Entry` = 54218;
REPLACE INTO `item_loot_template` VALUES
(50301, 13582, 7.69, 1, 2, 1, 1),
(50301, 13583, 7.69, 1, 2, 1, 1),
(50301, 13584, 7.69, 1, 2, 1, 1),
(50301, 20371, 7.69, 1, 2, 1, 1),
(50301, 23713, 7.69, 1, 2, 1, 1),
(50301, 32588, 7.69, 1, 2, 1, 1),
(50301, 34492, 7.69, 1, 2, 1, 1),
(50301, 34493, 7.69, 1, 2, 1, 1),
(50301, 35223, 33.33, 1, 1, 50, 50),
(50301, 38050, 7.69, 1, 2, 1, 1),
(50301, 39656, 7.69, 1, 2, 1, 1),
(50301, 45047, 33.33, 1, 1, 50, 50),
(50301, 46779, 33.33, 1, 1, 50, 50),
(50301, 46802, 7.69, 1, 2, 1, 1),
(50301, 49287, 7.69, 1, 2, 1, 1),
(50301, 49343, 7.69, 1, 2, 1, 1),
(54218, 23705, 12.5, 1, 1, 1, 1),
(54218, 23709, 12.5, 1, 1, 1, 1),
(54218, 32542, 7.14, 1, 3, 1, 1),
(54218, 32566, 7.14, 1, 3, 1, 1),
(54218, 33079, 7.14, 1, 3, 1, 1),
(54218, 33219, 7.14, 1, 3, 1, 1),
(54218, 33223, 7.14, 1, 3, 1, 1),
(54218, 34499, 7.14, 1, 3, 1, 1),
(54218, 35223, 12.5, 1, 2, 50, 50),
(54218, 35227, 7.14, 1, 3, 1, 1),
(54218, 38233, 12.5, 1, 2, 50, 50),
(54218, 38301, 7.14, 1, 3, 1, 1),
(54218, 38309, 12.5, 1, 1, 1, 1),
(54218, 38310, 12.5, 1, 1, 1, 1),
(54218, 38311, 12.5, 1, 1, 1, 1),
(54218, 38312, 12.5, 1, 1, 1, 1),
(54218, 38313, 12.5, 1, 1, 1, 1),
(54218, 38314, 12.5, 1, 1, 1, 1),
(54218, 38577, 12.5, 1, 2, 50, 50),
(54218, 38578, 7.14, 1, 3, 1, 1),
(54218, 45037, 12.5, 1, 2, 1, 1),
(54218, 45047, 12.5, 1, 2, 50, 50),
(54218, 45063, 7.14, 1, 3, 1, 1),
(54218, 46779, 12.5, 1, 2, 50, 50),
(54218, 46780, 7.14, 1, 3, 1, 1),
(54218, 49703, 7.14, 1, 3, 1, 1),
(54218, 49704, 7.14, 1, 3, 1, 1),
(54218, 54212, 7.14, 1, 3, 1, 1),
(54218, 54452, 12.5, 1, 2, 1, 1),
(54218, 54455, 12.5, 1, 2, 50, 50),
(60000, 23720, 7.69, 1, 1, 1, 1),
(60000, 37719, 7.69, 1, 1, 1, 1),
(60000, 43599, 7.69, 1, 1, 1, 1),
(60000, 49282, 7.69, 1, 1, 1, 1),
(60000, 49283, 7.69, 1, 1, 1, 1),
(60000, 49284, 7.69, 1, 1, 1, 1),
(60000, 49285, 7.69, 1, 1, 1, 1),
(60000, 49286, 7.69, 1, 1, 1, 1),
(60000, 49290, 7.69, 1, 1, 1, 1),
(60000, 54068, 7.69, 1, 1, 1, 1),
(60000, 54069, 7.69, 1, 1, 1, 1),
(60000, 54811, 7.69, 1, 1, 1, 1),
(60000, 54860, 7.69, 1, 1, 1, 1),
(60001, 50301, 33.3, 1, 1, 2, 2),
(60001, 54218, 33.3, 1, 1, 1, 1),
(60001, 60000, 33.3, 1, 1, 1, 1),
(60002, 50301, 33.3, 1, 1, 1, 1),
(60002, 54218, 33.3, 1, 1, 1, 1),
(60002, 60000, 33.3, 1, 1, 1, 1),
(60003, 50301, 33.3, 1, 1, 1, 1),
(60003, 54218, 33.3, 1, 1, 1, 1),
(60003, 60000, 33.3, 1, 1, 1, 1),
(60004, 50301, 33.3, 1, 1, 1, 1),
(60004, 54218, 33.3, 1, 1, 1, 1),
(60004, 60000, 33.3, 1, 1, 2, 2),
(60005, 50301, 33.3, 1, 1, 1, 2),
(60005, 54218, 33.3, 1, 1, 1, 1),
(60005, 60000, 33.3, 1, 1, 1, 1),
(60006, 50301, 33.3, 1, 1, 1, 1),
(60006, 54218, 33.3, 1, 1, 1, 1),
(60006, 60000, 33.3, 1, 1, 1, 1),
(60007, 50301, 33.3, 1, 1, 1, 1),
(60007, 54218, 33.3, 1, 1, 1, 1),
(60007, 60000, 33.3, 1, 1, 1, 1),
(60008, 50301, 33.3, 1, 1, 1, 1),
(60008, 54218, 33.3, 1, 1, 1, 1),
(60008, 60000, 33.3, 1, 1, 1, 1);

-- --------------------------------------------------------------------------------------
-- Mail Items
-- --------------------------------------------------------------------------------------
REPLACE INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES
(50301, 15, 0, -1, 'Landro\'s Pet Box', 35407, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 'NOTE: Not Guaranteed to Contain an Actual Pet', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN10, @MAX10, 0, 12340),
(54218, 15, 0, -1, 'Landro\'s Gift Box', 22192, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 'NOTE: Not Guaranteed to Contain an Actual Gift', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN10, @MAX10, 0, 12340),
(60000, 15, 0, -1, 'Landro\'s Mount Box', 53044, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 'NOTE: Not Guaranteed to Contain an Actual Mount', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN10, @MAX10, 0, 12340),
(60001, 15, 0, -1, 'Level 10 Gift Box', 53044, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 10, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Achievement Reward for Level 10', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN10, @MAX10, 0, 12340),
(60002, 15, 0, -1, 'Level 20 Gift Box', 53044, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Achievement Reward for Level 20', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN20, @MAX20, 0, 12340),
(60003, 15, 0, -1, 'Level 30 Gift Box', 53044, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 30, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Achievement Reward for Level 30', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN30, @MAX30, 0, 12340),
(60004, 15, 0, -1, 'Level 40 Gift Box', 53044, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 40, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Achievement Reward for Level 40', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN40, @MAX40, 0, 12340),
(60005, 15, 0, -1, 'Level 50 Gift Box', 53044, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 50, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Achievement Reward for Level 50', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN50, @MAX50, 0, 12340),
(60006, 15, 0, -1, 'Level 60 Gift Box', 53044, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 60, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Achievement Reward for Level 60', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN60, @MAX60, 0, 12340),
(60007, 15, 0, -1, 'Level 70 Gift Box', 53044, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 70, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Achievement Reward for Level 70', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN70, @MAX70, 0, 12340),
(60008, 15, 0, -1, 'Level 80 Gift Box', 53044, 1, 4, 0, 1, 0, 0, 0, -1, -1, 1, 80, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Achievement Reward for Level 80', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, @MIN80, @MAX80, 0, 12340);