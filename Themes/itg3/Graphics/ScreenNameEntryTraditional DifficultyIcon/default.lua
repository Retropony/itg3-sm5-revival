local Player = ...
if not Player then error("[ScreenNameEntryTraditional DifficultyIcon] needs player.") end

-- DifficultyToFrame
local DifficultyToFrame = {
	['Difficulty_Beginner']		= 0,
	['Difficulty_Easy']			= 1,
	['Difficulty_Medium']		= 2,
	['Difficulty_Hard']			= 3,
	['Difficulty_Challenge']	= 4,
	['Difficulty_Edit']			= 5
}

return LoadActor("DifficultyIcon")..{
	InitCommand=cmd(animate,false),
	BeginCommand=cmd(playcommand,"Set"),
	SetCommand=function(self)
		if GAMESTATE:IsCourseMode() then
			-- derive from trail difficulty in course mode
			local trail = GAMESTATE:GetCurrentTrail(Player)
			local difficulty = trail:GetDifficulty()
			self:setstate(DifficultyToFrame[difficulty])
		else
			-- derive from steps difficulty in normal mode

			-- todo: this is hardcoded bullshit
			self:setstate(math.random(1,6)-1)
		end
	end,
}
