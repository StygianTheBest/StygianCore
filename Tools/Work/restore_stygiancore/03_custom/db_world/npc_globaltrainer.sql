/*
-- ###################################################################################### --
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
-- ###################################################################################### --
--
-- SQL NPC: Global Trainer
-- NPC ID: 70105
-- 
-- This trainer will train all classes and includes spells that would normally be
-- obtained through questing.
-- 
-- This script was ported on 2018-12-13 by StygianTheBest for use with StygianCore.
-- 
-- Original credits:
-- http://www.ac-web.org/forums/showthread.php?112663-SHARE-Global-Trinity-Core-Trainers
-- 
-- ###################################################################################### --
*/
-- --------------------------------------------------------------------------------------
-- Reference class to add some missing spells you get from quest and some others.
-- --------------------------------------------------------------------------------------
SET 
  @Deathknight := 70105;
SET 
  @Druid := 70105;
SET 
  @Shaman := 70105;
SET 
  @Hunter := 70105;
SET 
  @Mage := 70105;
SET 
  @Warlock := 70105;
SET 
  @Warrior := 70105;
SET 
  @GMspells := 70105;
SET 
  @Skills := 70105;
SET 
  @Trainer := 70105;
 -- --------------------------------------------------------------------------------------
-- Clean Trainer before inserting new NPC,spells & skills.
-- --------------------------------------------------------------------------------------
DELETE FROM 
  `creature` 
WHERE 
  `id` = @Trainer;
DELETE FROM 
  `creature_template` 
WHERE 
  `entry` = @Trainer;
DELETE FROM 
  `npc_trainer` 
WHERE 
  `ID` = @Trainer;
  
-- --------------------------------------------------------------------------------------
-- Create Trainer NPC
-- --------------------------------------------------------------------------------------
INSERT INTO `creature_template` (
  `entry`, `difficulty_entry_1`, `difficulty_entry_2`, 
  `difficulty_entry_3`, `KillCredit1`, 
  `KillCredit2`, `modelid1`, `modelid2`, 
  `modelid3`, `modelid4`, `name`, `subname`, 
  `IconName`, `gossip_menu_id`, `minlevel`, 
  `maxlevel`, `exp`, `faction`, `npcflag`, 
  `speed_walk`, `speed_run`, `scale`, 
  `rank`, `mindmg`, `maxdmg`, `dmgschool`, 
  `attackpower`, `dmg_multiplier`, 
  `baseattacktime`, `rangeattacktime`, 
  `unit_class`, `unit_flags`, `dynamicflags`, 
  `family`, `trainer_type`, `trainer_spell`, 
  `trainer_class`, `trainer_race`, 
  `minrangedmg`, `maxrangedmg`, `rangedattackpower`, 
  `type`, `type_flags`, `lootid`, `pickpocketloot`, 
  `skinloot`, `resistance1`, `resistance2`, 
  `resistance3`, `resistance4`, `resistance5`, 
  `resistance6`, `spell1`, `spell2`, 
  `spell3`, `spell4`, `spell5`, `spell6`, 
  `spell7`, `spell8`, `PetSpellDataId`, 
  `VehicleId`, `mingold`, `maxgold`, 
  `AIName`, `MovementType`, `InhabitType`, 
  `Health_mod`, `Mana_mod`, `Armor_mod`, 
  `RacialLeader`, `movementId`, `RegenHealth`, 
  `mechanic_immune_mask`, `flags_extra`, 
  `ScriptName`
) 
VALUES 
  (
    @Trainer, 
    -- entry
    0, 
    -- difficulty_entry_1
    0, 
    -- difficulty_entry_2
    0, 
    -- difficulty_entry_3
    0, 
    -- KillCredit1
    0, 
    -- KillCredit2
    25901, 
    -- modelid1 - Deckard Cain
    0, 
    -- modelid2
    0, 
    -- modelid3
    0, 
    -- modelid4
    'Deckard Cain', 
    -- name
    'Grandmaster Trainer', 
    -- subname
    '', 
    -- IconName
    0, 
    -- gossip_menu_id
    80, 
    -- minlevel
    80, 
    -- maxlevel
    0, 
    -- exp
    35, 
    -- faction
    51, 
    -- npcflag
    1, 
    -- speed_walk
    1, 
    -- speed_run
    1, 
    -- scale
    0, 
    -- rank
    1755, 
    -- mindmg
    1755, 
    -- maxdmg
    0, 
    -- dmgschool
    1504, 
    -- attackpower
    1, 
    -- dmg_multiplier
    1500, 
    -- baseattacktime
    0, 
    -- rangeattacktime
    2, 
    -- unit_class
    0, 
    -- unit_flags
    0, 
    -- dynamicflags
    0, 
    -- family
    2, 
    -- trainer_type
    0, 
    -- trainer_spell
    0, 
    -- trainer_class
    0, 
    -- trainer_race
    0, 
    -- minrangedmg
    0, 
    -- maxrangedmg
    0, 
    -- rangedattackpower
    7, 
    -- type
    0, 
    -- type_flags
    0, 
    -- lootid
    0, 
    -- pickpocketloot
    0, 
    -- skinloot
    0, 
    -- resistance1
    0, 
    -- resistance2
    0, 
    -- resistance3
    0, 
    -- resistance4
    0, 
    -- resistance5
    0, 
    -- resistance6
    0, 
    -- spell1
    0, 
    -- spell2
    0, 
    -- spell3
    0, 
    -- spell4
    0, 
    -- spell5
    0, 
    -- spell6
    0, 
    -- spell7
    0, 
    -- spell8
    0, 
    -- PetSpellDataId
    0, 
    -- VehicleId
    0, 
    -- mingold
    0, 
    -- maxgold
    '', 
    -- AIName
    0, 
    -- MovementType
    3, 
    -- InhabitType
    1, 
    -- Health_mod
    1, 
    -- Mana_mod
    1, 
    -- Armor_mod
    0, 
    -- RacialLeader
    0, 
    -- movementId
    1, 
    -- RegenHealth
    0, 
    -- mechanic_immune_mask
    0, 
    -- flags_extra
    '' -- ScriptName
    );
	
