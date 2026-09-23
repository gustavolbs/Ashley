#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

bash "$ROOT/scripts/install.sh"
bash "$ROOT/scripts/install-dave.sh"

for persona in guto roberto clara ana laila; do
  echo "Installing $persona globally for Codex..."
  npx skills add "$ROOT" --skill "$persona" -g -a codex -y --copy
done

echo
echo "AI Personas team installed: Ashley, Dave, Guto, Roberto, Clara, Ana, Laila."
echo "Restart Codex and verify with /skills."
echo "Optional project delivery memory: ~/.agents/skills/laila/scripts/init-project.sh"
