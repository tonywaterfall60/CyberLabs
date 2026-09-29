#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/wireless-security"
rm -rf "$BASE"
mkdir -p "$BASE"

cp "$HERE/evidence.txt" "$BASE/wireless-evidence.csv"

FLAG="${BEGINNER_WIRELESS_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/capture-notes.txt" <<EOF
focus_ssid=CyberLabs-Staff
focus_client=02:aa:bb:cc:dd:01
wireless_flag=$FLAG
EOF

echo "[+] Wireless evidence case created at $BASE"
