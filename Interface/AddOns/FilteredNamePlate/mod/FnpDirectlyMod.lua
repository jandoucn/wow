--大米成就
local L = _G.FNP_LOCALE_TEXT
local FilteredNamePlate = _G.FilteredNamePlate

function FilteredNamePlate:CallBMChallengesShow()
    local aID10, aID15 = 13448, 13449 --13079, 13080
    local crits, numCrits = {}, GetAchievementNumCriteria(aID10)
    table.wipe(crits)
    local ar10 = select(4, GetAchievementInfo(aID10))
    local ar15 = select(4, GetAchievementInfo(aID15))
    print(">>>>FNP成就 大秘境第二赛季>>>>>")
    for i=1, numCrits do
        local name, _, _, complete = GetAchievementCriteriaInfo(aID15, i)
        if complete == 1 then
            print(tostring(i)..". "..tostring(name)..L.ACHIEVER_15_OK)
        else
            name, _, _, complete = GetAchievementCriteriaInfo(aID10, i)
            if complete == 1 then
                print(tostring(i)..". "..tostring(name)..L.ACHIEVER_10_OK)
            else
                print(tostring(i)..". "..tostring(name)..L.ACHIEVER_10_NOT_OK)
            end
        end
    end
end