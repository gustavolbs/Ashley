# Changelog

All notable changes to AI Personas are documented here.

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
