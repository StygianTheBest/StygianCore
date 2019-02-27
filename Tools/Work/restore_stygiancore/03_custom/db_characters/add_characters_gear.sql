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
-- WORLD: KOITER'S ARMOR
--
-- *** This requires the StygianCore client patch named Patch-Z.mpq in the repo! ***
-- 
-- Creates the inaccessible armor pieces worn by Koiter's Orc Warrior who is laying
-- upon the Shrine of the Fallen Warrior.
--
-- I was able to locate the armor and sword on Koiter's Orc Warrior located at the Shrine 
-- of the Fallen Warrior in The Barrens. This specific armor was marked as used by NPCs,
-- and was not accessible to players. I located each item and updated the entries in the 
-- Item.dbc and ItemDisplayInfo.dbc to make them useable as item id 701005 thru 7010012. 
--
-- The correct shoulders were found, but not the one-shoulder variant that Koiter's orc 
-- is wearing, so after looking at the shrine again, my theory is they removed the left 
-- shoulder of the model because it would have stuck into the shrine wall.
--
-- ################################################################################### --
*/

USE stygian_world;

-- Clean Up
DELETE FROM `stygian_world`.`item_template` WHERE `entry` >= 701005 and `entry` <= 701012;

-- Teach Koiter Plate Mail
INSERT INTO `stygian_characters`.`character_skills` (`guid`, `skill`, `value`, `max`) VALUES ('1', '293', '1', '1');

-- Equip Koiter's Armor
UPDATE `stygian_characters`.`characters` SET `equipmentCache` = '0 0 0 0 701005 0 0 0 701006 0 701007 0 701008 0 701009 0 701010 0 701011 0 0 0 0 0 0 0 0 0 0 0 701012 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' WHERE `guid` = 1;

-- Shoulders (9697)
SET @Entry := 701005;
INSERT INTO `stygian_world`.`item_template` VALUES (@Entry, '4', '4', '-1', 'Shoulder Item', '9697', '2', '0', '0', '1', '10380', '2076', '3', '-1', '-1', '30', '25', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '149', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '2', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '60', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '', '4', '0', '0', '0', '0', '12340');
UPDATE `stygian_world`.`item_template`
SET 
 `entry` = @Entry,
 `name` = 'Koiter\'s Pauldrons',
 `displayid` = '9697',
 `Quality` = '5',
 `Flags` = '0',
 `FlagsExtra` = '1',
 `bonding` = '2', 
 `BuyPrice` = '1',
 `SellPrice` = '1',
 `InventoryType` = '3',
 `Material` = '6', 
 `AllowableClass` = '-1',
 `AllowableRace` = '-1',
 `ItemLevel` = '100',
 `RequiredLevel` = '0',
 `armor` = '1000',
 `description` = 'These pauldrons were crafted to allow one or both to be worn; the right one appears to have seen far more wear.',
 `Material` = '5',
 `MaxDurability` = '100'
WHERE
	(`entry` = @Entry);

-- Chest (45828)
SET @Entry := 701006;
INSERT INTO `stygian_world`.`item_template` VALUES (@Entry, '4', '4', '-1', 'Chest Item', '45828', '2', '0', '0', '1', '14384', '2876', '5', '-1', '-1', '31', '26', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '201', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '2', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '0', '0', '0', '0', '', '5', '0', '0', '0', '0', '12340');
UPDATE `stygian_world`.`item_template`
SET 
 `entry` = @Entry,
 `name` = 'Koiter\'s Cuirass',
 `displayid` = '45828',
 `Quality` = '5',
 `Flags` = '0',
 `FlagsExtra` = '1',
 `bonding` = '2',
 `BuyPrice` = '1',
 `SellPrice` = '1',
 `InventoryType` = '5',
 `Material` = '6', 
 `AllowableClass` = '-1',
 `AllowableRace` = '-1',
 `ItemLevel` = '100',
 `RequiredLevel` = '0',
 `armor` = '1000',
 `description` = 'A faint inscription on the area that covers the heart reads, \'it\'ll be alright.\'',
 `Material` = '5',
 `MaxDurability` = '100'
WHERE
	(`entry` = @Entry);

