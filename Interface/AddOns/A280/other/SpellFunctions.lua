wowam.ClassBeeScript.SPELLFUNCTIONS=function()
     
function BeeSpellIsBerserkerRage(buffs) --当出现列表里的BUFF时施放狂暴之怒
	if not buffs then 
		if GetLocale()=="zhCN" then
			buffs = "恐惧,心灵尖啸,恐惧嚎叫,闷棍,瘫痪,破胆怒吼,恐惧术,忏悔,恐慌,恐吓,梦魇乍醒,恐惧畏缩,低沉咆哮,煽动惊恐"
		elseif GetLocale()=="zhTW" then
			return
		else
			return   
		end   
	end
	
	if BeeStringFind(buffs,BeeUnitBuffList("player")) and BeeSpellCD("狂暴之怒")<=0 then
		BeeRun("狂暴之怒");
		return true;
	end
end


function BeeSpellIsDestroy(times) --牧师专用，破法师变形术
	local spell = {};
	
	spell["灭"] = 	GetSpellInfo(32996)
	spell["变形术"] = 	GetSpellInfo(118)
	
	if not times then
		times=1
	end
	
	local UNIT = BeeUnitTargetCastSpell(spell["灭"],4,"MAGE",spell["变形术"],"player",times ) 
	 
		
			if UNIT then
				BeeRun("/stopcasting\n/cast [target=" .. UNIT .. "]" .. spell["灭"] )
				return spell["灭"];
			end
		
	 
	
 
end

end
