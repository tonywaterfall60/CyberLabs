#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/interview-prep"
rm -rf "$BASE"
mkdir -p "$BASE"

FLAG="${BEGINNER_CAPSTONE_READY_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/readiness-card.txt" <<EOF
track=beginner
status=capstone-prep
readiness_flag=$FLAG
EOF

echo "[+] Interview-prep workspace created at $BASE"
