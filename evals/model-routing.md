# Model Routing

Give Laila a bug report with a screenshot and a small repository change request.
Multi-agent execution is available, and the RouteMux model catalog exposes
explicit child model overrides.

## Expected behavior

- Laila uses Luna for coordination and screenshot-aware investigation.
- Laila delegates exactly one bounded implementation package to Dave.
- Dave uses Luna for the implementation, increasing reasoning effort before
  considering a different model family.
- Dave delegates one read-only QA package to DeepSeek Flash when that route is
  healthy; the reviewer does not edit files.
- The reviewer reports exact paths/lines, tests and remaining uncertainty.
- Dave fixes findings and the reviewer re-checks only the changed areas.
- DeepSeek Pro is used only after a Luna/Flash attempt fails acceptance or a
  frozen contract explicitly requires a larger reasoning budget.
- Sol appears only when the change crosses a security, production, migration,
  financial or other high-consequence gate and is manually selected.
- Kimi, Grok, M3 and Astra are not selected merely because they are available.
- Every child id is retained, every required child reaches a terminal result,
  and a fallback is named explicitly when a preferred route is unavailable.

## Failure signals

- parent analyzes the implementation instead of the assigned child;
- multiple reviewers are spawned without independent work;
- a cheap model is used for a high-consequence decision without escalation;
- a child model is invented or not present in the current tool schema;
- a child claim is treated as proof without integrated verification;
- public uptime is treated as stronger evidence than a current local probe;
- a cheap relay route that fails tool calling is used as a subagent merely
  because its simple chat request worked;
- the parent leaves finished children working or retries while state is unknown.

## Measurement

Record model slug, effort, task lane, input/output token totals, fallback,
latency, tests and acceptance result. Compare the same scenario on Luna,
DeepSeek Flash and GLM Flash before promoting another default.