-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Trainer;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Trainer, 'Greetings Traveler. Stay awhile.. and train!');
	
-- Creature Text
DELETE FROM `stygian_world`.`creature_text` WHERE `entry` = @Trainer;
INSERT INTO `stygian_world`.`creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (@Trainer, '0', '0', 'Greetings Traveler. Stay awhile.. and train!', '12', '0', '100', '0', '0', '0', @Trainer, '0', '');

-- Broadcast Text
DELETE FROM `stygian_world`.`broadcast_text` WHERE `ID` = @Trainer;
INSERT INTO `stygian_world`.`broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`) VALUES (@Trainer, '0', 'Greetings Traveler. Stay awhile.. and train!', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '12034');

-- Smart Scripts
DELETE FROM `stygian_world`.`smart_scripts` WHERE `entryorguid` = @Trainer;
INSERT INTO `stygian_world`.`smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (@Trainer, '0', '0', '0', '1', '0', '100', '0', '5000', '20000', '30000', '120000', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Speak');

-- --------------------------------------------------------------------------------------
-- NPC EQUIPPED
-- --------------------------------------------------------------------------------------
DELETE FROM `creature_equip_template` WHERE `CreatureID`= @Trainer AND `ID`=1;
-- INSERT INTO `creature_equip_template` VALUES (@Trainer, 1, 28184, 1168, 0, 18019); -- Millennium Blade, Skullflame Shield
INSERT INTO `creature_equip_template` VALUES (@Trainer, 1, 39422, 0, 0, 18019); -- PlagueHound Staff

-- --------------------------------------------------------------------------------------
-- Make Trainer mounted (Uncomment this part if you want him mounted)
-- --------------------------------------------------------------------------------------
/*
DELETE FROM 
  `creature_template_addon` 
WHERE 
  `entry` = @Trainer;
INSERT INTO `creature_template_addon` (
  `entry`, `path_id`, `mount`, `bytes1`, 
  `bytes2`, `emote`, `auras`
) 
VALUES 
  (@Trainer, 0, 24725, 0, 4096, 0, NULL);
*/

  -- --------------------------------------------------------------------------------------
-- Insert spells to trainer
-- --------------------------------------------------------------------------------------
INSERT INTO `npc_trainer` (`ID`, `SpellID`) 
VALUES 
  (@Trainer,-200001), 
  -- Warrior-Lowlevel
  (@Trainer,-200002), 
  -- Warrior-Highlevel
  (@Trainer,-200003), 
  -- Paladin-Lowlevel
  (@Trainer,-200004), 
  -- Paladin-Highlevel
  (@Trainer,-200005), 
  -- Druid-Lowlevel
  (@Trainer,-200006), 
  -- Druid-Highlevel
  (@Trainer,-200007), 
  -- Mage-Lowlevel
  (@Trainer,-200008), 
  -- Mage-Highlevel
  (@Trainer,-200009), 
  -- Warlock-Lowlevel
  (@Trainer,-200010), 
  -- Warlock-Highlevel
  (@Trainer,-200011), 
  -- Priest-Lowlevel
  (@Trainer,-200012), 
  -- Priest-Highlevel
  (@Trainer,-200013), 
  -- Hunter-Lowlevel
  (@Trainer,-200014), 
  -- Hunter-Highlevel
  (@Trainer,-200015), 
  -- Rogue-Lowlevel
  (@Trainer,-200016), 
  -- Rogue-Highlevel
  (@Trainer,-200017), 
  -- Shaman-Lowlevel
  (@Trainer,-200018);
-- Shaman-Highlevel

-- --------------------------------------------------------------------------------------
-- (@Trainer,-200019); -- Death Knights-Alllevel 
-- DisableD because alot of frost spell available to any class. Remade the DK spells and 
-- will remove the one trainable by any class) 
-- --------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------
-- DeathKnight Spells
-- --------------------------------------------------------------------------------------
INSERT INTO `npc_trainer` (
  `ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, 
  `ReqSkillRank`, `ReqLevel`
) 
VALUES 
  (@Deathknight, 50977, 0, 0, 0, 55), 
  -- Death Gate
  (@Deathknight, 53428, 0, 0, 0, 55), 
  -- Runeforging
  (@Deathknight, 49998, 5600, 0, 0, 56), 
  -- Death Strike Rank 1
  (@Deathknight, 50842, 5600, 0, 0, 56), 
  -- Pestilence
  (@Deathknight, 46584, 5600, 0, 0, 56), 
  -- Raise Dead
  (@Deathknight, 48263, 5700, 0, 0, 57), 
  -- Frost Presence
  (@Deathknight, 47528, 5700, 0, 0, 57), 
  -- Mind Freeze
  (@Deathknight, 48721, 5800, 0, 0, 58), 
  -- Blood Boil Rank 1
  (@Deathknight, 45524, 5800, 0, 0, 58), 
  -- Chains of Ice
  (@Deathknight, 49926, 5900, 0, 0, 59), 
  -- Blood Strike Rank 2
  (@Deathknight, 55258, 5900, 0, 0, 59), 
  -- Heart Strike Rank 2
  (@Deathknight, 47476, 5900, 0, 0, 59), 
  -- Strangulate
  (@Deathknight, 51325, 300, 0, 0, 60), 
  -- Corpse Explosion Rank 2
  (@Deathknight, 43265, 6000, 0, 0, 60), 
  -- Death and Decay Rank 1
  -- (@Deathknight,51416,6200,0,0,60), -- Frost Strike Rank 2
  (@Deathknight, 49917, 5800, 0, 0, 60), 
  -- Plague Strike Rank 2
  (
    @Deathknight, 49896, 61000, 0, 0, 61
  ), 
  -- Icy Touch Rank 2
  -- (@Deathknight,49020,61000,0,0,61), -- Obliterate Rank 1
  -- (@Deathknight,3714,61000,0,0,61), -- Path of Frost
  (
    @Deathknight, 49892, 59000, 0, 0, 62
  ), 
  -- Death Coil Rank 2
  (
    @Deathknight, 48792, 62000, 0, 0, 62
  ), 
  -- Icebound Fortitude
  (
    @Deathknight, 49999, 65000, 0, 0, 63
  ), 
  -- Death Strike Rank 2
  (
    @Deathknight, 49927, 64000, 0, 0, 64
  ), 
  -- Blood Strike Rank3
  (
    @Deathknight, 45529, 64000, 0, 0, 64
  ), 
  -- Blood Tap
  (@Deathknight, 55259, 3200, 0, 0, 64), 
  -- Heart Strike Rank 3
  (
    @Deathknight, 56222, 65000, 0, 0, 65
  ), 
  -- Dark Command
  -- (@Deathknight,51417,3250,0,0,65), -- Frost Strike Rank 3
  -- (@Deathknight,57330,65000,0,0,65), -- Horn of Winter Rank 1
  (
    @Deathknight, 49918, 65000, 0, 0, 65
  ), 
  -- Plague Strike Rank 3
  (
    @Deathknight, 49939, 66000, 0, 0, 66
  ), 
  -- Blood Boil Rank 2
  (
    @Deathknight, 48743, 66000, 0, 0, 66
  ), 
  -- Death Pact
  (
    @Deathknight, 49936, 68000, 0, 0, 67
  ), 
  -- Death and Decay Rank 2
  (
    @Deathknight, 49903, 67000, 0, 0, 67
  ), 
  -- Icy Touch Rank 3
  -- (@Deathknight,51423,67000,0,0,67), -- Obliterate Rank 2
  -- (@Deathknight,56815,67000,0,0,67), -- Rune Strike
  (
    @Deathknight, 55265, 18000, 0, 0, 67
  ), 
  -- Scourge Strike Rank 2
  (
    @Deathknight, 48707, 68000, 0, 0, 68
  ), 
  -- Anti-Magic Shell
  (
    @Deathknight, 49893, 68000, 0, 0, 68
  ), 
  -- Death Coil Rank 3
  (
    @Deathknight, 49928, 69000, 0, 0, 69
  ), 
  -- Blood Strike Rank 4
  (@Deathknight, 55260, 3450, 0, 0, 69), 
  -- Heart Strike Rank 4
  (
    @Deathknight, 51326, 18000, 0, 0, 70
  ), 
  -- Corpse Explosion Rank 3
  (
    @Deathknight, 45463, 63000, 0, 0, 70
  ), 
  -- Death Strike Rank 3
  -- (@Deathknight,51418,18000,0,0,70), -- Frost Strike Rank 4
  -- (@Deathknight,51409,3350,0,0,70), -- Howling Blast Rank 2
  (
    @Deathknight, 49919, 360000, 0, 0, 70
  ), 
  -- Plague strike Rank 4
  (
    @Deathknight, 48265, 360000, 0, 0, 70
  ), 
  -- Unholy Presence
  (
    @Deathknight, 49940, 360000, 0, 0, 72
  ), 
  -- Blood Boil Rank 3
  (
    @Deathknight, 61999, 360000, 0, 0, 72
  ), 
  -- Raise Ally
  (
    @Deathknight, 49937, 360000, 0, 0, 73
  ), 
  -- Death and Decay Rank 3
  (
    @Deathknight, 49904, 360000, 0, 0, 73
  ), 
  -- Icy Touch Rank 4
  -- (@Deathknight,51424,360000,0,0,73), -- Obliterate Rank 3
  (
    @Deathknight, 55270, 18000, 0, 0, 73
  ), 
  -- Scourge Strike Rank 3
  (
    @Deathknight, 49929, 360000, 0, 0, 74
  ), 
  -- Blood Strike Rank 5
  (
    @Deathknight, 55261, 18000, 0, 0, 74
  ), 
  -- Heart Strike Rank 5
  (
    @Deathknight, 51327, 18000, 0, 0, 75
  ), 
  -- Corpse Explosion Rank 4
  (
    @Deathknight, 49923, 360000, 0, 0, 75
  ), 
  -- Death Strike Rank 4
  (
    @Deathknight, 47568, 360000, 0, 0, 75
  ), 
  -- Empower Rune Weapon
  -- (@Deathknight,51419,18000,0,0,75), -- Frost Strike Rank 5
  -- (@Deathknight,57623,360000,0,0,75), -- Horn of Winter Rank 2
  -- (@Deathknight,51410,18000,0,0,75), -- Howling Blast Rank 3
  (
    @Deathknight, 49920, 360000, 0, 0, 75
  ), 
  -- Plague Strike Rank 5
  (
    @Deathknight, 49894, 360000, 0, 0, 76
  ), 
  -- Death Coil Rank 4
  (
    @Deathknight, 49941, 360000, 0, 0, 78
  ), 
  -- Blood Boil Rank 4
  (
    @Deathknight, 49909, 360000, 0, 0, 78
  ), 
  -- Icy Touch Rank 5
  -- (@Deathknight,51425,360000,0,0,79), -- Obliterate Rank 4
  (
    @Deathknight, 55271, 18000, 0, 0, 79
  ), 
  -- Scourge Strike Rank 4
  (
    @Deathknight, 42650, 360000, 0, 0, 80
  ), 
  -- Army of the Dead
  (
    @Deathknight, 49930, 360000, 0, 0, 80
  ), 
  -- Blood Strike Rank 6
  (
    @Deathknight, 51328, 18000, 0, 0, 80
  ), 
  -- Corpse Explosion Rank 5
  (
    @Deathknight, 49895, 360000, 0, 0, 80
  ), 
  -- Death Coil Rank 5
  (
    @Deathknight, 49924, 360000, 0, 0, 80
  ), 
  -- Death Strike Rank 5
  (
    @Deathknight, 49938, 360000, 0, 0, 80
  ), 
  -- Death and Decay Rank 4
  -- (@Deathknight,55268,18000,0,0,80), -- Frost Strike Rank 6
  (
    @Deathknight, 55262, 18000, 0, 0, 80
  ), 
  -- Heart Strike Rank 6
  -- (@Deathknight,51411,18000,0,0,80), -- Howling Blast Rank 4
  (
    @Deathknight, 49921, 360000, 0, 0, 80
  ), 
  -- Plague Strike Rank 6
  -- Rune Forging
  (@Deathknight, 54447, 5700, 0, 0, 57), 
  -- Rune of Spellbreaking
  (@Deathknight, 53342, 5700, 0, 0, 57), 
  -- Rune of Spellshattering
  (@Deathknight, 53331, 6000, 0, 0, 60), 
  -- Rune of Lichbane
  (
    @Deathknight, 54446, 68000, 0, 0, 63
  ), 
  -- Rune of Swordbreaking
  (
    @Deathknight, 53323, 63000, 0, 0, 63
  ), 
  -- Rune of Swordshattering
  (
    @Deathknight, 53344, 360000, 0, 0, 70
  ), 
  -- Rune of the Fallen Crusader
  (
    @Deathknight, 62158, 360000, 0, 0, 72
  );
-- Rune of the Stoneskin Gargoyle


-- --------------------------------------------------------------------------------------
-- Missing spells you get from quest.
-- --------------------------------------------------------------------------------------
INSERT INTO `npc_trainer` (
  `ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, 
  `ReqSkillRank`, `ReqLevel`
) 
VALUES 
  (@Druid, 5487, 0, 0, 0, 10), 
  -- Bear Form
  (@Shaman, 8071, 0, 0, 0, 4), 
  -- Stoneskin Totem Rank 1
  (@Shaman, 3599, 0, 0, 0, 10), 
  -- Searing Totem Rank 1
  (@Shaman, 5394, 0, 0, 0, 20), 
  -- Healing Stream Totem Rank 1
  (@Hunter, 883, 0, 0, 0, 10), 
  -- Call Pet
  (@Hunter, 2641, 0, 0, 0, 10), 
  -- Dismiss Pet
  (@Hunter, 6991, 0, 0, 0, 10), 
  -- Feed Pet
  (@Hunter, 982, 0, 0, 0, 10), 
  -- Revive Pet
  (@Hunter, 1515, 0, 0, 0, 10), 
  -- Tame Beast
  (@Mage, 61305, 0, 0, 0, 60), 
  -- Polymorph (Black Cat)
  (@Mage, 28272, 0, 0, 0, 60), 
  -- Polymorph (Pig)
  (@Mage, 61721, 0, 0, 0, 60), 
  -- Polymorph (Rabbit)
  (@Mage, 61780, 0, 0, 0, 60), 
  -- Polymorph (Turkey)
  (@Mage, 28271, 0, 0, 0, 60), 
  -- Polymorph (Turtle)
  (@Mage, 61316, 0, 0, 0, 80), 
  -- Dalaran Brillance
  (@Mage, 61024, 0, 0, 0, 80), 
  -- Dalaran Intellect
  (@Warlock, 697, 0, 0, 0, 10), 
  -- Summon Voidwalker
  (@Warlock, 712, 0, 0, 0, 20), 
  -- Summon Succubus
  (@Warlock, 691, 0, 0, 0, 30), 
  -- Summon Felhunter
  (@Warlock, 1122, 0, 0, 0, 50), 
  -- Inferno
  (@Warlock, 18540, 0, 0, 0, 60), 
  -- Ritual of Doom
  (@Warrior, 71, 0, 0, 0, 10), 
  -- Defensive Stance
  (@Warrior, 7386, 0, 0, 0, 10), 
  -- Sunder Armor
  (@Warrior, 355, 0, 0, 0, 10), 
  -- Taunt
  (@Warrior, 2458, 0, 0, 0, 30);
