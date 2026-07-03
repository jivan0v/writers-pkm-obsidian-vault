# Agent Bootstrap — Writer's PKM Workspace

Single-file context for any agent picking up work in this repo. Read this first; everything else is detail.

_Last verified: 2026-07-03. If §3/§7/§8 look stale against `CHANGELOG.md` or `ROADMAP.md`, trust those files and update this one (plus this date line)._

---

## 1. What this project is

A personal knowledge management workspace for creative writers, combining:

- An **Obsidian vault** (`Obsidian/Working Title/`) for notes, drafts, ideas, and lore.
- A **pipeline of six Claude Code skills** (`/ledger`, `/atlas`, `/warden`, `/quill`, `/lens`, `/new-project`) that observe and refine the writer's manuscripts.
- **Templates** (`templates/`) and **distributable skill archives** (`*.skill`) for sharing.

Public, MIT-licensed. Designed to be cloned and personalized. Live at **https://github.com/jivan0v/writers-pkm-obsidian-vault**.

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
├── README.md                  ← user-facing intro + install (Mermaid pipeline diagram, USAGE callout)
├── USAGE.md                   ← writer's handbook (amateur-user-facing detail per skill + recipes)
├── UPGRADING.md               ← user-facing upgrade guide (what self-heals, what needs a decision)
├── ROADMAP.md                 ← tiered enhancement plan (source of truth for "what's next")
├── CHANGELOG.md               ← shipped changes (Keep-a-Changelog format)
├── CONTRIBUTING.md            ← philosophy, how to propose changes, conventions
├── Makefile                   ← `make install` / `make package` / `make check` / `make help`
├── LICENSE                    ← MIT, copyright Eugenio Valdes
├── .gitattributes             ← marks `*.skill` archives as binary
│
├── .github/
│   ├── ISSUE_TEMPLATE/        ← bug, skill_proposal, roadmap_addition, question, config.yml
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows/check.yml    ← CI: runs `make check` on push/PR
│
├── Obsidian/Working Title/    ← the vault itself (rename freely)
│   ├── .obsidian/             ← Obsidian config, plugins
│   ├── 00_Scratchpad/
│   │   ├── Ideas/             ← raw idea notes (one example present)
│   │   └── Fragments/         ← short fragments prefixed `SS_` (one example present)
│   ├── 01_Projects/
│   │   └── Example - A City That Forgets/   ← worked example: 3-chapter short story
│   │       ├── Chapter_01.md, Chapter_02.md, Chapter_03.md
│   │       ├── README.md      ← what this example demonstrates
│   │       ├── Lore/{Maya,Zara}.md
│   │       └── _meta/
│   │           ├── atlas.md, status.md
│   │           └── warden/, quill/, lens/  ← sample agent reports
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
├── *.skill                    ← zipped distributable copies (rebuild via `make package`)
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

## 7. Current state

**Repo went public on 2026-04-25** at https://github.com/jivan0v/writers-pkm-obsidian-vault. All commits attributed to `Eugenio Valdes <fhreak@gmail.com>`. Topics: `ai-agents`, `claude-code`, `creative-writing`, `obsidian`, `pkm`, `writing-tools`.

What's actually shipped (see `CHANGELOG.md` Unreleased and `ROADMAP.md` for the full record):

**Foundations (Tier 1) — fully complete**
- 1.1 Editorial-only guardrails block at the top of every `SKILL.md`
- 1.2 `/new-project` scaffolding skill
- 1.3 `templates/` with optional-everything stubs
- 1.4 Worked example project at `Obsidian/Working Title/01_Projects/Example - A City That Forgets/` — 3 chapters + populated Atlas + Lore notes + sample Warden/Quill/Lens reports
- 1.5 `Makefile` with `make install` / `make package` / `make clean-archives` / `make help`
- 1.6 `/new-project` polish (case-insensitive collision check, `Lore/` shown for collections in plan)

**Pipeline flexibility (Tier 2) — partial**
- 2.6 Warden severity tier `Question` + Timeline section
- 2.7 Quill review-depth modes (`drafting` / `balanced` / `polish`) with `_meta/quill/config.yml` precedence

**Atlas + skill refinements (Tier 3) — partial**
- 3.5 *(partial)* Ledger reliability: three-type detection (collections via `SS_` prefix), `_Type:` trusted over re-detection, Collection status template, minute-precision timestamps (content-hash + deletion handling still open)
- 3.8 Empty-Atlas fallbacks across consumer skills + Atlas provisional voice derivation (`[provisional, derived from Ch.X–Y]`)
- 3.9 Skip-zone marker convention (`<!-- skip-start --> ... <!-- skip-end -->` plus skill-specific variants; Lens deliberately ignores them)
- 3.10 Quote-anchored findings (verbatim first-words quote + ¶ number) across Warden/Quill/Lens
- Skill-quality pass (2026-07-03): Lens cold/warm read disclosure + Ledger runs Lens in a fresh subagent; Lens collection reading-order stance; Warden in-file-only mode when Atlas absent; Warden/Lens minor-finding caps; Quill may suggest cuts + anti-thesaurus/anti-machine-tics section

**Public-repo polish (Tier 6) — mostly complete**
- 6.1 Mermaid pipeline diagram in README + prominent USAGE.md callout
- 6.2 `CONTRIBUTING.md`
- 6.3 *(partial)* `CHANGELOG.md` shipped; per-skill `version:` frontmatter still open
- 6.4 GitHub issue and PR templates under `.github/`
- 6.5 Tightened `description:` frontmatter across all six skills (consistent four-part shape: what / when / Triggers list / sequencing note)
- 6.6 Atlas `SKILL.md` path-diagram fix
- 6.7 `USAGE.md` writer's handbook
- `make check` structural lint + CI workflow (`.github/workflows/check.yml`) — verifies skill frontmatter, guardrails blocks, archive↔source sync, key paths
- `AGENTS.md` bootstrap pointer at the top of `CLAUDE.md`; `.gitattributes` for `*.skill`

