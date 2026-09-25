#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-practice/siem-investigation"
rm -rf "$BASE"
mkdir -p "$BASE"

cat > "$BASE/process-events.jsonl" <<'EOF'
{"ts":"2026-09-25T14:00:00Z","host":"WS-01","user":"alice","event":"process_start","parent":"explorer.exe","process":"chrome.exe","cmd":"chrome.exe https://portal.training.local"}
{"ts":"2026-09-25T14:03:11Z","host":"WS-03","user":"carol","event":"process_start","parent":"winword.exe","process":"powershell.exe","cmd":"powershell.exe -EncodedCommand VHJhaW5pbmdPbmx5"}
{"ts":"2026-09-25T14:03:19Z","host":"WS-03","user":"carol","event":"process_start","parent":"powershell.exe","process":"cmd.exe","cmd":"cmd.exe /c echo training > %TEMP%\\training.txt"}
{"ts":"2026-09-25T14:10:00Z","host":"WS-02","user":"bob","event":"process_start","parent":"explorer.exe","process":"powershell.exe","cmd":"powershell.exe Get-Service"}
EOF

cat > "$BASE/auth-events.jsonl" <<'EOF'
{"ts":"2026-09-25T14:05:00Z","event":"auth","user":"sam","src":"10.70.0.50","result":"FAIL"}
{"ts":"2026-09-25T14:05:15Z","event":"auth","user":"sam","src":"10.70.0.50","result":"FAIL"}
{"ts":"2026-09-25T14:05:29Z","event":"auth","user":"sam","src":"10.70.0.50","result":"FAIL"}
{"ts":"2026-09-25T14:05:48Z","event":"auth","user":"sam","src":"10.70.0.50","result":"SUCCESS"}
{"ts":"2026-09-25T14:12:00Z","event":"auth","user":"lee","src":"10.70.0.12","result":"SUCCESS"}
EOF

cat > "$BASE/network-events.jsonl" <<'EOF'
{"ts":"2026-09-25T14:03:25Z","host":"WS-03","user":"carol","event":"network_connect","dst":"198.51.100.25","port":443,"process":"powershell.exe"}
{"ts":"2026-09-25T14:06:02Z","host":"APP-01","user":"sam","event":"network_connect","dst":"10.70.0.80","port":8443,"process":"browser-session"}
{"ts":"2026-09-25T14:11:03Z","host":"WS-02","user":"bob","event":"network_connect","dst":"10.70.0.10","port":443,"process":"powershell.exe"}
EOF

cat > "$BASE/detections.py" <<'PY'
#!/usr/bin/env python3
import json
from collections import defaultdict
from datetime import datetime

def load(path):
    with open(path) as f:
        return [json.loads(line) for line in f if line.strip()]

process_events = load('process-events.jsonl')
auth_events = load('auth-events.jsonl')

alerts = []

# TODO 1:
# Detect Office-like parent -> PowerShell with encoded-command behavior.

# TODO 2:
# Group auth failures by (user, src).
# Alert when >=3 failures are followed by SUCCESS within 120 seconds.

print(f'Alerts: {len(alerts)}')
for alert in alerts:
    print(json.dumps(alert, indent=2))
PY
chmod +x "$BASE/detections.py"
echo "[+] SIEM practice dataset created at $BASE"