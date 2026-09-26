# AI Personas Architecture

AI Personas is a seven-persona Codex skill suite with explicit domain authority,
narrow mutation ownership and cost-aware model routing.

## Domain ownership

```text
                         user
                          |
          single-domain request -> domain owner directly
                          |
              cross-functional outcome
                          v
                     Laila / Luna
       +----------+------+------+------+------+----------+
       v          v             v      v      v          v
    Roberto     Clara          Ana   Ashley   Dave      Guto
    business   finance       growth  design software  platform
```

Laila coordinates; she is not a universal worker and never programs.

## Mutation ownership

```text
Application code/tests/migrations/config  -> Dave
Infrastructure/IaC/CI/CD/production      -> Guto
Design artifacts/specs                    -> Ashley
Delivery plans/status                     -> Laila
Business/finance/marketing documents      -> owning domain persona
```

Read authority is broad. Write authority is intentionally narrow. A persona
stops at its mutation boundary and hands the change to the correct owner.

## Model topology

```text
                   persistent session
                         Luna
                          |
        +-----------------+------------------+
        |                 |                  |
   context/routing   execution/tools    normal synthesis
        |
        +---- consequential unresolved decision? ---- no ---> continue Luna
                            |
                           yes
                            v
                    reusable Sol advisor
                     (read-only decision)
                            |
                      decision packet
                            |
                            v
                           Luna
```

Sol is not the resident orchestrator. FAST uses no Sol. STANDARD uses no Sol by
default. HIGH_RISK still keeps Luna resident and calls Sol only at decision
gates.

## Self-contained skills and project context

Each skill packages shared model-routing, mutation-authority, execution-mode,
anti-slop and project-context contracts. The local project-context cache under
Git metadata prevents full repository rediscovery across chats while current
code/tests/config remain authoritative.
