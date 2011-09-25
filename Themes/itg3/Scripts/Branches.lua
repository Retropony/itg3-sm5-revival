function ScreenCleaning()
	if Hour() > 2 and Hour() < 7 and GetScreenCleaning() == true then return "ScreenNoise" end
	return "ScreenCompany";
end