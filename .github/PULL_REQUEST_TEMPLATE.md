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

- [ ] Source edited under `_skill-sources/<skill>/SKILL.md` (not the `.skill` archive directly)
- [ ] `make package` run if any skill source changed; rebuilt archive committed
- [ ] `CHANGELOG.md` entry added under `## Unreleased`
- [ ] `ROADMAP.md` updated if this ships a roadmap item (mark **Shipped**, add **Shipped:** paragraph)
- [ ] Tested locally (`make install SKILLS_DIR=/tmp/test-skills` for sandbox testing)

## Notes for reviewer

<!-- Optional. Anything you want me to look at specifically, edge cases you considered, or follow-up work. -->
