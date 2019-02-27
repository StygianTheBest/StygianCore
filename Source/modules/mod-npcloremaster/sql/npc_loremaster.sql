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
-- WORLD: LOREMASTER NPC MODULE
-- 
-- 
-- This places a Loremaster NPC in the game world at various locations who recants the 
-- lore of the old world and brings back the lost memories of so many that sacrificed 
-- their lives for this ravaged land we all call home.
--
-- Many of you may know of the website "WarcraftLessTraveled.com" which was a Podcast
-- site where the host, Skolnick, discussed various areas in the game, mostly pre-Cata,
-- that were considered hidden gems. As a Vanilla player and pre-Cata Loremaster/Seeker 
-- myself, I knew of every place he discussed and quite a few he didn't. My plan is to
-- add all of these places into this module for players to explore and learn about.
--
-- As of the release of this module, I have only had time to create three of these NPCs, 
-- and hope that the community can contribute. I have written the module so adding new 
-- Loremaster NPCs is done purely in the database and will chain to one another 
-- automatically if done correctly.
--
-- ################################################################################### --
*/

USE stygian_world;

-- --------------------------------------------------------------------------------------
-- TABLE (NPC_LOREMASTER)
-- --------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `npc_loremaster`;
CREATE TABLE `npc_loremaster` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=601075 DEFAULT CHARSET=utf8 COMMENT='Loremaster NPC Module';

-- --------------------------------------------------------------------------------------
-- Initialize
-- --------------------------------------------------------------------------------------
SET
@StartEntry 		:= 601075,
@StartGUID  		:= 601075,
@StartGossipEntry 	:= 60175,
@EndEntry			:= 601081,
@EndGUID			:= 601081,
@EndGossipEntry 	:= 60181;

DELETE FROM `npc_loremaster` WHERE `id`>= @StartEntry AND `id` <= @EndEntry;
DELETE FROM `creature_template` WHERE `entry` >= @StartEntry AND `entry` <= @EndEntry;
DELETE FROM `npc_text` WHERE `ID` >= @StartEntry AND `ID` <= @EndEntry;
DELETE FROM `gossip_menu` WHERE `entry` >= @StartGossipEntry AND `entry` <= @EndGossipEntry; 
DELETE FROM `creature_equip_template` WHERE `CreatureID` >= @StartEntry AND `CreatureID` <= @EndEntry;
DELETE FROM `creature_template_addon` WHERE `entry` >= @StartEntry AND `entry` <= @EndEntry;
DELETE FROM `creature` WHERE `guid` >= @StartGUID AND `guid` <= @EndGUID;

-- --------------------------------------------------------------------------------------
-- NPC Template
-- --------------------------------------------------------------------------------------
SET
@Name 			:= "Crom",
@Title 			:= "Loremaster",
@Model 			:= 14395, -- Highlord Demitrian
@MinLevel 		:= 80,
@MaxLevel 		:= 80,
@Faction 		:= 35,
@NPCFlag 		:= 3,
@Scale			:= 1.0,
@Rank			:= 0,
@Type 			:= 7,
@TypeFlags 		:= 68,
@AIName			:= "SmartAI",
@MinDmg			:= 10000,
@MaxDmg			:= 50000,
@RegenHealth	:= 1,
@FlagsExtra 	:= 2,
@Exp			:= 2,
@Script 		:= "Loremaster_NPC",
@Icon 			:= "Speak",
-- --------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------
-- 601075 - Michel Koiter's Shrine
-- https://web.archive.org/web/20160329220904/http://www.sonsofthestorm.com:80/memorial_twincruiser.html
-- --------------------------------------------------------------------------------------

@Location := "Koiter\'s Shrine",

-- Teleport Coords (This should be where you want the player to appear)
@XPos				:= -378.273,
@YPos				:= -2181.21,
@ZPos				:= 156.325,
@Orientation		:= 3.18949,
@WorldMap			:= 1,

