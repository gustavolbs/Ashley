# Ashley

**Ashley is a staff-level Product, UX, Visual & Brand Designer for Codex.**

The goal is simple: before you code a SaaS, talk to Ashley like you would talk to a strong product designer.

```text
Ashley, I want to build a SaaS for property managers.
Here is the scope and business model.
Understand the product, create the visual identity and logo, then start
designing the main flows in Penpot. Do not write production code yet.
```

Ashley is one Codex **Agent Skill**. There is no Ashley server, daemon, database service, or second agent runtime.

Her capability comes from:

- product/business reasoning;
- UX research discipline and information architecture;
- interaction design;
- visual design and art direction;
- brand identity and logo design;
- design systems and accessibility;
- structured creative divergence (A/B/C directions);
- visual critique and finish gates;
- Penpot MCP as the design canvas;
- durable design memory;
- optional specialist skills such as UI/UX Pro Max, Taste and Impeccable.

## Install Ashley

The easiest installation is the standard Agent Skills CLI:

```bash
npx skills add gustavolbs/Ashley --skill ashley -g -a codex -y
```

Restart Codex after installation.

Verify:

```text
/skills
```

You should see **ashley**.

Alternatively, clone the repository and run:

```bash
git clone https://github.com/gustavolbs/Ashley.git
cd Ashley
bash scripts/install.sh
```

## Recommended specialist skills

Ashley works by herself, but three optional skills materially expand her repertoire:

```bash
bash scripts/install-specialists.sh
```

This installs:

- **UI/UX Pro Max** — searchable style/product/color/type/UX intelligence.
- **Taste** — visual differentiation and anti-generic exploration.
- **Impeccable** — critique, polish and deterministic UI anti-pattern detection.

They remain independent upstream skills so they can be updated normally.

Ashley is the design director. Specialist instructions never override the active product brief, accessibility constraints, approved brand decisions, or Ashley's mode-specific rules.

## Initialize a product repository

Inside the SaaS/product repo:

```bash
~/.agents/skills/ashley/scripts/init-project.sh
```

This creates:

```text
docs/design/
├── PRODUCT.md
├── RESEARCH.md
├── BRAND.md
├── UX.md
├── DESIGN_SYSTEM.md
├── DECISIONS.md
└── LEARNINGS.md
```

Commit these files. They become the durable design memory for the product.

Ashley also uses global preferences under:

```text
~/.ashley/
├── PREFERENCES.md
└── HEURISTICS.md
```

The installer creates them if missing.

## Penpot

Ashley is designed to use Penpot Cloud via the official Penpot MCP server.

You do not install Penpot into the SaaS repo.

1. Open Penpot Cloud.
2. In your Penpot account, enable the MCP integration and generate its MCP URL/token.
3. Add the remote MCP server to Codex as `penpot`.
4. Open the desired Penpot file/page.
5. In Penpot, connect the active file/page to MCP.
6. Ask Ashley to inspect or edit the current canvas.

See [references/penpot.md](references/penpot.md).

## RouteMux

Ashley is model-provider agnostic. RouteMux can provide the model as long as the selected model is strong at:

- tool/function calling;
- vision;
- long instruction following;
- spatial/visual reasoning;
- multi-step reasoning.

The main failure mode is a model that describes an MCP action instead of calling the MCP tool correctly.

For consequential product/brand work, prefer your strongest reliable vision + tool-calling reasoning model. Use cheaper models for repetitive token/component work.

## How Ashley creates rather than merely follows rules

Ashley uses a structured creative loop:

```text
understand the job
      ↓
map constraints
      ↓
search/retrieve repertoire
      ↓
diverge into genuinely different concepts
      ↓
materialize A/B/C
      ↓
critique against product + craft
      ↓
compare tradeoffs
      ↓
human preference signal
      ↓
converge
      ↓
record what was learned
```

A/B/C means different **design hypotheses**, not the same layout with three colors.

Ashley can vary:

- interaction model;
- hierarchy;
- information density;
- navigation;
- typography;
- shape language;
- composition;
- brand expression;
- imagery/iconography;
- motion.

## Example workflow

```text
Ashley, we're building an accounts-receivable SaaS for small property managers.
The landlord is the buyer, but property managers operate it every day.
Here is the business model and scope.

First understand the business and users. Then give me three distinct product +
brand directions. Materialize the strongest alternatives in Penpot so I can compare.
```

Then:

```text
Ashley, A has the best product structure. B has a better personality.
C feels too experimental. Create A2 preserving A's architecture but exploring
a warmer visual language without becoming playful. Learn from this feedback.
```

Then:

```text
Ashley, direction A2 is approved. Establish the design system and design the
highest-frequency operational flow, including loading, empty, error and
permission states.
```

## Repository

- `SKILL.md` — Ashley's orchestration brain.
- `references/` — knowledge packs loaded on demand.
- `templates/` — project design-memory templates.
- `scripts/` — installer and project initializer.
- `evals/` — regression briefs for testing Ashley after changes.
- `docs/ARCHITECTURE.md` — architecture and design rationale.

Ashley deliberately stays a **skill**, not a new framework.
