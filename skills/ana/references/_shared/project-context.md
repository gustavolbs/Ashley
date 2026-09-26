# Project Context Cache

A new chat must not imply a new full repository discovery. This local cache is
a navigation accelerator, never a source of truth.

## Storage

Git repositories store it under the clone/worktree Git metadata:

```text
<git-dir>/ai-personas/
├── PROJECT_CONTEXT.md
├── state.json
└── graphify-out/   # optional
```

Nothing is deployed, no daemon runs, and the cache does not dirty the working
tree. Non-Git folders fall back to `./.ai-personas/`.

## Session boot

Before broad repository discovery, run the `scripts/project-context.py show`
shipped with the active persona.

### FRESH
Use the compact snapshot as the starting map. **Do not rescan the repo.** Read
the exact current files needed by the task before editing or certifying them.

### STALE
Use the old snapshot only as a baseline. Reconcile the reported committed and
working-tree delta first, following dependencies only as far as the task needs.
Do not rediscover unaffected areas. Update durable summary lines only when
architecture/domain/contracts actually changed, then checkpoint.

### NEEDS_CONTEXT
Perform one proportional discovery, replace the pending marker/TODOs in the
summary, keep it pointer-heavy, then checkpoint.

## Summary contents

Keep: purpose, package/service/domain map, stable invariants, key entry points,
authoritative docs/ADRs/schemas/runbooks and durable constraints.

Do not keep: secrets, source dumps, logs, transient TODO/status already owned by
a tracker, or unverified assumptions. Default maximum is 12 KiB.

## Freshness

The state records branch, HEAD, tracked working-tree diff fingerprint, untracked
file content hashes and summary hash. Freshness is established locally without
model rereading.

Current code/config/tests/schemas always outrank the cache.

## End of task

If durable architecture/domain/contracts changed, update the summary and
checkpoint after validation. If only bounded implementation changed, the
summary may stay unchanged; still checkpoint once the change is understood so a
later chat does not rediscover an already-reconciled commit.

## Optional Graphify accelerator

Graphify is optional. Use it only for expensive multi-hop dependency, impact,
caller/callee or architecture navigation when installed.

Keep its output outside the working tree:

```bash
GRAPH_DIR="$(python3 <skill>/scripts/project-context.py graph-dir)"
GRAPHIFY_OUT="$GRAPH_DIR" graphify update "$(git rev-parse --show-toplevel)" --no-viz
graphify query "what connects auth to billing?" --graph "$GRAPH_DIR/graph.json"
```

Graph results are navigation evidence; read authoritative source before editing
or claiming behavior. Never auto-install Graphify during ordinary work.

## Rediscovery gate

A proportional rediscovery is justified only when the previous commit vanished,
project identity changed radically, the delta is too broad for trustworthy
incremental reconciliation, executable evidence contradicts the snapshot, or
the user explicitly requests a fresh architecture audit.
