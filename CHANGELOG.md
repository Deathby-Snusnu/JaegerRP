# Changelog

Aenderungen an JaegerRP werden in dieser Datei dokumentiert.

## [Unreleased]

### Dokumentation

- TOC-Version, Selbst-/Begleiterziele, strukturierte Textauswahl,
  persoenlicher Fallback und gemeinsame Dokumentationsverweise aktualisiert.

### Geaendert

- Zielaufloesung unterscheidet aktuelle Ziele, Selbst- und
  Begleiterfaehigkeiten. Selbstfaehigkeiten verwenden keinen Zielnamen;
  MEND_PET, REVIVE_PET und FEED_PET verwenden nur den Begleiter.
- Gemeinsame Kernfunktionsnamen und Modulkonventionen mit den anderen AddOns
  abgestimmt; Jaeger-spezifische Text- und Emote-Ablaufe bleiben erhalten.

## [0.4.0] - 2026-10-14

### Geaendert

- Einheitliche Textauswahl und Fallback-Logik.
- Personaltexte fallen bei unbrauchbarem Pool sauber auf Locale-Texte zurueck.
- Erweiterter DE/EN/FR-Textvorrat.

## [2026-10-11] Sprachwahl

### Hinzugefuegt

- RP-Ausgabesprache pro Charakter: `deDE`, `enUS` oder `frFR`.
- Sprachdateien unter `locales/<locale>/`; Deutsch dient fuer fehlende
  aeltere Textpools als Fallback.
- Befehle `language` und `lang` zur Auswahl der RP-Ausgabesprache.

### Geaendert

- Locale-Tabellen werden robust einzeln initialisiert.
- Eine Sprache kann nur aktiviert werden, wenn ihre Dateien geladen wurden.

## [0.3.0] - 2026-10-09

### Hinzugefuegt

- Rassenspezifische Texte fuer `HUNTERS_MARK` und `TRACKING` bei Zwergen,
  Nachtelfen, Orcs, Tauren und Trollen.
- Regressionstests fuer Prioritaet, Rassen-Fallback und Scourge-Alias.

### Geaendert

- Rassentexte werden zwischen eigenen Charaktertexten und allgemeinen
  Jaegertexten ausgewaehlt; Scourge wird als Undead behandelt.

## [0.2.0] - 2026-10-09

### Hinzugefuegt

- Gemischte RP-Ausgabe aus gesprochenen Texten und echten `/me`-Emotes.
- `*...*` als Emote-Markierung in der Textdatenbank; Markierungen werden
  vor der Ausgabe entfernt.
- Erweiterte Textpools fuer Angriffe, Begleiter, Fallen, Aspekte,
  Aufklaerung, Nahkampf und Abschluss.
- Tests fuer `/say`/`/me`, Emote-Markierungen und persoenliche Textschluessel.
- Nur in `personalTexts` vorhandene Schluessel werden von `/jrp list`
  beruecksichtigt.

### Geaendert

- Fernkampftexte sind waffenneutral fuer Bogen, Armbrust und Schusswaffen.
- RP-Texte unterscheiden staerker zwischen Gesprochenem und sichtbarer
  Handlung; Begleitertexte betonen die Beziehung zwischen Jaeger und Tier.
- `EMOTE` ist kein manuell einstellbarer Sprachkanal mehr. Markierte Texte
  werden automatisch als `/me` gesendet.
- Hilfe, Statusausgabe und README an das Textsystem angepasst.
- Addon-Version auf `0.2.0` erhoeht.

### Behoben

- `JaegerRP_CharacterDB.personalTexts` wird bei der Textauswahl ausgewertet.
- Fehlerhafte oder leere Emote-Markierungen werden nicht gesendet.
- Textlaenge wird nach dem Entfernen der Emote-Markierung geprueft.

## [0.1.0] - 2026-10-09

### Hinzugefuegt

- Grundstruktur mit TOC-Metadaten, `/jrp`-Befehlen und
  `JaegerRP_CharacterDB`.
- Eigene Textpools fuer Jaegerfaehigkeiten, Begleiter und Fallen sowie
  Textschluessel fuer Aspekte des Falken, Geparden und Affen.
- Konfigurierbarer Chatkanal, Charaktereinstellungen und Regressionstests.
