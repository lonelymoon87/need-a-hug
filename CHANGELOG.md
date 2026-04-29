# Changelog

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
