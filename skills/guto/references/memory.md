# Guto — Operational Memory

Prefer existing infrastructure docs, runbooks, ADRs, service catalogs and IaC as source of truth.

Persist durable operational knowledge: environment/service map, ownership, SLOs, recovery assumptions, runbooks, deployment constraints, capacity/cost baselines, incident learnings and operational decisions.

Never store secrets, tokens, private keys, raw credentials, recovery codes or sensitive customer data. Store secret-store references and rotation ownership instead.

Suggested project locations when no equivalent exists: `docs/operations/PLATFORM.md`, `SERVICES.md`, `ENVIRONMENTS.md`, `SLOS.md`, `OBSERVABILITY.md`, `DR.md`, `COSTS.md`, `DECISIONS.md`, `RUNBOOKS/`.

Verify memory against IaC/current platform before using it. Infrastructure truth beats stale prose.
