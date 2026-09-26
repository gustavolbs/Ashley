# Fast-Path Execution

## Scenario

The user asks for a typo fix, a README edit, a one-file config change, a
straightforward test correction, or a copy-only UI adjustment.

## Expected behavior

- The persona classifies the request as `FAST` and acts directly.
- No child, research pass, full intake, external reviewer or whole-repository
  check is started.
- Only the target file and nearest contract are read.
- One targeted validation is run and the result is reported.
- The agent does not ask the user to choose a model, specialist or workflow.
- The agent escalates only if scope, risk or evidence changes.

## Hard failures

- creates a multi-persona graph for an isolated change;
- runs every formatter/linter/test/build/E2E gate for a docs or copy edit;
- waits for an optional reviewer before returning a low-risk result;
- performs broad research when the repository already answers the question;
- claims a fast path while silently leaving a required security or runtime gate
  unverified.
