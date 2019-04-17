local waitTable = {};
local waitFrame = nil;

-- saved buttons
if not amCustomButtonsData then
	amCustomButtonsData = {};
end

-- Konfiguration
CustomButtonsConfig = {};

isInConfig = false;
loaded = false;

CustomButtonsConfig.ShowCount = 1;
CustomButtonsConfig.Sound = 1;
CustomButtonsConfig.RangeIndicator = 0;

local selectedButton = nil;

local MASQUE = LibStub("Masque", true);
local buttongroup = nil;

function amCustomButtons_StartDelay(delay, func, ...)
    if(type(delay)~="number" or type(func)~="function") then
        return false;
    end
    
    if(waitFrame == nil) then
        waitFrame = CreateFrame("Frame","amCustomButtons_WaitFrame", UIParent);
        waitFrame:SetScript("onUpdate",function (self,elapse)
            local count = #waitTable;
            local i = 1;
            
            while(i<=count) do
                local waitRecord = tremove(waitTable,i);
                local d = tremove(waitRecord,1);
                local f = tremove(waitRecord,1);
                local p = tremove(waitRecord,1);
                
                if(d>elapse) then
                    tinsert(waitTable,i,{d-elapse,f,p});
                    i = i + 1;
                else
                    count = count - 1;
                    f(unpack(p));
                end
            end
        end);
    end
    
    tinsert(waitTable,{delay,func,{...}});
    
    return true;
end

-- functions
function amCustomButtons_OnLoad(self)
 	DEFAULT_CHAT_FRAME:AddMessage("|c333399ffNirriti's |rCustomButtons loaded.", 1.0, 1.0, 1.0, 1, 10);
 
 	self:RegisterEvent("ADDON_LOADED");
 	--[[self:RegisterEvent("MODIFIER_STATE_CHANGED");
 	self:RegisterEvent("PLAYER_TALENT_UPDATE");
 	self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED");
 	self:RegisterEvent("LEARNED_SPELL_IN_TAB");
    self:RegisterEvent("UPDATE_SHAPESHIFT_FORM");
    self:RegisterEvent("PLAYER_ENTERING_WORLD");    
    self:RegisterEvent("PET_BATTLE_OPENING_START"); 
    self:RegisterEvent("PET_BATTLE_CLOSE"); --]]
 	
    hooksecurefunc("ActionButton_OnUpdate", amCustomButtons_ActionButton_OnUpdate);
end

function amCustomButtons_InitSlashCommandHandler()

	--[[SLASH_CUSTOMBUTTONS1 = "/custombuttons";
  	SLASH_CUSTOMBUTTONS2 = "/cb";
  	SlashCmdList["CUSTOMBUTTONS"] = function(msg)
		amCustomButtons_SlashCommandHandler(msg);
	end--]]
end

local debug = false;
function cb_debug(value, name)
    if (not debug) then
        return;
    end

    if (name) then
 	    DEFAULT_CHAT_FRAME:AddMessage("debug "..name..": "..(value or "nil"), 1.0, 1.0, 1.0, 1, 10);
    else
 	    DEFAULT_CHAT_FRAME:AddMessage("debug: "..(value or "nil"), 1.0, 1.0, 1.0, 1, 10);
    end
end

function amCustomButtons_SlashCommandHandler(msg)
	DEFAULT_CHAT_FRAME:AddMessage("CustomButtons: "..msg, 1.0, 1.0, 1.0, 1, 10);
		
	if (msg == "reload") then
	 	ReloadUI();
	elseif (string.find(msg, "new") == 1) then
	 	amCustomButtons_CreateNewButton();
	 	
		local str_scale = string.sub(msg, 4);
		local scale = tonumber(str_scale);
		
		if (scale and scale >= 0.1 and scale <= 4) then
            if (selectedButton) then
                amCustomButtons_SetButtonScale(selectedButton, scale);
                amCustomButtons_SaveButton(selectedButton);
            end
		end
	elseif (string.find(msg, "scale") == 1) then
		local str_scale = string.sub(msg, 7);
		local scale = tonumber(str_scale);
		
		if (scale and scale >= 0.1 and scale <= 4) then
            if (selectedButton) then
                amCustomButtons_SetButtonScale(selectedButton, scale);
                amCustomButtons_SaveButton(selectedButton);
            end
        else
			DEFAULT_CHAT_FRAME:AddMessage(CB_FORMAT_ERROR..": "..msg, 1.0, 0, 0, 1, 10);
	 	end
	elseif (string.find(msg, "alpha") == 1) then
		local str_alpha = string.sub(msg, 7);
		local alpha = tonumber(str_alpha);
		
		if (alpha and alpha >= 0 and alpha <= 1) then
            if (selectedButton) then
                amCustomButtons_SetButtonAlpha(selectedButton, alpha);
                amCustomButtons_SaveButton(selectedButton);
            end
        else
			DEFAULT_CHAT_FRAME:AddMessage(CB_FORMAT_ERROR..": "..msg, 1.0, 0, 0, 1, 10);
	 	end
	elseif (string.find(msg, "toggle") == 1) then
		local target = string.sub(msg, 8);
		
		if (target == "count") then
			amCustomButtons_ToggleCount();
		elseif (target == "sound") then
			amCustomButtons_ToggleSound();
		elseif (target == "range") then
			if (CustomButtonsConfig.RangeIndicator == 1) then
			    CustomButtonsConfig.RangeIndicator = 0;
			else
			    CustomButtonsConfig.RangeIndicator = 1;
			end
		elseif (target == "talent") then
		    amCustomButtons_ToggleTalent();
		else
			DEFAULT_CHAT_FRAME:AddMessage(CB_FORMAT_ERROR..": "..msg, 1.0, 0, 0, 1, 10);
		end
	elseif (string.find(msg, "sound") == 1) then
		local sound = string.sub(msg, 7);
		
		if (sound == "?") then
		    amCustomButtons_ShowButtonSoundInfo();
		elseif (sound == "none" or sound == "") then
		    amCustomButtons_SetButtonSound(nil);
		else
		    amCustomButtons_SetButtonSound(sound);
		end
	elseif (string.find(msg, "key") == 1) then
		local key = string.sub(msg, 5);
		
	    local button = selectedButton;
	
		if (key == "none" or key == "") then
		    amCustomButtons_SetKeyBinding(nil, button);
		else
		    amCustomButtons_SetKeyBinding(key, button);
		end
	elseif (msg == "delete") then
	 	amCustomButtons_DeleteButton();
	elseif (msg == "reset") then
	 	wipe(amCustomButtonsData);
    elseif (string.find(msg, "id") == 1) then
        local spellname = string.sub(msg, 4);
        
        if (spellname) then
            local id = amCustomButtons_GetSpellID(spellname);
            DEFAULT_CHAT_FRAME:AddMessage(spellname..": "..(id or "nil"), 1.0, 0, 0, 1, 10);
        end
	end
	
	amCustomButtons_GetSpellID(name)
