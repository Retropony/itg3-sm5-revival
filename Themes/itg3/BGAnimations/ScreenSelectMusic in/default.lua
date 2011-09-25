local t = Def.ActorFrame{
	LoadActor(THEME:GetPathB("_statsout","musicwheel"))..{
		InitCommand=cmd(visible,GAMESTATE:IsAnyHumanPlayerUsingMemoryCard());
	};
};

return t;