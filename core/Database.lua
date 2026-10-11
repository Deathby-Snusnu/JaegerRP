local _, addon = ...


function addon.GetPlayerRaceToken()
    local localizedRace, raceToken = UnitRace("player")
    local lowered = type(localizedRace) == "string" and localizedRace:lower() or ""
    if lowered:find("skyborne", 1, true) or lowered:find("himmelsgebor", 1, true) then
        return "Skyborne"
    end
    if raceToken == "Scourge" then return "Undead" end
    return raceToken
end

function addon.Notify(message)
    print("|cffffcc00Jaeger RP:|r " .. message)
end

function addon.ValidNumber(value, maximum)
    return type(value) == "number" and value == value
        and value >= 0 and value <= maximum and value % 1 == 0
end

function addon.InitializeDatabase()
    if JaegerRP_CharacterDB ~= nil and type(JaegerRP_CharacterDB) ~= "table" then
        addon.Notify("Ungueltige gespeicherte Einstellungen; Standardwerte werden geladen.")
        JaegerRP_CharacterDB = nil
    end
    JaegerRP_CharacterDB = JaegerRP_CharacterDB or {}
    local db = JaegerRP_CharacterDB
    for _, key in ipairs({ "textChance", "cooldown" }) do
        local maximum = key == "textChance" and 100 or 3600
        if db[key] ~= nil and not addon.ValidNumber(db[key], maximum) then
            addon.Notify("Ungueltiger Wert fuer " .. key .. "; Standardwert wird geladen.")
            db[key] = nil
        end
        if db[key] == nil then
            db[key] = addon.defaults[key]
        end
    end
    if db.chatChannel ~= nil and not addon.channels[db.chatChannel] then
        addon.Notify("Ungueltiger Chatkanal; Standardkanal wird geladen.")
        db.chatChannel = nil
    end
    db.chatChannel = db.chatChannel or addon.defaults.chatChannel
    if db.personalTexts ~= nil and type(db.personalTexts) ~= "table" then
        addon.Notify("Ungueltige eigene Texte; Textsammlung wird zurueckgesetzt.")
        db.personalTexts = nil
    end
    db.personalTexts = db.personalTexts or {}
    if db.outputLanguage ~= nil and not addon.outputLanguages[db.outputLanguage] then
        addon.Notify("Ungueltige Ausgabesprache; Deutsch wird verwendet.")
        db.outputLanguage = nil
    end
    db.outputLanguage = db.outputLanguage or addon.defaults.outputLanguage
    addon.runtimeOutputLanguage = db.outputLanguage
    addon.db = db
end
