#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ $# -ne 1 ]]; then
  echo "Usage: bash scripts/scan-external-skill.sh <path-or-git-url>" >&2
  exit 2
fi

target="$1"

if ! command -v skillspector >/dev/null 2>&1; then
  repo="$(node -e 'const x=JSON.parse(require("fs").readFileSync(process.argv[1],"utf8")); console.log(x.skillspector.repository)' "$ROOT/THIRD_PARTY.lock.json")"
  commit="$(node -e 'const x=JSON.parse(require("fs").readFileSync(process.argv[1],"utf8")); console.log(x.skillspector.commit)' "$ROOT/THIRD_PARTY.lock.json")"
  cat >&2 <<EOF
SkillSpector is not installed. AI Personas currently pins:
  repository: $repo
  commit:     $commit

Install that reviewed revision explicitly, then rerun this command.
EOF
  exit 2
fi

exec skillspector scan "$target" --no-llm --format terminal
