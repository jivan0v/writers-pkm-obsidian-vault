# Project stub templates

These are the minimal, optional-everything stubs that `/new-project` copies into a newly-scaffolded project. They describe **what Atlas can track**, not what you must fill in — leave any field blank if you don't know it yet.

You can also copy these by hand if you're setting up a project without the `/new-project` skill.

## Files

| File | Lands at | Purpose |
|---|---|---|
| `_meta/atlas.md` | `01_Projects/<Project>/_meta/atlas.md` | Atlas's living story map. Initially mostly blank; Atlas fills it in on first run. |
| `_meta/status.md` | `01_Projects/<Project>/_meta/status.md` | Ledger's per-file pipeline tracker. |
| `Lore/character.md` | `01_Projects/<Project>/Lore/<Name>.md` | One per major character. Rename the file. |
| `Lore/location.md` | `01_Projects/<Project>/Lore/<Place>.md` | One per notable setting. Rename the file. |
| `Lore/world-rule.md` | `01_Projects/<Project>/Lore/<Rule>.md` | One per explicit rule of the world. Rename the file. |
| `Lore/timeline.md` | `01_Projects/<Project>/Lore/Timeline.md` | One per project, optional. |

## Principle

Every field in every template is **optional**. If a character doesn't have a known appearance yet, leave the line blank or delete it. Missing information should never block writing. Atlas, Warden, Quill, and Lens all treat blank fields as "not yet established" — not as errors.
