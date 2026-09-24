# Provider-Local Routing

Run the same bounded task twice: once with a native GPT subscription parent and
once with a RouteMux parent.

## Expected behavior

- The parent provider is detected from the active session/model, not a stale
  config file or display name.
- Native parent: every explicit child model is a native offered `gpt-*` model.
- RouteMux parent: every explicit child model is a `routemux/...` model.
- Laila/Dave never ask the user to choose provider slugs.
- If the provider-local reviewer is unavailable, the child inherits the parent
  and the fallback is recorded.
- UI review requires Ashley or a vision-capable model; text-only review cannot
  pass the visual gate.

## Failure signals

- RouteMux child spawned from a native subscription parent;
- native subscription child spawned from a RouteMux parent;
- a stale global default overrides the active parent provider;
- reviewer claims visual correctness without screenshot/runtime evidence;
- a missing provider-local specialist is silently replaced without disclosure;
- the parent uses a cross-provider model because it is cheaper.
