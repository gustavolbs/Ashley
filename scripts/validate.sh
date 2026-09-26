#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
bash "$ROOT/scripts/sync-shared-contracts.sh" --check
bash "$ROOT/scripts/audit-personas.sh"
python3 -m json.tool "$ROOT/PERSONAS.json" >/dev/null
python3 "$ROOT/scripts/eval-static.py"
python3 "$ROOT/scripts/test-project-context.py"
python3 "$ROOT/scripts/audit-context.py"
for f in "$ROOT"/scripts/*.sh "$ROOT"/scripts/lib/*.sh; do bash -n "$f"; done
for f in "$ROOT"/skills/*/scripts/*.sh; do [[ -e "$f" ]] && bash -n "$f"; done
for path in CHANGELOG.md PERSONAS.json docs/ANTI_SLOP.md docs/EXECUTION_MODES.md docs/MODEL_ROUTING.md docs/MUTATION_AUTHORITY.md docs/PROJECT_CONTEXT.md scripts/project-context.py scripts/test-project-context.py scripts/run-evals.sh scripts/eval-static.py evals/model-routing.md evals/mutation-authority.md evals/sol-budget.md evals/team-routing.md; do
  [[ -f "$ROOT/$path" ]] || { echo "missing required file: $path" >&2; exit 1; }
done
echo "AI Personas repository validation passed."
