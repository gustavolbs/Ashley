#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

bash "$ROOT/scripts/audit-personas.sh"

for f in "$ROOT"/scripts/*.sh; do
  bash -n "$f"
done
bash -n "$ROOT/skills/ashley/scripts/init-project.sh"
bash -n "$ROOT/skills/dave/scripts/init-project.sh"
bash -n "$ROOT/skills/laila/scripts/init-project.sh"
bash -n "$ROOT/scripts/install-dave-specialists.sh"
bash -n "$ROOT/scripts/install-team-specialists.sh"
bash -n "$ROOT/scripts/scan-external-skill.sh"
bash -n "$ROOT/scripts/scan-project-quality.sh"

required_files=(
  "CHANGELOG.md"
  "scripts/verify-installed.sh"
  "scripts/install-dave-specialists.sh"
  "scripts/install-team-specialists.sh"
  "PERSONAS.json"
  "docs/VERSIONING.md"
  "docs/ENGINEERING_STANDARDS.md"
  "docs/REVIEW_STANDARDS.md"
  "docs/ECC_INTEGRATION.md"
  "docs/ANTI_SLOP.md"
  "docs/EXECUTION_MODES.md"
  "skills/ashley/references/evidence.md"
  "skills/ashley/references/ui-skills-integration.md"
  "skills/dave/references/evidence.md"
  "skills/guto/references/evidence.md"
  "skills/roberto/references/evidence.md"
  "skills/clara/references/evidence.md"
  "skills/clara/references/system-audit.md"
  "skills/ana/references/evidence.md"
  "skills/laila/references/evidence.md"
  "evals/financial-flow-existing-project.md"
  "evals/team-evidence-hallucination.md"
  "skills/ashley/references/team-integration.md"
  "skills/dave/references/architecture.md"
  "skills/dave/references/engineering.md"
  "skills/dave/references/orchestration.md"
  "skills/dave/references/git.md"
  "skills/dave/references/quality.md"
  "skills/dave/references/memory.md"
  "skills/dave/references/repository-intake.md"
  "skills/dave/references/refactoring.md"
  "skills/dave/references/token-efficiency.md"
  "skills/dave/references/mobile.md"
  "skills/dave/references/desktop.md"
  "skills/dave/references/ai-systems.md"
  "skills/dave/references/stack-standards.md"
  "skills/dave/references/security-implementation.md"
  "skills/dave/references/ui-qa.md"
  "skills/dave/references/external-review.md"
  "skills/dave/references/team-integration.md"
  "skills/dave/references/ecc-workflows.md"
  "skills/dave/references/quality-tools.md"
  "skills/guto/references/platform.md"
  "skills/guto/references/delivery.md"
  "skills/guto/references/reliability.md"
  "skills/guto/references/orchestration.md"
  "skills/guto/references/governance.md"
  "skills/roberto/references/strategy.md"
  "skills/roberto/references/operations.md"
  "skills/roberto/references/revenue-people-governance.md"
  "skills/clara/references/accounting-tax.md"
  "skills/clara/references/planning-pricing.md"
  "skills/clara/references/treasury-risk.md"
  "skills/ana/references/strategy.md"
  "skills/ana/references/measurement.md"
  "skills/ana/references/communications-martech.md"
  "skills/laila/references/planning.md"
  "skills/laila/references/acceptance.md"
  "skills/laila/references/product-management.md"
  "skills/laila/references/ecc-workflows.md"
  "skills/laila/references/governance.md"
  "skills/laila/references/lifecycle-resilience.md"
  "skills/laila/scripts/init-project.sh"
  "skills/laila/templates/project/docs/delivery/CHARTER.md"
  "evals/README.md"
  "evals/ecc-workflows.md"
  "evals/anti-slop-quality.md"
  "evals/fast-path.md"
  "evals/provider-local-routing.md"
  "evals/team-routing.md"
  "evals/subagent-lifecycle.md"
  "evals/team-privacy-compliance.md"
  "evals/team-incident.md"
  "evals/team-replan-cancel.md"
  "evals/roberto-revenue-people.md"
  "evals/clara-treasury-risk.md"
  "evals/ana-crisis-martech.md"
  "evals/dave-architecture.md"
  "evals/dave-ai-systems.md"
  "evals/dave-desktop.md"
  "evals/guto-governance.md"
  "evals/ashley-team-handoff.md"
  "evals/dave-orchestration.md"
  "evals/dave-memory.md"
  "evals/dave-refactor.md"
  "evals/dave-mobile.md"
  "evals/dave-principal-engineer.md"
  "evals/guto-production-release.md"
  "evals/laila-cross-functional.md"
  "evals/clara-pricing-cash.md"
  "evals/ana-growth-plan.md"
  "evals/full-creative-production.md"
  "evals/visual-qa.md"
  "evals/design-code-sync.md"
  "evals/taste-calibration.md"
  "evals/shadcn-materialization.md"
  "evals/shadcn-design-first.md"
)

for path in "${required_files[@]}"; do
  [[ -f "$ROOT/$path" ]] || { echo "missing required file: $path" >&2; exit 1; }
done

ashley_required=(
  product-business.md research.md ux-architecture.md interaction.md
  creative-engine.md visual-design.md brand.md logo.md
  design-systems.md accessibility.md data-dense-saas.md typography-color-layout.md
  content-design.md mobile-responsive.md experimentation.md critique.md
  role-lenses.md specialists.md memory.md project-intake.md creative-production.md
  delegation.md learning-loop.md taste-calibration.md creative-strategy-messaging.md
  assets-licensing.md design-canvas.md pen-dev.md penpot.md
  component-library-materialization.md shadcn-materialization.md
  design-code-sync.md visual-qa.md artifact-dod.md team-integration.md
)
for f in "${ashley_required[@]}"; do
  [[ -f "$ROOT/skills/ashley/references/$f" ]] || { echo "missing Ashley reference: $f" >&2; exit 1; }
done

echo "AI Personas repository validation passed."
