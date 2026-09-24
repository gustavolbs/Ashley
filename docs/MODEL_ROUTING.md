# Model Routing Contract

This contract controls model selection for the persona team when the Codex host
exposes RouteMux model overrides.

## User experience

Model routing is an internal implementation detail. The user should describe
the outcome, not choose a model, effort or child graph. Laila selects the
smallest capable lane, tells the user the short execution plan when useful, and
only exposes a model/fallback detail when it materially affects risk, cost or
acceptance. Personas must never ask the user to copy a RouteMux slug for normal
work.

## Defaults

Use the smallest model that preserves the required capability:

| Lane | Default model | Effort | Escalation |
|---|---|---:|---|
| Coordination, investigation, implementation and synthesis | `routemux/openai/gpt-6-luna` | low/medium/high | `routemux/openai/gpt-6-sol` only after a failed acceptance or risk gate |
| Read-only code investigation and ordinary QA | `routemux/deepseek/deepseek-v4-flash-cheap` when locally healthy | high/ultra | `routemux/zhipu/glm-5.3-flash` |
| Hard coding or architecture reasoning | `routemux/openai/gpt-6-luna` | high/xhigh | DeepSeek Pro cheap, then manual Sol, only after evidence that Luna cannot meet acceptance |
| Independent text-only review | `routemux/zhipu/glm-5.3-flash` | low/medium | `routemux/openai/gpt-6-luna` |
| Visual inspection, screenshots and design canvas | `routemux/openai/gpt-6-luna` | medium | a second visual model only when the result is consequential |
| Security, production, migrations and material financial risk | `routemux/openai/gpt-6-sol` | high | human approval or explicit domain gate |

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
3. Use Luna for the parent and for ordinary work, including image input.
4. Use DeepSeek Flash for one independent read-only code investigation and
   normal QA now that its local route probe passes; use GLM Flash as the
   current fallback.
5. Use DeepSeek Pro only after a Luna/Flash attempt fails acceptance, and only
   through a path that does not force `tool_choice: "required"`.
6. Use GLM Flash for an independent text-only opinion or as a fallback.
7. Escalate to Sol manually for security, production, migration, financial or
   otherwise high-consequence decisions. Sol is not an automatic child lane.
8. Do not create a second reviewer merely to use another model. One bounded
   independent reviewer is the default.
9. Keep the model override explicit on `spawn_agent` when the selected model is
   visible in the current tool schema. If it is unavailable, omit the override
   and report the fallback.
10. Keep handoffs compact. Do not copy an entire repository or transcript into a
   child when paths, symbols, constraints and acceptance are enough.
11. Keep ordinary fan-out at three active children or fewer. A 429 reduces
   concurrency before any retry.

## Persona lanes

- **Laila:** Luna for coordination and investigation; GLM Flash for an
  independent text-only research pass; Sol only as a manually selected
  consequential-decision escalation.
- **Dave:** Luna for implementation, including difficult work with a higher
  reasoning effort; DeepSeek Flash for code review and tests; DeepSeek Pro only
  after a failed Luna/Flash acceptance and without forced tool selection; Sol
  for manually approved security, production or architecture gates; Luna for
  visual QA.
- **Ashley:** Luna for visual/design work and screenshots; GLM Flash for
  text-only copy or structure review; use another visual model only for a
  consequential independent critique.
- **Guto:** Luna for read-only platform investigation; GLM Flash for bounded
  configuration review; Sol only as a manually approved production, recovery,
  security or spend escalation.
- **Clara:** Luna for ordinary scenarios and calculations; Sol only as a
  manually approved material treasury, tax, investment or payment-risk
  escalation.
- **Roberto:** Luna for strategy exploration; GLM Flash for independent
  text-heavy research; Sol only as a manually approved consequential-business
  escalation.
- **Ana:** Luna for campaign, copy and analytics work; GLM Flash for
  independent text review; Sol only as a manually approved reputation,
  compliance or spend escalation.

## Dave QA loop

```text
Dave/Luna implements
  -> DeepSeek Flash read-only reviewer runs tests and reports findings
  -> Dave/Luna fixes
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
