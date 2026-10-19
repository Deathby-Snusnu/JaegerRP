# Jaeger RP

## Beschreibung

Eigenstaendiges Rollenspiel-Addon fuer Jaeger. Es stellt zufaellige
Rollenspieltexte zu Jaeger-Faehigkeiten, Fallen, Aufklaerung und Begleitern
bereit. Texte werden nur auf manuellen Befehl ausgegeben; das Addon reagiert
nicht automatisch auf Zauber- oder andere Spielereignisse.

Die Textdaten unterscheiden zwischen gesprochenem RP und Handlungen:

- normale Texte werden als Sprache ausgegeben, standardmaessig ueber `/say`;
- Texte zwischen `*Sternchen*` werden automatisch als `/me`-Emote ausgegeben;
- die Sternchen dienen nur als Markierung in der Textdatenbank und erscheinen
  nicht im Chat.

Fuer Jaeger der klassischen spielbaren Voelker gibt es zusaetzlich eigene
Texte fuer Jaegermarkierung und Faehrtensuche. Eigene Charaktertexte haben
Vorrang vor Rassentexten; wenn kein Rassentext vorhanden ist, werden die
allgemeinen Jaegertexte verwendet.

## Dokumentation

[Sammlungsuebersicht](../README.md) · [Changelog](CHANGELOG.md) ·
[Texteditor und Handbuch](../RPTextStudio/HANDBUCH.md) ·
[Verpackung und gemeinsame Tests](../VERPACKUNG.md)

## Installation

Den Ordner `JaegerRP` in das `Interface\AddOns`-Verzeichnis des WoW-Clients
kopieren. Anschliessend muss `AddOns\JaegerRP\JaegerRP.toc` vorhanden sein.
Das Addon in der Charakterauswahl aktivieren und mit einem Jaeger einloggen.

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

`/jaegerrp` ist ein Alias. Standardmaessig betraegt die Textchance 30 Prozent,
der Cooldown 20 Sekunden und der Sprachkanal SAY. Die erste Ausgabe ist sofort
moeglich. Chance und Cooldown gelten auch fuer manuelle Aufrufe; Chance 0
deaktiviert die Ausgabe.

Nur Jaeger koennen RP-Texte senden. Andere Klassen koennen Einstellungen
einsehen und aendern.

## Makros

Das Addon castet keine Faehigkeiten selbst. Es kann an ein normales WoW-Makro
angehaengt werden:

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

Der RP-Text wird unabhaengig davon versucht, ob der Zauber erfolgreich war.
Das Addon prueft keinen Cast-Erfolg.

`JaegerRP.TryText(key)` erwartet einen nicht leeren String und normalisiert
ihn auf Grossbuchstaben. Die Funktion liefert `true` nach einem erfolgreichen
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
| `/jrp list` | Verfuegbare Textschluessel auflisten |
| `/jrp <schluessel>` | Einen RP-Text versuchen |
| `/jrp status` | Einstellungen anzeigen |
| `/jrp chance <0-100>` | Textchance als ganze Zahl setzen |
| `/jrp cooldown <0-3600>` | Cooldown in Sekunden setzen |
| `/jrp channel` | Aktuellen Sprachkanal anzeigen |
| `/jrp channel <kanal>` | Sprachkanal setzen |
| `/jrp language [deDE\|enUS\|frFR]` | RP-Ausgabesprache anzeigen oder setzen |

Sprachkanaele: `SAY`, `YELL`, `PARTY`, `RAID`, `INSTANCE_CHAT` und `AUTO`.

`EMOTE` ist kein einstellbarer Sprachkanal. Emotes werden anhand der
`*...*`-Markierung automatisch erkannt.

`AUTO` waehlt Instanzgruppe, Schlachtzug, Gruppe oder SAY in dieser
Reihenfolge. Ein nicht verfuegbarer Gruppenkanal wird fuer gesprochene Texte
abgelehnt und nicht auf SAY umgeleitet. Ein markiertes Emote kann trotzdem
als `/me` ausgegeben werden.

## Textschluessel

