#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
python3 "$ROOT/scripts/eval-static.py"
if [[ "${AI_PERSONAS_RUN_MODEL_EVALS:-0}" != "1" ]]; then echo "Live model evals skipped. Set AI_PERSONAS_RUN_MODEL_EVALS=1 to run Codex traces."; exit 0; fi
command -v codex >/dev/null 2>&1 || { echo "codex CLI required for live evals" >&2; exit 2; }
OUT="${AI_PERSONAS_EVAL_OUT:-$ROOT/.eval-results}"; mkdir -p "$OUT"
CASES=(model-routing mutation-authority sol-budget fast-path team-routing team-evidence-hallucination)
for name in "${CASES[@]}"; do echo "Running live eval: $name"; codex exec --json "$(cat "$ROOT/evals/$name.md")" > "$OUT/$name.jsonl"; done
python3 "$ROOT/scripts/summarize-eval-traces.py" "$OUT"