end

function amCustomButtons_ToggleCount()
    if (CustomButtonsConfig.ShowCount == 1) then
        CustomButtonsConfig.ShowCount = 0;
    else
        CustomButtonsConfig.ShowCount = 1;
    end
end

function amCustomButtons_ToggleSound()
    if (CustomButtonsConfig.Sound == 1) then
        CustomButtonsConfig.Sound = 0;
    else
        CustomButtonsConfig.Sound = 1;
    end
end

function amCustomButtons_ToggleRangeIndicator()
    if (CustomButtonsConfig.RangeIndicator == 1) then
        CustomButtonsConfig.RangeIndicator = 0;
    else
        CustomButtonsConfig.RangeIndicator = 1;
    end
end

function amCustomButtons_AddonLoaded()
    if (MASQUE) then
        buttongroup = MASQUE:Group("A281");
    end

    amCustomButtons_CleanupButtons();
    
    amCustomButtons_InitSlashCommandHandler();
    amCustomButtons_InitButtons();
    
    amCustomButtons_ReinitSpells();            
    amCustomButtons_ReSkin();
    
    loaded = true;
end

function amCustomButtons_OnEvent(self, event, ...)
 	
	if (event == "ADDON_LOADED") then
	
		local addonName = ...;
		--if (addonName == "CustomButtons") then
		
		if (string.lower(addonName) == "a281") then
			
		    --amCustomButtons_StartDelay(5, amCustomButtons_AddonLoaded);
		end
 	end
 	
 	if (not loaded) then
 	    return;
 	end
 	
 	if (event == "PLAYER_TALENT_UPDATE" or
 	    event == "ACTIVE_TALENT_GROUP_CHANGED" or
 	    event == "LEARNED_SPELL_IN_TAB" or
 	    event == "UPDATE_SHAPESHIFT_FORM") then
        
        if (InCombatLockdown() == nil) then
            amCustomButtons_StartDelay(2, amCustomButtons_ReinitSpells);
 	    end
 	end
 	
    -- pet battles
    if (event == "PET_BATTLE_OPENING_START") then
        amCustomButtonsFrame:Hide();
    end
    if (event == "PET_BATTLE_CLOSE") then
        amCustomButtonsFrame:Show();
    end
    
 	if (event == "PLAYER_ENTERING_WORLD") then        
        amCustomButtons_ReSkin();
 	end
end

function amCustomButtons_ReSkin()   
    if (MASQUE) then
        buttongroup:ReSkin();
    end

    for index, data in pairs(amCustomButtonsData) do
        local button = _G[data.name];
        amCustomButtons_SetTextScale(button, data.scale);
    end
end

function amCustomButtons_ReinitSpells()
    local activeSpecGroup = GetActiveSpecGroup();

    if (not activeSpecGroup) then
        activeSpecGroup = 1;
    end

    for index, data in pairs(amCustomButtonsData) do 
        
		local name = data.name;
        local button = _G[name];          
        local show = false;
     
        if (data) then
            if (data.type == "spell") then         
                if (data.talent == 0 or data.talent == activeSpecGroup) then                
                    
                        local icon = _G[data.name.."Icon"];
                        icon:SetTexture(data.texture); 
                        show = true;
                    
                end
           
            elseif (data.type == "item") then 
                if (data.talent == 0 or data.talent == activeSpecGroup) then  
                    show = true;
                end
            else
                show = true;
            end
        end
        
        if (show) then   
            button:Show();            
            amCustomButtons_SetKeyBinding(data.key, button);     
        else
            button:Hide();
            ClearOverrideBindings(button);
        end
    end
end

function amCustomButtons_OnButtonEvent(self, event, ...)
 	
	if ( event == "PLAYER_TARGET_CHANGED" ) then
		self.rangeTimer = -1;
	elseif ( event == "ACTIONBAR_UPDATE_USABLE" ) then
		amCustomButtons_UpdateUsable(self);
	elseif ( event == "ACTIONBAR_UPDATE_COOLDOWN" ) then
		amCustomButtons_UpdateCooldowns(self);
 	end
end

function amCustomButtons_CleanupButtons()

    local removed = nil;

	for index, data in pairs(amCustomButtonsData) do		
		if (data.type == nil) then
            table.remove(amCustomButtonsData, index);
            removed = 1;
            break;
		end
		
		if (data.type == "spell") then            
            if (data.talent == nil) then
		        table.remove(amCustomButtonsData, index);
		        removed = 1;
		        break;
            end
		end
	end
	
	-- recursive
	if (removed == 1) then
	    amCustomButtons_CleanupButtons();
	end
end

