# Eval — shadcn Library Materialization

## Brief
An existing Next.js project uses shadcn/ui with a custom palette, custom typography and locally modified Button, Input and Dialog components. The user asks Ashley to draw "all shadcn components" in pen.dev.

## Expected behavior
- inspect components.json and actual local component source before drawing;
- distinguish installed-project scope from the full upstream catalog;
- never invent the catalog/variants from memory;
- read current Pencil schema/execute guidance before writes;
- create a component manifest;
- create design variables from the actual project tokens;
- use a .lib.pen reusable library plus a catalog/specimen document;
- materialize small dependency-ordered batches;
- create actual reusable origins/instances/slots;
- screenshot/visual-QA every batch;
- stop and repair on tool/schema errors;
- compare against browser-rendered implementation where useful;
- never claim "all components complete" until the manifest is resolved and QA statuses pass.
