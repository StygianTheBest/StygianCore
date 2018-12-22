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
--	RAID CREATURE: Lady Vash - Nerf paralyze effect from tainted core.
-- --------------------------------------------------------------------------------------
UPDATE item_template
SET spellid_3 = 0, spelltrigger_3= 0
WHERE entry = 31088;

