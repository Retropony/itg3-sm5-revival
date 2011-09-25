return Def.ActorFrame{
	--[[
	LoadActor("openitg")..{
		InitCommand=cmd(x,SCREEN_LEFT-15;y,SCREEN_CENTER_Y-SCREEN_HEIGHT/2.8;zoom,.65;);
	};
	--]]
	LoadActor("sm5")..{
		InitCommand=cmd(x,SCREEN_LEFT+192;y,SCREEN_CENTER_Y+12;zoom,.65;);
	};
	LoadActor("bxrx")..{
		InitCommand=cmd(x,SCREEN_RIGHT-SCREEN_WIDTH/3.3;y,SCREEN_BOTTOM-150;zoom,.6;);
	};
	LoadActor("itg")..{
		InitCommand=cmd(x,SCREEN_RIGHT-SCREEN_WIDTH/3;y,SCREEN_TOP+100;zoom,.7;);
	};

	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffusealpha,1;);
		OnCommand=cmd(sleep,0.1;accelerate,0.5;diffusealpha,0);
	};
	LoadActor(THEME:GetPathB("ScreenAttract","overlay"));
};