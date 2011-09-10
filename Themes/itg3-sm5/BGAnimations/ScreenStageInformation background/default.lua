local t = Def.ActorFrame{
	LoadActor("top");
	-- bottom
	LoadActor("highlight")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+5;y,SCREEN_CENTER_Y+60;);
		OnCommand=cmd(diffusealpha,0;decelerate,0.2;diffusealpha,1);
	};
	Def.ActorFrame{
		Name="P1Frame";
		InitCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_1));
		LoadActor("_left gradient")..{ InitCommand=cmd(x,SCREEN_LEFT;y,SCREEN_CENTER_Y+150;halign,0); };
		LoadActor("_p1")..{ InitCommand=cmd(x,SCREEN_LEFT;y,SCREEN_CENTER_Y+150;halign,0); };
	};
	Def.ActorFrame{
		Name="P2Frame";
		InitCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_2));
		LoadActor("_right gradient")..{ InitCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y+150;halign,1); };
		LoadActor("_p2")..{ InitCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y+150;halign,1); };
	};
};

return t;