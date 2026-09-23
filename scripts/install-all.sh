#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

bash "$ROOT/scripts/install.sh"
bash "$ROOT/scripts/install-dave.sh"

echo
echo "Ashley and Dave installed. Restart Codex and verify with /skills."
