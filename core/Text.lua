local _, addon = ...

local function ChooseText(pool, targetName)
    if type(pool) ~= "table" then
        return nil
    end

    local choices = pool
    if #pool == 0 then
        choices = targetName and pool.ziel or pool.gruppe

        if type(choices) ~= "table" or #choices == 0 then
            choices = pool.gruppe
        end
    end

    if type(choices) ~= "table" or #choices == 0 then
        return nil
    end

    local usable = {}
    for _, text in ipairs(choices) do
        if type(text) == "string" and text ~= ""
            and (targetName or not text:find("%s", 1, true)) then
            usable[#usable + 1] = text
        end
    end

    if #usable == 0 then
        return nil
    end

    local text = usable[math.random(#usable)]
    if targetName then
        text = text:gsub("%%s", function()
            return targetName
        end)
    end
    return text
end

function addon.BuildText(key)
    local targetName = UnitExists("target") and UnitName("target") or nil
    local personalPool = addon.db and addon.db.personalTexts
        and addon.db.personalTexts[key]
    if personalPool ~= nil then
        return ChooseText(personalPool, targetName)
    end

    local _, race = UnitRace("player")
    if race == "Scourge" then
        race = "Undead"
    end
    local racialPool = addon.racial[race] and addon.racial[race][key]
    if racialPool ~= nil then
        return ChooseText(racialPool, targetName)
    end

    return ChooseText(addon.texts[key], targetName)
end
