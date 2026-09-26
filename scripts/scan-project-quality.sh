#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
base_ref="${1:-origin/main}"

if command -v aislop >/dev/null 2>&1; then
  exec aislop ci --changes --base "$base_ref"
fi

if [[ "${AI_PERSONAS_USE_NPX:-0}" == "1" ]]; then
  version="$(node -e 'const x=JSON.parse(require("fs").readFileSync(process.argv[1],"utf8")); console.log(x.aislop.version)' "$ROOT/THIRD_PARTY.lock.json")"
  exec npx --yes "aislop@$version" ci --changes --base "$base_ref"
fi

cat <<'EOF'
AIslop is not installed; deterministic anti-slop scan skipped.
Install it explicitly in the project, or rerun with AI_PERSONAS_USE_NPX=1 to
use the version pinned by AI Personas in THIRD_PARTY.lock.json.
Native formatter, linter, typecheck, tests and security gates remain required.
EOF
