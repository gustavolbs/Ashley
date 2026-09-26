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


## Local project-context reuse

New chats do not imply new repository discovery. Every persona ships the same
stdlib-only project-context helper and shared boot contract.

For Git repositories the cache lives under `<git-dir>/ai-personas/`, outside
the working tree. It stores a compact project map plus branch/HEAD/worktree
fingerprints. A fresh session can therefore prove that its previous context is
still current using cheap local Git operations.

```text
new chat
   |
project-context show
   |
   +-- FRESH --------> compact snapshot -> task files only
   |
   +-- STALE --------> committed/dirty delta -> targeted reconciliation
   |
   +-- NEEDS_CONTEXT -> one proportional discovery -> checkpoint
```

Current code/config/tests always outrank the cache. The snapshot is navigation
memory, not a generated source of truth.

Graphify can be installed as an optional local code-graph accelerator for
multi-hop dependency/impact questions. It is never required and its output is
kept in the same Git-metadata cache rather than committed or deployed.
