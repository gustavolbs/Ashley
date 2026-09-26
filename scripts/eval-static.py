#!/usr/bin/env python3
from pathlib import Path
import json,sys

ROOT=Path(__file__).resolve().parents[1]
PERSONAS=["laila","roberto","clara","ana","ashley","dave","guto"]
errors=[]

routing=(ROOT/"docs/MODEL_ROUTING.md").read_text()
for phrase in [
    "Luna runs, Sol decides",
    "Luna is the resident model",
    "Sol is advisory and read-only by default",
    "Never use Sol as the persistent Laila orchestrator",
    "0 by default",
]:
    if phrase not in routing:
        errors.append(f"model routing missing: {phrase}")

mutation=(ROOT/"docs/MUTATION_AUTHORITY.md").read_text()
for phrase in [
    "Laila, Roberto, Clara and Ana never program",
    "Dave is the sole application-programming authority",
    "Guto may write operational code",
]:
    if phrase not in mutation:
        errors.append(f"mutation authority missing: {phrase}")

context=(ROOT/"docs/PROJECT_CONTEXT.md").read_text()
for phrase in ["FRESH","STALE","NEEDS_CONTEXT","Do not rediscover unaffected areas","Optional Graphify accelerator"]:
    if phrase not in context:
        errors.append(f"project context missing: {phrase}")

for p in PERSONAS:
    skill=(ROOT/f"skills/{p}/SKILL.md").read_text()
    for ref in [
        "references/_shared/model-routing.md",
        "references/_shared/mutation-authority.md",
        "references/_shared/execution-modes.md",
        "references/_shared/anti-slop.md",
        "references/_shared/project-context.md",
    ]:
        if ref not in skill:
            errors.append(f"{p}: missing packaged contract reference {ref}")
    if "scripts/project-context.py show" not in skill:
        errors.append(f"{p}: missing context boot")
    if "## Hard mutation boundary" not in skill:
        errors.append(f"{p}: missing hard mutation boundary")
    if any(x in skill for x in [
        "docs/MODEL_ROUTING.md","docs/MUTATION_AUTHORITY.md",
        "docs/EXECUTION_MODES.md","docs/ANTI_SLOP.md","docs/PROJECT_CONTEXT.md"
    ]):
        errors.append(f"{p}: runtime skill depends on repository-root docs")

if "Laila never programs" not in (ROOT/"skills/laila/SKILL.md").read_text():
    errors.append("laila: programming prohibition missing")
if "sole application-programming authority" not in (ROOT/"skills/dave/SKILL.md").read_text():
    errors.append("dave: application write authority missing")
if "never writes production application code" not in (ROOT/"skills/ashley/SKILL.md").read_text():
    errors.append("ashley: production-code prohibition missing")

manifest=json.loads((ROOT/"PERSONAS.json").read_text())
if manifest["suite"]!=(ROOT/"VERSION").read_text().strip():
    errors.append("suite version mismatch")

if errors:
    print("\n".join(f"FAIL: {e}" for e in errors),file=sys.stderr)
    sys.exit(1)
print("Static persona behavior contracts passed.")
