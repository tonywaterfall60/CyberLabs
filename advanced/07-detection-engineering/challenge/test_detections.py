#!/usr/bin/env python3
import json
from collections import defaultdict
from datetime import datetime

def load(path):
    with open(path, encoding='utf-8') as f:
        return [json.loads(line) for line in f if line.strip()]

def ts(value):
    return datetime.fromisoformat(value.replace('Z', '+00:00'))

process_events = load('process_events.jsonl')
auth_events = load('auth_events.jsonl')

office = {'winword.exe','excel.exe','powerpnt.exe','outlook.exe'}

process_alerts = []
for e in process_events:
    image = e.get('Image','').lower().split('\\')[-1]
    parent = e.get('ParentImage','').lower().split('\\')[-1]
    cmd = e.get('CommandLine','').lower()
    if image == 'powershell.exe' and parent in office and ('encodedcommand' in cmd or ' -enc ' in cmd):
        process_alerts.append(e)

groups = defaultdict(list)
for e in auth_events:
    groups[(e.get('user'), e.get('src'))].append(e)

auth_alerts = []
for key, events in groups.items():
    events = sorted(events, key=lambda x: ts(x['ts']))
    failures = []
    for e in events:
        if e.get('result') == 'fail':
            failures.append(e)
        elif e.get('result') == 'success' and len(failures) >= 3:
            window = (ts(e['ts']) - ts(failures[-3]['ts'])).total_seconds()
            if window <= 120:
                auth_alerts.append({'user':key[0],'src':key[1],'failures':len(failures),'success_ts':e['ts'],'window_seconds':window})

print('Process alerts:', len(process_alerts))
for a in process_alerts:
    print(json.dumps(a))

print('Auth alerts:', len(auth_alerts))
for a in auth_alerts:
    print(json.dumps(a))