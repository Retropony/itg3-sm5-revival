local t = Def.ActorFrame{
	LoadActor(GetSongFrame());

	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1"));
		OnCommand=cmd(linear,0.3;diffusealpha,0);
	};

	Def.ActorFrame{
		Name="ScreenStageHoldovers";
		InitCommand=cmd(visible,not GAMESTATE:IsDemonstration() and not GAMESTATE:IsCourseMode());

		LoadActor(THEME:GetPathB("ScreenStageInformation","background/bottom/bar"))..{
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+156;zoomtowidth,SCREEN_WIDTH;faderight,.8;fadeleft,.8;);
			OnCommand=cmd(sleep,2.25;cropright,0;linear,.6;cropleft,1);
		};
		Def.ActorFrame{
			Name="InfoP1";
			InitCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_1));
			-- stage background left gradient
			LoadActor(THEME:GetPathB("ScreenStageInformation","background/_left gradient"))..{
				InitCommand=cmd(x,SCREEN_LEFT;y,SCREEN_CENTER_Y+150;horizalign,left;);
				OnCommand=cmd(sleep,1;linear,1;diffusealpha,0;);
			};
			-- stage background p1
			LoadActor(THEME:GetPathB("ScreenStageInformation","background/_p1"))..{
				InitCommand=cmd(x,SCREEN_LEFT;y,SCREEN_CENTER_Y+150;horizalign,left;);
				OnCommand=cmd(sleep,1;linear,1;diffusealpha,0;);
			};
			-- step artist p1
			-- step desc p1
			-- player name p1
		};
		Def.ActorFrame{
			Name="InfoP2";
			InitCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_2));
			-- stage background right gradient
			LoadActor(THEME:GetPathB("ScreenStageInformation","background/_right gradient"))..{
				InitCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y+150;horizalign,right;);
				OnCommand=cmd(sleep,1;linear,1;diffusealpha,0;);
			};
			-- stage background p2
			LoadActor(THEME:GetPathB("ScreenStageInformation","background/_p2"))..{
				InitCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y+150;horizalign,right;);
				OnCommand=cmd(sleep,1;linear,1;diffusealpha,0;);
			};
			-- step artist p2
			-- step desc p2
			-- player name p2
		};
	};

	LoadFont("_r bold 30px")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+147;maxwidth,SCREEN_WIDTH/8*7;shadowlength,2;horizalign,center;zoom,.5;diffusealpha,1;);
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			local text
			if song then
				text = song:GetDisplayFullTitle()
			else
				text = ""
			end
			self:settext(text)
		end;
		OnCommand=cmd(playcommand,"Set";sleep,1.5;linear,1;diffusealpha,0;);
	};
	LoadFont("_r bold 30px")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+167;maxwidth,SCREEN_WIDTH/8*6.8;shadowlength,2;horizalign,center;zoom,.4;diffusealpha,1;);
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			local text
			if song then
				text = song:GetDisplayArtist()
			else
				text = ""
			end
			self:settext(text)
		end;
		OnCommand=cmd(playcommand,"Set";sleep,1.5;linear,1;diffusealpha,0;);
	};

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