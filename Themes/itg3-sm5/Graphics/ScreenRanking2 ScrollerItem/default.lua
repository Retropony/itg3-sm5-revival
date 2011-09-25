return Def.ActorFrame{
	InitCommand=cmd(runcommandsonleaves,cmd(ztest,true));
	LoadActor("_course frame");

	Def.Banner{
		InitCommand=cmd(x,-276;halign,0;scaletoclipped,128,40;diffusealpha,0.5;fadeleft,0.25;faderight,0.25);
		SetCommand=function(self, params)
			if params.Course then
				self:LoadFromCourse( params.Course );
			end
		end;
	};
	LoadFont("_v 26px bold diffuse")..{
		--maxwidth,264
		InitCommand=cmd(x,-292;halign,0;zoom,0.6;shadowlength,1;wrapwidthpixels,264);
		SetCommand=function(self, params)
			if params.Course then
				self:settext( params.Course:GetDisplayFullTitle() );
			end
		end;
	};
};