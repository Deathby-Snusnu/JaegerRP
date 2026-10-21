-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.frFR.racial = {
    Dwarf = {
        HUNTERS_MARK = {ziel={"Par l enclume des ancetres, %s. Votre piste ne m echappera pas.","La pierre et l acier enseignent la patience, %s. Je vous tiens.","*etudie %s avec la patience obstinee d un nain avant de marquer la cible.*"},gruppe={"Un bon oeil et un tir sur. La cible est marquee.","*note soigneusement la piste de la cible sur une petite carte.*"}},
        TRACKING = {ziel={"Vos traces sont nettes, %s. Meme sur la pierre.","La roche se souvient de bien plus qu on ne le croit, %s.","*s accroupit pres des traces de %s et lit la pierre, le gravier et la terre remuee.*"},gruppe={"La pierre n oublie rien. La piste passe par ici.","*lit la piste dans la terre, les eboulis et les pierres brisees.*"}},
    },
    NightElf = {
        HUNTERS_MARK = {ziel={"La foret vous a vu, %s. Moi aussi desormais.","Meme l ombre de la lune ne vous cachera pas de la chasse, %s.","*marque la position de %s d un signe silencieux dans la terre humide.*"},gruppe={"Le vent porte leur odeur. La cible est marquee.","*indique silencieusement la cible sans troubler les sous-bois.*"}},
        TRACKING = {ziel={"La foret n a pas perdu votre piste, %s.","Chaque fougere pliee raconte quelque chose, %s.","*suit les signes presque invisibles laisses par %s entre racines et fougeres.*"},gruppe={"La foret revele qui trouble son chemin.","*lit la piste dans l herbe pliee et les feuilles deplacees.*"}},
    
        SERPENT_STING = {
            ziel = { "Neuer RP-Text", },
            gruppe = { "Neuer RP-Text", },
        },
    
        RAPTOR_STRIKE = {
            ziel = { "Neuer RP-Text", },
            gruppe = { "Neuer RP-Text", },
        },
    },
    Orc = {
        HUNTERS_MARK = {ziel={"La chasse a commence, %s. Vous ne vous echapperez pas.","Courez si vous voulez, %s. Cela ne fait que prolonger la chasse.","*fixe %s d un regard dur et adresse un signe bref a son compagnon.*"},gruppe={"La cible est marquee. Gardez les yeux ouverts.","*indique la proie a ses compagnons d un signe sombre de la tete.*"}},
        TRACKING = {ziel={"Votre piste est evidente, %s. Vous ne pouvez pas vous cacher.","Vous avez marche trop vite, %s. Le sol s en souvient.","*examine le sol et reconnait la piste de %s d un regard exerce.*"},gruppe={"Ils sont passes par ici. La piste est fraiche.","*lit la terre, les odeurs et les signes d une marche precipitee.*"}},
    },
    Tauren = {
        HUNTERS_MARK = {ziel={"Les grandes plaines vous trahissent, %s. Je vous ai en vue.","Le vent m a deja dit ou vous vous tenez, %s.","*observe %s calmement et marque sa position pour ses compagnons.*"},gruppe={"La piste est claire. La cible est marquee.","*indique la cible sans troubler le calme des environs.*"}},
        TRACKING = {ziel={"La terre garde vos pas, %s. Votre piste passe par ici.","Chaque trace a une voix, %s.","*lit les traces de %s comme une piste familiere a travers les plaines.*"},gruppe={"La terre parle par chaque empreinte.","*verifie le sol et le vent avant de poursuivre la piste.*"}},
    },
    Troll = {
        HUNTERS_MARK = {ziel={"Je te vois, %s. La chasse finit quand je le decide.","Continue de courir, %s. Ca rend la chasse plus amusante.","*observe %s avec un sourire de travers et memorise chaque mouvement.*"},gruppe={"Voila notre proie. Ouvrez les yeux.","*indique brievement la cible marquee du doigt.*"}},
        TRACKING = {ziel={"Ta piste est fraiche, %s. La nature te trahit.","La jungle cache beaucoup de choses, %s, mais pas ton odeur.","*hume l air et retrouve la piste de %s parmi les odeurs de la jungle.*"},gruppe={"La piste passe par ici. La jungle ne peut pas tout cacher.","*hume l air et suit une piste entre feuillage et terre humide.*"}},
    },

    Nightelf = {
        
    },
}
