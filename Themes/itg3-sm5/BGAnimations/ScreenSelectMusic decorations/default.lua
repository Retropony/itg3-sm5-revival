local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFile("BannerReflection","BannerReflection");
t[#t+1] = StandardDecorationFromFile("Triangle","Triangle");

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG('ScreenSelectMusic','BannerFrame'));
	StandardDecorationFromFile("ArtistDisplay","ArtistDisplay");
	StandardDecorationFromFile("BPMDisplay","BPMDisplay");
	StandardDecorationFromFile("StepsDisplayList","StepsDisplayList");
};

return t;