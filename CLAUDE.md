# Claude Instructions – Writer's PKM Workspace

> **Template note:** this file is meant to be personalized. Fill in the `## Language`, `## Voice`, and `## Preferences` sections at the bottom, and edit the rest to match your own project setup.

## Core principles

1. **Editorial only.** This workspace's skills never generate prose, dialogue, outlines, or story ideas. Their job is to observe, flag, and suggest refinements to writing the user has already drafted. If the user asks for new prose, confirm that's actually what they want before producing any — the default posture is editorial.
2. **Writer-led.** Surface information on demand; never demand information from the writer. No nagging about empty character sheets or unfilled templates. Missing fields are fine.
3. **Minimal by default.** Templates describe what *can* be tracked, not what must be filled in. Writers discover characters, places, and rules as they write.

## Vault structure

This workspace contains an Obsidian vault for creative writing located at `Obsidian/Working Title/`. Rename the vault folder to whatever you like.

- `00_Scratchpad/` — Raw ideas and story fragments not yet tied to a project. Contains `Ideas/` and `Fragments/` subfolders. Fragments are prefixed with `SS_`. Nothing here is canon yet.
- `01_Projects/` — Active writing projects. Each novel or story collection lives in its own subfolder. Each novel gets a dedicated `Lore/` subfolder.
- `02_Research/` — Research notes that feed into projects.
- `templates/` — Stub files for new projects (`_meta/` skeletons, `Lore/` note templates). Reference these when scaffolding.

### Workflow

Fragments in `00_Scratchpad/` get promoted to `01_Projects/` when they become real projects. Research in `02_Research/` can feed any project.

### Short stories vs. novels

- Standalone short stories may not need a Lore file.
- Short stories set in a shared universe share a single `Lore/` folder at the collection level (e.g. `01_Projects/<Collection>/Lore/`), not per-story.
- Novels always get a dedicated `Lore/` folder inside the novel's own project folder.

## Writing skills (slash commands)

A pipeline of five specialized writing skills. Invoke them with `/skillname`.

| Skill | Command | Role |
|---|---|---|
| Ledger | `/ledger` | Session entry point — scans for changes, orchestrates the pipeline |
| Atlas | `/atlas` | Living story map — characters, locations, established facts |
| Warden | `/warden` | Consistency checker — lore, continuity, retroactive facts |
| Quill | `/quill` | Prose editor — grammar, voice, vocabulary, rhythm |
| Lens | `/lens` | Fresh reader — clarity, pacing, reader experience |

**Pipeline order:** Ledger → Atlas (once per project) → Warden → Quill → Lens (per file).

**Atlas is the source of truth.** Warden, Quill, and Lens all read from the project's `_meta/atlas.md`. Retroactive facts Warden detects get queued back to Atlas.

## The `_meta/` convention

Every project has a `_meta/` subfolder where the skills write their outputs (e.g. `_meta/atlas.md`, `_meta/status.md`, `_meta/warden/Chapter_03_warden.md`). These files are **agent-owned** — don't hand-edit them unless the user asks, because the next pipeline run will overwrite or conflict with your changes. If the user wants to change lore or continuity, the change belongs in the manuscript or in `Lore/`; Atlas picks it up from there.

---

## Language

<!-- Describe your primary writing language and any translation-artifact phrasing to watch for.
     Example: "I write in English but think in Spanish — Quill should expect occasional
     calques like 'make a question' instead of 'ask a question'." -->

## Voice

<!-- Describe how you want Claude to respond to you in chat (terseness, formality, humor).
     This is separate from your *writing* voice — that belongs in each project's Atlas. -->

## Preferences

<!-- Anything else Claude should know before touching your writing or this vault.
     Examples: "don't suggest em-dashes", "always confirm before editing a manuscript file",
     "I prefer British spelling". -->
