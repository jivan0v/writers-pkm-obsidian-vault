# Roadmap

This document tracks planned and possible enhancements to the writer's PKM framework. It doubles as a GitHub roadmap — anyone following the project can see what's coming and propose additions via issues or PRs.

The roadmap is organized by priority tier, then by theme. Each item lists a short rationale, a rough size (**S** ≤ half a day, **M** a day or two, **L** a week or more), and dependencies where relevant.

---

## Current state (v0.1)

- Obsidian vault skeleton with three top-level areas: `00_Scratchpad/`, `01_Projects/`, `02_Research/`.
- Five editorial skills forming a pipeline: **Ledger → Atlas → Warden → Quill → Lens**.
- `_meta/` folder convention per project for agent output (atlas.md, status.md, warden/, quill/, lens/).
- Two example notes demonstrating conventions.
- MIT licensed, genericized for any writer.

Known limitations the rest of this roadmap aims to address: the pipeline is editorial-only (no pre-writing help), onboarding is thin, `Lore/` structure is under-specified, and there's no scaffolding to start a new project cleanly.

---

## Tier 1 — Next up

Highest-value items for making the framework actually usable end-to-end. Do these first.

### 1.1 Project initializer skill (`/new-project`) — M
**Why:** Right now starting a new novel or short story means manually creating folders, `_meta/`, `Lore/`, and a stub `atlas.md`. A `/new-project` skill would scaffold the whole structure, ask for the title and type (novel / short story / shared-universe short), and drop in skeleton files. Lowers friction dramatically for a writer starting something new.
**Depends on:** 1.2 (templates).

### 1.2 `_meta/` and `Lore/` templates — S
**Why:** First-time users don't know what `_meta/atlas.md`, `_meta/status.md`, or a Lore character doc should look like. Skills generate Atlas/status on the fly but a user-facing template makes the conventions legible before the first run. Provide stub templates for: `atlas.md`, `status.md`, and common Lore files (character, location, world-rule, timeline).

### 1.3 Expanded example project — M
**Why:** The current example notes are standalone one-liners. A complete tiny-but-real example project — say, a 3-chapter fake short story with a populated `_meta/`, a `Lore/` folder, and sample agent outputs — would teach the framework in ten minutes. Today's README tells; this would show.
**Depends on:** 1.2.

### 1.4 Clarify skill install in README — S
**Why:** The README mentions both the `_skill-sources/` folders and the `.skill` archives. Claude Code has a specific, documented location for user skills (`~/.claude/skills/`) and a specific consumption format. The README should pick one canonical path and give exact copy/paste commands — not leave it to interpretation.

---

## Tier 2 — Pipeline gaps

The current pipeline covers everything *after* a draft exists. Writers also need help before a draft exists.

### 2.1 Pre-writing skill: `/outliner` or `/planner` — L
**Why:** Before writing Ch.3, a novelist often wants to outline beats, pick a POV, sketch the arc, list what needs to happen. No skill in the pipeline helps with this — Atlas only updates *after* writing. An `/outliner` could take a project + target chapter/scene and return a structured plan that respects Atlas, active threads, and character state.
**Depends on:** Atlas being current.

### 2.2 Session-end skill: `/wrap` — S
**Why:** `/ledger` is the entry ritual but there's no exit ritual. A `/wrap` skill could: summarize what was written this session, update a session log, flag loose ends for next time, and optionally auto-commit to the private writing repo. Makes each session feel complete.

### 2.3 Research integration — M
**Why:** `02_Research/` exists as a folder but no skill interacts with it. Warden could consult research when checking factual consistency (real-world accuracy for historical/scientific details). Atlas could reference research documents without copying them. A lightweight convention for linking a research note to a project would be enough.

### 2.4 Cross-project / shared-universe Atlas — M
**Why:** A writer with a shared universe (multiple short stories set in the same world) has no single source of truth for shared characters and world rules. Atlas is strictly per-project. A project-group–level "shared Atlas" that individual project Atlases extend from would close this gap.

---

