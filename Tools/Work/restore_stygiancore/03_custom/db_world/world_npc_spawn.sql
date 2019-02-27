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
-- WORLD: WORLD NPC SPAWN
-- 
-- Places custom NPCs at specific locations in the world. 
--
-- ################################################################################### --
*/

USE stygian_world;

-- --------------------------------------------------------------------------------------
--	INITIALIZE
-- --------------------------------------------------------------------------------------
SET
@GUID := 1993500;
DELETE FROM `creature` WHERE `guid` >= @GUID AND `guid` <= GUID+157;

-- --------------------------------------------------------------------------------------
-- NPC SPAWN INDEX
-- --------------------------------------------------------------------------------------
--
-- WILDERNESS
-- DALARAN
-- HINTERLANDS
-- UNDERCITY
-- SILVERMOON
-- SUNROCK RETREAT
-- WINTERSPRING
-- THUNDER BLUFF
-- RATCHET
-- BOOTY BAY
-- STARTING ZONES
-- SILITHUS CAMP
-- GM ISLAND
-- DUNGEONS/RAIDS
-- PORTAL MASTERS
--
-- --------------------------------------------------------------------------------------

-- ################################################################################### --
--	WILDERNESS
-- ################################################################################### --

-- {

-- Koiter's Ghost - The Barrens
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+1, '601049', '1', '1', '1', '0', '1', '47.1423', '-2713.23', '91.6672', '4.76103', '300', '0', '0', '6141', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- John the Fisherman (Nat Pagle's Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+2, '601005', '1', '1', '1', '0', '1', '-4134.68', '-4046.79', '2.69624', '3.21008', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Bengal Tiger Handler (Stranglethorn Cave)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+10, '601036', '0', '1', '1', '0', '0', '-12832.8', '-1376.24', '113.165', '3.74355', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Trollop (Hmmm.. Ahh!)
-- --------------------------------------------------------------------------------------
-- Crypt
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+26, '601017', '1', '1', '1', '0', '0', '4563.85', '-3930.89', '942.178', '4.14652', '300', '0', '0', '5342', '0', '0', '0', '0', '0');
-- Hyjal
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+143, '601017', '0', '1', '1', '0', '0', '-11223.2', '-1406.62', '-15.3612', '4.70242', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Tools - (Ashenvale TalonDeep Path Cave Entrance)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+13, '601009', '1', '1', '1', '0', '0', '1936.73', '-743.61', '114.073', '1.68764', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Black Rats (Barbarian King's Crypt)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+3, '2110', '0', '1', '1', '0', '0', '-6554.18', '-3485.95', '292.678', '4.68442', '300', '6', '0', '1', '0', '1', '0', '0', '0');
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+4, '2110', '0', '1', '1', '0', '0', '-6541.85', '-3489.82', '292.867', '6.27878', '300', '6', '0', '1', '0', '1', '0', '0', '0');
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+5, '2110', '0', '1', '1', '0', '0', '-6567.08', '-3489.61', '292.867', '2.68951', '300', '6', '0', '1', '0', '1', '0', '0', '0');
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+6, '2110', '0', '1', '1', '0', '0', '-6554.48', '-3494.7', '292.867', '4.73547', '300', '6', '0', '1', '0', '1', '0', '0', '0');
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+7, '2110', '0', '1', '1', '0', '0', '-6554.6', '-3475.9', '295.694', '4.74726', '300', '6', '0', '1', '0', '1', '0', '0', '0');
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+8, '2110', '0', '1', '1', '0', '0', '-6554.31', '-3467.46', '299.08', '0.00344742', '300', '6', '0', '1', '0', '1', '0', '0', '0');
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+9, '2110', '0', '1', '1', '0', '0', '-6562.23', '-3467.49', '302.042', '0.00344742', '300', '6', '0', '1', '0', '1', '0', '0', '0');

-- }

-- ################################################################################### --
--	DALARAN
-- ################################################################################### --

