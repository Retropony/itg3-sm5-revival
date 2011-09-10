local t = Def.ActorFrame{
	LoadActor("_top")..{
		InitCommand=cmd(Center;FullScreen;diffusealpha,0;);
		OnCommand=cmd(accelerate,0.3;diffusealpha,1);
	};
	LoadActor("_shadow")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-94;);
		OnCommand=cmd(linear,1;y,SCREEN_CENTER_Y-61);
	};
	LoadActor("_banner mask")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-77;zbuffer,true;blend,'BlendMode_NoEffect');
		OnCommand=cmd(linear,1;y,SCREEN_CENTER_Y-44);
	};
	-- song/course banner
	LoadActor("_banner glass")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-77;);
		OnCommand=cmd(linear,1;y,SCREEN_CENTER_Y-44);
	};
	LoadActor(THEME:GetPathB("ScreenStageInformation","background/_flares"))..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,1;zoom,1;linear,1;rotationz,250;diffusealpha,0);
	};
};

return t;