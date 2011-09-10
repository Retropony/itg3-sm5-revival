local t = Def.ActorFrame{
	LoadActor("_bottom")..{
		InitCommand=cmd(Center;FullScreen;diffusealpha,0;);
		OnCommand=cmd(accelerate,0.3;diffusealpha,1);
	};
	LoadActor("lines")..{
		InitCommand=cmd(Center;FullScreen;diffusealpha,0;);
		OnCommand=cmd(accelerate,0.3;diffusealpha,1);
	};
	Def.Banner{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+103;blend,Blend.Add;fadetop,.3;croptop,.3;diffusetopedge,color("#FFFFFF00");ztest,true;);
		OnCommand=cmd(playcommand,"Set";rotationz,180;zoomx,-1;linear,1;y,SCREEN_CENTER_Y+70;diffusealpha,0.2);
		SetCommand=function(self)
			local sel
			if GAMESTATE:IsCourseMode() then
				sel = GAMESTATE:GetCurrentCourse()
				if sel then self:LoadFromCourse(sel) end
			else
				sel = GAMESTATE:GetCurrentSong()
				if sel then self:LoadFromSong(sel) end
			end
			self:scaletoclipped(292,114);
		end;
	};
	LoadActor("_flaremask")..{
		InitCommand=cmd(Center;FullScreen;zbuffer,true;blend,'BlendMode_NoEffect');
	};
	LoadActor(THEME:GetPathB("ScreenStageInformation","background/_flares"))..{
		InitCommand=cmd(Center;ztest,true;diffusealpha,1;zoom,1);
		OnCommand=cmd(linear,1;rotationz,-250;diffusealpha,0);
	};
	LoadActor("bar")..{
		InitCommand=cmd(CenterX;SCREEN_CENTER_Y+156;visible,not GAMESTATE:IsCourseMode();zoomtowidth,SCREEN_WIDTH;faderight,.8;fadeleft,.8;cropright,1;);
		OnCommand=cmd(linear,.7;cropright,0);
	};
	LoadFont("_r bold 30px")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+147maxwidth,SCREEN_WIDTH/8*7;shadowlength,2;horizalign,center;zoom,.5;diffusealpha,0;);
		OnCommand=cmd(sleep,.1;linear,.3;diffusealpha,1;);
	};
	LoadFont("_r bold 30px")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+167maxwidth,SCREEN_WIDTH/8*6.8;shadowlength,2;horizalign,center;zoom,.4;diffusealpha,0;);
		OnCommand=cmd(sleep,.1;linear,.3;diffusealpha,1;);
	};
};

return t;