| Bereich | Schluessel |
| --- | --- |
| Jaegermarkierung | `HUNTERS_MARK` |
| Fernkampfangriffe | `ARCANE_SHOT`, `AIMED_SHOT`, `MULTI_SHOT`, `STEADY_SHOT`, `RAPID_FIRE` |
| Begleiter | `KILL_COMMAND`, `MEND_PET`, `REVIVE_PET`, `FEED_PET`, `TAMING` |
| Fallen und Aufklaerung | `TRAP`, `FLARE`, `TRACKING`, `CAMOUFLAGE` |
| Aspekte und Nahkampf | `ASPECT_HAWK`, `ASPECT_CHEETAH`, `ASPECT_MONKEY`, `DISENGAGE`, `MELEE` |
| Abschluss | `VICTORY` |

Die Schluessel sind Textkategorien und keine Pruefung auf Zauber im Client.
Verfuegbarkeit und Namen einzelner Faehigkeiten koennen je nach WoW-Version
abweichen.

`%s` wird durch den fuer den Schluessel aufgeloesten Namen ersetzt.
MEND_PET, REVIVE_PET und FEED_PET verwenden ausschliesslich den vorhandenen
Begleiter. Aspekte, RAPID_FIRE, DISENGAGE, TRACKING und CAMOUFLAGE verwenden
keinen Zielnamen. Andere Schluessel nutzen das aktuelle Ziel, sofern vorhanden.
Das Addon waehlt kein Spielziel und prueft keinen Zaubererfolg.

Mit aufgeloestem Namen wird zuerst `ziel`, danach `gruppe` versucht;
anschliessend sind auch zielunabhaengige Eintraege aus `ziel` moeglich.
Ohne Namen werden Eintraege mit `%s` nicht ausgewaehlt. `gruppe` setzt keine
tatsaechliche Spielergruppe voraus.

Die Fernkampftexte sind absichtlich weitgehend waffenneutral formuliert und
passen damit zu Bogen, Armbrust und Schusswaffe.

## Rassenspezifische Texte

`locales/<locale>/Racial.lua` enthaelt eigene Varianten fuer `HUNTERS_MARK` und
`TRACKING` fuer Zwerge, Nachtelfen, Orcs, Tauren und Trolle. Andere Voelker
verwenden die allgemeinen Textpools. `Scourge` wird wie in den anderen
Klassen-AddOns als `Undead` behandelt.

Ein nutzbarer persoenlicher Text hat Vorrang. Andernfalls wird der erste
vorhandene Locale-Pool gewaehlt: Rassentext der Ausgabesprache, allgemeiner
Text der Ausgabesprache, deutscher Rassentext, deutscher allgemeiner Text.
Ein vorhandener, aber unbrauchbarer Locale-Pool wird nicht uebersprungen.
Ziel- und Gruppenpools sowie `*...*`-Emotes funktionieren fuer
rassenspezifische Texte genauso wie fuer allgemeine Texte.

## Eigene Texte

Eigene Textpools koennen in `JaegerRP_CharacterDB.personalTexts` mit
grossgeschriebenem Schluessel gespeichert werden:

```text
/run JaegerRP_CharacterDB.personalTexts.HUNTERS_MARK={"Ich markiere Euch, %s.","*behaelt %s fest im Blick.*"}
```

Ohne Ziel koennen Gruppentexte in einer Tabelle mit `ziel` und `gruppe`
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
Es duerfen auch eigene neue Textschluessel angelegt werden;
`/jrp list` zeigt sie zusammen mit den
eingebauten Schluesseln an.

Nach Platzhalterersetzung und dem Entfernen einer eventuellen Emote-Markierung
sind maximal 255 Bytes erlaubt. Zeilenumbrueche und `|`-Chatmarkierungen
werden abgelehnt. Eine nur einseitige `*`-Markierung wird ebenfalls nicht
gesendet.

## Einstellungen

Die Standardwerte stehen in `config/Settings.lua`.

Alle Einstellungen und eigenen Texte werden pro Charakter in
`JaegerRP_CharacterDB` gespeichert. Ungueltige gespeicherte Werte werden mit
einer Meldung auf Standardwerte zurueckgesetzt; unbekannte Datenbankfelder
bleiben erhalten.

