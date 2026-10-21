-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
-- Role-playing text: CC BY-SA 4.0.
local _, addon = ...

addon.localeData.enUS.ambientRacial = {
    Dwarf = {
        CAMP = {
            "By my ancestors beard, a warm fire beats any throne room.",
            "By my beard! Without hot soup, a hunt turns into a disaster.",
            "*sets down his mug where the bear cannot reach it.*",
            "A dwarf checks the weather first, then the beer supply.",
            "*checks whether there is enough wood for a proper campfire.*",
        },
        PET = {
            "OldSooty, that sausage is for after the hunt!",
            "*gives his companion a stern look but cannot hide a grin.*",
            "One loyal bear is worth ten unreliable companions.",
        },
    },
    NightElf = {
        TRACKING = {
            "The forest remembers every footstep.",
            "The roots reveal who disturbed this path.",
            "*studies a footprint without snapping a twig.*",
            "Beneath these boughs, the wind knows every visitor.",
            "*silently reads the tracks between the roots.*",
        },
    },
    Troll = {
        TRACKING = {
            "Tracks are fresh, mon. Come, we follow.",
            "The trail leads to the river, mon. We wait there.",
            "*grins and points to nearly invisible marks in the mud.*",
            "Anyone walking that loudly must want to be found, mon.",
        },
    },
}
