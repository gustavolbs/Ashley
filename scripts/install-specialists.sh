#!/usr/bin/env bash
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCK="$ROOT/THIRD_PARTY.lock.json"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/ai-personas-design-specialists.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT
failures=()

json_value() {
  node -e 'const fs=require("fs"); const v=JSON.parse(fs.readFileSync(process.argv[1],"utf8")); const path=process.argv[2].split("."); let x=v; for(const k of path)x=x[k]; console.log(x);' "$LOCK" "$1"
}

run_step() {
  local label="$1"
  shift
  echo
  echo "==> $label"
  if "$@"; then
    echo "✓ $label installed"
  else
    echo "✗ $label failed"
    failures+=("$label")
  fi
}

TASTE_REPO="$(json_value taste.repository)"
TASTE_COMMIT="$(json_value taste.commit)"
UIUX_VERSION="$(json_value ui_ux_pro_max_cli.version)"
IMPECCABLE_VERSION="$(json_value impeccable.version)"

echo "Preparing pinned Ashley specialist inputs..."
git init -q "$TMP/taste"
git -C "$TMP/taste" remote add origin "$TASTE_REPO"
git -C "$TMP/taste" fetch --depth 1 -q origin "$TASTE_COMMIT"
git -C "$TMP/taste" checkout --detach -q FETCH_HEAD

if [[ "${AI_PERSONAS_REQUIRE_SKILLSPECTOR:-0}" == "1" ]]; then
  bash "$ROOT/scripts/scan-external-skill.sh" "$TMP/taste" || exit 1
fi

run_step "Taste@$TASTE_COMMIT"   npx skills add "$TMP/taste" --skill design-taste-frontend --skill gpt-taste -g -a codex -y --copy

run_step "UI/UX Pro Max@$UIUX_VERSION"   npx -y "ui-ux-pro-max-cli@$UIUX_VERSION" init --ai universal --global

run_step "Impeccable@$IMPECCABLE_VERSION"   npx -y "impeccable@$IMPECCABLE_VERSION" install -y --providers=codex --scope=global --no-hooks

echo
if (( ${#failures[@]} == 0 )); then
  echo "All Ashley specialist skills installed from pinned inputs."
  echo "Restart Codex and verify with /skills."
  exit 0
fi

echo "Some specialist installs failed:"
printf '  - %s\n' "${failures[@]}"
echo "Ashley itself remains usable; specialists are optional."
exit 1
