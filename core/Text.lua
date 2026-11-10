-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

-- Protected WoW clients may return secret strings for unit names.
-- Use a safe placeholder before comparison or text interpolation.
local function SafeUnitName(unit)
    local name = UnitName(unit)
    if type(issecretvalue) == "function" and issecretvalue(name) then
        return addon.GetLocalizedPool("unitNames", unit)
    end
    return name
end


local SELF_ONLY = {
    ASPECT_HAWK=true, ASPECT_CHEETAH=true, ASPECT_MONKEY=true,
    RAPID_FIRE=true, DISENGAGE=true, TRACKING=true, CAMOUFLAGE=true,
}
local PET_TARGET = { MEND_PET=true, REVIVE_PET=true, FEED_PET=true }

local function ChooseArray(pool, targetName)
    if type(pool) ~= "table" or #pool == 0 then return nil end
    local usable = {}
    for _, text in ipairs(pool) do
        if type(text) == "string" and text ~= "" then
            local needsTarget = text:find("%s",1,true) ~= nil
            if not needsTarget or targetName then usable[#usable+1] = text end
        end
    end
    if #usable == 0 then return nil end
    local text = usable[math.random(#usable)]
    if targetName then text = text:gsub("%%s", function() return targetName end) end
    return text
end

local function ChooseText(pool, targetName)
    if type(pool) ~= "table" then return nil end
    if #pool > 0 then return ChooseArray(pool, targetName) end
    if targetName then
        local text = ChooseArray(pool.ziel, targetName)
        if text then return text end
    end
    local text = ChooseArray(pool.gruppe, targetName)
    if text then return text end
    return ChooseArray(pool.ziel, targetName)
end

local function ResolveTargetName(key)
    local metadata = addon.hunterSpellbook and addon.hunterSpellbook[key]
    local mode = metadata and metadata.mode
    if mode == "SELF" or mode == "TRACK" or mode == "AREA" or SELF_ONLY[key] then
        return nil
    end
    if mode == "PET" or PET_TARGET[key] then
        return UnitExists("pet") and SafeUnitName("pet") or nil
    end
    if not UnitExists("target") then return nil end
    if mode == "ENEMY" and type(UnitCanAttack) == "function"
        and not UnitCanAttack("player", "target") then
        return nil
    end
    return SafeUnitName("target")
end


function addon.BuildText(key)
    local targetName = ResolveTargetName(key)
    local personal = addon.db.personalTexts[key]
    if personal then
        local text = ChooseText(personal, targetName)
        if text then return text end
    end

    local race = addon.GetPlayerRaceToken and addon.GetPlayerRaceToken() or select(2, UnitRace("player"))
    local lang = addon.GetOutputLanguage()
    -- Existing custom racial texts stay first. All other spells are
    -- embellished with the selected race's voice, never overwriting literals.
    local racial = addon.GetLocalePoolExact(lang, "racial", race, key)
        or addon.GetLocalePoolExact("deDE", "racial", race, key)
    local special = ChooseText(racial, targetName)
    if special then return special end
    local pool = addon.GetLocalePoolExact(lang, "texts", key)
        or addon.GetLocalePoolExact("deDE", "texts", key)
    local line = ChooseText(pool, targetName)
    if not line then return nil end
    if addon.StylizeRacialText then
        return addon.StylizeRacialText(lang, race, key, line)
    end
    return line
end

addon.ChooseStructuredText = ChooseText
