# Model Routing Contract

This contract controls model selection for the persona team when the Codex host
exposes native and/or RouteMux model overrides.

## Core rule: Sol thinks, Luna executes

Treat **Sol as the control plane** and **Luna as the execution plane**.

Use the provider-local **Sol tier** for work whose main cost is deciding what
should be done:

- ambiguous request investigation and requirement reconstruction;
- repository/system investigation before a non-trivial change;
- root-cause analysis when the cause is not already isolated;
- architecture, product/UX, business, financial or operational reasoning;
- task decomposition, orchestration and dependency planning;
- resolving conflicting evidence or constraints;
- consequential tradeoffs, risk gates and review of substantial outputs.

Use the provider-local **Luna tier** for work whose main cost is carrying out an
already-bounded decision:

- implementation from an approved plan or execution packet;
- tests, lint/type/build fixes, CRUD, migrations and repetitive refactors;
- applying review feedback and mechanical follow-up changes;
- routine calculations or scenario runs after assumptions are frozen;
- copy/content variants from a fixed brief;
- design-canvas/materialization work from an approved direction;
- routine data extraction, formatting, status updates and evidence collection;
- bounded infrastructure/configuration edits with a defined validation plan.

Do not keep Sol attached to routine execution merely because Sol created the
plan. The executor returns concise evidence; Sol re-enters only when a new
decision is required.

### FAST exception

A genuinely small, low-risk task with an obvious solution does **not** need a
Sol planning hop. Route it directly to Luna, perform the targeted validation
and finish. The Sol/Luna split exists to reduce waste, not to add ceremony.

### Re-escalation rule

A Luna worker escalates back to Sol only when one of these is true:

1. implementation reveals a new architectural/product/business/financial/
   operational decision;
2. repository or runtime evidence contradicts the approved plan;
3. requirements or constraints are materially ambiguous;
4. the worker fails acceptance repeatedly and another implementation attempt
   would be guesswork;
5. a high-consequence security, production, migration, compliance, reputation
   or material-spend gate is reached.

Task size alone is not a reason to escalate.

## Execution packet

When Sol hands work to Luna, send a compact execution packet instead of the
entire transcript:

```text
Goal
Relevant evidence / files
Approved decision
Constraints
Required changes
Do not change
Acceptance criteria
Validation commands or proof
Known risks
```

Luna should return changed artifacts, validation evidence, unresolved blockers
and any decision that must return to Sol. Routine logs and failed attempts do
not need to be replayed to Sol unless they explain a blocker.

## Parent-state routing

The role split must work regardless of which model owns the current parent
session.

### Parent is Sol

For STANDARD/HIGH_RISK work:

1. Sol investigates and freezes the decision boundary.
2. Sol creates one compact execution packet.
3. Sol dispatches Luna for bounded execution when the host supports an explicit
   same-provider Luna child.
4. Sol does independent work only; it does not tail routine implementation logs.
5. If Luna returns a genuine decision blocker, resume the **same Sol planner**
   when the runtime supports follow-up/reuse instead of spawning a fresh planner.
6. Return the revised decision packet to Luna and continue execution.

### Parent is Luna

For FAST work, execute directly.

For STANDARD/HIGH_RISK work that needs a decision lane:

1. Luna spawns one same-provider Sol planner when available.
2. Sol returns the compact execution packet and remains the reusable decision
   thread for that task.
3. The Luna parent executes the packet itself or dispatches bounded Luna workers.
4. New decision blockers go back to the same Sol planner when possible.
5. Do not create a new Sol planner for every implementation question.

### Planner reuse invariant

A task should normally have **one control-plane planning thread**, not a chain of
fresh Sol children. Reuse preserves reasoning continuity and avoids repeatedly
paying the investigation/context cost. Spawn a replacement planner only when the
original is unavailable, terminally failed or its context is no longer relevant.

## User experience

Model routing is an internal implementation detail. The user should describe
the outcome, not choose a model, effort or child graph. Personas select the
smallest capable route and only expose a model/fallback detail when it
materially affects risk, cost or acceptance. Personas must never ask the user
to copy a model slug for normal work.

## Provider-local routing

Model selection is local to the active parent session:

- If the parent uses a native `gpt-*` model from the ChatGPT subscription,
  every explicit child override must also be a currently offered native model
  ID. Never send a `routemux/...` child from a subscription parent.
- If the parent uses a `routemux/...` model, every explicit child override
  must also use `routemux/...`. Never cross into native subscription models
  from a RouteMux parent.
- Detect the provider from the actual active parent model/session and current
  tool schema, not from a display label or stale configuration file.
- If the desired lane is not offered by the active provider, omit the override
  so the child inherits the parent, record the fallback internally and preserve
  the decision/execution boundary in the prompt.

