#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)

fail(){ printf 'installed persona verification failed: %s\n' "$1" >&2; exit 1; }

for persona in "${PERSONAS[@]}"; do
  expected="$(tr -d '[:space:]' < "$ROOT/skills/$persona/VERSION")"
  dir="$HOME/.agents/skills/$persona"
  [[ -f "$dir/SKILL.md" ]] \
    || fail "$persona is not installed in ~/.agents/skills"
  [[ ! -e "$HOME/.codex/skills/$persona" ]] \
    || fail "$persona has a deprecated shadow copy in ~/.codex/skills"

  cmp -s "$ROOT/skills/$persona/SKILL.md" "$dir/SKILL.md" \
    || fail "$persona installed copy differs from repository: $dir/SKILL.md"

  grep -q '^## Delegated-child lifecycle$' "$dir/SKILL.md" \
    || fail "$persona installed SKILL.md lacks delegated-child lifecycle contract: $dir"
  grep -q '^## Model routing$' "$dir/SKILL.md" \
    || fail "$persona installed SKILL.md lacks model-routing contract: $dir"

  if [[ -f "$dir/VERSION" ]]; then
    actual="$(tr -d '[:space:]' < "$dir/VERSION")"
    [[ "$actual" == "$expected" ]] \
      || fail "$persona installed version $actual != expected $expected at $dir"
  fi

  printf 'verified %-8s %s (%s)\n' "$persona" "$expected" "$dir"
done

echo "Installed AI Personas exactly match this repository and include lifecycle enforcement."
