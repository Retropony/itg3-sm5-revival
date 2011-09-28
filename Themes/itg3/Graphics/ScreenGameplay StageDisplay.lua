local stageRemap = {
	Stage_1st	= 1, Stage_2nd	= 2, Stage_3rd	= 3,
	Stage_4th	= 4, Stage_5th	= 5, Stage_6th	= 6
}

return Def.ActorFrame{
	Def.Sprite{
		InitCommand=function(self)
			local curStage = GAMESTATE:GetCurrentStage()

			local songsPerPlay = PREFSMAN:GetPreference("SongsPerPlay")
			if stageRemap[curStage] == songsPerPlay then
				curStage = 'Stage_Final'
			end
			if GAMESTATE:IsEventMode() then curStage = 'Stage_Event' end

			curStage = ToEnumShortString(curStage)
			self:Load(THEME:GetPathG("_gameplay","stage "..curStage))
		end;
	};
};