function amCustomButtons_InitButtons()
	for index, data in pairs(amCustomButtonsData) do
	
		local type = data.type;
		local name = data.name;
		local texture = data.texture;
		local sound = data.sound;
		local key = data.key;
		
		local p1 = data.p1 or "RIGHT";
		local p2 = data.p2 or "RIGHT";
				
		local x = data.x;
		local y = data.y;
		
		local scale = data.scale;
		if (not scale) then
			scale = 1.0;
		end
		
		local alpha = data.alpha;
		if (not alpha) then
			alpha = 1.0;
		end
		
		if not p1 or not p2 then
			print("发现旧错误请重新设定简捷控制功能修复之。")
			return;
		end

		local button = _G[name] or amCustomButtons_CreateButton(name);
		--amCustomButtons_ResetAttributes(button);
	
		amCustomButtons_SetButtonScale(button, scale);
		amCustomButtons_SetButtonAlpha(button, alpha);
		
		if (type == "item") then
			
			--button:SetAttribute("type", "item");
			--button:SetAttribute("item", data.item);
           
            local talent = data.talent;
            
            if (not talent) then
                data.talent = 1;
            end
			
		elseif (type == "spell") then
			
			button:SetAttribute("type", "spell");
            
            local spellname = data.spell;
            if (data.spell2 and strlen(data.spell2) > 0) then
                spellname = data.spell.."("..data.spell2..")";
            end
            
			--button:SetAttribute("spell", spellname);
			
            --button:SetAttribute("cb_sp1", data.spell);
            --button:SetAttribute("cb_sp2", data.spell2);
			
			--local id = amCustomButtons_findSpellBookId(data.spell, data.spell2, data.id);
		    --button:SetAttribute("id", id);
		   
            local talent = data.talent;
            
            if (not talent) then
                data.talent = 1;
            end
			
		elseif (type == "macro") then
		
			button:SetAttribute("type", "macro");
			button:SetAttribute("macro", data.macro);
			
			button:SetAttribute("tooltip", data.macro);
		   
            local talent = data.talent;
            
            if (not talent) then
                data.talent = 1;
            end
			
		elseif (type == "equipmentset") then
		
			button:SetAttribute("type", "macro");
			button:SetAttribute("macrotext", "/equipset "..data.equipmentset);
			
			button:SetAttribute("tooltip", data.equipmentset);
			
		elseif (type == "companion") then
		
			button:SetAttribute("type", "macro");
			
            if (data.ctype == "CRITTER") then
                button:SetAttribute("macrotext", "/run CallCompanion(\""..data.ctype.."\", "..data.index..")");
            else
                button:SetAttribute("macrotext", "/run if IsMounted() then Dismount() else CallCompanion(\""..data.ctype.."\", "..data.index..") end");
            end
			
			button:SetAttribute("tooltip", data.index);
			
		end
			
		local icon = _G[name.."Icon"];
		icon:SetTexture(texture);
		
		button:SetAttribute("sound", sound);
		button:SetAttribute("key", key);
		
		button:ClearAllPoints();
		button:SetPoint(p1, UIParent, p2, x, y);
		
		button:SetScript("OnMouseDown", amCustomButtons_OnMouseDown);
		button:SetScript("OnMouseUp", amCustomButtons_OnMouseUp);
		button:EnableMouseWheel(1);
		button:SetScript("OnMouseWheel", amCustomButtons_OnMouseWheel);
		
		button:SetScript("OnEnter", amCustomButtons_MouseOver);
		button:SetScript("OnLeave", amCustomButtons_MouseOut);
		
		
		
		local hotkey = _G[name.."HotKey"];
		    
		if (key) then
		    SetOverrideBindingClick(button, false, key, button:GetName());
		    
            amCustomButtons_SetKeyBindingText(hotkey, key);
            hotkey:Show();
        else
            ClearOverrideBindings(button);
            
            hotkey:SetText(RANGE_INDICATOR);
            hotkey:Hide();
		end
		
		if (MASQUE) then
		    buttongroup:AddButton(button);
		end
		
		button:Show();
		
	end
end

function amCustomButtons_SetKeyBindingText(hotkey, key)
    local text = GetBindingText(key, "KEY_", 1);
    hotkey:SetText(text);
end

function amCustomButtons_SetButtonScale(button, scale)
    button:SetScale(scale);
    amCustomButtons_SetTextScale(button, scale);
end

function amCustomButtons_SetTextScale(button, scale)    

    local fontName, fontHeight, fontFlags;

    -- rescale count
    local counttext = _G[button:GetName().."Count"];
    fontName, fontHeight, fontFlags = counttext:GetFont();
    counttext:SetFont(fontName, 14/scale, fontFlags);
    
    -- rescale hotkey
    local hotkey = _G[button:GetName().."HotKey"];
    fontName, fontHeight, fontFlags = hotkey:GetFont();
    hotkey:SetFont(fontName, 12/scale, fontFlags);
    
    -- rescale buttonname
    local buttonname = _G[button:GetName().."Name"];
    fontName, fontHeight, fontFlags = buttonname:GetFont();
    buttonname:SetFont(fontName, 10/scale, fontFlags);
end

function amCustomButtons_SetButtonAlpha(button, alpha)
    button:SetAlpha(alpha);
	button:SetAttribute("alpha", alpha);
end

function amCustomButtons_OnMouseWheel(self, button)
	--print(button,IsShiftKeyDown() , InCombatLockdown())
	if (IsShiftKeyDown() and IsControlKeyDown() and IsAltKeyDown() ) then
        local name = selectedButton:GetName();
		
		local _data;
			for index, data in pairs(amCustomButtonsData) do         
				if name == data.name then
					_data=data; 
					break;
				end
			end
		if _data then
			
			_data.scale = _data.scale + button/10;
			if _data.scale<0.5 then
				_data.scale=0.5;
			elseif _data.scale>1 then
				_data.scale=1;
			end
			
			amCustomButtons_SetButtonScale(selectedButton, _data.scale);
			amCustomButtons_SaveButton(selectedButton);
			
		end
	end
end

function amCustomButtons_OnMouseDown(self, button)    
    if (GetCursorInfo()) then
    
        self:Disable();
        self.disable = 1;
        amCustomButtons_OnReceiveDrag(self);
        return;
    end
    
	--print(button,IsControlKeyDown() , InCombatLockdown())
	
    if (button == "RightButton") then
	
       
		
		if (IsShiftKeyDown() and IsAltKeyDown() ) then
            local texture = _G[self:GetName().."Icon"];			
			SetDesaturation(texture, desaturation)
			DelSimpleControValue(self:GetName());
			amCustomButtons_DeleteButton();
		
		elseif (IsShiftKeyDown() and not InCombatLockdown()) then
         			
			
		elseif (IsControlKeyDown() ) then
            self:Disable();
            self:StartMoving();
		else
			local name = self:GetName();
			local _data;
			for index, data in pairs(amCustomButtonsData) do         
				if name == data.name then
					_data=data; 
					break;
				end
			end
			if _data and _data.Mark then
				stEP(_data.Mark,4);
			end
        end
      
		
    end
    if (button == "LeftButton") then
        if (IsControlKeyDown()) then
            --[[local name = self:GetName();
        
            for index, data in pairs(amCustomButtonsData) do
            
                if (data.type == "spell" or data.type == "macro") then
                    local foundname = data.name;
                    
                    if (name == foundname) then                        
                        local group = "";
                        
                        if (data.talent == 0) then
                            group = CB_TALENT_BOTH;
                        elseif (data.talent == 1) then
                            group = CB_TALENT_1;
                        elseif (data.talent == 2) then
                            group = CB_TALENT_2;
                        end
                        
                        DEFAULT_CHAT_FRAME:AddMessage("CustomButtons: "..group, 1.0, 1.0, 1.0, 1, 10);
                    end
                end
            end --]]
        
		else
			local name = self:GetName();
			local _data;
			for index, data in pairs(amCustomButtonsData) do         
				if name == data.name then
					_data=data; 
					break;
				end
			end
			
			if _data and _data.Mark then
				stEP(_data.Mark,2,0);
			end
        
		end
    end
    
    --[[if (CustomButtonsConfig.Sound == 1) then
        if (amCustomButtons_CheckUsable(self) == 1) then
            PlaySound("ACTIONBARBUTTONDOWN");
        end
    end]]
