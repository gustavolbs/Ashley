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
  ├── repository/project intake
  ├── project design memory (docs/design)
  ├── global preference memory (~/.ashley)
  ├── optional Codex subagents (ephemeral delegation)
  ├── optional specialist skills
  │    ├── UI/UX Pro Max
  │    ├── Taste
  │    └── Impeccable
  └── design canvas capability
       ├── pen.dev / Pencil MCP + .pen files (preferred)
       ├── pen CLI headless resilience path
       ├── Penpot MCP (supported fallback)
       └── code/browser sandbox (last-resort UI fallback)
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

The primary intelligence bottleneck is design reasoning, project comprehension, creative exploration and visual evaluation — not orchestration infrastructure.

Codex subagents are used only as ephemeral helpers for independent tasks such as repository mapping, reference research or critique. They do not turn Ashley into a separate multi-agent runtime. Ashley remains the final synthesizer and creative authority.

## Progressive disclosure

`SKILL.md` contains the operating system and routing logic.

Detailed knowledge lives in `references/` so Codex can load only what is relevant:
- project/repository intake;
- business/product;
- research;
- architecture;
- interaction;
- visual craft;
- brand/logo;
- creative production and campaign/social design;
- systems;
- accessibility;
- creative exploration;
- critique;
- design-canvas abstraction;
- pen.dev/Pencil;
- Penpot fallback;
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

Ashley evaluates learning proactively after approvals, rejections, corrections and observed design failures. The distinction between project and global memory prevents a decision for one product from becoming an accidental rule for every future product.

There is no background learner. "Automatic learning" means Ashley updates the appropriate durable memory during normal design sessions without requiring an explicit "remember this" command.

## Specialist model

Ashley is the authority.

Specialists are tools:
- UI/UX Pro Max = searchable repertoire/data.
- Taste = creative visual pressure / anti-generic exploration.
- Impeccable = critique / finish pressure.

Ashley may take a recommendation, adapt it, or reject it.

## Design canvas

Ashley does not depend on one vendor-specific canvas.

### Preferred: pen.dev / Pencil
Repo-owned `.pen` files provide a durable, versionable design artifact. Ashley can use the local `pencil` MCP when the desktop/IDE host is available, and the `pen` CLI as a headless resilience/export path.

### Supported fallback: Penpot
Penpot remains supported for existing projects and stable MCP sessions.

### Last-resort UI fallback
If no writable design canvas is available, Ashley may use an isolated code/browser visual sandbox for UI exploration and visual QA, while clearly marking that the result is not an editable vector design source.

Every consequential visual write is followed by rendered inspection regardless of canvas.

## Evals

`evals/` contains stable design briefs used as regression tests.

After changing Ashley's core process:
- run several briefs with the same capable model;
- compare product reasoning, diversity, visual specificity, usability and adherence;
- reject changes that improve one aesthetic style while degrading mode generality.

The evals are intentionally cross-domain to prevent Ashley becoming "the SaaS dashboard skill".


## Full creative scope

Ashley owns more than product UI. The same reasoning/memory/creative loop applies to:
- identities and logo systems;
- social-media creative;
- campaigns and ad concepts;
- launch/marketing graphics;
- icon and vector systems;
- editorial/blog/email graphics;
- branded diagrams and collateral.

The selected editable design canvas remains the default layout/vector production surface. If the host exposes image-generation/editing tools, Ashley can use them as source-asset tools under her art direction.

## Existing projects

Before designing into an existing repository, Ashley runs a proportional Project Intake:
- product/docs;
- domain models and routes;
- existing UI/components/tokens;
- brand assets;
- current design memory.

Large repo exploration can be delegated read-only to Codex's built-in explorer subagent. Ashley then synthesizes the findings and designs from the actual product context rather than a generic SaaS prior.


## Ashley 1.0 production architecture

The runtime remains one skill, but the quality loop now contains six explicit production concerns:

```text
project + business understanding
        ↓
creative strategy / message
        ↓
taste prior + creative divergence
        ↓
editable canvas production
        ↓
render/export visual QA
        ↓
artifact-specific finish gate
        ↓
design↔code / asset handoff
        ↓
learning + contradiction-aware memory
```

### Taste
`~/.ashley/TASTE_PROFILE.md` stores a soft preference prior. It never overrides the brief, product evidence or approved project identity.

### Visual observation
For high-fidelity work, structure inspection is insufficient. Ashley should export/render a representative artifact and inspect the pixels with a vision-capable model. A successful MCP write is not a visual pass.

### Messaging
Campaign and growth creative receives a communication brief before visual execution.

### Provenance
Asset use records whether rights/source are owned, licensed, generated, verified or unresolved.

### Design ↔ code
Existing implementations are evidence. Ashley identifies whether design or code is authoritative for each system layer and records the mapping instead of silently creating divergence.

### Definition of done
Completion is artifact-specific and evidence-based.
