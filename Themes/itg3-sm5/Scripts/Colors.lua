function PlayerColor( pn )
	if pn == PLAYER_1 then return color("#FFDE00") end	-- oranged yellow
	if pn == PLAYER_2 then return color("#14FF00") end	-- green
	return color("1,1,1,1")
end

function DiffusePlayerColor( pn )
	if pn == PLAYER_1 then return color("#FFDE00") end	-- oranged yellow
	if pn == PLAYER_2 then return color("#14FF00") end	-- green
	return color("1,1,1,1")
end

function ContrastingDifficultyColor( dc )
	if dc == "Beginner"		then return color("#E2ABF5") end
	if dc == "Easy"			then return color("#B2FFB5") end
	if dc == "Medium"		then return color("#F2F2AA") end
	if dc == "Hard"			then return color("#EBA4AB") end
	if dc == "Challenge"	then return color("#AADCF2") end
	if dc == "Edit"			then return color("#F7F7F7") end
	return color("1,1,1,1")
end