end

function amCustomButtons_OnMouseUp(self, button)
    if (self.disable) then
        self:Enable()
        self.disable = nil
    end
                                
    if (button == "RightButton") then
        --if (not InCombatLockdown()) then
            self:Enable();
            self:StopMovingOrSizing();
            
            amCustomButtons_NormalizeButtonPosition(self);
            
            amCustomButtons_SaveButton(self);
        --end
    end
    
    --[[if (CustomButtonsConfig.Sound == 1) then
        if (amCustomButtons_CheckUsable(self) == 1) then
            local sound = self:GetAttribute("sound");
            
            if (sound) then
                PlaySound(sound);
            end
        end
    end]]
end

function amCustomButtons_OnReceiveDrag(self)
    if (InCombatLockdown()) then
        return;
    end
    
    local type, id, itemLink = GetCursorInfo(); 
    
    amCustomButtons_OnDragStart(self, "LeftButton");
    
    amCustomButtons_UpdateButtonWithActionInfo(self, type, id, itemLink);
    amCustomButtons_UpdateUsable(self);
end

function amCustomButtons_OnDragStart(self, button)
    if (InCombatLockdown()) then
        return;
    end
    
    if (button == "LeftButton") then
        for i, data in pairs(amCustomButtonsData) do
            if (self:GetName() == data.name) then
                if data.type == "item" then
                    PickupItem(data.item);
                elseif data.type == "macro" then
                    PickupMacro(data.macro);
                elseif data.type == "companion" then
                    PickupCompanion(data.ctype, data.index);
                elseif data.type == "equipmentset" then
                    PickupEquipmentSetByName(data.equipmentset);
                elseif data.type == "spell" then
                    PickupSpellBookItem(amCustomButtons_findSpellBookId(data.spell, data.spell2, data.id), SpellBookFrame.bookType);
                else
                    ClearCursor();
                end
            end
        end
    else
        ClearCursor();
    end
end

function amCustomButtons_NormalizeButtonPosition(self)

    if (not self) then
        return;
    end

    local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint(1);
    
    xOfs = ceil(xOfs);
    yOfs = ceil(yOfs);
    
    self:ClearAllPoints();
    self:SetPoint(point, relativeTo, relativePoint, xOfs, yOfs);
end

function amCustomButtons_CreateNewButton()

	local i = 1;
	
	local name = "amCustomButtonsButton"..i;
	local button = _G[name];
	
	while (button ~= nil) do
		i = i + 1;
	
	    name = "amCustomButtonsButton"..i;
	    button = _G[name];
	end
	
	local button = amCustomButtons_CreateButton(name);
	
	button:SetScale(1.0);
	button:ClearAllPoints();
	button:SetPoint("CENTER", UIParent, "CENTER", 0, 0);
		
	button:SetScript("OnMouseDown", amCustomButtons_OnMouseDown);
	button:SetScript("OnMouseUp", amCustomButtons_OnMouseUp);
	button:SetScript("OnMouseWheel", amCustomButtons_OnMouseWheel);
	button:EnableMouseWheel(1);
	button:SetScript("OnEnter", amCustomButtons_MouseOver);
	button:SetScript("OnLeave", amCustomButtons_MouseOut);
		
	selectedButton = button;
	
	return button;
end

function amCustomButtons_CreateButton(name)
		
	local button = CreateFrame("Button", name, amCustomButtonsFrame, "amCustomButtonsButtonTemplate");
	
	button:RegisterForDrag("LeftButton","RightButton");
	button:RegisterForClicks("AnyUp");
	button.rangeTimer = -1;
	
 	button:RegisterEvent("PLAYER_TARGET_CHANGED");
 	button:RegisterEvent("ACTIONBAR_UPDATE_USABLE");
 	button:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN");
 	
 	button:SetClampedToScreen(true);
		
    local hotkey = _G[name.."HotKey"];
    hotkey:SetText(RANGE_INDICATOR);
    hotkey:Hide();
		
	_G[name.."Cooldown"]:SetFrameStrata("MEDIUM");
		
	if (MASQUE) then
		buttongroup:AddButton(button);
	end
	
	return button;
end

function amCustomButtons_DeleteButton(button)
	if not button then
		button = selectedButton;
		selectedButton = nil;
	end
	
	if (button) then
		local name = button:GetName();
		amCustomButtons_RemoveSavedButton(name);
		local icon = _G[name.."Icon"];
		icon:SetTexture(nil);
		button:Hide();
		button:SetAttribute("deleted", 1);
		
        if (MASQUE) then
            buttongroup:RemoveButton(button);
        end
	end
end

function amCustomButtons_SetButtonSound(sound)
	local button = selectedButton;
	
	if (button) then
		button:SetAttribute("sound", sound);
		amCustomButtons_SaveButton(button);
	end
end

function amCustomButtons_SetKeyBinding(key, button)
	
	if (button) then	
		local hotkey = _G[button:GetName().."HotKey"];
		
		if (key) then
		    SetOverrideBindingClick(button, false, key, button:GetName());
            amCustomButtons_SetKeyBindingText(hotkey, key);
            hotkey:Show();
		else
		
		    local oldkey = button:GetAttribute("key");
		    
		    if (oldkey) then
		        SetOverrideBinding(button, false, oldkey);
		    end
		    
            hotkey:SetText(RANGE_INDICATOR);
            hotkey:Hide();
		end
		
		button:SetAttribute("key", key);
		
		amCustomButtons_SaveButton(button);
	end
end

function amCustomButtons_ToggleTalent()
        
    local activeSpecGroup = GetActiveSpecGroup();

    if (not activeSpecGroup) then
        activeSpecGroup = 1;
    end
        
	local button = selectedButton;
	
	if (button) then
		local name = button:GetName();

        for index, data in pairs(amCustomButtonsData) do
        
            if (data.type == "spell" or data.type == "macro" or data.type == "item") then
                local foundname = data.name;
                
                if (name == foundname) then                    
                    if (data.talent == activeSpecGroup) then
                        data.talent = 0;
                    else
                        data.talent = activeSpecGroup;
                    end
                        
                    local group = "";
                    
                    if (data.talent == 0) then
                        group = CB_TALENT_BOTH;
                    elseif (data.talent == 1) then
                        group = CB_TALENT_1;
                    elseif (data.talent == 2) then
                        group = CB_TALENT_2;
                    end
                    
                    DEFAULT_CHAT_FRAME:AddMessage(group, 1.0, 1.0, 1.0, 1, 10);
                end
            end
        end
	end
end

