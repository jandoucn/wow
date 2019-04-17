--[[ ---------------------------------------------------------------------------

Acheron: death reports

Acheron is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Acheron is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with Acheron.	If not, see <http://www.gnu.org/licenses/>.

----------------------------------------------------------------------------- ]]

-- Upvalues
local select, tinsert, tremove = select, tinsert, tremove
local CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo

--[[ ---------------------------------------------------------------------------
	 Addon and libraries
----------------------------------------------------------------------------- ]]
Acheron = LibStub("AceAddon-3.0"):NewAddon("Acheron", "AceEvent-3.0", "AceTimer-3.0", "AceConsole-3.0", "AceHook-3.0")
local Acheron = Acheron

local L = LibStub("AceLocale-3.0"):GetLocale("Acheron")
local GUI = LibStub("AceGUI-3.0")
local LDB = LibStub:GetLibrary("LibDataBroker-1.1")

local menuTypes= {"SELF", "PARTY", "RAID_PLAYER", "PET"}

local VER = "Allan8.1修复并全汉化"

--[[ ---------------------------------------------------------------------------
	 Ace3 initialization
----------------------------------------------------------------------------- ]]
function Acheron:OnInitialize()

	-- Initialize persistent addon variables
	self.combatLogs = {}
	self.combatLogTimeline = {first = 1, last = 0, logs = {}}
	self.guidNames = {}
	self.guidNameClasses = {}
	self.petOwner = {}
	
	self.solo = nil
	self.currentAuraList = nil
	
	self.frame = nil
	self.frameReports = nil
	self.channels = nil
	self.availableReports = nil
	self.whisperEditBox = nil
	self.whisperTarget = nil
	
	-- Set up saved variables and config options
	self.db = LibStub("AceDB-3.0"):New("AcheronDB", self.defaults, "Default")

	self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileDeleted","OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")
	
	self.options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Acheron", self.options, {"acheron"})
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Acheron", "Acheron")
	
	-- Set up the data broker object
	self.dobj = LDB:NewDataObject("Acheron", {
		type = "launcher",
		icon = "Interface\\Icons\\Ability_Creature_Cursed_03",
    	OnClick = function(frame, button)
    		if button == "LeftButton" then
				Acheron:ShowDeathReports()
            elseif button == "RightButton" then
            	Acheron:ToggleConfigDialog()
            end
        end,
		OnTooltipShow = function(tooltip)
			if tooltip and tooltip.AddLine then
				tooltip:AddLine("Acheron "..VER..L["Hint"])
			end
		end
	})
	
	-- Confirmation dialogues
	StaticPopupDialogs["ACHERON_CLEAR_ALL"] = {
  		text = L["Clear Acheron?"],
  		button1 = L["Yes"],
  		button2 = L["No"],
  		OnAccept = function() Acheron:ClearReports() end,
  		timeout = 0,
  		whileDead = 1,
  		hideOnEscape = 1
	};
	
	StaticPopupDialogs["ACHERON_CLEAR"] = {
  		text = L["Clear Acheron for %s?"],
  		button1 = L["Yes"],
  		button2 = L["No"],
  		OnAccept = function(name) Acheron:ClearReports(name.data) end,
  		timeout = 0,
  		whileDead = 1,
  		hideOnEscape = 1
	};
	
	-- Create the display frame
	self:CreateFrame()
	self:DisplayWhiteList()
	self:DisplayBlackList()
	
	-- Register events
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA")
	
end


--[[ ---------------------------------------------------------------------------
	 Ace3 enable addon
----------------------------------------------------------------------------- ]]
function Acheron:OnEnable()

		self:DoEnable()

end


