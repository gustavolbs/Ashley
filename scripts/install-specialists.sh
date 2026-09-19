#!/usr/bin/env bash
set -euo pipefail

echo "[1/3] Taste"
npx skills add https://github.com/jeettrench/taste-skill   --skill design-taste-frontend   --skill gpt-taste   -g -a codex -y --copy

echo "[2/3] UI/UX Pro Max"
npx ui-ux-pro-max-cli@latest init --ai universal --global

echo "[3/3] Impeccable"
npx impeccable@latest install --providers=codex --scope=global --no-hooks

echo
echo "Specialists installed. Restart Codex and verify with /skills."
echo "Impeccable project hooks were intentionally not installed."
