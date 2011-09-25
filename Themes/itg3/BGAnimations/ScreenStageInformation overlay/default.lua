local curStage = ToEnumShortString(GAMESTATE:GetCurrentStage())

local t = Def.ActorFrame{
	InitCommand=function(self)
		-- reset beginner stage
	end;

	Def.ActorFrame{
		Name="StageText";
		InitCommand=cmd(CenterX);
		Def.ActorFrame{
			Name="Main";
			InitCommand=cmd(y,SCREEN_CENTER_Y+60;);
			LoadActor(THEME:GetPathG("_gameplay","stage "..curStage))..{
				InitCommand=cmd(horizalign,center;cropright,1.3;);
				OnCommand=cmd(sleep,.22;linear,1;cropright,-0.3);
			};
			LoadActor(THEME:GetPathG("_white","gameplay stage "..curStage))..{
				InitCommand=cmd(horizalign,center;cropleft,-0.3;cropright,1;faderight,.1;fadeleft,.1;);
				OnCommand=cmd(sleep,.22;linear,1;cropleft,1;cropright,-0.3);
			};
		};
		Def.ActorFrame{
			Name="Reflect";
			InitCommand=cmd(y,SCREEN_CENTER_Y+86;);
			LoadActor(THEME:GetPathG("_gameplay","stage "..curStage))..{
				InitCommand=cmd(horizalign,center;rotationz,180;zoomx,-1;diffusealpha,0.6;fadetop,2;cropright,1.3;);
				OnCommand=cmd(linear,1.225;cropright,-0.3);
			};
		};
	};

	-- tutorial

	-- courses

	LoadActor("blueflare")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+12.5;blend,Blend.Add;draworder,115);
		OnCommand=cmd(zoomx,15;zoomtoheight,SCREEN_HEIGHT+SCREEN_HEIGHT/4;linear,1;zoomtoheight,0;diffusealpha,.0);
	};
};

return t;