return Def.ActorFrame{
	LoadFont("_r bold shadow 30px")..{
		InitCommand=cmd(zoom,0.66;maxwidth,360;halign,0);
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self) 
			local song = GAMESTATE:GetCurrentSong(); 
			local text = ""
			if song then 
				text = song:GetDisplayArtist();
			end;
			self:settext(text);
		end;
	};
};