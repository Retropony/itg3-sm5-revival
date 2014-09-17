local Player = ...
if not Player then error("[ScreenNameEntryTraditional DifficultyIcon] needs player.") end

return LoadActor("DifficultyIcon")..{
	InitCommand=cmd(animate,false),
	BeginCommand=cmd(playcommand,"Set"),
	SetCommand=function(self)
		if GAMESTATE:IsCourseMode() then
			-- derive from trail difficulty in course mode
		else
			-- derive from steps difficulty in normal mode
		end
	end,
}
