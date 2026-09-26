# AI Personas Usage

Use the domain owner directly whenever the request has one clear owner. Use
Laila when the outcome is materially cross-functional or primarily about
delivery coordination.

## Direct routing

```text
Fix this React bug and verify it.                         -> Dave
Design this onboarding flow and visual system.           -> Ashley
Investigate why production latency spiked.               -> Guto
Model runway under these assumptions.                    -> Clara
Decide our B2B operating model.                          -> Roberto
Build the launch channel/measurement plan.               -> Ana
Coordinate launch across pricing/design/code/infra/GTM.  -> Laila
```

You normally do not need to name the persona. The skill descriptions are
written to make implicit routing discriminative.

## Cross-functional work

Example:

```text
Coordinate the launch of this subscription feature.

We need:
- business/packaging decision;
- financial validation;
- UX states;
- implementation;
- production rollout;
- launch communications.

Give me one integrated plan, explicit dependencies and evidence-based
completion.
```

Laila owns coordination, while the domain personas retain their decision
authority.

## Sol/Luna behavior

Model selection is internal by default.

For non-trivial work:

```text
Sol  -> investigate, decide, decompose
        ↓ execution packet
Luna -> execute, validate, apply feedback
        ↓ only if a new decision appears
Sol  -> resolve decision, preferably reusing the same planner context
```

A small, obvious, low-risk task can run directly on Luna.

## Project memory initialization

The root initializer is explicit; it no longer silently means "initialize
Ashley".

```bash
bash scripts/init-project.sh --design
bash scripts/init-project.sh --engineering
bash scripts/init-project.sh --delivery
bash scripts/init-project.sh --all
```

Each initializer preserves existing project-owned sources of truth and should
only add memory where an equivalent system does not already exist.

## Installation

Install one persona:

```bash
npx skills add gustavolbs/ai-personas --skill dave -g -a codex -y
```

Install the complete suite from a clone:

```bash
bash scripts/install-all.sh
```

Verify the installed trees exactly match the clone:

```bash
bash scripts/verify-installed.sh
```

Inspect optional local capabilities:

```bash
bash scripts/doctor.sh
```

## Optional specialists

The canonical Agency Agents roster lives in `SPECIALISTS.json`; pinned
third-party inputs live in `THIRD_PARTY.lock.json`.

```bash
bash scripts/install-dave-specialists.sh
bash scripts/install-team-specialists.sh
bash scripts/install-specialists.sh
```

To require a SkillSpector pass for cloned third-party skill/agent bundles:

```bash
AI_PERSONAS_REQUIRE_SKILLSPECTOR=1 bash scripts/install-dave-specialists.sh
```

Specialists are bounded workers/reviewers, not new authorities.

## Repository validation

```bash
bash scripts/validate.sh
```

This checks persona structure, version consistency, bundled runtime contracts,
shell syntax, JSON manifests, specialist pins and the behavior-eval manifest.

## Behavioral evals

Validate the harness without using model quota:

```bash
node evals/run-behavior-evals.mjs
```

Run the default live smoke set:

```bash
node evals/run-behavior-evals.mjs --live
```

Run all routing cases:

```bash
node evals/run-behavior-evals.mjs --live --all
```

Run one case:

```bash
node evals/run-behavior-evals.mjs --live --case=dave-fast-bug
```

Live traces and metrics are written to `evals/artifacts/`, which is ignored
by Git.

## Evidence language

A persona should say what was actually established:

- proposed;
- changed;
- built;
- run;
- verified;
- unverified.

Do not collapse these states into "done" when the required proof was not
available.
