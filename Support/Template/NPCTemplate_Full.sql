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
--  WORLD: FULL NPC TEMPLATE
-- 
--  This is a fully scripted NPC template designed for StygianCore. It makes editing
--	and creating NPCs much easier for those trying to learn how it works. 
--
-- ################################################################################### --
*/

-- Set the NPC values
SET
@Entry				:= 601038,
@Name				:= "Black Beauty",
@SubName			:= "",
@DiffEntry1			:= 0,
@DiffEntry2			:= 0,
@DiffEntry3			:= 0,
@KillCredit1		:= 0,
@KillCredit2		:= 0,
@Model1				:= 239,
@Model2				:= 0,
@Model3				:= 0,
@Model4				:= 0,
@GossipMenuID		:= 0,
@MinLevel			:= 1,
@MaxLevel			:= 1,
@Exp				:= 0,
@Faction			:= 2096,
@NPCFlag			:= 0,
@SpeedWalk			:= 1,
@SpeedRun			:= 1.6,
@Scale				:= 1,
@Rank				:= 0,
@MinDmg				:= 1000,
@MaxDmg				:= 5000,
@DmgSchool			:= 0,
@AttackPower		:= 1000,
@DmgMultiplier		:= 1,
@BaseAttackTime 	:= 500,
@RangeAttackTime	:= 500,
@UnitClass			:= 0,
@UnitFlags			:= 0,
@UnitFlags2			:= 0,
@DynamicFlags		:= 0,
@Family				:= 0,
@TrainerType		:= 0,
@TrainerSpell		:= 0,
@TrainerClass		:= 0,
@TrainerRace		:= 0,
@MinRangeDmg		:= 1000,
@MaxRangeDmg		:= 5000,
@RangedAttackPower	:= 1000,
@Type				:= 0,
@TypeFlags			:= 0,
@LootID				:= 0,
@PickPocketLoot		:= 0,
@SkinLoot			:= 0,
@Resistance1		:= 0,
@Resistance2		:= 0,
@Resistance3		:= 0,
@Resistance4		:= 0,
@Resistance5		:= 0,
@Resistance6		:= 0,
@Spell1				:= 0,
@Spell2				:= 0,
@Spell3				:= 0,
@Spell4				:= 0,
@Spell5				:= 0,
@Spell6				:= 0,
@Spell7				:= 0,
@Spell8				:= 0,
@PetSpellDataID		:= 0,
@VehicleID			:= 0,
@MinGold			:= 0,
@MaxGold			:= 0,
@AIName				:= '',
@MovementType		:= 0,
@InhabitType		:= 0,
@HoverHeight		:= 1,
@HealthMod			:= 1000,
@ManaMod			:= 1,
@ArmorMod			:= 1,
@RacialLeader		:= 0,
@MovementID			:= 1,
@RegenHealth		:= 0,
@MechanicImmuneMask := 0,
@FlagsExtra			:= 0,
@ScriptName			:= '',
@VerifiedBuild		:= 12340;

-- Insert NPC into database
INSERT INTO `stygian_world`.`creature_template` VALUES (@Entry, @DiffEntry1, @DiffEntry2, @DiffEntry3, @KillCredit1, @KillCredit2, @Model1, @Model2, @Model3, @Model4, @Name, @SubName, @IconName, @GossipMenuID, @MinLevel, @MaxLevel, @Exp, @Faction, @NPCFlag, @SpeedWalk, @SpeedRun, @Scale, @Rank, @MinDmg, @MaxDmg, @DmgSchool, @AttackPower, @DmgMultiplier, @BaseAttackTime, @RangeAttackTime, @UnitClass, @UnitFlags, @UnitFlags2, @DynamicFlags, @Family, @TrainerType, @TrainerSpell, @TrainerClass, @TrainerRace, @MinRangeDmg, @MaxRangeDmg, @RangedAttackPower, @Type, @TypeFlags, @LootID, @PickPocketLoot, @SkinLoot, @Resistance1, @Resistance2, @Resistance3, @Resistance4, @Resistance5, @Resistance6, @Spell1, @Spell2, @Spell3, @Spell4, @Spell5, @Spell6, @Spell7, @Spell8, @PetSpellDataID, @VehicleID, @MinGold, @MaxGold, @AIName, @MovementType, @InhabitType, @HoverHeight, @HealthMod, @ManaMod, @ArmorMod, @RacialLeader, @MovementID,@RegenHealth, @MechanicImmuneMask, @FlagsExtra, @ScriptName, @VerifiedBuild);

-- At Wit's End by Dream Theater is EPIC