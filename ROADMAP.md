# Roadmap

Planned and possible enhancements to the writer's PKM framework. Doubles as a GitHub roadmap — anyone following the project can see what's coming and propose additions via issues or PRs.

Organized by priority tier. Each item includes a short rationale, a rough size (**S** ≤ half a day, **M** a day or two, **L** a week or more), and dependencies where relevant.

---

## Guiding principles

Every enhancement in this roadmap has to respect these:

1. **Editorial only.** The pipeline never generates prose, dialogue, outlines, or story ideas. Its job is to observe, flag, and suggest refinements to writing the user has already drafted.
2. **Writer-led.** The system never blocks progress. It surfaces information on demand; it does not demand information from the writer.
3. **Minimal by default.** Templates and schemas describe what can be tracked, not what must be filled in. Writers discover characters, places, and rules as they write — the framework supports that, it does not force completeness.
4. **Context-aware assistant, not rigid pipeline.** The long-term direction is a system that adapts to where the writer is in the process, not one that runs every agent on every file every time.

---

## Current state (v0.1)

- Obsidian vault skeleton: `00_Scratchpad/`, `01_Projects/`, `02_Research/`.
- Five editorial skills, run in order: **Ledger → Atlas → Warden → Quill → Lens**.
- `_meta/` convention per project for agent outputs.
- Two example notes.
- MIT licensed, genericized.

Known limitations this roadmap addresses: onboarding is thin, `Lore/` structure is under-specified, the pipeline is all-or-nothing, Obsidian features are under-leveraged, shared-universe writing has no support, and the editorial-only boundary is a matter of skill prose rather than structural enforcement.

---

## Tier 1 — Foundations

Lock in the core principles and lower the barrier to starting a project. Do these first.

### 1.1 Structural editorial-only enforcement — S
**Why:** Current SKILL.md files describe editorial behavior but don't have absolute "never generate prose" directives at the top. Adding explicit no-prose rules + structured-output constraints (tables, checklists only, no narrative) hardens the boundary mechanically instead of behaviorally. Protects principle #1 from model drift.

### 1.2 Project Genesis (`/new-project`) — M
**Why:** Starting a novel or short story today means manually creating folders, `_meta/`, and `Lore/`. A `/new-project` skill asks for title and type (novel / short story / shared-universe short), scaffolds the folder tree, drops in minimal stub files, and hands off to `/atlas` for initialization. Can optionally delegate to Obsidian's Templater plugin for the file-creation step to keep the framework code lean.
**Depends on:** 1.3 (stub files).

### 1.3 Minimal Lore/ and Atlas reference schemas — S
**Why:** First-time users don't know what `_meta/atlas.md`, a character note, or a world-rule note should look like. Provide stub templates — but every field is **optional**. Templates describe what Atlas *can* track; writers fill in only what they know. No empty-form paralysis.

Stubs to ship:
- `atlas.md` skeleton (sections, no required entries)
- `status.md` skeleton
- Lore/ note stubs: character, location, world-rule, timeline

### 1.4 Expanded example project — M
**Why:** Current example notes are one-offs. A complete tiny example — a 3-scene short story with a populated `_meta/`, a `Lore/` folder, and sample agent outputs — teaches the framework in ten minutes. The README tells; this shows.
**Depends on:** 1.3.

### 1.5 Clarify skill install in README — S
**Why:** README mentions both `_skill-sources/` folders and `.skill` archives without picking a canonical install path. Pick one (probably `~/.claude/skills/` with copy of the folder) and give exact commands.

---

## Tier 2 — Pipeline flexibility

Make the pipeline match how writing actually happens — not every file needs every agent every session.

### 2.1 Pipeline Modes — M
**Why:** The current fixed order (Ledger → Atlas → Warden → Quill → Lens) assumes every session is a full audit. In practice a writer wants: a quick continuity check during drafting, a polish pass before showing a friend, a full audit before a milestone. Ledger gets mode support:

- **Draft Mode** — Atlas only. Light, fast, non-intrusive.
- **Continuity Pass** — Atlas + Warden.
- **Polish Pass** — Quill + Lens.
- **Full Audit** — everything.

Writers stay in control of the depth of review.

### 2.2 Warden: options-based output with impact scope — S
**Why:** Current Warden output has one suggested resolution. Upgrade to: exact conflict + 2–3 resolution options + explicit impact scope (which chapters/scenes are affected by each option). Transforms Warden from "flagger" into "actionable editorial assistant." Still editorial — offering continuity fixes is not generative.

### 2.3 `/wrap` — session-end skill — S
**Why:** `/ledger` is the entry ritual. There's no exit ritual. `/wrap` summarizes what was written this session, notes loose ends for next time, updates a session log, and optionally commits to the private writing repo. Makes sessions feel complete and hands off context cleanly to the next one.

### 2.4 Ledger dashboard refinement — S
**Why:** Ledger already tracks status, changes, and pending work. Its report can feel more like a dashboard: what changed, what's pending by agent, what's blocked, what the next best step is. Not a new skill — a presentation upgrade to Ledger's existing output.

---

## Tier 3 — Atlas and skill refinements

Sharpen the existing skills without expanding scope.