function amCustomButtons_ShowButtonSoundInfo()
 	DEFAULT_CHAT_FRAME:AddMessage("CustomButtons: ".. CB_SOUND_INFO, 1.0, 1.0, 1.0, 1, 10);
end

function amCustomButtons_OnUpdate(self, elapsed)

	local rangeTimer = self.rangeTimer;
	if ( rangeTimer ) then
		rangeTimer = rangeTimer - elapsed;

		if ( rangeTimer <= 0 ) then
			local hotkey = _G[self:GetName().."HotKey"];
			
			local valid = -1;
			local type = self:GetAttribute("type");
			if (type == "spell") then
			    local id = amCustomButtons_findSpellBookId(self:GetAttribute("cb_sp1"), self:GetAttribute("cb_sp2"), self:GetAttribute("id"));
			    
			    if (id and id >= 0) then  		
                    local isUsable, notEnoughMana = IsUsableSpell(id, SpellBookFrame.bookType);
                    local inRange = IsSpellInRange(id, SpellBookFrame.bookType, "target");	
            
                    if (inRange == 0) then
                        valid = 0;
                    end
                end
  		    elseif (type == "item") then
  		        local item = self:GetAttribute("item");
  		    
  		        local inRange = IsItemInRange(item,"target");
  		        
  		        if (inRange == 0) then
 					valid = 0;
  				end
			end
	
			--hotkey:SetVertexColor(1.0, 1.0, 1.0);
			
			if ( hotkey:GetText() == RANGE_INDICATOR ) then
				if ( valid == 0 ) then
					hotkey:Show();
					--hotkey:SetVertexColor(1.0, 0.1, 0.1);
				else
					hotkey:Hide();
				end
			else
				if ( valid == 0 ) then
					--hotkey:SetVertexColor(1.0, 0.1, 0.1);
				end
			end

            local rangeIndicator = _G[self:GetName().."RangeIndicator"];
            if (not rangeIndicator) then
                rangeIndicator = self:CreateTexture(self:GetName().."RangeIndicator", OVERLAY);
                rangeIndicator:SetAllPoints(self);
                rangeIndicator:SetTexture(1.0, 0.0, 0.0);
                rangeIndicator:SetBlendMode("MOD");
            end
			
			if (CustomButtonsConfig.RangeIndicator == 1) then
                if ( valid == 0 ) then    
                    rangeIndicator:Show();  
                else             
                    rangeIndicator:Hide();  
                end           
            else   
                rangeIndicator:Hide();       
            end
			
			rangeTimer = TOOLTIP_UPDATE_TIME;
		end
		
		self.rangeTimer = rangeTimer;
	end
		
	amCustomButtons_UpdateCooldowns(self);
	amCustomButtons_UpdateUsable(self);
end

function amCustomButtons_ActionButton_OnUpdate(self, elapsed)

    local rangeIndicator = _G[self:GetName().."RangeIndicator"];
    if (not rangeIndicator) then
        rangeIndicator = self:CreateTexture(self:GetName().."RangeIndicator", OVERLAY);
        rangeIndicator:SetAllPoints(self);
        rangeIndicator:SetTexture(1.0, 0.0, 0.0);
        rangeIndicator:SetBlendMode("MOD");
    end

    if (CustomButtonsConfig.RangeIndicator ~= 1) then    
        rangeIndicator:Hide();     
        return;
    end
    
    local spellType, id, subType, spellID = GetActionInfo(self.action);
    
 	if (not spellType) then
        rangeIndicator:Hide(); 
 	else
        local rangeTimer = self.rangeTimer;
        
        if ( rangeTimer ) then
            rangeTimer = rangeTimer - elapsed;
    
            if ( rangeTimer <= 0 ) then
                local valid = IsActionInRange(self.action);
                
                if ( valid == 0 ) then    
                    rangeIndicator:Show();
                else
                    rangeIndicator:Hide(); 
                end
            end
        end
    end
end

function amCustomButtons_UpdateCooldowns(self)
		
	local cooldown = _G[self:GetName().."Cooldown"];
	
    local item = self:GetAttribute("item");
    local spell = self:GetAttribute("cb_sp1");
    
    if (item) then
        local id = amCustomButtons_GetItemId(item);
        
        if (id) then
            local start, duration, enable = GetItemCooldown(id);
        
            if (cooldown and start and duration and enable) then
                CooldownFrame_Set(cooldown, start, duration, enable);
            end
        end
	elseif (spell) then
	    local id = amCustomButtons_findSpellBookId(spell, self:GetAttribute("cb_sp2"), self:GetAttribute("id"));
  		if (id >= 0) then
            local start, duration, enable = GetSpellCooldown(id, SpellBookFrame.bookType);
        
            if (cooldown and start and duration and enable) then
                CooldownFrame_Set(cooldown, start, duration, enable);
            end
        end
	end
end

function amCustomButtons_GetItemId(name)
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(name);
    
    if (not itemLink) then
        return nil;
    end
    
    local _, id = strsplit(":", itemLink);

    return id;
end

function amCustomButtons_CheckUsable(button)
	local type = button:GetAttribute("type");
  		
	if (type == "spell") then  		
	    local id = amCustomButtons_findSpellBookId(button:GetAttribute("cb_sp1"), button:GetAttribute("cb_sp2"), button:GetAttribute("id"));
  		local isUsable, notEnoughMana = IsUsableSpell(id, SpellBookFrame.bookType);
  		
		if ( isUsable ) then
		elseif ( notEnoughMana ) then
			return nil;
		else
			return nil;
		end
	elseif (type == "item") then
  	    local item = button:GetAttribute("item");
  	    
		local count = GetItemCount(item);
		
		if (count == 0) then  
			return nil;	
		end
	end
	
	return 1;
end

