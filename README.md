# AI Personas

Opinionated, self-contained Codex personas for real work with explicit domain
ownership, evidence gates and cost-aware model routing.

| Persona | Owns |
|---|---|
| **Laila** | cross-functional product/program delivery and coordination |
| **Roberto** | business strategy, management, operations, sales/customer success |
| **Clara** | finance, accounting, FP&A, pricing, tax, treasury, investments |
| **Ana** | marketing, growth, communications, SEO, paid, lifecycle, analytics |
| **Ashley** | product UX, UI, visual design, brand and creative production |
| **Dave** | application engineering, architecture, AI apps, testing and Git |
| **Guto** | platform, DevOps, SRE, releases, infrastructure and production |

## Routing principle

Use the narrowest domain owner that can complete the request. Laila is the
cross-functional coordinator, **not** a mandatory front door for single-domain
work.

```text
Fix a React bug                -> Dave
Redesign a mobile flow         -> Ashley
Audit pricing economics        -> Clara
Diagnose a production deploy   -> Guto
Plan a GTM experiment          -> Ana
Choose an operating model      -> Roberto
Coordinate a product launch    -> Laila -> relevant owners
```

## Model policy

The shared runtime contract uses:

- **Sol** for investigation, root cause, architecture, orchestration and
  consequential decisions;
- **Luna** for bounded execution from an approved decision packet;
- **FAST** tasks can execute directly on Luna;
- one Sol planning thread should normally be reused when execution discovers a
  new decision instead of spawning a fresh planner repeatedly.

Each installed skill carries its own copy of the shared routing, execution-mode
and anti-slop contracts under `references/_shared/`, so it remains
self-contained when installed independently.

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

Verify the installed package copies:

```bash
bash scripts/verify-installed.sh
bash scripts/doctor.sh
```

## Optional specialists

Specialists are bounded workers/reviewers, never replacement authorities.

```bash
bash scripts/install-specialists.sh       # Ashley design tools
bash scripts/install-dave-specialists.sh  # engineering reviewers/workers
bash scripts/install-team-specialists.sh  # product/business/finance/growth/SRE
```

Installers use reviewed immutable pins by default. Controlled upgrades can
override the pin/version through the documented environment variables and
should be followed by validation/evals.

## Project context reuse

A new chat should not rediscover an unchanged repository.

Each persona first checks a local cache stored under the clone/worktree Git
metadata:

```bash
python3 scripts/project-context.py show
```

- `FRESH` → reuse the compact project map and open only task-relevant source;
- `STALE` → reconcile the reported commit/working-tree delta;
- `NEEDS_CONTEXT` → do one proportional discovery, then checkpoint it.

The cache never outranks current code/tests/config and never dirties the repo.

For optional large-repo dependency/impact navigation:

```bash
bash scripts/install-context-tools.sh
```

This installs pinned Graphify locally. Graphify is optional; no server, MCP
service, vector database or deployment is required.

## Project memory

Initialize only the domains that need durable project memory:

```bash
bash scripts/init-project.sh --context
bash scripts/init-project.sh --design
bash scripts/init-project.sh --engineering
bash scripts/init-project.sh --delivery
bash scripts/init-project.sh --all
```

Existing ADRs, issue trackers, runbooks, design docs and executable repository
truth remain authoritative; persona memory must not become a stale duplicate.

## Evidence-first behavior

Every persona distinguishes proposed/changed/built/run/verified states. A diff
is not runtime proof, a green build is not proof a user flow works, and a child
agent saying “done” is not completion evidence.

Examples:

- Dave must inspect runtime pixels before claiming a visual fix is verified.
- Ashley must inspect rendered/exported pixels before passing high-fidelity QA.
- Guto requires post-change operational evidence and credible rollback/recovery.
- Clara keeps units, dates, assumptions and financial evidence explicit.
- Laila closes work only from integrated acceptance evidence, not worker status.

## Execution modes

- **FAST** — bounded low-risk work, no committee, one targeted check.
- **STANDARD** — moderate uncertainty/multi-file behavior with proportional QA.
- **HIGH_RISK** — security/data/production/migration/material decisions with
  explicit domain gates and approval where required.

See the packaged `references/_shared/` contracts inside each skill.

## Validation and evals

Structural/reliability CI:

```bash
bash scripts/validate.sh
```

Static routing/runtime-contract regression:

```bash
bash scripts/run-evals.sh
```

Optional live Codex traces:

```bash
AI_PERSONAS_RUN_MODEL_EVALS=1 bash scripts/run-evals.sh
```

Live results are stored in `.eval-results/` by default and summarized for
Sol/Luna/tool activity. Trace counters are diagnostics; acceptance still comes
from each eval's expected behavior and evidence.

Context footprint:

```bash
python3 scripts/audit-context.py
```

## Repository structure

```text
skills/<persona>/
  SKILL.md
  VERSION
  agents/openai.yaml
  references/
    _shared/
    ...domain references
  scripts/ and templates/ when needed

docs/       canonical suite contracts and architecture
evals/      regression scenarios
scripts/    validation, installation, synchronization and eval tooling
```

The suite deliberately remains a set of Codex Agent Skills rather than a new
agent runtime.