-- Loremaster Text
@NPCText := "Hail $N.$B$BYou are at the Shrine of the Fallen Warrior - Michel Martin Koiter (May 3, 1984 – March 18, 2004). Michel was one of Blizzard\'s premium artists, and was known under the name of \"Twincruiser\", an artistic collaboration with his twin brother René Koiter. He died at age 19 of unexpected heart failure. A flu had struck him, which in a matter of days would become progressively worse until his body could no longer cope. The cause of his death was never really understood.$B$BMichel's memorial is likely the first permanent in-game structure dedicated to a player. It is said he did a lot of work on the Northern Barrens where you now stand. His orc warrior, laying in rest on the altar behind the spirit healer, is dressed exactly how he last appeared in the World of Warcraft beta. The altar itself is inscribed with his initials \"MK\".$B$B\"it'll be all right...\"$B$BTo the family who keeps$BMichel's flame burning bright.$BThere is no greater glory$Bthat has been so worth the fight..$BBecause some things are just worth fighting for.$B$BRest in peace Koiter.. see you on the other side brother.";
-- --------------------------------------------------------------------------------------

-- Copy this from the database after placing a Loremaster NPC
INSERT INTO `creature` VALUES (@StartGUID, @StartEntry, @WorldMap, '1', '1', '0', '1', '-383.47', '-2181.44', '157.881', '0.135076', '300', '0', '0', '12600', '0', '0', '0', '0', '0');

-- Edit this to change what the NPC has equipped
INSERT INTO `creature_equip_template` VALUES (@StartEntry, '1', '45861', '1906', '0', '18019'); -- Diamond Tipped Cane, Torch

-- No changes needed
INSERT INTO `npc_loremaster` VALUES (@GUID, @XPos, @YPos, @ZPos, @Orientation, @WorldMap, @Location);
INSERT INTO `creature_template` (entry, name, subname, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, dmgschool, BaseAttackTime, RangeAttackTime, unit_class, unit_flags, unit_flags2, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, type, type_flags, lootid, pickpocketloot, skinloot, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, HoverHeight, Health_mod, Mana_mod, Armor_mod, mindmg, maxdmg, RacialLeader, RegenHealth, mechanic_immune_mask, flags_extra, exp, modelid1, modelid2, modelid3, modelid4, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, ScriptName, gossip_menu_id) VALUES (@StartEntry, @Name, @Title, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1.1, 1.17, @Scale, @Rank, 0, 500, 500, 1, 0, 0, 1, 0, 0, 0, 0, 0, @Type, @TypeFlags, 0, 0, 0, 0, 0, 0, 0, @AIName, 0, 3, 1, 1, 1, 1, @MinDmg, @MaxDmg, 0, @RegenHealth, 0, @FlagsExtra, @Exp, @Model, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @Script, @StartGossipEntry);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@StartEntry, @NPCText);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (@StartGossipEntry, @StartEntry);
INSERT INTO `creature_template_addon` VALUES (@StartEntry, '0', '0', '0', '0', '0', '');

/*
-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @StartEntry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@StartEntry, '0', '0', 'Rest in peace Koiter.. see you on the other side brother.', '12', '7', '100', '0', '0', '0', @StartEntry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @StartEntry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@StartEntry, '7', 'Rest in peace Koiter.. see you on the other side brother.', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts (Speak)
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` =@StartEntry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@StartEntry, '0', '0', '0', '1', '0', '100', '0', '60000', '120000', '180000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');
*/

-- --------------------------------------------------------------------------------------
-- 601076 - Dead King's Crypt
-- http://conan.wikia.com/wiki/The_Thing_in_the_Crypt
-- --------------------------------------------------------------------------------------
SET 
@Location 		:= "Dead King\'s Crypt",
@Entry 			:= 601076,
@GUID  			:= 601076,
@GossipEntry	:= 60176,

-- Teleport Coords (This should be where you want the player to appear)
@XPos			:= -6581.37,
@YPos			:= -3485.41,
@ZPos			:= 318.13,
@Orientation	:= 0.474687,
@WorldMap		:= 0,

