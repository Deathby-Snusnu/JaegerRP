-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Volksstimmen: zwei kurze kulturspezifische Varianten je Jagdgebiet.
local _, addon = ...
addon.localeData.deDE.racialVoices = {
    Dwarf = {
        BM = {"Bei meinen Ahnen! ", "Ein treuer Gefährte zählt mehr als Gold. "},
        MM = {"Bei meinem Bart! ", "Ein Zwerg kennt sein Handwerk. "},
        SV = {"Stein und Stahl! ", "Den Rücken halte ich frei. "},
        BT = {"Geduld ist härter als Granit. ", "Aufgeben? Nicht mit diesem Bart. "},
        actions = {"prüft den Sitz seines Gürtels und ", "klopft auf den Köcher und"},
    },
    Human = {
        BM = {"Vertrauen trägt weiter als Befehle. ", "Auch Wachen brauchen Freunde. "},
        MM = {"Für unsere Gefährten! ", "Mit klarem Blick für die Heimkehr. "},
        SV = {"Keinen Schritt weiche ich grundlos. ", "Einen kühlen Kopf behalten. "},
        BT = {"Eine gute Lektion beginnt mit Respekt. ", "Geduld bringt alle zurück. "},
        actions = {"legt die Hand an sein schlichtes Abzeichen und ", "prüft die Stellung seiner Gefährten und"},
    },
    NightElf = {
        BM = {"Elune beschütze unsere Gefährten. ", "Der Wald kennt die Sprache der Tiere. "},
        MM = {"Unter den Sternen ist kein Pfad verloren. ", "Der Mond zeigt den richtigen Augenblick. "},
        SV = {"Die Wurzeln erinnern sich. ", "Der Wald schenkt auch den Schatten Schutz. "},
        BT = {"Geduld ist eine alte Gabe. ", "Ein leiser Ruf genügt oft. "},
        actions = {"lauscht auf die Stimmen des Waldes und ", "berührt die Mondsichel am Gewand und"},
    },
    Orc = {
        BM = {"Für die Ehre des Rudels! ", "Ein Gefährte steht neben mir, niemals unter mir. "},
        MM = {"Die Ahnen sehen meinen Schuss. ", "Ein ehrlicher Kampf braucht ein sicheres Auge. "},
        SV = {"Ich halte stand! ", "Ehre zeigt sich auch im Überleben. "},
        BT = {"Stärke ohne Geduld ist nur Lärm. ", "Ein Freund folgt keinem Zwang. "},
        actions = {"ballt kurz die Faust zum Ahnengruß und ", "richtet die erprobte Waffe aus und"},
    },
    Tauren = {
        BM = {"Die Erdenmutter kennt jeden Atemzug. ", "Ein Gefährte gehört zu unserer Herde. "},
        MM = {"Ruhiges Herz, ruhiger Blick. ", "Die Ebene lehrt uns, weit zu sehen. "},
        SV = {"Die Erde trägt meine Schritte. ", "Wer geduldig steht, fällt nicht leicht. "},
        BT = {"Wurzeln wachsen nicht in Eile. ", "Achte auf das kleinste Zeichen des Lebens. "},
        actions = {"neigt den Kopf zur Erdenmutter und ", "spürt den Boden unter den Hufen und"},
    },
    Troll = {
        BM = {"Die Loa mögen unsere Fährte, mon. ", "Mit 'nem treuen Tier lacht sich's leichter. "},
        MM = {"Heh, die Loa schauen zu! ", "Erst gucken, dann Ärger machen, mon. "},
        SV = {"Ha! So leicht kriegst du mich nich'. ", "Die Ahnen haben schon Schlimmeres gesehen. "},
        BT = {"Ein Loa hat Zeit. Ich auch, mon. ", "Lern erst zuhören, dann reden. "},
        actions = {"schüttelt einen kleinen Beutel mit Opfergaben und ", "grinst den Loa entgegen und"},
    },
    SkyborneHighOrder = {
        BM = {"Die Ordnung entsteht aus Vertrauen. ", "Auch der Himmel kennt treue Gefährten. "},
        MM = {"Mit Anmut und unbestechlichem Blick. ", "Die alten Lehren weisen den Schuss. "},
        SV = {"Jeder Sturm hat eine ruhige Mitte. ", "Selbst der Wind folgt einem Muster. "},
        BT = {"Disziplin beginnt im kleinsten Handgriff. ", "Geduld ist eine Form von Stärke. "},
        actions = {"ordnet den silbernen Mantel und ", "zeichnet eine präzise Linie in die Luft und"},
    },
    SkyborneWindshaper = {
        BM = {"Der Wind kennt die Namen unserer Gefährten. ", "Ein freies Versprechen trägt weit. "},
        MM = {"Der Wind trägt meinen Entschluss. ", "Ein freier Himmel verlangt offene Augen. "},
        SV = {"Kein Sturm hält mich fest. ", "Mein Pfad ist nie vorgezeichnet. "},
        BT = {"Freiheit wächst aus Vertrauen. ", "Wer den Wind zwingen will, verliert ihn. "},
        actions = {"lässt den Wind über die Hände streichen und ", "spürt eine frische Böe und"},
    },
    Skyborne = {
        BM = {"Der Himmel wacht über unsere Gefährten. ", "Der Wind bringt auch Geduld. "},
        MM = {"Freier Blick bis zum Horizont. ", "Die Luft trägt unseren Weg. "},
        SV = {"Wolken ziehen weiter. Wir auch. ", "Kein Pfad bleibt ewig verborgen. "},
        BT = {"Vertrauen ist ein freier Entschluss. ", "Jeder Sturm lehrt uns etwas. "},
        actions = {"lauscht auf den aufkommenden Wind und ", "hebt den Kopf zum Himmel und"},
    },
}
