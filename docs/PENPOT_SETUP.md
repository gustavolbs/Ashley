# Penpot + Codex Setup

Ashley is designed for the **remote Penpot MCP** because it keeps the local setup simple.

Official Penpot MCP documentation:
https://help.penpot.app/mcp/

Official Codex MCP documentation:
https://developers.openai.com/docs/extend/mcp

## 1. Penpot Cloud

Use:
https://design.penpot.app

You do not need to run Penpot or its MCP server locally for the normal Ashley workflow.

## 2. Enable Penpot MCP

In Penpot:

1. Open **Your account → Integrations → MCP Server**.
2. Enable MCP Server.
3. Generate an MCP key.
4. Store the key securely; Penpot shows it once.
5. Copy the generated server URL. It contains the key as `userToken`.

Treat that URL as a secret. Do not commit it.

## 3. Add the remote server to Codex

### Codex Desktop / local app

Open:

```text
Settings
→ MCP Servers
→ Add server
```

Use:
- name: `penpot`
- transport: **Streamable HTTP**
- URL: the URL copied from Penpot

Save and restart the Codex client.

Codex Desktop/CLI/IDE clients share the normal Codex MCP configuration.

### Generic Penpot helper

Penpot also documents:

```bash
npx -y add-mcp -g -n penpot '<PENPOT_MCP_URL>'
```

### Verify

Inside Codex:

```text
/mcp
```

The Penpot server/tools should be visible.

## 4. Connect the active design file

Open the Penpot file and use:

```text
File → MCP Server → Connect
```

MCP operates on the **currently focused Penpot page**.

Only one Penpot browser tab can be the active MCP tab at a time.

Keep that tab awake; if the browser freezes/unloads it, MCP operations stop until it wakes.

## 5. First smoke test

Start read-only:

```text
Ashley, inspect the currently focused Penpot page. Do not modify it.
Tell me the frames, components/styles you can identify and the main hierarchy.
```

Then use a disposable page:

```text
Ashley, on this disposable page create three labeled desktop frames A, B and C.
Do not establish a brand yet. This is only a Penpot write smoke test.
```

## 6. Normal workflow

Keep:
- Codex open;
- the target Penpot file open;
- the intended page focused.

Then speak naturally:

```text
Ashley, inspect the current Dashboard direction and create two structurally
different alternatives next to it. Preserve the approved brand foundations.
```

Ashley should re-inspect after writes.

## Security

- never commit the Penpot MCP URL/token;
- regenerate the MCP key if it leaks;
- disable MCP in Penpot when you do not want agent access;
- start unfamiliar files with read-only inspection.
