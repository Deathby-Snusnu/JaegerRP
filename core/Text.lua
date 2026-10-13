-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

-- Faehigkeiten, deren mechanisches Ziel nicht das aktuelle Gegner-Target ist.
local SELF_ONLY = {
    ASPECT_HAWK = true,
    ASPECT_CHEETAH = true,
    ASPECT_MONKEY = true,
    RAPID_FIRE = true,
    DISENGAGE = true,
    TRACKING = true,
    CAMOUFLAGE = true,
}

local PET_TARGET = {
    MEND_PET = true,
    REVIVE_PET = true,
    FEED_PET = true,
}

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
        return (text:gsub("%%s", function()
            return targetName
        end))
    end
    return text
end

local function ResolveTargetName(key)
    if SELF_ONLY[key] then
        return nil
    end
    if PET_TARGET[key] then
        if UnitExists("pet") then
            return UnitName("pet")
        end
        return nil
    end
    if UnitExists("target") then
        return UnitName("target")
    end
    return nil
end

function addon.BuildText(key)
    local targetName = ResolveTargetName(key)
    local race = addon.GetPlayerRaceToken and addon.GetPlayerRaceToken() or select(2, UnitRace("player"))
    local personalPool = addon.db.personalTexts[key]
    if personalPool then
        return ChooseText(personalPool, targetName)
    end
    local lang = addon.GetOutputLanguage()
    local pool = addon.GetLocalePoolExact(lang, "racial", race, key)
        or addon.GetLocalePoolExact(lang, "texts", key)
        or addon.GetLocalePoolExact("deDE", "racial", race, key)
        or addon.GetLocalePoolExact("deDE", "texts", key)
    return ChooseText(pool, targetName)
end
