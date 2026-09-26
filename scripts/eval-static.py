#!/usr/bin/env python3
from pathlib import Path
import json,sys
ROOT=Path(__file__).resolve().parents[1]
PERSONAS=["laila","roberto","clara","ana","ashley","dave","guto"]
errors=[]
routing=(ROOT/"docs/MODEL_ROUTING.md").read_text()
for phrase in ["Luna runs, Sol decides","Luna is the resident model","Sol is advisory and read-only by default","Never use Sol as the persistent Laila orchestrator","STANDARD","0 by default"]:
    if phrase not in routing: errors.append(f"model routing missing: {phrase}")
mutation=(ROOT/"docs/MUTATION_AUTHORITY.md").read_text()
for phrase in ["Laila, Roberto, Clara and Ana never program","Dave is the sole application-programming authority","Guto may write operational code"]:
    if phrase not in mutation: errors.append(f"mutation authority missing: {phrase}")
for p in PERSONAS:
    skill=(ROOT/f"skills/{p}/SKILL.md").read_text()
    for ref in ["references/_shared/model-routing.md","references/_shared/mutation-authority.md","references/_shared/execution-modes.md","references/_shared/anti-slop.md","references/_shared/project-context.md"]:
        if ref not in skill: errors.append(f"{p}: missing {ref}")
    if "## Hard mutation boundary" not in skill: errors.append(f"{p}: missing hard mutation boundary")
    if p=="laila" and "Laila never programs" not in skill: errors.append("laila: programming prohibition missing")
    if p=="dave" and "sole application-programming authority" not in skill: errors.append("dave: application write authority missing")
manifest=json.loads((ROOT/"PERSONAS.json").read_text())
if manifest["suite"]!=(ROOT/"VERSION").read_text().strip(): errors.append("suite version mismatch")
if errors:
    print("\n".join(f"FAIL: {e}" for e in errors),file=sys.stderr); sys.exit(1)
print("Static persona behavior contracts passed.")
