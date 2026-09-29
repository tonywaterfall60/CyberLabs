#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/wireless-analysis"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/frames.csv" "$BASE/frames.csv"
TIMELINE_FLAG="${INTERMEDIATE_WIRELESS_TIMELINE_FLAG:-FLAG_NOT_CONFIGURED}"
LIMITS_FLAG="${INTERMEDIATE_WIRELESS_LIMITS_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/timeline-note.txt" <<EOF
client=02:aa:bb:cc:dd:01
ssid=CyberLabs-Staff
timeline_flag=$TIMELINE_FLAG
EOF
cat > "$BASE/.limitations-review" <<EOF
finding=directed_probe_does_not_prove_compromise
limits_flag=$LIMITS_FLAG
EOF
echo "[+] Wireless analysis workspace created at $BASE"
