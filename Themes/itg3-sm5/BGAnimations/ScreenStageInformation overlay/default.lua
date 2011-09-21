local t = Def.ActorFrame{
	-- stage text

	-- tutorial

	-- courses

	LoadActor("blueflare")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+12.5;blend,Blend.Add;draworder,115);
		OnCommand=cmd(zoomx,15;zoomtoheight,SCREEN_HEIGHT+SCREEN_HEIGHT/4;linear,1;zoomtoheight,0;diffusealpha,.0);
	};
};

return t;