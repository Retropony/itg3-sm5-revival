-- ScreenGameplay-related stuff

function OffsetLifebarHeight(pn)
	--[[
	if CustomMods[pn].left or CustomMods[pn].right then
		return SCREEN_CENTER_Y
	else
		return SCREEN_CENTER_Y+30
	end
	--]]
	return SCREEN_CENTER_Y+30
end

-- To be called wherever the lifebars are positioned
function GetLifebarAdjustment()
	--[[
	local lifetype = ProfileTable.LifebarAdjustment
	-- assume "coin" unless otherwise specified
	if not lifetype then return "0" end
	return lifetype
	--]]
	return "0"
end

-- Returns true if life is hidden, false otherwise; (for use in metrics.ini)
function HideLife(pn)
	--return CustomMods[pn].hidelife or false
	return false
end

local diffState = {
	Difficulty_Beginner = 0,
	Difficulty_Easy = 1,
	Difficulty_Medium = 2,
	Difficulty_Hard = 3,
	Difficulty_Challenge = 4,
	Difficulty_Expert = 5,
};
function DifficultyToState(diff)
	return diffState[diff]
end