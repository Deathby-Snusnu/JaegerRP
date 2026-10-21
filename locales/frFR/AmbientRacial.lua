-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
-- Role-playing text: CC BY-SA 4.0.
local _, addon = ...

addon.localeData.frFR.ambientRacial = {
    Dwarf = {
        CAMP = {
            "Par la barbe de mes ancetres, un feu vaut bien une salle du trone.",
            "Par ma barbe ! Sans soupe chaude, une chasse tourne au desastre.",
            "*pose sa chope hors de portee de l'ours.*",
            "Un nain verifie d'abord le temps, puis les reserves de biere.",
            "*verifie s'il reste assez de bois pour un vrai feu de camp.*",
        },
        PET = {
            "OldSooty, cette saucisse est pour apres la chasse !",
            "*regarde severement son compagnon sans pouvoir retenir un sourire.*",
            "Un ours fidele vaut mieux que dix compagnons peu fiables.",
        },
    },
    NightElf = {
        TRACKING = {
            "La foret se souvient de chaque pas.",
            "Les racines revelent qui a trouble ce sentier.",
            "*observe une empreinte sans casser la moindre brindille.*",
            "Sous ces branches, le vent connait chaque visiteur.",
            "*lit silencieusement les traces entre les racines.*",
        },
    },
    Troll = {
        TRACKING = {
            "La piste est fraiche, mon. On suit.",
            "La piste mene a la riviere, mon. On attend la.",
            "*sourit et montre des traces a peine visibles dans la boue.*",
            "A marcher si fort, il veut surement etre trouve, mon.",
        },
    },
}
