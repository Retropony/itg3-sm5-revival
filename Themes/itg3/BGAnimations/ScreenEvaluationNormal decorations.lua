local t = LoadFallbackB();

-- StepsDisplay
if ShowStandardDecoration("StepsDisplay") then
	for pn in ivalues(PlayerNumber) do
		local t2 = Def.ActorFrame{
			InitCommand=cmd(player,pn);
			LoadActor(THEME:GetPathG("_difficulty","icons"))..{
				InitCommand=cmd(zoom,.8;animate,0;zoomx,(pn==PLAYER_2) and -1 or 1;playcommand,"Update");
				UpdateCommand=function(self)
					local steps = GAMESTATE:GetCurrentSteps(pn)
					if steps then
						self:setstate(DifficultyToState(steps:GetDifficulty()))
					end
				end;
			};
			Def.StepsDisplay {
				InitCommand=cmd(Load,"StepsDisplayEvaluation",pn;SetFromGameState,pn;);
				UpdateNetEvalStatsMessageCommand=function(self,param)
					if GAMESTATE:IsPlayerEnabled(pn) then
						self:SetFromSteps(param.Steps)
					end;
				end;
			};
		};
		t[#t+1] = StandardDecorationFromTable("StepsDisplay"..ToEnumShortString(pn), t2);
	end
end

-- combo graph
function ComboGraph( pn )
	local t = Def.ActorFrame {
		Def.ComboGraph {
			InitCommand=cmd(Load,"ComboGraph"..ToEnumShortString(pn););
			BeginCommand=function(self)
				local ss = SCREENMAN:GetTopScreen():GetStageStats();
				self:Set( ss, ss:GetPlayerStageStats(pn) );
				self:player( pn );
			end
		};
	};
	return t;
end

if ShowStandardDecoration("ComboGraph") then
	for pn in ivalues(PlayerNumber) do
		t[#t+1] = StandardDecorationFromTable( "ComboGraph"..ToEnumShortString(pn), ComboGraph(pn) );
	end;
end;

return t;