wowam.ClassBeeScript.ROGUE=function()

LazyScript=LazyScript or {};
LazyScript["ROGUE"] = {
	["List"] = {
		{
			["Name"] = "毁伤盗贼基础包",["Title"] = "|cfffff569毁伤盗贼基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = 1,
					["Script"] = "--坐骑状态\nif IsMounted(\"player\")==1 then\n    return;\nend",
					["Name"] = "坐骑状态",["Title"] = "|cfffff569坐骑状态|r",
					["GUID"] = 1,
					["CD"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Warrior_SavageBlow",
					["Description"] = "當滿足條件時自動施放",
				}, -- [1]
				{
					["GUID"] = 2,
					["Name"] = "自定义保命",["Title"] = "|cfffff569自定义保命|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["CD"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Warrior_Safeguard",
					["Script"] = "--自动保命\nif BeeUnitAffectingCombat() then\n    if UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.45 and BeeIsRun(\"治疗石\") then\n        BeeRun(\"治疗石\");\n        return;\n    elseif UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.60 and BeeIsRun(\"符文治疗注射器\") then\n        BeeRun(\"符文治疗注射器\");\n        return;\n    end\nend\n",
				}, -- [2]
				{
					["Enabled"] = 1,
					["Script"] = "--攻击最近的目标\nif not UnitExists(\"target\") and not UnitIsDeadOrGhost(\"player\") and UnitCanAttack(\"player\",\"target\") then\n    BeeAttack(0,0);\nend",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 3,
					["CD"] = 0.5,
					["Icon"] = "Interface\\Icons\\Ability_Whirlwind",
					["Name"] = "自动寻找目标",["Title"] = "|cfffff569自动寻找目标|r",
				}, -- [3]
				{
					["Enabled"] = 1,
					["Script"] = "local NeedBreak = \"赫希斯之耳语,愤怒,血泪,火球术,云雾冲击,冰川冲击,奥术飞弹,灵魂震击,治疗之环,生命吸取,恐惧,圣光术,快速治疗,强效治疗术,魔能火球,冰霜新星,神圣新星,治疗之触,愈合,寒冰箭雨,飓风,烈焰,治疗波,献祭,滋养,次级治疗波,苦修,变形术,暗影修补,圣光闪现,召唤太阳宝珠,黑暗契约,黑暗治疗,暗影打击,烈焰风暴,暗影愈合,寒冰箭,熔岩箭,强制之握,震爆,混乱之箭,黑暗命令,血泪,治疗链\"\n\nif BeeStringFind(NeedBreak,BeeUnitCastSpellName()) and BeeTargetBuffTime(\"保护祝福\")==-1 then\n    if BeeIsRun(\"脚踢\") then\n        BeeRun(\"脚踢\");\n        return;\n    end\nend",
					["Name"] = "脚踢打断施法(自定义)",["Title"] = "|cfffff569脚踢打断施法(自定义)|r",
					["GUID"] = 4,
					["CD"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Arcane_PortalShattrath",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
				{
					["Enabled"] = 1,
					["Name"] = "一般攻击循环(必选)",["Title"] = "|cfffff569一般攻击循环(必选)|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 5,
					["CD"] = 0.5,
					["Icon"] = "Interface\\Icons\\Spell_DeathKnight_SummonDeathCharger",
					["Script"] = "if BeeIsRun(\"骗子的手套\") then\n    BeeRun(\"骗子的手套\");\nend;\nif BeeUnitHealth(\"target\",\"%\")<=35 and BeeIsRun(\"背刺\") and BeeGetComboPoints()<4 then\n    BeeRun(\"背刺\");\n    return;\nend\nif BeeIsRun(\"毒伤\") and BeePlayerBuffTime(\"切割\")<3 and BeeGetComboPoints()>1 and BeePlayerBuffTime(\"切割\")>0 then\n    BeeRun(\"毒伤\");\n    return;\nend\nif BeePlayerBuffTime(\"切割\")<1 and BeeUnitHealth(\"target\",\"nil\")>30000 and BeeIsRun(\"切割\",nogoal) then\n    BeeRun(\"切割\",nogoal);\n    return;\nend\nif BeeTargetDeBuffTime(\"割裂\")<0 and BeeGetComboPoints()>0 and BeeIsRun(\"割裂\") then\n    BeeRun(\"割裂\");\n    return;\nend\nif  BeeUnitHealth(\"target\",\"nil\")>20000 and BeeIsRun(\"毒伤\") and BeePlayerBuffTime(\"切割\")>3 and BeeGetComboPoints()>4 and BeeIsRun(\"冷血\") then\n    BeeRun(\"冷血\");\n    return;\nend\nif BeeIsRun(\"毒伤\") and BeeGetComboPoints()>3 and BeePlayerBuffTime(\"毒伤\")<0  and BeeUnitMana()>65  then\n    BeeRun(\"毒伤\");\n    return;\nend\nif BeeIsRun(\"毒伤\") and BeeGetComboPoints()>4 and BeeUnitHealth(\"target\",\"nil\")<50000 then\n    BeeRun(\"毒伤\");\n    return;\nend\nif BeeUnitHealth(\"target\",\"%\")>35 and BeeIsRun(\"毁伤\") and BeeGetComboPoints()<4 then\n    BeeRun(\"毁伤\");\n    return;\nend\n\nif BeeUnitHealth(\"target\",\"%\")<35 and BeeIsRun(\"毁伤\") and BeeGetComboPoints()<4 and BeeUnitMana()>=65 then\n    BeeRun(\"毁伤\");\n    return;\nend\nif BeeIsRun(\"毁伤\") and BeeGetComboPoints()<5 and BeeUnitMana()>=105 then\n    BeeRun(\"毁伤\");\n    return;\nend\nif  BeeUnitHealth(\"target\",\"nil\")>500000 and BeeIsRun(\"仇杀\") and BeePlayerBuffTime(\"切割\")>3 and BeeRange(target)<=8  then\n    BeeRun(\"仇杀\");\n    return;\nend",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Script"] = "if BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"嫁祸诀窍\",\"focus\") and BeeUnitMana()<60 and BeeRange(focus)<=20 then \n    BeeRun(\"嫁祸诀窍\",\"focus\");\n    return; \nend",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 6,
					["CD"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Fire_FireArmor",
					["Name"] = "嫁祸诀窍(焦点)",["Title"] = "|cfffff569嫁祸诀窍(焦点)|r",
				}, -- [6]
    		},
		},
		{
			["Name"] = "敏锐盗贼基础包",["Title"] = "|cfffff569敏锐盗贼基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = 1,
					["CD"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 1,
					["Name"] = "坐骑状态",["Title"] = "|cfffff569坐骑状态|r",
					["Icon"] = "Interface\\Icons\\Ability_Warrior_SavageBlow",
					["Script"] = "--坐骑状态\nif IsMounted(\"player\")==1 or BeePlayerBuffTime(\"潜行\")>0  then\n    return ;\nend ",
				}, -- [1]
				{
					["Enabled"] = 1,
					["Script"] = "--if BeeIsRun(\"嫁祸诀窍\")   then \n  --  BeeRun(\"/cast [help] [target=focus, help] [target=targettarget, help] 嫁祸诀窍\");\n   -- return; \n--end\nif BeeUnitAffectingCombat() then\n    if UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.45 and BeeIsRun(\"治疗石\") then\n        BeeRun(\"治疗石\");\n    return;end\n    if UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.35 and BeeIsRun(\"闪避\") then\n        BeeRun(\"闪避\");\n    return;end \n    if UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.40 and BeeIsRun(\"备战就绪\") then\n        BeeRun(\"备战就绪\");\n    return;end  \n    if BeeUnitBuffInfo(\"player\",2,Magic,0)>=1 and BeeIsRun(\"暗影斗篷\")then  BeeRun(\"暗影斗篷\") ;return; end\nend",
					["CD"] = 1,
					["GUID"] = 2,
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Ability_Warrior_Safeguard",
					["Name"] = "保命",["Title"] = "|cfffff569保命|r",
				}, -- [2]
				{
					["GUID"] = 3,
					["Name"] = "自动寻找目标",["Title"] = "|cfffff569自动寻找目标|r",
					["CD"] = 0.5,
					["Enabled"] = 1,
					["Script"] = "BeeSpellFast(\"暗影之舞,消失,脚踢,佯攻\");\nBeeUnitBuffsSpells(\"player\",\"潜行,消失\",\"/stopcasting\",false);\nif not UnitExists(\"target\") and not UnitIsDeadOrGhost(\"player\") and UnitCanAttack(\"player\",\"target\") then\n    BeeAttack(0,0);\nend\nif  BeeIsRun(\"出血\")   and BeeUnitMana()>=75 and BeeGetComboPoints()<5 then BeeRun(\"出血\") \nreturn;end  ",
					["Icon"] = "Interface\\Icons\\Ability_Whirlwind",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["GUID"] = 4,
					["Script"] = "local NeedBreak = \"赫希斯之耳语,愤怒,血泪,火球术,云雾冲击,冰川冲击,奥术飞弹,灵魂震击,治疗之环,生命吸取,恐惧,圣光术,快速治疗,强效治疗术,魔能火球,冰霜新星,神圣新星,治疗之触,愈合,寒冰箭雨,飓风,烈焰,治疗波,献祭,滋养,次级治疗波,苦修,变形术,暗影修补,圣光闪现,召唤太阳宝珠,黑暗契约,黑暗治疗,暗影打击,烈焰风暴,暗影愈合,寒冰箭,熔岩箭,强制之握,震爆,混乱之箭,黑暗命令,血泪,治疗链\"\n\nif BeeStringFind(NeedBreak,BeeUnitCastSpellName()) and BeeTargetBuffTime(\"保护祝福\")==-1 then\n    if BeeIsRun(\"脚踢\") then\n        BeeRun(\"脚踢\");end\n    if BeeIsRun(\"凿击\") and BeeSpellCD(\"脚踢\")>1 then\n        BeeRun(\"凿击\");\n        return;\n    end\nend",
					["CD"] = 1,
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Arcane_PortalShattrath",
					["Name"] = "打断(脚踢和凿击)",["Title"] = "|cfffff569打断(脚踢和凿击)|r",
				}, -- [4]
				{
					["Enabled"] = 1,
					["Name"] = "主攻击循环",["Title"] = "|cfffff569主攻击循环|r",
					["Script"] = "BeeSpellFast(\"暗影之舞,消失,脚踢,佯攻\");\nlocal act=1;\nif BeePlayerBuffTime(\"消失\")==-1 and BeePlayerBuffTime(\"潜行\")==-1 then act=0; cx=act; end\nif  BeePlayerBuffTime(\"暗影之舞\")>=0   then baofa=1;end\nif  BeePlayerBuffTime(\"暗影之舞\")<0   then baofa=0;end\nif act == 0 then\n    if baofa == 0 then \n        if BeeIsRun(\"刺骨\") and BeeTargetDeBuffTime(\"割裂\")<3 and BeeGetComboPoints()>=3 and BeeTargetDeBuffTime(\"割裂\")>0 then\n            BeeRun(\"刺骨\");\n            return;\n        end\n        if BeeTargetDeBuffTime(\"割裂\")<0 and BeeGetComboPoints()==5  and BeeIsRun(\"割裂\") then\n            BeeRun(\"割裂\");\n            return;\n        end\n        if BeePlayerBuffTime(\"切割\")<2 and BeeUnitHealth(\"target\",\"nil\")>30000 and BeeIsRun(\"切割\",nogoal) and BeeGetComboPoints()>=1 and  BeeTargetDeBuffTime(\"割裂\")>2  then\n            BeeRun(\"切割\",nogoal);\n            return;\n        end\n        if  BeeIsRun(\"恢复\",\"player\") and BeePlayerBuffTime(\"恢复\")<3 and BeeGetComboPoints()>=2 and  BeeTargetDeBuffTime(\"割裂\")>2 then\n            BeeRun(\"恢复\",\"player\");\n            return;\n        end;\n        \n        if BeeIsRun(\"刺骨\") and BeeGetComboPoints()==5   then\n            BeeRun(\"刺骨\");\n            return;\n        end\n        if BeeIsRun(\"出血\") and BeeUnitBuff(\"出血\",\"target\",0,2)<37 and BeeUnitBuff(\"创伤\",\"target\",1,2)==-1 and BeeUnitBuff(\"裂伤\",\"target\",1,2)==-1 and BeeUnitBuff(\"出血\",\"target\",1,2)==-1 then\n            BeeRun(\"出血\");\n            return ;              \n        end   \n        if BeeIsRun(\"出血\") and BeeUnitBuff(\"出血\",\"target\",0,2)<3 then\n            BeeRun(\"出血\");\n            return ;              \n        end \n        \n        if  BeeIsRun(\"背刺\") and BeeGetComboPoints()<5  then\n            BeeRun(\"背刺\");\n            return ;              \n        end    \n    end\n    if baofa == 1 then print(\"小宇宙爆发中\");print(BeePlayerBuffTime(\"暗影之舞\"));\n        if  BeeIsRun(\"刺骨\") and BeeGetComboPoints()==5 and BeeTargetDeBuffTime(\"洞悉弱点\")>0  then\n            BeeRun(\"刺骨\");return end\n        if  BeeIsRun(\"伏击\")   then\n            BeeRun(\"伏击\");return end\n        \n        return\n    end\n    return\nend",
					["GUID"] = 5,
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Ability_Creature_Cursed_04",
					["CD"] = 0.5,
				}, -- [5]
				{
					["GUID"] = 6,
					["Name"] = "嫁祸",["Title"] = "|cfffff569嫁祸|r",
					["CD"] = 1,
					["Script"] = "if BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"嫁祸诀窍\",\"focus\") and BeeUnitMana()<60 and BeeRange(focus)<=20 then \n    BeeRun(\"嫁祸诀窍\",\"focus\");\n    return; \nend",
					["Icon"] = "Interface\\Icons\\Ability_BackStab",
					["Description"] = "當滿足條件時自動施放",
				}, -- [6]
			},
		},
		{
			["Name"] = "敏锐PVP",["Title"] = "|cfffff569敏锐PVP|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Script"] = "local pbl = BeeUnitBuffList()\nif BeeUnitHealth(\"player\",\"%\",0)<20 and BeeUnitAffectingCombat() and BeeIsRun(\"治疗石\",\"player\")  then    \n    BeeRun(\"/use 治疗石\");\nend\nif BeeStringFind(\"深度冻结,致盲,制裁之锤,扰乱射击,变形术,死亡缠绕,精神控制,诱惑,冰冻陷阱,击倒,妖术,恐惧,心灵尖啸,恐惧嚎叫,破胆怒吼,恐惧术,心灵惊骇,忏悔\",pbl) and BeeIsRun(\"自利\") then BeeRun(\"自利\");\n    return;\nend\nif BeeStringFind(\"死亡缠绕,诱惑,恐惧,心灵尖啸,恐惧嚎叫,破胆怒吼,恐惧术\",pbl) and BeeIsRun(\"被遗忘者的意志\") then BeeRun(\"被遗忘者的意志\" );\n    return;\nend\nif BeeStringFind(\"变形术,妖术,恐惧,闷棍,心灵尖啸,冰冻陷阱,冰霜之环,恐惧嚎叫,诱惑,致盲,饥饿之寒\",BeeUnitBuffList(\"target\")) and BeeRange(target)<8 then    BeeRun(\"/stopattack\") end\n",
					["Name"] = "保命",["Title"] = "|cfffff569保命|r",
					["Icon"] = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
					["Description"] = "當滿足條件時自動施放",
				}, -- [1]
				{
					["GUID"] = 2,
					["Name"] = "自动章 1号位",["Title"] = "|cfffff569自动章 1号位|r",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\spell_holy_championsbond",
					["Script"] = "if BeeStringFind(\"深度冻结,致盲,制裁之锤,扰乱射击,变形术,死亡缠绕,精神控制,诱惑,冰冻陷阱,击倒,妖术,恐惧,心灵尖啸,恐惧嚎叫,破胆怒吼,恐惧术,心灵惊骇,忏悔\",pbl) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0  then BeeRun(\"/use 13\");\n    return;\nend\n",
				}, -- [2]
				{
					["GUID"] = 3,
					["Script"] = "if BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
					["Name"] = "自动SP 2号位",["Title"] = "|cfffff569自动SP 2号位|r",
					["Icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					["Description"] = "當滿足條件時自動施放",
				}, -- [3]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "if BeeCastSpellFast() then return;end\n\n-- /run BeeSpellFast(\"背刺\",\"target\")      做成宏",
					["GUID"] = 4,
					["Icon"] = "INTERFACE\\ICONS\\achievement_guildperk_bountifulbags",
					["Name"] = "背刺优先",["Title"] = "|cfffff569背刺优先|r",
				}, -- [4]
				{
					["GUID"] = 5,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--自动烟雾弹\nlocal acp = BeeUnitTargetCastSpell(\"烟雾弹\",3,\"法师,术士,德鲁伊,萨满祭司,牧师\",\"变形术,寒冰箭,恐惧,灵魂之火,旋风,奥术飞弹,奥术冲击,混乱箭,火球术,烧尽,闪电箭,闪电链,惩击,精神控制,心灵爆震,妖术,熔岩爆裂\")\nif acp and BeeSpellCD(\"烟雾弹\")==0 and BeeIsRun(\"烟雾弹\",\"nogoal\") then\n    BeeRun(\"烟雾弹\");\n    return;\nend",
					["Icon"] = "INTERFACE\\ICONS\\ability_druid_prowl",
					["Name"] = "烟雾",["Title"] = "|cfffff569烟雾|r",
				}, -- [5]
				{
					["GUID"] = 6,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "local zy = BeeUnitClassBase()\nlocal tbl = BeeUnitBuffList(\"target\")\n--自动闪避\nif BeeUnitPlayerControlled(Unit) and BeeStringFind(\"潜行者,死亡骑士,圣骑士,猎人\",zy) and BeeUnitAffectingCombat() and BeeTargetTargetIsPlayer() and BeeIsRun(\"闪避\",\"nogoal\") and not BeeStringFind(\"拆卸,缴械,心灵惊骇,偷袭,肾击,圣盾术,保护之手,旋风,震荡猛击,震荡波,拦截,冲锋击晕,制裁之锤,忏悔,恐惧,心灵尖啸,死亡缠绕,暗影之怒,深度冻结,破胆怒吼,眩晕\",tbl)  then BeeRun(\"闪避\");\n    return;\nend\nif BeeUnitPlayerControlled(Unit) and BeeStringFind(\"潜行者,战士,死亡骑士,圣骑士,猎人\",zy) and BeeUnitAffectingCombat() and BeeTargetTargetIsPlayer() and BeeIsRun(\"备战就绪\",\"nogoal\") and not BeeStringFind(\"拆卸,缴械,心灵惊骇,偷袭,肾击,圣盾术,保护之手,旋风,震荡猛击,震荡波,拦截,冲锋击晕,制裁之锤,忏悔,恐惧,心灵尖啸,死亡缠绕,暗影之怒,深度冻结,破胆怒吼,眩晕\",tbl) then BeeRun(\"备战就绪\");\n    return;\nend",
					["Icon"] = "INTERFACE\\ICONS\\achievement_guildperk_mountup",
					["Name"] = "闪避",["Title"] = "|cfffff569闪避|r",
				}, -- [6]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "local zy = BeeUnitClassBase()\nif  BeeUnitCastSpellName() and BeeStringFind(\"圣骑士,牧师,德鲁伊,法师,术士,萨满祭司\",zy) and BeeTargetBuffTime(\"保护之手\")==-1 and BeeTargetBuffTime(\"圣盾术\")==-1 and BeeIsRun(\"脚踢\") then\n    BeeRun(\"脚踢\");\n    return;\nend\n\nif  BeeUnitCastSpellName() and BeeStringFind(\"圣骑士,牧师,德鲁伊,法师,术士,萨满祭司\",zy) and BeeTargetBuffTime(\"保护之手\")==-1 and BeeTargetBuffTime(\"圣盾术\")==-1 and BeeIsRun(\"凿击\") and BeeSpellCD(\"脚踢\")>1 then\n    BeeRun(\"凿击\");\n    return;\nend",
					["GUID"] = 7,
					["Icon"] = "INTERFACE\\ICONS\\achievement_guildperk_honorablemention_rank2",
					["Name"] = "打断",["Title"] = "|cfffff569打断|r",
				}, -- [7]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "if  BeeIsRun(\"恢复\") and BeePlayerBuffTime(\"恢复\")<0 and BeeGetComboPoints()>1   then\n    BeeRun(\"恢复\");\n    return;\nend;",
					["GUID"] = 8,
					["Icon"] = "INTERFACE\\ICONS\\achievement_guildperk_quick and dead",
					["Name"] = "常驻恢复",["Title"] = "|cfffff569常驻恢复|r",
				}, -- [8]
				{
					["GUID"] = 9,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "local zy = BeeUnitClassBase()\nlocal tbl = BeeUnitBuffList(\"target\")\n--拆卸部分\nif BeeUnitPlayerControlled(Unit) and BeeStringFind(\"潜行者,战士,死亡骑士,圣骑士,猎人\",zy) and BeeTargetTargetIsPlayer() and BeeIsRun(\"拆卸\") and not BeeStringFind(\"拆卸,缴械,心灵惊骇,偷袭,肾击,圣盾术,保护之手,旋风,震荡猛击,震荡波,拦截,冲锋击晕,制裁之锤,忏悔,恐惧,心灵尖啸,死亡缠绕,暗影之怒,深度冻结,破胆怒吼,眩晕\",tbl) \nthen BeeRun(\"拆卸\");\n    return;\nend",
					["Icon"] = "Interface\\Icons\\Ability_Paladin_ShieldofVengeance",
					["Name"] = "拆卸",["Title"] = "|cfffff569拆卸|r",
				}, -- [9]
				{
					["GUID"] = 10,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "if BeeUnitAffectingCombat()and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\nif BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"嫁祸诀窍\",\"focus\") and BeeUnitMana()<60 and BeeRange(focus)<=20 then \n    BeeRun(\"嫁祸诀窍\",\"focus\");\n    return; \nend",
					["Icon"] = "Interface\\Icons\\Ability_Physical_Taunt",
					["Name"] = "协助 焦点",["Title"] = "|cfffff569协助 焦点|r",
				}, -- [10]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "if BeeRange(target)>6 and BeeGetComboPoints()>0 and BeePlayerBuffTime(\"恢复\")>3 then BeeRun(\"切割\");return; end",
					["GUID"] = 11,
					["Icon"] = "INTERFACE\\ICONS\\achievement_guildperk_everyones a hero",
					["Name"] = "切割",["Title"] = "|cfffff569切割|r",
				}, -- [11]
				{
					["GUID"] = 12,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "if BeeUnitAffectingCombat() and  BeeRange(target)>10 and BeeRange(target)<26 and BeeUnitHealth(\"target\")<100000 then BeeRun(\"暗影步\");return; end",
					["Icon"] = "Interface\\Icons\\Ability_Druid_Dash",
					["Name"] = "鬼步 追踪",["Title"] = "|cfffff569鬼步 追踪|r",
				}, -- [12]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "\n--函数设置\nlocal pbl = BeeUnitBuffList()\nlocal zy = BeeUnitClassBase()\nlocal tbl = BeeUnitBuffList(\"target\")\nlocal act=1;\nif BeePlayerBuffTime(\"消失\")==-1 and BeePlayerBuffTime(\"潜行\")==-1 and  BeePlayerBuffTime(\"凿击\")==-1 then act=0; cx=act; end\nif  BeePlayerBuffTime(\"暗影之舞\")>=0   then baofa=1;end\nif  BeePlayerBuffTime(\"暗影之舞\")<0   then baofa=0;end\nif act == 0 then\n    if baofa == 0 then\n        --输出部分\n        if BeeStringFind(\"圣骑士,牧师,德鲁伊,萨满祭司\",zy) and BeePlayerBuffTime(\"切割\")<1 and BeeSpellCD(\"肾击\")>6 and BeeUnitHealth(\"target\")>70000 and BeeIsRun(\"切割\",\"nogoal\") then\n            BeeRun(\"切割\",\"nogoal\")\n            return;\n        end\n        if BeeStringFind(\"潜行者\",zy) and BeeUnitHealth(\"target\")<20000 and BeeTargetDeBuffTime(\"割裂\")<1 and BeeGetComboPoints()>0 and BeeIsRun(\"割裂\") then\n            BeeRun(\"割裂\");\n            return;\n        end\n        if BeeUnitHealth(\"target\")<20000 and BeeIsRun(\"刺骨\") and BeeGetComboPoints()>3 then\n            BeeRun(\"刺骨\");\n            return;\n        end\n        if BeeUnitHealth(\"target\")>40000 and BeeIsRun(\"肾击\") and BeeGetComboPoints()>4 and not BeeStringFind(\"拆卸,缴械,心灵惊骇,偷袭,肾击,圣盾术,保护之手,旋风,震荡猛击,震荡波,拦截,冲锋击晕,制裁之锤,忏悔,恐惧,心灵尖啸,死亡缠绕,暗影之怒,深度冻结,破胆怒吼,眩晕\",tbl) then\n            BeeRun(\"肾击\");\n            return;\n        end\n        if BeeIsRun(\"刺骨\") and BeeGetComboPoints()>4 then\n            BeeRun(\"刺骨\");\n            return;\n        end\n        if BeeIsRun(\"出血\") and BeeGetComboPoints()<5 then\n            BeeRun(\"出血\");\n            return;\n        end \n    end if baofa == 1 then print(\"小宇宙爆发中\");print(BeePlayerBuffTime(\"暗影之舞\"));\n        return\n    end\n    return\nend\n\n\n\n\n\n\n\n\n\n\n\n",
					["GUID"] = 13,
					["Icon"] = "Interface\\Icons\\Ability_GhoulFrenzy",
					["Name"] = "主输出循环",["Title"] = "|cfffff569主输出循环|r",
				}, -- [13]
			},
		},
		{
		    ["Name"] = "战斗盗贼基础包",["Title"] = "|cfffff569战斗盗贼基础包|r",
			["Version"] = 2012020403,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["CD"] = 0,
					["Script"] = "--坐骑状态\nif IsMounted(\"player\")==1 then\n    return;\nend",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Ability_Warrior_SavageBlow",
					["Name"] = "坐骑状态",["Title"] = "|cfffff569坐骑状态|r",
				}, -- [1]
				{
					["GUID"] = 2,
					["CD"] = 1,
					["Script"] = "--自动保命\nif BeeUnitAffectingCombat() then\n    if UnitHealth(\"player\")/UnitHealthMax(\"player\")<0.45 and BeeIsRun(\"治疗石\") then\n        BeeRun(\"治疗石\");\n    return;end\n    if BeeUnitAffectingCombat() and  BeeSpellCD(\"闪避\")<=0 and BeeUnitHealth(\"player\",\"%\")<40 and BeeIsRun(\"闪避\") then BeeRun(\"闪避\");\n        return;\n    end\n    if BeeUnitBuffInfo(\"player\",2,\"Magic,Curse,Disease,Poison\",0)>=2 and BeeSpellCD(\"暗影斗篷\")<=0 and BeeUnitMana()>=25 and BeeIsRun(\"暗影斗篷\",\"player\") then BeeRun(\"暗影斗篷\",\"player\")\n    return;end\n    if BeeUnitAffectingCombat() and  BeeSpellCD(\"备战就绪\")<=0 and BeeUnitHealth(\"player\",\"%\")<50 and BeeIsRun(\"备战就绪\") then BeeRun(\"备战就绪\");\n        return;\n    end\nend\nif BeeUnitHealth(\"player\",\"%\")<70 and BeeIsRun(\"恢复\",\"player\") and BeePlayerBuffTime(\"恢复\")<0 and BeeGetComboPoints()>1 then\n    BeeRun(\"恢复\",\"player\");\n    return;\nend;\n\n\n\n",
					["Name"] = "自定义保命",["Title"] = "|cfffff569自定义保命|r",
					["Icon"] = "Interface\\Icons\\Ability_Warrior_Safeguard",
					["Description"] = "當滿足條件時自動施放",
				}, -- [2]
				{
					["Enabled"] = true,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--攻击最近的目标\nif not UnitExists(\"target\") and not UnitIsDeadOrGhost(\"player\") and UnitCanAttack(\"player\",\"target\") then\n    BeeAttack(0,0);\nend\n\nif BeePlayerBuffTime(\"切割\")<5  and BeeUnitMana()<60 then return; end; ",
					["GUID"] = 3,
					["CD"] = 0,
					["Icon"] = "Interface\\Icons\\Ability_Whirlwind",
					["Name"] = "自动寻找目标",["Title"] = "|cfffff569自动寻找目标|r",
				}, -- [3]
				{
					["GUID"] = 4,
					["CD"] = 1,
					["Script"] = "local NeedBreak = \"火球术,云雾冲击,冰川冲击,奥术飞弹,灵魂震击,治疗之环,生命吸取,恐惧,圣光术,快速治疗,强效治疗术,魔能火球,冰霜新星,神圣新星,治疗之触,愈合,寒冰箭雨,飓风,烈焰,治疗波,献祭,滋养,次级治疗波,苦修,变形术,暗影修补,圣光闪现,召唤太阳宝珠,黑暗契约,黑暗治疗,暗影打击,烈焰风暴,暗影愈合,寒冰箭,熔岩箭,强制之握,震爆,混乱之箭\"\n\nif BeeStringFind(NeedBreak,BeeUnitCastSpellName()) and BeeTargetBuffTime(\"保护祝福\")==-1 then\n    if BeeIsRun(\"脚踢\") then\n        BeeRun(\"脚踢\");\n        return;\n    end\nend",
					["Name"] = "脚踢打断施法(自定义)",["Title"] = "|cfffff569脚踢打断施法(自定义)|r",
					["Icon"] = "Interface\\Icons\\Spell_Arcane_PortalShattrath",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
				{
					["GUID"] = 5,
					["Name"] = "主输出循环",["Title"] = "|cfffff569主输出循环|r",
					["CD"] = 0.1,
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_DeathKnight_SummonDeathCharger",
					["Script"] = "if BeeSpellCD(\"冲动\")<=0 and BeeUnitMana()<=20 and BeeIsRun(\"冲动\") and BeeUnitHealth(\"target\",\"nil\")>1000000 then BeeRun(\"冲动\");\n    return;\nend\nif BeeGetComboPoints()<=3 and BeePlayerBuffTime(\"切割\")>0 and BeeIsRun(\"影袭\",\"target\") then BeeRun(\"影袭\");\n    return;\nend\nif BeePlayerBuffTime(\"切割\")<2 and BeeUnitHealth(\"target\",\"nil\")>30000 and BeeIsRun(\"切割\",nogoal) and BeeGetComboPoints()>=1 then\n    BeeRun(\"切割\",nogoal);\n    return;\nend\nif BeeIsRun(\"刺骨\") and BeeGetComboPoints()==5  then\n    BeeRun(\"刺骨\");\n    return;\nend\nif BeePlayerBuffTime(\"切割\")>0  and BeeGetComboPoints()==4  and BeeIsRun(\"要害打击\",\"target\") and BeeTargetDeBuffTime(\"要害打击\")<0 then BeeRun(\"要害打击\");\nelse  BeeRun(\"影袭\");\nend\n\n\n\n\n",
				}, -- [5]
				{
					["GUID"] = 6,
					["Script"] = "if BeeSpellCD(\"冲动\")<=0 and BeeUnitMana()<=20 and BeeIsRun(\"冲动\") and BeeUnitHealth(\"target\",\"nil\")>1000000 then BeeRun(\"冲动\");\n    return;\nend\n\nif BeePlayerBuffTime(\"切割\")<3 and BeeUnitHealth(\"target\",\"nil\")>30000 and BeeIsRun(\"切割\",nogoal) and BeeGetComboPoints()>=1 then\n    BeeRun(\"切割\",nogoal);\n    return;\nend\nif BeeIsRun(\"刺骨\") and BeeGetComboPoints()==5 and BeeTargetDeBuffTime(\"割裂\")>=0  then\n    BeeRun(\"刺骨\");\n    return;\nend\nif BeeTargetDeBuffTime(\"割裂\")<0 and BeeGetComboPoints()==5 and BeeIsRun(\"割裂\")  then\n    BeeRun(\"割裂\");\n    return;\nend\nif BeePlayerBuffTime(\"切割\")>0  and BeeGetComboPoints()==4  and BeeIsRun(\"要害打击\",\"target\") and BeeTargetDeBuffTime(\"要害打击\")<0 then BeeRun(\"要害打击\"); else  BeeRun(\"影袭\");\nreturn; end\n\nif BeeGetComboPoints()<=3 and BeeIsRun(\"影袭\",\"target\") then BeeRun(\"影袭\");\n    return;\nend\n\n\n",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Ability_Creature_Cursed_04",
					["Name"] = "加入割裂的主循环",["Title"] = "|cfffff569加入割裂的主循环|r",
				}, -- [6]
				{
					["GUID"] = 7,
					["Name"] = "嫁祸焦点",["Title"] = "|cfffff569嫁祸焦点|r",
					["Script"] = "if BeeUnitPlayerControlled(\"focus\") and BeeIsRun(\"嫁祸诀窍\",\"focus\") and BeeUnitMana()<60 and BeeRange(focus)<=20 then \n    BeeRun(\"嫁祸诀窍\",\"focus\");\n    return; \nend",
					["Enabled"] = 1,
					["Icon"] = "INTERFACE\\ICONS\\inv_chest_chain_06",
					["Description"] = "當滿足條件時自動施放",
				}, -- [7]
				{
					["GUID"] = 8,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "if BeeUnitAffectingCombat() then\nif  BeeIsRun(\"嫁祸诀窍\") then \n    BeeRun(\"/cast [target=targettarget] 嫁祸诀窍\");\n    return; \nend end",
					["Icon"] = "Interface\\Icons\\Ability_Warrior_WarCry",
					["Name"] = "嫁祸T",["Title"] = "|cfffff569嫁祸T|r",
				}, -- [8]
			},
		},
	},
}

end