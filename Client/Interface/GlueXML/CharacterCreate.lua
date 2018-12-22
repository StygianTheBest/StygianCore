CHARACTER_FACING_INCREMENT = 2;
MAX_RACES = 10;
MAX_CLASSES_PER_RACE = 10;
NUM_CHAR_CUSTOMIZATIONS = 5;
MIN_CHAR_NAME_LENGTH = 2;
CHARACTER_CREATE_ROTATION_START_X = nil;
CHARACTER_CREATE_INITIAL_FACING = nil;

PAID_CHARACTER_CUSTOMIZATION = 1;
PAID_RACE_CHANGE = 2;
PAID_FACTION_CHANGE = 3;
PAID_SERVICE_CHARACTER_ID = nil;
PAID_SERVICE_TYPE = nil;

FACTION_BACKDROP_COLOR_TABLE = {
	["Alliance"] = {0.5, 0.5, 0.5, 0.09, 0.09, 0.19},
	["Horde"] = {0.5, 0.2, 0.2, 0.19, 0.05, 0.05},
};
FRAMES_TO_BACKDROP_COLOR = { 
	"CharacterCreateCharacterRace",
	"CharacterCreateCharacterClass",
--	"CharacterCreateCharacterFaction",
	"CharacterCreateNameEdit",
};
RACE_ICON_TCOORDS = {
	["HUMAN_MALE"]		= {0, 0.125, 0, 0.25},
	["DWARF_MALE"]		= {0.125, 0.25, 0, 0.25},
	["GNOME_MALE"]		= {0.25, 0.375, 0, 0.25},
	["NIGHTELF_MALE"]	= {0.375, 0.5, 0, 0.25},
	
	["TAUREN_MALE"]		= {0, 0.125, 0.25, 0.5},
	["SCOURGE_MALE"]	= {0.125, 0.25, 0.25, 0.5},
	["TROLL_MALE"]		= {0.25, 0.375, 0.25, 0.5},
	["ORC_MALE"]		= {0.375, 0.5, 0.25, 0.5},

	["HUMAN_FEMALE"]	= {0, 0.125, 0.5, 0.75},  
	["DWARF_FEMALE"]	= {0.125, 0.25, 0.5, 0.75},
	["GNOME_FEMALE"]	= {0.25, 0.375, 0.5, 0.75},
	["NIGHTELF_FEMALE"]	= {0.375, 0.5, 0.5, 0.75},
	
	["TAUREN_FEMALE"]	= {0, 0.125, 0.75, 1.0},   
	["SCOURGE_FEMALE"]	= {0.125, 0.25, 0.75, 1.0}, 
	["TROLL_FEMALE"]	= {0.25, 0.375, 0.75, 1.0}, 
	["ORC_FEMALE"]		= {0.375, 0.5, 0.75, 1.0}, 

	["BLOODELF_MALE"]	= {0.5, 0.625, 0.25, 0.5},
	["BLOODELF_FEMALE"]	= {0.5, 0.625, 0.75, 1.0}, 

	["DRAENEI_MALE"]	= {0.5, 0.625, 0, 0.25},
	["DRAENEI_FEMALE"]	= {0.5, 0.625, 0.5, 0.75}, 
};
CLASS_ICON_TCOORDS = {
	["WARRIOR"]	= {0, 0.25, 0, 0.25},
	["MAGE"]	= {0.25, 0.49609375, 0, 0.25},
	["ROGUE"]	= {0.49609375, 0.7421875, 0, 0.25},
	["DRUID"]	= {0.7421875, 0.98828125, 0, 0.25},
	["HUNTER"]	= {0, 0.25, 0.25, 0.5},
	["SHAMAN"]	= {0.25, 0.49609375, 0.25, 0.5},
	["PRIEST"]	= {0.49609375, 0.7421875, 0.25, 0.5},
	["WARLOCK"]	= {0.7421875, 0.98828125, 0.25, 0.5},
	["PALADIN"]	= {0, 0.25, 0.5, 0.75},
	["DEATHKNIGHT"]	= {0.25, 0.49609375, 0.5, 0.75},
};

