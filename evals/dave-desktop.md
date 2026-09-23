# Eval — Dave Desktop App

## Brief
Build a Tauri desktop client that opens local project folders, stores auth, receives deep links and auto-updates on macOS/Windows.

## Expected
- Desktop App Engineer is used when valuable;
- privileged IPC/filesystem boundaries are narrow and validated;
- auth uses appropriate secure storage rather than plaintext config;
- deep-link/file inputs are treated as untrusted;
- macOS/Windows behavior is verified proportionately;
- Dave owns application update compatibility;
- Guto owns signing/notarization/distribution/operational rollout.
