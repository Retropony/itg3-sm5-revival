return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+158;diffuse,color("#000000FF");zoomto,SCREEN_WIDTH,SCREEN_HEIGHT/2;);
	};
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-158;diffuse,color("#000000FF");zoomto,SCREEN_WIDTH,SCREEN_HEIGHT/2;);
	};
	LoadActor("lolhi")..{
		InitCommand=cmd(Center;zoomx,SCREEN_WIDTH;zoomy,.68);
	};
	LoadFont("_z 36px shadowx")..{
		Text="LOADING PROFILES...";
		InitCommand=cmd(x,SCREEN_CENTER_X+42;CenterY;zoom,0.75);
	};
	LoadActor("_disk")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-120;CenterY;);
		OnCommand=cmd(spin;decelerate,0.2;addx,-56);
	};

	Def.Actor{
		BeginCommand=function(self)
			if SCREENMAN:GetTopScreen():HaveProfileToLoad() then self:sleep(1); end;
			self:queuecommand("Load");
		end;
		LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
	};
};