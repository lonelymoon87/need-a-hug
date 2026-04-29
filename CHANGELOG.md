# Changelog

## 0.3.4

- Made the core `SKILL.md` more English-dominant for international skill marketplaces while keeping Chinese triggers and localized comfort guidance in references.
- Reworked the English and Chinese README copy to feel warmer and more invitation-based, with simpler examples that show users can send one line or directly describe the problem.
- Added language-specific README demo GIFs for one-line and problem-first usage.

## 0.3.3

- Refactored the core AgentSkill so `SKILL.md` stays under the Agent Skills recommended 500-line limit, with detailed comfort flow moved into `references/comfort-protocol.md`.
- Simplified `SKILL.md` frontmatter to the portable `name` and `description` fields while keeping MIT licensing in repository and plugin metadata.
- Added `scripts/package-release.sh` to build the drag-and-drop `.skill` asset and the Claude Code plugin zip from the expected roots.
- Fixed plugin homepage and repository metadata to point at the published GitHub repository.

## 0.3.2

- Added installable release assets: `need-a-hug.skill` for drag-and-drop skill import and `need-a-hug-claude-plugin.zip` for Claude Code plugin installs with hooks and commands.
- Updated plugin metadata version to match published releases.
- Clarified that pure skill imports do not include Claude Code hooks; hooks require the plugin or repo installer path.

## 0.3.1

- Polished Chinese comfort examples to avoid awkward translated phrasing such as "接住/被接住".
- Added English style guidance to avoid therapy-slogan phrasing like "hold space", "being held", and "seen and heard".
- Synchronized wording guidance across Codex, Cursor, Kiro, VS Code, and command prompts.
- Updated README examples and reference corpora so recommended examples use plainer, more natural language.

## 0.3.0

- Reworked the README and Chinese README around the emotional value of the skill.
- Added a slower README GIF that demonstrates an emotional shift instead of a product workflow.
- Added `scripts/install.sh` with an interactive installer and direct targets for Codex, Claude Code, Cursor, Kiro, VSCode Copilot, OpenCode, OpenClaw, Google Antigravity, and CodeBuddy.
- Simplified install and update documentation to follow the single-entry installer style used by larger skill packs.
- Tuned the comfort flow to avoid early numbered options, action menus, and advice-first replies.
- Clarified that the skill's value is emotional contact, not generic advice.
- Updated memory-aware comfort guidance to use tentative, user-provided context only.
- Removed the old project-competition example from public docs and core examples.

## 0.2.0

- Added broad platform adapters for Claude Code, Codex, Cursor, Kiro, CodeBuddy, OpenClaw, Google Antigravity, OpenCode, and VSCode Copilot.
- Added optional Claude Code hooks for distress-triggered activation, quiet comfort memory restore, and pre-compact continuity.
- Added prompt command files for `/hug`, `/need-a-hug`, `/hug:init`, and `/back-to-work`.
- Changed optional initialization to ask only for a preferred name.
- Added quiet long-term memory guidance with explicit-consent storage.
- Renamed the optional memory template away from profile language.
- Generalized the skill beyond coding: ordinary emotional support is the default, while agent/tool-caused distress is handled as one special case.

## 0.1.0

- Initial `need-a-hug` AgentSkill.
- Added comfort-first trigger and exit protocol.
- Added Chinese and English comfort language guidance.
- Added counseling-lite hidden scaffolding.
- Added optional `/hug:init` flow.
- Added README, Chinese README, and user guide.