`01_Projects/Example - A City That Forgets/` is the only populated project. `02_Research/` is empty (`.gitkeep` only).

## 8. What's next (from `ROADMAP.md`)

Tier-by-tier remaining work, lowest-dependency first within each:

1. **Foundations** — *fully shipped.*
2. **Pipeline flexibility** — 2.1 Pipeline Modes (Draft / Continuity / Polish / Full Audit) [unlocks 2.5 + 2.7 pipeline integration]; 2.2 Warden options + impact scope; 2.3 `/wrap` session-end skill; 2.4 Ledger dashboard refinement; 2.5 acknowledgement convention [depends on 3.10].
3. **Atlas + skill refinements** — 3.1 temporal voice evolution; 3.2 short-story/novel handling alignment; 3.3 output file accumulation policy; 3.4 multi-language personalization pattern; 3.5 Ledger reliability remainder (content-hash detection, deletion handling) [unlocks 3.6]; 3.6 Atlas watermark + incremental ingest [depends on 3.5, unlocks 3.12]; 3.7 decouple Warden→`atlas.md` writes; 3.11 Lens first/last impression + genre signaling; 3.12 Atlas moments index [depends on 3.6]. (3.10 shipped.)
4. **Obsidian leverage** — 4.1 YAML frontmatter + Dataview dashboards; 4.2 opinionated default `.obsidian/` config; 4.3 Templater note templates [depends on 4.2]; 4.4 daily-notes integration [depends on 2.3 + 4.2].
5. **Shared-universe architecture** — 5.1 `03_Universe_Atlas/` with dual ingestion; 5.2 promotion pipeline [depends on 5.1].
6. **Public-repo polish** — 6.3 per-skill `version:` frontmatter (CHANGELOG already shipped).

**Suggested next thread:** Tier 3 small items first (3.5 → 3.6 → 3.10 chain) since they're foundational refinements that unblock several downstream items. Tier 2.1 (Pipeline Modes) is the next biggest payoff but is **M**-sized.

Parked (not planned): research-folder integration, Lens reader profiles, automated skill tests, external-source import (Scrivener / Google Docs / plain text), AI-drafting support (violates principle #1).

## 9. Working conventions

### Documentation update checklist (every change)

Every change updates documentation in the same commit (or short series) as the code. Don't batch docs into a "catch-up" PR — that's how `AGENTS.md` and `USAGE.md` drift out of sync. Walk this checklist before considering work done:

| File | Trigger |
|---|---|
| `CHANGELOG.md` | **Always**, for any user-visible change. Entry under `## Unreleased`, in `### Added` / `### Changed` / `### Fixed` / `### Removed`. Reference `(ROADMAP X.Y)` if applicable. |
| `ROADMAP.md` | If shipping a roadmap item: mark `— **Shipped**` on the title line, add a `**Shipped:**` paragraph. Keep the original `**Why:**`. |
| `AGENTS.md` | If any of: shipped/remaining picture changes (§7, §8); repo layout changes (§3); skill set or pipeline changes (§4); working conventions change (§9). This is the cold-start file — keep it true. |
| `README.md` | If install path changes, pipeline diagram needs updating, "What's inside" table is stale, new top-level file added, or a user-facing feature ships. |
| `USAGE.md` | If any writer-facing behavior changes — new convention, new skill mode, new severity tier, new fallback message, new recipe. The handbook must match what the skills actually do. |
| `CLAUDE.md` | Rare. Vault structure changes, core-principle clarifications, new top-level workflow rules. |
| `UPGRADING.md` | If a change alters the format of files in users' existing vaults (`status.md`, `atlas.md`, report schemas) or requires action on upgrade. Prefer making skills self-heal old formats; document the healing here. |
| `CONTRIBUTING.md` | Only if the contributor process itself changes. |

`CONTRIBUTING.md` has the canonical version of this checklist — see "Updating documentation" there.

### Other conventions

- Each completed roadmap item ships as a single commit (or short series).
- For any **L**-sized item, scope it into sub-tasks before implementation.
- **Edit `_skill-sources/<skill>/SKILL.md`** — never edit the `.skill` archive directly.
- **Rebuild archives** after editing a skill source:
  ```bash
  make package        # rebuilds all six
  ```
- **Verify before done** — after any change to skills, archives, templates, or repo structure:
  ```bash
  make check          # frontmatter, guardrails, archive sync, key paths (CI runs this too)
  ```
- **Install / update local skills** in Claude Code:
  ```bash
  make install                              # → ~/.claude/skills/
  make install SKILLS_DIR=/tmp/test-skills  # sandbox testing
  ```
- Commit messages: short imperative subject, body explains *why*, reference `(ROADMAP X.Y)` if applicable, end with `Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>` when Claude contributed.
- See `CONTRIBUTING.md` for the full contributor protocol (principle check, sandbox testing pattern, "what this project doesn't want").

## 10. Quick start for an incoming agent

1. Read `CLAUDE.md` for any personalization the user has filled in (Language / Voice / Preferences).
2. If the user invokes `/ledger`, that skill drives the session — let it walk Atlas → Warden → Quill → Lens.
3. If the user is starting a new project, route them to `/new-project`; do not scaffold by hand.
4. Never write into `_meta/` outside of a skill run. Never generate prose without explicit confirmation.
5. When in doubt: **observe and flag, don't generate**.
