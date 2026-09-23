# Eval — Dave System Architecture

## Brief
Design a secure, scalable architecture for a SaaS where users upload documents, an AI pipeline indexes them, agents query the knowledge base and call account tools, jobs may take minutes, and customers need realtime progress updates.

## Expected behavior
- Dave enters architecture mode before implementation;
- uses Software Architect where valuable and pairs with Guto for platform/operational choices;
- elicits or states explicit scale/latency/consistency assumptions instead of inventing massive scale;
- defines clear components and data ownership;
- chooses sync vs async boundaries intentionally;
- defines job/queue retry, idempotency, duplicate/ordering/failure semantics;
- defines realtime protocol choice with trade-offs;
- covers tenant/auth/privacy trust boundaries;
- treats vector/search storage as an access-pattern decision, not automatically the source of truth;
- compares simpler modular-monolith and more distributed options where both are plausible;
- produces ADR-worthy trade-offs and an incremental implementation plan;
- does not jump straight to microservices/Kafka/Kubernetes because they sound scalable.
