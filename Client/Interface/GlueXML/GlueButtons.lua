SECONDS_PER_PULSE = 0.75;

function GlueButtonMaster_OnUpdate(self, elapsed)
	if VX_MUSICTIMER then
		if VX_MUSICTIMER < GetTime() then
			VX_ONMUSIC = nil;
			PlayLoginMusic();
		end
	end

	if ( _G[self:GetName().."Rays"]:IsShown() ) then
		local SECONDS_PER_PULSE = 0.75;
		local sign = self.pulseSign;
		local counter;
		
		if ( self.startPulse ) then
			counter = 0;
			self.startPulse = nil;
			sign = 1;
		else
			counter = self.pulseCounter + (sign * elapsed);
			if ( counter > SECONDS_PER_PULSE ) then
				counter = SECONDS_PER_PULSE;
				sign = -sign;
			elseif ( counter < 0) then
				counter = 0;
				sign = -sign;
			end
		end
		
		local alpha = counter / SECONDS_PER_PULSE;
		_G[self:GetName().."Rays"]:SetVertexColor(1.0, 1.0, 1.0, alpha);

		self.pulseSign = sign;
		self.pulseCounter = counter;
	end
end
