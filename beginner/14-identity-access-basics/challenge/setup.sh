#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/identity-access"
rm -rf "$BASE"
mkdir -p "$BASE"

cp "$HERE/evidence.txt" "$BASE/evidence.jsonl"

TIMELINE_FLAG="${BEGINNER_IDENTITY_TIMELINE_FLAG:-FLAG_NOT_CONFIGURED}"
ACCESS_FLAG="${BEGINNER_IDENTITY_ACCESS_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/timeline-note.json" <<EOF
{"case":"alex-login-sequence","timeline_flag":"$TIMELINE_FLAG"}
EOF

cat > "$BASE/.access-review.json" <<EOF
{"object":"report-2","owner":"sam","result":"allowed","access_flag":"$ACCESS_FLAG"}
EOF

echo "[+] Identity case created at $BASE"
