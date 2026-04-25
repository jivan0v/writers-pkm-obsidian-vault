SKILLS_DIR ?= $(HOME)/.claude/skills
SKILLS := ledger atlas warden quill lens new-project

.PHONY: help install package clean-archives

help:
	@echo "Writer's PKM — make targets"
	@echo ""
	@echo "  make install         Copy every skill folder into $(SKILLS_DIR)"
	@echo "                       (override with: make install SKILLS_DIR=/path)"
	@echo "  make package         Rebuild every <skill>.skill archive from _skill-sources/"
	@echo "  make clean-archives  Remove every <skill>.skill archive at the repo root"
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
