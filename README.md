# AI Personas

**AI Personas is a collection of opinionated Codex personas that own real work end-to-end.**

| Persona | Level | Primary ownership |
|---|---|---|
| **Ashley** | Staff | Product, UX, visual design, brand and creative direction |
| **Dave** | Staff / Principal | Software engineering, implementation orchestration, code quality, testing and Git discipline |
| **Guto** | Planned | DevOps, SRE, infrastructure and production operations |

Each persona is a self-contained skill under `skills/<name>/`. The public skill names remain **ashley** and **dave**, so installation stays simple while the repository can grow cleanly.

## Install

Install one persona:

```bash
npx skills add gustavolbs/ai-personas --skill ashley -g -a codex -y
npx skills add gustavolbs/ai-personas --skill dave -g -a codex -y
```

Or clone once and install both:

```bash
git clone https://github.com/gustavolbs/ai-personas.git
cd ai-personas
bash scripts/install-all.sh
```

## Dave

**Dave is a Staff/Principal Software Engineer and coding orchestrator. He owns outcomes, not lines of code.**

Dave understands the repository before changing it, fills safe requirement gaps, applies engineering principles without pattern worship, delegates bounded work to the right specialists, implements and integrates the result, verifies it, removes unnecessary code, and leaves coherent semantic commits.

His default operating loop is:

```text
understand → inspect → fill safe gaps → design → delegate selectively
→ implement → integrate → test/QA → simplify → commit → report
```

Dave can use installed Agency Agents such as Frontend Developer, Backend Architect, Product Manager, Reality Checker, Evidence Collector and API Tester as subagents. If delegation is unavailable, rate-limited or more expensive than doing the work directly, Dave owns the task himself.

Deep DevOps/SRE ownership is intentionally outside Dave's scope; that will belong to **Guto**. Dave still handles the minimum application-level configuration required to complete a software change.

Install Dave from a clone:

```bash
bash scripts/install-dave.sh
```

Initialize optional engineering memory inside a project only when the repo does not already have an equivalent ADR/engineering-doc system:

```bash
~/.agents/skills/dave/scripts/init-project.sh
```

Dave prefers existing `AGENTS.md`, ADRs, architecture docs and executable repository truth over creating parallel memory.

## Ashley

**Ashley is a staff-level Creative Director, Product, UX, Visual & Brand Designer for Codex.**

The goal is simple: Ashley should be the person you call for **anything visual or product-design related** — from understanding an existing codebase and designing a new flow to creating the brand, logo, social campaign, launch assets or visual system.

```text
Ashley, I want to build a SaaS for property managers.
Here is the scope and business model.
Understand the product, create the visual identity and logo, then start
designing the main flows in the project design canvas. Do not write production code yet.
```

Ashley is one Codex **Agent Skill**. There is no Ashley server, daemon, database service, or second agent runtime.

Her capability comes from:

- repository/project understanding before design;
- product/business reasoning;
- UX research discipline and information architecture;
- interaction design;
- visual design and art direction;
- brand identity and logo design;
- graphic design, social-media art, campaign systems and marketing assets;
- design systems and accessibility;
- structured creative divergence (A/B/C directions);
- visual critique and finish gates;
- a canvas abstraction with pen.dev preferred, Penpot supported, and browser/code fallback;
- proactive learning from approvals, rejections and corrections;
- durable project + global design memory;
- optional Codex subagent delegation for repository exploration, research and independent critique;
- optional specialist skills such as UI/UX Pro Max, Taste and Impeccable.

## What Ashley can own

Ashley is intentionally broader than a SaaS UI skill.

```text
Product
├── UX architecture
├── web / desktop / mobile UI
├── prototypes
├── design systems
└── experimentation

Brand
├── positioning → visual translation
├── logo / wordmark / app icon
├── typography / color / shape language
├── iconography / imagery direction
└── brand guidelines

Creative production
├── social posts / carousels / stories / thumbnails
├── launch and campaign key visuals
├── ad creatives
├── email/blog/editorial graphics
├── one-pagers / press kits / branded diagrams
└── reusable creative templates
```

