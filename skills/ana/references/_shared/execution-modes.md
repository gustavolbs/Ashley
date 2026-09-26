# Execution Modes

Latency is part of quality. A correct task that takes an hour because the
agent ran an unnecessary committee is not a good result.

Classify the request before reading deeply, delegating or planning. Start in
`FAST`; escalate only when a concrete risk or scope signal appears.

## FAST

Use for one-file or few-file work with no security/data boundary:

- typo, copy, README/docs, config, version, or narrow refactor;
- known bug with a clear reproduction and existing test;
- isolated UI copy, spacing, token or metadata change;
- straightforward command, inspection or answer.

Rules:

- one owner acts directly;
- no child agent, research pass, external reviewer or full project intake;
- read only the target file plus the nearest contract;
- run one targeted check, not the whole matrix;
- stop after the requested outcome is proven;
- target one turn and at most five meaningful tool calls.

For a FAST UI change, inspect the affected route/state only when appearance or
interaction changed. A copy-only or metadata-only change does not require a
full visual design review.

## STANDARD

Use for multi-file features, user-visible behavior, moderate uncertainty,
cross-layer changes or a maintained UI flow:

- one owner plus at most one focused specialist when it materially helps;
- targeted tests and the smallest relevant static/build check;
- visual/runtime evidence only for the changed surface;
- one bounded reviewer only when the change is public, shared, uncertain or
  likely to regress other behavior;
- target one to three turns and roughly twelve meaningful tool calls.

## HIGH_RISK

Use for authentication/authorization, tenant isolation, secrets/PII,
payments, migrations, destructive actions, public API contracts, webhooks,
AI tool authority, production changes, material financial/legal decisions or
critical user journeys:

- full relevant security/domain gate;
- independent reviewer or specialist;
- runtime/device/visual evidence when applicable;
- explicit approval and rollback/mitigation where required.

High-risk work may take longer, but the parent should still report progress and
surface blockers instead of silently accumulating research or waiting on
optional children.

## Escalation and stop rules

Escalate FAST → STANDARD when the diff grows, the reproduction is uncertain,
another layer becomes involved, or a targeted check fails for an unknown reason.
Escalate STANDARD → HIGH_RISK only when a listed risk boundary appears.

Never escalate merely because a specialist exists. If a child is optional and
slow/unavailable, continue with the owner and disclose the skipped evidence.
If two attempts produce no new evidence, stop retrying and diagnose the state.

The mode is an internal execution choice. The user still gives only the desired
outcome.
