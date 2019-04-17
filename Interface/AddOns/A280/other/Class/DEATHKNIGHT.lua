
wowam.ClassBeeScript.DEATHKNIGHT=function()
  
LazyScript=LazyScript or {};
LazyScript["DEATHKNIGHT"] = {
	["List"] = {  
		{
			["Name"] = "冰霜DK基础包",["Title"] = "|cffc41f3b冰霜DK基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--骑乘，其他不做任何动作\nif IsMounted(\"player\")==1 then \n    if not BeeStringFind(\"冰霜之路\",BeeUnitBuffList(\"player\")) then \n        BeeRun(\"冰霜之路\");\n    end\n    return;\nend\n",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\Spell_DeathKnight_PathOfFrost",
					["Name"] = "冰霜之路",["Title"] = "|cffc41f3b冰霜之路|r",
				}, -- [1]
				{
					["GUID"] = 2,
					["Description"] = "需要打断对方施法时,请勾选.",
					["Script"] = "local NeedBreak = \"痛苦无常,恐惧,神圣之光,圣光术,快速治疗,强效治疗术,滋养,治疗之触,愈合,旋风,治疗波,治疗之涌,滋养,强效治疗波,苦修,变形术,治疗之雨,圣光闪现,神圣赞美诗,联结治疗,治疗链,妖术,群体驱散\"\nlocal NeedBreakDelay = \"变羊术,恐惧,妖术,苦修,强效治疗术,精神控制,神圣之光,强效治疗波,治疗之触,痛苦无常,奥术冲击\"\nlocal NotNeedBreak = \"保护祝福,圣盾术,灵魂之力,寒冰屏障,光环掌握\"\nlocal Castingtime = BeeUnitCastSpellTime(\"target\")\nif BeeTargetBuffTime(\"巫妖之躯\")>=0 and BeeIsRun(\"绞袭\",\"target\") then BeeRun(\"绞袭\",\"target\");\n    return;\nend\nif BeeTargetBuffTime(\"法术反射\")>=0 and BeeIsRun(\"心灵冰冻\",\"target\") then BeeRun(\"心灵冰冻\",\"target\");\n    return;\nend\nif BeeStringFind(NeedBreak,BeeUnitCastSpellName(\"target\")) and BeeTargetBuffTime(NotNeedBreak)<=0 then\n    if BeeRange()<8 and BeeIsRun(\"心灵冰冻\",\"target\") then BeeRun(\"心灵冰冻\",\"target\");\n        return;\n    elseif BeeSpellCD(\"心灵冰冻\")>1 and BeeSpellCD(\"心灵冰冻\")<9 and BeeIsRun(\"绞袭\",\"target\") then BeeRun(\"绞袭\",\"target\");\n        return;\n    elseif BeeRange(\"target\")>8 and BeeIsRun(\"绞袭\",\"target\") then BeeRun(\"绞袭\",\"target\");\n        return;\n    elseif BeeIsRun(\"黑暗模拟\",\"target\") then BeeRun(\"黑暗模拟\",\"target\");\n        return;\n    end\nend\nif BeeStringFind(NeedBreakDelay,BeeUnitCastSpellName(\"target\")) and Castingtime<=0.4 and BeeTargetBuffTime(NotNeedBreak)<=0 then\n    if BeeRange()<8 and BeeIsRun(\"心灵冰冻\",\"target\") then BeeRun(\"心灵冰冻\",\"target\");\n        return;\n    elseif BeeSpellCD(\"心灵冰冻\")>1 and BeeSpellCD(\"心灵冰冻\")<9 and BeeIsRun(\"绞袭\",\"target\") then BeeRun(\"绞袭\",\"target\");\n        return;\n    elseif BeeRange(\"target\")>8 and BeeIsRun(\"绞袭\",\"target\") then BeeRun(\"绞袭\",\"target\");\n        return;\n    elseif BeeIsRun(\"黑暗模拟\",\"target\") then BeeRun(\"黑暗模拟\",\"target\");\n        return;\n    end\nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_DeathKnight_MindFreeze",
					["Name"] = "自动打断",["Title"] = "|cffc41f3b自动打断|r",
				}, -- [2]
				{
					["GUID"] = 6,
					["Script"] = "if BeeStringFind(\"深度冻结,致盲,制裁之锤,扰乱射击,变形术,死亡缠绕,精神控制,诱惑,冰冻陷阱,击倒,妖术,恐惧,心灵尖啸,恐惧嚎叫,破胆怒吼,恐惧术,心灵惊骇,忏悔\",BeeUnitBuffList(\"player\")\n) and BeeIsRun(\"被遗忘者的意志\",\"nogoal\") then BeeRun(\"被遗忘者的意志\");\n    return;\nend\nlocal NoDebuff=\"深度冻结,制裁之锤,击倒,肾击,猛击\"\nlocal NoDebuf2=\"恐惧,心灵尖啸,恐惧嚎叫,破胆怒吼,恐惧术,心灵惊骇,死亡缠绕,精神控制,诱惑\"\nif BeePlayerDeBuffTime(NoDebuff)>0 and BeeIsRun(\"冰封之韧\") then BeeRun(\"冰封之韧\")\n    return;\nend\nif BeePlayerDeBuffTime(NoDebuff)>0 and BeeSpellCD(\"冰封之韧\")>1 and      GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  \n    return;\nend\nif BeePlayerDeBuffTime(NoDebuff2)>0 and BeeIsRun(\"被遗忘者的意志\",\"nogoal\") then BeeRun(\"被遗忘者的意志\");\n    return;\nend\nif BeePlayerDeBuffTime(NoDebuff2)>0 and BeeSpellCD(\"被遗忘者的意志\")>1 and BeeIsRun(\"巫妖之躯\") then BeeRun(\"巫妖之躯\");\n    return;\nend\n",
					["Name"] = "被遗忘者的意志",["Title"] = "|cffc41f3b被遗忘者的意志|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_RaiseDead",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["Enabled"] = 1,
					["Script"] = "\nif BeeUnitAffectingCombat() and BeeIsRun(\"冰霜之柱\") then BeeRun(\"冰霜之柱\"); \n    return; \nend; \nif BeePlayerBuffTime(\"寒冬号角\")<3 and BeeIsRun(\"寒冬号角\") then BeeRun(\"寒冬号角\"); \n    return; \nend; \nif BeeRune(\"冰霜符文\")<=0 and BeeRune(\"死亡符文\")<=0 and BeeIsRun(\"活力分流\") then BeeRun(\"活力分流\"); \n    return; \nelseif BeeRune(\"冰霜符文\")<=0 and BeeRune(\"邪恶符文\")<=0 and BeeIsRun(\"活力分流\") then BeeRun(\"活力分流\"); \n    return; \nelseif BeeRune(\"死亡符文\")<=0 and BeeRune(\"邪恶符文\")<=0 and BeeIsRun(\"活力分流\") then BeeRun(\"活力分流\"); \n    return; \nend; \nif BeeSpellCD(\"活力分流\")>0 and BeeRune(\"冰霜符文\")<=0 and BeeRune(\"死亡符文\")<=0 and BeeIsRun(\"符文武器增效\") then BeeRun(\"符文武器增效\"); \n    return; \nelseif BeeSpellCD(\"活力分流\")>0 and BeeRune(\"冰霜符文\")<=0 and BeeRune(\"邪恶符文\")<=0 and BeeIsRun(\"符文武器增效\") then BeeRun(\"符文武器增效\"); \n    return; \nelseif BeeSpellCD(\"活力分流\")>0 and BeeRune(\"死亡符文\")<=0 and BeeRune(\"邪恶符文\")<=0 and BeeIsRun(\"符文武器增效\") then BeeRun(\"符文武器增效\"); \n    return; \nend;",
					["Name"] = "辅助技能及饰品",["Title"] = "|cffc41f3b辅助技能及饰品|r",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\Spell_Deathknight_IcyTalons",
					["Description"] = "一些辅助技能,可根据情况使用.",
				}, -- [4]
				{
					["GUID"] = 7,
					["Name"] = "饰品",["Title"] = "|cffc41f3b饰品|r",
					["Script"] = "if  BeePlayerBuffTime(\"冰霜之柱\")>0 and BeeSpellCD(\"/use item:70519\")<0 and BeeIsRun(\"残忍角斗士的胜利徽章\",\"nogoal\") then BeeRun(\"/use 残忍角斗士的胜利徽章\");\n    return;\nend\n",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_ChampionsBond",
					["Description"] = "當滿足條件時自動施放",
				}, -- [5]
				{
					["GUID"] = 8,
					["Description"] = "當滿足條件時自動施放",
					["Name"] = " 嘲讽触发",["Title"] = "|cffc41f3b 嘲讽触发|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Nature_ShamanRage",
					["Script"] = "--嘲讽触发技能设置开关，设置1为开启，0为关闭\nlocal CFCF=0\nif  BeeIsRun(\"黑暗命令\",\"target\") and CFCF==0 then BeeRun(\"黑暗命令\",\"target\" );\n    return;\nend\n--距离控制技能设置开关，设置1为开启，0为关闭\nlocal JLKZ=0\nif BeeRange(\"target\")<20 and  BeeRange(\"target\")>6 and BeeIsRun(\"寒冰锁链\",\"target\") and not BeeStringFind(\"寒冰锁链\",BeeUnitBuffList(\"target\")) and JLKZ==1 then BeeRun(\"寒冰锁链\",\"target\");\n    return;\nend\nif BeeRange(\"target\")<36 and  BeeRange(\"target\")>10 and BeeIsRun(\"死亡之握\",\"target\") and JLKZ==0 then BeeRun(\"死亡之握\",\"target\");\n    return;\nend\nif not BeeStringFind(\"亵渎\",BeeUnitBuffList(\"target\")) and JLKZ==0 and BeeIsRun(\"死疽打击\",\"target\")then BeeRun(\"死疽打击\",\"target\");\n    return;\nend",
				}, -- [6]
				{
					["GUID"] = 1,
					["Description"] = "请注意调整脚本里保命饰品-比如 主宰之力等",
					["Name"] = "优先保命",["Title"] = "|cffc41f3b优先保命|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_DeathKnight_IceBoundFortitude",
					["Script"] = "--自保和救援\nif BeeUnitAffectingCombat() and  BeeSpellCD(\"冰封之韧\")<=0 and BeeUnitHealth(\"player\",\"%\")<35 and BeeIsRun(\"冰封之韧\") then BeeRun(\"冰封之韧\");\n    return;\nend\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.3 and BeeIsRun(\"巫妖之躯\") then BeeRun(\"巫妖之躯\");\n    return;\nelseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.5 and BeeUnitMana(\"player\")>40 and BeeIsRun(\"亡者复生\") then BeeRun(\"亡者复生\");\n    return;\nend\nif BeeSpellCD(\"亡者复生\")>0 and BeeIsRun(\"天灾契约\") then BeeRun(\"天灾契约\");\n    return;\nend\nif BeeStringFind(\"巫妖之躯\",BeeUnitBuffList(\"player\"))\nand BeeIsRun(\"凋零缠绕\",\"player\") then BeeRun(\"凋零缠绕\",\"player\"); \n    return;\nend\n",
				}, -- [7]
				{
					["GUID"] = 4,
					["Script"] = "if BeeIsCombat()==0 then \n    BeeRun(\"/startattack\"); \n    return; \nend \n--瘟疫 \nif BeeTargetDeBuffTime(\"血之疫病\")<1 and BeeIsRun(\"爆发\",\"target\") then \n    BeeRun(\"爆发\"); \n    return; \nelseif BeeTargetDeBuffTime(\"血之疫病\")<1 and BeeSpellCD(\"爆发\")>0 and BeeIsRun(\"暗影打击\",\"target\") then \n    BeeRun(\"暗影打击\"); \n    return; \nend\nif BeeUnitMana(\"player\")>120 and BeeIsRun(\"凋零缠绕\",\"target\") then BeeRun(\"凋零缠绕\",\"target\"); \n    return; \nend\n--输出优先级\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")>0.2 then\n    if BeeIsRun(\"凛风冲击\",\"target\") then BeeRun(\"凛风冲击\",\"target\"); \n        return; \n    end\n    if  BeeIsRun(\"冰霜打击\",\"target\") then BeeRun(\"冰霜打击\",\"target\"); \n        return; \n    end\n    if  BeeIsRun(\"死疽打击\",\"target\") then BeeRun(\"死疽打击\",\"target\"); \n        return; \n    end\nend\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")<=0.2 and BeeIsRun(\"灵界打击\",\"target\") then BeeRun(\"灵界打击\",\"target\"); \n    return; \nend",
					["Description"] = "如需使用请勾选.",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Deathknight_ClassIcon",
					["Name"] = "冰传染天赋单体输出",["Title"] = "|cffc41f3b冰传染天赋单体输出|r",
				}, -- [8]
				{
					["GUID"] = 9,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--瘟疫 \nlocal Rune2= BeeRuneCount(2);\nif BeeTargetDeBuffTime(\"血之疫病\")<1 and BeeIsRun(\"爆发\",\"target\") then \n    BeeRun(\"爆发\"); \n    return; \nelseif BeeTargetDeBuffTime(\"血之疫病\")<1 and BeeSpellCD(\"爆发\")>0 and BeeIsRun(\"暗影打击\",\"target\") then \n    BeeRun(\"暗影打击\"); \n    return; \nend\n--输出优先级\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")>0.2 then\n    --符文强化\n    if BeeUnitMana(\"player\")>80 and BeeIsRun(\"凋零缠绕\",\"target\") then BeeRun(\"凋零缠绕\",\"target\"); \n        return; \n    end\n    if  BeeIsRun(\"冰霜打击\",\"target\") then BeeRun(\"冰霜打击\",\"target\"); \n        return; \n    end\n    if BeeIsRun(\"凛风冲击\",\"target\") then BeeRun(\"凛风冲击\",\"target\"); \n        return; \n    end\n    if Rune2>1 and BeeIsRun(\"死疽打击\",\"target\") then BeeRun(\"死疽打击\",\"target\"); \n        return;\n    end\n    if BeeRuneCD(\"邪恶符文\")<=7.2 and BeeRune(\"邪恶符文\")>0 and BeeIsRun(\"死疽打击\",\"target\") then BeeRun(\"死疽打击\",\"target\"); \n        return;\n    end\nend\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")<=0.2 and BeeIsRun(\"灵界打击\",\"target\") then BeeRun(\"灵界打击\",\"target\"); \n    return; \nend",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_DeathKnight_FrozenRuneWeapon",
					["Name"] = "符文强化",["Title"] = "|cffc41f3b符文强化|r",
				}, -- [9]
    		},
		},
		{
			["Name"] = "鲜血防御基础包",["Title"] = "|cffc41f3b鲜血防御基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--骑乘，其他不做任何动作\nif IsMounted(\"player\")==1 then \n    if not BeeStringFind(\"冰霜之路\",BeeUnitBuffList(\"player\")) then \n        BeeRun(\"冰霜之路\");\n    end\n    return;\nend\n",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Spell_DeathKnight_PathOfFrost",
					["Name"] = "冰霜之路",["Title"] = "|cffc41f3b冰霜之路|r",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Script"] = "--符文强化\nif BeeCastSpellFast() then\n    return true;\nend\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")>0.6 and BeeIsRun(\"符文打击\",\"target\") then BeeRun(\"符文打击\",\"target\");\n    return;\nelseif BeeRuneCD(\"鲜血符文\")>2 and BeeRune(\"鲜血符文\")>0 and BeeIsRun(\"符文打击\",\"target\") then BeeRun(\"符文打击\",\"target\"); \n    return;\nend\nif BeeIsRun(\"灵界打击\",\"target\") then BeeRun(\"灵界打击\",\"target\");\n    return;\nend\nif BeeRuneCD(\"鲜血符文\")<=2 and BeeRune(\"鲜血符文\")>0 and UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.8 and BeeIsRun(\"符文分流\") then BeeRun(\"符文分流\");\n    return;\nelseif BeeRuneCD(\"鲜血符文\")<=2 and BeeRune(\"鲜血符文\")>0 and BeeIsRun(\"心脏打击\",\"target\") then BeeRun(\"心脏打击\",\"target\"); \n    return; \nelseif BeeRuneCD(\"鲜血符文\")<=2 and BeeRune(\"鲜血符文\")>0 and BeeIsRun(\"血液沸腾\") then BeeRun(\"血液沸腾\"); \n    return;\nelseif BeeRuneCD(\"鲜血符文\")<=2 and BeeRune(\"鲜血符文\")>0 and BeeIsRun(\"传染\") then BeeRun(\"传染\"); \n    return;\nend    \n\n",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 8,
					["Icon"] = "Interface\\Icons\\Spell_DeathKnight_RuneTap",
					["Name"] = "符文充能",["Title"] = "|cffc41f3b符文充能|r",
				}, -- [2]
				{
					["GUID"] = 1,
					["Script"] = "--自保和救援\nif BeeUnitAffectingCombat() and  BeeSpellCD(\"冰封之韧\")<=0 and BeeUnitHealth(\"player\",\"%\")<35 and BeeIsRun(\"冰封之韧\") then BeeRun(\"冰封之韧\");\n    return;\nend\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.4 and BeeIsRun(\"吸血鬼之血\") then BeeRun(\"吸血鬼之血\");\n    return; \nelseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.5 and BeeIsRun(\"巫妖之躯\") then BeeRun(\"巫妖之躯\");\n    return;\nelseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.35 and BeeIsRun(\"亡者复生\") then BeeRun(\"亡者复生\");\n    return;\nelseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.3 and BeeIsRun(\"符文武器增效\") then BeeRun(\"符文武器增效\");\n    return;    \nend\nif BeeStringFind(\"巫妖之躯\",BeeUnitBuffList(\"player\"))\nand BeeIsRun(\"凋零缠绕\",\"player\") then BeeRun(\"凋零缠绕\",\"player\"); \n    return;\nend\nif BeeStringFind(\"吸血鬼之血\",BeeUnitBuffList(\"player\"))\nand BeeSpellCD(\"/use item:68915\")<0 and BeeIsRun(\"生命天平\",\"nogoal\") then BeeRun(\"/use 生命天平\");\n    return;\nend\nif BeeSpellCD(\"亡者复生\")>0 and BeeIsRun(\"天灾契约\") then BeeRun(\"天灾契约\");\n    return;\nend\nif BeeSpellCD(\"吸血鬼之血\")>0 and BeeIsRun(\"符文剑舞\") then BeeRun(\"符文剑舞\");\n    return;\nend ",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_DeathKnight_IceBoundFortitude",
					["Name"] = "优先保命",["Title"] = "|cffc41f3b优先保命|r",
				}, -- [3]
				{
					["Enabled"] = 1,
					["Name"] = "辅助技能",["Title"] = "|cffc41f3b辅助技能|r",
					["Script"] = "--辅助技能 \nif BeePlayerBuffTime(\"白骨之盾\")<0 and BeeIsRun(\"白骨之盾\") then BeeRun(\"白骨之盾\"); \n    return; \nend; \nif BeeIsRun(\"活力分流\") then BeeRun(\"活力分流\"); \n    return; \nend; \nif BeePlayerBuffTime(\"寒冬号角\")<3 and BeeIsRun(\"寒冬号角\") then BeeRun(\"寒冬号角\"); \n    return; \nend; \n",
					["GUID"] = 4,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_PlagueCloud",
					["Description"] = "可根据情况使用.",
				}, -- [4]
				{
					["GUID"] = 5,
					["Script"] = "--瘟疫 \nif BeeTargetDeBuffTime(\"血之疫病\")<1 and BeeIsRun(\"爆发\",\"target\") then \n    BeeRun(\"爆发\"); \n    return; \nend ",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Parry",
					["Name"] = "鲜血坦克攻击",["Title"] = "|cffc41f3b鲜血坦克攻击|r",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Script"] = "if  BeeUnitCastSpellName() and BeeRange()<8 and  BeeIsRun(\"心灵冰冻\") then BeeRun(\"心灵冰冻\"); \n    return;\nelseif BeeUnitCastSpellName() and  BeeRune(\"鲜血符文\")>0 and BeeSpellCD(\"心灵冰冻\")>1 and BeeSpellCD(\"心灵冰冻\")<9 and BeeIsRun(\"绞袭\") then BeeRun(\"绞袭\");\n    return;\nelseif BeeUnitCastSpellName() and  BeeRange()>8 and BeeRune(\"鲜血符文\")>0 and BeeIsRun(\"绞袭\") then BeeRun(\"绞袭\");\n    return;\nend \n",
					["Name"] = "自动打断施法",["Title"] = "|cffc41f3b自动打断施法|r",
					["Icon"] = "Interface\\Icons\\Spell_DeathKnight_MindFreeze",
					["GUID"] = 2,
				}, -- [6]
				{
					["Enabled"] = 1,
					["Script"] = "if UnitIsDead(\"party1\") and BeeIsRun(\"复活盟友\",\"party1\")  then BeeRun(\"复活盟友\",\"party1\"); \n    return; \nend\nif UnitIsDead(\"party2\") and BeeIsRun(\"复活盟友\",\"party2\")  then BeeRun(\"复活盟友\",\"party2\"); \n    return; \nend\nif UnitIsDead(\"party3\") and BeeIsRun(\"复活盟友\",\"party3\")  then BeeRun(\"复活盟友\",\"party3\"); \n    return; \nend\nif UnitIsDead(\"party4\") and BeeIsRun(\"复活盟友\",\"party4\")  then BeeRun(\"复活盟友\",\"party4\"); \n    return; \nend",
					["Name"] = "战复",["Title"] = "|cffc41f3b战复|r",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_NightOfTheDead",
					["Description"] = "當滿足條件時自動施放",
				}, -- [7]
				{
					["Enabled"] = 1,
					["Script"] = "--自动嘲讽\nif not BeeUnitUnitIsPlayer(1) and BeeIsRun(\"黑暗命令\") then BeeRun(\"黑暗命令\");\n    return;\nend\nif not BeeUnitUnitIsPlayer(1) and BeeIsRun(\"死亡之握\") then BeeRun(\"死亡之握\");\n    return;\nend\n",
					["Description"] = "请按TAB键切换目标,实现自动嘲讽.",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\Spell_Nature_ShamanRage",
					["Name"] = "自动嘲讽",["Title"] = "|cffc41f3b自动嘲讽|r",
				}, -- [8]
			},
		},
		{
		    ["Name"] = "邪恶DK基础包",["Title"] = "|cffc41f3b邪恶DK基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 2,
					["Script"] = "--保命--\nif BeeUnitMana()>25 and BeeSpellCD(\"冰封之韧\")<=0 and UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.85 and BeeIsRun(\"冰封之韧\") then BeeRun(\"冰封之韧\");\n    return;\nend\nif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.85 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.22 kingfreedom出品，必属精品",
					["Name"] = "保命",["Title"] = "|cffc41f3b保命|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Racial_Orc_BerserkerStrength",
					["Description"] = "當滿足條件時自動施放",
				}, -- [1]
				{
					["GUID"] = 3,
					["Script"] = "if  BeeUnitCastSpellName() and BeeRange()<8 and  BeeIsRun(\"心灵冰冻\") then BeeRun(\"心灵冰冻\"); \n    return;\nelseif BeeUnitCastSpellName() and  BeeRune(\"鲜血符文\")>0 and BeeSpellCD(\"心灵冰冻\")>1 and BeeSpellCD(\"心灵冰冻\")<9 and BeeIsRun(\"绞袭\") then BeeRun(\"绞袭\");\n    return;\nelseif BeeUnitCastSpellName() and  BeeRange()>8 and BeeRune(\"鲜血符文\")>0 and BeeIsRun(\"绞袭\") then BeeRun(\"绞袭\");\n    return;\nend \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.22 kingfreedom出品，必属精品",
					["Name"] = "打断",["Title"] = "|cffc41f3b打断|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Warrior_WarCry",
					["Description"] = "當滿足條件時自動施放",
				}, -- [2]
				{
					["GUID"] = 1,
					["Script"] = "\n\n\n\nif BeeUnitBuffCount(\"暗影灌注\",\"pet\")==5 and BeeIsRun(\"黑暗突变\",\"nogoal\")  then\n    BeeRun(\"黑暗突变\",\"nogoal\")\n    return;\nend\n\n\n\n--辅助技能 \nif BeePlayerBuffTime(\"寒冬号角\")<3 and BeeIsRun(\"寒冬号角\") then BeeRun(\"寒冬号角\"); \n    return; \nend; \nif BeeRune(\"鲜血符文\")<=0  and BeeIsRun(\"活力分流\") then BeeRun(\"活力分流\"); \n    return; \nend;\n\n--瘟疫 \n\nif BeeTargetDeBuffTime(\"血之疫病\")<1 and BeeIsRun(\"爆发\",\"target\") then \n    BeeRun(\"爆发\"); \n    return; \nelseif BeeTargetDeBuffTime(\"冰霜疫病\")<1 and BeeSpellCD(\"爆发\")>0 and BeeIsRun(\"冰冷触摸\",\"target\") then \n    BeeRun(\"冰冷触摸\"); \n    return; \nelseif BeeTargetDeBuffTime(\"血之疫病\")<1 and BeeSpellCD(\"爆发\")>0 and BeeIsRun(\"暗影打击\",\"target\") then \n    BeeRun(\"暗影打击\"); \n    return; \nend; \n\n\n\n\n\n\nif BeeUnitMana(\"player\")>=120  and BeeIsRun(\"凋零缠绕\",\"target\")  \nthen\n    BeeRun(\"凋零缠绕\",\"target\")\n    return;\nend\n\n\n\nif BeeUnitBuff(\"黑暗突变\",\"pet\")>0 and BeeIsRun(\"天灾打击\",\"target\") then\n    BeeRun(\"天灾打击\",\"target\")\n    return;\nend\n\nif BeeUnitBuff(\"黑暗突变\",\"pet\")>0 and BeeIsRun(\"脓疮打击\",\"target\") then\n    BeeRun(\"脓疮打击\",\"target\")\n    return;\nend\n\n\nif  BeeUnitBuff(\"黑暗突变\",\"pet\")>0 and BeePlayerBuffTime(\"末日突降\")>0 \nthen\n    BeeRun(\"凋零缠绕\",\"target\")\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\nif BeeUnitBuff(\"黑暗突变\",\"pet\")==-1 and BeeUnitMana(\"player\")>=120  and BeeIsRun(\"凋零缠绕\",\"target\")  then\n    BeeRun(\"凋零缠绕\",\"target\")\n    return;\nend\n\n\nif  BeeIsRun(\"天灾打击\",\"target\") then\n    BeeRun(\"天灾打击\",\"target\")\n    return;\nend\n\nif  BeeIsRun(\"脓疮打击\",\"target\") then\n    BeeRun(\"脓疮打击\",\"target\")\n    return;\nend\n\n\nif BeeUnitMana(\"player\")>=60 and BeeIsRun(\"召唤石像鬼\")   then\n    BeeRun(\"召唤石像鬼\")\n    return;\nend\n\n\n\nif BeePlayerBuffTime(\"末日突降\")>0   then\n    BeeRun(\"凋零缠绕\",\"target\")\n    return;\nend\n\nif  BeeUnitMana(\"player\")>=34  and BeeIsRun(\"凋零缠绕\",\"target\") then\n    BeeRun(\"凋零缠绕\",\"target\")\n    return;\nend\n\n\n\n\nif BeeSpellCD(\"寒冬号角\")<=0 and BeeIsRun(\"寒冬号角\")   then\n    BeeRun(\"寒冬号角\")\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.22 kingfreedom出品，必属精品\n\n\n\n\n\n",
					["Name"] = "单体DPS",["Title"] = "|cffc41f3b单体DPS|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\inv_spear_05",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["GUID"] = 4,
					["Name"] = "手动按键宏枯萎凋零",["Title"] = "|cffc41f3b手动按键宏枯萎凋零|r",
					["Script"] = "\n\nif BeeIsRun(\"枯萎凋零\",\"nogoal\")\nthen\n    BeeMouse(0,0,1,\"/cast 枯萎凋零\");\n    return;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n--2011.11.22 kingfreedom出品，必属精品",
					["Icon"] = "INTERFACE\\ICONS\\inv_chest_chain_06",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
			},
		},
	},
}

end