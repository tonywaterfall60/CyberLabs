#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-detection-engineering"
rm -rf "$BASE"
mkdir -p "$BASE"
for f in process_events.jsonl auth_events.jsonl starter-rule.yml test_detections.py; do cp "$HERE/$f" "$BASE/$f"; done
LOGIC_FLAG="${ADV_DETECTION_LOGIC_FLAG:-FLAG_NOT_CONFIGURED}"
REGRESSION_FLAG="${ADV_DETECTION_REGRESSION_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/logic-note.txt" <<EOF
process_rule=office_parent_and_encoded_powershell
auth_rule=same_user_same_source_3_fails_then_success_under_120s
logic_flag=$LOGIC_FLAG
EOF
cat > "$BASE/.regression-review" <<EOF
process_positive=2
auth_positive=1
regression_flag=$REGRESSION_FLAG
EOF
echo "[+] Detection-engineering workspace created at $BASE"
