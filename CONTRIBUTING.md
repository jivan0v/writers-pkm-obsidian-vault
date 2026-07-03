# Contributing

Thanks for your interest. This is a small, opinionated project — a writer's PKM framework built around an Obsidian vault and six Claude Code skills. The bar for contributions is "does this make the writer's experience better without violating the core principles?" If yes, open an issue or a PR.

## Core principles (read first)

Every change has to respect these. They're load-bearing — they shape what the framework is and isn't.

1. **Editorial only.** The skills never generate prose, dialogue, outlines, premises, or story ideas. Their job is to observe, flag, and suggest refinements to writing the user has already drafted. Any feature that produces creative content for the writer is out of scope. (See the "Editorial-only guardrails" block at the top of every `SKILL.md`.)
2. **Writer-led.** The system never demands input from the writer. It surfaces information when asked, never nags. Empty fields are fine. Templates describe what *can* be tracked, not what must be filled in.
3. **Minimal by default.** Templates and schemas describe possibilities, not requirements. Don't add fields, sections, or steps that the writer must complete. Add gracefully-degrading defaults instead.

If a proposed change can't be done without breaking one of these, it doesn't belong here. Some interesting ideas have been parked in `ROADMAP.md` under "Future considerations" for exactly this reason.

## Project layout (orientation)

- `_skill-sources/<skill>/SKILL.md` — the canonical source for each skill. **This is what you edit.**
- `*.skill` (at repo root) — packaged zip archives of each skill folder. **Don't edit these directly** — they're built from the sources via `make package`.
- `Obsidian/Working Title/` — the vault that ships with the framework, including the worked example project under `01_Projects/`.
- `templates/` — optional-everything stub files copied by `/new-project`.
- `CLAUDE.md` — project-wide instructions Claude Code reads at the start of every session.
- `USAGE.md` — the writer's handbook. End-user-facing.
- `ROADMAP.md` — what's coming, organized by tier and dependency.
- `CHANGELOG.md` — what's shipped, in Keep-a-Changelog format.

## How to propose a change

### Bug fixes, typos, doc clarifications
Open a PR directly. Keep the diff minimal. Reference any related issue.

### New skill behavior or new skill
1. **Open an issue first.** Describe the use case, why existing skills don't cover it, and how it respects the three core principles. Wait for a thumbs-up before writing code — the maintainer may have context you don't.
2. If it's a roadmap item, link to the section. If it's not, propose adding it to the roadmap.
3. Once aligned, open a PR.

### Roadmap additions
Open an issue with a draft entry that follows the existing roadmap item shape: title, **Why** (the rationale), size estimate (S / M / L), and dependencies if any.

## Editing a skill

1. Edit `_skill-sources/<skill>/SKILL.md`. Never edit the `.skill` archive directly.
2. Keep the **editorial-only guardrails block** at the top of the file. It's the structural enforcement of principle #1; later instructions don't override it.
3. The frontmatter `description:` field follows a four-part shape: (1) one sentence on what the skill does, (2) one sentence on when to invoke, (3) a quoted `Triggers:` list of phrases users might say, (4) a sequencing note where pipeline order matters. Tightness wins — Claude Code matches better against compact, structured descriptions.
4. **`_meta/` files are agent-owned.** If your change makes a skill write to a file owned by another skill, that's a coupling — refactor instead. (See ROADMAP 3.7 for an example.)
5. Test locally before committing. Install your edits into a sandbox with:

   ```bash
   make install SKILLS_DIR=/tmp/test-skills
   ```

   That keeps your real `~/.claude/skills/` install untouched. To install the edits for real:

   ```bash
   make install
   ```

6. Rebuild the affected `.skill` archive:

   ```bash
   make package
   ```

   Commit the source change *and* the rebuilt archive together so distributed copies stay in sync.

7. Run the structural lint before opening the PR (CI runs the same check):

   ```bash
   make check
   ```

   It verifies frontmatter, the guardrails block, ownership contracts, archive↔source sync, and key repo paths.