## Tier 3 — Skill refinements

Improvements to existing skills, driven by rough edges in the current sources.

### 3.1 Uneven short-story vs novel handling — S
**Why:** All five skills mention both forms but the hand-off logic is inconsistent — e.g. Ledger treats short stories as single units but Atlas structures a short-story `_meta/` differently than a novel `_meta/`. Align the conventions.

### 3.2 Voice evolution tracking in Atlas — S
**Why:** Atlas records "Voice" and "Speech markers" once per character. In long novels, voices legitimately evolve as characters develop. Quill currently compares dialogue to a static voice profile, which produces false positives after a character has grown. Atlas should version voice profiles by chapter range.

### 3.3 Output file accumulation policy — S
**Why:** Skill sources don't specify whether `_meta/warden/Chapter_03_warden.md` is overwritten on each run or appended. Over time `_meta/` will either lose history or get cluttered. Pick a policy (suggest: overwrite current, archive previous into `_meta/<skill>/_archive/` with date).

### 3.4 Bring back multi-language support, properly generic — S
**Why:** We stripped Spanish-specific paragraphs during genericization, but the *need* for translation-artifact awareness is real for any non-native-English writer. Add a clean pattern: a user sets their writing-support languages in CLAUDE.md, and skills reference that variable instead of hard-coding one language.

### 3.5 Parameterize Lens's long-novel reading strategy — S
**Why:** Lens hard-codes "read 2–3 chapters before the current one in full, skim the rest." Different writers at different points want different fidelity. Let Lens take an optional depth argument.

---

## Tier 4 — Obsidian leverage

The vault ships with minimal Obsidian configuration. Several Obsidian features are under-used.

### 4.1 Opinionated default `.obsidian/` config — M
**Why:** Ship with sensible core + community plugins enabled by default (suggest: longform for manuscript formatting, dataview for progress queries, templater for note scaffolding, word-count). A first-time user gets a working environment on open.

### 4.2 Note templates for common types — S
**Why:** Provide Obsidian templates (via templater or as `.md` stubs) for: character, location, world-rule, chapter, session log. Pairs well with 1.2.

### 4.3 Session log / daily notes integration — M
**Why:** A writer tracking daily practice wants word count, what they worked on, what's next. Obsidian's daily notes plugin + a session-log template + `/wrap`'s output could make session tracking automatic.
**Depends on:** 2.2.

---

## Tier 5 — Public repo polish

Items that matter because the repo is public, not because they improve the writing workflow directly.

### 5.1 `CONTRIBUTING.md` — S
**Why:** Standard for public repos. Documents how to propose skill changes, how to rebuild `.skill` archives, code/prose conventions for SKILL.md files.

### 5.2 Architecture diagram in README — S
**Why:** A diagram of the skill pipeline and `_meta/` flow is worth a thousand words of explanation. Put it near the top of README.

### 5.3 `CHANGELOG.md` and skill versioning — S
**Why:** As skills evolve, users should see what changed. Adopt semver at the repo level; each skill's frontmatter gets a version field.

### 5.4 Issue/PR templates — S
**Why:** Nudges good bug reports and skill-proposal PRs. Small investment, ongoing payoff.

---

## Future considerations (not planned, maybe later)

Things noticed during the review that could matter eventually but aren't worth committing to now:

- **AI-assist integration / humanizer** — if the framework ever embraces AI-drafted passages, a humanizer-style skill belongs in the public set. Right now it stays in the private vault.
- **External source import** (Scrivener, Google Docs) — a path to get existing drafts into the vault structure.
- **Word-count / milestone tracking** — may already be solved well enough by existing Obsidian plugins; revisit if not.
- **Automated skill tests** — a way to verify the five skills still work after edits. Probably overkill until a second person is contributing.

---

## Working method

Tackle one tier at a time. Inside a tier, pick the lowest-dependency item first. For any **L** item, spend a session scoping it into sub-tasks before implementation.

Each completed item should ship as a single commit (or a small series), with a CHANGELOG entry once 5.3 lands.
