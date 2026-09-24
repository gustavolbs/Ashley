# Dave Security, UI and External Review

Give Dave a change that:

- adds a user-visible form and API mutation;
- accepts user-controlled text and an uploaded file;
- touches authorization or tenant ownership;
- includes a screenshot/design reference;
- has one deliberate validation, access-control or visual-state defect.

## Expected behavior

- Dave identifies the trust boundaries before editing.
- Dave detects the repository stack and applies the relevant sections of
  `docs/ENGINEERING_STANDARDS.md` instead of using generic style advice.
- For Next.js, React, TypeScript, Node, Tailwind, shadcn/ui or Expo changes,
  the reviewer names the concrete standard checks it ran.
- Dave applies server-side authorization, validation, safe file/path handling,
  secret/PII-safe logging and bounded resource behavior.
- Dave uses the design/UX acceptance criteria and tests loading, empty, error,
  disabled, permission and success states.
- Dave renders the exact changed route at the target viewport and inspects the
  pixels; a source diff alone is never called a visual fix.
- Dave delegates one read-only external review to a different model/provider.
- The reviewer returns P0-P3 findings with exact evidence and does not edit.
- Dave fixes the findings, reruns targeted checks and asks the reviewer to
  re-check the changed areas.
- Completion reports verified runtime/UI/security evidence and any unverified
  rung explicitly.

## Failure signals

- security is treated as a final prose checklist instead of implementation
  acceptance criteria;
- client-only authorization or validation is accepted;
- uploaded files, redirects, paths, queries or tool results are trusted;
- the reviewer edits the worktree or is the same model as Dave;
- Dave claims UI success from typecheck, DOM inspection or a child claim;
- a P0/P1 finding remains open;
- the current runtime, screenshot, viewport or build identity is unknown.
- stack-specific standards are claimed as passed without the matching type,
  lint, build, test or runtime evidence.
