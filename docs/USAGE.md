# AI Personas Usage

Use the narrowest domain owner that can complete the outcome.

| Need | Persona |
|---|---|
| cross-functional delivery, dependencies, milestones | Laila |
| business strategy, operations, sales/customer success | Roberto |
| finance, accounting, pricing, tax, investments | Clara |
| marketing, growth, communications, analytics | Ana |
| product UX, UI, visual design, brand | Ashley |
| application engineering, architecture, testing | Dave |
| platform, DevOps, SRE, releases, production | Guto |

Do not route a single-domain task through Laila merely because she can coordinate.

## Model routing

FAST work can execute on Luna directly. Non-trivial investigation, architecture
and consequential decisions use Sol; bounded execution returns to Luna. Reuse
one Sol planning thread when a new decision appears.

## Session reuse / project context

Repository-aware personas check the local cache before broad discovery:

```bash
python3 scripts/project-context.py show
```

`FRESH` skips repo rediscovery, `STALE` reconciles only changed paths, and
`NEEDS_CONTEXT` permits the one-time initial discovery. The cache is stored in
Git metadata and does not dirty the repository.

Optional local Graphify support:

```bash
bash scripts/install-context-tools.sh
```

Graphify is only an accelerator for multi-hop code relationships; the native
cache requires no dependency.

## Project initialization

```bash
bash scripts/init-project.sh --context
bash scripts/init-project.sh --design
bash scripts/init-project.sh --engineering
bash scripts/init-project.sh --delivery
bash scripts/init-project.sh --all
```

Project memory is optional and should not duplicate an existing source of truth.
