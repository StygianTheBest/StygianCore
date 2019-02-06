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
-- WORLD: UPDATES + BUG FIXES
-- 
-- Adds updates from other cores, fixes bugs, and applies changes to creatures, 
-- objects, quests, and whatever else. 
--
-- ADDITIONAL CREDITS: 
--
-- StygianTheBest - http://stygianthebest.github.io/
-- AzerothCore - https://www.azerothcore.org/
-- TrinityCore - https://www.trinitycore.org/
-- LevanSturua - https://github.com/LevanSturua/common-core-db-bugs
--
-- ################################################################################### --
*/

USE stygian_world;

## ########################################################################################################################################
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- #### STYGIANCORE FIXES ####
-- Core/DB fixes unique to the StygianCore Repack
-- ----------------------------------------------------------------------------------------------------------------------------------------
## ########################################################################################################################################


-- --------------------------------------------------------------------------------------
-- 2019-02-05 - TODO - NPC: Strange Winged Goblin (Fix Invalid Waypoint)
-- WaypointMovementGenerator::LoadPath: creature Strange Winged Goblin (Entry: 22239 GUID: 244500) doesn't have waypoint path id: 0
-- This occurs only during Love is in the Air. The goblin is a Peddlefeet located in the Exodar.
-- --------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------
-- DB: Fix trinity_string characters
-- --------------------------------------------------------------------------------------
UPDATE trinity_string SET content_default = REPLACE(content_default,'│','|');
UPDATE trinity_string SET content_default = REPLACE(content_default,'└','--|'); 


-- --------------------------------------------------------------------------------------
-- ITEM: Update Lootcard Mount Requirements
-- --------------------------------------------------------------------------------------
UPDATE `stygian_world`.`item_template` SET `RequiredLevel` = '20',`RequiredSkillRank` = '0' WHERE (`entry` = '54068'); -- Wooly Rhino


-- --------------------------------------------------------------------------------------
-- ITEM: Update Old Crqfty/Ironjaw Drop Rate
-- --------------------------------------------------------------------------------------
UPDATE `stygian_world`.`fishing_loot_template` SET `entry`='1637', `item`='34486', `ChanceOrQuestChance`='0.09', `lootmode`='1', `groupid`='0', `mincountOrRef`='1', `maxcount`='1' WHERE (`entry`='1637') AND (`item`='34486');
UPDATE `stygian_world`.`fishing_loot_template` SET `entry`='1537', `item`='34484', `ChanceOrQuestChance`='0.11', `lootmode`='1', `groupid`='0', `mincountOrRef`='1', `maxcount`='1' WHERE (`entry`='1537') AND (`item`='34484');


-- --------------------------------------------------------------------------------------
-- QUEST: HOMEWARD BOUND - (LevanSturua)
-- --------------------------------------------------------------------------------------
DELETE FROM `quest_template_addon` WHERE (ID = 4770);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(4770, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);