| Lane | ChatGPT subscription | RouteMux |
|---|---|---|
| Investigation / orchestration / architecture | current native Sol-tier | `routemux/openai/gpt-6-sol` |
| Bounded execution / implementation | current native Luna-tier | `routemux/openai/gpt-6-luna` |
| Independent code review | offered native Luna-tier reviewer | `routemux/deepseek/deepseek-v4-flash-cheap` |
| Independent text-only review | offered native Luna-tier reviewer | `routemux/zhipu/glm-5.3-flash` |
| Visual execution / QA | native vision-capable Luna-tier or Ashley | RouteMux vision-capable Luna-tier or Ashley |
| Critical decision gate | current native Sol-tier | `routemux/openai/gpt-6-sol` |

M3, Kimi, Grok and Astra are opt-in candidates only after a task-specific
benchmark demonstrates a quality advantage worth their additional cost.
DeepSeek relay routes must pass a current local health probe before becoming
defaults; public uptime pages are not sufficient evidence. DeepSeek Pro remains
an opt-in recovery route after acceptance failure, not the default planner or
implementer.

## Decision rules

1. Classify the work as **decision/investigation** or **bounded execution**
   before choosing a model.
2. Use Sol for the first category and Luna for the second.
3. For `FAST` work with no meaningful decision boundary, skip Sol and execute
   directly on Luna.
4. Increase reasoning effort inside the correct tier before changing model
   family.
5. Do not let Sol stream-watch normal implementation commands, test logs or
   mechanical retries. Luna returns a concise evidence bundle.
6. If Luna encounters a new decision, stop guessing and return that decision to
   Sol; after Sol resolves it, resume on Luna.
7. Use the provider-local reviewer lane for one bounded independent review when
   the execution mode/risk requires it. Reviewers are read-only by default.
8. Never assign a text-only reviewer to a visual gate. Use Ashley or a
   vision-capable route and mark the gate unverified when pixels cannot be seen.
9. Never cross provider families for a child override, even when the model is
   visible in the picker.
10. Do not create extra children merely to use another model. Independent work
    or a required review gate must justify fan-out.
11. Keep handoffs compact. Do not copy an entire repository or transcript into
    a child when paths, symbols, constraints and acceptance are enough.
12. Keep ordinary fan-out at three active children or fewer. A 429 reduces
    concurrency before any retry.
13. High-consequence approval boundaries are unchanged by model quality. Sol
    can improve analysis; it cannot manufacture human authority.

## Persona application

- **Laila:** Sol for cross-functional investigation, planning, decomposition,
  dependency/risk decisions and synthesis; Luna for bounded execution packages,
  status transformations and applying already-approved delivery decisions.
- **Roberto:** Sol for strategy, market/competitive investigation, operating
  model, negotiation and consequential business tradeoffs; Luna for execution
  artifacts built from an approved strategy.
- **Clara:** Sol for assumption-setting, financial investigation, tax/investment
  reasoning and material financial decisions; Luna for calculations,
  reconciliations and scenario execution after assumptions are frozen.
- **Ana:** Sol for positioning, channel/experiment strategy, causal analysis and
  reputation/compliance decisions; Luna for campaign execution, copy variants,
  reporting and routine analytics from a fixed brief.
- **Ashley:** Sol for UX/product investigation, information architecture,
  design direction and consequential critique; Luna for materializing approved
  directions, component/state variants and routine visual QA.
- **Dave:** Sol for repository investigation, root cause, architecture,
  decomposition and substantial review; Luna for implementation, tests,
  refactors, fixes and applying review feedback.
- **Guto:** Sol for incident/root-cause investigation, topology/reliability
  decisions and production/security/spend gates; Luna for bounded config/IaC/
  CI execution, dry-runs and routine diagnostics from an approved plan.

## Dave QA loop

```text
FAST:
  Luna executes directly -> targeted check -> return

STANDARD / HIGH_RISK:
  Sol investigates and produces execution packet
    -> Luna implements and validates
    -> provider-local reviewer reports findings when required
    -> Luna fixes mechanical findings
    -> Sol resolves only new decisions / material contradictions
    -> same reviewer re-checks changed areas when required
    -> Sol performs substantial final decision review only when warranted
```

A reviewer is evidence-producing and read-only by default. A child claim is not
proof until the parent receives its terminal result and verifies the integrated
state.

## Fallback and measurement

If Sol is unavailable for a decision lane, keep the work provider-local, use the
strongest available same-provider reasoning route and record that the preferred
control-plane model was unavailable. If Luna is unavailable for execution,
inherit the parent or use the nearest same-provider execution route rather than
crossing providers silently.

Before promoting another default model, compare it with the current lane
default on matched cases. Track task success, evidence quality, tool-call
validity, tests, latency, input/output tokens, fallback count and estimated
cost. A cheaper route wins only when it preserves acceptance.
