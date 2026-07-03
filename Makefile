SKILLS_DIR ?= $(HOME)/.claude/skills
SKILLS := ledger atlas warden quill lens new-project

.PHONY: help install package clean-archives check

help:
	@echo "Writer's PKM — make targets"
	@echo ""
	@echo "  make install         Copy every skill folder into $(SKILLS_DIR)"
	@echo "                       (override with: make install SKILLS_DIR=/path)"
	@echo "  make package         Rebuild every <skill>.skill archive from _skill-sources/"
	@echo "  make clean-archives  Remove every <skill>.skill archive at the repo root"
	@echo "  make check           Structural lint: frontmatter, guardrails, archive sync, key paths"
	@echo "  make help            Show this message"

install:
	@mkdir -p "$(SKILLS_DIR)"
	@for skill in $(SKILLS); do \
		echo "  → $$skill"; \
		rm -rf "$(SKILLS_DIR)/$$skill"; \
		cp -r "_skill-sources/$$skill" "$(SKILLS_DIR)/"; \
	done
	@echo "Installed $(words $(SKILLS)) skills into $(SKILLS_DIR)."
	@echo "Restart Claude Code to pick them up."

package:
	@cd _skill-sources && for skill in $(SKILLS); do \
		echo "  → $$skill.skill"; \
		rm -f "../$$skill.skill"; \
		zip -q "../$$skill.skill" "$$skill/SKILL.md"; \
	done
	@echo "Rebuilt $(words $(SKILLS)) archives at the repo root."

clean-archives:
	@for skill in $(SKILLS); do rm -f "$$skill.skill"; done
	@echo "Removed $(words $(SKILLS)) archives."

check:
	@fail=0; \
	for skill in $(SKILLS); do \
		src="_skill-sources/$$skill/SKILL.md"; \
		if [ ! -f "$$src" ]; then echo "FAIL  $$skill: $$src missing"; fail=1; continue; fi; \
		grep -q "^name: $$skill$$" "$$src" \
			|| { echo "FAIL  $$skill: frontmatter 'name:' missing or does not match folder name"; fail=1; }; \
		grep -q "^description:" "$$src" \
			|| { echo "FAIL  $$skill: frontmatter 'description:' missing"; fail=1; }; \
		grep -qi "guardrails (read first)" "$$src" \
			|| { echo "FAIL  $$skill: editorial-only guardrails block missing"; fail=1; }; \
		if [ -f "$$skill.skill" ]; then \
			unzip -p "$$skill.skill" "$$skill/SKILL.md" 2>/dev/null | cmp -s - "$$src" \
				|| { echo "FAIL  $$skill: $$skill.skill is out of sync with $$src (run 'make package')"; fail=1; }; \
		else \
			echo "FAIL  $$skill: $$skill.skill archive missing (run 'make package')"; fail=1; \
		fi; \
	done; \
	for path in "templates/_meta/atlas.md" "templates/_meta/status.md" "templates/Lore" \
			"Obsidian/Working Title/00_Scratchpad" "Obsidian/Working Title/01_Projects" \
			"Obsidian/Working Title/02_Research" "AGENTS.md" "USAGE.md" "UPGRADING.md" "ROADMAP.md" "CHANGELOG.md"; do \
		[ -e "$$path" ] || { echo "FAIL  key path missing: $$path"; fail=1; }; \
	done; \
	if [ "$$fail" -eq 0 ]; then \
		echo "OK    $(words $(SKILLS)) skills: frontmatter, guardrails, archive sync"; \
		echo "OK    key paths present"; \
	else \
		echo ""; echo "make check failed."; exit 1; \
	fi
