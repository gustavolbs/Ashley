# Versioning

AI Personas versions the suite and each persona separately.

## Suite version

Root `VERSION` identifies the complete repository release.

- **MAJOR** — incompatible authority/orchestration/install/memory contracts or
  persona removal/rename;
- **MINOR** — backward-compatible runtime behavior, tooling, eval or persona
  capability changes;
- **PATCH** — corrections that do not change the public behavior contract.

## Persona versions

`skills/<persona>/VERSION` tracks the public behavior of that skill.

- **MAJOR** — incompatible authority/workflow/memory change;
- **MINOR** — new workflow/capability or materially changed routing behavior;
- **PATCH** — corrections/evidence hardening without a new workflow.

`PERSONAS.json` is the machine-readable suite/persona manifest.

## Generated and locked artifacts

Release consistency also includes:

- every `skills/<persona>/references/runtime-contracts.md` synchronized from
  canonical `docs/` contracts;
- `SPECIALISTS.json` as the only curated Agency Agents roster;
- `THIRD_PARTY.lock.json` with exact external commits/package versions.

Generated contract files are committed because standalone skill installation
must be self-contained.

## Release discipline

Before a suite release:

1. run `bash scripts/validate.sh`;
2. confirm generated runtime contracts are synchronized;
3. confirm root/persona versions agree with `PERSONAS.json`;
4. review any third-party lock changes;
5. run the closest live behavior/domain evals when practical;
6. compare routing/tool/token metrics for changes that affect execution cost;
7. document user-visible behavior in `CHANGELOG.md`;
8. create tag `v<root VERSION>`.

Stable skill names are never version-suffixed; discovery and project references
depend on those names remaining stable.
