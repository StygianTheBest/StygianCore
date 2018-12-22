
MOVIE_CAPTION_FADE_TIME = 1.0;

MovieVolumeList = { };
--WoW Classic
MovieVolumeList[1] = 100;
--Burning Crusade
MovieVolumeList[2] = 150;
--Lich King
MovieVolumeList[3] = 250;

MovieList = { };
MovieList[1] = { };
MovieList[1][1] = { };
MovieList[1][1][1] = {
	video = "Interface\\Cinematics\\Logo_800"
};
MovieList[1][1][2] = {
	video = "Interface\\Cinematics\\Logo_1024"
};
MovieList[1][2] = { };
MovieList[1][2][1] = {
	video = "Interface\\Cinematics\\WOW_Intro_800"
};
MovieList[1][2][2] = {
	video = "Interface\\Cinematics\\WOW_Intro_1024"
};
MovieList[2] = { };
MovieList[2][1] = { };
MovieList[2][1][1] = {
	video = nil
};
MovieList[2][1][2] = {
	video = nil
};
MovieList[2][2] = { };
MovieList[2][2][1] = {
	video = "Interface\\Cinematics\\WOW_Intro_BC_800"
};
MovieList[2][2][2] = {
	video = "Interface\\Cinematics\\WOW_Intro_BC_1024"
};
MovieList[3] = { };
MovieList[3][1] = { };
MovieList[3][1][1] = {
	video = nil
};
MovieList[3][1][2] = {
	video = nil
};
MovieList[3][2] = { };
MovieList[3][2][1] = {
	video = "Interface\\Cinematics\\WOW_Intro_LK_800"
};
MovieList[3][2][2] = {
	video = "Interface\\Cinematics\\WOW_Intro_LK_1024"
};


function MovieFrame_OnLoad(self)
	self.version = GetClientExpansionLevel();
	if ( not IsMacClient() ) then
		MovieFrameSubtitleArea:Hide();
	end
end

function MovieFrame_PlayMovie(self, index)
	self.movieIndex = index;
	if ( not MovieList[self.version] or not MovieList[self.version][index] or not MovieList[self.version][index][self.resolution] ) then
		self:Hide();
		return;
	end
	if (not MovieList[self.version][index][self.resolution].video) then
		MovieFrame_PlayNextMovie(self);
		return;
	end
	if (self:StartMovie(MovieList[self.version][index][self.resolution].video, MovieVolumeList[self.version])) then
		StopLoginMusic();
		--StopGlueMusic();
		StopGlueAmbience();
		return;
	end
	if (self:StartMovie(MovieList[self.version][index][1].video, MovieVolumeList[self.version])) then
		StopLoginMusic();
		--StopGlueMusic();
		StopGlueAmbience();
		return;
	end
	MovieFrame_PlayNextMovie(self);
end

function MovieFrame_PlayNextMovie(self)
	self:StopMovie();
	MovieFrame_PlayMovie(self, self.movieIndex + 1);
end

function MovieFrame_OnShow(self)
	self:EnableSubtitles(GetCVarBool("movieSubtitle"));
	HideCursor();
	if ( GetMovieResolution() < 1024 ) then
		self.resolution = 1;	-- Low resolution
	else
		self.resolution = 2;	-- High resolution
	end
	MovieFrame_PlayMovie(self, 1);
end

function MovieFrame_OnHide(self)
	MovieFrameSubtitleString:Hide();
	self:StopMovie();
	SetGlueScreen("login");
	ShowCursor();
end

function MovieFrame_OnUpdate(self, elapsed)
	if ( MovieFrameSubtitleString:IsShown() and self.fadingAlpha ) then
		self.fadingAlpha = self.fadingAlpha + ((elapsed / self.fadeSpeed) * self.fadeDirection);
		if ( self.fadingAlpha > 1.0 ) then
			MovieFrameSubtitleString:SetAlpha(1.0);
			self.fadingAlpha = nil;
		elseif ( self.fadingAlpha < 0.0 ) then
			MovieFrameSubtitleString:Hide();
			self.fadingAlpha = nil;
		else
			MovieFrameSubtitleString:SetAlpha(self.fadingAlpha);
		end
	end
end

function MovieFrame_OnKeyUp(self, key)
	if ( key == "ESCAPE" ) then
		self:Hide();
	elseif ( key == "SPACE" or key == "ENTER" ) then
		self:StopMovie();
	end
end

function MovieFrame_OnMovieFinished(self)
	if ( self:IsShown() ) then
		MovieFrame_PlayNextMovie(self);
	end
end

function MovieFrame_OnMovieShowSubtitle(self, text)
	MovieFrameSubtitleString:SetText(text);
	MovieFrameSubtitleString:Show();
	self.fadingAlpha = 0.0;
	self.fadeDirection = 1.0;
	self.fadeSpeed = MOVIE_CAPTION_FADE_TIME;
	MovieFrameSubtitleString:SetAlpha(self.fadingAlpha);
end

function MovieFrame_OnMovieHideSubtitle(self)
	self.fadingAlpha = 1.0;
	self.fadeDirection = -1.0;
	self.fadeSpeed = MOVIE_CAPTION_FADE_TIME / 2;
	MovieFrameSubtitleString:SetAlpha(self.fadingAlpha);
end