-- Loremaster Text
@NPCText := "Do you seek the Riddle of Steel $N?$B$BThis crypt pays homage to the movie \"Conan the Barbarian.\" Having two days ago escaped the Hyperborean slave pens, Conan is chased by wolves, much like those found roaming the Badlands, as he runs across the plains. Making his way atop a hill of boulders, with the wolves almost upon him, he notices a small crack in the rocks - a cave entrance.$B$BAs the wolves continue to prowl outside the cave refusing to enter, Conan enters the cave and makes his way to the inner chamber where he comes upon a decaying treasure room. At the far end, seated on a large throne, is a crowned skeleton staring at him with cold dead eyes. Beneath one hand lies an ancient and impressive looking sword.$B$BEnter the chamber $N, and be careful not to disturb the dead.";
-- --------------------------------------------------------------------------------------

-- Loremaster NPC Spawn Coords - Copy this from the database after placing a Loremaster NPC
INSERT INTO `creature` VALUES (@GUID, @Entry, @WorldMap, '1', '1', '0', '1', '-6571.03', '-3465.89', '304.625', '5.50124', '300', '0', '0', '12600', '0', '0', '0', '0', '0');

-- Edit this to change what the NPC has equipped
INSERT INTO `creature_equip_template` VALUES (@Entry, '1', '45861', '1906', '0', '18019'); -- Diamond Tipped Cane, Torch

-- No changes needed
INSERT INTO `npc_loremaster` VALUES (@GUID, @XPos, @YPos, @ZPos, @Orientation, @WorldMap, @Location);
INSERT INTO `creature_template` (entry, name, subname, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, dmgschool, BaseAttackTime, RangeAttackTime, unit_class, unit_flags, unit_flags2, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, type, type_flags, lootid, pickpocketloot, skinloot, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, HoverHeight, Health_mod, Mana_mod, Armor_mod, mindmg, maxdmg, RacialLeader, RegenHealth, mechanic_immune_mask, flags_extra, exp, modelid1, modelid2, modelid3, modelid4, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, ScriptName, gossip_menu_id) VALUES (@Entry, @Name, @Title, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1.1, 1.17, @Scale, @Rank, 0, 500, 500, 1, 0, 0, 1, 0, 0, 0, 0, 0, @Type, @TypeFlags, 0, 0, 0, 0, 0, 0, 0, @AIName, 0, 3, 1, 1, 1, 1, @MinDmg, @MaxDmg, 0, @RegenHealth, 0, @FlagsExtra, @Exp, @Model, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @Script, @GossipEntry);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, @NPCText);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (@GossipEntry, @Entry);
INSERT INTO `creature_template_addon` VALUES (@Entry, '0', '0', '0', '0', '0', '');

/*
-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'Do you seek to learn the Riddle of Steel?', '12', '7', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '7', 'Do you seek to learn the Riddle of Steel?', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts (Speak)
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '60000', '120000', '180000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');
*/

-- --------------------------------------------------------------------------------------
-- 601075 - Shatterspear Vale
-- https://wow.gamepedia.com/Shatterspear_Vale
-- --------------------------------------------------------------------------------------
SET 
@Location 		:= "Shatterspear Vale",
@Entry 			:= 601077,
@GUID  			:= 601077,
@GossipEntry 	:= 60177,

-- DB Teleport Coords (This should be where you want the player to appear)
@XPos			:= 7441.76,
@YPos			:= -1689.23,
@ZPos			:= 194.669,
@Orientation	:= 5.73489,
@WorldMap		:= 1,

-- Loremaster Text
@NPCText := "Welcome $N..$B$BThe path that lies before you leads to Shatterspear Vale, home of the Shatterspear Tribe. This unreachable area was included by the designers as eye-candy while on the flight path through Ashenvale. Prior to the Cataclysm, it could only reached by inventive use of spells, scrolls, or safe-falling through a void from the mountaintops of Winterspring. After the Cataclysm, the dancers were replaced with warriors and the entire atmosphere of this secret location was changed forever.$B$BExplore the area and learn all you can $N. And if you come across my very old friend Voriya, give her my regards.";
-- --------------------------------------------------------------------------------------

-- Loremaster NPC Spawn Coords - Copy this from the database after placing a Loremaster NPC
INSERT INTO `creature` VALUES (@GUID, @Entry, @WorldMap, '1', '1', '0', '1', '7452.25', '-1694.05', '195.624', '3.19806', '300', '0', '0', '12600', '0', '0', '0', '0', '0');

