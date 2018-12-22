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
-- WORLD: NPC FISHERMAN
--
-- Populate the abandoned Tauren encampment on the coast of Silithus with a wandering
-- angler and vendor named John the Firsherman. He will wander up and down the shore and 
-- is sometimes known to speak.
--
-- ################################################################################### --
*/

USE stygian_world;

/*
-- --------------------------------------------------------------------------------------
--	FISHING VENDOR - 601005
-- --------------------------------------------------------------------------------------
SET
@Entry 		:= 601005,
@Model 		:= 3285, -- Fishing Trainer
@Name 		:= "John the Fisherman",
@Title 		:= "Pro Angler",
@Icon 		:= "Buy",
@GossipMenu := 0,
@MinLevel 	:= 80,
@MaxLevel 	:= 80,
@Faction 	:= 35,
@NPCFlag 	:= 128, -- Vendor
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
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 45991, 34484, 0, 18019); -- Fishing Pole, Old Ironjaw

-- NPC ITEMS
DELETE FROM npc_vendor WHERE entry = @Entry;
INSERT INTO npc_vendor (entry, item) VALUES 
-- BOOKS
(@Entry,27532),	-- Book: Master Fishing
(@Entry,16082),	-- Book: Artisan Fishing 
(@Entry,16083),	-- Book: Expert Fishing 
-- ENCHANTS
(@Entry,50816),	-- Scroll Enchant Gloves: Angler 
(@Entry,50406),	-- Formula Enchant Gloves: Angler
(@Entry,38802),	-- Enchant Gloves Fishing
-- POTIONS
(@Entry,6372), 	-- Swim Speed Potion
(@Entry,5996), 	-- Elixer of Water Breathing
(@Entry,18294), -- Elixer of Greater Water Breathing
(@Entry,8827), 	-- Elixer of Water Walking
-- SPECIAL
(@Entry,19979),	-- Hook of the Master Angler 
(@Entry,33223),	-- Fishing Chair
-- VANITY
(@Entry,1827),	-- Meat Cleaver
(@Entry,2763), 	-- Fisherman's Knife
-- CLOTHING
(@Entry,7996),	-- Worn Fishing Hat 
(@Entry,19972),	-- Lucky Fishing Hat
(@Entry,3563), 	-- Seafarer's Pantaloons
(@Entry,7052), 	-- Azure Silk Belt
(@Entry, 50287),-- Boots of the Bay
(@Entry,19969),	-- Nat Pagle's Extreme Anglin' Boots 
(@Entry,6263), 	-- Blue Overalls
(@Entry,3342), 	-- Captain Sander's Shirt
(@Entry,4509), 	-- Seawolf Gloves
(@Entry,792), 	-- Knitted Sandals
(@Entry,33820),	-- Weather Beaten Fishing Hat 
(@Entry, 7348), -- Fletcher's Gloves
(@Entry, 36019), -- Aerie Belt of Nature Protection
-- POLES
(@Entry,19970),	-- Arcanite Fishing Pole 
(@Entry,44050),	-- Mastercraft Kaluak Fishing Pole 
(@Entry,45992),	-- Jeweled Fishing Pole 
(@Entry,25978),	-- Seth's Graphite Fishing Pole 
(@Entry,19022),	-- Nat Pagle's Extreme Angler FC-5000
(@Entry,45991),	-- Bone Fishing Pole 
(@Entry,45858),	-- Nat's Lucky Fishing Pole 
(@Entry,12225),	-- Blump Family Fishing Pole
(@Entry,6367),	-- Big Iron Fishing Pole
(@Entry,6365),	-- Strong Fishing Pole
(@Entry,6366),	-- Darkwood Fishing Pole
(@Entry,6256),	-- Fishing Pole 
-- LINE
(@Entry,34836),	-- Trusilver Spun Fishing Line 
(@Entry,19971),	-- High Test Eternium Fishing Line 
-- LURES
(@Entry,34861), -- Sharpened Fishing Hook
(@Entry,46006), -- Glow Worm
(@Entry,6811), 	-- Aquadynamic Fish Lens
(@Entry,7307), 	-- Flesh Eating Worm
(@Entry,6533), 	-- Aquadynamic Fish Attractor
(@Entry,6532), 	-- Bright Baubles
(@Entry,6530), 	-- Nightcrawlers
(@Entry,6529), 	-- Shiny Bauble
-- ANGLIN'
(@Entry,34832), -- Captain Rumsey's Lager
(@Entry,18229);	-- Nat Pagle's Guide to Extreme Anglin' 

-- Fisherman at Camp Silithus
DELETE FROM `creature` WHERE `guid`=1994210; -- Camp Silithus (ANIMATED)
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (1994210, 601005, 1, 1, 1, 0, 1, -10749.5, 2517.59, 1.57246, 1.84172, 300, 0, 0, 5342, 0, 2, 0, 0, 0);
DELETE FROM `gameobject` WHERE `guid`=500467; -- FISHING CHAIR
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500467, 186475, 1, 1, 1, -10749.2, 2516.27, 2.26279, 1.81423, -0, -0, -0.787729, -0.616021, 300, 0, 1, 0);
DELETE FROM `gameobject` WHERE `guid`=500469; -- OILY BLACKMOUTH SCHOOL
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500469, 180682, 1, 1, 1, -10750.8, 2527.94, 0.00143518, 3.84841, -0, -0, -0.938199, 0.346096, 300, 0, 1, 0);

*/

