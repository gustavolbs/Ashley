# Ashley Architecture

Ashley intentionally remains **one Codex Agent Skill**.

There is no independent Ashley runtime.

## Runtime architecture

```text
User
  ↓
Codex
  ├── Ashley SKILL.md
  ├── Ashley references/ (loaded on demand)
  ├── project design memory (docs/design)
  ├── global preference memory (~/.ashley)
  ├── optional specialist skills
  │    ├── UI/UX Pro Max
  │    ├── Taste
  │    └── Impeccable
  └── Penpot MCP
         ↓
      Penpot canvas
```

The model may be provided by OpenAI or by a custom provider such as RouteMux. Ashley is instructions + knowledge + tools, not a model.

## Why one skill

A separate service/multi-agent runtime would add:
- deployment;
- process management;
- another tool loop;
- duplicated memory;
- additional failure modes;
- routing complexity.

None is required for the intended founder/design workflow.

The primary intelligence bottleneck is design reasoning and visual evaluation, not orchestration infrastructure.

## Progressive disclosure

`SKILL.md` contains the operating system and routing logic.

Detailed knowledge lives in `references/` so Codex can load only what is relevant:
- business/product;
- research;
- architecture;
- interaction;
- visual craft;
- brand/logo;
- systems;
- accessibility;
- creative exploration;
- critique;
- Penpot;
- memory.

This keeps the always-on instruction footprint small enough for normal engineering sessions.

## Creativity architecture

Ashley does not use "be creative" as the mechanism.

She uses a finite design-space loop:

1. Frame the job and constraints.
2. Identify design dimensions with meaningful freedom.
3. Retrieve near, adjacent and (when useful) distant patterns.
4. Generate multiple coherent hypotheses.
5. Remove dominated/redundant concepts.
6. Materialize the survivors.
7. Critique against product and craft constraints.
8. Receive human preference signal.
9. Produce descendants.
10. Store scoped learnings.

This balances novelty and assertiveness:
- constraints prevent random art;
- divergence prevents first-answer fixation;
- critique prevents novelty for novelty's sake;
- human preference trains product-specific taste.

## Memory

No DB/runtime is required.

### Project memory
Versioned with each product:
`docs/design/*.md`.

### Global memory
Local to the user:
`~/.ashley/PREFERENCES.md`
`~/.ashley/HEURISTICS.md`.

The distinction prevents a decision for one fintech product from becoming an accidental rule for every future product.

## Specialist model

Ashley is the authority.

Specialists are tools:
- UI/UX Pro Max = searchable repertoire/data.
- Taste = creative visual pressure / anti-generic exploration.
- Impeccable = critique / finish pressure.

Ashley may take a recommendation, adapt it, or reject it.

## Penpot

Penpot is the principal design action surface:
- Ashley reads the actual file/page;
- edits it;
- re-reads it;
- compares variants there.

The MCP does not replace visual judgment. Every consequential write should be followed by inspection.

## Evals

`evals/` contains stable design briefs used as regression tests.

After changing Ashley's core process:
- run several briefs with the same capable model;
- compare product reasoning, diversity, visual specificity, usability and adherence;
- reject changes that improve one aesthetic style while degrading mode generality.

The evals are intentionally cross-domain to prevent Ashley becoming "the SaaS dashboard skill".
