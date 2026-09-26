#!/usr/bin/env python3
from pathlib import Path
import json, sys
ROOT=Path(__file__).resolve().parents[1]
PERSONAS=["laila","roberto","clara","ana","ashley","dave","guto"]
errors=[]
routing=(ROOT/"docs/MODEL_ROUTING.md").read_text()
for phrase in ["Sol as the control plane","Luna as the execution plane","Parent is Sol","Parent is Luna","same Sol planner","Planner reuse invariant"]:
    if phrase not in routing: errors.append(f"model routing missing: {phrase}")
for p in PERSONAS:
    skill=(ROOT/f"skills/{p}/SKILL.md").read_text()
    for ref in ["references/_shared/model-routing.md","references/_shared/execution-modes.md","references/_shared/anti-slop.md"]:
        if ref not in skill: errors.append(f"{p}: missing packaged contract reference {ref}")
    if any(x in skill for x in ["docs/MODEL_ROUTING.md","docs/EXECUTION_MODES.md","docs/ANTI_SLOP.md"]):
        errors.append(f"{p}: runtime skill still depends on repository-root docs")
manifest=json.loads((ROOT/"PERSONAS.json").read_text())
if manifest["suite"] != (ROOT/"VERSION").read_text().strip(): errors.append("suite version mismatch")
if errors:
    print("\n".join(f"FAIL: {e}" for e in errors),file=sys.stderr); sys.exit(1)
print("Static persona behavior contracts passed.")
