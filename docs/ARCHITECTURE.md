# AI Personas Architecture

AI Personas is a suite of independent Codex Agent Skills with shared runtime
contracts. There is no persona server, daemon, database or second orchestration
runtime.

## Runtime shape

```text
User
 ├─ single-domain request ───────────────> domain persona
 │                                         ├─ SKILL.md (small router/authority)
 │                                         ├─ references/ (loaded on demand)
 │                                         ├─ runtime-contracts.md (generated)
 │                                         └─ optional bounded specialists
 │
 └─ materially cross-functional request -> Laila
                                           └─ domain persona owners
                                              └─ bounded specialists
```

Domain authority stays local:

- Roberto — business strategy and operations;
- Clara — financial truth and capital;
- Ana — marketing, growth and communications;
- Ashley — product experience, visual design and brand;
- Dave — application/software engineering;
- Guto — platform, production and reliability;
- Laila — cross-functional scope, dependencies, acceptance and delivery.

Laila is not a mandatory gateway. A request with one clear domain should invoke
that domain persona directly.

## Progressive disclosure

Skill discovery starts from each skill's `name` and `description`. The full
`SKILL.md` is loaded only when the skill is selected, and detailed references
are loaded only when the workflow needs them.

Therefore:

1. frontmatter descriptions optimize routing precision;
2. `SKILL.md` keeps authority, the operating loop and the shortest critical
   rules;
3. domain depth lives in `references/`;
4. deterministic helpers live in `scripts/`;
5. project-memory templates live in `templates/`.

The repository audit enforces a size budget on `SKILL.md` to prevent prompt
growth from silently becoming permanent context cost.

## Portable shared contracts

Repository-level contracts are canonical under `docs/`:

- `EXECUTION_MODES.md`;
- `MODEL_ROUTING.md`;
- `DELEGATION_LIFECYCLE.md`;
- `ANTI_SLOP.md`.

A standalone installed skill cannot assume that repository-root `docs/` also
exists. `scripts/sync-runtime-contracts.sh` therefore generates
`skills/<persona>/references/runtime-contracts.md` for every persona.

CI runs the sync script in `--check` mode. A canonical contract edit that is
not propagated into every skill fails validation.

## Model control plane

The shared default is:

```text
decision / investigation / orchestration -> Sol
bounded execution / implementation       -> Luna
```

A clear low-risk `FAST` task can skip Sol and execute directly on Luna.

The runtime contract also handles the active parent model:

- Luna parent: spawn/reuse a Sol planner when a real decision phase is needed,
  then execute on Luna;
- Sol parent: freeze the decision/execution packet, delegate execution to Luna,
  and avoid streaming routine logs into Sol;
- when a child already has the right compact context, resume it with
  `followup_task` instead of respawning it.

Exact model slugs remain provider-local. Role separation is more important than
silently crossing provider families.

## Execution modes

Every persona uses the same proportionality model:

- `FAST` — direct owner, no committee, one targeted proof;
- `STANDARD` — moderate uncertainty or multi-file/cross-layer work, bounded
  delegation/review only when it changes quality;
- `HIGH_RISK` — security, privacy, money, production, migrations, destructive
  actions, critical contracts or similarly consequential decisions.

Risk gates are authority rules, not model-quality rules. A stronger model does
not remove required human approval.

## Delegation topology

Persona owners may use lower-level specialists inside their domain. A persona
invoked by Laila returns peer-domain dependencies to Laila rather than building
a peer-to-peer mesh.

The shared lifecycle contract requires terminal child results and prefers
context reuse over respawn. Concurrency is bounded and reduced after shared
capacity failures.

Specialist rosters are defined once in `SPECIALISTS.json`. Installers and the
doctor command read that manifest instead of maintaining independent lists.

## Reproducible third-party inputs

Optional external tools remain external, but installer inputs are pinned in
`THIRD_PARTY.lock.json`.

Current lock classes include:

- Agency Agents repository commit;
- Taste repository commit;
- UI/UX Pro Max CLI version;
- Impeccable CLI version.

Upgrades are deliberate repository changes: update the lock, review/scan the
new input, run validation/evals and commit the new pin.

## Evidence and anti-hallucination

All personas distinguish proposal, mutation and proof. Domain evidence files
define what counts as verification for that persona.

Examples:

- a diff does not prove runtime behavior;
- a green build does not prove a user flow;
- a child response does not prove integrated correctness;
- a design-layer write does not prove rendered visual quality;
- production success requires post-change operational evidence.

## Durable memory

Memory adapts to existing project sources of truth instead of creating parallel
databases.

- Ashley: `docs/design/` when needed;
- Dave: existing AGENTS/ADRs/engineering docs first, optional
  `docs/engineering/`;
- Laila: tracker/project docs first, optional `docs/delivery/`;
- other personas prefer existing domain-owned project documents and store only
  durable decisions/assumptions when necessary.

Executable/reconciled current truth overrides stale memory.

## Evaluation architecture

The original Markdown scenarios remain human-readable regression briefs.

The executable layer adds:

- `evals/behavior-cases.json` — cross-persona routing cases;
- `evals/behavior.schema.json` — structured result contract;
- `evals/run-behavior-evals.mjs` — `codex exec --json` runner.

Repository CI runs the harness in manifest-validation mode without spending
model quota. A maintainer can run live cases locally and capture JSONL traces,
routing results, command counts and token usage under `evals/artifacts/`.

## Installation integrity

`scripts/install-all.sh` copies the canonical repository skill directories to
`~/.agents/skills/<persona>`.

`scripts/verify-installed.sh` compares a recursive digest of each installed
skill tree against the repository, so stale references/scripts/templates can no
longer hide behind a matching `SKILL.md` and version number.

## Design principle

Add intelligence only when it earns permanent complexity.

Prefer:

- a precise trigger over another coordinator;
- a reference over a longer always-on prompt;
- a deterministic script over repeated prose;
- a shared generated contract over duplicated policy;
- one authoritative manifest over synchronized hand-maintained lists;
- an executable eval over confidence from inspection alone.
