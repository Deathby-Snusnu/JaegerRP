# Ambient-System JaegerRP 0.6.0

## Bedienung

- `/jrp ambient status`: Einstellungen anzeigen.
- `/jrp ambient on|off`: aktivieren oder deaktivieren.
- `/jrp ambient chance 70`: Chance 0–100.
- `/jrp ambient interval 180 420`: Mindest- und Höchstintervall.
- `/jrp ambient combat off`: Ambient im Kampf unterdrücken.
- `/jrp ambient test WEATHER`: manuell eine zufällige Wetterzeile ausgeben.
- `/jrp ambient test PET`: manuell eine Begleiterzeile ausgeben.

## Kategorien

`PET`, `WEAPON`, `TRACKING`, `CAMP`, `WILDERNESS`, `WEATHER`,
`PROVISIONS`, `TROPHY`, `BOW`, `FIREARM`, `WATCH`, `TRAVEL`.

12 Kategorien mit individuellen Texten in deDE, enUS, frFR. Die Rassen-
Erweiterung enthält zusätzlich eigene PET-, CAMP-, TRACKING-, WATCH- und
WEATHER-Texte für alle acht Jägervarianten. Für die übrigen Kategorien wird
der allgemeine fähigkeitsbezogene Text passend zum Volkston ergänzt.

## Sicherheit und Datenhaltung

**OnUpdate versendet niemals Nachrichten.** Der Timer merkt nur eine
Ambient-Kategorie vor. Ein Text wird erst bei einem späteren ausdrücklichen
`/jrp <SCHLÜSSEL>`-Befehl ausgegeben und teilt sich dessen Cooldown.
Ein manueller `/jrp ambient test` ist eine bewusste RP-Aktion.
In Kämpfen kann Ambient unabhängig deaktiviert werden.

Reihenfolge für Kategorie und Sprache: vorhandener Rassentext aus
`AmbientRacial.lua`, zusätzliche Volkstexte aus `AmbientRacialExtra.lua`,
deutsche Rassentexte als Fallback und schließlich die allgemeinen Ambient-
Texte in der gewählten Sprache (notfalls Deutsch). Allgemeine Ambient-Texte
werden im kulturspezifischen Ton formuliert, ohne Namensersetzung.

`*...*` markiert `/me`-Handlungen; gesprochene Texte verwenden den
eingestellten Chatkanal. Textchance, Cooldown, Intervalle und persönliche
SavedVariables bleiben kompatibel. Vor der Installation Spielordner und
WTF-Verzeichnis sichern.

## Textpflege und Test

Locale-Dateien sind normale Lua-Textlisten unter CC BY-SA 4.0; Kernfunktionen
sind MPL-2.0. Regression: `lua tests/test_addon.lua`.
