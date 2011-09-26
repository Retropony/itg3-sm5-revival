-- single stats
return Def.ActorFrame{
	InitCommand=function(self)
		local pn = GAMESTATE:GetMasterPlayerNumber()
		local x = SCREEN_CENTER_X
		self:x(x)
		self:y(SCREEN_CENTER_Y)
	end;
	Def.ActorFrame{
		Name="JudgePaneP1";
		BeginCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1));
		OnCommand=function(self)
			--self:x(SCREEN_WIDTH/4+(CustomMods[PLAYER_1].solo and 64 or 0));
			self:x(SCREEN_WIDTH/4);
			--self:y(CustomMods[PLAYER_1].solo and 34 or 0);
			self:y(0);
			--self:zoom(CustomMods[PLAYER_1].solo and .75 or 1)
			self:zoom(1)
			self:addx(SCREEN_WIDTH/2);
			self:decelerate(1);
			self:addx(-SCREEN_WIDTH/2);
		end;
		LoadActor("stats bg");

		Def.ActorFrame{
			OnCommand=cmd(addx,10);
			StepMessageCommand=function(self,p)
				if p.PlayerNumber == PLAYER_1 then
					-- stuff
					local holdDropCount = self:GetChild("HoldMiss")
					local mineCount = self:GetChild("Mine")
					local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
					mineCount:settext(pss:GetTapNoteScores('TapNoteScore_HitMine'))
					holdDropCount:settext(pss:GetHoldNoteScores('HoldNoteScore_LetGo'))
				end
			end;
			LoadFont("ScreenGameplay judgment")..{
				Text="Holds Dropped:";
				InitCommand=cmd(horizalign,right;zoom,0.5;shadowlength,0;addy,120;addx,-24;);
			};
			LoadFont("ScreenGameplay judgment")..{
				Text="Mines Hit: ";
				InitCommand=cmd(horizalign,right;zoom,0.5;shadowlength,0;addy,140;addx,-24;);
			};
			LoadFont("ScreenGameplay judgment")..{
				Text="Current BPM";
				InitCommand=cmd(zoom,0.5;shadowlength,0;addy,116;addx,56;);
			};
			LoadFont("ScreenGameplay judgment")..{
				Name="HoldMiss";
				InitCommand=cmd(horizalign,left;zoom,0.5;shadowlength,0;addy,120;addx,-20;settext,"0");
			};
			LoadFont("ScreenGameplay judgment")..{
				Name="Mine";
				InitCommand=cmd(horizalign,left;zoom,0.5;shadowlength,0;addy,140;addx,-20;settext,"0");
			};
		};

		LoadFont("ScreenGameplay judgment")..{
			Name="NumbersW1";
			InitCommand=cmd(settext,"0";zoom,0.5;addy,96;addx,73*-1;shadowlength,0);
			StepMessageCommand=function(self,p)
				if p.PlayerNumber == PLAYER_1 then
					self:playcommand("Update")
				end
			end;
			UpdateCommand=function(self)
				local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
				local w1Notes = pss:GetTapNoteScores('TapNoteScore_W1')
				self:settext(w1Notes)
			end;
		};
		LoadFont("ScreenGameplay judgment")..{
			Name="NumbersW2";
			InitCommand=cmd(settext,"0";zoom,0.5;addy,96;shadowlength,0);
			StepMessageCommand=function(self,p)
				if p.PlayerNumber == PLAYER_1 then
					self:playcommand("Update")
				end
			end;
			UpdateCommand=function(self)
				local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
				local w2Notes = pss:GetTapNoteScores('TapNoteScore_W2')
				self:settext(w2Notes)
			end;
		};
		LoadFont("ScreenGameplay judgment")..{
			Name="NumbersOther";
			InitCommand=cmd(settext,"0";zoom,0.5;addy,96;addx,73*1;shadowlength,0);
			StepMessageCommand=function(self,p)
				if p.PlayerNumber == PLAYER_1 then
					self:playcommand("Update")
				end
			end;
			UpdateCommand=function(self)
				local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
				local otherNotes = pss:GetTapNoteScores('TapNoteScore_W3')
				otherNotes = otherNotes + pss:GetTapNoteScores('TapNoteScore_W4')
				otherNotes = otherNotes + pss:GetTapNoteScores('TapNoteScore_W5')
				self:settext(otherNotes)
			end;
		};

		Def.ActorFrame{
			Name="BarLabels";
			-- only show on first stage
			InitCommand=cmd(visible,GAMESTATE:GetCurrentStageIndex()==0);
			LoadFont("_v 26px bold black")..{
				Text="Fantastics";
				InitCommand=cmd(rotationz,-90;addx,73*-1;addy,-20;shadowlength,0;queuecommand,"FadeOn");
				FadeOnCommand=cmd(sleep,2;linear,1;diffusealpha,0);
			};
			LoadFont("_v 26px bold black")..{
				Text="Excellents";
				InitCommand=cmd(rotationz,-90;addx,73*-0;addy,-20;shadowlength,0;queuecommand,"FadeOn");
				FadeOnCommand=cmd(sleep,2.25;linear,1;diffusealpha,0);
			};
			LoadFont("_v 26px bold black")..{
				Text="Greats, Decents\nWay-Offs";
				InitCommand=cmd(rotationz,-90;zoom,.8;addx,73*1;addy,-20;shadowlength,0;queuecommand,"FadeOn");
				FadeOnCommand=cmd(sleep,2.5;linear,1;diffusealpha,0);
			};
		};

		LoadActor("bar_fantastic")..{
			InitCommand=cmd(vertalign,bottom;addx,73*-1;addy,86;zoomy,0;);
			StepMessageCommand=function(self,p)
				if p.PlayerNumber == PLAYER_1 then
					self:playcommand("Update")
				end
			end;
			UpdateCommand=function(self)
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
				if steps then
					local P1TotalSteps = steps:GetRadarValues(PLAYER_1):GetValue('RadarCategory_TapsAndHolds')
					local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
					local w1Notes = pss:GetTapNoteScores('TapNoteScore_W1')
					self:zoomy(w1Notes/P1TotalSteps)
				end
			end;
		};
		LoadActor("bar_excellent")..{
			InitCommand=cmd(vertalign,bottom;addy,86;zoomy,0;);
			StepMessageCommand=function(self,p)
				if p.PlayerNumber == PLAYER_1 then
					self:playcommand("Update")
				end
			end;
			UpdateCommand=function(self)
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
				if steps then
					local P1TotalSteps = steps:GetRadarValues(PLAYER_1):GetValue('RadarCategory_TapsAndHolds')
					local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
					local w2Notes = pss:GetTapNoteScores('TapNoteScore_W2')
					self:zoomy(w2Notes/P1TotalSteps)
				end
			end;
		};
		LoadActor("bar_other")..{
			InitCommand=cmd(vertalign,bottom;addx,73*1;addy,86;zoomy,0;);
			StepMessageCommand=function(self,p)
				if p.PlayerNumber == PLAYER_1 then
					self:playcommand("Update")
				end
			end;
			UpdateCommand=function(self)
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
				if steps then
					local P1TotalSteps = steps:GetRadarValues(PLAYER_1):GetValue('RadarCategory_TapsAndHolds')
					local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
					local otherNotes = pss:GetTapNoteScores('TapNoteScore_W3')
					otherNotes = otherNotes + pss:GetTapNoteScores('TapNoteScore_W4')
					otherNotes = otherNotes + pss:GetTapNoteScores('TapNoteScore_W5')
					self:zoomy(otherNotes/P1TotalSteps)
				end
			end;
		};
	};
};