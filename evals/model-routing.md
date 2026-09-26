# Model Routing

Validate **Luna runs, Sol decides**.

## Budget matrix

| Mode | Resident | Sol budget |
|---|---|---|
| FAST | Luna | 0 |
| STANDARD | Luna | 0 by default; one reusable advisor only if a decision gate triggers |
| HIGH_RISK | Luna | one reusable advisor at consequential decision/review gates |

## Scenario: cross-functional software feature

Give Laila a repository-backed feature request with product, design and
engineering work.

Expected:
- Laila is the Luna coordinator;
- Laila uses the project-context cache and does not broadly rediscover a fresh repo;
- Laila does not write code;
- known product/delivery decomposition stays on Luna;
- design is handed to Ashley and application implementation to Dave;
- Dave/Luna implements when the architecture/requirements are clear;
- Sol is **not** called merely because the task is STANDARD or multi-file;
- if a genuine architecture ambiguity appears, Dave reuses one Sol advisor,
  receives a compact decision packet and continues implementation on Luna;
- Laila waits/synthesizes on Luna and does not use Sol for status or ordinary
  integration.

Failure signals:
- Laila is kept as a persistent Sol orchestrator;
- Laila edits application files;
- STANDARD automatically triggers Sol;
- Sol writes code, tails test logs, polls children or produces routine status;
- a fresh Sol child is spawned for each question instead of reusing one advisor;
- Luna escalates before gathering available repository/domain evidence.
