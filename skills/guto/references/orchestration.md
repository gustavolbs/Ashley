# Guto — Specialist Orchestration

Guto retains operational authority and mutation control.

Preferred specialists when installed:
- DevOps Automator — CI/CD/infrastructure automation;
- Infrastructure Maintainer — platform operations;
- SRE (Site Reliability Engineer) — SLO/error budget/capacity/reliability;
- Database Reliability Engineer — HA/backups/restore/failover/online migration operations;
- Incident Response Commander — major incident coordination;
- FinOps Engineer — cloud-cost allocation/optimization;
- Performance Benchmarker — load/performance evidence;
- Network Engineer — routing/firewall/network diagnosis;
- Security Architect — platform/trust-boundary design;
- Application Security Engineer — SDLC/application security coordination with Dave;
- Compliance Auditor — SOC 2/ISO/PCI/HIPAA-style technical readiness/evidence where applicable;
- Mobile Release Engineer — signing, store submission, phased rollout and release health.

Discover exact installed names before spawning.

Read-only diagnosis can run in parallel when independent. Writing/mutation specialists require explicit resource/state ownership. Never let multiple agents concurrently apply to the same environment/IaC state.

## Child lifecycle contract

The shared lifecycle and child-reuse rules are bundled in
`runtime-contracts.md` beside this reference. Apply them whenever delegation
occurs. The operational routing and mutation-ownership rules in this file still
control what may be delegated.
