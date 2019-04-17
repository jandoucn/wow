local rgev = rgev
local BASE = nil
local FilteredNamePlate = _G.FilteredNamePlate

local DifficultyList = {
	[1] = "普通地下城",
	[2] = "英雄地下城",
	[8] = "史诗钥石",
	[23] = "史诗地下城",
}

local isreg = false

local isNeedCheckDifficulty=true
local currentMemberNum=1

local function SendMsg(msg)
	local channel = IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT" or "PARTY"
	print("channer "..tostring(channel))
	print("msg "..msg)
	--SendChatMessage(msg, channel)
end

local function checkDungeonDifficulty()
	if IsInRaid() then
		return
	end

	if (not IsInGroup()) then
		return
	end
	local dung_diff = GetDungeonDifficultyID()

	local gnumber = GetNumGroupMembers()
	local pnumber = GetNumSubgroupMembers()
	print("number "..tostring(gnumber).." "..tostring(pnumber))
	if dung_diff == 8 or dung_diff == 23 then
		print("难度对了，不管他")
		return
	end
	if pnumber < 1 then
		print("人头太少先不打印")
		return
	end
	if not (currentMemberNum == pnumber) then
		SendMsg("[ATG]通报: 当前地下城难度是("..tostring(AllanTG.DifficultyList[dung_diff]).."),酌情修改.")
	end
	currentMemberNum = pnumber
end

local function MyonEvent(self, event, ...)
	local handler = FilteredNamePlate.AchievmentEventList[event]
	if handler then
	    handler(self, event, ...)
	end
end

function FilteredNamePlate:CheckDungDiffRegistEvent()
	if not isreg then
		isreg = true
		rgev(true)
		BASE = CreateFrame("Frame", nil, UIParent)
		BASE:SetScript("OnEvent", MyonEvent)
	end
end

function rgev(registed)
    if registed then
        for k, v in pairs(FilteredNamePlate.AchievmentEventList) do
            BASE:RegisterEvent(k,v)
        end
    else
        for k, v in pairs(FilteredNamePlate.AchievmentEventList) do
            BASE:UnregisterEvent(k,v)
        end
    end
end

FilteredNamePlate.AchievmentEventList = {
	["GROUP_ROSTER_UPDATE"]    = MEMBERS_CHANGED,
	["PARTY_LEADER_CHANGED"]     = MEMBERS_CHANGED,
}



