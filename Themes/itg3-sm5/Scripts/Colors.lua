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