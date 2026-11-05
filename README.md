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

Version **0.6.0** deckt die 58 Einträge des Forever-Jäger-Zauberbuchs ab;
zusätzliche bestehende RP-Schlüssel für Jagdhandlungen bleiben erhalten.
Jede Fähigkeit hat Texte in Deutsch, Englisch und Französisch. Für acht
spielbare Jägervarianten gibt es unterschiedliche Sprachstile, einschließlich
der beiden Himmelsgeborenen-Fraktionen. Eigene Charaktertexte haben immer Vorrang.
Zusätzlich stehen zwölf Ambient-Kategorien zur Verfügung.

## Dokumentation

[Sammlungsübersicht](https://github.com/Deathby-Snusnu/RPAddOns/blob/main/README.md) · [Changelog](CHANGELOG.md) ·
[Texteditor und Handbuch](https://github.com/Deathby-Snusnu/RPAddOns/blob/main/docs/RPTextStudio/HANDBUCH.md) ·
[Verpackung und gemeinsame Tests](https://github.com/Deathby-Snusnu/RPAddOns/blob/main/docs/VERPACKUNG.md)

Die oben verlinkten gemeinsamen Anleitungen sind auch aus dem einzelnen
AddOn-Repository erreichbar; ein vollständiger Sammlungs-Checkout ist dafür
nicht erforderlich.

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
/jrp serpent_sting
/jrp concussive_shot
/jrp freezing_trap
/jrp sniper_shot
/jrp ambient test WEATHER
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
| `/jrp list` | Für den Charakter verwendbare Textschlüssel auflisten |
| `/jrp list racial` | Schlüssel des aktuellen Volks auflisten |
| `/jrp list all` | Rassen- und klassenspezifische Schlüssel mit Herkunft auflisten |
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

`RAPTOR_STRIKE` (Raptorstoß) steht allen Jägervölkern als allgemeiner Schlüssel zur Verfügung. Nachtelfen behalten ihre eigenen, bevorzugt verwendeten Varianten. Beispiel: `/jrp RAPTOR_STRIKE`.

## Vollständiger Jäger-Fähigkeitskatalog

Die `data/Spellbook.lua` führt die **58 Zauberschlüssel** aus dem aktuellen
Forever-Jäger-Zauberbuch (Build 1.60.1.70790) mit Ziel-Kategorien. Einige
Schlüssel stehen nur mit bestimmten Talenten oder auf bestimmten Stufen zur
Verfügung. RP-Ausgaben wirken keine Spielzauber.

| Bereich | RP-Schlüssel |
|---|---|
| Tierherrschaft | `TAME_BEAST`, `ASPECT_MONKEY`, `ASPECT_HAWK`, `CALL_PET`, `DISMISS_PET`, `FEED_PET`, `REVIVE_PET`, `MEND_PET`, `EAGLE_EYE`, `EYES_OF_THE_BEAST`, `SCARE_BEAST`, `ASPECT_CHEETAH`, `BEAST_LORE`, `SUMMON_HAWK`, `ASPECT_BEAST`, `ASPECT_PACK`, `ASPECT_WILD`, `TRANQUILIZING_SHOT`, `INTIMIDATION`, `BESTIAL_WRATH` |
| Treffsicherheit | `AUTO_SHOT`, `SERPENT_STING`, `ARCANE_SHOT`, `HUNTERS_MARK`, `CONCUSSIVE_SHOT`, `DISTRACTING_SHOT`, `MULTI_SHOT`, `AIMED_SHOT`, `SCORPID_STING`, `TRUESHOT_AURA`, `RAPID_FIRE`, `FLARE`, `VIPER_STING`, `SNIPER_SHOT`, `VOLLEY`, `SCATTER_SHOT` |
| Überleben | `RAPTOR_STRIKE`, `TRACK_BEASTS`, `TRACK_HUMANOIDS`, `WING_CLIP`, `IMMOLATION_TRAP`, `MONGOOSE_BITE`, `TRACK_UNDEAD`, `DISENGAGE`, `FREEZING_TRAP`, `TRACK_HIDDEN`, `COUNTERATTACK`, `TRACK_ELEMENTALS`, `FROST_TRAP`, `FEIGN_DEATH`, `LACERATE`, `TRACK_DEMONS`, `EXPLOSIVE_TRAP`, `TRACK_GIANTS`, `TRACK_DRAGONKIN`, `DETERRENCE`, `STRIDER_KICK` |
| Tiergefährten-Training | `BEAST_TRAINING` |

Vorhandene zusätzliche RP-Aktionen bleiben: `KILL_COMMAND`, `STEADY_SHOT`,
`TAMING`, `TRAP`, `MELEE`, `TRACKING`, `CAMOUFLAGE`, `VICTORY`.
Sie sind keine Behauptung über die Verfügbarkeit in jedem Client.

**Beispiel-Makro für Raptorstoß:**

```text
#showtooltip Raptorstoß
/cast Raptorstoß
/jrp RAPTOR_STRIKE
```

**Beispiel-Makro für Erschütternder Schuss:**

```text
#showtooltip Erschütternder Schuss
/cast Erschütternder Schuss
/jrp CONCUSSIVE_SHOT
```

Die deutschen Zaubernamen müssen der Schreibweise im Spielclient entsprechen.
Ein RP-Schlüssel löst nur den Erzähltext aus, nie selbst einen geschützten Cast.
`/jrp list` zeigt verfügbare Schlüssel im geladenen AddOn.

### Zielregeln

- **ENEMY:** Gegnersprüche dürfen den Namen eines angreifbaren Ziels verwenden.
  Freundliche Ziele werden nicht mit feindlichen Sprüchen angesprochen.
- **TARGET:** neutrales oder gewähltes Ziel etwa bei `TAME_BEAST` und
  `BEAST_LORE`.
- **PET:** `MEND_PET`, `FEED_PET`, `REVIVE_PET` und weitere Tieraktionen
  beziehen sich auf den Begleiter, nie auf einen beliebigen Feind.
- **SELF, TRACK, AREA:** Aspekte, Fährten, Fallen und Flächensprüche nennen
  keinen zufälligen Zielnamen.

Nur `%s` wird in passenden Zieltexten eingesetzt. Bei fehlendem Ziel greifen
die zielunabhängigen `gruppe`-Zeilen. Der Code prüft keinen Cast-Erfolg, wählt
keine Ziele und versendet keine automatischen RP-Nachrichten.

## Volkstypische Texte

Es gibt acht spielbare Jäger-Varianten: Mensch, Zwerg, Nachtelf, Ork,
Tauren, Troll sowie die Himmelsgeborenen der Hohen Ordnung (Allianz) und
Windformer (Horde). Die früheren speziellen Rassentexte unter
`locales/<locale>/Racial.lua` bleiben erhalten.

Alle weiteren Fähigkeiten bekommen ihren individuellen Zaubertext, ergänzt
um kulturspezifische Sprach- oder Handlungselemente aus
`locales/<locale>/Voices.lua`. So bleibt die Aktion erkennbar, ohne dass
jeder Jäger dieselben Floskeln verwendet.

Die Laufzeit identifiziert Himmelsgeborene über den Rassenwert (95/96) und
ersatzweise die Fraktion. Falls beide Angaben fehlen, wird der neutrale
`Skyborne`-Stil verwendet. Andere, nicht definierte Völker fallen auf
unveränderte allgemeine Texte zurück.

Priorität: **persönliche Texte → vorhandener, spezieller Rassentext →
allgemeiner Sprachtext mit Volkston → deutscher Fallback**.
Persönliche `JaegerRP_CharacterDB.personalTexts` und weitere gespeicherte
Einstellungen werden durch die Erweiterung nicht überschrieben.

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
zusammen mit den eingebauten Schlüsseln an. Die Varianten `list racial` und
`list all` sind in [Dynamische RP-Textschlüssellisten](../../docs/LISTEN-HANDBUCH.md)
beschrieben.

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

Der Test simuliert die benötigten WoW-APIs und prüft nun auch alle 58
Fähigkeiten in drei Sprachen, acht Jägervarianten, zwölf Ambient-Kategorien,
Zielregeln und den Vorrang persönlicher Texte. Er prüft außerdem:

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

Die TOC deklariert Interface `16001` und Version `0.6.0`. Dies belegt keine
Kompatibilität mit anderen Clientversionen; ein Ingame-Test bleibt erforderlich.

Für Chat-Ausgaben wird `C_ChatInfo.SendChatMessage` benötigt. Ein Client
ohne diese API wird mit einer Meldung abgewiesen.

## Projektstruktur

- `JaegerRP.toc`: Metadaten und Ladereihenfolge.
- `JaegerRP.lua`: Login, Klassenprüfung und öffentliche API.
- `config/Settings.lua`: Standardwerte.
- `core/Database.lua`: Charakterdaten und Validierung.
- `core/Text.lua`: Auswahl, Zielersetzung und persönliche Textpools.
- `core/RacialVoices.lua`: Kultursprache für bestehende fähigkeitsspezifische Texte.
- `core/Ambient.lua`: Ambient-Vormerkung, keine unaufgeforderte Chat-Ausgabe.
- `data/Spellbook.lua`: zur Laufzeit geladenes Verzeichnis der 58 Fähigkeiten.
- `core/Chat.lua`: Sprachkanal, Rassensprache und `/me`-Erkennung.
- `core/Cooldown.lua`: RP-Cooldown.
- `core/Commands.lua`: `/jrp`-Befehle.
- `locales/<locale>/Texts.lua`: deutsche, englische und französische
  RP-Textdaten.
- `locales/<locale>/Racial.lua`: rassenspezifische Markierungs- und
  Fährtentexte je Sprache.
- `locales/<locale>/Voices.lua`: kulturelle Sprach- und Emote-Varianten.
- `locales/<locale>/AmbientRacialExtra.lua`: volksspezifische Lager- und Jagdtexte.
- `locales/<locale>/Expansion.lua`: Legacy-Kompatibilität ohne generische Füllsätze.
- `tests/test_addon.lua`: Lokaler Regressionstest.

Die Kernmodule verwenden die projektweit einheitlichen Funktionen
`BuildText`, `SendText`, `CooldownReady` und `StartCooldown`. `TryText` bleibt
die öffentliche manuelle Schnittstelle; gesprochene Texte und markierte
`/me`-Handlungen behalten ihre unterschiedlichen Kanäle.

`data/Spellbook.lua` ist in der TOC enthalten und stellt die Zielmetadaten
zur Verfügung. Die sichtbaren RP-Formulierungen bleiben in den Locale-Dateien.

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
