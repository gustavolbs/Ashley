#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)

fail(){ printf 'installed persona verification failed: %s\n' "$1" >&2; exit 1; }

resolve_skill_dir() {
  local persona="$1"
  local candidates=(
    "$HOME/.codex/skills/$persona"
    "$HOME/.agents/skills/$persona"
  )
  local dir
  for dir in "${candidates[@]}"; do
    if [[ -f "$dir/SKILL.md" ]]; then
      printf '%s\n' "$dir"
      return 0
    fi
  done
  return 1
}

for persona in "${PERSONAS[@]}"; do
  expected="$(tr -d '[:space:]' < "$ROOT/skills/$persona/VERSION")"
  dir="$(resolve_skill_dir "$persona")" || fail "$persona is not installed in ~/.codex/skills or ~/.agents/skills"

  cmp -s "$ROOT/skills/$persona/SKILL.md" "$dir/SKILL.md" \
    || fail "$persona SKILL.md installed copy differs from repository"

  grep -q '^## Delegated-child lifecycle$' "$dir/SKILL.md" \
    || fail "$persona installed SKILL.md lacks delegated-child lifecycle contract"

  if [[ -f "$dir/VERSION" ]]; then
    actual="$(tr -d '[:space:]' < "$dir/VERSION")"
    [[ "$actual" == "$expected" ]] || fail "$persona installed version $actual != expected $expected"
  fi

  printf 'verified %-8s %s (%s)\n' "$persona" "$expected" "$dir"
done

echo "Installed AI Personas exactly match this repository and include lifecycle enforcement."
