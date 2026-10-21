-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.enUS.racial = {
    Dwarf = {
        HUNTERS_MARK = {ziel={"By the ancestors' anvil, %s. Your trail will not escape me.","Stone and steel teach patience, %s. I have you now.","*studies %s with a dwarf's steady patience before marking the target.*"},gruppe={"A good eye and a steady shot. The target is marked.","*marks the target's trail carefully on a small map.*"}},
        TRACKING = {ziel={"Your prints are plain enough, %s. Even on stone.","Rock remembers more than most folk think, %s.","*crouches by %s's tracks and reads stone, grit and disturbed earth.*"},gruppe={"Stone forgets nothing. The trail leads this way.","*reads the trail from dirt, scree and broken stone.*"}},
    },
    NightElf = {
        HUNTERS_MARK = {ziel={"The forest has seen you, %s. Now so have I.","Even moonshadow cannot hide you from the hunt, %s.","*marks %s's position with a silent sign in the damp earth.*"},gruppe={"The wind carries their scent. The target is marked.","*points silently toward the marked target without disturbing the undergrowth.*"}},
        TRACKING = {ziel={"The forest has not lost your trail, %s.","Every bent fern tells a story, %s.","*follows the faint signs %s left among roots and fern.*"},gruppe={"The forest tells who disturbed its path.","*reads the trail in bent grass and shifted leaves.*"}},
    
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
        HUNTERS_MARK = {ziel={"The hunt has begun, %s. You will not escape.","Run if you want, %s. It only lengthens the hunt.","*fixes %s with a hard stare and gives the companion a short signal.*"},gruppe={"The target is marked. Keep your eyes open.","*indicates the prey to the companions with a grim nod.*"}},
        TRACKING = {ziel={"Your trail is obvious, %s. You cannot hide.","You moved in haste, %s. The ground remembers.","*checks the ground and recognizes %s's trail with a practiced glance.*"},gruppe={"They went this way. The trail is fresh.","*reads earth, scent and signs of a hurried march.*"}},
    },
    Tauren = {
        HUNTERS_MARK = {ziel={"The open plains give you away, %s. I have you in sight.","The wind has already told me where you stand, %s.","*watches %s calmly and marks the position for the companions.*"},gruppe={"The trail is clear. The target is marked.","*points out the target while keeping the surrounding calm undisturbed.*"}},
        TRACKING = {ziel={"The earth keeps your steps, %s. Your trail leads this way.","Every hoofprint and footprint has a voice, %s.","*reads %s's tracks as if following a familiar path across the plains.*"},gruppe={"The earth speaks through every track.","*checks ground and wind before following the trail onward.*"}},
    },
    Troll = {
        HUNTERS_MARK = {ziel={"I see you, %s. The hunt ends when I say so.","Keep moving, %s. Makes the chase more fun.","*eyes %s with a crooked grin and memorizes every movement.*"},gruppe={"There is our prey. Keep your eyes open.","*points briefly toward the marked target.*"}},
        TRACKING = {ziel={"Your trail is fresh, %s. The wilds betray you.","The jungle hides plenty, %s, but not your scent.","*tests the air and finds %s's trail among the jungle scents.*"},gruppe={"The trail goes this way. The jungle cannot hide everything.","*tests the air and follows a trail through leaves and damp earth.*"}},
    },

    Nightelf = {
        
    },
}
