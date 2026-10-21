-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

local function ShowHelp()
    addon.Notify("/jrp help | list | status")
    addon.Notify("/jrp chance 0-100 | /jrp cooldown 0-3600")
    addon.Notify("/jrp channel [SAY | YELL | PARTY | RAID | INSTANCE_CHAT | AUTO]")
    addon.Notify("/jrp language deDE|enUS|frFR")
    addon.Notify("/jrp <textschluessel> - keine automatische Ausgabe bei Aktionen.")
    addon.Notify("*...* markiert /me-Emotes; normale Texte nutzen den eingestellten Sprachkanal.")
end

local function HandleNumber(command, argument)
    local maximum = command == "chance" and 100 or 3600
    local value = tonumber(argument)

    if not argument:match("^%d+$") or not addon.ValidNumber(value, maximum) then
        addon.Notify("Benutzung: /jrp " .. command .. " <ganze Zahl 0-" .. maximum .. ">")
        return
    end

    local key = command == "chance" and "textChance" or "cooldown"
    addon.db[key] = value
    addon.Notify(command .. ": " .. value)
end

local function HandleChannel(argument)
    if argument == "" then
        addon.Notify("Aktueller Sprachkanal: " .. addon.db.chatChannel)
        return
    end

    local channel = argument:upper()
    if not addon.channels[channel] then
        addon.Notify("Sprachkanaele: AUTO, SAY, YELL, PARTY, RAID, INSTANCE_CHAT")
        addon.Notify("Emotes werden automatisch als /me ausgegeben.")
        return
    end

    addon.db.chatChannel = channel
    addon.Notify("Sprachkanal: " .. channel)
end

local function HandleList()
    local found = {}

    for key in pairs(addon.texts) do
        found[key] = true
    end
    if addon.db and addon.db.personalTexts then
        for key in pairs(addon.db.personalTexts) do
            found[key] = true
        end
    end

    local keys = {}
    for key in pairs(found) do
        keys[#keys + 1] = key
    end

    table.sort(keys)
    for _, key in ipairs(keys) do
        addon.Notify(key)
    end
end


local function HandleLanguage(argument)
    if argument == "" then
        addon.Notify("Ausgabesprache: " .. addon.GetOutputLanguage() .. " (deDE, enUS, frFR)")
        return
    end
    local aliases = { de = "deDE", dede = "deDE", deDE = "deDE", en = "enUS", enus = "enUS", enUS = "enUS", fr = "frFR", frfr = "frFR", frFR = "frFR" }
    local language = aliases[argument] or aliases[string.lower(argument or "")]
    if not language or not addon.outputLanguages[language] then
        addon.Notify("Sprachen: deDE, enUS, frFR")
        return
    end
    local ok, reason = addon.SetOutputLanguage(language)
    if not ok then
        if reason == "not_loaded" then
            addon.Notify("Sprachdateien fuer " .. language .. " wurden nicht geladen. Bitte AddOn-Dateien/TOC pruefen.")
        else
            addon.Notify("Sprache konnte nicht aktiviert werden.")
        end
        return
    end
    addon.Notify("Ausgabesprache: " .. language .. " (" .. addon.outputLanguageNames[language] .. ")")
end

local function HandleAmbient(argument)
    local cmd, rest = (argument or ""):match("^(%S+)%s*(.-)%s*$")
    cmd = cmd and cmd:lower() or "status"
    if cmd == "on" or cmd == "off" then
        addon.db.ambientEnabled = cmd == "on"
        addon.ResetAmbientTimer()
    elseif cmd == "chance" then
        local n = tonumber(rest)
        if not n or n%1~=0 or n<0 or n>100 then addon.Notify("ambient chance 0-100");return end
        addon.db.ambientChance=n
    elseif cmd == "interval" then
        local a,b=rest:match("^(%d+)%s+(%d+)$")
        a,b=tonumber(a),tonumber(b)
        if not a or not b or a<30 or b<a or a>3600 or b>7200 then addon.Notify("ambient interval MIN MAX (30..3600 / 30..7200)");return end
        addon.db.ambientMinInterval=a;addon.db.ambientMaxInterval=b;addon.ResetAmbientTimer()
    elseif cmd == "combat" then
        if rest ~= "on" and rest ~= "off" then addon.Notify("ambient combat on|off");return end
        addon.db.ambientInCombat = rest == "on"
    elseif cmd == "test" then
        local category=rest:upper()
        if category=="" then category=nil end
        if category and not addon.GetLocalePoolExact(addon.GetOutputLanguage(),"ambient",category) then addon.Notify("Unbekannte Kategorie: "..category);return end
        if not addon.TryAmbient(category,true) then addon.Notify("Ambient derzeit nicht verfuegbar (Klasse/Kampf/Cooldown/Aktivierung)."); end
        return
    elseif cmd ~= "status" then
        addon.Notify("ambient on|off, chance N, interval MIN MAX, combat on|off, test [KATEGORIE], status");return
    end
    addon.Notify(string.format("Ambient: %s | Chance: %d%% | Intervall: %d-%ds | Kampf: %s", addon.db.ambientEnabled and "on" or "off", addon.db.ambientChance, addon.db.ambientMinInterval, addon.db.ambientMaxInterval, addon.db.ambientInCombat and "on" or "off"))
end

function addon.HandleCommand(message)
    if not addon.ready then
        addon.Notify("Noch nicht geladen. Bitte wartet auf PLAYER_LOGIN.")
        return
    end

    local command, argument = (message or ""):match("^%s*(%S+)%s*(.-)%s*$")
    command = command and command:lower() or "help"
    argument = argument or ""

    if command == "help" and argument == "" then
        ShowHelp()
    elseif command == "list" and argument == "" then
        HandleList()
    elseif command == "status" and argument == "" then
        addon.Notify(string.format("Chance: %g%% | Cooldown: %gs | Sprachkanal: %s | Sprache: %s",
            addon.db.textChance, addon.db.cooldown, addon.db.chatChannel, addon.GetOutputLanguage()))
    elseif command == "chance" or command == "cooldown" then
        HandleNumber(command, argument)
    elseif command == "ambient" then
        HandleAmbient(argument)
    elseif command == "channel" then
        HandleChannel(argument)
    elseif command == "language" or command == "lang" then
        HandleLanguage(argument)
    elseif argument ~= "" then
        addon.Notify("Benutzung: /jrp <textschluessel>. /jrp help zeigt die Befehle.")
    else
        addon.TryText(command)
    end
end

SLASH_JAEGERRP1 = "/jrp"
SLASH_JAEGERRP2 = "/jaegerrp"
SlashCmdList.JAEGERRP = addon.HandleCommand
