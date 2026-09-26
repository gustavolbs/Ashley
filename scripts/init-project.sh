#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
usage(){ cat <<'EOF'
Usage: scripts/init-project.sh [--context] [--design] [--engineering] [--delivery] [--all]
The context cache is local to this clone/worktree and does not dirty the repo.
EOF
}
[[ $# -gt 0 ]] || { usage; exit 0; }
for arg in "$@"; do case "$arg" in
  --context) python3 "$ROOT/scripts/project-context.py" bootstrap ;;
  --design) bash "$ROOT/skills/ashley/scripts/init-project.sh" ;;
  --engineering) bash "$ROOT/skills/dave/scripts/init-project.sh" ;;
  --delivery) bash "$ROOT/skills/laila/scripts/init-project.sh" ;;
  --all)
    python3 "$ROOT/scripts/project-context.py" bootstrap
    bash "$ROOT/skills/ashley/scripts/init-project.sh"
    bash "$ROOT/skills/dave/scripts/init-project.sh"
    bash "$ROOT/skills/laila/scripts/init-project.sh"
    ;;
  -h|--help) usage ;;
  *) echo "unknown option: $arg" >&2; usage >&2; exit 2 ;;
esac; done
