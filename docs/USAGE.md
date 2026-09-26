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

Do not route a single-domain task through Laila merely because she can
coordinate. Laila never programs.

## Model routing

Start persistent persona sessions on Luna. FAST uses zero Sol. STANDARD stays
on Luna unless a consequential unresolved decision appears. HIGH_RISK also keeps
Luna resident and uses one reusable Sol advisor only at decision/review gates.

Do not keep Laila on Sol for routine orchestration, waiting, status or synthesis.

## Mutation routing

- application implementation -> Dave;
- infrastructure/IaC/CI/CD/production -> Guto;
- design artifacts -> Ashley;
- delivery docs/status -> Laila;
- business/finance/marketing artifacts -> owning domain persona.

Laila, Roberto, Clara and Ana never program. Ashley never writes production
application code.

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

## Project initialization

```bash
bash scripts/init-project.sh --context
bash scripts/init-project.sh --design
bash scripts/init-project.sh --engineering
bash scripts/init-project.sh --delivery
bash scripts/init-project.sh --all
```
