# Third-party design intelligence

Ashley does not vendor these projects. They remain optional independently installed skills/resources.

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
