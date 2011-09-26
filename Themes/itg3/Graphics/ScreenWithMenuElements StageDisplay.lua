return Def.ActorFrame{
	LoadFont("_z bold 19px")..{
		InitCommand=cmd(shadowlength,1);
		BeginCommand=cmd(playcommand,"Set";);
		CurrentSongChangedMessageCommand=cmd(finishtweening;playcommand,"Set";);
		SetCommand=function(self)
			local Stage = ToEnumShortString(GAMESTATE:GetCurrentStage());
			if GAMESTATE:IsEventMode() then Stage = 'Event' end
			self:settext(THEME:GetString("Stages",Stage));
		end;
	};
};