| Einstellung | Standard | Werte |
| --- | --- | --- |
| `outputLanguage` | `deDE` | `deDE`, `enUS`, `frFR` |
| `textChance` | `30` | Ganze Zahl 0-100 |
| `cooldown` | `20` | Ganze Zahl 0-3600 Sekunden |
| `chatChannel` | `SAY` | SAY, YELL, PARTY, RAID, INSTANCE_CHAT, AUTO |

Die RP-Ausgabesprache kann pro Charakter auf `deDE`, `enUS` oder `frFR`
gestellt werden. Ohne Argument zeigt `/jrp language` die aktuelle Sprache.
Fehlende aeltere Textpools fallen auf Deutsch zurueck. SAY/YELL koennen
zusaetzlich die bekannte Volkssprache verwenden, sofern der Client sie
bereitstellt; diese ist von der RP-Ausgabesprache getrennt.

Aeltere Einstellungen mit `chatChannel = "EMOTE"` werden auf den
Standard-Sprachkanal SAY zurueckgesetzt, da `/me` nun automatisch ueber die
Textmarkierung gesteuert wird.

## Tests

Im Quellprojekt liegt `tests/test_addon.lua`. Vom Addon-Ordner aus mit Lua 5.1
oder 5.4 starten:

```powershell
lua tests\test_addon.lua
```

Der Test simuliert die benoetigten WoW-APIs und prueft unter anderem:

- Initialisierung und Klassenpruefung,
- Einstellungen und Kanaele,
- Ziel- und Gruppentexte,
- persoenliche Textpools,
- `/say` gegen `/me`,
- Entfernen der Emote-Sternchen,
- fehlerhafte Emote-Markierungen,
- Chat-Sicherheitsgrenzen,
- Cooldown und Textchance.

Er ersetzt keinen Test im WoW-Client.

## Kompatibilitaet

Die TOC deklariert Interface `16001` und Version `0.4.0`. Dies belegt keine
Kompatibilitaet mit anderen Clientversionen; ein Ingame-Test bleibt erforderlich.

Fuer Chat-Ausgaben wird `C_ChatInfo.SendChatMessage` benoetigt. Ein Client
ohne diese API wird mit einer Meldung abgewiesen.

## Projektstruktur

- `JaegerRP.toc`: Metadaten und Lade-Reihenfolge.
- `JaegerRP.lua`: Login, Klassenpruefung und oeffentliche API.
- `config/Settings.lua`: Standardwerte.
- `core/Database.lua`: Charakterdaten und Validierung.
- `core/Text.lua`: Auswahl, Zielersetzung und persoenliche Textpools.
- `core/Chat.lua`: Sprachkanal, Rassensprache und `/me`-Erkennung.
- `core/Cooldown.lua`: RP-Cooldown.
- `core/Commands.lua`: `/jrp`-Befehle.
- `locales/<locale>/Texts.lua`: deutsche, englische und franzoesische
  RP-Textdaten.
- `locales/<locale>/Racial.lua`: rassenspezifische Markierungs- und
  Faehrtentexte je Sprache.
- `locales/<locale>/Expansion.lua`: zusaetzliche Laufzeittexte; vom
  Texteditor nicht bearbeitet.
- `tests/test_addon.lua`: Lokaler Regressionstest.

Die Kernmodule verwenden die projektweit einheitlichen Funktionen
`BuildText`, `SendText`, `CooldownReady` und `StartCooldown`. `TryText` bleibt
die oeffentliche manuelle Schnittstelle; gesprochene Texte und markierte
`/me`-Handlungen behalten ihre unterschiedlichen Kanaele.

Die Dateien unter `data/` sind nicht in der TOC-Ladefolge enthalten; die
Laufzeittexte liegen in den Locale-Dateien.

## Lizenz

Dieses AddOn verwendet eine **geteilte Lizenzierung nach Dateityp**:

- Programmcode: **Mozilla Public License 2.0 (MPL-2.0)**, siehe [LICENSE](./LICENSE).
- RP-Dialoge, Emote-/Ambient-Texte und Übersetzungen: **CC BY-SA 4.0**, siehe [LICENSE-TEXTS](./LICENSE-TEXTS).
- Die verbindliche Zuordnung einer Lua-Datei steht in ihrem `SPDX-License-Identifier`.

Weitere Hinweise und der Markenhinweis stehen in [NOTICE](./NOTICE).
