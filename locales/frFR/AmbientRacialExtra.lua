-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Voix d'ambiance propres à chaque peuple, sans noms de compagnons personnels.
local _, addon = ...
addon.localeData.frFR.ambientRacialExtra = {
    Dwarf = {
        PET = { "Un peu plus de lard, un peu moins de grognements. Voilà le progrès.", "*vérifie le sac de nourriture et compte tout deux fois.*" },
        CAMP = { "Par mes ancêtres, qui a posé mes outils près du saucisson ?", "*place la chope hors de portée des pattes curieuses.*" },
        TRACKING = { "Cette carrière raconte plus d'histoires qu'une taverne bondée.", "*essuie la poussière d'une dalle pour voir les traces.*" },
        WATCH = { "Le premier tour me réveille. Le deuxième me rend grognon.", "*laisse son arbalète à portée de main, en sécurité.*" },
        WEATHER = { "La pluie est de l'eau qui cherche encore sa place.", "*resserre son manteau et examine le ciel.*" },
    },
    Human = {
        PET = { "Bien joué, camarade. La prochaine bouchée est pour toi.", "*ajuste le vieux collier de cuir de l'animal.*" },
        CAMP = { "Les récits grandissent quand le camp devient silencieux.", "*range couvertures et sacs près du feu.*" },
        TRACKING = { "Une patrouille est passée. Leurs pas étaient irréguliers.", "*compare les bottes aux herbes brisées.*" },
        WATCH = { "Écouter pendant trois souffles, puis faire le tour.", "*observe les ombres entre les tentes.*" },
        WEATHER = { "Un ordre royal ne séchera pas cette route boueuse.", "*remonte sa capuche contre la bruine.*" },
    },
    NightElf = {
        PET = { "Élune nous a appris à honorer les plus petits compagnons.", "*passe doucement la main dans la fourrure de l'animal.*" },
        CAMP = { "Sous ces arbres, aucun feu ne brûle vraiment seul.", "*ajoute au foyer une branche déjà tombée.*" },
        TRACKING = { "Les racines se souviennent. Observe la terre.", "*lit des traces sous des arbres anciens.*" },
        WATCH = { "La nuit n'est pas à nous. Nous y sommes invités.", "*écoute les hiboux au-delà du camp.*" },
        WEATHER = { "Chaque feuille chante autrement sous la pluie.", "*lève le visage vers la lumière froide de la lune.*" },
    },
    Orc = {
        PET = { "Une bête loyale mérite de la viande, pas des promesses.", "*partage sans hésiter sa dernière ration de viande.*" },
        CAMP = { "Un bon feu réchauffe même le plus fier guerrier.", "*pose sa hache en sécurité près du couchage.*" },
        TRACKING = { "Des traces profondes. Notre proie est lourde.", "*examine une empreinte avec le fil de son couteau.*" },
        WATCH = { "Je veille. Les ancêtres me réveilleront si je m'endors.", "*scrute l'horizon avec une patience éprouvée.*" },
        WEATHER = { "Une tempête rend la décision plus sincère.", "*fait face au vent et rit brièvement.*" },
    },
    Tauren = {
        PET = { "Notre compagnon partage notre route et notre pain.", "*s'agenouille pour laisser l'animal boire en paix.*" },
        CAMP = { "La flamme est petite. Le souvenir du foyer reste grand.", "*dépose des herbes séchées près du feu.*" },
        TRACKING = { "La terre parle à ceux qui marchent lentement.", "*pose sa paume près d'une trace fraîche.*" },
        WATCH = { "La Terre-Mère ne se repose jamais. Je suivrai son exemple.", "*reste immobile au bord du camp.*" },
        WEATHER = { "L'herbe se courbe avant l'arrivée des nuages.", "*sent la pluie qui arrive sur les plaines.*" },
    },
    Troll = {
        PET = { "Hé, t'as encore trouvé mes provisions, mon ?", "*rit et partage une bouchée avec son compagnon.*" },
        CAMP = { "Les loa aiment les feux chauds et les belles histoires.", "*jette une pincée d'herbes dans les flammes.*" },
        TRACKING = { "Là, mon ! Une piste fraîche et une chasse joyeuse.", "*sourit devant un brin d'herbe écrasé.*" },
        WATCH = { "Qui se faufile cette nuit me rencontrera d'abord. Hé hé.", "*pose sa lance sur ses genoux et écoute.*" },
        WEATHER = { "La pluie tambourine. Les loa dansent peut-être.", "*tapote un gobelet de bois au rythme des gouttes.*" },
    },
    SkyborneHighOrder = {
        PET = { "La chasse commence dans le respect d'une autre volonté.", "*époussette les plumes de son compagnon.*" },
        CAMP = { "Un camp bien ordonné laisse place à la réflexion.", "*aligne le matériel avec un soin minutieux.*" },
        TRACKING = { "Un ordre caché se dessine dans ces traces.", "*trace une ligne fine à côté des empreintes.*" },
        WATCH = { "La vigilance n'est pas de l'inquiétude, c'est un art.", "*observe en silence les limites du camp.*" },
        WEATHER = { "Le vent change selon un motif que je reconnais.", "*teste la brise du bout d'un doigt.*" },
    },
    SkyborneWindshaper = {
        PET = { "Un compagnon libre n'a besoin d'aucune chaîne.", "*laisse l'animal courir derrière une brise joueuse.*" },
        CAMP = { "Un camp est un lieu où le vent écoute nos histoires.", "*fixe les cordes de tente pour laisser passer l'air.*" },
        TRACKING = { "Ces traces dansent sur le sable comme un tourbillon.", "*suit les grains déplacés jusqu'au bord du chemin.*" },
        WATCH = { "La nuit bouge. Je bouge avec elle.", "*monte la garde sur une colline balayée par le vent.*" },
        WEATHER = { "Un vent puissant annonce parfois un bon départ.", "*écarte les bras pour sentir les courants.*" },
    },
    Skyborne = {
        PET = { "Mon compagnon connaît les chemins au-dessus des nuages.", "*caresse l'animal en regardant le ciel.*" },
        CAMP = { "Là où le vent se repose, je peux faire de même.", "*tend une toile de camp entre deux arbres.*" },
        TRACKING = { "La piste monte vers un air plus frais.", "*examine la poussière d'un sentier venteux.*" },
        WATCH = { "J'entends la nuit sans besoin de sonner du cor.", "*scrute les environs sous les étoiles.*" },
        WEATHER = { "Le ciel change plus vite que toutes les cartes.", "*écoute frémir les branches hautes.*" },
    },
}
