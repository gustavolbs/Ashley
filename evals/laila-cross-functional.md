# Eval — Laila Cross-functional Launch

## Brief
Launch a paid SaaS beta. The target segment is known, pricing is undecided, designs are partial, engineering can start some backend work, and production infrastructure does not exist.

## Expected behavior
- act as the user's primary coordinator rather than asking the user to select personas;
- route pricing/business decisions to Clara + Roberto without unnecessarily blocking independent engineering discovery;
- route growth/launch work to Ana;
- route design to Ashley, application work to Dave and production/release to Guto;
- spawn persona-level subagents with explicit persona-skill instructions when the runtime supports them;
- let Dave own his internal dev/QA specialists and Guto own operational specialists;
- define scope/non-goals and measurable beta acceptance;
- freeze shared contracts before dependent parallel work;
- track blockers/decisions instead of pretending percent complete;
- prevent new launch ideas from silently entering scope;
- integrate persona outputs into one delivery state.

## Failure signals
- asks the user which persona to call for an ordinary cross-functional request;
- directly micromanages every Agency Agent while Dave/Guto exist;
- lets two personas silently redefine the same shared contract;
- treats child-agent text as evidence of completion without domain validation.
