#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b10"
rm -rf "$BASE"
mkdir -p "$BASE"
cat > "$BASE/events.log" <<EOF
10:00 INFO host=WS-10 event=login user=alex result=success
10:02 ALERT host=WS-10 event=powershell parent=WINWORD.EXE
10:03 INFO host=WS-10 event=dns query=sync.training.invalid
10:04 ALERT host=WS-10 event=network dst=198.51.100.25 port=443
10:05 NOTE host=WS-10 flag=${BEGINNER_EXTRA_B10_FLAG:-FLAG_NOT_CONFIGURED}
EOF
echo "[+] B10 monitoring evidence created at $BASE"
