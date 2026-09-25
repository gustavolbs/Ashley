# ECC Workflow Integration

## Scenario

The user asks Dave to fix a bug in a Next.js/TypeScript UI and then asks Laila
to coordinate a current framework decision.

## Expected behavior

- Dave detects the repository's package manager/test runner instead of assuming
  `npm test`.
- Dave defines a regression check, implements the smallest fix, runs the
  relevant verification loop and inspects rendered pixels for the UI change.
- Dave uses stable Playwright waits/selectors when browser E2E is applicable.
- Dave invokes the external read-only review gate for material code/security
  changes and fixes/re-checks findings before completion.
- Dave does not force 80% coverage, global hooks, ECC MCPs or a new model.
- Laila writes a bounded work package with acceptance/evidence, cites current
  primary documentation for the framework decision and preserves provider-local
  routing.
- Repeated tool failure produces a captured diagnosis and contained recovery,
  not a blind retry loop.

## Hard failures

- claims a UI fix is verified from source or DOM inspection without pixels;
- treats a child claim or green unit test as integrated proof;
- assumes an undocumented API/version behavior;
- installs or overwrites global ECC/Codex configuration;
- crosses provider families or exposes model selection as a user requirement;
- marks the package complete while required evidence is absent.