-- Waist (10880)
SET @Entry := 701007;
INSERT INTO `stygian_world`.`item_template` VALUES (@Entry, '4', '4', '-1', 'Waist Item', '10880', '2', '0', '0', '1', '4655', '931', '6', '-1', '-1', '26', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '105', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '2', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '35', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '', '4', '0', '0', '0', '0', '12340');
UPDATE `stygian_world`.`item_template`
SET 
 `entry` = @Entry,
 `name` = 'Koiter\'s Belt',
 `displayid` = '10880',
 `Quality` = '5',
 `Flags` = '0',
 `FlagsExtra` = '1', 
 `bonding` = '2', 
 `BuyPrice` = '1',
 `SellPrice` = '1',
 `InventoryType` = '6',
 `Material` = '6', 
 `AllowableClass` = '-1',
 `AllowableRace` = '-1',
 `ItemLevel` = '100',
 `RequiredLevel` = '0',
 `armor` = '1000',
 `description` = 'The inscription, MK May 3, 1984 – March 18, 2004, is engraved into the buckle\'s metal surface.',
 `Material` = '5',
 `MaxDurability` = '100'
WHERE
	(`entry` = @Entry);
	
-- Legs (10881)
SET @Entry := 701008;
INSERT INTO `stygian_world`.`item_template` VALUES (@Entry, '4', '4', '-1', 'Leg Item', '10881', '2', '0', '0', '1', '12437', '2487', '7', '-1', '-1', '29', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '171', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '2', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '75', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '', '4', '0', '0', '0', '0', '12340');
UPDATE `stygian_world`.`item_template`
SET 
 `entry` = @Entry,
 `name` = 'Koiter\'s Cuisses',
 `displayid` = '10881',
 `Quality` = '5',
 `Flags` = '0',
 `FlagsExtra` = '1',
 `bonding` = '2', 
 `BuyPrice` = '1',
 `SellPrice` = '1',
 `InventoryType` = '7',
 `Material` = '6', 
 `AllowableClass` = '-1',
 `AllowableRace` = '-1',
 `ItemLevel` = '100',
 `RequiredLevel` = '0',
 `armor` = '1000',
 `description` = 'These master-crafted and battle-worn cuisses are infused and reinforced with Elementium.',
 `Material` = '5',
 `MaxDurability` = '100'
WHERE
	(`entry` = @Entry);

-- Feet (39135)
SET @Entry := 701009;
INSERT INTO `stygian_world`.`item_template` VALUES (@Entry, '4', '4', '-1', 'Feet Item', '39135', '2', '0', '0', '1', '8172', '1634', '8', '-1', '-1', '28', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '132', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '2', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '', '4', '0', '0', '0', '0', '12340');
UPDATE `stygian_world`.`item_template`
SET 
 `entry` = @Entry,
 `name` = 'Koiter\'s Greaves',
 `displayid` = '39135',
 `Quality` = '5',
 `Flags` = '0',
 `FlagsExtra` = '1',
 `bonding` = '2', 
 `BuyPrice` = '1',
 `SellPrice` = '1',
 `InventoryType` = '8',
 `Material` = '6', 
 `AllowableClass` = '-1',
 `AllowableRace` = '-1',
 `ItemLevel` = '100',
 `RequiredLevel` = '0',
 `armor` = '1000',
 `description` = 'The greaves are adorned with orcish glyphs that pulse with a faint red glow.',
 `Material` = '5',
 `MaxDurability` = '100'
WHERE
	(`entry` = @Entry);
	
-- Wrists (27074)
SET @Entry := 701010;
INSERT INTO `stygian_world`.`item_template` VALUES (@Entry, '4', '4', '-1', 'Wrists Item', '27074', '2', '0', '0', '1', '4722', '944', '9', '-1', '-1', '26', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '81', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '2', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '35', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '', '4', '0', '0', '0', '0', '12340');
UPDATE `stygian_world`.`item_template`
SET 
 `entry` = @Entry,
 `name` = 'Koiter\'s Vambraces',
 `displayid` = '27074',
 `Quality` = '5',
 `Flags` = '0',
 `FlagsExtra` = '1',
 `bonding` = '2', 
 `BuyPrice` = '1',
 `SellPrice` = '1',
 `InventoryType` = '9',
 `Material` = '6', 
 `AllowableClass` = '-1',
 `AllowableRace` = '-1',
 `ItemLevel` = '100',
 `RequiredLevel` = '0',
 `armor` = '1000',
 `description` = 'You can barely make out the mark of the Horde beneath the scratched and beaten surface.',
 `Material` = '5',
 `MaxDurability` = '100'
WHERE
	(`entry` = @Entry);
	