--[[ ---------------------------------------------------------------------------
	 Enables addon 
----------------------------------------------------------------------------- ]]
function Acheron:DoEnable()

	if not self:GetProfileParam("enable") then return end
	
	-- Register events
	self:RegisterEvent("GROUP_ROSTER_UPDATE", "ScanRaidParty")
	self:RegisterEvent("GROUP_JOINED", "ScanRaidParty")
	self:RegisterEvent("UNIT_PET", "ScanRaidParty")
	self:RegisterEvent("UNIT_NAME_UPDATE", "ScanRaidParty")
	self:RegisterEvent("UNIT_PORTRAIT_UPDATE", "ScanRaidParty")
	
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	
	-- Inject unit frame right-click menu option
	UnitPopupButtons["SHOW_DEATH_REPORTS"] = {
		text = L["Show Acheron Death Reports"],
		dist = 1,
		func = self.ShowDeathReportsFromUnitMenu
	}
	
	for i = 1, #menuTypes do
		tinsert(UnitPopupMenus[menuTypes[i]], #UnitPopupMenus[menuTypes[i]]-1, "SHOW_DEATH_REPORTS")
	end

	self:SecureHook("UnitPopup_ShowMenu")

end


--[[ ---------------------------------------------------------------------------
	 Ace3 disable addon
----------------------------------------------------------------------------- ]]
function Acheron:OnDisable()

	self:DoDisable()

end


--[[ ---------------------------------------------------------------------------
	 Disables addon
----------------------------------------------------------------------------- ]]
function Acheron:DoDisable()

	-- Unregister events
	self:UnregisterEvent("GROUP_ROSTER_UPDATE")
	self:UnregisterEvent("GROUP_JOINED")
	self:UnregisterEvent("UNIT_PET")
	self:UnregisterEvent("UNIT_NAME_UPDATE")
	self:UnregisterEvent("UNIT_PORTRAIT_UPDATE")
	self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

	-- Remove unit frame right-click menu option
	for j = 1, #menuTypes do
		local t = menuTypes[j]
		for i = 1, #UnitPopupMenus[t] do
			if UnitPopupMenus[t][i] == "SHOW_DEATH_REPORTS" then
				tremove(UnitPopupMenus[t], i)
				break
			end
		end
	end

	self:UnhookAll()
	
end


--[[ ---------------------------------------------------------------------------
	 Check to see if we need to disable for PvP zones
----------------------------------------------------------------------------- ]]
function Acheron:ZONE_CHANGED_NEW_AREA()

	if self:GetProfileParam("disablepvp") then 

		local instanceType = select(2, IsInInstance())
	
		if instanceType == "none" and select(1,GetZonePVPInfo()) == "combat" then
			instanceType = "wintergrasp"
		end
		
		local isPvPZone = (instanceType == "pvp" or instanceType == "arena" or instanceType == "wintergrasp")

		if self:GetProfileParam("enable") and isPvPZone then
			self:SetProfileParam("enable", false)
			self:DoDisable()
		elseif not self:GetProfileParam("enable") and not isPvPZone then
			self:SetProfileParam("enable", true)
			self:DoEnable()
		end
		
	end
	
	if self:GetProfileParam("enable") then 
		self:ScanRaidParty()
	end

end


--[[ ---------------------------------------------------------------------------
	 Hook function for injecting unit frame right-click menu option
----------------------------------------------------------------------------- ]]
function Acheron:UnitPopup_ShowMenu(dropdownMenu, which, unit, name, userData, ...)
	local button
	for i=1, UIDROPDOWNMENU_MAXBUTTONS do
		button = _G["DropDownList"..UIDROPDOWNMENU_MENU_LEVEL.."Button"..i];
		if button.value == "SHOW_DEATH_REPORTS" then
		    button.func = UnitPopupButtons["SHOW_DEATH_REPORTS"].func
		end
	end
end


--[[ ---------------------------------------------------------------------------
	 Iterate through party/raid to see what we need to track
----------------------------------------------------------------------------- ]]
function Acheron:ScanRaidParty()
	
	local groupType,groupSize,inGroup="party"
	if IsInRaid() then
		groupType = "raid"
		groupSize = GetNumGroupMembers()
		inGroup = true
	elseif IsInGroup() then
		groupSize = GetNumSubgroupMembers()
		inGroup = true
	else
		groupSize = 0
	end

	local i = 0
	local unit = "player"
	
	while i <= groupSize do
	
		-- put the player into the combat log tracker
		if UnitExists(unit) then
			
			local id = UnitGUID(unit)
			local name = UnitName(unit)
			local playerClass = select(1, UnitClass(unit))
			if not self.combatLogs[id] and name ~= L["Unknown"]  then
				self.guidNames[id] = name
				self.guidNameClasses[id] = playerClass
				self.combatLogs[id] = {first = 1, last = 1, logs = {}}
				self.combatLogs[id].logs[1] = {first = 1, last = 0, log = {}}
			end
			
		end
		
		-- if the player has a pet, put it in too
		if UnitExists(unit.."pet") then
		
			local petId = UnitGUID(unit.."pet")
			local petName = UnitName(unit.."pet")
			local existingPetId = nil

			if not self.combatLogs[petId] and petName ~= L["Unknown"] then
			
				-- check if this player has had a pet with this name before
				-- if so, merge their existing combat logs under the new GUID
				for oldId,_ in pairs(self.combatLogs) do
					if self:GetNameByGUID(oldId) == petName and
					   self.petOwner[oldId] == UnitGUID(unit) and
					   self.combatLogs[oldId]
					then
						existingPetId = oldId
						break
					end
				end
			
				-- existing pet, merge
				if existingPetId then
					self.combatLogs[petId] = self:CopyTable(self.combatLogs[existingPetId])
					self.combatLogs[existingPetId] = nil
					
					for j = self.combatLogTimeline.first, self.combatLogTimeline.last do
						if self.combatLogTimeline.logs[j].id == existingPetId then
							self.combatLogTimeline.logs[j].id = petId
						end
					end
				
				-- new pet
				else
					self.combatLogs[petId] = {first = 1, last = 1, logs = {}}
					self.combatLogs[petId].logs[1] = {first = 1, last = 0, log = {}}
				end

				self.guidNames[petId] = petName
				self.petOwner[petId] = UnitGUID(unit)
			end
			
		end
	
		i = i + 1
		unit = groupType..i
	
	end
	
	-- change grouping status
	if (inGroup) and
	   self.solo == "yes" and
	   self:GetProfileParam("clearongroup") and
	   not IsInInstance()
	then
		self.solo = "no"
		if Acheron:GetProfileParam("confirmclear") then
			StaticPopup_Show("ACHERON_CLEAR_ALL")
		else 
			Acheron:ClearReports()
		end
	end
	
	if (inGroup) then
		self.solo = "no"
	else
		self.solo = "yes"
	end
	
end


--[[ ---------------------------------------------------------------------------
	 Handle combat log events
----------------------------------------------------------------------------- ]]
function Acheron:COMBAT_LOG_EVENT_UNFILTERED()
   					-- 4.2 added srcFlags2(allan改成srcRaidFlags) after srcFlags and dstFlags2（allan 改成dstRaidFlags） after dstFlags
  					-- 4.1 added hideCaster param after eventType
					-- Stop if this is a combat log event we don't care about
	-- 8.1 allan修正数据变化
	local timeStamp, eventType, hideCaster, srcGUID, srcName,
		srcFlags, srcRaidFlags, dstGUID, dstName,dstFlags, dstRaidFlags,
		a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 ,a11, a12 = CombatLogGetCurrentEventInfo()
	if not dstGUID then return end						  
	if not self.combatLogs[dstGUID] then return end
	
	if eventType == "UNIT_DIED" and not UnitIsFeignDeath(self:GetNameByGUID(dstGUID)) then -- we need special case for Spirit of Redemption as well buffid: 20711
		self:HandleDeathEvent(timeStamp, dstGUID)
	elseif eventType == "SPELL_AURA_APPLIED" or
		   eventType == "SPELL_AURA_REMOVED" or
		   eventType == "SPELL_AURA_APPLIED_DOSE" or
		   eventType == "SPELL_AURA_REMOVED_DOSE"
	then
	--print("A:"..eventType..",a1="..tostring(a1).." ,a2="..tostring(a2).." ,a3="..tostring(a3).." ,a4="..tostring(a4).." ,a5="..tostring(a5).." ,a6="..tostring(a6).." ,a7="..tostring(a7).." ,a8="..tostring(a8)
	--	.." ,a9="..tostring(a9).." ,a10="..tostring(a10))
		self:HandleBuffEvent(timeStamp, eventType, hideCaster, srcGUID, 
				srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstFlags2,
					 a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12)
	--elseif eventType == "SPELL_AURA_REFRESH" or eventType == "SPELL_AURA_BROKEN" then
	--	print("not spellname "..tostring(a2).." auratype "..tostring(a4).." amount "..tostring(a5))
	else
	--print(eventType..",a1="..tostring(a1).." ,a2="..tostring(a2).." ,a3="..tostring(a3).." ,a4="..tostring(a4).." ,a5="..tostring(a5).." ,a6="..tostring(a6).." ,a7="..tostring(a7).." ,a8="..tostring(a8)
	--	.." ,a9="..tostring(a9).." ,a10="..tostring(a10).." ,a11="..tostring(a11).." ,a12="..tostring(a12))
		self:HandleHealthEvent(timeStamp, eventType, hideCaster, srcGUID,
			 srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstFlags2,
			  a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12)
	end

end


--[[ ---------------------------------------------------------------------------
	 Handle death
----------------------------------------------------------------------------- ]]
function Acheron:HandleDeathEvent(timeStamp, dstGUID)

	local latestLog = self.combatLogs[dstGUID].logs[self.combatLogs[dstGUID].last]

	-- If nothing happened before the death, forget it (Spirit of Redemption)
	if latestLog.last == 0 then return end

	-- Make the entry
	self:TrackEvent("DEATH", timeStamp, nil, dstGUID, 0, L["Death"])
	
	-- Start a new log
	self.combatLogTimeline.last = self.combatLogTimeline.last + 1
	self.combatLogTimeline.logs[self.combatLogTimeline.last] = {id = dstGUID, reportNum = self.combatLogs[dstGUID].last, timeStamp = timeStamp}
	
	self.combatLogs[dstGUID].last = self.combatLogs[dstGUID].last + 1
	self.combatLogs[dstGUID].logs[self.combatLogs[dstGUID].last] = {first = 1, last = 0, log = {}}
		
	-- Remove older logs if threshold is set
	local timelineNum = self.combatLogTimeline.last - self.combatLogTimeline.first + 1
	if self:GetProfileParam("numreports") > 0 and timelineNum > self:GetProfileParam("numreports") then
	
		local firstTimeline = self.combatLogTimeline.logs[self.combatLogTimeline.first]
		
		self.combatLogs[firstTimeline.id].logs[firstTimeline.reportNum] = nil
		self.combatLogs[firstTimeline.id].first = firstTimeline.reportNum + 1
		
		self.combatLogTimeline.logs[self.combatLogTimeline.first] = nil
		self.combatLogTimeline.first = self.combatLogTimeline.first + 1
		
	end

end


--[[ ---------------------------------------------------------------------------
	 Handle combat events that affect buffs (damage or healing)
----------------------------------------------------------------------------- ]]
function Acheron:HandleBuffEvent(timeStamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2, ...)

	local spellId = select(1, ...)
	local spell = select(2, ...)
	local auraType = select(4,...)
	local auraCount = select(5,...) or 1
	local showinfo = nil
	if not spell then return end
	
	-- special handler for DK "Shadow of Death" ghouling and Priest "Spirit of Redemption"
	if eventType == "SPELL_AURA_APPLIED" and (spellId == 54223 or spellId == 27827) then
		self:HandleDeathEvent(timeStamp, dstGUID)
		return
	elseif eventType == "SPELL_AURA_REMOVED" and spellId == 27827 then
		return
	end
	
	if ((self:GetProfileParam("enablewhitelist") and not self.db.profile.aurawhitelist[spell]) or
		(self:GetProfileParam("enableblacklist") and self.db.profile.aurablacklist[spell]))
	then
		return
	end
	
	local action = spell
	
	if eventType == "SPELL_AURA_REMOVED" then
		action = "- " .. action
		showinfo = auraType.."-"
	else
		action = "+ " .. action
		showinfo = auraType.."+"
	end
	
	-- type(auraCount) == "number" and 
	if auraCount > 1 then
		action = action .. " ("..auraCount..")"
	end

	-- local msg = CombatLog_OnEvent(Blizzard_CombatLog_CurrentSettings, timeStamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2, ...)
	
	self:TrackEvent(auraType, timeStamp, showinfo, dstGUID, 0, action, nil, nil, nil, nil, spellId)
	
end

--[[ ---------------------------------------------------------------------------
	 Handle combat events that affect health (damage or healing)
----------------------------------------------------------------------------- ]]
function Acheron:HandleHealthEvent(timeStamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2, ...)
 	
	-- Initialize values		  
	local amount = nil
	local overamount = nil --增加过量伤害或者过量治疗
	local action = nil
	local missType = nil
	local spellId, spell = ...
	local source = srcName
	local isCrit = false
	local isCrush = false
	local trackType = "DAMAGE"
	local tooltipinfo = L["Damage"]
	
	-- special handling for Priest "Spirit of Redemption"
	if spellId == 27827 then
		return
	end

	-- Extract the useful data	
	local prefix, suffix, special = strsplit("_", eventType)
	
	if prefix == "SPELL" then
		if suffix == "HEAL" or special == "HEAL" then
			if special == "ABSORBED" then
				tooltipinfo = L["Absorbed"]
				amount = 0
				overamount = select(11, ...)
				spellId = select(8, ...)
				spell = select(9, ...)
			else
				tooltipinfo = L["Healing"]
				amount = select(4, ...)
				overamount = select(5, ...)
				isCrit = select(7, ...)
			end
		elseif suffix == "DAMAGE" or suffix == "ENERGIZE" or special == "DAMAGE" then
			amount = 0 - select(4, ...)
			overamount = 0 - select(5, ...)
			isCrit = select(10, ...)
			if eventType == "SPELL_PERIODIC_DAMAGE" then
				tooltipinfo = "DOT"
			end
		elseif suffix == "MISSED" or special == "MISSED" then
			missType =  select(4, ...)
		end
	elseif suffix == "DAMAGE" then
		spellId = nil
		if prefix == "SWING" then
			amount = 0 - select(1, ...)
			overamount = 0 - select(2, ...)
			spell = L["Melee"]
			isCrit = select(7, ...)
			isCrush = select(9, ...)
		elseif prefix == "ENVIRONMENTAL" then
			amount = 0 - select(2, ...)
			overamount = 0 - select(3, ...)
			source = L["Environment"]
		else
			amount = 0 - select(4, ...)
			overamount = 0 - select(5, ...)
			spell = L["Melee"]
			isCrit = select(10, ...)
			isCrush = select(12, ...)
		end
	elseif suffix == "MISSED" then
		if prefix == "SWING" then
			missType =  select(1, ...)
		else
			missType =  select(4, ...)
		end
	end

	-- Convert miss type to string
	if missType then
		if missType == "DODGE" then amount, action = 0, L["Dodge"] end
		if missType == "PARRY" then amount, action = 0, L["Parry"] end
		if missType == "MISS" then amount, action = 0, L["Miss"] end
		if missType == "RESIST" then amount, action = 0, L["Resist"] end
	end
	
	if not amount and not action then return end
	-- type(amount) == "number" and 
	if overamount == nil or overamount == -1 or overamount == 1 then overamount = 0 end
	if amount > 0 or overamount > 0 then
		trackType = "HEAL"
	end
	
	-- local msg = CombatLog_OnEvent(Blizzard_CombatLog_CurrentSettings, timeStamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2, ...)
	
	-- Track the event
	self:TrackEvent(trackType, timeStamp, tooltipinfo, dstGUID, amount, action, source, spell, isCrit, isCrush, spellId, overamount)
	
end

local tblCache = setmetatable({}, {__mode='k'})
local BE_SAVE_CPU = true
local lastRemoveTimeStamp = 0

--[[ ---------------------------------------------------------------------------
	 Track a combat log event
----------------------------------------------------------------------------- ]]
function Acheron:TrackEvent(eventType, timeStamp, msg, dstGUID, amount, action, source, spell, isCrit, isCrush, spellId, overamount)

	local dstName=self:GetNameByGUID(dstGUID)
	local latestLog = self.combatLogs[dstGUID].logs[self.combatLogs[dstGUID].last]

	
	-- Compose the entry for this event
	local _, sourceClass
	if source and UnitIsPlayer(source) then
		_, sourceClass = UnitClass(source)
	end
	
	if not amount then amount = 0 end
	if not source then source = spell end
	
	local curHealth = UnitHealth(dstName)
	local maxHealth = UnitHealthMax(dstName)
	local pctHealth
	if maxHealth==0 then
		pctHealth = 100
	else
		pctHealth = ((curHealth/maxHealth) * 100)
	end
	if pctHealth < 0 then pctHealth = "--%" else pctHealth = format("%3d%%", pctHealth) end

	local entry = next(tblCache)
	if entry then tblCache[entry] = nil else entry = {} end
	
	entry.eventType = eventType
	entry.timeStamp = timeStamp
	entry.msg = msg
	entry.curHealth = curHealth
	entry.maxHealth = maxHealth
	entry.pctHealth = pctHealth
	entry.amount = amount
	entry.overamount = overamount
	entry.action = action
	entry.source = source
	entry.sourceClass = sourceClass
	entry.spell = spell
	entry.isCrit = isCrit
	entry.isCrush = isCrush
	entry.spellId = spellId
		
	-- Add the entry to the latest log
	latestLog.last = latestLog.last + 1
	latestLog.log[latestLog.last] = entry

	-- Remove any entries that are older than our threshold
	if (not BE_SAVE_CPU) or lastRemoveTimeStamp + 1 < timeStamp then
		lastRemoveTimeStamp = timeStamp
		local expireTime = self:GetProfileParam("history")
		for i = latestLog.first, latestLog.last do
			if (latestLog.log[i].timeStamp >= (timeStamp - expireTime)) then
				latestLog.first = i;
				break
			else
				tblCache[latestLog.log[i]] = true
				latestLog.log[i] = nil
			end
		end
	end
end


--[[ ---------------------------------------------------------------------------
	 Clear reports for the given GUID or all reports if no GUID is given
----------------------------------------------------------------------------- ]]
function Acheron:ClearReports(id)

	if id then
		
		if not self:GetNameByGUID(id) then return end
		
		self.combatLogs[id] = nil
		
		local newTimeline = {first = 1, last = 0, logs = {}}
		
		for i = self.combatLogTimeline.first, self.combatLogTimeline.last do
			if self.combatLogs[self.combatLogTimeline.logs[i].id] then
				newTimeline.last = newTimeline.last + 1
				newTimeline.logs[newTimeline.last] = self.combatLogTimeline.logs[i]
			end
		end
		
		self.combatLogTimeline = newTimeline
		
	else
	
		self.combatLogs = {}
		self.combatLogTimeline = {first = 1, last = 0, logs = {}}
		
	end
	
	self:ScanRaidParty()
	
	if self.frame:IsVisible() then
		self:ShowDeathReports()
	end

end


--[[ ---------------------------------------------------------------------------
	 Get GUID from name
----------------------------------------------------------------------------- ]]
function Acheron:GetGUID(name)

	local id = UnitGUID(name)
	
	if name and not id then
		for logid,logname in pairs(Acheron.guidNames) do
			if logname == name then id = logid end
		end
	end
	
	return id

end


--[[ ---------------------------------------------------------------------------
	 Get name form GUID
----------------------------------------------------------------------------- ]]
function Acheron:GetNameByGUID(guid)
	return Acheron.guidNames[guid]
end

function Acheron:GetNameClassByGUID(guid)
	return Acheron.guidNameClasses[guid]
end
--[[ ---------------------------------------------------------------------------
	 Returns a deep copy of the given table
----------------------------------------------------------------------------- ]]
function Acheron:CopyTable(t)

    local result = {}

    for k,v in pairs(t) do
        if type(v) == "table" then
            result[k] = self:CopyTable(v)
        else
            result[k] = v
        end
    end
    
    return result
end

