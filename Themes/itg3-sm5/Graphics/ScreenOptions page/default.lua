local t = Def.ActorFrame{
	LoadActor("options page")..{ InitCommand=cmd(addy,-17); };
	LoadActor("line highlight mask right")..{
		InitCommand=cmd(addy,-145;x,291;zwrite,true;blend,'BlendMode_NoEffect');
	};
};

return t;