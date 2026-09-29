#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/advanced-readiness"
rm -rf "$BASE"
mkdir -p "$BASE"

FLAG="${INTERMEDIATE_CAPSTONE_READY_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/readiness-card.txt" <<EOF
track=intermediate
next_track=advanced
readiness_flag=$FLAG
EOF

echo "[+] Advanced-readiness workspace created at $BASE"
