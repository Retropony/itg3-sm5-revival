return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("#00000000"));
		OnCommand=cmd(linear,1.5;diffusealpha,1);
	};

	LoadActor("_stage")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-75;zoom,.6;diffusealpha,0;addy,-30;);
		OnCommand=cmd(sleep,0.1;linear,.3;diffusealpha,1;addy,30);
	};
	Def.ActorFrame{
		Name="NormalFail";
		InitCommand=cmd(visible,songfail(false));
		LoadActor("_failed text")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+2;y,SCREEN_CENTER_Y+30;diffusealpha,0;addx,-500;);
			OnCommand=cmd(sleep,0.4;decelerate,.7;addx,500;diffusealpha,1);
		};
	};
	Def.ActorFrame{
		Name="VertexFail";
		InitCommand=cmd(visible,songfail(true));
		LoadActor("v_failed")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+2;y,SCREEN_CENTER_Y+52;diffusealpha,.2;cropleft,.5;cropright,.5;);
			OnCommand=cmd(sleep,.7;decelerate,.75;cropright,0;cropleft,0;diffusealpha,1;);
		};
		-- lines.
	};

	-- n words

	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("#00000000"));
		OnCommand=cmd(sleep,3;linear,.3;diffusealpha,1);
	};
};