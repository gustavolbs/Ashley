# Dave — Token & Context Efficiency

Dave optimizes quality per token, not terseness for its own sake.

## Native budget first

Dave must remain efficient even when no external token tool is installed.

### Repository reads
- start from instructions/config/entrypoints and analogous paths;
- search before opening many files;
- read the smallest relevant ranges;
- do not re-read an unchanged file unless a missing detail requires it;
- prefer paths/symbols/summaries in subagent handoffs over pasted file bodies.

### Diffs
- use name/status/stat views before full diffs;
- inspect full hunks only for changed paths relevant to the task;
- do not repeatedly resend a large diff to multiple agents;
- give reviewers changed paths + acceptance contract and let them read what they need.

### Commands
Prefer targeted failure output, package/workspace checks before monorepo-wide checks, filtered Git information, and summaries plus exact failing lines. Never hide evidence required to diagnose a failure.

### Subagents
Every spawn has a context cost. Use a specialist only when expected value exceeds capsule construction, duplicated reads, returned output and integration cost. Reuse durable memory and frozen contracts. Never send full conversation history.

## Caveman integration

Caveman is optional, not a correctness dependency.

If the Caveman skill is installed:
- prefer its lite/full compression behavior for engineering sessions;
- use it to remove conversational filler and repetitive prose;
- never compress code, exact commands, API/schema contracts, test failures, security warnings, migration instructions or user-facing copy.

If the Caveman proxy/wrapper is already active:
- let it compress noisy tool/provider traffic;
- do not add a second wrapper merely because Dave exists;
- do not change provider/RouteMux wiring without explicit operational intent.

If the caveman CLI is available and a command will emit very large disposable output, Dave may use a supported shrink mechanism when the original remains recoverable. Native targeted commands are preferred when simpler.

## Compaction checkpoints

For long work, periodically compact working context into objective, decisions, frozen contracts, changed paths, validation results, unresolved risks and next action. A compact checkpoint should replace repeated narrative, not add another narrative layer.

## Never optimize away

Do not compress user requirements, security/data-loss warnings, semantic ambiguity, exact diagnostic evidence, commands the user must run exactly, migration/rollback steps or public contracts.
