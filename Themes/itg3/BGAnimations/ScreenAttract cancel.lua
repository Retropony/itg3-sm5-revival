return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(diffuse,color("#000000");stretchto,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM);
		OnCommand=cmd(diffusealpha,0;linear,0.5;diffusealpha,1);
	};
	LoadActor("updatecoin") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;blend,"BlendMode_Add");
		OnCommand=cmd(zoom,0;diffusealpha,0;rotationz,-20;linear,0.5;zoom,18;diffusealpha,1;rotationz,150);
	};
	LoadActor("updatecoin") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;blend,"BlendMode_Add");
		OnCommand=cmd(zoom,0;diffusealpha,0;rotationz,20;linear,0.5;zoom,18;diffusealpha,1;rotationz,-70);
	};
};
