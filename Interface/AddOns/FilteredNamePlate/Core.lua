---
--- Created by Allan.
--- DateTime: 2019/1/10 下午2:23
---

FilteredNamePlate = {}
FNP_LOCALE_TEXT = {}
FNP_LOCALE_TEXT.FNP_VERSION = 670
_G.FilteredNamePlate = FilteredNamePlate
_G.FNP_LOCALE_TEXT = FNP_LOCALE_TEXT

SLASH_FilteredNamePlate1 = "/fnp"
function SlashCmdList.FilteredNamePlate(msg)
    if msg == nil or msg == "" then
        print(L.FNP_PRINT_HELP0)
        print(L.FNP_PRINT_HELP1)
        return
    end

    msg = string.lower(msg)
    if msg == "options" or msg == "opt" then
        FilteredNamePlate:FNP_ChangeFrameVisibility()
    end
end

function FilteredNamePlate:InitAddonPanel()
    local panel = CreateFrame("Frame", "FilteredNamePlateBlizzOptions")
    panel.name = "FNP姓名板过滤(缩放)"
    InterfaceOptions_AddCategory(panel)

    local fs = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    fs:SetPoint("TOPLEFT", 10, -15)
    fs:SetPoint("BOTTOMRIGHT", panel, "TOPRIGHT", 10, -45)
    fs:SetJustifyH("LEFT")
    fs:SetJustifyV("TOP")
    fs:SetText("FilteredNamePlate")
    local fs2 = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    fs2:SetPoint("TOPLEFT", 10, -40)
    fs2:SetPoint("BOTTOMRIGHT", panel, "TOPRIGHT", 10, -45)
    fs2:SetJustifyH("LEFT")
    fs2:SetJustifyV("TOP")
    fs2:SetText(FNP_LOCALE_TEXT.NOTE_TOC)

    local button = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    button:SetText("配置")
    button:SetWidth(128)
    button:SetPoint("TOPLEFT", 10, -78)
    button:SetScript('OnClick', function()
        while CloseWindows() do end
        return FilteredNamePlate:FNP_ChangeFrameVisibility()
    end)
end