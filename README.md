# Jaeger RP

## Beschreibung

Eigenständiges Rollenspiel-Add-on für Jäger. Es stellt zufällige
Rollenspieltexte zu Jägerfähigkeiten, Fallen, Aufklärung und Begleitern
bereit. Texte werden nur auf manuellen Befehl ausgegeben; das Add-on reagiert
nicht automatisch auf Zauber- oder andere Spielereignisse.

Die Textdaten unterscheiden zwischen gesprochenem RP und Handlungen:

- normale Texte werden als Sprache ausgegeben, standardmäßig über `/say`;
- Texte zwischen `*Sternchen*` werden automatisch als `/me`-Emote ausgegeben;
- die Sternchen dienen nur als Markierung in der Textdatenbank und erscheinen
  nicht im Chat.

Für Jäger der klassischen spielbaren Völker gibt es zusätzlich eigene Texte
für Jägermarkierung und Fährtensuche. Eigene Charaktertexte haben Vorrang vor
Rassentexten; wenn kein Rassentext vorhanden ist, werden die allgemeinen
Jägertexte verwendet.

## Dokumentation

[Sammlungsübersicht](../../README.md) · [Changelog](CHANGELOG.md) ·
[Texteditor und Handbuch](../../docs/RPTextStudio/HANDBUCH.md) ·
[Verpackung und gemeinsame Tests](../../docs/VERPACKUNG.md)

## Installation

Den Ordner `JaegerRP` in das `Interface\AddOns`-Verzeichnis des WoW-Clients
kopieren. Anschließend muss `AddOns\JaegerRP\JaegerRP.toc` vorhanden sein.
Das Add-on in der Charakterauswahl aktivieren und mit einem Jäger einloggen.

## Schnellstart

```text
/jrp help
/jrp list
/jrp hunters_mark
/jrp mend_pet
/jrp status
/jrp chance 100
/jrp cooldown 20
/jrp channel SAY
```

`/jaegerrp` ist ein Alias. Standardmäßig beträgt die Textchance 30 Prozent,
der Cooldown 20 Sekunden und der Sprachkanal SAY. Die erste Ausgabe ist sofort
möglich. Chance und Cooldown gelten auch für manuelle Aufrufe; Chance 0
deaktiviert die Ausgabe.

Nur Jäger können RP-Texte senden. Andere Klassen können Einstellungen
einsehen und ändern.

## Makros

Das Add-on castet keine Fähigkeiten selbst. Es kann an ein normales WoW-Makro
angehängt werden:

```text
#showtooltip Mal des Jaegers
/cast Mal des Jaegers
/run JaegerRP.TryText("HUNTERS_MARK")
```

Oder zum Beispiel:

```text
#showtooltip
/cast Tier heilen
/run JaegerRP.TryText("MEND_PET")
```

Der RP-Text wird unabhängig davon versucht, ob der Zauber erfolgreich war.
Das Add-on prüft keinen Cast-Erfolg.

`JaegerRP.TryText(key)` erwartet einen nicht leeren String und normalisiert
ihn auf Großbuchstaben. Die Funktion liefert `true` nach einem erfolgreichen
Chat-API-Aufruf, sonst `false`. Vor `PLAYER_LOGIN` werden Aufrufe mit einer
Meldung abgelehnt.

## Gesprochen oder /me

Die Unterscheidung wird direkt in `locales/<locale>/Texts.lua` gepflegt.

Gesprochen:

```lua
"Ruhig, alter Freund. Ich kuemmere mich darum.",
```

Handlung:

```lua
"*kniet sich zu seinem Begleiter und versorgt dessen Wunden.*",
```

Der Handler entfernt bei Handlungen die Sternchen und sendet den Inhalt als
`EMOTE`, also wie:

```text
/me kniet sich zu seinem Begleiter und versorgt dessen Wunden.
```

Gesprochene Texte verwenden den eingestellten Sprachkanal. Handlungen werden
immer als `/me` ausgegeben.

## Befehle

| Befehl | Funktion |
| --- | --- |
| `/jrp` oder `/jrp help` | Hilfe anzeigen |
| `/jrp list` | Verfügbare Textschlüssel auflisten |
| `/jrp <schluessel>` | Einen RP-Text versuchen |
| `/jrp status` | Einstellungen anzeigen |
| `/jrp chance <0-100>` | Textchance als ganze Zahl setzen |
| `/jrp cooldown <0-3600>` | Cooldown in Sekunden setzen |
| `/jrp channel` | Aktuellen Sprachkanal anzeigen |
| `/jrp channel <kanal>` | Sprachkanal setzen |
| `/jrp language [deDE\|enUS\|frFR]` | RP-Ausgabesprache anzeigen oder setzen |

Sprachkanäle: `SAY`, `YELL`, `PARTY`, `RAID`, `INSTANCE_CHAT` und `AUTO`.

