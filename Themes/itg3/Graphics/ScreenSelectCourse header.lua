local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_dynamic","headers/SelectCourse"))..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP+30;);
		OnCommand=cmd(zoom,1.3;);
	};
	LoadFont("_z bold gray 36px")..{
		Text="COURSE SELECTION";
		InitCommand=cmd(x,SCREEN_RIGHT-20;y,SCREEN_TOP+28;shadowlength,2;halign,1;zoom,.5;cropright,1.3;faderight,0.1;);
		OnCommand=cmd(sleep,.2;linear,0.8;cropright,-0.3);
	};
};

return t;