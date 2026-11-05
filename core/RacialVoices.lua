-- SPDX-License-Identifier: MPL-2.0
-- Race-specific voice transforms applied to individually authored spell lines.
-- No generated text is stored in SavedVariables; custom user texts take priority.
local _, addon = ...

function addon.StylizeRacialText(lang, race, key, line)
    if type(line) ~= "string" or line == "" then return line end
    local locale = addon.localeData[lang] or addon.localeData.deDE
    local voices = locale and locale.racialVoices
    local tone = voices and voices[race]
    if not tone then return line end

    local metadata = addon.hunterSpellbook and addon.hunterSpellbook[key]
    local school = metadata and metadata.school or "SV"
    local variants = tone[school] or tone.SV
    local candidates = nil
    if line:sub(1, 1) == "*" and line:sub(-1) == "*" then
        candidates = tone.actions
        if type(candidates) ~= "table" or #candidates == 0 then return line end
        local combined = "*" .. candidates[math.random(#candidates)] .. line:sub(2)
        if #combined <= 245 and not combined:find("|", 1, true) then
            return combined
        end
        return line
    end

    if type(variants) ~= "table" or #variants == 0 then return line end
    local combined = variants[math.random(#variants)] .. line
    if #combined <= 245 and not combined:find("|", 1, true) then return combined end
    return line
end
