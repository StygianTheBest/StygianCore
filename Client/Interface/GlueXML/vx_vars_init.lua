--[[
-- ############################################################################################################# --
-- 
--  ____    __                                         ______  __              ____                    __      
-- /\  _`\ /\ \__                  __                 /\__  _\/\ \            /\  _`\                 /\ \__   
-- \ \,\L\_\ \ ,_\  __  __     __ /\_\     __      ___\/_/\ \/\ \ \___      __\ \ \L\ \     __    ____\ \ ,_\  
--  \/_\__ \\ \ \/ /\ \/\ \  /'_ `\/\ \  /'__`\  /' _ `\ \ \ \ \ \  _ `\  /'__`\ \  _ <'  /'__`\ /',__\\ \ \/  
--    /\ \L\ \ \ \_\ \ \_\ \/\ \L\ \ \ \/\ \L\.\_/\ \/\ \ \ \ \ \ \ \ \ \/\  __/\ \ \L\ \/\  __//\__, `\\ \ \_ 
--    \ `\____\ \__\\/`____ \ \____ \ \_\ \__/.\_\ \_\ \_\ \ \_\ \ \_\ \_\ \____\\ \____/\ \____\/\____/ \ \__\
--     \/_____/\/__/ `/___/> \/___L\ \/_/\/__/\/_/\/_/\/_/  \/_/  \/_/\/_/\/____/ \/___/  \/____/\/___/   \/__/
--                     /\___/ /\____/                                                                         
--                     \/__/  \_/__/               http://stygianthebest.github.io                                                    
--
-- ############################################################################################################# --
--
-- 	Random Custom Login Screens for World of Warcraft game client v3.3.5a
-- 	By StygianTheBest
--
--	Thanks to Rochet2 for the tips and the Arcadia login screen image and audio.
--	
-- 	Here are several login custom login screens I created with custom music. A random screen will be chosen each 
--	time you launch WoW. You can adjust how often a specific screen appears by editing the random value range. I
--	currenly have Conan's Crypt loading 60% of the time because it's my favorite. If you want one screen to show
--	every time, just set the rand = X where X is a number in the range of the screen you want.
--
--	You will need to adjust the IP Address to your private server in the LoginUI.lua file.
--	
--	The visual FX are mapped based on the screen resolution, so they may need to be tweaked. This can be done by 
--	editing X,Y,Z,O coordinates for each object. I have included a sample file for 1024x768 resolution as well.
-- 
-- 						Scale	X		Y		Z		Orientation		Model
--	ex: CreateModelFrame(0.05, 	3.17,	1.00,	0.00,	0.00, 			"Spells\\Archimonde_fire.m2")
-- ############################################################################################################# --
]]--

function myrandom(min, max)
    local r = max+1-min
    assert(r > 0, "max must be higher than or equal to min")
    return min+((math.random(r)+time())%math.abs(r))
end
rand = myrandom(1, 100) -- generate a random number
--message(rand) -- debug scenes
--rand = 90 	-- debug scenes or set a static scene value

function ShowScene(self)
	PlayGlueAmbience("GlueScreenUndead", 4.0);
	PlayLoginMusic();
	PlayBackgroundModels();
end

function ConvertAccountString(account)
	if account.Login then
		account.Login = "VX_Login_string"..strrev(account.Login);
	else
		account.Login = "";
	end
	if account.Password then
		account.Password = "VX_Password_string"..strrev(account.Password);
	else
		account.Password = "";
	end
	return account
end

if vx.ServerList then
	for i = 1, #vx.ServerList, 1 do
		if vx.ServerList[i].AccountList then
			for j = 1, #vx.ServerList[i].AccountList, 1 do
				vx.ServerList[i].AccountList[j] = ConvertAccountString(vx.ServerList[i].AccountList[j]);
			end
		end
	end
end

function PlayLoginMusic()
	
	if VX_ONMUSIC then return; end
	StopGlueMusic();

	if rand <= 60 then
	
		VX_MUSICTIMER = GetTime() + 107;
		VX_ONMUSIC = true;
		PlayMusic("Interface\\LoginMusic\\ConansCrypt.mp3");
	
	elseif rand >= 61 and rand <= 70 then
	
		VX_MUSICTIMER = GetTime() + 52;
		VX_ONMUSIC = true;
		PlayMusic("Interface\\LoginMusic\\AnvilofCrom.mp3");

	elseif rand >= 71 and rand <= 80 then

		VX_MUSICTIMER = GetTime() + 281;
		VX_ONMUSIC = true;
		PlayMusic("Interface\\LoginMusic\\DMF_L70ETC01.mp3");

	else
	
		if (rand % 2 == 0) then
			VX_MUSICTIMER = GetTime() + 217;
			VX_ONMUSIC = true;
			PlayMusic("Interface\\LoginMusic\\UR_FourSigilsHeroIntro.mp3");
		else
			VX_MUSICTIMER = GetTime() + 98;
			VX_ONMUSIC = true;
			PlayMusic("Interface\\LoginMusic\\Arcadia.mp3");
		end	
	
	end

end

function StopLoginMusic()
	StopMusic();
	StopGlueMusic();
	VX_ONMUSIC = nil;
	VX_MUSICTIMER = nil;
end

local ModelFrames = {}
local function CreateModelFrame(scale, x,y,z,o, modelstr)
	local F = CreateFrame("Model"); F:SetCamera(0); F:SetPoint("CENTER",0,0); F:SetFrameStrata("MEDIUM"); F:SetFrameLevel(3); local x_,y_,z_ = F:GetPosition(); F:SetWidth(10000); F:SetHeight(5500);
	F:SetLight(1,0,0,-0.5,-0.5,0.7,1.0,1.0,1.0,0.8,1.0,1.0,0.8);  -- light + light direction
	F:SetPosition(x_+x,y_+y,z_+z);  -- position
	F:SetFacing(F:GetFacing()+o);  -- rotation
	F:SetModelScale(F:GetModelScale()*scale);  -- scale
	F:SetAlpha(F:GetAlpha()/1);  -- alpha
	table.insert(ModelFrames, {F, modelstr});
	return F
end

local function CreatePictureFrame(width, height, bgstr)
	local F = CreateFrame("Frame", nil, UIParent);
	F:SetWidth(width)
	F:SetHeight(height)
	local T = F:CreateTexture(nil,"BACKGROUND")
	T:SetTexture(bgstr)
	T:SetAllPoints(F)
	F.texture = T
	F:SetPoint("CENTER",0,0)
	
	return F
end

do
	local width = 1370 -- default (wide)
	local height = 770 -- default (same on all)
	
	if rand <= 60 then
		bgfile = "Interface\\LoginScreen\\crypt.blp"	
	elseif rand >= 61 and rand <= 70 then
		bgfile = "Interface\\LoginScreen\\wow.blp"
	elseif rand >= 71 and rand <= 80 then
		bgfile = "Interface\\LoginScreen\\grimmguzzler.blp"
	else
		if (rand % 2 == 0) then
			bgfile = "Interface\\LoginScreen\\solar.blp"
		else
			bgfile = "Interface\\LoginScreen\\arcadia.blp"
		end
	end	
		
	local reso =
	{
	--[[	width -- ID from GetCurrentResolution()
		975,
		1050,
		1050,
		1370,
		1300, -- 5
		1250,
		1370,
		1370,
		1025,
		1250, -- 10
		975,
		1025,
		1370,
		1250,
		1050, -- 15
		1370,
	-- ]]
	}
	local pic =
	{
	--	[width] = "picture"
		--[975] = "Interface\\LoginScreen\\Background.blp",
		--[1050] = "Interface\\LoginScreen\\Background.blp",
		--[1370] = "Interface\\LoginScreen\\Background.blp",
		--[1300] = "Interface\\LoginScreen\\Background.blp",
		--[1250] = "Interface\\LoginScreen\\Background.blp",
		--[1025] = "Interface\\LoginScreen\\Background.blp",
	}
	if(reso[GetCurrentResolution()]) then
		width = reso[GetCurrentResolution()]
	end
	CreatePictureFrame(width, height, bgfile)
end


if rand <= 60 then
--					Scale	  X       Y       Z       O   	Model

	-- The Crypt of Conan
	CreateModelFrame(0.05, 	3.17,	1.00,	0.00,	0.00, 	"Spells\\Archimonde_fire.m2")
	CreateModelFrame(0.03, 	5.40,	2.18,	0.00,	0.00, 	"World\\Generic\\passivedoodads\\summerfestival\\summerfest_candle_02.m2")
	CreateModelFrame(0.03, 	1.73,	1.69,	0.00,	0.00, 	"World\\Generic\\passivedoodads\\summerfestival\\summerfest_candle_02.m2")		
	
elseif rand >= 61 and rand <= 70 then
	-- The Dark Portal
	CreateModelFrame(0.40, 	4.20,	2.00,	0.00,	0.00, 	"Spells\\Creature_spellportal_green.m2")
	CreateModelFrame(0.70, 	4.20,	2.00,	0.00,	0.00, 	"Spells\\Druid_infectedwounds.m2")
	
	-- Pillar 
	CreateModelFrame(0.05, 	-9.00,	-8.00,	6.00, 	0.10, 	"Creature\\Eyeofkathune\\eyeofkathune.m2")
	
	-- Mage
	CreateModelFrame(1.5, 	2.81,	1.33,	0.00,	16.1, 	"Spells\\Conjureitemcast.m2")	
	
	-- Elf
	CreateModelFrame(1.00, 	5.10,	1.80,	0.00,	16.1, 	"Particles\\Lootfx.m2")		
	-- CreateModelFrame(0.40, 		6.10,		0.94,	0.00,	0.50, 	"Item\\Objectcomponents\\ammo\\arrowmagicflight_01.m2")

	-- Paladin
	CreateModelFrame(1.3, 	5.20,	1.70,	0.00,	5.00, 	"Spells\\Avengingwrath_state_chest.m2")	
	
	-- Environment
	CreateModelFrame(0.07, 	1.45,	0.95,	0.00,	16.1, 	"Spells\\Archimonde_fire.m2")		
	CreateModelFrame(0.05, 	2.00,	0.95,	0.00,	16.1, 	"Spells\\Archimonde_fire.m2")
	CreateModelFrame(0.05, 	2.40,	0.95,	0.00,	16.1, 	"Spells\\Archimonde_fire.m2")
	CreateModelFrame(0.50, 	1.50,	1.40,	0.00,	0.00,	"World\\Lordaeron\\stratholme\\passivedoodads\\fx\\stratholmefiresmokeembers.m2")	

elseif rand >=71 and rand <= 80 then

	-- Tenth Level Tauren Chieftain - Warcraft III Expansion - 2003
	CreateModelFrame(1.70,	-18.00, -6.00, 	4.20, 	0.50, 		"Creature\\band\\bandundeadmale.m2")
	CreateModelFrame(0.50,	-10.00, 2.50, 	0.00, 	-0.50, 		"Creature\\band\\bandtaurenmale.m2")
	CreateModelFrame(0.60, 	-4.00, 	-0.90, 	0.00, 	0.00,  		"Creature\\band\\bandorcmale.m2")
	CreateModelFrame(1.70, 	-18.00, -6.90, 	3.20, 	0.20, 		"Creature\\band\\bandbloodelfmale.m2")
	CreateModelFrame(0.32,	5.65, 	0.70, 	1.00, 	4.70, 		"World\\Azeroth\\bootybay\\passivedoodad\\fishingbox\\fishingbox.m2")

else
	if (rand % 2 == 0) then
		-- Algalon the Observer
		CreateModelFrame(.5,   	-10.00,	-4.05,	0.00,	0.50, 	"Creature\\Alglontheobserver\\algalontheobserver.m2")
		CreateModelFrame(1.00, 	3.25,	2.00,	0.00,	16.1, 	"World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
		CreateModelFrame(0.20,  6.25, 	1.90,	0.00,	7.60, 	"World\\Expansion02\\doodads\\ulduar\\ul_brainparts_02.m2")	
	else
		-- Arcadia
		CreateModelFrame(0.20,  6.25, 	1.20,	0.00,	7.60, 	"World\\Expansion02\\doodads\\ulduar\\ul_brainparts_02.m2")
		CreateModelFrame(0.03,  2.20,	2.90,	0.00,	16.10, 	"World\\Expansion02\\doodads\\ulduar\\ul_planet_03.m2")
		CreateModelFrame(0.015, 5.39,	1.69,	0.00,	20.70, 	"World\\Expansion02\\doodads\\ulduar\\ul_planet_04.m2")
		CreateModelFrame(0.05, 	1.05,	1.09,	0.00,	16.1, 	"World\\Expansion02\\doodads\\ulduar\\ul_power_orb01.m2")
		CreateModelFrame(0.05, 	1.05,	1.09,	0.00,	16.1, 	"World\\Expansion02\\doodads\\ulduar\\ul_swirl_orb_cloud.m2")
		CreateModelFrame(1.00, 	0.70,	1.09,	0.00,	16.1, 	"World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
	end
end

function PlayBackgroundModels()
	for _,tbl in ipairs(ModelFrames) do
		tbl[1]:SetModel(tbl[2]);
	end
end

--[[

	// Mordred Tool Output
	Scene	   X      Y       Z     O    Scale   Alpha      
	{1, 	-0.721, 0.206, 0.000, 3.193, 0.279, 1.000, _, 1, 1, 1, "Creature/Alglontheobserver/algalontheobserver.m2", _, _}

	// Orientation
	0.0 = Face Forward
	-0.5 = Clockwise 25degrees)
	-1.0 = Clockwise 45degrees)
	-2.0 = Clockwise 180 degrees)

	// Mordred Scene: 1
	{1, 1.013, 0.489, 0.000, 0.000, 0.500, 1.000, _, 1, 1, 1, 		"Creature\band\bandundeadmale.mdx", _, _},
	{1, -0.147, 0.585, 0.000, 0.000, 0.300, 1.000, _, 1, 1, 1, 		"Creature\band\bandtaurenmale.mdx", _, _},
	{1, 0.220, 0.386, 0.000, 0.000, 0.500, 1.000, _, 1, 1, 1, 		"Creature\band\bandorcmale.mdx", _, _},
	{1, -0.941, 0.433, 0.000, 0.000, 0.500, 1.000, _, 1, 1, 1, 		"Creature\band\bandbloodelfmale.mdx", _, _}

	// Models (Not Used or Need Camera)
	CreateModelFrame(1.5, 		2.81,		1.33,	0.00,	16.1, 	"Spells\\Disenchant_precast_hand.m2")		
	CreateModelFrame(0.01, 		1.45,		3.00,	0.00,	16.1, 	"Spells\\Reddustcloud.m2")	
	CreateModelFrame(0.40, 		4.20,		2.00,	0.00,	0.00, 	"Spells\\Fel_fireward_impact_chest.m2")		
	CreateModelFrame(0.05, 		2.80,		1.35,	0.00,	16.1, 	"Particles\\Morphfx.m2")
	CreateModelFrame(2.00, 		-5.00,		-3.00,	0.00,	0.00, 	"Creature\\Undead_eagle\\undead_eagle.m2")		
	CreateModelFrame(0.60,   	0.25,		0.90,	0.90,	0.00, 	"Creature\\Alglontheobserver\\algalontheobserver.m2")
	CreateModelFrame(0.50, 		0.00,		0.00,	0.00,	0.00, 	"Spells\\Ulduar_blackhole.m2")
	CreateModelFrame(0.50, 		0.00,		0.00,	0.00,	0.00, 	"Environments\\Stars\\chamberaspectsblacksky.m2")
	CreateModelFrame(0.10, 		3.25,		1.90,	-100,	0.00, 	"Environments\\Stars\\icecrownstormysky.m2")
	CreateModelFrame(5.00, 		3.25,		1.90,	0.00,	0.00, 	"Particles\\Greenleaves.m2")
	CreateModelFrame(1.00, 		3.25,		1.90,	0.00,	0.00, 	"Particles\\Morphfx.m2")
	CreateModelFrame(0.050, 	2.80,		1.35,	0.00,	16.1, 	"Spells\\Archimonde_fire.m2")	
	CreateModelFrame(0.015, 	2.62,		1.78,	0.358,	1.79, 	"Creature\\Zigguratcrystal\\zigguratcrystal.m2")
	CreateModelFrame(0.60, 		2.62,		1.78,	0.00, 	0.10,	"Creature\\Spells\\eyeofkilrog.m2")	
	CreateModelFrame(2.00, 		0.00,		0.00,	0.00,	0.00, 	"World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
	CreateModelFrame(1.00, 		3.17,		2.00,	0.00,	0.00, 	"World\\Generic\\orc\\passive doodads\\voodoostuff\\skullcandle02.m2")
	CreateModelFrame(1.00, 		3.00,		3.00,	0.00,	0.00, 	"World\\Azeroth\\elwynn\\passivedoodads\\campfire\\elwynncampfire.m2")
	CreateModelFrame(3.00,		-15.00, 	3.00, 	0.00, 	0.00, 	"World\\Expansion01\\doodads\\netherstorm\\lightning\\netherstormlightning01.m2")	
	CreateModelFrame(3.00,		-9.00, 		4.00, 	0.00, 	0.00, 	"World\\Expansion01\\doodads\\netherstorm\\lightning\\netherstormlightning02.m2")
	CreateModelFrame(3.00,		-2.00, 		-2.00, 	0.00, 	0.00, 	"World\\Expansion01\\doodads\\netherstorm\\lightning\\netherstormlightning03.m2")
	CreateModelFrame(3.00,		-2.00, 		2.00, 	0.00, 	0.00, 	"World\\Expansion01\\doodads\\netherstorm\\lightning\\netherstormlightning04.m2")
	CreateModelFrame(3.00,		-20.00, 	5.00, 	0.00, 	0.00, 	"World\\Expansion01\\doodads\\netherstorm\\lightning\\netherstormlightning05.m2")	

]]--