-- Edit this to change what the NPC has equipped
INSERT INTO `creature_equip_template` VALUES (@Entry, '1', '45861', '1906', '0', '18019'); -- Diamond Tipped Cane, Torch

-- No changes needed
INSERT INTO `npc_loremaster` VALUES (@GUID, @XPos, @YPos, @ZPos, @Orientation, @WorldMap, @Location);
INSERT INTO `creature_template` (entry, name, subname, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, dmgschool, BaseAttackTime, RangeAttackTime, unit_class, unit_flags, unit_flags2, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, type, type_flags, lootid, pickpocketloot, skinloot, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, HoverHeight, Health_mod, Mana_mod, Armor_mod, mindmg, maxdmg, RacialLeader, RegenHealth, mechanic_immune_mask, flags_extra, exp, modelid1, modelid2, modelid3, modelid4, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, ScriptName, gossip_menu_id) VALUES (@Entry, @Name, @Title, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1.1, 1.17, @Scale, @Rank, 0, 500, 500, 1, 0, 0, 1, 0, 0, 0, 0, 0, @Type, @TypeFlags, 0, 0, 0, 0, 0, 0, 0, @AIName, 0, 3, 1, 1, 1, 1, @MinDmg, @MaxDmg, 0, @RegenHealth, 0, @FlagsExtra, @Exp, @Model, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @Script, @GossipEntry);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, @NPCText);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (@GossipEntry, @Entry);
INSERT INTO `creature_template_addon` VALUES (@Entry, '0', '0', '0', '0', '0', '');

/*
-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'These trolls sure know how to dance! I must join them soon.', '12', '7', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '7', 'These trolls sure know how to dance! I must join them soon.', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts (Speak)
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '60000', '120000', '180000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');
*/

-- --------------------------------------------------------------------------------------
-- 601078 - Silithus Camp
-- https://wow.gamepedia.com/Silithus_coast_tauren_settlement
-- --------------------------------------------------------------------------------------
SET
@Location 		:= "Silithus Camp",
@Entry 			:= 601078,
@GUID  			:= 601078,
@GossipEntry 	:= 60178,

-- DB Teleport Coords (This should be where you want the player to appear)
@XPos			:= -10799.1,
@YPos			:= 2433.85,
@ZPos			:= 2.83535,
@Orientation	:= 0.387789,
@WorldMap		:= 1,

-- Loremaster Text
@NPCText := "Greetings $N..$B$BThis abandoned Tauren camp was destroyed during the Cataclysm. Only the small cave network to the east remains. The caves remained empty except for a sleeping red dragon named Andrestrasz — added much later — and several piles of bones of various sizes. Although some bones could possibly be from Tauren, the area is free of any signs of conflict.$B$BThe camp was reachable by swimming west from Land's End Beach and past Silithus or south from the western corner of Feralas. At normal speed, without buffs, the journey here took ten minutes or more.$B$BThe area was probably meant as a stronghold for the Horde, Cenarion Enclave, or Grimtotem tribe. Due to its hard to reach position — by swimming or water walking, thus making use of the aquatic form — it might have had also something to do with druid training. There were no NPCs or interactive objects, either alive or as a ghost, in this village... until now!";
-- --------------------------------------------------------------------------------------

-- Loremaster NPC Spawn Coords - Copy this from the database after placing a Loremaster NPC
INSERT INTO `creature` VALUES (@GUID, @Entry, @WorldMap, '1', '1', '0', '1', '-10797.7', '2437.68', '3.34298', '0.412124', '300', '0', '0', '12600', '0', '0', '0', '0', '0');

-- Edit this to change what the NPC has equipped
INSERT INTO `creature_equip_template` VALUES (@Entry, '1', '45861', '1906', '0', '18019'); -- Diamond Tipped Cane, Torch

