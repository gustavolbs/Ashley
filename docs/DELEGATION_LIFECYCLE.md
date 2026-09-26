# Delegation Lifecycle Contract

This contract applies whenever a persona delegates work to another persona or specialist.

## Spawn is not completion

A successful `spawn_agent` or dispatch acknowledgement proves only that the task was accepted.

For every required child:
1. retain the task label and child/thread id;
2. track a terminal state: pending, running, completed, failed or cancelled;
3. continue only independent work while the child runs;
4. do not use the contribution until its terminal result is received;
5. wait for required children before synthesis;
6. treat an empty active-agent list as inconclusive unless a terminal result was captured.

## Reuse before respawn

When a completed non-root child already has the right role/context and new work is a continuation, prefer `followup_task` to resume that same child instead of spawning a replacement. This is especially important for the Sol control-plane planner: preserve its compact decision context across Luna implementation escalations.

Use `send_message` only to inform a running child without starting a new turn. Do not create duplicate children while the original state is unknown.

## Failure and capacity

After a confirmed transient transport/capacity failure such as 429:
- reduce concurrency first;
- retry at most once when the expected value justifies it;
- otherwise use an explicit parent fallback or continue without an optional contribution.

A transport failure is not evidence that the delegated analysis was wrong. A fallback must be disclosed internally/finally when it materially changes acceptance.

## Cancellation

Interrupt or close superseded work when the runtime supports it. Do not leave orphaned children consuming capacity after scope changes.

## Evidence

A child claim is input, not proof. The parent/integration owner verifies the integrated result at the evidence level required by the domain and execution mode.
