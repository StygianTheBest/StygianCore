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
-- TrinityCore - https://www.trinitycore.org/
-- LevanSturua - https://github.com/LevanSturua/common-core-db-bugs
--
-- ################################################################################### --
*/

USE stygian_world;

-- --------------------------------------------------------------------------------------
-- ITEM: Update Old Crqfty/Ironjaw Drop Rate)
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
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 27047;
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 29641;
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 28693;
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 28995;
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 29636;
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 29506;
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = 32711;

DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = 77372;
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = 77373;

-- Creature Text
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('27047', '0', '0', 'You sense an invisible stalker next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77372', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('29641', '0', '0', 'You sense Theresa Wolf next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('28693', '0', '0', 'You sense Enchanter Nalthanis ext to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('28995', '0', '0', 'You sense Paldesse next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('29636', '0', '0', 'You sense Hagatha Moorehead next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('29506', '0', '0', 'You sense Orland Schaeffer next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES ('32711', '0', '0', 'You sense Warp-Huntress Kula next to you. (CreatureText)', '12', '0', '100', '0', '0', '0', '77373', '0', 'Missing Creature Text Placeholder. (See world_update_bugfix.sql)');

-- Broadcast Text 
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES ('77372', '0', 'You sense an invisible stalker next to you. (Broadcast)', '', '274', '0', '0', '0', '0', '0', '0', '0', '0', '18019');

INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES ('77373', '0', 'Missing Broadcast Text Placeholder. (See world_update_bugfix.sql)', '', '274', '0', '0', '0', '0', '0', '0', '0', '0', '18019');


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
