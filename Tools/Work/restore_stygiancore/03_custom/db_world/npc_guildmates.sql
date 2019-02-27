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
--  Hellscream's Chosen Guild of Stonemaul NPCs
-- 
--  This is a collection of old guildmates from Classic->WOTLK. I decided to put them
--  into the game for nostalgia!
--
-- 	Bras
-- 	Gatog
-- 	Girlys
-- 	Jadenelle
-- 	Katojune
-- 	Mobbius
-- 	Pamooya
-- 	Ragathar
-- 	Retdream
-- 	Shootameat
-- 	Zagmund
-- 	Spaget @ Dead End Friends
--
-- ################################################################################### --
*/

USE stygian_world;

-- --------------------------------------------------------------------------------------
--	FEMALE BLOOD ELF PALADIN - 601053
-- --------------------------------------------------------------------------------------

-- {

SET
@Entry 		:= 601053,
@Model 		:= 28017,
@Name 		:= "Retdream",
@Title 		:= "Guildmaster/Main Tank",
@Icon 		:= "Speak",
@GossipMenu := 60153,
@MinLevel 	:= 80,
@MaxLevel 	:= 80,
@Faction 	:= 35,
@NPCFlag 	:= 1,
@Scale		:= 1.0,
@Rank		:= 0,
@Type 		:= 7,
@TypeFlags 	:= 0,
@FlagsExtra := 2,
@AIName		:= "SmartAI",
@Script 	:= "";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 51010, 47260, 0, 18019); -- Black/Purple Staff, None

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Greetings.. $N.$B$BHellscream\'s Chosen was founded by all of the fine players you see standing here. We signed our guild charter at Grom Hellscream\'s Monument in Ashenvale on April 17th, 2010. $B$BThese are but visions of our former selves from days long past - mere memories of what used to be. Please, enjoy your stay here in Dalaran and don\'t mind our chatter.$B$BMay we meet again, in a different realm, and reminisce of days long past… battles hard fought… and dreams redeemed $N.$B$BMay the Warsong Never Fade!');

-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'LFM TANK+HEALS 10M TOC - MUST KNOW FIGHTS! - PST FOR QUICK INVITE', '14', '0', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '0', 'LFM TANK+HEALS 10M TOC - PST FOR QUICK INVITE', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '45000', '90000', '120000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');

-- } 


-- --------------------------------------------------------------------------------------
--	FEMALE TAUREN SHAMAN - 601054
-- --------------------------------------------------------------------------------------

-- {

SET
@Entry 		:= 601054,
@Model 		:= 23801,
@Name 		:= "Pamooya",
@Title 		:= "Raid Healer",
@GossipMenu := 60154;

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 47905, 45682, 0, 18019);

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hi there $N. I\'m Pamooya.$B$BThey consider me the mom of the guild. I take care of everyone with buffs, fish feasts, and my friendly demeanor. I\'m also one of the best raid healers you\'ll come across. Just ask all the PUGs I\'ve saved from certain doom!$B$BMay the Warsong Never Fade!');

-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'If you misbehave, I will have to unleash the wolves.', '12', '0', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '0', 'If you misbehave, I will have to unleash the wolves.', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '45000', '90000', '120000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');

-- }

-- --------------------------------------------------------------------------------------
--	FEMALE BLOOD ELF PALADIN - 601055
-- --------------------------------------------------------------------------------------

-- {

SET
@Entry 		:= 601055,
@Model 		:= 30438,
@Name 		:= "Girlys",
@Title 		:= "Tank Healer",
@GossipMenu := 60155;

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 50734, 0, 0, 18019);

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hi there $N. I\'m Girlys.$B$BIn adishun to being a great GUY, I\'m one of the most relyuble and skilled tank healers on Stonemaul. I may have some ishews spelling sumtimes, but I still get my point across. Oh yea, I learned evrything about healing from Pam.$B$BMay the Warsong Never Fade!');

-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'I lerned evrything about how to heel because of Pam!', '12', '0', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '0', 'I lerned evrything about how to heel because of Pam!', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '45000', '90000', '120000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');

-- }


-- --------------------------------------------------------------------------------------
--	MALE ORC WARRIOR - 601056
-- --------------------------------------------------------------------------------------

-- {

SET
@Entry 		:= 601056,
@Model 		:= 29900,
@Name 		:= "Ragathar",
@Title 		:= "Off-Tank/DPS",
@GossipMenu := 60156;

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 50760, 28611, 0, 18019);

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hi there $N. I\'m brother Ragathar!$B$BI\'m the guy with the most guild spirit, and I\'ll DPS your face off! No raid is complete without my good cheer, enthusiasm, and emotes!$B$BRAGATHAR SMASH!$B$BMay the Warsong Never Fade!');

-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'FOR HELLSCREAM! FOR THE WARSONG!', '14', '0', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '0', 'FOR HELLSCREAM! FOR THE WARSONG!', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '45000', '90000', '120000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');

-- }


-- --------------------------------------------------------------------------------------
--	MALE UNDEAD WARLOCK - 601057
-- --------------------------------------------------------------------------------------

