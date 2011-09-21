function DifficultyChangingAvailable()
	local pm = GAMESTATE:GetPlayMode()
	local so = GAMESTATE:GetSortOrder()
	return pm ~= 'PlayMode_Endless' and pm ~= 'PlayMode_Oni' and so ~= 'SortOrder_ModeMenu'
end

function ModeMenuAvailable()
	return not GAMESTATE:IsCourseMode() and not GAMESTATE:GetSortOrder() == 'SortOrder_ModeMenu'
end

function TextBannerAfterSet(self,param)
	local Title=self:GetChild("Title")
	local Subtitle=self:GetChild("Subtitle")

	if Subtitle:GetText() == "" then 
		Title:y(0)
		Subtitle:visible(false)
	else
		Title:y(-5)
		Subtitle:visible(true)
		Subtitle:y(8)
	end
end