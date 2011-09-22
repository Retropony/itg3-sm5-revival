return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/back"))..{
		OnCommand=cmd(playcommand,"DoOn");
	};
	-- shared underlay arrows

	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X-128;y,SCREEN_CENTER_Y+5;z,-100;zoom,1.35);
		LoadActor("char")..{
			InitCommand=cmd(zoom,0.6;zbuffer,true;glow,color("1,1,1,0");diffusealpha,0;linear,0.3;glow,color("1,1,1,1");sleep,0.001;diffusealpha,1;linear,0.3;glow,color("1,1,1,0"));
			MadeChoiceP1MessageCommand=cmd(playcommand,"GoOff");
			MadeChoiceP2MessageCommand=cmd(playcommand,"GoOff");
			GoOffCommand=cmd(sleep,.2;linear,0.3;diffusealpha,0;);
		};
	};

	LoadActor(THEME:GetPathB("explanation","frame"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X-88;y,SCREEN_CENTER_Y+95;diffusealpha,0;);
		OnCommand=cmd(linear,0.5;diffusealpha,0.8);
		MadeChoiceP1MessageCommand=cmd(playcommand,"GoOff");
		MadeChoiceP2MessageCommand=cmd(playcommand,"GoOff");
		GoOffCommand=cmd(linear,0.5;diffusealpha,0);
	};

	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/fore"))..{
		OnCommand=cmd(playcommand,"DoOn");
	};
};