-- {

-- Hellscream's Chosen Guild Members
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES 
(@GUID+148, '601059', '571', '1', '1', '0', '1', '5914.61', '632.007', '645.651', '4.89152', '300', '0', '0', '5342', '0', '0', '0', '0', '0'),
(@GUID+149, '601062', '571', '1', '1', '0', '1', '5912.03', '631.569', '645.789', '5.33527', '300', '0', '0', '5342', '0', '0', '0', '0', '0'),
(@GUID+150, '601055', '571', '1', '1', '0', '1', '5910.89', '625.229', '646.865', '0.402967', '300', '0', '0', '5342', '0', '0', '0', '0', '0'),
(@GUID+151, '601061', '571', '1', '1', '15244', '1', '5920.1', '627.974', '645.728', '3.29325', '300', '0', '0', '5342', '0', '0', '0', '0', '0'),
(@GUID+152, '601057', '571', '1', '1', '0', '1', '5918.63', '629.96', '645.64', '3.90979', '300', '0', '0', '5342', '0', '0', '0', '0', '0'),
(@GUID+153, '601058', '571', '1', '1', '0', '1', '5916.4', '631.898', '645.586', '4.38103', '300', '0', '0', '5342', '0', '0', '0', '0', '0'),
(@GUID+154, '601060', '571', '1', '1', '31840', '1', '5909.38', '627.466', '646.368', '6.24242', '300', '0', '0', '5342', '0', '0', '0', '0', '0'),
(@GUID+155, '601056', '571', '1', '1', '0', '1', '5917.83', '623.077', '646.28', '1.85991', '300', '0', '0', '5342', '0', '0', '0', '0', '0'),
(@GUID+156, '601053', '571', '1', '1', '0', '1', '5915.28', '622.709', '646.389', '1.45151', '300', '0', '0', '5342', '0', '0', '0', '0', '0'),
(@GUID+157, '601054', '571', '1', '1', '0', '1', '5912.25', '623.091', '646.707', '1.12949', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- }


-- ################################################################################### --
--	HINTERLANDS
-- ################################################################################### --

-- {

-- Mr. Grubbs
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+122, '601050', '0', '1', '1', '0', '0', '620.007', '-3417.75', '105.754', '4.8514', '300', '0', '0', '42', '0', '0', '0', '0', '0');

-- Moofoku - Shoreline Waterfall
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID, '601047', '0', '1', '1', '0', '0', '621.625', '-3418.64', '105.942', '3.46392', '300', '0', '0', '6141', '0', '0', '0', '0', '0');

-- Seradane
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+120, '601028', '0', '1', '1', '0', '0', '664.312', '-4091.05', '100.713', '0.1141', '300', '0', '0', '5343', '0', '0', '0', '0', '0');

-- }


-- ################################################################################### --
--	UNDERCITY
-- ################################################################################### --

-- {

-- --------------------------------------------------------------------------------------
-- Enchanter (Undercity)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+27, 601015, 0, 1, 1, 0, 1, 1688.05, 45.6258, -62.2919, 6.16394, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Locksmith (Undercity)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+28, 601022, 0, 1, 1, 0, 1, 1534, 329.138, -62.1633, 2.37831, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- }

-- ################################################################################### --
--	SILVERMOON
-- ################################################################################### --

-- {

-- --------------------------------------------------------------------------------------
-- Specialty Gifts (Silvermoon)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+30, 601024, 530, 1, 1, 0, 1, 9542.79, -7448.55, 15.4654, 6.09409, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Clothing (Silvermoon)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+32, 601010, 530, 1, 1, 0, 0, 9638.45, -7384.21, 15.7281, 4.75106, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Currency + MAGA (Silvermoon)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+141, '601052', '530', '1', '1', '0', '0', '9509.95', '-7098.41', '16.3828', '5.53352', '300', '0', '0', '42', '0', '0', '0', '0', '0');
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+142, '601051', '530', '1', '1', '0', '0', '9511.28', '-7097.95', '16.3859', '5.52468', '300', '0', '0', '6141', '0', '0', '0', '0', '0');

-- }

