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
-- 	Equips the default characters with armor and weapons
--
-- ################################################################################### --
*/

USE stygian_world;

-- ################################################################################### --
--  ARMOR
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

-- Teach Koiter Plate Mail
INSERT INTO `stygian_characters`.`character_skills` (`guid`, `skill`, `value`, `max`) VALUES ('1', '293', '1', '1');

-- Equip Koiter's Armor
UPDATE `stygian_characters`.`characters` SET `equipmentCache` = '0 0 0 0 10125 0 0 0 10118 0 10122 0 10124 0 10119 0 10126 0 10121 0 0 0 0 0 0 0 0 0 0 0 15229 0 10362 0 0 0 0 0 0 0 0 0 0 0 0 0 ' WHERE `guid` = 1;

-- Equip Koiter's Armor WITH Cloak
-- UPDATE `stygian_characters`.`characters` SET `equipmentCache` = '0 0 0 0 10125 0 0 0 10118 0 10122 0 10124 0 10119 0 10126 0 10121 0 0 0 0 0 0 0 0 0 10120 0 15229 0 10362 0 0 0 0 0 0 0 0 0 0 0 0 0 ' WHERE `guid` = 1;

-- Teach Miasara Plate Mail
INSERT INTO `stygian_characters`.`character_skills` (`guid`, `skill`, `value`, `max`) VALUES ('2', '293', '1', '1');

-- Equip Miasara's Armor
UPDATE `stygian_characters`.`characters` SET `equipmentCache` = '0 0 0 0 10125 0 0 0 10118 0 10122 0 10124 0 10119 0 10126 0 10121 0 0 0 0 0 0 0 0 0 0 0 15229 0 10362 0 0 0 0 0 0 0 0 0 0 0 0 0 ' WHERE `guid` = 2;

-- Equip Miasara's Armor WITH Cloak
-- UPDATE `stygian_characters`.`characters` SET `equipmentCache` = '0 0 0 0 10125 0 0 0 10118 0 10122 0 10124 0 10119 0 10126 0 10121 0 0 0 0 0 0 0 0 0 10120 0 15229 0 10362 0 0 0 0 0 0 0 0 0 0 0 0 0 ' WHERE `guid` = 2;
