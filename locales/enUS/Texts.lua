-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.enUS.texts = {
 HUNTERS_MARK={ziel={"I have my eye on you, %s.","*fixes %s with a hunter's measured stare.*"},gruppe={"The prey is marked.","*signals the marked target to the companions.*"}},
 ARCANE_SHOT={ziel={"Arcane fire finds you, %s.","*fires at %s as arcane energy flares around the shot.*"},gruppe={"Arcane charge ready. Fire.","*looses a shot shimmering with arcane light.*"}},
 AIMED_SHOT={ziel={"One breath. One target. One shot, %s.","*takes careful aim at %s and holds steady.*"},gruppe={"*holds their breath and takes careful aim.*","I have an angle. Hold still."}},
 MULTI_SHOT={ziel={"One target is not enough today, %s.","*swings the weapon across %s and the surrounding targets.*"},gruppe={"*fires several shots in rapid succession.*","Several targets. Now."}},
 STEADY_SHOT={ziel={"Steady aim. Clean hit, %s.","*takes aim at %s again and holds perfectly still.*"},gruppe={"No haste. Clean shots.","*breathes out slowly and aims again.*"}},
 KILL_COMMAND={ziel={"Now! On %s!","*gives the companion a sharp hand signal toward %s.*"},gruppe={"Go! Now!","*sends the companion forward with a crisp command.*"}},
 MEND_PET={ziel={"Easy, old friend. I've got you.","*kneels beside %s and tends the wounds carefully.*"},gruppe={"Easy. You'll be fine.","*tends the companion's wounds with practiced hands.*"}},
 REVIVE_PET={ziel={"Come back, old friend. The hunt is not over.","*leans close to %s and searches anxiously for a sign of life.*"},gruppe={"Come on. I'm not leaving without you.","*kneels beside the fallen companion and refuses to move away.*"}},
 FEED_PET={ziel={"Here. You earned this.","*offers %s a well-earned portion of food.*"},gruppe={"You get your share. As always.","*watches the companion eat with quiet satisfaction.*"}},
 TAMING={ziel={"Easy, %s. I mean you no harm.","*lowers the weapon and slowly offers %s an open hand.*"},gruppe={"Trust cannot be forced.","*approaches slowly without making a sudden move.*"}},
 TRAP={ziel={"Watch your step, %s. Too late.","*glances toward the carefully hidden trap near %s.*"},gruppe={"Now we only need someone to step into it.","*hides a trap carefully in the terrain.*"}},
 FLARE={ziel={"No more hiding, %s.","*fires a flare toward %s and floods the area with light.*"},gruppe={"Let's see who's hiding there.","*fires a bright flare into the shadows.*"}},
 ASPECT_HAWK={gruppe={"Eyes open. The hawk sees first.","*straightens as the gaze becomes sharp and watchful.*"}}, ASPECT_CHEETAH={gruppe={"Keep up if you can.","*leans forward and breaks into a swift pace.*"}}, ASPECT_MONKEY={gruppe={"Standing still would be unhealthy.","*loosens the stance and begins moving unpredictably.*"}}, RAPID_FIRE={gruppe={"Now don't let up!","*fires shot after shot in rapid succession.*"}}, DISENGAGE={gruppe={"There. Distance restored.","*leaps backward and creates space.*"}}, MELEE={ziel={"Then up close, %s.","*lowers the ranged weapon and draws a melee weapon against %s.*"},gruppe={"Then at arm's length.","*switches to a melee weapon.*"}}, TRACKING={ziel={"The trail is fresh, %s.","*crouches and studies the tracks left by %s.*"},gruppe={"There. The trail is clear.","*studies ground, branches and wind for fresh signs.*"}}, CAMOUFLAGE={gruppe={"Don't move. Don't stand out. Disappear.","*melts into cover and the surrounding terrain.*"}}, VICTORY={ziel={"The hunt is over, %s.","*lowers the weapon after the final hit and regards %s quietly.*"},gruppe={"The trail ends here.","*checks the surroundings before lowering the weapon.*"}},
}
