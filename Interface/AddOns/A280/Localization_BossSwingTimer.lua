	local tonumber = tonumber;
	local UnitAttackSpeed = UnitAttackSpeed;
	local GetTime = GetTime;
	local UnitGUID = UnitGUID;
	local UnitName = UnitName;
	
	local BossSwingTimer=CreateFrame("Frame");
	BossSwingTimer.swings = {};
	BossSwingTimer.db={};
	BossSwingTimer.db.global={};
	BossSwingTimer.db.global.speeds={};
	local unitList = {{id = "target", color = {r = 1, g = 0.2, b = 0.2}}, {id = "focus", color = {r = 1, g = 1, b = 0}}}

	local function npcid(guid)
		return tonumber("0x" .. guid:sub(6, 10))
	end
	local band = bit.band
	local function isnpc(guid)
		local t = band(tonumber("0x" .. guid:sub(5, 5)), 7)
		return t == 3 or t == 5
	end

	function BossSwingTimer:UpdateAttackSpeeds()
		for _, u in ipairs(unitList) do
			local uid = UnitGUID(u.id)
			if uid and isnpc(uid) then
				local speed = UnitAttackSpeed(u.id)
				if speed then
					BossSwingTimer.db.global.speeds[npcid(uid)] = {value = speed, api = true}
				end
			end
		end
	end
	
	function BossSwingTimer:OnSwing(time, guid, damage)
		BossSwingTimer:UpdateAttackSpeeds()

		local id = npcid(guid)
		BossSwingTimer.swings[guid] = BossSwingTimer.swings[guid] or {}
		local prev = BossSwingTimer.swings[guid].time
		BossSwingTimer.swings[guid].time = time
		local speed = nil
		if prev and (time - prev) < 5 then
			speed = time - prev
		end
		
		if BossSwingTimer.db.global.speeds[id] and BossSwingTimer.db.global.speeds[id].api then
			speed = BossSwingTimer.db.global.speeds[id].value
		elseif speed then
			BossSwingTimer.db.global.speeds[id] = {value = speed}
		end
		if speed then
			BossSwingTimer.swings[guid].next = time + speed
			if damage then
				BossSwingTimer.swings[guid].damage = damage
			end
		end
	end
	
	function BossSwingTimer:OnUpdate()
		--amwingTimer("target",true,1,100,true)
	end

	local events = {
	["SWING_DAMAGE"] = true,
	["SWING_MISSED"] = true,
	["UNIT_DIED"] = true,
	}
	function BossSwingTimer:COMBAT_LOG_EVENT_UNFILTERED(mainevent, timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, ...)
		
		
		if not events[event] then return end
		--print(event,sourceGUID,destGUID)
		if sourceGUID == "0x0000000000000000" or sourceGUID == nil or sourceName == nil then return end	--check for environmental damage
		
		if (event == "SWING_DAMAGE" or event == "SWING_MISSED") and destGUID == UnitGUID("player") and isnpc(sourceGUID) then
		
			BossSwingTimer:OnSwing(GetTime(), sourceGUID, event == "SWING_DAMAGE" and select(4, ...))
			
		elseif event == "UNIT_DIED" then
			local v = BossSwingTimer.swings[destGUID]
			if v and v.tick then
				
				v.tick = nil
			end
			BossSwingTimer.swings[destGUID] = nil	--remove the UnitGUID from the table if the unit dies
		end
	end
	
	function BossSwingTimer:OnEnable()	

		BossSwingTimer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		BossSwingTimer:SetScript("OnEvent", BossSwingTimer.COMBAT_LOG_EVENT_UNFILTERED);
		--BossSwingTimer:SetScript("OnUpdate",BossSwingTimer.OnUpdate)
		BossSwingTimer:RegisterEvent("PLAYER_TARGET_CHANGED")
		BossSwingTimer:RegisterEvent("PLAYER_FOCUS_CHANGED")
		BossSwingTimer:RegisterEvent("PLAYER_REGEN_DISABLED")
		BossSwingTimer:RegisterEvent("PLAYER_REGEN_ENABLED")
		
		BossSwingTimer.PLAYER_TARGET_CHANGED = BossSwingTimer.UpdateAttackSpeeds
		BossSwingTimer.PLAYER_FOCUS_CHANGED = BossSwingTimer.UpdateAttackSpeeds
		
		BossSwingTimer.isrun=true;
	end

	

	
	function amwingTimer(unit,isTarget,Min,Max,isshowinf)	
		if not BossSwingTimer.isrun then
			BossSwingTimer:OnEnable();
		end
		
		if isTarget and (not unit or not UnitGUID(unit)) then 
			return false,0;
		end
		
		local time = GetTime();
		if isTarget then
		
			local v = BossSwingTimer.swings[UnitGUID(unit)];
			
			if v and v.next then
				local n = (v.next - time) * 1000;
						
				if n >= Min and n <= Max then
				
					
					if isshowinf then
						local name = UnitName(unit);
						print("|cffffff00目标:|r" .. (name or "") .. "   |cffffff00时间:|r" .. format("%.0f",n) .. " ms");
					end
					return true,n;
				end
			end
				
		else
			for k, v in pairs(BossSwingTimer.swings) do
				if v.next then
					local n = (v.next - time) * 1000;			
					if n >= Min and n <= Max then
						if isshowinf then
							local name = UnitName(unit);
							print("|cffffff00目标:|r" .. (name or "") .. "   |cffffff00时间:|r" .. format("%.0f",n) .. " ms");
						end
						return true,n;
					end
				end 
			end
		end
		
		return false,0;
	end
 