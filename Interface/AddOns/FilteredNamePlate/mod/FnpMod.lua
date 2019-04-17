local rgev = rgev
local BASE

local isreg = false

local function MyonEvent(self, event, ...)
	local handler = FilteredNamePlate.ModEventList[event]
	if handler then
	    handler(self, event, ...)
	end
end

function FilteredNamePlate:ModRegistEvent() -------MOD改名--外部使用----
	if not isreg then
		isreg = true
		rgev(true)
		BASE = CreateFrame("Frame", nil, UIParent)
		BASE:SetScript("OnEvent", MyonEvent)
	end
end

function rgev(registed)
    if registed then
        for k, v in pairs(FilteredNamePlate.ModEventList) do
            BASE:RegisterEvent(k,v)
        end
    else
        for k, v in pairs(FilteredNamePlate.ModEventList) do
            BASE:UnregisterEvent(k,v)
        end
    end
end

local function actionEnterWorld()
end

FilteredNamePlate.ModEventList = { -------MOD改名--一键替换----
	["PLAYER_ENTERING_WORLD"]		  = actionEnterWorld,
}

