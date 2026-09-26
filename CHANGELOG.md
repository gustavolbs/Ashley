# Changelog

All notable changes to AI Personas are documented here.

## [4.0.0] — 2026-09-26

### Breaking orchestration change
- persistent persona sessions now default to Luna: **Luna runs, Sol decides**;
- Sol is an ephemeral read-only decision advisor rather than the resident
  orchestration/control loop;
- STANDARD work no longer automatically earns a Sol planning pass;
- Laila must never be the persistent Sol orchestrator.

### Breaking authority change
- Laila, Roberto, Clara and Ana are explicitly non-coding personas;
- Ashley cannot write production application code;
- Dave is the sole application-programming authority;
- Guto owns infrastructure/IaC/CI/CD/production mutations and cannot change
  application behavior owned by Dave;
- write-capable tools do not expand persona authority.

### Added
- shared Mutation Authority Contract packaged into every persona;
- Sol quota budgets and regression eval;
- cross-persona mutation-boundary eval.

## [3.7.0] — 2026-09-26

See Git history for prior release notes.
