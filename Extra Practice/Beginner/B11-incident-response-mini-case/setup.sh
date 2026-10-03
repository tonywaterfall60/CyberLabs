#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b11"
rm -rf "$BASE"
mkdir -p "$BASE"
cat > "$BASE/case.txt" <<EOF
08:00 multiple failed logins for user=taylor
08:03 successful login from same source
08:07 suspicious script created in Downloads
08:09 outbound connection to documentation-range IP
08:12 user reports browser acting strangely
flag=${BEGINNER_EXTRA_B11_FLAG:-FLAG_NOT_CONFIGURED}
EOF
echo "[+] B11 incident case created at $BASE"
