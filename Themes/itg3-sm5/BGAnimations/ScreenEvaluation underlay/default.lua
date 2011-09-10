local t = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_base"))..{
		OnCommand=cmd();
		SlowCommand=cmd(SetUpdateRate,1.5);
	};
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_sides"))..{
		OnCommand=cmd();
		SlowCommand=cmd(SetUpdateRate,1.5);
	};
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_expandtop"))..{
		OnCommand=cmd();
		SlowCommand=cmd(SetUpdateRate,1.5);
	};

	LoadActor("evaluation banner mask")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+135;zbuffer,true;blend,'BlendMode_NoEffect';diffusealpha,0;);
		OnCommand=cmd(sleep,2.8;diffusealpha,1);
		OffCommand=cmd(stoptweening;linear,0.2;diffusealpha,0);
	};
	-- light
	-- modsframe x2
	-- trapezoid
	-- custom mods p1/p2
	-- detail labels
};

return t;