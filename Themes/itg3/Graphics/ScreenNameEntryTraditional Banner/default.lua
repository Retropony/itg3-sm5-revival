return Def.ActorFrame{
	-- banner, which is meant to fade between multiple banners... great.
	Def.Banner{
		InitCommand=cmd(ztest,true),
		BeginCommand=cmd(queuecommand,"Set"),
		-- fuck.
		SetCommand=function(self)
			self:Load(THEME:GetPathG("Common","fallback banner"))
			self:scaletoclipped(174,68)
		end,
	},

	-- banner frame, no big deal.
	LoadActor("banner frame")
}
