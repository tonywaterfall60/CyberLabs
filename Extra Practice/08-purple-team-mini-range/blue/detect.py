#!/usr/bin/env python3

import json
from pathlib import Path

LOG = Path(__file__).resolve().parents[1] / "runtime" / "api.jsonl"

if not LOG.exists():
    raise SystemExit(f"Missing log: {LOG}. Generate some range activity first.")

alerts = []

with LOG.open() as f:
    for line in f:
        event = json.loads(line)

        # TODO:
        # Detect allowed cross-user document access.
        #
        # Do not hard-code a username, document ID, or request ID.
        #
        # Suggested questions:
        # - Is this a document_access event?
        # - Was cross_user true?
        # - Was the result allowed?

        pass

print(f"Alerts: {len(alerts)}")
for alert in alerts:
    print(json.dumps(alert, indent=2))
