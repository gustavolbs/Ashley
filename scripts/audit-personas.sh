#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)

fail(){ printf 'persona audit failed: %s\n' "$1" >&2; exit 1; }

[[ ! -f "$ROOT/SKILL.md" ]] || fail "root SKILL.md shadows multi-skill discovery"
[[ -f "$ROOT/VERSION" ]] || fail "missing root VERSION"
[[ -f "$ROOT/PERSONAS.json" ]] || fail "missing PERSONAS.json"
suite_version="$(tr -d '[:space:]' < "$ROOT/VERSION")"
[[ "$suite_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || fail "root VERSION is not semver"
grep -q "\"suite\": \"$suite_version\"" "$ROOT/PERSONAS.json" || fail "PERSONAS.json suite version does not match VERSION"

for persona in "${PERSONAS[@]}"; do
  skill="$ROOT/skills/$persona/SKILL.md"
  [[ -f "$skill" ]] || fail "missing $skill"
  grep -q "^name: $persona$" "$skill" || fail "$persona frontmatter name does not match directory"
  [[ -f "$ROOT/skills/$persona/agents/openai.yaml" ]] || fail "missing agents/openai.yaml for $persona"
  [[ -f "$ROOT/skills/$persona/VERSION" ]] || fail "missing VERSION for $persona"
  persona_version="$(tr -d '[:space:]' < "$ROOT/skills/$persona/VERSION")"
  [[ "$persona_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || fail "$persona VERSION is not semver"
  grep -q "\"$persona\": \"$persona_version\"" "$ROOT/PERSONAS.json" || fail "PERSONAS.json version mismatch for $persona"
  grep -q "references/evidence.md" "$skill" || fail "$persona SKILL.md must reference anti-hallucination evidence protocol"
  bytes="$(wc -c < "$skill" | tr -d " ")"
  (( bytes <= 12000 )) || fail "$persona SKILL.md is ${bytes} bytes; move detail into references/"

  while IFS= read -r doc; do
    while IFS= read -r linked_ref; do
      [[ -z "$linked_ref" || -f "$ROOT/skills/$persona/$linked_ref" ]] || fail "$persona has broken reference $linked_ref in ${doc#$ROOT/}"
    done < <(grep -oE "references/[A-Za-z0-9._-]+\.md" "$doc" | sort -u || true)
  done < <(find "$ROOT/skills/$persona" -maxdepth 2 -type f -name "*.md" | sort)
done

for stale in parker victor nora maya; do
  [[ ! -d "$ROOT/skills/$stale" ]] || fail "stale persona directory skills/$stale exists"
done

stale_names="$(grep -R -nE "(Parker|Victor|Nora|Maya)" "$ROOT/skills" "$ROOT/README.md" "$ROOT/THIRD_PARTY.md" 2>/dev/null || true)"
[[ -z "$stale_names" ]] || { printf "%s\n" "$stale_names" >&2; fail "stale persona names remain"; }

future_wording="$(grep -R -n "future persona" "$ROOT/skills" "$ROOT/README.md" 2>/dev/null || true)"
[[ -z "$future_wording" ]] || { printf "%s\n" "$future_wording" >&2; fail "stale future-persona wording remains"; }

echo "Persona structure audit passed."
