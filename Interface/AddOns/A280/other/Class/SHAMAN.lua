wowam.ClassBeeScript.SHAMAN=function()

LazyScript=LazyScript or {};
LazyScript["SHAMAN"] = {
	["List"] = {
		{
			["Name"] = "治疗萨满基础包",["Title"] = "|cff2459ff治疗萨满基础包|r",
			["Version"] = 2012020701,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 6,
					["Name"] = "极限回蓝（慎用）",["Title"] = "|cff2459ff极限回蓝（慎用）|r",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Nature_Lightning",
					["Script"] = "if   UnitCanAttack(\"player\", \"focustarget\") and BeeIsRun(\"闪电箭\",\"focustarget\")  and BeeUnitMana(\"player\",'%')<95 and BeeUnitAffectingCombat() then\n    BeeRun(\"闪电箭\",\"focustarget\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Script"] = "--坐骑状态\nif IsMounted(\"player\")==1 then\n    return;\nend\nif BeeStringFind(\"幽魂之狼\",BeeUnitBuffList(\"player\"))  then return  end",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 8,
					["Icon"] = "Interface\\Icons\\Spell_Nature_SpiritWolf",
					["Name"] = "坐骑（狼形态）不施法",["Title"] = "|cff2459ff坐骑（狼形态）不施法|r",
				}, -- [2]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "if BeeUnitMana(\"player\",\"%\",0)<98 and BeePlayerBuffTime(\"喝水\")>1\nthen \n    return;\nend",
					["GUID"] = 12,
					["Icon"] = "Interface\\Icons\\Spell_Frost_WizardMark",
					["Name"] = "安静喝水",["Title"] = "|cff2459ff安静喝水|r",
				}, -- [3]
				{
					["Enabled"] = true,
					["Name"] = "水盾、生命武器",["Title"] = "|cff2459ff水盾、生命武器|r",
					["Script"] = "if BeePlayerBuffTime(\"水之护盾\")<0  and BeeIsRun(\"水之护盾\") then\n    BeeRun(\"水之护盾\");\n    return;\nend\nif not BeeWeaponEnchantInfo(1) and BeeIsRun(\"大地生命武器\",\"player\") then BeeRun(\"大地生命武器\",\"player\");\n    return;\nelseif BeeWeaponEnchantInfo(1)  and BeeWeaponEnchantInfo(1)<300 and BeeIsRun(\"大地生命武器\",\"player\") then BeeRun(\"大地生命武器\",\"player\");\n    return;\nend",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\Ability_Shaman_WaterShield",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
				{
					["Enabled"] = 1,
					["Name"] = "焦点大地之盾",["Title"] = "|cff2459ff焦点大地之盾|r",
					["Script"] = "if BeeUnitBuff(\"大地之盾\",\"focus\",2,1)<0 and BeeIsRun(\"大地之盾\",\"focus\") then\n    BeeRun(\"大地之盾\",\"focus\");\n    return;\nend",
					["GUID"] = 4,
					["Icon"] = "Interface\\Icons\\Spell_Nature_SkinofEarth",
					["Description"] = "當滿足條件時自動施放",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Script"] = "local grouptype=\"\"\n\nif GetNumGroupMembers()>0 then\n    \n    grouptype=\"raid\"\n    \nelse\n    \n    grouptype=\"party\"\n    \nend\n\n--[[\n\nif    BeeUnitCastSpellName(\"player\")==\"治疗链\"  \nthen  \n    BeeRun(\"/stopcasting\")\n    return \nend\nif     BeeUnitCastSpellName(\"player\")==\"治疗波\"  \nthen  \n    BeeRun(\"/stopcasting\")\n    return \nend\n\n\n\n]]--\nif BeeIsRun(\"治疗之雨\",\"nogoal\")  \nthen  \n    BeeMouse(0,0,1,\"治疗之雨\");\n    return true;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！\n",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 15,
					["Icon"] = "Interface\\Icons\\Spell_Nature_GiftoftheWaterSpirit",
					["Name"] = "治疗之雨-按键宏",["Title"] = "|cff2459ff治疗之雨-按键宏|r",
				}, -- [6]
				{
					["GUID"] = 7,
					["Name"] = "打断焦点目标",["Title"] = "|cff2459ff打断焦点目标|r",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Nature_Cyclone",
					["Script"] = "local NeedBreak = \"赫希斯之耳语,愤怒,血泪,火球术,云雾冲击,冰川冲击,奥术飞弹,灵魂震击,治疗之环,生命吸取,恐惧,圣光术,快速治疗,强效治疗术,魔能火球,冰霜新星,神圣新星,治疗之触,愈合,寒冰箭雨,飓风,烈焰,治疗波,献祭,滋养,次级治疗波,苦修,变形术,暗影修补,圣光闪现,召唤太阳宝珠,黑暗契约,黑暗治疗,暗影打击,烈焰风暴,暗影愈合,寒冰箭,熔岩箭,强制之握,震爆,混乱之箭,黑暗命令,血泪,治疗链,连珠火球\"\n\nif BeeStringFind(NeedBreak,BeeUnitCastSpellName())  then\n    if BeeIsRun(\"风剪\") then\n        BeeRun(\"风剪\");\n        return;\n    end\nend",
				}, -- [7]
				{
					["GUID"] = 14,
					["Script"] = "--解除诅咒、魔法\ngrouptype=\"\";if GetNumGroupMembers()>0 then grouptype=\"raid\" else grouptype=\"party\";end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"净化灵魂\",unit)',\"BeeUnitBuffInfo(unit,2,'Magic,Curse',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>0 and BeeIsRun(\"净化灵魂\",qusan) then BeeRun(\"净化灵魂\",qusan);return;end",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Ability_Shaman_CleanseSpirit",
					["Name"] = "自动驱散",["Title"] = "|cff2459ff自动驱散|r",
				}, -- [8]
				{
					["GUID"] = 10,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "潮汐图腾（75%）",["Title"] = "|cff2459ff潮汐图腾（75%）|r",
					["Enabled"] = true,
					["Icon"] = "Interface\\Icons\\Spell_Frost_SummonWaterElemental",
					["Script"] = "if     BeeIsRun(\"法力之潮图腾\",\"nogoal\")  and BeeUnitMana(\"player\",'%')<75 and BeeUnitAffectingCombat() then\n    BeeRun(\"法力之潮图腾\",\"nogoal\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
				}, -- [9]
				{
					["Enabled"] = 1,
					["Script"] = "--图腾释放\nif  not BeeTotemType(1) and not BeeTotemType(2) and not BeeTotemType(3) and not BeeTotemType(4)  then BeeRun(\"/cast 元素的召唤\");return;end\n--补常用缺失图腾\nif not BeeTotemType(1) and  BeeIsRun(\"火舌图腾\") then BeeRun(\"火舌图腾\");return;end\nif not BeeTotemType(2) and  BeeIsRun(\"大地之力图腾\") then BeeRun(\"大地之力图腾\");return;end\nif not BeeTotemType(3) and  BeeIsRun(\"治疗之泉图腾\") then BeeRun(\"治疗之泉图腾\");return;end\nif not BeeTotemType(4) and  BeeIsRun(\"空气之怒图腾\") then BeeRun(\"空气之怒图腾\");return;end",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\Spell_Shaman_Dropall_02",
					["Name"] = "自动图腾（自行修改选择）",["Title"] = "|cff2459ff自动图腾（自行修改选择）|r",
				}, -- [10]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动开饰品",["Title"] = "|cff2459ff自动开饰品|r",
					["GUID"] = 13,
					["Icon"] = "Interface\\Icons\\inv_misc_cat_trinket04",
					["Script"] = "--自动开饰品\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
				}, -- [11]
				{
					["Enabled"] = 1,
					["Name"] = "自保模块",["Title"] = "|cff2459ff自保模块|r",
					["Script"] = "if BeeUnitHealth(\"player\",\"%\")<45 and BeeIsRun(\"治疗石\") \nthen \n    BeeRun(\"治疗石\");\n    return;\nend\nif BeeUnitHealth(\"player\",\"%\")<20 and BeeIsRun(\"奇效治疗药水\") \nthen \n    BeeRun(\"奇效治疗药水\");\n    return;\nend\nif BeeUnitHealth(\"player\",\"%\")<90 and BeeIsRun(\"生命之血\") \nthen BeeRun(\"生命之血\");\n    return;\nend\nif BeeIsRun(\"激流\",\"player\") and BeeUnitHealth(\"player\",\"%\")<40 then\n    BeeRun(\"激流\",\"player\")\n    return;\nend\nif BeeIsRun(\"元素释放\",\"player\") and BeeUnitHealth(\"player\",\"%\")<35  then\n    BeeRun(\"元素释放\",\"player\")\n    return;\nend\nif BeeIsRun(\"强效治疗波\",\"player\") and BeeUnitHealth(\"player\",\"%\")<30  then\n    BeeRun(\"强效治疗波\",\"player\")\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
					["GUID"] = 2,
					["Icon"] = "INTERFACE\\ICONS\\spell_shaman_improvedreincarnation",
					["Description"] = "當滿足條件時自動施放",
				}, -- [12]
				{
					["GUID"] = 3,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "if BeeIsRun(\"激流\",\"focus\") and BeeUnitHealth(\"focus\",\"%\")<80 then\n    BeeRun(\"激流\",\"focus\")\n    return;\nend\nif BeeIsRun(\"元素释放\",\"focus\") and BeeUnitHealth(\"focus\",\"%\")<50  then\n    BeeRun(\"元素释放\",\"focus\")\n    return;\nend\nif BeeIsRun(\"强效治疗波\",\"focus\") and BeeUnitHealth(\"focus\",\"%\")<55  then\n    BeeRun(\"强效治疗波\",\"focus\")\n    return;\nend",
					["Icon"] = "Interface\\Icons\\Spell_Nature_HealingWaveGreater",
					["Name"] = "优先保护焦点（坦克）",["Title"] = "|cff2459ff优先保护焦点（坦克）|r",
				}, -- [13]
				{
					["Enabled"] = 1,
					["Script"] = "local grouptype=\"\"\n\nif GetNumGroupMembers()>0 then\n    \n    grouptype=\"raid\"\n    \nelse\n    \n    grouptype=\"party\"\n    \nend\n\n\n\nif BeeUnitCastSpellName(\"player\")==\"治疗之雨\" \nthen \n    return;\nend\nif   UnitCanAttack(\"player\", \"focustarget\") and BeeIsRun(\"闪电箭\",\"focustarget\")  and BeeUnitMana(\"player\",'%')<10 and BeeUnitAffectingCombat() then\n    BeeRun(\"闪电箭\",\"focustarget\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n--激流部分\nlocal SSZJ = BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>10000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\n\nif SSZJ and BeeIsRun(\"激流\",SSZJ)  \nthen \n    BeeRun(\"激流\",SSZJ);\n    return; \nend\n\nif SSZJ and BeeIsRun(\"元素释放\",SSZJ)  \nthen \n    BeeRun(\"元素释放\",SSZJ);\n    return; \nend\n\n\n\n\n--团刷技能\n\n\nm,SGPZ = BeeGroupCountScript('BeeRange(unit)<=40',\" BeeUnitHealth(unit,'%')<95 and not UnitIsDeadOrGhost(unit)\",grouptype) \n\nif  m>=3 and BeeUnitMana(\"player\",'%')>10 and BeeUnitCastSpellName(\"player\")==\"闪电箭\"\nthen \n    BeeRun(\"/stopcasting\")\n    return\nend\n\nif   m>=3 and BeeIsRun(\"治疗链\",SGPZ) \nthen \n    BeeRun(\"治疗链\",SGPZ);\n    return;\nend\n\n\nif  m<=1 and UnitCanAttack(\"player\", \"focustarget\") and BeeIsRun(\"闪电箭\",\"focustarget\")  and BeeUnitMana(\"player\",'%')<90 and BeeUnitAffectingCombat() then\n    BeeRun(\"闪电箭\",\"focustarget\")\n    BeeUnitCastSpellDelay(\"闪电箭\",3);\n    return;\nend\n\n\n\nlocal SGS = BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>15000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\nif SGS and m<=2 and BeePlayerBuffTime(\"潮汐奔涌\")>0 and BeeIsRun(\"治疗波\",SGS)  \nthen\n    BeeRun(\"治疗波\",SGS);\n    BeeUnitCastSpellDelay(\"治疗波\",2)\n    return; \nend\n\n--潮汐奔涌部分\n\nlocal SSZG = BeeGroupMinScript('BeeRange(unit)<=40  and BeeUnitHealth(unit,nil,1)>65000 and UnitCanAssist(\"player\",unit) and not UnitIsDeadOrGhost(unit)',\"BeeUnitHealth(unit)\",grouptype)\n\nif SSZG and BeePlayerBuffTime(\"潮汐奔涌\")>0 and BeeIsRun(\"强效治疗波\",SSZG)  \nthen\n    BeeRun(\"强效治疗波\",SSZG);\n    BeeUnitCastSpellDelay(\"强效治疗波\",2)\n    return; \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.20   freedom出品，必属精品！",
					["Name"] = "团补攻略",["Title"] = "|cff2459ff团补攻略|r",
					["GUID"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Nature_HealingWaveGreater",
					["Description"] = "當滿足條件時自動施放",
				}, -- [14]
    		},
		},
		{
			["Name"] = "增强萨满基础包",["Title"] = "|cff2459ff增强萨满基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--CTM 4.2 增强萨满输出脚本 2011/11/5 by ATM\n--骑乘状态\nif IsMounted()==1 then return;end",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Name"] = "骑乘状态",["Title"] = "|cff2459ff骑乘状态|r",
				}, -- [1]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "插入技能",["Title"] = "|cff2459ff插入技能|r",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\Ability_Creature_Cursed_02",
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
				}, -- [2]
				{
					["Enabled"] = 1,
					["Script"] = "--保命\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\nif BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"奇效治疗药水\") then BeeRun(\"奇效治疗药水\");return;end\nif BeeUnitHealth(\"player\",\"%\")<95 and BeeIsRun(\"纳鲁的赐福\",\"player\") then BeeRun(\"纳鲁的赐福\",\"player\");return;end\n",
					["Name"] = "优先保命",["Title"] = "|cff2459ff优先保命|r",
					["GUID"] = 2,
					["Icon"] = "Interface\\Icons\\Ability_Mage_ShatterShield",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["GUID"] = 3,
					["Name"] = "自动补BUFF",["Title"] = "|cff2459ff自动补BUFF|r",
					["Script"] = "--自动补BUFF\nif not BeeWeaponEnchantInfo(1) and BeeIsRun(\"风怒武器\",\"player\") then BeeRun(\"风怒武器\",\"player\");return;end\nif  BeeWeaponEnchantInfo(1)<60 and BeeIsRun(\"风怒武器\",\"player\") then BeeRun(\"风怒武器\",\"player\");return;end\nif not BeeWeaponEnchantInfo(2) and BeeIsRun(\"火舌武器\",\"player\") then BeeRun(\"火舌武器\",\"player\");return;end\nif BeeWeaponEnchantInfo(2)<60 and BeeIsRun(\"火舌武器\",\"player\") then BeeRun(\"火舌武器\",\"player\");return;end\n--护盾\nif not BeeStringFind(\"闪电之盾,大地之盾,水之护盾\",BeeUnitBuffList(\"player\")) and BeeIsRun(\"闪电之盾\",\"player\") then BeeRun(\"闪电之盾\",\"player\");return;end",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\spell_Shaman_Unleashweapon_Flame",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "协助焦点T",["Title"] = "|cff2459ff协助焦点T|r",
					["GUID"] = 10,
					["Icon"] = "Interface\\Icons\\Ability_Warrior_ColossusSmash",
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat() and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\")) then return;end",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Script"] = "local daduan=\"寒冰箭雨,星尘,腐臭蜂群,邪能烈焰,绝对服从,奥术波动,饥饿暗影,精神鞭笞,暗影钻削,暮光冲击波,甜美的摇篮曲,寒冰手,寒冰箭,火球术,穿刺,冰霜之箭,时间漩涡\";\nif BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\")) and BeeIsRun(\"风剪\",\"target\")  then BeeRun(\"风剪\",\"target\");return;end",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 4,
					["Icon"] = "Interface\\Icons\\Spell_Nature_ElementalAbsorption",
					["Name"] = "自动打断",["Title"] = "|cff2459ff自动打断|r",
				}, -- [6]
				{
					["GUID"] = 5,
					["Script"] = "--解除诅咒\ngrouptype=\"\";if GetNumGroupMembers()>0 then grouptype=\"raid\" else grouptype=\"party\";end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"净化灵魂\",unit)',\"BeeUnitBuffInfo(unit,2,'Curse',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>0 and BeeIsRun(\"净化灵魂\",qusan) then BeeRun(\"净化灵魂\",qusan);return;end",
					["Name"] = "自动驱散",["Title"] = "|cff2459ff自动驱散|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\ABILITY_POISONSTING",
					["Description"] = "當滿足條件時自動施放",
				}, -- [7]
				{
					["Enabled"] = 1,
					["Script"] = "--图腾释放\nif UnitCanAttack(\"player\",\"target\") and CheckInteractDistance(\"target\",4) and not BeeTotemType(1) and not BeeTotemType(3) and not BeeTotemType(4) and BeeIsRun(\"元素的召唤\") then BeeRun(\"元素的召唤\");return;end",
					["Name"] = "图腾施放",["Title"] = "|cff2459ff图腾施放|r",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Spell_Nature_Brilliance",
					["Description"] = "當滿足條件時自動施放",
				}, -- [8]
				{
					["Enabled"] = 1,
					["Name"] = "自动开饰品",["Title"] = "|cff2459ff自动开饰品|r",
					["Script"] = "--自动开饰品\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
					["GUID"] = 8,
					["Icon"] = "Interface\\Icons\\Spell_Misc_Drink",
					["Description"] = "當滿足條件時自動施放",
				}, -- [9]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "增强输出",["Title"] = "|cff2459ff增强输出|r",
					["GUID"] = 7,
					["Icon"] = "Interface\\Icons\\Spell_Nature_LightningShield",
					["Script"] = "--输出\n--萨满之怒CD好就用\nif BeeUnitAffectingCombat() and BeeIsRun(\"萨满之怒\",\"nogoal\") then BeeRun(\"萨满之怒\",\"nogoal\");return;end\n--1 ST_0 灼热图腾剩余0跳 \nif BeeTotem(\"灼热图腾\")<3 and UnitCanAttack(\"player\",\"target\") and CheckInteractDistance(\"target\",4) then BeeRun(\"灼热图腾\");return;end\n--2 SS 风暴打击 \nif BeeIsRun(\"风暴打击\",\"target\")  then BeeRun(\"风暴打击\");return;end\n--3 LL 熔岩暴击 \nif BeeIsRun(\"熔岩猛击\",\"target\") then BeeRun(\"熔岩猛击\",\"target\");return;end\n--4 MW5_LB 5层气漩武器闪电箭\nif BeePlayerBuffCount(\"漩涡武器\")==5 and  BeeIsRun(\"闪电箭\",\"target\") then BeeRun(\"闪电箭\");return;end \n--5 FS_UEF 释放火舌能量存在时烈焰震击 \nif BeeIsRun(\"烈焰震击\") and BeeTargetDeBuffTime(\"火焰释放\")>0  then  BeeRun(\"烈焰震击\");return;end\n--6 UE 释放元素能量 \nif BeeIsRun(\"元素释放\",\"target\")  then BeeRun(\"元素释放\");return;end\n--7 ES 大地震击 \nif BeeIsRun(\"大地震击\",\"target\")  then BeeRun(\"大地震击\");return;end\n--8 SW 野性之魂\nif BeeUnitAffectingCombat() and BeeIsRun(\"野性狼魂\",\"nogoal\")  then BeeRun(\"野性狼魂\",\"nogoal\");return;end \n--9 ST 灼热图腾(在Sim中设置剩余X跳) \n--10 MW2_LB 2层气漩武器闪电箭 \nif BeePlayerBuffCount(\"漩涡武器\")==2 and BeeIsRun(\"闪电箭\",\"target\") then BeeRun(\"闪电箭\");return;end ",
				}, -- [10]
			},
		},
		{
		    ["Name"] = "元素萨满基础包",["Title"] = "|cff2459ff元素萨满基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
			{
					["GUID"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--CTM 4.3 元素萨满输出脚本 2011/12/25 by ATM\n--骑乘状态\nif IsMounted()==1 then return;end",
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Name"] = "骑乘状态",["Title"] = "|cff2459ff骑乘状态|r",
				}, -- [1]
				{
					["GUID"] = 2,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "插入技能",["Title"] = "|cff2459ff插入技能|r",
					["Icon"] = "Interface\\Icons\\Ability_Creature_Cursed_02",
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
				}, -- [2]
				{
					["GUID"] = 3,
					["Script"] = "--保命\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"player\",\"%\")<10 and BeeIsRun(\"奇效治疗药水\") then BeeRun(\"奇效治疗药水\");return;end\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"player\",\"%\")<95 and BeeIsRun(\"纳鲁的赐福\",\"player\") then BeeRun(\"纳鲁的赐福\",\"player\");return;end\n",
					["Name"] = "优先保命",["Title"] = "|cff2459ff优先保命|r",
					["Icon"] = "Interface\\Icons\\Ability_Mage_ShatterShield",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["GUID"] = 4,
					["Script"] = "--自动补BUFF\nif not BeeWeaponEnchantInfo(1) and BeeIsRun(\"火舌武器\",\"player\") then BeeRun(\"火舌武器\",\"player\");return;end\nif BeeWeaponEnchantInfo(1)<60 and BeeIsRun(\"火舌武器\",\"player\") then BeeRun(\"火舌武器\",\"player\");return;end\nif BeeUnitMana(\"player\")<2000 and not BeeStringFind(\"水之护盾\",BeeUnitBuffList(\"player\")) and BeeIsRun(\"水之护盾\",\"player\") then BeeRun(\"水之护盾\",\"player\");return;end\nif not BeeStringFind(\"闪电之盾,大地之盾,水之护盾\",BeeUnitBuffList(\"player\")) and BeeIsRun(\"闪电之盾\",\"player\") then BeeRun(\"闪电之盾\",\"player\");return;end",
					["Name"] = "自动补BUFF",["Title"] = "|cff2459ff自动补BUFF|r",
					["Icon"] = "Interface\\Icons\\spell_Shaman_Unleashweapon_Flame",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
				{
					["GUID"] = 5,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "协助焦点T",["Title"] = "|cff2459ff协助焦点T|r",
					["Icon"] = "Interface\\Icons\\Ability_Warrior_ColossusSmash",
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat()and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\")) then return;end",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Script"] = "local daduan=\"寒冰箭雨,星尘,腐臭蜂群,邪能烈焰,绝对服从,奥术波动,饥饿暗影,精神鞭笞,暗影钻削,暮光冲击波,甜美的摇篮曲,寒冰手,寒冰箭,火球术,穿刺,冰霜之箭,时间漩涡\";\nif BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\")) and BeeIsRun(\"风剪\",\"target\")  then BeeRun(\"风剪\",\"target\");return;end",
					["Name"] = "自动打断",["Title"] = "|cff2459ff自动打断|r",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Spell_Nature_ElementalAbsorption",
					["Description"] = "當滿足條件時自動施放",
				}, -- [6]
				{
					["GUID"] = 7,
					["Script"] = "--解除诅咒\ngrouptype=\"\";if GetNumGroupMembers()>0 then grouptype=\"raid\" else grouptype=\"party\";end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"净化灵魂\",unit)',\"BeeUnitBuffInfo(unit,2,'Curse',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif n>0 and BeeIsRun(\"净化灵魂\",qusan) then BeeRun(\"净化灵魂\",qusan);return;end\n--净化目标\n--if BeeUnitBuffInfo(\"target\",2,\"Magic\",1)>=1 and BeeIsRun(\"净化术\",\"target\") then BeeRun(\"净化术\",\"target\") return;end",
					["Name"] = "自动驱散",["Title"] = "|cff2459ff自动驱散|r",
					["Icon"] = "Interface\\Icons\\ABILITY_POISONSTING",
					["Description"] = "當滿足條件時自動施放",
				}, -- [7]
				{
					["GUID"] = 8,
					["Script"] = "--图腾释放\nif CheckInteractDistance(\"target\",4) and not BeeTotemType(1) and not BeeTotemType(2) and not BeeTotemType(3) and not BeeTotemType(4)  then BeeRun(\"/cast 元素的召唤\");return;end\n--补常用缺失图腾\nif not BeeTotemType(1) and  BeeIsRun(\"灼热图腾\") then BeeRun(\"灼热图腾\");return;end\nif not BeeTotemType(2) and  BeeIsRun(\"大地之力图腾\") then BeeRun(\"大地之力图腾\");return;end\nif not BeeTotemType(3) and  BeeIsRun(\"法力之泉图腾\") then BeeRun(\"法力之泉图腾\");return;end\nif not BeeTotemType(4) and  BeeIsRun(\"空气之怒图腾\") then BeeRun(\"空气之怒图腾\");return;end",
					["Name"] = "图腾施放",["Title"] = "|cff2459ff图腾施放|r",
					["Icon"] = "Interface\\Icons\\Spell_Nature_Brilliance",
					["Description"] = "當滿足條件時自動施放",
				}, -- [8]
				{
					["Enabled"] = 1,
					["Name"] = "自动开饰品",["Title"] = "|cff2459ff自动开饰品|r",
					["Script"] = "--自动开饰品\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end\n",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\Spell_Misc_Drink",
					["Description"] = "當滿足條件時自動施放",
				}, -- [9]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "元素输出(单体)",["Title"] = "|cff2459ff元素输出(单体)|r",
					["GUID"] = 10,
					["Icon"] = "Interface\\Icons\\Spell_Nature_Lightning",
					["Script"] = "--元素掌握CD好就放\nif BeeUnitAffectingCombat() and BeeIsRun(\"元素掌握\",\"nogoal\") then BeeRun(\"元素掌握\",\"nogoal\");return;end\n\n--移动\nif GetUnitSpeed(\"player\")>0  and BeePlayerBuffTime(\"熔火之羽\")<=0 then\n    if BeeIsRun(\"灵魂行者的恩赐\") then BeeRun(\"灵魂行者的恩赐\");return;end\n    if BeeIsRun(\"烈焰震击\") then BeeRun(\"烈焰震击\");return;end\n    if BeeIsRun(\"元素释放\") then BeeRun(\"元素释放\");return;end\n    if BeeUnitAffectingCombat() and BeeRange(\"target\") <10 and BeeIsRun(\"雷霆风暴\",\"nogoal\") then BeeRun(\"雷霆风暴\",\"nogoal\");return;end\nend\n--输出\n--放下火系图腾(能放火元素放火元素，没火元素放灼热图腾)\nif BeeUnitAffectingCombat() and BeeTotem(\"火元素图腾\")<0 and BeeIsRun(\"火元素图腾\") then BeeRun(\"火元素图腾\");return;end\nif BeeUnitAffectingCombat() and BeeTotem(\"火元素图腾\")<0 and BeeTotem(\"灼热图腾\")<3 and UnitCanAttack(\"player\",\"target\") and CheckInteractDistance(\"target\",4) then BeeRun(\"灼热图腾\");return;end\n--保持目标身上的烈焰震击\nif BeeTargetDeBuffTime(\"烈焰震击\")<1 and BeeIsRun(\"烈焰震击\") then BeeRun(\"烈焰震击\");return;end\n--熔岩爆发(CD好就放)\nif BeeIsRun(\"熔岩爆裂\") then BeeRun(\"熔岩爆裂\");return;end\n--大地震击(7-9层闪电之盾)\nif BeePlayerBuffCount(\"闪电之盾\")>7 and BeeIsRun(\"大地震击\") then  BeeRun(\"大地震击\");return;end\n--闪电箭填充\nif BeeIsRun(\"闪电箭\") then BeeRun(\"闪电箭\");return;end",
				}, -- [10]
				{
					["GUID"] = 11,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "元素输出(AOE)",["Title"] = "|cff2459ff元素输出(AOE)|r",
					["Icon"] = "Interface\\Icons\\Spell_Shaman_ThunderStorm",
					["Script"] = "--AOE\n--元素掌握CD好就放\nif BeeUnitAffectingCombat() and BeeIsRun(\"元素掌握\",\"nogoal\") then BeeRun(\"元素掌握\",\"nogoal\");return;end\n--移动\nif GetUnitSpeed(\"player\")>0  and BeePlayerBuffTime(\"熔火之羽\")<=0 then\n    if BeeIsRun(\"灵魂行者的恩赐\") then BeeRun(\"灵魂行者的恩赐\");return;end\n    if BeeIsRun(\"烈焰震击\") then BeeRun(\"烈焰震击\");return;end\n    if BeeIsRun(\"元素释放\") then BeeRun(\"元素释放\");return;end\n    if BeeUnitAffectingCombat() and BeeRange(\"target\") <8 and BeeIsRun(\"雷霆风暴\",\"nogoal\") then BeeRun(\"雷霆风暴\",\"nogoal\");return;end\nend\n--输出\n--放下火系图腾(能放火元素放火元素，没火元素放灼热图腾)\nif BeeUnitAffectingCombat() and BeeTotem(\"火元素图腾\")<0 and BeeIsRun(\"火元素图腾\") then BeeRun(\"火元素图腾\");return;end\nif BeeUnitAffectingCombat() and BeeTotem(\"火元素图腾\")<0 and BeeTotem(\"熔岩图腾\")<3 and UnitCanAttack(\"player\",\"target\") and CheckInteractDistance(\"target\",4) then BeeRun(\"熔岩图腾\");return;end\n--保持目标身上的烈焰震击\nif BeeTargetDeBuffTime(\"烈焰震击\")<1 and BeeIsRun(\"烈焰震击\") then BeeRun(\"烈焰震击\");return;end\n--烈焰震击\nif BeeTargetDeBuffTime(\"烈焰震击\")>1 and BeeIsRun(\"火焰新星\") then BeeRun(\"火焰新星\");return;end\n--熔岩爆发(CD好就放)\nif BeeIsRun(\"熔岩爆裂\") then BeeRun(\"熔岩爆裂\");return;end\n--大地震击(7-9层闪电之盾)\nif BeePlayerBuffCount(\"闪电之盾\")>=7 and BeeIsRun(\"大地震击\") then  BeeRun(\"大地震击\");return;end\n--闪电链填充\nif BeeIsRun(\"闪电链\") then BeeRun(\"闪电链\");return;end\n",
				}, -- [11]
			},
		},
	},
}
end