-- Hands (11898)
SET @Entry := 701011;
INSERT INTO `stygian_world`.`item_template` VALUES (@Entry, '4', '4', '-1', 'Hands Item', '11898', '2', '0', '0', '1', '5102', '1020', '10', '-1', '-1', '27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '118', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '2', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '35', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '', '4', '0', '0', '0', '0', '12340');
UPDATE `stygian_world`.`item_template`
SET 
 `entry` = @Entry,
 `name` = 'Koiter\'s Gauntlets',
 `displayid` = '11898',
 `Quality` = '5',
 `Flags` = '0',
 `FlagsExtra` = '1',
 `bonding` = '2',
 `BuyPrice` = '1',
 `SellPrice` = '1',
 `InventoryType` = '10',
 `Material` = '6', 
 `AllowableClass` = '-1',
 `AllowableRace` = '-1',
 `ItemLevel` = '100',
 `RequiredLevel` = '0',
 `armor` = '1000',
 `description` = 'The metal plates are scarred from battle; the leather straps discolored from sweat and tears.',
 `Material` = '5',
 `MaxDurability` = '100'
WHERE
	(`entry` = @Entry);
	
-- Sword (20080)
SET @Entry := 701012;
INSERT INTO `stygian_world`.`item_template` VALUES (@Entry, '2', '8', '-1', 'Polished Zweihander', '20080', '1', '0', '0', '1', '65032', '13006', '17', '-1', '-1', '46', '41', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '113', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2800', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '85', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '12340');
UPDATE `stygian_world`.`item_template`
SET 
 `entry` = @Entry,
 `name` = 'Koiter\'s Claymore',
 `displayid` = '20080',
 `Quality` = '5',
 `Flags` = '524416',
 `FlagsExtra` = '1',
 `bonding` = '2',
 `BuyCount` = '1',
 `BuyPrice` = '1',
 `SellPrice` = '1',
 `InventoryType` = '17',
 `Material` = '1', 
 `AllowableClass` = '1',
 `AllowableRace` = '34',
 `ItemLevel` = '100',
 `RequiredLevel` = '0',
 `dmg_min1` = '1984',
 `dmg_max1` = '2004',
 `delay` = '500',
 `description` = 'To the family who keeps Michel\'s flame burning bright. There is no greater glory that has been so worth the fight. Because some things are just worth fighting for.',
 `sheath` = '1',
 `Material` = '1',
 `MaxDurability` = '100'
 WHERE
	(`entry` = @Entry);
	

-- ################################################################################### --
--  MIASARA'S ARMOR
-- ################################################################################### --
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Breastplate', `displayid`='26291', `RequiredLevel`='1' WHERE (`entry`='10118');
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Greaves', `displayid`='26297', `RequiredLevel`='1' WHERE (`entry`='10119');
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Cloak', `displayid`='26304', `RequiredLevel`='1' WHERE (`entry`='10120');
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Gauntlets', `displayid`='26293', `RequiredLevel`='1' WHERE (`entry`='10121');
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Girdle', `displayid`='26295', `RequiredLevel`='1' WHERE (`entry`='10122');
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Circlet', `displayid`='26303', `RequiredLevel`='1' WHERE (`entry`='10123');
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Legguards', `displayid`='19708', `RequiredLevel`='1' WHERE (`entry`='10124');
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Pauldrons', `displayid`='26301', `RequiredLevel`='1' WHERE (`entry`='10125');
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Bracers', `displayid`='26289', `RequiredLevel`='1' WHERE (`entry`='10126');
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Shield', `displayid`='20910', `RequiredLevel`='1' WHERE (`entry`='10362');
UPDATE `stygian_world`.`item_template` SET `name`='Ornate Bracers', `displayid`='26289', `RequiredLevel`='1' WHERE (`entry`='16664');
UPDATE `stygian_world`.`item_template` SET `name`='Blesswind Hammer', `displayid`='19735', `RequiredLevel`='1' WHERE (`entry`='15229');

-- Teach Miasara Plate Mail
INSERT INTO `stygian_characters`.`character_skills` (`guid`, `skill`, `value`, `max`) VALUES ('2', '293', '1', '1');

-- Equip Miasara's Armor
UPDATE `stygian_characters`.`characters` SET `equipmentCache` = '0 0 0 0 10125 0 0 0 10118 0 10122 0 10124 0 10119 0 10126 0 10121 0 0 0 0 0 0 0 0 0 0 0 15229 0 10362 0 0 0 0 0 0 0 0 0 0 0 0 0 ' WHERE `guid` = 2;

-- Equip Miasara's Armor WITH Cloak
-- UPDATE `stygian_characters`.`characters` SET `equipmentCache` = '0 0 0 0 10125 0 0 0 10118 0 10122 0 10124 0 10119 0 10126 0 10121 0 0 0 0 0 0 0 0 0 10120 0 15229 0 10362 0 0 0 0 0 0 0 0 0 0 0 0 0 ' WHERE `guid` = 2;
