#!/usr/bin/env bash
set -u
ok(){ printf "✓ %s\n" "$1"; }
warn(){ printf "! %s\n" "$1"; }

for persona in ashley dave guto roberto clara ana laila; do
  [[ -f "$HOME/.agents/skills/$persona/SKILL.md" ]] && ok "$persona installed" || warn "$persona not found"
done
[[ -f "$HOME/.ashley/PREFERENCES.md" ]] && ok "Ashley global preference memory exists" || warn "Ashley global preference memory missing"

for s in ui-ux-pro-max design-taste-frontend gpt-taste impeccable; do
  [[ -d "$HOME/.agents/skills/$s" ]] && ok "Ashley specialist: $s" || warn "Optional Ashley specialist missing: $s"
done

echo
if [[ -d "$HOME/.agents/skills/caveman" ]]; then
  ok "Caveman skill installed (optional Dave token compression)"
else
  warn "Caveman skill not found (Dave native token budgeting still works)"
fi
command -v caveman >/dev/null 2>&1 && ok "Caveman CLI/proxy available (optional)" || warn "Caveman CLI/proxy not found (optional)"
echo
echo "Dave / Agency Agents:"
for a in frontend-developer backend-architect mobile-app-builder code-reviewer api-tester reality-checker evidence-collector test-automation-engineer accessibility-auditor; do
  [[ -f "$HOME/.codex/agents/$a.toml" ]] && ok "Agency agent: $a" || warn "Optional Agency agent missing: $a"
done

[[ -d "docs/design" ]] && ok "Current project has design memory" || warn "Current project has no docs/design"
[[ -d "docs/delivery" ]] && ok "Current project has Laila delivery memory" || warn "Current project has no docs/delivery (optional)"
if [[ -e "AGENTS.md" || -d "docs/adr" || -d "docs/adrs" || -d "docs/engineering" ]]; then
  ok "Current project has engineering instructions/memory"
else
  warn "Current project has no durable engineering memory (optional)"
fi

command -v codex >/dev/null 2>&1 && ok "Codex CLI found" || warn "Codex CLI not in PATH (Desktop may still exist)"
command -v pen >/dev/null 2>&1 && ok "pen.dev CLI found" || warn "pen.dev CLI not found (optional for Ashley)"

echo
echo "Inside Codex verify /skills, available custom agents, and /mcp."
