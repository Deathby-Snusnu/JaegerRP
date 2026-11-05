-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Detailed culturally distinct hunter ambient (no hardcoded player or pet names).
local _, addon = ...
addon.localeData.enUS.ambientRacialExtra = {
    Dwarf = {
        PET = { "A little more bacon, a little less growling. That's progress.", "*checks the feed bag and counts everything twice.*" },
        CAMP = { "By my ancestors, who put my tools beside the sausage?", "*sets the mug where no curious paw can reach it.*" },
        TRACKING = { "This quarry tells more tales than a crowded tavern.", "*clears dust from the stone and finds delicate tracks.*" },
        WATCH = { "First watch keeps me awake. Second watch makes me grumpy.", "*leaves the crossbow safely within reach.*" },
        WEATHER = { "Rain is just water that hasn't chosen its place yet.", "*pulls the cloak closer and studies the sky.*" },
    },
    Human = {
        PET = { "Well done, companion. The next bite is yours.", "*straightens the animal's worn leather collar.*" },
        CAMP = { "Stories grow taller the quieter a camp becomes.", "*stacks blankets and packs beside the fire.*" },
        TRACKING = { "A patrol came through here. Their pace was uneven.", "*compares bootprints with snapped grass stems.*" },
        WATCH = { "Listen for three breaths before circling the camp.", "*studies the shadows between the tents.*" },
        WEATHER = { "A royal command won't dry a muddy road.", "*raises the hood against the gathering drizzle.*" },
    },
    NightElf = {
        PET = { "Elune taught us to honor even the smallest companion.", "*silently brushes a hand across the animal's fur.*" },
        CAMP = { "Beneath these trees no fire is entirely alone.", "*places a fallen branch carefully onto the flames.*" },
        TRACKING = { "Roots remember. Watch the earth closely.", "*reads tracks beneath ancient trees.*" },
        WATCH = { "The night is not ours. We are its guests.", "*listens to owl calls beyond the camp.*" },
        WEATHER = { "Each leaf sings differently in the rain.", "*lifts a face into the cool moonlight.*" },
    },
    Orc = {
        PET = { "A loyal beast deserves meat, not empty promises.", "*shares the last meat ration without hesitation.*" },
        CAMP = { "A good fire warms even the proudest warrior.", "*lays the axe safely beside the sleeping place.*" },
        TRACKING = { "Deep tracks. Our quarry will not be light.", "*studies a footprint with the edge of a knife.*" },
        WATCH = { "I shall watch. The ancestors will wake me if I nod off.", "*surveys the horizon with practiced patience.*" },
        WEATHER = { "A storm makes the choice more honest.", "*stands into the wind and laughs briefly.*" },
    },
    Tauren = {
        PET = { "Our companion shares both the road and the bread.", "*kneels and lets the animal drink in peace.*" },
        CAMP = { "The flame is small. The memory of home stays large.", "*lays carefully dried herbs beside the fire.*" },
        TRACKING = { "The earth speaks to those who walk slowly.", "*presses an open palm beside a fresh track.*" },
        WATCH = { "The Earth Mother never rests. Tonight I follow her lead.", "*stands motionless on the edge of camp.*" },
        WEATHER = { "The grass bows before the clouds arrive.", "*smells the rain approaching across the plains.*" },
    },
    Troll = {
        PET = { "Heh, found my provisions again, mon?", "*grins and shares a morsel with the companion.*" },
        CAMP = { "The loa enjoy a warm fire and a better story.", "*casts a pinch of herbs into the fire.*" },
        TRACKING = { "There, mon! A fresh trail and a lively hunt.", "*grins at a blade of crushed grass.*" },
        WATCH = { "Anyone sneaking tonight meets me first. Hehe.", "*rests the spear across the knees and listens.*" },
        WEATHER = { "Rain drums. Perhaps the loa are dancing.", "*taps a wooden cup in time with the drops.*" },
    },
    SkyborneHighOrder = {
        PET = { "A hunt begins by respecting another will.", "*brushes dust from the companion's plumage.*" },
        CAMP = { "A well-ordered camp makes room for thought.", "*arranges supplies at carefully even intervals.*" },
        TRACKING = { "Hidden order lies in the pattern of these tracks.", "*traces a thin line alongside the footprints.*" },
        WATCH = { "Vigilance is not worry. It is a discipline.", "*silently observes the boundaries of camp.*" },
        WEATHER = { "The wind changes according to a pattern I recognize.", "*tests the breeze with one fingertip.*" },
    },
    SkyborneWindshaper = {
        PET = { "A free companion needs no chain.", "*lets the animal chase a playful gust.*" },
        CAMP = { "A camp is where the wind hears our stories.", "*fastens the tent lines to leave room for the breeze.*" },
        TRACKING = { "These tracks dance like an eddy across the sand.", "*follows the drifting sand to the road's edge.*" },
        WATCH = { "The night moves. I move with it.", "*keeps watch on the windswept rise.*" },
        WEATHER = { "A strong wind can mean a fine departure.", "*spreads both arms and feels the current.*" },
    },
    Skyborne = {
        PET = { "My companion knows the roads above the clouds.", "*pets the animal while watching the sky.*" },
        CAMP = { "Where the wind rests, I can rest too.", "*stretches a camp cover between two trees.*" },
        TRACKING = { "The trail climbs toward fresher air.", "*checks the dust at the edge of a windy track.*" },
        WATCH = { "I hear the night without the need for a horn.", "*checks the surroundings beneath the stars.*" },
        WEATHER = { "The sky changes faster than any map.", "*listens to the upper branches rustle.*" },
    },
}
