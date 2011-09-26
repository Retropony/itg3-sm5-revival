function SongMods()
	-- oitg: 19|tournament, 20|showstats, 22|orientation, 23|playfield, 25|screenfilter, 27|timingscale

	--[[
	if OPENITG then 
		if GAMESTATE:GetPlayMode() == PLAY_MODE_REGULAR and not GAMESTATE:PlayerUsingBothSides() then
			--normal gameplay, no doubles
			return "22,23,10,11,[12,13,14,15],19,25,20,27,24"
		elseif  GAMESTATE:GetPlayMode() == PLAY_MODE_REGULAR and GAMESTATE:PlayerUsingBothSides() then
			--normal play, doubles
			return "23,10,11,[12,13,14,15],19,25,20,27,24"
		elseif GAMESTATE:GetPlayMode() == PLAY_MODE_NONSTOP then
			--course
			return "22,23,[12,13,14,15],19,21,27,24"
		else
			--"survival/fallback"
			return "10,11,[12,13,14,15]" end
	else
		--not running oitg
		return "10,11,[12,13,14,15]"
	end
	--]]
	-- shared begin
	local options = "1,2,3A,3B,4,7,5,18,17,9,"
	-- differences
	
	-- next shared
	options = options .. "12,13,14,15,"
	-- differences
	
	-- ends on 16:
	options = options .. "16"
	return options
end

function InitOptions()
	-- tournament
	setenv("HideScoreP1",false)
	setenv("HideScoreP2",false)
	setenv("HideComboP1",false)
	setenv("HideComboP2",false)
	setenv("HideLifeP1",false)
	setenv("HideLifeP2",false)

	-- stats display
	setenv("StatsDisplayP1",false)
	setenv("StatsDisplayP2",false)
	-- screen filter
	setenv("ScreenFilterP1",0)
	setenv("ScreenFilterP2",0)
end

--[[ option rows ]]

-- tournament options
function OptionTournamentOptions()
	local t = {
		Name="TournamentOptions",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectMultiple",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { "Hide Score", "Hide Combo", "Hide Lifebar" },
		LoadSelections = function(self, list, pn)
			local pNum = (pn == PLAYER_2 and 2 or 1)
			pNum = string.format("P%i",pNum)
			list[1] = getenv("HideScore"..pNum)
			list[2] = getenv("HideCombo"..pNum)
			list[3] = getenv("HideLife"..pNum)
		end,
		SaveSelections = function(self, list, pn)
			local pNum = (pn == PLAYER_2 and 2 or 1)
			pNum = string.format("P%i",pNum)
			setenv("HideScore"..pNum,list[1])
			setenv("HideCombo"..pNum,list[2])
			setenv("HideLife"..pNum,list[3])
		end,
	}
	setmetatable(t, t)
	return t
end

-- stats display
function OptionShowStats()
	local t = {
		Name="IngameStats",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectMultiple",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { "Show Ingame Statistics" },
		LoadSelections = function(self, list, pn)
			local pNum = (pn == PLAYER_2 and 2 or 1)
			local optName = string.format("StatsDisplayP%i",pNum)
			list[1] = getenv(optName)
		end,
		SaveSelections = function(self, list, pn)
			local pNum = (pn == PLAYER_2 and 2 or 1)
			local optName = string.format("StatsDisplayP%i",pNum)
			setenv(optName,list[1])
		end
	}
	setmetatable(t, t)
	return t
end

-- mods display
function OptionShowModifiers()
	local t = {
		Name="ShowModifiers",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectMultiple",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { "Show Active Modifiers" },
		LoadSelections = function(self, list, pn)
			--list[1] = CustomMods[pn].showmods
		end,
		
		SaveSelections = function(self, list, pn)
			--CustomMods[pn].showmods = list[1]
		end
	}
	setmetatable(t, t)
	return t
end

-- "DarkLink's Custom Mods"
-- ...great, do I even want to port this shit? -f

-- screen filter a la sm-ssc!
function OptionRowScreenFilter()
	local t = {
		Name="ScreenFilter",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { 'Disabled', 'Dark', 'Darker', 'Darkest', 'Wesley Snipes' },
		LoadSelections = function(self, list, pn)
			local pName = ToEnumShortString(pn)
			local filterValue = getenv("ScreenFilter"..pName)
			if filterValue ~= nil then
				local val = 1
				if filterValue == 0.5 then val = 2
				elseif filterValue == 0.65 then val = 3
				elseif filterValue == 0.85 then val = 4
				elseif filterValue == 1.0 then val = 5
				end
				list[val] = true
			else
				setenv("ScreenFilter"..pName,0)
				list[1] = true
			end
		end,
		SaveSelections = function(self, list, pn)
			local pName = ToEnumShortString(pn)
			local val = 0
			if list[1] then val = 0
			elseif list[2] then val = 0.5
			elseif list[3] then val = 0.65
			elseif list[4] then val = 0.85
			elseif list[5] then val = 1.0
			end
			setenv("ScreenFilter"..pName,val)
		end,
	};
	setmetatable(t, t)
	return t
end