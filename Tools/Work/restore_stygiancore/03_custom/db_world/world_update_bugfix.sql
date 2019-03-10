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
-- ## ########################################################################################################################################
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- #### AZEROTHCORE FIXES ####
-- Fixes to bad commits or issues from the AzerothCore repo
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- ## ########################################################################################################################################

-- --------------------------------------------------------------------------------------
-- 2019-02-27
-- creature_addon entries point to non-existant creature
-- --------------------------------------------------------------------------------------
DELETE FROM `creature_addon` WHERE `guid` IN (3109792,3109793,3109794,3109795,3109787);

DELETE FROM `creature` WHERE `guid` = 2023271;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`)
VALUES
(2023271,32751,571,0,0,1,1,28212,0,5808.4,583.112,652.386,5.0091,300,0,0,10635,0,0,0,0,0,'',0);


-- ## ########################################################################################################################################
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- #### STYGIANCORE FIXES ####
-- Core/DB fixes unique to the StygianCore Repack
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- ## ########################################################################################################################################

-- --------------------------------------------------------------------------------------
-- 2019-02-21
-- Added quest item Riding Training Pamphlet to the mail players get when they reach level 20.
-- A different entry/item for each race.
-- Thanks to: Tomatosz
-- --------------------------------------------------------------------------------------
DELETE FROM mail_loot_template WHERE Entry IN (224, 225, 226, 227, 228, 229, 230, 231, 232, 233);
INSERT INTO mail_loot_template 
(`entry`, `item`, `Chance`, `lootmode`, `groupid`, `MinCount`, `maxcount`) 
VALUES
(224, 46875, 100, 1, 0, 1, 1),
(225, 46876, 100, 1, 0, 1, 1),
(226, 46877, 100, 1, 0, 1, 1),
(227, 46879, 100, 1, 0, 1, 1),
(228, 46878, 100, 1, 0, 1, 1),
(229, 46884, 100, 1, 0, 1, 1),
(230, 46883, 100, 1, 0, 1, 1),
(231, 46880, 100, 1, 0, 1, 1),
(232, 46882, 100, 1, 0, 1, 1),
(233, 46881, 100, 1, 0, 1, 1);

-- --------------------------------------------------------------------------------------
-- 2019-02-05 - NPC: Strange Winged Goblin (Fix Invalid Waypoint)
-- WaypointMovementGenerator::LoadPath: creature Strange Winged Goblin (Entry: 22239 GUID: 244500) doesn't have waypoint path id: 0
-- This occurs only during Love is in the Air. The goblin is a Peddlefeet located in the Exodar.
-- This NPC was deemed unworthy and removed by Blizzard in patch 2009-12-18 Patch 3.3.0
-- --------------------------------------------------------------------------------------
DELETE FROM `stygian_world`.`creature_template` WHERE `entry` = 22239;
DELETE FROM `stygian_world`.`creature` WHERE `guid` = 244500;


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
UPDATE `stygian_world`.`fishing_loot_template` SET `entry`='1637', `item`='34486', `Chance`='0.09', `lootmode`='1', `groupid`='0', `MinCount`='1', `maxcount`='1' WHERE (`entry`='1637') AND (`item`='34486');
UPDATE `stygian_world`.`fishing_loot_template` SET `entry`='1537', `item`='34484', `Chance`='0.11', `lootmode`='1', `groupid`='0', `MinCount`='1', `maxcount`='1' WHERE (`entry`='1537') AND (`item`='34484');


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
UPDATE `stygian_world`.`creature_loot_template` SET `entry`='19622', `item`='32458', `Chance`='100', `lootmode`='1', `groupid`='0', `MinCount`='4', `maxcount`='4' WHERE (`entry`='19622') AND (`item`='32458');

-- UPDATE `stygian_world`.`creature_loot_template` SET `entry`='19622', `item`='32458', `Chance`='100', `lootmode`='1', `groupid`='0', `MinCount`='1', `maxcount`='1' WHERE (`entry`='19622') AND (`item`='32458');


-- --------------------------------------------------------------------------------------
-- Disgusting OozLing - (Drop chance now 10% from 1.9%)
-- --------------------------------------------------------------------------------------
UPDATE `stygian_world`.`item_loot_template` SET `entry`='20768', `item`='20769', `Chance`='18', `lootmode`='1', `groupid`='0', `MinCount`='1', `maxcount`='1' WHERE (`entry`='20768') AND (`item`='20769');

-- UPDATE `stygian_world`.`item_loot_template` SET `entry`='20768', `item`='20769', `Chance`='1.9', `lootmode`='1', `groupid`='0', `MinCount`='1', `maxcount`='1' WHERE (`entry`='20768') AND (`item`='20769');

-- --------------------------------------------------------------------------------------
-- Ragnaros drops Direbrew's Remote ITEM:37863 (Drop chance 33%)
-- --------------------------------------------------------------------------------------
DELETE FROM `stygian_world`.`creature_loot_template` WHERE `entry`='11502' and `item`='37863';
INSERT INTO `stygian_world`.`creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `MinCount`, `maxcount`) VALUES ('11502', '37863', '33', '1', '0', '1', '1');

-- --------------------------------------------------------------------------------------
-- Item: Nerain's Scrying Goggles
-- Updated in 3.0.2 to 100% drop rate on Molten Giant
-- This makes it drop from any MOB
-- --------------------------------------------------------------------------------------
DELETE FROM `creature_loot_template` WHERE `item`=20951;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Chance`,`Lootmode`,`Groupid`,`MinCount`,`MaxCount`) VALUES
(11658,20951, 100,1,0,1,1), -- Molten Giant
(11659,20951, 100,1,0,1,1); -- Molten Destroyer
/*
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
(12264,20951,-100,1,0,1,1), -- Shazzrah
(11502,20951,-100,1,0,1,1); -- Ragnaros
*/