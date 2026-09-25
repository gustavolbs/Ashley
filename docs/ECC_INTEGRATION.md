# Selective ECC Integration

AI Personas uses selected workflow ideas from
[Everything Claude Code (ECC)](https://github.com/affaan-m/ECC), an MIT-licensed
open-source project. The repository does not vendor ECC and does not install
its full plugin, agents, hooks, MCP servers or global configuration.

## What was incorporated

- Dave: proportional TDD, verification loops, stable browser E2E, eval-driven
  development for AI workflows, agent-failure introspection, documentation and
  research discipline, and strategic context compaction.
- Laila: compact work-package planning, research/source hygiene, evidence-aware
  evals, bounded handoffs, and lifecycle recovery.
- Existing AI Personas contracts remain authoritative for security, visual QA,
  external review, provider-local routing, specialist ownership and evidence.

## What was intentionally not copied

- ECC's full agent/skill catalog;
- its Codex project/global config and MCP server set;
- global hooks, git hooks, notifications or credentials;
- hard-coded ECC model recommendations;
- a universal 80% coverage requirement;
- a second agent runtime or peer-persona mesh.

The choice is deliberate: the current suite already has Laila, Dave, Agency
Agents specialists, provider-aware RouteMux/subscription routing and a
verification contract. The integration adds reusable gates without creating a
second source of truth or increasing normal user operations.

The adjacent optional quality tools are documented in
[`ANTI_SLOP.md`](ANTI_SLOP.md). They are separate from ECC: AIslop handles
deterministic code smells, SkillSpector handles third-party skill supply chain,
Reticle handles project-local runtime evidence, and UI Skills provides narrow
design lenses.

## Operating rule

The user still gives the outcome in natural language. Laila/Dave select the
smallest applicable workflow automatically. The user does not need to install
ECC, copy model slugs, enable MCPs or issue workflow commands for ordinary
work. Missing optional tools reduce evidence or use the documented fallback;
they do not justify a false completion claim.
