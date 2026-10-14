-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

local groupSpeech = 'Main sure. Regard clair.'
local groupEmote = '*verifie sa posture, la distance et les alentours d un regard exerce.*'
local targetSpeech = 'Je vous ai a l oeil, %s.'
local targetEmote = '*fixe sa posture et toute son attention sur %s.*'

local function appendUnique(list, text)
    if type(list) ~= "table" then return end
    for _, value in ipairs(list) do
        if value == text then return end
    end
    list[#list + 1] = text
end

local function expand(node, seen)
    if type(node) ~= "table" or seen[node] then return end
    seen[node] = true
    if type(node.ziel) == "table" then
        appendUnique(node.ziel, targetSpeech)
        appendUnique(node.ziel, targetEmote)
    end
    if type(node.gruppe) == "table" then
        appendUnique(node.gruppe, groupSpeech)
        appendUnique(node.gruppe, groupEmote)
    end
    for key, value in pairs(node) do
        if key ~= "ziel" and key ~= "gruppe" and type(value) == "table" then
            expand(value, seen)
        end
    end
end

for _, container in ipairs({addon.localeData.frFR.texts, addon.localeData.frFR.racial}) do
    expand(container, {})
end
