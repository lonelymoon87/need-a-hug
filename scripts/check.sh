#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

json_check() {
  local file="$1"
  python3 -m json.tool "$file" >/dev/null
}

json_check "$ROOT/plugin.json"
json_check "$ROOT/.claude-plugin/plugin.json"
json_check "$ROOT/.claude-plugin/marketplace.json"
json_check "$ROOT/hooks/hooks.json"

bash -n "$ROOT/scripts/install.sh"
bash -n "$ROOT/scripts/package-release.sh"
bash -n "$ROOT/hooks/distress-trigger.sh"
bash -n "$ROOT/hooks/session-memory.sh"

TMP_HOME="$(mktemp -d)"
trap 'rm -rf "$TMP_HOME"' EXIT
mkdir -p "$TMP_HOME/.need-a-hug"
printf 'Line with "quotes", backslash \\ and tab\t\n' > "$TMP_HOME/.need-a-hug/memory.md"
printf 'Recent session with emoji 🫂 and newline\nnext line\n' > "$TMP_HOME/.need-a-hug/session.md"

output="$(HOME="$TMP_HOME" bash "$ROOT/hooks/session-memory.sh")"
printf '%s\n' "$output" | python3 -c 'import json,sys; data=json.load(sys.stdin); assert "hookSpecificOutput" in data; assert data["hookSpecificOutput"]["hookEventName"] == "SessionStart"; assert "additionalContext" in data["hookSpecificOutput"]'

bash "$ROOT/scripts/package-release.sh" >/dev/null
test -s "$ROOT/dist/need-a-hug.skill"
test -s "$ROOT/dist/need-a-hug-claude-plugin.zip"

python3 - <<PY
from pathlib import Path
from zipfile import ZipFile
root = Path("$ROOT")
with ZipFile(root / "dist" / "need-a-hug.skill") as z:
    names = set(z.namelist())
    assert "SKILL.md" in names
    assert any(n.startswith("references/") for n in names)
    assert any(n.startswith("agents/") for n in names)
with ZipFile(root / "dist" / "need-a-hug-claude-plugin.zip") as z:
    names = set(z.namelist())
    assert "hooks/hooks.json" in names
    assert "hooks/session-memory.sh" in names
    assert "skills/need-a-hug/SKILL.md" in names
PY

echo "All checks passed."
