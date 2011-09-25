return Def.ActorFrame{
	InitCommand=cmd(runcommandsonleaves,cmd(ztest,true));
	LoadActor("_song frame");

	Def.Banner{
		InitCommand=cmd(x,-276;halign,0;scaletoclipped,128,40;diffusealpha,0.5;fadeleft,0.25;faderight,0.25);
		SetCommand=function(self, params)
			if params.Song then
				self:LoadFromSong( params.Song );
			elseif params.Course then
				self:LoadFromCourse( params.Course );
			end
		end;
	};
	LoadFont("_v 26px bold diffuse")..{
		--maxwidth,264
		InitCommand=cmd(x,-292;halign,0;zoom,0.6;shadowlength,1;wrapwidthpixels,264);
		SetCommand=function(self, params)
			if params.Song then
				self:settext( params.Song:GetDisplayFullTitle() );
			elseif params.Course then
				self:settext( params.Course:GetDisplayFullTitle() );
			end
		end;
	};

	Def.ActorFrame{
		Name="Score1";
		InitCommand=cmd(x,-48;);
		LoadFont("_v 26px bold black")..{
			Text="-----";
			InitCommand=cmd(y,-8;zoom,0.625);
		};
		LoadFont("_futurist numbers metallic")..{
			Text="100%";
			InitCommand=cmd(y,12;zoom,0.5);
		};
	};
	Def.ActorFrame{
		Name="Score2";
		InitCommand=cmd(x,48;);
		LoadFont("_v 26px bold black")..{
			Text="-----";
			InitCommand=cmd(y,-8;zoom,0.625);
		};
		LoadFont("_futurist numbers metallic")..{
			Text="100%";
			InitCommand=cmd(y,12;zoom,0.5);
		};
	};
	Def.ActorFrame{
		Name="Score3";
		InitCommand=cmd(x,144;);
		LoadFont("_v 26px bold black")..{
			Text="-----";
			InitCommand=cmd(y,-8;zoom,0.625);
		};
		LoadFont("_futurist numbers metallic")..{
			Text="100%";
			InitCommand=cmd(y,12;zoom,0.5);
		};
	};
	Def.ActorFrame{
		Name="Score1";
		InitCommand=cmd(x,240;);
		LoadFont("_v 26px bold black")..{
			Text="-----";
			InitCommand=cmd(y,-8;zoom,0.625);
		};
		LoadFont("_futurist numbers metallic")..{
			Text="100%";
			InitCommand=cmd(y,12;zoom,0.5);
		};
	};
};