-- {

SET
@Entry 		:= 601057,
@Model 		:= 3682,
@Name 		:= "Mobbius",
@Title 		:= "Guild Officer/Ranged DPS",
@GossipMenu := 60157;

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 50966, 0, 0, 18019);

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hi there $N. I\'m Mobbius.$B$BI hail from Canada and serve as the main guild officer. If you have a question about the guild just let me know eh?$B$BMay the Warsong Never Fade!');


-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'LOK\'TAR OGAR BROTHERS! WE RIDE FOR THE HORDE!', '14', '0', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '0', 'LOK\'TAR OGAR BROTHERS! WE RIDE FOR THE HORDE!', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '45000', '90000', '120000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');


-- }


-- --------------------------------------------------------------------------------------
--	MALE UNDEAD WARRIOR - 601058
-- --------------------------------------------------------------------------------------

-- {

SET
@Entry 		:= 601058,
@Model 		:= 29093,
@Name 		:= "Zagmund",
@Title 		:= "Off-Tank",
@GossipMenu := 60158;

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 28437, 40400, 0, 18019);

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hi there $N. I\'m Zagmund.$B$BI am the resident Loremaster and classic WoW guru. I usually coordinate all of our classic content runs. Got any questions about the old world or rare items?$B$BMay the Warsong Never Fade!');

-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'Why yes, I do have Cuergo\'s Gold with Worm.', '12', '0', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '0', 'Why yes, I do have Cuergo\'s Gold with Worm.', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '45000', '90000', '120000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');

-- }


-- --------------------------------------------------------------------------------------
--	FEMALE UNDEAD MAGE - 601059
-- --------------------------------------------------------------------------------------

-- {

SET
@Entry 		:= 601059,
@Model 		:= 22250,
@Name 		:= "Jadenelle",
@Title 		:= "Ranged DPS",
@GossipMenu := 60159;

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 50731, 0, 0, 18019); -- Black/Purple Staff, None

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hi there $N. I\'m Jadenelle.$B$BI\'m usually begging for loot and getting myself in the middle of a little drama in an outside of the guild. Aside from that, I\'m pretty tolerable and always have plenty of Sulfuron Slammers to go \'round.$B$BMay the Warsong Never Fade!');

-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'Do you have any loot for little old me? lol', '12', '0', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '0', 'Do you have any loot for little old me? lol', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '45000', '90000', '120000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');

-- }

-- --------------------------------------------------------------------------------------
--	MALE TROLL HUNTER - 601060
-- --------------------------------------------------------------------------------------

-- {

SET
@Entry 		:= 601060,
@Model 		:= 31839,
@Name 		:= "Gatog",
@Title 		:= "Ranged DPS",
@GossipMenu := 60160;

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 19019, 0, 0, 18019);

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hi there $N. I\'m Gatog.$B$BI love classic runs and collecting old world gear.$B$BDid someone say Thunderfury Blessed Blade of the Windseeker?$B$BMay the Warsong Never Fade!');

-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'Did someone say Thunderfury Blessed Blade of the Windseeker?', '12', '0', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '0', 'Did someone say Thunderfury Blessed Blade of the Windseeker?', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '45000', '90000', '120000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');

-- }
-- --------------------------------------------------------------------------------------
--	MALE ORC SHAMAN - 601061
-- --------------------------------------------------------------------------------------

-- {

SET
@Entry 		:= 601061,
@Model 		:= 15243,
@Name 		:= "Katojune",
@Title 		:= "DPS",
@GossipMenu := 60161;

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 51868, 51868, 0, 18019);

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hi there $N. I\'m Katojune.$B$BI\'m one of the best Elemental DPS Shaman you\'ll find on Stonemaul. I also assist the guildmaster and officer in keeping order when needed. LOK\'TAR OGAR BROTHERS! WE RIDE FOR THE HORDE!$B$BMay the Warsong Never Fade!');

-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'SHAMMY TWIN POWERS ACTIVATE!', '14', '0', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '0', 'SHAMMY TWIN POWERS ACTIVATE!', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '45000', '90000', '120000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');

-- }

-- --------------------------------------------------------------------------------------
--	MALE TAUREN DEATHKNIGHT (No suitable existing NPC was found!) - 601062
-- --------------------------------------------------------------------------------------

-- {

SET
@Entry 		:= 601062,
@Model 		:= 24735,
@Name 		:= "Bras",
@Title 		:= "DPS",
@Scale		:= 0.8,
@GossipMenu := 60162;

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 41257, 0, 0, 18019);

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hi there $N. I\'m Bras.$B$BI\'ve got many alts and am a good guy to have around if you need mats of any kind. I\'m also the oldest player in the guild at over 50.$B$BMay the Warsong Never Fade!');

-- Gossip Menu
DELETE FROM `stygian_world`.`gossip_menu` WHERE `entry` = @GossipMenu;
INSERT INTO `stygian_world`.`gossip_menu` (`entry`, `text_id`) VALUES (@GossipMenu, @Entry);

-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'Hahaha! You guys are awesome. Have a stack of Sulfuron Slammers on the house.', '12', '0', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '0', 'Hahaha! You guys are awesome. Have a stack of Sulfuron Slammers on the house.', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '45000', '90000', '120000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');


-- }