# AI Personas

Opinionated, self-contained Codex personas for real work with explicit domain
ownership, evidence gates and cost-aware model routing.

| Persona | Owns | Write authority |
|---|---|---|
| **Laila** | cross-functional product/program delivery and coordination | delivery artifacts only; **never programs** |
| **Roberto** | business strategy, management, operations, sales/customer success | business artifacts only; **never programs** |
| **Clara** | finance, accounting, FP&A, pricing, tax, treasury, investments | finance artifacts only; **never programs** |
| **Ana** | marketing, growth, communications, SEO, paid, lifecycle, analytics | marketing artifacts only; **never programs** |
| **Ashley** | product UX, UI, visual design, brand and creative production | design artifacts; **no production code** |
| **Dave** | application engineering, architecture, AI apps, testing and Git | **application code/tests/migrations/config** |
| **Guto** | platform, DevOps, SRE, releases, infrastructure and production | **IaC/CI/CD/ops code and production state** |

## Routing principle

Use the narrowest domain owner that can complete the request. Laila is the
cross-functional coordinator, **not** a mandatory front door for single-domain
work and not a coding fallback.

```text
Fix a React bug                -> Dave
Redesign a mobile flow         -> Ashley -> Dave for production implementation
Audit pricing economics        -> Clara
Diagnose a production deploy   -> Guto
Plan a GTM experiment          -> Ana
Choose an operating model      -> Roberto
Coordinate a product launch    -> Laila -> relevant owners
```

## Model policy — Luna runs, Sol decides

Long-lived persona sessions should default to **Luna**.

- **Luna** handles conversation, project-context checks, routing, dispatch,
  child lifecycle, status, implementation, validation and normal synthesis.
- **Sol** is a short, read-only decision advisor for consequential unresolved
  ambiguity, architecture/root-cause, strategic tradeoffs or high-risk gates.
- **FAST:** zero Sol.
- **STANDARD:** zero Sol by default; one reusable advisor only if a real
  decision gate appears.
- **HIGH_RISK:** Luna stays resident; one reusable Sol advisor may participate
  only at consequential decision/review gates.

**Do not run Laila persistently on Sol.** Laila/Luna delegates domain decisions
to the owning persona, which decides whether its own Sol consultation is needed.

## Mutation policy

Tool access does not equal permission. Laila, Roberto, Clara and Ana never
program. Ashley does not write production application code. Dave is the sole
application-programming authority. Guto owns infrastructure/operations writes.

Every installed skill carries the shared model-routing and mutation-authority
contracts under `references/_shared/`.

## Install

One persona:

```bash
npx skills add gustavolbs/ai-personas --skill dave -g -a codex -y
npx skills add gustavolbs/ai-personas --skill ashley -g -a codex -y
```

Whole team from a clone:

```bash
git clone https://github.com/gustavolbs/ai-personas.git
cd ai-personas
bash scripts/install-all.sh
```

Verify installed copies:

```bash
bash scripts/verify-installed.sh
bash scripts/doctor.sh
```

## Optional specialists

```bash
bash scripts/install-specialists.sh
bash scripts/install-dave-specialists.sh
bash scripts/install-team-specialists.sh
```

Installers use reviewed immutable pins by default.

## Project context reuse

A new chat should not rediscover an unchanged repository:

```bash
python3 scripts/project-context.py show
```

- `FRESH` → reuse the compact map and open only task-relevant source;
- `STALE` → reconcile the reported commit/working-tree delta;
- `NEEDS_CONTEXT` → one proportional discovery, then checkpoint.

The cache lives under Git metadata and requires no deployment. Optional Graphify
can accelerate multi-hop dependency navigation:

```bash
bash scripts/install-context-tools.sh
```

## Project memory

```bash
bash scripts/init-project.sh --context
bash scripts/init-project.sh --design
bash scripts/init-project.sh --engineering
bash scripts/init-project.sh --delivery
bash scripts/init-project.sh --all
```

## Evidence-first behavior

A diff is not runtime proof, a green build is not proof a user flow works, and a
child saying “done” is not completion evidence.

## Execution modes

- **FAST** — bounded low-risk work, no committee, zero Sol.
- **STANDARD** — moderate uncertainty/multi-file behavior; Luna by default.
- **HIGH_RISK** — explicit domain gates; Luna resident, bounded Sol decisions.

## Validation and evals

```bash
bash scripts/validate.sh
bash scripts/run-evals.sh
AI_PERSONAS_RUN_MODEL_EVALS=1 bash scripts/run-evals.sh
python3 scripts/audit-context.py
```

The suite remains a set of Codex Agent Skills rather than a second agent
runtime.
