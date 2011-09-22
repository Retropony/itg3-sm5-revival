local player = ...
assert(player,"[Graphics/ScreenSelectMusic PaneNumbers] player required")

return Def.ActorFrame{
	LoadFont("smallnumbers")..{
		Name="Jumps";
		InitCommand=cmd(x,-127+101;diffusealpha,0;horizalign,center;);
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local sel = GAMESTATE:GetCurrentSteps(player)
			self:visible(sel ~= nil)
			if sel then
				local num = sel:GetRadarValues():GetValue('RadarCategory_Jumps')
				self:settext(num)
				-- coloring
				local itemColor = color(".4,.4,.4,1")
				if num == 0 then itemColor = color(".4,.4,.4,1")
				elseif num <= 24 then itemColor = color("0,1,0,1")
				elseif num <= 49 then itemColor = color("1,1,0,1")
				elseif num <= 99 then itemColor = color("1,.53,0,1")
				elseif num <= 199 then itemColor = color("1,0,0,1")
				else itemColor = color("0,.75,1,1")
				end
				self:diffuse(itemColor)
			end
		end;
		EnableSelectHelpMessageCommand=cmd(stoptweening;playcommand,"Set";linear,0.2;diffusealpha,1);
		SelectMenuOffMessageCommand=cmd(stoptweening;linear,0.2;diffusealpha,0);
		OffCommand=cmd(stoptweening;linear,.12;diffusealpha,0;);
	};
	LoadFont("smallnumbers")..{
		Name="Holds";
		InitCommand=cmd(x,-102+101;diffusealpha,0;horizalign,center;);
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local sel = GAMESTATE:GetCurrentSteps(player)
			self:visible(sel ~= nil)
			if sel then
				local num = sel:GetRadarValues():GetValue('RadarCategory_Holds')
				self:settext(num)
				-- coloring
				local itemColor = color(".4,.4,.4,1")
				if num == 0 then itemColor = color(".4,.4,.4,1")
				elseif num <= 24 then itemColor = color("0,1,0,1")
				elseif num <= 49 then itemColor = color("1,1,0,1")
				elseif num <= 99 then itemColor = color("1,.53,0,1")
				elseif num <= 199 then itemColor = color("1,0,0,1")
				else itemColor = color("0,.75,1,1")
				end
				self:diffuse(itemColor)
			end
		end;
		EnableSelectHelpMessageCommand=cmd(stoptweening;playcommand,"Set";linear,0.2;diffusealpha,1);
		SelectMenuOffMessageCommand=cmd(stoptweening;linear,0.2;diffusealpha,0);
		OffCommand=cmd(stoptweening;linear,.12;diffusealpha,0;);
	};
	LoadFont("smallnumbers")..{
		Name="Mines";
		InitCommand=cmd(x,-77+101;diffusealpha,0;horizalign,center;);
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local sel = GAMESTATE:GetCurrentSteps(player)
			self:visible(sel ~= nil)
			if sel then
				local num = sel:GetRadarValues():GetValue('RadarCategory_Mines')
				self:settext(num)
				-- coloring
				local itemColor = color(".4,.4,.4,1")
				if num == 0 then itemColor = color(".4,.4,.4,1")
				elseif num <= 24 then itemColor = color("0,1,0,1")
				elseif num <= 49 then itemColor = color("1,1,0,1")
				elseif num <= 89 then itemColor = color("1,.53,0,1")
				elseif num <= 139 then itemColor = color("1,0,0,1")
				else itemColor = color("0,.75,1,1")
				end
				self:diffuse(itemColor)
			end
		end;
		EnableSelectHelpMessageCommand=cmd(stoptweening;playcommand,"Set";linear,0.2;diffusealpha,1);
		SelectMenuOffMessageCommand=cmd(stoptweening;linear,0.2;diffusealpha,0);
		OffCommand=cmd(stoptweening;linear,.12;diffusealpha,0;);
	};
	LoadFont("smallnumbers")..{
		Name="Hands";
		InitCommand=cmd(x,-52+101;diffusealpha,0;horizalign,center;);
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local sel = GAMESTATE:GetCurrentSteps(player)
			self:visible(sel ~= nil)
			if sel then
				local num = sel:GetRadarValues():GetValue('RadarCategory_Hands')
				self:settext(num)
				-- coloring
				local itemColor = color(".4,.4,.4,1")
				if num == 0 then itemColor = color(".4,.4,.4,1")
				elseif num <= 14 then itemColor = color("0,1,0,1")
				elseif num <= 29 then itemColor = color("1,1,0,1")
				elseif num <= 39 then itemColor = color("1,.53,0,1")
				elseif num <= 51 then itemColor = color("1,0,0,1")
				else itemColor = color("0,.75,1,1")
				end
				self:diffuse(itemColor)
			end
		end;
		EnableSelectHelpMessageCommand=cmd(stoptweening;playcommand,"Set";linear,0.2;diffusealpha,1);
		SelectMenuOffMessageCommand=cmd(stoptweening;linear,0.2;diffusealpha,0);
		OffCommand=cmd(stoptweening;linear,.12;diffusealpha,0;);
	};
	LoadFont("smallnumbers")..{
		Name="Rolls";
		InitCommand=cmd(x,-27+101;diffusealpha,0;horizalign,center;);
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local sel = GAMESTATE:GetCurrentSteps(player)
			self:visible(sel ~= nil)
			if sel then
				local num = sel:GetRadarValues():GetValue('RadarCategory_Mines')
				self:settext(num)
				-- coloring
				local itemColor = color(".4,.4,.4,1")
				if num == 0 then itemColor = color(".4,.4,.4,1")
				elseif num <= 9 then itemColor = color("0,1,0,1")
				elseif num <= 19 then itemColor = color("1,1,0,1")
				elseif num <= 29 then itemColor = color("1,.53,0,1")
				elseif num <= 39 then itemColor = color("1,0,0,1")
				else itemColor = color("0,.75,1,1")
				end
				self:diffuse(itemColor)
			end
		end;
		EnableSelectHelpMessageCommand=cmd(stoptweening;playcommand,"Set";linear,0.2;diffusealpha,1);
		SelectMenuOffMessageCommand=cmd(stoptweening;linear,0.2;diffusealpha,0);
		OffCommand=cmd(stoptweening;linear,.12;diffusealpha,0;);
	};
};