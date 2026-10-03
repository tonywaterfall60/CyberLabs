#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-ssrf"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/architecture.txt" "$BASE/architecture.txt"
cp "$HERE/requests.txt" "$BASE/requests.txt"
BOUNDARY_FLAG="${ADV_SSRF_BOUNDARY_FLAG:-FLAG_NOT_CONFIGURED}"
CONTROLS_FLAG="${ADV_SSRF_CONTROLS_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/boundary-note.txt" <<EOF
client_blocked=true
frontend_reaches_internal=true
boundary_flag=$BOUNDARY_FLAG
EOF
cat > "$BASE/.controls-review" <<EOF
controls=destination_allowlist,egress_filtering,internal_auth,request_logging
controls_flag=$CONTROLS_FLAG
EOF
echo "[+] Advanced SSRF review workspace created at $BASE"
