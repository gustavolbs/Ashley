#!/usr/bin/env bash
set -euo pipefail

# Curated Agency Agents roster for non-Dave personas.
# These are bounded evidence/research/review workers, not new authorities.

AGENCY_REPO="${AGENCY_AGENTS_REPO:-https://github.com/msitarzewski/agency-agents.git}"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/agency-agents-team.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

AGENTS=(
  # Laila: product/delivery
  product-manager
  feedback-synthesizer
  project-shepherd
  senior-project-manager
  # Ashley: research/finish/brand
  ux-researcher
  ui-finish-gate-reviewer
  brand-guardian
  # Guto: production/reliability/security
  devops-automator
  sre-site-reliability-engineer
  database-reliability-engineer
  incident-response-commander
  security-architect
  # Roberto: strategy/operations/customers/compliance
  business-strategist
  operations-manager
  customer-success-manager
  data-privacy-officer
  legal-compliance-checker
  # Clara: finance
  financial-analyst
  tax-strategist
  investment-researcher
  bookkeeper-controller
  pricing-analyst
  # Ana: growth/search/comms/measurement
  growth-hacker
  seo-specialist
  content-creator
  social-media-strategist
  paid-media-auditor
  ad-creative-strategist
  paid-social-strategist
  ppc-campaign-strategist
  tracking-measurement-specialist
  pr-communications-manager
  analytics-reporter
  experiment-tracker
)

echo "Installing curated non-Dave persona specialists from Agency Agents..."
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
echo "Installed curated team specialist roster:"
printf '  - %s\n' "${AGENTS[@]}"
echo
echo "Restart Codex/ChatGPT Desktop so the agent catalog is reloaded."
echo "Optional supply-chain gate: AI_PERSONAS_REQUIRE_SKILLSPECTOR=1 bash scripts/install-team-specialists.sh"
