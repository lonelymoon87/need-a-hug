#!/usr/bin/env bash
set -euo pipefail

MEMORY_FILE="${HOME:-}/.need-a-hug/memory.md"
SESSION_FILE="${HOME:-}/.need-a-hug/session.md"

escape_for_json() {
  local s="$1"
  s="${s//\\/\\\\}"
  s="${s//\"/\\\"}"
  s="${s//$'\n'/\\n}"
  s="${s//$'\r'/\\r}"
  s="${s//$'\t'/\\t}"
  printf '%s' "$s"
}

read_limited() {
  local file="$1"
  if [ -r "$file" ]; then
    head -c 12000 "$file"
  fi
}

context=""

if [ -r "$MEMORY_FILE" ]; then
  memory_content="$(read_limited "$MEMORY_FILE")"
  context="${context}[need-a-hug quiet memory]\nUse this only to make comfort feel continuous and specific. If it is clearly relevant, you may mention one tentative observation like \"I remember you said...\" Do not quote it mechanically. Do not guess from weak evidence. Do not treat it as diagnosis or fixed identity.\n\n${memory_content}\n"
fi

if [ -r "$SESSION_FILE" ]; then
  if [ "$(uname)" = "Darwin" ]; then
    age=$(( $(date +%s) - $(stat -f %m "$SESSION_FILE") ))
  else
    age=$(( $(date +%s) - $(stat -c %Y "$SESSION_FILE") ))
  fi

  if [ "$age" -le 86400 ]; then
    session_content="$(read_limited "$SESSION_FILE")"
    context="${context}\n[need-a-hug recent comfort context]\nUse this only if the user returns to the same emotional thread. Keep it natural and quiet.\n\n${session_content}\n"
  fi
fi

if [ -z "$context" ]; then
  exit 0
fi

escaped="$(escape_for_json "$context")"
printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$escaped"
