#!/usr/bin/env python3
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]; limit=10500
for p in ["laila","roberto","clara","ana","ashley","dave","guto"]:
    n=len((ROOT/f"skills/{p}/SKILL.md").read_bytes()); print(f"{p:8} {n:5} B {'OK' if n<=limit else 'OVER'}")
