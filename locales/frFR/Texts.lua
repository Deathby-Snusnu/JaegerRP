-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.frFR.texts = {
 HUNTERS_MARK={ziel={"Je vous ai à l'œil, %s.","*fixe %s avec le regard mesuré d'un chasseur.*"},gruppe={"La proie est marquée.","*désigne la cible marquée aux compagnons.*"}},
 ARCANE_SHOT={ziel={"Le feu arcanique vous trouvera, %s.","*tire sur %s tandis que l'énergie arcanique embrase le projectile.*"},gruppe={"Charge arcanique prête. Feu.","*décoche un tir nimbé de lumière arcanique.*"}},
 AIMED_SHOT={ziel={"Un souffle. Une cible. Un tir, %s.","*vise soigneusement %s et reste parfaitement immobile.*"},gruppe={"*retient son souffle et ajuste soigneusement sa visée.*","J'ai un angle. Ne bougez pas."}},
 MULTI_SHOT={ziel={"Une seule cible ne suffira pas aujourd'hui, %s.","*balaye %s et les cibles voisines de son arme.*"},gruppe={"*décoche plusieurs tirs en succession rapide.*","Plusieurs cibles. Maintenant."}},
 STEADY_SHOT={ziel={"Visée stable. Tir propre, %s.","*vise de nouveau %s et garde l'arme parfaitement stable.*"},gruppe={"Pas de hâte. Des tirs propres.","*expire lentement et vise de nouveau.*"}},
 KILL_COMMAND={ziel={"Maintenant ! Sur %s !","*adresse à son compagnon un signe sec vers %s.*"},gruppe={"Vas-y ! Maintenant !","*envoie son compagnon en avant d'un ordre bref.*"}},
 MEND_PET={ziel={"Doucement, vieil ami. Je m'en occupe.","*s'agenouille près de %s et soigne les blessures avec précaution.*"},gruppe={"Doucement. Ça va aller.","*soigne les blessures de son compagnon avec des gestes sûrs.*"}},
 REVIVE_PET={ziel={"Reviens, vieil ami. La chasse n'est pas terminée.","*se penche vers %s et cherche anxieusement un signe de vie.*"},gruppe={"Allez. Je ne pars pas sans toi.","*s'agenouille près de son compagnon tombé et refuse de s'éloigner.*"}},
 FEED_PET={ziel={"Tiens. Tu l'as mérité.","*offre à %s une ration bien méritée.*"},gruppe={"Tu auras ta part. Comme toujours.","*regarde son compagnon manger avec satisfaction.*"}},
 TAMING={ziel={"Doucement, %s. Je ne vous veux aucun mal.","*abaisse son arme et tend lentement une main ouverte vers %s.*"},gruppe={"La confiance ne se force pas.","*s'approche lentement sans geste brusque.*"}},
 TRAP={ziel={"Regardez où vous mettez les pieds, %s. Trop tard.","*jette un regard vers le piège soigneusement dissimulé près de %s.*"},gruppe={"Il ne manque plus que quelqu'un pour marcher dedans.","*dissimule soigneusement un piège dans le terrain.*"}},
 FLARE={ziel={"Assez joué à cache-cache, %s.","*tire une fusée éclairante vers %s et baigne la zone de lumière.*"},gruppe={"Voyons qui se cache là.","*tire une fusée éclatante dans les ombres.*"}},
 ASPECT_HAWK={gruppe={"Les yeux ouverts. Le faucon voit le premier.","*se redresse, le regard soudain vif et attentif.*"}}, ASPECT_CHEETAH={gruppe={"Suivez si vous pouvez.","*se penche en avant et accélère vivement.*"}}, ASPECT_MONKEY={gruppe={"Rester immobile serait mauvais pour la santé.","*relâche sa posture et commence à bouger de façon imprévisible.*"}}, RAPID_FIRE={gruppe={"Ne relâchez pas la pression !","*enchaîne les tirs à grande vitesse.*"}}, DISENGAGE={gruppe={"Voilà. La distance est rétablie.","*bondit en arrière pour recréer de l'espace.*"}}, MELEE={ziel={"Alors de près, %s.","*abaisse l'arme à distance et tire une arme de mêlée face à %s.*"},gruppe={"Alors à portée de bras.","*passe à une arme de mêlée.*"}}, TRACKING={ziel={"La piste est fraîche, %s.","*s'accroupit et étudie les traces laissées par %s.*"},gruppe={"Là. La piste est claire.","*examine le sol, les branches et le vent à la recherche de signes récents.*"}}, CAMOUFLAGE={gruppe={"Ne pas bouger. Ne pas se faire remarquer. Disparaître.","*se fond dans le couvert et le terrain environnant.*"}}, VICTORY={ziel={"La chasse est terminée, %s.","*abaisse son arme après le dernier coup et observe %s en silence.*"},gruppe={"La piste s'arrête ici.","*vérifie les alentours avant d'abaisser son arme.*"}},
}
