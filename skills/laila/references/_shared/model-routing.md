# Model Routing Contract

## Core rule: Luna runs, Sol decides

**Luna is the resident model. Sol is an ephemeral decision specialist.**

Persistent persona conversations, orchestration loops and implementation should
default to the provider-local Luna tier. Do not keep a long-lived Laila, Dave or
other persona on Sol merely because the task is non-trivial.

Use Luna for:

- user interaction and task intake;
- project-context freshness checks and targeted reads;
- routine analysis with clear repository/domain evidence;
- persona routing, decomposition from known constraints and dispatch;
- waiting/polling child lifecycle and status updates;
- integration/synthesis of already-decided work;
- implementation, tests, fixes, refactors and validation;
- calculations, content production, design materialization and routine ops;
- evidence collection and checkpointing.

Use Sol only when a **decision gate** remains after Luna has gathered the
relevant evidence:

1. requirements are materially ambiguous and safe inference is not possible;
2. architecture/system/product/business/financial/operational tradeoffs have
   multiple credible options with meaningful consequences;
3. root cause remains uncertain after a bounded Luna investigation;
4. current evidence conflicts and choosing the wrong interpretation matters;
5. a HIGH_RISK security, production, migration, compliance, reputation or
   material-spend decision needs deeper reasoning;
6. a substantial final review genuinely requires independent high-reasoning
   judgment.

Task size, number of files or "STANDARD" classification alone are **not** Sol
triggers.

## Sol is advisory and read-only by default

Sol returns a compact decision packet and then gets out of the execution loop.
It should not:

- write application or infrastructure code;
- perform routine implementation;
- tail command/test logs;
- poll agents;
- repeatedly reread the repository;
- create status updates;
- synthesize normal completed work that Luna can integrate.

A Sol consultation may inspect narrowly scoped evidence when required to make
the decision.

## Decision packet

```text
Decision
Evidence used
Assumptions / uncertainty
Approved constraints
Rejected alternatives (only material ones)
Acceptance implications
What Luna should do next
What would require returning to Sol
```

Do not copy the entire transcript into Sol or back out of Sol.

## Quota budgets

### FAST
- resident: Luna
- Sol consultations: **0**

### STANDARD
- resident: Luna
- Sol consultations: **0 by default**
- if a decision gate triggers: at most **one reusable Sol decision thread**
- resume that same thread for a directly related unresolved decision instead of
  spawning fresh Sol agents

### HIGH_RISK
- resident/coordinator: Luna
- one reusable Sol decision thread may be established early
- Sol participates only at consequential decision/review gates
- implementation, tool loops, validation, waiting and reporting remain on Luna

These are routing constraints, not quality shortcuts. If evidence shows a real
decision gate, use Sol. If the decision is already clear, do not spend Sol.

## Laila-specific rule

**Never use Sol as the persistent Laila orchestrator.**

Laila/Luna owns coordination, work-package routing, child lifecycle, status and
normal synthesis. Domain decisions go first to the owning persona. That persona
decides whether its own Sol consultation is necessary.

Laila herself may consult Sol only for an irreducible cross-domain
scope/priority/governance conflict or other consequential program decision that
cannot be resolved from the domain-owner outputs.

Laila must not use Sol merely to:
- understand a fresh/stale project-context snapshot;
- decompose an already-defined outcome;
- decide which persona owns a task;
- wait for Dave/Ashley/Guto/etc.;
- summarize child results;
- write status/roadmaps/handoffs.

## Parent-state routing

### Parent is Luna — preferred

Keep Luna resident. Gather evidence first. If no decision gate triggers, finish
without Sol. If a gate triggers, spawn/reuse one same-provider Sol advisor,
receive the decision packet, then continue on Luna.

### Parent is Sol — exception

A user may explicitly open a persona on Sol. For work that will involve ongoing
coordination or execution, Sol should minimize its own activity and hand the
resident work to Luna when the runtime supports a same-provider child override.
Sol remains a decision advisor only.

If the host cannot transfer the resident loop, the efficient configuration is
to start a new persistent persona session on Luna and let it call Sol on demand.
The persona must not pretend that prompt instructions can change the model of an
already-open parent session.

## Provider-local routing

Never cross provider families for a child override.

| Role | ChatGPT subscription | RouteMux |
|---|---|---|
| Resident persona / coordinator / executor | current native Luna-tier | `routemux/openai/gpt-6-luna` |
| Decision advisor | current native Sol-tier | `routemux/openai/gpt-6-sol` |
| Independent code review | offered native Luna-tier reviewer | `routemux/deepseek/deepseek-v4-flash-cheap` |
| Independent text review | offered native Luna-tier reviewer | `routemux/zhipu/glm-5.3-flash` |
| Visual execution / QA | native vision-capable Luna-tier or Ashley | RouteMux vision-capable Luna-tier or Ashley |

If the desired lane is unavailable, inherit/use the strongest same-provider
route and record the fallback rather than silently crossing providers.

## Persona application

- **Laila:** Luna always for resident coordination; Sol only for irreducible
  consequential cross-domain decisions.
- **Roberto:** Luna for evidence gathering, routine business analysis and
  execution artifacts; Sol for consequential strategy/tradeoff decisions.
- **Clara:** Luna for calculations, reconciliation and scenario execution; Sol
  for consequential assumption/tax/investment/capital decisions.
- **Ana:** Luna for campaign/content/analytics execution; Sol for consequential
  positioning/channel/causal/reputation decisions.
- **Ashley:** Luna for routine UX analysis, materialization and QA; Sol for
  genuinely ambiguous/consequential design direction.
- **Dave:** Luna is the resident engineer and only application-code writer; Sol
  advises on hard root cause, architecture, security or substantial review.
- **Guto:** Luna is the resident operational executor; Sol advises on hard
  incident/topology/reliability/security/spend decisions.

## Decision rules

1. Start on Luna.
2. Retrieve current evidence before escalating.
3. Ask: "Is there a consequential unresolved decision?" If no, stay on Luna.
4. If yes, consult/reuse Sol and request only a decision packet.
5. Return immediately to Luna for execution/integration.
6. Never use Sol for routine tool loops or because a task is merely large.
7. Respect `references/_shared/mutation-authority.md`; model capability does
   not grant write authority.
