local L = LibStub("AceLocale-3.0"):NewLocale("Acheron", "zhTW")
if not L then return end

-- config strings

L["config"] = "設定" 
L["Toggle the Configuration Dialog"] = "打開設定視窗"

L["show"] = "顯示" 
L["Show Acheron Death Reports"] = "顯示死因報告"

L["Hint"] = "\n\n|cffafa4ff左鍵點擊|r |cffffffff顯示報告|r\n|cffafa4ff右鍵點擊|r |cffffffff顯示設定|r"

L["General"] = "一般選項"
L["Enable"] = "啟用"
L["Enable or disable data collection"] = "啟用或取消死因蒐集"
L["History"] = "戰鬥紀錄保存數量"
L["The amount of history, in seconds, of combat log to keep per report"] = "每筆記錄中每秒戰鬥記錄的保存數量"
L["Number of Reports"] = "報告保存數量"
L["The total number of death reports to keep, 0 for no limit"] = "設定保存最多幾筆死因報告\n(0為無限制)"
L["Clear Acheron When Joining Party/Raid"] = "當加入隊伍/團隊時清除記錄"
L["Clear Acheron when joining party/raid (will confirm first if Confirm Clear is checked)"] = "當加入隊伍/團隊時清除記錄(如果確認清除已勾選)"
L["Confirm Clear"] = "確認清除"
L["Confirm before clearing any/all Acheron death reports"] = "在清除所有死因報告前確認"
L["Clear Acheron?"] = "清除所有的死因報告？"
L["Clear Acheron for %s?"] = "清除%s的死因報告？"
L["Yes"] = "是"
L["No"] = "否"
L["Disable in PvP"] = "PvP 狀態時取消"
L["Automatically disables Acheron when entering a PvP zone"] = "進入 PvP 區域時自動取消 Acheron"

L["Enable White List"] = "啟用白名單"
L["When the white list is enabled, only auras on the white list will be tracked."] = "當啟動白名單後只有在名單上的特效會被記錄"
L["Enable Black List"] = "啟用黑名單"
L["When the black list is enabled, any auras on the black list will not be tracked."] = "當啟動黑名單後只有名單上的特效不會被記錄"
L["Auras"] = "特效"
L["Aura"] = "特效"
L["List"] = "清單"
L["Select the desired list from the dropdown menu and enter the name of a buff or debuff to track."] = "在欄位中填入你想要追蹤的增益或減益法術"
L["You must select the list from the dropdown menu for which to add this aura"] = "你只能從已填入的特效清單中選擇"
L["You must enter a value for the aura name"] = "你必須填入特效名稱"
L["White List"] = "白名單"
L["Black List"] = "黑名單"
L["Delete"] = "刪除"
L["Are you sure you want to delete this aura from the white list?"] = "確定要把這個特效從白名單刪除？"
L["Are you sure you want to delete this aura from the black list?"] = "確定要把這個特效從黑名單刪除？"

L["Pets"] = "寵物" 
L["Show Pets"] = "顯示寵物傷害" 
L["Include pets in the dropdown list of available death reports"] = "在所有死因報告中顯示寵物傷害"
L["Show Only My Pet"] = "只顯示我的寵物傷害"
L["Only show your own pet in the dropdown list of available death reports"] = "在所有死因報告終止顯示我的寵物傷害" 

L["Display"] = "顯示"
L["Font Size"] = "字型大小"
L["The font size of the death report entries"] = "死因報告的字型大小"
L["Timeline to Show"] = "顯示的報告數量" 
L["If the main UI is displayed without a specific player chosen, display the last this number of death reports"] = "如果主要視窗沒有特定玩家被選定，顯示多少玩家於死因報告"

L["Profile: %s"] = true

-- combat log strings

L["Melee"] = "近戰攻擊"
L["Environment"] = "環境傷害"
L["Unknown"] = "未知"
L["Death"] = "死亡"
L["Dodge"] = "閃躲"
L["Parry"] = "招架"
L["Miss"] = "未命中"
L["Resist"] = "抵抗"

-- report strings

L["Filter"] = "過濾"
L["Show"] = "顯示"
L["Time to Show"] = "時間顯示過濾"
L["Amount Filtered"] = "数值小于则過濾"
L["Damage"] = "傷害"
L["Healing"] = "治療"
L["Absorbed"] = "吸收"
L["Buffs"] = "增益法術"
L["Debuffs"] = "減益法術"

L["Report"] = "死因報告"
L["Report To"] = "將死因回報給"
L["Whisper To"] = "將死因密語給"
L["Absolute Health"] = "實際血量"

L["Clear"] = "清除"
L["Clear All"] = "清除所有"
L["Ctrl-left-click a line in the combat log to report.\nAlt-left-click a line to report just that line."] = "在戰鬥記錄上按 Ctrl-left-click 回報所有記錄\n在戰鬥記錄上按 Alt-left-click 回報該筆記錄"

L["say"] = "說"
L["party"] = "隊伍"
L["raid"] = "團隊"
L["guild"] = "公會"
L["officer"] = "幹部"
L["whisper"] = "密語"

L["Acheron: %s [%s]"] = "Acheron: %s [%s]" 
L["Acheron: No whisper target"] = "Acheron: 無密語目標" 
L["Acheron: Whisper target is not a player"] = "Acheron: 密語目標為非玩家角色"
L["Acheron: You are not in a party"] = "Acheron: 你不在隊伍中"
L["Acheron: You are not in a raid"] = "Acheron: 你不在團隊中"
L["Acheron: You are not in a guild"] = "Acheron: 你沒有公會"
L["Acheron: No such channel: %s"] = "Acheron: 沒有這個頻道"

L["Ctrl-left-click to report from this point.\nAlt-left-click to report just this line."] = "按 Ctrl-left-click 回報此時間點的所有記錄\n按 Alt-left-click 回報此行記錄"
L["Critical"] = "爆擊"
L["Crushing"] = "碾壓"
L["Font show size"] = "报告字体大小"
L["Main Description"] = "這是一款死亡倒計時Buff,Debuff和受傷害統計插件，可以直觀和快速地查看死亡前0s~60s的狀態, 方便找出毒瘤。Fixed By allan"
L["Max Damage Filtered amount"] = "傷害過濾數值極限"
L["直伤"] = "直傷"

