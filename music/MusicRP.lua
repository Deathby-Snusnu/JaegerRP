-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Original music-inspired roleplay; no song lyrics reproduced.
local _, addon = ...
addon.musicRP = { deDE = {}, enUS = {}, frFR = {} }
addon.musicRPReferences = {}
addon.musicRPReferences.RAPID_FIRE = { artist = "Metallica", song = "Fuel" }
addon.musicRP.deDE.RAPID_FIRE = { "Mehr Pulver, mehr Tempo! Jetzt wird es laut!", "*prüft hastig die Munition und legt wieder an.*" }
addon.musicRP.enUS.RAPID_FIRE = { "More powder, more speed! Let it roar!", "*checks the ammunition and takes aim again.*" }
addon.musicRP.frFR.RAPID_FIRE = { "Plus de poudre, plus de vitesse ! Que ça tonne !", "*vérifie ses munitions et remet en joue.*" }
addon.musicRPReferences.HUNTERS_MARK = { artist = "Guns N' Roses", song = "Welcome to the Jungle" }
addon.musicRP.deDE.HUNTERS_MARK = { "Willkommen in meinem Revier. Ich verliere keine Fährte.", "*mustert die Spuren und hebt langsam die Waffe.*" }
addon.musicRP.enUS.HUNTERS_MARK = { "Welcome to my territory. I never lose a trail.", "*studies the tracks and slowly raises a weapon.*" }
addon.musicRP.frFR.HUNTERS_MARK = { "Bienvenue sur mon territoire. Je ne perds jamais une piste.", "*examine les traces et lève lentement son arme.*" }
addon.musicRPReferences.CALL_PET = { artist = "Amon Amarth", song = "Raise Your Horns" }
addon.musicRP.deDE.CALL_PET = { "Komm, Gefährte! Heute ziehen wir gemeinsam weiter.", "*klopft mit der Hand gegen die Seite und ruft den Begleiter.*" }
addon.musicRP.enUS.CALL_PET = { "Come, companion! Today we travel together.", "*pats a thigh and calls for the companion.*" }
addon.musicRP.frFR.CALL_PET = { "Viens, compagnon ! Aujourd'hui, nous avançons ensemble.", "*tape sur sa cuisse et appelle son compagnon.*" }
addon.musicRPReferences.TRACKING = { artist = "Metallica", song = "Wherever I May Roam" }
addon.musicRP.deDE.TRACKING = { "Ein Weg ist erst zu Ende, wenn niemand mehr eine Spur findet.", "*kniet nieder und prüft die Erde auf frische Abdrücke.*" }
addon.musicRP.enUS.TRACKING = { "A road only ends when no one can follow its tracks.", "*kneels and checks the soil for fresh tracks.*" }
addon.musicRP.frFR.TRACKING = { "Un chemin ne finit que lorsque toute trace disparaît.", "*s'agenouille et cherche des traces fraîches dans la terre.*" }
addon.musicRPReferences.FEED_PET = { artist = "Die Ärzte", song = "Junge" }
addon.musicRP.deDE.FEED_PET = { "Du sollst nicht die Stiefel fressen! Hier, etwas Anständiges.", "*zieht dem Begleiter einen Stiefel aus dem Maul und reicht Futter.*" }
addon.musicRP.enUS.FEED_PET = { "Stop eating the boots! Here, have something proper.", "*retrieves a boot from the companion's mouth and offers food.*" }
addon.musicRP.frFR.FEED_PET = { "Arrête de manger les bottes ! Tiens, un vrai repas.", "*retire une botte de la gueule du compagnon et lui donne à manger.*" }
addon.musicRPReferences.FEIGN_DEATH = { artist = "Guns N' Roses", song = "November Rain" }
addon.musicRP.deDE.FEIGN_DEATH = { "Wenn der Regen kommt, bleibe ich einen Augenblick liegen.", "*sinkt reglos nieder und späht durch halb geschlossene Lider.*" }
addon.musicRP.enUS.FEIGN_DEATH = { "When the rain comes, I shall lie still for a moment.", "*drops motionless and peeks through half-closed eyes.*" }
addon.musicRP.frFR.FEIGN_DEATH = { "Quand vient la pluie, je reste immobile un instant.", "*s'écroule sans bouger et observe entre ses paupières.*" }

-- Called after personal texts, before ordinary class/racial text selection.
-- Extra original spoken lines and actions for existing music-inspired keys.
table.insert(addon.musicRP.deDE.RAPID_FIRE, "Das Magazin ist kein Versprechen. Aber ein guter Anfang.")
table.insert(addon.musicRP.deDE.RAPID_FIRE, "*kontrolliert den Verschluss und atmet ruhig aus.*")
table.insert(addon.musicRP.enUS.RAPID_FIRE, "A full magazine is no promise. But it is a good start.")
table.insert(addon.musicRP.enUS.RAPID_FIRE, "*checks the action and breathes out slowly.*")
table.insert(addon.musicRP.frFR.RAPID_FIRE, "Un chargeur plein ne garantit rien. Mais c'est un bon début.")
table.insert(addon.musicRP.frFR.RAPID_FIRE, "*vérifie le mécanisme et expire lentement.*")
table.insert(addon.musicRP.deDE.HUNTERS_MARK, "Manche Spuren verschwinden. Euer Schatten verrät Euch.")
table.insert(addon.musicRP.deDE.HUNTERS_MARK, "*zeichnet mit zwei Fingern eine Spur durch den Staub.*")
table.insert(addon.musicRP.enUS.HUNTERS_MARK, "Some tracks vanish. Your shadow tells the tale.")
table.insert(addon.musicRP.enUS.HUNTERS_MARK, "*draws a trail through the dust with two fingers.*")
table.insert(addon.musicRP.frFR.HUNTERS_MARK, "Certaines traces s'effacent. Votre ombre vous trahit.")
table.insert(addon.musicRP.frFR.HUNTERS_MARK, "*dessine une piste dans la poussière de deux doigts.*")

function addon.ChooseMusicText(key)
    if not addon.db or not addon.db.musicEnabled then return nil end
    local chance = addon.db.musicChance or 0
    if chance <= 0 or math.random(100) > chance then return nil end
    local language = addon.GetOutputLanguage()
    local lines = addon.musicRP[language] and addon.musicRP[language][key]
    if not lines then lines = addon.musicRP.deDE[key] end
    if type(lines) ~= "table" or #lines == 0 then return nil end
    return lines[math.random(#lines)]
end
