local t = Def.ActorFrame{
	LoadActor(GetSongFrame());

	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1"));
		OnCommand=cmd(linear,0.3;diffusealpha,0);
	};

	-- stage background bar
	-- stage background left gradient
	-- stage background right gradient
	-- stage background p1 gradient
	-- stage background p2 gradient
	-- step artist p1
	-- step artist p2
	-- step desc p1
	-- step desc p2
	-- player name p1
	-- player name p2

	-- song title
	-- song artist

	-- demo
	Def.ActorFrame{
		Name="DemonstrationFrame";
		BeginCommand=cmd(visible,GAMESTATE:IsDemonstration() and SCREENMAN:GetTopScreen():GetName() ~= 'ScreenJukebox');
		LoadActor(THEME:GetPathB("_metallic","streak"))..{
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+43;zoomtowidth,SCREEN_WIDTH);
			OnCommand=cmd(diffusealpha,.9;fadeleft,1;faderight,1);
		};
		LoadFont("_z 36px black")..{
			Text="DEMO";
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+43;zoom,.7;);
			OnCommand=cmd(pulse;effectmagnitude,1.0,0.95,0;effectclock,'beat';effectperiod,1);
		};
		LoadActor("demonstration gradient")..{
			InitCommand=cmd(Center;FullScreen;diffusealpha,0.8);
		};
	};
};

return t;