-- --------------------------------------------------------------------------------------
-- CLEAN UP FISHERMAN WAYPOINTS
-- --------------------------------------------------------------------------------------
DELETE FROM `creature_addon` WHERE `guid`=1994210;
DELETE FROM `db_script_string` WHERE entry >= 2000006050 AND entry <= 2000006052;
DELETE FROM `waypoint_scripts` WHERE guid >= 938 AND guid <= 941;
DELETE FROM `creature` WHERE guid >= 1995303 AND guid <= 1995315;
DELETE FROM `waypoint_data` WHERE id = 1994210 AND point <= 13;

-- --------------------------------------------------------------------------------------
-- FISHERMAN CREATURE ADDON
-- --------------------------------------------------------------------------------------
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (1994210, 1994210, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------------------------------------
-- FISHERMAN WAYPOINT STRINGS
-- --------------------------------------------------------------------------------------
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) 
VALUES 
(2000006050, 'Ahh.. the sea. Once it casts its spell, it holds one in its net of wonder forever.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000006051, 'Many men go fishing all of their lives without knowing that it is not fish they are after.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000006052, 'I wonder if they ever found that hidden treasure buried on the Isle of Dread?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------------------------------------
-- FISHERMAN WAYPOINT SCRIPTS
-- --------------------------------------------------------------------------------------
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) 
VALUES 
(938, 0, 0, 0, 0, 2000006050, 0, 0, 0, 0, 938), -- Say
(939, 0, 0, 0, 0, 2000006051, 0, 0, 0, 0, 939), -- Say
(940, 0, 0, 0, 0, 2000006052, 0, 0, 0, 0, 940), -- Say
(941, 0, 31, 601005, 0, 0, 0, 0, 0, 0, 941);	-- Equip