-- ################################################################################### --
--	SUNROCK RETREAT
-- ################################################################################### --

-- {

-- --------------------------------------------------------------------------------------
-- Beastmaster (Sunrock Retreat)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+33, 601026, 1, 1, 1, 0, 1, 950.892, 899.442, 107.14, 3.81309, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Pet Vendor Exotic (Sunrock Retreat)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+11, 601000, 1, 1, 1, 0, 1, 928.782, 970.332, 103.215, 5.25035, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Fireworks (Sunrock Retreat)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+15, 601012, 1, 1, 1, 0, 1, 870.865, 932.492, 115.501, 1.00529, 300, 0, 0, 2399, 0, 0, 0, 0, 0);

-- }

-- ################################################################################### --
--	WINTERSPRING
-- ################################################################################### --

-- {

-- --------------------------------------------------------------------------------------
-- Holiday (WinterSpring)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+12, '601008', '1', '1', '1', '0', '0', '6857.82', '-4676.65', '701.147', '1.5397', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Engineer Contraptions (Everlook)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+29, 601023, 1, 1, 1, 0, 0, 6692.52, -4660.54, 721.695, 5.06463, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Bags (Everlook)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+14, 601011, 1, 1, 1, 0, 0, 6778.46, -4673.04, 723.84, 2.51994, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- }

-- ################################################################################### --
--	THUNDER BLUFF
-- ################################################################################### --

-- {

-- --------------------------------------------------------------------------------------
-- Tabards (Thunder Bluff)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+16, 601025, 1, 1, 1, 0, 0, -1288.81, 129.386, 131.546, 5.26199, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Jukebox NPC (Thunder Bluff)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+17, 601027, 1, 1, 1, 0, 0, -1196.29, 142.095, 142.931, 0.655656, 300, 0, 0, 4163, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Elixers/Flasks (Thunder Bluff)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+18, 601029, 1, 1, 1, 0, 1, -1222.69, 149.248, 133.246, 4.53159, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Pet Vendor (Thunder Bluff)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+19, 601001, 1, 1, 1, 0, 0, -1104.24, 31.6478, 140.599, 3.52235, 300, 0, 0, 4572, 2705, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Cook (Thunder Bluff)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+20, 601002, 1, 1, 1, 0, 1, -1221.31, -20.9276, 165.672, 0.259021, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Potions (Thunder Bluff)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+21, 601004, 1, 1, 1, 0, 1, -1225.41, 149.28, 133.218, 4.9125, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Enchanter (Thunder Bluff)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+22, 601015, 1, 1, 1, 0, 1, -1220.8, 73.2407, 130.162, 4.03285, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Buffer (Thunder Bluff)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+23, 601016, 1, 1, 1, 0, 1, -1206.83, 58.0772, 131.178, 2.9215, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Gambler (Thunder Bluff)
-- --------------------------------------------------------------------------------------
DELETE FROM `creature` WHERE `guid`=@GUID+24;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+24, 601020, 1, 1, 1, 0, 0, -1013, 195.904, 136.64, 2.48562, 300, 0, 0, 4163, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Codebox (Thunder Bluff)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+25, 601021, 1, 1, 1, 0, 0, -1208.77, -87.7774, 161.45, 1.53137, 300, 0, 0, 4163, 0, 0, 0, 0, 0);

-- }

-- ################################################################################### --
--  RATCHET
-- ################################################################################### --

-- {

-- Specialty Gifts
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+34, '601024', '1', '1', '1', '0', '1', '-1004.97', '-3702.77', '4.56055', '5.332', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Exotic Pets
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+35, '601000', '1', '1', '1', '0', '1', '-911.296', '-3743.6', '9.65829', '3.88687', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Pets
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+36, '601001', '1', '1', '1', '0', '1', '-909.45', '-3747.25', '9.7803', '3.42348', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- }

-- ################################################################################### --
--  BOOTY BAY
-- ################################################################################### --

