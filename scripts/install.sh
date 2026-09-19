#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Installing Ashley globally for Codex..."
npx skills add "$ROOT" -g -a codex -y --copy

mkdir -p "$HOME/.ashley"

if [[ ! -f "$HOME/.ashley/PREFERENCES.md" ]]; then
cat > "$HOME/.ashley/PREFERENCES.md" <<'EOF'
# Ashley — Global Design Preferences

Store only preferences that genuinely apply across products.
Include scope, confidence, evidence and exceptions when useful.
Do not turn one rejected design into a universal law.
EOF
fi

if [[ ! -f "$HOME/.ashley/HEURISTICS.md" ]]; then
cat > "$HOME/.ashley/HEURISTICS.md" <<'EOF'
# Ashley — Learned Design Heuristics

Reusable lessons learned from repeated outcomes.
State principle, scope, confidence, evidence and exceptions.
Core Ashley instructions are not edited automatically.
EOF
fi

echo
echo "Ashley installed. Restart Codex and verify with /skills."
echo "Optional specialists: bash $ROOT/scripts/install-specialists.sh"
echo "Product repo setup: ~/.agents/skills/ashley/scripts/init-project.sh"
