# AI Personas

**AI Personas is a suite of opinionated Codex Agent Skills that own real work
end-to-end while preserving clear domain authority, evidence and execution
cost.**

| Persona | Primary ownership |
|---|---|
| **Laila** | Cross-functional product/program delivery, scope, dependencies and acceptance |
| **Roberto** | Business strategy, management, operations, sales/customer success and organization |
| **Clara** | Finance, accounting, FP&A, pricing economics, tax, treasury and investments |
| **Ana** | Marketing, growth, SEO/AEO/GEO, content, paid media, lifecycle, PR and analytics |
| **Ashley** | Product UX, interaction/UI, visual design, brand and creative production |
| **Dave** | Application/software engineering, architecture, testing, refactoring and Git |
| **Guto** | Platform, DevOps, SRE, infrastructure, releases and production reliability |

Each persona is a self-contained skill under `skills/<name>/`. Detailed
knowledge is progressively disclosed through `references/`; deterministic
helpers live in `scripts/`.

## Routing philosophy

**Use the domain owner directly.** Laila is the coordinator for materially
cross-functional outcomes, not a mandatory front door.

```text
React/API/mobile/AI application work -> Dave
UX/UI/brand/design artifact          -> Ashley
Cloud/CI/CD/production/SRE           -> Guto
Finance/accounting/tax/capital       -> Clara
Business/operations/revenue model    -> Roberto
Marketing/growth/comms               -> Ana
Multi-domain delivery/dependencies   -> Laila
```

Frontmatter descriptions deliberately include boundaries so adjacent skills do
not all trigger for the same request.

## Sol thinks; Luna executes

The shared model-routing contract uses two roles:

```text
Sol  = investigation, root cause, architecture, strategy, decomposition,
       orchestration and consequential decisions

Luna = bounded implementation/execution, tests, calculations, variants,
       routine diagnostics and applying review feedback
```

A clear low-risk `FAST` task can skip Sol and run directly on Luna.

When a Luna parent needs real decision work, it can spawn a Sol planner and
then execute the returned compact execution packet. When the planner/executor
already exists, the lifecycle contract prefers resuming that child rather than
respawning fresh context.

See `docs/MODEL_ROUTING.md`.

## Portable runtime contracts

A skill installed by itself cannot assume the repository-root `docs/` folder
exists. The canonical shared contracts are therefore bundled into every skill
as generated `references/runtime-contracts.md`.

Canonical sources:

- `docs/EXECUTION_MODES.md`;
- `docs/MODEL_ROUTING.md`;
- `docs/DELEGATION_LIFECYCLE.md`;
- `docs/ANTI_SLOP.md`.

`scripts/sync-runtime-contracts.sh --check` prevents generated copies from
drifting.

## Evidence-first / anti-hallucination

Every persona distinguishes what was proposed, changed, built, run and actually
verified.

Examples:

- a diff does not prove runtime behavior;
- a green build does not prove a user flow;
- a child-agent claim is not integrated evidence;
- a design write does not prove rendered visual quality;
- production change success requires post-change signals appropriate to risk.

Each persona has domain-specific evidence guidance in its references.

## Install

Install one persona:

```bash
npx skills add gustavolbs/ai-personas --skill dave -g -a codex -y
```

Install the whole suite from a clone:

```bash
git clone https://github.com/gustavolbs/ai-personas.git
cd ai-personas
bash scripts/install-all.sh
```

Verify that the complete installed skill trees match the repository:

```bash
bash scripts/verify-installed.sh
```

Inspect optional local tools/specialists:

```bash
bash scripts/doctor.sh
```

## Project memory

AI Personas prefers existing project-owned sources of truth. Optional memory is
initialized only when useful.

```bash
bash scripts/init-project.sh --design       # Ashley
bash scripts/init-project.sh --engineering  # Dave
bash scripts/init-project.sh --delivery     # Laila
bash scripts/init-project.sh --all
```

The root initializer no longer silently initializes only one persona.

## Optional specialists

Personas can use bounded specialist agents, but specialists never replace the
persona's domain authority.

The Agency Agents roster has one source of truth:

```text
SPECIALISTS.json
```

Third-party installer inputs are reproducibly pinned:

```text
THIRD_PARTY.lock.json
```

Install optional rosters:

```bash
bash scripts/install-dave-specialists.sh
bash scripts/install-team-specialists.sh
bash scripts/install-specialists.sh
```

The last command installs Ashley's optional Taste, UI/UX Pro Max and Impeccable
inputs from pinned revisions/versions. To require SkillSpector for cloned
third-party bundles, set `AI_PERSONAS_REQUIRE_SKILLSPECTOR=1`.

## Execution proportionality

Shared execution modes prevent agent theater:

- **FAST** — direct owner, no child graph, one targeted proof;
- **STANDARD** — moderate uncertainty/cross-layer scope, bounded delegation or
  independent review only when useful;
- **HIGH_RISK** — security/privacy/money/production/migrations/destructive
  actions/critical contracts retain their stronger gates.

See `docs/EXECUTION_MODES.md`.

## Behavioral evals

The repository keeps human-readable Markdown regression scenarios plus an
executable routing harness.

Validate the suite without model usage:

```bash
bash scripts/validate.sh
node evals/run-behavior-evals.mjs
```

Run live Codex routing evals:

```bash
node evals/run-behavior-evals.mjs --live
node evals/run-behavior-evals.mjs --live --all
```

Live JSONL traces capture command counts and token usage so routing changes can
be evaluated for efficiency as well as correctness. Eval artifacts are ignored
by Git.

## Optional quality tooling

AI Personas can integrate external quality tools without making them hidden
requirements:

- AIslop — deterministic changed-code quality signal;
- NVIDIA SkillSpector — third-party skill/bundle scanner;
- Reticle — supported web/desktop runtime verification;
- selected UI Skills — narrow design-engineering lenses;
- ECC-derived workflows — targeted TDD/verification/research/recovery patterns.

Native project linting, typechecking, tests, security checks and runtime/visual
evidence remain authoritative.

## Repository map

```text
skills/                    self-contained persona packages
docs/                      canonical suite/runtime contracts
evals/                     regression briefs + executable behavior harness
scripts/                   install, sync, doctor and validation helpers
PERSONAS.json              suite/persona versions
SPECIALISTS.json           canonical specialist rosters
THIRD_PARTY.lock.json      pinned optional external inputs
VERSION                    suite version
```

Read:

- `docs/ARCHITECTURE.md` — system design;
- `docs/USAGE.md` — practical routing and commands;
- `docs/MODEL_ROUTING.md` — Sol/Luna control/execution plane;
- `docs/EXECUTION_MODES.md` — FAST/STANDARD/HIGH_RISK;
- `docs/VERSIONING.md` — release policy;
- `evals/README.md` — regression/eval protocol.

## Design principle

The suite should become **more reliable without becoming more ceremonial**.

Prefer precise routing, compact task capsules, progressive disclosure,
deterministic checks, reusable child context and evidence over more agents,
more permanent prompt text or more framework layers.
