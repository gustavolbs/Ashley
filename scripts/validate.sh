#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

test -f "$ROOT/SKILL.md"
test -f "$ROOT/agents/openai.yaml"
test -f "$ROOT/evals/full-creative-production.md"
test -f "$ROOT/evals/visual-qa.md"
test -f "$ROOT/evals/design-code-sync.md"
test -f "$ROOT/evals/taste-calibration.md"
test -f "$ROOT/templates/project/docs/design/MESSAGING.md"
test -f "$ROOT/templates/project/docs/design/ASSETS.md"
test -f "$ROOT/templates/project/docs/design/HANDOFF.md"

for f in "$ROOT"/scripts/*.sh; do
  bash -n "$f"
done

required=(
  product-business.md research.md ux-architecture.md interaction.md
  creative-engine.md visual-design.md brand.md logo.md
  design-systems.md accessibility.md data-dense-saas.md typography-color-layout.md
  content-design.md mobile-responsive.md experimentation.md
  critique.md role-lenses.md specialists.md penpot.md memory.md
  project-intake.md creative-production.md delegation.md learning-loop.md
  taste-calibration.md creative-strategy-messaging.md assets-licensing.md
  design-canvas.md pen-dev.md penpot.md design-code-sync.md visual-qa.md artifact-dod.md
)

for f in "${required[@]}"; do
  test -f "$ROOT/references/$f"
done

echo "Ashley repository validation passed."
