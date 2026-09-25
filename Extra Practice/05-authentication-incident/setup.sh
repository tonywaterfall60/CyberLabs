#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/extra-practice/auth-incident"
rm -rf "$BASE"
mkdir -p "$BASE"

cat > "$BASE/auth.log" <<'EOF'
2026-09-25T01:12:02Z FAIL user=sam src=198.51.100.44 device=unknown reason=bad_password
2026-09-25T01:12:08Z FAIL user=sam src=198.51.100.44 device=unknown reason=bad_password
2026-09-25T01:12:15Z FAIL user=alex src=198.51.100.44 device=unknown reason=bad_password
2026-09-25T01:12:21Z FAIL user=sam src=198.51.100.44 device=unknown reason=bad_password
2026-09-25T01:12:29Z FAIL user=sam src=198.51.100.44 device=unknown reason=bad_password
2026-09-25T01:13:10Z SUCCESS user=sam src=198.51.100.44 device=LAPTOP-44 session=S-8842
2026-09-25T01:20:14Z SUCCESS user=lee src=203.0.113.18 device=LAPTOP-LEE session=S-9901
EOF

cat > "$BASE/mfa.jsonl" <<'EOF'
{"ts":"2026-09-25T01:13:12Z","user":"sam","device":"LAPTOP-44","session":"S-8842","factor":"push","result":"approved","provider":"training-idp"}
{"ts":"2026-09-25T01:20:16Z","user":"lee","device":"LAPTOP-LEE","session":"S-9901","factor":"push","result":"approved","provider":"training-idp"}
EOF

cat > "$BASE/vpn.log" <<'EOF'
2026-09-25T01:13:20Z CONNECT user=sam src=198.51.100.44 device=LAPTOP-44 session=S-8842 assigned=10.66.10.44
2026-09-25T01:18:55Z DISCONNECT user=sam src=198.51.100.44 device=LAPTOP-44 session=S-8842 assigned=10.66.10.44
2026-09-25T01:20:25Z CONNECT user=lee src=203.0.113.18 device=LAPTOP-LEE session=S-9901 assigned=10.66.10.18
EOF

cat > "$BASE/application.log" <<'EOF'
2026-09-25T01:13:45Z user=sam session=S-8842 src=10.66.10.44 action=VIEW_PROFILE result=success
2026-09-25T01:14:01Z user=sam session=S-8842 src=10.66.10.44 action=VIEW_PAYROLL result=success
2026-09-25T01:14:30Z user=sam session=S-8842 src=10.66.10.44 action=EXPORT_EMPLOYEE_DIRECTORY result=success
2026-09-25T01:17:42Z user=sam session=S-8842 src=10.66.10.44 action=LOGOUT result=success
2026-09-25T01:20:40Z user=lee session=S-9901 src=10.66.10.18 action=VIEW_PROFILE result=success
EOF

cat > "$BASE/correlate.py" <<'PY'
#!/usr/bin/env python3

from collections import Counter
import json

auth_fail_users = Counter()
auth_fail_sources = Counter()
auth_successes = []

# TODO 1: parse auth.log, count FAIL events, and save SUCCESS events.

mfa_events = []
# TODO 2: parse mfa.jsonl with json.loads().

vpn_sessions = []
# TODO 3: parse vpn.log and save CONNECT events.

important_actions = []
# TODO 4: parse application.log and save significant actions.

print('Failed users:', auth_fail_users)
print('Failed sources:', auth_fail_sources)
print('Successes:', auth_successes)
print('MFA:', mfa_events)
print('VPN:', vpn_sessions)
print('Important app actions:', important_actions)
PY
chmod +x "$BASE/correlate.py"

cat > "$BASE/case-info.txt" <<'EOF'
Case: EP-05 Authentication Incident
Environment: synthetic
Objective: correlate identity, MFA, VPN, and application telemetry
EOF

echo "[+] Authentication incident dataset created:"
echo "    $BASE"