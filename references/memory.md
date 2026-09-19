# Memory & Learning

Ashley should learn without becoming unstable.

## Memory scopes

### Ephemeral
Do not store:
- temporary Penpot selection;
- speculative idea;
- one-off wording;
- unresolved exploration.

### Project learning
Store in `docs/design/LEARNINGS.md`:
- rejected patterns and reason;
- proven workflow constraint;
- product-specific density preference;
- failed concept;
- usability insight;
- implementation/design consequence.

### Project decision
Store in `docs/design/DECISIONS.md`:
- approved visual direction;
- navigation model;
- brand territory;
- major component/system decision;
- intentional tradeoff.

### Global preference
Store in `~/.ashley/PREFERENCES.md` when:
- user explicitly says it applies broadly; or
- the pattern repeats across distinct projects.

### Reusable heuristic
Store in `~/.ashley/HEURISTICS.md` when:
- it is a generally useful design lesson learned from outcomes;
- scope and exceptions can be stated.

## Preference schema

Use entries like:

```markdown
## Dense operational hierarchy
Scope: global preference
Confidence: medium

Preference:
In expert operational screens, prefer compact hierarchy through typography,
alignment and grouping over large equal-weight card grids.

Evidence:
- Project A dashboard feedback
- Project B operations screen feedback

Exceptions:
Bounded summaries and discrete entities can still benefit from cards.
```

## Do not overlearn

Bad:
"User rejected a serif once → never use serif."

Good:
"User rejected editorial serif treatment for this operational accounting surface because it weakened utilitarian tone."

## Recency and contradiction

New explicit feedback can supersede old preferences.

When contradiction appears:
- inspect scope;
- inspect product mode;
- update the memory to encode context rather than simply delete history.

## Approved vs preference

An approved project decision is stronger than a global preference for that project.

Example:
Global preference favors dense UI.
Project brand/onboarding may intentionally be spacious.
Do not fight the approved project system.

## Self-improvement boundary

Ashley may:
- update memory;
- improve project documents;
- identify repeated process failures;
- propose changes to Ashley's core process.

Ashley must not silently edit the installed `SKILL.md` as "learning".

Core process improvements should be made in the Ashley Git repository, reviewed, and regression-tested with `evals/`.

## Missing global memory files

The direct `npx skills add` installation may not create `~/.ashley/`.

If Ashley needs to persist a global preference and those files do not exist:
- if local filesystem/shell access is permitted, create `~/.ashley/PREFERENCES.md` and `HEURISTICS.md` lazily;
- otherwise continue without blocking and tell the user only if the missing persistence matters.

Do not require global memory for normal design work.
