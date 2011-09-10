local t = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_sides"))..{
		InitCommand=cmd(ztest,true);
	};
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/_base"));
	Def.ActorFrame{
		Name="SelButtonMenu";
		InitCommand=cmd(y,SCREEN_BOTTOM-54);
		LoadFont("_v 26px bold white")..{
			Text="&START; Change Sort";
			InitCommand=cmd(x,SCREEN_CENTER_X;zoomx,.3;zoomy,.6;diffusealpha,0;shadowlength,2);
			BeginCommand=function(self)
				--ModeMenuAvailable()
			end;
			OffCommand=cmd(linear,.3;diffusealpha,0);
			EnableSelectHelpMessageCommand=cmd(stoptweening;bounceend,0.2;diffusealpha,1;zoomx,0.6);
			SelectMenuOffMessageCommand=cmd(stoptweening;linear,0.2;diffusealpha,0;zoomx,0.3);
		};
		Def.ActorFrame{
			Name="Easier";
			InitCommand=function(self)
				--[[
				if ModeMenuAvailable() then
					self:x(SCREEN_CENTER_X-100)
				else
					self:x(SCREEN_CENTER_X-65)
				end
				--]]
				self:x(SCREEN_CENTER_X-65)
			end;
			LoadFont("_v 26px bold black")..{
				Text="&MENULEFT;";
				OnCommand=cmd(addy,36;x,-5;horizalign,right;zoomx,.5;zoomy,.7;diffusealpha,0;shadowlength,0);
				OffCommand=cmd(linear,.3;diffusealpha,0);
				EnableSelectHelpMessageCommand=cmd(stoptweening;bounceend,0.2;diffusealpha,1;zoomx,0.7);
				SelectMenuOffMessageCommand=cmd(stoptweening;linear,0.2;diffusealpha,0;zoomx,0.5);
			};
			LoadFont("_v 26px bold black")..{
				Text="Easier";
				OnCommand=cmd(addy,36;x,0;horizalign,left;zoomx,.5;zoomy,.7;diffusealpha,0;diffuseramp;effectperiod,1;effectoffset,0.20;effectclock,'beat';effectcolor1,color("#FFFFFF");effectcolor2,color("#20D020");shadowlength,0);
				OffCommand=cmd(linear,.3;diffusealpha,0);
				EnableSelectHelpMessageCommand=cmd(stoptweening;bounceend,0.2;diffusealpha,1;zoomx,0.7);
				SelectMenuOffMessageCommand=cmd(stoptweening;linear,0.2;diffusealpha,0;zoomx,0.5);
			};
		};
		Def.ActorFrame{
			Name="Harder";
			InitCommand=function(self)
				--[[
				if ModeMenuAvailable() then
					self:x(SCREEN_CENTER_X+100)
				else
					self:x(SCREEN_CENTER_X+65)
				end
				--]]
				self:x(SCREEN_CENTER_X-65)
			end;
			LoadFont("_v 26px bold black")..{
				Text="Harder";
				OnCommand=cmd(addy,36;x,0;horizalign,right;zoomx,.5;zoomy,.7;diffusealpha,0;diffuseramp;effectperiod,1;effectoffset,0.20;effectclock,'beat';effectcolor1,color("#FFFFFF");effectcolor2,color("#E06060");shadowlength,0);
				OffCommand=cmd(linear,.3;diffusealpha,0);
				EnableSelectHelpMessageCommand=cmd(stoptweening;bounceend,0.2;diffusealpha,1;zoomx,0.7);
				SelectMenuOffMessageCommand=cmd(stoptweening;linear,0.2;diffusealpha,0;zoomx,0.5);
			};
			LoadFont("_v 26px bold black")..{
				Text="&MENURIGHT;";
				OnCommand=cmd(addy,36;x,15;horizalign,center;zoomx,.5;zoomy,.7;diffusealpha,0;shadowlength,0);
				OffCommand=cmd(linear,.3;diffusealpha,0);
				EnableSelectHelpMessageCommand=cmd(stoptweening;bounceend,0.2;diffusealpha,1;zoomx,0.7);
				SelectMenuOffMessageCommand=cmd(stoptweening;linear,0.2;diffusealpha,0;zoomx,0.5);
			};
		};
	};
};

return t;