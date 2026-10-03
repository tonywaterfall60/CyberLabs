#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b09"
rm -rf "$BASE"
mkdir -p "$BASE"
cat > "$BASE/auth.log" <<EOF
10:00:01 FAIL user=alex src=10.0.0.50
10:00:04 FAIL user=alex src=10.0.0.50
10:00:08 SUCCESS user=alex src=10.0.0.50 session=S-100
10:05:00 SUCCESS user=jamie src=10.0.0.22 session=S-200
10:06:11 LOGOUT user=jamie session=S-200
10:07:30 NOTE session=S-100 flag=${BEGINNER_EXTRA_B09_FLAG:-FLAG_NOT_CONFIGURED}
EOF
echo "[+] B09 identity evidence created at $BASE"