-- {

-- Books
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+37, 601007, 0, 1, 1, 0, 0, -14456.7, 446.481, 4.04955, 0.744934, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- Gems
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+38, '601045', '0', '1', '1', '0', '0', '-14399.3', '407.889', '27.7873', '1.18457', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Glyphs
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+39, '601046', '0', '1', '1', '0', '0', '-14447.7', '453.173', '4.04195', '3.68814', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Fisherman
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+40, '601005', '0', '1', '1', '0', '1', '-14430.8', '455.345', '3.69096', '1.06099', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Fireworks
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+41, '601012', '0', '1', '1', '0', '1', '-14431.2', '413.895', '15.2834', '3.74312', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Tools
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+42, '601009', '0', '1', '1', '0', '0', '-14381.3', '375.396', '28.5105', '0.811505', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Bags
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+43, '601011', '0', '1', '1', '0', '0', '-14466.9', '407.893', '25.0617', '2.07416', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Potions
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+44, '601004', '0', '1', '1', '0', '1', '-14493.8', '428.583', '34.5824', '6.18691', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Elixer/Flash
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+45, '601029', '0', '1', '1', '0', '1', '-14487.1', '423.513', '34.5871', '0.98365', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Food
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+46, '601002', '0', '1', '1', '0', '1', '-14430.5', '423.593', '4.16017', '2.11092', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Locksmith
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+47, '601022', '0', '1', '1', '0', '1', '-14450.7', '447.056', '15.6355', '1.29018', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Gambler
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+48, '601020', '0', '1', '1', '0', '0', '-14457.8', '500.532', '15.1142', '3.9204', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Artifacts
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+49, '601006', '0', '1', '1', '0', '1', '-14445.4', '503.154', '21.7678', '4.21636', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Clothing
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+50, '601010', '0', '1', '1', '0', '0', '-14436.2', '381.668', '32.3115', '1.51851', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Tabards
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+51, '601025', '0', '1', '1', '0', '0', '-14432.9', '388.867', '32.326', '2.6652', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Codebox
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+52, '601021', '0', '1', '1', '0', '0', '-14397.3', '427.485', '7.90583', '5.3552', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Enchanter
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+53, '601015', '0', '1', '1', '0', '1', '-14375.4', '400.745', '6.62739', '1.80913', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- Global Trainer
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+54, '70105', '0', '1', '1', '0', '1', '-14352.3', '409.032', '6.63629', '1.95051', '300', '0', '0', '4274', '3994', '0', '0', '0', '0');

-- Buffer
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+55, '601016', '0', '1', '1', '0', '1', '-14289.3', '531.267', '8.93445', '2.70057', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- }

-- ################################################################################### --
--	STARTING ZONES
-- ################################################################################### --

-- {
-- --------------------------------------------------------------------------------------
-- Heirloom Vendor
-- --------------------------------------------------------------------------------------
SET @BOA := 601044;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES 
(@GUID+56,@BOA,0,1,1,0,0,-9022.275391,-76.134964,88.489632,5.9219,100,0,0,4274,3994,0,0,0,0), -- Human (Northshire Valley)
(@GUID+57,@BOA,0,1,1,0,0,-6170.66,350.627,400.116,1.93837,100,0,0,4274,3994,0,0,0,0), -- Dwarf and Gnome (Coldridge Valley)
(@GUID+58,@BOA,1,1,1,0,0,10411.7,781.667,1322.71,5.26217,100,0,0,4274,3994,0,0,0,0), -- NightElf (Shadowglen)
(@GUID+59,@BOA,530,1,1,0,0,-4112.79,-13749,73.5646,4.35504,100,0,0,4274,3994,0,0,0,0), -- Draenei (Crash Site)
(@GUID+60,@BOA,1,1,1,0,0,-597.151,-4210.22,38.4318,4.08879,100,0,0,4274,3994,0,0,0,0), -- Orc and Troll (Valley of Trial)
(@GUID+61,@BOA,0,1,1,0,0,1883.85,1614.12,93.4042,4.55138,100,0,0,4274,3994,0,0,0,0), -- Undead (Deathknell)
(@GUID+62,@BOA,1,1,1,0,0,-2899.01,-231.723,53.8403,4.66684,100,0,0,4274,3994,0,0,0,0), -- Tauren (Camp Narache)
(@GUID+63,@BOA,530,1,1,0,0,10359.4,-6408.47,38.5311,1.88496,100,0,0,4274,3994,0,0,0,0), -- BloodElf (The Sunspire)
(@GUID+64,@BOA,609,1,1,0,0,2435.74,-5610.41,420.092,3.71887,100,0,0,4274,3994,0,0,0,0), -- DeathKnight (The Heart of Acherus) #1
(@GUID+65,@BOA,0,1,1,0,0,2435.74,-5610.41,420.092,3.71887,100,0,0,4274,3994,0,0,0,0); -- DeathKnight (The Heart of Acherus) #2

-- }

