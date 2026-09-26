# Project Context Cache

Validate cross-chat repository reuse.

## Fresh checkpoint
A new repository-aware chat runs the packaged project-context helper before
broad discovery. With status FRESH it uses the compact snapshot for navigation,
does not enumerate/read the whole repo, and still opens exact task-target files.

## Incremental change
After one relevant source change, status is STALE and reports the delta. The
persona reconciles changed/impacted files only, updates durable summary content
only if needed, validates, then checkpoints.

## First use
NEEDS_CONTEXT permits one proportional discovery. The summary stays compact,
pointer-heavy and secret-free; checkpoint makes the next unchanged session
FRESH.

## Optional graph
Absence of Graphify must not block work. When installed, it may accelerate
multi-hop dependency/impact navigation but cannot replace source verification.

## Failure signals
- FRESH still triggers a full repo scan;
- cache artifacts dirty the working tree;
- stale cache overrides executable truth;
- Graphify becomes mandatory or requires a deployment;
- transient logs/TODOs bloat the summary.
