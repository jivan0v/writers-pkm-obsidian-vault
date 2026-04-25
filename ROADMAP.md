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

## Current state

- Obsidian vault skeleton: `00_Scratchpad/`, `01_Projects/`, `02_Research/`.
- Five editorial skills, run in order: **Ledger → Atlas → Warden → Quill → Lens**.
- One scaffolding skill outside the pipeline: **New Project** (`/new-project`).
- `_meta/` convention per project for agent outputs.
- `templates/` stubs (optional-everything) for `_meta/` and `Lore/` notes.
- Editorial-only guardrails block at the top of every `SKILL.md`.
- Two example notes.
- MIT licensed, genericized.
- See [CHANGELOG.md](CHANGELOG.md) for shipped changes.

Known limitations this roadmap still addresses: onboarding could go further (full example project), the pipeline is all-or-nothing, Obsidian features are under-leveraged, and shared-universe writing has only structural support so far.

---

## Tier 1 — Foundations

Lock in the core principles and lower the barrier to starting a project. Do these first.

### 1.1 Structural editorial-only enforcement — S — **Shipped**
**Why:** Current SKILL.md files describe editorial behavior but don't have absolute "never generate prose" directives at the top. Adding explicit no-prose rules + structured-output constraints (tables, checklists only, no narrative) hardens the boundary mechanically instead of behaviorally. Protects principle #1 from model drift.
**Shipped:** Each `SKILL.md` opens with a "read first" guardrails block that overrides later instructions. See `CHANGELOG.md`.

### 1.2 Project Genesis (`/new-project`) — M — **Shipped**
**Why:** Starting a novel or short story today means manually creating folders, `_meta/`, and `Lore/`. A `/new-project` skill asks for title and type (novel / short story / shared-universe short), scaffolds the folder tree, drops in minimal stub files, and hands off to `/atlas` for initialization. Can optionally delegate to Obsidian's Templater plugin for the file-creation step to keep the framework code lean.
**Depends on:** 1.3 (stub files).
**Shipped:** `_skill-sources/new-project/SKILL.md`. Confirms paths before writing, never pre-populates `Lore/`. Templater delegation deferred — direct file creation is simple enough today.

### 1.3 Minimal Lore/ and Atlas reference schemas — S — **Shipped**
**Why:** First-time users don't know what `_meta/atlas.md`, a character note, or a world-rule note should look like. Provide stub templates — but every field is **optional**. Templates describe what Atlas *can* track; writers fill in only what they know. No empty-form paralysis.

Stubs to ship:
- `atlas.md` skeleton (sections, no required entries)
- `status.md` skeleton
- Lore/ note stubs: character, location, world-rule, timeline

**Shipped:** All stubs live under `templates/`. Every field is optional.

### 1.4 Expanded example project — M
**Why:** Current example notes are one-offs. A complete tiny example — a 3-scene short story with a populated `_meta/`, a `Lore/` folder, and sample agent outputs — teaches the framework in ten minutes. The README tells; this shows.
**Depends on:** 1.3.

### 1.5 Clarify skill install in README — S — **Shipped**
**Why:** README mentioned both `_skill-sources/` folders and `.skill` archives without picking a canonical install path. Pick one (probably `~/.claude/skills/` with copy of the folder) and give exact commands. Then add a one-liner installer so users don't need to run six `cp -r` commands by hand.
**Shipped:** First pass gave explicit `cp -r` commands for every skill folder into `~/.claude/skills/`. Second pass adds a `Makefile` at the repo root with three targets: `make install` (copies all six skill folders into `~/.claude/skills/`, overridable via `SKILLS_DIR=`), `make package` (rebuilds every `.skill` archive from `_skill-sources/`), and `make clean-archives`. README install step now leads with `make install` and keeps the manual `cp -r` block as a fallback for users without `make`. Personalization section updated to point at `make install` and `make package` for redistribution.

### 1.6 `/new-project` polish — S — **Shipped**
**Why:** Two small gaps in the shipped skill. (a) Title-collision check is case-sensitive, but default macOS APFS is case-insensitive — `foo` and `Foo` would collide silently. (b) For shared-universe collections, the displayed "Will create" plan doesn't list the `Lore/` folder, so the user can't see it before confirming. Both are one-line changes.
**Shipped:** Step 2 now includes a case-insensitive collision check (with a one-paragraph rationale and a "do not auto-rename" rule). Step 3 expanded with three worked examples — novel, standalone short, shared-universe collection — so the displayed plan always shows every folder being created, including `Lore/` when it applies. `new-project.skill` archive rebuilt.

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

### 2.5 Acknowledgement convention — S
**Why:** Re-running the pipeline on the same file re-flags every minor item the writer already decided to keep. After two or three runs the system becomes nag-shaped. Each finding gets a stable id (skill + file + a hash of the issue title and paragraph anchor); the writer marks ids "acknowledged" in `_meta/<skill>/_acknowledged.md`; on re-run, agents skip acknowledged ids unless the source passage they reference has changed. Cross-skill (Warden, Quill, Lens). Pairs with 2.6 — most acknowledgements will be `Question`-tier Warden flags.
**Depends on:** 3.10 (stable paragraph anchors for ids).

