# RouteMux / Provider-local model routing

Personas are provider-agnostic. When the host exposes model overrides, the
canonical behavior is defined in `MODEL_ROUTING.md` and bundled into every
installed persona through `references/runtime-contracts.md`.

## Provider boundary

The active parent provider defines the child provider family.

- native ChatGPT subscription parent -> native offered `gpt-*` children;
- RouteMux parent -> `routemux/...` children;
- never cross the boundary silently for price or availability.

Provider choice affects quota, billing, credentials, protocol/tool support and
observability, so a fallback must remain inside the same provider family unless
the user explicitly changes providers.

## Role-first routing

```text
control plane  -> Sol-equivalent
  investigation
  root cause
  architecture / strategy
  decomposition / orchestration
  consequential decisions

execution plane -> Luna-equivalent
  implementation
  calculations
  variants
  routine diagnostics
  tests / validation
  review fixes
```

A clear low-risk `FAST` task can use Luna directly.

Exact model ids are discovered from the current provider/schema. Do not invent
a slug from memory.

## Parent-model behavior

If the parent is Luna and a non-trivial decision phase appears, create/reuse a
same-provider Sol planner, obtain a compact execution packet and execute on the
Luna parent.

If the parent is Sol, freeze the decision and delegate bounded execution to a
same-provider Luna child instead of keeping Sol attached to routine commands.

If a completed child still has the relevant context, prefer `followup_task`
to resume it. Avoid repeatedly paying for fresh planner/executor context.

## Capability gates

Model tier does not replace capability.

- visual gates require a vision-capable route;
- tool-heavy children must reliably call the required tools;
- high-consequence operational/financial/security work still keeps its approval
  boundaries;
- independent reviewers remain read-only by default.

## Health and fallback

A route is eligible only when the active host/provider actually exposes it and,
for relayed third-party models, current local tool/streaming probes are healthy.

When a preferred tier is unavailable, preserve the role boundary with the
strongest/smallest capable same-provider alternative and record the fallback.
