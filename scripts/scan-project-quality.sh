#!/usr/bin/env bash
set -euo pipefail

base_ref="${1:-origin/main}"

if command -v aislop >/dev/null 2>&1; then
  exec aislop ci --changes --base "$base_ref"
fi

if [[ "${AI_PERSONAS_USE_NPX:-0}" == "1" ]]; then
  exec npx --yes aislop@latest ci --changes --base "$base_ref"
fi

cat <<'EOF'
AIslop is not installed; deterministic anti-slop scan skipped.
Install it explicitly with `npm install --save-dev aislop`, or rerun with
`AI_PERSONAS_USE_NPX=1` to use `npx aislop@latest` for this one scan.
Native formatter, linter, typecheck, tests and security gates remain required.
EOF
