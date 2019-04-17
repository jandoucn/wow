wowam.ClassBeeScript.DRUID=function()

LazyScript=LazyScript or {};
LazyScript["DRUID"] = {
	["List"] = {
		{
			["Name"] = "奶德基础包",["Title"] = "|cffff7d0a奶德基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Name"] = "骑乘旅行状态不施法",["Title"] = "|cffff7d0a骑乘旅行状态不施法|r",
					["Title"] = "|cffff7d0a骑乘旅行状态不施法|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Druid_TravelForm",
					["Script"] = "--骑乘\\游泳\\旅行状态不施法\nif IsMounted(\"player\")==1 or BeeGetShapeshiftFormInfo(2) or BeeGetShapeshiftFormInfo(4) or BeeGetShapeshiftFormInfo(6) or BeeUnitCastSpellName(\"player\")==\"宁静\" then return  end\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！\n",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Script"] = "if BeeUnitMana(\"player\",\"%\",0)<95 and BeePlayerBuffTime(\"喝水\")>1\nthen \n    return;\nend",
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "安静喝水",["Title"] = "|cffff7d0a安静喝水|r",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\INV_Drink_Waterskin_07",
					["Title"] = "|cffff7d0a安静喝水|r",
				}, -- [2]
				{
					["Enabled"] = 1,
					["Script"] = "--蓝少激活回蓝部分\nif BeeUnitMana(\"player\",\"%\",0)<70 and BeeIsRun(\"激活\",\"player\") and BeeUnitAffectingCombat() then\n    BeeRun(\"激活\",\"player\");\n    return;\nend",
					["Name"] = "自动激活（慎用）",["Title"] = "|cffff7d0a自动激活（慎用）|r",
					["Title"] = "|cffff7d0a自动激活（慎用）|r",
					["GUID"] = 2,
					["Icon"] = "Interface\\Icons\\Spell_Nature_Lightning",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["GUID"] = 3,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动补BUFF",["Title"] = "|cffff7d0a自动补BUFF|r",
					["Title"] = "|cffff7d0a自动补BUFF|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Nature_Regeneration",
					["Script"] = "--自动补BUFF\nif BeeIsRun(\"野性印记\",\"player\") and BeePlayerBuffTime(\"野性印记\")<60 then BeeRun(\"野性印记\",\"player\");return;end\nif BeeIsRun(\"增强合剂\") and BeePlayerBuffTime(\"增强智力\")<60 then BeeRun(\"增强合剂\");return;end\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
				}, -- [4]
				{
					["GUID"] = 6,
					["Script"] = "--不打断宁静施法\nlocal n,NZ = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"宁静\",unit)',\"BeeUnitHealth(unit,'%')<40 and not UnitIsDeadOrGhost(unit)\",grouptype)\nif n >4 and BeeIsRun(\"宁静\") \nthen \n    BeeRun(\"宁静\");\n    return;\nend",
					["Name"] = "可选宁静",["Title"] = "|cffff7d0a可选宁静|r",
					["Title"] = "|cffff7d0a可选宁静|r",
					["Icon"] = "Interface\\Icons\\Spell_Nature_Tranquility",
					["Description"] = "當滿足條件時自動施放",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "独立迅捷（可选）",["Title"] = "|cffff7d0a独立迅捷（可选）|r",
					["Title"] = "|cffff7d0a独立迅捷（可选）|r",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\INV_Relics_IdolofRejuvenation",
					["Script"] = "--第一排肯定是团队框体\ngrouptype=\"\" \nif GetNumGroupMembers()>0 \nthen \n    grouptype=\"raid\" \nelse \n    grouptype=\"party\" \nend\n\n\n\n--以下为小迅捷部分\nlocal XJ = BeeGroupMinScript('BeeSpellCD(\"迅捷治愈\")<=0  and BeeUnitHealth(unit,\"%\")>95 and not UnitIsDeadOrGhost(unit) and BeeIsRun(\"迅捷治愈\",unit,1)',\"BeeUnitHealth(unit,'%')\",grouptype)\nif XJ and  BeeUnitBuff(\"回春术\",XJ)>0\nthen \n    BeeRun(\"迅捷治愈\",XJ);\n    return;\nend\nif XJ and  BeeUnitBuff(\"愈合\",XJ)>0\nthen \n    BeeRun(\"迅捷治愈\",XJ);\n    return;\nend\n",
				}, -- [6]
				{
					["GUID"] = 13,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--第一排肯定是团队框体\ngrouptype=\"\" \nif GetNumGroupMembers()>0 \nthen \n    grouptype=\"raid\" \nelse \n    grouptype=\"party\" \nend\n\n--以下为小迅捷部分\nif BeeSpellCD(\"迅捷治愈\")<=8 and  BeeUnitBuff(\"回春术\",\"player\")<0\nthen \n    BeeRun(\"/cast [target=player]回春术\");\n    return;\nend\n\nlocal XJ = BeeGroupMinScript('BeeSpellCD(\"迅捷治愈\")<=0   and not UnitIsDeadOrGhost(unit) and BeeIsRun(\"迅捷治愈\",unit)',\"BeeUnitHealth(unit,'%')\",grouptype)\nif XJ and  BeeUnitBuff(\"回春术\",XJ)>0\nthen \n    BeeRun(\"/stopcasting\\n/cast [target=player]迅捷治愈\");\n    return;\nend\nif XJ and  BeeUnitBuff(\"愈合\",XJ)>0\nthen \n    BeeRun(\"/stopcasting\\n/cast [target=player]迅捷治愈\");\n    return;\nend\n",
					["Name"] = "自身放圈",["Title"] = "|cffff7d0a自身放圈|r",
					["Icon"] = "Interface\\Icons\\Spell_Nature_ResistNature",
					["Title"] = "|cffff7d0a自身放圈|r",
				}, -- [7]
				{
					["GUID"] = 4,
					["Script"] = "--自动驱散\ngrouptype=\"\";if GetNumGroupMembers()>0 then  grouptype=\"raid\" else  grouptype=\"party\" end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"净化腐蚀\",unit)',\"BeeUnitBuffInfo(unit,2,'Magic,Curse,Poison',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>0 and BeeIsRun(\"净化腐蚀\",qusan) then BeeRun(\"净化腐蚀\",qusan);return;end\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
					["Name"] = "自动驱散（慎用）",["Title"] = "|cffff7d0a自动驱散（慎用）|r",
					["Title"] = "|cffff7d0a自动驱散（慎用）|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Nature_NullifyPoison_02",
					["Description"] = "當滿足條件時自動施放",
				}, -- [8]
				{
					["GUID"] = 7,
					["Name"] = "自动开饰品（慎用）",["Title"] = "|cffff7d0a自动开饰品（慎用）|r",
					["Title"] = "|cffff7d0a自动开饰品（慎用）|r",
					["Script"] = "--自动开饰品\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Nature_NaturesBlessing",
					["Description"] = "當滿足條件時自動施放",
				}, -- [9]
				{
					["GUID"] = 8,
					["Name"] = "团补单补全攻略",["Title"] = "|cffff7d0a团补单补全攻略|r",
					["Title"] = "|cffff7d0a团补单补全攻略|r",
					["Script"] = "--第一排肯定是团队框体\ngrouptype=\"\" \nif GetNumGroupMembers()>0 \nthen \n    grouptype=\"raid\" \nelse \n    grouptype=\"party\" \nend\n\nif BeeUnitCastSpellName(\"player\")==\"宁静\" \nthen \n    return;\nend\n--优先保命,挂了底下的一切都是空话\nif BeeUnitHealth(\"player\",\"%\")<60 and BeeIsRun(\"树皮术\") \nthen \n    BeeRun(\"树皮术\");\n    return;\nend\nif BeeUnitHealth(\"player\",\"%\")<45 and BeeIsRun(\"治疗石\") \nthen \n    BeeRun(\"治疗石\");\n    return;\nend\nif BeeUnitHealth(\"player\",\"%\")<20 and BeeIsRun(\"奇效治疗药水\") \nthen \n    BeeRun(\"奇效治疗药水\");\n    return;\nend\nif BeeUnitHealth(\"player\",\"%\")<90 and BeeIsRun(\"生命之血\") \nthen BeeRun(\"生命之血\");\n    return;\nend\nif BeeUnitAffectingCombat()and BeeIsRun(\"自然之握\") \nthen BeeRun(\"自然之握\");\n    return;\nend\nif BeeIsRun(\"野性成长\",\"player\") and BeeUnitHealth(\"player\",\"%\")<60 \nthen \n    BeeRun(\"野性成长\",\"player\");\n    return;\nend\nif BeeIsRun(\"回春术\",\"player\") and BeeUnitBuff(\"回春术\",\"player\")<0 and BeeUnitHealth(\"player\",\"%\")<10 \nthen \n    BeeRun(\"回春术\",\"player\");\n    return;\nend\n\n--以下为大迅捷部分\nlocal DXJ = BeeGroupMinScript('BeeUnitAffectingCombat(unit) and BeeRange(unit)<=40  and BeeUnitHealth(unit,\"%\")<30 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif DXJ and BeeSpellCD(\"自然迅捷\")<=0 \nthen \n    BeeRun(\"/stopcasting\\n/cast 自然迅捷\\n/target \"..DXJ..\"\\n/cast 治疗之触\");\n    return;\nend\n\n--以下为野性成长治疗部分\nlocal n,YXCZ = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"野性成长\",unit)',\"BeeUnitHealth(unit,'%')<90 and not UnitIsDeadOrGhost(unit)\",grouptype)\nif n >=3 and BeeIsRun(\"野性成长\",YXCZ) \nthen \n    BeeRun(\"野性成长\",YXCZ);\n    return;\nend\n\n\n\n--以下为团队 回春 部分\n\n--25人团队本，回春>5个，节蓝滋养\nlocal m,HCS = BeeGroupCountScript('BeeRange(unit)<=40  and and BeeUnitBuff(\"回春术\",unit)>0',\" not UnitIsDeadOrGhost(unit)\",grouptype)\nlocal ZRKK = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"滋养\",unit) and BeeUnitHealth(unit,\"%\")<95 and UnitCanAssist(\"player\",unit) and BeeUnitBuff(\"自然的慷慨\",\"player\")>0 and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\n\nif ZRKK and m>=5 and BeeIsRun(\"滋养\",ZRKK) \nthen \n    BeeRun(\"滋养\",ZRKK);\n    \n    return;\n    \nend\n\nlocal HC = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"回春术\",unit) and BeeUnitHealth(unit,\"%\")<80 and BeeUnitBuff(\"回春术\",unit)<1 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif HC and BeeIsRun(\"回春术\",HC) \nthen \n    BeeRun(\"回春术\",HC);\n    return;\nend\n\n--以下为保持T回春术部分\nif BeeIsRun(\"生命绽放\",\"focus\") and (BeeUnitBuffCount(\"生命绽放\",\"focus\",0)<1  or BeeUnitBuff(\"生命绽放\",\"focus\",0,0)<=3 ) \nthen \n    BeeRun(\"生命绽放\",\"focus\");\n    return;\nend\nif BeeUnitHealth(\"focus\",\"%\",0)<98 and BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"回春术\",\"focus\") and BeeUnitAffectingCombat(Unit) and BeeUnitBuff(\"回春术\",\"focus\")<0 \nthen \n    BeeRun(\"回春术\",\"focus\");\n    return;\nend\nif BeeIsRun(\"愈合\",\"focus\") and BeePlayerBuffTime(\"节能施法\")>1 and BeeUnitHealth(\"focus\",\"%\",0)<90 \nthen \n    BeeRun(\"愈合\",\"focus\");\n    BeeUnitCastSpellDelay(\"愈合\",0.8);\n    return;\nend\nif BeeIsRun(\"愈合\",\"focus\") and BeeUnitHealth(\"focus\",\"%\",0)<45 and BeeUnitBuff(\"愈合\",\"focus\")<1 \nthen \n    BeeRun(\"愈合\",\"focus\");\n    BeeUnitCastSpellDelay(\"愈合\",0.8);\n    return;\nend\nif BeeIsRun(\"治疗之触\",\"focus\") and BeeUnitHealth(\"focus\",nil,1)>65000  and BeePlayerBuffTime(\"节能施法\")>1\nthen \n    BeeRun(\"治疗之触\",\"focus\");\n    \n    return;\nend\n\n\n--以下为团队 愈合 部分\nlocal JNSF = BeeGroupMinScript('BeePlayerBuffTime(\"节能施法\")>1 and BeeIsRun(\"愈合\",unit) and  BeeUnitHealth(unit,\"%\")<95  and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif JNSF and BeeIsRun(\"愈合\",JNSF) \nthen \n    BeeRun(\"愈合\",JNSF);\n    \n    return;\nend\n\n\n\n\nlocal YH = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"愈合\",unit)  and BeeUnitHealth(unit,\"%\")<25 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif YH and BeeIsRun(\"愈合\",YH) \nthen \n    BeeRun(\"愈合\",YH);\n    BeeUnitCastSpellDelay(\"愈合\",2);\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Nature_ProtectionformNature",
					["Description"] = "當滿足條件時自動施放",
				}, -- [10]
				{
					["GUID"] = 10,
					["Script"] = "local grouptype=\"\"\n\nif GetNumGroupMembers()>0 then\n    \n    grouptype=\"raid\"\n    \nelse\n    \n    grouptype=\"party\"\n    \nend\n--技能阀值部分\nlocal ZLZC = BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>55000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\n\nlocal ZY = BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>15000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\n\nlocal YH = BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>25000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\n\nlocal q,NZLZC = BeeGroupCountScript('BeeIsRun(\"治疗之触\",unit)',\"BeeRange(unit)<=40 and BeeUnitHealth(unit,nil,1)>40000 and not UnitIsDeadOrGhost(unit)\",grouptype)\nlocal p,NZY = BeeGroupCountScript('BeeUnitBuff(\"回春术\",unit)>0',\"BeeRange(unit)<=40 and BeeUnitHealth(unit,nil,1)>10000 and not UnitIsDeadOrGhost(unit)\",grouptype)\n\n\n\n--全团治疗\n\n\n\n\n\nif YH and BeeSpellCD(\"节能施法\")>0 and BeeIsRun(\"愈合\",YH) \nthen \n    BeeRun(\"愈合\",YH)\n    return\nend\n\n\nif ZLZC and q<=5 and BeeIsRun(\"治疗之触\",ZLZC) \nthen \n    BeeRun(\"治疗之触\",ZLZC)\n    return\nend\n\n\n\n--[[\n\n--以下为团队 滋养 部分\nlocal ZY = BeeGroupMinScript('BeeIsRun(\"滋养\",unit) and BeeUnitHealth(unit,\"%\")<75 and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit,'%')\",grouptype)\nif ZY  and BeeStringFind(\"回春术,愈合,野性成长,生命绽放\",BeeUnitBuffList(zbs)) \nthen\n    BeeRun(\"滋养\",ZY);\n    return;\nend\n\n]]--\n\nif ZY and p>=3 and p<=6 and BeeIsRun(\"滋养\",ZY) \nthen \n    BeeRun(\"滋养\",ZY)\n    return\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！\n",
					["Name"] = "独立 触 滋养",["Title"] = "|cffff7d0a独立 触 滋养|r",
					["Title"] = "|cffff7d0a独立 触 滋养|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Druid_Nourish",
					["Description"] = "當滿足條件時自動施放",
				}, -- [11]
    		},
		},
		{
			["Name"] = "猫德基础包",["Title"] = "|cffff7d0a猫德基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Name"] = "骑乘状态",["Title"] = "|cffff7d0a骑乘状态|r",
					["Script"] = "--CTM 4.2 猫德输出脚本 2011/11/5 by ATM\n--骑乘\\游泳\\旅行状态不施法\nif IsMounted(\"player\")==1 or BeeGetShapeshiftFormInfo(2) or BeeGetShapeshiftFormInfo(4) or BeeGetShapeshiftFormInfo(5) then return end",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Description"] = "當滿足條件時自動施放",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
					["Name"] = "优先技能",["Title"] = "|cffff7d0a优先技能|r",
					["GUID"] = 2,
					["Icon"] = "Interface\\Icons\\Spell_Holy_HopeAndGrace",
					["Description"] = "當滿足條件時自動施放",
				}, -- [2]
				{
					["GUID"] = 3,
					["Name"] = "优先保命",["Title"] = "|cffff7d0a优先保命|r",
					["Script"] = "--优先保命\nif BeeUnitHealth(\"player\",\"%\")<45 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"奇效治疗药水\") then BeeRun(\"奇效治疗药水\");return;end\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"树皮术\") then BeeRun(\"树皮术\");return;end\nif BeeUnitHealth(\"player\",\"%\")<90 and BeeIsRun(\"生命之血\") then BeeRun(\"生命之血\");return;end\nif BeeUnitAffectingCombat()and BeeIsRun(\"自然之握\") then BeeRun(\"自然之握\");return;end\n\n\n\n",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Frost_Frost",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["Enabled"] = 1,
					["Script"] = "--自动补BUFF\nif BeeIsRun(\"野性印记\",\"player\") and BeePlayerBuffTime(\"野性印记\")<60 then BeeRun(\"野性印记\",\"player\");return;end\nif BeeIsRun(\"增强合剂\") and BeePlayerBuffTime(\"增强敏捷\")<60 then BeeRun(\"增强合剂\");return;end\n",
					["Name"] = "自动补BUFF",["Title"] = "|cffff7d0a自动补BUFF|r",
					["GUID"] = 4,
					["Icon"] = "Interface\\Icons\\Spell_Nature_Regeneration",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
				{
					["GUID"] = 5,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动协助T",["Title"] = "|cffff7d0a自动协助T|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_HolyNova",
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat()and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n\n--非战斗状态禁止攻击,可攻击木桩\nlocal KGJ=\"哈卡之链,训练假人,团队副本训练假人\"\nif not BeeStringFind(KGJ,UnitName(\"target\")) then\n    if not BeeUnitAffectingCombat(\"target\") or not BeeUnitAffectingCombat() then return;end\nend\n\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\"))  or BeeUnitCastSpellName(\"player\")==\"宁静\"   then return;end\n",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Name"] = "自动打断",["Title"] = "|cffff7d0a自动打断|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Ability_Druid_SkinTeeth",
					["Script"] = "--猫德打断施法\nlocal spelljd, _, _, _, _, _, _, ddjd = UnitCastingInfo(\"focustarget\")\nlocal spellzj, _, _, _, _, _, _, ddzj = UnitCastingInfo(\"target\")\n--打断自己的目标\nif BeeUnitAffectingCombat() and ddzj == 0 and BeeIsRun(\"迎头痛击\\(猎豹形态\\)\",\"target\") then BeeRun(\"迎头痛击\\(猎豹形态\\)\",\"target\");return;end\nif BeeUnitAffectingCombat() and ddjd == 0 and BeeIsRun(\"迎头痛击\\(猎豹形态\\)\",\"focustarget\") then BeeRun(\"迎头痛击\\(猎豹形态\\)\",\"focustarget\");return;end",
				}, -- [6]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--自动开饰品\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
					["GUID"] = 7,
					["Icon"] = "Interface\\Icons\\Spell_Holy_LastingDefense",
					["Name"] = "自动开饰品",["Title"] = "|cffff7d0a自动开饰品|r",
				}, -- [7]
				{
					["GUID"] = 8,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--输出\n--如果是潜行状态，在毁灭距离内，能打毁灭就打毁灭,怪没进入战斗（起手）\nif IsStealthed() and  IsSpellInRange(\"毁灭\",\"target\")==1 and BeeIsRun(\"毁灭\",\"target\") then BeeRun(\"毁灭\",\"target\");return;end\n--如果在潜行状态，距离太远，能冲锋就冲锋\nif IsStealthed() and BeeUnitMana()>10 and IsSpellInRange(\"野性冲锋\\(猎豹形态\\)\",\"target\")==1 and BeeIsRun(\"野性冲锋\\(猎豹形态\\)\") then BeeRun(\"野性冲锋\\(猎豹形态\\)\");return;end\n--有天赋支持的时候打毁灭\nif BeePlayerBuffTime(\"强化野性冲锋\")>0 and IsSpellInRange(\"毁灭\",\"target\")==1 and BeeIsRun(\"毁灭\",\"target\") then BeeRun(\"毁灭\",\"target\");return;end\n--开怪后，怪进入战斗，上精灵之火\nif not IsStealthed() and BeeIsRun(\"精灵之火（野性）\") and IsSpellInRange(\"精灵之火（野性）\",\"target\")==1 and BeeTargetDeBuffTime(\"精灵之火\")<1 and BeeUnitAffectingCombat(\"target\") then BeeRun(\"精灵之火（野性）\");return;end\nif BeeUnitAffectingCombat() then BeeAttack();end\n--简单输出循环\n--1. 保持裂伤\nif BeeUnitAffectingCombat() and BeeIsRun(\"裂伤\\(猎豹形态\\)\") and BeeUnitBuff(\"裂伤\",\"target\",2)<3 then BeeRun(\"裂伤\\(猎豹形态\\)\");return;end\n--2. CD到了就用虎怒\nif BeeUnitAffectingCombat() and BeeIsRun(\"猛虎之怒\") then BeeRun(\"猛虎之怒\",\"nogoal\");return;end\n--3. CD到了就开狂暴\nif BeeUnitAffectingCombat() and BeeIsRun(\"狂暴\") then BeeRun(\"狂暴\",\"nogoal\");return;end\n--4. 保持5星割裂\nif BeeUnitAffectingCombat() and BeeIsRun(\"割裂\")  and IsSpellInRange(\"割裂\",\"target\")==1 and BeeGetComboPoints()==5 then  BeeRun(\"割裂\");return;end\n--5. 保持斜掠\nif BeeUnitAffectingCombat() and BeeIsRun(\"斜掠\") and  IsSpellInRange(\"斜掠\",\"target\")==1 and BeeTargetDeBuffTime(\"斜掠\")<3 then BeeRun(\"斜掠\");return;end\n--6. 保持凶蛮咆哮\nif BeeUnitAffectingCombat() and BeeIsRun(\"野蛮咆哮\") and BeePlayerBuffTime(\"野蛮咆哮\")<3 then BeeRun(\"野蛮咆哮\",\"nogoal\");return;end\n--7. 正面用裂伤，背面用撕碎以获取更多的连击点\nif BeeUnitAffectingCombat() and BeeIsRun(\"裂伤\\(猎豹形态\\)\") and IsSpellInRange(\"裂伤\\(猎豹形态\\)\",\"target\")==1 then BeeRun(\"裂伤\\(猎豹形态\\)\");return;end",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Druid_PrimalAgression",
					["Name"] = "简单循环（正面）",["Title"] = "|cffff7d0a简单循环（正面）|r",
				}, -- [8]
				{
					["GUID"] = 9,
					["Name"] = "简单循环（背面）",["Title"] = "|cffff7d0a简单循环（背面）|r",
					["Script"] = "--输出\n--如果是潜行状态，在毁灭距离内，能打毁灭就打毁灭,怪没进入战斗（起手）\nif IsStealthed() and  IsSpellInRange(\"毁灭\",\"target\")==1 and BeeIsRun(\"毁灭\",\"target\") then BeeRun(\"毁灭\",\"target\");return;end\n--如果在潜行状态，距离太远，能冲锋就冲锋\nif IsStealthed() and BeeUnitMana()>10 and IsSpellInRange(\"野性冲锋\\(猎豹形态\\)\",\"target\")==1 and BeeIsRun(\"野性冲锋\\(猎豹形态\\)\") then BeeRun(\"野性冲锋\\(猎豹形态\\)\");return;end\n--有天赋支持的时候打毁灭\nif BeePlayerBuffTime(\"强化野性冲锋\")>0 and IsSpellInRange(\"毁灭\",\"target\")==1 and BeeIsRun(\"毁灭\",\"target\") then BeeRun(\"毁灭\",\"target\");return;end\n--开怪后，怪进入战斗，上精灵之火\nif not IsStealthed() and BeeIsRun(\"精灵之火（野性）\") and IsSpellInRange(\"精灵之火（野性）\",\"target\")==1 and BeeTargetDeBuffTime(\"精灵之火\")<1 and BeeUnitAffectingCombat(\"target\") then BeeRun(\"精灵之火（野性）\");return;end\nif BeeUnitAffectingCombat() then BeeAttack();end\n--简单输出循环\n--1. 保持裂伤\nif BeeUnitAffectingCombat() and BeeIsRun(\"裂伤\\(猎豹形态\\)\") and BeeUnitBuff(\"裂伤\",\"target\",2)<3 then BeeRun(\"裂伤\\(猎豹形态\\)\");return;end\n--2. CD到了就用虎怒\nif BeeUnitAffectingCombat() and BeeIsRun(\"猛虎之怒\") then BeeRun(\"猛虎之怒\",\"nogoal\");return;end\n--3. CD到了就开狂暴\nif BeeUnitAffectingCombat() and BeeIsRun(\"狂暴\") then BeeRun(\"狂暴\",\"nogoal\");return;end\n--4. 保持5星割裂\nif BeeUnitAffectingCombat() and BeeIsRun(\"割裂\")  and IsSpellInRange(\"割裂\",\"target\")==1 and BeeGetComboPoints()==5 then  BeeRun(\"割裂\");return;end\n--5. 保持斜掠\nif BeeUnitAffectingCombat() and BeeIsRun(\"斜掠\") and  IsSpellInRange(\"斜掠\",\"target\")==1 and BeeTargetDeBuffTime(\"斜掠\")<3 then BeeRun(\"斜掠\");return;end\n--6. 保持凶蛮咆哮\nif BeeUnitAffectingCombat() and BeeIsRun(\"野蛮咆哮\") and BeePlayerBuffTime(\"野蛮咆哮\")<3 then BeeRun(\"野蛮咆哮\",\"nogoal\");return;end\n--7. 背面用撕碎以获取更多的连击点\nif BeeUnitAffectingCombat() and BeeIsRun(\"撕碎\") and IsSpellInRange(\"撕碎\",\"target\")==1 then BeeRun(\"撕碎\");return;end\n",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Druid_PrimalAgression",
					["Description"] = "當滿足條件時自動施放",
				}, -- [9]
				{
					["GUID"] = 10,
					["Script"] = "if IsStealthed() and  IsSpellInRange(\"毁灭\",\"target\")==1 and BeeIsRun(\"毁灭\",\"target\") then BeeRun(\"毁灭\",\"target\");return;end\nif IsStealthed() and BeeUnitMana()>10 and IsSpellInRange(\"野性冲锋\\(猎豹形态\\)\",\"target\")==1 and BeeIsRun(\"野性冲锋\\(猎豹形态\\)\") then BeeRun(\"野性冲锋\\(猎豹形态\\)\");return;end\nif BeePlayerBuffTime(\"强化野性冲锋\")>0 and IsSpellInRange(\"毁灭\",\"target\")==1 and BeeIsRun(\"毁灭\",\"target\") then BeeRun(\"毁灭\",\"target\");return;end\nif BeeIsRun(\"精灵之火（野性）\") and BeeUnitBuff(\"精灵之火（野性）\",\"target\",2,0)<1 then BeeRun(\"精灵之火（野性）\");return;end\nif BeeIsRun(\"猛虎之怒\") and BeeUnitMana()<30 and BeePlayerBuffTime(\"狂暴\")<0 then BeeRun(\"猛虎之怒\",\"nogoal\") return;end\nif BeeIsRun(\"裂伤\\(猎豹形态\\)\") and BeeUnitBuff(\"裂伤\",\"target\",2)<0 then BeeRun(\"裂伤\\(猎豹形态\\)\");return end;\nif BeeIsRun(\"狂暴\") and BeeUnitMana()>80 then BeeRun(\"狂暴\",\"nogoal\");return end\nif BeeIsRun(\"凶猛撕咬\") and BeeUnitHealth(\"target\",\"%\")<25 and BeeTargetDeBuffTime(\"割裂\")<5 and BeeGetComboPoints()>0 then BeeRun(\"凶猛撕咬\") return;end\nif BeeIsRun(\"凶猛撕咬\") and BeeUnitHealth(\"target\",\"%\")<25 and BeeTargetDeBuffTime(\"割裂\")>0 and BeeGetComboPoints()==5 then BeeRun(\"凶猛撕咬\") return;end\nif BeeIsRun(\"裂伤\\(猎豹形态\\)\") and BeeGetComboPoints()<1 then BeeRun(\"裂伤\\(猎豹形态\\)\") return;end\nif BeeIsRun(\"割裂\") and BeeGetComboPoints()==5 and BeeTargetDeBuffTime(\"割裂\")<2 then BeeRun(\"割裂\") return;end\nif BeeIsRun(\"斜掠\") and BeeTargetDeBuffTime(\"斜掠\")<3 then BeeRun(\"斜掠\") return;end\nif BeeIsRun(\"野蛮咆哮\",\"nogoal\") and BeeGetComboPoints()>0 and BeePlayerBuffTime(\"野蛮咆哮\")<0 then BeeRun(\"野蛮咆哮\",\"nogoal\");return;end\nif BeeIsRun(\"野蛮咆哮\",\"nogoal\") and BeeGetComboPoints()==5 and BeeTargetDeBuffTime(\"割裂\")<12 and (BeePlayerBuffTime(\"野蛮咆哮\")-BeeTargetDeBuffTime(\"割裂\")<=3  or BeeTargetDeBuffTime(\"割裂\")-BeePlayerBuffTime(\"野蛮咆哮\")<=3) then\n    BeeRun(\"野蛮咆哮\",\"nogoal\");return;end\nif BeeIsRun(\"凶猛撕咬\") and BeeGetComboPoints()==5 and BeeTargetDeBuffTime(\"割裂\")>=8 and BeePlayerBuffTime(\"野蛮咆哮\")>=8 then BeeRun(\"凶猛撕咬\") return;end\nif BeeIsRun(\"裂伤\\(猎豹形态\\)\") and   BeeGetComboPoints()<5 and ((BeeTargetDeBuffTime(\"割裂\")>=12 and BeePlayerBuffTime(\"斜掠\")>=12) or (BeePlayerBuffTime(\"狂暴\")>0 and BeeUnitMana()>35) or BeeSpellCD(\"猛虎之怒\")<3) then BeeRun(\"裂伤\\(猎豹形态\\)\") return;end\nif BeeIsRun(\"裂伤\\(猎豹形态\\)\") and BeeGetComboPoints()<1 and BeeTargetDeBuffTime(\"野蛮咆哮\")<2 and BeePlayerBuffTime(\"斜掠\")<2 then BeeRun(\"裂伤\\(猎豹形态\\)\") return;end\nif BeeIsRun(\"割裂\") and BeeTargetDeBuffTime(\"割裂\")<1 then BeeRun(\"割裂\") return;end\nif BeeIsRun(\"裂伤\\(猎豹形态\\)\") and BeeUnitMana()>95 then BeeRun(\"裂伤\\(猎豹形态\\)\") return;end\n",
					["Name"] = "完整循环（正面）",["Title"] = "|cffff7d0a完整循环（正面）|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Druid_OwlkinFrenzy",
					["Description"] = "當滿足條件時自動施放",
				}, -- [10]
				{
					["GUID"] = 11,
					["Name"] = "完整循环（背面）",["Title"] = "|cffff7d0a完整循环（背面）|r",
					["Script"] = "if IsStealthed() and  IsSpellInRange(\"毁灭\",\"target\")==1 and BeeIsRun(\"毁灭\",\"target\") then BeeRun(\"毁灭\",\"target\");return;end\nif IsStealthed() and BeeUnitMana()>10 and IsSpellInRange(\"野性冲锋\\(猎豹形态\\)\",\"target\")==1 and BeeIsRun(\"野性冲锋\\(猎豹形态\\)\") then BeeRun(\"野性冲锋\\(猎豹形态\\)\");return;end\nif BeePlayerBuffTime(\"强化野性冲锋\")>0 and IsSpellInRange(\"毁灭\",\"target\")==1 and BeeIsRun(\"毁灭\",\"target\") then BeeRun(\"毁灭\",\"target\");return;end\nif BeeIsRun(\"精灵之火（野性）\") and BeeUnitBuff(\"精灵之火（野性）\",\"target\",2,0)<1 then BeeRun(\"精灵之火（野性）\");return;end\nif BeeIsRun(\"猛虎之怒\") and BeeUnitMana()<30 and BeePlayerBuffTime(\"狂暴\")<0 then BeeRun(\"猛虎之怒\",\"nogoal\") return;end\nif BeeIsRun(\"裂伤\\(猎豹形态\\)\") and BeeUnitBuff(\"裂伤\",\"target\",2)<0 then BeeRun(\"裂伤\\(猎豹形态\\)\");return end;\nif BeeIsRun(\"狂暴\") and BeeUnitMana()>80 then BeeRun(\"狂暴\",\"nogoal\");return end\nif BeeIsRun(\"凶猛撕咬\") and BeeUnitHealth(\"target\",\"%\")<25 and BeeTargetDeBuffTime(\"割裂\")<5 and BeeGetComboPoints()>0 then BeeRun(\"凶猛撕咬\") return;end\nif BeeIsRun(\"凶猛撕咬\") and BeeUnitHealth(\"target\",\"%\")<25 and BeeTargetDeBuffTime(\"割裂\")>0 and BeeGetComboPoints()==5 then BeeRun(\"凶猛撕咬\") return;end\nif BeeIsRun(\"撕碎\") and BeeGetComboPoints()<1 then BeeRun(\"撕碎\") return;end\nif BeeIsRun(\"割裂\") and BeeGetComboPoints()==5 and BeeTargetDeBuffTime(\"割裂\")<2 then BeeRun(\"割裂\") return;end\nif BeeIsRun(\"斜掠\") and BeeTargetDeBuffTime(\"斜掠\")<3 then BeeRun(\"斜掠\") return;end\nif BeeIsRun(\"野蛮咆哮\",\"nogoal\") and BeeGetComboPoints()>0 and BeePlayerBuffTime(\"野蛮咆哮\")<0 then BeeRun(\"野蛮咆哮\",\"nogoal\");return;end\nif BeeIsRun(\"野蛮咆哮\",\"nogoal\") and BeeGetComboPoints()==5 and BeeTargetDeBuffTime(\"割裂\")<12 and (BeePlayerBuffTime(\"野蛮咆哮\")-BeeTargetDeBuffTime(\"割裂\")<=3  or BeeTargetDeBuffTime(\"割裂\")-BeePlayerBuffTime(\"野蛮咆哮\")<=3) then\n    BeeRun(\"野蛮咆哮\",\"nogoal\");return;end\nif BeeIsRun(\"凶猛撕咬\") and BeeGetComboPoints()==5 and BeeTargetDeBuffTime(\"割裂\")>=8 and BeePlayerBuffTime(\"野蛮咆哮\")>=8 then BeeRun(\"凶猛撕咬\") return;end\nif BeeIsRun(\"撕碎\") and   BeeGetComboPoints()<5 and ((BeeTargetDeBuffTime(\"割裂\")>=12 and BeePlayerBuffTime(\"斜掠\")>=12) or (BeePlayerBuffTime(\"狂暴\")>0 and BeeUnitMana()>35) or BeeSpellCD(\"猛虎之怒\")<3) then BeeRun(\"撕碎\") return;end\nif BeeIsRun(\"撕碎\") and BeeGetComboPoints()<1 and BeeTargetDeBuffTime(\"野蛮咆哮\")<2 and BeePlayerBuffTime(\"斜掠\")<2 then BeeRun(\"撕碎\") return;end\nif BeeIsRun(\"割裂\") and BeeTargetDeBuffTime(\"割裂\")<1 then BeeRun(\"割裂\") return;end\nif BeeIsRun(\"撕碎\") and BeeUnitMana()>95 then BeeRun(\"撕碎\") return;end\n",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Druid_OwlkinFrenzy",
					["Description"] = "當滿足條件時自動施放",
				}, -- [11]
			},
		},
				{
			["Name"] = "鸟德基础包",["Title"] = "|cffff7d0a鸟德基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Name"] = "骑乘状态",["Title"] = "|cffff7d0a骑乘状态|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Script"] = "--CTM 4.2 鸟德输出脚本 2011/11/5 by ATM\n--骑乘\\游泳\\旅行状态不施法\nif IsMounted(\"player\")==1 or BeeGetShapeshiftFormInfo(2) or BeeGetShapeshiftFormInfo(4) or BeeGetShapeshiftFormInfo(6) then return end",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\Spell_Holy_HopeAndGrace",
					["Name"] = "优先技能",["Title"] = "|cffff7d0a优先技能|r",
				}, -- [2]
				{
					["GUID"] = 2,
					["Name"] = "优先保命",["Title"] = "|cffff7d0a优先保命|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Frost_Frost",
					["Script"] = "--优先保命\nif BeeUnitHealth(\"player\",\"%\")<45 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"奇效治疗药水\") then BeeRun(\"奇效治疗药水\");return;end\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"树皮术\") then BeeRun(\"树皮术\");return;end\nif BeeUnitHealth(\"player\",\"%\")<90 and BeeIsRun(\"生命之血\") then BeeRun(\"生命之血\");return;end\nif BeeUnitAffectingCombat()and BeeIsRun(\"自然之握\") then BeeRun(\"自然之握\");return;end\n\n\n\n",
				}, -- [3]
				{
					["Enabled"] = 1,
					["Script"] = "--自动补BUFF\nif BeeIsRun(\"野性印记\",\"player\") and BeePlayerBuffTime(\"野性印记\")<60 then BeeRun(\"野性印记\",\"player\");return;end\nif BeeIsRun(\"增强合剂\") and BeePlayerBuffTime(\"增强智力\")<60 then BeeRun(\"增强合剂\");return;end",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\Spell_Nature_Regeneration",
					["Name"] = "自动补BUFF",["Title"] = "|cffff7d0a自动补BUFF|r",
				}, -- [4]
				{
					["GUID"] = 10,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat()and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n\n--非战斗状态禁止攻击,可攻击木桩\nlocal KGJ=\"哈卡之链,训练假人,团队副本训练假人\"\nif not BeeStringFind(KGJ,UnitName(\"target\")) then\n    if not BeeUnitAffectingCombat(\"target\") or not BeeUnitAffectingCombat() then return;end\nend\n\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\")) or BeePlayerBuffTime(\"隐形术\")>0 or BeeUnitCastSpellName(\"player\")==\"唤醒\"  or BeeUnitCastSpellName(\"player\")==\"暴风雪\" then return;end\n",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_HolyNova",
					["Name"] = "自动协助T",["Title"] = "|cffff7d0a自动协助T|r",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Name"] = "自动打断",["Title"] = "|cffff7d0a自动打断|r",
					["Script"] = "--自动打断\nlocal spelljd, _, _, _, _, _, _, ddjd = UnitCastingInfo(\"focustarget\")\nlocal spellzj, _, _, _, _, _, _, ddzj = UnitCastingInfo(\"target\")\nif ddzj==0 and BeeIsRun(\"日光术\",\"target\") and BeeRange(\"target\")<40 then BeeRun(\"日光术\",\"target\");return;end\nif ddjd==0 and BeeIsRun(\"日光术\",\"focustarget\") and BeeRange(\"focustarget\")<40 then BeeRun(\"日光术\",\"focustarget\");return;end",
					["GUID"] = 4,
					["Icon"] = "Interface\\Icons\\Ability_Druid_Dreamstate",
					["Description"] = "當滿足條件時自動施放",
				}, -- [6]
				{
					["Enabled"] = true,
					["Script"] = "--自动驱散\ngrouptype=\"\";if GetNumGroupMembers()>0 then  grouptype=\"raid\" else  grouptype=\"party\" end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"净化腐蚀\",unit)',\"BeeUnitBuffInfo(unit,2,'Curse,Poison',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype)\nif n>0 and BeeIsRun(\"净化腐蚀\",qusan) then BeeRun(\"净化腐蚀\",qusan);return;end",
					["Name"] = "自动驱散",["Title"] = "|cffff7d0a自动驱散|r",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\Ability_Druid_LunarGuidance",
					["Description"] = "當滿足條件時自動施放",
				}, -- [7]
				{
					["Enabled"] = true,
					["Script"] = "--蓝少激活回蓝部分\nif BeeUnitMana(\"player\",\"%\",0)<50 and BeeIsRun(\"激活\",\"player\") then BeeRun(\"激活\",\"player\");return;end",
					["Name"] = "自动激活",["Title"] = "|cffff7d0a自动激活|r",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Spell_Nature_Lightning",
					["Description"] = "當滿足條件時自動施放",
				}, -- [8]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动开饰品",["Title"] = "|cffff7d0a自动开饰品|r",
					["GUID"] = 7,
					["Icon"] = "Interface\\Icons\\Spell_Holy_LastingDefense",
					["Script"] = "--自动开饰品\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
				}, -- [9]
				{
					["Enabled"] = true,
					["Script"] = "--给T上荆棘术\nif BeeIsRun(\"荆棘术\",\"focus\") and UnitCanAssist(\"player\",\"focus\") then BeeRun(\"荆棘术\",\"focus\");return;end",
					["Name"] = "给焦点T上荆棘术",["Title"] = "|cffff7d0a给焦点T上荆棘术|r",
					["GUID"] = 8,
					["Icon"] = "Interface\\Icons\\Spell_Nature_Thorns",
					["Description"] = "當滿足條件時自動施放",
				}, -- [10]
				{
					["Enabled"] = true,
					["Script"] = "--判断日蚀状态\nlocal rishi=1;\nif BeeStringFind(\"日蚀\",BeeUnitBuffList()) or (not BeeStringFind(\"日蚀\",BeeUnitBuffList()) and not BeeStringFind(\"月蚀\",BeeUnitBuffList()) and UnitPower(\"player\", SPELL_POWER_ECLIPSE)<=0) then rishi=1 end\nif BeeStringFind(\"月蚀\",BeeUnitBuffList()) or (not BeeStringFind(\"日蚀\",BeeUnitBuffList()) and not BeeStringFind(\"月蚀\",BeeUnitBuffList()) and UnitPower(\"player\", SPELL_POWER_ECLIPSE)>0) then rishi=0 end\n--移动输出\nif GetUnitSpeed(\"player\")>0 then\n    if BeeIsRun(\"星辰坠落\") then BeeRun(\"星辰坠落\");return;end\n    if BeeIsRun(\"自然之力\") then BeeMouse(0,0,1,\"自然之力\");BeeRun(\"/petattack [target=target,harm]\");return;end\n    if BeeIsRun(\"虫群\") and BeeTargetDeBuffTime(\"虫群\")<1 then BeeRun(\"虫群\");return;end\n    if BeeIsRun(\"月火术\") then BeeRun(\"月火术\");return;end\nend\n--单体输出\nif GetUnitSpeed(\"player\")==0 and BeeIsRun(\"星涌术\") and BeePlayerBuffTime(\"星坠\")>1  then BeeRun(\"星涌术\");return;end\nif BeeIsRun(\"星辰坠落\") then BeeRun(\"星辰坠落\");return;end\nif BeeIsRun(\"自然之力\") then BeeMouse(0,0,1,\"自然之力\");BeeRun(\"/petattack [target=target,harm]\");return;end\nif BeeIsRun(\"精灵之火\") and BeeUnitBuff(\"精灵之火\",\"target\",2,0) <1 then BeeRun(\"精灵之火\");return;end\nif BeeIsRun(\"虫群\") and BeeTargetDeBuffTime(\"虫群\")<1 then BeeRun(\"虫群\");return;end\nif BeeIsRun(\"星涌术\") then BeeRun(\"星涌术\");return;end\nif BeeIsRun(\"月火术\") and (BeeTargetDeBuffTime(\"阳炎术\")<1 and BeeTargetDeBuffTime(\"月火术\")<1) then BeeRun(\"月火术\");return;end\nif BeeIsRun(\"阳炎术\") and (BeeTargetDeBuffTime(\"阳炎术\")<1 and BeeTargetDeBuffTime(\"月火术\")<1) then BeeRun(\"阳炎术\");return;end\nif BeeIsRun(\"星火术\",\"target\") and rishi==0 then BeeRun(\"星火术\");return;end \nif BeeIsRun(\"愤怒\",\"target\") and rishi==1 then BeeRun(\"愤怒\");return;end ",
					["Name"] = "鸟德输出",["Title"] = "|cffff7d0a鸟德输出|r",
					["GUID"] = 11,
					["Icon"] = "Interface\\Icons\\Ability_Druid_ImprovedMoonkinForm",
					["Description"] = "當滿足條件時自動施放",
				}, -- [11]
			},
		},
		{
		    ["Name"] = "熊德基础包",["Title"] = "|cffff7d0a熊德基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "骑乘状态",["Title"] = "|cffff7d0a骑乘状态|r",
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Script"] = "--CTM 4.2 熊T输出脚本 2011/11/5 by ATM\n--骑乘\\游泳\\旅行状态不施法\nif IsMounted(\"player\")==1 or BeeGetShapeshiftFormInfo(2) or BeeGetShapeshiftFormInfo(4) or BeeGetShapeshiftFormInfo(5) then return end",
				}, -- [1]
				{
					["GUID"] = 9,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
					["Icon"] = "Interface\\Icons\\Spell_Holy_HopeAndGrace",
					["Name"] = "优先技能",["Title"] = "|cffff7d0a优先技能|r",
				}, -- [2]
				{
					["GUID"] = 2,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "优先保命",["Title"] = "|cffff7d0a优先保命|r",
					["Icon"] = "Interface\\Icons\\Spell_Frost_Frost",
					["Script"] = "--优先保命\nif BeeUnitHealth(\"player\",\"%\")<45 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"树皮术\") then BeeRun(\"树皮术\");return;end\nif BeeUnitHealth(\"player\",\"%\")<90 and BeeIsRun(\"生命之血\") then BeeRun(\"生命之血\");return;end\nif BeeUnitAffectingCombat()and BeeIsRun(\"自然之握\") then BeeRun(\"自然之握\");return;end\n\n\n\n",
				}, -- [3]
				{
					["GUID"] = 3,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--自动补BUFF\nif BeeIsRun(\"野性印记\",\"player\") and BeePlayerBuffTime(\"野性印记\")<60 then BeeRun(\"野性印记\",\"player\");return;end\nif BeeIsRun(\"增强合剂\") and BeePlayerBuffTime(\"增强敏捷\")<60 then BeeRun(\"增强合剂\");return;end\n",
					["Icon"] = "Interface\\Icons\\Spell_Nature_Regeneration",
					["Name"] = "自动补BUFF",["Title"] = "|cffff7d0a自动补BUFF|r",
				}, -- [4]
				{
					["GUID"] = 4,
					["Script"] = "--熊T打断施法\nlocal spellzj, _, _, _, _, _, _, ddzj = UnitCastingInfo(\"target\")\nif BeeUnitAffectingCombat() and ddzj == 0 and BeeIsRun(\"迎头痛击\\(熊形态\\)\",\"target\") then BeeRun(\"迎头痛击\\(熊形态\\)\",\"target\");return;end\n",
					["Name"] = "自动打断",["Title"] = "|cffff7d0a自动打断|r",
					["Icon"] = "Interface\\Icons\\Ability_Druid_SkinTeeth",
					["Description"] = "當滿足條件時自動施放",
				}, -- [5]
				{
					["GUID"] = 7,
					["Name"] = "自动开饰品",["Title"] = "|cffff7d0a自动开饰品|r",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Holy_LastingDefense",
					["Script"] = "--自动开饰品\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
				}, -- [6]
				{
					["GUID"] = 8,
					["Name"] = "单拉",["Title"] = "|cffff7d0a单拉|r",
					["Script"] = "if not BeeGetShapeshiftFormInfo(1) then BeeRun(\"/cast 熊形态\") return;end\nif BeeAttack() then return end\nif BeeIsRun(\"激怒\") then BeeRun(\"激怒\") return;end\nif BeeIsRun(\"精灵之火（野性）\") and BeeUnitBuff(\"精灵之火（野性）\",\"target\",2,0)<1 then BeeRun(\"精灵之火（野性）\");return;end\nif BeeUnitAffectingCombat() and  BeeTargetDeBuffTime(\"挫志咆哮\")<2 then BeeRun(\"挫志咆哮\") return;end\nif BeeIsRun(\"裂伤\\(熊形态\\)\") then BeeRun(\"裂伤\\(熊形态\\)\");return end;\nif (BeeTargetDeBuffCount(\"割伤\")<3 or BeeTargetDeBuffTime(\"割伤\")<3) and BeeIsRun(\"割伤\") then BeeRun(\"割伤\");return;end\nif BeeIsRun(\"痛击\") and BeeIsRun(\"痛击\") then BeeRun(\"痛击\");return;end\nif BeeSpellCD(\"裂伤(熊形态)\")>0 and  BeeSpellCD(\"痛击\")>0 and BeePlayerBuffTime(\"粉碎\")<5 and BeeIsRun(\"粉碎\") then BeeRun(\"粉碎\") return;end;\nif BeeUnitMana()>60 and BeeIsRun(\"重殴\") then BeeRun(\"重殴\");return;end\n",
					["Icon"] = "Interface\\Icons\\Ability_Druid_PrimalAgression",
					["Description"] = "當滿足條件時自動施放",
				}, -- [7]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "群拉",["Title"] = "|cffff7d0a群拉|r",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\Ability_Druid_Enrage",
					["Script"] = "if not BeeGetShapeshiftFormInfo(1) then BeeRun(\"/cast 熊形态\") return;end\nif BeeAttack() then return end\nif BeeIsRun(\"激怒\") then BeeRun(\"激怒\") return;end\n--if BeeUnitAffectingCombat() and  BeeTargetBuffTime(\"挫志咆哮\")<2 then BeeRun(\"挫志咆哮\") return;end\nif BeeIsRun(\"痛击\") and BeeIsRun(\"痛击\") then BeeRun(\"痛击\");return;end\nif BeeIsRun(\"重殴\") then BeeRun(\"重殴\");return;end\nif BeeIsRun(\"横扫\\(熊形态\\)\") then BeeRun(\"横扫\\(熊形态\\)\");return;end\nif (BeeTargetDeBuffCount(\"割伤\")<3 or BeeTargetDeBuffTime(\"割伤\")<3) and BeeIsRun(\"割伤\") then BeeRun(\"割伤\");return;end\nif BeeIsRun(\"裂伤\\(熊形态\\)\") then BeeRun(\"裂伤\\(熊形态\\)\");return end;\nif BeeSpellCD(\"裂伤(熊形态)\")>0 and  BeeSpellCD(\"痛击\")>0 and BeePlayerBuffTime(\"粉碎\")<5 and BeeIsRun(\"粉碎\") then BeeRun(\"粉碎\") return;end;\n",
				}, -- [8]
			},
		},
	},
}

end