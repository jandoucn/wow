wowam.ClassBeeScript.HUNTER=function()

LazyScript=LazyScript or {};
LazyScript["HUNTER"] = {
	["List"] = {
		{
			["Name"] = "生存基础包",["Title"] = "|cffabd473生存基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = true,
					["Script"] = "--猎人印记技能\nif not BeeUnitCastSpellName(\"player\") and BeeTargetDeBuffTime(\"猎人印记\")<0  and BeeIsRun(\"猎人印记\",\"target\") then\n    BeeRun(\"猎人印记\",\"target\");\n    return;\nend;\n--移动时用灵狐守护，固定射击时用雄鹰守护\nif GetUnitSpeed(\"player\") > 0 and BeePlayerBuffTime(\"灵狐守护\")<0 and BeeIsRun(\"灵狐守护\") then BeeRun(\"灵狐守护\"); \n    return;    \nend;\nif GetUnitSpeed(\"player\") <= 0 and BeePlayerBuffTime(\"雄鹰守护\")<0 and BeeIsRun(\"雄鹰守护\") then BeeRun(\"雄鹰守护\"); \n    return;    \nend;\nif BeeUnitHealth(\"target\",\"%\")<20 and BeeIsRun(\"杀戮射击\") then \n    BeeRun(\"杀戮射击\");\n    return;\nend;\nif BeePlayerBuffCount(\"荷枪实弹\")<0 and  BeeIsRun(\"爆炸射击\") then \n    BeeRun(\"爆炸射击\");\n    return;\nend;\n\n\n",
					["Name"] = "辅助部分",["Title"] = "|cffabd473辅助部分|r",
					["GUID"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Warrior_WarCry",
					["Description"] = "當滿足條件時自動施放",
				}, -- [1]
				{
					["Enabled"] = true,
					["Script"] = "if BeeTargetDeBuffTime(\"毒蛇钉刺\")<0 and \nBeeIsRun(\"毒蛇钉刺\",\"target\") then    \n    BeeRun(\"毒蛇钉刺\",\"target\");    \n    return;\nend;",
					["Name"] = "毒刺保持",["Title"] = "|cffabd473毒刺保持|r",
					["GUID"] = 2,
					["Icon"] = "Interface\\Icons\\INV_Axe_02",
					["Description"] = "當滿足條件時自動施放",
				}, -- [2]
				{
					["GUID"] = 3,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "主要输出",["Title"] = "|cffabd473主要输出|r",
					["Enabled"] = true,
					["Icon"] = "Interface\\Icons\\INV_Weapon_Bow_02",
					["Script"] = "if BeeUnitMana(\"player\")>44 and BeeIsRun(\"爆炸射击\") then BeeRun(\"爆炸射击\");\n    return;\nelseif BeeIsRun(\"狂暴\",\"nogoal\") then BeeRun(\"狂暴\",\"nogoal\");\n    return;\nelseif BeeIsRun(\"急速射击\",\"nogoal\") then BeeRun(\"急速射击\",\"nogoal\")\n    return;\nelseif BeeUnitMana(\"player\")>35 and BeeIsRun(\"黑箭\") then BeeRun(\"黑箭\");\n    return;\nelseif BeeIsRun(\"眼镜蛇射击\", \"target\") \nthen BeeRun(\"眼镜蛇射击\");    \n    return;\nend;\nif BeeUnitMana(\"player\")>90 then BeeIsRun(\"奥术射击\")\n    BeeRun(\"奥术射击\"); \n    return;\nend; ",
				}, -- [3]
				{
					["GUID"] = 4,
					["Script"] = "--猎人印记技能\nif not BeeUnitCastSpellName(\"player\") and BeeTargetDeBuffTime(\"猎人印记\")<0  and BeeIsRun(\"猎人印记\",\"target\") then\n    BeeRun(\"猎人印记\",\"target\");\n    return;\nend;\n--站立使用雄鹰守护，跑动使用灵狐守护\nif GetUnitSpeed(\"player\") > 0 and BeePlayerBuffTime(\"灵狐守护\")<0 and BeeIsRun(\"灵狐守护\") then BeeRun(\"灵狐守护\"); \n    return;    \nend;\nif GetUnitSpeed(\"player\") <= 0 and BeePlayerBuffTime(\"雄鹰守护\")<0 and BeeIsRun(\"雄鹰守护\") then BeeRun(\"雄鹰守护\"); \n    return;    \nend;\nif  BeeUnitMana(\"player\")>=20 and BeeIsRun(\"多重射击\") then BeeRun(\"多重射击\");\n    return;\nelseif BeeIsRun(\"眼镜蛇射击\", \"target\")\nthen BeeRun(\"眼镜蛇射击\");\n    return;  \nend;\nif BeePlayerBuffTime(\"荷枪实弹\")>0 then BeeRun(\"爆炸射击\"); \n    return;\nend;\nif BeeUnitHealth(\"target\",\"%\")<20 and BeeIsRun(\"杀戮射击\") then \n    BeeRun(\"杀戮射击\");\n    return;\nend;",
					["Name"] = "多重射击",["Title"] = "|cffabd473多重射击|r",
					["Icon"] = "Interface\\Icons\\inv_spear_05",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
				{
					["GUID"] = 5,
					["Script"] = "local aaz = BeeUnitClassBase()\nif BeeStringFind(\"潜行者,死亡骑士,战士,圣骑士,猎人,法师,萨满祭司,德鲁伊,牧师,术士\",aaz) and BeeIsRun(\"宠物攻击\") then\n    BeeRun(\"宠物攻击\");\n    return;\nend\nif BeeUnitHealth(\"pet\",\"%\")<80 and BeeUnitBuff(\"治疗宠物\", \"pet\") < 1 and BeeIsRun(\"治疗宠物\", nil) then\n    BeeRun(\"治疗宠物\", nil);\n    return;\nend\n",
					["Name"] = "宠物攻击焦点",["Title"] = "|cffabd473宠物攻击焦点|r",
					["Icon"] = "Interface\\Icons\\Racial_Orc_BerserkerStrength",
					["Description"] = "當滿足條件時自動施放",
				}, -- [5]
    		},
		},
		{
			["Name"] = "射击基础包",["Title"] = "|cffabd473射击基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = true,
					["Name"] = "辅助部分",["Title"] = "|cffabd473辅助部分|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Warrior_WarCry",
					["Script"] = "--站立使用雄鹰守护，跑动使用灵狐守护\nif GetUnitSpeed(\"player\") > 0 and BeePlayerBuffTime(\"灵狐守护\")<0 and BeeIsRun(\"灵狐守护\") then BeeRun(\"灵狐守护\"); \n    return;    \nend;\nif GetUnitSpeed(\"player\") <= 0 and BeePlayerBuffTime(\"雄鹰守护\")<0 and BeeIsRun(\"雄鹰守护\") then BeeRun(\"雄鹰守护\"); \n    return;    \nend;",
				}, -- [1]
				{
					["Enabled"] = true,
					["Name"] = "毒刺保持",["Title"] = "|cffabd473毒刺保持|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 2,
					["Icon"] = "Interface\\Icons\\INV_Helmet_23",
					["Script"] = "--保持毒蛇钉刺部分\nif BeeTargetDeBuffTime(\"毒蛇钉刺\")<0 and \nBeeIsRun(\"毒蛇钉刺\",\"target\") then \n    BeeRun(\"毒蛇钉刺\",\"target\");\n    return;\nend;\n--杀戮射击\nif BeeUnitHealth(\"target\",\"%\")<20 and BeeIsRun(\"杀戮射击\") then \n    BeeRun(\"杀戮射击\");\n    return;\nend;\nif BeePlayerBuffTime(\"开火！\")>=2 then BeeRun(\"瞄准射击\"); \n    return;\nend;",
				}, -- [2]
				{
					["Enabled"] = true,
					["Name"] = "主要输出",["Title"] = "|cffabd473主要输出|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 3,
					["Icon"] = "INTERFACE\\ICONS\\inv_chest_chain_06",
					["Script"] = "if BeeUnitMana(\"player\")>44 and BeeIsRun(\"奇美拉射击\") then BeeRun(\"奇美拉射击\");\n    return;\nelseif BeeIsRun(\"狂暴\",\"nogoal\") then BeeRun(\"狂暴\",\"nogoal\");\n    return;\nelseif BeeIsRun(\"急速射击\",\"nogoal\") then BeeRun(\"急速射击\",\"nogoal\")\n    return;\nelseif BeeUnitMana(\"player\")>50 and BeeIsRun(\"瞄准射击\") then BeeRun(\"瞄准射击\");\n    return;\nelseif  BeeIsRun(\"稳固射击\", \"target\") \nthen BeeRun(\"稳固射击\");    \n    return;  \nelseif BeePlayerBuffTime(\"强化稳固射击\")<=4 and BeeIsRun(\"稳固射击\", \"target\") \nthen BeeRun(\"稳固射击\");    \n    return;  \nelseif BeeUnitMana(\"player\")>=50 and BeeIsRun(\"瞄准射击\") and BeePlayerBuffTime(\"急速射击\") < 0 and BeePlayerBuffTime(\"嗜血\") < 0 and BeePlayerBuffTime(\"时间扭曲\") < 0 and BeePlayerBuffTime(\"狂暴\") < 0 then\n    BeeRun(\"瞄准射击\"); \n    return;\nend; \nif BeePlayerBuffTime(\"急速射击\")<4 and BeeSpellCD(\"急速射击\")>=3  and BeeIsRun(\"准备就绪\") then \n    BeeRun(\"准备就绪\");\n    return; \nend;",
				}, -- [3]
				{
					["GUID"] = 4,
					["Script"] = "--站立使用雄鹰守护，跑动使用灵狐守护\nif GetUnitSpeed(\"player\") > 0 and BeePlayerBuffTime(\"灵狐守护\")<0 and BeeIsRun(\"灵狐守护\") then BeeRun(\"灵狐守护\"); \n    return;    \nend;\nif GetUnitSpeed(\"player\") <= 0 and BeePlayerBuffTime(\"雄鹰守护\")<0 and BeeIsRun(\"雄鹰守护\") then BeeRun(\"雄鹰守护\"); \n    return;    \nend;\nif  BeeUnitMana(\"player\")>=20 and BeeIsRun(\"多重射击\") then BeeRun(\"多重射击\");\n    return;\nelseif BeePlayerBuffTime(\"强化稳固射击\")<=4 and BeeIsRun(\"稳固射击\", \"target\") \nthen BeeRun(\"稳固射击\");\n    return;\nelseif BeeIsRun(\"稳固射击\", \"target\")\nthen BeeRun(\"稳固射击\");\n    return;  \nend;\nif BeePlayerBuffTime(\"开火！\")>0 then BeeRun(\"瞄准射击\"); \n    return;\nend;",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\INV_Weapon_Bow_02",
					["Name"] = "多重射击",["Title"] = "|cffabd473多重射击|r",
				}, -- [4]
				{
					["GUID"] = 5,
					["Script"] = "local aaz = BeeUnitClassBase()\nif BeeStringFind(\"潜行者,死亡骑士,战士,圣骑士,猎人,法师,萨满祭司,德鲁伊,牧师,术士\",aaz) and BeeIsRun(\"宠物攻击\") then\n    BeeRun(\"宠物攻击\");\n    return;\nend\nif BeeUnitHealth(\"pet\",\"%\")<80 and BeeUnitBuff(\"治疗宠物\", \"pet\") < 1 and BeeIsRun(\"治疗宠物\", nil) then\n    BeeRun(\"治疗宠物\", nil);\n    return;\nend\n",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Racial_Orc_BerserkerStrength",
					["Name"] = "宠物攻击焦点",["Title"] = "|cffabd473宠物攻击焦点|r",
				}, -- [5]
			},
		},
		{
		    ["Name"] = "兽王基础包",["Title"] = "|cffabd473兽王基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = 1,
					["Script"] = "--猎人印记技能\nif not BeeUnitCastSpellName(\"player\") and BeeTargetDeBuffTime(\"猎人印记\")<0  and BeeIsRun(\"猎人印记\",\"target\") then\n    BeeRun(\"猎人印记\",\"target\");\n    return;\nend;\n--移动时用灵狐守护，固定射击时用雄鹰守护\nif GetUnitSpeed(\"player\") > 0 and BeePlayerBuffTime(\"灵狐守护\")<0 and BeeIsRun(\"灵狐守护\") then BeeRun(\"灵狐守护\"); \n    return;    \nend;\nif GetUnitSpeed(\"player\") <= 0 and BeePlayerBuffTime(\"雄鹰守护\")<0 and BeeIsRun(\"雄鹰守护\") then BeeRun(\"雄鹰守护\"); \n    return;    \nend;\n",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 4,
					["Icon"] = "Interface\\Icons\\Ability_BackStab",
					["Name"] = "辅助部分",["Title"] = "|cffabd473辅助部分|r",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Script"] = "--保持毒蛇钉刺部分\nif BeeTargetDeBuffTime(\"毒蛇钉刺\")<0 and \nBeeIsRun(\"毒蛇钉刺\",\"target\") then    \n    BeeRun(\"毒蛇钉刺\",\"target\");    \n    return;\nend;\n--杀戮命令\nif  BeeIsRun(\"杀戮命令\") then \n    BeeRun(\"杀戮命令\");     \n    return; \nend;\n--杀戮射击\nif BeeUnitHealth(\"target\",\"%\")<20 and BeeIsRun(\"杀戮射击\") then \n    BeeRun(\"杀戮射击\");     \n    return; \nend;\n--辅助技能\nif BeeIsRun(\"狂野怒火\",\"nogoal\") then BeeRun(\"狂野怒火\",\"nogoal\");\n    return;\nend;\nif BeeIsRun(\"急速射击\",\"nogoal\") then BeeRun(\"急速射击\",\"nogoal\");\n    return;\nend;\nif BeeIsRun(\"狂暴\",\"nogoal\") then BeeRun(\"狂暴\",\"nogoal\");\n    return;\nend;\nif  BeeUnitMana(\"player\")>55 and BeeSpellCD(\"杀戮命令\")>0 and\nBeeIsRun(\"奥术射击\",\"target\") then    \n    BeeRun(\"奥术射击\",\"target\");\nend;\nif BeeIsRun(\"热情\",\"nogoal\") then BeeRun(\"热情\",\"nogoal\");\n    return;\nend;\n--眼镜蛇射击\nif  BeeIsRun(\"眼镜蛇射击\") then \n    BeeRun(\"眼镜蛇射击\");     \n    return; \nend;\nif BeeGetComboPoints(\"狂乱效果\")<=5 and BeeSpellCD(\"集中火力\")<=0 then\n    BeeRun(\"集中火力\");     \n    return; \nend;",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Ambush",
					["Name"] = "输出部分",["Title"] = "|cffabd473输出部分|r",
				}, -- [2]
				{
					["Enabled"] = 1,
					["Script"] = "--治疗宠物\nif BeeUnitBuff(\"治疗宠物\",\"%\",\"pet\",2,1)<80 and \nBeeIsRun(\"治疗宠物\",\"pet\") then    \n    BeeRun(\"治疗宠物\",\"pet\");    \n    BeeUnitCastSpellDelay(\"治疗宠物\",15)    \n    return;\nend; ",
					["Name"] = "宠物治疗部分",["Title"] = "|cffabd473宠物治疗部分|r",
					["GUID"] = 2,
					["Icon"] = "Interface\\Icons\\Ability_BackStab",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "宠物攻击焦点",["Title"] = "|cffabd473宠物攻击焦点|r",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\Ability_Creature_Disease_03",
					["Script"] = "local aaz = BeeUnitClassBase()\nif BeeStringFind(\"潜行者,死亡骑士,战士,圣骑士,猎人,法师,萨满祭司,德鲁伊,牧师,术士\",aaz) and BeeIsRun(\"宠物攻击\") then\n    BeeRun(\"宠物攻击\");\n    return;\nend;",
				}, -- [4]
				{
					["GUID"] = 5,
					["Script"] = "--站立使用雄鹰守护，跑动使用灵狐守护\nif GetUnitSpeed(\"player\") > 0 and BeePlayerBuffTime(\"灵狐守护\")<0 and BeeIsRun(\"灵狐守护\") then BeeRun(\"灵狐守护\"); \n    return;    \nend;\nif GetUnitSpeed(\"player\") <= 0 and BeePlayerBuffTime(\"雄鹰守护\")<0 and BeeIsRun(\"雄鹰守护\") then BeeRun(\"雄鹰守护\"); \n    return;    \nend;\n--保持毒蛇钉刺部分\nif BeeTargetDeBuffTime(\"毒蛇钉刺\")<0 and \nBeeIsRun(\"毒蛇钉刺\",\"target\") then    \n    BeeRun(\"毒蛇钉刺\",\"target\");    \n    return;\nend;\nif  BeeUnitMana(\"player\")>20 and BeeIsRun(\"多重射击\") then BeeRun(\"多重射击\");\n    return;\nelseif BeeIsRun(\"眼镜蛇射击\", \"target\")\nthen BeeRun(\"眼镜蛇射击\");\n    return;  \nend;",
					["Name"] = "多重射击部分",["Title"] = "|cffabd473多重射击部分|r",
					["Enabled"] = true,
					["Icon"] = "Interface\\Icons\\Ability_Hunter_ImprovedSteadyShot",
					["Description"] = "當滿足條件時自動施放",
				}, -- [5]
			},
		},
	},
}

end