### 2.6 Warden severity + timeline upgrades — S — **Shipped**
**Why:** Two upgrades to Warden's report shape, both small.
- **Third severity tier — `Question`.** Major / Minor both imply "error". Many Warden flags are genuinely ambiguous (foreshadowing? unreliable narrator? slip?). A `Question` tier separates "this is wrong" from "is this intentional?". Pairs with 2.5 — Question items are the most likely to be acknowledged once and forever.
- **Timeline section.** Travel-time and date contradictions are easier to spot visually. Add a "Timeline" subsection listing what's stated where (`Ch.1: "three days from Northgate"`, `Ch.3: "half a day from Northgate"`). Pure presentation; no new detection logic.
**Shipped:** Inconsistency schema's Severity field now reads `Major | Minor | Question`. Severity guide adds the Question tier with explicit "writer's call, not Warden's" framing and a forward reference to 2.5. New `## Timeline` section added between Retroactive Facts Detected and All Clear, with side-by-side "this file" and "established" tables; the section is omitted entirely when the chapter has no travel-time / date / duration claims. `warden.skill` archive rebuilt.

### 2.7 Quill noise-floor threshold — S — **Shipped**
**Why:** Quill has the highest finding density of any skill. A drafting writer wants only major issues; a polishing writer wants the firehose. Add a `minor-threshold` setting (project-level in `_meta/quill/config.yml`, or per-invocation flag) that controls how many minor findings Quill surfaces. Default: drafting-friendly. Polish modes (see 2.1) raise the ceiling automatically.
**Depends on:** 2.1 (so polish mode can override the default).
**Shipped:** Three review modes — `drafting` (default), `balanced`, `polish` — defined in the new "Review depth (noise floor)" section. Each mode names exactly which sections of the report it surfaces and which it suppresses. Mode is chosen in priority order: per-invocation argument → pipeline override (2.1, forward-referenced) → `_meta/quill/config.yml` → default. Major Suggestions, Voice Notes, and All Clear are always on regardless of mode. Report header now carries `_Mode: ... (source: ...)_` so the writer can see which floor was applied. `quill.skill` archive rebuilt. Pipeline-mode integration (rule 2 above) is dormant until 2.1 ships.

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

### 3.5 Ledger reliability fixes — S
**Why:** Three small but real bugs in Ledger's change detection.
- **Trust the Type field.** Ledger detects novel vs. short story by counting `.md` files, which mis-classifies shared-universe collections (many `SS_*.md` files looks like a novel). The Type is already in `status.md`, set at scaffolding time. Use it; fall back to file-count only when Type is missing.
- **Content-hash change detection.** Mtime-based detection breaks on `git checkout`, file moves, or vault copies — files appear "changed" when they aren't. Store a hash of each tracked file alongside its last-run date and compare hashes.
- **Deletion handling.** Spec is silent on what happens when a tracked file is deleted. Ledger should detect the absence, ask whether to drop the row or archive its reports under `_meta/<skill>/_archive/`, and never silently lose review history.