-- --------------------------------------------------------------------------------------
-- FISHERMAN WAYPOINT GUID
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) 
VALUES 
(1995315, 1, 1, 1, 1, 0, 0, -10749, 2517.63, 1.60554, 1.43331, 300, 0, 0, 41, 0, 0, 0, 33554432, 0),
(1995314, 1, 1, 1, 1, 0, 0, -10700.2, 2523.61, 0.792882, 1.43331, 300, 0, 0, 41, 0, 0, 0, 33554432, 0),
(1995313, 1, 1, 1, 1, 0, 0, -10702.7, 2521.03, 2.26718, 1.43331, 300, 0, 0, 2, 0, 0, 0, 33554432, 0),
(1995312, 1, 1, 1, 1, 0, 0, -10732.6, 2518.96, 1.79036, 1.43331, 300, 0, 0, 24, 0, 0, 0, 33554432, 0),
(1995311, 1, 1, 1, 1, 0, 0, -10745.8, 2511.96, 3.60894, 1.43331, 300, 0, 0, 42, 0, 0, 0, 33554432, 0),
(1995310, 1, 1, 1, 1, 0, 0, -10760.3, 2513.04, 1.92615, 1.43331, 300, 0, 0, 5, 0, 0, 0, 33554432, 0),
(1995309, 1, 1, 1, 1, 0, 0, -10791.1, 2489.84, 1.98191, 1.43331, 300, 0, 0, 10, 0, 0, 0, 33554432, 0),
(1995308, 1, 1, 1, 1, 0, 0, -10807.8, 2461.83, 1.04805, 1.43331, 300, 0, 0, 6, 0, 0, 0, 33554432, 0),
(1995307, 1, 1, 1, 1, 0, 0, -10805.9, 2460.9, 2.03948, 1.43331, 300, 0, 0, 20, 0, 0, 0, 33554432, 0),
(1995306, 1, 1, 1, 1, 0, 0, -10791.4, 2490.54, 1.74961, 1.43331, 300, 0, 0, 15, 0, 0, 0, 33554432, 0),
(1995305, 1, 1, 1, 1, 0, 0, -10777.2, 2504.67, 0.528472, 1.43331, 300, 0, 0, 38, 0, 0, 0, 33554432, 0),
(1995304, 1, 1, 1, 1, 0, 0, -10776.3, 2503.56, 1.20431, 1.43331, 300, 0, 0, 4, 0, 0, 0, 33554432, 0),
(1995303, 1, 1, 1, 1, 0, 0, -10749.4, 2519.6, 0.203893, 1.43331, 300, 0, 0, 50, 0, 0, 0, 33554432, 0);

-- --------------------------------------------------------------------------------------
-- FISHERMAN WAYPOINT DATA
-- --------------------------------------------------------------------------------------
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) 
VALUES 

-- Start
(1994210, 1, -10749.4, 2519.6, 0.203893, 0, 30000, 0, 939, 33, 1995303),
(1994210, 2, -10776.3, 2503.56, 1.20431, 0, 0, 0, 0, 100, 1995304),
(1994210, 3, -10777.2, 2504.67, 0.528472, 0, 30000, 0, 0, 100, 1995305),

-- Headed to boats
(1994210, 4, -10791.4, 2490.54, 1.74961, 0, 0, 0, 940, 10, 1995306),
(1994210, 5, -10805.9, 2460.9, 2.03948, 0, 0, 0, 0, 100, 1995307),

-- At the boats, TODO: equip fishing pole (EVENT 941)
(1994210, 6, -10807.8, 2461.83, 1.04805, 0, 60000, 0, 941, 100, 1995308),
(1994210, 7, -10791.1, 2489.84, 1.98191, 0, 0, 0, 0, 100, 1995309),
(1994210, 8, -10760.3, 2513.04, 1.92615, 0, 0, 0, 0, 100, 1995310),
(1994210, 9, -10745.8, 2511.96, 3.60894, 0, 0, 0, 0, 100, 1995311),
(1994210, 10, -10732.6, 2518.96, 1.79036, 0, 0, 0, 0, 100, 1995312),
(1994210, 11, -10702.7, 2521.03, 2.26718, 0, 0, 0, 0, 100, 1995313),

-- Looking at sunset
(1994210, 12, -10700.2, 2523.61, 0.792882, 0, 60000, 0, 938, 33, 1995314),
(1994210, 13, -10749, 2517.63, 1.60554, 0, 0, 0, 0, 25, 1995315);
