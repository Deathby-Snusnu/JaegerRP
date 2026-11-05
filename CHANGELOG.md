# Changelog

Aenderungen an JaegerRP werden in dieser Datei dokumentiert.

## Aktueller Quellstand: 0.6.0 (unveröffentlicht)

- Alle 58 Forever-Jäger-Zauber mit expliziter Zielkategorie versehen; 44 zuvor fehlende allgemeine RP-Schlüssel in deDE, enUS und frFR mit individuellen Ansagen und /me-Emotes ergänzt.
- Kulturelle Sprachstile für acht spielbare Jägervarianten plus neutralen Skyborne-Fallback eingeführt; die Hohe Ordnung und Windformer verwenden unterschiedliche Stimmen.
- Sieben zusätzliche Ambient-Kategorien (Wetter, Proviant, Trophäe, Bogen, Schusswaffe, Wache, Reise) und neue volksspezifische Lager-/Begleitertexte ergänzt. Keine Ausgabe durch OnUpdate.
- Unspezifische automatische Füllsätze in den Expansion-Dateien abgeschaltet. Übrig gebliebene englische und französische Platzhalter für Nachtelfen wurden durch kreative Texte ersetzt.
- Persönliche Texte, Standardwerte, Chatkanäle und gespeicherte Einstellungen behalten ihren Vorrang. Zielnamen werden nur bei passenden Fähigkeiten verwendet.
- Vollständige Lua- und Python-Regressionstests für Sprach-/Rassenabdeckung, Ladereihenfolge, Emotes und Zielschutz ergänzt.

## Historischer Quellstand: 0.5.1

- `RAPTOR_STRIKE` als allgemeiner, dreisprachiger Nahkampf-Textpool ergänzt. Die bisher ausschließlich für Nachtelfen vorhandenen Rassentexte bleiben erhalten. Regressionstests prüfen Zwerge mit und ohne Ziel und alle drei Sprachen.

- Versionsangabe aktualisiert und gemeinsame Dokumentationslinks fuer
  einzelne AddOn-Checkouts erlaeutert.

## [0.5.0] - 2026-10-26

### Dokumentation

- TOC-Version, Selbst-/Begleiterziele, strukturierte Textauswahl,
  persoenlicher Fallback und gemeinsame Dokumentationsverweise aktualisiert.

### Hinzugefuegt
- Dynamische Schluessellisten mit `/jrp list`, `/jrp list racial` und
  `/jrp list all` ergaenzt.
- Zusaetzliche englische und franzoesische Rollenspieltexte fuer
  `RAPTOR_STRIKE` ergaenzt.

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

## Ambient-Erweiterung (21.10.2026)

Klassen- und rassenspezifisches, dreisprachiges Ambient-System; Konfiguration mit `/jrp ambient`. Details in `AMBIENT.md`.

## Ambient-Textausbau (21.10.2026)

- Sechs neue Varianten je allgemeiner Kategorie und weitere Rassentexte; Dwarf/PET neu. Keine Aenderung an den Ambient-Triggern oder SavedVariables.
