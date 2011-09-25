local t = Def.ActorFrame{
	LoadActor("_music selection")..{
		InitCommand=cmd(texcoordvelocity,0.35,0;zoomtowidth,SCREEN_WIDTH;customtexturerect,0,0,SCREEN_WIDTH/self:GetWidth(),1;);
	};
};

return t;