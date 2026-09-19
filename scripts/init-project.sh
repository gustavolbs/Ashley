#!/usr/bin/env bash
set -euo pipefail
SKILL_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
TEMPLATE="$SKILL_ROOT/templates/project/docs/design"
DEST="$PROJECT_ROOT/docs/design"

mkdir -p "$DEST"
for f in PRODUCT.md RESEARCH.md BRAND.md UX.md DESIGN_SYSTEM.md DECISIONS.md LEARNINGS.md; do
  if [[ -e "$DEST/$f" ]]; then
    echo "keep   docs/design/$f"
  else
    cp "$TEMPLATE/$f" "$DEST/$f"
    echo "create docs/design/$f"
  fi
done

echo
echo "Ashley design memory initialized at $DEST"
echo "Commit these files with the product."