function amCustomButtons_UpdateUsable(self)

    if (isInConfig) then
        return;
    end;
			
	local icon = _G[self:GetName().."Icon"];
  	local counttext = _G[self:GetName().."Count"];
  	local buttonname = _G[self:GetName().."Name"];
  	
  	buttonname:SetText(""); 

	local type = self:GetAttribute("type");
	local macro = self:GetAttribute("macro");
	local macrotext = self:GetAttribute("macrotext");
	
	if (type == "spell") then
	
  		local spell = self:GetAttribute("cb_sp1");
  		local spell2 = self:GetAttribute("cb_sp2");
	    local id = amCustomButtons_findSpellBookId(spell,spell2, self:GetAttribute("id"));
	    
	    if (id and id >= 0) then
  		    local isUsable, notEnoughMana = IsUsableSpell(id, SpellBookFrame.bookType);
            local texture = GetSpellTexture(id, SpellBookFrame.bookType);
            
            if ( notEnoughMana ) then
                --icon:SetVertexColor(0.3, 0.3, 0.8);
            elseif (not isUsable ) then
                --icon:SetVertexColor(0.3, 0.3, 0.3);
            else
                --icon:SetVertexColor(1.0, 1.0, 1.0);
            end
            -- done
            
            if (CustomButtonsConfig.ShowCount == 0 or count == 0) then
                counttext:SetText("");
            else
                if (IsConsumableSpell(id, SpellBookFrame.bookType)) then 
                    local spellCount = GetSpellCount(id, SpellBookFrame.bookType); 
                    
                    if ( isUsable ) and (spellCount == 0) then 
                        -- Some glyph or talent must have changed this to non-consumable spell 
                        counttext:SetText(""); 
                    else 
                        counttext:SetText(spellCount); 
                    end 
                else 
                    countinfo = "";
                    -- check buff
                    local index = 1;
                    local foundname, _, _, foundcount = UnitBuff("player", index);
                    while foundname do 
                        if (foundname == spell) then
                            if (foundcount > 0) then
                                countinfo = foundcount;
                            end
                            break;
                        else
                            index = index + 1;        
                            foundname, _, _, foundcount = UnitBuff("player", index);
                        end
                    end
                    
                    counttext:SetText(countinfo); 
                end 
            end
		end
	elseif (type == "item") then
	
  	    local item = self:GetAttribute("item");
		local count = GetItemCount(item, nil, true); 
	
  		if (count == 0) then  		
			--icon:SetVertexColor(0.3, 0.3, 0.3);
  		else    		
			--icon:SetVertexColor(1.0, 1.0, 1.0);
  		end
  		
  		if (CustomButtonsConfig.ShowCount == 0 or count == 0) then
    		counttext:SetText("");
  		else
            counttext:SetText(count); 
  		end
		
	elseif (macrotext and string.find(macrotext, "/equipset") == 1) then -- Equipmentset
	
        local name = string.sub(macrotext, 11);
        buttonname:SetText(name);
    	counttext:SetText("");
		
	elseif (macrotext and string.find(macrotext, "/run CallCompanion") == 1) then -- Mount or Pet
	
        buttonname:SetText("");
    	counttext:SetText("");
		
	elseif (macro) then
	
        local name, iconTexture, body = GetMacroInfo(macro); 
        buttonname:SetText(name); 
    	counttext:SetText("");
	
	end
end

function amCustomButtons_ResetAttributes(self)
    self:SetAttribute("type", nil);
    self:SetAttribute("item", nil);
    self:SetAttribute("spell", nil);
    --self:SetAttribute("spell2", nil);
    self:SetAttribute("id", nil);
    self:SetAttribute("macro", nil);
    self:SetAttribute("macrotext", nil);
    self:SetAttribute("ctype", nil);
			
    self:SetAttribute("tooltip", nil);
			
    self:SetAttribute("cb_sp1", nil);
    self:SetAttribute("cb_sp2", nil);
end

function amCustomButtons_UpdateButtonWithActionInfo(self, type, id, itemLink)
    local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint(1);
    local texture = nil;
    
    local activeSpecGroup = GetActiveSpecGroup();

    if (not activeSpecGroup) then
        activeSpecGroup = 1;
    end

    if (type == "item") then

        local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(id);
        texture = itemTexture;
        
        --amCustomButtons_ResetAttributes(self);
        --self:SetAttribute("type", "item");
        --self:SetAttribute("item", itemName);
        
        --amCustomButtons_RemoveSavedButton(self:GetName());
		local name = self:GetName();
		local _data;
		for index, data in pairs(amCustomButtonsData) do         
			if name == data.name then
				_data=data; 
				break;
			end
		end
		
		if _data then
			_data.type = "item";
			_data.name = self:GetName();
			_data.item = itemName;
			_data.texture = itemTexture;
			_data.talent = activeSpecGroup;
			_data.p1 = point;
			_data.p2 = relativePoint;
			_data.x = xOfs;
			_data.y = yOfs;
			_data.scale = 1.0;
			_data.alpha = 1.0;
			_data.tooltip = self:GetName();
		else	
			table.insert(amCustomButtonsData,
			{
				type = "item";
				name = self:GetName();
				item = itemName;
				texture = itemTexture;
				talent = activeSpecGroup;
				p1 = point;
				p2 = relativePoint;
				x = xOfs;
				y = yOfs;
				scale = 1.0;
				alpha = 1.0;
				tooltip = self:GetName();
			} );
		end
		
    elseif (type == "spell") then
    
        local _, _, offset, numSpells = GetSpellTabInfo(2);

        if (id <= offset+numSpells) then    
            local name, subname, itemTexture = GetSpellInfo(id, SpellBookFrame.bookType);
            texture = itemTexture;
            
            local spellLink, tradeSkillLink = GetSpellLink(id, SpellBookFrame.bookType);
    
            --amCustomButtons_ResetAttributes(self);
            --self:SetAttribute("type", "spell");
            
            local spellname = name;
            if (subname and strlen(subname) > 0) then
                spellname = name.."("..subname..")";
            end
            
            --self:SetAttribute("spell", spellname);            
            
            --self:SetAttribute("cb_sp1", name);
            --self:SetAttribute("cb_sp2", subname);
                
            --self:SetAttribute("id", id);
			
			--print(name, subname, itemTexture)
			--self:SetAttribute("tooltip", name);
            
            --amCustomButtons_RemoveSavedButton(self:GetName());
            
			local name = self:GetName();
			local _data;
			for index, data in pairs(amCustomButtonsData) do         
				if name == data.name then
					_data=data; 
					break;
				end
			end
			
			if _data then
				_data.type = "spell";
                _data.name = self:GetName();
                _data.spell = name;
                _data.spell2 = subname;
                _data.id = id;
                _data.texture = itemTexture;
                _data.talent = activeSpecGroup;
                _data.p1 = point;
                _data.p2 = relativePoint;
                _data.x = xOfs;
                _data.y = yOfs;
                _data.scale = 1.0;
                _data.alpha = 1.0;
				_data.tooltip = name;
			else	
				table.insert(amCustomButtonsData,
				{
                type = "spell";
                name = self:GetName();
                spell = name;
                spell2 = subname;
                id = id;
                texture = itemTexture;
                talent = activeSpecGroup;
                p1 = point;
                p2 = relativePoint;
                x = xOfs;
                y = yOfs;
                scale = 1.0;
                alpha = 1.0;
				tooltip = self:GetName();
				} );
			end
        end
		
		
    


        
    end
            
    local icon = _G[self:GetName().."Icon"];
    icon:SetTexture(texture);
	--icon:SetVertexColor(0.5, 0.1, 0.1);
    --icon:SetAlpha(0.5);
	--icon:SetColorTexture(1,0,0,0.3);
	--print(self:GetName())
	--local f = _G[self:GetName()];
	--local t = f:CreateTexture(nil,"BACKGROUND")
	--t:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Factions.blp")
	--t:SetTexture(texture);
	--t:SetColorTexture(1,0,0,0.2);
	--t:SetAllPoints(f)
	
    amCustomButtons_SaveButton(self);
    amCustomButtons_UpdateUsable(self);
	--_G[self:GetName().."Icon"]:SetVertexColor(0.5, 0.1, 0.1)
	
