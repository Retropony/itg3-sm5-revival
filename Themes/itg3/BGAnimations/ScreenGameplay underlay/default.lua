local t = Def.ActorFrame{
	LoadActor("ScreenFilter");
	LoadActor("stepstats")..{
		InitCommand=function(self)
			local statsP1 = getenv("StatsDisplayP1")
			local statsP2 = getenv("StatsDisplayP2")
			self:visible(statsP1 == true or statsP2 == true)
		end;
	};
};

return t;