local Player = ...
if not Player then error("[ScreenNameEntryTraditional Score] score needs player badly") end

local machineProfile = PROFILEMAN:GetMachineProfile()

-- xxx: this is a PercentageDisplay in the hardcoded version
return LoadFont("_r bold numbers")..{
	BeginCommand=cmd(diffuse,PlayerColor(Player)),
	ChangeDisplayedFeatMessageCommand=function(self,param)
		if param.Player == Player then
			-- STATSMAN:GetStagesPlayed()

			--local highScoreList
			if GAMESTATE:IsCourseMode() then
				-- highscore
				local hsl = machineProfile:GetHighScoreListIfExists(GAMESTATE:GetCurrentCourse(),GAMESTATE:GetCurrentTrail(Player))
				local highScores = hsl:GetHighScores()

				self:settext("0.00%")
			else
				local stagesAgo = (STATSMAN:GetStagesPlayed() - (param.NewIndex-1))
				local playedSS = STATSMAN:GetPlayedStageStats(stagesAgo)
				local playerSS = playedSS:GetPlayerStageStats(Player)
				local songs = playedSS:GetPlayedSongs()
				local steps = playerSS:GetPlayedSteps()

				self:settext("0.00%")
			end
		end
	end,
}
