# AI Personas Architecture

AI Personas is a seven-persona Codex skill suite. Each persona is independently
installable and owns one domain; the suite adds cross-persona contracts without
requiring a separate runtime.

## Ownership graph

```text
                         user
                          |
          single-domain request -> domain owner directly
                          |
              cross-functional outcome
                          v
                        Laila
       +----------+------+------+------+------+----------+
       v          v             v      v      v          v
    Roberto     Clara          Ana   Ashley   Dave      Guto
    business   finance       growth  design software  platform
```

Laila is coordination authority, not a universal parent. Single-domain work
should enter through its domain owner directly.

## Self-contained skill packages

Each `skills/<persona>/` carries `SKILL.md`, on-demand references, discovery
metadata and packaged shared contracts under `references/_shared/`. Root
ANTI_SLOP, EXECUTION_MODES and MODEL_ROUTING docs are canonical sources;
`scripts/sync-shared-contracts.sh` copies them into each skill and CI rejects drift.

## Runtime and models

Codex is the runtime; there is no persona daemon/database. Ephemeral children are
optional leverage. Sol is the decision/control plane, Luna is bounded execution,
FAST work may stay on Luna, and one Sol planner should normally be reused for a
task rather than recreated for every decision.

## Evidence, memory and dependencies

Worker status is not proof. Each domain preserves explicit unverified states.
Durable memory prefers project-owned sources of truth and never stores secrets.
Third-party specialist installers use a reviewed pinned upstream commit by
default so an upstream HEAD change cannot silently alter the runtime.
