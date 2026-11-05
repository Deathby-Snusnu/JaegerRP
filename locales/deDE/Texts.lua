-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

-- RP-Konvention:
-- Gesprochene Texte stehen ohne Markierung und nutzen den eingestellten Sprachkanal (Standard: /say).
-- Beschreibende Handlungen stehen zwischen *Sternchen* und werden immer als /me ausgegeben.
-- Der Handler entfernt die Sternchen vor der Ausgabe.

addon.localeData.deDE.texts = {
    HUNTERS_MARK = {
        ziel = {
            "Ich habe Euch im Blick, %s. Jetzt verliert Ihr mich nicht mehr.",
            "Mein Zeichen liegt auf Euch, %s. Die Jagd beginnt.",
            "*behaelt %s fest im Blick.*",
            "Ihr seid markiert, %s. Jede Bewegung verraet Euch.",
            "Lauft ruhig, %s. Ich weiss jetzt, wonach ich suchen muss.",
            "*praegt sich Haltung und Bewegung von %s aufmerksam ein.*",
        },
        gruppe = {
            "Das Zeichen sitzt. Jetzt wissen wir, wohin wir zielen.",
            "Augen offen. Unsere Beute ist markiert.",
            "Die Spur ist klar. Bleibt aufmerksam.",
            "*gibt den Gefaehrten mit einem knappen Zeichen die Richtung des markierten Ziels an.*",
        },
    },

    ARCANE_SHOT = {
        ziel = {
            "Arkanes Feuer findet Euch, %s.",
            "*legt auf %s an; arkane Energie sammelt sich am Geschoss.*",
            "Dieser Schuss hat etwas mehr Biss, %s.",
            "Ihr koennt dem Schuss ausweichen, %s. Der Magie wird das schwerer fallen.",
            "*feuert auf %s; arkane Energie flackert um das Geschoss.*",
        },
        gruppe = {
            "*feuert einen arkan aufgeladenen Schuss ab, der die Luft durchschneidet.*",
            "Arkane Ladung sitzt. Schuss frei.",
            "*laesst ein Geschoss los, das fuer einen Augenblick in arkanem Licht schimmert.*",
        },
    },

    AIMED_SHOT = {
        ziel = {
            "Stillhalten, %s. Das macht es fuer uns beide einfacher.",
            "Ein Atemzug. Ein Ziel. Ein Schuss, %s.",
            "*nimmt %s ruhig ins Visier und korrigiert kaum merklich die Haltung.*",
            "Nicht bewegen, %s. Ich habe genau einen guten Winkel.",
            "Ruhige Hand, klare Sicht. Jetzt seid Ihr dran, %s.",
            "Manchmal braucht ein guter Schuss nur etwas Zeit, %s.",
        },
        gruppe = {
            "*haelt den Atem an und nimmt sorgfaeltig Mass.*",
            "*sucht mit ruhigem Blick geduldig nach der kleinsten Luecke.*",
            "*legt sorgfaeltig an und wartet auf den richtigen Augenblick.*",
            "Ich habe einen Winkel. Nicht bewegen.",
        },
    },

    MULTI_SHOT = {
        ziel = {
            "Einer reicht heute nicht, %s.",
            "*reisst die Waffe herum und erfasst neben %s weitere Ziele.*",
            "Deckung waere jetzt keine schlechte Idee, %s.",
            "Ein Ziel, mehrere Antworten, %s.",
            "Passt auf, %s. Ihr seid nicht allein in meiner Schusslinie.",
        },
        gruppe = {
            "*feuert mehrere Geschosse nahezu gleichzeitig ab.*",
            "*laesst mehrere Schuesse in die gegnerischen Reihen schlagen.*",
            "*richtet seine Waffe in schneller Folge auf mehrere Ziele.*",
            "Mehrere Ziele. Ein Augenblick. Los.",
        },
    },

    STEADY_SHOT = {
        ziel = {
            "Ruhig bleiben. Ruhig zielen. Treffen, %s.",
            "Kein Kunststueck, %s. Nur eine ruhige Hand.",
            "Ein sauberer Schuss braucht keine Eile, %s.",
            "Ihr gebt mir genug Zeit fuer einen ordentlichen Treffer, %s.",
            "*legt erneut auf %s an und haelt die Waffe vollkommen ruhig.*",
        },
        gruppe = {
            "*atmet ruhig aus und legt erneut an.*",
            "Ruhig bleiben. Der naechste sitzt.",
            "Keine Hast, nur saubere Schuesse.",
            "*bleibt in seinen Bewegungen ruhig und praezise.*",
        },
    },

    KILL_COMMAND = {
        ziel = {
            "Jetzt! Auf %s!",
            "Fass! Auf %s!",
            "Ein kurzer Ruf genuegt. Mein Begleiter kennt seine Aufgabe, %s.",
            "Los! %s ist dein Ziel.",
            "*gibt seinem Begleiter ein knappes Handzeichen in Richtung von %s.*",
            "*wechselt einen kurzen Blick mit seinem Begleiter und deutet auf %s.*",
        },
        gruppe = {
            "*schickt seinen Begleiter mit einem scharfen Kommando nach vorn.*",
            "Los! Jetzt!",
            "Fass!",
            "*gibt ein knappes Zeichen, und sein Begleiter stuermt los.*",
        },
    },

    MEND_PET = {
        ziel = {
            "Ruhig, alter Freund. Ich kuemmere mich darum.",
            "Komm her. Das sieht schlimmer aus, als es ist.",
            "Stillhalten. Danach kannst du wieder loslegen.",
            "*kniet sich zu seinem Begleiter und untersucht vorsichtig dessen Verletzungen.*",
            "Keine Sorge. Wir sind noch lange nicht fertig.",
            "*nimmt Verbandszeug hervor und beginnt, die Wunden seines Begleiters zu versorgen.*",
        },
        gruppe = {
            "*kniet sich zu seinem verwundeten Begleiter und versorgt dessen Wunden.*",
            "Komm her, alter Freund. Lass mich das ansehen.",
            "Ganz ruhig. Gleich ist es besser.",
            "*versorgt sorgfaeltig die Wunden seines treuen Gefaehrten.*",
        },
    },

    REVIVE_PET = {
        ziel = {
            "Komm zurueck, alter Freund. Unsere Jagd ist nicht vorbei.",
            "Aufstehen. Wir haben noch einen langen Weg vor uns.",
            "Nicht jetzt. Nicht hier. Komm zurueck zu mir.",
            "*legt eine Hand an seinen Begleiter und sucht angespannt nach einem Lebenszeichen.*",
            "Komm schon. Das Lager waere ohne dich viel zu ruhig.",
            "*beugt sich dicht zu seinem Begleiter und spricht leise auf ihn ein.*",
        },
        gruppe = {
            "*kniet neben seinem Begleiter nieder und weicht nicht von dessen Seite.*",
            "*versucht mit ruhiger Stimme und vertrauten Beruehrungen, seinen Gefaehrten zurueckzurufen.*",
            "*legt eine Hand an die Seite seines Begleiters und wartet auf ein Lebenszeichen.*",
            "Komm schon. Ich gehe hier nicht ohne dich weg.",
        },
    },

    FEED_PET = {
        ziel = {
            "Hier. Das hast du dir verdient.",
            "*kramt eine Portion Futter hervor und haelt sie seinem Begleiter hin.*",
            "Langsam. Es gibt genug fuer uns beide.",
            "Du hast gearbeitet. Jetzt iss.",
            "Ja, ja. Ich weiss. Du hattest schon vor fuenf Minuten Hunger.",
            "*teilt einen weiteren Bissen ab und reicht ihn mit einem ergebenen Seufzen weiter.*",
        },
        gruppe = {
            "*reicht seinem Begleiter einen wohlverdienten Happen.*",
            "Du bekommst deinen Anteil. Wie immer.",
            "*sieht zufrieden zu, wie sein Begleiter sich ueber seine Ration hermacht.*",
            "Langsam. Niemand nimmt es dir weg.",
        },
    },

    TAMING = {
        ziel = {
            "Ruhig, %s. Ich will Euch nichts tun.",
            "Langsam, %s. Kein Grund fuer Zaehne oder Klauen.",
            "*senkt die Waffe deutlich sichtbar und haelt Abstand zu %s.*",
            "Vertrauen laesst sich nicht erzwingen, %s.",
            "Nur ruhig, %s. Wir muessen uns erst kennenlernen.",
            "*streckt %s langsam eine offene Hand entgegen.*",
        },
        gruppe = {
            "*senkt die Waffe und naehert sich mit langsamen Schritten.*",
            "*naehert sich mit ruhiger Stimme und langsamen Schritten, ohne eine ploetzliche Bewegung zu machen.*",
            "*bleibt stehen und wartet, bis das Tier selbst den naechsten Schritt macht.*",
            "Ganz ruhig. Du entscheidest, wie nah ich kommen darf.",
        },
    },

    TRAP = {
        ziel = {
            "Achtet auf den Boden, %s. Zu spaet.",
            "Ein Schritt noch, %s. Genau dahin.",
            "Ihr schaut zu viel auf mich und zu wenig auf Eure Fuesse, %s.",
            "Nicht jede Gefahr steht vor Euch, %s.",
            "*wirft einen kurzen Blick auf die sorgfaeltig verborgene Falle nahe %s.*",
            "*weicht einige Schritte zurueck und ueberlaesst der Falle den Rest.*",
        },
        gruppe = {
            "*verbirgt eine Falle sorgfaeltig im Gelaende und zieht sich zurueck.*",
            "*laesst einen unscheinbaren Mechanismus zwischen Erde, Gras und Laub verschwinden.*",
            "Jetzt fehlt nur noch jemand, der hineintritt.",
            "*tarnt die Falle so sorgfaeltig, dass am Boden kaum etwas darauf hindeutet.*",
        },
    },

    FLARE = {
        ziel = {
            "Verstecken koennt Ihr Euch woanders, %s.",
            "Das Licht findet Euch, %s.",
            "Schatten helfen Euch jetzt nicht mehr, %s.",
            "*hebt die Waffe und schickt ein Leuchtgeschoss in Richtung von %s.*",
            "Genug Versteckspiel, %s.",
            "*kneift die Augen zusammen, waehrend grelles Licht die Umgebung von %s ausleuchtet.*",
        },
        gruppe = {
            "*feuert ein helles Leuchtfeuer ab, das die Umgebung aus dem Schatten reisst.*",
            "*taucht die Umgebung in helles Licht und legt Verstecke und Bewegungen offen.*",
            "Mal sehen, wer sich dort versteckt.",
            "*erhellt das Gelaende mit einem grellen Lichtschein.*",
        },
    },

    ASPECT_HAWK = {
        ziel = {
            "*mustert %s mit schaerfer werdendem Blick.*",
            "Aus der Entfernung seid Ihr leichter zu lesen, %s.",
            "Der Falke leiht mir seine Schaerfe, %s.",
            "*fixiert %s mit der Wachsamkeit eines kreisenden Falken.*",
            "*richtet den Blick ueber %s hinaus aufmerksam in die Ferne.*",
        },
        gruppe = {
            "*richtet sich auf; sein Blick wird ploetzlich scharf und aufmerksam.*",
            "*laesst seinen Blick scharf und ruhig werden.*",
            "Augen offen. Der Falke sieht zuerst.",
            "*richtet seine Aufmerksamkeit ganz auf die Ferne.*",
        },
    },

    ASPECT_CHEETAH = {
        ziel = {
            "Wenn Ihr mich einholen wollt, %s, muesst Ihr Euch mehr anstrengen.",
            "Der Gepard kennt keinen Grund zu warten, %s.",
            "Ihr duerft gern versuchen mitzuhalten, %s.",
            "*verlagert das Gewicht nach vorn und macht sich bereit, an %s vorbeizuziehen.*",
            "*zieht mit federnden Schritten an %s vorbei.*",
        },
        gruppe = {
            "*verlagert sein Gewicht nach vorn und setzt sich mit federnden Schritten in Bewegung.*",
            "*setzt sich mit leichten und schnellen Schritten in Bewegung.*",
            "*beschleunigt deutlich und gewinnt rasch an Boden.*",
            "Wer mithalten will, sollte jetzt laufen.",
        },
    },

    ASPECT_MONKEY = {
        ziel = {
            "Ihr muesst schon besser zielen, %s.",
            "Knapp daneben, %s.",
            "*weicht vor %s mit einer schnellen, kaum vorhersehbaren Bewegung aus.*",
            "Treffen duerft Ihr mich gern versuchen, %s.",
            "*bleibt vor %s staendig in Bewegung und bietet kaum eine ruhige Zielflaeche.*",
        },
        gruppe = {
            "*lockert seine Haltung und beginnt sich unberechenbarer zu bewegen.*",
            "*bewegt sich flink und schwer vorhersehbar.*",
            "*weicht mit einer schnellen, instinktiven Bewegung aus.*",
            "Stillstehen waere jetzt ungesund.",
        },
    },

    RAPID_FIRE = {
        ziel = {
            "Jetzt wird es schnell, %s.",
            "Versucht mitzuzaehlen, %s.",
            "Ein einzelner Schuss waere unhoeflich wenig, %s.",
            "Ich hoffe, Ihr habt eine gute Deckung, %s.",
            "*setzt gegen %s Schuss um Schuss in schneller Folge.*",
            "*haelt %s mit einer dichten Folge von Schuessen unter Druck.*",
        },
        gruppe = {
            "*setzt Schuss um Schuss in rascher Folge.*",
            "*feuert einen schnellen Schuss nach dem naechsten ab.*",
            "Jetzt nicht nachlassen!",
            "*feuert Geschosse in dichter Folge ab.*",
        },
    },

    DISENGAGE = {
        ziel = {
            "Zu nah, %s.",
            "Ein Jaeger waehlt seine Entfernung selbst, %s.",
            "Nein, %s. So nah wollte ich Euch nicht haben.",
            "Etwas Abstand steht uns beiden besser, %s.",
            "*stoesst sich von %s ab und springt rueckwaerts aus der Reichweite.*",
            "Distanz ist keine Feigheit, %s. Sie ist Berufserfahrung.",
        },
        gruppe = {
            "*springt zurueck und schafft sich Raum.*",
            "*loest sich mit einem schnellen Satz aus dem Nahkampf.*",
            "So. Der Abstand stimmt wieder.",
            "*bringt sich zurueck in seine bevorzugte Distanz.*",
        },
    },

    MELEE = {
        ziel = {
            "Dann eben aus der Naehe, %s.",
            "Die Fernwaffe ist nicht meine einzige Antwort, %s.",
            "Zu nah fuer einen sauberen Schuss, aber nicht fuer Stahl, %s.",
            "Ihr wolltet Nahkampf, %s. Bitte sehr.",
            "*senkt vor %s die Fernwaffe und greift zur Nahkampfwaffe.*",
            "*stellt sich %s mit gezogener Nahkampfwaffe entgegen.*",
        },
        gruppe = {
            "*greift zur Nahkampfwaffe.*",
            "*senkt die Fernwaffe und greift zur Nahkampfwaffe.*",
            "Dann eben auf Armeslaenge.",
            "*wechselt in den Nahkampf, als der Abstand zum Gegner zusammenbricht.*",
        },
    },

    RAPTOR_STRIKE = {
        ziel = {
            "Ihr seid mir zu nahe gekommen, %s. Schlechte Entscheidung.",
            "*wechselt die Haltung und führt einen entschlossenen Nahkampfhieb gegen %s aus.*",
            "Ein Jäger trifft auch ohne Abstand, %s.",
            "*fängt die Bewegung von %s mit der Nahkampfwaffe ab und setzt zum Gegenhieb an.*",
        },
        gruppe = {
            "Ein guter Jäger weiß, wann er die Distanz aufgeben muss.",
            "*greift zur Nahkampfwaffe und geht in eine stabile Kampfhaltung.*",
            "Die Jagd hört nicht an der Reichweite der Fernwaffe auf.",
            "*verlagert das Gewicht nach vorn und setzt zu einem wuchtigen Hieb an.*",
        },
    },

    TRACKING = {
        ziel = {
            "Ihr wart hier, %s. Und nicht besonders vorsichtig.",
            "Die Spur ist frisch, %s.",
            "*geht in die Hocke und prueft die Spuren, die %s hinterlassen hat.*",
            "*streicht ueber einen frischen Abdruck und blickt in Richtung von %s.*",
            "Ihr hinterlasst mehr Hinweise, als Euch lieb sein duerfte, %s.",
            "Lauft ruhig weiter, %s. Die Spur bleibt.",
        },
        gruppe = {
            "*prueft Boden, Zweige und Wind nach frischen Zeichen.*",
            "Da. Die Faehrte wird klar.",
            "*folgt aufmerksam Zeichen, die anderen leicht entgehen.*",
            "*setzt Abdruecke, Geruch und gebrochene Zweige zu einer klaren Faehrte zusammen.*",
        },
    },

    CAMOUFLAGE = {
        ziel = {
            "Seht genau hin. Gleich bin ich weg.",
            "Die beste Deckung ist die, die Ihr nicht bemerkt.",
            "Ihr koennt nur treffen, was Ihr noch seht.",
            "*zieht sich lautlos in Deckung zurueck.*",
            "*passt Haltung und Bewegung der Umgebung an und verschwindet beinahe darin.*",
        },
        gruppe = {
            "*verschmilzt mit Deckung und Umgebung.*",
            "*laesst seine Konturen zwischen Schatten, Laub und Boden verschwimmen.*",
            "Nicht bewegen. Nicht auffallen. Einfach verschwinden.",
            "*verschwindet so gruendlich in der Umgebung, dass nur eine kaum sichtbare Bewegung im Unterholz bleibt.*",
        },
    },

    VICTORY = {
        ziel = {
            "Die Jagd ist vorbei, %s. Ruht nun.",
            "Gute Faehrte, %s. Schlechtes Ende.",
            "Ihr wart schnelle Beute, %s. Nur nicht schnell genug.",
            "*senkt nach dem letzten Treffer langsam die Waffe und betrachtet %s.*",
            "Die Spur endet hier, %s.",
            "*senkt vor %s langsam die Waffe.*",
        },
        gruppe = {
            "*senkt nach Ende der Jagd langsam die Waffe.*",
            "Die Faehrte endet hier.",
            "Vorbei. Jetzt erst durchatmen.",
            "*prueft erst die Umgebung, bevor er die Waffe senkt.*",
            "*bestaetigt mit einem pruefenden Blick, dass keine Nachsuche noetig ist.*",
            "*atmet erst langsam aus, als alles still bleibt.*",
        },
    },

    -- World of Warcraft Forever: zusätzliche Fähigkeiten mit eigenem Textvorrat
    TAME_BEAST = { gruppe = { "Keine Fessel hält so fest wie erworbenes Vertrauen.", "Geduld, ruhige Stimme und ein offenes Stück Handfläche.", "*kniet sich hin und hält vorsichtig Abstand.*", "*wartet reglos, bis das Tier von selbst näherkommt.*" }, ziel = { "Ich will Euch nicht brechen, %s. Ich will Euch verstehen." }, },
    CALL_PET = { gruppe = { "Wir haben Arbeit, alter Freund. Und danach eine ordentliche Mahlzeit.", "Ein Pfiff genügt. Manche Freundschaften brauchen keine langen Reden.", "*stößt einen vertrauten, kurzen Lockpfiff aus.*", "*sucht zwischen den Bäumen nach einer vertrauten Silhouette.*" }, },
    DISMISS_PET = { gruppe = { "Ruh dich aus, Gefährte. Ich halte die Wache.", "Auch ein treuer Jäger braucht einen Platz abseits des Lärms.", "*streicht dem Tier über den Nacken und gibt ein leises Zeichen.*", "*wartet, bis der Begleiter sicher im Unterholz verschwunden ist.*" }, ziel = { "Bis später, %s. Lass mir etwas vom Proviant übrig." }, },
    EAGLE_EYE = { gruppe = { "Die Augen reisen weiter, als die Füße jemals könnten.", "Erst die Lage verstehen, dann den Weg wählen.", "*schließt ein Auge und sucht die Ferne nach Bewegung ab.*", "*legt zwei Finger an die Braue, als sähe er über den Horizont hinaus.*" }, },
    EYES_OF_THE_BEAST = { gruppe = { "Zwei Augenpaare. Ein Gedanke. Und ganz andere Ohren.", "Die Welt riecht völlig anders, wenn man auf vier Pfoten unterwegs ist.", "*hält inne und konzentriert sich auf die Sinne seines Gefährten.*", "*verfolgt aufmerksam Geräusche, die kein Mensch gehört hätte.*" }, ziel = { "Zeig mir die Welt mit deinen Augen, %s." }, },
    SCARE_BEAST = { gruppe = { "Auch die größten Reißzähne kennen den Geschmack der Angst.", "Manchmal genügt ein einziger Ruf, um einen Kampf zu vermeiden.", "*richtet sich groß auf und stößt einen gellenden Warnlaut aus.*", "*schlägt mit dem Waffenknauf gegen den Schildrand und hält die Position.*" }, ziel = { "Zurück, %s! Nicht jede Beute lässt sich beißen." }, },
    BEAST_LORE = { gruppe = { "Zähne, Haltung, Fell und Gang verraten mehr als ein Steckbrief.", "Beobachten ist eine Kunst. Überleben ebenso.", "*mustert Bewegungen und Ohrenstellung des Tieres.*", "*macht sich leise eine Notiz über Fährte und Verhalten.*" }, ziel = { "Ein prächtiges Tier, %s. Und offenbar nicht ohne Geheimnisse." }, },
    SUMMON_HAWK = { gruppe = { "Der Himmel ist groß genug für zwei Jäger.", "Wer die Beute aus der Luft findet, muss weniger Umwege laufen.", "*streckt den Arm aus und lockt einen Greifvogel herab.*", "*lässt den Blick dem kreisenden Vogel nach oben folgen.*" }, },
    ASPECT_BEAST = { gruppe = { "Heute verrät mich kein unnötiger Schritt.", "Wer Wildnis verstehen will, muss für einen Augenblick selbst Teil von ihr werden.", "*bewegt sich geschmeidig und möglichst geräuschlos.*", "*prüft die Windrichtung und senkt den Schwerpunkt.*" }, },
    ASPECT_PACK = { gruppe = { "Zusammen sind wir schneller. Zusammen kommen wir zurück.", "Ein guter Weg wird leichter, wenn alle denselben Takt finden.", "*gibt der Gruppe ein Zeichen zum Aufbruch.*", "*nimmt das Tempo der Gefährten auf und hält es beständig.*" }, },
    ASPECT_WILD = { gruppe = { "Der Wind trägt mehr als Kälte. Man muss nur lernen, ihm zuzuhören.", "Das Dickicht kennt Gefahren, vor denen Stahl nicht schützt.", "*streicht mit der Hand über Moos und Blätter.*", "*atmet langsam die feuchte Luft des Waldes ein.*" }, },
    TRANQUILIZING_SHOT = { gruppe = { "Ein wütender Gegner trifft schlechter, wenn er wieder klar denkt.", "Der stärkste Schuss ist manchmal der, der einen Rausch beendet.", "*prüft die besondere Munition und hebt die Fernwaffe ruhig an.*", "*nimmt sich für einen gezielten, besänftigenden Treffer Zeit.*" }, ziel = { "Genug Raserei, %s. Jetzt wird wieder gedacht." }, },
    INTIMIDATION = { gruppe = { "Mein Gefährte lässt sich nicht so leicht beeindrucken wie Ihr.", "Ein Knurren kann deutlicher sein als eine Predigt.", "*gibt dem Begleiter ein knappes Angriffssignal.*", "*tritt zur Seite und lässt dem Tier Raum für seinen Vorstoß.*" }, ziel = { "Seht meinem Freund in die Augen, %s. Dann überlegt noch einmal." }, },
    BESTIAL_WRATH = { gruppe = { "Wir haben einander gefunden. Jetzt kämpfen wir Seite an Seite.", "Zorn lässt sich nicht zähmen, nur in die richtige Richtung lenken.", "*legt dem Begleiter kurz die Hand an die Flanke.*", "*lässt dem Tier mit einem scharfen Ruf freie Bahn.*" }, ziel = { "Zeig ihnen, wie viel Mut in dir steckt, %s!" }, },
    AUTO_SHOT = { gruppe = { "Ein guter Schütze findet seinen Rhythmus.", "Nicht jeder Treffer braucht eine Ansage. Manche brauchen nur Ruhe.", "*legt wieder und wieder sauber an.*", "*hält die Atmung ruhig und führt die Fernwaffe nach.*" }, ziel = { "Bleibt ruhig stehen, %s. Das erleichtert die Arbeit." }, },
    SERPENT_STING = { gruppe = { "Die Schlange muss nicht zweimal beißen.", "Geduld ist die schärfste Spitze im Köcher.", "*prüft die Spitze eines vergifteten Geschosses.*", "*lässt ein präpariertes Geschoss in die Führung gleiten.*" }, ziel = { "Die Natur hat ein Geschenk für Euch, %s. Es wirkt verzögert." }, },
    CONCUSSIVE_SHOT = { gruppe = { "Eile ist kein Ersatz für einen guten Fluchtweg.", "Wer stolpert, kann keine Verfolgung gewinnen.", "*zielt bewusst auf den Laufweg statt auf den Oberkörper.*", "*gibt einen kurzen Schuss ab und beobachtet die Bewegung.*" }, ziel = { "Nicht so schnell, %s. Wir haben noch etwas zu klären." }, },
    DISTRACTING_SHOT = { gruppe = { "Hierher! Wer Ärger sucht, soll mich ansehen.", "Man kann eine Schlacht verändern, ohne ihren Sieger schon zu kennen.", "*tritt sichtbar aus der Deckung und gibt einen lauten Schuss ab.*", "*lenkt die Aufmerksamkeit mit einer gezielten Bewegung auf sich.*" }, ziel = { "Hier bin ich, %s. Eure Rechnung geht an mich." }, },
    SCORPID_STING = { gruppe = { "Der Skorpion fragt nicht, wie groß seine Beute ist.", "Ein kleiner Stich kann eine große Kraft zunichtemachen.", "*zieht eine fein präparierte Spitze aus dem Köcher.*", "*beobachtet sorgfältig die Wirkung einer schwächenden Wunde.*" }, ziel = { "Kraft allein wird Euch nicht helfen, %s." }, },
    TRUESHOT_AURA = { gruppe = { "Ruhige Atmung. Gleiche Entfernung. Ein gemeinsamer Augenblick.", "Wir zielen getrennt, aber wir halten zusammen.", "*gibt den Schützen ein kurzes Zeichen und prüft die Stellung.*", "*verlagert das Gewicht in eine sichere Schusshaltung.*" }, },
    VIPER_STING = { gruppe = { "Mancher Zauber versiegt, bevor das letzte Wort gesprochen ist.", "Die Viper sucht nicht nach Blut, sondern nach Kraft.", "*prüft eine blass schimmernde Pfeilspitze.*", "*späht auf die Hände des gegnerischen Zauberwirkers.*" }, ziel = { "Eure Macht wird dünner, %s. Spürt Ihr das?" }, },
    SNIPER_SHOT = { gruppe = { "Ein Atemzug. Eine Entscheidung. Ein langer Weg bis zum Ziel.", "Wer aus der Ferne trifft, muss näher hinsehen als jeder andere.", "*verlangsamt den Atem und richtet die Fernwaffe sorgfältig aus.*", "*liegt reglos in der Deckung und wartet auf den richtigen Augenblick.*" }, ziel = { "Seht nicht nach mir, %s. Das wäre längst zu spät." }, },
    VOLLEY = { gruppe = { "Der Himmel wird für einen Moment sehr ungemütlich.", "Ich empfehle, nicht dort stehen zu bleiben, wo es gleich regnet.", "*markiert ein Stück Gelände und hebt die Fernwaffe an.*", "*lässt eine Folge von Geschossen über dem Kampfplatz niedergehen.*" }, },
    SCATTER_SHOT = { gruppe = { "Ein Augenblick Verwirrung reicht vollkommen.", "Nicht jeder Schuss will verwunden. Manche wollen nur Zeit gewinnen.", "*reißt die Fernwaffe herum und schießt aus kurzer Distanz.*", "*nutzt den kurzen Schrecken, um die Stellung zu verändern.*" }, ziel = { "Jetzt erst einmal die Orientierung wiederfinden, %s!" }, },
    TRACK_BEASTS = { gruppe = { "Eine frische Fährte spricht lauter als ein Jagdhorn.", "Krallenabdruck, Fellbüschel, aufgewühlte Erde. Die Geschichte steht hier.", "*vergleicht Trittsiegel mit den Abständen der Pfoten.*", "*kniet am Pfad und fährt vorsichtig über frische Spuren.*" }, },
    TRACK_HUMANOIDS = { gruppe = { "Wer auf zwei Beinen geht, vergisst oft, wie viel er hinterlässt.", "Stiefelsohlen erzählen ihre eigenen Geschichten.", "*prüft abgebrochene Zweige in Schulterhöhe.*", "*liest eine hastige Schrittfolge im weichen Boden.*" }, },
    WING_CLIP = { gruppe = { "Wer mir folgen will, braucht zuerst bessere Beine.", "Ein Schnitt an der richtigen Stelle beendet die wilde Verfolgung.", "*duckt sich unter einem Angriff und führt einen niedrigen Hieb.*", "*tritt seitwärts und versucht, dem Gegner den Laufweg zu nehmen.*" }, ziel = { "Langsam, %s. Ihr bleibt noch ein bisschen." }, },
    IMMOLATION_TRAP = { gruppe = { "Eine unsichtbare Grenze kann sehr warm werden.", "Wer jeden Weg für sicher hält, lernt selten dazu.", "*tarnt eine Brandfalle zwischen Erde und Steinchen.*", "*prüft den Auslöser und tritt sorgfältig zurück.*" }, },
    MONGOOSE_BITE = { gruppe = { "Ein guter Ausweichschritt ist die halbe Antwort.", "Der Mungo wartet, bis der Fehler gemacht ist.", "*weicht knapp aus und setzt zum schnellen Gegenhieb an.*", "*dreht die Schulter weg und stößt blitzschnell zurück.*" }, ziel = { "Euer Schwung gehört jetzt mir, %s." }, },
    TRACK_UNDEAD = { gruppe = { "Manche Spuren riechen nach nichts Lebendigem.", "Die Toten gehen selten vorsichtig durch die Welt.", "*prüft kalte Erde und unnatürlich stille Stellen.*", "*hält den Atem an und lauscht einer gespenstischen Bewegung.*" }, },
    FREEZING_TRAP = { gruppe = { "Ein wenig Ruhe kann einem Kampf nur guttun.", "Wer zu hastig läuft, landet manchmal auf Eis.", "*versteckt eine frostige Falle unter einer dünnen Erdschicht.*", "*prüft, ob niemand aus der eigenen Gruppe den Auslöser berührt.*" }, },
    TRACK_HIDDEN = { gruppe = { "Nicht alles Unsichtbare ist auch unhörbar.", "Der Wind verrät, wo kein Wind sein sollte.", "*lauscht auf das leiseste Rascheln außerhalb des Blickfelds.*", "*untersucht Schatten und Boden nach einer unpassenden Bewegung.*" }, },
    COUNTERATTACK = { gruppe = { "Vielen Dank für die Lücke in Eurer Verteidigung.", "Ein Angriff kann eine Einladung sein. Ich nehme sie an.", "*fängt den Schlag ab und führt die Waffe sofort zurück.*", "*lässt den Gegner ins Leere laufen und setzt einen Gegenstoß.*" }, ziel = { "Eure Gelegenheit ist vorbei, %s. Jetzt bin ich dran." }, },
    TRACK_ELEMENTALS = { gruppe = { "Wo die Elemente tanzen, bleibt kein Boden unberührt.", "Asche, Reif und seltsamer Wind weisen den Weg.", "*streicht mit den Fingern über eine ungewöhnlich warme Steinfläche.*", "*prüft eine Spur aus Frost und knisternder Luft.*" }, },
    FROST_TRAP = { gruppe = { "Nicht jeder Weg führt heute schnell ans Ziel.", "Ein Schritt, ein Frosthauch und plötzlich wird die Jagd gemütlicher.", "*streut unauffällig den Auslöser einer Kältefalle aus.*", "*zeichnet sich den sicheren Pfad um die Falle im Gedächtnis ein.*" }, },
    FEIGN_DEATH = { gruppe = { "Totgestellt zu sein ist eine Fähigkeit. Nicht darüber zu lachen auch.", "Ein kluger Jäger muss nicht jede Schlacht im Stehen gewinnen.", "*sinkt mit übertriebener Endgültigkeit zu Boden.*", "*hält selbst das Augenlid still, bis die Gefahr vorüberzieht.*" }, },
    LACERATE = { gruppe = { "Eine Wunde ist keine Ansprache. Aber sie wird verstanden.", "Wer zu nah kommt, lernt die Kante meines Stahls kennen.", "*führt einen harten Schnitt und zieht die Waffe rasch zurück.*", "*wechselt in eine tiefe Haltung für einen kurzen Nahkampfhieb.*" }, ziel = { "Das war ein teurer Schritt, %s." }, },
    TRACK_DEMONS = { gruppe = { "Schwefel und Stille. Selten eine gute Kombination.", "Diese Fährte gehört keiner gewöhnlichen Bestie.", "*untersucht versengte Zeichen im Erdreich.*", "*mustert misstrauisch eine Spur, die gegen den Wind führt.*" }, },
    EXPLOSIVE_TRAP = { gruppe = { "Manchmal beantwortet Feuer eine Frage zu deutlich.", "Dieser Pfad wird gleich kürzer. Für irgendjemanden.", "*vergräbt eine Sprengfalle und prüft den Sicherheitsabstand.*", "*tritt vorsichtig hinter einen Felsen zurück.*" }, },
    TRACK_GIANTS = { gruppe = { "Große Füße sind eine schlechte Tarnung.", "Wo Bäume brechen, muss man keine kleinen Spuren suchen.", "*legt die Hand in einen gewaltigen Fußabdruck.*", "*blickt eine Reihe entwurzelter Bäume entlang.*" }, },
    TRACK_DRAGONKIN = { gruppe = { "Schuppen, Krallen, Brandspuren. Das ist kein gewöhnlicher Hirsch.", "Wer Drachen jagt, sollte zuerst einen Rückweg kennen.", "*untersucht eine einzelne ungewöhnlich große Schuppe.*", "*folgt mit vorsichtigem Blick einer Brandspur am Gestein.*" }, },
    DETERRENCE = { gruppe = { "Ein Schritt zurück ist noch lange keine Kapitulation.", "Stahl nützt wenig, wenn man keinen Weg zum Überleben sieht.", "*nimmt eine kompakte Verteidigungshaltung ein.*", "*hält die Waffen so, dass kein leichter Treffer möglich scheint.*" }, },
    STRIDER_KICK = { gruppe = { "Aus diesem Winkel habt Ihr meinen Stiefel nicht kommen sehen.", "Auch lange Beine können eine sehr kurze Antwort geben.", "*setzt einen überraschenden, tiefen Tritt aus der Bewegung heraus.*", "*verlagert das Gewicht und stößt mit dem Absatz vor.*" }, ziel = { "Ein Schritt zu nah, %s. So lernt man Abstand." }, },
    BEAST_TRAINING = { gruppe = { "Die wichtigste Lektion beginnt nicht mit einem Befehl, sondern mit Vertrauen.", "Ein Gefährte lernt schneller, wenn man ihn auch versteht.", "*wiederholt geduldig ein Handzeichen und wartet auf die Reaktion.*", "*belohnt eine gelungene Übung mit freundlichem Nicken.*" }, },
}
