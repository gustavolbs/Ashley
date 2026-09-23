#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Prevent a root skill from shadowing the persona skills below.
test ! -f "$ROOT/SKILL.md"
test -f "$ROOT/scripts/doctor.sh"
test -f "$ROOT/skills/ashley/SKILL.md"
test -f "$ROOT/skills/ashley/agents/openai.yaml"
test -f "$ROOT/skills/ashley/scripts/init-project.sh"
test -f "$ROOT/skills/dave/SKILL.md"
test -f "$ROOT/skills/dave/agents/openai.yaml"
test -f "$ROOT/skills/dave/references/engineering.md"
test -f "$ROOT/skills/dave/references/orchestration.md"
test -f "$ROOT/skills/dave/references/git.md"
test -f "$ROOT/skills/dave/references/quality.md"
test -f "$ROOT/skills/dave/references/memory.md"
test -f "$ROOT/skills/dave/references/repository-intake.md"
test -f "$ROOT/skills/dave/scripts/init-project.sh"
test -f "$ROOT/skills/dave/templates/project/docs/engineering/DECISIONS.md"
test -f "$ROOT/evals/dave-orchestration.md"
test -f "$ROOT/evals/dave-memory.md"
test -f "$ROOT/evals/dave-principal-engineer.md"
test -f "$ROOT/evals/full-creative-production.md"
test -f "$ROOT/evals/visual-qa.md"
test -f "$ROOT/evals/design-code-sync.md"
test -f "$ROOT/evals/taste-calibration.md"
test -f "$ROOT/evals/shadcn-materialization.md"
test -f "$ROOT/evals/shadcn-design-first.md"
test -f "$ROOT/skills/ashley/templates/project/docs/design/MESSAGING.md"
test -f "$ROOT/skills/ashley/templates/project/docs/design/ASSETS.md"
test -f "$ROOT/skills/ashley/templates/project/docs/design/HANDOFF.md"

for f in "$ROOT"/scripts/*.sh; do
  bash -n "$f"
done
bash -n "$ROOT/skills/ashley/scripts/init-project.sh"
bash -n "$ROOT/skills/dave/scripts/init-project.sh"

required=(
  product-business.md research.md ux-architecture.md interaction.md
  creative-engine.md visual-design.md brand.md logo.md
  design-systems.md accessibility.md data-dense-saas.md typography-color-layout.md
  content-design.md mobile-responsive.md experimentation.md
  critique.md role-lenses.md specialists.md penpot.md memory.md
  project-intake.md creative-production.md delegation.md learning-loop.md
  taste-calibration.md creative-strategy-messaging.md assets-licensing.md
  design-canvas.md pen-dev.md penpot.md component-library-materialization.md shadcn-materialization.md design-code-sync.md visual-qa.md artifact-dod.md
)

for f in "${required[@]}"; do
  test -f "$ROOT/skills/ashley/references/$f"
done

echo "AI Personas repository validation passed."
