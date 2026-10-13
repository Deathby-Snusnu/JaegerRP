-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.deDE.racial = {
    Dwarf = {
        HUNTERS_MARK = {
            ziel = {
                "Beim Amboss der Ahnen, %s. Eure Spur entgeht mir nicht.",
                "*prueft %s mit der Ruhe eines Zwergen, bevor er das Ziel markiert.*",
            },
            gruppe = {
                "Ein gutes Auge und ein sicherer Schuss. Das Ziel ist markiert.",
                "*zeichnet die Spur des Ziels sorgfaeltig auf einer kleinen Karte ein.*",
            },
        },
        TRACKING = {
            ziel = {
                "Eure Abdruecke sind deutlich, %s. Selbst im Fels.",
                "*geht bei den Spuren von %s in die Hocke und vergleicht sie mit seinem Wissen um Stein und Erde.*",
            },
            gruppe = {
                "*liest die Faehrte aus Erde, Geroll und gebrochenem Gestein.*",
                "Stein vergisst nichts. Die Spur fuehrt hier entlang.",
            },
        },
    },

    NightElf = {
        HUNTERS_MARK = {
            ziel = {
                "Der Wald hat Euch gesehen, %s. Nun habe auch ich Euch im Blick.",
                "*zeichnet die Position von %s mit einem stillen Zeichen im feuchten Erdreich nach.*",
            },
            gruppe = {
                "Der Wind traegt ihren Geruch. Das Ziel ist markiert.",
                "*deutet lautlos auf das markierte Ziel, ohne das Unterholz zu stoeren.*",
            },
        },
        TRACKING = {
            ziel = {
                "Selbst im Mondschatten verliert der Wald Eure Spur nicht, %s.",
                "*folgt den kaum sichtbaren Zeichen, die %s zwischen Wurzeln und Farn hinterlassen hat.*",
            },
            gruppe = {
                "*liest die Faehrte an geknickten Halmen und bewegten Blaettern.*",
                "Der Wald verraet, wer seinen Pfad stoert.",
            },
        },
    },

    Orc = {
        HUNTERS_MARK = {
            ziel = {
                "Die Jagd ist eroeffnet, %s. Ich lasse Euch nicht entkommen.",
                "*fixiert %s und gibt seinem Begleiter ein knappes Zeichen.*",
            },
            gruppe = {
                "Das Ziel ist markiert. Haltet die Augen offen.",
                "*weist die Gefaehrten mit einem grimmigen Nicken auf die Beute hin.*",
            },
        },
        TRACKING = {
            ziel = {
                "Eure Spur ist deutlich, %s. Ihr koennt Euch nicht verstecken.",
                "*prueft den Boden und erkennt die Faehrte von %s mit geuebtem Blick.*",
            },
            gruppe = {
                "*liest die Faehrte aus Erde, Geruch und den Zeichen eines hastigen Marsches.*",
                "Sie sind hier entlang. Die Spur ist noch frisch.",
            },
        },
    },

    Tauren = {
        HUNTERS_MARK = {
            ziel = {
                "Die weiten Ebenen geben Euch preis, %s. Ich habe Euch im Blick.",
                "*beobachtet %s ruhig und markiert die Position fuer die Gefaehrten.*",
            },
            gruppe = {
                "Die Faehrte ist klar. Das Ziel ist markiert.",
                "*deutet auf das Ziel und achtet darauf, die Ruhe der Umgebung zu bewahren.*",
            },
        },
        TRACKING = {
            ziel = {
                "Die Erde bewahrt Eure Schritte, %s. Eure Spur fuehrt hier entlang.",
                "*liest die Abdruecke von %s, als folge er einer vertrauten Faehrte ueber die Ebenen.*",
            },
            gruppe = {
                "*prueft Boden und Wind, bevor er die Faehrte weiterverfolgt.*",
                "Die Erde spricht durch jeden Abdruck.",
            },
        },
    },

    Troll = {
        HUNTERS_MARK = {
            ziel = {
                "Ich seh dich, %s. Die Jagd endet, wenn ich es sage.",
                "*mustert %s mit einem schiefen Grinsen und merkt sich jede Bewegung.*",
            },
            gruppe = {
                "Da ist unsre Beute. Haltet die Augen offen.",
                "*zeigt mit einem kurzen Fingerzeig auf das markierte Ziel.*",
            },
        },
        TRACKING = {
            ziel = {
                "Deine Spur ist frisch, %s. Die Wildnis verraet dich.",
                "*schnuppert an der Luft und findet die Spur von %s zwischen den Geruechen des Dschungels.*",
            },
            gruppe = {
                "*prueft die Luft und folgt einer Faehrte, die sich zwischen Blattwerk und feuchter Erde verliert.*",
                "Die Spur ist hier lang. Der Dschungel kann viel verbergen, aber nicht alles.",
            },
        },
    },
}
