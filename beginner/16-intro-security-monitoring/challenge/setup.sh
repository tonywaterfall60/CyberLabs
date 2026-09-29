#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/security-monitoring"
rm -rf "$BASE"
mkdir -p "$BASE"

cp "$HERE/evidence.txt" "$BASE/events.jsonl"

TIMELINE_FLAG="${BEGINNER_MONITORING_TIMELINE_FLAG:-FLAG_NOT_CONFIGURED}"
DETECTION_FLAG="${BEGINNER_MONITORING_DETECTION_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/timeline-note.json" <<EOF
{"host":"WS-10","user":"sam","timeline_flag":"$TIMELINE_FLAG"}
EOF

cat > "$BASE/detection-note.json" <<EOF
{"sequence":"auth->process->network","detection_flag":"$DETECTION_FLAG"}
EOF

echo "[+] Monitoring case created at $BASE"
