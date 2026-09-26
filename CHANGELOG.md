# Changelog

All notable changes to AI Personas are documented here.

## [3.6.0] — 2026-09-26

### Added
- self-contained generated `references/runtime-contracts.md` bundles for every
  persona, synchronized from the canonical execution/model/lifecycle/anti-slop
  contracts;
- explicit delegation lifecycle contract with terminal-result discipline,
  capacity handling and `followup_task` context reuse;
- executable Codex behavior-eval harness using `codex exec --json`,
  `--output-schema`, JSONL traces and token/tool-call metrics;
- canonical `SPECIALISTS.json` roster and `THIRD_PARTY.lock.json` pins.

### Changed
- Sol/Luna routing now has an operational parent-model state machine: Luna
  parents can reuse a Sol planner; Sol parents delegate bounded execution to
  Luna; FAST work can remain Luna-direct;
- all persona descriptions and agent metadata are more discriminative so
  single-domain tasks route directly instead of unnecessarily passing through
  Laila;
- all seven SKILL files use stronger progressive disclosure and smaller
  always-on instruction footprints;
- optional Agency Agents, Taste, UI/UX Pro Max, Impeccable, AIslop and
  SkillSpector integration paths are reproducibly pinned where applicable;
- root architecture/usage/readme/model-routing documentation now describes the
  full seven-persona suite instead of the historical Ashley-centric shape;
- root project initialization is explicit: design, engineering, delivery or
  all.

### Fixed
- standalone persona installs no longer depend on repository-root runtime docs;
- installed-persona verification now fingerprints the full skill tree rather
  than only SKILL.md/version;
- specialist installer, doctor and documentation roster drift is eliminated by
  the shared manifest;
- stale Luna-first routing diagram and RouteMux guidance were replaced;
- tracked .DS_Store files were removed and ignored;
- CI now uses least-privilege contents permission, concurrency cancellation,
  timeout and a pinned checkout action.

## [3.5.0] — 2026-09-26

### Changed
- model routing now treats GPT-6 Sol as the control plane for investigation,
  orchestration, architecture and consequential decisions;
- GPT-6 Luna is the default execution plane for bounded implementation,
  production work, calculations, variants, routine diagnostics and review
  fixes;
- all seven personas now apply the same Sol/Luna boundary with domain-specific
  decision and execution lanes;
- FAST low-risk work may bypass Sol and execute directly on Luna;
- Sol-to-Luna handoffs use compact execution packets so Sol does not continuously
  consume implementation logs/context.

### Added
- explicit Luna-to-Sol re-escalation criteria for new decisions, contradictory
  evidence, repeated acceptance failure and high-consequence gates;
- cross-persona and provider-local regression coverage for the new routing
  contract.

## [3.4.0] — 2026-09-26

### Added
- explicit `FAST`, `STANDARD` and `HIGH_RISK` execution modes;
- fast-path budgets and escalation rules to prevent unnecessary delegation,
  research, full-matrix checks and reviewer waits;
- regression eval for low-risk task latency and over-orchestration.

### Changed
- external review is now conditional on shared/public behavior or risk, not
  mandatory for every small change;
- visual QA is targeted to visual/layout/interaction changes;
- all personas classify execution speed before building a child graph.

## [3.3.1] — 2026-09-25

### Fixed
- Dave 1.1.1 documents the version-scoped NativeWind style-callback regression,
  the className boundary for native-only bypasses, and the Jest interop blind spot.
- Adds a mobile regression eval requiring rendered-style assertions and native
  visual evidence instead of cache assumptions or helper-only tests.

## [3.3.0] — 2026-09-25

### Added
- universal anti-slop quality contract for code, UI, prose, strategy, finance,
  operations and delivery;
- AIslop deterministic code-quality integration for TypeScript, JavaScript,
  Expo/React Native and other supported stacks;
