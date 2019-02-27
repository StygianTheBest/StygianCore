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
-- WORLD: NPC TROLLOP
-- 
-- Everybody needs someone...
--
-- ################################################################################### --
*/

USE stygian_world;

-- --------------------------------------------------------------------------------------
--	TROLLOP - 601017
-- --------------------------------------------------------------------------------------
SET
@Entry 		:= 601017,
@Model 		:= 10927, -- Fel Succubus
@Name 		:= "Amouranth",
@Title 		:= "Your New Best Friend",
@Icon 		:= "Speak",
@GossipMenu := 60117,
@MinLevel	:= 80,
@MaxLevel	:= 80,
@Faction	:= 7,  -- Neutral, Attackable
@NPCFlag 	:= 81,
@Scale		:= 1.0,
@Rank		:= 2,  -- Rare Elite
@Type 		:= 3,  -- Demon
@DynamicFlags:= 1, -- Lootable
@TypeFlags 	:= 0,
@FlagsExtra	:= 0,
@LootID		:= 60117,
@AIName		:= "ReactorAI",
@Script 	:= "Trollop_NPC";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, dynamicflags, type_flags, InhabitType, RegenHealth, flags_extra, lootid, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 1, @Type, DynamicFlags, @TypeFlags, 3, 1, @FlagsExtra, @LootID, @AIName, @Script);

-- NPC Text
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hey there $N. Lookin\' for a good time?');

-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Loot
DELETE FROM `stygian_world`.`creature_loot_template` WHERE `entry` = @LootID;
INSERT INTO `stygian_world`.`creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
('60117', '29571', '100', '1', '0', '1', '1'),
('60117', '37467', '75', '1', '0', '1', '1'),
('60117', '46023', '50', '1', '0', '1', '1'),
('60117', '54291', '25', '1', '0', '1', '1');
