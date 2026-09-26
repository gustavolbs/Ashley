#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSONAS=(ashley dave guto roberto clara ana laila)

fail(){ printf 'installed persona verification failed: %s\n' "$1" >&2; exit 1; }

tree_digest() {
  local dir="$1"
  (
    cd "$dir"
    find . -type f ! -name '.DS_Store' -print | LC_ALL=C sort | while IFS= read -r file; do
      hash="$(shasum -a 256 "$file" | awk '{print $1}')"
      printf '%s %s\n' "$file" "$hash"
    done
  ) | shasum -a 256 | awk '{print $1}'
}

for persona in "${PERSONAS[@]}"; do
  expected_version="$(tr -d '[:space:]' < "$ROOT/skills/$persona/VERSION")"
  expected_dir="$ROOT/skills/$persona"
  installed_dir="$HOME/.agents/skills/$persona"

  [[ -f "$installed_dir/SKILL.md" ]] || fail "$persona is not installed in ~/.agents/skills"
  [[ ! -e "$HOME/.codex/skills/$persona" ]] || fail "$persona has a deprecated shadow copy in ~/.codex/skills"
  [[ -f "$installed_dir/references/runtime-contracts.md" ]] || fail "$persona runtime contracts are missing"

  if [[ -f "$installed_dir/VERSION" ]]; then
    actual_version="$(tr -d '[:space:]' < "$installed_dir/VERSION")"
    [[ "$actual_version" == "$expected_version" ]] || fail "$persona installed version $actual_version != expected $expected_version"
  fi

  expected_digest="$(tree_digest "$expected_dir")"
  installed_digest="$(tree_digest "$installed_dir")"
  [[ "$expected_digest" == "$installed_digest" ]] || fail "$persona installed tree differs from repository"

  printf 'verified %-8s %s %s\n' "$persona" "$expected_version" "$expected_digest"
done

echo "Installed AI Personas exactly match the repository skill bundles."
