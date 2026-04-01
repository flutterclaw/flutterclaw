#!/usr/bin/env python3
"""List message keys where a locale string equals English (heuristic for human review).

Skips very short values and common brand/technical tokens. Always exits 0.

Usage:
  python3 scripts/report_l10n_untranslated.py
  python3 scripts/report_l10n_untranslated.py --locale es
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
L10N = ROOT / "lib" / "l10n"

SKIP_VALUES = frozenset(
    {
        "FlutterClaw",
        "OK",
        "API",
        "URL",
        "JSON",
        "iOS",
        "Android",
        "HTTP",
        "SSE",
        "stdio",
        "Telegram",
        "Discord",
        "WhatsApp",
        "Chat",
        "Agent",
        "Cron",
        "Subagent",
        "Emoji",
        "Gateway",
        "Host",
        "Port",
        "Model",
        "Token",
        "LIVE",
    }
)


def msg_pairs(d: dict) -> dict[str, str]:
    out = {}
    for k, v in d.items():
        if k.startswith("@") or not isinstance(v, str):
            continue
        out[k] = v
    return out


def should_skip_key(key: str, en_val: str) -> bool:
    if len(en_val) <= 3:
        return True
    if en_val.strip() in SKIP_VALUES:
        return True
    # Placeholder-only templates often match across locales
    if "{" in en_val and re.fullmatch(r"[\w\s:.,\-–—{}]+", en_val):
        return True
    return False


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument(
        "--locale",
        help="Only report this locale code (e.g. es). Default: all non-EN.",
    )
    args = ap.parse_args()

    en = json.loads((L10N / "app_en.arb").read_text(encoding="utf-8"))
    en_pairs = msg_pairs(en)

    locales = sorted(p.stem.removeprefix("app_") for p in L10N.glob("app_*.arb"))
    locales = [c for c in locales if c != "en"]
    if args.locale:
        if args.locale == "en":
            print("Use a non-EN --locale.")
            return
        locales = [args.locale] if args.locale in locales else []
        if not locales:
            print(f"Unknown locale {args.locale!r}")
            return

    for code in locales:
        path = L10N / f"app_{code}.arb"
        loc = json.loads(path.read_text(encoding="utf-8"))
        lp = msg_pairs(loc)
        hits = []
        for k, v_en in en_pairs.items():
            if should_skip_key(k, v_en):
                continue
            v_loc = lp.get(k)
            if v_loc is not None and v_loc == v_en:
                hits.append(k)
        hits.sort()
        print(f"\n=== {code} ({len(hits)} keys same as English) ===")
        for k in hits:
            sample = en_pairs[k].replace("\n", " ")[:72]
            print(f"  {k}: {sample!r}")


if __name__ == "__main__":
    main()
