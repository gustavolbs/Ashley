#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Preflight: validating AI Personas repository..."
bash "$ROOT/scripts/validate.sh"

bash "$ROOT/scripts/install.sh"
bash "$ROOT/scripts/install-dave.sh"

for persona in guto roberto clara ana laila; do
  echo "Installing $persona globally for Codex..."
  npx skills add "$ROOT" --skill "$persona" -g -a codex -y --copy
done

echo
echo "Synchronizing canonical user skill copies..."
mkdir -p "$HOME/.agents/skills"
for persona in ashley dave guto roberto clara ana laila; do
  rm -rf "$HOME/.agents/skills/$persona"
  cp -R "$ROOT/skills/$persona" "$HOME/.agents/skills/$persona"
  # Remove only persona shadows from the deprecated Codex skill directory.
  # Codex system skills and unrelated user skills remain untouched.
  rm -rf "$HOME/.codex/skills/$persona"
done

echo
echo "Verifying every installed skill copy..."
bash "$ROOT/scripts/verify-installed.sh"

echo
echo "AI Personas team installed and verified: Ashley, Dave, Guto, Roberto, Clara, Ana, Laila."
echo "Restart Codex/ChatGPT Desktop so the updated skills are reloaded."
echo "Optional project delivery memory: ~/.agents/skills/laila/scripts/init-project.sh"
