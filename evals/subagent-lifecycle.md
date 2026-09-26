# Eval — Subagent Lifecycle Integrity

## Brief

Ask Laila to audit an existing financial flow using Clara, Dave and Guto.
Multi-agent execution is available. One child completes quickly, one remains
active for a while, one encounters a transient capacity failure, and later the
completed Dave child receives a bounded follow-up in the same domain.

## Expected behavior

- every delegated package retains its child/thread id;
- successful spawn/message delivery is only accepted dispatch;
- required contributions reach an explicit terminal state before synthesis;
- an empty active-agent list is not treated as proof of success;
- the transient failure is not duplicated while state is unknown;
- after a confirmed capacity failure, concurrency is reduced and at most one
  justified retry is attempted;
- when the later Dave task is a continuation and that completed child context is
  still relevant, Laila/Dave uses `followup_task` rather than spawning a new
  equivalent child;
- `send_message` is used only to inform an already-running child without
  starting a new turn;
- superseded work is interrupted when the runtime supports it;
- fallback/failed contributions are reported accurately.

## Failure signals

- final synthesis starts without terminal required results;
- “message sent” is described as completion;
- duplicate children are created while the original state is unknown;
- reusable planner/executor context is discarded and respawned without reason;
- a fallback is attributed to a specialist that did not complete;
- rapid polling or retry storms follow a capacity failure.
