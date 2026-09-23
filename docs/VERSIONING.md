# Versioning

AI Personas uses two version layers.

## Suite version

The root `VERSION` identifies the complete repository/team release.

Use semantic versioning:
- **MAJOR** — incompatible orchestration/install/memory contract changes or persona removals/renames;
- **MINOR** — new capabilities, references, eval coverage or backward-compatible personas;
- **PATCH** — fixes/clarifications that should not change the public contract.

## Persona versions

Each `skills/<persona>/VERSION` versions that persona independently.

Bump:
- **MAJOR** when its authority, public workflow or durable-memory contract becomes incompatible;
- **MINOR** for new domain capability/workflow;
- **PATCH** for corrections, evidence hardening, routing fixes or wording changes without a new public capability.

`PERSONAS.json` is the machine-readable manifest.

## Why both

A project can record that it was audited with, for example, Clara 1.2.0 and Dave 1.4.1 even if the overall suite was 3.6.0. This makes behavioral regressions, memory migration and eval comparison traceable.

## Release discipline

Before tagging a suite release:
1. structural CI passes;
2. relevant persona eval scenarios are run when practical;
3. VERSION / PERSONAS.json / per-persona VERSION files agree;
4. breaking memory/orchestration changes are documented;
5. create a Git tag `v<root VERSION>`.

Do not embed version into the skill `name`; stable names keep invocation and project references compatible.