- optional SkillSpector supply-chain scanning before external skill/MCP installs;
- optional Reticle runtime-verification guidance for web/desktop projects;
- selective ibelick UI Skills routing for Ashley;
- project helpers for explicit external-skill and changed-code scans.

### Deliberately not included
- silent global tool/MCP installation;
- a blocking anti-slop score without a project baseline;
- replacing native formatter, linter, tests, security review or visual QA.

## [3.2.0] — 2026-09-24

### Added
- selective ECC-inspired workflows for Dave and Laila: proportional TDD,
  verification, browser E2E, AI workflow evals, research/source discipline,
  agent-failure recovery and strategic context compaction;
- an explicit ECC integration note and regression eval.

### Deliberately not included
- the full ECC plugin/catalog, global hooks, MCP configuration, credentials,
  fixed model recommendations or a universal 80% coverage gate.

## [3.1.4] — 2026-09-23

### Fixed
- the canonical global persona location is `~/.agents/skills/<persona>`;
- the installer removes only stale persona shadows from `~/.codex/skills`;
- verification now fails when a deprecated shadow exists instead of accepting both
  copies as one installation.

## [3.1.3] — 2026-09-23

### Hardened
- the installer now mirrors every persona to the canonical Codex path `~/.codex/skills/<persona>` after the skills CLI runs;
- post-install verification checks every existing Codex/Agents skill copy and fails on stale shadow copies instead of silently succeeding.


## [3.1.2] — 2026-09-23

### Hardened
- moved delegated-child lifecycle enforcement into every persona's always-loaded `SKILL.md`, not only on-demand references;
- installation now runs repository validation before copying skills;
- installation now verifies the exact installed `SKILL.md` copies and lifecycle marker after install, failing loudly on stale/mismatched copies;
- structural CI now rejects any persona kernel that loses the lifecycle contract.


## [3.1.1] — 2026-09-23

### Fixed
- made subagent lifecycle explicit across every persona that delegates work;
- a successful `spawn_agent` or “message sent” acknowledgement no longer counts as completed delegation;
- coordinators retain child ids, wait for required children, collect terminal results and distinguish completed/failed/cancelled work before synthesis;
- an empty active-agent list is no longer treated as success without a returned result;
- duplicate retries are forbidden while the original child state is unknown; 429 recovery collapses concurrency and retries at most once when justified;
- fallbacks must be reported explicitly instead of implying that a persona/specialist participated.

### Added
- regression eval for child lifecycle, 429 recovery and cross-persona synthesis.


## [3.1.0] — 2026-09-23

### Added
- evidence-first anti-hallucination protocol across all seven personas;
- explicit evidence states: PROPOSED, CHANGED, BUILT, RUN, VERIFIED and UNVERIFIED;
- Expo/React Native runtime-verification rules preventing source diffs from being reported as visual fixes;
- regression eval for the "CSS changed but Expo app did not" failure mode;
- Clara existing financial-flow audit mode with financial invariants and VERIFIED vs UNVERIFIED transitions;
- suite + per-persona semantic versioning via `VERSION`, `PERSONAS.json` and `skills/<persona>/VERSION`;
- Dave system-architecture mode with Software Architect routing, C4/ADR/protocol/data/failure semantics;
- expanded domain coverage and team-routing evals.

### Changed
- Ashley and Dave use smaller progressive-disclosure kernels with domain depth in references;
- Laila is the primary cross-functional control plane and cannot accept worker claims as proof;
- CI validates skill/reference integrity, persona versions and evidence-protocol participation.

### Release note
This version is currently on the feature branch/PR. Create tag `v3.1.0` only after the relevant PRs are merged.

## [3.0.0] — 2026-09-23

### Added
- seven-persona operating team: Laila, Roberto, Clara, Ana, Ashley, Dave and Guto;
- persona-first orchestration and domain-specific durable memory;
- cross-functional product, finance, marketing, engineering, design and platform workflows.
