local t = Def.ActorFrame{
	LoadActor("_style selection")..{
		InitCommand=cmd(texcoordvelocity,-0.09,0;zoomtowidth,SCREEN_WIDTH;customtexturerect,0,0,SCREEN_WIDTH/self:GetWidth(),1;ztest,true);
	};
};

return t;