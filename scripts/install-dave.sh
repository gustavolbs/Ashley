#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Installing Dave globally for Codex..."
npx skills add "$ROOT" --skill dave -g -a codex -y --copy

echo
echo "Dave installed. Restart Codex and verify with /skills."
echo "Optional: install Agency Agents Codex integration for specialist subagents."
