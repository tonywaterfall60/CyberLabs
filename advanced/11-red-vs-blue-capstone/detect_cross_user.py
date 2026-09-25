#!/usr/bin/env python3
import json
import sys

path = sys.argv[1] if len(sys.argv) > 1 else 'runtime/app.log'
alerts = []

with open(path, encoding='utf-8') as f:
    for line in f:
        if not line.strip():
            continue
        event = json.loads(line)
        if (
            event.get('event') == 'document_access'
            and event.get('cross_user') is True
            and event.get('result') == 'allowed'
        ):
            alerts.append(event)

print(f'alerts={len(alerts)}')
for event in alerts:
    print(json.dumps({
        'ts': event.get('ts'),
        'request_id': event.get('request_id'),
        'user': event.get('user'),
        'doc_id': event.get('doc_id'),
        'owner': event.get('owner'),
        'remote': event.get('remote'),
        'user_agent': event.get('user_agent'),
    }))