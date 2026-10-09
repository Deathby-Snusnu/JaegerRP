local files = {}
local pathSeparator = package.config:sub(1, 1)

for line in io.lines("JaegerRP.toc") do
    local file = line:match("^%s*(.-)%s*$")
    if file ~= "" and not file:find("^#") then
        files[#files + 1] = file:gsub("[/\\]", pathSeparator)
    end
end

local checks = 0

local function check(condition, message)
    assert(condition, message)
    checks = checks + 1
end

local function newClient(options)
    options = options or {}

    local state = {
        time = 0,
        messages = {},
        notices = {},
        race = options.race or "Human",
        class = options.class or "HUNTER",
        target = nil,
        group = false,
        raid = false,
        instance = false,
    }

    local env = setmetatable({
        SlashCmdList = {},
        LE_PARTY_CATEGORY_INSTANCE = 2,
        JaegerRP_CharacterDB = options.db,
        JaegerRP = nil,
    }, { __index = _G })
    env._G = env

    env.print = function(message)
        state.notices[#state.notices + 1] = message
    end

    env.GetTime = function()
        return state.time
    end

    env.UnitClass = function()
        return "class", state.class
    end

    env.UnitRace = function()
        return "race", state.race
    end

    env.UnitExists = function()
        return state.target ~= nil
    end

    env.UnitName = function()
        return state.target
    end

    env.IsInGroup = function(category)
        if category then
            return state.instance
        end
        return state.group or state.raid or state.instance
    end

    env.IsInRaid = function()
        return state.raid
    end

    env.GetNumLanguages = function()
        return 1
    end

    env.GetLanguageByIndex = function()
        return "Common", 7
    end

    if not options.noChat then
        env.C_ChatInfo = {
            SendChatMessage = function(text, channel, language)
                state.messages[#state.messages + 1] = {
                    text = text,
                    channel = channel,
                    language = language,
                }
            end,
        }
    end

    env.CreateFrame = function()
        return {
            RegisterEvent = function(_, event)
                check(event == "PLAYER_LOGIN", "registers login only")
            end,
            SetScript = function(_, name, handler)
                check(name == "OnEvent", "sets login handler")
                state.login = handler
            end,
        }
    end

    local addon = {}

    for _, file in ipairs(files) do
        local chunk
        if setfenv then
            chunk = assert(loadfile(file))
            setfenv(chunk, env)
        else
            chunk = assert(loadfile(file, "t", env))
        end
        chunk("JaegerRP", addon)
    end

    state.env = env
    state.addon = addon
    state.command = env.SlashCmdList.JAEGERRP

    if not options.beforeLogin then
        state.login()
    end

    return state
end

-- Vor Login sicher.
local client = newClient({ beforeLogin = true })
check(not client.addon.TryText("HUNTERS_MARK"), "safe before login")
client.login()

-- Standardwerte.
check(client.env.JaegerRP_CharacterDB.textChance == 30, "default chance")
check(client.env.JaegerRP_CharacterDB.cooldown == 20, "default cooldown")
check(client.env.JaegerRP_CharacterDB.chatChannel == "SAY", "default channel")
check(client.env.JaegerRP == client.addon, "public API")

-- Fuer deterministische Texttests eigene Texte verwenden.
client.command("chance 100")
client.command("cooldown 0")
client.env.JaegerRP_CharacterDB.personalTexts.HUNTERS_MARK = {
    "Ich habe Euch im Blick, %s.",
}
client.target = "Ziel%1"

check(client.addon.TryText("HUNTERS_MARK"), "spoken personal text succeeds")
check(client.messages[#client.messages].text == "Ich habe Euch im Blick, Ziel%1.",
    "target substitution preserves percent characters")
check(client.messages[#client.messages].channel == "SAY",
    "unmarked text uses speech channel")
check(client.messages[#client.messages].language == 7,
    "solo SAY uses known racial language")

-- *...* wird als /me gesendet und die Sternchen verschwinden.
client.env.JaegerRP_CharacterDB.personalTexts.TRAP = {
    "*legt vorsichtig eine Falle aus.*",
}
client.command("channel PARTY")
client.group = false

check(client.addon.TryText("TRAP"), "emote works even when configured party channel is unavailable")
check(client.messages[#client.messages].text == "legt vorsichtig eine Falle aus.",
    "emote markers are stripped")
check(client.messages[#client.messages].channel == "EMOTE",
    "marked text is sent as EMOTE")
check(client.messages[#client.messages].language == nil,
    "emote has no racial language id")

-- Gesprochener Text respektiert weiterhin den konfigurierten Kanal.
client.env.JaegerRP_CharacterDB.personalTexts.HUNTERS_MARK = {
    "Ziel erkannt.",
}
local count = #client.messages
check(not client.addon.TryText("HUNTERS_MARK") and #client.messages == count,
    "unavailable configured speech channel is rejected")

client.group = true
check(client.addon.TryText("HUNTERS_MARK"), "available PARTY speech succeeds")
check(client.messages[#client.messages].channel == "PARTY",
    "configured speech channel is used")

-- AUTO.
client.command("channel AUTO")
client.group = false
client.target = nil
client.env.JaegerRP_CharacterDB.personalTexts.MEND_PET = {
    "Ruhig, alter Freund.",
}
check(client.addon.TryText("MEND_PET"), "AUTO speech succeeds solo")
check(client.messages[#client.messages].channel == "SAY",
    "AUTO selects SAY solo")

client.group = true
check(client.addon.TryText("MEND_PET"), "AUTO speech succeeds in group")
check(client.messages[#client.messages].channel == "PARTY",
    "AUTO selects PARTY in group")

-- EMOTE ist kein manuell einstellbarer Sprachkanal mehr.
client.command("channel SAY")
client.command("channel EMOTE")
check(client.env.JaegerRP_CharacterDB.chatChannel == "SAY",
    "EMOTE cannot be configured as speech channel")

-- Chance und Cooldown.
client.command("chance 0")
count = #client.messages
check(not client.addon.TryText("MEND_PET") and #client.messages == count,
    "zero chance blocks output")
client.command("chance 100")

for _, argument in ipairs({
    "chance", "chance -1", "chance 101", "chance 1.5", "chance 30 garbage",
    "cooldown 3601", "cooldown 1e2",
}) do
    client.command(argument)
end

check(client.env.JaegerRP_CharacterDB.textChance == 100,
    "invalid chance rejected")
check(client.env.JaegerRP_CharacterDB.cooldown == 0,
    "invalid cooldown rejected")

-- Persoenliche Texte koennen neue Schluessel bereitstellen.
client.env.JaegerRP_CharacterDB.personalTexts.MY_HUNTER_TEXT = {
    "Eigener Jaegertext.",
}
check(client.addon.TryText("MY_HUNTER_TEXT"), "personal-only text key works")
check(client.messages[#client.messages].text == "Eigener Jaegertext.",
    "personal-only text selected")

-- Ziel/Gruppe bei eigenen Pools.
client.env.JaegerRP_CharacterDB.personalTexts.TEST_POOL = {
    ziel = { "Ziel: %s." },
    gruppe = { "Kein Ziel." },
}
client.target = "Wolf"
check(client.addon.TryText("TEST_POOL"), "personal target pool succeeds")
check(client.messages[#client.messages].text == "Ziel: Wolf.",
    "target branch selected")
client.target = nil
check(client.addon.TryText("TEST_POOL"), "personal group pool succeeds")
check(client.messages[#client.messages].text == "Kein Ziel.",
    "group branch selected")

-- Fehlerhafte Emote-Markierung wird abgelehnt.
client.env.JaegerRP_CharacterDB.personalTexts.BAD_EMOTE = {
    "*unvollstaendiges Emote",
}
count = #client.messages
check(not client.addon.TryText("BAD_EMOTE") and #client.messages == count,
    "unmatched emote marker rejected")

client.env.JaegerRP_CharacterDB.personalTexts.EMPTY_EMOTE = {
    "**",
}
count = #client.messages
check(not client.addon.TryText("EMPTY_EMOTE") and #client.messages == count,
    "empty emote rejected")

-- Chat-Sicherheitsgrenzen gelten fuer den tatsaechlich gesendeten Text.
client.env.JaegerRP_CharacterDB.personalTexts.TOO_LONG = {
    string.rep("x", 256),
}
count = #client.messages
check(not client.addon.TryText("TOO_LONG") and #client.messages == count,
    "oversized text rejected")

client.env.JaegerRP_CharacterDB.personalTexts.BAD_MARKUP = {
    "Nicht | erlaubt.",
}
count = #client.messages
check(not client.addon.TryText("BAD_MARKUP") and #client.messages == count,
    "chat markup rejected")

-- Falsche Klasse.
local wrongClass = newClient({ class = "WARRIOR" })
wrongClass.command("chance 100")
wrongClass.command("cooldown 0")
check(not wrongClass.addon.TryText("TRAP"), "non-hunter output is disabled")
wrongClass.command("status")

-- Ungueltige gespeicherte Daten werden repariert.
local invalidDB = newClient({
    db = {
        textChance = 101,
        cooldown = -1,
        chatChannel = "EMOTE",
        personalTexts = false,
        retained = "yes",
    },
})
check(invalidDB.env.JaegerRP_CharacterDB.textChance == 30,
    "bad chance repaired")
check(invalidDB.env.JaegerRP_CharacterDB.cooldown == 20,
    "bad cooldown repaired")
check(invalidDB.env.JaegerRP_CharacterDB.chatChannel == "SAY",
    "old EMOTE channel repaired to default SAY")
check(type(invalidDB.env.JaegerRP_CharacterDB.personalTexts) == "table",
    "bad personal text data repaired")
check(invalidDB.env.JaegerRP_CharacterDB.retained == "yes",
    "unknown database fields retained")

-- Fehlende Chat-API.
local noChat = newClient({
    noChat = true,
    db = {
        textChance = 100,
        cooldown = 0,
        chatChannel = "SAY",
        personalTexts = {
            HUNTERS_MARK = { "Test." },
        },
    },
})
check(not noChat.addon.TryText("HUNTERS_MARK") and #noChat.messages == 0,
    "missing chat API is reported and does not send")

print("PASS: JaegerRP, " .. checks .. " checks")