function CharacterCreate_OnLoad(self)
	self:SetSequence(0);
	self:SetCamera(0);

	CharacterCreate.numRaces = 0;
	CharacterCreate.selectedRace = 0;
	CharacterCreate.numClasses = 0;
	CharacterCreate.selectedClass = 0;
	CharacterCreate.selectedGender = 0;

	SetCharCustomizeFrame("CharacterCreate");
	--CharCreateModel:SetLight(1, 0, 0, -0.707, -0.707, 0.7, 1.0, 1.0, 1.0, 0.8, 1.0, 1.0, 0.8);

	for i=1, NUM_CHAR_CUSTOMIZATIONS, 1 do
		_G["CharacterCustomizationButtonFrame"..i.."Text"]:SetText(_G["CHAR_CUSTOMIZATION"..i.."_DESC"]);
	end

	-- Color edit box backdrop
	local backdropColor = FACTION_BACKDROP_COLOR_TABLE["Alliance"];
	CharacterCreateNameEdit:SetBackdropBorderColor(backdropColor[1], backdropColor[2], backdropColor[3]);
	CharacterCreateNameEdit:SetBackdropColor(backdropColor[4], backdropColor[5], backdropColor[6]);
end

function CharacterCreate_OnShow()
	for i=1, MAX_CLASSES_PER_RACE, 1 do
		local button = _G["CharacterCreateClassButton"..i];
		button:Enable();
		SetButtonDesaturated(button, false)
	end
	for i=1, MAX_RACES, 1 do
		local button = _G["CharacterCreateRaceButton"..i];
		button:Enable();
		SetButtonDesaturated(button, false)
	end

	if ( PAID_SERVICE_TYPE ) then
		CustomizeExistingCharacter( PAID_SERVICE_CHARACTER_ID );
		CharacterCreateNameEdit:SetText( PaidChange_GetName() );
	else
		--randomly selects a combination
		ResetCharCustomize();
		CharacterCreateNameEdit:SetText("");
		CharCreateRandomizeButton:Show();
	end

	CharacterCreateEnumerateRaces(GetAvailableRaces());
	SetCharacterRace(GetSelectedRace());
	
	CharacterCreateEnumerateClasses(GetAvailableClasses());
	local_,_,index = GetSelectedClass();
	SetCharacterClass(index);

	SetCharacterGender(GetSelectedSex())
	
	-- Hair customization stuff
	CharacterCreate_UpdateHairCustomization();

	SetCharacterCreateFacing(-15);
	
	if ( ALLOW_RANDOM_NAME_BUTTON ) then
		CharacterCreateRandomName:Show();
	end
	
	GlueFrameFadeIn(CharacterCreate, VX_FADE_LOAD);

	-- setup customization
	CharacterChangeFixup();
end

function CharacterCreate_OnHide()
	PAID_SERVICE_CHARACTER_ID = nil;
	PAID_SERVICE_TYPE = nil;
end

function CharacterCreateFrame_OnMouseDown(button)
	if ( button == "LeftButton" ) then
		CHARACTER_CREATE_ROTATION_START_X = GetCursorPosition();
		CHARACTER_CREATE_INITIAL_FACING = GetCharacterCreateFacing();
	end
end

function CharacterCreateFrame_OnMouseUp(button)
	if ( button == "LeftButton" ) then
		CHARACTER_CREATE_ROTATION_START_X = nil
	end
end

function CharacterCreateFrame_OnUpdate()
	if ( CHARACTER_CREATE_ROTATION_START_X ) then
		local x = GetCursorPosition();
		local diff = (x - CHARACTER_CREATE_ROTATION_START_X) * CHARACTER_ROTATION_CONSTANT;
		CHARACTER_CREATE_ROTATION_START_X = GetCursorPosition();
		SetCharacterCreateFacing(GetCharacterCreateFacing() + diff);
	end
