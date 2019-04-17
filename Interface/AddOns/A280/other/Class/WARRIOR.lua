wowam.ClassBeeScript.WARRIOR=function()

LazyScript=LazyScript or {};
LazyScript["WARRIOR"] = {
	["List"] = {
		{
			["Name"] = "武器战基础包",["Title"] = "|cffc79c6e武器战基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = true,
					["Script"] = "if BeeCastSpellFast() then return;end",
					["Name"] = "优先执行",["Title"] = "|cffc79c6e优先执行|r",
					["GUID"] = 14,
					["Icon"] = "Interface\\Icons\\Ability_Creature_Cursed_02",
					["Description"] = "當滿足條件時自動施放",
				}, -- [1]
				{
					["GUID"] = 1,
					["Name"] = "坐骑状态",["Title"] = "|cffc79c6e坐骑状态|r",
					["Script"] = "--坐骑状态\nif IsMounted(\"player\")==1 then\n    return;\nend\n",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Magic_PolymorphChicken",
					["Description"] = "當滿足條件時自動施放",
				}, -- [2]
				{
					["GUID"] = 2,
					["Name"] = "狂暴之怒解负面效果",["Title"] = "|cffc79c6e狂暴之怒解负面效果|r",
					["Script"] = "local bufflist = BeeUnitBuffList(\"player\")\n--自动解负面效果\nif BeeStringFind(\"恐惧,心灵尖啸,恐惧嚎叫,闷棍,瘫痪,破胆怒吼,恐惧术,忏悔,恐慌,恐吓,梦魇乍醒,恐惧畏缩,低沉咆哮,煽动惊恐\",bufflist) and BeeIsRun(\"狂暴之怒\",\"nogoal\") then\n    BeeRun(\"狂暴之怒\",\"nogoal\");\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Druid_MasterShapeshifter",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["Enabled"] = 1,
					["Name"] = "自动保命",["Title"] = "|cffc79c6e自动保命|r",
					["Script"] = "--自动保命\nif BeeUnitAffectingCombat() then\n    if UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.51 and BeeIsRun(\"狂暴之怒\") then\n        BeeRun(\"狂暴之怒\");\n        return;\n    elseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.50 and BeeStringFind(\"激怒\",BeeUnitBuffList(\"player\")) and BeeIsRun(\"狂怒回复\") then\n        BeeRun(\"狂怒回复\");\n        return;\n    elseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.45 and BeeIsRun(\"治疗石\") then\n        BeeRun(\"治疗石\");\n        return;\n    elseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.30 and BeeIsRun(\"集结呐喊\") then\n        BeeRun(\"集结呐喊\");\n        return;\n    end\nend",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\INV_Axe_66",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
				{
					["GUID"] = 4,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动怒吼",["Title"] = "|cffc79c6e自动怒吼|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Hunter_Efficiency",
					["Script"] = "local bufflist = BeeUnitBuffList(\"player\")\n--自动怒吼\nif BeeIsRun(\"战斗怒吼\",\"nogoal\") and BeeUnitBuff(\"战斗怒吼\",\"player\",0,1)<0 and not BeeStringFind(\"战斗怒吼\",bufflist) then\n    BeeRun(\"战斗怒吼\");\n    return;\nend",
				}, -- [5]
				{
					["GUID"] = 5,
					["Name"] = "自动寻找目标",["Title"] = "|cffc79c6e自动寻找目标|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Hunter_FocusedAim",
					["Script"] = "--攻击最近的目标\nif not UnitExists(\"target\") and not UnitIsDead(\"player\") then\n    if BeeAttack(0,0) then\n        return;\n    end\nend",
				}, -- [6]
				{
					["GUID"] = 15,
					["Script"] = "local NeedBreak = \"吸血术,巫毒箭,冲击新星,堕落,膜拜,衰弱光线,黑暗造物,变节,闪电震爆,硬化外皮,水流长枪,奥术风暴,奥术歼灭者,愤怒,远古能量,驯服,赫希斯之耳语,血泪,暗影新星,火球术,云雾冲击,冰川冲击,奥术飞弹,灵魂震击,治疗之环,生命吸取,恐惧,魔能火球,冰霜新星,神圣新星,寒冰箭雨,飓风,烈焰,献祭,变形术,暗影修补,召唤太阳宝珠,黑暗契约,黑暗治疗,暗影打击,烈焰风暴,暗影愈合,寒冰箭,熔岩箭,强制之握,震爆,混乱之箭,连珠火球,圣光术,滋养,宁静,治疗之触,愈合,苦修,强效治疗术,治疗祷言,光明之泉,神圣赞美诗,希望圣歌,联结治疗,治疗波,治疗链,强效治疗波,光明之泉,神圣之光,圣光闪现,快速治疗,治疗之涌,精神鞭笞,心灵震爆,心灵尖刺,闪电箭,闪电链,熔岩爆裂\"\n\nif BeeStringFind(NeedBreak,BeeUnitCastSpellName()) and not BeeStringFind(\"光环掌握,心灵专注,保护祝福,圣盾术,保护之手\",BeeUnitBuffList(\"target\")) and BeeIsRun(\"拳击\") then\n    BeeRun(\"拳击\");\n    return;\nend\n\nif BeeStringFind(NeedBreak,BeeUnitCastSpellName()) and not BeeStringFind(\"保护祝福,圣盾术,保护之手\",BeeUnitBuffList(\"target\")) and BeeIsRun(\"击倒\") then\n    BeeRun(\"击倒\");\n    return;\nend\n\nif BeeStringFind(NeedBreak,BeeUnitCastSpellName()) and not BeeStringFind(\"保护祝福,圣盾术,保护之手\",BeeUnitBuffList(\"target\")) and BeeIsRun(\"破胆怒吼\") then\n    BeeRun(\"破胆怒吼\");\n    return;\nend",
					["Name"] = "PVP打断",["Title"] = "|cffc79c6ePVP打断|r",
					["Icon"] = "Interface\\Icons\\INV_Misc_Note_05",
					["Description"] = "當滿足條件時自動施放",
				}, -- [7]
				{
					["GUID"] = 12,
					["Script"] = "if BeeUnitAffectingCombat() and BeeIsRun(\"致命平静\") then\n    BeeRun(\"致命平静\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeIsRun(\"鲁莽\") then\n    BeeRun(\"鲁莽\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeStringFind(\"致命平静,鲁莽\",BeeUnitBuffList(\"player\")) and BeeIsRun(\"冷酷角斗士的胜利徽章\") then\n    BeeRun(\"冷酷角斗士的胜利徽章\");\n    return;\nend",
					["Name"] = "PVP平静",["Title"] = "|cffc79c6ePVP平静|r",
					["Icon"] = "Interface\\Icons\\Ability_Warrior_WarCry",
					["Description"] = "當滿足條件時自動施放",
				}, -- [8]
				{
					["GUID"] = 11,
					["Script"] = "if BeeIsRun(\"碎裂投掷\") and BeeStringFind(\"圣盾术,寒冰屏障,保护之手\",BeeUnitBuffList(\"target\")) then \n    BeeRun(\"碎裂投掷\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeIsRun(\"缴械\") then\n    BeeRun(\"缴械\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.75 and BeeIsRun(\"乘胜追击\") then\n    BeeRun(\"乘胜追击\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeIsRun(\"盾牌格挡\") then\n    BeeRun(\"盾牌格挡\");\n    return;\nend\n\nif BeeUnitBuff(\"断筋\",\"target\",0,2)<2 and not BeeStringFind(\"圣盾术,保护之手,深度冻结,圣佑术,暗影斗篷,自由之手,速,减速药膏,冲击波,眩晕,剑刃风暴\",BeeUnitBuffList(\"target\")) and BeeIsRun(\"断筋\") then\n    BeeRun(\"断筋\");\n    return;\nend\n\nif BeeUnitBuff(\"撕裂\",\"target\",0,2)<2 and not BeeStringFind(\"圣盾术,保护之手,深度冻结,圣佑术,暗影斗篷\",BeeUnitBuffList(\"target\")) and BeeIsRun(\"撕裂\") then\n    BeeRun(\"撕裂\");\n    return;\nend\n\nif BeeIsRun(\"冷酷角斗士的板甲手套\") then\n    BeeRun(\"冷酷角斗士的板甲手套\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeIsRun(\"致死打击\") then\n    BeeRun(\"致死打击\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and (BeeStringFind(\"致命平静\",BeeUnitBuffList(\"player\")) or BeeUnitMana()>70) and BeeUnitHealth(\"target\",\"%\")>1 and BeeSpellCD(\"英勇打击\")<=0 then\n    BeeRun(\"英勇打击\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeIsRun(\"压制\") then\n    BeeRun(\"压制\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeTargetDeBuffTime(\"巨人打击\")<1 and BeeIsRun(\"巨人打击\",\"target\") then\n    BeeRun(\"巨人打击\",\"target\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"target\",\"%\")<10 and BeeIsRun(\"斩杀\") then\n    BeeRun(\"斩杀\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeIsRun(\"英勇投掷\") then BeeRun(\"英勇投掷\");\n    return;\nend",
					["Name"] = "PVP",["Title"] = "|cffc79c6ePVP|r",
					["Icon"] = "Interface\\Icons\\Ability_BackStab",
					["Description"] = "當滿足條件時自動施放",
				}, -- [9]
				{
					["GUID"] = 6,
					["Script"] = "local spellzj, _, _, _, _, _, _, ddzj = UnitCastingInfo(\"target\")\n\nif BeeUnitAffectingCombat() and ddzj == 0 and BeeIsRun(\"拳击\",\"target\") and BeeRange(\"target\")<40 then BeeRun(\"拳击\",\"target\");return;end",
					["Name"] = "自动打断敌方施法",["Title"] = "|cffc79c6e自动打断敌方施法|r",
					["Icon"] = "Interface\\Icons\\Ability_Hunter_FocusFire",
					["Description"] = "當滿足條件時自動施放",
				}, -- [10]
				{
					["GUID"] = 7,
					["Name"] = "致命平静",["Title"] = "|cffc79c6e致命平静|r",
					["Script"] = "if BeeUnitAffectingCombat() and BeeIsRun(\"致命平静\") then\n    BeeRun(\"致命平静\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeIsRun(\"鲁莽\") then\n    BeeRun(\"鲁莽\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and BeeIsRun(\"熔火巨人手甲\") then\n    BeeRun(\"熔火巨人手甲\");\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Hunter_MasterTactitian",
					["Description"] = "當滿足條件時自動施放",
				}, -- [11]
				{
					["GUID"] = 16,
					["Script"] = "if BeeUnitAffectingCombat() and BeeUnitBuffsSpells(\"target\",\"破甲攻击\",\"英勇投掷\",true) and BeeIsRun(\"英勇投掷\") then BeeRun(\"英勇投掷\");\n    return;\nend",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Shadow_ShadowBolt",
					["Name"] = "英勇投掷",["Title"] = "|cffc79c6e英勇投掷|r",
				}, -- [12]
				{
					["GUID"] = 8,
					["Script"] = "if BeeUnitAffectingCombat() and BeeIsRun(\"怒火中烧\") then\n    BeeRun(\"怒火中烧\");\n    return;\nend",
					["Name"] = "怒火中烧",["Title"] = "|cffc79c6e怒火中烧|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\ABILITY_HUNTER_MASTERSCALL",
					["Description"] = "當滿足條件時自動施放",
				}, -- [13]
				{
					["GUID"] = 9,
					["Name"] = "核心循环(必选)",["Title"] = "|cffc79c6e核心循环(必选)|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_BackStab",
					["Script"] = "if BeeUnitBuffCount(\"泰坦能量\",\"player\")==5 and BeeIsRun(\"卡兹格罗斯的仪器\") then\n    BeeRun(\"卡兹格罗斯的仪器\")\n    return;\nend\n\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.75 and BeeIsRun(\"乘胜追击\") then\n    BeeRun(\"乘胜追击\");\n    return;\nend\n\nif BeeUnitBuff(\"撕裂\",\"target\",0,2)<2 and not BeeStringFind(\"圣盾术,保护之手,深度冻结,圣佑术,暗影斗篷\",BeeUnitBuffList(\"target\")) and BeeIsRun(\"撕裂\") then\n    BeeRun(\"撕裂\");\n    return;\nend\n\nif BeeIsRun(\"战斗怒吼\") then\n    BeeRun(\"战斗怒吼\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and (BeeStringFind(\"致命平静\",BeeUnitBuffList(\"player\")) or BeeUnitMana()>70 or BeeStringFind(\"战斗专注\",BeeUnitBuffList(\"player\")) or BeeStringFind(\"激动\",BeeUnitBuffList(\"player\"))) and BeeIsRun(\"英勇打击\") then\n    BeeRun(\"英勇打击\");\n    return;\nend\n\nif BeeTargetDeBuffTime(\"巨人打击\")<1 and BeeIsRun(\"巨人打击\",\"target\") then\n    BeeRun(\"巨人打击\",\"target\");\n    return;\nend\n\nif BeeUnitBuff(\"行刑者\",\"player\",0,1)>=2 and  BeeUnitBuffCount(\"行刑者\",\"player\",0,1)>=5 and BeeIsRun(\"致死打击\") then\n    BeeRun(\"致死打击\");\n    return;\nend\n\nif BeeUnitBuff(\"行刑者\",\"player\",0,1)>=2 and  BeeUnitBuffCount(\"行刑者\",\"player\",0,1)>=5 and BeeIsRun(\"压制\") then\n    BeeRun(\"压制\");\n    return;\nend\n\nif BeeUnitBuff(\"行刑者\",\"player\",0,1)>=2 and  BeeUnitBuffCount(\"行刑者\",\"player\",0,1)>=5 and BeeIsRun(\"猛击\") then\n    BeeRun(\"猛击\");\n    return;\nend\n\nif BeeIsRun(\"斩杀\") then\n    BeeRun(\"斩杀\");\n    return;\nend\n\nif BeeIsRun(\"致死打击\") then\n    BeeRun(\"致死打击\");\n    return;\nend\n\nif BeeIsRun(\"压制\") then\n    BeeRun(\"压制\");\n    return;\nend\n\nif BeeIsRun(\"猛击\") then\n    BeeRun(\"猛击\");\n    return;\nend",
				}, -- [14]
    		},
		},
		{
			["Name"] = "狂暴战基础包",["Title"] = "|cffc79c6e狂暴战基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "优先执行",["Title"] = "|cffc79c6e优先执行|r",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\Ability_Warrior_WarCry",
					["Script"] = "if BeeCastSpellFast() then return;end",
				}, -- [1]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "坐骑姿态",["Title"] = "|cffc79c6e坐骑姿态|r",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\INV_Helmet_23",
					["Script"] = "--坐骑状态\nif IsMounted(\"player\")==1 then\n    return;\nend\n",
				}, -- [2]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动保命",["Title"] = "|cffc79c6e自动保命|r",
					["GUID"] = 7,
					["Icon"] = "INTERFACE\\ICONS\\inv_chest_chain_06",
					["Script"] = "--自动保命\nif BeeUnitAffectingCombat() then\n    if UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.51 and BeeIsRun(\"狂暴之怒\") then\n        BeeRun(\"狂暴之怒\");\n        return;\n    elseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.50 and BeeStringFind(\"激怒\",BeeUnitBuffList(\"player\")) and BeeIsRun(\"狂怒回复\") then\n        BeeRun(\"狂怒回复\");\n        return;\n    elseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.45 and BeeIsRun(\"治疗石\") then\n        BeeRun(\"治疗石\");\n        return;\n    elseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.30 and BeeIsRun(\"集结呐喊\") then\n        BeeRun(\"集结呐喊\");\n        return;\n    end\nend",
				}, -- [3]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动怒吼",["Title"] = "|cffc79c6e自动怒吼|r",
					["GUID"] = 8,
					["Icon"] = "Interface\\Icons\\Ability_Warrior_WarCry",
					["Script"] = "local bufflist = BeeUnitBuffList(\"player\")\n--自动怒吼\nif BeeIsRun(\"战斗怒吼\",\"nogoal\") and BeeUnitBuff(\"战斗怒吼\",\"player\",0,1)<0 and not BeeStringFind(\"战斗怒吼\",bufflist) then\n    BeeRun(\"战斗怒吼\");\n    return;\nend",
				}, -- [4]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动寻找目标",["Title"] = "|cffc79c6e自动寻找目标|r",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\inv_spear_05",
					["Script"] = "--攻击最近的目标\nif not UnitExists(\"target\") and not UnitIsDead(\"player\") then\n    if BeeAttack(0,0) then\n        return;\n    end\nend",
				}, -- [5]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "自动怒火中烧",["Title"] = "|cffc79c6e自动怒火中烧|r",
					["GUID"] = 10,
					["Icon"] = "Interface\\Icons\\INV_Axe_02",
					["Script"] = "if BeeUnitAffectingCombat() and BeeIsRun(\"怒火中烧\") then\n    BeeRun(\"怒火中烧\");\n    return;\nend",
				}, -- [6]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "鲁莽",["Title"] = "|cffc79c6e鲁莽|r",
					["GUID"] = 11,
					["Icon"] = "Interface\\Icons\\Racial_Orc_BerserkerStrength",
					["Script"] = "if BeeUnitAffectingCombat() and BeeIsRun(\"鲁莽\") then\n    BeeRun(\"鲁莽\");\n    return;\nend",
				}, -- [7]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "死亡之愿",["Title"] = "|cffc79c6e死亡之愿|r",
					["GUID"] = 12,
					["Icon"] = "Interface\\Icons\\INV_Helmet_23",
					["Script"] = "if BeeUnitAffectingCombat() and BeeIsRun(\"死亡之愿\") then\n    BeeRun(\"死亡之愿\");\n    return;\nend",
				}, -- [8]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "饰品工程等",["Title"] = "|cffc79c6e饰品工程等|r",
					["GUID"] = 13,
					["Icon"] = "Interface\\Icons\\INV_Axe_02",
					["Script"] = "if BeeUnitAffectingCombat() and BeeIsRun(\"巨龙装甲手甲\") then\n    BeeRun(\"巨龙装甲手甲\");\n    return;\nend",
				}, -- [9]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = "英勇投掷",["Title"] = "|cffc79c6e英勇投掷|r",
					["GUID"] = 2,
					["Icon"] = "Interface\\Icons\\INV_Axe_02",
					["Script"] = "if BeeUnitAffectingCombat() and BeeUnitBuffsSpells(\"target\",\"破甲攻击\",\"英勇投掷\",true) and BeeIsRun(\"英勇投掷\") then BeeRun(\"英勇投掷\");\n    return;\nend",
				}, -- [10]
				{
					["Enabled"] = true,
					["Script"] = "local bufflist = BeeUnitBuffList(\"player\")\n\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.75 and BeeIsRun(\"乘胜追击\") then\n    BeeRun(\"乘胜追击\");\n    return;\nend\n\nif BeePlayerBuffTime(\"激怒\")<0 and BeeIsRun(\"狂暴之怒\") then\n    BeeRun(\"狂暴之怒\");\n    return;\nend\n\nif BeeUnitAffectingCombat() and (BeeUnitMana()>70 or BeeStringFind(\"战斗专注\",BeeUnitBuffList(\"player\")) or BeeStringFind(\"激动\",BeeUnitBuffList(\"player\")) or (BeeStringFind(\"怒火中烧\",BeeUnitBuffList(\"player\")) and BeeUnitMana()>60 and BeeSpellCD(\"巨人打击\")>3)) and BeeIsRun(\"英勇打击\") then\n    BeeRun(\"英勇打击\");\n    return;\nend\n\nif BeeUnitBuff(\"行刑者\",\"player\",0,1)>=2 and  BeeUnitBuffCount(\"行刑者\",\"player\",0,1)>=5 and BeeIsRun(\"嗜血\") then\n    BeeRun(\"嗜血\");\n    return;\nend\n\nif BeeUnitBuff(\"行刑者\",\"player\",0,1)>=2 and  BeeUnitBuffCount(\"行刑者\",\"player\",0,1)>=5 and BeeIsRun(\"怒击\") then\n    BeeRun(\"怒击\");\n    return;\nend\n\nif BeeUnitBuff(\"行刑者\",\"player\",0,1)>=2 and  BeeUnitBuffCount(\"行刑者\",\"player\",0,1)>=5 and BeeIsRun(\"猛击\") then\n    BeeRun(\"猛击\");\n    return;\nend\n\nif BeeIsRun(\"斩杀\") then\n    BeeRun(\"斩杀\");\n    return;\nend\n\nif BeeIsRun(\"战斗怒吼\") then\n    BeeRun(\"战斗怒吼\");\n    return;\nend\n\nif BeeTargetDeBuffTime(\"巨人打击\")<1 and BeeIsRun(\"巨人打击\",\"target\") then\n    BeeRun(\"巨人打击\",\"target\");\n    return;\nend\n\nif BeeIsRun(\"嗜血\") then\n    BeeRun(\"嗜血\");\n    return;\nend\n\nif BeePlayerBuffTime(\"血脉贲张\")>0 and BeeIsRun(\"猛击\") then\n    BeeRun(\"猛击\");\n    return;\nend\n\nif BeeIsRun(\"怒击\") then\n    BeeRun(\"怒击\");\n    return;\nend",
					["Name"] = "狂暴输出基础包",["Title"] = "|cffc79c6e狂暴输出基础包|r",
					["GUID"] = 1,
					["Icon"] = "Interface\\Icons\\Racial_Orc_BerserkerStrength",
					["Description"] = "當滿足條件時自動施放",
				}, -- [11]
			},
		},
		{
		    ["Name"] = "防战基础包",["Title"] = "|cffc79c6e防战基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Name"] = "坐骑状态",["Title"] = "|cffc79c6e坐骑状态|r",
					["Script"] = "--坐骑状态\nif IsMounted(\"player\")==1 then\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Nature_ForceOfNature",
					["Description"] = "骑乘状态下不释放法术",
				}, -- [1]
				{
					["GUID"] = 2,
					["Name"] = "命令怒吼",["Title"] = "|cffc79c6e命令怒吼|r",
					["Script"] = "--命令怒吼\nif BeeIsRun(\"命令怒吼\",\"nogoal\") and not BeeStringFind(\"命令怒吼\",bufflist) and BeeUnitBuff(\"战斗怒吼\",\"player\",0,1)<0 then BeeRun(\"命令怒吼\");\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Nature_Polymorph_Cow",
					["Description"] = "自动释放命令怒吼，保持命令怒吼buff",
				}, -- [2]
				{
					["GUID"] = 3,
					["Name"] = "自动寻找目标",["Title"] = "|cffc79c6e自动寻找目标|r",
					["Script"] = "--攻击最近的目标\nif not UnitIsDead(\"player\") then\n    if BeeAttack(0,0) then\n        return;\n    end\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Nature_UndyingStrength",
					["Description"] = "自动寻找地方目标",
				}, -- [3]
				{
					["GUID"] = 4,
					["Name"] = "盾墙",["Title"] = "|cffc79c6e盾墙|r",
					["Script"] = "--盾墙\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.45 and BeeIsRun(\"盾墙\") then\n    BeeRun(\"盾墙\");\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_DeathScream",
					["Description"] = "血量低于45%自动开启盾墙。如需修改阈值，自行修改代码",
				}, -- [4]
				{
					["GUID"] = 5,
					["Name"] = "破釜沉舟",["Title"] = "|cffc79c6e破釜沉舟|r",
					["Script"] = "--破釜沉舟\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.15 and BeeIsRun(\"破釜沉舟\") then\n    BeeRun(\"破釜沉舟\");\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\SPELL_SHADOW_MINDSTEAL",
					["Description"] = "15%血量自动开启破釜沉舟",
				}, -- [5]
				{
					["GUID"] = 6,
					["Name"] = "其它保命",["Title"] = "|cffc79c6e其它保命|r",
					["Script"] = "--保命类\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.45 and BeeIsRun(\"邪能治疗石\") then\n    BeeRun(\"邪能治疗石\");\n    return;\nelseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.15 and BeeIsRun(\"符文治疗药水\") then\n    BeeRun(\"符文治疗药水\");\n    return;\nelseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.50 and BeeIsRun(\"狂怒回复\") then\n    BeeRun(\"狂怒回复\");\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_SoulGem",
					["Description"] = "SS石头，药水，狂怒回复等保命措施",
				}, -- [6]
				{
					["GUID"] = 14,
					["Name"] = "施法打断",["Title"] = "|cffc79c6e施法打断|r",
					["Script"] = "--打断\nif BeeUnitCastSpellName() and BeeIsRun(\"拳击\") then\n    BeeRun(\"拳击\");\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_UnholyStrength",
					["Description"] = "當滿足條件時自動施放",
				}, -- [7]
				{
					["GUID"] = 7,
					["Name"] = "自动冲锋/拦截",["Title"] = "|cffc79c6e自动冲锋/拦截|r",
					["Script"] = "--自动冲锋拦截\nif not Wudi and BeeIsRun(\"拦截\",\"target\") then\n    BeeRun(\"拦截\",\"target\");\n    return true;\nelseif not Wudi and BeeIsRun(\"冲锋\",\"target\") and ((BeeSpellCD(\"拦截\")>0 and BeeSpellCD(\"拦截\")<28) or (BeeUnitMana()<7)) then\n    BeeRun(\"冲锋\",\"target\");\n    return true;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shaman_GiftEarthmother",
					["Description"] = "自动冲锋/拦截敌方目标",
				}, -- [8]
				{
					["GUID"] = 16,
					["Name"] = "自动嘲讽",["Title"] = "|cffc79c6e自动嘲讽|r",
					["Description"] = "自动嘲讽不属于自己的目标",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Hunter_Camouflage",
					["Script"] = "--嘲讽\nif not BeeTargetTargetIsPlayer() and BeeIsRun(\"嘲讽\") and BeeUnitName(\"targettarget\") then\n    BeeRun(\"嘲讽\");\n    return;\nend",
				}, -- [9]
				{
					["GUID"] = 12,
					["Name"] = "乘胜追击",["Title"] = "|cffc79c6e乘胜追击|r",
					["Script"] = "--乘胜追击\nif BeeIsRun(\"乘胜追击\") then\n    BeeRun(\"乘胜追击\")\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\SPELL_SHADOW_TWISTEDFAITH",
					["Description"] = "當滿足條件時自動施放",
				}, -- [10]
				{
					["GUID"] = 13,
					["Name"] = "撕裂",["Title"] = "|cffc79c6e撕裂|r",
					["Script"] = "--撕裂\nif BeeUnitBuff(\"撕裂\",\"target\",2,0)<2 and not BeeStringFind(\"圣盾术,保护之手,寒冰屏障,圣佑术,暗影斗篷\",BeeUnitBuffList(\"target\")) and BeeIsRun(\"撕裂\") then\n    BeeRun(\"撕裂\");\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_ShadeTrueSight",
					["Description"] = "當滿足條件時自動施放",
				}, -- [11]
				{
					["GUID"] = 11,
					["Name"] = "雷霆一击",["Title"] = "|cffc79c6e雷霆一击|r",
					["Script"] = "if BeeUnitAffectingCombat() and BeeRange(\"target\")<=8 and BeeIsRun(\"雷霆一击\") then\n    BeeRun(\"雷霆一击\")\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_unused2",
					["Description"] = "當滿足條件時自動施放",
				}, -- [12]
				{
					["GUID"] = 8,
					["Name"] = "震荡波",["Title"] = "|cffc79c6e震荡波|r",
					["Script"] = "if BeeUnitAffectingCombat() and BeeRange(\"target\")<=8 and BeeIsRun(\"震荡波\") then\n    BeeRun(\"震荡波\")\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\spell_Warlock_Soulburn",
					["Description"] = "自动释放着震荡波",
				}, -- [13]
				{
					["GUID"] = 15,
					["Name"] = "英勇投掷",["Title"] = "|cffc79c6e英勇投掷|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Druid_Maul",
					["Script"] = "--英勇投掷\nif BeeUnitAffectingCombat() and BeeRange(\"target\")>=10 and BeeRange(\"target\")<30 and BeeIsRun(\"英勇投掷\") then\n    BeeRun(\"英勇投掷\")\n    return;\nend",
				}, -- [14]
				{
					["GUID"] = 17,
					["Script"] = "local n=BeeGroupCountScript('BeeIsRun(\"顺劈斩\",unit)',\"BeeRange(unit)<=9\",\"party\")\n\nif n>=3 then\n    \n    BeeRun(\"顺劈斩\")\n    \nend\n",
					["Name"] = "3个怪用顺劈斩",["Title"] = "|cffc79c6e3个怪用顺劈斩|r",
					["Enabled"] = true,
					["Icon"] = "Interface\\Icons\\Ability_Creature_Disease_05",
					["Description"] = "當滿足條件時自動施放",
				}, -- [15]
				{
					["GUID"] = 9,
					["Name"] = "一般仇恨循环",["Title"] = "|cffc79c6e一般仇恨循环|r",
					["Script"] = "if BeeIsRun(\"复仇\") then\n    BeeRun(\"复仇\")\n    return;\nend\n\n\nif BeeIsRun(\"盾牌猛击\") then\n    BeeRun(\"/cast 盾牌格挡\\n/cast 盾牌猛击\")\n    return;\nend\n\n\n\nif BeeUnitMana()>55 and BeeIsRun(\"英勇打击\") then\n    BeeRun(\"/cast 怒火中烧\\n/cast 英勇打击\");\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\spell_Shaman_Unleashweapon_Flame",
					["Description"] = "正常单体仇恨循环，必选",
				}, -- [16]
				{
					["GUID"] = 10,
					["Name"] = "毁灭打击",["Title"] = "|cffc79c6e毁灭打击|r",
					["Script"] = "--毁灭打击\nif not BeeIsRun(\"复仇\") and not BeeIsRun(\"盾牌猛击\") and BeeIsRun(\"毁灭打击\") then \n    BeeRun(\"毁灭打击\");\n    return;\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\spell_Shaman_Unleashweapon_Life",
					["Description"] = "當滿足條件時自動施放",
				}, -- [17]
			},
		},
	},
}

end