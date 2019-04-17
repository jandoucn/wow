wowam.ClassBeeScript.MAGE=function()

LazyScript=LazyScript or {};
LazyScript["MAGE"] = {
	["List"] = {
		{
			["Name"] = "火法基础包",["Title"] = "|cff69ccf0火法基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "骑乘状态",["Title"] = "|cff69ccf0骑乘状态|r",
					["GUID"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Script"] = "--CTM 4.3 火法输出脚本 2011/02/04 by ATM\n--骑乘状态\nif IsMounted()==1  or BeePlayerBuffTime(\"喝水\")>1 or BeePlayerBuffTime(\"进食\")>1 or BeePlayerBuffTime(\"急救\")>1 then return;end",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
					["GUID"] = 2,
					["Icon"] = "Interface\\Icons\\Spell_Holy_HopeAndGrace",
					["Name"] = "优先技能",["Title"] = "|cff69ccf0优先技能|r",
				}, -- [2]
				{
					["GUID"] = 3,
					["Script"] = "if (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"黯淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"黯淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");return;end\n--保命\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"player\",\"%\")<20 and BeeIsRun(\"寒冰屏障\",\"nogoal\") then BeeRun(\"寒冰屏障\");return;end\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\n--人类自利\nif BeeUnitRace(\"player\")==\"人类\" and BeeStringFind(\"巨石碾压,震荡波,肾击,惊魂尖叫,深度冻结,致盲,制裁之锤,死亡缠绕,变形术,精神控制,诱惑,冰冻陷阱,妖术,冰霜新星,沉睡\",BeeUnitBuffList()) and BeeIsRun(\"自利\") then BeeRun(\"自利\");return;end\n\n\n",
					["Name"] = "优先保命",["Title"] = "|cff69ccf0优先保命|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Frost_Frost",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动补BUFF",["Title"] = "|cff69ccf0自动补BUFF|r",
					["GUID"] = 4,
					["Icon"] = "Interface\\Icons\\Spell_Holy_MagicalSentry",
					["Script"] = "--自动补BUFF\nif BeeIsRun(\"奥术光辉\",\"player\") and BeePlayerBuffTime(\"奥术智慧\")<60 then BeeRun(\"奥术光辉\",\"player\");return;end\nif BeeIsRun(\"熔岩护甲\",\"player\") and BeePlayerBuffTime(\"熔岩护甲\")<60 then BeeRun(\"熔岩护甲\",\"player\");return;end",
				}, -- [4]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat() and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\")) or BeePlayerBuffTime(\"隐形术\")>0 or BeeUnitCastSpellName(\"player\")==\"唤醒\" or BeeUnitCastSpellName(\"player\")==\"奥术飞弹\" or BeeUnitCastSpellName(\"player\")==\"暴风雪\" then return;end",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\Spell_Holy_HolyNova",
					["Name"] = "自动协助T",["Title"] = "|cff69ccf0自动协助T|r",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Script"] = "--法术偷取\nif BeeUnitAffectingCombat() and BeeUnitBuffInfo(\"target\",2,\"Magic\",1)>=1 and BeeIsRun(\"法术吸取\",\"target\") then BeeRun(\"法术吸取\",\"target\") return;end",
					["Name"] = "法术吸取",["Title"] = "|cff69ccf0法术吸取|r",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Spell_Arcane_Arcane02",
					["Description"] = "當滿足條件時自動施放",
				}, -- [6]
				{
					["GUID"] = 7,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "法术反制",["Title"] = "|cff69ccf0法术反制|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Frost_IceShock",
					["Script"] = "--自动打断\nlocal daduan=\"寒冰箭雨,星尘,腐臭蜂群,邪能烈焰,绝对服从,奥术波动,饥饿暗影,精神鞭笞,暗影钻削,暮光冲击波,甜美的摇篮曲,寒冰手,穿刺,冰霜之箭,时间漩涡,惩击\";\nif BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\")) and BeeIsRun(\"法术反制\",\"target\")  then BeeRun(\"法术反制\",\"target\");return;end",
				}, -- [7]
				{
					["Enabled"] = 1,
					["Name"] = "解除诅咒",["Title"] = "|cff69ccf0解除诅咒|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 8,
					["Icon"] = "Interface\\Icons\\Spell_Nature_RemoveCurse",
					["Script"] = "--解除诅咒\ngrouptype=\"\";if GetNumGroupMembers()>0 then grouptype=\"raid\" else grouptype=\"party\";end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"解除诅咒\",unit)',\"BeeUnitBuffInfo(unit,2,'Curse',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>0 and BeeIsRun(\"解除诅咒\",qusan) then BeeRun(\"解除诅咒\",qusan);return;end",
				}, -- [8]
				{
					["Enabled"] = 1,
					["Name"] = "自动开饰品",["Title"] = "|cff69ccf0自动开饰品|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\Spell_Holy_LastingDefense",
					["Script"] = "--自动开饰品\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',10))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',10)))==0 then BeeRun(\"/use 10\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
				}, -- [9]
				{
					["Enabled"] = 1,
					["Name"] = "火法输出",["Title"] = "|cff69ccf0火法输出|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 10,
					["Icon"] = "Interface\\Icons\\spell_nature_wrathv2",
					["Script"] = "if  BeePlayerBuffTime(\"隐形术\")>0 or BeeUnitCastSpellName(\"player\")==\"唤醒\" or BeeUnitCastSpellName(\"player\")==\"奥术飞弹\" or BeeUnitCastSpellName(\"player\")==\"暴风雪\" then return;end\nif (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"黯淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"黯淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");return;end\n--回蓝\nif BeeUnitAffectingCombat() and BeeUnitMana(\"player\",\"%\")<75 and BeeIsRun(\"法力宝石\",\"nogoal\") then BeeRun(\"法力宝石\",\"nogoal\"); return true;end\nif BeeUnitAffectingCombat() and BeeUnitMana(\"player\",\"%\")<15 and BeeIsRun(\"唤醒\",\"nogoal\") then BeeRun(\"唤醒\",\"nogoal\");return;end\n--镜像\nif BeeUnitAffectingCombat() and BeeUnitCanAttack(\"target\") and BeeSpellCD(\"镜像\")<=0 and BeeIsRun(\"镜像\") then BeeRun(\"镜像\");return;end\n--燃烧\nif BeeUnitAffectingCombat() and BeeTargetDeBuffTime(\"炎爆术\")>0 and BeeTargetDeBuffTime(\"点燃\")>0 and BeeIsRun(\"燃烧\") then BeeRun(\"/cast 燃烧\");return;end\n-- 触发[法术连击]时，使用[炎爆术]。\nif BeeUnitAffectingCombat() and BeePlayerBuffTime(\"法术连击\")>1 and BeeIsRun(\"炎爆术\") then BeeRun(\"炎爆术\");return;end\n-- [烈焰宝珠]CD好了就用。\nif BeeUnitAffectingCombat() and BeeUnitCanAttack(\"target\") and BeeIsRun(\"烈焰宝珠\") then BeeRun(\"烈焰宝珠\");return;end\n--有冲击BUFF时候使火焰冲击\nif BeePlayerBuffTime(\"冲击\")>0 and BeeIsRun(\"火焰冲击\") then BeeRun(\"火焰冲击\");return;end\n-- 保持目标身上的[活动炸弹]，但在它爆炸前不要刷新它。\nif BeeTargetDeBuffTime(\"活动炸弹\")<=0 and BeeIsRun(\"活动炸弹\") then BeeRun(\"活动炸弹\");return;end\n-- 目标身上的[临界炽焰]debuff低于3秒，用[灼烧]保持debuff，除非你的队伍中有术士保持[暗影烈焰]。\nif BeeUnitAffectingCombat() and BeeTargetDeBuffTime(\"临界炽焰\")<3 and BeeIsRun(\"灼烧\") then BeeRun(\"灼烧\");return;end\nif GetUnitSpeed(\"player\")>0 and BeePlayerBuffTime(\"熔火之羽\")<0 then\n    if BeeIsRun(\"火焰冲击\",\"target\") then BeeRun(\"火焰冲击\",\"target\");return;end\n    if BeeIsRun(\"灼烧\",\"target\") then BeeRun(\"灼烧\",\"target\");BeeUnitCastSpellDelay(\"灼烧\",1);return;end\nend\n-- 以上都不必做时，且不必移动时，搓[火球术]。\nif BeeIsRun(\"火球术\",\"target\") then BeeRun(\"火球术\",\"target\");return;end",
				}, -- [10]
    		},
		},
		{
			["Name"] = "奥法基础包",["Title"] = "|cff69ccf0奥法基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Name"] = "骑乘状态",["Title"] = "|cff69ccf0骑乘状态|r",
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Script"] = "--CTM 4.3 奥法输出脚本 2012/2/4 by ATM\n--骑乘状态\nif IsMounted()==1  or BeePlayerBuffTime(\"喝水\")>1 or BeePlayerBuffTime(\"进食\")>1 or BeePlayerBuffTime(\"急救\")>1 then return;end",
				}, -- [1]
				{
					["GUID"] = 2,
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Holy_HopeAndGrace",
					["Name"] = "优先技能",["Title"] = "|cff69ccf0优先技能|r",
				}, -- [2]
				{
					["GUID"] = 3,
					["Script"] = "if (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"黯淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"黯淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");return;end\n--保命\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"player\",\"%\")<20 and BeeIsRun(\"寒冰屏障\",\"nogoal\") then BeeRun(\"寒冰屏障\");return;end\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\n--人类自利\nif BeeUnitRace(\"player\")==\"人类\" and BeeStringFind(\"巨石碾压,震荡波,肾击,惊魂尖叫,深度冻结,致盲,制裁之锤,死亡缠绕,变形术,精神控制,诱惑,冰冻陷阱,妖术,冰霜新星,沉睡\",BeeUnitBuffList()) and BeeIsRun(\"自利\") then BeeRun(\"自利\");return;end\n\n\n",
					["Name"] = "优先保命",["Title"] = "|cff69ccf0优先保命|r",
					["Icon"] = "Interface\\Icons\\Spell_Frost_Frost",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["GUID"] = 4,
					["Name"] = "自动补BUFF",["Title"] = "|cff69ccf0自动补BUFF|r",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Holy_MagicalSentry",
					["Script"] = "--自动补BUFF\nif BeeIsRun(\"奥术光辉\",\"player\") and BeePlayerBuffTime(\"奥术智慧\")<60 then BeeRun(\"奥术光辉\",\"player\");return;end\nif BeeIsRun(\"法师护甲\",\"player\") and BeePlayerBuffTime(\"法师护甲\")<60 then BeeRun(\"法师护甲\",\"player\");return;end",
				}, -- [4]
				{
					["GUID"] = 5,
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat() and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\")) or BeePlayerBuffTime(\"隐形术\")>0 or BeeUnitCastSpellName(\"player\")==\"唤醒\" or BeeUnitCastSpellName(\"player\")==\"奥术飞弹\" or BeeUnitCastSpellName(\"player\")==\"暴风雪\" then return;end",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Holy_HolyNova",
					["Name"] = "自动协助T",["Title"] = "|cff69ccf0自动协助T|r",
				}, -- [5]
				{
					["GUID"] = 6,
					["Script"] = "--法术偷取\nif BeeUnitAffectingCombat() and BeeUnitBuffInfo(\"target\",2,\"Magic\",1)>=1 and BeeIsRun(\"法术吸取\",\"target\") then BeeRun(\"法术吸取\",\"target\") return;end",
					["Name"] = "法术吸取",["Title"] = "|cff69ccf0法术吸取|r",
					["Icon"] = "Interface\\Icons\\Spell_Arcane_Arcane02",
					["Description"] = "當滿足條件時自動施放",
				}, -- [6]
				{
					["GUID"] = 7,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "法术反制",["Title"] = "|cff69ccf0法术反制|r",
					["Icon"] = "Interface\\Icons\\Spell_Frost_IceShock",
					["Script"] = "--自动打断\nlocal daduan=\"寒冰箭雨,星尘,腐臭蜂群,邪能烈焰,绝对服从,奥术波动,饥饿暗影,精神鞭笞,暗影钻削,暮光冲击波,甜美的摇篮曲,寒冰手,穿刺,冰霜之箭,时间漩涡,惩击\";\nif BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\")) and BeeIsRun(\"法术反制\",\"target\")  then BeeRun(\"法术反制\",\"target\");return;end",
				}, -- [7]
				{
					["GUID"] = 8,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "解除诅咒",["Title"] = "|cff69ccf0解除诅咒|r",
					["Icon"] = "Interface\\Icons\\Spell_Nature_RemoveCurse",
					["Script"] = "--解除诅咒\ngrouptype=\"\";if GetNumGroupMembers()>0 then grouptype=\"raid\" else grouptype=\"party\";end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"解除诅咒\",unit)',\"BeeUnitBuffInfo(unit,2,'Curse',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>0 and BeeIsRun(\"解除诅咒\",qusan) then BeeRun(\"解除诅咒\",qusan);return;end",
				}, -- [8]
				{
					["Enabled"] = 1,
					["Name"] = "自动开饰品",["Title"] = "|cff69ccf0自动开饰品|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\Spell_Holy_LastingDefense",
					["Script"] = "--自动开饰品\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',10))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',10)))==0 then BeeRun(\"/use 10\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
				}, -- [9]
				{
					["GUID"] = 10,
					["Name"] = "奥法输出",["Title"] = "|cff69ccf0奥法输出|r",
					["Enabled"] = 1,
					["Script"] = "--躲暮光审判\nif (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"黯淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"黯淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");return;end\n--不打断施法\nif  BeePlayerBuffTime(\"隐形术\")>0 or BeeUnitCastSpellName(\"player\")==\"唤醒\" or BeeUnitCastSpellName(\"player\")==\"奥术飞弹\" or BeeUnitCastSpellName(\"player\")==\"暴风雪\" then return;end\n--移动/秒杀血少怪\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"target\")<15000 or (GetUnitSpeed(\"player\")>0 and  BeePlayerBuffTime(\"熔火之羽\")<0) then\n    if BeeIsRun(\"奥术弹幕\",\"target\") then BeeRun(\"奥术弹幕\",\"target\");return;end\n    if BeeIsRun(\"火焰冲击\",\"target\") then BeeRun(\"火焰冲击\",\"target\");return;end\n    if BeeIsRun(\"冰枪术\",\"target\") then BeeRun(\"冰枪术\",\"target\");return;end\nend\n--无脑奥冲\nif BeeUnitAffectingCombat() and BeeUnitMana(\"player\",\"%\")<15 and BeeIsRun(\"唤醒\",\"nogoal\") then BeeRun(\"唤醒\",\"nogoal\");return;end\nif BeeUnitAffectingCombat() and BeeUnitMana(\"player\",\"%\")<75 and BeeIsRun(\"法力宝石\",\"nogoal\") then BeeRun(\"法力宝石\",\"nogoal\"); return true;end\nif BeeUnitAffectingCombat() and BeeUnitCanAttack(\"target\") and BeeIsRun(\"烈焰宝珠\") then BeeRun(\"烈焰宝珠\");return;end\nif BeeUnitAffectingCombat() and BeeIsRun(\"奥术强化\",\"nogoal\") then BeeRun(\"奥术强化\",\"nogoal\");return;end\nif BeeUnitAffectingCombat() and BeeIsRun(\"气定神闲\",\"nogoal\") then BeeRun(\"气定神闲\",\"nogoal\");return;end\nif BeeUnitAffectingCombat() and BeeIsRun(\"镜像\") then BeeRun(\"镜像\");return;end\n\nif (BeeUnitMana(\"player\",\"%\")>15 and BeeSpellCD(\"唤醒\")==0) or  (BeeUnitMana(\"player\",\"%\")>25 and BeeSpellCD(\"唤醒\")>0)  then BeeRun(\"奥术冲击\",\"target\");return\nelse  \n    if BeePlayerBuffTime(\"节能施法\")>1 and BeeIsRun(\"奥术冲击\") then BeeRun(\"奥术冲击\");return;end;\n    if BeePlayerBuffTime(\"奥术飞弹！\")>1  and BeePlayerDeBuffCount(\"奥术冲击\")==4 and BeeIsRun(\"奥术飞弹\") then BeeRun(\"奥术飞弹\");return;end \n    if BeePlayerDeBuffCount(\"奥术冲击\")==4 and  BeeIsRun(\"奥术弹幕\") then BeeRun(\"奥术弹幕\");return;end\n    if BeePlayerDeBuffCount(\"奥术冲击\")<4 and BeeIsRun(\"奥术冲击\") then BeeRun(\"奥术冲击\");return;end    \nend",
					["Icon"] = "Interface\\Icons\\Spell_Holy_MagicalSentry",
					["Description"] = "當滿足條件時自動施放",
				}, -- [10]
			},
		},
		{
		    ["Name"] = "冰法基础包",["Title"] = "|cff69ccf0冰法基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--CTM 4.3 冰法输出脚本 2011/12/22 by ATM\n--骑乘状态\nif IsMounted()==1 then return;end",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Name"] = "骑乘状态",["Title"] = "|cff69ccf0骑乘状态|r",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "优先技能",["Title"] = "|cff69ccf0优先技能|r",
					["GUID"] = 2,
					["Icon"] = "Interface\\Icons\\Spell_Holy_HopeAndGrace",
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
				}, -- [2]
				{
					["GUID"] = 3,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--保命\nif BeeUnitHealth(\"player\",\"%\")<20 and BeeIsRun(\"寒冰屏障\",\"nogoal\") then BeeRun(\"寒冰屏障\");return;end\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"奇效治疗药水\") then BeeRun(\"奇效治疗药水\");return;end\n--人类自利\nif BeeUnitRace(\"player\")==\"人类\" and BeeStringFind(\"惊魂尖叫,深度冻结,致盲,制裁之锤,死亡缠绕,变形术,精神控制,诱惑,冰冻陷阱,妖术,冰霜新星,沉睡\",BeeUnitBuffList()) and BeeIsRun(\"自利\") then BeeRun(\"自利\");return;end\n\n\n",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Frost_Frost",
					["Name"] = "优先保命",["Title"] = "|cff69ccf0优先保命|r",
				}, -- [3]
				{
					["GUID"] = 4,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--自动补BUFF\nif BeeIsRun(\"奥术光辉\",\"player\") and BeePlayerBuffTime(\"奥术智慧\")<60 then BeeRun(\"奥术光辉\",\"player\");return;end\nif BeeIsRun(\"熔岩护甲\",\"player\") and BeePlayerBuffTime(\"熔岩护甲\")<60 then BeeRun(\"熔岩护甲\",\"player\");return;end\nif BeeIsRun(\"寒冰护体\",\"player\") and BeePlayerBuffTime(\"寒冰护体\")<=0 then BeeRun(\"寒冰护体\",\"player\");return;end",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_MagicalSentry",
					["Name"] = "自动补BUFF",["Title"] = "|cff69ccf0自动补BUFF|r",
				}, -- [4]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat()and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\")) or BeePlayerBuffTime(\"隐形术\")>0 or BeeUnitCastSpellName(\"player\")==\"唤醒\"  or BeeUnitCastSpellName(\"player\")==\"暴风雪\" then return;end\n",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\Spell_Holy_HolyNova",
					["Name"] = "自动协助T",["Title"] = "|cff69ccf0自动协助T|r",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Script"] = "--法术偷取\nif BeeUnitBuffInfo(\"target\",2,\"Magic\",1)>=1 and BeeIsRun(\"法术吸取\",\"target\") then BeeRun(\"法术吸取\",\"target\") return;end",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Spell_Arcane_Arcane02",
					["Name"] = "法术吸取",["Title"] = "|cff69ccf0法术吸取|r",
				}, -- [6]
				{
					["GUID"] = 7,
					["Script"] = "--自动打断\nlocal daduan=\"寒冰箭雨,星尘,腐臭蜂群,邪能烈焰,绝对服从,奥术波动,饥饿暗影,精神鞭笞,暗影钻削,暮光冲击波\";\nif BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\")) and BeeIsRun(\"法术反制\",\"target\")  then BeeRun(\"法术反制\",\"target\");return;end",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Frost_IceShock",
					["Name"] = "法术反制",["Title"] = "|cff69ccf0法术反制|r",
				}, -- [7]
				{
					["GUID"] = 8,
					["Script"] = "--解除诅咒\ngrouptype=\"\";if GetNumGroupMembers()>0 then grouptype=\"raid\" else grouptype=\"party\";end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"解除诅咒\",unit)',\"BeeUnitBuffInfo(unit,2,'Curse',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>0 and BeeIsRun(\"解除诅咒\",qusan) then BeeRun(\"解除诅咒\",qusan);return;end",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Nature_RemoveCurse",
					["Name"] = "解除诅咒",["Title"] = "|cff69ccf0解除诅咒|r",
				}, -- [8]
				{
					["Enabled"] = 1,
					["Name"] = "自动开饰品",["Title"] = "|cff69ccf0自动开饰品|r",
					["Script"] = "--自动开饰品\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\Spell_Holy_LastingDefense",
					["Description"] = "當滿足條件時自動施放",
				}, -- [9]
				{
					["Enabled"] = true,
					["Script"] = "--法力宝石\nif BeeUnitMana(\"player\",\"%\")<75 and BeeIsRun(\"法力宝石\",\"nogoal\") then BeeRun(\"法力宝石\",\"nogoal\"); return true;end\n--自动唤醒\nif BeeUnitMana(\"player\",\"%\")<35 and BeeIsRun(\"唤醒\",\"nogoal\") then BeeRun(\"唤醒\",\"nogoal\");return;end\n",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 10,
					["Icon"] = "Interface\\Icons\\Spell_Nature_Purge",
					["Name"] = "自动回蓝",["Title"] = "|cff69ccf0自动回蓝|r",
				}, -- [10]
				{
					["Enabled"] = 1,
					["Name"] = "冰法输出",["Title"] = "|cff69ccf0冰法输出|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 11,
					["Icon"] = "Interface\\Icons\\Spell_Frost_FrostBolt02",
					["Script"] = "----移动/秒杀血少怪\nif BeeUnitHealth(\"target\")<15000 or GetUnitSpeed(\"player\")>0 then\n    if BeeIsRun(\"火焰冲击\",\"target\") then BeeRun(\"火焰冲击\",\"target\");return;end\n    if BeeIsRun(\"冰枪术\",\"target\") then BeeRun(\"冰枪术\",\"target\");return;end\nend\n\n--冰法输出脚本\n--0 有嗜血效果的时候，冰冷血脉能用就用\nif BeeIsRun(\"冰冷血脉\",\"nogoal\") and (BeePlayerBuffTime(\"英勇\")>0 or BeePlayerBuffTime(\"嗜血\")>0 or BeePlayerBuffTime(\"时间扭曲\")>0) then BeeRun(\"冰冷血脉\",\"nogoal\");return true;end\n--1 镜像CD好就放\nif BeeUnitAffectingCombat() and BeeIsRun(\"镜像\") then BeeRun(\"镜像\");return true;end\n--2.霜火宝珠CD好就放\n--3.有寒冰指BUFF的情况下能深度冻结就深度冻结\nif BeePlayerBuffTime(\"寒冰指\")>1 and  BeeIsRun(\"深度冻结\") then BeeRun(\"深度冻结\");return true;end\n--4.有寒冰指BUFF，有深度冻结BUFF，急速冷却可用，使用急速冷却(可以多打两下)\nif BeePlayerBuffTime(\"寒冰指\")>1 and  BeeIsRun(\"急速冷却\") and BeeTargetDeBuffTime(\"深度冻结\")>1  then BeeRun(\"急速冷却\");return true;end\n--5.有寒冰指BUFF，同时也有冰冷智慧BUFF，打霜火之箭\nif BeePlayerBuffTime(\"寒冰指\")>1 and BeePlayerBuffTime(\"冰冷智慧\")>1 and  BeeIsRun(\"霜火之箭\")  then BeeRun(\"霜火之箭\");return true;end\n--6.只有寒冰指BUFF，打冰枪术\nif BeePlayerBuffTime(\"寒冰指\")>1 and  BeeIsRun(\"冰枪术\")  then BeeRun(\"冰枪术\");return true;end\n--7 只有冰冷智慧BUFF，打霜火箭\nif  BeePlayerBuffTime(\"冰冷智慧\")>1 and  BeeIsRun(\"霜火之箭\")  then BeeRun(\"霜火之箭\");return true;end\n--8.没有寒冰指BUFF，如果水元素的冰冻术可用，在鼠标处放水元素的冰冻术\nif BeePlayerBuffTime(\"寒冰指\")<1 and  BeeIsRun(\"冰冻术\",\"nogoal\")  then BeeMouse(0,0,1,\"冰冻术\");return true;end\n--9.没有寒冰指BUFF，如果水元素的冰冻术CD中，冰霜之环可用，在鼠标处释放冰霜之环\nif BeePlayerBuffTime(\"寒冰指\")<1 and  BeeSpellCD(\"冰冻术\")>1 and  BeeIsRun(\"冰霜之环\",\"nogoal\")  then  BeeMouse(0,0,1,\"冰霜之环\");return true;end\n--10.寒冰箭(啥BUFF都没有的时候搓寒冰箭)\nif BeeIsRun(\"寒冰箭\") then  BeeRun(\"寒冰箭\");return true;end\n",
				}, -- [11]
			},
		},
	},
}

end