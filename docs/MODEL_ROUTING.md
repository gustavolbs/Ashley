# Model Routing Contract

This contract controls model selection for the persona team when the Codex host
exposes native and/or RouteMux model overrides.

## User experience

Model routing is an internal implementation detail. The user should describe
the outcome, not choose a model, effort or child graph. Laila selects the
smallest capable lane, tells the user the short execution plan when useful, and
only exposes a model/fallback detail when it materially affects risk, cost or
acceptance. Personas must never ask the user to copy a model slug for normal
work.

## Provider-local routing

Model selection is local to the active parent session:

- If the parent uses a native `gpt-*` model from the ChatGPT subscription,
  every child override must also be a currently offered native model ID. Never
  send a `routemux/...` child from a subscription parent.
- If the parent uses a `routemux/...` model, every child override must also use
  `routemux/...`. Never cross into native subscription models from a RouteMux
  parent.
- Detect the provider from the actual active parent model/session and current
  tool schema, not from a display label or stale configuration file.
- If the desired lane is not offered by the active provider, omit the override
  so the child inherits the parent, and record the fallback internally.

| Lane | ChatGPT subscription | RouteMux |
|---|---|---|
| Orchestrator/implementation | current native Luna-tier | `routemux/openai/gpt-6-luna` |
| Independent code review | offered native Luna-tier reviewer | `routemux/deepseek/deepseek-v4-flash-cheap` |
| Text-only fallback | offered native Luna-tier reviewer | `routemux/zhipu/glm-5.3-flash` |
| Hard coding escalation | native Luna-tier at higher effort, then manual native Sol | DeepSeek Pro cheap only after acceptance failure |
| Visual review | native vision-capable model or Ashley | RouteMux vision-capable model or Ashley |
| Critical gate | manually selected native Sol | manually selected RouteMux Sol equivalent |

## Defaults

Use the smallest model that preserves the required capability within the
active provider:

| Lane | Subscription parent | RouteMux parent | Effort | Escalation |
|---|---|---|---:|---|
| Coordination, investigation, implementation and synthesis | native Luna-tier | `routemux/openai/gpt-6-luna` | low/medium/high | same-provider Sol only after failed acceptance or risk gate |
| Read-only code investigation and ordinary QA | native GPT reviewer | `routemux/deepseek/deepseek-v4-flash-cheap` | high/ultra | same-provider text fallback |
| Hard coding or architecture reasoning | native Luna-tier | `routemux/openai/gpt-6-luna` | high/xhigh | same-provider Pro/Sol only after evidence |
| Independent text-only review | native GPT reviewer | `routemux/zhipu/glm-5.3-flash` | low/medium | same-provider Luna-tier |
| Visual inspection, screenshots and design canvas | native vision model or Ashley | RouteMux vision model or Ashley | medium | second vision-capable reviewer when consequential |
| Security, production, migrations and material financial risk | manual native Sol | manual RouteMux Sol equivalent | high | human approval or explicit domain gate |

M3 is not a default route. Kimi, Grok and Astra are opt-in candidates only
after a task-specific benchmark demonstrates a quality advantage worth their
additional cost. DeepSeek relay routes must pass a current local health probe
before becoming defaults; public uptime pages are not sufficient evidence.
After a RouteMux support change on 2026-09-23, DeepSeek Flash cheap passed local
streaming and tool-call probes and is eligible for QA. DeepSeek Pro cheap
streams and accepts tool calls with `tool_choice: "auto"` but returns HTTP 400
when `tool_choice: "required"` is forced. It is an opt-in escalation profile,
not a certified default.

## Decision rules

1. Start every child on the lane default, not on the most expensive model.
2. Increase reasoning effort on the cheaper model before changing model family.
3. Use the provider-local Luna lane for the parent and ordinary work,
   including image input.
4. Use the provider-local reviewer lane for one independent read-only code
   investigation and normal QA. On RouteMux this is DeepSeek Flash; on a
   subscription parent it remains a native GPT reviewer.
5. Use DeepSeek Pro only after a Luna/Flash attempt fails acceptance, and only
   through a path that does not force `tool_choice: "required"`.
6. Use GLM Flash for an independent text-only opinion or as a fallback.
7. Escalate to Sol manually for security, production, migration, financial or
   otherwise high-consequence decisions. Sol is not an automatic child lane.
8. Never assign a text-only reviewer to a visual gate. Use Ashley or a
   vision-capable route and mark the gate unverified when pixels cannot be seen.
9. Never cross provider families for a child override, even when the model is
   visible in the picker.
10. Do not create a second reviewer merely to use another model. One bounded
   independent reviewer is the default.
11. Keep the model override explicit on `spawn_agent` when the selected model is
   visible in the current tool schema. If it is unavailable, omit the override
   and report the fallback.
12. Keep handoffs compact. Do not copy an entire repository or transcript into a
   child when paths, symbols, constraints and acceptance are enough.
13. Keep ordinary fan-out at three active children or fewer. A 429 reduces
   concurrency before any retry.

## Persona lanes

- **All personas:** use the provider-local orchestrator lane for ordinary work.
  Specialist names are resolved from the active provider map above.

## Dave QA loop

```text
Dave/provider-local orchestrator implements
  -> provider-local reviewer runs tests and reports findings
  -> Dave/provider-local orchestrator fixes
  -> the same reviewer re-checks changed areas
  -> Luna validates the integrated result
  -> manually select Sol only when the risk gate is high
```

The reviewer is evidence-producing and read-only by default. A child claim is
not proof until the parent receives its terminal result and verifies the
integrated state.

## Fallback and measurement

Every route can fall back to Luna when a child model is unavailable, rejected
by the current schema, rate-limited or otherwise unhealthy. Record the fallback
instead of implying that the preferred model completed the work.

Before adding another default model, compare it with the current lane default
on the same four cases:

1. repository investigation with exact file/line evidence;
2. bug diagnosis with a screenshot when applicable;
3. bounded implementation plus tests;
4. independent review of a deliberately flawed change.

Track task success, evidence quality, tool-call validity, tests, latency, input
and output tokens, fallback count and estimated cost. A cheaper model wins only
when it preserves the acceptance criteria.
