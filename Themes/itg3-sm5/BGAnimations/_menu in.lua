return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+158;diffuse,color("#000000FF");zoomto,SCREEN_WIDTH,SCREEN_HEIGHT/2;);
		OnCommand=cmd(sleep,0;linear,0.2;diffusealpha,0;zoomtoheight,SCREEN_HEIGHT/1.5);
	};
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-158;diffuse,color("#00000000");zoomto,SCREEN_WIDTH,SCREEN_HEIGHT/2;);
		OnCommand=cmd(sleep,0;linear,0.2;diffusealpha,0;zoomtoheight,SCREEN_HEIGHT/1.5);
	};
	LoadActor("lolhi")..{
		InitCommand=cmd(Center;zoomx,SCREEN_WIDTH;zoomy,0;);
		OnCommand=cmd(linear,.5;zoomy,.68);
	};
	LoadFont("_z 36px shadowx")..{
		Text="LOADING...";
		InitComand=cmd(x,SCREEN_CENTER_X+42;CenterY;cropright,1.3;faderight,0.1;zoom,.7);
		OnCommand=cmd(sleep,0.2;linear,0.5;cropright,-0.3);
	};
	LoadActor("_disk")..{ InitCommand=cmd(x,SCREEN_CENTER_X-80;CenterY;spin;diffusealpha,1;); };
};