-- No changes needed
INSERT INTO `npc_loremaster` VALUES (@GUID, @XPos, @YPos, @ZPos, @Orientation, @WorldMap, @Location);
INSERT INTO `creature_template` (entry, name, subname, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, dmgschool, BaseAttackTime, RangeAttackTime, unit_class, unit_flags, unit_flags2, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, type, type_flags, lootid, pickpocketloot, skinloot, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, HoverHeight, Health_mod, Mana_mod, Armor_mod, mindmg, maxdmg, RacialLeader, RegenHealth, mechanic_immune_mask, flags_extra, exp, modelid1, modelid2, modelid3, modelid4, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, ScriptName, gossip_menu_id) VALUES (@Entry, @Name, @Title, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1.1, 1.17, @Scale, @Rank, 0, 500, 500, 1, 0, 0, 1, 0, 0, 0, 0, 0, @Type, @TypeFlags, 0, 0, 0, 0, 0, 0, 0, @AIName, 0, 3, 1, 1, 1, 1, @MinDmg, @MaxDmg, 0, @RegenHealth, 0, @FlagsExtra, @Exp, @Model, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @Script, @GossipEntry);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, @NPCText);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (@GossipEntry, @Entry);
INSERT INTO `creature_template_addon` VALUES (@Entry, '0', '0', '0', '0', '0', '');

/*
-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Entry;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Entry, '0', '0', 'It\'s good to see this camp so alive. Have you by chance met the ghost that haunts the caves to the east?', '12', '7', '100', '0', '0', '0', @Entry, '0', 'Speak');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Entry;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Entry, '7', 'It\'s good to see this camp so alive. Have you by chance met the ghost that haunts the caves to the east?', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts (Speak)
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Entry;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Entry, '0', '0', '0', '1', '0', '100', '0', '60000', '120000', '180000', '600000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');
*/

-- --------------------------------------------------------------------------------------
-- 601079 - The Emerald Dream
-- https://wow.gamepedia.com/Emerald_Dream
-- --------------------------------------------------------------------------------------
SET
@Location 		:= "The Emerald Dream",
@Entry 			:= 601079,
@GUID  			:= 601079,
@GossipEntry 	:= 60179,

-- DB Teleport Coords (This should be where you want the player to appear)
@XPos			:= 2771.35,
@YPos			:= 3009.59,
@ZPos			:= 23.3131,
@Orientation	:= 3.58999,
@WorldMap		:= 169,

-- Loremaster Text
@NPCText := "Good to see you again $N..$B$BThe Emerald Dream is a vast and ever-shifting dimension of spirits and nature magic that defies mortal perceptions of reality. Time and distance hold no meaning in this intangible realm, and a day on the physical world and feel like decades in the Dream. The Dream is under the protection of the green Dragon Aspect, Ysera.$B$BAfter the titans had shaped Azeroth, they sent Ysera into an eternal trance and charged her with watching over all of Azeroth from the Dream. As a result, green dragons guard every portal into the Dream, and they always see both the landscape of Azeroth and the corresponding dreamscape. This enchanted vision, known as dreamsight, allows green dragons to perceive their surroundings with perfect clarity despite the dragons' closed eyes.$B$BUnlike Azeroth, the Emerald Dream is a realm that is primarily spiritual instead of physical. All who enter the Dream can affect it to a minor extent, but only temporarily: the underlying structure of the Dream inevitably reasserts itself. Even Ysera cannot change the Dream permanently, nor, indeed, would she wish to do so. She does not control the Dream; on the contrary, it is closer to the truth to say that the Dream controls her. Using the Dream as her unfaltering guide, she regulates the ebb and flow of nature and the evolutionary path of the world itself.";
-- --------------------------------------------------------------------------------------
			
-- Loremaster NPC Spawn Coords - Copy this from the database after placing a Loremaster NPC
INSERT INTO `creature` VALUES (@GUID, @Entry, @WorldMap, '1', '1', '0', '1', '2580.66', '2906.98', '24.472', '0.892148', '300', '0', '0', '12600', '0', '0', '0', '0', '0');

-- Edit this to change what the NPC has equipped
INSERT INTO `creature_equip_template` VALUES (@Entry, '1', '45861', '1906', '0', '18019'); -- Diamond Tipped Cane, Torch

