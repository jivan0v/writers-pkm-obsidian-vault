# Claude Instructions – Writer's PKM Workspace

> **Template note:** this file is meant to be personalized. Add a `## Language`, `## Preferences`, or `## Voice` section describing how you want Claude to respond to you, and edit the rest to match your own project setup.

## Vault Structure
This workspace contains an Obsidian vault for creative writing located at `Obsidian/Working Title/`. Rename the vault folder to whatever you like.

- `00_Scratchpad/` — Raw ideas and story fragments not yet tied to a project. Short stories here are prefixed with `SS_`. This is a staging area; nothing here is "canon" yet.
- `01_Projects/` — Active writing projects. Each novel or story collection lives in its own subfolder. **Each novel should have its own `Lore/` subfolder.**
- `02_Research/` — Research notes that feed into projects.

### Workflow
Fragments in `00_Scratchpad/` get promoted to `01_Projects/` when they become real projects. Research in `02_Research/` can feed any project.

### Short Stories vs. Novels
- Standalone short stories may not need a Lore file.
- Short stories set in a shared universe should have a shared Lore folder inside their project folder.
- Novels always get a dedicated `Lore/` folder.

## Writing Skills (Slash Commands)

A pipeline of five specialized writing skills. Invoke them with `/skillname`.

| Skill | Command | Role |
|---|---|---|
| Ledger | `/ledger` | Session entry point — scans for changes, orchestrates the pipeline |
| Atlas | `/atlas` | Living story map — characters, locations, established facts |
| Warden | `/warden` | Consistency checker — lore, continuity, retroactive facts |
| Quill | `/quill` | Prose editor — grammar, voice, vocabulary, rhythm |
| Lens | `/lens` | Fresh reader — clarity, pacing, reader experience |

**Pipeline order:** Ledger → Atlas (once per project) → Warden → Quill → Lens (per file)
