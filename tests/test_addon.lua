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
        raceId = options.raceId,
        localizedRace = options.localizedRace or "race",
        faction = options.faction,
        pet = options.pet,
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
        return state.localizedRace, state.race, state.raceId
    end

    env.UnitFactionGroup = function()
        return state.faction
    end

    env.UnitCanAttack = function()
        return options.hostile ~= false
    end

    env.UnitAffectingCombat = function()
        return options.combat == true
    end

    env.UnitExists = function(unit)
        if unit == "pet" then return state.pet ~= nil end
        return state.target ~= nil
    end

    env.UnitName = function(unit)
        if unit == "pet" then return state.pet end
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
                check(name == "OnEvent" or name == "OnUpdate", "sets supported handler")
                if name == "OnEvent" then
                    state.login = handler
                end
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

-- RPChatMod kann SAY/YELL eine gemeinsame Sprache vorgeben.
local resolverCalls = {}
local resolverClient = newClient({
    race = "Human",
    db = {
        textChance = 100,
        cooldown = 0,
        chatChannel = "SAY",
        personalTexts = {},
    },
})
resolverClient.env.RPChatMod = {
    GetChatLanguageID = function(channel)
        resolverCalls[#resolverCalls + 1] = channel
        return 42
    end,
}

check(resolverClient.addon.SendText("Gemeinsame Sprache."),
    "shared resolver SAY succeeds")
check(resolverClient.messages[#resolverClient.messages].channel == "SAY",
    "shared resolver SAY keeps its channel")
check(resolverClient.messages[#resolverClient.messages].language == 42,
    "shared resolver language is forwarded for SAY")
check(resolverCalls[#resolverCalls] == "SAY",
    "shared resolver receives SAY channel")

resolverClient.env.JaegerRP_CharacterDB.chatChannel = "YELL"
check(resolverClient.addon.SendText("Gemeinsame Sprache!"),
    "shared resolver YELL succeeds")
check(resolverClient.messages[#resolverClient.messages].channel == "YELL",
    "shared resolver YELL keeps its channel")
check(resolverClient.messages[#resolverClient.messages].language == 42,
    "shared resolver language is forwarded for YELL")
check(resolverCalls[#resolverCalls] == "YELL",
    "shared resolver receives YELL channel")

resolverClient.group = true
resolverClient.raid = true
resolverClient.instance = true
for _, channel in ipairs({ "PARTY", "RAID", "INSTANCE_CHAT" }) do
    resolverClient.env.JaegerRP_CharacterDB.chatChannel = channel
    local callsBefore = #resolverCalls
    check(resolverClient.addon.SendText("Gruppennachricht."),
        channel .. " succeeds without the shared resolver")
    check(#resolverCalls == callsBefore,
        channel .. " bypasses the shared resolver")
    check(resolverClient.messages[#resolverClient.messages].channel == channel,
        channel .. " keeps its channel")
    check(resolverClient.messages[#resolverClient.messages].language == nil,
        channel .. " has no language id")
end

local callsBeforeEmote = #resolverCalls
check(resolverClient.addon.SendText("*winkt.*"),
    "EMOTE succeeds without the shared resolver")
check(#resolverCalls == callsBeforeEmote,
    "EMOTE bypasses the shared resolver")
check(resolverClient.messages[#resolverClient.messages].channel == "EMOTE",
    "EMOTE keeps its channel")
check(resolverClient.messages[#resolverClient.messages].language == nil,
    "EMOTE has no language id")

resolverClient.env.RPChatMod = nil
resolverClient.env.JaegerRP_CharacterDB.chatChannel = "SAY"
check(resolverClient.addon.SendText("Rassensprache."),
    "SAY succeeds without the shared resolver")
check(resolverClient.messages[#resolverClient.messages].language == 7,
    "missing resolver falls back to known racial language")

-- Rassentexte werden vor den allgemeinen Texten gewaehlt.
local dwarfHunter = newClient({ race = "Dwarf" })
dwarfHunter.command("chance 100")
dwarfHunter.command("cooldown 0")
dwarfHunter.target = "Faehrte"
local dwarfText = dwarfHunter.addon.BuildText("TRACKING")
local dwarfChoices = dwarfHunter.addon.racial.Dwarf.TRACKING.gruppe
local isDwarfText = false
for _, text in ipairs(dwarfChoices) do
    if text:gsub("%%s", function() return "Faehrte" end) == dwarfText then
        isDwarfText = true
        break
    end
end
check(isDwarfText, "race-specific text is selected before general text (actual=" .. tostring(dwarfText) .. ", racial=" .. table.concat(dwarfChoices, " | ") .. ")")

-- Voelker ohne eigenen Pool verwenden weiterhin allgemeine Jaegertexte.
local fallbackHunter = newClient({ race = "Human" })
fallbackHunter.target = "Faehrte"
local fallbackText = fallbackHunter.addon.BuildText("TRACKING")
local generalChoices = fallbackHunter.addon.texts.TRACKING.gruppe
local isGeneralText = false
for _, text in ipairs(generalChoices) do
    local body = text:sub(1, 1) == "*" and text:sub(2, -2) or text
    if fallbackText:find(body, 1, true) then
        isGeneralText = true
        break
    end
end
check(isGeneralText, "missing racial literal uses cultural voice with general spell text")

-- Eigene Texte haben Vorrang vor Rassentexten.
dwarfHunter.env.JaegerRP_CharacterDB.personalTexts.TRACKING = {
    "*prueft das Gelaende auf Spuren.*",
}
check(dwarfHunter.addon.BuildText("TRACKING") == "*prueft das Gelaende auf Spuren.*",
    "personal text overrides racial text")

-- Scourge verwendet dieselben Rassentexte wie Undead.
local undeadHunter = newClient({ race = "Scourge" })
undeadHunter.target = "Spur"
undeadHunter.addon.racial.Undead = {
    TRACKING = { gruppe = { "Untote Spur gesucht." } },
}
check(undeadHunter.addon.BuildText("TRACKING") == "Untote Spur gesucht.",
    "Scourge race name aliases to Undead")

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

-- Raptorstoß muss für jedes Volk und alle Sprachen auf allgemeine
-- Texte zurückfallen, ohne vorhandene Nachtelfen-Rassentexte zu verlieren.
for _, language in ipairs({"deDE", "enUS", "frFR"}) do
    local hunter = newClient({race="Dwarf"})
    hunter.command("language " .. language)
    hunter.command("chance 100")
    hunter.command("cooldown 0")
    hunter.target = "Trainingsziel"
    check(type(hunter.addon.localeData[language].texts.RAPTOR_STRIKE) == "table",
        language .. " has general Raptor Strike pool")
    check(type(hunter.addon.BuildText("RAPTOR_STRIKE")) == "string",
        language .. " Raptor Strike builds with target")
    hunter.target = nil
    check(type(hunter.addon.BuildText("RAPTOR_STRIKE")) == "string",
        language .. " Raptor Strike builds without target")
    check(hunter.addon.TryText("RAPTOR_STRIKE"),
        language .. " Raptor Strike is usable by dwarves")
    check(#hunter.messages == 1, language .. " Raptor Strike sends exactly once")
    local nightelf = newClient({race="NightElf"})
    check(type(nightelf.addon.localeData[language].racial.NightElf.RAPTOR_STRIKE) == "table",
        language .. " preserves night elf texts")
end

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


-- Vollständiger Forever-Jäger-Zauberkatalog in drei Sprachen.
local spells = newClient({ race = "Human", pet = "Begleiter" })
spells.command("chance 100")
spells.command("cooldown 0")
local catalogCount = 0
for key, meta in pairs(spells.addon.hunterSpellbook) do
    catalogCount = catalogCount + 1
    check(meta.school and meta.mode, "metadata complete: " .. key)
    for _, lang in ipairs({"deDE", "enUS", "frFR"}) do
        local data = spells.addon.localeData[lang]
        local entry = data.texts[key]
        check(type(entry) == "table" and type(entry.gruppe) == "table"
            and #entry.gruppe >= 2, lang .. " complete spell pool: " .. key)
        spells.command("language " .. lang)
        local line = spells.addon.BuildText(key)
        check(type(line) == "string" and #line > 3,
            lang .. " can narrate " .. key)
        check(#line <= 255, lang .. " speech fits chat limit " .. key)
    end
end
check(catalogCount == 58, "58 unique Forever hunter spells")

-- Die acht spielbaren Jäger-Varianten erhalten einen eigenen Tonfall.
local races = {
    {"Human", "Human"}, {"Dwarf", "Dwarf"}, {"NightElf", "NightElf"},
    {"Orc", "Orc"}, {"Tauren", "Tauren"}, {"Troll", "Troll"},
    {"Skyborne", "SkyborneHighOrder", 95, "Alliance"},
    {"Skyborne", "SkyborneWindshaper", 96, "Horde"},
}
local categories = {"PET","WEAPON","TRACKING","CAMP","WILDERNESS",
    "WEATHER","PROVISIONS","TROPHY","BOW","FIREARM","WATCH","TRAVEL"}
for _, entry in ipairs(races) do
    local hunter = newClient({
        race=entry[1], raceId=entry[3], faction=entry[4],
        pet="Treuer Gefaehrte",
    })
    check(hunter.addon.GetPlayerRaceToken() == entry[2],
        "correct playable hunter race: " .. entry[2])
    for _, lang in ipairs({"deDE","enUS","frFR"}) do
        hunter.command("language " .. lang)
        local voice = hunter.addon.localeData[lang].racialVoices[entry[2]]
        check(type(voice) == "table", lang .. " voice: " .. entry[2])
        for _, group in ipairs({"BM","MM","SV","BT"}) do
            check(type(voice[group]) == "table" and #voice[group] >= 2,
                lang .. " cultural school " .. group .. " " .. entry[2])
        end
        for _, name in ipairs(categories) do
            local line = hunter.addon.BuildAmbient(name)
            check(type(line) == "string" and #line > 3 and #line <= 255,
                lang .. " ambient category " .. entry[2] .. "/" .. name)
            check(not line:find("%%s",1,true) and not line:find("%%p",1,true),
                "ambient never leaks placeholders")
        end
        for _, key in ipairs({"AUTO_SHOT","LACERATE","MEND_PET",
                "TRUESHOT_AURA","FEIGN_DEATH","SNIPER_SHOT"}) do
            local line = hunter.addon.BuildText(key)
            check(type(line)=="string" and #line <= 255,
                lang .. " race " .. entry[2] .. " skill " .. key)
        end
    end
end

-- Skyborne-Fallback ohne ID: Fraktion genügt; unbekannte Fraktion bleibt neutral.
check(newClient({race="Skyborne", faction="Alliance"}).addon.GetPlayerRaceToken()
    == "SkyborneHighOrder", "Skyborne faction fallback alliance")
check(newClient({race="Skyborne", faction="Horde"}).addon.GetPlayerRaceToken()
    == "SkyborneWindshaper", "Skyborne faction fallback horde")
check(newClient({race="Skyborne"}).addon.GetPlayerRaceToken()
    == "Skyborne", "Skyborne neutral fallback")

-- Namen freundlicher Ziele dürfen nicht in Feindansprachen erscheinen.
local friendlyTarget = newClient({race="Human", hostile=false})
friendlyTarget.target = "UNIQUE_FRIEND_TARGET_98765"
for key, meta in pairs(friendlyTarget.addon.hunterSpellbook) do
    if meta.mode == "ENEMY" or meta.mode == "SELF"
        or meta.mode == "TRACK" or meta.mode == "AREA" then
        local line = friendlyTarget.addon.BuildText(key)
        check(not line:find("UNIQUE_FRIEND_TARGET_98765",1,true), key .. " cannot target friendly unit")
        check(not line:find("%%s",1,true), key .. " does not leak format markers")
    end
end

-- Ein gültiger eigener Text hat auch bei neuen Schlüsseln Vorrang.
local personalHunter = newClient({race="Dwarf"})
personalHunter.env.JaegerRP_CharacterDB.personalTexts.SNIPER_SHOT = {
    gruppe = {"Eigener Spruch bleibt, genauso wie er geschrieben wurde."},
}
check(personalHunter.addon.BuildText("SNIPER_SHOT")
    == "Eigener Spruch bleibt, genauso wie er geschrieben wurde.",
    "saved personal text remains unmodified")

-- Ambient wird niemals durch einen Timer direkt verschickt.
local quietHunter = newClient({race="Dwarf"})
quietHunter.command("ambient on")
local sentBefore = #quietHunter.messages
check(quietHunter.addon.QueueAmbient("WEATHER"), "ambient may queue WEATHER")
check(#quietHunter.messages == sentBefore, "ambient scheduling never sends chat")

print("PASS: JaegerRP, " .. checks .. " checks")
