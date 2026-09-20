# Component Library Materialization

This protocol is for turning an existing implementation/registry into a reusable design library.

It is intentionally more deterministic than normal creative work.

## 1. Establish authority

Before drawing:
- identify the implemented component source;
- identify token/theme source;
- identify registry/config files;
- identify whether design is mirroring code or proposing changes.

Default for an existing library:
- code/registry = behavior + variants authority;
- approved project tokens = visual authority;
- design canvas = visual representation and design-ahead proposals.

## 2. Build a manifest

Do not begin by drawing.

Create an inventory table containing at least:
- component;
- source;
- family;
- variants;
- sizes;
- states;
- subcomponents;
- token dependencies;
- status.

Suggested statuses:
- pending;
- materializing;
- structure-verified;
- visual-QA-passed;
- blocked;
- intentional-drift.

Store the manifest in design memory or a task-local artifact as appropriate.

## 3. Foundations first

Before components, materialize:
- color variables;
- typography variables/styles;
- spacing;
- radii;
- borders;
- elevation;
- icon approach;
- density/control heights.

Use variables rather than hardcoded repeated values where the canvas supports them.

## 4. Use a real design library

For pen.dev/Pencil, prefer:
`design/ui.lib.pen`

Keep a separate specimen/catalog document if useful:
`design/ui-catalog.pen`

The library contains reusable origins. The catalog demonstrates variants, states and compositions.

Do not turn a screenshot/catalog into the design system itself.

## 5. Batch by dependency

A useful order:

1. foundations;
2. primitive controls;
3. selection controls;
4. feedback/status;
5. overlays;
6. navigation;
7. data display;
8. forms/composites;
9. complex patterns.

Build parent/compound components from already verified primitives.

## 6. Batch size

Default maximum:
- 1 complex component; or
- 2–4 simple related components.

Reduce batch size after any tool error or visual failure.

Never process "all components" in one tool call or one unverified generation pass.

## 7. Per-component contract

Before writing, Ashley must know:
- exact component name;
- source contract;
- required variants;
- required sizes;
- required states;
- content/slot needs;
- token mappings.

After writing:
- inspect object structure;
- verify reusability;
- verify instances/slots where needed;
- render/screenshot;
- visual QA;
- update manifest status.

## 8. Stop conditions

Stop the batch and repair before continuing if:
- tool/schema operation fails;
- origin is not actually reusable;
- instances do not inherit;
- tokens are hardcoded unexpectedly;
- screenshot is visually wrong;
- states/variants are missing;
- the canvas has drifted from the code contract.

Do not bury errors under more generated components.

## 9. Final completion

A materialized library is not complete until:
- manifest is fully resolved;
- reusable origins exist;
- required variants/states are represented;
- tokens are mapped;
- compound components use verified primitives;
- representative screenshots pass visual QA;
- design↔code mapping is documented.
