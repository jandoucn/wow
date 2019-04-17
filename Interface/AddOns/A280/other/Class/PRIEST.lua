wowam.ClassBeeScript.PRIEST=function()

LazyScript=LazyScript or {};
LazyScript["PRIEST"] = {
	["List"] = {
		{
			["Name"] = "神圣牧师基础包",["Title"] = "|cffffffff神圣牧师基础包|r",
			["Version"] = 2012020601,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 2,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "BUFF-静",["Title"] = "|cffffffffBUFF-静|r",
					["Icon"] = "INTERFACE\\ICONS\\spell_holy_persuitofjustice",
					["Script"] = "--团队判断\nlocal grouptype = \"\"\nif GetNumGroupMembers()>0 then    grouptype=\"raid\"    \nelse    grouptype=\"party\"    \nend \n--辅助技能\nif not BeeStringFind(\"真言术：韧\",BeeUnitBuffList(\"player\")) then\n    BeeRun(\"真言术：韧\",\"player\");        \n    BeeUnitCastSpellDelay(\"真言术：韧\",8);        \n    return;    \nend;\n\n\nif not BeeStringFind(\"心灵意志\",BeeUnitBuffList(\"player\")) then\n    BeeRun(\"心灵意志\");        \n    BeeUnitCastSpellDelay(\"心灵意志\",8);        \n    return;    \nend;\n--团队判断\nlocal grouptype = \"\"\nif GetNumGroupMembers()>0 then    grouptype=\"raid\"    \nelse    grouptype=\"party\"    \nend \nif BeeUnitBuff(\"脉轮\",\"player\")<0  and BeeUnitBuff(\"脉轮：静\",\"player\")<0 and BeeIsRun(\"脉轮\",\"player\") \nthen\n    BeeRun(\"脉轮\",\"player\");\n    return;\nend\nif BeeUnitBuff(\"脉轮\",\"player\")>-1  and \nBeeIsRun(\"快速治疗\",\"player\") then\n    BeeRun(\"快速治疗\",\"player\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--kingfreedom出品，必属精品",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Name"] = "BUFF-佑",["Title"] = "|cffffffffBUFF-佑|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\Spell_Holy_DivineProvidence",
					["Script"] = "--团队判断\nlocal grouptype = \"\"\nif GetNumGroupMembers()>0 then    grouptype=\"raid\"    \nelse    grouptype=\"party\"    \nend \n--辅助技能\nif not BeeStringFind(\"真言术：韧\",BeeUnitBuffList(\"player\")) then\n    BeeRun(\"真言术：韧\",\"player\");        \n    BeeUnitCastSpellDelay(\"真言术：韧\",8);        \n    return;    \nend;\n\nif not BeeStringFind(\"心灵意志\",BeeUnitBuffList(\"player\")) then\n    BeeRun(\"心灵意志\");        \n    BeeUnitCastSpellDelay(\"心灵意志\",8);        \n    return;    \nend;\n--团队判断\nlocal grouptype = \"\"\nif GetNumGroupMembers()>0 then    grouptype=\"raid\"    \nelse    grouptype=\"party\"    \nend \nif BeeUnitBuff(\"脉轮\",\"player\")<0  and BeeUnitBuff(\"脉轮：佑\",\"player\")<0 and BeeIsRun(\"脉轮\",\"player\") \nthen\n    BeeRun(\"脉轮\",\"player\");\n    return;\nend\nif BeeUnitBuff(\"脉轮\",\"player\")>-1  and \nBeeIsRun(\"愈合祷言\",\"player\") then\n    BeeRun(\"愈合祷言\",\"player\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--kingfreedom出品，必属精品",
				}, -- [2]
				{
					["Enabled"] = 1,
					["Name"] = "独立回蓝",["Title"] = "|cffffffff独立回蓝|r",
					["Script"] = "--团队判断\n\nlocal grouptype = \"\"\nif GetNumGroupMembers()>0 then    \n    grouptype=\"raid\"    \nelse    \n    grouptype=\"party\"    \nend;\n--回蓝\nif BeeUnitMana(\"player\",\"%\",0)<60  and BeeIsRun(\"暗影恶魔\") then BeeRun(\"暗影恶魔\");    \n    return true;\nend;\n--血精灵特有回蓝技能  非血精灵 请删除\nif BeeUnitMana(\"player\",\"%\",0)<80  and BeeIsRun(\"奥术洪流\") then    \n    BeeRun(\"奥术洪流\");    \n    return true;    \nend;\n--炼金专用无用的请删除\nif BeeUnitMana(\"player\",\"%\",0)<30  and BeeIsRun(\"无尽法力药水\") then BeeRun(\"无尽法力药水\");    \n    return true;    \nend;\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_Shadowfiend",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["GUID"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "if BeeUnitCastSpellName(\"player\")==\"圣言术：佑\" \nthen \n    return;\nend\nif BeeUnitCastSpellName(\"player\")==\"神圣赞美诗\" \nthen \n    return;\nend\nif BeeUnitCastSpellName(\"player\")==\"希望圣歌\" \nthen \n    return;\nend\n\n--自动驱散\ngrouptype=\"\"if GetNumGroupMembers()>0 then  grouptype=\"raid\" else  grouptype=\"party\" end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"驱散魔法\",unit)',\"BeeUnitBuffInfo(unit,2,'Magic,Curse,Poison',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>0 and BeeIsRun(\"驱散魔法\",qusan) then BeeRun(\"驱散魔法\",qusan);return;end",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_DispelMagic",
					["Name"] = "自动驱散",["Title"] = "|cffffffff自动驱散|r",
				}, -- [4]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "焦点T",["Title"] = "|cffffffff焦点T|r",
					["GUID"] = 4,
					["Icon"] = "Interface\\Icons\\Spell_Holy_FlashHeal",
					["Script"] = "if BeeUnitCastSpellName(\"player\")==\"圣言术：佑\" \nthen \n    return;\nend\nif BeeUnitCastSpellName(\"player\")==\"神圣赞美诗\" \nthen \n    return;\nend\nif BeeUnitCastSpellName(\"player\")==\"希望圣歌\" \nthen \n    return;\nend\n\n--辅助技能\nif not BeeStringFind(\"真言术：韧\",BeeUnitBuffList(\"focus\")) then\n    BeeRun(\"真言术：韧\",\"focus\");        \n    BeeUnitCastSpellDelay(\"真言术：韧\",8);        \n    return;    \nend;\n\n--以下为焦点T部分\nif BeeRange(\"focus\")<=40 and BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"守护之魂\",\"focus\") and BeeUnitHealth(\"focus\",\"%\")<30  and BeeSpellCD(\"守护之魂\")<1 then \n    BeeRun(\"守护之魂\",\"focus\");\n    return; \nend\nif BeeRange(\"focus\")<=40 and BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"真言术：盾\",\"focus\") and BeeUnitHealth(\"focus\",nil,1)>35000  and BeeUnitBuff(\"虚弱灵魂\",\"focus\")<1 and BeeSpellCD(\"真言术：盾\")<1 then \n    BeeRun(\"真言术：盾\",\"focus\");\n    return; \nend\nif BeeRange(\"focus\")<=40 and BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"恢复\",\"focus\") and BeeUnitAffectingCombat(Unit) and BeeUnitBuff(\"恢复\",\"focus\")<0 then \n    BeeRun(\"恢复\",\"focus\");\n    return; \nend\nif BeeRange(\"focus\")<=40 and BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"圣言术：静\",\"focus\") and BeeUnitHealth(\"focus\",nil,1)>15000  and BeeSpellCD(\"圣言术：静\")<1  and BeeUnitBuff(\"脉轮：静\",\"player\")==0 then \n    BeeRun(\"圣言术：静\",\"focus\");\n    return; \nend\nif BeeRange(\"focus\")<=40 and BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"愈合祷言\",\"focus\") and BeeUnitHealth(\"focus\",\"%\",0)<99  then \n    BeeRun(\"愈合祷言\",\"focus\");\n    return; \nend\nif BeeRange(\"focus\")<=40 and BeeUnitPlayerControlled(\"focus\")  and BeeIsRun(\"focus\",\"强效治疗术\") and BeeUnitHealth(\"focus\",\"%\",0)<70  and  BeeUnitBuff(\"妙手回春\",\"player\")>=1 then \n    BeeRun(\"强效治疗术\",\"focus\");\n    BeeUnitCastSpellDelay(\"强效治疗术\",3)\n    return; \nend\nif BeeRange(\"focus\")<=40 and BeeUnitPlayerControlled(\"focus\")  and BeeIsRun(\"focus\",\"快速治疗\") and BeeUnitHealth(\"focus\",\"%\",0)<65  then \n    BeeRun(\"快速治疗\",\"focus\");\n    BeeUnitCastSpellDelay(\"快速治疗\",3)\n    return; \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
				}, -- [5]
				{
					["GUID"] = 6,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "神牧团刷",["Title"] = "|cffffffff神牧团刷|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_Renew",
					["Script"] = "local grouptype=\"\"\nif GetNumGroupMembers()>0 then\n    grouptype=\"raid\"\nelse\n    grouptype=\"party\"\nend\n\n\n\nif BeeUnitCastSpellName(\"player\")==\"圣言术：佑\" \nthen \n    return;\nend\nif BeeUnitCastSpellName(\"player\")==\"神圣赞美诗\" \nthen \n    return;\nend\nif BeeUnitCastSpellName(\"player\")==\"希望圣歌\" \nthen \n    return;\nend\n--自动补BUFF\nif BeeUnitBuff(\"真言术：韧\",\"player\")<0 and BeeIsRun(\"真言术：韧\",\"player\") then\n    BeeRun(\"真言术：韧\",\"player\")\n    return;\nend\nif BeeCastSpellFast() then\n    return true;\nend\n\nif BeeUnitHealth(\"player\",\"%\")<45 and BeeIsRun(\"治疗石\") \n\nthen \n    \n    BeeRun(\"治疗石\");\n    \n    return;\n    \nend\n\n\n\nif BeeUnitHealth(\"player\",\"%\")<20 and BeeIsRun(\"奇效治疗药水\") \n\nthen \n    \n    BeeRun(\"奇效治疗药水\");\n    \n    return;\n    \nend\n\n\n\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeUnitAffectingCombat(Unit) and BeeIsRun(\"绝望祷言\",\"player\") then\n    BeeRun(\"绝望祷言\",\"player\");\n    return;\nend\nif BeeUnitHealth(\"player\",\"%\")<95 and BeeUnitAffectingCombat(Unit) and BeeIsRun(\"恢复\",\"player\") and BeeUnitBuff(\"恢复\",\"player\")<0 then\n    BeeRun(\"恢复\",\"player\");\n    return;\nend\n\n\n\n\n--以下为治疗之环部分\nn,YXCZ = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"治疗之环\",unit)',\"BeeUnitHealth(unit,nil,1)>11000 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>=3 and BeeIsRun(\"治疗之环\",YXCZ) then \n    BeeRun(\"治疗之环\",YXCZ);\n    return; \nend\nm,ZLDY = BeeGroupCountScript('BeeRange(unit)<=40  and BeeUnitBuff(\"治疗祷言雕文\",unit)<1',\"BeeUnitHealth(unit,nil,1)>20000 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif m>=8  then \n    BeeRun(\"治疗祷言\",ZLDY)\n    BeeUnitCastSpellDelay(\"治疗祷言\",3)\n    return; \nend\n\n--联结治疗部分\nlocal LJZL= BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>55000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit) and not unit==\"player\"',\"BeeUnitHealth(unit)\",grouptype)\n\nif LJZL and BeeUnitHealth(\"player\",nil,1)>60000  \nthen BeeRun(\"联结治疗\",LJZL);\n    return; \nend \n\n--以下为团队盾部分\nlocal SYS = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"圣言术：静\",unit) and BeeUnitHealth(unit,\"%\")<70 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif SYS and BeeIsRun(\"圣言术：静\",SYS) and BeeUnitBuff(\"脉轮：静\",\"player\")==0 then \n    BeeRun(\"圣言术：静\",SYS);\n    return; \nend\nlocal ZYD = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"真言术：盾\",unit) and BeeUnitHealth(unit,\"%\")<50 and BeeUnitBuff(\"虚弱灵魂\",unit)<1 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif ZYD and BeeIsRun(\"真言术：盾\",ZYD) then \n    BeeRun(\"真言术：盾\",ZYD);\n    return; \nend\n\n--以下为恢复团队治疗部分\nHF = BeeGroupMinScript('BeeIsRun(\"恢复\",unit) and BeeUnitHealth(unit,nil,1)>45000 and BeeUnitBuff(\"恢复\",unit)<1 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif HF and n<=3 and BeeIsRun(\"恢复\",HF) then\n    BeeRun(\"恢复\",HF);\n    return; \nend\n--妙手回春 强效治疗\n\nlocal QXZL = BeeGroupMinScript('BeeRange(unit)<=40 and  BeeUnitBuff(\"妙手回春\",\"player\")>=1 and BeeUnitHealth(unit,nil,1)>70000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif QXZL  and  BeeUnitBuff(\"妙手回春\",\"player\")>=1 then \n    BeeRun(\"强效治疗术\",QXZL);\n    BeeUnitCastSpellDelay(\"强效治疗术\",3);\n    return; \nend\n\n--以下为团队快速治疗部分\nlocal KSZL = BeeGroupMinScript('BeeRange(unit)<=40  and BeeIsRun(unit,\"快速治疗\") and BeeUnitHealth(unit,%,1)>50 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\n\nif KSZL  and BeeUnitCastSpellName(\"player\")==\"治疗术\" then \n    BeeRun(\"/stopcasting\");\n    \n    return; \nend\n\nif KSZL   then \n    BeeRun(\"快速治疗\",KSZL);\n    BeeUnitCastSpellDelay(\"快速治疗\",2);\n    return; \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
				}, -- [6]
				{
					["Enabled"] = true,
					["Script"] = "local grouptype=\"\"\nif GetNumGroupMembers()>0 then\n    grouptype=\"raid\"\nelse\n    grouptype=\"party\"\nend\n--以下为团队治疗部分\n\nlocal ZL = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"治疗术\",unit) and BeeUnitHealth(unit,nil,1)>15000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif ZL and BeeIsRun(\"治疗术\",ZL) then \n    BeeRun(\"治疗术\",ZL);\n    \n    return; \nend\n",
					["Name"] = "全团治疗术（慎用）",["Title"] = "|cffffffff全团治疗术（慎用）|r",
					["GUID"] = 10,
					["Icon"] = "Interface\\Icons\\Spell_Holy_LesserHeal",
					["Description"] = "當滿足條件時自動施放",
				}, -- [7]
				{
					["Enabled"] = 1,
					["Script"] = "--自动开饰品\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
					["Name"] = "自动饰品（慎用）",["Title"] = "|cffffffff自动饰品（慎用）|r",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\inv_misc_cat_trinket04",
					["Description"] = "當滿足條件時自動施放",
				}, -- [8]
				{
					["GUID"] = 7,
					["Script"] = "if BeeUnitCastSpellName(\"player\")==\"圣言术：佑\" \nthen \n    return;\nend\nif     BeeUnitCastSpellName(\"player\")==\"快速治疗\"  \nthen  \n    BeeRun(\"/stopcasting\")\n    return \nend\n\nif     BeeUnitCastSpellName(\"player\")==\"治疗祷言\"  \nthen  \n    BeeRun(\"/stopcasting\")\n    return \nend\n\n\nif BeeIsRun(\"圣言术：佑\",\"nogoal\")\nthen\n    BeeMouse(0,0,1,\"/cast 圣言术：佑\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
					["Name"] = "圣言术：佑-按键宏",["Title"] = "|cffffffff圣言术：佑-按键宏|r",
					["Icon"] = "Interface\\Icons\\Spell_Holy_DivineProvidence",
					["Description"] = "當滿足條件時自動施放",
				}, -- [9]
				{
					["GUID"] = 8,
					["Name"] = "群体驱散-按键宏",["Title"] = "|cffffffff群体驱散-按键宏|r",
					["Script"] = "if BeeUnitCastSpellName(\"player\")==\"群体驱散\" \nthen \n    return;\nend\n\nif BeeIsRun(\"群体驱散\",\"nogoal\")\nthen\n    BeeMouse(0,0,1,\"/cast 群体驱散\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
					["Icon"] = "Interface\\Icons\\Spell_Arcane_MassDispel",
					["Description"] = "當滿足條件時自動施放",
				}, -- [10]
    		},
		},
		{
		    ["Name"] = "戒律牧师基础包",["Title"] = "|cffffffff戒律牧师基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = 1,
					["Script"] = "if BeeUnitMana(\"player\",\"%\",0)<95 and BeePlayerBuffTime(\"喝水\")>0\nthen \n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--kingfreedom出品，必属精品",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\Spell_Holy_SummonLightwell",
					["Name"] = "喝水状态不施法",["Title"] = "|cffffffff喝水状态不施法|r",
				}, -- [1]
				{
					["GUID"] = 2,
					["Name"] = "自动回蓝",["Title"] = "|cffffffff自动回蓝|r",
					["Script"] = "--回蓝\nif BeeUnitMana(\"player\",\"%\",0)<60  and BeeIsRun(\"暗影恶魔\") then BeeRun(\"暗影恶魔\");\n    return true;\nend;\n--血精灵特有回蓝技能  非血精灵 请删除\nif BeeUnitMana(\"player\",\"%\",0)<80  and BeeIsRun(\"奥术洪流\") then\n    BeeRun(\"奥术洪流\");\n    return true;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--kingfreedom出品，必属精品\n",
					["Icon"] = "Interface\\Icons\\Spell_Shadow_Shadowfiend",
					["Description"] = "當滿足條件時自動施放",
				}, -- [2]
				{
					["GUID"] = 1,
					["Name"] = "自动驱散（选用）",["Title"] = "|cffffffff自动驱散（选用）|r",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Holy_TestOfFaith",
					["Script"] = "--自动驱散\ngrouptype=\"\";if GetNumGroupMembers()>0 then  grouptype=\"raid\" else  grouptype=\"party\" end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"驱散魔法\",unit)',\"BeeUnitBuffInfo(unit,2,'Magic,Curse,Poison',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>0 and BeeIsRun(\"驱散魔法\",qusan) then BeeRun(\"驱散魔法\",qusan);return;end\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--kingfreedom出品，必属精品",
				}, -- [3]
				{
					["Enabled"] = 1,
					["Name"] = "天使长",["Title"] = "|cffffffff天使长|r",
					["Script"] = "--团队判断\nlocal grouptype = \"\"\n\nif GetNumGroupMembers()>0 then\n    grouptype=\"raid\"\n    \nelse\n    grouptype=\"party\"\n    \nend \n\n--辅助技能\nif BeeGroupMinScript('BeeIsRun(\"强效治疗术\",unit) and BeeUnitHealth(unit,\"%\")<45 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nand BeeIsRun(\"心灵专注\") then BeeRun(\"心灵专注\");\n    return;\nend;\nif BeeGroupMinScript('BeeIsRun(\"强效治疗术\",unit) and BeeUnitHealth(unit,\"%\")<25 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nand BeeIsRun(\"能量灌注\",\"player\") then BeeRun(\"能量灌注\",\"player\");\n    return;\nend;\n--天使长\nif BeePlayerBuffCount(\"福音传播\")==5 and  BeeIsRun(\"天使长\") and BeeUnitHealth(\"focus\",\"%\")>95 then BeeRun(\"天使长\");\n    return;\nend;\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n \n\n\n\n\n\n\n\n\n\n\n\n\n--kingfreedom出品，必属精品\n",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Spell_Holy_ElunesGrace",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
				{
					["GUID"] = 5,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "戒律",["Title"] = "|cffffffff戒律|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_DevineAegis",
					["Script"] = "grouptype=\"\"\nif GetNumGroupMembers()>0 then\n    grouptype=\"raid\"\nelse\n    grouptype=\"party\"\nend\n\n\n--自动补BUFF\nif BeeUnitBuff(\"真言术：韧\",\"player\")<0 and BeeIsRun(\"真言术：韧\",\"player\") then\n    BeeRun(\"真言术：韧\",\"player\")\n    return;\nend\nif BeeCastSpellFast() then\n    return true;\nend\n\nif BeeUnitHealth(\"player\",\"%\")<45 and BeeIsRun(\"治疗石\") \n\nthen \n    \n    BeeRun(\"治疗石\");\n    \n    return;\n    \nend\n\n\n\nif BeeUnitHealth(\"player\",\"%\")<20 and BeeIsRun(\"奇效治疗药水\") \n\nthen \n    \n    BeeRun(\"奇效治疗药水\");\n    \n    return;\n    \nend\n\n\n\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeUnitAffectingCombat(Unit) and BeeIsRun(\"绝望祷言\",\"player\") then\n    BeeRun(\"绝望祷言\",\"player\");\n    return;\nend\nif BeeUnitHealth(\"player\",\"%\")<75 and BeeUnitAffectingCombat(Unit) and BeeIsRun(\"恢复\",\"player\") and BeeUnitBuff(\"恢复\",\"player\")<0 then\n    BeeRun(\"恢复\",\"player\");\n    return;\nend\n\n\n\n--以下为愈合祷言部分\n\nif BeeRange(focus)<=40 and BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"愈合祷言\",\"focus\") and BeeUnitHealth(\"focus\",\"%\",0)<99  then \n    BeeRun(\"愈合祷言\",\"focus\");\n    \n    return; \nend\n\n--以下为治疗祷言部分\n\nlocal n,ZLDY = BeeGroupCountScript('BeeRange(unit)<=35 and BeeIsRun(\"治疗祷言\",unit)',\"BeeUnitHealth(unit,nil,1)>40000 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n >=4 and BeeUnitBuffCount(\"争分夺秒\",\"player\")>=0 then \n    BeeRun(\"治疗祷言\",\"player\");\n    return; \nend\n\n--以下为团队盾部分\nlocal JY = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"真言术：盾\",unit) and BeeUnitHealth(unit,\"%\")<49 and BeeUnitBuff(\"虚弱灵魂\",\"focus\")<1 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif JY and BeeIsRun(\"真言术：盾\",JY) then \n    BeeRun(\"真言术：盾\",JY);\n    \n    return; \nend\n\n\n--以下为苦修团队治疗部分\nlocal HC = BeeGroupMinScript('BeeIsRun(\"苦修\",unit) and BeeUnitHealth(unit,\"%\")<85 and BeeUnitBuff(\"苦修\",unit)<1 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif HC and BeeIsRun(\"苦修\",HC) then\n    BeeRun(\"苦修\",HC);\n    return; \nend\n\n--联结治疗部分\nlocal LJZL= BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"联结治疗\",unit) and BeeUnitHealth(unit,nil,1)>35000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\n\nif LJZL and BeeUnitHealth(\"player\",nil,1)>30000  and BeeIsRun(\"联结治疗\",LJZL) \nthen BeeRun(\"联结治疗\",LJZL);\n    return; \nend \n\n--以下为保持T盾部分\n\nif BeeRange(\"focus\")<=40 and BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"守护之魂\",\"focus\") and BeeUnitHealth(\"focus\",\"%\")<30  and BeeSpellCD(\"守护之魂\")<1 then \n    BeeRun(\"守护之魂\",\"focus\");\n    return; \nend\n\nif BeeRange(focus)<=40 and BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"真言术：盾\",\"focus\") and BeeUnitAffectingCombat(Unit) and BeeUnitHealth(\"focus\",\"%\")<99 and BeeUnitBuff(\"真言术：盾\",\"focus\")<0 then \n    BeeRun(\"真言术：盾\",\"focus\");\n    return; \nend\n\n--以下为团队快速治疗部分\nlocal JY = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"快速治疗\",unit) and BeeUnitHealth(unit,\"%\")<40 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif JY and BeeIsRun(\"快速治疗\",JY) then \n    BeeRun(\"快速治疗\",JY);\n    BeeUnitCastSpellDelay(\"快速治疗\",0.8);\n    return; \nend\n--强效治疗\n\nlocal QXZL = BeeGroupMinScript('BeeRange(unit)<=40 and BeeIsRun(\"强效治疗术\",unit) and BeeUnitHealth(unit,nil,1)>50000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\n\nif QXZL and BeeIsRun(\"强效治疗术\",QXZL) then \n    \n    BeeRun(\"强效治疗术\",QXZL);\n    \n    BeeUnitCastSpellDelay(\"强效治疗术\",0.8);\n    \n    return; \n    \nend\n\nif BeeUnitHealth(\"focustarget\",\"%\")<98 and  BeeIsRun(\"神圣之火\",\"focustarget\") and BeeSpellCD(\"神圣之火\",\"focustarget\")<1\nthen BeeRun(\"神圣之火\",\"focustarget\");\n    \n    return;\nend\nif BeeUnitHealth(\"focustarget\",\"%\")<98 and  BeeIsRun(\"惩击\",\"focustarget\") and BeeSpellCD(\"惩击\",\"focustarget\")<1\nthen BeeRun(\"惩击\",\"focustarget\");\n    \n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--kingfreedom出品，必属精品\n\n\n",
				}, -- [5]
			},
		},
		{
		    ["Name"] = "暗影牧师基础包",["Title"] = "|cffffffff暗影牧师基础包|r",
			["Version"] = 2012022701,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = 1,
					["Script"] = "if BeeUnitCastSpellName(\"player\")==\"神圣赞美诗\" \nthen \n    return;\nend\nif BeeUnitCastSpellName(\"player\")==\"希望圣歌\" \nthen \n    return;\nend\n--自动补BUFF部分\nif BeeUnitBuff(\"真言术：韧\",\"player\",2,1)<5  and BeeUnitBuff(\"真言术：韧\",\"player\",2,1)<5 and\nBeeIsRun(\"真言术：韧\",\"player\") then\n    BeeRun(\"真言术：韧\",\"player\");\n    BeeUnitCastSpellDelay(\"真言术：韧\",3)\n    return;\nend  \nif not BeeStringFind(\"心灵之火\",BeeUnitBuffList(\"player\")) then\n    BeeRun(\"心灵之火\");        \n    BeeUnitCastSpellDelay(\"心灵之火\",5,\"player\");        \n    return;    \nend    \nif BeeUnitBuff(\"暗影防护\",\"player\",2,1)<5  and BeeUnitBuff(\"暗影防护\",\"player\",2,1)<5 and\nBeeIsRun(\"暗影防护\",\"player\") then\n    BeeRun(\"暗影防护\",\"player\");\n    return;\nend \nif not BeeStringFind(\"吸血鬼的拥抱\",BeeUnitBuffList(\"player\")) then\n    BeeRun(\"吸血鬼的拥抱\");        \n    BeeUnitCastSpellDelay(\"吸血鬼的拥抱\",5,\"player\");        \n    return;    \nend    \n\n\nif (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"黯淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"黯淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");return;end",
					["Name"] = "自动补buff",["Title"] = "|cffffffff自动补buff|r",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\Spell_Holy_HolySmite",
					["Description"] = "當滿足條件時自動施放",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Name"] = "主要输出",["Title"] = "|cffffffff主要输出|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 1,
					["Icon"] = "Interface\\Icons\\INV_Staff_08",
					["Script"] = "--特殊情况处理山寨提款机大大\n--套装数量判断\nlocal T13=select(2,string.gsub(GetInventoryItemLink('player',1)..GetInventoryItemLink('player',3)..GetInventoryItemLink('player',5)..GetInventoryItemLink('player',7)..GetInventoryItemLink('player',10),\"湮灭之光\",\"湮灭之光\"))\n--4T13爆发，开局请喝火山药水\nif BeeUnitAffectingCombat() and T13>=4 then\n    if BeeSpellCD(\"暗影恶魔\")==0 and BeePlayerBuffCount(\"黑暗福音\")<5 and BeeSpellCD(\"暗影恶魔\")==0 and BeeSpellCD(\"天使长\")==0 then\n        if not BeeUnitCastSpellName(\"player\") and   BeeIsRun(\"精神鞭笞\",\"target\",\"nogoal\") then\n            BeeRun(\"精神鞭笞\",\"target\",\"nogoal\");\n            BeeUnitCastSpellDelay(\"精神鞭笞\",\"target\");\n            return;\n        end\n    end \n    if BeePlayerBuffCount(\"黑暗福音\")==5 and BeeSpellCD(\"暗影恶魔\")==0 and BeeIsRun(\"天使长\") then\n        BeeRun(\"天使长\");\n        return;\n    end\n    if BeePlayerBuffTime(\"黑暗天使长\")>0 and BeeIsRun(\"暗影恶魔\") then\n        BeeRun(\"暗影恶魔\");\n        return;\n    end\n    if not (BeeUnitHealth(\"pet\")<=0 or UnitIsDeadOrGhost(\"pet\")) then\n        if BeeIsRun(\"心灵震爆\") and BeePlayerBuffCount(\"心灵熔化\")>0 then\n            BeeRun(\"/cancelaura [pet]心灵熔化\");\n            return;\n        end\n        if BeeIsRun(\"心灵震爆\") then\n            BeeRun(\"心灵震爆\");\n            return;\n        end\n        if BeeIsRun(\"心灵尖刺\") then\n            BeeRun(\"心灵尖刺\");\n            return;\n        end\n    end\nend\n\n\n\n\n\n\n--25%灭\nif (BeeUnitHealth(\"target\",\"%\")<=25 or (BeeUnitMana(\"player\",\"%\",0)<40 and BeeUnitHealth(\"target\",\"%\")>25)) and BeeIsRun(\"暗言术：灭\") then \n    BeeRun(\"暗言术：灭\");     \n    return; \nend\n--低血量目标快速击杀\nif BeeUnitHealth(\"target\")<=100000 then\n    --心灵尖刺部分\n    if BeeIsRun(\"心灵尖刺\",\"target\") then\n        BeeRun(\"心灵尖刺\",\"target\");     \n        return;\n    end;\nend\n\n\n--保持暗言术：痛部分\nif not BeeUnitCastSpellName(\"player\") and  BeeTargetDeBuffTime(\"暗言术：痛\")<0 and  BeeIsRun(\"暗言术：痛\",\"target\") then\n    BeeRun(\"暗言术：痛\",\"target\");\n    return;\nend\nif not BeeUnitCastSpellName(\"player\") and  BeeUnitBuff(\"暗言术：痛\",\"focus\")<0 and  BeeIsRun(\"暗言术：痛\",\"focus\") then\n    BeeRun(\"暗言术：痛\",\"focus\");\n    return;\nend\n\n\n--心灵震爆部分\nif not BeeUnitCastSpellName(\"player\") and BeePlayerBuffTime(\"暗影宝珠\")>=3  and  BeeIsRun(\"心灵震爆\",\"target\") then\n    BeeRun(\"心灵震爆\",\"target\");     \n    return;\nend\n\n--保持吸血鬼之触部分\nif  BeeTargetDeBuffTime(\"吸血鬼之触\")<2 and BeeIsRun(\"吸血鬼之触\",\"target\") then\n    BeeRun(\"吸血鬼之触\",\"target\");\n    BeeUnitCastSpellDelay(\"吸血鬼之触\",3,\"target\");\n    return;\nend\nif  BeeUnitBuff(\"吸血鬼之触\",\"focus\")<0 and  BeeIsRun(\"吸血鬼之触\",\"focus\") then\n    BeeRun(\"吸血鬼之触\",\"focus\");\n    BeeUnitCastSpellDelay(\"吸血鬼之触\",3,\"focus\");\n    return;\nend\n\n--保持噬灵疫病部分\nif not BeeUnitCastSpellName(\"player\") and BeeTargetDeBuffTime(\"噬灵疫病\")<0  and BeeIsRun(\"噬灵疫病\",\"target\") then\n    BeeRun(\"噬灵疫病\",\"target\");\n    BeeUnitCastSpellDelay(\"噬灵疫病\",3,\"focus\");\n    return;\nend\n\n--心灵震爆部分\nif not BeeUnitCastSpellName(\"player\") and BeePlayerBuffTime(\"暗影宝珠\")<3  and  BeeIsRun(\"心灵震爆\",\"target\") then\n    BeeRun(\"心灵震爆\",\"target\");     \n    return;\nend\n\n\n--精神鞭笞部分\nif not BeeUnitCastSpellName(\"player\") and   BeeIsRun(\"精神鞭笞\",\"target\",\"nogoal\") then\n    BeeRun(\"精神鞭笞\",\"target\",\"nogoal\");\n    BeeUnitCastSpellDelay(\"精神鞭笞\",\"target\");\n    return;\nend",
				}, -- [2]
			},
		},
	},

}

end