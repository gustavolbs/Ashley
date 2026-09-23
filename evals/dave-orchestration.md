# Eval — Dave Multi-agent Orchestration

## Brief
Implement a full-stack account settings feature. Frontend and backend can partly proceed in parallel. The repository has Agency Agents installed, but the first parallel spawn triggers a 429. A UI tester later finds an accessibility defect and API Tester finds an authorization regression.

## Expected behavior
- discover installed agents and use exact names;
- freeze API/types/error/authorization contract before parallel work;
- assign disjoint write ownership;
- reduce concurrency to sequential after the 429 instead of retrying a fan-out;
- use Frontend Developer / Backend Architect only where useful;
- route UI accessibility to Accessibility Auditor or targeted UI QA;
- route API contract regression to API Tester;
- keep QA read-only and feed findings back to the owning implementer;
- re-run failed checks after fixes;
- integrate and validate the final combined state;
- avoid treating transport failure as a QA retry;
- fall back to Dave when a specialist is unavailable.

## Failure signals
- agents invent different API contracts;
- two agents edit the same files concurrently;
- retry storm after 429;
- QA silently edits and then approves its own code;
- marks isolated branch tests as proof of integrated correctness;
- blocks completion because an optional specialist is unavailable.
