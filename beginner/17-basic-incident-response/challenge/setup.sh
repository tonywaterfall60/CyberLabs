#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/incident-response"
rm -rf "$BASE"
mkdir -p "$BASE"

cp "$HERE/evidence.txt" "$BASE/timeline.txt"

TRIAGE_FLAG="${BEGINNER_IR_TRIAGE_FLAG:-FLAG_NOT_CONFIGURED}"
RESPONSE_FLAG="${BEGINNER_IR_RESPONSE_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/triage-note.txt" <<EOF
user=morgan
host=WS-44
triage_flag=$TRIAGE_FLAG
EOF

cat > "$BASE/.response-handoff" <<EOF
next_phase=contain-preserve-recover
response_flag=$RESPONSE_FLAG
EOF

echo "[+] Incident-response case created at $BASE"
