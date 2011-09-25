return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenSelectMusic","background/CJ126"))..{
		InitCommand=cmd(Center;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_WIDTH/4*3);
	};
}
