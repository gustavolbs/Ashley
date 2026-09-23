#!/usr/bin/env bash
set -euo pipefail
SKILL_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
TEMPLATE="$SKILL_ROOT/templates/project/docs/engineering"
DEST="$PROJECT_ROOT/docs/engineering"

if [[ -d "$PROJECT_ROOT/docs/adr" || -d "$PROJECT_ROOT/docs/adrs" ]]; then
  echo "Existing ADR system detected. Prefer extending it for architectural decisions."
fi
if [[ -e "$PROJECT_ROOT/AGENTS.md" ]]; then
  echo "AGENTS.md detected. Dave will treat it as repository instructions, not as a replacement for engineering memory."
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
echo "If the repository already has equivalent docs/ADRs, merge useful content there rather than maintaining duplicates."
