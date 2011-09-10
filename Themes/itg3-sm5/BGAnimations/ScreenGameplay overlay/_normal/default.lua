local t = Def.ActorFrame{
	LoadFont()..{
		InitCommand=cmd();
		OnCommand=cmd();
		OffCommand=cmd();
	};
	LoadFont()..{
		InitCommand=cmd();
		OnCommand=cmd();
		OffCommand=cmd();
	};
	Def.ActorFrame{
		-- song meter display
	};
	Def.ActorFrame{
		OnCommand=cmd(addy,-100;sleep,0.5;queuecommand,"TweenOn");
		OffCommand=cmd(queuecommand,"TweenOff");
		TweenOnCommand=cmd(decelerate,0.8;addy,100);
		-- todo: full combo
		TweenOffCommand=cmd(accelerate,0.8;addy,-100);

		LoadActor("_uplight")..{
			InitCommand=cmd(CenterX;y,SCREEN_TOP+24;diffusealpha,0;);
			OnCommand=cmd(sleep,1.8;linear,.4;diffusealpha,1;diffuse,color("#00EAFF"));
		};
		LoadActor("_uplight")..{
			InitCommand=cmd(CenterX;y,SCREEN_TOP+24;diffusealpha,0;blend,Blend.Add);
			OnCommand=cmd(sleep,1.8;linear,.4;diffusealpha,1;diffuse,color("#00EAFF"));
		};
		LoadActor("width")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-190;y,SCREEN_TOP+24;halign,1);
			OnCommand=cmd(sleep,1.5;linear,.1;zoomtowidth,SCREEN_WIDTH/2-200);
		};
		LoadActor("width")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+190;y,SCREEN_TOP+24;halign,0);
			OnCommand=cmd(sleep,1.5;linear,.1;zoomtowidth,SCREEN_WIDTH/2-200);
		};
		LoadActor("left")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-193;y,SCREEN_TOP+24;halign,0);
			OnCommand=cmd(sleep,1.5;linear,.1;x,SCREEN_LEFT+16);
		};
		LoadActor("right")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+193;y,SCREEN_TOP+24;halign,1);
			OnCommand=cmd(sleep,1.5;linear,.1;x,SCREEN_RIGHT-16);
		};
		LoadActor("base")..{ InitCommand=cmd(CenterX;y,SCREEN_TOP+24); };
		LoadActor("_neons")..{
			InitCommand=cmd(CenterX;y,SCREEN_TOP+24;blend,Blend.Add);
			OnCommand=cmd(effectclock,'beat';diffuseramp;effectcolor1,color("#007892");effectcolor2,color("#00EAFF");effectperiod,0.5;effectdelay,0.5;effectoffset,0.05;diffusealpha,0;linear,.4;diffusealpha,1;);
		};
		LoadActor("_neons")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+24);
			OnCommand=cmd(effectclock,'beat';diffuseramp;effectcolor1,color("#FFFFFF00");effectcolor2,color("#00EAFF");effectperiod,0.5;effectdelay,0.5;effectoffset,0.05;diffusealpha,0;linear,.4;diffusealpha,1;);
		};
		LoadFont("_r bold 30px")..{
			InitCommand=cmd(CenterX;y,SCREEN_TOP+24;maxwidth,540;diffusebottomedge,color("#dedede"));
			OnCommand=cmd(addy,3;zoom,.5;shadowlength,2;zoomy,0;sleep,2;decelerate,0.3;zoomy,.45;animate,0;playcommand,"Update");
			CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
			UpdateCommand=function(self)
				self:settext("under construction!");
			end;
		};
	};

	-- difficulty
	Def.ActorFrame{
		OnCommand=cmd(sleep,0.5;queuecommand,"TweenOn");
		OffCommand=cmd(queuecommand,"Hide");
		--ShowGameplayTopFrameMessageCommand="playcommand,TweenOn"
		--HideGameplayTopFrameMessageCommand="queuecommand,Hide"
		HideCommand=function(self)
			--if AnyPlayerFullComboed() then self:sleep(3) end
			self:queuecommand('TweenOff')
		end;

		Def.ActorFrame{
			Name="Player1";
			OnCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-240;y,SCREEN_TOP+29;addx,-SCREEN_WIDTH/3);
			TweenOnCommand=cmd(sleep,1.5;decelerate,0.5;addx,SCREEN_WIDTH/3);
			TweenOffCommand=cmd(accelerate,0.8;addx,-SCREEN_WIDTH/3);

			LoadActor(THEME:GetPathG("_difficulty","icons"))..{
				InitCommand=cmd(pause;playcommand,"Update");
				UpdateCommand=function(self)
					local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
					if steps then
						self:visible(true)
						self:setstate(DifficultyToState(steps:GetDifficulty()))
					else
						self:visible(false)
					end
				end;
			};
			-- stepsdisplay
		};

		Def.ActorFrame{
			Name="Player2";
			OnCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+240;y,SCREEN_TOP+29;addx,SCREEN_WIDTH/3);
			TweenOnCommand=cmd(sleep,1.5;decelerate,0.5;addx,-SCREEN_WIDTH/3);
			TweenOffCommand=cmd(accelerate,0.8;addx,SCREEN_WIDTH/3);

			LoadActor(THEME:GetPathG("_difficulty","icons"))..{
				InitCommand=cmd(pause;zoomx,-1;playcommand,"Update");
				UpdateCommand=function(self)
					local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
					if steps then
						self:visible(true)
						self:setstate(DifficultyToState(steps:GetDifficulty()))
					else
						self:visible(false)
					end
				end;
			};
			-- stepsdisplay
		};
	};
};

return t;