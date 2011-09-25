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
	local options = "1,2,3,4,7,5,18,17,9,"
	-- differences
	
	-- next shared
	options = options .. "12,13,14,15,"
	-- differences
	
	-- ends on 16:
	options = options .. "16"
	return options
end