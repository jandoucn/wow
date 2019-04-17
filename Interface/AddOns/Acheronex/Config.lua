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
local C = LibStub("AceConfigDialog-3.0")


--[[ ---------------------------------------------------------------------------
	 Config options
----------------------------------------------------------------------------- ]]

local auraListDropdown = {}
auraListDropdown[L["White List"]] = L["White List"]
auraListDropdown[L["Black List"]] = L["Black List"]

Acheron.options = {
	name = "Acheron死亡报告ex",
	handler = Acheron,
	type = "group",
	args = {
		intro = {
			order = 0,
			type = "description",
			name = L["Main Description"],
		},
		general = {
			type = "group",
			name = L["General"],
			order = 1,
			set = "SetProfileParam",
			get = "GetProfileParam",
			cmdHidden = true,
			args = {
				enable = {
					type = "toggle",
					name = L["Enable"],
					desc = L["Enable or disable data collection"],
					width = "full",
					order = 0,
					set = function(info, v)
						Acheron:SetProfileParam("enable", v)
						if v then
							Acheron:DoEnable()
						else
							Acheron:DoDisable()
						end
				  	end	
				},
				disablepvp = {
					type = "toggle",
					name = L["Disable in PvP"],
					desc = L["Automatically disables Acheron when entering a PvP zone"],
					width = "full",
					order = 1,
				},
				history = {
					type = "range",
					name = L["History"],
					desc = L["The amount of history, in seconds, of combat log to keep per report"],
					min = 10,
					max = 60,
					step = 1,
					bigStep = 1,
					order = 2,
				},
				numreports = {
					type = "range",
					name = L["Number of Reports"],
					desc = L["The total number of death reports to keep, 0 for no limit"],
					min = 0,
					max = 500,
					step = 1,
					bigStep = 1,
					order = 3,
				},
				clearongroup = {
					type = "toggle",
					name = L["Clear Acheron When Joining Party/Raid"],
					desc = L["Clear Acheron when joining party/raid (will confirm first if Confirm Clear is checked)"],
					width = "full",
					order = 4,
				},
				confirmclear = {
					type = "toggle",
					name = L["Confirm Clear"],
					desc = L["Confirm before clearing any/all Acheron death reports"],
					width = "full",
					order = 5,
				},
				maxfiltereddamage = {
					type = "input",
					name = L["Max Damage Filtered amount"],
					order = 6,
					set = function(info, v)
						Acheron:SetProfileParam("maxfiltereddamage", v)
						Acheron:ChangeDamageFilteredSlide()
				  	end	
				},
			},
		},
		auras = {
			type = "group",
			name = L["Auras"],
			set = "SetProfileParam",
			get = "GetProfileParam",
			cmdHidden = true,
			order = 2,
			args = {
				enablewhitelist = {
					type = "toggle",
					name = L["Enable White List"],
					desc = L["When the white list is enabled, only auras on the white list will be tracked."],
					width = "full",
					order = 0,
					set = function(info, v)
						Acheron:SetProfileParam("enablewhitelist", v)
						if v then
							Acheron:SetProfileParam("enableblacklist", false)
						end
				  	end	
				},
				enableblacklist = {
					type = "toggle",
					name = L["Enable Black List"],
					desc = L["When the black list is enabled, any auras on the black list will not be tracked."],
					width = "full",
					order = 1,
					set = function(info, v)
						Acheron:SetProfileParam("enableblacklist", v)
						if v then
							Acheron:SetProfileParam("enablewhitelist", false)
						end
				  	end	
				},
				auralist = {
					type = "select",
					name = L["List"],
					values = auraListDropdown,
					order = 2,
					get = function(info) return Acheron.currentAuraList end,
					set = function(info, v) Acheron.currentAuraList = v end
				},
				auraname = {
					type = "input",
					name = L["Aura"],
					desc = L["Select the desired list from the dropdown menu and enter the name of a buff or debuff to track."],
					order = 3,
					validate = function(info, v)
								if not Acheron.currentAuraList then
									return L["You must select the list from the dropdown menu for which to add this aura"]
								elseif string.len(v) == 0 then
									return L["You must enter a value for the aura name"]
								end
								return true
						  	   end,
					set = function(info, v)
							if Acheron.currentAuraList == L["White List"] then
								Acheron.db.profile.aurawhitelist[v] = true
								Acheron:DisplayWhiteList()
							else
								Acheron.db.profile.aurablacklist[v] = true
								Acheron:DisplayBlackList()
							end
							if Acheron.trace then Acheron:trace("Adding aura '%s' to %s.", v, Acheron.currentAuraList) end
						  end,
				},
				whitelist = {
					type = "group",
					name = L["White List"],
					guiInline = true,
					order = 4,
					args = {}
				},
				blacklist = {
					type = "group",
					name = L["Black List"],
					guiInline = true,
					order = 5,
					args = {}
				},
			},
		},
		pets = {
			type = "group",
			name = L["Pets"],
			order = 3,
			set = "SetProfileParam",
			get = "GetProfileParam",
			cmdHidden = true,
			args = {
				showpets = {
					type = "toggle",
					name = L["Show Pets"],
					desc = L["Include pets in the dropdown list of available death reports"],
					width = "full",
					order = 1,
					set = function(info, v)
						Acheron:SetProfileParam("showpets", v)
						if Acheron.frame:IsVisible() then
							Acheron:ShowDeathReports()
						end
				  	end	
				},
				onlymypet = {
					type = "toggle",
					name = L["Show Only My Pet"],
					desc = L["Only show your own pet in the dropdown list of available death reports"],
					width = "full",
					order = 2,
					disabled = function() return not Acheron:GetProfileParam("showpets") end,
					set = function(info, v)
						Acheron:SetProfileParam("onlymypet", v)
						if Acheron.frame:IsVisible() then
							Acheron:ShowDeathReports()
						end
				  	end	
				},
			},
		},
		display = {
			type = "group",
			name = L["Display"],
			order = 4,
			set = "SetProfileParam",
			get = "GetProfileParam",
			cmdHidden = true,
			args = {
				fontsize = {
					type = "range",
					name = L["Font Size"],
					desc = L["The font size of the death report entries"],
					min = 8,
					max = 22,
					step = 1,
					bigStep = 1,
					order = 1,
				},
				timelinetoshow = {
					type = "range",
					name = L["Timeline to Show"],
					desc = L["If the main UI is displayed without a specific player chosen, display the last this number of death reports"],
					min = 1,
					max = 50,
					step = 1,
					bigStep = 1,
					order = 2,
				},
			}
		},
	},
}

