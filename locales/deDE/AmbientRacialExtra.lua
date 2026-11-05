-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Volksspezifisches Ambient ohne Charakter-spezifische Namen.
local _, addon = ...
addon.localeData.deDE.ambientRacialExtra = {
    Dwarf = {
        PET = { "Bisschen mehr Speck, bisschen weniger Bellen. So wird was draus.", "*prüft den Futtersack und zählt sicherheitshalber zweimal nach.*" },
        CAMP = { "Bei den Ahnen, wer hat mein Werkzeug neben die Wurst gelegt?", "*stellt den Krug so ab, dass keine neugierige Tatze herankommt.*" },
        TRACKING = { "Dieser Steinbruch erzählt mehr als hundert Wirtshausgeschichten.", "*reibt eine Felsplatte frei und entdeckt feine Trittsiegel.*" },
        WATCH = { "Die erste Wache macht mich wach. Die zweite macht mich grantig.", "*stellt die Armbrust griffbereit an die Mauer.*" },
        WEATHER = { "Regen ist nur Wasser, das noch nicht weiß, wo es hingehört.", "*zieht den Mantel enger und prüft den Himmel.*" },
    },
    Human = {
        PET = { "Gut gemacht, Kamerad. Der nächste Bissen gehört dir.", "*legt dem Begleiter das Lederhalsband zurecht.*" },
        CAMP = { "Im Lager redet man leise. Die Geschichten werden ohnehin groß genug.", "*ordnet Decken und Gepäck entlang des Feuers.*" },
        TRACKING = { "Hier führte eine Patrouille vorbei. Ihre Schritte waren nicht gleichmäßig.", "*vergleicht Stiefelabdrücke und gebrochene Halme.*" },
        WATCH = { "Drei Atemzüge lauschen, dann erst die Runde machen.", "*nimmt die Schatten zwischen den Zelten genau in Augenschein.*" },
        WEATHER = { "Wenn die Straße schlammig ist, hilft kein königlicher Befehl.", "*zieht die Kapuze gegen den einsetzenden Nieselregen hoch.*" },
    },
    NightElf = {
        PET = { "Elune lehrte uns, auch den kleinsten Gefährten zu achten.", "*streicht schweigend über das Fell des Begleiters.*" },
        CAMP = { "Unter diesen Bäumen ist kein Feuer je wirklich allein.", "*legt einen gefallenen Zweig behutsam zum Lagerfeuer.*" },
        TRACKING = { "Die Wurzeln tragen Erinnerung. Schau auf die Erde.", "*liest Spuren im Schatten uralter Bäume.*" },
        WATCH = { "Die Nacht gehört nicht uns. Wir sind hier nur Gäste.", "*lauscht den Eulenrufen jenseits des Lagers.*" },
        WEATHER = { "Der Regen klingt auf jedem Blatt anders.", "*hebt das Gesicht in das kühle Mondlicht.*" },
    },
    Orc = {
        PET = { "Ein treues Tier verdient Fleisch, nicht leere Versprechen.", "*teilt die letzte Fleischration ohne zu zögern.*" },
        CAMP = { "Ein gutes Feuer wärmt selbst den stolzesten Krieger.", "*legt die Axt neben den Schlafplatz, griffbereit, aber sicher.*" },
        TRACKING = { "Die Spur ist tief. Unser Gegner ist wohl nicht leicht.", "*untersucht einen Abdruck mit der Klinge eines Messers.*" },
        WATCH = { "Ich wache. Die Ahnen werden mich schon wecken, wenn ich nicke.", "*prüft die Umgebung mit der Geduld eines erfahrenen Kriegers.*" },
        WEATHER = { "Ein Sturm macht die Entscheidung nur ehrlicher.", "*stellt sich gegen den Wind und lacht kurz.*" },
    },
    Tauren = {
        PET = { "Ein Gefährte teilt unsere Wege und unser Brot.", "*kniet nieder und lässt das Tier ruhig trinken.*" },
        CAMP = { "Die Flamme ist klein. Die Erinnerung an Zuhause bleibt groß.", "*legt sorgsam getrocknete Kräuter neben das Feuer.*" },
        TRACKING = { "Die Erde spricht zu jenen, die langsam gehen.", "*legt die Handfläche auf eine frische Spur.*" },
        WATCH = { "Die Erdenmutter ruht niemals. Heute folge ich ihrem Beispiel.", "*bleibt reglos am Rand des Lagers stehen.*" },
        WEATHER = { "Das Gras neigt sich, bevor die Wolken kommen.", "*riecht den nahenden Regen über den Ebenen.*" },
    },
    Troll = {
        PET = { "Heh, du hast schon wieder meine Vorräte gefunden, mon.", "*teilt grinsend einen Happen mit seinem Tier.*" },
        CAMP = { "Die Loa mögen ein warmes Feuer. Und Geschichten noch mehr.", "*schüttelt eine Prise Kräuter ins Lagerfeuer.*" },
        TRACKING = { "Da, mon! Die Fährte ist frisch und der Weg lustig.", "*betrachtet einen zerdrückten Grashalm mit großem Grinsen.*" },
        WATCH = { "Wer heut Nacht heimlich schleicht, trifft erst mich. Hehe.", "*legt den Speer quer über die Knie und lauscht.*" },
        WEATHER = { "Der Regen trommelt. Vielleicht tanzen die Loa.", "*klopft im Takt der Tropfen gegen einen Holzbecher.*" },
    },
    SkyborneHighOrder = {
        PET = { "Die Jagd beginnt mit Achtung vor einem anderen Willen.", "*bürstet Staub aus dem Gefieder des Begleiters.*" },
        CAMP = { "Ein ordentliches Lager lässt Raum für Gedanken.", "*ordnet die Ausrüstung in sorgfältig gleichen Abständen.*" },
        TRACKING = { "Im Muster der Spuren liegt eine verborgene Ordnung.", "*zeichnet eine feine Linie neben die Fußabdrücke.*" },
        WATCH = { "Wachsamkeit ist keine Unruhe, sondern eine Kunst.", "*beobachtet schweigend die Grenzen des Lagers.*" },
        WEATHER = { "Der Wind wechselt nach einem Muster. Ich erkenne es.", "*prüft mit einer Fingerspitze die Richtung der Böen.*" },
    },
    SkyborneWindshaper = {
        PET = { "Niemand hält einen freien Gefährten mit einer Kette.", "*lässt das Tier spielerisch dem Wind nachlaufen.*" },
        CAMP = { "Ein Lager ist dort, wo der Wind unsere Geschichten hört.", "*bindet die Zeltleinen so, dass die Brise hindurchstreicht.*" },
        TRACKING = { "Diese Spur springt wie ein Luftwirbel über den Sand.", "*folgt den Verwehungen bis zum Rand des Weges.*" },
        WATCH = { "Die Nacht bewegt sich. Ich bewege mich mit ihr.", "*nimmt einen Wachposten am windoffenen Hang ein.*" },
        WEATHER = { "Ein starker Wind bedeutet manchmal einen guten Aufbruch.", "*breitet die Arme aus und fühlt die Strömung.*" },
    },
    Skyborne = {
        PET = { "Mein Gefährte kennt die Wege über den Wolken.", "*streicht dem Tier über das Fell und blickt zum Himmel.*" },
        CAMP = { "Wo der Wind zur Ruhe kommt, kann auch ich rasten.", "*spannt das Lagerdach sorgfältig zwischen zwei Bäumen.*" },
        TRACKING = { "Die Spur führt dahin, wo die Luft frischer wird.", "*untersucht den Staub am Rand eines windigen Pfads.*" },
        WATCH = { "Ich höre die Nacht auch ohne ein Lagerhorn.", "*schaut zu den Sternen und prüft die Umgebung.*" },
        WEATHER = { "Der Himmel verändert sich schneller als jede Landkarte.", "*lauscht dem Rauschen der höheren Äste.*" },
    },
}
