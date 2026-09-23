#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)

fail(){ printf 'installed persona verification failed: %s\n' "$1" >&2; exit 1; }

for persona in "${PERSONAS[@]}"; do
  expected="$(tr -d '[:space:]' < "$ROOT/skills/$persona/VERSION")"
  found=0

  for dir in "$HOME/.codex/skills/$persona" "$HOME/.agents/skills/$persona"; do
    [[ -f "$dir/SKILL.md" ]] || continue
    found=1

    cmp -s "$ROOT/skills/$persona/SKILL.md" "$dir/SKILL.md" \
      || fail "$persona installed copy differs from repository: $dir/SKILL.md"

    grep -q '^## Delegated-child lifecycle$' "$dir/SKILL.md" \
      || fail "$persona installed SKILL.md lacks delegated-child lifecycle contract: $dir"

    if [[ -f "$dir/VERSION" ]]; then
      actual="$(tr -d '[:space:]' < "$dir/VERSION")"
      [[ "$actual" == "$expected" ]] \
        || fail "$persona installed version $actual != expected $expected at $dir"
    fi

    printf 'verified %-8s %s (%s)\n' "$persona" "$expected" "$dir"
  done

  (( found == 1 )) || fail "$persona is not installed in ~/.codex/skills or ~/.agents/skills"
done

echo "Installed AI Personas exactly match this repository and include lifecycle enforcement."
