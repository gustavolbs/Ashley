# Third-party integrations

AI Personas does not vendor third-party skills or agent catalogs. External
inputs remain optional and independently licensed.

Two files control the integration surface:

- `SPECIALISTS.json` — the curated Agency Agents roster that installers and
  `doctor.sh` consume;
- `THIRD_PARTY.lock.json` — exact repository commits/package versions used by
  the optional installers.

Do not maintain a second hand-written roster in documentation or scripts.

## Agency Agents

Repository: https://github.com/msitarzewski/agency-agents

Purpose: bounded domain specialists and independent reviewers. Persona owners
retain authority and integration responsibility.

Installers:

```bash
bash scripts/install-dave-specialists.sh
bash scripts/install-team-specialists.sh
```

Both installers fetch the exact commit in `THIRD_PARTY.lock.json`. To test a
different upstream intentionally, override both repository/commit environment
variables and treat the result as an experiment rather than a release default.

## Ashley specialist inputs

### Taste

Repository: https://github.com/tasteskill/tasteskill

Role: visual divergence and anti-generic design pressure. The installer clones
the locked commit and installs only the selected skills.

### UI/UX Pro Max

Repository: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill

Role: searchable design/UX repertoire. The CLI package version is pinned in
`THIRD_PARTY.lock.json`.

### Impeccable

Repository: https://github.com/pbakaus/impeccable

Role: design critique, accessibility/performance checks and deterministic
UI-quality pressure. The CLI package version is pinned in the lock file.

Install:

```bash
bash scripts/install-specialists.sh
```

## Security scanning

NVIDIA SkillSpector can be required for cloned third-party bundles:

```bash
AI_PERSONAS_REQUIRE_SKILLSPECTOR=1 bash scripts/install-dave-specialists.sh
AI_PERSONAS_REQUIRE_SKILLSPECTOR=1 bash scripts/install-team-specialists.sh
AI_PERSONAS_REQUIRE_SKILLSPECTOR=1 bash scripts/install-specialists.sh
```

A static scan is one signal, not proof of runtime safety.

## Other optional intelligence

- **AIslop** — deterministic changed-code quality signal;
- **Reticle** — supported project-local runtime verification;
- **ibelick UI Skills** — narrow design-engineering lenses;
- **Everything Claude Code (ECC)** — selectively adapted workflow ideas;
- **Ponytail** — anti-overengineering/YAGNI pressure;
- **Caveman** — optional token/context compression.

These are never allowed to override the active user request, repository truth,
security/accessibility requirements or persona authority.

## Upgrade discipline

To update an external default:

1. inspect upstream changes and license/security implications;
2. update the exact commit/version in `THIRD_PARTY.lock.json`;
3. run the applicable scanner when available;
4. run `bash scripts/validate.sh`;
5. run affected live behavior/domain evals when practical;
6. record the change in the changelog.

Avoid `latest`, default-branch HEAD or silent self-updates in release
installers.