## Updating documentation

**Every change updates documentation.** Skipping this is the most common gap in contributions, so before opening a PR, walk this checklist and update every file whose trigger condition is met.

| File | When to touch it |
|---|---|
| **`CHANGELOG.md`** | **Always**, for any user-visible change. Add an entry under `## Unreleased` in `### Added` / `### Changed` / `### Fixed` / `### Removed`. Reference the ROADMAP item id at the end if applicable, e.g. `(ROADMAP 3.9)`. |
| **`ROADMAP.md`** | If the change ships a roadmap item: append `— **Shipped**` to the item's title line, then add a `**Shipped:**` paragraph describing what landed. Keep the original `**Why:**` text — it documents the original rationale. |
| **`AGENTS.md`** | If any of: the shipped/remaining picture changes (§7, §8); repo layout changes (§3); skill set or pipeline changes (§4); working conventions change (§9). This is the file an incoming agent reads first — it must reflect reality. |
| **`README.md`** | If any of: install path changes; pipeline diagram needs updating; the "What's inside" table is out of date; a new top-level file is added; a new user-facing feature is shipped. |
| **`USAGE.md`** | If any writer-facing behavior changes — new convention (e.g. skip-zone markers), new skill mode (e.g. Quill review modes), new severity tier (e.g. Warden's `Question`), new fallback message, new recipe. The handbook must stay in sync with what the skills actually do. |
| **`CLAUDE.md`** | Rare. Touch only if vault structure changes, a core principle is clarified, or a new top-level workflow rule applies to every session. |
| **`UPGRADING.md`** | If your change alters the format of files in users' existing vaults (`status.md`, `atlas.md`, report schemas) or requires action on upgrade. Prefer teaching the skill to self-heal the old format; document the healing here. |
| **`CONTRIBUTING.md`** | Only if the contributor process itself changes — new tooling, new conventions, new "what won't land" entries. |

If the change isn't on the roadmap, skip the ROADMAP update — but the CHANGELOG entry is still required, and the AGENTS / README / USAGE check still applies.

**Order matters:** update the docs in the same commit (or short series) as the code change. Don't batch documentation into a separate "docs catch-up" PR — that's how AGENTS.md drifts out of sync with reality.

## Commit messages

Short, imperative subject line. One blank line. Wrapped body explaining *why*, not *what* (the diff shows the what). Reference roadmap items when relevant. Example:

```
Add skip-zone marker convention (ROADMAP 3.9)

Three HTML-comment marker pairs let writers hide passages from editorial
review without affecting how the manuscript renders in Obsidian. Inside
a skipped region, the affected skills suspend all checks. Lens
deliberately does NOT honor markers — readers see whatever's on the page.
```

If you're including PR co-author trailers (Claude Code, etc.), keep them at the end of the message body.

## Style notes for SKILL.md files

- Markdown-only. No HTML except the skip-zone markers (`<!-- skip-start -->` etc.).
- Use the existing section ordering as a template: guardrails → role → invocation → output schema → edge cases.
- Prefer short, concrete examples over abstract description. Writers using these skills are looking for "what does this look like in practice."
- Match the voice of the existing skills — terse, instructional, no marketing tone.

## What this project doesn't want

To save everyone time, here are some change types that won't land:

- **AI-drafted prose features** — humanizers, prose generators, dialogue suggestions. Out of scope per principle #1.
- **Required fields in templates** — anything that adds friction to a writer who just wants to draft. Out of scope per principle #2/#3.
- **Per-skill configuration that has to be set before first use** — defaults must be sensible. Configuration is opt-in.
- **External service integrations** (cloud storage, Linear, Notion, etc.) without a clear writer-facing benefit. The vault is local-first.
- **Heavy test suites or release tooling for v0** — overkill for a solo project. The structural lint (`make check`) and its one-job CI workflow are the intended ceiling here; behavioral skill tests and release automation wait until a second contributor appears.

## Questions?

Open an issue with the `question` label. Maintainer response time isn't guaranteed but is usually within a few days.