end

function CharacterCreateEnumerateRaces(...)
	CharacterCreate.numRaces = select("#", ...)/3;
	if ( CharacterCreate.numRaces > MAX_RACES ) then
		message("Too many races!  Update MAX_RACES");
		return;
	end
	local coords;
	local index = 1;
	local button;
	local gender;
	local selectedSex = GetSelectedSex();
	if ( selectedSex == SEX_MALE ) then
		gender = "MALE";
	elseif ( selectedSex == SEX_FEMALE ) then
		gender = "FEMALE";
	end
	for i=1, select("#", ...), 3 do
		coords = RACE_ICON_TCOORDS[strupper(select(i+1, ...).."_"..gender)];
		_G["CharacterCreateRaceButton"..index.."NormalTexture"]:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
		_G["CharacterCreateRaceButton"..index.."PushedTexture"]:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
		button = _G["CharacterCreateRaceButton"..index];
		button:Show();
		if ( select(i+2, ...) == 1 ) then
			button.enable = true;
			SetButtonDesaturated(button);
			button.name = select(i, ...)
			button.tooltip = select(i, ...);
		else
			button.enable = false;
			SetButtonDesaturated(button, 1);
			button.name = select(i, ...)
			button.tooltip = _G[strupper(select(i+1, ...).."_".."DISABLED")];
		end
		index = index + 1;
	end
	for i=CharacterCreate.numRaces + 1, MAX_RACES, 1 do
		_G["CharacterCreateRaceButton"..i]:Hide();
	end
end

function CharacterCreateEnumerateClasses(...)
	CharacterCreate.numClasses = select("#", ...)/3;
	if ( CharacterCreate.numClasses > MAX_CLASSES_PER_RACE ) then
		message("Too many classes!  Update MAX_CLASSES_PER_RACE");
		return;
	end
	local coords;
	local index = 1;
	local button;
	for i=1, select("#", ...), 3 do
		coords = CLASS_ICON_TCOORDS[strupper(select(i+1, ...))];
		_G["CharacterCreateClassButton"..index.."NormalTexture"]:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
		_G["CharacterCreateClassButton"..index.."PushedTexture"]:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
		button = _G["CharacterCreateClassButton"..index];
		button:Show();
		if ( (select(i+2, ...) == 1) and (IsRaceClassValid(CharacterCreate.selectedRace, index)) ) then
			button.enable = true;
			button:Enable();
			SetButtonDesaturated(button);
			button.name = select(i, ...)
			button.tooltip = select(i, ...);
			_G["CharacterCreateClassButton"..index.."DisableTexture"]:Hide();
		else
			button.enable = false;
			button:Disable();
			SetButtonDesaturated(button, 1);
			button.name = select(i, ...)
			button.tooltip = _G[strupper(select(i+1, ...).."_".."DISABLED")];
			_G["CharacterCreateClassButton"..index.."DisableTexture"]:Show();
		end
		index = index + 1;
	end
	for i=CharacterCreate.numClasses + 1, MAX_CLASSES_PER_RACE, 1 do
		_G["CharacterCreateClassButton"..i]:Hide();
	end
end

