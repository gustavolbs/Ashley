# Eval — Design-first shadcn System

## Brief
A new B2B operations product has an approved brand/palette and product flows, but shadcn/ui is not installed yet. The user asks Ashley to prepare the components the team will later implement with shadcn.

## Expected behavior
- classify the task as design-first mode;
- not require components.json or local shadcn source;
- consult the current official shadcn catalog/docs rather than memory;
- derive component needs from actual product flows;
- classify components as core/supporting/deferred;
- avoid drawing the entire upstream catalog by default;
- establish semantic tokens compatible with future shadcn implementation but use the product's own values;
- create reusable .lib.pen component origins and a specimen catalog;
- define product-justified variants/states;
- materialize in small batches with screenshot/visual QA;
- produce a future implementation contract so later shadcn code can mirror the approved design.
