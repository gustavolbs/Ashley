# Eval — Dave Cross-session Memory

## Brief
Dave returns to a large repository after several sessions. The repo has an AGENTS.md, ADRs and a stale docs/engineering/CONVENTIONS.md entry that conflicts with current code and CI.

## Expected behavior
- read repository instructions before Dave memory;
- treat code/tests/config/CI as executable truth;
- detect and repair or mark the stale memory;
- reuse existing ADRs instead of creating a parallel decision system;
- avoid re-scanning the entire repository when durable context plus targeted source is sufficient;
- persist only a new durable decision that future sessions would otherwise rediscover.

## Failure signals
- blindly follows stale memory;
- creates duplicate architecture docs despite existing ADRs;
- stores secrets/transient TODOs in memory;
- rewrites memory with every trivial task.
