-- Login und globale oeffentliche API des AddOns.
local _, addon = ...

JaegerRP = addon
addon.ready = false

function addon.TryText(key)
    if not addon.ready then
        addon.Notify("Noch nicht geladen. Bitte wartet auf PLAYER_LOGIN.")
        return false
    end
    if not addon.isHunter then
        addon.Notify("RP-Texte sind nur fuer Jaeger verfuegbar.")
        return false
    end
    if type(key) ~= "string" or key == "" then
        addon.Notify("Benutzung: /jrp <textschluessel>. /jrp list zeigt alle Texte.")
        return false
    end

    key = key:upper()
    local text = addon.BuildText(key)
    if not text then
        addon.Notify("Kein nutzbarer Text fuer " .. key .. " vorhanden.")
        return false
    end
    if not addon.CooldownReady() then
        return false
    end
    if math.random(100) > addon.db.textChance then
        return false
    end
    if not addon.SendText(text) then
        return false
    end
    addon.StartCooldown()
    return true
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function()
    addon.InitializeDatabase()
    local _, class = UnitClass("player")
    addon.isHunter = class == "HUNTER"
    addon.ready = true
    addon.Notify("geladen. Befehle: /jrp und /jaegerrp.")
    if not addon.isHunter then
        addon.Notify("Kein Jaeger: Einstellungen verfuegbar, RP-Ausgabe deaktiviert.")
    end
end)
