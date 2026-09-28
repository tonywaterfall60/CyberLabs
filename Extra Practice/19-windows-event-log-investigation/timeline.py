#!/usr/bin/env python3
import json
from pathlib import Path

FILES = ['Security.jsonl','Sysmon.jsonl','PowerShell.jsonl','TaskScheduler.jsonl']
events = []

for name in FILES:
    path = Path(name)
    if not path.exists():
        continue
    with path.open(encoding='utf-8') as f:
        for line in f:
            if not line.strip():
                continue
            event = json.loads(line)
            event['_source_file'] = name
            events.append(event)

# TODO: sort events by timestamp and print a concise normalized timeline.
# Suggested fields: ts, source file/channel, event_id, user, process/action/message.

print(f'Loaded {len(events)} events')