`EMOTE` ist kein einstellbarer Sprachkanal. Emotes werden anhand der
`*...*`-Markierung automatisch erkannt.

`AUTO` wählt Instanzgruppe, Schlachtzug, Gruppe oder SAY in dieser
Reihenfolge. Ein nicht verfügbarer Gruppenkanal wird für gesprochene Texte
abgelehnt und nicht auf SAY umgeleitet. Ein markiertes Emote kann trotzdem
als `/me` ausgegeben werden.

## Textschlüssel

| Bereich | Schlüssel |
| --- | --- |
| Jägermarkierung | `HUNTERS_MARK` |
| Fernkampfangriffe | `ARCANE_SHOT`, `AIMED_SHOT`, `MULTI_SHOT`, `STEADY_SHOT`, `RAPID_FIRE` |
| Begleiter | `KILL_COMMAND`, `MEND_PET`, `REVIVE_PET`, `FEED_PET`, `TAMING` |
| Fallen und Aufklärung | `TRAP`, `FLARE`, `TRACKING`, `CAMOUFLAGE` |
| Aspekte und Nahkampf | `ASPECT_HAWK`, `ASPECT_CHEETAH`, `ASPECT_MONKEY`, `DISENGAGE`, `MELEE` |
| Abschluss | `VICTORY` |

Die Schlüssel sind Textkategorien und keine Prüfung auf Zauber im Client.
Verfügbarkeit und Namen einzelner Fähigkeiten können je nach WoW-Version
abweichen.

`%s` wird durch den für den Schlüssel aufgelösten Namen ersetzt.
`MEND_PET`, `REVIVE_PET` und `FEED_PET` verwenden ausschließlich den
vorhandenen Begleiter. Aspekte, `RAPID_FIRE`, `DISENGAGE`, `TRACKING` und
`CAMOUFLAGE` verwenden keinen Zielnamen. Andere Schlüssel nutzen das aktuelle
Ziel, sofern vorhanden. Das Add-on wählt kein Spielziel und prüft keinen
Zaubererfolg.

Mit aufgelöstem Namen wird zuerst `ziel`, danach `gruppe` versucht;
anschließend sind auch zielunabhängige Einträge aus `ziel` möglich. Ohne Namen
werden Einträge mit `%s` nicht ausgewählt. `gruppe` setzt keine tatsächliche
Spielergruppe voraus.

Die Fernkampftexte sind absichtlich weitgehend waffenneutral formuliert und
passen damit zu Bogen, Armbrust und Schusswaffe.

## Rassenspezifische Texte

`locales/<locale>/Racial.lua` enthält eigene Varianten für `HUNTERS_MARK` und
`TRACKING` für Zwerge, Nachtelfen, Orcs, Tauren und Trolle. Andere Völker
verwenden die allgemeinen Textpools. `Scourge` wird wie in den anderen
Klassen-AddOns als `Undead` behandelt.

Ein nutzbarer persönlicher Text hat Vorrang. Andernfalls wird der erste
vorhandene Locale-Pool gewählt: Rassentext der Ausgabesprache, allgemeiner
Text der Ausgabesprache, deutscher Rassentext, deutscher allgemeiner Text.
Ein vorhandener, aber unbrauchbarer Locale-Pool wird nicht übersprungen.
Ziel- und Gruppenpools sowie `*...*`-Emotes funktionieren für rassenspezifische
Texte genauso wie für allgemeine Texte.

## Eigene Texte

Eigene Textpools können in `JaegerRP_CharacterDB.personalTexts` mit
großgeschriebenem Schlüssel gespeichert werden:

```text
/run JaegerRP_CharacterDB.personalTexts.HUNTERS_MARK={"Ich markiere Euch, %s.","*behaelt %s fest im Blick.*"}
```

Ohne Ziel können Gruppentexte in einer Tabelle mit `ziel` und `gruppe`
angegeben werden:

```lua
JaegerRP_CharacterDB.personalTexts.TEST = {
    ziel = {
        "Ich habe Euch im Blick, %s.",
        "*mustert %s aufmerksam.*",
    },
    gruppe = {
        "Augen offen.",
        "*prueft aufmerksam die Umgebung.*",
    },
}
```

Nutzbare eigene Texte haben Vorrang; andernfalls wird der Locale-Pool versucht.
Es dürfen auch eigene neue Textschlüssel angelegt werden; `/jrp list` zeigt sie
zusammen mit den eingebauten Schlüsseln an.

Nach Platzhalterersetzung und dem Entfernen einer eventuellen Emote-Markierung
sind maximal 255 Bytes erlaubt. Zeilenumbrüche und `|`-Chatmarkierungen werden
abgelehnt. Eine nur einseitige `*`-Markierung wird ebenfalls nicht
gesendet.

## Einstellungen

Die Standardwerte stehen in `config/Settings.lua`.

