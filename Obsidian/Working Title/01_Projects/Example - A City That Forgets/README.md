# A City That Forgets — Example Project

This is a worked example for the Writer's PKM framework. It demonstrates:

- A complete 3-chapter short story (standalone)
- A populated `_meta/atlas.md` with characters, locations, and established facts
- A `Lore/` folder with character notes and writing questions
- Sample outputs from the Warden, Quill, and Lens skills

## How to read this

1. **Start with the story itself:** Read `Chapter_01.md`, `Chapter_02.md`, `Chapter_03.md` in order. It's a short story about memory, identity, and medical ethics in a city where daily amnesia is the default. (~3000 words total.)

2. **Check the Atlas:** Open `_meta/atlas.md`. This is what an Atlas looks like after a writer has been working on a project. It tracks characters, their voice profiles, locations, and established facts. Notice that:
   - Not all fields are filled in (the not-husband is never named—intentionally)
   - Voice profiles include both permanent notes and provisional entries (Zara's was derived from her appearances)
   - Established Facts are tied to world-building, not just plot

3. **Browse Lore notes:** Open `Lore/Maya.md` and `Lore/Zara.md`. These are character deep-dives written by the author, separate from what the Atlas tracks. They include voice/speech analysis, relationship notes, and questions for revision.

4. **Read the Warden output:** Open `_meta/warden/Chapter_03_warden.md`. This shows what Warden reports when it reviews a chapter. Notice that it:
   - Flags ambiguities as Questions (not errors)
   - Suggests what to reconcile without drafting replacement prose
   - Acknowledges intentional choices (like the unnamed not-husband)

5. **Read the Quill output:** Open `_meta/quill/Chapter_03_quill.md`. This shows how Quill critiques prose. Notice that:
   - Major suggestions focus on *showing* rather than *telling*
   - Voice notes track consistency across the chapter
   - The feedback is actionable but leaves the final choice to the writer

6. **Read the Lens output:** Open `_meta/lens/Chapter_03_lens.md`. This is what a fresh reader experiences. Notice that:
   - It starts and ends with the emotional arc, not the plot
   - Clarity notes are about reader experience, not correctness
   - It acknowledges what *works* as much as what's unclear

## Why this example?

This story was chosen because it:

- **Demonstrates one project type clearly:** It's a standalone short story with named sections, so the example stays small while still exercising Atlas, Warden, Quill, and Lens.
- **Includes intentional craft choices:** The unnamed not-husband, Zara's precocious voice, the "fractured" metaphor—these are deliberate decisions for the skills to interact with.
- **Shows realistic agent outputs:** The Warden, Quill, and Lens reports model what these skills actually produce. They're not perfect critiques; they're working-draft feedback.
- **Demonstrates the framework without overwhelming:** Three short chapters means a reader can absorb the whole story and all its feedback in one sitting.

## How to use this for your own writing

1. Copy the `_meta/status.md` template for your project.
2. Write your story in the main folder (one file per chapter or section).
3. Run `/ledger` when you're ready for feedback. It will walk you through Warden, Quill, and Lens.
4. Read the outputs in `_meta/` alongside your drafts in Obsidian.
5. Decide what to revise. Not every flag is a bug; some are questions only you can answer.
6. Update your `Lore/` notes as you learn more about your characters and world.

## Removing the example

When you're ready to use the framework for your own writing, you can:

- Delete this entire project folder (`01_Projects/Example - A City That Forgets/`)
- Create a new project with `/new-project`
- Start fresh with your own story

The example will stay in the public repo as a reference.