-- ################################################################################### --
--	SILITHUS CAMP
-- ################################################################################### --

-- {

-- --------------------------------------------------------------------------------------
-- Artifacts (Silithis Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+31, 601006, 1, 1, 1, 0, 1, -10710.8, 2489.71, 7.92193, 4.76729, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Global Trainer (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+66, '70105', '1', '1', '1', '0', '1', '-10727.8', '2488.44', '7.30801', '4.0446', '300', '0', '0', '4274', '3994', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Lou the Cabin Boy (Silithus Camp - Tauren in Canoe)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+67, '27923', '1', '1', '1', '0', '0', '-10806.6', '2380.73', '0.214895', '1.65698', '300', '0', '0', '8982', '0', '2', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Wolfie the Dog (Silithus Camp - Random Movement)
-- --------------------------------------------------------------------------------------
SET
@Entry			:= 601043,
@SpawnDist   	:= 0,
@MovementType 	:= 0;
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+68, @Entry, '1', '1', '1', '0', '0', '-10721.8', '2410.1', '7.60599', '2.16358', '300', '0', '0', '42', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Speedy (Turtle, Silithus Camp - Random Movement)
-- --------------------------------------------------------------------------------------
SET
@Entry			:= 601063,
@SpawnDist   	:= 20,
@MovementType 	:= 1;
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+146, @Entry, '1', '1', '1', '0', '0',  -10740.6, 2430.06, 6.73322, 6.2533, '300', @SpawnDist,'0', '0', '0', @MovementType, '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Shelly (Turtle, Silithus Camp - By Sea)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+147, '601064', '1', '1', '1', '0', '0', '-10670.8', '2523', '0.330614', '1.92402', '300', '0', '0', '71', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Spirit (Horse, Silithus Camp - Random Movement)
-- --------------------------------------------------------------------------------------
SET
@Entry			:= 601042,
@SpawnDist   	:= 20,
@MovementType 	:= 1;
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+69, @Entry, '1', '1', '1', '0', '0',  -10740.6, 2430.06, 6.73322, 6.2533, '300', @SpawnDist,'0', '0', '0', @MovementType, '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- MerryLegs (Horse, Silithus Camp - Random Movement)
-- --------------------------------------------------------------------------------------
SET
@Entry			:= 601041,
@SpawnDist   	:= 20,
@MovementType 	:= 1;
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+70, @Entry, '1', '1', '1', '0', '0',  -10740.6, 2430.06, 6.73322, 6.2533, '300', @SpawnDist,'0', '0', '0', @MovementType, '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Hidalgo (Horse, Silithus Camp - Random Movement)
-- --------------------------------------------------------------------------------------
SET
@Entry			:= 601040,
@SpawnDist   	:= 20,
@MovementType 	:= 1;
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+71, @Entry, '1', '1', '1', '0', '0', -10740.6, 2430.06, 6.73322, 6.2533, '300', @SpawnDist,'0', '0', '0', @MovementType, '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Caravan Horse (Silithus Camp)
-- --------------------------------------------------------------------------------------
SET
@Entry			:= 601039,
@SpawnDist   	:= 0,
@MovementType 	:= 0;
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+72, @Entry, '1', '1', '1', '0', '0', '-10714.3', '2420.37', '7.60684', '4.60612', '300', @SpawnDist,'0', '0', '0', @MovementType, '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Black Beauty (Horse, Silithus Camp - Random Movement)
-- --------------------------------------------------------------------------------------
SET
@Entry			:= 601038,
@SpawnDist   	:= 20,
@MovementType 	:= 1;
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+73, @Entry, 1, 1, 1, 0, 0, -10740.6, 2430.06, 6.73322, 6.2533, 300, @SpawnDist,'0', 0, 0, @MovementType, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Beastmaster (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+74, 601026, 1, 1, 1, 0, 1, -10724.7, 2443.98, 7.60624, 4.33535, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Buffer (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+75, 601016, 1, 1, 1, 0, 1, -10704.4, 2484.29, 7.92193, 3.42427, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Enchanter (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+76, 601015, 1, 1, 1, 0, 1, -10713.3, 2475.62, 7.92193, 1.08771, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Fisherman (Silithus Camp - Waypoint Animated)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+77, 601005, 1, 1, 1, 0, 1, -10749.5, 2517.59, 1.57246, 1.84172, 300, 0, 0, 5342, 0, 2, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Cowlie the Milker (Silithus Camp - Random Movement)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+78, 601030, 1, 1, 1, 0, 0, -10740.6, 2430.06, 6.73322, 6.2533, 300, 25, 0, 42, 0, 1, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Cutie Pig (Silithus Camp  - Random Movement)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+79, 601031, 1, 1, 1, 0, 0, -10740.6, 2430.06, 6.73322, 6.2533, 300, 25, 0, 42, 0, 1, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Transmogrifier (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+80, 601013, 1, 1, 1, 0, 0, -10717.2, 2486.49, 7.92193, 5.72547, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Banker (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+81, '601034', '1', '1', '1', '0', '1', '-10716', '2468.83', '7.6044', '3.81682', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Currency (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+82, '601051', '1', '1', '1', '0', '0', '-10706.1', '2476.37', '7.92189', '2.26568', '300', '0', '0', '6141', '0', '0', '0', '0', '0');
-- Eagle (#MAGA)
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+140, '601052', '1', '1', '1', '0', '0', '-10705', '2477.45', '9.38379', '2.35598', '300', '0', '0', '42', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Cloth Goods (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+83, 601518, 1, 1, 1, 0, 1, -10709.1, 2413.96, 7.60836, 4.24502, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Metal/Stone Goods (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+84, 601560, 1, 1, 1, 0, 1, -10711.5, 2409.03, 7.60599, 1.24087, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Elemental Goods (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+85, 601528, 1, 1, 1, 0, 1, -10708.1, 2410.3, 7.60954, 2.62319, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Legendary Item Vendor (Silithus Cave)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+86, 601028, 1, 1, 1, 0, 0, -10666.5, 2086.56, -47.4262, 0.321985, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Mounts (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+87, 601033, 1, 1, 1, 0, 1, -10800, 2180.89, 2.02087, 2.63022, 300, 0, 0, 5342, 0, 0, 0, 134255104, 0);

-- --------------------------------------------------------------------------------------
-- Exotic Mounts (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+88, 601032, 1, 1, 1, 0, 1, -10796.9, 2195.95, 2.16213, 3.27425, 300, 0, 0, 5342, 0, 0, 0, 134255104, 0);

-- --------------------------------------------------------------------------------------
-- Spirit Healer  (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+119, '6491', '1', '1', '1', '0', '0', '-10715.8', '2350.14', '8.88242', '3.14925', '300', '0', '0', '4121', '0', '0', '0', '0', '0'); 

-- }

-- ################################################################################### --
--	GM ISLAND
-- ################################################################################### --

-- {

-- --------------------------------------------------------------------------------------
-- Global Vendor Glyphs (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+144, '601045', '1', '1', '1', '0', '0', '16240.5', '16292', '22.9317', '1.48513', '300', '0', '0', '5342', '0', '0', '0', '0', '0');
-- --------------------------------------------------------------------------------------
-- Global Vendor Gems (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+145, '601046', '1', '1', '1', '0', '0', '16241.7', '16306.8', '20.9005', '2.45117', '300', '0', '0', '5342', '0', '0', '0', '0', '0');

-- --------------------------------------------------------------------------------------
-- Global Trainer (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+90, '70105', '1', '1', '1', '0', '0', '16254.7', '16304.6', '20.8447', '3.03001', '300', '0', '0', '4274', '3994', '0', '0', '134217728', '0');

-- --------------------------------------------------------------------------------------
-- All Mounts Vendor (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+91, 601014, 1, 1, 1, 0, 0, 16228.8, 16259.4, 13.4481, 3.11482, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Beastmaster (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+92, 601026, 1, 1, 1, 0, 1, 16207.8, 16236.9, 7.48562, 5.98155, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Buffer (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+93, 601016, 1, 1, 1, 0, 0, 16217.2, 16262.5, 13.5767, 6.22107, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Codebox (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+94, 601021, 1, 1, 1, 0, 0, 16228.4, 16262.8, 13.3786, 3.29546, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Enchanter (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+95, 601015, 1, 1, 1, 0, 1, 16217, 16259.7, 13.5628, 6.22107, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
--	GM Island Decorator (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@GUID+96, 601035, 1, 1, 1, 0, 0, 16253.8, 16234.9, 33.5163, 2.3098, 300, 0, 0, 53420, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Transmogrifier (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+97, 601013, 1, 1, 1, 0, 0, 16228.7, 16255.8, 13.3435, 3.11482, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Mounts (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+98, 601033, 1, 1, 1, 0, 1, 16216.3, 16225.2, 4.94466, 2.66716, 300, 0, 0, 5342, 0, 0, 0, 134255104, 0);

-- --------------------------------------------------------------------------------------
-- Exotic Mounts (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+99, 601032, 1, 1, 1, 0, 1, 16219.2, 16230.7, 7.52852, 2.66716, 300, 0, 0, 5342, 0, 0, 0, 134255104, 0);

-- --------------------------------------------------------------------------------------
-- Rare Pets (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+100, 601000, 1, 1, 1, 0, 1, 16211.2, 16242.9, 10.7703, 5.6713, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Pets (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+101, 601001, 1, 1, 1, 0, 1, 16222.3, 16235.7, 9.54736, 2.62788, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Food (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+102, 601002, 1, 1, 1, 0, 1, 16224.2, 16238.8, 10.5448, 2.69856, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Armor (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+103, 601003, 1, 1, 1, 0, 1, 16225.7, 16241.9, 11.4356, 2.70249, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Potions (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+104, 601004, 1, 1, 1, 0, 1, 16226.7, 16244.9, 12.0007, 2.91062, 300, 0, 0, 5342, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `guid`=1980706;

-- --------------------------------------------------------------------------------------
-- Fishing (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+105, 601005, 1, 1, 1, 0, 1, 16227.3, 16247.6, 12.3907, 2.80068, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Artifacts (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+106, 601006, 1, 1, 1, 0, 1, 16228, 16250.6, 12.8686, 2.91062, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Books (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+107, 601007, 1, 1, 1, 0, 0, 16228.1, 16253.2, 13.1069, 3.15802, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Holiday (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+108, 601008, 1, 1, 1, 0, 0, 16213.7, 16245.9, 12.0913, 5.93833, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Tools (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+109, 601009, 1, 1, 1, 0, 0, 16214.8, 16248.2, 12.4535, 5.93833, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Clothing (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+110, 601010, 1, 1, 1, 0, 0, 16216.2, 16250.8, 12.7625, 5.93833, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Bags (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+111, 601011, 1, 1, 1, 0, 0, 16217.1, 16253.4, 13.042, 5.93833, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Fireworks (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+112, 601012, 1, 1, 1, 0, 1, 16217.2, 16256.1, 13.3398, 0.138163, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Locksmith (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+113, 601022, 1, 1, 1, 0, 1, 16227.6, 16265.9, 13.2387, 3.13053, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Engineer (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+114, 601023, 1, 1, 1, 0, 0, 16227, 16269.1, 13.1011, 3.13053, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Specialty (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+115, 601024, 1, 1, 1, 0, 1, 16216.9, 16266.1, 13.3949, 0.149947, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Tabards (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+116, 601025, 1, 1, 1, 0, 0, 16217.1, 16269.5, 13.1584, 6.08756, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Legendary (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+117, 601028, 1, 1, 1, 0, 0, 16209.6, 16240.2, 9.14474, 5.67523, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- --------------------------------------------------------------------------------------
-- Elixer/Flasks (GM Island)
-- --------------------------------------------------------------------------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (@GUID+118, 601029, 1, 1, 1, 0, 1, 16221.4, 16233.2, 8.7621, 2.66323, 300, 0, 0, 5342, 0, 0, 0, 0, 0);

-- }

-- ################################################################################### --
--	DUNGEONS, RAIDS
-- ################################################################################### --

-- {

-- NO DATA

-- }

-- ################################################################################### --
--	PORTAL MASTER
-- ################################################################################### --

-- {

INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana) VALUES
(@GUID+123, '601019', 1, 1, 1, 0, 16207.2, 16212.8, 1.01735, 1.73647, 25, 0, 13700, 6540),		-- GM Island
(@GUID+124, '601019', 0, 1, 1, 0, -13180.5, 342.503, 43.1936, 4.32977, 25, 0, 13700, 6540), 
(@GUID+125, '601019', 530, 1, 1, 0, -3862.69, -11645.8, -137.629, 2.38273, 25, 0, 13700, 6540), 
(@GUID+126, '601019', 0, 1, 1, 0, -4898.37, -965.118, 501.447, 2.25986, 25, 0, 13700, 6540), 
(@GUID+127, '601019', 0, 1, 1, 0, -8845.09, 624.828, 94.2999, 0.44062, 25, 0, 13700, 6540), 
(@GUID+128, '601019', 1, 1, 1, 0, 1599.25, -4375.85, 10.0872, 5.23641, 25, 0, 13700, 6540), 
(@GUID+129, '601019', 1, 1, 1, 0, -1277.65, 72.9751, 128.742, 5.95567, 25, 0, 13700, 6540), 
(@GUID+130, '601019', 0, 1, 1, 0, 1637.21, 240.132, -43.1034, 3.13147, 25, 0, 13700, 6540), 
(@GUID+131, '601019', 530, 1, 1, 0, 9741.67, -7454.19, 13.5572, 3.14231, 25, 0, 13700, 6540), 
(@GUID+132, '601019', 571, 1, 1, 0, 5807.06, 506.244, 657.576, 5.54461, 25, 0, 13700, 6540), 
(@GUID+133, '601019', 1, 1, 1, 0, 9866.83, 2494.66, 1315.88, 5.9462, 25, 0, 13700, 6540), 
(@GUID+134, '601019', 0, 1, 1, 0, -14279.8, 555.014, 8.90011, 3.97606, 25, 0, 13700, 6540),
(@GUID+135, '601019', 1, 1, 1, 0, -10750.6, 2470.34, 5.34563, 5.86648, 25, 0, 13700, 6540), 	-- Silithus Camp
(@GUID+136, '601019', 1, 1, 1, 0, 6766.89, -4638.56, 722.002, 0.649926, 25, 0, 13700, 6540), 	-- Winterspring
(@GUID+137, '601019', 1, 1, 1, 0, 1009.35, 1031.26, 104.883, 1.52364, 25, 0, 13700, 6540), 		-- Sunrock Retreat
(@GUID+138, '601019', 451, 1, 1, 0, 16349.1, -16164.1, 39.9247, 4.99547, 25, 0, 13700, 6540), 	-- Designer Isle
(@GUID+139, '601019', 451, 1, 1, 0, 16189.9, 16139.3, 71.3156, 5.48912, 25, 0, 13700, 6540); 	-- Programmer Isle

-- }
