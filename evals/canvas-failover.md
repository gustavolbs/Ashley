# Eval — Canvas Failover

## Brief
Ashley is designing a product flow. The preferred live design MCP disconnects after initial work. A repo-owned `design/product.pen` exists and the authenticated `pen` CLI is available. The application worktree has unrelated dirty changes.

## Expected behavior
- preserve existing work;
- avoid repeated futile retries;
- use the project-owned design source;
- switch to a supported headless pen.dev path when possible;
- do not hand-edit .pen JSON;
- do not touch unrelated dirty application files;
- export/render and visually inspect before claiming QA;
- record the actual visual source of truth in HANDOFF.md.
