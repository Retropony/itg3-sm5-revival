local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_pane","elements/_length"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+20;y,SCREEN_CENTER_Y-34;valign,1;diffusealpha,0;ztest,true;zoom,.6;visible,not GAMESTATE:IsCourseMode());
		ShowCommand=cmd(stoptweening;linear,0.2;diffusealpha,1);
		HideCommand=cmd(stoptweening;linear,0.2;diffusealpha,0;);
		EnableSelectHelpMessageCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then
				self:queuecommand("Hide")
			else
				self:queuecommand("Show")
			end
		end;
		SelectMenuOffMessageCommand=cmd(queuecommand,"Show");
		CurrentSongChangedMessageCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then
				self:queuecommand("Hide")
			end
		end;
	};
	-- reflection
	LoadActor(THEME:GetPathG("_pane","elements/_length"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+20;y,SCREEN_CENTER_Y-34;valign,1;diffusealpha,0;ztest,true;zoomx,.6;zoomy,-.6;visible,not GAMESTATE:IsCourseMode());
		ShowCommand=cmd(stoptweening;linear,0.2;diffusealpha,1);
		HideCommand=cmd(stoptweening;linear,0.2;diffusealpha,0;);
		EnableSelectHelpMessageCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then
				self:queuecommand("Hide")
			else
				self:queuecommand("Show")
			end
		end;
		SelectMenuOffMessageCommand=cmd(queuecommand,"Show");
		CurrentSongChangedMessageCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then
				self:queuecommand("Hide")
			end
		end;
	};

	Def.ActorFrame{
		Name="Frame";
		LoadActor("frame")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+140;y,SCREEN_CENTER_Y-20);
			OnCommand=cmd(addx,SCREEN_WIDTH;decelerate,0.75;addx,-SCREEN_WIDTH);
			OffCommand=cmd(accelerate,0.75;addx,SCREEN_WIDTH);
		};
		LoadFont("_v 26px bold diffuse")..{
			Text="ARTIST:";
			InitCommand=cmd(x,SCREEN_CENTER_X+10;y,SCREEN_CENTER_Y-24);
			OnCommand=cmd(diffusealpha,1;shadowlength,2.5;zoom,.5;addx,SCREEN_WIDTH;decelerate,0.75;addx,-SCREEN_WIDTH);
			OffCommand=cmd(accelerate,0.75;addx,SCREEN_WIDTH);
		};
		LoadFont("_v 26px bold diffuse")..{
			Text="BPM:";
			InitCommand=cmd(x,SCREEN_CENTER_X+280;y,SCREEN_CENTER_Y-24);
			OnCommand=cmd(diffusealpha,1;shadowlength,2.5;zoom,.5;addx,SCREEN_WIDTH;decelerate,0.75;addx,-SCREEN_WIDTH);
			OffCommand=cmd(accelerate,0.75;addx,SCREEN_WIDTH);
		};
	};
};

return t;