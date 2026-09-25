#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: bash scripts/scan-external-skill.sh <path-or-git-url>" >&2
  exit 2
fi

target="$1"

if ! command -v skillspector >/dev/null 2>&1; then
  cat >&2 <<'EOF'
SkillSpector is not installed. Install it explicitly before scanning:
  uv tool install git+https://github.com/NVIDIA/skillspector.git
Then rerun this command.
EOF
  exit 2
fi

exec skillspector scan "$target" --no-llm --format terminal
