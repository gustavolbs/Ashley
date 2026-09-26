#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)
fail(){ printf 'persona audit failed: %s\n' "$1" >&2; exit 1; }
[[ ! -f "$ROOT/SKILL.md" ]] || fail "root SKILL.md shadows multi-skill discovery"
[[ -f "$ROOT/VERSION" && -f "$ROOT/PERSONAS.json" ]] || fail "missing version manifest"
suite_version="$(tr -d '[:space:]' < "$ROOT/VERSION")"; [[ "$suite_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || fail "root VERSION is not semver"
grep -q "\"suite\": \"$suite_version\"" "$ROOT/PERSONAS.json" || fail "suite version mismatch"
for persona in "${PERSONAS[@]}"; do
  skill="$ROOT/skills/$persona/SKILL.md"; [[ -f "$skill" ]] || fail "missing $skill"; grep -q "^name: $persona$" "$skill" || fail "$persona frontmatter mismatch"
  [[ -f "$ROOT/skills/$persona/agents/openai.yaml" && -f "$ROOT/skills/$persona/VERSION" ]] || fail "$persona package metadata missing"
  version="$(tr -d '[:space:]' < "$ROOT/skills/$persona/VERSION")"; grep -q "\"$persona\": \"$version\"" "$ROOT/PERSONAS.json" || fail "manifest mismatch for $persona"
  for contract in anti-slop execution-modes model-routing; do [[ -f "$ROOT/skills/$persona/references/_shared/$contract.md" ]] || fail "$persona missing packaged $contract contract"; done
  ! grep -qE 'docs/(ANTI_SLOP|EXECUTION_MODES|MODEL_ROUTING)\.md' "$skill" || fail "$persona depends on root runtime docs"
  grep -q "references/evidence.md" "$skill" || fail "$persona must reference evidence protocol"
  bytes="$(wc -c < "$skill" | tr -d ' ')"; (( bytes <= 10500 )) || fail "$persona SKILL.md is $bytes bytes"
  while IFS= read -r doc; do while IFS= read -r linked_ref; do [[ -z "$linked_ref" || -f "$ROOT/skills/$persona/$linked_ref" ]] || fail "$persona broken reference $linked_ref"; done < <(grep -oE "references/[A-Za-z0-9_./-]+\.md" "$doc" | sort -u || true); done < <(find "$ROOT/skills/$persona" -maxdepth 3 -type f -name "*.md" | sort)
done
[[ ! -f "$ROOT/.DS_Store" && ! -f "$ROOT/skills/.DS_Store" ]] || fail ".DS_Store must not be tracked"
echo "Persona package audit passed."