### 3.1 Temporal awareness + voice evolution — S
**Why:** Atlas records facts with "Established Ch.X" and maintains `atlas_history.md` but voice profiles and character traits are static. In long novels characters grow — their voice, knowledge, and behavior legitimately evolve. Atlas should version voice/trait entries by chapter range so Quill doesn't flag a developed character's changed speech as inconsistency.

### 3.2 Short-story vs novel handling alignment — S
**Why:** All five skills mention both forms but hand-off logic is uneven — Ledger treats short stories as single units, Atlas structures their `_meta/` slightly differently, Lens applies different scrutiny. Align the conventions across all skills so the distinction is consistent.

### 3.3 Output file accumulation policy — S
**Why:** Skill sources don't specify whether `_meta/warden/Chapter_03_warden.md` is overwritten per run or appended. Over time `_meta/` either loses history or gets cluttered. Pick a policy (suggested: overwrite current, archive previous to `_meta/<skill>/_archive/<date>/`).

### 3.4 Multi-language personalization pattern — S
**Why:** Earlier draft had Spanish-specific notes baked into skills. We removed them for the public template. But the underlying need — translation-artifact awareness for non-native-English writers — is real. Add a clean, generic pattern: user declares a `writing-support-languages` list in CLAUDE.md; Quill and Lens reference that variable instead of hard-coding any language.

---

## Tier 4 — Obsidian leverage

The vault ships with minimal Obsidian configuration. The biggest win/cost ratio in the whole roadmap lives here.

### 4.1 YAML frontmatter + Dataview dashboards — M
**Why:** With YAML frontmatter on Lore files (`type: character`, `status: alive`, `location: x`), Dataview queries render live dashboards: all active characters by location, open plot threads, timeline events, character arcs per chapter. The vault becomes a queryable knowledge system instead of a folder of notes. **Guard rail:** frontmatter fields must degrade gracefully. Missing fields do not break queries.

### 4.2 Opinionated default `.obsidian/` config — M
**Why:** Ship with sensible core + community plugins enabled: longform (manuscript assembly), dataview (queries), templater (templates), word-count. A first-time user gets a working writing environment on open — no plugin hunt.

### 4.3 Note templates for common types — S
**Why:** Obsidian templates (Templater) for character, location, world-rule, chapter, scene, session log. Keep minimal per principle #3 — a character template has 2 required lines and 8 optional ones.
**Depends on:** 4.2.

### 4.4 Session log / daily notes integration — M
**Why:** A writer tracking daily practice wants word count, what they worked on, what's next. Obsidian daily notes + a session-log template + `/wrap` output = automatic session tracking. Pair `/wrap` with this so each session produces a dated log entry.
**Depends on:** 2.3, 4.2.

---

## Tier 5 — Shared universe architecture

Support writers with multiple stories in the same world.

### 5.1 `03_Universe_Atlas/` with dual ingestion — M
**Why:** Atlas is strictly per-project today. Writers with shared universes (multiple short stories in one world) have no single source of truth for shared characters and rules. Add a top-level `03_Universe_Atlas/` folder; when Ledger runs, Atlas and Warden ingest facts from both the project's local `Lore/` *and* the universe-level folder. **Conflict handling:** flag conflicts for the writer to resolve; never override silently — some divergence is intentional (alternate timelines, "what if" stories).

### 5.2 Promotion pipeline — S
**Why:** When a local character or rule becomes permanent to the broader universe, "promotion" is just moving the `.md` file from the project's `Lore/` up to `03_Universe_Atlas/`. Elegant because it uses Obsidian's file-centric nature — no new machinery. Document the move as a convention and offer a helper.
**Depends on:** 5.1.

---

## Tier 6 — Public repo polish

Items that matter because the repo is public, not because they change the writing workflow.

### 6.1 Architecture diagram in README — S
**Why:** A diagram of the skill pipeline and `_meta/` data flow communicates more than paragraphs. Place near top of README.

### 6.2 `CONTRIBUTING.md` — S
**Why:** Standard for public repos. How to propose skill changes, rebuild `.skill` archives, style conventions for SKILL.md files.

### 6.3 `CHANGELOG.md` + skill versioning — S
**Why:** As skills evolve, users should see what changed. Semver at the repo level; each skill's frontmatter gets a `version` field.

### 6.4 Issue / PR templates — S
**Why:** Nudges good bug reports and skill-proposal PRs. Small investment, ongoing payoff.

---

## Future considerations (not planned, maybe later)

Noticed during planning; not committed. Listed so we don't forget.

- **Research folder (`02_Research/`) integration** — no skill currently consults it; the right approach isn't clear yet. Parked until a use case sharpens.
- **Reader Profiles for Lens** (Fast / Detail-Oriented / Genre-Savvy) — interesting, possibly premature. A single competent reader is what Lens provides; revisit if a specific need appears.
- **Automated skill tests** — verify skills still behave after edits. Overkill for a solo project; relevant when a second contributor appears.
- **External source import** (Scrivener, Google Docs, plain text) — onramp for writers with existing drafts. Bigger project than it sounds.
- **AI-assisted drafting support** — if the framework ever embraces AI-drafted passages, a humanizer-style skill would belong in the public set. Currently out of scope per principle #1.

---

## Working method

Tackle one tier at a time. Inside a tier, do lowest-dependency items first. For any **L** item, spend a session scoping it into sub-tasks before implementation.

Each completed item ships as a single commit (or a short series). Once 6.3 lands, every item also gets a CHANGELOG entry.
