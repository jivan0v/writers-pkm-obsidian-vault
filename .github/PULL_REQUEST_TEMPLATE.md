<!-- Thanks for the PR. Keep this short — the diff already shows the *what*. Use this template to explain the *why* and confirm the principle check. -->

## What this PR does

<!-- One paragraph. -->

## Related

<!-- Issue number if any. ROADMAP item id if applicable (e.g. ROADMAP 3.9). -->

Closes #

## Principle check

For changes that touch a skill or add behavior. Skip if this is purely docs / typos / tooling.

- [ ] **Editorial only** — no prose generation, no story content
- [ ] **Writer-led** — no required input, no nags, no blocking
- [ ] **Minimal by default** — sensible defaults, opt-in configuration

## Checklist

**Code / build:**
- [ ] Source edited under `_skill-sources/<skill>/SKILL.md` (not the `.skill` archive directly)
- [ ] `make package` run if any skill source changed; rebuilt archive committed
- [ ] Tested locally (`make install SKILLS_DIR=/tmp/test-skills` for sandbox testing)

**Documentation** (see [CONTRIBUTING.md → Updating documentation](../CONTRIBUTING.md#updating-documentation) for triggers):
- [ ] `CHANGELOG.md` — entry added under `## Unreleased` (always required for user-visible changes)
- [ ] `ROADMAP.md` — marked **Shipped** with a `**Shipped:**` paragraph (if this ships a roadmap item)
- [ ] `AGENTS.md` — §7 / §8 / §3 / §9 updated if the shipped picture, repo layout, or working conventions changed
- [ ] `README.md` — updated if install, pipeline diagram, "What's inside" table, or a user-facing feature changed
- [ ] `USAGE.md` — updated if any writer-facing behavior changed (new convention, mode, severity tier, recipe)
- [ ] `CLAUDE.md` — updated if vault structure, a core principle, or a top-level workflow rule changed (rare)

## Notes for reviewer

<!-- Optional. Anything you want me to look at specifically, edge cases you considered, or follow-up work. -->
