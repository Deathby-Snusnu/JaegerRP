# Changelog

Aenderungen an Jaeger RP werden in dieser Datei dokumentiert.

## [0.3.0] - 2026-10-09

### Hinzugefuegt

- Rassenspezifische Texte fuer HUNTERS_MARK und TRACKING bei Zwergen,
  Nachtelfen, Orcs, Tauren und Trollen.
- Rassentexte werden zwischen eigenen Charaktertexten und allgemeinen
  Jaegertexten ausgewaehlt; Scourge wird als Undead behandelt.
- Regressionstests fuer Prioritaet, Rassen-Fallback und Scourge-Alias.

## [0.2.0] - 2026-10-09

### Hinzugefuegt

- Gemischte RP-Ausgabe aus gesprochenen Texten und echten `/me`-Emotes.
- `*...*` als eindeutige Emote-Markierung in der Textdatenbank.
- Automatisches Entfernen der Sternchen vor der Emote-Ausgabe.
- Deutlich erweiterte Textpools fuer Angriffe, Begleiter, Fallen, Aspekte,
  Aufklaerung, Nahkampf und Abschluss.
- Tests fuer `/say`/`/me`, Emote-Markierungen und persoenliche Textschluessel.
- Eigene, nur in `personalTexts` vorhandene Textschluessel werden von
  `/jrp list` mit beruecksichtigt.

### Geaendert

- Fernkampftexte sind waffenneutral fuer Bogen, Armbrust und Schusswaffen.
- RP-Texte unterscheiden staerker zwischen Gesprochenem und sichtbarer Handlung.
- `EMOTE` ist kein manuell einstellbarer Sprachkanal mehr. Markierte Texte
  werden automatisch als `/me` gesendet.
- Begleitertexte wurden weniger generisch und staerker auf die Beziehung
  zwischen Jaeger und Tier ausgerichtet.
- Hilfe, Statusausgabe und README wurden an das neue Textsystem angepasst.
- Addon-Version auf `0.2.0` erhoeht.

### Behoben

- `JaegerRP_CharacterDB.personalTexts` wurde dokumentiert und getestet, aber
  von `core/Text.lua` bisher nicht ausgewertet. Eigene Textpools werden nun
  korrekt bevorzugt.
- Fehlerhafte oder leere Emote-Markierungen werden nicht mehr gesendet.
- Textlaenge wird nach dem Entfernen der Emote-Markierung geprueft.

## [0.1.0] - 2026-10-09

### Hinzugefuegt

- Grundstruktur mit TOC-Metadaten, `/jrp`-Befehlen und
  `JaegerRP_CharacterDB`.
- Eigene Textpools fuer Jaegerfaehigkeiten, Begleiter und Fallen.
- Eigene Textschluessel fuer Aspekt des Falken, Geparden und Affen.
- Konfigurierbarer Chatkanal, Charaktereinstellungen und Regressionstests.
