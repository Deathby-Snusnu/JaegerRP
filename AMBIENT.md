# Ambient-System JaegerRP

## Verwendung

`/jrp ambient status` zeigt den aktuellen Zustand.

`/jrp ambient on|off` aktiviert/deaktiviert Ambient.

`/jrp ambient chance 70` setzt die Wahrscheinlichkeit (0 bis 100).

`/jrp ambient interval 180 420` setzt Mindest- und Hoechstintervall in Sekunden.

`/jrp ambient combat off` unterdrueckt Ambient im Kampf.

`/jrp ambient test` gibt bei Spieleraktion eine zufaellige Zeile aus.

Ambient-Zeilen werden vom Timer **nur vorgemerkt** und erst beim naechsten spielergesteuerten `/jrp <SCHLUESSEL>` ausgegeben. Kein Chatversand aus `OnUpdate`. Der gemeinsame RP-Cooldown gilt auch fuer Ambient.

## Daten und Prioritaeten

`locales/<Sprache>/AmbientRacial.lua` (Rasse+Kategorie), danach `Ambient.lua` (Klasse+Kategorie), danach dieselben beiden Quellen in `deDE`. Die Textsammlung nutzt CC BY-SA 4.0, Code MPL 2.0. `*...*` bezeichnet eine `/me`-Handlung. Keine dynamischen Ziel-/Pet-Platzhalter in diesen Ambient-Pools.

Backups vor Installation: AddOn-Ordner und WTF-Verzeichnis sichern.

## Erweiterte Textsammlung

Sechs neue Varianten je allgemeiner Kategorie und weitere Rassentexte; Dwarf/PET neu. Jede Sprachfassung (deDE, enUS, frFR) enthaelt dieselben Kategorien und Variantenanzahlen. Die Lua-Textdateien sind im RP Text Studio bearbeitbar.