Acheron.options.args[L["show"]] = {
	type = "execute",
	name = L["show"],
	desc = L["Show Acheron Death Reports"],
	func = "ShowDeathReports",
	guiHidden = true,
	order = 0,
}

Acheron.options.args[L["config"]] = {
	type = "execute",
	name = L["config"],
	desc = L["Toggle the Configuration Dialog"],
	func = "ToggleConfigDialog",
	guiHidden = true,
	order = 1,
}


--[[ ---------------------------------------------------------------------------
	 Config defaults
----------------------------------------------------------------------------- ]]
Acheron.defaults = {
	profile = {
		enable = true,
		history = 30,
		numreports = 0,
		clearongroup = true,
		confirmclear = true,
		disablepvp = true,
		reporttime = 10,
		reportchannel = "raid",
		reportthreshold = 300,
		abshealth = false,
		showdamage = true,
		showhealing = true,
		showbuff = true,
		showdebuff = true,
		showpets = true,
		onlymypet = false,
		fontsize = 10,
		timelinetoshow = 25,
		enablewhitelist = false,
		enableblacklist = false,
		aurawhitelist = {},
		aurablacklist = {},
	},
}


--[[ ---------------------------------------------------------------------------
	 Toggle the config window
----------------------------------------------------------------------------- ]]
function Acheron:ToggleConfigDialog()

   local frame = C.OpenFrames["Acheron"]

   if frame then
	  C:Close("Acheron")
   else
	  C:Open("Acheron")
	  self:SetStatusText(format(L["Profile: %s"], self.db:GetCurrentProfile()))
   end

