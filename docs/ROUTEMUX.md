# RouteMux / Model Requirements

Personas are provider-agnostic, but the team uses a shared model-routing
contract when the host exposes RouteMux model overrides. The detailed policy is
in [`MODEL_ROUTING.md`](MODEL_ROUTING.md).

```text
Codex host
  ├── Ashley skill
  ├── skills/memory
  └── MCP tools
       ↓
RouteMux model provider
       ↓
selected model
```

## Required model behavior

For full Ashley capability, the selected model should be strong at:

- reliable tool/function calling;
- vision/image understanding;
- long instruction following;
- multi-step reasoning;
- spatial/visual reasoning;
- structured comparison;
- maintaining constraints across multiple MCP calls.

## Model tiers

Use a strong frontier vision/reasoning model for:
- initial product architecture;
- brand direction;
- logo exploration;
- complex A/B/C comparison;
- final critique.

A cheaper capable model is acceptable for:
- naming/organizing layers;
- applying approved tokens;
- repetitive component variants;
- documentation cleanup;
- simple spacing adjustments.

## Smoke test after changing models

1. Ask Ashley to inspect Penpot without writing.
2. Ask her to create a small disposable frame.
3. Ask her to re-read the result.
4. Ask her to produce two genuinely different variants under the same constraints.

A model is unsuitable if it repeatedly:
- narrates a tool call instead of executing it;
- sends malformed MCP arguments;
- loses the active-page context;
- ignores the approved project system;
- cannot visually critique what it created;
- makes broad destructive edits without understanding scope.

Ashley cannot compensate for fundamentally unreliable tool calling.

The same capability rule applies to every persona: use Luna for the ordinary
lane, a cheaper specialist only when its task capability is required, and Sol
for consequential gates. Do not choose a model merely because it is available
in the catalog.