### 3.6 Atlas watermark + incremental ingest — M
**Why:** Atlas re-reads every chapter and every Lore/ file on every run. For long novels this is expensive. Record `last fully ingested through: Ch.7 (date)` in `atlas_history.md`; subsequent runs ingest only changed/new chapters. `Lore/` is always re-read (it's the canonical source and small). Pairs with 3.5 — uses the same content-hash mechanism.
**Depends on:** 3.5.

### 3.7 Decouple Warden writes to `atlas.md` — M
**Why:** Warden currently updates Established-Facts review status *inside* `atlas.md` — a hidden cross-skill write. If Atlas is rewriting the same file in the same session, that's a race. Refactor: Warden records completed re-checks in its own report; Atlas reads them on the next run and updates its own file. Removes a coupling and aligns with the project-wide rule that `_meta/` files are owned by exactly one skill.

### 3.8 Empty-Atlas fallbacks + provisional voice derivation — S — **Shipped**
**Why:** Writer-led + minimal-by-default means Atlas may have empty Voice profiles, no Locations, no Established Facts. Today the consumer skills (Quill especially) silently skip those checks. Two changes:
- **Explicit fallback messages.** Each consumer skill states `no Voice profile for [character]; voice-drift checks skipped` in its report rather than producing nothing. The writer learns the system *would* check this if Atlas had data.
- **Provisional voice derivation.** Atlas auto-derives a *provisional* voice profile from the first 2–3 appearances of each character and marks it `[provisional, derived from Ch.1–3]`. Pure observation — reads only what's on the page. Gives Quill something to work with from day one. Provisional profiles upgrade to permanent once the writer edits them.
**Shipped:** Atlas gains a "Provisional entries and empty fields" section: empty fields stay empty (consumers handle fallbacks); Voice is the only field eligible for provisional derivation; rules cover when to derive (≥ 2 appearances), what to derive (observable patterns only — no personality inference), the `[provisional, derived from Ch.X–Y]` marker, and the upgrade-by-edit rule. Quill, Warden, and Lens each gain explicit empty-Atlas fallback rules with concrete report-line phrasings (`X: skipped — no Y in Atlas.`). Lens falls back to direct reading when its navigation index is unavailable, and never becomes an Atlas reader as a result. All four `.skill` archives rebuilt.

### 3.9 Skip-zone marker convention — S — **Shipped**
**Why:** Quoted source material, in-world documents, intentional sentence fragments — Quill and Warden have no convention for skipping them and instead flag them as errors. Add HTML-comment markers writers can drop into prose:
- `<!-- quill: skip-start -->` … `<!-- quill: skip-end -->`
- `<!-- warden: skip-start -->` … `<!-- warden: skip-end -->`
- `<!-- skip-start -->` … `<!-- skip-end -->` (all skills)

Each skill honors the markers in its domain. Lens does *not* honor them — readers see whatever's on the page.
**Shipped:** Three marker pairs. `quill:` honored by Quill only; `warden:` honored by Warden only; generic honored by Atlas, Quill, Warden. Lens explicitly does not honor any skip marker (and the SKILL.md says so). Parsing rules formalized identically across the three honoring skills (markers on their own line; nearest-match start-to-end; no nesting; malformed markers flagged but don't fail; `_Skip zones honored: N_` recorded in the report header / `atlas_history.md` entry, omitted when zero). Inside any skipped region, suspend *all* checks for that skill — including Warden's timeline claims and Atlas's provisional-voice derivation. `atlas.skill`, `quill.skill`, `warden.skill`, `lens.skill` archives rebuilt. `USAGE.md` recipe section updated with the full pattern and example, plus two new Conventions entries for the markers and the header line.

### 3.10 Paragraph-anchored output schema — S
**Why:** Long chapters → long reports → hard to navigate. Each Warden, Quill, and Lens finding should anchor to (a) a paragraph number, (b) a short quoted snippet (≤ 12 words). Warden and Lens already do this loosely; formalize the schema across all three. Side benefit: stable paragraph anchors enable acknowledgement ids (2.5).

### 3.11 Lens reader-experience refinements — S
**Why:** Two upgrades to Lens's report shape, both reader-grounded.
- **First / last impression sections.** Opening and ending carry disproportionate weight in real reading. Add `## First impression` and `## Last impression` sections — first-person reactions to the opening and closing 1–2 paragraphs respectively. Already permitted under Lens's first-person allowance.
- **Genre signaling check.** Readers form genre expectations from the first page. If the chapter contradicts those early signals (a comic opening that pivots to horror with no setup, etc.), that's a Lens finding. Add as an explicit evaluation axis under Clarity.

### 3.12 Atlas moments index for Lens — S
**Why:** Lens's long-novel memory simulation is mechanical (read the previous 2–3 chapters in full, skim earlier). Real readers remember what *surprised* them. Have Atlas export a tiny `_meta/atlas_moments.md` — paragraph anchors only, no content (e.g. `Ch.4 ¶12 — first reveal of magic system`). Lens uses it as a navigation index, the same way it already uses Atlas for first-introductions. Stays principle-safe: Lens still reads the actual prose.
**Depends on:** 3.6 (watermark, so generation stays incremental).

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

### 6.5 Tighten skill `description:` frontmatter — S
**Why:** Current descriptions are long and stuffed with trigger phrases. The harness matches better against compact, well-structured descriptions: one sentence on what the skill does, one line on when to invoke, trigger keywords as a short list. Pass over all six skills, keeping every existing trigger word but tightening the surrounding prose.

### 6.7 Writer's Handbook (`USAGE.md`) — S — **Shipped**
**Why:** README has the install + a high-level skill table, but nothing tells a vault user *how to actually drive the system* — what review modes Quill has, what Warden's `Question` severity means, what the `[provisional, derived from Ch.X–Y]` marker on a Voice profile is asking the writer to do, what to do when Atlas is empty, etc. None of that is discoverable from the writer's side. A single `USAGE.md` aimed at an amateur user gives them one place to learn, and the file gets updated alongside each shipped skill change going forward.
**Shipped:** New `USAGE.md` at the repo root. Plain-language walkthrough of a first session; per-skill writer's view of all six skills; conventions reference (provisional markers, severity tiers, review modes, empty-Atlas fallback lines); recipe section for common situations; glossary. Back-fills writer-facing detail for everything shipped so far (6.6, 1.6, 2.6, 2.7, 3.8). README updated to link to it.

### 6.6 Atlas path-diagram fix — S — **Shipped**
**Why:** Atlas `SKILL.md` shows `Short Stories/[Story Name]/` as a subfolder, but the actual layout per `CLAUDE.md` and `README.md` is flat under `01_Projects/`. Fix the diagram. Closely related to 3.2 — bundle if 3.2 is being touched anyway.
**Shipped:** Atlas `SKILL.md` diagram now shows the three project types (novel / standalone short / shared-universe collection) flat under `01_Projects/`. The "Short Story (shared universe)" paragraph also rewritten to point at `01_Projects/<Collection>/Lore/` instead of a non-existent `Short Stories/` level. `atlas.skill` archive rebuilt.

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