function SetCharacterRace(id)
	CharacterCreate.selectedRace = id;
	local selectedButton;
	for i=1, CharacterCreate.numRaces, 1 do
		local button = _G["CharacterCreateRaceButton"..i];
		if ( i == id ) then
			_G["CharacterCreateRaceButton"..i.."Text"]:SetText(button.name);
			button:SetChecked(1);
			selectedButton = button;
		else
			_G["CharacterCreateRaceButton"..i.."Text"]:SetText("");
			button:SetChecked(0);
		end
	end

	-- Set Faction
	local name, faction = GetFactionForRace(CharacterCreate.selectedRace);

	-- Set Race
	local race, fileString = GetNameForRace();

	CharacterCreateRaceLabel:SetText(race);
	fileString = strupper(fileString);
	if ( GetSelectedSex() == SEX_MALE ) then
		gender = "MALE";
	else
		gender = "FEMALE";
	end
	local coords = RACE_ICON_TCOORDS[fileString.."_"..gender];
	CharacterCreateRaceIcon:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
	local raceText = _G["RACE_INFO_"..fileString];
	local abilityIndex = 1;
	local tempText = _G["ABILITY_INFO_"..fileString..abilityIndex];
	abilityText = "";
	while ( tempText ) do
		abilityText = abilityText..tempText.."\n\n";
		abilityIndex = abilityIndex + 1;
		tempText = _G["ABILITY_INFO_"..fileString..abilityIndex];
	end

	CharacterCreateRaceScrollFrameScrollBar:SetValue(0);
	CharacterCreateRaceText:SetText(GetFlavorText("RACE_INFO_"..strupper(fileString), GetSelectedSex()).."|n|n");
	if ( abilityText and abilityText ~= "" ) then
		CharacterCreateRaceAbilityText:SetText(abilityText);
	else
		CharacterCreateRaceAbilityText:SetText("");
	end

	-- Set backdrop colors based on faction
	local backdropColor = FACTION_BACKDROP_COLOR_TABLE[faction];
	local frame;
	for index, value in pairs(FRAMES_TO_BACKDROP_COLOR) do
		frame = _G[value];
		frame:SetBackdropColor(backdropColor[4], backdropColor[5], backdropColor[6]);
	end
	CharacterCreateConfigurationBackground:SetVertexColor(backdropColor[4], backdropColor[5], backdropColor[6]);

	local backgroundFilename = GetCreateBackgroundModel();
	SetBackgroundModel(CharacterCreate, backgroundFilename);
	GlueFrameFadeIn(CharacterCreate, VX_FADE_REFRESH);
end

function SetCharacterClass(id)
	CharacterCreate.selectedClass = id;
	for i=1, CharacterCreate.numClasses, 1 do
		local button = _G["CharacterCreateClassButton"..i];
		if ( i == id ) then
			CharacterCreateClassName:SetText(button.name);
			button:SetChecked(1);
		else
			button:SetChecked(0);
		end
	end
	
	local className, classFileName, _, tank, healer, damage = GetSelectedClass();
	local abilityIndex = 0;
	local tempText = _G["CLASS_INFO_"..classFileName..abilityIndex];
	abilityText = "";
	while ( tempText ) do
		abilityText = abilityText..tempText.."\n\n";
		abilityIndex = abilityIndex + 1;
		tempText = _G["CLASS_INFO_"..classFileName..abilityIndex];
	end
	local coords = CLASS_ICON_TCOORDS[classFileName];
	CharacterCreateClassIcon:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
	CharacterCreateClassLabel:SetText(className);
	CharacterCreateClassRolesText:SetText(abilityText);	
	CharacterCreateClassText:SetText(GetFlavorText("CLASS_"..strupper(classFileName), GetSelectedSex()).."|n|n");
	CharacterCreateClassScrollFrameScrollBar:SetValue(0);
end

function CharacterCreate_OnChar()
end

function CharacterCreate_OnKeyDown(key)
	if ( key == "ESCAPE" ) then
		CharacterCreate_Back();
	elseif ( key == "ENTER" ) then
		CharacterCreate_Okay();
	elseif ( key == "PRINTSCREEN" ) then
		Screenshot();
	end
end

function CharacterCreate_UpdateModel(self)
	UpdateCustomizationScene();
	self:AdvanceTime();
end

function CharacterCreate_Okay()
	if ( PAID_SERVICE_TYPE ) then
		GlueDialog_Show("CONFIRM_PAID_SERVICE");
	else
		CreateCharacter(CharacterCreateNameEdit:GetText());
	end
	PlaySound("gsCharacterCreationCreateChar");
end

function CharacterCreate_Back()
	PlaySound("gsCharacterCreationCancel");
	GlueFrameFadeOut(CharacterCreate, VX_FADE_UNLOAD, CharacterCreate_Back_Wait);
	--SetGlueScreen("charselect");
