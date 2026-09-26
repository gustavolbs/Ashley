#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

bash "$ROOT/scripts/audit-personas.sh"

for f in "$ROOT"/scripts/*.sh "$ROOT"/skills/*/scripts/*.sh; do
  [[ -f "$f" ]] && bash -n "$f"
done

node --check "$ROOT/evals/run-behavior-evals.mjs"
node "$ROOT/evals/run-behavior-evals.mjs"

required_files=(
  "CHANGELOG.md"
  "PERSONAS.json"
  "SPECIALISTS.json"
  "THIRD_PARTY.lock.json"
  "docs/DELEGATION_LIFECYCLE.md"
  "docs/MODEL_ROUTING.md"
  "docs/EXECUTION_MODES.md"
  "docs/ANTI_SLOP.md"
  "scripts/sync-runtime-contracts.sh"
  "scripts/verify-installed.sh"
  "scripts/install-dave-specialists.sh"
  "scripts/install-team-specialists.sh"
  "evals/behavior-cases.json"
  "evals/behavior.schema.json"
  "evals/run-behavior-evals.mjs"
)

for path in "${required_files[@]}"; do
  [[ -f "$ROOT/$path" ]] || { echo "missing required file: $path" >&2; exit 1; }
done

node - "$ROOT" <<'NODE'
const fs = require("fs");
const path = require("path");
const root = process.argv[2];
const specialists = JSON.parse(fs.readFileSync(path.join(root, "SPECIALISTS.json"), "utf8"));
for (const [persona, agents] of Object.entries(specialists.agency_agents)) {
  if (new Set(agents).size !== agents.length) throw new Error(`duplicate specialist in ${persona}`);
}
const lock = JSON.parse(fs.readFileSync(path.join(root, "THIRD_PARTY.lock.json"), "utf8"));
for (const key of ["agency_agents","taste","skillspector"]) {
  if (!/^[0-9a-f]{40}$/.test(lock[key].commit)) throw new Error(`unpinned commit for ${key}`);
}
for (const key of ["ui_ux_pro_max_cli","impeccable","aislop"]) {
  if (!/^\d+\.\d+\.\d+$/.test(lock[key].version)) throw new Error(`unpinned package version for ${key}`);
}
NODE

if grep -R -n '@latest' "$ROOT/scripts" --include='*.sh'; then
  echo "unpinned latest dependency in specialist installers" >&2
  exit 1
fi

echo "AI Personas repository validation passed."
