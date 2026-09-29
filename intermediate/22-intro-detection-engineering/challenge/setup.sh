#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/detection-engineering"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/process-events.jsonl" "$BASE/process-events.jsonl"

LOGIC_FLAG="${INTERMEDIATE_DETECTION_LOGIC_FLAG:-FLAG_NOT_CONFIGURED}"
TEST_FLAG="${INTERMEDIATE_DETECTION_TEST_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/detection-note.txt" <<EOF
selection=parent in WINWORD.EXE,EXCEL.EXE AND image powershell.exe AND cmd encoded
logic_flag=$LOGIC_FLAG
EOF

cat > "$BASE/.test-review" <<EOF
positive_ids=2,3
negative_ids=1,4
test_flag=$TEST_FLAG
EOF

echo "[+] Detection engineering workspace created at $BASE"
