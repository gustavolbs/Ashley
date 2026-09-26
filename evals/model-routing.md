# Model Routing

Validate the shared rule that Sol is the decision/orchestration control plane
and Luna is the bounded execution plane.

## Cross-persona matrix

| Persona | Sol lane | Luna lane |
|---|---|---|
| Laila | investigation, decomposition, dependencies, risk decisions, synthesis | bounded work-package execution and status/application of decided plans |
| Roberto | strategy, market investigation, operating-model and business tradeoffs | artifacts/drafts/routine evidence from an approved strategy |
| Clara | assumptions, scenario design, tax/investment and material-risk reasoning | calculations, reconciliations and repeated scenarios after assumptions freeze |
| Ana | positioning, channel/experiment strategy, causal/reputation decisions | campaign/copy/lifecycle/reporting execution from a fixed brief |
| Ashley | UX/product investigation, IA, design direction, consequential critique | canvas/materialization, variants, asset work and routine visual QA |
| Dave | repository investigation, root cause, architecture, decomposition, substantial review | implementation, tests, fixes, refactors and review feedback |
| Guto | incident/root-cause, topology/reliability, production/security/spend decisions | bounded config/IaC/CI execution, dry-runs and routine diagnostics |

## Scenario

Give Laila a bug report with a screenshot and a non-trivial repository change
request. Multi-agent execution is available and the active provider exposes
provider-local Sol and Luna child overrides.

## Expected behavior

- Laila uses Sol for coordination, screenshot-aware investigation and
  decomposition.
- Laila sends Dave a compact execution packet rather than the entire transcript.
- Dave/Sol performs only the engineering investigation/decision work needed to
  freeze the implementation contract.
- Dave delegates implementation to Luna.
- Luna implements and runs the agreed validation without Sol watching routine
  command/test logs.
- Dave delegates one read-only QA package to the provider-local reviewer when
  the execution mode requires it; the reviewer does not edit files.
- Mechanical review findings return to Luna for fixes.
- A new architecture/product decision, contradictory runtime evidence, repeated
  acceptance failure or high-consequence gate returns to Sol.
- A genuinely FAST/obvious low-risk task may skip Sol and execute directly on
  Luna.
- Kimi, Grok, M3 and Astra are not selected merely because they are available.
- Every required child reaches a terminal result and a fallback is named
  explicitly when a preferred route is unavailable.

## Failure signals

- Luna is asked to invent architecture/strategy after the parent should have
  frozen the decision;
- Sol performs or watches routine implementation that had a complete execution
  packet;
- every tiny task pays for a Sol planning hop;
- task size alone triggers a Luna -> Sol escalation;
- multiple reviewers are spawned without independent work;
- a child model is invented or absent from the current tool schema;
- a child claim is treated as proof without integrated verification;
- the parent leaves finished children working or retries while state is unknown.

## Measurement

Record model slug, role (decision or execution), effort, input/output token
totals, fallback, latency, tests and acceptance result. Measure Sol token share
separately: routine execution should not continuously consume control-plane
tokens.
