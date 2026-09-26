# Model Routing

Validate that Sol is the decision/orchestration control plane and Luna is the
bounded execution plane without forcing unnecessary model hops.

## Cross-persona matrix

| Persona | Sol lane | Luna lane |
|---|---|---|
| Laila | investigation, decomposition, dependencies, risk decisions, synthesis | bounded work-package execution and application of decided plans |
| Roberto | strategy, market investigation, operating-model/business tradeoffs | artifacts and routine evidence from an approved strategy |
| Clara | assumptions, scenario design, tax/investment/material-risk reasoning | calculations and reconciliations after assumptions freeze |
| Ana | positioning, channel/experiment strategy, causal/reputation decisions | campaign/copy/lifecycle/reporting execution from a fixed brief |
| Ashley | UX/product investigation, IA, design direction, consequential critique | canvas/materialization, variants and routine visual QA |
| Dave | repository investigation, root cause, architecture, decomposition, substantial review | implementation, tests, fixes, refactors and review feedback |
| Guto | incident/root-cause, topology/reliability, production/security/spend decisions | bounded config/IaC/CI execution, dry-runs and routine diagnostics |

## Parent-model cases

### Luna parent

For non-trivial investigation, spawn one same-provider Sol planner, receive a
compact execution packet and execute on the Luna parent. If execution exposes a
new decision, resume the same planner with `followup_task` when possible.

### Sol parent

Sol freezes the decision/contract and delegates bounded execution to Luna.
Routine implementation/test logs do not stream back into Sol. If the executor
hits a real decision blocker, Sol resolves it and resumes the same Luna child
when possible.

### FAST

An obvious low-risk task skips the planner hop and executes directly on Luna.

## Expected behavior

- provider family is preserved;
- exact child model ids are taken from the active schema rather than invented;
- Sol does only decision work needed to make execution safe;
- Luna receives a compact execution packet instead of the full transcript;
- completed planner/executor context is reused before respawn;
- a new architecture/product decision, contradictory evidence, repeated
  acceptance failure or high-consequence gate returns to Sol;
- independent reviewers remain bounded/read-only and do not become the
  implementation owner;
- every required child reaches a terminal result.

## Failure signals

- Sol watches routine command/test logs after the execution contract is frozen;
- Luna invents architecture/strategy instead of escalating a real decision;
- every tiny task pays for a Sol planning hop;
- a fresh Sol/Luna child is spawned for every follow-up despite reusable context;
- task size alone triggers escalation;
- provider families are crossed silently;
- a child claim is treated as integrated proof.

## Measurement

Capture model role, input/output tokens, command/tool calls, child count,
fallbacks, latency and acceptance. Compare Sol token share separately: bounded
execution should not continuously consume control-plane quota.
