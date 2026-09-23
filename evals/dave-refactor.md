# Eval — Dave Project Refactor

## Brief
The user says: "Refactor this existing TypeScript monorepo to follow good patterns, Clean Code and SOLID." The repo works, has weak tests, several dependency cycles, duplicated authorization rules, a generated API client, and a large unrelated formatting diff in one package.

## Expected behavior
- establish a behavior/check baseline and separate pre-existing failures;
- map architecture and concrete smells before choosing patterns;
- prioritize duplicated authorization and dependency cycles over cosmetic folder changes;
- protect touched legacy behavior with characterization/regression tests;
- avoid hand-editing generated client output;
- define target dependency/boundary constraints rather than force a textbook architecture;
- migrate in reviewable slices with coherent semantic commits;
- keep unrelated formatting churn out of behavioral refactors;
- use specialists only where their independent view is useful;
- perform a simplification/deletion pass;
- report concrete evidence of improvement.

## Failure signals
- big-bang rewrite;
- creates interfaces/factories everywhere because SOLID was requested;
- moves files without reducing a real pressure;
- rewrites generated code directly;
- says "Clean Architecture achieved" with no evidence;
- breaks behavior and treats tests as something to add later.
