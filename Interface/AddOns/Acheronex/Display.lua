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

--[[ ---------------------------------------------------------------------------
	 Addon and libraries
----------------------------------------------------------------------------- ]]

local L = LibStub("AceLocale-3.0"):GetLocale("Acheron")
local GUI = LibStub("AceGUI-3.0")

local VER = " Allan8.1修复并全汉化"


--[[ ---------------------------------------------------------------------------
	 Create the main display frame
----------------------------------------------------------------------------- ]]
function Acheron:ChangeDamageFilteredSlide()
	if self.damageFilterSlider then
		self.damageFilterSlider:SetSliderValues(0, tonumber(Acheron:GetProfileParam("maxfiltereddamage")) or 2000, 200)
	end
end

function Acheron:CreateFrame()

	if self.frame then return end
	
	local f = GUI:Create("Window")
	f:SetTitle("Acheron "..VER)
	f:SetStatusText("")
	f:SetLayout("Flow")
	f:SetWidth(630)
	f:SetHeight(700)
	f.width = "fill"
	f.frame:SetFrameStrata("HIGH")

	local ds = GUI:Create("Dropdown")
	ds:SetLabel(L["Show"])
	ds:SetWidth(125)
	ds:SetList(Acheron:GetAvailableReports())
	ds:SetCallback("OnValueChanged", function(widget,event,value)
		if value == "-1" then
			value = nil
		else
			value = Acheron:GetGUID(value)
		end
 		Acheron:ShowDeathReports(value)
	end)
	f:AddChild(ds)
	
	local s = GUI:Create("Slider")
	s:SetLabel(L["Time to Show"])
	s:SetWidth(150)
	s:SetSliderValues(1, 60, 1)
	s:SetValue(Acheron:GetProfileParam("reporttime"))
	s:SetCallback("OnValueChanged", function(widget,event,value)
		Acheron:SetProfileParam("reporttime", value)
		local status = Acheron.frameReports.status or Acheron.frameReports.localstatus
		if status and status.selected then
			Acheron:PopulateEntries(strsplit(":", status.selected))
		end
	end)
	f:AddChild(s)
	
	local s2 = GUI:Create("Slider")
	s2:SetLabel(L["Amount Filtered"])
	s2:SetWidth(150)
	s2:SetSliderValues(0, tonumber(Acheron:GetProfileParam("maxfiltereddamage")) or 2000, 20)
	s2:SetValue(Acheron:GetProfileParam("reportthreshold"))
	s2:SetCallback("OnValueChanged", function(widget,event,value)
		Acheron:SetProfileParam("reportthreshold", value)
		local status = Acheron.frameReports.status or Acheron.frameReports.localstatus
		if status and status.selected then
			Acheron:PopulateEntries(strsplit(":", status.selected))
		end
	end)
	f:AddChild(s2)
	self.damageFilterSlider = s2
	
	local sliderfont = GUI:Create("Slider")
	sliderfont:SetLabel(L["Font show size"])
	sliderfont:SetWidth(150)
	sliderfont:SetSliderValues(8, 22, 1)
	sliderfont:SetValue(Acheron:GetProfileParam("fontsize"))
	sliderfont:SetCallback("OnValueChanged", function(widget,event,value)
		Acheron:SetProfileParam("fontsize", value)
	end)
	f:AddChild(sliderfont)

	local cbd = GUI:Create("CheckBox")
	cbd:SetLabel(L["Damage"])
	cbd:SetWidth(80)
	cbd:SetValue(Acheron:GetProfileParam("showdamage"))
	cbd:SetCallback("OnValueChanged", function(widget,event,value)
		Acheron:SetProfileParam("showdamage", value)
		local status = Acheron.frameReports.status or Acheron.frameReports.localstatus
		if status and status.selected then
			Acheron:PopulateEntries(strsplit(":", status.selected))
		end
	end)
	f:AddChild(cbd)
	
	local cbh = GUI:Create("CheckBox")
	cbh:SetLabel(L["Healing"])
	cbh:SetWidth(80)
	cbh:SetValue(Acheron:GetProfileParam("showhealing"))
	cbh:SetCallback("OnValueChanged", function(widget,event,value)
		Acheron:SetProfileParam("showhealing", value)
		local status = Acheron.frameReports.status or Acheron.frameReports.localstatus
		if status and status.selected then
			Acheron:PopulateEntries(strsplit(":", status.selected))
		end
	end)
	f:AddChild(cbh)
	
	local cbb = GUI:Create("CheckBox")
	cbb:SetLabel(L["Buffs"])
	cbb:SetWidth(90)
	cbb:SetValue(Acheron:GetProfileParam("showbuff"))
	cbb:SetCallback("OnValueChanged", function(widget,event,value)
		Acheron:SetProfileParam("showbuff", value)
		local status = Acheron.frameReports.status or Acheron.frameReports.localstatus
		if status and status.selected then
			Acheron:PopulateEntries(strsplit(":", status.selected))
		end
	end)
	f:AddChild(cbb)
	
	local cbdb = GUI:Create("CheckBox")
	cbdb:SetLabel(L["Debuffs"])
	cbdb:SetWidth(90)
	cbdb:SetValue(Acheron:GetProfileParam("showdebuff"))
	cbdb:SetCallback("OnValueChanged", function(widget,event,value)
		Acheron:SetProfileParam("showdebuff", value)
		local status = Acheron.frameReports.status or Acheron.frameReports.localstatus
		if status and status.selected then
			Acheron:PopulateEntries(strsplit(":", status.selected))
		end
	end)
	f:AddChild(cbdb)
	
	-- f:AddChild(g1)
	
	local g2 = GUI:Create("InlineGroup")
	g2:SetTitle(L["Report"])
	g2:SetLayout("Flow")
	g2.width = "fill"
	
	local cba = GUI:Create("CheckBox")
	cba:SetLabel(L["Absolute Health"])
	cba:SetWidth(135)
	cba:SetValue(Acheron:GetProfileParam("abshealth"))
	cba:SetCallback("OnValueChanged", function(widget,event,value)
		Acheron:SetProfileParam("abshealth", value)
		local status = Acheron.frameReports.status or Acheron.frameReports.localstatus
		if status and status.selected then
			Acheron:PopulateEntries(strsplit(":", status.selected))
		end
	end)
	g2:AddChild(cba)
	
	local d = GUI:Create("Dropdown")
	d:SetLabel(L["Report To"])
	d:SetWidth(125)
	d:SetList(Acheron:GetAcheronChannels())
	d:SetValue(Acheron:GetProfileParam("reportchannel"))
	d:SetCallback("OnValueChanged", function(widget,event,value) 
		Acheron:SetProfileParam("reportchannel", value)
		if value == L["whisper"] then
			Acheron.whisperEditBox.frame:Show()
		else
			Acheron.whisperEditBox.frame:Hide()
		end
	end)
	g2:AddChild(d)
	
	local wt = GUI:Create("EditBox")
	wt:SetLabel(L["Whisper To"])
	wt:SetWidth(150)
	wt:SetCallback("OnEnterPressed", function(widget,event,value) Acheron.whisperTarget = value end)
	g2:AddChild(wt)
	f:AddChild(g2)

	--[[ local bu = GUI:Create("Button")
	bu:SetText(L["Clear"])
	bu:SetWidth(100)
	bu:SetCallback("OnClick", function(widget,event,value)
		if Acheron.availableReports.value then
			if Acheron:GetProfileParam("confirmclear") then
				local dialog = StaticPopup_Show("ACHERON_CLEAR", Acheron.availableReports.value)
				if(dialog) then
       				dialog.data = Acheron.availableReports.value
   				end
			else 
   				Acheron:ClearReports(Acheron.availableReports.value)
			end
		end
	end)
	f:AddChild(bu) ]]

	local bu2 = GUI:Create("Button")
	bu2:SetText(L["Clear All"])
	bu2:SetWidth(100)
	bu2:SetCallback("OnClick", function(widget,event,value)
		if Acheron:GetProfileParam("confirmclear") then
			StaticPopup_Show("ACHERON_CLEAR_ALL")
		else 
			Acheron:ClearReports()
		end
	end)
	f:AddChild(bu2)
	
	local th = GUI:Create("Label")
	th:SetText(L["Ctrl-left-click a line in the combat log to report.\nAlt-left-click a line to report just that line."])
	th:SetWidth(300)
	f:AddChild(th)
		
	local t = GUI:Create("TreeGroup")
	t:SetLayout("Fill")
	t:SetCallback("OnClick", function(_, _, value) Acheron:PopulateEntries(strsplit(":", value)) end)
	t.width = "fill"
	t.height = "fill"
	f:AddChild(t)
	
	f:Hide()

	self.frame = f
	self.frameReports = t
	self.channels = d
	self.availableReports = ds
	self.whisperEditBox = wt
	
