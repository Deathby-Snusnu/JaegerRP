local _, addon = ...

local function ShowHelp()
    addon.Notify("/jrp help | list | status")
    addon.Notify("/jrp chance 0-100 | /jrp cooldown 0-3600")
    addon.Notify("/jrp channel [SAY | YELL | PARTY | RAID | INSTANCE_CHAT | AUTO]")
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
        addon.Notify(string.format("Chance: %g%% | Cooldown: %gs | Sprachkanal: %s",
            addon.db.textChance, addon.db.cooldown, addon.db.chatChannel))
    elseif command == "chance" or command == "cooldown" then
        HandleNumber(command, argument)
    elseif command == "channel" then
        HandleChannel(argument)
    elseif argument ~= "" then
        addon.Notify("Benutzung: /jrp <textschluessel>. /jrp help zeigt die Befehle.")
    else
        addon.TryText(command)
    end
end

SLASH_JAEGERRP1 = "/jrp"
SLASH_JAEGERRP2 = "/jaegerrp"
SlashCmdList.JAEGERRP = addon.HandleCommand