Alle Einstellungen und eigenen Texte werden pro Charakter in
`JaegerRP_CharacterDB` gespeichert. Ungültige gespeicherte Werte werden mit
einer Meldung auf Standardwerte zurückgesetzt; unbekannte Datenbankfelder
bleiben erhalten.

| Einstellung | Standard | Werte |
| --- | --- | --- |
| `outputLanguage` | `deDE` | `deDE`, `enUS`, `frFR` |
| `textChance` | `30` | Ganze Zahl 0-100 |
| `cooldown` | `20` | Ganze Zahl 0-3600 Sekunden |
| `chatChannel` | `SAY` | SAY, YELL, PARTY, RAID, INSTANCE_CHAT, AUTO |

Die RP-Ausgabesprache kann pro Charakter auf `deDE`, `enUS` oder `frFR`
gestellt werden. Ohne Argument zeigt `/jrp language` die aktuelle Sprache.
Fehlende ältere Textpools fallen auf Deutsch zurück. SAY/YELL können
zusätzlich die bekannte Volkssprache verwenden, sofern der Client sie
bereitstellt; diese ist von der RP-Ausgabesprache getrennt.

Ältere Einstellungen mit `chatChannel = "EMOTE"` werden auf den
Standard-Sprachkanal SAY zurückgesetzt, da `/me` nun automatisch über die
Textmarkierung gesteuert wird.

## Tests

Im Quellprojekt liegt `tests/test_addon.lua`. Vom Add-on-Ordner aus mit Lua 5.1
oder 5.4 starten:

```powershell
lua tests\test_addon.lua
```

Der Test simuliert die benötigten WoW-APIs und prüft unter anderem:

- Initialisierung und Klassenprüfung,
- Einstellungen und Kanäle,
- Ziel- und Gruppentexte,
- persönliche Textpools,
- `/say` gegen `/me`,
- Entfernen der Emote-Sternchen,
- fehlerhafte Emote-Markierungen,
- Chat-Sicherheitsgrenzen,
- Cooldown und Textchance.

Er ersetzt keinen Test im WoW-Client.

## Kompatibilität

Die TOC deklariert Interface `16001` und Version `0.4.0`. Dies belegt keine
Kompatibilität mit anderen Clientversionen; ein Ingame-Test bleibt erforderlich.

Für Chat-Ausgaben wird `C_ChatInfo.SendChatMessage` benötigt. Ein Client
ohne diese API wird mit einer Meldung abgewiesen.

## Projektstruktur

- `JaegerRP.toc`: Metadaten und Ladereihenfolge.
- `JaegerRP.lua`: Login, Klassenprüfung und öffentliche API.
- `config/Settings.lua`: Standardwerte.
- `core/Database.lua`: Charakterdaten und Validierung.
- `core/Text.lua`: Auswahl, Zielersetzung und persönliche Textpools.
- `core/Chat.lua`: Sprachkanal, Rassensprache und `/me`-Erkennung.
- `core/Cooldown.lua`: RP-Cooldown.
- `core/Commands.lua`: `/jrp`-Befehle.
- `locales/<locale>/Texts.lua`: deutsche, englische und französische
  RP-Textdaten.
- `locales/<locale>/Racial.lua`: rassenspezifische Markierungs- und
  Fährtentexte je Sprache.
- `locales/<locale>/Expansion.lua`: zusätzliche Laufzeittexte; vom
  Texteditor nicht bearbeitet.
- `tests/test_addon.lua`: Lokaler Regressionstest.

Die Kernmodule verwenden die projektweit einheitlichen Funktionen
`BuildText`, `SendText`, `CooldownReady` und `StartCooldown`. `TryText` bleibt
die öffentliche manuelle Schnittstelle; gesprochene Texte und markierte
`/me`-Handlungen behalten ihre unterschiedlichen Kanäle.

Die Dateien unter `data/` sind nicht in der TOC-Ladefolge enthalten; die
Laufzeittexte liegen in den Locale-Dateien.

## Lizenz

Dieses AddOn verwendet eine **geteilte Lizenzierung nach Dateityp**:

- Programmcode: **Mozilla Public License 2.0 (MPL-2.0)**, siehe
  [LICENSE](./LICENSE).
- RP-Dialoge, Emote-/Ambient-Texte und Übersetzungen: **CC BY-SA 4.0**, siehe
  [LICENSE-TEXTS](./LICENSE-TEXTS).
- Die verbindliche Zuordnung einer Lua-Datei steht in ihrem
  `SPDX-License-Identifier`.

Weitere Hinweise und der Markenhinweis stehen in [NOTICE](./NOTICE).

## Ambient-Erweiterung (21.10.2026)

Klassen- und rassenspezifisches, dreisprachiges Ambient-System; Konfiguration mit `/jrp ambient`. Details in `AMBIENT.md`.
