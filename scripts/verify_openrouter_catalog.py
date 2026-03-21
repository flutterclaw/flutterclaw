#!/usr/bin/env python3
"""Validate OpenRouter model IDs in lib/data/models/model_catalog.dart.

Fetches https://openrouter.ai/api/v1/models (no API key) and checks that every
CatalogModel with providerId 'openrouter' has an id present in the response.

Run from repo root: python3 scripts/verify_openrouter_catalog.py
Exit code 0 if all OK, 1 if any id is missing or the request fails.
"""

from __future__ import annotations

import json
import re
import sys
import urllib.error
import urllib.request

CATALOG_PATH = "lib/data/models/model_catalog.dart"
OPENROUTER_MODELS_URL = "https://openrouter.ai/api/v1/models"


def extract_openrouter_ids(dart_source: str) -> list[str]:
    """Parse CatalogModel blocks that contain providerId: 'openrouter'."""
    ids: list[str] = []
    for block in dart_source.split("CatalogModel(")[1:]:
        if "providerId: 'openrouter'" not in block.split("),")[0]:
            continue
        m = re.search(r"id:\s*'([^']+)'", block)
        if m:
            ids.append(m.group(1))
    return ids


def main() -> int:
    try:
        with open(CATALOG_PATH, encoding="utf-8") as f:
            source = f.read()
    except OSError as e:
        print(f"ERROR: cannot read {CATALOG_PATH}: {e}", file=sys.stderr)
        return 1

    catalog_ids = extract_openrouter_ids(source)
    if not catalog_ids:
        print("ERROR: no OpenRouter catalog models found.", file=sys.stderr)
        return 1

    try:
        with urllib.request.urlopen(OPENROUTER_MODELS_URL, timeout=60) as resp:
            payload = json.load(resp)
    except (urllib.error.URLError, json.JSONDecodeError, TimeoutError) as e:
        print(f"ERROR: failed to fetch OpenRouter models: {e}", file=sys.stderr)
        return 1

    api_ids = {m["id"] for m in payload.get("data", [])}
    missing = [mid for mid in catalog_ids if mid not in api_ids]

    print(f"Checked {len(catalog_ids)} OpenRouter catalog id(s) against {len(api_ids)} API id(s).")
    if missing:
        print("MISSING (not in OpenRouter /api/v1/models):", file=sys.stderr)
        for mid in missing:
            print(f"  - {mid}", file=sys.stderr)
        return 1

    print("All OpenRouter catalog model IDs are present on OpenRouter.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
