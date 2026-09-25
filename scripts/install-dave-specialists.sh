#!/usr/bin/env bash
set -euo pipefail

# Optional bounded Agency Agents roster for Dave.
# Dave remains the engineering owner and falls back to himself when a child is
# unavailable or more expensive than the expected quality gain.

AGENCY_REPO="${AGENCY_AGENTS_REPO:-https://github.com/msitarzewski/agency-agents.git}"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/agency-agents.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

AGENTS=(
  ai-engineer
  frontend-developer
  application-security-engineer
  api-tester
  accessibility-auditor
  reality-checker
  code-reviewer
  test-automation-engineer
)

echo "Installing optional Dave specialists from Agency Agents..."
git clone --depth 1 -q "$AGENCY_REPO" "$TMP/repo"
if [[ "${AI_PERSONAS_REQUIRE_SKILLSPECTOR:-0}" == "1" ]]; then
  bash "$ROOT/scripts/scan-external-skill.sh" "$TMP/repo"
fi
(
  cd "$TMP/repo"
  bash scripts/convert.sh --tool codex >/dev/null
  bash scripts/install.sh \
    --tool codex \
    --agent "$(IFS=,; echo "${AGENTS[*]}")" \
    --no-interactive \
    --no-convert
)

echo
echo "Installed Dave specialist roster:"
printf '  - %s\n' "${AGENTS[@]}"
echo
echo "Restart Codex/ChatGPT Desktop so the agent catalog is reloaded."
echo "Optional supply-chain gate: AI_PERSONAS_REQUIRE_SKILLSPECTOR=1 bash scripts/install-dave-specialists.sh"
