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
--  Populates Programmer Isle (.tele programisle) with rows of NPCs for each valid 
--  model listed in the npc_creature_model table. I am amazed at all of the models
--  I've never seen in 335a, and I was a Loremaster and Seeker 3335a retail!
--
--
--  TODO: Create a client add-on that allows applies a .morph to all models and
--  increases their modelid1 value to reflect the next range within the specified
-- 	parameters.
--
--
--  ** WARNING ** 
--  You need to have the PATCH-Z.MPQ file included with StygianCore in your 
--  WowClient/Data/ folder or the client will crash trying to access this forbidden 
--  zone.
--
-- 
--  2019.03.01: Release
--
-- ################################################################################### --
*/

USE stygian_world;

-- --------------------------------------------------------------------------------------
--
--  ModelMall Stored Procedure
--		- All models are referenced from the npc_creature_model table.
--  	- Valid Model Range: 13 ... 37,254
--  	- Max Models Tested Stable At 2000
--
--	StartModel 
--		- Default: 13
--		- The first model in npc_creature_model
--
--  MaxModel 
--		- Default: 640 
--		- At the chosen starting location on Programmer Isle, more than 640 will cause NPCs
-- 		  to drop off the map. Modify the starting location to place more models
--
-- --------------------------------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS `ModelMall` $$

CREATE PROCEDURE ModelMall()
	BEGIN

	DECLARE CurModel, Count INT DEFAULT 0;
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur CURSOR FOR SELECT modelid1 FROM npc_creature_model;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	-- -------------------------------------------------------------------------------------
	-- Initialize
	-- -------------------------------------------------------------------------------------
	SET
		@StartEntry := 602000, -- CONST Value
		@Entry		:= 602000,
		@GUID		:= 250000;

		-- -----------------------------------------------------------
		-- Always delete for max models
		-- -----------------------------------------------------------
		DELETE FROM `creature` WHERE `guid` >= @GUID AND `guid` <= 285000;
		DELETE FROM `creature_template` WHERE `entry` >= @Entry AND `entry` <= 638000;
		
		-- -----------------------------------------------------------
		-- Get the configuration values stored in npc_creature_model
		-- -----------------------------------------------------------		
		SELECT `credits` INTO @ModelMax FROM `npc_creature_model` WHERE `modelid1` = 13;
		SELECT `credits` INTO @ModelStart FROM `npc_creature_model` WHERE `modelid1` = 14;

	-- -------------------------------------------------------------------------------------
	-- NPC Model Template
	-- -------------------------------------------------------------------------------------
	SET
		@Name 			:= @ModelStart, -- "Model ID",
		@Title			:= "ModelMall",
		@XPos			:= 16037.8,
		@YPos			:= 16104.1,
		@ZPos			:= 69.4453,
		@Orientation	:= 1.511, 
		@WorldMap		:= 451,
		@Model 			:= 7898, -- Carrion Grub
		@Icon 			:= NULL,
		@GossipMenu 	:= 0,
		@MinLevel 		:= 1,
		@MaxLevel 		:= 1,
		@Faction 		:= 35,
		@NPCFlag 		:= 0,
		@Scale			:= 0.75,
		@Rank			:= 0,
		@Type 			:= 8,	-- 8 = Critter
		@TypeFlags 		:= 0,
		@FlagsExtra 	:= 0,
		@AIName			:= "SmartAI",
		@Script 		:= "",
		@ModelRangeEnd	:= @ModelMax+@ModelStart;
	
	OPEN cur;

	read_loop: LOOP

		FETCH cur INTO CurModel;
		
		-- ---------------------------------------------
		-- Exit On MaxModel Count
		-- ---------------------------------------------		
		IF Count > @ModelMax THEN
		   LEAVE read_loop;
		END IF;
		
		-- ---------------------------------------------
		-- Loop Complete
		-- ---------------------------------------------
		IF done THEN
		  LEAVE read_loop;
		END IF;

		-- ---------------------------------------------		
		-- Only Get Models In Specified Range
		-- ---------------------------------------------		
		IF CurModel >= @ModelStart THEN

			-- ---------------------------------------------
			-- Generate NPCs In Range
			-- ---------------------------------------------		
			IF Count < @ModelMax THEN
					
				-- ---------------------------------------------	
				-- Add Creature Entry
				-- ---------------------------------------------	
				INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) 
				VALUES (@Entry, CurModel, CurModel, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

				-- ---------------------------------------------		
				-- Spawn Creature
				-- ---------------------------------------------		
				INSERT INTO stygian_world.creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) 
				VALUES (@GUID, @Entry, '451', '1', '1', '0', '0', @XPos, @YPos, @ZPos, @Orientation, '50', '0', '0', '2112', '0', '0', '0', '0', '0');

				-- ---------------------------------------------		
				-- Increment Creature Data
				-- ---------------------------------------------		
				SET @Entry := @Entry + 1;
				SET @GUID  := @GUID + 1;
				SET Count  := Count + 1;
				SET @Name  := CurModel;
				
				-- ---------------------------------------------		
				-- Spawn Point Placement
				-- ---------------------------------------------		
				SET @XPos = @XPos + 3;
				
				-- ---------------------------------------------		
				-- Create Opposing Row 
				-- (Reverse Row At Half of MaxModels)
				-- ---------------------------------------------			
				IF @Entry = (@StartEntry+(@ModelMax DIV 2)) THEN						
					SET 
						@XPos			:= 16037.7,
						@YPos			:= 16112.2,
						@ZPos			:= 69.4435,
						@Orientation	:= 4.677;	
				END IF;			

			END IF;

		END IF;

	END LOOP;

	CLOSE cur;

	END $$

DELIMITER ;

-- -------------------------------------------------------------------------------------
-- Generate ModelMall on Programmer Isle (.tele programisle)
-- -------------------------------------------------------------------------------------

CALL ModelMall();

-- Our endless numbered days...
