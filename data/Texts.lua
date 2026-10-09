local _, addon = ...

-- RP-Konvention:
-- Gesprochene Texte stehen ohne Markierung und nutzen den eingestellten Sprachkanal (Standard: /say).
-- Beschreibende Handlungen stehen zwischen *Sternchen* und werden immer als /me ausgegeben.
-- Der Handler entfernt die Sternchen vor der Ausgabe.

addon.texts = {
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
}
