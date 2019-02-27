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
-- WORLD: WORLD OBJECT SPAWN
-- 
-- Places custom objects at specific locations in the world. 
--
-- ################################################################################### --
*/

USE stygian_world;

-- ################################################################################### --
-- Update StygianCore table structure for easy Trinity object import
-- This allows me to design in Trinity using good tools and then port to StygianCore
-- ################################################################################### --

-- ALTER TABLE `stygian_world`.`gameobject` DROP COLUMN zoneId;
-- ALTER TABLE `stygian_world`.`gameobject` DROP COLUMN areaId;
-- ALTER TABLE `stygian_world`.`gameobject` DROP COLUMN ScriptName;

ALTER TABLE `stygian_world`.`gameobject`
ADD zoneId smallint(5) DEFAULT 0,
ADD areaId smallint(5) DEFAULT 0,
ADD ScriptName char(64);

-- ################################################################################### --
-- OBJECT SPAWN INDEX
-- ################################################################################### --
--
-- CITIES, TOWNS, WILDERNESS
-- SILITHUS CAMP
--
-- ################################################################################### --


-- ################################################################################### --
--	CITIES, TOWNS, WILDERNESS
-- ################################################################################### --

-- --------------------------------------------------------------------------------------
-- Hinterlands
-- --------------------------------------------------------------------------------------
DELETE FROM `stygian_world`.`gameobject` WHERE `guid` IN (502359, 502350, 502324, 502439, 502438, 502409);

-- Fish Rack
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`) VALUES (502409, 181252, 0, 0, 0, 1, 1, 630.95, -3420.2, 107.301, 3.33284, -0, -0, -0.995432, 0.0954775, 0, 255, 1, '', 0);

-- Stool Left
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`) VALUES (502439, 182596, 0, 0, 0, 1, 1, 618.638, -3417.09, 105.475, 5.28859, -0, -0, -0.477052, 0.878875, 300, 255, 1, '', 0);