-- No changes needed
INSERT INTO `npc_loremaster` VALUES (@GUID, @XPos, @YPos, @ZPos, @Orientation, @WorldMap, @Location);
INSERT INTO `creature_template` (entry, name, subname, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, dmgschool, BaseAttackTime, RangeAttackTime, unit_class, unit_flags, unit_flags2, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, type, type_flags, lootid, pickpocketloot, skinloot, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, HoverHeight, Health_mod, Mana_mod, Armor_mod, mindmg, maxdmg, RacialLeader, RegenHealth, mechanic_immune_mask, flags_extra, exp, modelid1, modelid2, modelid3, modelid4, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, ScriptName, gossip_menu_id) VALUES (@Entry, @Name, @Title, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1.1, 1.17, @Scale, @Rank, 0, 500, 500, 1, 0, 0, 1, 0, 0, 0, 0, 0, @Type, @TypeFlags, 0, 0, 0, 0, 0, 0, 0, @AIName, 0, 3, 1, 1, 1, 1, @MinDmg, @MaxDmg, 0, @RegenHealth, 0, @FlagsExtra, @Exp, @Model, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @Script, @GossipEntry);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, @NPCText);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (@GossipEntry, @Entry);
INSERT INTO `creature_template_addon` VALUES (@Entry, '0', '0', '0', '0', '0', '');


-- --------------------------------------------------------------------------------------
-- 601080 - Forgotten Crypt
-- https://wow.gamepedia.com/Forgotten_Crypt
-- --------------------------------------------------------------------------------------
SET
@Location 		:= "The Forgotten Crypt",
@Entry 			:= 601080,
@GUID  			:= 601080,
@GossipEntry 	:= 60180,

-- DB Teleport Coords (This should be where you want the player to appear)
@XPos			:= -11068.6,
@YPos			:= -1808.88,
@ZPos			:= 52.7882,
@Orientation	:= 2.32419,
@WorldMap		:= 0,

-- Loremaster Text
@NPCText := "Join me for a minute $N..$B$BThis Forgotten Crypt lies behind the tower of Karazhan, in the cemetery at Morgan's Plot. According to John Staats, author of the WoW Diary, it was one of the few areas he designed that wasn't used by Blizzard. I've reached out to him and will update this if he responds with more information. This crypt was only accessible by glitching through the metal gate either by dying and ressurecting on the other side or later using a Warlocks portal.$B$BInside the crypt there are several interesting locations: Well of the Forgotten, The Upside Down Sinners, Tomb of the Unrepentant, and the Pit of Criminals with a LARGE pile of bones. Claw marks abound around the well and in other areas. Another interesting detail is that the crypt runs under the Tranquil Gardens Cemetery in Duskwood.$B$BThis area was finally put to use as the location for last step of the epic quest chain 'Lucid Nightmare' in Legion.$B$B\"The way is now open. To the greatest secret never told. A fitting end to your journey.\"";
-- --------------------------------------------------------------------------------------

-- Loremaster NPC Spawn Coords - Copy this from the database after placing a Loremaster NPC
INSERT INTO `creature` VALUES (@GUID, @Entry, @WorldMap, '1', '1', '0', '1', '-11102.3', '-1797.4', '52.5843', '6.25904', '300', '0', '0', '12600', '0', '0', '0', '0', '0');

-- Edit this to change what the NPC has equipped
INSERT INTO `creature_equip_template` VALUES (@Entry, '1', '45861', '1906', '0', '18019'); -- Diamond Tipped Cane, Torch

-- No changes needed
INSERT INTO `npc_loremaster` VALUES (@GUID, @XPos, @YPos, @ZPos, @Orientation, @WorldMap, @Location);
INSERT INTO `creature_template` (entry, name, subname, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, dmgschool, BaseAttackTime, RangeAttackTime, unit_class, unit_flags, unit_flags2, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, type, type_flags, lootid, pickpocketloot, skinloot, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, HoverHeight, Health_mod, Mana_mod, Armor_mod, mindmg, maxdmg, RacialLeader, RegenHealth, mechanic_immune_mask, flags_extra, exp, modelid1, modelid2, modelid3, modelid4, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, ScriptName, gossip_menu_id) VALUES (@Entry, @Name, @Title, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1.1, 1.17, @Scale, @Rank, 0, 500, 500, 1, 0, 0, 1, 0, 0, 0, 0, 0, @Type, @TypeFlags, 0, 0, 0, 0, 0, 0, 0, @AIName, 0, 3, 1, 1, 1, 1, @MinDmg, @MaxDmg, 0, @RegenHealth, 0, @FlagsExtra, @Exp, @Model, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @Script, @GossipEntry);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, @NPCText);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (@GossipEntry, @Entry);
INSERT INTO `creature_template_addon` VALUES (@Entry, '0', '0', '0', '0', '0', '');


