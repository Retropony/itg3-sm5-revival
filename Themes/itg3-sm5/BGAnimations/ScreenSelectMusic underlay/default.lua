local mask = GAMESTATE:IsCourseMode() and "_course banner mask" or "_banner mask"

local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_TOP-100;z,2;zwrite,1;blend,'BlendMode_NoEffect';valign,0;zoomto,SCREEN_WIDTH,69);
		OnCommand=cmd(decelerate,0.8;y,SCREEN_TOP);
		OffCommand=cmd(accelerate,0.5;addy,-100);
	};
	Def.Quad{
		InitCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_TOP-100;z,2;zwrite,true;blend,'BlendMode_NoEffect';valign,0;zoomto,260,77);
		OnCommand=cmd(decelerate,0.8;y,SCREEN_TOP);
		OffCommand=cmd(accelerate,0.5;addy,-100);
	};
	LoadActor(mask)..{
		InitCommand=cmd(x,SCREEN_CENTER_X+140;y,SCREEN_CENTER_Y-20;z,2;zwrite,true;blend,'BlendMode_NoEffect';);
		OnCommand=cmd(addx,SCREEN_WIDTH;decelerate,0.75;addx,-SCREEN_WIDTH);
		OffCommand=cmd(accelerate,0.75;addx,SCREEN_WIDTH);
	};
};

return t;