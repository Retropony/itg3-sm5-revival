local Player = ...
if not Player then error("[ScreenNameEntryTraditional Score] score needs player badly") end

return LoadFont("_r bold numbers")..{
	BeginCommand=cmd(diffuse,PlayerColor(Player);playcommand,"Set"),
	SetCommand=function(self)
		-- get score for current song or whatever
		self:settext("00.00%")
	end,
}
