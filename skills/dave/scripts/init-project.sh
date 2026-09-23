#!/usr/bin/env bash
set -euo pipefail
SKILL_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
TEMPLATE="$SKILL_ROOT/templates/project/docs/engineering"
DEST="$PROJECT_ROOT/docs/engineering"

if [[ -e "$PROJECT_ROOT/AGENTS.md" || -d "$PROJECT_ROOT/docs/adr" || -d "$PROJECT_ROOT/docs/adrs" ]]; then
  echo "Existing engineering instruction/ADR system detected."
  echo "Dave should reuse it instead of creating duplicate memory unless you explicitly want docs/engineering."
  exit 0
fi

mkdir -p "$DEST"
for f in CONTEXT.md CONVENTIONS.md DECISIONS.md TESTING.md HANDOFF.md LEARNINGS.md; do
  if [[ -e "$DEST/$f" ]]; then
    echo "keep   docs/engineering/$f"
  else
    cp "$TEMPLATE/$f" "$DEST/$f"
    echo "create docs/engineering/$f"
  fi
done

echo
echo "Dave engineering memory initialized at $DEST"
echo "Commit durable project knowledge; keep HANDOFF.md only when a multi-session handoff is useful."
