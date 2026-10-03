#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-pivoting"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/network-map.txt" "$BASE/network-map.txt"
PATH_FLAG="${ADV_PIVOT_PATH_FLAG:-FLAG_NOT_CONFIGURED}"
DETECT_FLAG="${ADV_PIVOT_DETECTION_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/path-note.txt" <<EOF
dual_homed=JUMP01
pivot_subnet=172.28.28.0/28
path_flag=$PATH_FLAG
EOF
cat > "$BASE/.detection-review" <<EOF
telemetry=ssh_session,proxy_use,egress_connections,destination_access
detection_flag=$DETECT_FLAG
EOF
echo "[+] Advanced pivoting workspace created at $BASE"