end


--[[ ---------------------------------------------------------------------------
	 Formulate the table of channels Acheron may use to report, filtering out
	 server channels
----------------------------------------------------------------------------- ]]
function Acheron:GetAcheronChannels()

	local acheronChannels = {}
	acheronChannels[L["say"]] = L["say"]
	acheronChannels[L["party"]] = L["party"]
	acheronChannels[L["instance"]] = L["instance"]
	acheronChannels[L["raid"]] = L["raid"]
	acheronChannels[L["guild"]] = L["guild"]
	acheronChannels[L["officer"]] = L["officer"]
	acheronChannels[L["whisper"]] = L["whisper"]
	
	local serverChanTable = {}
	local serverChannels = {EnumerateServerChannels()}
	
	for idx, chan in ipairs(serverChannels) do
		serverChanTable[chan] = true
	end
	
	local channels={GetChannelList()}

	for i=1,(#channels)/2 do
		if not serverChanTable[channels[i*2]] then
			acheronChannels[tostring(channels[i*2-1])] = channels[i*2]
		end
	end
	
	return acheronChannels
	
end


--[[ ---------------------------------------------------------------------------
	 Formulate the table of reports Acheron has
----------------------------------------------------------------------------- ]]
local name_color_pattern = "|c%s%s|r"
local name_color_classes

function Acheron:GetAvailableReports()
	local acheronReports = {}

	if name_color_classes == nil then
		name_color_classes = {}
		do
			local localClass, class
			for i = 1, GetNumClasses() do
				localClass, class = GetClassInfo(i)
				name_color_classes[localClass] = class
			end
		end
	end

	for id,_ in pairs(self.combatLogs) do
		if self:IsDisplayGUID(id) then
			local name = self:GetNameByGUID(id)
			local class = self:GetNameClassByGUID(id)
			local color = select(4,GetClassColor(name_color_classes[class]))
			acheronReports[name] = string.format(name_color_pattern, color, name)
		end
	end
	
	acheronReports["-1"] = "---"
	
	return acheronReports

end


--[[ ---------------------------------------------------------------------------
	 Show death reports from the unit right-click dropdown menu
----------------------------------------------------------------------------- ]]
function Acheron:ShowDeathReportsFromUnitMenu()
	Acheron:ShowDeathReports(Acheron:GetGUID(UIDROPDOWNMENU_INIT_MENU.name))
end


--[[ ---------------------------------------------------------------------------
	 Display reports for the given GUID, or show a timeline if no GUID is given
----------------------------------------------------------------------------- ]]
function Acheron:ShowDeathReports(id)

	local isTimeline = false
	if not id then isTimeline = true end

	-- populate dynamic dropdowns
	Acheron.channels:SetList(Acheron:GetAcheronChannels())
	Acheron.availableReports:SetList(Acheron:GetAvailableReports())
	
	if Acheron.frameReports then
		Acheron.frameReports:ReleaseChildren()
	end

	-- get the report to display
	local reportNum = nil
	
	if not isTimeline and Acheron.combatLogs[id] and (Acheron.combatLogs[id].last - Acheron.combatLogs[id].first) > 0 then
		reportNum = Acheron.combatLogs[id].last - 1
	elseif (Acheron.combatLogTimeline.last - Acheron.combatLogTimeline.first + 1) > 0 and isTimeline then
		reportNum = Acheron.combatLogTimeline.logs[Acheron.combatLogTimeline.last].reportNum
		id = Acheron.combatLogTimeline.logs[Acheron.combatLogTimeline.last].id
	end
	
	local name = Acheron:GetNameByGUID(id)
	
	-- populate the list of reports
	if not isTimeline then
		Acheron.availableReports:SetValue(name)
		Acheron:PopulateReports(id)
	else
		Acheron.availableReports:SetValue(nil)
		Acheron:PopulateTimeline()
	end
	
	-- populate the entries for the last report to be highlighted
	if reportNum then
		Acheron:PopulateEntries(id, reportNum)
		Acheron.frameReports:SelectByValue(id..":"..reportNum)
	end
	
	Acheron.frame:Show()
	
	if Acheron:GetProfileParam("reportchannel") == L["whisper"] then
		Acheron.whisperEditBox.frame:Show()
	else
		Acheron.whisperEditBox.frame:Hide()
	end
	
end


--[[ ---------------------------------------------------------------------------
	 Populate the main display frames with the report data for given GUID
----------------------------------------------------------------------------- ]]
function Acheron:PopulateReports(id)

	if not self.combatLogs[id] then return end

	local name = Acheron:GetNameByGUID(id)
	self.frame:SetStatusText(name)
	
	local t = {}

	for i = self.combatLogs[id].first, (self.combatLogs[id].last - 1) do
		local lastEntry = self:GetLastDamageEntry(self.combatLogs[id].logs[i])
		local report = {}
		report.value = id..":"..i
		report.text = format("[%s] %s - %s", date("%H:%M:%S", lastEntry.timeStamp), lastEntry.source or "", lastEntry.spell or "")
		
		tinsert(t, report)
	end
	
	self.frameReports:SetTree(t)
	
end

--[[ ---------------------------------------------------------------------------
	 Populate the main display frames with the report data for last x number of deaths
----------------------------------------------------------------------------- ]]
function Acheron:PopulateTimeline()
	
	self.frame:SetStatusText(nil)

	local t = {}
	
	-- where in the timeline we should start to display
	local showing = Acheron:GetProfileParam("timelinetoshow")
	local startingPoint = nil
	
	for i = self.combatLogTimeline.last, self.combatLogTimeline.first, -1 do
	
		if self:IsDisplayGUID(self.combatLogTimeline.logs[i].id) then
			showing = showing - 1
		end
		
		if showing == 0 then
			startingPoint = i
			break
		end
	end
	
	if not startingPoint then startingPoint = self.combatLogTimeline.first end

	-- populate the timeline	
	for i = startingPoint, self.combatLogTimeline.last do
	
		local timelineLog = self.combatLogTimeline.logs[i]
		
		if self:IsDisplayGUID(timelineLog.id) then
			local name = Acheron:GetNameByGUID(timelineLog.id)
			local lastEntry = self:GetLastDamageEntry(self.combatLogs[timelineLog.id].logs[timelineLog.reportNum])
			local report = {}
			report.value = timelineLog.id..":"..timelineLog.reportNum
			report.text = format("[%s] %s [%s - %s]", date("%H:%M:%S", lastEntry.timeStamp), name, lastEntry.source or "", lastEntry.spell or "")
			tinsert(t, report)
		end
		
	end
	
	self.frameReports:SetTree(t)
	
end


--[[ ---------------------------------------------------------------------------
	 Find the last entry that caused damage
----------------------------------------------------------------------------- ]]
function Acheron:GetLastDamageEntry(report)

	local lastEntry = nil
	
	for i = (report.last - 1), report.first, -1 do
		if report.log[i] and report.log[i].amount < 0 then
			lastEntry = report.log[i]
			break
		end
	end
	
	if not lastEntry then
		lastEntry = report.log[report.last]
	end
	
	return lastEntry

end

local function onEnter(widget)
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(widget.frame or widget, "ANCHOR_RIGHT")
	if widget.userdata.entry then
		if widget.userdata.entry.isCrit then GameTooltip:AddLine(format("|cffffffff%s|r", L["Critical"])) end
		if widget.userdata.entry.isCrush then GameTooltip:AddLine(format("|cffffffff%s|r", L["Crushing"])) end
		GameTooltip:AddLine(format("|cffffffff%d/%d (%s)|r",
							widget.userdata.entry.curHealth,
							widget.userdata.entry.maxHealth,
							widget.userdata.entry.pctHealth))
		if widget.userdata.entry.msg then GameTooltip:AddLine(format("|cffffffff%s|r", widget.userdata.entry.msg)) end
	end
	
	GameTooltip:AddLine(L["Ctrl-left-click to report from this point.\nAlt-left-click to report just this line."])
	GameTooltip:Show()
end

local function onLeave()
	GameTooltip:Hide()
end

local function onClick(widget, event, button, ...)
	if button == "LeftButton" and IsControlKeyDown() then
		Acheron:Report(widget.userdata.id, widget.userdata.reportNum, widget.userdata.seconds)
	elseif button == "LeftButton" and IsAltKeyDown() then
		Acheron:Report(widget.userdata.id, widget.userdata.reportNum, widget.userdata.seconds, true)
	end
end

Acheron.eventWidget_OnEnter = onEnter
Acheron.eventWidget_OnLeave = onLeave
Acheron.eventWidget_OnClick = onClick


--[[ ---------------------------------------------------------------------------
	 Populate the main display frames with the death report for the entry
----------------------------------------------------------------------------- ]]
function Acheron:PopulateEntries(id, reportNum)

	self.frameReports:ReleaseChildren()
	local name = Acheron:GetNameByGUID(id)
	reportNum = tonumber(reportNum)
	local reportSet = self:FilterReport(id, reportNum, self:GetProfileParam("reporttime"))
	if not reportSet[#reportSet] then return end
	local lastTimeStamp = reportSet[#reportSet].timeStamp
	
	local sf = GUI:Create("ScrollFrame")
	sf:SetLayout("Flow")
	
	for i,entry in ipairs(reportSet) do

		local label = GUI:Create("InteractiveLabel")
		label.width = "fill"
		local p, h, f = label.label:GetFont()
		label:SetFont(p, self:GetProfileParam("fontsize"), f)
		label:SetHighlight(0.4,0.4,0,0.5)
		label:SetCallback("OnEnter", onEnter)
		label:SetCallback("OnLeave", onLeave)
		label:SetCallback("OnClick", onClick)

		label:SetText(self:EntryToString(entry, name, lastTimeStamp))
		label.userdata.id = id
		label.userdata.reportNum = reportNum
		label.userdata.entry = entry
		label.userdata.seconds = lastTimeStamp - entry.timeStamp
		
		sf:AddChild(label)

	end
	
	self.frameReports:AddChild(sf)

end


--[[ ---------------------------------------------------------------------------
	 Report a combat log
----------------------------------------------------------------------------- ]]
function Acheron:Report(id, reportNum, seconds, onlyOne)

	local name = Acheron:GetNameByGUID(id)
	reportNum = tonumber(reportNum)
	seconds = tonumber(seconds)
	local channel = self:GetProfileParam("reportchannel")
	
	-- validate channel destination
	if channel == L["whisper"] then
		if not self.whisperTarget then
			if not UnitExists("target") then self:DoPrint(nil, L["Acheron: No whisper target"]) return end
			if not UnitIsPlayer("target") then self:DoPrint(nil, L["Acheron: Whisper target is not a player"]) return end
		end
	elseif channel == L["party"] then
		if GetNumGroupMembers() == 0 then self:DoPrint(nil, L["Acheron: You are not in a party"]) return end
	elseif channel == L["raid"] then
		if GetNumGroupMembers() == 0 then self:DoPrint(nil, L["Acheron: You are not in a raid"]) return end
	elseif channel == L["instance"] then
		if GetNumGroupMembers() == 0 then self:DoPrint(nil, L["Acheron: You are not in a instance"]) return end
	elseif channel == L["guild"] or channel == L["officer"] then
		if not IsInGuild() then self:DoPrint(nil, L["Acheron: You are not in a guild"]) return end
	elseif channel ~= L["say"]  then
		local chanNum = GetChannelName(channel);
		if not chanNum or chanNum == 0 then self:DoPrint(nil, L["Acheron: No such channel: %s"], channel) return end
	end
	
	-- finally report
	local report = self.combatLogs[id].logs[reportNum]
	local lastTimeStamp = report.log[report.last].timeStamp
	
	local reportSet = self:FilterReport(id, reportNum, seconds, onlyOne)
	
	if next(reportSet) then
		self:DoPrint(channel, format(L["Acheron: %s [%s]"], name, date("%H:%M:%S", lastTimeStamp)))
	end
	
	for i,entry in ipairs(reportSet) do
		self:DoPrint(channel, self:EntryToString(entry, name, lastTimeStamp))
	end

end


--[[ ---------------------------------------------------------------------------
	 Return the set of report data for output based on current filter settings
----------------------------------------------------------------------------- ]]
function Acheron:FilterReport(id, reportNum, seconds, onlyOne)

	local reportSet = {}
	local report = self.combatLogs[id].logs[reportNum]
	if not report or reportNum == self.combatLogs[id].last then return reportSet end
	local lastTimeStamp = report.log[report.last].timeStamp
	
	local threshold = self:GetProfileParam("reportthreshold")
	local showDmg = self:GetProfileParam("showdamage")
	local showHeal = self:GetProfileParam("showhealing")
	local showBuff = self:GetProfileParam("showbuff")
	local showDebuff = self:GetProfileParam("showdebuff")

	for i = report.first, report.last do
	
		local entry = report.log[i]
		
		if ((entry.timeStamp >= (lastTimeStamp - seconds)) and
			((entry.eventType == "HEAL" and showHeal and entry.amount >= threshold) or
			 (entry.eventType == "DAMAGE" and showDmg and entry.amount <= -threshold) or
			 (entry.eventType == "BUFF" and showBuff) or
			 (entry.eventType == "DEBUFF" and showDebuff) or
			 (entry.eventType == "DEATH")))
		then
			tinsert(reportSet, entry)
			if onlyOne then break end
		end
		
	end
	
	return reportSet

end

local colors_marix = {
	["BUFF+"] = "|cff43CD80%s|r",
	["BUFF-"] = "|cff43CD80%s|r",
	["DEBUFF+"] = "|cffff8000%s|r",
	["DEBUFF-"] = "|cffff8000%s|r",
}

--[[ ---------------------------------------------------------------------------
	 Formats a death report entry into a displayable string
----------------------------------------------------------------------------- ]]
function Acheron:EntryToString(entry, name, lastTimeStamp)

	local showHealth = self:GetProfileParam("abshealth")

	-- timestamp
	local formatStr = "%7.3f "
	local printArgs = {entry.timeStamp - lastTimeStamp}
	
	-- if not the end, include the current approx health
	if entry.eventType ~= "DEATH" then
		formatStr = formatStr.." (%s) "
		if showHealth then
			tinsert(printArgs, tostring(entry.curHealth))
		else
			tinsert(printArgs, entry.pctHealth)
		end
	end
	-- either add the special action or add the health damage/heal
	if ((entry.eventType == "HEAL" or entry.eventType == "DAMAGE") and (not entry.action)) then
		local red = 255
		local green = 255
	
		if entry.eventType == "HEAL" then
			red = 0
		else
			if "DOT" == entry.msg then
				green = 128
			else
				green = 0
			end
		end

		if entry.overamount == 0 then
			formatStr = formatStr.."|cff%02X%02X00%+7d%s|r"
			tinsert(printArgs, red)
			tinsert(printArgs, green)
			tinsert(printArgs, entry.amount)
		else
			formatStr = formatStr.."|cff%02X%02X00%+7d(%+7d)%s|r"
			tinsert(printArgs, red)
			tinsert(printArgs, green)
			tinsert(printArgs, entry.amount)
			tinsert(printArgs, entry.overamount)
		end
		tinsert(printArgs, (entry.isCrit and "!") or (entry.isCrush and "*") or " ")
	elseif entry.eventType == "DAMAGE" and entry.action then
		formatStr = formatStr.."|cffaaaaaa%s|r"
		tinsert(printArgs, entry.action)
	elseif entry.action then -- BUFF DEBUFF + -
		if entry.msg then--print(entry.msg) end
			formatStr = formatStr..colors_marix[entry.msg]
		else
			formatStr = formatStr.."%s"
		end
		tinsert(printArgs, entry.action)
	end
	-- if there's a source for the action, add it
	if entry.source then
		local classColor = nil
		if entry.sourceClass then
			classColor = RAID_CLASS_COLORS[entry.sourceClass]
		end
		
		if classColor then
			formatStr = formatStr.." [|cff%02x%02x%02x%s|r"
			tinsert(printArgs, classColor.r*255)
			tinsert(printArgs, classColor.g*255)
			tinsert(printArgs, classColor.b*255)
			tinsert(printArgs, entry.source)
		else
			formatStr = formatStr.." [%s"
			tinsert(printArgs, entry.source)
		end
	end
			
	-- if there's a spell for the action, add it
	if entry.spell then
		formatStr = formatStr.." - %s]"
		tinsert(printArgs, entry.spell)
	elseif entry.source then
		formatStr = formatStr.."]"
	end

	return format(formatStr, unpack(printArgs))

end


--[[ ---------------------------------------------------------------------------
	 Determine where to do text output
----------------------------------------------------------------------------- ]]
function Acheron:DoPrint(loc, str)

    if loc then
    
    	local target = nil
    	
    	if loc == L["whisper"] then
    		target = self.whisperTarget or UnitName("target")
    		loc = "whisper"
	elseif loc == L["say"] then
    		loc = "say"
    	elseif loc == L["instance"] then
    		loc = "instance_chat"
    	elseif loc == L["party"] then
    		loc = "party"
    	elseif loc == L["raid"] then
    		loc = "raid"
    	elseif loc == L["guild"] then
    		loc = "guild"    		
    	elseif loc == L["officer"] then
    		loc = "officer"
    	elseif tonumber(loc) then
    		target = tonumber(loc)
    	    loc = "channel"
    	end    	
    	
    	-- strip color tags out
    	str = gsub(str, "|c%x%x%x%x%x%x%x%x(.-)|r", "%1")
    	
    	if ChatThrottleLib then
           ChatThrottleLib:SendChatMessage("NORMAL", "Acheron", str, loc, nil, target)
		else
           SendChatMessage(str, loc, nil, target)
 		end
   	
    else
    
    	DEFAULT_CHAT_FRAME:AddMessage(str)
    	
    end

end


--[[ ---------------------------------------------------------------------------
	 Whether or not to display the given GUID based on preferences
----------------------------------------------------------------------------- ]]
function Acheron:IsDisplayGUID(id)

	local result = false

	if not Acheron.petOwner[id] or
	   (Acheron:GetProfileParam("showpets") and
	    (not Acheron:GetProfileParam("onlymypet") or Acheron.petOwner[id] == UnitGUID("player")))
	then
		result = true
	end
	
	return result
end