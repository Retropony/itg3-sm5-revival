local Player = ...
if not Player then error("[ScreenNameEntryTraditional Wheel] If it had to done per player in StepMania 3.95, it has to be done per-player here.") end

local machineProfile = PROFILEMAN:GetMachineProfile()

-- something about making scroller items
local wheelItemFont = "_r bold 30px"

local function MakeHighScoreWheelItem(index)
	return Def.ActorFrame{
		Name=string.format("WheelItem%i",index),
		Def.ActorFrame{
			UpdateWheelItemMessageCommand=function(self,param)
				if param.Index == index and param.Player == Player then
					local c = self:GetChildren()
					local hs = param.HighScore

					if hs then
						c.Name:settext(hs:GetName())
						c.Score:settext(FormatPercentScore(hs:GetPercentDP()))

						-- format date text from "yyyy-mm-dd hh:mm:ss" into "mm/dd"
						local dateText = tostring(hs:GetDate())
						dateText = string.gsub(string.sub(dateText,6,10),"-","/")
						c.Date:settext(dateText)
					else
						c.Name:settext("please")
						c.Score:settext("contact freem!")
						c.Date:settext("error")
					end

					if param.Focus == index then
						c.Rank:queuecommand("Focus")
						c.Name:queuecommand("Focus")
						c.Score:queuecommand("Focus")
						c.Date:queuecommand("Focus")
					else
						c.Rank:stopeffect()
						c.Name:stopeffect()
						c.Score:stopeffect()
						c.Date:stopeffect()
					end
				end
			end,

			LoadFont(wheelItemFont)..{
				Name="Rank",
				Text=index+1,
				InitCommand=cmd(x,-158;shadowlength,2),
				FocusCommand=cmd(diffuseshift;effectcolor1,color("1,1,0,1");effectcolor2,color("0,1,1,1")),
			},
			LoadFont(wheelItemFont)..{
				Name="Name",
				InitCommand=cmd(x,-89;maxwidth,80;shadowlength,2),
				FocusCommand=cmd(diffuseshift;effectcolor1,color("1,1,0,1");effectcolor2,color("0,1,1,1")),
			},
			LoadFont(wheelItemFont)..{
				Name="Score",
				InitCommand=cmd(x,87;halign,1;maxwidth,120;shadowlength,2),
				FocusCommand=cmd(diffuseshift;effectcolor1,color("1,1,0,1");effectcolor2,color("0,1,1,1")),
			},
			LoadFont(wheelItemFont)..{
				Name="Date",
				InitCommand=cmd(x,134;maxwidth,60;shadowlength,2),
				FocusCommand=cmd(diffuseshift;effectcolor1,color("1,1,0,1");effectcolor2,color("0,1,1,1")),
			}
		}
	}
end

-- focused item has a hardcoded cmd(diffuseshift;effectcolor1,color("1,1,0,1");effectcolor2,color("0,1,1,1"))

--[[
float HighScoreWheel::Scroll()
{
	SetCurrentAndDestinationItem( m_SubActors.size()+5.0f );
	int iIndexToFocus = max( m_iIndexToFocus, 3 );
	SetDestinationItem( (float)iIndexToFocus );
	return GetTweenTimeLeft();
}
--]]

-- STATSMAN:GetStagesPlayed()

return Def.ActorFrame{
	InitCommand=cmd(fov,15),

	Def.ActorScroller{
		SecondsPerItem=0.2,
		NumItemsToDraw=10.5;
		TransformFunction=function(self,offset,itemIndex,numItems)
			local degrees=18*offset
			local radians=degrees*math.pi/180
			self:rotationx(degrees)
			self:y(math.sin(radians)*90)
			self:z(math.cos(radians)*90)
		end,

		ChangeDisplayedFeatMessageCommand=function(self,param)
			if param.Player == Player then
				-- reset Wheel position so it can scroll in from above
				self:SetCurrentAndDestinationItem(15)
				self:PositionItems()

				-- used later!
				local itemToFocus = math.random(1,10)-1
				local scrollerFocus = math.max(itemToFocus,3)

				-- many things go on here, like getting the high scores.
				if GAMESTATE:IsCourseMode() then
					local hsl = machineProfile:GetHighScoreListIfExists(GAMESTATE:GetCurrentCourse(),GAMESTATE:GetCurrentTrail(Player))
					local highScores = hsl:GetHighScores()
					if hsl then
						-- todo: add item to focus
						for i=0,9 do
							MESSAGEMAN:Broadcast("UpdateWheelItem",{Index=i,HighScore=highScores[i+1]})
						end
					end
				else
					-- get high score list for current song/steps combo
					local stagesAgo = (STATSMAN:GetStagesPlayed() - (param.NewIndex-1))
					local playedSS = STATSMAN:GetPlayedStageStats(stagesAgo)
					local playerSS = playedSS:GetPlayerStageStats(Player)
					local songs = playedSS:GetPlayedSongs()
					local steps = playerSS:GetPlayedSteps()
					local hsl = machineProfile:GetHighScoreListIfExists(songs[1],steps[1])

					if hsl then
						local highScores = hsl:GetHighScores()
						-- update all wheel items
						for i=0,9 do
							MESSAGEMAN:Broadcast("UpdateWheelItem",{Player=param.Player,Index=i,HighScore=highScores[i+1],Focus=itemToFocus})
						end
					else
						
					end
				end

				-- scroll to new wheel item
				self:SetDestinationItem(scrollerFocus)
				self:PositionItems()
			end
		end,

		MakeHighScoreWheelItem(0),
		MakeHighScoreWheelItem(1),
		MakeHighScoreWheelItem(2),
		MakeHighScoreWheelItem(3),
		MakeHighScoreWheelItem(4),
		MakeHighScoreWheelItem(5),
		MakeHighScoreWheelItem(6),
		MakeHighScoreWheelItem(7),
		MakeHighScoreWheelItem(8),
		MakeHighScoreWheelItem(9)
	},
}
