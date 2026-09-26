#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)
fail(){ printf 'persona audit failed: %s\n' "$1" >&2; exit 1; }
[[ ! -f "$ROOT/SKILL.md" ]] || fail "root SKILL.md shadows multi-skill discovery"
suite_version="$(tr -d '[:space:]' < "$ROOT/VERSION")"
grep -q "\"suite\": \"$suite_version\"" "$ROOT/PERSONAS.json" || fail "suite version mismatch"
for persona in "${PERSONAS[@]}"; do
  skill="$ROOT/skills/$persona/SKILL.md"
  [[ -f "$skill" ]] || fail "missing $skill"
  grep -q "^name: $persona$" "$skill" || fail "$persona frontmatter mismatch"
  version="$(tr -d '[:space:]' < "$ROOT/skills/$persona/VERSION")"
  grep -q "\"$persona\": \"$version\"" "$ROOT/PERSONAS.json" || fail "manifest mismatch for $persona"
  for contract in anti-slop execution-modes model-routing mutation-authority project-context; do
    [[ -f "$ROOT/skills/$persona/references/_shared/$contract.md" ]] || fail "$persona missing packaged $contract contract"
  done
  [[ -f "$ROOT/skills/$persona/scripts/project-context.py" ]] || fail "$persona missing packaged project-context script"
  grep -q "references/_shared/mutation-authority.md" "$skill" || fail "$persona missing mutation authority reference"
  grep -q "## Hard mutation boundary" "$skill" || fail "$persona missing hard mutation boundary"
  bytes="$(wc -c < "$skill" | tr -d ' ')"; (( bytes <= 11500 )) || fail "$persona SKILL.md is $bytes bytes"
done
echo "Persona package audit passed."
