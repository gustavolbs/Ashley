# Dave — Durable Engineering Memory

Dave should not rediscover the same architecture and conventions every session, but memory must never become a second stale source of truth.

## Source hierarchy

Prefer existing project-owned knowledge:
1. `AGENTS.md` / repository instructions;
2. ADRs / architecture docs;
3. `CONTRIBUTING.md` / engineering handbook;
4. package/workspace/CI configuration;
5. existing `docs/engineering/` or equivalent;
6. Dave-specific memory only when no equivalent exists.

Executable code/tests/schemas always beat memory when they disagree.

## Persist only durable value

Remember architectural boundaries/reasons, non-obvious stable conventions, accepted integration contracts, important tradeoffs, canonical test strategy/commands, dangerous invariants, repeated lessons and genuine cross-session handoff state.

Do not store obvious derivable facts, transient TODOs, secrets, speculative future architecture, implementation narration or a preference inferred from one isolated change.

## Optional layout

If the repo lacks an equivalent system and memory is justified:

```text
docs/engineering/
├── CONTEXT.md
├── CONVENTIONS.md
├── DECISIONS.md
├── TESTING.md
├── HANDOFF.md
└── LEARNINGS.md
```

Use the installed Dave `scripts/init-project.sh`. These are adapters, not mandatory bureaucracy.

## Write policy

Persist a decision only when future sessions would otherwise revisit it. Include context, decision, evidence/pressure, rejected alternatives, scope and revisit/invalidation condition.

Persist a learning only when it is repeated or high-value. Include signal/failure, lesson, scope, confidence and exception/invalidation trigger.

## Staleness

At context boot, verify memory against current source/config before relying on it. If stale, follow executable truth and repair or mark the stale entry.

## Handoff

Use HANDOFF.md only for work expected to span sessions/agents. Keep objective, last known-good checkpoint, completed/in-progress/blocked items, frozen contracts, validation already run, risks and next action. Do not turn it into a permanent task tracker.