For existing projects, Ashley first inspects the repo and reconstructs enough product/design context to continue coherently rather than starting from generic defaults.

## Ashley 1.0 quality loop

Ashley 1.0 adds six production-grade layers:

1. **Visual QA** — high-fidelity work must be exported/rendered and visually inspected, not merely validated from layers.
2. **Taste Calibration** — a global but non-rigid taste profile accelerates learning of the user's preferences.
3. **Creative Strategy & Messaging** — campaigns start from audience/message/idea, not decoration.
4. **Asset Provenance & Licensing** — fonts, icons, stock, generated imagery and third-party assets carry explicit provenance status.
5. **Design ↔ Code Sync** — Ashley chooses and documents source-of-truth rules instead of creating parallel design systems.
6. **Artifact DoD** — logos, product screens, social assets, campaigns, systems and other artifacts have explicit finish gates.

These layers still run inside the same single Codex skill.

## Recommended design canvas

Ashley is no longer tied to Penpot.

The preferred workflow is now **pen.dev/Pencil + repo-owned `.pen` files**:

```text
project/
├── src/
├── docs/design/
└── design/
    ├── product.pen
    ├── brand.pen
    └── campaigns.pen
```

Why this is the preferred path:
- `.pen` files are version-control friendly;
- Codex can connect through the local `pencil` MCP;
- the `pen` CLI can work headlessly;
- screenshots/exports can be generated for Visual QA;
- design stays physically associated with the product repo.

Penpot remains fully supported as a fallback for projects already using it.

See:
- `docs/PEN_DEV_SETUP.md`
- `docs/PENPOT_SETUP.md`
- `skills/ashley/references/design-canvas.md`

## Install Ashley

The easiest installation is the standard Agent Skills CLI:

```bash
npx skills add gustavolbs/ai-personas --skill ashley -g -a codex -y
```

Restart Codex after installation.

Verify:

```text
/skills
```

You should see **ashley**.

Alternatively, clone the repository and run:

```bash
git clone https://github.com/gustavolbs/ai-personas.git
cd ai-personas
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
├── MESSAGING.md
├── UX.md
├── DESIGN_SYSTEM.md
├── ASSETS.md
├── HANDOFF.md
├── DECISIONS.md
└── LEARNINGS.md
```

Commit these files. They become the durable design memory for the product.

Ashley also uses global preferences under:

```text
~/.ashley/
├── PREFERENCES.md
├── HEURISTICS.md
└── TASTE_PROFILE.md
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

See [references/penpot.md](skills/ashley/references/penpot.md).

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

- `skills/ashley/` — Ashley's skill, references, templates and project initializer.
- `skills/dave/` — Dave's Principal Engineer skill and on-demand engineering references.
- `skills/ashley/references/` — knowledge packs loaded on demand.
- `templates/` — project design-memory templates.
- `scripts/` — installer and project initializer.
- `evals/` — regression briefs for testing Ashley after changes.
- `docs/ARCHITECTURE.md` — architecture and design rationale.

Ashley deliberately stays a **skill**, not a new framework.


## Component-library materialization

Ashley treats requests like "recreate our shadcn library in design" as deterministic system work rather than free-form generation.

For shadcn/ui she:
- reads the project's `components.json` and actual component source;
- queries current shadcn registry/docs when upstream coverage is requested;
- builds a manifest;
- maps real project tokens into design variables;
- creates a reusable `.lib.pen` library;
- works in small dependency-ordered batches;
- visually QA's every batch before continuing.

This avoids hallucinating component names, variants or Pencil operations.


### Design-first shadcn

Ashley can prepare a shadcn-oriented design system **before shadcn is installed**.

In that mode she derives the required component set from product flows, checks the current official shadcn catalog for implementation feasibility, builds product-specific semantic tokens and creates the reusable design library first. When shadcn is installed later, implementation mirrors the approved design contract rather than defining the visual system from scratch.
