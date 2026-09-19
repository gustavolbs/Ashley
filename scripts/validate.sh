#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

test -f "$ROOT/SKILL.md"
test -f "$ROOT/agents/openai.yaml"

for f in "$ROOT"/scripts/*.sh; do
  bash -n "$f"
done

required=(
  product-business.md research.md ux-architecture.md interaction.md
  creative-engine.md visual-design.md brand.md logo.md
  design-systems.md accessibility.md data-dense-saas.md typography-color-layout.md
  content-design.md mobile-responsive.md experimentation.md
  critique.md role-lenses.md specialists.md penpot.md memory.md
)

for f in "${required[@]}"; do
  test -f "$ROOT/references/$f"
done

echo "Ashley repository validation passed."
