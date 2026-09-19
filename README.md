# Ashley

Ashley is a **Principal Product & Brand Designer for Codex**.

She is designed for a specific workflow:

```text
idea / product scope
        ↓
product + UX reasoning
        ↓
brand / identity / logo
        ↓
design system
        ↓
Penpot prototype
        ↓
critique + iteration
        ↓
approved design
        ↓
implementation
```

Ashley is not meant to be another "make this UI beautiful" prompt. The skill is organized as a design operating system: product reasoning, research discipline, information architecture, interaction design, visual design, brand identity, logo construction, design systems, accessibility, critique, Penpot operation, and durable learning.

## Design stack

Ashley has her own design knowledge and can orchestrate optional specialist skills:

- **Agency Agents** — role/process inspiration: UI Designer, UX Architect, UX Researcher, Brand Guardian, UI Finish-Gate Reviewer.
- **Taste Skill** — visual taste and anti-generic creative direction.
- **UI/UX Pro Max** — searchable product/style/color/typography/UX pattern intelligence.
- **Impeccable** — design critique, anti-pattern detection, refinement and visual QA.
- **Awesome Design Skills / TypeUI** — optional style references chosen per project; never bulk-applied as a default aesthetic.

Ashley treats these as specialists, not as substitutes for product judgment.

## Install

Clone the repo and install Ashley globally:

```bash
git clone https://github.com/gustavolbs/Ashley.git
cd Ashley
bash scripts/install.sh
```

To also install/update recommended specialist skills:

```bash
bash scripts/install.sh --with-specialists
```

Then restart Codex.

Ashley installs to:

```text
~/.agents/skills/ashley/
```

The specialist installer intentionally keeps third-party skills as separate skills so they can be updated from their original projects.

## Initialize a product repo

Inside the SaaS/product repository:

```bash
~/.agents/skills/ashley/scripts/init-project.sh
```

This creates a project design memory under:

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

Commit these files with the product.

## Penpot

Ashley is designed to use **Penpot Cloud through the Penpot MCP server**. Penpot itself does not need to live in the SaaS repo.

1. Open Penpot Cloud.
2. Enable its MCP integration and generate the MCP URL/token.
3. Add that MCP server to Codex.
4. Open the design file/page in Penpot and connect the active file to MCP.
5. Ask Ashley to inspect or edit the active page.

See `references/penpot.md`.

## Usage

Natural language is the intended interface:

```text
Ashley, I want to make a SaaS for property managers.
Here is the scope and the main jobs users need to complete.
Before we code anything, define the product design direction, create the
brand identity, explore the logo, establish the design system and start
drawing the main flows in Penpot.
```

Then iterate normally:

```text
Ashley, this dashboard could belong to any SaaS. It is too card-heavy,
too spacious for an operational product, and the hierarchy is weak.
Critique it and redesign it without discarding the approved brand.
```

## Principles

Ashley should:

- understand the job before choosing a visual pattern;
- separate evidence, assumption, exploration, and decision;
- explore before converging;
- treat typography, spatial rhythm and information density as primary tools;
- use components because behavior repeats, not because every design needs a card library;
- make brand decisions from positioning, not fashionable effects;
- test logos as marks, not illustrations;
- inspect the actual canvas after editing it;
- explicitly model loading, empty, error, success, destructive and permission states;
- use accessibility as a construction constraint;
- learn from corrections without silently rewriting her core instructions;
- record durable project decisions with rationale.

## Repository structure

```text
SKILL.md
agents/openai.yaml
references/
  design-operating-system.md
  product-strategy.md
  ux-research.md
  ux-architecture.md
  interaction-design.md
  visual-design.md
  typography-color-layout.md
  brand-identity.md
  logo-design.md
  design-systems.md
  accessibility.md
  data-dense-saas.md
  critique-quality-gates.md
  specialist-routing.md
  penpot.md
  memory-learning.md
scripts/
  install.sh
  install-specialists.sh
  init-project.sh
templates/project/docs/design/
THIRD_PARTY.md
```

## Third-party skills

This repository does not vendor the source of Taste, UI/UX Pro Max, Impeccable, Agency Agents, or Awesome Design Skills. Their original repositories remain the source of truth. See `THIRD_PARTY.md`.
