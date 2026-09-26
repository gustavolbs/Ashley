#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)
MODE="${1:---write}"

render() {
  cat <<'EOF'
<!-- GENERATED FILE. Edit the canonical files under /docs, then run scripts/sync-runtime-contracts.sh. -->

# AI Personas Runtime Contracts

EOF
  for spec in     "Execution modes|docs/EXECUTION_MODES.md"     "Model routing|docs/MODEL_ROUTING.md"     "Delegation lifecycle|docs/DELEGATION_LIFECYCLE.md"     "Anti-slop|docs/ANTI_SLOP.md"
  do
    title="${spec%%|*}"
    file="${spec#*|}"
    printf '\n---\n\n## %s\n\n' "$title"
    cat "$ROOT/$file"
  done
}

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT
render > "$tmp"

for persona in "${PERSONAS[@]}"; do
  target="$ROOT/skills/$persona/references/runtime-contracts.md"
  if [[ "$MODE" == "--check" ]]; then
    [[ -f "$target" ]] || { echo "missing generated runtime contract: $target" >&2; exit 1; }
    cmp -s "$tmp" "$target" || {
      echo "stale runtime contract: $target" >&2
      echo "run: bash scripts/sync-runtime-contracts.sh" >&2
      exit 1
    }
  else
    cp "$tmp" "$target"
  fi
done

[[ "$MODE" == "--check" ]] && echo "Runtime contract copies are synchronized."
