#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT/scripts/lib/specialists.sh"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/agency-agents-team.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT
echo "Installing curated team specialists from pinned Agency Agents ref $AGENCY_AGENTS_REF..."
git clone -q "$AGENCY_AGENTS_REPO" "$TMP/repo"
git -C "$TMP/repo" checkout -q --detach "$AGENCY_AGENTS_REF"
if [[ "${AI_PERSONAS_REQUIRE_SKILLSPECTOR:-0}" == "1" ]]; then bash "$ROOT/scripts/scan-external-skill.sh" "$TMP/repo"; fi
(cd "$TMP/repo"; bash scripts/convert.sh --tool codex >/dev/null; bash scripts/install.sh --tool codex --agent "$(IFS=,; echo "${TEAM_SPECIALISTS[*]}")" --no-interactive --no-convert)
printf '\nInstalled curated team specialist roster:\n'; printf '  - %s\n' "${TEAM_SPECIALISTS[@]}"
echo "Pinned upstream: $AGENCY_AGENTS_REF"
