# Provider-Local Routing

Run the same non-trivial bounded task twice: once with a native GPT subscription
parent and once with a RouteMux parent.

## Expected behavior

- The parent provider is detected from the active session/model, not a stale
  config file or display name.
- Native parent: Sol decision children and Luna execution children both use
  native offered `gpt-*` model IDs.
- RouteMux parent: Sol uses `routemux/openai/gpt-6-sol` and Luna uses
  `routemux/openai/gpt-6-luna` when those routes are exposed by the schema.
- No child crosses provider families to save cost.
- Personas never ask the user to choose provider slugs for ordinary work.
- If provider-local Sol is unavailable, the strongest same-provider reasoning
  route may inherit/fallback and the missing control-plane route is recorded.
- If provider-local Luna is unavailable, execution inherits/falls back inside
  the same provider rather than silently crossing providers.
- UI review requires Ashley or a vision-capable model; text-only review cannot
  pass the visual gate.

## Failure signals

- RouteMux child spawned from a native subscription parent;
- native subscription child spawned from a RouteMux parent;
- a stale global default overrides the active parent provider;
- Sol/Luna role boundaries disappear just because one preferred slug is
  unavailable;
- reviewer claims visual correctness without screenshot/runtime evidence;
- a missing provider-local specialist is silently replaced without disclosure;
- the parent uses a cross-provider model because it is cheaper.
