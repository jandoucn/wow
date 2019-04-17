local L = LibStub("AceLocale-3.0"):NewLocale("NeatPlates", "koKR")
if not L then return end


L = L or {}
L["%yellow%Holding down %blue%Shift %yellow%while clicking %red%Reset Configuration %yellow%will clear your saved settings, AND reload the user interface."] = "%blue%Shift %yellow%키를 %yellow%누른 상태에서 %red%구성 재설정 %yellow%을 클릭하면 저장된 설정이 지워지고 사용자 인터페이스가 다시로드됩니다."
L["%yellow%Resetting %orange%Neat Plates%yellow% Theme Selection to Default"] = "%yellow%재설정 %orange%Neat Plates%yellow% 기본 테마 선택"
L["A profile with this name already exists, do you wish to overwrite it?"] = "이 이름의 프로필이 이미 있습니다. 덮어 쓰시겠습니까?"
L["Active"] = "활성화"
L["Active/Damaged Units"] = "활성/피해 입은 유닛"
L["Add Profile"] = "프로필 추가"
L["Additional Auras:"] = "추가 효과:"
L["All NPCs"] = "모든 NPC"
L["All Units"] = "모든 유닛"
--[[Translation missing --]]
L["Allows some CVars to work(Might require a /reload)"] = "Allows some CVars to work(Might require a /reload)"
L["Always keep Target Nameplate on Screen"] = "대상 이름표 항상 화면에 표시"
--[[Translation missing --]]
L["Amount of Emphasized Auras:"] = "Amount of Emphasized Auras:"
L["Approximate Health"] = "대략적인 체력"
L["Are you sure you wish to delete the profile '%1'?"] = " '%1'프로필을 삭제 하시겠습니까?"
L["Arena ID"] = "아레나 ID"
L["Arena ID, Health, and Power"] = "아레나 ID, 체력, 자원"
L["Attacking another Tank"] = true
L["AURA_TIP"] = "팁: |cffCCCCCC효과는 정확한 이름 또는 주문 ID 번호로 표시되어야 합니다. 접미사 'My'또는 'All'을 사용하여 개인적 피해 주문과 글로벌 군중 제어 주문을 구별 할 수 있습니다. 효과를 블랙리스트에 올리는데 사용됩니다. 목록의 상단에있는 효과는 낮은 것들 앞에 표시 될 것입니다."
L["Auto (Color Swap)"] = "자동(색상 교환)"
L["Automation"] = "자동화 설정"
L["Blizzard Nameplate Motion & Visibility..."] = "블리자드 이름표 동작 및 가시성..."
L["Blizzlike"] = "블리자드 기본"
L["Border Color"] = "테두리 색상"
L["Border/Warning Glow"] = "테두리/경고 강조"
L["Buffs & Debuffs"] = "버프 및 디버프"
L["By Class"] = "직업에 따라"
L["By Health"] = "체력에 따라"
L["By Level Color"] = "레벨 색상 기준"
L["By Normal/Elite/Boss"] = "일반/정예/보스 기준"
L["By Reaction"] = "반응에 따라"
L["By Threat"] = "위협에 따라"
L["Cast Bar Colors:"] = "시전 바 색상:"
L["Cast Bars"] = "시전 바"
--[[Translation missing --]]
L["Categories"] = "Categories"
L["Clear Cache"] = "Cache 지움"
L["Clickable Height of Nameplates"] = "클릭 가능 이름표 높이"
L["Clickable Width of Nameplates"] = "클릭 가능 이름표 넓이"
L["Clickthrough"] = "클릭했을 시"
L["Color of the border highlight"] = "테두리 강조 색상"
L["Color Select"] = "색상 선택"
L["Compact (May require UI reload to take effect)"] = "작은 크기(UI 다시불러오기가 필요할 수 있음)"
L["Copy Profile"] = "프로필 복사"
L["Current Target Opacity:"] = "현재 대상 불투명도:"
L["Curse"] = "저주"
L["Custom Color Conditions:"] = "사용자 정의 색상 조건:"
L["CUSTOM_COLOR_CONDITION_TIP"] = [=[|cffCCCCCC헥스(#)의 색상 값 다음: 
- 유닛 이름 
- 버프/디버프 이름/주문 ID 
- 체력 임계 값 
 (예: #A300FF그훈의 피조물) 
 우선 순위가 가장 높은 바닥]=]
--[[Translation missing --]]
L["Default"] = "Default"
--[[Translation missing --]]
L["Default Profile"] = "Default Profile"
L["Disable Cast Bars"] = "시전 바 비활성화"
L["Disease"] = "질병"
L["Display beneficial auras that can be removed by Dispel/Purge"] = "헤제/정화로 제거 할 수있는 유익한 효과 표시"
L["Display Buffs that have been applied by you"] = "당신에 의해 적용된 버프 표시"
L["Display Debuffs that have been applied by you"] = "귀하가 적용한 디버프 표시"
L["Display Enrage effects that can be removed by Soothe"] = "달래기로 제거 할 수있는 격노 효과 표시"
L["Do not import settings from TidyPlatesContinued. And do not show this message again."] = "TidyPlatesContinued에서 설정을 가져 오지 마십시오.이 메시지를 다시 표시하지 마십시오."
--[[Translation missing --]]
L["Do you really want to make '%1' the default profile?"] = "Do you really want to make '%1' the default profile?"
L["Don't show this again"] = "다시는 보여주지 않음."
L["DPS/Healer"] = "딜러/힐러"
L["Elite Units"] = "정예 유닛"
L["Emphasize Hides Normal Aura"] = "일반 효과 숨기기 강조"
L["Emphasized Auras:"] = "강조 효과:"
L["Enable Aura Widget"] = "효과 위젯 사용"
L["Enable Healer Warning Glow"] = "힐러 경고 강조 사용"
L["Enable Pandemic Highlighting"] = "유행병 강조 표시 사용"
L["Enable Title Caching"] = "타이틀 캐싱 활성 "
L["Enable Warning Glow"] = "테두리 강조 사용"
L["Enemy Bar Color:"] = "적군 바 색상:"
L["Enemy Headline Color:"] = "적군 헤드라인 색상:"
L["Enemy Headline Subtext:"] = "적군 헤드라인 문자열:"
L["Enemy Health Bars:"] = "적군 체력 바:"
L["Enemy Name Color:"] = "적군 이름 색상:"
L["Enemy Nameplates:"] = "적군 이름표:"
L["Enemy Spotlight Mode:"] = "적군 스포트라이트 유형:"
L["Enemy Status Text:"] = "적군 상태 문자:"
L["Everything"] = "모두"
L["Exact Health"] = "체력 수치"
L["Exclude Instances"] = "인던 제외"
L["Filter By Unit Name:"] = "유닛 이름으로 필터:"
L["Filter Enemy NPC"] = "적군 NPC 필터"
L["Filter Friendly NPC"] = "아군 NPC 필터"
L["Filter Inactive"] = "비활동 필터"
L["Filter Mini-Mobs"] = "작은 몹 필터"
L["Filter Neutral Units"] = "중립 대상 필터"
L["Filter Non-Elite"] = "비-정예 필터"
L["Filter Non-Titled Friendly NPC"] = "칭호 없는 아군 NPC 필터"
L["Filter Players"] = "플레이어 필터"
L["Filtered Unit Opacity:"] = "필터된 유닛 불투명도:"
L["Filtered Unit Scale:"] = "필터된 유닛 크기:"
L["First Spec"] = "첫번째 전문화"
L["Force Bars on Targets"] = "대상 체력 바 강제 활성"
L["Force Headline on Mini-Mobs"] = "작은 몹 해드라인 활성"
L["Force Headline on Neutral Units"] = "중립 유닛 헤드라인 강제 활성"
L["Force Headline while Out-of-Combat"] = "전투 종료 시 헤드라인 강제 활성"
L["Force Multi-Lingual Font (Requires /reload)"] = "다국어 폰트 사용 (애드온 /reload 필요)"
L["Fourth Spec"] = "네번째 전문화"
L["Friendly Bar Color:"] = "아군 바 색상:"
L["Friendly Headline Color:"] = "아군 헤드라인 색상:"
L["Friendly Headline Subtext:"] = "아군 헤드라인 문자열:"
L["Friendly Health Bars:"] = "아군 체력 바:"
L["Friendly Name Color:"] = "아군 이름 색상:"
L["Friendly Nameplates:"] = "아군 이름표:"
L["Friendly NPC"] = "아군 NPC"
L["Friendly Player"] = "아군 플레이어"
L["Friendly Spotlight Mode:"] = "아군 스포트라이트 유형:"
L["Friendly Status Text:"] = "아군 상태 문자:"
L["Funky Stuff"] = true
--[[Translation missing --]]
L["General Aura Filters"] = "General Aura Filters"
L["Glow"] = "광택"
L["Group Member Aggro"] = "그룹원 어그로"
L["Guild Member"] = "길드원"
L["Headline View (Text-Only)"] = "헤드라인 표시(문자만):"
L["Headline View (Text-Only):"] = "헤드라인 보기 (이름표만 보기):"
L["Health"] = "체력"
L["Health Bar Color"] = "체력 바 색상"
L["Health Bar Color:"] = "체력 바 색상:"
L["Health Bar View"] = "체력 바 표시"
L["Health Bar View:"] = "체력 바 보기:"
L["Health Bar Width (%)"] = "체력 바 넓이 (%)"
L["Health Colors:"] = "체력 색상:"
L["Health Deficit"] = "빠진 체력"
L["Health Total & Percent"] = "총 체력 & 퍼센트"
L["Hide when Combat starts, Show when Combat ends"] = "전투가 시작될 때 숨기기, 전투가 끝날 때 표시"
L["Hides the regular aura from the aura widget if it is currently emphasized"] = "현재 강조되어 있는 경우 효과 위젯에서 일반 효과를 숨깁니다."
L["High Health"] = "최고 체력"
L["High Health Threshold:"] = "최고 체력 한계:"
L["Highlight auras when they have less than 30% of their original duration remaining"] = "원래의 남은 시간이 30% 미만일 때 효과를 강조 표시합니다."
L["Highlight Group Members holding Aggro"] = "어그로를 잡고 있는 그룹원 강조"
L["Highlight Mobs on Off-Tanks"] = true
L["Hostile NPC"] = "적군 NPC"
L["Hostile Player"] = "적군 플레이어"
L["Icon Style:"] = "아이콘 모양"
L["Ignore Inactive Units"] = "비-활동 유닛 무시"
L["Ignore Neutral Units"] = "중립 유닛 무시"
L["Ignore Non-Elite Units"] = "비-정예 유닛 무시"
L["Import Settings from TidyPlatesContinued."] = "TidyPlatesContinued에서 가져 오기 설정."
L["Import TPC Settings"] = "TPC 설정 가져 오기"
L["IMPORT_PROMPT_TEXT"] = [=[NeatPlates와 TidyPlatesContinued를 모두 실행하고있는 것 같습니다. 
이 캐릭터의 TidyPlatesContinued 설정을 NeatPlates로 가져 오시겠습니까? 

(가져 오기가 완료되면 TPC가 비활성화되고 UI 다시로드가 수행됩니다.) 또한 어떤 전문화를 위해 어떤 프로필을 사용할 지 다시 선택해야 합니다.)... ]=]
L["Include Dispellable Debuffs on Friendly Units"] = "해제 가능한 아군의 디버프 추적"
L["Include Enrage Buffs"] = "강화 버프 포함"
L["Include My Buffs"] = "자신의 버프를 포함"
L["Include My Debuffs"] = "자신의 디버프를 포함"
L["Include Purgeable Buffs"] = "헤제 가능한 버프 포함"
L["Interrupted"] = "차단"
L["Level"] = "레벨"
L["Level and Approx Health"] = "레벨과 빠진 체력"
L["Low Health"] = "낮은 체력"
L["Low Health Threshold:"] = "최저 체력 한계:"
L["Magic"] = "마법"
L["Makes the Nameplates non-interactable"] = "Nameplates를 상호 작용 가능하게 함"
L["Medium Health"] = "중간 체력"
--[[Translation missing --]]
L["Might resolve some issues with health not updating properly"] = "Might resolve some issues with health not updating properly"
L["Mode:"] = "유형:"
L["Name Text Color"] = "이름 문자 색상"
L["Nameplate Horizontal Overlap"] = "이름표 가로 겹치기"
L["Nameplate Max Distance"] = "이름표 최대 거리"
L["Nameplate Motion & Visibility"] = "이름표 동작 및 가시성"
L["Nameplate Style"] = "이름표 모양"
L["Nameplate Vertical Overlap"] = "이름표 세로 겹치기"
L["NeatPlates"] = true
L["NeatPlatesTraditional"] = true
L["Neutral"] = "중립"
L["No Automation"] = "자동화 안함"
L["None"] = "없음"
L["Non-Target Opacity:"] = "비-대상 불투명도:"
L["Normal"] = "일반"
L["Normal Scale:"] = "일반 크기:"
L["NPC Role"] = "NPC 역할"
L["NPC Role, Guild"] = "NPC 역할, 길드"
L["NPC Role, Guild, or Level"] = "NPC 역할, 길드, 또는 레벨"
L["NPC Role, Guild, or Quest"] = "NPC 역할, 길드, 또는 퀘스트"
L["On Active/Damaged Units"] = "활성/피해 입은 유닛"
L["On Bosses"] = "보스"
L["On Damaged Units"] = "피해 입은 유닛"
L["On Elite Units"] = "정예 유닛"
L["On Enemy Healers"] = "적군 힐러"
L["On Enemy Units"] = "적군 유닛"
L["On Low-Health Units"] = "낮은-체력 유닛"
L["On NPC"] = "NPC"
L["On NPCs"] = "NPC"
L["On Party Members"] = "파티원"
L["On Players"] = "플레이어"
L["On Raid Targets"] = "공격대 대상"
L["Opacity"] = "불투명도"
L["Other Colors:"] = "기타 색상:"
--[[Translation missing --]]
L["Other Options"] = "Other Options"
L["Other Widgets"] = "기타 위젯"
L["Overlay"] = "덧씌우기"
L["Override Target/Spotlight Scale"] = "타겟/스포트라이트 크기 무효"
L["Percent Health"] = "체력 퍼센트"
L["Personal Resource Style:"] = "개인 자원 모양:"
L["Players"] = "플레이어"
L["Poison"] = "독"
--[[Translation missing --]]
L["Profile"] = "Profile"
L["Profile Management"] = "프로필 관리"
L["Profile Name"] = "프로필 이름"
L["Profile Selection"] = "프로필 선택"
L["Quest"] = "퀘스트"
L["Range:"] = "거리"
L["Reaction"] = "반응"
L["Remove Profile"] = "프로필 삭제"
L["Reset Configuration"] = "구성 재설정"
L["Safe"] = "안전"
L["Scale"] = "크기"
L["Scale Spotlight Mode:"] = "스포라이트 유형 크기:"
L["Second Spec"] = "두번째 전문화"
--[[Translation missing --]]
L["SHORT_MILLION"] = "M"
--[[Translation missing --]]
L["SHORT_ONE_HUNDRED_MILLION"] = "E"
--[[Translation missing --]]
L["SHORT_TEN_THOUSAND"] = "W"
--[[Translation missing --]]
L["SHORT_THOUSAND"] = "K"
L["Show Absorb Bars"] = "흡수 바 표시"
L["Show during Combat, Hide when Combat ends"] = "전투 중 표시, 전투가 끝날 때 숨기기"
L["Show Elite Icon"] = "정예 아이콘 보기"
L["Show Enemy Class Art"] = "적군 직업 미관 보기"
L["Show Friendly Cast Bars"] = "아군 시전 바 보기"
L["Show Friendly Class Art"] = "아군 직업 미관 보기"
L["Show Interrupted Cast Bar"] = "차단된 시전 바 보기"
L["Show Level"] = "레벨 표시"
L["Show on:"] = "표시 형태"
L["Show Party Range Warning"] = "파티 거리 경고 표시"
L["Show Personal Resource on Target"] = "대상에 개인 자원 보기"
L["Show Quest Icon on Units"] = "유닛에 퀘스트 아이콘 보기"
L["Show Status Text on Active/Damaged Units"] = "활성/피해 입은 대상 유닛 상태 문자 활성"
L["Show Status Text on Target & Mouseover"] = "대상 & 마우스오버 대상의 상태 문자만 보기"
L["Show Target Highlight"] = "대상 하이라이트 보기"
L["Show Threat Percentage"] = "위협 퍼센트 보기"
L["Show Totem Art"] = "토템 미관 보기"
L["Show Tug-o-Threat Indicator"] = "Tug-o-Threat 지시기 보기"
L["Show who Interrupted Cast"] = "차단 시킨 시전자 보기"
L["Sorry, can't delete the Default profile :("] = "죄송합니다. 기본 프로필을 삭제할 수 없습니다. :("
L["Space Between buffs & debuffs:"] = "버프와 디버프 사이의 간격:"
L["Spotlight Casting Units"] = "시전 중인 유닛 스포트라이트"
L["Spotlight Mouseover"] = "마우스오버 대상 스포트라이트로 표시"
L["Spotlight Mouseover Units"] = "마우스오버 유닛 스포트라이트"
L["Spotlight Opacity:"] = "스포트라이트 불투명도:"
L["Spotlight Raid Marked"] = "공격대 징표 스포트라이트로 표시"
L["Spotlight Scale:"] = "스포라이트 크기:"
L["Spotlight Target Units"] = "대상 유닛 스포트라이트"
L["Stacking Nameplates"] = "이름표 겹치기"
L["Tank"] = "탱커"
L["Tapped Unit"] = "선택된 유닛"
L["Target Of"] = "대상"
L["Target Only"] = "대상 만"
L["Text Color:"] = "문자 색상:"
--[[Translation missing --]]
L["The amount of Emphasized auras that can be displayed at once"] = "The amount of Emphasized auras that can be displayed at once"
L[ [=[The amount of empty aura slots between Buffs & Debuffs.
Max value means they never share a row]=] ] = [=[버프와 디버프 사이의 빈 효과 슬롯의 양. 
최대 값은 행을 공유하지 않는다는 것을 의미합니다.]=]
L["The profile '%1' already exists, try a different name."] = "프로필 '%1'이(가) 이미 존재합니다. 다른 이름을 사용해보십시오."
--[[Translation missing --]]
L["The profile '%1' is now the Default profile."] = "The profile '%1' is now the Default profile."
L["The profile '%1' was successfully deleted."] = "프로필 '%1'이(가) 성공적으로 삭제되었습니다."
L["The profile '%1' was successfully overwritten."] = "프로필 '%1'이(가) 성공적으로 덮어 썼습니다."
L["Theme"] = "테마"
L["Third Spec"] = "세번째 전문화"
L["Threat"] = "위협"
L["Threat Colors:"] = "위협 색상:"
L["Threat Mode:"] = "위협 유형:"
--[[Translation missing --]]
L["Tip"] = "Tip"
L["Transition"] = "전환"
L["Treat Focus as a Target"] = "주시 대상의 위협"
L["Type of highlighting to use"] = "사용할 하이라이트 유형"
L["Un-interruptible"] = "차단 불가"
L["Unit Filter"] = "유닛 필터"
L["Use Blizzard Font"] = "블리자드 기본 글꼴 사용"
--[[Translation missing --]]
L["Use Blizzard Scaling"] = "Use Blizzard Scaling"
--[[Translation missing --]]
L["Use Chinese Number Shortening"] = "Use Chinese Number Shortening"
L["Use Frequent Health Updates"] = "빠른 상태 업데이트 사용"
L["Use Target Opacity When No Target Exists"] = "대상이 없을 때 대상 불투명도 사용"
L["Vertical Position of Artwork: (May cause targeting problems)"] = "아트웍의 수직 위치: (타켓팅에 문제를 일으킬 수 있음)"
L["Warning"] = "경고"
L["White"] = "백색"
L["Wide"] = "넓게"
--[[Translation missing --]]
L["yards"] = "yards"
L["You need to specify a 'Profile Name'."] = "'프로필 이름'을 지정해야합니다."
