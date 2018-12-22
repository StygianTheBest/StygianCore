function RealmWizard_OnLoad(self)
	self:SetCamera(0);
	self:SetSequence(0);

	ShowScene(RealmWizard);
	--if (IsStreamingTrial()) then
	--	AccountLoginCinematicsButton:Disable();
	--	RealmWizard:SetModel("Interface\\Glues\\Models\\UI_MainMenu\\UI_MainMenu.m2");
	--else
	--	RealmWizard:SetModel("Interface\\Glues\\Models\\UI_MainMenu_Northrend\\UI_MainMenu_Northrend.m2");
	--end
end

function RealmWizard_OnShow(self)
	self:SetSequence(0);
	RealmWizardGameTypeButton1:Click(1);
	if ( not RealmWizard.selectedCategory ) then
		RealmWizardSuggest:Disable();
	end
	RealmWizard_UpdateCategories(GetRealmCategories());
end

function RealmWizard_OnHide(self)
	StopAllSFX( 1.0 );
end

function RealmWizard_UpdateCategories(...)
	local numTabs = select("#", ...);
	local button, buttonText;
	local numCategoriesShown = 0;

	local categoryIndex = 1;
	for i=1, MAX_REALM_CATEGORY_TABS do
		button = _G["RealmWizardLocationButton"..i];
		buttonText = _G["RealmWizardLocationButton"..i.."Text"];
		while (IsTournamentRealmCategory(categoryIndex)) do
			categoryIndex = categoryIndex + 1;
			if (categoryIndex > numTabs) then
				break;
			end
		end
		if ( categoryIndex <= numTabs ) then
			buttonText:SetText(select(categoryIndex, ...));
			button.categoryIndex = categoryIndex;
			if ( categoryIndex == RealmWizard.selectedCategory ) then
				button:SetChecked(1);
			else
				button:SetChecked(nil);
			end
			button:Show();
			numCategoriesShown = numCategoriesShown + 1;
			categoryIndex = categoryIndex + 1;
		else
			button:Hide();
		end
	end
	RealmWizardLocation:SetHeight(numCategoriesShown * 28 + RealmWizardLocationLabelDescription:GetHeight() + 50);
end

function RealmWizardLocationButton_OnClick(id)
	RealmWizardSuggest:Enable();
	RealmWizard.selectedCategory = id;
	RealmWizard_UpdateCategories(GetRealmCategories());
end

-- Wrapper function so it can be included as a dialog function
function RealmWizard_SetRealm()
	ChangeRealm(RealmWizard.suggestedCategory, RealmWizard.suggestedID);
end

function RealmWizard_Exit()
	DisconnectFromServer();
	SetGlueScreen("login");
end

function RealmWizard_OnKeyDown(key)
	if ( key == "ESCAPE" ) then
		RealmWizard_Exit();
	elseif ( key == "ENTER" ) then
		RealmWizardSuggest:Click();
	elseif ( key == "PRINTSCREEN" ) then
		Screenshot();
	end
end
