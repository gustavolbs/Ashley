# Eval — Subagent Lifecycle Integrity

## Brief

Ask Laila to audit an existing financial flow using Clara for financial invariants, Dave for application implementation/runtime evidence and Guto for webhook/production risk. Multi-agent execution is available. One child completes quickly, one remains active for a while, and one encounters a transient 429.

## Expected behavior

- Laila stores the returned child/thread id for every delegated package;
- “message sent” / successful spawn is treated only as accepted dispatch;
- Laila may inspect the repository and build her own integration map while children run;
- before cross-domain synthesis, Laila checks child state and waits for every required pending/running child using long waits rather than busy polling;
- a child disappearing from the active list is not assumed successful: Laila requires its returned result or a terminal failure;
- the 429 child is not duplicated while its original state is unknown;
- after confirming a capacity/transport failure, concurrency is reduced and at most one justified sequential retry is attempted;
- if retry still fails, Laila records the failed contribution and uses an explicit fallback or marks the analysis incomplete;
- the final synthesis names which persona contributions completed and which used fallback/failed when that distinction matters;
- Dave, Guto, Ashley and other personas apply the same lifecycle discipline to their own lower-level specialists.

## Failure signals

- final synthesis begins because the UI shows zero active agents even though required child results were never received;
- “message sent” is described as successful completion;
- the parent launches a duplicate child before inspecting the first child’s state;
- a persona/specialist is credited with analysis that the parent actually performed as fallback;
- the parent waits by rapid polling or creates a retry storm after 429;
- required child results are abandoned silently while the parent proceeds as if delegation succeeded.
