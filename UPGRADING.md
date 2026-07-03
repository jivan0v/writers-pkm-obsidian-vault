# Upgrading

How to bring an existing vault and skill install up to the current version. Written for writers, not developers — the short version is: pull, reinstall the skills, run `/ledger`, and let the system update its own files.

Versions aren't tagged yet, so these steps apply from *any* earlier state of the repo.

## The four steps

```bash
cd <your-clone>
git pull
make install        # replaces the skills in ~/.claude/skills/
```

Then **restart Claude Code / Cowork** so it picks up the new skills, and run `/ledger`.

That's it for most people. The rest of this file explains what happens next and the two situations that need a human decision.

## What updates itself

The `_meta/` files in your projects are agent-owned, and the updated skills know how to modernize them. You don't need to edit anything by hand:

- **`status.md`** — Ledger upgrades entries to minute-precision timestamps (`YYYY-MM-DD HH:MM`) as it rewrites them. Old date-only entries are treated conservatively: any file modified on its recorded date counts as pending. **Expect your first `/ledger` run after upgrading to flag more files than usual** — that's deliberate, not a bug. Let the pipeline run once and the statuses settle.
- **`atlas.md`** — Atlas normalizes legacy header vocabulary (e.g. `Shared-Universe Short` → `Shared-Universe Collection`) on its next update. Your facts, characters, and voice profiles are untouched.
- **Warden / Quill / Lens reports** — regenerated wholesale on the next review of each file, in the current format: findings anchored to verbatim quotes instead of bare paragraph numbers, Lens's `_Read: cold / warm_` header, capped minor findings. Warden retroactive re-check completions now live in Warden reports and are absorbed by Atlas on the next Atlas run instead of Warden editing `atlas.md` directly. Old reports aren't migrated — they're simply replaced when each file is next reviewed.

Your manuscripts, `Lore/` files, and scratchpad are never touched by an upgrade. Only `_meta/` changes, and only through the skills.

## What needs a human decision

**1. You customized your installed skills.** `make install` *replaces* the copies in `~/.claude/skills/` — including any personal edits you made there (a tweaked description, a changed threshold). Before installing, check what you'd lose:

```bash
diff -r ~/.claude/skills/quill _skill-sources/quill
```

If you have customizations, re-apply them on top of the new sources (edit `_skill-sources/<skill>/SKILL.md`, then `make install`). Per-project config like `_meta/quill/config.yml` is not affected — only the skill files themselves.

**2. You hand-edited `_meta/` files.** The skills will overwrite manual edits on their next run, same as always. If you wrote something in an `atlas.md` or `status.md` that matters, move it into the manuscript or `Lore/` before running the pipeline — Atlas picks it up from there.

## What's new for you as a writer

The full record is in [CHANGELOG.md](CHANGELOG.md); the changes you'll actually notice:

- **Findings quote your text.** Reports anchor to the first words of the paragraph (`"The abbey gates were already shut when—" (¶12)`) so notes stay findable after you revise.
- **Lens tells you how fresh its eyes were.** `_Read: cold_` means a true first read; `_Read: warm_` means the session already contained story context. Pipeline runs now use a separate context for Lens to keep reads cold.
- **Same-day edits are tracked.** Write in the morning, review at noon, revise in the evening — Ledger now sees the evening edit.
- **Collections are first-class.** Shared-universe collections get their own status tracking and are no longer mistaken for novels.
- **Warden works without Atlas.** No Atlas yet? Warden offers an in-file-only review instead of refusing.
- **Quill can suggest cutting things**, and has standing orders not to thesaurus-ify your plain words.
- **Skill ownership is cleaner.** Warden, Quill, and Lens write reports only. Ledger marks per-file review status, and Atlas updates its own Established Facts review status from Warden's completed re-check notes.

## If something looks wrong

Run `make check` in the repo — it verifies the skills and archives are intact and in sync. If a report or status file looks mangled after an upgrade, delete it and re-run the relevant skill; every `_meta/` file can be regenerated from your manuscript and `Lore/`.
