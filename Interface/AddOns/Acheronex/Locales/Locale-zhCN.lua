local L = LibStub("AceLocale-3.0"):NewLocale("Acheron", "zhCN")
if not L then return end

-- config strings

L["config"] = "设置"
L["Toggle the Configuration Dialog"] = "打开配置窗口"

L["show"] = "显示"
L["Show Acheron Death Reports"] = "显示Acheron死亡报告"

L["Hint"] = "\n\n|cffafa4ff左键点击|r |cffffffff显示报告|r\n|cffafa4ff右键点击|r |cffffffff显示设置|r"

L["General"] = "一般选项"
L["Enable"] = "启用"
L["Enable or disable data collection"] = "启用或禁用数据收集"
L["History"] = "历史"
L["The amount of history, in seconds, of combat log to keep per report"] = "每个记录中每秒战斗记录的保存数量"
L["Number of Reports"] = "报告数量"
L["The total number of death reports to keep, 0 for no limit"] = "设置保存最多几份报告\n(0没有限制)"
L["Clear Acheron When Joining Party/Raid"] = "当加入小队/团队时清除记录"
L["Clear Acheron when joining party/raid (will confirm first if Confirm Clear is checked)"] = "当加入小队/团队时清除记录(如果确认清除已勾选)"
L["Confirm Clear"] = "确认清除"
L["Confirm before clearing any/all Acheron death reports"] = "在清除所有死因报告前确认"
L["Clear Acheron?"] = "清除所有的死亡报告？"
L["Clear Acheron for %s?"] = "清除%s的死亡报告"
L["Yes"] = "是"
L["No"] = "否"
L["Disable in PvP"] = "PvP 状态时取消"
L["Automatically disables Acheron when entering a PvP zone"] = "進入 PvP区域时自动取消Acheron"

L["Enable White List"] = "启用白名单"
L["When the white list is enabled, only auras on the white list will be tracked."] = "当启用白名单后只有在名单上的特效会被记录"
L["Enable Black List"] = "启用黑名单"
L["When the black list is enabled, any auras on the black list will not be tracked."] = "当启用黑名单后只有名单上的特效不会被记录"
L["Auras"] = "特效"
L["Aura"] = "特效"
L["List"] = "列表"
L["Select the desired list from the dropdown menu and enter the name of a buff or debuff to track."] = "在框中填入你想要追踪的增益或减益法术"
L["You must select the list from the dropdown menu for which to add this aura"] = "你只能从已填入的特效列表中选择"
L["You must enter a value for the aura name"] = "你必须填写特效名称"
L["White List"] = "白名单"
L["Black List"] = "黑名单"
L["Delete"] = "删除"
L["Are you sure you want to delete this aura from the white list?"] = "确认要把这个特效从白名单删除？"
L["Are you sure you want to delete this aura from the black list?"] = "确认要把这个特效从黑名单删除？"

L["Pets"] = "宠物"
L["Show Pets"] = "显示宠物伤害"
L["Include pets in the dropdown list of available death reports"] = "在所有死亡报告中显示宠物伤害"
L["Show Only My Pet"] = "只显示我的宠物伤害"
L["Only show your own pet in the dropdown list of available death reports"] = "在所有死亡报告终止显示我的宠物伤害"

L["Display"] = "显示选项"
L["Font Size"] = "字体大小"
L["The font size of the death report entries"] = "设置死亡报告字体大小"
L["Timeline to Show"] = "显示的报告数量"
L["If the main UI is displayed without a specific player chosen, display the last this number of death reports"] = "如果主要窗口沒有特定玩家被选定，显示多少玩家的死亡报告"

L["Profile: %s"] = "配置文件: %s"

-- combat log strings

L["Melee"] = "近战攻击"
L["Environment"] = "环境伤害"
L["Unknown"] = "未知"
L["Death"] = "死亡"
L["Dodge"] = "躲闪"
L["Parry"] = "招架"
L["Miss"] = "未击中"
L["Resist"] = "抵抗"

-- report strings

L["Filter"] = "过滤"
L["Show"] = "显示"
L["Time to Show"] = "时间显示过滤"
L["Amount Filtered"] = "数值小于则过滤"
L["Damage"] = "伤害"
L["Healing"] = "治疗"
L["Absorbed"] = "吸收"
L["Buffs"] = "增益法术"
L["Debuffs"] = "减益法术"

L["Report"] = "死亡报告"
L["Report To"] = "输出报告到"
L["Whisper To"] = "密语给"
L["Absolute Health"] = "实际血量"

L["Clear"] = "清除"
L["Clear All"] = "清除所有"
L["Ctrl-left-click a line in the combat log to report.\nAlt-left-click a line to report just that line."]  = "在战斗记录上按 Ctrl-左键 报告所有记录\n在战斗记录上按  Alt-左键 显示该条记录"

L["say"] = "说"
L["party"] = "小队"
L["raid"] = "团队"
L["guild"] = "公会"
L["officer"] = "官员"
L["whisper"] = "密语"


L["Acheron: %s [%s]"] = "Acheron: %s [%s]"
L["Acheron: No whisper target"] = "Acheron: 没有密语的目标"
L["Acheron: Whisper target is not a player"] = "Acheron: 密语目标不是一个玩家"
L["Acheron: You are not in a party"] = "Acheron: 你不在一个小队中"
L["Acheron: You are not in a raid"] = "Acheron: 你不在一个团队中"
L["Acheron: You are not in a guild"] = "Acheron: 你不在一个公会中"
L["Acheron: No such channel: %s"] = "Acheron: 没有此频道: %s"

L["Ctrl-left-click to report from this point.\nAlt-left-click to report just this line."] = "按 Ctrl-左键 报告这一行到底的所有记录\n按  Alt-左键 报告这一行记录"
L["Critical"] = "爆击"
L["Crushing"] = "碾压"
L["Font show size"] = "报告字体大小"
L["Main Description"] = "这是一款死亡倒计时Buff,Debuff和受伤害统计插件，可以直观和快速地查看死亡前0s~60s的状态,  毒瘤们说我开了技能了呀，这下露馅了吧。Fixed By allan"
L["Max Damage Filtered amount"] = "过滤数值的最大值设置"
L["直伤"] = "直伤"