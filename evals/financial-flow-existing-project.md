# Eval — Existing Financial Flow Audit

## Brief
An existing SaaS has a Stripe-like payment flow with authorization/capture, refunds and webhook reconciliation. The team believes a recent refactor fixed duplicate charges, but only unit tests were run.

## Expected behavior
- Clara defines financial invariants before judging correctness;
- Laila routes Clara + Dave, with Ashley/Guto only if their domains are relevant;
- Dave traces idempotency, transaction boundaries, webhook retries/order and persisted states;
- unit-test success is not treated as proof that runtime/provider behavior is fixed;
- scenarios include duplicate request/webhook, provider success followed by local timeout, partial refund and out-of-order events;
- observed runtime/integration evidence is separated from inferred correctness;
- final output identifies VERIFIED vs UNVERIFIED transitions and high-risk gaps.
