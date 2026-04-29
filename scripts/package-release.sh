#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$ROOT/dist"
SKILL_DIR="$ROOT/skills/need-a-hug"

mkdir -p "$DIST"
rm -f "$DIST/need-a-hug.skill" "$DIST/need-a-hug-claude-plugin.zip"

if ! command -v zip >/dev/null 2>&1; then
  echo "zip is required to build release artifacts." >&2
  exit 1
fi

(
  cd "$SKILL_DIR"
  zip -qr "$DIST/need-a-hug.skill" SKILL.md references agents
)

(
  cd "$ROOT"
  zip -qr "$DIST/need-a-hug-claude-plugin.zip" \
    .claude-plugin \
    skills \
    commands \
    hooks \
    assets \
    README.md \
    README.zh-CN.md \
    CHANGELOG.md \
    LICENSE \
    plugin.json
)

echo "Built:"
echo "  $DIST/need-a-hug.skill"
echo "  $DIST/need-a-hug-claude-plugin.zip"
