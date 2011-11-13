return Def.ActorFrame{
	LoadActor("_fallback")..{ InitCommand=cmd(Center); };
	LoadActor("CJ126")..{
		InitCommand=cmd(Center;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_WIDTH/4*3);
		--OnCommand=cmd(sleep,1.9;linear,0.3;diffusealpha,0;);
	};
}