end

function amCustomButtons_GetSpellID(name)

    local foundname;

    for i = 1, 1000000 do
        local foundname = GetSpellInfo(i);
        if name == foundname then
            return i;
        end
    end
end

function amCustomButtons_SaveButton(button)

    --[[local type = button:GetAttribute("type");
    
    if (type == nil) then
        return;
    end--]]

	local name = button:GetName();
    
    for index, data in pairs(amCustomButtonsData) do
		local foundname = data.name;
		
		if (name == foundname) then
			
			point, relativeTo, relativePoint, xOfs, yOfs = button:GetPoint(1);
			
		    data.p1 = point;
		    data.p2 = relativePoint;
		    data.x = xOfs;
		    data.y = yOfs;
		    data.scale = button:GetScale();
		    data.alpha = button:GetAlpha();
		    
		    data.sound = button:GetAttribute("sound");
		    data.key = button:GetAttribute("key");
		end
		
    end
end

function amCustomButtons_RemoveSavedButton(name)
	for index, data in pairs(amCustomButtonsData) do
		local foundname = data.name;
		
		if (name == foundname) then
		    table.remove(amCustomButtonsData, index);
			return;
		end
    end
end

function amCustomButtons_MouseOver(button)

	amCustomButtons_SetTooltip(button);
	selectedButton = button;
end

function amCustomButtons_MouseOut(button)
	GameTooltip:FadeOut();
	selectedButton = nil;
end

function amCustomButtons_findSpellBookId(spell, spell2, id)   
	id = id or -1;

    if (GetSpellInfo(spell)) then
       
        local _, _, offset, numSpells = GetSpellTabInfo(2);
    
        for i = 1, offset + numSpells do
            local spellName, spellSubName = GetSpellBookItemName(i, BOOKTYPE_SPELL);
            
            if (not spellName) then
                return id;
            end
            
            if (spell2 and spellName == spell and spellSubName == spell2) then
                return i;
            elseif ((not spell2) and spellName == spell) then
                return i;
            end
        end
    end
      
    return id;
end

function amCustomButtons_SetTooltip(button)
	if GetSimpleControSet_showInf and not GetSimpleControSet_showInf() then
		amCustomButtons_ShowTooltip(button);
	end
end

function amCustomButtons_ShowTooltip(button)

	
		local _data;
		local name = button:GetName();
		for index, data in pairs(amCustomButtonsData) do         
			if name == data.name then
				_data=data; 
				break;
			end
		end
		
		if _data and _data.tooltip then	
			
			GameTooltip_SetDefaultAnchor(GameTooltip, button);
			--GameTooltip:SetText("|rname: " .. _data.tooltip .. "\nid: " .. (_data.Mark or ""));
			
			--GameTooltip:SetOwner(button, direction == "RIGHT" and "ANCHOR_LEFT" or "ANCHOR_RIGHT")
			
			GameTooltip:ClearLines()
			GameTooltip:SetText(" ");
			GameTooltipTextLeft1:SetText("|T" .._data.texture..":24|t " .. (_data.SimpleControName or ""));
			
			--GameTooltip:AddLine(" ");
			--GameTooltip:AddLine("Id:" .. (_data.Mark or ""),1,1,1,1)
			GameTooltip:AddLine(HIGHLIGHT_FONT_COLOR_CODE .. (_data.SimpleControExplain or " "));
			local left, right			
			--left = NORMAL_FONT_COLOR_CODE .. "Name" .. ":" .. FONT_COLOR_CODE_CLOSE
			--right = HIGHLIGHT_FONT_COLOR_CODE .. (_data.tooltip or "").. FONT_COLOR_CODE_CLOSE
			--GameTooltip:AddDoubleLine(left, right)
			left = NORMAL_FONT_COLOR_CODE .. "Id" .. ":" .. FONT_COLOR_CODE_CLOSE
			right = HIGHLIGHT_FONT_COLOR_CODE .. (_data.Mark or "").. FONT_COLOR_CODE_CLOSE
			GameTooltip:AddDoubleLine(left, right)
			
			left = NORMAL_FONT_COLOR_CODE .. "移动" .. ":" .. FONT_COLOR_CODE_CLOSE
			right = HIGHLIGHT_FONT_COLOR_CODE .. "Ctrl+鼠标右键".. FONT_COLOR_CODE_CLOSE
			GameTooltip:AddDoubleLine(left, right)
			
			left = NORMAL_FONT_COLOR_CODE .. "删除" .. ":" .. FONT_COLOR_CODE_CLOSE
			right = HIGHLIGHT_FONT_COLOR_CODE .. "Ctrl+Alt+Shift+鼠标右键".. FONT_COLOR_CODE_CLOSE
			GameTooltip:AddDoubleLine(left, right)
			
			left = NORMAL_FONT_COLOR_CODE .. "选择放弃" .. ":" .. FONT_COLOR_CODE_CLOSE
			right = HIGHLIGHT_FONT_COLOR_CODE .. "鼠标左键".. FONT_COLOR_CODE_CLOSE
			GameTooltip:AddDoubleLine(left, right)
			
			left = NORMAL_FONT_COLOR_CODE .. "激活" .. ":" .. FONT_COLOR_CODE_CLOSE
			right = HIGHLIGHT_FONT_COLOR_CODE .. "鼠标右键".. FONT_COLOR_CODE_CLOSE
			GameTooltip:AddDoubleLine(left, right)
			left = NORMAL_FONT_COLOR_CODE .. "缩放" .. ":" .. FONT_COLOR_CODE_CLOSE
			right = HIGHLIGHT_FONT_COLOR_CODE .. "Ctrl+Alt+Shift+鼠标滚轮".. FONT_COLOR_CODE_CLOSE
			GameTooltip:AddDoubleLine(left, right)
			
			GameTooltip:Show()
		end
	
        
    GameTooltip:AppendText("");
end

