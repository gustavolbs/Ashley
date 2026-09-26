#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)
fail(){ printf 'installed persona verification failed: %s\n' "$1" >&2; exit 1; }
for persona in "${PERSONAS[@]}"; do
  expected="$(tr -d '[:space:]' < "$ROOT/skills/$persona/VERSION")"; dir="$HOME/.agents/skills/$persona"
  [[ -d "$dir" ]] || fail "$persona is not installed in ~/.agents/skills"
  [[ ! -e "$HOME/.codex/skills/$persona" ]] || fail "$persona has a deprecated shadow copy in ~/.codex/skills"
  if ! diff -qr --exclude='.DS_Store' "$ROOT/skills/$persona" "$dir" >/dev/null; then diff -qr --exclude='.DS_Store' "$ROOT/skills/$persona" "$dir" >&2 || true; fail "$persona installed package differs from repository"; fi
  actual="$(tr -d '[:space:]' < "$dir/VERSION")"; [[ "$actual" == "$expected" ]] || fail "$persona installed version mismatch"
  [[ -f "$dir/references/_shared/model-routing.md" ]] || fail "$persona missing packaged model routing contract"
  printf 'verified %-8s %s (%s)\n' "$persona" "$expected" "$dir"
done
echo "Installed AI Personas packages exactly match this repository."
