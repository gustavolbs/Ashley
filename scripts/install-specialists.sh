#!/usr/bin/env bash
set -uo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TASTE_REPO="${TASTE_REPO:-https://github.com/tasteskill/tasteskill.git}"
TASTE_REF="${TASTE_REF:-37c8c376b92ebc02456f7c70776b514fddda88e1}"
UI_UX_PRO_MAX_VERSION="${UI_UX_PRO_MAX_VERSION:-2.15.0}"
IMPECCABLE_VERSION="${IMPECCABLE_VERSION:-4.1.0}"
failures=()
TMP="$(mktemp -d "${TMPDIR:-/tmp}/taste-skill.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

run_step(){ local label="$1"; shift; echo; echo "==> $label"; if "$@"; then echo "✓ $label installed"; else echo "✗ $label failed"; failures+=("$label"); fi; }

echo "Installing pinned Ashley specialist skills for Codex..."

if git clone -q "$TASTE_REPO" "$TMP/repo" && git -C "$TMP/repo" checkout -q --detach "$TASTE_REF"; then
  if [[ "${AI_PERSONAS_REQUIRE_SKILLSPECTOR:-0}" == "1" ]]; then
    bash "$ROOT/scripts/scan-external-skill.sh" "$TMP/repo" || failures+=("Taste SkillSpector gate")
  fi
  run_step "Taste" npx skills add "$TMP/repo" --skill design-taste-frontend --skill gpt-taste -g -a codex -y --copy
else
  echo "✗ Taste checkout failed"; failures+=("Taste")
fi

run_step "UI/UX Pro Max" npx -y "ui-ux-pro-max-cli@$UI_UX_PRO_MAX_VERSION" init --ai universal --global
run_step "Impeccable" npx -y "impeccable@$IMPECCABLE_VERSION" install -y --providers=codex --scope=global --no-hooks

echo
echo "Pinned sources:"
echo "  Taste: $TASTE_REF"
echo "  UI/UX Pro Max: $UI_UX_PRO_MAX_VERSION"
echo "  Impeccable: $IMPECCABLE_VERSION"

if (( ${#failures[@]} == 0 )); then
  echo "All Ashley specialist skills installed successfully."
  exit 0
fi
echo "Some specialist installs failed:"
printf '  - %s\n' "${failures[@]}"
echo "Ashley itself remains usable; specialists are optional."
exit 1
