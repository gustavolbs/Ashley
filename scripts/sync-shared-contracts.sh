#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)
check=0; [[ "${1:-}" == "--check" ]] && check=1

for persona in "${PERSONAS[@]}"; do
  refs="$ROOT/skills/$persona/references/_shared"
  scripts="$ROOT/skills/$persona/scripts"
  (( check )) || { mkdir -p "$refs"; mkdir -p "$scripts"; }

  for pair in     "anti-slop.md:docs/ANTI_SLOP.md"     "execution-modes.md:docs/EXECUTION_MODES.md"     "model-routing.md:docs/MODEL_ROUTING.md"     "project-context.md:docs/PROJECT_CONTEXT.md"
  do
    name="${pair%%:*}"; src="$ROOT/${pair#*:}"; target="$refs/$name"
    if (( check )); then
      [[ -f "$target" ]] && cmp -s "$src" "$target" || { echo "shared contract drift: $target" >&2; exit 1; }
    else
      cp "$src" "$target"
    fi
  done

  target="$scripts/project-context.py"
  if (( check )); then
    [[ -f "$target" ]] && cmp -s "$ROOT/scripts/project-context.py" "$target" || { echo "shared script drift: $target" >&2; exit 1; }
  else
    cp "$ROOT/scripts/project-context.py" "$target"
    chmod +x "$target"
  fi
done

(( check )) && echo "Shared runtime contracts and project-context script are synchronized."