end


--[[ ---------------------------------------------------------------------------
	 Display the aura white list defined by the user in the config dialog
----------------------------------------------------------------------------- ]]
function Acheron:DisplayWhiteList()

	local whitelist = {}
	local i = 1
	
	for aura, _ in pairs(Acheron:GetProfileParam("aurawhitelist")) do
	
			local key = string.lower(string.gsub(aura, " ", ""))
		
			whitelist[key] = {
				type = "description",
				name = aura,
				order = i,
			}
		
			i = i + 1
		
			whitelist[key.."delete"] = {
				type = "execute",
				name = L["Delete"],
				confirm = true,
				confirmText = L["Are you sure you want to delete this aura from the white list?"],
				order = i,
				width = "half",
				func = function(info)
						Acheron.db.profile.aurawhitelist[aura] = nil
						Acheron:DisplayWhiteList()
				   	   end
			}
		
			i = i + 1
	end

	Acheron.options.args.auras.args.whitelist.args = whitelist
	
end


--[[ ---------------------------------------------------------------------------
	 Display the aura black list defined by the user in the config dialog
----------------------------------------------------------------------------- ]]
function Acheron:DisplayBlackList()

	local blacklist = {}
	local i = 1
	
	for aura, _ in pairs(Acheron:GetProfileParam("aurablacklist")) do
	
			local key = string.lower(string.gsub(aura, " ", ""))
		
			blacklist[key] = {
				type = "description",
				name = aura,
				order = i,
			}
		
			i = i + 1
		
			blacklist[key.."delete"] = {
				type = "execute",
				name = L["Delete"],
				confirm = true,
				confirmText = L["Are you sure you want to delete this aura from the black list?"],
				order = i,
				width = "half",
				func = function(info)
						Acheron.db.profile.aurablacklist[aura] = nil
						Acheron:DisplayBlackList()
				   	   end
			}
		
			i = i + 1
	end

	Acheron.options.args.auras.args.blacklist.args = blacklist
	
end


--[[ ---------------------------------------------------------------------------
	 Set the text displayed at the bottom of the config window
----------------------------------------------------------------------------- ]]
function Acheron:SetStatusText(text)

   local frame = C.OpenFrames["Acheron"]

   if frame then
	  frame:SetStatusText(text)
   end

end


--[[ ---------------------------------------------------------------------------
	 Update config display on a profile change
----------------------------------------------------------------------------- ]]
function Acheron:OnProfileChanged(event, newdb)

   if event ~= "OnProfileDeleted" then
	  -- if LibStub("LibLogger-1.0", true) then self:SetLogLevel(self.db.profile.logLevel) end
	  self:SetStatusText(format(L["Profile: %s"], self.db:GetCurrentProfile()))
   end

end


--[[ ---------------------------------------------------------------------------
	 Set a saved variable config option
----------------------------------------------------------------------------- ]]
function Acheron:SetProfileParam(var, value)

   local varName = nil

   if type(var) == "string" then
	   varName = var
   else
	   varName = var[#var]
   end

   if self.trace then self:trace("Setting parameter %s to %s.", varName, tostring(value)) end

   self.db.profile[varName] = value

   if varName == "logLevel" and LibStub("LibLogger-1.0", true) then
	  self:SetLogLevel(value)
   end

end


--[[ ---------------------------------------------------------------------------
	 Get a saved variable config option
----------------------------------------------------------------------------- ]]
function Acheron:GetProfileParam(var) 

   local varName = nil

   if type(var) == "string" then
	   varName = var
   else
	   varName = var[#var]
   end

   if self.spam then self:spam("Getting parameter %s as %s", varName, tostring(self.db.profile[varName])) end

   return self.db.profile[varName]

end