-- Berserker Stance


-- --------------------------------------------------------------------------------------
-- GM Spells (Need to be level 81 to learn)
-- --------------------------------------------------------------------------------------
INSERT INTO `npc_trainer` (
  `ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, 
  `ReqSkillRank`, `ReqLevel`
) 
VALUES 
  (@GMspells, 1908, 0, 0, 0, 81), 
  -- Uber Heal Over Time
  (@GMspells, 35912, 0, 0, 0, 81);
-- Master BufF


-- --------------------------------------------------------------------------------------
-- Skills
-- --------------------------------------------------------------------------------------
INSERT INTO `npc_trainer` (
  `ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, 
  `ReqSkillRank`, `ReqLevel`
) 
VALUES 
  (@Skills, 33388, 40000, 0, 0, 20), 
  -- Apprentice Riding
  (
    @Skills, 33391, 500000, 33388, 0, 40
  ), 
  -- Journeyman Riding
  (
    @Skills, 34090, 2500000, 33391, 0, 60
  ), 
  -- Expert Riding
  (
    @Skills, 34091, 50000000, 34090, 0, 
    70
  ), 
  -- Artisan Riding
  (
    @Skills, 54197, 10000000, 34090, 0, 
    77
  ), 
  -- Cold Weather Flying
  (@Skills, 196, 10000, 0, 0, 1), 
  -- One-Handed Axes
  (@Skills, 197, 10000, 0, 0, 1), 
  -- Two-Handed Axes
  (@Skills, 198, 10000, 0, 0, 1), 
  -- One-Handed Maces
  (@Skills, 199, 10000, 0, 0, 1), 
  -- Two-Handed Maces
  (@Skills, 200, 10000, 0, 0, 1), 
  -- Polearms
  (@Skills, 201, 10000, 0, 0, 1), 
  -- One-Handed Swords
  (@Skills, 202, 10000, 0, 0, 1), 
  -- Two-Handed Swords
  (@Skills, 227, 10000, 0, 0, 1), 
  -- Staves
  (@Skills, 264, 10000, 0, 0, 1), 
  -- Bows
  (@Skills, 266, 10000, 0, 0, 1), 
  -- Guns
  (@Skills, 1180, 10000, 0, 0, 1), 
  -- Daggers
  (@Skills, 2567, 10000, 0, 0, 1), 
  -- Throwns
  (@Skills, 5011, 10000, 0, 0, 1), 
  -- Crossbows
  (@Skills, 15590, 10000, 0, 0, 1), 
  -- Fists
  (@Skills, 8737, 10000, 0, 0, 40), 
  -- Mail Armor
  (@Skills, 750, 10000, 0, 0, 40);
