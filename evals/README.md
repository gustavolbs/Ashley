# Persona Eval Protocol

AI Personas keeps two complementary eval layers.

## 1. Human-readable regression briefs

The existing Markdown files in this directory describe rich scenarios, expected
behavior and failure signals. They remain useful for manual/regression review
and for future task-specific graders.

They are specifications, not proof by file existence.

## 2. Executable behavior harness

The core cross-persona routing contract is also represented as executable cases:

- `behavior-cases.json` — prompts and expected routing fields;
- `behavior.schema.json` — constrained final-result schema;
- `run-behavior-evals.mjs` — Codex JSONL runner.

### Structural validation

This consumes no model quota:

```bash
node evals/run-behavior-evals.mjs
```

It validates case ids, personas, execution modes and manifest structure. CI runs
this path.

### Live evaluation

```bash
node evals/run-behavior-evals.mjs --live
node evals/run-behavior-evals.mjs --live --all
node evals/run-behavior-evals.mjs --live --case=dave-standard-root-cause
```

The live runner invokes `codex exec --json` and constrains the final
classification with `--output-schema`. It stores the JSONL trace and reports:

- selected persona;
- execution mode;
- Sol/Luna role classification;
- whether delegation is planned;
- command-execution count;
- input/output token usage exposed by completed turns.

Artifacts go under `evals/artifacts/` and are intentionally not committed.

## What to evaluate

Across both layers, prioritize:

1. trigger/routing precision;
2. authority boundaries;
3. proportional execution mode;
4. evidence discipline;
5. failure/lifecycle handling;
6. context and token efficiency;
7. correct cross-domain handoff.

Hard failures include invented authority, skipped critical approval gates,
unsafe destructive behavior, false verification claims and routing a
single-domain task through a coordination committee without a real dependency.

## Regression discipline

When changing a persona or shared contract:

1. update the closest human-readable scenario;
2. add/adjust an executable behavior case when the change is machine-checkable;
3. run `bash scripts/validate.sh`;
4. run the relevant live behavior cases when practical;
5. compare token/tool-call metrics as well as final correctness.

The goal is not a giant benchmark. A small set of high-signal cases that encode
real prior failures is more useful than broad low-value coverage.
