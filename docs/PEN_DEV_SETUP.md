# pen.dev / Pencil + Ashley Setup

pen.dev is Ashley's recommended design canvas for the Axis/Codex workflow.

Official documentation:
https://docs.pencil.dev/

## 1. Install pen.dev

Download and install the macOS desktop app from:
https://pen.dev/

Open it and sign in.

## 2. Install the CLI

Requires Node.js 22.19 or later.

```bash
node --version
npm install -g @pen.dev/cli
pen version
```

Authenticate the CLI:

```bash
pen login
pen status
```

The CLI session is stored separately from the desktop session.

## 3. Enable Codex MCP

In pen.dev desktop:

```text
Settings
→ MCP
→ enable Codex CLI
```

Open a `.pen` file before testing.

pen.dev configures the `pencil` MCP entry used by Codex clients on the same computer.

Restart/reload the Axis Codex provider after enabling it.

## 4. Verify in Axis

Start a Codex thread and ask:

```text
$ashley

Diagnose the design canvas only.
Confirm whether the pencil MCP is available.
If available, call its read-only document/app-state tooling.
Do not modify anything.
```

## 5. Create the project design file

Inside the product repo:

```bash
mkdir -p design
```

Create/open for example:

```text
design/product.pen
```

Create it with the desktop/IDE UI or through supported pen.dev tooling. Do not hand-edit JSON.

## 6. Smoke test

```text
$ashley

Use design/product.pen as a disposable smoke test.
Create three materially different product directions A/B/C.
Do not modify application code.
Take a screenshot/export, inspect the rendered pixels, fix at least one
meaningful issue, save the .pen file, and report the Visual QA result.
Do not update my global taste profile from this test.
```

## 7. Headless fallback test

With the file saved:

```bash
pen --in design/product.pen --export /tmp/product-preview.png
```

If that works, Ashley has a render path even when the live desktop MCP is unavailable.

## Updating

```bash
npm install -g @pen.dev/cli
pen version
```

Use the desktop app's normal update mechanism for the app itself.
