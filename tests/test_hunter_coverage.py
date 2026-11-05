"""Hunter spellbook and language parity without a WoW runtime."""
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
LANGUAGES = ("deDE", "enUS", "frFR")
RACES = ("Human", "Dwarf", "NightElf", "Orc", "Tauren", "Troll",
         "SkyborneHighOrder", "SkyborneWindshaper", "Skyborne")
AMBIENT = ("PET", "WEAPON", "TRACKING", "CAMP", "WILDERNESS",
           "WEATHER", "PROVISIONS", "TROPHY", "BOW", "FIREARM",
           "WATCH", "TRAVEL")


class HunterCoverageTests(unittest.TestCase):
    def test_spellbook_key_count_and_target_modes(self):
        src = (ROOT / "data/Spellbook.lua").read_text(encoding="utf-8")
        keys = re.findall(
            r'^\s+([A-Z][A-Z0-9_]*) = \{school="([A-Z]+)", mode="([A-Z]+)"\},$',
            src, re.M)
        self.assertEqual(len(keys), 58)
        self.assertEqual(len({key for key, _, _ in keys}), 58)
        self.assertEqual(
            [sum(group == g for _, group, _ in keys)
             for g in ("BM", "MM", "SV", "BT")], [20, 16, 21, 1])
        self.assertEqual(
            {mode for _, _, mode in keys},
            {"ENEMY", "SELF", "PET", "TRACK", "AREA", "TARGET"})

    def test_every_spell_in_each_language(self):
        src = (ROOT / "data/Spellbook.lua").read_text(encoding="utf-8")
        names = set(re.findall(r'^\s+([A-Z][A-Z0-9_]*) = \{school=', src, re.M))
        self.assertEqual(len(names), 58)
        for lang in LANGUAGES:
            with self.subTest(lang=lang):
                text = (ROOT / "locales" / lang / "Texts.lua").read_text(
                    encoding="utf-8")
                for name in names:
                    self.assertRegex(text, rf'\b{name}\s*=\s*\{{')
                self.assertNotIn("Neuer RP-Text", text)
                voices = (ROOT / "locales" / lang / "Voices.lua").read_text(
                    encoding="utf-8")
                extra = (ROOT / "locales" / lang /
                         "AmbientRacialExtra.lua").read_text(encoding="utf-8")
                for race in RACES:
                    self.assertRegex(voices, rf'(?m)^\s+{race}\s*=\s*\{{')
                    self.assertRegex(extra, rf'(?m)^\s+{race}\s*=\s*\{{')
                ambient = (ROOT / "locales" / lang / "Ambient.lua").read_text(
                    encoding="utf-8")
                for category in AMBIENT:
                    self.assertRegex(ambient, rf'\b{category}\s*=\s*\{{')

    def test_toc_load_order(self):
        toc = (ROOT / "JaegerRP.toc").read_text(encoding="utf-8")
        entries = [s.strip().replace("\\", "/") for s in toc.splitlines()
                   if s.strip() and not s.lstrip().startswith("#")]
        self.assertEqual(len(entries), len(set(entries)))
        for path in entries:
            self.assertTrue((ROOT / path).exists(), path)
        self.assertLess(entries.index("data/Spellbook.lua"),
                        entries.index("locales/deDE/Texts.lua"))
        self.assertLess(entries.index("locales/frFR/Voices.lua"),
                        entries.index("core/RacialVoices.lua"))
        self.assertLess(entries.index("core/Text.lua"),
                        entries.index("JaegerRP.lua"))
        self.assertIn("## Version: 0.6.0", toc)

    def test_no_old_filler_or_racial_placeholders(self):
        for lang in LANGUAGES:
            with self.subTest(lang=lang):
                expansion = (ROOT / "locales" / lang /
                             "Expansion.lua").read_text(encoding="utf-8")
                self.assertNotIn("appendUnique", expansion)
                racial = (ROOT / "locales" / lang /
                          "Racial.lua").read_text(encoding="utf-8")
                self.assertNotIn("Neuer RP-Text", racial)


if __name__ == "__main__":
    unittest.main()
