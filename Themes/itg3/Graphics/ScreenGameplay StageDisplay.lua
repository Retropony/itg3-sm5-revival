local curStage = ToEnumShortString(GAMESTATE:GetCurrentStage())
return Def.ActorFrame{
	LoadActor(THEME:GetPathG("_gameplay","stage "..curStage));
};