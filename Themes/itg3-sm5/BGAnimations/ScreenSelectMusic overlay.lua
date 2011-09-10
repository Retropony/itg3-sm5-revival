local t = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_sides"))..{
		InitCommand=cmd(ztest,true);
	};
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_base"));
	Def.ActorFrame{
		Name="SelButtonMenu";
	};
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_expandtop"))..{
		--InitCommand=cmd(draworder,200);
	};
};

return t;