# Agent Bootstrap — Writer's PKM Workspace

Single-file context for any agent picking up work in this repo. Read this first; everything else is detail.

---

## 1. What this project is

A personal knowledge management workspace for creative writers, combining:

- An **Obsidian vault** (`Obsidian/Working Title/`) for notes, drafts, ideas, and lore.
- A **pipeline of six Claude Code skills** (`/ledger`, `/atlas`, `/warden`, `/quill`, `/lens`, `/new-project`) that observe and refine the writer's manuscripts.
- **Templates** (`templates/`) and **distributable skill archives** (`*.skill`) for sharing.

Public, MIT-licensed. Designed to be cloned and personalized.

## 2. Non-negotiable principles

These override anything else. If a request conflicts with these, stop and ask the user.

1. **Editorial only.** Skills never generate prose, dialogue, outlines, or story ideas. They observe, flag, and suggest refinements to writing the user has already drafted. If asked for new prose, confirm before producing any — default posture is editorial.
2. **Writer-led.** Surface information on demand; never demand information from the writer. No nagging about empty character sheets or unfilled templates. Missing fields are fine.
3. **Minimal by default.** Templates describe what *can* be tracked, not what must be filled in. Writers discover characters, places, and rules as they write.
4. **Context-aware, not rigid.** The long-term direction is adaptive review depth, not running every agent on every file every time.

Each `SKILL.md` opens with a "read first" guardrails block enforcing these mechanically — don't strip those.

## 3. Repository layout

```
PKM/
├── AGENTS.md                  ← this file
├── CLAUDE.md                  ← per-session instructions Claude Code auto-loads
├── README.md                  ← user-facing intro + install
├── ROADMAP.md                 ← tiered enhancement plan (source of truth for "what's next")
├── CHANGELOG.md               ← shipped changes (Keep-a-Changelog format)
├── USAGE.md                   ← writer's handbook (amateur-user-facing detail per skill + recipes)
├── LICENSE                    ← MIT
│
├── Obsidian/Working Title/    ← the vault itself (rename freely)
│   ├── .obsidian/             ← Obsidian config, plugins
│   ├── 00_Scratchpad/
│   │   ├── Ideas/             ← raw idea notes (one example present)
│   │   └── Fragments/         ← short fragments prefixed `SS_` (one example present)
│   ├── 01_Projects/           ← active novels / story collections (currently empty)
│   └── 02_Research/           ← research feeding any project (currently empty)
│
├── _skill-sources/            ← editable source of every skill (one folder each)
│   ├── ledger/SKILL.md
│   ├── atlas/SKILL.md
│   ├── warden/SKILL.md
│   ├── quill/SKILL.md
│   ├── lens/SKILL.md
│   └── new-project/SKILL.md
│
├── *.skill                    ← zipped distributable copies of each skill (rebuild from sources)
│
└── templates/                 ← stubs `/new-project` copies into new projects
    ├── _meta/atlas.md
    ├── _meta/status.md
    └── Lore/{character,location,world-rule,timeline}.md
```

Vault subfolder rules:
- **Fragments** → promoted from `00_Scratchpad/` to `01_Projects/` when they become real projects.
- **Standalone short stories** may not need a `Lore/` file at all.
- **Shared-universe collections** keep one `Lore/` at the collection level (`01_Projects/<Collection>/Lore/`), not per-story.
- **Novels** always get a dedicated `Lore/` inside their own project folder.

## 4. The skill pipeline

| Skill | Command | Role |
|---|---|---|
| **Ledger** | `/ledger` | Session entry point. Scans for changes since last run, maintains `_meta/status.md` per project, can orchestrate the whole pipeline. |
| **Atlas** | `/atlas` | Living story map — characters, locations, world rules, established facts, retroactive facts. **Source of truth** for the others. |
| **Warden** | `/warden` | Continuity / lore / timeline consistency check. Reports inconsistencies against Atlas; queues retroactive facts back to Atlas. |
| **Quill** | `/quill` | Prose-level editor — grammar, voice, vocabulary, rhythm, show-don't-tell. Never touches plot or continuity. |
| **Lens** | `/lens` | Fresh-reader pass — clarity, pacing, emotional landing. Reads Atlas only as a table of contents, *not* as a source — represents the reader. |
| **New Project** | `/new-project` | Outside the pipeline. Scaffolds a project under `01_Projects/` from `templates/`, then hands off to `/atlas`. No prose. |

**Pipeline order:** Ledger → Atlas (once per project) → Warden → Quill → Lens (per file).

## 5. The `_meta/` convention (critical)

Every project has a `_meta/` subfolder where skills write their outputs:

- `_meta/atlas.md` — Atlas's living map
- `_meta/status.md` — Ledger's per-project status
- `_meta/warden/Chapter_03_warden.md`, `_meta/quill/...`, `_meta/lens/...` — per-file reports
- `_meta/atlas_history.md` — versioned fact history

