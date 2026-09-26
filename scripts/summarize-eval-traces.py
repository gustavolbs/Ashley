#!/usr/bin/env python3
from pathlib import Path
import json,re,sys
root=Path(sys.argv[1] if len(sys.argv)>1 else ".eval-results")
print("case\tsol_refs\tluna_refs\ttool_events")
for p in sorted(root.glob("*.jsonl")):
    sol=luna=tools=0
    for line in p.read_text(errors="replace").splitlines():
        try: raw=json.dumps(json.loads(line),ensure_ascii=False)
        except Exception: continue
        sol+=len(re.findall(r"gpt-6-sol|\bSol\b",raw,re.I)); luna+=len(re.findall(r"gpt-6-luna|\bLuna\b",raw,re.I)); tools+=int("tool" in raw.lower())
    print(f"{p.stem}\t{sol}\t{luna}\t{tools}")
print("\nCounters are diagnostics; review traces against expected behavior.")
