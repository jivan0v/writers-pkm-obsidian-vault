# Writer's PKM for Obsidian

A personal knowledge management setup for creative writers, built around an Obsidian vault and a pipeline of Claude Code skills that help keep long-form fiction consistent, well-edited, and readable.

If you write novels or short stories — especially across multiple projects or a shared universe — this gives you a ready-made vault layout, a place to stash ideas, and five editorial agents that know how to work together.

## What's inside

| Path | Purpose |
|---|---|
| `Obsidian/Working Title/` | The Obsidian vault. Rename the folder to whatever you like. |
| `Obsidian/Working Title/00_Scratchpad/` | Raw ideas and story fragments (`Ideas/`, `Fragments/`). Fragments are prefixed with `SS_`. Nothing here is canon yet. |
| `Obsidian/Working Title/01_Projects/` | Active writing projects. Each novel or story collection gets its own subfolder. Each novel gets a `Lore/` subfolder. |
| `Obsidian/Working Title/02_Research/` | Research notes that feed any project. |
| `_skill-sources/` | Editable source for the five core writing skills (one folder per skill, each with a `SKILL.md`). |
| `*.skill` | Packaged (zipped) distributable versions of each skill, rebuilt from the sources. |
| `CLAUDE.md` | Instructions Claude Code reads at the start of every session — vault conventions and where you personalize voice/language preferences. |

## The skill pipeline

Five Claude Code skills, each with a specific role. Invoke them with `/skillname`.

| Skill | Command | Role |
|---|---|---|
| **Ledger** | `/ledger` | Session entry point — scans for changes since last run, maintains `status.md` per project, can orchestrate the whole pipeline |
| **Atlas** | `/atlas` | Living story map — characters, locations, active threads, world rules, retroactive facts |
| **Warden** | `/warden` | Consistency checker — continuity, lore, timeline, retroactive impact |
| **Quill** | `/quill` | Prose editor — grammar, voice, vocabulary, rhythm, show-don't-tell |
| **Lens** | `/lens` | Fresh reader — clarity, pacing, emotional landing, what a first-time reader actually experiences |

**Pipeline order:** Ledger → Atlas (once per project) → Warden → Quill → Lens (per file).

A bonus skill `humanizer.skill` is also included — use it when you need to strip AI-sounding cadence from a passage.

### How they fit together

- **Atlas** is the source of truth. Warden, Quill, and Lens all read from `_meta/atlas.md`.
- **Warden** reports inconsistencies against Atlas. Retroactive facts it detects get queued back to Atlas.
- **Quill** never touches plot or continuity. It's strictly prose-level.
- **Lens** deliberately doesn't read lore or Atlas as a source — only as a table of contents. It represents the reader.
- **Ledger** tracks which files have been reviewed by which agent and when, so you know what's pending.

Each project has a `_meta/` subfolder where all four non-Ledger skills write their outputs (e.g. `_meta/warden/Chapter_03_warden.md`). Ledger owns `_meta/status.md`.

## Install

1. **Clone or generate from this repo.**
   ```bash
   git clone https://github.com/<you>/writers-pkm-obsidian-vault.git
   cd writers-pkm-obsidian-vault
   ```

2. **Open the vault in Obsidian.** Point Obsidian at `Obsidian/Working Title/` (or rename that folder first). The vault comes with sensible core plugins enabled and a few community plugins declared — Obsidian will prompt you to install them on first open.

3. **Install the skills into Claude Code.** Copy the five skill folders from `_skill-sources/` into your Claude Code skills directory (typically `~/.claude/skills/`). Alternatively, use the packaged `.skill` archives if your setup consumes them. Restart Claude Code so it picks them up.

4. **Personalize `CLAUDE.md`.** Edit it to add language preferences, voice notes, or anything you want Claude to know before it touches your writing.

5. **Delete the example notes** in `00_Scratchpad/Ideas/EXAMPLE - A City That Forgets.md` and `00_Scratchpad/Fragments/SS_ExampleFragment.md` when you're ready to start writing your own.

## A typical session

1. Run `/ledger` — it scans the vault, tells you which files have changed, and asks whether to run the full pipeline.
2. Say yes (or pick specific agents). Ledger walks Atlas once per project, then Warden → Quill → Lens per changed file.
3. Read the reports in each project's `_meta/` folder. They're markdown — open them in Obsidian alongside your draft.
4. Revise. Repeat.

## Personalization

Most of the configuration lives in `CLAUDE.md`. A common edit is adding a `## Language` section describing your primary language so Quill and Lens know to expect translation-artifact phrasing, or a `## Voice` section describing the tone you want Claude to use when responding.

The skills themselves are intentionally generic — if you want to adjust behavior (e.g. different severity thresholds, different output format), edit the corresponding `_skill-sources/<skill>/SKILL.md` and rebuild the `.skill` archive:

```bash
cd _skill-sources
zip -q ../<skill>.skill <skill>/SKILL.md
```

## License

MIT. See [LICENSE](LICENSE). Attribution is appreciated — a link back to the original repo is enough.