**These files are agent-owned.** Don't hand-edit them unless the user explicitly asks. The next pipeline run will overwrite or conflict with manual edits. If the user wants to change lore or continuity, the change belongs in the **manuscript** or in **`Lore/`** — Atlas picks it up from there.

## 6. Personalization surface (`CLAUDE.md`)

`CLAUDE.md` auto-loads each Claude Code session. Three user-fillable sections at the bottom:

- **`## Language`** — primary writing language + translation-artifact phrasing to expect.
- **`## Voice`** — how Claude should respond in chat (terseness, formality). Distinct from the writer's prose voice (that lives in each project's Atlas).
- **`## Preferences`** — anything else (e.g. "don't suggest em-dashes", "always confirm before editing a manuscript file").

These sections may be empty placeholders in a fresh clone — that's fine. Don't prompt the user to fill them.

## 7. Current state (as of latest commit)

From `CHANGELOG.md` (Unreleased):
- `/new-project` skill shipped.
- `templates/` directory with optional-everything stubs shipped.
- Editorial-only guardrails block added to every `SKILL.md`.
- `CHANGELOG.md` added.
- Core principles + `_meta/` convention codified in `CLAUDE.md`.
- README install instructions concretized (`cp -r` per skill).
- `.gitignore` guards for `/.idea/` and `/main.py` (this is **not** a Python project).

`01_Projects/` and `02_Research/` are currently empty (`.gitkeep` only). The only example content lives in `00_Scratchpad/`.

Recent commits:
- `ef17ced` Add `/new-project` scaffolding skill (ROADMAP 1.2)
- `c4a84c5` Remove stray JetBrains/PyCharm files and guard against recurrence
- `528d835` Add editorial-only guardrails and project stub templates
- `712c834` Remove stray root-level `.obsidian/` and guard against recurrence
- `cc3463a` Rewrite ROADMAP with consolidated design ideas

## 8. What's next (from `ROADMAP.md`)

Tiers, lowest-dependency first within each:

1. **Foundations** — most shipped. Remaining: 1.4 expanded example project, 1.5 installer one-liner. *(1.6 `/new-project` polish shipped.)*
2. **Pipeline flexibility** — 2.1 modes (Draft / Continuity / Polish / Full), 2.2 Warden options + impact scope, 2.3 `/wrap`, 2.4 Ledger dashboard, 2.5 acknowledgement convention. *(2.6 Warden severity + timeline upgrades shipped. 2.7 Quill noise-floor shipped.)*
3. **Atlas + skill refinements** — 3.1 temporal voice evolution, 3.2 short-story/novel alignment, 3.3 output accumulation policy, 3.4 multi-language pattern, 3.5 Ledger reliability fixes, 3.6 Atlas watermark + incremental ingest, 3.7 decouple Warden→`atlas.md` writes, 3.10 paragraph-anchored output, 3.11 Lens first/last impression + genre signaling, 3.12 Atlas moments index. *(3.8 empty-Atlas fallbacks + provisional voice shipped. 3.9 skip-zone markers shipped.)*
4. **Obsidian leverage** — YAML frontmatter + Dataview, opinionated default `.obsidian/`, note templates, daily-notes integration.
5. **Shared-universe architecture** — `03_Universe_Atlas/` with dual ingestion + promotion pipeline.
6. **Public-repo polish** — architecture diagram, `CONTRIBUTING.md`, skill versioning, issue/PR templates, 6.5 tighten skill descriptions. *(6.6 Atlas path-diagram fix shipped. 6.7 Writer's Handbook shipped — keep it updated alongside every shipped skill change going forward.)*

Parked (not planned): research-folder integration, Lens reader profiles, automated skill tests, external-source import, AI-drafting support (violates principle #1).

## 9. Working conventions

- Each completed roadmap item ships as a single commit (or short series) and gets a CHANGELOG entry.
- For any **L**-sized item, scope it into sub-tasks before implementation.
- The `*.skill` archives are rebuilt from `_skill-sources/` — when a skill changes, rebuild with:
  ```bash
  cd _skill-sources && zip -q ../<skill>.skill <skill>/SKILL.md
  ```
- Distribution path: users `cp -r _skill-sources/<skill> ~/.claude/skills/` and restart Claude Code.
- This is **not a Python project** — ignore `.venv/`; it's a stray. Do not add Python tooling.

## 10. Quick start for an incoming agent

1. Read `CLAUDE.md` for any personalization the user has filled in (Language / Voice / Preferences).
2. If the user invokes `/ledger`, that skill drives the session — let it walk Atlas → Warden → Quill → Lens.
3. If the user is starting a new project, route them to `/new-project`; do not scaffold by hand.
4. Never write into `_meta/` outside of a skill run. Never generate prose without explicit confirmation.
5. When in doubt: **observe and flag, don't generate**.
