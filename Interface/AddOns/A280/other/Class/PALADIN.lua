wowam.ClassBeeScript.PALADIN=function()

LazyScript=LazyScript or {};
LazyScript["PALADIN"] = {
	["List"] = {
		{
			["Name"] = "奶骑基础包",["Title"] = "|cfff58cba奶骑基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 7,
					["Script"] = "--骑乘状态自动开十字军光环，其他不做任何动作，非骑乘状态惩戒光环\nif IsMounted(\"player\")==1 then\n    if not BeeStringFind(\"十字军光环\",BeeUnitBuffList(\"player\")) then  BeeRun(\"十字军光环\",\"player\");end\n    return;\nelse\n    if not BeeStringFind(\"专注光环\",BeeUnitBuffList(\"player\")) then BeeRun(\"专注光环\",\"player\");return;end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.22 kingfreedom出品，必属精品",
					["Enabled"] = 1,
					["Name"] = "骑乘状态不施法",["Title"] = "|cfff58cba骑乘状态不施法|r",
					["Icon"] = "Interface\\Icons\\Spell_Holy_CrusaderAura",
					["Description"] = "當滿足條件時自動施放",
				}, -- [1]
				{
					["Enabled"] = true,
					["Script"] = "if BeeUnitMana(\"player\",\"%\",0)<95 and BeePlayerBuffTime(\"喝水\")>1\nthen \n    return;\nend\n\n--必须给自己上的buff\nif BeePlayerBuffTime(\"洞察圣印\")<30 and BeeIsRun(\"洞察圣印\") \nthen \n    BeeRun(\"洞察圣印\") \n    return \nend\n\nif BeeIsRun(\"审判\",\"focustarget\") and BeePlayerBuffTime(\"纯洁审判\")<2 and BeeUnitAffectingCombat(\"player\") \nthen \n    BeeRun(\"审判\",\"focustarget\") \n    return \nend\n--T的道标一定要保持好\nif BeeUnitPlayerControlled(\"focus\") and BeeUnitBuff(\"圣光道标\",\"focus\")<0 and BeeIsRun(\"圣光道标\",\"focus\") \nthen \n    BeeRun(\"圣光道标\",\"focus\") \n    return  \nend",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\INV_Misc_Food_145_Cake",
					["Name"] = "喝水状态不施法",["Title"] = "|cfff58cba喝水状态不施法|r",
				}, -- [2]
				{
					["GUID"] = 1,
					["Script"] = "--团队判断\nlocal grouptype = \"\"\n\nif GetNumGroupMembers()>0 then\n    grouptype=\"raid\"\n    \nelse\n    grouptype=\"party\"\n    \nend\n\n\nlocal BHZS = BeeGroupMinScript('BeeRange(unit)<=30 and BeeIsRun(\"保护之手\",unit) and BeeUnitHealth(unit,\"%\")<20 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif BHZS and BeeUnitBuff(\"自律\",\"BHZS\",2,2)<=0 and   BeeIsRun(\"保护之手\",BHZS) and UnitHealthMax(BHZS)<35000  then BeeRun(\"保护之手\",BHZS);\n    return; \nend\nlocal SL = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"圣疗术\",unit) and BeeUnitHealth(unit,\"%\")<25 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif SL and BeeUnitBuff(\"自律\",\"SL\",2,2)<=0 and BeeIsRun(\"圣疗术\",sl) then\n    BeeRun(\"圣疗术\",SL);\n    return; \nend",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_LayOnHands",
					["Name"] = "自动保护圣疗（慎用）",["Title"] = "|cfff58cba自动保护圣疗（慎用）|r",
				}, -- [3]
				{
					["GUID"] = 3,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "开洞察补BUFF",["Title"] = "|cfff58cba开洞察补BUFF|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_ChampionsGrace",
					["Script"] = "--没任何圣印的时候自动补洞察圣印\nif not BeeStringFind(\"洞察圣印\",BeeUnitBuffList(\"player\")) then\n    BeeRun(\"洞察圣印\",\"player\");\n    return;\nend\n\n\n\n--如果没有王者祝福或力量祝福，自动补王者祝福\nif BeeIsRun(\"王者祝福\",\"player\") and (BeePlayerBuffTime(\"王者祝福\") <0 and  BeePlayerBuffTime(\"野性印记\")<0) then \n    BeeRun(\"王者祝福\",\"player\");\n    BeeUnitCastSpellDelay(\"王者祝福\",5);\nelseif BeeIsRun(\"野性印记\",\"player\") then\n    BeeRun(\"力量祝福\",\"player\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.22 kingfreedom出品，必属精品",
				}, -- [4]
				{
					["GUID"] = 4,
					["Script"] = "--判断自己血量低并且在战斗中开圣疗\nif BeeIsRun(\"圣疗术\",\"player\") and BeeUnitHealth(\"player\",\"%\")<20  and BeePlayerDeBuffTime(\"自律\")<0  then\n    BeeRun(\"圣疗术\",\"player\");\n    BeeUnitCastSpellDelay(\"圣疗术\",2);\n    return;\nend\n\n--开圣佑术\nif BeeIsRun(\"圣佑术\",\"player\") and BeeUnitHealth(\"player\",\"%\")<70  then\n    BeeRun(\"圣佑术\",\"player\");\n    BeeUnitCastSpellDelay(\"圣佑术\",2);\n    return;\nend\n\n--开圣佑术\nif BeeIsRun(\"圣盾术\",\"player\") and BeeUnitHealth(\"player\",\"%\")<20  then\n    BeeRun(\"圣盾术\",\"player\");\n    BeeUnitCastSpellDelay(\"圣佑术\",2);\n    return;\nend\n\nif BeeIsRun(\"审判\",\"focustarget\")  and BeeUnitHealth(\"player\",\"%\")<90 and  BeeUnitAffectingCombat(\"player\") \nthen \n    BeeRun(\"审判\",\"focustarget\");\n    return;\nend\n\n--吃糖\nif BeeUnitHealth(\"player\",\"%\")<45 and BeeIsRun(\"治疗石\") \n\nthen \n    BeeRun(\"治疗石\");  \n    return;\nend\n\n--喝药\nif BeeUnitHealth(\"player\",\"%\")<20 and BeeIsRun(\"奇效治疗药水\") \nthen \n    BeeRun(\"奇效治疗药水\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.22 kingfreedom出品，必属精品",
					["Name"] = "增强保命",["Title"] = "|cfff58cba增强保命|r",
					["Enabled"] = true,
					["Icon"] = "Interface\\Icons\\Ability_Paladin_GaurdedbytheLight",
					["Description"] = "當滿足條件時自動施放",
				}, -- [5]
				{
					["Enabled"] = true,
					["Script"] = "--回蓝\nif BeeUnitMana(\"player\",\"%\",0)<80  and BeeIsRun(\"神圣恳求\") then\n    BeeRun(\"神圣恳求\");\n    return true;\nend\nif BeePlayerBuffTime(\"神圣恳求\")>=0 and BeeIsRun(\"复仇之怒\") then\n    BeeRun(\"复仇之怒\");\n    return;\nend",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 8,
					["Icon"] = "Interface\\Icons\\INV_Misc_QuestionMark",
					["Name"] = "自动神祈（慎用）",["Title"] = "|cfff58cba自动神祈（慎用）|r",
				}, -- [6]
				{
					["Enabled"] = 1,
					["Script"] = "--自动开饰品\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.22 kingfreedom出品，必属精品",
					["Name"] = "自动开饰品",["Title"] = "|cfff58cba自动开饰品|r",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\SPELL_HOLY_BORROWEDTIME",
					["Description"] = "當滿足條件時自動施放",
				}, -- [7]
				{
					["GUID"] = 5,
					["Script"] = "--自动驱散\ngrouptype=\"\";if GetNumGroupMembers()>0 then  grouptype=\"raid\" else  grouptype=\"party\" end\n\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"清洁术\",unit)',\"BeeUnitBuffInfo(unit,2,'Magic,Poison',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>0 and BeeIsRun(\"清洁术\",qusan) then BeeRun(\"清洁术\",qusan);return;end\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.22 kingfreedom出品，必属精品",
					["Name"] = "自动驱散",["Title"] = "|cfff58cba自动驱散|r",
					["Icon"] = "Interface\\Icons\\Spell_Holy_BlindingHeal",
					["Description"] = "當滿足條件時自動施放",
				}, -- [8]
				{
					["GUID"] = 14,
					["Script"] = "--第一排肯定是团队框体\nlocal grouptype=\"\" \n\nif GetNumGroupMembers()>0 \nthen \n    grouptype=\"raid\" \nelse \n    grouptype=\"party\" \nend\n\n\n\n\n\n\n\n\n\n\n\n--团队救护 远古列王  保护  圣疗\nlocal n,YGLW = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"远古列王守卫\",unit)',\"BeeUnitHealth(unit,'%')<30 and not UnitIsDeadOrGhost(unit)\",grouptype)\n\nif n >=2 and BeeIsRun(\"远古列王守卫\") \nthen \n    BeeRun(\"远古列王守卫\") \n    return \nend\nif BeeUnitCastSpellName(\"player\")==\"圣光普照\" \nthen \n    return \nend\n\nlocal x,LMSG = BeeGroupCountScript('BeeIsRun(\"黎明圣光\",unit)',\"BeeRange(unit)<=40 and BeeUnitHealth(unit,'%')<90 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif   x>=6 and BeeHolyPower()>=2 and BeeIsRun(\"黎明圣光\") \nthen \n    BeeRun(\"黎明圣光\");\n    return\nend\n\nlocal y,SGPZ = BeeGroupCountScript('BeeIsRun(\"圣光普照\",unit)',\"BeeRange(unit)<=40 and BeeUnitHealth(unit,'%')<95 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif   y>=6 and BeeIsRun(\"圣光普照\") and BeeUnitHealth(\"focus\",\"%\")>70 \nthen \n    BeeRun(\"圣光普照\",SGPZ)\n    BeeUnitCastSpellDelay(\"圣光普照\",3)\n    return\nend\n\n--双T治疗模块\n\n--25%圣疗术\n\nif BeeRange(\"target\")<=40  and BeeUnitHealth(\"target\",\"%\")<25 and UnitCanAssist(\"player\",\"target\") and not UnitIsDeadOrGhost(\"target\")  and BeeIsRun(\"圣疗术\",\"target\") \nthen \n    BeeRun(\"圣疗术\",\"target\");\n    return;\nend\nif BeeRange(\"focus\")<=40  and BeeUnitHealth(\"focus\",\"%\")<25 and UnitCanAssist(\"player\",\"focus\") and not UnitIsDeadOrGhost(\"focus\")  and BeeIsRun(\"圣疗术\",\"focus\") \nthen \n    BeeRun(\"圣疗术\",\"focus\");\n    return;\nend\n\n--牺牲之手\n\nif BeeRange(\"target\")<=30  and BeeUnitHealth(\"target\",\"%\")<50 and UnitCanAssist(\"player\",\"target\") and not UnitIsDeadOrGhost(\"target\")   and  BeeIsRun(\"牺牲之手\",\"target\") and not \"target\"==\"player\" \nthen \n    BeeRun(\"牺牲之手\",\"target\");\n    return;\nend\nif BeeRange(\"focus\")<=30  and BeeUnitHealth(\"focus\",\"%\")<50 and UnitCanAssist(\"player\",\"focus\") and not UnitIsDeadOrGhost(\"focus\")   and  BeeIsRun(\"牺牲之手\",\"focus\") and not \"focus\"==\"player\" \nthen \n    BeeRun(\"牺牲之手\",\"focus\");\n    return;\nend\n\n\n--99%神圣震击\n\nif BeeRange(\"target\")<=40  and BeeUnitHealth(\"target\",\"%\")<99 and UnitCanAssist(\"player\",\"target\") and not UnitIsDeadOrGhost(\"target\")  and BeeIsRun(\"神圣震击\",\"target\") \nthen \n    BeeRun(\"神圣震击\",\"target\");\n    return;\nend\nif BeeRange(\"focus\")<=40  and BeeUnitHealth(\"focus\",\"%\")<99 and UnitCanAssist(\"player\",\"focus\") and not UnitIsDeadOrGhost(\"focus\")  and BeeIsRun(\"神圣震击\",\"focus\") \nthen \n    BeeRun(\"神圣震击\",\"focus\");\n    return;\nend\n\n--25%圣光闪现\n\nif BeeRange(\"target\")<=40  and BeeUnitHealth(\"target\",\"%\")<25 and UnitCanAssist(\"player\",\"target\") and not UnitIsDeadOrGhost(\"target\")  and BeeIsRun(\"圣光闪现\",\"target\") \nthen \n    BeeRun(\"圣光闪现\",\"target\");\n    return;\nend\nif BeeRange(\"focus\")<=40  and BeeUnitHealth(\"focus\",\"%\")<25 and UnitCanAssist(\"player\",\"focus\") and not UnitIsDeadOrGhost(\"focus\")  and BeeIsRun(\"圣光闪现\",\"focus\") \nthen \n    BeeRun(\"圣光闪现\",\"focus\");\n    return;\nend\n\n\n--荣耀圣令\n\nif BeeRange(\"target\")<=40  and BeeUnitHealth(\"target\",\"%\")<90 and UnitCanAssist(\"player\",\"target\") and not UnitIsDeadOrGhost(\"target\") and BeeHolyPower()>=2 and BeeIsRun(\"荣耀圣令\",\"target\") then\n    BeeRun(\"荣耀圣令\",\"target\") \n    return  \nend\nif BeeRange(\"focus\")<=40  and BeeUnitHealth(\"focus\",\"%\")<90 and UnitCanAssist(\"player\",\"focus\") and not UnitIsDeadOrGhost(\"focus\") and BeeHolyPower()>=2 and BeeIsRun(\"荣耀圣令\",\"focus\") then\n    BeeRun(\"荣耀圣令\",\"focus\") \n    return  \nend\n\n\n--神圣之光\n\nif BeeRange(\"target\")<=40  and BeeUnitHealth(\"target\",nil,1)>55000 and UnitCanAssist(\"player\",\"target\") and not UnitIsDeadOrGhost(\"target\")  and BeeIsRun(\"神圣之光\",\"target\") \nthen \n    BeeRun(\"神圣之光\",\"target\");\n    return;\nend\nif BeeRange(\"focus\")<=40  and BeeUnitHealth(\"focus\",nil,1)>55000 and UnitCanAssist(\"player\",\"focus\") and not UnitIsDeadOrGhost(\"focus\")  and BeeIsRun(\"神圣之光\",\"focus\") \nthen \n    BeeRun(\"神圣之光\",\"focus\");\n    return;\nend\n\n--团刷部分\n\nif BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,\"%\")<95 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype) and BeeHolyPower()>=2 and BeeIsRun(\"荣耀圣令\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,\"%\")<95 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)) then\n    BeeRun(\"荣耀圣令\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,\"%\")<95 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)) \n    return  \nend\n\n\n\n\n--神圣震击部分\n\nif BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>10000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype) and BeeIsRun(\"神圣震击\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>10000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype))  and BeeUnitCastSpellName(\"player\")==\"圣光术\"\nthen \n    BeeRun(\"/stopcasting\")\n    \n    return\nend\n\n\nif BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>10000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype) and BeeIsRun(\"神圣震击\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>10000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype))  \nthen \n    BeeRun(\"神圣震击\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>10000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)) \n    return  \nend\n\n--神恩术\n\nif BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,\"%\")<25 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype) and  BeeIsRun(\"神恩术\") \nthen \n    BeeRun(\"神恩术\") \n    return \nend \n\nif BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,\"%\")<25 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype) and  BeeIsRun(\"圣光闪现\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,\"%\")<25 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)) \nthen \n    BeeRun(\"圣光闪现\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,\"%\")<25 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)) \n    return \nend \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！\n\n\n\n",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Paladin_BeaconofLight",
					["Name"] = "神级一键双T",["Title"] = "|cfff58cba神级一键双T|r",
				}, -- [9]
				{
					["GUID"] = 10,
					["Script"] = "local grouptype=\"\"\n\nif GetNumGroupMembers()>0 then\n    \n    grouptype=\"raid\"\n    \nelse\n    \n    grouptype=\"party\"\n    \nend\n\n\nlocal p,NSGS = BeeGroupCountScript('BeeIsRun(\"圣光术\",unit)',\"BeeRange(unit)<=40 and BeeUnitHealth(unit,nil,1)>10000 and not UnitIsDeadOrGhost(unit)\",grouptype)\nlocal q,NSSZG = BeeGroupCountScript('BeeIsRun(\"神圣之光\",unit)',\"BeeRange(unit)<=40 and BeeUnitHealth(unit,nil,1)>40000 and not UnitIsDeadOrGhost(unit)\",grouptype)\n\n\n--全团治疗\n\n\n\n\n\n\n\n\nif BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>55000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype) and q<=5 and BeeIsRun(\"神圣之光\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>55000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)) \nthen \n    BeeRun(\"神圣之光\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>55000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype))\n    return\nend\nif BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>15000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype) and BeeSpellCD(\"神圣震击\")>0 and p<=4 and BeeIsRun(\"圣光术\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>15000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)) \nthen \n    BeeRun(\"圣光术\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>15000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype))\n    return\nend\nif BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>15000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype) and p<=5 and BeeIsRun(\"圣光术\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>15000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)) \nthen \n    BeeRun(\"圣光术\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>15000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype))\n    return\nend\n\n--[[\nif BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>25000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype) and BeeSpellCD(\"神圣震击\")>0 and BeeIsRun(\"圣光闪现\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>25000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)) \nthen \n    BeeRun(\"圣光闪现\",BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>25000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype))\n    return\nend\n]]--\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！\n",
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "INTERFACE\\ICONS\\spell_paladin_lightofdawn",
					["Name"] = "全团神光（慎用）",["Title"] = "|cfff58cba全团神光（慎用）|r",
				}, -- [10]
    		},
		},
		{
			["Name"] = "惩戒骑基础包",["Title"] = "|cfff58cba惩戒骑基础包|r",
			["Version"] = 2012021001,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "骑乘状态",["Title"] = "|cfff58cba骑乘状态|r",
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Script"] = "--CTM 4.3 惩戒骑输出脚本 2011/12/25 by ATM\n--骑乘状态自动开十字军光环，其他不做任何动作，非骑乘状态惩戒光环\nif IsMounted(\"player\")==1 then\n    if not BeeStringFind(\"十字军光环\",BeeUnitBuffList(\"player\")) then  BeeRun(\"十字军光环\",\"player\");end\n    return;\nelse\n    if not BeeStringFind(\"惩戒光环\",BeeUnitBuffList(\"player\")) then BeeRun(\"惩戒光环\",\"player\");return;end\nend\n",
				}, -- [1]
				{
					["GUID"] = 2,
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
					["Name"] = "优先技能",["Title"] = "|cfff58cba优先技能|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Creature_Cursed_05",
					["Description"] = "當滿足條件時自動施放",
				}, -- [2]
				{
					["GUID"] = 3,
					["Script"] = "--组队类型判断\ngrouptype=\"\";if GetNumGroupMembers()>0 then grouptype=\"raid\" else grouptype=\"party\" end\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\n--if BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"奇效治疗药水\") then BeeRun(\"奇效治疗药水\");return;end\n--判断自己血量低并且在战斗中开圣疗(惩戒/防骑对自己放圣疗)/给队员保护之手\nif BeeUnitAffectingCombat() and BeeIsRun(\"圣疗术\",\"player\") and BeeUnitHealth(\"player\",\"%\")<20  and BeePlayerDeBuffTime(\"自律\")<0 then BeeRun(\"圣疗术\",\"player\");return;end\n--血量低于20%能开无敌\nif BeeUnitAffectingCombat() and BeeIsRun(\"圣盾术\",\"player\") and BeeUnitHealth(\"player\",\"%\")<20  and BeePlayerDeBuffTime(\"自律\")<0 then BeeRun(\"圣盾术\",\"player\");return;end\n--给团队里血低于8%的人保护之手\nlocal BHZS = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"保护之手\",unit) and BeeUnitHealth(unit,\"%\")<8 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif BeeUnitAffectingCombat() and BHZS and BeeIsRun(\"保护之手\",BHZS) and BeePlayerDeBuffTime(\"自律\")<0 then BeeRun(\"保护之手\",BHZS);return;end\n--人类自利\nif BeeUnitRace(\"player\")==\"人类\" and BeeStringFind(\"冰冻陷阱,寒冰链,惊魂尖叫,深度冻结,致盲,制裁之锤,死亡缠绕,变形术,精神控制,诱惑,冰冻陷阱,妖术,冰霜新星,沉睡\",BeeUnitBuffList()) and BeeIsRun(\"自利\") then BeeRun(\"自利\");return;end",
					["Name"] = "优先保命",["Title"] = "|cfff58cba优先保命|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Mage_ShatterShield",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["GUID"] = 4,
					["Name"] = "自动补BUFF",["Title"] = "|cfff58cba自动补BUFF|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Magic_GreaterBlessingofKings",
					["Script"] = "--自动补真理圣印\nif not BeeStringFind(\"正义圣印,真理圣印,洞察圣印\",BeeUnitBuffList(\"player\")) and BeeIsRun(\"真理圣印\",\"player\") then BeeRun(\"真理圣印\",\"player\");BeeUnitCastSpellDelay(\"真理圣印\",2);return;end\n--没有王者或力量，补王者祝福\nif BeePlayerBuffTime(\"王者祝福\")<0 and BeePlayerBuffTime(\"力量祝福\")<0 and BeeIsRun(\"王者祝福\",\"player\") then BeeRun(\"王者祝福\",\"player\");BeeUnitCastSpellDelay(\"王者祝福\",2);return;end\n",
				}, -- [4]
				{
					["GUID"] = 5,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动协助T",["Title"] = "|cfff58cba自动协助T|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Defend",
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat()and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\")) then return;end",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Name"] = "自动打断",["Title"] = "|cfff58cba自动打断|r",
					["Script"] = "--自动打断\nlocal daduan=\"寒冰箭雨,星尘,腐臭蜂群,邪能烈焰,绝对服从,奥术波动,饥饿暗影,精神鞭笞,暗影钻削,暮光冲击波,甜美的摇篮曲,寒冰手,穿刺,冰霜之箭,时间漩涡,惩击\";\n--自动打断\nlocal spelljd, _, _, _, _, _, _, ddjd = UnitCastingInfo(\"focustarget\")\nlocal spellzj, _, _, _, _, _, _, ddzj = UnitCastingInfo(\"target\")\nif BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\")) and BeeIsRun(\"责难\",\"target\")  then BeeRun(\"责难\",\"target\");return;end\nif BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\"))  and BeeSpellCD(\"责难\")>0 and  BeeIsRun(\"制裁之锤\",\"target\")  then BeeRun(\"制裁之锤\",\"target\");return;end\n",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Ability_Kick",
					["Description"] = "當滿足條件時自動施放",
				}, -- [6]
				{
					["Enabled"] = 1,
					["Script"] = "--自动驱散\ngrouptype=\"\";if GetNumGroupMembers()>0 then  grouptype=\"raid\" else  grouptype=\"party\" end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"清洁术\",unit)',\"BeeUnitBuffInfo(unit,2,'Disease,Poison',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype)\nif n >0 and BeeIsRun(\"清洁术\",qusan) then BeeRun(\"清洁术\",qusan);return;end",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 7,
					["Icon"] = "Interface\\Icons\\ABILITY_POISONSTING",
					["Name"] = "自动驱散",["Title"] = "|cfff58cba自动驱散|r",
				}, -- [7]
				{
					["GUID"] = 8,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--自动开饰品\nif BeeUnitAffectingCombat()  and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif BeeUnitAffectingCombat()  and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
					["Icon"] = "Interface\\Icons\\Ability_Druid_EmpoweredRejuvination",
					["Name"] = "自动开饰品",["Title"] = "|cfff58cba自动开饰品|r",
				}, -- [8]
				{
					["GUID"] = 10,
					["Script"] = "if BeeUnitAffectingCombat()  and  BeeIsRun(\"圣佑术\")  then BeeRun(\"圣佑术\");return;end\nif BeeUnitAffectingCombat()  and  BeeIsRun(\"复仇之怒\") and  BeePlayerDeBuffTime(\"自律\")<1 then BeeRun(\"复仇之怒\");return;end\nif BeeIsRun(\"狂热\",\"nogoal\") and BeeHolyPower(\"player\") == 3 then BeeRun(\"狂热\",\"nogoal\");return;end\nif BeeIsRun(\"异端裁决\") and BeePlayerBuffTime(\"异端裁决\")<3 and BeeHolyPower(\"player\")==3 then BeeRun(\"异端裁决\");return;end\nif BeeIsRun(\"异端裁决\") and BeePlayerBuffTime(\"异端裁决\")<0 and BeeHolyPower(\"player\")>1 then BeeRun(\"异端裁决\");return;end\nif BeeIsRun(\"异端裁决\") and BeePlayerBuffTime(\"异端裁决\")<0 and BeeHolyPower(\"player\")==1 and (BeePlayerBuffTime(\"战争艺术\")>1 or BeePlayerBuffTime(\"复仇之怒\")>1) then  BeeRun(\"异端裁决\");return;end\nif IsSpellInRange(\"十字军打击\",\"target\")==1 and BeeIsRun(\"神圣风暴\",\"target\") and  BeeHolyPower(\"player\")<3 and IsSpellInRange(\"十字军打击\",\"target\")==1 then BeeRun(\"神圣风暴\");return;end\nif BeeIsRun(\"圣殿骑士的裁决\",\"target\") and BeeHolyPower(\"player\")== 3  and IsSpellInRange(\"圣殿骑士的裁决\",\"target\")==1 then BeeRun(\"圣殿骑士的裁决\");return;end\nif BeePlayerBuffTime(\"神圣意志\")>1  and  BeeIsRun(\"圣殿骑士的裁决\",\"target\")  and IsSpellInRange(\"圣殿骑士的裁决\",\"target\")==1 then BeeRun(\"圣殿骑士的裁决\");return;end    \nif BeeStringFind(\"亡灵,恶魔,龙类,元素生物\",UnitCreatureType('target'))then \n    if BeeIsRun(\"驱邪术\",\"target\")and BeePlayerBuffTime(\"战争艺术\")>1 and IsSpellInRange(\"驱邪术\",\"target\")==1  then BeeRun(\"驱邪术\");return;end   \n    if (BeeUnitHealth(\"target\",\"%\",0)<20 or BeePlayerBuffTime(\"复仇之怒\")>1) and BeeIsRun(\"愤怒之锤\",\"target\") and IsSpellInRange(\"愤怒之锤\",\"target\")==1 then BeeRun(\"愤怒之锤\");return;end\nelse \n    if (BeeUnitHealth(\"target\",\"%\",0)<20 or BeePlayerBuffTime(\"复仇之怒\")>1) and BeeIsRun(\"愤怒之锤\",\"target\")  and IsSpellInRange(\"愤怒之锤\",\"target\")==1 then BeeRun(\"愤怒之锤\");return;end\n    if BeeIsRun(\"驱邪术\",\"target\") and BeePlayerBuffTime(\"战争艺术\")>1 and IsSpellInRange(\"驱邪术\",\"target\")==1  then BeeRun(\"驱邪术\");return;end   \nend\nif BeeIsRun(\"审判\")  and IsSpellInRange(\"审判\",\"target\")==1 then BeeRun(\"审判\");return;end\nif BeeUnitAffectingCombat()  and BeeIsRun(\"神圣愤怒\",\"target\") and IsSpellInRange(\"神圣愤怒\",\"target\")==1 then BeeRun(\"神圣愤怒\");return;end\n--if BeeUnitAffectingCombat(\"player\")  and BeeUnitMana(\"player\",\"%\")>90 and BeeIsRun(\"奉献\") then BeeRun(\"奉献\");return;end\n--蓝低于3000，回蓝\nif BeeUnitAffectingCombat()  and BeeUnitMana(\"player\")<3000 and BeeIsRun(\"神圣恳求\") then BeeRun(\"神圣恳求\");return;end\n\n\n\n",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Ability_Paladin_DivineStorm",
					["Name"] = "惩戒输出（AOE）",["Title"] = "|cfff58cba惩戒输出（AOE）|r",
				}, -- [9]
				{
					["GUID"] = 11,
					["Script"] = "--远古列王守卫开启后叠加10层远古能量，就用魔像之血药水\n\n\nif BeePlayerBuffCount(\"远古能量\")>=10 and BeeIsRun(\"魔像之血药水\") then BeeRun(\"魔像之血药水\");return;end\n\n--远古列王守卫开启后叠加10层后远古能量，使用狂热\nif BeePlayerBuffCount(\"远古能量\")>=10 and BeeIsRun(\"狂热\",\"nogoal\") then BeeRun(\"狂热\",\"nogoal\");return;end\n\n\n--狂热效果存在，使用复仇之怒\nif BeePlayerBuffTime(\"狂热\")>0.1 and BeeIsRun(\"复仇之怒\"\n) then BeeRun(\"复仇之怒\");return;end\n\n--异端裁决可用、异端裁决BUFF低于3秒、有3道圣能时，执行异端裁决；\nif BeeIsRun(\"异端裁决\") and BeePlayerBuffTime(\"异端裁决\")<3 and BeeHolyPower(\"player\")==3 then BeeRun(\"异端裁决\");return;end\n\n\n--异端裁决可用、无异端裁决BUFF、有2道以上圣能时，执行异端裁决；\nif BeeIsRun(\"异端裁决\") and BeePlayerBuffTime(\"异端裁决\")<0 and BeeHolyPower(\"player\")>1 then BeeRun(\"异端裁决\");return;end\n\n\n\n--异端裁决可用、无异端裁决BUFF、有1道圣能、有战争艺术BUFF、或者有复仇之怒BUFF时，执行异端裁决；\nif BeeIsRun(\"异端裁决\") and BeePlayerBuffTime(\"异端裁决\")<0 and BeeHolyPower(\"player\")==1 and (BeePlayerBuffTime(\"战争艺术\")>1 or BeePlayerBuffTime(\"复仇之怒\")>1) then  BeeRun(\"异端裁决\");return;end\n\n\n--异端裁决可用、异端裁决BUFF低于3秒、不足2道以上圣能、有神圣意志时，执行异端裁决；\nif BeeIsRun(\"异端裁决\") and BeePlayerBuffTime(\"异端裁决\")<3 and BeeHolyPower(\"player\")<2 and BeePlayerBuffTime(\"神圣意志\")>1 then  BeeRun(\"异端裁决\");return;end\n\n\n\n--十字军打击可用、少于3道圣能、在十字军打击技能范围内，执行十字军打击；\nif BeeIsRun(\"十字军打击\",\"target\") and  BeeHolyPower(\"player\")<3 and IsSpellInRange(\"十字军打击\",\"target\")==1 then BeeRun(\"/startattack\\n/cast 十字军打击\");return;end\n\n\n\n--圣殿骑士的裁决可用、有3道圣能、在圣殿骑士的裁决技能范围内，执行圣殿骑士的裁决；\nif BeeIsRun(\"圣殿骑士的裁决\",\"target\") and BeeHolyPower(\"player\")== 3 and IsSpellInRange(\"圣殿骑士的裁决\",\"target\")==1 then BeeRun(\"圣殿骑士的裁决\");return;end\n\n\n\n--有神圣意志BUFF，圣殿骑士的裁决可用、在圣殿骑士的裁决技能范围内，执行圣殿骑士的裁决；\nif BeePlayerBuffTime(\"神圣意志\")>1  and  BeeIsRun(\"圣殿骑士的裁决\",\"target\") and IsSpellInRange(\"圣殿骑士的裁决\",\"target\")==1 then BeeRun(\"圣殿骑士的裁决\");return;end\n\n\n\n--（配合2件T13属性）无狂热BUFF，审判可用、在审判技能范围内，执行审判\nif BeePlayerBuffTime(\"狂热\")<1 and BeeIsRun(\"审判\") and IsSpellInRange(\"审判\",\"target\")==1 then BeeRun(\"审判\");return;end\n\n--有战争艺术、驱邪术可用、在驱邪术技能范围内，执行驱邪术；\n\nif BeeIsRun(\"驱邪术\",\"target\") and BeePlayerBuffTime(\"战争艺术\")>1 then BeeRun(\"驱邪术\");return;end   \n\n--目标是亡灵,恶魔,龙类,元素生物，有战争艺术BUFF、驱邪术可用、在驱邪术技能范围内，执行驱邪术；\nif BeeStringFind(\"亡灵,恶魔,龙类,元素生物\",UnitCreatureType('target'))then if BeeIsRun(\"驱邪术\",\"target\")and BeePlayerBuffTime(\"战争艺术\")>1 and IsSpellInRange(\"驱邪术\",\"target\")==1 then BeeRun(\"驱邪术\");return;end\n    \n    --目标生命值低于20%、或者有复仇之怒BUFF、愤怒之锤可用、在愤怒之锤技能范围内，执行愤怒之锤；\n    if (BeeUnitHealth(\"target\",\"%\",0)<20 or BeePlayerBuffTime(\"复仇之怒\")>1) and BeeIsRun(\"愤怒之锤\",\"target\") then BeeRun(\"愤怒之锤\");return;end\nelse \n    if (BeeUnitHealth(\"target\",\"%\",0)<20 or BeePlayerBuffTime(\"复仇之怒\")>1) and BeeIsRun(\"愤怒之锤\",\"target\") then BeeRun(\"愤怒之锤\");return;end\n    end\n    --无狂热BUFF，十字军打击冷却时间大于0.8秒、审判冷却时间大于0.8秒、在战斗状态内，执行神圣愤怒；\n    if BeePlayerBuffTime(\"狂热\")<1 and BeeSpellCD(\"十字军打击\")>0.8 and BeeSpellCD(\"审判\")>0.8 and BeeUnitAffectingCombat(\"player\") and BeeIsRun(\"神圣愤怒\",\"target\") then BeeRun(\"神圣愤怒\");return;end\n\n\n--无狂热BUFF，十字军打击冷却时间大于1.2秒、审判冷却时间大于1.2秒、在战斗状态内、法力值大于90%，执行奉献；\nif BeePlayerBuffTime(\"狂热\")<1 and BeeUnitAffectingCombat(\"player\") and BeeUnitMana(\"player\",\"%\")>90 and BeeSpellCD(\"十字军打击\")>0.8 and BeeSpellCD(\"审判\")>1.1  and BeeIsRun(\"奉献\") then BeeRun(\"奉献\");return;end\n\n\n--战斗状态内、蓝低于15000，执行神圣恳求\n\nif BeeUnitAffectingCombat() and BeeUnitMana(\"player\")<15000 and BeeIsRun(\"神圣恳求\") then BeeRun(\"神圣恳求\");return;end\n",
					["CD"] = 0.05,
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Holy_CrusaderStrike",
					["Name"] = "惩戒输出（单体）",["Title"] = "|cfff58cba惩戒输出（单体）|r",
				}, -- [10]
			},
		},
		{
		    ["Name"] = "防骑基础包",["Title"] = "|cfff58cba防骑基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "开虔诚，上真理，补王者",["Title"] = "|cfff58cba开虔诚，上真理，补王者|r",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\Spell_Holy_EmpowerChampion",
					["Script"] = "--非骑乘状态自动开惩戒光环\nif not BeeStringFind(\"虔诚光环\",BeeUnitBuffList(\"player\")) then\n    BeeRun(\"虔诚光环\",\"player\");\n    return;\nend\nif not BeeStringFind(\"正义之怒\",BeeUnitBuffList(\"player\")) then\n    BeeRun(\"正义之怒\",\"player\");\n    return;\nend\n--没任何圣印的时候自动补真理圣印\nif not (BeeStringFind(\"真理圣印\",BeeUnitBuffList(\"player\")) or BeeStringFind(\"洞察圣印\",BeeUnitBuffList(\"player\")) or BeeStringFind(\"正义圣印\",BeeUnitBuffList(\"player\")) or \n    BeeStringFind(\"公正圣印\",BeeUnitBuffList(\"player\"))) then\n    BeeRun(\"真理圣印\",\"player\");\n    BeeUnitCastSpellDelay(\"真理圣印\",2);\nend\n\n--如果没有王者祝福或力量祝福，自动补王者祝福\nif BeeIsRun(\"王者祝福\",\"player\") and (BeePlayerBuffTime(\"王者祝福\") <0 and  BeePlayerBuffTime(\"力量祝福\")<0) then \n    BeeRun(\"王者祝福\",\"player\");\n    BeeUnitCastSpellDelay(\"王者祝福\",2);\n    return;\nend",
				}, -- [1]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "保命",["Title"] = "|cfff58cba保命|r",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\Spell_Holy_GuardianSpirit",
					["Script"] = "--判断自己血量低并且在战斗中开圣疗\nif BeeIsRun(\"圣疗术\",\"player\") and BeeUnitHealth(\"player\",\"%\")<20  and BeePlayerDeBuffTime(\"自律\")<0  then\n    BeeRun(\"圣疗术\",\"player\");\n    BeeUnitCastSpellDelay(\"圣疗术\",2);\n    return;\nend\n--血量低于10%能开防御者\nif BeeIsRun(\"炽热防御者\",\"player\") and BeeUnitHealth(\"player\",\"%\")<12  and BeePlayerDeBuffTime(\"自律\")<0  then\n    BeeRun(\"炽热防御者\",\"player\");\n    BeeUnitCastSpellDelay(\"炽热防御者\",2);\n    return;\nend\n--60开圣佑术\nif BeeIsRun(\"圣佑术\",\"player\") and BeeUnitHealth(\"player\",\"%\")<60  then\n    BeeRun(\"圣佑术\",\"player\");\n    BeeUnitCastSpellDelay(\"圣佑术\",2);\n    return;\nend\n--40开守卫\nif BeeIsRun(\"远古列王守卫\",\"player\") and BeeSpellCD(\"远古列王守卫\")<=0 and  BeeUnitHealth(\"player\",\"%\")<40  then\n    BeeRun(\"远古列王守卫\",\"player\");\n    BeeUnitCastSpellDelay(\"远古列王守卫\",2);\n    return;\nend",
				}, -- [2]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "打断施法",["Title"] = "|cfff58cba打断施法|r",
					["GUID"] = 4,
					["Icon"] = "Interface\\Icons\\Spell_Holy_EyeforanEye",
					["Script"] = "if BeeUnitCastSpellName()  and BeeIsRun(\"责难\") then\n    BeeRun(\"责难\");\n    return;\nend\n\n\n",
				}, -- [3]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "嘲讽",["Title"] = "|cfff58cba嘲讽|r",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Spell_Holy_BlessingOfStrength",
					["Script"] = "if not BeeTargetTargetIsPlayer() and BeeIsRun(\"清算之手\") and BeeUnitName(\"targettarget\") then BeeRun(\"清算之手\"); \n    return; \nelseif not BeeTargetTargetIsPlayer() and BeeSpellCD(\"清算之手\")>0  and BeeIsRun(\"正义防御\") and BeeUnitName(\"target\") then BeeRun(\"正义防御\"); \nend",
				}, -- [4]
				{
					["GUID"] = 1,
					["Script"] = "-- 攻击最近的目标\nif not UnitIsDead(\"player\") and BeeUnitAffectingCombat(\"player\") then\n    if BeeAttack(0,0) then\n        return;\n    end\nend\nif BeeUnitHealth(\"target\",\"%\")<20 and BeeIsRun(\"愤怒之锤\") then\n    BeeRun(\"愤怒之锤\")\n    return;    \nend    \nif BeeHolyPower()==3 and BeeIsRun(\"正义盾击\") then\n    BeeRun(\"正义盾击\")\n    return;    \nend    \nif BeePlayerBuffTime(\"大十字军\")>=0 and BeeIsRun(\"复仇者之盾\") then\n    BeeRun(\"复仇者之盾\")\n    return;    \nend    \nif BeeIsRun(\"十字军打击\") then\n    BeeRun(\"十字军打击\")\n    return;    \nend    \nif BeeIsRun(\"复仇者之盾\") then\n    BeeRun(\"复仇者之盾\")\n    return;    \nend    \nif BeeIsRun(\"审判\") then\n    BeeRun(\"审判\")\n    return;    \nend    \nif BeeUnitAffectingCombat() and BeeRange(\"target\")<8 and BeeIsRun(\"奉献\") then\n    BeeRun(\"奉献\")\n    return;    \nend    \nif BeeUnitAffectingCombat() and BeeRange(\"target\")<8 and BeeIsRun(\"神圣愤怒\") then\n    BeeRun(\"神圣愤怒\")\n    return;    \nend    ",
					["Name"] = "单拉",["Title"] = "|cfff58cba单拉|r",
					["Enabled"] = true,
					["Icon"] = "Interface\\Icons\\Spell_Holy_FistOfJustice",
					["Description"] = "當滿足條件時自動施放",
				}, -- [5]
				{
					["GUID"] = 2,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "群拉",["Title"] = "|cfff58cba群拉|r",
					["Icon"] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofKings",
					["Script"] = "-- 攻击最近的目标\nif not UnitIsDead(\"player\") and BeeUnitAffectingCombat(\"player\") then\n    if BeeAttack(0,0) then\n        return;\n    end\nend\nif BeeHolyPower()==3 and BeeIsRun(\"正义盾击\") then\n    BeeRun(\"正义盾击\")\n    return;    \nend    \nif BeePlayerBuffTime(\"大十字军\")>=0 and BeeIsRun(\"复仇者之盾\") then\n    BeeRun(\"复仇者之盾\")\n    return;    \nend    \nif BeeIsRun(\"正义之锤\") then\n    BeeRun(\"正义之锤\")\n    return;    \nend    \nif BeeIsRun(\"复仇者之盾\") then\n    BeeRun(\"复仇者之盾\")\n    return;    \nend    \nif BeeUnitAffectingCombat() and BeeRange(\"target\")<8 and BeeIsRun(\"奉献\") then\n    BeeRun(\"奉献\")\n    return;    \nend    \nif BeeUnitAffectingCombat() and BeeRange(\"target\")<8 and BeeIsRun(\"神圣愤怒\") then\n    BeeRun(\"神圣愤怒\")\n    return;    \nend    \nif BeeIsRun(\"审判\") then\n    BeeRun(\"审判\")\n    return;    \nend    ",
				}, -- [6]
			},
		},
	},
}

end