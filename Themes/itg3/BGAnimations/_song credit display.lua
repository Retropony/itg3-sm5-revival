return LoadFont("_r bold 30px")..{
	Text=GetCreditsText();
	InitCommand=cmd(halign,0;x,SCREEN_LEFT+60;y,SCREEN_BOTTOM-100;shadowlength,2;zoom,0.5);
};