end

function CharacterCreate_Back_Wait()
	SetGlueScreen("charselect");
end

function CharacterClass_OnClick(id)
	PlaySound("gsCharacterCreationClass");
	local _,_,currClass = GetSelectedClass();
	if ( currClass ~= id and IsRaceClassValid(GetSelectedRace(), id) ) then
		CharacterCreate.id = id;
		GlueFrameFadeOut(CharacterCreate, VX_FADE_REFRESH, CharacterCreateFadeInClass);
	end
end

function CharacterCreateFadeInClass()
	SetSelectedClass(CharacterCreate.id);
	SetCharacterClass(CharacterCreate.id);
 	SetCharacterRace(GetSelectedRace());
	CharacterChangeFixup();
	CharacterCreate.id = nil;
end

function CharacterRace_OnWait(self, id)
	if ( GetSelectedRace() ~= id ) then
		SetSelectedRace(id);
		SetCharacterRace(id);
		SetSelectedSex(GetSelectedSex());
		SetCharacterCreateFacing(-15);
		CharacterCreateEnumerateClasses(GetAvailableClasses());
		local _,_,classIndex = GetSelectedClass();
		if ( PAID_SERVICE_TYPE ) then
			classIndex = PaidChange_GetCurrentClassIndex();
		end
		SetCharacterClass(classIndex);
		
		-- Hair customization stuff
		CharacterCreate_UpdateHairCustomization();
			
		CharacterChangeFixup();
	end
end

function CharacterCreateFadeInRace()
	CharacterRace_OnWait(CharacterCreate.tg, CharacterCreate.tgId);
	CharacterCreate.tg = nil;
	CharacterCreate.tgId = nil;
end

function CharacterRace_OnClick(self, id)
	CharacterCreate.tg = self;
	CharacterCreate.tgId = id;

	PlaySound("gsCharacterCreationClass");
	if ( not self:GetChecked() ) then
		self:SetChecked(1);
		return;
	end
	GlueFrameFadeOut(CharacterCreate, VX_FADE_REFRESH, CharacterCreateFadeInRace);
end

function SetCharacterGender(sex)
	CharacterCreate.sex = sex;
	GlueFrameFadeOut(CharacterCreate, VX_FADE_REFRESH, SetCharacterGender_Wait);
end

function SetCharacterGender_Wait()
	sex = CharacterCreate.sex;
	CharacterCreate.sex = nil;
	local gender;
	SetSelectedSex(sex);
	if ( sex == SEX_MALE ) then
		gender = "MALE";
		CharacterCreateGender:SetText(MALE);
		CharacterCreateGenderButtonMale:SetChecked(1);
		CharacterCreateGenderButtonFemale:SetChecked(nil);
	elseif ( sex == SEX_FEMALE ) then
		gender = "FEMALE";
		CharacterCreateGender:SetText(FEMALE);
		CharacterCreateGenderButtonMale:SetChecked(nil);
		CharacterCreateGenderButtonFemale:SetChecked(1);
	end

	-- Update race images to reflect gender
	CharacterCreateEnumerateRaces(GetAvailableRaces());
	CharacterCreateEnumerateClasses(GetAvailableClasses());
 	SetCharacterRace(GetSelectedRace());
	
	local _,_,classIndex = GetSelectedClass();
	if ( PAID_SERVICE_TYPE ) then
		classIndex = PaidChange_GetCurrentClassIndex();
	end
	SetCharacterClass(classIndex);

	CharacterCreate_UpdateHairCustomization();

	-- Update right hand race portrait to reflect gender change
	-- Set Race
	local race, fileString = GetNameForRace();
	CharacterCreateRaceLabel:SetText(race);
	fileString = strupper(fileString);
	local coords = RACE_ICON_TCOORDS[fileString.."_"..gender];
	CharacterCreateRaceIcon:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
	
	CharacterChangeFixup();
