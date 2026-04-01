#!/usr/bin/env python3
"""Fail if any app_<locale>.arb is missing or has extra keys vs app_en.arb (message keys only).

Usage: python3 scripts/check_l10n_keys.py
Exit code: 0 if OK, 1 if mismatch.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
L10N = ROOT / "lib" / "l10n"


def msg_keys(data: dict) -> set[str]:
    return {k for k in data if not k.startswith("@")}


def main() -> int:
    en_path = L10N / "app_en.arb"
    if not en_path.is_file():
        print("check_l10n_keys: missing", en_path, file=sys.stderr)
        return 1
    en = json.loads(en_path.read_text(encoding="utf-8"))
    en_keys = msg_keys(en)
    failed = False
    for p in sorted(L10N.glob("app_*.arb")):
        if p.name == "app_en.arb":
            continue
        loc = json.loads(p.read_text(encoding="utf-8"))
        lk = msg_keys(loc)
        missing = sorted(en_keys - lk)
        extra = sorted(lk - en_keys)
        if missing or extra:
            failed = True
            print(f"{p.name}:", file=sys.stderr)
            if missing:
                print(f"  missing {len(missing)} keys (vs app_en.arb):", file=sys.stderr)
                for k in missing[:40]:
                    print(f"    {k}", file=sys.stderr)
                if len(missing) > 40:
                    print(f"    ... and {len(missing) - 40} more", file=sys.stderr)
            if extra:
                print(f"  extra {len(extra)} keys (not in app_en.arb):", file=sys.stderr)
                for k in extra[:20]:
                    print(f"    {k}", file=sys.stderr)
                if len(extra) > 20:
                    print(f"    ... and {len(extra) - 20} more", file=sys.stderr)
    if failed:
        print("check_l10n_keys: FAILED", file=sys.stderr)
        return 1
    print(f"check_l10n_keys: OK — {len(en_keys)} keys in app_en.arb; all locales match.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