-- Stool Right
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`) VALUES (502438, 182596, 0, 0, 0, 1, 1, 621.316, -3420.92, 105.268, 2.07631, -0, -0, -0.86147, -0.507809, 300, 255, 1, '', 0);

-- Large Backpacks
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `zoneId`, `areaId`, `ScriptName`) VALUES ('502359', '164953', '0', '1', '1', 622.623, -3414.16, 107.202, 3.27334, -0, -0, -0.997831, 0.065826, '300', '0', '1', '0', NULL, NULL, NULL);

-- Tent
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `zoneId`, `areaId`, `ScriptName`) VALUES ('502350', '188185', '0', '1', '1', 623.343, -3416.31, 106.849, 3.75042, -0, -0, -0.954023, 0.299734, '300', '0', '1', '0', NULL, NULL, NULL);

-- Campfire
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `zoneId`, `areaId`, `ScriptName`) VALUES ('502324', '190293', '0', '1', '1', '619.94', '-3419.09', '105.358', '4.08818', '-0', '-0', '-0.890072', '0.455819', '300', '0', '1', '0', NULL, NULL, NULL);

-- --------------------------------------------------------------------------------------
-- Ratchet
-- --------------------------------------------------------------------------------------
-- DELETE FROM `stygian_world`.`gameobject` WHERE `guid` IN (502221);


-- --------------------------------------------------------------------------------------
-- Bengal Tiger Cave
-- --------------------------------------------------------------------------------------
DELETE FROM `stygian_world`.`gameobject` WHERE `guid` IN (501960);

-- Campfire		
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501960', '191775', '0', '1', '1', '-12834.9', '-1377.37', '112.856', '0.540488', '-0', '-0', '-0.266967', '-0.963706', '300', '0', '1', '0');


-- --------------------------------------------------------------------------------------
-- Sunrock Retreat
-- --------------------------------------------------------------------------------------
DELETE FROM `stygian_world`.`gameobject` WHERE `guid` IN (269190, 269191, 269192);

-- Campfire
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (269190, 192719, 1, 1, 1, 929.697, 968.275, 103.289, 2.31689, -0, -0, -0.916181, -0.400765, 300, 0, 1, 0);
-- Firework Barrel (Fireworks Vendor)
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('269191', '180878', '1', '1', '1', '872.643', '931.83', '115.445', '1.52363', '-0', '-0', '-0.690238', '-0.723583', '300', '0', '1', '0'); 
-- Firework Launcher Doodad (Firworks Vendor)
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('269192', '186292', '1', '1', '1', '869.812', '933.805', '115.549', '0.235584', '-0', '-0', '-0.11752', '-0.993071', '300', '0', '1', '0'); 


-- --------------------------------------------------------------------------------------
-- Everlook
-- --------------------------------------------------------------------------------------
DELETE FROM `stygian_world`.`gameobject` WHERE `guid` IN (269193, 269194, 269195, 269196, 269197, 269198, 501443, 501437);

-- Christmas Tree
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('269193', '178667', '1', '1', '1', '6862.36', '-4677.75', '701.166', '1.86956', '-0', '-0', '-0.804469', '-0.593995', '300', '0', '1', '0'); 

-- Present
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('269194', '180799', '1', '1', '1', '6863.02', '-4675.36', '700.969', '2.20569', '-0', '-0', '-0.892495', '-0.451058', '300', '0', '1', '0');

-- Present
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('269195', '180747', '1', '1', '1', '6861.11', '-4676.52', '701.152', '4.89568', '-0', '-0', '-0.639427', '0.768852', '300', '0', '1', '0'); 

-- Jack-O-Lantern
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`,`position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('269196', '180405', '1', '1', '1', '6854.33', '-4676.81', '700.906', '3.26993', '-0', '-0', '-0.997942', '0.0641246', '300', '0', '1', '0'); 

-- Skull Candle
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('269197', '186269', '1', '1', '1', '6851.84', '-4675.13', '700.604', '0.89405', '-0', '-0', '-0.432285', '-0.901737', '300', '0', '1', '0'); 

-- Pile of Skulls
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('269198', '179915', '1', '1', '1', '6852.3', '-4676.73', '700.711', '1.34173', '-0', '-0', '-0.621665', '-0.783283', '300', '0', '1', '0');

-- Bonfire
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501443', '194979', '1', '1', '1', '6731.53', '-4643.84', '722.238', '4.1418', '-0', '-0', '-0.877533', '0.479516', '300', '0', '1', '0');

-- Bench
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501437', '194827', '1', '1', '1', '6729.03', '-4647.93', '721.605', '0.854903', '-0', '-0', '-0.414553', '-0.910025', '300', '0', '1', '0');


-- --------------------------------------------------------------------------------------
-- Alterac Mountains
-- --------------------------------------------------------------------------------------
DELETE FROM `stygian_world`.`gameobject` WHERE `guid` IN (501444, 501455);

-- Christmas Tree
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (501444, 192129, 0, 1, 1, 171.202, -275.448, 150.482, 6.23073, -0, -0, -0.0262259, 0.999656, 300, 0, 1, 0);

-- Christmas Tree
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (501455, 178558, 0, 1, 1, 179.436, -270.605, 148.081, 0.139975, -0, -0, -0.0699302, -0.997552, 300, 0, 1, 0);


-- --------------------------------------------------------------------------------------
-- Thunder Bluff
-- --------------------------------------------------------------------------------------
DELETE FROM `stygian_world`.`gameobject` WHERE `guid` IN (269199, 501857);

-- Campfire (Pet Vendor)
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (269199, 194017, 1, 1, 1, -1105.89, 33.3562, 140.598, 0.616385, -0, -0, -0.303337, -0.952883, 300, 0, 1, 0); 

-- Elise Place Christmas Tree
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501857', '178668', '1', '1', '1', '-746.052', '-1060.43', '193.402', '5.76076', '-0', '-0', '-0.258255', '0.966077', '300', '0', '1', '0');


-- ################################################################################### --
--	SILITHUS CAMP
-- ################################################################################### --
DELETE FROM `stygian_world`.`gameobject` WHERE `guid` IN (502090, 502086, 502085, 502062, 500467, 500469, 501064, 501042, 501040, 500694, 500927, 500802, 501164, 500352, 500354, 500353, 501268, 501272, 501285, 501282, 501281, 501280, 501275);

-- --------------------------------------------------------------------------------------
-- Lighthouse Crystal (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `zoneId`, `areaId`, `ScriptName`) VALUES ('502090', '177547', '1', '1', '1', '-10710.7', '2482.52', '23.7422', '1.87447', '-0', '-0', '-0.805926', '-0.592017', '300', '0', '1', '0', NULL, NULL, NULL);

-- --------------------------------------------------------------------------------------
-- Torches (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `zoneId`, `areaId`, `ScriptName`) VALUES ('502086', '187653', '1', '1', '1', '-10712.5', '2418.62', '7.60764', '2.42273', '-0', '-0', '-0.936096', '-0.351744', '300', '0', '1', '0', NULL, NULL, NULL);
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `zoneId`, `areaId`, `ScriptName`) VALUES ('502085', '187653', '1', '1', '1', '-10718.3', '2411.25', '7.60481', '2.61123', '-0', '-0', '-0.965045', '-0.262083', '300', '0', '1', '0', NULL, NULL, NULL);

-- --------------------------------------------------------------------------------------
-- Dog House (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `zoneId`, `areaId`, `ScriptName`) VALUES ('502062', '180033', '1', '1', '1', '-10720.8', '2408.9', '7.60409', '2.24994', '-0', '-0', '-0.902255', '-0.431202', '300', '0', '1', '0', NULL, NULL, NULL);

-- --------------------------------------------------------------------------------------
-- Fisherman Items (Silithus Camp)
-- --------------------------------------------------------------------------------------

-- Fishing Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500467, 186475, 1, 1, 1, -10749.2, 2516.27, 2.26279, 1.81423, -0, -0, -0.787729, -0.616021, 300, 0, 1, 0);

-- Oily Blackmouth School
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500469, 180682, 1, 1, 1, -10750.8, 2527.94, 0.00143518, 3.84841, -0, -0, -0.938199, 0.346096, 300, 0, 1, 0);

-- --------------------------------------------------------------------------------------
-- Large Bonfire (Silithus Camp - Front of Cave Near Sea)
-- --------------------------------------------------------------------------------------
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (501064, 191824, 1, 1, 1, -10792.9, 2187.16, 2.47621, 6.28232, -0, -0, -0.000415137, 1, 300, 0, 1, 0);

-- --------------------------------------------------------------------------------------
-- Ghostly Cooking Fires (Silithus Camp)
-- --------------------------------------------------------------------------------------

-- Near Haystack
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (501042, 195087, 1, 1, 1, -10726.9, 2444.32, 7.60427, 4.2097, -0, -0, -0.860752, 0.509025, 300, 0, 1, 0);

-- Near Haystack
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (501040, 195087, 1, 1, 1, -10722.7, 2442.5, 7.60622, 4.14294, -0, -0, -0.87726, 0.480015, 300, 0, 1, 0);

-- --------------------------------------------------------------------------------------
-- Forge In Tent (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500694, 192572, 1, 1, 1, -10710.3, 2411.39, 7.60782, 5.82762, -0, -0, -0.22582, 0.974169, 300, 0, 1, 0);

-- --------------------------------------------------------------------------------------
-- Anvil In Tent (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500927, 192019, 1, 1, 1, -10712.2, 2412.71, 7.60568, 5.69013, -0, -0, -0.2922, 0.956357, 300, 0, 1, 0);

-- --------------------------------------------------------------------------------------
-- Mailbox (Silithus Camp)
-- -------------------------------------------------------------------------------------
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500802, 195558, 1, 1, 1, -10725, 2471.15, 7.58998, 0.506509, -0, -0, -0.250556, -0.968102, 300, 0, 1, 0);

-- --------------------------------------------------------------------------------------
-- Horde Guild Bank - Totem - (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501164', '187295', '1', '1', '1', '-10714', '2467.41', '7.60594', '3.67938', '-0', '-0', '-0.964065', '0.265667', '300', '0', '1', '0');

-- --------------------------------------------------------------------------------------
-- Alliance Guild Bank - Mining Cart - (Silithus Camp)
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `zoneId`, `areaId`, `ScriptName`) VALUES ('502588', '132834', '1', '1', '1', '-10723', '2469.25', '7.92594', '0.114576', '-0', '-0', '-0.0572568', '-0.99836', '300', '0', '1', '0', '0', '0', NULL);

-- --------------------------------------------------------------------------------------
-- Campfire + Totems (Legendary Vendor, Silithus Cave)
-- --------------------------------------------------------------------------------------

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500352, 191341, 1, 1, 1, -10663.7, 2086.46, -47.2649, 6.16928, -0, -0, -0.0569244, 0.998379, 300, 0, 1, 0);

-- Fire Totem
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500354, 211036, 1, 1, 1, -10668, 2089.45, -47.2756, 5.26214, -0, -0, -0.488635, 0.872488, 300, 0, 1, 0);

-- Fire Totem
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500353, 211036, 1, 1, 1, -10665, 2084.24, -47.4209, 5.15611, -0, -0, -0.534181, 0.84537, 300, 0, 1, 0);

-- --------------------------------------------------------------------------------------
-- Gravestones
-- --------------------------------------------------------------------------------------
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501268', '195186', '1', '1', '1', '-10723.5', '2351.02', '7.34298', '6.18089', '-0', '-0', '-0.0511261', '0.998692', '300', '0', '1', '0'); -- Black Knight's Grave
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501272', '184742', '1', '1', '1', '-10725.7', '2351.3', '7.10057', '6.19031', '-0', '-0', '-0.0464208', '0.998922', '300', '0', '1', '0'); -- Tirion Fordrings Grave
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501285', '61', '1', '1', '1', '-10719.2', '2348.09', '8.22528', '2.90343', '-0', '-0', '-0.992918', '-0.118801', '300', '0', '1', '0'); -- Grave
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501282', '194537', '1', '1', '1', '-10718.8', '2343.64', '9.10721', '2.71886', '-0', '-0', '-0.977745', '-0.209798', '300', '0', '1', '0'); -- Grave
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501281', '194538', '1', '1', '1', '-10716.4', '2350.71', '8.65505', '2.8995', '-0', '-0', '-0.992683', '-0.120753', '300', '0', '1', '0'); -- Grave
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501280', '177239', '1', '1', '1', '-10720.3', '2354.72', '7.94209', '2.62461', '-0', '-0', '-0.966777', '-0.255622', '300', '0', '1', '0'); -- Grave
INSERT INTO `stygian_world`.`gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES ('501275', '181369', '1', '1', '1', '-10723.3', '2347.15', '7.57764', '3.01731', '-0', '-0', '-0.99807', '-0.062102', '300', '0', '1', '0'); -- Grave