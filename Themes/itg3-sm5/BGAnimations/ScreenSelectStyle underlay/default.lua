return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_base"));
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_sides"));

	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y+13;z,-100;zoom,1.3);
		LoadActor("char")..{
			InitCommand=cmd(zoom,0.6;zbuffer,true;glow,color("1,1,1,0");diffusealpha,0;linear,0.3;glow,color("1,1,1,1");sleep,0.001;diffusealpha,1;linear,0.3;glow,color("1,1,1,0"));
			MadeChoiceP1MessageCommand=cmd(playcommand,"GoOff");
			MadeChoiceP2MessageCommand=cmd(playcommand,"GoOff");
			GoOffCommand=cmd(sleep,.2;linear,0.3;diffusealpha,0;);
		};
	};

	LoadActor(THEME:GetPathB("explanation","frame"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y+138;horizalign,center;diffusealpha,0;);
		OnCommand=cmd(linear,0.5;diffusealpha,0.8);
		MadeChoiceP1MessageCommand=cmd(playcommand,"GoOff");
		MadeChoiceP2MessageCommand=cmd(playcommand,"GoOff");
		GoOffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	-- shared underlay arrows
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_normaltop"));
};