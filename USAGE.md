# Writer's Handbook

A friendly, detailed guide to using this vault as a writer.

If this is your first time, read it top to bottom — it walks you through your first session and explains every part of the system. If you've been here a while, scroll to the section you need.

If anything here doesn't match what you're seeing, the [README](README.md) has install instructions and the [ROADMAP](ROADMAP.md) lists features that are planned but not yet shipped.

---

## Table of contents

1. [What this is](#what-this-is)
2. [Before you start](#before-you-start)
3. [Your first session — a complete walkthrough](#your-first-session--a-complete-walkthrough)
4. [The vault — where things go](#the-vault--where-things-go)
5. [The six skills, one at a time](#the-six-skills-one-at-a-time)
6. [Conventions you'll see in your reports](#conventions-youll-see-in-your-reports)
7. [How to talk to the skills](#how-to-talk-to-the-skills)
8. [The `_meta/` folder — what's in it and what to leave alone](#the-_meta-folder--whats-in-it-and-what-to-leave-alone)
9. [Common situations — recipes](#common-situations--recipes)
10. [Glossary](#glossary)
11. [Where to learn more](#where-to-learn-more)

---

## What this is

You're looking at a writer's notebook — an **Obsidian vault** for keeping all your writing in one place — paired with six little assistants ("skills") that read what you write and help you keep it consistent, well-edited, and clear to a reader.

The assistants **never write your story for you.** They observe what you've written, flag things that might need attention, and suggest small refinements. The story stays yours. They're more like a careful second-reader than a co-author.

The six assistants are:

| Skill | What it does (in plain terms) |
|---|---|
| **`/new-project`** | Creates the folder for a new novel or short story. |
| **`/ledger`** | Your session check-in. Tells you what's changed since last time. Can run the rest of the pipeline for you. |
| **`/atlas`** | Keeps a living map of your story — characters, places, things you've established. |
| **`/warden`** | Checks for contradictions. *"Wait, didn't this character have green eyes in Chapter 1?"* |
| **`/quill`** | Your prose editor. Catches grammar, suggests stronger word choices, flags if a character's voice drifts. |
| **`/lens`** | Reads your chapter as if for the first time. Tells you where a reader gets confused or where pacing slows. |

You invoke them by typing a slash and the name in Claude Code: `/ledger`, `/quill`, etc.

### Three principles to keep in mind

These aren't rules for you — they're rules the system follows so you can trust it:

1. **It never writes prose for you.** Not dialogue, not outlines, not story ideas. If you ever want it to draft something, you have to ask explicitly and it will confirm.
2. **It never nags you.** Empty character sheets are fine. Unfilled fields are fine. You don't have to "set up" anything before you start writing.
3. **It learns from your text.** As you write, the system fills its map from what's actually on the page — never from what it imagines could be there.

---

## Before you start

You need:

- **Claude Code** installed and working (the CLI, desktop app, or web app — any of them is fine).
- **Obsidian** installed.
- The skills copied into your Claude Code skills folder. The [README](README.md#install) has the exact commands. After you copy them, restart Claude Code so it sees them.
- This vault opened in Obsidian. The vault folder is `Obsidian/Working Title/` — you can rename that folder to whatever you like before opening.

Don't worry about most of these once they're set up. You only redo them when you update the skills.

**You do not need:**

- Programming knowledge. You'll never type code.
- A planned story, characters, or world. You can start with a blank page.
- To fill in any templates. The system populates its records as you write.

---

## Your first session — a complete walkthrough

Let's say you want to start a novel called **The Glass Orchard**. Here's exactly what happens, step by step.

### 1. Create the project

In Claude Code, type:

```
/new-project
```

The skill asks:

> What's the project called, and is it a **novel**, a **standalone short story**, or a **shared-universe collection**?

You answer:

> The Glass Orchard, a novel.

The skill shows you exactly what it's about to create:

```
Will create:
  Obsidian/Working Title/01_Projects/The Glass Orchard/
  Obsidian/Working Title/01_Projects/The Glass Orchard/_meta/
  Obsidian/Working Title/01_Projects/The Glass Orchard/_meta/atlas.md
  Obsidian/Working Title/01_Projects/The Glass Orchard/_meta/status.md
  Obsidian/Working Title/01_Projects/The Glass Orchard/Lore/
```

It asks: *"Proceed?"*

You say **yes**. The folder appears in your vault.

**Notice what didn't happen.** It didn't ask for a synopsis. It didn't ask you to name characters. It didn't pre-fill anything inside `Lore/` — that folder is empty on purpose. You start with a blank page.

### 2. Write a chapter

Open Obsidian. Navigate to `01_Projects/The Glass Orchard/`. Create a new note called `Chapter_01.md`. Write whatever you want — a scene, an opening, a fragment. Save the file.

Nothing magic happens yet. The system is patient. It only does anything when you ask.

### 3. Run `/ledger`

When you've written enough that you want feedback (one chapter is plenty for a first run), type:

```
/ledger
```

Ledger is your **session entry point.** It looks at every project in `01_Projects/`, sees what files have changed since last time, and gives you a report like this:

```
Ledger — 2026-04-25

The Glass Orchard (Novel)
  Chapter_01.md — modified 2026-04-25, all agents pending

Ready to run pipeline? (yes / specify which / skip)
```

You can:

- Say **yes** — Ledger runs Atlas → Warden → Quill → Lens, in that order, on the changed files.
- Specify **which** — for example, *"just Quill"* or *"Atlas only"*.
- Say **skip** — you just wanted to see the status; no review this session.

### 4. Read the reports

Whichever skills you ran wrote their findings into the project's `_meta/` folder:

- `_meta/atlas.md` — the living map of your story (Atlas updates this).
- `_meta/warden/Chapter_01_warden.md` — Warden's contradictions report.
- `_meta/quill/Chapter_01_quill.md` — Quill's prose review.
- `_meta/lens/Chapter_01_lens.md` — Lens's reader-experience report.

Open whichever you want in Obsidian, alongside your draft. They're plain markdown — you read them like any other note.

You don't have to act on everything. The reports are observations and suggestions. You decide.

### 5. Revise. Repeat.

Edit your chapter based on what you found useful. Ignore what you don't agree with. Write Chapter 2. Next session, run `/ledger` again — it'll see the new chapter and the edits to the old one, and offer to re-run the pipeline on those.

That's the loop.

---

## The vault — where things go

Inside `Obsidian/Working Title/`:

```
Obsidian/Working Title/
├── 00_Scratchpad/
│   ├── Ideas/         ← raw ideas. Notes here are not yet "real" projects.
│   └── Fragments/     ← short fragments. Filenames start with `SS_`.
│
├── 01_Projects/       ← your real, active projects. One folder per project.
│   └── The Glass Orchard/
│       ├── _meta/         ← the assistants' workspace. Don't hand-edit. (More below.)
│       ├── Lore/          ← your canonical reference notes (more below).
│       ├── Chapter_01.md
│       ├── Chapter_02.md
│       └── ...
│
└── 02_Research/       ← research notes that can feed any project.
```

### `00_Scratchpad/` — the staging area

Drop ideas here when they're not yet a real project. Notes can sit in `Ideas/` indefinitely. When you turn an idea into a real project, run `/new-project` and write the manuscript in the new project folder. The scratchpad stays as your idea graveyard / brainstorming yard.

### `01_Projects/` — where the writing lives

Every novel and every short story (or short-story collection) lives in its own folder here. The structure depends on the type:

**Novel** — folder contains `_meta/`, `Lore/`, and your chapter files (`Chapter_01.md`, `Chapter_02.md`, …).

**Standalone short story** — folder contains `_meta/` and one main `.md` file (no `Lore/` by default — short stories usually don't need one).

**Shared-universe collection** (multiple short stories in the same world) — folder contains `_meta/`, one shared `Lore/` for the universe, and one file per story (filenames start with `SS_`).

### `Lore/` — your canonical notes

`Lore/` is where you write reference notes about your world: character backgrounds, place descriptions, magic-system rules, anything that lives outside the manuscript itself.

These are notes **you write**, in any format you like. The system reads them but never modifies them. There are stub templates under `templates/Lore/` (one for characters, one for locations, one for world rules, one for timelines) — copy them in when you need them, leave any field blank, fill the rest. Or write your lore notes from scratch. Both fine.

### `02_Research/` — where you stash research

Real-world references, articles, photos, anything you're using as source material. Currently no skill reads from here automatically — it's a notebook for you. (Future plan: have Atlas optionally consult it.)

---

## The six skills, one at a time

This is the longest section. Read it all once, then come back to a specific skill when you need a refresher.

For each skill: **what it does** → **when to run it** → **what to expect in the report** → **things you should know about it.**

---

### `/new-project` — Scaffolder

**What it does.** Creates the folder for a new project. Asks for a title and a type, shows you the exact paths it will create, waits for your confirmation, then makes the folder.

**When to run it.** Once, at the start of a novel or a short story.

**What to expect.** A short Q&A — title, type, "proceed?" — then your project folder appears with empty `_meta/` files inside (and an empty `Lore/` for novels and collections).

**Things you should know:**

- It will **never** create a chapter file or an opening paragraph for you. You write the first sentence.
- It will **never** pre-populate `Lore/` with character or location stubs. The folder is empty on purpose. When you meet a new character in your draft and want to write a note about them, copy `templates/Lore/character.md` into your `Lore/` folder and fill in whatever you know.
- If you give it a title that already exists (even with different capitalization — "Foo" vs. "foo"), it stops and asks. It will not silently overwrite or merge into an existing project.
- After it's done, it tells you to run `/atlas` when you've written something to map. You don't have to run Atlas right away — you can write the whole first chapter first.

---

### `/ledger` — Session entry point

**What it does.** Scans every project in `01_Projects/` to see which files have changed since the last run, then offers to run the editorial pipeline on those files. Maintains a per-project status file (`_meta/status.md`) so it always knows where you left off.

**When to run it.** At the start of every writing session — or whenever you want a "what's pending?" overview. Think of it as the dashboard.

**What to expect.** A short report listing each project, which files have changed, and which assistants haven't reviewed them yet. Then a prompt asking what to do.

```
Ledger — 2026-04-25

The Glass Orchard (Novel)
  Chapter_03.md — modified 2026-04-25, all agents pending
  Chapter_01.md — Warden re-check pending (Elena spy fact)

Brass Saints (Short Story)
  Brass Saints.md — up to date ✓

Ready to run pipeline? (yes / specify which / skip)
```

**Things you should know:**

- "All agents pending" means none of Atlas, Warden, Quill, or Lens has reviewed this version of the file yet.
- "Warden re-check pending (X)" means Atlas noticed a fact you established in a later chapter that might affect earlier ones, and Warden needs to look at the affected chapters again. (See [Retroactive facts](#retroactive-facts) under the Atlas section.)
- "Up to date ✓" means nothing has changed since the last run for that file.
- You can ask Ledger to run only specific assistants. *"Just Warden"* is a perfectly valid response. So is *"only Quill on Chapter_03"*.
- Ledger never edits your story files. It only reads modification times and updates its own status file.

---

### `/atlas` — Living story map

**What it does.** Reads your chapters and your `Lore/` files and maintains a single up-to-date snapshot of your story world: who's where, what's true, what's established. The other assistants consult Atlas to do their jobs.

**When to run it.** Once at the start of a project (after you've written your first chapter or two), then again whenever you want the map updated. Ledger can do this for you when you run the pipeline.

**What to expect.** Atlas writes to two files:

- **`_meta/atlas.md`** — the current state. Sections for Characters, Locations, Active Threads, World Rules, and Established Facts. You can read it any time you want a cheat-sheet of your own story.
- **`_meta/atlas_history.md`** — an append-only log of changes made each session. You probably won't read this often, but it's there if you want to see when a fact entered the story.

A character entry in `atlas.md` looks something like:

```markdown
### Elena Voss
- **Location:** Northgate (Ch.3)
- **Appearance:** Tall, dark hair cut short, scar across left palm.
- **Status:** Alive, traveling east.
- **Knows:** That the abbot is her uncle (Ch.2).
- **Voice:** Direct, contraction-heavy, short declarative sentences. `[provisional, derived from Ch.1–3]`
  - **Speech markers:** Often opens with "Look,". Drops articles in moments of stress. `[provisional, derived from Ch.1–3]`
- **Relationships:** Estranged from her brother Pell.
```

**Things you should know:**

- **Empty fields are fine.** If your character's appearance hasn't been established on the page, the field stays blank or says `— not yet established —`. Atlas will fill it in when you write something that establishes it.
- **Sourced from your text.** Every fact in Atlas has a chapter reference (`Ch.3`) or a Lore reference. If a fact has no source, it's a bug — Atlas isn't supposed to invent.
- **You can ask Atlas questions.** *"What does Atlas say about Elena?"* or *"Where is Pell right now?"* are valid prompts. It reads from `atlas.md` and answers; if the answer isn't there, it tells you so.
- **Lore wins over chapters.** If a fact you wrote in `Lore/` contradicts something in a chapter, Atlas flags it for Warden rather than silently overwriting. You decide which version is canonical.

#### The `[provisional, derived from Ch.X–Y]` marker — important

If Atlas notices a character has appeared in two or more chapters with dialogue but you haven't filled in their **Voice** profile, it may write a *provisional* one based on patterns it observed in your text — sentence length, contraction usage, recurring phrases.

Provisional means: *"This is my best guess from what's on the page. Edit it freely."*

You handle a provisional profile in two ways:

1. **Leave it as-is.** Atlas extends it on later runs as more chapters appear. Quill uses it as a baseline for voice-drift checks but flags drift conservatively (because it's a sample, not your final word).
2. **Edit it and remove the marker.** Once you delete the `[provisional, derived from Ch.X–Y]` text, that field becomes **permanent** and Atlas will never overwrite it on future runs. This is how you say "yes, this is the official voice for this character."

You don't have to do anything with provisional markers right away. They're a courtesy; you address them whenever you feel you know the character well enough.

#### Retroactive facts

Sometimes you write a fact in Chapter 5 that quietly changes earlier chapters. *"Elena was a spy all along."*

Atlas notices. It adds the fact to its **Established Facts** section, marks the affected earlier chapters as needing a re-check, and tells Warden, *"hey, look at Ch.1 and Ch.2 again with this in mind."*

You don't have to do anything special — just write whatever you write. The system catches it.

---

### `/warden` — Consistency checker

**What it does.** Reads a file and checks whether anything in it contradicts what Atlas (or earlier chapters) established. Character locations, eye colors, who knows what, travel times, world rules.

**When to run it.** After Atlas, before Quill and Lens. Or via Ledger, which orders things automatically.

**What to expect.** A report at `_meta/warden/<filename>_warden.md` with sections like:

```markdown
# Warden Report — Chapter_03.md

## Inconsistencies Found

### Elena's eye color
- **Location in text:** "Her grey eyes caught the lantern light—" (¶7)
- **Issue:** Described as "grey" here; established as "green" in Ch.1 ¶2.
- **Atlas reference:** Characters → Elena → Appearance ("green eyes, green-grey in low light").
- **Severity:** Minor
- **Suggested resolution:** Either reconcile to "green" or add a beat acknowledging the lighting.

## Retroactive Facts Detected
### Elena was a spy
- **Statement:** Elena reveals (Ch.3 ¶22) she has been working for the abbot all along.
- **Likely affects:** Ch.1, Ch.2
- **Note for Atlas:** add to Established Facts and queue re-checks

## Timeline
**This file:**
| Where | Claim |
|---|---|
| Ch.3 ¶4 | "three days from Northgate to the abbey" |

**Established (from Atlas / prior chapters):**
| Where | Claim |
|---|---|
| Ch.1 ¶7 | "Northgate sits a week's ride from the abbey" ← contradicts Ch.3 ¶4 |

## All Clear
- Character locations: ✓
- Knowledge consistency: ✓
- World rules: ✓
```

**Things you should know:**

#### Severity tiers — three of them

Each issue is marked one of:

- **Major** — directly breaks the story for a reader. Character is in two places. Stated dialogue contradicts an established truth. Needs fixing.
- **Minor** — small detail drift. Slightly different eye color, a small inconsistency in speech. Worth noting, won't break anything.
- **Question** — *something* is off, but Warden can't tell whether it's an error or intentional. Foreshadowing? Unreliable narrator? A character lying? **The call belongs to you, not to Warden.** When you decide *"yes, that was on purpose"*, the system is set up so Warden won't keep raising the same Question every time you re-run.

Use Question to your advantage: it's a low-pressure way for Warden to flag *"hey, take a look — but I'm not saying you're wrong."*

#### The Timeline section

Warden adds a **Timeline** section to the report whenever your chapter contains travel-time or date claims. It lists what you said where, side-by-side with what's already been established. If there's a contradiction, you'll see it visually before you read the issue list.

If your chapter has no timeline claims, the Timeline section is just omitted.

#### What Warden won't do

- It won't rewrite your prose. That's Quill's job.
- It won't decide for you whether an inconsistency is a mistake. It flags; you decide.
- It won't generate a fix-it paragraph. It'll suggest *what* to reconcile, never *how* to phrase it.

---

### `/quill` — Prose & grammar editor

**What it does.** Reads a file and offers prose-level suggestions: grammar, vocabulary, sentence rhythm, dialogue naturalness, character-voice consistency, show-don't-tell. Targeted, sentence-sized suggestions. Never a full rewrite.

**When to run it.** After Warden (so consistency comes first), before Lens. Or via Ledger.

**What to expect.** A report at `_meta/quill/<filename>_quill.md`.

```markdown
# Quill Review — Chapter_03.md
_Date: 2026-04-25_
_Mode: drafting (source: default)_

## Major Suggestions

### Tense slip
- **Location:** "The abbot crossed the courtyard before dawn—" (¶4)
- **Issue:** Past tense breaks to present mid-paragraph.
- **Suggestion:** Either commit to present (rare for this novel) or revert to past.

## Voice Notes

### Elena — Ch.3 ¶12
- **As written:** "I am very much aware of my obligations."
- **Atlas voice / speech markers:** Direct, contraction-heavy, short declarative sentences. `[provisional baseline]`
- **Suggestion:** "I know what I owe." (provisional baseline — flag conservatively)

## All Clear
- Grammar: ✓
- POV: ✓
```

**Things you should know:**

#### Review modes — pick your noise floor

Quill has three modes that control how much it surfaces. Same skill, different volume.

| Mode | What you get |
|---|---|
| **`drafting`** *(default)* | Major Suggestions, Voice Notes, All Clear. Minor notes, vocabulary alternatives, and phrasing suggestions are suppressed. Right for early drafts. |
| **`balanced`** | Adds the top ~10 minor notes, top ~8 phrasing rows, top ~8 vocabulary rows. Right for mid-draft revision. |
| **`polish`** | The full firehose. Every suggestion. Right for the final pass before you show someone. |

The default is `drafting` — Quill will not bury you in minor stuff while you're still figuring out the chapter.

**To change modes:**

- **Per-invocation.** Tell Quill in your prompt: *"run quill in polish mode"* or *"quill, balanced".*
- **Per-project.** Drop a tiny config file at `_meta/quill/config.yml`:

  ```yaml
  mode: polish
  ```

  Quill reads it on every run for that project. Delete the file or change the value to switch modes.

The report header always tells you which mode was used and where the setting came from (`drafting (source: default)` vs. `polish (source: argument)` vs. `balanced (source: config)`).

#### Voice consistency

Quill compares each character's dialogue and inner monologue against the **Voice** profile in `atlas.md`.

- **No Voice profile yet?** Quill says so explicitly in the report — *"Elena: no Voice profile in Atlas; voice-drift checks skipped."* You then know to either (a) write more chapters so Atlas can derive a provisional profile, or (b) write the Voice field in `atlas.md` yourself.
- **Provisional profile?** Quill uses it but flags drift conservatively, with a `(provisional baseline)` note so you know the comparison is tentative.
- **Permanent profile?** Standard checks apply. Anything that drifts gets flagged.

#### What Quill won't do

- It won't rewrite paragraphs. Suggestions are word-level or sentence-level.
- It won't change your story's meaning, just its expression.
- It won't reshape your authorial voice. It only flags drift from patterns *you've* already established.
- It won't catch plot holes — that's Warden.
- It won't tell you whether the chapter makes sense to a first-time reader — that's Lens.

---

### `/lens` — Fresh-reader perspective

**What it does.** Reads your chapter as if encountering it for the first time. No Atlas, no Lore, no editorial frame. Reports clarity, pacing, emotional landing — the reader's experience.

**When to run it.** Last in the pipeline. After Atlas, Warden, Quill.

**What to expect.** A report at `_meta/lens/<filename>_lens.md`.

```markdown
# Lens Report — Chapter_03.md
_Date: 2026-04-25_
_Read: cold_
_Reading position: read Ch.1–2 in full before this_

## Reader Confusion Points

### Who is Pell?
- **Location:** "Pell was waiting at the gate when—" (¶1)
- **Issue:** Pell is named in the first line of the chapter as if I should know who he is. I don't think we've met him on the page. I went back to check — no, he's not in Ch.1 or Ch.2.
- **Severity:** Major
- **Suggestion:** Either introduce Pell with a beat of context here, or add him to an earlier chapter.

## Pacing Notes

### The market scene drags
- **Location:** "The market unfolded in rows of salt-fish—" (¶8–14)
- **Observation:** Six paragraphs of stalls and sounds before anything happens. I felt my attention drift around ¶12.

## What Works
- The opening image of the broken lantern lands. I can see it.
- The dialogue in ¶17–22 feels tense without telling me it's tense.

## Overall impression
The chapter has a strong texture but I'm a little adrift on stakes. By the end I know something has shifted but I can't say what.
```

**Things you should know:**

#### Lens deliberately does *not* read your lore

This is the cleverest part of the design. Lens is the reader. A reader hasn't read your character bible. So Lens *won't* either.

- It does **not** read `_meta/atlas.md` as a source of facts.
- It does **not** read `Lore/`.
- It does **not** read other agents' reports.

The only exception: for very long novels, Lens may peek at Atlas as a *navigation index* — to find "where was Pell first introduced?" — and then go read that specific passage in the chapter file. It uses Atlas like a table of contents, never as a source of knowledge.

If something only makes sense because you've read your own backstory notes, Lens flags it. That's the whole point.

#### How Lens handles long novels

For early chapters (Ch.1–5 or so), Lens reads every preceding chapter in full to build accurate reader memory.

For later chapters (Ch.6+), real readers have lossy memory — they remember the broad strokes and the most recent chapters. Lens simulates this:

- Reads the **2–3 chapters immediately before** the one under review in full.
- Reads only first/last paragraphs of earlier chapters, plus passages where key characters or rules were first introduced.

If Atlas is empty or missing, Lens falls back to direct reading and notes that in the report header.

#### Severity — Major and Minor only

Two tiers here (no Question — Lens is reading as a reader, not interrogating intent):

- **Major** — a reader would stop, reread, and remain confused, or disengage. Something is missing or unclear in a way that breaks the reading experience.
- **Minor** — a reader might feel a small friction. Worth flagging but unlikely to lose them.

#### What Lens won't do

- Won't propose replacement text or rewritten openings.
- Won't fix prose — that's Quill.
- Won't check continuity — that's Warden.
- Won't summarize the story. The "Overall impression" at the end is short and reader-shaped — what lingered, what feeling you left them with.

---

## Conventions you'll see in your reports

A short reference list of things you'll encounter in `_meta/` files.

### `[provisional, derived from Ch.X–Y]`

A marker on a Voice / Speech-marker field in `atlas.md`. Means Atlas filled it in based on observed patterns from the chapters in that range. **You upgrade it to permanent by editing the field and removing the marker.**

### `(provisional baseline)`

A prefix Quill uses on voice notes when it's comparing against a provisional Atlas profile. Means *"flagging this conservatively because the baseline is a sample, not your final word."*

### Severity: Major / Minor / Question

- **Major** — definite issue, fix it (or decide intentionally not to).
- **Minor** — small detail, worth noting.
- **Question** — Warden only. *"Is this intentional?"* The call is yours.

### Mode: drafting / balanced / polish

Quill's review depth. See [Review modes](#review-modes--pick-your-noise-floor) above.

### `Reading position: ...`

In Lens reports. Tells you what Lens read before the chapter under review (e.g. *"read Ch.1–2 in full"*, *"read Ch.5–6 in full + skim Ch.1–4"*).

### `X: skipped — no Y in Atlas.`

In any report. Means the assistant *would* have checked X but Atlas didn't have the data, so it didn't pretend. The fix is usually to fill in the missing Atlas section (or write more chapters so Atlas can populate itself).

### `"first words of the paragraph—" (¶7)`

Location reference: a short verbatim quote of the paragraph's opening words, plus the paragraph number. The quote is the real anchor — paragraph numbers go stale as soon as you revise, but the quoted words survive edits and stay searchable. Used everywhere the assistants point at a specific spot in your text.

### `_Read: cold_` / `_Read: warm — prior story context in session_`

Header line in Lens reports. *Cold* means Lens read your chapter with no prior story knowledge in the session — a true fresh-reader pass. *Warm* means the session already contained Atlas or Lore content (typical mid-pipeline), so treat "fresh reader" reactions with a grain of salt. Ledger runs Lens in a separate context when it can, precisely to keep reads cold.

### `(depends on reading order)`

A tag on Lens confusion points in shared-universe collections. The passage leans on another story in the universe; if readers are guaranteed to read in order, you can dismiss it.

### `<!-- skip-start -->` / `<!-- skip-end -->` (and `quill:` / `warden:` variants)

HTML-comment markers you can drop into your prose to hide a passage from editorial review. The generic pair hides from Atlas, Quill, and Warden — the typical choice for in-world documents. Skill-specific variants hide from one skill only. **Lens never skips** — it reads whatever a reader would see. See ["My chapter has a quoted letter / in-world document"](#my-chapter-has-a-quoted-letter--in-world-document-and-quill-keeps-flagging-it) for the full pattern.

### `_Skip zones honored: N_`

Header line in Quill and Warden reports (and a similar line in Atlas's session entry in `atlas_history.md`). Tells you how many skip-zone pairs the skill detected and respected. The line is omitted when N is zero. If you placed a skip zone and don't see this line, double-check your marker spelling.

---

## How to talk to the skills

You invoke a skill by typing `/<name>` in Claude Code. After that, conversation is just conversation.

### Common patterns

**Just check what's pending:**
```
/ledger
```

**Run the full pipeline on everything that's changed:**
```
/ledger
> yes
```

**Run a single skill on a specific file:**
```
/quill on Chapter_03
```
or
```
/warden, check Chapter_03 only
```

**Change Quill's review mode for one run:**
```
/quill on Chapter_03 in polish mode
```

**Ask Atlas a question:**
```
/atlas — what does it say about Elena?
```
or
```
/atlas, where is Pell right now?
```

**Get a quick consistency check while drafting (no Quill, no Lens):**
```
/warden on Chapter_03
```

You don't need exact phrasing. The skills understand natural requests. If something's ambiguous, they ask.

### What if you want the system to actually write something?

The default posture is editorial — never generates prose. If you genuinely want something drafted (a sample paragraph in a voice you've established, a dialogue line for testing), you have to ask explicitly. The skill will confirm before producing anything. This is on purpose — keeps the story yours by default.

---

## The `_meta/` folder — what's in it and what to leave alone

Every project has a `_meta/` folder. The skills write all their outputs there.

```
_meta/
├── atlas.md             ← Atlas writes this
├── atlas_history.md     ← Atlas appends here (audit trail)
├── status.md            ← Ledger writes this
├── quill/
│   ├── config.yml       ← OPTIONAL, you write this
│   └── Chapter_03_quill.md  ← Quill writes these
├── warden/
│   └── Chapter_03_warden.md ← Warden writes these
└── lens/
    └── Chapter_03_lens.md   ← Lens writes these
```

### Read them freely. Edit them carefully.

You can open any `_meta/` file and read it like any other markdown note. That's how you consume the skills' output.

But by default, **don't hand-edit them.** The next pipeline run will overwrite or conflict with your changes. Two exceptions:

1. **`_meta/quill/config.yml`** — this one is *yours*. You write it. Quill reads it. Editing it is how you change the review mode persistently.
2. **`atlas.md`** — you may edit it to upgrade a provisional profile to permanent (delete the `[provisional, ...]` marker). Beyond that, prefer to make changes in your manuscript or in `Lore/` and let Atlas pick them up on the next run.

### If you want to change a fact

Don't edit `atlas.md` directly to change a character's eye color. Change the eye color in your manuscript (or in your `Lore/` notes), then re-run Atlas. The map will update, and Warden will catch any earlier chapter that still has the old color.

The principle: **the manuscript and `Lore/` are the source. `_meta/` is the index.** Edit the source; let the index regenerate.

---

## Common situations — recipes

### "I just finished Chapter 3, what do I do?"

```
/ledger
> yes
```

Ledger sees the new chapter, runs Atlas → Warden → Quill → Lens, and drops four reports into `_meta/`. Open them in Obsidian alongside your draft.

### "I just want a quick check, not a full review"

```
/warden on Chapter_03
```

Or, while you're still drafting:

```
/quill on Chapter_03 in drafting mode
```

(Drafting mode is the default, so you can leave the "in drafting mode" off — just stating it for clarity.)

### "Quill is too noisy for me right now"

You're already in drafting mode by default. If you've changed it, set it back per-run:

```
/quill on Chapter_03 in drafting mode
```

Or persistently — drop `_meta/quill/config.yml` into the project:

```yaml
mode: drafting
```

### "I want to see everything Quill can find"

```
/quill on Chapter_03 in polish mode
```

Or set `mode: polish` in `_meta/quill/config.yml` for that project.

### "Warden flagged something I meant on purpose"

Right now: just acknowledge it mentally and move on. Warden will keep flagging it on re-runs.

Coming soon (ROADMAP 2.5): an acknowledgement convention so you can mark an item *"yes, intentional, stop bringing it up"* and Warden will respect it. For now, look for `Severity: Question` items — those are the ones most likely to be intentional, and they're explicitly framed that way so you know Warden isn't insisting.

### "I changed my mind about Elena's eye color in Chapter 5"

Edit Chapter 5 (or the rest of the manuscript) so the new color is consistent. Re-run Atlas and Warden:

```
/ledger
> yes
```

Atlas updates the map. Warden flags Chapter 1, 2, 3, 4 as needing re-check (they still have the old color). Edit those, re-run, and the warnings clear.

### "I want to see a list of every character I've written"

```
/atlas — list all characters
```

Or just open `_meta/atlas.md` directly. It has a Characters section.

### "How do I introduce a new short story to my shared-universe collection?"

The collection is one project folder. Create a new `SS_<StoryName>.md` file inside it directly — `/new-project` is for *new* projects, not new stories within an existing collection. The shared `Lore/` already exists.

### "I see `[provisional, derived from Ch.1–3]` on Elena's voice. What do I do?"

Two options:

1. **Nothing.** Atlas keeps refining it as you write more. Quill uses it cautiously.
2. **Make it official.** Open `_meta/atlas.md`, find Elena's Voice and Speech markers fields, edit them to your liking, and **delete the `[provisional, ...]` marker.** That tells Atlas "this is final — don't overwrite." Quill then treats voice-drift normally for Elena.

### "Atlas said `Character consistency: skipped — no Characters in Atlas.` What does that mean?"

It means Atlas hasn't been run yet (or was run on an empty project). The fix is to run `/atlas`, which will populate the Characters section from your chapters. Then re-run Warden.

### "My chapter has a quoted letter / in-world document and Quill keeps flagging it"

Wrap the passage in skip markers. They're HTML comments — they render invisibly in Obsidian, so your reader never sees them.

Three flavors:

| Marker pair | Hides the passage from |
|---|---|
| `<!-- quill: skip-start -->` … `<!-- quill: skip-end -->` | Quill only. Use when only prose review is the problem (e.g. a deliberately fragmented passage). |
| `<!-- warden: skip-start -->` … `<!-- warden: skip-end -->` | Warden only. Use when "facts" inside the passage are intentionally non-canon (an unreliable narrator's account, a character's lie). |
| `<!-- skip-start -->` … `<!-- skip-end -->` | Atlas, Quill, *and* Warden. Use for in-world documents — letters, articles, transcripts — where everything inside the passage is non-canon and shouldn't be reviewed for prose either. **This is usually what you want for in-world documents.** |

**Lens still reads everything.** Lens is your reader, and a reader sees what's on the page. Skip markers don't hide passages from Lens.

Example, an in-world letter inside Chapter 3:

```markdown
She unfolded the letter and read.

<!-- skip-start -->
> *Dearest Pell — by the time you read this I will be at the abbey,
> and you will know what I have been. I am sorry. — E.*
<!-- skip-end -->

She refolded it. Twice. Three times.
```

Atlas won't record "Elena is at the abbey" as a fact (the letter is in-world, possibly a lie). Warden won't flag a continuity error. Quill won't critique the prose of the letter. Lens still reads it as the reader does.

After a run, the report header tells you how many skip zones were honored:

```
_Skip zones honored: 1_
```

If the line is missing, no skip zones were detected (or you used the wrong marker — check your typing).

**A few rules:**

- Put each marker on its own line. Mid-paragraph markers work in a pinch but reports may be slightly less precise.
- Don't nest the same marker type — a second `<!-- skip-start -->` before the matching `<!-- skip-end -->` is malformed. The skills will note malformed markers in their reports without failing.
- Different marker types don't interact. A `quill: skip` zone inside a generic `skip` zone is fine; both apply.

---

## Glossary

**Atlas** — The "living map" of your story. Both the skill and the file `_meta/atlas.md` it maintains.

**Canon** — Facts that are "true" in your story world. Drawn from your `Lore/` files and the chapters themselves.

**Editorial-only** — The system never generates prose. It observes, flags, and suggests. The story is yours to write.

**Established Fact** — A continuity-critical fact that spans multiple chapters. Tracked in Atlas. A change to one of these triggers Warden re-checks on affected chapters.

**Ledger** — Your session entry point. Detects what's changed and orchestrates the rest.

**Lens** — The fresh-reader skill. Reads as if for the first time.

**Lore** — Your reference notes. Lives in `Lore/` inside each project. You write these by hand; the skills read them but never modify them.

**`_meta/`** — The folder where the assistants write their outputs. Per-project. Don't hand-edit (with two small exceptions; see above).

**Mode** *(Quill)* — The review depth. `drafting` / `balanced` / `polish`.

**Pipeline** — The ordered sequence Ledger runs: Atlas → Warden → Quill → Lens.

**Provisional** — A field Atlas filled in for you based on observed patterns. Marked with `[provisional, derived from Ch.X–Y]`. You upgrade to permanent by editing the marker out.

**Quill** — The prose-and-grammar skill.

**Retroactive fact** — A fact established in a later chapter that affects earlier ones. Atlas catches these and queues affected chapters for Warden re-check.

**Severity** *(Warden)* — One of `Major`, `Minor`, `Question`. Question is the *"is this intentional?"* tier.

**Source of truth** — Atlas. The other skills consult it; nothing is canon unless it's there.

**Voice profile** — A character's speech-pattern snapshot in Atlas. Used by Quill to flag dialogue drift.

**Warden** — The continuity / lore checker.

---

## Where to learn more

- **[README](README.md)** — installation, project description, install-path commands.
- **[ROADMAP](ROADMAP.md)** — what's planned, what's shipped, what's parked.
- **[CHANGELOG](CHANGELOG.md)** — history of every shipped change, in writer-readable terms.
- **[CLAUDE.md](CLAUDE.md)** — instructions Claude Code reads at the start of every session. You personalize the bottom three sections (Language / Voice / Preferences).
- **`_skill-sources/<skill>/SKILL.md`** — the actual instructions each skill follows. Usually you don't need to read these, but they're plain markdown if you ever want to know exactly how an assistant decides what to do.

If something here is wrong, missing, or confusing, this file gets updated alongside every skill change. Check the [CHANGELOG](CHANGELOG.md) for recent edits, or the [ROADMAP](ROADMAP.md) for what's coming.
