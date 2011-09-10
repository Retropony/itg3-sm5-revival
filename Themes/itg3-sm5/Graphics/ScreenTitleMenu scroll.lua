local gc = Var("GameCommand");

return Def.ActorFrame{
	LoadFont("_ScreenTitleMenu choices")..{
		InitCommand=cmd(settext,gc:GetText();halign,1);
		GainFocusCommand=cmd(diffuseshift;effectperiod,2;effectcolor1,color("#01DE20");effectcolor2,color("1,1,1,0");effectclock,'beat';zoom,0.8;);
		LoseFocusCommand=cmd(stoptweening;stopeffect;zoom,0.7);
		DisabledCommand=cmd(diffuse,color("0.5,0.5,0.5,1"));
	};
};