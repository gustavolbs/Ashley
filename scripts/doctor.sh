#!/usr/bin/env bash
set -u
ok(){ printf "✓ %s\n" "$1"; }
warn(){ printf "! %s\n" "$1"; }

[[ -f "$HOME/.agents/skills/ashley/SKILL.md" ]] && ok "Ashley installed" || warn "Ashley not found"
[[ -f "$HOME/.ashley/PREFERENCES.md" ]] && ok "Global preference memory exists" || warn "Global preference memory missing"

for s in ui-ux-pro-max design-taste-frontend gpt-taste impeccable; do
  [[ -d "$HOME/.agents/skills/$s" ]] && ok "Specialist: $s" || warn "Optional specialist missing: $s"
done

[[ -d "docs/design" ]] && ok "Current project has design memory" || warn "Current project has no docs/design"
command -v codex >/dev/null 2>&1 && ok "Codex CLI found" || warn "Codex CLI not in PATH (Desktop may still exist)"
command -v pen >/dev/null 2>&1 && ok "pen.dev CLI found" || warn "pen.dev CLI not found (optional but recommended)"

echo
echo "Inside Codex verify /skills and /mcp."
