wowam.ClassBeeScript.WARLOCK=function()

LazyScript=LazyScript or {};
LazyScript["WARLOCK"] = {
	["List"] = {
		{
			["Name"] = "恶魔术士基础包",["Title"] = "|cff9482c9恶魔术士基础包|r",
			["Version"] = 2012022701,
			["Base"] = 1,
			["Items"] = {
				{
					["GUID"] = 1,
					["Name"] = "骑乘状态",["Title"] = "|cff9482c9骑乘状态|r",
					["Script"] = "--CTM 4.3.2 恶魔术士输出脚本 2012/2/26 by ATM\n--骑行状态，不施法\nif IsMounted(\"player\")==1  or BeePlayerBuffTime(\"喝水\")>1 or BeePlayerBuffTime(\"进食\")>1 or BeePlayerBuffTime(\"急救\")>1  then return;end",
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Description"] = "當滿足條件時自動施放",
				}, -- [1]
				{
					["GUID"] = 2,
					["Name"] = "优先技能",["Title"] = "|cff9482c9优先技能|r",
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
					["Icon"] = "Interface\\Icons\\Ability_Mount_GyrocoptorElite",
					["Description"] = "當滿足條件時自動施放",
				}, -- [2]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "if (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"暗淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"暗淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");return;end\n--自动优先保命部分\nif BeeUnitHealth(\"player\",\"%\")<40 and BeeIsRun(\"死亡缠绕\",\"target\") and BeeRange(\"target\")<40 then BeeRun(\"死亡缠绕\",\"target\");return;end\nif BeeUnitHealth(\"player\",\"%\")<40 and BeePower()>0 and BeeIsRun(\"灵魂燃烧\") and BeeIsRun(\"治疗石\") then BeeRun(\"灵魂燃烧\");return;end\nif BeeUnitHealth(\"player\",\"%\")<40 and BeePlayerBuffTime(\"灵魂燃烧\")>1 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\n--人类自利\nif BeeUnitRace(\"player\")==\"人类\" and BeeStringFind(\"惊魂尖叫,深度冻结,致盲,制裁之锤,死亡缠绕,变形术,精神控制,诱惑,冰冻陷阱,妖术,冰霜新星,沉睡\",BeeUnitBuffList()) and BeeIsRun(\"自利\") then BeeRun(\"自利\");return;end\n",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_DeathCoil",
					["Name"] = "优先保命",["Title"] = "|cff9482c9优先保命|r",
				}, -- [3]
				{
					["GUID"] = 4,
					["Script"] = "--自动补BUFF\nif not BeeStringFind(\"邪甲术\",BeeUnitBuffList(\"player\")) then BeeRun(\"邪甲术\");BeeUnitCastSpellDelay(\"邪甲术\",1);return;end\nif BeeUnitHealth(\"pet\")>1 and not UnitIsDeadOrGhost(\"pet\") and BeePlayerBuffTime(\"灵魂链接\")==-1 and BeeIsRun(\"灵魂链接\") then BeeRun(\"灵魂链接\");BeeUnitCastSpellDelay(\"灵魂链接\");return;end",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_FelArmour",
					["Name"] = "自动补BUFF",["Title"] = "|cff9482c9自动补BUFF|r",
				}, -- [4]
				{
					["GUID"] = 5,
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat() and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\")) or BeeUnitCastSpellName(\"player\")==\"烈焰风暴\" or BeeUnitCastSpellName(\"player\")==\"吸取灵魂\" then return;end",
					["Name"] = "自动协助T",["Title"] = "|cff9482c9自动协助T|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofSanctuary",
					["Description"] = "當滿足條件時自動施放",
				}, -- [5]
				{
					["GUID"] = 6,
					["Script"] = "--战斗中瞬招恶魔守卫\nif BeeUnitAffectingCombat() and BeePlayerBuffTime(\"恶魔重生\")>1 and BeeIsRun(\"召唤恶魔守卫\") then BeeRun(\"召唤恶魔卫士\");BeeUnitCastSpellDelay(\"召唤恶魔卫士\");return;end;\nif BeeUnitAffectingCombat() and  BeePower()>0 and (BeeUnitHealth(\"pet\")<=0 or UnitIsDeadOrGhost(\"pet\")) and BeeIsRun(\"灵魂燃烧\") then BeeRun(\"灵魂燃烧\");return;end\nif BeeUnitAffectingCombat() and  (BeeUnitHealth(\"pet\")<=0 or UnitIsDeadOrGhost(\"pet\")) and BeePlayerBuffTime(\"灵魂燃烧\")>1 and BeeIsRun(\"召唤恶魔卫士\") then BeeRun(\"召唤恶魔卫士\");return;end",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Shadow_SummonFelHunter",
					["Name"] = "自动召BB",["Title"] = "|cff9482c9自动召BB|r",
				}, -- [6]
				{
					["GUID"] = 7,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "local daduan=\"寒冰箭雨,星尘,腐臭蜂群,邪能烈焰,绝对服从,奥术波动,饥饿暗影,精神鞭笞,暗影钻削,暮光冲击波,甜美的摇篮曲,寒冰手,穿刺,冰霜之箭,时间漩涡\";\n--小鬼技能,灼烧驱魔,移除一个魔法\ngrouptype=\"\";if GetNumGroupMembers()>0 then grouptype=\"raid\" else grouptype=\"party\";end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"烧灼驱魔\",unit)',\"BeeUnitBuffInfo(unit,2,'Magic',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"塔泰\" and n>0 and BeeIsRun(\"烧灼驱魔\",qusan) then BeeRun(\"烧灼驱魔\",qusan);return;end\n--地狱猎犬技能.吞噬魔法(当前目标和焦点目标),打断施法\nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"基萨迪姆\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and BeeUnitBuffInfo(\"target\",2,\"Magic\",1)>=1 and BeeIsRun(\"吞噬魔法\",\"target\") then BeeRun(\"吞噬魔法\",\"target\") return;end\nif UnitName(\"pet\")==\"基萨迪姆\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and  BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\")) and BeeIsRun(\"法术封锁\",\"target\")  then BeeRun(\"法术封锁\",\"target\");return;end\n--恶魔守卫技能，自动打断技能\nif UnitName(\"pet\")==\"尼尔利克\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and  BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\")) and BeeIsRun(\"巨斧投掷\",\"target\")  then BeeRun(\"巨斧投掷\",\"target\");return;end\n--胖子 卡尔弗格\n--女人 扎利亚娜\n",
					["Icon"] = "Interface\\Icons\\Spell_Shadow_SummonSuccubus",
					["Name"] = "宝宝技能",["Title"] = "|cff9482c9宝宝技能|r",
				}, -- [7]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--自动开饰品\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',10))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',10)))==0 then BeeRun(\"/use 10\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
					["GUID"] = 8,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_Teleport",
					["Name"] = "自动开饰品",["Title"] = "|cff9482c9自动开饰品|r",
				}, -- [8]
				{
					["Enabled"] = 1,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--生命分流\nif BeeUnitAffectingCombat() and BeeUnitMana(\"player\",\"%\",0)<40 and BeeUnitHealth(\"player\",\"%\")>70 and BeeIsRun(\"生命分流\",\"player\") then BeeRun(\"生命分流\",\"player\");return;end",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_BurningSpirit",
					["Name"] = "生命分流",["Title"] = "|cff9482c9生命分流|r",
				}, -- [9]
				{
					["Enabled"] = 1,
					["Script"] = "--特殊情况处理\n--暮光审判\nif (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"黯淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"黯淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");end\n--套装数量判断\nT13=select(2,string.gsub(GetInventoryItemLink('player',1)..GetInventoryItemLink('player',3)..GetInventoryItemLink('player',5)..GetInventoryItemLink('player',7)..GetInventoryItemLink('player',10),\"无面裹布\",\"无面裹布\"))\n--上诅咒\nif BeeUnitBuff(\"元素诅咒\",\"target\",2,2)<1 and BeeIsRun(\"元素诅咒\",\"target\") then BeeRun(\"元素诅咒\",\"target\");BeeUnitCastSpellDelay(\"元素诅咒\",0.9);return;end\n\n--移动时候输出\nif GetUnitSpeed(\"player\")>0 then\n    if BeeUnitHealth(\"target\")>500000 and BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeTargetDeBuffTime(\"痛苦灾祸\")==-1 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\",\"target\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")<=500000 and BeeTargetDeBuffTime(\"痛苦灾祸\")<2 and BeeTargetDeBuffTime(\"末日灾祸\")==-1 and BeeIsRun(\"痛苦灾祸\",\"target\") then BeeRun(\"痛苦灾祸\",\"target\");BeeUnitCastSpellDelay(\"痛苦灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")>150000 and BeeTargetDeBuffTime(\"腐蚀术\")<1 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\",\"target\");BeeUnitCastSpellDelay(\"腐蚀术\",0.9);return;end\n    if BeeUnitMana(\"player\",\"%\",0)<40 and BeeUnitHealth(\"player\",\"%\")>70 and BeeIsRun(\"生命分流\",\"player\") then BeeRun(\"生命分流\",\"player\");return;end\n    if BeeIsRun(\"邪焰\",\"target\") then BeeRun(\"邪焰\",\"target\");return;end\nend\n\n--恶魔守卫攻击\nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"尼尔利克\" and BeeUnitHealth(\"pet\")>1 and BeeIsRun(\"魔刃风暴\",\"nogoal\") then BeeRun(\"/cast 魔刃风暴\");return;end\nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"尼尔利克\" and BeeUnitHealth(\"pet\")>1 and BeeIsRun(\"军团打击\") then BeeRun(\"/cast 军团打击\");return;end\n\n--1.灵魂燃烧(4T13)\nif BeeUnitAffectingCombat() and T13>=4 and BeeIsRun(\"灵魂燃烧\") then BeeRun(\"灵魂燃烧\");return;end\n--2.恶魔变形\nif BeeUnitAffectingCombat() and BeeIsRun(\"恶魔变形\",\"nogoal\") then BeeRun(\"/cast 恶魔变形\");return;end\n--3.恶魔之魂\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"pet\")>0 and  BeeIsRun(\"恶魔增效\") then BeeRun(\"恶魔增效\");return;end\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"pet\")>0 and BeeIsRun(\"恶魔之魂\") then BeeRun(\"恶魔之魂\");return;end\n--4.献祭光环\nif BeeIsRun(\"献祭光环\",\"nogoal\") and BeePlayerBuffTime(\"恶魔变形\")>1 then BeeRun(\"/cast 献祭光环\");return;end\n--5.献祭\nif BeeTargetDeBuffTime(\"献祭\")<2 and BeeIsRun(\"献祭\",\"target\") then BeeRun(\"献祭\");BeeUnitCastSpellDelay(\"献祭\",0.9);return;end\n--6.末日诅咒(如果目标15秒之内推不倒的话)\nif BeeUnitHealth(\"target\")>500000 and BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeTargetDeBuffTime(\"痛苦灾祸\")==-1 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\",\"target\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9);return;end\nif BeeUnitHealth(\"target\")<=500000 and BeeTargetDeBuffTime(\"痛苦灾祸\")<2 and BeeTargetDeBuffTime(\"末日灾祸\")==-1 and BeeIsRun(\"痛苦灾祸\",\"target\") then BeeRun(\"痛苦灾祸\",\"target\");BeeUnitCastSpellDelay(\"痛苦灾祸\",0.9);return;end\n--7.腐蚀术\nif BeeTargetDeBuffTime(\"腐蚀术\")<2 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\");BeeUnitCastSpellDelay(\"腐蚀术\",0.9);return;end\n--8.暗影烈焰(近战范围)\nif BeeUnitAffectingCombat() and BeeIsRun(\"暗影烈焰\",\"target\") and BeeRange(\"target\")<9 then BeeRun(\"暗影烈焰\");return;end\n--9.古尔丹之手\nif BeeIsRun(\"古尔丹之手\") then BeeRun(\"古尔丹之手\");return;end\n--10.烧尽(熔火之心BUFF)\nif BeePlayerBuffTime(\"熔火之心\")>1 and BeeIsRun(\"烧尽\",\"target\") then BeeRun(\"烧尽\",\"target\");return;end\n--11.灵魂之火(灭杀BUFF)\nif (BeePlayerBuffTime(\"灭杀\")>2 or BeeUnitHealth(\"target\",\"%\")<25) and BeeIsRun(\"灵魂之火\",\"target\") then BeeRun(\"灵魂之火\",\"target\");return;end\n--12.烧尽\nif BeeIsRun(\"烧尽\",\"target\") then BeeRun(\"烧尽\",\"target\");return;end",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 10,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_Metamorphosis",
					["Name"] = "恶魔单体输出",["Title"] = "|cff9482c9恶魔单体输出|r",
				}, -- [10]
				{
					["GUID"] = 11,
					["Name"] = "恶魔AOE输出",["Title"] = "|cff9482c9恶魔AOE输出|r",
					["Script"] = "--特殊情况处理\n--暮光审判\nif (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"黯淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"黯淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");end\n--套装数量判断\nT13=select(2,string.gsub(GetInventoryItemLink('player',1)..GetInventoryItemLink('player',3)..GetInventoryItemLink('player',5)..GetInventoryItemLink('player',7)..GetInventoryItemLink('player',10),\"无面裹布\",\"无面裹布\"))\n--上诅咒\nif BeeUnitBuff(\"元素诅咒\",\"target\",2,2)<1 and BeeIsRun(\"元素诅咒\",\"target\") then BeeRun(\"元素诅咒\",\"target\");BeeUnitCastSpellDelay(\"元素诅咒\",0.9);return;end\n\n--移动时候输出\nif GetUnitSpeed(\"player\")>0 then\n    if BeeUnitHealth(\"target\")>500000 and BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeTargetDeBuffTime(\"痛苦灾祸\")==-1 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\",\"target\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")<=500000 and BeeTargetDeBuffTime(\"痛苦灾祸\")<2 and BeeTargetDeBuffTime(\"末日灾祸\")==-1 and BeeIsRun(\"痛苦灾祸\",\"target\") then BeeRun(\"痛苦灾祸\",\"target\");BeeUnitCastSpellDelay(\"痛苦灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")>150000 and BeeTargetDeBuffTime(\"腐蚀术\")<1 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\",\"target\");BeeUnitCastSpellDelay(\"腐蚀术\",0.9);return;end\n    if BeeUnitMana(\"player\",\"%\",0)<40 and BeeUnitHealth(\"player\",\"%\")>70 and BeeIsRun(\"生命分流\",\"player\") then BeeRun(\"生命分流\",\"player\");return;end\n    if BeeIsRun(\"邪焰\",\"target\") then BeeRun(\"邪焰\",\"target\");return;end\nend\n\n--恶魔守卫攻击\nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"尼尔利克\" and BeeUnitHealth(\"pet\")>1 and BeeIsRun(\"魔刃风暴\",\"nogoal\") then BeeRun(\"/cast 魔刃风暴\");return;end\nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"尼尔利克\" and BeeUnitHealth(\"pet\")>1 and BeeIsRun(\"军团打击\") then BeeRun(\"/cast 军团打击\");return;end\n\n--1.灵魂燃烧(4T13)\nif BeeUnitAffectingCombat() and T13>=4 and BeeIsRun(\"灵魂燃烧\") then BeeRun(\"灵魂燃烧\");return;end\n--2.恶魔变形\nif BeeUnitAffectingCombat() and BeeIsRun(\"恶魔变形\",\"nogoal\") then BeeRun(\"/cast 恶魔变形\");return;end\n--3.恶魔之魂(恶魔守卫)\nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"基萨迪姆\" and BeeUnitHealth(\"pet\")>0 and  BeeIsRun(\"恶魔增效\") then BeeRun(\"恶魔增效\");return;end\nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"基萨迪姆\" and BeeUnitHealth(\"pet\")>0 and BeeIsRun(\"恶魔之魂\") then BeeRun(\"恶魔之魂\");return;end\n--4.献祭光环\nif BeeIsRun(\"献祭光环\",\"nogoal\") and BeePlayerBuffTime(\"恶魔变形\")>1 then BeeRun(\"/cast 献祭光环\");return;end\n--5.献祭\nif BeeTargetDeBuffTime(\"献祭\")<2 and BeeIsRun(\"献祭\",\"target\") then BeeRun(\"献祭\");BeeUnitCastSpellDelay(\"献祭\",0.9);return;end\n--6.恶魔之魂(狗)\nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"尼尔利克\" and BeeUnitHealth(\"pet\")>0 and  BeeIsRun(\"恶魔增效\") then BeeRun(\"恶魔增效\");return;end\nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"尼尔利克\" and BeeUnitHealth(\"pet\")>0 and BeeIsRun(\"恶魔之魂\") then BeeRun(\"恶魔之魂\");return;end\n--7.末日诅咒(如果目标15秒之内推不倒的话)\nif BeeUnitHealth(\"target\")>500000 and BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeTargetDeBuffTime(\"痛苦灾祸\")==-1 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\",\"target\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9);return;end\nif BeeUnitHealth(\"target\")<=500000 and BeeTargetDeBuffTime(\"痛苦灾祸\")<2 and BeeTargetDeBuffTime(\"末日灾祸\")==-1 and BeeIsRun(\"痛苦灾祸\",\"target\") then BeeRun(\"痛苦灾祸\",\"target\");BeeUnitCastSpellDelay(\"痛苦灾祸\",0.9);return;end\n--8.腐蚀术\nif BeeTargetDeBuffTime(\"腐蚀术\")<2 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\");BeeUnitCastSpellDelay(\"腐蚀术\",0.9);return;end\n--9.暗影烈焰(近战范围)\nif BeeUnitAffectingCombat() and BeeIsRun(\"暗影烈焰\",\"target\") and BeeRange(\"target\")<9 then BeeRun(\"暗影烈焰\");return;end\n--10.古尔丹之手\nif BeeIsRun(\"古尔丹之手\") then BeeRun(\"古尔丹之手\");return;end\n--11.烧尽(熔火之心BUFF)\nif BeePlayerBuffTime(\"熔火之心\")>1 and BeeIsRun(\"烧尽\",\"target\") then BeeRun(\"烧尽\",\"target\");return;end\n--12.灵魂之火(灭杀BUFF)\nif (BeePlayerBuffTime(\"灭杀\")>2 or BeeUnitHealth(\"target\",\"%\")<25) and BeeIsRun(\"灵魂之火\",\"target\") then BeeRun(\"灵魂之火\",\"target\");return;end\n--13.暗影箭\nif  BeeIsRun(\"暗影箭\",\"target\") then BeeRun(\"暗影箭\",\"target\");return;end",
					["Icon"] = "Interface\\Icons\\Spell_Shadow_SeedOfDestruction",
					["Description"] = "當滿足條件時自動施放",
				}, -- [11]
    		},
		},
		{
			["Name"] = "毁灭术士基础包",["Title"] = "|cff9482c9毁灭术士基础包|r",
			["Version"] = 2012022701,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = 1,
					["Name"] = "骑乘状态",["Title"] = "|cff9482c9骑乘状态|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Script"] = "--CTM 4.3.2 毁灭术士输出脚本 2012/2/26 by ATM\n--骑行状态，不施法\nif IsMounted(\"player\")==1  or BeePlayerBuffTime(\"喝水\")>1 or BeePlayerBuffTime(\"进食\")>1 or BeePlayerBuffTime(\"急救\")>1 then return;end",
				}, -- [1]
				{
					["GUID"] = 2,
					["Name"] = "优先技能",["Title"] = "|cff9482c9优先技能|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Mount_GyrocoptorElite",
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
				}, -- [2]
				{
					["GUID"] = 3,
					["Name"] = "优先保命",["Title"] = "|cff9482c9优先保命|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_DeathCoil",
					["Script"] = "--自动优先保命部分\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"player\",\"%\")<40 and BeeIsRun(\"死亡缠绕\",\"target\") and BeeRange(\"target\")<40 then BeeRun(\"死亡缠绕\",\"target\");return;end\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"player\",\"%\")<40 and BeePower()>0 and BeeIsRun(\"灵魂燃烧\") and BeeIsRun(\"治疗石\") then BeeRun(\"灵魂燃烧\");return;end\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"player\",\"%\")<40 and BeePlayerBuffTime(\"灵魂燃烧\")>1 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\n--人类自利\nif BeeUnitRace(\"player\")==\"人类\" and BeeStringFind(\"惊魂尖叫,深度冻结,致盲,制裁之锤,死亡缠绕,变形术,精神控制,诱惑,冰冻陷阱,妖术,冰霜新星,沉睡\",BeeUnitBuffList()) and BeeIsRun(\"自利\") then BeeRun(\"自利\");return;end\n",
				}, -- [3]
				{
					["GUID"] = 4,
					["Script"] = "--自动补BUFF\nif not BeeStringFind(\"邪甲术\",BeeUnitBuffList(\"player\")) then BeeRun(\"邪甲术\");BeeUnitCastSpellDelay(\"邪甲术\",1);return;end\nif BeeUnitHealth(\"pet\")>1 and not UnitIsDeadOrGhost(\"pet\") and BeePlayerBuffTime(\"灵魂链接\")==-1 and BeeIsRun(\"灵魂链接\") then BeeRun(\"灵魂链接\");BeeUnitCastSpellDelay(\"灵魂链接\");return;end",
					["Name"] = "自动补BUFF",["Title"] = "|cff9482c9自动补BUFF|r",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_FelArmour",
					["Description"] = "當滿足條件時自動施放",
				}, -- [4]
				{
					["GUID"] = 5,
					["Name"] = "自动协助T",["Title"] = "|cff9482c9自动协助T|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofSanctuary",
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat() and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\")) or BeeUnitCastSpellName(\"player\")==\"烈焰风暴\" or BeeUnitCastSpellName(\"player\")==\"吸取灵魂\" then return;end",
				}, -- [5]
				{
					["Enabled"] = 1,
					["Name"] = "自动召BB",["Title"] = "|cff9482c9自动召BB|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_SummonFelHunter",
					["Script"] = "--战斗中瞬招小鬼\nif BeeUnitAffectingCombat() and  BeePower()>0 and (BeeUnitHealth(\"pet\")<=0 or UnitIsDeadOrGhost(\"pet\")) and BeeIsRun(\"灵魂燃烧\") then BeeRun(\"灵魂燃烧\");return;end\nif BeeUnitAffectingCombat() and  (BeeUnitHealth(\"pet\")<=0 or UnitIsDeadOrGhost(\"pet\")) and BeePlayerBuffTime(\"灵魂燃烧\")>1 and BeeIsRun(\"召唤小鬼\") then BeeRun(\"召唤小鬼\");return;end",
				}, -- [6]
				{
					["GUID"] = 7,
					["Name"] = "宝宝技能",["Title"] = "|cff9482c9宝宝技能|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_SummonSuccubus",
					["Script"] = "local spelljd, _, _, _, _, _, _, ddjd = UnitCastingInfo(\"focustarget\")\nlocal spellzj, _, _, _, _, _, _, ddzj = UnitCastingInfo(\"target\")\n--小鬼技能,灼烧驱魔,移除一个魔法\ngrouptype=\"\";if GetNumGroupMembers()>0 then grouptype=\"raid\" else grouptype=\"party\";end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"烧灼驱魔\",unit)',\"BeeUnitBuffInfo(unit,2,'Magic',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif UnitName(\"pet\")==\"塔泰\" and n>0 and BeeIsRun(\"烧灼驱魔\",qusan) then BeeRun(\"烧灼驱魔\",qusan);return;end\n--地狱猎犬技能.吞噬魔法(当前目标和焦点目标),打断施法\nif UnitName(\"pet\")==\"基萨迪姆\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and BeeUnitBuffInfo(\"target\",2,\"Magic\",1)>=1 and BeeIsRun(\"吞噬魔法\",\"target\") then BeeRun(\"吞噬魔法\",\"target\") return;end\nif UnitName(\"pet\")==\"基萨迪姆\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and BeeUnitBuffInfo(\"focustarget\",2,\"Magic\",1)>=1 and BeeIsRun(\"吞噬魔法\",\"focustarget\") then BeeRun(\"吞噬魔法\",\"focustarget\") return;end\nif UnitName(\"pet\")==\"基萨迪姆\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and ddzj == 0 and BeeIsRun(\"法术封锁\",\"target\") then BeeRun(\"法术封锁\",\"target\");return;end\nif UnitName(\"pet\")==\"基萨迪姆\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and ddjd == 0 and BeeIsRun(\"法术封锁\",\"focustarget\") then BeeRun(\"法术封锁\",\"focustarget\");return;end\n--恶魔守卫技能，自动打断技能\nif UnitName(\"pet\")==\"尼尔利克\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and ddzj == 0 and BeeIsRun(\"巨斧投掷\") then BeeRun(\"巨斧投掷\",\"target\");return;end \nif UnitName(\"pet\")==\"尼尔利克\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and ddjd == 0 and BeeIsRun(\"巨斧投掷\",\"focustarget\") then BeeRun(\"巨斧投掷\",\"focustarget\");return;end\n--胖子 卡尔弗格\n--女人 扎利亚娜\n",
				}, -- [7]
				{
					["Enabled"] = 1,
					["Name"] = "自动开饰品",["Title"] = "|cff9482c9自动开饰品|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 8,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_Teleport",
					["Script"] = "--自动开饰品\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',10))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',10)))==0 then BeeRun(\"/use 10\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
				}, -- [8]
				{
					["GUID"] = 9,
					["Name"] = "生命分流",["Title"] = "|cff9482c9生命分流|r",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_BurningSpirit",
					["Script"] = "--生命分流\nif BeeUnitAffectingCombat() and BeeUnitMana(\"player\",\"%\",0)<40 and BeeUnitHealth(\"player\",\"%\")>70 and BeeIsRun(\"生命分流\",\"player\") then BeeRun(\"生命分流\",\"player\");return;end",
				}, -- [9]
				{
					["Enabled"] = 1,
					["Name"] = "毁灭单体输出",["Title"] = "|cff9482c9毁灭单体输出|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 10,
					["Icon"] = "Interface\\Icons\\Spell_Fire_FireBolt",
					["Script"] = "--特殊情况处理\n--暮光审判\nif (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"黯淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"黯淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");end\n--套装数量判断\nT13=select(2,string.gsub(GetInventoryItemLink('player',1)..GetInventoryItemLink('player',3)..GetInventoryItemLink('player',5)..GetInventoryItemLink('player',7)..GetInventoryItemLink('player',10),\"无面裹布\",\"无面裹布\"))\n--上诅咒\nif BeeUnitBuff(\"元素诅咒\",\"target\",2,2)<1 and BeeIsRun(\"元素诅咒\",\"target\") then BeeRun(\"元素诅咒\",\"target\");BeeUnitCastSpellDelay(\"元素诅咒\",0.9);return;end\n--移动时候输出(移動輸出時,優先級是燃燒>暗影灼燒>強力小鬼下的靈魂火>分流>魔化烈焰. )\nif GetUnitSpeed(\"player\")>0 then\n    if BeeUnitHealth(\"target\")>500000 and BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeTargetDeBuffTime(\"痛苦灾祸\")==-1 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\",\"target\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")<=500000 and BeeTargetDeBuffTime(\"痛苦灾祸\")<2 and BeeTargetDeBuffTime(\"末日灾祸\")==-1 and BeeIsRun(\"痛苦灾祸\",\"target\") then BeeRun(\"痛苦灾祸\",\"target\");BeeUnitCastSpellDelay(\"痛苦灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")>150000 and BeeTargetDeBuffTime(\"腐蚀术\")<1 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\",\"target\");BeeUnitCastSpellDelay(\"腐蚀术\",0.9);return;end\n    if BeeIsRun(\"燃烧\",\"target\") then BeeRun(\"燃烧\");return;end\n    if BeeIsRun(\"暗影灼烧\",\"target\") then BeeRun(\"暗影灼烧\");return;end\n    if BeePlayerBuffTime(\"小鬼增效\")>1 and BeeIsRun(\"灵魂之火\",\"target\") then BeeRun(\"灵魂之火\");return;end\n    if BeeUnitMana(\"player\",\"%\",0)<50 and BeeUnitHealth(\"player\",\"%\")>70 and BeeIsRun(\"生命分流\",\"player\") then BeeRun(\"生命分流\",\"player\");return;end\n    if BeeIsRun(\"邪焰\",\"target\") then BeeRun(\"邪焰\",\"target\");return;end\nend\n--灵魂火(强化灵魂之火)\nif BeePlayerBuffTime(\"强化灵魂之火\")<4 and BeeIsRun(\"灵魂之火\",\"target\") then BeeRun(\"灵魂之火\");BeeUnitCastSpellDelay(\"灵魂之火\",3);return;end\n--灵魂燃烧(4t13)\nif BeeUnitAffectingCombat() and T13>=4 and BeeIsRun(\"灵魂燃烧\") then BeeRun(\"灵魂燃烧\");return;end\n--恶魔之魂\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"pet\")>0 and BeeIsRun(\"恶魔之魂\") then BeeRun(\"恶魔之魂\");return;end\n--献祭\nif BeeTargetDeBuffTime(\"献祭\")<3 and BeeIsRun(\"献祭\",\"target\") then BeeRun(\"献祭\",\"target\");BeeUnitCastSpellDelay(\"献祭\",0.9);return;end\n--燃烧\nif BeeIsRun(\"燃烧\",\"target\") then BeeRun(\"燃烧\");return;end\n--末日灾祸(目标活过15秒)\nif BeeUnitHealth(\"target\")>500000 and BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeTargetDeBuffTime(\"痛苦灾祸\")==-1 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\",\"target\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9);return;end\nif BeeUnitHealth(\"target\")<=500000 and BeeTargetDeBuffTime(\"痛苦灾祸\")<2 and BeeTargetDeBuffTime(\"末日灾祸\")==-1 and BeeIsRun(\"痛苦灾祸\",\"target\") then BeeRun(\"痛苦灾祸\",\"target\");BeeUnitCastSpellDelay(\"痛苦灾祸\",0.9);return;end\n--腐蚀术\nif BeeTargetDeBuffTime(\"腐蚀术\")<2 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\");BeeUnitCastSpellDelay(\"腐蚀术\",0.9);return;end\n--暗影灼烧(目标20%HP以下)\nif BeeUnitHealth(\"target\",\"%\",0)<=20 and  BeeIsRun(\"暗影灼烧\",\"target\")  then BeeRun(\"暗影灼烧\");return;end\n--暗影烈焰(近战范围)\nif BeeIsRun(\"暗影烈焰\",\"target\") and BeeRange(\"target\")<9 then BeeRun(\"暗影烈焰\");return;end\n--瞬发灵魂火\nif BeePlayerBuffTime(\"小鬼增效\")>1 and BeeIsRun(\"灵魂之火\",\"target\") then BeeRun(\"灵魂之火\");return;end\n--混乱箭(不在急速效果下)\nif BeeIsRun(\"混乱之箭\",\"target\") then BeeRun(\"混乱之箭\"); return;end\n--烧尽\nif BeeIsRun(\"烧尽\",\"target\") then BeeRun(\"烧尽\");return;end\n",
				}, -- [10]
				{
					["GUID"] = 11,
					["Description"] = "當滿足條件時自動施放",
					["Script"] = "--上诅咒\nif BeeUnitBuff(\"元素诅咒\",\"target\",2,2)<1 and BeeIsRun(\"元素诅咒\",\"target\") then BeeRun(\"元素诅咒\",\"target\");BeeUnitCastSpellDelay(\"元素诅咒\",0.9);return;end\n\n--移动时候输出(移動輸出時,優先級是燃燒>暗影灼燒>強力小鬼下的靈魂火>分流>魔化烈焰. )\nif GetUnitSpeed(\"player\")>0 then\n    if BeeUnitHealth(\"target\")>500000 and BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeTargetDeBuffTime(\"痛苦灾祸\")==-1 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\",\"target\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")<=500000 and BeeTargetDeBuffTime(\"痛苦灾祸\")<2 and BeeTargetDeBuffTime(\"末日灾祸\")==-1 and BeeIsRun(\"痛苦灾祸\",\"target\") then BeeRun(\"痛苦灾祸\",\"target\");BeeUnitCastSpellDelay(\"痛苦灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")>150000 and BeeTargetDeBuffTime(\"腐蚀术\")<1 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\",\"target\");BeeUnitCastSpellDelay(\"腐蚀术\",0.9);return;end\n    if BeeIsRun(\"燃烧\",\"target\") then BeeRun(\"燃烧\");return;end\n    if BeeIsRun(\"暗影灼烧\",\"target\") then BeeRun(\"暗影灼烧\");return;end\n    if BeePlayerBuffTime(\"小鬼增效\")>1 and BeeIsRun(\"灵魂之火\",\"target\") then BeeRun(\"灵魂之火\");return;end\n    if BeeUnitMana(\"player\",\"%\",0)<50 and BeeUnitHealth(\"player\",\"%\")>70 and BeeIsRun(\"生命分流\",\"player\") then BeeRun(\"生命分流\",\"player\");return;end\n    if BeeIsRun(\"邪焰\",\"target\") then BeeRun(\"邪焰\",\"target\");return;end\nend\n--毁灭输出\n--[1]强化灵魂之火(保持这个BUFF最重要)\nif (BeePlayerBuffTime(\"强化灵魂之火\")<3 or BeePlayerBuffTime(\"小鬼增效\")>1) and BeeIsRun(\"灵魂之火\",\"target\") then BeeRun(\"灵魂之火\");BeeUnitCastSpellDelay(\"灵魂之火\",3);return;end\n--[2]腐蚀术\nif BeeTargetDeBuffTime(\"腐蚀术\")<2 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\");return;end\n--[3]末日灾厄\nif BeeUnitHealth(\"target\")>500000 and BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeTargetDeBuffTime(\"痛苦灾祸\")==-1 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\",\"target\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9);return;end\nif BeeUnitHealth(\"target\")<=500000 and BeeTargetDeBuffTime(\"痛苦灾祸\")<2 and BeeTargetDeBuffTime(\"末日灾祸\")==-1 and BeeIsRun(\"痛苦灾祸\",\"target\") then BeeRun(\"痛苦灾祸\",\"target\");BeeUnitCastSpellDelay(\"痛苦灾祸\",0.9);return;end\n--[4]暗影烈焰\nif BeeUnitAffectingCombat() and BeeIsRun(\"暗影烈焰\",\"target\") and BeeRange(\"target\")<9 then BeeRun(\"暗影烈焰\");return;end\n--[5]恶魔之魂\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"pet\")>0 and BeeIsRun(\"恶魔之魂\") then BeeRun(\"恶魔之魂\");return;end\n--AOE输出\nif BeeIsRun(\"腐蚀之种\",\"target\") and BeeTargetDeBuffTime(\"腐蚀之种\")<0 then BeeRun(\"腐蚀之种\",\"target\");return;end\n--[6]献祭\nif BeeTargetDeBuffTime(\"献祭\")<2 and BeeIsRun(\"献祭\",\"target\") then BeeRun(\"献祭\");BeeUnitCastSpellDelay(\"献祭\",0.9);return;end\n--[7]燃烧\nif BeeIsRun(\"燃烧\",\"target\") then BeeRun(\"燃烧\");return;end\n--[8]混乱之箭\nif BeeIsRun(\"混乱之箭\",\"target\") then BeeRun(\"混乱之箭\"); return;end\n--[9]烧尽(仅作为所有技能都CD时的填充技能)\nif BeeIsRun(\"烧尽\",\"target\") then BeeRun(\"烧尽\");return;end\n\n\n",
					["Icon"] = "Interface\\Icons\\Spell_Shadow_RainOfFire",
					["Name"] = "毁灭AOE输出",["Title"] = "|cff9482c9毁灭AOE输出|r",
				}, -- [11]
			},
		},
		{
		    ["Name"] = "痛苦术士基础包",["Title"] = "|cff9482c9痛苦术士基础包|r",
			["Version"] = 2012022701,
			["Base"] = 1,
			["Items"] = {
				{
					["Enabled"] = true,
					["Name"] = "骑乘状态",["Title"] = "|cff9482c9骑乘状态|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 1,
					["Icon"] = "Interface\\Icons\\Ability_Mount_Gryphon_01",
					["Script"] = "--CTM 4.3 痛苦术士输出脚本 2011/12/25 by ATM\n--骑行状态，不施法\nif IsMounted(\"player\")==1  or BeePlayerBuffTime(\"喝水\")>1 or BeePlayerBuffTime(\"进食\")>1 or BeePlayerBuffTime(\"急救\")>1 then return;end",
				}, -- [1]
				{
					["Enabled"] = true,
					["Name"] = "优先技能",["Title"] = "|cff9482c9优先技能|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 2,
					["Icon"] = "Interface\\Icons\\Ability_Mount_GyrocoptorElite",
					["Script"] = "--插入技能\nif BeeCastSpellFast() then return;end",
				}, -- [2]
				{
					["Enabled"] = true,
					["Name"] = "优先保命",["Title"] = "|cff9482c9优先保命|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 3,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_DeathCoil",
					["Script"] = "--自动优先保命部分\nif BeeUnitHealth(\"player\",\"%\")<40 and BeeIsRun(\"死亡缠绕\",\"target\") and BeeRange(\"target\")<40 then BeeRun(\"死亡缠绕\",\"target\");return;end\nif BeeUnitHealth(\"player\",\"%\")<40 and BeePower()>0 and BeeIsRun(\"灵魂燃烧\") and BeeIsRun(\"治疗石\") then BeeRun(\"灵魂燃烧\");return;end\nif BeeUnitHealth(\"player\",\"%\")<40 and BeePlayerBuffTime(\"灵魂燃烧\")>1 and BeeIsRun(\"治疗石\") then BeeRun(\"治疗石\");return;end\n--人类自利\nif BeeUnitRace(\"player\")==\"人类\" and BeeStringFind(\"惊魂尖叫,深度冻结,致盲,制裁之锤,死亡缠绕,变形术,精神控制,诱惑,冰冻陷阱,妖术,冰霜新星,沉睡\",BeeUnitBuffList()) and BeeIsRun(\"自利\") then BeeRun(\"自利\");return;end\n",
				}, -- [3]
				{
					["Enabled"] = true,
					["Name"] = "自动补BUFF",["Title"] = "|cff9482c9自动补BUFF|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 4,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_FelArmour",
					["Script"] = "--自动补BUFF\nif not BeeStringFind(\"邪甲术\",BeeUnitBuffList(\"player\")) then BeeRun(\"邪甲术\");BeeUnitCastSpellDelay(\"邪甲术\",1);return;end\nif BeeUnitHealth(\"pet\")>1 and not UnitIsDeadOrGhost(\"pet\") and BeePlayerBuffTime(\"灵魂链接\")==-1 and BeeIsRun(\"灵魂链接\") then BeeRun(\"灵魂链接\");BeeUnitCastSpellDelay(\"灵魂链接\");return;end",
				}, -- [4]
				{
					["Enabled"] = true,
					["Name"] = "自动协助T",["Title"] = "|cff9482c9自动协助T|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 5,
					["Icon"] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofSanctuary",
					["Script"] = "--自动协助焦点T\nif BeeUnitAffectingCombat()and (UnitName(\"target\")==nil or UnitIsDead(\"target\"))  and not UnitIsDead(\"focustarget\") and BeeUnitCanAttack(\"focustarget\") then BeeRun(\"/target [target=focustarget]\");end\n\n--免开羊，免打断自己的法术\nlocal MKY=\"忏悔,变形术,妖术,诱惑,冰冻陷阱\";\nif BeeStringFind(MKY,BeeUnitBuffList(\"target\")) or BeeUnitCastSpellName(\"player\")==\"烈焰风暴\" or BeeUnitCastSpellName(\"player\")==\"吸取灵魂\" then return;end",
				}, -- [5]
				{
					["Enabled"] = true,
					["Name"] = "自动召BB",["Title"] = "|cff9482c9自动召BB|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 6,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_SummonFelHunter",
					["Script"] = "--战斗中瞬招恶魔守卫\nif BeeUnitAffectingCombat() and  BeePower()>0 and (BeeUnitHealth(\"pet\")<=0 or UnitIsDeadOrGhost(\"pet\")) and BeeIsRun(\"灵魂燃烧\") then BeeRun(\"灵魂燃烧\");return;end\nif BeeUnitAffectingCombat() and  (BeeUnitHealth(\"pet\")<=0 or UnitIsDeadOrGhost(\"pet\")) and BeePlayerBuffTime(\"灵魂燃烧\")>1 and BeeIsRun(\"召唤地狱猎犬\") then BeeRun(\"召唤地狱猎犬\");return;end",
				}, -- [6]
				{
					["Enabled"] = true,
					["Name"] = "宝宝技能",["Title"] = "|cff9482c9宝宝技能|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 7,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_SummonSuccubus",
					["Script"] = "local daduan=\"寒冰箭雨,星尘,腐臭蜂群,邪能烈焰,绝对服从,奥术波动,饥饿暗影,精神鞭笞,暗影钻削,暮光冲击波,甜美的摇篮曲,寒冰手,穿刺,冰霜之箭,时间漩涡\";\n--小鬼技能,灼烧驱魔,移除一个魔法\ngrouptype=\"\";if GetNumGroupMembers()>0 then grouptype=\"raid\" else grouptype=\"party\";end\nlocal n,qusan = BeeGroupCountScript('BeeRange(unit)<=40 and BeeIsRun(\"烧灼驱魔\",unit)',\"BeeUnitBuffInfo(unit,2,'Magic',0)>0 and not UnitIsDeadOrGhost(unit)\",grouptype) \nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"塔泰\" and n>0 and BeeIsRun(\"烧灼驱魔\",qusan) then BeeRun(\"烧灼驱魔\",qusan);return;end\n--地狱猎犬技能.吞噬魔法(当前目标和焦点目标),打断施法\nif BeeUnitAffectingCombat() and UnitName(\"pet\")==\"基萨迪姆\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and BeeUnitBuffInfo(\"target\",2,\"Magic\",1)>=1 and BeeIsRun(\"吞噬魔法\",\"target\") then BeeRun(\"吞噬魔法\",\"target\") return;end\nif UnitName(\"pet\")==\"基萨迪姆\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and  BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\")) and BeeIsRun(\"法术封锁\",\"target\")  then BeeRun(\"法术封锁\",\"target\");return;end\n--恶魔守卫技能，自动打断技能\nif UnitName(\"pet\")==\"尼尔利克\" and (BeeUnitHealth(\"pet\")>1 or not UnitIsDeadOrGhost(\"pet\")) and  BeeUnitAffectingCombat() and BeeStringFind(daduan,BeeUnitCastSpellName(\"target\")) and BeeIsRun(\"巨斧投掷\",\"target\")  then BeeRun(\"巨斧投掷\",\"target\");return;end\n\n--胖子 卡尔弗格\n--女人 扎利亚娜\n",
				}, -- [7]
				{
					["Enabled"] = true,
					["Name"] = "自动开饰品",["Title"] = "|cff9482c9自动开饰品|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 8,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_Teleport",
					["Script"] = "--自动开饰品\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',10))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',10)))==0 then BeeRun(\"/use 10\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',13))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',13)))==0 then BeeRun(\"/use 13\") return end\nif BeeUnitAffectingCombat() and GetItemSpell(GetItemInfo(GetInventoryItemLink('player',14))) and BeeSpellCD(GetItemInfo(GetInventoryItemLink('player',14)))==0 then BeeRun(\"/use 14\")  return end",
				}, -- [8]
				{
					["Enabled"] = true,
					["Name"] = "生命分流",["Title"] = "|cff9482c9生命分流|r",
					["Description"] = "當滿足條件時自動施放",
					["GUID"] = 9,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_BurningSpirit",
					["Script"] = "--生命分流\nif BeeUnitAffectingCombat() and BeeUnitMana(\"player\",\"%\",0)<40 and BeeUnitHealth(\"player\",\"%\")>70 and BeeIsRun(\"生命分流\",\"player\") then BeeRun(\"生命分流\",\"player\");return;end",
				}, -- [9]
				{
					["GUID"] = 10,
					["Script"] = "--特殊情况处理\n--暮光审判\nif (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"黯淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"黯淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");end\n--套装数量判断\nT13=select(2,string.gsub(GetInventoryItemLink('player',1)..GetInventoryItemLink('player',3)..GetInventoryItemLink('player',5)..GetInventoryItemLink('player',7)..GetInventoryItemLink('player',10),\"无面裹布\",\"无面裹布\"))\n--上诅咒\nif BeeUnitBuff(\"元素诅咒\",\"target\",2,2)<1 and BeeIsRun(\"元素诅咒\",\"target\") then BeeRun(\"元素诅咒\",\"target\");BeeUnitCastSpellDelay(\"元素诅咒\",0.9);return;end\n\n--移动时候输出(瞬发dot>夜幕时的暗箭>生命分流>魔化烈焰)\nif GetUnitSpeed(\"player\")>0 then\n    if BeeUnitHealth(\"target\")>500000 and BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeTargetDeBuffTime(\"痛苦灾祸\")==-1 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\",\"target\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")<=500000 and BeeTargetDeBuffTime(\"痛苦灾祸\")<2 and BeeTargetDeBuffTime(\"末日灾祸\")==-1 and BeeIsRun(\"痛苦灾祸\",\"target\") then BeeRun(\"痛苦灾祸\",\"target\");BeeUnitCastSpellDelay(\"痛苦灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")>150000 and BeeTargetDeBuffTime(\"腐蚀术\")<1 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\",\"target\");BeeUnitCastSpellDelay(\"腐蚀术\",0.9);return;end\n    if BeePlayerBuffTime(\"夜幕\")>1 and BeeIsRun(\"暗影箭\",\"target\") then BeeRun(\"暗影箭\");return;end\n    if BeeUnitMana(\"player\",\"%\",0)<50 and BeeUnitHealth(\"player\",\"%\")>70 and BeeIsRun(\"生命分流\",\"player\") then BeeRun(\"生命分流\",\"player\");return;end\n    if BeeIsRun(\"邪焰\",\"target\") then BeeRun(\"邪焰\",\"target\");return;end\nend\n--灵魂燃烧 4T13\nif BeeUnitAffectingCombat() and T13>=4 and BeeIsRun(\"灵魂燃烧\") then BeeRun(\"灵魂燃烧\");return;end\n--恶魔之魂\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"pet\")>0 and  BeeIsRun(\"恶魔之魂\") then BeeRun(\"恶魔之魂\"); return;end\n--腐蚀\nif BeeTargetDeBuffTime(\"腐蚀术\")<2 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\");BeeUnitCastSpellDelay(\"腐蚀术\",0.9);return;end\n--痛苦无常\nif BeeTargetDeBuffTime(\"痛苦无常\") <2 and  BeeIsRun(\"痛苦无常\",\"target\") then BeeRun(\"痛苦无常\");BeeUnitCastSpellDelay(\"痛苦无常\",1);return;end\n--末日灾祸\nif BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9)return;end\n--鬼影缠身\nif BeeIsRun(\"鬼影缠身\",\"target\") then BeeRun(\"鬼影缠身\");return;end\n--吸取灵魂 25%以下\nif BeeUnitHealth(\"target\",\"%\",0)<=25 and BeeIsRun(\"吸取灵魂\",\"target\") and not BeeUnitCastSpellName(\"player\") then BeeRun(\"吸取灵魂\");return;end\n--暗影烈焰 近战位\nif BeeIsRun(\"暗影烈焰\",\"target\") and BeeRange(\"target\")<8  then BeeRun(\"暗影烈焰\");return;end\n--暗影箭\nif BeeIsRun(\"暗影箭\",\"target\") then BeeRun(\"暗影箭\");return;end\n",
					["Description"] = "當滿足條件時自動施放",
					["Enabled"] = 1,
					["Icon"] = "Interface\\Icons\\Spell_Shadow_Requiem",
					["Name"] = "痛苦单体输出",["Title"] = "|cff9482c9痛苦单体输出|r",
				}, -- [10]
				{
					["GUID"] = 11,
					["Name"] = "痛苦AOE输出",["Title"] = "|cff9482c9痛苦AOE输出|r",
					["Description"] = "當滿足條件時自動施放",
					["Icon"] = "Interface\\Icons\\Spell_Shadow_SeedOfDestruction",
					["Script"] = "--特殊情况处理\n--暮光审判\nif (BeeUnitCastSpellTime(\"target\")<1.5 and BeeUnitCastSpellName(\"target\")==\"暮光审判\") or (BeeUnitBuff(\"黯淡之光\",\"player\",2,0)<1.5 and BeeStringFind(\"黯淡之光\" ,BeeUnitBuffList(\"player\")))then BeeRun(\"/click ExtraActionButton1\");end\n--套装数量判断\nT13=select(2,string.gsub(GetInventoryItemLink('player',1)..GetInventoryItemLink('player',3)..GetInventoryItemLink('player',5)..GetInventoryItemLink('player',7)..GetInventoryItemLink('player',10),\"无面裹布\",\"无面裹布\"))\n--上诅咒\nif BeeUnitBuff(\"元素诅咒\",\"target\",2,2)<1 and BeeIsRun(\"元素诅咒\",\"target\") then BeeRun(\"元素诅咒\",\"target\");BeeUnitCastSpellDelay(\"元素诅咒\",0.9);return;end\n\n--移动时候输出(瞬发dot>夜幕时的暗箭>生命分流>魔化烈焰)\nif GetUnitSpeed(\"player\")>0 then\n    if BeeUnitHealth(\"target\")>500000 and BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeTargetDeBuffTime(\"痛苦灾祸\")==-1 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\",\"target\");BeeUnitCastSpellDelay(\"末日灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")<=500000 and BeeTargetDeBuffTime(\"痛苦灾祸\")<2 and BeeTargetDeBuffTime(\"末日灾祸\")==-1 and BeeIsRun(\"痛苦灾祸\",\"target\") then BeeRun(\"痛苦灾祸\",\"target\");BeeUnitCastSpellDelay(\"痛苦灾祸\",0.9);return;end\n    if BeeUnitHealth(\"target\")>150000 and BeeTargetDeBuffTime(\"腐蚀术\")<1 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\",\"target\");BeeUnitCastSpellDelay(\"腐蚀术\",0.9);return;end\n    if BeePlayerBuffTime(\"夜幕\")>1 and BeeIsRun(\"暗影箭\",\"target\") then BeeRun(\"暗影箭\");return;end\n    if BeeUnitMana(\"player\",\"%\",0)<50 and BeeUnitHealth(\"player\",\"%\")>70 and BeeIsRun(\"生命分流\",\"player\") then BeeRun(\"生命分流\",\"player\");return;end\n    if BeeIsRun(\"邪焰\",\"target\") then BeeRun(\"邪焰\",\"target\");return;end\nend\n--痛苦术士输出脚本\n--灵魂燃烧 4T13\nif BeeUnitAffectingCombat() and T13>=4 and BeeIsRun(\"灵魂燃烧\") then BeeRun(\"灵魂燃烧\");return;end\n--恶魔之魂\nif BeeUnitAffectingCombat() and BeeUnitHealth(\"pet\")>0 and  BeeIsRun(\"恶魔之魂\") then BeeRun(\"恶魔之魂\"); return;end\n--[4]AOE输出\nif BeeIsRun(\"腐蚀之种\",\"target\") and BeeTargetDeBuffTime(\"腐蚀之种\")<0 then BeeRun(\"腐蚀之种\",\"target\");return;end\n--[4]腐蚀术\nif BeeTargetDeBuffTime(\"腐蚀术\")<2 and BeeIsRun(\"腐蚀术\",\"target\") then BeeRun(\"腐蚀术\");return;end\n--[5]痛苦无常\nif BeeTargetDeBuffTime(\"痛苦无常\") <2 and  BeeIsRun(\"痛苦无常\",\"target\") then BeeRun(\"痛苦无常\");BeeUnitCastSpellDelay(\"痛苦无常\",1);return;end\n--[3]末日灾厄\nif BeeTargetDeBuffTime(\"末日灾祸\")<2 and BeeIsRun(\"末日灾祸\",\"target\") then BeeRun(\"末日灾祸\");return;end\n--[7]暗影烈焰\nif BeeIsRun(\"暗影烈焰\",\"target\") and BeeRange(\"target\")<8  then BeeRun(\"暗影烈焰\");return;end\n--[6]吸取灵魂(目标血量25%以下)\nif BeeUnitHealth(\"target\",\"%\",0)<=25 then \n    if BeeIsRun(\"吸取灵魂\",\"target\") and not BeeUnitCastSpellName(\"player\") then BeeRun(\"吸取灵魂\");return;end\nelse\n    if BeeIsRun(\"暗影箭\",\"target\") then BeeRun(\"暗影箭\");return;end\nend\n",
				}, -- [11]
			},
		},
	},
}
end