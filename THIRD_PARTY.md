# Third-party intelligence

AI Personas does not vendor these projects. They remain optional independently installed skills/resources. Persona instructions may absorb durable principles while keeping upstream tools independently updateable.

## Agency Agents
https://github.com/msitarzewski/agency-agents

Used as inspiration for professional competency decomposition, especially:
- UI Designer
- UX Architect
- UX Researcher
- Brand Guardian
- UI Finish-Gate Reviewer

Ashley absorbs the role boundaries and useful workflows but does not inherit every opinionated default.

## UI/UX Pro Max
https://github.com/nextlevelbuilder/ui-ux-pro-max-skill

Role inside Ashley:
**searchable design intelligence** — styles, product patterns, palettes, typography, UX guidelines, charts, stacks.

Install through its own CLI so its datasets/scripts remain intact and updateable.

## Taste
https://github.com/tasteskill/tasteskill

Role inside Ashley:
**creative pressure / anti-generic frontend taste**.

The safe general skill is preferred. The stricter GPT/Codex variant is useful only when deliberate visual divergence is appropriate.

Its highly opinionated rules are never universal Ashley rules.

## Impeccable
https://github.com/pbakaus/impeccable

Role inside Ashley:
**design red-team, critique, audit and finish gate**, especially after implementation.

Impeccable remains an independently updateable skill.

## Standards and foundational sources

Ashley uses established design principles as constraints/reasoning tools, not as a catalog to mechanically apply:
- WCAG / WAI accessibility guidance
- Nielsen Norman Group usability heuristics
- Apple Human Interface Guidelines
- mature design-system practices and platform conventions

When a current standard/version materially matters, research the latest source rather than relying on a frozen note in this repository.


## pen.dev / Pencil
https://pen.dev
https://docs.pencil.dev/

Role inside Ashley:
**preferred editable design canvas and repo-local design artifact format**.

Ashley prefers project-owned `.pen` files when the workflow benefits from versioned design artifacts. The desktop/IDE MCP is used for live canvas work; the CLI provides headless editing, screenshots/exports and resilience when a GUI host is unavailable.

Ashley does not edit `.pen` JSON manually; it uses pen.dev tooling.


## Dave engineering intelligence

### Agency Agents
https://github.com/msitarzewski/agency-agents

Dave uses Agency Agents as an optional specialist roster. Preferred roles include:
- Frontend Developer
- Backend Architect
- Product Manager
- Reality Checker
- Evidence Collector
- API Tester

The upstream Codex integration installs custom agents under `~/.codex/agents/`. Dave delegates only bounded tasks and retains final integration authority.

The bounded Dave roster installer also supports:
- AI Engineer;
- Frontend Developer;
- Application Security Engineer;
- API Tester;
- Accessibility Auditor;
- Reality Checker;
- Code Reviewer;
- Test Automation Engineer.

Install that optional roster with:

```bash
bash scripts/install-dave-specialists.sh
```

These children are not permanent authorities. Dave remains the engineering
owner, delegates only when the task-specific specialist adds independent value,
and falls back to himself when a child is unavailable or more expensive than
the expected quality gain.

### Ponytail
https://github.com/StarQuant/ponytail-skill

Role inside Dave:
**anti-overengineering discipline** — YAGNI, reuse existing code, prefer standard/native capabilities, avoid unnecessary dependencies and delete needless code after implementation.

Dave internalizes the principle rather than depending on Ponytail being installed. An installed Ponytail skill may be used as an additional simplification review.

### Caveman
https://github.com/JuliusBrussee/caveman

Role inside Dave:
**optional token-efficiency layer** — the skill compresses Dave's prose; the proxy can additionally shrink noisy tool/context traffic.

Dave does not depend on Caveman. Native context budgeting, targeted reads, read deduplication, compact task capsules and bounded tool output remain mandatory. If Caveman is installed, Dave uses it as an additive optimization without compressing exact code/contracts/errors or changing provider/RouteMux wiring.


## Core operating team specialists

The non-design personas also use Agency Agents selectively rather than copying its full roster.

- **Guto**: DevOps Automator, Infrastructure Maintainer, SRE, Database Reliability Engineer, Incident Response Commander, FinOps Engineer, Network Engineer, Compliance Auditor, Mobile Release Engineer and security specialists.
- **Roberto**: Operations Manager, Chief of Staff, Sales/RevOps specialists, Customer Success Manager, Recruitment/People specialists, Change Management Consultant, Legal Compliance Checker and Data Privacy Officer.
- **Clara**: Chief Financial Officer, Bookkeeper & Controller, Tax Strategist, Finance Tracker, Investment Researcher, Pricing Analyst and finance-operations specialists.
- **Ana**: Growth Hacker, SEO/AEO specialists, Content Creator, paid-media and tracking specialists, PR & Communications Manager, Analytics Reporter and Experiment Tracker.
- **Laila**: Product Manager, UX Researcher, Feedback Synthesizer, Senior Project Manager, Project Shepherd, Sprint Prioritizer and Jira Workflow Steward when lower-level product/delivery support is useful.

The persona remains the authority for its domain; Agency Agents are bounded workers/reviewers.

### Curated team roster

The optional team installer adds a small, domain-matched roster instead of the
entire Agency Agents catalog:

```bash
bash scripts/install-team-specialists.sh
```

The mapping is:

- **Laila:** Product Manager, Feedback Synthesizer, Project Shepherd, Senior Project Manager;
- **Ashley:** UX Researcher, UI Finish-Gate Reviewer, Brand Guardian;
- **Guto:** DevOps Automator, SRE, Database Reliability Engineer, Incident Response Commander, Security Architect;
- **Roberto:** Business Strategist, Operations Manager, Customer Success Manager, Data Privacy Officer, Legal Compliance Checker;
- **Clara:** Financial Analyst, Tax Strategist, Investment Researcher, Bookkeeper & Controller, Pricing Analyst;
- **Ana:** Growth Hacker, SEO Specialist, Content Creator, Social Media Strategist,
  Paid Media Auditor, Ad Creative Strategist, Paid Social Strategist, PPC
  Strategist, Tracking & Measurement Specialist, PR & Communications Manager,
  Analytics Reporter and Experiment Tracker.

Installers are intentionally separate so a user can keep the lightweight core
or add only the specialist roster needed by their work. Specialists remain
bounded workers: they return evidence and recommendations to their persona
owner, never replace the persona's authority, and never create a peer-persona
mesh.
