#!/usr/bin/env bash
set -uo pipefail

failures=()

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

echo "Installing Ashley specialist skills for Codex..."

run_step "Taste"   npx skills add https://github.com/tasteskill/tasteskill     --skill design-taste-frontend     --skill gpt-taste     -g -a codex -y --copy

run_step "UI/UX Pro Max"   npx -y ui-ux-pro-max-cli@latest init --ai universal --global

run_step "Impeccable"   npx -y impeccable@latest install -y     --providers=codex     --scope=global     --no-hooks

echo
if (( ${#failures[@]} == 0 )); then
  echo "All Ashley specialist skills installed successfully."
  echo "Restart Codex and verify with /skills."
  echo "Impeccable project hooks were intentionally not installed."
  exit 0
fi

echo "Some specialist installs failed:"
for item in "${failures[@]}"; do
  echo "  - $item"
done

echo
echo "Ashley itself remains usable; specialists are optional."
echo "Re-run this script after fixing the failed upstream/install issue."
exit 1