-- --------------------------------------------------------------------------------------
-- 601080 - Challe's Home for Little Tykes
-- https://wow.gamepedia.com/Challe%27s_Home_For_Little_Tykes
-- --------------------------------------------------------------------------------------
SET
@Location 		:= "Challe's Home for Little Tykes",
@Entry 			:= 601081,
@GUID  			:= 601081,
@GossipEntry 	:= 60181,

-- DB Teleport Coords (This should be where you want the player to appear)
@XPos			:= -531.232,
@YPos			:= 7401.32,
@ZPos			:= 186.393,
@Orientation	:= 0.939364,
@WorldMap		:= 530,

-- Loremaster Text
@NPCText := "Tread lightly $N..$B$BJust over there lies Challe's Home For Little Tykes, a haven for children of both factions. Challe herself stands next to the hut watching over the babies inside. Two tykes, Sa'rah (a blood elf girl) and Chaddo (a human boy) run around the place, while a third named Jara (an orc boy) hides in a corner of the sandbox. Inside the hut, however, is the first known night elf baby seen the in the game, as well as the first known troll and tauren babies.$B$BThere's a dog house just outside the fence with either food or the remains of the dog inside, as the meat is swarmed by flies and there is no dog to be found.$B$BIt was once speculated, and later revealed in Warlords of Draenor, that Challe is not a troll at all, but some kind of shapeshifter who kills others to stay young. While she takes the form of an orc on Draenor, whether it is her true race or not is unclear. The fact is, Challe is devouring the poor children that she steals away and brings here or that somehow end up in these mountains.$B$BBehind her hut are three cages of varying sizes and types. In one is the remains of a small humanoid with \"Little Tyke\" sized bones.";
-- --------------------------------------------------------------------------------------

-- Loremaster NPC Spawn Coords - Copy this from the database after placing a Loremaster NPC
INSERT INTO `creature` VALUES (@GUID, @Entry, @WorldMap, '1', '1', '0', '1', '-506.222', '7424.26', '174.948', '4.63585', '300', '0', '0', '12600', '0', '0', '0', '0', '0');

-- Edit this to change what the NPC has equipped
INSERT INTO `creature_equip_template` VALUES (@Entry, '1', '45861', '1906', '0', '18019'); -- Diamond Tipped Cane, Torch

-- No changes needed
INSERT INTO `npc_loremaster` VALUES (@GUID, @XPos, @YPos, @ZPos, @Orientation, @WorldMap, @Location);
INSERT INTO `creature_template` (entry, name, subname, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, dmgschool, BaseAttackTime, RangeAttackTime, unit_class, unit_flags, unit_flags2, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, type, type_flags, lootid, pickpocketloot, skinloot, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, HoverHeight, Health_mod, Mana_mod, Armor_mod, mindmg, maxdmg, RacialLeader, RegenHealth, mechanic_immune_mask, flags_extra, exp, modelid1, modelid2, modelid3, modelid4, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, ScriptName, gossip_menu_id) VALUES (@Entry, @Name, @Title, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1.1, 1.17, @Scale, @Rank, 0, 500, 500, 1, 0, 0, 1, 0, 0, 0, 0, 0, @Type, @TypeFlags, 0, 0, 0, 0, 0, 0, 0, @AIName, 0, 3, 1, 1, 1, 1, @MinDmg, @MaxDmg, 0, @RegenHealth, 0, @FlagsExtra, @Exp, @Model, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @Script, @GossipEntry);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, @NPCText);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (@GossipEntry, @Entry);
INSERT INTO `creature_template_addon` VALUES (@Entry, '0', '0', '0', '0', '0', '');