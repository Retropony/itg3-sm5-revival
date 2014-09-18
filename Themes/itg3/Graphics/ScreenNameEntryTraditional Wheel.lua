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
				InitCommand=cmd(x,-158;shadowlength,2),
				UpdateItemMessageCommand=function(self)
					-- do fuck all, because these don't change
				end
			},
			LoadFont(wheelItemFont)..{
				Name="Name",
				Text=highScore:GetName(),
				InitCommand=cmd(x,-89;maxwidth,80;shadowlength,2),
				UpdateItemMessageCommand=function(self)
					-- hardcode index
				end
			},
			LoadFont(wheelItemFont)..{
				Name="Score",
				Text=highScore:GetScore(),
				InitCommand=cmd(x,87;halign,1;maxwidth,120;shadowlength,2),
				UpdateItemMessageCommand=function(self)
					-- hardcode index
				end
			},
			LoadFont(wheelItemFont)..{
				Name="Date",
				Text=highScore:GetDate(),
				InitCommand=cmd(x,134;maxwidth,60;shadowlength,2),
				UpdateItemMessageCommand=function(self)
					-- hardcode index
				end
			}
		}
	}
end

local function MakePlaceholderWheelItem(index)
	return Def.ActorFrame{
		Def.ActorFrame{
			LoadFont(wheelItemFont)..{
				Name="Rank",
				Text=index+1,
				InitCommand=cmd(x,-158;shadowlength,2),
				UpdateItemMessageCommand=function(self)
					-- do fuck all, because these don't change
				end
			},
			LoadFont(wheelItemFont)..{
				Name="Name",
				Text="(FAKE)",
				InitCommand=cmd(x,-89;maxwidth,80;shadowlength,2),
				UpdateItemMessageCommand=function(self)
					-- hardcode index
				end
			},
			LoadFont(wheelItemFont)..{
				Name="Score",
				Text=FormatPercentScore(math.random()),
				InitCommand=cmd(x,87;halign,1;maxwidth,120;shadowlength,2),
				UpdateItemMessageCommand=function(self)
					-- hardcode index
				end
			},
			LoadFont(wheelItemFont)..{
				Name="Date",
				Text="00/00",
				InitCommand=cmd(x,134;maxwidth,60;shadowlength,2),
				UpdateItemMessageCommand=function(self)
					-- hardcode index
				end
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

		-- xxx: manual set crap
		children = {
			MakePlaceholderWheelItem(0),
			MakePlaceholderWheelItem(1),
			MakePlaceholderWheelItem(2),
			MakePlaceholderWheelItem(3),
			MakePlaceholderWheelItem(4),
			MakePlaceholderWheelItem(5),
			MakePlaceholderWheelItem(6),
			MakePlaceholderWheelItem(7),
			MakePlaceholderWheelItem(8),
			MakePlaceholderWheelItem(9)
		}
	},
}
