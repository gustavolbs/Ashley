#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)

fail() {
  printf 'persona audit failed: %s\n' "$1" >&2
  exit 1
}

[[ ! -f "$ROOT/SKILL.md" ]] || fail "root SKILL.md shadows multi-skill discovery"
[[ -f "$ROOT/VERSION" ]] || fail "missing root VERSION"
[[ -f "$ROOT/PERSONAS.json" ]] || fail "missing PERSONAS.json"
[[ -f "$ROOT/SPECIALISTS.json" ]] || fail "missing SPECIALISTS.json"
[[ -f "$ROOT/THIRD_PARTY.lock.json" ]] || fail "missing THIRD_PARTY.lock.json"

suite_version="$(tr -d '[:space:]' < "$ROOT/VERSION")"
[[ "$suite_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || fail "root VERSION is not semver"
grep -q "\"suite\": \"$suite_version\"" "$ROOT/PERSONAS.json"   || fail "PERSONAS.json suite version does not match VERSION"

node -e '
  const fs = require("fs");
  for (const file of process.argv.slice(1)) JSON.parse(fs.readFileSync(file, "utf8"));
'   "$ROOT/PERSONAS.json"   "$ROOT/SPECIALISTS.json"   "$ROOT/THIRD_PARTY.lock.json"   "$ROOT/evals/behavior-cases.json"   "$ROOT/evals/behavior.schema.json"

bash "$ROOT/scripts/sync-runtime-contracts.sh" --check

for persona in "${PERSONAS[@]}"; do
  skill="$ROOT/skills/$persona/SKILL.md"
  agent_yaml="$ROOT/skills/$persona/agents/openai.yaml"
  version_file="$ROOT/skills/$persona/VERSION"
  runtime_contracts="$ROOT/skills/$persona/references/runtime-contracts.md"

  [[ -f "$skill" ]] || fail "missing $skill"
  grep -q "^name: $persona$" "$skill"     || fail "$persona frontmatter name does not match directory"

  [[ -f "$agent_yaml" ]] || fail "missing agents/openai.yaml for $persona"
  grep -q '^  display_name:' "$agent_yaml"     || fail "$persona agent metadata missing display_name"
  grep -q '^  short_description:' "$agent_yaml"     || fail "$persona agent metadata missing short_description"
  grep -q '^  default_prompt:' "$agent_yaml"     || fail "$persona agent metadata missing default_prompt"
  grep -q '^  allow_implicit_invocation: true$' "$agent_yaml"     || fail "$persona implicit invocation policy missing"

  [[ -f "$version_file" ]] || fail "missing VERSION for $persona"
  [[ -f "$runtime_contracts" ]] || fail "missing runtime contracts for $persona"

  persona_version="$(tr -d '[:space:]' < "$version_file")"
  [[ "$persona_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]     || fail "$persona VERSION is not semver"
  grep -q "\"$persona\": \"$persona_version\"" "$ROOT/PERSONAS.json"     || fail "PERSONAS.json version mismatch for $persona"

  grep -q "evidence.md" "$skill"     || fail "$persona SKILL.md must reference its evidence protocol"
  grep -q "references/runtime-contracts.md" "$skill"     || fail "$persona SKILL.md must reference bundled runtime contracts"

  for heading in     "Anti-slop quality gate"     "Execution speed"     "Delegated-child lifecycle"     "Model routing"
  do
    grep -q "^## $heading$" "$skill"       || fail "$persona SKILL.md missing $heading"
  done

  bytes="$(wc -c < "$skill" | tr -d ' ')"
  (( bytes <= 10000 ))     || fail "$persona SKILL.md is ${bytes} bytes; move detail into references/"

  while IFS= read -r doc; do
    while IFS= read -r linked_ref; do
      [[ -z "$linked_ref" || -f "$ROOT/skills/$persona/$linked_ref" ]]         || fail "$persona has broken reference $linked_ref in ${doc#$ROOT/}"
    done < <(
      grep -oE 'references/[A-Za-z0-9._/-]+\.md' "$doc" | sort -u || true
    )
  done < <(
    find "$ROOT/skills/$persona" -maxdepth 2 -type f -name '*.md' | sort
  )
done

portable_leaks="$(
  find "$ROOT/skills"     -type f     -name '*.md'     ! -name 'runtime-contracts.md'     -exec grep -HnE 'docs/[A-Z][A-Z0-9_-]*\.md' {} +     2>/dev/null || true
)"
[[ -z "$portable_leaks" ]] || {
  printf '%s\n' "$portable_leaks" >&2
  fail "installed skills reference repository-only runtime docs"
}

ds_store="$(
  find "$ROOT" -path "$ROOT/.git" -prune -o -name '.DS_Store' -print
)"
[[ -z "$ds_store" ]] || {
  printf '%s\n' "$ds_store" >&2
  fail ".DS_Store files are tracked/present"
}

for stale in parker victor nora maya; do
  [[ ! -d "$ROOT/skills/$stale" ]]     || fail "stale persona directory skills/$stale exists"
done

echo "Persona structure audit passed."