-- --------------------------------------------------------------------------------------
-- RAID CREATURE: Sarathstra (LevanSturua)
-- --------------------------------------------------------------------------------------
DELETE FROM `smart_scripts` WHERE `entryorguid`=26858 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
('26858', '0', '0', '0', '38', '0', '100', '0', '1', '1', '0', '0', '69', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '4374.88', '943.2', '88.7', '0', 'On Data Set - Move To Pos'),
('26858', '0', '1', '7', '34', '0', '100', '0', '8', '0', '0', '0', '22', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Movement Inform - Set Phase'),
('26858', '0', '2', '3', '60', '1', '100', '1', '0', '0', '0', '0', '60', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'On Update - Set Fly false'),
('26858', '0', '3', '4', '61', '1', '100', '0', '0', '0', '0', '0', '91', '3', '3', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'On Update - Remove Byte 0'),
('26858', '0', '4', '0', '61', '0', '100', '0', '0', '0', '0', '0', '49', '0', '0', '0', '0', '0', '0', '21', '100', '0', '0', '0', '0', '0', '0', 'On Update - Attack Start'),
('26858', '0', '5', '6', '25', '0', '100', '0', '0', '0', '0', '0', '60', '1', '150', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'On Reset - Set Fly true'),
('26858', '0', '6', '0', '61', '0', '100', '0', '0', '0', '0', '0', '90', '3', '3', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'On Reset - Set Byte 0'),
('26858', '0', '7', '0', '61', '0', '100', '0', '0', '0', '0', '0', '101', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Movement Inform - Set Home Position'),
('26858', '0', '8', '0', '0', '0', '100', '0', '5000', '8000', '6000', '9000', '11', '47425', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', 'Frost Breath'),
('26858', '0', '9', '0', '0', '0', '100', '0', '15000', '18000', '40000', '43000', '11', '61085', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', 'Blizzard'),
('26858', '0', '10', '0', '0', '0', '100', '0', '45000', '48000', '45000', '48000', '11', '39005', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Shadow Nova');


-- --------------------------------------------------------------------------------------
--	RAID CREATURE: Lady Vash (Nerf paralyze effect from tainted core)
-- --------------------------------------------------------------------------------------
UPDATE item_template
SET spellid_3 = 0, spelltrigger_3= 0
WHERE entry = 31088;


-- --------------------------------------------------------------------------------------
-- Ashes of Alar (Drop chance now 100% from 1.9% with 4 dropping per kill)
-- --------------------------------------------------------------------------------------
UPDATE `stygian_world`.`item_template` SET `entry`='32458', `class`='15', `subclass`='5', `SoundOverrideSubclass`='-1', `name`='Ashes of Al\'ar', `displayid`='44872', `Quality`='4', `Flags`='0', `FlagsExtra`='0', `BuyCount`='1', `BuyPrice`='150000000', `SellPrice`='150000000', `InventoryType`='0', `AllowableClass`='-1', `AllowableRace`='-1', `ItemLevel`='70', `RequiredLevel`='50', `RequiredSkill`='762', `RequiredSkillRank`='300', `requiredspell`='0', `requiredhonorrank`='0', `RequiredCityRank`='0', `RequiredReputationFaction`='0', `RequiredReputationRank`='0', `maxcount`='1', `stackable`='1', `ContainerSlots`='0', `StatsCount`='0', `stat_type1`='0', `stat_value1`='0', `stat_type2`='0', `stat_value2`='0', `stat_type3`='0', `stat_value3`='0', `stat_type4`='0', `stat_value4`='0', `stat_type5`='0', `stat_value5`='0', `stat_type6`='0', `stat_value6`='0', `stat_type7`='0', `stat_value7`='0', `stat_type8`='0', `stat_value8`='0', `stat_type9`='0', `stat_value9`='0', `stat_type10`='0', `stat_value10`='0', `ScalingStatDistribution`='0', `ScalingStatValue`='0', `dmg_min1`='0', `dmg_max1`='0', `dmg_type1`='0', `dmg_min2`='0', `dmg_max2`='0', `dmg_type2`='0', `armor`='0', `holy_res`='0', `fire_res`='0', `nature_res`='0', `frost_res`='0', `shadow_res`='0', `arcane_res`='0', `delay`='0', `ammo_type`='0', `RangedModRange`='0', `spellid_1`='55884', `spelltrigger_1`='0', `spellcharges_1`='-1', `spellppmRate_1`='0', `spellcooldown_1`='-1', `spellcategory_1`='330', `spellcategorycooldown_1`='3000', `spellid_2`='40192', `spelltrigger_2`='6', `spellcharges_2`='0', `spellppmRate_2`='0', `spellcooldown_2`='-1', `spellcategory_2`='0', `spellcategorycooldown_2`='-1', `spellid_3`='0', `spelltrigger_3`='0', `spellcharges_3`='0', `spellppmRate_3`='0', `spellcooldown_3`='-1', `spellcategory_3`='0', `spellcategorycooldown_3`='-1', `spellid_4`='0', `spelltrigger_4`='0', `spellcharges_4`='0', `spellppmRate_4`='0', `spellcooldown_4`='-1', `spellcategory_4`='0', `spellcategorycooldown_4`='-1', `spellid_5`='0', `spelltrigger_5`='0', `spellcharges_5`='0', `spellppmRate_5`='0', `spellcooldown_5`='-1', `spellcategory_5`='0', `spellcategorycooldown_5`='-1', `bonding`='1', `description`='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is an extremely fast mount.', `PageText`='0', `LanguageID`='0', `PageMaterial`='0', `startquest`='0', `lockid`='0', `Material`='-1', `sheath`='0', `RandomProperty`='0', `RandomSuffix`='0', `block`='0', `itemset`='0', `MaxDurability`='0', `area`='0', `Map`='0', `BagFamily`='0', `TotemCategory`='0', `socketColor_1`='0', `socketContent_1`='0', `socketColor_2`='0', `socketContent_2`='0', `socketColor_3`='0', `socketContent_3`='0', `socketBonus`='0', `GemProperties`='0', `RequiredDisenchantSkill`='-1', `ArmorDamageModifier`='0', `duration`='0', `ItemLimitCategory`='0', `HolidayId`='0', `ScriptName`='', `DisenchantID`='0', `FoodType`='0', `minMoneyLoot`='0', `maxMoneyLoot`='0', `flagsCustom`='0', `VerifiedBuild`='12340' WHERE (`entry`='32458');

-- UPDATE `stygian_world`.`item_template` SET `entry`='32458', `class`='15', `subclass`='5', `SoundOverrideSubclass`='-1', `name`='Ashes of Al\'ar', `displayid`='44872', `Quality`='4', `Flags`='0', `FlagsExtra`='0', `BuyCount`='1', `BuyPrice`='150000000', `SellPrice`='150000000', `InventoryType`='0', `AllowableClass`='-1', `AllowableRace`='-1', `ItemLevel`='70', `RequiredLevel`='50', `RequiredSkill`='762', `RequiredSkillRank`='300', `requiredspell`='0', `requiredhonorrank`='0', `RequiredCityRank`='0', `RequiredReputationFaction`='0', `RequiredReputationRank`='0', `maxcount`='1', `stackable`='1', `ContainerSlots`='0', `StatsCount`='0', `stat_type1`='0', `stat_value1`='0', `stat_type2`='0', `stat_value2`='0', `stat_type3`='0', `stat_value3`='0', `stat_type4`='0', `stat_value4`='0', `stat_type5`='0', `stat_value5`='0', `stat_type6`='0', `stat_value6`='0', `stat_type7`='0', `stat_value7`='0', `stat_type8`='0', `stat_value8`='0', `stat_type9`='0', `stat_value9`='0', `stat_type10`='0', `stat_value10`='0', `ScalingStatDistribution`='0', `ScalingStatValue`='0', `dmg_min1`='0', `dmg_max1`='0', `dmg_type1`='0', `dmg_min2`='0', `dmg_max2`='0', `dmg_type2`='0', `armor`='0', `holy_res`='0', `fire_res`='0', `nature_res`='0', `frost_res`='0', `shadow_res`='0', `arcane_res`='0', `delay`='0', `ammo_type`='0', `RangedModRange`='0', `spellid_1`='55884', `spelltrigger_1`='0', `spellcharges_1`='-1', `spellppmRate_1`='0', `spellcooldown_1`='-1', `spellcategory_1`='330', `spellcategorycooldown_1`='3000', `spellid_2`='40192', `spelltrigger_2`='6', `spellcharges_2`='0', `spellppmRate_2`='0', `spellcooldown_2`='-1', `spellcategory_2`='0', `spellcategorycooldown_2`='-1', `spellid_3`='0', `spelltrigger_3`='0', `spellcharges_3`='0', `spellppmRate_3`='0', `spellcooldown_3`='-1', `spellcategory_3`='0', `spellcategorycooldown_3`='-1', `spellid_4`='0', `spelltrigger_4`='0', `spellcharges_4`='0', `spellppmRate_4`='0', `spellcooldown_4`='-1', `spellcategory_4`='0', `spellcategorycooldown_4`='-1', `spellid_5`='0', `spelltrigger_5`='0', `spellcharges_5`='0', `spellppmRate_5`='0', `spellcooldown_5`='-1', `spellcategory_5`='0', `spellcategorycooldown_5`='-1', `bonding`='1', `description`='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is an extremely fast mount.', `PageText`='0', `LanguageID`='0', `PageMaterial`='0', `startquest`='0', `lockid`='0', `Material`='-1', `sheath`='0', `RandomProperty`='0', `RandomSuffix`='0', `block`='0', `itemset`='0', `MaxDurability`='0', `area`='0', `Map`='0', `BagFamily`='0', `TotemCategory`='0', `socketColor_1`='0', `socketContent_1`='0', `socketColor_2`='0', `socketContent_2`='0', `socketColor_3`='0', `socketContent_3`='0', `socketBonus`='0', `GemProperties`='0', `RequiredDisenchantSkill`='-1', `ArmorDamageModifier`='0', `duration`='0', `ItemLimitCategory`='0', `HolidayId`='0', `ScriptName`='', `DisenchantID`='0', `FoodType`='0', `minMoneyLoot`='0', `maxMoneyLoot`='0', `flagsCustom`='0', `VerifiedBuild`='12340' WHERE (`entry`='32458');

-- Creature Loot Template (100 drop chance that 4 drop)
UPDATE `stygian_world`.`creature_loot_template` SET `entry`='19622', `item`='32458', `ChanceOrQuestChance`='100', `lootmode`='1', `groupid`='0', `mincountOrRef`='4', `maxcount`='4' WHERE (`entry`='19622') AND (`item`='32458');

-- UPDATE `stygian_world`.`creature_loot_template` SET `entry`='19622', `item`='32458', `ChanceOrQuestChance`='100', `lootmode`='1', `groupid`='0', `mincountOrRef`='1', `maxcount`='1' WHERE (`entry`='19622') AND (`item`='32458');


-- --------------------------------------------------------------------------------------
-- Disgusting OozLing - (Drop chance now 10% from 1.9%)
-- --------------------------------------------------------------------------------------
UPDATE `stygian_world`.`item_loot_template` SET `entry`='20768', `item`='20769', `ChanceOrQuestChance`='18', `lootmode`='1', `groupid`='0', `mincountOrRef`='1', `maxcount`='1' WHERE (`entry`='20768') AND (`item`='20769');

-- UPDATE `stygian_world`.`item_loot_template` SET `entry`='20768', `item`='20769', `ChanceOrQuestChance`='1.9', `lootmode`='1', `groupid`='0', `mincountOrRef`='1', `maxcount`='1' WHERE (`entry`='20768') AND (`item`='20769');


-- --------------------------------------------------------------------------------------
-- Ragnaros drops Direbrew's Remote (Drop chance 33%)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES ('11502', '37863', '33', '1', '0', '1', '1');


-- --------------------------------------------------------------------------------------
-- Item: Nerain's Scrying Goggles
-- --------------------------------------------------------------------------------------
DELETE FROM `creature_loot_template` WHERE `item`=20951;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(11502,20951,-100,1,0,1,1), -- Ragnaros
(11658,20951,-100,1,0,1,1), -- Molten Giant
(11659,20951,-100,1,0,1,1), -- Molten Destroyer
(11661,20951,-100,1,0,1,1), -- Flamewaker
(11662,20951,-100,1,0,1,1), -- Flamewaker Priest
(11663,20951,-100,1,0,1,1), -- Flamewaker Healer
(11664,20951,-100,1,0,1,1), -- Flamewaker Elite
(11665,20951,-100,1,0,1,1), -- Lava Annihilator
(11666,20951,-100,1,0,1,1), -- Firewalker
(11667,20951,-100,1,0,1,1), -- Flameguard
(11668,20951,-100,1,0,1,1), -- Firelord
(11669,20951,-100,1,0,1,1), -- Flame Imp
(11673,20951,-100,1,0,1,1), -- Ancient Core Hound
(11982,20951,-100,1,0,1,1), -- Magmadar
(11988,20951,-100,1,0,1,1), -- Golemagg the Incinerator
(12056,20951,-100,1,0,1,1), -- Baron Geddon
(12057,20951,-100,1,0,1,1), -- Garr
(12076,20951,-100,1,0,1,1), -- Lava Elemental
(12098,20951,-100,1,0,1,1), -- Sulfuron Harbinger
(12100,20951,-100,1,0,1,1), -- Lava Reaver
(12101,20951,-100,1,0,1,1), -- Lava Surger
(12118,20951,-100,1,0,1,1), -- Lucifron
(12119,20951,-100,1,0,1,1), -- Flamewaker Protector
(12259,20951,-100,1,0,1,1), -- Gehennas
(12264,20951,-100,1,0,1,1); -- Shazzrah


-- --------------------------------------------------------------------------------------
-- Fix Creature-Text Errors 
-- 2019-02-05 - Some of these have been fixed in an AC Repo Commit below
--
-- CreatureTextMgr: Could not find Text for Creature(Invisible Stalker (Floating Only)) Entry 27047 in 'creature_text' table. Ignoring.
-- CreatureTextMgr: Could not find Text for Creature(Theresa Wolf) Entry 29641 in 'creature_text' table. Ignoring.
-- CreatureTextMgr: Could not find Text for Creature(Enchanter Nalthanis) Entry 28693 in 'creature_text' table. Ignoring.
-- CreatureTextMgr: Could not find Text for Creature(Paldesse) Entry 28995 in 'creature_text' table. Ignoring.
-- CreatureTextMgr: Could not find Text for Creature(Hagatha Moorehead) Entry 29636 in 'creature_text' table. Ignoring
-- CreatureTextMgr: Could not find Text for Creature(Orland Schaeffer) Entry 29506 in 'creature_text' table. Ignoring.
-- CreatureTextMgr: Could not find Text for Creature(Warp-Huntress Kula) Entry 32711 in 'creature_text' table. Ignoring.
--
-- --------------------------------------------------------------------------------------
-- DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 27047;
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 29641;
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 28693;
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 28995;
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 29636;
-- DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 29506;
-- DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 32711;

-- DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = 77372;
-- DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = 77373;

-- Creature Text
-- INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('27047', '0', '0', 'You sense an invisible stalker next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77372', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('29641', '0', '0', 'You sense Theresa Wolf next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('28693', '0', '0', 'You sense Enchanter Nalthanis ext to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('28995', '0', '0', 'You sense Paldesse next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('29636', '0', '0', 'You sense Hagatha Moorehead next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

-- INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('29506', '0', '0', 'You sense Orland Schaeffer next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

-- INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('32711', '0', '0', 'You sense Warp-Huntress Kula next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

-- Broadcast Text 
-- INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES ('77372', '0', 'You sense an invisible stalker next to you. (Broadcast)', '', '274', '0', '0', '0', '0', '0', '0', '0', '0', '18019');

INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES ('77373', '0', 'Placeholder (Broadcast)', '', '274', '0', '0', '0', '0', '0', '0', '0', '0', '18019');


-- --------------------------------------------------------------------------------------
-- Flamewaker Protector (Fix Invalid Waypoint)
--
-- WaypointMovementGenerator::LoadPath: creature Flamewaker Protector (Entry: 12119 GUID: 2026922) doesn't have waypoint path id: 566060
-- WaypointMovementGenerator::LoadPath: creature Flamewaker Protector (Entry: 12119 GUID: 2026923) doesn't have waypoint path id: 566070
--
-- --------------------------------------------------------------------------------------
DELETE FROM  `stygian_world`.`creature_addon` WHERE path_id = 566060;
DELETE FROM  `stygian_world`.`creature_addon` WHERE path_id = 566070;


-- --------------------------------------------------------------------------------------
-- Silas Darkmoon Faire Text
-- --------------------------------------------------------------------------------------
UPDATE `stygian_world`.`npc_text` SET `ID`='7336', `text0_0`='It\'s not always about money, $N!  While we receive generous donations - some extremely substantial - our traveling troupe of performers is fueled creatively by a need to brighten this war-torn world.  Don\'t worry about us, but instead let us worry about how to best entertain you.' WHERE (`ID`='7336');
UPDATE `stygian_world`.`broadcast_text` SET `ID`='10039', `Language`='0', `MaleText`='This ain\'t a ride, $N.  Beat it.' WHERE (`ID`='10039');


## ########################################################################################################################################
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- #### AC REPO FIXES ####
-- Cherry-Picked commits from the AzerothCore repository
-- ----------------------------------------------------------------------------------------------------------------------------------------
## ########################################################################################################################################


-- --------------------------------------------------------------------------------------
-- Nefarian's Head in Orgrimmar
-- --------------------------------------------------------------------------------------
-- Overlord Runthak SAI (Horde)
SET @ENTRY := 14392;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,7784,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Runthak - On Quest 'The Lord of Blackrock' Finished - Run Script"),
(@ENTRY,0,1,0,61,0,100,0,7784,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Overlord Runthak - On Quest 'The Lord of Blackrock' Finished - Store Targetlist");

-- Actionlist SAI
SET @ENTRY := 1439200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Runthak - On Script - Remove Npc Flag Questgiver"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Runthak - On Script - Set Run Off"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,1544,-4425.87,10.9056,3.323,"Overlord Runthak - On Script - Move To Position"),
(@ENTRY,9,3,0,0,0,100,0,14000,14000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.6367,"Overlord Runthak - On Script - Set Orientation 0,6367"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,1,0,17000,0,0,0,0,12,1,0,0,0,0,0,0,"Overlord Runthak - On Script - Say Line 0"),
(@ENTRY,9,5,0,0,0,100,0,17000,17000,0,0,1,1,10000,0,0,0,0,12,1,0,0,0,0,0,0,"Overlord Runthak - On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,50,179881,21600,0,0,0,0,8,0,0,0,1540.28,-4422.19,7.0051,5.22833,"Overlord Runthak - On Script - Summon Gameobject 'The Severed Head of Nefarian'"),
(@ENTRY,9,7,0,0,0,100,0,5000,5000,0,0,9,0,0,0,0,0,0,20,179881,100,0,0,0,0,0,"Overlord Runthak - On Script - Activate Gameobject"),
(@ENTRY,9,8,0,0,0,100,0,5000,5000,0,0,11,22888,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Runthak - On Script - Cast 'Rallying Cry of the Dragonslayer'"),
(@ENTRY,9,9,0,0,0,100,0,10000,10000,0,0,69,0,0,0,0,0,0,8,0,0,0,1568,-4405.87,8.13371,0.3434,"Overlord Runthak - On Script - Move To Position"),
(@ENTRY,9,10,0,0,0,100,0,15000,15000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.31613,"Overlord Runthak - On Script - Set Orientation 3,31613"),
(@ENTRY,9,11,0,0,0,100,0,1000,1000,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Runthak - On Script - Add Npc Flag Questgiver");

DELETE FROM `creature_text` WHERE `entry` IN (14392);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextId`) VALUES 
(14392, 0, 0, 'NEFARIAN IS SLAIN! people of Orgrimmar, bow down before the might of $N and his allies for they have laid a blow against the Black Dragonflight that is sure to stir the Aspects from their malaise! This defeat shall surely be felt by the father of the Black Flight: Deathwing reels in pain and anguish this day!', 14, 0, 100, 0, 0, 0, 'Overlord Runthak', 9867),
(14392, 1, 0, 'Be lifted by $N\'s accomplishment! Revel in their rallying cry!', 14, 0, 100, 0, 0, 0, 'Overlord Runthak', 9868);


-- --------------------------------------------------------------------------------------
-- Arrakoa Egg - 1 parent 7a3a9a8 commit 8ce54190e157515dda01eec2028198735a3c48e1
-- --------------------------------------------------------------------------------------
UPDATE `creature_template`
SET
`AIName` = 'SmartAI',
`unit_flags` = 131076,
`unit_flags2` = 34816,
`flags_extra` = 2
WHERE `entry` = 20214;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 20214;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
(20214,0,0,0,10,0,100,0,0,6,20000,20000,11,35788,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arakkoa Egg -  Within 6 Range OOC LoS - Cast Spell ''Arakkoa Egg Debuff'' (35788) on self');


-- --------------------------------------------------------------------------------------
-- Senjinn Fetish
-- --------------------------------------------------------------------------------------
SET @ENTRY := 33810;

UPDATE `creature_template` SET `modelid1` = 28880, `modelid2` = 0, `modelid3` = 0, `modelid4` = 0, `AIName`='SmartAI' WHERE `entry` = @ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY, @ENTRY * 100, @ENTRY * 100 + 1, @ENTRY * 100 + 2);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,11,52619,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen''Jin Fetish - Just Summoned - Cast Spell ''Enchanted Tiki Warrior: Enchanted Tiki Warrior Glow Visual'' (52619) on self'),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,87,@ENTRY * 100,@ENTRY * 100 + 1,@ENTRY * 100 + 2,0,0,0,1,0,0,0,0,0,0,0,'Sen''Jin Fetish - Just Summoned - Call Random Script'),
(@ENTRY * 100,9,0,0,54,0,100,0,0,0,0,0,11,52614,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen''Jin Fetish - Just Summoned - Cast Spell ''Enchanted Tiki Warrior: Enchanted Tiki Warrior Visual 01'' (52614) on self'),
(@ENTRY * 100 + 1,9,0,0,54,0,100,0,0,0,0,0,11,52617,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen''Jin Fetish - Just Summoned - Cast Spell ''Enchanted Tiki Warrior: Enchanted Tiki Warrior Visual 02'' (52617) on self'),
(@ENTRY * 100 + 2,9,0,0,54,0,100,0,0,0,0,0,11,52618,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen''Jin Fetish - Just Summoned - Cast Spell ''Enchanted Tiki Warrior: Enchanted Tiki Warrior Visual 03'' (52618) on self');


-- --------------------------------------------------------------------------------------
-- *** DB/Quest: Escape Through Force & Stealth. (#1100)
-- --------------------------------------------------------------------------------------
INSERT INTO version_db_world (`sql_rev`) VALUES ('1544169970525311500');
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3692, 369200, 369201);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3692, 0, 0, 1, 19, 0, 100, 0, 994, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Quest 'Escape Through Force' Taken - Store Targetlist"),
(3692, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 80, 369200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Quest 'Escape Through Force' Taken - Run Script"),
(3692, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Script - Remove Sit state"),
(3692, 0, 3, 4, 19, 0, 100, 0, 995, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Quest 'Escape Through Stealth' Taken - Store Targetlist"),
(3692, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 369201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Quest 'Escape Through Stealth' Taken - Run Script"),
(3692, 0, 5, 6, 40, 0, 100, 0, 15, 3692, 0, 0, 41, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Waypoint 15 Reached (Path 3692) - Despawn 10 Seconds"),
(3692, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, "Volcor - On Waypoint 15 Reached (Path 3692) - Say Line 5"),
(3692, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 15, 994, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, "Volcor - On Waypoint 15 Reached (Path 3692) - Quest Credit 'Escape Through Force'"),
(3692, 0, 8, 9, 40, 0, 100, 0, 2, 369200, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Waypoint 2 Reached (Path 369200) - Despawn 10 Seconds"),
(3692, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 15, 995, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, "Volcor - On Waypoint 15 Reached (Path 3692) - Quest Credit 'Escape Through Force'"),
(3692, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Waypoint 2 Reached (Path 369200) - Talk 2"),
(3692, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 11, 6298, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Waypoint 2 Reached (Path 369200) - Cast Spell 'Form of the Moonstalker'"),
(3692, 0, 12, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Aggro - Talk 4'"),
(369200, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Script - Set Unit Flags"),
(369200, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 83, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Script - Remove Gossip+Questgiver npcflag"),
(369200, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Script - Say Line 3"),
(369200, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 53, 0, 3692, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Script - Start Waypoint"),
(369201, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Script - Set Unit Flags"),
(369201, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 83, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Script - Remove Gossip+Questgiver npcflag"),
(369201, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 0, "Volcor - On Script - Say Line 1"),
(369201, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 53, 0, 369200, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Volcor - On Script - Start Waypoint");
DELETE FROM `creature_addon` WHERE `guid`=37096;
DELETE FROM `creature_template_addon` WHERE `entry`=3692;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(3692, 0, 0, 1, 4097, 0, "");
DELETE FROM `creature_text` WHERE `entry`=3692 AND `groupid` BETWEEN 1 AND 5;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(3692, 1, 0, (SELECT `MaleText` FROM `broadcast_text` WHERE `ID`=1236), 12, 7, 100, 0, 0, 0, 1236, 0, "Volcor"),
(3692, 2, 0, (SELECT `MaleText` FROM `broadcast_text` WHERE `ID`=1238), 16, 7, 100, 0, 0, 0, 1238, 0, "Volcor"),
(3692, 3, 0, (SELECT `MaleText` FROM `broadcast_text` WHERE `ID`=1237), 12, 7, 100, 0, 0, 0, 1237, 0, "Volcor"),
(3692, 4, 0, (SELECT `MaleText` FROM `broadcast_text` WHERE `ID`=3744), 12, 7, 100, 0, 0, 0, 3744, 0, "Volcor"),
(3692, 5, 0, (SELECT `MaleText` FROM `broadcast_text` WHERE `ID`=1243), 12, 7, 100, 0, 0, 0, 1243, 0, "Volcor");
DELETE FROM `waypoints` WHERE `entry`=369200;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(369200, 1, 4606.61, 2.96905, 69.909, "Volcor"),
(369200, 2, 4612.4858, 14.2943, 69.8441, "Volcor");
UPDATE `creature` SET `position_x`='4758.35', `position_y`='203.678', `position_z`='53.895' WHERE `guid`=37101;


-- --------------------------------------------------------------------------------------
-- *** DB/Creature Add missing pet trainer / NPC text (#1115)
-- --------------------------------------------------------------------------------------
INSERT INTO version_db_world (`sql_rev`) VALUES ('1544714673423311600');


-- --------------------------------------------------------------------------------------
-- NPC Urcos correct Creature_Text
-- --------------------------------------------------------------------------------------
UPDATE `creature_text` SET `text`='My freedom means nothing if we fail to save Ursoc.  Make haste, $N.' WHERE `entry`= 27328 AND `groupid`=2 AND `id`= 0;


-- --------------------------------------------------------------------------------------
-- NPC entry 40405 Kieupid, Pet Trainer in Silvermoon City
-- --------------------------------------------------------------------------------------
SET @CGUID = 3548;
DELETE FROM `creature` WHERE `id` = 40405;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@CGUID,40405,530,1,1,0,0, 9924.067, -7400.503, 13.71723, 6.073746, 120,0,0,0,0,0,0,0,0);


-- --------------------------------------------------------------------------------------
-- *** DB/Players: Apprentice Riding to Death Knight on creation (#810)
-- --------------------------------------------------------------------------------------
INSERT INTO version_db_world (`sql_rev`) VALUES ('1520902066724046200');
DELETE FROM `playercreateinfo_spell` WHERE `Spell`=33388 AND `racemask`=0 AND `classmask`=32;
INSERT INTO `playercreateinfo_spell` (`racemask`, `classmask`, `Spell`, `Note`) VALUES (0, 32, 33388, 'Apprentice Riding');


-- --------------------------------------------------------------------------------------
-- *** DB/SAI: fix Ward of Laze creature (#1145)
-- --------------------------------------------------------------------------------------
INSERT INTO version_db_world (`sql_rev`) VALUES ('1545760746348146400');
UPDATE `creature_template` SET `AIName` = 'SmartAI', `unit_flags` = 131076, `flags_extra` = 0 WHERE `entry` = 2667;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2667;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(2667, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 3000, 3000, 11, 3826, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 'Ward of Laze - In Combat - Cast \'Ward of Laze Passive\'');


-- --------------------------------------------------------------------------------------
-- *** DB/NPC: Quartermaster Bartlett can now repair (#1149)
-- --------------------------------------------------------------------------------------
INSERT INTO version_db_world (`sql_rev`) VALUES ('1545780720578767600');
DELETE FROM `creature_template_addon` WHERE `entry` = 27267;
INSERT INTO `creature_template_addon` (`entry`, `bytes1`, `bytes2`, `emote`) VALUES (27267, 0, 0, 233);
UPDATE `gossip_menu_option` SET `option_id` = 3, `npc_option_npcflag` = 128 WHERE `menu_id` = 9487;


-- --------------------------------------------------------------------------------------
-- 2019-01-27 - fix(DB/Quest): Mage Summoner (#1341)
-- Added gossip menu option for Shaman Trainer
-- Updated faction for creature Minor Water Guardian
-- Updated flags for creature Sarilus Foulborne
-- --------------------------------------------------------------------------------------
-- Adding train option in gossip menu for Sagorne Creststrider <Shaman Trainer>
UPDATE `gossip_menu_option` SET `option_text`='Teach me the ways of the spirits.' WHERE `menu_id`=5123 AND `option_id`=0;

-- [Quest] Mage Summoner
UPDATE `creature_template` SET `faction`=91 WHERE `entry`=3950;
UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry`=3986;

-- *** DB/SAI: Quest Forge Camp Annihilated (#1146)
INSERT INTO version_db_world (`sql_rev`) VALUES ('1545767614007203800');
DELETE FROM `smart_scripts` WHERE `entryorguid` = 19210;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19210, 0, 0, 1, 8, 0, 100, 0, 33532, 0, 0, 0, 33, 19210, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 'On spell \'Fel Cannon: Fear\' (33532) hit  - Party invoker: Give kill credit \'Fel Cannon: Fear\' (19210)'),
(19210, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 19211, 100, 0, 0, 0, 0, 0, 'Linked - Self: Look at closest alive creature \'Fel Cannon: Fear Target\' (19211) in 100 yards'),
(19210, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Linked - Self: Set event phase to 2'),
(19210, 0, 3, 0, 1, 2, 100, 0, 3000, 3000, 10000, 10000, 11, 33535, 0, 0, 0, 0, 0, 19, 19211, 100, 0, 0, 0, 0, 0, 'When out of combat and timer at the begining between 3000 and 3000 ms (and later repeats every 10000 and 10000 ms) - Self: Cast spell \'Fel Energy Beam\' (33535) on closest alive creature \'Fel Cannon: Fear Target\' (19211) in 100 yards'),
(19210, 0, 4, 5, 1, 2, 100, 0, 8000, 8000, 10000, 10000, 92, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'When out of combat and timer at the begining between 8000 and 8000 ms (and later repeats every 10000 and 10000 ms) - Self: Interrupt cast spell'),
(19210, 0, 5, 6, 61, 2, 100, 0, 0, 0, 0, 0, 86, 42346, 0, 19, 19211, 100, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Linked - Cross Cast \'Cosmetic - Flame Patch 2.0\' (42346) on closest alive creature \'Fel Cannon: Fear Target\' (19211) in 100 yards'),
(19210, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Linked - Self: Set event phase to 1'),
(19210, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1.09956, 'Linked - Self: Reset to original orientation 1.09956');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 19067;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19067, 0, 0, 1, 8, 0, 100, 0, 33531, 0, 0, 0, 33, 19067, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 'On spell \'Fel Cannon: Hate\' (33531) hit  - Party invoker: Give kill credit \'Fel Cannon: Hate\' (19067)'),
(19067, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 19212, 100, 0, 0, 0, 0, 0, 'Linked - Self: Look at closest alive creature \'Fel Cannon: Hate Target\' (19212) in 100 yards'),
(19067, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Linked - Self: Set event phase to 2'),
(19067, 0, 3, 0, 1, 2, 100, 0, 3000, 3000, 10000, 10000, 11, 33535, 0, 0, 0, 0, 0, 19, 19212, 100, 0, 0, 0, 0, 0, 'When out of combat and timer at the begining between 3000 and 3000 ms (and later repeats every 10000 and 10000 ms) - Self: Cast spell \'Fel Energy Beam\' (33535) on closest alive creature \'Fel Cannon: Hate Target\' (19212) in 100 yards'),
(19067, 0, 4, 5, 1, 2, 100, 0, 8000, 8000, 10000, 10000, 92, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'When out of combat and timer at the begining between 8000 and 8000 ms (and later repeats every 10000 and 10000 ms) - Self: Interrupt cast spell'),
(19067, 0, 5, 6, 61, 2, 100, 0, 0, 0, 0, 0, 86, 42346, 0, 19, 19212, 100, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Linked - Cross Cast \'Cosmetic - Flame Patch 2.0\' (42346) on closest alive creature \'Fel Cannon: Hate Target\' (19212) in 100 yards'),
(19067, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Linked - Self: Set event phase to 1'),
(19067, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0.610865, 'Linked - Self: Reset to original orientation 0.610865');

-- *** DB: Flying pets can follow player on flying mount (#1212)
INSERT INTO version_db_world (`sql_rev`) VALUES ('1546301159513401339');

UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` in
(20408, 25110, 17255, 7391, 36482, 16701, 40624, 27346, 28883, 29147,
27217, 36908, 28470, 18381, 26119, 33810, 23231, 25062, 33197, 29089,
28513, 36909, 7547, 21056, 21010, 21076, 7543, 21055, 7553, 14755,
7555, 22445, 36607, 7390, 7387, 7389, 14756, 21064, 21009, 21063,
9662, 32589, 7544, 7545, 16085, 21018, 32590, 21008);

-- *** DB/Core: Proper hover height + flying animations for vanity pets (#1237)
INSERT INTO version_db_world (`sql_rev`) VALUES ('1546694249586814731');

-- Moths:
DELETE FROM `creature_template_addon` WHERE `entry` IN (21008,21009,21010,21018);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(21008,0,0,33554432,0,0,''),
(21009,0,0,33554432,0,0,''),
(21010,0,0,33554432,0,0,''),
(21018,0,0,33554432,0,0,'');
UPDATE `creature_template` SET `ScriptName` = 'npc_pet_gen_moth' WHERE `entry` IN (21008,21009,21010,21018);

-- Gryphon Hatchling / Wind Rider Cub:
DELETE FROM `creature_template_addon` WHERE `entry` IN (36908,36909);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(36908,0,0,50331648,0,0,''),
(36909,0,0,50331648,0,0,'');

-- The smart script for the Wind Rider Cub can also be used for the Gryphon Hatchling:
UPDATE `creature_template` SET `ScriptName` = 'npc_pet_gen_wind_rider_cub' WHERE `entry` = 36908;

-- Dragonhawk Hatchlings:
DELETE FROM `creature_template_addon` WHERE `entry` IN (21055,21056,21063,21064);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(21055,0,0,33554432,0,0,''),
(21056,0,0,33554432,0,0,''),
(21063,0,0,33554432,0,0,''),
(21064,0,0,33554432,0,0,'');

-- Dragon Whelplings (including Frosty and Netherwhelp):
DELETE FROM `creature_template_addon` WHERE `entry` IN (7543,7544,7545,7547,36607,28883,18381);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(7543,0,0,33554432,0,0,''),
(7544,0,0,33554432,0,0,''),
(7545,0,0,33554432,0,0,''),
(7547,0,0,33554432,0,0,''),
(36607,0,0,33554432,0,0,''),
(28883,0,0,33554432,0,0,''),
(18381,0,0,33554432,0,0,'');

-- Parrots:
DELETE FROM `creature_template_addon` WHERE `entry` IN (7390,7387,7391,22445,7389);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(7390,0,0,33554432,0,0,''),
(7387,0,0,33554432,0,0,''),
(7391,0,0,33554432,0,0,''),
(22445,0,0,33554432,0,0,''),
(7389,0,0,33554432,0,0,'');

-- Tickbird Hatchlings:
DELETE FROM `creature_template_addon` WHERE `entry` IN (32589,32590);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(32589,0,0,33554432,0,0,''),
(32590,0,0,33554432,0,0,'');

-- Owls:
DELETE FROM `creature_template_addon` WHERE `entry` IN (7553,7555);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(7553,0,0,33554432,0,0,''),
(7555,0,0,33554432,0,0,'');

-- Batlings:
DELETE FROM `creature_template_addon` WHERE `entry` IN (28513,33197);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(28513,0,0,33554432,0,0,''),
(33197,0,0,33554432,0,0,'');

-- Sprite Darter Hatchling:
DELETE FROM `creature_template_addon` WHERE `entry` IN (9662);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(9662,0,0,33554432,0,0,'');

-- Willy:
UPDATE `creature_template_addon` SET `bytes1` = 33554432 WHERE `entry` = 23231;

-- Firefly:
DELETE FROM `creature_template_addon` WHERE `entry` IN (21076);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(21076,0,0,33554432,0,0,'');

-- Mana Wyrmling:
DELETE FROM `creature_template_addon` WHERE `entry` IN (20408);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(20408,0,0,33554432,0,0,'');

-- Nether Ray Fry:
DELETE FROM `creature_template_addon` WHERE `entry` IN (28470);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(28470,0,0,33554432,0,0,'');

-- Phoenix Hatchling:
DELETE FROM `creature_template_addon` WHERE `entry` IN (26119);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(26119,0,0,33554432,0,0,'');

-- Tiny Sporebat:
DELETE FROM `creature_template_addon` WHERE `entry` IN (25062);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(25062,0,0,33554432,0,0,'');

-- *** Update waypoints for black knight in Trail of the champion to be more blizzlike.
INSERT INTO version_db_world (`sql_rev`) VALUES ('1543541842185737300');

DELETE FROM `script_waypoint` WHERE `entry` = 35491 AND `pointid` IN (11,12);
INSERT INTO `script_waypoint` VALUES (35491, 11, 753.757, 634.502, 411.579, 1000, '');
INSERT INTO `script_waypoint` VALUES (35491, 12, 753.757, 634.502, 411.579, 0, '');

-- *** Core/Quest: Mr.Floppy's Perilous Adventure Quest (#1158)
INSERT INTO version_db_world (`sql_rev`) VALUES ('1546128548989877900');

UPDATE `creature_template` SET `VehicleId` = 0 WHERE `entry` = 26586;
UPDATE `creature_template` SET `ScriptName` = 'npc_ravenous_worg' WHERE `entry` = 26590;

-- *** DB/Quest Ulag the Cleaver 
INSERT INTO version_db_world (`sql_rev`) VALUES ('1546933586341240000');

-- Ulag the cleaver SAI
SET @OGUID  =195629;
DELETE FROM `gameobject` WHERE `guid`=@OGUID;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`animprogress`,`state`, `rotation2`, `rotation3`) VALUES
(@OGUID,103813,0,1,1,2388.808, 338.269, 37.013, 2.242750, 10, 255,1, -0.891996, -0.452044);
 
UPDATE `gameobject_template` SET `ScriptName`="" WHERE `entry` IN (104593,176594);
UPDATE `gameobject_template` SET `flags`=`flags`|16 WHERE `entry` IN (176594,103813);
UPDATE `gameobject_template` SET `ScriptName`="" WHERE `entry` IN (104593,176594);
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry` IN (104593);
UPDATE `creature_template` SET `AIName`="SmartAI", `type_flags`=`type_flags`|2048 WHERE `entry` IN (6390);
DELETE FROM `smart_scripts` WHERE `entryorguid`=104593 AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=6390 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (639000,10459300) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(104593,1,0,0,70,0,100,0,2,0,0,0,80,10459300,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mausoleum Trigger - Gob activated - action list"),
(10459300,9,0,0,0,0,100,0,0,0,0,0,12,6390,3,180000,0,0,0,8,0,0,0,2390.26, 336.47, 40.01, 2.26,"Mausoleum Trigger - action list - Summon Ulag"),
(10459300,9,1,0,0,0,100,0,0,0,0,0,9,0,0,0,0,0,0,20,103813,50,0,0,0,0,0,"Mausoleum Trigger - action list - Activate gob"),
(10459300,9,2,0,0,0,100,0,3000,3000,0,0,9,0,0,0,0,0,0,20,176594,50,0,0,0,0,0,"Mausoleum Trigger - action list - Activate gob"),
(10459300,9,3,0,0,0,100,0,6000,6000,0,0,9,0,0,0,0,0,0,20,103813,50,0,0,0,0,0,"Mausoleum Trigger - action list - Activate gob"),
(6390,0,0,0,63,0,100,0,0,0,0,0,80,639000,2,0,0,0,0,1,0,0,0,0,0,0,0,"Ulag - On just summoned - action list"),
(639000,9,0,0,0,0,100,0,0,0,0,0,43,0,10721,0,0,0,0,1,0,0,0,0,0,0,0,"Ulag - action list - mount"),
(639000,9,1,0,0,0,100,0,4000,4000,0,0,69,0,0,0,0,0,0,8,0,0,0,2375.29, 354.41, 38.09,0,"Ulag - action list - move to pos"),
(639000,9,2,0,0,0,100,0,4000,4000,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ulag - action list - desmount"),
(6390,0,1,0,7,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ulag - On evadde - despawn");
 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=104593;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22,1,104593,1,0,29,1,6390,100,0,1,0,0,"","SAI triggers if Ulag is not summoned");


-- --------------------------------------------------------------------------------------
-- 2019-01-27 - Creature Sarilus Foulborne 3986 SAI
-- --------------------------------------------------------------------------------------
SET @ENTRY := 3986;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 0, 0, 100, 0, 4000, 4000, 5000, 8000, 11, 20806, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 4000 and 4000 ms (and later repeats every 5000 and 8000 ms) - Self: Cast spell Frostbolt (20806) on Random hostile"),
(@ENTRY, 0, 1, 0, 0, 0, 100, 1, 0, 1000, 0, 0, 11, 6490, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 0 and 1000 ms (and later repeats every 0 and 0 ms) - Self: Cast spell Sarilus's Elementals (6490) on Self"),
(@ENTRY, 0, 2, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 9, 3950, 0, 40, 0, 0, 0, 0, "On evade - Creature Minor Water Guardian (3950) in 0 - 40 yards: Despawn in 1000 ms");


-- --------------------------------------------------------------------------------------
-- 2019-02-05 - fix(DB): solved several issues (#1375)
--
-- Will fix double quest from creature Captain Hecklebury Smotts
-- Will fix incorrect factions of Torek & Splintertree Raider 
-- ( They belong to Horde Faction as Quest NPC's and will be just attackable while quest is finished ) from opossite faction.
-- Updated faction for NPC Sarkoth ( Monster )
-- Updated pathing for creature Centaur Pariah
-- --------------------------------------------------------------------------------------
INSERT INTO version_db_world (`sql_rev`) VALUES ('1548630540177748900');

-- Removing double quest from creature Captain Hecklebury Smotts
DELETE FROM `creature_queststarter` WHERE `id`=2500 AND `quest`=615;

-- Creatures faction to 67 - Horde
UPDATE `creature_template` SET `faction`='67' WHERE `entry`=12858;
UPDATE `creature_template` SET `faction`='67' WHERE `entry`=12859;

-- NPC Sarkoth faction - Monster
UPDATE `creature_template` SET `faction`='14' WHERE `entry`=3281;

-- Pathing for Centaur Pariah
UPDATE `creature` SET `position_x`=-2145.71, `position_y`=1966.42, `position_z`=84.4919, `spawndist`=0, `MovementType`=2 WHERE `guid`=29069;

DELETE FROM `creature_addon` WHERE `guid`=29069;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(29069,290690,0,0,1,0,"");

DELETE FROM `waypoint_data` WHERE `id`=290690;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(290690,1,-2145.71,1966.42,84.4919,0,0,0,0,100,0),
(290690,2,-2148.35,1973.16,84.0701,0,0,0,0,100,0),
(290690,3,-2156.93,1972.24,80.9217,0,0,0,0,100,0),
(290690,4,-2158.67,1959.92,78.2252,0,0,0,0,100,0),
(290690,5,-2161.1,1953.68,76.6696,0,0,0,0,100,0),
(290690,6,-2159.54,1948.01,74.4792,0,0,0,0,100,0),
(290690,7,-2166.39,1942.92,69.9358,0,0,0,0,100,0),
(290690,8,-2165.94,1938.13,66.2389,0,0,0,0,100,0),
(290690,9,-2167.71,1935.14,63.539,0,0,0,0,100,0),
(290690,10,-2173.82,1935.16,61.1357,0,0,0,0,100,0),
(290690,11,-2185.89,1953.4,61.0883,0,0,0,0,100,0),
(290690,12,-2181.04,1971.95,63.0648,0,0,0,0,100,0),
(290690,13,-2185.23,1996.62,64.0418,0,0,0,0,100,0),
(290690,14,-2184.85,2019.55,64.0418,0,0,0,0,100,0),
(290690,15,-2182.58,2034.38,64.3299,0,0,0,0,100,0),
(290690,16,-2187.89,2045.21,65.1992,0,0,0,0,100,0),
(290690,17,-2175.83,2065.84,63.6989,0,0,0,0,100,0),
(290690,18,-2165.2,2087.16,64.4523,0,0,0,0,100,0),
(290690,19,-2156.65,2104.11,61.6077,0,0,0,0,100,0),
(290690,20,-2151.67,2118.24,60.7861,0,0,0,0,100,0),
(290690,21,-2148.89,2129.81,63.6364,0,0,0,0,100,0),
(290690,22,-2144.39,2148.28,65.8843,0,0,0,0,100,0),
(290690,23,-2141.23,2166.66,66.9008,0,0,0,0,100,0),
(290690,24,-2139.35,2184.03,66.5107,0,0,0,0,100,0),
(290690,25,-2134.91,2204.03,65.2096,0,0,0,0,100,0),
(290690,26,-2131.41,2219.61,64.1073,0,0,0,0,100,0),
(290690,27,-2128.85,2237.09,64.7163,0,0,0,0,100,0),
(290690,28,-2128.27,2222.75,63.9388,0,0,0,0,100,0),
(290690,29,-2133.74,2204.02,65.2261,0,0,0,0,100,0),
(290690,30,-2137.84,2186.67,66.0619,0,0,0,0,100,0),
(290690,31,-2141.6,2170.8,67.1661,0,0,0,0,100,0),
(290690,32,-2147.93,2144.09,66.0683,0,0,0,0,100,0),
(290690,33,-2152.54,2124.61,62.9209,0,0,0,0,100,0),
(290690,34,-2154.5,2116.3,61.1993,0,0,0,0,100,0),
(290690,35,-2160.27,2091.94,63.4087,0,0,0,0,100,0),
(290690,36,-2171.46,2076.47,64.0607,0,0,0,0,100,0),
(290690,37,-2180,2055.74,63.8618,0,0,0,0,100,0),
(290690,38,-2187.17,2043.48,65.118,0,0,0,0,100,0),
(290690,39,-2182.03,2025.33,64.3237,0,0,0,0,100,0),
(290690,40,-2185.91,2006.41,64.0427,0,0,0,0,100,0),
(290690,41,-2184.03,1990.34,64.0427,0,0,0,0,100,0),
(290690,42,-2182.62,1974.82,63.3536,0,0,0,0,100,0),
(290690,43,-2185.55,1962.21,62.0913,0,0,0,0,100,0),
(290690,44,-2182.01,1945.01,60.5147,0,0,0,0,100,0),
(290690,45,-2174.77,1934.49,61.1065,0,0,0,0,100,0),
(290690,46,-2165.66,1935.02,64.5662,0,0,0,0,100,0),
(290690,47,-2166.1,1945.12,71.6517,0,0,0,0,100,0),
(290690,48,-2159.56,1948.89,74.686,0,0,0,0,100,0),
(290690,49,-2159.53,1958.33,77.9476,0,0,0,0,100,0),
(290690,50,-2156.65,1975.9,81.5158,0,0,0,0,100,0),
(290690,51,-2145.71,1971.54,84.3149,0,0,0,0,100,0),
(290690,52,-2143.66,1964.77,84.0694,0,0,0,0,100,0);


-- --------------------------------------------------------------------------------------
-- 2019-02-05 - Fix(DB): Backbiter movement + missing texts in Dalaran (#1384)
--
-- Fix Backbiter following Warp-Huntress Kula in Dalaran. Instead of summoning Backbiter via spell "Summon Backbiter" by Kula it is inserted as regular creature following Kula in close formation. Also fixed some missing texts for the following creature IDs in order to get rid of the errors in the server log:
-- 27047: Invisible Stalker (Floating Only)
-- 32711: Warp-Huntress Kula
-- 29506: Orland Schaeffer
-- Closes #980
-- Closes #1379
-- --------------------------------------------------------------------------------------
INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1548778743987887239');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 32711;
DELETE FROM `creature` WHERE `guid` = 2023271;

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(2023271,32751,571,1,1,28212,0,5808.4,583.112,652.386,5.0091,300,0,0,10635,0,0,0,0,0);

DELETE FROM `creature_formations` WHERE `leaderGUID` = 114764;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`)
VALUES
(114764,114764,0,0,515,0,0),
(114764,2023271,2,270,515,0,0);

DELETE FROM `creature_text` WHERE `entry` IN (27047,32711,29506);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(27047, 0, 0, '', 16, 0, 100, 0, 0, 0, 0, 0, 'Invisible Stalker (Floating Only)'),
(32711, 0, 0, 'So peaceful...', 12, 0, 100, 0, 0, 0, 0, 0, 'Warp-Huntress Kula'),
(29506, 0, 0, 'Welcome traveler!', 12, 0, 100, 0, 0, 0, 0, 0, 'Orland Schaeffer');


-- --------------------------------------------------------------------------------------
-- 2019-02-05 - fix(DB): positioning of the control console on the zeppelin "Cloudkisser" (#1400)
--
-- Fix the positioning of the control console on the zeppelin "Cloudkisser". Otherwise it falls to the ground and floats through the air 
-- while the zeppelin is moving.
-- Closes #1394
-- --------------------------------------------------------------------------------------
INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1549062318108968468');
UPDATE `creature` SET `position_x` = 10.5731, `position_y` = -7.65137, `position_z` = -16.6839, `orientation` = 0 WHERE `guid` = 142823;


-- --------------------------------------------------------------------------------------
-- 2019-02-05 - fix: spell_scripts DB startup errors (#1406)
-- --------------------------------------------------------------------------------------
DELETE FROM spell_scripts WHERE id IN (28732, 54097);


-- --------------------------------------------------------------------------------------
-- 2019-02-05 - TODO - CORE: Remove unsupported achievements notifications on startup (#1418)
-- https://github.com/azerothcore/azerothcore-wotlk/issues/1418
-- --------------------------------------------------------------------------------------
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (4989, 4988, 5620, 5632, 5619, 4987);
/*
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(4987, 12, 0, 0, ''),
(4988, 12, 0, 0, ''),
(4989, 12, 1, 0, ''),
(5619, 12, 0, 0, ''),
(5620, 12, 1, 0, ''),
(5632, 12, 0, 0, '');
*/


-- --------------------------------------------------------------------------------------
-- 2019-02-05 - DB/Creature: Troll Roof Stalkers #1414
-- --------------------------------------------------------------------------------------
INSERT INTO version_db_world (`sql_rev`) VALUES ('1549334128470728600');
SET @GUID := 200150;
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID+0 AND @GUID+2;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `curhealth`, `curmana`, `MovementType`) VALUES
(@GUID+0,23090,1,1,1,0,1,1708.89,-4407.32,40.1085,2.35614,300,0,104790,0,2),
(@GUID+1,23090,1,1,1,0,1,1685.87,-4437.94,36.0057,2.50928,300,0,104790,0,2),
(@GUID+2,23090,1,1,1,0,1,1651.35,-4448.69,38.0034,1.59431,300,0,104790,0,2);

DELETE FROM `creature_addon` WHERE `guid` BETWEEN @GUID+0 AND @GUID+2;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@GUID+0,(@GUID+0)*10,0,0,1,0,'18950 32199'),
(@GUID+1,(@GUID+1)*10,0,0,1,0,'18950 32199'),
(@GUID+2,(@GUID+2)*10,0,0,1,0,'18950 32199');

DELETE FROM `waypoint_data` WHERE `id` BETWEEN (@GUID+0)*10 AND (@GUID+2)*10;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `move_type`, `action_chance`) VALUES
((@GUID+0)*10,1,1708.89,-4407.32,40.1085,0,100),
((@GUID+0)*10,2,1699.21,-4398.37,40.5289,0,100),
((@GUID+0)*10,3,1694.41,-4397.78,40.6138,0,100),
((@GUID+0)*10,4,1682.94,-4404.49,40.6853,0,100),
((@GUID+0)*10,5,1680.72,-4409.19,40.8754,0,100),
((@GUID+0)*10,6,1682.71,-4422.11,40.4622,0,100),
((@GUID+0)*10,7,1686.17,-4425.78,40.6093,0,100),
((@GUID+0)*10,8,1698.87,-4427.43,40.7538,0,100),
((@GUID+0)*10,9,1686.17,-4425.78,40.6093,0,100),
((@GUID+0)*10,10,1682.71,-4422.11,40.4622,0,100),
((@GUID+0)*10,11,1680.72,-4409.19,40.8754,0,100),
((@GUID+0)*10,12,1682.94,-4404.49,40.6853,0,100),
((@GUID+0)*10,13,1694.41,-4397.78,40.6138,0,100),
((@GUID+0)*10,14,1699.21,-4398.37,40.5289,0,100),
((@GUID+0)*10,15,1708.89,-4407.32,40.1085,0,100),
((@GUID+1)*10,1,1685.87,-4437.94,36.0057,0,100),
((@GUID+1)*10,2,1681.13,-4434.01,35.3238,0,100),
((@GUID+1)*10,3,1673.04,-4431.93,34.8667,0,100),
((@GUID+1)*10,4,1665.67,-4435.66,34.8775,0,100),
((@GUID+1)*10,5,1661.73,-4441.26,34.9755,0,100),
((@GUID+1)*10,6,1661.59,-4447.54,35.0587,0,100),
((@GUID+1)*10,7,1661.73,-4441.26,34.9755,0,100),
((@GUID+1)*10,8,1665.67,-4435.66,34.8775,0,100),
((@GUID+1)*10,9,1673.04,-4431.93,34.8667,0,100),
((@GUID+1)*10,10,1681.13,-4434.01,35.3238,0,100),
((@GUID+1)*10,11,1685.87,-4437.94,36.0057,0,100),
((@GUID+2)*10,1,1651.35,-4448.69,38.0034,0,100),
((@GUID+2)*10,2,1651.75,-4437.17,38.0053,0,100),
((@GUID+2)*10,3,1648.66,-4432.08,37.8909,0,100),
((@GUID+2)*10,4,1633.78,-4428.19,38.146,0,100),
((@GUID+2)*10,5,1628.51,-4430.07,38.1318,0,100),
((@GUID+2)*10,6,1620.25,-4441.33,37.8515,0,100),
((@GUID+2)*10,7,1620.04,-4447.66,37.9152,0,100),
((@GUID+2)*10,8,1628.39,-4458.96,38.0537,0,100),
((@GUID+2)*10,9,1620.04,-4447.66,37.9152,0,100),
((@GUID+2)*10,10,1620.25,-4441.33,37.8515,0,100),
((@GUID+2)*10,11,1628.51,-4430.07,38.1318,0,100),
((@GUID+2)*10,12,1633.78,-4428.19,38.146,0,100),
((@GUID+2)*10,13,1648.66,-4432.08,37.8909,0,100),
((@GUID+2)*10,14,1651.75,-4437.17,38.0053,0,100),
((@GUID+2)*10,15,1651.35,-4448.69,38.0034,0,100);