#!/usr/bin/env bash
set -euo pipefail
SKILL_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
TEMPLATE="$SKILL_ROOT/templates/project/docs/delivery"
DEST="$PROJECT_ROOT/docs/delivery"

mkdir -p "$DEST"
for f in CHARTER.md SCOPE.md PLAN.md DECISIONS.md RISKS.md HANDOFFS.md LEARNINGS.md; do
  if [[ -e "$DEST/$f" ]]; then
    echo "keep   docs/delivery/$f"
  else
    cp "$TEMPLATE/$f" "$DEST/$f"
    echo "create docs/delivery/$f"
  fi
done

python3 "$SKILL_ROOT/scripts/project-context.py" --root "$PROJECT_ROOT" bootstrap

echo "Laila delivery memory initialized at $DEST"
echo "Local project-context cache initialized in Git metadata; it does not dirty the working tree."
echo "If Jira/Linear/GitHub Projects is authoritative, keep live task status there and use these docs only for durable context."
