#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
bash "$ROOT/scripts/sync-shared-contracts.sh" --check
bash "$ROOT/scripts/audit-personas.sh"
python3 -m json.tool "$ROOT/PERSONAS.json" >/dev/null
python3 "$ROOT/scripts/eval-static.py"
python3 "$ROOT/scripts/audit-context.py"
for f in "$ROOT"/scripts/*.sh "$ROOT"/scripts/lib/*.sh; do bash -n "$f"; done
for f in "$ROOT"/skills/*/scripts/*.sh; do [[ -e "$f" ]] && bash -n "$f"; done
for path in CHANGELOG.md PERSONAS.json docs/VERSIONING.md docs/ENGINEERING_STANDARDS.md docs/REVIEW_STANDARDS.md docs/ECC_INTEGRATION.md docs/ANTI_SLOP.md docs/EXECUTION_MODES.md docs/MODEL_ROUTING.md scripts/run-evals.sh scripts/eval-static.py scripts/audit-context.py scripts/lib/specialists.sh evals/model-routing.md evals/provider-local-routing.md evals/team-routing.md evals/team-evidence-hallucination.md; do [[ -f "$ROOT/$path" ]] || { echo "missing required file: $path" >&2; exit 1; }; done
echo "AI Personas repository validation passed."
