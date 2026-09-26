#!/usr/bin/env bash
set -euo pipefail
GRAPHIFY_VERSION="${GRAPHIFY_VERSION:-0.9.68}"
echo "Installing optional local Graphify accelerator graphifyy==$GRAPHIFY_VERSION"
if command -v uv >/dev/null 2>&1; then
  uv tool install --force "graphifyy==$GRAPHIFY_VERSION"
elif command -v pipx >/dev/null 2>&1; then
  pipx install --force "graphifyy==$GRAPHIFY_VERSION"
else
  echo "Install uv or pipx explicitly, then install graphifyy==$GRAPHIFY_VERSION." >&2
  exit 2
fi
echo "Graphify is optional; the native project-context cache works without it."
