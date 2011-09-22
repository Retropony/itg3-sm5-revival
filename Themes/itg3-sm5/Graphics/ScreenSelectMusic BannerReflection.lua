return Def.FadingBanner{
	InitCommand=cmd(playcommand,"Set";ztest,true;vertalign,bottom;zoomy,-1);
	BeginCommand=cmd(visible,not GAMESTATE:IsCourseMode());
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			self:LoadFromSong(song)
		else
			-- todo: check for song group, chance
			self:LoadFromSong(nil)
		end
		self:scaletoclipped(320,120)
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
};