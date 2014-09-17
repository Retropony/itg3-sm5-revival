local Player = ...
if not Player then error("[ScreenNameEntryTraditional Wheel] If it had to done per player in StepMania 3.95, it has to be done per-player here.") end

-- something about making scroller items
local wheelItemFont = "_r bold 30px"

local function MakeHighScoreWheelItem(index, highScore)
	return Def.ActorFrame{
		Def.ActorFrame{
			LoadFont(wheelItemFont)..{
				Name="Rank",
				Text=index+1,
				InitCommand=cmd(shadowlength,2)
			},
			LoadFont(wheelItemFont)..{
				Name="Name",
				Text=highScore:GetName(),
				InitCommand=cmd(shadowlength,2),
			},
			LoadFont(wheelItemFont)..{
				Name="Score",
				Text=highScore:GetScore(),
				InitCommand=cmd(shadowlength,2),
			},
			LoadFont(wheelItemFont)..{
				Name="Date",
				Text=highScore:GetDate(),
				InitCommand=cmd(shadowlength,2),
			}
		}
	}

end

-- focused item has a hardcoded cmd(diffuseshift;effectcolor1,color("1,1,0,1");effectcolor2,color("0,1,1,1"))

-- scroller transform function:
--[[
function(self,offset,itemIndex,numItems)
	local degrees=18*offset
	local radians=degrees*math.pi/180
	self:rotationx(degrees)
	self:y(math.sin(radians)*90)
	self:z(math.cos(radians)*90)
end
--]]

--[[
ActorScroller::Load3( 
		0.2f,
		10.5,
		false,
		sTransformFunction,
		false );
--]]

--[[
float HighScoreWheel::Scroll()
{
	SetCurrentAndDestinationItem( m_SubActors.size()+5.0f );
	int iIndexToFocus = max( m_iIndexToFocus, 3 );
	SetDestinationItem( (float)iIndexToFocus );
	return GetTweenTimeLeft();
}
--]]

return Def.ActorFrame{
	InitCommand=cmd(fov,15),

	LoadFont("_r bold 30px")..{
		Text="[wheel placeholder]"
	}
}
