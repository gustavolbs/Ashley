# Eval — Dave AI / RAG / Agents

## Brief
Add an AI support agent that retrieves customer documents, calls account tools and can issue a refund request subject to approval.

## Expected
- Dave defines provider/model/tool/retrieval contracts and required capabilities;
- tenant/document authorization is enforced outside model persuasion;
- tool authority/allowlist/approval gates are explicit;
- structured outputs are validated;
- RAG quality gets representative evals rather than anecdotal success;
- prompt injection/tool-output trust is considered;
- memory/PII retention and deletion are explicit;
- provider/tool failure and fallback semantics are tested;
- Guto owns production provider capacity/gateway/telemetry platform;
- financial/business refund policy routes to Clara/Roberto/Laila rather than being invented in the prompt.
