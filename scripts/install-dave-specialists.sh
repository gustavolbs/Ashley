#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCK="$ROOT/THIRD_PARTY.lock.json"
MANIFEST="$ROOT/SPECIALISTS.json"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/agency-agents.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

read_json() {
  node -e 'const fs=require("fs"); const v=JSON.parse(fs.readFileSync(process.argv[1],"utf8")); const path=process.argv[2].split("."); let x=v; for (const k of path) x=x[k]; console.log(Array.isArray(x)?x.join(","):x);' "$1" "$2"
}

AGENCY_REPO="${AGENCY_AGENTS_REPO:-$(read_json "$LOCK" agency_agents.repository)}"
AGENCY_COMMIT="${AGENCY_AGENTS_COMMIT:-$(read_json "$LOCK" agency_agents.commit)}"
AGENTS_CSV="$(read_json "$MANIFEST" agency_agents.dave)"
IFS=',' read -r -a AGENTS <<< "$AGENTS_CSV"

echo "Installing optional Dave specialists from pinned Agency Agents commit $AGENCY_COMMIT..."
git init -q "$TMP/repo"
git -C "$TMP/repo" remote add origin "$AGENCY_REPO"
git -C "$TMP/repo" fetch --depth 1 -q origin "$AGENCY_COMMIT"
git -C "$TMP/repo" checkout --detach -q FETCH_HEAD

if [[ "${AI_PERSONAS_REQUIRE_SKILLSPECTOR:-0}" == "1" ]]; then
  bash "$ROOT/scripts/scan-external-skill.sh" "$TMP/repo"
fi

(
  cd "$TMP/repo"
  bash scripts/convert.sh --tool codex >/dev/null
  bash scripts/install.sh     --tool codex     --agent "$(IFS=,; echo "${AGENTS[*]}")"     --no-interactive     --no-convert
)

echo
echo "Installed Dave specialist roster from SPECIALISTS.json:"
printf '  - %s\n' "${AGENTS[@]}"
echo
echo "Restart Codex/ChatGPT Desktop so the agent catalog is reloaded."
