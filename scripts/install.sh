#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_DIR="$PWD"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/install.sh <target> [--project <dir>]

Targets:
  codex        Install skill and prompt commands to ~/.codex
  claude       Install skill to ~/.claude
  cursor       Install Cursor rule into a project
  kiro         Install Kiro steering and skill files into a project
  vscode       Install VSCode Copilot instruction and prompt into a project
  opencode     Install skill to ~/.config/opencode
  openclaw     Install skill to ~/.openclaw
  antigravity  Install skill to ~/.gemini/antigravity
  codebuddy    Install skill to ~/.codebuddy
  all          Install common global targets, plus project adapters

Examples:
  ./scripts/install.sh codex
  ./scripts/install.sh claude
  ./scripts/install.sh cursor --project ~/my-project
  ./scripts/install.sh all --project .
EOF
}

copy_dir() {
  local src="$1"
  local dst="$2"
  mkdir -p "$dst"
  rm -rf "$dst"
  mkdir -p "$dst"
  cp -R "$src"/. "$dst"/
}

copy_file() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
}

install_codex() {
  copy_dir "$ROOT/skills/need-a-hug" "$HOME/.codex/skills/need-a-hug"
  copy_file "$ROOT/commands/hug.md" "$HOME/.codex/prompts/hug.md"
  copy_file "$ROOT/commands/need-a-hug.md" "$HOME/.codex/prompts/need-a-hug.md"
  copy_file "$ROOT/commands/hug-init.md" "$HOME/.codex/prompts/hug-init.md"
  copy_file "$ROOT/commands/back-to-work.md" "$HOME/.codex/prompts/back-to-work.md"
  echo "Installed need-a-hug for Codex."
}

install_claude() {
  copy_dir "$ROOT/skills/need-a-hug" "$HOME/.claude/skills/need-a-hug"
  echo "Installed need-a-hug for Claude Code."
}

install_cursor() {
  copy_file "$ROOT/cursor/rules/need-a-hug.mdc" "$PROJECT_DIR/.cursor/rules/need-a-hug.mdc"
  echo "Installed need-a-hug Cursor rule in $PROJECT_DIR."
}

install_kiro() {
  copy_file "$ROOT/kiro/steering/need-a-hug.md" "$PROJECT_DIR/.kiro/steering/need-a-hug.md"
  copy_dir "$ROOT/skills/need-a-hug" "$PROJECT_DIR/.kiro/skills/need-a-hug"
  echo "Installed need-a-hug for Kiro in $PROJECT_DIR."
}

install_vscode() {
  copy_file "$ROOT/vscode/instructions/need-a-hug.instructions.md" "$PROJECT_DIR/.github/instructions/need-a-hug.instructions.md"
  copy_file "$ROOT/vscode/prompts/need-a-hug.prompt.md" "$PROJECT_DIR/.github/prompts/need-a-hug.prompt.md"
  echo "Installed need-a-hug for VSCode Copilot in $PROJECT_DIR."
}

install_opencode() {
  copy_dir "$ROOT/skills/need-a-hug" "$HOME/.config/opencode/skills/need-a-hug"
  echo "Installed need-a-hug for OpenCode."
}

install_openclaw() {
  copy_dir "$ROOT/skills/need-a-hug" "$HOME/.openclaw/skills/need-a-hug"
  echo "Installed need-a-hug for OpenClaw."
}

install_antigravity() {
  copy_dir "$ROOT/skills/need-a-hug" "$HOME/.gemini/antigravity/skills/need-a-hug"
  echo "Installed need-a-hug for Google Antigravity."
}

install_codebuddy() {
  copy_dir "$ROOT/skills/need-a-hug" "$HOME/.codebuddy/skills/need-a-hug"
  echo "Installed need-a-hug for CodeBuddy."
}

if [ "$#" -lt 1 ]; then
  usage
  exit 1
fi

TARGET="$1"
shift

while [ "$#" -gt 0 ]; do
  case "$1" in
    --project)
      if [ "$#" -lt 2 ]; then
        echo "Missing value for --project" >&2
        exit 1
      fi
      PROJECT_DIR="$(cd "$2" && pwd)"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

case "$TARGET" in
  codex) install_codex ;;
  claude) install_claude ;;
  cursor) install_cursor ;;
  kiro) install_kiro ;;
  vscode) install_vscode ;;
  opencode) install_opencode ;;
  openclaw) install_openclaw ;;
  antigravity) install_antigravity ;;
  codebuddy) install_codebuddy ;;
  all)
    install_codex
    install_claude
    install_cursor
    install_kiro
    install_vscode
    install_opencode
    install_openclaw
    install_antigravity
    install_codebuddy
    ;;
  -h|--help) usage ;;
  *)
    echo "Unknown target: $TARGET" >&2
    usage
    exit 1
    ;;
esac

echo "Restart or open a new agent session after installing."
