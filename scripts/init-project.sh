#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  cat <<'EOF'
Usage: bash scripts/init-project.sh --design|--engineering|--delivery|--all

  --design       initialize Ashley design memory
  --engineering  initialize Dave engineering memory
  --delivery     initialize Laila delivery memory
  --all          initialize all three, each preserving existing files
EOF
}

run_design(){ bash "$ROOT/skills/ashley/scripts/init-project.sh"; }
run_engineering(){ bash "$ROOT/skills/dave/scripts/init-project.sh"; }
run_delivery(){ bash "$ROOT/skills/laila/scripts/init-project.sh"; }

case "${1:-}" in
  --design) run_design ;;
  --engineering) run_engineering ;;
  --delivery) run_delivery ;;
  --all) run_design; run_engineering; run_delivery ;;
  -h|--help) usage ;;
  *) usage >&2; exit 2 ;;
esac
