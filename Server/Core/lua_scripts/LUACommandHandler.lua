local Comm = {}

--[[ Helper Functions BEGIN ]]

function Comm.IsAccountWhitelisted(accid, whitelist)
	-- Helper function to determine whether an account is whitelisted to use the specific command in question
    for _, v in pairs(whitelist) do
        if(v == accid) then
            return true;
        end
    end
    
    return false;
end

function Comm.SplitString(inputstr)
	-- Helper function to split a string into a table with each space separated string of the original string as its own value
	local t = {}
	local e, i = 0, 1
	
	while true do
		local b = e+1
		b = inputstr:find("%S", b)
		
		if b == nil then
			break
		end
		
		if inputstr:sub(b,b) == "'" then
			e = inputstr:find("'", b+1)
			b = b+1
		elseif inputstr:sub(b,b) == '"' then
			e = inputstr:find('"', b+1)
			b = b+1
		else
			e = inputstr:find("%s", b+1)
		end
		
		if e == nil then 
			e = #inputstr+1
		end

		t[i] = inputstr:sub(b,e-1)
		i = i + 1
	end
	
	return t
end

--[[ Helper Functions END ]]

--[[ Command Handler Functions BEGIN ]]

function Comm.HandleBuffCommand(comTable, player)
    for _, v in pairs(GetPlayersInWorld()) do
        v:CastSpell(v, 16609, true)
        v:CastSpell(v, 24425, true)
        v:CastSpell(v, 34410, true)
    end
end

function Comm.HandleGMTCommand(comTable, player)
		-- TODO: Execute Console Commands
end

function Comm.HandlePrintCommand(comTable, player)
	for _, v in pairs(comTable) do
		-- If player exists, send as broadcast messages as well
		if(player) then
			player:SendBroadcastMessage(v)
		end
		print(v)
	end
end

--[[ Command Handler Functions END ]]

--[[ Raw Handler Function BEGIN ]]

function Comm.Handler(event, player, command)
    local commandTable = Comm.SplitString(command)
	
    if(Comm["register"][commandTable[1]]) then
		if(player) then
			local security, whitelist = Comm["register"][commandTable[1]][2], Comm.IsAccountWhitelisted(player:GetAccountId(), Comm["register"][commandTable[1]][3])
        
			if(player:GetGMRank() >= security or whitelist == true) then
				Comm["register"][commandTable[1]][1](commandTable, player)
			else
				player:SendBroadcastMessage("You do not have access to that command!")
			end
		else -- Assume sent from console
			if(Comm["register"][commandTable[1]][2] >= 4) then
				Comm["register"][commandTable[1]][1](commandTable, nil)
			end
		end
		
        return false;
    end
end

--[[ Raw Handler Function END ]]

--[[ Registers BEGIN ]]

Comm.register = {
    --["commandname"] = {CommandFunction, SecurityLevel, {WhiteListAccIds}}
    ["worldbuff"] = {Comm.HandleBuffCommand, 1, {}},
	["print"] = {Comm.HandlePrintCommand, 0, {}},
	["gmt"] = {Comm.HandleGMTCommand, 1, {}},
}

RegisterPlayerEvent(42, Comm.Handler)

--[[ Registers END ]]