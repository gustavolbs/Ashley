#!/usr/bin/env bash
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST="$ROOT/SPECIALISTS.json"

ok(){ printf "✓ %s\n" "$1"; }
warn(){ printf "! %s\n" "$1"; }

for persona in ashley dave guto roberto clara ana laila; do
  dir="$HOME/.agents/skills/$persona"
  [[ -f "$dir/SKILL.md" ]] && ok "$persona installed" || warn "$persona not found"
  [[ -f "$dir/references/runtime-contracts.md" ]] && ok "$persona runtime contracts bundled" || warn "$persona runtime contracts missing"
done

echo
[[ -f "$HOME/.ashley/PREFERENCES.md" ]] && ok "Ashley global preference memory exists" || warn "Ashley global preference memory missing"

echo
echo "Optional Agency Agents:"
if [[ -f "$MANIFEST" ]]; then
  while IFS='|' read -r persona agent; do
    [[ -f "$HOME/.codex/agents/$agent.toml" ]] && ok "$persona specialist: $agent" || warn "Optional $persona specialist missing: $agent"
  done < <(node -e 'const fs=require("fs"); const m=JSON.parse(fs.readFileSync(process.argv[1],"utf8")).agency_agents; for(const [p,a] of Object.entries(m)) for(const x of a) console.log(p+"|"+x);' "$MANIFEST")
else
  warn "SPECIALISTS.json missing"
fi

echo
for s in ui-ux-pro-max design-taste-frontend gpt-taste impeccable; do
  [[ -d "$HOME/.agents/skills/$s" ]] && ok "Ashley specialist skill: $s" || warn "Optional Ashley specialist missing: $s"
done

echo
[[ -d "docs/design" ]] && ok "Current project has design memory" || warn "Current project has no docs/design (optional)"
[[ -d "docs/delivery" ]] && ok "Current project has delivery memory" || warn "Current project has no docs/delivery (optional)"
if [[ -e "AGENTS.md" || -d "docs/adr" || -d "docs/adrs" || -d "docs/engineering" ]]; then
  ok "Current project has engineering instructions/memory"
else
  warn "Current project has no durable engineering memory (optional)"
fi

command -v codex >/dev/null 2>&1 && ok "Codex CLI found" || warn "Codex CLI not in PATH (Desktop may still exist)"
command -v pen >/dev/null 2>&1 && ok "pen.dev CLI found" || warn "pen.dev CLI not found (optional for Ashley)"

echo
echo "For strict repository-vs-install verification run: bash scripts/verify-installed.sh"