function amCustomButtons_rest()
	local name;
	local button;
	
	for i = 1,128 do
		
	
		name = "amCustomButtonsButton"..i;
		button = _G[name];
		local data;
		if button then
			for index, d in pairs(amCustomButtonsData) do
				if d.name==name then								
					data=d;
					break;
				end
			end
			
			if data then
				button:Show();
			else
				button:Hide();
				local icon = _G[name.."Icon"];
				icon:SetTexture(nil);
				if (MASQUE) then
					buttongroup:RemoveButton(button);
				end
			end
			
		
		
		end
		
	end

end

local _Frame = CreateFrame("Frame");
_Frame.stime=GetTime();
_Frame:SetScript("OnUpdate",function()
	if not amCustomButtonsData or not __am_load or GetTime() - _Frame.stime < 0.1 then
		return;
	end
	
	for index, data in pairs(amCustomButtonsData) do         
		local tbl = _GetSimpleControMark(data.Mark);
		
		if tbl then
							
			if tbl.checked then
				local icon = _G[data.name.."Icon"];
				if icon then
					SetDesaturation(icon,false);
					--icon:SetAlpha(1);
				end
			else
				local icon = _G[data.name.."Icon"];
				if icon then
					SetDesaturation(icon,true);
					--icon:SetAlpha(0.7);
				end
			end
			
				data.SimpleControExplain=tbl.SimpleControExplain;
			
				data.SimpleControName=tbl.SimpleControName;
			
			
			
			amCustomButtons_SetKeyText(tbl.SimpleControName,data.name);
			
		else
			data.SimpleControExplain=nil;
			data.SimpleControName=nil;
			amCustomButtons_SetKeyText(nil,data.name);
		end
	end
		
	
	
	
	_Frame.stime=GetTime();	
end
);

function amCustomButtons_SetKeyText(key, buttonName)
	
	if (buttonName) then	
		local hotkey = _G[buttonName.."HotKey"];
		--print(hotkey)
		if hotkey then
			if (key) then
			--print(hotkey:GetText(),key,hotkey:GetText() ~= key)
				local t = hotkey:GetText();
				if not t or t ~= key then
					hotkey:SetText(key);
					hotkey:Show();					
				end
			else 
				local t = hotkey:GetText();
				if RANGE_INDICATOR ~= t then
					hotkey:SetText(RANGE_INDICATOR);
					hotkey:Hide();
				end
			end				
		end
	end
end



-- Wrapper for the desaturation function
function SetDesaturation(texture, desaturation)

	if not GetSimpleContro_colour then
		return;
	end
	local c =GetSimpleContro_colour();
	
	if c == nil then
		texture:SetVertexColor(1.0, 1.0, 1.0);
		local shaderSupported = texture:SetDesaturated(desaturation);
		if ( not shaderSupported ) then
			if ( desaturation ) then
				texture:SetVertexColor(0.3, 0.3, 0.3);
			else
				texture:SetVertexColor(1.0, 1.0, 1.0);
			end
		end
		
	elseif c==true then
		texture:SetVertexColor(1.0, 1.0, 1.0);
		texture:SetDesaturated(false);
		if ( desaturation ) then
			texture:SetVertexColor(0.5, 0.1, 0.1);
		else
			texture:SetVertexColor(1.0, 1.0, 1.0);
		end
			
		
	else
		texture:SetVertexColor(1.0, 1.0, 1.0);
		texture:SetDesaturated(false);
		--local shaderSupported = texture:SetDesaturated(desaturation);
		--if ( not shaderSupported ) then
			if ( desaturation ) then
				texture:SetVertexColor(0.3, 0.3, 0.3);
			else
				texture:SetVertexColor(1.0, 1.0, 1.0);
			end
			
		--end
	end
end

function amCustomButtons_Add(buttonname, type, id)
	local button = _G[buttonname];
	if not button then
		return;
	end
	
    local point, relativeTo, relativePoint, xOfs, yOfs = button:GetPoint(1);
    local texture = nil;
    
    local activeSpecGroup = GetActiveSpecGroup();

    if (not activeSpecGroup) then
        activeSpecGroup = 1;
    end

    if (type == "item") then

        local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(id);
        texture = itemTexture;        
      
		
		local _data;
		for index, data in pairs(amCustomButtonsData) do         
			if buttonname == data.name then
				_data=data; 
				break;
			end
		end
		
		if _data then
			_data.type = "item";
			_data.name = buttonname;
			_data.item = itemName;
			_data.texture = itemTexture;
			_data.talent = activeSpecGroup;
			_data.p1 = point;
			_data.p2 = relativePoint;
			_data.x = xOfs;
			_data.y = yOfs;
			--_data.scale = 1.0;
			_data.alpha = 1.0;
			_data.tooltip = buttonname;
		else	
			table.insert(amCustomButtonsData,
			{
				type = "item";
				name = buttonname;
				item = itemName;
				texture = itemTexture;
				talent = activeSpecGroup;
				p1 = point;
				p2 = relativePoint;
				x = xOfs;
				y = yOfs;
				scale = 1.0;
				alpha = 1.0;
				tooltip = buttonname;
			} );
		end
		
    elseif (type == "spell") then
    
        

          
            local name, subname, itemTexture = GetSpellInfo(id);
            texture = itemTexture;            
            
            local spellname = name;
            if (subname and strlen(subname) > 0) then
                spellname = name.."("..subname..")";
            end
            
            
            
			
			local _data;
			for index, data in pairs(amCustomButtonsData) do         
				if buttonname == data.name then
					_data=data; 
					break;
				end
			end
			
			if _data then
				_data.type = "spell";
                _data.name = buttonname;
                _data.spell = name;
                _data.spell2 = subname;
                _data.id = id;
                _data.texture = itemTexture;
                _data.talent = activeSpecGroup;
                _data.p1 = point;
                _data.p2 = relativePoint;
                _data.x = xOfs;
                _data.y = yOfs;
                --_data.scale = 1.0;
                _data.alpha = 1.0;
				_data.tooltip = name;
			else	
				table.insert(amCustomButtonsData,
				{
                type = "spell";
                name = buttonname;
                spell = name;
                spell2 = subname;
                id = id;
                texture = itemTexture;
                talent = activeSpecGroup;
                p1 = point;
                p2 = relativePoint;
                x = xOfs;
                y = yOfs;
                scale = 1.0;
                alpha = 1.0;
				tooltip = buttonname;
				} );
			end
        
		
		
    


        
    end
            
    local icon = _G[buttonname.."Icon"];
    icon:SetTexture(texture);
		
    amCustomButtons_SaveButton(_G[buttonname]);
    amCustomButtons_UpdateUsable(_G[buttonname]);
	
	return _G[buttonname];
end