end

function CharacterCustomization_Left(id)
	PlaySound("gsCharacterCreationLook");
	CycleCharCustomization(id, -1);
end

function CharacterCustomization_Right(id)
	PlaySound("gsCharacterCreationLook");
	CycleCharCustomization(id, 1);
end

function CharacterCreate_Randomize()
	PlaySound("gsCharacterCreationLook");
	RandomizeCharCustomization();
end

function CharacterCreateRotateRight_OnUpdate(self)
	if ( self:GetButtonState() == "PUSHED" ) then
		SetCharacterCreateFacing(GetCharacterCreateFacing() + CHARACTER_FACING_INCREMENT);
	end
end

function CharacterCreateRotateLeft_OnUpdate(self)
	if ( self:GetButtonState() == "PUSHED" ) then
		SetCharacterCreateFacing(GetCharacterCreateFacing() - CHARACTER_FACING_INCREMENT);
	end
end

function CharacterCreate_UpdateHairCustomization()
	CharacterCustomizationButtonFrame3Text:SetText(_G["HAIR_"..GetHairCustomization().."_STYLE"]);
	CharacterCustomizationButtonFrame4Text:SetText(_G["HAIR_"..GetHairCustomization().."_COLOR"]);
	CharacterCustomizationButtonFrame5Text:SetText(_G["FACIAL_HAIR_"..GetFacialHairCustomization()]);		
end

function SetButtonDesaturated(button, desaturated, r, g, b)
	if ( not button ) then
		return;
	end
	local icon = button:GetNormalTexture();
	if ( not icon ) then
		return;
	end
	local shaderSupported = icon:SetDesaturated(desaturated);

	if ( not desaturated ) then
		r = 1.0;
		g = 1.0;
		b = 1.0;
	elseif ( not r or not shaderSupported ) then
		r = 0.5;
		g = 0.5;
		b = 0.5;
	end
	
	icon:SetVertexColor(r, g, b);
end

function GetFlavorText(tagname, sex)
	local primary, secondary;
	if ( sex == SEX_MALE ) then
		primary = "";
		secondary = "_FEMALE";
	else
		primary = "_FEMALE";
		secondary = "";
	end
	local text = _G[tagname..primary];
	if ( (text == nil) or (text == "") ) then
		text = _G[tagname..secondary];
	end
	return text;
end

function CharacterChangeFixup()
	if ( PAID_SERVICE_TYPE ) then
		for i=1, MAX_CLASSES_PER_RACE, 1 do
			if (CharacterCreate.selectedClass ~= i) then
				local button = _G["CharacterCreateClassButton"..i];
				button:Disable();
				SetButtonDesaturated(button, true)
			end
		end

		for i=1, MAX_RACES, 1 do
			local allow = false;
			if ( PAID_SERVICE_TYPE == PAID_FACTION_CHANGE ) then
				local faction = GetFactionForRace(PaidChange_GetCurrentRaceIndex());
				if ( (i == PaidChange_GetCurrentRaceIndex()) or ((GetFactionForRace(i) ~= faction) and (IsRaceClassValid(i,CharacterCreate.selectedClass))) ) then
					allow = true;
				end
			elseif ( PAID_SERVICE_TYPE == PAID_RACE_CHANGE ) then
				local faction = GetFactionForRace(PaidChange_GetCurrentRaceIndex());
				if ( (i == PaidChange_GetCurrentRaceIndex()) or ((GetFactionForRace(i) == faction) and (IsRaceClassValid(i,CharacterCreate.selectedClass))) ) then
					allow = true
				end
			elseif ( PAID_SERVICE_TYPE == PAID_CHARACTER_CUSTOMIZATION ) then
				if ( i == CharacterCreate.selectedRace ) then
					allow = true
				end
			end
			if (not allow) then
				local button = _G["CharacterCreateRaceButton"..i];
				button:Disable();
				SetButtonDesaturated(button, true)
			end
		end
	end
end

