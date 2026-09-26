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
                     Laila / Luna
       +----------+------+------+------+------+----------+
       v          v             v      v      v          v
    Roberto     Clara          Ana   Ashley   Dave      Guto
    business   finance       growth  design software  platform
```

Laila is coordination authority, not a universal parent. She never programs.

## Mutation ownership

Read authority is broad; write authority is narrow:

```text
application source/tests/migrations/config -> Dave
infrastructure/IaC/CI/CD/production        -> Guto
editable design artifacts/specs            -> Ashley
delivery plans/status                      -> Laila
business/finance/marketing artifacts       -> owning domain persona
```

Write-capable tools never expand persona authority.

## Runtime and models

Codex is the runtime; there is no persona daemon/database.

```text
persistent persona session: Luna
        |
        +-- context/routing/tools/execution/synthesis
        |
        +-- consequential unresolved decision?
                 |
                 +-- no -> remain Luna
                 |
                 +-- yes -> reusable Sol advisor (read-only)
                                  |
                             decision packet
                                  |
                                  v
                                 Luna
```

FAST uses no Sol. STANDARD uses no Sol by default. HIGH_RISK keeps Luna resident
and calls Sol only at consequential decision/review gates. Laila must never be
the persistent Sol orchestrator.

## Self-contained skill packages

Each `skills/<persona>/` carries `SKILL.md`, on-demand references, discovery
metadata and packaged shared contracts under `references/_shared/`.
Canonical root contracts are synchronized into each skill and CI rejects drift.

## Evidence, memory and dependencies

Worker status is not proof. Each domain preserves explicit unverified states.
Durable memory prefers project-owned sources of truth and never stores secrets.
Third-party specialist installers use reviewed pinned upstream versions.

## Local project-context reuse

New chats do not imply new repository discovery. Every persona ships the same
stdlib-only project-context helper and shared boot contract.

For Git repositories the cache lives under `<git-dir>/ai-personas/`, outside
the working tree. It stores a compact project map plus branch/HEAD/worktree
fingerprints.

```text
new chat
   |
project-context show
   |
   +-- FRESH --------> compact snapshot -> task files only
   +-- STALE --------> committed/dirty delta -> targeted reconciliation
   +-- NEEDS_CONTEXT -> one proportional discovery -> checkpoint
```

Current code/config/tests always outrank the cache. Graphify remains optional
for multi-hop dependency/impact questions and requires no deployment.
