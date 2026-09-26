#!/usr/bin/env bash
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT/scripts/lib/specialists.sh"
ok(){ printf "✓ %s\n" "$1"; }; warn(){ printf "! %s\n" "$1"; }
for persona in ashley dave guto roberto clara ana laila; do [[ -f "$HOME/.agents/skills/$persona/SKILL.md" ]] && ok "$persona installed" || warn "$persona not found"; done
echo; echo "Optional Dave specialists:"
for a in "${DAVE_SPECIALISTS[@]}"; do [[ -f "$HOME/.codex/agents/$a.toml" ]] && ok "Agency agent: $a" || warn "Optional Agency agent missing: $a"; done
echo; echo "Optional cross-functional specialists:"
for a in "${TEAM_SPECIALISTS[@]}"; do [[ -f "$HOME/.codex/agents/$a.toml" ]] && ok "Agency agent: $a" || warn "Optional Agency agent missing: $a"; done
[[ -d "docs/design" ]] && ok "Current project has design memory" || warn "Current project has no docs/design (optional)"
[[ -d "docs/delivery" ]] && ok "Current project has delivery memory" || warn "Current project has no docs/delivery (optional)"
if [[ -e "AGENTS.md" || -d "docs/adr" || -d "docs/adrs" || -d "docs/engineering" ]]; then ok "Current project has engineering instructions/memory"; else warn "Current project has no durable engineering memory (optional)"; fi
command -v codex >/dev/null 2>&1 && ok "Codex CLI found" || warn "Codex CLI not in PATH (Desktop may still exist)"
command -v pen >/dev/null 2>&1 && ok "pen.dev CLI found" || warn "pen.dev CLI not found (optional for Ashley)"
echo; echo "Pinned Agency Agents ref: $AGENCY_AGENTS_REF"; echo "Inside Codex verify /skills, available custom agents, and /mcp."
