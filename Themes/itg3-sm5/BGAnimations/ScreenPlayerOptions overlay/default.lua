local t = Def.ActorFrame{
	-- name p1
	-- name p2

	LoadActor(THEME:GetPathB("ScreenOptions","overlay/_frame"))..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,0;zoom,.7;bounceend,0.3;diffusealpha,.7;zoom,1);
	};
	LoadActor(THEME:GetPathB("ScreenOptions","overlay/_frame"))..{
		InitCommand=cmd(Center;blend,Blend.Add;);
		OnCommand=cmd(diffuseblink;effectcolor1,color("0.8,0.8,0.8,.85");effectdelay,.6;effectperiod,0.4;effectoffset,0.2;effectclock,'beat';diffusealpha,0;zoom,.7;bounceend,0.3;diffusealpha,1;zoom,1);
		OffCommand=cmd(diffusealpha,1;accelerate,0.3;diffusealpha,0);
	};

	Def.Quad{
		InitCommand=cmd(FullScreen;visible,false);
		OffCommand=cmd(visible,true;diffusealpha,0;linear,0.1;diffusealpha,1;sleep,0.2;linear,0.3;diffusealpha,0);
	};
	Def.Quad{
		InitCommand=cmd(FullScreen;);
		OnCommand=cmd(diffusealpha,1;sleep,.2;linear,0.4;diffusealpha,0);
		OffCommand=cmd(visible,false);
	};
};

return t;