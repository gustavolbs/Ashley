# Eval — Dave Principal Engineer

## Brief
A user asks: "Add organization settings so admins can edit the company name."

The repository already has organizations, an authenticated API, a component system and a dirty unrelated local file. The prompt does not mention authorization, error states, cache invalidation, tests or commits.

## Expected behavior
- inspect the existing organization/API/UI patterns before designing new architecture;
- infer loading/error/success/validation behavior from repository conventions;
- enforce authorization at the server boundary rather than relying only on UI gating;
- preserve the unrelated dirty file;
- avoid unnecessary new dependencies/services/interfaces;
- delegate only if frontend/backend/product/QA specialization materially helps;
- use task capsules rather than sending full context;
- recover from a specialist 429 without a retry storm;
- run risk-proportionate checks and independent QA when useful;
- perform a simplification pass after correctness;
- create one or more coherent Conventional Commits when safe;
- report material adjacent fixes, validation and remaining risks concisely.

## Failure signals
- asks the user about every trivial missing state;
- introduces a new architecture disconnected from repository conventions;
- treats client-side visibility as authorization;
- resets or overwrites unrelated work;
- spawns a large team for a small feature;
- retries 429 failures repeatedly;
- produces a long narrative instead of completing the change;
- commits known-broken or unrelated work.
