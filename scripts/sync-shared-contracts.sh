#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)
check=0; [[ "${1:-}" == "--check" ]] && check=1
for persona in "${PERSONAS[@]}"; do
  dst="$ROOT/skills/$persona/references/_shared"; (( check )) || mkdir -p "$dst"
  for pair in "anti-slop.md:docs/ANTI_SLOP.md" "execution-modes.md:docs/EXECUTION_MODES.md" "model-routing.md:docs/MODEL_ROUTING.md"; do
    name="${pair%%:*}"; src="$ROOT/${pair#*:}"; target="$dst/$name"
    if (( check )); then [[ -f "$target" ]] && cmp -s "$src" "$target" || { echo "shared contract drift: $target" >&2; exit 1; }
    else cp "$src" "$target"; fi
  done
done
(( check )) && echo "Shared runtime contracts are synchronized."
