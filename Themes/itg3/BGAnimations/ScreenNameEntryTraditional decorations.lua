-- name entry decorations
local t = LoadFallbackB()

-- Out of Ranking
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	local MetricsName = "OutOfRanking" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenNameEntryTraditional","OutOfRanking"))..{
		InitCommand=function(self)
			self:player(pn)
			self:name(MetricsName)
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
		end
	}
end

-- Keyboard

-- Selection (Entered name)

-- Wheel
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	local MetricsName = "Wheel" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenNameEntryTraditional","Wheel"),pn)..{
		InitCommand=function(self)
			self:player(pn)
			self:name(MetricsName)
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
		end
	}
end

-- Score
--[[
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	local MetricsName = "Score" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenNameEntryTraditional","Score"),pn)..{
		InitCommand=function(self)
			self:player(pn)
			self:name(MetricsName)
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
		end
	}
end
--]]

-- Grade

-- DifficultyIcon
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	local MetricsName = "DifficultyIcon" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenNameEntryTraditional","DifficultyIcon"),pn)..{
		InitCommand=function(self)
			self:player(pn)
			self:name(MetricsName)
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
		end
	}
end

-- DifficultyDisplay

-- Banner
t[#t+1] = StandardDecorationFromFile("Banner","Banner")

return t