--------------------------------------- 隊友框架: 顯示職業顔色-------------------------------------hooksecurefunc("UnitFrame_Update", function(self, isParty)    local unit = self.unit    if (unit == "party1" or unit == "party2" or unit == "party3" or unit == "party4") then        local _, class, color        local alpha = self.name:GetAlpha()        if (UnitExists(unit)) then            _, class = UnitClass(unit)            color = RAID_CLASS_COLORS[class] or NORMAL_FONT_COLOR            self.name:SetText(UnitName(unit))            self.name:SetTextColor(color.r, color.g, color.b, alpha)        end    endend)--------------------------------------- 隊友框架: 距離超出半透明 顯示生命%-------------------------------------hooksecurefunc("PartyMemberFrame_OnUpdate", function(self, elapsed)    --生命%    if (not self.CustomHealthText) then        self.CustomHealthText = self:CreateFontString(nil, "ARTWORK", "SystemFont_Outline_Small")        self.CustomHealthText:SetFont(SystemFont_Outline_Small:GetFont(), 8, "THINOUTLINE")        self.CustomHealthText:SetWidth(40)        self.CustomHealthText:SetJustifyH("LEFT")        self.CustomHealthText:SetTextColor(0.9, 0.9, 0.9)        self.CustomHealthText:SetPoint("LEFT", self, "RIGHT", -8, 10) -- 4 28        self.CustomHealthText:SetAlpha(0)    end    if (not self.unitHPPercent or self.unitHPPercent < 0.01) then        self.CustomHealthText:SetText("")    else        self.CustomHealthText:SetText(floor(self.unitHPPercent*100) .. "%")        if (self.unitHPPercent < 0.2) then            self.CustomHealthText:SetAlpha(1)        else            self.CustomHealthText:SetAlpha(0)        end    end    --距離超出透明 (整個框架透明會影響PartyTarget,所以只能部分素材透明)    local inRange = UnitInRange(self.unit)    self.inRangeTimer = (self.inRangeTimer or 0) + elapsed    if (self.inRange ~= inRange and self.inRangeTimer > 0.1) then        self.inRange = inRange        self.inRangeTimer = 0        local prefix = self:GetName()        if (inRange) then            self.name:SetAlpha(1)            _G[prefix.."VehicleTexture"]:SetAlpha(1)            _G[prefix.."Portrait"]:SetAlpha(1)            _G[prefix.."Texture"]:SetAlpha(1)            _G[prefix.."HealthBar"]:SetAlpha(1)            _G[prefix.."ManaBar"]:SetAlpha(1)            _G[prefix.."RoleIcon"]:SetAlpha(1)        else            self.name:SetAlpha(0.5)            _G[prefix.."VehicleTexture"]:SetAlpha(0.5)            _G[prefix.."Portrait"]:SetAlpha(0.5)            _G[prefix.."Texture"]:SetAlpha(0.5)            _G[prefix.."HealthBar"]:SetAlpha(0.5)            _G[prefix.."ManaBar"]:SetAlpha(0.5)            _G[prefix.."RoleIcon"]:SetAlpha(0.5)        end    endend)--隊伍背景調整do    if (PartyMemberBackground) then        local w, h = PartyMemberBackground:GetSize()        PartyMemberBackground:SetSize(w+16, h)    endend--------------------------------------- 隊友施法條-- Party casting bar---------------------------------------顯示位置local function PartyCastingBar_OnShow(self)    local parentFrame = self:GetParent()    local petFrame = _G[parentFrame:GetName() .. "PetFrame"]    if (self.PartyId and petFrame:IsShown()) then		self:SetPoint("BOTTOM", parentFrame, "BOTTOM", 0, -34)	else        self:SetPoint("BOTTOM", parentFrame, "BOTTOM", 0, -13)    endend--事件監聽local function PartyCastingBar_OnEvent(self, event, ...)    local arg1 = ...    if (event == "CVAR_UPDATE") then		if (self.casting or self.channeling) then			self:Show()        else            self:Hide()		end		return	elseif (event == "GROUP_ROSTER_UPDATE"        or event == "PARTY_MEMBER_ENABLE"        or event == "PARTY_MEMBER_DISABLE"        or event == "PARTY_LEADER_CHANGED") then        if (GetDisplayedAllyFrames() ~= "party") then            return        end		local nameChannel  = UnitChannelInfo(self.unit)		local nameSpell  = UnitCastingInfo(self.unit)		if (nameChannel) then			event = "UNIT_SPELLCAST_CHANNEL_START"			arg1 = self.unit		elseif (nameSpell) then			event = "UNIT_SPELLCAST_START"			arg1 = self.unit		else			self.casting = nil			self.channeling = nil			self:SetMinMaxValues(0, 0)			self:SetValue(0)			self:Hide()			return		end		PartyCastingBar_OnShow(self)	end    CastingBarFrame_OnEvent(self, event, arg1, select(2, ...))end-- 創建施法條local frame, parentfor i = 1, MAX_PARTY_MEMBERS do	frame = CreateFrame("STATUSBAR", "PartyCastingBar"..i, _G["PartyMemberFrame"..i], "SmallCastingBarFrameTemplate")    frame.PartyId = i    frame.Icon:Hide()    frame:SetScale(0.7)    frame:SetScript("OnShow", PartyCastingBar_OnShow)    frame:SetScript("OnEvent", PartyCastingBar_OnEvent)    frame:RegisterEvent("GROUP_ROSTER_UPDATE")	frame:RegisterEvent("PARTY_MEMBER_ENABLE")	frame:RegisterEvent("PARTY_MEMBER_DISABLE")	frame:RegisterEvent("PARTY_LEADER_CHANGED")    frame:RegisterEvent("CVAR_UPDATE")    CastingBarFrame_OnLoad(frame, "party"..i, false, false)    CastingBarFrame_SetNonInterruptibleCastColor(frame, 1.0, 0.7, 0)    local prev = "PartyMemberFrame"..(i-1) .. "PetFrame"    if (_G[prev]) then        _G["PartyMemberFrame"..i]:SetPoint("TOPLEFT", _G[prev], "BOTTOMLEFT", -23, -30)    end        parent = _G["PartyMemberFrame"..i]    parent.bufftip = CreateFrame("Frame", nil, parent)    parent.bufftip:SetSize(40, 40)    parent.bufftip:SetPoint("TOPLEFT", 5, -6)    parent.bufftip.atonement = parent.bufftip:CreateTexture(nil, "ARTWORK")    parent.bufftip.atonement:SetTexture("Interface\\Minimap\\UI-ArchBlob-MinimapRing")    parent.bufftip.atonement:SetVertexColor(0, 1, 0)    parent.bufftip.atonement:SetSize(40, 40)    parent.bufftip.atonement:SetPoint("CENTER")    parent.bufftip:SetFrameLevel(86)    parent.bufftip:SetAlpha(0)end--------------------------------------- 隊友頭像戰鬥數值顯示 HEAL-------------------------------------hooksecurefunc("PartyMemberFrame_OnUpdate", function(self, elapsed)    if (not self.hasCombatFeedback) then        self.hasCombatFeedback = true        self.CombatFeedback = CreateFrame("Frame", nil, self)        self.CombatFeedback:SetFrameLevel(99)        self.CombatFeedback.Text = self.CombatFeedback:CreateFontString(nil, "BORDER", "NumberFontNormalHuge")        self.CombatFeedback.Text:SetPoint("CENTER", _G[self:GetName().."Portrait"], "CENTER")        self.CombatFeedback.Text:Hide()        self:RegisterUnitEvent("UNIT_COMBAT", "party"..self:GetID(), "player")        CombatFeedback_Initialize(self, self.CombatFeedback.Text, 18)    end    CombatFeedback_OnUpdate(self, elapsed)end)hooksecurefunc("PartyMemberFrame_OnEvent", function(self, event, arg1, arg2, arg3, arg4, arg5, ...)    if (event == "UNIT_COMBAT") then        if (arg1 == self.unit and arg2 == "HEAL") then			CombatFeedback_OnCombatEvent(self, arg2, arg3, arg4, arg5)		end    endend)