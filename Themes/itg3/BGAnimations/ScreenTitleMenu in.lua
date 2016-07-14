local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;);
		OnCommand=cmd(linear,0.3;diffusealpha,0);
	};
	LoadActor(THEME:GetPathS("","_logo"))..{ OnCommand=cmd(play); };
};

return t;