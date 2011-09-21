return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+120;diffuse,color("#00000000");zoomto,SCREEN_WIDTH,SCREEN_HEIGHT/2;);
		OnCommand=cmd(sleep,0;linear,0.5;diffusealpha,1;y,SCREEN_CENTER_Y+158;);
	};
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-120;diffuse,color("#00000000");zoomto,SCREEN_WIDTH,SCREEN_HEIGHT/2;);
		OnCommand=cmd(sleep,0;linear,0.5;diffusealpha,1;y,SCREEN_CENTER_Y-158;);
	};
	LoadActor("lolhi")..{
		InitCommand=cmd(Center;zoomx,SCREEN_WIDTH;zoomy,.68;);
		OnCommand=cmd(linear,0.2;zoomy,0);
	};
	LoadFont("_z 36px shadowx")..{
		Text="LOADING...";
		InitComand=cmd(x,SCREEN_CENTER_X+42;CenterY;);
		OnCommand=cmd(linear,0.2;diffuse,color("0,0,0,0"));
	};
};